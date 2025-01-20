void InstallIOCSNotificationHandler()
{
  os_log_s *v0;
  mach_port_t v1;
  dispatch_queue_attr_s *v2;
  dispatch_queue_s *v3;
  dispatch_source_s *v4;
  os_log_s *v5;
  void handler[4];
  mach_port_name_t v7;
  uint8_t buf[12];
  mach_port_name_t name;
  name = 0;
  if (qword_100010240) {
    return;
  }
  v0 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "IOCS: Installing IOCS notification handler",  buf,  2u);
  }

  qword_100010240 = (uint64_t)calloc(1uLL, 0x10uLL);
  if (mach_port_allocate(mach_task_self_, 1u, &name))
  {
    sub_1000090A0();
  }

  else if (mach_port_insert_right(mach_task_self_, name, name, 0x14u))
  {
    sub_100009020();
  }

  else
  {
    v1 = mach_host_self();
    if (host_set_special_port(v1, 32, name))
    {
      sub_100008FA0();
    }

    else
    {
      if (!mach_port_set_context(mach_task_self_, name, qword_100010240))
      {
        v2 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
        v3 = dispatch_queue_create("com.apple.fs_task_scheduler", v2);
        *(void *)qword_100010240 = v3;
        v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, name, 0LL, v3);
        *(void *)(qword_100010240 + 8) = v4;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_100003718;
        handler[3] = &unk_10000C568;
        v7 = name;
        dispatch_source_set_event_handler(v4, handler);
        v5 = (os_log_s *)oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "IOCS: Successfully installed mach_port",  buf,  2u);
        }

        dispatch_resume(*(dispatch_object_t *)(qword_100010240 + 8));
        return;
      }

      sub_100008F20();
    }
  }

  if (name) {
    mach_port_deallocate(mach_task_self_, name);
  }
}

void sub_100003718(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  if (mach_msg_server_once( (BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))iocompressionstats_notification_server,  0x1000u,  *(_DWORD *)(a1 + 32),  0))
  {
    sub_100008F20();
  }

  objc_autoreleasePoolPop(v2);
}

void fetch_and_process_iocs_store_buffer(int a1, int a2)
{
  size_t __size = 0LL;
  int v10 = a1;
  if (sysctlbyname("vfs.io_compression_dump_stats", 0LL, &__size, &v10, 4uLL))
  {
    v3 = (os_log_s *)oslog;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    v4 = "IOCS: Failed to get buffer length\n";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
    return;
  }

  if (__size >= 0x6400001)
  {
    v3 = (os_log_s *)oslog;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    v4 = "IOCS: Buffer length needed longer than supported \n";
    goto LABEL_13;
  }

  v5 = calloc(1uLL, __size);
  if (!v5)
  {
    v3 = (os_log_s *)oslog;
    if (!os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    v4 = "IOCS: Failed to allocate buffer for reading iocs_store_buffer_entry\n";
    goto LABEL_13;
  }

  v6 = v5;
  int v7 = sysctlbyname("vfs.io_compression_dump_stats", v5, &__size, &v10, 4uLL);
  v8 = (os_log_s *)oslog;
  BOOL v9 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "IOCS: Failed to get iocs_store_buffer_entry from XNU",  buf,  2u);
    }
  }

  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 67109120;
      int v13 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "IOCS: Sucessfully read iocs_store_buffer. Action = %d",  buf,  8u);
    }

    ProcessIOCSStoreBuffer((uint64_t)v6, __size, a2);
  }

  free(v6);
}

uint64_t iocompressionstats_notification()
{
  v0 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "IOCS: received kernel notification", v2, 2u);
  }

  fetch_and_process_iocs_store_buffer(4, 1);
  return 0LL;
}

void sub_1000039EC( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100003A0C()
{
  return _os_assumes_log(v0);
}

BOOL sub_100003A18()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

  ;
}

void GetWriteSourceFromFilePath(const char *a1, char *a2)
{
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  v3 = (void *)ContainerToBundleIDMap;
  id v4 = [(id)ContainerToBundleIDMap countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        BOOL v9 = objc_autoreleasePoolPush();
        id v10 = [(id)ContainerToBundleIDMap objectForKey:v8];
        if (!strncmp((const char *)[v8 UTF8String], a1, (size_t)objc_msgSend(v8, "length"))
          || strlen(a1) >= 9
          && !strncmp((const char *)[v8 UTF8String], a1 + 8, (size_t)objc_msgSend(v8, "length")))
        {
          strncpy(a2, (const char *)[v10 UTF8String], 0x3FFuLL);
          objc_autoreleasePoolPop(v9);
          return;
        }

        objc_autoreleasePoolPop(v9);
      }

      id v5 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v5);
  }

  v11 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/private/var/mobile/Library/Caches/",  @"/private/var/root/Library/Caches/",  @"/private/var/mobile/Library/Preferences/",  @"/private/var/root/Library/Preferences/",  @"/private/var/mobile/Library/HTTPStorages/",  @"/private/var/root/Library/HTTPStorages/",  @"/private/var/mobile/Library/Logs/",  @"/private/var/root/Library/Logs/",  @"/private/var/mobile/Library/Saved Application State/",  @"/private/var/root/Library/Saved Application State/",  @"/private/var/mobile/Library/Cookies/",  @"/private/var/root/Library/Cookies/",  @"/private/var/mobile/Library/Application Support/",  @"/private/var/root/Library/Application Support/",  @"/private/var/mobile/Library/",  @"/private/var/root/Library/",  @"/private/var/mobile/",  @"/private/var/root/",  @"/private/var/db/",  @"/private/var/log/",  @"/private/var/logs/",  @"/private/var/tmp/",  @"/private/var/preferences/",  @"/private/var/",  @"/dev/",  0LL);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
  if (!v12) {
    goto LABEL_23;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v27;
  while (2)
  {
    for (j = 0LL; j != v13; j = (char *)j + 1)
    {
      if (*(void *)v27 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
      v17 = (const char *)[v16 UTF8String];
      int v18 = [v16 length];
      if (v18 >= 1023) {
        int v19 = 1023;
      }
      else {
        int v19 = v18;
      }
      if (!strncmp(v17, a1, v19))
      {
        v20 = -[NSString componentsSeparatedByString:]( +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1),  "componentsSeparatedByString:",  @"/");
        id v21 = objc_msgSend(objc_msgSend(v16, "componentsSeparatedByString:", @"/"), "count");
        if (-[NSArray count](v20, "count") >= (int)v21)
        {
          id v22 = -[NSArray objectAtIndex:](v20, "objectAtIndex:", (((void)v21 << 32) - 0x100000000LL) >> 32);
          if (([v16 hasSuffix:@"Preferences/"] & 1) != 0
            || [v16 hasSuffix:@"preferences/"])
          {
            v23 = @".plist";
          }

          else
          {
            if (![v16 hasSuffix:@"Saved Application State/"])
            {
              if (![v16 hasSuffix:@"Cookies/"])
              {
                v24 = a2;
                goto LABEL_30;
              }

              v23 = @".binaryCookies";
              v24 = a2;
              goto LABEL_29;
            }

            v23 = @".savedState";
          }

          v24 = a2;
          if (([v22 hasSuffix:v23] & 1) == 0)
          {
LABEL_30:
            strncpy(v24, (const char *)[v22 UTF8String], 0x3FFuLL);
            return;
          }

LABEL_29:
          id v22 = objc_msgSend( v22,  "substringToIndex:",  (int)(objc_msgSend(v22, "length") - -[__CFString length](v23, "length")));
          goto LABEL_30;
        }
      }
    }

    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
    if (v13) {
      continue;
    }
    break;
  }

LABEL_23:
  bzero(a2, 0x3FFuLL);
}

int64_t GetFileExtensionFromFilePath(const char *a1, const char **a2)
{
  int64_t result = strnlen(a1, 0x400uLL);
  if (result < 2) {
    goto LABEL_11;
  }
  uint64_t v5 = result >= 20 ? 20LL : result;
  int64_t v6 = result - 1;
  while (a1[v6] != 46)
  {
    --v6;
    if (!--v5) {
      goto LABEL_11;
    }
  }

  if (v6 == -1) {
LABEL_11:
  }
    int v7 = (const char *)&unk_10000AB0D;
  else {
    int v7 = &a1[v6];
  }
  *a2 = v7;
  return result;
}

BOOL IOCSOpenSQLDB()
{
  if (qword_100010248)
  {
    int v0 = 0;
LABEL_12:
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100009120();
    }
    return v0 == 0;
  }

  v1 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (-[NSFileManager fileExistsAtPath:](v1, "fileExistsAtPath:", @"/var/db/IOCS/IOCSMonitoring.db")) {
    goto LABEL_7;
  }
  v2 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "IOCS: DB file does not exist, creating the file",  (uint8_t *)&v7,  2u);
  }

  if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v1,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/db/IOCS",  0LL,  0LL,  v8))
  {
LABEL_7:
    int v3 = sqlite3_open("/var/db/IOCS/IOCSMonitoring.db", (sqlite3 **)&qword_100010248);
    if (v3)
    {
      int v0 = v3;
      sqlite3_close((sqlite3 *)qword_100010248);
      qword_100010248 = 0LL;
    }

    else
    {
      int v7 = 0LL;
      int v0 = sqlite3_exec((sqlite3 *)qword_100010248, "PRAGMA journal_mode = WAL", 0LL, 0LL, &v7);
      if (v0)
      {
        id v4 = (os_log_s *)oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
          sub_10000914C((uint64_t *)&v7, v0, v4);
        }
      }
    }

    goto LABEL_12;
  }

  int64_t v6 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IOCS: Failed to create DIR", (uint8_t *)&v7, 2u);
  }

  return 0LL;
}

BOOL IOCSDeleteAllRowsSQLDB()
{
  if (qword_100010248)
  {
    if (sqlite3_open("/var/db/IOCS/IOCSMonitoring.db", (sqlite3 **)&qword_100010248))
    {
      sqlite3_close((sqlite3 *)qword_100010248);
      BOOL result = 0LL;
      qword_100010248 = 0LL;
    }

    else
    {
      errmsg = 0LL;
      return sqlite3_exec((sqlite3 *)qword_100010248, "DELETE FROM IOCSTable", 0LL, 0LL, &errmsg) == 0;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_1000091D4();
    }
    return 1LL;
  }

  return result;
}

uint64_t IOCSCloseSQLDB()
{
  uint64_t result = qword_100010248;
  if (qword_100010248)
  {
    uint64_t result = sqlite3_close((sqlite3 *)qword_100010248);
    qword_100010248 = 0LL;
  }

  return result;
}

BOOL IOCSCreateTable()
{
  return sqlite3_exec( (sqlite3 *)qword_100010248,  "CREATE TABLE IF NOT EXISTS IOCSTable( writeSource TEXT,  fileExtension INTEGER,  uncompressedBytes INTEGER, compressedBytes INTEGER,  bufferSizeCompressionDist BLOB,  blockCompressedSizeDist BLOB,  PRIMARY KEY(write Source, fileExtension))",  0LL,  0LL,  0LL) == 0;
}

size_t printLine(int a1)
{
  if (a1 >= 1)
  {
    int v1 = a1;
    do
    {
      fputs("-------------", __stdoutp);
      --v1;
    }

    while (v1);
  }

  return fwrite("-\n", 2uLL, 1uLL, __stdoutp);
}

size_t PrintIOCSStoreBufferEntry(uint64_t a1)
{
  v11 = 0LL;
  GetWriteSourceFromFilePath((const char *)a1, v12);
  GetFileExtensionFromFilePath((const char *)a1, &v11);
  size_t result = printf("IOCS: File Path: %s\nProcess Information: %s\nExtension: %s\n", (const char *)a1, v12, v11);
  if (*(void *)(a1 + 128))
  {
    fprintf(__stdoutp, "TotalUncompressedBytes = %lld\n", *(void *)(a1 + 128));
    fprintf(__stdoutp, "TotalCompressedBytes = %lld\n", *(void *)(a1 + 136));
    fwrite("Block Level compressed buffer size histogram\n", 0x2DuLL, 1uLL, __stdoutp);
    printLine(16);
    for (int i = 0; i != 4096; i += 256)
    {
      if (!i) {
        fputc(124, __stdoutp);
      }
      fprintf(__stdoutp, "  %4d-%4d |", i, i + 255);
    }

    fputc(10, __stdoutp);
    printLine(16);
    for (uint64_t j = 0LL; j != 64; j += 4LL)
    {
      int v5 = *(_DWORD *)(a1 + 424 + j);
      if (!j) {
        fputc(124, __stdoutp);
      }
      fprintf(__stdoutp, "%9d   |", v5);
    }

    fputc(10, __stdoutp);
    printLine(16);
    fwrite("Buffer size (Rows) vs compressibility (Columns) histogram \n", 0x3BuLL, 1uLL, __stdoutp);
    printLine(8);
    fprintf(__stdoutp, "|%12s", (const char *)&unk_10000AB0D);
    for (uint64_t k = 0LL; k != 28; k += 4LL)
    {
      if (!k) {
        fputc(124, __stdoutp);
      }
      fprintf( __stdoutp,  "   %02d - %02d%% |",  *(_DWORD *)((char *)&unk_100009F80 + k),  *(_DWORD *)((char *)&unk_100009F80 + k + 4) - 1);
    }

    fputc(10, __stdoutp);
    printLine(8);
    uint64_t v7 = 0LL;
    uint64_t v8 = a1 + 144;
    do
    {
      fprintf(__stdoutp, "|%12s", (&off_10000C5C8)[v7]);
      for (uint64_t m = 0LL; m != 28; m += 4LL)
      {
        int v10 = *(_DWORD *)(v8 + m);
        if (!m) {
          fputc(124, __stdoutp);
        }
        fprintf(__stdoutp, "%9d   |", v10);
      }

      fputc(10, __stdoutp);
      ++v7;
      v8 += 28LL;
    }

    while (v7 != 10);
    printLine(8);
    return fwrite("\n\n", 2uLL, 1uLL, __stdoutp);
  }

  return result;
}

void ProcessIOCSStoreBuffer(uint64_t a1, uint64_t a2, int a3)
{
  context = objc_autoreleasePoolPush();
  if (IOCSOpenSQLDB())
  {
    if (sqlite3_exec( (sqlite3 *)qword_100010248,  "CREATE TABLE IF NOT EXISTS IOCSTable( writeSource TEXT,  fileExtension INTEGER,  uncompressedBytes INTEGER, compressedBytes INTEGER,  bufferSizeCompressionDist BLOB,  blockCompressedSizeDist BLOB,  PRIMARY KEY(write Source, fileExtension))",  0LL,  0LL,  0LL))
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100009268();
      }
    }

    else
    {
      if (ContainerToBundleIDMap) {
        [(id)ContainerToBundleIDMap removeAllObjects];
      }
      else {
        ContainerToBundleIDMap = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      }
      objc_msgSend( +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"),  "enumerateBundlesOfType:block:",  0,  &stru_10000C638);
      if (a2 >= 1)
      {
        uint64_t v5 = 0LL;
        int v32 = a3;
        uint64_t v31 = a2;
        do
        {
          int64_t v6 = objc_autoreleasePoolPush();
          uint64_t v7 = a1 + v5;
          if (a3 == 1)
          {
            v34 = v6;
            bzero(__s, 0x400uLL);
            v38 = 0LL;
            GetWriteSourceFromFilePath((const char *)v7, __s);
            GetFileExtensionFromFilePath((const char *)v7, &v38);
            BOOL v9 = v38;
            ppStmt = 0LL;
            int v10 = sqlite3_prepare_v2( (sqlite3 *)qword_100010248,  "SELECT uncompressedBytes,compressedBytes,bufferSizeCompressionDist,blockCompressedSizeDist FROM IOCS Table WHERE writeSource = ? AND fileExtension = ?",  -1,  &ppStmt,  0LL);
            if (v10)
            {
              int v11 = v10;
              id v12 = (os_log_s *)oslog;
              if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
              {
                __int128 v30 = sqlite3_errmsg((sqlite3 *)qword_100010248);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&uint8_t buf[4] = v11;
                *(_WORD *)&buf[8] = 2080;
                *(void *)&buf[10] = v30;
                _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "IOCS: SQL table Insert failure: %d %s\n",  buf,  0x12u);
              }

              sqlite3_finalize(ppStmt);
              a3 = v32;
              a2 = v31;
            }

            else
            {
              int v13 = strlen(__s);
              sqlite3_bind_text(ppStmt, 1, __s, v13, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              int v14 = strlen(v9);
              v35 = v9;
              sqlite3_bind_text(ppStmt, 2, v9, v14, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              if (sqlite3_step(ppStmt) != 100) {
                goto LABEL_42;
              }
              int v37 = 0;
              do
              {
                if (v37 >= 1)
                {
                  v15 = (os_log_s *)oslog;
                  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)&uint8_t buf[4] = __s;
                    *(_WORD *)&buf[12] = 2080;
                    *(void *)&buf[14] = v35;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "IOCS: IOCSdb: We should only ever have one row %s %s",  buf,  0x16u);
                  }
                }

                uint64_t v63 = 0LL;
                memset(v62, 0, sizeof(v62));
                __int128 v60 = 0u;
                __int128 v61 = 0u;
                __int128 v58 = 0u;
                __int128 v59 = 0u;
                __int128 v56 = 0u;
                __int128 v57 = 0u;
                __int128 v54 = 0u;
                __int128 v55 = 0u;
                __int128 v52 = 0u;
                __int128 v53 = 0u;
                __int128 v50 = 0u;
                __int128 v51 = 0u;
                __int128 v48 = 0u;
                __int128 v49 = 0u;
                __int128 v46 = 0u;
                __int128 v47 = 0u;
                memset(buf, 0, sizeof(buf));
                sqlite3_int64 v16 = sqlite3_column_int64(ppStmt, 0);
                sqlite3_int64 v17 = sqlite3_column_int64(ppStmt, 1);
                int v18 = sqlite3_column_bytes(ppStmt, 2);
                int v19 = (char *)sqlite3_column_blob(ppStmt, 2);
                int v20 = sqlite3_column_bytes(ppStmt, 3);
                id v21 = (char *)sqlite3_column_blob(ppStmt, 3);
                sqlite3_int64 v22 = *(void *)(v7 + 128) + v16;
                *(void *)&buf[8] = *(void *)(v7 + 136) + v17;
                *(void *)buf = v22;
                if (v19 && v18 == 280)
                {
                  if (v21 && v20 == 64)
                  {
                    uint64_t v23 = 0LL;
                    uint64_t v24 = a1 + 144 + v5;
                    v25 = &buf[16];
                    do
                    {
                      for (uint64_t i = 0LL; i != 28; i += 4LL)
                        *(_DWORD *)&v25[i] = *(_DWORD *)&v19[i] + *(_DWORD *)(v24 + i);
                      ++v23;
                      v25 += 28;
                      v19 += 28;
                      v24 += 28LL;
                    }

                    while (v23 != 10);
                    for (uint64_t j = 0LL; j != 64; j += 4LL)
                      *(_DWORD *)((char *)v62 + j + 8) = *(_DWORD *)&v21[j] + *(_DWORD *)(a1 + 424 + v5 + j);
                    ++v37;
                    sub_1000053A8((sqlite3_int64 *)buf, __s, v35);
                  }

                  else
                  {
                    __int128 v29 = (os_log_s *)oslog;
                    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
                      sub_100009234(&v39, v40, v29);
                    }
                  }
                }

                else
                {
                  __int128 v28 = (os_log_s *)oslog;
                  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
                    sub_100009200(&v41, v42, v28);
                  }
                }
              }

              while (sqlite3_step(ppStmt) == 100);
              a3 = v32;
              a2 = v31;
              if (!v37) {
LABEL_42:
              }
                sub_1000053A8((sqlite3_int64 *)(v7 + 128), __s, v35);
            }

            int64_t v6 = v34;
          }

          else if (!a3)
          {
            uint64_t v8 = v6;
            PrintIOCSStoreBufferEntry(a1 + v5);
            int64_t v6 = v8;
          }

          objc_autoreleasePoolPop(v6);
          uint64_t v5 = (int)v5 + 488;
        }

        while (v5 < a2);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
  {
    sub_100009294();
  }

  objc_autoreleasePoolPop(context);
}

void IOCSPeriodicSyncToCA(_xpc_activity_s *a1)
{
  if (a1)
  {
    if (xpc_activity_should_defer(a1))
    {
      BOOL v2 = xpc_activity_set_state(a1, 3LL);
      int v3 = (os_log_s *)oslog;
      BOOL v4 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
      if (v2)
      {
        if (!v4) {
          return;
        }
        LOWORD(v25[0]) = 0;
        uint64_t v5 = "IOCS: deferring XPC activity";
      }

      else
      {
        if (!v4) {
          return;
        }
        LOWORD(v25[0]) = 0;
        uint64_t v5 = "IOCS: unable to defer XPC activity, abandon";
      }

LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)v25, 2u);
      return;
    }

    fetch_and_process_iocs_store_buffer(1, 1);
    if (xpc_activity_should_defer(a1))
    {
      BOOL v6 = xpc_activity_set_state(a1, 3LL);
      int v3 = (os_log_s *)oslog;
      BOOL v7 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (!v7) {
          return;
        }
        LOWORD(v25[0]) = 0;
        uint64_t v5 = "IOCS: deferring XPC activity";
      }

      else
      {
        if (!v7) {
          return;
        }
        LOWORD(v25[0]) = 0;
        uint64_t v5 = "IOCS: unable to defer XPC activity, abandon";
      }

      goto LABEL_33;
    }
  }

  else
  {
    fetch_and_process_iocs_store_buffer(1, 1);
  }

  ppStmt = 0LL;
  if (sqlite3_prepare_v2( (sqlite3 *)qword_100010248,  "SELECT writeSource, fileExtension, uncompressedBytes, compressedBytes,bufferSizeCompressionDist, blockCompresse dSizeDist FROM IOCSTable",  -1,  &ppStmt,  0LL))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_1000092EC();
    }
    sqlite3_finalize(ppStmt);
  }

  else
  {
    uint64_t v8 = (char *)malloc(0xBuLL);
    BOOL v9 = (os_log_s *)oslog;
    if (v8)
    {
      int v10 = v8;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending IOCS Data to CA, SELECT query succeeded",  (uint8_t *)v25,  2u);
      }

      unsigned int v11 = 0;
      while (sqlite3_step(ppStmt) == 100)
      {
        id v12 = sqlite3_column_text(ppStmt, 0);
        int v13 = sqlite3_column_text(ppStmt, 1);
        unint64_t v14 = sqlite3_column_int64(ppStmt, 2);
        sqlite3_int64 v15 = sqlite3_column_int64(ppStmt, 3);
        sqlite3_int64 v16 = sqlite3_column_blob(ppStmt, 4);
        sqlite3_int64 v17 = (char *)sqlite3_column_blob(ppStmt, 5);
        if (v14 >= 0xA000)
        {
          int v18 = v17;
          uint64_t v19 = 0LL;
          int32x4_t v20 = 0uLL;
          do
          {
            int32x4_t v20 = vaddq_s32(*(int32x4_t *)&v17[v19], v20);
            v19 += 16LL;
          }

          while (v19 != 64);
          if (vaddvq_s32(v20) >= 10)
          {
            strncpy(v10, (const char *)v13, 0xAuLL);
            v10[10] = 0;
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472LL;
            v25[2] = sub_100005514;
            v25[3] = &unk_10000C698;
            v25[4] = v15;
            v25[5] = v14;
            v25[6] = v10;
            v25[7] = v12;
            v25[8] = v18;
            v25[9] = v16;
            analytics_send_event_lazy("com.apple.IOCompressionStats.AggregatedStats", v25);
            ++v11;
            if (a1 && !(v11 % 0xC8) && xpc_activity_should_defer(a1))
            {
              BOOL v21 = xpc_activity_set_state(a1, 3LL);
              sqlite3_int64 v22 = (os_log_s *)oslog;
              BOOL v23 = os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT);
              if (v21)
              {
                if (!v23) {
                  break;
                }
                *(_DWORD *)buf = 67109120;
                unsigned int v28 = v11;
                uint64_t v24 = "IOCS: deferring XPC activity after processing %d rows";
              }

              else
              {
                if (!v23) {
                  break;
                }
                *(_DWORD *)buf = 67109120;
                unsigned int v28 = v11;
                uint64_t v24 = "IOCS: unable to defer XPC activity, abandon after %d rows";
              }

              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 8u);
              break;
            }

            if (v11 == 10001) {
              break;
            }
          }
        }
      }

      free(v10);
    }

    else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
    {
      sub_1000092C0();
    }
  }

  IOCSDeleteAllRowsSQLDB();
}

uint64_t IOCSFeatureEnabled()
{
  return _os_feature_enabled_impl("EmbeddedStorageReporting", "IOCompressionStats");
}

uint64_t EnableIOCSCollection()
{
  int v6 = 0;
  size_t v5 = 4LL;
  int v4 = 1;
  uint64_t v0 = 0xFFFFFFFFLL;
  if (!sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, &v4, 4uLL))
  {
    int v1 = sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, 0LL, 0LL);
    if (v6) {
      BOOL v2 = v1 == 0;
    }
    else {
      BOOL v2 = 0;
    }
    if (v2) {
      return 1LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return v0;
}

uint64_t DisableIOCSCollection()
{
  int v6 = 0;
  size_t v5 = 4LL;
  int v4 = 0;
  uint64_t v0 = 0xFFFFFFFFLL;
  if (!sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, &v4, 4uLL))
  {
    int v1 = sysctlbyname("vfs.io_compression_stats_enable", &v6, &v5, 0LL, 0LL);
    if (v6 != 1 && v1 == 0) {
      return 1LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return v0;
}

uint64_t GetIOCSCollectionStatus()
{
  unsigned int v2 = 0;
  size_t v1 = 4LL;
  if (sysctlbyname("vfs.io_compression_stats_enable", &v2, &v1, 0LL, 0LL)
    && os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
  {
    sub_100009364();
  }

  return v2;
}

id IOCSTaskingEnabled()
{
  uint64_t v0 = (void *)OSAGetDATaskingValue(@"IOCompressionStats");
  if (!v0 || (id result = [v0 intValue], (_DWORD)result != 1))
  {
    id result = (id)os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      sub_100009390();
      return 0LL;
    }
  }

  return result;
}

void ScheduleIOCSTask()
{
}

void sub_10000514C(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if (IOCSTaskingEnabled())
    {
      int v3 = (os_log_s *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IOCS: Tasking enabled", buf, 2u);
      }

      if (GetIOCSCollectionStatus() == 1)
      {
        int v4 = (os_log_s *)oslog;
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v10 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "IOCS: data collection has been running. Syncing data to CA",  v10,  2u);
        }

        InstallIOCSNotificationHandler();
        IOCSPeriodicSyncToCA(a2);
      }

      else
      {
        int v6 = EnableIOCSCollection();
        BOOL v7 = (os_log_s *)oslog;
        if (v6 == 1)
        {
          if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)BOOL v9 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "IOCS: data collection has not been running. Installing IOCS notification handler",  v9,  2u);
          }

          InstallIOCSNotificationHandler();
        }

        else if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
        {
          sub_1000093BC();
        }
      }
    }

    else if (GetIOCSCollectionStatus() == 1)
    {
      size_t v5 = (os_log_s *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "IOCS: tasking is turned off, disabling data collection",  v8,  2u);
      }

      DisableIOCSCollection();
    }
  }
}

void sub_1000052F0(id a1, LSBundleProxy *a2, BOOL *a3)
{
  int v4 = objc_autoreleasePoolPush();
  id v5 = -[LSBundleProxy bundleIdentifier](a2, "bundleIdentifier");
  if (-[LSBundleProxy dataContainerURL](a2, "dataContainerURL"))
  {
    id v6 = objc_msgSend( objc_msgSend(-[LSBundleProxy dataContainerURL](a2, "dataContainerURL"), "path"),  "stringByStandardizingPath");
    [(id)ContainerToBundleIDMap setObject:v5 forKey:v6];
  }

  objc_msgSend( -[LSBundleProxy groupContainerURLs](a2, "groupContainerURLs"),  "enumerateKeysAndObjectsUsingBlock:",  &stru_10000C678);
  objc_autoreleasePoolPop(v4);
}

void sub_100005370(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = objc_msgSend(objc_msgSend(a3, "path"), "stringByStandardizingPath");
  [(id)ContainerToBundleIDMap setObject:a2 forKey:v5];
}

uint64_t sub_1000053A8(sqlite3_int64 *a1, const char *a2, const char *a3)
{
  ppStmt = 0LL;
  if (sqlite3_prepare_v2( (sqlite3 *)qword_100010248,  "REPLACE INTO IOCSTable (writeSource,fileExtension,uncompressedBytes,compressedBytes,bufferSizeCompressionDist,b lockCompressedSizeDist)  VALUES (?,?,?,?,?,?)",  -1,  &ppStmt,  0LL))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100009460();
    }
  }

  else
  {
    int v6 = strlen(a2);
    sqlite3_bind_text(ppStmt, 1, a2, v6, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    int v7 = strlen(a3);
    sqlite3_bind_text(ppStmt, 2, a3, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int64(ppStmt, 3, *a1);
    sqlite3_bind_int64(ppStmt, 4, a1[1]);
    sqlite3_bind_blob(ppStmt, 5, a1 + 2, 280, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_blob(ppStmt, 6, a1 + 37, 64, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (sqlite3_step(ppStmt) != 101 && os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_1000093E8();
    }
  }

  return sqlite3_finalize(ppStmt);
}

xpc_object_t sub_100005514(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "CompressedWriteSize", *(void *)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "UncompressedWriteSize", *(void *)(a1 + 40));
  xpc_dictionary_set_string(v2, "FileExtension", *(const char **)(a1 + 48));
  xpc_dictionary_set_string(v2, "WriteSource", *(const char **)(a1 + 56));
  xpc_dictionary_set_data(v2, "BlockCompressionHistogram", *(const void **)(a1 + 64), 0x40uLL);
  xpc_dictionary_set_data(v2, "BufferSizeCompressionHistogram", *(const void **)(a1 + 72), 0x118uLL);
  return v2;
}

void sub_1000055C4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000055D4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000055E0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
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

int main(int argc, const char **argv, const char **envp)
{
  char is_darwinos = os_variant_is_darwinos(0LL, argv, envp);
  if (argc < 2 || (int v6 = getopt(argc, (char *const *)argv, "fi") << 24, v6 == -16777216))
  {
    syslog(5, "Started");
    xpc_activity_register("com.apple.fs_task_scheduler", XPC_ACTIVITY_CHECK_IN, &stru_10000C720);
    if ((is_darwinos & 1) == 0 && IOCSFeatureEnabled())
    {
      int v7 = os_log_create("com.apple.FSTaskScheduler.IOCS", "main");
      oslog = (uint64_t)v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "IOCS feature is enabled, setting up IOCS periodic job",  v10,  2u);
      }

      ScheduleIOCSTask();
    }

    CFRunLoopRun();
    NSLog(@"FSTaskScheduler :: CALLING FROM END OF RUNLOOP");
  }

  else
  {
    do
    {
      int v8 = v6 >> 24;
      if (v8 != 102)
      {
        if (v8 == 105)
        {
          if (IOCSFeatureEnabled())
          {
            if (GetIOCSCollectionStatus() == 1)
            {
              puts("Force syncing IOCS data to CA");
              IOCSPeriodicSyncToCA(0LL);
            }

            else
            {
              if (EnableIOCSCollection() == 1)
              {
                InstallIOCSNotificationHandler();
                dispatch_main();
              }

              fwrite("Failed to enabled IOCS collection\n", 0x22uLL, 1uLL, __stderrp);
            }
          }

          else
          {
            puts("IOCompressionStats disabled. Enabled the feature flag.");
          }

          exit(0);
        }

        puts("Usage: FSTaskScheduler [-ai]");
        exit(1);
      }

      int v6 = getopt(argc, (char *const *)argv, "fi") << 24;
    }

    while (v6 != -16777216);
    sub_100005808();
  }

  return 0;
}

void sub_100005808()
{
  size_t v1 = CopyFSInfo();
  CFNumberRef storage_capacity = get_storage_capacity();
  if (v1)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_100005884;
    v2[3] = &unk_10000C6E0;
    v2[4] = storage_capacity;
    -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v1, "enumerateKeysAndObjectsUsingBlock:", v2);
  }

id sub_100005884(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(a2, v6) & 1) == 0) {
    a2 = 0LL;
  }
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0) {
    int v8 = a3;
  }
  else {
    int v8 = 0LL;
  }
  id result = [v8 mutableCopy];
  if (a2) {
    BOOL v10 = result == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    unsigned int v11 = result;
    [result enumerateKeysAndObjectsUsingBlock:&stru_10000C700];
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      objc_msgSend( v11,  "setValue:forKey:",  v12,  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "capacityGB"));
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000597C;
    v13[3] = &unk_10000C6C0;
    v13[4] = v11;
    return (id)AnalyticsSendEventLazy(a2, v13);
  }

  return result;
}

uint64_t sub_10000597C(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_100005984(id a1, id a2, id a3, BOOL *a4)
{
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(a2, v6) & 1) == 0) {
    a2 = 0LL;
  }
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(a3, v7) & 1) == 0) {
    a3 = 0LL;
  }
  if (a2) {
    BOOL v8 = a3 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    CFStringRef v9 = buildAggDKey(a2);
    ADClientSetValueForScalarKey(v9, [a3 longLongValue]);
  }

void sub_100005A18(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (&_SBSGetScreenLockStatus)
    {
      if (v2)
      {
        *(_WORD *)int v4 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "FSTaskScheduler :: Sending data to CA",  v4,  2u);
      }

      sub_100005808();
    }

    else if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "FSTaskScheduler :: No SpringBoardServices framework. Not sending FS Stats to CA.",  buf,  2u);
    }

    CFRunLoopRef Main = CFRunLoopGetMain();
    CFRetain(Main);
    CFRunLoopStop(Main);
    CFRelease(Main);
  }

_DWORD *(*iocompressionstats_notification_server_routine(uint64_t a1))(_DWORD *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 5600) {
    return sub_100005B04;
  }
  else {
    return 0LL;
  }
}

_DWORD *sub_100005B04(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    id result = (_DWORD *)iocompressionstats_notification();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t iocompressionstats_notification_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 5600)
  {
    if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }

    else
    {
      *(_DWORD *)(a2 + 32) = iocompressionstats_notification();
    }

    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

uint64_t FSDConnect(const char *a1)
{
  if (IOMainPort(0, &mainPort))
  {
    warnx("IOMasterPort failed");
  }

  else
  {
    int v2 = IOServiceMatching(a1);
    if (v2)
    {
      if (IOServiceGetMatchingServices(mainPort, v2, &existing))
      {
        warnx("IOServiceGetMatchingServices failed");
      }

      else
      {
        fsdService = IOIteratorNext(existing);
        IOObjectRelease(existing);
        if (fsdService)
        {
          if (!IOServiceOpen(fsdService, mach_task_self_, 0, (io_connect_t *)&fsdConnection)) {
            return 1LL;
          }
          warnx("IOServiceOpen failed for class '%s'");
        }

        else
        {
          warnx("No %s instance found");
        }
      }
    }

    else
    {
      warnx("IOServiceMatching failed for %s");
    }
  }

  return 0LL;
}

void FSDDisconnect()
{
  if (fsdConnection && IOServiceClose(fsdConnection)) {
    warnx("IOServiceClose failed");
  }
  fsdConnection = 0;
}

uint64_t GetDiskObject(const char *a1)
{
  io_iterator_t iterator = 0;
  uint64_t v2 = 0LL;
  if (IORegistryEntryCreateIterator(fsdService, "IOService", 0, &iterator))
  {
    int v3 = "IORegistryEntryCreateIterator failed";
  }

  else
  {
    int v3 = "IORegistryEntryGetName failed";
    while (1)
    {
      if ((_DWORD)v2) {
        IOObjectRelease(v2);
      }
      uint64_t v2 = IOIteratorNext(iterator);
      if (IORegistryEntryGetName(v2, name)) {
        break;
      }
      if (!strcmp(name, a1)) {
        goto LABEL_7;
      }
    }
  }

  warnx(v3);
LABEL_7:
  if (iterator) {
    IOObjectRelease(iterator);
  }
  return v2;
}

uint64_t FSDGetInfo(const char *a1, int a2)
{
  if (a2)
  {
    uint64_t result = sub_100005FF8(fsdService, "NAND Controller");
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t result = GetDiskObject(a1);
    if (!(_DWORD)result) {
      return result;
    }
    io_object_t v4 = result;
    if (!sub_100005FF8(result, "NAND Devices"))
    {
      IOObjectRelease(v4);
      return 0LL;
    }
  }

  else
  {
    uint64_t result = GetDiskObject(a1);
    io_object_t v4 = result;
    if (!(_DWORD)result) {
      return result;
    }
  }

  if (sub_1000060B4(v4, @"#ce", (UInt8 *)&gBankCount, 4LL)
    && sub_1000060B4(v4, @"ppn-device", (UInt8 *)&gPpnDevice, 4LL)
    && sub_1000060B4(v4, @"device-readid", (UInt8 *)&v5, 8LL)
    && sub_1000060B4(v4, @"#ce-blocks", (UInt8 *)&gBlocksPerBank, 4LL)
    && sub_1000060B4(v4, @"#block-pages", gPagesPerBlock, 4LL)
    && sub_1000060B4(v4, @"#page-bytes", gBytesPerPage, 4LL))
  {
    gBuses = gBankCount;
    gTotalCAUs = 1;
    gBlocksPerCAU = gBlocksPerBank;
    if (sub_1000060B4(v4, @"ppn-spec-version", (UInt8 *)&gPpnSpecLong, 8LL)) {
      snprintf(gPpnSpec, 0xDuLL, "%llx", gPpnSpecLong);
    }
    gDevID = v5;
  }

  else
  {
    warnx("cannot get basic NAND parameters");
  }

  IOObjectRelease(v4);
  return 1LL;
}

BOOL sub_100005FF8(io_registry_entry_t a1, char *a2)
{
  kern_return_t v5;
  CFMutableDictionaryRef properties;
  puts(a2);
  if (*a2)
  {
    size_t v4 = 0LL;
    do
    {
      putchar(61);
      ++v4;
    }

    while (v4 < strlen(a2));
  }

  putchar(10);
  uint64_t v5 = IORegistryEntryCreateCFProperties(a1, &properties, kCFAllocatorDefault, 0);
  if (v5)
  {
    warnx("IORegistryEntryCreateCFProperties failed");
  }

  else
  {
    TAOCFPrettyPrint(properties);
    CFRelease(properties);
    putchar(10);
  }

  return v5 == 0;
}

BOOL sub_1000060B4(io_registry_entry_t a1, const __CFString *a2, UInt8 *a3, CFIndex a4)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    sub_100006F14();
    return 0LL;
  }

  uint64_t v7 = CFProperty;
  CFTypeID v8 = CFGetTypeID(CFProperty);
  if (v8 != CFNumberGetTypeID())
  {
    CFTypeID v10 = CFGetTypeID(v7);
    if (v10 == CFBooleanGetTypeID())
    {
      *(_DWORD *)a3 = CFBooleanGetValue((CFBooleanRef)v7);
      return 1LL;
    }

    CFTypeID v12 = CFGetTypeID(v7);
    if (v12 == CFDataGetTypeID())
    {
      CFIndex Length = CFDataGetLength((CFDataRef)v7);
      if (Length >= a4) {
        v14.length = a4;
      }
      else {
        v14.length = Length;
      }
      v14.location = 0LL;
      CFDataGetBytes((CFDataRef)v7, v14, a3);
      return 1LL;
    }

    CFTypeID v15 = CFGetTypeID(v7);
    if (v15 == CFArrayGetTypeID())
    {
      gControllers = (uint64_t)v7;
      return 1LL;
    }

    sub_100006F48(v7, v16);
    return 0LL;
  }

  if (a4 < 5) {
    CFNumberType v9 = kCFNumberSInt32Type;
  }
  else {
    CFNumberType v9 = kCFNumberSInt64Type;
  }
  return CFNumberGetValue((CFNumberRef)v7, v9, a3) != 0;
}

uint64_t FSDGetAdvancedInfo(const __CFString *a1, int a2)
{
  io_iterator_t existing = 0;
  size_t v4 = IOServiceMatching("IOMedia");
  IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing);
  if (!existing) {
    return 0LL;
  }
  io_object_t v5 = IOIteratorNext(existing);
  if (v5)
  {
    io_registry_entry_t v6 = v5;
    do
    {
      CFTypeRef v7 = IORegistryEntrySearchCFProperty(v6, "IOService", a1, kCFAllocatorDefault, 3u);
      IOObjectRelease(v6);
      if (!v7) {
        break;
      }
      CFTypeID v8 = CFGetTypeID(v7);
      ValueAtIndex = (const __CFDictionary *)v7;
      if (v8 != CFDictionaryGetTypeID())
      {
        CFTypeID v10 = CFGetTypeID(v7);
        if (v10 != CFArrayGetTypeID()) {
          goto LABEL_66;
        }
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v7, 0LL);
      }

      Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"manufacturer-id");
      if (!Value) {
        goto LABEL_66;
      }
      CFTypeID v12 = Value;
      CFTypeID v13 = CFGetTypeID(Value);
      if (v13 == CFStringGetTypeID())
      {
        CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
        CStringPtr = CFStringGetCStringPtr(v12, SystemEncoding);
        if (CStringPtr)
        {
          strncpy(gManufacturerID, CStringPtr, 0x15uLL)[20] = 0;
        }

        else
        {
          CFStringEncoding v17 = CFStringGetSystemEncoding();
          if (CFStringGetCString(v12, gManufacturerID, 21LL, v17)) {
            byte_1000100F4 = 0;
          }
        }
      }

      else
      {
        CFTypeID v16 = CFGetTypeID(v12);
        if (v16 != CFDataGetTypeID())
        {
          sub_1000070D0(v12);
          goto LABEL_66;
        }

        if (CFDataGetLength((CFDataRef)v12) != 8)
        {
          warnx("Manufacturer ID not 8 bytes as expected\n");
          goto LABEL_66;
        }

        v87.location = 0LL;
        v87.length = 8LL;
        CFDataGetBytes((CFDataRef)v12, v87, buffer);
        snprintf(gManufacturerID, 0x15uLL, "0x%llx", *(void *)buffer);
        gManufacturerIDLong = *(void *)buffer;
      }

      int v18 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"firmware-version");
      if (v18)
      {
        uint64_t v19 = v18;
        CFTypeID v20 = CFGetTypeID(v18);
        if (v20 == CFStringGetTypeID())
        {
          CFStringEncoding v21 = CFStringGetSystemEncoding();
          sqlite3_int64 v22 = CFStringGetCStringPtr(v19, v21);
          if (v22)
          {
            strncpy((char *)gFirmwareVersion, v22, 0x11uLL);
          }

          else
          {
            CFStringEncoding v24 = CFStringGetSystemEncoding();
          }
        }

        else
        {
          CFTypeID v23 = CFGetTypeID(v19);
          if (v23 != CFDataGetTypeID())
          {
            sub_10000709C(v19);
            goto LABEL_66;
          }

          if (CFDataGetLength((CFDataRef)v19) != 16)
          {
            warnx("Firmware Version not the expected size\n");
            goto LABEL_66;
          }

          v88.location = 0LL;
          v88.length = 16LL;
          CFDataGetBytes((CFDataRef)v19, v88, gFirmwareVersion);
        }

        byte_100010123 = 0;
      }

LABEL_26:
      v25 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"msp-version");
      if (!v25) {
        goto LABEL_34;
      }
      __int128 v26 = v25;
      CFTypeID v27 = CFGetTypeID(v25);
      if (v27 != CFStringGetTypeID())
      {
        CFTypeID v30 = CFGetTypeID(v26);
        if (v30 != CFDataGetTypeID())
        {
          sub_100007068(v26);
          goto LABEL_66;
        }

        if (CFDataGetLength((CFDataRef)v26) != 16)
        {
          warnx("MSP Version not the expected size\n");
          goto LABEL_66;
        }

        v89.location = 0LL;
        v89.length = 16LL;
        CFDataGetBytes((CFDataRef)v26, v89, gMSPVersion);
        byte_100010134 = 0;
        goto LABEL_33;
      }

      CFStringEncoding v28 = CFStringGetSystemEncoding();
      __int128 v29 = CFStringGetCStringPtr(v26, v28);
      if (v29)
      {
        strncpy((char *)gMSPVersion, v29, 0x11uLL)[16] = 0;
LABEL_33:
        gMSPVersionPresent = 1;
        goto LABEL_34;
      }

      CFStringEncoding v38 = CFStringGetSystemEncoding();
      if (CFStringGetCString(v26, (char *)gMSPVersion, 17LL, v38))
      {
        gMSPVersionPresent = 1;
        byte_100010134 = 0;
      }

LABEL_34:
      uint64_t v31 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"nand-marketing-name");
      if (!v31) {
        goto LABEL_45;
      }
      int v32 = v31;
      CFTypeID v33 = CFGetTypeID(v31);
      if (v33 == CFStringGetTypeID())
      {
        CFStringEncoding v34 = CFStringGetSystemEncoding();
        v35 = CFStringGetCStringPtr(v32, v34);
        if (v35)
        {
          strncpy((char *)gMarketingName, v35, 0x15uLL);
        }

        else
        {
          CFStringEncoding v39 = CFStringGetSystemEncoding();
        }
      }

      else
      {
        CFTypeID v36 = CFGetTypeID(v32);
        if (v36 != CFDataGetTypeID())
        {
          sub_100007034(v32);
          goto LABEL_66;
        }

        uint64_t Length = CFDataGetLength((CFDataRef)v32);
        if (Length > 20)
        {
          warnx("Marketing Name not the expected size\n");
          goto LABEL_66;
        }

        v90.length = Length;
        v90.location = 0LL;
        CFDataGetBytes((CFDataRef)v32, v90, gMarketingName);
      }

      byte_100010149 = 0;
LABEL_45:
      v40 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"vendor-name");
      if (!v40) {
        goto LABEL_52;
      }
      uint8_t v41 = v40;
      CFTypeID v42 = CFGetTypeID(v40);
      if (v42 != CFStringGetTypeID())
      {
        sub_100007000(v41);
        goto LABEL_66;
      }

      CFStringEncoding v43 = CFStringGetSystemEncoding();
      v44 = CFStringGetCStringPtr(v41, v43);
      if (v44)
      {
        gManufacturerPresent = 1;
        strncpy(gManufacturer, v44, 0x1EuLL);
      }

      else
      {
        CFStringEncoding v45 = CFStringGetSystemEncoding();
        if (!CFStringGetCString(v41, gManufacturer, 30LL, v45)) {
          goto LABEL_52;
        }
        gManufacturerPresent = 1;
      }

      byte_100010112 = 0;
LABEL_52:
      __int128 v46 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"controller-unique-id");
      if (v46)
      {
        __int128 v47 = v46;
        CFTypeID v48 = CFGetTypeID(v46);
        if (v48 != CFStringGetTypeID())
        {
          CFTypeID v51 = CFGetTypeID(v47);
          if (v51 != CFDataGetTypeID())
          {
            sub_100006FCC(v47);
            goto LABEL_66;
          }

          if (CFDataGetLength((CFDataRef)v47) != 16)
          {
            warnx("Controller UID not the expected size\n");
            goto LABEL_66;
          }

          v91.location = 0LL;
          v91.length = 16LL;
          CFDataGetBytes((CFDataRef)v47, v91, v86);
          uint64_t v52 = 0LL;
          gControllerUID = 0;
          __int128 v53 = &byte_10001014B;
          do
          {
            unint64_t v54 = v86[v52];
            *(v53 - fetch_and_process_iocs_store_buffer(4, 1) = a0123456789abcd[v54 >> 4];
            *__int128 v53 = a0123456789abcd[v54 & 0xF];
            v53 += 2;
            ++v52;
          }

          while (v52 != 16);
          goto LABEL_62;
        }

        CFStringEncoding v49 = CFStringGetSystemEncoding();
        __int128 v50 = CFStringGetCStringPtr(v47, v49);
        if (v50)
        {
          strncpy(&gControllerUID, v50, 0x21uLL);
LABEL_62:
          byte_10001016A = 0;
          goto LABEL_63;
        }

        CFStringEncoding v55 = CFStringGetSystemEncoding();
        if (CFStringGetCString(v47, &gControllerUID, 33LL, v55)) {
          goto LABEL_62;
        }
      }

LABEL_63:
      __int128 v56 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"chip-id");
      if (!v56) {
        goto LABEL_87;
      }
      __int128 v57 = v56;
      CFTypeID v58 = CFGetTypeID(v56);
      if (v58 == CFStringGetTypeID())
      {
        CFStringEncoding v60 = CFStringGetSystemEncoding();
        __int128 v61 = CFStringGetCStringPtr(v57, v60);
        if (v61)
        {
          v62 = strncpy(gChipID, v61, 0xDuLL);
          v62[12] = 0;
LABEL_85:
          if ((isPpnDevice(v62) & 1) != 0) {
            gPpnDevice = 1;
          }
        }

        else
        {
          CFStringEncoding v63 = CFStringGetSystemEncoding();
          if (CFStringGetCString(v57, gChipID, 13LL, v63))
          {
            byte_1000102E4 = 0;
            v62 = gChipID;
            goto LABEL_85;
          }
        }

LABEL_87:
        v64 = CFDictionaryGetValue(ValueAtIndex, @"capacity");
        FSDRetrieveValueFromCFNumber(v64, &gCapacity);
        v65 = CFDictionaryGetValue(ValueAtIndex, @"num-bus");
        FSDRetrieveValueFromCFNumber(v65, &gBuses);
        CFArrayRef v84 = (CFArrayRef)CFDictionaryGetValue(ValueAtIndex, @"dies-per-bus");
        if (v84)
        {
          CFIndex v66 = FSDFetchArrayHelper(&v84, 0x10uLL, (char *)gDiesPerBus);
          if (v66 != gBuses) {
            warnx("diesPerBus elements count (%zu) not as expected (%u)\n", v66, gBuses);
          }
        }

        else
        {
          v67 = CFDictionaryGetValue(ValueAtIndex, @"dies-per-channel");
          FSDRetrieveValueFromCFNumber(v67, &v82);
          uint64_t v68 = gBuses;
          if (gBuses)
          {
            v69 = gDiesPerBus;
            int v70 = v82;
            do
            {
              *v69++ = v70;
              --v68;
            }

            while (v68);
          }
        }

        CFArrayRef v83 = (CFArrayRef)CFDictionaryGetValue(ValueAtIndex, @"bus-to-msp");
        if (v83)
        {
          CFIndex v71 = FSDFetchArrayHelper(&v83, 0x10uLL, (char *)&gBusToMsp);
          if (v71 != gBuses) {
            warnx("busToMsp elements count (%zu) not as expected (%u)\n", v71, gBuses);
          }
        }

        else
        {
          uint64_t v72 = gBuses;
          if (gBuses)
          {
            uint64_t v73 = 0LL;
            do
            {
              *((_DWORD *)&gBusToMsp + v73) = v73 >> 1;
              ++v73;
            }

            while (v72 != v73);
          }
        }

        v74 = CFDictionaryGetValue(ValueAtIndex, @"num-dip");
        FSDRetrieveValueFromCFNumber(v74, &gTotalCAUs);
        v75 = CFDictionaryGetValue(ValueAtIndex, @"blocks-per-cau");
        FSDRetrieveValueFromCFNumber(v75, &gBlocksPerCAU);
        v76 = CFDictionaryGetValue(ValueAtIndex, @"page-size");
        FSDRetrieveValueFromCFNumber(v76, &gBytesPerPage);
        v77 = CFDictionaryGetValue(ValueAtIndex, @"pages-per-block-mlc");
        FSDRetrieveValueFromCFNumber(v77, &gPagesPerBlock);
        v78 = CFDictionaryGetValue(ValueAtIndex, @"default-bits-per-cell");
        FSDRetrieveValueFromCFNumber(v78, &gBitsPerCell);
        v79 = CFDictionaryGetValue(ValueAtIndex, @"program-scheme");
        FSDRetrieveValueFromCFNumber(v79, &gPrgmScheme);
        if (a2)
        {
          puts("\nDevice Characteristics:\n");
          TAOCFPrettyPrint((const __CFDictionary *)v7);
        }

        CFRelease(v7);
        uint64_t v59 = 1LL;
        goto LABEL_102;
      }

      sub_100006F98(v57);
LABEL_66:
      CFRelease(v7);
      io_registry_entry_t v6 = IOIteratorNext(existing);
    }

    while (v6);
  }

  uint64_t v59 = 0LL;
LABEL_102:
  if (existing) {
    IOObjectRelease(existing);
  }
  return v59;
}

uint64_t isPpnDevice(const char *a1)
{
  gPpnSpec[0] = 0;
  size_t v2 = strlen(a1);
  uint64_t result = 0LL;
  if (v2 >= 7)
  {
    for (uint64_t i = 0LL; i != 6; ++i)
    {
    }

    if (strlen(a1) < 7)
    {
      uint64_t v9 = 0LL;
    }

    else
    {
      uint64_t v5 = 0LL;
      do
      {
        gPpnSpec[v5] = a1[v5 + 6];
        unsigned int v6 = v5 + 1;
        size_t v7 = strlen(a1);
        size_t v8 = v5 + 7;
        ++v5;
      }

      while (v7 > v8);
      uint64_t v9 = v6;
    }

    gPpnSpec[v9] = 0;
    return 1LL;
  }

  return result;
}

uint64_t FSDHexDump(uint64_t result, _BYTE *a2, unsigned int a3, unsigned int a4)
{
  *a2 = 0;
  if (((2 * a3) | 1) <= a4)
  {
    if (a3)
    {
      int v4 = 0;
      LOBYTE(v5) = 0;
      do
      {
        a2[v5] = a0123456789abcd[(unint64_t)*(unsigned __int8 *)(result + v4) >> 4];
        uint64_t v6 = v5 | 1LL;
        LOBYTE(v5) = v5 + 2;
        a2[v6] = a0123456789abcd[*(_BYTE *)(result + v4++) & 0xF];
      }

      while (a3 > v4);
      uint64_t v5 = v5;
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    a2[v5] = 0;
  }

  return result;
}

void FSDRetrieveValueFromCFNumber(const void *a1, void *a2)
{
  if (a1)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFNumberGetTypeID())
    {
      CFNumberType Type = CFNumberGetType((CFNumberRef)a1);
      if (!CFNumberGetValue((CFNumberRef)a1, Type, a2)) {
        warnx("value could not be copied\n");
      }
    }

    else
    {
      sub_100007104(a1);
    }
  }

CFIndex FSDFetchArrayHelper(CFArrayRef *a1, unint64_t a2, char *a3)
{
  unint64_t Count = CFArrayGetCount(*a1);
  if (Count > a2) {
    return 0LL;
  }
  CFIndex v7 = Count;
  __chkstk_darwin();
  uint64_t v9 = (const void **)((char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v14.location = 0LL;
  v14.length = v7;
  CFArrayGetValues(*a1, v14, v9);
  bzero(a3, 4 * a2);
  if (v7)
  {
    CFIndex v10 = v7;
    do
    {
      unsigned int v11 = *v9++;
      FSDRetrieveValueFromCFNumber(v11, a3);
      a3 += 4;
      --v10;
    }

    while (v10);
  }

  return v7;
}

uint64_t sub_100006EF0(const __CFString *a1)
{
  return CFStringGetCString(a1, v1, 64LL, 0x600u);
}

CFTypeID sub_100006F00(CFTypeRef cf)
{
  return CFGetTypeID(cf);
}

const char *sub_100006F08(CFStringEncoding encoding)
{
  return CFStringGetCStringPtr(v1, encoding);
}

void sub_100006F14()
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  size_t v1 = sub_100006F08(SystemEncoding);
  warnx("error fetching property '%s'", v1);
  sub_100003A00();
}

void sub_100006F48(const void *a1, char *a2)
{
  CFTypeID v3 = CFGetTypeID(a1);
  CFTypeID v4 = CFCopyTypeIDDescription(v3);
  CFStringGetCString(v4, a2, 64LL, 0x600u);
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  uint64_t v6 = sub_100006F08(SystemEncoding);
  warnx("property '%s' has unexpected type '%s'", v6, a2);
  sub_100003A00();
}

void sub_100006F98(const void *a1)
{
  CFTypeID v2 = sub_100006F00(a1);
  CFTypeID v3 = CFCopyTypeIDDescription(v2);
  sub_100006EF0(v3);
  warnx("Chip ID has unexpected type '%s'\n", v1);
  sub_100003A00();
}

void sub_100006FCC(const void *a1)
{
  CFTypeID v2 = sub_100006F00(a1);
  CFTypeID v3 = CFCopyTypeIDDescription(v2);
  sub_100006EF0(v3);
  warnx("Controller UID has unexpected type '%s'\n", v1);
  sub_100003A00();
}

void sub_100007000(const void *a1)
{
  CFTypeID v2 = sub_100006F00(a1);
  CFTypeID v3 = CFCopyTypeIDDescription(v2);
  sub_100006EF0(v3);
  warnx("manufacturer name has unexpected type '%s'\n", v1);
  sub_100003A00();
}

void sub_100007034(const void *a1)
{
  CFTypeID v2 = sub_100006F00(a1);
  CFTypeID v3 = CFCopyTypeIDDescription(v2);
  sub_100006EF0(v3);
  warnx("marketing name has unexpected type '%s'\n", v1);
  sub_100003A00();
}

void sub_100007068(const void *a1)
{
  CFTypeID v2 = sub_100006F00(a1);
  CFTypeID v3 = CFCopyTypeIDDescription(v2);
  sub_100006EF0(v3);
  warnx("msp-version has unexpected type '%s'\n", v1);
  sub_100003A00();
}

void sub_10000709C(const void *a1)
{
  CFTypeID v2 = sub_100006F00(a1);
  CFTypeID v3 = CFCopyTypeIDDescription(v2);
  sub_100006EF0(v3);
  warnx("firmware-version has unexpected type '%s'\n", v1);
  sub_100003A00();
}

void sub_1000070D0(const void *a1)
{
  CFTypeID v2 = sub_100006F00(a1);
  CFTypeID v3 = CFCopyTypeIDDescription(v2);
  sub_100006EF0(v3);
  warnx("manufacturerID has unexpected type '%s'\n", v1);
  sub_100003A00();
}

void sub_100007104(const void *a1)
{
  CFTypeID v2 = sub_100006F00(a1);
  CFTypeID v3 = CFCopyTypeIDDescription(v2);
  sub_100006EF0(v3);
  warnx("value has unexpected type '%s'\n", v1);
  sub_100003A00();
}

void TAOCFPrettyPrint(const __CFDictionary *a1)
{
  v1[2] = __stdoutp;
  v1[0] = 0LL;
  v1[1] = "\t";
  sub_100007200(a1, v1);
}

void TAOCFPrettyPrintToFile(const __CFDictionary *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[0] = 0LL;
  v2[1] = "\t";
  sub_100007200(a1, v2);
}

void TAOCFPrettyPrintWithIndenter(const __CFDictionary *a1, uint64_t a2)
{
  v2[0] = 0LL;
  v2[1] = a2;
  v2[2] = __stdoutp;
  sub_100007200(a1, v2);
}

void TAOCFPrettyPrintToFileWithIndenter(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  v3[0] = 0LL;
  v3[1] = a3;
  v3[2] = a2;
  sub_100007200(a1, v3);
}

void sub_100007200(const __CFDictionary *a1, void *a2)
{
  if (a1)
  {
    CFTypeID v3 = a1;
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFDictionaryGetTypeID())
    {
      CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_10000735C, a2);
      return;
    }

    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID())
    {
      v8.length = CFArrayGetCount(v3);
      v8.location = 0LL;
      CFArrayApplyFunction(v3, v8, (CFArrayApplierFunction)sub_1000073B0, a2);
      return;
    }

    CFTypeID v6 = CFGetTypeID(v3);
    if (v6 == CFTreeGetTypeID())
    {
      sub_100007440(v3, (uint64_t)a2);
      return;
    }

    CFTypeID v7 = CFGetTypeID(v3);
    if (v7 == CFBagGetTypeID())
    {
      CFBagApplyFunction(v3, (CFBagApplierFunction)sub_1000074AC, a2);
      return;
    }

    a1 = v3;
  }

  sub_100007318((uint64_t)a1, (uint64_t)a2);
}

void sub_100007318(uint64_t a1, uint64_t a2)
{
  CFTypeID v3 = (char *)sub_1000074C0(a1);
  sub_100007574(v3, 0LL, a2);
  if (v3) {
    free(v3);
  }
}

void sub_10000735C(uint64_t a1, const void *a2, uint64_t a3)
{
  CFTypeID v5 = (char *)sub_1000074C0(a1);
  sub_100007574(v5, a2, a3);
  if (v5) {
    free(v5);
  }
}

void sub_1000073B0(const void *a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = v4 + 1;
  snprintf(__str, 0x100uLL, "%d", v4);
  sub_100007574(__str, a1, a2);
}

void sub_100007440(__CFTree *a1, uint64_t a2)
{
  int v4 = *(_DWORD *)a2 + 1;
  __int128 v6 = *(_OWORD *)(a2 + 8);
  v5[0] = v4;
  v5[1] = 0;
  CFTreeGetContext(a1, &context);
  sub_100007574((char *)&unk_10000AB0D, context.info, a2);
  CFTreeApplyFunctionToChildren(a1, (CFTreeApplierFunction)sub_100007440, v5);
}

void sub_1000074AC(const void *a1, uint64_t a2)
{
}

void *sub_1000074C0(uint64_t a1)
{
  CFStringRef v2 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@", a1);
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = a1 == 0;
  }
  if (v3) {
    int v4 = v2;
  }
  else {
    int v4 = @"<error getting string representation>";
  }
  CFIndex Length = CFStringGetLength(v4);
  CFIndex v6 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  CFTypeID v7 = malloc(v6);
  if (v7 && !CFStringGetCString(v4, (char *)v7, v6, 0x8000100u))
  {
    free(v7);
    return 0LL;
  }

  return v7;
}

void sub_100007574(char *a1, const void *a2, uint64_t a3)
{
  if (*(int *)a3 >= 1)
  {
    int v6 = 0;
    do
    {
      fputs(*(const char **)(a3 + 8), *(FILE **)(a3 + 16));
      ++v6;
    }

    while (v6 < *(_DWORD *)a3);
  }

  fputs(a1, *(FILE **)(a3 + 16));
  if (a2)
  {
    if (a1 && *a1) {
      fputc(58, *(FILE **)(a3 + 16));
    }
    CFTypeID v7 = CFGetTypeID(a2);
    if (v7 == CFDictionaryGetTypeID()
      || (CFTypeID v8 = CFGetTypeID(a2), v8 == CFArrayGetTypeID())
      || (CFTypeID v9 = CFGetTypeID(a2), v9 == CFTreeGetTypeID())
      || (CFTypeID v10 = CFGetTypeID(a2), v10 == CFBagGetTypeID()))
    {
      fputc(10, *(FILE **)(a3 + 16));
      v13[0] = *(_DWORD *)a3 + 1;
      v13[1] = 0;
      __int128 v14 = *(_OWORD *)(a3 + 8);
      sub_100007200(a2, v13);
    }

    else
    {
      unsigned int v11 = (char *)sub_1000074C0((uint64_t)a2);
      if (a1 && *a1) {
        fputc(32, *(FILE **)(a3 + 16));
      }
      CFTypeID v12 = *(FILE **)(a3 + 16);
      if (v11)
      {
        fprintf(v12, "%s\n", v11);
        free(v11);
      }

      else
      {
        fwrite("(NULL)\n", 7uLL, 1uLL, v12);
      }
    }
  }

  else
  {
    fputc(10, *(FILE **)(a3 + 16));
  }

CFStringRef buildAggDKey(void *a1)
{
  values[0] = kFSInfoCAPrefix;
  values[1] = a1;
  size_t v1 = CFArrayCreate(kCFAllocatorDefault, (const void **)values, 2LL, &kCFTypeArrayCallBacks);
  return CFStringCreateByCombiningStrings(kCFAllocatorDefault, v1, @".");
}

CFNumberRef get_storage_capacity()
{
  values[0] = @"Device Characteristics";
  values[1] = @"Controller Characteristics";
  uint64_t v0 = CFArrayCreate(kCFAllocatorDefault, (const void **)values, 2LL, &kCFTypeArrayCallBacks);
  CFIndex v1 = 0LL;
  for (char i = 1; ; char i = 0)
  {
    char v3 = i;
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v0, v1);
    if (FSDGetAdvancedInfo(ValueAtIndex, 0))
    {
      if (gCapacity) {
        break;
      }
    }

    CFIndex v1 = 1LL;
    if ((v3 & 1) == 0) {
      return CFNumberCreate(0LL, kCFNumberLongLongType, &v6);
    }
  }

  unint64_t v6 = gCapacity / 0x3B9ACA00uLL;
  return CFNumberCreate(0LL, kCFNumberLongLongType, &v6);
}

uint64_t FSStats_listenToLockStateChangeNotification(uint64_t result)
{
  if (&_SBSGetScreenLockStatus)
  {
    CFIndex v1 = (dispatch_queue_s *)result;
    CFStringRef v2 = (const void *)MGCopyAnswer(@"DeviceClass", 0LL);
    if (v2)
    {
      char v3 = v2;
      BOOL v4 = CFEqual(v2, @"AppleTV") != 0;
      CFRelease(v3);
    }

    else
    {
      BOOL v4 = 0;
    }

    uint64_t result = notify_register_dispatch(&aComAppleSpring[100 * v4], &dword_100010250, v1, &stru_10000C7A8);
    if (!(_DWORD)result)
    {
      uint64_t result = SBSGetScreenLockStatus(0LL);
      if (!(_DWORD)result) {
        byte_100010254 = 0;
      }
    }
  }

  return result;
}

void sub_100007954(id a1, int a2)
{
  if (!(killRequested | SBSGetScreenLockStatus(0LL)))
  {
    killRequested = 1;
    byte_100010254 = 0;
    if (gtid) {
      pthread_kill((pthread_t)gtid, 30);
    }
  }

__CFDictionary *CopyFSInfo()
{
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  80LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  v14[2] = 0LL;
  v14[0] = 5LL;
  v14[1] = 2147485184LL;
  if (!getattrlist("/private/var", v14, v11, 0xCuLL, 0))
  {
    uint64_t v10 = sub_100007D28(v12, 3u);
    uint64_t v9 = sub_100007D28(v13, 3u);
    if (!statfs("/private/var", &v16))
    {
      int v1 = sub_100007D9C(1);
      uint64_t f_bsize = v16.f_bsize;
      if (!v1) {
        int v8 = sub_100007D28( (v16.f_bsize * (unint64_t)(vaddvq_s32((int32x4_t)xmmword_100010384) + dword_100010394)) >> 20,  2u);
      }
      int v6 = (v16.f_bfree * f_bsize) >> 20;
      int v7 = (v16.f_blocks * f_bsize) >> 20;
    }
  }

  char v3 = CFDictionaryCreateMutable( kCFAllocatorDefault,  12LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  sub_100007E1C(v3, @"FilesCount", &v10, kCFNumberIntType);
  sub_100007E1C(v3, @"DirectoriesCount", &v9, kCFNumberIntType);
  sub_100007E1C(v3, @"MetadataMB", &v8, kCFNumberIntType);
  sub_100007E1C(v3, @"TotalFreeSize", &v6, kCFNumberIntType);
  sub_100007E1C(v3, @"TotalSize", &v7, kCFNumberIntType);
  CFDictionarySetValue(Mutable, @"com.apple.FileSystemInfo.MiscStats", v3);
  xmmword_100010460 = 0u;
  xmmword_100010470 = 0u;
  defrag_stats = 0u;
  if (!fsctl("/private/var", 0xC0304A33uLL, &defrag_stats, 0) || !*__error())
  {
    BOOL v4 = CFDictionaryCreateMutable( kCFAllocatorDefault,  8LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    sub_100007E1C(v4, @"FxDefragBlocksReallocated", &defrag_stats, kCFNumberLongLongType);
    sub_100007E1C(v4, @"FxDefragFextsReallocated", (char *)&defrag_stats + 8, kCFNumberLongLongType);
    sub_100007E1C(v4, @"FxDefragFextsSkipped", &xmmword_100010460, kCFNumberLongLongType);
    sub_100007E1C(v4, @"FxDefragChunksChosen", (char *)&xmmword_100010460 + 8, kCFNumberLongLongType);
    sub_100007E1C(v4, @"FxDefragRuns", &xmmword_100010470, kCFNumberIntType);
    sub_100007E1C(v4, @"FxDefragCompletions", (char *)&xmmword_100010470 + 4, kCFNumberIntType);
    sub_100007E1C(v4, @"FxDefragDeepRuns", (char *)&xmmword_100010470 + 8, kCFNumberIntType);
    sub_100007E1C(v4, @"FxDefragDeepCompletions", (char *)&xmmword_100010470 + 12, kCFNumberIntType);
    CFDictionarySetValue(Mutable, @"com.apple.FileSystemInfo.NANDDefragStats", v4);
  }

  killRequested = 0;
  gtid = 0LL;
  pthread_attr_init(&v17);
  pthread_attr_setdetachstate(&v17, 1);
  pthread_create((pthread_t *)&gtid, &v17, (void *(__cdecl *)(void *))sub_100007E88, Mutable);
  pthread_attr_destroy(&v17);
  pthread_join((pthread_t)gtid, &v15);
  gtid = 0LL;
  return Mutable;
}

uint64_t sub_100007D28(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1;
  if ((_DWORD)a1)
  {
    double v4 = log10((double)a1) + 1.0;
    unsigned int v5 = v4 - a2;
    if (v4 >= a2)
    {
      if (v5 > 9)
      {
        return 0LL;
      }

      else
      {
        unsigned int v6 = dword_100009FB8[v5];
        unsigned int v7 = v2 / v6;
        return v7 * v6;
      }
    }
  }

  return v2;
}

uint64_t sub_100007D9C(int a1)
{
  *(_OWORD *)&word_100010380 = 0u;
  unk_100010440 = 0u;
  unk_100010430 = 0u;
  unk_100010420 = 0u;
  unk_100010410 = 0u;
  unk_100010400 = 0u;
  unk_1000103F0 = 0u;
  unk_1000103E0 = 0u;
  unk_1000103D0 = 0u;
  unk_1000103C0 = 0u;
  *(_OWORD *)&dword_1000103B0 = 0u;
  unk_1000103A0 = 0u;
  *(__int128 *)((char *)&xmmword_100010384 + 12) = 0u;
  fsinfo = a1;
  word_100010380 = 1;
  uint64_t result = fsctl("/private/var", 0xC0D4682DuLL, &fsinfo, 0);
  if ((_DWORD)result) {
    return *__error();
  }
  return result;
}

void sub_100007E1C(__CFDictionary *a1, const void *a2, const void *a3, CFNumberType theType)
{
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, theType, a3);
  if (a2)
  {
    CFNumberRef v7 = v6;
    if (v6)
    {
      CFDictionarySetValue(a1, a2, v6);
      CFRelease(v7);
    }
  }

uint64_t sub_100007E88(__CFDictionary *a1)
{
  if (a1)
  {
    v90.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100008E78;
    *(void *)&v90.sa_masuint64_t k = 0LL;
    sigaction(30, &v90, 0LL);
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.FSInfo", 0LL);
    if (v2)
    {
      byte_100010254 = 1;
      object = v2;
      FSStats_listenToLockStateChangeNotification((uint64_t)v2);
      if (byte_100010254 == 1)
      {
        if (!sub_100007D9C(2))
        {
          int v97 = sub_100007D28(xmmword_100010384, 2u);
          int v96 = sub_100007D28(DWORD1(xmmword_100010384), 2u);
          int v95 = sub_100007D28(DWORD2(xmmword_100010384), 2u);
          int v94 = sub_100007D28(HIDWORD(xmmword_100010384), 2u);
          Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  4LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          sub_100007E1C(Mutable, @"dataExtents", &v97, kCFNumberIntType);
          sub_100007E1C(Mutable, @"catalogExtents", &v96, kCFNumberIntType);
          sub_100007E1C(Mutable, @"allocationExtents", &v95, kCFNumberIntType);
          sub_100007E1C(Mutable, @"attributeExtents", &v94, kCFNumberIntType);
          CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.MetaDataExtents", Mutable);
        }

        if (byte_100010254 == 1)
        {
          if (!sub_100007D9C(3))
          {
            int v92 = DWORD1(xmmword_100010384);
            int v93 = xmmword_100010384;
            int v91 = HIDWORD(xmmword_100010384);
            unsigned int v5 = CFDictionaryCreateMutable( kCFAllocatorDefault,  3LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            sub_100007E1C(v5, @"PercentFreeExtents", &v93, kCFNumberIntType);
            sub_100007E1C(v5, @"PercentFreeCatalog", &v92, kCFNumberIntType);
            sub_100007E1C(v5, @"PercentFreeAttributes", &v91, kCFNumberIntType);
            CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.MetaDataPercentFree", v5);
          }

          if (byte_100010254 == 1)
          {
            if (!sub_100007D9C(11))
            {
              CFNumberRef v6 = &bucket;
              LODWORD(bucket) = sub_100007D28(xmmword_100010384, 2u);
              DWORD1(bucket) = sub_100007D28(DWORD1(xmmword_100010384), 2u);
              DWORD2(bucket) = sub_100007D28(DWORD2(xmmword_100010384), 2u);
              HIDWORD(bucket) = sub_100007D28(HIDWORD(xmmword_100010384), 2u);
              LODWORD(xmmword_100010490) = sub_100007D28(dword_100010394, 2u);
              DWORD1(xmmword_100010490) = sub_100007D28(dword_100010398, 2u);
              CFNumberRef v7 = CFDictionaryCreateMutable( kCFAllocatorDefault,  6LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              uint64_t v8 = -6LL;
              do
              {
                snprintf(keyName, 0xFFuLL, "FilesClass%d", v8 + 7);
                sub_100008EA8(v7, v6);
                CFNumberRef v6 = (__int128 *)((char *)v6 + 4);
                BOOL v9 = __CFADD__(v8++, 1LL);
              }

              while (!v9);
              CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.FilesClass", v7);
            }

            if (byte_100010254 == 1)
            {
              if (!sub_100007D9C(4))
              {
                uint64_t v10 = 0LL;
                xmmword_1000104B0 = 0u;
                unk_1000104C0 = 0u;
                xmmword_100010490 = 0u;
                *(_OWORD *)&dword_1000104A0 = 0u;
                bucket = 0u;
                do
                {
                  else {
                    unsigned int v11 = v10;
                  }
                  *((_DWORD *)&bucket + v11) += fsinfo[v10++ + 2];
                }

                while (v10 != 42);
                unsigned int v12 = CFDictionaryCreateMutable( kCFAllocatorDefault,  6LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                unsigned int v13 = &bucket;
                uint64_t v14 = -6LL;
                do
                {
                  snprintf(keyName, 0xFFuLL, "ExtentsCount%d", v14 + 7);
                  sub_100008EA8(v12, v13);
                  unsigned int v13 = (__int128 *)((char *)v13 + 4);
                  BOOL v9 = __CFADD__(v14++, 1LL);
                }

                while (!v9);
                CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.ExtentsCount", v12);
              }

              if (byte_100010254 == 1)
              {
                if (!sub_100007D9C(8))
                {
                  unint64_t v15 = 0LL;
                  xmmword_1000104B0 = 0u;
                  unk_1000104C0 = 0u;
                  xmmword_100010490 = 0u;
                  *(_OWORD *)&dword_1000104A0 = 0u;
                  bucket = 0u;
                  do
                  {
                    uint64_t v16 = v15 >> 1;
                    if (v15 >= 0xC) {
                      uint64_t v16 = 5LL;
                    }
                    *((_DWORD *)&bucket + v16) += fsinfo[v15++ + 2];
                  }

                  while (v15 != 51);
                  pthread_attr_t v17 = CFDictionaryCreateMutable( kCFAllocatorDefault,  6LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                  int v18 = &bucket;
                  uint64_t v19 = -6LL;
                  do
                  {
                    snprintf(keyName, 0xFFuLL, "NameSize%d", v19 + 7);
                    sub_100008EA8(v17, v18);
                    int v18 = (__int128 *)((char *)v18 + 4);
                    BOOL v9 = __CFADD__(v19++, 1LL);
                  }

                  while (!v9);
                  CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.NameSize", v17);
                }

                if (byte_100010254 == 1)
                {
                  if (!sub_100007D9C(9))
                  {
                    uint64_t v20 = 0LL;
                    xmmword_1000104B0 = 0u;
                    unk_1000104C0 = 0u;
                    xmmword_100010490 = 0u;
                    *(_OWORD *)&dword_1000104A0 = 0u;
                    bucket = 0u;
                    do
                    {
                      else {
                        unsigned int v21 = v20;
                      }
                      *((_DWORD *)&bucket + v21) += fsinfo[v20++ + 2];
                    }

                    while (v20 != 42);
                    sqlite3_int64 v22 = CFDictionaryCreateMutable( kCFAllocatorDefault,  9LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                    CFTypeID v23 = &bucket;
                    uint64_t v24 = -9LL;
                    do
                    {
                      snprintf(keyName, 0xFFuLL, "XattrSize%d", v24 + 10);
                      sub_100008EA8(v22, v23);
                      CFTypeID v23 = (__int128 *)((char *)v23 + 4);
                      BOOL v9 = __CFADD__(v24++, 1LL);
                    }

                    while (!v9);
                    CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.XattrSize", v22);
                  }

                  if (byte_100010254 == 1)
                  {
                    if (!sub_100007D9C(12))
                    {
                      unint64_t v25 = 0LL;
                      int v26 = 0;
                      int v27 = 0;
                      int v28 = 0;
                      int v29 = 0;
                      int v30 = 0;
                      xmmword_1000104B0 = 0u;
                      unk_1000104C0 = 0u;
                      xmmword_100010490 = 0u;
                      *(_OWORD *)&dword_1000104A0 = 0u;
                      bucket = 0u;
                      do
                      {
                        if (v25 > 3)
                        {
                          if (v25 == 4)
                          {
                            v29 += dword_100010394;
                            DWORD1(bucket) = v29;
                          }

                          else if (v25 > 5)
                          {
                            if (v25 == 6)
                            {
                              v27 += dword_10001039C;
                              HIDWORD(bucket) = v27;
                            }

                            else
                            {
                              v26 += fsinfo[v25 + 2];
                              LODWORD(xmmword_100010490) = v26;
                            }
                          }

                          else
                          {
                            v28 += dword_100010398;
                            DWORD2(bucket) = v28;
                          }
                        }

                        else
                        {
                          v30 += fsinfo[v25 + 2];
                          LODWORD(bucket) = v30;
                        }

                        ++v25;
                      }

                      while (v25 != 42);
                      uint64_t v31 = CFDictionaryCreateMutable( kCFAllocatorDefault,  5LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                      int v32 = &bucket;
                      uint64_t v33 = -5LL;
                      do
                      {
                        snprintf(keyName, 0xFFuLL, "SymLinkSize%d", v33 + 6);
                        sub_100008EA8(v31, v32);
                        int v32 = (__int128 *)((char *)v32 + 4);
                        BOOL v9 = __CFADD__(v33++, 1LL);
                      }

                      while (!v9);
                      CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.SymLinkSize", v31);
                    }

                    if (byte_100010254 == 1)
                    {
                      if (!sub_100007D9C(7))
                      {
                        uint64_t v34 = 0LL;
                        xmmword_1000104B0 = 0u;
                        unk_1000104C0 = 0u;
                        xmmword_100010490 = 0u;
                        *(_OWORD *)&dword_1000104A0 = 0u;
                        bucket = 0u;
                        do
                        {
                          else {
                            unsigned int v35 = v34;
                          }
                          *((_DWORD *)&bucket + v35) += fsinfo[v34++ + 2];
                        }

                        while (v34 != 42);
                        CFTypeID v36 = CFDictionaryCreateMutable( kCFAllocatorDefault,  10LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                        int v37 = &bucket;
                        uint64_t v38 = -10LL;
                        do
                        {
                          snprintf(keyName, 0xFFuLL, "Valence%d", v38 + 11);
                          sub_100008EA8(v36, v37);
                          CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.Valence", v36);
                          int v37 = (__int128 *)((char *)v37 + 4);
                          BOOL v9 = __CFADD__(v38++, 1LL);
                        }

                        while (!v9);
                      }

                      if (byte_100010254 == 1)
                      {
                        if (!sub_100007D9C(5))
                        {
                          unint64_t v39 = 0LL;
                          int v40 = 0;
                          int v41 = 0;
                          int v42 = 0;
                          int v43 = 0;
                          int v44 = 0;
                          int v45 = 0;
                          xmmword_1000104B0 = 0u;
                          unk_1000104C0 = 0u;
                          xmmword_100010490 = 0u;
                          *(_OWORD *)&dword_1000104A0 = 0u;
                          bucket = 0u;
                          do
                          {
                            __int128 v46 = &fsinfo[v39];
                            if (v39 > 0xC)
                            {
                              if (v39 > 0xE)
                              {
                                if (v39 > 0x11)
                                {
                                  if (v39 > 0x14)
                                  {
                                    int v47 = v46[2];
                                    if (v39 > 0x1C)
                                    {
                                      v40 += v47;
                                      DWORD1(xmmword_100010490) = v40;
                                    }

                                    else
                                    {
                                      v41 += v47;
                                      LODWORD(xmmword_100010490) = v41;
                                    }
                                  }

                                  else
                                  {
                                    v42 += v46[2];
                                    HIDWORD(bucket) = v42;
                                  }
                                }

                                else
                                {
                                  v43 += v46[2];
                                  DWORD2(bucket) = v43;
                                }
                              }

                              else
                              {
                                v44 += v46[2];
                                DWORD1(bucket) = v44;
                              }
                            }

                            else
                            {
                              v45 += v46[2];
                              LODWORD(bucket) = v45;
                            }

                            ++v39;
                          }

                          while (v39 != 42);
                          CFTypeID v48 = CFDictionaryCreateMutable( kCFAllocatorDefault,  6LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                          CFStringEncoding v49 = &bucket;
                          uint64_t v50 = -6LL;
                          do
                          {
                            snprintf(keyName, 0xFFuLL, "ExtentsSize%d", v50 + 7);
                            sub_100008EA8(v48, v49);
                            CFStringEncoding v49 = (__int128 *)((char *)v49 + 4);
                            BOOL v9 = __CFADD__(v50++, 1LL);
                          }

                          while (!v9);
                          CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.ExtentsSize", v48);
                        }

                        if (byte_100010254 == 1)
                        {
                          int v51 = sub_100007D9C(6);
                          if (!v51)
                          {
                            unint64_t v52 = 0LL;
                            int v53 = 0;
                            int v54 = 0;
                            uint64_t v83 = 0LL;
                            int v82 = 0;
                            uint64_t v86 = 0LL;
                            int v55 = 0;
                            int v56 = 0;
                            int v57 = 0;
                            int v58 = 0;
                            int v59 = 0;
                            int v60 = 0;
                            int v61 = 0;
                            xmmword_1000104B0 = 0u;
                            unk_1000104C0 = 0u;
                            xmmword_100010490 = 0u;
                            *(_OWORD *)&dword_1000104A0 = 0u;
                            bucket = 0u;
                            do
                            {
                              if ((_DWORD)v52 == 1)
                              {
                                v53 += DWORD1(xmmword_100010384);
                                DWORD1(bucket) = v53;
                              }

                              else if ((_DWORD)v52)
                              {
                                if (v52 > 2)
                                {
                                  if (v52 > 4)
                                  {
                                    if (v52 == 5)
                                    {
                                      v59 += dword_100010398;
                                      LODWORD(xmmword_100010490) = v59;
                                    }

                                    else if (v52 > 6)
                                    {
                                      if (v52 == 7)
                                      {
                                        v57 += unk_1000103A0;
                                        DWORD2(xmmword_100010490) = v57;
                                      }

                                      else if (v52 > 8)
                                      {
                                        if (v52 == 9)
                                        {
                                          v56 += unk_1000103A8;
                                          dword_1000104A0 = v56;
                                        }

                                        else if (v52 > 0xA)
                                        {
                                          if (v52 == 11)
                                          {
                                            HIDWORD(v86) += dword_1000103B0;
                                            dword_1000104A8 = HIDWORD(v86);
                                          }

                                          else if (v52 > 0xC)
                                          {
                                            v62 = &fsinfo[v52];
                                            if (v52 > 0xF)
                                            {
                                              int v63 = v62[2];
                                              if (v52 > 0x11)
                                              {
                                                LODWORD(v83) = v83 + v63;
                                                DWORD2(xmmword_1000104B0) = v83;
                                              }

                                              else
                                              {
                                                v82 += v63;
                                                DWORD1(xmmword_1000104B0) = v82;
                                              }
                                            }

                                            else
                                            {
                                              HIDWORD(v83) += v62[2];
                                              LODWORD(xmmword_1000104B0) = HIDWORD(v83);
                                            }
                                          }

                                          else
                                          {
                                            LODWORD(v86) = v86 + dword_1000103B4;
                                            dword_1000104AC = v86;
                                          }
                                        }

                                        else
                                        {
                                          v55 += dword_1000103AC;
                                          dword_1000104A4 = v55;
                                        }
                                      }

                                      else
                                      {
                                        v51 += dword_1000103A4;
                                        HIDWORD(xmmword_100010490) = v51;
                                      }
                                    }

                                    else
                                    {
                                      v58 += dword_10001039C;
                                      DWORD1(xmmword_100010490) = v58;
                                    }
                                  }

                                  else
                                  {
                                    v60 += fsinfo[v52 + 2];
                                    HIDWORD(bucket) = v60;
                                  }
                                }

                                else
                                {
                                  v61 += DWORD2(xmmword_100010384);
                                  DWORD2(bucket) = v61;
                                }
                              }

                              else
                              {
                                v54 += xmmword_100010384;
                                LODWORD(bucket) = v54;
                              }

                              ++v52;
                            }

                            while (v52 != 42);
                            v64 = CFDictionaryCreateMutable( kCFAllocatorDefault,  15LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                            v65 = &bucket;
                            uint64_t v66 = -15LL;
                            do
                            {
                              snprintf(keyName, 0xFFuLL, "FileSize%d", v66 + 16);
                              sub_100008EA8(v64, v65);
                              v65 = (__int128 *)((char *)v65 + 4);
                              BOOL v9 = __CFADD__(v66++, 1LL);
                            }

                            while (!v9);
                            CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.FileSize", v64);
                          }

                          if (byte_100010254 == 1)
                          {
                            int v67 = sub_100007D9C(10);
                            if (!v67)
                            {
                              unint64_t v68 = 0LL;
                              int v69 = 0;
                              int v70 = 0;
                              int v84 = 0;
                              int v85 = 0;
                              uint64_t v87 = 0LL;
                              int v88 = 0;
                              int v71 = 0;
                              int v72 = 0;
                              int v73 = 0;
                              int v74 = 0;
                              int v75 = 0;
                              int v76 = 0;
                              int v77 = 0;
                              xmmword_1000104B0 = 0u;
                              unk_1000104C0 = 0u;
                              xmmword_100010490 = 0u;
                              *(_OWORD *)&dword_1000104A0 = 0u;
                              bucket = 0u;
                              do
                              {
                                if ((_DWORD)v68 == 1)
                                {
                                  v69 += DWORD1(xmmword_100010384);
                                  DWORD1(bucket) = v69;
                                }

                                else if ((_DWORD)v68)
                                {
                                  if (v68 > 2)
                                  {
                                    if (v68 == 3)
                                    {
                                      v76 += HIDWORD(xmmword_100010384);
                                      HIDWORD(bucket) = v76;
                                    }

                                    else if (v68 > 4)
                                    {
                                      if (v68 == 5)
                                      {
                                        v74 += dword_100010398;
                                        DWORD1(xmmword_100010490) = v74;
                                      }

                                      else if (v68 > 6)
                                      {
                                        if (v68 > 8)
                                        {
                                          if (v68 > 0xA)
                                          {
                                            if (v68 == 11)
                                            {
                                              v71 += dword_1000103B0;
                                              dword_1000104A4 = v71;
                                            }

                                            else if (v68 > 0xD)
                                            {
                                              if (v68 > 0xF)
                                              {
                                                if (v68 == 16)
                                                {
                                                  LODWORD(v87) = v87 + dword_1000103C4;
                                                  LODWORD(xmmword_1000104B0) = v87;
                                                }

                                                else
                                                {
                                                  int v78 = fsinfo[v68 + 2];
                                                  if (v68 > 0x12)
                                                  {
                                                    v85 += v78;
                                                    DWORD2(xmmword_1000104B0) = v85;
                                                  }

                                                  else
                                                  {
                                                    v84 += v78;
                                                    DWORD1(xmmword_1000104B0) = v84;
                                                  }
                                                }
                                              }

                                              else
                                              {
                                                HIDWORD(v87) += fsinfo[v68 + 2];
                                                dword_1000104AC = HIDWORD(v87);
                                              }
                                            }

                                            else
                                            {
                                              v88 += fsinfo[v68 + 2];
                                              dword_1000104A8 = v88;
                                            }
                                          }

                                          else
                                          {
                                            v72 += fsinfo[v68 + 2];
                                            dword_1000104A0 = v72;
                                          }
                                        }

                                        else
                                        {
                                          v67 += fsinfo[v68 + 2];
                                          HIDWORD(xmmword_100010490) = v67;
                                        }
                                      }

                                      else
                                      {
                                        v73 += dword_10001039C;
                                        DWORD2(xmmword_100010490) = v73;
                                      }
                                    }

                                    else
                                    {
                                      v75 += dword_100010394;
                                      LODWORD(xmmword_100010490) = v75;
                                    }
                                  }

                                  else
                                  {
                                    v77 += DWORD2(xmmword_100010384);
                                    DWORD2(bucket) = v77;
                                  }
                                }

                                else
                                {
                                  v70 += xmmword_100010384;
                                  LODWORD(bucket) = v70;
                                }

                                ++v68;
                              }

                              while (v68 != 42);
                              v79 = CFDictionaryCreateMutable( kCFAllocatorDefault,  15LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                              v80 = &bucket;
                              uint64_t v81 = -15LL;
                              do
                              {
                                snprintf(keyName, 0xFFuLL, "FreeExtentSize%d", v81 + 16);
                                sub_100008EA8(v79, v80);
                                v80 = (__int128 *)((char *)v80 + 4);
                                BOOL v9 = __CFADD__(v81++, 1LL);
                              }

                              while (!v9);
                              CFDictionarySetValue(a1, @"com.apple.FileSystemInfo.FreeExtentSize", v79);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      notify_cancel(dword_100010250);
      dispatch_release(object);
      pthread_exit(0LL);
    }
  }

  return 0LL;
}

void sub_100008E78()
{
  unsigned int v0 = pthread_self();
  syslog(5, "SIGUSR1 received by TID(%u)\n", v0);
}

void sub_100008EA8(__CFDictionary *a1, const void *a2)
{
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, keyName, 0x8000100u);
  if (v4)
  {
    CFStringRef v5 = v4;
    sub_100007E1C(a1, v4, a2, kCFNumberIntType);
    CFRelease(v5);
  }

void sub_100008F20()
{
  if (sub_100003A18())
  {
    sub_100003A24();
    sub_1000039EC( (void *)&_mh_execute_header,  v0,  v1,  "IOCS: failed to set context for inbound notifications on the mach port. Error = %d",  v2,  v3,  v4,  v5,  v6);
  }

  sub_100003A00();
}

void sub_100008FA0()
{
  if (sub_100003A18())
  {
    sub_100003A24();
    sub_1000039EC( (void *)&_mh_execute_header,  v0,  v1,  "IOCS: failed to bind host special port. Error = %d",  v2,  v3,  v4,  v5,  v6);
  }

  sub_100003A00();
}

void sub_100009020()
{
  if (sub_100003A18())
  {
    sub_100003A24();
    sub_1000039EC( (void *)&_mh_execute_header,  v0,  v1,  "IOCS: failed to insert send right. Error = %d",  v2,  v3,  v4,  v5,  v6);
  }

  sub_100003A00();
}

void sub_1000090A0()
{
  if (sub_100003A18())
  {
    sub_100003A24();
    sub_1000039EC( (void *)&_mh_execute_header,  v0,  v1,  "IOCS: failed to allocate a mach port. Error = %d",  v2,  v3,  v4,  v5,  v6);
  }

  sub_100003A00();
}

void sub_100009120()
{
}

void sub_10000914C(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3 = *a1;
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2080;
  uint64_t v6 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "IOCS: Failed to enable WAL for IOCSdb - %d %s\n",  (uint8_t *)v4,  0x12u);
}

void sub_1000091D4()
{
}

void sub_100009200(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000055D4((void *)&_mh_execute_header, a3, (uint64_t)a3, "IOCSdb: error reading bufferSizeCompressionDist\n", a1);
}

void sub_100009234(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000055D4((void *)&_mh_execute_header, a3, (uint64_t)a3, "IOCSdb: error reading blockCompressedSizeDist\n", a1);
}

void sub_100009268()
{
}

void sub_100009294()
{
}

void sub_1000092C0()
{
}

void sub_1000092EC()
{
}

void sub_100009364()
{
}

void sub_100009390()
{
}

void sub_1000093BC()
{
}

void sub_1000093E8()
{
}

void sub_100009460()
{
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}