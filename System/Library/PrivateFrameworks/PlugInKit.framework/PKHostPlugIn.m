@interface PKHostPlugIn
- (BOOL)active;
- (BOOL)beginUsingRequest:(id)a3 error:(id *)a4;
- (BOOL)beginUsingRequest:(id)a3 withSubsystemOptions:(id)a4 error:(id *)a5;
- (BOOL)beginUsingWithError:(id *)a3;
- (BOOL)beginUsingWithSubsystemOptions:(id)a3 error:(id *)a4;
- (BOOL)endUsingRequest:(id)a3 error:(id *)a4;
- (BOOL)endUsingWithError:(id *)a3;
- (BOOL)isSandboxed;
- (BOOL)loadExtensions:(id)a3 error:(id *)a4;
- (BOOL)spent;
- (BOOL)terminating;
- (BOOL)useBundle:(id)a3 error:(id *)a4;
- (NSArray)preferredLanguages;
- (NSArray)sandboxExtensions;
- (NSBundle)embeddedBundle;
- (NSDate)beganUsingAt;
- (NSDictionary)discoveryExtensions;
- (NSDictionary)environment;
- (NSDictionary)extensionState;
- (NSDictionary)sourceForm;
- (NSMutableSet)requests;
- (NSString)description;
- (NSString)sandboxProfile;
- (NSString)serviceExtension;
- (NSUUID)effectiveUUID;
- (NSUUID)multipleInstanceUUID;
- (NSUUID)supersedingUUID;
- (NSUserDefaults)defaults;
- (NSXPCConnection)pluginConnection;
- (OS_dispatch_queue)_replyQueue;
- (OS_dispatch_queue)_startQueue;
- (OS_dispatch_queue)_syncQueue;
- (PKCorePlugInProtocol)service;
- (PKCorePlugInProtocol)syncService;
- (PKHost)host;
- (PKHostPlugIn)initWithForm:(id)a3 host:(id)a4;
- (PKPlugIn)supersededBy;
- (Protocol)queuedHostProtocol;
- (id)createInstanceWithUUID:(id)a3;
- (id)embeddedPrincipal;
- (id)notificationBlock;
- (id)plugInPrincipal;
- (id)queuedHostPrincipal;
- (int64_t)userElection;
- (unint64_t)state;
- (unsigned)useCount;
- (void)addRequestUUID:(id)a3;
- (void)beginUsing:(id)a3;
- (void)beginUsingRequest:(id)a3 completion:(id)a4;
- (void)beginUsingRequest:(id)a3 withSubsystemOptions:(id)a4 completion:(id)a5;
- (void)beginUsingWithSubsystemOptions:(id)a3 completion:(id)a4;
- (void)changeState:(unint64_t)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)endUsing:(id)a3;
- (void)endUsingRequest:(id)a3 completion:(id)a4;
- (void)preparePlugInUsingService:(id)a3 completion:(id)a4;
- (void)resume;
- (void)setBeganUsingAt:(id)a3;
- (void)setBootstrapWithSubsystemOptions:(id)a3;
- (void)setDiscoveryExtensions:(id)a3;
- (void)setEmbeddedBundle:(id)a3;
- (void)setEmbeddedPrincipal:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setExtensionState:(id)a3;
- (void)setHost:(id)a3;
- (void)setHostPrincipal:(id)a3 withProtocol:(id)a4;
- (void)setMultipleInstanceUUID:(id)a3;
- (void)setNotificationBlock:(id)a3;
- (void)setPlugInPrincipal:(id)a3;
- (void)setPluginConnection:(id)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setQueuedHostPrincipal:(id)a3;
- (void)setQueuedHostProtocol:(id)a3;
- (void)setSandboxExtensions:(id)a3;
- (void)setSandboxProfile:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceExtension:(id)a3;
- (void)setSourceForm:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSupersededBy:(id)a3;
- (void)setSupersedingUUID:(id)a3;
- (void)setSyncService:(id)a3;
- (void)setTerminating:(BOOL)a3;
- (void)setUseCount:(unsigned int)a3;
- (void)setUserElection:(int64_t)a3;
- (void)set_replyQueue:(id)a3;
- (void)set_startQueue:(id)a3;
- (void)set_syncQueue:(id)a3;
- (void)startPlugInRequest:(id)a3 synchronously:(BOOL)a4 subsystemOptions:(id)a5 completion:(id)a6;
- (void)suspend;
- (void)unwind:(unint64_t)a3 force:(BOOL)a4;
- (void)updateFromForm:(id)a3 host:(id)a4;
@end

@implementation PKHostPlugIn

- (PKHostPlugIn)initWithForm:(id)a3 host:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_external(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v94.receiver = self;
  v94.super_class = (Class)&OBJC_CLASS___PKHostPlugIn;
  v13 = -[PKPlugInCore initWithForm:externalProviders:](&v94, sel_initWithForm_externalProviders_, v6, v12);

  if (v13)
  {
    objc_msgSend_setSourceForm_(v13, v14, (uint64_t)v6, v15, v16);
    objc_msgSend_setHost_(v13, v17, (uint64_t)v7, v18, v19);
    objc_msgSend_objectForKeyedSubscript_(v6, v20, (uint64_t)@"overrider", v21, v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      id v28 = objc_alloc(MEMORY[0x189607AB8]);
      v32 = (void *)objc_msgSend_initWithUUIDString_(v28, v29, (uint64_t)v27, v30, v31);
      objc_msgSend_setSupersedingUUID_(v13, v33, (uint64_t)v32, v34, v35);
    }

    objc_msgSend_frameworkQueueAttr(PKCapabilities, v23, v24, v25, v26);
    v36 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    id v37 = objc_alloc(NSString);
    objc_msgSend_identifier(v13, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend_initWithFormat_(v37, v43, (uint64_t)@"PKPlugIn sync (%@)", v44, v45, v42);

    id v47 = v46;
    v52 = (const char *)objc_msgSend_UTF8String(v47, v48, v49, v50, v51);
    dispatch_queue_t v53 = dispatch_queue_create(v52, v36);
    objc_msgSend_set_syncQueue_(v13, v54, (uint64_t)v53, v55, v56);

    id v57 = objc_alloc(NSString);
    objc_msgSend_identifier(v13, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend_initWithFormat_(v57, v63, (uint64_t)@"PKPlugIn start (%@)", v64, v65, v62);

    id v67 = v66;
    v72 = (const char *)objc_msgSend_UTF8String(v67, v68, v69, v70, v71);
    dispatch_queue_t v73 = dispatch_queue_create(v72, v36);
    objc_msgSend_set_startQueue_(v13, v74, (uint64_t)v73, v75, v76);

    objc_msgSend_objectForKeyedSubscript_(v6, v77, (uint64_t)@"extensions", v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDiscoveryExtensions_(v13, v81, (uint64_t)v80, v82, v83);

    objc_msgSend_objectForKeyedSubscript_(v6, v84, (uint64_t)@"service-extension", v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setServiceExtension_(v13, v88, (uint64_t)v87, v89, v90);

    v91 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    requests = v13->_requests;
    v13->_requests = v91;
  }

  return v13;
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PKHostPlugIn;
  v4 = -[PKPlugInCore description](&v25, sel_description);
  objc_msgSend_multipleInstanceUUID(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_state(self, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_useCount(self, v15, v16, v17, v18);
  v23 = (void *)objc_msgSend_initWithFormat_( v3,  v20,  (uint64_t)@"<id<PKPlugIn>: %p; core = %@, instance = [%@], state = %lu, useCount = %d>",
                  v21,
                  v22,
                  self,
                  v4,
                  v9,
                  v14,
                  v19);

  return (NSString *)v23;
}

- (NSUserDefaults)defaults
{
  if (!self->_defaults)
  {
    id v3 = objc_alloc(&OBJC_CLASS___PKHostDefaults);
    uint64_t v7 = (NSUserDefaults *)objc_msgSend_initWithPlugIn_(v3, v4, (uint64_t)self, v5, v6);
    defaults = self->_defaults;
    self->_defaults = v7;
  }

  return self->_defaults;
}

- (int64_t)userElection
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  objc_msgSend__syncQueue(self, a2, v2, v3, v4);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = sub_186A066A0;
  v26[3] = &unk_189F205B8;
  v26[4] = self;
  v26[5] = &v27;
  dispatch_sync(v6, v26);

  pklog_handle_for_category(10);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_uuid(self, v8, v9, v10, v11);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v15, v16, v17, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v20, v21, v22, v23);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = v28[3];
    *(_DWORD *)buf = 138544386;
    uint64_t v31 = v14;
    __int16 v32 = 2112;
    v33 = v19;
    __int16 v34 = 2112;
    uint64_t v35 = v24;
    __int16 v36 = 2080;
    id v37 = "-[PKHostPlugIn userElection]";
    __int16 v38 = 2048;
    uint64_t v39 = v25;
    _os_log_debug_impl(&dword_186A04000, v7, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] %s: %ld", buf, 0x34u);
  }

  int64_t v12 = v28[3];
  _Block_object_dispose(&v27, 8);
  return v12;
}

- (void)setUserElection:(int64_t)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  pklog_handle_for_category(10);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_uuid(self, v6, v7, v8, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v11, v12, v13, v14);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    uint64_t v35 = v10;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2112;
    uint64_t v39 = v20;
    __int16 v40 = 2080;
    uint64_t v41 = "-[PKHostPlugIn setUserElection:]";
    __int16 v42 = 2048;
    int64_t v43 = a3;
    _os_log_impl(&dword_186A04000, v5, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] %s: %ld", buf, 0x34u);
  }

  objc_msgSend__syncQueue(self, v21, v22, v23, v24);
  uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1895F87A8];
  v33[1] = 3221225472LL;
  v33[2] = sub_186A06890;
  v33[3] = &unk_189F205E0;
  v33[4] = self;
  v33[5] = a3;
  dispatch_sync(v25, v33);

  objc_msgSend_host(self, v26, v27, v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setElection_forPlugIn_(v30, v31, a3, (uint64_t)self, v32);
}

- (NSDictionary)extensionState
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = sub_186A069DC;
  uint64_t v14 = sub_186A069EC;
  id v15 = 0LL;
  objc_msgSend__syncQueue(self, a2, v2, v3, v4);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = sub_186A069F4;
  v9[3] = &unk_189F205B8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  if (!v11[5])
  {
    v11[5] = MEMORY[0x189604A60];
  }

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSDictionary *)v7;
}

- (void)setExtensionState:(id)a3
{
  id v4 = a3;
  objc_msgSend__syncQueue(self, v5, v6, v7, v8);
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A06B04;
  block[3] = &unk_189F20608;
  block[4] = self;
  id v19 = v4;
  id v17 = v4;
  dispatch_sync(v9, block);

  objc_msgSend_host(self, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExtensionState_forPlugIn_(v14, v15, (uint64_t)v17, (uint64_t)self, v16);
}

- (void)updateFromForm:(id)a3 host:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___PKHostPlugIn;
  id v6 = a4;
  -[PKPlugInCore updateFromForm:](&v31, sel_updateFromForm_, a3);
  objc_msgSend_sourceForm(self, v7, v8, v9, v10, v31.receiver, v31.super_class);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_annotations(self, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = (void *)objc_msgSend_copy(v16, v17, v18, v19, v20);
  objc_msgSend_dictionaryChanging_to_(v11, v22, (uint64_t)@"annotations", (uint64_t)v21, v23);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceForm_(self, v25, (uint64_t)v24, v26, v27);

  objc_msgSend_setHost_(self, v28, (uint64_t)v6, v29, v30);
}

- (void)suspend
{
}

- (void)resume
{
}

- (BOOL)active
{
  return objc_msgSend_state(self, a2, v2, v3, v4) == 1;
}

- (BOOL)spent
{
  return objc_msgSend_state(self, a2, v2, v3, v4) == 4;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6 = a4;
  objc_msgSend_userInfo(v6, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v11, v12, *MEMORY[0x189607BC8], v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)@"synchronous", v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = objc_msgSend_BOOLValue(v19, v20, v21, v22, v23);

  if (v24)
  {
    objc_msgSend_invoke(v6, v25, v26, v27, v28);
  }

  else
  {
    objc_msgSend_retainArguments(v6, v25, v26, v27, v28);
    objc_msgSend__replyQueue(self, v29, v30, v31, v32);
    v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186A06D4C;
    block[3] = &unk_189F20630;
    id v35 = v6;
    dispatch_async(v33, block);
  }
}

- (void)setHostPrincipal:(id)a3 withProtocol:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  objc_msgSend_plugInPrincipal(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend_setQueuedHostPrincipal_(self, v12, (uint64_t)v18, v13, v14);
    objc_msgSend_setQueuedHostProtocol_(self, v15, (uint64_t)v6, v16, v17);
  }
}

- (id)createInstanceWithUUID:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    objc_msgSend_UUID(MEMORY[0x189607AB8], v4, v5, v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_186A069DC;
  uint64_t v29 = sub_186A069EC;
  id v30 = 0LL;
  objc_msgSend__syncQueue(self, v4, v5, v6, v7);
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = sub_186A06F10;
  v24[3] = &unk_189F205B8;
  v24[4] = self;
  v24[5] = &v25;
  dispatch_sync(v9, v24);

  uint64_t v10 = objc_alloc(&OBJC_CLASS___PKHostPlugIn);
  uint64_t v11 = v26[5];
  objc_msgSend_host(self, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (void *)objc_msgSend_initWithForm_host_(v10, v17, v11, (uint64_t)v16, v18);

  objc_msgSend_setMultipleInstanceUUID_(v19, v20, (uint64_t)v8, v21, v22);
  _Block_object_dispose(&v25, 8);

  return v19;
}

- (NSUUID)effectiveUUID
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    objc_msgSend_multipleInstanceUUID(self, v7, v8, v9, v10);
  }
  else {
    objc_msgSend_uuid(self, v7, v8, v9, v10);
  }
  return (NSUUID *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)beginUsing:(id)a3
{
}

- (void)beginUsingWithSubsystemOptions:(id)a3 completion:(id)a4
{
}

- (void)beginUsingRequest:(id)a3 withSubsystemOptions:(id)a4 completion:(id)a5
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = PKGetThreadPriority();
  pklog_handle_for_category(0);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = os_signpost_id_generate(v12);

  pklog_handle_for_category(7);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v14;
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    objc_msgSend_identifier(self, v16, v17, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uuid(self, v21, v22, v23, v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v25;
    __int16 v60 = 1026;
    int v61 = v11;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "HostBeginUsing",  " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  priority =%{public, signpost.description:attribute}d ",  buf,  0x1Cu);
  }

  uint64_t v26 = MEMORY[0x1895F87A8];
  uint64_t v53 = MEMORY[0x1895F87A8];
  uint64_t v54 = 3221225472LL;
  uint64_t v55 = sub_186A07238;
  uint64_t v56 = &unk_189F20658;
  id v57 = v10;
  uint64_t v58 = v13;
  id v27 = v10;
  uint64_t v28 = (void *)MEMORY[0x186E4154C](&v53);
  uint64_t v29 = _CFXPCCreateXPCObjectFromCFObject();
  __int16 v34 = (void *)v29;
  if (v9 && !v29)
  {
    pklog_handle_for_category(8);
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      sub_186A2394C( (uint64_t)self,  (uint64_t)v9,  (uint64_t)v35,  v36,  v37,  v38,  v39,  v40,  v45,  v46,  (uint64_t)v47,  (uint64_t)v48,  (uint64_t)v49,  (uint64_t)v50,  (uint64_t)v51,  (uint64_t)v52,  v53,  v54,  (uint64_t)v55,  (uint64_t)v56,  (uint64_t)v57,  v58,  *(uint64_t *)buf,  *(uint64_t *)&buf[8]);
    }
  }

  objc_msgSend__startQueue(self, v30, v31, v32, v33);
  uint64_t v41 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = v26;
  uint64_t v46 = 3221225472LL;
  id v47 = sub_186A0731C;
  v48 = &unk_189F20680;
  uint64_t v49 = self;
  id v50 = v8;
  id v51 = v34;
  id v52 = v28;
  id v42 = v28;
  id v43 = v34;
  id v44 = v8;
  dispatch_async(v41, &v45);
}

- (void)beginUsingRequest:(id)a3 completion:(id)a4
{
}

- (BOOL)beginUsingWithError:(id *)a3
{
  return ((uint64_t (*)(PKHostPlugIn *, char *, void, id *))MEMORY[0x189616718])( self,  sel_beginUsingWithSubsystemOptions_error_,  0LL,  a3);
}

- (BOOL)beginUsingWithSubsystemOptions:(id)a3 error:(id *)a4
{
  return MEMORY[0x189616718](self, sel_beginUsingRequest_withSubsystemOptions_error_, 0LL, a3, a4);
}

- (BOOL)beginUsingRequest:(id)a3 withSubsystemOptions:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  int v10 = PKGetThreadPriority();
  pklog_handle_for_category(0);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  pklog_handle_for_category(7);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    objc_msgSend_identifier(self, v15, v16, v17, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uuid(self, v20, v21, v22, v23);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v24;
    *(_WORD *)&_BYTE buf[22] = 1026;
    LODWORD(v46) = v10;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "HostBeginUsing",  " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  priority =%{public, signpost.description:attribute}d ",  buf,  0x1Cu);
  }

  uint64_t v25 = _CFXPCCreateXPCObjectFromCFObject();
  id v30 = (void *)v25;
  if (v9 && !v25)
  {
    pklog_handle_for_category(7);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      sub_186A23A00((uint64_t)v9, v31);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v46 = sub_186A069DC;
  id v47 = sub_186A069EC;
  id v48 = 0LL;
  objc_msgSend__startQueue(self, v26, v27, v28, v29);
  uint64_t v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1895F87A8];
  v39[1] = 3221225472LL;
  v39[2] = sub_186A0765C;
  v39[3] = &unk_189F206D0;
  v39[4] = self;
  id v33 = v8;
  id v40 = v33;
  id v34 = v30;
  id v41 = v34;
  id v42 = buf;
  dispatch_sync(v32, v39);

  id v35 = *(void **)(*(void *)&buf[8] + 40LL);
  if (a5 && v35) {
    *a5 = v35;
  }
  pklog_handle_for_category(7);
  uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = v36;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_DWORD *)id v43 = 67240192;
    BOOL v44 = v35 == 0LL;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v37,  OS_SIGNPOST_INTERVAL_END,  v12,  "HostBeginUsing",  " success=%{public, signpost.description:attribute}d ",  v43,  8u);
  }

  _Block_object_dispose(buf, 8);
  return v35 == 0LL;
}

- (BOOL)beginUsingRequest:(id)a3 error:(id *)a4
{
  return MEMORY[0x189616718](self, sel_beginUsingRequest_withSubsystemOptions_error_, a3, 0LL, a4);
}

- (void)addRequestUUID:(id)a3
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (v8)
  {
    objc_msgSend__syncQueue(self, v4, v5, v6, v7);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    pklog_handle_for_category(7);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_uuid(self, v11, v12, v13, v14);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(self, v16, v17, v18, v19);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(self, v21, v22, v23, v24);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(self, v26, v27, v28, v29);
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      int v46 = 138544386;
      *(void *)id v47 = v15;
      *(_WORD *)&v47[8] = 2114;
      *(void *)&v47[10] = v20;
      *(_WORD *)&v47[18] = 2112;
      id v48 = v25;
      *(_WORD *)uint64_t v49 = 2112;
      *(void *)&v49[2] = v30;
      *(_WORD *)&v49[10] = 2112;
      *(void *)&v49[12] = v8;
      _os_log_impl( &dword_186A04000,  v10,  OS_LOG_TYPE_INFO,  "[u %{public}@:m %{public}@] [%@(%@)] adding request: %@",  (uint8_t *)&v46,  0x34u);
    }

    objc_msgSend_requests(self, v31, v32, v33, v34);
    id v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v35, v36, (uint64_t)v8, v37, v38);

    pklog_handle_for_category(7);
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      sub_186A23A74( (uint64_t)self,  (uint64_t)v39,  v40,  v41,  v42,  v43,  v44,  v45,  v46,  *(uint64_t *)&v47[4],  *(uint64_t *)&v47[12],  v48,  *(uint64_t *)v49,  *(uint64_t *)&v49[8],  *(uint64_t *)&v49[16],  v50,  v51,  v52,  v53,  v54,  v55,  v56,  v57,  v58);
    }
  }
}

- (void)startPlugInRequest:(id)a3 synchronously:(BOOL)a4 subsystemOptions:(id)a5 completion:(id)a6
{
  BOOL v280 = a4;
  uint64_t v326 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v283 = a5;
  id v11 = a6;
  objc_msgSend__startQueue(self, v12, v13, v14, v15);
  uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  objc_msgSend__replyQueue(self, v17, v18, v19, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    uint64_t v26 = (void *)NSString;
    objc_msgSend_identifier(self, v22, v23, v24, v25);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = objc_msgSend_stringWithFormat_(v26, v28, (uint64_t)@"PlugInKit reply:%@", v29, v30, v27);
    uint64_t v36 = (const char *)objc_msgSend_UTF8String(v31, v32, v33, v34, v35);
    objc_msgSend_frameworkQueueAttr(PKCapabilities, v37, v38, v39, v40);
    uint64_t v41 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v42 = dispatch_queue_create(v36, v41);
    objc_msgSend_set_replyQueue_(self, v43, (uint64_t)v42, v44, v45);
  }

  objc_msgSend_uuid(v10, v22, v23, v24, v25);
  int v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_launchPersona(v10, v47, v48, v49, v50);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_host(self, v51, v52, v53, v54);
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v306 = 0LL;
  v307 = &v306;
  uint64_t v308 = 0x2020000000LL;
  char v309 = 0;
  objc_msgSend__syncQueue(self, v56, v57, v58, v59);
  __int16 v60 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A084B8;
  block[3] = &unk_189F206F8;
  void block[4] = self;
  id v62 = v46;
  id v303 = v62;
  id v63 = v11;
  id v304 = v63;
  v305 = &v306;
  dispatch_sync(v60, block);

  if (*((_BYTE *)v307 + 24))
  {
    pklog_handle_for_category(7);
    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v68))
    {
      objc_msgSend_identifier(self, v69, v70, v71, v72);
      dispatch_queue_t v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uuid(self, v74, v75, v76, v77);
      uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned int v83 = objc_msgSend_useCount(self, v79, v80, v81, v82);
      *(_DWORD *)buf = 138478339;
      v312 = v73;
      __int16 v313 = 2114;
      v314 = v78;
      __int16 v315 = 2050;
      unint64_t v316 = v83;
      _os_signpost_emit_with_name_impl( &dword_186A04000,  v68,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "HostStartBypass",  " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  count= %{public, signpost.description:attribute}lu ",  buf,  0x20u);
    }

    goto LABEL_29;
  }

  objc_msgSend_diagnose(self, v64, v65, v66, v67);
  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (!v68)
  {
    pklog_handle_for_category(7);
    uint64_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_uuid(self, v90, v91, v92, v93);
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(self, v136, v137, v138, v139);
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(self, v140, v141, v142, v143);
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(self, v144, v145, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v312 = v279;
      __int16 v313 = 2114;
      v314 = v277;
      __int16 v315 = 2112;
      unint64_t v316 = (unint64_t)v273;
      __int16 v317 = 2112;
      v318 = v148;
      _os_log_debug_impl( &dword_186A04000,  v89,  OS_LOG_TYPE_DEBUG,  "[u %{public}@:m %{public}@] [%@(%@)] suspending startQueue",  buf,  0x2Au);
    }

    objc_msgSend__startQueue(self, v94, v95, v96, v97);
    v98 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v98);

    v300[0] = 0LL;
    v300[1] = v300;
    v300[2] = 0x3032000000LL;
    v300[3] = sub_186A069DC;
    v300[4] = sub_186A069EC;
    id v301 = 0LL;
    objc_initWeak(&location, self);
    v294[0] = v61;
    v294[1] = 3221225472LL;
    v294[2] = sub_186A08774;
    v294[3] = &unk_189F20720;
    objc_copyWeak(&v298, &location);
    id v272 = v55;
    id v295 = v272;
    id v296 = v63;
    v297 = v300;
    v276 = (void (**)(void, void, void))MEMORY[0x186E4154C](v294);
    objc_msgSend_setTerminating_(self, v99, 0, v100, v101);
    objc_msgSend_activatePlugIn_(v272, v102, (uint64_t)self, v103, v104);
    v105 = (PKHostPlugIn *)objc_claimAutoreleasedReturnValue();
    v278 = v105;
    if (v105 == self)
    {
      objc_msgSend_currentHandler(MEMORY[0x1896077D8], v106, v107, v108, v109);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v181,  v182,  (uint64_t)a2,  (uint64_t)self,  (uint64_t)@"PKHostPlugIn.m",  521,  @"inactive/activating self %@ not in active dictionary",  self);

      if (v278) {
        goto LABEL_14;
      }
    }

    else if (v105)
    {
LABEL_14:
      pklog_handle_for_category(7);
      v110 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_uuid(self, v111, v112, v113, v114);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multipleInstanceUUID(self, v150, v151, v152, v153);
        v281 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(self, v154, v155, v156, v157);
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_version(self, v158, v159, v160, v161);
        spida = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_uuid(v278, v162, v163, v164, v165);
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multipleInstanceUUID(v278, v166, v167, v168, v169);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v278, v171, v172, v173, v174);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_version(v278, v176, v177, v178, v179);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545154;
        v312 = v149;
        __int16 v313 = 2114;
        v314 = v281;
        __int16 v315 = 2112;
        unint64_t v316 = (unint64_t)v274;
        __int16 v317 = 2112;
        v318 = spida;
        __int16 v319 = 2114;
        *(void *)v320 = v265;
        *(_WORD *)&v320[8] = 2114;
        v321 = v170;
        __int16 v322 = 2112;
        v323 = v175;
        __int16 v324 = 2112;
        v325 = v180;
        _os_log_error_impl( &dword_186A04000,  v110,  OS_LOG_TYPE_ERROR,  "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; different plugin with same identifier already act"
          "ive: [u %{public}@:m %{public}@] [%@(%@)] ",
          buf,
          0x52u);
      }

      objc_msgSend_stringWithFormat_( NSString,  v115,  (uint64_t)@"other version in use: %@",  v116,  v117,  v278);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      pkError(16LL, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, void))v276)[2](v276, v119, 0LL);

LABEL_28:
      objc_destroyWeak(&v298);
      objc_destroyWeak(&location);
      _Block_object_dispose(v300, 8);

      goto LABEL_29;
    }

    objc_msgSend__syncQueue(self, v106, v107, v108, v109);
    v183 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v293[0] = v61;
    v293[1] = 3221225472LL;
    v293[2] = sub_186A08A68;
    v293[3] = &unk_189F20630;
    v293[4] = self;
    dispatch_sync(v183, v293);

    MEMORY[0x186E41960]();
    v310 = self;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v184, (uint64_t)&v310, 1, v185);
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    pklog_handle_for_category(7);
    v186 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uuid(self, v187, v188, v189, v190);
      spidb = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(self, v191, v192, v193, v194);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(self, v195, v196, v197, v198);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(self, v199, v200, v201, v202);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      uid_t v204 = geteuid();
      uid_t v205 = getuid();
      *(_DWORD *)buf = 138544642;
      v312 = spidb;
      __int16 v313 = 2114;
      v314 = v266;
      __int16 v315 = 2112;
      unint64_t v316 = (unint64_t)v263;
      __int16 v317 = 2112;
      v318 = v203;
      __int16 v319 = 1024;
      *(_DWORD *)v320 = v204;
      *(_WORD *)&v320[4] = 1024;
      *(_DWORD *)&v320[6] = v205;
      _os_log_impl( &dword_186A04000,  v186,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] Ready plugins sent as euid = %d, uid = %d, (persona not available)",  buf,  0x36u);
    }

    pklog_handle_for_category(7);
    v206 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t spid = os_signpost_id_make_with_pointer(v206, self);

    pklog_handle_for_category(7);
    v207 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v208 = v207;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v207))
    {
      objc_msgSend_identifier(self, v209, v210, v211, v212);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uuid(self, v214, v215, v216, v217);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v312 = v213;
      __int16 v313 = 2114;
      v314 = v218;
      _os_signpost_emit_with_name_impl( &dword_186A04000,  v208,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "HostToDaemonReadyPlugIns",  " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
    }

    id v219 = objc_alloc(MEMORY[0x189607B30]);
    objc_msgSend_infoKey_(self, v220, (uint64_t)@"CFBundleIdentifier", v221, v222);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v267 = (void *)objc_msgSend_initWithServiceName_(v219, v224, (uint64_t)v223, v225, v226);

    objc_msgSend_setPluginConnection_(self, v227, (uint64_t)v267, v228, v229);
    objc_msgSend_setBootstrapWithSubsystemOptions_(self, v230, (uint64_t)v283, v231, v232);
    objc_msgSend_preferredLanguages(self, v233, v234, v235, v236);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = v241;
    if (!v241)
    {
      objc_msgSend_preferredLanguages(MEMORY[0x189603F90], v237, v238, v239, v240);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
    }

    id v243 = v242;
    if (!v241) {

    }
    uint64_t v248 = objc_msgSend_environment(self, v244, v245, v246, v247);
    uint64_t v253 = objc_msgSend_sandboxProfile(self, v249, v250, v251, v252);
    v284[0] = v61;
    v284[1] = 3221225472LL;
    v284[2] = sub_186A08A74;
    v284[3] = &unk_189F20838;
    os_signpost_id_t v291 = spid;
    v284[4] = self;
    v289 = v276;
    id v254 = v272;
    v275 = (void *)v253;
    v255 = (void *)v248;
    v256 = v55;
    id v257 = v243;
    id v258 = v254;
    id v285 = v254;
    v290 = v300;
    id spidc = v267;
    id v286 = spidc;
    id v259 = v264;
    id v287 = v259;
    BOOL v292 = v280;
    id v288 = v62;
    v260 = v258;
    v261 = v257;
    uint64_t v55 = v256;
    objc_msgSend_readyPlugIns_synchronously_environment_languages_persona_sandbox_ready_( v260,  v262,  (uint64_t)v259,  v280,  (uint64_t)v255,  v261,  v282,  v275,  v284);

    goto LABEL_28;
  }

  pklog_handle_for_category(7);
  v84 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_uuid(self, v85, v86, v87, v88);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multipleInstanceUUID(self, v121, v122, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v126, v127, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v131, v132, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v312 = v120;
    __int16 v313 = 2114;
    v314 = v125;
    __int16 v315 = 2112;
    unint64_t v316 = (unint64_t)v130;
    __int16 v317 = 2112;
    v318 = v135;
    __int16 v319 = 2112;
    *(void *)v320 = v68;
    _os_log_error_impl( &dword_186A04000,  v84,  OS_LOG_TYPE_ERROR,  "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; failed pre-screen: %@",
      buf,
      0x34u);
  }

  (*((void (**)(id, os_log_s *))v63 + 2))(v63, v68);
LABEL_29:

  _Block_object_dispose(&v306, 8);
}

- (void)preparePlugInUsingService:(id)a3 completion:(id)a4
{
  uint64_t v175 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_queuedHostProtocol(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    uint64_t v17 = (void *)NSString;
    objc_msgSend_queuedHostProtocol(self, v13, v14, v15, v16);
    uint64_t v18 = (Protocol *)objc_claimAutoreleasedReturnValue();
    Name = protocol_getName(v18);
    objc_msgSend_stringWithUTF8String_(v17, v20, (uint64_t)Name, v21, v22);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v23 = (void *)MEMORY[0x189607B48];
    objc_msgSend_queuedHostProtocol(self, v24, v25, v26, v27);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceWithProtocol_(v23, v29, (uint64_t)v28, v30, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_pluginConnection(self, v33, v34, v35, v36);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteObjectInterface(v37, v38, v39, v40, v41);
    dispatch_queue_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_( v42,  v43,  (uint64_t)v32,  (uint64_t)sel_beginUsingPlugIn_ready_,  0,  0);
  }

  uint64_t v44 = objc_msgSend_hubProtocolVersion(self, v13, v14, v15, v16);
  if (v44 == 2)
  {
    uint64_t v76 = (void *)objc_opt_new();
    objc_msgSend_identifier(self, v77, v78, v79, v80);
    uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v76, v82, (uint64_t)v81, (uint64_t)@"identifier", v83);

    objc_msgSend_uuid(self, v84, v85, v86, v87);
    uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v88, v89, v90, v91, v92);
    uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v76, v94, (uint64_t)v93, (uint64_t)@"uuid", v95);

    uint64_t v96 = (void *)MEMORY[0x189607968];
    uint64_t v101 = objc_msgSend_hubProtocolVersion(self, v97, v98, v99, v100);
    objc_msgSend_numberWithUnsignedInteger_(v96, v102, v101, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v76, v106, (uint64_t)v105, (uint64_t)@"version", v107);

    uint64_t v108 = (void *)MEMORY[0x189607968];
    uint64_t isRBManaged = objc_msgSend_isRBManaged(self, v109, v110, v111, v112);
    objc_msgSend_numberWithBool_(v108, v114, isRBManaged, v115, v116);
    uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v76, v118, (uint64_t)v117, (uint64_t)@"isRBManaged", v119);

    v120 = (void *)MEMORY[0x189607968];
    uint64_t v125 = objc_msgSend_extensionPointPlatform(self, v121, v122, v123, v124);
    objc_msgSend_numberWithUnsignedInt_(v120, v126, v125, v127, v128);
    uint64_t v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v76, v130, (uint64_t)v129, (uint64_t)@"epPlatform", v131);

    if (v12) {
      objc_msgSend_setObject_forKeyedSubscript_(v76, v132, (uint64_t)v12, (uint64_t)@"hostProtocol", v133);
    }
    pklog_handle_for_category(7);
    uint64_t v134 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uuid(self, v135, v136, v137, v138);
      uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(self, v140, v141, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(self, v145, v146, v147, v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      int v154 = objc_msgSend_isRBManaged(self, v150, v151, v152, v153);
      uint64_t v155 = "non-";
      *(_DWORD *)buf = 138544130;
      uint64_t v168 = v139;
      __int16 v169 = 2112;
      v170 = v144;
      if (v154) {
        uint64_t v155 = (const char *)&unk_186A2AA17;
      }
      __int16 v171 = 2112;
      uint64_t v172 = v149;
      __int16 v173 = 2080;
      uint64_t v174 = v155;
      _os_log_impl( &dword_186A04000,  v134,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] Sending prepareUsing to %smanaged extension; this should launch it if not already running.",
        buf,
        0x2Au);
    }

    v163[0] = MEMORY[0x1895F87A8];
    v163[1] = 3221225472LL;
    v163[2] = sub_186A0B0F0;
    v163[3] = &unk_189F20888;
    id v164 = v7;
    objc_msgSend_prepareUsing_reply_(v6, v156, (uint64_t)v76, (uint64_t)v163, v157);
  }

  else if (v44 == 1)
  {
    pklog_handle_for_category(7);
    uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uuid(self, v50, v51, v52, v53);
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(self, v55, v56, v57, v58);
      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(self, v60, v61, v62, v63);
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(self, v65, v66, v67, v68);
      uint64_t v69 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      uint64_t v168 = v54;
      __int16 v169 = 2114;
      v170 = v59;
      __int16 v171 = 2112;
      uint64_t v172 = v64;
      __int16 v173 = 2112;
      uint64_t v174 = v69;
      _os_log_impl( &dword_186A04000,  v49,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] Sending legacy prepareUsingPlugIn to extension; this should launch it if no"
        "t already running.",
        buf,
        0x2Au);
    }

    objc_msgSend_identifier(self, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v165[0] = MEMORY[0x1895F87A8];
    v165[1] = 3221225472LL;
    v165[2] = sub_186A0B074;
    v165[3] = &unk_189F20860;
    id v166 = v7;
    objc_msgSend_prepareUsingPlugIn_hostProtocol_reply_(v6, v75, (uint64_t)v74, (uint64_t)v12, (uint64_t)v165);
  }

  else
  {
    v158 = (void *)MEMORY[0x189603F70];
    uint64_t v159 = *MEMORY[0x189603A58];
    uint64_t v160 = objc_msgSend_hubProtocolVersion(self, v45, v46, v47, v48);
    objc_msgSend_raise_format_(v158, v161, v159, (uint64_t)@"unexpected hub protocol version:%ld", v162, v160);
  }
}

- (void)setBootstrapWithSubsystemOptions:(id)a3
{
  xpc_object_t value = a3;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v5 = getenv("CLASSIC");
  if (v5) {
    xpc_dictionary_set_string(v4, "CLASSIC", v5);
  }
  if (value) {
    xpc_dictionary_set_value(v4, "SubsystemOptions", value);
  }
  if (xpc_dictionary_get_count(v4))
  {
    objc_msgSend_pluginConnection(self, v6, v7, v8, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__xpcConnection(v10, v11, v12, v13, v14);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_bootstrap();
  }
}

- (BOOL)loadExtensions:(id)a3 error:(id *)a4
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v10 = v5;
  if (v5 && objc_msgSend_count(v5, v6, v7, v8, v9))
  {
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    uint64_t v66 = v10;
    id v11 = v10;
    unint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v67, (uint64_t)v71, 16);
    if (v13)
    {
      uint64_t v14 = *(void *)v68;
      do
      {
        uint64_t v15 = 0LL;
        if (v13 <= 1) {
          uint64_t v16 = 1LL;
        }
        else {
          uint64_t v16 = v13;
        }
        do
        {
          if (*(void *)v68 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v26 = *(void *)(*((void *)&v67 + 1) + 8 * v15);
          uint64_t v27 = objc_alloc(&OBJC_CLASS___PKSandboxExtension);
          uint64_t v32 = objc_msgSend_external(self, v28, v29, v30, v31);
          objc_msgSend_sandbox((void *)v32, v33, v34, v35, v36);
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v40 = (void *)objc_msgSend_initWithExtension_provider_(v27, v38, v26, (uint64_t)v37, v39);

          objc_msgSend_sandboxExtensions(self, v41, v42, v43, v44);
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v32) = objc_msgSend_containsObject_(v45, v46, (uint64_t)v40, v47, v48);

          if ((v32 & 1) == 0)
          {
            objc_msgSend_consume(v40, v49, v50, v51, v52);
            objc_msgSend_sandboxExtensions(self, v53, v54, v55, v56);
            uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (v57)
            {
              objc_msgSend_sandboxExtensions(self, v58, v59, v60, v61);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_arrayByAddingObject_(v17, v18, (uint64_t)v40, v19, v20);
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setSandboxExtensions_(self, v22, (uint64_t)v21, v23, v24);
            }

            else
            {
              objc_msgSend_arrayWithObject_(MEMORY[0x189603F18], v58, (uint64_t)v40, v60, v61);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setSandboxExtensions_(self, v62, (uint64_t)v17, v63, v64);
            }
          }

          ++v15;
        }

        while (v16 != v15);
        unint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v25, (uint64_t)&v67, (uint64_t)v71, 16);
      }

      while (v13);
    }

    uint64_t v10 = v66;
  }

  return 1;
}

- (BOOL)isSandboxed
{
  if (qword_18C697320 != -1) {
    dispatch_once(&qword_18C697320, &unk_189F208C8);
  }
  return byte_18C697318;
}

- (BOOL)useBundle:(id)a3 error:(id *)a4
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  objc_msgSend_discoveryExtensions(self, v7, v8, v9, v10);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend_discoveryExtensions(self, v11, v12, v13, v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v21 = objc_msgSend_count(v16, v17, v18, v19, v20) == 0;
  }

  else
  {
    BOOL v21 = 1;
  }

  if (!v21)
  {
    pklog_handle_for_category(7);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_186A24BCC( (uint64_t)self,  (uint64_t)v6,  (uint64_t)v22,  v23,  v24,  v25,  v26,  v27,  v69,  v70,  v71,  v72,  v74,  v75,  v76,  v77,  v78,  v79,  v80,  v81,  v82,  v83,  v84,  v85);
    }

    objc_msgSend_discoveryExtensions(self, v28, v29, v30, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = v32;
    if (v6)
    {
      objc_msgSend_objectForKeyedSubscript_(v32, v33, (uint64_t)v6, v35, v36);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        uint64_t v76 = (uint64_t)v38;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v39, (uint64_t)&v76, 1, v42);
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(a4) = objc_msgSend_loadExtensions_error_(self, v44, (uint64_t)v43, (uint64_t)a4, v45);
      }

      else
      {
        if (!a4)
        {
LABEL_16:

          goto LABEL_17;
        }

        objc_msgSend_uuid(self, v39, v40, v41, v42);
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multipleInstanceUUID(self, v48, v49, v50, v51);
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(self, v53, v54, v55, v56);
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_version(self, v58, v59, v60, v61);
        uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
        pkErrorf( 11LL,  @"[u %@:m %@] [%@(%@)] sandbox extensions for relative path [%@] not vended by plugin",  v62,  v63,  v64,  v65,  v66,  v67,  (uint64_t)v43);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a4) = 0;
      }

      uint64_t v37 = v38;
    }

    else
    {
      objc_msgSend_allValues(v32, v33, v34, v35, v36);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(a4) = objc_msgSend_loadExtensions_error_(self, v46, (uint64_t)v43, (uint64_t)a4, v47);
    }

    uint64_t v38 = v37;
    goto LABEL_16;
  }

  LOBYTE(a4) = 1;
LABEL_17:

  return (char)a4;
}

- (void)endUsing:(id)a3
{
}

- (void)endUsingRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_186A069DC;
  uint64_t v27 = sub_186A069EC;
  id v28 = 0LL;
  objc_msgSend_uuid(v6, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__syncQueue(self, v13, v14, v15, v16);
  uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A0B790;
  block[3] = &unk_189F208F0;
  id v18 = v12;
  id v20 = v18;
  BOOL v21 = self;
  uint64_t v22 = &v23;
  dispatch_sync(v17, block);

  v7[2](v7, v24[5]);
  _Block_object_dispose(&v23, 8);
}

- (BOOL)endUsingWithError:(id *)a3
{
  return ((uint64_t (*)(PKHostPlugIn *, char *, void, id *))MEMORY[0x189616718])( self,  sel_endUsingRequest_error_,  0LL,  a3);
}

- (BOOL)endUsingRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_186A069DC;
  uint64_t v16 = sub_186A069EC;
  id v17 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_186A0BBAC;
  v11[3] = &unk_189F206A8;
  v11[4] = &v12;
  objc_msgSend_endUsingRequest_completion_(self, v7, (uint64_t)v6, (uint64_t)v11, v8);
  if (a4) {
    *a4 = (id) v13[5];
  }
  BOOL v9 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)unwind:(unint64_t)a3 force:(BOOL)a4
{
  uint64_t v195 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    if (objc_msgSend_state(self, a2, a3, a4, v4) != 1) {
      return;
    }
  }

  if (a3 != 2)
  {
    uint64_t v7 = objc_msgSend_useCount(self, a2, a3, a4, v4) - 1;
    objc_msgSend_setUseCount_(self, v8, v7, v9, v10);
    if ((_DWORD)v7)
    {
      pklog_handle_for_category(7);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
      {
LABEL_31:

        return;
      }

      objc_msgSend_uuid(self, v12, v13, v14, v15);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(self, v17, v18, v19, v20);
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(self, v22, v23, v24, v25);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(self, v27, v28, v29, v30);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      uint64_t v185 = v16;
      __int16 v186 = 2114;
      v187 = v21;
      __int16 v188 = 2112;
      uint64_t v189 = v26;
      __int16 v190 = 2112;
      v191 = v31;
      __int16 v192 = 1024;
      int v193 = objc_msgSend_useCount(self, v32, v33, v34, v35);
      _os_log_impl( &dword_186A04000,  (os_log_t)v11,  OS_LOG_TYPE_INFO,  "[u %{public}@:m %{public}@] [%@(%@)] plugin still active after removing one ref count, remaining = %u",  buf,  0x30u);
      goto LABEL_23;
    }
  }

  pklog_handle_for_category(7);
  uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_uuid(self, v37, v38, v39, v40);
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multipleInstanceUUID(self, v42, v43, v44, v45);
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v47, v48, v49, v50);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v52, v53, v54, v55);
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    uint64_t v185 = v41;
    __int16 v186 = 2114;
    v187 = v46;
    __int16 v188 = 2112;
    uint64_t v189 = v51;
    __int16 v190 = 2112;
    v191 = v56;
    _os_log_impl( &dword_186A04000,  v36,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] all extension sessions ended",  buf,  0x2Au);
  }

  objc_msgSend_messageTraceUsage(self, v57, v58, v59, v60);
  objc_msgSend_host(self, v61, v62, v63, v64);
  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deactivatePlugIn_(v65, v66, (uint64_t)self, v67, v68);

  if (a3 != 2)
  {
    objc_msgSend_service(self, v69, v70, v71, v72);
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shutdownPlugIn(v73, v74, v75, v76, v77);
  }

  objc_msgSend_changeState_(self, v69, a3, v71, v72);
  __int128 v182 = 0u;
  __int128 v183 = 0u;
  __int128 v180 = 0u;
  __int128 v181 = 0u;
  objc_msgSend_sandboxExtensions(self, v78, v79, v80, v81);
  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v180, (uint64_t)v194, 16);
  if (v84)
  {
    uint64_t v89 = *(void *)v181;
    do
    {
      uint64_t v90 = 0LL;
      if (v84 <= 1) {
        uint64_t v91 = 1LL;
      }
      else {
        uint64_t v91 = v84;
      }
      do
      {
        if (*(void *)v181 != v89) {
          objc_enumerationMutation(v82);
        }
        objc_msgSend_expel(*(void **)(*((void *)&v180 + 1) + 8 * v90++), v85, v86, v87, v88);
      }

      while (v91 != v90);
      unint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v85, (uint64_t)&v180, (uint64_t)v194, 16);
    }

    while (v84);
  }

  objc_msgSend_setSandboxExtensions_(self, v92, 0, v93, v94);
  objc_msgSend_setUseCount_(self, v95, 0, v96, v97);
  objc_msgSend_setPlugInPrincipal_(self, v98, 0, v99, v100);
  objc_msgSend_setEmbeddedPrincipal_(self, v101, 0, v102, v103);
  objc_msgSend_setService_(self, v104, 0, v105, v106);
  objc_msgSend_setSyncService_(self, v107, 0, v108, v109);
  objc_msgSend_pluginConnection(self, v110, v111, v112, v113);
  uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v114, v115, v116, v117, v118);

  objc_msgSend_setPluginConnection_(self, v119, 0, v120, v121);
  objc_msgSend_multipleInstanceUUID(self, v122, v123, v124, v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_changeState_(self, v127, 4 * (v126 != 0), v128, v129);

  objc_msgSend_launchPersonas(self, v130, v131, v132, v133);
  uint64_t v134 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v139 = objc_msgSend_count(v134, v135, v136, v137, v138);

  if (v139 >= 2)
  {
    v140 = objc_alloc(&OBJC_CLASS___PKManager);
    objc_msgSend_external(self, v141, v142, v143, v144);
    uint64_t v145 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = (void *)objc_msgSend_initWithExternalProviders_(v140, v146, (uint64_t)v145, v147, v148);
    objc_msgSend_url(self, v150, v151, v152, v153);
    int v154 = (void *)objc_claimAutoreleasedReturnValue();
    id v179 = 0LL;
    char v157 = objc_msgSend_terminatePlugInAtURL_withError_(v149, v155, (uint64_t)v154, (uint64_t)&v179, v156);
    id v11 = v179;

    pklog_handle_for_category(7);
    v158 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = v158;
    if ((v157 & 1) == 0)
    {
      if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR)) {
        sub_186A24D4C(self, (const char *)v11, v16, v177, v178);
      }
      goto LABEL_30;
    }

    if (!os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
LABEL_30:

      goto LABEL_31;
    }

    objc_msgSend_uuid(self, v159, v160, v161, v162);
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multipleInstanceUUID(self, v163, v164, v165, v166);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v167, v168, v169, v170);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v171, v172, v173, v174);
    uint64_t v175 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    uint64_t v185 = (os_log_s *)v21;
    __int16 v186 = 2114;
    v187 = v26;
    __int16 v188 = 2112;
    uint64_t v189 = v31;
    __int16 v190 = 2112;
    v191 = v175;
    _os_log_impl( &dword_186A04000,  v16,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] terminated multi-persona plugin",  buf,  0x2Au);

LABEL_23:
    goto LABEL_30;
  }

- (void)changeState:(unint64_t)a3
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  objc_msgSend__syncQueue(self, a2, a3, v3, v4);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  pklog_handle_for_category(7);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_uuid(self, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multipleInstanceUUID(self, v14, v15, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v19, v20, v21, v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(self, v24, v25, v26, v27);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    uint64_t v49 = v13;
    __int16 v50 = 2114;
    uint64_t v51 = v18;
    __int16 v52 = 2112;
    uint64_t v53 = v23;
    __int16 v54 = 2112;
    uint64_t v55 = v28;
    __int16 v56 = 2048;
    unint64_t v57 = a3;
    _os_log_impl( &dword_186A04000,  v8,  OS_LOG_TYPE_INFO,  "[u %{public}@:m %{public}@] [%@(%@)] state := %lu",  buf,  0x34u);
  }

  if (objc_msgSend_state(self, v29, v30, v31, v32) != a3)
  {
    objc_msgSend_setState_(self, v33, a3, v34, v35);
    objc_msgSend_notificationBlock(self, v36, v37, v38, v39);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend__replyQueue(self, v40, v41, v42, v43);
      uint64_t v45 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1895F87A8];
      v46[1] = 3221225472LL;
      v46[2] = sub_186A0C2E4;
      v46[3] = &unk_189F20918;
      v46[4] = self;
      id v47 = v44;
      dispatch_async(v45, v46);
    }
  }

- (id)notificationBlock
{
  return objc_getProperty(self, a2, 232LL, 1);
}

- (void)setNotificationBlock:(id)a3
{
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setPreferredLanguages:(id)a3
{
}

- (NSString)sandboxProfile
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setSandboxProfile:(id)a3
{
}

- (NSXPCConnection)pluginConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setPluginConnection:(id)a3
{
}

- (OS_dispatch_queue)_replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)set_replyQueue:(id)a3
{
}

- (OS_dispatch_queue)_syncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)set_syncQueue:(id)a3
{
}

- (OS_dispatch_queue)_startQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)set_startQueue:(id)a3
{
}

- (PKCorePlugInProtocol)service
{
  return (PKCorePlugInProtocol *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setService:(id)a3
{
}

- (PKCorePlugInProtocol)syncService
{
  return (PKCorePlugInProtocol *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setSyncService:(id)a3
{
}

- (NSUUID)supersedingUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setSupersedingUUID:(id)a3
{
}

- (PKPlugIn)supersededBy
{
  return (PKPlugIn *)objc_loadWeakRetained((id *)&self->_supersededBy);
}

- (void)setSupersededBy:(id)a3
{
}

- (NSUUID)multipleInstanceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setMultipleInstanceUUID:(id)a3
{
}

- (NSString)serviceExtension
{
  return (NSString *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setServiceExtension:(id)a3
{
}

- (NSDictionary)discoveryExtensions
{
  return (NSDictionary *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setDiscoveryExtensions:(id)a3
{
}

- (NSArray)sandboxExtensions
{
  return (NSArray *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setSandboxExtensions:(id)a3
{
}

- (id)queuedHostPrincipal
{
  return objc_getProperty(self, a2, 352LL, 1);
}

- (void)setQueuedHostPrincipal:(id)a3
{
}

- (Protocol)queuedHostProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)setQueuedHostProtocol:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unsigned)useCount
{
  return self->_useCount;
}

- (void)setUseCount:(unsigned int)a3
{
  self->_useCount = a3;
}

- (id)plugInPrincipal
{
  return objc_getProperty(self, a2, 376LL, 1);
}

- (void)setPlugInPrincipal:(id)a3
{
}

- (id)embeddedPrincipal
{
  return objc_getProperty(self, a2, 384LL, 1);
}

- (void)setEmbeddedPrincipal:(id)a3
{
}

- (NSBundle)embeddedBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 392LL, 1);
}

- (void)setEmbeddedBundle:(id)a3
{
}

- (BOOL)terminating
{
  return self->_terminating;
}

- (void)setTerminating:(BOOL)a3
{
  self->_terminating = a3;
}

- (NSDate)beganUsingAt
{
  return (NSDate *)objc_getProperty(self, a2, 400LL, 1);
}

- (void)setBeganUsingAt:(id)a3
{
}

- (NSDictionary)sourceForm
{
  return (NSDictionary *)objc_getProperty(self, a2, 408LL, 1);
}

- (void)setSourceForm:(id)a3
{
}

- (NSDictionary)environment
{
  return (NSDictionary *)objc_getProperty(self, a2, 416LL, 1);
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableSet)requests
{
  return (NSMutableSet *)objc_getProperty(self, a2, 424LL, 1);
}

- (PKHost)host
{
  return (PKHost *)objc_getProperty(self, a2, 432LL, 1);
}

- (void)setHost:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

@end