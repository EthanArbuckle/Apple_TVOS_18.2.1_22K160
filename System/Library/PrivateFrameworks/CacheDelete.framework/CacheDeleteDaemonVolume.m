@interface CacheDeleteDaemonVolume
+ (CacheDeleteDaemonVolume)volumeWithMountpoint:(id)a3;
+ (CacheDeleteDaemonVolume)volumeWithPath:(id)a3;
+ (id)createVolume:(id)a3 isPrimary:(BOOL)a4;
+ (void)invalidateVolumesCache:(id)a3;
- (BOOL)containerTotalSize:(unint64_t *)a3 andFreespace:(unint64_t *)a4;
- (BOOL)hasSnapshotsExcludingRegularExpression:(id)a3;
- (BOOL)hasSnapshotsExcludingTimeMachine;
- (BOOL)hasSnapshotsMatchingRegularExpression:(id)a3;
- (BOOL)isAPFSVolume;
- (BOOL)isSpecialVolume;
- (BOOL)isValid;
- (BOOL)primary;
- (BOOL)validate;
- (BOOL)validated;
- (CacheDeleteDaemonVolume)initWithPath:(id)a3;
- (CacheDeleteDaemonVolume)initWithPath:(id)a3 isPrimary:(BOOL)a4;
- (CacheDeleteDaemonVolume)initWithVolume:(id)a3;
- (NSArray)siblings;
- (NSDictionary)_thresholds;
- (NSUUID)uuid;
- (id)bsdDisk;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)snapshots;
- (id)snapshotsExcludingRegularExpression:(id)a3;
- (id)snapshotsExcludingTimeMachine;
- (id)snapshotsMatchingRegularExpression:(id)a3;
- (id)timeMachineSnapshotRegex;
- (unint64_t)quota;
- (unint64_t)reserve;
- (unsigned)role;
- (void)setIsValid:(BOOL)a3;
- (void)setQuota:(unint64_t)a3;
- (void)setReserve:(unint64_t)a3;
- (void)setValidated:(BOOL)a3;
@end

@implementation CacheDeleteDaemonVolume

- (id)snapshots
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](self, "mountPoint"));
  v5 = (const char *)[v4 fileSystemRepresentation];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __47__CacheDeleteDaemonVolume_Snapshots__snapshots__block_invoke;
  v13[3] = &unk_100059848;
  v6 = v3;
  v14 = v6;
  LODWORD(v5) = enumerate_snapshots(v5, v13);

  if ((_DWORD)v5)
  {
    uint64_t v7 = CDGetLogHandle("daemon");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](self, "mountPoint"));
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      __int16 v17 = 2080;
      v18 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to enumerate snapshots for volume %@: %s",  buf,  0x16u);
    }
  }

  return v6;
}

void __47__CacheDeleteDaemonVolume_Snapshots__snapshots__block_invoke(uint64_t a1, void *a2)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2 + 2));
  id v4 = *(void **)(a1 + 32);
  v5 = -[CacheDeleteSnapshotInfo initWithName:uid:]( objc_alloc(&OBJC_CLASS___CacheDeleteSnapshotInfo),  "initWithName:uid:",  v6,  *a2);
  [v4 addObject:v5];
}

- (BOOL)hasSnapshotsMatchingRegularExpression:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  id v5 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](self, "mountPoint"));
  id v6 = (const char *)[v5 fileSystemRepresentation];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  __int16 v17 = __76__CacheDeleteDaemonVolume_Snapshots__hasSnapshotsMatchingRegularExpression___block_invoke;
  v18 = &unk_100059870;
  id v7 = v4;
  id v19 = v7;
  v20 = &v21;
  LODWORD(v6) = enumerate_snapshots(v6, &v15);

  if ((_DWORD)v6)
  {
    uint64_t v8 = CDGetLogHandle("daemon");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](self, "mountPoint", v15, v16, v17, v18));
      v13 = __error();
      v14 = strerror(*v13);
      *(_DWORD *)buf = 138412546;
      v26 = v12;
      __int16 v27 = 2080;
      v28 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to enumerate shapshots for volume %@: %s",  buf,  0x16u);
    }
  }

  BOOL v10 = *((_BYTE *)v22 + 24) != 0;

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __76__CacheDeleteDaemonVolume_Snapshots__hasSnapshotsMatchingRegularExpression___block_invoke( uint64_t a1,  uint64_t a2,  _BYTE *a3)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2 + 16));
  if (objc_msgSend( *(id *)(a1 + 32),  "numberOfMatchesInString:options:range:",  v5,  0,  0,  objc_msgSend(v5, "length")))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }
}

- (id)snapshotsMatchingRegularExpression:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](self, "mountPoint"));
  id v7 = (const char *)[v6 fileSystemRepresentation];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = __73__CacheDeleteDaemonVolume_Snapshots__snapshotsMatchingRegularExpression___block_invoke;
  uint64_t v21 = &unk_100059898;
  id v22 = v4;
  uint64_t v8 = v5;
  uint64_t v23 = v8;
  id v9 = v4;
  LODWORD(v7) = enumerate_snapshots(v7, &v18);

  if ((_DWORD)v7)
  {
    uint64_t v10 = CDGetLogHandle("daemon");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](self, "mountPoint", v18, v19, v20, v21, v22));
      uint64_t v16 = __error();
      __int16 v17 = strerror(*v16);
      *(_DWORD *)buf = 138412546;
      v25 = v15;
      __int16 v26 = 2080;
      __int16 v27 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to enumerate snapshots for volume %@: %s",  buf,  0x16u);
    }
  }

  v12 = v23;
  v13 = v8;

  return v13;
}

void __73__CacheDeleteDaemonVolume_Snapshots__snapshotsMatchingRegularExpression___block_invoke( uint64_t a1,  void *a2)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2 + 2));
  if (objc_msgSend( *(id *)(a1 + 32),  "numberOfMatchesInString:options:range:",  v6,  0,  0,  objc_msgSend(v6, "length")))
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = -[CacheDeleteSnapshotInfo initWithName:uid:]( objc_alloc(&OBJC_CLASS___CacheDeleteSnapshotInfo),  "initWithName:uid:",  v6,  *a2);
    [v4 addObject:v5];
  }
}

- (BOOL)hasSnapshotsExcludingRegularExpression:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  id v5 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](self, "mountPoint"));
  id v6 = (const char *)[v5 fileSystemRepresentation];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __77__CacheDeleteDaemonVolume_Snapshots__hasSnapshotsExcludingRegularExpression___block_invoke;
  v15[3] = &unk_1000598C0;
  id v7 = v4;
  id v16 = v7;
  __int16 v17 = self;
  v18 = &v19;
  LODWORD(v6) = enumerate_snapshots(v6, v15);

  if ((_DWORD)v6)
  {
    uint64_t v8 = CDGetLogHandle("daemon");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](self, "mountPoint"));
      v13 = __error();
      v14 = strerror(*v13);
      *(_DWORD *)buf = 138412546;
      char v24 = v12;
      __int16 v25 = 2080;
      __int16 v26 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to enumerate snapshots for volume %@: %s",  buf,  0x16u);
    }
  }

  BOOL v10 = *((_BYTE *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __77__CacheDeleteDaemonVolume_Snapshots__hasSnapshotsExcludingRegularExpression___block_invoke( uint64_t a1,  uint64_t a2,  _BYTE *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2 + 16));
  if (!objc_msgSend( *(id *)(a1 + 32),  "numberOfMatchesInString:options:range:",  v5,  0,  0,  objc_msgSend(v5, "length")))
  {
    uint64_t v6 = CDGetLogHandle("daemon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mountPoint]);
      int v9 = 138412546;
      BOOL v10 = v8;
      __int16 v11 = 2112;
      v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "hasSnapshotsExcludingRegularExpression %@: %@",  (uint8_t *)&v9,  0x16u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }
}

- (id)snapshotsExcludingRegularExpression:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](self, "mountPoint"));
  id v7 = (const char *)[v6 fileSystemRepresentation];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = __74__CacheDeleteDaemonVolume_Snapshots__snapshotsExcludingRegularExpression___block_invoke;
  uint64_t v21 = &unk_100059898;
  id v22 = v4;
  uint64_t v8 = v5;
  uint64_t v23 = v8;
  id v9 = v4;
  LODWORD(v7) = enumerate_snapshots(v7, &v18);

  if ((_DWORD)v7)
  {
    uint64_t v10 = CDGetLogHandle("daemon");
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](self, "mountPoint", v18, v19, v20, v21, v22));
      id v16 = __error();
      __int16 v17 = strerror(*v16);
      *(_DWORD *)buf = 138412546;
      __int16 v25 = v15;
      __int16 v26 = 2080;
      __int16 v27 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to enumerate snapshots for volume %@: %s",  buf,  0x16u);
    }
  }

  v12 = v23;
  v13 = v8;

  return v13;
}

void __74__CacheDeleteDaemonVolume_Snapshots__snapshotsExcludingRegularExpression___block_invoke( uint64_t a1,  void *a2)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2 + 2));
  if (!objc_msgSend( *(id *)(a1 + 32),  "numberOfMatchesInString:options:range:",  v6,  0,  0,  objc_msgSend(v6, "length")))
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = -[CacheDeleteSnapshotInfo initWithName:uid:]( objc_alloc(&OBJC_CLASS___CacheDeleteSnapshotInfo),  "initWithName:uid:",  v6,  *a2);
    [v4 addObject:v5];
  }
}

- (id)timeMachineSnapshotRegex
{
  return +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"^com\\.apple\\.mobilebackup",  0LL,  0LL);
}

- (BOOL)hasSnapshotsExcludingTimeMachine
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume timeMachineSnapshotRegex](self, "timeMachineSnapshotRegex"));
  LOBYTE(v2) = -[CacheDeleteDaemonVolume hasSnapshotsExcludingRegularExpression:]( v2,  "hasSnapshotsExcludingRegularExpression:",  v3);

  return (char)v2;
}

- (id)snapshotsExcludingTimeMachine
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume timeMachineSnapshotRegex](self, "timeMachineSnapshotRegex"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CacheDeleteDaemonVolume snapshotsExcludingRegularExpression:]( self,  "snapshotsExcludingRegularExpression:",  v3));

  return v4;
}

- (id)bsdDisk
{
  return 0LL;
}

- (BOOL)validate
{
  v2 = self;
  if (self->_validated)
  {
    LOBYTE(self) = self->_isValid;
  }

  else
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___CacheDeleteDaemonVolume;
    LODWORD(self) = -[CacheDeleteDaemonVolume validate](&v4, "validate");
    if ((_DWORD)self) {
      LOBYTE(self) = !-[CacheDeleteDaemonVolume isSpecialVolume](v2, "isSpecialVolume");
    }
    v2->_isValid = (char)self;
    v2->_validated = 1;
  }

  return (char)self;
}

- (NSArray)siblings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  mach_port_t v4 = kIOMainPortDefault;
  v32 = self;
  id v5 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume bsdName](self, "bsdName"));
  id v6 = IOBSDNameMatching(kIOMainPortDefault, 0, (const char *)[v5 UTF8String] + 5);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);

  if (MatchingService)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"BSD Unit", kCFAllocatorDefault, 0);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(CFProperty);
  }

  else
  {
    id v9 = 0LL;
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t LocalVolumes = getLocalVolumes();
  id obj = (id)objc_claimAutoreleasedReturnValue(LocalVolumes);
  id v11 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v35;
    *(void *)&__int128 v12 = 138412802LL;
    __int128 v30 = v12;
    v31 = v9;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteVolume volumeWithMountpoint:]( &OBJC_CLASS___CacheDeleteVolume,  "volumeWithMountpoint:",  v16,  v30));
        v18 = v17;
        if (v17)
        {
          id v19 = objc_claimAutoreleasedReturnValue([v17 bsdName]);
          v20 = IOBSDNameMatching(v4, 0, (const char *)[v19 UTF8String] + 5);
          io_service_t v21 = IOServiceGetMatchingService(v4, v20);

          if (v21)
          {
            CFTypeRef v22 = IORegistryEntryCreateCFProperty(v21, @"BSD Unit", kCFAllocatorDefault, 0);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            if ([v9 isEqual:v23])
            {
              uint64_t v24 = CDGetLogHandle("daemon");
              __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v18 bsdName]);
                __int16 v27 = v3;
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume bsdName](v32, "bsdName"));
                *(_DWORD *)buf = v30;
                uint64_t v39 = v16;
                __int16 v40 = 2112;
                v41 = v26;
                __int16 v42 = 2112;
                v43 = v28;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "adding %@ %@ %@", buf, 0x20u);

                v3 = v27;
                mach_port_t v4 = kIOMainPortDefault;

                id v9 = v31;
              }

              [v3 addObject:v18];
            }
          }
        }
      }

      id v13 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    }

    while (v13);
  }

  return (NSArray *)v3;
}

- (CacheDeleteDaemonVolume)initWithPath:(id)a3 isPrimary:(BOOL)a4
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CacheDeleteDaemonVolume;
  id v5 = -[CacheDeleteDaemonVolume initWithPath:](&v22, "initWithPath:", a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume fsType](v5, "fsType"));

    if (v7)
    {
      id v8 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume fsType](v6, "fsType"));
      v6->_isAPFSVolume = strcmp((const char *)[v8 UTF8String], "apfs") == 0;
    }

    else
    {
      v6->_isAPFSVolume = 1;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume bsdName](v6, "bsdName"));
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      id v11 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume bsdName](v6, "bsdName"));
      int v12 = APFSVolumeRole([v11 UTF8String], &v6->_role, 0);

      if (v12) {
        v6->_role = 0;
      }
    }

    id v13 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](v6, "mountPoint"));
    uint64_t v14 = VolUUID([v13 UTF8String]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v15;

    v6->_primary = a4;
    id v17 = objc_claimAutoreleasedReturnValue(-[CacheDeleteDaemonVolume mountPoint](v6, "mountPoint"));
    uint64_t v18 = thresholdsForMountPoint([v17 UTF8String]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    thresholds = v6->__thresholds;
    v6->__thresholds = (NSDictionary *)v19;

    v6->_validated = 0;
  }

  return v6;
}

- (CacheDeleteDaemonVolume)initWithPath:(id)a3
{
  return -[CacheDeleteDaemonVolume initWithPath:isPrimary:](self, "initWithPath:isPrimary:", a3, 1LL);
}

- (CacheDeleteDaemonVolume)initWithVolume:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CacheDeleteDaemonVolume;
  id v5 = -[CacheDeleteDaemonVolume initWithVolume:](&v12, "initWithVolume:", v4);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 uuid]);
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_primary = [v4 primary];
    v5->_reserve = (unint64_t)[v4 reserve];
    v5->_quota = (unint64_t)[v4 quota];
    v5->_isAPFSVolume = [v4 isAPFSVolume];
    v5->_role = (unsigned __int16)[v4 role];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 _thresholds]);
    uint64_t v9 = (NSDictionary *)[v8 copy];
    thresholds = v5->__thresholds;
    v5->__thresholds = v9;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CacheDeleteDaemonVolume initWithVolume:]( objc_alloc(&OBJC_CLASS___CacheDeleteDaemonVolume),  "initWithVolume:",  self);
}

+ (CacheDeleteDaemonVolume)volumeWithPath:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteDaemonVolume validateVolumeAtPath:]( &OBJC_CLASS___CacheDeleteDaemonVolume,  "validateVolumeAtPath:",  v3));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteDaemonVolume createVolume:isPrimary:]( &OBJC_CLASS___CacheDeleteDaemonVolume,  "createVolume:isPrimary:",  v4,  1LL));
  }

  else
  {
    uint64_t v6 = CDGetLogHandle("daemon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "CacheDeleteDaemonVolume volumeWithPath Unable to validate mount point for: %@",  (uint8_t *)&v9,  0xCu);
    }

    id v5 = 0LL;
  }

  return (CacheDeleteDaemonVolume *)v5;
}

+ (id)createVolume:(id)a3 isPrimary:(BOOL)a4
{
  id v5 = a3;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = __Block_byref_object_copy__7;
  io_service_t v21 = __Block_byref_object_dispose__7;
  id v22 = 0LL;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x3032000000LL;
  v15[3] = __Block_byref_object_copy__7;
  void v15[4] = __Block_byref_object_dispose__7;
  id v16 = 0LL;
  if (qword_100066810 != -1) {
    dispatch_once(&qword_100066810, &__block_literal_global_6);
  }
  uint64_t v6 = (dispatch_queue_s *)qword_100066818;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __50__CacheDeleteDaemonVolume_createVolume_isPrimary___block_invoke_2;
  v10[3] = &unk_100059E08;
  id v11 = v5;
  objc_super v12 = v15;
  id v13 = &v17;
  BOOL v14 = a4;
  id v7 = v5;
  dispatch_sync(v6, v10);
  id v8 = (id)v18[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void __50__CacheDeleteDaemonVolume_createVolume_isPrimary___block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.cache_delete.volumes", 0LL);
  v2 = (void *)qword_100066818;
  qword_100066818 = (uint64_t)v1;

  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)_MergedGlobals_1_0;
  _MergedGlobals_1_0 = (uint64_t)v3;
}

void __50__CacheDeleteDaemonVolume_createVolume_isPrimary___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([(id)_MergedGlobals_1_0 objectForKeyedSubscript:*(void *)(a1 + 32)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v5)
  {
    id v6 = [v5 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = CDGetLogHandle("daemon");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v21 = 138412290;
      uint64_t v22 = v11;
      objc_super v12 = "CacheDeleteDaemonVolume createVolume: returned cached  CacheDeleteDaemonVolume from %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v21, 0xCu);
    }
  }

  else
  {
    id v13 = -[CacheDeleteDaemonVolume initWithPath:isPrimary:]( objc_alloc(&OBJC_CLASS___CacheDeleteDaemonVolume),  "initWithPath:isPrimary:",  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 56));
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    if (v16)
    {
      [(id)_MergedGlobals_1_0 setObject:v16 forKeyedSubscript:*(void *)(a1 + 32)];
      uint64_t v17 = CDGetLogHandle("daemon");
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        int v21 = 138412290;
        uint64_t v22 = v18;
        objc_super v12 = "CacheDeleteDaemonVolume createVolume: created a CacheDeleteDaemonVolume from %@";
        goto LABEL_7;
      }
    }

    else
    {
      uint64_t v19 = CDGetLogHandle("daemon");
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        int v21 = 138412290;
        uint64_t v22 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CacheDeleteDaemonVolume createVolume: Unable to create a CacheDeleteDaemonVolume from %@",  (uint8_t *)&v21,  0xCu);
      }
    }
  }
}

+ (void)invalidateVolumesCache:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CDGetLogHandle("daemon");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteDaemonVolume invalidateVolumesCache  UUID %@",  buf,  0xCu);
  }

  if (_MergedGlobals_1_0)
  {
    id v6 = (dispatch_queue_s *)qword_100066818;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __50__CacheDeleteDaemonVolume_invalidateVolumesCache___block_invoke;
    block[3] = &unk_100058BB0;
    id v8 = v3;
    dispatch_sync(v6, block);
  }
}

void __50__CacheDeleteDaemonVolume_invalidateVolumesCache___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([(id)_MergedGlobals_1_0 allValues]);
    id v3 = [v2 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v21 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          uint64_t v8 = CDGetLogHandle("daemon");
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
            *(_DWORD *)buf = 138412290;
            __int16 v25 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteDaemonVolume invalidateVolumesCache %@",  buf,  0xCu);
          }

          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
          unsigned int v12 = [v11 isEqual:*(void *)(a1 + 32)];

          if (v12)
          {
            uint64_t v13 = CDGetLogHandle("daemon");
            uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 mountPoint]);
              *(_DWORD *)buf = 138412290;
              __int16 v25 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteDaemonVolume invalidateVolumesCache removing %@",  buf,  0xCu);
            }

            uint64_t v16 = (void *)_MergedGlobals_1_0;
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 mountPoint]);
            [v16 removeObjectForKey:v17];
          }
        }

        id v4 = [v2 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }

      while (v4);
    }
  }

  else
  {
    uint64_t v18 = CDGetLogHandle("daemon");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteDaemonVolume invalidateVolumesCache invalid UUID",  buf,  2u);
    }

    [(id)_MergedGlobals_1_0 removeAllObjects];
  }

+ (CacheDeleteDaemonVolume)volumeWithMountpoint:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteDaemonVolume volumeWithPath:]( &OBJC_CLASS___CacheDeleteDaemonVolume,  "volumeWithPath:",  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mountPoint]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByStandardizingPath]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByStandardizingPath]);

  LODWORD(v3) = [v6 isEqualToString:v7];
  if ((_DWORD)v3) {
    id v8 = v4;
  }
  else {
    id v8 = 0LL;
  }

  return (CacheDeleteDaemonVolume *)v8;
}

- (BOOL)isSpecialVolume
{
  unsigned int v3 = -[CacheDeleteDaemonVolume role](self, "role");
  if (v3)
  {
    int v4 = -[CacheDeleteDaemonVolume role](self, "role");
    LOBYTE(v3) = 1;
    if (v4 <= 191)
    {
    }

    else if (v4 <= 383)
    {
      if (v4 != 192 && v4 != 256 && v4 != 320) {
        goto LABEL_19;
      }
    }

    else if (v4 > 511)
    {
      if (v4 != 512 && v4 != 640) {
        goto LABEL_19;
      }
    }

    else if (v4 != 384 && v4 != 448)
    {
LABEL_19:
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (BOOL)containerTotalSize:(unint64_t *)a3 andFreespace:(unint64_t *)a4
{
  int SpaceInfo = APFSContainerGetSpaceInfo([@"disk0s1" UTF8String], a3, a4);
  if (SpaceInfo)
  {
    uint64_t v5 = CDGetLogHandle("daemon");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[CacheDeleteDaemonVolume containerTotalSize:andFreespace:]";
      __int16 v10 = 1024;
      int v11 = SpaceInfo;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s : Failed to get container info - err: [%d]",  (uint8_t *)&v8,  0x12u);
    }
  }

  return SpaceInfo == 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CacheDeleteDaemonVolume;
  id v2 = -[CacheDeleteDaemonVolume description](&v4, "description");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)primary
{
  return self->_primary;
}

- (unint64_t)reserve
{
  return self->_reserve;
}

- (void)setReserve:(unint64_t)a3
{
  self->_reserve = a3;
}

- (unint64_t)quota
{
  return self->_quota;
}

- (void)setQuota:(unint64_t)a3
{
  self->_quota = a3;
}

- (BOOL)validated
{
  return self->_validated;
}

- (void)setValidated:(BOOL)a3
{
  self->_validated = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (unsigned)role
{
  return self->_role;
}

- (BOOL)isAPFSVolume
{
  return self->_isAPFSVolume;
}

- (NSDictionary)_thresholds
{
  return self->__thresholds;
}

- (void).cxx_destruct
{
}

@end