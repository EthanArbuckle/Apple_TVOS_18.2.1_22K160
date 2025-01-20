@interface DMMigratorProxy
- (DMMigratorProxy)initWithConnection:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation DMMigratorProxy

- (DMMigratorProxy)initWithConnection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DMMigratorProxy;
  v3 = -[DMMigratorProxy initWithConnection:](&v7, "initWithConnection:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___DMMigrator);
    migrator = v3->_migrator;
    v3->_migrator = v4;
  }

  return v3;
}

- (void)handleMessage:(id)a3
{
  id v5 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v5, "msgID");
  uint64_t v99 = OBJC_IVAR___DMXPCConnection__connection;
  uint64_t pid = xpc_connection_get_pid(*(xpc_connection_t *)&self->DMXPCConnection_opaque[OBJC_IVAR___DMXPCConnection__connection]);
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", int64));
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
  id v76 = v5;
  _DMLogFunc(v3, 7LL);

  uint64_t v120 = 0LL;
  v121 = &v120;
  uint64_t v122 = 0x3032000000LL;
  v123 = sub_10000BBFC;
  v124 = sub_10000BC0C;
  id v125 = 0LL;
  dispatch_time_t v8 = dispatch_time(0LL, 10500000000LL);
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472LL;
  v113[2] = sub_10000BC14;
  v113[3] = &unk_100020968;
  id v9 = v5;
  int v119 = pid;
  int64_t v117 = int64;
  dispatch_time_t v118 = v8;
  id v114 = v9;
  v115 = self;
  v116 = &v120;
  v10 = objc_retainBlock(v113);
  switch(int64)
  {
    case 0LL:
      BOOL bytes = xpc_dictionary_get_BOOL(v9, "checkNecessity");
      string = xpc_dictionary_get_string(v9, "lastRelevantPlugin");
      if (string) {
        xpc_object_t v12 = (xpc_object_t)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  string,  v76,  v79,  v87));
      }
      else {
        xpc_object_t v12 = 0LL;
      }
      BOOL v97 = xpc_dictionary_get_BOOL(v9, "testMigrationInfrastructureOnly");
      v86 = string;
      _DMLogFunc(v3, 6LL);
      uint64_t v71 = os_transaction_create("com.apple.datamigrator.migrate");
      v72 = (void *)v121[5];
      v121[5] = v71;

      migrator = self->_migrator;
      uint64_t v74 = *(void *)&self->DMXPCConnection_opaque[v99];
      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472LL;
      v109[2] = sub_10000BEE4;
      v109[3] = &unk_100020990;
      int v112 = pid;
      id v110 = v9;
      v111 = self;
      -[DMMigrator migrateCheckingNecessity:lastRelevantPlugin:testMigrationInfrastructureOnly:connection:migrationResultHandler:]( migrator,  "migrateCheckingNecessity:lastRelevantPlugin:testMigrationInfrastructureOnly:connection:migrationResultHandler:",  bytes,  v12,  v97,  v74,  v109,  v12,  v86);
      v107[0] = 0LL;
      v107[1] = v107;
      v107[2] = 0x3032000000LL;
      v107[3] = sub_10000BBFC;
      v107[4] = sub_10000BC0C;
      id v108 = (id)os_transaction_create("com.apple.datamigrator.postmigration");
      dispatch_time_t v75 = dispatch_time(0LL, 3000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000BFB0;
      block[3] = &unk_100020748;
      block[4] = v107;
      dispatch_after(v75, &_dispatch_main_q, block);
      ((void (*)(void *))v10[2])(v10);
      _Block_object_dispose(v107, 8);

      xpc_object_t v16 = v110;
      goto LABEL_40;
    case 1LL:
      uint64_t v13 = os_transaction_create("com.apple.datamigrator.orderedPluginIdentifiers");
      v14 = (void *)v121[5];
      v121[5] = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrator orderedPluginIdentifiers](self->_migrator, "orderedPluginIdentifiers", v76, v79, v87));
      xpc_object_t v16 = xpc_array_create(0LL, 0LL);
      __int128 v104 = 0u;
      __int128 v105 = 0u;
      __int128 v102 = 0u;
      __int128 v103 = 0u;
      xpc_object_t v12 = v15;
      id v17 = [v12 countByEnumeratingWithState:&v102 objects:v128 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v103;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v103 != v18) {
              objc_enumerationMutation(v12);
            }
            xpc_array_set_string( v16, 0xFFFFFFFFFFFFFFFFLL, (const char *)[*(id *)(*((void *)&v102 + 1) + 8 * (void)i) UTF8String]);
          }

          id v17 = [v12 countByEnumeratingWithState:&v102 objects:v128 count:16];
        }

        while (v17);
      }

      xpc_object_t reply = xpc_dictionary_create_reply(v9);
      xpc_dictionary_set_value(reply, "results", v16);
      xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v9);
      v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      xpc_connection_send_message(v22, reply);
      ((void (*)(void *))v10[2])(v10);

      goto LABEL_40;
    case 2LL:
      BOOL v23 = xpc_dictionary_get_BOOL(v9, "invert");
      BOOL v24 = xpc_dictionary_get_BOOL(v9, "progress");
      uint64_t v25 = os_transaction_create("com.apple.datamigrator.testMigrationUI");
      v26 = (void *)v121[5];
      v121[5] = v25;

      -[DMMigrator testMigrationUIWithProgress:forceInvert:completion:]( self->_migrator,  "testMigrationUIWithProgress:forceInvert:completion:",  v24,  v23,  v10,  v76,  v79,  v87);
      break;
    case 3LL:
      BOOL v27 = xpc_dictionary_get_BOOL(v9, "visible");
      uint64_t v28 = os_transaction_create("com.apple.datamigrator.changeVisibility");
      v29 = (void *)v121[5];
      v121[5] = v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter",  v76,  v79,  v87));
      v31 = kDMMigratorChangeProgressWindowVisibilityNotification;
      v126 = kDMMigratorProgressWindowVisibility;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v27));
      v127 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v127,  &v126,  1LL));
      [v30 postNotificationName:v31 object:0 userInfo:v33];

      xpc_object_t v12 = xpc_dictionary_create_reply(v9);
      xpc_dictionary_set_BOOL(v12, "success", 1);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v12);
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 3LL));
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      _DMLogFunc(v3, 7LL);

      ((void (*)(void *))v10[2])(v10);
      goto LABEL_41;
    case 4LL:
      uint64_t v34 = os_transaction_create("com.apple.datamigrator.forceMigrationOnNextReboot");
      v35 = (void *)v121[5];
      v121[5] = v34;

      -[DMMigrator forceMigrationOnNextRebootWithUserDataDisposition:]( self->_migrator,  "forceMigrationOnNextRebootWithUserDataDisposition:",  xpc_dictionary_get_uint64(v9, "disposition"),  v76,  v79,  v87);
      xpc_object_t v12 = xpc_dictionary_create_reply(v9);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v12);
      ((void (*)(void *))v10[2])(v10);
      goto LABEL_41;
    case 5LL:
      uint64_t v49 = os_transaction_create("com.apple.datamigrator.isMigrationNeeded");
      v50 = (void *)v121[5];
      v121[5] = v49;

      BOOL v51 = -[DMMigrator isMigrationNeeded:](self->_migrator, "isMigrationNeeded:", pid, v76, v79, v87);
      xpc_object_t v12 = xpc_dictionary_create_reply(v9);
      xpc_dictionary_set_BOOL(v12, "isMigrationNeeded", v51);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v12);
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 5LL));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      _DMLogFunc(v3, 7LL);

      ((void (*)(void *))v10[2])(v10);
      goto LABEL_41;
    case 6LL:
      uint64_t v54 = os_transaction_create("com.apple.datamigrator.userDataDisposition");
      v55 = (void *)v121[5];
      v121[5] = v54;

      unsigned int v56 = -[DMMigrator userDataDisposition](self->_migrator, "userDataDisposition", v76, v79, v87);
      xpc_object_t v12 = xpc_dictionary_create_reply(v9);
      xpc_dictionary_set_uint64(v12, "disposition", v56);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v12);
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 6LL));
      v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      _DMLogFunc(v3, 7LL);

      ((void (*)(void *))v10[2])(v10);
      goto LABEL_41;
    case 7LL:
      uint64_t v36 = os_transaction_create("com.apple.datamigrator.previousBuildVersion");
      v37 = (void *)v121[5];
      v121[5] = v36;

      xpc_object_t v12 = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[DMMigrator previousBuildVersion](self->_migrator, "previousBuildVersion", v76, v79, v87));
      xpc_object_t v16 = xpc_dictionary_create_reply(v9);
      if (v12) {
        xpc_dictionary_set_string( v16, "previousBuildVersion", (const char *)[v12 UTF8String]);
      }
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v16);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 7LL));
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      _DMLogFunc(v3, 7LL);

      ((void (*)(void *))v10[2])(v10);
      goto LABEL_40;
    case 8LL:
      uint64_t v58 = os_transaction_create("com.apple.datamigrator.reportMigrationFailure");
      v59 = (void *)v121[5];
      v121[5] = v58;

      -[DMMigrator reportMigrationFailure](self->_migrator, "reportMigrationFailure", v76, v79, v87);
      xpc_object_t v12 = xpc_dictionary_create_reply(v9);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v12);
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 8LL));
      v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      _DMLogFunc(v3, 7LL);

      ((void (*)(void *))v10[2])(v10);
      goto LABEL_41;
    case 9LL:
      uint64_t v39 = os_transaction_create("com.apple.datamigrator.migrationPhaseDescription");
      v40 = (void *)v121[5];
      v121[5] = v39;

      xpc_object_t v12 = (xpc_object_t)objc_claimAutoreleasedReturnValue( -[DMMigrator migrationPhaseDescription]( self->_migrator,  "migrationPhaseDescription",  v76,  v79,  v87));
      xpc_object_t v16 = xpc_dictionary_create_reply(v9);
      if (v12) {
        xpc_dictionary_set_string( v16, "description", (const char *)[v12 UTF8String]);
      }
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v16);
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 9LL));
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      _DMLogFunc(v3, 7LL);

      ((void (*)(void *))v10[2])(v10);
      goto LABEL_40;
    case 10LL:
      uint64_t v60 = os_transaction_create("com.apple.datamigrator.migrationPluginResults");
      v61 = (void *)v121[5];
      v121[5] = v60;

      xpc_object_t v12 = (xpc_object_t)objc_claimAutoreleasedReturnValue( -[DMMigrator migrationPluginResults]( self->_migrator,  "migrationPluginResults",  v76,  v79,  v87));
      xpc_object_t v16 = xpc_dictionary_create_reply(v9);
      if (v12)
      {
        id v100 = 0LL;
        v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  &v100));
        id v63 = v100;
        id v77 = [v62 length];
        _DMLogFunc(v3, 7LL);
        if (objc_msgSend(v62, "length", v77, v63))
        {
          id v64 = v62;
          xpc_dictionary_set_data(v16, "results", [v64 bytes], (size_t)objc_msgSend(v64, "length"));
        }
      }

      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v16);
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 10LL));
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      _DMLogFunc(v3, 7LL);

      ((void (*)(void *))v10[2])(v10);
      goto LABEL_40;
    case 11LL:
      uint64_t v41 = os_transaction_create("com.apple.datamigrator.deferExit");
      v42 = (void *)v121[5];
      v121[5] = v41;

      id v43 = objc_alloc_init(&OBJC_CLASS___DMMigrationDeferredExitManager);
      objc_msgSend(v43, "deferExitWithConnection:", self, v76, v79, v87);

      xpc_object_t v12 = xpc_dictionary_create_reply(v9);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v12);
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 11LL));
      v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      _DMLogFunc(v3, 7LL);

      ((void (*)(void *))v10[2])(v10);
      goto LABEL_41;
    case 12LL:
      uint64_t v44 = os_transaction_create("com.apple.datamigrator.cancelDeferExit");
      v45 = (void *)v121[5];
      v121[5] = v44;

      id v46 = objc_alloc_init(&OBJC_CLASS___DMMigrationDeferredExitManager);
      objc_msgSend(v46, "cancelDeferredExitWithConnection:", self, v76, v79, v87);

      xpc_object_t v12 = xpc_dictionary_create_reply(v9);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v12);
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 12LL));
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      _DMLogFunc(v3, 7LL);

      ((void (*)(void *))v10[2])(v10);
      goto LABEL_41;
    case 13LL:
      uint64_t v65 = os_transaction_create("com.apple.datamigrator.userDataDispositionAuxiliaryData");
      v66 = (void *)v121[5];
      v121[5] = v65;

      xpc_object_t v12 = (xpc_object_t)objc_claimAutoreleasedReturnValue( -[DMMigrator userDataDispositionAuxiliaryData]( self->_migrator,  "userDataDispositionAuxiliaryData",  v76,  v79,  v87));
      xpc_object_t v16 = xpc_dictionary_create_reply(v9);
      if (v12)
      {
        id v101 = 0LL;
        v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  1LL,  &v101));
        id v68 = v101;
        id v78 = [v67 length];
        _DMLogFunc(v3, 7LL);
        if (objc_msgSend(v67, "length", v78, v68))
        {
          id v69 = v67;
          xpc_dictionary_set_data( v16,  "dispositionAuxiliaryData",  [v69 bytes],  (size_t)objc_msgSend(v69, "length"));
        }
      }

      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v16);
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 13LL));
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      _DMLogFunc(v3, 7LL);

      ((void (*)(void *))v10[2])(v10);
LABEL_40:

      goto LABEL_41;
    case 14LL:
      uint64_t v47 = os_transaction_create("com.apple.datamigrator.progressHostIsReady");
      v48 = (void *)v121[5];
      v121[5] = v47;

      -[DMMigrator progressHostIsReady](self->_migrator, "progressHostIsReady", v76, v79, v87);
      xpc_object_t v12 = xpc_dictionary_create_reply(v9);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v99], v12);
      ((void (*)(void *))v10[2])(v10);
LABEL_41:

      break;
    default:
      _DMLogFunc(v3, 7LL);
      break;
  }

  _Block_object_dispose(&v120, 8);
}

- (void).cxx_destruct
{
}

@end