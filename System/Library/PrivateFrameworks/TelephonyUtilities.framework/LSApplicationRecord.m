@interface LSApplicationRecord
+ (id)csd_applicationRecordForApplicationIdentifier:(id)a3;
+ (id)csd_applicationRecordForBundleIdentifier:(id)a3;
- (BOOL)csd_hasVoIPBackgroundMode;
- (BOOL)csd_hasVoIPNetworkExtensionEntitlement;
@end

@implementation LSApplicationRecord

+ (id)csd_applicationRecordForApplicationIdentifier:(id)a3
{
  id v3 = a3;
  id v12 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithApplicationIdentifier:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithApplicationIdentifier:error:",  v3,  &v12));
  id v6 = v12;
  if (v4 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord, v5), (objc_opt_isKindOfClass(v4, v7) & 1) != 0))
  {
    id v8 = v4;
  }

  else
  {
    if (v6)
    {
      id v9 = sub_1001704C4();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1002B6B18();
      }
    }

    id v8 = 0LL;
  }

  return v8;
}

+ (id)csd_applicationRecordForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v9 = 0LL;
  v4 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v3,  1LL,  &v9);
  id v5 = v9;
  if (!v4)
  {
    id v6 = sub_1001704C4();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1002B6B7C();
    }
  }

  return v4;
}

- (BOOL)csd_hasVoIPBackgroundMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord UIBackgroundModes](self, "UIBackgroundModes"));
  unsigned __int8 v3 = [v2 containsObject:@"voip"];

  return v3;
}

- (BOOL)csd_hasVoIPNetworkExtensionEntitlement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord entitlements](self, "entitlements"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray, v3);
  id v6 = objc_msgSend( v2,  "objectForKey:ofClass:valuesOfClass:",  @"com.apple.developer.networking.networkextension",  v4,  objc_opt_class(NSString, v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7) {
    unsigned __int8 v8 = [v7 containsObject:@"app-push-provider"];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

@end