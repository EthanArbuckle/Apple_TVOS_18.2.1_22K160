@interface SAAppPath
+ (BOOL)isValidAppPathPlist:(id)a3 writersID:(id)a4 uniquePaths:(id)a5 sharedPaths:(id)a6;
+ (BOOL)isValidAppPathPlistArray:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validatePaths:(id)a3;
+ (SAAppPath)appPathWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 personaUniqueString:(id)a6 isDataSeparated:(BOOL)a7 isPlugin:(BOOL)a8 isGroup:(BOOL)a9;
+ (id)newFromPlist:(id)a3;
- (BOOL)forceHidden;
- (BOOL)forceVisible;
- (BOOL)isAppUserVisible;
- (BOOL)isDataSeparated;
- (BOOL)isGroup;
- (BOOL)isPlugin;
- (BOOL)isUserVisible;
- (BOOL)validate;
- (NSDate)lastUsed;
- (NSMutableArray)binaryURLs;
- (NSMutableSet)bundleRecords;
- (NSMutableSet)sharedURLs;
- (NSMutableSet)uniqueURLs;
- (NSMutableSet)writersIDs;
- (NSNumber)_isUserVisible;
- (NSNumber)lastKnownAppCacheSize;
- (NSNumber)lastKnownTmpSize;
- (NSString)cacheVolumePath;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)dataContainerURL;
- (SAAppPath)init;
- (SAAppPath)initWithBundleID:(id)a3;
- (SAAppPath)initWithBundleID:(id)a3 writersIDs:(id)a4 uniqueURLs:(id)a5 sharedURLs:(id)a6;
- (SAAppPath)initWithBundleRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 personaUniqueString:(id)a6 isDataSeparated:(BOOL)a7 isPlugin:(BOOL)a8 isGroup:(BOOL)a9;
- (SAAppPath)initWithCoder:(id)a3;
- (double)timestamp;
- (id)appRecord;
- (id)bundleSet;
- (id)cachePath;
- (id)getDictionary;
- (id)tmpPath;
- (int)urgency;
- (int64_t)threeDaysAgo;
- (unint64_t)cacheDeletePluginSize;
- (unint64_t)cacheDirStatsID;
- (unint64_t)dirstatsCloneSize:(BOOL)a3;
- (unint64_t)dirstatsPhysicalSize:(BOOL)a3;
- (unint64_t)dirstatsPurgeableSize:(BOOL)a3;
- (unint64_t)getAppCacheSize:(BOOL)a3;
- (unint64_t)tempSize:(BOOL)a3;
- (void)addBundleRecord:(id)a3;
- (void)addBundleRecords:(id)a3;
- (void)addSharedURL:(id)a3;
- (void)addUniqueURL:(id)a3;
- (void)addWriterId:(id)a3;
- (void)enableDirStats;
- (void)encodeWithCoder:(id)a3;
- (void)extendWithPropertiesFromAppPath:(id)a3;
- (void)removeSharedURL:(id)a3;
- (void)removeUniqueURL:(id)a3;
- (void)setBinaryURLs:(id)a3;
- (void)setBundleRecords:(id)a3;
- (void)setCacheDeletePluginSize:(unint64_t)a3;
- (void)setCacheDirStatsID:(unint64_t)a3;
- (void)setCacheVolumePath:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastKnownAppCacheSize:(id)a3;
- (void)setLastKnownTmpSize:(id)a3;
- (void)setLastUsed:(id)a3;
- (void)setPersonaUniqueString:(id)a3;
- (void)setSharedURLs:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setUniqueURLs:(id)a3;
- (void)setWritersIDs:(id)a3;
- (void)set_isUserVisible:(id)a3;
@end

@implementation SAAppPath

- (SAAppPath)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SAAppPath;
  v2 = -[SAAppPath init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    identifier = v2->identifier;
    v2->identifier = 0LL;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    writersIDs = v3->writersIDs;
    v3->writersIDs = (NSMutableSet *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    uniqueURLs = v3->uniqueURLs;
    v3->uniqueURLs = (NSMutableSet *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    sharedURLs = v3->sharedURLs;
    v3->sharedURLs = (NSMutableSet *)v9;
  }

  return v3;
}

- (SAAppPath)initWithBundleID:(id)a3
{
  id v5 = a3;
  v6 = -[SAAppPath init](self, "init");
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->identifier, a3);
  }

  return v7;
}

- (SAAppPath)initWithBundleID:(id)a3 writersIDs:(id)a4 uniqueURLs:(id)a5 sharedURLs:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SAAppPath;
  v15 = -[SAAppPath init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->identifier, a3);
    objc_storeStrong((id *)&v16->writersIDs, a4);
    objc_storeStrong((id *)&v16->uniqueURLs, a5);
    objc_storeStrong((id *)&v16->sharedURLs, a6);
  }

  return v16;
}

+ (BOOL)isValidAppPathPlistArray:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v3, v4);
    if ((isKindOfClass & 1) != 0)
    {
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v6 = v3;
      id v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v34;
        while (2)
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v34 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
            uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
            uint64_t v13 = objc_opt_isKindOfClass(v11, v12);
            if ((v13 & 1) == 0)
            {
              uint64_t v23 = SALog(v13);
              v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                sub_10002F88C(v24, v25, v26, v27, v28, v29, v30, v31);
              }

              goto LABEL_18;
            }
          }

          id v8 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
          BOOL v14 = 1;
          if (v8) {
            continue;
          }
          break;
        }
      }

      else
      {
        BOOL v14 = 1;
      }
    }

    else
    {
      uint64_t v15 = SALog(isKindOfClass);
      id v6 = (id)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
        sub_10002F8FC((os_log_s *)v6, v16, v17, v18, v19, v20, v21, v22);
      }
LABEL_18:
      BOOL v14 = 0;
    }
  }

  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

+ (BOOL)isValidAppPathPlist:(id)a3 writersID:(id)a4 uniquePaths:(id)a5 sharedPaths:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  if (!v9)
  {
    uint64_t v20 = SALog(v12);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002F96C();
    }
    goto LABEL_20;
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v9, v14);
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v22 = SALog(isKindOfClass);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002FA1C();
    }
    goto LABEL_20;
  }

  if (v10)
  {
    BOOL v16 = +[SAAppPath isValidAppPathPlistArray:](&OBJC_CLASS___SAAppPath, "isValidAppPathPlistArray:", v10);
    if (!v16)
    {
      uint64_t v23 = SALog(v16);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10002F9F0();
      }
      goto LABEL_20;
    }
  }

  if (v11)
  {
    BOOL v17 = +[SAAppPath isValidAppPathPlistArray:](&OBJC_CLASS___SAAppPath, "isValidAppPathPlistArray:", v11);
    if (!v17)
    {
      uint64_t v24 = SALog(v17);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10002F9C4();
      }
      goto LABEL_20;
    }
  }

  if (v13)
  {
    BOOL v18 = +[SAAppPath isValidAppPathPlistArray:](&OBJC_CLASS___SAAppPath, "isValidAppPathPlistArray:", v13);
    if (!v18)
    {
      uint64_t v25 = SALog(v18);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10002F998();
      }
LABEL_20:

      BOOL v19 = 0;
      goto LABEL_21;
    }
  }

  BOOL v19 = 1;
LABEL_21:

  return v19;
}

+ (BOOL)validatePaths:(id)a3
{
  id v3 = a3;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (!v4)
  {
    char v8 = 1;
    goto LABEL_25;
  }

  id v6 = v4;
  uint64_t v7 = *(void *)v26;
  char v8 = 1;
  *(void *)&__int128 v5 = 138412290LL;
  __int128 v24 = v5;
  do
  {
    id v9 = 0LL;
    do
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v9);
      id v11 = objc_msgSend(v10, "hasPrefix:", @"~", v24);
      if ((_DWORD)v11)
      {
        uint64_t v12 = SALog(v11);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v24;
          uint64_t v30 = v10;
          uint64_t v14 = v13;
          uint64_t v15 = "Invalid path (%@) - '~' is not resolved.";
          goto LABEL_21;
        }

        goto LABEL_14;
      }

      id v16 = [v10 hasPrefix:@"/"];
      if ((v16 & 1) == 0)
      {
        uint64_t v19 = SALog(v16);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v24;
          uint64_t v30 = v10;
          uint64_t v14 = v13;
          uint64_t v15 = "Invalid path (%@) - the provided path is relative, must provide an absolute path.";
LABEL_21:
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
        }

+ (id)newFromPlist:(id)a3
{
  id v4 = a3;
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  id v10 = [v7 fileExistsAtPath:v4];
  if (!(_DWORD)v10
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 pathExtension]),
        unsigned __int8 v12 = [v11 isEqual:@"plist"],
        v11,
        (v12 & 1) == 0))
  {
    uint64_t v56 = SALog(v10);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002FC6C();
    }
    goto LABEL_61;
  }

  v72 = (objc_class *)a1;
  id v88 = 0LL;
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v4,  2LL,  &v88));
  id v14 = v88;
  uint64_t v15 = v14;
  if (v14 || !v13)
  {
    uint64_t v57 = SALog(v14);
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_10002FA7C();
    }

    goto LABEL_60;
  }

  id v87 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v13,  0LL,  0LL,  &v87));
  id v17 = v87;
  uint64_t v15 = v17;
  if (v17 || !v16)
  {
    uint64_t v59 = SALog(v17);
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      sub_10002FAE4();
    }

LABEL_60:
LABEL_61:
    v55 = 0LL;
    goto LABEL_62;
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_OWNER"]);
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_WRITERS"]);

  uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_PATHS"]);
  __int128 v5 = (void *)v19;
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_SHARED"]);

  id v6 = (void *)v20;
  v70 = (void *)v18;
  BOOL v21 = +[SAAppPath isValidAppPathPlist:writersID:uniquePaths:sharedPaths:]( &OBJC_CLASS___SAAppPath,  "isValidAppPathPlist:writersID:uniquePaths:sharedPaths:");
  if (v21)
  {
    v65 = v16;
    v66 = v13;
    id v67 = v4;
    v68 = (void *)v20;
    v64 = v5;
    id v22 = v71;
    v69 = v7;
    if (v5)
    {
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      id v23 = v5;
      id v24 = [v23 countByEnumeratingWithState:&v83 objects:v91 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v84;
        do
        {
          for (i = 0LL; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v84 != v26) {
              objc_enumerationMutation(v23);
            }
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  *(void *)(*((void *)&v83 + 1) + 8LL * (void)i),  1LL));
            if (v28)
            {
              uint64_t v29 = objc_claimAutoreleasedReturnValue(+[SASupport getResolvedURL:](&OBJC_CLASS___SASupport, "getResolvedURL:", v28));
              uint64_t v30 = (void *)v29;
              if (v29) {
                uint64_t v31 = (void *)v29;
              }
              else {
                uint64_t v31 = v28;
              }
              id v32 = v31;

              [v74 addObject:v32];
            }
          }

          id v25 = [v23 countByEnumeratingWithState:&v83 objects:v91 count:16];
        }

        while (v25);
      }

      id v6 = v68;
      uint64_t v7 = v69;
      id v22 = v71;
    }

    if (v6)
    {
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      id v33 = v6;
      id v34 = [v33 countByEnumeratingWithState:&v79 objects:v90 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v80;
        do
        {
          for (j = 0LL; j != v35; j = (char *)j + 1)
          {
            if (*(void *)v80 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  *(void *)(*((void *)&v79 + 1) + 8LL * (void)j),  1LL));
            if (v38)
            {
              uint64_t v39 = objc_claimAutoreleasedReturnValue(+[SASupport getResolvedURL:](&OBJC_CLASS___SASupport, "getResolvedURL:", v38));
              v40 = (void *)v39;
              if (v39) {
                v41 = (void *)v39;
              }
              else {
                v41 = v38;
              }
              id v42 = v41;

              [v73 addObject:v42];
            }
          }

          id v35 = [v33 countByEnumeratingWithState:&v79 objects:v90 count:16];
        }

        while (v35);
      }

      id v6 = v68;
      uint64_t v7 = v69;
      id v22 = v71;
    }

    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    id v9 = v70;
    id v43 = [v9 countByEnumeratingWithState:&v75 objects:v89 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v76;
      do
      {
        for (k = 0LL; k != v44; k = (char *)k + 1)
        {
          if (*(void *)v76 != v45) {
            objc_enumerationMutation(v9);
          }
          [v8 addObject:*(void *)(*((void *)&v75 + 1) + 8 * (void)k)];
        }

        id v44 = [v9 countByEnumeratingWithState:&v75 objects:v89 count:16];
      }

      while (v44);
    }

    __int128 v5 = v64;
    id v47 = -[objc_class validatePaths:](v72, "validatePaths:", v64);
    uint64_t v13 = v66;
    id v4 = v67;
    if ((v47 & 1) == 0)
    {
      uint64_t v48 = SALog(v47);
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_10002FBAC();
      }
    }

    id v50 = -[objc_class validatePaths:](v72, "validatePaths:", v6);
    if ((v50 & 1) == 0)
    {
      uint64_t v51 = SALog(v50);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_10002FB4C();
      }
    }

    id v53 = [[v72 alloc] initWithBundleID:v22 writersIDs:v8 uniqueURLs:v74 sharedURLs:v73];
    v54 = v22;
    v55 = v53;
  }

  else
  {
    uint64_t v62 = SALog(v21);
    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      sub_10002FC0C();
    }

    v55 = 0LL;
    id v9 = v70;
  }

- (void)addUniqueURL:(id)a3
{
}

- (void)addSharedURL:(id)a3
{
}

- (void)addWriterId:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath writersIDs](self, "writersIDs"));
  unsigned __int8 v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath writersIDs](self, "writersIDs"));
    [v6 addObject:v7];
  }
}

- (void)removeUniqueURL:(id)a3
{
}

- (void)removeSharedURL:(id)a3
{
}

- (void)extendWithPropertiesFromAppPath:(id)a3
{
  id v27 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath writersIDs](self, "writersIDs"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v27 writersIDs]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  [v4 addObjectsFromArray:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath sharedURLs](self, "sharedURLs"));
  char v8 = (void *)objc_claimAutoreleasedReturnValue([v27 sharedURLs]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  [v7 addObjectsFromArray:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath uniqueURLs](self, "uniqueURLs"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v27 uniqueURLs]);
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
  [v10 addObjectsFromArray:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleRecords]);
  if (v13)
  {
    bundleRecords = self->_bundleRecords;
    if (!bundleRecords)
    {
      uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      id v16 = self->_bundleRecords;
      self->_bundleRecords = v15;

      bundleRecords = self->_bundleRecords;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleRecords]);
    -[NSMutableSet unionSet:](bundleRecords, "unionSet:", v17);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v27 binaryURLs]);

  if (v18)
  {
    binaryURLs = self->_binaryURLs;
    if (!binaryURLs)
    {
      uint64_t v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      BOOL v21 = self->_binaryURLs;
      self->_binaryURLs = v20;

      binaryURLs = self->_binaryURLs;
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v27 binaryURLs]);
    -[NSMutableArray addObjectsFromArray:](binaryURLs, "addObjectsFromArray:", v22);

    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", self->_binaryURLs));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allObjects]);
    id v25 = (NSMutableArray *)[v24 mutableCopy];
    uint64_t v26 = self->_binaryURLs;
    self->_binaryURLs = v25;
  }
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"bundleID"];
  [v5 encodeObject:self->writersIDs forKey:@"writersIDs"];
  [v5 encodeObject:self->uniqueURLs forKey:@"uniqueURLs"];
  [v5 encodeObject:self->sharedURLs forKey:@"sharedURLs"];
}

- (SAAppPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___SAAppPath;
  id v5 = -[SAAppPath init](&v28, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    identifier = v5->identifier;
    v5->identifier = (NSString *)v7;

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSSet);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v10,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"writersIDs"]);
    writersIDs = v5->writersIDs;
    v5->writersIDs = (NSMutableSet *)v13;

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSSet);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v15,  v16,  objc_opt_class(&OBJC_CLASS___NSURL),  0LL);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v18 forKey:@"uniqueURLs"]);
    uniqueURLs = v5->uniqueURLs;
    v5->uniqueURLs = (NSMutableSet *)v19;

    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSSet);
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v23 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v21,  v22,  objc_opt_class(&OBJC_CLASS___NSURL),  0LL);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v24 forKey:@"sharedURLs"]);
    sharedURLs = v5->sharedURLs;
    v5->sharedURLs = (NSMutableSet *)v25;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SAAppPath)initWithBundleRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 personaUniqueString:(id)a6 isDataSeparated:(BOOL)a7 isPlugin:(BOOL)a8 isGroup:(BOOL)a9
{
  id v13 = a3;
  id v97 = a4;
  id v95 = a5;
  id v92 = a6;
  id v96 = a6;
  v120.receiver = self;
  v120.super_class = (Class)&OBJC_CLASS___SAAppPath;
  id v14 = -[SAAppPath init](&v120, "init");
  uint64_t v15 = v14;
  if (!v14)
  {
LABEL_21:
    uint64_t v36 = 0LL;
    v37 = 0LL;
    v38 = v95;
    goto LABEL_63;
  }

  if (!v13 || !v97)
  {
    uint64_t v34 = SALog(v14);
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10002FCCC(v35);
    }

    goto LABEL_21;
  }

  p_dataContainerURL = (void **)&v14->_dataContainerURL;
  objc_storeStrong((id *)&v14->_dataContainerURL, a5);
  uint64_t v16 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  writersIDs = v15->writersIDs;
  v15->writersIDs = v16;

  uint64_t v18 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v19 = v13;
  p_uniqueURLs = (id *)&v15->uniqueURLs;
  uniqueURLs = v15->uniqueURLs;
  v15->uniqueURLs = v18;

  uint64_t v22 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  sharedURLs = v15->sharedURLs;
  v15->sharedURLs = v22;

  objc_storeStrong((id *)&v15->identifier, a4);
  v91 = v19;
  v90 = (void *)objc_claimAutoreleasedReturnValue([v19 anyObject]);
  if (v15->_dataContainerURL)
  {
    if (a9) {
      p_sharedURLs = (id *)&v15->sharedURLs;
    }
    else {
      p_sharedURLs = (id *)&v15->uniqueURLs;
    }
    objc_msgSend(*p_sharedURLs, "addObject:");
  }

  uint64_t v25 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  binaryURLs = v15->_binaryURLs;
  v15->_binaryURLs = v25;

  if (!a9)
  {
    __int128 v118 = 0uLL;
    __int128 v119 = 0uLL;
    __int128 v116 = 0uLL;
    __int128 v117 = 0uLL;
    id obj = v19;
    id v39 = [obj countByEnumeratingWithState:&v116 objects:v125 count:16];
    if (!v39) {
      goto LABEL_58;
    }
    id v40 = v39;
    uint64_t v41 = *(void *)v117;
    id v42 = &APFSOverProvModel_ptr;
    uint64_t v98 = *(void *)v117;
    while (1)
    {
      id v43 = 0LL;
      id v99 = v40;
      do
      {
        if (*(void *)v117 != v41) {
          objc_enumerationMutation(obj);
        }
        id v44 = *(void **)(*((void *)&v116 + 1) + 8LL * (void)v43);
        uint64_t v45 = objc_opt_class(v42[25]);
        if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
        {
          v46 = sub_1000124E8(v44);
          id v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
          uint64_t v48 = objc_claimAutoreleasedReturnValue([v47 allKeys]);
          id v49 = v44;
          uint64_t v50 = objc_claimAutoreleasedReturnValue([v49 bundleContainerURL]);
          if (v50) {
            goto LABEL_32;
          }
          id v51 = objc_claimAutoreleasedReturnValue([v49 executableURL]);
          id v52 = sub_1000126D4((const char *)[v51 fileSystemRepresentation]);
          uint64_t v50 = objc_claimAutoreleasedReturnValue(v52);

          uint64_t v54 = SALog(v53);
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v124 = v50;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEBUG,  "SAAppPath: Falling back to executable URL: %@",  buf,  0xCu);
          }

          if (v50)
          {
LABEL_32:
            id v105 = (id)v50;
            -[NSMutableArray addObject:](v15->_binaryURLs, "addObject:", v50);
            int v106 = 1;
          }

          else
          {
            int v106 = 0;
            id v105 = 0LL;
          }

          v101 = v49;
          v104 = v43;
          if (v48) {
            -[NSMutableSet addObjectsFromArray:](v15->writersIDs, "addObjectsFromArray:", v48);
          }
          v102 = (void *)v48;
          v103 = v47;
          __int128 v114 = 0u;
          __int128 v115 = 0u;
          __int128 v112 = 0u;
          __int128 v113 = 0u;
          id v107 = (id)objc_claimAutoreleasedReturnValue([v47 allValues]);
          id v56 = [v107 countByEnumeratingWithState:&v112 objects:v122 count:16];
          if (v56)
          {
            id v57 = v56;
            uint64_t v58 = *(void *)v113;
            do
            {
              for (i = 0LL; i != v57; i = (char *)i + 1)
              {
                if (*(void *)v113 != v58) {
                  objc_enumerationMutation(v107);
                }
                v60 = *(void **)(*((void *)&v112 + 1) + 8LL * (void)i);
                v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:@"CONTAINER_CLASS_APPLICATION"]);
                id v62 = sub_10000B140(v61);
                v63 = (void *)objc_claimAutoreleasedReturnValue(v62);

                if (v63)
                {
                  if ((-[NSMutableArray containsObject:](v15->_binaryURLs, "containsObject:", v63) & 1) == 0)
                  {
                    if (!v106) {
                      goto LABEL_44;
                    }
                    v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString, "stringWithUTF8String:", [v63 fileSystemRepresentation]));
                    v65 = p_uniqueURLs;
                    v66 = v15;
                    id v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString, "stringWithUTF8String:", [v105 fileSystemRepresentation]));
                    unsigned __int8 v68 = [v64 hasPrefix:v67];

                    uint64_t v15 = v66;
                    p_uniqueURLs = v65;

                    if ((v68 & 1) == 0) {
LABEL_44:
                    }
                      -[NSMutableArray addObject:](v15->_binaryURLs, "addObject:", v63);
                  }
                }

                v69 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:@"CONTAINER_CLASS_APPLICATION_DATA"]);
                id v70 = sub_10000B140(v69);
                v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
              }

              id v57 = [v107 countByEnumeratingWithState:&v112 objects:v122 count:16];
            }

            while (v57);
          }

          uint64_t v41 = v98;
          id v40 = v99;
          id v42 = &APFSOverProvModel_ptr;
          id v72 = v103;
          id v43 = v104;
          v73 = v102;
        }

        else
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue([v44 executableURL]);

          if (!v74) {
            goto LABEL_54;
          }
          __int128 v75 = v15->_binaryURLs;
          id v72 = objc_claimAutoreleasedReturnValue([v44 executableURL]);
          id v76 = sub_1000126D4((const char *)[v72 fileSystemRepresentation]);
          v73 = (void *)objc_claimAutoreleasedReturnValue(v76);
          -[NSMutableArray addObject:](v75, "addObject:", v73);
        }

LABEL_54:
        id v43 = (char *)v43 + 1;
      }

      while (v43 != v40);
      id v77 = [obj countByEnumeratingWithState:&v116 objects:v125 count:16];
      id v40 = v77;
      if (!v77) {
        goto LABEL_58;
      }
    }
  }

  __int128 v110 = 0uLL;
  __int128 v111 = 0uLL;
  __int128 v108 = 0uLL;
  __int128 v109 = 0uLL;
  id v27 = v19;
  id v28 = [v27 countByEnumeratingWithState:&v108 objects:v121 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v109;
    do
    {
      for (j = 0LL; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v109 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = v15->writersIDs;
        id v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v108 + 1) + 8 * (void)j) bundleIdentifier]);
        -[NSMutableSet addObject:](v32, "addObject:", v33);
      }

      id v29 = [v27 countByEnumeratingWithState:&v108 objects:v121 count:16];
    }

    while (v29);
  }

- (int)urgency
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath lastUsed](self, "lastUsed"));
  int v3 = sub_100008CF4(v2);

  return v3;
}

- (BOOL)forceHidden
{
  if (qword_10005A9F8 != -1) {
    dispatch_once(&qword_10005A9F8, &stru_10004C7A0);
  }
  int v3 = (void *)qword_10005A9F0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath identifier](self, "identifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4]);
  unsigned __int8 v6 = [v5 isEqual:&__kCFBooleanTrue];

  return v6;
}

- (BOOL)forceVisible
{
  if (qword_10005AA08 != -1) {
    dispatch_once(&qword_10005AA08, &stru_10004C7C0);
  }
  int v3 = (void *)qword_10005AA00;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath identifier](self, "identifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4]);
  unsigned __int8 v6 = [v5 isEqual:&__kCFBooleanTrue];

  if ((v6 & 1) != 0) {
    return 1;
  }
  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath identifier](self, "identifier"));
  BOOL v9 = +[SALLMList isLLM:](&OBJC_CLASS___SALLMList, "isLLM:", v8);

  return v9;
}

- (id)appRecord
{
  uint64_t v12 = 0LL;
  id v13 = (id *)&v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_10000B768;
  uint64_t v16 = sub_10000B778;
  id v17 = 0LL;
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath bundleRecords](self, "bundleRecords"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 anyObject]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath bundleRecords](self, "bundleRecords"));
  if ([v5 count] != (id)1)
  {

    goto LABEL_5;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    char v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath identifier](self, "identifier"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000B780;
    v11[3] = &unk_10004C7E8;
    v11[4] = self;
    v11[5] = &v12;
    +[SASupport getLSAppRecordForBundle:reply:](&OBJC_CLASS___SASupport, "getLSAppRecordForBundle:reply:", v8, v11);

    goto LABEL_6;
  }

  objc_storeStrong(v13 + 5, v4);
LABEL_6:
  id v9 = v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (BOOL)isAppUserVisible
{
  if (!-[SAAppPath forceVisible](self, "forceVisible"))
  {
    if (-[SAAppPath forceHidden](self, "forceHidden")
      || -[SAAppPath isGroup](self, "isGroup")
      || -[SAAppPath isPlugin](self, "isPlugin"))
    {
      return 0;
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath appRecord](self, "appRecord"));
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationState]);
      unsigned __int8 v8 = [v7 isRestricted];

      if ((v8 & 1) == 0)
      {
        if (([v6 isDeletable] & 1) != 0
          || [v6 developerType] != 1)
        {
          unsigned __int8 v3 = 1;
        }

        else
        {
          unsigned __int8 v3 = [v6 isSystemPlaceholder];
        }

        goto LABEL_18;
      }
    }

    else
    {
      uint64_t v9 = SALog(0LL);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002FDEC(self, v10);
      }
    }

    unsigned __int8 v3 = 0;
LABEL_18:

    return v3;
  }

  return 1;
}

- (BOOL)isUserVisible
{
  isUserVisible = self->__isUserVisible;
  if (!isUserVisible)
  {
    id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SAAppPath isAppUserVisible](self, "isAppUserVisible")));
    id v5 = self->__isUserVisible;
    self->__isUserVisible = v4;

    isUserVisible = self->__isUserVisible;
  }

  return -[NSNumber BOOLValue](isUserVisible, "BOOLValue");
}

- (id)bundleSet
{
  unsigned __int8 v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = self->_bundleRecords;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      unsigned __int8 v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v8), "bundleIdentifier", (void)v12));
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        unsigned __int8 v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));
  return v10;
}

- (id)getDictionary
{
  unsigned __int8 v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = v3;
  if (v3)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->identifier,  @"SPACE_ATTRIBUTION_OWNER");
    id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v5,  @"SPACE_ATTRIBUTION_WRITERS");

    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v6 = self->writersIDs;
    id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v58,  v65,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v59;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v59 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)v10);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"SPACE_ATTRIBUTION_WRITERS"));
          [v12 addObject:v11];

          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v58,  v65,  16LL);
      }

      while (v8);
    }

    __int128 v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v13,  @"SPACE_ATTRIBUTION_PATHS");

    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v14 = self->uniqueURLs;
    id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v54,  v64,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v55;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v55 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v18);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"SPACE_ATTRIBUTION_PATHS"));
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 absoluteString]);
          [v20 addObject:v21];

          uint64_t v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v54,  v64,  16LL);
      }

      while (v16);
    }

    uint64_t v22 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v22,  @"SPACE_ATTRIBUTION_SHARED");

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v23 = self->sharedURLs;
    id v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v50,  v63,  16LL);
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v51;
      do
      {
        id v27 = 0LL;
        do
        {
          if (*(void *)v51 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v27);
          id v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"SPACE_ATTRIBUTION_SHARED"));
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 absoluteString]);
          [v29 addObject:v30];

          id v27 = (char *)v27 + 1;
        }

        while (v25 != v27);
        id v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v50,  v63,  16LL);
      }

      while (v25);
    }

    uint64_t v31 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v31,  @"SPACE_ATTRIBUTION_EXECUTABLE");

    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v32 = self->_binaryURLs;
    id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v46,  v62,  16LL);
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v47;
      do
      {
        uint64_t v36 = 0LL;
        do
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"SPACE_ATTRIBUTION_EXECUTABLE",  (void)v46));
          id v39 = (void *)objc_claimAutoreleasedReturnValue([v37 absoluteString]);
          [v38 addObject:v39];

          uint64_t v36 = (char *)v36 + 1;
        }

        while (v34 != v36);
        id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v46,  v62,  16LL);
      }

      while (v34);
    }

    id v40 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath dataContainerURL](self, "dataContainerURL"));
    if (v40)
    {
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath dataContainerURL](self, "dataContainerURL"));
      id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 path]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v42,  @"SPACE_ATTRIBUTION_CONTAINER_URL");
    }

    id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SAAppPath getAppCacheSize:](self, "getAppCacheSize:", 0LL, (void)v46)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v43, @"cache_size");

    id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SAAppPath tempSize:](self, "tempSize:", 0LL)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v44, @"tmp_size");
  }

  return v4;
}

+ (SAAppPath)appPathWithRecords:(id)a3 identifier:(id)a4 dataContainerURL:(id)a5 personaUniqueString:(id)a6 isDataSeparated:(BOOL)a7 isPlugin:(BOOL)a8 isGroup:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = v17;
  if (!v15)
  {
    uint64_t v22 = SALog(v17);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002FE7C();
    }
    uint64_t v19 = 0LL;
    goto LABEL_8;
  }

  LOBYTE(v24) = a9;
  uint64_t v19 = -[SAAppPath initWithBundleRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:]( objc_alloc(&OBJC_CLASS___SAAppPath),  "initWithBundleRecords:identifier:dataContainerURL:personaUniqueString:isDataSeparated:isPlugin:isGroup:",  v14,  v15,  v16,  v17,  v10,  v9,  v24);
  if (!v19)
  {
    uint64_t v20 = SALog(0LL);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002FEA8();
    }
LABEL_8:
  }

  return v19;
}

- (void)enableDirStats
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath dataContainerURL](self, "dataContainerURL"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  int v5 = +[SASupport enableDirStatInfoForPath:withOptions:andGetInfo:]( &OBJC_CLASS___SASupport,  "enableDirStatInfoForPath:withOptions:andGetInfo:",  v4,  0LL,  &self->dstats);

  if (v5)
  {
    uint64_t v7 = SALog(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002FF08(v5, v8);
    }
  }

- (unint64_t)dirstatsCloneSize:(BOOL)a3
{
  if (a3 || !-[SAAppPath validate](self, "validate")) {
    -[SAAppPath enableDirStats](self, "enableDirStats");
  }
  return self->dstats.clone_size;
}

- (unint64_t)dirstatsPurgeableSize:(BOOL)a3
{
  if (a3 || !-[SAAppPath validate](self, "validate")) {
    -[SAAppPath enableDirStats](self, "enableDirStats");
  }
  return self->dstats.purgeable_size;
}

- (unint64_t)dirstatsPhysicalSize:(BOOL)a3
{
  if (a3 || !-[SAAppPath validate](self, "validate")) {
    -[SAAppPath enableDirStats](self, "enableDirStats");
  }
  unint64_t physical_size = self->dstats.physical_size;
  unint64_t v5 = self->dstats.purgeable_size + self->dstats.clone_size;
  unint64_t result = physical_size - v5;
  if (physical_size < v5)
  {
    uint64_t v7 = SALog(result);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002FF80();
    }

    return self->dstats.physical_size;
  }

  return result;
}

- (unint64_t)getAppCacheSize:(BOOL)a3
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath cachePath](self, "cachePath"));

  if (!v5) {
    return 0LL;
  }
  if (a3 || !-[SAAppPath validate](self, "validate"))
  {
    uint64_t v6 = objc_opt_new(&OBJC_CLASS___SATraverse);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath cachePath](self, "cachePath"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATraverse getFolderSizeAtPath:options:](v6, "getFolderSizeAtPath:options:", v7, 2LL));

    -[SAAppPath setCacheDirStatsID:](self, "setCacheDirStatsID:", [v8 dirstatsID]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 volumePath]);
    -[SAAppPath setCacheVolumePath:](self, "setCacheVolumePath:", v9);

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 dataSize]));
    -[SAAppPath setLastKnownAppCacheSize:](self, "setLastKnownAppCacheSize:", v10);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath lastKnownAppCacheSize](self, "lastKnownAppCacheSize"));
  id v12 = [v11 unsignedLongLongValue];

  return (unint64_t)v12;
}

- (unint64_t)tempSize:(BOOL)a3
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath tmpPath](self, "tmpPath"));

  if (!v5) {
    return 0LL;
  }
  if (a3 || !-[SAAppPath validate](self, "validate"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath tmpPath](self, "tmpPath"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([0 getFolderSizeAtPath:v6 options:2]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v7 dataSize]));
    -[SAAppPath setLastKnownTmpSize:](self, "setLastKnownTmpSize:", v8);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath lastKnownTmpSize](self, "lastKnownTmpSize"));
  id v10 = [v9 unsignedLongLongValue];

  return (unint64_t)v10;
}

- (void)addBundleRecord:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath bundleRecords](self, "bundleRecords"));
  unsigned __int8 v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath bundleRecords](self, "bundleRecords"));
    [v6 addObject:v7];
  }
}

- (void)addBundleRecords:(id)a3
{
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[SAAppPath addBundleRecord:](self, "addBundleRecord:", *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (id)cachePath
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath dataContainerURL](self, "dataContainerURL"));

  if (v3)
  {
    id v4 = objc_claimAutoreleasedReturnValue(-[SAAppPath dataContainerURL](self, "dataContainerURL"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [v4 fileSystemRepresentation]));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Library/Caches"]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)tmpPath
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPath dataContainerURL](self, "dataContainerURL"));

  if (v3)
  {
    id v4 = objc_claimAutoreleasedReturnValue(-[SAAppPath dataContainerURL](self, "dataContainerURL"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [v4 fileSystemRepresentation]));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"tmp"]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)validate
{
  return 1;
}

- (int64_t)threeDaysAgo
{
  v6.tv_sec = 0LL;
  *(void *)&v6.tv_usec = 0LL;
  uint64_t v2 = gettimeofday(&v6, 0LL);
  if ((_DWORD)v2)
  {
    uint64_t v3 = SALog(v2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002FFAC(v4);
    }
  }

  return v6.tv_sec - 259200;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableSet)writersIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setWritersIDs:(id)a3
{
}

- (NSMutableSet)uniqueURLs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setUniqueURLs:(id)a3
{
}

- (NSMutableSet)sharedURLs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSharedURLs:(id)a3
{
}

- (NSMutableArray)binaryURLs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setBinaryURLs:(id)a3
{
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (BOOL)isDataSeparated
{
  return self->_isDataSeparated;
}

- (BOOL)isPlugin
{
  return self->_isPlugin;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (NSMutableSet)bundleRecords
{
  return self->_bundleRecords;
}

- (void)setBundleRecords:(id)a3
{
}

- (NSNumber)lastKnownAppCacheSize
{
  return self->_lastKnownAppCacheSize;
}

- (void)setLastKnownAppCacheSize:(id)a3
{
}

- (NSNumber)lastKnownTmpSize
{
  return self->_lastKnownTmpSize;
}

- (void)setLastKnownTmpSize:(id)a3
{
}

- (NSString)personaUniqueString
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setPersonaUniqueString:(id)a3
{
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)cacheDeletePluginSize
{
  return self->_cacheDeletePluginSize;
}

- (void)setCacheDeletePluginSize:(unint64_t)a3
{
  self->_cacheDeletePluginSize = a3;
}

- (unint64_t)cacheDirStatsID
{
  return self->_cacheDirStatsID;
}

- (void)setCacheDirStatsID:(unint64_t)a3
{
  self->_cacheDirStatsID = a3;
}

- (NSString)cacheVolumePath
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setCacheVolumePath:(id)a3
{
}

- (NSNumber)_isUserVisible
{
  return (NSNumber *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)set_isUserVisible:(id)a3
{
}

- (void).cxx_destruct
{
}

@end