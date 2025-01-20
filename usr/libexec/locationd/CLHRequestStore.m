@interface CLHRequestStore
- (CLHRequestStore)initWithRootDirectory:(id)a3 classifier:(id)a4;
- (id)allArchiveURLs;
- (id)archiveForHarvester:(int)a3;
- (id)archiveForHarvester:(int)a3 withSuffix:(id)a4;
- (id)archiveWithIdentifier:(id)a3;
- (id)classifyingStoreForHarvester:(int)a3;
- (id)classifyingStoreForHarvester:(int)a3 enableSubArchiving:(BOOL)a4 itemCountThresholdForAutoCleanUp:(int)a5;
- (id)classifyingStoreForHarvesterWithSubArchiving:(int)a3 itemCountThresholdForAutoCleanUp:(int)a4;
- (id)jsonObject;
- (id)requestArchivesForHarvester:(int)a3;
- (unint64_t)pointCountForHarvester:(int)a3;
- (void)clearDataForHarvester:(int)a3;
- (void)pruneSecondaryDataOlderThan:(double)a3 forHarvester:(int)a4;
@end

@implementation CLHRequestStore

- (CLHRequestStore)initWithRootDirectory:(id)a3 classifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLHRequestStore;
  v6 = -[CLHRequestStore init](&v8, "init");
  if (v6)
  {
    v6->_rootDir = (NSURL *)a3;
    v6->_classifier = (CLHLocationClassifier *)a4;
  }

  return v6;
}

- (id)archiveWithIdentifier:(id)a3
{
  return  -[CLHRequestArchive initWithDirectory:]( objc_alloc(&OBJC_CLASS___CLHRequestArchive),  "initWithDirectory:",  -[NSString stringByAppendingPathComponent:]( -[NSURL path](self->_rootDir, "path"),  "stringByAppendingPathComponent:",  a3));
}

- (id)archiveForHarvester:(int)a3
{
  uint64_t v5 = sub_10083CB94(a3);
  return  -[CLHRequestArchive initWithDirectory:requestCode:]( objc_alloc(&OBJC_CLASS___CLHRequestArchive),  "initWithDirectory:requestCode:",  -[NSString stringByAppendingPathComponent:]( -[NSURL path](self->_rootDir, "path"),  "stringByAppendingPathComponent:",  sub_10083CBB4(a3)),  v5);
}

- (id)archiveForHarvester:(int)a3 withSuffix:(id)a4
{
  uint64_t v7 = sub_10083CB94(a3);
  return  -[CLHRequestArchive initWithDirectory:requestCode:]( objc_alloc(&OBJC_CLASS___CLHRequestArchive),  "initWithDirectory:requestCode:",  -[NSString stringByAppendingPathComponent:]( -[NSURL path](self->_rootDir, "path"),  "stringByAppendingPathComponent:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  sub_10083CBB4(a3),  a4)),  v7);
}

- (id)classifyingStoreForHarvester:(int)a3 enableSubArchiving:(BOOL)a4 itemCountThresholdForAutoCleanUp:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  v9 = sub_10083CBB4(a3);
  v10 = -[CLHLocationAwareRequestArchive initWithClassifier:rootDirectory:basename:requestCode:itemCountThresholdForAutoCleanUp:]( objc_alloc(&OBJC_CLASS___CLHLocationAwareRequestArchive),  "initWithClassifier:rootDirectory:basename:requestCode:itemCountThresholdForAutoCleanUp:",  self->_classifier,  self->_rootDir,  v9,  sub_10083CB94(a3),  v5);
  v11 = v10;
  if (v6)
  {
    -[CLHRequestArchive generateNewSubArchive]( -[CLHLocationAwareRequestArchive homeArchive](v10, "homeArchive"),  "generateNewSubArchive");
    -[CLHRequestArchive generateNewSubArchive]( -[CLHLocationAwareRequestArchive workArchive](v11, "workArchive"),  "generateNewSubArchive");
    -[CLHRequestArchive generateNewSubArchive]( -[CLHLocationAwareRequestArchive mainArchive](v11, "mainArchive"),  "generateNewSubArchive");
  }

  return v11;
}

- (id)classifyingStoreForHarvester:(int)a3
{
  return -[CLHRequestStore classifyingStoreForHarvester:enableSubArchiving:itemCountThresholdForAutoCleanUp:]( self,  "classifyingStoreForHarvester:enableSubArchiving:itemCountThresholdForAutoCleanUp:",  *(void *)&a3,  0LL,  0xFFFFFFFFLL);
}

- (id)classifyingStoreForHarvesterWithSubArchiving:(int)a3 itemCountThresholdForAutoCleanUp:(int)a4
{
  return -[CLHRequestStore classifyingStoreForHarvester:enableSubArchiving:itemCountThresholdForAutoCleanUp:]( self,  "classifyingStoreForHarvester:enableSubArchiving:itemCountThresholdForAutoCleanUp:",  *(void *)&a3,  1LL,  *(void *)&a4);
}

- (void)clearDataForHarvester:(int)a3
{
  id v3 = -[CLHRequestStore requestArchivesForHarvester:](self, "requestArchivesForHarvester:", *(void *)&a3);
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) eraseAllData];
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

- (void)pruneSecondaryDataOlderThan:(double)a3 forHarvester:(int)a4
{
  id v5 = -[CLHRequestStore requestArchivesForHarvester:](self, "requestArchivesForHarvester:", *(void *)&a4);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) pruneSecondaryDataOlderThan:a3];
        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

- (unint64_t)pointCountForHarvester:(int)a3
{
  id v3 = -[CLHRequestStore requestArchivesForHarvester:](self, "requestArchivesForHarvester:", *(void *)&a3);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  unint64_t v6 = 0LL;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v3);
      }
      v6 += (unint64_t)[*(id *)(*((void *)&v10 + 1) + 8 * (void)i) count];
    }

    id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }

  while (v5);
  return v6;
}

- (id)requestArchivesForHarvester:(int)a3
{
  id v3 = objc_msgSend( -[CLHRequestStore allArchiveURLs](self, "allArchiveURLs"),  "filteredArrayUsingPredicate:",  +[NSPredicate predicateWithFormat:]( NSPredicate,  "predicateWithFormat:",  @"self.lastPathComponent BEGINSWITH %@",  sub_10083CBB4(a3)));
  id v4 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        __int128 v9 = -[CLHRequestArchive initWithDirectory:]( [CLHRequestArchive alloc],  "initWithDirectory:",  [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) path]);
        -[NSMutableArray addObject:](v4, "addObject:", v9);

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v4;
}

- (id)allArchiveURLs
{
  NSUInteger v12 = 0LL;
  id v3 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  self->_rootDir,  0LL,  0LL,  &v12);
  if (v12)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    id v4 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_FAULT))
    {
      rootDir = self->_rootDir;
      *(_DWORD *)buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      v16 = "";
      __int16 v17 = 2113;
      v18 = rootDir;
      __int16 v19 = 2113;
      NSUInteger v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:failed to find contents of rootDir, url:%{private, location:escape_only}@, error :%{private, location:escape_only}@}",  buf,  0x26u);
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_101888098);
      }
    }

    id v6 = (os_log_s *)qword_1019349B8;
    if (os_signpost_enabled((os_log_t)qword_1019349B8))
    {
      uint64_t v7 = self->_rootDir;
      *(_DWORD *)buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      v16 = "";
      __int16 v17 = 2113;
      v18 = v7;
      __int16 v19 = 2113;
      NSUInteger v20 = v12;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "failed to find contents of rootDir",  "{msg%{public}.0s:failed to find contents of rootDir, url:%{private, location:escape_only}@, error :%{private, location:escape_only}@}",  buf,  0x26u);
    }
  }

  else
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_101888098);
    }
    uint64_t v8 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEBUG))
    {
      __int128 v9 = self->_rootDir;
      NSUInteger v10 = -[NSArray count](v3, "count");
      *(_DWORD *)buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      v16 = "";
      __int16 v17 = 2113;
      v18 = v9;
      __int16 v19 = 2049;
      NSUInteger v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:found contents of rootDir, url:%{private, location:escape_only}@, count:%{private}lu}",  buf,  0x26u);
    }
  }

  return v3;
}

- (id)jsonObject
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = -[CLHRequestStore allArchiveURLs](self, "allArchiveURLs", 0LL);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = -[CLHRequestArchive initWithDirectory:]( [CLHRequestArchive alloc],  "initWithDirectory:",  [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) path]);
        -[NSMutableArray addObject:](v3, "addObject:", -[CLHRequestArchive jsonObject](v9, "jsonObject"));

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

@end