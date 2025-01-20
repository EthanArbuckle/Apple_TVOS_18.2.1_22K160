@interface UASharedPasteboardDataManager
+ (id)sharedInstance;
- (BOOL)createTmpArchiveFileWithUUID:(id)a3;
- (BOOL)directoryExistsAtPath:(id)a3;
- (BOOL)fileExistsForUUID:(id)a3 inSubFolder:(id)a4;
- (NSMutableDictionary)lockTokens;
- (NSMutableDictionary)providers;
- (NSMutableDictionary)tmpArchiveWriteFiles;
- (NSString)currentLocalBlobPath;
- (NSString)currentRemoteBlobPath;
- (UASharedPasteboardDataManager)init;
- (id)createFileForLocalPasteboardBlob;
- (id)createFileForRemotePasteboardBlob;
- (id)createFileForUUID:(id)a3;
- (id)createFileForUUID:(id)a3 inSubFolder:(id)a4;
- (id)createFolderAtPath:(id)a3;
- (id)createSharedDataDirectory;
- (id)fileURLForArchiveWithUUID:(id)a3;
- (id)fileURLForCloneItems;
- (id)fileURLForPasteboardItem:(id)a3;
- (id)localPasteboardBlobForReading;
- (id)readHandleForArchiveWithUUID:(id)a3;
- (id)remotePasteboardBlobForReading;
- (id)sharedDataPath;
- (id)subDirForItem:(id)a3;
- (void)cancelAllLocks;
- (void)cleanupArchiveDir;
- (void)cleanupCloneDir;
- (void)cleanupForItem:(id)a3;
- (void)cleanupItemsDir;
- (void)finishWritingArchiveForUUID:(id)a3;
- (void)obtainLockForItem:(id)a3 completion:(id)a4;
- (void)releaseLockForItem:(id)a3;
- (void)releaseLockForItem:(id)a3 withError:(id)a4;
- (void)setCurrentLocalBlobPath:(id)a3;
- (void)setCurrentRemoteBlobPath:(id)a3;
- (void)setLockTokens:(id)a3;
- (void)setProviders:(id)a3;
- (void)setTmpArchiveWriteFiles:(id)a3;
- (void)writeArchiveData:(id)a3 forItem:(id)a4;
@end

@implementation UASharedPasteboardDataManager

+ (id)sharedInstance
{
  if (qword_1000DE258 != -1) {
    dispatch_once(&qword_1000DE258, &stru_1000BCD98);
  }
  return (id)qword_1000DE250;
}

- (UASharedPasteboardDataManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UASharedPasteboardDataManager;
  v2 = -[UASharedPasteboardDataManager init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager createSharedDataDirectory](v2, "createSharedDataDirectory"));
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[UASharedPasteboardDataManager setTmpArchiveWriteFiles:](v3, "setTmpArchiveWriteFiles:", v5);

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[UASharedPasteboardDataManager setLockTokens:](v3, "setLockTokens:", v6);

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[UASharedPasteboardDataManager setProviders:](v3, "setProviders:", v7);

    if (v4)
    {
      os_log_t v8 = sub_100039584(@"pasteboard-server");
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "[FILE MANAGER] ERROR creating shared pasteboard dir: %@",  buf,  0xCu);
      }
    }
  }

  return v3;
}

- (id)sharedDataPath
{
  if (qword_1000DE268 != -1) {
    dispatch_once(&qword_1000DE268, &stru_1000BCDB8);
  }
  return (id)qword_1000DE260;
}

- (id)createSharedDataDirectory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  id v10 = 0LL;
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v10];
  id v5 = v10;

  os_log_t v6 = sub_100039584(@"pasteboard-server");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[FILE MANAGER] Shared Path: %@", buf, 0xCu);
  }

  return v5;
}

- (BOOL)fileExistsForUUID:(id)a3 inSubFolder:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  if (v6)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v7]);

    v7 = (void *)v8;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v7]);

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

  return v12;
}

- (id)createFileForUUID:(id)a3
{
  return -[UASharedPasteboardDataManager createFileForUUID:inSubFolder:]( self,  "createFileForUUID:inSubFolder:",  a3,  0LL);
}

- (id)createFileForUUID:(id)a3 inSubFolder:(id)a4
{
  id v6 = a3;
  v7 = (os_log_s *)a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  unsigned __int8 v10 = [v8 fileExistsAtPath:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager createSharedDataDirectory](self, "createSharedDataDirectory"));
    if (v11)
    {
      unsigned __int8 v12 = (os_log_s *)v11;
      os_log_t v13 = sub_100039584(@"pasteboard-server");
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        int v32 = 138412290;
        v33 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "[FILE MANAGER] ERROR creating shared pasteboard dir: %@",  (uint8_t *)&v32,  0xCu);
      }

LABEL_6:
      v15 = 0LL;
      goto LABEL_21;
    }
  }

  if (!-[UASharedPasteboardDataManager directoryExistsAtPath:](self, "directoryExistsAtPath:", v7))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager createFolderAtPath:](self, "createFolderAtPath:", v7));
    if (!v16)
    {
      os_log_t v31 = sub_100039584(@"pasteboard-server");
      unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v32 = 138412290;
        v33 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "[FILE MANAGER] Error creating subdir: %@",  (uint8_t *)&v32,  0xCu);
      }

      goto LABEL_6;
    }
  }

  unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  if (v7)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[os_log_s stringByAppendingPathComponent:](v7, "stringByAppendingPathComponent:", v12));

    unsigned __int8 v12 = (os_log_s *)v17;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  v19 = (char *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v12]);

  os_log_t v20 = sub_100039584(@"pasteboard-server");
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    int v32 = 138412546;
    v33 = (os_log_s *)v6;
    __int16 v34 = 2112;
    v35 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "[FILE MANAGER] Path for file UUID: %@ -> '%@'",  (uint8_t *)&v32,  0x16u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v23 = [v22 createFileAtPath:v19 contents:0 attributes:&__NSDictionary0__struct];

  os_log_t v24 = sub_100039584(@"pasteboard-server");
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  v26 = v25;
  if (v23)
  {
    v27 = v19;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412290;
      v33 = (os_log_s *)v19;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[FILE MANAGER] Created file at path: %@",  (uint8_t *)&v32,  0xCu);
      v27 = v19;
    }
  }

  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v28 = __error();
      v29 = strerror(*v28);
      int v32 = 138412546;
      v33 = (os_log_s *)v19;
      __int16 v34 = 2080;
      v35 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "[FILE MANAGER] Failed to create file at path: %@ / %s",  (uint8_t *)&v32,  0x16u);
    }

    v27 = 0LL;
  }

  v15 = v27;
LABEL_21:

  return v15;
}

- (BOOL)directoryExistsAtPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v4]);

  char v11 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6 isDirectory:&v11];

  if (v11) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)createFolderAtPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v20 = 0LL;
  unsigned int v8 = [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v20];
  id v9 = v20;

  os_log_t v10 = sub_100039584(@"pasteboard-server");
  char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  unsigned __int8 v12 = v11;
  if (v9)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543618;
    v22 = v6;
    __int16 v23 = 2114;
    id v24 = v9;
    os_log_t v13 = "[FILE MANAGER] Failed to create dir at path: %{public}@ / %{public}@";
    v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 22;
  }

  else
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    os_log_t v13 = "[FILE MANAGER] Created dir at path: %{public}@";
    v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
LABEL_7:

  if (v8) {
    uint64_t v17 = v6;
  }
  else {
    uint64_t v17 = 0LL;
  }
  id v18 = v17;

  return v18;
}

- (id)createFileForLocalPasteboardBlob
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager currentLocalBlobPath](self, "currentLocalBlobPath"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForKey:@"kLocalPasteboardBlobName"]);
    -[UASharedPasteboardDataManager setCurrentLocalBlobPath:](self, "setCurrentLocalBlobPath:", v5);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager currentLocalBlobPath](self, "currentLocalBlobPath"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager currentLocalBlobPath](self, "currentLocalBlobPath"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v26 = 0LL;
    [v8 removeItemAtPath:v7 error:&v26];
    id v9 = v26;

    os_log_t v10 = sub_100039584(@"pasteboard-server");
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    unsigned __int8 v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v28 = v7;
        __int16 v29 = 2114;
        id v30 = v9;
        os_log_t v13 = "[FILE MANAGER] Failed to remove item at path: %{public}@ / %{public}@";
        v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 22;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
      }
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v7;
      os_log_t v13 = "[FILE MANAGER] Removed item at path: %{public}@";
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 12;
      goto LABEL_9;
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager createFileForUUID:](self, "createFileForUUID:", v17));
  -[UASharedPasteboardDataManager setCurrentLocalBlobPath:](self, "setCurrentLocalBlobPath:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v19 setObject:v18 forKey:@"kLocalPasteboardBlobName"];

  os_log_t v20 = sub_100039584(@"pasteboard-server");
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[FILE MANAGER] Creating file for local pasteboard blob at path: %@",  buf,  0xCu);
  }

  if (v18) {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  v18));
  }
  else {
    v22 = 0LL;
  }
  os_log_t v23 = sub_100039584(@"pasteboard-server");
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[FILE MANAGER] Created Handle: %@", buf, 0xCu);
  }

  return v22;
}

- (id)localPasteboardBlobForReading
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager currentLocalBlobPath](self, "currentLocalBlobPath"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager currentLocalBlobPath](self, "currentLocalBlobPath"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingAtPath:",  v4));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)createFileForRemotePasteboardBlob
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager currentRemoteBlobPath](self, "currentRemoteBlobPath"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForKey:@"kRemotePasteboardBlobName"]);
    -[UASharedPasteboardDataManager setCurrentRemoteBlobPath:](self, "setCurrentRemoteBlobPath:", v5);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager currentRemoteBlobPath](self, "currentRemoteBlobPath"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager currentRemoteBlobPath](self, "currentRemoteBlobPath"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v26 = 0LL;
    [v8 removeItemAtPath:v7 error:&v26];
    id v9 = v26;

    os_log_t v10 = sub_100039584(@"pasteboard-server");
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    unsigned __int8 v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v28 = v7;
        __int16 v29 = 2114;
        id v30 = v9;
        os_log_t v13 = "[FILE MANAGER] Failed to remove item at path: %{public}@ / %{public}@";
        v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 22;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
      }
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v7;
      os_log_t v13 = "[FILE MANAGER] Removed item at path: %{public}@";
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 12;
      goto LABEL_9;
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager createFileForUUID:](self, "createFileForUUID:", v17));
  -[UASharedPasteboardDataManager setCurrentRemoteBlobPath:](self, "setCurrentRemoteBlobPath:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v19 setObject:v18 forKey:@"kRemotePasteboardBlobName"];

  os_log_t v20 = sub_100039584(@"pasteboard-server");
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[FILE MANAGER] Creating file for remote pasteboard blob at path: %@",  buf,  0xCu);
  }

  if (v18) {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  v18));
  }
  else {
    v22 = 0LL;
  }
  os_log_t v23 = sub_100039584(@"pasteboard-server");
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[FILE MANAGER] Created Handle: %@", buf, 0xCu);
  }

  return v22;
}

- (id)remotePasteboardBlobForReading
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager currentRemoteBlobPath](self, "currentRemoteBlobPath"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager currentRemoteBlobPath](self, "currentRemoteBlobPath"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingAtPath:",  v4));
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)subDirForItem:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"items/%@/", v3));

  return v4;
}

- (id)fileURLForCloneItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[UASharedPasteboardDataManager sharedInstance]( &OBJC_CLASS___UASharedPasteboardDataManager,  "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sharedDataPath]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v3, 1LL));

  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v4 URLByAppendingPathComponent:@"type-clone"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  LOBYTE(v4) = [v6 fileExistsAtPath:v7];

  if ((v4 & 1) == 0)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    id v14 = 0LL;
    [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v14];
    id v10 = v14;

    if (v10)
    {
      os_log_t v11 = sub_100039584(@"pasteboard-server");
      unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "[FILE MANAGER] Error creating clone items dir: %@",  buf,  0xCu);
      }
    }
  }

  return v5;
}

- (id)fileURLForPasteboardItem:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager subDirForItem:](self, "subDirForItem:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));
  return v7;
}

- (id)fileURLForArchiveWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"archives"]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));

  return v9;
}

- (id)readHandleForArchiveWithUUID:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager fileURLForArchiveWithUUID:](self, "fileURLForArchiveWithUUID:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingAtPath:",  v4));

  return v5;
}

- (BOOL)createTmpArchiveFileWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[UASharedPasteboardDataManager createFileForUUID:inSubFolder:]( self,  "createFileForUUID:inSubFolder:",  v4,  @"archives"));
  if (v5
    && (uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingAtPath:",  v5))) != 0)
  {
    v7 = (void *)v6;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager tmpArchiveWriteFiles](self, "tmpArchiveWriteFiles"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    [v8 setObject:v7 forKeyedSubscript:v9];

    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)writeArchiveData:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager tmpArchiveWriteFiles](self, "tmpArchiveWriteFiles"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    id v11 = v10;
    objc_sync_enter(v11);
    id v17 = 0LL;
    unsigned __int8 v12 = [v11 writeData:v6 error:&v17];
    id v13 = v17;
    if ((v12 & 1) == 0)
    {
      os_log_t v14 = sub_100039584(@"pasteboard-server");
      os_log_type_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
        *(_DWORD *)buf = 138543618;
        v19 = v16;
        __int16 v20 = 2114;
        id v21 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[File Manager] Error writting data for %{public}@: %{public}@",  buf,  0x16u);
      }
    }

    objc_sync_exit(v11);
  }
}

- (void)finishWritingArchiveForUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager tmpArchiveWriteFiles](self, "tmpArchiveWriteFiles"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (v7)
  {
    id v8 = v7;
    objc_sync_enter(v8);
    [v8 synchronizeFile];
    [v8 closeFile];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager tmpArchiveWriteFiles](self, "tmpArchiveWriteFiles"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    [v9 removeObjectForKey:v10];

    objc_sync_exit(v8);
  }
}

- (void)obtainLockForItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager subDirForItem:](self, "subDirForItem:", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager createFolderAtPath:](self, "createFolderAtPath:", v8));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v9, 1LL));
  id v11 = -[UASharedPasteboardFileProvider initWithURL:]( objc_alloc(&OBJC_CLASS___UASharedPasteboardFileProvider),  "initWithURL:",  v10);
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager providers](self, "providers"));
  [v12 setObject:v11 forKeyedSubscript:v7];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000E434;
  v14[3] = &unk_1000BCDE0;
  id v15 = v6;
  id v13 = v6;
  +[NSFileCoordinator _addFileProvider:completionHandler:]( &OBJC_CLASS___NSFileCoordinator,  "_addFileProvider:completionHandler:",  v11,  v14);
}

- (void)releaseLockForItem:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = sub_100039584(@"pasteboard-server");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    int v17 = 138412290;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "[File Manager] Releasing lock for item %@",  (uint8_t *)&v17,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager providers](self, "providers"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v6]);

  if (v12)
  {
    [v12 unlockWithError:v7];
    +[NSFileCoordinator _removeFileProvider:](&OBJC_CLASS___NSFileCoordinator, "_removeFileProvider:", v12);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager providers](self, "providers"));
    [v13 setObject:0 forKeyedSubscript:v6];

    os_log_t v14 = sub_100039584(@"pasteboard-server");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
      int v17 = 138412290;
      id v18 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "[File Manager] Released lock for item %@",  (uint8_t *)&v17,  0xCu);
    }
  }
}

- (void)releaseLockForItem:(id)a3
{
}

- (void)cancelAllLocks
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "[File Manager] Canceling all file coordiation providers",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3072LL,  0LL));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager providers](self, "providers", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        [v12 unlockWithError:v5];
        +[NSFileCoordinator _removeFileProvider:](&OBJC_CLASS___NSFileCoordinator, "_removeFileProvider:", v12);
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v9);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager providers](self, "providers"));
  [v13 removeAllObjects];
}

- (void)cleanupForItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"items"]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v7]);

    id v9 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  0LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager lockTokens](self, "lockTokens"));
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v4]);

    os_log_t v13 = sub_100039584(@"pasteboard-server");
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (!v12)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        id v34 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Obtaining write lock to delete file for item: %{public}@",  buf,  0xCu);
      }

      id v31 = 0LL;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10000EB6C;
      v29[3] = &unk_1000BCE08;
      id v30 = v4;
      -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:]( v9,  "coordinateWritingItemAtURL:options:error:byAccessor:",  v10,  1LL,  &v31,  v29);
      id v25 = v31;
      if (v25)
      {
        id v26 = v25;
        os_log_t v27 = sub_100039584(@"pasteboard-server");
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v34 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Error getting coord write for deleting item: %{public}@",  buf,  0xCu);
        }
      }

      id v17 = v30;
      goto LABEL_21;
    }

    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Already have lock for file, deleting", buf, 2u);
    }

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v32 = 0LL;
    [v16 removeItemAtURL:v10 error:&v32];
    id v17 = v32;

    os_log_t v18 = sub_100039584(@"pasteboard-server");
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    __int16 v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v34 = v17;
        id v21 = "Error deleting item: %{public}@";
        v22 = v20;
        os_log_type_t v23 = OS_LOG_TYPE_ERROR;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, buf, 0xCu);
      }
    }

    else if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v4;
      id v21 = "Deleted file for item: %{public}@";
      v22 = v20;
      os_log_type_t v23 = OS_LOG_TYPE_INFO;
      goto LABEL_19;
    }

    -[UASharedPasteboardDataManager releaseLockForItem:](self, "releaseLockForItem:", v4);
LABEL_21:

    goto LABEL_22;
  }

  os_log_t v24 = sub_100039584(@"pasteboard-server");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error to get sharedDir cleaning up", buf, 2u);
  }

- (void)cleanupArchiveDir
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"archives"]);

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v27 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contentsOfDirectoryAtPath:v3 error:&v27]);
    id v6 = v27;

    id obj = v6;
    if (v6)
    {
      os_log_t v7 = sub_100039584(@"pasteboard-server");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v30 = obj;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Error getting sharedDirPath archives: %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id obj = v5;
      id v9 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v24;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v24 != v11) {
              objc_enumerationMutation(obj);
            }
            os_log_t v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
            os_log_t v14 = sub_100039584(@"pasteboard-server");
            BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v30 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Attempting to deleta archive: %@",  buf,  0xCu);
            }

            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v13]);
            id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            id v22 = 0LL;
            [v17 removeItemAtPath:v16 error:&v22];
            id v18 = v22;

            if (v18)
            {
              os_log_t v19 = sub_100039584(@"pasteboard-server");
              __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v30 = v18;
                _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Error deleting archive: %{public}@",  buf,  0xCu);
              }
            }
          }

          id v10 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
        }

        while (v10);
      }
    }
  }
}

- (void)cleanupItemsDir
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager sharedDataPath](self, "sharedDataPath"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"items"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v39 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:v4 error:&v39]);
  id v7 = v39;

  id v8 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  0LL);
  if (!v7)
  {
    id v30 = v8;
    id v32 = self;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int16 v29 = v6;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(obj);
          }
          os_log_t v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          os_log_t v14 = sub_100039584(@"pasteboard-server");
          BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Attempting to delete item: %@", buf, 0xCu);
          }

          __int128 v16 = v4;
          id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:relativeToURL:]( &OBJC_CLASS___NSURL,  "URLWithString:relativeToURL:",  v13,  v17));

          os_log_t v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v13);
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager lockTokens](v32, "lockTokens"));
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v19]);

          os_log_t v22 = sub_100039584(@"pasteboard-server");
          __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
          if (v21)
          {
            if (v24)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "We have lock for the file, we are receiving the item and should not delete it at this time",  buf,  2u);
            }

            id v4 = v16;
          }

          else
          {
            if (v24)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Obtaining write lock to delete file",  buf,  2u);
            }

            id v34 = 0LL;
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472LL;
            v33[2] = sub_10000F368;
            v33[3] = &unk_1000BCE08;
            v33[4] = v13;
            -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:]( v30,  "coordinateWritingItemAtURL:options:error:byAccessor:",  v18,  1LL,  &v34,  v33);
            id v25 = v34;
            id v4 = v16;
            if (v25)
            {
              __int128 v26 = v25;
              os_log_t v27 = sub_100039584(@"pasteboard-server");
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v41 = v26;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Error getting coord write for deleting item: %{public}@",  buf,  0xCu);
              }
            }
          }
        }

        id v10 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
      }

      while (v10);
    }

    id v7 = 0LL;
    id v6 = v29;
    id v8 = v30;
  }
}

- (void)cleanupCloneDir
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataManager fileURLForCloneItems](self, "fileURLForCloneItems"));
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v31 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contentsOfDirectoryAtPath:v3 error:&v31]);
  id v6 = v31;

  id v7 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  0LL);
  if (!v6)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v23 = v5;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          os_log_t v13 = sub_100039584(@"pasteboard-server");
          os_log_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v33 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Attempting to delete copied item: %{private}@",  buf,  0xCu);
          }

          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:relativeToURL:]( &OBJC_CLASS___NSURL,  "URLWithString:relativeToURL:",  v12,  v15));

          os_log_t v17 = sub_100039584(@"pasteboard-server");
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Obtaining write lock to delete file",  buf,  2u);
          }

          id v26 = 0LL;
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472LL;
          v25[2] = sub_10000F7F0;
          v25[3] = &unk_1000BCE08;
          v25[4] = v12;
          -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:]( v7,  "coordinateWritingItemAtURL:options:error:byAccessor:",  v16,  1LL,  &v26,  v25);
          id v19 = v26;
          if (v19)
          {
            __int16 v20 = v19;
            os_log_t v21 = sub_100039584(@"pasteboard-server");
            os_log_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v33 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Error getting coord write for deleting item: %{public}@",  buf,  0xCu);
            }
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
      }

      while (v9);
    }

    id v6 = 0LL;
    id v5 = v23;
  }
}

- (NSString)currentLocalBlobPath
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCurrentLocalBlobPath:(id)a3
{
}

- (NSString)currentRemoteBlobPath
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCurrentRemoteBlobPath:(id)a3
{
}

- (NSMutableDictionary)tmpArchiveWriteFiles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTmpArchiveWriteFiles:(id)a3
{
}

- (NSMutableDictionary)lockTokens
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLockTokens:(id)a3
{
}

- (NSMutableDictionary)providers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setProviders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end