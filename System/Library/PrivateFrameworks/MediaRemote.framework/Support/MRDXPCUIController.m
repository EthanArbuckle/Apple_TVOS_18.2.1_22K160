@interface MRDXPCUIController
- (BOOL)hasGroupSessionLowPowerAssertion;
- (BOOL)hasGroupSessionNearbyAssertion;
- (BOOL)hasLockScreenControlsAssertion;
- (BOOL)hasQuickControlsAssertion;
- (BOOL)hasRouteRecommendationAssertion;
- (BOOL)hasScreenMirroringQuickControlsAssertion;
- (BOOL)hasUIAssertions;
- (MRDXPCUIController)initWithDelegate:(id)a3;
- (MROSTransaction)transaction;
- (MRUIServerXPCProtocol)server;
- (NSXPCConnection)xpcConnection;
- (id)acquireQuickControlsAssertion;
- (id)delegate;
- (id)synchronousServer;
- (os_unfair_lock_s)lock;
- (void)_updateTransaction;
- (void)acquireGroupSessionLowPowerPlatterAssertion;
- (void)acquireGroupSessionNearbyAssertionForSession:(id)a3;
- (void)acquireLockScreenControlsAssertion;
- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3;
- (void)acquireScreenMirroringQuickControlsAssertion;
- (void)dealloc;
- (void)nearbyGroupSessionDismissed:(id)a3;
- (void)releaseGroupSessionLowPowerPlatterAssertion;
- (void)releaseGroupSessionNearbyAssertion;
- (void)releaseLockScreenControlsAssertion;
- (void)releaseQuickControlsAssertion;
- (void)releaseRouteRecommendationAssertion;
- (void)releaseScreenMirroringQuickControlsAssertion;
- (void)routeRecommendationDismissed;
- (void)setHasGroupSessionLowPowerAssertion:(BOOL)a3;
- (void)setHasGroupSessionNearbyAssertion:(BOOL)a3;
- (void)setHasLockScreenControlsAssertion:(BOOL)a3;
- (void)setHasQuickControlsAssertion:(BOOL)a3;
- (void)setHasRouteRecommendationAssertion:(BOOL)a3;
- (void)setHasScreenMirroringQuickControlsAssertion:(BOOL)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MRDXPCUIController

- (MRDXPCUIController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRDXPCUIController;
  v6 = -[MRDXPCUIController init](&v10, "init");
  if (v6)
  {
    uint64_t v7 = _MRLogForCategory(11LL, v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRUIController][D] <%p> Initializing XPC controller.",  buf,  0xCu);
    }

    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak(&v6->_delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(11LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRUIController][D] <%p> Dealloc.", buf, 0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  if (-[MRDXPCUIController hasLockScreenControlsAssertion](self, "hasLockScreenControlsAssertion"))
  {
    uint64_t v7 = _MRLogForCategory(11LL, v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002BB2A0();
    }

    [v5 releaseLockScreenControlsAssertionWithReply:&stru_1003A28C0];
  }

  if (-[MRDXPCUIController hasQuickControlsAssertion](self, "hasQuickControlsAssertion"))
  {
    uint64_t v10 = _MRLogForCategory(11LL, v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002BB240();
    }

    [v5 releaseQuickControlsAssertionWithReply:&stru_1003A28E0];
  }

  if (-[MRDXPCUIController hasScreenMirroringQuickControlsAssertion](self, "hasScreenMirroringQuickControlsAssertion"))
  {
    uint64_t v13 = _MRLogForCategory(11LL, v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1002BB1E0();
    }

    [v5 releaseScreenMirroringQuickControlsAssertionWithReply:&stru_1003A2900];
  }

  if (-[MRDXPCUIController hasRouteRecommendationAssertion](self, "hasRouteRecommendationAssertion"))
  {
    uint64_t v16 = _MRLogForCategory(11LL, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1002BB180();
    }

    [v5 releaseRouteRecommendationAssertionWithReply:&stru_1003A2920];
  }

  if (-[MRDXPCUIController hasGroupSessionLowPowerAssertion](self, "hasGroupSessionLowPowerAssertion"))
  {
    uint64_t v19 = _MRLogForCategory(11LL, v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1002BB120();
    }

    [v5 releaseGroupSessionLowPowerPlatterAssertionWithReply:&stru_1003A2940];
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController xpcConnection](self, "xpcConnection"));
  [v21 invalidate];

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MRDXPCUIController;
  -[MRDXPCUIController dealloc](&v22, "dealloc");
}

- (void)_updateTransaction
{
  if (-[MRDXPCUIController hasUIAssertions](self, "hasUIAssertions"))
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MROSTransaction);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.mediaremoted.UIController.%p",  self));
    uint64_t v5 = -[MROSTransaction initWithName:](v3, "initWithName:", v4);
    -[MRDXPCUIController setTransaction:](self, "setTransaction:", v5);

    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController transaction](self, "transaction"));
    MRRegisterTransaction(v6);
  }

  else
  {
    -[MRDXPCUIController setTransaction:](self, "setTransaction:", 0LL);
  }

- (BOOL)hasUIAssertions
{
  if (-[MRDXPCUIController hasQuickControlsAssertion](self, "hasQuickControlsAssertion")
    || -[MRDXPCUIController hasScreenMirroringQuickControlsAssertion](self, "hasScreenMirroringQuickControlsAssertion")
    || -[MRDXPCUIController hasLockScreenControlsAssertion](self, "hasLockScreenControlsAssertion"))
  {
    return 1;
  }

  else
  {
    return -[MRDXPCUIController hasRouteRecommendationAssertion](self, "hasRouteRecommendationAssertion");
  }

- (NSXPCConnection)xpcConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDUIServer sharedServer](&OBJC_CLASS___MRDUIServer, "sharedServer"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 listener]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);

    v8 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  v7);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MRDiscoveredGroupSession);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___MRGroupSessionHostInfo);
    v11 = +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  v9,  v10,  objc_opt_class(&OBJC_CLASS___NSSet),  0LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = MSVPropertyListDataClasses();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v12 unionSet:v14];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MRUIClientXPCProtocol));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MRUIServerXPCProtocol));
    [v16 setClasses:v12 forSelector:"acquireGroupSessionNearbyAssertionForSession:withReply:" argumentIndex:0 ofReply:0];
    [v15 setClasses:v12 forSelector:"nearbyGroupSessionDismissed:" argumentIndex:0 ofReply:0];
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[MSVWeakProxy proxyWithObject:protocol:]( &OBJC_CLASS___MSVWeakProxy,  "proxyWithObject:protocol:",  self,  &OBJC_PROTOCOL___MRUIClientXPCProtocol));
    -[NSXPCConnection setExportedObject:](v8, "setExportedObject:", v17);

    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v15);
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v16);
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100143B84;
    v23[3] = &unk_10039A668;
    objc_copyWeak(&v24, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v23);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100143C4C;
    v21[3] = &unk_10039A668;
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v21);
    -[NSXPCConnection resume](v8, "resume");
    uint64_t v18 = self->_xpcConnection;
    self->_xpcConnection = v8;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

    xpcConnection = self->_xpcConnection;
  }

  uint64_t v19 = xpcConnection;
  os_unfair_lock_unlock(p_lock);
  return v19;
}

- (MRUIServerXPCProtocol)server
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController xpcConnection](self, "xpcConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100143D98;
  v6[3] = &unk_100399508;
  v6[4] = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxyWithErrorHandler:v6]);

  return (MRUIServerXPCProtocol *)v4;
}

- (id)synchronousServer
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController xpcConnection](self, "xpcConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100143ED8;
  v6[3] = &unk_100399508;
  v6[4] = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 synchronousRemoteObjectProxyWithErrorHandler:v6]);

  return v4;
}

- (void)acquireLockScreenControlsAssertion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
  unsigned __int8 v4 = [v3 supportManyRecommendationsPlatters];

  if ((v4 & 1) == 0 && -[MRDXPCUIController hasRouteRecommendationAssertion](self, "hasRouteRecommendationAssertion")) {
    -[MRDXPCUIController releaseRouteRecommendationAssertion](self, "releaseRouteRecommendationAssertion");
  }
  -[MRDXPCUIController setHasLockScreenControlsAssertion:](self, "setHasLockScreenControlsAssertion:", 1LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  [v5 acquireLockScreenControlsAssertionWithReply:&stru_1003A2960];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
}

- (void)releaseLockScreenControlsAssertion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  [v3 releaseLockScreenControlsAssertionWithReply:&stru_1003A2980];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
}

- (void)routeRecommendationDismissed
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController delegate](self, "delegate"));
  [v2 routeRecommendationDismissed];
}

- (id)acquireQuickControlsAssertion
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_100144190;
  v11 = sub_1001441A0;
  id v12 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController synchronousServer](self, "synchronousServer"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001441A8;
  v6[3] = &unk_1003A29A8;
  v6[4] = &v7;
  [v3 acquireQuickControlsAssertionWithReply:v6];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)releaseQuickControlsAssertion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  [v3 releaseQuickControlsAssertionWithReply:&stru_1003A29C8];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
}

- (void)acquireScreenMirroringQuickControlsAssertion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  [v3 acquireScreenMirroringQuickControlsAssertionWithReply:&stru_1003A29E8];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
}

- (void)releaseScreenMirroringQuickControlsAssertion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  [v3 releaseScreenMirroringQuickControlsAssertionWithReply:&stru_1003A2A08];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
}

- (void)acquireGroupSessionNearbyAssertionForSession:(id)a3
{
  id v4 = a3;
  -[MRDXPCUIController setHasGroupSessionNearbyAssertion:](self, "setHasGroupSessionNearbyAssertion:", 1LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  [v5 acquireGroupSessionNearbyAssertionForSession:v4 withReply:&stru_1003A2A28];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
}

- (void)releaseGroupSessionNearbyAssertion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  [v3 releaseGroupSessionNearbyAssertionWithReply:&stru_1003A2A48];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
}

- (void)acquireGroupSessionLowPowerPlatterAssertion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  [v3 acquireGroupSessionLowPowerPlatterAssertionWithReply:&stru_1003A2A68];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
}

- (void)releaseGroupSessionLowPowerPlatterAssertion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  [v3 releaseGroupSessionLowPowerPlatterAssertionWithReply:&stru_1003A2A88];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
}

- (void)nearbyGroupSessionDismissed:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController delegate](self, "delegate"));
  [v5 nearbyGroupSessionDismissed:v4];
}

- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
  unsigned __int8 v5 = [v4 supportManyRecommendationsPlatters];

  if ((v5 & 1) != 0 || !-[MRDXPCUIController hasLockScreenControlsAssertion](self, "hasLockScreenControlsAssertion"))
  {
    -[MRDXPCUIController setHasRouteRecommendationAssertion:](self, "setHasRouteRecommendationAssertion:", 1LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
    [v6 acquireRouteRecommendationAssertionForIdentifiers:v7 withReply:&stru_1003A2AA8];

    -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
  }
}

- (void)releaseRouteRecommendationAssertion
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDXPCUIController server](self, "server"));
  [v3 releaseRouteRecommendationAssertionWithReply:&stru_1003A2AC8];

  -[MRDXPCUIController _updateTransaction](self, "_updateTransaction");
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (MROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (BOOL)hasLockScreenControlsAssertion
{
  return self->_hasLockScreenControlsAssertion;
}

- (void)setHasLockScreenControlsAssertion:(BOOL)a3
{
  self->_hasLockScreenControlsAssertion = a3;
}

- (BOOL)hasQuickControlsAssertion
{
  return self->_hasQuickControlsAssertion;
}

- (void)setHasQuickControlsAssertion:(BOOL)a3
{
  self->_hasQuickControlsAssertion = a3;
}

- (BOOL)hasScreenMirroringQuickControlsAssertion
{
  return self->_hasScreenMirroringQuickControlsAssertion;
}

- (void)setHasScreenMirroringQuickControlsAssertion:(BOOL)a3
{
  self->_hasScreenMirroringQuickControlsAssertion = a3;
}

- (BOOL)hasGroupSessionNearbyAssertion
{
  return self->_hasGroupSessionNearbyAssertion;
}

- (void)setHasGroupSessionNearbyAssertion:(BOOL)a3
{
  self->_hasGroupSessionNearbyAssertion = a3;
}

- (BOOL)hasGroupSessionLowPowerAssertion
{
  return self->_hasGroupSessionLowPowerAssertion;
}

- (void)setHasGroupSessionLowPowerAssertion:(BOOL)a3
{
  self->_hasGroupSessionLowPowerAssertion = a3;
}

- (BOOL)hasRouteRecommendationAssertion
{
  return self->_hasRouteRecommendationAssertion;
}

- (void)setHasRouteRecommendationAssertion:(BOOL)a3
{
  self->_hasRouteRecommendationAssertion = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end