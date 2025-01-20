@interface ADFlowServiceListener
- (ADFlowServiceListener)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)fetchSiriKitApplicationsWithNotificationPreviewRestrictionsWithCompletion:(id)a3;
- (void)getPersonalSettingsForSharedUserID:(id)a3 completion:(id)a4;
- (void)setupListener;
@end

@implementation ADFlowServiceListener

- (ADFlowServiceListener)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADFlowServiceListener;
  v2 = -[ADFlowServiceListener init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("ADFlowServiceListener", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (void)setupListener
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013B884;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  char HasEntitlement = AFConnectionHasEntitlement(v5, kAssistantFlowServiceEntitlement);
  if ((HasEntitlement & 1) != 0)
  {
    unsigned int v7 = [v5 processIdentifier];
    v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "-[ADFlowServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 1024;
      unsigned int v21 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s %@ Flow Service Connection Connected (pid=%d])",  buf,  0x1Cu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFFlowService));
    [v5 setExportedInterface:v9];

    [v5 setExportedObject:self];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10013B714;
    v14[3] = &unk_1004F9D00;
    unsigned int v15 = v7;
    [v5 setInvalidationHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10013B7CC;
    v12[3] = &unk_1004F9D00;
    unsigned int v13 = v7;
    [v5 setInterruptionHandler:v12];
    [v5 resume];
  }

  else
  {
    objc_super v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[ADFlowServiceListener listener:shouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s %@ Flow Service Connection does not have required entitlements.",  buf,  0x16u);
    }
  }

  return HasEntitlement;
}

- (void)fetchSiriKitApplicationsWithNotificationPreviewRestrictionsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADNotificationManager sharedManager](&OBJC_CLASS___ADNotificationManager, "sharedManager"));
  [v4 fetchSiriRelatedNotificationPreviewRestrictedAppsWithCompletion:v3];
}

- (void)getPersonalSettingsForSharedUserID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v8 = (void (**)(void, void, void))v6;
  if (v6)
  {
    if (v5 && AFSupportsMultiUser(v6, v7))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
      [v9 getMultiUserSettingsForSharedUserID:v5 completion:v8];
    }

    else
    {
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[ADAssistantDataManager sharedDataManager]( &OBJC_CLASS___ADAssistantDataManager,  "sharedDataManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v10 _cachedAssistantData]);

      if (v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 temperatureUnit]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 twentyFourHourTimeDisplay]);
        id v13 = [v12 BOOLValue];

        v14 = (void *)objc_claimAutoreleasedReturnValue([v9 region]);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 countryCode]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v9 preferredLanguage]);
        v17 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          int v20 = 136315138;
          unsigned int v21 = "-[ADFlowServiceListener getPersonalSettingsForSharedUserID:completion:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s Settings found",  (uint8_t *)&v20,  0xCu);
        }

        __int16 v18 = objc_alloc_init(&OBJC_CLASS___AFPersonalUserSettings);
        -[AFPersonalUserSettings setTemperatureUnit:](v18, "setTemperatureUnit:", v11);
        -[AFPersonalUserSettings setTwentyFourHourTimeDisplay:](v18, "setTwentyFourHourTimeDisplay:", v13);
        -[AFPersonalUserSettings setRegion:](v18, "setRegion:", v14);
        -[AFPersonalUserSettings setCountryCode:](v18, "setCountryCode:", v15);
        -[AFPersonalUserSettings setPreferredLanguage:](v18, "setPreferredLanguage:", v16);
        ((void (**)(void, AFPersonalUserSettings *, void))v8)[2](v8, v18, 0LL);
      }

      else
      {
        id v19 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          int v20 = 136315138;
          unsigned int v21 = "-[ADFlowServiceListener getPersonalSettingsForSharedUserID:completion:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%s Settings not found",  (uint8_t *)&v20,  0xCu);
        }

        v11 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  0LL,  @"User Settings unavailable"));
        ((void (**)(void, void, void *))v8)[2](v8, 0LL, v11);
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end