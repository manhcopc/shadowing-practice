import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;

// Helper function để print chỉ trong debug mode
void _debugPrint(String message) {
  debugPrint(message);
}

class BlocFileGenerator {
  // Hàm để lấy đường dẫn đến thư mục lib/module từ vị trí hiện tại
  static String getLibModulePath(String snakeCaseName) {
    // Lấy thư mục hiện tại của project (thư mục gốc)
    final currentDir = Directory.current;
    // Tạo đường dẫn đến thư mục lib/module một cách an toàn
    return path.join(currentDir.path, 'lib', 'module', snakeCaseName);
  }

  static Future<void> createBlocFiles(
    String pageName, {
    bool useBloc = true,
    bool isPage = false,
    bool useFreezed = false,
  }) async {
    final snakeCaseName = pageName.toLowerCase().replaceAll(' ', '_');
    final classCaseName = pageName
        .split(' ')
        .map(
          (word) => word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : '',
        )
        .join('');

    final baseFolderPath = getLibModulePath(snakeCaseName);

    final blocOrCubitFolder = '$baseFolderPath/${useBloc ? 'bloc' : 'cubit'}';
    final screenOrPageFolder = '$baseFolderPath/${isPage ? 'page' : 'screen'}';
    final widgetFolderPath = '$baseFolderPath/widgets';

    // Tạo các thư mục
    await Directory(blocOrCubitFolder).create(recursive: true);
    await Directory(screenOrPageFolder).create(recursive: true);
    await Directory(widgetFolderPath).create(recursive: true);

    // Tạo nội dung cho các file
    final fileExtension = useBloc ? 'bloc' : 'cubit';
    final screenOrPage = isPage ? 'Page' : 'Screen';

    // Tạo nội dung Bloc/Cubit
    String blocContent;
    String? eventContent;
    String stateContent;

    if (useBloc) {
      if (useFreezed) {
        blocContent = _createFreezedBlocContent(snakeCaseName, classCaseName);
        eventContent = _createFreezedEventContent(snakeCaseName, classCaseName);
        stateContent = _createFreezedStateContent(snakeCaseName, classCaseName);
      } else {
        blocContent = _createRegularBlocContent(snakeCaseName, classCaseName);
        eventContent = _createRegularEventContent(snakeCaseName, classCaseName);
        stateContent = _createRegularBlocStateContent(
          snakeCaseName,
          classCaseName,
        );
      }
    } else {
      // Cubit
      if (useFreezed) {
        blocContent = _createFreezedCubitContent(snakeCaseName, classCaseName);
        stateContent = _createFreezedCubitStateContent(
          snakeCaseName,
          classCaseName,
        );
      } else {
        blocContent = _createRegularCubitContent(snakeCaseName, classCaseName);
        stateContent = _createRegularCubitStateContent(
          snakeCaseName,
          classCaseName,
        );
      }
    }

    final screenContent = _createScreenContent(
      snakeCaseName,
      classCaseName,
      screenOrPage,
      fileExtension,
      useBloc,
    );

    final bodyContent = _createBodyContent(
      snakeCaseName,
      classCaseName,
      fileExtension,
      useBloc,
    );

    final customTextContent = _createCustomTextContent();

    // Tạo các file
    await File(
      '$blocOrCubitFolder/${snakeCaseName}_$fileExtension.dart',
    ).writeAsString(blocContent);

    if (useBloc && !useFreezed && eventContent != null) {
      await File(
        '$blocOrCubitFolder/${snakeCaseName}_event.dart',
      ).writeAsString(eventContent);
    }

    await File(
      '$blocOrCubitFolder/${snakeCaseName}_state.dart',
    ).writeAsString(stateContent);

    await File(
      '$screenOrPageFolder/${snakeCaseName.toLowerCase()}_${isPage ? 'page' : 'screen'}.dart',
    ).writeAsString(screenContent);

    await File(
      '$screenOrPageFolder/${snakeCaseName}_body.dart',
    ).writeAsString(bodyContent);

    await File(
      '$widgetFolderPath/custom_text.dart',
    ).writeAsString(customTextContent);

    // Thêm route tương ứng
    await _addRouteToFiles(snakeCaseName, classCaseName, isPage);

    _debugPrint(
      'Created $pageName ${useBloc ? 'Bloc' : 'Cubit'} files ${useFreezed ? 'with freezed' : 'regularly'}',
    );
    _debugPrint('Base folder: $baseFolderPath');
    _debugPrint('Bloc/Cubit folder: $blocOrCubitFolder');
    _debugPrint('$screenOrPage folder: $screenOrPageFolder');
    _debugPrint('Widgets folder: $widgetFolderPath');
  }

  // Hàm thêm route vào các file cần thiết
  static Future<void> _addRouteToFiles(
    String snakeCaseName,
    String classCaseName,
    bool isPage,
  ) async {
    try {
      // Thêm vào route_path.dart
      await _addToRoutePath(snakeCaseName, isPage);

      // Thêm vào app_router.dart
      await _addToAppRouter(snakeCaseName, classCaseName, isPage);

      // Nếu là page, thêm vào main_screen.dart
      if (isPage) {
        await _addToMainScreen(snakeCaseName, classCaseName);
        await _addToConstants(snakeCaseName, classCaseName);
      }

      _debugPrint('✅ Đã thêm route tự động cho $classCaseName');
    } catch (e) {
      _debugPrint('❌ Lỗi khi thêm route: $e');
    }
  }

  // Thêm route vào route_path.dart
  static Future<void> _addToRoutePath(String snakeCaseName, bool isPage) async {
    final currentDir = Directory.current;
    final routePathFile = File(
      path.join(currentDir.path, 'lib', 'core', 'app', 'route_path.dart'),
    );

    if (!await routePathFile.exists()) {
      _debugPrint('❌ Không tìm thấy file route_path.dart');
      return;
    }

    final content = await routePathFile.readAsString();
    final routeName = isPage
        ? '${snakeCaseName}Page'
        : '${snakeCaseName}Screen';
    final routePath = isPage ? snakeCaseName : '/$snakeCaseName';

    // Tìm vị trí cuối cùng để thêm route mới
    final lastBraceIndex = content.lastIndexOf('}');
    if (lastBraceIndex == -1) {
      _debugPrint('❌ Không tìm thấy cấu trúc hợp lệ trong route_path.dart');
      return;
    }

    final newRoute =
        '\n  ///[$routeName] ${isPage ? 'page' : 'screen'} route.\n  static const $routeName = \'$routePath\';\n';
    final newContent =
        content.substring(0, lastBraceIndex) +
        newRoute +
        content.substring(lastBraceIndex);

    await routePathFile.writeAsString(newContent);
    _debugPrint(
      '✅ Đã thêm route vào route_path.dart: $routeName = "$routePath"',
    );
  }

  // Thêm route vào app_router.dart
  static Future<void> _addToAppRouter(
    String snakeCaseName,
    String classCaseName,
    bool isPage,
  ) async {
    final currentDir = Directory.current;
    final appRouterFile = File(
      path.join(currentDir.path, 'lib', 'core', 'app', 'app_router.dart'),
    );

    if (!await appRouterFile.exists()) {
      _debugPrint('❌ Không tìm thấy file app_router.dart');
      return;
    }

    final content = await appRouterFile.readAsString();
    final screenName = '$classCaseName${isPage ? 'Page' : 'Screen'}';
    final importPath =
        '../../module/$snakeCaseName/${isPage ? 'page' : 'screen'}/${snakeCaseName}_${isPage ? 'page' : 'screen'}.dart';

    // Thêm import
    await _addImportToAppRouter(appRouterFile, content, importPath, screenName);

    // Thêm route
    await _addRouteToAppRouter(
      appRouterFile,
      snakeCaseName,
      classCaseName,
      isPage,
    );
  }

  // Thêm import vào app_router.dart
  static Future<void> _addImportToAppRouter(
    File file,
    String content,
    String importPath,
    String screenName,
  ) async {
    final lines = content.split('\n');
    int insertIndex = -1;

    // Tìm vị trí sau import cuối cùng
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].startsWith('import ') && lines[i].contains('../module/')) {
        insertIndex = i + 1;
      }
    }

    if (insertIndex != -1) {
      final newImport = "import '$importPath';";
      lines.insert(insertIndex, newImport);
      await file.writeAsString(lines.join('\n'));
      _debugPrint('✅ Đã thêm import: $newImport');
    }
  }

  // Thêm route vào app_router.dart
  static Future<void> _addRouteToAppRouter(
    File file,
    String snakeCaseName,
    String classCaseName,
    bool isPage,
  ) async {
    final content = await file.readAsString();
    final routeName = '${classCaseName}Route';
    final routeVariable = '${snakeCaseName}Screen';

    if (isPage) {
      // Thêm vào children của MainRoute
      await _addToMainRouteChildren(file, content, routeName, routeVariable);
    } else {
      // Tạo route mới cho screen
      await _addNewScreenRoute(file, content, routeName, routeVariable);
    }
  }

  // Thêm vào children của MainRoute (cho page)
  static Future<void> _addToMainRouteChildren(
    File file,
    String content,
    String routeName,
    String routeVariable,
  ) async {
    final childrenPattern = RegExp(r'children:\s*\[\s*\]');
    final match = childrenPattern.firstMatch(content);

    if (match != null) {
      final newRoute =
          '''
            AutoRoute(
              page: $routeName.page,
              path: Routers.$routeVariable,
            ),''';
      final newContent = content.replaceFirst(
        'children: [',
        'children: [$newRoute',
      );
      await file.writeAsString(newContent);
      _debugPrint('✅ Đã thêm $routeName vào children của MainRoute');
    } else {
      // Nếu đã có children, thêm vào cuối danh sách children
      final childrenEndPattern = RegExp(r'children:\s*\[(.*?)\]', dotAll: true);
      final childrenMatch = childrenEndPattern.firstMatch(content);

      if (childrenMatch != null) {
        final existingChildren = childrenMatch.group(1) ?? '';
        final newRoute =
            '''$existingChildren
            AutoRoute(
              page: $routeName.page,
              path: Routers.$routeVariable,
            ),''';
        final newContent = content.replaceFirst(
          childrenMatch.group(0)!,
          'children: [$newRoute\n          ]',
        );
        await file.writeAsString(newContent);
        _debugPrint('✅ Đã thêm $routeName vào children của MainRoute');
      }
    }
  }

  // Thêm route mới cho screen
  static Future<void> _addNewScreenRoute(
    File file,
    String content,
    String routeName,
    String routeVariable,
  ) async {
    // Tìm vị trí trước '];' cuối cùng của routes
    final routesEndPattern = RegExp(r'(\s*)\];\s*}');
    final match = routesEndPattern.firstMatch(content);

    if (match != null) {
      final newRoute =
          '''

        AutoRoute(
          page: $routeName.page,
          path: Routers.$routeVariable,
        ),''';

      final newContent = content.replaceFirst(
        match.group(0)!,
        '$newRoute${match.group(0)!}',
      );
      await file.writeAsString(newContent);
      _debugPrint('✅ Đã thêm route mới: $routeName');
    }
  }

  // Thêm vào main_screen.dart (cho page)
  static Future<void> _addToMainScreen(
    String snakeCaseName,
    String classCaseName,
  ) async {
    final currentDir = Directory.current;
    final mainScreenFile = File(
      path.join(
        currentDir.path,
        'lib',
        'module',
        'main',
        'screen',
        'main_screen.dart',
      ),
    );

    if (!await mainScreenFile.exists()) {
      _debugPrint('❌ Không tìm thấy file main_screen.dart');
      return;
    }

    final content = await mainScreenFile.readAsString();
    final routeName = '${classCaseName}Route';

    // 1. Thêm vào routes array trong AutoTabsScaffold
    await _addRouteToMainScreen(mainScreenFile, content, routeName);

    // 2. Thêm BottomNavigationBarItem
    await _addBottomNavItemToMainScreen(
      mainScreenFile,
      snakeCaseName,
      classCaseName,
    );
  }

  // Thêm route vào AutoTabsScaffold
  static Future<void> _addRouteToMainScreen(
    File mainScreenFile,
    String content,
    String routeName,
  ) async {
    final routesPattern = RegExp(r'routes:\s*\[\s*\]');
    final match = routesPattern.firstMatch(content);

    if (match != null) {
      final newRoute = '''
              $routeName(),''';
      final newContent = content.replaceFirst(
        'routes: [',
        'routes: [$newRoute',
      );
      await mainScreenFile.writeAsString(newContent);
      _debugPrint('✅ Đã thêm $routeName() vào routes');
    } else {
      // Nếu đã có routes, thêm vào cuối
      final routesEndPattern = RegExp(r'routes:\s*\[(.*?)\]', dotAll: true);
      final routesMatch = routesEndPattern.firstMatch(content);

      if (routesMatch != null) {
        final existingRoutes = routesMatch.group(1) ?? '';
        final newRoute = '''$existingRoutes
              $routeName(),''';
        final newContent = content.replaceFirst(
          routesMatch.group(0)!,
          'routes: [$newRoute\n            ]',
        );
        await mainScreenFile.writeAsString(newContent);
        _debugPrint('✅ Đã thêm $routeName() vào routes');
      }
    }
  }

  // Thêm BottomNavigationBarItem vào main_screen.dart
  static Future<void> _addBottomNavItemToMainScreen(
    File mainScreenFile,
    String snakeCaseName,
    String classCaseName,
  ) async {
    final content = await mainScreenFile.readAsString();
    final constantName = 'title$classCaseName';

    // Đếm số lượng items hiện tại để tính itemIndex
    final itemMatches = RegExp(r'_buildBottomNavItem\(').allMatches(content);
    final itemIndex = itemMatches.length;

    // Tạo icon names (có thể customize sau)
    final iconBaseName = snakeCaseName.toLowerCase();
    final selectedIcon = 'Icons.${iconBaseName}_rounded';
    final unselectedIcon = 'Icons.${iconBaseName}_outlined';

    // Tìm vị trí items: [] để thêm item mới
    final lines = content.split('\n');
    int insertIndex = -1;

    for (int i = 0; i < lines.length; i++) {
      if (lines[i].trim().contains('items: [')) {
        // Kiểm tra xem có phải items: [] trống không
        if (lines[i].trim().contains('items: []')) {
          // Thay thế dòng items: [] bằng items với nội dung
          lines[i] = lines[i].replaceFirst('items: []', 'items: [');
          insertIndex = i + 1;
        } else {
          // Tìm vị trí cuối cùng của items array
          for (int j = i + 1; j < lines.length; j++) {
            if (lines[j].trim().endsWith('],')) {
              insertIndex = j;
              break;
            }
          }
        }
        break;
      }
    }

    if (insertIndex != -1) {
      final newItem =
          '''                        _buildBottomNavItem(
                          activeIndex: tabsRouter.activeIndex,
                          itemIndex: $itemIndex,
                          selectedIcon: _buildIconAsset($selectedIcon,
                              context, tabsRouter.activeIndex),
                          unselectedIcon: _buildIconAsset($unselectedIcon,
                              context, tabsRouter.activeIndex),
                          label: AppConstants.$constantName,
                        ),''';

      // Nếu là items: [] trống, thêm item và đóng bracket
      if (content.contains('items: []')) {
        lines.insert(insertIndex, newItem);
        lines.insert(insertIndex + 1, '                      ],');
      } else {
        // Nếu đã có items, thêm vào trước dấu đóng
        lines.insert(insertIndex, newItem);
      }

      await mainScreenFile.writeAsString(lines.join('\n'));
      _debugPrint(
        '✅ Đã thêm BottomNavigationBarItem cho $classCaseName (index: $itemIndex)',
      );
      _debugPrint(
        '⚠️ Lưu ý: Cần thay đổi icon $selectedIcon và $unselectedIcon cho phù hợp',
      );
    } else {
      _debugPrint('❌ Không tìm thấy vị trí để thêm BottomNavigationBarItem');
    }
  }

  // Thêm constant vào constants.dart (cho page)
  static Future<void> _addToConstants(
    String snakeCaseName,
    String classCaseName,
  ) async {
    final currentDir = Directory.current;
    final constantsFile = File(
      path.join(
        currentDir.path,
        'lib',
        'common',
        'constants',
        'constants.dart',
      ),
    );

    if (!await constantsFile.exists()) {
      _debugPrint('❌ Không tìm thấy file constants.dart');
      return;
    }

    final content = await constantsFile.readAsString();
    final constantName = 'title$classCaseName';
    final constantValue = classCaseName;

    // Kiểm tra xem constant đã tồn tại chưa
    if (content.contains('static const $constantName')) {
      _debugPrint('⚠️ Constant $constantName đã tồn tại');
      return;
    }

    // Tìm vị trí cuối cùng trước dấu } để thêm constant mới
    final lines = content.split('\n');
    int insertIndex = -1;

    for (int i = lines.length - 1; i >= 0; i--) {
      if (lines[i].trim() == '}') {
        insertIndex = i;
        break;
      }
    }

    if (insertIndex != -1) {
      final newConstant = '  static const $constantName = \'$constantValue\';';
      // Thêm một dòng trống nếu dòng trước không phải là constant
      if (insertIndex > 0 &&
          !lines[insertIndex - 1].trim().startsWith('static const')) {
        lines.insert(insertIndex, '');
      }
      lines.insert(insertIndex, newConstant);
      await constantsFile.writeAsString(lines.join('\n'));
      _debugPrint('✅ Đã thêm constant: $constantName = "$constantValue"');
    } else {
      _debugPrint('❌ Không tìm thấy vị trí phù hợp để thêm constant');
    }
  }

  static String _createFreezedBlocContent(
    String snakeCaseName,
    String classCaseName,
  ) {
    return '''
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/mixin/cancelable_base_bloc.dart';

part '${snakeCaseName}_event.dart';
part '${snakeCaseName}_state.dart';
part '${snakeCaseName}_bloc.freezed.dart';

class ${classCaseName}Bloc extends Bloc<${classCaseName}Event, ${classCaseName}State> with CancelableBaseBloc<${classCaseName}State> {
  ${classCaseName}Bloc() : super(_Initial()) {
    on<${classCaseName}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
''';
  }

  static String _createFreezedEventContent(
    String snakeCaseName,
    String classCaseName,
  ) {
    return '''
part of '${snakeCaseName}_bloc.dart';

@freezed
class ${classCaseName}Event with _\$${classCaseName}Event {
  const factory ${classCaseName}Event.started() = _Started;
}
''';
  }

  static String _createFreezedStateContent(
    String snakeCaseName,
    String classCaseName,
  ) {
    return '''
part of '${snakeCaseName}_bloc.dart';

@freezed
class ${classCaseName}State with _\$${classCaseName}State {
  const factory ${classCaseName}State.initial() = _Initial;
}
''';
  }

  static String _createRegularBlocContent(
    String snakeCaseName,
    String classCaseName,
  ) {
    return '''
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../common/mixin/cancelable_base_bloc.dart';

part '${snakeCaseName}_event.dart';
part '${snakeCaseName}_state.dart';

class ${classCaseName}Bloc extends Bloc<${classCaseName}Event, ${classCaseName}State> with CancelableBaseBloc<${classCaseName}State> {
  ${classCaseName}Bloc() : super(${classCaseName}Initial());
}
''';
  }

  static String _createRegularEventContent(
    String snakeCaseName,
    String classCaseName,
  ) {
    return '''
part of '${snakeCaseName}_bloc.dart';

abstract class ${classCaseName}Event extends Equatable {
  const ${classCaseName}Event();
  @override
  List<Object> get props => [];
}
''';
  }

  static String _createRegularBlocStateContent(
    String snakeCaseName,
    String classCaseName,
  ) {
    return '''
part of '${snakeCaseName}_bloc.dart';

@immutable
abstract class ${classCaseName}State extends Equatable {
  const ${classCaseName}State();
  @override
  List<Object> get props => [];
}

class ${classCaseName}Initial extends ${classCaseName}State {}
''';
  }

  static String _createFreezedCubitContent(
    String snakeCaseName,
    String classCaseName,
  ) {
    return '''
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/mixin/cancelable_base_bloc.dart';

part '${snakeCaseName}_state.dart';
part '${snakeCaseName}_cubit.freezed.dart';

class ${classCaseName}Cubit extends Cubit<${classCaseName}State> with CancelableBaseBloc<${classCaseName}State> {
  ${classCaseName}Cubit() : super(${classCaseName}State.initial());
}
''';
  }

  static String _createFreezedCubitStateContent(
    String snakeCaseName,
    String classCaseName,
  ) {
    return '''
part of '${snakeCaseName}_cubit.dart';

@freezed
class ${classCaseName}State with _\$${classCaseName}State {
  const factory ${classCaseName}State.initial() = _Initial;
}
''';
  }

  static String _createRegularCubitContent(
    String snakeCaseName,
    String classCaseName,
  ) {
    return '''
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../common/mixin/cancelable_base_bloc.dart';

part '${snakeCaseName}_state.dart';

class ${classCaseName}Cubit extends Cubit<${classCaseName}State> with CancelableBaseBloc<${classCaseName}State> {
  ${classCaseName}Cubit() : super(${classCaseName}Initial());
}
''';
  }

  static String _createRegularCubitStateContent(
    String snakeCaseName,
    String classCaseName,
  ) {
    return '''
part of '${snakeCaseName}_cubit.dart';

@immutable
abstract class ${classCaseName}State extends Equatable {
  const ${classCaseName}State();
  @override
  List<Object> get props => [];
}

class ${classCaseName}Initial extends ${classCaseName}State {}
''';
  }

  static String _createScreenContent(
    String snakeCaseName,
    String classCaseName,
    String screenOrPage,
    String fileExtension,
    bool useBloc,
  ) {
    return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import '../../../shared/widgets/app_text.dart';
import '../$fileExtension/${snakeCaseName}_$fileExtension.dart';
import '${snakeCaseName}_body.dart';

@RoutePage()
class $classCaseName$screenOrPage extends StatelessWidget {
  const $classCaseName$screenOrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText('$classCaseName $screenOrPage'),
      ),
      body: BlocProvider(
        create: (context) => $classCaseName${useBloc ? 'Bloc' : 'Cubit'}(),
        child: const ${classCaseName}Body(),
      ),
    );
  }
}
''';
  }

  static String _createBodyContent(
    String snakeCaseName,
    String classCaseName,
    String fileExtension,
    bool useBloc,
  ) {
    return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/widgets/app_text.dart';
import '../$fileExtension/${snakeCaseName}_$fileExtension.dart';

class ${classCaseName}Body extends StatelessWidget {
  const ${classCaseName}Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<$classCaseName${useBloc ? 'Bloc' : 'Cubit'}, ${classCaseName}State>(
      listener: (context, state) {
        // TODO: Handle side effects like navigation, snackbars, etc.
      },
      child: BlocBuilder<$classCaseName${useBloc ? 'Bloc' : 'Cubit'}, ${classCaseName}State>(
        builder: (context, state) {
          return Center(
            child: AppText(
              'This is the $classCaseName Body',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }
}
''';
  }

  // CustomText is no longer needed - use AppText instead
  static String _createCustomTextContent() {
    return '''
// CustomText has been replaced by AppText
// Use: import '../../../shared/widgets/app_text.dart';
''';
  }
}

// Hàm để nhập dữ liệu từ console
String? _readLine() {
  return stdin.readLineSync();
}

// Hàm validation cho tên page/screen
String _getValidPageName() {
  while (true) {
    _debugPrint('Nhập tên của page/screen: ');
    final input = _readLine()?.trim() ?? '';

    if (input.isEmpty) {
      _debugPrint('❌ Lỗi: Tên page/screen không được để trống!');
      continue;
    }

    if (input.length < 2) {
      _debugPrint('❌ Lỗi: Tên page/screen phải có ít nhất 2 ký tự!');
      continue;
    }

    // Kiểm tra chỉ chứa chữ cái, số và khoảng trắng
    if (!RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(input)) {
      _debugPrint(
        '❌ Lỗi: Tên page/screen chỉ được chứa chữ cái, số và khoảng trắng!',
      );
      continue;
    }

    return input;
  }
}

// Hàm validation cho lựa chọn 1 hoặc 2
String _getValidChoice(String prompt, String option1, String option2) {
  while (true) {
    _debugPrint(prompt);
    _debugPrint('  1. $option1');
    _debugPrint('  2. $option2');
    _debugPrint('Nhập lựa chọn (1 hoặc 2): ');

    final input = _readLine()?.trim() ?? '';

    if (input.isEmpty) {
      _debugPrint('❌ Lỗi: Bạn phải nhập một lựa chọn!');
      continue;
    }

    if (input == '1' || input == '2') {
      return input;
    }

    _debugPrint('❌ Lỗi: Vui lòng chỉ nhập số 1 hoặc 2!');
  }
}

// Hàm main để chạy script
Future<void> main() async {
  _debugPrint('🚀 Chào mừng bạn đến với Bloc/Cubit Generator!');
  _debugPrint('=' * 50);

  // Lấy tên page/screen với validation
  final pageName = _getValidPageName();

  // Lấy lựa chọn Bloc/Cubit với validation
  final choice = _getValidChoice(
    'Chọn loại state management:',
    'Bloc (phù hợp cho logic phức tạp)',
    'Cubit (phù hợp cho logic đơn giản)',
  );

  // Lấy lựa chọn Freezed với validation
  final freezedChoice = _getValidChoice(
    'Chọn kiểu tạo file:',
    'Regular (sử dụng Equatable)',
    'Freezed (sử dụng Freezed library)',
  );

  // Lấy lựa chọn Page/Screen với validation
  final pageOrScreen = _getValidChoice(
    'Chọn loại widget:',
    'Page (dùng cho routing)',
    'Screen (dùng cho UI thông thường)',
  );

  final useBloc = choice == '1';
  final useFreezed = freezedChoice == '2';
  final isPage = pageOrScreen == '1';

  _debugPrint('\n📋 Thông tin đã chọn:');
  _debugPrint('  • Tên: $pageName');
  _debugPrint('  • Loại: ${useBloc ? 'Bloc' : 'Cubit'}');
  _debugPrint('  • Kiểu: ${useFreezed ? 'Freezed' : 'Regular'}');
  _debugPrint('  • Widget: ${isPage ? 'Page' : 'Screen'}');

  _debugPrint('\n⏳ Đang tạo các file...');

  await BlocFileGenerator.createBlocFiles(
    pageName,
    useBloc: useBloc,
    isPage: isPage,
    useFreezed: useFreezed,
  );

  _debugPrint('\n✅ Hoàn thành! Các file đã được tạo thành công.');
}
