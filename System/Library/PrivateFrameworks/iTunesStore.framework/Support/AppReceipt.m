@interface AppReceipt
+ (BOOL)_writeReceipt:(id)a3 withContainerDirectory:(id)a4 style:(int64_t)a5;
+ (BOOL)writeReceipt:(id)a3 forBundleIdentifier:(id)a4 style:(int64_t)a5;
+ (BOOL)writeReceipt:(id)a3 forStoreKitClient:(id)a4;
@end

@implementation AppReceipt

+ (BOOL)writeReceipt:(id)a3 forBundleIdentifier:(id)a4 style:(int64_t)a5
{
  if (![a3 length] || !objc_msgSend(a4, "length"))
  {
    id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v16 = [v15 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    v18 = (os_log_s *)[v15 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if (!(_DWORD)v17) {
      return 0;
    }
    int v46 = 138412546;
    uint64_t v47 = objc_opt_class(a1);
    __int16 v48 = 2112;
    id v49 = a4;
    uint64_t v19 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[%@] No receipt data for: %@",  &v46,  22);
    goto LABEL_18;
  }

  id v9 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  a4);
  if (!v9)
  {
    id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v23 = [v15 shouldLog];
    else {
      LODWORD(v24) = v23;
    }
    v25 = (os_log_s *)[v15 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v24 = v24;
    }
    else {
      v24 &= 2u;
    }
    if (!(_DWORD)v24) {
      return 0;
    }
    int v46 = 138412546;
    uint64_t v47 = objc_opt_class(a1);
    __int16 v48 = 2112;
    id v49 = a4;
    uint64_t v19 = _os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "[%@] No LSApplicationProxy for: %@",  &v46,  22);
LABEL_18:
    v20 = (void *)v19;
    if (v19)
    {
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
      free(v20);
      SSFileLog(v15, @"%@");
    }

    return 0;
  }

  id v10 = v9;
  if ((objc_msgSend(objc_msgSend(v9, "appState"), "isValid") & 1) == 0)
  {
    id v12 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:]( &OBJC_CLASS___LSPlugInKitProxy,  "pluginKitProxyForIdentifier:",  a4);
    if (v12
      && (v13 = v12,
          id v14 = objc_msgSend(objc_msgSend(v12, "containingBundle"), "bundleType"),
          [v14 isEqualToString:LSUserApplicationType]))
    {
      id v10 = [v13 containingBundle];
    }

    else
    {
      id v26 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v26) {
        id v26 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v27 = [v26 shouldLog];
      else {
        LODWORD(v28) = v27;
      }
      v29 = (os_log_s *)[v26 OSLogObject];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v28 = v28;
      }
      else {
        v28 &= 2u;
      }
      if ((_DWORD)v28)
      {
        int v46 = 138412546;
        uint64_t v47 = objc_opt_class(a1);
        __int16 v48 = 2112;
        id v49 = a4;
        uint64_t v30 = _os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "[%@] No LSPlugInKitProxy for: %@",  &v46,  22);
        if (v30)
        {
          v31 = (void *)v30;
          v32 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v30, 4LL);
          free(v31);
          v40 = v32;
          *(void *)&double v11 = SSFileLog(v26, @"%@").n128_u64[0];
        }
      }
    }
  }

  id v33 = objc_msgSend(v10, "dataContainerURL", v11, v40);
  if (v33) {
    unsigned __int8 v21 = [a1 _writeReceipt:a3 withContainerDirectory:v33 style:a5];
  }
  else {
    unsigned __int8 v21 = 0;
  }
  id v34 = [v10 plugInKitPlugins];
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v35 = [v34 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(v34);
        }
        id v39 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)i) dataContainerURL];
        if (v39) {
          [a1 _writeReceipt:a3 withContainerDirectory:v39 style:a5];
        }
      }

      id v36 = [v34 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }

    while (v36);
  }

  return v21;
}

+ (BOOL)writeReceipt:(id)a3 forStoreKitClient:(id)a4
{
  id v7 = [a4 receiptDirectoryPath];
  uint64_t v8 = [a4 isSandboxed];
  if ([v7 length]) {
    return objc_msgSend( a1,  "_writeReceipt:withContainerDirectory:style:",  a3,  +[NSURL fileURLWithPath:isDirectory:]( NSURL,  "fileURLWithPath:isDirectory:",  v7,  1),  v8);
  }
  else {
    return objc_msgSend( a1,  "writeReceipt:forBundleIdentifier:style:",  a3,  objc_msgSend(a4, "bundleIdentifier"),  v8);
  }
}

+ (BOOL)_writeReceipt:(id)a3 withContainerDirectory:(id)a4 style:(int64_t)a5
{
  if ([a3 length])
  {
    uint64_t v28 = 0LL;
    v33[0] = NSFileOwnerAccountName;
    v33[1] = NSFileGroupOwnerAccountName;
    v34[0] = @"mobile";
    v34[1] = @"mobile";
    id v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  2LL);
    id v10 = [a4 URLByAppendingPathComponent:@"StoreKit" isDirectory:1];
    double v11 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    unsigned __int8 v12 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v11,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v10,  1LL,  v9,  &v28);
    if ((v12 & 1) != 0)
    {
      if (a5 == 1) {
        v13 = @"sandboxReceipt";
      }
      else {
        v13 = @"receipt";
      }
      id v14 = [v10 URLByAppendingPathComponent:v13 isDirectory:0];
      unsigned int v15 = [a3 writeToURL:v14 atomically:1];
      BOOL v16 = 0;
      if (!v15) {
        goto LABEL_31;
      }
      id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v17) {
        id v17 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v18 = [v17 shouldLog];
      else {
        LODWORD(v19) = v18;
      }
      v20 = (os_log_s *)[v17 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        uint64_t v19 = v19;
      }
      else {
        v19 &= 2u;
      }
      if (!(_DWORD)v19
        || (uint64_t v21 = objc_opt_class(a1),
            int v29 = 138412546,
            uint64_t v30 = v21,
            __int16 v31 = 2112,
            id v32 = v14,
            (v22 = (void *)_os_log_send_and_compose_impl( v19,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  2LL,  "[%@] Wrote receipt to path: %@",  &v29,  22)) == 0LL))
      {
        BOOL v16 = 1;
LABEL_31:

        return v16;
      }
    }

    else
    {
      id v17 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v17) {
        id v17 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v23 = [v17 shouldLog];
      else {
        LODWORD(v24) = v23;
      }
      v25 = (os_log_s *)[v17 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v24 = v24;
      }
      else {
        v24 &= 2u;
      }
      if (!(_DWORD)v24
        || (uint64_t v26 = objc_opt_class(a1),
            int v29 = 138412546,
            uint64_t v30 = v26,
            __int16 v31 = 2112,
            id v32 = v10,
            (v22 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "[%@] Could not create receipt URL: %@",  &v29,  22)) == 0LL))
      {
        BOOL v16 = 0;
        goto LABEL_31;
      }
    }

    +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v22, 4LL);
    free(v22);
    SSFileLog(v17, @"%@");
    BOOL v16 = v12;
    goto LABEL_31;
  }

  return 0;
}

@end