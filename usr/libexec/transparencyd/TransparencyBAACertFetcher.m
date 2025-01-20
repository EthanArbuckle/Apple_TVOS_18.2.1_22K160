@interface TransparencyBAACertFetcher
- (BOOL)outstandingRemoteFetchSignal;
- (KTNearFutureScheduler)BAACertFetcher;
- (OS_dispatch_group)issuanceGroup;
- (OS_dispatch_queue)issuanceQueue;
- (OS_dispatch_workloop)workloop;
- (TransparencyBAACertFetcher)initWithWorkloop:(id)a3;
- (int64_t)getBAAValidity;
- (void)dealloc;
- (void)deviceIdentityIssuerCert:(id)a3 completionHandler:(id)a4;
- (void)fetchCacheOnly:(BOOL)a3 completion:(id)a4;
- (void)getDeviceCertWithForcedFetch:(BOOL)a3 completionHandler:(id)a4;
- (void)setBAACertFetcher:(id)a3;
- (void)setIssuanceGroup:(id)a3;
- (void)setIssuanceQueue:(id)a3;
- (void)setOutstandingRemoteFetchSignal:(BOOL)a3;
- (void)setWorkloop:(id)a3;
- (void)triggerRemoteBAACertFetch;
@end

@implementation TransparencyBAACertFetcher

- (TransparencyBAACertFetcher)initWithWorkloop:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TransparencyBAACertFetcher;
  v5 = -[TransparencyBAACertFetcher init](&v20, "init");
  if (v5)
  {
    id location = 0LL;
    objc_initWeak(&location, v5);
    v6 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_1001D7D60;
    v17 = &unk_100276D20;
    objc_copyWeak(&v18, &location);
    v7 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v6,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"BAACertFetch",  2000000000LL,  7200000000000LL,  0LL,  0LL,  &v14,  2.0);
    -[TransparencyBAACertFetcher setBAACertFetcher:](v5, "setBAACertFetcher:", v7, v14, v15, v16, v17);

    -[TransparencyBAACertFetcher setWorkloop:](v5, "setWorkloop:", v4);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.transparency.deviceCertIssuanceQueue", v9);
    -[TransparencyBAACertFetcher setIssuanceQueue:](v5, "setIssuanceQueue:", v10);

    dispatch_group_t v11 = dispatch_group_create();
    -[TransparencyBAACertFetcher setIssuanceGroup:](v5, "setIssuanceGroup:", v11);

    v12 = v5;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)deviceIdentityIssuerCert:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_1001D7EA0;
  v13[4] = sub_1001D7EB0;
  id v14 = 0LL;
  id v14 = (id)os_transaction_create("com.apple.transparency.DeviceIdentity");
  dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher workloop](self, "workloop"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001D7EB8;
  v10[3] = &unk_10028AA10;
  id v9 = v7;
  id v11 = v9;
  v12 = v13;
  DeviceIdentityIssueClientCertificateWithCompletion(v8, v6, v10);

  _Block_object_dispose(v13, 8);
}

- (int64_t)getBAAValidity
{
  uint64_t v2 = kKTMaxBAACertTTLInMinutes;
  return v2 - arc4random_uniform(kKTBAACertTTLMaxTTLOffsetInMinutes);
}

- (void)fetchCacheOnly:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher issuanceGroup](self, "issuanceGroup"));
  objc_sync_enter(v7);
  if (-[TransparencyBAACertFetcher outstandingRemoteFetchSignal](self, "outstandingRemoteFetchSignal"))
  {
    if (qword_1002EEFB0 != -1) {
      dispatch_once(&qword_1002EEFB0, &stru_10028AA30);
    }
    dispatch_queue_attr_t v8 = (os_log_s *)qword_1002EEFB8;
    if (os_log_type_enabled((os_log_t)qword_1002EEFB8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "An existing remote cert fetch is in progress. Waiting for that to finish.",  buf,  2u);
    }

    id v9 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher issuanceGroup](self, "issuanceGroup"));
    dispatch_queue_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher issuanceQueue](self, "issuanceQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001D83AC;
    block[3] = &unk_1002798C8;
    block[4] = self;
    id v23 = v6;
    id v11 = v6;
    dispatch_group_notify(v9, v10, block);

    objc_sync_exit(v7);
  }

  else
  {
    objc_sync_exit(v7);

    if (a3)
    {
      v12 = &kMAOptionsBAASkipNetworkRequest;
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher issuanceGroup](self, "issuanceGroup"));
      objc_sync_enter(v13);
      id v14 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher issuanceGroup](self, "issuanceGroup"));
      dispatch_group_enter(v14);

      -[TransparencyBAACertFetcher setOutstandingRemoteFetchSignal:](self, "setOutstandingRemoteFetchSignal:", 1LL);
      objc_sync_exit(v13);

      v12 = &kMAOptionsBAAIgnoreExistingKeychainItems;
    }

    v27[0] = kTransparencyBAACertKeychainLabelKey;
    v26[0] = kMAOptionsBAAKeychainLabel;
    v26[1] = kMAOptionsBAAValidity;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[TransparencyBAACertFetcher getBAAValidity](self, "getBAAValidity")));
    v27[1] = v15;
    v27[2] = kTransparencyBAACertKeychainAccessGroup;
    v26[2] = kMAOptionsBAAKeychainAccessGroup;
    v26[3] = kMAOptionsBAAOIDSToInclude;
    v25[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
    v25[1] = kMAOptionsBAAOIDDeviceOSInformation;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
    v27[3] = v16;
    v26[4] = kMAOptionsUseSoftwareGeneratedKey;
    v27[4] = &__kCFBooleanTrue;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  5LL));
    id v7 = [v17 mutableCopy];

    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:*v12];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001D83BC;
    v19[3] = &unk_10028AA58;
    BOOL v21 = a3;
    v19[4] = self;
    id v20 = v6;
    id v18 = v6;
    -[TransparencyBAACertFetcher deviceIdentityIssuerCert:completionHandler:]( self,  "deviceIdentityIssuerCert:completionHandler:",  v7,  v19);
  }
}

- (void)triggerRemoteBAACertFetch
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1001D84BC;
  v2[3] = &unk_10028AAA0;
  v2[4] = self;
  -[TransparencyBAACertFetcher fetchCacheOnly:completion:](self, "fetchCacheOnly:completion:", 0LL, v2);
}

- (void)getDeviceCertWithForcedFetch:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001D869C;
  v6[3] = &unk_100289F58;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  -[TransparencyBAACertFetcher fetchCacheOnly:completion:](v7, "fetchCacheOnly:completion:", !v4, v6);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher BAACertFetcher](self, "BAACertFetcher"));
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TransparencyBAACertFetcher;
  -[TransparencyBAACertFetcher dealloc](&v4, "dealloc");
}

- (KTNearFutureScheduler)BAACertFetcher
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBAACertFetcher:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setWorkloop:(id)a3
{
}

- (OS_dispatch_group)issuanceGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setIssuanceGroup:(id)a3
{
}

- (OS_dispatch_queue)issuanceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setIssuanceQueue:(id)a3
{
}

- (BOOL)outstandingRemoteFetchSignal
{
  return self->_outstandingRemoteFetchSignal;
}

- (void)setOutstandingRemoteFetchSignal:(BOOL)a3
{
  self->_outstandingRemoteFetchSignal = a3;
}

- (void).cxx_destruct
{
}

@end