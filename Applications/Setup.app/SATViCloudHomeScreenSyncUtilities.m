@interface SATViCloudHomeScreenSyncUtilities
+ (BOOL)shouldShowHomeScreenSyncPromptToUserWithStepContext:(id)a3;
+ (void)enableOrDisableHomeScreenSync:(BOOL)a3;
@end

@implementation SATViCloudHomeScreenSyncUtilities

+ (BOOL)shouldShowHomeScreenSyncPromptToUserWithStepContext:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 previousExecutionRecord]);
  id v4 = [v3 setupVersion];
  unint64_t v5 = TVSKSetupVersionStepExecutionRecords;
  v6 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.HeadBoard");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v6, "objectForKey:", @"iCloudSyncEnabled"));

  if ((unint64_t)v4 >= v5)
  {
    id v13 = sub_10002AF94();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Sync screen has already been offered in the past. Skip showing the prompt.";
      v12 = buf;
      goto LABEL_7;
    }

+ (void)enableOrDisableHomeScreenSync:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.HeadBoard");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[NSUserDefaults setObject:forKey:](v5, "setObject:forKey:", v4, @"iCloudSyncEnabled");
}

@end