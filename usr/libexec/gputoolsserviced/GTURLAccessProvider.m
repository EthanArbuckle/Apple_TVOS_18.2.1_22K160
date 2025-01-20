@interface GTURLAccessProvider
- (BOOL)_sharesFileSystemWith:(id)a3 remoteConnection:(id)a4;
- (GTURLAccessProvider)initWithServiceProvider:(id)a3 connectionProvider:(id)a4 serviceVendor:(id)a5;
- (id)makeURL:(id)a3;
- (id)urlForPath:(id)a3;
- (void)copyIdentifier:(id)a3 toDevice:(id)a4 allowLocalURL:(BOOL)a5 completionHandler:(id)a6;
- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4;
- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
@end

@implementation GTURLAccessProvider

- (GTURLAccessProvider)initWithServiceProvider:(id)a3 connectionProvider:(id)a4 serviceVendor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  v13 = 0LL;
  if (v9 && v10 && v11)
  {
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___GTURLAccessProvider;
    v14 = -[GTURLAccessProvider init](&v22, "init");
    if (v14)
    {
      os_log_t v15 = os_log_create("com.apple.gputools.transport", "URLAccessProvider");
      log = v14->_log;
      v14->_log = v15;

      v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      registeredURLs = v14->_registeredURLs;
      v14->_registeredURLs = v17;

      uint64_t v19 = objc_claimAutoreleasedReturnValue(+[GTDeviceProperties uniqueDeviceID](&OBJC_CLASS___GTDeviceProperties, "uniqueDeviceID"));
      deviceUDID = v14->_deviceUDID;
      v14->_deviceUDID = (NSString *)v19;

      objc_storeStrong((id *)&v14->_serviceProvider, a3);
      objc_storeStrong((id *)&v14->_connectionProvider, a4);
      objc_storeStrong((id *)&v14->_serviceVendor, a5);
    }

    self = v14;
    v13 = self;
  }

  return v13;
}

- (id)urlForPath:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = self->_registeredURLs;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredURLs,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v14 + 1) + 8 * v9),  (void)v14));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
      unsigned __int8 v12 = [v11 isEqualToString:v4];

      if ((v12 & 1) != 0) {
        break;
      }

      if (v7 == (id)++v9)
      {
        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    id v10 = 0LL;
  }

  return v10;
}

- (BOOL)_sharesFileSystemWith:(id)a3 remoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  unsigned __int8 v9 = 0;
  if (v6 && v7)
  {
    if (-[NSString isEqualToString:](self->_deviceUDID, "isEqualToString:", v6))
    {
      unsigned __int8 v9 = 1;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
      id v11 = filteredArrayByService(v10, (Protocol *)&OBJC_PROTOCOL___GTSimulatorDeviceBrowser);
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

      serviceVendor = self->_serviceVendor;
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceProperties]);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceVendor getSimulatorDeviceBrowserService:]( serviceVendor,  "getSimulatorDeviceBrowserService:",  v15));

      unsigned __int8 v9 = [v16 isSimulatorDevice:v6];
    }
  }

  return v9;
}

- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = v6;
  if (v8
    && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSURL), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && (id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 scheme]),
        unsigned int v11 = [v10 isEqualToString:@"gtsandboxid"],
        v10,
        v11)
    && (unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 host]), v12, v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);

    if (v13)
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_10000EB10();
      }
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredURLs, "objectForKeyedSubscript:", v8));
      if (v14)
      {
        __int128 v15 = (void *)v14;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
        unsigned int v18 = [v16 fileExistsAtPath:v17];

        log = self->_log;
        if (v18)
        {
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
            sub_10000EA50();
          }
          v7[2](v7, v15);
LABEL_37:

          goto LABEL_17;
        }

        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          sub_10000EAB0();
        }

        -[NSMutableDictionary removeObjectForKey:](self->_registeredURLs, "removeObjectForKey:", v8);
      }

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 host]);
      v28 = (void *)objc_claimAutoreleasedReturnValue( -[GTConnectionProvider connectionForDeviceUDID:]( self->_connectionProvider,  "connectionForDeviceUDID:",  v15));
      v29 = v28;
      if (v28)
      {
        id v30 = allServicesForDeviceUDID(v28, v15);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        id v32 = filteredArrayByService(v31, (Protocol *)&OBJC_PROTOCOL___GTURLAccessProvider);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 firstObject]);

        if (v34)
        {
          v35 = objc_alloc(&OBJC_CLASS___GTURLAccessProviderXPCProxy);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v34 serviceProperties]);
          v37 = -[GTURLAccessProviderXPCProxy initWithConnection:remoteProperties:]( v35,  "initWithConnection:remoteProperties:",  v29,  v36);

          if (-[GTURLAccessProvider _sharesFileSystemWith:remoteConnection:]( self,  "_sharesFileSystemWith:remoteConnection:",  v15,  v29))
          {
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472LL;
            v57[2] = sub_10000783C;
            v57[3] = &unk_100030878;
            v57[4] = self;
            v38 = &v58;
            id v39 = v8;
            id v58 = v39;
            v40 = (id *)&v59;
            v59 = v7;
            -[GTURLAccessProviderXPCProxy securityScopedURLFromSandboxID:completionHandler:]( v37,  "securityScopedURLFromSandboxID:completionHandler:",  v39,  v57);
          }

          else
          {
            char v49 = objc_opt_respondsToSelector(v37, "copyIdentifier:toDevice:completionHandler:");
            deviceUDID = self->_deviceUDID;
            if ((v49 & 1) != 0)
            {
              v54[0] = _NSConcreteStackBlock;
              v54[1] = 3221225472LL;
              v54[2] = sub_100007894;
              v54[3] = &unk_1000308A0;
              v54[4] = self;
              v38 = (id *)&v56;
              v56 = v7;
              v40 = &v55;
              id v55 = v8;
              -[GTURLAccessProviderXPCProxy copyIdentifier:toDevice:completionHandler:]( v37,  "copyIdentifier:toDevice:completionHandler:",  v55,  deviceUDID,  v54);
            }

            else
            {
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472LL;
              v51[2] = sub_100007A60;
              v51[3] = &unk_1000308C8;
              v51[4] = self;
              v38 = (id *)&v53;
              v53 = v7;
              v40 = &v52;
              id v52 = v8;
              -[GTURLAccessProviderXPCProxy transferIdentifier:toDevice:completionHandler:]( v37,  "transferIdentifier:toDevice:completionHandler:",  v52,  deviceUDID,  v51);
            }
          }
        }

        else
        {
          v41 = self->_log;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            sub_10000EA20(v41, v42, v43, v44, v45, v46, v47, v48);
          }
          v7[2](v7, 0LL);
        }
      }

      else
      {
        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          sub_10000E9C0();
        }
        v7[2](v7, 0LL);
      }

      goto LABEL_37;
    }
  }

  else
  {
  }

  v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10000E990(v20, v21, v22, v23, v24, v25, v26, v27);
  }
  v7[2](v7, 0LL);
LABEL_17:
}

- (id)makeURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLPathAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLPathAllowedCharacterSet"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAddingPercentEncodingWithAllowedCharacters:v6]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://%@/%@?id=%u",  @"gtsandboxid",  self->_deviceUDID,  v7,  dword_10003DCF0));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredURLs, "setObject:forKeyedSubscript:", v4, v9);

  return v9;
}

- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100007C88;
  v9[3] = &unk_1000308F0;
  id v10 = a5;
  id v8 = v10;
  -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:]( self,  "copyIdentifier:toDevice:allowLocalURL:completionHandler:",  a3,  a4,  0LL,  v9);
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 allowLocalURL:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v70 = a5;
  id v9 = a3;
  id v10 = a4;
  unsigned int v11 = self;
  id v12 = v10;
  id v13 = a6;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_10000EDC0();
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredURLs, "objectForKeyedSubscript:", v9));
  if (os_log_type_enabled(v11->_log, OS_LOG_TYPE_DEBUG)) {
    sub_10000ED60();
  }
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[GTConnectionProvider connectionForDeviceUDID:]( v11->_connectionProvider,  "connectionForDeviceUDID:",  v12));
  v71 = v15;
  if (v15)
  {
    __int128 v16 = v15;
    id v17 = sub_100008428(v15, v12, v11->_connectionProvider);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = v11;
    v67 = (void *)v18;
    v68 = v14;
    if (v18)
    {
      v20 = (void *)v18;
      id v65 = v9;
      v66 = v19;
      v63 = v13;
      id v64 = v12;
      uint64_t v21 = objc_alloc(&OBJC_CLASS___GTFileWriterServiceXPCProxy);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 serviceProperties]);
      v69 = -[GTFileWriterServiceXPCProxy initWithConnection:remoteProperties:]( v21,  "initWithConnection:remoteProperties:",  v16,  v22);

      if (([v14 startAccessingSecurityScopedResource] & 1) == 0
        && os_log_type_enabled(v66->_log, OS_LOG_TYPE_DEBUG))
      {
        sub_10000ED00();
      }

      id v23 = v14;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      NSURLResourceKey v25 = NSURLIsDirectoryKey;
      v97[0] = NSURLIsDirectoryKey;
      v97[1] = NSURLFileSizeKey;
      v97[2] = NSURLIsSymbolicLinkKey;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v97, 3LL));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( [v24 enumeratorAtURL:v23 includingPropertiesForKeys:v26 options:0 errorHandler:&stru_100030B10]);

      v73 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      id obj = v27;
      id v28 = [obj countByEnumeratingWithState:&v88 objects:v96 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v89;
        uint64_t v72 = *(void *)v89;
        do
        {
          v31 = 0LL;
          id v74 = v29;
          do
          {
            if (*(void *)v89 != v30) {
              objc_enumerationMutation(obj);
            }
            id v32 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)v31);
            v33 = objc_autoreleasePoolPush();
            id v86 = 0LL;
            id v87 = 0LL;
            [v32 getResourceValue:&v87 forKey:v25 error:&v86];
            id v34 = v87;
            id v35 = v86;
            if (([v34 BOOLValue] & 1) == 0)
            {
              id v84 = 0LL;
              id v85 = 0LL;
              [v32 getResourceValue:&v85 forKey:NSURLIsSymbolicLinkKey error:&v84];
              id v36 = v85;
              id v76 = v84;

              id v37 = sub_10000E800(v32, v23);
              v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
              if ([v36 BOOLValue])
              {
                id v39 = (id)objc_claimAutoreleasedReturnValue([v32 URLByResolvingSymlinksInPath]);
                id v40 = sub_10000E800(v39, v23);
                v41 = (GTFileEntry *)objc_claimAutoreleasedReturnValue(v40);
                uint64_t v42 = -[GTFileEntry initWithLink:destination:]( objc_alloc(&OBJC_CLASS___GTFileEntry),  "initWithLink:destination:",  v38,  v41);
                -[NSMutableArray addObject:](v73, "addObject:", v42);
              }

              else
              {
                id v82 = 0LL;
                v83 = 0LL;
                [v32 getResourceValue:&v83 forKey:NSURLFileSizeKey error:&v82];
                id v43 = v23;
                uint64_t v44 = v83;
                id v39 = v82;
                id v45 = v44;
                uint64_t v46 = objc_alloc(&OBJC_CLASS___GTFileEntry);
                id v47 = [v45 unsignedIntegerValue];

                id v48 = v47;
                id v23 = v43;
                NSURLResourceKey v25 = NSURLIsDirectoryKey;
                v41 = -[GTFileEntry initWithPath:fileSize:](v46, "initWithPath:fileSize:", v38, v48);
                -[NSMutableArray addObject:](v73, "addObject:", v41);
              }

              id v35 = v76;
              id v29 = v74;
              uint64_t v30 = v72;
            }

            objc_autoreleasePoolPop(v33);
            v31 = (char *)v31 + 1;
          }

          while (v29 != v31);
          id v29 = [obj countByEnumeratingWithState:&v88 objects:v96 count:16];
        }

        while (v29);
      }

      id v49 = -[NSMutableArray copy](v73, "copy");
      [v23 stopAccessingSecurityScopedResource];
      v50 = objc_opt_new(&OBJC_CLASS___GTFileTransferOptions);
      if (v70
        && (objc_opt_respondsToSelector(v69, "startTransfer:basePath:fromDevice:options:completionHandler:") & 1) != 0)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
        deviceUDID = v66->_deviceUDID;
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472LL;
        v80[2] = sub_1000084E4;
        v80[3] = &unk_1000308F0;
        v53 = &v81;
        id v13 = v63;
        id v81 = v63;
        -[GTFileWriterServiceXPCProxy startTransfer:basePath:fromDevice:options:completionHandler:]( v69,  "startTransfer:basePath:fromDevice:options:completionHandler:",  v49,  v51,  deviceUDID,  v50,  v80);
      }

      else
      {
        id v58 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
        v59 = v66->_deviceUDID;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472LL;
        v77[2] = sub_1000084F0;
        v77[3] = &unk_100030918;
        v53 = &v79;
        id v13 = v63;
        id v79 = v63;
        id v78 = v23;
        -[GTFileWriterServiceXPCProxy initiateTransfer:basePath:fromDevice:options:completionHandler:]( v69,  "initiateTransfer:basePath:fromDevice:options:completionHandler:",  v49,  v58,  v59,  v50,  v77);

        v51 = v78;
      }

      id v12 = v64;
      id v9 = v65;
      v60 = v69;
    }

    else
    {
      if (os_log_type_enabled(v11->_log, OS_LOG_TYPE_ERROR)) {
        sub_10000ECA0();
      }
      NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing file writer service for device: %@",  v12));
      v93 = v61;
      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
      v60 = (GTFileWriterServiceXPCProxy *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.urlaccessprovider",  1LL,  v62));

      (*((void (**)(id, void, GTFileWriterServiceXPCProxy *))v13 + 2))(v13, 0LL, v60);
    }

    v57 = v67;
    v54 = v68;
  }

  else
  {
    v54 = v14;
    if (os_log_type_enabled(v11->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000EC40();
    }
    NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
    id v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing connection for device: %@",  v12));
    v95 = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v95,  &v94,  1LL));
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.urlaccessprovider",  0LL,  v56));

    (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v57);
  }
}

- (void).cxx_destruct
{
}

@end