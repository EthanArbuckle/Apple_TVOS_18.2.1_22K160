@interface AppDefaultsManager
+ (BOOL)_BOOLForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(BOOL)a5;
+ (BOOL)allowPurchaseRequestData;
+ (BOOL)alwaysUseLegacyAPIForStoreKitProductsRequest;
+ (BOOL)externalPurchaseSpringBoardAppDeleteAlertEnabled;
+ (BOOL)keepTemporaryFiles;
+ (BOOL)marketingDemoModeEnabled;
+ (NSArray)ocelotApps;
+ (NSDictionary)transporterConfiguration;
+ (const)kSKUserDefaultsIdentifier;
+ (id)databaseEncryptionKeyForIdentifier:(id)a3;
+ (void)deleteDatabaseEncryptionKeyForIdentifier:(id)a3;
+ (void)setDatabaseEncryptionKey:(id)a3 forIdentifier:(id)a4;
+ (void)setExternalPurchaseSpringBoardAppDeleteAlertEnabled:(BOOL)a3;
+ (void)setKSKUserDefaultsIdentifier:(const __CFString *)a3;
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

+ (const)kSKUserDefaultsIdentifier
{
  return (const __CFString *)sub_1000C6E3C();
}

+ (void)setKSKUserDefaultsIdentifier:(const __CFString *)a3
{
}

+ (id)databaseEncryptionKeyForIdentifier:(id)a3
{
  uint64_t v4 = v3;
  uint64_t v5 = sub_1000C6EF8();
  unint64_t v7 = v6;
  swift_bridgeObjectRelease(v4);
  if (v7 >> 60 == 15)
  {
    Class isa = 0LL;
  }

  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10009BE78(v5, v7);
  }

  return isa;
}

+ (void)setDatabaseEncryptionKey:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  uint64_t v12 = v11;

  sub_1000C7320();
  swift_bridgeObjectRelease(v12);
  sub_10007F054(v8, v10);
}

+ (void)deleteDatabaseEncryptionKeyForIdentifier:(id)a3
{
  uint64_t v4 = v3;
  sub_1000C7478();
  swift_bridgeObjectRelease(v4);
}

@end