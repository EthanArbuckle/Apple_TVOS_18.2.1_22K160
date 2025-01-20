@interface CWFXPCListener
- (BOOL)__allowXPCConnection:(id)a3 serviceType:(int64_t)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CWFXPCListener)init;
- (CWFXPCListener)initWithServiceType:(int64_t)a3;
- (CWFXPCListenerDelegate)delegate;
- (NSXPCListener)XPCListener;
- (id)XPCConnections;
- (id)localXPCClient;
- (id)registeredActivities;
- (id)registeredEventIDs;
- (int64_t)serviceType;
- (void)XPCConnection:(id)a3 canceledXPCRequestsWithUUID:(id)a4;
- (void)XPCConnection:(id)a3 receivedXPCRequest:(id)a4;
- (void)XPCConnection:(id)a3 updatedRegisteredEventIDs:(id)a4;
- (void)invalidate;
- (void)resume;
- (void)sendXPCEvent:(id)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)suspend;
@end

@implementation CWFXPCListener

- (CWFXPCListener)initWithServiceType:(int64_t)a3
{
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___CWFXPCListener;
  v4 = -[CWFXPCListener init](&v45, sel_init);
  v5 = v4;
  v6 = 0LL;
  if (!v4) {
    goto LABEL_9;
  }
  v4->_serviceType = a3;
  sub_18644F860(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    goto LABEL_9;
  }
  id v10 = objc_msgSend_stringWithFormat_( NSString,  v7,  (uint64_t)@"com.apple.corewifi.XPC-listener-mutex.%@",  v8,  v9,  v6);
  v15 = (const char *)objc_msgSend_UTF8String(v10, v11, v12, v13, v14);
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
  mutexQueue = v5->_mutexQueue;
  v5->_mutexQueue = (OS_dispatch_queue *)v17;

  if (!v5->_mutexQueue) {
    goto LABEL_9;
  }
  v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  mutableXPCConnections = v5->_mutableXPCConnections;
  v5->_mutableXPCConnections = v19;

  if (!v5->_mutableXPCConnections) {
    goto LABEL_9;
  }
  uint64_t v21 = CWFBootArgs();
  bootArgs = v5->_bootArgs;
  v5->_bootArgs = (NSArray *)v21;

  id v23 = objc_alloc(MEMORY[0x189607B50]);
  uint64_t v27 = objc_msgSend_initWithMachServiceName_(v23, v24, (uint64_t)v6, v25, v26);
  XPCListener = v5->_XPCListener;
  v5->_XPCListener = (NSXPCListener *)v27;

  v32 = v5->_XPCListener;
  if (!v32) {
    goto LABEL_9;
  }
  objc_msgSend_setDelegate_(v32, v29, (uint64_t)v5, v30, v31);
  uint64_t v36 = sub_1864517F0(a3, (const char *)1, v33, v34, v35);
  requestXPCInterface = v5->_requestXPCInterface;
  v5->_requestXPCInterface = (NSXPCInterface *)v36;

  if (!v5->_requestXPCInterface
    || (sub_186451A68(a3, v38, v39, v40, v41),
        uint64_t v42 = objc_claimAutoreleasedReturnValue(),
        eventXPCInterface = v5->_eventXPCInterface,
        v5->_eventXPCInterface = (NSXPCInterface *)v42,
        eventXPCInterface,
        !v5->_eventXPCInterface))
  {
LABEL_9:

    v5 = 0LL;
  }

  return v5;
}

- (CWFXPCListener)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  -[CWFXPCListener resume](v3, v4);
  return result;
}

- (void)resume
{
}

- (void)suspend
{
}

- (void)invalidate
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18650B134;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)sendXPCEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18650B304;
  block[3] = &unk_189E5C6F0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(mutexQueue, block);
}

- (id)XPCConnections
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_18650B5C0;
  id v10 = sub_18650B5D0;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_18650B5D8;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)registeredEventIDs
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_18650B5C0;
  id v10 = sub_18650B5D0;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_18650B6D4;
  v5[3] = &unk_189E5CF90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)registeredActivities
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_18650B5C0;
  id v10 = sub_18650B5D0;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_18650B8E0;
  v5[3] = &unk_189E5CF90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)localXPCClient
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(&OBJC_CLASS___CWFXPCConnection);
  v5 = (void *)objc_msgSend_initWithServiceType_XPCConnection_bootArgs_( v3,  v4,  self->_serviceType,  0,  (uint64_t)self->_bootArgs);
  if (v5)
  {
    uint64_t v6 = objc_alloc(&OBJC_CLASS___CWFXPCClient);
    int64_t serviceType = self->_serviceType;
    objc_msgSend_localXPCProxyConnection(v5, v8, v9, v10, v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend_initWithServiceType_remoteXPCProxyConnection_(v6, v13, serviceType, (uint64_t)v12, v14);

    if (v15)
    {
      objc_msgSend_localXPCProxyConnection(v15, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRemoteXPCProxyConnection_(v5, v21, (uint64_t)v20, v22, v23);

      objc_msgSend_setDelegate_(v5, v24, (uint64_t)self, v25, v26);
      objc_initWeak(&location, v5);
      uint64_t v27 = MEMORY[0x1895F87A8];
      v69[0] = MEMORY[0x1895F87A8];
      v69[1] = 3221225472LL;
      v69[2] = sub_18650BD44;
      v69[3] = &unk_189E5F2A0;
      objc_copyWeak(&v70, &location);
      v69[4] = self;
      objc_msgSend_setInvalidationHandler_(v5, v28, (uint64_t)v69, v29, v30);
      CWFGetOSLog();
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        CWFGetOSLog();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v32 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v33 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_processName(v5, v34, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v5, v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUIDString(v43, v44, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v48, v49, 5, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        int v72 = 138543618;
        v73 = v38;
        __int16 v74 = 2114;
        v75 = v52;
        _os_log_send_and_compose_impl();
      }

      objc_msgSend_resume(v5, v53, v54, v55, v56);
      mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
      block[0] = v27;
      block[1] = 3221225472LL;
      block[2] = sub_18650BE28;
      block[3] = &unk_189E5BF78;
      block[4] = self;
      id v58 = v5;
      id v68 = v58;
      dispatch_async(mutexQueue, block);

      objc_destroyWeak(&v70);
      objc_destroyWeak(&location);
      objc_msgSend_delegate(self, v59, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_XPCListener_addedXPCConnection_(v63, v64, (uint64_t)self, (uint64_t)v58, v65);
    }
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (BOOL)__allowXPCConnection:(id)a3 serviceType:(int64_t)a4
{
  uint64_t v96 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  unsigned __int8 v92 = 0;
  if (objc_msgSend_containsObject_( self->_bootArgs,  v7,  (uint64_t)@"corewifi_api_enforcement_disable=1",  v8,  v9))
  {
    CWFGetOSLog();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      CWFGetOSLog();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v15 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v41 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v46 = objc_msgSend_processIdentifier(v6, v42, v43, v44, v45);
      sub_18644F860(a4);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
      int v93 = 67109378;
      *(_DWORD *)v94 = v46;
      *(_WORD *)&v94[4] = 2114;
      *(void *)&v94[6] = v47;
LABEL_27:
      char v49 = 1;
      _os_log_send_and_compose_impl();

      goto LABEL_44;
    }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v105 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend___allowXPCConnection_serviceType_(self, v8, (uint64_t)v7, self->_serviceType, v9))
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS___CWFXPCConnection);
    uint64_t v12 = (void *)objc_msgSend_initWithServiceType_XPCConnection_bootArgs_( v10,  v11,  self->_serviceType,  (uint64_t)v7,  (uint64_t)self->_bootArgs);
    uint64_t v16 = v12;
    BOOL v17 = v12 != 0LL;
    if (v12)
    {
      objc_msgSend_setDelegate_(v12, v13, (uint64_t)self, v14, v15);
      objc_msgSend_setExportedInterface_(v7, v18, (uint64_t)self->_requestXPCInterface, v19, v20);
      objc_msgSend_setRemoteObjectInterface_(v7, v21, (uint64_t)self->_eventXPCInterface, v22, v23);
      objc_msgSend_setExportedObject_(v7, v24, (uint64_t)v16, v25, v26);
      objc_initWeak(&location, v16);
      v92[0] = MEMORY[0x1895F87A8];
      v92[1] = 3221225472LL;
      v92[2] = sub_18650C76C;
      v92[3] = &unk_189E5F2A0;
      objc_copyWeak(&v93, &location);
      v92[4] = self;
      objc_msgSend_setInvalidationHandler_(v16, v27, (uint64_t)v92, v28, v29);
      CWFGetOSLog();
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        CWFGetOSLog();
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v31 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v32 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        BOOL v87 = v17;
        id v88 = v6;
        objc_msgSend_processName(v16, v33, v34, v35, v36);
        __int128 v89 = (void *)objc_claimAutoreleasedReturnValue();
        int v41 = objc_msgSend_processIdentifier(v7, v37, v38, v39, v40);
        int v46 = objc_msgSend_effectiveUserIdentifier(v7, v42, v43, v44, v45);
        int v51 = objc_msgSend_effectiveGroupIdentifier(v7, v47, v48, v49, v50);
        objc_msgSend_UUID(v16, v52, v53, v54, v55);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUIDString(v56, v57, v58, v59, v60);
        id v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v61, v62, 5, v63, v64);
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
        int v95 = 138544386;
        uint64_t v96 = v89;
        __int16 v97 = 1024;
        int v98 = v41;
        __int16 v99 = 1024;
        int v100 = v46;
        __int16 v101 = 1024;
        int v102 = v51;
        __int16 v103 = 2114;
        v104 = v65;
        _os_log_send_and_compose_impl();

        id v6 = v88;
        BOOL v17 = v87;
      }

      objc_msgSend_resume(v16, v66, v67, v68, v69);
      mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_18650C850;
      block[3] = &unk_189E5BF78;
      block[4] = self;
      id v71 = v16;
      id v91 = v71;
      dispatch_async(mutexQueue, block);
      objc_msgSend_delegate(self, v72, v73, v74, v75);
      uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_XPCListener_addedXPCConnection_(v76, v77, (uint64_t)self, (uint64_t)v71, v78);

      objc_destroyWeak(&v93);
      objc_destroyWeak(&location);
    }

    else
    {
      CWFGetOSLog();
      uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        CWFGetOSLog();
        uint64_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v81 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v82 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        int v95 = 67109120;
        LODWORD(v96) = objc_msgSend_processIdentifier(v7, v83, v84, v85, v86);
        _os_log_send_and_compose_impl();
      }
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)XPCConnection:(id)a3 receivedXPCRequest:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v11;
  if (v11)
  {
    objc_msgSend_XPCListener_XPCConnection_receivedXPCRequest_(v11, v12, (uint64_t)self, (uint64_t)v25, (uint64_t)v6);
  }

  else
  {
    objc_msgSend_response(v6, v12, v13, v14, v15);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend_response(v6, v18, v19, v20, v21);
      uint64_t v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v23, *MEMORY[0x189607688], 45, 0);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, void))v22)[2](v22, v24, 0LL);
    }
  }
}

- (void)XPCConnection:(id)a3 canceledXPCRequestsWithUUID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v11;
  if (v11) {
    objc_msgSend_XPCListener_XPCConnection_canceledXPCRequestsWithUUID_( v11,  v12,  (uint64_t)self,  (uint64_t)v14,  (uint64_t)v6);
  }
}

- (void)XPCConnection:(id)a3 updatedRegisteredEventIDs:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v11;
  if (v11) {
    objc_msgSend_XPCListener_XPCConnection_updatedRegisteredEventIDs_( v11,  v12,  (uint64_t)self,  (uint64_t)v14,  (uint64_t)v6);
  }
}

- (CWFXPCListenerDelegate)delegate
{
  return (CWFXPCListenerDelegate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSXPCListener)XPCListener
{
  return self->_XPCListener;
}

- (void).cxx_destruct
{
}

@end