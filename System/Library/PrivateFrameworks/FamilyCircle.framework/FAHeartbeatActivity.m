@interface FAHeartbeatActivity
- (BOOL)_checkAndDeferActivityIfNeeded:(id)a3;
- (FAHeartbeatActivity)initWithQueueProvider:(id)a3;
- (id)_familyGrandSlamSignerWithAccountStore:(id)a3;
- (id)_grandSlamAccountForAccountStore:(id)a3;
- (id)_grandSlamSignerWithAccountStore:(id)a3;
- (id)_primaryAccount;
- (void)_performHeartbeatCheckinForActivity:(id)a3 completion:(id)a4;
- (void)checkin;
- (void)performHeartbeatCheckinWithCompletion:(id)a3;
- (void)scheduleWithCompletionHandler:(id)a3;
- (void)unregister;
@end

@implementation FAHeartbeatActivity

- (FAHeartbeatActivity)initWithQueueProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FAHeartbeatActivity;
  v6 = -[FAHeartbeatActivity init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queueProvider, a3);
    v7->_timeInterval = XPC_ACTIVITY_INTERVAL_1_DAY;
  }

  return v7;
}

- (void)checkin
{
}

- (void)performHeartbeatCheckinWithCompletion:(id)a3
{
}

- (void)_performHeartbeatCheckinForActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  uint64_t v9 = _FALogSystem(v7, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing heartbeat operation!", buf, 2u);
  }

  if (-[FAHeartbeatActivity _checkAndDeferActivityIfNeeded:](self, "_checkAndDeferActivityIfNeeded:", v6))
  {
    if (v7) {
      v7[2](v7, 0LL);
    }
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    v12 = objc_alloc_init(&OBJC_CLASS___FADeviceInfo);
    v13 = objc_alloc(&OBJC_CLASS___FANetworkService);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_primaryAppleAccount"));
    v15 = (void *)objc_opt_new(&OBJC_CLASS___FAURLConfiguration);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLSession sharedSession](&OBJC_CLASS___AAURLSession, "sharedSession"));
    v17 = -[FANetworkService initWithAccount:deviceInfo:urlProvider:urlSession:]( v13,  "initWithAccount:deviceInfo:urlProvider:urlSession:",  v14,  v12,  v15,  v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    v19 = objc_alloc(&OBJC_CLASS___FAHeartbeatOperation);
    v20 = (void *)objc_claimAutoreleasedReturnValue( -[FAHeartbeatActivity _grandSlamSignerWithAccountStore:]( self,  "_grandSlamSignerWithAccountStore:",  v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue( -[FAHeartbeatActivity _familyGrandSlamSignerWithAccountStore:]( self,  "_familyGrandSlamSignerWithAccountStore:",  v18));
    v22 = -[FAHeartbeatOperation initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:]( v19,  "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:",  v17,  v20,  v21);

    if (-[FAHeartbeatActivity _checkAndDeferActivityIfNeeded:](self, "_checkAndDeferActivityIfNeeded:", v6))
    {
      if (v7) {
        v7[2](v7, 0LL);
      }
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[FAHeartbeatOperation fetchHeartbeatData](v22, "fetchHeartbeatData"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000091B4;
      v24[3] = &unk_100041688;
      v24[4] = self;
      id v25 = v6;
      v26 = v7;
      [v23 onComplete:v24];
    }
  }
}

- (BOOL)_checkAndDeferActivityIfNeeded:(id)a3
{
  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (v3 && xpc_activity_should_defer(v3))
  {
    BOOL v5 = xpc_activity_set_state(v4, 3LL);
    uint64_t v6 = _FALogSystem();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Family heartbeat activity deferred with status: %d",  (uint8_t *)v9,  8u);
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_primaryAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));

  return v3;
}

- (id)_grandSlamAccountForAccountStore:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[FAHeartbeatActivity _primaryAccount](self, "_primaryAccount"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_grandSlamAccountForiCloudAccount:", v5));

  return v6;
}

- (id)_grandSlamSignerWithAccountStore:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc(&OBJC_CLASS___AAGrandSlamSigner);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[FAHeartbeatActivity _grandSlamAccountForAccountStore:](self, "_grandSlamAccountForAccountStore:", v4));
  v7 = -[AAGrandSlamSigner initWithAccountStore:grandSlamAccount:appTokenID:]( v5,  "initWithAccountStore:grandSlamAccount:appTokenID:",  v4,  v6,  AAGrandSlamAppTokenIDiCloudSettings);

  return v7;
}

- (id)_familyGrandSlamSignerWithAccountStore:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc(&OBJC_CLASS___AAGrandSlamSigner);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[FAHeartbeatActivity _grandSlamAccountForAccountStore:](self, "_grandSlamAccountForAccountStore:", v4));
  v7 = -[AAGrandSlamSigner initWithAccountStore:grandSlamAccount:appTokenID:]( v5,  "initWithAccountStore:grandSlamAccount:appTokenID:",  v4,  v6,  AAGrandSlamAppTokenIDFamilySharing);

  -[AAGrandSlamSigner setHeaderFieldKey:](v7, "setHeaderFieldKey:", AAFamilyGrandSlamTokenHeaderKey);
  return v7;
}

- (void).cxx_destruct
{
}

- (void)scheduleWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10001B6BC(&qword_100051F68);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_100042DF8, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_100042E20, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_100052640;
  v11[5] = v9;
  v12 = (void *)swift_allocObject(&unk_100042E48, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100051F80;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_10002950C((uint64_t)v7, (uint64_t)&unk_100051F88, (uint64_t)v12);
  swift_release(v14);
}

- (void)unregister
{
  v2 = self;
  sub_100027254(v5);
  uint64_t v3 = v6;
  uint64_t v4 = v7;
  sub_10001E920(v5, v6);
  dispatch thunk of BackgroundTaskScheduler.unregister()(v3, v4);
  sub_10001F53C(v5);
}

@end