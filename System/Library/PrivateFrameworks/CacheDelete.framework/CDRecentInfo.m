@interface CDRecentInfo
+ (BOOL)supportsSecureCoding;
+ (id)fetchAllowedClassesSet;
+ (id)recentInfoForVolumes:(id)a3;
- (BOOL)hasInvalids;
- (BOOL)hasSnapshotForVolume:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isInvalidForVolume:(id)a3;
- (BOOL)isStale;
- (BOOL)isStaleForVolume:(id)a3;
- (BOOL)updateRecentState:(int64_t)a3 forVolume:(id)a4;
- (BOOL)updateServiceInfoAmount:(id)a3 forService:(id)a4 onVolume:(id)a5 atUrgency:(int)a6 withTimestamp:(double)a7 nonPurgeableAmount:(id)a8 deductFromCurrentAmount:(BOOL)a9 info:(id)a10;
- (BOOL)validateForVolume:(id)a3 andService:(id)a4 atUrgency:(int)a5;
- (CDRecentInfo)initWithCoder:(id)a3;
- (CDRecentInfo)initWithRecentInfo:(id)a3;
- (CDRecentInfo)initWithVolumes:(id)a3;
- (NSMutableDictionary)volumes;
- (NSMutableSet)invalidVolumes;
- (NSMutableSet)pushingServices;
- (NSNumber)version;
- (id)_createNewRecentVolumeInfo;
- (id)_createNewRecentVolumeInfoWithName:(id)a3;
- (id)_recentInfoForVolume:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5;
- (id)bsdDiskForVolume:(id)a3;
- (id)copyInvalidsForVolume:(id)a3 atUrgency:(int)a4;
- (id)copyPushingServices;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4;
- (id)servicesForVolume:(id)a3;
- (id)thresholdsForVolume:(id)a3;
- (int64_t)recentStateForVolume:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateForVolume:(id)a3;
- (void)log;
- (void)removeServiceInfo:(id)a3;
- (void)removeServiceInfo:(id)a3 forVolume:(id)a4;
- (void)setInvalidVolumes:(id)a3;
- (void)setPushingServices:(id)a3;
- (void)setVersion:(id)a3;
- (void)setVolumes:(id)a3;
@end

@implementation CDRecentInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)recentInfoForVolumes:(id)a3
{
  id v3 = a3;
  v4 = -[CDRecentInfo initWithVolumes:](objc_alloc(&OBJC_CLASS___CDRecentInfo), "initWithVolumes:", v3);

  return v4;
}

- (CDRecentInfo)initWithVolumes:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CDRecentInfo;
  v5 = -[CDRecentInfo init](&v14, sel_init);
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 mutableCopy];
    }

    else
    {
      uint64_t v6 = [MEMORY[0x189603FC8] dictionary];
    }

    volumes = v5->_volumes;
    v5->_volumes = (NSMutableDictionary *)v6;

    version = v5->_version;
    v5->_version = (NSNumber *)&unk_18A06C350;

    uint64_t v9 = [MEMORY[0x189603FE0] set];
    pushingServices = v5->_pushingServices;
    v5->_pushingServices = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x189603FE0] set];
    invalidVolumes = v5->_invalidVolumes;
    v5->_invalidVolumes = (NSMutableSet *)v11;
  }

  return v5;
}

- (id)_createNewRecentVolumeInfoWithName:(id)a3
{
  return +[CDRecentVolumeInfo CDRecentVolumeInfo:](&OBJC_CLASS___CDRecentVolumeInfo, "CDRecentVolumeInfo:", a3);
}

- (id)_createNewRecentVolumeInfo
{
  return objc_alloc(&OBJC_CLASS___CDRecentVolumeInfo);
}

- (CDRecentInfo)initWithRecentInfo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CDRecentInfo;
  v5 = -[CDRecentInfo init](&v30, sel_init);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x189603FC8] dictionary];
    volumes = v5->_volumes;
    v5->_volumes = (NSMutableDictionary *)v6;

    [v4 volumes];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      objc_msgSend(v4, "volumes", 0);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v27;
        do
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
            v15 = -[CDRecentInfo _createNewRecentVolumeInfo](v5, "_createNewRecentVolumeInfo");
            [v4 volumes];
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v16 objectForKeyedSubscript:v14];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)[v15 initWithVolumeInfo:v17];
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_volumes, "setObject:forKeyedSubscript:", v18, v14);

            ++v13;
          }

          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }

        while (v11);
      }
    }

    version = v5->_version;
    v5->_version = (NSNumber *)&unk_18A06C350;

    uint64_t v20 = [MEMORY[0x189603FE0] set];
    pushingServices = v5->_pushingServices;
    v5->_pushingServices = (NSMutableSet *)v20;

    [v4 invalidVolumes];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 mutableCopy];
    invalidVolumes = v5->_invalidVolumes;
    v5->_invalidVolumes = (NSMutableSet *)v23;
  }

  return v5;
}

- (BOOL)validateForVolume:(id)a3 andService:(id)a4 atUrgency:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKeyedSubscript:v9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = [v11 validateServiceInfo:v8 atUrgency:v5];
  return v5;
}

- (id)copyInvalidsForVolume:(id)a3 atUrgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = -[CDRecentInfo volumes](self, "volumes");
  [v7 objectForKeyedSubscript:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRecentInfo pushingServices](self, "pushingServices");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (void *)[v8 copyInvalidsAtUrgency:v4 currentlyPushing:v9];

  return v10;
}

- (id)copyPushingServices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc(&OBJC_CLASS___CDRecentInfo);
  -[CDRecentInfo volumes](self, "volumes");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 copyWithZone:a3];
  id v8 = -[CDRecentInfo initWithVolumes:](v5, "initWithVolumes:", v7);

  return v8;
}

+ (id)fetchAllowedClassesSet
{
  v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (CDRecentInfo)initWithCoder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CDRecentInfo;
  uint64_t v5 = -[CDRecentInfo init](&v34, sel_init);
  if (v5)
  {
    objc_opt_class();
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_DELETE_CACHED_RESULTS_VERSION"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    evaluateNumberProperty(v6);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();

    BOOL v8 = -[NSNumber isEqualToNumber:](v7, "isEqualToNumber:", &unk_18A06C350);
    CDGetLogHandle((uint64_t)"client");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1874E4000, v10, OS_LOG_TYPE_DEFAULT, "got a compatible version", buf, 2u);
      }

      [(id)objc_opt_class() fetchAllowedClassesSet];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 decodeObjectOfClasses:v11 forKey:@"CACHE_DELETE_RECENT_PURGEABLE_STATS"];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 mutableCopy];
      volumes = v5->_volumes;
      v5->_volumes = (NSMutableDictionary *)v13;

      [(id)objc_opt_class() fetchAllowedClassesSet];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 decodeObjectOfClasses:v15 forKey:@"CACHE_DELETE_CACHED_PUSHING_SERVICES"];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 mutableCopy];
      pushingServices = v5->_pushingServices;
      v5->_pushingServices = (NSMutableSet *)v17;

      [(id)objc_opt_class() fetchAllowedClassesSet];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 decodeObjectOfClasses:v19 forKey:@"CACHE_DELETE_CACHED_INVALID_VOLUMES"];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 mutableCopy];
      invalidVolumes = v5->_invalidVolumes;
      v5->_invalidVolumes = (NSMutableSet *)v21;
    }

    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v7;
        _os_log_error_impl(&dword_1874E4000, v10, OS_LOG_TYPE_ERROR, "incompatible version: %@", buf, 0xCu);
      }
    }

    uint64_t v23 = v5->_volumes;
    if (v23)
    {
      v24 = v23;
    }

    else
    {
      [MEMORY[0x189603FC8] dictionary];
      v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }

    v25 = v5->_volumes;
    v5->_volumes = v24;

    __int128 v26 = v5->_pushingServices;
    if (v26)
    {
      __int128 v27 = v26;
    }

    else
    {
      [MEMORY[0x189603FE0] set];
      __int128 v27 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }

    __int128 v28 = v5->_pushingServices;
    v5->_pushingServices = v27;

    __int128 v29 = v5->_invalidVolumes;
    if (v29)
    {
      objc_super v30 = v29;
    }

    else
    {
      [MEMORY[0x189603FE0] set];
      objc_super v30 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }

    v31 = v5->_invalidVolumes;
    v5->_invalidVolumes = v30;

    version = v5->_version;
    v5->_version = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[CDRecentInfo version](self, "version");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"CACHE_DELETE_CACHED_RESULTS_VERSION"];

  -[CDRecentInfo volumes](self, "volumes");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"CACHE_DELETE_RECENT_PURGEABLE_STATS"];
  v7 = -[CDRecentInfo pushingServices](self, "pushingServices");
  [v4 encodeObject:v7 forKey:@"CACHE_DELETE_CACHED_PUSHING_SERVICES"];

  -[CDRecentInfo invalidVolumes](self, "invalidVolumes");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"CACHE_DELETE_CACHED_INVALID_VOLUMES"];
}

- (id)_recentInfoForVolume:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if ([v8 validate])
  {
    -[CDRecentInfo volumes](self, "volumes");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 mountPoint];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectForKeyedSubscript:v10];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 _recentInfoAtUrgency:v6 validateResults:v5];
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = v12;
LABEL_7:

    goto LABEL_8;
  }

  [v8 mountPoint];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [v8 mountPoint];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = 138412290;
      v19 = v17;
      _os_log_error_impl( &dword_1874E4000,  v14,  OS_LOG_TYPE_ERROR,  "Unable to validate volume: %@. Discarding its purgeable cache",  (uint8_t *)&v18,  0xCu);
    }

    -[CDRecentInfo volumes](self, "volumes");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v8 mountPoint];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 removeObjectForKey:v15];

    uint64_t v13 = 0LL;
    goto LABEL_7;
  }

- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4
{
  return -[CDRecentInfo _recentInfoForVolume:atUrgency:validateResults:]( self,  "_recentInfoForVolume:atUrgency:validateResults:",  a3,  *(void *)&a4,  1LL);
}

- (int64_t)recentStateForVolume:(id)a3
{
  id v4 = a3;
  if (v4
    && (-[CDRecentInfo volumes](self, "volumes"),
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:v4],
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    int64_t v7 = [v6 volumeState];
  }

  else
  {
    int64_t v7 = 0LL;
  }

  return v7;
}

- (BOOL)updateRecentState:(int64_t)a3 forVolume:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  -[CDRecentInfo volumes](self, "volumes");
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDRecentInfo volumes](self, "volumes");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v8) {
      goto LABEL_3;
    }
    goto LABEL_9;
  }

  CDGetLogHandle((uint64_t)"client");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v15[0] = 67109120;
    v15[1] = 197;
    _os_log_error_impl( &dword_1874E4000,  v12,  OS_LOG_TYPE_ERROR,  "%d Deleted cache's volume dictionary is nulled. Initializing a new, empty one.",  (uint8_t *)v15,  8u);
  }

  [MEMORY[0x189603FC8] dictionary];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentInfo setVolumes:](self, "setVolumes:", v13);

  if (!v8)
  {
LABEL_9:
    -[CDRecentInfo _createNewRecentVolumeInfoWithName:](self, "_createNewRecentVolumeInfoWithName:", v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentInfo volumes](self, "volumes");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setObject:v8 forKeyedSubscript:v6];
  }

- (void)removeServiceInfo:(id)a3 forVolume:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:v6];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 removeServiceInfo:v7];
}

- (void)removeServiceInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  -[CDRecentInfo volumes](self, "volumes", 0LL);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CDRecentInfo removeServiceInfo:forVolume:]( self,  "removeServiceInfo:forVolume:",  v4,  *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (BOOL)updateServiceInfoAmount:(id)a3 forService:(id)a4 onVolume:(id)a5 atUrgency:(int)a6 withTimestamp:(double)a7 nonPurgeableAmount:(id)a8 deductFromCurrentAmount:(BOOL)a9 info:(id)a10
{
  BOOL v10 = a9;
  uint64_t v13 = *(void *)&a6;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a10;
  v22 = -[CDRecentInfo volumes](self, "volumes");
  [v22 objectForKeyedSubscript:v19];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[CDRecentInfo volumes](self, "volumes");
  if (v24)
  {
    if (v23) {
      goto LABEL_3;
    }
LABEL_7:
    -[CDRecentInfo _createNewRecentVolumeInfoWithName:](self, "_createNewRecentVolumeInfoWithName:", v19);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRecentInfo volumes](self, "volumes");
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setObject:v23 forKeyedSubscript:v19];

    goto LABEL_3;
  }

  CDGetLogHandle((uint64_t)"client");
  __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v30[0] = 67109120;
    v30[1] = 238;
    _os_log_error_impl( &dword_1874E4000,  v27,  OS_LOG_TYPE_ERROR,  "%d Deleted cache's volume dictionary is nulled. Initializing a new, empty one.",  (uint8_t *)v30,  8u);
  }

  [MEMORY[0x189603FC8] dictionary];
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRecentInfo setVolumes:](self, "setVolumes:", v28);

  if (!v23) {
    goto LABEL_7;
  }
LABEL_3:
  char v25 = [v23 updateServiceInfoAmount:v17 forService:v18 atUrgency:v13 withTimestamp:v20 nonPurgeableAmount:v10 deductFromCurrentAmount:v21 info:a7];

  return v25;
}

- (id)bsdDiskForVolume:(id)a3
{
  id v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 bsdDisk];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)thresholdsForVolume:(id)a3
{
  id v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 thresholds];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)servicesForVolume:(id)a3
{
  id v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 volumeServices];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasSnapshotForVolume:(id)a3
{
  id v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = [v6 hasSnapshot];
  return (char)v5;
}

- (BOOL)isStaleForVolume:(id)a3
{
  id v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = [v6 isStale];
  return (char)v5;
}

- (BOOL)isInvalidForVolume:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = v4;
  if (v4 && [v4 validate])
  {
    -[CDRecentInfo invalidVolumes](self, "invalidVolumes");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 mountPoint];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v6 containsObject:v7];
  }

  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)isStale
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (-[CDRecentInfo isEmpty](self, "isEmpty")) {
    return 1;
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  -[CDRecentInfo volumes](self, "volumes", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        -[CDRecentInfo volumes](self, "volumes");
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 objectForKeyedSubscript:v9];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v11 isStale];

        if ((v12 & 1) != 0)
        {
          BOOL v3 = 1;
          goto LABEL_13;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v3 = 0;
LABEL_13:

  return v3;
}

- (BOOL)isEmpty
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 1;
  v2 = -[CDRecentInfo volumes](self, "volumes");
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __23__CDRecentInfo_isEmpty__block_invoke;
  v4[3] = &unk_18A066548;
  v4[4] = &v5;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __23__CDRecentInfo_isEmpty__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result = [a3 isEmpty];
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

  return result;
}

- (BOOL)hasInvalids
{
  v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  -[CDRecentInfo volumes](self, "volumes");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __27__CDRecentInfo_hasInvalids__block_invoke;
  v5[3] = &unk_18A066570;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __27__CDRecentInfo_hasInvalids__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v9 = a3;
  uint64_t v6 = 1LL;
  while (1)
  {
    [*(id *)(a1 + 32) pushingServices];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (void *)[v9 copyInvalidsAtUrgency:v6 currentlyPushing:v7];

    if ([v8 count]) {
      break;
    }

    uint64_t v6 = (v6 + 1);
    if ((_DWORD)v6 == 4) {
      goto LABEL_6;
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  *a4 = 1;

LABEL_6:
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  -[CDRecentInfo volumes](self, "volumes");
  id obj = (id)objc_claimAutoreleasedReturnValue();
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
        [NSString stringWithFormat:@"Volume: %@", v8];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v9];

        BOOL v10 = (void *)NSString;
        -[CDRecentInfo volumes](self, "volumes");
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectForKeyedSubscript:v8];
        char v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 stringWithFormat:@"%@", v12];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v13];
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }

  [v3 componentsJoinedByString:@"\n"];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)log
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[CDRecentInfo volumes](self, "volumes");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v13 = v5;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        -[CDRecentInfo volumes](self, "volumes", v13);
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 objectForKeyedSubscript:v9];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();

        CDGetLogHandle((uint64_t)"client");
        char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          uint64_t v19 = v9;
          _os_log_impl(&dword_1874E4000, v12, OS_LOG_TYPE_DEFAULT, " Volume: %@", buf, 0xCu);
        }

        [v11 log];
        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v6);
  }
}

- (void)invalidateForVolume:(id)a3
{
  id v4 = a3;
  -[CDRecentInfo volumes](self, "volumes");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 removeObjectForKey:v4];
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSMutableDictionary)volumes
{
  return self->_volumes;
}

- (void)setVolumes:(id)a3
{
}

- (NSMutableSet)pushingServices
{
  return self->_pushingServices;
}

- (void)setPushingServices:(id)a3
{
}

- (NSMutableSet)invalidVolumes
{
  return self->_invalidVolumes;
}

- (void)setInvalidVolumes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end