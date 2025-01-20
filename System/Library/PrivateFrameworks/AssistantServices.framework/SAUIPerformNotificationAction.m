@interface SAUIPerformNotificationAction
- (BOOL)_adui_shouldBeHandledByAssistantd;
- (void)_adui_handleWithCompletion:(id)a3;
@end

@implementation SAUIPerformNotificationAction

- (BOOL)_adui_shouldBeHandledByAssistantd
{
  return 1;
}

- (void)_adui_handleWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[SAUIPerformNotificationAction(ADUIService) _adui_handleWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v6 = objc_alloc(&OBJC_CLASS___AFTwoArgumentSafetyBlock);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100260594;
  v15[3] = &unk_1004F8D20;
  v15[4] = self;
  id v16 = v4;
  id v7 = v4;
  v8 = -[AFTwoArgumentSafetyBlock initWithBlock:defaultValue1:defaultValue2:]( v6,  "initWithBlock:defaultValue1:defaultValue2:",  v15,  0LL,  0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIPerformNotificationAction notificationIdentifier](self, "notificationIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIPerformNotificationAction actionIdentifier](self, "actionIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADNotificationManager sharedManager](&OBJC_CLASS___ADNotificationManager, "sharedManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100260698;
  v13[3] = &unk_1004FB0E0;
  v14 = v8;
  v12 = v8;
  [v11 performActionWithIdentifier:v10 forUNNotificationWithIdentifier:v9 completion:v13];
}

@end