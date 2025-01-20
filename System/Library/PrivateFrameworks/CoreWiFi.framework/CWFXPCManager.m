@interface CWFXPCManager
- (CWFPrivateMACManager)privateMACManager;
- (CWFXPCManager)init;
- (CWFXPCManager)initWithServiceTypes:(id)a3;
- (CWFXPCManagerDelegate)delegate;
- (NSSet)supportedRequestTypes;
- (id)endpointWithServiceType:(int64_t)a3;
- (id)localXPCClientWithServiceType:(int64_t)a3;
- (id)registeredActivities;
- (id)registeredEventIDs;
- (void)XPCListener:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5;
- (void)XPCListener:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5;
- (void)XPCListener:(id)a3 XPCConnection:(id)a4 updatedRegisteredEventIDs:(id)a5;
- (void)XPCListener:(id)a3 invalidatedXPCConnection:(id)a4;
- (void)XPCRequestProxy:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5;
- (void)XPCRequestProxy:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5;
- (void)XPCRequestProxy:(id)a3 invalidatedXPCConnection:(id)a4;
- (void)XPCRequestProxy:(id)a3 sendXPCEvent:(id)a4 reply:(id)a5;
- (void)__updateProcessMonitorConfiguration;
- (void)invalidate;
- (void)resume;
- (void)sendXPCEvent:(id)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSupportedRequestTypes:(id)a3;
- (void)setTargetQueue:(id)a3 requestType:(int64_t)a4 interfaceName:(id)a5;
- (void)suspend;
@end

@implementation CWFXPCManager

- (CWFXPCManager)initWithServiceTypes:(id)a3
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___CWFXPCManager;
  v5 = -[CWFXPCManager init](&v54, sel_init);
  if (v5)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      CWFGetOSLog();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        CWFGetOSLog();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v21 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v47 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v53 = 0;
        _os_log_send_and_compose_impl();
      }

- (void)setTargetQueue:(id)a3 requestType:(int64_t)a4 interfaceName:(id)a5
{
}

- (CWFXPCManager)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  -[CWFXPCManager sendXPCEvent:reply:](v3, v4, v5, v6);
  return result;
}

- (void)sendXPCEvent:(id)a3 reply:(id)a4
{
}

- (void)resume
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18648EA4C;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  objc_msgSend_startEventMonitoring(self->_XPCRequestProxy, v6, v7, v8, v9);
}

- (void)suspend
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18648EBA4;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)invalidate
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18648ECFC;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (id)registeredEventIDs
{
  id v3 = objc_alloc_init(MEMORY[0x189607838]);
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  uint64_t v12 = MEMORY[0x1895F87A8];
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_18648EEE8;
  uint64_t v15 = &unk_189E5BF78;
  uint64_t v16 = self;
  id v17 = v3;
  id v5 = v3;
  dispatch_sync(mutexQueue, &v12);
  v10 = (void *)objc_msgSend_copy(v5, v6, v7, v8, v9, v12, v13, v14, v15, v16);

  return v10;
}

- (id)registeredActivities
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  uint64_t v15 = MEMORY[0x1895F87A8];
  uint64_t v16 = 3221225472LL;
  id v17 = sub_18648F0AC;
  v18 = &unk_189E5BF78;
  v19 = self;
  id v20 = v6;
  id v8 = v6;
  dispatch_sync(mutexQueue, &v15);
  uint64_t v13 = (void *)objc_msgSend_copy(v8, v9, v10, v11, v12, v15, v16, v17, v18, v19);

  return v13;
}

- (id)localXPCClientWithServiceType:(int64_t)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_18648F290;
  uint64_t v11 = sub_18648F2A0;
  id v12 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18648F2A8;
  block[3] = &unk_189E5C678;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)endpointWithServiceType:(int64_t)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_18648F290;
  uint64_t v11 = sub_18648F2A0;
  id v12 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18648F49C;
  block[3] = &unk_189E5C678;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (CWFPrivateMACManager)privateMACManager
{
  return (CWFPrivateMACManager *)objc_msgSend_privateMACManager(self->_XPCRequestProxy, a2, v2, v3, v4);
}

- (void)XPCListener:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
}

- (void)XPCListener:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5
{
}

- (void)__updateProcessMonitorConfiguration
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18648F660;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_async(mutexQueue, block);
}

- (void)XPCListener:(id)a3 XPCConnection:(id)a4 updatedRegisteredEventIDs:(id)a5
{
  id v51 = a4;
  id v7 = a5;
  objc_msgSend_XPCManager_XPCConnection_updatedRegisteredEventIDs_( self->_XPCRequestProxy,  v8,  (uint64_t)self,  (uint64_t)v51,  (uint64_t)v7);
  if ((objc_msgSend_isLocal(v51, v9, v10, v11, v12) & 1) == 0)
  {
    objc_msgSend___updateProcessMonitorConfiguration(self, v13, v14, v15, v16);
    if (objc_msgSend_count(v7, v17, v18, v19, v20))
    {
      if (objc_msgSend_count(v7, v21, v22, v23, v24) == 1 && objc_opt_class())
      {
        v29 = (void *)MEMORY[0x1896122E0];
        objc_msgSend_XPCConnection(v51, v25, v26, v27, v28);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = objc_msgSend_processIdentifier(v30, v31, v32, v33, v34);
        objc_msgSend_identifierWithPid_(v29, v36, v35, v37, v38);
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_handleForIdentifier_error_(MEMORY[0x1896122D0], v40, (uint64_t)v39, 0, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_currentState(v42, v43, v44, v45, v46);
        id v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProcessState_(v51, v48, (uint64_t)v47, v49, v50);
      }
    }

    else
    {
      objc_msgSend_setProcessState_(v51, v21, 0, v23, v24);
    }
  }
}

- (void)XPCListener:(id)a3 invalidatedXPCConnection:(id)a4
{
}

- (void)XPCRequestProxy:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_msgSend_delegate(self, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_4;
  }
  objc_msgSend_supportedRequestTypes(self, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (void *)MEMORY[0x189607968];
  uint64_t v24 = objc_msgSend_type(v8, v20, v21, v22, v23);
  objc_msgSend_numberWithInteger_(v19, v25, v24, v26, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  int v32 = objc_msgSend_containsObject_(v18, v29, (uint64_t)v28, v30, v31);

  if (v32)
  {
    objc_msgSend_XPCManager_XPCConnection_receivedXPCRequest_(v13, v33, (uint64_t)self, (uint64_t)v7, (uint64_t)v8);
  }

  else
  {
LABEL_4:
    CWFGetOSLog();
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      CWFGetOSLog();
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v35 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v36 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = objc_msgSend_type(v8, v37, v38, v39, v40);
      sub_1864504C4(v41, v42, v43, v44, v45);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_response(v8, v46, v47, v48, v49);
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend_response(v8, v51, v52, v53, v54);
      v55 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v56, *MEMORY[0x189607688], 45, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, void))v55)[2](v55, v57, 0LL);
    }
  }
}

- (void)XPCRequestProxy:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  objc_msgSend_delegate(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend_XPCManager_XPCConnection_canceledXPCRequestsWithUUID_( v12,  v13,  (uint64_t)self,  (uint64_t)v14,  (uint64_t)v7);
  }
}

- (void)XPCRequestProxy:(id)a3 invalidatedXPCConnection:(id)a4
{
  id v12 = a4;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend_XPCManager_invalidatedXPCConnection_(v9, v10, (uint64_t)self, (uint64_t)v12, v11);
  }
}

- (void)XPCRequestProxy:(id)a3 sendXPCEvent:(id)a4 reply:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864903F4;
  block[3] = &unk_189E5C6F0;
  id v13 = v7;
  id v14 = v8;
  block[4] = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(mutexQueue, block);
}

- (CWFXPCManagerDelegate)delegate
{
  return (CWFXPCManagerDelegate *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)supportedRequestTypes
{
  return (NSSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSupportedRequestTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end