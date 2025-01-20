@interface CNDataclassActionDefinition
+ (ACDataclassAction)cancel;
+ (ACDataclassAction)cancelDueToRestrictions;
+ (ACDataclassAction)createSyncDataStore;
+ (ACDataclassAction)createSyncDataStoreDeleteLocalData;
+ (ACDataclassAction)createSyncDataStoreKeepLocalData;
+ (ACDataclassAction)deleteSyncData;
+ (ACDataclassAction)mergeLocalDataIntoSyncData;
+ (ACDataclassAction)mergeSyncDataIntoLocalData;
@end

@implementation CNDataclassActionDefinition

+ (ACDataclassAction)createSyncDataStore
{
  return +[ACDataclassAction actionWithType:](&OBJC_CLASS___ACDataclassAction, "actionWithType:", 1LL);
}

+ (ACDataclassAction)createSyncDataStoreKeepLocalData
{
  return +[ACDataclassAction actionWithType:](&OBJC_CLASS___ACDataclassAction, "actionWithType:", 4LL);
}

+ (ACDataclassAction)createSyncDataStoreDeleteLocalData
{
  return (ACDataclassAction *)+[ACDataclassAction destructiveActionWithType:]( &OBJC_CLASS___ACDataclassAction,  "destructiveActionWithType:",  6LL);
}

+ (ACDataclassAction)mergeLocalDataIntoSyncData
{
  return +[ACDataclassAction actionWithType:](&OBJC_CLASS___ACDataclassAction, "actionWithType:", 5LL);
}

+ (ACDataclassAction)mergeSyncDataIntoLocalData
{
  return +[ACDataclassAction actionWithType:](&OBJC_CLASS___ACDataclassAction, "actionWithType:", 2LL);
}

+ (ACDataclassAction)deleteSyncData
{
  return (ACDataclassAction *)+[ACDataclassAction destructiveActionWithType:]( &OBJC_CLASS___ACDataclassAction,  "destructiveActionWithType:",  3LL);
}

+ (ACDataclassAction)cancel
{
  return +[ACDataclassAction actionWithType:](&OBJC_CLASS___ACDataclassAction, "actionWithType:", 0LL);
}

+ (ACDataclassAction)cancelDueToRestrictions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACDataclassAction actionWithType:](&OBJC_CLASS___ACDataclassAction, "actionWithType:", 0LL));
  v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___CNDataclassActionDefinition));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"SCREENTIME_SIGNOUT_RESTRICTIONS_ENABLED_ALERT_TITLE" value:&stru_10790 table:0]);
  [v2 setUndoAlertTitle:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"SCREENTIME_SIGNOUT_RESTRICTIONS_ENABLED_ALERT_MESSAGE" value:&stru_10790 table:0]);
  [v2 setUndoAlertMessage:v6];

  return (ACDataclassAction *)v2;
}

@end