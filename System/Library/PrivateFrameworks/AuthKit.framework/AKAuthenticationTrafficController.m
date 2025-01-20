@interface AKAuthenticationTrafficController
+ (AKAuthenticationTrafficController)sharedInstance;
- (AKAuthenticationSurrogateManager)surrogateManager;
- (AKAuthenticationTrafficController)init;
- (BOOL)_hasActiveAppAuths;
- (BOOL)_hasActiveAuthenticatedRequests;
- (BOOL)_hasActiveDaemonAuths;
- (BOOL)_hasValuesInMap:(id)a3;
- (BOOL)_isForegroundAuthenticationInProgress;
- (BOOL)_shouldClearLimitedUICapableAuth:(id)a3;
- (BOOL)_shouldClearRequest:(id)a3;
- (BOOL)_shouldClearUICapableAuth:(id)a3;
- (NSMutableArray)pendingTrafficRequests;
- (NSMutableDictionary)authenticatedServerEndpointRequests;
- (NSMutableDictionary)authenticatingApps;
- (NSMutableDictionary)authenticatingDaemons;
- (id)_nextClearedRequest;
- (void)_clearNextEligibleRequest;
- (void)_clearNextEligibleRequestWithUpdateBlock:(id)a3;
- (void)_processClearanceRequest:(id)a3 withClient:(id)a4;
- (void)_removeAuthenticationRequestForContext:(id)a3 client:(id)a4;
- (void)_tq_addContext:(id)a3 toAuthenticatingAppsforClient:(id)a4;
- (void)_tq_addContext:(id)a3 toAuthenticatingDaemonsforClient:(id)a4;
- (void)_tq_addContext:(id)a3 toAuthenticatingRequestsforClient:(id)a4;
- (void)_tq_addContext:(id)a3 toRequestDictionary:(id)a4 forClient:(id)a5;
- (void)_tq_invokeTrafficRequest:(id)a3;
- (void)_updateContext:(id)a3 withPassword:(id)a4 forAppleID:(id)a5;
- (void)_updateContextWithCachedPassword:(id)a3;
- (void)beginAuthenticatedRequestWithContext:(id)a3 client:(id)a4 clearanceHandler:(id)a5;
- (void)endAuthenticatedRequestWithContext:(id)a3 client:(id)a4 clearanceHandler:(id)a5;
- (void)endAuthenticationForAppleID:(id)a3 password:(id)a4 error:(id)a5 context:(id)a6 client:(id)a7 clearanceHandler:(id)a8;
- (void)flushCachedPasswords;
- (void)setAuthenticatedServerEndpointRequests:(id)a3;
- (void)setAuthenticatingApps:(id)a3;
- (void)setAuthenticatingDaemons:(id)a3;
- (void)setPendingTrafficRequests:(id)a3;
- (void)setSurrogateManager:(id)a3;
- (void)uplevelAuthenticationForUIWithContext:(id)a3 client:(id)a4 completion:(id)a5;
@end

@implementation AKAuthenticationTrafficController

+ (AKAuthenticationTrafficController)sharedInstance
{
  if (qword_10020F578 != -1) {
    dispatch_once(&qword_10020F578, &stru_1001CA3C8);
  }
  return (AKAuthenticationTrafficController *)(id)qword_10020F570;
}

- (AKAuthenticationTrafficController)init
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___AKAuthenticationTrafficController;
  v2 = -[AKAuthenticationTrafficController init](&v26, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingTrafficRequests = v2->_pendingTrafficRequests;
    v2->_pendingTrafficRequests = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    authenticatingApps = v2->_authenticatingApps;
    v2->_authenticatingApps = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    authenticatingDaemons = v2->_authenticatingDaemons;
    v2->_authenticatingDaemons = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    authenticatedServerEndpointRequests = v2->_authenticatedServerEndpointRequests;
    v2->_authenticatedServerEndpointRequests = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___AKExpiringCache);
    expiringCache = v2->_expiringCache;
    v2->_expiringCache = v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);

    dispatch_queue_t v17 = dispatch_queue_create("AKATCClearanceQueue", v16);
    clearanceQueue = v2->_clearanceQueue;
    v2->_clearanceQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INITIATED, 0);
    v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);

    dispatch_queue_t v23 = dispatch_queue_create("AKAuthTrafficQueue", v22);
    trafficQueue = v2->_trafficQueue;
    v2->_trafficQueue = (OS_dispatch_queue *)v23;
  }

  return v2;
}

- (void)beginAuthenticatedRequestWithContext:(id)a3 client:(id)a4 clearanceHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  trafficQueue = (dispatch_queue_s *)self->_trafficQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100096964;
  v15[3] = &unk_1001C6E88;
  id v16 = v9;
  id v17 = v8;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(trafficQueue, v15);
}

- (void)endAuthenticatedRequestWithContext:(id)a3 client:(id)a4 clearanceHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogSystem(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10013DEB8();
  }

  trafficQueue = (dispatch_queue_s *)self->_trafficQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100096BBC;
  v17[3] = &unk_1001C6E88;
  id v18 = v9;
  id v19 = self;
  id v20 = v8;
  id v21 = v10;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_async(trafficQueue, v17);
}

- (void)endAuthenticationForAppleID:(id)a3 password:(id)a4 error:(id)a5 context:(id)a6 client:(id)a7 clearanceHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = _AKLogSystem(v19);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_10013E0C4();
  }

  trafficQueue = (dispatch_queue_s *)self->_trafficQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100096EC8;
  block[3] = &unk_1001CA418;
  block[4] = self;
  id v30 = v17;
  id v31 = v18;
  id v32 = v15;
  id v33 = v16;
  id v34 = v14;
  id v35 = v19;
  id v23 = v19;
  id v24 = v14;
  id v25 = v16;
  id v26 = v15;
  id v27 = v18;
  id v28 = v17;
  dispatch_async(trafficQueue, block);
}

- (void)uplevelAuthenticationForUIWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned __int8 v12 = [v11 isSilentAuthenticationRequestSerializationEnabled];

  if ((v12 & 1) != 0)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 bundleID]);
    id v15 = (void *)v14;
    id v16 = @"com.apple.ak.unknown";
    if (v14) {
      id v16 = (__CFString *)v14;
    }
    id v17 = v16;

    trafficQueue = (dispatch_queue_s *)self->_trafficQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100097384;
    v22[3] = &unk_1001C6E88;
    v22[4] = self;
    id v23 = v17;
    id v24 = v8;
    id v25 = v10;
    id v19 = v17;
    dispatch_async(trafficQueue, v22);
  }

  else
  {
    uint64_t v20 = _AKLogSystem(v13);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Silent authentication serialization is disabled, skipping uplevel to UI...",  buf,  2u);
    }

    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1LL, 0LL);
  }
}

- (void)_removeAuthenticationRequestForContext:(id)a3 client:(id)a4
{
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([a4 bundleID]);
  id v8 = (void *)v7;
  id v9 = @"com.apple.ak.unknown";
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  id v10 = v9;

  uint64_t v12 = _AKLogSystem(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10013E33C();
  }

  if ([v6 _capabilityForUIDisplay] == (id)3)
  {
    uint64_t v14 = _AKLogSystem(3LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Surrogate context is done", v18, 2u);
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_authenticatingApps,  "objectForKeyedSubscript:",  v10));
  [v16 removeObject:v6];

  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_authenticatingDaemons,  "objectForKeyedSubscript:",  v10));
  [v17 removeObject:v6];
}

- (void)flushCachedPasswords
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing the password cache.", v5, 2u);
  }

  -[AKExpiringCache flushCacheForced:](self->_expiringCache, "flushCacheForced:", 1LL);
}

- (BOOL)_shouldClearRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10013E624();
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 authContext]);
  if (!v7)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    unsigned int v15 = [v14 isAuthenticatedRequestSerializationEnabled];

    if (v15)
    {
      BOOL v17 = -[AKAuthenticationTrafficController _hasActiveDaemonAuths](self, "_hasActiveDaemonAuths");
      BOOL v18 = v17;
      uint64_t v19 = _AKLogSystem(v17);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      BOOL v20 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
      if (v18)
      {
        if (v20) {
          sub_10013E39C(v4, v13);
        }
        goto LABEL_15;
      }

      if (v20) {
        sub_10013E41C();
      }
    }

    else
    {
      uint64_t v26 = _AKLogSystem(v16);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_10013E448();
      }
    }

    goto LABEL_36;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationTrafficController surrogateManager](self, "surrogateManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 clientBundleID]);
  unsigned int v10 = [v8 isSurrogateAuthInProgressForClientBundleID:v9];

  if (!v10)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    if ([v21 isAuthenticatedRequestSerializationEnabled])
    {
      unsigned int v22 = -[AKAuthenticationTrafficController _hasActiveAuthenticatedRequests]( self,  "_hasActiveAuthenticatedRequests");

      if (v22)
      {
        uint64_t v24 = _AKLogSystem(v23);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_10013E4F4(v4, v13);
        }
        goto LABEL_15;
      }
    }

    else
    {
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    if ([v27 isSilentAuthenticationRequestSerializationEnabled])
    {

LABEL_24:
      if (-[AKAuthenticationTrafficController _hasActiveAppAuths](self, "_hasActiveAppAuths")
        || (BOOL v32 = -[AKAuthenticationTrafficController _hasActiveDaemonAuths](self, "_hasActiveDaemonAuths")))
      {
        BOOL v33 = -[AKAuthenticationTrafficController _shouldClearUICapableAuth:](self, "_shouldClearUICapableAuth:", v4);
        if (v33)
        {
          uint64_t v34 = _AKLogSystem(v33);
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            sub_10013E574();
          }
        }

        else
        {
          BOOL v35 = -[AKAuthenticationTrafficController _shouldClearLimitedUICapableAuth:]( self,  "_shouldClearLimitedUICapableAuth:",  v4);
          if (!v35)
          {
            BOOL v25 = 0;
            goto LABEL_38;
          }

          uint64_t v36 = _AKLogSystem(v35);
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            sub_10013E5A0();
          }
        }
      }

      else
      {
        uint64_t v37 = _AKLogSystem(v32);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_10013E5CC();
        }
      }

      goto LABEL_36;
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v4 authContext]);
    id v29 = [v28 authenticationType];

    if (v29 != (id)1) {
      goto LABEL_24;
    }
    uint64_t v31 = _AKLogSystem(v30);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10013E5F8();
    }
LABEL_36:
    BOOL v25 = 1;
    goto LABEL_37;
  }

  uint64_t v12 = _AKLogSystem(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10013E474(v4, v13);
  }
LABEL_15:
  BOOL v25 = 0;
LABEL_37:

LABEL_38:
  return v25;
}

- (void)_processClearanceRequest:(id)a3 withClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = _AKLogSystem(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10013E894();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 authContext]);
  id v9 = [v8 _capabilityForUIDisplay];

  if (v9 == (id)3)
  {
    uint64_t v11 = _AKLogSystem(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10013E708(v5, v12);
    }
  }

  else
  {
    BOOL v13 = -[AKAuthenticationTrafficController _shouldClearRequest:](self, "_shouldClearRequest:", v5);
    BOOL v14 = v13;
    uint64_t v15 = _AKLogSystem(v13);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v17) {
        sub_10013E79C();
      }

      -[AKAuthenticationTrafficController _tq_invokeTrafficRequest:](self, "_tq_invokeTrafficRequest:", v5);
    }

    else
    {
      if (v17) {
        sub_10013E7FC((uint64_t)self);
      }

      -[NSMutableArray addObject:](self->_pendingTrafficRequests, "addObject:", v5);
    }
  }
}

- (BOOL)_hasActiveDaemonAuths
{
  return -[AKAuthenticationTrafficController _hasValuesInMap:](self, "_hasValuesInMap:", self->_authenticatingDaemons);
}

- (BOOL)_hasActiveAppAuths
{
  return -[AKAuthenticationTrafficController _hasValuesInMap:](self, "_hasValuesInMap:", self->_authenticatingApps);
}

- (BOOL)_hasActiveAuthenticatedRequests
{
  return -[AKAuthenticationTrafficController _hasValuesInMap:]( self,  "_hasValuesInMap:",  self->_authenticatedServerEndpointRequests);
}

- (BOOL)_hasValuesInMap:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100097BB4;
  v6[3] = &unk_1001CA440;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)_shouldClearUICapableAuth:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authContext]);

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 authContext]);
    if ([v6 _capabilityForUIDisplay] == (id)2)
    {
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 authContext]);
      unsigned int v10 = [v9 _performUIOutOfProcess];

      if (!v10)
      {
        uint64_t v21 = _AKLogSystem(v7);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_10013E988();
        }
        BOOL v8 = 0;
        goto LABEL_16;
      }
    }

    uint64_t v11 = _AKLogSystem(v7);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10013E928();
    }

    authenticatingApps = self->_authenticatingApps;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v4 clientBundleID]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](authenticatingApps, "objectForKeyedSubscript:", v14));
    id v16 = [v15 count];

    if (v16)
    {
      uint64_t v18 = _AKLogSystem(v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v20 = self->_authenticatingApps;
        int v23 = 138412546;
        id v24 = v4;
        __int16 v25 = 2112;
        uint64_t v26 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Clearing UI capable auth request for %@ while another auth is in progress: %@",  (uint8_t *)&v23,  0x16u);
      }

      BOOL v8 = 1;
LABEL_16:

      goto LABEL_17;
    }

    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

- (BOOL)_shouldClearLimitedUICapableAuth:(id)a3
{
  BOOL v4 = -[AKAuthenticationTrafficController _hasActiveDaemonAuths](self, "_hasActiveDaemonAuths", a3);
  if (!v4) {
    return !-[AKAuthenticationTrafficController _isForegroundAuthenticationInProgress]( self,  "_isForegroundAuthenticationInProgress");
  }
  uint64_t v5 = _AKLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10013EA44();
  }

  return 0;
}

- (BOOL)_isForegroundAuthenticationInProgress
{
  uint64_t v3 = _AKLogSystem(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10013EAA8();
  }

  uint64_t v9 = 0LL;
  unsigned int v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  authenticatingApps = self->_authenticatingApps;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100097F04;
  v8[3] = &unk_1001CA440;
  v8[4] = &v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( authenticatingApps,  "enumerateKeysAndObjectsUsingBlock:",  v8);
  char v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)_tq_invokeTrafficRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clientBundleID]);
  char v6 = (void *)objc_claimAutoreleasedReturnValue([v4 authContext]);

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 authContext]);
    id v8 = [v7 _capabilityForUIDisplay];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
    if (v8 == (id)2) {
      -[AKAuthenticationTrafficController _tq_addContext:toAuthenticatingAppsforClient:]( self,  "_tq_addContext:toAuthenticatingAppsforClient:",  v9,  v5);
    }
    else {
      -[AKAuthenticationTrafficController _tq_addContext:toAuthenticatingDaemonsforClient:]( self,  "_tq_addContext:toAuthenticatingDaemonsforClient:",  v9,  v5);
    }
    goto LABEL_7;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);

  if (v10)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
    -[AKAuthenticationTrafficController _tq_addContext:toAuthenticatingRequestsforClient:]( self,  "_tq_addContext:toAuthenticatingRequestsforClient:",  v9,  v5);
LABEL_7:
  }

  clearanceQueue = (dispatch_queue_s *)self->_clearanceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000980D0;
  block[3] = &unk_1001C7300;
  id v14 = v4;
  id v12 = v4;
  dispatch_async(clearanceQueue, block);
}

- (void)_tq_addContext:(id)a3 toAuthenticatingAppsforClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013EB38();
  }

  -[AKAuthenticationTrafficController _tq_addContext:toRequestDictionary:forClient:]( self,  "_tq_addContext:toRequestDictionary:forClient:",  v7,  self->_authenticatingApps,  v6);
}

- (void)_tq_addContext:(id)a3 toAuthenticatingDaemonsforClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013EB98();
  }

  -[AKAuthenticationTrafficController _tq_addContext:toRequestDictionary:forClient:]( self,  "_tq_addContext:toRequestDictionary:forClient:",  v7,  self->_authenticatingDaemons,  v6);
}

- (void)_tq_addContext:(id)a3 toAuthenticatingRequestsforClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10013EBF8();
  }

  -[AKAuthenticationTrafficController _tq_addContext:toRequestDictionary:forClient:]( self,  "_tq_addContext:toRequestDictionary:forClient:",  v7,  self->_authenticatedServerEndpointRequests,  v6);
}

- (void)_tq_addContext:(id)a3 toRequestDictionary:(id)a4 forClient:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 addObject:v7];
  }

  else
  {
    id v14 = v7;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    id v13 = [v12 mutableCopy];
    [v8 setObject:v13 forKeyedSubscript:v9];
  }
}

- (void)_clearNextEligibleRequest
{
}

- (void)_clearNextEligibleRequestWithUpdateBlock:(id)a3
{
  id v4 = (void (**)(id, os_log_s *))a3;
  if (-[NSMutableArray count](self->_pendingTrafficRequests, "count"))
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationTrafficController _nextClearedRequest](self, "_nextClearedRequest"));
    uint64_t v6 = _AKLogSystem(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v8) {
        sub_10013ECB0();
      }

      if (v4) {
        v4[2](v4, v5);
      }
      -[AKAuthenticationTrafficController _tq_invokeTrafficRequest:](self, "_tq_invokeTrafficRequest:", v5);
      -[NSMutableArray removeObject:](self->_pendingTrafficRequests, "removeObject:", v5);
    }

    else
    {
      if (v8) {
        sub_10013EC84();
      }
    }
  }

  else
  {
    uint64_t v9 = _AKLogSystem(0LL);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10013EC58();
    }
  }
}

- (id)_nextClearedRequest
{
  pendingTrafficRequests = self->_pendingTrafficRequests;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100098588;
  v4[3] = &unk_1001CA468;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[NSMutableArray aaf_firstObjectPassingTest:]( pendingTrafficRequests,  "aaf_firstObjectPassingTest:",  v4));
}

- (void)_updateContext:(id)a3 withPassword:(id)a4 forAppleID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 _password]);

    if (!v10 && [v7 authenticationType] != (id)2)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
      id v12 = v11;
      if (v11)
      {
        id v13 = [v11 isEqual:v9];
        if ((_DWORD)v13)
        {
          uint64_t v14 = _AKLogSystem(v13);
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v16 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Passing password down to next queued client.",  v16,  2u);
          }

          [v7 _setPassword:v8];
        }
      }
    }
  }
}

- (void)_updateContextWithCachedPassword:(id)a3
{
  id v4 = a3;
  id v5 = [v4 serviceType];
  if (v5 == (id)2
    || (id v5 = [v4 isContextEligibleForSilentAuth], !(_DWORD)v5)
    || (id v5 = [v4 ignorePasswordCache], (v5 & 1) != 0)
    || (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _password]), v6, v6))
  {
    uint64_t v7 = _AKLogSystem(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring password cache", buf, 2u);
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);

    if (!v9) {
      goto LABEL_8;
    }
    expiringCache = self->_expiringCache;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AKExpiringCache objectForKey:](expiringCache, "objectForKey:", v11));

    if (v8)
    {
      uint64_t v13 = _AKLogSystem(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Password populated from cache.", v15, 2u);
      }

      [v4 _setPassword:v8];
    }
  }

LABEL_8:
}

- (AKAuthenticationSurrogateManager)surrogateManager
{
  return self->_surrogateManager;
}

- (void)setSurrogateManager:(id)a3
{
}

- (NSMutableArray)pendingTrafficRequests
{
  return self->_pendingTrafficRequests;
}

- (void)setPendingTrafficRequests:(id)a3
{
}

- (NSMutableDictionary)authenticatingApps
{
  return self->_authenticatingApps;
}

- (void)setAuthenticatingApps:(id)a3
{
}

- (NSMutableDictionary)authenticatingDaemons
{
  return self->_authenticatingDaemons;
}

- (void)setAuthenticatingDaemons:(id)a3
{
}

- (NSMutableDictionary)authenticatedServerEndpointRequests
{
  return self->_authenticatedServerEndpointRequests;
}

- (void)setAuthenticatedServerEndpointRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end