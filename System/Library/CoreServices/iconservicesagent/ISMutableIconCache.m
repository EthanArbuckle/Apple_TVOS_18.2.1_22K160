@interface ISMutableIconCache
- (ISMutableIconCache)initWithURL:(id)a3;
- (ISStoreMapTable)unitSourceRegistry;
- (id)mutableStoreIndex;
- (void)clear;
- (void)collectGarbage;
- (void)registerRecordIdentifiers:(id)a3 asSourceForUnit:(id)a4;
@end

@implementation ISMutableIconCache

- (ISMutableIconCache)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"__cache_info__" isDirectory:0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/System/Library/CoreServices/SystemVersion.plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"ProductBuildVersion"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ProductBuildVersion"]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 attributesOfItemAtPath:v11 error:0]);

    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](&OBJC_CLASS___NSLocale, "_deviceLanguage"));
    if (v6 && v9 && v8 && [v9 isEqualToString:v8])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 fileOwnerAccountName]);
      if ([v13 isEqualToString:@"_iconservices"])
      {
        int v14 = sub_100004834(v5);

        if (!v14)
        {
          v15 = v85;
LABEL_51:

          goto LABEL_52;
        }
      }

      else
      {
      }
    }

    v80 = v12;
    v81 = v9;
    v86 = v8;
    v82 = v7;
    v83 = self;
    v84 = v5;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByDeletingLastPathComponent", v6));
    uint64_t v18 = _ISDefaultLog(v17);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Resetting icon cache ...", buf, 2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v79 = (void *)v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 enumeratorAtURL:v17 includingPropertiesForKeys:0 options:1 errorHandler:0]);

    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    id v22 = v21;
    id v23 = [v22 countByEnumeratingWithState:&v98 objects:buf count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v99;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v99 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v98 + 1) + 8LL * (void)i);
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          NSFileAttributeKey v95 = 0LL;
          unsigned __int8 v29 = [v28 removeItemAtURL:v27 error:&v95];
          v30 = v95;

          if ((v29 & 1) == 0)
          {
            uint64_t v32 = _ISDefaultLog(v31);
            v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v92 = 138412546;
              *(void *)&v92[4] = v27;
              __int16 v93 = 2112;
              v94 = v30;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "Failed to remove item at URL: %@ with error: %@",  v92,  0x16u);
            }
          }
        }

        id v24 = [v22 countByEnumeratingWithState:&v98 objects:buf count:16];
      }

      while (v24);
    }

    uint64_t v35 = _ISDefaultLog(v34);
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v92 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "... Done", v92, 2u);
    }

    NSFileAttributeKey v95 = NSFilePosixPermissions;
    *(void *)v92 = &off_100008640;
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v92,  &v95,  1LL));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v5 = v84;
    v39 = (void *)objc_claimAutoreleasedReturnValue([v84 path]);
    id v91 = 0LL;
    unsigned __int8 v40 = [v38 createDirectoryAtPath:v39 withIntermediateDirectories:1 attributes:v37 error:&v91];
    id v41 = v91;

    self = v83;
    if ((v40 & 1) == 0)
    {
      uint64_t v51 = _ISDefaultLog(v42);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      v15 = v85;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
        sub_100004C7C();
      }
      uint64_t v53 = (uint64_t)v78;
      goto LABEL_50;
    }

    id v43 = v84;
    v15 = v85;
    if (!sub_100004834(v43))
    {
LABEL_41:

      *(void *)&__int128 v98 = @"language";
      *((void *)&v98 + 1) = @"ProductBuildVersion";
      *(void *)buf = v87;
      v97 = v86;
      uint64_t v53 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v98,  2LL));

      id v90 = 0LL;
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v53,  200LL,  0LL,  &v90));
      id v62 = v90;

      if (v52)
      {
        id v89 = v62;
        unsigned __int8 v64 = -[os_log_s writeToURL:options:error:]( v52,  "writeToURL:options:error:",  v85,  268435457LL,  &v89);
        id v41 = v89;

        if ((v64 & 1) != 0)
        {
LABEL_49:
          v9 = v81;
LABEL_50:

          v6 = (void *)v53;
          v7 = v82;
          v8 = v86;
          v12 = v80;
          goto LABEL_51;
        }

        uint64_t v66 = _ISDefaultLog(v65);
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
          sub_100004B18(v85, v41, v67);
        }
        id v62 = v41;
      }

      else
      {
        uint64_t v68 = _ISDefaultLog(v63);
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_100004A64(v62, v67);
        }
      }

      id v41 = v62;
      goto LABEL_49;
    }

    v44 = objc_alloc_init(&OBJC_CLASS___NSFileSecurity);
    uint64_t v45 = CFFileSecuritySetAccessControlList(v44, (acl_t)1);
    if ((_DWORD)v45)
    {
      *(void *)buf = 0LL;
      unsigned __int8 v46 = [v43 setResourceValue:v44 forKey:NSURLFileSecurityKey error:buf];
      id v47 = *(id *)buf;
      v48 = v47;
      if ((v46 & 1) != 0)
      {
LABEL_40:

        goto LABEL_41;
      }

      uint64_t v49 = _ISDefaultLog(v47);
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        sub_100004C1C();
      }
    }

    else
    {
      uint64_t v54 = _ISDefaultLog(v45);
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        sub_100004BEC(v50, v55, v56, v57, v58, v59, v60, v61);
      }
      v48 = 0LL;
    }

    goto LABEL_40;
  }

  uint64_t v16 = _ISDefaultLog(0LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100004A28(v15);
  }
LABEL_52:

  v69 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"store.index" isDirectory:0]);
  uint64_t v70 = _ISDefaultLog(v69);
  v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
    sub_1000049C8();
  }

  v72 = -[ISMutableStoreIndex initWithStoreFileURL:capacity:]( objc_alloc(&OBJC_CLASS___ISMutableStoreIndex),  "initWithStoreFileURL:capacity:",  v69,  4000LL);
  v73 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"store-source-registry.map" isDirectory:0]);
  v74 = -[ISStoreMapTable initWithURL:capacity:]( objc_alloc(&OBJC_CLASS___ISStoreMapTable),  "initWithURL:capacity:",  v73,  4000LL);
  unitSourceRegistry = self->_unitSourceRegistry;
  self->_unitSourceRegistry = v74;

  v88.receiver = self;
  v88.super_class = (Class)&OBJC_CLASS___ISMutableIconCache;
  v76 = -[ISMutableIconCache initWithURL:storeIndex:sandboxExtensionToken:]( &v88,  "initWithURL:storeIndex:sandboxExtensionToken:",  v5,  v72,  0LL);

  return v76;
}

- (id)mutableStoreIndex
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ISMutableIconCache;
  id v2 = -[ISMutableIconCache storeIndex](&v4, "storeIndex");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)registerRecordIdentifiers:(id)a3 asSourceForUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ISMutableIconCache unitSourceRegistry](self, "unitSourceRegistry"));
        int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
        [v13 addData:v12 forUUID:v14];

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }
}

- (void)clear
{
  v3 = _os_activity_create( (void *)&_mh_execute_header,  "CLEAR CACHE",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  CFAbsoluteTimeGetCurrent();
  uint64_t v5 = _ISDefaultLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Clearing all icon cache entries...", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ISMutableIconCache cacheURL](self, "cacheURL"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 enumeratorAtURL:v8 includingPropertiesForKeys:0 options:7 errorHandler:0]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      int v14 = 0LL;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v14);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", (void)v24));
        [v16 removeItemAtURL:v15 error:0];

        int v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }

    while (v12);
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[ISMutableIconCache unitSourceRegistry](self, "unitSourceRegistry"));
  [v17 removeAll];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ISMutableIconCache mutableStoreIndex](self, "mutableStoreIndex"));
  [v18 removeAll];

  uint64_t v20 = _ISDefaultLog(v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "... Done", buf, 2u);
  }

  uint64_t v22 = _ISTraceLog();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100004CF8();
  }

  os_activity_scope_leave(&state);
}

- (void)collectGarbage
{
  v3 = _os_activity_create( (void *)&_mh_execute_header,  "CLEAR STALE CACHE ENTRIES",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  CFAbsoluteTimeGetCurrent();
  uint64_t v5 = _ISDefaultLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Clearing stale icon cache entries...", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ISMutableIconCache unitSourceRegistry](self, "unitSourceRegistry"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100003058;
  v13[3] = &unk_100008358;
  v13[4] = self;
  [v7 enumerateWithBlock:v13];

  uint64_t v9 = _ISDefaultLog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "... Done", buf, 2u);
  }

  uint64_t v11 = _ISTraceLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100004D7C();
  }

  os_activity_scope_leave(&state);
}

- (ISStoreMapTable)unitSourceRegistry
{
  return (ISStoreMapTable *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end