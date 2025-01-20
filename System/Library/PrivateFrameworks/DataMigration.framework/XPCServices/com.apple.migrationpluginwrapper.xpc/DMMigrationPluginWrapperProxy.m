@interface DMMigrationPluginWrapperProxy
+ (void)_ensureExitAfterThrottlePeriod;
- (DMMigrationPluginWrapperProxy)initWithConnection:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation DMMigrationPluginWrapperProxy

- (DMMigrationPluginWrapperProxy)initWithConnection:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DMMigrationPluginWrapperProxy;
  return -[DMMigrationPluginWrapperProxy initWithConnection:](&v4, "initWithConnection:", a3);
}

- (void)handleMessage:(id)a3
{
  id v5 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v5, "msgID");
  uint64_t v7 = OBJC_IVAR___DMXPCConnection__connection;
  uint64_t pid = xpc_connection_get_pid(*(xpc_connection_t *)&self->DMXPCConnection_opaque[OBJC_IVAR___DMXPCConnection__connection]);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", int64));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
  _DMLogFunc(v3, 7LL);

  if (int64)
  {
    _DMLogFunc(v3, 7LL);
  }

  else
  {
    if (xpc_dictionary_get_BOOL( v5,  (const char *)objc_msgSend(@"DMSuppressMigrationPluginWrapperExit", "UTF8String", v5, v46, v47)))
    {
      _DMLogFunc(v3, 6LL);
    }

    else
    {
      +[DMMigrationPluginWrapperProxy _ensureExitAfterThrottlePeriod]( &OBJC_CLASS___DMMigrationPluginWrapperProxy,  "_ensureExitAfterThrottlePeriod");
    }

    _DMLogFunc(v3, 7LL);
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v9, "msgID", 0LL);
    pid_t v10 = getpid();
    xpc_dictionary_set_int64(v9, "pid", v10);
    v52 = self;
    v54 = v9;
    xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v7], v9);
    v68[0] = @"SyntheticDidUpgrade";
    v11 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  xpc_dictionary_get_BOOL(v5, (const char *)objc_msgSend(@"SyntheticDidUpgrade", "UTF8String", v5)));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v69[0] = v12;
    v68[1] = @"DidRestoreFromBackup";
    v13 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  xpc_dictionary_get_BOOL(v5, (const char *)[@"DidRestoreFromBackup" UTF8String]));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v69[1] = v14;
    v68[2] = @"DidMigrateBackupFromDifferentDevice";
    v15 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  xpc_dictionary_get_BOOL( v5,  (const char *)[@"DidMigrateBackupFromDifferentDevice" UTF8String]));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v69[2] = v16;
    v68[3] = @"DidRestoreFromCloudBackup";
    v17 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  xpc_dictionary_get_BOOL(v5, (const char *)[@"DidRestoreFromCloudBackup" UTF8String]));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v69[3] = v18;
    v68[4] = @"ShouldPreserveSettingsAfterRestore";
    v19 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  xpc_dictionary_get_BOOL( v5,  (const char *)[@"ShouldPreserveSettingsAfterRestore" UTF8String]));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v69[4] = v20;
    v68[5] = @"WasPasscodeSetInBackup";
    v21 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  xpc_dictionary_get_BOOL(v5, (const char *)[@"WasPasscodeSetInBackup" UTF8String]));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v69[5] = v22;
    v68[6] = @"RestoredBackupIsMegaBackup";
    v23 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  xpc_dictionary_get_BOOL(v5, (const char *)[@"RestoredBackupIsMegaBackup" UTF8String]));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v69[6] = v24;
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  7LL));

    string = xpc_dictionary_get_string( v5,  (const char *)[@"RestoredBackupBuildVersion" UTF8String]);
    if (string) {
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    }
    else {
      v50 = 0LL;
    }
    v26 = xpc_dictionary_get_string(v5, (const char *)[@"RestoredBackupProductType" UTF8String]);
    if (v26) {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v26));
    }
    else {
      v49 = 0LL;
    }
    v27 = xpc_dictionary_get_string(v5, (const char *)[@"RestoredBackupDeviceName" UTF8String]);
    if (v27) {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v27));
    }
    else {
      v48 = 0LL;
    }
    uint64_t int64 = xpc_dictionary_get_uint64(v5, "userDataDisposition");
    v29 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "pluginPath"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 lastPathComponent]);
    v32 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "pluginIdentifier"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = xpc_dictionary_get_string(v5, "backupDeviceUUID");
    if (v34) {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v34));
    }
    else {
      v35 = 0LL;
    }
    BOOL v36 = xpc_dictionary_get_BOOL(v5, "testMigrationInfrastructureOnly");
    id v37 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.migrationpluginwrapper.plugin.%@", v31));
    v38 = dispatch_queue_create((const char *)[v37 UTF8String], 0);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005964;
    block[3] = &unk_10000C2C0;
    id v56 = v33;
    id v57 = v31;
    id v58 = v30;
    id v59 = v51;
    int v66 = uint64;
    id v60 = v50;
    id v61 = v49;
    BOOL v67 = v36;
    id v62 = v48;
    id v63 = v35;
    id v64 = v5;
    v65 = v52;
    id v53 = v35;
    id v39 = v48;
    id v40 = v49;
    id v41 = v50;
    id v42 = v51;
    id v43 = v30;
    id v44 = v31;
    id v45 = v33;
    dispatch_sync(v38, block);
  }
}

+ (void)_ensureExitAfterThrottlePeriod
{
  if (qword_100015438 != -1) {
    dispatch_once(&qword_100015438, &stru_10000C300);
  }
}

@end