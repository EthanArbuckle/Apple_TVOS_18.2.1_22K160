@interface DTXPCServiceController
+ (id)sharedInstance;
- (DTXPCServiceController)init;
- (int)_configureInstance:(id)a3 identifier:(id)a4 servicePid:(int)a5 environment:(id)a6 arguments:(id)a7 options:(id)a8;
- (void)_matchRemove:(id)a3;
- (void)_registryModify:(BOOL)a3 identifier:(id)a4 parent:(int)a5 client:(id)a6 block:(id)a7;
- (void)registerClient:(id)a3 forXPCService:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8;
- (void)releaseAssertionsMadeByClient:(id)a3;
- (void)requestDebugLaunchOfDaemonWithSpecifier:(id)a3 programPath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8;
- (void)unregisterClient:(id)a3 withIdentifier:(id)a4 parent:(int)a5;
@end

@implementation DTXPCServiceController

+ (id)sharedInstance
{
  if (qword_100019690 != -1) {
    dispatch_once(&qword_100019690, &stru_100014E48);
  }
  return (id)qword_100019698;
}

- (DTXPCServiceController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DTXPCServiceController;
  v2 = -[DTXPCServiceController init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    registrationDictsByPid = v2->_registrationDictsByPid;
    v2->_registrationDictsByPid = v3;

    dispatch_queue_t v5 = dispatch_queue_create("XPCServiceController guard", 0LL);
    guard = v2->_guard;
    v2->_guard = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("XPCServiceController exec monitor", 0LL);
    execMonitorQueue = v2->_execMonitorQueue;
    v2->_execMonitorQueue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (void)releaseAssertionsMadeByClient:(id)a3
{
  id v4 = a3;
  if (sub_100008F68() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class(self);
    __int16 v9 = 2112;
    id v10 = v4;
    id v5 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%@ releasing active assertions taken on behalf of client %@",  (uint8_t *)&v7,  0x16u);
  }

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DTAssertionManager sharedInstance](&OBJC_CLASS___DTAssertionManager, "sharedInstance"));
    [v6 removeClaimsHeldByClient:v4];
  }
}

- (void)registerClient:(id)a3 forXPCService:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8
{
  id v118 = a3;
  id v119 = a4;
  id v115 = a5;
  id v116 = a6;
  id v14 = a7;
  v15 = (void (**)(id, id, void, uint64_t, uint64_t, id))a8;
  if (v15)
  {
    v109 = self;
    v114 = v15;
    id v16 = v119;
    unsigned int v108 = sub_100008F68();
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:DTProcessControlServiceOption_KillExistingKey[0]]);
    unsigned int v104 = [v17 isEqualToNumber:&__kCFBooleanFalse];

    v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:DTProcessControlServiceOption_RequestingPidKey[0]]);
    uint64_t v113 = (uint64_t)[v18 intValue];

    v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:DTProcessControlServiceOption_OnceOnlyKey[0]]);
    unsigned int v107 = [v19 BOOLValue];

    v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:DTProcessControlServiceOption_EnableExtensionKey[0]]);
    unsigned int v110 = [v20 isEqualToNumber:&__kCFBooleanTrue];

    v21 = (void *)objc_claimAutoreleasedReturnValue( [v14 objectForKeyedSubscript:DTProcessControlServiceOption_DisableMemoryLimitsKey[0]]);
    unsigned __int8 v103 = [v21 isEqualToNumber:&__kCFBooleanTrue];

    uint64_t v112 = objc_claimAutoreleasedReturnValue( [v14 objectForKeyedSubscript:DTProcessControlServiceOption_AppExtensionHoldContainerBundleIDKey[0]]);
    uint64_t v117 = objc_claimAutoreleasedReturnValue( [v14 objectForKeyedSubscript:DTProcessControlServiceOption_AppExtensionHoldContainerURLKey]);
    if (!v110)
    {
      v111 = 0LL;
      goto LABEL_46;
    }

    if (!(v112 | v117))
    {
      v111 = 0LL;
      uint64_t v117 = 0LL;
      goto LABEL_46;
    }

    v105 = (void *)objc_claimAutoreleasedReturnValue(+[PKManager defaultManager](&OBJC_CLASS___PKManager, "defaultManager"));
    if (v112)
    {
      id v168 = 0LL;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v112,  0LL,  &v168));
      id v23 = v168;
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 URL]);

      uint64_t v117 = v24;
      if (v23) {
        goto LABEL_19;
      }
    }

    else
    {
      id v23 = 0LL;
    }

    if (v117)
    {
      id v100 = v23;
      if (v108 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v117;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: ExtensionAssertion Hold Start %@:%@",  buf,  0x16u);
      }

      id v167 = 0LL;
      v111 = (void *)objc_claimAutoreleasedReturnValue([v105 holdPlugInsInApplication:v117 withError:&v167]);
      id v101 = v167;
      unsigned int v25 = v108;
      if (!v101) {
        unsigned int v25 = 0;
      }
      if (v25 == 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v101;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: ExtensionAssertion Hold Error: %@",  buf,  0xCu);
        }
      }

      else
      {
        v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v117));
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        v26 = (void *)objc_claimAutoreleasedReturnValue([v99 builtInPlugInsURL]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 relativePath]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v99 URLsForResourcesWithExtension:@"appex" subdirectory:v27]);

        id v29 = [v28 countByEnumeratingWithState:&v163 objects:v198 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v164;
LABEL_26:
          uint64_t v31 = 0LL;
          while (1)
          {
            if (*(void *)v164 != v30) {
              objc_enumerationMutation(v28);
            }
            v32 = *(void **)(*((void *)&v163 + 1) + 8 * v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v32));
            v34 = (void *)objc_claimAutoreleasedReturnValue([v33 bundleIdentifier]);
            unsigned __int8 v35 = [v34 isEqualToString:v16];

            if ((v35 & 1) != 0) {
              break;
            }
            if (v29 == (id)++v31)
            {
              id v29 = [v28 countByEnumeratingWithState:&v163 objects:v198 count:16];
              if (v29) {
                goto LABEL_26;
              }
              goto LABEL_32;
            }
          }

          id v36 = v32;

          if (!v36) {
            goto LABEL_42;
          }
          if (v108 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v16;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: ExtensionAssertion Terminate %@:%@",  buf,  0x16u);
          }

          id v162 = 0LL;
          [v105 terminatePlugInAtURL:v36 withError:&v162];
          id v37 = v162;
          if (v37 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v101;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "DTXPCServiceController: ExtensionAssertion Terminate Error: %@",  buf,  0xCu);
          }
        }

        else
        {
LABEL_32:
          id v36 = v28;
        }

LABEL_42:
      }

      id v23 = v100;
      goto LABEL_45;
    }

- (int)_configureInstance:(id)a3 identifier:(id)a4 servicePid:(int)a5 environment:(id)a6 arguments:(id)a7 options:(id)a8
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a8;
  unsigned int v13 = sub_100008F68();
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:DTProcessControlServiceOption_LeaveSuspendedKey[0]]);
  unsigned __int8 v15 = [v14 isEqualToNumber:&__kCFBooleanFalse];

  BOOL ShouldCaptureOutputWithOptions = DTProcessShouldCaptureOutputWithOptions(v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:DTProcessControlServiceOption_DisableMemoryLimitsKey[0]]);

  unsigned int v18 = [v17 isEqualToNumber:&__kCFBooleanTrue];
  if (v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "xpc_service_instance_is_configurable(): true",  buf,  2u);
  }

  if ([v11 count])
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000BB8C;
    v22[3] = &unk_100015000;
    id v23 = xpc_dictionary_create(0LL, 0LL, 0LL);
    id v19 = v23;
    [v11 enumerateKeysAndObjectsUsingBlock:v22];
    xpc_service_instance_set_environment(v10, v19);
  }

  if (ShouldCaptureOutputWithOptions && !pipe((int *)buf))
  {
    xpc_service_instance_dup2(v10, v25, 1LL);
    xpc_service_instance_dup2(v10, v25, 2LL);
    int v20 = *(_DWORD *)buf;
    close(v25);
    fcntl(v20, 2, 1LL);
    if ((v15 & 1) != 0) {
      goto LABEL_9;
    }
  }

  else
  {
    int v20 = -1;
    if ((v15 & 1) != 0)
    {
LABEL_9:
      if (v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "xpc launch: started *not* suspended",  buf,  2u);
      }

      goto LABEL_17;
    }
  }

  if (v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "xpc launch: starting suspended",  buf,  2u);
  }

  xpc_service_instance_set_start_suspended(v10);
LABEL_17:
  if (v18) {
    xpc_service_instance_set_jetsam_properties(v10, 12LL, 0xFFFFFFFFLL, 0LL);
  }

  return v20;
}

- (void)requestDebugLaunchOfDaemonWithSpecifier:(id)a3 programPath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  unsigned __int8 v18 = sub_100008F68();
  id v19 = v13;
  int v20 = (void *)xpc_service_create_from_specifier([v19 UTF8String], 0);
  if (v20)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10000BE64;
    v25[3] = &unk_100015028;
    unsigned __int8 v32 = v18;
    v25[4] = self;
    id v26 = v19;
    id v27 = v15;
    id v28 = v16;
    id v31 = v17;
    id v29 = v14;
    id v21 = v20;
    id v30 = v21;
    xpc_service_set_attach_handler(v21, v25);
    xpc_service_kickstart_with_flags(v21, 3LL);
  }

  else
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to find service with specifier '%@'.",  v19));
    v34 = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  1LL,  v23));
    (*((void (**)(id, id, void, void, uint64_t, void *))v17 + 2))(v17, v19, 0LL, 0LL, 0xFFFFFFFFLL, v24);
  }
}

- (void)_registryModify:(BOOL)a3 identifier:(id)a4 parent:(int)a5 client:(id)a6 block:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000C14C;
  v20[3] = &unk_100015078;
  v20[4] = self;
  id v15 = v13;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  int v24 = a5;
  id v17 = v14;
  id v23 = v17;
  unsigned __int8 v18 = objc_retainBlock(v20);
  id v19 = v18;
  if (v10) {
    dispatch_sync((dispatch_queue_t)self->_guard, v18);
  }
  else {
    ((void (*)(void *))v18[2])(v18);
  }
}

- (void)_matchRemove:(id)a3
{
  id v4 = a3;
  registrationDictsByPid = self->_registrationDictsByPid;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000C3E4;
  v7[3] = &unk_1000150C8;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( registrationDictsByPid,  "enumerateKeysAndObjectsUsingBlock:",  v7);
}

- (void)unregisterClient:(id)a3 withIdentifier:(id)a4 parent:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  guard = self->_guard;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C740;
  block[3] = &unk_1000150F0;
  block[4] = self;
  id v14 = v8;
  id v15 = v9;
  int v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)guard, block);
}

- (void).cxx_destruct
{
}

@end