@interface MSDCache
+ (id)sharedInstance;
- (BOOL)checkIfFileIsInContainer:(id)a3 container:(id)a4;
- (BOOL)containerExist:(id)a3;
- (BOOL)createContainer:(id)a3;
- (BOOL)deleteContainer:(id)a3;
- (BOOL)deleteDataBlob:(id)a3;
- (BOOL)moveFile:(id)a3 toLocation:(id)a4 fromContainer:(id)a5 error:(id)a6;
- (BOOL)storeDataBlob:(id)a3 withContainerIdentifier:(id)a4;
- (MSDCache)init;
- (MSDTargetDevice)device;
- (NSFileManager)fileManager;
- (NSMutableDictionary)deletionList;
- (id)retrieveDataBlob:(id)a3;
- (void)setDeletionList:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFileManager:(id)a3;
@end

@implementation MSDCache

+ (id)sharedInstance
{
  if (qword_1001252B8 != -1) {
    dispatch_once(&qword_1001252B8, &stru_1000F99B0);
  }
  return (id)qword_1001252B0;
}

- (MSDCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDCache;
  v2 = -[MSDCache init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    -[MSDCache setFileManager:](v2, "setFileManager:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    -[MSDCache setDevice:](v2, "setDevice:", v4);

    v5 = v2;
  }

  return v2;
}

- (BOOL)createContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  unsigned __int8 v7 = [v6 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage"];

  if ((v7 & 1) == 0)
  {
    id v8 = sub_10003A95C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "creating container:%{public}@",  (uint8_t *)&v17,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache device](v5, "device"));
    [v10 manageDemoVolume:@"Setup"];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v4]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  unsigned __int8 v13 = [v12 fileExistsAtPath:v11];

  if ((v13 & 1) != 0)
  {
    unsigned __int8 v14 = 1;
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
    unsigned __int8 v14 = [v15 prepareWorkDirectory:v11 writableByNonRoot:1];
  }

  objc_sync_exit(v5);
  return v14;
}

- (BOOL)containerExist:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v4]);
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7];

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)deleteContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v4]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  unsigned int v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    id v12 = sub_10003AA3C();
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100093A78((uint64_t)v6, v13, v14);
    }

    unsigned __int8 v10 = 0;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
    unsigned __int8 v10 = [v9 removeWorkDirectory:v6];
  }

  objc_sync_exit(v5);
  return v10;
}

- (BOOL)checkIfFileIsInContainer:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v7]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v6]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v8, "fileManager"));
  unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

  objc_sync_exit(v8);
  return v12;
}

- (BOOL)moveFile:(id)a3 toLocation:(id)a4 fromContainer:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = self;
  objc_sync_enter(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v12]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:v10]);
  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v14, "fileManager"));
  id v21 = v13;
  unsigned __int8 v18 = [v17 moveItemAtPath:v16 toPath:v11 error:&v21];
  id v19 = v21;

  objc_sync_exit(v14);
  return v18;
}

- (BOOL)storeDataBlob:(id)a3 withContainerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v7]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v8, "fileManager"));
  unsigned __int8 v11 = [v10 fileExistsAtPath:v9];

  if ((v11 & 1) == 0 && !-[MSDCache createContainer:](v8, "createContainer:", v7))
  {
    id v17 = sub_10003AA3C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100093B1C((uint64_t)v7, v16, v18);
    }
    goto LABEL_10;
  }

  if ((unint64_t)[v6 length] >= 0x400000)
  {
    id v15 = sub_10003AA3C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100093AE0((uint64_t)&v19, (uint64_t)[v6 length], v16);
    }
LABEL_10:

    unsigned __int8 v13 = 0;
    id v12 = @"PersistentDataBlob";
    goto LABEL_5;
  }

  id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"PersistentDataBlob"]);
  unsigned __int8 v13 = [v6 writeToFile:v12 atomically:1];
LABEL_5:

  objc_sync_exit(v8);
  return v13;
}

- (id)retrieveDataBlob:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

  if ((v8 & 1) != 0)
  {
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"PersistentDataBlob"]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
    unsigned int v11 = [v10 fileExistsAtPath:v9];

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v9));
      goto LABEL_10;
    }
  }

  else
  {
    id v13 = sub_10003AA3C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100093B84((uint64_t)v6, v14, v15);
    }

    v9 = @"PersistentDataBlob";
  }

  id v16 = sub_10003A95C();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "persistent data blob file does not exist:%{public}@",  (uint8_t *)&v19,  0xCu);
  }

  id v12 = 0LL;
LABEL_10:

  objc_sync_exit(v5);
  return v12;
}

- (BOOL)deleteDataBlob:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCache fileManager](v5, "fileManager"));
    id v14 = 0LL;
    unsigned __int8 v10 = [v9 removeItemAtPath:v6 error:&v14];
    unsigned int v11 = (os_log_s *)v14;
  }

  else
  {
    id v13 = sub_10003AA3C();
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100093BEC(v11);
    }
    unsigned __int8 v10 = 0;
  }

  objc_sync_exit(v5);
  return v10;
}

- (NSMutableDictionary)deletionList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDeletionList:(id)a3
{
}

- (NSFileManager)fileManager
{
  return (NSFileManager *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFileManager:(id)a3
{
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end