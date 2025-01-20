@interface MIObsoleteUpgradeCleaner
+ (BOOL)cleanUpgradesWithError:(id *)a3;
@end

@implementation MIObsoleteUpgradeCleaner

+ (BOOL)cleanUpgradesWithError:(id *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 systemAppBundleIDToInfoMap]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 internalAppBundleIDToInfoMap]);

  [v4 enumerateKeysAndObjectsUsingBlock:&stru_1000815F8];
  [v6 enumerateKeysAndObjectsUsingBlock:&stru_1000815F8];

  return 1;
}

@end