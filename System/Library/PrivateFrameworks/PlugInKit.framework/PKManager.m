@interface PKManager
+ (id)defaultManager;
+ (id)managerForUser:(unsigned int)a3;
- (BOOL)releaseHold:(id)a3 flags:(unint64_t)a4 withError:(id *)a5;
- (BOOL)releaseHold:(id)a3 withError:(id *)a4;
- (BOOL)terminatePlugInAtURL:(id)a3 withError:(id *)a4;
- (PKDaemonClient)client;
- (PKExternalProviders)external;
- (PKManager)initWithDaemon:(id)a3;
- (PKManager)initWithDaemon:(id)a3 externalProviders:(id)a4;
- (PKManager)initWithExternalProviders:(id)a3;
- (id)containingAppForExtensionProperties:(id)a3;
- (id)containingAppForPlugInConnectedTo:(id)a3;
- (id)containingAppForPlugInWithPid:(int)a3;
- (id)forceHoldPlugIn:(id)a3 withError:(id *)a4;
- (id)holdPlugInsInApplication:(id)a3 withError:(id *)a4;
- (id)holdPlugInsWithExtensionPointName:(id)a3 error:(id *)a4;
- (id)holdPlugInsWithExtensionPointName:(id)a3 platforms:(id)a4 terminate:(BOOL)a5 error:(id *)a6;
- (id)informationForPlugInWithPid:(int)a3;
- (id)initForService:(const char *)a3;
- (id)initForUser:(unsigned int)a3;
- (id)terminatePlugInsInApplication:(id)a3 options:(int64_t)a4 withError:(id *)a5;
- (void)forceHoldPlugIn:(id)a3 result:(id)a4;
- (void)holdPlugInsInApplication:(id)a3 result:(id)a4;
- (void)holdPlugInsWithExtensionPointName:(id)a3 platforms:(id)a4 terminate:(BOOL)a5 result:(id)a6;
- (void)holdPlugInsWithExtensionPointName:(id)a3 result:(id)a4;
- (void)holdRequest:(id)a3 extensionPointName:(id)a4 platforms:(id)a5 flags:(unint64_t)a6 result:(id)a7;
- (void)holdRequest:(id)a3 flags:(unint64_t)a4 result:(id)a5;
- (void)registerPlugInAtURL:(id)a3 result:(id)a4;
- (void)registerPlugInsInBundle:(id)a3 result:(id)a4;
- (void)releaseHold:(id)a3;
- (void)releaseHold:(id)a3 reply:(id)a4;
- (void)setClient:(id)a3;
- (void)terminatePlugInsInApplication:(id)a3 options:(int64_t)a4 result:(id)a5;
- (void)unregisterPlugInAtURL:(id)a3 result:(id)a4;
- (void)unregisterPlugInsInBundle:(id)a3 result:(id)a4;
- (void)updateExtensionStatesForPlugIns:(id)a3 result:(id)a4;
@end

@implementation PKManager

+ (id)defaultManager
{
  if (qword_18C4AE1B8 != -1) {
    dispatch_once(&qword_18C4AE1B8, &unk_189F213D8);
  }
  return (id)qword_18C4AE1B0;
}

+ (id)managerForUser:(unsigned int)a3
{
  uint64_t v5 = *(void *)&a3;
  if (qword_18C697378 != -1) {
    dispatch_once(&qword_18C697378, &unk_189F213F8);
  }
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x189607968], a2, v5, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&dword_18C697370);
  objc_msgSend_objectForKey_((void *)qword_18C697368, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = objc_alloc(&OBJC_CLASS___PKManager);
    v10 = (void *)objc_msgSend_initForUser_(v11, v12, v5, v13, v14);
    objc_msgSend_setObject_forKey_((void *)qword_18C697368, v15, (uint64_t)v10, (uint64_t)v6, v16);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_18C697370);

  return v10;
}

- (id)initForService:(const char *)a3
{
  uint64_t v5 = objc_alloc(&OBJC_CLASS___PKDaemonClient);
  uint64_t v9 = (void *)objc_msgSend_initWithServiceName_(v5, v6, (uint64_t)a3, v7, v8);
  uint64_t v13 = (void *)objc_msgSend_initWithDaemon_(self, v10, (uint64_t)v9, v11, v12);

  return v13;
}

- (id)initForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___PKDaemonClient);
  uint64_t v8 = (void *)objc_msgSend_initWithServiceName_user_(v5, v6, 0, v3, v7);
  uint64_t v12 = (void *)objc_msgSend_initWithDaemon_(self, v9, (uint64_t)v8, v10, v11);

  return v12;
}

- (PKManager)initWithDaemon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_opt_new();
  uint64_t v8 = (PKManager *)objc_msgSend_initWithDaemon_externalProviders_(self, v6, (uint64_t)v4, (uint64_t)v5, v7);

  return v8;
}

- (PKManager)initWithDaemon:(id)a3 externalProviders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PKManager;
  uint64_t v8 = -[PKManager init](&v14, sel_init);
  uint64_t v12 = v8;
  if (v8)
  {
    objc_msgSend_setClient_(v8, v9, (uint64_t)v6, v10, v11);
    objc_storeStrong((id *)&v12->_external, a4);
  }

  return v12;
}

- (PKManager)initWithExternalProviders:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___PKDaemonClient);
  uint64_t v9 = (void *)objc_msgSend_initWithServiceName_(v5, v6, 0, v7, v8);
  uint64_t v12 = (PKManager *)objc_msgSend_initWithDaemon_externalProviders_(self, v10, (uint64_t)v9, (uint64_t)v4, v11);

  return v12;
}

- (void)registerPlugInAtURL:(id)a3 result:(id)a4
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_client(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v12);

  objc_initWeak(&from, self);
  pklog_handle_for_category(12);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_path(v6, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v46 = self;
    __int16 v47 = 2112;
    v48 = v18;
    _os_log_impl(&dword_186A04000, v13, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugin at [%@]", buf, 0x16u);
  }

  objc_msgSend_client(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x189603F18];
  objc_msgSend_path(v6, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(v24, v30, (uint64_t)v29, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1895F87A8];
  v38[1] = 3221225472LL;
  v38[2] = sub_186A206F4;
  v38[3] = &unk_189F21420;
  objc_copyWeak(&v41, &location);
  objc_copyWeak(&v42, &from);
  id v34 = v6;
  id v39 = v34;
  id v35 = v7;
  id v40 = v35;
  objc_msgSend_addPlugIns_reply_(v23, v36, (uint64_t)v33, (uint64_t)v38, v37);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)unregisterPlugInAtURL:(id)a3 result:(id)a4
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_client(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v12);

  objc_initWeak(&from, self);
  pklog_handle_for_category(12);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_path(v6, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v46 = self;
    __int16 v47 = 2112;
    v48 = v18;
    _os_log_impl(&dword_186A04000, v13, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugin at [%@]", buf, 0x16u);
  }

  objc_msgSend_client(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x189603F18];
  objc_msgSend_path(v6, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(v24, v30, (uint64_t)v29, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1895F87A8];
  v38[1] = 3221225472LL;
  v38[2] = sub_186A20A74;
  v38[3] = &unk_189F21420;
  objc_copyWeak(&v41, &location);
  objc_copyWeak(&v42, &from);
  id v34 = v6;
  id v39 = v34;
  id v35 = v7;
  id v40 = v35;
  objc_msgSend_removePlugIns_reply_(v23, v36, (uint64_t)v33, (uint64_t)v38, v37);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)registerPlugInsInBundle:(id)a3 result:(id)a4
{
  uint64_t v112 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v92 = a4;
  if (v6) {
    objc_msgSend_bundleWithURL_(MEMORY[0x1896077F8], v7, (uint64_t)v6, v9, v10);
  }
  else {
    objc_msgSend_mainBundle(MEMORY[0x1896077F8], v7, v8, v9, v10);
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category(12);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_path(v6, v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundlePath(v11, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v107 = self;
    __int16 v108 = 2112;
    v109 = v17;
    __int16 v110 = 2112;
    id v111 = v22;
    _os_log_impl( &dword_186A04000,  v12,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> register plugins in bundle at [%@] resolved to [%@]",  buf,  0x20u);
  }

  objc_msgSend_builtInPlugInsURL(v11, v23, v24, v25, v26);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_external(self, v27, v28, v29, v30);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filesystem(v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  id v104 = 0LL;
  objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_( v36,  v37,  (uint64_t)v93,  0,  4,  &v104);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  id v91 = v104;

  if (v38)
  {
    v43 = (void *)MEMORY[0x189603FA8];
    uint64_t v44 = objc_msgSend_count(v38, v39, v40, v41, v42);
    objc_msgSend_arrayWithCapacity_(v43, v45, v44, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    id v49 = v38;
    unint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v100, (uint64_t)v105, 16);
    if (v51)
    {
      uint64_t v56 = *(void *)v101;
      do
      {
        uint64_t v57 = 0LL;
        if (v51 <= 1) {
          uint64_t v58 = 1LL;
        }
        else {
          uint64_t v58 = v51;
        }
        do
        {
          if (*(void *)v101 != v56) {
            objc_enumerationMutation(v49);
          }
          objc_msgSend_path(*(void **)(*((void *)&v100 + 1) + 8 * v57), v52, v53, v54, v55, v91);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v48, v60, (uint64_t)v59, v61, v62);

          ++v57;
        }

        while (v58 != v57);
        unint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v100, (uint64_t)v105, 16);
      }

      while (v51);
    }

    if (objc_msgSend_count(v48, v63, v64, v65, v66))
    {
      objc_msgSend_client(self, v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v71);

      objc_initWeak(&location, self);
      objc_msgSend_client(self, v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = MEMORY[0x1895F87A8];
      v94[1] = 3221225472LL;
      v94[2] = sub_186A2107C;
      v94[3] = &unk_189F21420;
      objc_copyWeak(&v97, (id *)buf);
      objc_copyWeak(&v98, &location);
      id v95 = v11;
      id v96 = v92;
      objc_msgSend_addPlugIns_reply_(v76, v77, (uint64_t)v48, (uint64_t)v94, v78);

      objc_destroyWeak(&v98);
      objc_destroyWeak(&v97);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      pklog_handle_for_category(12);
      v84 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_bundlePath(v11, v85, v86, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v107 = self;
        __int16 v108 = 2112;
        v109 = v89;
        _os_log_impl( &dword_186A04000,  v84,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> register plugins in bundle at [%@] completed, there were no plugins in that bundle",  buf,  0x16u);
      }

      (*((void (**)(id, void))v92 + 2))(v92, 0LL);
    }
  }

  else
  {
    pklog_handle_for_category(12);
    v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_bundlePath(v11, v80, v81, v82, v83);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v107 = self;
      __int16 v108 = 2112;
      v109 = v90;
      __int16 v110 = 2112;
      id v111 = v91;
      _os_log_error_impl( &dword_186A04000,  v79,  OS_LOG_TYPE_ERROR,  "<PKManager:%p> register plugins in bundle at [%@] failed to fetch candidates: %@",  buf,  0x20u);
    }

    (*((void (**)(id, id))v92 + 2))(v92, v91);
  }
}

- (void)unregisterPlugInsInBundle:(id)a3 result:(id)a4
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v92 = a4;
  if (!v6)
  {
    objc_msgSend_mainBundle(MEMORY[0x1896077F8], v7, v8, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bundleURL(v11, v12, v13, v14, v15);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  pklog_handle_for_category(12);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_path(v6, v17, v18, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v105 = self;
    __int16 v106 = 2112;
    v107 = v21;
    _os_log_impl( &dword_186A04000,  v16,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> unregister plugins in bundle at [%@]",  buf,  0x16u);
  }

  objc_msgSend_external(self, v22, v23, v24, v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ls(v26, v27, v28, v29, v30);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationProxyForBundleURL_(v31, v32, (uint64_t)v6, v33, v34);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_plugInKitPlugins(v35, v36, v37, v38, v39);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = (void *)MEMORY[0x189603FA8];
  uint64_t v46 = objc_msgSend_count(v40, v42, v43, v44, v45);
  objc_msgSend_arrayWithCapacity_(v41, v47, v46, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  id v51 = v40;
  unint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v99, (uint64_t)v103, 16);
  if (v53)
  {
    uint64_t v58 = *(void *)v100;
    do
    {
      uint64_t v59 = 0LL;
      if (v53 <= 1) {
        uint64_t v60 = 1LL;
      }
      else {
        uint64_t v60 = v53;
      }
      do
      {
        if (*(void *)v100 != v58) {
          objc_enumerationMutation(v51);
        }
        objc_msgSend_bundleURL(*(void **)(*((void *)&v99 + 1) + 8 * v59), v54, v55, v56, v57, v92);
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_path(v61, v62, v63, v64, v65);
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v50, v67, (uint64_t)v66, v68, v69);

        ++v59;
      }

      while (v60 != v59);
      unint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v99, (uint64_t)v103, 16);
    }

    while (v53);
  }

  if (objc_msgSend_count(v50, v70, v71, v72, v73))
  {
    objc_msgSend_client(self, v74, v75, v76, v77);
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v78);

    objc_initWeak(&location, self);
    objc_msgSend_client(self, v79, v80, v81, v82);
    uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = MEMORY[0x1895F87A8];
    v93[1] = 3221225472LL;
    v93[2] = sub_186A215AC;
    v93[3] = &unk_189F21420;
    objc_copyWeak(&v96, (id *)buf);
    objc_copyWeak(&v97, &location);
    id v94 = v6;
    id v95 = v92;
    objc_msgSend_removePlugIns_reply_(v83, v84, (uint64_t)v50, (uint64_t)v93, v85);

    objc_destroyWeak(&v97);
    objc_destroyWeak(&v96);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    pklog_handle_for_category(12);
    uint64_t v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_path(v6, v87, v88, v89, v90);
      id v91 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v105 = self;
      __int16 v106 = 2112;
      v107 = v91;
      _os_log_impl( &dword_186A04000,  v86,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> unregister plugins in bundle at [%@] completed, there were plugins in that bundle registered with LaunchServices",  buf,  0x16u);
    }

    (*((void (**)(id, void))v92 + 2))(v92, 0LL);
  }
}

- (id)informationForPlugInWithPid:(int)a3
{
  uint64_t v3 = (void *)MEMORY[0x1895F8858](self, a2, *(void *)&a3);
  uint64_t v5 = v4;
  id v6 = v3;
  uint64_t v100 = *MEMORY[0x1895F89C0];
  objc_msgSend_external(v3, v7, v4, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_launch(v10, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (void *)objc_msgSend_copy_extension_properties_for_pid_(v15, v16, v5, v17, v18);

  if (v19 && (string = xpc_dictionary_get_string(v19, (const char *)*MEMORY[0x1895FB998])) != 0LL)
  {
    uint64_t v21 = (uint64_t)string;
    uint64_t v22 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v27 = (void *)objc_msgSend_mutableCopy(v22, v23, v24, v25, v26);

    id v28 = objc_alloc(MEMORY[0x189604030]);
    isDirectory_relativeToURL = (void *)objc_msgSend_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_( v28,  v29,  v21,  1,  0);
    objc_msgSend_external(v6, v31, v32, v33, v34);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ls(v35, v36, v37, v38, v39);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_plugInKitProxyForURL_(v40, v41, (uint64_t)isDirectory_relativeToURL, v42, v43);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_containingBundle(v44, v45, v46, v47, v48);
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v54 = v49;
    if (v49)
    {
      objc_msgSend_bundleURL(v49, v50, v51, v52, v53);
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v55, v56, v57, v58, v59);
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v61, (uint64_t)v60, (uint64_t)@"ContainingPath", v62);

      objc_msgSend_bundleIdentifier(v54, v63, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v68, (uint64_t)v67, (uint64_t)@"ContainingIdentifier", v69);
    }

    int int64 = xpc_dictionary_get_int64(v19, (const char *)*MEMORY[0x1895FB990]);
    if (int64 && proc_pidpath(int64, buffer, 0x1000u) >= 1)
    {
      id v71 = objc_alloc(MEMORY[0x189604030]);
      objc_msgSend_stringWithUTF8String_(NSString, v72, (uint64_t)buffer, v73, v74);
      uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
      inited = (void *)objc_msgSend_initFileURLWithPath_(v71, v76, (uint64_t)v75, v77, v78);

      if (inited && (uint64_t v83 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle(), (v84 = v83) != 0LL))
      {
        uint64_t v85 = CFBundleCopyBundleURL(v83);
        objc_msgSend_path(v85, v86, v87, v88, v89);
        uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v27, v91, (uint64_t)v90, (uint64_t)@"HostPath", v92);

        CFStringRef Identifier = CFBundleGetIdentifier(v84);
        objc_msgSend_setObject_forKeyedSubscript_( v27,  v94,  (uint64_t)Identifier,  (uint64_t)@"XPCExtensionHostBundleIdentifier",  v95);
        CFRelease(v84);
      }

      else
      {
        objc_msgSend_stringWithUTF8String_(NSString, v80, (uint64_t)buffer, v81, v82);
        uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v27, v96, (uint64_t)v85, (uint64_t)@"HostPath", v97);
      }
    }
  }

  else
  {
    uint64_t v27 = 0LL;
  }

  return v27;
}

- (id)containingAppForPlugInConnectedTo:(id)a3
{
  id v4 = a3;
  objc_msgSend_external(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_launch(v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = (void *)objc_msgSend_copy_extension_properties_(v14, v15, (uint64_t)v4, v16, v17);

  objc_msgSend_containingAppForExtensionProperties_(self, v19, (uint64_t)v18, v20, v21);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)containingAppForPlugInWithPid:(int)a3
{
  uint64_t v5 = *(void *)&a3;
  objc_msgSend_external(self, a2, *(uint64_t *)&a3, v3, v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_launch(v7, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = (void *)objc_msgSend_copy_extension_properties_for_pid_(v12, v13, v5, v14, v15);

  objc_msgSend_containingAppForExtensionProperties_(self, v17, (uint64_t)v16, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)containingAppForExtensionProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1895FB998]);
  if (!string) {
    goto LABEL_7;
  }
  uint64_t v7 = (uint64_t)string;
  id v8 = objc_alloc(MEMORY[0x189604030]);
  isDirectory_relativeToURL = (void *)objc_msgSend_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_( v8,  v9,  v7,  1,  0);
  objc_msgSend_external(self, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ls(v15, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_plugInKitProxyForURL_(v20, v21, (uint64_t)isDirectory_relativeToURL, v22, v23);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_containingBundle(v24, v25, v26, v27, v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = v29;
  if (v29)
  {
    objc_msgSend_bundleIdentifier(v29, v30, v31, v32, v33);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v34) {
LABEL_7:
  }
    uint64_t v15 = 0LL;

  return v15;
}

- (void)holdPlugInsInApplication:(id)a3 result:(id)a4
{
}

- (void)holdPlugInsWithExtensionPointName:(id)a3 platforms:(id)a4 terminate:(BOOL)a5 result:(id)a6
{
  if (a5) {
    objc_msgSend_holdRequest_extensionPointName_platforms_flags_result_( self,  a2,  0,  (uint64_t)a3,  (uint64_t)a4,  36,  a6);
  }
  else {
    objc_msgSend_holdRequest_extensionPointName_platforms_flags_result_( self,  a2,  0,  (uint64_t)a3,  (uint64_t)a4,  32,  a6);
  }
}

- (void)holdPlugInsWithExtensionPointName:(id)a3 result:(id)a4
{
}

- (void)forceHoldPlugIn:(id)a3 result:(id)a4
{
}

- (void)terminatePlugInsInApplication:(id)a3 options:(int64_t)a4 result:(id)a5
{
  id v11 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  if (a4)
  {
    pkError(18LL, @"unrecognized option to terminatePlugInsInApplication");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0LL, v10);
  }

  objc_msgSend_holdRequest_flags_result_(self, v8, (uint64_t)v11, 4, (uint64_t)v9);
}

- (id)holdPlugInsInApplication:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_186A21DD0;
  uint64_t v22 = sub_186A21DE0;
  id v23 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_186A21DD0;
  uint64_t v16 = sub_186A21DE0;
  id v17 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_186A21DE8;
  v11[3] = &unk_189F21448;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend_holdRequest_flags_result_(self, v7, (uint64_t)v6, 10, (uint64_t)v11);
  if (!v19[5])
  {
    if (a4)
    {
      id v8 = (void *)v13[5];
      if (v8) {
        *a4 = v8;
      }
    }
  }

  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (id)holdPlugInsWithExtensionPointName:(id)a3 platforms:(id)a4 terminate:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v12 = a4;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_186A21DD0;
  uint64_t v28 = sub_186A21DE0;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_186A21DD0;
  uint64_t v22 = sub_186A21DE0;
  id v23 = 0LL;
  if (v7) {
    uint64_t v13 = 44LL;
  }
  else {
    uint64_t v13 = 40LL;
  }
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = sub_186A21FC0;
  v17[3] = &unk_189F21448;
  v17[4] = &v24;
  v17[5] = &v18;
  objc_msgSend_holdRequest_extensionPointName_platforms_flags_result_( self,  v11,  0,  (uint64_t)v10,  (uint64_t)v12,  v13,  v17);
  if (!v25[5])
  {
    if (a6)
    {
      uint64_t v14 = (void *)v19[5];
      if (v14) {
        *a6 = v14;
      }
    }
  }

  id v15 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (id)holdPlugInsWithExtensionPointName:(id)a3 error:(id *)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)forceHoldPlugIn:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_186A21DD0;
  uint64_t v22 = sub_186A21DE0;
  id v23 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_186A21DD0;
  uint64_t v16 = sub_186A21DE0;
  id v17 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_186A22190;
  v11[3] = &unk_189F21448;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend_holdRequest_flags_result_(self, v7, (uint64_t)v6, 9, (uint64_t)v11);
  if (!v19[5])
  {
    if (a4)
    {
      id v8 = (void *)v13[5];
      if (v8) {
        *a4 = v8;
      }
    }
  }

  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (BOOL)terminatePlugInAtURL:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_186A21DD0;
  uint64_t v27 = sub_186A21DE0;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_186A21DD0;
  uint64_t v21 = sub_186A21DE0;
  id v22 = 0LL;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = sub_186A22390;
  v16[3] = &unk_189F21448;
  v16[4] = &v23;
  v16[5] = &v17;
  objc_msgSend_holdRequest_flags_result_(self, v7, (uint64_t)v6, 29, (uint64_t)v16);
  id v8 = (void *)v18[5];
  if (v24[5])
  {
    v18[5] = 0LL;

    uint64_t v9 = v24[5];
    id v10 = (id *)(v18 + 5);
    id obj = (id)v18[5];
    char v12 = objc_msgSend_releaseHold_flags_withError_(self, v11, v9, 24, (uint64_t)&obj);
    objc_storeStrong(v10, obj);
    if ((v12 & 1) != 0)
    {
      BOOL v13 = 1;
      goto LABEL_10;
    }

    BOOL v13 = 0;
    if (a4)
    {
      id v8 = (void *)v18[5];
      if (v8)
      {
LABEL_9:
        BOOL v13 = 0;
        *a4 = v8;
      }
    }
  }

  else
  {
    BOOL v13 = 0;
    if (a4 && v8) {
      goto LABEL_9;
    }
  }

- (id)terminatePlugInsInApplication:(id)a3 options:(int64_t)a4 withError:(id *)a5
{
  id v9 = a3;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_186A21DD0;
  uint64_t v26 = sub_186A21DE0;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_186A21DD0;
  uint64_t v20 = sub_186A21DE0;
  id v21 = 0LL;
  if (a4)
  {
    uint64_t v10 = pkError(18LL, @"unrecognized option to terminatePlugInsInApplication");
    id v11 = (void *)v17[5];
    v17[5] = v10;
  }

  else
  {
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = sub_186A22568;
    v15[3] = &unk_189F21448;
    v15[4] = &v22;
    v15[5] = &v16;
    objc_msgSend_holdRequest_flags_result_(self, v8, (uint64_t)v9, 12, (uint64_t)v15);
  }

  if (!v23[5])
  {
    if (a5)
    {
      char v12 = (void *)v17[5];
      if (v12) {
        *a5 = v12;
      }
    }
  }

  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (void)holdRequest:(id)a3 flags:(unint64_t)a4 result:(id)a5
{
}

- (void)holdRequest:(id)a3 extensionPointName:(id)a4 platforms:(id)a5 flags:(unint64_t)a6 result:(id)a7
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void, void *))a7;
  objc_msgSend_client(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v20);

  if (v12)
  {
    objc_msgSend_path(v12, v21, v22, v23, v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v25 = v13;
  }

  id v26 = v25;
  if (v12) {

  }
  pklog_handle_for_category(11);
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v52 = self;
    __int16 v53 = 2112;
    id v54 = v26;
    __int16 v55 = 2048;
    unint64_t v56 = a6;
    _os_log_impl( &dword_186A04000,  v27,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> hold request for [%@] with flags: 0x%llx",  buf,  0x20u);
  }

  if (v13) {
    BOOL v32 = 1;
  }
  else {
    BOOL v32 = v12 != 0LL;
  }
  if (v32)
  {
    if (v12 && v13)
    {
      pkError(18LL, @"Malformed hold request: only one of URL or extension point allowed");
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0LL, v33);
    }

    else
    {
      if (v12)
      {
        objc_msgSend_path(v12, v28, v29, v30, v31);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v35 = v34 == 0LL;

        if (v35)
        {
          pkError(18LL, @"Malformed NSURL passed by the client.");
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          v15[2](v15, 0LL, v33);
          goto LABEL_22;
        }

        objc_msgSend_path(v12, v36, v37, v38, v39);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v40;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v41, (uint64_t)&v50, 1, v42);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v33 = 0LL;
      }

      objc_msgSend_client(self, v28, v29, v30, v31);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1895F87A8];
      v45[1] = 3221225472LL;
      v45[2] = sub_186A22940;
      v45[3] = &unk_189F21470;
      objc_copyWeak(v48, &location);
      v45[4] = self;
      id v46 = v26;
      v48[1] = (id)a6;
      uint64_t v47 = v15;
      objc_msgSend_holdPlugins_extensionPointName_platforms_flags_reply_( v43,  v44,  (uint64_t)v33,  (uint64_t)v13,  (uint64_t)v14,  a6,  v45);

      objc_destroyWeak(v48);
    }
  }

  else
  {
    pkError(18LL, @"Malformed hold request: must supply URL or extension point");
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0LL, v33);
  }

- (void)releaseHold:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v6, v7, v8, v9);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v18,  v19,  (uint64_t)a2,  (uint64_t)self,  (uint64_t)@"PKManager.m",  509,  @"bad plugin hold token:%@",  v5);
  }

  objc_msgSend_client(self, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);

  objc_msgSend_client(self, v11, v12, v13, v14);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = sub_186A22D64;
  v20[3] = &unk_189F21498;
  objc_copyWeak(&v22, &location);
  v20[4] = self;
  id v16 = v5;
  id v21 = v16;
  objc_msgSend_releaseHold_flags_reply_(v15, v17, (uint64_t)v16, 0, (uint64_t)v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)releaseHold:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v9, v10, v11, v12);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v22,  v23,  (uint64_t)a2,  (uint64_t)self,  (uint64_t)@"PKManager.m",  523,  @"bad plugin hold token:%@",  v7);
  }

  objc_msgSend_client(self, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v13);

  objc_msgSend_client(self, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = sub_186A23008;
  v24[3] = &unk_189F214C0;
  objc_copyWeak(&v27, &location);
  v24[4] = self;
  id v19 = v7;
  id v25 = v19;
  id v20 = v8;
  id v26 = v20;
  objc_msgSend_releaseHold_flags_reply_(v18, v21, (uint64_t)v19, 0, (uint64_t)v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (BOOL)releaseHold:(id)a3 flags:(unint64_t)a4 withError:(id *)a5
{
  id v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v10, v11, v12, v13);
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v25,  v26,  (uint64_t)a2,  (uint64_t)self,  (uint64_t)@"PKManager.m",  538,  @"bad plugin hold token:%@",  v9);
  }

  objc_msgSend_client(self, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v14);

  uint64_t v31 = 0LL;
  BOOL v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_186A21DD0;
  BOOL v35 = sub_186A21DE0;
  id v36 = 0LL;
  objc_msgSend_client(self, v15, v16, v17, v18);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = sub_186A23318;
  v27[3] = &unk_189F214E8;
  uint64_t v29 = &v31;
  objc_copyWeak(&v30, &location);
  v27[4] = self;
  id v20 = v9;
  id v28 = v20;
  objc_msgSend_releaseHold_flags_reply_(v19, v21, (uint64_t)v20, a4, (uint64_t)v27);

  if (a5)
  {
    id v22 = (void *)v32[5];
    if (v22) {
      *a5 = v22;
    }
  }

  BOOL v23 = v32[5] == 0;

  objc_destroyWeak(&v30);
  _Block_object_dispose(&v31, 8);

  objc_destroyWeak(&location);
  return v23;
}

- (BOOL)releaseHold:(id)a3 withError:(id *)a4
{
  return objc_msgSend_releaseHold_flags_withError_(self, a2, (uint64_t)a3, 8, (uint64_t)a4);
}

- (void)updateExtensionStatesForPlugIns:(id)a3 result:(id)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  pklog_handle_for_category(10);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v28 = self;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl( &dword_186A04000,  v8,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> bulk update extension states: %@",  buf,  0x16u);
  }

  objc_msgSend_client(self, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, v13);

  objc_msgSend_client(self, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = sub_186A23614;
  v23[3] = &unk_189F214C0;
  objc_copyWeak(&v26, (id *)buf);
  v23[4] = self;
  id v19 = v6;
  id v24 = v19;
  id v20 = v7;
  id v25 = v20;
  objc_msgSend_bulkSetPluginAnnotations_reply_(v18, v21, (uint64_t)v19, (uint64_t)v23, v22);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

- (PKDaemonClient)client
{
  return (PKDaemonClient *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setClient:(id)a3
{
}

- (PKExternalProviders)external
{
  return (PKExternalProviders *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end