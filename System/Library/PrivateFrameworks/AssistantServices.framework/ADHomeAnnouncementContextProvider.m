@interface ADHomeAnnouncementContextProvider
- (ADHomeAnnouncementContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)handleHomeAnnouncementSnapshotUpdate:(id)a3;
@end

@implementation ADHomeAnnouncementContextProvider

- (ADHomeAnnouncementContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ADHomeAnnouncementContextProvider;
  v8 = -[ADHomeAnnouncementContextProvider init](&v20, "init");
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

    if (+[AFFeatureFlags isAnnounceEnabled](&OBJC_CLASS___AFFeatureFlags, "isAnnounceEnabled"))
    {
      v12 = -[ADHomeAnnouncementContextAdaptor initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___ADHomeAnnouncementContextAdaptor),  "initWithInstanceContext:",  v9->_instanceContext);
      homeAnnouncementContextAdaptor = v9->_homeAnnouncementContextAdaptor;
      v9->_homeAnnouncementContextAdaptor = v12;

      objc_initWeak(&location, v9);
      v14 = v9->_homeAnnouncementContextAdaptor;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000BF6B8;
      v17[3] = &unk_1004F0210;
      objc_copyWeak(&v18, &location);
      -[ADHomeAnnouncementContextAdaptor registerSnapshotUpdater:](v14, "registerSnapshotUpdater:", v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_donationService);
    [WeakRetained registerContextTransformer:v9 forType:AFDeviceContextKeyHomeAnnouncement];
  }

  return v9;
}

- (void)handleHomeAnnouncementSnapshotUpdate:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    v13 = "-[ADHomeAnnouncementContextProvider handleHomeAnnouncementSnapshotUpdate:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s #hal snapshot = %@",  (uint8_t *)&v12,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
  uint64_t v8 = AFDeviceContextKeyHomeAnnouncement;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:60.0]);
  id v10 = [v7 initWithType:v8 deliveryDate:v6 expirationDate:v9 redactedKeyPaths:0 historyConfiguration:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
  [WeakRetained donateContext:v4 withMetadata:v10 pushToRemote:0];
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  id v7 = (void (*)(id, id, id))*((void *)a6 + 2);
  if (a5 == 10) {
    v7(a6, a3, a4);
  }
  else {
    ((void (*)(id, void, void, id))v7)(a6, 0LL, 0LL, a4);
  }
}

- (void).cxx_destruct
{
}

@end