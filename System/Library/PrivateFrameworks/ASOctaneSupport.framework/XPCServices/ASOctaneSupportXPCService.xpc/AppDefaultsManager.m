@interface AppDefaultsManager
+ (BOOL)_BOOLForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(BOOL)a5;
+ (BOOL)allowPurchaseRequestData;
+ (BOOL)alwaysUseLegacyAPIForStoreKitProductsRequest;
+ (BOOL)externalPurchaseSpringBoardAppDeleteAlertEnabled;
+ (BOOL)keepTemporaryFiles;
+ (BOOL)marketingDemoModeEnabled;
+ (NSArray)ocelotApps;
+ (NSDictionary)transporterConfiguration;
+ (void)setExternalPurchaseSpringBoardAppDeleteAlertEnabled:(BOOL)a3;
+ (void)setOcelotApps:(id)a3;
+ (void)setTransporterConfiguration:(id)a3;
@end

@implementation AppDefaultsManager

+ (BOOL)keepTemporaryFiles
{
  return CFPreferencesGetAppBooleanValue(@"KeepTemporaryFiles", @"com.apple.appstored", 0LL) != 0;
}

+ (BOOL)marketingDemoModeEnabled
{
  return CFPreferencesGetAppBooleanValue(@"MarketingDemoMode", @"com.apple.appstored", 0LL) != 0;
}

+ (NSArray)ocelotApps
{
  return (NSArray *)(id)CFPreferencesCopyAppValue( @"BeagleApps",  @"com.apple.appstored");
}

+ (void)setOcelotApps:(id)a3
{
}

+ (BOOL)allowPurchaseRequestData
{
  BOOL v2 = CFPreferencesGetAppBooleanValue(@"AllowStoreKitPaymentRequestData", @"com.apple.appstored", 0LL) != 0;
  return (CFPreferencesGetAppBooleanValue( @"AllowStoreKitPaymentWithRequestDataWithoutEntitlement",  @"com.apple.itunesstored",  0LL) | v2) != 0;
}

+ (BOOL)alwaysUseLegacyAPIForStoreKitProductsRequest
{
  return CFPreferencesGetAppBooleanValue(@"UseLegacyAPIForSKProductRequest", @"com.apple.appstored", 0LL) != 0;
}

+ (BOOL)externalPurchaseSpringBoardAppDeleteAlertEnabled
{
  return _[a1 _BOOLForKey:@"ExternalPurchasesSpringBoardAppDeleteIsEnabled" applicationId:@"com.apple.appstored" ifMissing:1];
}

+ (void)setExternalPurchaseSpringBoardAppDeleteAlertEnabled:(BOOL)a3
{
  v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a3) {
    v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"ExternalPurchasesSpringBoardAppDeleteIsEnabled", *v3, @"com.apple.appstored");
  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

+ (void)setTransporterConfiguration:(id)a3
{
}

+ (NSDictionary)transporterConfiguration
{
  return (NSDictionary *)(id)CFPreferencesCopyAppValue( @"TransporterConfiguration",  @"com.apple.appstored");
}

+ (BOOL)_BOOLForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(BOOL)a5
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v6 = CFPreferencesGetAppBooleanValue(a3, a4, &keyExistsAndHasValidFormat) == 1;
  if (keyExistsAndHasValidFormat == 1) {
    return v6;
  }
  else {
    return a5;
  }
}

@end