@interface CKDiscretionaryClientConnection
- (BOOL)isSpringBoardApp;
- (BOOL)requiresPastBuddy;
- (CKDiscretionaryClientConnection)initWithDaemon:(id)a3 connection:(id)a4;
- (CKDiscretionaryClientConnection)initWithDaemon:(id)a3 group:(id)a4 bundleID:(id)a5 isSpringBoardApp:(BOOL)a6 requiresPastBuddy:(BOOL)a7 scheduleSendBarrierBlock:(id)a8;
- (CKDiscretionaryDaemon)daemon;
- (NSMutableDictionary)tasksByOperationID;
- (NSString)bundleID;
- (NSString)group;
- (OS_dispatch_queue)serialQueue;
- (id)scheduleSendBarrierBlock;
- (void)cleanup;
- (void)finishOperationID:(id)a3;
- (void)handleCompletedTask:(id)a3 operationID:(id)a4;
- (void)queueOperationID:(id)a3 options:(id)a4 clientOperationCallbackProxyEndpoint:(id)a5 withBlock:(id)a6;
- (void)setBundleID:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setGroup:(id)a3;
- (void)setIsSpringBoardApp:(BOOL)a3;
- (void)setRequiresPastBuddy:(BOOL)a3;
- (void)setScheduleSendBarrierBlock:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTasksByOperationID:(id)a3;
@end

@implementation CKDiscretionaryClientConnection

- (CKDiscretionaryClientConnection)initWithDaemon:(id)a3 group:(id)a4 bundleID:(id)a5 isSpringBoardApp:(BOOL)a6 requiresPastBuddy:(BOOL)a7 scheduleSendBarrierBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CKDiscretionaryClientConnection;
  v18 = -[CKDiscretionaryClientConnection init](&v34, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_daemon, v14);
    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    id obj = a4;
    id v22 = v16;
    id v23 = v15;
    BOOL v24 = a7;
    v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 serialQueue]);
    dispatch_queue_t v26 = dispatch_queue_create_with_target_V2("com.apple.ckdiscretionaryd.connection", v21, v25);
    serialQueue = v19->_serialQueue;
    v19->_serialQueue = (OS_dispatch_queue *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    tasksByOperationID = v19->_tasksByOperationID;
    v19->_tasksByOperationID = (NSMutableDictionary *)v28;

    objc_storeStrong((id *)&v19->_bundleID, a5);
    v19->_isSpringBoardApp = a6;
    v19->_requiresPastBuddy = v24;
    id v15 = v23;
    id v16 = v22;
    id v30 = objc_retainBlock(v17);
    id scheduleSendBarrierBlock = v19->_scheduleSendBarrierBlock;
    v19->_id scheduleSendBarrierBlock = v30;

    objc_storeStrong((id *)&v19->_group, obj);
  }

  return v19;
}

- (CKDiscretionaryClientConnection)initWithDaemon:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _xpcConnection]);
  v9 = (void *)xpc_connection_copy_bundle_id();

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
    free(v9);
  }

  else
  {
    v10 = 0LL;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 _xpcConnection]);
  v12 = v10;
  id v13 = v10;
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v14 = (os_log_s *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Client is a PlugIn with bundle identifier %{public}@",  buf,  0xCu);
  }

  id v31 = 0LL;
  id v15 = [[LSApplicationExtensionRecord alloc] initWithBundleIdentifier:v13 error:&v31];
  id v16 = v31;
  if (v16)
  {
    if (ck_log_initialization_predicate != -1LL) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v17 = (os_log_s *)ck_log_facility_ck;
    v12 = v13;
    if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to initialize LSApplicationExtensionRecord with bundle id %@: %@",  buf,  0x16u);
    v12 = v13;
  }

  else
  {
    v12 = v13;
    if (v15)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v15 containingBundleRecord]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
    }
  }

  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
LABEL_18:
  v19 = (os_log_s *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Containing app for PlugIn is %{public}@",  buf,  0xCu);
  }

LABEL_21:
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:kCKAllowAccessDuringBuddyEntitlementKey]);
  v21 = (void *)v20;
  if (v20 && (objc_opt_respondsToSelector(v20, "BOOLValue") & 1) != 0)
  {
    uint64_t v22 = [v21 BOOLValue] ^ 1;
    if (v12) {
      goto LABEL_35;
    }
  }

  else
  {
    uint64_t v22 = 1LL;
    if (v12) {
      goto LABEL_35;
    }
  }

  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(buf, 0, 32);
  }
  v29[0] = *(_OWORD *)buf;
  v29[1] = *(_OWORD *)&buf[16];
  int v23 = CPCopyBundleIdentifierAndTeamFromAuditToken(v29, &v30, 0LL);
  if (v30) {
    BOOL v24 = v23 == 0;
  }
  else {
    BOOL v24 = 1;
  }
  if (v24) {
    v12 = 0LL;
  }
  else {
    v12 = v30;
  }
LABEL_35:
  objc_initWeak((id *)buf, v7);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100008D08;
  v27[3] = &unk_100010610;
  objc_copyWeak(&v28, (id *)buf);
  v25 = -[CKDiscretionaryClientConnection initWithDaemon:group:bundleID:isSpringBoardApp:requiresPastBuddy:scheduleSendBarrierBlock:]( self,  "initWithDaemon:group:bundleID:isSpringBoardApp:requiresPastBuddy:scheduleSendBarrierBlock:",  v6,  @"com.apple.ckdiscretionaryd",  v12,  v10 != 0LL,  v22,  v27);
  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

  return v25;
}

- (void)queueOperationID:(id)a3 options:(id)a4 clientOperationCallbackProxyEndpoint:(id)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = -[CKDOperationCallbackProxy initWithEndpoint:]( objc_alloc(&OBJC_CLASS___CKDOperationCallbackProxy),  "initWithEndpoint:",  v13);

  -[CKDOperationCallbackProxy activate](v14, "activate");
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100008FF4;
  v33[3] = &unk_100010638;
  id v15 = v14;
  objc_super v34 = v15;
  id v16 = v12;
  id v35 = v16;
  id v17 = objc_retainBlock(v33);
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v18 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    v19 = v18;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryClientConnection bundleID](self, "bundleID"));
    *(_DWORD *)buf = 138543874;
    id v37 = v10;
    __int16 v38 = 2112;
    v39 = v20;
    __int16 v40 = 2048;
    v41 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%{public}@ queued for %@ on connection %p",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000903C;
  v26[3] = &unk_1000106B0;
  objc_copyWeak(&v32, (id *)buf);
  id v30 = v15;
  id v31 = v17;
  id v27 = v10;
  id v28 = self;
  id v29 = v11;
  uint64_t v22 = v15;
  id v23 = v11;
  id v24 = v10;
  v25 = v17;
  dispatch_async((dispatch_queue_t)serialQueue, v26);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);
}

- (void)finishOperationID:(id)a3
{
  id v4 = a3;
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = (os_log_s *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@ finishing", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009930;
  block[3] = &unk_1000106D8;
  objc_copyWeak(&v11, (id *)buf);
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)cleanup
{
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v3 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryClientConnection bundleID](self, "bundleID"));
    *(_DWORD *)buf = 138543618;
    id v10 = v5;
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "cleanup for %{public}@ on connection %p",  buf,  0x16u);
  }

  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100009C58;
  v7[3] = &unk_100010700;
  objc_copyWeak(&v8, (id *)buf);
  v7[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)handleCompletedTask:(id)a3 operationID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_group_create();
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 callbackProxy]);
  if (v9)
  {
    dispatch_group_enter(v8);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100009FC0;
    v20[3] = &unk_100010538;
    v21 = v8;
    [v9 addBarrierBlock:v20];
  }

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100009FC8;
  v14[3] = &unk_100010728;
  id v15 = v6;
  id v16 = v9;
  id v11 = v9;
  id v12 = v6;
  objc_copyWeak(&v18, &location);
  id v17 = v7;
  id v13 = v7;
  dispatch_group_notify(v8, (dispatch_queue_t)serialQueue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isSpringBoardApp
{
  return self->_isSpringBoardApp;
}

- (void)setIsSpringBoardApp:(BOOL)a3
{
  self->_isSpringBoardApp = a3;
}

- (BOOL)requiresPastBuddy
{
  return self->_requiresPastBuddy;
}

- (void)setRequiresPastBuddy:(BOOL)a3
{
  self->_requiresPastBuddy = a3;
}

- (CKDiscretionaryDaemon)daemon
{
  return (CKDiscretionaryDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void)setDaemon:(id)a3
{
}

- (NSMutableDictionary)tasksByOperationID
{
  return self->_tasksByOperationID;
}

- (void)setTasksByOperationID:(id)a3
{
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (id)scheduleSendBarrierBlock
{
  return self->_scheduleSendBarrierBlock;
}

- (void)setScheduleSendBarrierBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end