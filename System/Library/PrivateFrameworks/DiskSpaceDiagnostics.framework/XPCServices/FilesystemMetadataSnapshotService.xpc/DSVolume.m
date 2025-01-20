@interface DSVolume
+ (BOOL)__checkAttributionTagsCapabilityForVolume:(id)a3;
+ (BOOL)__checkDirStatsDataCapabilityForVolume:(id)a3;
+ (BOOL)__checkPurgeableFilesCapabilityForVolume:(id)a3;
+ (BOOL)_isDirectoryPartOfSAFHierarchy:(id)a3;
+ (id)_safeFilenameForListingVolume:(id)a3 pathExtension:(id)a4;
+ (id)_safeStringFromStatFSCString:(const char *)a3;
+ (id)_volumeInfoFromStatFS:(statfs *)a3 count:(int)a4 usedBytesProvider:(id)a5 volumeManager:(id)a6;
+ (void)_getAttributionTagPathsInDirectory:(id)a3 reply:(id)a4;
+ (void)_getDirStatsType:(id)a3 reply:(id)a4;
+ (void)_getPurgeableRecordsInfo:(id)a3 reply:(id)a4;
+ (void)_getSharedExtensInfo:(id)a3 reply:(id)a4;
- (BOOL)hasPurgeableFilesCapability;
- (BOOL)isRootVolume;
- (BOOL)listContentsWithEntryCount:(unint64_t *)a3 andError:(id *)a4;
- (BOOL)shouldCollectDirStatsData;
- (BOOL)shouldListContents;
- (BOOL)supportsAttributionTags;
- (BOOL)supportsPurgeableRecords;
- (BOOL)supportsSharedExtents;
- (DSVolumeManager)_volumeManager;
- (NSMutableSet)__hashes;
- (NSProgress)progress;
- (NSString)_filesystemTypeName;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)mountPoint;
- (NSString)mountedFrom;
- (NSString)safeFilenameForAttributionTagsListing;
- (NSString)safeFilenameForDirStatsDataListing;
- (NSString)safeFilenameForListing;
- (NSString)safeFilenameForPurgeableRecordsListing;
- (NSString)safeFilenameForSharedExtentsListing;
- (id)_initWithStatFS:(statfs *)a3 usedBytesProvider:(id)a4 volumeManager:(id)a5;
- (id)_pathRepresentationForListing:(char *)a3 isDirectory:(BOOL)a4;
- (unint64_t)capacityBytes;
- (unint64_t)freeBytes;
- (unint64_t)usedBytes;
- (unsigned)_flags;
@end

@implementation DSVolume

+ (BOOL)__checkPurgeableFilesCapabilityForVolume:(id)a3
{
  uint64_t v9 = 0LL;
  id v3 = objc_claimAutoreleasedReturnValue([a3 mountPoint]);
  int v4 = fsctl((const char *)[v3 UTF8String], 0x40084A47uLL, &v9, 0);

  if (!v4) {
    return 1;
  }
  int v5 = *__error();
  return v5 != 2 && v5 != 25 && v5 != 45;
}

+ (BOOL)__checkAttributionTagsCapabilityForVolume:(id)a3
{
  id v3 = a3;
  int v14 = 0;
  id v4 = objc_claimAutoreleasedReturnValue([v3 mountPoint]);
  int v5 = fsctl((const char *)[v4 UTF8String], 0xC0044A75uLL, &v14, 0);

  if (v5)
  {
    id v6 = shared_filesystem_metadata_snapshot_service_log_handle();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = __error();
      uint64_t v9 = strerror(*v8);
      id v10 = objc_claimAutoreleasedReturnValue([v3 mountPoint]);
      id v11 = [v10 UTF8String];
      *(_DWORD *)buf = 136315394;
      v16 = v9;
      __int16 v17 = 2080;
      id v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to get attribution tags flags with error (%s) (%s)",  buf,  0x16u);
    }

    BOOL v12 = 0;
  }

  else
  {
    BOOL v12 = v14 == 1;
  }

  return v12;
}

+ (BOOL)__checkDirStatsDataCapabilityForVolume:(id)a3
{
  id v3 = a3;
  int v15 = 0;
  memset(v14, 0, sizeof(v14));
  id v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mountPoint", 5, 0x20000, 0));
  int v5 = getattrlist((const char *)[v4 UTF8String], &v13, v14, 0x24uLL, 0);

  if (v5)
  {
    id v6 = shared_filesystem_metadata_snapshot_service_log_handle();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = __error();
      uint64_t v9 = strerror(*v8);
      id v10 = objc_claimAutoreleasedReturnValue([v3 mountPoint]);
      id v11 = [v10 UTF8String];
      *(_DWORD *)buf = 136315394;
      __int16 v17 = v9;
      __int16 v18 = 2080;
      id v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Attrlist failed with error (%s) (%s)",  buf,  0x16u);
    }

    LOBYTE(v7) = 0;
  }

  else
  {
    LODWORD(v7) = (BYTE7(v14[0]) >> 2) & 1;
  }

  return (char)v7;
}

+ (id)_volumeInfoFromStatFS:(statfs *)a3 count:(int)a4 usedBytesProvider:(id)a5 volumeManager:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = shared_filesystem_metadata_snapshot_service_log_handle();
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v18[0] = 67109120;
    v18[1] = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Creating DSVolumes for %d statfs entries",  (uint8_t *)v18,  8u);
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (a3 && a4 >= 1)
  {
    uint64_t v14 = a4;
    do
    {
      id v15 = -[DSVolume _initWithStatFS:usedBytesProvider:volumeManager:]( objc_alloc(&OBJC_CLASS___DSVolume),  "_initWithStatFS:usedBytesProvider:volumeManager:",  a3,  v9,  v10);
      [v13 addObject:v15];

      ++a3;
      --v14;
    }

    while (v14);
  }

  id v16 = [v13 copy];

  return v16;
}

+ (id)_safeFilenameForListingVolume:(id)a3 pathExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100066778 != -1) {
    dispatch_once(&qword_100066778, &stru_100060990);
  }
  if ([v5 isRootVolume])
  {
    v7 = @"RootVolume";
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 mountPoint]);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 stringByTrimmingCharactersInSet:qword_100066770]);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 mountedFrom]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByTrimmingCharactersInSet:qword_100066770]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v7, v10));

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByReplacingOccurrencesOfString:@"/" withString:@"_"]);
  if ((unint64_t)[v12 length] >= 0x33)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lu",  [v12 hash]));

    BOOL v12 = (void *)v13;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v12, v6));

  return v14;
}

+ (id)_safeStringFromStatFSCString:(const char *)a3
{
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  a3,  4LL));
  if (!v4)
  {
    id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002C1E4();
    }

    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  a3,  4LL));
    if (!v4) {
      goto LABEL_6;
    }
  }

  if (!-[__CFString length](v4, "length"))
  {
LABEL_6:
    id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002C180();
    }

    id v4 = @"UNKNOWN";
  }

  id v9 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002C104();
  }

  return v4;
}

+ (void)_getAttributionTagPathsInDirectory:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id, uint64_t, void))a4;
  v42[1] = 0LL;
  v42[2] = 0x80000000000LL;
  v42[0] = 0xA000000900000005LL;
  id v7 = (unsigned int *)malloc(0x8000uLL);
  if (v7)
  {
    v8 = v7;
    id v41 = v5;
    int v9 = open((const char *)[v41 fileSystemRepresentation], 1048832);
    if (v9 < 0)
    {
      id v31 = shared_filesystem_metadata_snapshot_service_log_handle();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10002C2BC(v41);
      }

      free(v8);
    }

    else
    {
      id v36 = v5;
      v37 = v8;
      int v38 = v9;
      v39 = v6;
      v40 = 0LL;
      id v11 = 0LL;
      *(void *)&__int128 v10 = 136315394LL;
      __int128 v35 = v10;
LABEL_4:
      BOOL v12 = v37;
      while (1)
      {
        int v13 = getattrlistbulk(v38, v42, v37, 0x8000uLL, 0x20uLL);
        if (v13 == -1) {
          break;
        }
        int v14 = v13;
        if (!v13) {
          goto LABEL_37;
        }
        if (v13 >= 1)
        {
          while (1)
          {
            uint64_t v17 = *v12;
            unsigned int v18 = v12[1];
            unsigned int v19 = v12[5];
            if ((v18 & 0x20000000) == 0) {
              break;
            }
            unsigned int v26 = v12[6];
            if (v26)
            {
              id v27 = shared_filesystem_metadata_snapshot_service_log_handle();
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                id v16 = [v41 fileSystemRepresentation];
                *(_DWORD *)buf = v35;
                *(void *)&uint8_t buf[4] = v16;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v26;
                _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Error while processing directory %s for attribution tags: %d",  buf,  0x12u);
              }

              goto LABEL_26;
            }

            id v15 = (int *)(v12 + 7);
            if ((v18 & 1) != 0) {
              goto LABEL_13;
            }
LABEL_14:
            if ((v18 & 8) != 0 && *v15 == 1 && (v19 & 0x800) != 0)
            {
              uint64_t v24 = *(void *)(v15 + 1);
              if (v24)
              {
                memset(v45, 0, 256);
                *(_OWORD *)&buf[8] = 0u;
                __int128 v44 = 0u;
                *(void *)buf = v24;
                id v11 = v11;
                if (!fsctl((const char *)[v11 fileSystemRepresentation], 0xC1284A72uLL, buf, 0))
                {
                  uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v45));

                  v39[2](v39, v11, v25, *(void *)buf);
                  v40 = (void *)v25;
                }
              }
            }

+ (BOOL)_isDirectoryPartOfSAFHierarchy:(id)a3
{
  uint64_t v7 = 0LL;
  id v3 = a3;
  if (fsctl((const char *)[v3 fileSystemRepresentation], 0x40084A25uLL, &v7, 0))
  {
    id v4 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002C39C(v3, v5);
    }

    LOBYTE(v5) = 0;
  }

  else
  {
    LODWORD(v5) = (BYTE3(v7) >> 5) & 1;
  }

  return (char)v5;
}

+ (void)_getDirStatsType:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v10 = 0LL;
  unint64_t v11 = 1LL;
  id v7 = v5;
  if (fsctl((const char *)objc_msgSend(v7, "fileSystemRepresentation", 0), 0xC1104A71uLL, &v10, 0))
  {
    if (*__error() != 45)
    {
      id v8 = shared_filesystem_metadata_snapshot_service_log_handle();
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002C410(v7);
      }
    }

    (*((void (**)(id, id, void, void))v6 + 2))(v6, v7, 0LL, 0LL);
  }

  else
  {
    (*((void (**)(id, id, uint64_t, unint64_t))v6 + 2))(v6, v7, 1LL, (v11 >> 2) & 1);
  }
}

+ (void)_getSharedExtensInfo:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = (const char *)[a3 fileSystemRepresentation];
  id v7 = (char *)malloc(0x27100uLL);
  if (v7)
  {
    id v8 = v7;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = v7;
    LODWORD(v22) = 160000;
    int v9 = v7 + 16;
    while (!fsctl(v6, 0xC0284A7DuLL, &v21, 0))
    {
      if (DWORD1(v22))
      {
        unint64_t v10 = 0LL;
        uint64_t v11 = DWORD2(v22);
        __int128 v12 = v9;
        do
        {
          uint64_t v13 = *((void *)v12 - 2);
          uint64_t v14 = *(void *)v12;
          (*((void (**)(id, uint64_t, void, uint64_t, void))v5 + 2))( v5,  v13 * v11,  *((void *)v12 - 1),  *(void *)v12 * v11,  *((unsigned int *)v12 + 2));
          *(void *)&__int128 v21 = v14 + v13;
          ++v10;
          v12 += 32;
        }

        while (v10 < DWORD1(v22));
        if (DWORD1(v22)) {
          continue;
        }
      }

      goto LABEL_15;
    }

    id v19 = shared_filesystem_metadata_snapshot_service_log_handle();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002C4F8();
    }

LABEL_15:
    free(v8);
  }

  else
  {
    id v15 = shared_filesystem_metadata_snapshot_service_log_handle();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002C484(v16, v17, v18);
    }
  }
}

+ (void)_getPurgeableRecordsInfo:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = (const char *)[a3 fileSystemRepresentation];
  id v7 = (char *)malloc(0x8000uLL);
  if (v7)
  {
    id v8 = v7;
    v16[1] = 0LL;
    __int128 v18 = 0u;
    __int128 v17 = 0u;
    v16[2] = 512LL;
    id v19 = v7;
    v16[0] = 6LL;
    int v9 = v7 + 24;
    while (!fsctl(v6, 0xC0404A83uLL, v16, 0))
    {
      if (*((void *)&v18 + 1))
      {
        unint64_t v10 = 0LL;
        uint64_t v11 = v9;
        do
        {
          (*((void (**)(id, void, void, void, void))v5 + 2))( v5,  *(v11 - 3),  *(v11 - 2),  *v11,  v11[3]);
          ++v10;
          v11 += 8;
        }

        while (*((void *)&v18 + 1) > v10);
      }

      if (!(void)v18) {
        goto LABEL_15;
      }
    }

    id v14 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002C5DC();
    }

LABEL_15:
    free(v8);
  }

  else
  {
    id v12 = shared_filesystem_metadata_snapshot_service_log_handle();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002C564(v13);
    }
  }
}

- (BOOL)shouldListContents
{
  unsigned int v3 = -[DSVolume _flags](self, "_flags");
  LODWORD(v4) = (v3 >> 12) & 1;
  if ((v3 & 0x1000) == 0)
  {
    id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002C6B4();
    }
  }

  if ((-[DSVolume _flags](self, "_flags") & 0x40000000) != 0)
  {
    id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002C648();
    }

    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (id)_pathRepresentationForListing:(char *)a3 isDirectory:(BOOL)a4
{
  if (!a3) {
    return 0LL;
  }
  BOOL v4 = a4;
  size_t v7 = strlen(a3);
  if (!v7) {
    return 0LL;
  }
  if (v7 != 1)
  {
    if (a3[v7 - 1] != 47)
    {
      BOOL v8 = 1;
      goto LABEL_8;
    }

    return 0LL;
  }

  BOOL v8 = strcmp(a3, "/") != 0;
LABEL_8:
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume _volumeManager](self, "_volumeManager"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _snapshotRequest]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 snapshotFileManager]);

  if ([v12 shouldHashVolumeListings])
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  a3,  0LL,  0LL));
    id v14 = v13;
    if (v13)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
      if (v4)
      {
        __int128 v16 = &stru_1000616C0;
      }

      else
      {
        __int128 v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 URLByDeletingLastPathComponent]);
        uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 path]);

        id v15 = (void *)v20;
      }

      id v21 = [v15 hash];
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v21));
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume __hashes](self, "__hashes"));
      unsigned __int8 v24 = [v23 containsObject:v22];

      if ((v24 & 1) == 0)
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume __hashes](self, "__hashes"));
        [v25 addObject:v22];

        __int128 v26 = (FILE *)[v12 sharedDirectoriesMapFile];
        __int128 v27 = (const char *)[v15 UTF8String];
        v28 = "";
        if (v8) {
          v28 = "/";
        }
        if (fprintf(v26, "%lu\t%s%s\n", v21, v27, v28) == -1)
        {
          __error();
          if ((byte_100066780 & 1) == 0)
          {
            byte_100066780 = 1;
            id v29 = shared_filesystem_metadata_snapshot_service_log_handle();
            v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
              sub_10002B480();
            }
          }
        }
      }

      id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%lu>%@",  v21,  v16));
    }

    else
    {
      id v18 = 0LL;
    }
  }

  else
  {
    __int128 v17 = "";
    if (v8 && v4) {
      __int128 v17 = "/";
    }
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s%s", a3, v17));
  }

  return v18;
}

- (BOOL)listContentsWithEntryCount:(unint64_t *)a3 andError:(id *)a4
{
  BOOL v4 = a4;
  if (a4) {
    *a4 = 0LL;
  }
  id v6 = self;
  if (!-[DSVolume shouldListContents](v6, "shouldListContents"))
  {
    id v18 = shared_filesystem_metadata_snapshot_service_log_handle();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      buf.st_dev = 138412290;
      *(void *)&buf.int st_mode = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Skipping listing files for volume %@",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_14;
  }

  v211 = a3;
  unsigned int v220 = -[DSVolume hasPurgeableFilesCapability](v6, "hasPurgeableFilesCapability");
  size_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume _volumeManager](v6, "_volumeManager"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _snapshotRequest]);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 snapshotFileManager]);

  unint64_t v10 = (FILE *)-[os_log_s sharedLogFile](v9, "sharedLogFile");
  id v11 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    buf.st_dev = 138412290;
    *(void *)&buf.int st_mode = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Listing files for volume %@",  (uint8_t *)&buf,  0xCu);
  }

  if (qword_100066768 != -1) {
    dispatch_once(&qword_100066768, &stru_100060970);
  }
  double v13 = *(double *)&qword_100066760;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume safeFilenameForListing](v6, "safeFilenameForListing"));
  id v15 = (FILE *)-[os_log_s createFileForWritingWithName:error:](v9, "createFileForWritingWithName:error:", v14, v4);

  if (!v15) {
    goto LABEL_122;
  }
  if (v6->_supportsAttributionTags)
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume safeFilenameForAttributionTagsListing](v6, "safeFilenameForAttributionTagsListing"));
    __int128 v17 = (FILE *)-[os_log_s createFileForWritingWithName:error:](v9, "createFileForWritingWithName:error:", v16, v4);

    v215 = v17;
    if (!v17)
    {
LABEL_122:
      LOBYTE(v19) = 0;
      goto LABEL_123;
    }
  }

  else
  {
    id v20 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_claimAutoreleasedReturnValue(-[DSVolume mountPoint](v6, "mountPoint"));
      id v23 = [v22 UTF8String];
      buf.st_dev = 136315138;
      *(void *)&buf.int st_mode = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Attribution tags is not supported/enabled on volume %s",  (uint8_t *)&buf,  0xCu);
    }

    v215 = 0LL;
  }

  if (v6->_shouldCollectDirStatsData)
  {
    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume safeFilenameForDirStatsDataListing](v6, "safeFilenameForDirStatsDataListing"));
    __int128 v25 = (FILE *)-[os_log_s createFileForWritingWithName:error:](v9, "createFileForWritingWithName:error:", v24, v4);

    v214 = v25;
    if (!v25) {
      goto LABEL_122;
    }
  }

  else
  {
    v214 = 0LL;
  }

  id v26 = objc_claimAutoreleasedReturnValue(-[DSVolume mountPoint](v6, "mountPoint"));
  v237[0] = (char *)[v26 fileSystemRepresentation];
  v237[1] = 0LL;

  v222 = fts_open(v237, 80, 0LL);
  if (!v222)
  {
    uint64_t v72 = *__error();
    id v73 = objc_claimAutoreleasedReturnValue(-[DSVolume mountPoint](v6, "mountPoint"));
    v74 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Error opening volume at %s: %d (%s)",  [v73 fileSystemRepresentation],  v72,  strerror(v72));
    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);

    id v19 = v75;
    if (fprintf(v10, "%s\n", (const char *)-[FILE UTF8String](v19, "UTF8String")) == -1)
    {
      __error();
      if ((byte_100066781 & 1) == 0)
      {
        byte_100066781 = 1;
        id v76 = shared_filesystem_metadata_snapshot_service_log_handle();
        v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    v78 = v9;
    id v79 = shared_filesystem_metadata_snapshot_service_log_handle();
    v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      sub_10002C720(v19, v80);
    }

    if (v4)
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v72,  0LL));
      v235[0] = NSUnderlyingErrorKey;
      v235[1] = NSLocalizedDescriptionKey;
      v236[0] = v81;
      v236[1] = v19;
      v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v236,  v235,  2LL));
      *BOOL v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65544LL,  v82));
    }

    LOBYTE(v19) = 0;
    int v9 = v78;
    goto LABEL_123;
  }

  if (fprintf(v15, "%s\t%s\n", "Version:", "1008") == -1)
  {
    __error();
    if ((byte_100066782 & 1) == 0)
    {
      byte_100066782 = 1;
      id v27 = shared_filesystem_metadata_snapshot_service_log_handle();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  unsigned int v29 = -[os_log_s shouldHashVolumeListings](v9, "shouldHashVolumeListings");
  v30 = "NO";
  if (v29) {
    v30 = "YES";
  }
  if (fprintf(v15, "%s\t%s\n", "Hashed:", v30) == -1)
  {
    __error();
    if ((byte_100066783 & 1) == 0)
    {
      byte_100066783 = 1;
      id v31 = shared_filesystem_metadata_snapshot_service_log_handle();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  if (fprintf(v15, "%s\t%lld\n", "Total:", -[DSVolume capacityBytes](v6, "capacityBytes")) == -1)
  {
    __error();
    if ((byte_100066784 & 1) == 0)
    {
      byte_100066784 = 1;
      id v33 = shared_filesystem_metadata_snapshot_service_log_handle();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  if (fprintf(v15, "%s\t%lld\n", "Used:", -[DSVolume usedBytes](v6, "usedBytes")) == -1)
  {
    __error();
    if ((byte_100066785 & 1) == 0)
    {
      byte_100066785 = 1;
      id v35 = shared_filesystem_metadata_snapshot_service_log_handle();
      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  if (fprintf(v15, "%s\t%lld\n", "Free:", -[DSVolume freeBytes](v6, "freeBytes")) == -1)
  {
    __error();
    if ((byte_100066786 & 1) == 0)
    {
      byte_100066786 = 1;
      id v37 = shared_filesystem_metadata_snapshot_service_log_handle();
      int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  if (fprintf( v15,  "------------------------------------------------------------------------------------------------\n") == -1)
  {
    __error();
    if ((byte_100066787 & 1) == 0)
    {
      byte_100066787 = 1;
      id v39 = shared_filesystem_metadata_snapshot_service_log_handle();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  if (fprintf( v15,  "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",  "Size-On-Disk",  "File-Size",  "Compression",  "FS-Purgeable-Flags",  "mtime",  "Mode",  "UID",  "GID",  "Path") == -1)
  {
    __error();
    if ((byte_100066788 & 1) == 0)
    {
      byte_100066788 = 1;
      id v41 = shared_filesystem_metadata_snapshot_service_log_handle();
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  if (fprintf( v15,  "------------------------------------------------------------------------------------------------\n") == -1)
  {
    __error();
    if ((byte_100066789 & 1) == 0)
    {
      byte_100066789 = 1;
      id v43 = shared_filesystem_metadata_snapshot_service_log_handle();
      __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  if (fprintf(v15, "<BEGIN>\n") == -1)
  {
    __error();
    if ((byte_10006678A & 1) == 0)
    {
      byte_10006678A = 1;
      id v45 = shared_filesystem_metadata_snapshot_service_log_handle();
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  if (v6->_supportsAttributionTags)
  {
    if (fprintf( v215,  "------------------------------------------------------------------------------------------------\n") == -1)
    {
      __error();
      if ((byte_10006678B & 1) == 0)
      {
        byte_10006678B = 1;
        id v47 = shared_filesystem_metadata_snapshot_service_log_handle();
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    if (fprintf(v215, "%s\t%s\t%s\n", "Tag-Owner", "Tag-Hash", "Path") == -1)
    {
      __error();
      if ((byte_10006678C & 1) == 0)
      {
        byte_10006678C = 1;
        id v49 = shared_filesystem_metadata_snapshot_service_log_handle();
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    if (fprintf( v215,  "------------------------------------------------------------------------------------------------\n") == -1)
    {
      __error();
      if ((byte_10006678D & 1) == 0)
      {
        byte_10006678D = 1;
        id v51 = shared_filesystem_metadata_snapshot_service_log_handle();
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    if (fprintf(v215, "<BEGIN>\n") == -1)
    {
      __error();
      if ((byte_10006678E & 1) == 0)
      {
        byte_10006678E = 1;
        id v53 = shared_filesystem_metadata_snapshot_service_log_handle();
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }
  }

  if (v6->_shouldCollectDirStatsData)
  {
    if (fprintf( v214,  "------------------------------------------------------------------------------------------------\n") == -1)
    {
      __error();
      if ((byte_10006678F & 1) == 0)
      {
        byte_10006678F = 1;
        id v55 = shared_filesystem_metadata_snapshot_service_log_handle();
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    if (fprintf(v214, "%s\t%s\n", "Path", "SAFDirStats") == -1)
    {
      __error();
      if ((byte_100066790 & 1) == 0)
      {
        byte_100066790 = 1;
        id v57 = shared_filesystem_metadata_snapshot_service_log_handle();
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    if (fprintf( v214,  "------------------------------------------------------------------------------------------------\n") == -1)
    {
      __error();
      if ((byte_100066791 & 1) == 0)
      {
        byte_100066791 = 1;
        id v59 = shared_filesystem_metadata_snapshot_service_log_handle();
        v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    if (fprintf(v214, "<BEGIN>\n") == -1)
    {
      __error();
      if ((byte_100066792 & 1) == 0)
      {
        byte_100066792 = 1;
        id v61 = shared_filesystem_metadata_snapshot_service_log_handle();
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }
  }

  if (!fstatat(-2, v237[0], &buf, 544))
  {
    v209 = v9;
    v83 = fts_read(v222);
    v218 = v15;
    if (v83)
    {
      v84 = v83;
      unint64_t v213 = 0LL;
      uint64_t v221 = 0LL;
      uint64_t v210 = 0LL;
      double v85 = 1000.0 / v13;
      v212 = v4;
      while (1)
      {
        v86 = objc_autoreleasePoolPush();
        unsigned int fts_info = v84->fts_info;
        if (fts_info <= 0xD)
        {
          if (((1 << fts_info) & 0x490) != 0)
          {
            v89 = v86;
            int v90 = *__error();
            fts_path = v84->fts_path;
            v92 = strerror(v90);
            if (fprintf(v10, "Error reading file at %s: %d (%s)\n", fts_path, v90, v92) == -1)
            {
              v93 = __error();
              if ((byte_100066794 & 1) == 0)
              {
                int v94 = *v93;
                byte_100066794 = 1;
                id v95 = shared_filesystem_metadata_snapshot_service_log_handle();
                v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
                if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v230 = 67109120;
                  LODWORD(v231) = v94;
                  _os_log_fault_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v230,  8u);
                }
              }
            }

            id v97 = shared_filesystem_metadata_snapshot_service_log_handle();
            v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
            {
              v159 = v84->fts_path;
              v160 = strerror(v90);
              *(_DWORD *)v230 = 136315650;
              unint64_t v231 = (unint64_t)v159;
              __int16 v232 = 1024;
              *(_DWORD *)v233 = v90;
              *(_WORD *)&v233[4] = 2080;
              *(void *)&v233[6] = v160;
              _os_log_error_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_ERROR,  "Error reading file at %s: %d (%s)",  v230,  0x1Cu);
            }

            v86 = v89;
          }

          else
          {
            if (((1 << fts_info) & 0x3100) != 0)
            {
              context = v86;
              uint64_t v88 = 0LL;
              goto LABEL_155;
            }

            if (fts_info == 1)
            {
              context = v86;
              v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v84->fts_path));
              if (v6->_supportsAttributionTags
                && !+[DSVolume _isDirectoryPartOfSAFHierarchy:]( &OBJC_CLASS___DSVolume,  "_isDirectoryPartOfSAFHierarchy:",  v99))
              {
                v227[0] = _NSConcreteStackBlock;
                v227[1] = 3221225472LL;
                v227[2] = sub_1000105C0;
                v227[3] = &unk_1000609D0;
                v227[4] = v6;
                v227[5] = v10;
                v227[6] = v215;
                +[DSVolume _getAttributionTagPathsInDirectory:reply:]( &OBJC_CLASS___DSVolume,  "_getAttributionTagPathsInDirectory:reply:",  v99,  v227);
              }

              if (v6->_shouldCollectDirStatsData)
              {
                v226[0] = _NSConcreteStackBlock;
                v226[1] = 3221225472LL;
                v226[2] = sub_100010840;
                v226[3] = &unk_1000609F8;
                v226[4] = v6;
                v226[5] = v84;
                v226[6] = v10;
                v226[7] = v214;
                +[DSVolume _getDirStatsType:reply:](&OBJC_CLASS___DSVolume, "_getDirStatsType:reply:", v99, v226);
              }

              uint64_t v88 = 1LL;
LABEL_155:
              v100 = v84->fts_path;
              v101 = &off_1000609B8;
              v102 = "/System/Library/Caches/com.apple.factorydata";
              while (strcmp(v102, v100))
              {
                v103 = *v101++;
                v102 = v103;
                if (!v103) {
                  goto LABEL_167;
                }
              }

              if (fprintf(v10, "Skipping descendents of blocklisted directory at %s\n", v100) == -1)
              {
                v104 = __error();
                if ((byte_10006679A & 1) == 0)
                {
                  int v105 = *v104;
                  byte_10006679A = 1;
                  id v106 = shared_filesystem_metadata_snapshot_service_log_handle();
                  v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
                  if (os_log_type_enabled(v107, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v230 = 67109120;
                    LODWORD(v231) = v105;
                    _os_log_fault_impl( (void *)&_mh_execute_header,  v107,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v230,  8u);
                  }
                }
              }

              id v108 = shared_filesystem_metadata_snapshot_service_log_handle();
              v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
              if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
              {
                v110 = v84->fts_path;
                *(_DWORD *)v230 = 136315138;
                unint64_t v231 = (unint64_t)v110;
                _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_DEFAULT,  "Skipping descendents of blocklisted directory at %s",  v230,  0xCu);
              }

              fts_set(v222, v84, 4);
LABEL_167:
              fts_statp = v84->fts_statp;
              blkcnt_t st_blocks = fts_statp->st_blocks;
              off_t st_size = fts_statp->st_size;
              if ((v88 & 1) != 0) {
                int v216 = 0;
              }
              else {
                int v216 = (LOBYTE(fts_statp->st_flags) >> 5) & 1;
              }
              uint64_t v225 = 0LL;
              if (v220 && v84->fts_info == 8 && fsctl(v84->fts_path, 0x40084A47uLL, &v225, 0))
              {
                int v113 = *__error();
                v114 = v84->fts_path;
                v115 = strerror(v113);
                if (fprintf(v10, "Error getting purgeable flags for file at %s: %d (%s)\n", v114, v113, v115) == -1)
                {
                  v116 = __error();
                  if ((byte_10006679B & 1) == 0)
                  {
                    int v117 = *v116;
                    byte_10006679B = 1;
                    id v118 = shared_filesystem_metadata_snapshot_service_log_handle();
                    v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)v230 = 67109120;
                      LODWORD(v231) = v117;
                      _os_log_fault_impl( (void *)&_mh_execute_header,  v119,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v230,  8u);
                    }
                  }
                }

                id v120 = shared_filesystem_metadata_snapshot_service_log_handle();
                v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
                if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
                {
                  v162 = v84->fts_path;
                  v163 = strerror(v113);
                  *(_DWORD *)v230 = 136315650;
                  unint64_t v231 = (unint64_t)v162;
                  __int16 v232 = 1024;
                  *(_DWORD *)v233 = v113;
                  *(_WORD *)&v233[4] = 2080;
                  *(void *)&v233[6] = v163;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_ERROR,  "Error getting purgeable flags for file at %s: %d (%s)",  v230,  0x1Cu);
                }

                uint64_t v225 = -1LL;
              }

              v122 = v10;
              blkcnt_t v123 = st_blocks << 9;
              v124 = v84->fts_statp;
              __darwin_time_t tv_sec = v124->st_mtimespec.tv_sec;
              int st_mode = v124->st_mode;
              uid_t st_uid = v124->st_uid;
              gid_t st_gid = v124->st_gid;
              v129 = (void *)objc_claimAutoreleasedReturnValue( -[DSVolume _pathRepresentationForListing:isDirectory:]( v6,  "_pathRepresentationForListing:isDirectory:",  v84->fts_path,  v88));
              v130 = v129;
              if (v129)
              {
                uint64_t v131 = v225;
                v208 = (const char *)[v129 UTF8String];
                uint64_t v207 = v131;
                if (v216) {
                  uint64_t v132 = 99LL;
                }
                else {
                  uint64_t v132 = 45LL;
                }
                BOOL v4 = v212;
                uint64_t v133 = v221;
                if (fprintf( v218,  "%llu\t%llu\t%c\t%llu\t%ld\t%u\t%u\t%u\t%s\n",  v123,  st_size,  v132,  v207,  tv_sec,  st_mode,  st_uid,  st_gid,  v208) == -1)
                {
                  v134 = __error();
                  if ((byte_10006679D & 1) == 0)
                  {
                    int v135 = *v134;
                    byte_10006679D = 1;
                    id v136 = shared_filesystem_metadata_snapshot_service_log_handle();
                    v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
                    if (os_log_type_enabled(v137, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)v230 = 67109120;
                      LODWORD(v231) = v135;
                      _os_log_fault_impl( (void *)&_mh_execute_header,  v137,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v230,  8u);
                    }
                  }
                }

                ++v213;
                unint64_t v10 = v122;
                id v15 = v218;
              }

              else
              {
                unint64_t v10 = v122;
                int v138 = fprintf(v122, "Error getting hashed path for %s (isDir: %d)\n", v84->fts_path, v88);
                id v15 = v218;
                if (v138 == -1)
                {
                  v139 = __error();
                  if ((byte_10006679C & 1) == 0)
                  {
                    int v140 = *v139;
                    byte_10006679C = 1;
                    id v141 = shared_filesystem_metadata_snapshot_service_log_handle();
                    v142 = (os_log_s *)objc_claimAutoreleasedReturnValue(v141);
                    if (os_log_type_enabled(v142, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)v230 = 67109120;
                      LODWORD(v231) = v140;
                      _os_log_fault_impl( (void *)&_mh_execute_header,  v142,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  v230,  8u);
                    }
                  }
                }

                id v143 = shared_filesystem_metadata_snapshot_service_log_handle();
                v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
                if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
                {
                  v161 = v84->fts_path;
                  *(_DWORD *)v230 = 136315394;
                  unint64_t v231 = (unint64_t)v161;
                  __int16 v232 = 1024;
                  *(_DWORD *)v233 = v88;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v144,  OS_LOG_TYPE_ERROR,  "Error getting hashed path for %s (isDir: %d)",  v230,  0x12u);
                }

                BOOL v4 = v212;
                uint64_t v133 = v221;
              }

              uint64_t v145 = v123 + v133;
              v146 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume progress](v6, "progress"));
              [v146 fractionCompleted];
              double v148 = v147;

              uint64_t v221 = v145;
              if (v148 < 1.0 && v145 >= 10485760)
              {
                uint64_t v149 = mach_absolute_time();
                if (v85 <= (double)(v149 - v210))
                {
                  uint64_t v150 = v149;
                  v151 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume progress](v6, "progress"));
                  v152 = (char *)[v151 completedUnitCount] + v221;

                  v153 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume progress](v6, "progress"));
                  v154 = (char *)[v153 totalUnitCount];

                  else {
                    v155 = v152;
                  }
                  v156 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume progress](v6, "progress"));
                  [v156 setCompletedUnitCount:v155];

                  id v157 = shared_filesystem_metadata_snapshot_service_log_handle();
                  v158 = (os_log_s *)objc_claimAutoreleasedReturnValue(v157);
                  if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG)) {
                    sub_10002C80C(v228, v6, &v229, v158);
                  }

                  uint64_t v221 = 0LL;
                  uint64_t v210 = v150;
                  BOOL v4 = v212;
                }
              }

              v86 = context;
            }
          }
        }

        objc_autoreleasePoolPop(v86);
        v84 = fts_read(v222);
        if (!v84) {
          goto LABEL_212;
        }
      }
    }

    unint64_t v213 = 0LL;
LABEL_212:
    fts_close(v222);
    int v9 = v209;
    if (fprintf(v15, "<END>\n") == -1)
    {
      __error();
      if ((byte_10006679E & 1) == 0)
      {
        byte_10006679E = 1;
        id v164 = shared_filesystem_metadata_snapshot_service_log_handle();
        v165 = (os_log_s *)objc_claimAutoreleasedReturnValue(v164);
        if (os_log_type_enabled(v165, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    if (v6->_supportsAttributionTags && fprintf(v215, "<END>\n") == -1)
    {
      __error();
      if ((byte_10006679F & 1) == 0)
      {
        byte_10006679F = 1;
        id v166 = shared_filesystem_metadata_snapshot_service_log_handle();
        v167 = (os_log_s *)objc_claimAutoreleasedReturnValue(v166);
        if (os_log_type_enabled(v167, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    if (v6->_shouldCollectDirStatsData && fprintf(v214, "<END>\n") == -1)
    {
      __error();
      if ((byte_1000667A0 & 1) == 0)
      {
        byte_1000667A0 = 1;
        id v168 = shared_filesystem_metadata_snapshot_service_log_handle();
        v169 = (os_log_s *)objc_claimAutoreleasedReturnValue(v168);
        if (os_log_type_enabled(v169, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    if (v6->_supportsSharedExtents)
    {
      v170 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume safeFilenameForSharedExtentsListing](v6, "safeFilenameForSharedExtentsListing"));
      id v19 = (FILE *)-[os_log_s createFileForWritingWithName:error:]( v209,  "createFileForWritingWithName:error:",  v170,  v4);

      if (!v19) {
        goto LABEL_123;
      }
      if (fprintf( v19,  "------------------------------------------------------------------------------------------------\n") == -1)
      {
        __error();
        if ((byte_1000667A1 & 1) == 0)
        {
          byte_1000667A1 = 1;
          id v171 = shared_filesystem_metadata_snapshot_service_log_handle();
          v172 = (os_log_s *)objc_claimAutoreleasedReturnValue(v171);
          if (os_log_type_enabled(v172, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      if (fprintf(v19, "%s\t%s\t%s\t%s\n", "Physical-Block-Number", "Owning-Obj-Id", "Size", "Reference-Count") == -1)
      {
        __error();
        if ((byte_1000667A2 & 1) == 0)
        {
          byte_1000667A2 = 1;
          id v173 = shared_filesystem_metadata_snapshot_service_log_handle();
          v174 = (os_log_s *)objc_claimAutoreleasedReturnValue(v173);
          if (os_log_type_enabled(v174, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      if (fprintf( v19,  "------------------------------------------------------------------------------------------------\n") == -1)
      {
        __error();
        if ((byte_1000667A3 & 1) == 0)
        {
          byte_1000667A3 = 1;
          id v175 = shared_filesystem_metadata_snapshot_service_log_handle();
          v176 = (os_log_s *)objc_claimAutoreleasedReturnValue(v175);
          if (os_log_type_enabled(v176, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      if (fprintf(v19, "<BEGIN>\n") == -1)
      {
        __error();
        if ((byte_1000667A4 & 1) == 0)
        {
          byte_1000667A4 = 1;
          id v177 = shared_filesystem_metadata_snapshot_service_log_handle();
          v178 = (os_log_s *)objc_claimAutoreleasedReturnValue(v177);
          if (os_log_type_enabled(v178, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      v179 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume mountPoint](v6, "mountPoint"));
      v224[0] = _NSConcreteStackBlock;
      v224[1] = 3221225472LL;
      v224[2] = sub_1000109C4;
      v224[3] = &unk_100060A18;
      v224[4] = v19;
      +[DSVolume _getSharedExtensInfo:reply:](&OBJC_CLASS___DSVolume, "_getSharedExtensInfo:reply:", v179, v224);

      if (fprintf(v19, "<END>\n") == -1)
      {
        __error();
        if ((byte_1000667A6 & 1) == 0)
        {
          byte_1000667A6 = 1;
          id v180 = shared_filesystem_metadata_snapshot_service_log_handle();
          v181 = (os_log_s *)objc_claimAutoreleasedReturnValue(v180);
          if (os_log_type_enabled(v181, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }
    }

    if (v6->_supportsPurgeableRecords)
    {
      v182 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume safeFilenameForPurgeableRecordsListing](v6, "safeFilenameForPurgeableRecordsListing"));
      id v19 = (FILE *)-[os_log_s createFileForWritingWithName:error:]( v209,  "createFileForWritingWithName:error:",  v182,  v4);

      if (!v19) {
        goto LABEL_123;
      }
      if (fprintf( v19,  "------------------------------------------------------------------------------------------------\n") == -1)
      {
        __error();
        if ((byte_1000667A7 & 1) == 0)
        {
          byte_1000667A7 = 1;
          id v183 = shared_filesystem_metadata_snapshot_service_log_handle();
          v184 = (os_log_s *)objc_claimAutoreleasedReturnValue(v183);
          if (os_log_type_enabled(v184, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      if (fprintf(v19, "%s\t%s\t%s\t%s\n", "Inode-Number", "Purgeable-Flags", "Last-Access-Time", "Purgeable-Size") == -1)
      {
        __error();
        if ((byte_1000667A8 & 1) == 0)
        {
          byte_1000667A8 = 1;
          id v185 = shared_filesystem_metadata_snapshot_service_log_handle();
          v186 = (os_log_s *)objc_claimAutoreleasedReturnValue(v185);
          if (os_log_type_enabled(v186, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      if (fprintf( v19,  "------------------------------------------------------------------------------------------------\n") == -1)
      {
        __error();
        if ((byte_1000667A9 & 1) == 0)
        {
          byte_1000667A9 = 1;
          id v187 = shared_filesystem_metadata_snapshot_service_log_handle();
          v188 = (os_log_s *)objc_claimAutoreleasedReturnValue(v187);
          if (os_log_type_enabled(v188, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      if (fprintf(v19, "<BEGIN>\n") == -1)
      {
        __error();
        if ((byte_1000667AA & 1) == 0)
        {
          byte_1000667AA = 1;
          id v189 = shared_filesystem_metadata_snapshot_service_log_handle();
          v190 = (os_log_s *)objc_claimAutoreleasedReturnValue(v189);
          if (os_log_type_enabled(v190, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      v191 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume mountPoint](v6, "mountPoint"));
      v223[0] = _NSConcreteStackBlock;
      v223[1] = 3221225472LL;
      v223[2] = sub_100010A4C;
      v223[3] = &unk_100060A38;
      v223[4] = v19;
      +[DSVolume _getPurgeableRecordsInfo:reply:](&OBJC_CLASS___DSVolume, "_getPurgeableRecordsInfo:reply:", v191, v223);

      id v15 = v218;
      if (fprintf(v19, "<END>\n") == -1)
      {
        __error();
        if ((byte_1000667AC & 1) == 0)
        {
          byte_1000667AC = 1;
          id v192 = shared_filesystem_metadata_snapshot_service_log_handle();
          v193 = (os_log_s *)objc_claimAutoreleasedReturnValue(v192);
          if (os_log_type_enabled(v193, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }
    }

    fflush(v15);
    v194 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume progress](v6, "progress"));
    id v195 = [v194 totalUnitCount];
    v196 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolume progress](v6, "progress"));
    [v196 setCompletedUnitCount:v195];

    id v197 = shared_filesystem_metadata_snapshot_service_log_handle();
    v198 = (os_log_s *)objc_claimAutoreleasedReturnValue(v197);
    if (os_log_type_enabled(v198, OS_LOG_TYPE_DEBUG)) {
      sub_10002C794(v6);
    }

    id v199 = objc_claimAutoreleasedReturnValue(-[DSVolume description](v6, "description"));
    int v200 = fprintf( v10,  "Done listing contents (%llu entries) for %s\n",  v213,  (const char *)[v199 UTF8String]);

    if (v200 == -1)
    {
      __error();
      if ((byte_1000667AD & 1) == 0)
      {
        byte_1000667AD = 1;
        id v201 = shared_filesystem_metadata_snapshot_service_log_handle();
        v202 = (os_log_s *)objc_claimAutoreleasedReturnValue(v201);
        if (os_log_type_enabled(v202, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v203 = shared_filesystem_metadata_snapshot_service_log_handle();
    v204 = (os_log_s *)objc_claimAutoreleasedReturnValue(v203);
    if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
    {
      id v205 = objc_claimAutoreleasedReturnValue(-[DSVolume description](v6, "description"));
      id v206 = [v205 UTF8String];
      *(_DWORD *)v230 = 134218242;
      unint64_t v231 = v213;
      __int16 v232 = 2080;
      *(void *)v233 = v206;
      _os_log_impl( (void *)&_mh_execute_header,  v204,  OS_LOG_TYPE_DEFAULT,  "Done listing contents (%llu entries) for %s",  v230,  0x16u);
    }

    if (v211) {
      unint64_t *v211 = v213;
    }
LABEL_14:
    LOBYTE(v19) = 1;
    goto LABEL_123;
  }

  v63 = __error();
  id v19 = (FILE *)*v63;
  v64 = v237[0];
  v65 = strerror(*v63);
  if (fprintf(v10, "fstatat() failed for [parent] file at %s/..: %d (%s)\n", v64, (_DWORD)v19, v65) == -1)
  {
    __error();
    if ((byte_100066793 & 1) == 0)
    {
      byte_100066793 = 1;
      id v66 = shared_filesystem_metadata_snapshot_service_log_handle();
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v68 = shared_filesystem_metadata_snapshot_service_log_handle();
  v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
    sub_10002C880((uint64_t *)v237, (int)v19, v69);
  }

  if (!v4) {
    goto LABEL_122;
  }
  id v70 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v19,  0LL));
  LOBYTE(v19) = 0;
  *BOOL v4 = v70;
LABEL_123:

  return (char)v19;
}

- (NSString)debugDescription
{
  unsigned int v3 = (objc_class *)objc_opt_class(self);
  BOOL v4 = NSStringFromClass(v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)v5;
  if (self->_isRootVolume) {
    size_t v7 = @" [RootVolume]";
  }
  else {
    size_t v7 = &stru_1000616C0;
  }
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> %@ (%@)%@",  v5,  self,  self->_mountPoint,  self->_mountedFrom,  v7));

  return (NSString *)v8;
}

- (NSString)description
{
  unsigned int v3 = (objc_class *)objc_opt_class(self);
  BOOL v4 = NSStringFromClass(v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)v5;
  if (self->_isRootVolume) {
    size_t v7 = @" [RootVolume]";
  }
  else {
    size_t v7 = &stru_1000616C0;
  }
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@> %@ (%@)%@",  v5,  self->_mountPoint,  self->_mountedFrom,  v7));

  return (NSString *)v8;
}

- (id)_initWithStatFS:(statfs *)a3 usedBytesProvider:(id)a4 volumeManager:(id)a5
{
  BOOL v8 = (uint64_t (**)(id, statfs *))a4;
  id v9 = a5;
  if (v9)
  {
    v44.receiver = self;
    v44.super_class = (Class)&OBJC_CLASS___DSVolume;
    unint64_t v10 = -[DSVolume init](&v44, "init");
    if (v10)
    {
      id v11 = shared_filesystem_metadata_snapshot_service_log_handle();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 136446466;
        f_mntonname = a3->f_mntonname;
        __int16 v47 = 2082;
        f_mntfromname = a3->f_mntfromname;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Creating DSVolume for %{public}s (%{public}s)",  buf,  0x16u);
      }

      objc_storeWeak((id *)&v10->__volumeManager, v9);
      id v13 = [(id)objc_opt_class(v10) _safeStringFromStatFSCString:a3->f_mntonname];
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
      mountPoint = v10->_mountPoint;
      v10->_mountPoint = (NSString *)v14;

      id v16 = [(id)objc_opt_class(v10) _safeStringFromStatFSCString:a3->f_mntfromname];
      uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
      mountedFrom = v10->_mountedFrom;
      v10->_mountedFrom = (NSString *)v17;

      id v19 = [(id)objc_opt_class(v10) _safeStringFromStatFSCString:a3->f_fstypename];
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
      filesystemTypeName = v10->__filesystemTypeName;
      v10->__filesystemTypeName = (NSString *)v20;

      uint64_t f_bsize = a3->f_bsize;
      v10->_capacityBytes = a3->f_blocks * f_bsize;
      v10->_freeBytes = a3->f_bavail * f_bsize;
      v10->_usedBytes = v8[2](v8, a3);
      v10->__flags = a3->f_flags;
      if ((a3->f_flags & 0x4000) != 0) {
        v10->_isRootVolume = 1;
      }
      id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      hashes = v10->___hashes;
      v10->___hashes = v23;

      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  v10->_usedBytes));
      progress = v10->_progress;
      v10->_progress = (NSProgress *)v25;

      id v27 = [(id)objc_opt_class(v10) _safeFilenameForListingVolume:v10 pathExtension:@"fslisting"];
      uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
      safeFilenameForListing = v10->_safeFilenameForListing;
      v10->_safeFilenameForListing = (NSString *)v28;

      id v30 = [(id)objc_opt_class(v10) _safeFilenameForListingVolume:v10 pathExtension:@"attrstaglisting"];
      uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
      safeFilenameForAttributionTagsListing = v10->_safeFilenameForAttributionTagsListing;
      v10->_safeFilenameForAttributionTagsListing = (NSString *)v31;

      id v33 = [(id)objc_opt_class(v10) _safeFilenameForListingVolume:v10 pathExtension:@"dirstatsdatalisting"];
      uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
      safeFilenameForDirStatsDataListing = v10->_safeFilenameForDirStatsDataListing;
      v10->_safeFilenameForDirStatsDataListing = (NSString *)v34;

      id v36 = [(id)objc_opt_class(v10) _safeFilenameForListingVolume:v10 pathExtension:@"sharedextentslisting"];
      uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
      safeFilenameForSharedExtentsListing = v10->_safeFilenameForSharedExtentsListing;
      v10->_safeFilenameForSharedExtentsListing = (NSString *)v37;

      id v39 = [(id)objc_opt_class(v10) _safeFilenameForListingVolume:v10 pathExtension:@"purgeablerecordslisting"];
      uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);
      safeFilenameForPurgeableRecordsListing = v10->_safeFilenameForPurgeableRecordsListing;
      v10->_safeFilenameForPurgeableRecordsListing = (NSString *)v40;

      v10->_hasPurgeableFilesCapability = objc_msgSend( (id)objc_opt_class(v10),  "__checkPurgeableFilesCapabilityForVolume:",  v10);
      v10->_supportsAttributionTags = objc_msgSend( (id)objc_opt_class(v10),  "__checkAttributionTagsCapabilityForVolume:",  v10);
      v10->_shouldCollectDirStatsData = objc_msgSend( (id)objc_opt_class(v10),  "__checkDirStatsDataCapabilityForVolume:",  v10);
      v10->_supportsSharedExtents = objc_msgSend( (id)objc_opt_class(v10),  "__checkDirStatsDataCapabilityForVolume:",  v10);
      v10->_supportsPurgeableRecords = objc_msgSend( (id)objc_opt_class(v10),  "__checkDirStatsDataCapabilityForVolume:",  v10);
    }

    self = v10;
    v42 = self;
  }

  else
  {
    v42 = 0LL;
  }

  return v42;
}

- (NSString)mountPoint
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)mountedFrom
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (BOOL)isRootVolume
{
  return self->_isRootVolume;
}

- (BOOL)hasPurgeableFilesCapability
{
  return self->_hasPurgeableFilesCapability;
}

- (BOOL)supportsAttributionTags
{
  return self->_supportsAttributionTags;
}

- (BOOL)shouldCollectDirStatsData
{
  return self->_shouldCollectDirStatsData;
}

- (BOOL)supportsSharedExtents
{
  return self->_supportsSharedExtents;
}

- (BOOL)supportsPurgeableRecords
{
  return self->_supportsPurgeableRecords;
}

- (unint64_t)capacityBytes
{
  return self->_capacityBytes;
}

- (unint64_t)freeBytes
{
  return self->_freeBytes;
}

- (unint64_t)usedBytes
{
  return self->_usedBytes;
}

- (NSString)safeFilenameForListing
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSString)safeFilenameForAttributionTagsListing
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSString)safeFilenameForDirStatsDataListing
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (NSString)safeFilenameForSharedExtentsListing
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (NSString)safeFilenameForPurgeableRecordsListing
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSMutableSet)__hashes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112LL, 1);
}

- (DSVolumeManager)_volumeManager
{
  return (DSVolumeManager *)objc_loadWeakRetained((id *)&self->__volumeManager);
}

- (NSString)_filesystemTypeName
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (unsigned)_flags
{
  return self->__flags;
}

- (void).cxx_destruct
{
}

@end