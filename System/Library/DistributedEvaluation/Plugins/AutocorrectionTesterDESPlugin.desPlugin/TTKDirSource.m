@interface TTKDirSource
- (NSDictionary)layouts;
- (NSString)inputMode;
- (float)fileVersion;
- (id)getNextTestCase;
- (id)init:(id)a3;
- (id)onNewLayoutsFound;
- (int)majorVersion;
- (int)minorVersion;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)loadLayouts:(id)a3;
- (void)loadRootDir;
- (void)reset;
- (void)setOnNewLayoutsFound:(id)a3;
@end

@implementation TTKDirSource

- (void)loadRootDir
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 contentsOfDirectoryAtPath:self->_rootDir error:0]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"compare:"]);
  -[TTKDirSource loadLayouts:](self, "loadLayouts:", self->_rootDir);
  self->_is_multiDir = 1;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v28 + 1) + 8 * (void)i) isEqualToString:@"layouts.json"]) {
          self->_is_multiDir = 0;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v8);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    p_testCaseFiles = &self->_testCaseFiles;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)j);
        if ((objc_msgSend(v16, "isEqualToString:", @".DS_Store", p_testCaseFiles) & 1) == 0)
        {
          v32[0] = self->_rootDir;
          v32[1] = v16;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v17));

          char v23 = 0;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          [v19 fileExistsAtPath:v18 isDirectory:&v23];

          p_testCaseDirs = &self->_testCaseDirs;
          if (v23
            || (unsigned __int8 v21 = [v16 isEqualToString:@"layouts.json"],
                p_testCaseDirs = p_testCaseFiles,
                (v21 & 1) == 0))
          {
            -[NSMutableArray addObject:](*p_testCaseDirs, "addObject:", v16);
          }
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }

    while (v13);
  }
}

- (id)getNextTestCase
{
  v3 = objc_autoreleasePoolPush();
  currTestCaseSource = self->_currTestCaseSource;
  if (currTestCaseSource)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TTKTestCaseSource getNextTestCase](currTestCaseSource, "getNextTestCase"));
    if (v5) {
      goto LABEL_15;
    }
    id v6 = self->_currTestCaseSource;
    self->_currTestCaseSource = 0LL;
  }

  if (-[NSMutableArray count](self->_testCaseFiles, "count"))
  {
    rootDir = self->_rootDir;
    currDir = self->_currDir;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_testCaseFiles, "objectAtIndex:", 0LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", rootDir, currDir, v9, 0LL));

    -[NSMutableArray removeObjectAtIndex:](self->_testCaseFiles, "removeObjectAtIndex:", 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v10));
    id v12 = (TTKTestCaseSource *)objc_claimAutoreleasedReturnValue( +[TTKTestCaseReader loadFromFile:inputMode:layouts:]( &OBJC_CLASS___TTKTestCaseReader,  "loadFromFile:inputMode:layouts:",  v11,  self->_inputMode,  self->_layouts));
    id v13 = self->_currTestCaseSource;
    self->_currTestCaseSource = v12;

    uint64_t v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[TTKTestCaseSource layouts](self->_currTestCaseSource, "layouts"));
    if ([v14 count])
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TTKDirSource onNewLayoutsFound](self, "onNewLayoutsFound"));

      if (!v15)
      {
LABEL_14:
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[TTKDirSource getNextTestCase](self, "getNextTestCase"));

        goto LABEL_15;
      }

      v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  self->_layouts));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TTKTestCaseSource layouts](self->_currTestCaseSource, "layouts"));
      -[NSMutableDictionary addEntriesFromDictionary:](v16, "addEntriesFromDictionary:", v17);

      layouts = self->_layouts;
      self->_layouts = v16;
      v19 = v16;

      uint64_t v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[TTKDirSource onNewLayoutsFound](self, "onNewLayoutsFound"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TTKTestCaseSource layouts](self->_currTestCaseSource, "layouts"));

      ((void (**)(void, void *))v14)[2](v14, v20);
    }

    goto LABEL_14;
  }

  if (-[NSMutableArray count](self->_testCaseDirs, "count"))
  {
    unsigned __int8 v21 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_testCaseDirs, "objectAtIndex:", 0LL));
    v22 = self->_currDir;
    self->_currDir = v21;

    -[NSMutableArray removeObjectAtIndex:](self->_testCaseDirs, "removeObjectAtIndex:", 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  self->_rootDir,  self->_currDir,  0LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v10));
    if (self->_is_multiDir)
    {
      char v23 = -[TTKDirSource init:](objc_alloc(&OBJC_CLASS___TTKDirSource), "init:", v11);
      __int128 v24 = self->_currTestCaseSource;
      self->_currTestCaseSource = v23;
    }

    else
    {
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 contentsOfDirectoryAtPath:v11 error:0]);
      __int128 v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v26));
      testCaseFiles = self->_testCaseFiles;
      self->_testCaseFiles = v27;

      -[NSMutableArray removeObject:](self->_testCaseFiles, "removeObject:", @".DS_Store");
    }

    goto LABEL_14;
  }

  v5 = 0LL;
LABEL_15:
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)init:(id)a3
{
  id v5 = a3;
  id v6 = sub_53C8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_5579C(v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TTKDirSource;
  id v8 = -[TTKDirSource init](&v11, "init");
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_rootDir, a3);
    -[TTKDirSource reset](v9, "reset");
  }

  return v9;
}

- (void)reset
{
  currTestCaseSource = self->_currTestCaseSource;
  self->_currTestCaseSource = 0LL;

  currDir = self->_currDir;
  self->_currDir = (NSString *)&stru_89E80;

  id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  testCaseDirs = self->_testCaseDirs;
  self->_testCaseDirs = v5;

  id v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  testCaseFiles = self->_testCaseFiles;
  self->_testCaseFiles = v7;

  -[TTKDirSource loadRootDir](self, "loadRootDir");
}

- (void)loadLayouts:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v62 = 0LL;
  v49 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contentsOfDirectoryAtPath:v4 error:&v62]);
  id v8 = v62;

  if (!v8)
  {
    v47 = v5;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingSelector:"compare:"]);

    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v58 objects:v67 count:16];
    v48 = v10;
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v59;
      location = (id *)&self->_inputMode;
      p_layouts = &self->_layouts;
      while (2)
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
          if (([v16 isEqualToString:@".DS_Store"] & 1) == 0)
          {
            v66[0] = v49;
            v66[1] = v16;
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v66,  2LL));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v17));

            if ([v16 isEqualToString:@"layouts.json"])
            {
              __int128 v27 = (id *)objc_claimAutoreleasedReturnValue(+[TTKTestCaseReader loadFromFile:](&OBJC_CLASS___TTKTestCaseReader, "loadFromFile:", v18));
              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 inputMode]);
              __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v27 layouts]);
              __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v29));

              int v31 = [v27 majorVersion];
              int v32 = [v27 minorVersion];
              [v27 fileVersion];
              if (*location)
              {
                v44 = v28;
                locationa = v27;
                __int128 v56 = 0u;
                __int128 v57 = 0u;
                __int128 v54 = 0u;
                __int128 v55 = 0u;
                v34 = (void *)objc_claimAutoreleasedReturnValue([v30 allKeys]);
                id v35 = [v34 countByEnumeratingWithState:&v54 objects:v65 count:16];
                if (v35)
                {
                  id v36 = v35;
                  uint64_t v37 = *(void *)v55;
                  do
                  {
                    for (j = 0LL; j != v36; j = (char *)j + 1)
                    {
                      if (*(void *)v55 != v37) {
                        objc_enumerationMutation(v34);
                      }
                      uint64_t v39 = *(void *)(*((void *)&v54 + 1) + 8LL * (void)j);
                      v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](*p_layouts, "objectForKey:", v39));

                      if (!v40)
                      {
                        v41 = *p_layouts;
                        v42 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v39]);
                        -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:", v42, v39);
                      }
                    }

                    id v36 = [v34 countByEnumeratingWithState:&v54 objects:v65 count:16];
                  }

                  while (v36);
                }

                __int128 v28 = v44;
                __int128 v27 = locationa;
              }

              else
              {
                float v43 = v33;
                objc_storeStrong(location, v28);
                objc_storeStrong((id *)&self->_layouts, v30);
                self->_majorVersion = v31;
                self->_minorVersion = v32;
                self->_fileVersion = v43;
              }

              goto LABEL_35;
            }

            id v10 = v48;
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v58 objects:v67 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v19 = v10;
    id v20 = [v19 countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v51;
      do
      {
        for (k = 0LL; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v51 != v22) {
            objc_enumerationMutation(v19);
          }
          __int128 v24 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)k);
          if (([v24 isEqualToString:@".DS_Store"] & 1) == 0)
          {
            v63[0] = v49;
            v63[1] = v24;
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v63,  2LL));
            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v25));
            -[TTKDirSource loadLayouts:](self, "loadLayouts:", v26);
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v50 objects:v64 count:16];
      }

      while (v21);
    }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var0) {
    a3->var2 = a3->var3;
  }
  a3->var0 = 0LL;
  if (a5)
  {
    do
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[TTKDirSource getNextTestCase](self, "getNextTestCase"));
      unint64_t result = a3->var0;
      if (!v9) {
        break;
      }
      a3->var0 = result + 1;
      a4[result] = v9;
      unint64_t result = a3->var0;
    }

    while (a3->var0 < a5);
  }

  else
  {
    unint64_t result = 0LL;
  }

  a3->var1 = a4;
  return result;
}

- (NSDictionary)layouts
{
  return &self->_layouts->super;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (float)fileVersion
{
  return self->_fileVersion;
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (id)onNewLayoutsFound
{
  return self->_onNewLayoutsFound;
}

- (void)setOnNewLayoutsFound:(id)a3
{
}

- (void).cxx_destruct
{
}

@end