@interface AppCache
+ (id)appCacheWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 cacheDeleteVolume:(id)a8 isDataseparated:(BOOL)a9 isPlaceholder:(BOOL)a10 isPlugin:(BOOL)a11 telemetry:(id)a12;
+ (id)appCacheWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 isDataseparated:(BOOL)a8 isPlaceholder:(BOOL)a9 isPlugin:(BOOL)a10 telemetry:(id)a11;
+ (void)enumerateAppCachesOnVolume:(id)a3 options:(int)a4 telemetry:(id)a5 block:(id)a6;
+ (void)enumerateGroupCachesOnVolume:(id)a3 block:(id)a4;
+ (void)enumerateWithContainerQuery:(id)a3 container_class:(unint64_t)a4 options:(int)a5 telemetry:(id)a6 block:(id)a7;
- (AppCache)initWithBundleRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 cacheDeleteVolume:(id)a8 isDataseparated:(BOOL)a9 isPlaceholder:(BOOL)a10 isPlugin:(BOOL)a11 telemetry:(id)a12;
- (BOOL)isDataseparated;
- (BOOL)isPlaceholder;
- (BOOL)isPlugin;
- (BOOL)moveCacheAside:(id)a3;
- (BOOL)validate;
- (CacheDeleteVolume)cdVol;
- (NSDate)lastUsed;
- (NSMutableSet)bundleRecords;
- (NSNumber)lastKnownCacheSize;
- (NSNumber)lastKnownFreespace;
- (NSNumber)lastKnownGroupCacheSize;
- (NSNumber)lastKnownTmpSize;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)dataContainerURL;
- (NSURL)userManagedAssetsURL;
- (TestTelemetry)telemetry;
- (double)timestamp;
- (id)cachePath;
- (id)description;
- (id)tmpPath;
- (int)urgency;
- (int64_t)three_days_ago;
- (unint64_t)caches:(BOOL)a3 purge:(BOOL)a4;
- (unint64_t)clearCaches:(BOOL)a3;
- (unint64_t)groupCache:(BOOL)a3;
- (unint64_t)tmp:(BOOL)a3 purge:(BOOL)a4 all:(BOOL)a5;
- (void)addBundleRecord:(id)a3;
- (void)addBundleRecords:(id)a3;
- (void)invalidate;
- (void)setBundleRecords:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastKnownCacheSize:(id)a3;
- (void)setLastKnownFreespace:(id)a3;
- (void)setLastKnownGroupCacheSize:(id)a3;
- (void)setLastKnownTmpSize:(id)a3;
- (void)setLastUsed:(id)a3;
- (void)setTelemetry:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation AppCache

- (id)description
{
  v32 = (void *)NSString;
  uint64_t v3 = -[AppCache identifier](self, "identifier");
  uint64_t v30 = -[AppCache urgency](self, "urgency");
  uint64_t v4 = -[AppCache lastUsed](self, "lastUsed");
  uint64_t v5 = humanReadableNumber(-[AppCache caches:purge:](self, "caches:purge:", 0LL, 0LL));
  uint64_t v6 = humanReadableNumber(-[AppCache tmp:purge:all:](self, "tmp:purge:all:", 0LL, 0LL, 0LL));
  v33 = -[AppCache lastKnownFreespace](self, "lastKnownFreespace");
  humanReadableNumber([v33 unsignedLongLongValue]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[AppCache bundleRecords](self, "bundleRecords");
  [v31 allObjects];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "componentsJoinedByString:", @", ");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AppCache personaUniqueString](self, "personaUniqueString");
  v35 = (void *)v4;
  v36 = (void *)v3;
  v34 = (void *)v5;
  if (v7)
  {
    -[AppCache personaUniqueString](self, "personaUniqueString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v8 = @"none";
  }

  if (-[AppCache isDataseparated](self, "isDataseparated")) {
    v9 = " Dataseparated ";
  }
  else {
    v9 = "";
  }
  if (-[AppCache isPlaceholder](self, "isPlaceholder")) {
    v10 = " Placeholder ";
  }
  else {
    v10 = "";
  }
  id v11 = -[AppCache dataContainerURL](self, "dataContainerURL");
  uint64_t v12 = [v11 fileSystemRepresentation];
  v13 = -[AppCache userManagedAssetsURL](self, "userManagedAssetsURL");
  if (v13)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @", user managed assets: %s",  -[NSURL fileSystemRepresentation](self->_userManagedAssetsURL, "fileSystemRepresentation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = v12;
    v23 = v9;
    v25 = v10;
    uint64_t v21 = v6;
    v15 = (void *)v6;
    v16 = v34;
    v17 = v35;
    v18 = v36;
    [v32 stringWithFormat:@"identifier: %@, urgency: %d, lastUsed: %@, cacheSize: %@, tmpSize: %@, freespace: %@ bundleRecords: [ %@ ], persona: %@%s%s, data container: %s%@", v36, v30, v35, v34, v21, v38, v37, v8, v23, v25, v27, v14];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v28 = v12;
    v24 = v9;
    v26 = v10;
    uint64_t v22 = v6;
    v15 = (void *)v6;
    v16 = v34;
    v17 = v35;
    v18 = v36;
    [v32 stringWithFormat:@"identifier: %@, urgency: %d, lastUsed: %@, cacheSize: %@, tmpSize: %@, freespace: %@ bundleRecords: [ %@ ], persona: %@%s%s, data container: %s%@", v36, v30, v35, v34, v22, v38, v37, v8, v24, v26, v28, &stru_18A067AD8];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7) {
  return v19;
  }
}

- (AppCache)initWithBundleRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 cacheDeleteVolume:(id)a8 isDataseparated:(BOOL)a9 isPlaceholder:(BOOL)a10 isPlugin:(BOOL)a11 telemetry:(id)a12
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v18 = a3;
  id v19 = a4;
  id v50 = a5;
  id v49 = a6;
  id v48 = a7;
  id v20 = a8;
  id v47 = a12;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___AppCache;
  uint64_t v21 = -[AppCache init](&v51, sel_init);
  uint64_t v22 = v21;
  if (!v21) {
    goto LABEL_15;
  }
  if (!v18 || !v19)
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

LABEL_15:
      v32 = 0LL;
      v34 = v48;
      v33 = v49;
      v35 = v47;
      goto LABEL_16;
    }

    *(_DWORD *)buf = 67109120;
    int v53 = 95;
    v29 = "%d AppCache: cannot create an AppCache without an identifier and LSRecord(s)!";
    uint64_t v30 = (os_log_s *)v28;
    uint32_t v31 = 8;
LABEL_26:
    _os_log_error_impl(&dword_1874E4000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_14;
  }

  if (v50) {
    objc_storeStrong((id *)&v21->_dataContainerURL, a5);
  }
  dataContainerURL = v22->_dataContainerURL;
  if (!dataContainerURL)
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 67109378;
    int v53 = 92;
    __int16 v54 = 2112;
    id v55 = v19;
    v29 = "%d AppCache: cannot create an AppCache for %@ without dataContainerURL";
    uint64_t v30 = (os_log_s *)v28;
    uint32_t v31 = 18;
    goto LABEL_26;
  }

  if (v20)
  {
    if (!initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace)
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v20, "freespace"));
      v25 = (void *)initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace;
      initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace = v24;
    }

    v26 = (CacheDeleteVolume *)v20;
    cdVol = v22->_cdVol;
    v22->_cdVol = v26;
  }

  else
  {
    objc_msgSend( NSString,  "stringWithUTF8String:",  -[NSURL fileSystemRepresentation](dataContainerURL, "fileSystemRepresentation"));
    cdVol = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = +[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", cdVol);
    v38 = v22->_cdVol;
    v22->_cdVol = (CacheDeleteVolume *)v37;
  }

  if (!v22->_cdVol) {
    goto LABEL_15;
  }
  if (!a11) {
    objc_storeStrong((id *)&v22->_userManagedAssetsURL, a6);
  }
  uint64_t v39 = [v18 mutableCopy];
  bundleRecords = v22->_bundleRecords;
  v22->_bundleRecords = (NSMutableSet *)v39;

  objc_storeStrong((id *)&v22->_identifier, a4);
  objc_storeStrong((id *)&v22->_personaUniqueString, a7);
  v22->_isPlaceholder = a10;
  v22->_isPlugin = a11;
  uint64_t v41 = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[AppCache tmp:purge:all:](v22, "tmp:purge:all:", 0, 0, 0));
  lastKnownTmpSize = v22->_lastKnownTmpSize;
  v22->_lastKnownTmpSize = (NSNumber *)v41;

  uint64_t v43 = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[AppCache caches:purge:](v22, "caches:purge:", 0, 0));
  lastKnownCacheSize = v22->_lastKnownCacheSize;
  v22->_lastKnownCacheSize = (NSNumber *)v43;

  if (initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace)
  {
    v45 = (NSNumber *)(id)initWithBundleRecords_identifier_dataContainerURL_userManagedAssetsURL_personaUniqueString_cacheDeleteVolume_isDataseparated_isPlaceholder_isPlugin_telemetry__cdVolFreespace;
  }

  else
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[CacheDeleteVolume freespace](v22->_cdVol, "freespace"));
    v45 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }

  lastKnownFreespace = v22->_lastKnownFreespace;
  v22->_lastKnownFreespace = v45;
  v34 = v48;
  v33 = v49;
  v35 = v47;

  objc_storeStrong((id *)&v22->_telemetry, a12);
  v22->_timestamp = nan("");
  v32 = v22;
LABEL_16:

  return v32;
}

+ (id)appCacheWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 isDataseparated:(BOOL)a8 isPlaceholder:(BOOL)a9 isPlugin:(BOOL)a10 telemetry:(id)a11
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a11;
  if (!v17)
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v27 = "AppCache: identifier is required";
LABEL_10:
      uint64_t v28 = v24;
      uint32_t v29 = 2;
LABEL_11:
      _os_log_error_impl(&dword_1874E4000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    }

+ (id)appCacheWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 userManagedAssetsURL:(id)a6 personaUniqueString:(id)a7 cacheDeleteVolume:(id)a8 isDataseparated:(BOOL)a9 isPlaceholder:(BOOL)a10 isPlugin:(BOOL)a11 telemetry:(id)a12
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a12;
  if (!v18)
  {
    CDGetLogHandle((uint64_t)"client");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v28 = "AppCache: identifier is required";
LABEL_10:
      uint32_t v29 = v26;
      uint32_t v30 = 2;
LABEL_11:
      _os_log_error_impl(&dword_1874E4000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    }

- (void)addBundleRecord:(id)a3
{
  id v10 = a3;
  -[AppCache bundleRecords](self, "bundleRecords");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v4 containsObject:v10];

  if ((v5 & 1) == 0)
  {
    -[AppCache dataContainerURL](self, "dataContainerURL");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 dataContainerURL];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = [v6 isEqual:v7];

    if (v8)
    {
      v9 = -[AppCache bundleRecords](self, "bundleRecords");
      [v9 addObject:v10];
    }
  }
}

- (void)addBundleRecords:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[AppCache addBundleRecord:](self, "addBundleRecord:", *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (int)urgency
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = urgencyForDate(v2);

  return v3;
}

- (id)cachePath
{
  v2 = (void *)NSString;
  id v3 = -[AppCache dataContainerURL](self, "dataContainerURL");
  objc_msgSend(v2, "stringWithUTF8String:", objc_msgSend(v3, "fileSystemRepresentation"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByAppendingPathComponent:@"Library/Caches"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tmpPath
{
  v2 = (void *)NSString;
  id v3 = -[AppCache dataContainerURL](self, "dataContainerURL");
  objc_msgSend(v2, "stringWithUTF8String:", objc_msgSend(v3, "fileSystemRepresentation"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByAppendingPathComponent:@"tmp"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)invalidate
{
}

- (BOOL)validate
{
  id v3 = -[AppCache cachePath](self, "cachePath");
  int v4 = access((const char *)[v3 UTF8String], 0);

  BOOL result = 0;
  if (!v4)
  {
    -[AppCache timestamp](self, "timestamp");
    uint64_t v6 = (void *)MEMORY[0x189603F50];
    -[AppCache timestamp](self, "timestamp");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = validateTimestamp(v7, 3600.0);

    if (v8)
    {
      cdVol = self->_cdVol;
      -[AppCache lastKnownFreespace](self, "lastKnownFreespace");
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(cdVol) = -[CacheDeleteVolume freespaceIsStale:]( cdVol,  "freespaceIsStale:",  [v10 unsignedLongLongValue]);

      return cdVol ^ 1;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (int64_t)three_days_ago
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v6.tv_sec = 0LL;
  *(void *)&v6.tv_usec = 0LL;
  if (gettimeofday(&v6, 0LL))
  {
    CDGetLogHandle((uint64_t)"client");
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = __error();
      uint64_t v5 = strerror(*v4);
      *(_DWORD *)buf = 136315138;
      BOOL v8 = v5;
      _os_log_error_impl(&dword_1874E4000, v2, OS_LOG_TYPE_ERROR, "gettimeofday failed: %s", buf, 0xCu);
    }
  }

  return v6.tv_sec - 259200;
}

- (unint64_t)groupCache:(BOOL)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (a3 || !-[AppCache validate](self, "validate"))
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    -[AppCache bundleRecords](self, "bundleRecords");
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    id v23 = self;
    unint64_t v7 = 0LL;
    if (v26)
    {
      uint64_t v25 = *(void *)v33;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = v8;
          uint64_t v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          [v9 groupContainerURLs];
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v29;
            do
            {
              uint64_t v14 = 0LL;
              do
              {
                if (*(void *)v29 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * v14);
                [v9 groupContainerURLs];
                id v16 = (void *)objc_claimAutoreleasedReturnValue();
                [v16 objectForKeyedSubscript:v15];
                id v17 = (void *)objc_claimAutoreleasedReturnValue();

                id v18 = (void *)NSString;
                id v19 = v17;
                objc_msgSend(v18, "stringWithUTF8String:", objc_msgSend(v19, "fileSystemRepresentation"));
                id v20 = (void *)objc_claimAutoreleasedReturnValue();
                [v20 stringByAppendingPathComponent:@"Library/Caches"];
                id v21 = (void *)objc_claimAutoreleasedReturnValue();

                v7 += did_fast_size_directory(v21, 0LL);
                ++v14;
              }

              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }

            while (v12);
          }

          uint64_t v8 = v27 + 1;
        }

        while (v27 + 1 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }

      while (v26);
    }

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v7];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppCache setLastKnownGroupCacheSize:](v23, "setLastKnownGroupCacheSize:", v22);

    return v7;
  }

  else
  {
    -[AppCache lastKnownGroupCacheSize](self, "lastKnownGroupCacheSize");
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v5 = [v4 unsignedLongLongValue];

    return v5;
  }

- (unint64_t)tmp:(BOOL)a3 purge:(BOOL)a4 all:(BOOL)a5
{
  unint64_t v5 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  if (a5)
  {
    if (!a3 && !a4) {
      -[AppCache validate](self, "validate");
    }
    -[AppCache tmpPath](self, "tmpPath");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __26__AppCache_tmp_purge_all___block_invoke;
    v12[3] = &unk_18A066598;
    BOOL v13 = a5;
    BOOL v14 = a4;
    v12[4] = self;
    v12[5] = &v15;
    traverse_dir_with_state(v9, 0LL, 0LL, v12);

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v16[3]];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppCache setLastKnownTmpSize:](self, "setLastKnownTmpSize:", v10);

    unint64_t v5 = v16[3];
  }

  _Block_object_dispose(&v15, 8);
  return v5;
}

uint64_t __26__AppCache_tmp_purge_all___block_invoke(uint64_t a1, char *a2, uint64_t a3)
{
  if (*(_BYTE *)a3)
  {
    *(_BYTE *)(a3 + 1) = 1;
  }

  else if (*(_BYTE *)(a1 + 48) || (uint64_t v6 = *(void *)(a3 + 48), v6 < objc_msgSend(*(id *)(a1 + 32), "three_days_ago")))
  {
    if (*(_BYTE *)(a1 + 49)) {
      unlink(a2);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += *(void *)(a3 + 8);
  }

  return 1LL;
}

- (BOOL)moveCacheAside:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[AppCache cdVol](self, "cdVol");
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  discardedCachesPathForVolume(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  CDGetLogHandle((uint64_t)"client");
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 67109378;
    *(_DWORD *)__int128 v32 = 309;
    *(_WORD *)&v32[4] = 2112;
    *(void *)&v32[6] = v6;
    _os_log_impl(&dword_1874E4000, v7, OS_LOG_TYPE_DEFAULT, "%d parent discardedCachesPath: %@", (uint8_t *)&v31, 0x12u);
  }

  if (!v6)
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CacheDeleteVolume mountPoint](self->_cdVol, "mountPoint");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      int v31 = 138412290;
      *(void *)__int128 v32 = v24;
      _os_log_error_impl( &dword_1874E4000,  v15,  OS_LOG_TYPE_ERROR,  "AppCache moveCacheAside: Unable to create destination path for mount point: %@",  (uint8_t *)&v31,  0xCu);
    }

    id v8 = 0LL;
    goto LABEL_19;
  }

  id v8 = v6;
  if (mkdir((const char *)[v8 UTF8String], 0x1C0u) && *__error() != 17)
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_19:
      BOOL v21 = 0;
      goto LABEL_20;
    }

- (unint64_t)caches:(BOOL)a3 purge:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (a3)
  {
LABEL_16:
    uint64_t v26 = (void *)MEMORY[0x189607968];
    id v27 = -[AppCache cachePath](self, "cachePath");
    objc_msgSend(v26, "numberWithUnsignedLongLong:", size_dir((const char *)objc_msgSend(v27, "UTF8String")));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppCache setLastKnownCacheSize:](self, "setLastKnownCacheSize:", v28);

    [MEMORY[0x189603F50] date];
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 timeIntervalSinceReferenceDate];
    -[AppCache setTimestamp:](self, "setTimestamp:");

    if (v4) {
      goto LABEL_5;
    }
LABEL_17:
    -[AppCache lastKnownCacheSize](self, "lastKnownCacheSize");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v23 = [v25 unsignedLongLongValue];
    goto LABEL_18;
  }

  -[AppCache lastKnownCacheSize](self, "lastKnownCacheSize");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v6 unsignedLongLongValue])
  {

    goto LABEL_16;
  }

  BOOL v7 = -[AppCache validate](self, "validate");

  if (!v7) {
    goto LABEL_16;
  }
  if (!v4) {
    goto LABEL_17;
  }
LABEL_5:
  CDGetLogHandle((uint64_t)"client");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AppCache identifier](self, "identifier");
    uint64_t v9 = (char *)objc_claimAutoreleasedReturnValue();
    -[AppCache lastKnownCacheSize](self, "lastKnownCacheSize");
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = (void *)MEMORY[0x189603F50];
    -[AppCache timestamp](self, "timestamp");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v35 = 67109890;
    int v36 = 363;
    __int16 v37 = 2112;
    uint64_t v38 = v9;
    __int16 v39 = 2112;
    unint64_t v40 = (unint64_t)v10;
    __int16 v41 = 2112;
    v42 = v12;
    _os_log_impl( &dword_1874E4000,  v8,  OS_LOG_TYPE_DEFAULT,  "%d %@ purging cache, self.lastKnownCacheSize: %@ at %@",  (uint8_t *)&v35,  0x26u);
  }

  -[AppCache cachePath](self, "cachePath");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v14 = -[AppCache moveCacheAside:](self, "moveCacheAside:", v13);

  if (!v14)
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[AppCache identifier](self, "identifier");
      id v16 = (char *)objc_claimAutoreleasedReturnValue();
      int v35 = 67109378;
      int v36 = 365;
      __int16 v37 = 2112;
      uint64_t v38 = v16;
      _os_log_impl( &dword_1874E4000,  v15,  OS_LOG_TYPE_DEFAULT,  "%d %@ Unable to move aside cache, clearing in place",  (uint8_t *)&v35,  0x12u);
    }

    id v17 = -[AppCache cachePath](self, "cachePath");
    nuke_dir((const char *)[v17 UTF8String], 1);
  }

  id v18 = -[AppCache cachePath](self, "cachePath");
  unint64_t v19 = size_dir((const char *)[v18 UTF8String]);

  -[AppCache lastKnownCacheSize](self, "lastKnownCacheSize");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v21 = [v20 unsignedLongLongValue];

  if (v21 <= v19)
  {
    unint64_t v23 = 0LL;
  }

  else
  {
    -[AppCache lastKnownCacheSize](self, "lastKnownCacheSize");
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v23 = [v22 unsignedLongLongValue] - v19;
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:v19];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppCache setLastKnownCacheSize:](self, "setLastKnownCacheSize:", v24);

  [MEMORY[0x189603F50] date];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 timeIntervalSinceReferenceDate];
  -[AppCache setTimestamp:](self, "setTimestamp:");
LABEL_18:

  -[AppCache telemetry](self, "telemetry");
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    CDGetLogHandle((uint64_t)"client");
    int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        __int128 v32 = " purge";
      }
      else {
        __int128 v32 = "";
      }
      -[AppCache cachePath](self, "cachePath");
      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();
      int v35 = 67109890;
      int v36 = 380;
      __int16 v37 = 2080;
      uint64_t v38 = v32;
      __int16 v39 = 2048;
      unint64_t v40 = v23;
      __int16 v41 = 2112;
      v42 = v33;
      _os_log_impl(&dword_1874E4000, v31, OS_LOG_TYPE_DEFAULT, "%d%s caches result: %llu on %@", (uint8_t *)&v35, 0x26u);
    }
  }

  return v23;
}

- (unint64_t)clearCaches:(BOOL)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v29 = 0LL;
  __int128 v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  BOOL v4 = (void *)objc_opt_new();
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  -[AppCache bundleRecords](self, "bundleRecords");
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v9 bundleIdentifier];
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          [v9 bundleIdentifier];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v11];
        }
      }

      uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }

    while (v6);
  }

  uint64_t v12 = 0LL;
  int v13 = -3;
  *(void *)&__int128 v14 = 138412290LL;
  __int128 v21 = v14;
  do
  {
    -[AppCache telemetry](self, "telemetry", v21);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __24__AppCache_clearCaches___block_invoke;
    v23[3] = &unk_18A0665C0;
    v23[4] = self;
    v23[5] = &v29;
    BOOL v24 = a3;
    assert_group_cache_deletion(v15, v4, v23, &__block_literal_global_9);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    CDGetLogHandle((uint64_t)"client");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v21;
      __int128 v34 = v16;
      _os_log_impl( &dword_1874E4000,  v17,  OS_LOG_TYPE_DEFAULT,  "clearCaches assert_group_cache_deletion retryIDs: %@",  buf,  0xCu);
    }

    if (__CFADD__(v13++, 1)) {
      break;
    }
    uint64_t v12 = v16;
  }

  while ([v16 count]);
  unint64_t v19 = v30[3];

  _Block_object_dispose(&v29, 8);
  return v19;
}

void __24__AppCache_clearCaches___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) caches:0 purge:1];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [*(id *)(a1 + 32) tmp:0 purge:1 all:*(unsigned __int8 *)(a1 + 48)];
  CDGetLogHandle((uint64_t)"client");
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    [*(id *)(a1 + 32) identifier];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) cachePath];
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = 67109890;
    v6[1] = 402;
    __int16 v7 = 2048;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    __int128 v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl( &dword_1874E4000,  v2,  OS_LOG_TYPE_DEFAULT,  "%d clearCaches result: %llu for %@ on %@",  (uint8_t *)v6,  0x26u);
  }
}

void __24__AppCache_clearCaches___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  CDGetLogHandle((uint64_t)"client");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_error_impl( &dword_1874E4000,  v6,  OS_LOG_TYPE_ERROR,  "AppCache clearCaches: Unable to clear caches for %@ : %@",  (uint8_t *)&v7,  0x16u);
  }
}

+ (void)enumerateWithContainerQuery:(id)a3 container_class:(unint64_t)a4 options:(int)a5 telemetry:(id)a6 block:(id)a7
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a6;
  id v11 = a7;
  uint64_t v12 = (void *)MEMORY[0x1895A73EC]();
  if (container_query_create())
  {
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    id v18 = v9;
    id v19 = v10;
    id v20 = v11;
    int iterate_results_sync = container_query_iterate_results_sync();
    container_query_get_last_error();
    __int128 v14 = (void *)container_error_copy_unlocalized_description();
    CDGetLogHandle((uint64_t)"client");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v16 = v15;
    if (iterate_results_sync)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = v14;
        _os_log_debug_impl( &dword_1874E4000,  v16,  OS_LOG_TYPE_DEBUG,  "container_query_iterate_results_sync succeeded; %s",
          buf,
          0xCu);
      }
    }

    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = v14;
      _os_log_error_impl( &dword_1874E4000,  v16,  OS_LOG_TYPE_ERROR,  "container_query_iterate_results_sync failed; %s",
        buf,
        0xCu);
    }

    free(v14);
    container_query_free();

    id v17 = (os_log_s *)&unk_18A06C0E0;
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1874E4000, v17, OS_LOG_TYPE_DEFAULT, "container_query_create failed", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v12);
}

uint64_t __80__AppCache_enumerateWithContainerQuery_container_class_options_telemetry_block___block_invoke( uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  v2 = (void *)MEMORY[0x1895A73EC]();
  uint64_t path = container_get_path();
  CDGetLogHandle((uint64_t)"client");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (path)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v44 = path;
      _os_log_impl(&dword_1874E4000, v4, OS_LOG_TYPE_DEFAULT, "path: %s\n", buf, 0xCu);
    }

    [NSString stringWithUTF8String:container_get_identifier()];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t persona_unique_string = container_get_persona_unique_string();
    if (persona_unique_string)
    {
      [NSString stringWithUTF8String:persona_unique_string];
      int v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      int v7 = 0LL;
    }

    id v41 = 0LL;
    [MEMORY[0x189605760] bundleRecordWithBundleIdentifier:v4 allowPlaceholder:1 error:&v41];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v41;
    id v10 = v9;
    if (!v8 || v9)
    {
      CDGetLogHandle((uint64_t)"client");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v44 = (uint64_t)v4;
        __int16 v45 = 2112;
        v46 = v10;
        _os_log_error_impl( &dword_1874E4000,  v11,  OS_LOG_TYPE_ERROR,  "Unable to create an LSBundleRecord for %@ : %@",  buf,  0x16u);
      }

      goto LABEL_17;
    }

    [v8 UIBackgroundModes];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if ((-[os_log_s containsObject:](v11, "containsObject:", @"continuous") & 1) == 0)
    {
      [v8 bundleIdentifier];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      int v35 = v7;
      uint64_t v36 = v2;
      if ((objc_opt_isKindOfClass() & 1) != 0 || *(void *)(a1 + 64) == 3LL)
      {
        [v8 containingBundleRecord];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 bundleIdentifier];
        v15 = uint64_t v14 = a1;

        char v32 = 1;
        uint64_t v12 = (void *)v15;
        a1 = v14;
      }

      else
      {
        char v32 = 0;
      }

      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      uint64_t v34 = a1;
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0LL; i != v18; ++i)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v16);
            }
            if ([v12 containsString:*(void *)(*((void *)&v37 + 1) + 8 * i)])
            {
              CDGetLogHandle((uint64_t)"client");
              __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                [v8 bundleIdentifier];
                id v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                uint64_t v44 = (uint64_t)v22;
                _os_log_impl(&dword_1874E4000, v21, OS_LOG_TYPE_DEFAULT, "skipping excluded App %@", buf, 0xCu);
              }

              int v7 = v35;
              v2 = v36;
              goto LABEL_32;
            }
          }

          uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        char v31 = [v8 isPlaceholder];
      }
      else {
        char v31 = 0;
      }
      int v7 = v35;
      v2 = v36;
      [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:path isDirectory:1 relativeToURL:0];
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v24 = 0LL;
      if ((*(_BYTE *)(v34 + 72) & 2) == 0) {
        goto LABEL_40;
      }
      user_managed_assets_relative_uint64_t path = container_get_user_managed_assets_relative_path();
      if (user_managed_assets_relative_path)
      {
        [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:user_managed_assets_relative_path isDirectory:1 relativeToURL:v16];
        BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:
        if (v16)
        {
          __int128 v26 = v24;
          [MEMORY[0x189604010] setWithObject:v8];
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
          BYTE2(v30) = v32;
          BYTE1(v30) = v31;
          LOBYTE(v30) = 0;
          __int16 v33 = v26;
          +[AppCache appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:isDataseparated:isPlaceholder:isPlugin:telemetry:]( &OBJC_CLASS___AppCache,  "appCacheWithRecords:identifier:dataContainerURL:userManagedAssetsURL:personaUniqueString:cacheDeleteVolume:i sDataseparated:isPlaceholder:isPlugin:telemetry:",  v27,  v4,  v16,  v26,  v35,  *(void *)(v34 + 40),  v30,  *(void *)(v34 + 48));
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            (*(void (**)(void))(*(void *)(v34 + 56) + 16LL))();
          }

          else
          {
            CDGetLogHandle((uint64_t)"client");
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v44 = (uint64_t)v8;
              _os_log_error_impl( &dword_1874E4000,  v29,  OS_LOG_TYPE_ERROR,  "Unable to create AppCache for %@",  buf,  0xCu);
            }
          }

          BOOL v24 = v33;
        }

        id v10 = 0LL;
LABEL_17:

LABEL_34:
        goto LABEL_35;
      }

      CDGetLogHandle((uint64_t)"client");
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = (uint64_t)v4;
        _os_log_debug_impl( &dword_1874E4000,  v21,  OS_LOG_TYPE_DEBUG,  "%@ does not have a user managed assets path, skipping",  buf,  0xCu);
      }

+ (void)enumerateAppCachesOnVolume:(id)a3 options:(int)a4 telemetry:(id)a5 block:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x1895A73EC]();
  getRootVolume();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a1, "enumerateWithContainerQuery:container_class:options:telemetry:block:", v10, 2, v8, v11, v12);
    if ((v8 & 1) != 0) {
      objc_msgSend(a1, "enumerateWithContainerQuery:container_class:options:telemetry:block:", v10, 4, v8, v11, v12);
    }
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v16 = 0;
      _os_log_error_impl(&dword_1874E4000, v15, OS_LOG_TYPE_ERROR, "No root volume, unable to enumerate apps!", v16, 2u);
    }
  }

  objc_autoreleasePoolPop(v13);
}

+ (void)enumerateGroupCachesOnVolume:(id)a3 block:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1895A73EC]();
  getRootVolume();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    uint64_t v9 = container_query_create();
    uint64_t v10 = v9;
    if (v5)
    {
      id v24 = v6;
      id v11 = v7;
      empty = xpc_array_create_empty();
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      id v13 = v5;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            xpc_object_t v18 = xpc_string_create((const char *)[*(id *)(*((void *)&v26 + 1) + 8 * i) UTF8String]);
            xpc_array_append_value(empty, v18);
          }

          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }

        while (v15);
      }

      int v7 = v11;
      id v6 = v24;
      if (v10) {
        goto LABEL_11;
      }
    }

    else
    {
      empty = 0LL;
      if (v9)
      {
LABEL_11:
        container_query_set_class();
        container_query_operation_set_flags();
        if (empty) {
          container_query_set_group_identifiers();
        }
        container_query_set_include_other_owners();
        id v25 = v6;
        int iterate_results_sync = container_query_iterate_results_sync();
        container_query_get_last_error();
        id v20 = (void *)container_error_copy_unlocalized_description();
        CDGetLogHandle((uint64_t)"client");
        __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v22 = v21;
        if (iterate_results_sync)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            char v31 = v20;
            _os_log_debug_impl( &dword_1874E4000,  v22,  OS_LOG_TYPE_DEBUG,  "container_query_iterate_results_sync succeeded; %s",
              buf,
              0xCu);
          }
        }

        else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          char v31 = v20;
          _os_log_error_impl( &dword_1874E4000,  v22,  OS_LOG_TYPE_ERROR,  "container_query_iterate_results_sync failed; %s",
            buf,
            0xCu);
        }

        free(v20);
        container_query_free();
        uint64_t v23 = v25;
LABEL_24:

        goto LABEL_25;
      }
    }

    CDGetLogHandle((uint64_t)"client");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1874E4000, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "container_query_create failed", buf, 2u);
    }

    goto LABEL_24;
  }

  CDGetLogHandle((uint64_t)"client");
  empty = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)empty, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( &dword_1874E4000,  (os_log_t)empty,  OS_LOG_TYPE_ERROR,  "No root volume, unable to enumerate apps!",  buf,  2u);
  }

uint64_t __47__AppCache_enumerateGroupCachesOnVolume_block___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t path = container_get_path();
  if (path)
  {
    uint64_t v3 = path;
    CDGetLogHandle((uint64_t)"client");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      uint64_t v14 = v3;
      _os_log_debug_impl(&dword_1874E4000, v4, OS_LOG_TYPE_DEBUG, "group path: %s\n", (uint8_t *)&v13, 0xCu);
    }

    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v3 isDirectory:1 relativeToURL:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = (void *)NSString;
    id v7 = v5;
    objc_msgSend(v6, "stringWithUTF8String:", objc_msgSend(v7, "fileSystemRepresentation"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringByAppendingPathComponent:@"Library/Caches"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    id v10 = v9;
    if (size_dir((const char *)[v10 UTF8String]))
    {
      [NSString stringWithUTF8String:container_get_identifier()];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }

  return 1LL;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableSet)bundleRecords
{
  return self->_bundleRecords;
}

- (void)setBundleRecords:(id)a3
{
}

- (CacheDeleteVolume)cdVol
{
  return self->_cdVol;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isDataseparated
{
  return self->_isDataseparated;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isPlugin
{
  return self->_isPlugin;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (NSURL)userManagedAssetsURL
{
  return self->_userManagedAssetsURL;
}

- (NSNumber)lastKnownCacheSize
{
  return self->_lastKnownCacheSize;
}

- (void)setLastKnownCacheSize:(id)a3
{
}

- (NSNumber)lastKnownGroupCacheSize
{
  return self->_lastKnownGroupCacheSize;
}

- (void)setLastKnownGroupCacheSize:(id)a3
{
}

- (NSNumber)lastKnownTmpSize
{
  return self->_lastKnownTmpSize;
}

- (void)setLastKnownTmpSize:(id)a3
{
}

- (NSNumber)lastKnownFreespace
{
  return self->_lastKnownFreespace;
}

- (void)setLastKnownFreespace:(id)a3
{
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (TestTelemetry)telemetry
{
  return self->_telemetry;
}

- (void)setTelemetry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end