@interface MSDHelperAgent
+ (id)sharedInstance;
- (BOOL)clearStagedDeviceAfterUpdateProcess;
- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5;
- (BOOL)collectDemoLogsToFolder:(id)a3;
- (BOOL)deleteNvram:(id)a3;
- (BOOL)disableLaunchdServicesForWatch;
- (BOOL)executeTestScriptOfIdentifier:(id)a3;
- (BOOL)fileExistsAtPath:(id)a3;
- (BOOL)manageDataVolume:(id)a3;
- (BOOL)manageDemoVolume:(id)a3;
- (BOOL)manageUserVolume:(id)a3 forUser:(id)a4;
- (BOOL)migratePreferencesFile;
- (BOOL)moveStagingToFinal:(id)a3 finalPath:(id)a4;
- (BOOL)moveStagingsToFinal:(id)a3 finalPath:(id)a4;
- (BOOL)prepareWorkDirectory:(id)a3 writableByNonRoot:(BOOL)a4;
- (BOOL)preserveBluetoothFileToShelter:(id)a3;
- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 withReturnErrorMsg:(id *)a4;
- (BOOL)quitHelper;
- (BOOL)reboot;
- (BOOL)removeFileAtPath:(id)a3;
- (BOOL)removeWorkDirectories:(id)a3;
- (BOOL)removeWorkDirectory:(id)a3;
- (BOOL)restartBluetooth;
- (BOOL)restoreAppDataAttributesUnder:(id)a3 containerType:(id)a4 identifier:(id)a5 manifestUID:(id)a6 deviceUID:(id)a7;
- (BOOL)restoreBackupAttributesUnder:(id)a3 range:(_NSRange)a4 manifestUID:(id)a5 deviceUID:(id)a6;
- (BOOL)setComputerNameAndHostname:(id)a3 encoding:(unsigned int)a4;
- (BOOL)setPreferencesForKey:(id)a3 withValue:(id)a4 forApplication:(id)a5 andUser:(id)a6;
- (BOOL)stageDeviceForUpdateProcess:(BOOL)a3;
- (BOOL)switchToBackupFolder;
- (BOOL)touchFile:(id)a3 fileAttributes:(id)a4;
- (BOOL)updateSignedManifest;
- (BOOL)writeNvram:(id)a3 withValue:(id)a4;
- (MSDHelperAgent)init;
- (OS_dispatch_semaphore)xpc_sema;
- (OS_xpc_object)xpc_conn;
- (id)createDeviceManifestForComponent:(id)a3 ofType:(id)a4 withRootPath:(id)a5 userHomePath:(id)a6 andSavePath:(id)a7;
- (id)readPlistFile:(id)a3;
- (id)sendXPCRequest:(id)a3;
- (void)setXpc_conn:(id)a3;
- (void)setXpc_sema:(id)a3;
@end

@implementation MSDHelperAgent

+ (id)sharedInstance
{
  if (qword_1001252F8 != -1) {
    dispatch_once(&qword_1001252F8, &stru_1000F9AE8);
  }
  return (id)qword_1001252F0;
}

- (MSDHelperAgent)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MSDHelperAgent;
  v2 = -[MSDHelperAgent init](&v19, "init");
  if (!v2)
  {
LABEL_7:
    v8 = 0LL;
    goto LABEL_8;
  }

  dispatch_semaphore_t v3 = dispatch_semaphore_create(5LL);
  -[MSDHelperAgent setXpc_sema:](v2, "setXpc_sema:", v3);

  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobilestoredemodhelper", 0LL, 0LL);
  -[MSDHelperAgent setXpc_conn:](v2, "setXpc_conn:", mach_service);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_conn](v2, "xpc_conn"));
  if (!v5)
  {
    id v9 = sub_10003A95C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100094E00(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    goto LABEL_7;
  }

  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_conn](v2, "xpc_conn"));
  xpc_connection_set_event_handler(v6, &stru_1000F9B28);

  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_conn](v2, "xpc_conn"));
  xpc_connection_resume(v7);

  v8 = v2;
LABEL_8:

  return v8;
}

- (BOOL)updateSignedManifest
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[MSDHelperAgent updateSignedManifest]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "command", "updateSignedManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  id v7 = sub_10003A95C();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[MSDHelperAgent updateSignedManifest]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  BOOL v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)migratePreferencesFile
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[MSDHelperAgent migratePreferencesFile]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "command", "migratePreferencesFile:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  id v7 = sub_10003A95C();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[MSDHelperAgent migratePreferencesFile]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  BOOL v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)stageDeviceForUpdateProcess:(BOOL)a3
{
  id v5 = sub_10003A95C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint64_t v15 = "-[MSDHelperAgent stageDeviceForUpdateProcess:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v14, 0xCu);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v7, "ForBackgroundDownload", a3);
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v8, "command", "stageDeviceForUpdateProcess:");
  xpc_dictionary_set_value(v8, "payload", v7);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v8));
  id v10 = sub_10003A95C();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint64_t v15 = "-[MSDHelperAgent stageDeviceForUpdateProcess:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v14, 0xCu);
  }

  BOOL v12 = xpc_dictionary_get_BOOL(v9, "result");
  return v12;
}

- (BOOL)clearStagedDeviceAfterUpdateProcess
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    BOOL v12 = "-[MSDHelperAgent clearStagedDeviceAfterUpdateProcess]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "command", "clearStagedDeviceAfterUpdateProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  id v7 = sub_10003A95C();
  xpc_object_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    BOOL v12 = "-[MSDHelperAgent clearStagedDeviceAfterUpdateProcess]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  BOOL v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)prepareWorkDirectory:(id)a3 writableByNonRoot:(BOOL)a4
{
  id v6 = a3;
  id v7 = sub_10003A95C();
  xpc_object_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    objc_super v19 = "-[MSDHelperAgent prepareWorkDirectory:writableByNonRoot:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v18, 0xCu);
  }

  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v10 = v6;
  int v11 = (const char *)[v10 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v9, "Path", v11);
  xpc_dictionary_set_BOOL(v9, "WritableByNonRoot", a4);
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v12, "command", "prepareWorkDirectory:");
  xpc_dictionary_set_value(v12, "payload", v9);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v12));
  id v14 = sub_10003A95C();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    objc_super v19 = "-[MSDHelperAgent prepareWorkDirectory:writableByNonRoot:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v18, 0xCu);
  }

  BOOL v16 = xpc_dictionary_get_BOOL(v13, "result");
  return v16;
}

- (BOOL)removeWorkDirectory:(id)a3
{
  id v7 = a3;
  id v4 = a3;
  xpc_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  LOBYTE(self) = -[MSDHelperAgent removeWorkDirectories:](self, "removeWorkDirectories:", v5, v7);
  return (char)self;
}

- (BOOL)removeWorkDirectories:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[MSDHelperAgent removeWorkDirectories:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", buf, 0xCu);
  }

  xpc_object_t v7 = xpc_array_create(0LL, 0LL);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v21 + 1) + 8LL * (void)i);
        xpc_object_t v14 = xpc_string_create((const char *)objc_msgSend(v13, "UTF8String", (void)v21));
        xpc_array_append_value(v7, v14);
      }

      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v10);
  }

  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v15, "command", "removeWorkDirectory:");
  xpc_dictionary_set_value(v15, "payload", v7);
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v15));
  id v17 = sub_10003A95C();
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[MSDHelperAgent removeWorkDirectories:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
  }

  BOOL v19 = xpc_dictionary_get_BOOL(v16, "result");
  return v19;
}

- (id)createDeviceManifestForComponent:(id)a3 ofType:(id)a4 withRootPath:(id)a5 userHomePath:(id)a6 andSavePath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = sub_10003A95C();
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v54 = "-[MSDHelperAgent createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
    __int16 v55 = 2114;
    id v56 = v12;
    __int16 v57 = 2114;
    id v58 = v13;
    __int16 v59 = 2114;
    id v60 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: entered for component: %{public}@ of type: %{public}@ root path: %{public}@",  buf,  0x2Au);
  }

  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v20 = [v19 fileExistsAtPath:v16];

  v50 = v12;
  v51 = v16;
  if (v20)
  {
    id v49 = v14;
    id v21 = sub_10003A95C();
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v54 = (const char *)v16;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Device manifest already exists at path: %{public}@; Skipping XPC request.",
        buf,
        0xCu);
    }

    id v45 = v13;
    id v47 = v15;

    xpc_object_t v23 = 0LL;
    xpc_object_t v24 = 0LL;
    v25 = 0LL;
    goto LABEL_9;
  }

  xpc_object_t v24 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string( v24, "ComponentID", (const char *)[v12 cStringUsingEncoding:4]);
  xpc_dictionary_set_string( v24, "ComponentType", (const char *)[v13 cStringUsingEncoding:4]);
  xpc_dictionary_set_string( v24, "RootPath", (const char *)[v14 cStringUsingEncoding:4]);
  xpc_dictionary_set_string( v24, "UserHomePath", (const char *)[v15 cStringUsingEncoding:4]);
  xpc_dictionary_set_string( v24, "SavePath", (const char *)[v16 cStringUsingEncoding:4]);
  xpc_object_t v23 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v23, "command", "createDeviceManifest:");
  xpc_dictionary_set_value(v23, "payload", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v23));
  if (xpc_dictionary_get_BOOL(v25, "result"))
  {
    id v47 = v15;
    id v49 = v14;
    id v45 = v13;
LABEL_9:
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v16, v45, v47));
    id v52 = 0LL;
    v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v26,  &v52));
    id v28 = v52;

    if (!v27)
    {
      id v29 = sub_10003A95C();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100094EB8((uint64_t)v51, v28, v30);
      }

      v27 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    }

    id v13 = v46;
    v31 = v48;
    id v14 = v49;
    goto LABEL_17;
  }

  id v32 = sub_10003A95C();
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_100094F78(v33, v34, v35, v36, v37, v38, v39, v40);
  }
  v31 = v15;

  v27 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
LABEL_17:
  v41 = -[MSDManifest initWithDictionary:](objc_alloc(&OBJC_CLASS___MSDManifest), "initWithDictionary:", v27);
  -[MSDManifest setRootPath:](v41, "setRootPath:", v14);
  id v42 = sub_10003A95C();
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[MSDHelperAgent createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
  }

  return v41;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[MSDHelperAgent fileExistsAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v15, 0xCu);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v7, "command", "fileExistsAtPath:");
  id v8 = v4;
  id v9 = (const char *)[v8 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v7, "payload", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v7));
  id v11 = sub_10003A95C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[MSDHelperAgent fileExistsAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v15, 0xCu);
  }

  BOOL v13 = xpc_dictionary_get_BOOL(v10, "result");
  return v13;
}

- (BOOL)removeFileAtPath:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[MSDHelperAgent removeFileAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = -[MSDHelperAgent removeWorkDirectory:](self, "removeWorkDirectory:", v4);
  return v7;
}

- (id)readPlistFile:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[MSDHelperAgent readPlistFile:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v15, 0xCu);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v7, "command", "readPlistFile:outContent:");
  id v8 = v4;
  int v9 = (const char *)[v8 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v7, "payload", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v7));
  id v11 = sub_10003A95C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[MSDHelperAgent readPlistFile:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v15, 0xCu);
  }

  if (xpc_dictionary_get_BOOL(v10, "result")) {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryFromXPCDictionary:withDataFromKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryFromXPCDictionary:withDataFromKey:",  v10,  "payload"));
  }
  else {
    BOOL v13 = 0LL;
  }

  return v13;
}

- (BOOL)touchFile:(id)a3 fileAttributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10003A95C();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315138;
    xpc_object_t v23 = "-[MSDHelperAgent touchFile:fileAttributes:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v22, 0xCu);
  }

  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v11 = v7;
  id v12 = (const char *)[v11 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v10, "FilePath", v12);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"FileOwnerName"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"FileGroupOwnerName"]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"FilePosixPermissions"]);

  if (v13) {
    xpc_dictionary_set_string( v10, "FileOwnerName", (const char *)[v13 UTF8String]);
  }
  if (v14) {
    xpc_dictionary_set_string( v10, "FileGroupOwnerName", (const char *)[v14 UTF8String]);
  }
  if (v15) {
    xpc_dictionary_set_int64(v10, "FilePosixPermissions", (int)[v15 shortValue]);
  }
  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v16, "command", "touchFile:");
  xpc_dictionary_set_value(v16, "payload", v10);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v16));
  id v18 = sub_10003A95C();
  BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315138;
    xpc_object_t v23 = "-[MSDHelperAgent touchFile:fileAttributes:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v22, 0xCu);
  }

  BOOL v20 = xpc_dictionary_get_BOOL(v17, "result");
  return v20;
}

- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = sub_10003A95C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000950BC(v12, v13, v14, v15, v16, v17, v18, v19);
  }

  xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v21 = v8;
  xpc_dictionary_set_string(v20, "FilePath", (const char *)[v21 cStringUsingEncoding:4]);
  id v22 = v10;
  xpc_object_t v23 = (const char *)[v22 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v20, "StatingPath", v23);
  if (v9 && [v9 length])
  {
    id v24 = v9;
    xpc_dictionary_set_data(v20, "ExpectedHash", [v24 bytes], (size_t)objc_msgSend(v24, "length"));
  }

  xpc_dictionary_set_BOOL(v20, "CorrectOwnership", 1);
  xpc_object_t v25 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v25, "command", "cloneFile:");
  xpc_dictionary_set_value(v25, "payload", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v25));
  BOOL v27 = xpc_dictionary_get_BOOL(v26, "result");
  if (!v27)
  {
    id v38 = sub_10003A95C();
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100095058((uint64_t)v21, v39, v40, v41, v42, v43, v44, v45);
    }
  }

  id v28 = sub_10003A95C();
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_100094FE8(v29, v30, v31, v32, v33, v34, v35, v36);
  }

  return v27;
}

- (BOOL)restoreBackupAttributesUnder:(id)a3 range:(_NSRange)a4 manifestUID:(id)a5 deviceUID:(id)a6
{
  int64_t length = a4.length;
  int64_t location = a4.location;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = sub_10003A95C();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315138;
    id v28 = "-[MSDHelperAgent restoreBackupAttributesUnder:range:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v27, 0xCu);
  }

  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v17 = v13;
  uint64_t v18 = (const char *)[v17 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v16, "StagingRootPath", v18);
  xpc_dictionary_set_int64(v16, "Location", location);
  xpc_dictionary_set_int64(v16, "Length", length);
  id v19 = [v12 integerValue];

  xpc_dictionary_set_int64(v16, "ManifestUID", (int64_t)v19);
  id v20 = [v11 integerValue];

  xpc_dictionary_set_int64(v16, "DeviceUID", (int64_t)v20);
  xpc_object_t v21 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v21, "command", "restoreBackupAttributes:");
  xpc_dictionary_set_value(v21, "payload", v16);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v21));
  id v23 = sub_10003A95C();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315138;
    id v28 = "-[MSDHelperAgent restoreBackupAttributesUnder:range:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v27, 0xCu);
  }

  BOOL v25 = xpc_dictionary_get_BOOL(v22, "result");
  return v25;
}

- (BOOL)restoreAppDataAttributesUnder:(id)a3 containerType:(id)a4 identifier:(id)a5 manifestUID:(id)a6 deviceUID:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = sub_10003A95C();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 136315138;
    uint64_t v35 = "-[MSDHelperAgent restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v34, 0xCu);
  }

  xpc_object_t v19 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v20 = v16;
  xpc_object_t v21 = (const char *)[v20 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v19, "StagingRootPath", v21);
  id v22 = v15;
  id v23 = (const char *)[v22 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v19, "ContentType", v23);
  id v24 = v14;
  BOOL v25 = (const char *)[v24 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v19, "Identifier", v25);
  id v26 = [v13 integerValue];

  xpc_dictionary_set_int64(v19, "ManifestUID", (int64_t)v26);
  id v27 = [v12 integerValue];

  xpc_dictionary_set_int64(v19, "DeviceUID", (int64_t)v27);
  xpc_object_t v28 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v28, "command", "restoreAppDataAttributes:");
  xpc_dictionary_set_value(v28, "payload", v19);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v28));
  id v30 = sub_10003A95C();
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 136315138;
    uint64_t v35 = "-[MSDHelperAgent restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v34, 0xCu);
  }

  BOOL v32 = xpc_dictionary_get_BOOL(v29, "result");
  return v32;
}

- (BOOL)deleteNvram:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[MSDHelperAgent deleteNvram:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v15, 0xCu);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v7, "command", "deleteNvram:");
  id v8 = v4;
  id v9 = (const char *)[v8 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v7, "payload", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v7));
  id v11 = sub_10003A95C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[MSDHelperAgent deleteNvram:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v15, 0xCu);
  }

  BOOL v13 = xpc_dictionary_get_BOOL(v10, "result");
  return v13;
}

- (BOOL)writeNvram:(id)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    id v22 = "-[MSDHelperAgent writeNvram:withValue:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v21, 0xCu);
  }

  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v11 = v7;
  id v12 = (const char *)[v11 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v10, "Name", v12);
  id v13 = v6;
  id v14 = (const char *)[v13 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v10, "Value", v14);
  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v15, "command", "writeNvram:");
  xpc_dictionary_set_value(v15, "payload", v10);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v15));
  id v17 = sub_10003A95C();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    id v22 = "-[MSDHelperAgent writeNvram:withValue:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v21, 0xCu);
  }

  BOOL v19 = xpc_dictionary_get_BOOL(v16, "result");
  return v19;
}

- (BOOL)manageDataVolume:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    id v17 = "-[MSDHelperAgent manageDataVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v16, 0xCu);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v7, "Target", "Data");
  id v8 = v4;
  id v9 = (const char *)[v8 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v7, "Operation", v9);
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v10, "command", "manageVolume:");
  xpc_dictionary_set_value(v10, "payload", v7);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v10));
  id v12 = sub_10003A95C();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    id v17 = "-[MSDHelperAgent manageDataVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v16, 0xCu);
  }

  BOOL v14 = xpc_dictionary_get_BOOL(v11, "result");
  return v14;
}

- (BOOL)manageDemoVolume:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    id v17 = "-[MSDHelperAgent manageDemoVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v16, 0xCu);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v7, "Target", "Demo");
  id v8 = v4;
  id v9 = (const char *)[v8 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v7, "Operation", v9);
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v10, "command", "manageVolume:");
  xpc_dictionary_set_value(v10, "payload", v7);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v10));
  id v12 = sub_10003A95C();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    id v17 = "-[MSDHelperAgent manageDemoVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v16, 0xCu);
  }

  BOOL v14 = xpc_dictionary_get_BOOL(v11, "result");
  return v14;
}

- (BOOL)manageUserVolume:(id)a3 forUser:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    id v22 = "-[MSDHelperAgent manageUserVolume:forUser:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v21, 0xCu);
  }

  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v10, "Target", "User");
  id v11 = v7;
  id v12 = (const char *)[v11 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v10, "Operation", v12);
  id v13 = v6;
  BOOL v14 = (const char *)[v13 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v10, "UserName", v14);
  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v15, "command", "manageVolume:");
  xpc_dictionary_set_value(v15, "payload", v10);
  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v15));
  id v17 = sub_10003A95C();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    id v22 = "-[MSDHelperAgent manageUserVolume:forUser:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v21, 0xCu);
  }

  BOOL v19 = xpc_dictionary_get_BOOL(v16, "result");
  return v19;
}

- (BOOL)disableLaunchdServicesForWatch
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[MSDHelperAgent disableLaunchdServicesForWatch]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "command", "disableLaunchdServicesForWatch:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[MSDHelperAgent disableLaunchdServicesForWatch]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  BOOL v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)moveStagingToFinal:(id)a3 finalPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  LOBYTE(v7) = -[MSDHelperAgent moveStagingsToFinal:finalPath:](self, "moveStagingsToFinal:finalPath:", v8, v6, v10);
  return (char)v7;
}

- (BOOL)moveStagingsToFinal:(id)a3 finalPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003A95C();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v32 = "-[MSDHelperAgent moveStagingsToFinal:finalPath:]";
    __int16 v33 = 2114;
    id v34 = v6;
    __int16 v35 = 2114;
    id v36 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s entered.  stagingPaths:  %{public}@ - finalPath:  %{public}@",  buf,  0x20u);
  }

  xpc_object_t v10 = xpc_array_create(0LL, 0LL);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v26 + 1) + 8LL * (void)i);
        xpc_object_t v17 = xpc_string_create((const char *)objc_msgSend(v16, "UTF8String", (void)v26));
        xpc_array_append_value(v10, v17);
      }

      id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v13);
  }

  xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_value(v18, "StagingPaths", v10);
  id v19 = v7;
  xpc_dictionary_set_string(v18, "FinalPath", (const char *)[v19 cStringUsingEncoding:4]);
  xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v20, "command", "moveStagingToFinal:");
  xpc_dictionary_set_value(v20, "payload", v18);
  int v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v20));
  id v22 = sub_10003A95C();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v32 = "-[MSDHelperAgent moveStagingsToFinal:finalPath:]";
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
  }

  BOOL v24 = xpc_dictionary_get_BOOL(v21, "result");
  return v24;
}

- (BOOL)switchToBackupFolder
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[MSDHelperAgent switchToBackupFolder]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s entered.", (uint8_t *)&v11, 0xCu);
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "command", "switchToBackupFolder:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[MSDHelperAgent switchToBackupFolder]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  BOOL v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)reboot
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[MSDHelperAgent reboot]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "command", "reboot:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[MSDHelperAgent reboot]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  BOOL v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)quitHelper
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[MSDHelperAgent quitHelper]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v12, 0xCu);
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "command", "quitHelper:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[MSDHelperAgent quitHelper]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v12, 0xCu);
  }

  BOOL v10 = v6 == &_xpc_error_connection_invalid || v6 == &_xpc_error_connection_interrupted;
  return v10;
}

- (BOOL)collectDemoLogsToFolder:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    xpc_object_t v17 = "-[MSDHelperAgent collectDemoLogsToFolder:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v16, 0xCu);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v8 = v4;
  BOOL v9 = (const char *)[v8 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v7, "logFileDirectory", v9);
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v10, "command", "collectDemoLogsToFolder:");
  xpc_dictionary_set_value(v10, "payload", v7);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v10));
  id v12 = sub_10003A95C();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    xpc_object_t v17 = "-[MSDHelperAgent collectDemoLogsToFolder:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v16, 0xCu);
  }

  BOOL v14 = xpc_dictionary_get_BOOL(v11, "result");
  return v14;
}

- (BOOL)preserveBluetoothFileToShelter:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    int v16 = "-[MSDHelperAgent preserveBluetoothFileToShelter:]";
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s entered.  sourcePath:  %{public}@",  (uint8_t *)&v15,  0x16u);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v8 = v4;
  xpc_dictionary_set_string(v7, "SourcePath", (const char *)[v8 cStringUsingEncoding:4]);
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v9, "command", "preserveBluetoothFileToShelter:");
  xpc_dictionary_set_value(v9, "payload", v7);
  xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v9));
  id v11 = sub_10003A95C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    int v16 = "-[MSDHelperAgent preserveBluetoothFileToShelter:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v15, 0xCu);
  }

  BOOL v13 = xpc_dictionary_get_BOOL(v10, "result");
  return v13;
}

- (BOOL)restartBluetooth
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[MSDHelperAgent restartBluetooth]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "command", "restartBluetooth:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[MSDHelperAgent restartBluetooth]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  BOOL v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)setComputerNameAndHostname:(id)a3 encoding:(unsigned int)a4
{
  id v6 = a3;
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315650;
    id v18 = "-[MSDHelperAgent setComputerNameAndHostname:encoding:]";
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 1026;
    unsigned int v22 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s:  entered - computerName:  %{public}@ - encoding:  %{public}x",  (uint8_t *)&v17,  0x1Cu);
  }

  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v10 = v6;
  xpc_dictionary_set_string(v9, "ComputerName", (const char *)[v10 cStringUsingEncoding:4]);
  xpc_dictionary_set_uint64(v9, "Encoding", a4);
  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v11, "command", "setComputerNameAndHostname:");
  xpc_dictionary_set_value(v11, "payload", v9);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v11));
  id v13 = sub_10003A95C();
  BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    id v18 = "-[MSDHelperAgent setComputerNameAndHostname:encoding:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v17, 0xCu);
  }

  BOOL v15 = xpc_dictionary_get_BOOL(v12, "result");
  return v15;
}

- (BOOL)executeTestScriptOfIdentifier:(id)a3
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10009512C(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return 0;
}

- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 withReturnErrorMsg:(id *)a4
{
  id v6 = a3;
  id v7 = sub_10003A95C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    __int16 v21 = "-[MSDHelperAgent preserveSecondPartyAppDataToShelter:withReturnErrorMsg:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:  entered.", (uint8_t *)&v20, 0xCu);
  }

  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v9, "command", "preserveSecondPartyAppDataToShelter:outErrorDict:");
  id v10 = v6;
  uint64_t v11 = (const char *)[v10 UTF8String];

  xpc_dictionary_set_string(v9, "payload", v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v9));
  id v13 = sub_10003A95C();
  BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    __int16 v21 = "-[MSDHelperAgent preserveSecondPartyAppDataToShelter:withReturnErrorMsg:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v20, 0xCu);
  }

  BOOL v15 = xpc_dictionary_get_BOOL(v12, "result");
  BOOL v16 = v15;
  if (a4 && !v15)
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryFromXPCDictionary:withDataFromKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryFromXPCDictionary:withDataFromKey:",  v12,  "payload"));
    id v18 = v17;
    if (v17) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"ErrorMsg"]);
    }
  }

  return v16;
}

- (BOOL)setPreferencesForKey:(id)a3 withValue:(id)a4 forApplication:(id)a5 andUser:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_10003A95C();
  BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136316162;
    __int128 v28 = "-[MSDHelperAgent setPreferencesForKey:withValue:forApplication:andUser:]";
    __int16 v29 = 2114;
    id v30 = v10;
    __int16 v31 = 2114;
    id v32 = v11;
    __int16 v33 = 2114;
    id v34 = v12;
    __int16 v35 = 2114;
    id v36 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: entered - key:  %{public}@ - value:  %{public}@ - appId:  %{public}@ - user:  %{public}@",  (uint8_t *)&v27,  0x34u);
  }

  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v17 = v10;
  xpc_dictionary_set_string(v16, "Key", (const char *)[v17 cStringUsingEncoding:4]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 createXPCDictionary]);
  xpc_dictionary_set_value(v16, "Value", v18);

  id v19 = v12;
  xpc_dictionary_set_string(v16, "ApplicationId", (const char *)[v19 cStringUsingEncoding:4]);
  id v20 = v13;
  xpc_dictionary_set_string(v16, "UserName", (const char *)[v20 cStringUsingEncoding:4]);
  xpc_object_t v21 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v21, "command", "setPreferences:");
  xpc_dictionary_set_value(v21, "payload", v16);
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v21));
  BOOL v23 = xpc_dictionary_get_BOOL(v22, "result");
  id v24 = sub_10003A95C();
  BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315394;
    __int128 v28 = "-[MSDHelperAgent setPreferencesForKey:withValue:forApplication:andUser:]";
    __int16 v29 = 1024;
    LODWORD(v30) = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: will return with rval %d",  (uint8_t *)&v27,  0x12u);
  }

  return v23;
}

- (id)sendXPCRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_sema](self, "xpc_sema"));
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_conn](self, "xpc_conn"));
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v4);

  uint64_t v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_sema](self, "xpc_sema"));
  dispatch_semaphore_signal(v8);

  return v7;
}

- (OS_xpc_object)xpc_conn
{
  return self->_xpc_conn;
}

- (void)setXpc_conn:(id)a3
{
}

- (OS_dispatch_semaphore)xpc_sema
{
  return self->_xpc_sema;
}

- (void)setXpc_sema:(id)a3
{
}

- (void).cxx_destruct
{
}

@end