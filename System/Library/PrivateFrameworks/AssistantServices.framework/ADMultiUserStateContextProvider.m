@interface ADMultiUserStateContextProvider
- (ADMultiUserStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)handleMultiUserDidReceiveScoresNotification:(id)a3;
@end

@implementation ADMultiUserStateContextProvider

- (ADMultiUserStateContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADMultiUserStateContextProvider;
  v8 = -[ADMultiUserStateContextProvider init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_donationService, v6);
    if (v7) {
      v10 = (AFInstanceContext *)v7;
    }
    else {
      v10 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v9->_instanceContext;
    v9->_instanceContext = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v9 selector:"handleMultiUserDidReceiveScoresNotification:" name:@"ADMultiUserDidReceiveScoresNotification" object:0];

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_donationService);
    [WeakRetained registerContextTransformer:v9 forType:AFDeviceContextKeyMultiUserState];
  }

  return v9;
}

- (void)handleMultiUserDidReceiveScoresNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v23 = v5;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    *(_DWORD *)buf = 136315394;
    v28 = "-[ADMultiUserStateContextProvider handleMultiUserDidReceiveScoresNotification:]";
    __int16 v29 = 2112;
    id v30 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s #hal %@", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 object]);
    if (v9)
    {
      v11 = (void *)v9;
      if (AFSupportsMultiUser(v9, v10))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"confidenceScores"]);
        v13 = v12;
        if (!v12) {
          goto LABEL_11;
        }
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_100347A68;
        v25[3] = &unk_1004FD338;
        id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));
        id v14 = v26;
        [v13 enumerateKeysAndObjectsUsingBlock:v25];
        id v15 = [[AFMultiUserStateSnapshot alloc] initWithConfidenceScores:v14];

        if (v15)
        {
          v16 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v28 = "-[ADMultiUserStateContextProvider handleMultiUserDidReceiveScoresNotification:]";
            __int16 v29 = 2112;
            id v30 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s #hal %@", buf, 0x16u);
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dateByAddingTimeInterval:5.0]);
          id v19 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
          id v20 = [v19 initWithType:AFDeviceContextKeyMultiUserState deliveryDate:v17 expirationDate:v18 redactedKeyPaths:0 historyConfiguration:0];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
          [WeakRetained donateContext:v15 withMetadata:v20 pushToRemote:1];
        }

        else
        {
LABEL_11:
          v22 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v28 = "-[ADMultiUserStateContextProvider handleMultiUserDidReceiveScoresNotification:]";
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s #hal Invalid score", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
}

- (void).cxx_destruct
{
}

@end