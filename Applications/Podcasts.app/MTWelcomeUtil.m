@interface MTWelcomeUtil
+ (BOOL)carPlayShouldShowWelcome;
+ (BOOL)shouldShowWelcome;
+ (BOOL)shouldShowWelcomeIgnoringNewFeatures:(BOOL)a3;
+ (void)markWelcomeAsShown;
@end

@implementation MTWelcomeUtil

+ (BOOL)shouldShowWelcome
{
  return _[a1 shouldShowWelcomeIgnoringNewFeatures:0];
}

+ (BOOL)carPlayShouldShowWelcome
{
  return _[a1 shouldShowWelcomeIgnoringNewFeatures:1];
}

+ (BOOL)shouldShowWelcomeIgnoringNewFeatures:(BOOL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
  unsigned __int8 v5 = [v4 BOOLForKey:@"SuppressWelcomeScreen"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v7 = [v6 BOOLForKey:@"SuppressWelcomeScreen"];

  if ((v5 & 1) != 0 || v7)
  {
    uint64_t v16 = _MTLogCategoryPrivacy();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      v27 = @"SuppressWelcomeScreen";
      v17 = "shouldShowWelcome = NO. Reason: %@ = YES";
      v18 = v12;
      uint32_t v19 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v26, v19);
    }
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"MTWelcomeVersion"]);
    id v10 = [v9 integerValue];

    if (!a3 && v10 != (id)qword_1002B3C70)
    {
      uint64_t v11 = _MTLogCategoryPrivacy();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138412546;
        v27 = @"MTWelcomeVersion";
        __int16 v28 = 2048;
        id v29 = v10;
        v13 = "shouldShowWelcome = YES. Reason: %@ = %ld";
        v14 = v12;
        uint32_t v15 = 22;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v26, v15);
      }

+ (void)markWelcomeAsShown
{
  id v3 = objc_alloc(&OBJC_CLASS___AMSAcknowledgePrivacyTask);
  id v4 = [v3 initWithPrivacyIdentifier:kMTPodcastsPrivacyIdentifier];
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 acknowledgePrivacy]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000A2F30;
  v6[3] = &unk_1002434C0;
  v6[4] = a1;
  [v5 addFinishBlock:v6];
}

@end