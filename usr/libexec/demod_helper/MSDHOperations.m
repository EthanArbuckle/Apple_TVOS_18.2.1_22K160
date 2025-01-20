@interface MSDHOperations
+ (id)sharedInstance;
- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5 correctOwnership:(BOOL)a6;
- (BOOL)collectDemoLogsToFolder:(id)a3;
- (BOOL)createDeviceManifestForComponent:(id)a3 ofType:(id)a4 withRootPath:(id)a5 userHomePath:(id)a6 andSavePath:(id)a7;
- (BOOL)deleteNvram:(id)a3;
- (BOOL)destroyWorkContainerInUserHome;
- (BOOL)disableLaunchdServicesForWatch;
- (BOOL)fileExistsAtPath:(id)a3;
- (BOOL)generateLogsForPredicate:(id)a3 toFile:(id)a4;
- (BOOL)manageDataVolume:(id)a3;
- (BOOL)manageDemoVolume:(id)a3;
- (BOOL)manageUserVolume:(id)a3 forUser:(id)a4;
- (BOOL)migratePreferencesFile;
- (BOOL)moveStagingToFinal:(id)a3 finalPath:(id)a4;
- (BOOL)moveUserHomeStagingToFinal:(id)a3 finalPath:(id)a4;
- (BOOL)prepareDirectory:(id)a3 writableByNonRoot:(BOOL)a4;
- (BOOL)prepareWorkContainerInUserHome:(BOOL)a3;
- (BOOL)preserveBluetoothFileToShelter:(id)a3;
- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 withReturnErrorMsg:(id *)a4;
- (BOOL)quitHelper;
- (BOOL)reboot;
- (BOOL)removeDirectory:(id)a3;
- (BOOL)restartBluetooth;
- (BOOL)restoreAppDataAttributesUnder:(id)a3 containerType:(id)a4 identifier:(id)a5 manifestUID:(id)a6 deviceUID:(id)a7;
- (BOOL)restoreBackupAttributesUnder:(id)a3 range:(_NSRange)a4 manifestUID:(id)a5 deviceUID:(id)a6;
- (BOOL)runPreflightChecksOnSecondPartyAppData:(id)a3 withReturnErrorMsg:(id *)a4;
- (BOOL)setComputerNameAndHostname:(id)a3 encoding:(unsigned int)a4;
- (BOOL)setPreferencesForKey:(id)a3 withValue:(id)a4 forApplication:(id)a5 andUser:(id)a6;
- (BOOL)switchToBackupFolder;
- (BOOL)touchFile:(id)a3 fileAttributes:(id)a4;
- (BOOL)updateSignedManifest;
- (BOOL)writeDictionary:(id)a3 toFile:(id)a4;
- (BOOL)writeNVRam:(id)a3 withValue:(id)a4;
- (MSDHOperations)init;
- (MSDSignedManifest)signedManifest;
- (OS_os_transaction)transaction;
- (id)getPathInUserHomeDirectory:(id)a3;
- (id)readPlistFile:(id)a3;
- (void)dealloc;
- (void)setSignedManifest:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MSDHOperations

+ (id)sharedInstance
{
  if (qword_10004F8C8 != -1) {
    dispatch_once(&qword_10004F8C8, &stru_100044F28);
  }
  return (id)qword_10004F8C0;
}

- (MSDHOperations)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDHOperations;
  v2 = -[MSDHOperations init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSDHOperations;
  -[MSDHOperations dealloc](&v3, "dealloc");
}

- (MSDSignedManifest)signedManifest
{
  signedManifest = self->_signedManifest;
  if (!signedManifest)
  {
    -[MSDHOperations updateSignedManifest](self, "updateSignedManifest");
    signedManifest = self->_signedManifest;
  }

  return signedManifest;
}

- (BOOL)updateSignedManifest
{
  objc_super v3 = (void *)os_transaction_create("Need to keep manaifest in memory", a2);
  -[MSDHOperations setTransaction:](self, "setTransaction:", v3);

  id v4 = sub_100021D84();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    v19 = "-[MSDHOperations updateSignedManifest]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s - Loading signed manifest.",  (uint8_t *)&v18,  0xCu);
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v7 = [v6 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist"];

  if ((v7 & 1) != 0)
  {
    v8 = (MSDSignedManifest *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifestFactory createSignedManifestFromManifestFile:]( &OBJC_CLASS___MSDSignedManifestFactory,  "createSignedManifestFromManifestFile:",  @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist"));
    signedManifest = self->_signedManifest;
    self->_signedManifest = v8;

    if (self->_signedManifest) {
      return 1;
    }
    id v15 = sub_100021D84();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002B080(v12, v16, v17);
    }
  }

  else
  {
    id v11 = sub_100021D84();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002B108(v12, v13, v14);
    }
  }

  return 0;
}

- (BOOL)migratePreferencesFile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/root/Library/Preferences/" stringByAppendingPathComponent:@"com.apple.MobileStoreDemo.plist"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Preferences/" stringByAppendingPathComponent:@"com.apple.MobileStoreDemo.plist"]);
  if (![v2 fileExistsAtPath:v3]
    || ([v2 fileExistsAtPath:v4] & 1) != 0)
  {
    unsigned __int8 v7 = 0LL;
    id v9 = 0LL;
    BOOL v10 = 0;
    goto LABEL_6;
  }

  id v16 = 0LL;
  unsigned __int8 v5 = [v2 moveItemAtPath:v3 toPath:v4 error:&v16];
  id v6 = v16;
  if ((v5 & 1) == 0)
  {
    id v12 = sub_100021D84();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002B1F0();
    }
    unsigned __int8 v7 = 0LL;
    goto LABEL_14;
  }

  v17[0] = NSFileOwnerAccountName;
  v17[1] = NSFileGroupOwnerAccountName;
  v18[0] = @"mobile";
  v18[1] = @"mobile";
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  id v15 = v6;
  unsigned __int8 v8 = [v2 setAttributes:v7 ofItemAtPath:v4 error:&v15];
  id v9 = v15;

  if ((v8 & 1) == 0)
  {
    id v14 = sub_100021D84();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002B190();
    }
    id v6 = v9;
LABEL_14:

    BOOL v10 = 0;
    id v9 = v6;
    goto LABEL_6;
  }

  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)prepareDirectory:(id)a3 writableByNonRoot:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v6 fileExistsAtPath:v5])
  {
    id v7 = 0LL;
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    id v11 = 0LL;
    goto LABEL_11;
  }

  id v23 = 0LL;
  unsigned __int8 v15 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v23];
  id v16 = v23;
  id v9 = v16;
  if ((v15 & 1) == 0)
  {
    id v20 = sub_100021D84();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002B370();
    }
    goto LABEL_17;
  }

  id v7 = v16;
  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  id v22 = v7;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 attributesOfItemAtPath:v5 error:&v22]);
  id v9 = v22;

  if (!v8)
  {
    id v19 = sub_100021D84();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002B258();
    }
LABEL_17:
    id v11 = 0LL;
LABEL_18:

    BOOL v17 = 0;
    id v7 = v9;
    goto LABEL_12;
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)[v8 filePosixPermissions] | 0x3Fu));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v10,  NSFilePosixPermissions,  0LL));

  id v21 = v9;
  unsigned __int8 v12 = [v6 setAttributes:v11 ofItemAtPath:v5 error:&v21];
  id v7 = v21;

  if ((v12 & 1) == 0)
  {
    id v13 = sub_100021D84();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002B2E4();
    }
    id v9 = v7;
    goto LABEL_18;
  }

- (BOOL)removeDirectory:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)createDeviceManifestForComponent:(id)a3 ofType:(id)a4 withRootPath:(id)a5 userHomePath:(id)a6 andSavePath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));

  if (!v17)
  {
    id v26 = sub_100021D84();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10002B3FC(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_11;
  }

  int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 getManifestDataFromSection:v13 forIdentifier:v12]);

  if (!v19)
  {
    id v35 = sub_100021D84();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10002B46C();
    }
LABEL_11:
    id v19 = 0LL;
    id v20 = 0LL;
    id v21 = 0LL;
LABEL_14:

    goto LABEL_15;
  }

  id v20 = -[MSDManifest initWithDictionary:andUserHomePath:]( objc_alloc(&OBJC_CLASS___MSDManifest),  "initWithDictionary:andUserHomePath:",  v19,  v15);
  -[MSDManifest setRootPath:](v20, "setRootPath:", v14);
  id v21 = objc_alloc_init(&OBJC_CLASS___MSDManifest);
  -[MSDManifest setRootPath:](v21, "setRootPath:", v14);
  if (!-[MSDManifest addFilesUsingSourceManifest:](v21, "addFilesUsingSourceManifest:", v20))
  {
    id v36 = sub_100021D84();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10002B4F8(v27, v37, v38, v39, v40, v41, v42, v43);
    }
    goto LABEL_14;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDManifest dict](v21, "dict"));
  unsigned __int8 v23 = -[MSDHOperations writeDictionary:toFile:](self, "writeDictionary:toFile:", v22, v16);

  if ((v23 & 1) == 0)
  {
LABEL_15:
    BOOL v24 = 0;
    goto LABEL_6;
  }

  BOOL v24 = 1;
LABEL_6:

  return v24;
}

- (BOOL)writeDictionary:(id)a3 toFile:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSOutputStream outputStreamToFileAtPath:append:]( &OBJC_CLASS___NSOutputStream,  "outputStreamToFileAtPath:append:",  a4,  0LL));
  [v6 open];
  id v12 = 0LL;
  uint64_t v7 = +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "writePropertyList:toStream:format:options:error:",  v5,  v6,  200LL,  0LL,  &v12);

  id v8 = v12;
  [v6 close];

  if (v7 <= 0)
  {
    id v10 = sub_100021D84();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002B568(v8, v11);
    }
  }

  return v7 > 0;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

- (id)readPlistFile:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  id v10 = 0LL;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v4,  &v10));
  id v6 = v10;

  if (!v5)
  {
    id v8 = sub_100021D84();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002B5E8();
    }
  }

  return v5;
}

- (BOOL)touchFile:(id)a3 fileAttributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = v7;
  if (!v5)
  {
    id v11 = sub_100021D84();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002B664();
    }
    goto LABEL_9;
  }

  if (([v7 createFileAtPath:v5 contents:0 attributes:v6] & 1) == 0)
  {
    id v13 = sub_100021D84();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002B690();
    }
LABEL_9:

    BOOL v9 = 0;
    goto LABEL_4;
  }

  BOOL v9 = 1;
LABEL_4:

  return v9;
}

- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5 correctOwnership:(BOOL)a6
{
  uint64_t v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LOBYTE(v6) = [v12 cloneFile:v11 to:v10 expectingHash:v9 correctOwnership:v6];

  return v6;
}

- (BOOL)deleteNvram:(id)a3
{
  kern_return_t v6;
  BOOL v7;
  id v9;
  os_log_s *v10;
  id v11;
  id v12;
  os_log_s *v13;
  mach_port_t mainPort;
  id v3 = a3;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    id v9 = sub_100021D84();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002B748();
    }
    goto LABEL_10;
  }

  io_registry_entry_t v4 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v4)
  {
    id v11 = sub_100021D84();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002B6F0();
    }
LABEL_10:

    uint64_t v7 = 0;
    goto LABEL_5;
  }

  io_object_t v5 = v4;
  uint64_t v6 = IORegistryEntrySetCFProperty(v4, @"IONVRAM-DELETE-PROPERTY", v3);
  uint64_t v7 = v6 == 0;
  if (v6)
  {
    id v12 = sub_100021D84();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002B71C();
    }
  }

  IOObjectRelease(v5);
LABEL_5:

  return v7;
}

- (BOOL)writeNVRam:(id)a3 withValue:(id)a4
{
  io_object_t v5 = (__CFString *)a3;
  id v6 = a4;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    id v10 = sub_100021D84();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002B748();
    }
    goto LABEL_12;
  }

  io_registry_entry_t v7 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v7)
  {
    id v12 = sub_100021D84();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002B6F0();
    }
LABEL_12:

LABEL_13:
    BOOL v9 = 0;
    goto LABEL_14;
  }

  io_registry_entry_t v8 = v7;
  if (IORegistryEntrySetCFProperty(v7, v5, [v6 dataUsingEncoding:4]))
  {
    id v14 = sub_100021D84();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002B774();
    }
    goto LABEL_19;
  }

  if (IORegistryEntrySetCFProperty(v8, @"IONVRAM-SYNCNOW-PROPERTY", v5))
  {
    id v16 = sub_100021D84();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002B71C();
    }
LABEL_19:

    BOOL v9 = 0;
    goto LABEL_7;
  }

  BOOL v9 = 1;
LABEL_7:
  IOObjectRelease(v8);
LABEL_14:

  return v9;
}

- (BOOL)manageDataVolume:(id)a3
{
  id v3 = a3;
  io_registry_entry_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](&OBJC_CLASS___MSDHVolumeManager, "sharedInstance"));
  if ([v3 isEqualToString:@"DeleteSnapshot"])
  {
    io_object_t v5 = @"DeleteSnapshot";
    goto LABEL_5;
  }

  if ([v3 isEqualToString:@"RevertSnapshot"])
  {
    if ([v4 manageSnapshot:@"RevertSnapshot" forVolumeAt:@"/private/var"])
    {
      io_registry_entry_t v8 = objc_alloc_init(&OBJC_CLASS___MSDHSnapshottedDataSaver);
      -[MSDHSnapshottedDataSaver rescueDataToShelterFromSnapshottedVolumes]( v8,  "rescueDataToShelterFromSnapshottedVolumes");

      unsigned __int8 v6 = 1;
      goto LABEL_6;
    }

    goto LABEL_22;
  }

  if (![v3 isEqualToString:@"CommitSnapshot"])
  {
    if ([v3 isEqualToString:@"MountSnapshot"])
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v20 = 0LL;
      unsigned __int8 v10 = [v9 createDirectoryAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var" withIntermediateDirectories:1 attributes:0 error:&v20];
      id v11 = v20;
      if ((v10 & 1) != 0)
      {
        unsigned __int8 v6 = [v4 mountSnapshotAt:@"/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var" forVolumeAt:@"/private/var"];
      }

      else
      {
        id v15 = sub_100021D84();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10002B7A0(v11);
        }

        unsigned __int8 v6 = 0;
      }
    }

    else
    {
      if (![v3 isEqualToString:@"UnmountSnapshot"])
      {
        id v13 = sub_100021D84();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v22 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Unknown volume operation: %{public}@",  buf,  0xCu);
        }

        goto LABEL_22;
      }

      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v6 = [v4 unmountSnapshotAt:@"/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var"];
      id v19 = 0LL;
      unsigned __int8 v12 = [v9 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.snapshot" error:&v19];
      id v11 = v19;
      if ((v12 & 1) == 0)
      {
        id v17 = sub_100021D84();
        int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10002B828(v11);
        }
      }
    }

    goto LABEL_6;
  }

  if (![v4 manageSnapshot:@"DeleteSnapshot" forVolumeAt:@"/private/var"])
  {
LABEL_22:
    unsigned __int8 v6 = 0;
    goto LABEL_6;
  }

- (BOOL)manageDemoVolume:(id)a3
{
  id v3 = a3;
  io_registry_entry_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](&OBJC_CLASS___MSDHVolumeManager, "sharedInstance"));
  if ([v3 isEqualToString:@"Setup"])
  {
    unsigned __int8 v5 = [v4 setupDemoVolume];
LABEL_5:
    BOOL v6 = v5;
    goto LABEL_9;
  }

  if ([v3 isEqualToString:@"Delete"])
  {
    unsigned __int8 v5 = [v4 deleteDemoVolume];
    goto LABEL_5;
  }

  id v7 = sub_100021D84();
  io_registry_entry_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unknown volume operation: %{public}@",  (uint8_t *)&v10,  0xCu);
  }

  BOOL v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)manageUserVolume:(id)a3 forUser:(id)a4
{
  unsigned __int8 v5 = (__CFString *)a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](&OBJC_CLASS___MSDHVolumeManager, "sharedInstance"));
  if (!v6)
  {
    id v16 = sub_100021D84();
    io_registry_entry_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002B8B0();
    }
    goto LABEL_23;
  }

  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", @"CreateSnapshot") & 1) == 0
    && (-[__CFString isEqualToString:](v5, "isEqualToString:", @"DeleteSnapshot") & 1) == 0
    && !-[__CFString isEqualToString:](v5, "isEqualToString:", @"RevertSnapshot"))
  {
    if (-[__CFString isEqualToString:](v5, "isEqualToString:", @"CommitSnapshot"))
    {
      io_registry_entry_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 userHomePath]);
      if (v8)
      {
        if ([v7 manageSnapshot:@"DeleteSnapshot" forVolumeAt:v8])
        {
          int v10 = @"CreateSnapshot";
          BOOL v9 = v7;
          goto LABEL_7;
        }

- (BOOL)prepareWorkContainerInUserHome:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    unsigned __int8 v5 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata";
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](&OBJC_CLASS___MSDHVolumeManager, "sharedInstance"));
    unsigned __int8 v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 userHomePath]);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingPathComponent:]( v5,  "stringByAppendingPathComponent:",  @"/.MSDWorkContainer"));
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"/MSD_staging"]);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"/MSD_secondary_staging"]);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"/MSD_stashed_staging"]);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"/.backup"]);
  io_registry_entry_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v63[0] = NSFileOwnerAccountName;
  v63[1] = NSFileGroupOwnerAccountName;
  v64[0] = @"mobile";
  v64[1] = @"mobile";
  v63[2] = NSFilePosixPermissions;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](&OBJC_CLASS___NSNumber, "numberWithShort:", 448LL));
  v64[2] = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  3LL));

  id v12 = sub_100021D84();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[MSDHOperations prepareWorkContainerInUserHome:]";
    __int16 v61 = 2114;
    v62 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %{public}@", buf, 0x16u);
  }

  uint64_t v38 = v7;
  if (v3)
  {
    v58[0] = v7;
    unsigned __int8 v14 = v41;
    v58[1] = v42;
    v58[2] = v41;
    id v15 = v40;
    v58[3] = v40;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 4LL));
    [v8 addObjectsFromArray:v16];

    v57 = v42;
    id v17 = &v57;
  }

  else
  {
    v56[0] = v7;
    unsigned __int8 v14 = v41;
    v56[1] = v42;
    v56[2] = v41;
    id v15 = v39;
    v56[3] = v39;
    int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 4LL));
    [v8 addObjectsFromArray:v18];

    v55 = v42;
    id v17 = &v55;
  }

  v17[1] = v14;
  void v17[2] = v15;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:"));
  [v9 addObjectsFromArray:v19];

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(v20);
        }
        -[MSDHOperations removeDirectory:]( self,  "removeDirectory:",  *(void *)(*((void *)&v49 + 1) + 8LL * (void)i));
      }

      id v22 = [v20 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }

    while (v22);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v25 = v8;
  id v26 = [v25 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v37 = v5;
    id v28 = 0LL;
    uint64_t v29 = *(void *)v46;
    while (2)
    {
      uint64_t v30 = 0LL;
      uint64_t v31 = v28;
      do
      {
        if (*(void *)v46 != v29) {
          objc_enumerationMutation(v25);
        }
        uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)v30);
        id v44 = v31;
        unsigned __int8 v33 = objc_msgSend( v43,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v32,  1,  v11,  &v44,  v37,  v38);
        id v28 = v44;

        if ((v33 & 1) == 0)
        {
          id v34 = sub_100021D84();
          id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_10002B93C();
          }

          goto LABEL_29;
        }

        uint64_t v30 = (char *)v30 + 1;
        uint64_t v31 = v28;
      }

      while (v27 != v30);
      id v27 = [v25 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v27) {
        continue;
      }
      break;
    }

- (BOOL)destroyWorkContainerInUserHome
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](&OBJC_CLASS___MSDHVolumeManager, "sharedInstance"));
  io_registry_entry_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userHomePath]);

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"/.MSDWorkContainer"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:@"/.MSDWorkContainer"]);
  if (!-[MSDHOperations removeDirectory:](self, "removeDirectory:", v5))
  {
    id v9 = sub_100021D84();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }

  if (!-[MSDHOperations removeDirectory:](self, "removeDirectory:", v6))
  {
    id v11 = sub_100021D84();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
LABEL_8:
    }
      sub_10002B9B8();
LABEL_9:

    BOOL v7 = 0;
    goto LABEL_4;
  }

  BOOL v7 = 1;
LABEL_4:

  return v7;
}

- (BOOL)moveUserHomeStagingToFinal:(id)a3 finalPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  io_registry_entry_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](&OBJC_CLASS___MSDHVolumeManager, "sharedInstance"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userHomePath]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v10]);
  id v38 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 attributesOfItemAtPath:v11 error:&v38]);
  id v13 = v38;
  if (v12)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 fileType]);
    unsigned int v15 = [v14 isEqualToString:NSFileTypeSymbolicLink];

    if (v15)
    {
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MSDHOperations getPathInUserHomeDirectory:](self, "getPathInUserHomeDirectory:", v6));
      id v37 = v13;
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 destinationOfSymbolicLinkAtPath:v11 error:&v37]);
      id v18 = v37;

      id v19 = sub_100021D84();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      id v21 = v20;
      if (v17)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v11;
          __int16 v41 = 2114;
          uint64_t v42 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Found valid wormhole in staging from %{public}@ to %{public}@",  buf,  0x16u);
        }

        if (!-[MSDHOperations moveStagingToFinal:finalPath:](self, "moveStagingToFinal:finalPath:", v17, v16)) {
          goto LABEL_28;
        }
        id v22 = sub_100021D84();
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v11;
          __int16 v41 = 2114;
          uint64_t v42 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Creating new wormhole in staging from %{public}@ to %{public}@",  buf,  0x16u);
        }

        id v36 = v18;
        unsigned __int8 v24 = [v8 removeItemAtPath:v11 error:&v36];
        id v25 = v36;

        if ((v24 & 1) != 0)
        {
          id v35 = v25;
          unsigned __int8 v26 = [v8 createSymbolicLinkAtPath:v11 withDestinationPath:v16 error:&v35];
          id v18 = v35;

          if ((v26 & 1) != 0)
          {

            BOOL v27 = 1;
LABEL_12:
            id v13 = v18;
            goto LABEL_16;
          }

          id v33 = sub_100021D84();
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v34 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
            *(_DWORD *)buf = 138543874;
            uint64_t v40 = v11;
            __int16 v41 = 2114;
            uint64_t v42 = v16;
            __int16 v43 = 2114;
            id v44 = v34;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Cannot create symlink from %{public}@ to %{public}@ - %{public}@",  buf,  0x20u);
          }
        }

        else
        {
          id v32 = sub_100021D84();
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10002BB10();
          }
          id v18 = v25;
        }
      }

      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        sub_10002BA94();
      }

LABEL_28:
      BOOL v27 = 0;
      goto LABEL_12;
    }

    id v28 = sub_100021D84();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 fileType]);
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v11;
      __int16 v41 = 2114;
      uint64_t v42 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Wormhole in staging %{public}@ has unexpected file type - %{public}@",  buf,  0x16u);
    }

    BOOL v27 = 1;
  }

  else
  {
    id v31 = sub_100021D84();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002BA18();
    }
    BOOL v27 = 0;
  }

- (BOOL)disableLaunchdServicesForWatch
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"com.apple.atc",  @"com.apple.eventkitsyncd",  @"com.apple.imautomatichistorydeletionagent",  0LL));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v6);
        __int16 v23 = 0;
        id v8 = v7;
        int service_enabled = launch_get_service_enabled([v8 UTF8String], (char *)&v23 + 1, &v23);
        if (service_enabled)
        {
          int v10 = service_enabled;
          id v11 = sub_100021D84();
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v8;
            __int16 v30 = 1024;
            int v31 = v10;
            id v19 = v12;
            id v20 = "Failed to get status for launchd service '%{public}@' with error - %d";
LABEL_18:
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x12u);
          }

          goto LABEL_8;
        }

        if (HIBYTE(v23) | v23)
        {
          id v13 = sub_100021D84();
          unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Disabling launchd service '%{public}@'",  buf,  0xCu);
          }

          id v15 = v8;
          int v16 = launch_set_service_enabled([v15 UTF8String], 0);
          if (v16)
          {
            int v17 = v16;
            id v18 = sub_100021D84();
            id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v29 = v15;
              __int16 v30 = 1024;
              int v31 = v17;
              id v19 = v12;
              id v20 = "Failed to disable launchd service '%{public}@' with error - %d";
              goto LABEL_18;
            }

- (BOOL)moveStagingToFinal:(id)a3 finalPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v43 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = sub_100021D84();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v55 = "-[MSDHOperations moveStagingToFinal:finalPath:]";
    __int16 v56 = 2114;
    id v57 = v5;
    __int16 v58 = 2114;
    id v59 = v43;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s - stagingPath:  %{public}@ - finalPath:  %{public}@",  buf,  0x20u);
  }

  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    id v36 = sub_100021D84();
    obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_10002BC08();
    }
    id v28 = 0LL;
    goto LABEL_38;
  }

  id v41 = v5;
  if ([v8 fileExistsAtPath:v43])
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    obj = (os_log_s *)(id)objc_claimAutoreleasedReturnValue([v8 enumeratorAtPath:v5]);
    id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v48,  v53,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v42 = 0LL;
      uint64_t v14 = *(void *)v49;
      uint64_t v40 = v8;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v49 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
          int v17 = objc_autoreleasePoolPush();
          id v18 = (char *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v16]);
          if ([v8 fileExistsAtPath:v18])
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v43 stringByAppendingPathComponent:v16]);
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByDeletingLastPathComponent]);
            if (([v8 fileExistsAtPath:v19] & 1) == 0
              && [v8 fileExistsAtPath:v20])
            {
              id v21 = sub_100021D84();
              id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543618;
                v55 = v18;
                __int16 v56 = 2114;
                id v57 = v19;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Moving %{public}@ to %{public}@",  buf,  0x16u);
              }

              id v47 = v42;
              unsigned __int8 v23 = [v8 moveItemAtPath:v18 toPath:v19 error:&v47];
              id v24 = v47;

              if ((v23 & 1) == 0)
              {
                id v32 = sub_100021D84();
                id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                id v28 = v24;
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  id v35 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedDescription]);
                  *(_DWORD *)buf = 138543874;
                  v55 = v18;
                  __int16 v56 = 2114;
                  id v57 = v19;
                  __int16 v58 = 2114;
                  id v59 = v35;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Cannot move %{public}@ to %{public}@ - %{public}@",  buf,  0x20u);
                }

                objc_autoreleasePoolPop(v17);
                id v34 = obj;
                id v8 = v40;
                id v7 = v41;
                goto LABEL_37;
              }

              uint64_t v42 = v24;
              id v8 = v40;
              id v7 = v41;
            }
          }

          objc_autoreleasePoolPop(v17);
        }

        id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v48,  v53,  16LL);
        if (v13) {
          continue;
        }
        break;
      }
    }

    else
    {
      uint64_t v42 = 0LL;
    }

    id v46 = v42;
    unsigned __int8 v30 = [v8 removeItemAtPath:v7 error:&v46];
    id v28 = v46;

    if ((v30 & 1) != 0)
    {
      BOOL v29 = 1;
LABEL_31:
      id v7 = v41;
LABEL_32:

      goto LABEL_33;
    }

    id v38 = sub_100021D84();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    id v7 = v41;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10002BB8C();
    }
LABEL_37:

    goto LABEL_38;
  }

  id v25 = sub_100021D84();
  __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v55 = (const char *)v5;
    __int16 v56 = 2114;
    id v57 = v43;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Moving %{public}@ to %{public}@", buf, 0x16u);
  }

  id v45 = 0LL;
  unsigned __int8 v27 = [v8 moveItemAtPath:v5 toPath:v43 error:&v45];
  id v28 = v45;
  if ((v27 & 1) == 0)
  {
    id v37 = sub_100021D84();
    obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      BOOL v29 = 0;
      goto LABEL_31;
    }

    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v28 localizedDescription]);
    *(_DWORD *)buf = 138543874;
    v55 = (const char *)v5;
    __int16 v56 = 2114;
    id v57 = v43;
    __int16 v58 = 2114;
    id v59 = v39;
    _os_log_error_impl( (void *)&_mh_execute_header,  obj,  OS_LOG_TYPE_ERROR,  "Could not move %{public}@ to %{public}@ with error - %{public}@",  buf,  0x20u);

    id v7 = v5;
LABEL_38:
    BOOL v29 = 0;
    goto LABEL_32;
  }

  BOOL v29 = 1;
  id v7 = v5;
LABEL_33:

  return v29;
}

- (BOOL)switchToBackupFolder
{
  id v2 = sub_100021D84();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = @"/private/var/demo_backup/.backup";
    __int16 v10 = 2114;
    BOOL v11 = @"/private/var/demo_backup/backup";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Renaming %{public}@ to %{public}@...",  (uint8_t *)&v8,  0x16u);
  }

  int v4 = rename( (const char *)[@"/private/var/demo_backup/.backup" fileSystemRepresentation],  (const char *)objc_msgSend(@"/private/var/demo_backup/backup", "fileSystemRepresentation"));
  if (v4)
  {
    id v5 = sub_100021D84();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002BC68(v6);
    }
  }

  return v4 == 0;
}

- (BOOL)reboot
{
  int v2 = reboot3(0LL, a2);
  if (v2)
  {
    int v3 = v2;
    id v4 = sub_100021D84();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002BCE8(v3, v5, v6);
    }
  }

  return 0;
}

- (BOOL)restoreBackupAttributesUnder:(id)a3 range:(_NSRange)a4 manifestUID:(id)a5 deviceUID:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = -[MSDHFileMetadataRestore initWithManifestUID:deviceUID:]( objc_alloc(&OBJC_CLASS___MSDHFileMetadataRestore),  "initWithManifestUID:deviceUID:",  v13,  v12);

  if (!v14)
  {
    id v20 = sub_100021D84();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002BD50();
    }
    goto LABEL_13;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));

  if (!v15)
  {
    id v22 = sub_100021D84();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002BD7C(v21, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_13;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));
  int v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mergedBackupManifest:", location, length));

  if (!v17)
  {
    id v30 = sub_100021D84();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002BDEC();
    }
LABEL_13:

    int v17 = 0LL;
    goto LABEL_14;
  }

  if (!-[MSDHFileMetadataRestore restoreAttributesUnder:fromManifestData:]( v14,  "restoreAttributesUnder:fromManifestData:",  v11,  v17))
  {
LABEL_14:
    BOOL v18 = 0;
    goto LABEL_6;
  }

  BOOL v18 = 1;
LABEL_6:

  return v18;
}

- (BOOL)restoreAppDataAttributesUnder:(id)a3 containerType:(id)a4 identifier:(id)a5 manifestUID:(id)a6 deviceUID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a6;
  int v17 = -[MSDHFileMetadataRestore initWithManifestUID:deviceUID:]( objc_alloc(&OBJC_CLASS___MSDHFileMetadataRestore),  "initWithManifestUID:deviceUID:",  v16,  v15);

  if (!v17)
  {
    id v23 = sub_100021D84();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002BE60();
    }
    goto LABEL_12;
  }

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));

  if (!v18)
  {
    id v24 = sub_100021D84();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002BE8C(v20, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_12;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHOperations signedManifest](self, "signedManifest"));
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 getManifestDataFromSection:v13 forIdentifier:v14]);

  if (!v20)
  {
    id v32 = sub_100021D84();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002BEFC();
    }
LABEL_12:
    unsigned __int8 v21 = 0;
    goto LABEL_5;
  }

  unsigned __int8 v21 = -[MSDHFileMetadataRestore restoreAttributesUnder:fromManifestData:]( v17,  "restoreAttributesUnder:fromManifestData:",  v12,  v20);
LABEL_5:

  return v21;
}

- (BOOL)quitHelper
{
}

- (BOOL)collectDemoLogsToFolder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:v4]);

  if ([v5 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz"])
  {
    id v46 = 0LL;
    unsigned __int8 v7 = [v5 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz" error:&v46];
    id v8 = v46;
    id v9 = v8;
    if ((v7 & 1) == 0)
    {
      id v39 = sub_100021D84();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10002C10C();
      }
      goto LABEL_37;
    }

    __int16 v10 = v8;
  }

  else
  {
    __int16 v10 = 0LL;
  }

  if ([v5 fileExistsAtPath:v6])
  {
    id v45 = v10;
    unsigned __int8 v11 = [v5 removeItemAtPath:v6 error:&v45];
    id v9 = v45;

    if ((v11 & 1) == 0)
    {
      id v40 = sub_100021D84();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10002C0E0();
      }
      goto LABEL_37;
    }

    __int16 v10 = v9;
  }

  id v44 = v10;
  unsigned __int8 v12 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v44];
  id v9 = v44;

  if ((v12 & 1) == 0)
  {
    id v33 = sub_100021D84();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002C0B4();
    }
    goto LABEL_37;
  }

  id v13 = (os_log_s *)MGCopyAnswer(@"DiskUsage", 0LL);
  if (!v13)
  {
    id v34 = sub_100021D84();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002BF64();
    }
    BOOL v30 = 1;
    goto LABEL_19;
  }

  id v14 = v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v13, "objectForKey:", kMGQDiskUsageAmountDataAvailable));
  id v16 = v15;
  if (!v15 || (uint64_t)[v15 longLongValue] <= 52428800)
  {
    id v32 = sub_100021D84();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002BF90(v16, v24);
    }
    goto LABEL_36;
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"demod.log"]);
  unsigned __int8 v18 = -[MSDHOperations generateLogsForPredicate:toFile:]( self,  "generateLogsForPredicate:toFile:",  @"subsystem == 'com.apple.MobileStoreDemo'",  v17);

  if ((v18 & 1) == 0)
  {
    id v35 = sub_100021D84();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002C088();
    }
    goto LABEL_36;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"demoloop.log"]);
  unsigned __int8 v20 = -[MSDHOperations generateLogsForPredicate:toFile:]( self,  "generateLogsForPredicate:toFile:",  @"subsystem == 'com.apple.ist.dcota'",  v19);

  if ((v20 & 1) == 0)
  {
    id v36 = sub_100021D84();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002C05C();
    }
LABEL_36:

LABEL_37:
    BOOL v30 = 0;
    goto LABEL_19;
  }

  if (![v5 fileExistsAtPath:@"/var/logs/demod/demod-finish-demo-restore.log"])
  {
LABEL_17:
    id v24 = objc_alloc_init(&OBJC_CLASS___MSDFileArchiver);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz"));
    unsigned __int8 v27 = -[os_log_s compressContent:toPath:](v24, "compressContent:toPath:", v25, v26);

    if ((v27 & 1) != 0)
    {
      v47[0] = NSFileOwnerAccountName;
      v47[1] = NSFileGroupOwnerAccountName;
      v48[0] = @"mobile";
      v48[1] = @"mobile";
      v47[2] = NSFilePosixPermissions;
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](&OBJC_CLASS___NSNumber, "numberWithShort:", 448LL));
      v48[2] = v28;
      uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  3LL));

      [v5 changeFileAttributes:v29 atPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz"];
      BOOL v30 = 1;
      id v14 = (os_log_s *)v29;
      goto LABEL_19;
    }

    id v37 = sub_100021D84();
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_10002C004();
    }

    goto LABEL_36;
  }

  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"demod-finish-demo-restore.log"]);
  id v43 = v9;
  unsigned __int8 v22 = [v5 copyItemAtPath:@"/var/logs/demod/demod-finish-demo-restore.log" toPath:v21 error:&v43];
  id v23 = v43;

  if ((v22 & 1) != 0)
  {
    id v9 = v23;
    goto LABEL_17;
  }

  id v41 = sub_100021D84();
  uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
    sub_10002C030();
  }

  BOOL v30 = 0;
  id v9 = v23;
LABEL_19:

  return v30;
}

- (BOOL)generateLogsForPredicate:(id)a3 toFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[OSLogEventStore localStore](&OBJC_CLASS___OSLogEventStore, "localStore"));
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  id v39 = sub_10001E374;
  id v40 = sub_10001E384;
  id v41 = 0LL;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v26 = 0LL;
  unsigned __int8 v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_10001E374;
  BOOL v30 = sub_10001E384;
  id v31 = 0LL;
  [v7 createFileAtPath:v6 contents:0 attributes:0];
  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForWritingAtPath:", v6));
  unsigned __int8 v11 = (void *)v27[5];
  v27[5] = v10;

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10001E38C;
  v20[3] = &unk_100044FA0;
  id v23 = &v36;
  id v12 = v5;
  id v21 = v12;
  id v24 = &v32;
  id v13 = v9;
  unsigned __int8 v22 = v13;
  uint64_t v25 = &v26;
  [v8 prepareWithCompletionHandler:v20];
  dispatch_time_t v14 = dispatch_time(0LL, 600000000000LL);
  if (dispatch_semaphore_wait(v13, v14))
  {
    id v15 = sub_100021D84();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Request to collect MobileStoreDemo logs timed out.",  v19,  2u);
    }

    [(id)v37[5] invalidate];
  }

  [(id)v27[5] closeFile];
  char v17 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v17;
}

- (BOOL)preserveBluetoothFileToShelter:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = sub_100021D84();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, ">>> Copying item from '%{public}@'", buf, 0xCu);
  }

  if ([v4 fileExistsAtPath:v3])
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/BluetoothShelter" stringByAppendingPathComponent:v3]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByDeletingLastPathComponent]);
    id v18 = 0LL;
    unsigned __int8 v9 = [v4 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v10 = v18;
    if ((v9 & 1) != 0)
    {
      if ([v4 cloneFile:v3 to:v7 expectingHash:0 correctOwnership:0])
      {
        BOOL v11 = +[MSDXattr setContentRoot:](&OBJC_CLASS___MSDXattr, "setContentRoot:", v7);

        goto LABEL_7;
      }

      id v16 = sub_100021D84();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        char v17 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
        *(_DWORD *)buf = 138543874;
        id v20 = v3;
        __int16 v21 = 2114;
        unsigned __int8 v22 = v7;
        __int16 v23 = 2114;
        id v24 = v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to copy item from %{public}@ to %{public}@ with error - %{public}@",  buf,  0x20u);
      }
    }

    else
    {
      id v14 = sub_100021D84();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10002C138();
      }
    }

    BOOL v11 = 0;
    goto LABEL_7;
  }

  id v13 = sub_100021D84();
  id v10 = (id)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
    sub_10002C1B4();
  }
  BOOL v11 = 1;
LABEL_7:

  return v11;
}

- (BOOL)runPreflightChecksOnSecondPartyAppData:(id)a3 withReturnErrorMsg:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v7 = objc_alloc_init(&OBJC_CLASS___MSDHSnapshottedDataSaver);
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    unsigned __int8 v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"App data folder does not exist or is not a folder:  %@",  v5,  v27,  v28);
LABEL_22:
    id v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
    id v18 = 0LL;
    goto LABEL_23;
  }

  id v10 = -[MSDHSnapshottedDataSaver getFileSizeForItemAtPath:](v7, "getFileSizeForItemAtPath:", v5);
  id v11 = sub_100021D84();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10002C334();
  }

  if (v10 == (char *)-1LL)
  {
    unsigned __int8 v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to calculate size of source data:  %@",  v5,  v27,  v28);
    goto LABEL_22;
  }

  if ((unint64_t)v10 > 0x280000000LL)
  {
    unsigned __int8 v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Size of source data:  %lld at:  %@ exceeds max size of:  %llu",  v10,  v5,  0x280000000LL);
    goto LABEL_22;
  }

  if (!-[MSDHSnapshottedDataSaver canDeviceHaveEnoughSpaceForItemDomainWithSize:]( v7,  "canDeviceHaveEnoughSpaceForItemDomainWithSize:",  v10))
  {
    unsigned __int8 v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Device does not have enough space to preserve data - Data size:  %lld",  v10,  v27,  v28);
    goto LABEL_22;
  }

  if ([v6 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter"])
  {
    id v14 = -[MSDHSnapshottedDataSaver getFileSizeForItemAtPath:]( v7,  "getFileSizeForItemAtPath:",  @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter");
    if (v14 == (char *)-1LL)
    {
      id v18 = 0LL;
      id v20 = @"Failed to calculate current size of second party app data shelter.";
      goto LABEL_23;
    }

    id v15 = v14;
    id v16 = sub_100021D84();
    char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10002C2D4();
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter" stringByAppendingPathComponent:v5]);
    if ([v6 fileExistsAtPath:v18])
    {
      int64_t v19 = -[MSDHSnapshottedDataSaver getFileSizeForItemAtPath:](v7, "getFileSizeForItemAtPath:", v18);
      if (v19 == -1)
      {
        id v20 = @"Failed to calculate size of existing second party app data";
        goto LABEL_23;
      }

      v15 -= v19;
    }
  }

  else
  {
    id v15 = 0LL;
    id v18 = 0LL;
  }

  id v25 = sub_100021D84();
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_10002C274();
  }

  if (&v10[(void)v15] <= (char *)0x280000000LL)
  {
    BOOL v23 = 1;
    goto LABEL_29;
  }

  id v20 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The current size of the second-party data shelter is %llu.  Saving this data of size %lld bytes will cause it to exceed the data cap of %lld bytes.",  v15,  v10,  0x280000000LL));
LABEL_23:
  if (a4 && v20) {
    *a4 = v20;
  }
  id v21 = sub_100021D84();
  unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10002C214();
  }

  BOOL v23 = 0;
LABEL_29:

  return v23;
}

- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 withReturnErrorMsg:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v35 = 0LL;
  unsigned int v8 = -[MSDHOperations runPreflightChecksOnSecondPartyAppData:withReturnErrorMsg:]( self,  "runPreflightChecksOnSecondPartyAppData:withReturnErrorMsg:",  v6,  &v35);
  id v9 = v35;
  if (!v8)
  {
    id v10 = 0LL;
    id v15 = 0LL;
    BOOL v23 = 0LL;
    goto LABEL_19;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/SecondPartyAppDataShelter" stringByAppendingPathComponent:v6]);
  if ([v7 fileExistsAtPath:v10])
  {
    id v34 = 0LL;
    unsigned __int8 v11 = [v7 removeItemAtPath:v10 error:&v34];
    id v12 = v34;
    id v13 = v12;
    if ((v11 & 1) == 0)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to delete destination folder in persitent storage - Error:  %@",  v20));

      id v15 = 0LL;
      goto LABEL_15;
    }

    id v14 = v12;
  }

  else
  {
    id v14 = 0LL;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByDeletingLastPathComponent]);
  if ([v7 fileExistsAtPath:v10])
  {
    id v13 = v14;
LABEL_9:
    if ([v7 cloneFile:v6 to:v10 expectingHash:0 correctOwnership:0])
    {
      if (+[MSDXattr setContentRoot:](&OBJC_CLASS___MSDXattr, "setContentRoot:", v10))
      {
        BOOL v17 = 1;
        goto LABEL_31;
      }

      unsigned __int8 v22 = __error();
      int64_t v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to set xattr for destination folder in persistent storage - Error:  %s",  strerror(*v22),  v31);
    }

    else
    {
      id v18 = __error();
      int64_t v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to copy source data  %@ to persistent storage - Error:  %s",  v6,  strerror(*v18));
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_18;
  }

  id v33 = v14;
  unsigned __int8 v16 = [v7 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v33];
  id v13 = v33;

  if ((v16 & 1) != 0) {
    goto LABEL_9;
  }
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
  uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create parent destination folder in persistent storage - Error:  %@",  v20));

LABEL_15:
  id v9 = (id)v20;
LABEL_18:

  id v9 = (id)v21;
  BOOL v23 = v13;
LABEL_19:
  if ([v7 fileExistsAtPath:v10])
  {
    id v32 = v23;
    unsigned __int8 v24 = [v7 removeItemAtPath:v10 error:&v32];
    id v13 = v32;

    if ((v24 & 1) == 0)
    {
      id v25 = sub_100021D84();
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
        *(_DWORD *)buf = 138412546;
        id v37 = v10;
        __int16 v38 = 2112;
        id v39 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Failed to remove folder:  %@ - Error:  %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    id v13 = v23;
  }

  if (a4 && v9) {
    *a4 = v9;
  }
  id v28 = sub_100021D84();
  char v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_10002C214();
  }

  BOOL v17 = 0;
LABEL_31:

  return v17;
}

- (BOOL)restartBluetooth
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v2 = (uint64_t (*)(const __CFString *, void, const __CFString *))off_10004F8D0;
  unsigned __int8 v11 = off_10004F8D0;
  if (!off_10004F8D0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10001F5D8;
    v7[3] = &unk_100044FC8;
    v7[4] = &v8;
    sub_10001F5D8((uint64_t)v7);
    int v2 = (uint64_t (*)(const __CFString *, void, const __CFString *))v9[3];
  }

  _Block_object_dispose(&v8, 8);
  if (v2)
  {
    LODWORD(v2) = v2( @"bluetoothd",  0LL,  @"Restarting bluetoothd to restore bluetooth pairing record for DeKOTA devices.");
    if (!(_DWORD)v2) {
      return (_DWORD)v2 == 0;
    }
  }

  else
  {
    sub_10002C394();
  }

  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10002C3B4((int)v2, v5, v6);
  }

  return (_DWORD)v2 == 0;
}

- (BOOL)setComputerNameAndHostname:(id)a3 encoding:(unsigned int)a4
{
  id v5 = (__CFString *)a3;
  id v6 = sub_100021D84();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315650;
    unsigned __int8 v24 = "-[MSDHOperations setComputerNameAndHostname:encoding:]";
    __int16 v25 = 2114;
    uint64_t v26 = v5;
    __int16 v27 = 1026;
    unsigned int v28 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s - computerName:  %{public}@ - encoding:  0x%{public}x",  (uint8_t *)&v23,  0x1Cu);
  }

  uint64_t v8 = SCPreferencesCreate(0LL, @"demod_helper:setComputerName", 0LL);
  if (!v8)
  {
    id v16 = sub_100021D84();
    BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002C41C(v17);
    }

    goto LABEL_22;
  }

  id v9 = v8;
  if (!SCPreferencesSetComputerName(v8, v5, a4))
  {
    id v18 = sub_100021D84();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002C490(v13);
    }
    goto LABEL_21;
  }

  uint64_t v10 = (const __CFString *)_CSCopyLocalHostnameForComputerName(0LL, v5);
  id v11 = sub_100021D84();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (!v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002C504();
    }
LABEL_21:

    CFRelease(v9);
LABEL_22:
    BOOL v14 = 0;
    goto LABEL_13;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10002C68C();
  }

  if (!SCPreferencesSetLocalHostName(v9, v10))
  {
    id v19 = sub_100021D84();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002C530(v20);
    }
    goto LABEL_29;
  }

  if (!SCPreferencesCommitChanges(v9))
  {
    id v21 = sub_100021D84();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002C5A4(v20);
    }
    goto LABEL_29;
  }

  if (!SCPreferencesApplyChanges(v9))
  {
    id v22 = sub_100021D84();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002C618(v20);
    }
LABEL_29:

    BOOL v14 = 0;
    goto LABEL_12;
  }

  BOOL v14 = 1;
LABEL_12:
  CFRelease(v9);
  CFRelease(v10);
LABEL_13:

  return v14;
}

- (id)getPathInUserHomeDirectory:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHVolumeManager sharedInstance](&OBJC_CLASS___MSDHVolumeManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userHomePath]);

  if ([v3 hasPrefix:@"/var/MSDWorkContainer"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"/.MSDWorkContainer"]);
    unsigned __int8 v7 = @"/var/MSDWorkContainer";
  }

  else
  {
    if (![v3 hasPrefix:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer"])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"/.MSDWorkContainer"]);
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
      goto LABEL_7;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:@"/.MSDWorkContainer"]);
    unsigned __int8 v7 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer";
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", -[__CFString length](v7, "length")));
LABEL_7:
  id v9 = (void *)v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v8]);

  return v10;
}

- (BOOL)setPreferencesForKey:(id)a3 withValue:(id)a4 forApplication:(id)a5 andUser:(id)a6
{
  id v9 = (__CFString *)a6;
  uint64_t v10 = (__CFString *)a5;
  CFPreferencesSetValue((CFStringRef)a3, a4, v10, v9, kCFPreferencesAnyHost);
  int v11 = CFPreferencesSynchronize(v10, v9, kCFPreferencesAnyHost);

  if (!v11)
  {
    id v13 = sub_100021D84();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002C6EC(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  return v11 != 0;
}

- (void)setSignedManifest:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end