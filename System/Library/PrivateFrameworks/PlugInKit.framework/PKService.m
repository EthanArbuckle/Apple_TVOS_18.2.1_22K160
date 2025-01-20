@interface PKService
+ (id)defaultService;
+ (int)_defaultRun:(int)a3 arguments:(const char *)a4;
+ (void)main;
- (BOOL)_processDefaultSubsystemName:(id)a3;
- (BOOL)isSystemService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shared;
- (BOOL)unregisterPersonality:(id)a3;
- (NSArray)subsystems;
- (NSMutableDictionary)personalities;
- (NSXPCListener)serviceListener;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)timerQueue;
- (OS_dispatch_source)firstHostRequestTimer;
- (OS_dispatch_source)terminationTimer;
- (PKExternalProviders)external;
- (PKService)init;
- (PKService)initWithExternalProviders:(id)a3;
- (PKServiceDelegate)delegate;
- (PKServicePersonality)solePersonality;
- (id)configuredSubsystemList;
- (id)connectionForPlugInNamed:(id)a3;
- (id)defaultsForPlugInNamed:(id)a3;
- (id)discoverSubsystemNamed:(id)a3 options:(id)a4 required:(BOOL)a5;
- (id)embeddedPrincipalForPlugInNamed:(id)a3;
- (id)hostPrincipalForPlugInNamed:(id)a3;
- (id)personalityNamed:(id)a3;
- (id)personalityNamed:(id)a3 forHostPid:(int)a4;
- (id)plugInPrincipalForPlugInNamed:(id)a3;
- (os_unfair_lock_s)personalityLock;
- (unsigned)extensionPointPlatform;
- (void)_prepareToRunUsingServiceListener:(BOOL)a3;
- (void)beganUsingServicePersonality:(id)a3;
- (void)cancelTermination;
- (void)checkEnvironment:(id)a3;
- (void)checkIn;
- (void)discoverSubsystems;
- (void)launchContainingApplicationForPlugInNamed:(id)a3;
- (void)mergeSubsystemList:(id)a3 from:(id)a4;
- (void)mergeSubsystems:(id)a3 from:(id)a4;
- (void)registerPersonality:(id)a3;
- (void)run;
- (void)runUsingServiceListener:(BOOL)a3;
- (void)scheduleTermination:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExtensionPointPlatform:(unsigned int)a3;
- (void)setFirstHostRequestTimer:(id)a3;
- (void)setIsSystemService:(BOOL)a3;
- (void)setPersonalities:(id)a3;
- (void)setServiceListener:(id)a3;
- (void)setShared:(BOOL)a3;
- (void)setSolePersonality:(id)a3;
- (void)setSubsystems:(id)a3;
- (void)setTerminationTimer:(id)a3;
@end

@implementation PKService

- (void)checkIn
{
  if (objc_opt_class())
  {
    id v6 = (id)objc_msgSend_currentProcess(MEMORY[0x1896122D8], v2, v3, v4, v5);
    pklog_handle_for_category(7);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_186A04000,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "KernelMemoryStatus",  (const char *)&unk_186A2C58B,  buf,  2u);
    }

    getpid();
    memorystatus_control();
    pklog_handle_for_category(7);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl( &dword_186A04000,  v8,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "KernelMemoryStatus",  (const char *)&unk_186A2C58B,  v9,  2u);
    }
  }

- (void)beganUsingServicePersonality:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A1A2E0;
  block[3] = &unk_189F20608;
  id v8 = v4;
  v9 = self;
  uint64_t v5 = qword_18C4AE1D0;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&qword_18C4AE1D0, block);
  }
}

+ (void)main
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  pklog_handle_for_category(7);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    LOWORD(v16[0]) = 0;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v2,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "ExtensionStartup",  (const char *)&unk_186A2C58B,  (uint8_t *)v16,  2u);
  }

  pklog_handle_for_category(7);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    LOWORD(v16[0]) = 0;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "ExtensionStartupXPCReady",  (const char *)&unk_186A2C58B,  (uint8_t *)v16,  2u);
  }

  pklog_handle_for_category(7);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uid_t v5 = geteuid();
    uid_t v6 = getuid();
    v16[0] = 67109376;
    v16[1] = v5;
    __int16 v17 = 1024;
    uid_t v18 = v6;
    _os_log_impl( &dword_186A04000,  v4,  OS_LOG_TYPE_DEFAULT,  "Hello, I'm launching as euid = %d, uid = %d, (persona not available)",  (uint8_t *)v16,  0xEu);
  }

  objc_msgSend_defaultService(PKService, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_run(v11, v12, v13, v14, v15);
}

- (NSXPCListenerEndpoint)endpoint
{
  uid_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpoint(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v10;
}

- (PKService)init
{
  uint64_t v3 = (void *)objc_opt_new();
  uint64_t v7 = (PKService *)objc_msgSend_initWithExternalProviders_(self, v4, (uint64_t)v3, v5, v6);

  return v7;
}

- (PKService)initWithExternalProviders:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PKService;
  uint64_t v6 = -[PKService init](&v23, sel_init);
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_external, a3);
    objc_msgSend_dictionaryWithCapacity_(MEMORY[0x189603FC8], v8, 1, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPersonalities_(v7, v12, (uint64_t)v11, v13, v14);

    dispatch_queue_t v15 = dispatch_queue_create("timer queue", 0LL);
    timerQueue = v7->_timerQueue;
    v7->_timerQueue = (OS_dispatch_queue *)v15;

    v7->_personalityLock._os_unfair_lock_opaque = 0;
    uint64_t active_platform = dyld_get_active_platform();
    pklog_handle_for_category(7);
    uid_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = active_platform;
      _os_log_impl(&dword_186A04000, v18, OS_LOG_TYPE_INFO, "setting extensionPointPlatform: %u", buf, 8u);
    }

    objc_msgSend_setExtensionPointPlatform_(v7, v19, active_platform, v20, v21);
  }

  return v7;
}

+ (id)defaultService
{
  if (qword_18C4AE1E0 != -1) {
    dispatch_once(&qword_18C4AE1E0, &unk_189F20EF0);
  }
  return (id)qword_18C4AE1D8;
}

- (void)run
{
}

- (void)runUsingServiceListener:(BOOL)a3
{
  BOOL v5 = a3;
  if (objc_msgSend_supportsAutoreleasePoolDuringPlugInLaunch( PKCapabilities,  a2,  a3,  v3,  v4))
  {
    uint64_t v10 = (void *)MEMORY[0x186E413A8]();
    objc_msgSend__prepareToRunUsingServiceListener_(self, v11, v5, v12, v13);
    objc_autoreleasePoolPop(v10);
  }

  else
  {
    objc_msgSend__prepareToRunUsingServiceListener_(self, v7, v5, v8, v9);
  }

  objc_msgSend_timerQueue(self, v14, v15, v16, v17);
  uid_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A1AAF8;
  block[3] = &unk_189F20630;
  void block[4] = self;
  dispatch_sync(v18, block);

  pklog_handle_for_category(7);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl( &dword_186A04000,  v19,  OS_LOG_TYPE_DEFAULT,  "Bootstrapping; Bootstrap complete. Ready for handshake from host.",
      v26,
      2u);
  }

  pklog_handle_for_category(7);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)uint64_t v26 = 0;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v20,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ExtensionStartupXPCReady",  (const char *)&unk_186A2C58B,  v26,  2u);
  }

  objc_msgSend_serviceListener(self, v21, v22, v23, v24);
  int v25 = (void *)objc_claimAutoreleasedReturnValue();
  __PLUGINKIT_HANDING_CONTROL_TO_MAIN_SERVICE_LISTENER__();
}

- (void)_prepareToRunUsingServiceListener:(BOOL)a3
{
  BOOL v5 = a3;
  objc_msgSend_checkEnvironment_(self, a2, 0, v3, v4);
  if (v5) {
    objc_msgSend_serviceListener(MEMORY[0x189607B50], v7, v8, v9, v10);
  }
  else {
    objc_msgSend_anonymousListener(MEMORY[0x189607B50], v7, v8, v9, v10);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServiceListener_(self, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_serviceListener(self, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(v19, v20, (uint64_t)self, v21, v22);

  objc_msgSend_discoverSubsystems(self, v23, v24, v25, v26);
  objc_msgSend_external(self, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filesystem(v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainBundle(v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_infoDictionary(v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v46, v47, (uint64_t)@"NSExtension", v48, v49);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
  {
    objc_msgSend_objectForKeyedSubscript_(v46, v50, (uint64_t)@"PlugInKit", v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend_objectForKeyedSubscript_(v53, v50, (uint64_t)@"Delegate", v51, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    id v56 = v54;
    v61 = (const char *)objc_msgSend_UTF8String(v56, v57, v58, v59, v60);
    Class v62 = objc_lookUpClass(v61);
    v66 = v62;
    if (v62)
    {
      if (!objc_msgSend_conformsToProtocol_(v62, v63, (uint64_t)&unk_18C6A15F8, v64, v65))
      {
        pklog_handle_for_category(7);
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_186A262F8();
        }

        v66 = 0LL;
        goto LABEL_15;
      }

      v66 = (objc_class *)objc_alloc_init(v66);
    }

    if (v66)
    {
      objc_msgSend_setDelegate_(self, v63, (uint64_t)v66, v64, v65);
LABEL_18:

      goto LABEL_19;
    }

+ (int)_defaultRun:(int)a3 arguments:(const char *)a4
{
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_serviceListener(self, v8, v9, v10, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v6)
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___PKServicePersonality);
    uint64_t v13 = (os_log_s *)objc_msgSend_initWithConnection_service_(v14, v15, (uint64_t)v7, (uint64_t)self, v16);
  }

  else
  {
    pklog_handle_for_category(7);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_186A2634C();
    }
  }

  return v12 == v6;
}

- (BOOL)_processDefaultSubsystemName:(id)a3
{
  return 1;
}

- (void)discoverSubsystems
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  objc_msgSend_configuredSubsystemList(self, a2, v2, v3, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isSystemService(self, v7, v8, v9, v10))
  {
    uint64_t v15 = 0LL;
    goto LABEL_15;
  }

  uint64_t v16 = (void *)xpc_copy_bootstrap();
  uint64_t v17 = v16;
  if (!v16)
  {
    uint64_t v15 = 0LL;
    goto LABEL_12;
  }

  xpc_dictionary_get_value(v16, "SubsystemOptions");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18) {
    goto LABEL_9;
  }
  uint64_t v15 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pklog_handle_for_category(8);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_186A263A0(v19);
    }

LABEL_9:
    uint64_t v15 = 0LL;
  }

LABEL_12:
  pklog_handle_for_category(8);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_mainBundle(MEMORY[0x1896077F8], v21, v22, v23, v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_preferredLocalizations(v25, v26, v27, v28, v29);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v71 = v30;
    _os_log_impl(&dword_186A04000, v20, OS_LOG_TYPE_INFO, "Bootstrapping; Preferred localizations: %@", buf, 0xCu);
  }

LABEL_15:
  objc_msgSend_array(MEMORY[0x189603FA8], v11, v12, v13, v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkIn(self, v32, v33, v34, v35);
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v36 = v6;
  unint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v65, (uint64_t)v69, 16);
  if (v38)
  {
    uint64_t v40 = *(void *)v66;
    do
    {
      uint64_t v41 = 0LL;
      if (v38 <= 1) {
        uint64_t v42 = 1LL;
      }
      else {
        uint64_t v42 = v38;
      }
      do
      {
        if (*(void *)v66 != v40) {
          objc_enumerationMutation(v36);
        }
        objc_msgSend_discoverSubsystemNamed_options_required_( self,  v39,  *(void *)(*((void *)&v65 + 1) + 8 * v41),  (uint64_t)v15,  1,  (void)v65);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46) {
          objc_msgSend_addObject_(v31, v43, (uint64_t)v46, v44, v45);
        }

        ++v41;
      }

      while (v42 != v41);
      unint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v65, (uint64_t)v69, 16);
    }

    while (v38);
  }

  v47 = &off_189F20F38;
  objc_msgSend_stringWithUTF8String_( NSString,  v48,  (uint64_t)"NSViewService_PKSubsystem",  v49,  v50,  (void)v65);
  while (1)
  {
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!v36 || (objc_msgSend_containsObject_(v36, v56, (uint64_t)v59, v57, v58) & 1) == 0)
      && objc_msgSend__processDefaultSubsystemName_(self, v56, (uint64_t)v59, v57, v58))
    {
      objc_msgSend_discoverSubsystemNamed_options_required_(self, v60, (uint64_t)v59, (uint64_t)v15, 0);
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v64) {
        objc_msgSend_addObject_(v31, v61, (uint64_t)v64, v62, v63);
      }
    }

    uint64_t v55 = (uint64_t)*v47++;
    uint64_t v54 = v55;
    if (!v55) {
      break;
    }
    objc_msgSend_stringWithUTF8String_(NSString, v51, v54, v52, v53, (void)v65);
  }

  objc_msgSend_setSubsystems_(self, v51, (uint64_t)v31, v52, v53);
}

- (id)configuredSubsystemList
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filesystem(v6, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainBundle(v11, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_infoDictionary(v16, v17, v18, v19, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)@"NSExtension", v23, v24);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend_objectForKeyedSubscript_(v21, v25, (uint64_t)@"PlugInKit", v27, v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend_array(MEMORY[0x189603FA8], v25, v26, v27, v28);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergeSubsystems_from_(self, v31, (uint64_t)v30, (uint64_t)v29, v32);

  return v30;
}

- (void)mergeSubsystems:(id)a3 from:(id)a4
{
  id v53 = a3;
  id v6 = a4;
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)@"Subsystems", v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergeSubsystemList_from_(self, v11, (uint64_t)v53, (uint64_t)v10, v12);

  objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)@"NSExtensionPointIdentifier", v14, v15);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v16, (uint64_t)@"SDK", v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v20)
  {
    uint64_t v21 = objc_msgSend_extensionPointPlatform(self, v16, v17, v18, v19);
    objc_msgSend_external(self, v22, v23, v24, v25);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readSDKDictionary_forPlatform_externalProviders_( PKPlugInCore,  v27,  (uint64_t)v20,  v21,  (uint64_t)v26);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)@"NSExtension", v30, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v32, v33, (uint64_t)@"Subsystems", v34, v35);
    id v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mergeSubsystemList_from_(self, v37, (uint64_t)v53, (uint64_t)v36, v38);

    objc_msgSend_objectForKeyedSubscript_(v28, v39, (uint64_t)@"XPCService", v40, v41);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)@"ServiceType", v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
}

- (void)mergeSubsystemList:(id)a3 from:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = v6;
  if (v6)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    unint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, (uint64_t)v21, 16);
    if (v9)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0LL;
        if (v9 <= 1) {
          uint64_t v15 = 1LL;
        }
        else {
          uint64_t v15 = v9;
        }
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
          if ((objc_msgSend_containsObject_(v5, v10, v16, v11, v12) & 1) == 0) {
            objc_msgSend_addObject_(v5, v10, v16, v11, v12);
          }
          ++v14;
        }

        while (v15 != v14);
        unint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v17, (uint64_t)v21, 16);
      }

      while (v9);
    }
  }
}

- (id)discoverSubsystemNamed:(id)a3 options:(id)a4 required:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  uint64_t v14 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12, v13);
  Class v15 = objc_lookUpClass(v14);
  pklog_handle_for_category(8);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = v16;
  if (!v15)
  {
    if (v5)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_186A263E0();
      }
    }

    else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v25 = 138543362;
      id v26 = v9;
      _os_log_impl( &dword_186A04000,  v17,  OS_LOG_TYPE_INFO,  "Bootstrapping; external subsystem [%{public}@] not present, skipping",
        (uint8_t *)&v25,
        0xCu);
    }

    goto LABEL_19;
  }

  if (os_signpost_enabled(v16))
  {
    int v25 = 138543362;
    id v26 = v9;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "ExtensionSubsystemInit",  " name=%{public, signpost.description:attribute}@ ",  (uint8_t *)&v25,  0xCu);
  }

  pklog_handle_for_category(8);
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v25 = 138543362;
    id v26 = v9;
    _os_log_impl( &dword_186A04000,  v18,  OS_LOG_TYPE_INFO,  "Bootstrapping; external subsystem [%{public}@] initializing",
      (uint8_t *)&v25,
      0xCu);
  }

  __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_INIT__(v15, v8);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category(8);
  __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    int v25 = 138543618;
    id v26 = v9;
    __int16 v27 = 1026;
    BOOL v28 = v19 != 0LL;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v20,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ExtensionSubsystemInit",  " name=%{public, signpost.description:attribute}@  success=%{public, signpost.description:attribute}d ",  (uint8_t *)&v25,  0x12u);
  }

  if (!v19)
  {
    pklog_handle_for_category(8);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_186A26440();
    }
    goto LABEL_19;
  }

  if ((objc_msgSend_conformsToProtocol_(v19, v21, (uint64_t)&unk_18C6A1738, v22, v23) & 1) == 0)
  {

    pklog_handle_for_category(8);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_186A26494();
    }
LABEL_19:

    __int128 v19 = 0LL;
  }

  return v19;
}

- (void)launchContainingApplicationForPlugInNamed:(id)a3
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_186A264E8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (id)defaultsForPlugInNamed:(id)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferences(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)plugInPrincipalForPlugInNamed:(id)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_plugInPrincipal(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hostPrincipalForPlugInNamed:(id)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hostPrincipal(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)embeddedPrincipalForPlugInNamed:(id)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_embeddedPrincipal(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)connectionForPlugInNamed:(id)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connection(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setSolePersonality:(id)a3
{
  uint64_t v4 = (PKServicePersonality *)a3;
  os_unfair_lock_lock(&self->_personalityLock);
  solePersonality = self->_solePersonality;
  self->_solePersonality = v4;

  os_unfair_lock_unlock(&self->_personalityLock);
}

- (PKServicePersonality)solePersonality
{
  p_personalityLock = &self->_personalityLock;
  os_unfair_lock_lock(&self->_personalityLock);
  uint64_t v4 = self->_solePersonality;
  os_unfair_lock_unlock(p_personalityLock);
  if (!v4)
  {
    pklog_handle_for_category(7);
    uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_186A26558(self, v5, v6, v7, v8);
    }
  }

  return v4;
}

- (id)personalityNamed:(id)a3
{
  id v4 = a3;
  p_personalityLock = &self->_personalityLock;
  os_unfair_lock_lock(&self->_personalityLock);
  if (v4)
  {
    objc_msgSend_personalities(self, v6, v7, v8, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v4, v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v14, v15, v16, v17, v18) == 1)
    {
      objc_msgSend_allValues(v14, v19, v20, v21, v22);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v23, v24, 0, v25, v26);
      __int16 v27 = (PKServicePersonality *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      __int16 v27 = 0LL;
    }
  }

  else
  {
    __int16 v27 = self->_solePersonality;
  }

  os_unfair_lock_unlock(p_personalityLock);

  return v27;
}

- (id)personalityNamed:(id)a3 forHostPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_personalityLock = &self->_personalityLock;
  id v7 = a3;
  os_unfair_lock_lock(p_personalityLock);
  objc_msgSend_personalities(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v7, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_numberWithInt_(MEMORY[0x189607968], v17, v4, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v21, (uint64_t)v20, v22, v23);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_personalityLock);
  return v24;
}

- (void)registerPersonality:(id)a3
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_lock(&self->_personalityLock);
  objc_msgSend_personalities(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v4, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v15, (uint64_t)v14, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v19, v20, v21, v22);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_personalities(self, v23, v24, v25, v26);
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v4, v28, v29, v30, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v27, v33, (uint64_t)v18, (uint64_t)v32, v34);
  }

  uint64_t v35 = (void *)MEMORY[0x189607968];
  objc_msgSend_connection(v4, v19, v20, v21, v22);
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = objc_msgSend_processIdentifier(v36, v37, v38, v39, v40);
  objc_msgSend_numberWithInt_(v35, v42, v41, v43, v44);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v18, v46, (uint64_t)v4, (uint64_t)v45, v47);

  objc_msgSend_personalities(self, v48, v49, v50, v51);
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v52, v53, v54, v55, v56) == 1)
  {
    uint64_t v61 = objc_msgSend_count(v18, v57, v58, v59, v60);

    if (v61 == 1)
    {
      pklog_handle_for_category(7);
      uint64_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_uuid(v4, v63, v64, v65, v66);
        __int128 v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v4, v68, v69, v70, v71);
        uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_version(v4, v73, v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        int v83 = 138543874;
        v84 = v67;
        __int16 v85 = 2112;
        v86 = v72;
        __int16 v87 = 2112;
        v88 = v77;
        _os_log_impl( &dword_186A04000,  v62,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] Set sole personality.",  (uint8_t *)&v83,  0x20u);
      }

      v78 = (PKServicePersonality *)v4;
      solePersonality = self->_solePersonality;
      self->_solePersonality = v78;
      goto LABEL_12;
    }
  }

  else
  {
  }

  pklog_handle_for_category(7);
  v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
    sub_186A265E0(v4, (char *)self, v80, v81, v82);
  }

  solePersonality = self->_solePersonality;
  self->_solePersonality = 0LL;
LABEL_12:

  os_unfair_lock_unlock(&self->_personalityLock);
}

- (BOOL)unregisterPersonality:(id)a3
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id v4 = (PKServicePersonality *)a3;
  os_unfair_lock_lock(&self->_personalityLock);
  objc_msgSend_personalities(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = (void *)objc_msgSend_count(v9, v10, v11, v12, v13);

  if (v14)
  {
    objc_msgSend_personalities(self, v15, v16, v17, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v4, v20, v21, v22, v23);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v19, v25, (uint64_t)v24, v26, v27);
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = (void *)MEMORY[0x189607968];
    objc_msgSend_connection(v4, v29, v30, v31, v32);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_msgSend_processIdentifier(v33, v34, v35, v36, v37);
    objc_msgSend_numberWithInt_(v14, v39, v38, v40, v41);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v28, v43, (uint64_t)v42, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = v46 != 0LL;

    if (v46)
    {
      objc_msgSend_removeObjectForKey_(v28, v47, (uint64_t)v42, v48, v49);
      if (self->_solePersonality == v4)
      {
        pklog_handle_for_category(7);
        uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_uuid(v4, v51, v52, v53, v54);
          uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v4, v56, v57, v58, v59);
          uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_version(v4, v61, v62, v63, v64);
          uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
          int v68 = 138543874;
          uint64_t v69 = v55;
          __int16 v70 = 2112;
          uint64_t v71 = v60;
          __int16 v72 = 2112;
          v73 = v65;
          _os_log_impl( &dword_186A04000,  v50,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] Removed sole personality.",  (uint8_t *)&v68,  0x20u);
        }

        solePersonality = self->_solePersonality;
        self->_solePersonality = 0LL;
      }
    }
  }

  os_unfair_lock_unlock(&self->_personalityLock);

  return (char)v14;
}

- (void)checkEnvironment:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  bzero(__s, 0x400uLL);
  __s[0] = 63;
  objc_msgSend_external(self, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sandbox(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_external(self, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sys(v18, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = objc_msgSend_getpid(v23, v24, v25, v26, v27);
  int v30 = objc_msgSend_sandbox_container_path_for_pid_buffer_bufsize_(v13, v29, v28, (uint64_t)__s, 1024);

  if (v30)
  {
    pklog_handle_for_category(4);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_186A2673C(v31);
    }
  }

  else if (strlen(__s) > 1)
  {
    return;
  }

  id v32 = objc_alloc(NSString);
  uint64_t v33 = __error();
  uint64_t v37 = (void *)objc_msgSend_initWithFormat_( v32,  v34,  (uint64_t)@"plugin has invalid sandbox or container: error %d path %s",  v35,  v36,  *v33,  __s);
  pklog_handle_for_category(4);
  uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    sub_186A266E4();
  }

  objc_msgSend_raise_format_(MEMORY[0x189603F70], v39, *MEMORY[0x189603A58], (uint64_t)@"%@", v40, v37);
}

- (void)scheduleTermination:(double)a3
{
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = sub_186A1C2B8;
  v9[3] = &unk_189F205E0;
  v9[4] = self;
  *(double *)&v9[5] = a3;
  dispatch_sync(v8, v9);
}

- (void)cancelTermination
{
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A1C52C;
  block[3] = &unk_189F20630;
  void block[4] = self;
  dispatch_sync(v6, block);
}

- (unsigned)extensionPointPlatform
{
  return self->_extensionPointPlatform;
}

- (void)setExtensionPointPlatform:(unsigned int)a3
{
  self->_extensionPointPlatform = a3;
}

- (os_unfair_lock_s)personalityLock
{
  return self->_personalityLock;
}

- (OS_dispatch_queue)timerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (PKServiceDelegate)delegate
{
  return (PKServiceDelegate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCListener)serviceListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setServiceListener:(id)a3
{
}

- (NSMutableDictionary)personalities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPersonalities:(id)a3
{
}

- (NSArray)subsystems
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSubsystems:(id)a3
{
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (BOOL)isSystemService
{
  return self->_isSystemService;
}

- (void)setIsSystemService:(BOOL)a3
{
  self->_isSystemService = a3;
}

- (OS_dispatch_source)terminationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setTerminationTimer:(id)a3
{
}

- (OS_dispatch_source)firstHostRequestTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setFirstHostRequestTimer:(id)a3
{
}

- (PKExternalProviders)external
{
  return self->_external;
}

- (void).cxx_destruct
{
}

@end