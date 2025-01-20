@interface CLDaemonConditionLedger
- (BOOL)canAddToMonitor;
- (BOOL)isMonitoring;
- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3;
- (BOOL)shouldMigrate;
- (CLClientKeyPath)ckp;
- (CLDaemonConditionLedger)initWithConfiguration:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 hasClassCAccess:(BOOL)a7 callbackHandler:(id)a8;
- (id)callbackHandler;
- (id)containerURLForClientWithClientKey:(id)a3;
- (void)addMonitoringRecord:(id)a3 forIdentifier:(id)a4;
- (void)adjustMonitoringAccordingToClientLedgerDictionary:(id)a3;
- (void)dealloc;
- (void)performMigration;
- (void)refillAwaitingMonitoringConditions:(id)a3;
- (void)removeConditionsWithIdentifiers:(id)a3;
- (void)setCallbackHandler:(id)a3;
- (void)setCkp:(id)a3;
- (void)stopMonitoringAllConditions;
- (void)updateAuthorizationContext:(id)a3;
- (void)updateCallbackHandler:(id)a3;
- (void)updateClientEvent:(id)a3 forIdentifier:(id)a4;
- (void)updateDaemonEvent:(id)a3 forIdentifier:(id)a4;
- (void)updateRecord:(id)a3 identifier:(id)a4;
- (void)validateClientMonitoringRecordsByIdenitifier:(id)a3;
@end

@implementation CLDaemonConditionLedger

- (CLDaemonConditionLedger)initWithConfiguration:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 hasClassCAccess:(BOOL)a7 callbackHandler:(id)a8
{
  if (a7)
  {
    self->_universe = (CLIntersiloUniverse *)a6;
    self->_authContext = (CLClientManagerAuthorizationContext *)a5;
    -[CLDaemonConditionLedger setCallbackHandler:](self, "setCallbackHandler:", a8);
    -[CLDaemonConditionLedger setCkp:](self, "setCkp:", a4);
    id v12 = -[CLDaemonConditionLedger containerURLForClientWithClientKey:]( self,  "containerURLForClientWithClientKey:",  [a4 legacyClientKey]);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101860E58);
    }
    v13 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor Path of the container, containerURL:%{public, location:escape_only}@}",  buf,  0x1Cu);
    }

    v14 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  [v12 path],  @"kCLMonitorLedgerPathKey");
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___CLDaemonConditionLedger;
    return -[CLConditionLedger initWithStoreType:domain:monitorConfiguration:]( &v17,  "initWithStoreType:domain:monitorConfiguration:",  1LL,  1LL,  v14);
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101860E58);
    }
    v16 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor daemon ledger file is not accessible before first unlock, bailing out early}",  buf,  0x12u);
    }

    return 0LL;
  }

- (void)dealloc
{
  if (!-[NSDictionary count]( -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"),  "count")) {
    -[CLConditionLedger deleteLedgerFile](self, "deleteLedgerFile");
  }
  sandbox_extension_release(self->_containerExtensionHandle);
  self->_containerExtensionHandle = -1LL;
  self->_universe = 0LL;

  self->_ckp = 0LL;
  self->_authContext = 0LL;
  -[CLDaemonConditionLedger setCallbackHandler:](self, "setCallbackHandler:", 0LL);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDaemonConditionLedger;
  -[CLConditionLedger dealloc](&v3, "dealloc");
}

- (void)performMigration
{
  if (-[CLDaemonConditionLedger shouldMigrate](self, "shouldMigrate"))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101860E58);
    }
    objc_super v3 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[CLDaemonConditionLedger ckp](self, "ckp");
      v5 = -[CLConditionLedger ledgerName](self, "ledgerName");
      unsigned int v6 = -[NSNumber intValue](-[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber"), "intValue");
      uint64_t buf = 68290050LL;
      __int16 v22 = 2082;
      id v23 = "";
      __int16 v24 = 2114;
      v25 = v4;
      __int16 v26 = 2114;
      v27 = v5;
      __int16 v28 = 1026;
      unsigned int v29 = v6;
      __int16 v30 = 1026;
      int v31 = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor Migrating daemon ledger, clientKey:%{public, location:escape_only}@, led ger:%{public, location:escape_only}@, ledgerExistingVersion:%{public}d, newVersionToMigrateTo:%{public}d}",  (uint8_t *)&buf,  0x32u);
    }

    v7 = +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(CLClientKeyPath **)(*((void *)&v15 + 1) + 8LL * (void)v10);
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101860E58);
          }
          id v12 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
          {
            v13 = -[NSDictionary objectForKeyedSubscript:]( -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"),  "objectForKeyedSubscript:",  v11);
            uint64_t buf = 68289539LL;
            __int16 v22 = 2082;
            id v23 = "";
            __int16 v24 = 2114;
            v25 = v11;
            __int16 v26 = 2113;
            v27 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor removing condition due to migration, identifier:%{public, location:e scape_only}@, record:%{private, location:escape_only}@}",  (uint8_t *)&buf,  0x26u);
          }

          -[CLDaemonConditionLedger removeRecordFromMonitoringWithIdentifier:]( self,  "removeRecordFromMonitoringWithIdentifier:",  v11);
          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
      }

      while (v8);
    }

    if (-[NSArray count](-[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers"), "count"))
    {
      sub_101253A64();
      abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/DaemonIdentifiableClients/CLDaem onConditionLedger.mm",  157,  "-[CLDaemonConditionLedger performMigration]");
      __break(1u);
    }

    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___CLDaemonConditionLedger;
    -[CLConditionLedger setLedgerVersionNumber:](&v14, "setLedgerVersionNumber:", 1LL);
  }

  sub_1001BA1BC(v19);
}

- (BOOL)shouldMigrate
{
  return -[NSNumber intValue](-[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber"), "intValue") < 1;
}

- (id)containerURLForClientWithClientKey:(id)a3
{
  v5 = (std::string *)sub_1010DDBC0(buf, (char *)[a3 UTF8String]);
  sub_100FE3188(v5, (uint64_t)v63);
  if (SBYTE3(v81) < 0) {
    operator delete(*(void **)buf);
  }
  sub_100920610((uint64_t)v63, (uint64_t)__p);
  sub_1004F2598();
  if (!sub_1004F76B8() || (sub_1004F2598(), sub_1004F5330()))
  {
    uint64_t v6 = container_query_create();
    if (!v6)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101860E58);
      }
      id v8 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        uint64_t v9 = (NSURL *)[a3 UTF8String];
        *(void *)uint64_t buf = 68289282LL;
        __int16 v78 = 2082;
        v79 = "";
        __int16 v80 = 2082;
        v81 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#monitor unable to create query, clientKey:%{public, location:escape_only}s}",  buf,  0x1Cu);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101860E58);
        }
      }

      v10 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        v11 = (NSURL *)[a3 UTF8String];
        *(void *)uint64_t buf = 68289282LL;
        __int16 v78 = 2082;
        v79 = "";
        __int16 v80 = 2082;
        v81 = v11;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#monitor unable to create query",  "{msg%{public}.0s:#monitor unable to create query, clientKey:%{public, location:escape_only}s}",  buf,  0x1Cu);
      }

      uint64_t v6 = 0LL;
      goto LABEL_57;
    }

    if (v62 < 0)
    {
      if (__p[1])
      {
        v7 = (void **)__p[0];
LABEL_22:
        __int128 v17 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101860E58);
        }
        __int128 v18 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
        {
          *(void *)uint64_t buf = 68289282LL;
          __int16 v78 = 2082;
          v79 = "";
          __int16 v80 = 2114;
          v81 = (NSURL *)v17;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor platform bundleID is found, platformBundleID:%{public, location:escape_only}@}",  buf,  0x1Cu);
        }

        if (v17)
        {
          sub_1004F2598();
          if (!sub_1004F76B8())
          {
            xpc_object_t v44 = xpc_string_create(-[NSString UTF8String](v17, "UTF8String"));
            container_query_set_identifiers(v6, v44);
            xpc_release(v44);
            container_query_set_class(v6, 12LL);
            int v19 = 0;
            p_vtable = 0LL;
LABEL_33:
            container_query_operation_set_flags(v6, 0x900000001LL);
            container_query_set_persona_unique_string(v6, CONTAINER_PERSONA_PRIMARY);
            if ((v19 & 1) == 0)
            {
              sub_1004F2598();
              if ((sub_1004F76B8() & 1) == 0)
              {
                xpc_object_t v20 = xpc_string_create(-[NSString UTF8String](v17, "UTF8String"));
                container_query_set_identifiers(v6, v20);
                xpc_release(v20);
              }
            }

            uint64_t single_result = container_query_get_single_result(v6);
            uint64_t v22 = single_result;
            if (single_result)
            {
              id v23 = +[NSMutableString stringWithCString:encoding:]( &OBJC_CLASS___NSMutableString,  "stringWithCString:encoding:",  container_get_path(single_result),  4LL);
              __int16 v24 = v23;
              if (v19) {
                -[NSMutableString appendFormat:](v23, "appendFormat:", @"/%@/", p_vtable);
              }
              __int128 v16 = +[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v24, 1LL);
              uint64_t v25 = container_copy_sandbox_token(v22);
              __int16 v26 = (void *)v25;
              if (!v25)
              {
                if (qword_101934980 != -1) {
                  dispatch_once(&qword_101934980, &stru_101860E58);
                }
                v43 = (os_log_s *)qword_101934988;
                if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
                {
                  *(void *)uint64_t buf = 68289026LL;
                  __int16 v78 = 2082;
                  v79 = "";
                  _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor Unable to get sandbox extension from container}",  buf,  0x12u);
                }

                goto LABEL_58;
              }

              int64_t v27 = sandbox_extension_consume(v25);
              free(v26);
              if (v27 < 0)
              {
                if (qword_101934980 != -1) {
                  dispatch_once(&qword_101934980, &stru_101860E58);
                }
                v45 = (os_log_s *)qword_101934988;
                if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
                {
                  int v46 = *__error();
                  *(void *)uint64_t buf = 68289282LL;
                  __int16 v78 = 2082;
                  v79 = "";
                  __int16 v80 = 1026;
                  LODWORD(v81) = v46;
                  _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#monitor Error consuming extension for container, errno:%{public}d}",  buf,  0x18u);
                  if (qword_101934980 != -1) {
                    dispatch_once(&qword_101934980, &stru_101860E58);
                  }
                }

                uint64_t v47 = qword_101934988;
                if (!os_signpost_enabled((os_log_t)qword_101934988)) {
                  goto LABEL_58;
                }
                int v48 = *__error();
                *(void *)uint64_t buf = 68289282LL;
                __int16 v78 = 2082;
                v79 = "";
                __int16 v80 = 1026;
                LODWORD(v81) = v48;
                __int16 v30 = "#monitor Error consuming extension for container";
                int v31 = "{msg%{public}.0s:#monitor Error consuming extension for container, errno:%{public}d}";
                v32 = (os_log_s *)v47;
                uint32_t v33 = 24;
LABEL_105:
                _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v32,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v30,  v31,  buf,  v33);
                goto LABEL_58;
              }

              self->_containerExtensionHandle = v27;
LABEL_42:
              v57.receiver = self;
              v57.super_class = (Class)&OBJC_CLASS___CLDaemonConditionLedger;
              if (!-[CLConditionLedger directoryExists:](&v57, "directoryExists:", v16))
              {
                p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
                if (qword_101934980 == -1) {
                  goto LABEL_44;
                }
                goto LABEL_149;
              }

- (BOOL)isMonitoring
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = -[NSDictionary allValues]( -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier", 0LL),  "allValues");
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) isMonitoring])
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }

  return (char)v3;
}

- (void)validateClientMonitoringRecordsByIdenitifier:(id)a3
{
  if (a3)
  {
    uint64_t v5 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", [a3 allKeys]);
    uint64_t v6 = +[NSMutableSet setWithArray:]( &OBJC_CLASS___NSMutableSet,  "setWithArray:",  -[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers"));
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101860E58);
    }
    v7 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = -[NSMutableSet count](v5, "count");
      NSUInteger v9 = -[NSArray count](-[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers"), "count");
      *(_DWORD *)uint64_t buf = 68289538;
      int v39 = 0;
      __int16 v40 = 2082;
      v41 = "";
      __int16 v42 = 2050;
      id v43 = v8;
      __int16 v44 = 2050;
      NSUInteger v45 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor client has monitoring records, clientCount:%{public}ld, daemonCount:%{public}ld}",  buf,  0x26u);
    }

    -[NSMutableSet minusSet:](v6, "minusSet:", v5);
    -[NSMutableSet unionSet:]( v5,  "unionSet:",  +[NSSet setWithArray:]( &OBJC_CLASS___NSSet,  "setWithArray:",  -[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers")));
    -[NSMutableSet minusSet:](v5, "minusSet:", v6);
    id v10 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v26,  v37,  16LL);
    if (v11)
    {
      uint64_t v12 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend( v10,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v26 + 1) + 8 * (void)i)),  *(void *)(*((void *)&v26 + 1) + 8 * (void)i));
        }

        id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v26,  v37,  16LL);
      }

      while (v11);
    }

    -[CLDaemonConditionLedger removeConditionsWithIdentifiers:](self, "removeConditionsWithIdentifiers:", v6);
    -[CLDaemonConditionLedger adjustMonitoringAccordingToClientLedgerDictionary:]( self,  "adjustMonitoringAccordingToClientLedgerDictionary:",  v10);
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101860E58);
    }
    objc_super v14 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v39 = 0;
      __int16 v40 = 2082;
      v41 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor reiniting all monitored conditions}",  buf,  0x12u);
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v15 = -[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers");
    id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v32,  v46,  16LL);
    if (v16)
    {
      uint64_t v24 = *(void *)v33;
      do
      {
        id v25 = v16;
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v15);
          }
          __int128 v18 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
          int v19 = -[CLDaemonMonitoringRecord initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitoring:callbackHandler:]( objc_alloc(&OBJC_CLASS___CLDaemonMonitoringRecord),  "initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonit oring:callbackHandler:",  -[NSDictionary objectForKeyedSubscript:]( -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"),  "objectForKeyedSubscript:",  v18),  -[CLDaemonConditionLedger ckp](self, "ckp"),  self->_authContext,  self->_universe,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  -[CLClientKeyPath clientKey](-[CLDaemonConditionLedger ckp](self, "ckp"), "clientKey"),  -[CLConditionLedger ledgerName](self, "ledgerName")),  0LL,  -[CLDaemonConditionLedger callbackHandler](self, "callbackHandler"));
          v31.receiver = self;
          v31.super_class = (Class)&OBJC_CLASS___CLDaemonConditionLedger;
          -[CLConditionLedger updateRecord:identifier:](&v31, "updateRecord:identifier:", v19, v18);
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101860E58);
          }
          xpc_object_t v20 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v18 UTF8String];
            *(_DWORD *)uint64_t buf = 68289539;
            int v39 = 0;
            __int16 v40 = 2082;
            v41 = "";
            __int16 v42 = 2082;
            id v43 = v21;
            __int16 v44 = 2113;
            NSUInteger v45 = (NSUInteger)v19;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor reinited record, identifier:%{public, location:escape_only}s, reco rd:%{private, location:escape_only}@}",  buf,  0x26u);
          }
        }

        id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v32,  v46,  16LL);
      }

      while (v16);
    }

    v30.receiver = self;
    v30.super_class = (Class)&OBJC_CLASS___CLDaemonConditionLedger;
    if (!-[CLConditionLedger writeToFile](&v30, "writeToFile"))
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101860E58);
      }
      uint64_t v22 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v39 = 0;
        __int16 v40 = 2082;
        v41 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#monitor #Warning reinited conditions failed to write to disk}",  buf,  0x12u);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101860E58);
        }
      }

      id v23 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v39 = 0;
        __int16 v40 = 2082;
        v41 = "";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#monitor #Warning reinited conditions failed to write to disk",  "{msg%{public}.0s:#monitor #Warning reinited conditions failed to write to disk}",  buf,  0x12u);
      }
    }
  }

  sub_1001BA1BC(v36);
}

- (void)updateRecord:(id)a3 identifier:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLDaemonConditionLedger;
  -[CLConditionLedger updateRecord:identifier:](&v4, "updateRecord:identifier:", a3, a4);
}

- (void)updateAuthorizationContext:(id)a3
{
  self->_authContext = (CLClientManagerAuthorizationContext *)a3;
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101860E58);
  }
  uint64_t v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
  {
    [a3 registrationResult];
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 2050;
    uint64_t v10 = [a3 registrationResult];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#monitor updateAuthContext change, RegistrationResult:%{public, location:CLClientRegi strationResult}lld}",  (uint8_t *)v6,  0x1Cu);
  }

- (void)updateCallbackHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100921488;
  v4[3] = &unk_101860DF8;
  v4[4] = self;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"),  "enumerateKeysAndObjectsUsingBlock:",  v4);
}

- (void)stopMonitoringAllConditions
{
}

- (void)removeConditionsWithIdentifiers:(id)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&__int128 v6 = 68289282LL;
    __int128 v13 = v6;
    do
    {
      __int16 v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v9);
        -[CLDaemonConditionLedger removeRecordFromMonitoringWithIdentifier:]( self,  "removeRecordFromMonitoringWithIdentifier:",  v10,  v13);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101860E58);
        }
        id v11 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v10 UTF8String];
          *(_DWORD *)uint64_t buf = v13;
          int v19 = 0;
          __int16 v20 = 2082;
          id v21 = "";
          __int16 v22 = 2082;
          id v23 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor remove condition, identifier:%{public, location:escape_only}s}",  buf,  0x1Cu);
        }

        __int16 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }

    while (v7);
  }

- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLDaemonConditionLedger;
  BOOL v4 = -[CLConditionLedger removeRecordFromMonitoringWithIdentifier:](&v7, "removeRecordFromMonitoringWithIdentifier:");
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101860E58);
  }
  id v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2114;
    id v13 = a3;
    __int16 v14 = 1026;
    BOOL v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor remove record with identifier from monitoring , identifier:%{public, locatio n:escape_only}@, removeStatus:%{public}hhd}",  buf,  0x22u);
  }

  return v4;
}

- (void)addMonitoringRecord:(id)a3 forIdentifier:(id)a4
{
  id v7 = -[NSDictionary objectForKeyedSubscript:]( -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"),  "objectForKeyedSubscript:",  a4);
  if (!v7
    || (objc_msgSend(objc_msgSend(v7, "clientCondition"), "isEqual:", objc_msgSend(a3, "condition")) & 1) == 0)
  {
    uint64_t v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  -[CLClientKeyPath clientKey](-[CLDaemonConditionLedger ckp](self, "ckp"), "clientKey"),  -[CLConditionLedger ledgerName](self, "ledgerName"));
    if (-[CLDaemonConditionLedger canAddToMonitor](self, "canAddToMonitor"))
    {
      int v9 =  -[CLDaemonMonitoringRecord initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitoring:callbackHandler:]( objc_alloc(&OBJC_CLASS___CLDaemonMonitoringRecord),  "initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitori ng:callbackHandler:",  a3,  -[CLDaemonConditionLedger ckp](self, "ckp"),  self->_authContext,  self->_universe,  v8,  0LL,  -[CLDaemonConditionLedger callbackHandler](self, "callbackHandler"));
      v13.receiver = self;
      v13.super_class = (Class)&OBJC_CLASS___CLDaemonConditionLedger;
      if (!-[CLConditionLedger addRecordForMonitoring:identifier:persist:]( &v13,  "addRecordForMonitoring:identifier:persist:",  v9,  a4,  1LL)) {
        -[CLDaemonMonitoringRecord setPersistenceUnavailable:](v9, "setPersistenceUnavailable:", 1LL);
      }
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101860E58);
      }
      __int16 v10 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        __int128 v18 = "";
        __int16 v19 = 2114;
        __int16 v20 = (NSString *)a4;
        __int16 v21 = 2113;
        __int16 v22 = (CLClientKeyPath *)v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor add record for monitoring, identifier:%{public, location:escape_only}@, record:%{private, location:escape_only}@}",  buf,  0x26u);
      }
    }

    else
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101860E58);
      }
      id v11 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289795;
        int v16 = 0;
        __int16 v17 = 2082;
        __int128 v18 = "";
        __int16 v19 = 2114;
        __int16 v20 = -[CLConditionLedger ledgerName](self, "ledgerName");
        __int16 v21 = 2114;
        __int16 v22 = -[CLDaemonConditionLedger ckp](self, "ckp");
        __int16 v23 = 2113;
        id v24 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Warning #monitor number for monitoring conditions limit reached. Sending unmonitoring state, monitor:%{public, location:escape_only}@, client:%{public, location:escape_only}@, record :%{private, location:escape_only}@}",  buf,  0x30u);
      }

      __int16 v12 =  -[CLDaemonMonitoringRecord initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitoring:callbackHandler:]( objc_alloc(&OBJC_CLASS___CLDaemonMonitoringRecord),  "initWithClientMonitoringRecord:clientKeyPath:authorizationContext:universe:identifier:initForStopMonitor ing:callbackHandler:",  a3,  -[CLDaemonConditionLedger ckp](self, "ckp"),  self->_authContext,  self->_universe,  v8,  1LL,  0LL);
      -[CLDaemonMonitoringRecord setConditionLimitExceeded:](v12, "setConditionLimitExceeded:", 1LL);
      v14.receiver = self;
      v14.super_class = (Class)&OBJC_CLASS___CLDaemonConditionLedger;
      -[CLConditionLedger addRecordForMonitoring:identifier:persist:]( &v14,  "addRecordForMonitoring:identifier:persist:",  v12,  a4,  0LL);
    }
  }

- (void)updateClientEvent:(id)a3 forIdentifier:(id)a4
{
  id v6 = -[NSDictionary objectForKeyedSubscript:]( -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"),  "objectForKeyedSubscript:",  a4);
  if (v6)
  {
    id v7 = v6;
    id v8 = objc_msgSend(objc_msgSend(v6, "clientEvent"), "state");
    if (v8 != [a3 state]
      || (id v9 = objc_msgSend(objc_msgSend(v7, "clientEvent"), "diagnosticMask"), v9 != objc_msgSend(a3, "diagnosticMask")))
    {
      [v7 updateClientEvent:a3];
      -[CLConditionLedger writeToFile](self, "writeToFile");
    }
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_101860E78);
    }
    __int16 v10 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 68289795;
      v11[1] = 0;
      __int16 v12 = 2082;
      objc_super v13 = "";
      __int16 v14 = 2113;
      id v15 = a3;
      __int16 v16 = 2114;
      __int16 v17 = -[CLConditionLedger ledgerName](self, "ledgerName");
      __int16 v18 = 2050;
      __int16 v19 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor received event from client but record doesn't exist, event:%{private, loca tion:escape_only}@, monitor:%{public, location:escape_only}@, this:%{public}p}",  (uint8_t *)v11,  0x30u);
    }
  }

- (void)updateDaemonEvent:(id)a3 forIdentifier:(id)a4
{
  id v5 = -[NSDictionary objectForKeyedSubscript:]( -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"),  "objectForKeyedSubscript:",  a4);
  if (v5)
  {
    [v5 updateDaemonEvent:a3];
  }

  else
  {
    if (qword_101934970 != -1) {
      dispatch_once(&qword_101934970, &stru_101860E78);
    }
    id v6 = (os_log_s *)qword_101934978;
    if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
    {
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      id v11 = "";
      __int16 v12 = 2113;
      id v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#monitor received daemon event from monitored conditions but record doesn't exist, ev ent:%{private, location:escape_only}@}",  (uint8_t *)&v8,  0x1Cu);
      if (qword_101934970 != -1) {
        dispatch_once(&qword_101934970, &stru_101860E78);
      }
    }

    id v7 = (os_log_s *)qword_101934978;
    if (os_signpost_enabled((os_log_t)qword_101934978))
    {
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      id v11 = "";
      __int16 v12 = 2113;
      id v13 = a3;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#monitor received daemon event from monitored conditions but record doesn't exist",  "{msg%{public}.0s:#monitor received daemon event from monitored conditions but record doesn't exist, ev ent:%{private, location:escape_only}@}",  (uint8_t *)&v8,  0x1Cu);
    }
  }

- (void)adjustMonitoringAccordingToClientLedgerDictionary:(id)a3
{
  p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101860E58);
  }
  id v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v47 = 0;
    __int16 v48 = 2082;
    v49 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor validate conditions}",  buf,  0x12u);
  }

  __int128 v34 = -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier");
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = [a3 allKeys];
  id v36 = [obj countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v36)
  {
    uint64_t v33 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        id v9 = [a3 objectForKeyedSubscript:v8];
        __int16 v10 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t buf = 68289283;
          int v47 = 0;
          __int16 v48 = 2082;
          v49 = "";
          __int16 v50 = 2113;
          id v51 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#monitor validating client record, clientRecord:%{private, location:escape_only}@}",  buf,  0x1Cu);
        }

        id v11 = [v9 condition];
        id v12 = -[NSDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v8);
        if (!v12) {
          goto LABEL_33;
        }
        id v13 = v12;
        id v14 = [v12 condition];
        -[CLDaemonConditionLedger updateClientEvent:forIdentifier:]( self,  "updateClientEvent:forIdentifier:",  [v9 lastEvent],  v8);
        unsigned int v15 = [v11 isEqual:v14];
        id v16 = [v13 daemonCondition];
        if (!v15)
        {
          __int16 v18 = p_vtable[304];
          if (v16)
          {
            __int16 v19 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [v8 UTF8String];
              *(_DWORD *)uint64_t buf = 68289795;
              int v47 = 0;
              __int16 v48 = 2082;
              v49 = "";
              __int16 v50 = 2082;
              id v51 = v20;
              __int16 v52 = 2113;
              id v53 = v14;
              __int16 v54 = 2113;
              id v55 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor stop monitoring - client condition changed for identifier, identifie r:%{public, location:escape_only}s, previous:%{private, location:escape_only}@, current:%{priv ate, location:escape_only}@}",  buf,  0x30u);
            }

            [v13 resetDaemonPartOfCondition];
          }

          else
          {
            __int16 v21 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = [v8 UTF8String];
              id v23 = objc_msgSend(objc_msgSend(v13, "recordIdentifier"), "UTF8String");
              *(_DWORD *)uint64_t buf = 68290051;
              int v47 = 0;
              __int16 v48 = 2082;
              v49 = "";
              __int16 v50 = 2082;
              id v51 = v22;
              __int16 v52 = 2082;
              id v53 = v23;
              __int16 v54 = 2113;
              id v55 = v14;
              __int16 v56 = 2113;
              id v57 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor need to stop monitoring by init, identifier:%{public, location:esc ape_only}s, recordIdentifier:%{public, location:escape_only}s, previous:%{private, location:esca pe_only}@, current:%{private, location:escape_only}@}",  buf,  0x3Au);
            }

            p_vtable = (void **)(&OBJC_METACLASS___CLPrivacyManager + 24);
          }

          -[CLDaemonConditionLedger removeRecordFromMonitoringWithIdentifier:]( self,  "removeRecordFromMonitoringWithIdentifier:",  v8);
LABEL_33:
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, v8);
          continue;
        }

        if (!v16)
        {
          objc_msgSend( v13,  "setupDaemonPartOfConditionWithAuthContext:clientKeyPath:universe:identifier:stopMonitoring:callbackHandler:",  self->_authContext,  -[CLDaemonConditionLedger ckp](self, "ckp"),  self->_universe,  objc_msgSend(v13, "recordIdentifier"),  0,  -[CLDaemonConditionLedger callbackHandler](self, "callbackHandler"));
          __int16 v17 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68289283;
            int v47 = 0;
            __int16 v48 = 2082;
            v49 = "";
            __int16 v50 = 2113;
            id v51 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor setup monitoring daemon parts, daemonCondition:%{private, location:escape_only}@}",  buf,  0x1Cu);
          }
        }
      }

      id v36 = [obj countByEnumeratingWithState:&v41 objects:v58 count:16];
    }

    while (v36);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v24 = -[NSMutableDictionary allKeys](v6, "allKeys");
  id v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      __int128 v28 = 0LL;
      do
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)v28);
        id v30 = -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v29);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101860E58);
        }
        objc_super v31 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289283;
          int v47 = 0;
          __int16 v48 = 2082;
          v49 = "";
          __int16 v50 = 2113;
          id v51 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#monitor created daemon record, record:%{private, location:escape_only}@}",  buf,  0x1Cu);
        }

        -[CLDaemonConditionLedger addMonitoringRecord:forIdentifier:]( self,  "addMonitoringRecord:forIdentifier:",  v30,  v29);
        __int128 v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }

    while (v26);
  }
}

- (BOOL)canAddToMonitor
{
  return -[NSArray count](-[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers"), "count") < 0x14;
}

- (void)refillAwaitingMonitoringConditions:(id)a3
{
  NSUInteger v5 = -[NSArray count](-[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers"), "count");
  if (v5 != 20)
  {
    NSUInteger v6 = v5;
    id v7 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", [a3 allKeys]);
    -[NSMutableSet minusSet:]( v7,  "minusSet:",  +[NSMutableSet setWithArray:]( &OBJC_CLASS___NSMutableSet,  "setWithArray:",  -[CLConditionLedger allMonitoringIdentifiers](self, "allMonitoringIdentifiers")));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v8)
    {
      id v9 = v8;
      NSUInteger v10 = 20 - v6;
      uint64_t v11 = *(void *)v14;
LABEL_4:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v7);
        }
        -[CLDaemonConditionLedger addMonitoringRecord:forIdentifier:]( self,  "addMonitoringRecord:forIdentifier:",  [a3 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v12)],  *(void *)(*((void *)&v13 + 1) + 8 * v12));
        if (v10 - 1 == v12) {
          break;
        }
        if (v9 == (id)++v12)
        {
          id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
          v10 -= v12;
          if (v9) {
            goto LABEL_4;
          }
          return;
        }
      }
    }
  }

- (id)callbackHandler
{
  return objc_getProperty(self, a2, 80LL, 1);
}

- (void)setCallbackHandler:(id)a3
{
}

- (CLClientKeyPath)ckp
{
  return (CLClientKeyPath *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCkp:(id)a3
{
}

@end