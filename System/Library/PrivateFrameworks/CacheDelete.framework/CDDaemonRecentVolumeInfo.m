@interface CDDaemonRecentVolumeInfo
+ (BOOL)supportsSecureCoding;
+ (id)CDRecentVolumeInfo:(id)a3;
- (BOOL)_validateWithSharedCacheDeleteForService:(id)a3;
- (BOOL)hasSnapshot;
- (BOOL)isStale;
- (BOOL)prune;
- (BOOL)prunePreserving:(id)a3;
- (id)bsdDisk;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createVolumeWithMountPoint:(id)a3;
- (id)createVolumeWithPath:(id)a3;
- (id)thresholds;
- (unint64_t)_reserveForVolume;
- (unint64_t)reserve;
@end

@implementation CDDaemonRecentVolumeInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createVolumeWithPath:(id)a3
{
  return +[CacheDeleteDaemonVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteDaemonVolume, "volumeWithPath:", a3);
}

- (id)createVolumeWithMountPoint:(id)a3
{
  return +[CacheDeleteDaemonVolume volumeWithMountpoint:]( &OBJC_CLASS___CacheDeleteDaemonVolume,  "volumeWithMountpoint:",  a3);
}

+ (id)CDRecentVolumeInfo:(id)a3
{
  id v3 = a3;
  v4 = -[CDDaemonRecentVolumeInfo initWithServices:volumeName:]( objc_alloc(&OBJC_CLASS___CDDaemonRecentVolumeInfo),  "initWithServices:volumeName:",  0LL,  v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___CDDaemonRecentVolumeInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo services](self, "services"));
  id v7 = [v6 copyWithZone:a3];
  -[CDDaemonRecentVolumeInfo setServices:](v5, "setServices:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo timestamp](self, "timestamp"));
  id v9 = [v8 copyWithZone:a3];
  -[CDDaemonRecentVolumeInfo setTimestamp:](v5, "setTimestamp:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo freespace](self, "freespace"));
  id v11 = [v10 copyWithZone:a3];
  -[CDDaemonRecentVolumeInfo setFreespace:](v5, "setFreespace:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo volume](self, "volume"));
  id v13 = [v12 copyWithZone:a3];
  -[CDDaemonRecentVolumeInfo setVolume:](v5, "setVolume:", v13);

  -[CDDaemonRecentVolumeInfo setVolumeState:]( v5,  "setVolumeState:",  -[CDDaemonRecentVolumeInfo volumeState](self, "volumeState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo thresholds](self, "thresholds"));
  id v15 = [v14 copyWithZone:a3];
  -[CDDaemonRecentVolumeInfo setThresholds:](v5, "setThresholds:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo bsdDisk](self, "bsdDisk"));
  id v17 = [v16 copyWithZone:a3];
  -[CDDaemonRecentVolumeInfo setBsdDisk:](v5, "setBsdDisk:", v17);

  -[CDDaemonRecentVolumeInfo setReserve:](v5, "setReserve:", -[CDDaemonRecentVolumeInfo reserve](self, "reserve"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo volume](self, "volume"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo createVolumeWithPath:](self, "createVolumeWithPath:", v18));
  -[CDDaemonRecentVolumeInfo setCdVolume:](v5, "setCdVolume:", v19);

  return v5;
}

- (BOOL)_validateWithSharedCacheDeleteForService:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDelete sharedCacheDelete](&OBJC_CLASS___CacheDelete, "sharedCacheDelete"));
  v5 = v4;
  BOOL v6 = !v4 || [v4 validateService:v3];

  return v6;
}

- (unint64_t)_reserveForVolume
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo cdVolume](self, "cdVolume"));
  id v3 = [v2 reserve];

  return (unint64_t)v3;
}

- (BOOL)prunePreserving:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v27 = self;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo services](self, "services"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDelete sharedCacheDelete](&OBJC_CLASS___CacheDelete, "sharedCacheDelete"));
  v25 = v4;
  [v8 minusSet:v4];
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v42 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    id v26 = v10;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        if (v9)
        {
          uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
          if (([v9 validateService:v15] & 1) == 0)
          {
            uint64_t v16 = CDGetLogHandle("daemon");
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo volume](v27, "volume"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo services](v27, "services"));
              v20 = v5;
              v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v15]);
              *(_DWORD *)buf = 67110146;
              int v33 = 78;
              __int16 v34 = 2080;
              v35 = "-[CDDaemonRecentVolumeInfo prunePreserving:]";
              __int16 v36 = 2112;
              v37 = v18;
              __int16 v38 = 2112;
              uint64_t v39 = v15;
              __int16 v40 = 2112;
              v41 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%d %s ***** pruning volume: %@, service: %@, value: %@",  buf,  0x30u);

              v5 = v20;
              id v10 = v26;
            }

            -[NSMutableSet addObject:](v5, "addObject:", v15);
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v28 objects:v42 count:16];
    }

    while (v12);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo services](v27, "services"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v5, "allObjects"));
  [v22 removeObjectsForKeys:v23];

  return 0;
}

- (BOOL)prune
{
  return -[CDDaemonRecentVolumeInfo prunePreserving:](self, "prunePreserving:", 0LL);
}

- (BOOL)isStale
{
  return 0;
}

- (id)bsdDisk
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo cdVolume](self, "cdVolume"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___CacheDeleteDaemonVolume);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = CDGetLogHandle("daemon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "bsdDisk: cdVolume of CDDaemonRecentVolumeInfo is not of class CacheDeleteDaemonVolume",  v13,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo volume](self, "volume"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo createVolumeWithPath:](self, "createVolumeWithPath:", v8));
    -[CDDaemonRecentVolumeInfo setCdVolume:](self, "setCdVolume:", v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo cdVolume](self, "cdVolume"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bsdDisk]);

  return v11;
}

- (id)thresholds
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo cdVolume](self, "cdVolume"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___CacheDeleteDaemonVolume);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = CDGetLogHandle("daemon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "thresholds: cdVolume of CDDaemonRecentVolumeInfo is not of class CacheDeleteDaemonVolume",  v13,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo volume](self, "volume"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo createVolumeWithPath:](self, "createVolumeWithPath:", v8));
    -[CDDaemonRecentVolumeInfo setCdVolume:](self, "setCdVolume:", v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo cdVolume](self, "cdVolume"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 thresholds]);

  return v11;
}

- (unint64_t)reserve
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo cdVolume](self, "cdVolume"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___CacheDeleteDaemonVolume);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = CDGetLogHandle("daemon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "reserve: cdVolume of CDDaemonRecentVolumeInfo is not of class CacheDeleteDaemonVolume",  v13,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo volume](self, "volume"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo createVolumeWithPath:](self, "createVolumeWithPath:", v8));
    -[CDDaemonRecentVolumeInfo setCdVolume:](self, "setCdVolume:", v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo cdVolume](self, "cdVolume"));
  id v11 = [v10 reserve];

  return (unint64_t)v11;
}

- (BOOL)hasSnapshot
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDDaemonRecentVolumeInfo volume](self, "volume"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteDaemonVolume volumeWithMountpoint:]( &OBJC_CLASS___CacheDeleteDaemonVolume,  "volumeWithMountpoint:",  v2));
  unsigned __int8 v4 = [v3 hasSnapshotsExcludingTimeMachine];

  return v4;
}

@end