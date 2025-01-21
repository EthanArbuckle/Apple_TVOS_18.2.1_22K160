@interface LeDeviceCache
+ (id)sharedInstance;
- (BOOL)createDatabase:(sqlite3 *)a3 type:(unint64_t)a4 path:(const char *)a5 flags:(int)a6;
- (BOOL)initializeDatabases:(LeDeviceCacheEventListener *)a3 queue:(dispatch_queue_s *)a4;
- (BOOL)json:(id)a3 hasAllProperties:(id)a4;
- (BOOL)json:(id)a3 hasAnyProperty:(id)a4;
- (BOOL)loadDatabase:(unint64_t)a3;
- (BOOL)readIntFromDatabase:(sqlite3 *)a3 statement:(id)a4 value:(int *)a5;
- (LeDeviceCache)init;
- (const)friendlyNameForType:(unint64_t)a3;
- (const)tableNameForType:(unint64_t)a3;
- (id)customPropertiesJSONFromDevice:(const void *)a3;
- (id)databaseContainerURL;
- (id)nameFromSanitizedName:(id)a3;
- (id)readCustomPropertiesJSONForDeviceUUID:(id)a3 inDatabase:(sqlite3 *)a4;
- (int)_genericExecute:(id)a3 inDatabase:(sqlite3 *)a4;
- (int)connectedDeviceCount;
- (int)duplicatePairedDevicesForAddress:(unint64_t)a3 originalUuid:(id)a4;
- (int)maxConnectedDevices;
- (int)maxSeenDevices;
- (int)seenDeviceCount;
- (vector<std::string,)findUUIDsWithAllCustomProperties:(LeDeviceCache *)self;
- (vector<std::string,)findUUIDsWithCustomProperties:(LeDeviceCache *)self;
- (void)clearAllDatabases;
- (void)createTablesForDatabase:(sqlite3 *)a3 type:(unint64_t)a4;
- (void)customPropertiesToDevice:(void *)a3 fromJSON:(id)a4;
- (void)evictIfNeeded:(BOOL)a3;
- (void)loadPairedDevice:(id)a3 address:(unint64_t)a4 ifMissing:(BOOL)a5;
- (void)migratePlistData:(id)a3 database:(sqlite3 *)a4 type:(unint64_t)a5;
- (void)printDatabase:(unint64_t)a3;
- (void)printDebug;
- (void)readCustomPropertiesJSONForDevice:(void *)a3 inDatabase:(sqlite3 *)a4;
- (void)readDevice:(id)a3;
- (void)readDeviceByAddress:(unint64_t)a3;
- (void)readDeviceFromDatabase:(sqlite3 *)a3 statement:(id)a4;
- (void)removeCustomPropertiesJSONForDeviceUUID:(id)a3 inDatabase:(sqlite3 *)a4;
- (void)removeDevice:(const void *)a3 internal:(BOOL)a4;
- (void)removeDevicesDuplicatesOf:(unint64_t)a3 originalUuid:(id)a4;
- (void)setConnectedDeviceCount:(int)a3;
- (void)setSeenDeviceCount:(int)a3;
- (void)tryLoadProtectedCache;
- (void)updateProtectedCacheMetrics;
- (void)wipeDatabaseNameOrigin:(unint64_t)a3;
- (void)writeCustomPropertiesJSONForDevice:(const void *)a3 inDatabase:(sqlite3 *)a4;
- (void)writeDevice:(const void *)a3;
@end

@implementation LeDeviceCache

+ (id)sharedInstance
{
  if (qword_1008EFCE8 != -1) {
    dispatch_once(&qword_1008EFCE8, &stru_10088FF38);
  }
  return (id)qword_1008EFCE0;
}

- (LeDeviceCache)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LeDeviceCache;
  v2 = -[LeDeviceCache init](&v16, "init");
  v3 = v2;
  if (!v2) {
    return v3;
  }
  *(_OWORD *)&v2->_maxSeenDevices = xmmword_1006C0660;
  v2->_pairedDatabase = 0LL;
  v2->_otherDatabase = 0LL;
  int v15 = 0;
  uint64_t v4 = sub_1002E6E00();
  sub_10002418C(buf, "LeDeviceCache");
  sub_10002418C(__p, "MaxConnectedOnDisk");
  int v5 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, int *))(*(void *)v4 + 88LL))(v4, buf, __p, &v15);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if ((v18 & 0x80000000) == 0)
  {
    if (!v5) {
      goto LABEL_14;
    }
LABEL_8:
    int v6 = v15;
    v7 = (os_log_s *)qword_1008F75A0;
    if (v15 < 1)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
        sub_10066A0C8();
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Warning: Using override value (%d) for max number of connected devices to be cached on disk",  buf,  8u);
        int v6 = v15;
      }

      v3->_maxSeenDevices = v6;
    }

    goto LABEL_14;
  }

  operator delete(*(void **)buf);
  if (v5) {
    goto LABEL_8;
  }
LABEL_14:
  uint64_t v8 = sub_1002E6E00();
  sub_10002418C(buf, "LeDeviceCache");
  sub_10002418C(__p, "MaxSeenOnDisk");
  int v9 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, int *))(*(void *)v8 + 88LL))(v8, buf, __p, &v15);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (v18 < 0)
  {
    operator delete(*(void **)buf);
    if (!v9) {
      return v3;
    }
  }

  else if (!v9)
  {
    return v3;
  }

  int v10 = v15;
  v11 = (os_log_s *)qword_1008F75A0;
  if (v15 < 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
      sub_10066A068();
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Warning: Using override value (%d) for max number of seen devices to be cached on disk",  buf,  8u);
      int v10 = v15;
    }

    v3->_maxConnectedDevices = v10;
  }

  return v3;
}

- (int)_genericExecute:(id)a3 inDatabase:(sqlite3 *)a4
{
  ppStmt = 0LL;
  id v5 = a3;
  int v6 = sqlite3_prepare_v2(a4, (const char *)[v5 UTF8String], -1, &ppStmt, 0);
  if (v6)
  {
    v7 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v5 UTF8String];
      int v9 = sqlite3_errmsg(a4);
      int v10 = sqlite3_extended_errcode(a4);
      *(_DWORD *)buf = 136315906;
      id v18 = v8;
      __int16 v19 = 1024;
      int v20 = v6;
      __int16 v21 = 2082;
      v22 = v9;
      __int16 v23 = 1024;
      int v24 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to prepare statement %s with error %d (%{public}s, %d)",  buf,  0x22u);
    }
  }

  else
  {
    int v6 = sqlite3_step(ppStmt);
    if (v6 != 101)
    {
      v11 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v5 UTF8String];
        char v14 = sqlite3_errmsg(a4);
        int v15 = sqlite3_extended_errcode(a4);
        *(_DWORD *)buf = 136315906;
        id v18 = v13;
        __int16 v19 = 1024;
        int v20 = v6;
        __int16 v21 = 2082;
        v22 = v14;
        __int16 v23 = 1024;
        int v24 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to execute statement %s with error %d (%{public}s, %d)",  buf,  0x22u);
      }
    }

    sqlite3_finalize(ppStmt);
  }

  return v6;
}

- (void)clearAllDatabases
{
  v3 = [NSString stringWithFormat:@"DELETE FROM %s" @"CustomProperties"];
  unsigned int v4 = -[LeDeviceCache _genericExecute:inDatabase:](self, "_genericExecute:inDatabase:", v3, self->_pairedDatabase);
  id v5 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v16 = v3;
    __int16 v17 = 1024;
    unsigned int v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Executing %@ on _pairedDatabase devices returned %d",  buf,  0x12u);
  }

  unsigned int v6 = -[LeDeviceCache _genericExecute:inDatabase:](self, "_genericExecute:inDatabase:", v3, self->_otherDatabase);
  v7 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v16 = v3;
    __int16 v17 = 1024;
    unsigned int v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Executing %@ on _otherDatabase devices returned %d",  buf,  0x12u);
  }

  uint64_t v8 = [NSString stringWithFormat:@"DELETE FROM %s" [self tableNameForType:0LL]];

  int v9 = (void *)v8;
  unsigned int v10 = -[LeDeviceCache _genericExecute:inDatabase:](self, "_genericExecute:inDatabase:", v8, self->_pairedDatabase);
  v11 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v16 = v9;
    __int16 v17 = 1024;
    unsigned int v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Executing %@ on _pairedDatabase devices returned %d",  buf,  0x12u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM %s",  -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1LL)));

  unsigned int v13 = -[LeDeviceCache _genericExecute:inDatabase:](self, "_genericExecute:inDatabase:", v12, self->_otherDatabase);
  char v14 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v16 = v12;
    __int16 v17 = 1024;
    unsigned int v18 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Executing %@ on _otherDatabase devices returned %d",  buf,  0x12u);
  }
}

- (BOOL)initializeDatabases:(LeDeviceCacheEventListener *)a3 queue:(dispatch_queue_s *)a4
{
  v7 = objc_autoreleasePoolPush();
  self->_listener = a3;
  uint64_t v8 = (void *)[NSFileManager defaultManager];
  int v9 = -[LeDeviceCache databaseContainerURL];
  unsigned int v10 = (void *)[v9 path];
  unsigned __int8 v11 = [v8 fileExistsAtPath:v10];

  if ((v11 & 1) == 0)
  {
    v12 = [NSFileManager defaultManager];
    unsigned int v13 = (void *)[self databaseContainerURL];
    id v37 = 0LL;
    unsigned __int8 v14 = [v12 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v37];
    id v15 = v37;

    if ((v14 & 1) == 0)
    {
      objc_super v16 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
      {
        v27 = -[LeDeviceCache databaseContainerURL];
        id v28 = [v27 path];
        id v29 = [v28 UTF8String];
        id v30 = [v15 localizedDescription];
        id v31 = [v30 UTF8String];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v29;
        __int16 v39 = 2082;
        id v40 = v31;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Could not create directory at path %s with error %{public}s",  buf,  0x16u);
      }
    }
  }

  int out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1002DDE10;
  handler[3] = &unk_10087EA70;
  handler[4] = self;
  uint32_t v17 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, a4, handler);
  unsigned int v18 = (os_log_s *)qword_1008F75A0;
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
      sub_10066A160();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Successfully registered for MKB first unlock notification",  buf,  2u);
  }

  if (!-[LeDeviceCache loadDatabase:](self, "loadDatabase:", 0LL))
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
      sub_10066A128((uint64_t)-[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0LL), (uint64_t)buf);
    }
    goto LABEL_29;
  }

  LODWORD(__p[0]) = 0;
  if (-[LeDeviceCache readIntFromDatabase:statement:value:]( self,  "readIntFromDatabase:statement:value:",  self->_pairedDatabase,  @"SELECT COUNT() FROM PairedDevices",  __p))
  {
    __int16 v19 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = __p[0];
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Paired device cache contains %d device(s)",  buf,  8u);
    }
  }

  char v34 = 0;
  uint64_t v20 = sub_1002E8D54();
  (*(void (**)(uint64_t, char *))(*(void *)v20 + 104LL))(v20, &v34);
  if (!v34)
  {
    v22 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Ignoring request to load '%{public}s' cache as we're before first unlock",  buf,  0xCu);
    }

    goto LABEL_22;
  }

  if (!-[LeDeviceCache loadDatabase:](self, "loadDatabase:", 1LL))
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
      sub_10066A128((uint64_t)-[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL), (uint64_t)buf);
    }
LABEL_29:
    int v25 = 1;
    goto LABEL_30;
  }

  -[LeDeviceCache updateProtectedCacheMetrics](self, "updateProtectedCacheMetrics");
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"SystemKeybagUnlocked", 0LL, 0LL, 1u);
LABEL_22:
  uint64_t v24 = sub_1002E6E00();
  sub_10002418C(buf, "LeDeviceCache");
  sub_10002418C(__p, "WipeNameOrigin");
  (*(void (**)(uint64_t, _BYTE *, void **, void))(*(void *)v24 + 80LL))(v24, buf, __p, 0LL);
  if (v33 < 0) {
    operator delete(__p[0]);
  }
  if (v41 < 0) {
    operator delete(*(void **)buf);
  }
  int v25 = 0;
LABEL_30:
  objc_autoreleasePoolPop(v7);
  return v25 == 0;
}

- (id)databaseContainerURL
{
  __p[0] = 0LL;
  __p[1] = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v2 = sub_1002E8D54();
  (*(void (**)(uint64_t, void **))(*(void *)v2 + 168LL))(v2, __p);
  if (v9 >= 0) {
    v3 = __p;
  }
  else {
    v3 = (void **)__p[0];
  }
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
  id v5 = [v4 stringByAppendingPathComponent:@"/Library/Database"];

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v5, 1LL));
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (void)tryLoadProtectedCache
{
  if (!self->_otherDatabase && MKBDeviceUnlockedSinceBoot() == 1)
  {
    if (-[LeDeviceCache loadDatabase:](self, "loadDatabase:", 1LL)) {
      -[LeDeviceCache updateProtectedCacheMetrics](self, "updateProtectedCacheMetrics");
    }
  }

- (void)removeDevicesDuplicatesOf:(unint64_t)a3 originalUuid:(id)a4
{
  unsigned int v6 = (unsigned __int8 *)a4;
  v7 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
  {
    id v8 = sub_1005BFB9C(a3);
    uint64_t v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543618;
    __int16 v39 = v6;
    __int16 v40 = 2114;
    char v41 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Removing duplicates of %{public}@ (%{public}@)",  buf,  0x16u);
  }

  uint64_t v10 = -[LeDeviceCache duplicatePairedDevicesForAddress:originalUuid:]( self,  "duplicatePairedDevicesForAddress:originalUuid:",  a3,  v6);
  if ((_DWORD)v10)
  {
    unsigned __int8 v11 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      id v12 = sub_1005BFB9C(a3);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      sub_10066A26C(v13, (uint64_t)v37, v10, v11);
    }

    unsigned __int8 v14 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0LL);
    id v15 = [v6 UUIDString];
    id v16 = sub_1005BFB9C(a3);
    uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = sub_1005BFB9C(a3);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT Uuid FROM %s WHERE Uuid != '%@' AND (Address = '%@' OR ResolvedAddress = '%@')",  v14,  v15,  v17,  v19));

    ppStmt = 0LL;
    pairedDatabase = self->_pairedDatabase;
    id v22 = v20;
    if (!sqlite3_prepare_v2(pairedDatabase, (const char *)[v22 UTF8String], -1, &ppStmt, 0))
    {
      while (sqlite3_step(ppStmt) == 100)
      {
        __int16 v23 = sqlite3_column_text(ppStmt, 0);
        if (v23)
        {
          uint64_t v24 = (os_log_s *)qword_1008F75A0;
          if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
          {
            v26 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0LL);
            *(_DWORD *)buf = 136315394;
            __int16 v39 = v23;
            __int16 v40 = 2080;
            char v41 = v26;
            _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Removing stale device %s from '%s' cache",  buf,  0x16u);
          }

          int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v23));
          -[LeDeviceCache removeCustomPropertiesJSONForDeviceUUID:inDatabase:]( self,  "removeCustomPropertiesJSONForDeviceUUID:inDatabase:",  v25,  self->_pairedDatabase);
        }
      }

      sqlite3_finalize(ppStmt);
    }

    v27 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0LL);
    id v28 = [v6 UUIDString];
    id v29 = sub_1005BFB9C(a3);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    id v31 = sub_1005BFB9C(a3);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    char v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DELETE FROM %s WHERE Uuid != '%@' AND (Address = '%@' OR ResolvedAddress = '%@')",  v27,  v28,  v30,  v32));

    char v34 = self->_pairedDatabase;
    id v35 = v33;
    sqlite3_exec(v34, (const char *)[v35 UTF8String], 0, 0, 0);
  }
}

- (void)loadPairedDevice:(id)a3 address:(unint64_t)a4 ifMissing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0LL);
    uint64_t v10 = (void *)[v8 UUIDString];
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT * FROM %s WHERE Uuid = '%@'",  v9,  v10));
  }

  else
  {
    id v12 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0LL);
    id v13 = sub_1005BFB9C(a4);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v14 = sub_1005BFB9C(a4);
    id v15 = v14;
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT * FROM %s WHERE Address = '%@' OR ResolvedAddress = '%@'",  v12,  v10,  v15));
  }

  id v16 = -[LeDeviceCache readDeviceFromDatabase:statement:]( self,  "readDeviceFromDatabase:statement:",  self->_pairedDatabase,  v11);
  otherDatabase = self->_otherDatabase;
  if (!v16)
  {
    if (!otherDatabase) {
      goto LABEL_10;
    }
    id v18 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1LL);
    if (v8)
    {
      __int16 v19 = [v8 UUIDString];
      uint64_t v20 = v11;
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT * FROM %s WHERE Uuid = '%@'",  v18,  v19));
    }

    else
    {
      id v24 = sub_1005BFB9C(a4);
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v24);
      id v25 = sub_1005BFB9C(a4);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v25);
      uint64_t v26 = [NSString stringWithFormat:@"SELECT * FROM %s WHERE Address = '%@' OR ResolvedAddress = '%@'", v18, v19, v20];

      unsigned __int8 v11 = (void *)v26;
    }

    id v16 = -[LeDeviceCache readDeviceFromDatabase:statement:]( self,  "readDeviceFromDatabase:statement:",  self->_otherDatabase,  v11);
    if (!v16) {
      goto LABEL_17;
    }
LABEL_13:
    id v22 = v8;
    sub_1005C3B74(v16, 1);
    goto LABEL_14;
  }

  if (otherDatabase) {
    goto LABEL_13;
  }
LABEL_10:
  __int16 v21 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Ignoring read as '%{public}s' cache has not been loaded yet",  buf,  0xCu);
  }

  if (v16) {
    goto LABEL_13;
  }
LABEL_17:
  v27 = (os_log_s *)qword_1008F75A0;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = sub_1005BFB9C(a4);
      id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      id v30 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0LL);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&_BYTE buf[12] = 2114;
      *(void *)&buf[14] = v29;
      __int16 v45 = 2082;
      v46 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Failed to load paired device %{public}@ (%{public}@) from '%{public}s' cache, but thats ok.",  buf,  0x20u);
    }

    id v16 = 0LL;
    id v22 = v8;
    goto LABEL_14;
  }

  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
  {
    id v31 = sub_1005BFB9C(a4);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    char v33 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0LL);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&_BYTE buf[12] = 2114;
    *(void *)&buf[14] = v32;
    __int16 v45 = 2082;
    v46 = v33;
    _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to load paired device %{public}@ (%{public}@) from '%{public}s' cache",  buf,  0x20u);

    v27 = (os_log_s *)qword_1008F75A0;
    if (v8) {
      goto LABEL_23;
    }
LABEL_25:
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v34 = sub_1005BFB9C(a4);
      id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      sub_10066A320(v35, (uint64_t)v43);
    }

    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = 0LL;
    uuid_clear(buf);
    uint64_t v36 = sub_1001BCDB0(a4);
    int v40 = v36;
    char v42 = BYTE6(v36);
    __int16 v41 = WORD2(v36);
    if (uuid_is_null(buf)) {
      unsigned int v37 = 7;
    }
    else {
      unsigned int v37 = 0;
    }
    sub_1000B1CE0(buf, (uint64_t)&v40, v37);
    v38 = sub_100241F94(buf);
    id v22 = v38;
    v27 = (os_log_s *)qword_1008F75A0;
    goto LABEL_31;
  }

  if (!v8) {
    goto LABEL_25;
  }
LABEL_23:
  id v22 = v8;
LABEL_31:
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    id v39 = sub_1005BFB9C(a4);
    objc_claimAutoreleasedReturnValue(v39);
    sub_10066A2C4();
  }

  id v16 = operator new(0x268uLL);
  sub_1002E545C((uint64_t)v16, v22, a4);
  v16[3] = a4;
  sub_1005C3B74(v16, 1);
  -[LeDeviceCache writeDevice:](self, "writeDevice:", v16);
LABEL_14:
  -[LeDeviceCache removeDevicesDuplicatesOf:originalUuid:](self, "removeDevicesDuplicatesOf:originalUuid:", a4, v22);

  return v16;
}

- (void)readDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0LL);
  unsigned int v6 = (void *)[v4 UUIDString];
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT * FROM %s WHERE Uuid = '%@'",  v5,  v6));

  id v8 = -[LeDeviceCache readDeviceFromDatabase:statement:]( self,  "readDeviceFromDatabase:statement:",  self->_pairedDatabase,  v7);
  uint64_t v9 = v8;
  if (v8)
  {
    sub_1005C3B74((uint64_t *)v8, 1);
  }

  else
  {
    uint64_t v10 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = (const char *)v4;
      __int16 v19 = 2082;
      uint64_t v20 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0LL);
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Unable to locate device %{public}@ in '%{public}s' cache",  buf,  0x16u);
    }

    if (self->_otherDatabase)
    {
      uint64_t v11 = [NSString stringWithFormat:@"SELECT * FROM %s WHERE Uuid = '%@'", [LeDeviceCache tableNameForType:1LL], v4];

      uint64_t v9 = -[LeDeviceCache readDeviceFromDatabase:statement:]( self,  "readDeviceFromDatabase:statement:",  self->_otherDatabase,  v11);
      if (!v9)
      {
        id v12 = (os_log_s *)qword_1008F75A0;
        if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
        {
          id v13 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
          *(_DWORD *)buf = 138543618;
          id v18 = (const char *)v4;
          __int16 v19 = 2082;
          uint64_t v20 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Unable to locate device %{public}@ in '%{public}s' cache",  buf,  0x16u);
        }

        uint64_t v9 = 0LL;
      }

      v7 = (void *)v11;
    }

    else
    {
      id v14 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
      {
        id v15 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
        *(_DWORD *)buf = 136446210;
        id v18 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Ignoring read as '%{public}s' cache has not been loaded yet",  buf,  0xCu);
      }

      uint64_t v9 = 0LL;
    }
  }

  return v9;
}

- (void)readDeviceByAddress:(unint64_t)a3
{
  BOOL v5 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0LL);
  id v6 = sub_1005BFB9C(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = sub_1005BFB9C(a3);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT * FROM %s WHERE Address = '%@' OR ResolvedAddress = '%@'",  v5,  v7,  v9));

  uint64_t v11 = -[LeDeviceCache readDeviceFromDatabase:statement:]( self,  "readDeviceFromDatabase:statement:",  self->_pairedDatabase,  v10);
  id v12 = v11;
  if (v11)
  {
    sub_1005C3B74((uint64_t *)v11, 1);
  }

  else
  {
    id v13 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
    {
      id v14 = sub_1005BFB9C(a3);
      id v15 = (char *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543618;
      id v28 = v15;
      __int16 v29 = 2082;
      id v30 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0LL);
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Unable to locate device address %{public}@ in '%{public}s' cache",  buf,  0x16u);
    }

    if (self->_otherDatabase)
    {
      id v16 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1LL);
      id v17 = sub_1005BFB9C(a3);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = [NSString stringWithFormat:@"SELECT * FROM %s WHERE Address = '%@'", v16, v18];

      id v12 = -[LeDeviceCache readDeviceFromDatabase:statement:]( self,  "readDeviceFromDatabase:statement:",  self->_otherDatabase,  v19);
      if (!v12)
      {
        uint64_t v20 = (os_log_s *)qword_1008F75A0;
        if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
        {
          id v21 = sub_1005BFB9C(a3);
          id v22 = [v21 autorelease];
          __int16 v23 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
          *(_DWORD *)buf = 138543618;
          id v28 = v22;
          __int16 v29 = 2082;
          id v30 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Unable to locate device address %{public}@ in '%{public}s' cache",  buf,  0x16u);
        }

        id v12 = 0LL;
      }

      uint64_t v10 = (void *)v19;
    }

    else
    {
      id v24 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
      {
        id v25 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
        *(_DWORD *)buf = 136446210;
        id v28 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Ignoring read as '%{public}s' cache has not been loaded yet",  buf,  0xCu);
      }

      id v12 = 0LL;
    }
  }

  return v12;
}

- (int)duplicatePairedDevicesForAddress:(unint64_t)a3 originalUuid:(id)a4
{
  id v6 = a4;
  int v15 = 0;
  v7 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0LL);
  id v8 = [v6 UUIDString];
  id v9 = sub_1005BFB9C(a3);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = sub_1005BFB9C(a3);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [NSString stringWithFormat:@"SELECT COUNT() FROM %s WHERE Uuid != '%@' AND (Address = '%@' OR ResolvedAddress = '%@')" v7, v8, v10, v12];

  -[LeDeviceCache readIntFromDatabase:statement:value:]( self,  "readIntFromDatabase:statement:value:",  self->_pairedDatabase,  v13,  &v15);
  LODWORD(self) = v15;

  return (int)self;
}

- (void)writeDevice:(const void *)a3
{
  BOOL v5 = objc_autoreleasePoolPush();
  int v6 = *((unsigned __int8 *)a3 + 160);
  BOOL v7 = *((_BYTE *)a3 + 160) == 0;
  uint64_t v8 = 3LL;
  if (*((_BYTE *)a3 + 160)) {
    uint64_t v8 = 2LL;
  }
  v47 = (sqlite3 *)(&self->super.isa)[v8];
  id v9 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
  {
    id v10 = *(id *)a3;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&_BYTE buf[12] = 2082;
    *(void *)&buf[14] = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", v7);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Writing device %{public}@ to '%{public}s' cache",  buf,  0x16u);
  }

  if (v6 || self->_otherDatabase)
  {
    -[LeDeviceCache removeDevice:internal:](self, "removeDevice:internal:", a3, 1LL);
    if (!v6) {
      -[LeDeviceCache evictIfNeeded:](self, "evictIfNeeded:", *((_DWORD *)a3 + 34) != 0);
    }
    if (*((void *)a3 + 24))
    {
      id v13 = [NSMutableArray arrayWithCapacity:];
      id v14 = (void *)*((void *)a3 + 22);
      if (v14 != (void *)((char *)a3 + 184))
      {
        do
        {
          int v15 = v14 + 4;
          id v16 = [NSString stringWithUTF8String:v15];
          [v13 addObject:v16];

          id v17 = (void *)v14[1];
          if (v17)
          {
            do
            {
              id v18 = v17;
              id v17 = (void *)*v17;
            }

            while (v17);
          }

          else
          {
            do
            {
              id v18 = (void *)v14[2];
              BOOL v19 = *v18 == (void)v14;
              id v14 = v18;
            }

            while (!v19);
          }

          id v14 = v18;
        }

        while (v18 != (void *)((char *)a3 + 184));
      }

      uint64_t v20 = (void *)[v13 componentsJoinedByString:@","];
    }

    else
    {
      uint64_t v20 = 0LL;
    }

    if (v6) {
      uint64_t v21 = 4LL;
    }
    else {
      uint64_t v21 = 5LL;
    }
    id v22 = (sqlite3_stmt *)(&self->super.isa)[v21];
    id v23 = *(id *)a3;
    id v24 = [v23 UUIDString];
    sqlite3_bind_text( v22,  1,  (const char *)[v24 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    id v25 = (sqlite3_stmt *)(&self->super.isa)[v21];
    if (*((char *)a3 + 127) < 0)
    {
      sub_100024238(buf, *((void **)a3 + 13), *((void *)a3 + 14));
    }

    else
    {
      *(_OWORD *)buf = *(_OWORD *)((char *)a3 + 104);
      *(void *)&buf[16] = *((void *)a3 + 15);
    }

    if (buf[23] >= 0) {
      uint64_t v26 = buf;
    }
    else {
      uint64_t v26 = *(const char **)buf;
    }
    sqlite3_bind_text(v25, 2, v26, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    sqlite3_bind_int((sqlite3_stmt *)(&self->super.isa)[v21], 3, *((_DWORD *)a3 + 32));
    v27 = (sqlite3_stmt *)(&self->super.isa)[v21];
    id v28 = sub_1005BFB9C(*((void *)a3 + 2));
    id v29 = objc_claimAutoreleasedReturnValue(v28);
    sqlite3_bind_text( v27,  4,  (const char *)[v29 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    id v30 = (sqlite3_stmt *)(&self->super.isa)[v21];
    uint64_t v31 = *((void *)a3 + 3);
    if (v31)
    {
      id v32 = sub_1005BFB9C(*((void *)a3 + 3));
      v27 = (sqlite3_stmt *) [v32 autorelease];
      char v33 = (const char *)-[sqlite3_stmt UTF8String](v27, "UTF8String");
    }

    else
    {
      char v33 = 0LL;
    }

    sqlite3_bind_text(v30, 5, v33, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (v31) {

    }
    sqlite3_bind_int((sqlite3_stmt *)(&self->super.isa)[v21], 6, *((_DWORD *)a3 + 33));
    sqlite3_bind_int((sqlite3_stmt *)(&self->super.isa)[v21], 7, *((_DWORD *)a3 + 34));
    sqlite3_bind_int((sqlite3_stmt *)(&self->super.isa)[v21], 8, *((unsigned __int8 *)a3 + 162));
    id v34 = (sqlite3_stmt *)(&self->super.isa)[v21];
    id v35 = v20;
    sqlite3_bind_text( v34,  9,  (const char *)[v35 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    uint64_t v36 = (sqlite3_stmt *)(&self->super.isa)[v21];
    if (*((char *)a3 + 231) < 0)
    {
      sub_100024238(buf, *((void **)a3 + 26), *((void *)a3 + 27));
    }

    else
    {
      *(_OWORD *)buf = *((_OWORD *)a3 + 13);
      *(void *)&buf[16] = *((void *)a3 + 28);
    }

    if (buf[23] >= 0) {
      unsigned int v37 = buf;
    }
    else {
      unsigned int v37 = *(const char **)buf;
    }
    sqlite3_bind_text(v36, 10, v37, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    int v38 = sqlite3_step((sqlite3_stmt *)(&self->super.isa)[v21]);
    if (v38 == 101)
    {
      -[LeDeviceCache writeCustomPropertiesJSONForDevice:inDatabase:]( self,  "writeCustomPropertiesJSONForDevice:inDatabase:",  a3,  v47);
      if (!v6)
      {
        if (*((_DWORD *)a3 + 34)) {
          -[LeDeviceCache setConnectedDeviceCount:]( self,  "setConnectedDeviceCount:",  -[LeDeviceCache connectedDeviceCount](self, "connectedDeviceCount") + 1);
        }
        else {
          -[LeDeviceCache setSeenDeviceCount:]( self,  "setSeenDeviceCount:",  -[LeDeviceCache seenDeviceCount](self, "seenDeviceCount") + 1);
        }
      }

      v44 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
      {
        id v45 = *(id *)a3;
        v46 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", v7);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v45;
        *(_WORD *)&_BYTE buf[12] = 2082;
        *(void *)&buf[14] = v46;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "Successfully wrote device %{public}@ into '%{public}s' cache",  buf,  0x16u);
      }
    }

    else
    {
      id v39 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
      {
        id v40 = *(id *)a3;
        __int16 v41 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", v7);
        char v42 = sqlite3_errmsg(v47);
        int v43 = sqlite3_extended_errcode(v47);
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v40;
        *(_WORD *)&_BYTE buf[12] = 2082;
        *(void *)&buf[14] = v41;
        *(_WORD *)&_BYTE buf[22] = 1024;
        int v49 = v38;
        __int16 v50 = 2082;
        v51 = v42;
        __int16 v52 = 1024;
        int v53 = v43;
        _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Failed to write device %{public}@ into '%{public}s' cache with error %d (%{public}s, %d)",  buf,  0x2Cu);
      }
    }

    sqlite3_reset((sqlite3_stmt *)(&self->super.isa)[v21]);
    sqlite3_clear_bindings((sqlite3_stmt *)(&self->super.isa)[v21]);
  }

  else
  {
    id v11 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
    {
      id v12 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Ignoring write as '%{public}s' cache has not been loaded yet",  buf,  0xCu);
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)removeDevice:(const void *)a3 internal:(BOOL)a4
{
  int v38 = 0;
  BOOL v7 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0LL);
  uint64_t v8 = (void *)[*(id *)a3 UUIDString];
  id v9 = [NSString stringWithFormat:@"SELECT COUNT() FROM %s WHERE Uuid = '%@'", v7, v8];

  -[LeDeviceCache readIntFromDatabase:statement:value:]( self,  "readIntFromDatabase:statement:value:",  self->_pairedDatabase,  v9,  &v38);
  if (v38)
  {
    id v10 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0LL);
    id v11 = [*(id *)a3 UUIDString];
    id v12 = [NSString stringWithFormat:@"DELETE FROM %s WHERE Uuid = '%@'", v10, v11];

    pairedDatabase = self->_pairedDatabase;
    id v9 = v12;
    int v14 = sqlite3_exec(pairedDatabase, (const char *)[v9 UTF8String], 0, 0, 0);
    if (!a4 && !v14)
    {
      int v15 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = *(id *)a3;
        id v17 = [v16 UUIDString];
        id v18 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0LL);
        *(_DWORD *)buf = 138543618;
        id v40 = v17;
        __int16 v41 = 2082;
        char v42 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Removed device %{public}@ from '%{public}s' cache",  buf,  0x16u);
      }
    }

    id v19 = *(id *)a3;
    uint64_t v20 = (void *)[v19 UUIDString];
    -[LeDeviceCache removeCustomPropertiesJSONForDeviceUUID:inDatabase:]( self,  "removeCustomPropertiesJSONForDeviceUUID:inDatabase:",  v20,  self->_pairedDatabase);

    goto LABEL_24;
  }

  if (self->_otherDatabase)
  {
    int v37 = 0;
    uint64_t v21 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1LL);
    id v22 = [*(id *)a3 UUIDString];
    id v23 = [NSString stringWithFormat:@"SELECT LastConnectionTime FROM %s WHERE Uuid = '%@'", v21, v22];

    if (-[LeDeviceCache readIntFromDatabase:statement:value:]( self,  "readIntFromDatabase:statement:value:",  self->_otherDatabase,  v23,  &v37))
    {
      id v24 = *(id *)a3;
      id v25 = [v24 UUIDString];
      -[LeDeviceCache removeCustomPropertiesJSONForDeviceUUID:inDatabase:]( self,  "removeCustomPropertiesJSONForDeviceUUID:inDatabase:",  v25,  self->_otherDatabase);

      uint64_t v26 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1LL);
      v27 = [*(id *)a3 UUIDString];
      id v28 = [NSString stringWithFormat:@"DELETE FROM %s WHERE Uuid = '%@'", v26, v27];

      otherDatabase = self->_otherDatabase;
      id v30 = v28;
      if (!sqlite3_exec(otherDatabase, (const char *)[v30 UTF8String], 0, 0, 0))
      {
        if (!a4)
        {
          id v34 = (os_log_s *)qword_1008F75A0;
          if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
          {
            id v35 = (char *)*(id *)a3;
            uint64_t v36 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
            *(_DWORD *)buf = 138543618;
            id v40 = v35;
            __int16 v41 = 2082;
            char v42 = v36;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Removed device %{public}@ from '%{public}s' cache",  buf,  0x16u);
          }
        }

        if (v37) {
          -[LeDeviceCache setConnectedDeviceCount:]( self,  "setConnectedDeviceCount:",  -[LeDeviceCache connectedDeviceCount](self, "connectedDeviceCount") - 1);
        }
        else {
          -[LeDeviceCache setSeenDeviceCount:]( self,  "setSeenDeviceCount:",  -[LeDeviceCache seenDeviceCount](self, "seenDeviceCount") - 1);
        }
        id v23 = v30;
        goto LABEL_23;
      }

      id v23 = v30;
    }

    if (!a4)
    {
      uint64_t v31 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
        sub_10066A364((void **)a3, v31);
      }
    }

- (BOOL)createDatabase:(sqlite3 *)a3 type:(unint64_t)a4 path:(const char *)a5 flags:(int)a6
{
  int v10 = sqlite3_open_v2(a5, a3, a6 | 4, 0LL);
  if (v10)
  {
    id v11 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      id v13 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a4);
      int v14 = sqlite3_errmsg(*a3);
      int v15 = sqlite3_extended_errcode(*a3);
      int v16 = 136447234;
      id v17 = v13;
      __int16 v18 = 2080;
      id v19 = a5;
      __int16 v20 = 1024;
      int v21 = v10;
      __int16 v22 = 2082;
      id v23 = v14;
      __int16 v24 = 1024;
      int v25 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to create '%{public}s' cache at %s with error %d (%{public}s, %d)",  (uint8_t *)&v16,  0x2Cu);
    }

    if (*a3)
    {
      sqlite3_close_v2(*a3);
      *a3 = 0LL;
    }
  }

  else
  {
    -[LeDeviceCache createTablesForDatabase:type:](self, "createTablesForDatabase:type:", *a3, a4);
  }

  return v10 == 0;
}

- (BOOL)loadDatabase:(unint64_t)a3
{
  v88 = [NSFileManager defaultManager];
  if (a3)
  {
    BOOL v5 = -[LeDeviceCache databaseContainerURL];
    int v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 URLByAppendingPathComponent:@"com.apple.MobileBluetooth.ledevices.other.db"]);

    id v7 = [v6 path];
    uint64_t v8 = (const char *)[v7 UTF8String];

    id v9 = [v6 path];
    p_otherDatabase = &self->_otherDatabase;
    ppStmt = &self->_writeOtherDeviceStmt;
    if ([v88 fileExistsAtPath:v9])
    {
      uint64_t v11 = 3145730LL;
    }

    else
    {
      unsigned int v15 = [v88 fileExistsAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db"];
      uint64_t v11 = 3145730LL;

      if (v15)
      {
        int v16 = (os_log_s *)qword_1008F75A0;
        if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v6 path];
          buf.st_dev = 136315394;
          *(void *)&buf.st_mode = "/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db";
          WORD2(buf.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)[v17 UTF8String];
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Moving LE database from %s to %s",  (uint8_t *)&buf,  0x16u);
        }

        chmod("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db", 0x1B6u);
        __int16 v18 = (void *)[v6 path];
        id v93 = 0LL;
        unsigned int v19 = [v88 copyItemAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db" toPath:v18 error:&v93];
        id v20 = v93;

        if (v19)
        {
          [v88 removeItemAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db" error:0];
        }

        else
        {
          v27 = (os_log_s *)qword_1008F75A0;
          if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
          {
            id v78 = [v20 localizedDescription];
            id v79 = [v78 UTF8String];
            buf.st_dev = 136446210;
            *(void *)&buf.st_mode = v79;
            _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to move old database to new path: %{public}s",  (uint8_t *)&buf,  0xCu);
          }
        }
      }
    }
  }

  else
  {
    id v12 = -[LeDeviceCache databaseContainerURL];
    int v6 = (void *)objc_claimAutoreleasedReturnValue( [v12 URLByAppendingPathComponent:@"com.apple.MobileBluetooth.ledevices.paired.db"]);

    id v13 = [v6 path];
    uint64_t v8 = (const char *)[v13 UTF8String];

    int v14 = (void *)[v6 path];
    p_otherDatabase = &self->_pairedDatabase;
    ppStmt = &self->_writePairedDeviceStmt;
    if ([v88 fileExistsAtPath:v14])
    {
    }

    else
    {
      unsigned int v21 = [v88 fileExistsAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db"];

      if (!v21)
      {
        uint64_t v11 = 4194306LL;
        goto LABEL_24;
      }

      __int16 v22 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [v6 path];
        buf.st_dev = 136315394;
        *(void *)&buf.st_mode = "/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)[v23 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Moving LE database from %s to %s",  (uint8_t *)&buf,  0x16u);
      }

      chmod("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db", 0x1B6u);
      __int16 v24 = [v6 path];
      id v94 = 0LL;
      unsigned int v25 = [v88 copyItemAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db" toPath:v24 error:&v94];
      id v26 = v94;

      if (v25)
      {
        [v88 removeItemAtPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db" error:0];
      }

      else
      {
        id v28 = (os_log_s *)qword_1008F75A0;
        if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
        {
          id v80 = [v26 localizedDescription];
          id v81 = [v80 UTF8String];
          buf.st_dev = 136446210;
          *(void *)&buf.st_mode = v81;
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Failed to move old database to new path: %{public}s",  (uint8_t *)&buf,  0xCu);
        }
      }
    }

    uint64_t v11 = 4194306LL;
  }

- (void)createTablesForDatabase:(sqlite3 *)a3 type:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DROP TABLE IF EXISTS _SqliteDatabaseProperties;CREATE TABLE _SqliteDatabaseProperties(key TEXT, value TEXT, UNIQUE(key));INSERT INTO _SqliteDatabaseProperties (key, value) VALUES ('_ClientVersion', %d);DROP TABLE IF EXISTS %s;CREATE TABLE %s(Uuid TEXT, Name TEXT, NameOrigin INT, Address TEXT, ResolvedAddress TEXT, LastSeenTime INT, LastConnectionTime INT, GATTServiceChangeConfig INT, Tags TEXT, iCloudIdentifier TEXT);DROP INDEX IF EXISTS %s;DROP TABLE IF EXISTS %s;CREATE TABLE %s (%s TEXT, %s TEXT, UNIQUE(%s));CREATE INDEX IF NOT EXISTS %s ON %s (%s);",
                   2LL,
                   -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a4),
                   -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a4),
                   "CustomPropertiesIndex",
                   "CustomProperties",
                   "CustomProperties",
                   "Uuid",
                   "JSON",
                   "Uuid",
                   "CustomPropertiesIndex",
                   "CustomProperties",
                   "Uuid"));
  uint64_t v8 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136446210;
    *(void *)unsigned int v15 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a4);
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating new '%{public}s' cache", buf, 0xCu);
  }

  id v9 = v7;
  int v10 = sqlite3_exec(a3, (const char *)[v9 UTF8String], 0, 0, 0);
  if (v10)
  {
    uint64_t v11 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      id v12 = sqlite3_errmsg(a3);
      int v13 = sqlite3_extended_errcode(a3);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)unsigned int v15 = v10;
      *(_WORD *)&v15[4] = 2082;
      *(void *)&v15[6] = v12;
      __int16 v16 = 1024;
      int v17 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to create tables with error %d (%{public}s, %d)",  buf,  0x18u);
    }
  }
}

- (void)migratePlistData:(id)a3 database:(sqlite3 *)a4 type:(unint64_t)a5
{
  id v67 = a3;
  int v6 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136446210;
    *(void *)int v77 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a5);
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Migrating '%{public}s' cache from legacy plist",  buf,  0xCu);
  }

  int v7 = sqlite3_exec( a4,  "CREATE TABLE Temp(Uuid TEXT, Name TEXT, NameOrigin INT, Address TEXT, ResolvedAddress TEXT, LastSeenTime INT, L astConnectionTime INT, GATTServiceChangeConfig INT, Tags TEXT, iCloudIdentifier TEXT)",  0LL,  0LL,  0LL);
  if (v7)
  {
    uint64_t v8 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      v57 = sqlite3_errmsg(a4);
      int v58 = sqlite3_extended_errcode(a4);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)int v77 = v7;
      *(_WORD *)&v77[4] = 2082;
      *(void *)&v77[6] = v57;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v58;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to create temporary table with error %d (%{public}s, %d)",  buf,  0x18u);
    }
  }

  id v9 = [NSString stringWithUTF8String: +[LeDeviceCache tableNameForType:](self, "tableNameForType:", a5)];
  int v72 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:v9]);

  uint64_t v71 = (void *)[v72 keyEnumerator];
  ppStmt = 0LL;
  int v10 = sqlite3_prepare_v2( a4,  "INSERT INTO Temp (Uuid, Name, NameOrigin, Address, ResolvedAddress, LastSeenTime, LastConnectionTime, GATTServ iceChangeConfig, Tags, iCloudIdentifier) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10)",  -1,  &ppStmt,  0LL);
  db = a4;
  if (v10)
  {
    uint64_t v11 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      id v12 = sqlite3_errmsg(a4);
      int v13 = sqlite3_extended_errcode(a4);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)int v77 = v10;
      *(_WORD *)&v77[4] = 2082;
      *(void *)&v77[6] = v12;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to create prepared write statement for temporary cache with error %d (%{public}s, %d)",  buf,  0x18u);
    }
  }

  else
  {
    while (1)
    {
      int v14 = (void *)[v71 nextObject];
      if (!v14) {
        break;
      }
      id v15 = v14;
      __int16 v16 = (void *)[v72 objectForKeyedSubscript:v15];
      int v17 = ppStmt;
      id v18 = v15;
      sqlite3_bind_text( v17,  1,  (const char *)[v18 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      unsigned int v19 = ppStmt;
      id v20 = [v16 objectForKeyedSubscript:@"Name"];
      sqlite3_bind_text( v19,  2,  (const char *)[v20 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      unsigned int v21 = ppStmt;
      __int16 v22 = (void *)[v16 objectForKeyedSubscript:@"NameOrigin"];
      sqlite3_bind_int(v21, 3, (int)[v22 intValue]);

      id v23 = ppStmt;
      id v24 = [v16 objectForKeyedSubscript:@"Address"];
      sqlite3_bind_text( v23,  4,  (const char *)[v24 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      unsigned int v25 = ppStmt;
      id v26 = [v16 objectForKeyedSubscript:@"ResolvedAddress"];
      sqlite3_bind_text( v25,  5,  (const char *)[v26 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v27 = ppStmt;
      id v28 = [v16 objectForKeyedSubscript:@"LastSeenTime"];
      sqlite3_bind_int(v27, 6, (int)[v28 intValue]);

      id v29 = ppStmt;
      int v30 = (void *)[v16 objectForKeyedSubscript:@"LastConnectionTime"];
      sqlite3_bind_int(v29, 7, (int)[v30 intValue]);

      uint64_t v31 = ppStmt;
      id v32 = [v16 objectForKeyedSubscript:@"GATTServiceChangeConfig"];
      sqlite3_bind_int(v31, 8, (int)[v32 intValue]);

      uint64_t v33 = ppStmt;
      unsigned __int8 v34 = (void *)[v16 objectForKeyedSubscript:@"Tags"];
      id v35 = [v34 componentsJoinedByString:@","];
      sqlite3_bind_text( v33,  9,  (const char *)[v35 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      uint64_t v36 = ppStmt;
      id v37 = [v16 objectForKeyedSubscript:@"iCloudIdentifier"];
      sqlite3_bind_text( v36,  10,  (const char *)[v37 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      int v38 = sqlite3_step(ppStmt);
      if (v38 != 101)
      {
        id v39 = (os_log_s *)qword_1008F75A0;
        if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
        {
          id v40 = [v18 UTF8String];
          int v41 = sqlite3_errmsg(db);
          int v42 = sqlite3_extended_errcode(db);
          *(_DWORD *)stat buf = 136446978;
          *(void *)int v77 = v40;
          *(_WORD *)&v77[8] = 1024;
          *(_DWORD *)&v77[10] = v38;
          *(_WORD *)&v77[14] = 2082;
          *(void *)&v77[16] = v41;
          __int16 v78 = 1024;
          int v79 = v42;
          _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Failed to migrate device %{public}s with error %d (%{public}s, %d)",  buf,  0x22u);
        }
      }

      sqlite3_reset(ppStmt);
      sqlite3_clear_bindings(ppStmt);
    }

    sqlite3_finalize(ppStmt);
  }

  @"INSERT INTO %s SELECT * FROM Temp ORDER BY LastConnectionTime,LastSeenTime ASC; DROP TABLE Temp",
                                       -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a5))));
  int v44 = sqlite3_exec(db, (const char *)[v43 UTF8String], 0, 0, 0);
  if (v44)
  {
    id v45 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      v59 = sqlite3_errmsg(db);
      int v60 = sqlite3_extended_errcode(db);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)int v77 = v44;
      *(_WORD *)&v77[4] = 2082;
      *(void *)&v77[6] = v59;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v60;
      _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Failed to insert from temporary table with error %d (%{public}s, %d)",  buf,  0x18u);
    }
  }

  @"UPDATE %s SET LastSeenTime = ROWID WHERE LastSeenTime > 0; UPDATE %s SET LastConnectionTime = ROWID WHERE LastConnectionTime > 0",
                    -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a5),
                    -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a5)));

  id v47 = v46;
  int v48 = sqlite3_exec(db, (const char *)[v47 UTF8String], 0, 0, 0);
  if (v48)
  {
    int v49 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      v61 = sqlite3_errmsg(db);
      int v62 = sqlite3_extended_errcode(db);
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)int v77 = v48;
      *(_WORD *)&v77[4] = 2082;
      *(void *)&v77[6] = v61;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v62;
      _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Failed to update from temporary table with error %d (%{public}s, %d)",  buf,  0x18u);
    }
  }

  if (a5 == 1)
  {
    __int16 v50 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 136315394;
      *(void *)int v77 = "/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist";
      *(_WORD *)&v77[8] = 2080;
      *(void *)&v77[10] = "/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.plist";
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "Backing up legacy plist from \"%s\" to \"%s\"",  buf,  0x16u);
    }

    v51 = [NSFileManager defaultManager];
    id v74 = 0LL;
    [v51 copyItemAtPath:@"/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist" toPath:@"/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.plist" error:&v74];
    id v52 = v74;

    if (v52)
    {
      int v53 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
      {
        id v63 = [v52 localizedDescription];
        id v64 = [v63 UTF8String];
        *(_DWORD *)stat buf = 136446210;
        *(void *)int v77 = v64;
        _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Failed to backup legacy plist with error %{public}s",  buf,  0xCu);
      }
    }

    v54 = [NSFileManager defaultManager];
    id v73 = 0LL;
    [v54 removeItemAtPath:@"/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist" error:&v73];
    id v55 = v73;

    if (v55)
    {
      v56 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
      {
        id v65 = [v55 localizedDescription];
        id v66 = [v65 UTF8String];
        *(_DWORD *)stat buf = 136446210;
        *(void *)int v77 = v66;
        _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Failed to clean up legacy plist with error %{public}s",  buf,  0xCu);
      }
    }
  }
}

- (void)wipeDatabaseNameOrigin:(unint64_t)a3
{
  BOOL v5 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = "Other";
    if (!a3) {
      int v6 = "Paired";
    }
    *(_DWORD *)stat buf = 136446210;
    *(void *)id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Wipe Name Origin of %{public}s LE Device Database",  buf,  0xCu);
  }

  uint64_t v7 = 3LL;
  if (!a3) {
    uint64_t v7 = 2LL;
  }
  uint64_t v8 = (sqlite3 *)(&self->super.isa)[v7];
  if (v8)
  {
    id v9 = [NSString stringWithFormat:@"UPDATE %s SET NameOrigin = %d WHERE iCloudIdentifier = ''" , [self tableNameForType:a3], 1LL];
    int v10 = sqlite3_exec(v8, (const char *)[v9 UTF8String], 0, 0, 0);
    if (v10)
    {
      uint64_t v11 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
      {
        id v12 = sqlite3_errmsg(v8);
        int v13 = sqlite3_extended_errcode(v8);
        *(_DWORD *)stat buf = 67109634;
        *(_DWORD *)id v15 = v10;
        *(_WORD *)&v15[4] = 2082;
        *(void *)&v15[6] = v12;
        __int16 v16 = 1024;
        int v17 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to wipe name origin column of the table with error %d (%{public}s, %d)",  buf,  0x18u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
  {
    sub_10066A4E4();
  }

- (void)updateProtectedCacheMetrics
{
  uint64_t v11 = 0LL;
  if (!-[LeDeviceCache readIntFromDatabase:statement:value:]( self,  "readIntFromDatabase:statement:value:",  self->_otherDatabase,  @"SELECT COUNT() FROM OtherDevices WHERE LastSeenTime > 0 AND LastConnectionTime = 0",  &self->_seenDeviceCount)
    && os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
  {
    sub_10066A568();
  }

  if (!-[LeDeviceCache readIntFromDatabase:statement:value:]( self,  "readIntFromDatabase:statement:value:",  self->_otherDatabase,  @"SELECT COUNT() FROM OtherDevices WHERE LastConnectionTime > 0",  &self->_connectedDeviceCount)
    && os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
  {
    sub_10066A53C();
  }

  if (!-[LeDeviceCache readIntFromDatabase:statement:value:]( self,  "readIntFromDatabase:statement:value:",  self->_otherDatabase,  @"SELECT MAX(LastSeenTime) FROM OtherDevices",  (char *)&v11 + 4)
    && os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
  {
    sub_10066A510();
  }

  unsigned __int8 v3 = -[LeDeviceCache readIntFromDatabase:statement:value:]( self,  "readIntFromDatabase:statement:value:",  self->_otherDatabase,  @"SELECT MAX(LastConnectionTime) FROM OtherDevices",  &v11);
  id v4 = (os_log_s *)qword_1008F75A0;
  if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)stat buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Failed to find the maximum last connected time",  buf,  2u);
    id v4 = (os_log_s *)qword_1008F75A0;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = -[LeDeviceCache connectedDeviceCount](self, "connectedDeviceCount");
    unsigned int v6 = -[LeDeviceCache seenDeviceCount](self, "seenDeviceCount");
    *(_DWORD *)stat buf = 67109376;
    unsigned int v13 = v5;
    __int16 v14 = 1024;
    unsigned int v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unpaired device cache contains %d connected device(s) and %d seen device(s)",  buf,  0xEu);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E20C8;
  block[3] = &unk_1008800B8;
  block[4] = self;
  int v9 = HIDWORD(v11);
  int v10 = v11;
  dispatch_async(global_queue, block);
}

- (const)tableNameForType:(unint64_t)a3
{
  if (a3) {
    return "OtherDevices";
  }
  else {
    return "PairedDevices";
  }
}

- (const)friendlyNameForType:(unint64_t)a3
{
  if (a3) {
    return "other devices";
  }
  else {
    return "paired devices";
  }
}

- (BOOL)readIntFromDatabase:(sqlite3 *)a3 statement:(id)a4 value:(int *)a5
{
  ppStmt = 0LL;
  id v7 = a4;
  if (sqlite3_prepare_v2(a3, (const char *)[v7 UTF8String], -1, &ppStmt, 0))
  {
    BOOL v8 = 0;
  }

  else
  {
    int v9 = sqlite3_step(ppStmt);
    BOOL v8 = v9 == 100;
    if (v9 == 100) {
      *a5 = sqlite3_column_int(ppStmt, 0);
    }
    sqlite3_finalize(ppStmt);
  }

  return v8;
}

- (vector<std::string,)findUUIDsWithCustomProperties:(LeDeviceCache *)self
{
  id v6 = a4;
  retstr->var1 = 0LL;
  retstr->var2.var0 = 0LL;
  retstr->var0 = 0LL;
  id v7 = [NSString stringWithFormat:@"SELECT * FROM %s", @"CustomProperties"];
  ppStmt = 0LL;
  otherDatabase = self->_otherDatabase;
  id v56 = v7;
  if (!sqlite3_prepare_v2(otherDatabase, (const char *)[v56 UTF8String], -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      id v12 = sqlite3_column_text(ppStmt, 0);
      unsigned int v13 = sqlite3_column_text(ppStmt, 1);
      if (v13 && v12)
      {
        __int16 v14 = [NSString stringWithUTF8String:v13];
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
        if (-[LeDeviceCache json:hasAnyProperty:](self, "json:hasAnyProperty:", v14, v6))
        {
          sub_10002418C(__p, (char *)[v15 UTF8String]);
          var1 = (char *)retstr->var1;
          var0 = (char *)retstr->var2.var0;
          if (var1 >= var0)
          {
            unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
            unint64_t v20 = v19 + 1;
            if (v19 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
            if (2 * v21 > v20) {
              unint64_t v20 = 2 * v21;
            }
            if (v21 >= 0x555555555555555LL) {
              unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v22 = v20;
            }
            p_var2 = &retstr->var2;
            if (v22) {
              id v23 = (char *)sub_10023F114((uint64_t)&retstr->var2, v22);
            }
            else {
              id v23 = 0LL;
            }
            id v24 = &v23[24 * v19];
            __int128 v25 = *(_OWORD *)__p;
            *((void *)v24 + 2) = v58;
            *(_OWORD *)id v24 = v25;
            __p[1] = 0LL;
            uint64_t v58 = 0LL;
            __p[0] = 0LL;
            v27 = (char *)retstr->var0;
            id v26 = (char *)retstr->var1;
            if (v26 == retstr->var0)
            {
              int64x2_t v30 = vdupq_n_s64((unint64_t)v26);
              id v28 = &v23[24 * v19];
            }

            else
            {
              id v28 = &v23[24 * v19];
              do
              {
                __int128 v29 = *(_OWORD *)(v26 - 24);
                *((void *)v28 - 1) = *((void *)v26 - 1);
                *(_OWORD *)(v28 - 24) = v29;
                v28 -= 24;
                *((void *)v26 - 2) = 0LL;
                *((void *)v26 - 1) = 0LL;
                *((void *)v26 - 3) = 0LL;
                v26 -= 24;
              }

              while (v26 != v27);
              int64x2_t v30 = *(int64x2_t *)&retstr->var0;
            }

            uint64_t v31 = v24 + 24;
            retstr->var0 = v28;
            retstr->var1 = v24 + 24;
            int64x2_t v61 = v30;
            id v32 = retstr->var2.var0;
            retstr->var2.var0 = &v23[24 * v22];
            int v62 = v32;
            uint64_t v60 = v30.i64[0];
            sub_10023F158((uint64_t)&v60);
            int v33 = SHIBYTE(v58);
            retstr->var1 = v31;
            if (v33 < 0) {
              operator delete(__p[0]);
            }
          }

          else
          {
            __int128 v18 = *(_OWORD *)__p;
            *((void *)var1 + 2) = v58;
            *(_OWORD *)var1 = v18;
            retstr->var1 = var1 + 24;
          }
        }
      }
    }
  }

  pairedDatabase = self->_pairedDatabase;
  id v10 = v56;
  if (!sqlite3_prepare_v2(pairedDatabase, (const char *)[v10 UTF8String], -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      unsigned __int8 v34 = sqlite3_column_text(ppStmt, 0);
      id v35 = sqlite3_column_text(ppStmt, 1);
      if (v35 && v34)
      {
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v35));
        id v37 = [NSString stringWithUTF8String:v34];
        if (-[LeDeviceCache json:hasAnyProperty:](self, "json:hasAnyProperty:", v36, v6))
        {
          sub_10002418C(__p, (char *)[v37 UTF8String]);
          id v39 = (char *)retstr->var1;
          int v38 = (char *)retstr->var2.var0;
          if (v39 >= v38)
          {
            unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * ((v39 - (char *)retstr->var0) >> 3);
            unint64_t v42 = v41 + 1;
            if (v41 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((v38 - (char *)retstr->var0) >> 3);
            if (2 * v43 > v42) {
              unint64_t v42 = 2 * v43;
            }
            if (v43 >= 0x555555555555555LL) {
              unint64_t v44 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v44 = v42;
            }
            p_var2 = &retstr->var2;
            if (v44) {
              id v45 = (char *)sub_10023F114((uint64_t)&retstr->var2, v44);
            }
            else {
              id v45 = 0LL;
            }
            v46 = &v45[24 * v41];
            __int128 v47 = *(_OWORD *)__p;
            *((void *)v46 + 2) = v58;
            *(_OWORD *)v46 = v47;
            __p[1] = 0LL;
            uint64_t v58 = 0LL;
            __p[0] = 0LL;
            int v49 = (char *)retstr->var0;
            int v48 = (char *)retstr->var1;
            if (v48 == retstr->var0)
            {
              int64x2_t v52 = vdupq_n_s64((unint64_t)v48);
              __int16 v50 = &v45[24 * v41];
            }

            else
            {
              __int16 v50 = &v45[24 * v41];
              do
              {
                __int128 v51 = *(_OWORD *)(v48 - 24);
                *((void *)v50 - 1) = *((void *)v48 - 1);
                *(_OWORD *)(v50 - 24) = v51;
                v50 -= 24;
                *((void *)v48 - 2) = 0LL;
                *((void *)v48 - 1) = 0LL;
                *((void *)v48 - 3) = 0LL;
                v48 -= 24;
              }

              while (v48 != v49);
              int64x2_t v52 = *(int64x2_t *)&retstr->var0;
            }

            int v53 = v46 + 24;
            retstr->var0 = v50;
            retstr->var1 = v46 + 24;
            int64x2_t v61 = v52;
            v54 = retstr->var2.var0;
            retstr->var2.var0 = &v45[24 * v44];
            int v62 = v54;
            uint64_t v60 = v52.i64[0];
            sub_10023F158((uint64_t)&v60);
            int v55 = SHIBYTE(v58);
            retstr->var1 = v53;
            if (v55 < 0) {
              operator delete(__p[0]);
            }
          }

          else
          {
            __int128 v40 = *(_OWORD *)__p;
            *((void *)v39 + 2) = v58;
            *(_OWORD *)id v39 = v40;
            retstr->var1 = v39 + 24;
          }
        }
      }
    }
  }

  return result;
}

- (vector<std::string,)findUUIDsWithAllCustomProperties:(LeDeviceCache *)self
{
  id v6 = a4;
  retstr->var1 = 0LL;
  retstr->var2.var0 = 0LL;
  retstr->var0 = 0LL;
  id v7 = [NSString stringWithFormat:@"SELECT * FROM %s" @"CustomProperties"];
  ppStmt = 0LL;
  otherDatabase = self->_otherDatabase;
  id v56 = v7;
  if (!sqlite3_prepare_v2(otherDatabase, (const char *)[v56 UTF8String], -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      id v12 = sqlite3_column_text(ppStmt, 0);
      unsigned int v13 = sqlite3_column_text(ppStmt, 1);
      if (v13 && v12)
      {
        __int16 v14 = [NSString stringWithUTF8String:v13];
        unsigned int v15 = [NSString stringWithUTF8String:v12];
        if (-[LeDeviceCache json:hasAllProperties:](self, "json:hasAllProperties:", v14, v6))
        {
          sub_10002418C(__p, (char *)[v15 UTF8String]);
          var1 = (char *)retstr->var1;
          var0 = (char *)retstr->var2.var0;
          if (var1 >= var0)
          {
            unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
            unint64_t v20 = v19 + 1;
            if (v19 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
            if (2 * v21 > v20) {
              unint64_t v20 = 2 * v21;
            }
            if (v21 >= 0x555555555555555LL) {
              unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v22 = v20;
            }
            p_var2 = &retstr->var2;
            if (v22) {
              id v23 = (char *)sub_10023F114((uint64_t)&retstr->var2, v22);
            }
            else {
              id v23 = 0LL;
            }
            id v24 = &v23[24 * v19];
            __int128 v25 = *(_OWORD *)__p;
            *((void *)v24 + 2) = v58;
            *(_OWORD *)id v24 = v25;
            __p[1] = 0LL;
            uint64_t v58 = 0LL;
            __p[0] = 0LL;
            v27 = (char *)retstr->var0;
            id v26 = (char *)retstr->var1;
            if (v26 == retstr->var0)
            {
              int64x2_t v30 = vdupq_n_s64((unint64_t)v26);
              id v28 = &v23[24 * v19];
            }

            else
            {
              id v28 = &v23[24 * v19];
              do
              {
                __int128 v29 = *(_OWORD *)(v26 - 24);
                *((void *)v28 - 1) = *((void *)v26 - 1);
                *(_OWORD *)(v28 - 24) = v29;
                v28 -= 24;
                *((void *)v26 - 2) = 0LL;
                *((void *)v26 - 1) = 0LL;
                *((void *)v26 - 3) = 0LL;
                v26 -= 24;
              }

              while (v26 != v27);
              int64x2_t v30 = *(int64x2_t *)&retstr->var0;
            }

            uint64_t v31 = v24 + 24;
            retstr->var0 = v28;
            retstr->var1 = v24 + 24;
            int64x2_t v61 = v30;
            id v32 = retstr->var2.var0;
            retstr->var2.var0 = &v23[24 * v22];
            int v62 = v32;
            uint64_t v60 = v30.i64[0];
            sub_10023F158((uint64_t)&v60);
            int v33 = SHIBYTE(v58);
            retstr->var1 = v31;
            if (v33 < 0) {
              operator delete(__p[0]);
            }
          }

          else
          {
            __int128 v18 = *(_OWORD *)__p;
            *((void *)var1 + 2) = v58;
            *(_OWORD *)var1 = v18;
            retstr->var1 = var1 + 24;
          }
        }
      }
    }
  }

  pairedDatabase = self->_pairedDatabase;
  id v10 = v56;
  if (!sqlite3_prepare_v2(pairedDatabase, (const char *)[v10 UTF8String], -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      unsigned __int8 v34 = sqlite3_column_text(ppStmt, 0);
      id v35 = sqlite3_column_text(ppStmt, 1);
      if (v35 && v34)
      {
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v35));
        id v37 = [NSString stringWithUTF8String:v34];
        if (-[LeDeviceCache json:hasAllProperties:](self, "json:hasAllProperties:", v36, v6))
        {
          sub_10002418C(__p, (char *)[v37 UTF8String]);
          id v39 = (char *)retstr->var1;
          int v38 = (char *)retstr->var2.var0;
          if (v39 >= v38)
          {
            unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * ((v39 - (char *)retstr->var0) >> 3);
            unint64_t v42 = v41 + 1;
            if (v41 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((v38 - (char *)retstr->var0) >> 3);
            if (2 * v43 > v42) {
              unint64_t v42 = 2 * v43;
            }
            if (v43 >= 0x555555555555555LL) {
              unint64_t v44 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v44 = v42;
            }
            p_var2 = &retstr->var2;
            if (v44) {
              id v45 = (char *)sub_10023F114((uint64_t)&retstr->var2, v44);
            }
            else {
              id v45 = 0LL;
            }
            v46 = &v45[24 * v41];
            __int128 v47 = *(_OWORD *)__p;
            *((void *)v46 + 2) = v58;
            *(_OWORD *)v46 = v47;
            __p[1] = 0LL;
            uint64_t v58 = 0LL;
            __p[0] = 0LL;
            int v49 = (char *)retstr->var0;
            int v48 = (char *)retstr->var1;
            if (v48 == retstr->var0)
            {
              int64x2_t v52 = vdupq_n_s64((unint64_t)v48);
              __int16 v50 = &v45[24 * v41];
            }

            else
            {
              __int16 v50 = &v45[24 * v41];
              do
              {
                __int128 v51 = *(_OWORD *)(v48 - 24);
                *((void *)v50 - 1) = *((void *)v48 - 1);
                *(_OWORD *)(v50 - 24) = v51;
                v50 -= 24;
                *((void *)v48 - 2) = 0LL;
                *((void *)v48 - 1) = 0LL;
                *((void *)v48 - 3) = 0LL;
                v48 -= 24;
              }

              while (v48 != v49);
              int64x2_t v52 = *(int64x2_t *)&retstr->var0;
            }

            int v53 = v46 + 24;
            retstr->var0 = v50;
            retstr->var1 = v46 + 24;
            int64x2_t v61 = v52;
            v54 = retstr->var2.var0;
            retstr->var2.var0 = &v45[24 * v44];
            int v62 = v54;
            uint64_t v60 = v52.i64[0];
            sub_10023F158((uint64_t)&v60);
            int v55 = SHIBYTE(v58);
            retstr->var1 = v53;
            if (v55 < 0) {
              operator delete(__p[0]);
            }
          }

          else
          {
            __int128 v40 = *(_OWORD *)__p;
            *((void *)v39 + 2) = v58;
            *(_OWORD *)id v39 = v40;
            retstr->var1 = v39 + 24;
          }
        }
      }
    }
  }

  return result;
}

- (id)customPropertiesJSONFromDevice:(const void *)a3
{
  unsigned __int8 v3 = (NSString *)a3;
  if (a3)
  {
    id v4 = sub_1005C50F4((uint64_t)a3);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = v5;
    if (!v5 || ![v5 count])
    {
      unsigned __int8 v3 = 0LL;
LABEL_23:

      return v3;
    }

    id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          id v13 = sub_1005C5120((uint64_t)v3, v12);
          __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          if (v14) {
            -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v14, v12);
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v9);
    }

    if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v7))
    {
      unsigned int v15 = objc_alloc(&OBJC_CLASS___NSString);
      id v19 = 0LL;
      __int16 v16 = [NSJSONSerialization dataWithJSONObject:v7 options:3 error:&v19];
      id v17 = v19;
      unsigned __int8 v3 = -[NSString initWithData:encoding:](v15, "initWithData:encoding:", v16, 4LL);

      if (!v17)
      {
        id v6 = v8;
        goto LABEL_22;
      }

      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
        sub_10066A594();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      sub_10066A600();
    }

    unsigned __int8 v3 = 0LL;
LABEL_22:

    goto LABEL_23;
  }

  return v3;
}

- (BOOL)json:(id)a3 hasAnyProperty:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 dataUsingEncoding:4];
    id v23 = 0LL;
    id v8 = [NSJSONSerialization JSONObjectWithData:v7 options:17 error:&v23];
    id v9 = v23;

    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
        sub_10066A6D0();
      }
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
      {
        id v9 = v8;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        id v12 = v6;
        id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v20;
          while (2)
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
              id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys", (void)v19));
              LOBYTE(v16) = [v17 containsObject:v16];

              if ((v16 & 1) != 0)
              {

                BOOL v10 = 1;
                goto LABEL_19;
              }
            }

            id v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
      {
        sub_10066A664();
      }
    }

    BOOL v10 = 0;
LABEL_19:
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)json:(id)a3 hasAllProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = (void *)[v5 dataUsingEncoding:4];
    id v17 = 0LL;
    id v8 = [NSJSONSerialization JSONObjectWithData:v7 options:17 error:&v17];
    id v9 = v17;

    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
        sub_10066A7A8();
      }
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
      {
        id v12 = v8;
        id v13 = (void *)[v12 allKeys];
        uint64_t v14 = (void *)[NSSet setWithArray:v13];

        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
        unsigned __int8 v10 = [v15 isSubsetOfSet:v14];

LABEL_11:
        goto LABEL_12;
      }

      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
        sub_10066A73C();
      }
    }

    unsigned __int8 v10 = 0;
    goto LABEL_11;
  }

  unsigned __int8 v10 = 0;
LABEL_12:

  return v10;
}

- (void)customPropertiesToDevice:(void *)a3 fromJSON:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 && v5)
  {
    id v7 = (void *)[v5 dataUsingEncoding:4];
    id v22 = 0LL;
    id v8 = [NSJSONSerialization JSONObjectWithData:v7 options:17 error:&v22];
    id v17 = v22;

    if (v17 && os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
      sub_10066A880();
    }
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      id v10 = v8;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      uint64_t v11 = (void *)[v10 allKeys];
      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v19;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v11);
            }
            unsigned int v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
            uint64_t v16 = (void *)[v10 objectForKey:v15];
            sub_1005C51A8((uint64_t)a3, v15, v16);
          }

          id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }

        while (v12);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      sub_10066A814();
    }
  }
}

- (void)writeCustomPropertiesJSONForDevice:(const void *)a3 inDatabase:(sqlite3 *)a4
{
  if (a3 && a4)
  {
    id v7 = *(id *)a3;
    if (v7)
    {
      id v8 = [self customPropertiesJSONFromDevice:a3];
      if (v8)
      {
        ppStmt = 0LL;
        id v9 = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %s (%s, %s) VALUES (?1, ?2)", "CustomProperties", "Uuid", "JSON"];
        if (sqlite3_prepare_v2(a4, (const char *)[v9 UTF8String], -1, &ppStmt, 0))
        {
          if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
            sub_10066A918();
          }
        }

        else
        {
          id v12 = ppStmt;
          id v13 = [v7 UUIDString];
          sqlite3_bind_text( v12,  1,  (const char *)[v13 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          sqlite3_bind_text( ppStmt, 2, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          int v14 = sqlite3_step(ppStmt);
          if (v14 != 101)
          {
            unsigned int v15 = (os_log_s *)qword_1008F75A0;
            if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
            {
              uint64_t v16 = sqlite3_errmsg(a4);
              int v17 = sqlite3_extended_errcode(a4);
              *(_DWORD *)stat buf = 67109634;
              int v20 = v14;
              __int16 v21 = 2082;
              id v22 = v16;
              __int16 v23 = 1024;
              int v24 = v17;
              _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to create prepared write statement for Custom Properties cache with error %d (%{public}s, %d)",  buf,  0x18u);
            }
          }

          sqlite3_reset(ppStmt);
          sqlite3_clear_bindings(ppStmt);
          sqlite3_finalize(ppStmt);
        }
      }

      else
      {
        uint64_t v11 = (void *)[v7 UUIDString];
        -[LeDeviceCache removeCustomPropertiesJSONForDeviceUUID:inDatabase:]( self,  "removeCustomPropertiesJSONForDeviceUUID:inDatabase:",  v11,  a4);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      sub_10066A8EC();
    }
  }

  else
  {
    id v10 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
      sub_10066A97C(a3 != 0LL, a4 != 0LL, v10);
    }
  }

- (void)removeCustomPropertiesJSONForDeviceUUID:(id)a3 inDatabase:(sqlite3 *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[LeDeviceCache readCustomPropertiesJSONForDeviceUUID:inDatabase:]( self,  "readCustomPropertiesJSONForDeviceUUID:inDatabase:",  v6,  a4));

  if (v7)
  {
    ppStmt = 0LL;
    id v8 = [NSString stringWithFormat:@"DELETE FROM %s WHERE %s = '%@'", "CustomProperties", "Uuid", v6];
    int v9 = sqlite3_prepare_v2(a4, (const char *)[v8 UTF8String], -1, &ppStmt, 0);
    if (v9)
    {
      id v10 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v8 UTF8String];
        id v12 = sqlite3_errmsg(a4);
        int v13 = sqlite3_extended_errcode(a4);
        *(_DWORD *)stat buf = 136315906;
        id v21 = v11;
        __int16 v22 = 1024;
        int v23 = v9;
        __int16 v24 = 2082;
        __int128 v25 = v12;
        __int16 v26 = 1024;
        int v27 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to prepare statement %s with error %d (%{public}s, %d)",  buf,  0x22u);
      }
    }

    else
    {
      int v14 = sqlite3_step(ppStmt);
      if (v14 != 101)
      {
        unsigned int v15 = (os_log_s *)qword_1008F75A0;
        if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
        {
          id v16 = [v8 UTF8String];
          int v17 = sqlite3_errmsg(a4);
          int v18 = sqlite3_extended_errcode(a4);
          *(_DWORD *)stat buf = 136315906;
          id v21 = v16;
          __int16 v22 = 1024;
          int v23 = v14;
          __int16 v24 = 2082;
          __int128 v25 = v17;
          __int16 v26 = 1024;
          int v27 = v18;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to execute statement %s with error %d (%{public}s, %d)",  buf,  0x22u);
        }
      }

      sqlite3_finalize(ppStmt);
    }
  }
}

- (id)readCustomPropertiesJSONForDeviceUUID:(id)a3 inDatabase:(sqlite3 *)a4
{
  id v5 = a3;
  id v6 = 0LL;
  if (v5 && a4)
  {
    ppStmt = 0LL;
    id v7 = [NSString stringWithFormat:@"SELECT * FROM %s WHERE %s = '%@'", "CustomProperties", "Uuid", v5];
    int v8 = sqlite3_prepare_v2(a4, (const char *)[v7 UTF8String], -1, &ppStmt, 0);
    if (v8)
    {
      int v9 = (os_log_s *)qword_1008F75A0;
      if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v7 UTF8String];
        int v14 = sqlite3_errmsg(a4);
        int v15 = sqlite3_extended_errcode(a4);
        *(_DWORD *)stat buf = 136315906;
        id v18 = v13;
        __int16 v19 = 1024;
        int v20 = v8;
        __int16 v21 = 2082;
        __int16 v22 = v14;
        __int16 v23 = 1024;
        int v24 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to execute statement %s with error %d (%{public}s, %d)",  buf,  0x22u);
      }

      id v6 = 0LL;
      goto LABEL_15;
    }

    int v10 = sqlite3_step(ppStmt);
    if (v10 != 101)
    {
      if (v10 == 100)
      {
        id v11 = sqlite3_column_text(ppStmt, 1);
        if (v11)
        {
          id v6 = [NSString stringWithUTF8String:v11];
LABEL_14:
          sqlite3_finalize(ppStmt);
LABEL_15:

          goto LABEL_16;
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
      {
        sub_10066AA14();
      }
    }

    id v6 = 0LL;
    goto LABEL_14;
  }

- (void)readCustomPropertiesJSONForDevice:(void *)a3 inDatabase:(sqlite3 *)a4
{
  if (a3 && a4)
  {
    id v7 = *(id *)a3;
    int v8 = v7;
    if (v7)
    {
      int v9 = (void *)[v7 UUIDString];
      int v10 = (void *)objc_claimAutoreleasedReturnValue( -[LeDeviceCache readCustomPropertiesJSONForDeviceUUID:inDatabase:]( self,  "readCustomPropertiesJSONForDeviceUUID:inDatabase:",  v9,  a4));

      if (v10) {
        -[LeDeviceCache customPropertiesToDevice:fromJSON:](self, "customPropertiesToDevice:fromJSON:", a3, v10);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      sub_10066AA74();
    }
  }

- (void)readDeviceFromDatabase:(sqlite3 *)a3 statement:(id)a4
{
  ppStmt = 0LL;
  id v6 = a4;
  int v7 = sqlite3_prepare_v2(a3, (const char *)[v6 UTF8String], -1, &ppStmt, 0);
  if (v7)
  {
    int v8 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
    {
      id v28 = [v6 UTF8String];
      __int128 v29 = sqlite3_errmsg(a3);
      int v30 = sqlite3_extended_errcode(a3);
      *(_DWORD *)stat buf = 136315906;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v29;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v30;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to execute statement %s with error %d (%{public}s, %d)",  buf,  0x22u);
    }

    int v9 = 0LL;
    goto LABEL_64;
  }

  int v10 = sqlite3_step(ppStmt);
  int v11 = v10;
  if (v10 == 101)
  {
LABEL_31:
    int v9 = 0LL;
    goto LABEL_63;
  }

  if (v10 != 100)
  {
    __int16 v26 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
      sub_10066AAA0(v11, v26, v27);
    }
    goto LABEL_31;
  }

  uint64_t v12 = 0LL;
  id v54 = 0LL;
  id v55 = 0LL;
  int64x2_t v52 = 0LL;
  id v53 = 0LL;
  id v50 = 0LL;
  id v51 = 0LL;
  id v48 = 0LL;
  id v49 = 0LL;
  id v47 = 0LL;
  *(void *)stat buf = &v55;
  *(void *)&uint8_t buf[8] = &v54;
  *(void *)&buf[16] = &v49;
  *(void *)&_BYTE buf[24] = &v53;
  *(void *)&buf[32] = &v52;
  int64x2_t v61 = &v48;
  int v62 = &v47;
  id v63 = &v46;
  id v64 = &v51;
  id v65 = &v50;
  id v46 = 0LL;
  do
  {
    uint64_t v13 = qword_1008F71B0[v12];
    if (v13 == objc_opt_class(&OBJC_CLASS___NSString))
    {
      id v18 = sqlite3_column_text(ppStmt, v12);
      if (v18)
      {
        int v15 = *(uint64_t **)&buf[8 * v12];
        if (!*v15)
        {
          uint64_t v17 = [NSString stringWithUTF8String:v18];
          goto LABEL_15;
        }
      }
    }

    else
    {
      uint64_t v14 = qword_1008F71B0[v12];
      if (v14 == objc_opt_class(&OBJC_CLASS___NSNumber))
      {
        int v15 = *(uint64_t **)&buf[8 * v12];
        if (!*v15)
        {
          id v16 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sqlite3_column_int(ppStmt, v12));
          uint64_t v17 = [v16 autorelease];
LABEL_15:
          __int16 v19 = (void *)*v15;
          *int v15 = v17;
        }
      }
    }

    ++v12;
  }

  while (v12 != 10);
  int v20 = objc_alloc(&OBJC_CLASS___NSUUID);
  __int16 v21 = -[NSUUID initWithUUIDString:](v20, "initWithUUIDString:", v55);
  if (!v53 && os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_FAULT)) {
    sub_10066AB60((uint64_t)[v55 UTF8String], (uint64_t)v59);
  }
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_FAULT))
    {
      [v53 UTF8String];
      [v55 UTF8String];
      sub_10066AB1C();
    }

    goto LABEL_34;
  }

  id v22 = v53;
  if (!v53)
  {
LABEL_34:
    int v9 = 0LL;
    goto LABEL_62;
  }

  int v9 = (char *)operator new(0x268uLL);
  unint64_t v23 = sub_1005C02B0(v22);
  sub_1002E545C((uint64_t)v9, v21, v23);
  *((void *)v9 + 2) = sub_1005C02B0(v53);
  if (v52)
  {
    unint64_t v24 = sub_1005C02B0(v52);
    if (v24) {
      *((void *)v9 + 3) = v24;
    }
  }

  if (v54)
  {
    else {
      int v25 = 2;
    }
    id v31 = objc_claimAutoreleasedReturnValue(-[LeDeviceCache nameFromSanitizedName:](self, "nameFromSanitizedName:", v54));
    sub_10002418C(&__p, (char *)[v31 UTF8String]);
    sub_1005C08B0((uint64_t)v9, &__p, v25, 0);
  }

  if (v48) {
    *((_DWORD *)v9 + 33) = [v48 intValue];
  }
  if (v47) {
    *((_DWORD *)v9 + 34) = [v47 intValue];
  }
  if (v46) {
    v9[162] = [v46 BOOLValue];
  }
  if (v51)
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v51 componentsSeparatedByString:@","]);
    int v33 = v32;
    if (v32)
    {
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v34 = v32;
      id v35 = [v34 countByEnumeratingWithState:&v41 objects:v58 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v42;
        do
        {
          for (i = 0LL; i != v35; i = (char *)i + 1)
          {
            if (*(void *)v42 != v36) {
              objc_enumerationMutation(v34);
            }
            sub_10002418C( v39, (char *)[*(id *)(*((void *)&v41 + 1) + 8 * (void)i) UTF8String]);
            sub_1005C0684((uint64_t)v9, (uint64_t)v39);
            if (v40 < 0) {
              operator delete(v39[0]);
            }
          }

          id v35 = [v34 countByEnumeratingWithState:&v41 objects:v58 count:16];
        }

        while (v35);
      }
    }
  }

  if (v50)
  {
    sub_10002418C(&__str, (char *)[v50 UTF8String]);
    std::string::operator=((std::string *)(v9 + 208), &__str);
  }

  -[LeDeviceCache readCustomPropertiesJSONForDevice:inDatabase:]( self,  "readCustomPropertiesJSONForDevice:inDatabase:",  v9,  a3);
LABEL_62:

LABEL_63:
  sqlite3_finalize(ppStmt);
LABEL_64:

  return v9;
}

- (id)nameFromSanitizedName:(id)a3
{
  unsigned __int8 v3 = (void *)[a3 componentsSeparatedByString:@"///900"];
  id v4 = [v3 componentsJoinedByString:@"’"];

  id v5 = [v4 componentsSeparatedByString:@"///901"];
  id v6 = [v5 componentsJoinedByString:@"'"];

  int v7 = (void *)[v6 componentsSeparatedByString:@"///902"];

  return v8;
}

- (void)evictIfNeeded:(BOOL)a3
{
  ppStmt = 0LL;
  if (a3)
  {
    int v4 = -[LeDeviceCache connectedDeviceCount](self, "connectedDeviceCount");
    if (v4 >= -[LeDeviceCache maxConnectedDevices](self, "maxConnectedDevices")
      && !sqlite3_prepare_v2( self->_otherDatabase,  "SELECT Uuid FROM OtherDevices WHERE ROWID = (SELECT ROWID FROM OtherDevices WHERE LastConnectionTime != 0 OR DER BY LastConnectionTime ASC LIMIT 1)",  -1,  &ppStmt,  0LL))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        id v5 = sqlite3_column_text(ppStmt, 0);
        if (v5) {
          id v6 = [NSString stringWithUTF8String:v5];
        }
        else {
          id v6 = 0LL;
        }
        otherDatabase = self->_otherDatabase;
        id v10 = [NSString stringWithFormat:@"DELETE FROM OtherDevices WHERE Uuid = '%s'", v5];
        int v11 = sqlite3_exec(otherDatabase, (const char *)[v10 UTF8String], 0, 0, 0);

        uint64_t v12 = (os_log_s *)qword_1008F75A0;
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
            uint64_t v14 = sqlite3_errmsg(self->_otherDatabase);
            int v15 = sqlite3_extended_errcode(self->_otherDatabase);
            *(_DWORD *)stat buf = 136447234;
            uint64_t v27 = v5;
            __int16 v28 = 2082;
            __int128 v29 = v13;
            __int16 v30 = 1024;
            int v31 = v11;
            __int16 v32 = 2082;
            int v33 = v14;
            __int16 v34 = 1024;
            int v35 = v15;
            _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to delete the oldest connected device %{public}s from '%{public}s' cache with error %d (%{public}s, %d)",  buf,  0x2Cu);
          }
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
          {
            unint64_t v23 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
            *(_DWORD *)stat buf = 136446466;
            uint64_t v27 = v5;
            __int16 v28 = 2082;
            __int128 v29 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Successfully evicted oldest connected device %{public}s from '%{public}s' cache",  buf,  0x16u);
          }

          -[LeDeviceCache setConnectedDeviceCount:]( self,  "setConnectedDeviceCount:",  -[LeDeviceCache connectedDeviceCount](self, "connectedDeviceCount") - 1);
        }

        if (v6)
        {
LABEL_24:
          -[LeDeviceCache removeCustomPropertiesJSONForDeviceUUID:inDatabase:]( self,  "removeCustomPropertiesJSONForDeviceUUID:inDatabase:",  v6,  self->_otherDatabase);
LABEL_34:

          goto LABEL_35;
        }

        if (!os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
LABEL_33:
        sub_10066ABA0();
        goto LABEL_34;
      }

      goto LABEL_35;
    }
  }

  else
  {
    int v7 = -[LeDeviceCache seenDeviceCount](self, "seenDeviceCount");
    if (v7 >= -[LeDeviceCache maxSeenDevices](self, "maxSeenDevices")
      && !sqlite3_prepare_v2( self->_otherDatabase,  "SELECT Uuid FROM OtherDevices WHERE ROWID = (SELECT ROWID FROM OtherDevices WHERE LastConnectionTime = 0 ORD ER BY LastSeenTime ASC LIMIT 1)",  -1,  &ppStmt,  0LL))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        int v8 = sqlite3_column_text(ppStmt, 0);
        if (v8) {
          id v6 = [NSString stringWithUTF8String:v8];
        }
        else {
          id v6 = 0LL;
        }
        id v16 = self->_otherDatabase;
        id v17 = [NSString stringWithFormat:@"DELETE FROM OtherDevices WHERE Uuid = '%s'" v8];
        int v18 = sqlite3_exec(v16, (const char *)[v17 UTF8String], 0, 0, 0);

        __int16 v19 = (os_log_s *)qword_1008F75A0;
        if (v18)
        {
          if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
          {
            int v20 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
            __int16 v21 = sqlite3_errmsg(self->_otherDatabase);
            int v22 = sqlite3_extended_errcode(self->_otherDatabase);
            *(_DWORD *)stat buf = 136447234;
            uint64_t v27 = v8;
            __int16 v28 = 2082;
            __int128 v29 = v20;
            __int16 v30 = 1024;
            int v31 = v18;
            __int16 v32 = 2082;
            int v33 = v21;
            __int16 v34 = 1024;
            int v35 = v22;
            _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to delete the oldest seen device %{public}s from '%{public}s' cache with error %d (%{public}s, %d)",  buf,  0x2Cu);
          }
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_INFO))
          {
            unint64_t v24 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1LL);
            *(_DWORD *)stat buf = 136446466;
            uint64_t v27 = v8;
            __int16 v28 = 2082;
            __int128 v29 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Successfully evicted oldest seen device %{public}s from '%{public}s' cache",  buf,  0x16u);
          }

          -[LeDeviceCache setSeenDeviceCount:]( self,  "setSeenDeviceCount:",  -[LeDeviceCache seenDeviceCount](self, "seenDeviceCount") - 1);
        }

        if (v6) {
          goto LABEL_24;
        }
        if (!os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }

- (void)printDebug
{
  unsigned __int8 v3 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "statedump: ---------------- LE Device Database ----------------",  v4,  2u);
  }

  -[LeDeviceCache printDatabase:](self, "printDatabase:", 0LL);
  -[LeDeviceCache printDatabase:](self, "printDatabase:", 1LL);
}

- (void)printDatabase:(unint64_t)a3
{
  id v61 = 0LL;
  id v62 = 0LL;
  id v59 = 0LL;
  id v60 = 0LL;
  id v57 = 0LL;
  id v58 = 0LL;
  id v55 = 0LL;
  id v56 = 0LL;
  id v53 = 0LL;
  id v54 = 0LL;
  v74[0] = &v62;
  v74[1] = &v61;
  v74[2] = &v56;
  v74[3] = &v60;
  v74[4] = &v59;
  v74[5] = &v55;
  v74[6] = &v54;
  v74[7] = &v53;
  v74[8] = &v58;
  v74[9] = &v57;
  id v5 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "Other devices";
    if (!a3) {
      id v6 = "Paired devices";
    }
    *(_DWORD *)stat buf = 136446210;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump: %{public}s:", buf, 0xCu);
  }

  uint64_t v7 = 3LL;
  if (!a3) {
    uint64_t v7 = 2LL;
  }
  int v8 = (sqlite3 *)(&self->super.isa)[v7];
  if (v8)
  {
    ppStmt = 0LL;
    id v9 = [NSString stringWithFormat:@"SELECT * FROM %s" [self tableNameForType:a3]];
    int v10 = sqlite3_prepare_v2(v8, (const char *)[v9 UTF8String], -1, &ppStmt, 0);

    if (!v10)
    {
      while (1)
      {
        if (sqlite3_step(ppStmt) != 100)
        {
          sqlite3_finalize(ppStmt);
          break;
        }

        uint64_t v12 = objc_autoreleasePoolPush();
        for (uint64_t i = 0LL; i != 10; ++i)
        {
          uint64_t v14 = qword_1008F71B0[i];
          if (v14 == objc_opt_class(&OBJC_CLASS___NSString))
          {
            int v18 = sqlite3_column_text(ppStmt, i);
            if (!v18)
            {
              __int16 v21 = (void **)v74[i];
              int v20 = *v21;
              *__int16 v21 = &stru_1008A57D8;
              goto LABEL_19;
            }

            uint64_t v17 = [NSString stringWithUTF8String:v18];
          }

          else
          {
            uint64_t v15 = qword_1008F71B0[i];
            if (v15 != objc_opt_class(&OBJC_CLASS___NSNumber)) {
              continue;
            }
            id v16 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", sqlite3_column_int(ppStmt, i));
            uint64_t v17 = [v16 autorelease];
          }

          __int16 v19 = (void **)v74[i];
          int v20 = *v19;
          *__int16 v19 = (void *)v17;
LABEL_19:
        }

        uint64_t v73 = 0LL;
        __int128 v71 = 0u;
        memset(v72, 0, sizeof(v72));
        *(_OWORD *)std::string __p = 0u;
        __int128 v70 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        *(_OWORD *)stat buf = 0u;
        __int128 v66 = 0u;
        sub_10020E564((uint64_t)buf);
        if (v62)
        {
          int v22 = (const char *)[v62 UTF8String];
          size_t v23 = strlen(v22);
          sub_1001FD17C(buf, (uint64_t)v22, v23);
        }

        sub_1001FD17C(buf, (uint64_t)" → ", 5LL);
        if ([v60 length])
        {
          unint64_t v24 = (const char *)[v60 UTF8String];
          size_t v25 = strlen(v24);
          sub_1001FD17C(buf, (uint64_t)v24, v25);
          if ([v59 length])
          {
            if (([v60 isEqualToString:v59] & 1) == 0)
            {
              __int16 v26 = sub_1001FD17C(buf, (uint64_t)" (", 2LL);
              uint64_t v27 = (const char *)[v59 UTF8String];
              size_t v28 = strlen(v27);
              __int128 v29 = sub_1001FD17C(v26, (uint64_t)v27, v28);
              sub_1001FD17C(v29, (uint64_t)")", 1LL);
            }
          }
        }

        if ([v61 length])
        {
          sub_1001FD17C(buf, (uint64_t)", ", 2LL);
          if ([v56 intValue] == 2)
          {
            __int16 v30 = "GAP";
            uint64_t v31 = 3LL;
            goto LABEL_35;
          }

          if ([v56 intValue] == 1)
          {
            __int16 v30 = "Adv.";
            goto LABEL_32;
          }

          if ([v56 intValue] == 4)
          {
            __int16 v30 = "FindMy";
            uint64_t v31 = 6LL;
            goto LABEL_35;
          }

          if ([v56 intValue] == 3)
          {
            __int16 v30 = "User";
LABEL_32:
            uint64_t v31 = 4LL;
LABEL_35:
            sub_1001FD17C(buf, (uint64_t)v30, v31);
          }

          __int16 v32 = sub_1001FD17C(buf, (uint64_t)"Name: ", 6LL);
          int v33 = sub_1001FD17C(v32, (uint64_t)"\"", 1LL);
          uint64_t v34 = sub_1002E6E00();
          int v35 = "";
          size_t v36 = strlen(v35);
          id v37 = sub_1001FD17C(v33, (uint64_t)v35, v36);
          sub_1001FD17C(v37, (uint64_t)"\"", 1LL);
        }

        if ([v55 intValue])
        {
          int v38 = sub_1001FD17C(buf, (uint64_t)", LastSeen: ", 12LL);
          std::ostream::operator<<(v38, [v55 intValue]);
        }

        if ([v54 intValue])
        {
          id v39 = sub_1001FD17C(buf, (uint64_t)", LastConn: ", 12LL);
          std::ostream::operator<<(v39, [v54 intValue]);
        }

        if ([v57 length])
        {
          char v40 = sub_1001FD17C(buf, (uint64_t)", iCloud: ", 10LL);
          __int128 v41 = (const char *)[v57 UTF8String];
          size_t v42 = strlen(v41);
          sub_1001FD17C(v40, (uint64_t)v41, v42);
        }

        if ([v58 length])
        {
          __int128 v43 = sub_1001FD17C(buf, (uint64_t)", Tags: ", 8LL);
          id v44 = [v58 stringByReplacingOccurrencesOfString:@"," withString:@","];
          id v45 = (const char *)[v44 UTF8String];
          size_t v46 = strlen(v45);
          sub_1001FD17C(v43, (uint64_t)v45, v46);
        }

        id v47 = (os_log_s *)qword_1008F75A0;
        if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
        {
          std::stringbuf::str(&v51, (const std::stringbuf *)&buf[8]);
          id v48 = &v51;
          if ((v51.__r_.__value_.__s.__size_ & 0x80u) != 0) {
            id v48 = (std::stringbuf::string_type *)v51.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)id v63 = 136446210;
          id v64 = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "statedump: %{public}s", v63, 0xCu);
        }

        *(void *)stat buf = v11;
        *(void *)&buf[*(void *)(v11 - 24)] = v50;
        if (SHIBYTE(v70) < 0) {
          operator delete(__p[1]);
        }
        std::streambuf::~streambuf(&buf[8]);
        std::ios::~ios(v72);
        objc_autoreleasePoolPop(v12);
      }
    }
  }

  else
  {
    id v49 = (os_log_s *)qword_1008F75A0;
    if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "statedump:    Cache has not been loaded",  buf,  2u);
    }
  }
}

- (int)maxSeenDevices
{
  return self->_maxSeenDevices;
}

- (int)maxConnectedDevices
{
  return self->_maxConnectedDevices;
}

- (int)seenDeviceCount
{
  return self->_seenDeviceCount;
}

- (void)setSeenDeviceCount:(int)a3
{
  self->_seenDeviceCount = a3;
}

- (int)connectedDeviceCount
{
  return self->_connectedDeviceCount;
}

- (void)setConnectedDeviceCount:(int)a3
{
  self->_connectedDeviceCount = a3;
}

@end