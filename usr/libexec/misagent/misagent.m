uint64_t sub_100003F1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100004004(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  int v5 = sqlite3_bind_parameter_index(a2, "@predicate");
  sqlite3_bind_text(a2, v5, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
  int v6 = sqlite3_bind_parameter_index(a2, "@wildcard");
  return sqlite3_bind_int(a2, v6, *(unsigned __int8 *)(a1 + 48));
}

void sub_10000424C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100004270(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004280(uint64_t a1)
{
}

uint64_t sub_100004288(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) readSetting:@"databaseSchemaVersion"]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  int v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (!v5)
  {
    id v10 = sub_10000758C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "MISQL: null version, potential erase or updgrade",  buf,  2u);
    }

    [*(id *)(a1 + 32) setSetting:@"databaseSchemaVersion" toValue:@"1"];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "executeQuery:withBind:withResults:",  @"CREATE TABLE profiles(uuid TEXT NOT NULL PRIMARY KEY, team_id TEXT NOT NULL, install_time TEXT DEFAULT CURRENT_TIMESTAMP, name TEXT NOT NULL, expires INTEGER, is_for_all_devices INTEGER, is_apple_internal INTEGER, is_local INTEGER, is_beta INTEGER, cms_blob BLOB NOT NULL)",  0,  0);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      id v12 = sub_10000758C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000AFA0(a1 + 48);
      }
      goto LABEL_41;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "executeQuery:withBind:withResults:",  @"CREATE TABLE certificates(pk INTEGER PRIMARY KEY AUTOINCREMENT, leaf BLOB UNIQUE NOT NULL)",  0,  0);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      id v13 = sub_10000758C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000AF38(a1 + 48);
      }
      goto LABEL_41;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) executeQuery:@"CREATE UNIQUE INDEX certificate_leaf_index ON certificates (leaf)" withBind:0 withResults:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      id v15 = sub_10000758C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000AED0(a1 + 48);
      }
      goto LABEL_41;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "executeQuery:withBind:withResults:",  @"CREATE TABLE certificate_provisioning_cache(pk INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT NOT NULL, leaf_pk INTEGER NOT NULL, UNIQUE(uuid, leaf_pk), CONSTRAINT fk_certificate_leaf  FOREIGN KEY (leaf_pk)  REFERENCES certificates(pk)  ON DELETE CASCADE, CONSTRAINT fk_cert_profile_uuid  FOREIGN KEY (uuid)  REFERENCES profiles(uuid)   ON DELETE CASCADE)",  0,  0);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      id v33 = sub_10000758C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000AE68(a1 + 48);
      }
      goto LABEL_41;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "executeQuery:withBind:withResults:",  @"CREATE TABLE entitlements_provisioning_cache(pk INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT NOT NULL, predicate TEXT NOT NULL, wildcard INTEGER NOT NULL, UNIQUE(uuid, predicate), CONSTRAINT fk_predicate_profile_uuid  FOREIGN KEY (uuid)  REFERENCES profiles(uuid)   ON DELETE CASCADE)",  0,  0);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      id v34 = sub_10000758C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000AE00(a1 + 48);
      }
      goto LABEL_41;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "executeQuery:withBind:withResults:",  @"CREATE UNIQUE INDEX entitlements_cache_index ON entitlements_provisioning_cache (uuid, predicate)",  0,  0);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      id v35 = sub_10000758C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000AD98(a1 + 48);
      }
      goto LABEL_41;
    }

    uint64_t v36 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = @"1";

    int v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  }

  if ([v5 isEqualToString:@"1"])
  {
    id v6 = sub_10000758C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "MISQL: performing database migration 1 -> 2",  buf,  2u);
    }

    [*(id *)(a1 + 32) setSetting:@"databaseSchemaVersion" toValue:@"2"];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) executeQuery:@"ALTER TABLE profiles ADD COLUMN is_der INTEGER DEFAULT (0)" withBind:0 withResults:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      id v8 = sub_10000758C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000AD30(a1 + 48);
      }
LABEL_41:
      uint64_t v29 = 0LL;
LABEL_42:

      return v29;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend( *(id *)(a1 + 32),  "executeQuery:withBind:withResults:",  @"CREATE TABLE xml_profiles_cache(uuid TEXT NOT NULL PRIMARY KEY, cms_blob BLOB NOT NULL, CONSTRAINT fk_xml_profile_cache_uuid  FOREIGN KEY (uuid)  REFERENCES profiles(uuid)   ON DELETE CASCADE)",  0,  0);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      id v14 = sub_10000758C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000ACC8(a1 + 48);
      }
      goto LABEL_41;
    }

    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = @"2";
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:@"2"])
  {
    id v18 = sub_10000758C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "MISQL: performing database migration 2 -> 3",  buf,  2u);
    }

    [*(id *)(a1 + 32) setSetting:@"databaseSchemaVersion" toValue:@"3"];
    v20 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) findProfilesMatchingEntitlements:&off_1000116C0 withCertificate:0]);
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    uint64_t v9 = v20;
    id v21 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v40,  v45,  16LL);
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v41;
      uint64_t v38 = a1 + 48;
      while (2)
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(v9);
          }
          v25 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
          if (!objc_msgSend(v25, "ProvisionsAllDevices", v38)
            && ![v25 AppleInternal])
          {
            v26 = *(void **)(a1 + 32);
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472LL;
            v39[2] = sub_100004928;
            v39[3] = &unk_100010760;
            v39[4] = v25;
            *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v26 executeQuery:@"UPDATE profiles SET is_beta = 1 WHERE uuid = @uuid" withBind:v39 withResults:0];
            if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
            {
              id v30 = sub_10000758C();
              v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                sub_10000AC60(v38);
              }

              goto LABEL_41;
            }
          }
        }

        id v22 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v40,  v45,  16LL);
        if (v22) {
          continue;
        }
        break;
      }
    }

    uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = @"3";

    uint64_t v29 = 1LL;
    goto LABEL_42;
  }

  return 1LL;
}

void sub_100004928(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  id v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUID]);
  sqlite3_bind_text(a2, v4, (const char *)[v5 UTF8String], -1, 0);
}

void sub_100004A5C(_Unwind_Exception *a1)
{
}

BOOL sub_100004A74(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isProfileInstalled:MISProvisioningProfileGetUUID(*(void *)(a1 + 48))]) {
    return 1LL;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 56) insertProfile:*(void *)(a1 + 48)];
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == 0;
}

void sub_100004B9C(_Unwind_Exception *a1)
{
}

BOOL sub_100004BB4(void *a1)
{
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 56) removeProfile:a1[5]];
  return *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) == 0;
}

void sub_100004CF8(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"profile_cms_blob"]);
  id v6 = sub_10000A9AC(a2, (int)[v5 intValue]);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  [*(id *)(a1 + 32) addObject:v7];
}

void sub_100004D70(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"blob"]);
  id v6 = sub_10000A9AC(a2, (int)[v5 intValue]);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  [*(id *)(a1 + 32) addObject:v7];
}

void sub_100004E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[BoxedMISProfile fromSQLStatement:withMap:]( &OBJC_CLASS___BoxedMISProfile,  "fromSQLStatement:withMap:",  a2,  a3));
  [v3 addObject:v4];
}

id sub_100004FBC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_100005178(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 0;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@","];
  }
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"(%lu,@p%lu)", a3, a3);
}

id sub_1000051CC(uint64_t a1, sqlite3_stmt *a2)
{
  if (*(void *)(a1 + 32))
  {
    int v4 = sqlite3_bind_parameter_index(a2, "@cert");
    sqlite3_bind_blob( a2, v4, [*(id *)(a1 + 32) bytes], (int)objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  }

  int v5 = sqlite3_bind_parameter_index(a2, "@totalPredicates");
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 40) count]));
  sqlite3_bind_int64(a2, v5, (sqlite3_int64)[v6 longLongValue]);

  id result = [*(id *)(a1 + 40) count];
  if (result)
  {
    unint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    do
    {
      id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"@p%u", v9));
      int v11 = sqlite3_bind_parameter_index(a2, (const char *)[v10 UTF8String]);
      id v12 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:v8]);
      sqlite3_bind_text(a2, v11, (const char *)[v12 UTF8String], -1, 0);

      unint64_t v8 = (v9 + 1);
      id result = [*(id *)(a1 + 40) count];
      unint64_t v9 = v8;
    }

    while ((unint64_t)result > v8);
  }

  return result;
}

void sub_10000534C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[BoxedMISProfile fromSQLStatement:withMap:]( &OBJC_CLASS___BoxedMISProfile,  "fromSQLStatement:withMap:",  a2,  a3));
  [v3 addObject:v4];
}

uint64_t sub_1000054C0(uint64_t result, sqlite3_stmt *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v3 = result;
    int v4 = sqlite3_bind_parameter_index(a2, "@cert");
    return sqlite3_bind_blob( a2, v4, [*(id *)(v3 + 32) bytes], (int)objc_msgSend(*(id *)(v3 + 32), "length"), 0);
  }

  return result;
}

void sub_100005540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[BoxedMISProfile fromSQLStatement:withMap:]( &OBJC_CLASS___BoxedMISProfile,  "fromSQLStatement:withMap:",  a2,  a3));
  [v3 addObject:v4];
}

const char *sub_100005608(uint64_t a1)
{
  return sqlite3_errstr(*(_DWORD *)(*(void *)(*(void *)a1 + 8LL) + 24LL));
}

void sub_10000561C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

const char *sub_100005648()
{
  return "/Library/MobileDevice/ProvisioningProfiles";
}

void start()
{
  v0 = (dispatch_queue_s *)sub_100005704();
  uint64_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_100005744;
  handler[3] = &unk_100010898;
  handler[4] = v1;
  dispatch_source_set_event_handler(v1, handler);
  dispatch_resume(v1);
  uint64_t v2 = (dispatch_queue_s *)sub_100005704();
  mach_service = xpc_connection_create_mach_service("com.apple.misagent", v2, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000108D8);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

uint64_t sub_100005704()
{
  if (qword_100014B08 != -1) {
    dispatch_once(&qword_100014B08, &stru_100010918);
  }
  return qword_100014B00;
}

void sub_100005744(uint64_t a1)
{
}

void sub_10000575C(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_retain(a2);
    xpc_connection_set_finalizer_f((xpc_connection_t)a2, (xpc_finalizer_t)sub_100005888);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_1000058E4;
    handler[3] = &unk_100010938;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    int v5 = (os_log_s *)sub_10000758C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000B008((uint64_t)string, v5);
    }
  }
}

void sub_100005840(id a1)
{
  qword_100014B00 = (uint64_t)dispatch_workloop_create_inactive("com.apple.misagent.worker");
  dispatch_set_qos_class_fallback();
  dispatch_workloop_set_scheduler_priority(qword_100014B00, 36LL, 1LL);
  dispatch_activate((dispatch_object_t)qword_100014B00);
}

void sub_100005888()
{
  v0 = (os_log_s *)sub_10000758C();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "XPC connection has been town down", v1, 2u);
  }

void sub_1000058E4(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    CFTypeRef cf = 0LL;
    if (lockdown_copy_checkin_info(object, &cf))
    {
      sub_100006040(*(void **)(a1 + 32), object);
    }

    else
    {
      sub_100008768(cf);
      CFRelease(cf);
    }
  }

  else if (type == (xpc_type_t)&_xpc_type_error && sub_100005FC0(object))
  {
    int v5 = (os_log_s *)sub_10000758C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Releasing XPC connection", v6, 2u);
    }

    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    xpc_release(*(xpc_object_t *)(a1 + 32));
  }

uint64_t sub_1000059C4(uint64_t a1)
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100005A50;
  v3[3] = &unk_100010960;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync(&_dispatch_main_q, v3);
  uint64_t v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_100005A50(uint64_t a1)
{
  if (MISProvisioningProfileIsForBetaDeployment(*(void *)(a1 + 40)))
  {
    id v2 = sub_10000758C();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Attempt to install a Beta profile over lockdown connection.",  v5,  2u);
    }

    uint64_t result = 3892346911LL;
  }

  else
  {
    uint64_t result = sub_100005AE4(*(void *)(a1 + 40));
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_100005AE4(uint64_t a1)
{
  uint64_t v2 = sub_100006E18(a1);
  id v3 = sub_10000758C();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v2)
  {
    if (v5)
    {
      int v10 = 67109120;
      LODWORD(UUID) = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "attempt to install invalid profile: 0x%x",  (uint8_t *)&v10,  8u);
    }
  }

  else
  {
    if (v5)
    {
      int v10 = 138412290;
      uint64_t UUID = MISProvisioningProfileGetUUID(a1);
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Installing provisioning profile: %@",  (uint8_t *)&v10,  0xCu);
    }

    id v6 = sub_100006EC0();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    else {
      uint64_t v2 = 0LL;
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"MISProvisioningProfileInstalled", 0LL, 0LL, 0);
  }

  return v2;
}

uint64_t sub_100005C28(uint64_t a1)
{
  uint64_t v4 = 0LL;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100005CB4;
  v3[3] = &unk_100010960;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync(&_dispatch_main_q, v3);
  uint64_t v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005CB4(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
}

void sub_100005CE4(uint64_t a1)
{
  id v2 = sub_10000758C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Removing provisioning profile: %@",  (uint8_t *)&v7,  0xCu);
  }

  id v4 = sub_100006EC0();
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 removeProfile:a1];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"MISProvisioningProfileRemoved", 0LL, 0LL, 0);
}

uint64_t sub_100005DB8(uint64_t a1)
{
  uint64_t v4 = 0LL;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100005E44;
  v3[3] = &unk_100010960;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync(&_dispatch_main_q, v3);
  uint64_t v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005E44(uint64_t a1)
{
  id v2 = *(__CFArray ***)(a1 + 40);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    uint64_t v4 = Mutable;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = sub_100006EC0();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allCMSBlobs", 0));

    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        int v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          CFArrayAppendValue(v4, *(const void **)(*((void *)&v15 + 1) + 8LL * (void)v11));
          int v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }

    int v12 = 0;
    *id v2 = v4;
  }

  else
  {
    id v13 = sub_10000758C();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000B07C();
    }

    int v12 = -402620406;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v12;
}

BOOL sub_100005FC0(xpc_object_t xdict)
{
  if (xdict != &_xpc_error_connection_invalid)
  {
    xpc_dictionary_get_string(xdict, _xpc_error_key_description);
    id v2 = sub_10000758C();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000B0A8();
    }
  }

  return xdict == &_xpc_error_connection_invalid;
}

void sub_100006040(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v147 = objc_autoreleasePoolPush();
  string = xpc_dictionary_get_string(v4, "MessageType");
  v145 = v3;
  v146 = v4;
  if (!string)
  {
    id v9 = sub_10000758C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000B108(v8, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_10;
  }

  uint64_t v6 = string;
  if (!strcmp(string, "Ping"))
  {
    __int128 v17 = (_xpc_connection_s *)v3;
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_string(reply, "Payload", "pong!");
    xpc_dictionary_set_uint64(reply, "Status", 0LL);
    xpc_connection_send_message(v17, reply);

    goto LABEL_130;
  }

  if (!strcmp(v6, "Install"))
  {
    id v19 = v3;
    id v20 = v4;
    *(void *)&__int128 length = 0LL;
    data = (const UInt8 *)xpc_dictionary_get_data(v20, "Profile", (size_t *)&length);
    if (!data)
    {
      id v52 = sub_10000758C();
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_10000B178(v53, v54, v55, v56, v57, v58, v59, v60);
      }

      CFDataRef v22 = 0LL;
      int v26 = -402620403;
      goto LABEL_127;
    }

    CFDataRef v22 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, data, length, kCFAllocatorNull);
    if (!v22)
    {
      id v83 = sub_10000758C();
      v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        sub_10000B1E8();
      }

      CFDataRef v22 = 0LL;
      int v26 = -402620406;
      goto LABEL_127;
    }

    uint64_t v23 = objc_autoreleasePoolPush();
    uint64_t v24 = MISProfileCreateWithData(kCFAllocatorDefault, v22);
    v25 = (void *)v24;
    if (!v24)
    {
      id v108 = sub_10000758C();
      v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
        sub_10000B214();
      }

      int v26 = -402620406;
      goto LABEL_126;
    }

    int v26 = MISProvisioningProfileValidateSignature(v24);
    if (!v26)
    {
      if (MISProvisioningProfileIsForBetaDeployment(v25))
      {
        uint64_t v27 = (_xpc_connection_s *)v19;
        v28 = (void *)xpc_connection_copy_entitlement_value();
        pid_t pid = xpc_connection_get_pid(v27);

        if (v28 != &_xpc_BOOL_true)
        {
          id v30 = sub_10000758C();
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_10000B26C(pid, v31);
          }

          id v32 = sub_10000758C();
          id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10000B240();
          }

          int v26 = -402620385;
          goto LABEL_126;
        }
      }

      int v26 = sub_100005AE4((uint64_t)v25);
    }

LABEL_126:
    objc_autoreleasePoolPop(v23);
LABEL_127:
    xpc_object_t v136 = xpc_dictionary_create_reply(v20);
    xpc_dictionary_set_uint64(v136, "Status", v26);
    xpc_connection_send_message((xpc_connection_t)v19, v136);
    if (v22) {
      CFRelease(v22);
    }

    goto LABEL_130;
  }

  if (!strcmp(v6, "Remove"))
  {
    id v34 = (_xpc_connection_s *)v3;
    id v35 = v4;
    uint64_t v36 = xpc_dictionary_get_string(v35, "ProfileID");
    if (v36)
    {
      CFStringRef v37 = CFStringCreateWithCString(kCFAllocatorDefault, v36, 0x8000100u);
      if (v37)
      {
        CFStringRef v38 = v37;
        sub_100005CE4((uint64_t)v37);
        uint64_t v39 = 0LL;
      }

      else
      {
        id v104 = sub_10000758C();
        v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
          sub_10000B360();
        }

        CFStringRef v38 = 0LL;
        uint64_t v39 = -402620406LL;
      }
    }

    else
    {
      id v74 = sub_10000758C();
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        sub_10000B2F0(v75, v76, v77, v78, v79, v80, v81, v82);
      }

      CFStringRef v38 = 0LL;
      uint64_t v39 = -402620403LL;
    }

    xpc_object_t v106 = xpc_dictionary_create_reply(v35);

    xpc_dictionary_set_uint64(v106, "Status", v39);
    xpc_connection_send_message(v34, v106);

    if (v38) {
      CFRelease(v38);
    }

    goto LABEL_130;
  }

  if (!strcmp(v6, "CopyAll"))
  {
    __int128 v40 = (_xpc_connection_s *)v3;
    id v41 = v4;
    xpc_object_t empty = xpc_array_create_empty();
    if (empty)
    {
      __int128 v162 = 0u;
      __int128 v163 = 0u;
      *(_OWORD *)buffer = 0u;
      __int128 v161 = 0u;
      id v43 = sub_100006EC0();
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 allProfiles]);

      uint64_t v46 = (uint64_t)[v45 countByEnumeratingWithState:buffer objects:&length count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v161;
        while (2)
        {
          for (uint64_t i = 0LL; i != v46; ++i)
          {
            if (*(void *)v161 != v47) {
              objc_enumerationMutation(v45);
            }
            id v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)&buffer[8]
                                                                                                  + 8 * i), "UUID")));
            xpc_object_t v50 = xpc_string_create((const char *)[v49 UTF8String]);

            if (!v50)
            {
              int v51 = 0;
              uint64_t v46 = -402620382LL;
              goto LABEL_107;
            }

            xpc_array_append_value(empty, v50);
          }

          uint64_t v46 = (uint64_t)[v45 countByEnumeratingWithState:buffer objects:&length count:16];
          int v51 = 1;
          if (v46) {
            continue;
          }
          break;
        }
      }

      else
      {
        int v51 = 1;
      }
    }

    else
    {
      id v107 = sub_10000758C();
      v45 = (void *)objc_claimAutoreleasedReturnValue(v107);
      uint64_t v46 = -402620406LL;
      if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR)) {
        sub_10000B38C();
      }
      int v51 = 0;
    }

LABEL_107:
    xpc_object_t v121 = xpc_dictionary_create_reply(v41);
    xpc_dictionary_set_uint64(v121, "Status", v46);
    if (v51) {
      xpc_dictionary_set_value(v121, "Payload", empty);
    }
    xpc_connection_send_message(v40, v121);

    goto LABEL_130;
  }

  if (!strcmp(v6, "CopySingle"))
  {
    v61 = (_xpc_connection_s *)v3;
    id v62 = v4;
    *(void *)&__int128 length = 0LL;
    *((void *)&length + 1) = &length;
    uint64_t v156 = 0x3032000000LL;
    v157 = sub_10000722C;
    v158 = sub_10000723C;
    id v159 = 0LL;
    v63 = xpc_dictionary_get_string(v62, "ProfileID");
    if (v63)
    {
      v64 = CFStringCreateWithCString(kCFAllocatorDefault, v63, 0x8000100u);
      if (CFStringGetLength(v64) == 36)
      {
        CFStringGetCString(v64, buffer, 37LL, 0x8000100u);
        unint64_t v65 = 0LL;
        BOOL v66 = 0;
        do
        {
          int v67 = buffer[v65];
          BOOL v68 = (v67 - 58) > 0xFFFFFFF5 || (v67 - 71) > 0xFFFFFFF9;
          BOOL v66 = v65++ > 0x22;
        }

        while (v65 != 36);
        if (v66)
        {
          BOOL v69 = xpc_dictionary_get_BOOL(v62, "ForceXML");
          id v70 = sub_100006EC0();
          v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
          *(void *)buffer = _NSConcreteStackBlock;
          *(void *)&buffer[8] = 3221225472LL;
          *(void *)&__int128 v161 = sub_100007244;
          *((void *)&v161 + 1) = &unk_1000109C8;
          *(void *)&__int128 v162 = &length;
          [v71 queryCMSBlobForProfile:v64 forcingXML:v69 handler:buffer];

          if (*(void *)(*((void *)&length + 1) + 40LL))
          {
            uint64_t v72 = 0LL;
            int v73 = 1;
LABEL_101:
            xpc_object_t v120 = xpc_dictionary_create_reply(v62);
            xpc_dictionary_set_uint64(v120, "Status", v72);
            if (v73) {
              xpc_dictionary_set_value(v120, "Payload", *(xpc_object_t *)(*((void *)&length + 1) + 40LL));
            }
            xpc_connection_send_message(v61, v120);
            if (v64) {
              CFRelease(v64);
            }

            _Block_object_dispose(&length, 8);
            goto LABEL_130;
          }

          id v137 = sub_10000758C();
          v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
          uint64_t v72 = -402620406LL;
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
            sub_10000B428();
          }
LABEL_100:

          int v73 = 0;
          goto LABEL_101;
        }
      }

      id v110 = sub_10000758C();
      v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
        sub_10000B454();
      }
    }

    else
    {
      id v112 = sub_10000758C();
      v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
        sub_10000B3B8(v111, v113, v114, v115, v116, v117, v118, v119);
      }
      v64 = 0LL;
    }

    uint64_t v72 = -402620403LL;
    goto LABEL_100;
  }

  if (strcmp(v6, "CopyMatching"))
  {
    id v7 = sub_10000758C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000B4B4((uint64_t)v6, v8);
    }
LABEL_10:

    goto LABEL_130;
  }

  connection = (_xpc_connection_s *)v3;
  id v143 = v4;
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v143, "Payload");
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue(dictionary);
  if (xdict)
  {
    context = objc_autoreleasePoolPush();
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
    size_t v150 = 0LL;
    v86 = xpc_dictionary_get_data(xdict, "Cert", &v150);
    xpc_object_t array = xpc_dictionary_get_array(xdict, "Predicates");
    xxpc_object_t array = (xpc_object_t)objc_claimAutoreleasedReturnValue(array);
    v139 = 0LL;
    if (v86 && v150) {
      v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v86));
    }
    if (xarray)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472LL;
      applier[2] = sub_100007304;
      applier[3] = &unk_1000109F0;
      id v149 = v141;
      xpc_array_apply(xarray, applier);
    }

    xpc_object_t v88 = xpc_array_create_empty();
    id v89 = sub_10000758C();
    v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      LODWORD(length) = 138412290;
      *(void *)((char *)&length + 4) = v141;
      _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_INFO,  "Copying profiles for %@",  (uint8_t *)&length,  0xCu);
    }

    if ([v141 count])
    {
      __int128 v162 = 0uLL;
      __int128 v163 = 0uLL;
      *(_OWORD *)buffer = 0uLL;
      __int128 v161 = 0uLL;
      id v91 = sub_100006EC0();
      v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
      v93 = (void *)objc_claimAutoreleasedReturnValue([v92 findProfilesMatchingPredicates:v141 withCertificate:v139]);

      id v94 = [v93 countByEnumeratingWithState:buffer objects:&length count:16];
      if (v94)
      {
        uint64_t v95 = *(void *)v161;
        do
        {
          for (j = 0LL; j != v94; j = (char *)j + 1)
          {
            if (*(void *)v161 != v95) {
              objc_enumerationMutation(v93);
            }
            v97 = *(void **)(*(void *)&buffer[8] + 8LL * (void)j);
            id v98 = sub_10000758C();
            v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
            if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
            {
              v100 = (void *)objc_claimAutoreleasedReturnValue([v97 UUID]);
              v101 = (void *)objc_claimAutoreleasedReturnValue([v97 Name]);
              *(_DWORD *)buf = 138412546;
              v152 = v100;
              __int16 v153 = 2112;
              v154 = v101;
              _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "Sending %@ - %@", buf, 0x16u);
            }

            id v102 = sub_100007358(v97);
            v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
            xpc_array_append_value(v88, v103);
          }

          id v94 = [v93 countByEnumeratingWithState:buffer objects:&length count:16];
        }

        while (v94);
      }
    }

    else
    {
      __int128 v162 = 0uLL;
      __int128 v163 = 0uLL;
      *(_OWORD *)buffer = 0uLL;
      __int128 v161 = 0uLL;
      id v123 = sub_100006EC0();
      v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
      v93 = (void *)objc_claimAutoreleasedReturnValue([v124 findProfilesWithCertificate:v139]);

      id v125 = [v93 countByEnumeratingWithState:buffer objects:&length count:16];
      if (v125)
      {
        uint64_t v126 = *(void *)v161;
        do
        {
          for (k = 0LL; k != v125; k = (char *)k + 1)
          {
            if (*(void *)v161 != v126) {
              objc_enumerationMutation(v93);
            }
            v128 = *(void **)(*(void *)&buffer[8] + 8LL * (void)k);
            id v129 = sub_10000758C();
            v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);
            if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
            {
              v131 = (void *)objc_claimAutoreleasedReturnValue([v128 UUID]);
              v132 = (void *)objc_claimAutoreleasedReturnValue([v128 Name]);
              *(_DWORD *)buf = 138412546;
              v152 = v131;
              __int16 v153 = 2112;
              v154 = v132;
              _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_INFO, "Sending %@ - %@", buf, 0x16u);
            }

            id v133 = sub_100007358(v128);
            v134 = (void *)objc_claimAutoreleasedReturnValue(v133);
            xpc_array_append_value(v88, v134);
          }

          id v125 = [v93 countByEnumeratingWithState:buffer objects:&length count:16];
        }

        while (v125);
      }
    }

    objc_autoreleasePoolPop(context);
    uint64_t v122 = 0LL;
  }

  else
  {
    xpc_object_t v88 = 0LL;
    uint64_t v122 = -402620415LL;
  }

  xpc_object_t v135 = xpc_dictionary_create_reply(v143);
  xpc_dictionary_set_uint64(v135, "Status", v122);
  if (xdict) {
    xpc_dictionary_set_value(v135, "Payload", v88);
  }
  xpc_connection_send_message(connection, v135);

LABEL_130:
  objc_autoreleasePoolPop(v147);
}

void sub_100006DEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t sub_100006E18(uint64_t a1)
{
  id v2 = sub_1000074EC();
  if (v2)
  {
    id v3 = v2;
    CFAbsoluteTime Current = j__CFAbsoluteTimeGetCurrent();
    CFDateRef v5 = CFDateCreate(kCFAllocatorDefault, Current);
    uint64_t v6 = MISProvisioningProfileCheckValidity(a1, v3, v5);
    CFRelease(v5);
    CFRelease(v3);
    return v6;
  }

  else
  {
    id v8 = sub_10000758C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000B538();
    }

    return 3892346881LL;
  }

id sub_100006EC0()
{
  if (qword_100014B18 != -1) {
    dispatch_once(&qword_100014B18, &stru_1000109A0);
  }
  return (id)qword_100014B10;
}

void sub_100006F00(id a1)
{
  uint64_t v1 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100005648());
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v2));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"/mis.db"]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[SQLDB databaseWithURL:](&OBJC_CLASS___MISDBManager, "databaseWithURL:", v4));
  uint64_t v6 = (void *)qword_100014B10;
  qword_100014B10 = v5;

  id v7 = sub_100005648();
  id v8 = opendir(v7);
  if (v8)
  {
    id v9 = v8;
    for (uint64_t i = readdir(v8); i; uint64_t i = readdir(v9))
    {
      if (i->d_type == 8)
      {
        d_name = i->d_name;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", i->d_name));
        if ([v12 length] == (id)36)
        {
          uint64_t v13 = sub_100005648();
          uint64_t v14 = snprintf(__str, 0x400uLL, "%s/%s", v13, d_name);
          int v15 = sub_1000070C8(v14, __str);

          if (!v15) {
            break;
          }
        }

        else
        {
        }
      }
    }

    closedir(v9);
  }

  else if (*__error() != 2)
  {
    __error();
    id v16 = sub_10000758C();
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000B564();
    }
  }
}

uint64_t sub_1000070C8(uint64_t a1, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithFileSystemRepresentation(kCFAllocatorDefault, a2);
  if (v3)
  {
    CFStringRef v4 = v3;
    uint64_t v5 = (const void *)MISProfileCreateWithFile(kCFAllocatorDefault, v3);
    CFRelease(v4);
    if (v5)
    {
      if (!sub_100006E18((uint64_t)v5)
        && ![(id)qword_100014B10 insertProfile:v5])
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
        id v15 = 0LL;
        [v6 removeItemAtPath:v7 error:&v15];
        id v8 = v15;

        id v9 = sub_10000758C();
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
        if (v8)
        {
          if (v11) {
            sub_10000B650();
          }
        }

        else if (v11)
        {
          sub_10000B5F0();
        }
      }

      CFRelease(v5);
    }
  }

  else
  {
    id v12 = sub_10000758C();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000B590();
    }
  }

  return 1LL;
}

uint64_t sub_10000722C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000723C(uint64_t a1)
{
}

void sub_100007244(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"profile_cms_blob"]);
  uint64_t v6 = sqlite3_column_blob(a2, (int)[v12 intValue]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"profile_cms_blob"]);

  int v8 = sqlite3_column_bytes(a2, (int)[v7 intValue]);
  xpc_object_t v9 = xpc_data_create(v6, v8);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t sub_100007304(uint64_t a1, int a2, xpc_object_t xstring)
{
  CFStringRef v3 = *(void **)(a1 + 32);
  CFStringRef v4 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(xstring));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 addObject:v5];

  return 1LL;
}

id sub_100007358(void *a1)
{
  id v1 = a1;
  xpc_object_t empty = xpc_array_create_empty();
  id v3 = objc_claimAutoreleasedReturnValue([v1 UUID]);
  xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v3 UTF8String]);

  id v4 = objc_claimAutoreleasedReturnValue([v1 TeamID]);
  xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v4 UTF8String]);

  id v5 = objc_claimAutoreleasedReturnValue([v1 Name]);
  xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v5 UTF8String]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 Expires]);
  [v6 timeIntervalSinceReferenceDate];
  xpc_array_set_date(empty, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)v7);

  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, [v1 ProvisionsAllDevices] != 0);
  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, [v1 AppleInternal] != 0);
  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, [v1 Local] != 0);
  LODWORD(v6) = [v1 Beta];

  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, (_DWORD)v6 != 0);
  return empty;
}

void sub_1000074B0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000074C0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

const void *sub_1000074EC()
{
  v0 = (const void *)sub_10000A920();
  if (!v0)
  {
    id v5 = sub_10000758C();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000B6B0();
    }

    return 0LL;
  }

  id v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  if (v2 != CFStringGetTypeID())
  {
    id v3 = sub_10000758C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000B6DC();
    }

    CFRelease(v1);
    return 0LL;
  }

  return v1;
}

id sub_10000758C()
{
  if (qword_100014B28 != -1) {
    dispatch_once(&qword_100014B28, &stru_100010A10);
  }
  if (qword_100014B20) {
    return (id)qword_100014B20;
  }
  else {
    return &_os_log_default;
  }
}

void sub_1000075DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mis", "mis");
  CFTypeID v2 = (void *)qword_100014B20;
  qword_100014B20 = (uint64_t)v1;
}

uint64_t sub_100007AC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  return 1LL;
}

void sub_100008198( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_1000081B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000081C0(uint64_t a1)
{
}

uint64_t sub_1000081C8(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text( a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
}

void sub_100008204(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = sub_10000A930(a2, 0);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t sub_1000082EC(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text( a2, 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
}

uint64_t sub_1000083D4(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text( a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
}

void sub_100008548( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100008564(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = sub_10000A980(a2, 0);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100008610(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10000865C()
{
  return sqlite3_errcode(*v0);
}

const char *sub_100008668(sqlite3 **a1)
{
  return sqlite3_errmsg(*a1);
}

uint64_t sub_100008674(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v3 = a3;
  while (1)
  {
    uint64_t v6 = lockdown_send(*a1, a2, v3);
    if (v6 == -1) {
      break;
    }
    a2 += v6;
    v3 -= v6;
    if (!v3) {
      return 0LL;
    }
  }

  return *__error() | 0xC000u;
}

uint64_t sub_1000086E4(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v3 = a3;
  while (1)
  {
    uint64_t v6 = lockdown_recv(*a1, a2, v3);
    if (v6 <= 0) {
      break;
    }
    a2 += v6;
    v3 -= v6;
    if (!v3) {
      return 0LL;
    }
  }

  if (v6 == -1) {
    return *__error() | 0xC000u;
  }
  else {
    return 3892346892LL;
  }
}

uint64_t sub_100008768(const void *a1)
{
  uint64_t v10 = 0LL;
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kLockdownCheckinConnectionInfoKey, a1);
  int v3 = secure_lockdown_checkin(&v10, Mutable, 0LL);
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = (os_log_s *)sub_10000758C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000B934(v4, v5);
    }
  }

  else
  {
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x2000000000LL;
    v9[3] = os_transaction_create("Handle misagent message");
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100008898;
    block[3] = &unk_100010A68;
    block[4] = v9;
    block[5] = v10;
    dispatch_async(global_queue, block);
    _Block_object_dispose(v9, 8);
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  return 1LL;
}

void sub_100008898(uint64_t a1)
{
  CFTypeID v2 = (void *)(a1 + 40);
  while (!sub_10000A484( v2,  sub_1000059C4,  (uint64_t (*)(void))sub_100005C28,  (uint64_t (*)(void **))sub_100005DB8))
    ;
  lockdown_disconnect(*(void *)(a1 + 40));
  os_release(*(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
}

void sub_10000890C(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", off_100014AF8));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100008A54;
  v6[3] = &unk_100010A90;
  id v7 = v3;
  id v5 = v3;
  sub_1000089B4(a1, v4, v6);
}

void sub_1000089B4(void *a1, void *a2, void *a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008A60;
  v7[3] = &unk_100010AB8;
  id v8 = a2;
  id v9 = a3;
  id v5 = v9;
  id v6 = v8;
  [a1 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t sub_100008A54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100008A60(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v9 = a2;
  *a4 = 0;
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  [v7 appendString:v9];
  [*(id *)(a1 + 32) appendString:off_100014AF8];
  sub_100008B14(*(void **)(a1 + 32), v8, *(void **)(a1 + 40));

  objc_msgSend( *(id *)(a1 + 32),  "deleteCharactersInRange:",  (char *)objc_msgSend(*(id *)(a1 + 32), "length") + ~(unint64_t)objc_msgSend(v9, "length"),  (char *)objc_msgSend(v9, "length") + 1);
}

void sub_100008B14(void *a1, void *a2, void *a3)
{
  id v17 = a1;
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100008D1C;
      v18[3] = &unk_100010AE0;
      id v19 = v17;
      id v20 = v6;
      -[__CFString enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v18);

      goto LABEL_16;
    }

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    {
      id v16 = v5;
      uint64_t v10 = @"string";
    }

    else
    {
      CFTypeID v11 = CFGetTypeID(v5);
      if (v11 != CFBooleanGetTypeID())
      {
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v5, v13) & 1) == 0) {
          abort();
        }
        uint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%lld",  @"number",  v17,  -[__CFString longLongValue](v5, "longLongValue"));
        goto LABEL_15;
      }

      if (CFEqual(v5, kCFBooleanTrue)) {
        id v12 = @"true";
      }
      else {
        id v12 = @"false";
      }
      id v16 = v12;
      uint64_t v10 = @"BOOL";
    }

    uint64_t v14 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@%@", v10, v17, v16);
LABEL_15:
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    (*((void (**)(id, void *))v6 + 2))(v6, v15);

    goto LABEL_16;
  }

  sub_1000089B4(v5, v17, v6);
LABEL_16:
}

uint64_t sub_100008D1C(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 0;
  return sub_100008B14(*(void *)(a1 + 32), a2, *(void *)(a1 + 40));
}

void sub_100008F2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t sub_100008F44(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  return sqlite3_bind_text( a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
}

uint64_t sub_100008FA0(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100008FBC(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  return sqlite3_bind_text( a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
}

void sub_1000090C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000090E0(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"profile_cms_blob"]);
  id v6 = sub_10000A9AC(a2, (int)[v5 intValue]);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = MISProfileCreateWithData(kCFAllocatorDefault, v7);
}

void sub_100009284(_Unwind_Exception *a1)
{
}

uint64_t sub_10000929C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  return sqlite3_bind_text( a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
}

void sub_1000092F8(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"profile_uuid"]);
  id v6 = sub_10000A930(a2, (int)[v5 intValue]);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isEqualToString:v7];
}

void sub_1000098A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, char a50)
{
}

uint64_t sub_1000098D0(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  int v5 = sqlite3_bind_parameter_index(a2, "@cms_blob");
  return sqlite3_bind_blob( a2, v5, [*(id *)(a1 + 40) bytes], (int)objc_msgSend(*(id *)(a1 + 40), "length"), 0);
}

uint64_t sub_100009970(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  int v5 = sqlite3_bind_parameter_index(a2, "@team_id");
  sqlite3_bind_text(a2, v5, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
  int v6 = sqlite3_bind_parameter_index(a2, "@name");
  sqlite3_bind_text(a2, v6, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
  int v7 = sqlite3_bind_parameter_index(a2, "@expires");
  [*(id *)(a1 + 56) timeIntervalSince1970];
  sqlite3_bind_int64(a2, v7, (uint64_t)v8);
  int v9 = sqlite3_bind_parameter_index(a2, "@is_for_all_devices");
  sqlite3_bind_int(a2, v9, *(unsigned __int8 *)(a1 + 72));
  int v10 = sqlite3_bind_parameter_index(a2, "@is_apple_internal");
  sqlite3_bind_int(a2, v10, *(unsigned __int8 *)(a1 + 73));
  int v11 = sqlite3_bind_parameter_index(a2, "@is_local");
  sqlite3_bind_int(a2, v11, *(unsigned __int8 *)(a1 + 74));
  int v12 = sqlite3_bind_parameter_index(a2, "@is_beta");
  sqlite3_bind_int(a2, v12, *(unsigned __int8 *)(a1 + 75));
  int v13 = sqlite3_bind_parameter_index(a2, "@cms_blob");
  sqlite3_bind_blob( a2, v13, [*(id *)(a1 + 64) bytes], (int)objc_msgSend(*(id *)(a1 + 64), "length"), 0);
  int v14 = sqlite3_bind_parameter_index(a2, "@is_der");
  return sqlite3_bind_int(a2, v14, *(unsigned __int8 *)(a1 + 76));
}

uint64_t sub_100009B4C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  int v5 = sqlite3_bind_parameter_index(a2, "@leaf_pk");
  return sqlite3_bind_int64(a2, v5, (sqlite3_int64)[*(id *)(a1 + 40) longLongValue]);
}

void sub_100009BD4(void *a1, void *a2)
{
  if (!*(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    id v3 = (void *)a1[4];
    id v4 = a2;
    id v5 = (id)objc_claimAutoreleasedReturnValue([v3 Entitlements]);
    LODWORD(v3) = [v5 insertEntitlement:v4 forProfile:a1[5]];

    *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = (_DWORD)v3;
  }

uint64_t sub_100009D0C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  return sqlite3_bind_text( a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
}

void sub_100009EDC(_Unwind_Exception *a1)
{
}

uint64_t sub_100009EF4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009F04(uint64_t a1)
{
}

uint64_t sub_100009F0C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@cert");
  return sqlite3_bind_blob( a2, v4, [*(id *)(a1 + 32) bytes], (int)objc_msgSend(*(id *)(a1 + 32), "length"), 0);
}

uint64_t sub_100009F74(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@cert");
  return sqlite3_bind_blob( a2, v4, [*(id *)(a1 + 32) bytes], (int)objc_msgSend(*(id *)(a1 + 32), "length"), 0);
}

void sub_100009FDC(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v9 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"pk"]);
  id v5 = sub_10000A980(a2, (int)[v9 intValue]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t sub_10000A484( void *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void), uint64_t (*a4)(void **))
{
  CFDictionaryRef theDict = 0LL;
  uint64_t v8 = sub_10000A76C(a1, &theDict);
  if ((_DWORD)v8) {
    return v8;
  }
  id v9 = theDict;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, @"ProfileType");
  if (!Value || CFStringCompare(Value, @"Provisioning", 0LL)) {
    goto LABEL_4;
  }
  id v19 = (const __CFString *)CFDictionaryGetValue(v9, @"MessageType");
  CFMutableArrayRef Mutable = (__CFString *)v19;
  if (!v19) {
    goto LABEL_5;
  }
  if (CFStringCompare(v19, @"Install", 0LL))
  {
    if (CFStringCompare(Mutable, @"Remove", 0LL))
    {
      CFComparisonResult v20 = CFStringCompare(Mutable, @"CopyAll", 0LL);
      CFMutableArrayRef Mutable = 0LL;
      unsigned int v12 = -402620403;
      if (v20 == kCFCompareEqualTo)
      {
        keys[0] = 0LL;
        unsigned int v12 = a4(keys);
        CFMutableArrayRef Mutable = 0LL;
        if (!v12)
        {
          if (keys[0])
          {
            uint64_t Count = CFArrayGetCount((CFArrayRef)keys[0]);
            CFMutableArrayRef Mutable = (__CFString *)CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
            if (Mutable && Count >= 1)
            {
              for (CFIndex i = 0LL; i != Count; ++i)
              {
                ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)keys[0], i);
                CFArrayAppendValue((CFMutableArrayRef)Mutable, ValueAtIndex);
              }
            }

            CFRelease(keys[0]);
          }
        }
      }

      goto LABEL_6;
    }

    if (!CFDictionaryGetValue(v9, @"ProfileID")) {
      goto LABEL_4;
    }
    unsigned int v12 = a3();
LABEL_34:
    CFMutableArrayRef Mutable = 0LL;
    goto LABEL_6;
  }

  uint64_t v24 = CFDictionaryGetValue(v9, @"Profile");
  if (v24)
  {
    uint64_t v25 = MISProfileCreateWithData(kCFAllocatorDefault, v24);
    CFMutableArrayRef Mutable = (__CFString *)v25;
    if (!v25)
    {
      unsigned int v12 = -402620413;
      goto LABEL_6;
    }

    unsigned int v12 = a2(v25);
    CFRelease(Mutable);
    goto LABEL_34;
  }

LABEL_4:
  CFMutableArrayRef Mutable = 0LL;
LABEL_5:
  unsigned int v12 = -402620403;
LABEL_6:
  unsigned int valuePtr = v12;
  CFNumberRef v13 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  *(_OWORD *)keys = *(_OWORD *)&off_100010BA0;
  id v30 = @"Payload";
  values[0] = @"Response";
  values[1] = v13;
  values[2] = Mutable;
  if (Mutable) {
    CFIndex v14 = 3LL;
  }
  else {
    CFIndex v14 = 2LL;
  }
  CFDictionaryRef v15 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)keys,  (const void **)values,  v14,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (v15)
  {
    CFDictionaryRef v16 = v15;
    unsigned int v17 = sub_10000A868(a1, v15);
    CFRelease(v16);
  }

  else
  {
    unsigned int v17 = -402620406;
  }

  CFRelease(v13);
  if (v12) {
    uint64_t v8 = v12;
  }
  else {
    uint64_t v8 = v17;
  }
  CFRelease(v9);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v8;
}

uint64_t sub_10000A76C(void *a1, void *a2)
{
  uint64_t v4 = sub_1000086E4(a1, (uint64_t)&length, 4LL);
  if (!(_DWORD)v4)
  {
    uint64_t v4 = 3892346890LL;
    size_t v5 = bswap32(length);
    LODWORD(length) = v5;
    uint64_t v6 = (UInt8 *)malloc(v5);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_1000086E4(a1, (uint64_t)v6, v5);
      if (!(_DWORD)v8)
      {
        id v9 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v7, length, kCFAllocatorNull);
        uint64_t v8 = 3892346890LL;
        if (v9)
        {
          int v10 = v9;
          CFPropertyListRef v11 = CFPropertyListCreateWithData(kCFAllocatorDefault, v9, 0LL, 0LL, 0LL);
          *a2 = v11;
          if (v11) {
            uint64_t v8 = 0LL;
          }
          else {
            uint64_t v8 = 3892346890LL;
          }
          CFRelease(v10);
        }
      }

      free(v7);
      return v8;
    }
  }

  return v4;
}

uint64_t sub_10000A868(void *a1, const void *a2)
{
  Data = CFPropertyListCreateData(kCFAllocatorDefault, a2, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
  if (!Data) {
    return 3892346890LL;
  }
  uint64_t v4 = Data;
  BytePtr = CFDataGetBytePtr(Data);
  unsigned int Length = CFDataGetLength(v4);
  unsigned int v9 = bswap32(Length);
  uint64_t v7 = sub_100008674(a1, (uint64_t)&v9, 4LL);
  if (!(_DWORD)v7) {
    uint64_t v7 = sub_100008674(a1, (uint64_t)BytePtr, Length);
  }
  CFRelease(v4);
  return v7;
}

uint64_t sub_10000A920()
{
  return MGCopyAnswer(@"UniqueDeviceID", 0LL);
}

unsigned __int8 *sub_10000A930(sqlite3_stmt *a1, int a2)
{
  CFTypeID v2 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
  if (v2) {
    CFTypeID v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v2));
  }
  return v2;
}

id sub_10000A95C(sqlite3_stmt *a1, int a2)
{
  double v2 = (double)sqlite3_column_int64(a1, a2);
  return +[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", v2);
}

id sub_10000A980(sqlite3_stmt *a1, int a2)
{
  sqlite3_int64 v2 = sqlite3_column_int64(a1, a2);
  return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v2);
}

NSData *sub_10000A9AC(sqlite3_stmt *a1, int a2)
{
  uint64_t v4 = sqlite3_column_blob(a1, a2);
  return +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v4,  sqlite3_column_bytes(a1, a2));
}

sqlite3 *sub_10000A9FC(void *a1, int a2)
{
  ppDb = 0LL;
  if (a2) {
    int v2 = 65537;
  }
  else {
    int v2 = 65542;
  }
  id v3 = objc_claimAutoreleasedReturnValue([a1 path]);
  int v4 = sqlite3_open_v2((const char *)[v3 UTF8String], &ppDb, v2, 0);

  if (v4)
  {
    id v5 = sub_10000758C();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000B9A8(v4, v6);
    }
  }

  return ppDb;
}

BOOL sub_10000AA90(sqlite3 *a1, const char *a2)
{
  return sqlite3_db_readonly(a1, a2) == 1;
}

uint64_t sub_10000AAAC(const char *a1)
{
  return sub_10000AAB4(a1, 384);
}

uint64_t sub_10000AAB4(const char *a1, int a2)
{
  if (!a1) {
    sub_10000BA1C();
  }
  int v3 = open(a1, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (v3 == -1)
  {
    id v6 = sub_10000758C();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000BA44();
    }

    return 0LL;
  }

  else
  {
    int v4 = v3;
    if (fstat(v3, &v12) < 0)
    {
      id v8 = sub_10000758C();
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000BAB4();
      }
    }

    else
    {
      if ((v12.st_mode & 0x1FF) == a2 || (fchmod(v4, a2) & 0x80000000) == 0)
      {
        uint64_t v5 = 1LL;
        if (v4 < 0) {
          return v5;
        }
        goto LABEL_16;
      }

      id v10 = sub_10000758C();
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000BB24();
      }
    }

    uint64_t v5 = 0LL;
    if ((v4 & 0x80000000) == 0) {
LABEL_16:
    }
      close(v4);
  }

  return v5;
}

void sub_10000ABEC( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *sub_10000AC18()
{
  return __error();
}

void sub_10000AC20(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Critical SQLite error, could not checkpoint",  v1,  2u);
}

void sub_10000AC60(uint64_t a1)
{
}

void sub_10000ACC8(uint64_t a1)
{
}

void sub_10000AD30(uint64_t a1)
{
}

void sub_10000AD98(uint64_t a1)
{
}

void sub_10000AE00(uint64_t a1)
{
}

void sub_10000AE68(uint64_t a1)
{
}

void sub_10000AED0(uint64_t a1)
{
}

void sub_10000AF38(uint64_t a1)
{
}

void sub_10000AFA0(uint64_t a1)
{
}

void sub_10000B008(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "listener connection error: %s\n",  (uint8_t *)&v2,  0xCu);
}

void sub_10000B07C()
{
}

void sub_10000B0A8()
{
}

void sub_10000B108( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B178( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B1E8()
{
}

void sub_10000B214()
{
}

void sub_10000B240()
{
}

void sub_10000B26C(int a1, os_log_s *a2)
{
  v2[0] = 67109378;
  v2[1] = a1;
  __int16 v3 = 2080;
  uint64_t v4 = "com.apple.private.mis.beta-install";
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Caller (pid %d) does not have required entitlement '%s'",  (uint8_t *)v2,  0x12u);
  sub_1000074D0();
}

void sub_10000B2F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B360()
{
}

void sub_10000B38C()
{
}

void sub_10000B3B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B428()
{
}

void sub_10000B454()
{
}

void sub_10000B4B4(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "MessageType";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "unrecognized value for '%s' key: %s",  (uint8_t *)&v2,  0x16u);
  sub_1000074D0();
}

void sub_10000B538()
{
}

void sub_10000B564()
{
}

void sub_10000B590()
{
}

void sub_10000B5F0()
{
}

void sub_10000B650()
{
}

void sub_10000B6B0()
{
}

void sub_10000B6DC()
{
}

void sub_10000B708( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B73C()
{
}

void sub_10000B7A4(sqlite3 **a1, os_log_s *a2)
{
}

void sub_10000B820( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B854()
{
}

void sub_10000B8BC(uint64_t a1, int a2, os_log_s *a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  sub_100008610((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unable to table row count for %@: %d", (uint8_t *)&v3);
  sub_1000074D0();
}

void sub_10000B934(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "secure_lockdown_checkin failed: %d\n",  (uint8_t *)v2,  8u);
}

void sub_10000B9A8(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error opening DB: %d", (uint8_t *)v2, 8u);
}

void sub_10000BA1C()
{
  __assert_rtn("setDatabasePermissionsInternal", "db_utils.m", 121, "path != NULL");
}

void sub_10000BA44()
{
}

void sub_10000BAB4()
{
}

void sub_10000BB24()
{
}

id objc_msgSend_initWithUUID_withTeamID_withName_withExpiry_isUniversal_isAppleInternal_isLocal_isBeta_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUID:withTeamID:withName:withExpiry:isUniversal:isAppleInternal:isLocal:isBeta:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}