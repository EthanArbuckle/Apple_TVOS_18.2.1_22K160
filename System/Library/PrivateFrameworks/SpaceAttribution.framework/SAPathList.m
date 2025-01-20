@interface SAPathList
- (NSMutableArray)appList;
- (NSMutableDictionary)dirstatIDToBundlesSet;
- (NSMutableDictionary)pathToBundlesSet;
- (SAPathList)init;
- (SATrie)pathsTrie;
- (id)findAncestorOfPath:(id)a3;
- (id)generateDictionary;
- (id)getBundlesSetForDirStatID:(id)a3;
- (id)getBundlesSetForPath:(id)a3;
- (void)addPaths:(id)a3 ToBundleSets:(id)a4;
- (void)filterOverlappingPaths;
- (void)getAppsSetForURL:(id)a3 completionHandler:(id)a4;
- (void)insertDirStatID:(unint64_t)a3 forBundlesSet:(id)a4;
- (void)print;
- (void)updateWithAppPathList:(id)a3;
@end

@implementation SAPathList

- (SAPathList)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SAPathList;
  v2 = -[SAPathList init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  100LL));
    dirstatIDToBundlesSet = v2->_dirstatIDToBundlesSet;
    v2->_dirstatIDToBundlesSet = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  100LL));
    pathToBundlesSet = v2->_pathToBundlesSet;
    v2->_pathToBundlesSet = (NSMutableDictionary *)v5;
  }

  return v2;
}

- (NSMutableArray)appList
{
  return (NSMutableArray *)-[NSMutableDictionary allValues](self->_pathToBundlesSet, "allValues");
}

- (void)getAppsSetForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_pathToBundlesSet, "objectForKey:", v6));
  if (!v8)
  {
    uint64_t v9 = SALog(0LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100030698();
    }
  }

  v7[2](v7, v8);
}

- (id)getBundlesSetForDirStatID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_dirstatIDToBundlesSet, "objectForKey:", a3);
}

- (void)insertDirStatID:(unint64_t)a3 forBundlesSet:(id)a4
{
  id v9 = a4;
  id v6 = self->_dirstatIDToBundlesSet;
  objc_sync_enter(v6);
  dirstatIDToBundlesSet = self->_dirstatIDToBundlesSet;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary setObject:forKey:](dirstatIDToBundlesSet, "setObject:forKey:", v9, v8);

  objc_sync_exit(v6);
}

- (id)getBundlesSetForPath:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAPathList findAncestorOfPath:](self, "findAncestorOfPath:", a3));
  if (!v4)
  {
LABEL_6:
    v7 = 0LL;
    goto LABEL_7;
  }

  pathToBundlesSet = self->_pathToBundlesSet;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v4, 1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](pathToBundlesSet, "objectForKey:", v6));

  if (!v7)
  {
    uint64_t v9 = SALog(v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000306F8();
    }

    goto LABEL_6;
  }

- (SATrie)pathsTrie
{
  pathsTrie = self->_pathsTrie;
  if (!pathsTrie)
  {
    v4 = objc_opt_new(&OBJC_CLASS___SATrie);
    uint64_t v5 = self->_pathsTrie;
    self->_pathsTrie = v4;

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v6 = self->_pathToBundlesSet;
    id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = self->_pathsTrie;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v10), "path", (void)v14));
          -[SATrie insertPath:](v11, "insertPath:", v12);

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v8);
    }

    pathsTrie = self->_pathsTrie;
  }

  return pathsTrie;
}

- (id)findAncestorOfPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAPathList pathsTrie](self, "pathsTrie"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getAncestorOfPath:v4]);

  return v6;
}

- (void)filterOverlappingPaths
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = objc_alloc_init(&OBJC_CLASS___SATrie);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v16 = self;
  uint64_t v5 = self->_pathToBundlesSet;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v9);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
        BOOL v13 = -[SATrie isOverlapping:](v4, "isOverlapping:", v12);
        if (v13)
        {
          uint64_t v14 = SALog(v13);
          __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v22 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Found overlapping URL (%@)",  buf,  0xCu);
          }

          -[NSMutableArray addObject:](v3, "addObject:", v10);
        }

        else
        {
          -[SATrie insertPath:](v4, "insertPath:", v12);
        }

        objc_autoreleasePoolPop(v11);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v23,  16LL);
    }

    while (v7);
  }

  -[NSMutableDictionary removeObjectsForKeys:](v16->_pathToBundlesSet, "removeObjectsForKeys:", v3);
}

- (void)updateWithAppPathList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 appPathList]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);

  id obj = v7;
  id v51 = [v7 countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (v51)
  {
    uint64_t v8 = *(void *)v67;
    uint64_t v48 = *(void *)v67;
    id v49 = v4;
    do
    {
      for (id i = 0LL; i != v51; id i = v17 + 1)
      {
        if (*(void *)v67 != v8) {
          objc_enumerationMutation(obj);
        }
        v53 = (char *)i;
        uint64_t v10 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)i);
        v52 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue([v4 appPathList]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);

        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v13));
        v57 = v13;
        v54 = v12;
        if ([v12 isGroup])
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleRecords]);
          id v15 = [v14 count];

          __int128 v18 = v52;
          __int128 v17 = v53;
          if (v15) {
            goto LABEL_40;
          }
          uint64_t v19 = SALog(v16);
          __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue([v54 dataContainerURL]);
            v22 = (void *)objc_claimAutoreleasedReturnValue([v54 identifier]);
            *(_DWORD *)buf = 138412546;
            v75 = v21;
            __int16 v76 = 2112;
            v77 = v22;
            _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Group path %@ for %@ has no associated apps.",  buf,  0x16u);

            BOOL v13 = v57;
          }
        }

        else
        {
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          v23 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueURLs]);
          id v24 = [v23 countByEnumeratingWithState:&v62 objects:v73 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v63;
            do
            {
              for (j = 0LL; j != v25; j = (char *)j + 1)
              {
                if (*(void *)v63 != v26) {
                  objc_enumerationMutation(v23);
                }
                v28 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)j);
                v29 = objc_autoreleasePoolPush();
                v30 = (void *)objc_claimAutoreleasedReturnValue([v28 path]);
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v30));

                if (v31)
                {
                  uint64_t v33 = SALog(v32);
                  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                    sub_1000307A8((uint64_t)v72, (uint64_t)v28);
                  }
                }

                else
                {
                  -[NSMutableDictionary setObject:forKey:](self->_pathToBundlesSet, "setObject:forKey:", v56, v28);
                  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 path]);
                  -[NSMutableDictionary setValue:forKey:](v5, "setValue:forKey:", &off_10004FCF0, v34);
                }

                BOOL v13 = v57;

                objc_autoreleasePoolPop(v29);
              }

              id v25 = [v23 countByEnumeratingWithState:&v62 objects:v73 count:16];
            }

            while (v25);
          }

          __int128 v60 = 0u;
          __int128 v61 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v54 sharedURLs]);
          id v35 = -[os_log_s countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v58,  v71,  16LL);
          if (v35)
          {
            id v36 = v35;
            uint64_t v37 = *(void *)v59;
            uint64_t v55 = *(void *)v59;
            do
            {
              for (k = 0LL; k != v36; k = (char *)k + 1)
              {
                if (*(void *)v59 != v37) {
                  objc_enumerationMutation(v20);
                }
                v39 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)k);
                v40 = objc_autoreleasePoolPush();
                v41 = (void *)objc_claimAutoreleasedReturnValue([v39 path]);
                v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v41));

                if (v42)
                {
                  uint64_t v44 = SALog(v43);
                  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                    sub_100030758((uint64_t)v70, (uint64_t)v39);
                  }
                }

                else
                {
                  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_pathToBundlesSet,  "objectForKey:",  v39));
                  v45 = v46;
                  if (v46)
                  {
                    if ((-[os_log_s containsObject:](v46, "containsObject:", v57) & 1) == 0)
                    {
                      id v47 = -[os_log_s mutableCopy](v45, "mutableCopy");
                      [v47 addObject:v57];
                      -[NSMutableDictionary setObject:forKey:](self->_pathToBundlesSet, "setObject:forKey:", v47, v39);
                    }

                    uint64_t v37 = v55;
                  }

                  else
                  {
                    -[NSMutableDictionary setObject:forKey:](self->_pathToBundlesSet, "setObject:forKey:", v56, v39);
                  }
                }

                objc_autoreleasePoolPop(v40);
              }

              id v36 = -[os_log_s countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v58,  v71,  16LL);
            }

            while (v36);
            uint64_t v8 = v48;
            id v4 = v49;
            __int128 v18 = v52;
            __int128 v17 = v53;
            BOOL v13 = v57;
          }

          else
          {
            uint64_t v8 = v48;
            id v4 = v49;
            __int128 v18 = v52;
            __int128 v17 = v53;
          }
        }

LABEL_40:
        objc_autoreleasePoolPop(v18);
      }

      id v51 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
    }

    while (v51);
  }

  -[SAPathList filterOverlappingPaths](self, "filterOverlappingPaths");
}

- (id)generateDictionary
{
  uint64_t v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = self->_pathToBundlesSet;
  id v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0LL;
    id v6 = 0LL;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = v5;
      v11 = v6;
      v12 = v7;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v9);
        id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pathToBundlesSet,  "objectForKeyedSubscript:",  v13));

        id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v7,  @"bundles",  v6,  @"path",  0LL));

        -[NSMutableArray addObject:](v16, "addObject:", v5);
        uint64_t v9 = (char *)v9 + 1;
        uint64_t v10 = v5;
        v11 = v6;
        v12 = v7;
      }

      while (v4 != v9);
      id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v4);
  }

  return v16;
}

- (void)print
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = self->_pathToBundlesSet;
  id v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        NSLog(@"url is %@", *(void *)(*((void *)&v7 + 1) + 8LL * (void)v6));
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }
}

- (void)addPaths:(id)a3 ToBundleSets:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100011AEC;
  v6[3] = &unk_10004CA48;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  [a3 enumerateObjectsUsingBlock:v6];
}

- (NSMutableDictionary)pathToBundlesSet
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSMutableDictionary)dirstatIDToBundlesSet
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end