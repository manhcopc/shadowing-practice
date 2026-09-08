// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: 'Login button text',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: 'Logout button text',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: 'Email field label',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'Password field label',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: 'Generic error text',
      args: [],
    );
  }

  /// `Network error!`
  String get error_network {
    return Intl.message(
      'Network error!',
      name: 'error_network',
      desc: 'Network connection error message',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get error_unexpected {
    return Intl.message(
      'Something went wrong!',
      name: 'error_unexpected',
      desc: 'Unexpected error message',
      args: [],
    );
  }

  /// `Unauthorized!`
  String get error_unauthorized {
    return Intl.message(
      'Unauthorized!',
      name: 'error_unauthorized',
      desc: 'Unauthorized access error message',
      args: [],
    );
  }

  /// `Invalid email`
  String get error_invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'error_invalid_email',
      desc: 'Invalid email format error message',
      args: [],
    );
  }

  /// `Your password must be at least 8 characters including a lowercase letter, an uppercase letter, and a number`
  String get error_invalid_password {
    return Intl.message(
      'Your password must be at least 8 characters including a lowercase letter, an uppercase letter, and a number',
      name: 'error_invalid_password',
      desc: 'Invalid password format error message',
      args: [],
    );
  }

  /// `Internal Server Error`
  String get error_internal_server {
    return Intl.message(
      'Internal Server Error',
      name: 'error_internal_server',
      desc: 'Internal server error message',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: 'OK button text', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: 'Confirm button text',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel button text',
      args: [],
    );
  }

  /// `Open Settings`
  String get buttonOpenSettings {
    return Intl.message(
      'Open Settings',
      name: 'buttonOpenSettings',
      desc: 'Open Settings button text',
      args: [],
    );
  }

  /// `Hello, {name}`
  String hello(String name) {
    return Intl.message(
      'Hello, $name',
      name: 'hello',
      desc: 'Greeting message with user name',
      args: [name],
    );
  }

  /// `Counter`
  String get counter {
    return Intl.message(
      'Counter',
      name: 'counter',
      desc: 'Counter screen title',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Settings screen title',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Language setting label',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: 'About screen title',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_conditions',
      desc: 'Terms and conditions label',
      args: [],
    );
  }

  /// `Privacy Policies`
  String get privacy_policies {
    return Intl.message(
      'Privacy Policies',
      name: 'privacy_policies',
      desc: 'Privacy policies label',
      args: [],
    );
  }

  /// `Version {version}`
  String version_x(String version) {
    return Intl.message(
      'Version $version',
      name: 'version_x',
      desc: 'Version display text',
      args: [version],
    );
  }

  /// `Security`
  String get security {
    return Intl.message(
      'Security',
      name: 'security',
      desc: 'Security settings section',
      args: [],
    );
  }

  /// `App Passcode`
  String get app_passcode {
    return Intl.message(
      'App Passcode',
      name: 'app_passcode',
      desc: 'App passcode setting label',
      args: [],
    );
  }

  /// `Change Passcode`
  String get change_passcode {
    return Intl.message(
      'Change Passcode',
      name: 'change_passcode',
      desc: 'Change passcode button text',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'English language name',
      args: [],
    );
  }

  /// `Tiếng Việt`
  String get vietnamese {
    return Intl.message(
      'Tiếng Việt',
      name: 'vietnamese',
      desc: 'Vietnamese language name',
      args: [],
    );
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: 'Select language dialog title',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: 'Change language button text',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: 'Retry button', args: []);
  }

  /// `Tried`
  String get tried {
    return Intl.message(
      'Tried',
      name: 'tried',
      desc: 'Tried status label',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: 'Favorite action label',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: 'Favorites section title',
      args: [],
    );
  }

  /// `No favorites yet`
  String get no_favorites {
    return Intl.message(
      'No favorites yet',
      name: 'no_favorites',
      desc: 'Empty favorites message',
      args: [],
    );
  }

  /// `Tap the heart to add your favorite positions`
  String get tap_heart_to_add_favorites {
    return Intl.message(
      'Tap the heart to add your favorite positions',
      name: 'tap_heart_to_add_favorites',
      desc: 'Instruction for adding favorites',
      args: [],
    );
  }

  /// `No positions found`
  String get no_positions_found {
    return Intl.message(
      'No positions found',
      name: 'no_positions_found',
      desc: 'No search results message',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: 'Loading indicator text',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: 'Search field placeholder',
      args: [],
    );
  }

  /// `All Positions`
  String get all_positions {
    return Intl.message(
      'All Positions',
      name: 'all_positions',
      desc: 'All positions filter label',
      args: [],
    );
  }

  /// `69 POSITIONS`
  String get app_title {
    return Intl.message(
      '69 POSITIONS',
      name: 'app_title',
      desc: 'Application title',
      args: [],
    );
  }

  /// `EXPLORE`
  String get explore {
    return Intl.message(
      'EXPLORE',
      name: 'explore',
      desc: 'Explore section title',
      args: [],
    );
  }

  /// `Your progress:`
  String get your_progress {
    return Intl.message(
      'Your progress:',
      name: 'your_progress',
      desc: 'Progress section label',
      args: [],
    );
  }

  /// `{completed} / {total} positions completed`
  String positions_completed(int completed, int total) {
    return Intl.message(
      '$completed / $total positions completed',
      name: 'positions_completed',
      desc: 'Progress completion text',
      args: [completed, total],
    );
  }

  /// `Error: {message}`
  String error_with_message(String message) {
    return Intl.message(
      'Error: $message',
      name: 'error_with_message',
      desc: 'Error message with details',
      args: [message],
    );
  }

  /// `Removed from Tried`
  String get removed_from_tried {
    return Intl.message(
      'Removed from Tried',
      name: 'removed_from_tried',
      desc: 'Removed from tried list message',
      args: [],
    );
  }

  /// `Marked as Tried`
  String get marked_as_tried {
    return Intl.message(
      'Marked as Tried',
      name: 'marked_as_tried',
      desc: 'Marked as tried message',
      args: [],
    );
  }

  /// `Removed from Favorites`
  String get removed_from_favorites {
    return Intl.message(
      'Removed from Favorites',
      name: 'removed_from_favorites',
      desc: 'Removed from favorites message',
      args: [],
    );
  }

  /// `Added to Favorites`
  String get added_to_favorites {
    return Intl.message(
      'Added to Favorites',
      name: 'added_to_favorites',
      desc: 'Added to favorites message',
      args: [],
    );
  }

  /// `Failed to load position details.`
  String get failed_to_load_position {
    return Intl.message(
      'Failed to load position details.',
      name: 'failed_to_load_position',
      desc: 'Position loading error message',
      args: [],
    );
  }

  /// `Mark Tried`
  String get mark_tried {
    return Intl.message(
      'Mark Tried',
      name: 'mark_tried',
      desc: 'Mark as tried button text',
      args: [],
    );
  }

  /// `Favorited`
  String get favorited {
    return Intl.message(
      'Favorited',
      name: 'favorited',
      desc: 'Favorited status label',
      args: [],
    );
  }

  /// `YOUR FAVORITES`
  String get your_favorites {
    return Intl.message(
      'YOUR FAVORITES',
      name: 'your_favorites',
      desc: 'Favorites section header',
      args: [],
    );
  }

  /// `Explore positions`
  String get explore_positions {
    return Intl.message(
      'Explore positions',
      name: 'explore_positions',
      desc: 'Explore positions button text',
      args: [],
    );
  }

  /// `Feeling lucky?`
  String get feeling_lucky {
    return Intl.message(
      'Feeling lucky?',
      name: 'feeling_lucky',
      desc: 'Feeling lucky prompt',
      args: [],
    );
  }

  /// `Set Tried`
  String get set_tried {
    return Intl.message(
      'Set Tried',
      name: 'set_tried',
      desc: 'Set tried status button text',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: 'Support section title',
      args: [],
    );
  }

  /// `Rate App`
  String get rate_app {
    return Intl.message(
      'Rate App',
      name: 'rate_app',
      desc: 'Rate app button text',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: 'Contact us button text',
      args: [],
    );
  }

  /// `Main Screen`
  String get titleMainScreen {
    return Intl.message(
      'Main Screen',
      name: 'titleMainScreen',
      desc: 'Main screen title',
      args: [],
    );
  }

  /// `Rate this app`
  String get titleRateApp {
    return Intl.message(
      'Rate this app',
      name: 'titleRateApp',
      desc: 'Rate app dialog title',
      args: [],
    );
  }

  /// `You like this app? Then take a little bit of your time to leave a rating:`
  String get messageRateApp {
    return Intl.message(
      'You like this app? Then take a little bit of your time to leave a rating:',
      name: 'messageRateApp',
      desc: 'Rate app dialog message',
      args: [],
    );
  }

  /// `OK`
  String get buttonOk {
    return Intl.message(
      'OK',
      name: 'buttonOk',
      desc: 'OK button text',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get titleNoInternet {
    return Intl.message(
      'No Internet Connection',
      name: 'titleNoInternet',
      desc: 'No internet dialog title',
      args: [],
    );
  }

  /// `Please check your internet connection and try again later`
  String get messageNoInternet {
    return Intl.message(
      'Please check your internet connection and try again later',
      name: 'messageNoInternet',
      desc: 'No internet dialog message',
      args: [],
    );
  }

  /// `Internet connection restored`
  String get messageInternetRestored {
    return Intl.message(
      'Internet connection restored',
      name: 'messageInternetRestored',
      desc: 'Internet restored message',
      args: [],
    );
  }

  /// `Loading...`
  String get messageLoading {
    return Intl.message(
      'Loading...',
      name: 'messageLoading',
      desc: 'Loading message',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: 'Exit button text',
      args: [],
    );
  }

  /// `An error occurred`
  String get errorGeneral {
    return Intl.message(
      'An error occurred',
      name: 'errorGeneral',
      desc: 'General error message',
      args: [],
    );
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: 'Back to login button text',
      args: [],
    );
  }

  /// `Please check your email`
  String get pleaseCheckEmail {
    return Intl.message(
      'Please check your email',
      name: 'pleaseCheckEmail',
      desc: 'Please check your email text',
      args: [],
    );
  }

  /// `Confirm account registration`
  String get confirmAccountRegistration {
    return Intl.message(
      'Confirm account registration',
      name: 'confirmAccountRegistration',
      desc: 'Confirm account registration text',
      args: [],
    );
  }

  /// `Scan a product, see if it's right for you.`
  String get welcomeTitle {
    return Intl.message(
      'Scan a product, see if it\'s right for you.',
      name: 'welcomeTitle',
      desc: 'Welcome screen main title',
      args: [],
    );
  }

  /// `Let's get started finding products that will work for your skin.`
  String get welcomeSubtitle {
    return Intl.message(
      'Let\'s get started finding products that will work for your skin.',
      name: 'welcomeSubtitle',
      desc: 'Welcome screen subtitle',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continueWithApple {
    return Intl.message(
      'Continue with Apple',
      name: 'continueWithApple',
      desc: 'Continue with Apple button text',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: 'Continue with Google button text',
      args: [],
    );
  }

  /// `Continue with Email`
  String get continueWithEmail {
    return Intl.message(
      'Continue with Email',
      name: 'continueWithEmail',
      desc: 'Continue with Email button text',
      args: [],
    );
  }

  /// `Switch to light mode`
  String get switchToLightMode {
    return Intl.message(
      'Switch to light mode',
      name: 'switchToLightMode',
      desc: 'Tooltip for switch to light mode button',
      args: [],
    );
  }

  /// `Switch to dark mode`
  String get switchToDarkMode {
    return Intl.message(
      'Switch to dark mode',
      name: 'switchToDarkMode',
      desc: 'Tooltip for switch to dark mode button',
      args: [],
    );
  }

  /// `Week`
  String get period_week {
    return Intl.message(
      'Week',
      name: 'period_week',
      desc: 'Week period label (singular)',
      args: [],
    );
  }

  /// `Month`
  String get period_month {
    return Intl.message(
      'Month',
      name: 'period_month',
      desc: 'Month period label (singular)',
      args: [],
    );
  }

  /// `Year`
  String get period_year {
    return Intl.message(
      'Year',
      name: 'period_year',
      desc: 'Year period label (singular)',
      args: [],
    );
  }

  /// `Period`
  String get period_period {
    return Intl.message(
      'Period',
      name: 'period_period',
      desc: 'Generic period label for default case',
      args: [],
    );
  }

  /// `{count} Weeks`
  String period_weeks(int count) {
    return Intl.message(
      '$count Weeks',
      name: 'period_weeks',
      desc: 'Weeks period label with count (plural)',
      args: [count],
    );
  }

  /// `{count} Months`
  String period_months(int count) {
    return Intl.message(
      '$count Months',
      name: 'period_months',
      desc: 'Months period label with count (plural)',
      args: [count],
    );
  }

  /// `{count} Years`
  String period_years(int count) {
    return Intl.message(
      '$count Years',
      name: 'period_years',
      desc: 'Years period label with count (plural)',
      args: [count],
    );
  }

  /// `{count} Days`
  String period_days(int count) {
    return Intl.message(
      '$count Days',
      name: 'period_days',
      desc: 'Days period label with count (plural)',
      args: [count],
    );
  }

  /// `Day`
  String get period_day {
    return Intl.message(
      'Day',
      name: 'period_day',
      desc: 'Day period label (singular)',
      args: [],
    );
  }

  /// `Payment failed: {message}`
  String purchase_payment_failed(String message) {
    return Intl.message(
      'Payment failed: $message',
      name: 'purchase_payment_failed',
      desc: 'Payment failed error message with details',
      args: [message],
    );
  }

  /// `Please log in to make a purchase`
  String get purchase_not_logged_in {
    return Intl.message(
      'Please log in to make a purchase',
      name: 'purchase_not_logged_in',
      desc: 'Error message when user is not logged in for purchase',
      args: [],
    );
  }

  /// `Purchase verification failed: {error}`
  String purchase_verification_failed(String error) {
    return Intl.message(
      'Purchase verification failed: $error',
      name: 'purchase_verification_failed',
      desc: 'Purchase verification failed error message',
      args: [error],
    );
  }

  /// `Server verification failed: {error}`
  String purchase_server_verification_failed(String error) {
    return Intl.message(
      'Server verification failed: $error',
      name: 'purchase_server_verification_failed',
      desc: 'Server verification failed error message',
      args: [error],
    );
  }

  /// `Device binding check failed: {error}`
  String purchase_binding_check_error(String error) {
    return Intl.message(
      'Device binding check failed: $error',
      name: 'purchase_binding_check_error',
      desc: 'Device binding check failed error message',
      args: [error],
    );
  }

  /// `No products available`
  String get purchase_no_products {
    return Intl.message(
      'No products available',
      name: 'purchase_no_products',
      desc: 'Error message when no products are available',
      args: [],
    );
  }

  /// `Failed to load products: {error}`
  String purchase_load_products_error(String error) {
    return Intl.message(
      'Failed to load products: $error',
      name: 'purchase_load_products_error',
      desc: 'Failed to load products error message',
      args: [error],
    );
  }

  /// `Store is currently unavailable`
  String get purchase_store_unavailable {
    return Intl.message(
      'Store is currently unavailable',
      name: 'purchase_store_unavailable',
      desc: 'Store unavailable error message',
      args: [],
    );
  }

  /// `Purchase error: {error}`
  String purchase_error(String error) {
    return Intl.message(
      'Purchase error: $error',
      name: 'purchase_error',
      desc: 'Generic purchase error message',
      args: [error],
    );
  }

  /// `Product not found`
  String get purchase_product_not_found {
    return Intl.message(
      'Product not found',
      name: 'purchase_product_not_found',
      desc: 'Product not found error message',
      args: [],
    );
  }

  /// `Weekly Premium`
  String get plan_weekly_premium {
    return Intl.message(
      'Weekly Premium',
      name: 'plan_weekly_premium',
      desc: 'Weekly premium plan title',
      args: [],
    );
  }

  /// `Monthly Premium`
  String get plan_monthly_premium {
    return Intl.message(
      'Monthly Premium',
      name: 'plan_monthly_premium',
      desc: 'Monthly premium plan title',
      args: [],
    );
  }

  /// `Yearly Premium`
  String get plan_yearly_premium {
    return Intl.message(
      'Yearly Premium',
      name: 'plan_yearly_premium',
      desc: 'Yearly premium plan title',
      args: [],
    );
  }

  /// `Premium Plan`
  String get plan_premium_plan {
    return Intl.message(
      'Premium Plan',
      name: 'plan_premium_plan',
      desc: 'Generic premium plan title',
      args: [],
    );
  }

  /// `Loading...`
  String get plan_loading {
    return Intl.message(
      'Loading...',
      name: 'plan_loading',
      desc: 'Loading text for plan information',
      args: [],
    );
  }

  /// `Free trial`
  String get plan_free_trial {
    return Intl.message(
      'Free trial',
      name: 'plan_free_trial',
      desc: 'Free trial indicator text',
      args: [],
    );
  }

  /// ` per week`
  String get plan_per_week {
    return Intl.message(
      ' per week',
      name: 'plan_per_week',
      desc: 'Per week pricing suffix',
      args: [],
    );
  }

  /// ` VND/week`
  String get plan_vnd_per_week {
    return Intl.message(
      ' VND/week',
      name: 'plan_vnd_per_week',
      desc: 'Vietnamese Dong per week pricing suffix',
      args: [],
    );
  }

  /// `Device Already Linked`
  String get binding_device_linked {
    return Intl.message(
      'Device Already Linked',
      name: 'binding_device_linked',
      desc: 'Title for device binding dialog when device is already linked',
      args: [],
    );
  }

  /// `This device is already linked to another account. To purchase premium features, please switch to the linked account or contact support.`
  String get binding_device_linked_description {
    return Intl.message(
      'This device is already linked to another account. To purchase premium features, please switch to the linked account or contact support.',
      name: 'binding_device_linked_description',
      desc: 'Description text explaining device binding conflict',
      args: [],
    );
  }

  /// `To complete your purchase:`
  String get binding_purchase_instructions {
    return Intl.message(
      'To complete your purchase:',
      name: 'binding_purchase_instructions',
      desc: 'Instructions header for purchase process',
      args: [],
    );
  }

  /// `Switch to the linked account ({linkedAccount})`
  String binding_switch_account(String linkedAccount) {
    return Intl.message(
      'Switch to the linked account ($linkedAccount)',
      name: 'binding_switch_account',
      desc: 'Instruction to switch to linked account',
      args: [linkedAccount],
    );
  }

  /// `Contact support for assistance`
  String get binding_contact_support {
    return Intl.message(
      'Contact support for assistance',
      name: 'binding_contact_support',
      desc: 'Instruction to contact support',
      args: [],
    );
  }

  /// `Cancel`
  String get binding_cancel {
    return Intl.message(
      'Cancel',
      name: 'binding_cancel',
      desc: 'Cancel button text in binding dialog',
      args: [],
    );
  }

  /// `Understood`
  String get binding_understood {
    return Intl.message(
      'Understood',
      name: 'binding_understood',
      desc: 'Understood button text in binding dialog',
      args: [],
    );
  }

  /// `Processing payment...`
  String get premium_processing_payment {
    return Intl.message(
      'Processing payment...',
      name: 'premium_processing_payment',
      desc: 'Toast message when processing payment',
      args: [],
    );
  }

  /// `Verifying payment...`
  String get premium_verifying_payment {
    return Intl.message(
      'Verifying payment...',
      name: 'premium_verifying_payment',
      desc: 'Toast message when verifying payment',
      args: [],
    );
  }

  /// `Purchase successful!`
  String get premium_purchase_success {
    return Intl.message(
      'Purchase successful!',
      name: 'premium_purchase_success',
      desc: 'Toast message for successful purchase',
      args: [],
    );
  }

  /// `Transaction cancelled`
  String get premium_transaction_cancelled {
    return Intl.message(
      'Transaction cancelled',
      name: 'premium_transaction_cancelled',
      desc: 'Toast message for cancelled transaction',
      args: [],
    );
  }

  /// `Get Pro Access`
  String get premium_get_pro_access {
    return Intl.message(
      'Get Pro Access',
      name: 'premium_get_pro_access',
      desc: 'Main title for premium subscription screen',
      args: [],
    );
  }

  /// `Unlock all premium features for your skin analysis journey`
  String get premium_unlock_features {
    return Intl.message(
      'Unlock all premium features for your skin analysis journey',
      name: 'premium_unlock_features',
      desc: 'Subtitle describing premium benefits',
      args: [],
    );
  }

  /// `AI Dermatologist`
  String get premium_ai_dermatologist {
    return Intl.message(
      'AI Dermatologist',
      name: 'premium_ai_dermatologist',
      desc: 'Premium feature title - AI dermatologist',
      args: [],
    );
  }

  /// `Get instant skin analysis and personalized recommendations`
  String get premium_instant_analysis {
    return Intl.message(
      'Get instant skin analysis and personalized recommendations',
      name: 'premium_instant_analysis',
      desc: 'Premium feature description - instant analysis',
      args: [],
    );
  }

  /// `Unlimited Scanning`
  String get premium_unlimited_scanning {
    return Intl.message(
      'Unlimited Scanning',
      name: 'premium_unlimited_scanning',
      desc: 'Premium feature title - unlimited scanning',
      args: [],
    );
  }

  /// `Scan anywhere, anytime with unlimited access`
  String get premium_scan_anywhere {
    return Intl.message(
      'Scan anywhere, anytime with unlimited access',
      name: 'premium_scan_anywhere',
      desc: 'Premium feature description - unlimited access',
      args: [],
    );
  }

  /// `Loading subscription plans...`
  String get premium_loading_subscriptions {
    return Intl.message(
      'Loading subscription plans...',
      name: 'premium_loading_subscriptions',
      desc: 'Loading text for subscription plans',
      args: [],
    );
  }

  /// `Unable to load subscription plans`
  String get premium_unable_to_load {
    return Intl.message(
      'Unable to load subscription plans',
      name: 'premium_unable_to_load',
      desc: 'Error message when unable to load plans',
      args: [],
    );
  }

  /// `Try Again`
  String get premium_try_again {
    return Intl.message(
      'Try Again',
      name: 'premium_try_again',
      desc: 'Try again button text',
      args: [],
    );
  }

  /// `Free Trial Available`
  String get premium_free_trial {
    return Intl.message(
      'Free Trial Available',
      name: 'premium_free_trial',
      desc: 'Free trial indicator text',
      args: [],
    );
  }

  /// `Start your premium experience with a free trial period`
  String get premium_trial_description {
    return Intl.message(
      'Start your premium experience with a free trial period',
      name: 'premium_trial_description',
      desc: 'Free trial description text',
      args: [],
    );
  }

  /// `Continue`
  String get premium_continue {
    return Intl.message(
      'Continue',
      name: 'premium_continue',
      desc: 'Continue button text for subscription',
      args: [],
    );
  }

  /// `Restore`
  String get premium_restore {
    return Intl.message(
      'Restore',
      name: 'premium_restore',
      desc: 'Restore purchases footer link',
      args: [],
    );
  }

  /// `Terms`
  String get premium_terms {
    return Intl.message(
      'Terms',
      name: 'premium_terms',
      desc: 'Terms of service footer link',
      args: [],
    );
  }

  /// `Privacy`
  String get premium_privacy {
    return Intl.message(
      'Privacy',
      name: 'premium_privacy',
      desc: 'Privacy policy footer link',
      args: [],
    );
  }

  /// `{feature} coming soon`
  String premium_feature_coming_soon(String feature) {
    return Intl.message(
      '$feature coming soon',
      name: 'premium_feature_coming_soon',
      desc: 'Coming soon message for unavailable features',
      args: [feature],
    );
  }

  /// `Best Offer`
  String get premium_best_offer {
    return Intl.message(
      'Best Offer',
      name: 'premium_best_offer',
      desc: 'Badge text for best offer plan',
      args: [],
    );
  }

  /// `Popular`
  String get premium_popular {
    return Intl.message(
      'Popular',
      name: 'premium_popular',
      desc: 'Badge text for popular plan',
      args: [],
    );
  }

  /// `Save 65%`
  String get premium_save_65_percent {
    return Intl.message(
      'Save 65%',
      name: 'premium_save_65_percent',
      desc: 'Savings description for yearly plan',
      args: [],
    );
  }

  /// `Flexible billing`
  String get premium_flexible_billing {
    return Intl.message(
      'Flexible billing',
      name: 'premium_flexible_billing',
      desc: 'Description for weekly plan',
      args: [],
    );
  }

  /// `All premium features included`
  String get premium_features_included {
    return Intl.message(
      'All premium features included',
      name: 'premium_features_included',
      desc: 'Description for one-time purchase',
      args: [],
    );
  }

  /// `Current Account`
  String get premium_current_account {
    return Intl.message(
      'Current Account',
      name: 'premium_current_account',
      desc: 'Label for current account in binding dialog',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: 'Sign In button',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: 'Sign Up button',
      args: [],
    );
  }

  /// `Login to {appName}`
  String loginToApp(String appName) {
    return Intl.message(
      'Login to $appName',
      name: 'loginToApp',
      desc: 'Login title with app name',
      args: [appName],
    );
  }

  /// `Welcome back! Please login to your account`
  String get welcomeBackMessage {
    return Intl.message(
      'Welcome back! Please login to your account',
      name: 'welcomeBackMessage',
      desc: 'Welcome message for login screen',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: 'Forgot password link',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: 'Question to switch to sign up',
      args: [],
    );
  }

  /// `Sign up to {appName}`
  String signUpToApp(String appName) {
    return Intl.message(
      'Sign up to $appName',
      name: 'signUpToApp',
      desc: 'Sign up title with app name',
      args: [appName],
    );
  }

  /// `Welcome! Please enter your details`
  String get welcomeSignUpMessage {
    return Intl.message(
      'Welcome! Please enter your details',
      name: 'welcomeSignUpMessage',
      desc: 'Welcome message for sign up screen',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: 'Full name field label',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: 'Question to switch to sign in',
      args: [],
    );
  }

  /// `Enter the email associated with your account and we'll send an email with instructions to reset your password.`
  String get enterEmailToResetPassword {
    return Intl.message(
      'Enter the email associated with your account and we\'ll send an email with instructions to reset your password.',
      name: 'enterEmailToResetPassword',
      desc: 'Description of how to reset password',
      args: [],
    );
  }

  /// `Send OTP`
  String get sendOtp {
    return Intl.message(
      'Send OTP',
      name: 'sendOtp',
      desc: 'Send OTP button',
      args: [],
    );
  }

  /// `We sent you 6-digit code to your email address`
  String get otpSentToEmail {
    return Intl.message(
      'We sent you 6-digit code to your email address',
      name: 'otpSentToEmail',
      desc: 'Notification that OTP was sent',
      args: [],
    );
  }

  /// `OTP resent`
  String get otpResent {
    return Intl.message(
      'OTP resent',
      name: 'otpResent',
      desc: 'Notification that OTP was resent',
      args: [],
    );
  }

  /// `OTP verified successfully`
  String get otpVerifiedSuccessfully {
    return Intl.message(
      'OTP verified successfully',
      name: 'otpVerifiedSuccessfully',
      desc: 'OTP verification success notification',
      args: [],
    );
  }

  /// `Please enter the 6-digit code`
  String get enterSixDigitCode {
    return Intl.message(
      'Please enter the 6-digit code',
      name: 'enterSixDigitCode',
      desc: 'OTP entry screen title',
      args: [],
    );
  }

  /// `Enter OTP`
  String get enterOtp {
    return Intl.message(
      'Enter OTP',
      name: 'enterOtp',
      desc: 'OTP field label',
      args: [],
    );
  }

  /// `Resend OTP in`
  String get resendOtpIn {
    return Intl.message(
      'Resend OTP in',
      name: 'resendOtpIn',
      desc: 'Countdown text for resend OTP',
      args: [],
    );
  }

  /// `Resend OTP`
  String get resendOtp {
    return Intl.message(
      'Resend OTP',
      name: 'resendOtp',
      desc: 'Resend OTP button',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: 'Continue button',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verifyOtp {
    return Intl.message(
      'Verify OTP',
      name: 'verifyOtp',
      desc: 'OTP verification screen title',
      args: [],
    );
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: 'New password creation screen title',
      args: [],
    );
  }

  /// `Your new password must be different from previous used passwords`
  String get passwordMustBeDifferent {
    return Intl.message(
      'Your new password must be different from previous used passwords',
      name: 'passwordMustBeDifferent',
      desc: 'New password requirement description',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: 'Confirm new password field label',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: 'Reset password button',
      args: [],
    );
  }

  /// `Password reset successfully`
  String get passwordResetSuccessfully {
    return Intl.message(
      'Password reset successfully',
      name: 'passwordResetSuccessfully',
      desc: 'Password reset success notification',
      args: [],
    );
  }

  /// `Note: It may take a few minutes for the password reset email to reach your inbox. If it doesn't appear, please look in your spam folders. Keep in mind that only the most recent password reset link you requested will remain valid.`
  String get passwordResetNote {
    return Intl.message(
      'Note: It may take a few minutes for the password reset email to reach your inbox. If it doesn\'t appear, please look in your spam folders. Keep in mind that only the most recent password reset link you requested will remain valid.',
      name: 'passwordResetNote',
      desc: 'Note about receiving password reset email',
      args: [],
    );
  }

  /// `Login successful`
  String get loginSuccess {
    return Intl.message(
      'Login successful',
      name: 'loginSuccess',
      desc: 'Login success notification',
      args: [],
    );
  }

  /// `Sign up successful`
  String get signUpSuccess {
    return Intl.message(
      'Sign up successful',
      name: 'signUpSuccess',
      desc: 'Sign up success notification',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: 'Profile screen title',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: 'Followers label',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: 'Following label',
      args: [],
    );
  }

  /// `Skin type`
  String get skinType {
    return Intl.message(
      'Skin type',
      name: 'skinType',
      desc: 'Skin type label',
      args: [],
    );
  }

  /// `Skin concerns`
  String get skinConcerns {
    return Intl.message(
      'Skin concerns',
      name: 'skinConcerns',
      desc: 'Skin concerns label',
      args: [],
    );
  }

  /// `Utilities's Routine`
  String get utilitiesRoutine {
    return Intl.message(
      'Utilities\'s Routine',
      name: 'utilitiesRoutine',
      desc: 'Skincare routine title',
      args: [],
    );
  }

  /// `Dry`
  String get skinTypeDry {
    return Intl.message(
      'Dry',
      name: 'skinTypeDry',
      desc: 'Dry skin type',
      args: [],
    );
  }

  /// `redness`
  String get skinConcernRedness {
    return Intl.message(
      'redness',
      name: 'skinConcernRedness',
      desc: 'Redness skin concern',
      args: [],
    );
  }

  /// `acne`
  String get skinConcernAcne {
    return Intl.message(
      'acne',
      name: 'skinConcernAcne',
      desc: 'Acne skin concern',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: 'Account section label',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: 'Profile label',
      args: [],
    );
  }

  /// `Your Skin`
  String get yourSkin {
    return Intl.message(
      'Your Skin',
      name: 'yourSkin',
      desc: 'Your skin label',
      args: [],
    );
  }

  /// `Product Preferences`
  String get productPreferences {
    return Intl.message(
      'Product Preferences',
      name: 'productPreferences',
      desc: 'Product preferences label',
      args: [],
    );
  }

  /// `Avoided Ingredients`
  String get avoidedIngredients {
    return Intl.message(
      'Avoided Ingredients',
      name: 'avoidedIngredients',
      desc: 'Avoided ingredients label',
      args: [],
    );
  }

  /// `Liked Ingredients`
  String get likedIngredients {
    return Intl.message(
      'Liked Ingredients',
      name: 'likedIngredients',
      desc: 'Liked ingredients label',
      args: [],
    );
  }

  /// `Holy Grails`
  String get holyGrails {
    return Intl.message(
      'Holy Grails',
      name: 'holyGrails',
      desc: 'Holy grails label',
      args: [],
    );
  }

  /// `Social Media`
  String get socialMedia {
    return Intl.message(
      'Social Media',
      name: 'socialMedia',
      desc: 'Social media label',
      args: [],
    );
  }

  /// `Email Preferences`
  String get emailPreferences {
    return Intl.message(
      'Email Preferences',
      name: 'emailPreferences',
      desc: 'Email preferences label',
      args: [],
    );
  }

  /// `Push Notifications`
  String get pushNotifications {
    return Intl.message(
      'Push Notifications',
      name: 'pushNotifications',
      desc: 'Push notifications label',
      args: [],
    );
  }

  /// `Legal`
  String get legal {
    return Intl.message(
      'Legal',
      name: 'legal',
      desc: 'Legal section label',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: 'Privacy policy label',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: 'Terms of service label',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: 'Contact us label',
      args: [],
    );
  }

  /// `Rate Us`
  String get rateUs {
    return Intl.message(
      'Rate Us',
      name: 'rateUs',
      desc: 'Rate app label',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: 'Theme section label',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: 'Dark mode label',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: 'Light mode label',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: 'Change language label',
      args: [],
    );
  }

  /// `Current language`
  String get currentLanguage {
    return Intl.message(
      'Current language',
      name: 'currentLanguage',
      desc: 'Current language label',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: 'Edit profile title',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: 'Change password label',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: 'Delete account label',
      args: [],
    );
  }

  /// `Choose Photo Source`
  String get choosePhotoSource {
    return Intl.message(
      'Choose Photo Source',
      name: 'choosePhotoSource',
      desc: 'Title for photo source selection bottom sheet',
      args: [],
    );
  }

  /// `Select where to take photo`
  String get selectWhereToTakePhoto {
    return Intl.message(
      'Select where to take photo',
      name: 'selectWhereToTakePhoto',
      desc: 'Description for photo source selection',
      args: [],
    );
  }

  /// `Take a New Photo`
  String get takeNewPhoto {
    return Intl.message(
      'Take a New Photo',
      name: 'takeNewPhoto',
      desc: 'Button to take photo from camera',
      args: [],
    );
  }

  /// `Open Your Gallery`
  String get openYourGallery {
    return Intl.message(
      'Open Your Gallery',
      name: 'openYourGallery',
      desc: 'Button to open photo gallery',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: 'Back button', args: []);
  }

  /// `Unable to access camera`
  String get errorAccessingCamera {
    return Intl.message(
      'Unable to access camera',
      name: 'errorAccessingCamera',
      desc: 'Error message for camera access',
      args: [],
    );
  }

  /// `Unable to access gallery`
  String get errorAccessingGallery {
    return Intl.message(
      'Unable to access gallery',
      name: 'errorAccessingGallery',
      desc: 'Error message for gallery access',
      args: [],
    );
  }

  /// `Failed to select image. Please try again.`
  String get errorSelectImage {
    return Intl.message(
      'Failed to select image. Please try again.',
      name: 'errorSelectImage',
      desc: 'Error message for image selection failure',
      args: [],
    );
  }

  /// `Profile updated successfully!`
  String get profileUpdatedSuccessfully {
    return Intl.message(
      'Profile updated successfully!',
      name: 'profileUpdatedSuccessfully',
      desc: 'Profile update success message',
      args: [],
    );
  }

  /// `Update profile failed: {message}`
  String updateProfileFailed(String message) {
    return Intl.message(
      'Update profile failed: $message',
      name: 'updateProfileFailed',
      desc: 'Profile update failure message',
      args: [message],
    );
  }

  /// `UNKNOWN PLAYER`
  String get unknownPlayer {
    return Intl.message(
      'UNKNOWN PLAYER',
      name: 'unknownPlayer',
      desc: 'Default player name',
      args: [],
    );
  }

  /// `Display Name`
  String get displayName {
    return Intl.message(
      'Display Name',
      name: 'displayName',
      desc: 'Display name label',
      args: [],
    );
  }

  /// `Enter your display name`
  String get enterDisplayName {
    return Intl.message(
      'Enter your display name',
      name: 'enterDisplayName',
      desc: 'Display name hint',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: 'Username label',
      args: [],
    );
  }

  /// `Enter your username`
  String get enterUsername {
    return Intl.message(
      'Enter your username',
      name: 'enterUsername',
      desc: 'Username hint',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: 'Phone label', args: []);
  }

  /// `Enter your phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterPhoneNumber',
      desc: 'Phone number hint',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: 'Gender label',
      args: [],
    );
  }

  /// `Select Gender`
  String get selectGender {
    return Intl.message(
      'Select Gender',
      name: 'selectGender',
      desc: 'Gender selection hint',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: 'Male gender', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: 'Female gender',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: 'Other gender', args: []);
  }

  /// `SAVE PROFILE`
  String get saveProfile {
    return Intl.message(
      'SAVE PROFILE',
      name: 'saveProfile',
      desc: 'Save profile button',
      args: [],
    );
  }

  /// `To change your password, please enter your current password and new password`
  String get changePasswordDescription {
    return Intl.message(
      'To change your password, please enter your current password and new password',
      name: 'changePasswordDescription',
      desc: 'Change password description',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get changePasswordSuccess {
    return Intl.message(
      'Password changed successfully',
      name: 'changePasswordSuccess',
      desc: 'Change password success notification',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: 'Current password label',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: 'New password label',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: 'Confirm password label',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: 'Reset button', args: []);
  }

  /// `Are you sure?`
  String get deleteAccountConfirmTitle {
    return Intl.message(
      'Are you sure?',
      name: 'deleteAccountConfirmTitle',
      desc: 'Delete account confirmation title',
      args: [],
    );
  }

  /// `If you delete your account, you won't be able to log in with it anymore. Are you sure you want to continue?`
  String get deleteAccountConfirmMessage {
    return Intl.message(
      'If you delete your account, you won\'t be able to log in with it anymore. Are you sure you want to continue?',
      name: 'deleteAccountConfirmMessage',
      desc: 'Delete account confirmation message',
      args: [],
    );
  }

  /// `Account deleted successfully`
  String get deleteAccountSuccess {
    return Intl.message(
      'Account deleted successfully',
      name: 'deleteAccountSuccess',
      desc: 'Account deletion success message',
      args: [],
    );
  }

  /// `Account deletion failed: {message}`
  String deleteAccountFailed(String message) {
    return Intl.message(
      'Account deletion failed: $message',
      name: 'deleteAccountFailed',
      desc: 'Account deletion failure message',
      args: [message],
    );
  }

  /// `No posts available`
  String get feedNoPosts {
    return Intl.message(
      'No posts available',
      name: 'feedNoPosts',
      desc: 'Message when feed has no posts',
      args: [],
    );
  }

  /// `Post created successfully`
  String get feedPostCreatedSuccess {
    return Intl.message(
      'Post created successfully',
      name: 'feedPostCreatedSuccess',
      desc: 'Success message for post creation',
      args: [],
    );
  }

  /// `Post updated successfully`
  String get feedPostUpdatedSuccess {
    return Intl.message(
      'Post updated successfully',
      name: 'feedPostUpdatedSuccess',
      desc: 'Success message for post update',
      args: [],
    );
  }

  /// `Post deleted successfully`
  String get feedPostDeletedSuccess {
    return Intl.message(
      'Post deleted successfully',
      name: 'feedPostDeletedSuccess',
      desc: 'Success message for post deletion',
      args: [],
    );
  }

  /// `Creating post...`
  String get feedCreatingPost {
    return Intl.message(
      'Creating post...',
      name: 'feedCreatingPost',
      desc: 'Message shown while creating a post',
      args: [],
    );
  }

  /// `Unknown`
  String get feedUnknownUser {
    return Intl.message(
      'Unknown',
      name: 'feedUnknownUser',
      desc: 'Default username when user is unknown',
      args: [],
    );
  }

  /// `Edit`
  String get feedCommentEdit {
    return Intl.message(
      'Edit',
      name: 'feedCommentEdit',
      desc: 'Edit comment button',
      args: [],
    );
  }

  /// `Delete`
  String get feedCommentDelete {
    return Intl.message(
      'Delete',
      name: 'feedCommentDelete',
      desc: 'Delete comment button',
      args: [],
    );
  }

  /// `Delete Comment`
  String get feedCommentDeleteTitle {
    return Intl.message(
      'Delete Comment',
      name: 'feedCommentDeleteTitle',
      desc: 'Title for delete comment dialog',
      args: [],
    );
  }

  /// `Are you sure you want to delete this comment?`
  String get feedCommentDeleteConfirm {
    return Intl.message(
      'Are you sure you want to delete this comment?',
      name: 'feedCommentDeleteConfirm',
      desc: 'Confirmation message for comment deletion',
      args: [],
    );
  }

  /// `Comment deleted successfully`
  String get feedCommentDeletedSuccess {
    return Intl.message(
      'Comment deleted successfully',
      name: 'feedCommentDeletedSuccess',
      desc: 'Success message for comment deletion',
      args: [],
    );
  }

  /// `Write a comment...`
  String get feedCommentInputHint {
    return Intl.message(
      'Write a comment...',
      name: 'feedCommentInputHint',
      desc: 'Hint text for comment input',
      args: [],
    );
  }

  /// `Comments ({count})`
  String feedCommentsTitle(int count) {
    return Intl.message(
      'Comments ($count)',
      name: 'feedCommentsTitle',
      desc: 'Title for comments list with count',
      args: [count],
    );
  }

  /// `No comments yet`
  String get feedCommentsEmpty {
    return Intl.message(
      'No comments yet',
      name: 'feedCommentsEmpty',
      desc: 'Message when there are no comments',
      args: [],
    );
  }

  /// `View {count} replies`
  String feedCommentShowReplies(int count) {
    return Intl.message(
      'View $count replies',
      name: 'feedCommentShowReplies',
      desc: 'Button to show replies',
      args: [count],
    );
  }

  /// `Hide replies`
  String get feedCommentHideReplies {
    return Intl.message(
      'Hide replies',
      name: 'feedCommentHideReplies',
      desc: 'Button to hide replies',
      args: [],
    );
  }

  /// `Reply`
  String get feedCommentReply {
    return Intl.message(
      'Reply',
      name: 'feedCommentReply',
      desc: 'Button to reply to comment',
      args: [],
    );
  }

  /// `View {count} more replies`
  String feedCommentLoadMoreReplies(int count) {
    return Intl.message(
      'View $count more replies',
      name: 'feedCommentLoadMoreReplies',
      desc: 'Button to load more replies',
      args: [count],
    );
  }

  /// `Comment Options`
  String get feedCommentOptions {
    return Intl.message(
      'Comment Options',
      name: 'feedCommentOptions',
      desc: 'Comment options bottom sheet title',
      args: [],
    );
  }

  /// `Replying to`
  String get feedCommentReplyingTo {
    return Intl.message(
      'Replying to',
      name: 'feedCommentReplyingTo',
      desc: 'Text shown when replying to a comment',
      args: [],
    );
  }

  /// `Editing comment`
  String get feedCommentEditing {
    return Intl.message(
      'Editing comment',
      name: 'feedCommentEditing',
      desc: 'Text shown when editing a comment',
      args: [],
    );
  }

  /// `Create Post`
  String get feedCreatePost {
    return Intl.message(
      'Create Post',
      name: 'feedCreatePost',
      desc: 'Title for create post bottom sheet',
      args: [],
    );
  }

  /// `What's on your mind?`
  String get feedPostContentHint {
    return Intl.message(
      'What\'s on your mind?',
      name: 'feedPostContentHint',
      desc: 'Hint text for post content input',
      args: [],
    );
  }

  /// `Add hashtags (comma separated)`
  String get feedPostHashtagsHint {
    return Intl.message(
      'Add hashtags (comma separated)',
      name: 'feedPostHashtagsHint',
      desc: 'Hint text for hashtags input',
      args: [],
    );
  }

  /// `Add Images`
  String get feedAddImages {
    return Intl.message(
      'Add Images',
      name: 'feedAddImages',
      desc: 'Button to add images to post',
      args: [],
    );
  }

  /// `Post`
  String get feedPostButton {
    return Intl.message(
      'Post',
      name: 'feedPostButton',
      desc: 'Button to publish post',
      args: [],
    );
  }

  /// `Please enter post content`
  String get feedPostContentRequired {
    return Intl.message(
      'Please enter post content',
      name: 'feedPostContentRequired',
      desc: 'Error message when post content is empty',
      args: [],
    );
  }

  /// `Edit Post`
  String get feedEditPost {
    return Intl.message(
      'Edit Post',
      name: 'feedEditPost',
      desc: 'Title for edit post bottom sheet',
      args: [],
    );
  }

  /// `Update`
  String get feedUpdateButton {
    return Intl.message(
      'Update',
      name: 'feedUpdateButton',
      desc: 'Button to update post',
      args: [],
    );
  }

  /// `Post Options`
  String get feedPostOptions {
    return Intl.message(
      'Post Options',
      name: 'feedPostOptions',
      desc: 'Title for post options bottom sheet',
      args: [],
    );
  }

  /// `Edit Post`
  String get feedEditPostOption {
    return Intl.message(
      'Edit Post',
      name: 'feedEditPostOption',
      desc: 'Option to edit post',
      args: [],
    );
  }

  /// `Delete Post`
  String get feedDeletePostOption {
    return Intl.message(
      'Delete Post',
      name: 'feedDeletePostOption',
      desc: 'Option to delete post',
      args: [],
    );
  }

  /// `Report Post`
  String get feedReportPostOption {
    return Intl.message(
      'Report Post',
      name: 'feedReportPostOption',
      desc: 'Option to report post',
      args: [],
    );
  }

  /// `Report Comment`
  String get feedReportCommentOption {
    return Intl.message(
      'Report Comment',
      name: 'feedReportCommentOption',
      desc: 'Option to report comment',
      args: [],
    );
  }

  /// `Delete Post`
  String get feedDeletePostConfirmTitle {
    return Intl.message(
      'Delete Post',
      name: 'feedDeletePostConfirmTitle',
      desc: 'Title for delete post confirmation dialog',
      args: [],
    );
  }

  /// `Are you sure you want to delete this post?`
  String get feedDeletePostConfirmMessage {
    return Intl.message(
      'Are you sure you want to delete this post?',
      name: 'feedDeletePostConfirmMessage',
      desc: 'Message for delete post confirmation',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: 'Button to refresh data',
      args: [],
    );
  }

  /// `Show more`
  String get showMore {
    return Intl.message(
      'Show more',
      name: 'showMore',
      desc: 'Button to show more content',
      args: [],
    );
  }

  /// `Hide`
  String get hide {
    return Intl.message(
      'Hide',
      name: 'hide',
      desc: 'Button to hide content',
      args: [],
    );
  }

  /// `Report`
  String get reportThisSet {
    return Intl.message(
      'Report',
      name: 'reportThisSet',
      desc: 'Report title',
      args: [],
    );
  }

  /// `Report Details`
  String get reportDetails {
    return Intl.message(
      'Report Details',
      name: 'reportDetails',
      desc: 'Report details title',
      args: [],
    );
  }

  /// `Report Submitted`
  String get reportSubmitted {
    return Intl.message(
      'Report Submitted',
      name: 'reportSubmitted',
      desc: 'Report submitted title',
      args: [],
    );
  }

  /// `Continue`
  String get continueBtn {
    return Intl.message(
      'Continue',
      name: 'continueBtn',
      desc: 'Continue button',
      args: [],
    );
  }

  /// `Submitting...`
  String get submitting {
    return Intl.message(
      'Submitting...',
      name: 'submitting',
      desc: 'Submitting status',
      args: [],
    );
  }

  /// `Submit Report`
  String get submitReport {
    return Intl.message(
      'Submit Report',
      name: 'submitReport',
      desc: 'Submit report button',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: 'Done button', args: []);
  }

  /// `Please select a reason`
  String get pleaseSelectReason {
    return Intl.message(
      'Please select a reason',
      name: 'pleaseSelectReason',
      desc: 'Please select reason message',
      args: [],
    );
  }

  /// `Failed to submit report`
  String get failedToSubmitReport {
    return Intl.message(
      'Failed to submit report',
      name: 'failedToSubmitReport',
      desc: 'Failed to submit report error',
      args: [],
    );
  }

  /// `Why are you reporting this?`
  String get whyReportingThis {
    return Intl.message(
      'Why are you reporting this?',
      name: 'whyReportingThis',
      desc: 'Why reporting question',
      args: [],
    );
  }

  /// `Additional Details`
  String get additionalDetailsOptional {
    return Intl.message(
      'Additional Details',
      name: 'additionalDetailsOptional',
      desc: 'Additional details title',
      args: [],
    );
  }

  /// `Reason selected: {reason}`
  String reasonSelected(String reason) {
    return Intl.message(
      'Reason selected: $reason',
      name: 'reasonSelected',
      desc: 'Display selected reason',
      args: [reason],
    );
  }

  /// `None selected`
  String get noneSelected {
    return Intl.message(
      'None selected',
      name: 'noneSelected',
      desc: 'No reason selected',
      args: [],
    );
  }

  /// `Type`
  String get typeLabel {
    return Intl.message(
      'Type',
      name: 'typeLabel',
      desc: 'Report type label',
      args: [],
    );
  }

  /// `Category`
  String get categoryLabel {
    return Intl.message(
      'Category',
      name: 'categoryLabel',
      desc: 'Report category label',
      args: [],
    );
  }

  /// `Title`
  String get titleOptional {
    return Intl.message(
      'Title',
      name: 'titleOptional',
      desc: 'Report title label',
      args: [],
    );
  }

  /// `Enter a brief title for your report`
  String get briefTitleForReport {
    return Intl.message(
      'Enter a brief title for your report',
      name: 'briefTitleForReport',
      desc: 'Report title hint',
      args: [],
    );
  }

  /// `Description`
  String get descriptionOptional {
    return Intl.message(
      'Description',
      name: 'descriptionOptional',
      desc: 'Report description label',
      args: [],
    );
  }

  /// `Provide more details about the issue`
  String get provideMoreDetails {
    return Intl.message(
      'Provide more details about the issue',
      name: 'provideMoreDetails',
      desc: 'Report description hint',
      args: [],
    );
  }

  /// `Thank you for your report!`
  String get thankYouForReport {
    return Intl.message(
      'Thank you for your report!',
      name: 'thankYouForReport',
      desc: 'Thank you for reporting message',
      args: [],
    );
  }

  /// `Our team will review and take action as soon as possible.`
  String get teamWillReview {
    return Intl.message(
      'Our team will review and take action as soon as possible.',
      name: 'teamWillReview',
      desc: 'Team will review message',
      args: [],
    );
  }

  /// `Go Back`
  String get goBack {
    return Intl.message(
      'Go Back',
      name: 'goBack',
      desc: 'Go back button',
      args: [],
    );
  }

  /// `Products`
  String get reportTypeProducts {
    return Intl.message(
      'Products',
      name: 'reportTypeProducts',
      desc: 'Report type for products',
      args: [],
    );
  }

  /// `Feeds`
  String get reportTypeFeeds {
    return Intl.message(
      'Feeds',
      name: 'reportTypeFeeds',
      desc: 'Report type for feeds',
      args: [],
    );
  }

  /// `Comments`
  String get reportTypeComments {
    return Intl.message(
      'Comments',
      name: 'reportTypeComments',
      desc: 'Report type for comments',
      args: [],
    );
  }

  /// `Other`
  String get reportTypeOther {
    return Intl.message(
      'Other',
      name: 'reportTypeOther',
      desc: 'Report type for other',
      args: [],
    );
  }

  /// `General report`
  String get reportCategoryGeneral {
    return Intl.message(
      'General report',
      name: 'reportCategoryGeneral',
      desc: 'General report category',
      args: [],
    );
  }

  /// `Bug report`
  String get reportCategoryBug {
    return Intl.message(
      'Bug report',
      name: 'reportCategoryBug',
      desc: 'Bug report category',
      args: [],
    );
  }

  /// `Feature request`
  String get reportCategoryFeature {
    return Intl.message(
      'Feature request',
      name: 'reportCategoryFeature',
      desc: 'Feature request category',
      args: [],
    );
  }

  /// `Complaint`
  String get reportCategoryComplaint {
    return Intl.message(
      'Complaint',
      name: 'reportCategoryComplaint',
      desc: 'Complaint category',
      args: [],
    );
  }

  /// `Low`
  String get reportPriorityLow {
    return Intl.message(
      'Low',
      name: 'reportPriorityLow',
      desc: 'Low priority level',
      args: [],
    );
  }

  /// `Medium`
  String get reportPriorityMedium {
    return Intl.message(
      'Medium',
      name: 'reportPriorityMedium',
      desc: 'Medium priority level',
      args: [],
    );
  }

  /// `High`
  String get reportPriorityHigh {
    return Intl.message(
      'High',
      name: 'reportPriorityHigh',
      desc: 'High priority level',
      args: [],
    );
  }

  /// `Urgent`
  String get reportPriorityUrgent {
    return Intl.message(
      'Urgent',
      name: 'reportPriorityUrgent',
      desc: 'Urgent priority level',
      args: [],
    );
  }

  /// `The skin analysis result is inaccurate or incorrect`
  String get reportReasonInaccurateAnalysis {
    return Intl.message(
      'The skin analysis result is inaccurate or incorrect',
      name: 'reportReasonInaccurateAnalysis',
      desc: 'Reason: Inaccurate analysis',
      args: [],
    );
  }

  /// `Inappropriate or harmful medical advice was provided`
  String get reportReasonInappropriateMedicalAdvice {
    return Intl.message(
      'Inappropriate or harmful medical advice was provided',
      name: 'reportReasonInappropriateMedicalAdvice',
      desc: 'Reason: Inappropriate medical advice',
      args: [],
    );
  }

  /// `There is a technical bug or error in the app`
  String get reportReasonTechnicalBug {
    return Intl.message(
      'There is a technical bug or error in the app',
      name: 'reportReasonTechnicalBug',
      desc: 'Reason: Technical bug',
      args: [],
    );
  }

  /// `Inappropriate content in AI chat responses`
  String get reportReasonInappropriateChatContent {
    return Intl.message(
      'Inappropriate content in AI chat responses',
      name: 'reportReasonInappropriateChatContent',
      desc: 'Reason: Inappropriate chat content',
      args: [],
    );
  }

  /// `Privacy or personal data security concern`
  String get reportReasonPrivacyDataConcern {
    return Intl.message(
      'Privacy or personal data security concern',
      name: 'reportReasonPrivacyDataConcern',
      desc: 'Reason: Privacy concern',
      args: [],
    );
  }

  /// `Spam or unwanted advertisement content`
  String get reportReasonSpamAdvertisement {
    return Intl.message(
      'Spam or unwanted advertisement content',
      name: 'reportReasonSpamAdvertisement',
      desc: 'Reason: Spam or advertisement',
      args: [],
    );
  }

  /// `Offensive or inappropriate language`
  String get reportReasonOffensiveLanguage {
    return Intl.message(
      'Offensive or inappropriate language',
      name: 'reportReasonOffensiveLanguage',
      desc: 'Reason: Offensive language',
      args: [],
    );
  }

  /// `Misleading or false health information`
  String get reportReasonMisleadingInformation {
    return Intl.message(
      'Misleading or false health information',
      name: 'reportReasonMisleadingInformation',
      desc: 'Reason: Misleading information',
      args: [],
    );
  }

  /// `App crashes, slow performance, or functionality issues`
  String get reportReasonAppPerformanceIssue {
    return Intl.message(
      'App crashes, slow performance, or functionality issues',
      name: 'reportReasonAppPerformanceIssue',
      desc: 'Reason: App performance issue',
      args: [],
    );
  }

  /// `Other issue not listed above`
  String get reportReasonOther {
    return Intl.message(
      'Other issue not listed above',
      name: 'reportReasonOther',
      desc: 'Reason: Other',
      args: [],
    );
  }

  /// `Report Issue`
  String get reportIssue {
    return Intl.message(
      'Report Issue',
      name: 'reportIssue',
      desc: 'Report issue button',
      args: [],
    );
  }

  /// `Report bugs or inappropriate content`
  String get reportBugsOrInappropriateContent {
    return Intl.message(
      'Report bugs or inappropriate content',
      name: 'reportBugsOrInappropriateContent',
      desc: 'Report description',
      args: [],
    );
  }

  /// `Report Products Issue`
  String get reportProductsIssue {
    return Intl.message(
      'Report Products Issue',
      name: 'reportProductsIssue',
      desc: 'Report products issue title',
      args: [],
    );
  }

  /// `Report Feeds Issue`
  String get reportFeedsIssue {
    return Intl.message(
      'Report Feeds Issue',
      name: 'reportFeedsIssue',
      desc: 'Report feeds issue title',
      args: [],
    );
  }

  /// `Report Comments Issue`
  String get reportCommentsIssue {
    return Intl.message(
      'Report Comments Issue',
      name: 'reportCommentsIssue',
      desc: 'Report comments issue title',
      args: [],
    );
  }

  /// `AI Chat Message Issue`
  String get aiChatMessageIssue {
    return Intl.message(
      'AI Chat Message Issue',
      name: 'aiChatMessageIssue',
      desc: 'AI chat message issue title',
      args: [],
    );
  }

  /// `Technical Bug Report`
  String get technicalBugReport {
    return Intl.message(
      'Technical Bug Report',
      name: 'technicalBugReport',
      desc: 'Technical bug report title',
      args: [],
    );
  }

  /// `Message ID`
  String get messageId {
    return Intl.message(
      'Message ID',
      name: 'messageId',
      desc: 'Message ID label',
      args: [],
    );
  }

  /// `Message content`
  String get messageContent {
    return Intl.message(
      'Message content',
      name: 'messageContent',
      desc: 'Message content label',
      args: [],
    );
  }

  /// `Chat ID`
  String get chatId {
    return Intl.message(
      'Chat ID',
      name: 'chatId',
      desc: 'Chat ID label',
      args: [],
    );
  }

  /// `User Profile`
  String get userProfile {
    return Intl.message(
      'User Profile',
      name: 'userProfile',
      desc: 'User profile title',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: 'Follow button',
      args: [],
    );
  }

  /// `Unfollow`
  String get unfollow {
    return Intl.message(
      'Unfollow',
      name: 'unfollow',
      desc: 'Unfollow button',
      args: [],
    );
  }

  /// `Public Profile`
  String get publicProfile {
    return Intl.message(
      'Public Profile',
      name: 'publicProfile',
      desc: 'Public profile label',
      args: [],
    );
  }

  /// `Private Profile`
  String get privateProfile {
    return Intl.message(
      'Private Profile',
      name: 'privateProfile',
      desc: 'Private profile label',
      args: [],
    );
  }

  /// `Toggle Profile Visibility`
  String get toggleProfileVisibility {
    return Intl.message(
      'Toggle Profile Visibility',
      name: 'toggleProfileVisibility',
      desc: 'Toggle profile visibility button',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message('Posts', name: 'posts', desc: 'Posts label', args: []);
  }

  /// `No posts yet`
  String get noPostsYet {
    return Intl.message(
      'No posts yet',
      name: 'noPostsYet',
      desc: 'No posts message',
      args: [],
    );
  }

  /// `Loading user information...`
  String get loadingUserInfo {
    return Intl.message(
      'Loading user information...',
      name: 'loadingUserInfo',
      desc: 'Loading user info message',
      args: [],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: 'User not found message',
      args: [],
    );
  }

  /// `This profile is private`
  String get profileIsPrivate {
    return Intl.message(
      'This profile is private',
      name: 'profileIsPrivate',
      desc: 'Private profile message',
      args: [],
    );
  }

  /// `My Posts`
  String get profileMyPosts {
    return Intl.message(
      'My Posts',
      name: 'profileMyPosts',
      desc: 'User posts section title',
      args: [],
    );
  }

  /// `No posts yet`
  String get profileNoPostsYet {
    return Intl.message(
      'No posts yet',
      name: 'profileNoPostsYet',
      desc: 'No posts in profile message',
      args: [],
    );
  }

  /// `Load More`
  String get profileLoadMore {
    return Intl.message(
      'Load More',
      name: 'profileLoadMore',
      desc: 'Load more posts button',
      args: [],
    );
  }

  /// `Posts`
  String get activityTabPosts {
    return Intl.message(
      'Posts',
      name: 'activityTabPosts',
      desc: 'Posts tab in profile',
      args: [],
    );
  }

  /// `Activity`
  String get activityTabActivity {
    return Intl.message(
      'Activity',
      name: 'activityTabActivity',
      desc: 'Activity tab in profile',
      args: [],
    );
  }

  /// `Posts`
  String get activityTypePosts {
    return Intl.message(
      'Posts',
      name: 'activityTypePosts',
      desc: 'Activity type: Posts',
      args: [],
    );
  }

  /// `Comments`
  String get activityTypeComments {
    return Intl.message(
      'Comments',
      name: 'activityTypeComments',
      desc: 'Activity type: Comments',
      args: [],
    );
  }

  /// `Post`
  String get activityTypePost {
    return Intl.message(
      'Post',
      name: 'activityTypePost',
      desc: 'Type label: Post',
      args: [],
    );
  }

  /// `Comment`
  String get activityTypeComment {
    return Intl.message(
      'Comment',
      name: 'activityTypeComment',
      desc: 'Type label: Comment',
      args: [],
    );
  }

  /// `All`
  String get activityAll {
    return Intl.message(
      'All',
      name: 'activityAll',
      desc: 'Activity filter: All',
      args: [],
    );
  }

  /// `Likes`
  String get activityLikes {
    return Intl.message(
      'Likes',
      name: 'activityLikes',
      desc: 'Activity filter: Likes',
      args: [],
    );
  }

  /// `Saved`
  String get activitySaves {
    return Intl.message(
      'Saved',
      name: 'activitySaves',
      desc: 'Activity filter: Saved',
      args: [],
    );
  }

  /// `Shares`
  String get activityShares {
    return Intl.message(
      'Shares',
      name: 'activityShares',
      desc: 'Activity filter: Shares',
      args: [],
    );
  }

  /// `Comments`
  String get activityComments {
    return Intl.message(
      'Comments',
      name: 'activityComments',
      desc: 'Activity filter: Comments',
      args: [],
    );
  }

  /// `Liked`
  String get activityLiked {
    return Intl.message(
      'Liked',
      name: 'activityLiked',
      desc: 'Activity label: Liked',
      args: [],
    );
  }

  /// `Disliked`
  String get activityDisliked {
    return Intl.message(
      'Disliked',
      name: 'activityDisliked',
      desc: 'Activity label: Disliked',
      args: [],
    );
  }

  /// `Saved`
  String get activitySaved {
    return Intl.message(
      'Saved',
      name: 'activitySaved',
      desc: 'Activity label: Saved',
      args: [],
    );
  }

  /// `Shared`
  String get activityShared {
    return Intl.message(
      'Shared',
      name: 'activityShared',
      desc: 'Activity label: Shared',
      args: [],
    );
  }

  /// `Commented`
  String get activityCommented {
    return Intl.message(
      'Commented',
      name: 'activityCommented',
      desc: 'Activity label: Commented',
      args: [],
    );
  }

  /// `Liked Comment`
  String get activityLikedComment {
    return Intl.message(
      'Liked Comment',
      name: 'activityLikedComment',
      desc: 'Activity label: Liked comment',
      args: [],
    );
  }

  /// `Disliked Comment`
  String get activityDislikedComment {
    return Intl.message(
      'Disliked Comment',
      name: 'activityDislikedComment',
      desc: 'Activity label: Disliked comment',
      args: [],
    );
  }

  /// `No activities yet`
  String get activityNoInteractions {
    return Intl.message(
      'No activities yet',
      name: 'activityNoInteractions',
      desc: 'No activities message',
      args: [],
    );
  }

  /// `Info`
  String get profileTabInfo {
    return Intl.message(
      'Info',
      name: 'profileTabInfo',
      desc: 'Info tab in profile',
      args: [],
    );
  }

  /// `Content`
  String get profileTabContent {
    return Intl.message(
      'Content',
      name: 'profileTabContent',
      desc: 'Content tab in profile',
      args: [],
    );
  }

  /// `Today's Selection`
  String get selectionDuJour {
    return Intl.message(
      'Today\'s Selection',
      name: 'selectionDuJour',
      desc: 'Daily selection section title',
      args: [],
    );
  }

  /// `New Arrivals`
  String get nouveautes {
    return Intl.message(
      'New Arrivals',
      name: 'nouveautes',
      desc: 'New arrivals section title',
      args: [],
    );
  }

  /// `Face Routines`
  String get routinesVisage {
    return Intl.message(
      'Face Routines',
      name: 'routinesVisage',
      desc: 'Face routines section title',
      args: [],
    );
  }

  /// `Best Sellers`
  String get topVentes {
    return Intl.message(
      'Best Sellers',
      name: 'topVentes',
      desc: 'Best sellers section title',
      args: [],
    );
  }

  /// `Complexion`
  String get leTeint {
    return Intl.message(
      'Complexion',
      name: 'leTeint',
      desc: 'Makeup section title',
      args: [],
    );
  }

  /// `Featured Serum`
  String get serumNoiBat {
    return Intl.message(
      'Featured Serum',
      name: 'serumNoiBat',
      desc: 'Featured serum section title',
      args: [],
    );
  }

  /// `Exfoliant`
  String get exfoliant {
    return Intl.message(
      'Exfoliant',
      name: 'exfoliant',
      desc: 'Exfoliant section title',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: 'See all button',
      args: [],
    );
  }

  /// `Sensitive Skin`
  String get peauSensible {
    return Intl.message(
      'Sensitive Skin',
      name: 'peauSensible',
      desc: 'Filter for sensitive skin',
      args: [],
    );
  }

  /// `Normal Skin`
  String get peauNormale {
    return Intl.message(
      'Normal Skin',
      name: 'peauNormale',
      desc: 'Filter for normal skin',
      args: [],
    );
  }

  /// `Oily Skin`
  String get peauGrasse {
    return Intl.message(
      'Oily Skin',
      name: 'peauGrasse',
      desc: 'Filter for oily skin',
      args: [],
    );
  }

  /// `Pamper Your Skin`
  String get comblezVotrePeau {
    return Intl.message(
      'Pamper Your Skin',
      name: 'comblezVotrePeau',
      desc: 'Text on routines visage banner',
      args: [],
    );
  }

  /// `Camera Access Needed`
  String get cameraAccessNeeded {
    return Intl.message(
      'Camera Access Needed',
      name: 'cameraAccessNeeded',
      desc: 'Title for camera permission dialog',
      args: [],
    );
  }

  /// `To use the camera for skincare product scanning, please enable camera access in your device settings`
  String get cameraAccessMessage {
    return Intl.message(
      'To use the camera for skincare product scanning, please enable camera access in your device settings',
      name: 'cameraAccessMessage',
      desc: 'Message requesting camera permission',
      args: [],
    );
  }

  /// `To start scanning skincare products, please enable camera access.`
  String get cameraRequestMessage {
    return Intl.message(
      'To start scanning skincare products, please enable camera access.',
      name: 'cameraRequestMessage',
      desc: 'Message requesting camera permission when not granted',
      args: [],
    );
  }

  /// `Gallery Access Needed`
  String get galleryAccessNeeded {
    return Intl.message(
      'Gallery Access Needed',
      name: 'galleryAccessNeeded',
      desc: 'Title for gallery permission dialog',
      args: [],
    );
  }

  /// `To use the gallery for skincare product scanning, please enable gallery access in your device settings`
  String get galleryAccessMessage {
    return Intl.message(
      'To use the gallery for skincare product scanning, please enable gallery access in your device settings',
      name: 'galleryAccessMessage',
      desc: 'Message requesting gallery permission',
      args: [],
    );
  }

  /// `Enable Camera`
  String get buttonEnableCamera {
    return Intl.message(
      'Enable Camera',
      name: 'buttonEnableCamera',
      desc: 'Enable camera button',
      args: [],
    );
  }

  /// `Crop Image`
  String get cropImage {
    return Intl.message(
      'Crop Image',
      name: 'cropImage',
      desc: 'Title for crop image dialog',
      args: [],
    );
  }

  /// `Image captured successfully, please wait for the result`
  String get imageCapturedSuccess {
    return Intl.message(
      'Image captured successfully, please wait for the result',
      name: 'imageCapturedSuccess',
      desc: 'Success message for image capture',
      args: [],
    );
  }

  /// `Scan Product`
  String get scanProduct {
    return Intl.message(
      'Scan Product',
      name: 'scanProduct',
      desc: 'Title for scan product screen',
      args: [],
    );
  }

  /// `Move the camera to scan barcodes or identify products.`
  String get scanProductSubtitle {
    return Intl.message(
      'Move the camera to scan barcodes or identify products.',
      name: 'scanProductSubtitle',
      desc: 'Description for scan product instructions',
      args: [],
    );
  }

  /// `Analyze Skin`
  String get analyzeSkin {
    return Intl.message(
      'Analyze Skin',
      name: 'analyzeSkin',
      desc: 'Option for skin analysis',
      args: [],
    );
  }

  /// `Keep your face in the frame`
  String get keepYourFaceInFrame {
    return Intl.message(
      'Keep your face in the frame',
      name: 'keepYourFaceInFrame',
      desc: 'Instruction to keep face in frame for skin analysis',
      args: [],
    );
  }

  /// `Make sure there is enough light and remove glasses for an accurate scan.`
  String get analyzeSkinInstruction {
    return Intl.message(
      'Make sure there is enough light and remove glasses for an accurate scan.',
      name: 'analyzeSkinInstruction',
      desc: 'Detailed instruction for skin analysis',
      args: [],
    );
  }

  /// `Discover Products`
  String get discoverProducts {
    return Intl.message(
      'Discover Products',
      name: 'discoverProducts',
      desc: 'Title for product discovery screen',
      args: [],
    );
  }

  /// `Search product name, brand...`
  String get searchProductPlaceholder {
    return Intl.message(
      'Search product name, brand...',
      name: 'searchProductPlaceholder',
      desc: 'Placeholder for product search field',
      args: [],
    );
  }

  /// `Product Type`
  String get productType {
    return Intl.message(
      'Product Type',
      name: 'productType',
      desc: 'Product type filter',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message('Brand', name: 'brand', desc: 'Brand filter', args: []);
  }

  /// `Skin Problem`
  String get skinProblem {
    return Intl.message(
      'Skin Problem',
      name: 'skinProblem',
      desc: 'Skin problem filter',
      args: [],
    );
  }

  /// `Sort`
  String get sort {
    return Intl.message('Sort', name: 'sort', desc: 'Sort button', args: []);
  }

  /// `All`
  String get filterAll {
    return Intl.message(
      'All',
      name: 'filterAll',
      desc: '\'All\' option for filter',
      args: [],
    );
  }

  /// `Routine Phase`
  String get filterLabelPhase {
    return Intl.message(
      'Routine Phase',
      name: 'filterLabelPhase',
      desc: 'Label for routine phase filter',
      args: [],
    );
  }

  /// `Step Type`
  String get filterLabelStepKey {
    return Intl.message(
      'Step Type',
      name: 'filterLabelStepKey',
      desc: 'Label for step type filter',
      args: [],
    );
  }

  /// `Recommended Frequency`
  String get filterLabelFrequency {
    return Intl.message(
      'Recommended Frequency',
      name: 'filterLabelFrequency',
      desc: 'Label for frequency filter',
      args: [],
    );
  }

  /// `Morning Usage (AM)`
  String get filterLabelAmUsage {
    return Intl.message(
      'Morning Usage (AM)',
      name: 'filterLabelAmUsage',
      desc: 'Label for morning usage filter',
      args: [],
    );
  }

  /// `Evening Usage (PM)`
  String get filterLabelPmUsage {
    return Intl.message(
      'Evening Usage (PM)',
      name: 'filterLabelPmUsage',
      desc: 'Label for evening usage filter',
      args: [],
    );
  }

  /// `Cleanse`
  String get filterOptionPhaseCleanse {
    return Intl.message(
      'Cleanse',
      name: 'filterOptionPhaseCleanse',
      desc: 'Cleanse option for phase filter',
      args: [],
    );
  }

  /// `Prep`
  String get filterOptionPhasePrep {
    return Intl.message(
      'Prep',
      name: 'filterOptionPhasePrep',
      desc: 'Prep option for phase filter',
      args: [],
    );
  }

  /// `Treat`
  String get filterOptionPhaseTreat {
    return Intl.message(
      'Treat',
      name: 'filterOptionPhaseTreat',
      desc: 'Treat option for phase filter',
      args: [],
    );
  }

  /// `Seal`
  String get filterOptionPhaseSeal {
    return Intl.message(
      'Seal',
      name: 'filterOptionPhaseSeal',
      desc: 'Seal option for phase filter',
      args: [],
    );
  }

  /// `Protect`
  String get filterOptionPhaseProtect {
    return Intl.message(
      'Protect',
      name: 'filterOptionPhaseProtect',
      desc: 'Protect option for phase filter',
      args: [],
    );
  }

  /// `Extras`
  String get filterOptionPhaseExtras {
    return Intl.message(
      'Extras',
      name: 'filterOptionPhaseExtras',
      desc: 'Extras option for phase filter',
      args: [],
    );
  }

  /// `Makeup Remover`
  String get filterOptionStepKeyMakeupRemover {
    return Intl.message(
      'Makeup Remover',
      name: 'filterOptionStepKeyMakeupRemover',
      desc: 'Makeup remover option for stepKey filter',
      args: [],
    );
  }

  /// `Cleanser`
  String get filterOptionStepKeyCleanser {
    return Intl.message(
      'Cleanser',
      name: 'filterOptionStepKeyCleanser',
      desc: 'Cleanser option for stepKey filter',
      args: [],
    );
  }

  /// `Toner`
  String get filterOptionStepKeyToner {
    return Intl.message(
      'Toner',
      name: 'filterOptionStepKeyToner',
      desc: 'Toner option for stepKey filter',
      args: [],
    );
  }

  /// `Essence`
  String get filterOptionStepKeyEssence {
    return Intl.message(
      'Essence',
      name: 'filterOptionStepKeyEssence',
      desc: 'Essence option for stepKey filter',
      args: [],
    );
  }

  /// `Serum`
  String get filterOptionStepKeySerum {
    return Intl.message(
      'Serum',
      name: 'filterOptionStepKeySerum',
      desc: 'Serum option for stepKey filter',
      args: [],
    );
  }

  /// `Spot Treatment`
  String get filterOptionStepKeyTreatmentSpot {
    return Intl.message(
      'Spot Treatment',
      name: 'filterOptionStepKeyTreatmentSpot',
      desc: 'Spot treatment option for stepKey filter',
      args: [],
    );
  }

  /// `Exfoliant`
  String get filterOptionStepKeyExfoliant {
    return Intl.message(
      'Exfoliant',
      name: 'filterOptionStepKeyExfoliant',
      desc: 'Exfoliant option for stepKey filter',
      args: [],
    );
  }

  /// `Retinoid Treatment`
  String get filterOptionStepKeyTreatmentRetinoid {
    return Intl.message(
      'Retinoid Treatment',
      name: 'filterOptionStepKeyTreatmentRetinoid',
      desc: 'Retinoid treatment option for stepKey filter',
      args: [],
    );
  }

  /// `Eye Treatment`
  String get filterOptionStepKeyEyeTreatment {
    return Intl.message(
      'Eye Treatment',
      name: 'filterOptionStepKeyEyeTreatment',
      desc: 'Eye treatment option for stepKey filter',
      args: [],
    );
  }

  /// `Mask Treatment`
  String get filterOptionStepKeyMaskTreatment {
    return Intl.message(
      'Mask Treatment',
      name: 'filterOptionStepKeyMaskTreatment',
      desc: 'Mask treatment option for stepKey filter',
      args: [],
    );
  }

  /// `Moisturizer`
  String get filterOptionStepKeyMoisturizer {
    return Intl.message(
      'Moisturizer',
      name: 'filterOptionStepKeyMoisturizer',
      desc: 'Moisturizer option for stepKey filter',
      args: [],
    );
  }

  /// `Occlusive / Face Oil`
  String get filterOptionStepKeyOcclusiveOrFaceOil {
    return Intl.message(
      'Occlusive / Face Oil',
      name: 'filterOptionStepKeyOcclusiveOrFaceOil',
      desc: 'Occlusive or face oil option for stepKey filter',
      args: [],
    );
  }

  /// `Sunscreen`
  String get filterOptionStepKeySunscreen {
    return Intl.message(
      'Sunscreen',
      name: 'filterOptionStepKeySunscreen',
      desc: 'Sunscreen option for stepKey filter',
      args: [],
    );
  }

  /// `Self Tan`
  String get filterOptionStepKeySelfTan {
    return Intl.message(
      'Self Tan',
      name: 'filterOptionStepKeySelfTan',
      desc: 'Self tan option for stepKey filter',
      args: [],
    );
  }

  /// `Sheet / Sleeping Mask`
  String get filterOptionStepKeyMaskSheetSleeping {
    return Intl.message(
      'Sheet / Sleeping Mask',
      name: 'filterOptionStepKeyMaskSheetSleeping',
      desc: 'Sheet or sleeping mask option for stepKey filter',
      args: [],
    );
  }

  /// `Lip Care`
  String get filterOptionStepKeyLipCare {
    return Intl.message(
      'Lip Care',
      name: 'filterOptionStepKeyLipCare',
      desc: 'Lip care option for stepKey filter',
      args: [],
    );
  }

  /// `Tool`
  String get filterOptionStepKeyTool {
    return Intl.message(
      'Tool',
      name: 'filterOptionStepKeyTool',
      desc: 'Tool option for stepKey filter',
      args: [],
    );
  }

  /// `Daily`
  String get filterOptionFrequencyDaily {
    return Intl.message(
      'Daily',
      name: 'filterOptionFrequencyDaily',
      desc: 'Daily option for frequency filter',
      args: [],
    );
  }

  /// `Weekly (1-3 times/week)`
  String get filterOptionFrequencyWeekly {
    return Intl.message(
      'Weekly (1-3 times/week)',
      name: 'filterOptionFrequencyWeekly',
      desc: 'Weekly option for frequency filter',
      args: [],
    );
  }

  /// `Occasionally`
  String get filterOptionFrequencyOccasionally {
    return Intl.message(
      'Occasionally',
      name: 'filterOptionFrequencyOccasionally',
      desc: 'Occasionally option for frequency filter',
      args: [],
    );
  }

  /// `Never`
  String get filterOptionAmUsageNever {
    return Intl.message(
      'Never',
      name: 'filterOptionAmUsageNever',
      desc: 'Never option for AM usage filter',
      args: [],
    );
  }

  /// `Avoid`
  String get filterOptionAmUsageAvoid {
    return Intl.message(
      'Avoid',
      name: 'filterOptionAmUsageAvoid',
      desc: 'Avoid option for AM usage filter',
      args: [],
    );
  }

  /// `Optional`
  String get filterOptionAmUsageOptional {
    return Intl.message(
      'Optional',
      name: 'filterOptionAmUsageOptional',
      desc: 'Optional option for AM usage filter',
      args: [],
    );
  }

  /// `Core`
  String get filterOptionAmUsageCore {
    return Intl.message(
      'Core',
      name: 'filterOptionAmUsageCore',
      desc: 'Core option for AM usage filter',
      args: [],
    );
  }

  /// `Never`
  String get filterOptionPmUsageNever {
    return Intl.message(
      'Never',
      name: 'filterOptionPmUsageNever',
      desc: 'Never option for PM usage filter',
      args: [],
    );
  }

  /// `Avoid`
  String get filterOptionPmUsageAvoid {
    return Intl.message(
      'Avoid',
      name: 'filterOptionPmUsageAvoid',
      desc: 'Avoid option for PM usage filter',
      args: [],
    );
  }

  /// `Optional`
  String get filterOptionPmUsageOptional {
    return Intl.message(
      'Optional',
      name: 'filterOptionPmUsageOptional',
      desc: 'Optional option for PM usage filter',
      args: [],
    );
  }

  /// `Core`
  String get filterOptionPmUsageCore {
    return Intl.message(
      'Core',
      name: 'filterOptionPmUsageCore',
      desc: 'Core option for PM usage filter',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: 'Product description section title',
      args: [],
    );
  }

  /// `Usage Information`
  String get usageInfo {
    return Intl.message(
      'Usage Information',
      name: 'usageInfo',
      desc: 'Product usage information section title',
      args: [],
    );
  }

  /// `Key Actives`
  String get keyActives {
    return Intl.message(
      'Key Actives',
      name: 'keyActives',
      desc: 'Key actives section title',
      args: [],
    );
  }

  /// `Highlighted Ingredients`
  String get highlightedIngredients {
    return Intl.message(
      'Highlighted Ingredients',
      name: 'highlightedIngredients',
      desc: 'Highlighted ingredients section title',
      args: [],
    );
  }

  /// `Detailed Ingredient List`
  String get detailedIngredientList {
    return Intl.message(
      'Detailed Ingredient List',
      name: 'detailedIngredientList',
      desc: 'Detailed ingredient list section title',
      args: [],
    );
  }

  /// `Phase`
  String get phase {
    return Intl.message(
      'Phase',
      name: 'phase',
      desc: 'Phase label in usage information',
      args: [],
    );
  }

  /// `Step`
  String get step {
    return Intl.message(
      'Step',
      name: 'step',
      desc: 'Step label in usage information',
      args: [],
    );
  }

  /// `AM Usage`
  String get amUsage {
    return Intl.message(
      'AM Usage',
      name: 'amUsage',
      desc: 'AM Usage label in usage information',
      args: [],
    );
  }

  /// `PM Usage`
  String get pmUsage {
    return Intl.message(
      'PM Usage',
      name: 'pmUsage',
      desc: 'PM Usage label in usage information',
      args: [],
    );
  }

  /// `Frequency`
  String get frequency {
    return Intl.message(
      'Frequency',
      name: 'frequency',
      desc: 'Frequency label in usage information',
      args: [],
    );
  }

  /// `Add to Routine`
  String get addToRoutine {
    return Intl.message(
      'Add to Routine',
      name: 'addToRoutine',
      desc: 'Button to add product to routine',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: 'Product overview tab',
      args: [],
    );
  }

  /// `Key Ingredients`
  String get keyIngredients {
    return Intl.message(
      'Key Ingredients',
      name: 'keyIngredients',
      desc: 'Key ingredients tab',
      args: [],
    );
  }

  /// `Detailed Ingredients`
  String get detailedIngredients {
    return Intl.message(
      'Detailed Ingredients',
      name: 'detailedIngredients',
      desc: 'Detailed ingredients tab',
      args: [],
    );
  }

  /// `No detailed ingredient information`
  String get noDetailedIngredientInfo {
    return Intl.message(
      'No detailed ingredient information',
      name: 'noDetailedIngredientInfo',
      desc: 'Message when there is no detailed ingredient information',
      args: [],
    );
  }

  /// `Ingredient`
  String get ingredient {
    return Intl.message(
      'Ingredient',
      name: 'ingredient',
      desc: 'Ingredient label',
      args: [],
    );
  }

  /// `Functions`
  String get functions {
    return Intl.message(
      'Functions',
      name: 'functions',
      desc: 'Ingredient functions label',
      args: [],
    );
  }

  /// `Irritancy`
  String get irritancy {
    return Intl.message(
      'Irritancy',
      name: 'irritancy',
      desc: 'Irritancy level label',
      args: [],
    );
  }

  /// `Comedogenicity`
  String get comedogenicity {
    return Intl.message(
      'Comedogenicity',
      name: 'comedogenicity',
      desc: 'Comedogenicity level label',
      args: [],
    );
  }

  /// `Also Called`
  String get alsoCalled {
    return Intl.message(
      'Also Called',
      name: 'alsoCalled',
      desc: 'Alternative name label for ingredient',
      args: [],
    );
  }

  /// `What it does:`
  String get whatItDoes {
    return Intl.message(
      'What it does:',
      name: 'whatItDoes',
      desc: 'Label for ingredient functions (what it does)',
      args: [],
    );
  }

  /// `No key ingredient information`
  String get noKeyIngredientInfo {
    return Intl.message(
      'No key ingredient information',
      name: 'noKeyIngredientInfo',
      desc: 'Message when there is no key ingredient information',
      args: [],
    );
  }

  /// `Active Ingredient`
  String get activeIngredient {
    return Intl.message(
      'Active Ingredient',
      name: 'activeIngredient',
      desc: 'Active ingredient label',
      args: [],
    );
  }

  /// `Routine Management`
  String get routineManagement {
    return Intl.message(
      'Routine Management',
      name: 'routineManagement',
      desc: 'Routine management page title',
      args: [],
    );
  }

  /// `Calendar`
  String get routineCalendar {
    return Intl.message(
      'Calendar',
      name: 'routineCalendar',
      desc: 'Calendar section title',
      args: [],
    );
  }

  /// `Month`
  String get routineMonth {
    return Intl.message(
      'Month',
      name: 'routineMonth',
      desc: 'Month view button label',
      args: [],
    );
  }

  /// `Month {month}, {year}`
  String routineMonthYear(int month, int year) {
    return Intl.message(
      'Month $month, $year',
      name: 'routineMonthYear',
      desc: 'Display month and year',
      args: [month, year],
    );
  }

  /// `My Routines`
  String get routineMyRoutines {
    return Intl.message(
      'My Routines',
      name: 'routineMyRoutines',
      desc: 'My routines section title',
      args: [],
    );
  }

  /// `Morning Skincare`
  String get routineMorningCare {
    return Intl.message(
      'Morning Skincare',
      name: 'routineMorningCare',
      desc: 'Morning routine name',
      args: [],
    );
  }

  /// `Evening Hydration Routine`
  String get routineEveningCare {
    return Intl.message(
      'Evening Hydration Routine',
      name: 'routineEveningCare',
      desc: 'Evening routine name',
      args: [],
    );
  }

  /// `{count} steps`
  String routineStepsCount(int count) {
    return Intl.message(
      '$count steps',
      name: 'routineStepsCount',
      desc: 'Number of steps in routine',
      args: [count],
    );
  }

  /// `Your Progress`
  String get routineYourProgress {
    return Intl.message(
      'Your Progress',
      name: 'routineYourProgress',
      desc: 'Progress section title',
      args: [],
    );
  }

  /// `Completion Streak`
  String get routineStreakDays {
    return Intl.message(
      'Completion Streak',
      name: 'routineStreakDays',
      desc: 'Completion streak label',
      args: [],
    );
  }

  /// `{days} days`
  String routineDaysCount(int days) {
    return Intl.message(
      '$days days',
      name: 'routineDaysCount',
      desc: 'Number of days',
      args: [days],
    );
  }

  /// `You're doing great! Completed {completed}/{total} routines this week.`
  String routineProgressMessage(int completed, int total) {
    return Intl.message(
      'You\'re doing great! Completed $completed/$total routines this week.',
      name: 'routineProgressMessage',
      desc: 'Motivational progress message',
      args: [completed, total],
    );
  }

  /// `Featured Routine`
  String get routineFeatured {
    return Intl.message(
      'Featured Routine',
      name: 'routineFeatured',
      desc: 'Featured routine section title',
      args: [],
    );
  }

  /// `"Glass Skin" Routine`
  String get routineGlassSkin {
    return Intl.message(
      '"Glass Skin" Routine',
      name: 'routineGlassSkin',
      desc: 'Glass Skin routine name',
      args: [],
    );
  }

  /// `Achieve luminous, radiant skin.`
  String get routineGlassSkinDesc {
    return Intl.message(
      'Achieve luminous, radiant skin.',
      name: 'routineGlassSkinDesc',
      desc: 'Glass Skin routine description',
      args: [],
    );
  }

  /// `Recommendations for {skinType} skin`
  String routineRecommendationsFor(String skinType) {
    return Intl.message(
      'Recommendations for $skinType skin',
      name: 'routineRecommendationsFor',
      desc: 'Recommendations section title by skin type',
      args: [skinType],
    );
  }

  /// `Oil Control`
  String get routineOilControl {
    return Intl.message(
      'Oil Control',
      name: 'routineOilControl',
      desc: 'Oil control routine name',
      args: [],
    );
  }

  /// `Pore Cleansing`
  String get routinePoreCleansing {
    return Intl.message(
      'Pore Cleansing',
      name: 'routinePoreCleansing',
      desc: 'Pore cleansing routine name',
      args: [],
    );
  }

  /// `Mon`
  String get routineMonday {
    return Intl.message(
      'Mon',
      name: 'routineMonday',
      desc: 'Monday abbreviation',
      args: [],
    );
  }

  /// `Tue`
  String get routineTuesday {
    return Intl.message(
      'Tue',
      name: 'routineTuesday',
      desc: 'Tuesday abbreviation',
      args: [],
    );
  }

  /// `Wed`
  String get routineWednesday {
    return Intl.message(
      'Wed',
      name: 'routineWednesday',
      desc: 'Wednesday abbreviation',
      args: [],
    );
  }

  /// `Thu`
  String get routineThursday {
    return Intl.message(
      'Thu',
      name: 'routineThursday',
      desc: 'Thursday abbreviation',
      args: [],
    );
  }

  /// `Fri`
  String get routineFriday {
    return Intl.message(
      'Fri',
      name: 'routineFriday',
      desc: 'Friday abbreviation',
      args: [],
    );
  }

  /// `Sat`
  String get routineSaturday {
    return Intl.message(
      'Sat',
      name: 'routineSaturday',
      desc: 'Saturday abbreviation',
      args: [],
    );
  }

  /// `Sun`
  String get routineSunday {
    return Intl.message(
      'Sun',
      name: 'routineSunday',
      desc: 'Sunday abbreviation',
      args: [],
    );
  }

  /// `Start`
  String get routinePlay {
    return Intl.message(
      'Start',
      name: 'routinePlay',
      desc: 'Start routine button',
      args: [],
    );
  }

  /// `Add New Routine`
  String get routineAddNew {
    return Intl.message(
      'Add New Routine',
      name: 'routineAddNew',
      desc: 'Add new routine button',
      args: [],
    );
  }

  /// `Week`
  String get routineWeek {
    return Intl.message(
      'Week',
      name: 'routineWeek',
      desc: 'Week view button label',
      args: [],
    );
  }

  /// `{startDate} - {endDate} {month}`
  String routineWeekRange(int startDate, int endDate, String month) {
    return Intl.message(
      '$startDate - $endDate $month',
      name: 'routineWeekRange',
      desc: 'Display week range',
      args: [startDate, endDate, month],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
