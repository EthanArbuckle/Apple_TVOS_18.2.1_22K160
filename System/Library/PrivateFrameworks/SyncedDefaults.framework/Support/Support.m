int main(int argc, const char **argv, const char **envp)
{
  os_activity_s *v3;
  id v4;
  os_log_s *v5;
  dispatch_queue_global_t global_queue;
  dispatch_queue_s *v7;
  dispatch_source_t v8;
  void *v9;
  SYDDaemon *v10;
  void *v11;
  uint8_t v12[16];
  os_activity_scope_state_s state;
  v3 = _os_activity_create( (void *)&_mh_execute_header,  "kvs/main",  (os_activity_t)&_os_activity_none,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  v4 = SYDGetMiscLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Starting", v12, 2u);
  }

  global_queue = dispatch_get_global_queue(0LL, 0LL);
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v7);
  v9 = (void *)qword_100057940;
  qword_100057940 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100057940, &stru_10004C958);
  dispatch_resume((dispatch_object_t)qword_100057940);
  signal(15, (void (__cdecl *)(int))1);
  v10 = objc_alloc_init(&OBJC_CLASS___SYDDaemon);
  v11 = (void *)qword_100057938;
  qword_100057938 = (uint64_t)v10;

  [(id)qword_100057938 start];
  notify_post("com.apple.syncdefaultsd.daemon.wake");
  dispatch_main();
}

void sub_100003B00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_100003B18(id a1)
{
  id v1 = SYDGetMiscLog();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Exiting due to SIGTERM", v3, 2u);
  }

  exit(0);
}

void sub_100003BB4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SYDStoreBundleMap);
  v2 = (void *)qword_100057948;
  qword_100057948 = (uint64_t)v1;
}

void sub_100003F04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100003F1C(void *a1)
{
  v2 = a1 + 4;
  if (![(id)a1[4] length])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v21 handleFailureInMethod:a1[7] object:a1[5] file:@"SYDStoreBundleMap.m" lineNumber:81 description:@"storeIdentifier must not be empty"];
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.kvs.disable-sync" stringByAppendingString:*v2]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v5 = [v4 BOOLForKey:v3];

  if (v5)
  {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
    id v6 = SYDGetConnectionLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002B120((uint64_t)v2, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  else
  {
    id v14 = SYDGetConnectionLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002B188((uint64_t)v2, v7, v15, v16, v17, v18, v19, v20);
    }
  }
}

void sub_1000040E8(uint64_t a1)
{
  if (![*(id *)(a1 + 32) length])
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"SYDStoreBundleMap.m" lineNumber:97 description:@"storeIdentifier must not be empty"];
  }

  v2 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.kvs.disable-sync" stringByAppendingString:*(void *)(a1 + 32)]);
  int v3 = *(unsigned __int8 *)(a1 + 56);
  id v4 = SYDGetConnectionLog();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Enabling cloud sync for store <(%@)>",  (uint8_t *)&v11,  0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v8 removeObjectForKey:v2];
  }

  else
  {
    if (v6)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Disabling cloud sync for store <(%@)>",  (uint8_t *)&v11,  0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v8 setBool:1 forKey:v2];
  }
}

void sub_1000042C0(id a1)
{
  int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v3, "addObject:", @"com.apple.sbd3");
  -[NSMutableSet addObject:](v3, "addObject:", @"com.apple.security.cloudkeychainproxy3");
  id v1 = -[NSMutableSet copy](v3, "copy");
  v2 = (void *)qword_100057958;
  qword_100057958 = (uint64_t)v1;
}

void sub_10000454C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000456C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000457C(uint64_t a1)
{
}

void sub_100004584(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedStoreBundleMap]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}
}

void sub_1000046E0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedStoreBundleMap]);

  if (v2)
  {
    id v3 = SYDGetMiscLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002B364(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    [*(id *)(a1 + 32) setCachedStoreBundleMap:0];
  }

void sub_100004810( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100004828(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedStoreBundleMap]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

LABEL_25:
              v37 = SYDGetMiscLog();
              v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v77 = (os_log_s *)v20;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "No bundle identifier found using LSBundleRecord for: %@",  buf,  0xCu);
              }

LABEL_44:
              uint64_t v19 = (char *)v19 + 1;
            }

            while (v19 != v17);
            uint64_t v17 = [v59 countByEnumeratingWithState:&v67 objects:v82 count:16];
          }

          while (v17);
        }

        id v14 = v56 + 1;
      }

      while ((id)(v56 + 1) != v55);
      v55 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
    }

    while (v55);
  }

  v48 = SYDGetMiscLog();
  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v77 = (os_log_s *)v11;
    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "Generated new store bundle mapping: %@",  buf,  0xCu);
  }

  return v11;
}

id sub_100004F5C(uint64_t a1)
{
  id v2 = SYDGetMiscLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002B3C4(a1, v3, v4, v5, v6, v7, v8, v9);
  }

  return [*(id *)(a1 + 40) setCachedStoreBundleMap:0];
}

void sub_100005008( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100005020( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100005284( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000529C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000052AC(uint64_t a1)
{
}

void sub_1000052B4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_queue_allSyncManagers"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000053B0(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000541C;
  v4[3] = &unk_10004CAD8;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

id sub_10000541C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void sub_1000054CC(uint64_t a1)
{
  id v2 = SYDGetConnectionLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(SYDDaemonToClientConnection **)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Accepting new XPC connection %@",  (uint8_t *)&v9,  0xCu);
  }

  id v5 = -[SYDDaemonToClientConnection initWithXPCConnection:delegate:]( objc_alloc(&OBJC_CLASS___SYDDaemonToClientConnection),  "initWithXPCConnection:delegate:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
  id v6 = SYDGetConnectionLog();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Created client connection %@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientConnections]);
  [v8 addObject:v5];
}

void sub_10000574C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100005770(uint64_t a1)
{
  id v2 = sub_10000CE48([*(id *)(a1 + 32) type], 1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) type];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) testConfiguration]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = objc_claimAutoreleasedReturnValue( [v4 syncManagerForStoreType:v5 containerID:v3 testConfiguration:v6 createIfNecessary:1 error:&obj]);
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void sub_1000058CC(uint64_t a1)
{
  id v2 = SYDGetConnectionLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002B458();
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientConnections]);
  [v4 removeObject:*(void *)(a1 + 32)];
}

id sub_10000599C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _processAccountChanges];
}

void sub_100005F2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_100005FAC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accountStore]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "syd_accountIdentifierForCurrentPersona"));

  id v4 = SYDGetConnectionLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002B65C();
  }

  id v6 = (id *)(a1 + 40);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) coreDataStore]);
  id v33 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 acAccountIdentifierWithError:&v33]);
  id v9 = v33;
  if (v9)
  {
    id v10 = SYDGetConnectionLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002B5E4();
    }
LABEL_6:

    int v12 = 0;
    int v13 = 0;
    goto LABEL_7;
  }

  if (v8)
  {
    if (v3)
    {
      unsigned int v23 = [v3 isEqualToString:v8];
      id v24 = SYDGetConnectionLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      BOOL v25 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      if (v23)
      {
        if (v25) {
          sub_10002B540();
        }
        goto LABEL_6;
      }

      if (v25) {
        sub_10002B56C((uint64_t)v8);
      }

      [v7 deleteDataForAllStoresWithError:0];
      v30 = v7;
      v31 = v3;
    }

    else
    {
      id v28 = SYDGetConnectionLog();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        sub_10002B514();
      }

      [v7 deleteDataForAllStoresWithError:0];
      v30 = v7;
      v31 = 0LL;
    }

    [v30 setACAccountIdentifier:v31 error:0];
    int v12 = 0;
    int v13 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    goto LABEL_7;
  }

  id v26 = SYDGetConnectionLog();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  BOOL v27 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (v27) {
      sub_10002B4BC();
    }
    goto LABEL_6;
  }

  if (v27) {
    sub_10002B4E8();
  }

  [v7 clearServerSystemFieldsRecordsForAllStoresWithError:0];
  [v7 setACAccountIdentifier:v3 error:0];
  int v12 = 1;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  int v13 = 1;
LABEL_7:
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)
    || *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    if (!v13) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), v8);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL), v3);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  if (v13)
  {
LABEL_10:
    int v32 = v12;
    uint64_t v14 = (void *)objc_opt_class(*(void *)(a1 + 32));
    id v15 = [*(id *)(a1 + 40) storeType];
    uint64_t v16 = v7;
    uint64_t v17 = v8;
    uint64_t v18 = v3;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) container]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 containerID]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) testConfiguration]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v14 containerForStoreType:v15 containerID:v20 testConfiguration:v21]);

    uint64_t v3 = v18;
    uint64_t v8 = v17;
    uint64_t v7 = v16;
    id v6 = (id *)(a1 + 40);
    [*(id *)(a1 + 40) resetSyncEngineWithContainer:v22];

    int v12 = v32;
  }

LABEL_11:
  if (v12) {
    [*v6 markAllKeyValuesAsNeedingToBeUploaded];
  }
}

    goto LABEL_12;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 modificationDate]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 modificationDate]);
  int v13 = [v11 compare:v12];

  if (v13 == (id)-1LL)
  {
    uint64_t v14 = SYDGetCloudKitLog();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10002C0B4(v4);
    }
LABEL_19:

    unsigned int v23 = SYDGetCloudKitLog();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_10002BEBC(v4, v6, v24);
    }

    -[SYDKeyValue setServerSystemFieldsRecord:](self, "setServerSystemFieldsRecord:", v4);
    uint64_t v20 = 1;
    goto LABEL_22;
  }

  if (a4) {
    *a4 = v16;
  }
  v22 = SYDGetCloudKitLog();
  unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_10002E750(v21, v23);
  }

  return v21;
}

void sub_100006584(uint64_t a1)
{
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientConnections]);
  id v3 = [v2 copy];

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v22 = *(void *)v28;
    *(void *)&__int128 v5 = 138412546LL;
    __int128 v20 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "registeredStoreIDs", v20));
        id v10 = [v9 copy];

        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v24;
          while (2)
          {
            for (j = 0LL; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(a1 + 40);
              LOBYTE(v15) = [v15 containsObject:v16];

              if ((v15 & 1) != 0)
              {

                id v10 = (id)objc_claimAutoreleasedReturnValue([v8 applicationIdentifier]);
                if (v10)
                {
                  [*(id *)(a1 + 48) addObject:v10];
                }

                else
                {
                  id v17 = SYDGetConnectionLog();
                  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v19 = *(void *)(a1 + 40);
                    *(_DWORD *)buf = v20;
                    uint64_t v32 = v19;
                    __int16 v33 = 2112;
                    v34 = v8;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Found registered store in %@, but no application identifier from %@",  buf,  0x16u);
                  }
                }

                goto LABEL_20;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v23 objects:v35 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

LABEL_20:
      }

      id v6 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    }

    while (v6);
  }
}

LABEL_6:
  return v5;
}

  id v6 = 1LL;
LABEL_9:

  return v6;
}

void sub_1000071FC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accountStore]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "syd_accountIdentifierForCurrentPersona"));

  id v4 = SYDGetConnectionLog();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Setting initial account identifier to %@",  (uint8_t *)&v6,  0xCu);
  }

  [*(id *)(a1 + 40) setACAccountIdentifier:v3 error:0];
}

void sub_1000074A4(uint64_t a1)
{
  id v2 = SYDGetMiscLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002BB30();
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = sub_10000D204();
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v19 = v7;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v10), "integerValue", v19);
        id v12 = sub_10000CE48(v11, 1LL);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        uint64_t v14 = *(void **)(a1 + 40);
        id v20 = 0LL;
        id v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 syncManagerForStoreType:v11 containerID:v13 testConfiguration:0 createIfNecessary:1 error:&v20]);
        id v16 = v20;

        if (!v15)
        {
          id v17 = SYDGetConnectionLog();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            id v26 = v16;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Error creating sync manager during initialization: %@",  buf,  0xCu);
          }
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v8);
  }
}

void sub_1000077EC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v6 isEqualToString:@"PersonalPersona"] & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000078A0;
    v7[3] = &unk_10004CBA0;
    id v8 = *(id *)(a1 + 32);
    id v9 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void sub_1000078A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = SYDGetConnectionLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002BBC0();
  }

  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 personaUniqueString]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 personaUniqueString]);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[UMUserPersonaAttributes personaAttributesForPersonaUniqueString:]( &OBJC_CLASS___UMUserPersonaAttributes,  "personaAttributesForPersonaUniqueString:",  v8));

    id v10 = SYDGetConnectionLog();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v12)
      {
        int v14 = 138412290;
        id v15 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Persona still exists for sync manager %@",  (uint8_t *)&v14,  0xCu);
      }
    }

    else
    {
      if (v12)
      {
        int v14 = 138412290;
        id v15 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Persona no longer exists for sync manager %@",  (uint8_t *)&v14,  0xCu);
      }

      [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    }
  }

  else
  {
    id v13 = SYDGetConnectionLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10002BB94();
    }
  }
}

void sub_100007B20(id a1)
{
  id v1 = SYDGetMiscLog();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_10002BC20();
  }
}

void sub_100007E68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_100007EA4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_queue_allSyncManagers"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100007F74(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    [*(id *)(a1 + 32) sendAnalyticsEventForCurrentState];
  }

  else if (!state)
  {
    id v5 = SYDGetAnalyticsLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002BCB0();
    }

    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v7, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
    xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    xpc_object_t v8 = xpc_activity_copy_criteria(v3);
    id v9 = v8;
    if (!v8 || !xpc_equal(v8, v7))
    {
      id v10 = SYDGetAnalyticsLog();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10002BC84();
      }

      xpc_activity_set_criteria(v3, v7);
    }
  }
}

void sub_1000086D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
}

void sub_10000872C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_queue_allSyncManagers"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000880C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100008838( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_12:
  uint64_t v18 = SYDGetCloudKitLog();
  __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10002BDE4(v4, v6, v19);
  }

  id v20 = 0;
LABEL_22:

  return v20;
}

  if (v7)
  {
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v7) & 1) == 0)
    {
      id v15 = SYDGetMigrationLog();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100032480();
      }

      xpc_object_t v7 = 0LL;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"values"]);
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v17) & 1) == 0)
    {
      uint64_t v18 = SYDGetMigrationLog();
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10003241C();
      }

      xpc_object_t v7 = 0LL;
    }
  }

  if (a4) {
    *a4 = v8;
  }

  return v7;
}

  id v16 = 1;
LABEL_13:

  return v16;
}

LABEL_67:
              goto LABEL_68;
            }

            if (!v17) {
              goto LABEL_67;
            }
            v53 = SYDGetCloudKitLog();
            v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
              sub_10002C228();
            }
          }

          else
          {
            v52 = SYDGetCloudKitLog();
            v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
              sub_10002C1D0();
            }
          }

    goto LABEL_68;
  }

  id v4 = SYDGetMiscLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002CE90();
  }

  if (a1) {
    *a1 = 0LL;
  }
  return 1LL;
}

LABEL_57:
          if (v21)
          {
            v54 = SYDGetCloudKitLog();
            v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
              sub_10002C1A4();
            }

            v60 = 0LL;
            v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v21,  0LL,  0LL,  &v60));
            v57 = v60;
            v48 = v57;
            if (!v56 || v57)
            {
              v58 = SYDGetCloudKitLog();
              v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
                sub_10002C140();
              }
            }

            else
            {
              -[SYDKeyValue setValue:](self, "setValue:", v56);
              -[SYDKeyValue setValueModificationDate:](self, "setValueModificationDate:", v20);
            }

            goto LABEL_67;
          }

LABEL_68:
LABEL_69:
          goto LABEL_70;
        }

LABEL_43:
        v46 = SYDGetCloudKitLog();
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_INFO, "No value data in record", buf, 2u);
        }

        goto LABEL_45;
      }

      __int128 v25 = SYDGetCloudKitLog();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        __int128 v27 = (objc_class *)objc_opt_class(v20);
        __int128 v28 = NSStringFromClass(v27);
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)buf = 138412290;
        v63 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Record's modification date was of the wrong class (%@). Expected NSDate.",  buf,  0xCu);
      }
    }

    else
    {
      uint64_t v32 = SYDGetCloudKitLog();
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_INFO,  "No modification date in record",  buf,  2u);
      }
    }

    id v20 = 0LL;
    goto LABEL_24;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  id v11 = [v10 isEqualToString:@"EncryptedKeyValue"];

  if ((v11 & 1) != 0)
  {
    id v9 = 1LL;
    goto LABEL_7;
  }

  __int128 v30 = SYDGetCloudKitLog();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
    sub_10002C3D8(v4, (os_log_s *)v13);
  }
LABEL_70:
}

          id v9 = v44;
          goto LABEL_44;
        }

        int v14 = v30;
LABEL_35:
        v41 = SYDGetMigrationLog();
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_100031F00();
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v14);
        goto LABEL_43;
      }
    }

    else
    {
      id v20 = 0;
    }

    uint64_t v18 = *(id *)(a1 + 32);
    goto LABEL_19;
  }

  __int128 v24 = SYDGetMigrationLog();
  __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_100031D6C();
  }

  int v14 = 0LL;
LABEL_44:

  objc_autoreleasePoolPop(v9);
}

void sub_10000A14C(id a1)
{
  id v1 = (void *)qword_100057970;
  qword_100057970 = (uint64_t)&off_10004FB90;
}

void sub_10000A2C8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000A2EC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_10000A304( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000A32C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_10000A440(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"KVS: %@", v2));
  [*(id *)(a1 + 48) showNotificationWithTitle:v3 body:*(void *)(a1 + 40) threadIdentifier:v2];
}

void sub_10000A6B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000A6CC(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = SYDGetMiscLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002C7A0((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_10000A7A0(uint64_t a1)
{
  id v2 = SYDGetMiscLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002C808(v3);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userNotificationCenter]);
  [v4 requestAuthorizationWithOptions:4 completionHandler:&stru_10004CCD0];
}

void sub_10000A808(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  id v5 = SYDGetMiscLog();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002C8C0((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_10002C848(a2, v7);
  }
}

void sub_10000A8C4(id a1)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000LL;
  id v1 = (void *)qword_1000579C0;
  uint64_t v9 = qword_1000579C0;
  if (!qword_1000579C0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10000ABAC;
    v5[3] = &unk_10004CD58;
    v5[4] = &v6;
    sub_10000ABAC((uint64_t)v5);
    id v1 = (void *)v7[3];
  }

  id v2 = v1;
  _Block_object_dispose(&v6, 8);
  id v3 = [[v2 alloc] initWithBundleIdentifier:@"com.apple.Preferences"];
  id v4 = (void *)qword_100057988;
  qword_100057988 = (uint64_t)v3;
}

void sub_10000A980( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000AA10(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.kvs.user-notifications", v4);
  id v3 = (void *)qword_100057998;
  qword_100057998 = (uint64_t)v2;
}

Class sub_10000AA60(uint64_t a1)
{
  Class result = objc_getClass("UNMutableNotificationContent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_10002C928();
  }
  qword_1000579A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_10000AAB4()
{
  v0 = 0LL;
  if (!qword_1000579B0)
  {
    __int128 v1 = off_10004CD78;
    uint64_t v2 = 0LL;
    qword_1000579B0 = _sl_dlopen(&v1, &v0);
  }

  if (!qword_1000579B0) {
    sub_10002C9A0(&v0);
  }
  if (v0) {
    free(v0);
  }
}

Class sub_10000AB58(uint64_t a1)
{
  Class result = objc_getClass("UNNotificationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_10002CA1C();
  }
  qword_1000579B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_10000ABAC(uint64_t a1)
{
  Class result = objc_getClass("UNUserNotificationCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_10002CA94();
  }
  qword_1000579C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

CFDictionaryRef sub_10000AC00(const __CFDictionary *result, void *a2, const void **a3)
{
  if (result)
  {
    id v5 = result;
    CFTypeID v6 = CFGetTypeID(result);
    if (v6 != CFDictionaryGetTypeID()) {
      return 0LL;
    }
    Value = CFDictionaryGetValue(v5, @"timestamp");
    uint64_t v8 = CFDictionaryGetValue(v5, @"value");
    Class result = 0LL;
    if (!v8 || !Value) {
      return result;
    }
    CFTypeID v9 = CFGetTypeID(Value);
    if (v9 != CFNumberGetTypeID() || !CFNumberGetValue((CFNumberRef)Value, kCFNumberLongLongType, a2) || !*a2) {
      return 0LL;
    }
    if (a3) {
      *a3 = CFDictionaryGetValue(v5, @"remotevalue");
    }
    return (const __CFDictionary *)v8;
  }

  return result;
}

CFDictionaryRef sub_10000ACD8(const __CFDictionary *a1, void *a2)
{
  return sub_10000AC00(a1, a2, 0LL);
}

void sub_10000ACE0(dispatch_queue_s *a1, void *key, void (**a3)(void))
{
  if (dispatch_get_specific(key)) {
    a3[2](a3);
  }
  else {
    dispatch_sync(a1, a3);
  }
}

id sub_10000AD28(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1)
  {
    id v5 = 0LL;
    goto LABEL_45;
  }

  uint64_t v52 = 0LL;
  v53 = &v52;
  uint64_t v54 = 0x2020000000LL;
  uint64_t v55 = 1040LL;
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  v49 = sub_10000B38C;
  v50 = sub_10000B39C;
  id v51 = 0LL;
  if (sub_10000B3A4(v1))
  {
    v53[3] = 5555LL;
    id v3 = (void *)v47[5];
    v47[5] = (uint64_t)@"Unable to open database file";

    id v4 = v2;
  }

  else
  {
    id v4 = 0LL;
  }

  if (sub_10000B470(v2))
  {
    v53[3] = 4444LL;
    CFTypeID v6 = (void *)v47[5];
    v47[5] = (uint64_t)@"Disk is full";

    id v7 = v2;
    id v4 = v7;
  }

  if (sub_10000B54C(v2))
  {
    v53[3] = 4444LL;
    uint64_t v8 = (void *)v47[5];
    v47[5] = (uint64_t)@"Unable to open database";

    id v9 = v2;
    id v4 = v9;
  }

  if (sub_10000B628(v2))
  {
    v53[3] = 7777LL;
    uint64_t v10 = (void *)v47[5];
    v47[5] = (uint64_t)@"Network error";

    id v11 = v2;
    id v4 = v11;
  }

  if (v53[3] != 1040
    || (uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v2 domain]),
        unsigned int v13 = [v12 isEqualToString:CKErrorDomain],
        v12,
        !v13))
  {
    uint64_t v18 = 0LL;
    goto LABEL_33;
  }

  uint64_t v14 = (uint64_t)[v2 code];
  if (v14 <= 22)
  {
    switch(v14)
    {
      case 2LL:
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v2 userInfo]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

        objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v16) & 1) != 0 && [v16 count])
        {
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472LL;
          v42[2] = sub_10000B6D0;
          v42[3] = &unk_10004CD98;
          v44 = &v52;
          v45 = &v46;
          id v43 = v16;
          [v43 enumerateKeysAndObjectsUsingBlock:v42];
          id v21 = v43;
        }

        else
        {
          v53[3] = 1234LL;
          id v21 = (id)v47[5];
          v47[5] = (uint64_t)@"Failed to sync with CloudKit (Partial failure with no partial errors)";
        }

        break;
      case 3LL:
      case 4LL:
        v53[3] = 7777LL;
        id v15 = v47;
        id v16 = (void *)v47[5];
        id v17 = @"Network failure";
        goto LABEL_31;
      case 6LL:
      case 7LL:
        goto LABEL_22;
      case 9LL:
        v53[3] = 8888LL;
        id v15 = v47;
        id v16 = (void *)v47[5];
        id v17 = @"No account";
        goto LABEL_31;
      default:
        goto LABEL_46;
    }

    goto LABEL_32;
  }

  if (v14 > 109)
  {
    if (v14 == 110)
    {
      v53[3] = 121212LL;
      id v15 = v47;
      id v16 = (void *)v47[5];
      id v17 = @"End-to-end encryption unavailable";
    }

    else
    {
      if (v14 != 111) {
        goto LABEL_46;
      }
      v53[3] = 111111LL;
      id v15 = v47;
      id v16 = (void *)v47[5];
      id v17 = @"Encryption key sync failed";
    }

LABEL_31:
    v15[5] = (uint64_t)v17;
    goto LABEL_32;
  }

  if (v14 == 23)
  {
LABEL_22:
    v53[3] = 9999LL;
    id v15 = v47;
    id v16 = (void *)v47[5];
    id v17 = @"Service unavailable";
    goto LABEL_31;
  }

  if (v14 != 25)
  {
LABEL_46:
    v53[3] = 1234LL;
    v38 = (void *)v47[5];
    v47[5] = (uint64_t)@"Failed to sync with CloudKit";

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedDescription]);
    if (v16)
    {
      uint64_t v39 = objc_claimAutoreleasedReturnValue([(id)v47[5] stringByAppendingFormat:@" (%@)", v16]);
      v40 = (void *)v47[5];
      v47[5] = v39;
    }

    id v41 = v2;

    id v4 = v41;
    goto LABEL_32;
  }

  v53[3] = 6666LL;
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v2 localizedDescription]);
  id v16 = (void *)v47[5];
  v47[5] = v19;
LABEL_32:

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v2 userInfo]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:CKErrorRetryAfterKey]);

LABEL_33:
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v2 domain]);
  unsigned int v24 = [v23 isEqualToString:@"SyncedDefaults"];

  if (v24)
  {
    id v25 = [v2 code];
    v53[3] = (uint64_t)v25;
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v2 localizedDescription]);
    __int128 v27 = (void *)v47[5];
    v47[5] = v26;

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v2 userInfo]);
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    id v4 = (id)v29;
  }

  if (!v47[5])
  {
    v47[5] = (uint64_t)@"Unknown error";
  }

  __int128 v30 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (!v4) {
    goto LABEL_42;
  }
  id v31 = v4;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 domain]);
  unsigned int v33 = [v32 isEqualToString:@"SyncedDefaults"];

  if (v33)
  {

LABEL_41:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v31, NSUnderlyingErrorKey);
    goto LABEL_42;
  }

  int v34 = sub_10000B628(v31);

  if (v34) {
    goto LABEL_41;
  }
LABEL_42:
  if (v18) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v18, @"RetryAfter");
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v47[5],  NSLocalizedDescriptionKey);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  v53[3],  v30));
  v36 = sub_10000D52C(v35);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v36);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
LABEL_45:

  return v5;
}

  return v8;
}

void sub_10000B358( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000B38C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B39C(uint64_t a1)
{
}

uint64_t sub_10000B3A4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:NSSQLiteErrorDomain]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
  if (![v4 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_8;
  }

  id v5 = [v1 code];

  if (v5 != (id)257)
  {
LABEL_8:
    uint64_t v6 = 0LL;
    goto LABEL_9;
  }

uint64_t sub_10000B470(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
  unsigned int v3 = [v2 isEqualToString:NSSQLiteErrorDomain];

  if (v3)
  {
    id v4 = [v1 code];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
    if (!v5) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:NSSQLiteErrorDomain]);
    if (!v5)
    {
LABEL_7:
      uint64_t v7 = 0LL;
      goto LABEL_8;
    }
  }

  uint64_t v7 = 1LL;
LABEL_8:

  return v7;
}

uint64_t sub_10000B54C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
  unsigned int v3 = [v2 isEqualToString:NSSQLiteErrorDomain];

  if (v3)
  {
    id v4 = [v1 code];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
    if (!v5) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:NSSQLiteErrorDomain]);
    if (!v5)
    {
LABEL_7:
      uint64_t v7 = 0LL;
      goto LABEL_8;
    }
  }

  uint64_t v7 = 1LL;
LABEL_8:

  return v7;
}

uint64_t sub_10000B628(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
  unsigned int v3 = [v2 isEqualToString:CKErrorDomain];

  if (v3)
  {
    id v4 = (char *)[v1 code];
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);

    unsigned __int8 v7 = [v6 isEqualToString:NSURLErrorDomain];
    if ((v7 & 1) != 0) {
      return 1LL;
    }
  }

  return 0LL;
}

void sub_10000B6D0(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6 = sub_10000AD28(a3);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  id v17 = v7;
  id v9 = [v7 code];
  if (v8 == (id)1040)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v9;
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else if (v8 != v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1234LL;
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) description]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to sync with CloudKit (%@)",  v13));
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
  }
}

BOOL sub_10000B7C4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
  unsigned int v3 = [v2 isEqual:NSCocoaErrorDomain];

  if (v3) {
    BOOL v4 = (((unint64_t)[v1 code] - 4) & 0xFFFFFFFFFFFFFEFFLL) == 0;
  }
  else {
    BOOL v4 = 0LL;
  }

  return v4;
}

CFStringRef sub_10000B838(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_10004CE88[a1];
  }
}

id sub_10000B85C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 storeID]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 processName]);

  unint64_t v7 = (unint64_t)[v5 type];
  if (v7 > 3) {
    id v8 = @"Unknown";
  }
  else {
    id v8 = off_10004CE88[v7];
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"ChangeTokens" isDirectory:1]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v8 isDirectory:1]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v6 isDirectory:1]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v5 testConfiguration]);
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 testServerName]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 testDeviceID]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v12 stringByAppendingFormat:@"-%@-%@", v15, v16]);

    uint64_t v12 = (void *)v17;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLHostAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLHostAllowedCharacterSet"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAddingPercentEncodingWithAllowedCharacters:v18]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v19]);
  id v21 = SYDGetMiscLog();
  __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v8;
    __int16 v26 = 2112;
    __int128 v27 = v6;
    __int16 v28 = 2112;
    uint64_t v29 = v20;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Created change token URL for type=%@ process=%@ url=%@",  buf,  0x20u);
  }

  return v20;
}

id sub_10000BAB0(void *a1)
{
  if (qword_1000579D0 != -1) {
    dispatch_once(&qword_1000579D0, &stru_10004CDB8);
  }
  os_unfair_lock_lock(&stru_1000579D8);
  if (sub_10000BF78())
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 userPersonaUniqueString]);
    if (!v3) {
      +[NSException raise:format:]( NSException,  "raise:format:",  NSInvalidArgumentException,  @"No persona identifier when getting KVS directory for data-separated persona. Current persona: uid=%u gid=%u type=%ld",  [v2 uid],  objc_msgSend(v2, "gid"),  objc_msgSend(v2, "userPersonaType"));
    }
  }

  else
  {
    id v3 = @"Persona Non Grata";
  }

  uint64_t v4 = objc_claimAutoreleasedReturnValue([(id)qword_1000579C8 objectForKeyedSubscript:v3]);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = SYDGetMiscLog();
    unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002CD44();
    }
    id v8 = 0LL;
    goto LABEL_39;
  }

  uint64_t v9 = container_query_create();
  container_query_set_class(v9, 10LL);
  xpc_object_t v10 = xpc_string_create("com.apple.kvs");
  container_query_set_identifiers(v9, v10);

  container_query_set_transient(v9, 0LL);
  container_query_operation_set_flags(v9, 0x900000001LL);
  single_Class result = container_query_get_single_result(v9);
  if (single_result)
  {
    uint64_t v12 = single_result;
    uint64_t path = container_get_path();
    if (path)
    {
      uint64_t v14 = path;
      id v15 = SYDGetMiscLog();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_10002CCE4();
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v14,  1LL,  0LL));
      uint64_t v18 = container_copy_sandbox_token(v12);
      id v19 = SYDGetMiscLog();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
      if (!v18)
      {
        if (v21) {
          sub_10002CBCC();
        }
        goto LABEL_29;
      }

      if (v21) {
        sub_10002CC84();
      }

      if (sandbox_extension_consume(v18) == -1)
      {
        id v22 = SYDGetMiscLog();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10002CBF8(v20);
        }
LABEL_29:
        __int128 v27 = 0LL;
        goto LABEL_30;
      }

LABEL_26:
      __int128 v27 = 0LL;
      goto LABEL_31;
    }
  }

  uint64_t last_error = container_query_get_last_error(v9);
  uint64_t v17 = (void *)last_error;
  if (!last_error) {
    goto LABEL_26;
  }
  unsigned int v24 = (const char *)container_error_copy_unlocalized_description(last_error);
  id v25 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v24,  strlen(v24),  4LL,  1LL);
  id v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"containermanager error %llu: %@",  container_error_get_type(v17),  v25);

  NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
  int v34 = v20;
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  1040LL,  v26));

  uint64_t v17 = 0LL;
LABEL_30:

LABEL_31:
  container_query_free(v9);
  if (v27 || !v17)
  {
    id v28 = SYDGetMiscLog();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      sub_10002CB6C();
    }
  }

  id v30 = v27;

  id v8 = v30;
  if (!v17)
  {
    id v5 = 0LL;
    if (!a1) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:@"com.apple.kvs" isDirectory:1]);

  [(id)qword_1000579C8 setObject:v5 forKeyedSubscript:v3];
  id v31 = SYDGetMiscLog();
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002CB0C();
  }
LABEL_39:

  if (a1) {
LABEL_40:
  }
    *a1 = v8;
LABEL_41:
  os_unfair_lock_unlock(&stru_1000579D8);

  return v5;
}

void sub_10000BF50(id a1)
{
  id v1 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v2 = (void *)qword_1000579C8;
  qword_1000579C8 = (uint64_t)v1;
}

id sub_10000BF78()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
  id v1 = [v0 isDataSeparatedPersona];

  return v1;
}

id sub_10000BFB4(void *a1)
{
  if (sub_10000BF78())
  {
    id v2 = sub_10000BAB0(a1);
    return (id)objc_claimAutoreleasedReturnValue(v2);
  }

  else
  {
    uid_t v4 = getuid();
    id v5 = getpwuid(v4);
    if (!v5
      || (id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5->pw_dir)),
          unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6)),
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"Library" isDirectory:1]),
          v7,
          v6,
          !v8))
    {
      id v9 = SYDGetMiscLog();
      xpc_object_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_10002CE64();
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v19 = 0LL;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( [v11 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&v19]);
      id v12 = v19;

      if (v12)
      {
        id v13 = SYDGetMiscLog();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          sub_10002CE04();
        }
      }

      if (!v8) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSGenericException,  @"Could not find ~/Library directory");
      }
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:@"SyncedPreferences" isDirectory:1]);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 URLByAppendingPathComponent:@"com.apple.kvs" isDirectory:1]);
    if (a1) {
      *a1 = 0LL;
    }
    id v17 = SYDGetMiscLog();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10002CDA4();
    }

    return v16;
  }

id sub_10000C1A0(void *a1)
{
  id v1 = sub_10000BAB0(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@".container-migration-complete"]);

  return v3;
}

uint64_t sub_10000C1E0(void *a1)
{
  id v2 = SYDGetMiscLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002D1B4();
  }

  if (!sub_10000BF78())
  {
    os_unfair_lock_lock(&stru_1000579DC);
    uint64_t v81 = 0LL;
    v82 = &v81;
    uint64_t v83 = 0x3032000000LL;
    v84 = sub_10000B38C;
    v85 = sub_10000B39C;
    id v86 = 0LL;
    id obj = 0LL;
    id v7 = sub_10000C1A0(&obj);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_storeStrong(&v86, obj);
    xpc_object_t v10 = (id *)(v82 + 5);
    id v9 = (void *)v82[5];
    if (v9)
    {
      if (a1) {
        *a1 = v9;
      }
      id v11 = SYDGetMiscLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10002D154();
      }

      os_unfair_lock_unlock(&stru_1000579DC);
LABEL_15:
      uint64_t v6 = 0LL;
LABEL_77:

      _Block_object_dispose(&v81, 8);
      return v6;
    }

    id v79 = 0LL;
    unsigned int v13 = [v8 checkResourceIsReachableAndReturnError:&v79];
    objc_storeStrong(v10, v79);
    if (v13)
    {
      id v14 = SYDGetMiscLog();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10002CF48();
      }
      uint64_t v6 = 1LL;
      goto LABEL_69;
    }

    id v16 = v82;
    id v17 = (void *)v82[5];
    if (v17)
    {
      if (!sub_10000B7C4(v17))
      {
        id v25 = SYDGetMiscLog();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10002D0F4();
        }
        uint64_t v6 = 0LL;
        goto LABEL_69;
      }

      id v16 = v82;
      uint64_t v18 = (void *)v82[5];
    }

    else
    {
      uint64_t v18 = 0LL;
    }

    v16[5] = 0LL;

    id v19 = (id *)(v82 + 5);
    id v78 = (id)v82[5];
    id v20 = sub_10000BFB4(&v78);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    objc_storeStrong(v19, v78);
    id v22 = (id *)(v82 + 5);
    BOOL v21 = (void *)v82[5];
    if (v21)
    {
      if (a1) {
        *a1 = v21;
      }
      id v23 = SYDGetMiscLog();
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10002D094();
      }

      os_unfair_lock_unlock(&stru_1000579DC);
      goto LABEL_15;
    }

    id v77 = 0LL;
    id v26 = sub_10000BAB0(&v77);
    v68 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_storeStrong(v22, v77);
    __int128 v27 = (void *)v82[5];
    if (v27)
    {
      if (a1) {
        *a1 = v27;
      }
      id v28 = SYDGetMiscLog();
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10002D034();
      }

      os_unfair_lock_unlock(&stru_1000579DC);
      goto LABEL_15;
    }

    id v30 = SYDGetMiscLog();
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v68;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Migrating to daemon container %@", buf, 0xCu);
    }

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_10000CADC;
    v76[3] = &unk_10004CDE0;
    v76[4] = &v81;
    v64 = (void *)objc_claimAutoreleasedReturnValue( [v32 enumeratorAtURL:v15 includingPropertiesForKeys:0 options:5 errorHandler:v76]);
    NSFileAttributeKey v94 = NSFileProtectionKey;
    NSFileProtectionType v95 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v95,  &v94,  1LL));
    int v34 = (id *)(v82 + 5);
    id v75 = (id)v82[5];
    unsigned __int8 v35 = [v32 createDirectoryAtURL:v68 withIntermediateDirectories:1 attributes:v33 error:&v75];
    v63 = (void *)v33;
    v67 = v32;
    objc_storeStrong(v34, v75);
    if ((v35 & 1) != 0)
    {
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      id v36 = v64;
      id v37 = [v36 countByEnumeratingWithState:&v71 objects:v93 count:16];
      if (v37)
      {
        uint64_t v66 = *(void *)v72;
        id v65 = v36;
        while (2)
        {
          for (i = 0LL; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v72 != v66) {
              objc_enumerationMutation(v65);
            }
            uint64_t v39 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)i);
            v40 = (void *)objc_claimAutoreleasedReturnValue([v39 lastPathComponent]);
            id v41 = (void *)objc_claimAutoreleasedReturnValue([v68 URLByAppendingPathComponent:v40]);

            id v42 = SYDGetMiscLog();
            id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v88 = v39;
              __int16 v89 = 2112;
              v90 = v41;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "Will migrate item to data vault. oldURL=%@ newURL=%@",  buf,  0x16u);
            }

            v44 = (id *)(v82 + 5);
            id v70 = (id)v82[5];
            unsigned __int8 v45 = [v67 moveItemAtURL:v39 toURL:v41 error:&v70];
            objc_storeStrong(v44, v70);
            if ((v45 & 1) == 0)
            {
              uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([(id)v82[5] domain]);
              if (![v46 isEqual:NSCocoaErrorDomain])
              {

LABEL_64:
                id v53 = SYDGetMiscLog();
                uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v62 = v82[5];
                  *(_DWORD *)buf = 138412802;
                  v88 = v39;
                  __int16 v89 = 2112;
                  v90 = v41;
                  __int16 v91 = 2112;
                  uint64_t v92 = v62;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "Failed to move file to daemon container oldURL=%@ newURL=%@: %@",  buf,  0x20u);
                }

                uint64_t v6 = 0LL;
                uint64_t v52 = v65;
                goto LABEL_67;
              }

              BOOL v47 = [(id)v82[5] code] == (id)516;

              if (!v47) {
                goto LABEL_64;
              }
              id v48 = SYDGetMiscLog();
              v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v88 = v39;
                __int16 v89 = 2112;
                v90 = v41;
                _os_log_fault_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_FAULT,  "File was already migrated to new directory: oldURL=%@ newURL=%@",  buf,  0x16u);
              }

              v50 = (void *)v82[5];
              v82[5] = 0LL;
            }
          }

          id v36 = v65;
          id v37 = [v65 countByEnumeratingWithState:&v71 objects:v93 count:16];
          if (v37) {
            continue;
          }
          break;
        }
      }

      if (v82[5])
      {
        uint64_t v6 = 0LL;
LABEL_68:

LABEL_69:
        if (a1) {
          *a1 = (id) v82[5];
        }
        if (v82[5])
        {
          id v55 = SYDGetMiscLog();
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
            sub_10002CEE8();
          }
        }

        else
        {
          id v57 = SYDGetMiscLog();
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
            sub_10002CEBC();
          }
        }

        os_unfair_lock_unlock(&stru_1000579DC);
        goto LABEL_77;
      }

      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([@"Mischief Managed" dataUsingEncoding:4]);
      v59 = (id *)(v82 + 5);
      id v69 = (id)v82[5];
      uint64_t v6 = (uint64_t)[v52 writeToURL:v8 options:0 error:&v69];
      objc_storeStrong(v59, v69);
      if ((v6 & 1) == 0)
      {
        id v60 = SYDGetMiscLog();
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_10002CF74();
        }
      }
    }

    else
    {
      id v51 = SYDGetMiscLog();
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_ERROR)) {
        sub_10002CFD4();
      }
      uint64_t v6 = 0LL;
    }

void sub_10000CA5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

BOOL sub_10000CADC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = sub_10000B7C4(v6);
  id v8 = SYDGetMiscLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  xpc_object_t v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "File not found enumerating old directory with URL %@: %@",  (uint8_t *)&v14,  0x16u);
    }
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002D1E0();
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v12 = v6;
    xpc_object_t v10 = *(os_log_s **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }

  return v7;
}

id sub_10000CC00(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = sub_10000BAB0(a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v6)
  {
    xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:@"TestServers" isDirectory:1]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 testServerName]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v11 isDirectory:1]);

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 testDeviceID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByAppendingPathComponent:v13]);
  }

  id v14 = sub_10000CD08(v5);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v15]);

  return v16;
}

id sub_10000CD08(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 containerIdentifier]);
  id v3 = [v1 environment];

  uint64_t v4 = CKContainerEnvironmentString(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v2, v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathExtension:@"sqlite"]);
  return v7;
}

id sub_10000CDB0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = sub_10000BFB4(a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = sub_10000CD08(v3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v7]);
  return v8;
}

id sub_10000CE20(unint64_t a1)
{
  if (a1 > 3) {
    id v1 = (id *)&NSFileProtectionCompleteUntilFirstUserAuthentication;
  }
  else {
    id v1 = (id *)*(&off_10004CEA8 + a1);
  }
  return *v1;
}

id sub_10000CE48(id a1, uint64_t a2)
{
  if ((unint64_t)a1 <= 3) {
    a1 = [[CKContainerID alloc] initWithContainerIdentifier:*(&off_10004CEC8 + (void)a1) environment:a2];
  }
  return a1;
}

CKRecordZoneID *sub_10000CE94(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CKRecordZoneID *SYDStoreZoneID(NSString *__strong)"));
    [v4 handleFailureInFunction:v5 file:@"SYDUtilities.m" lineNumber:735 description:@"Must specify a store identifier to get a zone ID"];
  }

  id v2 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  v1,  CKCurrentUserDefaultName);

  return v2;
}

CKRecordID *sub_10000CF48(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CKRecordID *SYDSyncAnchorRecordID(NSString *__strong)"));
    [v6 handleFailureInFunction:v7 file:@"SYDUtilities.m" lineNumber:740 description:@"Must specify a store identifier to get a sync anchor record ID"];
  }

  id v2 = sub_10000CE94(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  @"syncAnchor",  v3);

  return v4;
}

void sub_10000D00C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = SYDGetMiscLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002D420();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
  id v22 = 0LL;
  id v8 = [v7 copyCurrentPersonaContextWithError:&v22];
  id v9 = v22;

  if (v9)
  {
    id v10 = SYDGetMiscLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002D3C0();
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 generateAndRestorePersonaContextWithPersonaUniqueString:v3]);

  id v14 = SYDGetMiscLog();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  __int16 v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002D360();
    }
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    sub_10002D300();
  }

  v4[2](v4);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersona currentPersona](&OBJC_CLASS___UMUserPersona, "currentPersona"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 restorePersonaWithSavedPersonaContext:v8]);

  id v19 = SYDGetMiscLog();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v21 = v20;
  if (v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002D2A0();
    }
  }

  else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    sub_10002D240();
  }
}

BOOL sub_10000D1F8(uint64_t a1)
{
  return a1 != 1;
}

id sub_10000D204()
{
  if (qword_1000579E8 != -1) {
    dispatch_once(&qword_1000579E8, &stru_10004CE00);
  }
  return (id)qword_1000579E0;
}

void sub_10000D244(id a1)
{
  id v1 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = [&off_10004FBA8 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(&off_10004FBA8);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
      }

      id v3 = [&off_10004FBA8 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v3);
  }

  id v7 = -[NSMutableArray copy](v1, "copy");
  id v8 = (void *)qword_1000579E0;
  qword_1000579E0 = (uint64_t)v7;
}

id sub_10000D378()
{
  if (qword_1000579F8 != -1) {
    dispatch_once(&qword_1000579F8, &stru_10004CE20);
  }
  return (id)qword_1000579F0;
}

void sub_10000D3B8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.security.cloudkeychainproxy3",  @"com.apple.sbd3",  @"com.apple.mail.recents",  @"com.apple.messages.recents",  0LL));
  id v2 = (void *)qword_1000579F0;
  qword_1000579F0 = v1;
}

id sub_10000D414()
{
  if (qword_100057A08 != -1) {
    dispatch_once(&qword_100057A08, &stru_10004CE40);
  }
  return (id)qword_100057A00;
}

void sub_10000D454(id a1)
{
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSURL);
  id v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  v2,  v3,  v4,  v5,  v6,  objc_opt_class(&OBJC_CLASS___NSError),  0LL);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  __int128 v9 = (void *)qword_100057A00;
  qword_100057A00 = v8;
}

NSMutableArray *sub_10000D52C(void *a1)
{
  id v1 = a1;
  if (sub_10000D82C(v1))
  {
    objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v1) & 1) != 0)
    {
      id v2 = v1;
      uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      if ([v2 count])
      {
        unint64_t v4 = 0LL;
        do
        {
          uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectAtIndexedSubscript:v4]);
          uint64_t v6 = sub_10000D52C();
          id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

          if (v7) {
            -[NSMutableArray addObject:](v3, "addObject:", v7);
          }

          ++v4;
        }

        while (v4 < (unint64_t)[v2 count]);
      }

      if (-[NSMutableArray count](v3, "count")) {
        uint64_t v8 = v3;
      }
      else {
        uint64_t v8 = 0LL;
      }
LABEL_30:

      goto LABEL_31;
    }

    objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v1) & 1) != 0)
    {
      id v2 = v1;
      uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
            if (sub_10000D82C(v14))
            {
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v14]);
              uint64_t v16 = sub_10000D52C();
              id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

              if (v17) {
                -[NSMutableArray setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, v14);
              }
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }

        while (v11);
      }

      if (-[NSMutableArray count](v3, "count")) {
        uint64_t v8 = v3;
      }
      else {
        uint64_t v8 = 0LL;
      }

      goto LABEL_30;
    }

    objc_opt_class(&OBJC_CLASS___NSError);
    char isKindOfClass = objc_opt_isKindOfClass(v1);
    id v19 = (NSMutableArray *)v1;
    uint64_t v8 = v19;
    if ((isKindOfClass & 1) != 0)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray userInfo](v19, "userInfo"));
      uint64_t v21 = sub_10000D52C();
      id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      id v23 = objc_alloc(&OBJC_CLASS___NSError);
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray domain](v8, "domain"));
      id v25 = -[NSMutableArray code](v8, "code");

      uint64_t v8 = -[NSError initWithDomain:code:userInfo:](v23, "initWithDomain:code:userInfo:", v24, v25, v22);
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

uint64_t sub_10000D82C(void *a1)
{
  id v1 = a1;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  id v2 = sub_10000D414();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000D904;
  v7[3] = &unk_10004CE68;
  id v4 = v1;
  id v8 = v4;
  __int128 v9 = &v10;
  [v3 enumerateObjectsUsingBlock:v7];

  uint64_t v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_10000D8EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000D904(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result = objc_opt_isKindOfClass(*(void *)(a1 + 32));
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

  ;
}

void sub_10000D95C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void sub_10000D96C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_10000D980(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_10000D9D4(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___SYDTCCHelper);
  id v2 = (void *)qword_100057A10;
  qword_100057A10 = (uint64_t)v1;
}

void sub_10000DB98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000DBB0(uint64_t a1)
{
  id v2 = SYDGetTCCLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002D4E8(a1, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cachedDisabledStoreIdentifiers]);
  if (!v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) findDisabledStoreIdentifiers]);
    [*(id *)(a1 + 40) setCachedDisabledStoreIdentifiers:v11];

    id v12 = SYDGetTCCLog();
    char v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cachedDisabledStoreIdentifiers]);
      int v25 = 138412290;
      id v26 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Caching disabled store identifiers: %@",  (uint8_t *)&v25,  0xCu);
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cachedDisabledStoreIdentifiers]);
  unsigned int v16 = [v15 containsObject:*(void *)(a1 + 32)];

  if (v16)
  {
    id v17 = SYDGetTCCLog();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10002D480(a1 + 32, v18, v19, v20, v21, v22, v23, v24);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

void sub_10000E4C4(_Unwind_Exception *a1)
{
}

void sub_10000E4EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = SYDGetTCCLog();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10002D69C();
    }

    [WeakRetained setCachedDisabledStoreIdentifiers:0];
  }
}

void sub_10000ECE4(_Unwind_Exception *a1)
{
}

void sub_10000EDE8(_Unwind_Exception *a1)
{
}

void sub_10000F170( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_10000F194(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000F1A4(uint64_t a1)
{
}

void sub_10000F1AC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coreDataStore]);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v2 keyValueForKey:v3 inStoreWithIdentifier:v4 createIfNecessary:0 error:&obj]);
  objc_storeStrong((id *)(v5 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    id v7 = SYDGetCloudKitLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(const __CFString **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      *(_DWORD *)buf = 138478339;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Error fetching object for key %{private}@ in %@: %@",  buf,  0x20u);
    }
  }

  else
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 value]);
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    id v15 = SYDGetCloudKitLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)) {
        unsigned int v16 = &stru_10004DCD0;
      }
      else {
        unsigned int v16 = @"(null) ";
      }
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412803;
      uint64_t v21 = v16;
      __int16 v22 = 2113;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = v18;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Fetched %@object for key %{private}@ in %@",  buf,  0x20u);
    }
  }
}

void sub_10000F5F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

void sub_10000F618(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002DBB4((void *)a1, v3);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) coreDataStore]);
  uint64_t v5 = a1 + 64;
  id v7 = (uint64_t *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v9 = (void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 keyValueForKey:v6 inStoreWithIdentifier:v8 createIfNecessary:1 error:&obj]);
  objc_storeStrong((id *)(v10 + 40), obj);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
  uint64_t v13 = v12;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    id v14 = SYDGetCloudKitLog();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002DB54();
    }
LABEL_6:

    goto LABEL_7;
  }

  if (!v11)
  {
    id v21 = SYDGetCloudKitLog();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002D8AC();
    }
    goto LABEL_6;
  }

  if (v12 && *(void *)(a1 + 32) && objc_msgSend(v12, "isEqual:"))
  {
    id v16 = SYDGetCloudKitLog();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10002DAE0();
    }
    goto LABEL_6;
  }

  if (!*(void *)(a1 + 32))
  {
    id v22 = SYDGetCloudKitLog();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10002D914(v7, v15, v23);
    }
    goto LABEL_6;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v11 setValue:v17 withModificationDate:v18];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 recordName]);
  if (v19) {
    goto LABEL_16;
  }
  id v24 = [*(id *)(a1 + 56) newRecordNameForKey:*(void *)(a1 + 40)];
  [v11 setRecordName:v24];

  id v25 = SYDGetCloudKitLog();
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    id v57 = (void *)objc_claimAutoreleasedReturnValue([v11 recordName]);
    uint64_t v58 = *v7;
    uint64_t v59 = *v9;
    *(_DWORD *)buf = 138412803;
    uint64_t v66 = v57;
    __int16 v67 = 2113;
    uint64_t v68 = v58;
    __int16 v69 = 2112;
    uint64_t v70 = v59;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Assigned new record name (%@) for (%{private}@) in (%@)",  buf,  0x20u);
  }

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) coreDataStore]);
  uint64_t v28 = *(void *)(a1 + 48);
  uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v61 = *(id *)(v29 + 40);
  id v30 = [v27 numberOfKeyValuesInStoreWithIdentifier:v28 error:&v61];
  objc_storeStrong((id *)(v29 + 40), v61);

  uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  BOOL v20 = v31 == 0;
  if (v31)
  {
    id v32 = SYDGetCloudKitLog();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_10002DAB4();
    }

    uint64_t v34 = *(void *)(*(void *)v5 + 8LL);
    unsigned __int8 v35 = *(os_log_s **)(v34 + 40);
    *(void *)(v34 + 40) = 0LL;
  }

  else
  {
    if (v30)
    {
LABEL_16:
      BOOL v20 = 0;
      goto LABEL_28;
    }

    id v48 = SYDGetCloudKitLog();
    unsigned __int8 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_10002DA4C();
    }
  }

LABEL_28:
  id v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) coreDataStore]);
  uint64_t v37 = *(void *)(a1 + 48);
  uint64_t v38 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v39 = *(unsigned __int8 *)(a1 + 81);
  uint64_t v40 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v60 = *(id *)(v40 + 40);
  unsigned __int8 v41 = [v36 saveKeyValue:v11 inStoreWithIdentifier:v37 excludeFromChangeTracking:v38 enforceQuota:v39 error:&v60];
  objc_storeStrong((id *)(v40 + 40), v60);

  if ((v41 & 1) != 0)
  {
    if (([*(id *)(a1 + 56) shouldSyncStoreWithIdentifier:*(void *)(a1 + 48)] & 1) == 0)
    {
      id v47 = SYDGetCloudKitLog();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10002D9C0();
      }
      goto LABEL_6;
    }

    id v42 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
    if ([*(id *)(a1 + 56) alwaysSaveRecordZones])
    {
      id v43 = SYDGetCloudKitLog();
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        sub_10002D994();
      }
    }

    else if (!v20)
    {
LABEL_45:
      id v55 = *(void **)(a1 + 56);
      v63 = v42;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v63, 1LL));
      [v55 addKeyValueRecordIDsToSave:v56 recordIDsToDelete:0 storeIdentifier:*(void *)(a1 + 48)];

      +[SYDUserNotifications showUserNotificationIfEnabledForStoreIdentifier:format:]( &OBJC_CLASS___SYDUserNotifications,  "showUserNotificationIfEnabledForStoreIdentifier:format:",  *(void *)(a1 + 48),  @"Set %@ = %@",  *(void *)(a1 + 40),  *(void *)(a1 + 32));
      goto LABEL_7;
    }

    v49 = objc_alloc(&OBJC_CLASS___CKRecordZone);
    v50 = (void *)objc_claimAutoreleasedReturnValue([v42 zoneID]);
    id v51 = -[CKRecordZone initWithZoneID:](v49, "initWithZoneID:", v50);

    uint64_t v52 = *(void **)(a1 + 56);
    id v53 = -[CKSyncEnginePendingZoneSave initWithZone:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingZoneSave),  "initWithZone:",  v51);
    v64 = v53;
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
    [v52 addPendingDatabaseChanges:v54 storeIdentifier:*(void *)(a1 + 48)];

    goto LABEL_45;
  }

  id v45 = SYDGetCloudKitLog();
  uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
    sub_10002D9EC();
  }

  +[SYDUserNotifications showUserNotificationIfEnabledForStoreIdentifier:format:]( &OBJC_CLASS___SYDUserNotifications,  "showUserNotificationIfEnabledForStoreIdentifier:format:",  *v9,  @"Failed to set value: %@",  *(void *)(*(void *)(*(void *)v5 + 8LL) + 40LL));
LABEL_7:
}

void sub_10000FD98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000FDBC(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002DD90();
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) coreDataStore]);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 keyValueForKey:v5 inStoreWithIdentifier:v6 createIfNecessary:0 error:&obj]);
  objc_storeStrong((id *)(v7 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    id v9 = SYDGetCloudKitLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002DD30();
    }
  }

  else if (v8)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);

    if (!v11)
    {
      if ([*(id *)(a1 + 48) useUUIDRecordNames]) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to delete a key-value that never had a record name in a store that uses UUID record names");
      }
      id v12 = [*(id *)(a1 + 48) newRecordNameForKey:*(void *)(a1 + 32)];
      [v8 setRecordName:v12];
    }

    unsigned __int8 v13 = [*(id *)(a1 + 48) shouldSyncStoreWithIdentifier:*(void *)(a1 + 40)];
    id v14 = *(void **)(a1 + 48);
    if ((v13 & 1) != 0)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v8 recordID]);
      uint64_t v35 = v15;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
      [v14 addKeyValueRecordIDsToSave:0 recordIDsToDelete:v16 storeIdentifier:*(void *)(a1 + 40)];

      [v8 markForDeletion];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) coreDataStore]);
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v30 = *(id *)(v20 + 40);
      LOBYTE(v15) = [v17 saveKeyValue:v8 inStoreWithIdentifier:v18 excludeFromChangeTracking:v19 enforceQuota:0 error:&v30];
      objc_storeStrong((id *)(v20 + 40), v30);

      if ((v15 & 1) != 0) {
        goto LABEL_7;
      }
      id v21 = SYDGetCloudKitLog();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002DCA4();
      }
    }

    else
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) coreDataStore]);
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v31 = *(id *)(v28 + 40);
      [v24 removeKeyValueForKey:v25 inStoreWithIdentifier:v26 excludeFromChangeTracking:v27 error:&v31];
      objc_storeStrong((id *)(v28 + 40), v31);

      id v29 = SYDGetCloudKitLog();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_10002DD04();
      }
    }
  }

  else
  {
    id v22 = SYDGetCloudKitLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      uint64_t v34 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Trying to remove object for a key that doesn't exist (%{private}@)",  buf,  0xCu);
    }
  }

LABEL_7:
}

void sub_1000103C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1000103F0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL), a2);
  }
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) domain]);
  if (![v5 isEqualToString:CKErrorDomain])
  {

    goto LABEL_10;
  }

  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) code];

  if (v6 != (id)20)
  {
LABEL_10:
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100010588;
    v15[3] = &unk_10004CFF0;
    id v12 = *(void **)(a1 + 40);
    id v16 = *(id *)(a1 + 32);
    __int128 v14 = *(_OWORD *)(a1 + 64);
    id v13 = (id)v14;
    __int128 v17 = v14;
    [v12 savePendingChangesToCloudForStoreIdentifiers:v10 group:v11 completionHandler:v15];

    goto LABEL_11;
  }

  id v7 = SYDGetCloudKitLog();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002DE60();
  }

  uint64_t v9 = *(void *)(a1 + 64);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));
  }
LABEL_11:
  os_activity_scope_leave(&state);
}

void sub_100010570(_Unwind_Exception *a1)
{
}

void sub_100010588(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v10);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v7 = *(void **)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  id v6 = v7;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v3;
  }
  objc_storeStrong(v5, v8);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  }
  os_activity_scope_leave(&v10);
}

void sub_100010600( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100010708( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100010720(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000107D0;
  v8[3] = &unk_10004D040;
  __int128 v7 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v7;
  __int128 v9 = v7;
  [v5 savePendingChangesToCloudForAllStoresWithCompletionHandler:v8];
}

void sub_1000107D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  __int128 v7 = *(void **)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v9 = v3;
  if (v7) {
    id v3 = v6;
  }
  objc_storeStrong(v5, v3);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }
}

uint64_t sub_100010BE0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100010BF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SYDGetCloudKitLog();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002DFF8();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    sub_10002DFCC();
  }

  if (*(void *)(a1 + 40))
  {
    __int128 v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100010CEC;
    block[3] = &unk_10004D0B8;
    uint64_t v8 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v11 = v8;
    id v10 = v3;
    dispatch_async(v7, block);
  }
}

void sub_100010CEC(id *a1)
{
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] callbackQueue]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100010D84;
  v3[3] = &unk_10004D090;
  id v5 = a1[6];
  id v4 = a1[5];
  dispatch_async(v2, v3);
}

uint64_t sub_100010D84(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100010D94(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && [*(id *)(a1 + 32) shouldRetryAfterModifyError:v3])
  {
    id v4 = SYDGetCloudKitLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Will retry after error modifying pending records: %@",  buf,  0xCu);
    }

    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100010EC4;
    v8[3] = &unk_10004D108;
    id v9 = *(id *)(a1 + 56);
    [v6 sendChangesWithOptions:v7 completionHandler:v8];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

uint64_t sub_100010EC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100011204(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100011214(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v9 = SYDGetCloudKitLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002E16C();
    }
    goto LABEL_8;
  }

  id v4 = v3;
  unsigned int v5 = [(id)objc_opt_class(*(void *)(a1 + 32)) shouldIgnoreFetchError:v3];
  id v6 = SYDGetCloudKitLog();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002E198();
    }

    uint64_t v8 = v4;
LABEL_8:
    id v4 = 0LL;
    goto LABEL_11;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10002E1FC();
  }
LABEL_11:

  if (*(void *)(a1 + 40))
  {
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100011364;
    block[3] = &unk_10004D0B8;
    id v11 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v14 = v11;
    id v13 = v4;
    dispatch_async(v10, block);
  }
}

void sub_100011364(id *a1)
{
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] callbackQueue]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000113FC;
  v3[3] = &unk_10004D090;
  id v5 = a1[6];
  id v4 = a1[5];
  dispatch_async(v2, v3);
}

uint64_t sub_1000113FC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_10001152C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100011548(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 40), "shouldIgnoreFetchError:");
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

  return result;
}

void sub_1000116A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1000116C0(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "shouldRetryAfterModifyError:");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void sub_100011824(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = SYDGetCloudKitLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002E25C();
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    }
  }

  else
  {
    uint64_t v25 = a1;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v26 = v5;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
          unsigned __int8 v19 = [v18 isEqualToString:@"metadata_zone"];

          if ((v19 & 1) == 0)
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
            [v10 addObject:v20];
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v13);
    }

    if ([v10 count])
    {
      id v21 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation),  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  0LL,  v10);
      -[CKModifyRecordZonesOperation setMarkZonesAsUserPurged:](v21, "setMarkZonesAsUserPurged:", 1LL);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100011ACC;
      v27[3] = &unk_10004D1D0;
      id v28 = *(id *)(v25 + 40);
      -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:]( v21,  "setModifyRecordZonesCompletionBlock:",  v27);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v25 + 32) engine]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 database]);
      [v23 addOperation:v21];

      id v6 = 0LL;
    }

    else
    {
      id v6 = 0LL;
      uint64_t v24 = *(void *)(v25 + 40);
      if (v24) {
        (*(void (**)(uint64_t, void))(v24 + 16))(v24, 0LL);
      }
    }

    id v5 = v26;
  }
}

void sub_100011ACC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = SYDGetCloudKitLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002E2BC();
    }
  }

  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Finished deleting data from cloud", v14, 2u);
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v9);
  }
}

void sub_100011E48(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002E37C();
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coreDataStore]);
  id v17 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allStoreIdentifiersWithError:&v17]);
  id v6 = v17;

  if (v6)
  {
    id v7 = SYDGetCloudKitLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002E31C();
    }
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v8 = v5;
    id v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend( *(id *)(a1 + 32),  "markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:",  *(void *)(*((void *)&v13 + 1) + 8 * (void)v12),  (void)v13);
          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
      }

      while (v10);
    }
  }
}

id sub_1000129B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resetSyncEngine");
}

id sub_100012A50(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002E598();
  }

  [*(id *)(a1 + 40) setContainer:*(void *)(a1 + 32)];
  return objc_msgSend(*(id *)(a1 + 40), "_queue_resetSyncEngine");
}

id sub_100013238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) didFailToDeleteRecordWithID:a2 error:a3];
}

id sub_1000133CC(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Failed to fetch changes for RecordZoneID %@: %@",  (uint8_t *)&v7,  0x16u);
  }

  id result = [*(id *)(a1 + 48) isIdentityLostError:*(void *)(a1 + 40)];
  if ((_DWORD)result) {
    return [*(id *)(a1 + 48) _markZoneForDeletionOnManateeFailureForRecordZoneID:*(void *)(a1 + 32)];
  }
  return result;
}

void sub_1000135A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1000135C4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "isIdentityLostError:");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

id sub_1000139D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v10 = 0LL;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 recordToSaveForRecordID:v3 error:&v10]);
  unint64_t v6 = (unint64_t)v10;
  if (!(v5 | v6))
  {
    int v7 = *(void **)(a1 + 40);
    uint64_t v8 = -[CKSyncEnginePendingRecordZoneChange initWithRecordID:type:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingRecordZoneChange),  "initWithRecordID:type:",  v3,  0LL);
    [v7 addObject:v8];
  }

  return (id)v5;
}

void sub_100013E50(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordType]);
  if ([v3 isEqual:@"KVSSyncAnchorRecord"])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*v2 recordID]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
    unsigned int v6 = [v5 isEqual:@"syncAnchor"];

    if (v6)
    {
      id v7 = SYDGetCloudKitLog();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10002E970(v2, v8);
      }

      [*(id *)(a1 + 40) saveSyncAnchorSystemFieldsRecord:*(void *)(a1 + 32)];
      return;
    }
  }

  else
  {
  }

  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([*v2 recordType]);
  if ([v9 isEqual:@"KVSRecord"])
  {
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*v2 recordType]);
    unsigned int v11 = [v10 isEqualToString:@"EncryptedKeyValue"];

    if (!v11) {
      return;
    }
  }

  _[*(id *)(a1 + 40) didSaveKeyValueRecord:*(void *)(a1 + 32)];
}

LABEL_7:
  +[SYDKeyValue deleteFilesForAssetsInKeyValueRecord:]( &OBJC_CLASS___SYDKeyValue,  "deleteFilesForAssetsInKeyValueRecord:",  v4);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 key]);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);
  +[SYDUserNotifications showUserNotificationIfEnabledForStoreIdentifier:format:]( &OBJC_CLASS___SYDUserNotifications,  "showUserNotificationIfEnabledForStoreIdentifier:format:",  v10,  @"Uploaded %@ = %@",  v18,  v19);
}

void sub_100014364(id *a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "syd_shortDescription"));
    id v5 = a1[5];
    int v19 = 138412546;
    uint64_t v20 = v4;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Failed to save record %@: %@",  (uint8_t *)&v19,  0x16u);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([a1[4] recordType]);
  if ([v6 isEqualToString:@"KVSRecord"])
  {

LABEL_6:
    [a1[6] failedToSaveKeyValueRecord:a1[4] error:a1[5]];
    return;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1[4] recordType]);
  unsigned int v8 = [v7 isEqualToString:@"EncryptedKeyValue"];

  if (v8) {
    goto LABEL_6;
  }
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([a1[4] recordType]);
  if (([v9 isEqualToString:@"KVSSyncAnchorRecord"] & 1) == 0)
  {
LABEL_16:

    return;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1[4] recordID]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
  unsigned int v12 = [v11 isEqualToString:@"syncAnchor"];

  if (v12 && [a1[5] code] == (id)14)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([a1[5] userInfo]);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey]);

    if (v9)
    {
      [a1[6] saveSyncAnchorSystemFieldsRecord:v9];
      id v14 = a1[6];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([a1[4] recordID]);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneID]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
      [v14 addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:v17];
    }

    else
    {
      id v18 = SYDGetCloudKitLog();
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        sub_10002EBC8();
      }
    }

    goto LABEL_16;
  }

LABEL_71:
        __int16 v89 = SYDGetCloudKitLog();
        v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
        if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
          __int16 v91 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
          uint64_t v92 = (os_log_s *)objc_claimAutoreleasedReturnValue([v91 recordName]);
          *(_DWORD *)buf = 138412290;
          v121 = v92;
          _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_INFO,  "Attempting to save keyValue again after a conflict for recordName:%@",  buf,  0xCu);
        }

        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 recordID]);
        v118 = v20;
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v118,  1LL));
        -[SYDSyncManager addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:]( self,  "addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:",  v22,  0LL,  v11);
LABEL_74:

        break;
      case 22LL:
        uint64_t v35 = SYDGetCloudKitLog();
        id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syd_shortDescription"));
          *(_DWORD *)buf = 138412290;
          v121 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "Batch failure trying to save %@. Retrying eventually",  buf,  0xCu);
        }

        int v19 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
        v113 = v19;
        uint64_t v38 = &v113;
        goto LABEL_34;
      case 26LL:
        uint64_t v39 = SYDGetCloudKitLog();
        uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          unsigned __int8 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syd_shortDescription"));
          *(_DWORD *)buf = 138412290;
          v121 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "Zone not found saving %@. Saving zone and re-saving record",  buf,  0xCu);
        }

        id v42 = objc_alloc(&OBJC_CLASS___CKRecordZone);
        id v43 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 zoneID]);
        id v45 = -[CKRecordZone initWithZoneID:](v42, "initWithZoneID:", v44);

        uint64_t v46 = -[CKSyncEnginePendingZoneSave initWithZone:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingZoneSave),  "initWithZone:",  v45);
        v116 = v46;
        id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v116, 1LL));
        -[SYDSyncManager addPendingDatabaseChanges:storeIdentifier:]( self,  "addPendingDatabaseChanges:storeIdentifier:",  v47,  v11);

        id v48 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
        v106 = 0LL;
        v49 = [v48 clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:v11 error:&v106];
        v50 = v106;

        if (v49)
        {
          -[SYDSyncManager markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:]( self,  "markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:",  v11);
          goto LABEL_79;
        }

        id v77 = SYDGetCloudKitLog();
        id v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          sub_10002F094();
        }
        goto LABEL_78;
      case 28LL:
        id v51 = SYDGetCloudKitLog();
        int v19 = (void *)objc_claimAutoreleasedReturnValue(v51);
        if (!os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_INFO)) {
          goto LABEL_76;
        }
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syd_shortDescription"));
        *(_DWORD *)buf = 138412290;
        v121 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_INFO,  "Failed to save %@ because zone was user-purged",  buf,  0xCu);
        goto LABEL_75;
      default:
        goto LABEL_16;
    }

    goto LABEL_75;
  }

  if (v12 > 4096)
  {
    if (v12 == 4097 || v12 == 4099) {
      goto LABEL_77;
    }
LABEL_16:
    __int128 v31 = SYDGetCloudKitLog();
    int v19 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT)) {
      sub_10002EBF4();
    }
    goto LABEL_76;
  }

  if (v12 != 110)
  {
    if (v12 == 112)
    {
      uint64_t v23 = SYDGetCloudKitLog();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syd_shortDescription"));
        *(_DWORD *)buf = 138412290;
        v121 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Missing Manatee identity saving %@, deleting the zone now",  buf,  0xCu);
      }

      id v26 = objc_alloc(&OBJC_CLASS___CKSyncEnginePendingZoneDelete);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 zoneID]);
      __int128 v29 = -[CKSyncEnginePendingZoneDelete initWithZoneID:](v26, "initWithZoneID:", v28);
      v115 = v29;
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v115, 1LL));
      -[SYDSyncManager addPendingDatabaseChanges:storeIdentifier:]( self,  "addPendingDatabaseChanges:storeIdentifier:",  v30,  v11);

      int v19 = (void *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager coreDataStore](self, "coreDataStore"));
      [v19 clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:v11 error:0];
      goto LABEL_76;
    }

    goto LABEL_16;
  }

  uint64_t v52 = SYDGetCloudKitLog();
  id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syd_shortDescription"));
    *(_DWORD *)buf = 138412290;
    v121 = v54;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_INFO,  "Manatee unavailable trying to save %@. Retrying eventually",  buf,  0xCu);
  }

  int v19 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  v114 = v19;
  uint64_t v38 = &v114;
LABEL_34:
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 1LL));
  -[SYDSyncManager addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:]( self,  "addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:",  v20,  0LL,  v11);
LABEL_75:

LABEL_76:
LABEL_77:
  v112[0] = v11;
  v111[0] = @"storeIdentifier";
  v111[1] = @"containerIdentifier";
  v105 = (CKRecordZone *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager container](self, "container"));
  v50 = (id)objc_claimAutoreleasedReturnValue(-[CKRecordZone containerIdentifier](v105, "containerIdentifier"));
  v112[1] = v50;
  v111[2] = @"containerEnvironment";
  id v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SYDSyncManager container](self, "container"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s containerID](v78, "containerID"));
  NSFileAttributeKey v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v93 environment]));
  v112[2] = v94;
  v111[3] = @"errorCode";
  NSFileProtectionType v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 code]));
  v112[3] = v95;
  v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v112,  v111,  4LL));
  AnalyticsSendEvent(@"com.apple.kvs.failedToSaveKey", v96);

  id v45 = v105;
LABEL_78:

LABEL_79:
  +[SYDKeyValue deleteFilesForAssetsInKeyValueRecord:]( &OBJC_CLASS___SYDKeyValue,  "deleteFilesForAssetsInKeyValueRecord:",  v6);
  +[SYDUserNotifications showUserNotificationIfEnabledForStoreIdentifier:format:]( &OBJC_CLASS___SYDUserNotifications,  "showUserNotificationIfEnabledForStoreIdentifier:format:",  v11,  @"Failed to save record: %@",  v7);
}

void sub_100015434(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordName]);
  unsigned int v4 = [v3 isEqualToString:@"syncAnchor"];

  if (!v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneID]);
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 zoneName]);

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) coreDataStore]);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordName]);
    id v27 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 keyValueForRecordName:v9 inStoreWithIdentifier:v6 error:&v27]);
    id v11 = v27;

    id v12 = SYDGetCloudKitLog();
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 key]);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "syd_shortDescription"));
      *(_DWORD *)buf = 141558787;
      uint64_t v29 = 1752392040LL;
      __int16 v30 = 2113;
      __int128 v31 = v14;
      __int16 v32 = 2112;
      uint64_t v33 = v6;
      __int16 v34 = 2112;
      uint64_t v35 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Deleted keyValue record for key <(%{private, mask.hash}@)> in store <(%@)> %@",  buf,  0x2Au);
    }

    if (v11)
    {
      id v16 = SYDGetCloudKitLog();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10002F230();
      }
      goto LABEL_16;
    }

    if (v10)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 value]);

      id v19 = SYDGetCloudKitLog();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      BOOL v20 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
      if (!v18)
      {
        if (v20) {
          sub_10002F1D8();
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) coreDataStore]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordName]);
        id v26 = 0LL;
        unsigned __int8 v24 = [v22 removeKeyValueForRecordName:v23 inStoreWithIdentifier:v6 error:&v26];
        id v11 = v26;

        if ((v24 & 1) != 0) {
          goto LABEL_17;
        }
        id v25 = SYDGetCloudKitLog();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10002F178();
        }
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }

      if (v20) {
        sub_10002F204();
      }
    }

    else
    {
      id v21 = SYDGetCloudKitLog();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "No key-value in database after deleting record from the cloud",  buf,  2u);
      }
    }

    id v11 = 0LL;
    goto LABEL_16;
  }

  id v5 = SYDGetCloudKitLog();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002F0F4(v2, v6);
  }
LABEL_18:
}

void sub_10001580C(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10002F290(a1, v3);
  }
}

void sub_1000158EC(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordType]);
  if ([v3 isEqual:@"KVSSyncAnchorRecord"])
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([*v2 recordID]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
    unsigned int v6 = [v5 isEqual:@"syncAnchor"];

    if (v6)
    {
      id v7 = SYDGetCloudKitLog();
      unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10002F32C();
      }

      [*(id *)(a1 + 40) saveSyncAnchorSystemFieldsRecord:*(void *)(a1 + 32)];
      return;
    }
  }

  else
  {
  }

  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([*v2 recordType]);
  if ([v9 isEqual:@"KVSRecord"])
  {
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*v2 recordType]);
    unsigned int v11 = [v10 isEqualToString:@"EncryptedKeyValue"];

    if (!v11) {
      return;
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pendingFetchedRecords]);
  [v12 addObject:*(void *)(a1 + 32)];

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pendingFetchedRecords]);
  id v14 = [v13 count];
  id v15 = [*(id *)(a1 + 40) maxPendingFetchedRecords];

  if (v14 >= v15) {
    [*(id *)(a1 + 40) processPendingFetchedRecordsWithReason:@"reached max pending records"];
  }
}

void sub_100015E5C(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v110 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Processing %ld fetched records", buf, 0xCu);
  }

  __int16 v91 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  uint64_t v88 = a1;
  id v5 = *(id *)(a1 + 32);
  id v6 = [v5 countByEnumeratingWithState:&v103 objects:v117 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v104;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v104 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)i);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordID]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);

        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SYDKeyValue keyFromKeyValueRecord:](&OBJC_CLASS___SYDKeyValue, "keyFromKeyValueRecord:", v10));
        id v15 = SYDGetCloudKitLog();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "syd_shortDescription"));
          *(_DWORD *)buf = 138413059;
          uint64_t v110 = (uint64_t)v17;
          __int16 v111 = 2160;
          uint64_t v112 = 1752392040LL;
          __int16 v113 = 2113;
          uint64_t v114 = (uint64_t)v14;
          __int16 v115 = 2112;
          v116 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Record was fetched %@ for key <(%{private, mask.hash}@)> in store <(%@)>",  buf,  0x2Au);
        }

        id v18 = -[SYDKeyID initWithKey:storeIdentifier:]( objc_alloc(&OBJC_CLASS____TtC13syncdefaultsd8SYDKeyID),  "initWithKey:storeIdentifier:",  v14,  v13);
        -[NSMutableSet addObject:](v91, "addObject:", v18);
      }

      id v7 = [v5 countByEnumeratingWithState:&v103 objects:v117 count:16];
    }

    while (v7);
  }

  uint64_t v19 = v88;
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v88 + 40) coreDataStore]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v91, "allObjects"));
  id v102 = 0LL;
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 keyValuesForKeyIDs:v21 createIfNecessary:1 error:&v102]);
  id v23 = v102;

  if (!v22 || v23)
  {
    id v54 = SYDGetCloudKitLog();
    id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_10002F5D8();
    }
  }

  else
  {
    id v24 = [v22 count];
    if (v24 != -[NSMutableSet count](v91, "count"))
    {
      id v25 = SYDGetCloudKitLog();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10002F698();
      }
    }

    v87 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    id obj = *(id *)(v88 + 32);
    v82 = v22;
    id v86 = [obj countByEnumeratingWithState:&v98 objects:v108 count:16];
    if (v86)
    {
      uint64_t v85 = *(void *)v99;
      do
      {
        for (j = 0LL; j != v86; j = (char *)j + 1)
        {
          if (*(void *)v99 != v85) {
            objc_enumerationMutation(obj);
          }
          id v28 = *(void **)(*((void *)&v98 + 1) + 8LL * (void)j);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 recordID]);
          __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneID]);
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 zoneName]);

          __int16 v89 = (void *)objc_claimAutoreleasedReturnValue( +[SYDKeyValue keyFromKeyValueRecord:]( &OBJC_CLASS___SYDKeyValue,  "keyFromKeyValueRecord:",  v28));
          __int16 v32 = -[SYDKeyID initWithKey:storeIdentifier:]( objc_alloc(&OBJC_CLASS____TtC13syncdefaultsd8SYDKeyID),  "initWithKey:storeIdentifier:",  v89,  v31);
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v32]);
          if (!v33)
          {
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
            [v46 handleFailureInMethod:*(void *)(v19 + 56) object:*(void *)(v19 + 40) file:@"SYDSyncManager.m" lineNumber:1580 description:@"Trying to process a record without a SYDKeyValue"];
          }

          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 recordName]);

          if (!v34)
          {
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v28 recordID]);
            id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 recordName]);
            [v33 setRecordName:v36];
          }

          [*(id *)(v19 + 40) deduplicateRecordForKeyValue:v33 withNewlyFetchedRecord:v28];
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v33 value]);
          [v33 mergeDataFromRecord:v28];
          uint64_t v38 = objc_claimAutoreleasedReturnValue([v33 value]);
          uint64_t v39 = (void *)v38;
          if (v37 == (void *)v38 || (v37 != 0) != (v38 == 0) && [v37 isEqual:v38])
          {
            id v40 = SYDGetCloudKitLog();
            unsigned __int8 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyID key](v32, "key"));
              uint64_t v42 = objc_claimAutoreleasedReturnValue(-[SYDKeyID storeIdentifier](v32, "storeIdentifier"));
              *(_DWORD *)buf = 141558531;
              uint64_t v110 = 1752392040LL;
              __int16 v111 = 2113;
              uint64_t v112 = (uint64_t)v81;
              __int16 v113 = 2112;
              uint64_t v114 = v42;
              id v43 = (void *)v42;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEBUG,  "Value didn't change for key <(%{private, mask.hash}@)> in store <(%@)>",  buf,  0x20u);

              uint64_t v19 = v88;
            }
          }

          else
          {
            unsigned __int8 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v87, "objectForKeyedSubscript:", v31));
            if (!v41)
            {
              unsigned __int8 v41 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v87, "setObject:forKeyedSubscript:", v41, v31);
            }

            v44 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyID key](v32, "key"));
            -[os_log_s addObject:](v41, "addObject:", v44);

            id v45 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyID key](v32, "key"));
            +[SYDUserNotifications showUserNotificationIfEnabledForStoreIdentifier:format:]( &OBJC_CLASS___SYDUserNotifications,  "showUserNotificationIfEnabledForStoreIdentifier:format:",  v31,  @"Downloaded %@ = %@",  v45,  v39);

            uint64_t v19 = v88;
            id v22 = v82;
          }

          +[SYDKeyValue deleteFilesForAssetsInKeyValueRecord:]( &OBJC_CLASS___SYDKeyValue,  "deleteFilesForAssetsInKeyValueRecord:",  v28);
        }

        id v86 = [obj countByEnumeratingWithState:&v98 objects:v108 count:16];
      }

      while (v86);
    }

    if ([v22 count])
    {
      id v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v19 + 40) coreDataStore]);
      id v48 = (void *)objc_claimAutoreleasedReturnValue([v22 allValues]);
      id v97 = 0LL;
      unsigned __int8 v49 = [v47 saveKeyValues:v48 excludeFromChangeTracking:0 enforceQuota:0 error:&v97];
      id v50 = v97;

      id v51 = (os_log_s *)v87;
      id obja = v50;
      if ((v49 & 1) == 0)
      {
        id v52 = SYDGetCloudKitLog();
        id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_10002F638();
        }
      }
    }

    else
    {
      id obja = 0LL;
      id v51 = (os_log_s *)v87;
    }

    __int128 v95 = 0u;
    __int128 v96 = 0u;
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    id v90 = *(id *)(v19 + 48);
    id v55 = [v90 countByEnumeratingWithState:&v93 objects:v107 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v94;
      do
      {
        for (k = 0LL; k != v56; k = (char *)k + 1)
        {
          if (*(void *)v94 != v57) {
            objc_enumerationMutation(v90);
          }
          uint64_t v59 = *(void **)(*((void *)&v93 + 1) + 8LL * (void)k);
          id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 zoneID]);
          id v61 = (void *)objc_claimAutoreleasedReturnValue([v60 zoneName]);

          uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v59 recordName]);
          unsigned int v63 = [v62 hasPrefix:@"KeyValue:"];

          if (v63)
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v19 + 40) coreDataStore]);
            id v65 = (void *)objc_claimAutoreleasedReturnValue([v59 recordName]);
            uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v59 zoneID]);
            __int16 v67 = (void *)objc_claimAutoreleasedReturnValue([v66 zoneName]);
            uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v64 keyValueForRecordName:v65 inStoreWithIdentifier:v67 error:0]);

            id v51 = (os_log_s *)v87;
            uint64_t v69 = objc_claimAutoreleasedReturnValue([v68 key]);
          }

          else
          {
            uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v59 recordName]);
            uint64_t v69 = objc_claimAutoreleasedReturnValue( +[SYDKeyValue keyFromUnencryptedKeyValueRecordName:]( &OBJC_CLASS___SYDKeyValue,  "keyFromUnencryptedKeyValueRecordName:",  v68));
          }

          uint64_t v70 = (void *)v69;

          id v71 = SYDGetCloudKitLog();
          __int128 v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            __int128 v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "syd_shortDescription"));
            *(_DWORD *)buf = 141558787;
            uint64_t v110 = 1752392040LL;
            __int16 v111 = 2113;
            uint64_t v112 = (uint64_t)v70;
            __int16 v113 = 2112;
            uint64_t v114 = (uint64_t)v61;
            __int16 v115 = 2112;
            v116 = v73;
            _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_INFO,  "Record was deleted for key <(%{private, mask.hash}@)> in store <(%@)> %@",  buf,  0x2Au);
          }

          uint64_t v19 = v88;
          __int128 v74 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v88 + 40) coreDataStore]);
          id v75 = (void *)objc_claimAutoreleasedReturnValue([v59 recordName]);
          [v74 removeKeyValueForRecordName:v75 inStoreWithIdentifier:v61 error:0];

          if (v70)
          {
            v76 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v51, "objectForKeyedSubscript:", v61));
            id v77 = v76;
            if (v76) {
              id v78 = v76;
            }
            else {
              id v78 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
            }
            v80 = v78;

            -[NSMutableSet addObject:](v80, "addObject:", v70);
            -[os_log_s setObject:forKeyedSubscript:](v51, "setObject:forKeyedSubscript:", v80, v61);
          }

          else
          {
            id v79 = SYDGetCloudKitLog();
            v80 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v79);
            if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v110 = (uint64_t)v59;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v80,  OS_LOG_TYPE_ERROR,  "Unable to find key to post notification for %@",  buf,  0xCu);
            }
          }
        }

        id v56 = [v90 countByEnumeratingWithState:&v93 objects:v107 count:16];
      }

      while (v56);
    }

    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472LL;
    v92[2] = sub_100016960;
    v92[3] = &unk_10004D270;
    v92[4] = *(void *)(v19 + 40);
    -[os_log_s enumerateKeysAndObjectsUsingBlock:](v51, "enumerateKeysAndObjectsUsingBlock:", v92);
    id v22 = v82;
    id v23 = obja;
  }
}

void sub_100016960(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_msgSend( [SYDStoreID alloc],  "initWithIdentifier:type:",  v6,  objc_msgSend(*(id *)(a1 + 32), "storeType"));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) storeIdentifiersWithChangedValuesDuringFetchChanges]);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  [v8 addObject:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personaUniqueString]);
  [v7 setPersonaUniqueString:v10];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) testConfiguration]);
  [v7 setTestConfiguration:v11];

  v15[0] = @"changedKeys";
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  v15[1] = @"storeID";
  v16[0] = v12;
  v16[1] = v7;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v14 postNotificationName:@"SYDSyncManagerNotificationValuesDidChange" object:*(void *)(a1 + 32) userInfo:v13];
}

LABEL_39:
}

void sub_1000171B0(id *a1)
{
  if (([a1[4] isEqual:@"KVSRecord"] & 1) != 0
    || [a1[4] isEqualToString:@"EncryptedKeyValue"])
  {
    id v2 = SYDGetCloudKitLog();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10002F9B0();
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[6] pendingDeletedRecordIDs]);
    [v4 addObject:a1[5]];
LABEL_6:

    return;
  }

  if ([a1[4] isEqual:@"KVSSyncAnchorRecord"])
  {
    id v5 = SYDGetCloudKitLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002FA18();
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[6] coreDataStore]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1[5] zoneID]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
    [v4 saveServerSyncAnchorSystemFieldsRecordData:0 forStoreWithIdentifier:v8 error:0];

    goto LABEL_6;
  }

void sub_100017368(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v9 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v2,  1LL,  &v9));
  id v4 = v9;
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coreDataStore]);
    [v8 saveSyncEngineStateSerialization:v3 error:0];
  }

  else
  {
    id v7 = SYDGetCloudKitLog();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_10002FA80();
    }
  }
}

void sub_1000174C8(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002FAE0();
  }

  id v4 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", *(void *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) engine]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 state]);
  id v7 = -[CKSyncEnginePendingZoneSave initWithZone:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingZoneSave),  "initWithZone:",  v4);
  unsigned int v11 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v6 addPendingDatabaseChanges:v8];

  id v9 = *(void **)(a1 + 40);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneName]);
  [v9 markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:v10];
}

void sub_100017698(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Zone was purged: %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoneName]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) coreDataStore]);
  [v6 deleteDataForStoreWithIdentifier:v5 error:0];
}

LABEL_34:
  return v7;
}

void sub_100017B88(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002FC0C();
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) storeIdentifiersWithChangedValuesDuringFetchChanges]);
  [v4 removeAllObjects];
}

void sub_100017C54(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002FD6C();
  }

  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = (id *)(a1 + 32);
  [v5 processPendingFetchedRecordsWithReason:@"finished fetching changes"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([*v4 storeIdentifiersWithChangedValuesDuringFetchChanges]);
  id v7 = [v6 count];

  if (v7)
  {
    if (![*v4 storeType])
    {
      id v8 = SYDGetCloudKitLog();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10002FCF8(v9, v10, v11);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"SYDRemotePreferencesSourceDidChangeExternally",  0LL,  0LL,  0);
    }

    id v13 = SYDGetCloudKitLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10002FC70(v4, v14);
    }

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*v4 storeIdentifiersWithChangedValuesDuringFetchChanges]);
    id v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        uint64_t v19 = 0LL;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          BOOL v20 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s%@",  "com.apple.kvs.store-did-change.",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)v19)));
          id v21 = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(v21, v20, 0LL, 0LL, 0);

          uint64_t v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v17);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue([*v4 storeIdentifiersWithChangedValuesDuringFetchChanges]);
    [v22 removeAllObjects];
  }

void sub_100018154(uint64_t a1)
{
  id v2 = SYDGetCloudKitLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002FDD0();
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coreDataStore]);
  [v4 destroyPersistentStore];
}

void sub_1000182F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100018314(uint64_t a1)
{
  id v2 = _os_activity_create( (void *)&_mh_execute_header,  "kvs/lock-status-notification",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v2, &state);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (MKBDeviceUnlockedSinceBoot())
    {
      id v12 = 0LL;
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained engineWithError:&v12]);
      id v5 = (os_log_s *)v12;

      if (v4)
      {
        id v6 = SYDGetCloudKitLog();
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v11 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Successfully initialized engine after first unlock notification",  v11,  2u);
        }
      }

      else
      {
        id v10 = SYDGetCloudKitLog();
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10002FE98();
        }
      }

      if ([WeakRetained mobileKeybagNotifyToken] != -1)
      {
        notify_cancel((int)[WeakRetained mobileKeybagNotifyToken]);
        [WeakRetained setMobileKeybagNotifyToken:0xFFFFFFFFLL];
      }
    }

    else
    {
      id v9 = SYDGetCloudKitLog();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_10002FE6C();
      }
    }
  }

  else
  {
    id v8 = SYDGetCloudKitLog();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10002FE34();
    }
  }

  os_activity_scope_leave(&state);
}

void sub_1000184A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_10001866C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100018678(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_1000186B0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

void sub_1000186DC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000186E8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000186F8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_100018740(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10001874C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

LABEL_17:
  if (a4) {
    *a4 = v11;
  }
  id v21 = SYDGetAccountsLog();
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  __int128 v23 = v22;
  if (v15)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10002FF58((uint64_t)v6, v15, v23);
    }
  }

  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    sub_10002FEF8();
  }

  __int128 v24 = v15;
  return v24;
}

void sub_1000194A0(_Unwind_Exception *a1)
{
}

void sub_1000194D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = SYDGetConnectionLog();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained xpcConnection]);
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Connection interrupted %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_10001959C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = SYDGetConnectionLog();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained xpcConnection]);
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Connection invalidated %@", (uint8_t *)&v6, 0xCu);
    }

    int v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
    [v5 connectionDidInvalidate:WeakRetained];
  }
}

void sub_10001976C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100019784(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entitledStoreIDs]);
  uint64_t v4 = (id *)(a1 + 40);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) storeID]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 containsObject:v5];

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    int v6 = (void *)objc_opt_class(*(void *)(a1 + 32));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) xpcConnection]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 isXPCConnection:v7 entitledForStoreConfiguration:*(void *)(a1 + 40)];

    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      id v8 = SYDGetConnectionLog();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000303B4();
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue([*v2 entitledStoreIDs]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*v4 storeID]);
      [v10 addObject:v11];
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([*v2 notEntitledStoreIDs]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([*v4 storeID]);
      unsigned __int8 v14 = [v12 containsObject:v13];

      if ((v14 & 1) != 0) {
        return;
      }
      id v15 = (void *)objc_claimAutoreleasedReturnValue([*v2 notEntitledStoreIDs]);

      if (!v15)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 1LL));
        [*v2 setNotEntitledStoreIDs:v16];
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([*v2 notEntitledStoreIDs]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*v4 storeID]);
      [v17 addObject:v18];

      id v19 = SYDGetConnectionLog();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        sub_1000302F4(v4, (os_log_s *)v10);
      }
    }
  }

void sub_10001A980(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] decrementManualSyncCount];
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] callbackQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001AA48;
  block[3] = &unk_10004D310;
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, block);
}

void sub_10001AA48(uint64_t a1)
{
  id v2 = sub_10000AD28(*(void **)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = SYDGetConnectionLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000309B4();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

LABEL_24:
}

void sub_10001AEE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callbackQueue]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001AF90;
  v6[3] = &unk_10004D360;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void sub_10001AF90(uint64_t a1)
{
  id v2 = sub_10000AD28(*(void **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_10:
}

void sub_10001B300(id a1)
{
  id v1 = SYDGetConnectionLog();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_100030BCC();
  }
}

void sub_10001B5F4(uint64_t a1)
{
  id v2 = SYDGetConnectionLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100030CB8();
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) registeredStoreIDs]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) storeID]);
  unsigned __int8 v6 = [v4 containsObject:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = SYDGetConnectionLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100030C58();
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) registeredStoreIDs]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) storeID]);
    [v9 addObject:v10];
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B748;
  block[3] = &unk_10004CA38;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(v12, block);
}

void sub_10001B748(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SYDTCCHelper sharedHelper](&OBJC_CLASS___SYDTCCHelper, "sharedHelper"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) xpcConnection]);
  id v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  [v2 enableUbiquityIfNecessaryForAuditToken:v5];
}

LABEL_46:
      __int128 v26 = v13;
LABEL_47:
      uint64_t v37 = sub_10000AD28(v26);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v10[2](v10, v38);

      goto LABEL_48;
    }

    if (v16) {
      sub_10003115C();
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 storeID]);
    uint64_t v18 = sub_10000CE20((unint64_t)[v17 type]);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);

    if ((-[os_log_s isEqualToString:](v19, "isEqualToString:", NSFileProtectionNone) & 1) != 0)
    {
      BOOL v20 = 268435457LL;
    }

    else if ((-[os_log_s isEqualToString:]( v19,  "isEqualToString:",  NSFileProtectionCompleteUntilFirstUserAuthentication) & 1) != 0)
    {
      BOOL v20 = 1073741825LL;
    }

    else if ((-[os_log_s isEqualToString:](v19, "isEqualToString:", NSFileProtectionCompleteUnlessOpen) & 1) != 0)
    {
      BOOL v20 = 805306369LL;
    }

    else if (-[os_log_s isEqualToString:](v19, "isEqualToString:", NSFileProtectionComplete))
    {
      BOOL v20 = 536870913LL;
    }

    else
    {
      BOOL v20 = 1LL;
    }

    uint64_t v46 = v13;
    id v28 = [v8 writeToURL:v12 options:v20 error:&v46];
    uint64_t v29 = v46;

    if ((v28 & 1) != 0)
    {
      id v13 = v29;
      goto LABEL_46;
    }

    if (sub_10000B7C4(v29))
    {
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByDeletingLastPathComponent]);
      id v45 = v29;
      __int16 v32 = [v30 createDirectoryAtURL:v31 withIntermediateDirectories:1 attributes:0 error:&v45];
      uint64_t v39 = v45;

      if ((v32 & 1) != 0)
      {

        uint64_t v42 = 0LL;
        [v8 writeToURL:v12 options:v20 error:&v42];
        id v13 = (os_log_s *)v42;
        if (!v13) {
          goto LABEL_46;
        }
      }

      else
      {
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_10001C3DC;
        v43[3] = &unk_10004CA38;
        id v13 = v39;
        v44 = v13;
        if (qword_100057A28 != -1) {
          dispatch_once(&qword_100057A28, v43);
        }

        if (!v13) {
          goto LABEL_46;
        }
      }
    }

    else
    {
      id v13 = v29;
      if (!v29) {
        goto LABEL_46;
      }
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s domain](v13, "domain", v39));
    if ([v33 isEqual:NSCocoaErrorDomain])
    {
      __int16 v34 = -[os_log_s code](v13, "code");

      if (v34 == (id)640)
      {
        uint64_t v35 = SYDGetConnectionLog();
        id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_1000310FC();
        }
LABEL_45:

        goto LABEL_46;
      }
    }

    else
    {
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C424;
    block[3] = &unk_10004CA38;
    unsigned __int8 v41 = v13;
    if (qword_100057A30 != -1) {
      dispatch_once(&qword_100057A30, block);
    }
    id v36 = v41;
    goto LABEL_45;
  }

  id v21 = [(id)objc_opt_class(self) errorNotEntitledForStoreConfiguration:v9];
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v10[2](v10, v22);

LABEL_48:
}

      uint64_t v29 = (char *)v29 + 1;
    }

    while (v86 != v29);
    __int128 v74 = [v83 countByEnumeratingWithState:&v92 objects:v104 count:16];
    id v86 = v74;
  }

  while (v74);
LABEL_55:

  id v75 = *(void *)(*(void *)v81 + 8LL);
  id v2 = v80;
  if (*(void *)(v75 + 40)) {
    goto LABEL_56;
  }
  v76 = *(void **)(a1 + 40);
  id v77 = *(void *)(a1 + 48);
  v87 = 0LL;
  [v76 saveContext:v77 reason:@"saving key values" includingTransactionContext:0 error:&v87];
  id v78 = v87;
  id v28 = *(os_log_s **)(v75 + 40);
  *(void *)(v75 + 40) = v78;
LABEL_16:

LABEL_56:
}

void sub_10001C3DC()
{
  id v0 = SYDGetConnectionLog();
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
    sub_1000311BC();
  }
}

void sub_10001C424()
{
  id v0 = SYDGetConnectionLog();
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
    sub_10003121C();
  }
}

void sub_10001C764(uint64_t a1)
{
  id v2 = SYDGetConnectionLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10003127C();
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v4 processAccountChanges];

  if (*(void *)(a1 + 40))
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callbackQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C830;
    block[3] = &unk_10004D3A8;
    id v7 = *(id *)(a1 + 40);
    dispatch_async(v5, block);
  }

uint64_t sub_10001C830(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001C8E0(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*v2 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"storeID"]);

  if (!v5)
  {
    id v24 = SYDGetConnectionLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000312A8();
    }
    goto LABEL_21;
  }

  if (!v3)
  {
    id v25 = SYDGetConnectionLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100031308();
    }
    goto LABEL_21;
  }

  id v7 = *(void **)(a1 + 40);
  unsigned __int8 v6 = (void *)(a1 + 40);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 registeredStoreIDs]);
  unsigned int v9 = [v8 containsObject:v5];

  if (v9)
  {
    id v10 = _os_activity_create( (void *)&_mh_execute_header,  "kvs/notify-store-change",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &state);
    id v11 = SYDGetConnectionLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000313C8();
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([*v2 userInfo]);
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"changedKeys"]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([*v2 object]);
    objc_opt_class(&OBJC_CLASS___SYDSyncManager);
    char isKindOfClass = objc_opt_isKindOfClass(v15);

    if ((isKindOfClass & 1) != 0)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*v2 object]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 coreDataStore]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      id v43 = 0LL;
      BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 currentChangeTokenForStoreIdentifier:v19 error:&v43]);
      id v21 = v43;

      if (v21)
      {
        id v22 = SYDGetConnectionLog();
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100031368();
        }
      }

      else
      {
        id v31 = [(id)objc_opt_class(*v6) changeDictionaryWithChangedKeys:v14 reason:0 changeToken:v20];
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        id v33 = SYDGetConnectionLog();
        __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          uint64_t v39 = v32;
          unsigned int v38 = [v14 count];
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
          id v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", @", "));
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)uint64_t v46 = v38;
          *(_WORD *)&v46[4] = 2112;
          *(void *)&v46[6] = v35;
          __int16 v47 = 2112;
          id v48 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "Sending notification about %d changed keys for store <(%@)>:(%@)",  buf,  0x1Cu);

          __int16 v32 = v39;
        }

        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v5 personaUniqueString]);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_10001CD70;
        v40[3] = &unk_10004CB78;
        v40[4] = *v6;
        id v41 = v5;
        __int128 v23 = v32;
        uint64_t v42 = v23;
        sub_10000D00C(v37, v40);
      }
    }

    else
    {
      id v26 = SYDGetConnectionLog();
      BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue([*v2 object]);
        id v28 = (objc_class *)objc_opt_class(v27);
        uint64_t v29 = NSStringFromClass(v28);
        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v46 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Received a notification about a changed sync manager, but the notification object is a %@",  buf,  0xCu);
      }
    }

    os_activity_scope_leave(&state);
LABEL_21:
  }
}

void sub_10001CD30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_10001CD70(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
  [v2 storeDidChangeWithStoreID:*(void *)(a1 + 40) changeDictionary:*(void *)(a1 + 48)];
}

void sub_10001CEDC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_10001CEF0(uint64_t a1)
{
  id v2 = SYDGetConnectionLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100031438();
  }

  dispatch_group_t v4 = dispatch_group_create();
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  &off_10004FC98,  NSUbiquitousKeyValueStoreChangeReasonKey);
  unsigned __int8 v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  if (v6)
  {
    if (v7)
    {
      id v8 = &off_10004FCE0;
    }

    else
    {
      id v8 = &off_10004FCC8;
    }
  }

  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    id v8 = &off_10004FCB0;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v8,  @"accountChangeTypeKey");
LABEL_11:
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registeredStoreIDs]);
  id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        uint64_t v13 = a1;
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v14 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 personaUniqueString]);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_10001D190;
        v22[3] = &unk_10004D3D0;
        v22[4] = v14;
        id v16 = v4;
        a1 = v13;
        uint64_t v17 = *(void *)(v13 + 32);
        __int128 v23 = v16;
        uint64_t v24 = v17;
        id v25 = v5;
        sub_10000D00C(v15, v22);
      }

      id v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v10);
  }

  if (*(void *)(a1 + 56))
  {
    uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callbackQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001D34C;
    block[3] = &unk_10004D3A8;
    id v21 = *(id *)(a1 + 56);
    dispatch_group_notify(v4, v18, block);
  }
}

void sub_10001D190(uint64_t a1)
{
  if (sub_10000BF78())
  {
    id v2 = SYDGetConnectionLog();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100031498();
    }
  }

  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    dispatch_group_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) delegate]);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    id v17 = 0LL;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 connection:v5 syncManagerForStoreID:v6 error:&v17]);
    id v3 = (os_log_s *)v17;

    if (v7) {
      BOOL v8 = v3 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 coreDataStore]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      id v16 = 0LL;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 currentChangeTokenForStoreIdentifier:v10 error:&v16]);
      id v3 = (os_log_s *)v16;

      if (v3)
      {
        id v12 = SYDGetConnectionLog();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1000314F8();
        }
      }

      else
      {
        if (v11) {
          uint64_t v14 = 2LL;
        }
        else {
          uint64_t v14 = 1LL;
        }
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v14));
        -[os_log_s setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 56),  @"NSUbiquitousKeyValueStoreDidChangeExternallyNotificationUserInfo");
        if (v11) {
          -[os_log_s setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v11, @"ChangeToken");
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) client]);
        [v15 storeDidChangeWithStoreID:*(void *)(a1 + 32) changeDictionary:v13];

        dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      }
    }

    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
}

uint64_t sub_10001D34C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001D730( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_10001D76C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) registeredStoreIDs]);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_10001D7B8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) client]);
  [v2 storeDidChangeWithStoreID:*(void *)(a1 + 40) changeDictionary:*(void *)(a1 + 48)];
}

LABEL_14:
  return v10;
}

void sub_10001DCE0(_Unwind_Exception *a1)
{
}

void sub_10001DDB4(_Unwind_Exception *a1)
{
}

void sub_10001DE1C(_Unwind_Exception *a1)
{
}

void sub_10001DFA8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_10001DFD0@<X0>(void *a1@<X0>, uint64_t x8_0@<X8>)
{
  *(void *)(v3 - 24) = x8_0;
  return [a1 processIdentifier];
}

void sub_10001DFD8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_10001DFE8(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  return result;
}

  ;
}

void sub_10001E014(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void sub_10001E588( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10001EA2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, os_activity_scope_state_s state)
{
}

uint64_t sub_10001EA88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001EA98(uint64_t a1)
{
}

void sub_10001EAA0(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = objc_autoreleasePoolPush();
  id v10 = *(void **)(a1 + 56);
  id v49 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 keyValueStorePlistFromURL:v7 error:&v49]);
  id v12 = v49;
  id v13 = v49;
  if (v13)
  {
    id v14 = v13;
    id v15 = SYDGetMigrationLog();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100032020();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v12);
    goto LABEL_44;
  }

  if (v11)
  {
    id v43 = v9;
    if ([*(id *)(a1 + 56) shouldUseTransactionForPlistAtURL:v7])
    {
      id v17 = *(void **)(a1 + 32);
      id v48 = 0LL;
      id v18 = (id)objc_claimAutoreleasedReturnValue([v17 transactionalStoreWithError:&v48]);
      id v19 = v48;
      BOOL v20 = v19 == 0LL;
      if (v19)
      {
        id v21 = v19;
        id v22 = SYDGetMigrationLog();
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          sub_100031FC0();
        }
      }

      if (v18)
      {
LABEL_19:
        __int128 v26 = *(void **)(a1 + 56);
        id v47 = 0LL;
        __int128 v27 = v18;
        unsigned int v28 = objc_msgSend( v26,  "migratePlist:forStoreWithIdentifier:toCoreDataStore:error:",  v11,  v8,  v18,  &v47,  v43);
        id v29 = v47;
        __int16 v30 = v29;
        if (v20 && v28)
        {
          id v46 = v29;
          unsigned __int8 v31 = [v27 saveTransaction:&v46];
          id v14 = v46;

          if ((v31 & 1) == 0)
          {
            id v39 = SYDGetMigrationLog();
            id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
              sub_100031F60();
            }

            goto LABEL_35;
          }

          __int16 v30 = v14;
        }

        if ((v28 & 1) != 0)
        {
          id v32 = SYDGetMigrationLog();
          id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            sub_100031E9C();
          }

          ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          if (*(_BYTE *)(a1 + 64))
          {
            __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            id v45 = v30;
            unsigned __int8 v35 = [v34 removeItemAtURL:v7 error:&v45];
            id v14 = v45;

            id v36 = SYDGetMigrationLog();
            uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            unsigned int v38 = v37;
            if ((v35 & 1) != 0)
            {
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
                sub_100031DD0();
              }
            }

            else
            {
              if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
                sub_100031E34();
              }

              id v14 = 0LL;
            }
          }

          else
          {
            id v14 = v30;
          }

void sub_10001F048( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001F070(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = SYDGetMigrationLog();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100032380((uint64_t)v7, (uint64_t)a1, v10);
  }

  objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8) & 1) != 0)
  {
    uint64_t v44 = 0LL;
    uint64_t v11 = sub_10000ACD8(v8, &v44);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      if (v44)
      {
        uint64_t v14 = a1[4];
        id v13 = (void *)a1[5];
        uint64_t v15 = *(void *)(a1[6] + 8LL);
        id obj = *(id *)(v15 + 40);
        id v16 = (void *)objc_claimAutoreleasedReturnValue( [v13 keyValueForKey:v7 inStoreWithIdentifier:v14 createIfNecessary:1 error:&obj]);
        objc_storeStrong((id *)(v15 + 40), obj);
        if (*(void *)(*(void *)(a1[6] + 8LL) + 40LL))
        {
          id v17 = SYDGetMigrationLog();
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_100032274();
          }
        }

        else
        {
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v16 valueModificationDate]);

          if (v23)
          {
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 valueModificationDate]);
            [v24 timeIntervalSinceReferenceDate];
            double v26 = v25;
            double v27 = (double)v44;

            id v28 = SYDGetMigrationLog();
            id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
            if (v26 >= v27)
            {
              if (v30) {
                sub_100032208();
              }

              goto LABEL_17;
            }

            if (v30)
            {
              uint64_t v31 = a1[4];
              double v32 = (double)v44;
              id v33 = (void *)objc_claimAutoreleasedReturnValue([v16 valueModificationDate]);
              [v33 timeIntervalSinceReferenceDate];
              *(_DWORD *)buf = 138478595;
              id v46 = v7;
              __int16 v47 = 2112;
              uint64_t v48 = v31;
              __int16 v49 = 2048;
              double v50 = v32;
              __int16 v51 = 2048;
              uint64_t v52 = v34;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Using plist value for (%{private}@) in %@: timestamp %f is later than current timestamp %f",  buf,  0x2Au);
            }
          }

          else
          {
            id v35 = SYDGetMigrationLog();
            id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              sub_10003219C();
            }
          }

          id v36 = (void *)objc_claimAutoreleasedReturnValue( +[SYDKeyValue recordNameForUnencryptedKey:]( &OBJC_CLASS___SYDKeyValue,  "recordNameForUnencryptedKey:",  v7));
          [v16 setRecordName:v36];

          uint64_t v37 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)v44));
          [v16 setValue:v12 withModificationDate:v37];

          uint64_t v39 = a1[4];
          unsigned int v38 = (void *)a1[5];
          uint64_t v40 = *(void *)(a1[6] + 8LL);
          id v42 = *(id *)(v40 + 40);
          LOBYTE(v37) = [v38 saveKeyValue:v16 inStoreWithIdentifier:v39 excludeFromChangeTracking:1 enforceQuota:0 error:&v42];
          objc_storeStrong((id *)(v40 + 40), v42);
          if ((v37 & 1) != 0)
          {
LABEL_17:

            goto LABEL_18;
          }

          id v41 = SYDGetMigrationLog();
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_100032138();
          }
        }

        *a4 = 1;
        goto LABEL_17;
      }

      id v22 = SYDGetMigrationLog();
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      id v21 = "No timestamp in plist storage";
    }

    else
    {
      id v20 = SYDGetMigrationLog();
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      id v21 = "No plist value from plist storage";
    }

    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_INFO, v21, buf, 2u);
    goto LABEL_17;
  }

  id v19 = SYDGetMigrationLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    sub_1000322D8((uint64_t)v8, v12);
  }
LABEL_18:
}

void sub_10001FEAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"StoreIdentifier"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"AdditionalStoreIdentifiers"]);

  [*(id *)(a1 + 48) addPlistURLsForBundleIdentifier:v6 defaultStoreIdentifier:v8 additionalStoreIdentifiers:v7 toDictionary:*(void *)(a1 + 32) syncedPreferencesDirectoryURL:*(void *)(a1 + 40)];
}

id SYDGetMiscLog()
{
  if (qword_100057A40 != -1) {
    dispatch_once(&qword_100057A40, &stru_10004D490);
  }
  return (id)qword_100057A38;
}

void sub_10002048C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.kvs", "Misc");
  id v2 = (void *)qword_100057A38;
  qword_100057A38 = (uint64_t)v1;
}

id SYDGetCloudKitLog()
{
  if (qword_100057A50 != -1) {
    dispatch_once(&qword_100057A50, &stru_10004D4B0);
  }
  return (id)qword_100057A48;
}

void sub_1000204FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.kvs", "CloudKit");
  id v2 = (void *)qword_100057A48;
  qword_100057A48 = (uint64_t)v1;
}

id SYDGetCoreDataLog()
{
  if (qword_100057A60 != -1) {
    dispatch_once(&qword_100057A60, &stru_10004D4D0);
  }
  return (id)qword_100057A58;
}

void sub_10002056C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.kvs", "CoreData");
  id v2 = (void *)qword_100057A58;
  qword_100057A58 = (uint64_t)v1;
}

id SYDGetConnectionLog()
{
  if (qword_100057A70 != -1) {
    dispatch_once(&qword_100057A70, &stru_10004D4F0);
  }
  return (id)qword_100057A68;
}

void sub_1000205DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.kvs", "Connection");
  id v2 = (void *)qword_100057A68;
  qword_100057A68 = (uint64_t)v1;
}

id SYDGetAnalyticsLog()
{
  if (qword_100057A80 != -1) {
    dispatch_once(&qword_100057A80, &stru_10004D510);
  }
  return (id)qword_100057A78;
}

void sub_10002064C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.kvs", "Analytics");
  id v2 = (void *)qword_100057A78;
  qword_100057A78 = (uint64_t)v1;
}

id SYDGetAccountsLog()
{
  if (qword_100057A90 != -1) {
    dispatch_once(&qword_100057A90, &stru_10004D530);
  }
  return (id)qword_100057A88;
}

void sub_1000206BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.kvs", "Accounts");
  id v2 = (void *)qword_100057A88;
  qword_100057A88 = (uint64_t)v1;
}

id SYDGetMigrationLog()
{
  if (qword_100057AA0 != -1) {
    dispatch_once(&qword_100057AA0, &stru_10004D550);
  }
  return (id)qword_100057A98;
}

void sub_10002072C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.kvs", "Migration");
  id v2 = (void *)qword_100057A98;
  qword_100057A98 = (uint64_t)v1;
}

id SYDGetTCCLog()
{
  if (qword_100057AB0 != -1) {
    dispatch_once(&qword_100057AB0, &stru_10004D570);
  }
  return (id)qword_100057AA8;
}

void sub_10002079C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.kvs", "TCC");
  id v2 = (void *)qword_100057AA8;
  qword_100057AA8 = (uint64_t)v1;
}

void sub_10002121C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_100021258(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100021268(uint64_t a1)
{
}

void sub_100021270(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v22 = *(id *)(v10 + 40);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 contextForStoreIdentifier:v7 error:&v22]);
  objc_storeStrong((id *)(v10 + 40), v22);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  void v15[2] = sub_100021380;
  v15[3] = &unk_10004D598;
  void v15[4] = *(void *)(a1 + 32);
  id v16 = v8;
  uint64_t v20 = a4;
  id v17 = v11;
  id v18 = v7;
  char v21 = *(_BYTE *)(a1 + 56);
  __int128 v19 = *(_OWORD *)(a1 + 40);
  id v12 = v7;
  id v13 = v11;
  id v14 = v8;
  [v13 performBlockAndWait:v15];
}

void sub_100021380(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) allObjects]);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id obj = *(id *)(v5 + 40);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 managedKeyValuesForKeyIDs:v3 inContext:v4 error:&obj]);
  objc_storeStrong((id *)(v5 + 40), obj);

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v9 = *(id *)(a1 + 40);
    id v10 = [v9 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (!v10) {
      goto LABEL_26;
    }
    id v12 = v10;
    uint64_t v13 = *(void *)v36;
    *(void *)&__int128 v11 = 141558531LL;
    __int128 v34 = v11;
    while (1)
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v15, v34, (void)v35));
        if (v16)
        {
          id v17 = SYDGetCoreDataLog();
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v15 key]);
            uint64_t v30 = *(void *)(a1 + 56);
            *(_DWORD *)buf = v34;
            uint64_t v41 = 1752392040LL;
            __int16 v42 = 2113;
            id v43 = v29;
            __int16 v44 = 2112;
            uint64_t v45 = v30;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Existing keyValue for key <(%{private, mask.hash}@)> in store <(%@)>",  buf,  0x20u);
          }

          __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) keyValueFromManagedKeyValue:v16 inStoreWithIdentifier:*(void *)(a1 + 56)]);
          if (v19) {
            goto LABEL_19;
          }
        }

        else
        {
          int v20 = *(unsigned __int8 *)(a1 + 88);
          id v21 = SYDGetCoreDataLog();
          __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          BOOL v22 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
          if (!v20)
          {
            if (v22)
            {
              double v27 = (void *)objc_claimAutoreleasedReturnValue([v15 key]);
              uint64_t v28 = *(void *)(a1 + 56);
              *(_DWORD *)buf = v34;
              uint64_t v41 = 1752392040LL;
              __int16 v42 = 2113;
              id v43 = v27;
              __int16 v44 = 2112;
              uint64_t v45 = v28;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "No keyValue for key <(%{private, mask.hash}@)> in store <(%@)>",  buf,  0x20u);
            }

            goto LABEL_20;
          }

          if (v22)
          {
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v15 key]);
            uint64_t v32 = *(void *)(a1 + 56);
            *(_DWORD *)buf = v34;
            uint64_t v41 = 1752392040LL;
            __int16 v42 = 2113;
            id v43 = v31;
            __int16 v44 = 2112;
            uint64_t v45 = v32;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Creating new keyValue for key <(%{private, mask.hash}@)> in store <(%@)>",  buf,  0x20u);
          }

          __int128 v23 = objc_alloc(&OBJC_CLASS___SYDKeyValue);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v15 key]);
          __int128 v19 = -[SYDKeyValue initWithKey:storeIdentifier:]( v23,  "initWithKey:storeIdentifier:",  v24,  *(void *)(a1 + 56));

          -[os_log_s setIsNewKeyValue:](v19, "setIsNewKeyValue:", 1LL);
          if (v19)
          {
LABEL_19:
            double v25 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
            double v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s keyID](v19, "keyID"));
            [v25 setObject:v19 forKeyedSubscript:v26];

LABEL_20:
          }
        }

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v33 = [v9 countByEnumeratingWithState:&v35 objects:v46 count:16];
      id v12 = v33;
      if (!v33)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
  }

  id v7 = SYDGetCoreDataLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100032960();
  }

  **(_BYTE **)(a1 + 80) = 1;
LABEL_27:
}

void sub_100021928( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10002194C(uint64_t a1)
{
  uint64_t v3 = (void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = *(void *)(v3[3] + 8LL);
  id obj = *(id *)(v7 + 40);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 managedKeyValueWithRecordName:v2 inStoreWithIdentifier:v5 inContext:v6 error:&obj]);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (!*(void *)(*(void *)(v3[3] + 8LL) + 40LL))
  {
    id v9 = SYDGetCoreDataLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v11) {
        sub_100032A80();
      }

      uint64_t v12 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) keyValueFromManagedKeyValue:v8 inStoreWithIdentifier:*(void *)(a1 + 48)]);
      uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8LL);
      id v10 = *(os_log_s **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }

    else if (v11)
    {
      sub_100032A20();
    }
  }
}

void sub_10002209C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_1000220CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v24 = *(id *)(v8 + 40);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 contextForStoreIdentifier:v5 error:&v24]);
  objc_storeStrong((id *)(v8 + 40), v24);
  if (*(_BYTE *)(a1 + 48)) {
    id v10 = @"no-change-tracking";
  }
  else {
    id v10 = 0LL;
  }
  [v9 setTransactionAuthor:v10];
  v16[0] = _NSConcreteStackBlock;
  void v16[2] = sub_1000221F4;
  v16[3] = &unk_10004D610;
  char v22 = *(_BYTE *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v17 = v6;
  uint64_t v18 = v11;
  v16[1] = 3221225472LL;
  id v20 = v5;
  uint64_t v21 = v12;
  id v19 = v9;
  __int16 v23 = *(_WORD *)(a1 + 49);
  id v13 = v5;
  id v14 = v9;
  id v15 = v6;
  [v14 performBlockAndWait:v16];
}

void sub_1000221F4(uint64_t a1)
{
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v98 objects:v117 count:16];
  v80 = v2;
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v99;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v99 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v98 + 1) + 8LL * (void)i);
        id v9 = SYDGetCoreDataLog();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 key]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 storeIdentifier]);
          int v15 = *(unsigned __int8 *)(a1 + 72);
          *(_DWORD *)buf = 141559299;
          uint64_t v106 = 1752392040LL;
          __int16 v107 = 2113;
          v108 = v12;
          __int16 v109 = 2160;
          uint64_t v110 = 1752392040LL;
          __int16 v111 = 2113;
          uint64_t v112 = v13;
          __int16 v113 = 2112;
          uint64_t v114 = v14;
          __int16 v115 = 1024;
          int v116 = v15;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Saving value for key <(%{private, mask.hash}@)> = <(%{private, mask.hash}@)> in store <(%@)> excludeFromChangeTracking=%d",  buf,  0x3Au);

          uint64_t v2 = v80;
        }

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 keyID]);
        -[NSMutableArray addObject:](v2, "addObject:", v11);
      }

      id v5 = [v3 countByEnumeratingWithState:&v98 objects:v117 count:16];
    }

    while (v5);
  }

  id v16 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v81 = a1 + 64;
  uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id obj = *(id *)(v18 + 40);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 managedKeyValuesForKeyIDs:v2 inContext:v17 error:&obj]);
  objc_storeStrong((id *)(v18 + 40), obj);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allValues]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);
  char v22 = (void *)objc_claimAutoreleasedReturnValue([v21 store]);

  uint64_t v85 = v19;
  if (v19 && !v22)
  {
    __int16 v23 = *(void **)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v96 = *(id *)(v26 + 40);
    char v22 = (void *)objc_claimAutoreleasedReturnValue( [v23 managedStoreWithIdentifier:v25 createIfNecessary:1 inContext:v24 error:&v96]);
    objc_storeStrong((id *)(v26 + 40), v96);
  }

  if (*(void *)(*(void *)(*(void *)v81 + 8LL) + 40LL))
  {
    id v27 = SYDGetCoreDataLog();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100032BD8();
    }
    goto LABEL_16;
  }

  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  id v83 = *(id *)(a1 + 32);
  id v86 = [v83 countByEnumeratingWithState:&v92 objects:v104 count:16];
  if (!v86) {
    goto LABEL_55;
  }
  uint64_t v84 = *(void *)v93;
  v82 = v22;
  do
  {
    id v29 = 0LL;
    do
    {
      if (*(void *)v93 != v84) {
        objc_enumerationMutation(v83);
      }
      uint64_t v30 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)v29);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 key]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v30 keyID]);
      id v33 = (SYDManagedKeyValue *)objc_claimAutoreleasedReturnValue([v85 objectForKeyedSubscript:v32]);

      if (!v33 || *(_BYTE *)(a1 + 73))
      {
        id v34 = SYDGetCoreDataLog();
        __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v70 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 141558531;
          uint64_t v106 = 1752392040LL;
          __int16 v107 = 2113;
          v108 = v31;
          __int16 v109 = 2112;
          uint64_t v110 = v70;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "Creating new managed key value for key <(%{private, mask.hash}@)> in store <(%@)>",  buf,  0x20u);
        }

        __int128 v36 = -[SYDManagedKeyValue initWithContext:]( objc_alloc(&OBJC_CLASS___SYDManagedKeyValue),  "initWithContext:",  *(void *)(a1 + 48));
        -[SYDManagedKeyValue setKey:](v36, "setKey:", v31);
        -[SYDManagedKeyValue setStore:](v36, "setStore:", v22);
        uint64_t v37 = *(void *)(a1 + 56);
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[SYDManagedKeyValue store](v36, "store"));
        [v38 setIdentifier:v37];

        id v33 = v36;
      }

      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v30 value]);
      -[SYDManagedKeyValue setValue:](v33, "setValue:", v39);

      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v30 serverSystemFieldsRecordData]);
      -[SYDManagedKeyValue setServerSystemFieldsRecordData:](v33, "setServerSystemFieldsRecordData:", v40);

      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v30 valueModificationDate]);
      -[SYDManagedKeyValue setValueModificationDate:](v33, "setValueModificationDate:", v41);

      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v30 recordName]);
      -[SYDManagedKeyValue setRecordName:](v33, "setRecordName:", v42);

      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[SYDManagedKeyValue plistDataValue](v33, "plistDataValue"));
      __int16 v44 = [v43 length];

      uint64_t v45 = -[SYDManagedKeyValue plistDataLength](v33, "plistDataLength");
      -[SYDManagedKeyValue setPlistDataLength:](v33, "setPlistDataLength:", v44);
      if (*(_BYTE *)(a1 + 74))
      {
        id v46 = sub_10000D378();
        __int16 v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        unsigned __int8 v48 = [v47 containsObject:*(void *)(a1 + 56)];

        if ((v48 & 1) == 0)
        {
          __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(-[SYDManagedKeyValue store](v33, "store"));
          double v50 = (void *)objc_claimAutoreleasedReturnValue([v49 keyValues]);
          id v51 = [v50 count];

          if ((unint64_t)v51 >= 0x401)
          {
            id v52 = SYDGetCoreDataLog();
            id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v71 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138412290;
              uint64_t v106 = v71;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEBUG,  "Exceeded maximum number of keys in store <(%@)>",  buf,  0xCu);
            }

            id v54 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Exceeded maximum number of keys (%d) in store (%@).",  1024LL,  *(void *)(a1 + 56),  v79);
            goto LABEL_37;
          }

          if ((unint64_t)v44 > 0x100000)
          {
            id v55 = SYDGetCoreDataLog();
            id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v72 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 141558531;
              uint64_t v106 = 1752392040LL;
              __int16 v107 = 2113;
              v108 = v31;
              __int16 v109 = 2112;
              uint64_t v110 = v72;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEBUG,  "Exceeded maximum bytes for key <(%{private, mask.hash}@)> in store <(%@)>",  buf,  0x20u);
            }

            id v54 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Exceeded maximum size (%d) for key (%@) in store (%@).",  0x100000LL,  v31,  *(void *)(a1 + 56));
LABEL_37:
            uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(v54);
            char v22 = v82;
            if (!v57) {
              goto LABEL_46;
            }
LABEL_38:
            NSErrorUserInfoKey v102 = NSLocalizedDescriptionKey;
            __int128 v103 = v57;
            uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v103,  &v102,  1LL));
            uint64_t v59 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  6666LL,  v58));
            uint64_t v60 = *(void *)(*(void *)v81 + 8LL);
            id v61 = *(void **)(v60 + 40);
            *(void *)(v60 + 40) = v59;

            unsigned int v62 = -[SYDManagedKeyValue isInserted](v33, "isInserted");
            id v63 = SYDGetCoreDataLog();
            v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
            BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);
            if (v62)
            {
              if (v65) {
                sub_100032B80(&v90, v91);
              }

              [*(id *)(a1 + 48) deleteObject:v33];
            }

            else
            {
              if (v65) {
                sub_100032BAC(&v88, v89);
              }

              [*(id *)(a1 + 48) refreshObject:v33 mergeChanges:0];
            }

            char v22 = v82;

            goto LABEL_46;
          }

          char v22 = v82;
          if (v44 - v45 >= 1)
          {
            uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(-[SYDManagedKeyValue store](v33, "store"));
            uint64_t v67 = (uint64_t)[v66 totalDataLength] + v44 - v45;

            char v22 = v82;
            if (v67 > 0x100000)
            {
              id v68 = SYDGetCoreDataLog();
              uint64_t v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v73 = *(void *)(a1 + 56);
                *(_DWORD *)buf = 138412290;
                uint64_t v106 = v73;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEBUG,  "Exceeded maximum total bytes in store <(%@)>",  buf,  0xCu);
              }

              uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Exceeded maximum total bytes (%d) in store (%@).",  0x100000LL,  *(void *)(a1 + 56)));
              if (v57) {
                goto LABEL_38;
              }
            }
          }
        }
      }

void sub_100022D88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100022DA0(void *a1)
{
  uint64_t v2 = -[SYDKeyID initWithKey:storeIdentifier:]( objc_alloc(&OBJC_CLASS____TtC13syncdefaultsd8SYDKeyID),  "initWithKey:storeIdentifier:",  a1[4],  a1[5]);
  id v3 = (void *)a1[6];
  id v19 = v2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[8] + 8LL);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 managedKeyValuesForKeyIDs:v4 inContext:v5 error:&obj]);
  objc_storeStrong((id *)(v6 + 40), obj);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v2]);
  if (*(void *)(*(void *)(a1[8] + 8LL) + 40LL))
  {
    id v9 = SYDGetCoreDataLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100032D5C();
    }
  }

  else
  {
    id v11 = SYDGetCoreDataLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v12) {
        sub_100032CFC();
      }

      [(id)a1[7] deleteObject:v8];
      id v13 = (void *)a1[6];
      uint64_t v14 = a1[7];
      uint64_t v15 = *(void *)(a1[8] + 8LL);
      id v17 = *(id *)(v15 + 40);
      [v13 saveContext:v14 reason:@"removing key value" includingTransactionContext:0 error:&v17];
      id v16 = v17;
      id v10 = *(os_log_s **)(v15 + 40);
      *(void *)(v15 + 40) = v16;
    }

    else if (v12)
    {
      sub_100032C9C();
    }
  }
}

void sub_100023198( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000231B0(uint64_t a1)
{
  id v3 = (void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = *(void *)(v3[3] + 8LL);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 managedKeyValueWithRecordName:v2 inStoreWithIdentifier:v5 inContext:v6 error:&obj]);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (!*(void *)(*(void *)(v3[3] + 8LL) + 40LL))
  {
    id v9 = SYDGetCoreDataLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v11) {
        sub_100032E7C();
      }

      [*(id *)(a1 + 56) deleteObject:v8];
      BOOL v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8LL);
      id v16 = *(id *)(v14 + 40);
      [v12 saveContext:v13 reason:@"removing key value for record name" includingTransactionContext:0 error:&v16];
      id v15 = v16;
      id v10 = *(os_log_s **)(v14 + 40);
      *(void *)(v14 + 40) = v15;
    }

    else if (v11)
    {
      sub_100032E1C();
    }
  }
}

void sub_100023460( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100023484(void *a1)
{
  id v3 = a1 + 7;
  uint64_t v2 = a1[7];
  id v4 = (void *)a1[4];
  uint64_t v5 = *(v3 - 2);
  uint64_t v6 = *(v3 - 1);
  uint64_t v7 = *(void *)(v2 + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 managedStoreWithIdentifier:v5 createIfNecessary:0 inContext:v6 error:&obj]);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(void *)(*(void *)(*v3 + 8LL) + 40LL))
  {
    id v9 = SYDGetCoreDataLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100032F68();
    }
  }

  else if (v8)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 syncAnchorServerSystemFieldsRecordData]);
    uint64_t v12 = *(void *)(a1[8] + 8LL);
    id v10 = *(os_log_s **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

  else
  {
    id v13 = SYDGetCoreDataLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100032F3C();
    }
  }
}

void sub_10002371C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100023734(void *a1)
{
  id v3 = a1 + 8;
  uint64_t v2 = a1[8];
  id v4 = (void *)a1[4];
  uint64_t v5 = *(v3 - 3);
  uint64_t v6 = *(v3 - 2);
  uint64_t v7 = *(void *)(v2 + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 managedStoreWithIdentifier:v5 createIfNecessary:1 inContext:v6 error:&obj]);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(void *)(*(void *)(*v3 + 8LL) + 40LL))
  {
    id v9 = SYDGetCoreDataLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100032F68();
    }
  }

  else if (v8)
  {
    [v8 setSyncAnchorServerSystemFieldsRecordData:a1[7]];
    uint64_t v11 = (void *)a1[4];
    uint64_t v12 = a1[6];
    uint64_t v13 = *(void *)(a1[8] + 8LL);
    id v16 = *(id *)(v13 + 40);
    [v11 saveContext:v12 reason:@"Saving sync anchor" includingTransactionContext:0 error:&v16];
    id v14 = v16;
    id v10 = *(os_log_s **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }

  else
  {
    id v15 = SYDGetCoreDataLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100033088();
    }
  }
}

void sub_100023B28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100023B40(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedStore fetchRequest](&OBJC_CLASS___SYDManagedStore, "fetchRequest"));
  [v2 setPredicate:a1[4]];
  id v3 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v2);
  id v4 = (void *)a1[5];
  uint64_t v5 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 executeRequest:v3 error:&obj]);
  objc_storeStrong((id *)(v5 + 40), obj);

  id v7 = SYDGetCoreDataLog();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100033174();
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    sub_100033114();
  }
}

void sub_100023D9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100023DB4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedKeyValue fetchRequest](&OBJC_CLASS___SYDManagedKeyValue, "fetchRequest"));
  [v2 setResultType:2];
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"store.identifier == %@",  *(void *)(a1 + 32)));
  [v2 setPredicate:v3];

  id v4 = NSStringFromSelector("recordName");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v28 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  [v2 setPropertiesToFetch:v6];

  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v8 + 40);
  id v20 = v2;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 executeFetchRequest:v2 error:&obj]);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    id v10 = SYDGetCoreDataLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_1000331D4();
    }
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v22 + 1) + 8 * (void)i) objectForKeyedSubscript:v5]);
        if (v17)
        {
          [*(id *)(a1 + 48) addObject:v17];
        }

        else
        {
          id v18 = SYDGetCoreDataLog();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Fetched a key value with no record name",  buf,  2u);
          }
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v14);
  }
}

void sub_1000241E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000241FC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedStore fetchRequest](&OBJC_CLASS___SYDManagedStore, "fetchRequest"));
  [v2 setResultType:2];
  id v3 = NSStringFromSelector("identifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v30 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  [v2 setPropertiesToFetch:v5];

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v7 + 40);
  __int128 v22 = v2;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v2 error:&obj]);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    id v9 = SYDGetCoreDataLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000332F4();
    }

    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    id v12 = *(void **)(a1 + 40);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistentStoreCoordinator]);
    [v12 handleCorruptionIfNecessaryFromError:v11 inPersistentStoreCoordinator:v13];
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v14 = v8;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * (void)v18) objectForKeyedSubscript:v4]);
        if ([v19 length])
        {
          [*(id *)(a1 + 48) addObject:v19];
        }

        else
        {
          id v20 = SYDGetCoreDataLog();
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Fetched a store with no store identifier",  buf,  2u);
          }
        }

        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v16);
  }
}

void sub_1000245EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100024604(void *a1)
{
  id v3 = a1 + 5;
  uint64_t v2 = a1[5];
  id v4 = (void *)a1[4];
  uint64_t v5 = v3[1];
  uint64_t v6 = *(void *)(v3[2] + 8LL);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 managedStoreWithIdentifier:v2 createIfNecessary:0 inContext:v5 error:&obj]);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 syncAnchorServerSystemFieldsRecordData]);

    if (v8)
    {
      [v7 setSyncAnchorServerSystemFieldsRecordData:0];
      id v9 = (void *)a1[4];
      uint64_t v10 = a1[6];
      uint64_t v11 = *(void *)(a1[7] + 8LL);
      id v31 = *(id *)(v11 + 40);
      [v9 saveContext:v10 reason:@"Removing sync anchor server record" includingTransactionContext:0 error:&v31];
      objc_storeStrong((id *)(v11 + 40), v31);
    }

    id v12 = objc_alloc(&OBJC_CLASS___NSBatchUpdateRequest);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedKeyValue entity](&OBJC_CLASS___SYDManagedKeyValue, "entity"));
    id v14 = -[NSBatchUpdateRequest initWithEntity:](v12, "initWithEntity:", v13);

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"store == %@",  v7));
    -[NSBatchUpdateRequest setPredicate:](v14, "setPredicate:", v15);

    id v16 = NSStringFromSelector("serverSystemFieldsRecordData");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v33 = v17;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v34 = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    -[NSBatchUpdateRequest setPropertiesToUpdate:](v14, "setPropertiesToUpdate:", v19);

    id v20 = (void *)a1[6];
    uint64_t v21 = *(void *)(a1[7] + 8LL);
    id v30 = *(id *)(v21 + 40);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v20 executeRequest:v14 error:&v30]);
    objc_storeStrong((id *)(v21 + 40), v30);

    id v23 = SYDGetCoreDataLog();
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    __int128 v25 = v24;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_100033474();
      }
    }

    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_100033414();
      }

      __int128 v27 = (void *)a1[4];
      uint64_t v28 = (void *)a1[6];
      uint64_t v29 = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 persistentStoreCoordinator]);
      [v27 handleCorruptionIfNecessaryFromError:v29 inPersistentStoreCoordinator:v25];
    }
  }

  else
  {
    id v26 = SYDGetCoreDataLog();
    id v14 = (NSBatchUpdateRequest *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000333B4();
    }
  }
}

void sub_100024A18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100024A3C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedKeyValue fetchRequest](&OBJC_CLASS___SYDManagedKeyValue, "fetchRequest"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"store.identifier == %@",  *(void *)(a1 + 32)));
  [v2 setPredicate:v3];

  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = a1 + 56;
  uint64_t v6 = *(void **)(v4 - 16);
  uint64_t v7 = *(void *)(v5 + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v6 countForFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(void *)(*(void *)(*(void *)(v4 - 8) + 8LL) + 24LL) = v8;
  if (*(void *)(*(void *)(*(void *)v4 + 8LL) + 40LL))
  {
    id v9 = SYDGetCoreDataLog();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000334D4(v2, v4, v10);
    }
  }
}

void sub_100024CB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100024CDC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistentStores]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  if (!v3)
  {
    id v15 = SYDGetCoreDataLog();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000335C8();
    }

    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    __int128 v24 = @"Unable to load database";
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  4444LL,  v6));
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v14 = *(os_log_s **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
    goto LABEL_11;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentStoreCoordinator]);
  __int128 v22 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 currentPersistentHistoryTokenFromStores:v5]);

  if (!v6)
  {
    id v19 = SYDGetCoreDataLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No current persistent history token", buf, 2u);
    }

    goto LABEL_11;
  }

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v7 = (void *)(a1 + 40);
  uint64_t v9 = *(void *)(v8 + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &obj));
  objc_storeStrong((id *)(v9 + 40), obj);
  uint64_t v11 = *(void *)(v7[1] + 8LL);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*v7 + 8LL) + 40LL))
  {
    id v13 = SYDGetCoreDataLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000335F4();
    }
LABEL_11:
  }
}

void sub_100025154( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_100025188(void *a1)
{
  if (a1[4])
  {
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSPersistentHistoryToken);
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void *)(a1[8] + 8LL);
    id obj = *(id *)(v4 + 40);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v2,  v3,  &obj));
    objc_storeStrong((id *)(v4 + 40), obj);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  if (!*(void *)(*(void *)(a1[8] + 8LL) + 40LL))
  {
    uint64_t v98 = (uint64_t)(a1 + 8);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentHistoryTransaction fetchRequest]( &OBJC_CLASS___NSPersistentHistoryTransaction,  "fetchRequest"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"author == nil"));
    [v8 addObject:v9];

    uint64_t v10 = a1[5];
    __int128 v101 = a1 + 5;
    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"contextName == %@",  v10));
      [v8 addObject:v11];
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));
    [v7 setPredicate:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "fetchHistoryAfterToken:",  v5));
    [v13 setFetchRequest:v7];
    [v13 setResultType:5];
    id v14 = (void *)a1[6];
    uint64_t v15 = *(void *)(a1[8] + 8LL);
    id v139 = *(id *)(v15 + 40);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 executeRequest:v13 error:&v139]);
    objc_storeStrong((id *)(v15 + 40), v139);
    if (*(void *)(*(void *)(a1[8] + 8LL) + 40LL))
    {
      unsigned int v17 = [(id)objc_opt_class(a1[7]) isInvalidTokenError:*(void *)(*(void *)(a1[8] + 8) + 40)];
      id v18 = SYDGetCoreDataLog();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      id v20 = v19;
      if (v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = *v101;
          uint64_t v22 = *(void *)(*(void *)(*(void *)v98 + 8LL) + 40LL);
          *(_DWORD *)buf = 138412546;
          uint64_t v147 = v21;
          __int16 v148 = 2112;
          uint64_t v149 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Persistent history token expired for (%@): %@",  buf,  0x16u);
        }
      }

      else if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        sub_1000339F8();
      }

LABEL_111:
      goto LABEL_112;
    }

    if (!v16) {
      goto LABEL_112;
    }
    NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue([v16 result]);
    objc_opt_class(&OBJC_CLASS___NSArray);
    char isKindOfClass = objc_opt_isKindOfClass(v23);

    if ((isKindOfClass & 1) == 0)
    {
      id v73 = SYDGetCoreDataLog();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_100033974((uint64_t)v16, v20);
      }
      goto LABEL_111;
    }

    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v16 result]);
    id v26 = [v25 count];

    if (!v26)
    {
LABEL_112:

      goto LABEL_113;
    }

    __int128 v99 = a1;
    __int128 v93 = v13;
    __int128 v94 = v8;
    __int128 v95 = v7;
    id v96 = v5;
    __int128 v92 = v16;
    id v97 = (void *)objc_claimAutoreleasedReturnValue([v16 result]);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v97 firstObject]);
    objc_opt_class(&OBJC_CLASS___NSPersistentHistoryTransaction);
    char v28 = objc_opt_isKindOfClass(v27);

    id v29 = SYDGetCoreDataLog();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    id v31 = v30;
    if ((v28 & 1) == 0)
    {
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        goto LABEL_109;
      }
      id v20 = (os_log_s *)v97;
      sub_1000338A8(v97, v31);
LABEL_110:

      uint64_t v7 = v95;
      uint64_t v5 = v96;
      id v13 = v93;
      uint64_t v8 = v94;
      id v16 = v92;
      goto LABEL_111;
    }

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10003382C(v97, (uint64_t)v101, v31);
    }

    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedKeyValue entity](&OBJC_CLASS___SYDManagedKeyValue, "entity"));
    uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedStore entity](&OBJC_CLASS___SYDManagedStore, "entity"));
    id v33 = NSStringFromSelector("plistDataValue");
    id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    __int128 v135 = 0u;
    __int128 v136 = 0u;
    __int128 v137 = 0u;
    __int128 v138 = 0u;
    id v103 = v97;
    __int16 v107 = v32;
    id v105 = [v103 countByEnumeratingWithState:&v135 objects:v145 count:16];
    if (!v105)
    {
      NSErrorUserInfoKey v102 = 0LL;
      goto LABEL_93;
    }

    NSErrorUserInfoKey v102 = 0LL;
    uint64_t v104 = *(void *)v136;
LABEL_21:
    id v35 = 0LL;
LABEL_22:
    if (*(void *)v136 != v104) {
      objc_enumerationMutation(v103);
    }
    uint64_t v106 = (char *)v35;
    __int128 v36 = *(void **)(*((void *)&v135 + 1) + 8LL * (void)v35);
    __int128 v131 = 0u;
    __int128 v132 = 0u;
    __int128 v133 = 0u;
    __int128 v134 = 0u;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 changes]);
    id v114 = [v37 countByEnumeratingWithState:&v131 objects:v144 count:16];
    if (!v114)
    {
      __int16 v111 = 0LL;
      __int128 v38 = 0LL;
      goto LABEL_61;
    }

    __int16 v111 = 0LL;
    __int128 v38 = 0LL;
    uint64_t v39 = *(void *)v132;
    uint64_t v108 = *(void *)v132;
    __int16 v109 = v37;
LABEL_26:
    uint64_t v40 = 0LL;
    while (1)
    {
      if (*(void *)v132 != v39) {
        objc_enumerationMutation(v37);
      }
      uint64_t v41 = *(void **)(*((void *)&v131 + 1) + 8 * v40);
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 changedObjectID]);
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 entity]);

      if (v43 == v32)
      {
        id v47 = [v41 changeType];
        if (!v47)
        {
          __int16 v113 = v43;
          id v46 = (void *)objc_claimAutoreleasedReturnValue([v41 changedObjectID]);
          __int16 v49 = v31;
          goto LABEL_55;
        }

        if (v47 == (id)1)
        {
          __int16 v113 = v43;
          __int128 v129 = 0u;
          __int128 v130 = 0u;
          __int128 v127 = 0u;
          __int128 v128 = 0u;
          id v46 = (void *)objc_claimAutoreleasedReturnValue([v41 updatedProperties]);
          id v50 = [v46 countByEnumeratingWithState:&v127 objects:v143 count:16];
          if (v50)
          {
            id v51 = v50;
            uint64_t v110 = v38;
            uint64_t v52 = *(void *)v128;
            do
            {
              for (i = 0LL; i != v51; i = (char *)i + 1)
              {
                if (*(void *)v128 != v52) {
                  objc_enumerationMutation(v46);
                }
                unsigned int v55 = [v54 isEqualToString:v34];

                if (v55)
                {
                  id v56 = (void *)objc_claimAutoreleasedReturnValue([v41 changedObjectID]);
                  -[os_log_s addObject:](v31, "addObject:", v56);
                }
              }

              id v51 = [v46 countByEnumeratingWithState:&v127 objects:v143 count:16];
            }

            while (v51);
            uint64_t v32 = v107;
            __int128 v38 = v110;
          }

          uint64_t v39 = v108;
          uint64_t v37 = v109;
          goto LABEL_56;
        }

        if (v47 == (id)2)
        {
          __int16 v113 = v43;
          unsigned __int8 v48 = (void *)objc_claimAutoreleasedReturnValue([v41 tombstone]);
          id v46 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:@"key"]);

          if (v46)
          {
            __int16 v49 = v111;
            if (!v111) {
              __int16 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
            }
            __int16 v111 = v49;
LABEL_55:
            -[os_log_s addObject:](v49, "addObject:", v46);
          }

LABEL_56:
          id v43 = v113;
        }
      }

      else if (v43 == v112)
      {
        __int16 v113 = v43;
        if (v38)
        {
          id v44 = SYDGetCoreDataLog();
          uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
            sub_1000337F8(&v125, v126);
          }
        }

        id v46 = v38;
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v41 changedObjectID]);
        goto LABEL_56;
      }

      if ((id)++v40 == v114)
      {
        id v114 = [v37 countByEnumeratingWithState:&v131 objects:v144 count:16];
        if (!v114)
        {
LABEL_61:

          if (-[os_log_s count](v111, "count"))
          {
            uint64_t v57 = v106;
            if (v38)
            {
              uint64_t v58 = objc_claimAutoreleasedReturnValue([v102 objectForKeyedSubscript:v38]);
              if (v58)
              {
                uint64_t v59 = (void *)v58;
              }

              else
              {
                id v61 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedStore fetchRequest](&OBJC_CLASS___SYDManagedStore, "fetchRequest"));
                unsigned int v62 = v38;
                id v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self == %@",  v38));
                [v61 setPredicate:v63];

                [v61 setResultType:2];
                [v61 setPropertiesToFetch:&off_10004FC08];
                v64 = (void *)v99[6];
                uint64_t v65 = *(void *)(v99[8] + 8LL);
                id v122 = *(id *)(v65 + 40);
                uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v64 executeFetchRequest:v61 error:&v122]);
                objc_storeStrong((id *)(v65 + 40), v122);
                if (*(void *)(*(void *)(v99[8] + 8LL) + 40LL))
                {
                  id v67 = SYDGetCoreDataLog();
                  id v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT)) {
                    sub_1000337AC(buf, v98, &v147, v68);
                  }

                  uint64_t v59 = 0LL;
                  __int128 v38 = v62;
                }

                else
                {
                  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v66 firstObject]);
                  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKeyedSubscript:@"identifier"]);

                  if (v59)
                  {
                    uint64_t v70 = v102;
                    __int128 v38 = v62;
                    if (!v102) {
                      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                    }
                    NSErrorUserInfoKey v102 = v70;
                    [v70 setObject:v59 forKeyedSubscript:v62];
                  }

                  else
                  {
                    id v71 = SYDGetCoreDataLog();
                    uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
                    __int128 v38 = v62;
                    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)v121 = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_INFO,  "No store identifier when validating deleted keys",  v121,  2u);
                    }

                    uint64_t v59 = 0LL;
                  }
                }

                uint64_t v57 = v106;
              }
            }

            else
            {
              id v60 = SYDGetCoreDataLog();
              uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR)) {
                sub_100033778(&v123, v124);
              }
            }
          }

          else
          {
            uint64_t v57 = v106;
          }

          id v35 = v57 + 1;
          if (v35 == v105)
          {
            id v105 = [v103 countByEnumeratingWithState:&v135 objects:v145 count:16];
            if (!v105)
            {
LABEL_93:

              if (-[os_log_s count](v31, "count"))
              {
                id v74 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedKeyValue fetchRequest](&OBJC_CLASS___SYDManagedKeyValue, "fetchRequest"));
                [v74 setResultType:2];
                [v74 setReturnsDistinctResults:1];
                [v74 setPropertiesToFetch:&off_10004FC20];
                uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self IN %@",  v31));
                v142[0] = v75;
                v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"store.identifier == %@",  v99[5]));
                v142[1] = v76;
                uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v142,  2LL));

                id v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v77));
                [v74 setPredicate:v78];

                uint64_t v79 = (void *)v99[6];
                uint64_t v80 = *(void *)(v99[8] + 8LL);
                id v120 = *(id *)(v80 + 40);
                uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v79 executeFetchRequest:v74 error:&v120]);
                objc_storeStrong((id *)(v80 + 40), v120);
                if (*(void *)(*(void *)(v99[8] + 8LL) + 40LL))
                {
                  id v82 = SYDGetCoreDataLog();
                  id v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
                    sub_100033718();
                  }
                }

                else
                {
                  __int128 v118 = 0u;
                  __int128 v119 = 0u;
                  __int128 v116 = 0u;
                  __int128 v117 = 0u;
                  id v83 = v81;
                  id v84 = -[os_log_s countByEnumeratingWithState:objects:count:]( v83,  "countByEnumeratingWithState:objects:count:",  &v116,  v141,  16LL);
                  if (v84)
                  {
                    id v85 = v84;
                    __int16 v115 = v81;
                    uint64_t v86 = *(void *)v117;
                    do
                    {
                      for (j = 0LL; j != v85; j = (char *)j + 1)
                      {
                        if (*(void *)v117 != v86) {
                          objc_enumerationMutation(v83);
                        }
                        char v88 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v116 + 1) + 8 * (void)j) objectForKeyedSubscript:@"key"]);
                        if (v88) {
                          [v100 addObject:v88];
                        }
                      }

                      id v85 = -[os_log_s countByEnumeratingWithState:objects:count:]( v83,  "countByEnumeratingWithState:objects:count:",  &v116,  v141,  16LL);
                    }

                    while (v85);
                    uint64_t v32 = v107;
                    uint64_t v81 = v115;
                  }
                }
              }

              uint64_t v89 = objc_claimAutoreleasedReturnValue([v100 allObjects]);
              uint64_t v90 = *(void *)(v99[9] + 8LL);
              __int16 v91 = *(void **)(v90 + 40);
              *(void *)(v90 + 40) = v89;

LABEL_109:
              id v20 = (os_log_s *)v97;
              goto LABEL_110;
            }

            goto LABEL_21;
          }

          goto LABEL_22;
        }

        goto LABEL_26;
      }
    }
  }

  id v6 = SYDGetCoreDataLog();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
    sub_100033A58();
  }
LABEL_113:
}

void sub_100025F5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100025F74(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___NSBatchUpdateRequest);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedKeyValue entity](&OBJC_CLASS___SYDManagedKeyValue, "entity"));
  uint64_t v4 = -[NSBatchUpdateRequest initWithEntity:](v2, "initWithEntity:", v3);

  uint64_t v5 = NSStringFromSelector("serverSystemFieldsRecordData");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v33 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v34 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
  -[NSBatchUpdateRequest setPropertiesToUpdate:](v4, "setPropertiesToUpdate:", v8);

  uint64_t v9 = *(void **)(a1 + 32);
  id v30 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 executeRequest:v4 error:&v30]);
  id v11 = v30;

  id v12 = SYDGetCoreDataLog();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100033BD0();
    }
  }

  else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    sub_100033B70();
  }

  uint64_t v15 = objc_alloc(&OBJC_CLASS___NSBatchUpdateRequest);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedStore entity](&OBJC_CLASS___SYDManagedStore, "entity"));
  unsigned int v17 = -[NSBatchUpdateRequest initWithEntity:](v15, "initWithEntity:", v16);

  id v18 = NSStringFromSelector("syncAnchorServerSystemFieldsRecordData");
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v31 = v19;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  uint64_t v32 = v20;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
  -[NSBatchUpdateRequest setPropertiesToUpdate:](v17, "setPropertiesToUpdate:", v21);

  uint64_t v22 = *(void **)(a1 + 32);
  id v29 = 0LL;
  NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue([v22 executeRequest:v17 error:&v29]);
  id v24 = v29;

  id v25 = SYDGetCoreDataLog();
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  __int128 v27 = v26;
  if (v23)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_100033B44();
    }
  }

  else if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    sub_100033AE4();
  }

  if (v11) {
    char v28 = v11;
  }
  else {
    char v28 = v24;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v28);
}

void sub_100026360( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100026378(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 managedDatabaseCreateIfNecessary:1 inContext:v3 error:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 acAccountIdentifier]);
  unsigned __int8 v7 = [v6 isEqualToString:a1[6]];

  if ((v7 & 1) == 0)
  {
    id v8 = SYDGetCoreDataLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100033BFC();
    }

    [v5 setAcAccountIdentifier:a1[6]];
    uint64_t v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = *(void *)(a1[7] + 8LL);
    id v13 = *(id *)(v12 + 40);
    [v10 saveContext:v11 reason:@"ACAccount identifier" includingTransactionContext:0 error:&v13];
    objc_storeStrong((id *)(v12 + 40), v13);
  }
}

void sub_1000265BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000265E0(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 managedDatabaseCreateIfNecessary:0 inContext:v3 error:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 acAccountIdentifier]);
  uint64_t v7 = *(void *)(a1[7] + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_1000267B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000267C8(uint64_t a1)
{
  uint64_t v3 = a1 + 48;
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v2 + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 managedDatabaseCreateIfNecessary:1 inContext:v5 error:&obj]);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)v3 + 8LL) + 40LL))
  {
    id v8 = SYDGetCoreDataLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100033D24();
    }
LABEL_8:

    goto LABEL_9;
  }

  if (*(unsigned __int8 *)(a1 + 56) != [v7 didMigrateFromPlists])
  {
    id v10 = SYDGetCoreDataLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100033CC0();
    }

    [v7 setDidMigrateFromPlists:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v16 = *(id *)(v14 + 40);
    [v12 saveContext:v13 reason:@"did migrate from plists" includingTransactionContext:0 error:&v16];
    id v15 = v16;
    uint64_t v9 = *(os_log_s **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
    goto LABEL_8;
  }

LABEL_9:
}
}

void sub_100026A28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100026A4C(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 managedDatabaseCreateIfNecessary:0 inContext:v3 error:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(void *)(a1[7] + 8) + 24) = [v5 didMigrateFromPlists];
}

void sub_100026C10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100026C28(uint64_t a1)
{
  uint64_t v3 = a1 + 48;
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v2 + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 managedDatabaseCreateIfNecessary:1 inContext:v5 error:&obj]);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)v3 + 8LL) + 40LL))
  {
    id v8 = SYDGetCoreDataLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100033E4C();
    }
LABEL_8:

    goto LABEL_9;
  }

  if (*(unsigned __int16 *)(a1 + 56) != (unsigned __int16)[v7 failedMigrationCount])
  {
    id v10 = SYDGetCoreDataLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100033DE8();
    }

    [v7 setFailedMigrationCount:*(__int16 *)(a1 + 56)];
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v16 = *(id *)(v14 + 40);
    [v12 saveContext:v13 reason:@"failed migration count" includingTransactionContext:0 error:&v16];
    id v15 = v16;
    uint64_t v9 = *(os_log_s **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
    goto LABEL_8;
  }

void sub_100026E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100026EAC(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 managedDatabaseCreateIfNecessary:0 inContext:v3 error:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_WORD *)(*(void *)(a1[7] + 8) + 24) = (unsigned __int16)[v5 failedMigrationCount];
}

void sub_1000270DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100027100(uint64_t a1)
{
  uint64_t v2 = NSStringFromSelector("key");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = NSStringFromSelector("plistDataValue");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SYDManagedKeyValue fetchRequest](&OBJC_CLASS___SYDManagedKeyValue, "fetchRequest"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"store.identifier == %@",  *(void *)(a1 + 32)));
  [v6 setPredicate:v7];

  id v8 = NSStringFromSelector("valueModificationDate");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v9,  0LL));
  uint64_t v58 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v58, 1LL));
  [v6 setSortDescriptors:v11];

  [v6 setResultType:2];
  v57[0] = v3;
  v57[1] = v5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 2LL));
  [v6 setPropertiesToFetch:v12];

  uint64_t v39 = a1;
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v13 + 40);
  __int128 v38 = v6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 execute:&obj]);
  objc_storeStrong((id *)(v13 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    id v15 = SYDGetCoreDataLog();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_100033F0C();
    }

    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    id v18 = *(void **)(a1 + 40);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) persistentStoreCoordinator]);
    [v18 handleCorruptionIfNecessaryFromError:v17 inPersistentStoreCoordinator:v19];
  }

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v14 count]));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v41 = v14;
  id v20 = [v41 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v41);
        }
        id v24 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v3]);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v5]);
        if (v26)
        {
          id v42 = 0LL;
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v26,  0LL,  0LL,  &v42));
          char v28 = (os_log_s *)v42;
          if (v27)
          {
            [v40 setObject:v27 forKeyedSubscript:v25];
          }

          else
          {
            id v31 = SYDGetCoreDataLog();
            uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            id v33 = v32;
            if (v28)
            {
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
              {
                uint64_t v34 = *(void *)(v39 + 32);
                *(_DWORD *)buf = 141558787;
                uint64_t v49 = 1752392040LL;
                __int16 v50 = 2113;
                id v51 = v25;
                __int16 v52 = 2112;
                uint64_t v53 = v34;
                __int16 v54 = 2112;
                unsigned int v55 = v28;
                _os_log_fault_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_FAULT,  "Error decoding plist value data for key <(%{private, mask.hash}@)> in dictionary representation for store <(%@)>: %@",  buf,  0x2Au);
              }
            }

            else if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              uint64_t v35 = *(void *)(v39 + 32);
              *(_DWORD *)buf = 141558531;
              uint64_t v49 = 1752392040LL;
              __int16 v50 = 2113;
              id v51 = v25;
              __int16 v52 = 2112;
              uint64_t v53 = v35;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "Nil deserialized value for key <(%{private, mask.hash}@)> when generating dictionary for store <(%@)>",  buf,  0x20u);
            }
          }
        }

        else
        {
          id v29 = SYDGetCoreDataLog();
          char v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = *(void *)(v39 + 32);
            *(_DWORD *)buf = 141558531;
            uint64_t v49 = 1752392040LL;
            __int16 v50 = 2113;
            id v51 = v25;
            __int16 v52 = 2112;
            uint64_t v53 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "No value for key <(%{private, mask.hash}@)> when generating dictionary for store <(%@)>",  buf,  0x20u);
          }
        }
      }

      id v21 = [v41 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }

    while (v21);
  }

  uint64_t v36 = *(void *)(*(void *)(v39 + 64) + 8LL);
  uint64_t v37 = *(void **)(v36 + 40);
  *(void *)(v36 + 40) = v40;
}

void sub_10002776C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100027784(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 managedDatabaseCreateIfNecessary:1 inContext:v3 error:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  [v5 setSyncEngineStateSerialization:a1[6]];
  [v5 setSyncEngineMetadata:0];
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(a1[7] + 8LL);
  id v9 = *(id *)(v8 + 40);
  [v6 saveContext:v7 reason:@"sync engine metadata serialization" includingTransactionContext:0 error:&v9];
  objc_storeStrong((id *)(v8 + 40), v9);
}

void sub_1000279A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000279C8(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 managedDatabaseCreateIfNecessary:0 inContext:v3 error:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 syncEngineStateSerialization]);
  uint64_t v7 = *(void *)(a1[7] + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_100027BB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100027BD0(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 managedDatabaseCreateIfNecessary:1 inContext:v3 error:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  [v5 setSyncEngineMetadata:a1[6]];
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(a1[7] + 8LL);
  id v9 = *(id *)(v8 + 40);
  [v6 saveContext:v7 reason:@"deprecated sync engine metadata" includingTransactionContext:0 error:&v9];
  objc_storeStrong((id *)(v8 + 40), v9);
}

void sub_100027DE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100027E08(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 managedDatabaseCreateIfNecessary:0 inContext:v3 error:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 syncEngineMetadata]);
  uint64_t v7 = *(void *)(a1[7] + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

LABEL_15:
  if (a6) {
    *a6 = v15;
  }

  return v19;
}

void sub_100028900(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"store.identifier == %@",  a2));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key IN %@",  v5,  v6));

  v10[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));
  [*(id *)(a1 + 32) addObject:v9];
}

LABEL_21:
    __int128 v27 = SYDGetCoreDataLog();
    char v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_1000344DC();
    }
LABEL_25:

    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 persistentStoreCoordinator]);
    -[SYDCoreDataStore handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:]( self,  "handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:",  v15,  v17);
    goto LABEL_26;
  }

  uint64_t v22 = SYDGetCoreDataLog();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10003453C();
  }
  id v15 = 0LL;
LABEL_26:

  if (a6) {
LABEL_27:
  }
    *a6 = v15;
LABEL_28:

  return v15 == 0LL;
}

void sub_10002915C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100029174(uint64_t a1)
{
  os_log_t v1 = (id *)(a1 + 32);
  if (!*(void *)(*(void *)(a1 + 32) + 16LL))
  {
    id v3 = SYDGetCoreDataLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100034594();
    }

    id v5 = [(id)objc_opt_class(*(void *)(a1 + 32)) managedObjectModel];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = -[NSPersistentContainer initWithName:managedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentContainer),  "initWithName:managedObjectModel:",  @"SYDManagedObjectModel",  v6);
    uint64_t v8 = objc_alloc(&OBJC_CLASS___NSPersistentStoreDescription);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) URL]);
    id v10 = -[NSPersistentStoreDescription initWithURL:](v8, "initWithURL:", v9);

    -[NSPersistentStoreDescription setType:](v10, "setType:", NSSQLiteStoreType);
    -[NSPersistentStoreDescription setShouldMigrateStoreAutomatically:](v10, "setShouldMigrateStoreAutomatically:", 1LL);
    -[NSPersistentStoreDescription setShouldInferMappingModelAutomatically:]( v10,  "setShouldInferMappingModelAutomatically:",  1LL);
    -[NSPersistentStoreDescription setShouldAddStoreAsynchronously:](v10, "setShouldAddStoreAsynchronously:", 0LL);
    -[NSPersistentStoreDescription setOption:forKey:]( v10,  "setOption:forKey:",  &__kCFBooleanTrue,  NSPersistentHistoryTrackingKey);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fileProtectionType]);
    -[NSPersistentStoreDescription setOption:forKey:](v10, "setOption:forKey:", v11, NSPersistentStoreFileProtectionKey);

    uint64_t v35 = v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    -[NSPersistentContainer setPersistentStoreDescriptions:](v7, "setPersistentStoreDescriptions:", v12);

    uint64_t v31 = 0LL;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2020000000LL;
    char v34 = 0;
    uint64_t v27 = 0LL;
    char v28 = &v27;
    uint64_t v29 = 0x2020000000LL;
    char v30 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000294F8;
    v22[3] = &unk_10004D818;
    id v24 = &v31;
    id v25 = &v27;
    v22[4] = *(void *)(a1 + 32);
    uint64_t v13 = v7;
    uint64_t v14 = *(void *)(a1 + 40);
    NSErrorUserInfoKey v23 = v13;
    uint64_t v26 = v14;
    -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:]( v13,  "loadPersistentStoresWithCompletionHandler:",  v22);
    if (*((_BYTE *)v32 + 24)) {
      goto LABEL_5;
    }
    if (*((_BYTE *)v28 + 24))
    {
      id v17 = SYDGetCoreDataLog();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Retrying to load persistent store", buf, 2u);
      }

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10002961C;
      v20[3] = &unk_10004D840;
      uint64_t v19 = *(void *)(a1 + 40);
      v20[4] = &v31;
      v20[5] = v19;
      -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:]( v13,  "loadPersistentStoresWithCompletionHandler:",  v20);
      if (*((_BYTE *)v32 + 24))
      {
LABEL_5:
        id v15 = SYDGetCoreDataLog();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          sub_100034568();
        }

        objc_storeStrong((id *)*v1 + 2, v7);
        [*v1 clearContexts];
      }
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }

void sub_1000294C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_1000294F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v5 == 0LL;
  if (v5)
  {
    if (sub_10000B3A4(v5))
    {
      id v7 = SYDGetCoreDataLog();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000345F4();
      }
    }

    else
    {
      int v9 = sub_10000B470(v6);
      id v10 = SYDGetCoreDataLog();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v8 = v11;
      if (v9)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100034654();
        }
      }

      else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        sub_1000346B4();
      }
    }

    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) persistentStoreCoordinator]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend( v12,  "_queue_handleCorruptionIfNecessaryFr omError:inPersistentStoreCoordinator:",  v6,  v13);

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), a3);
  }
}

void sub_10002961C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5 == 0LL;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  id v6 = SYDGetCoreDataLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100034740();
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    sub_100034714();
  }
}

void sub_100029700(id a1)
{
  os_log_t v1 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SYDRemotePreferencesSource));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (!v2)
  {
    id v3 = SYDGetCoreDataLog();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000347F8();
    }
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 URLForResource:@"SYDManagedObjectModel" withExtension:@"momd"]);
  id v6 = SYDGetCoreDataLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000347CC();
    }

    int v9 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v5);
    uint64_t v8 = (os_log_s *)qword_100057AB8;
    qword_100057AB8 = (uint64_t)v9;
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    sub_1000347A0();
  }
}

void sub_100029918(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) persistentStoreCoordinator]);
  objc_msgSend(v1, "_queue_destroyPersistentStoreInPersistentStoreCoordinator:", v2);
}

void sub_100029FFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10002A01C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 transactionContext]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v4 + 40);
  [v2 saveContext:v3 reason:@"saving transaction" includingTransactionContext:1 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

void sub_10002A1C4(uint64_t a1)
{
  if (objc_msgSend( *(id *)(a1 + 32),  "_queue_handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:",  *(void *)(a1 + 40),  *(void *)(a1 + 48)))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0LL;
  }

void sub_10002A6FC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10002A708(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_10002A71C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void sub_10002A734( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10002A744(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

void sub_10002A75C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

_BYTE *sub_10002A798(_BYTE *result, _BYTE *a2)
{
  *id result = 0;
  *a2 = 0;
  return result;
}

  ;
}

uint64_t SYDKeyID.key.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key);
  swift_bridgeObjectRetain(*(void *)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key + 8));
  return v1;
}

id sub_10002A804(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + *a3 + 8);
  swift_bridgeObjectRetain(v3);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

uint64_t SYDKeyID.storeIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier);
  swift_bridgeObjectRetain(*(void *)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier + 8));
  return v1;
}

id SYDKeyID.__allocating_init(key:storeIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v9 = (char *)objc_allocWithZone(v4);
  id v10 = &v9[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key];
  *(void *)id v10 = a1;
  *((void *)v10 + 1) = a2;
  uint64_t v11 = &v9[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier];
  *(void *)uint64_t v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, "init");
}

id SYDKeyID.init(key:storeIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = &v4[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key];
  *(void *)id v5 = a1;
  *((void *)v5 + 1) = a2;
  id v6 = &v4[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier];
  *(void *)id v6 = a3;
  *((void *)v6 + 1) = a4;
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for SYDKeyID();
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t type metadata accessor for SYDKeyID()
{
  return objc_opt_self(&OBJC_CLASS____TtC13syncdefaultsd8SYDKeyID);
}

uint64_t SYDKeyID.description.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key);
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key + 8);
  swift_bridgeObjectRetain(v2);
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(v2);
  v4._object = (void *)0x8000000100044B10LL;
  v4._countAndFlagsBits = 0xD000000000000011LL;
  String.append(_:)(v4);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier);
  id v6 = *(void **)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier + 8);
  swift_bridgeObjectRetain(v6);
  v7._countAndFlagsBits = v5;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(v6);
  v8._countAndFlagsBits = 62LL;
  v8._object = (void *)0xE100000000000000LL;
  String.append(_:)(v8);
  return 0x3D79656B3CLL;
}

uint64_t SYDKeyID.hash.getter()
{
  unint64_t v0 = sub_10002AC6C();
  uint64_t v1 = StringProtocol.hash.getter(&type metadata for String, v0);
  return StringProtocol.hash.getter(&type metadata for String, v0) ^ v1;
}

unint64_t sub_10002AC6C()
{
  unint64_t result = qword_1000578A0;
  if (!qword_1000578A0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000578A0);
  }

  return result;
}

uint64_t SYDKeyID.isEqual(_:)(uint64_t a1)
{
  if (!v10)
  {
    sub_10002AE28((uint64_t)v9);
    goto LABEL_14;
  }

  uint64_t v2 = type metadata accessor for SYDKeyID();
  if ((swift_dynamicCast(&v8, v9, (char *)&type metadata for Any + 8, v2, 6LL) & 1) == 0)
  {
LABEL_14:
    char v6 = 0;
    return v6 & 1;
  }

  Swift::String v3 = v8;
  BOOL v4 = *(void *)&v8[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key] == *(void *)(v1
                                                                                 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key)
    && *(void *)&v8[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key + 8] == *(void *)(v1
                                                                                     + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key
                                                                                     + 8);
  if (!v4 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {

    goto LABEL_14;
  }

  if (*(void *)&v3[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier] == *(void *)(v1
                                                                                             + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier)
    && *(void *)&v3[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier + 8] == *(void *)(v1
                                                                                                 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier
                                                                                                 + 8))
  {

    char v6 = 1;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }

  return v6 & 1;
}

uint64_t sub_10002ADA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002ADE8(&qword_1000578A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002ADE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10002AE28(uint64_t a1)
{
  uint64_t v2 = sub_10002ADE8(&qword_1000578A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

id SYDKeyID.copy(with:)@<X0>(void *a1@<X8>)
{
  a1[3] = type metadata accessor for SYDKeyID();
  *a1 = v3;
  return v3;
}

id SYDKeyID.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

void SYDKeyID.init()()
{
}

id SYDKeyID.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SYDKeyID();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_10002B000()
{
}

void sub_10002B060()
{
}

void sub_10002B0C0()
{
}

void sub_10002B120( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B188( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B1F0()
{
}

void sub_10002B250()
{
}

void sub_10002B2B0()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Found bundle identifiers for store %@: %@",  v2,  0x16u);
  sub_100005018();
}

void sub_10002B334( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B364( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B394( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B3C4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005008( (void *)&_mh_execute_header,  a2,  a3,  "Installed apps changed. Clearing cached store bundle map. Notification=%@",  a5,  a6,  a7,  a8,  2u);
  sub_100005018();
}

void sub_10002B42C()
{
}

void sub_10002B458()
{
}

void sub_10002B4BC()
{
}

void sub_10002B4E8()
{
}

void sub_10002B514()
{
}

void sub_10002B540()
{
}

void sub_10002B56C(uint64_t a1)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  sub_100008828();
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Account in database (%@) is different from the logged-in account (%@)",  (uint8_t *)&v2,  0x16u);
  sub_100005018();
}

void sub_10002B5E4()
{
}

void sub_10002B65C()
{
}

void sub_10002B6CC()
{
}

void sub_10002B72C()
{
}

void sub_10002B78C()
{
}

void sub_10002B7EC()
{
}

void sub_10002B84C(uint64_t a1)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  sub_100008828();
  _os_log_fault_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_FAULT,  "Error checking if files exist after attempted daemon container migration: oldFileError=%@ newFileError=%@",  (uint8_t *)&v2,  0x16u);
  sub_100005018();
}

void sub_10002B8C4()
{
}

void sub_10002B924()
{
}

void sub_10002B984()
{
}

void sub_10002B9E4()
{
}

void sub_10002BA44()
{
}

void sub_10002BAA4()
{
}

void sub_10002BB04()
{
}

void sub_10002BB30()
{
}

void sub_10002BB94()
{
}

void sub_10002BBC0()
{
}

void sub_10002BC20()
{
}

void sub_10002BC58()
{
}

void sub_10002BC84()
{
}

void sub_10002BCB0()
{
}

void sub_10002BCDC()
{
}

void sub_10002BD08()
{
}

void sub_10002BD6C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  sub_100005030();
  sub_10000A304((void *)&_mh_execute_header, v2, v3, "No encoded data for new server record %@", v4, v5, v6, v7, v8);

  sub_10000A2F8();
}

void sub_10002BDE4(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "syd_shortDescription"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "syd_shortDescription"));
  uint8_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "syd_shortDescription"));
  int v10 = 138412802;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  objc_super v13 = v7;
  __int16 v14 = 2112;
  id v15 = v8;
  sub_10000A32C( (void *)&_mh_execute_header,  a3,  v9,  "Not replacing local system fields record for %@: current=%@ other=%@",  (uint8_t *)&v10);
}

void sub_10002BEBC(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syd_shortDescription"));
  uint8_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "syd_shortDescription"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "syd_shortDescription"));
  int v11 = 138412802;
  __int16 v12 = v7;
  __int16 v13 = 2112;
  __int16 v14 = v8;
  __int16 v15 = 2112;
  id v16 = v9;
  sub_10000A32C( (void *)&_mh_execute_header,  a3,  v10,  "Replacing local system fields record for %@: current=%@ other=%@",  (uint8_t *)&v11);

  sub_10000A318();
}

void sub_10002BF9C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "syd_shortDescription"));
  sub_100005030();
  sub_10000A2C8((void *)&_mh_execute_header, v3, v4, "No current system fields record for %@", v5, v6, v7, v8, v9);

  sub_10000A2DC();
}

void sub_10002C028(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "syd_shortDescription"));
  sub_100005030();
  sub_10000A2C8( (void *)&_mh_execute_header,  v3,  v4,  "No current modification date on system fields record for %@",  v5,  v6,  v7,  v8,  v9);

  sub_10000A2DC();
}

void sub_10002C0B4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "syd_shortDescription"));
  sub_100005030();
  sub_10000A2C8( (void *)&_mh_execute_header,  v3,  v4,  "Server record is newer than current system fields record for %@",  v5,  v6,  v7,  v8,  v9);

  sub_10000A2DC();
}

void sub_10002C140()
{
}

void sub_10002C1A4()
{
}

void sub_10002C1D0()
{
}

void sub_10002C1FC()
{
}

void sub_10002C228()
{
}

void sub_10002C254(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  sub_100005030();
  sub_10000A2C8((void *)&_mh_execute_header, v2, v3, "No file URL for value data asset in %@", v4, v5, v6, v7, v8);

  sub_10000A2F8();
}

void sub_10002C2CC()
{
}

void sub_10002C330(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 recordType]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 recordType]);
  sub_10000A338();
  uint64_t v9 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Trying to merge data from a record of a different type (%@) from this key value record type (%@)",  v8,  0x16u);

  sub_10000A2DC();
}

void sub_10002C3D8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordType]);
  sub_100005030();
  sub_10000A2EC((void *)&_mh_execute_header, a2, v4, "Trying to merge data from an unknown record type: %@", v5);

  sub_10000A2F8();
}

void sub_10002C458(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 key]);
  sub_100005030();
  sub_10000A2C8((void *)&_mh_execute_header, v2, v3, "Merging data from record to %{private}@", v4, v5, v6, v7, v8);

  sub_10000A2F8();
}

void sub_10002C4D0(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  sub_100005030();
  sub_10000A304( (void *)&_mh_execute_header,  v2,  v3,  "Somehow we got to a point where we're creating a record for %@, but we have no data. Bailing",  v4,  v5,  v6,  v7,  v8);

  sub_10000A2F8();
}

void sub_10002C548(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  id v9 = [a2 length];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "Going to use an asset for %@ because the data is %ld bytes",  (uint8_t *)&v6,  0x16u);

  sub_10000A2DC();
}

void sub_10002C5F0()
{
}

void sub_10002C654(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 recordID]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 recordType]);
  sub_10000A338();
  int v11 = v6;
  __int16 v12 = v8;
  uint64_t v13 = v9;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "Expected record type %@ for record name %@, but server record had record type %@",  v10,  0x20u);

  sub_10000A318();
}

void sub_10002C720(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  sub_100005030();
  sub_10000A2EC((void *)&_mh_execute_header, a2, v4, "Could not get key from record %@", v5);

  sub_10000A2F8();
}

void sub_10002C7A0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C808(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Requesting notification authorization",  v1,  2u);
}

void sub_10002C848(char a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Requested notification authorization, granted=%d",  (uint8_t *)v2,  8u);
}

void sub_10002C8C0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C928()
{
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getUNMutableNotificationContentClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"SYDUserNotifications.m",  20,  @"Unable to find class %s",  "UNMutableNotificationContent");

  __break(1u);
}

void sub_10002C9A0(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *UserNotificationsLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"SYDUserNotifications.m",  19,  @"%s",  *a1);

  __break(1u);
}

void sub_10002CA1C()
{
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getUNNotificationRequestClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"SYDUserNotifications.m",  21,  @"Unable to find class %s",  "UNNotificationRequest");

  __break(1u);
}

void sub_10002CA94()
{
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getUNUserNotificationCenterClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"SYDUserNotifications.m",  22,  @"Unable to find class %s",  "UNUserNotificationCenter");

  __break(1u);
}

void sub_10002CB0C()
{
}

void sub_10002CB6C()
{
}

void sub_10002CBCC()
{
}

void sub_10002CBF8(os_log_s *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100005030();
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Error consuming sandbox token: %s", v3, 0xCu);
}

void sub_10002CC84()
{
}

void sub_10002CCE4()
{
}

void sub_10002CD44()
{
}

void sub_10002CDA4()
{
}

void sub_10002CE04()
{
}

void sub_10002CE64()
{
}

void sub_10002CE90()
{
}

void sub_10002CEBC()
{
}

void sub_10002CEE8()
{
}

void sub_10002CF48()
{
}

void sub_10002CF74()
{
}

void sub_10002CFD4()
{
}

void sub_10002D034()
{
}

void sub_10002D094()
{
}

void sub_10002D0F4()
{
}

void sub_10002D154()
{
}

void sub_10002D1B4()
{
}

void sub_10002D1E0()
{
}

void sub_10002D240()
{
}

void sub_10002D2A0()
{
}

void sub_10002D300()
{
}

void sub_10002D360()
{
}

void sub_10002D3C0()
{
}

void sub_10002D420()
{
}

void sub_10002D480( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D4E8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D550()
{
}

void sub_10002D57C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D5E0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D644()
{
}

void sub_10002D670()
{
}

void sub_10002D69C()
{
}

void sub_10002D6C8()
{
}

void sub_10002D6F4()
{
  sub_1000186DC( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "Initializing store with container=%@ coreDataStore=%@",  v1);
  sub_100005018();
}

void sub_10002D75C()
{
}

void sub_10002D788()
{
}

void sub_10002D7E8()
{
}

void sub_10002D848()
{
}

void sub_10002D8AC()
{
}

void sub_10002D914(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 141558275;
  uint64_t v5 = 1752392040LL;
  __int16 v6 = 2113;
  uint64_t v7 = v3;
  sub_100018740( (void *)&_mh_execute_header,  a2,  a3,  "BUG IN CLIENT OF KVS: Trying to set a nil object for key <(%{private, mask.hash}@)>, but we should have early returned above",  (uint8_t *)&v4);
  sub_100005018();
}

void sub_10002D994()
{
  sub_100005020( (void *)&_mh_execute_header,  v0,  v1,  "alwaysSaveRecordZones=YES, saving record zone",  v2,  v3,  v4,  v5,  v6);
  sub_10000503C();
}

void sub_10002D9C0()
{
}

void sub_10002D9EC()
{
}

void sub_10002DA4C()
{
}

void sub_10002DAB4()
{
}

void sub_10002DAE0()
{
}

void sub_10002DB54()
{
}

void sub_10002DBB4(void *a1, os_log_t log)
{
  uint64_t v4 = a1[4];
  if (v4)
  {
    uint8_t v6 = (objc_class *)objc_opt_class(a1[4]);
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    uint64_t v5 = @"nil";
  }

  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  int v10 = 138413059;
  int v11 = v5;
  __int16 v12 = 2160;
  uint64_t v13 = 1752392040LL;
  __int16 v14 = 2113;
  uint64_t v15 = v8;
  __int16 v16 = 2112;
  uint64_t v17 = v9;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Setting %@ for key <(%{private, mask.hash}@)> in store <(%@)>",  (uint8_t *)&v10,  0x2Au);
  if (v4) {
}
  }

void sub_10002DCA4()
{
}

void sub_10002DD04()
{
}

void sub_10002DD30()
{
}

void sub_10002DD90()
{
}

void sub_10002DDFC()
{
}

void sub_10002DE60()
{
}

void sub_10002DE8C()
{
}

void sub_10002DEB8()
{
}

void sub_10002DF18()
{
}

void sub_10002DF44(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "componentsJoinedByString:", @", "));
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Saving pending changes to cloud for stores [%@]", v5);

  sub_10000A2F8();
}

void sub_10002DFCC()
{
}

void sub_10002DFF8()
{
}

void sub_10002E058()
{
}

void sub_10002E0B8()
{
}

void sub_10002E0E4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "componentsJoinedByString:", @", "));
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Fetching pending changes from cloud for stores [%@]", v5);

  sub_10000A2F8();
}

void sub_10002E16C()
{
}

void sub_10002E198()
{
}

void sub_10002E1FC()
{
}

void sub_10002E25C()
{
}

void sub_10002E2BC()
{
}

void sub_10002E31C()
{
}

void sub_10002E37C()
{
}

void sub_10002E3A8()
{
}

void sub_10002E408()
{
}

void sub_10002E46C()
{
}

void sub_10002E4D0()
{
}

void sub_10002E534()
{
}

void sub_10002E598()
{
}

void sub_10002E600()
{
}

void sub_10002E664()
{
  uint64_t v2 = sub_10000B838((unint64_t)[v1 storeType]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000186C4();
  sub_1000186DC((void *)&_mh_execute_header, v0, v4, "Received sync engine event (%@): %@", v5);

  sub_10000A2DC();
}

void sub_10002E6EC()
{
}

void sub_10002E750(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "syd_shortDescription"));
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Returning record to save %@", v5);

  sub_10000A2F8();
}

void sub_10002E7D0()
{
}

void sub_10002E830()
{
}

void sub_10002E890()
{
  sub_10000D96C( (void *)&_mh_execute_header,  v0,  v1,  "Error getting key value for %@ when returning record to sync engine: %@");
  sub_100005018();
}

void sub_10002E8F0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "syd_shortDescription"));
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Generating record to save for %@", v5);

  sub_10000A2F8();
}

void sub_10002E970(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 recordID]);
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Did save sync anchor record %@", v5);

  sub_10000A2F8();
}

void sub_10002E9F4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "syd_shortDescription"));
  sub_100005030();
  sub_1000186F8((void *)&_mh_execute_header, a2, v5, "No keyValue by record name after saving %@", v6);

  sub_10000A2DC();
}

void sub_10002EA88()
{
}

void sub_10002EAE8()
{
}

void sub_10002EB48(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "syd_shortDescription"));
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Did save keyValue record %@", v5);

  sub_10000A2F8();
}

void sub_10002EBC8()
{
}

void sub_10002EBF4()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "syd_shortDescription"));
  sub_1000186C4();
  sub_100018740((void *)&_mh_execute_header, v0, v3, "Unknown error saving record %@: %@", v4);

  sub_10000A2DC();
}

void sub_10002EC78()
{
}

void sub_10002ECA4()
{
}

void sub_10002ED04()
{
}

void sub_10002ED64(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "syd_shortDescription"));
  sub_100005030();
  sub_10001866C( (void *)&_mh_execute_header,  a2,  v5,  "Not merging data from server record %@ because it has an asset",  v6);

  sub_10000A2DC();
}

void sub_10002EDF8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "syd_shortDescription"));
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v5, "Resolving conflict for record %@", v6);

  sub_10000A2DC();
}

void sub_10002EE8C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "syd_shortDescription"));
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Conflict saving key-value record %@", v5);

  sub_10000A2F8();
}

void sub_10002EF0C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "syd_shortDescription"));
  sub_100005030();
  sub_10001866C( (void *)&_mh_execute_header,  a2,  v5,  "Couldn't find keyValue for record %@ after CKErrorUnknownItem",  v6);

  sub_10000A2DC();
}

void sub_10002EFA0()
{
}

void sub_10002F000()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 recordID]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "syd_shortDescription"));
  sub_1000186C4();
  sub_100018678( (void *)&_mh_execute_header,  v0,  v4,  "Error fetching keyValue handling CKErrorUnknownItem for record %@: %@",  v5);

  sub_10000A2DC();
}

void sub_10002F094()
{
}

void sub_10002F0F4(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "syd_shortDescription"));
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Deleted sync anchor record %@", v5);

  sub_10000A2F8();
}

void sub_10002F178()
{
}

void sub_10002F1D8()
{
}

void sub_10002F204()
{
}

void sub_10002F230()
{
}

void sub_10002F290(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syd_shortDescription"));
  sub_100005030();
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  sub_100018678((void *)&_mh_execute_header, a2, v5, "Error deleting record %@: %@", v6);

  sub_10000A2DC();
}

void sub_10002F32C()
{
}

void sub_10002F394(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 error]);
  sub_100005030();
  sub_1000186F8((void *)&_mh_execute_header, a2, v4, "Failed to archive sync anchor record: %@", v5);

  sub_10000A2F8();
}

void sub_10002F414()
{
}

void sub_10002F474(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Will save sync anchor server record: %@", v5);

  sub_10000A2F8();
}

void sub_10002F4F4()
{
  uint64_t v3 = v2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 pendingFetchedRecords]);
  id v5 = [v4 count];
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingDeletedRecordIDs]);
  [v6 count];
  int v8 = 134218498;
  id v9 = v5;
  sub_100018728();
  uint64_t v10 = v1;
  sub_10000A32C( (void *)&_mh_execute_header,  v0,  v7,  "Processing %ld pending fetched records and %ld deleted records (%@)",  (uint8_t *)&v8);

  sub_10000A318();
}

void sub_10002F5AC()
{
}

void sub_10002F5D8()
{
}

void sub_10002F638()
{
}

void sub_10002F698()
{
  id v3 = [v2 count];
  [v1 count];
  int v4 = 134218498;
  id v5 = v3;
  sub_100018728();
  uint64_t v6 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "Expected a dictionary with %ld values but only received %ld values: %@",  (uint8_t *)&v4,  0x20u);
}

void sub_10002F73C()
{
}

void sub_10002F7A4(void *a1, os_log_s *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);
  sub_100005030();
  sub_10001866C( (void *)&_mh_execute_header,  a2,  v5,  "Local record was created first, choosing local record name %@",  v6);

  sub_10000A2DC();
}

void sub_10002F838(void *a1, os_log_s *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordID]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recordName]);
  sub_100005030();
  sub_10001866C( (void *)&_mh_execute_header,  a2,  v5,  "Remote record was created earlier, choosing remote record name %@",  v6);

  sub_10000A2DC();
}

void sub_10002F8CC(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 recordName]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 recordID]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 key]);
  int v11 = 138412803;
  __int16 v12 = v6;
  __int16 v13 = 2112;
  __int16 v14 = v8;
  __int16 v15 = 2113;
  __int16 v16 = v9;
  sub_10000A32C( (void *)&_mh_execute_header,  a3,  v10,  "Local record name (%@) and fetched record name (%@) do not match for key (%{private}@)",  (uint8_t *)&v11);

  sub_10000A318();
}

void sub_10002F9B0()
{
}

void sub_10002FA18()
{
}

void sub_10002FA80()
{
}

void sub_10002FAE0()
{
}

void sub_10002FB44()
{
}

void sub_10002FBA8()
{
}

void sub_10002FC0C()
{
}

void sub_10002FC70(id *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*a1 storeIdentifiersWithChangedValuesDuringFetchChanges]);
  [v3 count];
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Will post store-specific Darwin notification for %ld stores", v5);

  sub_10000A2F8();
}

void sub_10002FCF8(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = @"SYDRemotePreferencesSourceDidChangeExternally";
  sub_10001866C((void *)&_mh_execute_header, a1, a3, "Posting %@", (uint8_t *)&v3);
  sub_100005018();
}

void sub_10002FD6C()
{
}

void sub_10002FDD0()
{
}

void sub_10002FE34()
{
}

void sub_10002FE6C()
{
}

void sub_10002FE98()
{
}

void sub_10002FEF8()
{
}

void sub_10002FF58(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "Found account for persona %@: %@",  (uint8_t *)&v6,  0x16u);
}

void sub_100030008()
{
}

void sub_100030068()
{
}

void sub_1000300D4()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Error getting account for persona %@: %@",  v2,  0x16u);
  sub_100005018();
}

void sub_100030150( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030184( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000301B8()
{
}

void sub_1000301E4()
{
}

void sub_100030244()
{
}

void sub_100030270(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 xpcConnection]);
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Resuming connection %@", v5);

  sub_10000A2F8();
}

void sub_1000302F4(id *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*a1 processName]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 storeID]);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Process %@ is NOT entitled for store %@",  (uint8_t *)&v6,  0x16u);

  sub_10001DFC8();
}

void sub_1000303B4()
{
}

void sub_10003041C()
{
}

void sub_100030490()
{
}

void sub_100030504()
{
}

void sub_100030578()
{
}

void sub_1000305EC()
{
}

void sub_100030660()
{
}

void sub_1000306D4()
{
}

void sub_100030748()
{
  v3[0] = 67109378;
  v3[1] = [v2 processIdentifier];
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "Checking if process %d is entitled for store %@",  (uint8_t *)v3,  0x12u);
  sub_10000A2F8();
}

void sub_1000307D4()
{
  sub_10000D980((void *)&_mh_execute_header, v0, v1, "Handling setObject (%{private}@) for store=%@");
  sub_100005018();
}

void sub_100030834()
{
  sub_10000D980((void *)&_mh_execute_header, v0, v1, "Handling objectForKey (%{private}@) for store=%@");
  sub_100005018();
}

void sub_100030894()
{
  sub_10000D980((void *)&_mh_execute_header, v0, v1, "Handling removeObject (%{private}@) for store=%@");
  sub_100005018();
}

void sub_1000308F4()
{
  sub_100008838((void *)&_mh_execute_header, v0, v1, "No sync manager for store=%@", v2, v3, v4, v5, v6);
  sub_100005018();
}

void sub_100030954()
{
  sub_100005008((void *)&_mh_execute_header, v0, v1, "Handling sync for store=%@", v2, v3, v4, v5, v6);
  sub_100005018();
}

void sub_1000309B4()
{
  sub_10000D980((void *)&_mh_execute_header, v0, v1, "Completed sync for store=%@ with error: %@");
  sub_100005018();
}

void sub_100030A1C(unint64_t a1, os_log_s *a2)
{
  uint64_t v3 = sub_10000B838(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100005030();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No sync manager for store type %@", v5, 0xCu);

  sub_10000A2F8();
}

void sub_100030AA4()
{
  uint64_t v3 = sub_10000B838(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  int v6 = 138412546;
  uint8_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  sub_1000186DC((void *)&_mh_execute_header, v0, v5, "Handling sync for stores with type %@: %@", (uint8_t *)&v6);

  sub_10001DFC8();
}

void sub_100030B40()
{
  sub_100005008( (void *)&_mh_execute_header,  v0,  v1,  "Handling dictionaryRepresentation for store=%@",  v2,  v3,  v4,  v5,  v6);
  sub_100005018();
}

void sub_100030BA0()
{
}

void sub_100030BCC()
{
}

void sub_100030BF8()
{
}

void sub_100030C58()
{
}

void sub_100030CB8()
{
}

void sub_100030D18(void *a1, os_log_s *a2)
{
}

void sub_100030D8C()
{
}

void sub_100030DEC()
{
}

void sub_100030E4C()
{
}

void sub_100030E78(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 storeID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  sub_100005030();
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "KVS store has a symbolic link for its change token (%@)",  v5,  0xCu);

  sub_10001DFC8();
}

void sub_100030F1C()
{
}

void sub_100030F7C()
{
}

void sub_100030FDC()
{
}

void sub_10003103C()
{
}

void sub_10003109C()
{
}

void sub_1000310FC()
{
}

void sub_10003115C()
{
}

void sub_1000311BC()
{
}

void sub_10003121C()
{
}

void sub_10003127C()
{
}

void sub_1000312A8()
{
}

void sub_100031308()
{
}

void sub_100031368()
{
}

void sub_1000313C8()
{
}

void sub_100031438()
{
}

void sub_100031498()
{
}

void sub_1000314F8()
{
}

void sub_100031558()
{
  sub_10000D980( (void *)&_mh_execute_header,  v0,  v1,  "Not processing did-change-value notification for store ID=%@ changedKeys=%@");
  sub_100005018();
}

void sub_1000315B8()
{
}

void sub_100031618()
{
}

void sub_100031678()
{
}

void sub_1000316D8()
{
}

void sub_100031738()
{
}

void sub_100031764(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1000317A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1000317DC()
{
}

void sub_10003183C()
{
}

void sub_100031868()
{
}

void sub_100031894()
{
}

void sub_1000318C0()
{
}

void sub_100031920()
{
}

void sub_10003194C()
{
}

void sub_1000319AC()
{
}

void sub_1000319D8(__int16 a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Set new failed migration count %d",  (uint8_t *)v2,  8u);
  sub_10000503C();
}

void sub_100031A4C()
{
}

void sub_100031AAC()
{
}

void sub_100031B0C()
{
}

void sub_100031B6C()
{
}

void sub_100031B98()
{
}

void sub_100031BF8()
{
}

void sub_100031C24()
{
}

void sub_100031C50(uint64_t a1, os_log_s *a2, uint64_t a3, double a4)
{
  uint64_t v4 = *(void *)(*(void *)a1 + 24LL);
  int v5 = 134218240;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  double v8 = a4;
  sub_1000186DC((void *)&_mh_execute_header, a2, a3, "Migrating all (%lu) plists took %.2f seconds", (uint8_t *)&v5);
  sub_100005018();
}

void sub_100031CCC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_10001866C((void *)&_mh_execute_header, a3, (uint64_t)a3, "About to migrate %lu possible plists", (uint8_t *)a1);
}

void sub_100031D08()
{
}

void sub_100031D6C()
{
}

void sub_100031DD0()
{
}

void sub_100031E34()
{
}

void sub_100031E9C()
{
}

void sub_100031F00()
{
}

void sub_100031F60()
{
}

void sub_100031FC0()
{
}

void sub_100032020()
{
}

void sub_100032080(uint64_t a1, uint64_t a2, os_log_s *a3, double a4)
{
  *(_DWORD *)a2 = 138412546;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = a4 * -1000.0;
  sub_1000186DC( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Migrating plist for %@ took %.0f milliseconds",  (uint8_t *)a2);
}

void sub_1000320D4()
{
}

void sub_100032138()
{
}

void sub_10003219C()
{
}

void sub_100032208()
{
}

void sub_100032274()
{
}

void sub_1000322D8(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = (objc_class *)objc_opt_class(a1);
  uint64_t v5 = NSStringFromClass(v4);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  sub_100018740( (void *)&_mh_execute_header,  a2,  v7,  "Found value in plist that wasn't a dictionary (%@): %@",  (uint8_t *)&v8);
}

void sub_100032380(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 141558531;
  uint64_t v5 = 1752392040LL;
  __int16 v6 = 2113;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Migrating key <(%{private, mask.hash}@)> for store <(%@)>",  (uint8_t *)&v4,  0x20u);
}

void sub_10003241C()
{
}

void sub_100032480()
{
}

void sub_1000324E4()
{
}

void sub_100032544()
{
}

void sub_100032570(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "No KVS entitlements for bundle %@", v5);

  sub_10000A2F8();
}

void sub_1000325F0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  sub_100005030();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "No bundle identifier for bundle %@", v4, 0xCu);

  sub_10000A2F8();
}

void sub_100032678(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Using uncontainerized Library directory for %@", v5);

  sub_10000A2F8();
}

void sub_1000326F8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Checking for plist URLs from bundle: %@", v5);

  sub_10000A2F8();
}

void sub_100032778()
{
}

void sub_1000327A4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003280C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032874()
{
}

void sub_1000328D4()
{
}

void sub_100032900()
{
}

void sub_100032960()
{
}

void sub_1000329C0()
{
}

void sub_100032A20()
{
}

void sub_100032A80()
{
}

void sub_100032AE0(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 key]);
  sub_10002A770();
  uint64_t v7 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "SYDManagedKeyValue for key <(%{private, mask.hash}@)> is missing a store identifier. Manually setting store identifier <(%@)>",  v6,  0x20u);
}

void sub_100032B80(_BYTE *a1, _BYTE *a2)
{
}

void sub_100032BAC(_BYTE *a1, _BYTE *a2)
{
}

void sub_100032BD8()
{
}

void sub_100032C38()
{
}

void sub_100032C9C()
{
}

void sub_100032CFC()
{
}

void sub_100032D5C()
{
}

void sub_100032DBC()
{
}

void sub_100032E1C()
{
}

void sub_100032E7C()
{
}

void sub_100032EDC()
{
}

void sub_100032F3C()
{
}

void sub_100032F68()
{
}

void sub_100032FC8()
{
}

void sub_100033028()
{
}

void sub_100033088()
{
}

void sub_1000330B4()
{
}

void sub_100033114()
{
}

void sub_100033174()
{
}

void sub_1000331D4()
{
}

void sub_100033234()
{
}

void sub_100033294()
{
}

void sub_1000332F4()
{
}

void sub_100033354()
{
}

void sub_1000333B4()
{
}

void sub_100033414()
{
}

void sub_100033474()
{
}

void sub_1000334D4(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 predicate]);
  sub_100020434();
  sub_100018740((void *)&_mh_execute_header, a3, v5, "Error fetching count of key values with predicate %@: %@", v6);

  sub_10000A2DC();
}

void sub_100033568()
{
}

void sub_1000335C8()
{
}

void sub_1000335F4()
{
}

void sub_100033654(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = a1;
  sub_1000186DC((void *)&_mh_execute_header, a4, a3, "Found %ld changed keys for store <(%@)>", (uint8_t *)a2);
}

void sub_1000336A0()
{
}

void sub_100033718()
{
}

void sub_100033778(_BYTE *a1, _BYTE *a2)
{
}

void sub_1000337AC(uint8_t *a1, uint64_t a2, void *a3, os_log_s *a4)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8LL) + 40LL);
  *(_DWORD *)a1 = 138412290;
  *a3 = v4;
  sub_1000186F8( (void *)&_mh_execute_header,  a4,  (uint64_t)a3,  "Error fetching store properties when validating deleted keys: %@",  a1);
}

void sub_1000337F8(_BYTE *a1, _BYTE *a2)
{
}

void sub_10003382C(void *a1, uint64_t a2, os_log_s *a3)
{
}

void sub_1000338A8(void *a1, os_log_s *a2)
{
  uint64_t v4 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSPersistentHistoryTransaction);
  uint64_t v5 = NSStringFromClass(v4);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 firstObject]);
  __int16 v8 = (objc_class *)objc_opt_class(v7);
  uint64_t v9 = NSStringFromClass(v8);
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  int v12 = 138412546;
  __int16 v13 = v6;
  __int16 v14 = 2112;
  __int16 v15 = v10;
  sub_100018740((void *)&_mh_execute_header, a2, v11, "Expected a list of %@, but got %@", (uint8_t *)&v12);

  sub_10000A2DC();
}

void sub_100033974(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class(a1);
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100005030();
  sub_1000186F8((void *)&_mh_execute_header, a2, v6, "Received unexpected type of persistent history result (%@)", v7);

  sub_10000A2F8();
}

void sub_1000339F8()
{
}

void sub_100033A58()
{
}

void sub_100033AB8()
{
}

void sub_100033AE4()
{
}

void sub_100033B44()
{
}

void sub_100033B70()
{
}

void sub_100033BD0()
{
}

void sub_100033BFC()
{
}

void sub_100033C5C()
{
  sub_10002A734((void *)&_mh_execute_header, v0, v1, "About to set didMigrateFromPlists=%d", v2, v3, v4, v5, v6);
  sub_10000503C();
}

void sub_100033CC0()
{
  sub_10002A734((void *)&_mh_execute_header, v0, v1, "Saving didMigrateFromPlists=%d", v2, v3, v4, v5, v6);
  sub_10000503C();
}

void sub_100033D24()
{
}

void sub_100033D84()
{
  sub_10002A734((void *)&_mh_execute_header, v0, v1, "About to set failedMigrationCount=%d", v2, v3, v4, v5, v6);
  sub_10000503C();
}

void sub_100033DE8()
{
  sub_10002A734((void *)&_mh_execute_header, v0, v1, "Saving failedMigrationCount=%d", v2, v3, v4, v5, v6);
  sub_10000503C();
}

void sub_100033E4C()
{
}

void sub_100033EAC()
{
}

void sub_100033F0C()
{
}

void sub_100033F6C(void *a1, os_log_s *a2)
{
  sub_10001866C((void *)&_mh_execute_header, a2, v3, "Saving sync engine metadata serialization (length=%ld)", v4);
  sub_10000A2F8();
}

void sub_100033FE0()
{
}

void sub_10003400C(void *a1, os_log_s *a2)
{
  sub_10001866C((void *)&_mh_execute_header, a2, v3, "Saving deprecated sync engine metadata (length=%ld)", v4);
  sub_10000A2F8();
}

void sub_100034080()
{
}

void sub_1000340AC()
{
}

void sub_10003410C()
{
}

void sub_10003416C()
{
}

void sub_1000341CC()
{
}

void sub_10003422C()
{
}

void sub_10003428C()
{
}

void sub_1000342EC()
{
}

void sub_10003434C()
{
}

void sub_1000343AC()
{
}

void sub_10003440C()
{
}

void sub_10003446C()
{
}

void sub_1000344DC()
{
}

void sub_10003453C()
{
}

void sub_100034568()
{
}

void sub_100034594()
{
}

void sub_1000345F4()
{
}

void sub_100034654()
{
}

void sub_1000346B4()
{
}

void sub_100034714()
{
}

void sub_100034740()
{
}

void sub_1000347A0()
{
}

void sub_1000347CC()
{
}

void sub_1000347F8()
{
}

void sub_100034824()
{
}

void sub_100034850()
{
}

void sub_1000348B0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 URL]);
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Destroyed persistent store at %@", v5);

  sub_10000A2F8();
}

void sub_100034930()
{
}

void sub_100034990(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 URL]);
  sub_100005030();
  sub_10001866C((void *)&_mh_execute_header, a2, v4, "Destroying persistent store at %@", v5);

  sub_10000A2F8();
}

void sub_100034A10()
{
}

void sub_100034A7C()
{
}

void sub_100034ADC()
{
}

void sub_100034B08()
{
}

void sub_100034B34()
{
}

void sub_100034B94()
{
}

void sub_100034BF4()
{
}

void sub_100034C54()
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_URLHostAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLHostAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__contextForStoreIdentifier_persistentContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contextForStoreIdentifier:persistentContainer:");
}

id objc_msgSend__markZoneForDeletionOnManateeFailureForRecordZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markZoneForDeletionOnManateeFailureForRecordZoneID:");
}

id objc_msgSend__queue_allSyncManagers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_allSyncManagers");
}

id objc_msgSend__queue_destroyPersistentStoreInPersistentStoreCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_destroyPersistentStoreInPersistentStoreCoordinator:");
}

id objc_msgSend__queue_handleCorruptionIfNecessaryFromError_inPersistentStoreCoordinator_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:");
}

id objc_msgSend__queue_resetSyncEngine(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_resetSyncEngine");
}

id objc_msgSend__saveKeyValues_excludeFromChangeTracking_enforceQuota_forceCreateNewRow_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveKeyValues:excludeFromChangeTracking:enforceQuota:forceCreateNewRow:error:");
}

id objc_msgSend__unboostingRemoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 _unboostingRemoteObjectProxy];
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_acAccountIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 acAccountIdentifier];
}

id objc_msgSend_acAccountIdentifierWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acAccountIdentifierWithError:");
}

id objc_msgSend_accountChangeEvent(void *a1, const char *a2, ...)
{
  return _[a1 accountChangeEvent];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accountsWithAccountTypeIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:");
}

id objc_msgSend_addKeyValueRecordIDsToSave_recordIDsToDelete_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addPendingDatabaseChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingDatabaseChanges:");
}

id objc_msgSend_addPendingDatabaseChanges_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingDatabaseChanges:storeIdentifier:");
}

id objc_msgSend_addPendingRecordZoneChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingRecordZoneChanges:");
}

id objc_msgSend_addPlistURLsAndStoreIdentifiersForBundleRecord_toDictionary_uncontainerizedSyncedPreferencesDirectoryURL_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "addPlistURLsAndStoreIdentifiersForBundleRecord:toDictionary:uncontainerizedSyncedPreferencesDirectoryURL:");
}

id objc_msgSend_addPlistURLsAndStoreIdentifiersForKnownDaemonsToDictionary_uncontainerizedSyncedPreferencesDirectoryURL_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "addPlistURLsAndStoreIdentifiersForKnownDaemonsToDictionary:uncontainerizedSyncedPreferencesDirectoryURL:");
}

id objc_msgSend_addPlistURLsForBundleIdentifier_defaultStoreIdentifier_additionalStoreIdentifiers_toDictionary_syncedPreferencesDirectoryURL_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "addPlistURLsForBundleIdentifier:defaultStoreIdentifier:additionalStoreIdentifiers:toDictionary:syncedPreferen cesDirectoryURL:");
}

id objc_msgSend_addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allPossibleStorePlistURLsWithLibraryDirectoryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPossibleStorePlistURLsWithLibraryDirectoryURL:");
}

id objc_msgSend_allRecordNamesInStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allRecordNamesInStoreWithIdentifier:error:");
}

id objc_msgSend_allStoreIdentifiersWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allStoreIdentifiersWithError:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_alwaysSaveRecordZones(void *a1, const char *a2, ...)
{
  return _[a1 alwaysSaveRecordZones];
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 applicationIdentifier];
}

id objc_msgSend_applicationIdentifiersForStoreIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIdentifiersForStoreIdentifiers:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetContent(void *a1, const char *a2, ...)
{
  return _[a1 assetContent];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleIdentifiersForStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifiersForStoreIdentifier:");
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_cachedDisabledStoreIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 cachedDisabledStoreIdentifiers];
}

id objc_msgSend_cachedStoreBundleMap(void *a1, const char *a2, ...)
{
  return _[a1 cachedStoreBundleMap];
}

id objc_msgSend_callbackQueue(void *a1, const char *a2, ...)
{
  return _[a1 callbackQueue];
}

id objc_msgSend_changeDictionaryWithChangedKeys_reason_changeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeDictionaryWithChangedKeys:reason:changeToken:");
}

id objc_msgSend_changeTokenURLForStoreConfiguration_xpcConnection_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeTokenURLForStoreConfiguration:xpcConnection:error:");
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return _[a1 changeType];
}

id objc_msgSend_changedKeysForStoreIdentifier_sinceChangeToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changedKeysForStoreIdentifier:sinceChangeToken:error:");
}

id objc_msgSend_changedKeysForStoreIdentifier_sinceChangeTokenIfValid_inCoreDataStore_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changedKeysForStoreIdentifier:sinceChangeTokenIfValid:inCoreDataStore:error:");
}

id objc_msgSend_changedObjectID(void *a1, const char *a2, ...)
{
  return _[a1 changedObjectID];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return _[a1 changes];
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_clearCachedStoreBundleMap(void *a1, const char *a2, ...)
{
  return _[a1 clearCachedStoreBundleMap];
}

id objc_msgSend_clearContexts(void *a1, const char *a2, ...)
{
  return _[a1 clearContexts];
}

id objc_msgSend_clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:error:");
}

id objc_msgSend_clearServerSystemFieldsRecordsForAllStoresWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearServerSystemFieldsRecordsForAllStoresWithError:");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientConnections(void *a1, const char *a2, ...)
{
  return _[a1 clientConnections];
}

id objc_msgSend_clientProtocolInterface(void *a1, const char *a2, ...)
{
  return _[a1 clientProtocolInterface];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_connection_syncManagerForStoreID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection:syncManagerForStoreID:error:");
}

id objc_msgSend_connectionDidInvalidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionDidInvalidate:");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return _[a1 container];
}

id objc_msgSend_containerForStoreType_containerID_testConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerForStoreType:containerID:testConfiguration:");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return _[a1 containerID];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 containerIdentifier];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsRecordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsRecordID:");
}

id objc_msgSend_contextForStoreIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextForStoreIdentifier:error:");
}

id objc_msgSend_contexts(void *a1, const char *a2, ...)
{
  return _[a1 contexts];
}

id objc_msgSend_contextsLock(void *a1, const char *a2, ...)
{
  return _[a1 contextsLock];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyCurrentPersonaContextWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCurrentPersonaContextWithError:");
}

id objc_msgSend_coreDataStore(void *a1, const char *a2, ...)
{
  return _[a1 coreDataStore];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForFetchRequest:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_currentChangeTokenForStoreIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentChangeTokenForStoreIdentifier:error:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentPersistentHistoryTokenFromStores_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPersistentHistoryTokenFromStores:");
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return _[a1 currentPersona];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _[a1 currentUser];
}

id objc_msgSend_daemonProtocolInterface(void *a1, const char *a2, ...)
{
  return _[a1 daemonProtocolInterface];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 dataContainerURL];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return _[a1 database];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decrementManualSyncCount(void *a1, const char *a2, ...)
{
  return _[a1 decrementManualSyncCount];
}

id objc_msgSend_deduplicateRecordForKeyValue_withNewlyFetchedRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deduplicateRecordForKeyValue:withNewlyFetchedRecord:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultConfiguration];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteDataForAllStoresWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteDataForAllStoresWithError:");
}

id objc_msgSend_deleteDataForStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteDataForStoreWithIdentifier:error:");
}

id objc_msgSend_deleteDataForStoresMatchingPredicate_context_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteDataForStoresMatchingPredicate:context:error:");
}

id objc_msgSend_deleteFilesForAssetsInKeyValueRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteFilesForAssetsInKeyValueRecord:");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_deletedRecordIDs(void *a1, const char *a2, ...)
{
  return _[a1 deletedRecordIDs];
}

id objc_msgSend_deletedZoneIDs(void *a1, const char *a2, ...)
{
  return _[a1 deletedZoneIDs];
}

id objc_msgSend_deletions(void *a1, const char *a2, ...)
{
  return _[a1 deletions];
}

id objc_msgSend_deprecatedSyncEngineMetadataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deprecatedSyncEngineMetadataWithError:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_destroyPersistentStore(void *a1, const char *a2, ...)
{
  return _[a1 destroyPersistentStore];
}

id objc_msgSend_destroyPersistentStoreAtURL_withType_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyPersistentStoreAtURL:withType:options:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentationForStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryRepresentationForStoreWithIdentifier:error:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didDeleteRecordWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDeleteRecordWithID:");
}

id objc_msgSend_didDeleteRecordZoneWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDeleteRecordZoneWithID:");
}

id objc_msgSend_didEndFetchingChanges(void *a1, const char *a2, ...)
{
  return _[a1 didEndFetchingChanges];
}

id objc_msgSend_didFailToFetchChangesForRecordZoneID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFailToFetchChangesForRecordZoneID:error:");
}

id objc_msgSend_didFailToSaveRecord_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFailToSaveRecord:error:");
}

id objc_msgSend_didFetchRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchRecord:");
}

id objc_msgSend_didFetchRecordDeletion_recordType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchRecordDeletion:recordType:");
}

id objc_msgSend_didFetchRecordZoneChangesEvent(void *a1, const char *a2, ...)
{
  return _[a1 didFetchRecordZoneChangesEvent];
}

id objc_msgSend_didMigrateFromPlists(void *a1, const char *a2, ...)
{
  return _[a1 didMigrateFromPlists];
}

id objc_msgSend_didMigrateFromPlistsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMigrateFromPlistsWithError:");
}

id objc_msgSend_didRefreshBundleMap(void *a1, const char *a2, ...)
{
  return _[a1 didRefreshBundleMap];
}

id objc_msgSend_didSaveRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSaveRecord:");
}

id objc_msgSend_disabledStoreIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 disabledStoreIdentifiers];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_effectiveBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 effectiveBundleIdentifier];
}

id objc_msgSend_enableUbiquityIfNecessaryForAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableUbiquityIfNecessaryForAuditToken:");
}

id objc_msgSend_encodeSystemFieldsWithCoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeSystemFieldsWithCoder:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _[a1 encodedData];
}

id objc_msgSend_encryptedValues(void *a1, const char *a2, ...)
{
  return _[a1 encryptedValues];
}

id objc_msgSend_engine(void *a1, const char *a2, ...)
{
  return _[a1 engine];
}

id objc_msgSend_engineWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engineWithError:");
}

id objc_msgSend_entitledStoreIDs(void *a1, const char *a2, ...)
{
  return _[a1 entitledStoreIDs];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return _[a1 entitlements];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return _[a1 entity];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorForUnknownStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorForUnknownStore:");
}

id objc_msgSend_errorNotEntitledForStoreConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorNotEntitledForStoreConfiguration:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_excludedZoneIDs(void *a1, const char *a2, ...)
{
  return _[a1 excludedZoneIDs];
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "execute:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_executeRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeRequest:error:");
}

id objc_msgSend_failedMigrationCount(void *a1, const char *a2, ...)
{
  return _[a1 failedMigrationCount];
}

id objc_msgSend_failedMigrationCountWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedMigrationCountWithError:");
}

id objc_msgSend_failedRecordDeletes(void *a1, const char *a2, ...)
{
  return _[a1 failedRecordDeletes];
}

id objc_msgSend_failedRecordSaves(void *a1, const char *a2, ...)
{
  return _[a1 failedRecordSaves];
}

id objc_msgSend_failedToSaveKeyValueRecord_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedToSaveKeyValueRecord:error:");
}

id objc_msgSend_fetchAllRecordZonesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAllRecordZonesWithCompletionHandler:");
}

id objc_msgSend_fetchChangesFromCloudForAllStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangesFromCloudForAllStoresWithCompletionHandler:");
}

id objc_msgSend_fetchChangesFromCloudForStoreIdentifiers_group_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangesFromCloudForStoreIdentifiers:group:completionHandler:");
}

id objc_msgSend_fetchChangesWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangesWithOptions:completionHandler:");
}

id objc_msgSend_fetchHistoryAfterToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchHistoryAfterToken:");
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return _[a1 fetchRequest];
}

id objc_msgSend_fetchedDatabaseChangesEvent(void *a1, const char *a2, ...)
{
  return _[a1 fetchedDatabaseChangesEvent];
}

id objc_msgSend_fetchedRecordZoneChangesEvent(void *a1, const char *a2, ...)
{
  return _[a1 fetchedRecordZoneChangesEvent];
}

id objc_msgSend_fileProtectionType(void *a1, const char *a2, ...)
{
  return _[a1 fileProtectionType];
}

id objc_msgSend_fileSizeBytes(void *a1, const char *a2, ...)
{
  return _[a1 fileSizeBytes];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return _[a1 fileURL];
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_findDisabledStoreIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 findDisabledStoreIdentifiers];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_generateAndRestorePersonaContextWithPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAndRestorePersonaContextWithPersonaUniqueString:");
}

id objc_msgSend_generateStoreBundleMap(void *a1, const char *a2, ...)
{
  return _[a1 generateStoreBundleMap];
}

id objc_msgSend_generateStoreBundleMapIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 generateStoreBundleMapIfNecessary];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return _[a1 gid];
}

id objc_msgSend_handleCorruptionIfNecessaryFromError_inPersistentStoreCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleSyncEngineStateUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSyncEngineStateUpdate:");
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return _[a1 hasChanges];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ignoreQuotaEntitlementValue(void *a1, const char *a2, ...)
{
  return _[a1 ignoreQuotaEntitlementValue];
}

id objc_msgSend_incrementManualSyncCount(void *a1, const char *a2, ...)
{
  return _[a1 incrementManualSyncCount];
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithAssetContent_itemTypeHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetContent:itemTypeHint:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCoder:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithContainer_coreDataStore_storeType_testConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainer:coreDataStore:storeType:testConfiguration:");
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerID:options:");
}

id objc_msgSend_initWithContainerIdentifier_environment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerIdentifier:environment:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDatabase_stateSerialization_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabase:stateSerialization:delegate:");
}

id objc_msgSend_initWithDeprecatedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeprecatedData:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntity:");
}

id objc_msgSend_initWithExcludedZoneIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExcludedZoneIDs:");
}

id objc_msgSend_initWithFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithIdentifier_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:type:");
}

id objc_msgSend_initWithKey_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:storeIdentifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_managedObjectModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:managedObjectModel:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPendingChanges_recordProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPendingChanges:recordProvider:");
}

id objc_msgSend_initWithRecordID_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordID:type:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordType:recordID:");
}

id objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordZonesToSave:recordZoneIDsToDelete:");
}

id objc_msgSend_initWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScope:");
}

id objc_msgSend_initWithStoreID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStoreID:");
}

id objc_msgSend_initWithTestServerName_testDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestServerName:testDeviceID:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_fileProtectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:fileProtectionType:");
}

id objc_msgSend_initWithURL_fileProtectionType_persistentContainer_isTransactional_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:fileProtectionType:persistentContainer:isTransactional:");
}

id objc_msgSend_initWithXPCConnection_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCConnection:delegate:");
}

id objc_msgSend_initWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZone:");
}

id objc_msgSend_initWithZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneID:");
}

id objc_msgSend_initWithZoneIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneIDs:");
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneName:ownerName:");
}

id objc_msgSend_initializeKnownSyncManagers(void *a1, const char *a2, ...)
{
  return _[a1 initializeKnownSyncManagers];
}

id objc_msgSend_initializeSyncEngineWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeSyncEngineWithError:");
}

id objc_msgSend_inputStreamWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStreamWithURL:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_isAutomaticSyncingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticSyncingEnabled];
}

id objc_msgSend_isCloudSyncEnablementEntitledForStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCloudSyncEnablementEntitledForStoreIdentifier:");
}

id objc_msgSend_isCloudSyncUserDefaultEnabledForStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCloudSyncUserDefaultEnabledForStoreIdentifier:");
}

id objc_msgSend_isCorruptionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCorruptionError:");
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return _[a1 isDataSeparatedPersona];
}

id objc_msgSend_isEntitledForStoreConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEntitledForStoreConfiguration:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isIdentityLostError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIdentityLostError:");
}

id objc_msgSend_isInitializingSyncManagers(void *a1, const char *a2, ...)
{
  return _[a1 isInitializingSyncManagers];
}

id objc_msgSend_isInserted(void *a1, const char *a2, ...)
{
  return _[a1 isInserted];
}

id objc_msgSend_isInvalidTokenError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInvalidTokenError:");
}

id objc_msgSend_isKnownStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKnownStore:");
}

id objc_msgSend_isPerformingManualSync(void *a1, const char *a2, ...)
{
  return _[a1 isPerformingManualSync];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return _[a1 isSharedIPad];
}

id objc_msgSend_isStoreIdentifierUsedOnThisDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStoreIdentifierUsedOnThisDevice:");
}

id objc_msgSend_isUbiquityDisabledForStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUbiquityDisabledForStoreIdentifier:");
}

id objc_msgSend_isXPCConnection_entitledForStoreConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isXPCConnection:entitledForStoreConfiguration:");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyFromKeyValueRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyFromKeyValueRecord:");
}

id objc_msgSend_keyFromUnencryptedKeyValueRecordName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyFromUnencryptedKeyValueRecordName:");
}

id objc_msgSend_keyID(void *a1, const char *a2, ...)
{
  return _[a1 keyID];
}

id objc_msgSend_keyValueForKey_inStoreWithIdentifier_createIfNecessary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueForKey:inStoreWithIdentifier:createIfNecessary:error:");
}

id objc_msgSend_keyValueForRecordName_inStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueForRecordName:inStoreWithIdentifier:error:");
}

id objc_msgSend_keyValueFromManagedKeyValue_inStoreWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueFromManagedKeyValue:inStoreWithIdentifier:");
}

id objc_msgSend_keyValueRecordHasAssetWithoutFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueRecordHasAssetWithoutFile:");
}

id objc_msgSend_keyValueStorePlistFromURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStorePlistFromURL:error:");
}

id objc_msgSend_keyValues(void *a1, const char *a2, ...)
{
  return _[a1 keyValues];
}

id objc_msgSend_keyValuesForKeyIDs_createIfNecessary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValuesForKeyIDs:createIfNecessary:error:");
}

id objc_msgSend_knownDaemons(void *a1, const char *a2, ...)
{
  return _[a1 knownDaemons];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_listAllPersonaWithAttributes(void *a1, const char *a2, ...)
{
  return _[a1 listAllPersonaWithAttributes];
}

id objc_msgSend_loadPersistentStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadPersistentStoresWithCompletionHandler:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_managedDatabaseCreateIfNecessary_inContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedDatabaseCreateIfNecessary:inContext:error:");
}

id objc_msgSend_managedKeyValueWithRecordName_inStoreWithIdentifier_inContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedKeyValueWithRecordName:inStoreWithIdentifier:inContext:error:");
}

id objc_msgSend_managedKeyValuesForKeyIDs_inContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedKeyValuesForKeyIDs:inContext:error:");
}

id objc_msgSend_managedKeyValuesMatchingPredicate_inContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedKeyValuesMatchingPredicate:inContext:error:");
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectModel];
}

id objc_msgSend_managedStoreWithIdentifier_createIfNecessary_inContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedStoreWithIdentifier:createIfNecessary:inContext:error:");
}

id objc_msgSend_manualSyncCount(void *a1, const char *a2, ...)
{
  return _[a1 manualSyncCount];
}

id objc_msgSend_markAllKeyValuesAsNeedingToBeUploaded(void *a1, const char *a2, ...)
{
  return _[a1 markAllKeyValuesAsNeedingToBeUploaded];
}

id objc_msgSend_markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:");
}

id objc_msgSend_markForDeletion(void *a1, const char *a2, ...)
{
  return _[a1 markForDeletion];
}

id objc_msgSend_maxPendingFetchedRecords(void *a1, const char *a2, ...)
{
  return _[a1 maxPendingFetchedRecords];
}

id objc_msgSend_mergeDataFromRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeDataFromRecord:");
}

id objc_msgSend_migrateAllPlistsIfNecessaryToCoreDataStore_deleteMigratedPlists_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateAllPlistsIfNecessaryToCoreDataStore:deleteMigratedPlists:error:");
}

id objc_msgSend_migrateAllPlistsIfNecessaryToCoreDataStore_deleteMigratedPlists_libraryDirectoryURL_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateAllPlistsIfNecessaryToCoreDataStore:deleteMigratedPlists:libraryDirectoryURL:error:");
}

id objc_msgSend_migrateAllPlistsToCoreDataStore_deleteMigratedPlists_libraryDirectoryURL_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateAllPlistsToCoreDataStore:deleteMigratedPlists:libraryDirectoryURL:error:");
}

id objc_msgSend_migratePlist_forStoreWithIdentifier_toCoreDataStore_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migratePlist:forStoreWithIdentifier:toCoreDataStore:error:");
}

id objc_msgSend_mobileKeybagNotifyToken(void *a1, const char *a2, ...)
{
  return _[a1 mobileKeybagNotifyToken];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return _[a1 modificationDate];
}

id objc_msgSend_modifications(void *a1, const char *a2, ...)
{
  return _[a1 modifications];
}

id objc_msgSend_modifiedByDevice(void *a1, const char *a2, ...)
{
  return _[a1 modifiedByDevice];
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return _[a1 newBackgroundContext];
}

id objc_msgSend_newRecordNameForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newRecordNameForKey:");
}

id objc_msgSend_notEntitledStoreIDs(void *a1, const char *a2, ...)
{
  return _[a1 notEntitledStoreIDs];
}

id objc_msgSend_notifyAccountDidChangeFromAccountID_toAccountID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyAccountDidChangeFromAccountID:toAccountID:completionHandler:");
}

id objc_msgSend_notifyToken(void *a1, const char *a2, ...)
{
  return _[a1 notifyToken];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfKeyValuesInStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfKeyValuesInStoreWithIdentifier:error:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_inStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:inStoreWithIdentifier:error:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKey_ofClass_valuesOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:valuesOfClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pendingDatabaseChanges(void *a1, const char *a2, ...)
{
  return _[a1 pendingDatabaseChanges];
}

id objc_msgSend_pendingDeletedRecordIDs(void *a1, const char *a2, ...)
{
  return _[a1 pendingDeletedRecordIDs];
}

id objc_msgSend_pendingFetchedRecords(void *a1, const char *a2, ...)
{
  return _[a1 pendingFetchedRecords];
}

id objc_msgSend_pendingRecordZoneChanges(void *a1, const char *a2, ...)
{
  return _[a1 pendingRecordZoneChanges];
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_persistentContainerQueue(void *a1, const char *a2, ...)
{
  return _[a1 persistentContainerQueue];
}

id objc_msgSend_persistentContainerWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentContainerWithError:");
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return _[a1 persistentStores];
}

id objc_msgSend_personaAttributesForPersonaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personaAttributesForPersonaType:");
}

id objc_msgSend_personaAttributesForPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personaAttributesForPersonaUniqueString:");
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 personaIdentifier];
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 personaUniqueString];
}

id objc_msgSend_plistDataLength(void *a1, const char *a2, ...)
{
  return _[a1 plistDataLength];
}

id objc_msgSend_plistDataValue(void *a1, const char *a2, ...)
{
  return _[a1 plistDataValue];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _[a1 predicate];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_previousUser(void *a1, const char *a2, ...)
{
  return _[a1 previousUser];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return _[a1 privateCloudDatabase];
}

id objc_msgSend_processAccountChanges(void *a1, const char *a2, ...)
{
  return _[a1 processAccountChanges];
}

id objc_msgSend_processFetchedRecords_deletedRecordIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processFetchedRecords:deletedRecordIDs:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_processPendingFetchedRecordsWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPendingFetchedRecordsWithReason:");
}

id objc_msgSend_propertyList_isValidForFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyList:isValidForFormat:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_propertyListWithStream_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithStream:options:format:error:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_record(void *a1, const char *a2, ...)
{
  return _[a1 record];
}

id objc_msgSend_recordChangeTag(void *a1, const char *a2, ...)
{
  return _[a1 recordChangeTag];
}

id objc_msgSend_recordFieldKeyForValueModificationDateInStoreType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordFieldKeyForValueModificationDateInStoreType:");
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return _[a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return _[a1 recordName];
}

id objc_msgSend_recordNameForUnencryptedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordNameForUnencryptedKey:");
}

id objc_msgSend_recordRepresentationForStoreType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordRepresentationForStoreType:");
}

id objc_msgSend_recordToSaveForRecordID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordToSaveForRecordID:error:");
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return _[a1 recordType];
}

id objc_msgSend_refreshObject_mergeChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshObject:mergeChanges:");
}

id objc_msgSend_registerForFirstUnlockNotificationsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 registerForFirstUnlockNotificationsIfNecessary];
}

id objc_msgSend_registerForPeriodAnalyticsXPCActivity(void *a1, const char *a2, ...)
{
  return _[a1 registerForPeriodAnalyticsXPCActivity];
}

id objc_msgSend_registeredStoreIDs(void *a1, const char *a2, ...)
{
  return _[a1 registeredStoreIDs];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeInvalidSyncManagers(void *a1, const char *a2, ...)
{
  return _[a1 removeInvalidSyncManagers];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeKeyValueForKey_inStoreWithIdentifier_excludeFromChangeTracking_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKeyValueForKey:inStoreWithIdentifier:excludeFromChangeTracking:error:");
}

id objc_msgSend_removeKeyValueForRecordName_inStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKeyValueForRecordName:inStoreWithIdentifier:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectForKey_inStoreWithIdentifier_excludeFromChangeTracking_didRemoveValue_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:inStoreWithIdentifier:excludeFromChangeTracking:didRemoveValue:error:");
}

id objc_msgSend_removeObjectForKey_inStoreWithIdentifier_excludeFromChangeTracking_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:inStoreWithIdentifier:excludeFromChangeTracking:error:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removePendingRecordZoneChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingRecordZoneChanges:");
}

id objc_msgSend_requestAuthorizationIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 requestAuthorizationIfNecessary];
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthorizationWithOptions:completionHandler:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_resetSyncEngineWithContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetSyncEngineWithContainer:");
}

id objc_msgSend_restorePersonaWithSavedPersonaContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restorePersonaWithSavedPersonaContext:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _[a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "save:");
}

id objc_msgSend_saveContext_reason_includingTransactionContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveContext:reason:includingTransactionContext:error:");
}

id objc_msgSend_saveKeyValue_inStoreWithIdentifier_excludeFromChangeTracking_enforceQuota_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveKeyValue:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:error:");
}

id objc_msgSend_saveKeyValues_excludeFromChangeTracking_enforceQuota_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveKeyValues:excludeFromChangeTracking:enforceQuota:error:");
}

id objc_msgSend_savePendingChangesToCloudForAllStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savePendingChangesToCloudForAllStoresWithCompletionHandler:");
}

id objc_msgSend_savePendingChangesToCloudForStoreIdentifiers_group_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savePendingChangesToCloudForStoreIdentifiers:group:completionHandler:");
}

id objc_msgSend_saveServerSyncAnchorSystemFieldsRecordData_forStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveServerSyncAnchorSystemFieldsRecordData:forStoreWithIdentifier:error:");
}

id objc_msgSend_saveSyncAnchorSystemFieldsRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSyncAnchorSystemFieldsRecord:");
}

id objc_msgSend_saveSyncEngineStateSerialization_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSyncEngineStateSerialization:error:");
}

id objc_msgSend_saveTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveTransaction:");
}

id objc_msgSend_savedRecords(void *a1, const char *a2, ...)
{
  return _[a1 savedRecords];
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return _[a1 scope];
}

id objc_msgSend_sendAnalyticsEventForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 sendAnalyticsEventForCurrentState];
}

id objc_msgSend_sendChangesWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendChangesWithOptions:completionHandler:");
}

id objc_msgSend_sentDatabaseChangesEvent(void *a1, const char *a2, ...)
{
  return _[a1 sentDatabaseChangesEvent];
}

id objc_msgSend_sentRecordZoneChangesEvent(void *a1, const char *a2, ...)
{
  return _[a1 sentRecordZoneChangesEvent];
}

id objc_msgSend_serverSyncAnchorSystemFieldsRecordDataForStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverSyncAnchorSystemFieldsRecordDataForStoreWithIdentifier:error:");
}

id objc_msgSend_serverSystemFieldsRecord(void *a1, const char *a2, ...)
{
  return _[a1 serverSystemFieldsRecord];
}

id objc_msgSend_serverSystemFieldsRecordData(void *a1, const char *a2, ...)
{
  return _[a1 serverSystemFieldsRecordData];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setACAccountIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setACAccountIdentifier:error:");
}

id objc_msgSend_setAcAccountIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcAccountIdentifier:");
}

id objc_msgSend_setApsMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApsMachServiceName:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAutomaticSyncingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticSyncingEnabled:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCachedDisabledStoreIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedDisabledStoreIdentifiers:");
}

id objc_msgSend_setCachedStoreBundleMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedStoreBundleMap:");
}

id objc_msgSend_setCloudSyncUserDefaultEnabled_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncUserDefaultEnabled:storeIdentifier:");
}

id objc_msgSend_setContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainer:");
}

id objc_msgSend_setDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabase:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDidMigrateFromPlists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidMigrateFromPlists:");
}

id objc_msgSend_setDidMigrateFromPlists_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidMigrateFromPlists:error:");
}

id objc_msgSend_setDidRefreshBundleMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidRefreshBundleMap:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFailedMigrationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailedMigrationCount:");
}

id objc_msgSend_setFailedMigrationCount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailedMigrationCount:error:");
}

id objc_msgSend_setFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchRequest:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIgnoreQuotaEntitlementValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreQuotaEntitlementValue:");
}

id objc_msgSend_setInitializingSyncManagers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializingSyncManagers:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsCloudKitSupportOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCloudKitSupportOperation:");
}

id objc_msgSend_setIsNewKeyValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsNewKeyValue:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setManualSyncCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManualSyncCount:");
}

id objc_msgSend_setMarkZonesAsUserPurged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMarkZonesAsUserPurged:");
}

id objc_msgSend_setMergePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMergePolicy:");
}

id objc_msgSend_setMobileKeybagNotifyToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMobileKeybagNotifyToken:");
}

id objc_msgSend_setModifyRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifyRecordZonesCompletionBlock:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsToReloadAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsToReloadAccount:");
}

id objc_msgSend_setNotEntitledStoreIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotEntitledStoreIDs:");
}

id objc_msgSend_setNotifyToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotifyToken:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKey_inStoreWithIdentifier_excludeFromChangeTracking_enforceQuota_didChangeValue_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "setObject:forKey:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:didChangeValue:error:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOperationGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperationGroup:");
}

id objc_msgSend_setOption_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOption:forKey:");
}

id objc_msgSend_setPersistentStoreDescriptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentStoreDescriptions:");
}

id objc_msgSend_setPersonaIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonaIdentifier:");
}

id objc_msgSend_setPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonaUniqueString:");
}

id objc_msgSend_setPlistDataLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlistDataLength:");
}

id objc_msgSend_setPlistDataValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlistDataValue:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesToFetch:");
}

id objc_msgSend_setPropertiesToUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesToUpdate:");
}

id objc_msgSend_setRecordName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordName:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setReturnsDistinctResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnsDistinctResults:");
}

id objc_msgSend_setScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScope:");
}

id objc_msgSend_setServerSystemFieldsRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerSystemFieldsRecord:");
}

id objc_msgSend_setServerSystemFieldsRecordData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerSystemFieldsRecordData:");
}

id objc_msgSend_setServerSystemFieldsRecordIfNewer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerSystemFieldsRecordIfNewer:");
}

id objc_msgSend_setShouldAddStoreAsynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAddStoreAsynchronously:");
}

id objc_msgSend_setShouldInferMappingModelAutomatically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldInferMappingModelAutomatically:");
}

id objc_msgSend_setShouldMigrateStoreAutomatically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldMigrateStoreAutomatically:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStore:");
}

id objc_msgSend_setSyncAnchorServerSystemFieldsRecordData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncAnchorServerSystemFieldsRecordData:");
}

id objc_msgSend_setSyncEngineMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncEngineMetadata:");
}

id objc_msgSend_setSyncEngineStateSerialization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncEngineStateSerialization:");
}

id objc_msgSend_setTestConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestConfiguration:");
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadIdentifier:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransactionAuthor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionAuthor:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUseClearAssetEncryption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseClearAssetEncryption:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_withModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:withModificationDate:");
}

id objc_msgSend_setValueModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueModificationDate:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setXpcListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcListener:");
}

id objc_msgSend_sharedHelper(void *a1, const char *a2, ...)
{
  return _[a1 sharedHelper];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_shouldEnforceQuotaForStoreConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldEnforceQuotaForStoreConfiguration:");
}

id objc_msgSend_shouldIgnoreFetchError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIgnoreFetchError:");
}

id objc_msgSend_shouldIncrementFailureCountForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIncrementFailureCountForError:");
}

id objc_msgSend_shouldRetryAfterModifyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRetryAfterModifyError:");
}

id objc_msgSend_shouldShowNotifications(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowNotifications];
}

id objc_msgSend_shouldStopMigrationAfterError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldStopMigrationAfterError:");
}

id objc_msgSend_shouldSyncStoreWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSyncStoreWithIdentifier:");
}

id objc_msgSend_shouldUseTransactionForPlistAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseTransactionForPlistAtURL:");
}

id objc_msgSend_showNotificationWithTitle_body_threadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showNotificationWithTitle:body:threadIdentifier:");
}

id objc_msgSend_showUserNotificationIfEnabledForStoreIdentifier_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showUserNotificationIfEnabledForStoreIdentifier:format:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startListeningToTCCAccessChangedNotifications(void *a1, const char *a2, ...)
{
  return _[a1 startListeningToTCCAccessChangedNotifications];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateSerialization(void *a1, const char *a2, ...)
{
  return _[a1 stateSerialization];
}

id objc_msgSend_stateUpdateEvent(void *a1, const char *a2, ...)
{
  return _[a1 stateUpdateEvent];
}

id objc_msgSend_stopListeningToTCCAccessChangedNotifications(void *a1, const char *a2, ...)
{
  return _[a1 stopListeningToTCCAccessChangedNotifications];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return _[a1 store];
}

id objc_msgSend_storeDidChangeWithStoreID_changeDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeDidChangeWithStoreID:changeDictionary:");
}

id objc_msgSend_storeID(void *a1, const char *a2, ...)
{
  return _[a1 storeID];
}

id objc_msgSend_storeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 storeIdentifier];
}

id objc_msgSend_storeIdentifiersForInstalledBundles(void *a1, const char *a2, ...)
{
  return _[a1 storeIdentifiersForInstalledBundles];
}

id objc_msgSend_storeIdentifiersWithChangedValuesDuringFetchChanges(void *a1, const char *a2, ...)
{
  return _[a1 storeIdentifiersWithChangedValuesDuringFetchChanges];
}

id objc_msgSend_storeType(void *a1, const char *a2, ...)
{
  return _[a1 storeType];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_syd_accountForCurrentPersonaWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syd_accountForCurrentPersonaWithError:");
}

id objc_msgSend_syd_accountForPersonaIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syd_accountForPersonaIdentifier:error:");
}

id objc_msgSend_syd_accountIdentifierForCurrentPersona(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syd_accountIdentifierForCurrentPersona");
}

id objc_msgSend_syd_shortDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syd_shortDescription");
}

id objc_msgSend_syncAnchorServerSystemFieldsRecordData(void *a1, const char *a2, ...)
{
  return _[a1 syncAnchorServerSystemFieldsRecordData];
}

id objc_msgSend_syncEngine_accountChangedFromUserRecordID_toUserRecordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncEngine:accountChangedFromUserRecordID:toUserRecordID:");
}

id objc_msgSend_syncEngineMetadata(void *a1, const char *a2, ...)
{
  return _[a1 syncEngineMetadata];
}

id objc_msgSend_syncEngineStateSerialization(void *a1, const char *a2, ...)
{
  return _[a1 syncEngineStateSerialization];
}

id objc_msgSend_syncEngineStateSerializationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncEngineStateSerializationWithError:");
}

id objc_msgSend_syncManager_shouldSyncStoreWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncManager:shouldSyncStoreWithIdentifier:");
}

id objc_msgSend_syncManagerForStoreType_containerID_testConfiguration_createIfNecessary_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncManagerForStoreType:containerID:testConfiguration:createIfNecessary:error:");
}

id objc_msgSend_syncManagerLookupKeyForCurrentPersonaWithTestConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncManagerLookupKeyForCurrentPersonaWithTestConfiguration:");
}

id objc_msgSend_syncManagersByPersona(void *a1, const char *a2, ...)
{
  return _[a1 syncManagersByPersona];
}

id objc_msgSend_synchronizeStoreWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_synchronizeStoresWithIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeStoresWithIdentifiers:completionHandler:");
}

id objc_msgSend_testConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 testConfiguration];
}

id objc_msgSend_testDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 testDeviceID];
}

id objc_msgSend_testServerName(void *a1, const char *a2, ...)
{
  return _[a1 testServerName];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tombstone(void *a1, const char *a2, ...)
{
  return _[a1 tombstone];
}

id objc_msgSend_totalDataLength(void *a1, const char *a2, ...)
{
  return _[a1 totalDataLength];
}

id objc_msgSend_transactionContext(void *a1, const char *a2, ...)
{
  return _[a1 transactionContext];
}

id objc_msgSend_transactionalStoreWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionalStoreWithError:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return _[a1 uid];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_updatedProperties(void *a1, const char *a2, ...)
{
  return _[a1 updatedProperties];
}

id objc_msgSend_useSyncAnchor(void *a1, const char *a2, ...)
{
  return _[a1 useSyncAnchor];
}

id objc_msgSend_useUUIDRecordNames(void *a1, const char *a2, ...)
{
  return _[a1 useUUIDRecordNames];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 userNotificationCenter];
}

id objc_msgSend_userPersonaType(void *a1, const char *a2, ...)
{
  return _[a1 userPersonaType];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 userPersonaUniqueString];
}

id objc_msgSend_validateKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateKey:error:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForEntitlement_xpcConnection_storeConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:xpcConnection:storeConfiguration:");
}

id objc_msgSend_valueModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 valueModificationDate];
}

id objc_msgSend_willBeginFetchingChanges(void *a1, const char *a2, ...)
{
  return _[a1 willBeginFetchingChanges];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnection];
}

id objc_msgSend_xpcListener(void *a1, const char *a2, ...)
{
  return _[a1 xpcListener];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return _[a1 zoneID];
}

id objc_msgSend_zoneIDs(void *a1, const char *a2, ...)
{
  return _[a1 zoneIDs];
}

id objc_msgSend_zoneIDsWithUnfetchedServerChanges(void *a1, const char *a2, ...)
{
  return _[a1 zoneIDsWithUnfetchedServerChanges];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return _[a1 zoneName];
}

id objc_msgSend_zoneWithIDWasPurged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zoneWithIDWasPurged:");
}