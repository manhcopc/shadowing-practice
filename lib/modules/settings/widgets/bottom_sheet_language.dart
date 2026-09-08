import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/generated/colors.gen.dart';
import '../../../core/language/lang_cubit.dart';
import '../../../data/local/shared_prefs/storage.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/bottom_sheet_header.dart';

class LanguageSelectionBottomSheet extends StatefulWidget {
  const LanguageSelectionBottomSheet({super.key});

  @override
  State<LanguageSelectionBottomSheet> createState() =>
      _LanguageSelectionBottomSheetState();
}

class _LanguageSelectionBottomSheetState
    extends State<LanguageSelectionBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  static const AVAILABLE_LANGUAGES = {
    'en': {'code': 'en', 'name': 'English'},
    'vi': {'code': 'vi', 'name': 'Vietnamese (Tiếng Việt)'},
    'zh': {'code': 'zh', 'name': 'Chinese (中文)'},
    'fr': {'code': 'fr', 'name': 'French (Français)'},
    'de': {'code': 'de', 'name': 'German (Deutsch)'},
    'ja': {'code': 'ja', 'name': 'Japanese (日本語)'},
    'ko': {'code': 'ko', 'name': 'Korean (한국어)'},
    'es': {'code': 'es', 'name': 'Spanish (Español)'},
    'ru': {'code': 'ru', 'name': 'Russian (Русский)'},
    'pt': {'code': 'pt', 'name': 'Portuguese (Português)'},
    'it': {'code': 'it', 'name': 'Italian (Italiano)'},
    'ar': {'code': 'ar', 'name': 'Arabic (العربية)'},
    'hi': {'code': 'hi', 'name': 'Hindi (हिन्दी)'},
    'bn': {'code': 'bn', 'name': 'Bengali (বাংলা)'},
    'th': {'code': 'th', 'name': 'Thai (ไทย)'},
    'id': {'code': 'id', 'name': 'Indonesian (Bahasa Indonesia)'},
    'ms': {'code': 'ms', 'name': 'Malay (Bahasa Melayu)'},
    'nl': {'code': 'nl', 'name': 'Dutch (Nederlands)'},
    'tr': {'code': 'tr', 'name': 'Turkish (Türkçe)'},
    'pl': {'code': 'pl', 'name': 'Polish (Polski)'},
    'sv': {'code': 'sv', 'name': 'Swedish (Svenska)'},
    'uk': {'code': 'uk', 'name': 'Ukrainian (Українська)'},
    'ro': {'code': 'ro', 'name': 'Romanian (Română)'},
    'cs': {'code': 'cs', 'name': 'Czech (Čeština)'},
    'hu': {'code': 'hu', 'name': 'Hungarian (Magyar)'},
    'el': {'code': 'el', 'name': 'Greek (Ελληνικά)'},
    'da': {'code': 'da', 'name': 'Danish (Dansk)'},
    'fi': {'code': 'fi', 'name': 'Finnish (Suomi)'},
    'no': {'code': 'no', 'name': 'Norwegian (Norsk)'},
    'he': {'code': 'he', 'name': 'Hebrew (עברית)'},
    'bg': {'code': 'bg', 'name': 'Bulgarian (Български)'},
  };

  // Map language codes to country codes for flags
  final Map<String, String> _languageToCountryCode = {
    'en': 'US',
    'vi': 'VN',
    'zh': 'CN',
    'fr': 'FR',
    'de': 'DE',
    'ja': 'JP',
    'ko': 'KR',
    'es': 'ES',
    'ru': 'RU',
    'pt': 'PT',
    'it': 'IT',
    'ar': 'SA',
    'hi': 'IN',
    'bn': 'BD',
    'th': 'TH',
    'id': 'ID',
    'ms': 'MY',
    'nl': 'NL',
    'tr': 'TR',
    'pl': 'PL',
    'sv': 'SE',
    'uk': 'UA',
    'ro': 'RO',
    'cs': 'CZ',
    'hu': 'HU',
    'el': 'GR',
    'da': 'DK',
    'fi': 'FI',
    'no': 'NO',
    'he': 'IL',
    'bg': 'BG',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Filter languages based on search query
    final filteredLanguages = AVAILABLE_LANGUAGES.entries.where((entry) {
      if (_searchQuery.isEmpty) return true;
      final name = entry.value['name']!.toLowerCase();
      final query = _searchQuery.toLowerCase();
      return name.contains(query);
    }).toList();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: isDark ? ColorName.backgroundDark : ColorName.backgroundLight,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            BottomSheetHeader.simple(title: 'Select Language'),
            SizedBox(height: 16.h),

            // Search Field
            Container(
              decoration: BoxDecoration(
                color: isDark
                    ? ColorName.textBodyDark.withValues(alpha: 0.1)
                    : ColorName.textBodyLight.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: isDark
                      ? ColorName.textBodyDark.withValues(alpha: 0.2)
                      : ColorName.textBodyLight.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _searchController,
                style: TextStyle(
                  color: isDark
                      ? ColorName.textBodyDark
                      : ColorName.textBodyLight,
                  fontSize: 16.sp,
                ),
                decoration: InputDecoration(
                  hintText: 'Search language...',
                  hintStyle: TextStyle(
                    color: isDark
                        ? ColorName.textBodyDark.withValues(alpha: 0.5)
                        : ColorName.textBodyLight.withValues(alpha: 0.5),
                    fontSize: 16.sp,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: isDark
                        ? ColorName.textBodyDark.withValues(alpha: 0.7)
                        : ColorName.textBodyLight.withValues(alpha: 0.7),
                    size: 22.sp,
                  ),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            Icons.clear_rounded,
                            color: isDark
                                ? ColorName.textBodyDark.withValues(alpha: 0.7)
                                : ColorName.textBodyLight.withValues(
                                    alpha: 0.7,
                                  ),
                            size: 20.sp,
                          ),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            SizedBox(height: 16.h),

            // Language List
            Expanded(
              child: filteredLanguages.isEmpty
                  ? Center(
                      child: AppText(
                        'No languages found',
                        fontSize: 16,
                        textColor: isDark
                            ? ColorName.textBodyDark.withValues(alpha: 0.6)
                            : ColorName.textBodyLight.withValues(alpha: 0.6),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredLanguages.length,
                      itemBuilder: (context, index) {
                        final languageEntry = filteredLanguages[index];
                        final languageCode = languageEntry.key;
                        final languageData = languageEntry.value;
                        final countryCode =
                            _languageToCountryCode[languageCode] ?? 'US';

                        return BlocBuilder<LangCubit, Locale>(
                          builder: (context, currentLocale) {
                            final isSelected =
                                currentLocale.languageCode == languageCode;

                            return Container(
                              margin: EdgeInsets.only(bottom: 8.h),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? (isDark
                                          ? ColorName.textBodyDark.withValues(
                                              alpha: 0.15,
                                            )
                                          : ColorName.textBodyLight.withValues(
                                              alpha: 0.1,
                                            ))
                                    : (isDark
                                          ? ColorName.textBodyDark.withValues(
                                              alpha: 0.05,
                                            )
                                          : ColorName.textBodyLight.withValues(
                                              alpha: 0.03,
                                            )),
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: isSelected
                                      ? (isDark
                                            ? ColorName.textBodyDark.withValues(
                                                alpha: 0.3,
                                              )
                                            : ColorName.textBodyLight
                                                  .withValues(alpha: 0.3))
                                      : (isDark
                                            ? ColorName.textBodyDark.withValues(
                                                alpha: 0.1,
                                              )
                                            : ColorName.textBodyLight
                                                  .withValues(alpha: 0.15)),
                                  width: 1,
                                ),
                              ),
                              child: ListTile(
                                leading: CountryFlag.fromCountryCode(
                                  countryCode,
                                ),
                                title: AppText(
                                  languageData['name']!,
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                  textColor: isDark
                                      ? ColorName.textBodyDark
                                      : ColorName.textBodyLight,
                                  maxLines: 1,
                                  enableAutoResize: true,
                                ),
                                trailing: isSelected
                                    ? Icon(
                                        Icons.check_circle_rounded,
                                        color: const Color(0xFF10B981),
                                        size: 24.w,
                                      )
                                    : null,
                                onTap: () async {
                                  final selectedLocale = Locale(languageCode);

                                  // Set language in storage and cubit
                                  await Storage.setLang(languageCode);
                                  if (context.mounted) {
                                    context.read<LangCubit>().setLocale(
                                      selectedLocale,
                                    );
                                    Navigator.of(context).pop();
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
