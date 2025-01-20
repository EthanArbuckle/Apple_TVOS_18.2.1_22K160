@interface SATraverse
+ (id)getFileSize:(id)a3;
- (BOOL)popDir:(id *)a3 at:(int64_t *)a4 ofParentPath:(id *)a5;
- (NSMutableSet)knownDstreamIDs;
- (NSMutableSet)knownInodeIDs;
- (SATraverse)init;
- (SATraverse)traverseWithPath:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (id)getFolderSizeAtPath:(id)a3 options:(unint64_t)a4;
- (id)getItemSizeAtPath:(id)a3;
- (void)debugLogStatistics;
- (void)pushDir:(id)a3 at:(int64_t)a4 withParentPath:(id)a5;
- (void)setKnownDstreamIDs:(id)a3;
- (void)setKnownInodeIDs:(id)a3;
@end

@implementation SATraverse

- (SATraverse)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SATraverse;
  v2 = -[SATraverse init](&v13, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    startTime = v2->_startTime;
    v2->_startTime = (NSDate *)v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    dir_content_cache = v2->_dir_content_cache;
    v2->_dir_content_cache = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    knownDstreamIDs = v2->_knownDstreamIDs;
    v2->_knownDstreamIDs = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    knownInodeIDs = v2->_knownInodeIDs;
    v2->_knownInodeIDs = v9;

    initialPath = v2->_initialPath;
    v2->_initialPath = 0LL;

    v2->_fs_num = 0LL;
  }

  return v2;
}

- (void)debugLogStatistics
{
  uint64_t v3 = SALog(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000338B0();
  }

  uint64_t v6 = SALog(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10003384C();
  }

  uint64_t v9 = SALog(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000337E8();
  }

  uint64_t v12 = SALog(v11);
  objc_super v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100033784();
  }

  uint64_t v15 = SALog(v14);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100033720();
  }

  uint64_t v18 = SALog(v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_1000336BC();
  }

  uint64_t v21 = SALog(v20);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100033658();
  }

  uint64_t v24 = SALog(v23);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_1000335F4();
  }

  uint64_t v27 = SALog(v26);
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_100033590();
  }

  uint64_t v30 = SALog(v29);
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_100033500((uint64_t)self, v31);
  }
}

- (void)pushDir:(id)a3 at:(int64_t)a4 withParentPath:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = -[SADirContentCacheEntry initWithData:idx:andParentPath:]( objc_alloc(&OBJC_CLASS___SADirContentCacheEntry),  "initWithData:idx:andParentPath:",  v9,  a4,  v8);

  -[NSMutableArray addObject:](self->_dir_content_cache, "addObject:", v10);
}

- (BOOL)popDir:(id *)a3 at:(int64_t *)a4 ofParentPath:(id *)a5
{
  id v9 = -[NSMutableArray count](self->_dir_content_cache, "count");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_dir_content_cache, "lastObject"));
    *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dir_content"));
    *a4 = (int64_t)[v10 index];
    *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parent_path"));
    -[NSMutableArray removeLastObject](self->_dir_content_cache, "removeLastObject");
  }

  return v9 != 0LL;
}

- (SATraverse)traverseWithPath:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v60 = a3;
  id v9 = (uint64_t (**)(id, id, uint64_t, id))a5;
  v10 = objc_opt_new(&OBJC_CLASS___NSFileManager);
  objc_storeStrong((id *)&self->_initialPath, a3);
  self->_unint64_t options = a4;
  id v11 = -[NSString copy](self->_initialPath, "copy");
  uint64_t v12 = objc_autoreleasePoolPush();
  initialPath = self->_initialPath;
  id v70 = 0LL;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager attributesOfItemAtPath:error:]( v10,  "attributesOfItemAtPath:error:",  initialPath,  &v70));
  id v15 = v70;
  id v61 = [v14 fileSystemNumber];
  if ((id)self->_fs_num != v61)
  {
    -[NSMutableSet removeAllObjects](self->_knownDstreamIDs, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_knownInodeIDs, "removeAllObjects");
    self->_fs_num = (unint64_t)v61;
  }

  objc_autoreleasePoolPop(v12);
  v16 = 0LL;
  v69 = 0LL;
  *(void *)&__int128 v17 = 138412546LL;
  __int128 v59 = v17;
  v63 = v10;
  while (1)
  {
    uint64_t v18 = objc_autoreleasePoolPush();
    if (v69) {
      break;
    }
    id v68 = v15;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager contentsOfDirectoryAtPath:error:]( v10,  "contentsOfDirectoryAtPath:error:",  v11,  &v68));
    id v19 = v68;

    if (v19)
    {
      ++self->_cantEnumerateDir;

      uint64_t v20 = 0LL;
    }

    if ((self->_options & 2) != 0)
    {
      uint64_t v21 = v9[2](v9, v11, 2LL, v19);
      if ((v21 & 1) != 0)
      {
        ++self->_callback_stop;
        uint64_t v55 = SALog(v21);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          sub_100033978();
        }
        goto LABEL_54;
      }

      if ((v21 & 2) != 0)
      {

        v16 = 0LL;
        goto LABEL_35;
      }
    }

    v16 = v20;
    if (v20) {
      goto LABEL_13;
    }
LABEL_35:
    if ((self->_options & 4) != 0)
    {
      char v36 = v9[2](v9, v11, 4LL, v19);

      if ((v36 & 1) != 0)
      {
        ++self->_callback_stop;
        uint64_t v47 = SALog(v37);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          sub_100033914((uint64_t)v11, v48, v49, v50, v51, v52, v53, v54);
        }
        id v19 = 0LL;
        uint64_t v20 = v16;
LABEL_54:
        v46 = v60;

        objc_autoreleasePoolPop(v18);
        id v15 = v19;
        v16 = v20;
        goto LABEL_55;
      }

      id v19 = 0LL;
    }

    id v64 = v11;
    id v65 = v16;
    unsigned __int8 v38 = -[SATraverse popDir:at:ofParentPath:](self, "popDir:at:ofParentPath:", &v65, &v69, &v64, v59);
    id v39 = v65;

    id v35 = v64;
    ++v69;
    if ((v38 & 1) == 0)
    {
      objc_autoreleasePoolPop(v18);
      v44 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      endTime = self->_endTime;
      self->_endTime = v44;

      id v15 = v19;
      v16 = v39;
      id v11 = v35;
      v46 = v60;
      goto LABEL_55;
    }

    id v15 = v19;
    v16 = v39;
LABEL_40:
    objc_autoreleasePoolPop(v18);
    id v11 = v35;
  }

  id v19 = v15;
  if (!v16) {
    goto LABEL_35;
  }
LABEL_13:
  unint64_t v22 = (unint64_t)v69;
  uint64_t v23 = v10;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:v69]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:v24]);
  if (!-[NSFileManager fileExistsAtPath:isDirectory:](v23, "fileExistsAtPath:isDirectory:", v25, &v67))
  {
    ++self->_noPathOutOfReach;
    id v15 = v19;
LABEL_30:
    ++v69;

    id v19 = v15;
    if (v16)
    {
      v10 = v63;
LABEL_32:
      v34 = v69;
      if (v34 != [v16 count])
      {
        id v15 = v19;
        id v35 = v11;
        goto LABEL_40;
      }

      goto LABEL_35;
    }

    v10 = v63;
    goto LABEL_35;
  }

  id v66 = v19;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager attributesOfItemAtPath:error:](v23, "attributesOfItemAtPath:error:", v25, &v66));
  id v15 = v66;

  if (v67)
  {
    v62 = v26;
    id v27 = [v26 fileSystemNumber];
    if (v61 == v27)
    {
      id v28 = v25;
      id v29 = [v28 UTF8String];
      if ((self->_options & 0x10) != 0
        && +[SASupport isFilePurgeable:](&OBJC_CLASS___SASupport, "isFilePurgeable:", v29))
      {
        ++v69;
        ++self->_purgeableFolder;
      }

      else
      {
        ++self->_folderCnt;
        -[SATraverse pushDir:at:withParentPath:](self, "pushDir:at:withParentPath:", v16, v69, v11);
        id v43 = v28;

        v69 = 0LL;
        id v11 = v43;
      }
    }

    else
    {
      id v40 = v27;
      uint64_t v41 = SALog(v27);
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v59;
        v72 = v25;
        __int16 v73 = 2048;
        id v74 = v40;
        _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "fs_num at path %@ is %ld", buf, 0x16u);
      }

      ++v69;
      ++self->_onDifferentVolume;
    }

    v31 = v62;
    goto LABEL_46;
  }

  ++self->_filesDetected;
  unint64_t options = self->_options;
  if ((options & 8) != 0)
  {
    v31 = v26;
    NSFileAttributeType v32 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue([v26 fileType]);

    if (v32 == NSFileTypeSymbolicLink)
    {
      ++v69;
      ++self->_skipSymbolicLink;
LABEL_46:

      id v35 = v11;
      v10 = v63;
      goto LABEL_40;
    }

    unint64_t options = self->_options;
    uint64_t v26 = v31;
  }

  if ((options & 1) == 0)
  {
LABEL_29:

    goto LABEL_30;
  }

  uint64_t v33 = v9[2](v9, v25, 1LL, v15);
  if ((v33 & 1) == 0)
  {
    if ((v33 & 2) != 0)
    {

      v16 = 0LL;
    }

    goto LABEL_29;
  }

  ++self->_callback_stop;
  uint64_t v57 = SALog(v33);
  v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v72 = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "stop at path %@ (on file)", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v18);
  v46 = v60;
  v10 = v63;
LABEL_55:

  return result;
}

- (id)getItemSizeAtPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___SAItemSizeInfo);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v7 = [v6 fileExistsAtPath:v4 isDirectory:&v18];

  if ((v7 & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v17 = 0LL;
    id v9 = [v8 attributesOfItemAtPath:v4 error:&v17];
    id v10 = v17;

    id v11 = (void *)objc_claimAutoreleasedReturnValue([0 objectForKeyedSubscript:NSFileTypeSymbolicLink]);
    if (v11)
    {
      uint64_t v12 = v5;
    }

    else if (v18)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100026750;
      v15[3] = &unk_10004D298;
      v15[4] = self;
      uint64_t v14 = v5;
      v16 = v14;
      -[SATraverse traverseWithPath:options:completionHandler:]( self,  "traverseWithPath:options:completionHandler:",  v4,  25LL,  v15);
      uint64_t v12 = v14;
    }

    else
    {
      uint64_t v12 = (SAItemSizeInfo *)objc_claimAutoreleasedReturnValue(+[SATraverse getFileSize:](&OBJC_CLASS___SATraverse, "getFileSize:", v4));
      if (-[SAItemSizeInfo isFileCloned](v12, "isFileCloned")
        && +[SACloneTreeWalker isNodeID:oldestForDStreamID:forVolPath:]( &OBJC_CLASS___SACloneTreeWalker,  "isNodeID:oldestForDStreamID:forVolPath:",  +[SASupport getInodeIDForPath:](&OBJC_CLASS___SASupport, "getInodeIDForPath:", v4),  +[SASupport getCloneDstreamIDForPath:](&OBJC_CLASS___SASupport, "getCloneDstreamIDForPath:", v4),  v4))
      {
        -[SAItemSizeInfo setDataSize:](v12, "setDataSize:", -[SAItemSizeInfo cloneSize](v12, "cloneSize"));
      }
    }
  }

  else
  {
    uint64_t v12 = v5;
    id v10 = 0LL;
  }

  return v12;
}

+ (id)getFileSize:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___SAItemSizeInfo);
  id v25 = 0LL;
  id v24 = 0LL;
  [v4 getResourceValue:&v25 forKey:NSURLFileAllocatedSizeKey error:&v24];
  id v6 = v25;
  id v7 = v24;
  id v8 = v7;
  uint64_t v23 = v7;
  if (v7 || !v6)
  {
    uint64_t v19 = SALog(v7);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      unint64_t v22 = v8
          ? (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" with error %@",  v8,  v23))
          : &stru_10004D588;
      *(_DWORD *)buf = 138412546;
      id v27 = v3;
      __int16 v28 = 2112;
      id v29 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to get physical size for file (%@)%@",  buf,  0x16u);
      if (v8) {
    }
      }

    id v9 = v4;

    v16 = 0LL;
    id v17 = 0LL;
    BOOL v12 = 0LL;
    BOOL v14 = 0LL;
    id v10 = 0LL;
    char v18 = 0LL;
  }

  else
  {
    id v9 = v4;
    id v10 = (char *)[v6 unsignedLongLongValue];
    id v11 = [v3 fileSystemRepresentation];
    BOOL v12 = +[SASupport isFileCloned:](&OBJC_CLASS___SASupport, "isFileCloned:", v11);
    BOOL v13 = +[SASupport isFilePurgeable:](&OBJC_CLASS___SASupport, "isFilePurgeable:", v11);
    BOOL v14 = v13;
    if (v12) {
      id v15 = v10;
    }
    else {
      id v15 = 0LL;
    }
    if (v13) {
      v16 = 0LL;
    }
    else {
      v16 = v15;
    }
    if (v13) {
      id v17 = v10;
    }
    else {
      id v17 = 0LL;
    }
    if (v13) {
      char v18 = 0LL;
    }
    else {
      char v18 = (char *)(v10 - v15);
    }
  }

  -[SAItemSizeInfo setPhysicalSize:](v5, "setPhysicalSize:", v10);
  -[SAItemSizeInfo setDataSize:](v5, "setDataSize:", v18);
  -[SAItemSizeInfo setCloneSize:](v5, "setCloneSize:", v16);
  -[SAItemSizeInfo setPurgeableSize:](v5, "setPurgeableSize:", v17);
  -[SAItemSizeInfo setIsFileCloned:](v5, "setIsFileCloned:", v12);
  -[SAItemSizeInfo setIsFilePurgeable:](v5, "setIsFilePurgeable:", v14);

  return v5;
}

- (id)getFolderSizeAtPath:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  uint64_t v41 = 0LL;
  uint64_t v34 = 0LL;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  uint64_t v37 = 0LL;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  uint64_t v33 = 0LL;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  uint64_t v29 = 0LL;
  id v7 = objc_opt_new(&OBJC_CLASS___SAItemSizeInfo);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  bzero(&v43, 0x878uLL);
  id v8 = v6;
  uint64_t v9 = statfs((const char *)[v8 fileSystemRepresentation], &v43);
  if ((v9 & 0x80000000) != 0)
  {
    uint64_t v11 = SALog(v9);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = __error();
      BOOL v13 = strerror(*v12);
      sub_100033A50((uint64_t)v13, (uint64_t)v42, (uint64_t)v8, v10);
    }
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v43.f_mntonname));
    -[SAItemSizeInfo setVolumePath:](v7, "setVolumePath:", v10);
  }

  BOOL v14 = objc_autoreleasePoolPush();
  if ((a4 & 2) == 0) {
    goto LABEL_8;
  }
  unsigned int v15 = +[SASupport getDirStatInfoForPath:withOptions:info:]( &OBJC_CLASS___SASupport,  "getDirStatInfoForPath:withOptions:info:",  v8,  (a4 >> 4) & 1,  &v24);
  if (!v15)
  {
    int v17 = 1;
    goto LABEL_18;
  }

  if (v15 != 2)
  {
LABEL_8:
    if ((a4 & 4) == 0)
    {
LABEL_9:
      if ((a4 & 8) != 0)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_100026FA8;
        v23[3] = &unk_10004D2C0;
        v23[4] = &v26;
        v23[5] = &v38;
        v23[6] = &v30;
        v23[7] = &v34;
        -[SATraverse traverseWithPath:options:completionHandler:]( self,  "traverseWithPath:options:completionHandler:",  v8,  9LL,  v23);
      }

      goto LABEL_17;
    }

    unsigned int v16 = +[SASupport enableDirStatInfoForPath:withOptions:andGetInfo:]( &OBJC_CLASS___SASupport,  "enableDirStatInfoForPath:withOptions:andGetInfo:",  v8,  (a4 >> 4) & 1,  &v24);
    if (v16 != 45 && v16 != 2)
    {
      if (!v16)
      {
        int v17 = 1;
        -[SAItemSizeInfo setEnabledDirStat:](v7, "setEnabledDirStat:", 1LL);
        goto LABEL_18;
      }

      -[SAItemSizeInfo setFailedDirStat:](v7, "setFailedDirStat:", 1LL);
      goto LABEL_9;
    }

    -[SAItemSizeInfo setSkippedDirStat:](v7, "setSkippedDirStat:", 1LL);
  }

- (NSMutableSet)knownDstreamIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setKnownDstreamIDs:(id)a3
{
}

- (NSMutableSet)knownInodeIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setKnownInodeIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end