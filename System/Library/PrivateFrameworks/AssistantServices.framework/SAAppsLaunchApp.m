@interface SAAppsLaunchApp
- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SAAppsLaunchApp

- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [off_1005735A8() serviceWithDefaultShellEndpoint];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 _turnId]);
    if (v10)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUUFRReady);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      [v12 logInstrumentation:v11 machAbsoluteTime:mach_absolute_time() turnIdentifier:v10];

      v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[SAAppsLaunchApp(ADSiriAppLaunchRequestHandler) _ad_handleAppLaunchCommandWithRequest:completion:]";
        __int16 v23 = 2112;
        v24 = v10;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Logging UUFR ready for app launch with turnid: %@",  buf,  0x16u);
      }
    }

    else
    {
      v14 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[SAAppsLaunchApp(ADSiriAppLaunchRequestHandler) _ad_handleAppLaunchCommandWithRequest:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Failed to find turnId for app launch UUFR",  buf,  0xCu);
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppsLaunchApp launchId](self, "launchId"));
    id v16 = [off_1005735B0() optionsWithDictionary:&__NSDictionary0__struct];
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100127E18;
    v18[3] = &unk_1004F22F8;
    id v20 = v7;
    id v19 = v6;
    [v9 openApplication:v15 withOptions:v17 completion:v18];

    goto LABEL_11;
  }

  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v10);
LABEL_11:
  }
}

@end