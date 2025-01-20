@interface CDRecentVolumeInfo
+ (BOOL)supportsSecureCoding;
+ (id)CDRecentVolumeInfo:(id)a3;
- (BOOL)_validateWithSharedCacheDeleteForService:(id)a3;
- (BOOL)hasSnapshot;
- (BOOL)isEmpty;
- (BOOL)isStale;
- (BOOL)updateServiceInfoAmount:(id)a3 forService:(id)a4 atUrgency:(int)a5 withTimestamp:(double)a6 nonPurgeableAmount:(id)a7 deductFromCurrentAmount:(BOOL)a8 info:(id)a9;
- (BOOL)validateServiceInfo:(id)a3 atUrgency:(int)a4;
- (CDRecentVolumeInfo)initWithCoder:(id)a3;
- (CDRecentVolumeInfo)initWithServices:(id)a3 volumeName:(id)a4;
- (CDRecentVolumeInfo)initWithVolumeInfo:(id)a3;
- (CacheDeleteVolume)cdVolume;
- (NSDate)timestamp;
- (NSDictionary)thresholds;
- (NSMutableDictionary)diagnostics;
- (NSMutableDictionary)services;
- (NSNumber)freespace;
- (NSString)bsdDisk;
- (NSString)volume;
- (id)_recentInfoAtUrgency:(int)a3 validateResults:(BOOL)a4;
- (id)copyInvalidsAtUrgency:(int)a3 currentlyPushing:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createVolumeWithMountPoint:(id)a3;
- (id)createVolumeWithPath:(id)a3;
- (id)description;
- (id)recentInfoAtUrgency:(int)a3;
- (id)volumeServices;
- (int64_t)volumeState;
- (unint64_t)reserve;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)log;
- (void)removeServiceInfo:(id)a3;
- (void)setBsdDisk:(id)a3;
- (void)setCdVolume:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setFreespace:(id)a3;
- (void)setHasSnapshot:(BOOL)a3;
- (void)setReserve:(unint64_t)a3;
- (void)setServices:(id)a3;
- (void)setThresholds:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setVolume:(id)a3;
- (void)setVolumeState:(int64_t)a3;
@end

@implementation CDRecentVolumeInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createVolumeWithPath:(id)a3
{
  return +[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", a3);
}

- (id)createVolumeWithMountPoint:(id)a3
{
  return +[CacheDeleteVolume volumeWithMountpoint:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithMountpoint:", a3);
}

- (CDRecentVolumeInfo)initWithServices:(id)a3 volumeName:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CDRecentVolumeInfo;
  v8 = -[CDRecentVolumeInfo init](&v21, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_11:
    v14 = v9;
    goto LABEL_12;
  }

  objc_storeStrong((id *)&v8->_volume, a4);
  uint64_t v10 = -[CDRecentVolumeInfo createVolumeWithPath:](v9, "createVolumeWithPath:", v7);
  cdVolume = v9->_cdVolume;
  v9->_cdVolume = (CacheDeleteVolume *)v10;

  if (v9->_volume && v9->_cdVolume)
  {
    if (v6)
    {
      uint64_t v12 = [v6 mutableCopy];
    }

    else
    {
      uint64_t v12 = [MEMORY[0x189603FC8] dictionary];
    }

    services = v9->_services;
    v9->_services = (NSMutableDictionary *)v12;

    uint64_t v16 = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[CacheDeleteVolume freespace](v9->_cdVolume, "freespace"));
    freespace = v9->_freespace;
    v9->_freespace = (NSNumber *)v16;

    v9->_volumeState = -[CacheDeleteVolume state](v9->_cdVolume, "state");
    uint64_t v18 = [MEMORY[0x189603F50] date];
    timestamp = v9->_timestamp;
    v9->_timestamp = (NSDate *)v18;

    v9->_hasSnapshot = 0;
    goto LABEL_11;
  }

  CDGetLogHandle((uint64_t)"client");
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    int v23 = 40;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_error_impl( &dword_1874E4000,  v13,  OS_LOG_TYPE_ERROR,  "%d CDRecentVolumeInfo unable to validate mount point: %@",  buf,  0x12u);
  }

  v14 = 0LL;
LABEL_12:

  return v14;
}

- (CDRecentVolumeInfo)initWithVolumeInfo:(id)a3
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___CDRecentVolumeInfo;
  v5 = -[CDRecentVolumeInfo init](&v51, sel_init);
  if (!v5)
  {
LABEL_23:
    v31 = v5;
    goto LABEL_24;
  }

  uint64_t v6 = [v4 volume];
  volume = v5->_volume;
  v5->_volume = (NSString *)v6;

  [v4 volume];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = -[CDRecentVolumeInfo createVolumeWithPath:](v5, "createVolumeWithPath:", v8);
  cdVolume = v5->_cdVolume;
  v5->_cdVolume = (CacheDeleteVolume *)v9;

  if (v5->_volume && v5->_cdVolume)
  {
    [v4 services];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v12 = [MEMORY[0x189603FC8] dictionary];
    v13 = (void *)v12;
    if (v11)
    {
      v44 = v5;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      [v4 services];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v62 count:16];
      if (!v15) {
        goto LABEL_17;
      }
      uint64_t v16 = v15;
      v17 = "client";
      uint64_t v46 = *(void *)v48;
      while (1)
      {
        uint64_t v18 = 0LL;
        uint64_t v45 = v16;
        do
        {
          if (*(void *)v48 != v46) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v47 + 1) + 8 * v18);
          if ([v4 _validateWithSharedCacheDeleteForService:v19])
          {
            [v4 services];
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 objectForKeyedSubscript:v19];
            objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)[v21 copy];
            [v13 setObject:v22 forKeyedSubscript:v19];
          }

          else
          {
            CDGetLogHandle((uint64_t)v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_15;
            }
            [v4 volume];
            objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 services];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 objectForKeyedSubscript:v19];
            int v23 = v17;
            id v24 = v4;
            id v25 = v14;
            uint64_t v26 = v13;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67110146;
            int v53 = 72;
            __int16 v54 = 2080;
            v55 = "-[CDRecentVolumeInfo initWithVolumeInfo:]";
            __int16 v56 = 2112;
            v57 = v21;
            __int16 v58 = 2112;
            uint64_t v59 = v19;
            __int16 v60 = 2112;
            v61 = v27;
            _os_log_impl( &dword_1874E4000,  (os_log_t)v20,  OS_LOG_TYPE_DEFAULT,  "%d : %s excluding: volume: %@, service: %@, value: %@",  buf,  0x30u);

            v13 = v26;
            v14 = v25;
            id v4 = v24;
            v17 = v23;
            uint64_t v16 = v45;
          }

LABEL_15:
          ++v18;
        }

        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v62 count:16];
        if (!v16)
        {
LABEL_17:

          uint64_t v28 = [v13 mutableCopy];
          v5 = v44;
          services = v44->_services;
          v44->_services = (NSMutableDictionary *)v28;

          goto LABEL_22;
        }
      }
    }

    v32 = v5->_services;
    v5->_services = (NSMutableDictionary *)v12;
    v13 = v32;
LABEL_22:

    v5->_reserve = [v4 reserve];
    uint64_t v33 = [v4 bsdDisk];
    bsdDisk = v5->_bsdDisk;
    v5->_bsdDisk = (NSString *)v33;

    [v4 thresholds];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [v35 copy];
    thresholds = v5->_thresholds;
    v5->_thresholds = (NSDictionary *)v36;

    v5->_hasSnapshot = [v4 hasSnapshot];
    uint64_t v38 = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[CacheDeleteVolume freespace](v5->_cdVolume, "freespace"));
    freespace = v5->_freespace;
    v5->_freespace = (NSNumber *)v38;

    v5->_volumeState = -[CacheDeleteVolume state](v5->_cdVolume, "state");
    uint64_t v40 = [MEMORY[0x189603F50] date];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v40;

    goto LABEL_23;
  }

  CDGetLogHandle((uint64_t)"client");
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    [v4 volume];
    v43 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    int v53 = 63;
    __int16 v54 = 2112;
    v55 = v43;
    _os_log_error_impl( &dword_1874E4000,  v30,  OS_LOG_TYPE_ERROR,  "%d CDRecentVolumeInfo unable to validate mount point: %@",  buf,  0x12u);
  }

  v31 = 0LL;
LABEL_24:

  return v31;
}

+ (id)CDRecentVolumeInfo:(id)a3
{
  id v3 = a3;
  id v4 = -[CDRecentVolumeInfo initWithServices:volumeName:]( objc_alloc(&OBJC_CLASS___CDRecentVolumeInfo),  "initWithServices:volumeName:",  0LL,  v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___CDRecentVolumeInfo);
  -[CDRecentVolumeInfo services](self, "services");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 copyWithZone:a3];
  -[CDRecentVolumeInfo setServices:](v5, "setServices:", v7);
  v8 = -[CDRecentVolumeInfo timestamp](self, "timestamp");
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  -[CDRecentVolumeInfo setTimestamp:](v5, "setTimestamp:", v9);

  -[CDRecentVolumeInfo freespace](self, "freespace");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)[v10 copyWithZone:a3];
  -[CDRecentVolumeInfo setFreespace:](v5, "setFreespace:", v11);

  -[CDRecentVolumeInfo volume](self, "volume");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)[v12 copyWithZone:a3];
  -[CDRecentVolumeInfo setVolume:](v5, "setVolume:", v13);

  -[CDRecentVolumeInfo setVolumeState:](v5, "setVolumeState:", -[CDRecentVolumeInfo volumeState](self, "volumeState"));
  v14 = -[CDRecentVolumeInfo thresholds](self, "thresholds");
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  -[CDRecentVolumeInfo setThresholds:](v5, "setThresholds:", v15);

  -[CDRecentVolumeInfo bsdDisk](self, "bsdDisk");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)[v16 copyWithZone:a3];
  -[CDRecentVolumeInfo setBsdDisk:](v5, "setBsdDisk:", v17);

  -[CDRecentVolumeInfo setReserve:](v5, "setReserve:", -[CDRecentVolumeInfo reserve](self, "reserve"));
  -[CDRecentVolumeInfo setHasSnapshot:](v5, "setHasSnapshot:", -[CDRecentVolumeInfo hasSnapshot](self, "hasSnapshot"));
  -[CDRecentVolumeInfo volume](self, "volume");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo createVolumeWithPath:](self, "createVolumeWithPath:", v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo setCdVolume:](v5, "setCdVolume:", v19);

  return v5;
}

- (CDRecentVolumeInfo)initWithCoder:(id)a3
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___CDRecentVolumeInfo;
  v5 = -[CDRecentVolumeInfo init](&v42, sel_init);
  if (!v5)
  {
LABEL_20:
    v17 = v5;
    goto LABEL_21;
  }

  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_VOLUME"];
  volume = v5->_volume;
  v5->_volume = (NSString *)v6;

  if (v5->_volume)
  {
    uint64_t v8 = -[CDRecentVolumeInfo createVolumeWithMountPoint:](v5, "createVolumeWithMountPoint:");
    cdVolume = v5->_cdVolume;
    v5->_cdVolume = (CacheDeleteVolume *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_TIMESTAMP"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_FREESPACE"];
    freespace = v5->_freespace;
    v5->_freespace = (NSNumber *)v12;

    if ([v4 containsValueForKey:@"CACHE_DELETE_VOLUME_STATE"])
    {
      uint64_t v14 = [v4 decodeIntegerForKey:@"CACHE_DELETE_VOLUME_STATE"];
LABEL_15:
      v5->_volumeState = v14;
      uint64_t v18 = (void *)MEMORY[0x189604010];
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 decodeObjectOfClasses:v21 forKey:@"CACHE_DELETE_SERVICES"];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v22 mutableCopy];
      services = v5->_services;
      v5->_services = (NSMutableDictionary *)v23;

      if (!v5->_services)
      {
        uint64_t v25 = objc_opt_new();
        uint64_t v26 = v5->_services;
        v5->_services = (NSMutableDictionary *)v25;
      }

      v27 = (void *)MEMORY[0x189604010];
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = objc_opt_class();
      objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 decodeObjectOfClasses:v30 forKey:@"CACHE_DELETE_THRESHOLDS"];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = [v31 mutableCopy];
      thresholds = v5->_thresholds;
      v5->_thresholds = (NSDictionary *)v32;

      if (!v5->_thresholds)
      {
        uint64_t v34 = objc_opt_new();
        v35 = v5->_thresholds;
        v5->_thresholds = (NSDictionary *)v34;
      }

      uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_BSD_DISK"];
      bsdDisk = v5->_bsdDisk;
      v5->_bsdDisk = (NSString *)v36;

      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_RESERVE"];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_reserve = [v38 unsignedIntegerValue];
      v5->_hasSnapshot = [v4 decodeBoolForKey:@"CACHE_DELETE_HAS_SNAPSHOT"];

      goto LABEL_20;
    }

    uint64_t v16 = v5->_cdVolume;
    if (v16)
    {
      if (-[CacheDeleteVolume validate](v16, "validate")) {
        uint64_t v14 = -[CacheDeleteVolume state](v5->_cdVolume, "state");
      }
      else {
        uint64_t v14 = 0LL;
      }
      goto LABEL_15;
    }

    CDGetLogHandle((uint64_t)"client");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v41 = v5->_volume;
      *(_DWORD *)buf = 67109378;
      int v44 = 131;
      __int16 v45 = 2112;
      uint64_t v46 = v41;
      _os_log_error_impl( &dword_1874E4000,  v15,  OS_LOG_TYPE_ERROR,  "%d CDRecentVolumeInfo unable to validate mount point: %@",  buf,  0x12u);
    }
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = v5->_volume;
      *(_DWORD *)buf = 67109378;
      int v44 = 119;
      __int16 v45 = 2112;
      uint64_t v46 = v40;
      _os_log_error_impl( &dword_1874E4000,  v15,  OS_LOG_TYPE_ERROR,  "%d CDRecentVolumeInfo unable to validate mount point: %@",  buf,  0x12u);
    }
  }

  v17 = 0LL;
LABEL_21:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  -[CDRecentVolumeInfo timestamp](self, "timestamp");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 encodeObject:v4 forKey:@"CACHE_DELETE_TIMESTAMP"];
  v5 = -[CDRecentVolumeInfo freespace](self, "freespace");
  [v11 encodeObject:v5 forKey:@"CACHE_DELETE_FREESPACE"];

  -[CDRecentVolumeInfo services](self, "services");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 encodeObject:v6 forKey:@"CACHE_DELETE_SERVICES"];

  -[CDRecentVolumeInfo volume](self, "volume");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 encodeObject:v7 forKey:@"CACHE_DELETE_VOLUME"];

  objc_msgSend( v11,  "encodeInteger:forKey:",  -[CDRecentVolumeInfo volumeState](self, "volumeState"),  @"CACHE_DELETE_VOLUME_STATE");
  -[CDRecentVolumeInfo thresholds](self, "thresholds");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 encodeObject:v8 forKey:@"CACHE_DELETE_THRESHOLDS"];

  -[CDRecentVolumeInfo bsdDisk](self, "bsdDisk");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 encodeObject:v9 forKey:@"CACHE_DELETE_BSD_DISK"];

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[CDRecentVolumeInfo reserve](self, "reserve"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 encodeObject:v10 forKey:@"CACHE_DELETE_RESERVE"];

  objc_msgSend( v11,  "encodeBool:forKey:",  -[CDRecentVolumeInfo hasSnapshot](self, "hasSnapshot"),  @"CACHE_DELETE_HAS_SNAPSHOT");
}

- (BOOL)updateServiceInfoAmount:(id)a3 forService:(id)a4 atUrgency:(int)a5 withTimestamp:(double)a6 nonPurgeableAmount:(id)a7 deductFromCurrentAmount:(BOOL)a8 info:(id)a9
{
  BOOL v10 = a8;
  uint64_t v13 = *(void *)&a5;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a9;
  -[CDRecentVolumeInfo services](self, "services");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 objectForKeyedSubscript:v17];
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    [v21 amountAtUrgency:v13 checkTimestamp:0];
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v23 = [v21 updateAmount:v16 atUrgency:v13 withTimestamp:v18 nonPurgeableAmount:v10 deductFromCurrentAmount:v19 info:a6];
    CDGetLogHandle((uint64_t)"client");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        int v32 = 67110146;
        int v33 = 218;
        __int16 v34 = 2114;
        id v35 = v17;
        __int16 v36 = 2114;
        *(void *)v37 = v22;
        *(_WORD *)&v37[8] = 2114;
        *(void *)&v37[10] = v16;
        __int16 v38 = 2114;
        id v39 = v19;
        _os_log_impl( &dword_1874E4000,  v24,  OS_LOG_TYPE_DEFAULT,  "%d updateServiceInfoAmount UPDATED %{public}@, old: %{public}@, new: %{public}@, info: %{public}@",  (uint8_t *)&v32,  0x30u);
      }
    }

    else if (v25)
    {
      -[CDRecentVolumeInfo volume](self, "volume");
      int v32 = 67109890;
      int v33 = 220;
      __int16 v34 = 2114;
      id v35 = v17;
      __int16 v36 = 1024;
      *(_DWORD *)v37 = v13;
      *(void *)&v37[6] = *(_WORD *)&v37[4] = 2114;
      v27 = *(void **)&v37[6];
      _os_log_impl( &dword_1874E4000,  v24,  OS_LOG_TYPE_DEFAULT,  "%d updateServiceInfoAmount NO CHANGE for %{public}@ at %d on %{public}@",  (uint8_t *)&v32,  0x22u);
    }
  }

  else
  {
    +[CDRecentServiceInfo CDRecentServiceInfo:atUrgency:withTimestamp:nonPurgeableAmount:info:]( &OBJC_CLASS___CDRecentServiceInfo,  "CDRecentServiceInfo:atUrgency:withTimestamp:nonPurgeableAmount:info:",  v16,  v13,  v18,  v19,  a6);
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentVolumeInfo services](self, "services");
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 setObject:v21 forKeyedSubscript:v17];

    CDGetLogHandle((uint64_t)"client");
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 67109634;
      int v33 = 212;
      __int16 v34 = 2114;
      id v35 = v17;
      __int16 v36 = 2114;
      *(void *)v37 = v19;
      _os_log_impl( &dword_1874E4000,  v22,  OS_LOG_TYPE_DEFAULT,  "%d NEW updateServiceInfoAmount for %{public}@, info: %{public}@",  (uint8_t *)&v32,  0x1Cu);
    }

    LOBYTE(v23) = 1;
  }

  -[CDRecentVolumeInfo createVolumeWithMountPoint:](self, "createVolumeWithMountPoint:", self->_volume);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = v28;
  if (v28 && [v28 validate])
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v29, "freespace"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentVolumeInfo setFreespace:](self, "setFreespace:", v30);
  }

  return v23;
}

- (BOOL)_validateWithSharedCacheDeleteForService:(id)a3
{
  return 1;
}

- (id)_recentInfoAtUrgency:(int)a3 validateResults:(BOOL)a4
{
  uint64_t v143 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
  if (!v5)
  {
    -[CDRecentVolumeInfo volume](self, "volume");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CDRecentVolumeInfo volume](self, "volume");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDRecentVolumeInfo createVolumeWithPath:](self, "createVolumeWithPath:", v12);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDRecentVolumeInfo setCdVolume:](self, "setCdVolume:", v13);

      -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        CDGetLogHandle((uint64_t)"client");
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v102 = -[CDRecentVolumeInfo volume](self, "volume");
          *(_DWORD *)buf = 138412290;
          *(void *)v137 = v102;
          _os_log_error_impl( &dword_1874E4000,  v15,  OS_LOG_TYPE_ERROR,  "CDRecentVolumeInfo _recentInfoAtUrgency: Unable to create cdVolume for %@",  buf,  0xCu);
        }

        id v16 = 0LL;
        goto LABEL_98;
      }
    }
  }

  -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v120 = [v7 freespace];

    -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v119 = [v8 used];

    -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v117 = [v9 size];

    -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v115 = objc_msgSend(v10, "effective_size");
  }

  else
  {
    uint64_t v115 = 0LL;
    uint64_t v117 = 0LL;
    uint64_t v119 = 0LL;
    uint64_t v120 = 0LL;
  }

  __int128 v132 = 0u;
  __int128 v133 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  -[CDRecentVolumeInfo services](self, "services");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v110 = [obj countByEnumeratingWithState:&v130 objects:v142 count:16];
  if (!v110)
  {
    uint64_t v106 = 0LL;
    unint64_t v17 = 0LL;
    goto LABEL_56;
  }

  uint64_t v106 = 0LL;
  unint64_t v17 = 0LL;
  uint64_t v109 = *(void *)v131;
  do
  {
    for (uint64_t i = 0LL; i != v110; ++i)
    {
      unint64_t v111 = v17;
      if (*(void *)v131 != v109) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(void **)(*((void *)&v130 + 1) + 8 * i);
      -[CDRecentVolumeInfo services](self, "services");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 objectForKeyedSubscript:v19];
      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();

      [v21 nonPurgeableAmount];
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 serviceInfo];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      [v21 serviceInfo];
      int v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
      }

      else
      {
        [v21 serviceInfo];
        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26) {
          goto LABEL_23;
        }
      }

      [MEMORY[0x189603FC8] dictionary];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 serviceInfo];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        [v21 serviceInfo];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 setObject:v31 forKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
      }

      [v21 serviceInfo];
      int v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
      int v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        [v21 serviceInfo];
        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 objectForKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
        id v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 setObject:v35 forKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
      }

      __int16 v36 = (void *)[v27 copy];
      [v107 setObject:v36 forKeyedSubscript:v19];

LABEL_23:
      v37 = v113;
      if (v113 && [v113 unsignedLongLongValue])
      {
        uint64_t v38 = [v113 unsignedLongLongValue];
        [v108 objectForKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
        id v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39)
        {
          [MEMORY[0x189603FC8] dictionary];
          id v39 = (void *)objc_claimAutoreleasedReturnValue();
          [v108 setObject:v39 forKeyedSubscript:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
        }

        v106 += v38;
        if (v112) {
          uint64_t v40 = v112;
        }
        else {
          uint64_t v40 = v113;
        }
        [v39 setObject:v40 forKeyedSubscript:v19];
      }

      if ([v19 isEqualToString:@"CACHE_DELETE_TOTAL_FSPURGEABLE"])
      {
        unint64_t v17 = v111;
      }

      else
      {
        uint64_t v41 = a3;
        if (!a4
          || (uint64_t v41 = a3,
              -[CDRecentVolumeInfo _validateWithSharedCacheDeleteForService:]( self,  "_validateWithSharedCacheDeleteForService:",  v19)))
        {
          while (1)
          {
            [v21 amountAtUrgency:v41 checkTimestamp:1];
            objc_super v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (v42)
            {
              v43 = -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
              int v44 = objc_msgSend( v43,  "amountIsRational:freespace:effective_size:used:size:",  v42,  v120,  v115,  v119,  v117);

              if (v44)
              {
                [v108 setObject:v42 forKeyedSubscript:v19];
                fsPurgeableTypeToServiceMap();
                int v53 = (void *)objc_claimAutoreleasedReturnValue();
                [v53 allValues];
                __int16 v54 = (void *)objc_claimAutoreleasedReturnValue();
                char v55 = [v54 containsObject:v19];

                if ((v55 & 1) == 0) {
                  v111 += [v42 unsignedLongLongValue];
                }

LABEL_46:
                CDGetLogHandle((uint64_t)"client");
                __int16 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  [v108 objectForKeyedSubscript:v19];
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)v137 = 333;
                  *(_WORD *)&v137[4] = 2112;
                  *(void *)&v137[6] = v19;
                  *(_WORD *)&v137[14] = 2112;
                  *(void *)&v137[16] = v57;
                  __int16 v138 = 2112;
                  v139 = v21;
                  _os_log_impl( &dword_1874E4000,  v56,  OS_LOG_TYPE_DEFAULT,  "%d CDRecentVolumeInfo _recentInfoAtUrgency, service: %@, amount: %@ %@",  buf,  0x26u);
                  goto LABEL_50;
                }

                goto LABEL_51;
              }

              __int16 v45 = (void *)NSString;
              uint64_t v46 = [v42 unsignedLongLongValue];
              humanReadableNumber([v42 unsignedLongLongValue]);
              uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
              __int128 v48 = self;
              -[CDRecentVolumeInfo cdVolume](self, "cdVolume");
              __int128 v49 = (void *)objc_claimAutoreleasedReturnValue();
              [v45 stringWithFormat:@"implausible value %llu (%@) for service: %@ at urgency %d on volume: %@", v46, v47, v19, v41, v49];
              __int128 v50 = (void *)objc_claimAutoreleasedReturnValue();

              CDGetLogHandle((uint64_t)"client");
              objc_super v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v137 = 330;
                *(_WORD *)&v137[4] = 2112;
                *(void *)&v137[6] = v50;
                _os_log_error_impl( &dword_1874E4000,  v51,  OS_LOG_TYPE_ERROR,  "%d CDRecentVolumeInfo _recentInfoAtUrgency: Discarding %@",  buf,  0x12u);
              }

              self = v48;
            }

            BOOL v52 = __OFSUB__((_DWORD)v41, 1);
            uint64_t v41 = (v41 - 1);
          }
        }

        CDGetLogHandle((uint64_t)"client");
        __int16 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = -[CDRecentVolumeInfo volume](self, "volume");
          -[CDRecentVolumeInfo services](self, "services");
          __int16 v58 = (void *)objc_claimAutoreleasedReturnValue();
          [v58 objectForKeyedSubscript:v19];
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v137 = 308;
          *(_WORD *)&v137[4] = 2080;
          *(void *)&v137[6] = "-[CDRecentVolumeInfo _recentInfoAtUrgency:validateResults:]";
          *(_WORD *)&v137[14] = 2112;
          *(void *)&v137[16] = v57;
          __int16 v138 = 2112;
          v139 = v19;
          __int16 v140 = 2112;
          v141 = v59;
          _os_log_impl( &dword_1874E4000,  v56,  OS_LOG_TYPE_DEFAULT,  "%d : %s excluding: volume: %@, service: %@, value: %@",  buf,  0x30u);

LABEL_50:
        }

- (id)recentInfoAtUrgency:(int)a3
{
  return -[CDRecentVolumeInfo _recentInfoAtUrgency:validateResults:]( self,  "_recentInfoAtUrgency:validateResults:",  *(void *)&a3,  1LL);
}

- (id)volumeServices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allKeys];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeServiceInfo:(id)a3
{
  id v4 = a3;
  -[CDRecentVolumeInfo services](self, "services");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 removeObjectForKey:v4];
}

- (BOOL)validateServiceInfo:(id)a3 atUrgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  -[CDRecentVolumeInfo services](self, "services");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = [v8 validate:v4 atUrgency:120.0];
  return v4;
}

- (id)copyInvalidsAtUrgency:(int)a3 currentlyPushing:(id)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v31 = a4;
  [MEMORY[0x189603FA8] array];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo freespace](self, "freespace");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 unsignedLongLongValue] / 0xAuLL;

  if (v6 <= 0x9600000) {
    uint64_t v7 = 157286400LL;
  }
  else {
    uint64_t v7 = v6;
  }
  unint64_t v38 = 0LL;
  -[CDRecentVolumeInfo volume](self, "volume");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo freespace](self, "freespace");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedLongLong:v7];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = validateFreespace(v8, v9, v10, &v38);

  if (v11)
  {
    int v12 = 0;
  }

  else
  {
    -[CDRecentVolumeInfo volume](self, "volume");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentVolumeInfo freespace](self, "freespace");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedLongLong:3 * v7];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v16 = validateFreespace(v13, v14, v15, 0LL);

    if (!v16)
    {
      CDGetLogHandle((uint64_t)"client");
      unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_1874E4000,  v17,  OS_LOG_TYPE_DEFAULT,  "Drastic free space change. Querying all pushing services as well!",  buf,  2u);
      }
    }

    -[CDRecentVolumeInfo invalidate](self, "invalidate");
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v38];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentVolumeInfo setFreespace:](self, "setFreespace:", v18);

    int v12 = !v16;
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  -[CDRecentVolumeInfo services](self, "services");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t i = 0LL; i != v21; ++i)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        -[CDRecentVolumeInfo services](self, "services");
        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 objectForKeyedSubscript:v24];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (([v26 validate:a3 atUrgency:120.0] & 1) == 0
          && ([v31 containsObject:v24] ^ 1 | v12) == 1)
        {
          [v30 addObject:v24];
        }
      }

      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }

    while (v21);
  }

  [MEMORY[0x189604010] setWithArray:v30];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = (void *)[v27 copy];

  return v28;
}

- (BOOL)isEmpty
{
  uint64_t v5 = 0LL;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 1;
  v2 = -[CDRecentVolumeInfo services](self, "services");
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __29__CDRecentVolumeInfo_isEmpty__block_invoke;
  v4[3] = &unk_18A065AD0;
  v4[4] = &v5;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __29__CDRecentVolumeInfo_isEmpty__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result = [a3 isEmpty];
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

  return result;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  -[CDRecentVolumeInfo services](self, "services");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        [NSString stringWithFormat:@"\t%@:", v8];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v9];

        BOOL v10 = (void *)NSString;
        -[CDRecentVolumeInfo services](self, "services");
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectForKeyedSubscript:v8];
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 stringWithFormat:@"%@", v12];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v13];
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }

  [v3 componentsJoinedByString:@"\n"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)log
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  CDGetLogHandle((uint64_t)"client");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CDRecentVolumeInfo timestamp](self, "timestamp");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentVolumeInfo freespace](self, "freespace");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    int v23 = v4;
    __int16 v24 = 2112;
    BOOL v25 = v5;
    _os_log_impl(&dword_1874E4000, v3, OS_LOG_TYPE_DEFAULT, "  timestamp: %@, freespace: %@", buf, 0x16u);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  -[CDRecentVolumeInfo services](self, "services");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v16 = v8;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        -[CDRecentVolumeInfo services](self, "services", v16);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 objectForKeyedSubscript:v12];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

        CDGetLogHandle((uint64_t)"client");
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          int v23 = v12;
          _os_log_impl(&dword_1874E4000, v15, OS_LOG_TYPE_DEFAULT, "   service: %@", buf, 0xCu);
        }

        [v14 log];
        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }
}

- (void)invalidate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1];
}

uint64_t __32__CDRecentVolumeInfo_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (BOOL)isStale
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = validateTimestamp(v3, 3600.0);

  -[CDRecentVolumeInfo volume](self, "volume");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentVolumeInfo freespace](self, "freespace");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = validateFreespace(v5, v6, &unk_18A06C110, 0LL);

  -[CDRecentVolumeInfo thresholds](self, "thresholds");
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();

  char v9 = !v7;
  if (!v8) {
    char v9 = 1;
  }
  if (v4) {
    return v9;
  }
  else {
    return 1;
  }
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
}

- (CacheDeleteVolume)cdVolume
{
  return self->_cdVolume;
}

- (void)setCdVolume:(id)a3
{
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)freespace
{
  return (NSNumber *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFreespace:(id)a3
{
}

- (unint64_t)reserve
{
  return self->_reserve;
}

- (void)setReserve:(unint64_t)a3
{
  self->_reserve = a3;
}

- (NSString)bsdDisk
{
  return self->_bsdDisk;
}

- (void)setBsdDisk:(id)a3
{
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (void)setHasSnapshot:(BOOL)a3
{
  self->_hasSnapshot = a3;
}

- (NSMutableDictionary)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (int64_t)volumeState
{
  return self->_volumeState;
}

- (void)setVolumeState:(int64_t)a3
{
  self->_volumeState = a3;
}

- (NSDictionary)thresholds
{
  return self->_thresholds;
}

- (void)setThresholds:(id)a3
{
}

- (NSMutableDictionary)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end