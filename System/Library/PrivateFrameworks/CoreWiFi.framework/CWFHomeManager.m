@interface CWFHomeManager
+ (id)cwfHomeManagerWithDelegate:(id)a3;
- (BOOL)_isHomeInformationAvailable;
- (BOOL)initHomeManagerInstance;
- (CWFHomeManager)initWithDelegate:(id)a3;
- (CWFHomeManagerDelegate)_delegate;
- (CWFSensingAutoDataCollector)_autoDataColletor;
- (HMFLocationAuthorization)_homeLocationAuthorization;
- (HMHomeManager)_homeManager;
- (NSMutableDictionary)_serviceObjects;
- (NSObject)_activeAssertion;
- (OS_dispatch_queue)_serviceQueue;
- (id)getServiceEvents;
- (id)getServiceTypeStringFor:(int64_t)a3;
- (int)createServiceObjectFor:(int64_t)a3 withParams:(id)a4 andAccessory:(id)a5;
- (int)registerForAccessoryStateChange:(id)a3 withParams:(id)a4 forCWFHMServiceType:(int64_t)a5;
- (void)dealloc;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)removeObjectForServieType:(int64_t)a3 withUUID:(id)a4;
- (void)set_activeAssertion:(id)a3;
- (void)set_autoDataColletor:(id)a3;
- (void)set_delegate:(id)a3;
- (void)set_homeLocationAuthorization:(id)a3;
- (void)set_homeManager:(id)a3;
- (void)set_isHomeInformationAvailable:(BOOL)a3;
- (void)set_serviceObjects:(id)a3;
- (void)set_serviceQueue:(id)a3;
@end

@implementation CWFHomeManager

+ (id)cwfHomeManagerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___CWFHomeManager);
  v8 = (void *)objc_msgSend_initWithDelegate_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (BOOL)initHomeManagerInstance
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  sub_186519AE0();
  if (!objc_opt_class())
  {
    CWFGetOSLog();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      CWFGetOSLog();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v29 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v70 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 136446722;
      *(void *)&v77[4] = "-[CWFHomeManager initHomeManagerInstance]";
      *(_WORD *)&v77[12] = 2082;
      *(void *)&v77[14] = "CWFHomeManager.m";
      *(_WORD *)&v77[22] = 1024;
      LODWORD(v78) = 90;
      _os_log_send_and_compose_impl();
    }

    BOOL v8 = 0;
    goto LABEL_11;
  }

  objc_msgSend__homeManager(self, v3, v4, v5, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    uint64_t v73 = 0LL;
    v74 = &v73;
    uint64_t v75 = 0x2050000000LL;
    v9 = (void *)qword_18C4A4350;
    uint64_t v76 = qword_18C4A4350;
    if (!qword_18C4A4350)
    {
      *(void *)v77 = MEMORY[0x1895F87A8];
      *(void *)&v77[8] = 3221225472LL;
      *(void *)&v77[16] = sub_18651B7A4;
      v78 = &unk_189E5B480;
      v79 = &v73;
      sub_18651B7A4((uint64_t)v77);
      v9 = (void *)v74[3];
    }

    v10 = v9;
    _Block_object_dispose(&v73, 8);
    id v11 = objc_alloc(v10);
    objc_msgSend_bundleWithPath_( MEMORY[0x1896077F8],  v12,  (uint64_t)@"/System/Library/PrivateFrameworks/MobileWiFi.framework",  v13,  v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend_initWithBundle_(v11, v16, (uint64_t)v15, v17, v18);
    objc_msgSend_set_homeLocationAuthorization_(self, v20, (uint64_t)v19, v21, v22);

    uint64_t v73 = 0LL;
    v74 = &v73;
    uint64_t v75 = 0x2050000000LL;
    v23 = (void *)qword_18C4A4358;
    uint64_t v76 = qword_18C4A4358;
    if (!qword_18C4A4358)
    {
      *(void *)v77 = MEMORY[0x1895F87A8];
      *(void *)&v77[8] = 3221225472LL;
      *(void *)&v77[16] = sub_18651B85C;
      v78 = &unk_189E5B480;
      v79 = &v73;
      sub_18651B85C((uint64_t)v77);
      v23 = (void *)v74[3];
    }

    id v24 = v23;
    _Block_object_dispose(&v73, 8);
    objc_msgSend_defaultPrivateConfiguration(v24, v25, v26, v27, v28);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOptions_(v29, v30, 576, v31, v32);
    objc_msgSend_setAdaptive_(v29, v33, 1, v34, v35);
    objc_msgSend__homeLocationAuthorization(self, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocationAuthorization_(v29, v41, (uint64_t)v40, v42, v43);

    objc_msgSend_setCachePolicy_(v29, v44, 0, v45, v46);
    id v47 = objc_alloc((Class)sub_186519AE0());
    v51 = (void *)objc_msgSend_initWithHomeMangerConfiguration_(v47, v48, (uint64_t)v29, v49, v50);
    objc_msgSend_set_homeManager_(self, v52, (uint64_t)v51, v53, v54);

    objc_msgSend__homeManager(self, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = v59 != 0LL;

    if (v8)
    {
      objc_msgSend__homeManager(self, v60, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDelegate_(v64, v65, (uint64_t)self, v66, v67);
    }

    else
    {
      CWFGetOSLog();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71)
      {
        CWFGetOSLog();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v64 = (void *)MEMORY[0x1895F8DA0];
        id v72 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v77 = 136446722;
        *(void *)&v77[4] = "-[CWFHomeManager initHomeManagerInstance]";
        *(_WORD *)&v77[12] = 2082;
        *(void *)&v77[14] = "CWFHomeManager.m";
        *(_WORD *)&v77[22] = 1024;
        LODWORD(v78) = 103;
        _os_log_send_and_compose_impl();
      }
    }

LABEL_11:
    return v8;
  }

  return 0;
}

- (CWFHomeManager)initWithDelegate:(id)a3
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)&OBJC_CLASS___CWFHomeManager;
  uint64_t v5 = -[CWFHomeManager init](&v76, sel_init);
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifi.CWFHomeManager", 0LL);
    objc_msgSend_set_serviceQueue_(v5, v7, (uint64_t)v6, v8, v9);

    objc_msgSend_set_isHomeInformationAvailable_(v5, v10, 0, v11, v12);
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set_serviceObjects_(v5, v18, (uint64_t)v17, v19, v20);

    objc_msgSend_set_autoDataColletor_(v5, v21, 0, v22, v23);
    objc_msgSend_set_delegate_(v5, v24, (uint64_t)v4, v25, v26);
    objc_msgSend__delegate(v5, v27, v28, v29, v30);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend__delegate(v5, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_getServiceEvents(v5, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_startMonitoringSupportedEvents_(v36, v42, (uint64_t)v41, v43, v44);
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_code(v45, v46, v47, v48, v49))
      {
        CWFGetOSLog();
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          CWFGetOSLog();
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v55 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v56 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          int v77 = 136446722;
          v78 = "-[CWFHomeManager initWithDelegate:]";
          __int16 v79 = 2082;
          uint64_t v80 = "CWFHomeManager.m";
          __int16 v81 = 1024;
          int v82 = 131;
          int v75 = 28;
          v74 = &v77;
          _os_log_send_and_compose_impl();
        }
      }

      if (objc_msgSend_initHomeManagerInstance(v5, v50, v51, v52, v53, v74, v75))
      {
        objc_msgSend__homeManager(v5, v57, v58, v59, v60);
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__beginActiveAssertionWithReason_( v61,  v62,  (uint64_t)@"com.apple.wifi.HMNotificationAssertion",  v63,  v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_set_activeAssertion_(v5, v66, (uint64_t)v65, v67, v68);
      }

      else
      {

        CWFGetOSLog();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v71)
        {
          CWFGetOSLog();
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v61 = (void *)MEMORY[0x1895F8DA0];
          id v73 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
        {
          int v77 = 136446722;
          v78 = "-[CWFHomeManager initWithDelegate:]";
          __int16 v79 = 2082;
          uint64_t v80 = "CWFHomeManager.m";
          __int16 v81 = 1024;
          int v82 = 136;
          _os_log_send_and_compose_impl();
        }

        uint64_t v5 = 0LL;
      }
    }

    else
    {
      CWFGetOSLog();
      id v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
      {
        CWFGetOSLog();
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v45 = (void *)MEMORY[0x1895F8DA0];
        id v72 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v77) = 0;
        _os_log_send_and_compose_impl();
      }
    }
  }

  return v5;
}

- (void)dealloc
{
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend__delegate(self, v7, v8, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getServiceEvents(self, v12, v13, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = (id)objc_msgSend_stopMonitoringSupportedEvents_( v11,  v17,  (uint64_t)v16,  v18,  v19);
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CWFHomeManager;
  -[CWFHomeManager dealloc](&v21, sel_dealloc);
}

- (void)removeObjectForServieType:(int64_t)a3 withUUID:(id)a4
{
  id v6 = a4;
  objc_msgSend__serviceObjects(self, v7, v8, v9, v10);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v22, v11, (uint64_t)v6, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_getServiceTypeStringFor_(self, v15, a3, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v14, v19, (uint64_t)v18, v20, v21);
}

- (int)createServiceObjectFor:(int64_t)a3 withParams:(id)a4 andAccessory:(id)a5
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (a3 == 1)
  {
    id v9 = a4;
    objc_msgSend__delegate(self, v10, v11, v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createCWFSensingHMADataCollectorFor_withOptions_andDelegate_( CWFSensingHMADataCollector,  v15,  (uint64_t)v8,  (uint64_t)v9,  (uint64_t)v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend__serviceQueue(self, v17, v18, v19, v20);
      uint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_18651A404;
      block[3] = &unk_189E5C970;
      id v22 = v16;
      uint64_t v67 = v22;
      id v23 = v8;
      id v68 = v23;
      v69 = self;
      uint64_t v70 = 1LL;
      dispatch_async(v21, block);

      objc_msgSend__serviceObjects(self, v24, v25, v26, v27);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIdentifier(v23, v29, v30, v31, v32);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v28, v34, (uint64_t)v33, v35, v36);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_getServiceTypeStringFor_(self, v38, 1, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v37, v42, (uint64_t)v22, (uint64_t)v41, v43);

      CWFGetOSLog();
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        CWFGetOSLog();
        uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v45 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v47 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_uniqueIdentifier(v23, v48, v49, v50, v51);
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__serviceObjects(self, v53, v54, v55, v56);
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
        int v71 = 136447234;
        id v72 = "-[CWFHomeManager createServiceObjectFor:withParams:andAccessory:]";
        __int16 v73 = 2082;
        v74 = "CWFHomeManager.m";
        __int16 v75 = 1024;
        int v76 = 178;
        __int16 v77 = 2114;
        id v78 = v52;
        __int16 v79 = 2114;
        uint64_t v80 = v57;
        _os_log_send_and_compose_impl();
      }

      int v46 = 0;
      uint64_t v58 = v67;
    }

    else
    {
      CWFGetOSLog();
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        CWFGetOSLog();
        uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v58 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v61 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_uniqueIdentifier(v8, v62, v63, v64, v65);
        int v71 = 136446978;
        id v72 = "-[CWFHomeManager createServiceObjectFor:withParams:andAccessory:]";
        __int16 v73 = 2082;
        v74 = "CWFHomeManager.m";
        __int16 v75 = 1024;
        int v76 = 165;
        __int16 v77 = 2114;
        id v78 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }

      int v46 = -3931;
    }
  }

  else
  {
    int v46 = -3900;
  }

  return v46;
}

- (id)getServiceTypeStringFor:(int64_t)a3
{
  if (a3 != 1) {
    return 0LL;
  }
  objc_msgSend_stringWithFormat_(NSString, a2, (uint64_t)@"CWFSensingDataCollect", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getServiceEvents
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_18651A6C4;
  v11[3] = &unk_189E5F4D0;
  v11[4] = self;
  uint64_t v7 = (void *)MEMORY[0x186E3B038](v11);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v8, (uint64_t)v7, (uint64_t)@"CWFPerformSensingDataCollect", v9);

  return v6;
}

- (int)registerForAccessoryStateChange:(id)a3 withParams:(id)a4 forCWFHMServiceType:(int64_t)a5
{
  uint64_t v140 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v119 = a4;
  objc_msgSend__homeManager(self, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    CWFGetOSLog();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      CWFGetOSLog();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v32 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v105 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 225;
LABEL_66:
    _os_log_send_and_compose_impl();
    goto LABEL_67;
  }

  objc_msgSend__delegate(self, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    CWFGetOSLog();
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (v100)
    {
      CWFGetOSLog();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v32 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v106 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 230;
    goto LABEL_66;
  }

  if ((objc_msgSend__isHomeInformationAvailable(self, v19, v20, v21, v22) & 1) == 0)
  {
    CWFGetOSLog();
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      CWFGetOSLog();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v32 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v107 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_67;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 235;
    goto LABEL_66;
  }

  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    CWFGetOSLog();
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      CWFGetOSLog();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v32 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v104 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 240;
    goto LABEL_81;
  }

  if (!v119)
  {
    CWFGetOSLog();
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (v102)
    {
      CWFGetOSLog();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v32 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v113 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 245;
    goto LABEL_81;
  }

  if (a5 >= 2)
  {
    CWFGetOSLog();
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
    {
      CWFGetOSLog();
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v32 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v114 = MEMORY[0x1895F8DA0];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_82;
    }
    int v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    __int16 v132 = 2082;
    v133 = "CWFHomeManager.m";
    __int16 v134 = 1024;
    int v135 = 250;
LABEL_81:
    _os_log_send_and_compose_impl();
LABEL_82:
    int v108 = -3900;
    goto LABEL_68;
  }

  int64_t v117 = a5;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  objc_msgSend__homeManager(self, v23, v24, v25, v26);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homes(v27, v28, v29, v30, v31);
  uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v126, (uint64_t)v139, 16);
  if (!v121)
  {
LABEL_67:
    int v108 = -3931;
LABEL_68:
    int v118 = v108;
    goto LABEL_69;
  }

  uint64_t v120 = *(void *)v127;
  int v118 = -3931;
  obuint64_t j = v32;
  id v116 = v8;
  do
  {
    for (uint64_t i = 0LL; i != v121; ++i)
    {
      if (*(void *)v127 != v120) {
        objc_enumerationMutation(obj);
      }
      uint64_t v39 = *(void **)(*((void *)&v126 + 1) + 8 * i);
      __int128 v122 = 0u;
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      __int128 v125 = 0u;
      objc_msgSend_accessories(v39, v34, v35, v36, v37);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v122, (uint64_t)v138, 16);
      if (!v42) {
        goto LABEL_27;
      }
      uint64_t v47 = v42;
      uint64_t v48 = *(void *)v123;
      while (2)
      {
        for (uint64_t j = 0LL; j != v47; ++j)
        {
          if (*(void *)v123 != v48) {
            objc_enumerationMutation(v40);
          }
          uint64_t v50 = *(void **)(*((void *)&v122 + 1) + 8 * j);
          objc_msgSend_uniqueIdentifier(v50, v43, v44, v45, v46);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
          int isEqual = objc_msgSend_isEqual_(v8, v52, (uint64_t)v51, v53, v54);

          if (isEqual)
          {
            objc_msgSend__serviceObjects(self, v43, v44, v45, v46);
            uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v56, v57, (uint64_t)v8, v58, v59);
            uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v60)
            {
              objc_msgSend__serviceObjects(self, v61, v62, v63, v64);
              uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_dictionary(MEMORY[0x189603FC8], v66, v67, v68, v69);
              uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v65, v71, (uint64_t)v70, (uint64_t)v8, v72);
            }

            objc_msgSend__serviceObjects(self, v61, v62, v63, v64);
            __int16 v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_uniqueIdentifier(v50, v74, v75, v76, v77);
            id v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v73, v79, (uint64_t)v78, v80, v81);
            int v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_getServiceTypeStringFor_(self, v83, v117, v84, v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v82, v87, (uint64_t)v86, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            if (v90)
            {
              CWFGetOSLog();
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              if (v93)
              {
                CWFGetOSLog();
                v94 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                v94 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v96 = MEMORY[0x1895F8DA0];
              }

              uint64_t v32 = obj;
              id v8 = v116;

              if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
              {
                int v130 = 136446722;
                v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
                __int16 v132 = 2082;
                v133 = "CWFHomeManager.m";
                __int16 v134 = 1024;
                int v135 = 261;
                goto LABEL_40;
              }
            }

            else
            {
              int ServiceObjectFor_withParams_andAccessory = objc_msgSend_createServiceObjectFor_withParams_andAccessory_( self,  v91,  v117,  (uint64_t)v119,  (uint64_t)v50);
              if (!ServiceObjectFor_withParams_andAccessory)
              {
                int v118 = 0;
                id v8 = v116;
                goto LABEL_27;
              }

              int v118 = ServiceObjectFor_withParams_andAccessory;
              CWFGetOSLog();
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              id v8 = v116;
              if (v95)
              {
                CWFGetOSLog();
                v94 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                v94 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v97 = MEMORY[0x1895F8DA0];
              }

              uint64_t v32 = obj;

              if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
              {
                int v130 = 136446978;
                v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
                __int16 v132 = 2082;
                v133 = "CWFHomeManager.m";
                __int16 v134 = 1024;
                int v135 = 266;
                __int16 v136 = 1024;
                int v137 = v118;
LABEL_40:
                _os_log_send_and_compose_impl();
              }
            }

            goto LABEL_69;
          }
        }

        uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v122, (uint64_t)v138, 16);
        if (v47) {
          continue;
        }
        break;
      }

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_18651B324;
  block[3] = &unk_189E5BC10;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (HMHomeManager)_homeManager
{
  return self->__homeManager;
}

- (void)set_homeManager:(id)a3
{
}

- (BOOL)_isHomeInformationAvailable
{
  return self->__isHomeInformationAvailable;
}

- (void)set_isHomeInformationAvailable:(BOOL)a3
{
  self->__isHomeInformationAvailable = a3;
}

- (NSMutableDictionary)_serviceObjects
{
  return self->__serviceObjects;
}

- (void)set_serviceObjects:(id)a3
{
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
}

- (NSObject)_activeAssertion
{
  return self->__activeAssertion;
}

- (void)set_activeAssertion:(id)a3
{
}

- (HMFLocationAuthorization)_homeLocationAuthorization
{
  return self->__homeLocationAuthorization;
}

- (void)set_homeLocationAuthorization:(id)a3
{
}

- (CWFSensingAutoDataCollector)_autoDataColletor
{
  return self->__autoDataColletor;
}

- (void)set_autoDataColletor:(id)a3
{
}

- (CWFHomeManagerDelegate)_delegate
{
  return self->__delegate;
}

- (void)set_delegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end