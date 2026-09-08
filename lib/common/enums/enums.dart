// // ignore_for_file: constant_identifier_names

// enum ReportType { Products, Feeds, Comments, Other }

// extension ReportTypeExtension on ReportType {
//   String get name {
//     switch (this) {
//       case ReportType.Products:
//         return "products";
//       case ReportType.Feeds:
//         return "feeds";
//       case ReportType.Comments:
//         return "comments";
//       case ReportType.Other:
//         return "other";
//     }
//   }

//   String get displayName {
//     switch (this) {
//       case ReportType.Products:
//         return "Products";
//       case ReportType.Feeds:
//         return "Feeds";
//       case ReportType.Comments:
//         return "Comments";
//       case ReportType.Other:
//         return "Other";
//     }
//   }
// }

// enum ReportCategory { General, Bug, Feature, Complaint }

// extension ReportCategoryExtension on ReportCategory {
//   String get name {
//     switch (this) {
//       case ReportCategory.General:
//         return "general";
//       case ReportCategory.Bug:
//         return "bug";
//       case ReportCategory.Feature:
//         return "feature";
//       case ReportCategory.Complaint:
//         return "complaint";
//     }
//   }

//   String get displayName {
//     switch (this) {
//       case ReportCategory.General:
//         return "general";
//       case ReportCategory.Bug:
//         return "bug";
//       case ReportCategory.Feature:
//         return "feature";
//       case ReportCategory.Complaint:
//         return "complaint";
//     }
//   }

//   // Use this method with S.of(context) for localized display names
//   String getLocalizedDisplayName(dynamic S) {
//     switch (this) {
//       case ReportCategory.General:
//         return S.reportCategoryGeneral;
//       case ReportCategory.Bug:
//         return S.reportCategoryBug;
//       case ReportCategory.Feature:
//         return S.reportCategoryFeature;
//       case ReportCategory.Complaint:
//         return S.reportCategoryComplaint;
//     }
//   }
// }

// enum ReportPriority { Low, Medium, High, Urgent }

// extension ReportPriorityExtension on ReportPriority {
//   String get name {
//     switch (this) {
//       case ReportPriority.Low:
//         return "low";
//       case ReportPriority.Medium:
//         return "medium";
//       case ReportPriority.High:
//         return "high";
//       case ReportPriority.Urgent:
//         return "urgent";
//     }
//   }

//   String get displayName {
//     switch (this) {
//       case ReportPriority.Low:
//         return "low";
//       case ReportPriority.Medium:
//         return "medium";
//       case ReportPriority.High:
//         return "high";
//       case ReportPriority.Urgent:
//         return "urgent";
//     }
//   }

//   // Use this method with S.of(context) for localized display names
//   String getLocalizedDisplayName(dynamic S) {
//     switch (this) {
//       case ReportPriority.Low:
//         return S.reportPriorityLow;
//       case ReportPriority.Medium:
//         return S.reportPriorityMedium;
//       case ReportPriority.High:
//         return S.reportPriorityHigh;
//       case ReportPriority.Urgent:
//         return S.reportPriorityUrgent;
//     }
//   }
// }

// enum ReportReason {
//   InaccurateAnalysis,
//   InappropriateMedicalAdvice,
//   TechnicalBug,
//   InappropriateChatContent,
//   PrivacyDataConcern,
//   SpamAdvertisement,
//   OffensiveLanguage,
//   MisleadingInformation,
//   AppPerformanceIssue,
//   Other,
// }

// extension ReportReasonExtension on ReportReason {
//   String get name {
//     switch (this) {
//       case ReportReason.InaccurateAnalysis:
//         return "inaccurate_analysis";
//       case ReportReason.InappropriateMedicalAdvice:
//         return "inappropriate_medical_advice";
//       case ReportReason.TechnicalBug:
//         return "technical_bug";
//       case ReportReason.InappropriateChatContent:
//         return "inappropriate_chat_content";
//       case ReportReason.PrivacyDataConcern:
//         return "privacy_data_concern";
//       case ReportReason.SpamAdvertisement:
//         return "spam_advertisement";
//       case ReportReason.OffensiveLanguage:
//         return "offensive_language";
//       case ReportReason.MisleadingInformation:
//         return "misleading_information";
//       case ReportReason.AppPerformanceIssue:
//         return "app_performance_issue";
//       case ReportReason.Other:
//         return "other";
//     }
//   }

//   String get displayName {
//     switch (this) {
//       case ReportReason.InaccurateAnalysis:
//         return "inaccurate_analysis";
//       case ReportReason.InappropriateMedicalAdvice:
//         return "inappropriate_medical_advice";
//       case ReportReason.TechnicalBug:
//         return "technical_bug";
//       case ReportReason.InappropriateChatContent:
//         return "inappropriate_chat_content";
//       case ReportReason.PrivacyDataConcern:
//         return "privacy_data_concern";
//       case ReportReason.SpamAdvertisement:
//         return "spam_advertisement";
//       case ReportReason.OffensiveLanguage:
//         return "offensive_language";
//       case ReportReason.MisleadingInformation:
//         return "misleading_information";
//       case ReportReason.AppPerformanceIssue:
//         return "app_performance_issue";
//       case ReportReason.Other:
//         return "other";
//     }
//   }

//   // Use this method with S.of(context) for localized display names
//   String getLocalizedDisplayName(dynamic S) {
//     switch (this) {
//       case ReportReason.InaccurateAnalysis:
//         return S.reportReasonInaccurateAnalysis;
//       case ReportReason.InappropriateMedicalAdvice:
//         return S.reportReasonInappropriateMedicalAdvice;
//       case ReportReason.TechnicalBug:
//         return S.reportReasonTechnicalBug;
//       case ReportReason.InappropriateChatContent:
//         return S.reportReasonInappropriateChatContent;
//       case ReportReason.PrivacyDataConcern:
//         return S.reportReasonPrivacyDataConcern;
//       case ReportReason.SpamAdvertisement:
//         return S.reportReasonSpamAdvertisement;
//       case ReportReason.OffensiveLanguage:
//         return S.reportReasonOffensiveLanguage;
//       case ReportReason.MisleadingInformation:
//         return S.reportReasonMisleadingInformation;
//       case ReportReason.AppPerformanceIssue:
//         return S.reportReasonAppPerformanceIssue;
//       case ReportReason.Other:
//         return S.reportReasonOther;
//     }
//   }
// }
