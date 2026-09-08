// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(linkedAccount) =>
      "Switch to the linked account (${linkedAccount})";

  static String m1(message) => "Account deletion failed: ${message}";

  static String m2(message) => "Error: ${message}";

  static String m3(count) => "View ${count} more replies";

  static String m4(count) => "View ${count} replies";

  static String m5(count) => "Comments (${count})";

  static String m6(name) => "Hello, ${name}";

  static String m7(appName) => "Login to ${appName}";

  static String m8(count) => "${count} Days";

  static String m9(count) => "${count} Months";

  static String m10(count) => "${count} Weeks";

  static String m11(count) => "${count} Years";

  static String m12(completed, total) =>
      "${completed} / ${total} positions completed";

  static String m13(feature) => "${feature} coming soon";

  static String m14(error) => "Device binding check failed: ${error}";

  static String m15(error) => "Purchase error: ${error}";

  static String m16(error) => "Failed to load products: ${error}";

  static String m17(message) => "Payment failed: ${message}";

  static String m18(error) => "Server verification failed: ${error}";

  static String m19(error) => "Purchase verification failed: ${error}";

  static String m20(reason) => "Reason selected: ${reason}";

  static String m21(days) => "${days} days";

  static String m22(month, year) => "Month ${month}, ${year}";

  static String m23(completed, total) =>
      "You\'re doing great! Completed ${completed}/${total} routines this week.";

  static String m24(skinType) => "Recommendations for ${skinType} skin";

  static String m25(count) => "${count} steps";

  static String m26(startDate, endDate, month) =>
      "${startDate} - ${endDate} ${month}";

  static String m27(appName) => "Sign up to ${appName}";

  static String m28(message) => "Update profile failed: ${message}";

  static String m29(version) => "Version ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "activeIngredient": MessageLookupByLibrary.simpleMessage(
      "Active Ingredient",
    ),
    "activityAll": MessageLookupByLibrary.simpleMessage("All"),
    "activityCommented": MessageLookupByLibrary.simpleMessage("Commented"),
    "activityComments": MessageLookupByLibrary.simpleMessage("Comments"),
    "activityDisliked": MessageLookupByLibrary.simpleMessage("Disliked"),
    "activityDislikedComment": MessageLookupByLibrary.simpleMessage(
      "Disliked Comment",
    ),
    "activityLiked": MessageLookupByLibrary.simpleMessage("Liked"),
    "activityLikedComment": MessageLookupByLibrary.simpleMessage(
      "Liked Comment",
    ),
    "activityLikes": MessageLookupByLibrary.simpleMessage("Likes"),
    "activityNoInteractions": MessageLookupByLibrary.simpleMessage(
      "No activities yet",
    ),
    "activitySaved": MessageLookupByLibrary.simpleMessage("Saved"),
    "activitySaves": MessageLookupByLibrary.simpleMessage("Saved"),
    "activityShared": MessageLookupByLibrary.simpleMessage("Shared"),
    "activityShares": MessageLookupByLibrary.simpleMessage("Shares"),
    "activityTabActivity": MessageLookupByLibrary.simpleMessage("Activity"),
    "activityTabPosts": MessageLookupByLibrary.simpleMessage("Posts"),
    "activityTypeComment": MessageLookupByLibrary.simpleMessage("Comment"),
    "activityTypeComments": MessageLookupByLibrary.simpleMessage("Comments"),
    "activityTypePost": MessageLookupByLibrary.simpleMessage("Post"),
    "activityTypePosts": MessageLookupByLibrary.simpleMessage("Posts"),
    "addToRoutine": MessageLookupByLibrary.simpleMessage("Add to Routine"),
    "added_to_favorites": MessageLookupByLibrary.simpleMessage(
      "Added to Favorites",
    ),
    "additionalDetailsOptional": MessageLookupByLibrary.simpleMessage(
      "Additional Details",
    ),
    "aiChatMessageIssue": MessageLookupByLibrary.simpleMessage(
      "AI Chat Message Issue",
    ),
    "all_positions": MessageLookupByLibrary.simpleMessage("All Positions"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "alsoCalled": MessageLookupByLibrary.simpleMessage("Also Called"),
    "amUsage": MessageLookupByLibrary.simpleMessage("AM Usage"),
    "analyzeSkin": MessageLookupByLibrary.simpleMessage("Analyze Skin"),
    "analyzeSkinInstruction": MessageLookupByLibrary.simpleMessage(
      "Make sure there is enough light and remove glasses for an accurate scan.",
    ),
    "app_passcode": MessageLookupByLibrary.simpleMessage("App Passcode"),
    "app_title": MessageLookupByLibrary.simpleMessage("69 POSITIONS"),
    "avoidedIngredients": MessageLookupByLibrary.simpleMessage(
      "Avoided Ingredients",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "backToLogin": MessageLookupByLibrary.simpleMessage("Back to Login"),
    "binding_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "binding_contact_support": MessageLookupByLibrary.simpleMessage(
      "Contact support for assistance",
    ),
    "binding_device_linked": MessageLookupByLibrary.simpleMessage(
      "Device Already Linked",
    ),
    "binding_device_linked_description": MessageLookupByLibrary.simpleMessage(
      "This device is already linked to another account. To purchase premium features, please switch to the linked account or contact support.",
    ),
    "binding_purchase_instructions": MessageLookupByLibrary.simpleMessage(
      "To complete your purchase:",
    ),
    "binding_switch_account": m0,
    "binding_understood": MessageLookupByLibrary.simpleMessage("Understood"),
    "brand": MessageLookupByLibrary.simpleMessage("Brand"),
    "briefTitleForReport": MessageLookupByLibrary.simpleMessage(
      "Enter a brief title for your report",
    ),
    "buttonEnableCamera": MessageLookupByLibrary.simpleMessage("Enable Camera"),
    "buttonOk": MessageLookupByLibrary.simpleMessage("OK"),
    "buttonOpenSettings": MessageLookupByLibrary.simpleMessage("Open Settings"),
    "cameraAccessMessage": MessageLookupByLibrary.simpleMessage(
      "To use the camera for skincare product scanning, please enable camera access in your device settings",
    ),
    "cameraAccessNeeded": MessageLookupByLibrary.simpleMessage(
      "Camera Access Needed",
    ),
    "cameraRequestMessage": MessageLookupByLibrary.simpleMessage(
      "To start scanning skincare products, please enable camera access.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "categoryLabel": MessageLookupByLibrary.simpleMessage("Category"),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("Change Language"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change Password"),
    "changePasswordDescription": MessageLookupByLibrary.simpleMessage(
      "To change your password, please enter your current password and new password",
    ),
    "changePasswordSuccess": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully",
    ),
    "change_language": MessageLookupByLibrary.simpleMessage("Change Language"),
    "change_passcode": MessageLookupByLibrary.simpleMessage("Change Passcode"),
    "chatId": MessageLookupByLibrary.simpleMessage("Chat ID"),
    "choosePhotoSource": MessageLookupByLibrary.simpleMessage(
      "Choose Photo Source",
    ),
    "comblezVotrePeau": MessageLookupByLibrary.simpleMessage(
      "Pamper Your Skin",
    ),
    "comedogenicity": MessageLookupByLibrary.simpleMessage("Comedogenicity"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmAccountRegistration": MessageLookupByLibrary.simpleMessage(
      "Confirm account registration",
    ),
    "confirmNewPassword": MessageLookupByLibrary.simpleMessage(
      "Confirm New Password",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "contactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
    "contact_us": MessageLookupByLibrary.simpleMessage("Contact Us"),
    "continueBtn": MessageLookupByLibrary.simpleMessage("Continue"),
    "continueText": MessageLookupByLibrary.simpleMessage("Continue"),
    "continueWithApple": MessageLookupByLibrary.simpleMessage(
      "Continue with Apple",
    ),
    "continueWithEmail": MessageLookupByLibrary.simpleMessage(
      "Continue with Email",
    ),
    "continueWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Continue with Google",
    ),
    "counter": MessageLookupByLibrary.simpleMessage("Counter"),
    "createNewPassword": MessageLookupByLibrary.simpleMessage(
      "Create New Password",
    ),
    "cropImage": MessageLookupByLibrary.simpleMessage("Crop Image"),
    "currentLanguage": MessageLookupByLibrary.simpleMessage("Current language"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("Current Password"),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete Account"),
    "deleteAccountConfirmMessage": MessageLookupByLibrary.simpleMessage(
      "If you delete your account, you won\'t be able to log in with it anymore. Are you sure you want to continue?",
    ),
    "deleteAccountConfirmTitle": MessageLookupByLibrary.simpleMessage(
      "Are you sure?",
    ),
    "deleteAccountFailed": m1,
    "deleteAccountSuccess": MessageLookupByLibrary.simpleMessage(
      "Account deleted successfully",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "descriptionOptional": MessageLookupByLibrary.simpleMessage("Description"),
    "detailedIngredientList": MessageLookupByLibrary.simpleMessage(
      "Detailed Ingredient List",
    ),
    "detailedIngredients": MessageLookupByLibrary.simpleMessage(
      "Detailed Ingredients",
    ),
    "discoverProducts": MessageLookupByLibrary.simpleMessage(
      "Discover Products",
    ),
    "displayName": MessageLookupByLibrary.simpleMessage("Display Name"),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "editProfile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailPreferences": MessageLookupByLibrary.simpleMessage(
      "Email Preferences",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterDisplayName": MessageLookupByLibrary.simpleMessage(
      "Enter your display name",
    ),
    "enterEmailToResetPassword": MessageLookupByLibrary.simpleMessage(
      "Enter the email associated with your account and we\'ll send an email with instructions to reset your password.",
    ),
    "enterOtp": MessageLookupByLibrary.simpleMessage("Enter OTP"),
    "enterPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Enter your phone number",
    ),
    "enterSixDigitCode": MessageLookupByLibrary.simpleMessage(
      "Please enter the 6-digit code",
    ),
    "enterUsername": MessageLookupByLibrary.simpleMessage(
      "Enter your username",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "errorAccessingCamera": MessageLookupByLibrary.simpleMessage(
      "Unable to access camera",
    ),
    "errorAccessingGallery": MessageLookupByLibrary.simpleMessage(
      "Unable to access gallery",
    ),
    "errorGeneral": MessageLookupByLibrary.simpleMessage("An error occurred"),
    "errorSelectImage": MessageLookupByLibrary.simpleMessage(
      "Failed to select image. Please try again.",
    ),
    "error_internal_server": MessageLookupByLibrary.simpleMessage(
      "Internal Server Error",
    ),
    "error_invalid_email": MessageLookupByLibrary.simpleMessage(
      "Invalid email",
    ),
    "error_invalid_password": MessageLookupByLibrary.simpleMessage(
      "Your password must be at least 8 characters including a lowercase letter, an uppercase letter, and a number",
    ),
    "error_network": MessageLookupByLibrary.simpleMessage("Network error!"),
    "error_unauthorized": MessageLookupByLibrary.simpleMessage("Unauthorized!"),
    "error_unexpected": MessageLookupByLibrary.simpleMessage(
      "Something went wrong!",
    ),
    "error_with_message": m2,
    "exfoliant": MessageLookupByLibrary.simpleMessage("Exfoliant"),
    "exit": MessageLookupByLibrary.simpleMessage("Exit"),
    "explore": MessageLookupByLibrary.simpleMessage("EXPLORE"),
    "explore_positions": MessageLookupByLibrary.simpleMessage(
      "Explore positions",
    ),
    "failedToSubmitReport": MessageLookupByLibrary.simpleMessage(
      "Failed to submit report",
    ),
    "failed_to_load_position": MessageLookupByLibrary.simpleMessage(
      "Failed to load position details.",
    ),
    "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
    "favorited": MessageLookupByLibrary.simpleMessage("Favorited"),
    "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
    "feedAddImages": MessageLookupByLibrary.simpleMessage("Add Images"),
    "feedCommentDelete": MessageLookupByLibrary.simpleMessage("Delete"),
    "feedCommentDeleteConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this comment?",
    ),
    "feedCommentDeleteTitle": MessageLookupByLibrary.simpleMessage(
      "Delete Comment",
    ),
    "feedCommentDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Comment deleted successfully",
    ),
    "feedCommentEdit": MessageLookupByLibrary.simpleMessage("Edit"),
    "feedCommentEditing": MessageLookupByLibrary.simpleMessage(
      "Editing comment",
    ),
    "feedCommentHideReplies": MessageLookupByLibrary.simpleMessage(
      "Hide replies",
    ),
    "feedCommentInputHint": MessageLookupByLibrary.simpleMessage(
      "Write a comment...",
    ),
    "feedCommentLoadMoreReplies": m3,
    "feedCommentOptions": MessageLookupByLibrary.simpleMessage(
      "Comment Options",
    ),
    "feedCommentReply": MessageLookupByLibrary.simpleMessage("Reply"),
    "feedCommentReplyingTo": MessageLookupByLibrary.simpleMessage(
      "Replying to",
    ),
    "feedCommentShowReplies": m4,
    "feedCommentsEmpty": MessageLookupByLibrary.simpleMessage(
      "No comments yet",
    ),
    "feedCommentsTitle": m5,
    "feedCreatePost": MessageLookupByLibrary.simpleMessage("Create Post"),
    "feedCreatingPost": MessageLookupByLibrary.simpleMessage(
      "Creating post...",
    ),
    "feedDeletePostConfirmMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this post?",
    ),
    "feedDeletePostConfirmTitle": MessageLookupByLibrary.simpleMessage(
      "Delete Post",
    ),
    "feedDeletePostOption": MessageLookupByLibrary.simpleMessage("Delete Post"),
    "feedEditPost": MessageLookupByLibrary.simpleMessage("Edit Post"),
    "feedEditPostOption": MessageLookupByLibrary.simpleMessage("Edit Post"),
    "feedNoPosts": MessageLookupByLibrary.simpleMessage("No posts available"),
    "feedPostButton": MessageLookupByLibrary.simpleMessage("Post"),
    "feedPostContentHint": MessageLookupByLibrary.simpleMessage(
      "What\'s on your mind?",
    ),
    "feedPostContentRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter post content",
    ),
    "feedPostCreatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Post created successfully",
    ),
    "feedPostDeletedSuccess": MessageLookupByLibrary.simpleMessage(
      "Post deleted successfully",
    ),
    "feedPostHashtagsHint": MessageLookupByLibrary.simpleMessage(
      "Add hashtags (comma separated)",
    ),
    "feedPostOptions": MessageLookupByLibrary.simpleMessage("Post Options"),
    "feedPostUpdatedSuccess": MessageLookupByLibrary.simpleMessage(
      "Post updated successfully",
    ),
    "feedReportCommentOption": MessageLookupByLibrary.simpleMessage(
      "Report Comment",
    ),
    "feedReportPostOption": MessageLookupByLibrary.simpleMessage("Report Post"),
    "feedUnknownUser": MessageLookupByLibrary.simpleMessage("Unknown"),
    "feedUpdateButton": MessageLookupByLibrary.simpleMessage("Update"),
    "feeling_lucky": MessageLookupByLibrary.simpleMessage("Feeling lucky?"),
    "female": MessageLookupByLibrary.simpleMessage("Female"),
    "filterAll": MessageLookupByLibrary.simpleMessage("All"),
    "filterLabelAmUsage": MessageLookupByLibrary.simpleMessage(
      "Morning Usage (AM)",
    ),
    "filterLabelFrequency": MessageLookupByLibrary.simpleMessage(
      "Recommended Frequency",
    ),
    "filterLabelPhase": MessageLookupByLibrary.simpleMessage("Routine Phase"),
    "filterLabelPmUsage": MessageLookupByLibrary.simpleMessage(
      "Evening Usage (PM)",
    ),
    "filterLabelStepKey": MessageLookupByLibrary.simpleMessage("Step Type"),
    "filterOptionAmUsageAvoid": MessageLookupByLibrary.simpleMessage("Avoid"),
    "filterOptionAmUsageCore": MessageLookupByLibrary.simpleMessage("Core"),
    "filterOptionAmUsageNever": MessageLookupByLibrary.simpleMessage("Never"),
    "filterOptionAmUsageOptional": MessageLookupByLibrary.simpleMessage(
      "Optional",
    ),
    "filterOptionFrequencyDaily": MessageLookupByLibrary.simpleMessage("Daily"),
    "filterOptionFrequencyOccasionally": MessageLookupByLibrary.simpleMessage(
      "Occasionally",
    ),
    "filterOptionFrequencyWeekly": MessageLookupByLibrary.simpleMessage(
      "Weekly (1-3 times/week)",
    ),
    "filterOptionPhaseCleanse": MessageLookupByLibrary.simpleMessage("Cleanse"),
    "filterOptionPhaseExtras": MessageLookupByLibrary.simpleMessage("Extras"),
    "filterOptionPhasePrep": MessageLookupByLibrary.simpleMessage("Prep"),
    "filterOptionPhaseProtect": MessageLookupByLibrary.simpleMessage("Protect"),
    "filterOptionPhaseSeal": MessageLookupByLibrary.simpleMessage("Seal"),
    "filterOptionPhaseTreat": MessageLookupByLibrary.simpleMessage("Treat"),
    "filterOptionPmUsageAvoid": MessageLookupByLibrary.simpleMessage("Avoid"),
    "filterOptionPmUsageCore": MessageLookupByLibrary.simpleMessage("Core"),
    "filterOptionPmUsageNever": MessageLookupByLibrary.simpleMessage("Never"),
    "filterOptionPmUsageOptional": MessageLookupByLibrary.simpleMessage(
      "Optional",
    ),
    "filterOptionStepKeyCleanser": MessageLookupByLibrary.simpleMessage(
      "Cleanser",
    ),
    "filterOptionStepKeyEssence": MessageLookupByLibrary.simpleMessage(
      "Essence",
    ),
    "filterOptionStepKeyExfoliant": MessageLookupByLibrary.simpleMessage(
      "Exfoliant",
    ),
    "filterOptionStepKeyEyeTreatment": MessageLookupByLibrary.simpleMessage(
      "Eye Treatment",
    ),
    "filterOptionStepKeyLipCare": MessageLookupByLibrary.simpleMessage(
      "Lip Care",
    ),
    "filterOptionStepKeyMakeupRemover": MessageLookupByLibrary.simpleMessage(
      "Makeup Remover",
    ),
    "filterOptionStepKeyMaskSheetSleeping":
        MessageLookupByLibrary.simpleMessage("Sheet / Sleeping Mask"),
    "filterOptionStepKeyMaskTreatment": MessageLookupByLibrary.simpleMessage(
      "Mask Treatment",
    ),
    "filterOptionStepKeyMoisturizer": MessageLookupByLibrary.simpleMessage(
      "Moisturizer",
    ),
    "filterOptionStepKeyOcclusiveOrFaceOil":
        MessageLookupByLibrary.simpleMessage("Occlusive / Face Oil"),
    "filterOptionStepKeySelfTan": MessageLookupByLibrary.simpleMessage(
      "Self Tan",
    ),
    "filterOptionStepKeySerum": MessageLookupByLibrary.simpleMessage("Serum"),
    "filterOptionStepKeySunscreen": MessageLookupByLibrary.simpleMessage(
      "Sunscreen",
    ),
    "filterOptionStepKeyToner": MessageLookupByLibrary.simpleMessage("Toner"),
    "filterOptionStepKeyTool": MessageLookupByLibrary.simpleMessage("Tool"),
    "filterOptionStepKeyTreatmentRetinoid":
        MessageLookupByLibrary.simpleMessage("Retinoid Treatment"),
    "filterOptionStepKeyTreatmentSpot": MessageLookupByLibrary.simpleMessage(
      "Spot Treatment",
    ),
    "follow": MessageLookupByLibrary.simpleMessage("Follow"),
    "followers": MessageLookupByLibrary.simpleMessage("Followers"),
    "following": MessageLookupByLibrary.simpleMessage("Following"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "frequency": MessageLookupByLibrary.simpleMessage("Frequency"),
    "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
    "functions": MessageLookupByLibrary.simpleMessage("Functions"),
    "galleryAccessMessage": MessageLookupByLibrary.simpleMessage(
      "To use the gallery for skincare product scanning, please enable gallery access in your device settings",
    ),
    "galleryAccessNeeded": MessageLookupByLibrary.simpleMessage(
      "Gallery Access Needed",
    ),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "goBack": MessageLookupByLibrary.simpleMessage("Go Back"),
    "hello": m6,
    "hide": MessageLookupByLibrary.simpleMessage("Hide"),
    "highlightedIngredients": MessageLookupByLibrary.simpleMessage(
      "Highlighted Ingredients",
    ),
    "holyGrails": MessageLookupByLibrary.simpleMessage("Holy Grails"),
    "imageCapturedSuccess": MessageLookupByLibrary.simpleMessage(
      "Image captured successfully, please wait for the result",
    ),
    "ingredient": MessageLookupByLibrary.simpleMessage("Ingredient"),
    "irritancy": MessageLookupByLibrary.simpleMessage("Irritancy"),
    "keepYourFaceInFrame": MessageLookupByLibrary.simpleMessage(
      "Keep your face in the frame",
    ),
    "keyActives": MessageLookupByLibrary.simpleMessage("Key Actives"),
    "keyIngredients": MessageLookupByLibrary.simpleMessage("Key Ingredients"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "leTeint": MessageLookupByLibrary.simpleMessage("Complexion"),
    "legal": MessageLookupByLibrary.simpleMessage("Legal"),
    "lightMode": MessageLookupByLibrary.simpleMessage("Light Mode"),
    "likedIngredients": MessageLookupByLibrary.simpleMessage(
      "Liked Ingredients",
    ),
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "loadingUserInfo": MessageLookupByLibrary.simpleMessage(
      "Loading user information...",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginSuccess": MessageLookupByLibrary.simpleMessage("Login successful"),
    "loginToApp": m7,
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "male": MessageLookupByLibrary.simpleMessage("Male"),
    "mark_tried": MessageLookupByLibrary.simpleMessage("Mark Tried"),
    "marked_as_tried": MessageLookupByLibrary.simpleMessage("Marked as Tried"),
    "messageContent": MessageLookupByLibrary.simpleMessage("Message content"),
    "messageId": MessageLookupByLibrary.simpleMessage("Message ID"),
    "messageInternetRestored": MessageLookupByLibrary.simpleMessage(
      "Internet connection restored",
    ),
    "messageLoading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "messageNoInternet": MessageLookupByLibrary.simpleMessage(
      "Please check your internet connection and try again later",
    ),
    "messageRateApp": MessageLookupByLibrary.simpleMessage(
      "You like this app? Then take a little bit of your time to leave a rating:",
    ),
    "myProfile": MessageLookupByLibrary.simpleMessage("My Profile"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "noDetailedIngredientInfo": MessageLookupByLibrary.simpleMessage(
      "No detailed ingredient information",
    ),
    "noKeyIngredientInfo": MessageLookupByLibrary.simpleMessage(
      "No key ingredient information",
    ),
    "noPostsYet": MessageLookupByLibrary.simpleMessage("No posts yet"),
    "no_favorites": MessageLookupByLibrary.simpleMessage("No favorites yet"),
    "no_positions_found": MessageLookupByLibrary.simpleMessage(
      "No positions found",
    ),
    "noneSelected": MessageLookupByLibrary.simpleMessage("None selected"),
    "nouveautes": MessageLookupByLibrary.simpleMessage("New Arrivals"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "openYourGallery": MessageLookupByLibrary.simpleMessage(
      "Open Your Gallery",
    ),
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "otpResent": MessageLookupByLibrary.simpleMessage("OTP resent"),
    "otpSentToEmail": MessageLookupByLibrary.simpleMessage(
      "We sent you 6-digit code to your email address",
    ),
    "otpVerifiedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "OTP verified successfully",
    ),
    "overview": MessageLookupByLibrary.simpleMessage("Overview"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordMustBeDifferent": MessageLookupByLibrary.simpleMessage(
      "Your new password must be different from previous used passwords",
    ),
    "passwordResetNote": MessageLookupByLibrary.simpleMessage(
      "Note: It may take a few minutes for the password reset email to reach your inbox. If it doesn\'t appear, please look in your spam folders. Keep in mind that only the most recent password reset link you requested will remain valid.",
    ),
    "passwordResetSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Password reset successfully",
    ),
    "peauGrasse": MessageLookupByLibrary.simpleMessage("Oily Skin"),
    "peauNormale": MessageLookupByLibrary.simpleMessage("Normal Skin"),
    "peauSensible": MessageLookupByLibrary.simpleMessage("Sensitive Skin"),
    "period_day": MessageLookupByLibrary.simpleMessage("Day"),
    "period_days": m8,
    "period_month": MessageLookupByLibrary.simpleMessage("Month"),
    "period_months": m9,
    "period_period": MessageLookupByLibrary.simpleMessage("Period"),
    "period_week": MessageLookupByLibrary.simpleMessage("Week"),
    "period_weeks": m10,
    "period_year": MessageLookupByLibrary.simpleMessage("Year"),
    "period_years": m11,
    "phase": MessageLookupByLibrary.simpleMessage("Phase"),
    "phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "plan_free_trial": MessageLookupByLibrary.simpleMessage("Free trial"),
    "plan_loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "plan_monthly_premium": MessageLookupByLibrary.simpleMessage(
      "Monthly Premium",
    ),
    "plan_per_week": MessageLookupByLibrary.simpleMessage(" per week"),
    "plan_premium_plan": MessageLookupByLibrary.simpleMessage("Premium Plan"),
    "plan_vnd_per_week": MessageLookupByLibrary.simpleMessage(" VND/week"),
    "plan_weekly_premium": MessageLookupByLibrary.simpleMessage(
      "Weekly Premium",
    ),
    "plan_yearly_premium": MessageLookupByLibrary.simpleMessage(
      "Yearly Premium",
    ),
    "pleaseCheckEmail": MessageLookupByLibrary.simpleMessage(
      "Please check your email",
    ),
    "pleaseSelectReason": MessageLookupByLibrary.simpleMessage(
      "Please select a reason",
    ),
    "pmUsage": MessageLookupByLibrary.simpleMessage("PM Usage"),
    "positions_completed": m12,
    "posts": MessageLookupByLibrary.simpleMessage("Posts"),
    "premium_ai_dermatologist": MessageLookupByLibrary.simpleMessage(
      "AI Dermatologist",
    ),
    "premium_best_offer": MessageLookupByLibrary.simpleMessage("Best Offer"),
    "premium_continue": MessageLookupByLibrary.simpleMessage("Continue"),
    "premium_current_account": MessageLookupByLibrary.simpleMessage(
      "Current Account",
    ),
    "premium_feature_coming_soon": m13,
    "premium_features_included": MessageLookupByLibrary.simpleMessage(
      "All premium features included",
    ),
    "premium_flexible_billing": MessageLookupByLibrary.simpleMessage(
      "Flexible billing",
    ),
    "premium_free_trial": MessageLookupByLibrary.simpleMessage(
      "Free Trial Available",
    ),
    "premium_get_pro_access": MessageLookupByLibrary.simpleMessage(
      "Get Pro Access",
    ),
    "premium_instant_analysis": MessageLookupByLibrary.simpleMessage(
      "Get instant skin analysis and personalized recommendations",
    ),
    "premium_loading_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Loading subscription plans...",
    ),
    "premium_popular": MessageLookupByLibrary.simpleMessage("Popular"),
    "premium_privacy": MessageLookupByLibrary.simpleMessage("Privacy"),
    "premium_processing_payment": MessageLookupByLibrary.simpleMessage(
      "Processing payment...",
    ),
    "premium_purchase_success": MessageLookupByLibrary.simpleMessage(
      "Purchase successful!",
    ),
    "premium_restore": MessageLookupByLibrary.simpleMessage("Restore"),
    "premium_save_65_percent": MessageLookupByLibrary.simpleMessage("Save 65%"),
    "premium_scan_anywhere": MessageLookupByLibrary.simpleMessage(
      "Scan anywhere, anytime with unlimited access",
    ),
    "premium_terms": MessageLookupByLibrary.simpleMessage("Terms"),
    "premium_transaction_cancelled": MessageLookupByLibrary.simpleMessage(
      "Transaction cancelled",
    ),
    "premium_trial_description": MessageLookupByLibrary.simpleMessage(
      "Start your premium experience with a free trial period",
    ),
    "premium_try_again": MessageLookupByLibrary.simpleMessage("Try Again"),
    "premium_unable_to_load": MessageLookupByLibrary.simpleMessage(
      "Unable to load subscription plans",
    ),
    "premium_unlimited_scanning": MessageLookupByLibrary.simpleMessage(
      "Unlimited Scanning",
    ),
    "premium_unlock_features": MessageLookupByLibrary.simpleMessage(
      "Unlock all premium features for your skin analysis journey",
    ),
    "premium_verifying_payment": MessageLookupByLibrary.simpleMessage(
      "Verifying payment...",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "privacy_policies": MessageLookupByLibrary.simpleMessage(
      "Privacy Policies",
    ),
    "privateProfile": MessageLookupByLibrary.simpleMessage("Private Profile"),
    "productPreferences": MessageLookupByLibrary.simpleMessage(
      "Product Preferences",
    ),
    "productType": MessageLookupByLibrary.simpleMessage("Product Type"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileIsPrivate": MessageLookupByLibrary.simpleMessage(
      "This profile is private",
    ),
    "profileLoadMore": MessageLookupByLibrary.simpleMessage("Load More"),
    "profileMyPosts": MessageLookupByLibrary.simpleMessage("My Posts"),
    "profileNoPostsYet": MessageLookupByLibrary.simpleMessage("No posts yet"),
    "profileTabContent": MessageLookupByLibrary.simpleMessage("Content"),
    "profileTabInfo": MessageLookupByLibrary.simpleMessage("Info"),
    "profileUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Profile updated successfully!",
    ),
    "provideMoreDetails": MessageLookupByLibrary.simpleMessage(
      "Provide more details about the issue",
    ),
    "publicProfile": MessageLookupByLibrary.simpleMessage("Public Profile"),
    "purchase_binding_check_error": m14,
    "purchase_error": m15,
    "purchase_load_products_error": m16,
    "purchase_no_products": MessageLookupByLibrary.simpleMessage(
      "No products available",
    ),
    "purchase_not_logged_in": MessageLookupByLibrary.simpleMessage(
      "Please log in to make a purchase",
    ),
    "purchase_payment_failed": m17,
    "purchase_product_not_found": MessageLookupByLibrary.simpleMessage(
      "Product not found",
    ),
    "purchase_server_verification_failed": m18,
    "purchase_store_unavailable": MessageLookupByLibrary.simpleMessage(
      "Store is currently unavailable",
    ),
    "purchase_verification_failed": m19,
    "pushNotifications": MessageLookupByLibrary.simpleMessage(
      "Push Notifications",
    ),
    "rateUs": MessageLookupByLibrary.simpleMessage("Rate Us"),
    "rate_app": MessageLookupByLibrary.simpleMessage("Rate App"),
    "reasonSelected": m20,
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "removed_from_favorites": MessageLookupByLibrary.simpleMessage(
      "Removed from Favorites",
    ),
    "removed_from_tried": MessageLookupByLibrary.simpleMessage(
      "Removed from Tried",
    ),
    "reportBugsOrInappropriateContent": MessageLookupByLibrary.simpleMessage(
      "Report bugs or inappropriate content",
    ),
    "reportCategoryBug": MessageLookupByLibrary.simpleMessage("Bug report"),
    "reportCategoryComplaint": MessageLookupByLibrary.simpleMessage(
      "Complaint",
    ),
    "reportCategoryFeature": MessageLookupByLibrary.simpleMessage(
      "Feature request",
    ),
    "reportCategoryGeneral": MessageLookupByLibrary.simpleMessage(
      "General report",
    ),
    "reportCommentsIssue": MessageLookupByLibrary.simpleMessage(
      "Report Comments Issue",
    ),
    "reportDetails": MessageLookupByLibrary.simpleMessage("Report Details"),
    "reportFeedsIssue": MessageLookupByLibrary.simpleMessage(
      "Report Feeds Issue",
    ),
    "reportIssue": MessageLookupByLibrary.simpleMessage("Report Issue"),
    "reportPriorityHigh": MessageLookupByLibrary.simpleMessage("High"),
    "reportPriorityLow": MessageLookupByLibrary.simpleMessage("Low"),
    "reportPriorityMedium": MessageLookupByLibrary.simpleMessage("Medium"),
    "reportPriorityUrgent": MessageLookupByLibrary.simpleMessage("Urgent"),
    "reportProductsIssue": MessageLookupByLibrary.simpleMessage(
      "Report Products Issue",
    ),
    "reportReasonAppPerformanceIssue": MessageLookupByLibrary.simpleMessage(
      "App crashes, slow performance, or functionality issues",
    ),
    "reportReasonInaccurateAnalysis": MessageLookupByLibrary.simpleMessage(
      "The skin analysis result is inaccurate or incorrect",
    ),
    "reportReasonInappropriateChatContent":
        MessageLookupByLibrary.simpleMessage(
          "Inappropriate content in AI chat responses",
        ),
    "reportReasonInappropriateMedicalAdvice":
        MessageLookupByLibrary.simpleMessage(
          "Inappropriate or harmful medical advice was provided",
        ),
    "reportReasonMisleadingInformation": MessageLookupByLibrary.simpleMessage(
      "Misleading or false health information",
    ),
    "reportReasonOffensiveLanguage": MessageLookupByLibrary.simpleMessage(
      "Offensive or inappropriate language",
    ),
    "reportReasonOther": MessageLookupByLibrary.simpleMessage(
      "Other issue not listed above",
    ),
    "reportReasonPrivacyDataConcern": MessageLookupByLibrary.simpleMessage(
      "Privacy or personal data security concern",
    ),
    "reportReasonSpamAdvertisement": MessageLookupByLibrary.simpleMessage(
      "Spam or unwanted advertisement content",
    ),
    "reportReasonTechnicalBug": MessageLookupByLibrary.simpleMessage(
      "There is a technical bug or error in the app",
    ),
    "reportSubmitted": MessageLookupByLibrary.simpleMessage("Report Submitted"),
    "reportThisSet": MessageLookupByLibrary.simpleMessage("Report"),
    "reportTypeComments": MessageLookupByLibrary.simpleMessage("Comments"),
    "reportTypeFeeds": MessageLookupByLibrary.simpleMessage("Feeds"),
    "reportTypeOther": MessageLookupByLibrary.simpleMessage("Other"),
    "reportTypeProducts": MessageLookupByLibrary.simpleMessage("Products"),
    "resendOtp": MessageLookupByLibrary.simpleMessage("Resend OTP"),
    "resendOtpIn": MessageLookupByLibrary.simpleMessage("Resend OTP in"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "routineAddNew": MessageLookupByLibrary.simpleMessage("Add New Routine"),
    "routineCalendar": MessageLookupByLibrary.simpleMessage("Calendar"),
    "routineDaysCount": m21,
    "routineEveningCare": MessageLookupByLibrary.simpleMessage(
      "Evening Hydration Routine",
    ),
    "routineFeatured": MessageLookupByLibrary.simpleMessage("Featured Routine"),
    "routineFriday": MessageLookupByLibrary.simpleMessage("Fri"),
    "routineGlassSkin": MessageLookupByLibrary.simpleMessage(
      "\"Glass Skin\" Routine",
    ),
    "routineGlassSkinDesc": MessageLookupByLibrary.simpleMessage(
      "Achieve luminous, radiant skin.",
    ),
    "routineManagement": MessageLookupByLibrary.simpleMessage(
      "Routine Management",
    ),
    "routineMonday": MessageLookupByLibrary.simpleMessage("Mon"),
    "routineMonth": MessageLookupByLibrary.simpleMessage("Month"),
    "routineMonthYear": m22,
    "routineMorningCare": MessageLookupByLibrary.simpleMessage(
      "Morning Skincare",
    ),
    "routineMyRoutines": MessageLookupByLibrary.simpleMessage("My Routines"),
    "routineOilControl": MessageLookupByLibrary.simpleMessage("Oil Control"),
    "routinePlay": MessageLookupByLibrary.simpleMessage("Start"),
    "routinePoreCleansing": MessageLookupByLibrary.simpleMessage(
      "Pore Cleansing",
    ),
    "routineProgressMessage": m23,
    "routineRecommendationsFor": m24,
    "routineSaturday": MessageLookupByLibrary.simpleMessage("Sat"),
    "routineStepsCount": m25,
    "routineStreakDays": MessageLookupByLibrary.simpleMessage(
      "Completion Streak",
    ),
    "routineSunday": MessageLookupByLibrary.simpleMessage("Sun"),
    "routineThursday": MessageLookupByLibrary.simpleMessage("Thu"),
    "routineTuesday": MessageLookupByLibrary.simpleMessage("Tue"),
    "routineWednesday": MessageLookupByLibrary.simpleMessage("Wed"),
    "routineWeek": MessageLookupByLibrary.simpleMessage("Week"),
    "routineWeekRange": m26,
    "routineYourProgress": MessageLookupByLibrary.simpleMessage(
      "Your Progress",
    ),
    "routinesVisage": MessageLookupByLibrary.simpleMessage("Face Routines"),
    "saveProfile": MessageLookupByLibrary.simpleMessage("SAVE PROFILE"),
    "scanProduct": MessageLookupByLibrary.simpleMessage("Scan Product"),
    "scanProductSubtitle": MessageLookupByLibrary.simpleMessage(
      "Move the camera to scan barcodes or identify products.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchProductPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Search product name, brand...",
    ),
    "security": MessageLookupByLibrary.simpleMessage("Security"),
    "seeAll": MessageLookupByLibrary.simpleMessage("See All"),
    "selectGender": MessageLookupByLibrary.simpleMessage("Select Gender"),
    "selectWhereToTakePhoto": MessageLookupByLibrary.simpleMessage(
      "Select where to take photo",
    ),
    "select_language": MessageLookupByLibrary.simpleMessage("Select Language"),
    "selectionDuJour": MessageLookupByLibrary.simpleMessage(
      "Today\'s Selection",
    ),
    "sendOtp": MessageLookupByLibrary.simpleMessage("Send OTP"),
    "serumNoiBat": MessageLookupByLibrary.simpleMessage("Featured Serum"),
    "set_tried": MessageLookupByLibrary.simpleMessage("Set Tried"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "showMore": MessageLookupByLibrary.simpleMessage("Show more"),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signUpSuccess": MessageLookupByLibrary.simpleMessage("Sign up successful"),
    "signUpToApp": m27,
    "skinConcernAcne": MessageLookupByLibrary.simpleMessage("acne"),
    "skinConcernRedness": MessageLookupByLibrary.simpleMessage("redness"),
    "skinConcerns": MessageLookupByLibrary.simpleMessage("Skin concerns"),
    "skinProblem": MessageLookupByLibrary.simpleMessage("Skin Problem"),
    "skinType": MessageLookupByLibrary.simpleMessage("Skin type"),
    "skinTypeDry": MessageLookupByLibrary.simpleMessage("Dry"),
    "socialMedia": MessageLookupByLibrary.simpleMessage("Social Media"),
    "sort": MessageLookupByLibrary.simpleMessage("Sort"),
    "step": MessageLookupByLibrary.simpleMessage("Step"),
    "submitReport": MessageLookupByLibrary.simpleMessage("Submit Report"),
    "submitting": MessageLookupByLibrary.simpleMessage("Submitting..."),
    "support": MessageLookupByLibrary.simpleMessage("Support"),
    "switchToDarkMode": MessageLookupByLibrary.simpleMessage(
      "Switch to dark mode",
    ),
    "switchToLightMode": MessageLookupByLibrary.simpleMessage(
      "Switch to light mode",
    ),
    "takeNewPhoto": MessageLookupByLibrary.simpleMessage("Take a New Photo"),
    "tap_heart_to_add_favorites": MessageLookupByLibrary.simpleMessage(
      "Tap the heart to add your favorite positions",
    ),
    "teamWillReview": MessageLookupByLibrary.simpleMessage(
      "Our team will review and take action as soon as possible.",
    ),
    "technicalBugReport": MessageLookupByLibrary.simpleMessage(
      "Technical Bug Report",
    ),
    "termsOfService": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "terms_conditions": MessageLookupByLibrary.simpleMessage(
      "Terms & Conditions",
    ),
    "thankYouForReport": MessageLookupByLibrary.simpleMessage(
      "Thank you for your report!",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "titleMainScreen": MessageLookupByLibrary.simpleMessage("Main Screen"),
    "titleNoInternet": MessageLookupByLibrary.simpleMessage(
      "No Internet Connection",
    ),
    "titleOptional": MessageLookupByLibrary.simpleMessage("Title"),
    "titleRateApp": MessageLookupByLibrary.simpleMessage("Rate this app"),
    "toggleProfileVisibility": MessageLookupByLibrary.simpleMessage(
      "Toggle Profile Visibility",
    ),
    "topVentes": MessageLookupByLibrary.simpleMessage("Best Sellers"),
    "tried": MessageLookupByLibrary.simpleMessage("Tried"),
    "typeLabel": MessageLookupByLibrary.simpleMessage("Type"),
    "unfollow": MessageLookupByLibrary.simpleMessage("Unfollow"),
    "unknownPlayer": MessageLookupByLibrary.simpleMessage("UNKNOWN PLAYER"),
    "updateProfileFailed": m28,
    "usageInfo": MessageLookupByLibrary.simpleMessage("Usage Information"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
    "userProfile": MessageLookupByLibrary.simpleMessage("User Profile"),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "utilitiesRoutine": MessageLookupByLibrary.simpleMessage(
      "Utilities\'s Routine",
    ),
    "verifyOtp": MessageLookupByLibrary.simpleMessage("Verify OTP"),
    "version_x": m29,
    "vietnamese": MessageLookupByLibrary.simpleMessage("Tiếng Việt"),
    "welcomeBackMessage": MessageLookupByLibrary.simpleMessage(
      "Welcome back! Please login to your account",
    ),
    "welcomeSignUpMessage": MessageLookupByLibrary.simpleMessage(
      "Welcome! Please enter your details",
    ),
    "welcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "Let\'s get started finding products that will work for your skin.",
    ),
    "welcomeTitle": MessageLookupByLibrary.simpleMessage(
      "Scan a product, see if it\'s right for you.",
    ),
    "whatItDoes": MessageLookupByLibrary.simpleMessage("What it does:"),
    "whyReportingThis": MessageLookupByLibrary.simpleMessage(
      "Why are you reporting this?",
    ),
    "yourSkin": MessageLookupByLibrary.simpleMessage("Your Skin"),
    "your_favorites": MessageLookupByLibrary.simpleMessage("YOUR FAVORITES"),
    "your_progress": MessageLookupByLibrary.simpleMessage("Your progress:"),
  };
}
