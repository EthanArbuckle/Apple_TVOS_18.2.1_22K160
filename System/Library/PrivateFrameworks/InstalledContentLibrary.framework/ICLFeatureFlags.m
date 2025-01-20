@interface ICLFeatureFlags
+ (BOOL)appReferencesEnabled;
+ (BOOL)fullFidelityIconsEnabled;
+ (BOOL)isRestackingEnabled;
+ (BOOL)systemAppDeletionEnabled;
+ (BOOL)transientBundleCleanupEnabled;
+ (BOOL)twoStageAppInstallEnabled;
@end

@implementation ICLFeatureFlags

+ (BOOL)isRestackingEnabled
{
  return 1;
}

+ (BOOL)appReferencesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)systemAppDeletionEnabled
{
  return 1;
}

+ (BOOL)transientBundleCleanupEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)fullFidelityIconsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)twoStageAppInstallEnabled
{
  return _os_feature_enabled_impl();
}

@end