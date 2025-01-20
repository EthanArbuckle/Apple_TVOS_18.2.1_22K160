LABEL_25:
  return v8;
}

LABEL_26:
    v30 = sqlite3_finalize(pStmt);
    if ((_DWORD)v30)
    {
      v31 = CloudServicesLog(v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_100043A08();
      }

      v33 = sqlite3_close(v5);
      if ((_DWORD)v33)
      {
        v34 = v33;
        v35 = CloudServicesLog(v33);
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_100043E94(self, v34, v36);
        }
      }

      -[SecureBackupSQLite setDb:](self, "setDb:", 0LL);
    }

    goto LABEL_34;
  }

  v7 = CloudServicesLog(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100043F9C();
  }
LABEL_7:

  sqlite3_free(errmsg);
LABEL_8:
}

void sub_100004F3C(_Unwind_Exception *a1)
{
}

void sub_100004F48(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x100004F54LL);
}

void sub_100005288( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_1000052A8()
{
  if (qword_100078F68 != -1) {
    dispatch_once(&qword_100078F68, &stru_100068E20);
  }
  return byte_100078F60;
}

void sub_1000052E8(id a1)
{
  byte_100078F60 = SecIsInternalRelease(a1);
}

id sub_100005304()
{
  if (qword_100078F78 != -1) {
    dispatch_once(&qword_100078F78, &stru_100068E40);
  }
  return (id)qword_100078F70;
}

void sub_100005344(id a1)
{
  *(_OWORD *)in = 0u;
  memset(v12, 0, sizeof(v12));
  size_t v10 = 37LL;
  int v1 = sysctlbyname("kern.bootsessionuuid", in, &v10, 0LL, 0LL);
  if (v1)
  {
    int v2 = v1;
    uint64_t v3 = CloudServicesLog();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10004346C(v2, v4);
    }
LABEL_7:

    goto LABEL_8;
  }

  int v5 = uuid_parse(in, uu);
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = CloudServicesLog();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000433C4((uint64_t)in, v6, v4);
    }
    goto LABEL_7;
  }

LABEL_8:
  v8 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", uu);
  v9 = (void *)qword_100078F70;
  qword_100078F70 = (uint64_t)v8;
}

    v15 = 0LL;
    return v15;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v21, v17));
  if (v21) {
    free(v21);
  }
  return v15;
}

id sub_10000545C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
  int v1 = (void *)objc_claimAutoreleasedReturnValue([v0 stringForKey:@"BackupUUID"]);

  return v1;
}

void sub_1000054A4(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
  [v2 setString:v1 forKey:@"BackupUUID"];
}

void sub_100005584(id a1)
{
  uint64_t v1 = container_query_create(a1);
  container_query_set_class(v1, 10LL);
  xpc_object_t v2 = xpc_string_create("com.apple.sbd");
  container_query_set_identifiers(v1, v2);

  container_query_operation_set_flags(v1, 0x900000001LL);
  container_query_set_persona_unique_string(v1, CONTAINER_PERSONA_PRIMARY);
  uint64_t single_result = container_query_get_single_result(v1);
  if (single_result)
  {
    uint64_t v4 = single_result;
    int v5 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  container_get_path(),  1LL,  0LL);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = (void *)qword_100078F80;
    qword_100078F80 = v6;

    uint64_t v8 = container_copy_sandbox_token(v4);
    if (v8)
    {
      v9 = (void *)v8;
      uint64_t v10 = sandbox_extension_consume();
      free(v9);
      if (v10 < 0)
      {
        uint64_t v11 = CloudServicesLog();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100043568(v12);
        }
      }
    }
  }

  else
  {
    uint64_t last_error = container_query_get_last_error(v1);
    v14 = (void *)container_error_copy_unlocalized_description(last_error);
    uint64_t v15 = CloudServicesLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000434F4((uint64_t)v14, v16);
    }

    free(v14);
  }

  container_query_free(v1);
}

void sub_100005BCC( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100005BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_opt_class(a1, a2, a3, a4);
}

  ;
}

BOOL sub_100005C0C(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 6;
}

LABEL_23:
    uint64_t v10 = 0;
LABEL_24:

    goto LABEL_25;
  }

  uint64_t v10 = 0;
LABEL_25:

  return v10 & 1;
}
}

    v27 = 0LL;
  }

  uint64_t v7 = v27;
LABEL_32:

  if (!v7)
  {
    uint64_t v8 = 0LL;
    goto LABEL_35;
  }

  uint64_t v8 = [objc_alloc((Class)a1) initWithACAccount:v7];
LABEL_34:

LABEL_35:
  return v8;
}

void sub_100006A38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100006A50(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8LL);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }

  return result;
}

void sub_100006B38(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[6] addObject:*(void *)(a1 + 32)];
}

void sub_100006C38(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[6] removeObject:*(void *)(a1 + 32)];
}

uint64_t sub_100006DB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006DC4(uint64_t a1)
{
}

void sub_100006DCC(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[4];
    if (!v4)
    {
      if (*((_BYTE *)v3 + 24))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v3[5] readStoredLog]);
        id v4 = v18;
        if ((!v18 || [v18 allActivitiesComplete]) && !*(void *)(a1 + 32))
        {
          uint64_t v19 = CloudServicesLog();
          int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = objc_opt_class(*(void *)(a1 + 40), v20);
            *(_DWORD *)buf = 138412290;
            uint64_t v32 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: No previous logs to process and no event to handle",  buf,  0xCu);
          }

          goto LABEL_11;
        }
      }

      else
      {
        id v4 = 0LL;
      }
    }

    uint64_t v22 = a1;
    int v5 = -[SBEscrowOperationLoggerUpdate initWithLog:event:context:]( objc_alloc(&OBJC_CLASS___SBEscrowOperationLoggerUpdate),  "initWithLog:event:context:",  v4,  *(void *)(a1 + 32),  *(void *)(a1 + 48));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[os_log_s updatedLog](v5, "updatedLog"));
    id v7 = v3[4];
    v3[4] = (id)v6;

    id v8 = v3[5];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s updatedLog](v5, "updatedLog"));
    [v8 storeLog:v9];

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v10 = v3[6];
    id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
          v16 = (dispatch_queue_s *)v3[2];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100007074;
          block[3] = &unk_100068ED8;
          block[4] = v15;
          block[5] = v3;
          v25 = v5;
          dispatch_async(v16, block);
        }

        id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v12);
    }

    v17 = (dispatch_queue_s *)v3[2];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100007084;
    v23[3] = &unk_100068F00;
    v23[4] = *(void *)(v22 + 56);
    dispatch_async(v17, v23);
LABEL_11:
  }
}

id sub_100007074(uint64_t a1)
{
  return [*(id *)(a1 + 32) operationLogger:*(void *)(a1 + 40) didUpdateWithResult:*(void *)(a1 + 48)];
}

void sub_100007084(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  xpc_object_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0LL;
}

void sub_1000071FC(uint64_t a1)
{
}

uint64_t sub_100007490(uint64_t result, unsigned __int8 *a2, unint64_t a3, uint64_t a4)
{
  if (a3 < a3 + a4)
  {
    uint64_t v4 = 2 * a3;
    do
    {
      unsigned int v5 = *a2++;
      *(_BYTE *)(*(void *)(result + 32) + v4) = a0123456789abcd[(unint64_t)v5 >> 4];
      *(_BYTE *)(*(void *)(result + 32) + v4 + 1) = a0123456789abcd[v5 & 0xF];
      v4 += 2LL;
      --a4;
    }

    while (a4);
  }

  return result;
}

void sub_1000076F0(uint64_t a1, uint64_t a2)
{
  uint64_t PeerID = SOSPeerInfoGetPeerID(a2, a2);
  id v12 = (id)objc_claimAutoreleasedReturnValue(PeerID);
  if (v12)
  {
    uint64_t v6 = (void *)SOSPeerInfoCopyBackupKey(a2, v5);
    id v7 = *(void **)(a1 + 32);
    id v8 = objc_alloc(&OBJC_CLASS___NSString);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 sha1Digest]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hexString]);
    id v11 = -[NSString initWithFormat:](v8, "initWithFormat:", @"%@ (%@)", v12, v10);
    [v7 addObject:v11];
  }
}

void sub_100007888(uint64_t a1, uint64_t a2)
{
  uint64_t PeerID = SOSPeerInfoGetPeerID(a2, a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(PeerID);
  if (v5)
  {
    id v10 = v5;
    id v7 = (void *)SOSPeerInfoCopyBackupKey(a2, v6);
    id v8 = v7;
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 sha1Digest]);
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
    }

    uint64_t v5 = v10;
  }
}

void sub_100007988(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)SOSPeerInfoCopyBackupKey(a2, a2);
  if (v3)
  {
    id v5 = v3;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sha1Digest]);
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }

    uint64_t v3 = v5;
  }
}

void sub_100007B20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100007B48(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100007B58(uint64_t a1)
{
}

void sub_100007B60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)SOSPeerInfoCopyBackupKey(a2, a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sha1Digest]);
  unsigned int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6)
  {
    uint64_t PeerID = SOSPeerInfoGetPeerID(a2, v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(PeerID);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v13 = CloudServicesLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        int v17 = 138412290;
        uint64_t v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "found peer %@", (uint8_t *)&v17, 0xCu);
      }
    }

    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      sub_100043850();
    }
  }
}

LABEL_6:
    sub_100043B00();
    goto LABEL_17;
  }

  __int128 v28 = sqlite3_step(ppStmt);
  if ((_DWORD)v28 != 101)
  {
    v30 = CloudServicesLog(v28);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100043A84();
    }
    goto LABEL_17;
  }

  __int128 v29 = 1;
LABEL_19:
  v31 = sqlite3_finalize(ppStmt);
  if (!(_DWORD)v31) {
    goto LABEL_24;
  }
  uint64_t v32 = CloudServicesLog(v31);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100043A08();
  }
LABEL_22:

  __int128 v29 = 0;
  if (a6) {
    *a6 = (id)objc_claimAutoreleasedReturnValue(-[SecureBackupSQLite sqliteErrorForDB:](self, "sqliteErrorForDB:", v13));
  }
LABEL_24:

  return v29;
}

    unsigned int v6 = 0;
  }

LABEL_17:
  return v10;
}

    return v5;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest phoneNumber](self, "phoneNumber"));
  uint64_t v15 = [v14 length];

  if (v6)
  {

    if (!v15)
    {
LABEL_11:
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  0LL,  @"Missing required parameters"));
      id v8 = CloudServicesLog(v5);
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recoveryPassphrase](self, "recoveryPassphrase"));
        if ([v9 length]) {
          uint64_t v10 = @"Yes";
        }
        else {
          uint64_t v10 = @"No";
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest escrowRecord](self, "escrowRecord"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest phoneNumber](self, "phoneNumber"));
        *(_DWORD *)buf = 138412802;
        uint64_t v18 = v10;
        uint64_t v19 = 2112;
        uint64_t v20 = v11;
        uint64_t v21 = 2112;
        uint64_t v22 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "Missing required parameters passphrase: %@\ndata: %@\nsms target: %@",  buf,  0x20u);
      }

      goto LABEL_17;
    }
  }

  else
  {

    if (!v15) {
      goto LABEL_11;
    }
  }

  return 0LL;
}

    __int128 v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  0LL));
    goto LABEL_18;
  }

void sub_1000098F8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hexString]);
  v12[0] = @"class";
  v12[1] = @"hash";
  v13[0] = v8;
  v13[1] = v9;
  v12[2] = @"data";
  v13[2] = v7;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL));
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v10];
}

void sub_100009AFC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v8]);
  if (!v7)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }

  -[NSMutableArray addObject:](v7, "addObject:", v6);
}

LABEL_33:
    v36 = v33 != 0;
    uint64_t v16 = v52;
    goto LABEL_34;
  }

  v34 = 1;
  v35 = 1;
LABEL_35:

LABEL_36:
  objc_autoreleasePoolPop(v5);
  if (v35) {
    v45 = 0;
  }
  else {
    v45 = v34;
  }

  return v45;
}

LABEL_32:
  return v19;
}

      objc_autoreleasePoolPop(v17);
      uint64_t v15 = (char *)v15 + 1;
    }

    while (v88 != v15);
    v66 = [v13 countByEnumeratingWithState:&v89 objects:v97 count:16];
    v88 = v66;
  }

  while (v66);

  v68 = v81;
  if (v81)
  {
    v69 = CloudServicesLog(v67);
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    uint64_t v10 = v77;
    v71 = v82;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_100045F88();
    }

    v73 = CloudServicesLog(v72);
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      sub_100045F08(v83, v74);
    }
    v75 = v86;
LABEL_82:

    v76 = v75;
  }

  else
  {
    uint64_t v10 = v77;
    v71 = v82;
    v76 = v86;
  }

  v10[2](v10, v68, v71, v76);
}

void sub_10000AA20(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

const char *sub_10000AA2C()
{
  return sqlite3_errmsg(v0);
}

void sub_10000AA38( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000AA48(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_10000AAA0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000AAAC( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

id sub_10000B254(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 containsObject:*(void *)(a1 + 32)];
}

LABEL_26:
        id v11 = v47;
        id v9 = v48;
        uint64_t v16 = v45;
        uint64_t v15 = v46;
        goto LABEL_44;
      }

      if (v27 == (id)-1LL)
      {
        v34 = CloudServicesLog(-1LL);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v26;
          v33 = "candidate can recover %@";
          goto LABEL_25;
        }

        goto LABEL_26;
      }
    }

    v23 = [&off_10006DAB0 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v23) {
      continue;
    }
    break;
  }

LABEL_15:
  __int128 v28 = [v12 countOfObjectsWithPrefix:@"PCS"];
  __int128 v29 = [v13 countOfObjectsWithPrefix:@"PCS"];
  if (v28 > v29)
  {
    v30 = CloudServicesLog(v29);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    id v11 = v47;
    id v9 = v48;
    uint64_t v16 = v45;
    uint64_t v15 = v46;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "candidate can recover fewer PCS views",  buf,  2u);
    }

    int v17 = 1LL;
    goto LABEL_44;
  }

  if (v28 < v29)
  {
    v35 = CloudServicesLog(v29);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    id v11 = v47;
    id v9 = v48;
    uint64_t v16 = v45;
    uint64_t v15 = v46;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = "candidate can recover more PCS views";
      goto LABEL_42;
    }

    -[SecureBackupDaemon recordNotification:handled:](self, "recordNotification:handled:", v4, 0LL);
    goto LABEL_16;
  }

  *(void *)v23 = 0LL;
  v24 = v23;
  v25 = 0x3032000000LL;
  __int128 v26 = sub_100011D74;
  __int128 v27 = sub_100011D84;
  __int128 v28 = (id)0xAAAAAAAAAAAAAAAALL;
  __int128 v28 = (id)os_transaction_create("CloudServices.handleNotification");
  v14 = CloudServicesLog(-[SecureBackupDaemon setPendingNotification:](self, "setPendingNotification:", 1LL));
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "calling dispatch_after() to enqueue notification",  buf,  2u);
  }

  uint64_t v16 = dispatch_time(0LL, 5000000000LL);
  int v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000173D0;
  block[3] = &unk_1000692B0;
  block[4] = self;
  uint64_t v20 = v4;
  uint64_t v21 = v23;
  dispatch_after(v16, v17, block);

  _Block_object_dispose(v23, 8);
LABEL_16:
}

    LOBYTE(v12) = 0;
    goto LABEL_16;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"keybag"]);

  if (!v9)
  {
    uint64_t v19 = CloudServicesLog(v10);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000454E8();
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  211LL,  0LL,  @"no keybag found in for recovery key"));
    id v9 = v21;
    if (a4) {
      *a4 = v21;
    }
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v22 logUnrecoverableError:v9 forEvent:CloudServicesAnalyticsiCDPKeybagRecoveryKey withAttributes:0];

    goto LABEL_15;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  [v11 logSuccessForEvent:CloudServicesAnalyticsiCDPKeybagRecoveryKey];

  uint64_t v12 = -[SecureBackupDaemon backupSliceKeybagHasRecoveryKey:](self, "backupSliceKeybagHasRecoveryKey:", v9);
  uint64_t v13 = CloudServicesLog(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 peerIDs]);
    v24 = 138412546;
    v25 = v15;
    __int128 v26 = 1024;
    __int128 v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "iCloudIdentity backup keybag peers: %@ -- returning %{BOOL}d",  (uint8_t *)&v24,  0x12u);
  }

LABEL_16:
  return v12;
}

LABEL_43:
    int v17 = -1LL;
    goto LABEL_44;
  }

  v36 = [v12 count];
  v37 = [v13 count];
  id v11 = v47;
  id v9 = v48;
  uint64_t v15 = v46;
  if (v36 <= v37)
  {
    v39 = [v12 count];
    v40 = [v13 count];
    if (v39 >= v40)
    {
      uint64_t v16 = v45;
      int v17 = (int64_t)[v46 compare:v45];
      v42 = CloudServicesLog(v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      v43 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v17 != -1)
      {
        if (!v43) {
          goto LABEL_44;
        }
        *(_WORD *)buf = 0;
        uint64_t v21 = "candidate can recover same number of views but is not newer";
        goto LABEL_5;
      }

      if (!v43) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v31 = "candidate can recover same number of views but is newer";
    }

    else
    {
      v41 = CloudServicesLog(v40);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      uint64_t v16 = v45;
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v31 = "candidate can recover more total views";
    }

LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    goto LABEL_43;
  }

  v38 = CloudServicesLog(v37);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "candidate can recover fewer total views",  buf,  2u);
  }

  int v17 = 1LL;
  uint64_t v16 = v45;
LABEL_44:

  return v17;
}

    uint64_t v20 = -1LL;
LABEL_29:
    __int128 v26 = v53;
    goto LABEL_30;
  }

  v24 = v18;
  uint64_t v20 = (int64_t)[v18 compare:v55];
  v49 = CloudServicesLog(v20);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  v50 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v20 == -1)
  {
    __int128 v26 = v53;
    if (v50)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "candidate can recover same number of views but is newer",  buf,  2u);
    }

    uint64_t v20 = -1LL;
  }

  else
  {
    __int128 v26 = v53;
    if (v50)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "candidate can recover same number of views but is not newer",  buf,  2u);
    }
  }

BOOL sub_10000C26C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0LL;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0LL;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0LL;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      switch((v6 >> 3))
      {
        case 1u:
          uint64_t String = PBReaderReadString(a2);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
          uint64_t v14 = 40LL;
          goto LABEL_23;
        case 2u:
          uint64_t v15 = PBReaderReadString(a2);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(v15);
          uint64_t v14 = 24LL;
          goto LABEL_23;
        case 3u:
          uint64_t v16 = PBReaderReadString(a2);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(v16);
          uint64_t v14 = 8LL;
          goto LABEL_23;
        case 4u:
          uint64_t Data = PBReaderReadData(a2);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(Data);
          uint64_t v14 = 32LL;
          goto LABEL_23;
        case 5u:
          uint64_t v18 = PBReaderReadData(a2);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(v18);
          uint64_t v14 = 16LL;
LABEL_23:
          uint64_t v19 = *(void **)(a1 + v14);
          *(void *)(a1 + v14) = v13;

          goto LABEL_24;
        default:
          if ((PBReaderSkipValueWithTag(a2) & 1) == 0) {
            return 0LL;
          }
LABEL_24:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          break;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}
}

void sub_10000D204(_Unwind_Exception *a1)
{
}

void sub_10000D28C(_Unwind_Exception *a1)
{
}

void sub_10000D314(_Unwind_Exception *a1)
{
}

void sub_10000D384(_Unwind_Exception *a1)
{
}

void sub_10000D40C(_Unwind_Exception *a1)
{
}

LABEL_18:
  return v5;
}

void sub_10000E408(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    id v5 = -[EscrowAccountInfoResponse initFromResponseFilterPCS:]( objc_alloc(&OBJC_CLASS___EscrowAccountInfoResponse),  "initFromResponseFilterPCS:",  v6);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

id sub_10000F354(void *a1)
{
  uint64_t v1 = a1;
  BytePtr = CFDataGetBytePtr(v1);
  CC_LONG v3 = -[__CFData length](v1, "length", *(void *)v7, *(void *)&v7[8], *(void *)&v7[16]);

  CC_SHA1(BytePtr, v3, v7);
  char v4 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  v7,  20LL,  0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v4, "base64EncodedStringWithOptions:", 0LL));

  return v5;
}

void sub_100010234( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100010244( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_100010278()
{
  return _os_assert_log(1LL);
}

  ;
}

id _CloudServicesSignpostLogSystem()
{
  if (qword_100078F98 != -1) {
    dispatch_once(&qword_100078F98, &stru_100069058);
  }
  return (id)qword_100078F90;
}

void sub_1000102CC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.sbd", "signpost");
  xpc_object_t v2 = (void *)qword_100078F90;
  qword_100078F90 = (uint64_t)v1;
}

os_signpost_id_t _CloudServicesSignpostCreate(os_log_s *a1)
{
  os_signpost_id_t v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

double _CloudServicesSignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  if (qword_100078FA8 != -1) {
    dispatch_once(&qword_100078FA8, &stru_100069078);
  }
  uint64_t v3 = mach_continuous_time();
  LODWORD(v4) = dword_100078FA0;
  LODWORD(v5) = *(_DWORD *)algn_100078FA4;
  return (double)v4 / (double)v5 * (double)(v3 - a2);
}

void sub_100010394(id a1)
{
}

BOOL sub_1000103A0()
{
  v0 = objc_autoreleasePoolPush();
  uint64_t v1 = sub_10003E420();
  if ((_DWORD)v1)
  {
    id v2 = sub_1000103F0(v1);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    BOOL v4 = v3 != 0LL;
  }

  else
  {
    BOOL v4 = 0LL;
  }

  objc_autoreleasePoolPop(v0);
  return v4;
}

id sub_1000103F0(uint64_t a1)
{
  if (&kAAProtocoliCloudAccountKey)
  {
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "aa_primaryAppleAccount"));
  }

  else
  {
    uint64_t v3 = CloudServicesLog(a1);
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "AppleAccount.framework is not available; client must specify all parameters",
        v6,
        2u);
    }

    uint64_t v1 = 0LL;
    id v2 = 0LL;
  }

  return v2;
}

id sub_100010494()
{
  v0 = objc_autoreleasePoolPush();
  uint64_t v1 = CloudServicesLog(v0);
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "getting dsid", (uint8_t *)&v19, 2u);
  }

  id v4 = sub_1000103F0(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = objc_msgSend(v5, "aa_isPrimaryEmailVerified");
  if ((_DWORD)v6)
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
    uint64_t v8 = CloudServicesLog(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      uint64_t v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "got dsid: %@", (uint8_t *)&v19, 0xCu);
    }
  }

  else
  {
    uint64_t v10 = CloudServicesLog(v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100044BF8(v9, v11, v12, v13, v14, v15, v16, v17);
    }
    unint64_t v7 = 0LL;
  }

  objc_autoreleasePoolPop(v0);
  return v7;
}

id sub_1000105E4()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = sub_1000103F0((uint64_t)v0);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_altDSID"));

  objc_autoreleasePoolPop(v0);
  return v3;
}

id sub_100010634()
{
  v0 = objc_autoreleasePoolPush();
  uint64_t v1 = CloudServicesLog(v0);
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "getting iCloud env", buf, 2u);
  }

  id v4 = sub_1000103F0(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = objc_msgSend(v5, "aa_isPrimaryEmailVerified");
  if ((_DWORD)v6)
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dataclassProperties]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kAAProtocoliCloudAccountKey]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"iCloudEnv"]);

    uint64_t v11 = CloudServicesLog(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "got iCloud env", v22, 2u);
    }
  }

  else
  {
    uint64_t v13 = CloudServicesLog(v6);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100044BF8(v12, v14, v15, v16, v17, v18, v19, v20);
    }
    id v9 = 0LL;
  }

  objc_autoreleasePoolPop(v0);
  return v9;
}

void sub_100011510(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"class"]);
  id v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v5]);
  if (!v6)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"data"]);
  if (v7)
  {
    -[NSMutableArray addObject:](v6, "addObject:", v7);
  }

  else
  {
    uint64_t v8 = CloudServicesLog(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100044C2C();
    }
  }
}

void sub_100011D3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100011D74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100011D84(uint64_t a1)
{
}

void sub_100011D8C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) kvs]);
  uint64_t v3 = *(void **)(a1 + 32);
  id v17 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100011EF0;
  v15[3] = &unk_1000690F8;
  v15[4] = v3;
  __int128 v14 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v14;
  __int128 v16 = v14;
  unsigned __int8 v5 = [v3 backupWithRegisteredBackupsWithError:&v17 handler:v15];
  id v6 = v17;
  [v2 removeObjectForKey:@"com.apple.icdp.backup"];
  id v7 = [*(id *)(a1 + 32) doSynchronize];
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = CloudServicesLog(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100044D58();
    }

    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v6, NSUnderlyingErrorKey);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v10));
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

void sub_100011EF0(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _pushCachedKeychainToKVSForView:v7 recordID:*(void *)(a1 + 40)]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  objc_autoreleasePoolPop(v3);
}

void sub_1000122C8(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allViews]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v10 = objc_autoreleasePoolPush();
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kvs", (void)v18));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 _getICDPBackupFromKVS:v12 forView:v9]);

        if (v13) {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        }
        else {
          -[NSMutableArray addObject:](v2, "addObject:", v9);
        }

        objc_autoreleasePoolPop(v10);
      }

      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v6);
  }

  id v14 = -[NSMutableArray count](v2, "count");
  if (v14)
  {
    uint64_t v15 = CloudServicesLog(v14);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v2, "componentsJoinedByString:", @" "));
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "views with no backup: %@", buf, 0xCu);
    }
  }
}

LABEL_22:
    }
  }

  else
  {
    v23 = CloudServicesLog(0LL);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "looking for non-tagged EMCS backup", buf, 2u);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryForKey:@"EMCSBackupDict"]);
    if (!v10)
    {
      v25 = CloudServicesLog(0LL);
      __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "looking for old-style EMCS backup",  buf,  2u);
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 dataForKey:@"EMCSBackup"]);
      __int128 v27 = objc_claimAutoreleasedReturnValue([v5 dataForKey:@"BackupKeybag"]);
      uint64_t v13 = (void *)v27;
      uint64_t v10 = 0LL;
      if (v11 && v27)
      {
        v30[0] = @"backup";
        v30[1] = @"keybag";
        v31[0] = v11;
        v31[1] = v27;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));
      }

      goto LABEL_22;
    }
  }

  return v10;
}

  return v30;
}

void sub_100013A70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100013A94(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) copyMyPeerID];
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _consumeFullBackupForRecordID:v2]);
    if (v4) {
      goto LABEL_6;
    }
    uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _pushCachedKeychainToKVS]);
  }

  else
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 _consumeBackupJournal]);
  }

  id v4 = (void *)v5;
LABEL_6:
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0LL;

  uint64_t v10 = CloudServicesLog(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "backup complete", v12, 2u);
  }
}

void sub_100013CD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100013CF0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) copyMyPeerID];
  uint64_t v3 = *(void **)(a1 + 32);
  id v43 = 0LL;
  unsigned int v4 = [v3 backupWithRegisteredBackupViewWithError:@"iCloudIdentity-tomb" error:&v43];
  id v5 = v43;
  uint64_t v6 = CloudServicesLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (v4) {
    BOOL v9 = v5 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = @"iCloudIdentity-tomb";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_backupCloudIdentityKeychainViewAndPushToKVS: registered view: %@",  buf,  0xCu);
    }

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _consumeViewBackup:@"iCloudIdentity-tomb" recordID:v2]);
    uint64_t v19 = CloudServicesLog(v18);
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    __int128 v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100044E70(v21, v22, v23, v24, v25, v26, v27, v28);
      }

      uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = 0LL;
    }

    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "_backupCloudIdentityKeychainViewAndPushToKVS: Pushing iCloudIdentity view to KVS!",  buf,  2u);
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _pushCachedKeychainToKVSForView:@"iCloudIdentity-tomb" recordID:v2]);
      uint64_t v31 = CloudServicesLog(v30);
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      v33 = v32;
      if (v30)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_100044E10();
        }

        uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 8LL);
        v35 = *(os_log_s **)(v34 + 40);
        *(void *)(v34 + 40) = 0LL;
      }

      else
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "_backupCloudIdentityKeychainViewAndPushToKVS: successfully pushed iCloudIdentity to KVS",  buf,  2u);
        }

        uint64_t v37 = CloudServicesLog(v36);
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = @"YES";
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "_backupCloudIdentityKeychainViewAndPushToKVS: backup succeeded? %@",  buf,  0xCu);
        }

        uint64_t v39 = *(void *)(*(void *)(a1 + 40) + 8LL);
        v40 = *(void **)(v39 + 40);
        *(void *)(v39 + 40) = 0LL;

        uint64_t v42 = CloudServicesLog(v41);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = @"iCloudIdentity-tomb";
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "_backupCloudIdentityKeychainViewAndPushToKVS: backup for %@ complete",  buf,  0xCu);
        }
      }
    }
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100044EE0(v8, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
    __int128 v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0LL;
  }
}

void sub_100014980( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_100014A10(void *a1, unsigned int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = CloudServicesLog(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 3) {
      uint64_t v11 = "unknown";
    }
    else {
      uint64_t v11 = off_100069868[a2];
    }
    *(_DWORD *)buf = 136315138;
    v47 = (void *)v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "_consumeViewBackup: got backup manifest event: %s",  buf,  0xCu);
  }

  uint64_t v12 = objc_autoreleasePoolPush();
  uint64_t v13 = v12;
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
  switch(a2)
  {
    case 0u:
      ++*(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL);
      uint64_t v14 = *(void **)(*(void *)(a1[8] + 8LL) + 40LL);
      if (!v14)
      {
        uint64_t v15 = -[SecureBackupViewStore initWithViewName:recordID:]( objc_alloc(&OBJC_CLASS___SecureBackupViewStore),  "initWithViewName:recordID:",  a1[4],  a1[5]);
        uint64_t v16 = *(void *)(a1[8] + 8LL);
        uint64_t v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        uint64_t v14 = *(void **)(*(void *)(a1[8] + 8LL) + 40LL);
      }

      uint64_t v18 = *(void *)(a1[9] + 8LL);
      __int128 v20 = *(void **)(v18 + 40);
      uint64_t v19 = (id *)(v18 + 40);
      v45 = v20;
      unsigned __int8 v21 = [v14 resetWithKeybag:v7 error:&v45];
      id v22 = v45;
      goto LABEL_19;
    case 1u:
      ++*(_DWORD *)(*(void *)(a1[10] + 8LL) + 24LL);
      uint64_t v25 = *(void **)(*(void *)(a1[8] + 8LL) + 40LL);
      if (!v25)
      {
        uint64_t v26 = -[SecureBackupViewStore initWithViewName:recordID:]( objc_alloc(&OBJC_CLASS___SecureBackupViewStore),  "initWithViewName:recordID:",  a1[4],  a1[5]);
        uint64_t v27 = *(void *)(a1[8] + 8LL);
        uint64_t v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;

        uint64_t v25 = *(void **)(*(void *)(a1[8] + 8LL) + 40LL);
      }

      uint64_t v29 = *(void *)(a1[9] + 8LL);
      v30 = *(void **)(v29 + 40);
      uint64_t v19 = (id *)(v29 + 40);
      v44 = v30;
      unsigned __int8 v21 = [v25 addItem:v8 error:&v44];
      id v22 = v44;
      goto LABEL_19;
    case 2u:
      ++*(_DWORD *)(*(void *)(a1[11] + 8LL) + 24LL);
      uint64_t v31 = *(void **)(*(void *)(a1[8] + 8LL) + 40LL);
      if (!v31)
      {
        uint64_t v32 = -[SecureBackupViewStore initWithViewName:recordID:]( objc_alloc(&OBJC_CLASS___SecureBackupViewStore),  "initWithViewName:recordID:",  a1[4],  a1[5]);
        uint64_t v33 = *(void *)(a1[8] + 8LL);
        uint64_t v34 = *(void **)(v33 + 40);
        *(void *)(v33 + 40) = v32;

        uint64_t v31 = *(void **)(*(void *)(a1[8] + 8LL) + 40LL);
      }

      uint64_t v35 = *(void *)(a1[9] + 8LL);
      uint64_t v36 = *(void **)(v35 + 40);
      uint64_t v19 = (id *)(v35 + 40);
      id obj = v36;
      unsigned __int8 v21 = [v31 removeItemWithKey:v7 error:&obj];
      id v22 = obj;
LABEL_19:
      objc_storeStrong(v19, v22);
      if ((v21 & 1) != 0) {
        goto LABEL_23;
      }
      uint64_t v37 = CloudServicesLog(v12);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      uint64_t v39 = off_100069868[a2];
      *(_DWORD *)buf = 136315138;
      v47 = v39;
      v40 = "_consumeViewBackup: event %s unsuccessful";
      break;
    case 3u:
      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
      goto LABEL_23;
    default:
      uint64_t v23 = CloudServicesLog(v12);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100044F50();
      }

LABEL_23:
      uint64_t v41 = CloudServicesLog(v12);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      if (a2 > 3) {
        uint64_t v42 = "unknown";
      }
      else {
        uint64_t v42 = off_100069868[a2];
      }
      *(_DWORD *)buf = 136315138;
      v47 = (void *)v42;
      v40 = "_consumeViewBackup: event %s successful!";
      break;
  }

  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);
LABEL_29:

  objc_autoreleasePoolPop(v13);
}

void sub_100015044( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100015070(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    id v8 = v3;
    unsigned int v4 = objc_autoreleasePoolPush();
    uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _consumeViewBackup:v8 recordID:*(void *)(a1 + 40)]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    objc_autoreleasePoolPop(v4);
    id v3 = v8;
  }
}

void sub_100015394( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000153D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1 + 48;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    uint64_t v5 = objc_autoreleasePoolPush();
    uint64_t v6 = CloudServicesLog(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "consuming backup for view %@",  (uint8_t *)&buf,  0xCu);
    }

    v77[0] = 0LL;
    v77[1] = v77;
    v77[2] = 0x2020000000LL;
    char v78 = 1;
    v75[0] = 0LL;
    v75[1] = v75;
    v75[2] = 0x2020000000LL;
    char v76 = 0;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v88 = 0x3032000000LL;
    v89 = sub_100011D74;
    v90 = sub_100011D84;
    id v91 = 0LL;
    uint64_t v71 = 0LL;
    v72 = &v71;
    uint64_t v73 = 0x2020000000LL;
    int v74 = 0;
    uint64_t v67 = 0LL;
    v68 = &v67;
    uint64_t v69 = 0x2020000000LL;
    int v70 = 0;
    uint64_t v63 = 0LL;
    v64 = &v63;
    uint64_t v65 = 0x2020000000LL;
    int v66 = 0;
    id v8 = *(void **)(a1 + 32);
    id v62 = 0LL;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_100015B08;
    v52[3] = &unk_1000691E8;
    v55 = v77;
    v56 = v75;
    uint64_t v57 = &v71;
    p___int128 buf = &buf;
    id v9 = v3;
    id v53 = v9;
    id v54 = *(id *)(a1 + 40);
    __int128 v59 = *(_OWORD *)(a1 + 48);
    v60 = &v67;
    v61 = &v63;
    unsigned int v10 = [v8 backupWithChanges:v9 error:&v62 handler:v52];
    id v11 = v62;
    uint64_t v12 = CloudServicesLog(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = "false";
      if (v10) {
        uint64_t v14 = "true";
      }
      int v15 = *((_DWORD *)v72 + 6);
      int v16 = *((_DWORD *)v68 + 6);
      int v17 = *((_DWORD *)v64 + 6);
      *(_DWORD *)v79 = 136315906;
      v80 = v14;
      __int16 v81 = 1024;
      int v82 = v15;
      __int16 v83 = 1024;
      int v84 = v16;
      __int16 v85 = 1024;
      int v86 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SecItemBackupWithChanges() returned %s (%d reset, %d add, %d remove)",  v79,  0x1Eu);
    }

    uint64_t v18 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (v18)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 manifestHash]);
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) keybagDigest]);
      [*(id *)(*((void *)&buf + 1) + 40) closeStore];
      unsigned __int8 v21 = *(void **)(*((void *)&buf + 1) + 40LL);
      *(void *)(*((void *)&buf + 1) + 40LL) = 0LL;

      if ((v10 & 1) != 0) {
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t v19 = 0LL;
      __int128 v20 = 0LL;
      if ((v10 & 1) != 0)
      {
LABEL_10:
        if (*(void *)(*(void *)(*(void *)v4 + 8LL) + 40LL))
        {
          uint64_t v22 = CloudServicesLog(v18);
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_100045070();
          }

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
          [v24 logUnrecoverableError:*(void *)(*(void *)(*(void *)v4 + 8) + 40) forEvent:CloudServicesAnalyticsBackupWithChangesIncremental withAttributes:0];

          uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  *(void *)(*(void *)(*(void *)v4 + 8LL) + 40LL),  NSUnderlyingErrorKey);
          uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v25));
          uint64_t v27 = *(void *)(*(void *)v4 + 8LL);
          uint64_t v28 = *(void **)(v27 + 40);
          *(void *)(v27 + 40) = v26;
        }

        else
        {
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
          [v33 logSuccessForEvent:CloudServicesAnalyticsBackupWithChangesIncremental];

          if (!v20 || !v19) {
            goto LABEL_29;
          }
          uint64_t v34 = *(void **)(a1 + 32);
          uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8LL);
          id obj = *(id *)(v35 + 40);
          unsigned __int8 v36 = [v34 backupSetConfirmedManifest:v9 digest:v20 manifest:v19 error:&obj];
          objc_storeStrong((id *)(v35 + 40), obj);
          if ((v36 & 1) != 0)
          {
            uint64_t v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[CloudServicesAnalytics logger]( &OBJC_CLASS___CloudServicesAnalytics,  "logger"));
            -[NSMutableDictionary logSuccessForEvent:]( v25,  "logSuccessForEvent:",  CloudServicesAnalyticsSetConfirmedManifest);
          }

          else
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
            [v44 logUnrecoverableError:*(void *)(*(void *)(*(void *)v4 + 8) + 40) forEvent:CloudServicesAnalyticsSetConfirmedManifest withAttributes:0];

            uint64_t v46 = CloudServicesLog(v45);
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              sub_100045010();
            }

            uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  *(void *)(*(void *)(*(void *)v4 + 8LL) + 40LL),  NSUnderlyingErrorKey);
            uint64_t v48 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v25));
            uint64_t v49 = *(void *)(*(void *)v4 + 8LL);
            v50 = *(void **)(v49 + 40);
            *(void *)(v49 + 40) = v48;
          }
        }

LABEL_28:
LABEL_29:
        _Block_object_dispose(&v63, 8);
        _Block_object_dispose(&v67, 8);
        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(&buf, 8);

        _Block_object_dispose(v75, 8);
        _Block_object_dispose(v77, 8);

        objc_autoreleasePoolPop(v5);
        goto LABEL_30;
      }
    }

    if (v11)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
      if ([v29 isEqualToString:NSPOSIXErrorDomain])
      {
        BOOL v30 = [v11 code] == (id)2;

        if (v30)
        {
          uint64_t v32 = CloudServicesLog(v31);
          uint64_t v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
            sub_10004513C();
          }
          goto LABEL_28;
        }
      }

      else
      {
      }
    }

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v37 logUnrecoverableError:v11 forEvent:CloudServicesAnalyticsBackupWithChangesIncremental withAttributes:0];

    uint64_t v39 = CloudServicesLog(v38);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000450D0();
    }

    uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v11, NSUnderlyingErrorKey);
    uint64_t v41 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v25));
    uint64_t v42 = *(void *)(*(void *)v4 + 8LL);
    id v43 = *(void **)(v42 + 40);
    *(void *)(v42 + 40) = v41;

    goto LABEL_28;
  }

LABEL_30:
}

          goto LABEL_37;
        }

        v52 = (void *)objc_claimAutoreleasedReturnValue([v10 preferredBottleIDs]);
        id v53 = [v52 indexOfObject:v51];

        id v54 = v10;
        v55 = (void *)objc_claimAutoreleasedReturnValue([v10 partialRecoveryBottleIDs]);
        v56 = [v55 indexOfObject:v51];

        if (v53 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v58 = CloudServicesLog(v57);
          __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
          v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
          if (v56 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            unsigned int v10 = v54;
            if (v60)
            {
              *(_DWORD *)__int128 buf = 138412290;
              *(void *)v98 = v48;
              v61 = v59;
              id v62 = "Record %@ has an unknown bottle";
              goto LABEL_29;
            }

            goto LABEL_30;
          }

          unsigned int v10 = v54;
          if (v60)
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)v98 = v48;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Record %@ in partially preferred bottle list, adding",  buf,  0xCu);
          }

          [v50 setObject:v86 forKeyedSubscript:v85];
          [v47 setObject:v50 forKeyedSubscript:v44];
          -[NSMutableArray setObject:atIndexedSubscript:](v83, "setObject:atIndexedSubscript:", v47, v56);
        }

        else
        {
          v64 = CloudServicesLog(v57);
          uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)v98 = v48;
            _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "Record %@ in preferred bottle list, adding",  buf,  0xCu);
          }

          [v50 setObject:v86 forKeyedSubscript:v85];
          [v47 setObject:v50 forKeyedSubscript:v44];
          -[NSMutableArray setObject:atIndexedSubscript:](v84, "setObject:atIndexedSubscript:", v47, v53);
          unsigned int v10 = v54;
        }

  return v20;
}

void sub_100015A8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_100015B08(void *a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    id v9 = objc_autoreleasePoolPush();
    unsigned int v10 = v9;
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
    switch(a2)
    {
      case 0:
        ++*(_DWORD *)(*(void *)(a1[8] + 8LL) + 24LL);
        id v11 = *(void **)(*(void *)(a1[9] + 8LL) + 40LL);
        if (!v11)
        {
          uint64_t v12 = -[SecureBackupViewStore initWithViewName:recordID:]( objc_alloc(&OBJC_CLASS___SecureBackupViewStore),  "initWithViewName:recordID:",  a1[4],  a1[5]);
          uint64_t v13 = *(void *)(a1[9] + 8LL);
          uint64_t v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;

          id v11 = *(void **)(*(void *)(a1[9] + 8LL) + 40LL);
        }

        uint64_t v15 = *(void *)(a1[10] + 8LL);
        id obj = *(id *)(v15 + 40);
        unsigned __int8 v16 = [v11 resetWithKeybag:v7 error:&obj];
        objc_storeStrong((id *)(v15 + 40), obj);
        *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v16;
        uint64_t v17 = a1[11];
        goto LABEL_17;
      case 1:
        ++*(_DWORD *)(*(void *)(a1[12] + 8LL) + 24LL);
        __int128 v20 = *(void **)(*(void *)(a1[9] + 8LL) + 40LL);
        if (!v20)
        {
          unsigned __int8 v21 = -[SecureBackupViewStore initWithViewName:recordID:]( objc_alloc(&OBJC_CLASS___SecureBackupViewStore),  "initWithViewName:recordID:",  a1[4],  a1[5]);
          uint64_t v22 = *(void *)(a1[9] + 8LL);
          uint64_t v23 = *(void **)(v22 + 40);
          *(void *)(v22 + 40) = v21;

          __int128 v20 = *(void **)(*(void *)(a1[9] + 8LL) + 40LL);
        }

        uint64_t v24 = *(void *)(a1[10] + 8LL);
        uint64_t v26 = *(void **)(v24 + 40);
        uint64_t v25 = (id *)(v24 + 40);
        unsigned __int8 v36 = v26;
        unsigned __int8 v27 = [v20 addItem:v8 error:&v36];
        id v28 = v36;
        goto LABEL_15;
      case 2:
        ++*(_DWORD *)(*(void *)(a1[13] + 8LL) + 24LL);
        uint64_t v29 = *(void **)(*(void *)(a1[9] + 8LL) + 40LL);
        if (!v29)
        {
          BOOL v30 = -[SecureBackupViewStore initWithViewName:recordID:]( objc_alloc(&OBJC_CLASS___SecureBackupViewStore),  "initWithViewName:recordID:",  a1[4],  a1[5]);
          uint64_t v31 = *(void *)(a1[9] + 8LL);
          uint64_t v32 = *(void **)(v31 + 40);
          *(void *)(v31 + 40) = v30;

          uint64_t v29 = *(void **)(*(void *)(a1[9] + 8LL) + 40LL);
        }

        uint64_t v33 = *(void *)(a1[10] + 8LL);
        uint64_t v34 = *(void **)(v33 + 40);
        uint64_t v25 = (id *)(v33 + 40);
        id v35 = v34;
        unsigned __int8 v27 = [v29 removeItemWithKey:v7 error:&v35];
        id v28 = v35;
LABEL_15:
        objc_storeStrong(v25, v28);
        *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v27;
        break;
      case 3:
        uint64_t v17 = a1[7];
LABEL_17:
        *(_BYTE *)(*(void *)(v17 + 8) + 24LL) = 1;
        break;
      default:
        uint64_t v18 = CloudServicesLog(v9);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10004519C();
        }

        break;
    }

    objc_autoreleasePoolPop(v10);
  }
}

id sub_100016400(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3) {
    return [*(id *)(a1 + 32) _stateCapture];
  }
  else {
    return 0LL;
  }
}

void sub_1000164DC(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
    if (string)
    {
      uint64_t v4 = string;
      uint64_t v5 = objc_autoreleasePoolPush();
      uint64_t v6 = *(void **)(a1 + 32);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
      [v6 handleNotification:v7];

      objc_autoreleasePoolPop(v5);
    }
  }
}

void sub_1000167D4(uint64_t a1, void *a2, void *a3)
{
  unsigned __int8 v16 = a2;
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSecureBackupTimestampKey]);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, @"timestamp");
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"recordID"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, @"creator");

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"keybag"]);
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 peersAndBackupKeyDigests]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, @"peerIDs");

    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue([v11 recoveryKey]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSString sha1Digest](v13, "sha1Digest"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, @"rk");

    uint64_t v15 = v16;
  }

  else
  {
    uint64_t v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ (direct keybag)",  v16);
    uint64_t v13 = v16;
  }

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v15];
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) setObject:*(void *)(a1 + 32) forKeyedSubscript:@"backups"];
  }
}

void sub_1000173B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000173D0(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "in dispatch_after()", v6, 2u);
  }

  [*(id *)(a1 + 32) notificationOccurred:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setPendingNotification:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0LL;
}

void sub_1000176F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CloudServicesLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Backup returned %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

LABEL_27:
    if (-[NSMutableSet count](v5, "count"))
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
      [v39 logSuccessForEvent:CloudServicesiCloudIdentity];
    }

    else
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  212LL,  0LL,  @"iCloudIdentity not found in backup"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
      [v40 logUnrecoverableError:v39 forEvent:CloudServicesiCloudIdentity withAttributes:0];

      id v5 = v45;
    }

    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v5, "allObjects"));
    goto LABEL_31;
  }

  uint64_t v34 = CloudServicesLog(v11);
  id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    sub_1000454E8();
  }

  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  211LL,  0LL,  @"no keybag found in iCloudIdentity backup"));
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  [v37 logUnrecoverableError:v36 forEvent:CloudServicesAnalyticsiCDPKeybag withAttributes:0];

  uint64_t v38 = &__NSArray0__struct;
LABEL_31:

  return v38;
}

        uint64_t v12 = v51;
        id v8 = v52;
        uint64_t v25 = v16;
        unsigned __int8 v36 = v54;
        goto LABEL_28;
      }

      if (v32 == (id)-1LL)
      {
        uint64_t v39 = CloudServicesLog(-1LL);
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          v61 = v31;
          uint64_t v38 = "candidate can recover %@";
          goto LABEL_26;
        }

        goto LABEL_27;
      }
    }

    id v28 = [&off_10006DAC8 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v28) {
      continue;
    }
    break;
  }

void sub_1000183AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CloudServicesLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "getAccountInfoWithRequest: in daemon came back",  buf,  2u);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v10 = v9;
  if (v6)
  {
    uint64_t v11 = CloudServicesLog(v9);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v267 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "escrowService getAccountInfoWithRequest: returned %@",  buf,  0xCu);
    }

    uint64_t v14 = CloudServicesLog(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v6 code];
      *(_DWORD *)__int128 buf = 134217984;
      id v267 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "getAccountInfoWithRequest: error: %ld",  buf,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    goto LABEL_192;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"EscrowServiceAccountInfo"]);
  uint64_t v18 = CloudServicesLog(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v17 count];
    *(_DWORD *)__int128 buf = 134217984;
    id v267 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "got %lu records", buf, 0xCu);
  }

  unsigned __int8 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v224 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v260 = 0u;
  __int128 v261 = 0u;
  __int128 v262 = 0u;
  __int128 v263 = 0u;
  id v22 = v17;
  v208 = v10;
  id v219 = v22;
  uint64_t v220 = a1;
  id v233 = [v22 countByEnumeratingWithState:&v260 objects:v278 count:16];
  id v182 = v5;
  if (!v233)
  {
    id v6 = 0LL;
    v90 = 0LL;
    uint64_t v23 = 0LL;
LABEL_100:

    goto LABEL_102;
  }

  v198 = v21;
  uint64_t v23 = 0LL;
  v221 = 0LL;
  v186 = 0LL;
  uint64_t v231 = *(void *)v261;
  uint64_t v230 = kEscrowServiceRecordLabelKey;
  uint64_t v232 = kEscrowServiceRecordMetadataKey;
  uint64_t v236 = kSecureBackupKeybagSHA256Key;
  uint64_t v235 = kSecureBackupKeybagDigestKey;
  uint64_t v234 = kSecureBackupTimestampKey;
  uint64_t v229 = kEscrowServiceRecordStatusKey;
  v228 = (void *)kEscrowServiceStingrayLabel;
  v218 = (void *)kEscrowServiceGuitarfishLabel;
  uint64_t v197 = kEscrowServiceGuitarfishTokenLabel;
  uint64_t v216 = kSecureBackupFederationKey;
  uint64_t v215 = kSecureBackupExpectedFederationKey;
  uint64_t v214 = kSecureBackupRemainingAttemptsKey;
  uint64_t v183 = kSecureBackupGuitarfishRecoveryTokenMetadataKey;
  uint64_t v203 = kSecureBackupEscrowDateKey;
  uint64_t v196 = kSecureBackupRecordLabelKey;
  uint64_t v195 = kSecureBackupSerialNumberKey;
  uint64_t v194 = kSecureBackupBuildVersionKey;
  uint64_t v184 = kSecureBackupPeerInfoDataKey;
  uint64_t v193 = kSecureBackupBottleIDKey;
  uint64_t v192 = kSecureBackupPeerInfoSerialNumberKey;
  uint64_t v191 = kSecureBackupPeerInfoOSVersionKey;
  uint64_t v206 = kSecureBackupRecordStatusValid;
  uint64_t v205 = kSecureBackupRecordStatusKey;
  uint64_t v204 = kSecureBackupRecordStatusInvalid;
  uint64_t v202 = kSecureBackupEscrowTimestampKey;
  uint64_t v201 = kSecureBackupEscrowDigestKey;
  uint64_t v200 = kSecureBackupMetadataKey;
  uint64_t v217 = kEscrowServiceRecordStatusValid;
  uint64_t v207 = kSecureBackupContainsiCloudIdentityKey;
  uint64_t v212 = kSecureBackupTriggerUpdateKey;
  uint64_t v211 = kSecureBackupStingrayMetadataKey;
  uint64_t v210 = kSecureBackupBackOffDateKey;
  uint64_t v209 = kSecureBackupEncodedMetadataKey;
  uint64_t v213 = kSecureBackupStingrayMetadataHashKey;
  uint64_t v190 = kSecureBackupRecordIDKey;
  do
  {
    uint64_t v24 = 0LL;
    do
    {
      if (*(void *)v261 != v231) {
        objc_enumerationMutation(v22);
      }
      uint64_t v25 = *(void **)(*((void *)&v260 + 1) + 8LL * (void)v24);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v230]);
      unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v232]);

      v239 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v236]);
      v245 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v235]);
      v240 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v234]);
      v243 = (void *)objc_claimAutoreleasedReturnValue( +[CSDateUtilities secureBackupDateFromString:]( &OBJC_CLASS___CSDateUtilities,  "secureBackupDateFromString:"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v229]);
      id v29 = v228;
      if ([*(id *)(a1 + 32) guitarfish])
      {
        id v30 = v218;
        uint64_t v31 = v29;
        id v29 = v30;
      }

      v241 = v26;
      v238 = v28;
      v237 = v29;
      if ([v26 isEqualToString:v29])
      {
        if ([v28 isEqualToString:v217]) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  v207);
        }
        if (v27)
        {
          id v32 = [v27 mutableCopy];
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v212]);
          [v32 setObject:v33 forKeyedSubscript:v212];

          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"federationID"]);
          [v32 setObject:v34 forKeyedSubscript:v216];

          id v35 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"expectedFederationID"]);
          [v32 setObject:v35 forKeyedSubscript:v215];

          unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v214]);
          [v32 setObject:v36 forKeyedSubscript:v214];

          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v32, v211);
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v210]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v37, v210);
          uint64_t v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"encodedMetadata"]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v39, v209);

          -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v240, v234);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v239, v236);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v245, v235);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v37, v210);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v38, v213);

          goto LABEL_23;
        }
      }

      else
      {
        if ([v26 isEqualToString:@"com.apple.protectedcloudstorage.record.double"])
        {
          uint64_t v43 = objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"encodedMetadata"]);

          v40 = 0LL;
          uint64_t v41 = 0LL;
          uint64_t v42 = 0LL;
          uint64_t v23 = v27;
          v221 = (void *)v43;
          goto LABEL_66;
        }

        if ([v26 isEqualToString:@"com.apple.securebackup.record"])
        {
          else {
            uint64_t v44 = v206;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v44, v205);
          if (v27)
          {
            if (v240) {
              uint64_t v45 = v240;
            }
            else {
              uint64_t v45 = @"UNKNOWN";
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v45, v202);
            if (v245) {
              uint64_t v46 = v245;
            }
            else {
              uint64_t v46 = @"UNKNOWN";
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v46, v201);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) massageIncomingMetadataFromInfo:v27]);

            if (v23) {
              v47 = v23;
            }
            else {
              v47 = &__NSDictionary0__struct;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v47, v200);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v243, v203);
            goto LABEL_65;
          }
        }

        else
        {
          id v48 = [v26 hasPrefix:@"com.apple.icdp.record.double"];
          if ((_DWORD)v48)
          {
            uint64_t v49 = CloudServicesLog(v48);
            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v267 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "ignoring old double enrollment record: %@",  buf,  0xCu);
            }

LABEL_89:
            goto LABEL_24;
          }

          if ([v26 hasPrefix:@"com.apple.icdp.record"]
            && [v26 hasSuffix:@".double"])
          {
            id v32 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) _recordIDFromLabel:v26 withPrefix:@"com.apple.icdp.record" suffix:@".double"]);
            uint64_t v51 = objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"encodedMetadata"]);
            v52 = (void *)v51;
            if (v32 && v51) {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v224, "setObject:forKeyedSubscript:", v51, v32);
            }

LABEL_23:
LABEL_24:
            v40 = 0LL;
            uint64_t v41 = 0LL;
            uint64_t v42 = 0LL;
LABEL_25:
            uint64_t v23 = v27;
            goto LABEL_66;
          }

          if ([v26 hasPrefix:@"com.apple.icdp.record"])
          {
            id v53 = [v25 mutableCopy];
            [v53 setObject:v243 forKeyedSubscript:v203];
            id v54 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) _recordIDFromLabel:v26 withPrefix:@"com.apple.icdp.record" suffix:0]);
            [v53 setObject:v54 forKeyedSubscript:v190];

            v225 = v53;
            [v53 setObject:@"com.apple.icdp.record" forKeyedSubscript:v196];
            v40 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v195]);
            uint64_t v55 = objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v194]);
            uint64_t v41 = (__CFString *)v55;
            if (!v40 || !v55)
            {
              v56 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v184]);
              if (v56)
              {
                uint64_t v57 = *(void **)(a1 + 40);
                id v259 = v186;
                uint64_t v58 = objc_claimAutoreleasedReturnValue([v57 createPeerInfoFromData:v56 error:&v259]);
                id v185 = v259;

                v187 = (void *)v58;
                if (v58)
                {
                  if (!v40) {
                    v40 = (__CFString *)[*(id *)(a1 + 40) copySerialNumber:v58];
                  }
                  id v60 = v185;
                  if (!v41) {
                    uint64_t v41 = (__CFString *)[*(id *)(a1 + 40) copyOSVersion:v187];
                  }
                }

                else
                {
                  uint64_t v86 = CloudServicesLog(v59);
                  v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
                  id v60 = v185;
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)__int128 buf = 138412290;
                    id v267 = v185;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_ERROR,  "could not create peer info from data: %@",  buf,  0xCu);
                  }
                }

                v186 = v60;
              }
            }

            uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKeyedSubscript:v232]);
            uint64_t v42 = (__CFString *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:v193]);

            [v225 setObject:v40 forKeyedSubscript:v192];
            [v225 setObject:v41 forKeyedSubscript:v191];
            -[NSMutableArray addObject:](v198, "addObject:", v225);

            goto LABEL_25;
          }

          id v61 = [v26 isEqualToString:v197];
          if (!(_DWORD)v61)
          {
            uint64_t v85 = CloudServicesLog(v61);
            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v267 = v26;
              _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "unexpected label: %@", buf, 0xCu);
            }

            goto LABEL_89;
          }

          if (v27)
          {
            id v32 = [v27 mutableCopy];
            id v62 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"federationID"]);
            [v32 setObject:v62 forKeyedSubscript:v216];

            uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"expectedFederationID"]);
            [v32 setObject:v63 forKeyedSubscript:v215];

            v64 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v214]);
            [v32 setObject:v64 forKeyedSubscript:v214];

            -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v32, v183);
            goto LABEL_23;
          }
        }
      }

      uint64_t v23 = 0LL;
LABEL_65:
      v40 = 0LL;
      uint64_t v41 = 0LL;
      uint64_t v42 = 0LL;
LABEL_66:
      uint64_t v65 = sub_1000052A8();
      int v66 = v65;
      uint64_t v67 = CloudServicesLog(v65);
      v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
      BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
      if (v66)
      {
        if (v69)
        {
          int v70 = &stru_10006AB28;
          if (v40) {
            uint64_t v71 = v40;
          }
          else {
            uint64_t v71 = &stru_10006AB28;
          }
          v72 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString hexString](v245, "hexString"));
          if (v42) {
            uint64_t v73 = v42;
          }
          else {
            uint64_t v73 = @"(no bottle ID)";
          }
          if (v41) {
            int v70 = v41;
          }
          v226 = v24;
          int v74 = v41;
          v75 = v40;
          char v76 = v23;
          id v77 = (id)objc_claimAutoreleasedReturnValue( +[CSDateUtilities localStringFromDate:]( &OBJC_CLASS___CSDateUtilities,  "localStringFromDate:",  v243));
          *(_DWORD *)__int128 buf = 138413570;
          id v267 = v241;
          __int16 v268 = 2112;
          v269 = v71;
          unsigned int v10 = v208;
          __int16 v270 = 2112;
          v271 = v72;
          __int16 v272 = 2112;
          v273 = v73;
          __int16 v274 = 2112;
          v275 = v70;
          id v22 = v219;
          a1 = v220;
          __int16 v276 = 2112;
          id v277 = v77;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ %@ %@ %@", buf, 0x3Eu);

          uint64_t v23 = v76;
          v40 = v75;
          uint64_t v41 = v74;
          uint64_t v24 = v226;
        }
      }

      else if (v69)
      {
        v227 = v24;
        char v78 = v40;
        v79 = v10;
        v80 = v23;
        __int16 v81 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString hexString](v245, "hexString"));
        if (v42) {
          int v82 = v42;
        }
        else {
          int v82 = @"(no bottle ID)";
        }
        if (v41) {
          __int16 v83 = v41;
        }
        else {
          __int16 v83 = &stru_10006AB28;
        }
        int v84 = (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[CSDateUtilities localStringFromDate:]( &OBJC_CLASS___CSDateUtilities,  "localStringFromDate:",  v243));
        *(_DWORD *)__int128 buf = 138413314;
        id v267 = v241;
        __int16 v268 = 2112;
        v269 = v81;
        __int16 v270 = 2112;
        v271 = v82;
        __int16 v272 = 2112;
        v273 = v83;
        id v22 = v219;
        a1 = v220;
        __int16 v274 = 2112;
        v275 = v84;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ %@ %@", buf, 0x34u);

        uint64_t v23 = v80;
        unsigned int v10 = v79;
        v40 = v78;
        uint64_t v24 = v227;
      }

      uint64_t v24 = (char *)v24 + 1;
    }

    while (v233 != v24);
    id v89 = [v22 countByEnumeratingWithState:&v260 objects:v278 count:16];
    id v233 = v89;
  }

  while (v89);

  v90 = v221;
  if (v221)
  {
    id v22 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v213));
    [v22 setObject:v221 forKeyedSubscript:@"duplicateEncodedMetadata"];
    id v5 = v182;
    id v6 = v186;
    unsigned __int8 v21 = v198;
    goto LABEL_100;
  }

  id v5 = v182;
  id v6 = v186;
  unsigned __int8 v21 = v198;
LABEL_102:
  v246 = v23;
  if (-[NSMutableDictionary count](v224, "count"))
  {
    v222 = v90;
    id v188 = v6;
    id v91 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v224, "allKeys"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v91,  kSecureBackupiCDPDoubleEnrollmentRecordIDsKey);

    __int128 v257 = 0u;
    __int128 v258 = 0u;
    __int128 v256 = 0u;
    __int128 v255 = 0u;
    v92 = v21;
    v93 = v21;
    id v94 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v93,  "countByEnumeratingWithState:objects:count:",  &v255,  v265,  16LL);
    if (v94)
    {
      id v95 = v94;
      uint64_t v96 = *(void *)v256;
      uint64_t v97 = kSecureBackupRecordIDKey;
      do
      {
        for (i = 0LL; i != v95; i = (char *)i + 1)
        {
          if (*(void *)v256 != v96) {
            objc_enumerationMutation(v93);
          }
          v99 = *(void **)(*((void *)&v255 + 1) + 8LL * (void)i);
          v100 = (void *)objc_claimAutoreleasedReturnValue([v99 objectForKeyedSubscript:v97]);
          v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v224, "objectForKeyedSubscript:", v100));
          [v99 setObject:v101 forKeyedSubscript:@"duplicateEncodedMetadata"];
        }

        id v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v93,  "countByEnumeratingWithState:objects:count:",  &v255,  v265,  16LL);
      }

      while (v95);
    }

    id v5 = v182;
    unsigned int v10 = v208;
    a1 = v220;
    v90 = v222;
    id v6 = v188;
    unsigned __int8 v21 = v92;
  }

  uint64_t v102 = (uint64_t)-[NSMutableArray count](v21, "count");
  if (v102)
  {
    uint64_t v102 = (uint64_t)[*(id *)(a1 + 32) excludeiCDPRecords];
    if ((v102 & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v21,  kSecureBackupAlliCDPRecordsKey);
      else {
        unsigned int v103 = 0;
      }
      id v104 = [*(id *)(a1 + 32) stingray];
      if ((v104 & 1) != 0
        || (id v104 = [*(id *)(a1 + 32) suppressServerFiltering], ((v104 | v103) & 1) != 0))
      {
        uint64_t v105 = CloudServicesLog(v104);
        v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_DEFAULT,  "Skipping cuttlefish bottle sorting",  buf,  2u);
        }
      }

      else
      {
        v106 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sortRecordsByBottleID:v21]);
        v107 = (NSMutableArray *)-[os_log_s mutableCopy](v106, "mutableCopy");

        unsigned __int8 v21 = v107;
      }

      uint64_t v108 = kSecureBackupiCDPRecordsKey;
      uint64_t v102 = OctagonPlatformSupportsSOS( -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v21,  kSecureBackupiCDPRecordsKey));
      if ((_DWORD)v102)
      {
        v109 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) filteriCDPRecords:v21]);
        if ([v109 count])
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v109, v108);
        }

        else
        {
          uint64_t v110 = CloudServicesLog(0LL);
          v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_DEFAULT,  "filteriCDPRecords returned 0 SOS viable records.",  buf,  2u);
          }

          id v112 = (id)_os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn");
          if ((_DWORD)v112 && (id v112 = [*(id *)(a1 + 32) sosCompatibleEscrowSorting], (_DWORD)v112))
          {
            v244 = v109;
            v223 = v90;
            v199 = v21;
            id v189 = v6;
            uint64_t v113 = CloudServicesLog(v112);
            v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
            if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_DEFAULT,  "since this is an SOS driven escrow record fetch, remove Octagon only escrow records before returning the entire list",  buf,  2u);
            }

            v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            uint64_t v242 = v108;
            __int128 v251 = 0u;
            __int128 v252 = 0u;
            __int128 v253 = 0u;
            __int128 v254 = 0u;
            id v116 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v10,  "objectForKeyedSubscript:",  v108));
            id v117 = [v116 countByEnumeratingWithState:&v251 objects:v264 count:16];
            if (v117)
            {
              id v118 = v117;
              uint64_t v119 = *(void *)v252;
              uint64_t v120 = kEscrowServiceRecordMetadataKey;
              uint64_t v121 = kSecureBackupPeerInfoDataKey;
              do
              {
                for (j = 0LL; j != v118; j = (char *)j + 1)
                {
                  if (*(void *)v252 != v119) {
                    objc_enumerationMutation(v116);
                  }
                  v123 = *(void **)(*((void *)&v251 + 1) + 8LL * (void)j);
                  v124 = (void *)objc_claimAutoreleasedReturnValue([v123 objectForKeyedSubscript:v120]);
                  v125 = (void *)objc_claimAutoreleasedReturnValue([v124 objectForKeyedSubscript:v121]);

                  if (v125) {
                    [v115 addObject:v123];
                  }
                }

                id v118 = [v116 countByEnumeratingWithState:&v251 objects:v264 count:16];
              }

              while (v118);
            }

            uint64_t v127 = CloudServicesLog(v126);
            v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
            if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v267 = v115;
              _os_log_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_DEFAULT,  "filtered out Octagon only records. new set of SOS records: %@",  buf,  0xCu);
            }

            unsigned int v10 = v208;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v208, "setObject:forKeyedSubscript:", v115, v242);

            id v5 = v182;
            a1 = v220;
            v90 = v223;
            id v6 = v189;
            unsigned __int8 v21 = v199;
            v109 = v244;
          }

          else
          {
            uint64_t v129 = CloudServicesLog(v112);
            v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);
            if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v130,  OS_LOG_TYPE_DEFAULT,  "returning the entire list of iCDP records",  buf,  2u);
            }
          }
        }
      }
    }
  }

  if ((OctagonPlatformSupportsSOS(v102) & 1) == 0
    && (_os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn") & 1) == 0)
  {
    if (-[NSMutableArray count](v21, "count")) {
      v169 = &__kCFBooleanTrue;
    }
    else {
      v169 = &__kCFBooleanFalse;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v169,  kSecureBackupIsEnabledKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  kSecureBackupUsesRecoveryKeyKey);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    v168 = v219;
    goto LABEL_191;
  }

  id v131 = [*(id *)(a1 + 40) _backupEnabled];
  int v132 = (int)v131;
  uint64_t v133 = CloudServicesLog(v131);
  v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
  BOOL v135 = os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT);
  if (!v132)
  {
    v168 = v219;
    if (v135)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "backup not enabled", buf, 2u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  kSecureBackupIsEnabledKey);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    goto LABEL_191;
  }

  if (v135)
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "backup enabled", buf, 2u);
  }

  uint64_t v136 = kSecureBackupIsEnabledKey;
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecureBackupIsEnabledKey);
  v137 = *(void **)(a1 + 40);
  v138 = (void *)objc_claimAutoreleasedReturnValue([v137 kvs]);
  v139 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v137 hasRecoveryKeyInKVS:v138 error:0]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v139,  kSecureBackupUsesRecoveryKeyKey);

  uint64_t v140 = v220;
  v141 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v220 + 40) _getLastBackupTimestamp]);
  if (v141)
  {
    v142 = (void *)objc_claimAutoreleasedReturnValue( +[CSDateUtilities secureBackupDateFromString:]( &OBJC_CLASS___CSDateUtilities,  "secureBackupDateFromString:",  v141));
    if (v142) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v142,  kSecureBackupLastBackupDateKey);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v141,  kSecureBackupLastBackupTimestampKey);
  }

  id v143 = [*(id *)(v220 + 40) _usesEscrow];
  if (!(_DWORD)v143)
  {
LABEL_158:
    uint64_t v148 = CloudServicesLog(v143);
    v149 = (os_log_s *)objc_claimAutoreleasedReturnValue(v148);
    if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_DEFAULT, "account does not use escrow", buf, 2u);
    }

    uint64_t v151 = CloudServicesLog(v150);
    v152 = (os_log_s *)objc_claimAutoreleasedReturnValue(v151);
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v153 = [*(id *)(v140 + 40) _usesEscrow];
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v267) = v153;
      _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "account useEscrow: %d", buf, 8u);
    }

    uint64_t v155 = CloudServicesLog(v154);
    v156 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
    if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
    {
      v157 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v208,  "objectForKeyedSubscript:",  kSecureBackupRecordStatusKey));
      *(_DWORD *)__int128 buf = 138412290;
      id v267 = v157;
      _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "account SecureBackup status: %@", buf, 0xCu);

      uint64_t v140 = v220;
    }

    uint64_t v159 = CloudServicesLog(v158);
    v160 = (os_log_s *)objc_claimAutoreleasedReturnValue(v159);
    if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v161 = -[NSMutableArray count](v21, "count");
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v267) = v161;
      _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "account iCDP records: %d", buf, 8u);
    }

    if (v141)
    {
      unsigned int v10 = v208;
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v208,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecureBackupUsesRandomPassphraseKey);
      v163 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v140 + 40) _metadata]);
      v164 = v163;
      if (v163
        && (uint64_t v165 = kSecureBackupClientMetadataKey,
            v166 = (void *)objc_claimAutoreleasedReturnValue([v163 objectForKeyedSubscript:kSecureBackupClientMetadataKey]),
            v166,
            v166))
      {
        v167 = (void *)objc_claimAutoreleasedReturnValue([v164 objectForKeyedSubscript:v165]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v208,  "setObject:forKeyedSubscript:",  v167,  kSecureBackupMetadataKey);
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v208,  "setObject:forKeyedSubscript:",  &__NSDictionary0__struct,  kSecureBackupMetadataKey);
      }

      uint64_t v140 = v220;
    }

    else
    {
      uint64_t v170 = CloudServicesLog(v162);
      v171 = (os_log_s *)objc_claimAutoreleasedReturnValue(v170);
      unsigned int v10 = v208;
      if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR)) {
        sub_100045574();
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v208,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  v136);
    }

LABEL_189:
    (*(void (**)(void))(*(void *)(v140 + 56) + 16LL))();
    goto LABEL_190;
  }

  uint64_t v144 = kSecureBackupRecordStatusKey;
  v145 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v208,  "objectForKeyedSubscript:",  kSecureBackupRecordStatusKey));
  v146 = v145;
  if (v145 == (void *)kSecureBackupRecordStatusValid)
  {

    uint64_t v140 = v220;
  }

  else
  {
    id v147 = -[NSMutableArray count](v21, "count");

    uint64_t v140 = v220;
    if (!v147) {
      goto LABEL_158;
    }
  }

  uint64_t v172 = CloudServicesLog(v143);
  v173 = (os_log_s *)objc_claimAutoreleasedReturnValue(v172);
  if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "account uses escrow", buf, 2u);
  }

  unsigned int v10 = v208;
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v208,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  kSecureBackupUsesRandomPassphraseKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v208,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  kSecureBackupRecoveryRequiresVerificationTokenKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v208,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  kSecureBackupAccountIsHighSecurityKey);
  v174 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v208, "objectForKeyedSubscript:", v144));

  if (!v174) {
    goto LABEL_189;
  }
  uint64_t v176 = CloudServicesLog(v175);
  v177 = (os_log_s *)objc_claimAutoreleasedReturnValue(v176);
  if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "calling listSMSTargets: in daemon", buf, 2u);
  }

  v178 = *(void **)(v140 + 48);
  uint64_t v179 = *(void *)(v140 + 32);
  v247[0] = _NSConcreteStackBlock;
  v247[1] = 3221225472LL;
  v247[2] = sub_100019F24;
  v247[3] = &unk_100069300;
  v180 = v208;
  uint64_t v181 = *(void *)(v140 + 40);
  v248 = v180;
  uint64_t v249 = v181;
  id v250 = *(id *)(v140 + 56);
  [v178 listSMSTargetsWithRequest:v179 completionBlock:v247];

LABEL_190:
  v168 = v219;

LABEL_191:
LABEL_192:
}

void sub_100019F24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CloudServicesLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "listSMSTargets: came back", (uint8_t *)&v24, 2u);
  }

  if (v6)
  {
    uint64_t v10 = CloudServicesLog(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "escrowService listSMSTargetsWithRequest: returned %@",  (uint8_t *)&v24,  0xCu);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"EscrowServiceSMSTargetInfo"]);
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"challengeDevices"]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray, v15);
    if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0 && [v14 count])
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);
      [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:kSecureBackupSMSTargetInfoKey];
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"isHSAEnabled"]);
    uint64_t v19 = (void *)v18;
    if (v18) {
      id v20 = (void *)v18;
    }
    else {
      id v20 = &__kCFBooleanFalse;
    }
    [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:kSecureBackupAccountIsHighSecurityKey];
    if ([*(id *)(a1 + 40) forceICDP])
    {
      [*(id *)(a1 + 32) setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupRecoveryRequiresVerificationTokenKey];
    }

    else
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"recoveryRequiresChallengeCode"]);
      id v22 = (void *)v21;
      if (v21) {
        uint64_t v23 = (void *)v21;
      }
      else {
        uint64_t v23 = &__kCFBooleanFalse;
      }
      [*(id *)(a1 + 32) setObject:v23 forKeyedSubscript:kSecureBackupRecoveryRequiresVerificationTokenKey];
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10001A33C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CloudServicesLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "getAccountInfoWithRequest: in daemon came back",  buf,  2u);
  }

  if (!v6)
  {
    uint64_t v53 = a1;
    id v16 = objc_alloc_init(&OBJC_CLASS___CSStingrayAccountStatus);
    id v54 = v5;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"EscrowServiceAccountInfo"]);
    uint64_t v18 = CloudServicesLog(v17);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (os_log_s *)[v17 count];
      *(_DWORD *)__int128 buf = 134217984;
      uint64_t v65 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "got %lu records", buf, 0xCu);
    }

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v21 = v17;
    id v22 = [v21 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (!v22)
    {
LABEL_48:

      (*(void (**)(void))(*(void *)(v53 + 32) + 16LL))();
      id v6 = 0LL;
      id v5 = v54;
      goto LABEL_49;
    }

    id v23 = v22;
    uint64_t v24 = *(void *)v60;
    uint64_t v25 = kEscrowServiceRecordLabelKey;
    uint64_t v26 = kEscrowServiceStingrayLabel;
    uint64_t v55 = kEscrowServiceGuitarfishTokenLabel;
    uint64_t v56 = kEscrowServiceGuitarfishLabel;
LABEL_13:
    uint64_t v27 = 0LL;
    while (1)
    {
      if (*(void *)v60 != v24) {
        objc_enumerationMutation(v21);
      }
      id v28 = *(void **)(*((void *)&v59 + 1) + 8 * v27);
      id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v25, v53));
      if ([v29 isEqualToString:v26])
      {
        id v58 = 0LL;
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[CSStingrayRecord parseFromAccountInfoPlist:error:]( &OBJC_CLASS___CSStingrayRecord,  "parseFromAccountInfoPlist:error:",  v28,  &v58));
        uint64_t v31 = (os_log_s *)v58;
        [v16 setStingrayRecord:v30];

        if (v31)
        {
          uint64_t v33 = CloudServicesLog(v32);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          if (!os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
          {
LABEL_23:

            goto LABEL_24;
          }

          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v65 = v31;
          id v35 = (os_log_s *)v34;
          unsigned __int8 v36 = "error parsing record: %@";
LABEL_44:
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);
          goto LABEL_23;
        }
      }

      else if ([v29 isEqualToString:v56])
      {
        id v57 = 0LL;
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[CSStingrayRecord parseFromAccountInfoPlist:error:]( &OBJC_CLASS___CSStingrayRecord,  "parseFromAccountInfoPlist:error:",  v28,  &v57));
        uint64_t v31 = (os_log_s *)v57;
        [v16 setGfRecord:v37];

        if (v31)
        {
          uint64_t v39 = CloudServicesLog(v38);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v39);
          if (!os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v65 = v31;
          id v35 = (os_log_s *)v34;
          unsigned __int8 v36 = "error parsing Guitarfish record: %@";
          goto LABEL_44;
        }
      }

      else
      {
        if (([v29 isEqualToString:v55] & 1) != 0
          || ([v29 isEqualToString:@"com.apple.protectedcloudstorage.record.double"] & 1) != 0)
        {
          goto LABEL_25;
        }

        id v40 = [v29 isEqualToString:@"com.apple.securebackup.record"];
        if ((_DWORD)v40)
        {
          uint64_t v41 = CloudServicesLog(v40);
          uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_41;
          }
        }

        else
        {
          id v42 = [v29 hasPrefix:@"com.apple.icdp.record.double"];
          if ((_DWORD)v42)
          {
            uint64_t v43 = CloudServicesLog(v42);
            uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              uint64_t v65 = (os_log_s *)v29;
              uint64_t v44 = v31;
              uint64_t v45 = "ignoring old double enrollment record: %@";
LABEL_42:
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v45, buf, 0xCu);
            }
          }

          else if ([v29 hasPrefix:@"com.apple.icdp.record"] {
                 && (id v46 = [v29 hasSuffix:@".double"], (_DWORD)v46))
          }
          {
            uint64_t v47 = CloudServicesLog(v46);
            uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              uint64_t v65 = (os_log_s *)v29;
              uint64_t v44 = v31;
              uint64_t v45 = "ignoring icdp record: %@";
              goto LABEL_42;
            }
          }

          else
          {
            id v48 = [v29 hasPrefix:@"com.apple.icdp.record"];
            int v49 = (int)v48;
            uint64_t v50 = CloudServicesLog(v48);
            uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
            uint64_t v31 = v51;
            if (!v49)
            {
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 138412290;
                uint64_t v65 = (os_log_s *)v29;
                _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "unexpected label: %@",  buf,  0xCu);
              }

              goto LABEL_24;
            }

            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
LABEL_41:
              *(_DWORD *)__int128 buf = 138412290;
              uint64_t v65 = (os_log_s *)v29;
              uint64_t v44 = v31;
              uint64_t v45 = "ignoring escrow service record: %@";
              goto LABEL_42;
            }
          }
        }
      }

LABEL_24:
LABEL_25:
      if (v23 == (id)++v27)
      {
        id v52 = [v21 countByEnumeratingWithState:&v59 objects:v63 count:16];
        id v23 = v52;
        if (!v52) {
          goto LABEL_48;
        }
        goto LABEL_13;
      }
    }
  }

  uint64_t v10 = CloudServicesLog(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v65 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "escrowService getAccountInfoWithRequest: returned %@",  buf,  0xCu);
  }

  uint64_t v13 = CloudServicesLog(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (os_log_s *)-[os_log_s code](v6, "code");
    *(_DWORD *)__int128 buf = 134217984;
    uint64_t v65 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "getAccountInfoWithRequest: error: %ld",  buf,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_49:
}

              id v40 = CloudServicesLog(v26);
              uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                id v42 = (char *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
                uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
                uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudPassword]);
                uint64_t v45 = @"non-";
                *(_DWORD *)__int128 buf = 138412802;
                id v52 = v42;
                uint64_t v53 = 2112;
                if (!v44) {
                  uint64_t v45 = &stru_10006AB28;
                }
                id v54 = v43;
                uint64_t v55 = 2112;
                uint64_t v56 = v45;
                _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "attempted to change SMS target, with invalid parameters: %@, %@, %@nil iCloud password",  buf,  0x20u);
              }

              int v49 = NSLocalizedDescriptionKey;
              uint64_t v50 = @"attempted to change SMS target with invalid parameters";
              id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
              uint64_t v31 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  4LL,  v29));
              v7[2](v7, v31);
              goto LABEL_29;
            }
          }
        }
      }

      goto LABEL_24;
    }

    unsigned __int8 v36 = CloudServicesLog(v16);
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "attempted to change SMS target, but not using escrow",  buf,  2u);
    }

    id v57 = NSLocalizedDescriptionKey;
    id v58 = @"attempted to change SMS target, but not using escrow";
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  10LL,  v38));
    v7[2](v7, v39);
  }

  else
  {
    uint64_t v32 = CloudServicesLog(v15);
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "attempted to change SMS target, but backup is not enabled",  buf,  2u);
    }

    __int128 v59 = NSLocalizedDescriptionKey;
    __int128 v60 = @"attempted to change SMS target, but backup is not enabled";
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  16LL,  v34));
    v7[2](v7, v35);
  }

LABEL_37:
      }

      uint64_t v43 = obj;
      v90 = [obj countByEnumeratingWithState:&v91 objects:v96 count:16];
    }

    while (v90);
  }

  [v82 addObjectsFromArray:v84];
  [v82 addObjectsFromArray:v83];
  [v82 removeObject:&__NSDictionary0__struct];
  int v66 = [v82 count];
  uint64_t v67 = CloudServicesLog(v66);
  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
  BOOL v69 = v43;
  int v70 = v68;
  if (v66)
  {
    uint64_t v12 = 0LL;
    uint64_t v7 = v80;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v71 = [v82 count];
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)v98 = v71;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Returning %d sorted records", buf, 8u);
    }

    v72 = v82;
  }

  else
  {
    id v77 = v69;
    uint64_t v12 = 0LL;
    uint64_t v7 = v80;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      sub_10004562C(v77, v70);
    }

    v72 = (id)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon tagStaleBottleRecords:suggestedBottles:]( v79,  "tagStaleBottleRecords:suggestedBottles:",  v77,  v10));
  }

  char v76 = v72;
  uint64_t v4 = v81;

LABEL_52:
  return v76;
}

void sub_10001B488(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = CloudServicesLog(v2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000456B0();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NSUbiquitousKeyValueStore synchronize succeeded",  v6,  2u);
  }
}

void sub_10001B820(id a1)
{
  dispatch_group_t v1 = dispatch_group_create();
  uint64_t v2 = (void *)qword_100078FB8;
  qword_100078FB8 = (uint64_t)v1;
}

void sub_10001B840(uint64_t a1, void *a2)
{
  id v3 = a2;
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  id v5 = _CloudServicesSignpostLogSystem();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_DWORD *)__int128 buf = 67240192;
    LODWORD(v32) = v3 == 0LL;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  v8,  "KVSSynchronize",  " CloudServicesSignpostNameKVSSynchronize=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameKVSSynchronize}d ",  buf,  8u);
  }

  id v9 = _CloudServicesSignpostLogSystem();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 56);
    *(_DWORD *)__int128 buf = 134218496;
    uint64_t v32 = v11;
    __int16 v33 = 2048;
    double v34 = Nanoseconds / 1000000000.0;
    __int16 v35 = 1026;
    BOOL v36 = v3 == 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: KVSSynchronize  CloudServicesSignpostNameKVSSynchronize=%{public,signpost.telemetry:number1,name=C loudServicesSignpostNameKVSSynchronize}d ",  buf,  0x1Cu);
  }

  uint64_t v12 = kdebug_trace(733021368LL, 0LL, 0LL, 0LL, 0LL);
  if (v3)
  {
    uint64_t v13 = CloudServicesLog(v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10004573C();
    }

    uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"KVS synchronizeWithCompletionHandler failed",  NSLocalizedDescriptionKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v3, NSUnderlyingErrorKey);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  32LL,  v15));
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001BBC4;
    block[3] = &unk_1000693D8;
    id v18 = *(id *)(a1 + 48);
    id v29 = v16;
    id v30 = v18;
    id v19 = v16;
    dispatch_async(v17, block);
  }

  else
  {
    id v20 = [*(id *)(a1 + 40) synchronize];
    if ((v20 & 1) == 0)
    {
      uint64_t v21 = CloudServicesLog(v20);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100045710();
      }
    }

    uint64_t v23 = CloudServicesLog(v20);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "calling handler on connection queue",  buf,  2u);
    }

    uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionQueue]);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10001BBD4;
    v26[3] = &unk_100069400;
    uint64_t v27 = (NSMutableDictionary *)*(id *)(a1 + 48);
    dispatch_async(v25, v26);

    uint64_t v15 = v27;
  }

  dispatch_group_leave((dispatch_group_t)qword_100078FB8);
}

uint64_t sub_10001BBC4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_10001BBD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10001BE04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_10001BE10(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
  else {
    return [*(id *)(a1 + 32) _getAccountInfoWithRequest:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
  }
}

LABEL_13:
  return v5;
}

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v14;
}

void sub_10001C400(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace(733020576LL, 0LL, 0LL, 0LL, 0LL);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_57:
          v72 = CloudServicesLog(v52);
          uint64_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
            v128 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudPassword]);
            uint64_t v129 = objc_claimAutoreleasedReturnValue([v6 iCloudIdentityData]);
            v130 = (void *)v129;
            id v131 = @"non-";
            if (v128) {
              int v132 = @"non-";
            }
            else {
              int v132 = &stru_10006AB28;
            }
            *(_DWORD *)__int128 buf = 138412802;
            *(void *)uint64_t v181 = v127;
            id v182 = v132;
            *(_WORD *)&v181[8] = 2112;
            if (!v129) {
              id v131 = &stru_10006AB28;
            }
            uint64_t v183 = 2112;
            uint64_t v184 = v131;
            _os_log_error_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_ERROR,  "attempted to store stingray identities, with invalid parameters: %@, %@nil iCloud password, %@nil iCloud identity data",  buf,  0x20u);
          }

          int v74 = objc_alloc(&OBJC_CLASS___NSString);
          v75 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
          char v76 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudPassword]);
          id v77 = objc_claimAutoreleasedReturnValue([v6 iCloudIdentityData]);
          char v78 = (void *)v77;
          v79 = @"non-";
          if (v76) {
            v80 = @"non-";
          }
          else {
            v80 = &stru_10006AB28;
          }
          if (!v77) {
            v79 = &stru_10006AB28;
          }
          uint64_t v53 = -[NSString initWithFormat:]( v74,  "initWithFormat:",  @"attempted to store stingray identities, with invalid parameters: %@, %@nil iCloud password, %@nil iCloud identity data",  v75,  v80,  v79);

          __int16 v81 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v81,  "setObject:forKeyedSubscript:",  v53,  NSLocalizedDescriptionKey);
          BOOL v69 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  4LL,  v81));
          ((void (*)(void *, id))v24[2])(v24, v69);
          goto LABEL_146;
        }
      }

      goto LABEL_57;
    }

    id v58 = -[SecureBackupDaemon forceICDP](self, "forceICDP");
    if (v58)
    {
      __int128 v59 = CloudServicesLog(v58);
      __int128 v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "FORCING ICDP + MULTIPLE ICSC", buf, 2u);
      }
    }

    __int128 v61 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
    if ([v61 length])
    {
    }

    else
    {
      __int128 v62 = [v6 useCachedPassphrase];

      if (v62)
      {
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedPassphrase](self, "cachedPassphrase"));
        [v6 setPassphrase:v63];

        v64 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
        uint64_t v65 = [v64 length] == 0;

        if (v65)
        {
          uint64_t v119 = CloudServicesLog(v66);
          uint64_t v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
            sub_100045930();
          }

          uint64_t v53 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v53,  "setObject:forKeyedSubscript:",  @"Missing cached passphrase",  NSLocalizedDescriptionKey);
          BOOL v69 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  9LL,  v53));
          ((void (*)(void *, id))v24[2])(v24, v69);
          goto LABEL_147;
        }
      }
    }

    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
    if ([v67 length])
    {
      if (!v158)
      {

        int v70 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
        uint64_t v53 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v70 dataUsingEncoding:4]);

        if (!v53)
        {
          uint64_t v105 = CloudServicesLog(v71);
          v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
            sub_100045988();
          }

          uint64_t v53 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v53,  "setObject:forKeyedSubscript:",  @"could not create backup bag password",  NSLocalizedDescriptionKey);
          BOOL v69 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v53));
          ((void (*)(void *, id))v24[2])(v24, v69);
          goto LABEL_147;
        }

        uint64_t v55 = 0LL;
        goto LABEL_52;
      }

      if ([v6 icdp])
      {

LABEL_48:
        v174 = 0LL;
        uint64_t v53 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon createiCloudRecoveryPasswordWithError:]( self,  "createiCloudRecoveryPasswordWithError:",  &v174));
        v68 = v174;
        BOOL v69 = v68;
        if (!v53)
        {
          ((void (*)(void *, id))v24[2])(v24, v68);
LABEL_148:

          goto LABEL_149;
        }

        uint64_t v55 = v68;
LABEL_52:
        if (([v6 usesMultipleiCSC] & 1) == 0)
        {
          id v57 = objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon _createBackupKeybagWithPassword:](self, "_createBackupKeybagWithPassword:", v53));
          if (!v57)
          {
            uint64_t v121 = CloudServicesLog(0LL);
            v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
              sub_10004595C();
            }

            __int16 v81 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v81,  "setObject:forKeyedSubscript:",  @"could not create backup keybag",  NSLocalizedDescriptionKey);
            BOOL v69 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  20LL,  v81));

            ((void (*)(void *, id))v24[2])(v24, v69);
            goto LABEL_146;
          }

          uint64_t v56 = 0LL;
          goto LABEL_77;
        }

        uint64_t v56 = 0LL;
LABEL_76:
        id v57 = 0LL;
LABEL_77:
        uint64_t v150 = 0LL;
LABEL_78:
        uint64_t v155 = (void *)v57;
        uint64_t v151 = (NSMutableDictionary *)v56;
        unsigned int v153 = (void *)objc_claimAutoreleasedReturnValue(+[CSDateUtilities posixDateFormatter](&OBJC_CLASS___CSDateUtilities, "posixDateFormatter"));
        uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        v157 = (void *)objc_claimAutoreleasedReturnValue([v153 stringFromDate:v88]);

        v149 = kSecureBackupTimestampKey;
        objc_msgSend(v165, "setObject:forKeyedSubscript:", v157);
        if (v164)
        {
          [v164 setObject:v157 forKeyedSubscript:kSecureBackupMetadataTimestampKey];
          [v165 setObject:v164 forKeyedSubscript:kSecureBackupClientMetadataKey];
        }

        if (!v158)
        {
          [v165 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupUsesMultipleiCSCKey];
          v166 = v55;
          id v95 = -[SecureBackupDaemon registerSingleRecoverySecret:iCDP:error:]( self,  "registerSingleRecoverySecret:iCDP:error:",  v155,  0LL,  &v166);
          BOOL v69 = v166;

          if ((v95 & 1) != 0)
          {
            -[SecureBackupDaemon _setUsesEscrow:](self, "_setUsesEscrow:", 0LL);
            -[SecureBackupDaemon _setMetadata:](self, "_setMetadata:", v165);
            uint64_t v97 = sub_10000545C();
            v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
            v99 = v98 == 0LL;

            if (v99)
            {
              v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
              v101 = (void *)objc_claimAutoreleasedReturnValue([v100 UUIDString]);
              sub_1000054A4(v101);
            }

            -[SecureBackupDaemon _setKVSKeybag:](self, "_setKVSKeybag:", v155);
            -[SecureBackupDaemon _removeProtectedKeychain](self, "_removeProtectedKeychain");
            -[SecureBackupDaemon _setBackupEnabled:iCDP:]( self,  "_setBackupEnabled:iCDP:",  1,  [v6 icdp]);
            if ([v6 synchronize])
            {
              -[SecureBackupDaemon _setAutobackupEnabledWithReply:](self, "_setAutobackupEnabledWithReply:", v24);
            }

            else
            {
              -[SecureBackupDaemon _setAutobackupEnabled](self, "_setAutobackupEnabled");
              ((void (*)(void *, id))v24[2])(v24, v69);
            }
          }

          else
          {
            uint64_t v102 = CloudServicesLog(v96);
            unsigned int v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
            if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
              sub_1000458D0();
            }

            v160 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v160,  "setObject:forKeyedSubscript:",  v69,  NSUnderlyingErrorKey);
            id v104 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  20LL,  v160));

            ((void (*)(void *, uint64_t))v24[2])(v24, v104);
            BOOL v69 = (id)v104;
          }

          goto LABEL_133;
        }

        id v89 = objc_alloc(&OBJC_CLASS___EscrowService);
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
        uint64_t v159 = -[EscrowService initWithOperationsLogger:](v89, "initWithOperationsLogger:", v90);

        id v91 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
        if (v91)
        {
          v92 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
          v173 = v55;
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon normalizeSMSTarget:error:](self, "normalizeSMSTarget:error:", v92, &v173));
          BOOL v69 = v173;

          [v6 setSmsTarget:v93];
          id v94 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
          LODWORD(v92) = v94 == 0LL;

          if ((_DWORD)v92)
          {
            ((void (*)(void *, id))v24[2])(v24, v69);
LABEL_132:

LABEL_133:
            __int16 v81 = v53;
            uint64_t v53 = v151;
LABEL_146:

LABEL_147:
            goto LABEL_148;
          }
        }

        else
        {
          BOOL v69 = v55;
        }

        if ([v6 stingray])
        {
          v107 = v69;
        }

        else
        {
          id v116 = [v6 usesMultipleiCSC];
          if ((_DWORD)v116)
          {
            id v117 = CloudServicesLog(v116);
            id v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
              sub_100045870();
            }

            uint64_t v108 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  &__NSDictionary0__struct));
            ((void (*)(void *, NSMutableDictionary *))v24[2])(v24, v108);
            goto LABEL_131;
          }

          [v165 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupUsesMultipleiCSCKey];
          v123 = [v6 icdp];
          uint64_t v172 = v69;
          v124 = -[SecureBackupDaemon registerSingleRecoverySecret:iCDP:error:]( self,  "registerSingleRecoverySecret:iCDP:error:",  v155,  v123,  &v172);
          v107 = v172;

          if ((v124 & 1) == 0)
          {
            uint64_t v133 = CloudServicesLog(v125);
            v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
            if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR)) {
              sub_1000458D0();
            }

            uint64_t v108 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v108,  "setObject:forKeyedSubscript:",  @"SOSCCRegisterSingleRecoverySecret() failed",  NSLocalizedDescriptionKey);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v108,  "setObject:forKeyedSubscript:",  v107,  NSUnderlyingErrorKey);
            BOOL v69 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  20LL,  v108));

            ((void (*)(void *, id))v24[2])(v24, v69);
            goto LABEL_131;
          }

          uint64_t v126 = objc_claimAutoreleasedReturnValue([v155 sha1Digest]);

          [v165 setObject:v126 forKeyedSubscript:kSecureBackupKeybagDigestKey];
          uint64_t v151 = (NSMutableDictionary *)v126;
        }

        uint64_t v108 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
        v109 = [v6 guitarfish];
        if (v109) {
          uint64_t v110 = v150;
        }
        else {
          uint64_t v110 = v151;
        }
        v111 = &kSecureBackupKeybagSHA256Key;
        if (!v109) {
          v111 = &kSecureBackupKeybagDigestKey;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v108, "setObject:forKeyedSubscript:", v110, *v111);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v108,  "setObject:forKeyedSubscript:",  v53,  kSecureBackupBagPasswordKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v108,  "setObject:forKeyedSubscript:",  @"1",  @"BackupVersion");
        -[NSMutableDictionary setObject:forKeyedSubscript:](v108, "setObject:forKeyedSubscript:", v157, v149);
        [v6 setEscrowRecord:v108];
        [v6 setMetadata:v165];
        [v6 setEncodedMetadata:v163];
        [v6 setDuplicateEncodedMetadata:v162];
        id v112 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedMetadata]);

        if (v112)
        {
          v114 = CloudServicesLog(v113);
          v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_DEFAULT,  "enableWithInfo(): beginning an update request",  buf,  2u);
          }
        }

        v167[0] = _NSConcreteStackBlock;
        v167[1] = 3221225472LL;
        v167[2] = sub_10001DE14;
        v167[3] = &unk_1000694F0;
        v167[4] = self;
        v168 = v6;
        v169 = v165;
        uint64_t v170 = v155;
        v171 = v24;
        -[EscrowService storeRecordWithRequest:completionBlock:]( v159,  "storeRecordWithRequest:completionBlock:",  v168,  v167);

        BOOL v69 = v107;
LABEL_131:

        goto LABEL_132;
      }

      int v82 = (void *)objc_claimAutoreleasedReturnValue([v6 countryDialCode]);
      if ([v82 length])
      {
        __int16 v83 = (void *)objc_claimAutoreleasedReturnValue([v6 countryCode]);
        if ([v83 length])
        {
          v156 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
          if ([v156 length])
          {
            uint64_t v154 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
            if ([v154 length])
            {
              int v84 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudPassword]);
              v152 = [v84 length] == 0;

              if (!v152) {
                goto LABEL_48;
              }
LABEL_139:
              BOOL v135 = CloudServicesLog(v85);
              uint64_t v136 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
              if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
              {
                unsigned int v161 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
                if (v161) {
                  uint64_t v144 = @"non-";
                }
                else {
                  uint64_t v144 = &stru_10006AB28;
                }
                v145 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
                v146 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 appleID]);
                id v147 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudPassword]);
                uint64_t v148 = @"non-";
                if (!v147) {
                  uint64_t v148 = &stru_10006AB28;
                }
                *(_DWORD *)__int128 buf = 138413058;
                *(void *)uint64_t v181 = v144;
                *(_WORD *)&v181[8] = 2112;
                id v182 = v145;
                uint64_t v183 = 2112;
                uint64_t v184 = v146;
                id v185 = 2112;
                v186 = v148;
                _os_log_error_impl( (void *)&_mh_execute_header,  v136,  OS_LOG_TYPE_ERROR,  "attempted to enable backup, with invalid parameters: %@nil recovery password, %@, %@, %@nil iCloud password",  buf,  0x2Au);
              }

              v137 = objc_alloc(&OBJC_CLASS___NSString);
              v138 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
              if (v138) {
                v139 = @"non-";
              }
              else {
                v139 = &stru_10006AB28;
              }
              uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
              v141 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
              v142 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudPassword]);
              id v143 = @"non-";
              if (!v142) {
                id v143 = &stru_10006AB28;
              }
              uint64_t v53 = -[NSString initWithFormat:]( v137,  "initWithFormat:",  @"attempted to enable backup, with invalid parameters: %@nil recovery password, %@, %@, %@nil iCloud password",  v139,  v140,  v141,  v143);

              __int16 v81 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v81,  "setObject:forKeyedSubscript:",  v53,  NSLocalizedDescriptionKey);
              BOOL v69 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  4LL,  v81));
              ((void (*)(void *, id))v24[2])(v24, v69);
              goto LABEL_146;
            }
          }
        }
      }
    }

    goto LABEL_139;
  }

  os_signpost_id_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  0LL));
  (*((void (**)(id, void *))v7 + 2))(v7, v8);

LABEL_150:
}

void sub_10001DA34(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    uint64_t v4 = CloudServicesLog(v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v3 callStackSymbols]);
      sub_100045828();
    }

    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v7,  NSLocalizedDescriptionKey);

    os_signpost_id_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 reason]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v8,  NSLocalizedFailureReasonErrorKey);

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v6));
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);

    objc_end_catch();
    JUMPOUT(0x10001D8F8LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_10001DBF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  id v5 = _CloudServicesSignpostLogSystem();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v3 domain]);
    uint64_t v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (const __CFString *)v9;
    }
    else {
      uint64_t v11 = &stru_10006AB28;
    }
    int v22 = 138543618;
    uint64_t v23 = v11;
    __int16 v24 = 1026;
    LODWORD(v25) = [v3 code];
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  v8,  "EnableWithRequest",  " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ",  (uint8_t *)&v22,  0x12u);
  }

  id v12 = _CloudServicesSignpostLogSystem();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(const __CFString **)(a1 + 56);
    double v15 = Nanoseconds / 1000000000.0;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v3 domain]);
    uint64_t v17 = (void *)v16;
    if (v16) {
      id v18 = (const __CFString *)v16;
    }
    else {
      id v18 = &stru_10006AB28;
    }
    unsigned int v19 = [v3 code];
    int v22 = 134218754;
    uint64_t v23 = v14;
    __int16 v24 = 2048;
    double v25 = v15;
    __int16 v26 = 2114;
    uint64_t v27 = v18;
    __int16 v28 = 1026;
    unsigned int v29 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: EnableWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{pub lic,signpost.telemetry:number2,name=Error}d ",  (uint8_t *)&v22,  0x26u);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) operationsLogger]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) endEventWithResults:&__NSDictionary0__struct error:v3]);
  [v20 updateStoreWithEvent:v21];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

id sub_10001DE14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleEscrowStoreResults:a2 escrowError:a3 request:*(void *)(a1 + 40) peerID:0 newRecordMetadata:*(void *)(a1 + 48) backupKeybag:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

void sub_10001E6E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001E71C(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_respondsToSelector();
  if ((v7 & 1) != 0)
  {
    id v8 = [v6 count];
    uint64_t v9 = CloudServicesLog(v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = "s";
      int v13 = 138412802;
      id v14 = v5;
      if (v8 == (id)1) {
        uint64_t v11 = "";
      }
      __int16 v15 = 2048;
      id v16 = v8;
      __int16 v17 = 2080;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: %ld item%s", (uint8_t *)&v13, 0x20u);
    }
  }

  else
  {
    uint64_t v12 = CloudServicesLog(v7);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100045AB4();
    }
  }
}

void sub_10001E854(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  uint64_t v5 = CloudServicesAnalyticsRestoreBackupName;
  uint64_t v6 = *(void *)(a1 + 32);
  id v18 = @"view";
  uint64_t v19 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  [v4 logResultForEvent:v5 hardFailure:1 result:v3 withAttributes:v7];

  uint64_t v9 = CloudServicesLog(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (NSMutableDictionary *)v10;
  if (v3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100045B14();
    }

    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v3, NSUnderlyingErrorKey);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  19LL,  v11));
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }

  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = 138412290;
    uint64_t v17 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "SecItemBackupRestore for view %@ succeeded",  (uint8_t *)&v16,  0xCu);
  }
}

void sub_10001EB98(id a1)
{
  dispatch_group_t v1 = (void *)qword_100078FC0;
  qword_100078FC0 = (uint64_t)&off_10006DBA0;

  id v4 = (id)objc_claimAutoreleasedReturnValue([&off_10006DBA0 allKeys]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
  id v3 = (void *)qword_100078FC8;
  qword_100078FC8 = v2;
}

void sub_10001F078( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10001F090(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentViews]);
  uint64_t v3 = CloudServicesLog(v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v54 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "currentViews: %@", buf, 0xCu);
  }

  uint64_t v6 = CloudServicesLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) hexString]);
    *(_DWORD *)__int128 buf = 138412290;
    id v54 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "restoring view-based backup for keybag digest %@",  buf,  0xCu);
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v9 = v2;
  id v10 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v47;
    *(void *)&__int128 v11 = 138412290LL;
    __int128 v45 = v11;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        int v16 = objc_autoreleasePoolPush();
        id v17 = [*(id *)(a1 + 48) containsObject:v15];
        if ((_DWORD)v17)
        {
          uint64_t v18 = CloudServicesLog(v17);
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = v45;
            id v54 = v15;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "skipping %@", buf, 0xCu);
          }
        }

        else
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= [*(id *)(a1 + 32) _restoreView:v15 password:*(void *)(a1 + 56) keybagD igest:*(void *)(a1 + 40) restoredViews:*(void *)(a1 + 64) error:0];
        }

        objc_autoreleasePoolPop(v16);
      }

      id v12 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }

    while (v12);
  }

  uint64_t v21 = CloudServicesLog(v20);
  int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void **)(a1 + 64);
    *(_DWORD *)__int128 buf = 138412290;
    id v54 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "restoredViews (async): %@", buf, 0xCu);
  }

  uint64_t v24 = sub_1000052A8();
  if ((_DWORD)v24)
  {
    double v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) encodedStatsForViews:*(void *)(a1 + 64)]);
    [v25 setObject:v26 forKeyedSubscript:@"views"];

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v27 logSoftFailureForEventNamed:CloudServicesSOSRestoreMetrics withAttributes:v25];
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL))
  {
    [*(id *)(a1 + 32) setNeedInitialBackup:1];
    __int16 v28 = *(void **)(a1 + 32);
    unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 circleChangedNotification]);
    [v28 registerForNotifyEvent:v29];
LABEL_41:

    goto LABEL_42;
  }

  uint64_t v30 = CloudServicesLog(v24);
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_100045C3C();
  }

  if (*(void *)(a1 + 72))
  {
    unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _getProtectedKeychainAndKeybagDigestFromKVS:0]);
    if (!v29)
    {
      uint64_t v33 = CloudServicesLog(0LL);
      double v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_100045C10();
      }
    }

    uint64_t v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "derDataFromDict:", v29, v45, (void)v46));
    BOOL v36 = (void *)v35;
    if (v35)
    {
      uint64_t v37 = CloudServicesLog(v35);
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "restoring legacy backup", buf, 2u);
      }
    }

    else
    {
      NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
      uint64_t v51 = @"could not create DER data from dict";
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
      id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  19LL,  v38));
      uint64_t v43 = CloudServicesLog(v42);
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_100045BB0();
      }
    }

    goto LABEL_41;
  }

  int v39 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v40 = CloudServicesLog(v32);
  uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  unsigned int v29 = v41;
  if (!v39)
  {
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100045B84();
    }
    goto LABEL_41;
  }

  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Having a bottled peer, so skipping SOS restore on this device",  buf,  2u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
LABEL_42:
}

void sub_10001F998( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void sub_10001F9E8(void *a1)
{
  uint64_t v3 = a1 + 8;
  uint64_t v2 = a1[8];
  id v4 = (void *)a1[4];
  uint64_t v5 = *(v3 - 3);
  uint64_t v6 = *(v3 - 2);
  uint64_t v7 = *(void *)(*(void *)(*(v3 - 1) + 8LL) + 40LL);
  uint64_t v8 = *(void *)(v2 + 8);
  id obj = *(id *)(v8 + 40);
  unsigned __int8 v9 = [v4 _restoreView:@"iCloudIdentity" password:v5 keybagDigest:v6 restoredViews:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if ((v9 & 1) != 0)
  {
    *(_BYTE *)(*(void *)(a1[9] + 8LL) + 24LL) = 1;
    __int128 v11 = (void *)a1[4];
    uint64_t v12 = a1[5];
    uint64_t v13 = a1[6];
    uint64_t v14 = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
    uint64_t v15 = *(void *)(a1[8] + 8LL);
    id v21 = *(id *)(v15 + 40);
    unsigned __int8 v16 = [v11 _restoreView:@"PCS-MasterKey" password:v12 keybagDigest:v13 restoredViews:v14 error:&v21];
    objc_storeStrong((id *)(v15 + 40), v21);
    if ((v16 & 1) != 0) {
      return;
    }
    uint64_t v18 = CloudServicesLog(v17);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100045CD0();
    }
  }

  else
  {
    uint64_t v20 = CloudServicesLog(v10);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100045D30();
    }
  }
}

void sub_10001FB04(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentViews]);
  id v3 = [v2 mutableCopy];

  [v3 removeObject:@"iCloudIdentity"];
  uint64_t v4 = CloudServicesLog([v3 removeObject:@"PCS-MasterKey"]);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v27 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remaining views to restore: %@", buf, 0xCu);
  }

  uint64_t v7 = CloudServicesLog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) hexString]);
    *(_DWORD *)__int128 buf = 138412290;
    id v27 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "restoring view-based backup for keybag digest %@",  buf,  0xCu);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v14);
        unsigned __int8 v16 = objc_autoreleasePoolPush();
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= objc_msgSend( *(id *)(a1 + 32),  "_restoreView:password:keybagDig est:restoredViews:error:",  v15,  *(void *)(a1 + 48),  *(void *)(a1 + 40),  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40),  0,  (void)v21);
        objc_autoreleasePoolPop(v16);
        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v12);
  }

  uint64_t v18 = CloudServicesLog(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    *(_DWORD *)__int128 buf = 138412290;
    id v27 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "restoredViews (async): %@", buf, 0xCu);
  }
}

void sub_10001FE1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"keybag"]);
    unsigned __int8 v9 = v8;
    if (v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s backupKeyDigests](v8, "backupKeyDigests"));
      if (![v10 count])
      {
        uint64_t v11 = CloudServicesLog(0LL);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          id v16 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "backups (%@): keybag contains no backup key digests",  (uint8_t *)&v15,  0xCu);
        }
      }

      [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v5];
    }

    else
    {
      uint64_t v14 = CloudServicesLog(0LL);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "backups (%@): missing keybag",  (uint8_t *)&v15,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v13 = CloudServicesLog(0LL);
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "backups (%@): missing keychain",  (uint8_t *)&v15,  0xCu);
    }
  }
}

void sub_100020124(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = CloudServicesLog(v6);
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100045DE8();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v10 = objc_autoreleasePoolPush();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSecureBackupiCDPRecordsKey]);
    if ([v11 count])
    {
      context = v10;
      id v36 = v5;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      double v34 = v11;
      id v12 = v11;
      id v13 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v38;
        uint64_t v16 = kSecureBackupRecordIDKey;
        while (2)
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v38 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v16, v34));
            if (v19)
            {
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedRecordID]);
              unsigned int v21 = [v20 isEqualToString:v19];

              if (v21)
              {
                __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:kSecureBackupEscrowDateKey]);
                uint64_t v27 = CloudServicesLog(v26);
                __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue( +[CSDateUtilities localStringFromDate:]( &OBJC_CLASS___CSDateUtilities,  "localStringFromDate:",  v26));
                  *(_DWORD *)__int128 buf = 138412546;
                  id v42 = v19;
                  __int16 v43 = 2112;
                  uint64_t v44 = v29;
                  _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "found preferred record: %@ from %@",  buf,  0x16u);
                }

                uint64_t v30 = *(void *)(a1 + 48);
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:kEscrowServiceRecordMetadataKey]);
                (*(void (**)(uint64_t, void *, void *, void))(v30 + 16))( v30,  v19,  v31,  *(void *)(a1 + 56));

                objc_autoreleasePoolPop(context);
                uint64_t v7 = 0LL;
                id v5 = v36;
                goto LABEL_31;
              }
            }
          }

          id v14 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) secureBackups]);
      if ([v22 count])
      {
        uint64_t v11 = v34;
        id v10 = context;
        else {
          id v23 = 0LL;
        }
        uint64_t v7 = 0LL;
        objc_msgSend( v22,  "recordIDAndClientMetadataForSilentAttemptFromRecords:passphraseLength:platform:sosCompatibilityModeEnabled:reply:",  v12,  *(void *)(a1 + 56),  *(unsigned int *)(a1 + 64),  v23,  *(void *)(a1 + 48),  v34);
        id v5 = v36;
      }

      else
      {
        uint64_t v32 = CloudServicesLog(0LL);
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        uint64_t v11 = v34;
        id v10 = context;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_100045DBC();
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        uint64_t v7 = 0LL;
        id v5 = v36;
      }
    }

    else
    {
      uint64_t v24 = CloudServicesLog(0LL);
      double v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100045D90();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }

    objc_autoreleasePoolPop(v10);
  }

LABEL_31:
}
}

    (*((void (**)(id, void, __CFString *))v9 + 2))(v9, 0LL, v12);
LABEL_39:

    goto LABEL_40;
  }

  id v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  kEscrowServiceErrorDomain,  126LL,  @"Unexpected error with missing certificate"));
  id v13 = CloudServicesLog(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v52 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Certificate encoding error: %@", buf, 0xCu);
  }

  (*((void (**)(id, void, __CFString *))v9 + 2))(v9, 0LL, v12);
LABEL_40:
}

void sub_100021060(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v8 = a2;
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(v6, v7);
  id v10 = _CloudServicesSignpostLogSystem();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 56);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[__CFString domain](v5, "domain"));
    uint64_t v15 = (void *)v14;
    if (v14) {
      uint64_t v16 = (const __CFString *)v14;
    }
    else {
      uint64_t v16 = &stru_10006AB28;
    }
    *(_DWORD *)__int128 buf = 138543618;
    id v189 = v16;
    __int16 v190 = 1026;
    LODWORD(v191) = -[__CFString code](v5, "code");
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  v13,  "RecoverRecordWithRequest",  " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x12u);
  }

  id v17 = _CloudServicesSignpostLogSystem();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(const __CFString **)(a1 + 56);
    double v20 = Nanoseconds / 1000000000.0;
    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[__CFString domain](v5, "domain"));
    __int128 v22 = (void *)v21;
    if (v21) {
      id v23 = (const __CFString *)v21;
    }
    else {
      id v23 = &stru_10006AB28;
    }
    unsigned int v24 = -[__CFString code](v5, "code");
    *(_DWORD *)__int128 buf = 134218754;
    id v189 = v19;
    __int16 v190 = 2048;
    double v191 = v20;
    __int16 v192 = 2114;
    *(void *)uint64_t v193 = v23;
    *(_WORD *)&v193[8] = 1026;
    *(_DWORD *)&v193[10] = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverRecordWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Erro r=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x26u);
  }

  id v25 = [v8 mutableCopy];
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  [v26 logResultForEvent:CloudServicesRecoverEscrowWithRequest hardFailure:1 result:v5];

  id v27 = [*(id *)(a1 + 32) uncacheRecordIDPassphrase];
  if (!v5)
  {
    id v36 = [*(id *)(a1 + 40) silent];
    int v37 = (int)v36;
    uint64_t v38 = CloudServicesLog(v36);
    __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (!v40) {
        goto LABEL_24;
      }
      uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recordID]);
      *(_DWORD *)__int128 buf = 138412290;
      id v189 = v41;
      id v42 = "silent attempt succeeded for record ID %@";
    }

    else
    {
      if (!v40) {
        goto LABEL_24;
      }
      uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recordID]);
      *(_DWORD *)__int128 buf = 138412290;
      id v189 = v41;
      id v42 = "recovery attempt succeeded for record ID %@";
    }

    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);

LABEL_24:
    __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:kEscrowServiceRecordDataKey]);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recordID]);
    if (v44) {
      __int128 v45 = 0LL;
    }
    else {
      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _KVSKeybag]);
    }

    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recordID]);
    if (v47) {
      __int128 v48 = 0LL;
    }
    else {
      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v45 sha1Digest]);
    }

    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:kSecureBackupKeybagDigestKey]);
    v178 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:kSecureBackupBagPasswordKey]);
    id v182 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"BackupVersion"]);
    uint64_t v181 = (__CFString *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:kSecureBackupTimestampKey]);
    if (_os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn")
      && (id v50 = [*(id *)(a1 + 40) sosCompatibleEscrowSorting], (v50 & 1) != 0))
    {
      uint64_t v179 = 0LL;
      v180 = 0LL;
      char v51 = 1;
    }

    else
    {
      id v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) metadata]);
      v180 = (__CFString *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:kSecureBackupBottleIDKey]);

      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) metadata]);
      uint64_t v179 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:kSecureBackupBottleValidityKey]);

      char v51 = 0;
    }

    uint64_t v54 = CloudServicesLog(v50);
    uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) metadata]);
      *(_DWORD *)__int128 buf = 138413058;
      id v189 = v181;
      __int16 v190 = 2112;
      double v191 = *(double *)&v182;
      __int16 v192 = 2112;
      *(void *)uint64_t v193 = v49;
      *(_WORD *)&v193[8] = 2112;
      *(void *)&v193[10] = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "=== Escrow record ===\nTime of escrow: %@\nEscrow version: %@\nKeybag digest: %@\nMetadata: %@",  buf,  0x2Au);
    }

    id v57 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"BottledPeerEntropy"]);
    id v58 = [v182 isEqualToString:@"1"];
    if ((v58 & 1) != 0)
    {
      __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) recordID]);
      if (v59)
      {

LABEL_59:
        if ((v51 & 1) == 0)
        {
          if (v57
            && v180
            && (id v60 = [v179 isEqualToString:kSecureBackupRecordStatusValid], (_DWORD)v60))
          {
            uint64_t v88 = CloudServicesLog(v60);
            id v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              id v90 = [v57 length];
              *(_DWORD *)__int128 buf = 138413058;
              id v189 = v180;
              __int16 v190 = 2112;
              double v191 = *(double *)&v179;
              __int16 v192 = 1024;
              *(_DWORD *)uint64_t v193 = 1;
              *(_WORD *)&v193[4] = 2048;
              *(void *)&v193[6] = v90;
              _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "adding bottleID:%@ and validity:%@ to results; entropy present: %d (%llu bytes)",
                buf,
                0x26u);
            }

            [v25 setObject:v180 forKeyedSubscript:kSecureBackupBottleIDKey];
            id v60 = [v25 setObject:v179 forKeyedSubscript:kSecureBackupBottleValidityKey];
          }

          else
          {
            uint64_t v91 = CloudServicesLog(v60);
            v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              id v93 = [v57 length];
              *(_DWORD *)__int128 buf = 138413058;
              id v189 = v180;
              __int16 v190 = 2112;
              double v191 = *(double *)&v179;
              __int16 v192 = 1024;
              *(_DWORD *)uint64_t v193 = v57 != 0LL;
              *(_WORD *)&v193[4] = 2048;
              *(void *)&v193[6] = v93;
              _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "skipping setting bottle; bottleID:%@ validity:%@ entropy present: %d (%llu bytes)",
                buf,
                0x26u);
            }
          }
        }

        if (OctagonPlatformSupportsSOS(v60))
        {
          id v175 = v25;
          id v94 = v57;
          id v95 = *(void **)(a1 + 32);
          id v183 = 0LL;
          unsigned __int8 v96 = [v95 _restoreKeychainWithBackupPassword:v178 keybagDigest:v49 error:&v183];
          id v97 = v183;
          v98 = v97;
          if ((v96 & 1) == 0)
          {
            uint64_t v99 = CloudServicesLog(v97);
            v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
            if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
              sub_100045E48();
            }
          }

          v101 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
          [v101 logResultForEvent:CloudServicesAnalyticsRestoreKeychainWithBackupBag hardFailure:1 result:v98];

          id v57 = v94;
          id v25 = v175;
        }

        double v102 = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
        id v103 = _CloudServicesSignpostLogSystem();
        id v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
        uint64_t v105 = v104;
        os_signpost_id_t v106 = *(void *)(a1 + 72);
        if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v104))
        {
          uint64_t v107 = objc_claimAutoreleasedReturnValue([0 domain]);
          uint64_t v176 = v45;
          uint64_t v108 = v48;
          v109 = v43;
          id v110 = v25;
          v111 = v57;
          id v112 = (void *)v107;
          uint64_t v113 = v49;
          if (v107) {
            v114 = (const __CFString *)v107;
          }
          else {
            v114 = &stru_10006AB28;
          }
          unsigned int v115 = [0 code];
          *(_DWORD *)__int128 buf = 138543618;
          id v189 = v114;
          __int128 v49 = v113;
          __int16 v190 = 1026;
          LODWORD(v191) = v115;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v105,  OS_SIGNPOST_INTERVAL_END,  v106,  "RecoverEscrowWithRequest",  " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:numbe r2,name=Error}d ",  buf,  0x12u);

          id v57 = v111;
          id v25 = v110;
          __int16 v43 = v109;
          __int128 v48 = v108;
          __int128 v45 = v176;
        }

        id v116 = _CloudServicesSignpostLogSystem();
        id v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          id v118 = v49;
          uint64_t v119 = *(const __CFString **)(a1 + 72);
          double v120 = v102 / 1000000000.0;
          uint64_t v121 = objc_claimAutoreleasedReturnValue([0 domain]);
          v177 = v45;
          v122 = v48;
          v123 = v43;
          id v124 = v25;
          v125 = v57;
          uint64_t v126 = (void *)v121;
          if (v121) {
            uint64_t v127 = (const __CFString *)v121;
          }
          else {
            uint64_t v127 = &stru_10006AB28;
          }
          unsigned int v128 = [0 code];
          *(_DWORD *)__int128 buf = 134218754;
          id v189 = v119;
          __int128 v49 = v118;
          __int16 v190 = 2048;
          double v191 = v120;
          __int16 v192 = 2114;
          *(void *)uint64_t v193 = v127;
          *(_WORD *)&v193[8] = 1026;
          *(_DWORD *)&v193[10] = v128;
          _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverEscrowWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@ Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x26u);

          id v57 = v125;
          id v25 = v124;
          __int16 v43 = v123;
          __int128 v48 = v122;
          __int128 v45 = v177;
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        id v5 = 0LL;
        goto LABEL_87;
      }

      id v60 = [v49 isEqual:v48];
      v173 = v48;
      v174 = v45;
      uint64_t v130 = CloudServicesLog(v60);
      id v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
        sub_100045EA8();
      }

      NSErrorUserInfoKey v184 = NSLocalizedDescriptionKey;
      id v185 = @"backup keybag digest does not match version in escrow";
      uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v185,  &v184,  1LL));
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  21LL,  v63));
      double v132 = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
      id v133 = _CloudServicesSignpostLogSystem();
      v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
      BOOL v135 = v134;
      os_signpost_id_t v136 = *(void *)(a1 + 72);
      if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
      {
        uint64_t v137 = objc_claimAutoreleasedReturnValue(-[__CFString domain](v5, "domain"));
        uint64_t v172 = v43;
        id v138 = v25;
        v139 = v57;
        uint64_t v140 = (void *)v137;
        v141 = v49;
        if (v137) {
          v142 = (const __CFString *)v137;
        }
        else {
          v142 = &stru_10006AB28;
        }
        unsigned int v143 = -[__CFString code](v5, "code");
        *(_DWORD *)__int128 buf = 138543618;
        id v189 = v142;
        __int128 v49 = v141;
        __int16 v190 = 1026;
        LODWORD(v191) = v143;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v135,  OS_SIGNPOST_INTERVAL_END,  v136,  "RecoverEscrowWithRequest",  " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x12u);

        id v57 = v139;
        id v25 = v138;
        __int16 v43 = v172;
      }

      id v144 = _CloudServicesSignpostLogSystem();
      id v77 = (void *)objc_claimAutoreleasedReturnValue(v144);
      if (!os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_DEFAULT))
      {
LABEL_55:

        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        __int128 v48 = v173;
        __int128 v45 = v174;
LABEL_87:

        goto LABEL_118;
      }

      v145 = v49;
      v146 = *(const __CFString **)(a1 + 72);
      double v147 = v132 / 1000000000.0;
      uint64_t v148 = objc_claimAutoreleasedReturnValue(-[__CFString domain](v5, "domain"));
      v171 = v43;
      id v82 = v25;
      __int16 v83 = v57;
      int v84 = (void *)v148;
      if (v148) {
        v149 = (const __CFString *)v148;
      }
      else {
        v149 = &stru_10006AB28;
      }
      unsigned int v150 = -[__CFString code](v5, "code");
      *(_DWORD *)__int128 buf = 134218754;
      id v189 = v146;
      __int128 v49 = v145;
      __int16 v190 = 2048;
      double v191 = v147;
      __int16 v192 = 2114;
      *(void *)uint64_t v193 = v149;
      *(_WORD *)&v193[8] = 1026;
      *(_DWORD *)&v193[10] = v150;
    }

    else
    {
      v173 = v48;
      v174 = v45;
      uint64_t v61 = CloudServicesLog(v58);
      __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "backup data version does not match version in escrow",  buf,  2u);
      }

      NSErrorUserInfoKey v186 = NSLocalizedDescriptionKey;
      v187 = @"backup data version does not match version in escrow";
      uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v187,  &v186,  1LL));
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  3LL,  v63));
      double v64 = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
      id v65 = _CloudServicesSignpostLogSystem();
      int v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      uint64_t v67 = v66;
      os_signpost_id_t v68 = *(void *)(a1 + 72);
      if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
      {
        uint64_t v69 = objc_claimAutoreleasedReturnValue(-[__CFString domain](v5, "domain"));
        uint64_t v170 = v43;
        id v70 = v25;
        uint64_t v71 = v57;
        v72 = (void *)v69;
        uint64_t v73 = v49;
        if (v69) {
          int v74 = (const __CFString *)v69;
        }
        else {
          int v74 = &stru_10006AB28;
        }
        unsigned int v75 = -[__CFString code](v5, "code");
        *(_DWORD *)__int128 buf = 138543618;
        id v189 = v74;
        __int128 v49 = v73;
        __int16 v190 = 1026;
        LODWORD(v191) = v75;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v67,  OS_SIGNPOST_INTERVAL_END,  v68,  "RecoverEscrowWithRequest",  " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x12u);

        id v57 = v71;
        id v25 = v70;
        __int16 v43 = v170;
      }

      id v76 = _CloudServicesSignpostLogSystem();
      id v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
      if (!os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_55;
      }
      char v78 = v49;
      v79 = *(const __CFString **)(a1 + 72);
      double v80 = v64 / 1000000000.0;
      uint64_t v81 = objc_claimAutoreleasedReturnValue(-[__CFString domain](v5, "domain"));
      v171 = v43;
      id v82 = v25;
      __int16 v83 = v57;
      int v84 = (void *)v81;
      if (v81) {
        uint64_t v85 = (const __CFString *)v81;
      }
      else {
        uint64_t v85 = &stru_10006AB28;
      }
      unsigned int v86 = -[__CFString code](v5, "code");
      *(_DWORD *)__int128 buf = 134218754;
      id v189 = v79;
      __int128 v49 = v78;
      __int16 v190 = 2048;
      double v191 = v80;
      __int16 v192 = 2114;
      *(void *)uint64_t v193 = v85;
      *(_WORD *)&v193[8] = 1026;
      *(_DWORD *)&v193[10] = v86;
    }

    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v77,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverEscrowWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Erro r=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x26u);

    id v57 = v83;
    id v25 = v82;
    __int16 v43 = v171;
    goto LABEL_55;
  }

  uint64_t v28 = CloudServicesLog(v27);
  unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v189 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "escrowService recoverRecordWithRequest: returned: %@",  buf,  0xCu);
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString domain](v5, "domain"));
  unsigned int v31 = [v30 isEqualToString:kEscrowServiceErrorDomain];

  if (!v31) {
    goto LABEL_106;
  }
  if (-[__CFString code](v5, "code") == (id)-4005LL)
  {
    uint64_t v32 = kSecureBackupErrorDomain;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString userInfo](v5, "userInfo"));
    uint64_t v34 = v32;
    uint64_t v35 = 25LL;
  }

  else if (-[__CFString code](v5, "code") == (id)-6015LL)
  {
    uint64_t v46 = kSecureBackupErrorDomain;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString userInfo](v5, "userInfo"));
    uint64_t v34 = v46;
    uint64_t v35 = 26LL;
  }

  else if (-[__CFString code](v5, "code") == (id)-6012LL)
  {
    uint64_t v87 = kSecureBackupErrorDomain;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString userInfo](v5, "userInfo"));
    uint64_t v34 = v87;
    uint64_t v35 = 13LL;
  }

  else if (-[__CFString code](v5, "code") == (id)-6014LL)
  {
    uint64_t v129 = kSecureBackupErrorDomain;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString userInfo](v5, "userInfo"));
    uint64_t v34 = v129;
    uint64_t v35 = 14LL;
  }

  else
  {
    if (-[__CFString code](v5, "code") != (id)-4010LL) {
      goto LABEL_106;
    }
    uint64_t v151 = kSecureBackupErrorDomain;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString userInfo](v5, "userInfo"));
    uint64_t v34 = v151;
    uint64_t v35 = 33LL;
  }

  uint64_t v152 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v34,  v35,  v33));

  id v5 = (__CFString *)v152;
LABEL_106:
  double v153 = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
  id v154 = _CloudServicesSignpostLogSystem();
  uint64_t v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v154);
  v156 = v155;
  os_signpost_id_t v157 = *(void *)(a1 + 72);
  if (v157 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v155))
  {
    uint64_t v158 = objc_claimAutoreleasedReturnValue(-[__CFString domain](v5, "domain"));
    uint64_t v159 = (void *)v158;
    if (v158) {
      v160 = (const __CFString *)v158;
    }
    else {
      v160 = &stru_10006AB28;
    }
    unsigned int v161 = -[__CFString code](v5, "code");
    *(_DWORD *)__int128 buf = 138543618;
    id v189 = v160;
    __int16 v190 = 1026;
    LODWORD(v191) = v161;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v156,  OS_SIGNPOST_INTERVAL_END,  v157,  "RecoverEscrowWithRequest",  " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x12u);
  }

  id v162 = _CloudServicesSignpostLogSystem();
  v163 = (os_log_s *)objc_claimAutoreleasedReturnValue(v162);
  if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
  {
    v164 = *(const __CFString **)(a1 + 72);
    double v165 = v153 / 1000000000.0;
    uint64_t v166 = objc_claimAutoreleasedReturnValue(-[__CFString domain](v5, "domain"));
    v167 = (void *)v166;
    if (v166) {
      v168 = (const __CFString *)v166;
    }
    else {
      v168 = &stru_10006AB28;
    }
    unsigned int v169 = -[__CFString code](v5, "code");
    *(_DWORD *)__int128 buf = 134218754;
    id v189 = v164;
    __int16 v190 = 2048;
    double v191 = v165;
    __int16 v192 = 2114;
    *(void *)uint64_t v193 = v168;
    *(_WORD *)&v193[8] = 1026;
    *(_DWORD *)&v193[10] = v169;
    _os_log_impl( (void *)&_mh_execute_header,  v163,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverEscrowWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Erro r=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_118:
}

id sub_100022210(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 containsObject:*(void *)(a1 + 32)];
}

LABEL_14:
  uint64_t v33 = [v15 countOfObjectsWithPrefix:@"PCS"];
  uint64_t v34 = [v17 countOfObjectsWithPrefix:@"PCS"];
  if (v33 > v34)
  {
    uint64_t v35 = CloudServicesLog(v34);
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    id v12 = v51;
    id v8 = v52;
    id v25 = v16;
    unsigned int v24 = v18;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "candidate can recover fewer PCS views",  buf,  2u);
    }

    double v20 = 1LL;
    __int16 v26 = v53;
    id v36 = v54;
    goto LABEL_30;
  }

  id v12 = v51;
  id v25 = v16;
  if (v33 < v34)
  {
    uint64_t v41 = CloudServicesLog(v34);
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    id v8 = v52;
    id v36 = v54;
    unsigned int v24 = v18;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      id v42 = "candidate can recover more PCS views";
      goto LABEL_41;
    }

    goto LABEL_42;
  }

  __int16 v43 = [v15 count];
  uint64_t v44 = [v17 count];
  id v8 = v52;
  id v36 = v54;
  if (v43 > v44)
  {
    __int128 v45 = CloudServicesLog(v44);
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "candidate can recover fewer total views",  buf,  2u);
    }

    double v20 = 1LL;
LABEL_28:
    unsigned int v24 = v18;
    goto LABEL_29;
  }

  uint64_t v46 = [v15 count];
  __int128 v47 = [v17 count];
  if (v46 < v47)
  {
    __int128 v48 = CloudServicesLog(v47);
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    unsigned int v24 = v18;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      id v42 = "candidate can recover more total views";
LABEL_41:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v42, buf, 2u);
    }
}

  id v17 = 0LL;
LABEL_15:

  return v17;
}

    uint64_t v21 = v13 != 0;
    __int128 v22 = *(void *)(a1 + 48);
    id v23 = v12;
    unsigned int v24 = v11;
LABEL_16:
    [v23 _recoverWithVersion:0 req:v24 duplicate:v21 sesWrapper:v8 srpInitResponse:v7 reply:v22];
    goto LABEL_17;
  }

  if (!_os_feature_enabled_impl("CloudServices", "RequireClubTypeID"))
  {
    id v23 = *(void **)(a1 + 32);
    unsigned int v24 = *(void *)(a1 + 40);
    uint64_t v21 = *(unsigned __int8 *)(a1 + 56);
    __int128 v22 = *(void *)(a1 + 48);
    goto LABEL_16;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  kEscrowServiceErrorDomain,  106LL,  @"Unknown/bad ClubTypeID"));
  uint64_t v19 = CloudServicesLog(v18);
  double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_100047E3C(v7, v20);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_17:
}

LABEL_72:
              uint64_t v38 = (id)v86;
            }

            else
            {
              id v52 = v83;
              if (v83)
              {
                char v51 = -[SecureBackupDaemon compare:with:backups:](self, "compare:with:backups:", v83, v16, v78);
                if (v51 != -1)
                {
                  id v57 = CloudServicesLog(v51);
                  BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_71;
                  }
                  goto LABEL_72;
                }
              }

              uint64_t v61 = CloudServicesLog(v51);
              uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v55 = @"better";
                if (!v83) {
                  uint64_t v55 = @"first";
                }
LABEL_66:
                *(_DWORD *)__int128 buf = 138412290;
                id v94 = (unint64_t)v55;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "found %@ candidate", buf, 0xCu);
              }

LABEL_67:
              __int128 v62 = v16;
              uint64_t v63 = v19;

              BOOL v40 = v82;
              uint64_t v81 = v63;
              id v82 = v29;
              __int16 v83 = v62;
            }

            uint64_t v14 = &ACAccountTypeIdentifierAppleAccount_ptr;
LABEL_31:

            unsigned int v86 = (unint64_t)v38;
            os_signpost_id_t v13 = v84;
            goto LABEL_32;
          }

          uint64_t v46 = _os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn");
          if ((_DWORD)v46)
          {
            __int128 v47 = v83;
            if (!v83
              || (uint64_t v46 = -[SecureBackupDaemon compareEscrowDatesBetweenCurrentRecord:andCandidateRecord:]( self,  "compareEscrowDatesBetweenCurrentRecord:andCandidateRecord:",  v83,  v16)) != 0)
            {
              __int128 v48 = CloudServicesLog(v46);
              __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                id v50 = @"better";
                if (!v83) {
                  id v50 = @"first";
                }
                goto LABEL_61;
              }

              goto LABEL_62;
            }

            double v64 = CloudServicesLog(0LL);
            BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
            if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_30;
            }
          }

          else
          {
            __int128 v47 = v83;
            if (!v83
              || (uint64_t v46 = -[SecureBackupDaemon compare:with:backups:](self, "compare:with:backups:", v83, v16, v78),
                  v46 == -1))
            {
              id v58 = CloudServicesLog(v46);
              __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                id v50 = @"better";
                if (!v83) {
                  id v50 = @"first";
                }
LABEL_61:
                *(_DWORD *)__int128 buf = 138412290;
                id v94 = (unint64_t)v50;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "found %@ candidate", buf, 0xCu);
              }

LABEL_62:
              __int128 v59 = v16;
              id v60 = v19;

              BOOL v40 = v82;
              uint64_t v81 = v60;
              id v82 = v29;
              uint64_t v38 = (id)a5;
              __int16 v83 = v59;
              goto LABEL_31;
            }

            uint64_t v56 = CloudServicesLog(v46);
            BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
            if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_30;
            }
          }

          *(_WORD *)__int128 buf = 0;
          id v42 = v40;
          __int16 v43 = "keeping current candidate";
        }

        else
        {
          __int128 v45 = CloudServicesLog(v37);
          BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_30;
          }
          *(_WORD *)__int128 buf = 0;
          id v42 = v40;
          __int16 v43 = "escrow record not same platform, skipping";
        }

        uint64_t v44 = 2;
LABEL_29:
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v43, buf, v44);
LABEL_30:
        uint64_t v38 = (id)v86;
        goto LABEL_31;
      }

      __int16 v26 = v24;
      id v27 = CloudServicesLog(v24);
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218242;
        uint64_t v28 = &stru_10006AB28;
        if (!v26) {
          uint64_t v28 = @"not ";
        }
        id v94 = (unint64_t)v23;
        id v95 = 2112;
        unsigned __int8 v96 = (unint64_t)v28;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v29,  OS_LOG_TYPE_DEFAULT,  "candidate not eligible: remaining attempts = %llu, silent attempt %@allowed",  buf,  0x16u);
      }

LABEL_40:
    _Block_object_dispose(&buf, 8);
    goto LABEL_41;
  }

  os_signpost_id_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackup error](v10, "error"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, NSUnderlyingErrorKey);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v13));
  (*((void (**)(id, void, void *))v62 + 2))(v62, 0LL, v15);

LABEL_41:
}

void sub_100023B6C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(a1);
    uint64_t v15 = CloudServicesLog(v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v14 callStackSymbols]);
      sub_100046000();
    }

    id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v18,  NSLocalizedDescriptionKey);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 reason]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v19,  NSLocalizedFailureReasonErrorKey);

    double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v17));
    (*(void (**)(uint64_t, void, void *))(a11 + 16))(a11, 0LL, v20);

    objc_end_catch();
    JUMPOUT(0x100023A94LL);
  }

  _Unwind_Resume(a1);
}

void sub_100023D0C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

void sub_100023D44(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = CloudServicesLog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "found record ID to use! :%@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setRecordID:v7];
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[OTEscrowTranslation metadataToDictionary:]( &OBJC_CLASS___OTEscrowTranslation,  "metadataToDictionary:",  v8));
    [*(id *)(a1 + 32) setMetadata:v12];

    uint64_t v14 = CloudServicesLog(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metadata]);
      *(_DWORD *)__int128 buf = 138412290;
      id v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "using metadata :%@", buf, 0xCu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cachedRecordID]);
    unsigned int v18 = [v17 isEqualToString:v7];

    if (v18)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cachedRecordIDPassphrase]);
      [*(id *)(a1 + 32) setPassphrase:v19];
    }

    else
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) passphrase]);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v19 substringToIndex:a4]);
      [*(id *)(a1 + 32) setPassphrase:v22];
    }

    uint64_t v24 = *(void *)(a1 + 32);
    id v23 = *(void **)(a1 + 40);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10002401C;
    v27[3] = &unk_100069690;
    id v25 = *(id *)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 56);
    id v28 = v25;
    uint64_t v29 = v26;
    [v23 recoverEscrowWithRequest:v24 reply:v27];
    double v20 = v28;
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000460A0();
    }

    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    uint64_t v33 = @"silent attempt failed: no valid record found";
    double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  43LL,  v20));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_10002401C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

uint64_t sub_100024054(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002438C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    uint64_t v12 = CloudServicesLog(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v11 callStackSymbols]);
      sub_1000460CC();
    }

    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v15,  NSLocalizedDescriptionKey);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 reason]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v16,  NSLocalizedFailureReasonErrorKey);

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v14));
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0LL, v17);

    objc_end_catch();
    JUMPOUT(0x100024340LL);
  }

  _Unwind_Resume(a1);
}

void sub_1000244E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

void sub_1000246D4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(exception_object);
    uint64_t v13 = CloudServicesLog(v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v12 callStackSymbols]);
      sub_100046140();
    }

    uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v16,  NSLocalizedDescriptionKey);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 reason]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v17,  NSLocalizedFailureReasonErrorKey);

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v15));
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v18);

    objc_end_catch();
    JUMPOUT(0x100024684LL);
  }

  _Unwind_Resume(exception_object);
}

LABEL_50:
}

      v9[2](v9, v49);
LABEL_83:

      __int128 v22 = v49;
LABEL_84:

      goto LABEL_14;
    }

    id v93 = 0LL;
    char v51 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon fetchPRK:](self, "fetchPRK:", &v93));
    __int128 v49 = v93;
    [v8 setIdmsData:v51];

    if (v49)
    {
      uint64_t v53 = CloudServicesLog(v52);
      uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        sub_100047084();
      }

      goto LABEL_50;
    }

    __int128 v62 = (void *)objc_claimAutoreleasedReturnValue([v8 idmsData]);

    double v64 = CloudServicesLog(v63);
    id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    int v66 = os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
    if (v62)
    {
      if (!v66) {
        goto LABEL_58;
      }
      *(_WORD *)__int128 buf = 0;
      uint64_t v67 = "prepareHSA2: found IDMS data";
    }

    else
    {
      if (!v66) {
        goto LABEL_58;
      }
      *(_WORD *)__int128 buf = 0;
      uint64_t v67 = "prepareHSA2: found no IDMS data";
    }

    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, v67, buf, 2u);
LABEL_58:

    v92 = 0LL;
    os_signpost_id_t v68 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon makeRecordCandidate:error:](self, "makeRecordCandidate:error:", v8, &v92));
    uint64_t v69 = v92;
    __int128 v49 = v69;
    if (!v68 || v69)
    {
      __int16 v83 = CloudServicesLog(v69);
      int v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        sub_100046F04();
      }

      v9[2](v9, v49);
    }

    else
    {
      id v70 = objc_alloc(&OBJC_CLASS___EscrowService);
      uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
      v72 = -[EscrowService initWithOperationsLogger:](v70, "initWithOperationsLogger:", v71);

      uint64_t v91 = 0LL;
      uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue( -[EscrowService fetchCachedCertificateWithRequest:error:]( v72,  "fetchCachedCertificateWithRequest:error:",  v8,  &v91));
      int v74 = v91;
      __int128 v49 = v74;
      if (!v73 || v74)
      {
        uint64_t v85 = CloudServicesLog(v74);
        unsigned int v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
          sub_100046F64();
        }

        v9[2](v9, v49);
      }

      else
      {
        uint64_t v87 = v72;
        id v90 = 0LL;
        unsigned int v75 = (void *)objc_claimAutoreleasedReturnValue( +[EscrowPrerecord createPrerecordFromCandidate:storedCertificate:request:error:]( &OBJC_CLASS___EscrowPrerecord,  "createPrerecordFromCandidate:storedCertificate:request:error:",  v68,  v73,  v8,  &v90));
        __int128 v49 = v90;
        id v76 = CloudServicesLog(v49);
        id v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
        char v78 = v77;
        uint64_t v88 = v75;
        if (!v75 || v49)
        {
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
            sub_100046FC4();
          }

          v9[2](v9, v49);
          v72 = v87;
        }

        else
        {
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "Successfully made an escrow prerecord",  buf,  2u);
          }

          v79 = (void *)objc_claimAutoreleasedReturnValue([v75 data]);
          id v89 = 0LL;
          [v46 cachePrerecord:v48 serializedPrerecord:v79 error:&v89];
          __int128 v49 = v89;

          v72 = v87;
          if (v49)
          {
            uint64_t v81 = CloudServicesLog(v80);
            id v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
              sub_100047024();
            }

            v9[2](v9, v49);
          }

          else
          {
            v9[2](v9, 0LL);
          }
        }
      }
    }

    goto LABEL_83;
  }

  unsigned int v18 = kSecureBackupErrorDomain;
  v100 = NSLocalizedDescriptionKey;
  v101 = @"Cannot prepare HSA2 Escrow record for a stingray request";
  uint64_t v19 = &v101;
  double v20 = &v100;
LABEL_13:
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v20,  1LL));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  24LL,  v21));
  v9[2](v9, v22);
LABEL_14:
}

void sub_100025210(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    uint64_t v4 = CloudServicesLog(v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v3 callStackSymbols]);
      sub_1000461B4();
    }

    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v7,  NSLocalizedDescriptionKey);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 reason]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v8,  NSLocalizedFailureReasonErrorKey);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v6));
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0LL, v9);

    objc_end_catch();
    JUMPOUT(0x100025140LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_1000253C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = a2;
    uint64_t v8 = CloudServicesLog(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v41 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "escrowService iDMS recoverRecordWithRequest: returned: %@",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v6, "userInfo"));
    uint64_t v11 = (NSMutableDictionary *)[v10 mutableCopy];

    if (!v11) {
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"coolOffEnd"]);
    uint64_t v13 = (NSError *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"recoveryStatus"]);

    if (v12) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v12,  kSecureBackupCoolOffEndKey);
    }
    if (v13) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v13,  kSecureBackupRecoveryStatusKey);
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v6, "domain"));
    unsigned int v15 = [v14 isEqualToString:kEscrowServiceErrorDomain];

    if (!v15) {
      goto LABEL_42;
    }
    uint64_t v16 = -[NSError code](v6, "code");
    id v17 = kSecureBackupErrorDomain;
    uint64_t v18 = -[NSError code](v6, "code");
    if (v18 > -4018)
    {
      if (v18 > -4011)
      {
        if (v18 == -4010)
        {
          uint64_t v16 = 33LL;
          goto LABEL_41;
        }

        if (v18 == -4005)
        {
          uint64_t v16 = 25LL;
          goto LABEL_41;
        }
      }

      else
      {
        if (v18 == -4017)
        {
          uint64_t v16 = 35LL;
          goto LABEL_41;
        }

        if (v18 == -4015)
        {
          uint64_t v16 = 34LL;
          goto LABEL_41;
        }
      }
    }

    else if (v18 > -6013)
    {
      if (v18 == -6012)
      {
        uint64_t v16 = 13LL;
        goto LABEL_41;
      }

      if (v18 == -6005)
      {
        uint64_t v16 = 30LL;
        goto LABEL_41;
      }
    }

    else
    {
      if (v18 == -6015)
      {
        uint64_t v16 = 26LL;
        goto LABEL_41;
      }

      if (v18 == -6014)
      {
        uint64_t v16 = 14LL;
LABEL_41:
        int v37 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  v17,  v16,  v11);

        uint64_t v6 = v37;
LABEL_42:
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        goto LABEL_43;
      }
    }

    uint64_t v36 = objc_claimAutoreleasedReturnValue(-[NSError domain](v6, "domain"));

    id v17 = (id)v36;
    goto LABEL_41;
  }

  uint64_t v19 = kEscrowServiceRecordDataKey;
  id v20 = a2;
  uint64_t v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v19]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  @"BackupVersion"));
  uint64_t v21 = kSecureBackupTimestampKey;
  uint64_t v13 = (NSError *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  kSecureBackupTimestampKey));
  uint64_t v22 = kSecureBackupIDMSDataKey;
  id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  kSecureBackupIDMSDataKey));
  uint64_t v24 = CloudServicesLog(v23);
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    uint64_t v41 = v13;
    __int16 v42 = 2112;
    __int16 v43 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "=== Escrow record ===\nTime of escrow: %@\nEscrow version: %@",  buf,  0x16u);
  }

  id v26 = [v12 isEqualToString:@"1"];
  if ((v26 & 1) != 0)
  {
    id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v23, v22);
    uint64_t v28 = CloudServicesLog(-[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v13, v21));
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = (NSError *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordID]);
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v41 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "caching recordID %@", buf, 0xCu);
    }

    id v31 = *(void **)(a1 + 40);
    NSErrorUserInfoKey v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) passphrase]);
    [v31 setCachedRecordIDPassphrase:v32];

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) recordID]);
    [*(id *)(a1 + 40) setCachedRecordID:v33];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v34 = CloudServicesLog(v26);
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "backup data version does not match version in escrow",  buf,  2u);
    }

    NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
    __int128 v39 = @"backup data version does not match version in escrow";
    id v27 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
    uint64_t v6 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  3LL,  v27));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

LABEL_43:
}

void sub_100025938(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = CloudServicesLog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      int v22 = 138412290;
      id v23 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "escrowService iDMS recoverRecordWithRequest: returned: %@",  (uint8_t *)&v22,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary userInfo](v5, "userInfo"));
    uint64_t v11 = (NSMutableDictionary *)[v10 mutableCopy];

    if (!v11) {
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"coolOffEnd"]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"recoveryStatus"]);

    if (v12) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v12,  kSecureBackupCoolOffEndKey);
    }
    if (v13) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v13,  kSecureBackupRecoveryStatusKey);
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary domain](v5, "domain"));
    unsigned int v15 = [v14 isEqualToString:kEscrowServiceErrorDomain];

    if (!v15) {
      goto LABEL_35;
    }
    uint64_t v16 = (uint64_t)-[NSMutableDictionary code](v5, "code");
    id v17 = kSecureBackupErrorDomain;
    uint64_t v18 = (uint64_t)-[NSMutableDictionary code](v5, "code");
    if (v18 > -4018)
    {
      if (v18 > -4011)
      {
        if (v18 == -4010)
        {
          uint64_t v16 = 33LL;
          goto LABEL_34;
        }

        if (v18 == -4005)
        {
          uint64_t v16 = 25LL;
          goto LABEL_34;
        }
      }

      else
      {
        if (v18 == -4017)
        {
          uint64_t v16 = 35LL;
          goto LABEL_34;
        }

        if (v18 == -4015)
        {
          uint64_t v16 = 34LL;
          goto LABEL_34;
        }
      }
    }

    else if (v18 > -6013)
    {
      if (v18 == -6012)
      {
        uint64_t v16 = 13LL;
        goto LABEL_34;
      }

      if (v18 == -6005)
      {
        uint64_t v16 = 30LL;
        goto LABEL_34;
      }
    }

    else
    {
      if (v18 == -6015)
      {
        uint64_t v16 = 26LL;
        goto LABEL_34;
      }

      if (v18 == -6014)
      {
        uint64_t v16 = 14LL;
LABEL_34:
        uint64_t v21 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  v17,  v16,  v11);

        id v5 = (NSMutableDictionary *)v21;
LABEL_35:
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();

        goto LABEL_36;
      }
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary domain](v5, "domain"));

    id v17 = (id)v20;
    goto LABEL_34;
  }

  if (v9)
  {
    LOWORD(v22) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "FMiP recovery attempt successful",  (uint8_t *)&v22,  2u);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"EscrowServiceFMiPData"]);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, kSecureBackupFMiPDataKey);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_36:
}

void sub_100025CA0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  [v7 logResultForEvent:CloudServicesAnalyticsRecoverRequest hardFailure:1 result:v6];

  if (v6)
  {
    uint64_t v9 = CloudServicesLog(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v43 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "escrowService stingray recoverRecordWithRequest: returned: %@",  buf,  0xCu);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    unsigned int v12 = [v11 isEqualToString:kEscrowServiceErrorDomain];

    if (!v12) {
      goto LABEL_26;
    }
    if ([v6 code] == (id)-4005)
    {
      uint64_t v13 = kSecureBackupErrorDomain;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      uint64_t v15 = v13;
      uint64_t v16 = 25LL;
    }

    else if ([v6 code] == (id)-6015)
    {
      uint64_t v32 = kSecureBackupErrorDomain;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      uint64_t v15 = v32;
      uint64_t v16 = 26LL;
    }

    else if ([v6 code] == (id)-6005)
    {
      uint64_t v33 = kSecureBackupErrorDomain;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      uint64_t v15 = v33;
      uint64_t v16 = 30LL;
    }

    else if ([v6 code] == (id)-6012)
    {
      uint64_t v34 = kSecureBackupErrorDomain;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      uint64_t v15 = v34;
      uint64_t v16 = 13LL;
    }

    else if ([v6 code] == (id)-6014)
    {
      uint64_t v35 = kSecureBackupErrorDomain;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      uint64_t v15 = v35;
      uint64_t v16 = 14LL;
    }

    else
    {
      if ([v6 code] != (id)-4010)
      {
LABEL_26:
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
        goto LABEL_27;
      }

      uint64_t v36 = kSecureBackupErrorDomain;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
      uint64_t v15 = v36;
      uint64_t v16 = 33LL;
    }

    uint64_t v37 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  v16,  v14));

    id v6 = (id)v37;
    goto LABEL_26;
  }

  uint64_t v39 = a1;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kEscrowServiceRecordDataKey]);
  uint64_t v18 = kSecureBackupKeybagSHA256Key;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kSecureBackupKeybagSHA256Key]);
  uint64_t v20 = kSecureBackupKeybagDigestKey;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kSecureBackupKeybagDigestKey]);
  uint64_t v38 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kSecureBackupBagPasswordKey]);
  int v22 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"BackupVersion"]);
  uint64_t v23 = kSecureBackupTimestampKey;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kSecureBackupTimestampKey]);
  uint64_t v25 = CloudServicesLog(v24);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138413058;
    id v43 = v24;
    __int16 v44 = 2112;
    __int128 v45 = v22;
    __int16 v46 = 2112;
    __int128 v47 = v19;
    __int16 v48 = 2112;
    __int128 v49 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "=== Escrow record ===\nTime of escrow: %@\nEscrow version: %@\nKeybag SHA256: %@\nKeybag digest: %@",  buf,  0x2Au);
  }

  id v27 = [v22 isEqualToString:@"1"];
  if ((v27 & 1) != 0)
  {
    uint64_t v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v19, v18);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v21, v20);
    uint64_t v29 = (void *)v38;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v38,  kSecureBackupiCloudIdentityDataKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v22,  @"BackupVersion");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v24, v23);
    (*(void (**)(void))(*(void *)(v39 + 32) + 16LL))();
    id v6 = 0LL;
  }

  else
  {
    uint64_t v30 = CloudServicesLog(v27);
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "backup data version does not match version in escrow",  buf,  2u);
    }

    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    uint64_t v41 = @"backup data version does not match version in escrow";
    uint64_t v28 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  3LL,  v28));
    (*(void (**)(void))(*(void *)(v39 + 32) + 16LL))();
    uint64_t v29 = (void *)v38;
  }

LABEL_27:
}

void sub_100026250(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v7)
  {
    [*(id *)(a1 + 32) setRecordID:v7];
    [*(id *)(a1 + 32) setMetadata:v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cachedRecordID]);
    unsigned int v11 = [v10 isEqualToString:v7];

    if (v11)
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cachedRecordIDPassphrase]);
      [*(id *)(a1 + 32) setPassphrase:v12];
    }

    else
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) passphrase]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 substringToIndex:a4]);
      [*(id *)(a1 + 32) setPassphrase:v17];
    }

    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(a1 + 40);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100026460;
    v22[3] = &unk_100069690;
    id v20 = *(id *)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 56);
    id v23 = v20;
    uint64_t v24 = v21;
    [v18 recoverEscrowWithRequest:v19 reply:v22];
    uint64_t v15 = v23;
  }

  else
  {
    uint64_t v13 = CloudServicesLog(v8);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000460A0();
    }

    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    id v26 = @"silent attempt failed: no valid record found";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  43LL,  v15));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_100026460(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

void sub_100026498(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

void sub_1000265A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  kdebug_trace(733020568LL, 0LL, 0LL, 0LL, 0LL);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10002670C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  kdebug_trace(733020568LL, 0LL, 0LL, 0LL, 0LL);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100026874(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  kdebug_trace(733020568LL, 0LL, 0LL, 0LL, 0LL);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100026C0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100026C48(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSDate);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 kvs]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 _getICDPBackupFromKVS:v4 forView:@"iCloudIdentity"]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
    uint64_t v7 = CloudServicesLog(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSecureBackupTimestampKey]);
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v61 = @"iCloudIdentity";
      __int16 v62 = 2112;
      uint64_t v63 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Retrieving backup for view %@ from %@",  buf,  0x16u);
    }

    if (v6)
    {
      uint64_t v11 = CloudServicesLog(v10);
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v61 = @"iCloudIdentity";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "about to remove recovery key from backup view %@",  buf,  0xCu);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"keybag"]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"backup"]);
      uint64_t v15 = (void *)v14;
      if (v13 && v14)
      {
        uint64_t v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id obj = *(id *)(v17 + 40);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 removeRKFromKeyBag:v13 error:&obj]);
        objc_storeStrong((id *)(v17 + 40), obj);
        if (v18 && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
          goto LABEL_14;
        }
        uint64_t v20 = CloudServicesLog(v19);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000463B8();
        }

        if (v18)
        {
LABEL_14:
          *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
          id v55 = [v6 mutableCopy];
          [v55 setObject:v18 forKeyedSubscript:@"keybag"];
          id v22 = [v5 mutableCopy];
          [v22 setObject:v55 forKeyedSubscript:@"com.apple.securebackup.keychain"];
          [v22 setObject:v2 forKeyedSubscript:kSecureBackupTimestampKey];
          id v23 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@.%@-tomb",  @"com.apple.icdp.backup",  @"iCloudIdentity");
          uint64_t v24 = v18;
          NSErrorUserInfoKey v25 = v2;
          id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) kvs]);
          [v26 setObject:v22 forKey:v23];

          uint64_t v2 = v25;
          uint64_t v18 = v24;
        }
      }
    }
  }

  id v27 = *(void **)(a1 + 32);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 kvs]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v27 _getICDPBackupFromKVS:v28 forView:@"PCS-MasterKey"]);

  if (v29)
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
    uint64_t v31 = CloudServicesLog(v30);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:kSecureBackupTimestampKey]);
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v61 = @"PCS-MasterKey";
      __int16 v62 = 2112;
      uint64_t v63 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Retrieving backup for view %@ from %@",  buf,  0x16u);
    }

    if (v30)
    {
      uint64_t v35 = CloudServicesLog(v34);
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v61 = @"PCS-MasterKey";
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "about to remove recovery key from backup view %@",  buf,  0xCu);
      }

      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"keybag"]);
      uint64_t v38 = objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"backup"]);
      uint64_t v39 = (void *)v38;
      if (v37 && v38)
      {
        NSErrorUserInfoKey v40 = *(void **)(a1 + 32);
        id v58 = 0LL;
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 removeRKFromKeyBag:v37 error:&v58]);
        id v42 = v58;
        id v43 = v42;
        if (v41 && !v42) {
          goto LABEL_31;
        }
        id v56 = v42;
        uint64_t v44 = CloudServicesLog(v42);
        __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_100046358();
        }

        id v43 = v56;
        if (v41)
        {
LABEL_31:
          *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
          id v53 = [v30 mutableCopy];
          [v53 setObject:v41 forKeyedSubscript:@"keybag"];
          id v57 = v2;
          id v46 = [v29 mutableCopy];
          [v46 setObject:v53 forKeyedSubscript:@"com.apple.securebackup.keychain"];
          [v46 setObject:v57 forKeyedSubscript:kSecureBackupTimestampKey];
          __int128 v47 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@.%@-tomb",  @"com.apple.icdp.backup",  @"PCS-MasterKey");
          uint64_t v54 = v37;
          __int16 v48 = v43;
          __int128 v49 = v5;
          id v50 = v39;
          char v51 = v41;
          id v52 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) kvs]);
          [v52 setObject:v46 forKey:v47];

          uint64_t v41 = v51;
          uint64_t v39 = v50;
          id v5 = v49;
          id v43 = v48;
          uint64_t v37 = v54;

          uint64_t v2 = v57;
        }
      }
    }
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)
    || *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    [*(id *)(a1 + 32) doSynchronize];
  }
}

LABEL_12:
      uint64_t v14 = 1;
      goto LABEL_13;
    }

    uint64_t v10 = 0;
LABEL_13:

    goto LABEL_14;
  }

  uint64_t v10 = 0;
LABEL_14:

  return v10 & 1;
}

  return v7;
}

LABEL_7:
    unsigned int v12 = CloudServicesLog(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v30 + 24)) {
        uint64_t v13 = @"iCloudIdentity";
      }
      else {
        uint64_t v13 = @"PCSMasterKey";
      }
      *(_DWORD *)__int128 buf = 138412290;
      NSErrorUserInfoKey v40 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "recovery key verified against %@ keybag",  buf,  0xCu);
    }

    goto LABEL_12;
  }

  if (*((_BYTE *)v26 + 24)) {
    goto LABEL_7;
  }
  uint64_t v16 = CloudServicesLog(v9);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100046418();
  }

  uint64_t v14 = 0;
  if (a4)
  {
    uint64_t v18 = (void *)v34[5];
    if (v18)
    {
      uint64_t v14 = 0;
      *a4 = v18;
    }
  }

  return v6;
}

void sub_100027578( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_1000275BC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataUsingEncoding:4]);
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 kvs]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 _getICDPBackupFromKVS:v4 forView:@"iCloudIdentity"]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
    uint64_t v7 = CloudServicesLog(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSecureBackupTimestampKey]);
      *(_DWORD *)__int128 buf = 138412546;
      id v46 = @"iCloudIdentity";
      __int16 v47 = 2112;
      __int16 v48 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Retrieving backup for view %@ from %@",  buf,  0x16u);
    }

    if (v6)
    {
      uint64_t v11 = CloudServicesLog(v10);
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v46 = @"iCloudIdentity";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "verifying rk against backup view %@",  buf,  0xCu);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"keybag"]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"backup"]);
      uint64_t v15 = (void *)v14;
      if (v13 && v14)
      {
        uint64_t v16 = *(void **)(a1 + 40);
        id v44 = 0LL;
        unsigned __int8 v17 = [v16 verifyRKWithKeyBag:v13 password:v2 error:&v44];
        id v18 = v44;
        id v19 = v44;
        uint64_t v20 = v19;
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v17;
        if (v19)
        {
          uint64_t v21 = CloudServicesLog(v19);
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_100046444();
          }

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v18);
        }
      }
    }
  }

  id v23 = *(void **)(a1 + 40);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 kvs]);
  NSErrorUserInfoKey v25 = (void *)objc_claimAutoreleasedReturnValue([v23 _getICDPBackupFromKVS:v24 forView:@"PCS-MasterKey"]);

  if (v25)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
    uint64_t v27 = CloudServicesLog(v26);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:kSecureBackupTimestampKey]);
      *(_DWORD *)__int128 buf = 138412546;
      id v46 = @"PCS-MasterKey";
      __int16 v47 = 2112;
      __int16 v48 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Retrieving backup for view %@ from %@",  buf,  0x16u);
    }

    if (v26)
    {
      uint64_t v31 = CloudServicesLog(v30);
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v46 = @"PCS-MasterKey";
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "restoring backup view %@", buf, 0xCu);
      }

      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"keybag"]);
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"backup"]);
      uint64_t v35 = (void *)v34;
      if (v33 && v34)
      {
        uint64_t v36 = *(void **)(a1 + 40);
        id v43 = 0LL;
        unsigned __int8 v37 = [v36 verifyRKWithKeyBag:v33 password:v2 error:&v43];
        id v38 = v43;
        id v39 = v43;
        NSErrorUserInfoKey v40 = v39;
        *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v37;
        if (v39)
        {
          uint64_t v41 = CloudServicesLog(v39);
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_100046444();
          }

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v38);
        }
      }
    }
  }
}

void sub_100027C40(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace(733020568LL, 0LL, 0LL, 0LL, 0LL);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100027F00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = CloudServicesLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Escrow recovery completed with possible error: %@",  (uint8_t *)&v9,  0xCu);
  }

  kdebug_trace(733020568LL, 0LL, 0LL, 0LL, 0LL);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100028694(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = CloudServicesLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000459B4();
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "escrowService storeRecordWithRequest: succeeded",  v9,  2u);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  v8();
}

void sub_1000288BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = CloudServicesLog(v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      int v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "escrowService deleteRecordWithRequest: returned: %@",  (uint8_t *)&v8,  0xCu);
    }

    [*(id *)(a1 + 32) setDeleteError:v5];
  }

  [*(id *)(a1 + 40) _deleteAlliCDPRecordsWithContext:*(void *)(a1 + 32)];
}

void sub_100028B7C(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), a3);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:kSecureBackupAlliCDPRecordsKey]);
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      uint64_t v10 = kSecureBackupRecordIDKey;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)v11),  "objectForKeyedSubscript:",  v10,  (void)v18));
          if (v12) {
            -[NSMutableArray addObject:](v5, "addObject:", v12);
          }

          uint64_t v11 = (char *)v11 + 1;
        }

        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v8);
    }

    if (-[NSMutableArray count](v5, "count"))
    {
      uint64_t v13 = objc_alloc_init(&OBJC_CLASS___SecureBackupDeletionContext);
      -[SecureBackupDeletionContext setRequest:](v13, "setRequest:", *(void *)(a1 + 32));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDeletionContext request](v13, "request"));
      [v14 setIcdp:1];

      -[SecureBackupDeletionContext setCompletionBlock:](v13, "setCompletionBlock:", *(void *)(a1 + 48));
      uint64_t v15 = objc_alloc(&OBJC_CLASS___EscrowService);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) operationsLogger]);
      unsigned __int8 v17 = -[EscrowService initWithOperationsLogger:](v15, "initWithOperationsLogger:", v16);
      -[SecureBackupDeletionContext setEscrowService:](v13, "setEscrowService:", v17);

      -[SecureBackupDeletionContext setRecordIDs:](v13, "setRecordIDs:", v5);
      -[SecureBackupDeletionContext setDeleteError:](v13, "setDeleteError:", 0LL);
      [*(id *)(a1 + 40) _deleteAlliCDPRecordsWithContext:v13];
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }

void sub_100028FD0(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v6 = kSecureBackupBackOffDateKey;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSecureBackupBackOffDateKey]);
    uint64_t v8 = kSecureBackupStingrayMetadataHashKey;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSecureBackupStingrayMetadataHashKey]);
    if (v7) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, v6);
    }
    if (v9) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, v8);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100029B74(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    uint64_t v4 = CloudServicesLog(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v3 callStackSymbols]);
      sub_100046668();
    }

    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v7,  NSLocalizedDescriptionKey);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 reason]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v8,  NSLocalizedFailureReasonErrorKey);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v6));
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);

    objc_end_catch();
    JUMPOUT(0x100029AF0LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_100029CA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  id v5 = _CloudServicesSignpostLogSystem();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v3 domain]);
    id v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (const __CFString *)v9;
    }
    else {
      uint64_t v11 = &stru_10006AB28;
    }
    int v22 = 138543618;
    id v23 = v11;
    __int16 v24 = 1026;
    LODWORD(v25) = [v3 code];
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  v8,  "DisableWithRequest",  " ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{public,signpost.telemetry:number2,name=Error}d ",  (uint8_t *)&v22,  0x12u);
  }

  id v12 = _CloudServicesSignpostLogSystem();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(const __CFString **)(a1 + 56);
    double v15 = Nanoseconds / 1000000000.0;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned __int8 v17 = (void *)v16;
    if (v16) {
      __int128 v18 = (const __CFString *)v16;
    }
    else {
      __int128 v18 = &stru_10006AB28;
    }
    unsigned int v19 = [v3 code];
    int v22 = 134218754;
    id v23 = v14;
    __int16 v24 = 2048;
    double v25 = v15;
    __int16 v26 = 2114;
    uint64_t v27 = v18;
    __int16 v28 = 1026;
    unsigned int v29 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: DisableWithRequest  ErrorDomain=%{public,signpost.telemetry:string2,name=ErrorDomain}@  Error=%{pu blic,signpost.telemetry:number2,name=Error}d ",  (uint8_t *)&v22,  0x26u);
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) operationsLogger]);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) endEventWithResults:&__NSDictionary0__struct error:v3]);
  [v20 updateStoreWithEvent:v21];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100029ECC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    [*(id *)(a1 + 32) disableiCDPBackup];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100029F1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = CloudServicesLog(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "escrowService deleteRecordWithRequest: returned: %@",  (uint8_t *)&v13,  0xCu);
    }
  }

  else if (([*(id *)(a1 + 32) stingray] & 1) == 0)
  {
    if (([*(id *)(a1 + 32) icdp] & 1) == 0)
    {
      if (([*(id *)(a1 + 40) _backupEnabled] & 1) == 0)
      {
        uint64_t v12 = *(void *)(a1 + 56);
        if (!v12) {
          goto LABEL_14;
        }
        uint64_t v11 = *(void (**)(void))(v12 + 16);
        goto LABEL_13;
      }

      [*(id *)(a1 + 40) _disableBackup];
      [*(id *)(a1 + 40) _removeUsesEscrow];
    }

    if (!*(void *)(a1 + 32)) {
      notify_post("com.apple.EscrowSecurityAlert.reset");
    }
  }

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10)
  {
    uint64_t v11 = *(void (**)(void))(v10 + 16);
LABEL_13:
    v11();
  }

void sub_10002A674( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2 == 1)
  {
    id v20 = objc_begin_catch(exception_object);
    uint64_t v21 = CloudServicesLog(v20);
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v20 callStackSymbols]);
      sub_1000466B0();
    }

    id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v20 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v24,  NSLocalizedDescriptionKey);

    double v25 = (void *)objc_claimAutoreleasedReturnValue([v20 reason]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v25,  NSLocalizedFailureReasonErrorKey);

    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v23));
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v26);

    objc_end_catch();
    JUMPOUT(0x10002A530LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_10002A7DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    unsigned int v7 = [v6 isEqualToString:kEscrowServiceErrorDomain];

    if (v7)
    {
      id v8 = [v5 code];
      if (v8 == (id)-5012LL)
      {
        uint64_t v9 = kSecureBackupErrorDomain;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
        uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  29LL,  v10));

        id v5 = (void *)v11;
      }
    }

    uint64_t v12 = CloudServicesLog(v8);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      double v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "updateRecordMetadataWithRequest: returned: %@",  (uint8_t *)&v14,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), 0LL);
  }

void sub_10002BDCC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"recoveryChallengeCodeLength"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v15,  kSecureBackupRecoveryVerificationTokenLengthKey);

    uint64_t v16 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    goto LABEL_12;
  }

  unsigned int v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary domain](v6, "domain"));
  unsigned int v9 = [v8 isEqualToString:kEscrowServiceErrorDomain];

  if (v9)
  {
    if (-[NSMutableDictionary code](v7, "code") == (id)-4002LL)
    {
      uint64_t v11 = kSecureBackupErrorDomain;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary userInfo](v7, "userInfo"));
      uint64_t v13 = v11;
      uint64_t v14 = 27LL;
LABEL_8:
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  v14,  v12));

      unsigned int v7 = (NSMutableDictionary *)v18;
      goto LABEL_9;
    }

    id v10 = -[NSMutableDictionary code](v7, "code");
    if (v10 == (id)-4007LL)
    {
      uint64_t v17 = kSecureBackupErrorDomain;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary userInfo](v7, "userInfo"));
      uint64_t v13 = v17;
      uint64_t v14 = 28LL;
      goto LABEL_8;
    }
  }

LABEL_9:
  uint64_t v19 = CloudServicesLog(v10);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    int v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "escrowService startSMSChallengeWithRequest: returned: %@",  (uint8_t *)&v21,  0xCu);
  }

  uint64_t v16 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
LABEL_12:
  v16();
}

void sub_10002C334(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unsigned int v7 = v6;
    uint64_t v8 = CloudServicesLog(v6);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      uint64_t v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "escrowService getCountrySMSCodesWithRequest: returned: %@",  (uint8_t *)&v17,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary domain](v7, "domain"));
    unsigned int v11 = [v10 isEqualToString:kEscrowServiceErrorDomain];

    if (v11)
    {
      uint64_t v12 = kSecureBackupErrorDomain;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary userInfo](v7, "userInfo"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  24LL,  v13));

      unsigned int v7 = (NSMutableDictionary *)v14;
    }

    double v15 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"EscrowServiceCountrySMSCodes"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v16,  kSecureBackupCountrySMSCodesKey);

    double v15 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  v15();
}

void sub_10002CB0C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(exception_object);
    uint64_t v19 = CloudServicesLog(v18);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v18 callStackSymbols]);
      sub_100046CDC();
    }

    int v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v22,  NSLocalizedDescriptionKey);

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 reason]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v23,  NSLocalizedFailureReasonErrorKey);

    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v21));
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v24);

    objc_end_catch();
    JUMPOUT(0x10002CAB4LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_10002CC78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = v6;
  if (v6)
  {
    uint64_t v8 = CloudServicesLog(v6);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      uint64_t v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "escrowService changeSMSTargetWithRequest: returned: %@",  (uint8_t *)&v15,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    unsigned int v11 = [v10 isEqualToString:kEscrowServiceErrorDomain];

    if (v11 && [v7 code] == (id)-5012)
    {
      uint64_t v12 = kSecureBackupErrorDomain;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  29LL,  v13));

      unsigned int v7 = (void *)v14;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002D378(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    uint64_t v11 = CloudServicesLog(v9);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100046DE4();
    }

    (*(void (**)(void))(a1[7] + 16LL))();
  }

  else
  {
    if (v9)
    {
      uint64_t v13 = CloudServicesLog(v9);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100046D84();
      }
    }

    int v15 = (void *)a1[4];
    id v22 = 0LL;
    unsigned int v16 = [v15 cacheStoredCertificate:v7 error:&v22];
    id v17 = v22;
    id v18 = v17;
    if (!v16 || v17)
    {
      uint64_t v20 = CloudServicesLog(v17);
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100046D24();
      }

      (*(void (**)(void))(a1[7] + 16LL))();
    }

    else
    {
      id v19 = [[SecureBackupBeginPasscodeRequestResults alloc] initWithStoredCertificate:v7 uuid:a1[5]];
      (*(void (**)(void))(a1[7] + 16LL))();
    }
  }
}

void sub_10002D5F4(_Unwind_Exception *a1)
{
}

void sub_10002D668( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002E654(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 escrowCertificate]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 duplicateEscrowCertificate]);

  (*(void (**)(uint64_t, void, id, void *, id))(v4 + 16))(v4, 0LL, v8, v7, v5);
}

uint64_t sub_10002E9C4(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  return xpc_transaction_exit_clean(v1);
}

void sub_10002EFC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = CloudServicesLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000459B4();
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "escrowService storeRecordWithRequest: succeeded",  v9,  2u);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  v8();
}

void sub_10002F2EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = CloudServicesLog(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      double v25 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Guitarfish token recovery returned: %@",  buf,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:kEscrowServiceRecordDataKey]);
    uint64_t v10 = kSecureBackupKeybagSHA256Key;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSecureBackupKeybagSHA256Key]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSecureBackupBagPasswordKey]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"BackupVersion"]);
    uint64_t v14 = kSecureBackupTimestampKey;
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSecureBackupTimestampKey]);
    id v16 = [v13 isEqualToString:@"1"];
    if ((v16 & 1) != 0)
    {
      v20[0] = v10;
      v20[1] = kSecureBackupiCloudIdentityDataKey;
      v21[0] = v11;
      v21[1] = v12;
      v20[2] = @"BackupVersion";
      v20[3] = v14;
      v21[2] = v13;
      v21[3] = v15;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  4LL));
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      id v6 = 0LL;
    }

    else
    {
      uint64_t v18 = CloudServicesLog(v16);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "guitarfish token data version does not match version in escrow",  buf,  2u);
      }

      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      id v23 = @"guitarfish token data version does not match version in escrow";
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  3LL,  v17));
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }
}

uint64_t sub_10002F710(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  return result;
}

void sub_10002F72C(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, os_log_s *a4@<X8>)
{
}

void sub_10002F73C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10002F748(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_10002F76C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

char *sub_10002F77C(int *a1)
{
  return strerror(*a1);
}

int *sub_10002F784()
{
  return __error();
}

  ;
}

void sub_10002F794( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10002F7C0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

  ;
}

void sub_10002F7EC(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

id sub_10002F898(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:*(void *)(a1 + 32)];
}

LABEL_10:
  return v8;
}

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48));
  uint64_t v12 = sub_100039E5C();
  uint64_t v13 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v12);
  dispatch_group_leave(v13);
}

void sub_10002FC48(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentRequest]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URL]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) originalRequest]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) URL]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) allHeaderFields]);
    int v13 = 138413058;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "redirect: current URL = %@, original URL = %@, new URL = %@, response headers = %@",  (uint8_t *)&v13,  0x2Au);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentRequest]);
  id v11 = [v10 mutableCopy];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) URL]);
  [v11 setURL:v12];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_1000300E0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000301C8;
  block[3] = &unk_100069908;
  uint64_t v10 = *(os_activity_s **)(a1 + 32);
  void block[4] = *(void *)(a1 + 40);
  id v15 = v9;
  id v16 = v8;
  id v17 = v7;
  id v18 = *(id *)(a1 + 48);
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  os_activity_apply(v10, block);
}

void sub_1000301C8(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loggingDescription]);
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: escrow proxy request returned", buf, 0xCu);
  }

  id v5 = *(id *)(a1 + 40);
  id v6 = *(void **)(a1 + 32);
  if (!v5)
  {
    id v13 = objc_msgSend( objc_alloc((Class)objc_msgSend(v6, "responseClass")),  "initWithURLResponse:data:",  *(void *)(a1 + 48),  *(void *)(a1 + 56));
    id v5 = (id)objc_claimAutoreleasedReturnValue([v13 error]);

    if (!v5) {
      goto LABEL_23;
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 error]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
    id v5 = (id)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"retryAfterDate"]);

    if (v5)
    {
      uint64_t v17 = CloudServicesLog(v16);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000473AC((uint64_t)v5, v18, v19);
      }

      objc_storeStrong((id *)&qword_100078FF0, v5);
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v13 error]);
    goto LABEL_16;
  }

  id v7 = [v6 pinningFailure];
  if ((_DWORD)v7)
  {
    uint64_t v8 = CloudServicesLog(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100047418(v9);
    }

    int v10 = sub_1000052A8();
    id v11 = &stru_10006AB28;
    if (v10) {
      id v11 = @", please see rdar://problem/15631298";
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  310LL,  v5,  @"Certificate pinning error%@",  v11));
    id v13 = 0LL;
LABEL_16:

    if (!v12)
    {
      id v5 = 0LL;
      goto LABEL_23;
    }

    id v5 = (id)v12;
    goto LABEL_19;
  }

  id v13 = 0LL;
LABEL_19:
  uint64_t v20 = CloudServicesLog(v7);
  int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_100047324((uint64_t)v5, v21);
  }

LABEL_23:
  NSErrorUserInfoKey v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000304A4;
  block[3] = &unk_1000698E0;
  id v23 = *(id *)(a1 + 64);
  id v28 = v5;
  id v29 = v23;
  id v27 = v13;
  id v24 = v5;
  id v25 = v13;
  dispatch_async(v22, block);
}

uint64_t sub_1000304A4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_100030954(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 operations]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100030A00;
  v10[3] = &unk_100069A48;
  id v8 = *(id *)(a1 + 32);
  id v11 = v6;
  id v12 = v8;
  uint64_t v13 = a4;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v10];
}

uint64_t sub_100030A00(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  char v8 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  char v7 = v8;
  *a4 = v8;
  **(_BYTE **)(a1 + 4_Block_object_dispose(va, 8) = v7;
  return result;
}

void sub_100031830( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47)
{
}

void sub_100031870(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (([a2 isEqual:v5] & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
    [*(id *)(a1 + 40) insertObject:v5 atIndex:0];
  }

  unsigned __int8 v6 = [v5 isComplete];
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v7 + 9)) {
    unsigned __int8 v8 = v6;
  }
  else {
    unsigned __int8 v8 = 0;
  }
  *(_BYTE *)(v7 + 9) = v8;
  unsigned __int8 v9 = [v5 isStaleWithcontext:*(void *)(a1 + 48)];
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v10 + 10)) {
    unsigned __int8 v11 = v9;
  }
  else {
    unsigned __int8 v11 = 0;
  }
  *(_BYTE *)(v10 + 10) = v11;
  unint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
  id v13 = [*(id *)(a1 + 48) operationRecordRetentionMaxCount];
  unsigned int v14 = [v5 isComplete];
  if (v12 >= (unint64_t)v13)
  {
    id v15 = @"incomplete";
    if (v14) {
      id v15 = @"complete";
    }
    uint64_t v16 = v15;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 startTimestamp]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](&OBJC_CLASS___NSTimeZone, "defaultTimeZone"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSISO8601DateFormatter stringFromDate:timeZone:formatOptions:]( &OBJC_CLASS___NSISO8601DateFormatter,  "stringFromDate:timeZone:formatOptions:",  v17,  v18,  1907LL));

    uint64_t v21 = CloudServicesLog(v20);
    NSErrorUserInfoKey v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 48) operationRecordRetentionMaxCount]));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 id]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
      int v26 = 138413058;
      id v27 = v23;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      uint64_t v31 = v25;
      __int16 v32 = 2112;
      uint64_t v33 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Total operation count is greater than %@, reaping %@ operation %@ from %@.",  (uint8_t *)&v26,  0x2Au);
    }

    [*(id *)(a1 + 56) addObject:v5];
  }

  else
  {
    if ((v14 & 1) == 0) {
      [*(id *)(a1 + 64) addObject:v5];
    }
    [*(id *)(a1 + 72) insertObject:v5 atIndex:0];
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
  }
}

void sub_100032114( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_100032170(void *a1, void *a2)
{
  id v21 = a2;
  if ([v21 shouldReap])
  {
    uint64_t v3 = (void *)a1[6];
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v21 activity]);
    [v3 addObject:v4];

    id v5 = (void *)a1[4];
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v21 activity]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 operations]);
    [v5 addObjectsFromArray:v7];
  }

  else
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v21 activity]);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 operations]);
    *(void *)(*(void *)(a1[11] + 8) + 24) += [v9 count];

    uint64_t v10 = (void *)a1[4];
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v21 reapedOperations]);
    [v10 addObjectsFromArray:v11];

    unint64_t v12 = (void *)a1[5];
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v21 activity]);
    [v12 insertObject:v6 atIndex:0];
  }

  if ([v21 didChange])
  {
    id v13 = (void *)a1[7];
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v21 activity]);
    [v13 addObject:v14];

    id v15 = (void *)a1[8];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v21 updatedOperations]);
    [v15 addObjectsFromArray:v16];
  }

  if (([v21 isComplete] & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[12] + 8LL) + 24LL) = 0;
    uint64_t v17 = (void *)a1[9];
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v21 activity]);
    [v17 addObject:v18];

    uint64_t v19 = (void *)a1[10];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v21 activeOperations]);
    [v19 addObjectsFromArray:v20];
  }
}

uint64_t sub_10003343C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  id v4 = &selRef_silent;
  id v5 = &selRef_silent;
  while (2)
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v6 = 0;
    unsigned int v7 = 0;
    unint64_t v8 = 0LL;
    while (1)
    {
      unint64_t v9 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v9 == -1LL || v9 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v10 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v9);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v9 + 1;
      v8 |= (unint64_t)(v10 & 0x7F) << v6;
      if ((v10 & 0x80) == 0) {
        goto LABEL_12;
      }
      v6 += 7;
      BOOL v11 = v7++ >= 9;
      if (v11)
      {
        unint64_t v8 = 0LL;
        int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
    int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v8 = 0LL;
    }
LABEL_14:
    if (v12 || (v8 & 7) == 4) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v8 >> 3))
    {
      case 1u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v16 = *((int *)v4 + 529);
        goto LABEL_39;
      case 2u:
        uint64_t v18 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v18);
        uint64_t v16 = *((int *)v5 + 530);
        goto LABEL_39;
      case 3u:
        uint64_t v19 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v19);
        uint64_t v16 = 16LL;
        goto LABEL_39;
      case 4u:
        uint64_t Data = PBReaderReadData(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v16 = 40LL;
        goto LABEL_39;
      case 5u:
        uint64_t v21 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v21);
        uint64_t v16 = 96LL;
        goto LABEL_39;
      case 6u:
        uint64_t v22 = PBReaderReadData(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v22);
        uint64_t v16 = 88LL;
        goto LABEL_39;
      case 7u:
        uint64_t v23 = PBReaderReadData(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v23);
        uint64_t v16 = 80LL;
        goto LABEL_39;
      case 8u:
        uint64_t v24 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v24);
        uint64_t v16 = 104LL;
        goto LABEL_39;
      case 9u:
        uint64_t v25 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v25);
        uint64_t v16 = 8LL;
        goto LABEL_39;
      case 0xAu:
        uint64_t v26 = PBReaderReadData(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v26);
        uint64_t v16 = 48LL;
        goto LABEL_39;
      case 0xBu:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0LL;
        *(_BYTE *)(a1 + 112) |= 1u;
        while (2)
        {
          unint64_t v30 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v30 == -1LL || v30 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v31 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v30);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v11 = v28++ >= 9;
              if (v11)
              {
                LODWORD(v29) = 0;
                goto LABEL_48;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v29) = 0;
        }
LABEL_48:
        *(_DWORD *)(a1 + 72) = v29;
        goto LABEL_40;
      case 0xCu:
        uint64_t v32 = PBReaderReadData(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v32);
        uint64_t v16 = 24LL;
LABEL_39:
        uint64_t v33 = *(void **)(a1 + v16);
        *(void *)(a1 + v16) = v15;

        goto LABEL_40;
      case 0xDu:
        uint64_t v34 = v5;
        uint64_t v35 = v4;
        uint64_t v36 = objc_alloc_init(&OBJC_CLASS___EscrowPrerecordPasscodeGeneration);
        objc_storeStrong((id *)(a1 + 64), v36);
        v37[0] = 0xAAAAAAAAAAAAAAAALL;
        v37[1] = 0xAAAAAAAAAAAAAAAALL;
        if (PBReaderPlaceMark(a2, v37) && (sub_1000408C0((uint64_t)v36, a2) & 1) != 0)
        {
          PBReaderRecallMark(a2, v37);

          id v4 = v35;
          id v5 = v34;
LABEL_40:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0LL;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_40;
    }
  }

void sub_100034AEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    char v6 = v5;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  305LL,  v5,  @"Error getting account info"));
  }

  else
  {
    unint64_t v9 = @"EscrowServiceAccountInfo";
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 accountInfo]);
    char v10 = v8;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000352A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CloudServicesLog(v6);
  unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v5;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Fetched certificates with result: %@ %@)",  (uint8_t *)&v22,  0x16u);
  }

  if (v6)
  {
    uint64_t v10 = CloudServicesLog(v9);
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100047870();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);

    if (v12)
    {
      uint64_t v14 = CloudServicesLog(v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000477F0(v5, v15);
      }

      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = (StoredCertificate *)objc_claimAutoreleasedReturnValue([v5 error]);
      (*(void (**)(uint64_t, void, StoredCertificate *))(v16 + 16))(v16, 0LL, v17);
    }

    else
    {
      if (v5)
      {
        uint64_t v17 = objc_alloc_init(&OBJC_CLASS___StoredCertificate);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) iCloudEnv]);
        -[StoredCertificate setICloudEnvironment:](v17, "setICloudEnvironment:", v18);

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) baseURL]);
        -[StoredCertificate setEscrowBaseURL:](v17, "setEscrowBaseURL:", v19);

        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dsid]);
        -[StoredCertificate setDsid:](v17, "setDsid:", v20);

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 cert]);
        -[StoredCertificate setEscrowCertificate:](v17, "setEscrowCertificate:", v21);
      }

      else
      {
        uint64_t v17 = 0LL;
      }

      (*(void (**)(void, StoredCertificate *, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v17,  0LL);
    }
  }
}

uint64_t sub_100035570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (!(a3 | a4)) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, a2, 0LL);
  }
  if (!a3) {
    a3 = a4;
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, 0LL, a3);
}

void sub_100035834( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

uint64_t sub_10003587C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003588C(uint64_t a1)
{
}

void sub_100035894(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100035928;
  v4[3] = &unk_100069B58;
  __int128 v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v3 _fetchCertificatesWithRequest:v2 duplicate:0 completionBlock:v4];
}

void sub_100035928(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000359B0(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100035A44;
  v4[3] = &unk_100069B58;
  __int128 v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v3 _fetchCertificatesWithRequest:v2 duplicate:1 completionBlock:v4];
}

void sub_100035A44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  [v7 logResultForEvent:CloudServicesAnalyticsDoubleGetClubCert hardFailure:1 result:v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v13 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100035AFC(void *a1)
{
  uint64_t v2 = CloudServicesLog(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1[5] + 8LL) + 40LL);
    uint64_t v5 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
    uint64_t v6 = *(void *)(*(void *)(a1[7] + 8LL) + 40LL);
    uint64_t v7 = *(void *)(*(void *)(a1[8] + 8LL) + 40LL);
    int v11 = 138413058;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Returning fetch result of: %@ %@ %@ %@)",  (uint8_t *)&v11,  0x2Au);
  }

  uint64_t v8 = *(void **)(*(void *)(a1[7] + 8LL) + 40LL);
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 escrowCertificate]);
    [*(id *)(*(void *)(a1[5] + 8) + 40) setDuplicateEscrowCertificate:v9];
  }

  return (*(uint64_t (**)(void))(a1[4] + 16LL))();
}

void sub_100036830( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, char a44)
{
}

void sub_100036870(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 operationsLogger]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) endEventWithResults:v9 error:v6]);
  [v7 updateStoreWithEvent:v8];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10003690C(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000369A0;
  v4[3] = &unk_100069BD0;
  __int128 v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v3 _storeRecordWithRequest:v2 duplicate:0 completionBlock:v4];
}

void sub_1000369A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100036A28(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100036ABC;
  v4[3] = &unk_100069BD0;
  __int128 v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v3 _storeRecordWithRequest:v2 duplicate:1 completionBlock:v4];
}

void sub_100036ABC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  [v7 logResultForEvent:CloudServicesAnalyticsDoubleEnrollment hardFailure:1 result:v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v13 = v5;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100036B74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) requiresDoubleEnrollment];
  if ((_DWORD)v2)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)
      && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
    {
      uint64_t v6 = CloudServicesLog(v2);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) passphrase]);
        if (v8) {
          uint64_t v9 = "YES";
        }
        else {
          uint64_t v9 = "NO";
        }
        else {
          uint64_t v10 = "NO";
        }
        int v14 = 136315394;
        __int16 v15 = v9;
        __int16 v16 = 2080;
        __int16 v17 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Double enrollment succeeded (passphrase: %s) (PCS: %s)",  (uint8_t *)&v14,  0x16u);
      }

      unsigned int v11 = [*(id *)(a1 + 32) icdp];
      id v12 = *(void **)(a1 + 32);
      if (v11)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 passphrase]);
        if (v13)
        {
        }

        else if (([*(id *)(a1 + 32) stingray] & 1) == 0)
        {
          return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
        }
      }

      else if (![v12 stingray])
      {
        return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
      }

      [*(id *)(a1 + 40) _performPostEnrollSilentRecoveryWithRequest:*(void *)(a1 + 32)];
      return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }

    uint64_t v3 = CloudServicesLog(v2);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100047AB0();
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100036EB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 cert]);
    [*(id *)(a1 + 32) setCertData:v18];

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) certData]);
    if (v19)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dsid]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 dsid]);
      unsigned __int8 v22 = [v20 isEqualToString:v21];

      if ((v22 & 1) != 0)
      {
        [*(id *)(a1 + 40) storeRecordWithCertDataRequest:*(void *)(a1 + 32) duplicate:*(unsigned __int8 *)(a1 + 56) completionBlock:*(void *)(a1 + 48)];
        goto LABEL_21;
      }

      uint64_t v27 = CloudServicesLog(v23);
      unsigned int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100047B1C((id *)(a1 + 32), v5, v28);
      }

      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  kEscrowServiceErrorDomain,  99LL,  @"Mismatched user credential"));
    }

    else
    {
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  kEscrowServiceErrorDomain,  124LL,  @"Unexpected error with encoded certificate"));
      uint64_t v25 = CloudServicesLog(v24);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412290;
        unint64_t v30 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Certificate encoding error: %@",  (uint8_t *)&v29,  0xCu);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

    goto LABEL_21;
  }

  uint64_t v7 = v6;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, NSUnderlyingErrorKey);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  id v11 = [v10 code];
  if (v11 == (id)401) {
    id v12 = @"Unauthorized";
  }
  else {
    id v12 = @"Unexpected error getting club cert";
  }
  if (v11 == (id)401) {
    uint64_t v13 = 99LL;
  }
  else {
    uint64_t v13 = 96LL;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v12,  NSLocalizedDescriptionKey);
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kEscrowServiceErrorDomain,  v13,  v8));

  uint64_t v16 = CloudServicesLog(v15);
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100047BE0();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_21:
}

LABEL_36:
        id v39 = CloudServicesLog(v31);
        NSErrorUserInfoKey v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue([v22 recordID]);
          *(_DWORD *)__int128 buf = 138412290;
          id v52 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Attempting to store/update a escrow record: %@",  buf,  0xCu);
        }

        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_100037878;
        v43[3] = &unk_100069C48;
        __int16 v48 = v9;
        uint64_t v44 = v8;
        __int128 v45 = self;
        id v46 = v22;
        __int16 v47 = v10;
        [v46 performRequestWithHandler:v43];

        id v12 = v32;
        goto LABEL_39;
      }

      if (v28)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "EscrowService: Using provided escrow record contents",  buf,  2u);
      }

      __int128 v49 = 0LL;
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[EscrowService createEscrowBlobWithCertificate:escrowRequest:error:]( &OBJC_CLASS___EscrowService,  "createEscrowBlobWithCertificate:escrowRequest:error:",  v10,  v22,  &v49));
      id v12 = (__CFString *)v49;
      [v22 setBlob:v37];

      id v38 = (void *)objc_claimAutoreleasedReturnValue([v22 blob]);
      if (v38)
      {
        uint64_t v32 = v12;
        goto LABEL_36;
      }

      id v42 = CloudServicesLog(v31);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v52 = v12;
        uint64_t v36 = "Failed to create escrow blob: %@";
        goto LABEL_30;
      }
    }

void sub_100037878(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, NSUnderlyingErrorKey);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    if ([v10 code] == (id)401)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  @"Unauthorized",  NSLocalizedDescriptionKey);
      uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kEscrowServiceErrorDomain,  99LL,  v8));

      id v7 = (id)v11;
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    id v12 = [*(id *)(a1 + 32) stingray];
    if ((v12 & 1) != 0
      || (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 bypassToken]), v13, !v13))
    {
      uint64_t v16 = CloudServicesLog(v12);
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Missing bypass token (might not be hooked up in iCloud yet)",  buf,  2u);
      }
    }

    else
    {
      [*(id *)(a1 + 40) _removeBypassToken];
      int v14 = *(void **)(a1 + 40);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 bypassToken]);
      [v14 _saveBypassToken:v15];
    }

    uint64_t v18 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    id v22 = 0LL;
    unsigned __int8 v20 = [v18 _invalidateEscrowCache:v19 error:&v22];
    id v7 = v22;
    if ((v20 & 1) == 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
      goto LABEL_14;
    }

    uint64_t v21 = *(void *)(a1 + 56);
    __int16 v24 = @"EscrowServiceCertificate";
    uint64_t v25 = v21;
    uint64_t v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

LABEL_14:
}

LABEL_20:
    uint64_t v26 = 0;
    goto LABEL_21;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 iCloudEnvironment]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 iCloudEnv]);
  __int16 v17 = [v15 isEqualToString:v16];

  if ((v17 & 1) == 0)
  {
    uint64_t v27 = CloudServicesLog(v18);
    unsigned int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100047D84();
    }

    if (!a6) {
      goto LABEL_20;
    }
    int v29 = kEscrowServiceErrorDomain;
    __int16 v48 = NSLocalizedDescriptionKey;
    __int128 v49 = @"Prerecord for wrong iCloud Environment";
    unint64_t v30 = &v49;
    char v31 = &v48;
LABEL_19:
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v31,  1LL));
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v29,  104LL,  v34));

    goto LABEL_20;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 escrowBaseURL]);
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 baseURL]);
  uint64_t v21 = [v19 isEqualToString:v20];

  if ((v21 & 1) == 0)
  {
    uint64_t v32 = CloudServicesLog(v22);
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100047D58();
    }

    if (!a6) {
      goto LABEL_20;
    }
    int v29 = kEscrowServiceErrorDomain;
    id v46 = NSLocalizedDescriptionKey;
    __int16 v47 = @"Prerecord for wrong escrow URL";
    unint64_t v30 = &v47;
    char v31 = &v46;
    goto LABEL_19;
  }

  else {
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v8 escrowBlob]);
  }
  uint64_t v36 = (void *)v23;
  uint64_t v26 = v23 != 0;
  if (v23)
  {
    [v9 setBlob:v23];
  }

  else
  {
    uint64_t v37 = CloudServicesLog(0LL);
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_100047CCC(v9, v38);
    }

    if (a6)
    {
      id v39 = kEscrowServiceErrorDomain;
      uint64_t v44 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v40 = [v9 duplicate];
      uint64_t v41 = &stru_10006AB28;
      if (v40) {
        uint64_t v41 = @"(duplicate) ";
      }
      id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Prerecord has no %@escrow blob",  v41));
      __int128 v45 = v42;
      id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v39,  105LL,  v43));
    }
  }

LABEL_21:
  return v26;
}

LABEL_11:
    id v7 = 0;
    goto LABEL_12;
  }

  uint64_t v9 = CloudServicesLog(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      __int128 v49 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to fetch the PRK from %@",  buf,  0xCu);
    }

    uint64_t v11 = (os_log_s *)objc_alloc_init(&OBJC_CLASS___AKAccountManager);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s altDSIDForAccount:](v11, "altDSIDForAccount:", v4));
    id v43 = 0LL;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s authKitAccountWithAltDSID:error:](v11, "authKitAccountWithAltDSID:error:", v12, &v43));
    int v14 = v43;
    uint64_t v15 = v14;
    if (v13)
    {
      uint64_t v16 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s passwordResetTokenBackupForAccount:](v11, "passwordResetTokenBackupForAccount:", v13));
      __int16 v17 = CloudServicesLog(v16);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = v18;
      if (v16)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Escrowing an existing PRK", buf, 2u);
        }

        uint64_t v16 = v16;
        unsigned __int8 v20 = v16;
      }

      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1000482B4(v19, v35, v36, v37, v38, v39, v40, v41);
        }

        unsigned __int8 v20 = 0LL;
      }
    }

    else
    {
      unsigned int v28 = CloudServicesLog(v14);
      uint64_t v16 = (id)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
        sub_10004824C((uint64_t)v15, (os_log_s *)v16, v29, v30, v31, v32, v33, v34);
      }
      unsigned __int8 v20 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100048218(v11, v21, v22, v23, v24, v25, v26, v27);
    }
    unsigned __int8 v20 = 0LL;
  }

  return v20;
}

void sub_1000387EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v32 = 0LL;
  unsigned __int8 v9 = [v7 _invalidateEscrowCache:v8 error:&v32];
  id v10 = v32;
  uint64_t v11 = v10;
  if ((v9 & 1) == 0)
  {
    uint64_t v12 = CloudServicesLog(v10);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100047DB0();
    }
  }

  if (v6)
  {
    if ([v6 code] != (id)-6015)
    {
      int v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v15,  NSLocalizedDescriptionKey);

      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v6, NSUnderlyingErrorKey);
      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kEscrowServiceErrorDomain,  99LL,  v14));

      id v6 = (id)v16;
    }

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
    +[NSThread sleepUntilDate:](&OBJC_CLASS___NSThread, "sleepUntilDate:", v17);

    uint64_t v18 = *(void *)(a1 + 64);
    uint64_t v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v5 responseDictionary]);
    (*(void (**)(uint64_t, NSMutableDictionary *, id))(v18 + 16))(v18, v19, v6);
  }

  else
  {
    unsigned __int8 v20 = *(void **)(a1 + 48);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 recoveryData]);
    id v22 = [*(id *)(a1 + 56) stingray];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) iCloudEnv]);
    uint64_t v24 = *(unsigned __int8 *)(a1 + 72);
    id v31 = 0LL;
    id v6 = (id)objc_claimAutoreleasedReturnValue([v20 decodedEscrowRecordFromData:v21 stingray:v22 env:v23 duplicate:v24 error:&v31]);
    id v25 = v31;

    if (v6)
    {
      uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v6,  kEscrowServiceRecordDataKey);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) decodedLabel]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v26,  kEscrowServiceRecordLabelKey);

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) escrowDate]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v27, @"date");

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  @"EscrowOperationSucceeded",  @"EscrowOperationStatus");
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v5 metadata]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v28,  kEscrowServiceRecordMetadataKey);

      int v29 = (void *)objc_claimAutoreleasedReturnValue([v5 fmipRecoveryData]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v29,  @"EscrowServiceFMiPData");

      unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v5 requestUUID]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v30,  @"kEscrowServiceRecoveryUUID");
    }

    else
    {
      uint64_t v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:underlyingError:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:underlyingError:format:",  kCloudServicesErrorDomain,  98LL,  v25,  @"Error deserializing data"));
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }
}

void sub_100038D80(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v5 = [v4 code];
    if (((unint64_t)v5 + 4017 > 0xC || ((1LL << (v5 - 79)) & 0x1085) == 0)
      && v5 != (id)-6014LL
      && v5 != (id)-6012LL)
    {
      unsigned __int8 v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v10,  NSLocalizedDescriptionKey);

      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, NSUnderlyingErrorKey);
      uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kEscrowServiceErrorDomain,  102LL,  v9));

      id v12 = (id)v11;
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

void sub_1000391E8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    goto LABEL_17;
  }

  [*(id *)(a1 + 32) setPasswordMetadataWithRequest:*(void *)(a1 + 40) response:v7 ses:v8];
  id v9 = [v7 clubTypeID];
  if (!v9)
  {
    int v16 = _os_feature_enabled_impl("CloudServices", "UseReqV1");
    id v12 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int v13 = *(unsigned __int8 *)(a1 + 56);
    if (v16)
    {
      BOOL v17 = v13 != 0;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000397AC;
      v25[3] = &unk_100069CE8;
      v25[4] = v12;
      id v27 = *(id *)(a1 + 48);
      id v26 = *(id *)(a1 + 40);
      char v28 = *(_BYTE *)(a1 + 56);
      [v12 _recoverWithVersion:1 req:v11 duplicate:v17 sesWrapper:v8 srpInitResponse:v7 reply:v25];

      uint64_t v15 = v27;
      goto LABEL_9;
    }

    goto LABEL_14;
  }

  if (v9 == (id)1)
  {
    int v10 = _os_feature_enabled_impl("CloudServices", "UseReqV2");
    id v12 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    int v13 = *(unsigned __int8 *)(a1 + 56);
    if (v10)
    {
      BOOL v14 = v13 != 0;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100039494;
      v29[3] = &unk_100069CE8;
      v29[4] = v12;
      id v31 = *(id *)(a1 + 48);
      id v30 = *(id *)(a1 + 40);
      char v32 = *(_BYTE *)(a1 + 56);
      [v12 _recoverWithVersion:2 req:v11 duplicate:v14 sesWrapper:v8 srpInitResponse:v7 reply:v29];

      uint64_t v15 = v31;
LABEL_9:

      goto LABEL_17;
    }

void sub_100039494(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _os_feature_enabled_impl("CloudServices", "ReqV2FallbackToV0");
  if (v6 && v7 && (id v9 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), v8), "isFatalError:", v6), !(_DWORD)v9))
  {
    uint64_t v11 = CloudServicesLog(v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100047EB0();
    }

    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v13 logResultForEvent:CloudServicesAnalyticsRequestV2Fallback hardFailure:1 result:v6];

    BOOL v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(unsigned __int8 *)(a1 + 56);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100039634;
    v20[3] = &unk_100069CC0;
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void **)(a1 + 40);
    id v22 = v17;
    void v20[4] = v18;
    id v21 = v19;
    char v23 = *(_BYTE *)(a1 + 56);
    [v14 _srpInitHelper:v15 duplicate:v16 completionBlock:v20];
  }

  else
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v10 logResultForEvent:CloudServicesAnalyticsRequestV2 hardFailure:1 result:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_100039634(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    [*(id *)(a1 + 32) setPasswordMetadataWithRequest:*(void *)(a1 + 40) response:v7 ses:v8];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10003971C;
    void v12[3] = &unk_100069350;
    id v13 = *(id *)(a1 + 48);
    [v9 _recoverWithVersion:0 req:v10 duplicate:v11 sesWrapper:v8 srpInitResponse:v7 reply:v12];
  }
}

void sub_10003971C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  [v6 logResultForEvent:CloudServicesAnalyticsRequestV2ToV0Fallback hardFailure:1 result:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000397AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _os_feature_enabled_impl("CloudServices", "ReqV1FallbackToV0");
  if (v6 && v7 && (id v9 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), v8), "isFatalError:", v6), !(_DWORD)v9))
  {
    uint64_t v11 = CloudServicesLog(v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100047F10();
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v13 logResultForEvent:CloudServicesAnalyticsRequestV1Fallback hardFailure:1 result:v6];

    BOOL v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(unsigned __int8 *)(a1 + 56);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10003994C;
    v20[3] = &unk_100069CC0;
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void **)(a1 + 40);
    id v22 = v17;
    void v20[4] = v18;
    id v21 = v19;
    char v23 = *(_BYTE *)(a1 + 56);
    [v14 _srpInitHelper:v15 duplicate:v16 completionBlock:v20];
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v10 logResultForEvent:CloudServicesAnalyticsRequestV1 hardFailure:1 result:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_10003994C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    [*(id *)(a1 + 32) setPasswordMetadataWithRequest:*(void *)(a1 + 40) response:v7 ses:v8];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100039A34;
    void v12[3] = &unk_100069350;
    id v13 = *(id *)(a1 + 48);
    [v9 _recoverWithVersion:0 req:v10 duplicate:v11 sesWrapper:v8 srpInitResponse:v7 reply:v12];
  }
}

void sub_100039A34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  [v6 logResultForEvent:CloudServicesAnalyticsRequestV1ToV0Fallback hardFailure:1 result:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100039C74(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 operationsLogger]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) endEventWithResults:v9 error:v6]);
  [v7 updateStoreWithEvent:v8];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

id sub_100039D10()
{
  if (qword_100078FF8 != -1) {
    dispatch_once(&qword_100078FF8, &stru_100069F40);
  }
  return (id)qword_100079000;
}

void sub_100039D50(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "waiting for recover group", buf, 2u);
  }

  id v4 = sub_100039E5C();
  id v5 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = sub_100039E5C();
  id v7 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_group_enter(v7);

  id v9 = *(void **)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100039E9C;
  void v12[3] = &unk_100069300;
  id v10 = v8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = v10;
  uint64_t v14 = v11;
  id v15 = *(id *)(a1 + 48);
  [v9 _recoverActualRecordWithRequest:v10 duplicate:0 completionBlock:v12];
}

id sub_100039E5C()
{
  if (qword_100079008 != -1) {
    dispatch_once(&qword_100079008, &stru_100069F60);
  }
  return (id)qword_100079010;
}

void sub_100039E9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) requiresDoubleEnrollment];
  if ((_DWORD)v7)
  {
    if (!v5 || v6)
    {
      uint64_t v8 = CloudServicesLog(v7);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = 0;
        id v10 = "double recovery skipped because primary recovery failed";
        uint64_t v11 = (uint8_t *)&v16;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }

    else
    {
      if ([*(id *)(a1 + 32) icdp])
      {
        [*(id *)(a1 + 40) _performDoubleRecoveryICDPWithRequest:*(void *)(a1 + 32) primaryResponse:v5];
        goto LABEL_10;
      }

      id v14 = [*(id *)(a1 + 32) stingray];
      if ((_DWORD)v14)
      {
        [*(id *)(a1 + 40) _performDoubleRecoveryStingrayWithRequest:*(void *)(a1 + 32) primaryResponse:v5];
        goto LABEL_10;
      }

      uint64_t v15 = CloudServicesLog(v14);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = 0;
        id v10 = "double recovery requested for invalid request type";
        uint64_t v11 = (uint8_t *)&v17;
        goto LABEL_8;
      }
    }
  }

id sub_10003A1DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) recoverRecordWithRequest:*(void *)(a1 + 40) completionBlock:&stru_100069D50];
}

void sub_10003A1F0(id a1, NSDictionary *a2, NSError *a3)
{
  id v4 = a3;
  uint64_t v5 = CloudServicesLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "silent recovery succeeded", v8, 2u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100047F70();
  }
}

void sub_10003A450(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "waiting for recover group (double recovery)",  buf,  2u);
  }

  id v4 = sub_100039E5C();
  uint64_t v5 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = sub_100039E5C();
  id v7 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_group_enter(v7);

  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003A55C;
  void v12[3] = &unk_100069DC0;
  id v13 = v8;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  id v14 = v10;
  uint64_t v15 = v11;
  [v9 _recoverActualRecordWithRequest:v13 duplicate:1 completionBlock:v12];
}

void sub_10003A55C(id *a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  uint64_t v6 = a3;
  if (!(v5 | v6)) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:format:",  1LL,  @"Recovery seemingly failed with no error"));
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  [v7 logResultForEvent:CloudServicesAnalyticsDoubleRecovery hardFailure:1 result:v6];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:@"kEscrowServiceRecoveryUUID"]);
  [a1[4] setRecoveryUUID:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 objectForKeyedSubscript:@"kEscrowServiceRecoveryUUID"]);
  [a1[4] setDoubleRecoveryUUID:v9];

  uint64_t v11 = CloudServicesLog(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (char *)objc_claimAutoreleasedReturnValue([a1[4] recoveryUUID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([a1[4] doubleRecoveryUUID]);
    int v36 = 138412546;
    uint64_t v37 = v13;
    __int16 v38 = 2112;
    id v39 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "double enrollment recovery: recoveryUUID: %@, doubleRecoveryUUID: %@",  (uint8_t *)&v36,  0x16u);
  }

  uint64_t v16 = CloudServicesLog(v15);
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = v17;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100047FD0();
    }
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "double enrollment recovery succeeded",  (uint8_t *)&v36,  2u);
    }

    uint64_t v19 = kEscrowServiceRecordDataKey;
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 objectForKeyedSubscript:kEscrowServiceRecordDataKey]);
    if (v20)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:v19]);
      id v22 = [v20 isEqualToDictionary:v21];
      int v23 = (int)v22;
      uint64_t v24 = CloudServicesLog(v22);
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = "not ";
        if (v23) {
          id v26 = "";
        }
        int v36 = 136315138;
        uint64_t v37 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "double enrollment recovery: record is %sidentical",  (uint8_t *)&v36,  0xCu);
      }

      id v27 = a1[4];
      if ((v23 & 1) != 0)
      {
        [v27 setRecoveryResult:1];
        uint64_t v18 = 0LL;
      }

      else
      {
        [v27 setRecoveryResult:0];
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:format:",  24LL,  @"Record data does not match"));
      }

      id v30 = objc_alloc(&OBJC_CLASS___EscrowService);
      id v31 = (void *)objc_claimAutoreleasedReturnValue([a1[6] operationsLogger]);
      char v32 = -[EscrowService initWithOperationsLogger:](v30, "initWithOperationsLogger:", v31);

      -[EscrowService logRecoveryResults:completionBlock:]( v32,  "logRecoveryResults:completionBlock:",  a1[4],  &stru_100069D98);
    }

    else
    {
      uint64_t v28 = CloudServicesLog(0LL);
      int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "double enrollment recovery: record data is missing",  (uint8_t *)&v36,  2u);
      }

      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:format:",  23LL,  @"Record data is missing"));
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v33 logResultForEvent:CloudServicesAnalyticsDoubleRecoveryDataMatch3 hardFailure:1 result:v18];
  }

  id v34 = sub_100039E5C();
  uint64_t v35 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v34);
  dispatch_group_leave(v35);
}

void sub_10003A978(id a1, NSDictionary *a2, NSError *a3)
{
  id v4 = a2;
  unint64_t v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = CloudServicesLog(v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100048030();
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"status"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"message"));
    uint64_t v10 = CloudServicesLog(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "double enrollment recovery: logged metrics with status: %@, message: %@",  (uint8_t *)&v12,  0x16u);
    }
  }
}

void sub_10003ABAC(uint64_t a1)
{
  uint64_t v2 = CloudServicesLog(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "waiting for recover group (PCS double recovery)",  buf,  2u);
  }

  id v4 = sub_100039E5C();
  unint64_t v5 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = sub_100039E5C();
  uint64_t v7 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_group_enter(v7);

  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003ACB8;
  void v12[3] = &unk_100069DC0;
  id v13 = v8;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  id v14 = v10;
  uint64_t v15 = v11;
  [v9 _recoverActualRecordWithRequest:v13 duplicate:1 completionBlock:v12];
}

void sub_10003ACB8(id *a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  uint64_t v6 = a3;
  if (!(v5 | v6)) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:format:",  1LL,  @"Recovery seemingly failed with no error"));
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
  [v7 logResultForEvent:CloudServicesAnalyticsDoubleRecoveryPCS hardFailure:1 result:v6];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:@"kEscrowServiceRecoveryUUID"]);
  [a1[4] setRecoveryUUID:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 objectForKeyedSubscript:@"kEscrowServiceRecoveryUUID"]);
  [a1[4] setDoubleRecoveryUUID:v9];

  uint64_t v11 = CloudServicesLog(v10);
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (char *)objc_claimAutoreleasedReturnValue([a1[4] recoveryUUID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([a1[4] doubleRecoveryUUID]);
    int v36 = 138412546;
    uint64_t v37 = v13;
    __int16 v38 = 2112;
    id v39 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "PCS double recovery: recoveryUUID: %@, doubleRecoveryUUID: %@",  (uint8_t *)&v36,  0x16u);
  }

  uint64_t v16 = CloudServicesLog(v15);
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = v17;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100048090();
    }
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "PCS double recovery succeeded",  (uint8_t *)&v36,  2u);
    }

    uint64_t v19 = kEscrowServiceRecordDataKey;
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 objectForKeyedSubscript:kEscrowServiceRecordDataKey]);
    if (v20)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:v19]);
      id v22 = [v20 isEqualToDictionary:v21];
      int v23 = (int)v22;
      uint64_t v24 = CloudServicesLog(v22);
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = "not ";
        if (v23) {
          id v26 = "";
        }
        int v36 = 136315138;
        uint64_t v37 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "PCS double recovery: record is %sidentical",  (uint8_t *)&v36,  0xCu);
      }

      id v27 = a1[4];
      if ((v23 & 1) != 0)
      {
        [v27 setRecoveryResult:1];
        uint64_t v18 = 0LL;
      }

      else
      {
        [v27 setRecoveryResult:0];
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:format:",  24LL,  @"Record data does not match"));
      }

      id v30 = objc_alloc(&OBJC_CLASS___EscrowService);
      id v31 = (void *)objc_claimAutoreleasedReturnValue([a1[6] operationsLogger]);
      char v32 = -[EscrowService initWithOperationsLogger:](v30, "initWithOperationsLogger:", v31);

      -[EscrowService logRecoveryResults:completionBlock:]( v32,  "logRecoveryResults:completionBlock:",  a1[4],  &stru_100069DE0);
    }

    else
    {
      uint64_t v28 = CloudServicesLog(0LL);
      int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "PCS double recovery: record data is missing",  (uint8_t *)&v36,  2u);
      }

      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:format:",  23LL,  @"Record data is missing"));
    }

    [a1[6] ttrForPCSDataMatchFailure:v18];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v33 logResultForEvent:CloudServicesAnalyticsDoubleRecoveryPCSDataMatch hardFailure:1 result:v18];
  }

  id v34 = sub_100039E5C();
  uint64_t v35 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v34);
  dispatch_group_leave(v35);
}

void sub_10003B0E0(id a1, NSDictionary *a2, NSError *a3)
{
  id v4 = a2;
  unint64_t v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = CloudServicesLog(v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000480F0();
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"status"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"message"));
    uint64_t v10 = CloudServicesLog(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PCS double recovery: logged metrics with status: %@, message: %@",  (uint8_t *)&v12,  0x16u);
    }
  }
}

void sub_10003B5A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, char a44)
{
}

void sub_10003B5DC(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 operationsLogger]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) endEventWithResults:v9 error:v6]);
  [v7 updateStoreWithEvent:v8];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10003B678(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003B70C;
  v4[3] = &unk_100069BD0;
  __int128 v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v3 _deleteRecordWithRequest:v2 duplicate:0 completionBlock:v4];
}

void sub_10003B70C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10003B794(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003B828;
  v4[3] = &unk_100069BD0;
  __int128 v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  [v3 _deleteRecordWithRequest:v2 duplicate:1 completionBlock:v4];
}

void sub_10003B828(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = CloudServicesLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to delete double-enrolled record: %@",  (uint8_t *)&v15,  0xCu);
    }
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10003B930(uint64_t a1)
{
  if ([*(id *)(a1 + 32) deleteDoubleOnly])
  {
    uint64_t v2 = *(void *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 72);
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
  }

  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(*(void *)(v2 + 8) + 40LL),  *(void *)(*(void *)(v3 + 8) + 40LL));
}

void sub_10003BAF8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v5, NSUnderlyingErrorKey);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    if ([v8 code] == (id)401)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  @"Unauthorized",  NSLocalizedDescriptionKey);
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kEscrowServiceErrorDomain,  99LL,  v6));
    }

    else
    {
      if ([v5 code] == (id)-6011)
      {
LABEL_9:
        (*(void (**)(void))(a1[6] + 16LL))();

        goto LABEL_12;
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  v5,  @"Error deleting record"));
    }

    int v15 = (void *)v9;

    id v5 = v15;
    goto LABEL_9;
  }

  uint64_t v10 = (void *)a1[4];
  uint64_t v11 = a1[5];
  id v16 = 0LL;
  unsigned __int8 v12 = [v10 _invalidateEscrowCache:v11 error:&v16];
  id v5 = v16;
  if ((v12 & 1) != 0)
  {
    id v13 = &__NSDictionary0__struct;
    id v14 = 0LL;
  }

  else
  {
    id v13 = 0LL;
    id v14 = v5;
  }

  (*(void (**)(void, void *, id))(a1[6] + 16LL))(a1[6], v13, v14);
LABEL_12:
}

void sub_10003BE78(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v9 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 operationsLogger]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) endEventWithResults:v9 error:v6]);
  [v7 updateStoreWithEvent:v8];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10003BF14(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v5, NSUnderlyingErrorKey);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    if ([v8 code] == (id)401)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  @"Unauthorized",  NSLocalizedDescriptionKey);
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kEscrowServiceErrorDomain,  99LL,  v6));
    }

    else
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  v5,  @"Error updating metadata"));
    }

    id v10 = (id)v9;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

void sub_10003C118(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, NSUnderlyingErrorKey);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    if ([v9 code] == (id)401)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  @"Unauthorized",  NSLocalizedDescriptionKey);
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kEscrowServiceErrorDomain,  99LL,  v7));
    }

    else
    {
      id v12 = [v6 code];
      if (v12 == (id)-4007LL || v12 == (id)-4002LL) {
        goto LABEL_9;
      }
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  v6,  @"SMS challenge error"));
    }

    id v13 = (void *)v10;

    id v6 = v13;
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();

    goto LABEL_10;
  }

  id v14 = @"recoveryChallengeCodeLength";
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a2 smsVerificationCodeLength]);
  int v15 = v11;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_10:
}

void sub_10003C3C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    return;
  }

  id v11 = v4;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, NSUnderlyingErrorKey);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  if ([v7 code] == (id)401)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"Unauthorized",  NSLocalizedDescriptionKey);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kEscrowServiceErrorDomain,  99LL,  v5));
LABEL_8:
    uint64_t v10 = v8;

    id v9 = (id)v10;
    goto LABEL_9;
  }

  if ([v11 code] != (id)-5012)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  v11,  @"Unable to change SMS Target"));
    goto LABEL_8;
  }

  id v9 = v11;
LABEL_9:
  id v12 = v9;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10003C5E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  305LL,  v5,  @"Unable to get target list"));
  }

  else
  {
    id v9 = @"EscrowServiceSMSTargetInfo";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 smsTargetsInfo]);
    uint64_t v10 = v8;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10003C794(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  305LL,  v5,  @"Unable to get country SMS code list"));
  }

  else
  {
    id v9 = @"EscrowServiceCountrySMSCodes";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 countrySMSCodes]);
    uint64_t v10 = v8;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10003CCF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  312LL,  v5,  @"Unable to log metrics"));

    (*(void (**)(void, void, id))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), 0LL, v8);
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = (id)objc_claimAutoreleasedReturnValue([a2 responseDictionary]);
    (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v8, 0LL);
  }
}

void sub_10003CDB0(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.sbd.recoverQueue", v4);
  uint64_t v3 = (void *)qword_100079000;
  qword_100079000 = (uint64_t)v2;
}

void sub_10003CE00(id a1)
{
  dispatch_group_t v1 = dispatch_group_create();
  dispatch_queue_t v2 = (void *)qword_100079010;
  qword_100079010 = (uint64_t)v1;
}

void sub_10003CE20(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

id sub_10003DE74()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  dispatch_group_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierAppleAccount]);
  id v2 = objc_alloc_init(&OBJC_CLASS___AKAccountManager);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue([v0 accountsWithAccountType:v1]);
  id v4 = [v3 countByEnumeratingWithState:&v44 objects:buf count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v45;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v45 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        if ([v2 isPrimaryiCloudAccount:v7])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v44 objects:buf count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

void sub_10003E174(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = CloudServicesLog(v2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000482E8((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
    }

    objc_end_catch();
    JUMPOUT(0x10003DF94LL);
  }

  _Unwind_Resume(exception_object);
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  +[NSXPCListener enableTransactions](&OBJC_CLASS___NSXPCListener, "enableTransactions");
  dispatch_group_t v1 = (void *)os_transaction_create("sbd_start");
  os_log_t v2 = os_log_create("com.apple.sbd", "daemon");
  uint64_t v3 = (void *)qword_100079040;
  qword_100079040 = (uint64_t)v2;

  uint64_t v4 = CloudServicesInitializeLogging(qword_100079040);
  uint64_t v5 = CloudServicesLog(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v23[0] = 67109376;
    v23[1] = getuid();
    __int16 v24 = 1024;
    gid_t v25 = getgid();
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "running as uid %d, gid %d",  (uint8_t *)v23,  0xEu);
  }

  if (_os_feature_enabled_impl("CloudServices", "LogEscrowOperations"))
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SBEscrowOperationLogger);
    uint64_t v8 = (void *)qword_100079030;
    qword_100079030 = (uint64_t)v7;

    uint64_t v9 = objc_alloc(&OBJC_CLASS___SecureBackupDaemonLoggerObservers);
    uint64_t v10 = -[SecureBackupDaemonLoggerObservers initWithLogger:](v9, "initWithLogger:", qword_100079030);
    id v11 = (void *)qword_100079038;
    qword_100079038 = (uint64_t)v10;
  }

  id v12 = objc_alloc(&OBJC_CLASS___SecureBackupDaemon);
  id v13 = -[SecureBackupDaemon initWithOperationsLogger:](v12, "initWithOperationsLogger:", qword_100079030);
  id v14 = (void *)qword_100079018;
  qword_100079018 = (uint64_t)v13;

  int v15 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  id v16 = -[NSXPCListener initWithMachServiceName:](v15, "initWithMachServiceName:", SECURE_BACKUP_SERVICE_NAME);
  uint64_t v17 = (void *)qword_100079020;
  qword_100079020 = (uint64_t)v16;

  [(id)qword_100079020 setDelegate:qword_100079018];
  [(id)qword_100079020 resume];
  uint64_t v18 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  uint64_t v19 = -[NSXPCListener initWithMachServiceName:]( v18,  "initWithMachServiceName:",  SECURE_BACKUP_CONCURRENT_SERVICE_NAME);
  unsigned __int8 v20 = (void *)qword_100079028;
  qword_100079028 = (uint64_t)v19;

  [(id)qword_100079028 setDelegate:qword_100079018];
  [(id)qword_100079028 resume];

  objc_autoreleasePoolPop(v0);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v21 run];

  return 0LL;
}

uint64_t sub_10003E420()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  dispatch_group_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 currentPersona]);

  uint64_t v2 = [v1 isDataSeparatedPersona] ^ 1;
  return v2;
}

LABEL_19:
      }
    }

    else
    {

      uint64_t v9 = 0LL;
    }

LABEL_21:
    uint64_t v26 = CloudServicesLog(v17);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "unable to determine AppleAccount for current persona",  buf,  2u);
    }

uint64_t sub_10003F334(void *a1, uint64_t a2)
{
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(a1[6], a1[7]);
  id v5 = _CloudServicesSignpostLogSystem();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = v6;
  os_signpost_id_t v8 = a1[6];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    uint64_t v9 = a1[4];
    int v14 = 138543618;
    uint64_t v15 = v9;
    __int16 v16 = 1026;
    LODWORD(v17) = a2 == 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  v8,  "BackupRestore",  " CloudServicesSignpostNameSecItemBackupRestore=%{public,signpost.telemetry:string1,name=CloudServicesSignpostNameS ecItemBackupRestore}@  CloudServicesSignpostNameSecItemBackupRestore=%{public,signpost.telemetry:number1,name=Clou dServicesSignpostNameSecItemBackupRestore}d ",  (uint8_t *)&v14,  0x12u);
  }

  id v10 = _CloudServicesSignpostLogSystem();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218754;
    uint64_t v12 = a1[4];
    uint64_t v15 = a1[6];
    __int16 v16 = 2048;
    double v17 = Nanoseconds / 1000000000.0;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    __int16 v20 = 1026;
    BOOL v21 = a2 == 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: BackupRestore  CloudServicesSignpostNameSecItemBackupRestore=%{public,signpost.telemetry:string1,n ame=CloudServicesSignpostNameSecItemBackupRestore}@  CloudServicesSignpostNameSecItemBackupRestore=%{public,signpo st.telemetry:number1,name=CloudServicesSignpostNameSecItemBackupRestore}d ",  (uint8_t *)&v14,  0x26u);
  }

  return (*(uint64_t (**)(void))(a1[5] + 16LL))();
}

uint64_t sub_10003FA14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10003FF6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100040754(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v44 - 184), 8) = a1;
}

uint64_t sub_1000408C0(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0LL;
      *(_BYTE *)(a1 + 16) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1LL || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          uint64_t v14 = 0LL;
          goto LABEL_30;
        }
      }

      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v14 = 0LL;
      }
LABEL_30:
      *(void *)(a1 + _Block_object_dispose((const void *)(v44 - 184), 8) = v14;
    }

    else
    {
      uint64_t result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

LABEL_115:
}

id sub_100042214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleEscrowStoreResults:a2 escrowError:a3 request:*(void *)(a1 + 40) peerID:*(void *)(a1 + 48) newRecordMetadata:*(void *)(a1 + 56) backupKeybag:0 reply:*(void *)(a1 + 64)];
}

void sub_100042BA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32)
{
}

uint64_t sub_100042C04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100042C14(uint64_t a1)
{
}

void sub_100042C1C(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = CloudServicesLog(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  unint64_t v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100048D5C(v12, v15);
    }

    char v16 = (void **)(*(void *)(a1[4] + 8LL) + 40LL);
    double v17 = v12;
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Received bottle entropy for id=%@, including in escrow record",  (uint8_t *)&v20,  0xCu);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a4);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a3);
    char v16 = (void **)(*(void *)(a1[7] + 8LL) + 40LL);
    double v17 = v9;
  }

  id v18 = v17;
  uint64_t v19 = *v16;
  NSXPCListener *v16 = v18;
}

uint64_t sub_100042DF8()
{
  if (qword_100079050 != -1) {
    dispatch_once(&qword_100079050, &stru_10006A0E0);
  }
  dispatch_sync((dispatch_queue_t)qword_100079058, &stru_10006A0A0);
  uint64_t result = dword_100079048;
  if (!dword_100079048)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_100079048;
  }

  return result;
}

void sub_100042E80(id a1)
{
  if (!dword_100079048) {
    dword_100079048 = sub_100042EE4("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

void sub_100042EBC(id a1)
{
  qword_100079058 = (uint64_t)dispatch_queue_create("aks-client-queue", 0LL);
}

uint64_t sub_100042EE4(char *path, const char *a2)
{
  kern_return_t v5;
  CFDictionaryRef v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t result;
  kern_return_t v10;
  io_connect_t connect;
  connect = 0;
  io_service_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3 || (v4 = v3, unsigned int v5 = IOServiceOpen(v3, mach_task_self_, 0, &connect), IOObjectRelease(v4), v5))
  {
    unint64_t v6 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      char v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }

  uint64_t result = connect;
  if (connect)
  {
    id v10 = IOConnectCallMethod(connect, 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100042FD8(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return sub_100042FF0(a1, a2, 0LL, 0, a3, -1, a4);
}

uint64_t sub_100042FF0(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  uint64_t v14 = 3758097084LL;
  mach_port_t v15 = sub_100042DF8();
  if (v15)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      input[2] = a1;
      input[3] = a2;
      input[4] = a3;
      input[5] = a4;
      uint64_t output = 0LL;
      uint32_t outputCnt = 1;
      uint64_t v14 = IOConnectCallMethod(v15, 2u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v14) {
        *a7 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_create_bag",  ":",  187,  "",  0,  "",  "");
  }

  return v14;
}

uint64_t sub_100043144(int a1, void *a2, _DWORD *a3)
{
  mach_port_t v6 = sub_100042DF8();
  if (v6)
  {
    mach_port_t v7 = v6;
    uint64_t result = 3758097090LL;
    if (a2)
    {
      if (a3)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000LL;
        uint64_t input = a1;
        uint64_t result = IOConnectCallMethod(v7, 3u, &input, 1u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
        if (!(_DWORD)result)
        {
          id v9 = calloc(__count, 1uLL);
          *a2 = v9;
          if (v9)
          {
            memcpy(v9, __src, __count);
            uint64_t result = 0LL;
            *a3 = __count;
          }

          else
          {
            return 3758097085LL;
          }
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_save_bag",  ":",  646,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

void sub_1000432CC(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 httpResponse]);
  sub_100005288((void *)&_mh_execute_header, v2, v3, "HTTP Error: %@", v4, v5, v6, v7, 2u);

  sub_10000529C();
}

void sub_100043348(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 responseDictionary]);
  sub_100005288((void *)&_mh_execute_header, v2, v3, "Error returned from iCloud: %@", v4, v5, v6, v7, 2u);

  sub_10000529C();
}

void sub_1000433C4(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136315906;
  uint64_t v4 = "currentBootUUID_block_invoke";
  __int16 v5 = 1024;
  int v6 = a2;
  __int16 v7 = 1040;
  int v8 = 36;
  __int16 v9 = 2080;
  uint64_t v10 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Error parsing boot uuid, UUID may be zeroes: { code: %d, str: %.36s }",  (uint8_t *)&v3,  0x22u);
}

void sub_10004346C(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "currentBootUUID_block_invoke";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Failed to retrieve kern.bootsessionuuid with error code %d",  (uint8_t *)&v2,  0x12u);
}

void sub_1000434F4(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error executing query for daemon container [com.apple.sbd]: %s",  (uint8_t *)&v2,  0xCu);
}

void sub_100043568(os_log_s *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "Error consuming extension for daemon container [com.apple.sbd]: %{darwin.errno}d",  (uint8_t *)v3,  8u);
}

void sub_1000435F4()
{
}

void sub_10004365C()
{
}

void sub_1000436C4()
{
}

void sub_10004372C()
{
}

void sub_100043794( void **a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_10000AA38( (void *)&_mh_execute_header,  a2,  a3,  "SOSBackupSliceKeyBagCreateFromData() failed: %@",  a5,  a6,  a7,  a8,  2u);

  sub_10000529C();
}

void sub_100043804(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10000AA48((void *)&_mh_execute_header, a3, (uint64_t)a3, "No peer for digest %@ found", (uint8_t *)a2);
}

void sub_100043850()
{
}

void sub_1000438B0()
{
}

void sub_10004391C(uint64_t a1, int a2, os_log_s *a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  sub_10000AAA0( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "_sqlite3_maintain_load_factor for %@ failed: %d",  (uint8_t *)&v3);
  sub_10000AA54();
}

void sub_100043994(uint64_t a1, sqlite3 **a2)
{
}

void sub_100043A08()
{
  sub_10000AA10();
}

void sub_100043A84()
{
  sub_10000AA10();
}

void sub_100043B00()
{
  sub_10000AA10();
}

void sub_100043B7C()
{
  sub_10000AA10();
}

void sub_100043BF8()
{
  sub_10000AA10();
}

void sub_100043C74(uint64_t a1, void *a2)
{
  uint8_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 url]);
  sub_100005BCC((void *)&_mh_execute_header, v2, v3, "sqlite3_changes for remove %@ in %@ != 1", v4, v5, v6, v7, 2u);

  sub_10000AA10();
}

void sub_100043D08()
{
  sub_10000AA10();
}

void sub_100043D84()
{
  sub_10000AAC0();
}

void sub_100043E0C()
{
  sub_10000AAC0();
}

void sub_100043E94(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 url]);
  sub_10000AAE8();
  sub_10000AAA0((void *)&_mh_execute_header, a3, v5, "sqlite3_close for %@ failed: %d", v6);

  sub_10000AA10();
}

void sub_100043F1C()
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 url]);
  sub_10000AA68();
  sub_100005BCC((void *)&_mh_execute_header, v2, v3, "create table for %@ failed: %s", v4, v5, v6, v7, v8);

  sub_10000AA10();
}

void sub_100043F9C()
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 url]);
  sub_10000AA68();
  sub_100005BCC((void *)&_mh_execute_header, v2, v3, "table drop for %@ failed: %s", v4, v5, v6, v7, v8);

  sub_10000AA10();
}

void sub_10004401C()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_10000AA20((void *)&_mh_execute_header, v1, (uint64_t)v1, "could not create %@: %@", v2);
  sub_10000AA54();
}

void sub_100044090()
{
}

void sub_1000440F0()
{
}

void sub_100044150( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000441B8()
{
}

void sub_100044218()
{
}

void sub_100044278()
{
}

void sub_1000442D8()
{
}

void sub_100044338(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "not a btree file ", v1, 2u);
}

void sub_100044378()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000AAD0();
  sub_100005BCC((void *)&_mh_execute_header, v1, v2, "could not open %@: %s ", v3, v4, v5, v6, v7);
  sub_10000529C();
}

void sub_1000443F0(os_log_s *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a1, v3, "seq failed: %s", v4);
  sub_10000529C();
}

void sub_10004446C()
{
}

void sub_1000444CC(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  sub_10000AA20( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "unexpected key size: %zd, corrupt btree at %@",  (uint8_t *)&v4);
  sub_10000AA54();
}

void sub_100044548()
{
}

void sub_1000445AC()
{
}

void sub_100044610(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) URL]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) allHeaderFields]);
  int v8 = 138412802;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "unexpected response from escrow proxy: URL: %@, headers: %@, data: %@",  (uint8_t *)&v8,  0x20u);
}

void sub_1000446E0(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSDateUtilities localStringFromDate:](&OBJC_CLASS___CSDateUtilities, "localStringFromDate:", a1));
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a2, v4, "will be available for retry after %@", v5);
}

void sub_100044774()
{
}

void sub_1000447D8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error from escrow proxy: %ld, %@",  (uint8_t *)&v3,  0x16u);
  sub_10000AA54();
}

void sub_100044858(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:a2]);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Our idea of the best silent metadata is: %@",  (uint8_t *)&v5,  0xCu);
}

void sub_1000448F0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = @"no";
  if (a2) {
    int v3 = @"yes";
  }
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "found silent attempt record with id %@ (metadata present %@)",  (uint8_t *)&v4,  0x16u);
}

void sub_10004498C()
{
}

void sub_1000449C4()
{
}

void sub_1000449F0()
{
  uint64_t v0 = sub_100010278();
  _os_crash(v0);
  __break(1u);
}

void sub_100044A04(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to encode body: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100044A78(void *a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a1 command]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordLabel]);
  sub_100010260();
  sub_100010244( (void *)&_mh_execute_header,  v4,  v5,  "Disallowing %@ operation for label %@ (due to com.apple.cloudservices/PCS-UpdateDisabled)",  v6,  v7,  v8,  v9,  v10);

  sub_10000AA10();
}

void sub_100044B0C(void *a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a1 command]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 recordLabel]);
  sub_100010260();
  sub_100010244( (void *)&_mh_execute_header,  v4,  v5,  "Disallowing %@ operation for label %@ (due to com.apple.cloudservices/PCS-NoRecord)",  v6,  v7,  v8,  v9,  v10);

  sub_10000AA10();
}

void sub_100044BA0()
{
}

void sub_100044BCC()
{
}

void sub_100044BF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100044C2C()
{
}

void sub_100044C58()
{
  __int16 v5 = 2080;
  uint64_t v6 = v2;
  if ((v3 & 1) != 0) {
    uint64_t v1 = v2;
  }
  __int16 v7 = 2080;
  uint64_t v8 = v1;
  sub_10002F73C( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "Couldn't back up view %@: backup is%s nil, keybag is%s nil",  v4);
}

void sub_100044CF0()
{
}

void sub_100044D58()
{
}

void sub_100044DB8()
{
}

void sub_100044DE4()
{
}

void sub_100044E10()
{
}

void sub_100044E70( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100044EE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100044F50()
{
}

void sub_100044FB0()
{
}

void sub_100045010()
{
}

void sub_100045070()
{
}

void sub_1000450D0()
{
}

void sub_10004513C()
{
}

void sub_10004519C()
{
}

void sub_1000451FC()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "MGCopyAnswer(%@): %d", v2, 0x12u);
  sub_10000AA54();
}

void sub_10004527C()
{
}

void sub_1000452DC()
{
}

void sub_100045308()
{
}

void sub_100045368()
{
}

void sub_100045394(void *a1)
{
}

void sub_100045414(void *a1, void *a2)
{
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a2 serviceName]);
  sub_10002F794( (void *)&_mh_execute_header,  v3,  v4,  "connection attempt from pid %d to unknown service name %@",  v5,  v6,  v7,  v8,  2u);
}

void sub_1000454BC()
{
}

void sub_1000454E8()
{
}

void sub_100045548()
{
}

void sub_100045574()
{
}

void sub_1000455A0()
{
}

void sub_100045600()
{
  sub_100010234( (void *)&_mh_execute_header,  v0,  v1,  "No preferred or partial bottleIDs bottle IDs, returning whole list",  v2,  v3,  v4,  v5,  v6);
  sub_100010258();
}

void sub_10004562C(void *a1, os_log_s *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 count];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "After filtering, no records are viable for Octagon. Returning all %d records",  (uint8_t *)v3,  8u);
  sub_10000AA54();
}

void sub_1000456B0()
{
}

void sub_100045710()
{
}

void sub_10004573C()
{
}

void sub_10004579C()
{
}

void sub_1000457FC()
{
}

void sub_100045828()
{
  *uint64_t v1 = 136315650;
  sub_10002F710(v2, v3, (uint64_t)v1);
  sub_10002F72C((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);

  sub_10002F78C();
}

void sub_100045870()
{
}

void sub_1000458D0()
{
}

void sub_100045930()
{
}

void sub_10004595C()
{
}

void sub_100045988()
{
}

void sub_1000459B4()
{
  sub_10000AA38( (void *)&_mh_execute_header,  v0,  v1,  "escrowService storeRecordWithRequest: returned: %@",  v2,  v3,  v4,  v5,  v6);
  sub_10000AA54();
}

void sub_100045A14(os_log_s *a1)
{
  uint64_t v2 = sub_10002F784();
  sub_10002F77C(v2);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a1, v3, "failed creating backup semaphore: %s", v4);
  sub_10000529C();
}

void sub_100045A88()
{
}

void sub_100045AB4()
{
}

void sub_100045B14()
{
}

void sub_100045B84()
{
}

void sub_100045BB0()
{
}

void sub_100045C10()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100010258();
}

void sub_100045C3C()
{
}

void sub_100045C68()
{
}

void sub_100045CD0()
{
}

void sub_100045D30()
{
}

void sub_100045D90()
{
}

void sub_100045DBC()
{
}

void sub_100045DE8()
{
}

void sub_100045E48()
{
}

void sub_100045EA8()
{
}

void sub_100045F08(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 escrowInformationMetadata]);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a2, v4, "Our idea of the best silent metadata is: %@", v5);

  sub_10000529C();
}

void sub_100045F88()
{
}

void sub_100046000()
{
  *os_log_t v1 = 136315650;
  sub_10002F710(v2, v3, (uint64_t)v1);
  sub_10002F72C((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);

  sub_10002F78C();
}

void sub_100046048()
{
}

void sub_100046074()
{
}

void sub_1000460A0()
{
}

void sub_1000460CC()
{
  *uint64_t v1 = 136315650;
  sub_10002F710(v2, v3, (uint64_t)v1);
  sub_10002F72C((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);

  sub_10002F78C();
}

void sub_100046114()
{
}

void sub_100046140()
{
  *uint64_t v1 = 136315650;
  sub_10002F710(v2, v3, (uint64_t)v1);
  sub_10002F72C((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);

  sub_10002F78C();
}

void sub_100046188()
{
}

void sub_1000461B4()
{
  *uint64_t v1 = 136315650;
  sub_10002F710(v2, v3, (uint64_t)v1);
  sub_10002F72C((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);

  sub_10002F78C();
}

void sub_1000461FC()
{
}

void sub_100046228()
{
}

void sub_100046254()
{
  sub_100010234( (void *)&_mh_execute_header,  v0,  v1,  "Platform does not support backup keybag recovery; returning spurious success",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100010258();
}

void sub_100046280( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000462EC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100046358()
{
}

void sub_1000463B8()
{
}

void sub_100046418()
{
}

void sub_100046444()
{
}

void sub_1000464A4(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 metadataHash]);
  if (v4) {
    uint64_t v5 = "have";
  }
  else {
    uint64_t v5 = "missing";
  }
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 backOffDate]);
  if (v6) {
    uint64_t v7 = "have";
  }
  else {
    uint64_t v7 = "missing";
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 encodedMetadata]);
  int v11 = 136315650;
  if (v9) {
    uint8_t v10 = "have";
  }
  else {
    uint8_t v10 = "missing";
  }
  __int16 v12 = v5;
  __int16 v13 = 2080;
  uint64_t v14 = v7;
  __int16 v15 = 2080;
  char v16 = v10;
  sub_10002F73C( (void *)&_mh_execute_header,  a2,  v8,  "missing parameter: %s metadataHash, %s backOffDate, %s encodedMetadata",  (uint8_t *)&v11);
}

void sub_1000465B0()
{
}

void sub_1000465DC()
{
}

void sub_10004663C()
{
}

void sub_100046668()
{
  *uint64_t v1 = 136315650;
  sub_10002F710(v2, v3, (uint64_t)v1);
  sub_10002F72C((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);

  sub_10002F78C();
}

void sub_1000466B0()
{
  *uint64_t v1 = 136315650;
  sub_10002F710(v2, v3, (uint64_t)v1);
  sub_10002F72C((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);

  sub_10002F78C();
}

void sub_1000466F8()
{
}

void sub_100046724()
{
}

void sub_100046750(os_log_s *a1)
{
  uint64_t v2 = sub_10002F784();
  sub_10002F77C(v2);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a1, v3, "error opening temp file: %s", v4);
  sub_10000529C();
}

void sub_1000467C4(os_log_s *a1)
{
  uint64_t v2 = sub_10002F784();
  sub_10002F77C(v2);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a1, v3, "error closing temp file: %s", v4);
  sub_10000529C();
}

void sub_100046838(os_log_s *a1)
{
  uint64_t v2 = sub_10002F784();
  sub_10002F77C(v2);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a1, v3, "error unlinking temp file: %s", v4);
  sub_10000529C();
}

void sub_1000468AC()
{
}

void sub_10004690C(os_log_s *a1)
{
  uint64_t v2 = sub_10002F784();
  sub_10002F77C(v2);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a1, v3, "error truncating temp file: %s", v4);
  sub_10000529C();
}

void sub_100046980(os_log_s *a1)
{
  uint64_t v2 = sub_10002F784();
  sub_10002F77C(v2);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a1, v3, "error writing temp file: %s", v4);
  sub_10000529C();
}

void sub_1000469F4(void *a1, uint64_t a2, os_log_s *a3)
{
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  id v7 = [a1 length];
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "writing temp file count = %ld, expected = %lu",  (uint8_t *)&v4,  0x16u);
  sub_10000529C();
}

void sub_100046A84()
{
  uint64_t v0 = sub_10002F784();
  sub_10002F77C(v0);
  sub_10002F794((void *)&_mh_execute_header, v1, v2, "fstat(%d) failed: %s", v3, v4, v5, v6, 2u);
  sub_10000529C();
}

void sub_100046B04(os_log_s *a1)
{
  uint64_t v2 = sub_10002F784();
  sub_10002F77C(v2);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a1, v3, "error reading temp file: %s", v4);
  sub_10000529C();
}

void sub_100046B78(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 134218240;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = *a1;
  sub_10002F748( (void *)&_mh_execute_header,  a2,  a3,  "reading temp file count = %zd, expected = %zu",  *(size_t *)v3,  *(size_t *)&v3[8]);
  sub_10000AA54();
}

void sub_100046BEC()
{
}

void sub_100046C4C()
{
  *uint64_t v1 = 136315650;
  sub_10002F710(v2, v3, (uint64_t)v1);
  sub_10002F72C((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);

  sub_10002F78C();
}

void sub_100046C94()
{
  *uint64_t v1 = 136315650;
  sub_10002F710(v2, v3, (uint64_t)v1);
  sub_10002F72C((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);

  sub_10002F78C();
}

void sub_100046CDC()
{
  *uint64_t v1 = 136315650;
  sub_10002F710(v2, v3, (uint64_t)v1);
  sub_10002F72C((void *)&_mh_execute_header, "%s caught exception: %@: %@", v4, v5);

  sub_10002F78C();
}

void sub_100046D24()
{
}

void sub_100046D84()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10000AA54();
}

void sub_100046DE4()
{
}

void sub_100046E44()
{
}

void sub_100046EA4()
{
}

void sub_100046F04()
{
}

void sub_100046F64()
{
}

void sub_100046FC4()
{
}

void sub_100047024()
{
}

void sub_100047084()
{
}

void sub_1000470E4()
{
}

void sub_100047110()
{
}

void sub_10004713C()
{
}

void sub_100047168()
{
}

void sub_1000471C8()
{
}

void sub_100047228()
{
}

void sub_100047288(os_log_s *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSDateUtilities localStringFromDate:]( &OBJC_CLASS___CSDateUtilities,  "localStringFromDate:",  qword_100078FF0));
  int v4 = 138412290;
  uint64_t v5 = v2;
  sub_10000AA48( (void *)&_mh_execute_header,  a1,  v3,  "retry-after date has not passed, throttling calls to escrow proxy until %@",  (uint8_t *)&v4);
}

void sub_100047324(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[LakituRequest performRequestWithHandler:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: returned error: %@",  (uint8_t *)&v2,  0x16u);
}

void sub_1000473AC(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10000AA48((void *)&_mh_execute_header, a2, a3, "response retry after date = %@", (uint8_t *)&v3);
}

void sub_100047418(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Certificate pinning error", v1, 2u);
}

void sub_100047458(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Got nil event unexpectedly", v1, 2u);
}

void sub_100047498(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 id]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 operationId]);
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint8_t v10 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Got non-matching event: Got %@, expected %@",  (uint8_t *)&v7,  0x16u);
}

void sub_100047558()
{
  sub_10000AA38((void *)&_mh_execute_header, v0, v1, "SecItemAdd() for bypass token returned %ld", v2, v3, v4, v5, v6);
  sub_10000AA54();
}

void sub_1000475BC()
{
  sub_10000AA38( (void *)&_mh_execute_header,  v0,  v1,  "SecItemDelete() for bypass token returned %ld",  v2,  v3,  v4,  v5,  v6);
  sub_10000AA54();
}

void sub_100047620()
{
  sub_10000AA38( (void *)&_mh_execute_header,  v0,  v1,  "SecItemCopyMatching() for bypass token returned %ld",  v2,  v3,  v4,  v5,  v6);
  sub_10000AA54();
}

void sub_100047684()
{
}

void sub_1000476E4()
{
}

void sub_100047744(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 specifiedFederation]);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a2, v4, "Certificate requested for federation %@; terms not accepted", v5);

  sub_10000529C();
}

void sub_1000477C4()
{
}

void sub_1000477F0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 error]);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a2, v4, "unable to fetch certificate (lakitu error): %@", v5);

  sub_10000529C();
}

void sub_100047870()
{
}

void sub_1000478D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100047938( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004799C()
{
}

void sub_1000479C8()
{
}

void sub_1000479F4()
{
}

void sub_100047A20()
{
}

void sub_100047A4C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100047AB0()
{
}

void sub_100047B1C(id *a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 dsid]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 dsid]);
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint8_t v10 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "enrollRequest dsid != %@, certResponse.dsid = %@",  (uint8_t *)&v7,  0x16u);
}

void sub_100047BE0()
{
}

void sub_100047C40()
{
}

void sub_100047CA0()
{
}

void sub_100047CCC(void *a1, os_log_s *a2)
{
}

void sub_100047D58()
{
}

void sub_100047D84()
{
}

void sub_100047DB0()
{
}

void sub_100047E10()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100010258();
}

void sub_100047E3C(void *a1, os_log_s *a2)
{
}

void sub_100047EB0()
{
}

void sub_100047F10()
{
}

void sub_100047F70()
{
}

void sub_100047FD0()
{
}

void sub_100048030()
{
}

void sub_100048090()
{
}

void sub_1000480F0()
{
}

void sub_100048150(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "createPrerecordFromCandidate: no password",  v1,  2u);
}

void sub_100048190(const __CFString **a1, os_log_s *a2)
{
  if (a1) {
    uint64_t v2 = *a1;
  }
  else {
    uint64_t v2 = @"no error pointer";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "createPrerecordFromCandidate: Could not generate escrow record blob: %@",  (uint8_t *)&v3,  0xCu);
}

void sub_100048218( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004824C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000482B4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000482E8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048350()
{
}

void sub_10004837C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No iCloud account yet", v1, 2u);
}

void sub_1000483BC()
{
}

void sub_10004841C()
{
}

void sub_10004847C()
{
}

void sub_1000484DC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048540()
{
}

void sub_1000485B4()
{
}

void sub_100048614()
{
}

void sub_100048674( void **a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_10000AA38((void *)&_mh_execute_header, a2, a3, "CFPropertyListCreateDERData failed: %@", a5, a6, a7, a8, 2u);

  sub_10000529C();
}

void sub_1000486E4( void **a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_10000AA38((void *)&_mh_execute_header, a2, a3, "CFPropertyListCreateWithDERData failed: %@", a5, a6, a7, a8, 2u);

  sub_10000529C();
}

void sub_100048754()
{
}

void sub_1000487B4()
{
}

void sub_1000487E0(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 passphrase]);
  if (v4) {
    uint64_t v5 = @"non-";
  }
  else {
    uint64_t v5 = &stru_10006AB28;
  }
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 smsTarget]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([a1 appleID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 iCloudPassword]);
  int v10 = 138413058;
  if (v8) {
    __int16 v9 = @"non-";
  }
  else {
    __int16 v9 = &stru_10006AB28;
  }
  int v11 = v5;
  __int16 v12 = 2112;
  __int16 v13 = v6;
  __int16 v14 = 2112;
  __int16 v15 = v7;
  __int16 v16 = 2112;
  double v17 = v9;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "attempted to enable backup, with invalid parameters: %@nil recovery password, %@, %@, %@nil iCloud password",  (uint8_t *)&v10,  0x2Au);
}

void sub_100048908()
{
}

void sub_100048968()
{
}

void sub_1000489C8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a2, v4, "SOSCCCopyMyPeerWithNewDeviceRecoverySecret() failed: %@", v5);

  sub_10000529C();
}

void sub_100048A48()
{
}

void sub_100048A74(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 sosPeerID]);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  __int16 v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "New self peer ID (%@) does not match escrow contents (%@), abort",  (uint8_t *)&v6,  0x16u);
}

void sub_100048B24()
{
  sub_10000AA38( (void *)&_mh_execute_header,  v0,  v1,  "SOSPeerInfoCopyBackupKey() returned no backup public key for peer: %@",  v2,  v3,  v4,  v5,  v6);
  sub_10000AA54();
}

void sub_100048B84()
{
}

void sub_100048BE4()
{
}

void sub_100048C10()
{
}

void sub_100048C70()
{
}

void sub_100048C9C()
{
}

void sub_100048CFC()
{
}

void sub_100048D5C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10000AA5C();
  sub_10000AA48((void *)&_mh_execute_header, a2, v4, "Failed to get bottled peer, continuing without it: %@", v5);

  sub_10000529C();
}

id objc_msgSend__restoreKeychainAsyncWithBackupBag_password_keybagDigest_haveBottledPeer_restoredViews_viewsNotToBeRestored_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_restoreKeychainAsyncWithBackupBag:password:keybagDigest:haveBottledPeer:restoredViews:viewsNotToBeRestored:");
}

id objc_msgSend__restoreKeychainAsyncWithPassword_keybagDigest_haveBottledPeer_viewsNotToBeRestored_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreKeychainAsyncWithPassword:keybagDigest:haveBottledPeer:viewsNotToBeRestored:reply:");
}

id objc_msgSend__storeVeeTwoBackupInKVS_forViewName_withKeyStore_manifestDigest_keybagDigest_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storeVeeTwoBackupInKVS:forViewName:withKeyStore:manifestDigest:keybagDigest:");
}

id objc_msgSend_handleEscrowStoreResults_escrowError_request_peerID_newRecordMetadata_backupKeybag_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleEscrowStoreResults:escrowError:request:peerID:newRecordMetadata:backupKeybag:reply:");
}

id objc_msgSend_recordIDAndClientMetadataForSilentAttemptFromRecords_passphraseLength_platform_sosCompatibilityModeEnabled_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordIDAndClientMetadataForSilentAttemptFromRecords:passphraseLength:platform:sosCompatibilityModeEnabled:reply:");
}

id objc_msgSend_sortForMatchingPassphraseLengthAndPlatform_secureBackups_passphraseLength_platform_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortForMatchingPassphraseLengthAndPlatform:secureBackups:passphraseLength:platform:reply:");
}

id objc_msgSend_verifyCertData_withCert_withPubKey_stingray_enroll_altDSID_env_duplicate_sigVerification_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "verifyCertData:withCert:withPubKey:stingray:enroll:altDSID:env:duplicate:sigVerification:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}