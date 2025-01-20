@interface MSDSystemAppsDataPrepareOperation
- (BOOL)_prepareForSystemAppDataInstall;
- (id)methodSelectors;
@end

@implementation MSDSystemAppsDataPrepareOperation

- (id)methodSelectors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_prepareForSystemAppDataInstall"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, 0LL));

  return v3;
}

- (BOOL)_prepareForSystemAppDataInstall
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  [v2 saveRequiredDeletableSystemApps];
  [v2 installAndWaitForSystemApps];

  return 1;
}

@end