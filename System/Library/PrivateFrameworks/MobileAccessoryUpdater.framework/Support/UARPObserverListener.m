@interface UARPObserverListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)xpcConnectionHasEntitlement:(id)a3;
- (UARPObserverListener)initWithManager:(id)a3 dispatchQueue:(id)a4;
- (void)addAccessoryID:(id)a3 assetID:(id)a4;
- (void)addObserver:(id)a3 withEndpoint:(id)a4;
- (void)clearDropboxForModelNumber:(id)a3 withFusing:(id)a4;
- (void)dealloc;
- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)removeAccessoryID:(id)a3;
- (void)removeObserver:(id)a3;
- (void)settingsChangedForSerialNumber:(id)a3;
- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
@end

@implementation UARPObserverListener

- (UARPObserverListener)initWithManager:(id)a3 dispatchQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___UARPObserverListener;
  v9 = -[UARPObserverListener init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_manager, a3);
    objc_storeStrong((id *)&v10->_internalQueue, a4);
    os_log_t v11 = os_log_create("com.apple.accessoryupdater.uarp", "observer");
    xpcLog = v10->_xpcLog;
    v10->_xpcLog = v11;

    v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    registeredObservers = v10->_registeredObservers;
    v10->_registeredObservers = v13;

    v15 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.accessoryupdater.observer");
    listener = v10->_listener;
    v10->_listener = v15;

    -[NSXPCListener setDelegate:](v10->_listener, "setDelegate:", v10);
    -[NSXPCListener resume](v10->_listener, "resume");
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPObserverListener;
  -[UARPObserverListener dealloc](&v3, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FCC8;
  block[3] = &unk_100075BA8;
  block[4] = self;
  id v10 = v5;
  os_log_t v11 = &v12;
  id v7 = v5;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)internalQueue;
}

- (BOOL)xpcConnectionHasEntitlement:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.accessoryupdater.launchauhelper.entitled"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v5, v6) & 1) != 0 && ([v5 BOOLValue])
  {
    BOOL v7 = 1;
  }

  else
  {
    xpcLog = self->_xpcLog;
    if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR)) {
      sub_10004ACE4(xpcLog);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)addObserver:(id)a3 withEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_registeredObservers, "objectForKey:", v6));
  if (v8)
  {
    xpcLog = self->_xpcLog;
    if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR)) {
      sub_10004AD60((uint64_t)v6, xpcLog, v10, v11, v12, v13, v14, v15);
    }
  }

  -[NSMutableDictionary setObject:forKey:](self->_registeredObservers, "setObject:forKey:", v7, v6);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_registeredObservers, "objectForKey:", v4));
  if (v5)
  {
    xpcLog = self->_xpcLog;
    if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_ERROR)) {
      sub_10004ADC4((uint64_t)v4, xpcLog, v7, v8, v9, v10, v11, v12);
    }
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_registeredObservers, "removeObjectForKey:", v4);
  }
}

- (void)settingsChangedForSerialNumber:(id)a3
{
}

- (void)clearDropboxForModelNumber:(id)a3 withFusing:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = &ADClientAddValueForScalarKey_ptr;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v7));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mobileAssetAppleModelNumber]);

  uint64_t v11 = v7;
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 mobileAssetAppleModelNumber]);
  }

  if (sub_10003B738((uint64_t)v11, (uint64_t)v6))
  {
    v26 = v9;
    id v27 = v7;
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[AUDeveloperSettingsDatabase sharedDatabase]( &OBJC_CLASS___AUDeveloperSettingsDatabase,  "sharedDatabase"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v29 accessoriesDictionary]);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v30 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v30)
    {
      uint64_t v13 = *(void *)v34;
      uint64_t v28 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v12);
          }
          uint64_t v31 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:"));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"modelNumber"]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"fusing"]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v8[153] findByAppleModelNumber:v16]);
          objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 mobileAssetAppleModelNumber]);

          if (v18)
          {
            uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 mobileAssetAppleModelNumber]);

            v16 = (void *)v19;
          }

          if ([v16 isEqualToString:v11]
            && (!v6 || [v6 isEqualToString:v32]))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v15));
            [v20 setObject:0 forKeyedSubscript:@"dropboxVersion"];
            v21 = v12;
            v22 = v11;
            v23 = v8;
            id v24 = v6;
            v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v20));
            [v29 addAccessoryWithSerialNumber:v31 info:v25];

            id v6 = v24;
            uint64_t v8 = v23;
            uint64_t v11 = v22;
            uint64_t v12 = v21;
            uint64_t v13 = v28;
          }
        }

        id v30 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v30);
    }

    uint64_t v9 = v26;
    id v7 = v27;
  }
}

- (void)addAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[UARPObserverListener addAccessoryID:assetID:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@", buf, 0x20u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030564;
  block[3] = &unk_100075BD0;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(internalQueue, block);
}

- (void)removeAccessoryID:(id)a3
{
  id v4 = a3;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[UARPObserverListener removeAccessoryID:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, xpcLog, OS_LOG_TYPE_INFO, "RECEIVED %s: %@", buf, 0x16u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100030828;
  v8[3] = &unk_100075B80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(internalQueue, v8);
}

- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v22 = "-[UARPObserverListener firmwareUpdateProgressForAccessoryID:assetID:bytesSent:bytesTotal:]";
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2048;
    unint64_t v28 = a5;
    __int16 v29 = 2048;
    unint64_t v30 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  xpcLog,  OS_LOG_TYPE_INFO,  "RECEIVED %s: %@ %@, bytesSent=%lu, bytesTotal=%lu",  buf,  0x34u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030B40;
  block[3] = &unk_100075BF8;
  block[4] = self;
  id v17 = v10;
  id v18 = v11;
  unint64_t v19 = a5;
  unint64_t v20 = a6;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(internalQueue, block);
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    id v11 = xpcLog;
    *(_DWORD *)buf = 136315906;
    unint64_t v20 = "-[UARPObserverListener stagingCompleteForAccessoryID:assetID:status:]";
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2080;
    uint64_t v26 = UARPFirmwareStagingCompletionStatusToString(a5);
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "RECEIVED %s: %@ %@ status=%s", buf, 0x2Au);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100030E60;
  v15[3] = &unk_100075C20;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  unint64_t v18 = a5;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

- (void).cxx_destruct
{
}

@end