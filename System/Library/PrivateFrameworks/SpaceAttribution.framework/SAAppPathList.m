@interface SAAppPathList
- (BOOL)checkURLsAreOverlappingWithURLs:(id)a3;
- (BOOL)importDefaultApps;
- (BOOL)isAppVisible:(id)a3;
- (BOOL)loadFromDisk;
- (BOOL)loadFromDiskWithPathsResolving:(BOOL)a3;
- (BOOL)saveToDisk;
- (NSMutableDictionary)appPathList;
- (NSMutableDictionary)appPathListOnDisk;
- (NSMutableDictionary)writersMap;
- (SAAppPathList)init;
- (SATrie)pathsTrie;
- (id)appPathForBundleID:(id)a3;
- (id)defaultList;
- (id)getGreaterAncestorOfBundle:(id)a3;
- (id)getParentOfBundle:(id)a3;
- (id)groupPathMapping;
- (id)importFromPlists:(id)a3;
- (void)clearAppsWithZeroPath;
- (void)defaultListWithSAActivity:(id)a3 dirKeyCacheList:(id)a4 reply:(id)a5;
- (void)findBundleIdForURL:(id)a3 reply:(id)a4;
- (void)importFromLaunchServicesWithSAActivity:(id)a3 dirKeyCacheList:(id)a4 reply:(id)a5;
- (void)isPathInfoClaimedByAnotherApp:(id)a3 reply:(id)a4;
- (void)mergeWritersAppPaths;
- (void)removeAppPath:(id)a3;
- (void)updateWithAppPath:(id)a3;
@end

@implementation SAAppPathList

- (SAAppPathList)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SAAppPathList;
  v2 = -[SAAppPathList init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  100LL));
    appPathList = v2->_appPathList;
    v2->_appPathList = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/var/db/spaceattribution",  @"AppPathList.db"));
    pathToDisk = v2->pathToDisk;
    v2->pathToDisk = (NSString *)v5;
  }

  return v2;
}

- (SATrie)pathsTrie
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___SATrie);
  pathsTrie = self->_pathsTrie;
  self->_pathsTrie = v3;

  appPathList = self->_appPathList;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000CA28;
  v7[3] = &unk_10004C810;
  v7[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appPathList, "enumerateKeysAndObjectsUsingBlock:", v7);
  return self->_pathsTrie;
}

- (NSMutableDictionary)writersMap
{
  writersMap = self->_writersMap;
  if (!writersMap)
  {
    v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v5 = self->_writersMap;
    self->_writersMap = v4;

    appPathList = self->_appPathList;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000CD30;
    v8[3] = &unk_10004C810;
    v8[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appPathList, "enumerateKeysAndObjectsUsingBlock:", v8);
    writersMap = self->_writersMap;
  }

  return writersMap;
}

- (BOOL)isAppVisible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPathList appPathList](self, "appPathList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  LOBYTE(v4) = [v6 isUserVisible];
  return (char)v4;
}

- (void)updateWithAppPath:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  uint64_t v5 = self->_appPathList;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_appPathList, "objectForKeyedSubscript:", v4));
  v7 = v6;
  if (v6) {
    [v6 extendWithPropertiesFromAppPath:v8];
  }
  else {
    -[NSMutableDictionary setValue:forKey:](self->_appPathList, "setValue:forKey:", v8, v4);
  }

  objc_sync_exit(v5);
}

- (id)appPathForBundleID:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appPathList, "objectForKey:", a3));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (void)removeAppPath:(id)a3
{
}

- (void)defaultListWithSAActivity:(id)a3 dirKeyCacheList:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  -[SAAppPathList loadFromDiskWithPathsResolving:](self, "loadFromDiskWithPathsResolving:", 1LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000D140;
  v12[3] = &unk_10004C838;
  v12[4] = &v13;
  -[SAAppPathList importFromLaunchServicesWithSAActivity:dirKeyCacheList:reply:]( self,  "importFromLaunchServicesWithSAActivity:dirKeyCacheList:reply:",  v8,  v9,  v12);
  if (*((_BYTE *)v14 + 24)) {
    v10[2](v10, 0LL, 1LL);
  }
  id v11 = -[SAAppPathList importFromPlists:](self, "importFromPlists:", @"/System/Library/SpaceAttribution");
  -[SAAppPathList importDefaultApps](self, "importDefaultApps");
  -[SAAppPathList mergeWritersAppPaths](self, "mergeWritersAppPaths");
  ((void (**)(id, SAAppPathList *, uint64_t))v10)[2](v10, self, 0LL);
  _Block_object_dispose(&v13, 8);
}

- (id)defaultList
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_10000B768;
  id v9 = sub_10000B778;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000D21C;
  v4[3] = &unk_10004C860;
  v4[4] = &v5;
  -[SAAppPathList defaultListWithSAActivity:dirKeyCacheList:reply:]( self,  "defaultListWithSAActivity:dirKeyCacheList:reply:",  0LL,  0LL,  v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)saveToDisk
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v24 = 0LL;
  unsigned __int8 v4 = [v3 createDirectoryAtPath:@"/var/db/spaceattribution" withIntermediateDirectories:1 attributes:0 error:&v24];
  id v5 = v24;
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    appPathList = self->_appPathList;
    id v23 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  appPathList,  0LL,  &v23));
    id v9 = v23;

    if (v8)
    {
      unsigned __int8 v11 = [v8 writeToFile:self->pathToDisk atomically:1];
    }

    else
    {
      uint64_t v20 = SALog(v10);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10003002C();
      }

      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    uint64_t v12 = SALog(v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_10003008C((os_log_s *)v8, v13, v14, v15, v16, v17, v18, v19);
    }
    unsigned __int8 v11 = 0;
    id v9 = v6;
  }

  return v11;
}

- (NSMutableDictionary)appPathListOnDisk
{
  pathToDisk = self->pathToDisk;
  id v20 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  pathToDisk,  0LL,  &v20));
  id v4 = v20;
  id v5 = v4;
  if (v3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSURL);
    id v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___SAAppPath),  0LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v19 = v5;
    unsigned __int8 v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v10,  v3,  &v19));
    id v12 = v19;

    if (!v11)
    {
      uint64_t v14 = SALog(v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10003015C();
      }

      unsigned __int8 v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }

    id v5 = v12;
  }

  else
  {
    uint64_t v16 = SALog(v4);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000300FC();
    }

    unsigned __int8 v11 = 0LL;
  }

  return v11;
}

- (BOOL)loadFromDiskWithPathsResolving:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPathList appPathListOnDisk](self, "appPathListOnDisk"));
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 copy];
    [v7 enumerateKeysAndObjectsUsingBlock:&stru_10004C8A0];

    if (!v3)
    {
      objc_storeStrong((id *)&self->_appPathList, v6);
      goto LABEL_8;
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000D910;
    v13[3] = &unk_10004C810;
    uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v14 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v13];
    appPathList = self->_appPathList;
    self->_appPathList = v8;
    uint64_t v10 = v8;
  }

  else
  {
    uint64_t v11 = SALog(0LL);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000301BC();
    }
  }

LABEL_8:
  return v6 != 0LL;
}

- (BOOL)loadFromDisk
{
  return -[SAAppPathList loadFromDiskWithPathsResolving:](self, "loadFromDiskWithPathsResolving:", 0LL);
}

- (id)getParentOfBundle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPathList writersMap](self, "writersMap"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (id)getGreaterAncestorOfBundle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SAAppPathList getParentOfBundle:](self, "getParentOfBundle:", v4));

  if (v5)
  {
    id v6 = v4;
    id v5 = 0LL;
    if (v6)
    {
      do
      {
        id v7 = v5;
        id v5 = v6;

        id v6 = (id)objc_claimAutoreleasedReturnValue(-[SAAppPathList getParentOfBundle:](self, "getParentOfBundle:", v5));
      }

      while (([v5 isEqualToString:v6] & 1) == 0 && v6);
    }
  }

  return v5;
}

- (void)clearAppsWithZeroPath
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_appPathList, "allKeys"));
  id v4 = [v3 copy];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&__int128 v6 = 136315394LL;
    __int128 v19 = v6;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_appPathList,  "objectForKeyedSubscript:",  v10,  v19));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueURLs]);
        id v13 = [v12 count];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedURLs]);
        uint64_t v15 = (char *)[v14 count];

        if (!&v15[(void)v13])
        {
          uint64_t v17 = SALog(v16);
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v26 = "-[SAAppPathList clearAppsWithZeroPath]";
            __int16 v27 = 2112;
            uint64_t v28 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s: Removing %@ app path",  buf,  0x16u);
          }

          -[NSMutableDictionary removeObjectForKey:](self->_appPathList, "removeObjectForKey:", v10);
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v7);
  }
}

- (id)groupPathMapping
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  appPathList = self->_appPathList;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000DEEC;
  v7[3] = &unk_10004C810;
  id v5 = v3;
  uint64_t v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appPathList, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (void)importFromLaunchServicesWithSAActivity:(id)a3 dirKeyCacheList:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v27 = a4;
  uint64_t v28 = (void (**)(id, void))a5;
  id v9 = sub_1000121C8();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SAQuery getFSPurgeableInfo:options:](&OBJC_CLASS___SAQuery, "getFSPurgeableInfo:options:", v11, 0LL));

  id v13 = sub_1000127B8(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = sub_1000129E8();
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = objc_opt_new(&OBJC_CLASS___NSLock);
  v52[0] = 0LL;
  v52[1] = v52;
  v52[2] = 0x3032000000LL;
  v52[3] = sub_10000B768;
  v52[4] = sub_10000B778;
  id v53 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v51[0] = 0LL;
  v51[1] = v51;
  v51[2] = 0x2020000000LL;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  char v50 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10000E620;
  v37[3] = &unk_10004C8C8;
  uint64_t v18 = v17;
  v38 = v18;
  v44 = v51;
  v45 = v52;
  id v19 = v8;
  id v39 = v19;
  v46 = &v47;
  id v20 = v16;
  id v40 = v20;
  id v21 = v14;
  id v41 = v21;
  id v22 = v27;
  id v42 = v22;
  v43 = self;
  +[SAQuery installedAppsAtVolume:sortForUrgency:options:block:]( &OBJC_CLASS___SAQuery,  "installedAppsAtVolume:sortForUrgency:options:block:",  0LL,  3LL,  1LL,  v37);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPathList groupPathMapping](self, "groupPathMapping"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10000E988;
  v29[3] = &unk_10004C8F0;
  v34 = v51;
  v35 = v52;
  id v24 = v19;
  id v30 = v24;
  v36 = &v47;
  id v25 = v23;
  id v31 = v25;
  id v26 = v22;
  id v32 = v26;
  v33 = self;
  +[SAQuery installedAppGroupsAtVolume:](&OBJC_CLASS___SAQuery, "installedAppGroupsAtVolume:", v29);
  v28[2](v28, *((unsigned __int8 *)v48 + 24));

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v52, 8);
}

- (void)isPathInfoClaimedByAnotherApp:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 url]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v10, 1LL));

  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  __int128 v23 = sub_10000B768;
  id v24 = sub_10000B778;
  id v25 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000F030;
  v15[3] = &unk_10004C918;
  v15[4] = &v20;
  v15[5] = &v16;
  -[SAAppPathList findBundleIdForURL:reply:](self, "findBundleIdForURL:reply:", v11, v15);
  if (v21[5])
  {
    if (objc_msgSend(v8, "isEqual:"))
    {
      int v12 = *((unsigned __int8 *)v17 + 24);
    }
  }

  uint64_t v14 = v21[5];
  if (!v14)
  {
    uint64_t v13 = 0LL;
    goto LABEL_14;
  }

  if ((objc_msgSend(v8, "isEqual:") & 1) == 0
    && !*((_BYTE *)v17 + 24)
    && [v6 exclusive])
  {
LABEL_7:
    uint64_t v13 = v21[5];
    uint64_t v14 = *((_BYTE *)v17 + 24) != 0;
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
  }

- (void)findBundleIdForURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void, id, id))a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = self->_appPathList;
  id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v20 = v7;
    id obj = v8;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      uint64_t v13 = 0LL;
      uint64_t v14 = v11;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v22 + 1) + 8LL * (void)v13);

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appPathList, "objectForKey:", v11));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueURLs]);
        id v17 = [v16 containsObject:v6];

        if ((v17 & 1) != 0
          || (uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 sharedURLs]),
              unsigned __int8 v19 = [v18 containsObject:v6],
              v18,
              (v19 & 1) != 0))
        {
          id v7 = v20;
          v20[2](v20, v11, v17);

          goto LABEL_13;
        }

        uint64_t v13 = (char *)v13 + 1;
        uint64_t v14 = v11;
      }

      while (v10 != v13);
      id v8 = obj;
      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      if (v10) {
        continue;
      }
      break;
    }

    id v7 = v20;
  }

  v7[2](v7, 0LL, 0LL);
LABEL_13:
}

- (BOOL)checkURLsAreOverlappingWithURLs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppPathList pathsTrie](self, "pathsTrie"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v11 = objc_autoreleasePoolPush();
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path", (void)v16));
        unsigned __int8 v13 = [v5 isOverlapping:v12];

        if ((v13 & 1) != 0)
        {
          objc_autoreleasePoolPop(v11);
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
        [v5 insertPath:v14];

        objc_autoreleasePoolPop(v11);
      }

      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)importFromPlists:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 stringByStandardizingPath]);

  BOOL v6 = -[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", v5);
  uint64_t v28 = (void *)v5;
  if (!v6)
  {
    uint64_t v13 = SALog(v6);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100030478();
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4LL,  0LL));
    goto LABEL_9;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v35 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contentsOfDirectoryAtPath:v5 error:&v35]);
  id v9 = v35;

  if (v9)
  {
    uint64_t v11 = SALog(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100030410();
    }

LABEL_9:
    id v15 = v28;
    goto LABEL_10;
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF ENDSWITH '.plist'"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 filteredArrayUsingPredicate:v17]);

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v18;
  id v19 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
  id v15 = v28;
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v15,  v23));
        id v25 = +[SAAppPath newFromPlist:](&OBJC_CLASS___SAAppPath, "newFromPlist:", v24);
        if (v25)
        {
          -[SAAppPathList updateWithAppPath:](self, "updateWithAppPath:", v25);
        }

        else
        {
          uint64_t v26 = SALog(0LL);
          id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v37 = v23;
            _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to create SAAppPath for plist at path (%@)",  buf,  0xCu);
          }

          id v15 = v28;
        }
      }

      id v20 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
    }

    while (v20);
  }

  id v9 = 0LL;
LABEL_10:

  return v9;
}

- (BOOL)importDefaultApps
{
  if (qword_10005AA20 != -1) {
    dispatch_once(&qword_10005AA20, &stru_10004C938);
  }
  if (qword_10005AA10)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10000F8F0;
    v5[3] = &unk_10004C9B0;
    v5[4] = self;
    [(id)qword_10005AA10 enumerateKeysAndObjectsUsingBlock:v5];
  }

  if (qword_10005AA18)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10000FE60;
    v4[3] = &unk_10004C9B0;
    v4[4] = self;
    [(id)qword_10005AA18 enumerateKeysAndObjectsUsingBlock:v4];
  }

  return 1;
}

- (void)mergeWritersAppPaths
{
  id v3 = -[NSMutableDictionary copy](self->_appPathList, "copy");
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_10004CA20];

  id v4 = -[NSMutableDictionary copy](self->_appPathList, "copy");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000106A0;
  v9[3] = &unk_10004C810;
  v9[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v5 = -[NSMutableDictionary copy](self->_appPathList, "copy");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000108A0;
  v8[3] = &unk_10004C810;
  v8[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  id v6 = -[NSMutableDictionary copy](self->_appPathList, "copy");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010A48;
  v7[3] = &unk_10004C810;
  void v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (NSMutableDictionary)appPathList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end