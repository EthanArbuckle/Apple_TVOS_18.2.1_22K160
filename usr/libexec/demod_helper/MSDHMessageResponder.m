@interface MSDHMessageResponder
+ (id)sharedInstance;
- (BOOL)clearStagedDeviceAfterUpdateProcess;
- (BOOL)cloneFile:(id)a3;
- (BOOL)collectDemoLogsToFolder:(id)a3;
- (BOOL)createDeviceManifest:(id)a3;
- (BOOL)deleteNvram:(id)a3;
- (BOOL)disableLaunchdServicesForWatch:(id)a3;
- (BOOL)executeTestScriptOfIdentifier:(id)a3;
- (BOOL)fileExistsAtPath:(id)a3;
- (BOOL)hasEntitlementMobileStoreDemod:(id)a3;
- (BOOL)isCommandAllowed:(id)a3;
- (BOOL)manageVolume:(id)a3;
- (BOOL)migratePreferencesFile:(id)a3;
- (BOOL)moveStagingToFinal:(id)a3;
- (BOOL)prepareWorkDirectory:(id)a3;
- (BOOL)preserveBluetoothFileToShelter:(id)a3;
- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 outErrorDict:(id *)a4;
- (BOOL)quitHelper:(id)a3;
- (BOOL)readPlistFile:(id)a3 outContent:(id *)a4;
- (BOOL)reboot:(id)a3;
- (BOOL)removeWorkDirectory:(id)a3;
- (BOOL)restartBluetooth:(id)a3;
- (BOOL)restoreAppDataAttributes:(id)a3;
- (BOOL)restoreBackupAttributes:(id)a3;
- (BOOL)setComputerNameAndHostname:(id)a3;
- (BOOL)setPreferences:(id)a3;
- (BOOL)stageDeviceForUpdateProcess:(id)a3;
- (BOOL)switchToBackupFolder:(id)a3;
- (BOOL)touchFile:(id)a3;
- (BOOL)updateSignedManifest;
- (BOOL)writeNvram:(id)a3;
- (MSDHMessageResponder)init;
- (OS_dispatch_queue)messageHandlerQueue;
- (void)_handleXPCMessage:(id)a3 fromConnection:(id)a4;
- (void)handleXPCMessage:(id)a3 fromConnection:(id)a4;
- (void)sendResponse:(BOOL)a3 withPayload:(id)a4 forRequest:(id)a5 fromConnection:(id)a6;
- (void)setMessageHandlerQueue:(id)a3;
@end

@implementation MSDHMessageResponder

+ (id)sharedInstance
{
  if (qword_10004F940 != -1) {
    dispatch_once(&qword_10004F940, &stru_100045130);
  }
  return (id)qword_10004F938;
}

- (MSDHMessageResponder)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDHMessageResponder;
  v2 = -[MSDHMessageResponder init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.msdmessage", &_dispatch_queue_attr_concurrent);
    -[MSDHMessageResponder setMessageHandlerQueue:](v2, "setMessageHandlerQueue:", v3);

    v4 = v2;
  }

  return v2;
}

- (BOOL)hasEntitlementMobileStoreDemod:(id)a3
{
  audit_token_t v30 = v31;
  dispatch_queue_t v3 = SecTaskCreateWithAuditToken(0LL, &v30);
  if (!v3)
  {
    id v10 = sub_100021D84();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002CE2C(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    return 0;
  }

  v4 = v3;
  v5 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v3, @"com.apple.private.mobilestoredemo.helper", 0LL);
  if (!v5)
  {
    id v19 = sub_100021D84();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002CE9C(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    CFRelease(v4);
    return 0;
  }

  objc_super v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 == CFBooleanGetTypeID())
  {
    BOOL v8 = CFBooleanGetValue(v6) != 0;
  }

  else
  {
    id v28 = sub_100021D84();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10002CF0C();
    }

    BOOL v8 = 0;
  }

  CFRelease(v4);
  CFRelease(v6);
  return v8;
}

- (BOOL)isCommandAllowed:(id)a3
{
  uint64_t v3 = qword_10004F950;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10004F950, &stru_100045150);
  }
  unsigned __int8 v5 = [(id)qword_10004F948 containsObject:v4];

  return v5;
}

- (void)handleXPCMessage:(id)a3 fromConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDHMessageResponder messageHandlerQueue](self, "messageHandlerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022C48;
  block[3] = &unk_100045178;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)sendResponse:(BOOL)a3 withPayload:(id)a4 forRequest:(id)a5 fromConnection:(id)a6
{
  id v11 = a4;
  id v9 = (_xpc_connection_s *)a6;
  xpc_object_t reply = xpc_dictionary_create_reply(a5);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  if (v11) {
    a3 &= [v11 saveAsDataInXPCDictionary:reply forKey:"payload"];
  }
  xpc_dictionary_set_BOOL(reply, "result", a3);
  xpc_connection_send_message(v9, reply);
}

- (BOOL)updateSignedManifest
{
  id v2 = sub_100021D84();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    BOOL v8 = "-[MSDHMessageResponder updateSignedManifest]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter:",  (uint8_t *)&v7,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v5 = [v4 updateSignedManifest];

  return v5;
}

- (BOOL)migratePreferencesFile:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[MSDHMessageResponder migratePreferencesFile:]";
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v7 = [v6 migratePreferencesFile];

  return v7;
}

- (BOOL)stageDeviceForUpdateProcess:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ForBackgroundDownload"]);
  unsigned int v5 = [v4 BOOLValue];

  id v6 = sub_100021D84();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[MSDHMessageResponder stageDeviceForUpdateProcess:]";
    __int16 v58 = 2114;
    id v59 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  buf,  0x16u);
  }

  id v45 = v3;

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v44 = v5;
  if (v5)
  {
    [v8 addObjectsFromArray:&off_100049CA8];
    __int16 v11 = &off_100049CC0;
    id v12 = v9;
  }

  else
  {
    [v8 addObjectsFromArray:&off_100049CD8];
    [v9 addObjectsFromArray:&off_100049CF0];
    __int16 v11 = &off_100049D08;
    id v12 = v10;
  }

  [v12 addObjectsFromArray:v11];
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)i);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
        [v19 removeDirectory:v18];
      }

      id v15 = [v13 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }

    while (v15);
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v20 = v8;
  id v21 = [v20 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v47;
    while (2)
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)j);
        uint64_t v26 = [v10 containsObject:v25] ^ 1;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
        LOBYTE(v26) = [v27 prepareDirectory:v25 writableByNonRoot:v26];

        if ((v26 & 1) == 0)
        {
          id v32 = sub_100021D84();
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10002CFAC();
          }

          v34 = (os_log_s *)v20;
          audit_token_t v31 = v45;
          goto LABEL_26;
        }
      }

      id v22 = [v20 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v29 = [v28 prepareWorkContainerInUserHome:v44];

  if ((v29 & 1) != 0)
  {
    BOOL v30 = 1;
    audit_token_t v31 = v45;
  }

  else
  {
    id v36 = sub_100021D84();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    audit_token_t v31 = v45;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10002CF7C(v34, v37, v38, v39, v40, v41, v42, v43);
    }
LABEL_26:

    BOOL v30 = 0;
  }

  return v30;
}

- (BOOL)clearStagedDeviceAfterUpdateProcess
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v3 = [v2 fileExistsAtPath:@"/var/MSDWorkContainer/.MSD_cache_manifest"];

  id v4 = sub_100021D84();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v50 = 136315138;
    __int128 v51 = "-[MSDHMessageResponder clearStagedDeviceAfterUpdateProcess]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter",  (uint8_t *)&v50,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v7 = [v6 removeDirectory:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer"];

  if ((v7 & 1) == 0)
  {
    id v17 = sub_100021D84();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002D11C(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_20;
  }

  if (v3)
  {
    id v8 = sub_100021D84();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v50 = 138543362;
      __int128 v51 = @"/var/MSDWorkContainer";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Factory cache exists so spare the work container: %{public}@",  (uint8_t *)&v50,  0xCu);
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
    unsigned __int8 v11 = [v10 removeDirectory:@"/var/MSDWorkContainer"];

    if ((v11 & 1) == 0)
    {
      id v42 = sub_100021D84();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10002D0AC(v18, v43, v44, v45, v46, v47, v48, v49);
      }
      goto LABEL_20;
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v13 = [v12 removeDirectory:@"/private/var/demo_backup/.backup"];

  if ((v13 & 1) != 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
    unsigned __int8 v15 = [v14 destroyWorkContainerInUserHome];

    if ((v15 & 1) != 0) {
      return 1;
    }
    id v34 = sub_100021D84();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002D00C(v18, v35, v36, v37, v38, v39, v40, v41);
    }
  }

  else
  {
    id v26 = sub_100021D84();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002D03C(v18, v27, v28, v29, v30, v31, v32, v33);
    }
  }

- (BOOL)prepareWorkDirectory:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "-[MSDHMessageResponder prepareWorkDirectory:]";
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Path"]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"WritableByNonRoot"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v9 = objc_msgSend(v8, "prepareDirectory:writableByNonRoot:", v6, objc_msgSend(v7, "BOOLValue"));

  return v9;
}

- (BOOL)removeWorkDirectory:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "-[MSDHMessageResponder removeWorkDirectory:]";
    __int16 v22 = 2114;
    id v23 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  buf,  0x16u);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    int v10 = 1;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance", (void)v15));
        v10 &= [v13 removeDirectory:v12];
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)createDeviceManifest:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    __int128 v15 = "-[MSDHMessageResponder createDeviceManifest:]";
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ComponentID"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ComponentType"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"RootPath"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"UserHomePath"]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"SavePath"]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v12 = [v11 createDeviceManifestForComponent:v6 ofType:v7 withRootPath:v8 userHomePath:v9 andSavePath:v10];

  return v12;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[MSDHMessageResponder fileExistsAtPath:]";
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v7 = [v6 fileExistsAtPath:v3];

  return v7;
}

- (BOOL)readPlistFile:(id)a3 outContent:(id *)a4
{
  id v5 = a3;
  id v6 = sub_100021D84();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "-[MSDHMessageResponder readPlistFile:outContent:]";
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 readPlistFile:v5]);

  if (a4) {
    *a4 = v9;
  }

  return v9 != 0LL;
}

- (BOOL)touchFile:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    __int128 v15 = "-[MSDHMessageResponder touchFile:]";
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"FilePath"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"FileOwnerName"]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"FileGroupOwnerName"]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"FilePosixPermissions"]);
  if (v8) {
    [v6 setObject:v8 forKey:NSFileOwnerAccountName];
  }
  if (v9) {
    [v6 setObject:v9 forKey:NSFileGroupOwnerAccountName];
  }
  if (v10) {
    [v6 setObject:v10 forKey:NSFilePosixPermissions];
  }
  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v12 = [v11 touchFile:v7 fileAttributes:v6];

  return v12;
}

- (BOOL)cloneFile:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002D18C();
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"FilePath"]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"StatingPath"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ExpectedHash"]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"CorrectOwnership"]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v11 = objc_msgSend( v10,  "cloneFile:to:expectingHash:correctOwnership:",  v6,  v7,  v8,  objc_msgSend(v9, "BOOLValue"));

  return v11;
}

- (BOOL)restoreBackupAttributes:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    __int16 v16 = "-[MSDHMessageResponder restoreBackupAttributes:]";
    __int16 v17 = 2114;
    id v18 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v15,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"StagingRootPath"]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Location"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Length"]);
  id v9 = [v7 integerValue];
  id v10 = [v8 integerValue];
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ManifestUID"]);
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"DeviceUID"]);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  LOBYTE(v9) = objc_msgSend( v13,  "restoreBackupAttributesUnder:range:manifestUID:deviceUID:",  v6,  v9,  v10,  v11,  v12);

  return (char)v9;
}

- (BOOL)restoreAppDataAttributes:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    int v15 = "-[MSDHMessageResponder restoreAppDataAttributes:]";
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"StagingRootPath"]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ContentType"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Identifier"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ManifestUID"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"DeviceUID"]);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v12 = [v11 restoreAppDataAttributesUnder:v6 containerType:v7 identifier:v8 manifestUID:v9 deviceUID:v10];

  return v12;
}

- (BOOL)deleteNvram:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[MSDHMessageResponder deleteNvram:]";
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v7 = [v6 deleteNvram:v3];

  return v7;
}

- (BOOL)writeNvram:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "-[MSDHMessageResponder writeNvram:]";
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Name"]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Value"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v9 = [v8 writeNVRam:v6 withValue:v7];

  return v9;
}

- (BOOL)manageVolume:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    int v15 = "-[MSDHMessageResponder manageVolume:]";
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Target"]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Operation"]);
  if ([v6 isEqualToString:@"Data"])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
    unsigned __int8 v9 = [v8 manageDataVolume:v7];
LABEL_7:
    unsigned __int8 v10 = v9;
    goto LABEL_8;
  }

  if ([v6 isEqualToString:@"Demo"])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
    unsigned __int8 v9 = [v8 manageDemoVolume:v7];
    goto LABEL_7;
  }

  if ([v6 isEqualToString:@"User"])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"UserName"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
    unsigned __int8 v10 = [v12 manageUserVolume:v7 forUser:v8];
  }

  else
  {
    id v13 = sub_100021D84();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      int v15 = (const char *)v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "Unknown volume target: %{public}@",  (uint8_t *)&v14,  0xCu);
    }

    unsigned __int8 v10 = 0;
  }

- (BOOL)moveStagingToFinal:(id)a3
{
  id v21 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "-[MSDHMessageResponder moveStagingToFinal:]";
    __int16 v29 = 2114;
    id v30 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  buf,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"StagingPaths"]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"FinalPath"]);
  obj = self;
  objc_sync_enter(obj);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v13 = objc_autoreleasePoolPush();
        int v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
        unsigned __int8 v15 = [v14 moveUserHomeStagingToFinal:v12 finalPath:v7];

        if ((v15 & 1) != 0)
        {
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
          unsigned int v17 = [v16 moveStagingToFinal:v12 finalPath:v7];
        }

        else
        {
          unsigned int v17 = 0;
        }

        objc_autoreleasePoolPop(v13);
        if (!v17)
        {
          BOOL v18 = 0;
          goto LABEL_16;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v18 = 1;
LABEL_16:

  objc_sync_exit(obj);
  return v18;
}

- (BOOL)switchToBackupFolder:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[MSDHMessageResponder switchToBackupFolder:]";
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v7 = [v6 switchToBackupFolder];

  return v7;
}

- (BOOL)disableLaunchdServicesForWatch:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[MSDHMessageResponder disableLaunchdServicesForWatch:]";
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v7 = [v6 disableLaunchdServicesForWatch];

  return v7;
}

- (BOOL)reboot:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[MSDHMessageResponder reboot:]";
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v7 = [v6 reboot];

  return v7;
}

- (BOOL)quitHelper:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[MSDHMessageResponder quitHelper:]";
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v7 = [v6 quitHelper];

  return v7;
}

- (BOOL)collectDemoLogsToFolder:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    __int16 v11 = "-[MSDHMessageResponder collectDemoLogsToFolder:]";
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"logFileDirectory"]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v8 = [v7 collectDemoLogsToFolder:v6];

  return v8;
}

- (BOOL)preserveBluetoothFileToShelter:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"SourcePath"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v5 = [v4 preserveBluetoothFileToShelter:v3];

  return v5;
}

- (BOOL)restartBluetooth:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance", a3));
  unsigned __int8 v4 = [v3 restartBluetooth];

  return v4;
}

- (BOOL)setComputerNameAndHostname:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    unsigned __int8 v15 = "-[MSDHMessageResponder setComputerNameAndHostname:]";
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s - request:  %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ComputerName"]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Encoding"]);
  id v8 = [v7 unsignedIntValue];

  id v9 = sub_100021D84();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002D204();
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v12 = [v11 setComputerNameAndHostname:v6 encoding:v8];

  return v12;
}

- (BOOL)executeTestScriptOfIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = sub_100021D84();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    id v17 = "-[MSDHMessageResponder executeTestScriptOfIdentifier:]";
    __int16 v18 = 2114;
    id v19 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  id v6 = sub_100021D84();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10002D280(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  return 0;
}

- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 outErrorDict:(id *)a4
{
  id v5 = a3;
  id v6 = sub_100021D84();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v16 = "-[MSDHMessageResponder preserveSecondPartyAppDataToShelter:outErrorDict:]";
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Entering %s with parameter: %{public}@",  buf,  0x16u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  id v12 = 0LL;
  unsigned __int8 v9 = [v8 preserveSecondPartyAppDataToShelter:v5 withReturnErrorMsg:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0 && a4 && v10)
  {
    uint64_t v13 = @"ErrorMsg";
    id v14 = v10;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  }

  return v9;
}

- (BOOL)setPreferences:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Key"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"Value"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ApplicationId"]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"UserName"]);

  id v8 = sub_100021D84();
  unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136316162;
    id v14 = "-[MSDHMessageResponder setPreferences:]";
    __int16 v15 = 2114;
    int v16 = v4;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v6;
    __int16 v21 = 2114;
    __int128 v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: entered - key:  %{public}@ - value:  %{public}@ - appId:  %{public}@ - user:  %{public}@",  (uint8_t *)&v13,  0x34u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](&OBJC_CLASS___MSDHOperations, "sharedInstance"));
  unsigned __int8 v11 = [v10 setPreferencesForKey:v4 withValue:v5 forApplication:v6 andUser:v7];

  return v11;
}

- (void)_handleXPCMessage:(id)a3 fromConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"readPlistFile:outContent:",  @"preserveSecondPartyAppDataToShelter:outErrorDict:",  0LL));
  if (-[MSDHMessageResponder hasEntitlementMobileStoreDemod:](self, "hasEntitlementMobileStoreDemod:", v7))
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithXPCDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithXPCDictionary:",  v6));
    id v10 = v9;
    if (!v9)
    {
      uint64_t v16 = 0LL;
      id v17 = 0LL;
      unsigned __int8 v11 = 0LL;
      id v12 = 0LL;
      goto LABEL_10;
    }

    unsigned __int8 v11 = (NSString *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"command"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"payload"]);
    if (-[MSDHMessageResponder isCommandAllowed:](self, "isCommandAllowed:", v11))
    {
      SEL v13 = NSSelectorFromString(v11);
      if (v13)
      {
        SEL v14 = v13;
        if ((objc_opt_respondsToSelector(self, v13) & 1) != 0)
        {
          __int16 v15 = (uint64_t (*)(MSDHMessageResponder *, SEL, void *, id *))-[MSDHMessageResponder methodForSelector:]( self,  "methodForSelector:",  v14);
          if ([v8 containsObject:v11])
          {
            id v31 = 0LL;
            uint64_t v16 = v15(self, v14, v12, &v31);
            id v17 = v31;
            goto LABEL_10;
          }

          uint64_t v16 = ((uint64_t (*)(MSDHMessageResponder *, SEL, void *))v15)(self, v14, v12);
LABEL_9:
          id v17 = 0LL;
          goto LABEL_10;
        }

        id v30 = sub_100021D84();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10002D350((uint64_t)self, (uint64_t)v11, v28);
        }
      }

      else
      {
        id v29 = sub_100021D84();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10002D2F0();
        }
      }
    }

    else
    {
      id v27 = sub_100021D84();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10002D3F4();
      }
    }

    uint64_t v16 = 0LL;
    goto LABEL_9;
  }

  id v18 = sub_100021D84();
  __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10002D454(v19, v20, v21, v22, v23, v24, v25, v26);
  }

  uint64_t v16 = 0LL;
  id v17 = 0LL;
  unsigned __int8 v11 = 0LL;
  id v12 = 0LL;
  id v10 = 0LL;
LABEL_10:
  -[MSDHMessageResponder sendResponse:withPayload:forRequest:fromConnection:]( self,  "sendResponse:withPayload:forRequest:fromConnection:",  v16,  v17,  v6,  v7);
}

- (OS_dispatch_queue)messageHandlerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMessageHandlerQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end