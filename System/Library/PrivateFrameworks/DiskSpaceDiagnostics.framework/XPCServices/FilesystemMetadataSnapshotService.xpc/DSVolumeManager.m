@interface DSVolumeManager
+ (id)_filterVolumes:(id)a3 usingAllowList:(id)a4;
- (BOOL)_discoverVolumesUsingStatFSProvider:(id)a3 usedBytesProvider:(id)a4 error:(id *)a5;
- (BOOL)discoverVolumesWithError:(id *)a3;
- (DSSnapshotRequest)_snapshotRequest;
- (NSArray)_allVolumes;
- (NSArray)volumesForSnapshotting;
- (NSDictionary)allVolumesInfoDict;
- (id)__stockStatFSProvider;
- (id)__stockUsedBytesProvider;
- (id)initForSnapshotRequest:(id)a3;
@end

@implementation DSVolumeManager

+ (id)_filterVolumes:(id)a3 usingAllowList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v27;
    *(void *)&__int128 v10 = 138543618LL;
    __int128 v25 = v10;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if (!objc_msgSend(v14, "shouldListContents", v25, (void)v26)
          || v6
          && [v6 count]
          && (v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mountPoint]),
              unsigned __int8 v16 = [v6 containsObject:v15],
              v15,
              (v16 & 1) == 0))
        {
          id v19 = shared_filesystem_metadata_snapshot_service_log_handle();
          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v21 = [v14 _flags];
            *(_DWORD *)buf = v25;
            v31 = v14;
            __int16 v32 = 1024;
            unsigned int v33 = v21;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Skipping volume %{public}@ (flags: %u)",  buf,  0x12u);
          }
        }

        else
        {
          id v17 = shared_filesystem_metadata_snapshot_service_log_handle();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v22 = [v14 _flags];
            *(_DWORD *)buf = v25;
            v31 = v14;
            __int16 v32 = 1024;
            unsigned int v33 = v22;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Including volume %{public}@ (flags: %u)",  buf,  0x12u);
          }

          [v7 addObject:v14];
        }
      }

      id v11 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v11);
  }

  id v23 = [v7 copy];
  return v23;
}

- (id)__stockStatFSProvider
{
  if (qword_1000667B8 != -1) {
    dispatch_once(&qword_1000667B8, &stru_100060A58);
  }
  return objc_retainBlock((id)qword_1000667B0);
}

- (id)__stockUsedBytesProvider
{
  if (qword_1000667C8 != -1) {
    dispatch_once(&qword_1000667C8, &stru_100060AB8);
  }
  return objc_retainBlock((id)qword_1000667C0);
}

- (NSDictionary)allVolumesInfoDict
{
  v2 = self;
  allVolumesInfoDict = self->_allVolumesInfoDict;
  if (!allVolumesInfoDict)
  {
    id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[DSVolumeManager _allVolumes](v2, "_allVolumes"));
    id v24 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v24)
    {
      uint64_t v22 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(obj);
          }
          id v5 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolumeManager volumesForSnapshotting](v2, "volumesForSnapshotting"));
          id v7 = [v6 containsObject:v5];

          v39[0] = @"PurgeableRecordsFilename";
          __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v5 safeFilenameForPurgeableRecordsListing]);
          v40[0] = v32;
          v39[1] = @"SharedExtentsFilename";
          v31 = (void *)objc_claimAutoreleasedReturnValue([v5 safeFilenameForSharedExtentsListing]);
          v40[1] = v31;
          v39[2] = @"DirStatsDataFilename";
          v30 = (void *)objc_claimAutoreleasedReturnValue([v5 safeFilenameForDirStatsDataListing]);
          v40[2] = v30;
          v39[3] = @"AttributionTagFilename";
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v5 safeFilenameForAttributionTagsListing]);
          v40[3] = v29;
          v39[4] = @"FSListingFilename";
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v5 safeFilenameForListing]);
          v40[4] = v28;
          v39[5] = @"MountedFrom";
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v5 mountedFrom]);
          v40[5] = v27;
          v39[6] = @"MountPoint";
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v5 mountPoint]);
          v40[6] = v26;
          v39[7] = @"FSTypeName";
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v5 _filesystemTypeName]);
          v40[7] = v25;
          v39[8] = @"IsRootVolume";
          id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isRootVolume]));
          v40[8] = v8;
          v39[9] = @"FSFlags";
          id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 _flags]));
          v40[9] = v9;
          v39[10] = @"HasFSListing";
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
          v40[10] = v10;
          v39[11] = @"CapacityBytes";
          id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v5 capacityBytes]));
          v40[11] = v11;
          v39[12] = @"UsedBytes";
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v5 usedBytes]));
          v40[12] = v12;
          v39[13] = @"FreeBytes";
          v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v5 freeBytes]));
          v40[13] = v13;
          v14 = v2;
          v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  14LL));
          unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 mountPoint]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v15, v16);

          v2 = v14;
        }

        id v24 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }

      while (v24);
    }

    v37 = @"Volumes";
    id v17 = -[NSMutableDictionary copy](v23, "copy");
    id v38 = v17;
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    id v19 = v2->_allVolumesInfoDict;
    v2->_allVolumesInfoDict = (NSDictionary *)v18;

    allVolumesInfoDict = v2->_allVolumesInfoDict;
  }

  return allVolumesInfoDict;
}

- (BOOL)_discoverVolumesUsingStatFSProvider:(id)a3 usedBytesProvider:(id)a4 error:(id *)a5
{
  id v8 = (uint64_t (**)(id, uint8_t *, _DWORD *, id *))a3;
  id v9 = a4;
  id v10 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Discovering volumes", buf, 2u);
  }

  if (!v8)
  {
    id v31 = shared_filesystem_metadata_snapshot_service_log_handle();
    __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10002CB8C(v32, v33, v34);
    }

    NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
    v51 = @"StatFS provider cannot be nil";
    __int128 v35 = &v51;
    __int128 v36 = &v50;
    goto LABEL_23;
  }

  if (!v9)
  {
    id v37 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_10002CC00(v38, v39, v40);
    }

    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    v49 = @"Used bytes provider cannot be nil";
    __int128 v35 = &v49;
    __int128 v36 = &v48;
LABEL_23:
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v36,  1LL));
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65540LL,  v41));

    if (a5)
    {
      id v14 = v14;
      BOOL v15 = 0;
      *a5 = v14;
    }

    else
    {
      BOOL v15 = 0;
    }

    goto LABEL_32;
  }

  *(void *)buf = 0LL;
  unsigned int v44 = 0;
  uint64_t v12 = objc_autoreleasePoolPush();
  id v43 = 0LL;
  char v13 = v8[2](v8, buf, &v44, &v43);
  id v14 = v43;
  objc_autoreleasePoolPop(v12);
  if (v14) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v13;
  }
  id v16 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v46 = 67109120;
      unsigned int v47 = v44;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Found %d volumes", v46, 8u);
    }

    id v19 = objc_autoreleasePoolPush();
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue( +[DSVolume _volumeInfoFromStatFS:count:usedBytesProvider:volumeManager:]( &OBJC_CLASS___DSVolume,  "_volumeInfoFromStatFS:count:usedBytesProvider:volumeManager:",  *(void *)buf,  v44,  v9,  self));
    allVolumes = self->__allVolumes;
    self->__allVolumes = v20;

    if (*(void *)buf) {
      free(*(void **)buf);
    }
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolumeManager _snapshotRequest](self, "_snapshotRequest"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 options]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 objectForKeyedSubscript:@"FilesystemMetadatSnapshotOptionMountPointsAllowListArray"]);

    __int128 v25 = (void *)objc_opt_class(self);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolumeManager _allVolumes](self, "_allVolumes"));
    __int128 v27 = (NSArray *)objc_claimAutoreleasedReturnValue([v25 _filterVolumes:v26 usingAllowList:v24]);
    volumesForSnapshotting = self->_volumesForSnapshotting;
    self->_volumesForSnapshotting = v27;

    id v29 = shared_filesystem_metadata_snapshot_service_log_handle();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10002CC74(self);
    }

    objc_autoreleasePoolPop(v19);
    if (a5) {
      *a5 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002CA90(v14, v18);
    }

    if (a5) {
      *a5 = v14;
    }
    if (*(void *)buf) {
      free(*(void **)buf);
    }
  }

- (BOOL)discoverVolumesWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolumeManager __stockStatFSProvider](self, "__stockStatFSProvider"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DSVolumeManager __stockUsedBytesProvider](self, "__stockUsedBytesProvider"));
  LOBYTE(a3) = -[DSVolumeManager _discoverVolumesUsingStatFSProvider:usedBytesProvider:error:]( self,  "_discoverVolumesUsingStatFSProvider:usedBytesProvider:error:",  v5,  v6,  a3);

  return (char)a3;
}

- (id)initForSnapshotRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___DSVolumeManager;
    id v5 = -[DSVolumeManager init](&v9, "init");
    id v6 = v5;
    if (v5) {
      objc_storeWeak((id *)&v5->__snapshotRequest, v4);
    }
    self = v6;
    id v7 = self;
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (NSArray)volumesForSnapshotting
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (DSSnapshotRequest)_snapshotRequest
{
  return (DSSnapshotRequest *)objc_loadWeakRetained((id *)&self->__snapshotRequest);
}

- (NSArray)_allVolumes
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

  ;
}

@end