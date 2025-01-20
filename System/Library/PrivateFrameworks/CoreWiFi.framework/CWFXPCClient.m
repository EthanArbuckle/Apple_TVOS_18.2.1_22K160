@interface CWFXPCClient
- (BOOL)allowRequestType:(int64_t)a3;
- (BOOL)beginActivity:(id)a3 requestParameters:(id)a4 error:(id *)a5;
- (BOOL)invalidated;
- (BOOL)startMonitoringEvent:(id)a3 requestParameters:(id)a4 error:(id *)a5;
- (CWFXPCClient)init;
- (CWFXPCClient)initWithServiceType:(int64_t)a3;
- (CWFXPCClient)initWithServiceType:(int64_t)a3 endpoint:(id)a4;
- (CWFXPCClient)initWithServiceType:(int64_t)a3 endpoint:(id)a4 remoteXPCProxyConnection:(id)a5;
- (CWFXPCClient)initWithServiceType:(int64_t)a3 remoteXPCProxyConnection:(id)a4;
- (CWFXPCProxyConnection)localXPCProxyConnection;
- (CWFXPCProxyConnection)remoteXPCProxyConnection;
- (OS_dispatch_queue)targetQueue;
- (id)eventHandlerWithEventID:(id)a3;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (int64_t)serviceType;
- (void)__acknowledgeEventWithUUID:(id)a3;
- (void)__beginActivity:(id)a3 requestParameters:(id)a4 reply:(id)a5;
- (void)__receivedEvent:(id)a3;
- (void)__startMonitoringEvent:(id)a3 requestParameters:(id)a4 reply:(id)a5;
- (void)clearAllEventHandlers;
- (void)dealloc;
- (void)endActivity:(id)a3 requestParameters:(id)a4;
- (void)endAllActivities:(id)a3;
- (void)invalidate;
- (void)receivedAcknowledgedXPCEvent:(id)a3 reply:(id)a4;
- (void)receivedXPCEvent:(id)a3;
- (void)resume;
- (void)setEventHandler:(id)a3 eventID:(id)a4;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRemoteXPCProxyConnection:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)stopMonitoringAllEvents:(id)a3;
- (void)stopMonitoringEvent:(id)a3 requestParameters:(id)a4;
- (void)suspend;
@end

@implementation CWFXPCClient

- (CWFXPCClient)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  -[CWFXPCClient dealloc](v3, v4);
  return result;
}

- (void)dealloc
{
  if (objc_msgSend_invalidated(self, a2, v2, v3, v4))
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___CWFXPCClient;
    -[CWFXPCClient dealloc](&v13, sel_dealloc);
  }

  else
  {
    objc_msgSend_exceptionWithName_reason_userInfo_( MEMORY[0x189603F70],  v6,  *MEMORY[0x189603A58],  (uint64_t)@"'invalidate' must be called before dealloc",  0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
    -[CWFXPCClient initWithServiceType:endpoint:remoteXPCProxyConnection:](v8, v9, v10, v11, v12);
  }

- (CWFXPCClient)initWithServiceType:(int64_t)a3 endpoint:(id)a4 remoteXPCProxyConnection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v98.receiver = self;
  v98.super_class = (Class)&OBJC_CLASS___CWFXPCClient;
  int64_t v10 = -[CWFXPCClient init](&v98, sel_init);
  v15 = v10;
  v16 = 0LL;
  v10->_serviceType = a3;
  v17 = (void *)NSString;
  sub_18644F860(a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = objc_msgSend_stringWithFormat_(v17, v19, (uint64_t)@"com.apple.corewifi.client-mutex.%@", v20, v21, v18);
  v27 = (const char *)objc_msgSend_UTF8String(v22, v23, v24, v25, v26);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v28 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v29 = dispatch_queue_create(v27, v28);
  mutex = v15->_mutex;
  v15->_mutex = (OS_dispatch_queue *)v29;

  if (!v15->_mutex) {
    goto LABEL_19;
  }
  v31 = (void *)NSString;
  sub_18644F860(v15->_serviceType);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  id v36 = objc_msgSend_stringWithFormat_(v31, v33, (uint64_t)@"com.apple.corewifi.client-event.%@", v34, v35, v32);
  v41 = (const char *)objc_msgSend_UTF8String(v36, v37, v38, v39, v40);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v42 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v43 = dispatch_queue_create(v41, v42);
  targetQueue = v15->_targetQueue;
  v15->_targetQueue = (OS_dispatch_queue *)v43;

  if (!v15->_targetQueue) {
    goto LABEL_19;
  }
  v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableEventIDMap = v15->_mutableEventIDMap;
  v15->_mutableEventIDMap = v45;

  if (!v15->_mutableEventIDMap) {
    goto LABEL_19;
  }
  v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableEventCallbackMap = v15->_mutableEventCallbackMap;
  v15->_mutableEventCallbackMap = v47;

  if (!v15->_mutableEventCallbackMap) {
    goto LABEL_19;
  }
  v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  mutableEventAckMap = v15->_mutableEventAckMap;
  v15->_mutableEventAckMap = v49;

  if (!v15->_mutableEventAckMap
    || (v51 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]),
        mutableActivityMap = v15->_mutableActivityMap,
        v15->_mutableActivityMap = v51,
        mutableActivityMap,
        !v15->_mutableActivityMap))
  {
LABEL_19:
    v16 = 0LL;
    goto LABEL_20;
  }

  if (!v9)
  {
    if (v8)
    {
      id v56 = objc_alloc(MEMORY[0x189607B30]);
      uint64_t v60 = objc_msgSend_initWithListenerEndpoint_(v56, v57, (uint64_t)v8, v58, v59);
      XPCConnection = v15->_XPCConnection;
      v15->_XPCConnection = (NSXPCConnection *)v60;

      v16 = 0LL;
    }

    else
    {
      sub_18644F860(v15->_serviceType);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16) {
        goto LABEL_20;
      }
      id v62 = objc_alloc(MEMORY[0x189607B30]);
      uint64_t v65 = objc_msgSend_initWithMachServiceName_options_(v62, v63, (uint64_t)v16, 4096, v64);
      v66 = v15->_XPCConnection;
      v15->_XPCConnection = (NSXPCConnection *)v65;
    }

    if (v15->_XPCConnection)
    {
      uint64_t v67 = sub_1864517F0(v15->_serviceType, 0LL, v12, v13, v14);
      if (v67)
      {
        v54 = (void *)v67;
        objc_msgSend_setRemoteObjectInterface_(v15->_XPCConnection, v11, v67, v13, v14);
        sub_186451A68(v15->_serviceType, v68, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setExportedInterface_(v15->_XPCConnection, v73, (uint64_t)v72, v74, v75);

        objc_msgSend_setExportedObject_(v15->_XPCConnection, v76, (uint64_t)v15, v77, v78);
        v79 = v15;
        uint64_t v80 = MEMORY[0x1895F87A8];
        v96[0] = MEMORY[0x1895F87A8];
        v96[1] = 3221225472LL;
        v96[2] = sub_18650CF4C;
        v96[3] = &unk_189E5BC10;
        v81 = v79;
        v97 = v81;
        objc_msgSend_setInterruptionHandler_(v15->_XPCConnection, v82, (uint64_t)v96, v83, v84);
        v93[0] = v80;
        v93[1] = 3221225472LL;
        v93[2] = sub_18650D4A0;
        v93[3] = &unk_189E5BF78;
        v94 = v81;
        v95 = v94;
        v85 = v15->_XPCConnection;
        remoteXPCProxyConnection = v94;
        objc_msgSend_setInvalidationHandler_(v85, v86, (uint64_t)v93, v87, v88);

        v15 = remoteXPCProxyConnection;
        goto LABEL_18;
      }
    }

- (CWFXPCClient)initWithServiceType:(int64_t)a3 remoteXPCProxyConnection:(id)a4
{
  return (CWFXPCClient *)MEMORY[0x189616718]( self,  sel_initWithServiceType_endpoint_remoteXPCProxyConnection_,  a3,  0LL,  a4);
}

- (CWFXPCClient)initWithServiceType:(int64_t)a3
{
  return (CWFXPCClient *)objc_msgSend_initWithServiceType_remoteXPCProxyConnection_(self, a2, a3, 0, v3);
}

- (CWFXPCClient)initWithServiceType:(int64_t)a3 endpoint:(id)a4
{
  return (CWFXPCClient *)MEMORY[0x189616718]( self,  sel_initWithServiceType_endpoint_remoteXPCProxyConnection_,  a3,  a4,  0LL);
}

- (void)resume
{
}

- (void)suspend
{
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  if (objc_msgSend_invalidated(obj, v2, v3, v4, v5))
  {
    objc_sync_exit(obj);
  }

  else
  {
    objc_msgSend_setInvalidated_(obj, v6, 1, v7, v8);
    objc_sync_exit(obj);

    uint64_t v9 = MEMORY[0x1895F87A8];
    mutex = (dispatch_queue_s *)obj->_mutex;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18650D8D4;
    block[3] = &unk_189E5BC10;
    block[4] = obj;
    dispatch_sync(mutex, block);
    objc_msgSend_setInterruptionHandler_(obj, v11, 0, v12, v13);
    XPCConnection = obj->_XPCConnection;
    if (XPCConnection)
    {
      objc_msgSend_invalidate(XPCConnection, (const char *)obj, v14, v15, v16);
    }

    else
    {
      objc_msgSend_remoteXPCProxyConnection(obj, (const char *)obj, v14, v15, v16);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_invalidate(v22, v23, v24, v25, v26);
    }

    objc_msgSend_targetQueue(obj, v18, v19, v20, v21);
    v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v29[0] = v9;
    v29[1] = 3221225472LL;
    v29[2] = sub_18650D908;
    v29[3] = &unk_189E5BC10;
    v29[4] = obj;
    dispatch_async(v27, v29);
  }

- (void)__beginActivity:(id)a3 requestParameters:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_allowRequestType_(self, v11, 171, v12, v13))
  {
    uint64_t v15 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_18650DB00;
    v27[3] = &unk_189E5D9C8;
    id v16 = v10;
    id v28 = v16;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v27, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = 3221225472LL;
    v23[2] = sub_18650DB14;
    v23[3] = &unk_189E5F2C8;
    v23[4] = self;
    id v24 = v8;
    id v25 = v9;
    id v26 = v16;
    objc_msgSend_beginActivity_requestParams_reply_(v20, v21, (uint64_t)v24, (uint64_t)v25, (uint64_t)v23);
  }

  else if (v10)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 45, 0);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v22);
  }
}

- (BOOL)beginActivity:(id)a3 requestParameters:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_18650D394;
  uint64_t v35 = sub_18650D3A4;
  id v36 = 0LL;
  if (objc_msgSend_allowRequestType_(self, v10, 171, v11, v12))
  {
    uint64_t v16 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = sub_18650DDF0;
    v30[3] = &unk_189E5D7F8;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v30, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    v29[1] = 3221225472LL;
    v29[2] = sub_18650DE00;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v31;
    objc_msgSend_beginActivity_requestParams_reply_(v17, v18, (uint64_t)v8, (uint64_t)v9, (uint64_t)v29);

    mutex = (dispatch_queue_s *)self->_mutex;
    block[0] = v16;
    block[1] = 3221225472LL;
    block[2] = sub_18650DE10;
    block[3] = &unk_189E5BEB8;
    id v26 = v8;
    v27 = self;
    id v28 = v9;
    dispatch_sync(mutex, block);

    uint64_t v20 = v26;
  }

  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 45, 0);
    uint64_t v20 = (void *)v32[5];
    v32[5] = v24;
  }

  uint64_t v21 = (void *)v32[5];
  if (a5 && v21)
  {
    *a5 = v21;
    uint64_t v21 = (void *)v32[5];
  }

  BOOL v22 = v21 == 0LL;
  _Block_object_dispose(&v31, 8);

  return v22;
}

- (void)endActivity:(id)a3 requestParameters:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (objc_msgSend_allowRequestType_(self, v7, 172, v8, v9))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v10, (uint64_t)&unk_189E5F2E8, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUID(v21, v14, v15, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endActivityWithUUID_requestParams_reply_(v13, v19, (uint64_t)v18, (uint64_t)v6, (uint64_t)&unk_189E5F308);

    mutex = (dispatch_queue_s *)self->_mutex;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18650DF44;
    block[3] = &unk_189E5BF78;
    id v23 = v21;
    uint64_t v24 = self;
    dispatch_sync(mutex, block);
  }
}

- (void)endAllActivities:(id)a3
{
  id v14 = a3;
  if (objc_msgSend_allowRequestType_(self, v4, 172, v5, v6))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v7, (uint64_t)&unk_189E5F328, v8, v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endAllActivitiesWithRequestParams_reply_(v10, v11, (uint64_t)v14, (uint64_t)&unk_189E5F348, v12);

    mutex = (dispatch_queue_s *)self->_mutex;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18650E034;
    block[3] = &unk_189E5BC10;
    void block[4] = self;
    dispatch_sync(mutex, block);
  }
}

- (void)__startMonitoringEvent:(id)a3 requestParameters:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_allowRequestType_(self, v11, 169, v12, v13))
  {
    uint64_t v15 = MEMORY[0x1895F87A8];
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = sub_18650E1F0;
    v27[3] = &unk_189E5D9C8;
    id v16 = v10;
    id v28 = v16;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v17, (uint64_t)v27, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = 3221225472LL;
    v23[2] = sub_18650E204;
    v23[3] = &unk_189E5F2C8;
    v23[4] = self;
    id v24 = v8;
    id v25 = v9;
    id v26 = v16;
    objc_msgSend_startMonitoringEvent_requestParams_reply_(v20, v21, (uint64_t)v24, (uint64_t)v25, (uint64_t)v23);
  }

  else if (v10)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v14, *MEMORY[0x189607688], 45, 0);
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v22);
  }
}

- (BOOL)startMonitoringEvent:(id)a3 requestParameters:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_18650D394;
  uint64_t v35 = sub_18650D3A4;
  id v36 = 0LL;
  if (objc_msgSend_allowRequestType_(self, v10, 169, v11, v12))
  {
    uint64_t v16 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = sub_18650E4E0;
    v30[3] = &unk_189E5D7F8;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v30, v14, v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    v29[1] = 3221225472LL;
    v29[2] = sub_18650E4F0;
    v29[3] = &unk_189E5D7F8;
    v29[4] = &v31;
    objc_msgSend_startMonitoringEvent_requestParams_reply_(v17, v18, (uint64_t)v8, (uint64_t)v9, (uint64_t)v29);

    mutex = (dispatch_queue_s *)self->_mutex;
    block[0] = v16;
    block[1] = 3221225472LL;
    block[2] = sub_18650E500;
    block[3] = &unk_189E5BEB8;
    id v26 = v8;
    v27 = self;
    id v28 = v9;
    dispatch_sync(mutex, block);

    uint64_t v20 = v26;
  }

  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v13, *MEMORY[0x189607688], 45, 0);
    uint64_t v20 = (void *)v32[5];
    v32[5] = v24;
  }

  id v21 = (void *)v32[5];
  if (a5 && v21)
  {
    *a5 = v21;
    id v21 = (void *)v32[5];
  }

  BOOL v22 = v21 == 0LL;
  _Block_object_dispose(&v31, 8);

  return v22;
}

- (void)stopMonitoringEvent:(id)a3 requestParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self, v8, 170, v9, v10))
  {
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v11, (uint64_t)&unk_189E5F368, v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = sub_18650E608;
    v16[3] = &unk_189E5BF50;
    v16[4] = self;
    id v17 = v6;
    objc_msgSend_stopMonitoringEvent_requestParams_reply_(v14, v15, (uint64_t)v17, (uint64_t)v7, (uint64_t)v16);
  }
}

- (void)stopMonitoringAllEvents:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_allowRequestType_(self, v5, 170, v6, v7))
  {
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)&unk_189E5F388, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = sub_18650E760;
    v14[3] = &unk_189E5D398;
    v14[4] = self;
    objc_msgSend_stopMonitoringAllEventsWithRequestParams_reply_(v11, v12, (uint64_t)v4, (uint64_t)v14, v13);
  }
}

- (void)setEventHandler:(id)a3 eventID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutex = (dispatch_queue_s *)self->_mutex;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18650E898;
  block[3] = &unk_189E5C2E8;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(mutex, block);
}

- (id)eventHandlerWithEventID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_18650E9C4;
  id v17 = sub_18650E9EC;
  id v18 = 0LL;
  mutex = (dispatch_queue_s *)self->_mutex;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18650E9F4;
  block[3] = &unk_189E5CFB8;
  uint64_t v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(mutex, block);
  id v7 = (void *)MEMORY[0x186E3B038](v14[5]);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)clearAllEventHandlers
{
  mutex = (dispatch_queue_s *)self->_mutex;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18650EAA0;
  block[3] = &unk_189E5BC10;
  void block[4] = self;
  dispatch_sync(mutex, block);
}

- (CWFXPCProxyConnection)localXPCProxyConnection
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___CWFXPCProxyConnection);
  id v7 = (void *)objc_msgSend_initWithForwardingTarget_(v3, v4, (uint64_t)self, v5, v6);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = sub_18650EB4C;
  v12[3] = &unk_189E5BC10;
  v12[4] = self;
  objc_msgSend_setInvalidationHandler_(v7, v8, (uint64_t)v12, v9, v10);
  return (CWFXPCProxyConnection *)v7;
}

- (BOOL)allowRequestType:(int64_t)a3
{
  uint64_t v7 = objc_msgSend_serviceType(self, a2, a3, v3, v4);
  sub_186451960(v7, v8, v9, v10, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v13, a3, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  int v20 = objc_msgSend_containsObject_(v12, v17, (uint64_t)v16, v18, v19);

  if (v20)
  {
    id v21 = self;
    objc_sync_enter(v21);
    objc_msgSend_remoteObjectInterface(v21->_XPCConnection, v22, v23, v24, v25);
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18645107C(a3, v26);

    objc_sync_exit(v21);
  }

  return v20;
}

- (id)remoteObjectProxy
{
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_remoteXPCProxyConnection(self, v6, v7, v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteObjectProxy(v11, v12, v13, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend_remoteObjectProxy(self->_XPCConnection, v6, v7, v8, v9);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_remoteXPCProxyConnection(self, v5, v6, v7, v8);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_remoteXPCProxyConnection(self, v9, v10, v11, v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v14, v15, (uint64_t)v4, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend_remoteObjectProxyWithErrorHandler_(self->_XPCConnection, v9, (uint64_t)v4, v11, v12);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_remoteXPCProxyConnection(self, v5, v6, v7, v8);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_remoteXPCProxyConnection(self, v9, v10, v11, v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v14, v15, (uint64_t)v4, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCConnection, v9, (uint64_t)v4, v11, v12);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (void)__receivedEvent:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = sub_18650E9C4;
  uint64_t v34 = sub_18650E9EC;
  id v35 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  mutex = (dispatch_queue_s *)self->_mutex;
  uint64_t v18 = MEMORY[0x1895F87A8];
  uint64_t v19 = 3221225472LL;
  int v20 = sub_18650F050;
  id v21 = &unk_189E5F3B0;
  id v6 = v4;
  id v22 = v6;
  uint64_t v23 = self;
  uint64_t v24 = &v26;
  uint64_t v25 = &v30;
  dispatch_sync(mutex, &v18);
  if (*((_BYTE *)v27 + 24))
  {
    uint64_t v11 = v31[5];
    if (v11)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    }

    else
    {
      objc_msgSend_acknowledge(v6, v7, v8, v9, v10, v18, v19, v20, v21);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend_acknowledge(v6, v13, v14, v15, v16);
        uint64_t v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v17[2]();
      }
    }
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

- (void)__acknowledgeEventWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = sub_18650E9C4;
  uint64_t v15 = sub_18650E9EC;
  id v16 = 0LL;
  mutex = (dispatch_queue_s *)self->_mutex;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18650F348;
  block[3] = &unk_189E5C270;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  id v9 = v6;
  dispatch_sync(mutex, block);
  uint64_t v7 = v12[5];
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }

  _Block_object_dispose(&v11, 8);
}

- (void)receivedXPCEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___CWFEvent);
  uint64_t v10 = objc_msgSend_type(v4, v6, v7, v8, v9);
  objc_msgSend_interfaceName(v4, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v16, v10, (uint64_t)v15, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventID_(v5, v19, (uint64_t)v18, v20, v21);

  objc_msgSend_timestamp(v4, v22, v23, v24, v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimestamp_(v5, v27, (uint64_t)v26, v28, v29);

  objc_msgSend_info(v4, v30, v31, v32, v33);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setInfo_(v5, v35, (uint64_t)v34, v36, v37);
  objc_msgSend_targetQueue(self, v38, v39, v40, v41);
  v42 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1895F87A8];
  v44[1] = 3221225472LL;
  v44[2] = sub_18650F4EC;
  v44[3] = &unk_189E5BF78;
  v44[4] = self;
  v45 = v5;
  dispatch_queue_t v43 = v5;
  dispatch_async(v42, v44);
}

- (void)receivedAcknowledgedXPCEvent:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___CWFEvent);
  uint64_t v13 = objc_msgSend_type(v7, v9, v10, v11, v12);
  objc_msgSend_interfaceName(v7, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v19, v13, (uint64_t)v18, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventID_(v8, v22, (uint64_t)v21, v23, v24);

  objc_msgSend_timestamp(v7, v25, v26, v27, v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimestamp_(v8, v30, (uint64_t)v29, v31, v32);

  uint64_t v37 = objc_msgSend_acknowledgementTimeout(v7, v33, v34, v35, v36);
  objc_msgSend_setAcknowledgementTimeout_(v8, v38, v37, v39, v40);
  objc_msgSend_info(v7, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setInfo_(v8, v46, (uint64_t)v45, v47, v48);
  objc_msgSend_UUID(v8, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v54 = MEMORY[0x1895F87A8];
  mutex = (dispatch_queue_s *)self->_mutex;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18650F790;
  block[3] = &unk_189E5C2E8;
  void block[4] = self;
  id v56 = v53;
  id v83 = v56;
  id v84 = v6;
  id v57 = v6;
  dispatch_async(mutex, block);
  v80[0] = v54;
  v80[1] = 3221225472LL;
  v80[2] = sub_18650F7E0;
  v80[3] = &unk_189E5BF78;
  v80[4] = self;
  id v58 = v56;
  id v81 = v58;
  objc_msgSend_setAcknowledge_(v8, v59, (uint64_t)v80, v60, v61);
  int64_t v66 = objc_msgSend_acknowledgementTimeout(v8, v62, v63, v64, v65);
  dispatch_time_t v67 = dispatch_time(0LL, v66);
  v68 = (dispatch_queue_s *)self->_mutex;
  v78[0] = v54;
  v78[1] = 3221225472LL;
  v78[2] = sub_18650F7EC;
  v78[3] = &unk_189E5BF78;
  v78[4] = self;
  id v79 = v58;
  id v69 = v58;
  dispatch_after(v67, v68, v78);
  objc_msgSend_targetQueue(self, v70, v71, v72, v73);
  uint64_t v74 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v76[0] = v54;
  v76[1] = 3221225472LL;
  v76[2] = sub_18650F824;
  v76[3] = &unk_189E5BF78;
  v76[4] = self;
  uint64_t v77 = v8;
  uint64_t v75 = v8;
  dispatch_async(v74, v76);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setTargetQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 80LL, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 88LL, 1);
}

- (void)setInterruptionHandler:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (CWFXPCProxyConnection)remoteXPCProxyConnection
{
  return self->_remoteXPCProxyConnection;
}

- (void)setRemoteXPCProxyConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end