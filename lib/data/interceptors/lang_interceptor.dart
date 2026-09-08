import 'dart:ui';

import 'package:dio/dio.dart';

import '../../../../../../common/extensions/locale_x.dart';
import '../../../core/language/lang_repository_interface.dart';

//thêm thông tin language vào request
class LangInterceptor extends QueuedInterceptorsWrapper {
  final ILangRepository _repository;

  LangInterceptor(this._repository);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters = update(
      //gọi phương thức update bên dưới
      data: options.queryParameters,
      update: _extras(),
    );
    return super.onRequest(options, handler);
  }

  Map<String, dynamic> _extras() {
    Locale locale = _repository.getLocale(); //lấy ra ngôn ngữ hiện tại
    return {
      'lang': _prepareLangForApi(locale)
    }; //trả về Map dạng {'lang':'localeName'}
  }

  /// Language - sử dụng apiKey từ LocaleX extension
  String _prepareLangForApi(Locale locale) {
    // Sử dụng extension apiKey để lấy mã ngôn ngữ cho API
    return locale.apiKey;
  }

  //gộp thông tin của data và update
  Map<String, dynamic> update({
    required Map<String, dynamic> data,
    required Map<String, dynamic>? update,
  }) {
    if (update == null) return data;
    update.forEach((key, value) {
      data[key] = value;
    });
    return data;
  }
}
