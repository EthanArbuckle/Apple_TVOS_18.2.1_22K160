@interface CacheDeletePruner
+ (id)prunerWithFileAge:(double)a3 dirAge:(double)a4;
- (BOOL)cancel;
- (CacheDeletePruner)initWithFileAge:(double)a3 dirAge:(double)a4;
- (TestTelemetry)testObject;
- (int64_t)dir_age;
- (int64_t)file_age;
- (unint64_t)pruneContainerTmps;
- (unint64_t)pruneDir:(id)a3 bundleID:(id)a4;
- (unint64_t)pruneSystemTmp;
- (unint64_t)pruneUserTmp;
- (void)setCancel:(BOOL)a3;
- (void)setDir_age:(int64_t)a3;
- (void)setFile_age:(int64_t)a3;
- (void)setTestObject:(id)a3;
- (void)stop;
@end

@implementation CacheDeletePruner

- (CacheDeletePruner)initWithFileAge:(double)a3 dirAge:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CacheDeletePruner;
  result = -[CacheDeletePruner init](&v7, "init");
  if (result)
  {
    result->_dir_age = (uint64_t)a4;
    result->_file_age = (uint64_t)a3;
  }

  return result;
}

+ (id)prunerWithFileAge:(double)a3 dirAge:(double)a4
{
  return  -[CacheDeletePruner initWithFileAge:dirAge:]( objc_alloc(&OBJC_CLASS___CacheDeletePruner),  "initWithFileAge:dirAge:",  a3,  a4);
}

- (void)stop
{
}

- (unint64_t)pruneContainerTmps
{
  v3 = objc_autoreleasePoolPush();
  uint64_t RootVolume = getRootVolume();
  v5 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
  if (v5)
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", v5));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __39__CacheDeletePruner_pruneContainerTmps__block_invoke;
    v9[3] = &unk_100008320;
    v9[4] = self;
    +[AppCache enumerateAppCachesOnVolume:options:telemetry:block:]( &OBJC_CLASS___AppCache,  "enumerateAppCachesOnVolume:options:telemetry:block:",  v6,  0LL,  0LL,  v9);
  }

  else
  {
    uint64_t v7 = CDGetLogHandle("client");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to get root volume ", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v3);
  return 0LL;
}

uint64_t __39__CacheDeletePruner_pruneContainerTmps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_autoreleasePoolPush();
  unsigned int v5 = objc_msgSend( *(id *)(a1 + 32),  "cancel",  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0);
  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 dataContainerURL]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v8 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"tmp"]);
    v9 = (const char *)[v8 fileSystemRepresentation];

    if (!v9)
    {
      uint64_t v18 = CDGetLogHandle("client");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Unable to create /tmp/ path for %@",  buf,  0xCu);
LABEL_9:

LABEL_11:
      goto LABEL_12;
    }

    if (stat(v9, &v20) != -1 && (v20.st_mode & 0xF000) == 0x4000)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
      unint64_t v11 = traverse_directory(v10, 0LL);

      uint64_t v12 = CDGetLogHandle("client");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
        *(_DWORD *)buf = 138412546;
        v22 = v14;
        __int16 v23 = 2048;
        unint64_t v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ /tmp/ size: %llu", buf, 0x16u);
      }

      if (v11 > 0xA00000)
      {
        v15 = *(void **)(a1 + 32);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
        [v15 pruneDir:v16 bundleID:v17];
        goto LABEL_9;
      }
    }
  }

- (unint64_t)pruneSystemTmp
{
  return -[CacheDeletePruner pruneDir:bundleID:](self, "pruneDir:bundleID:", @"/private/var/tmp", 0LL);
}

- (unint64_t)pruneUserTmp
{
  return -[CacheDeletePruner pruneDir:bundleID:](self, "pruneDir:bundleID:", @"/private/var/mobile/tmp", 0LL);
}

- (unint64_t)pruneDir:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  uint64_t v34 = 0LL;
  id v8 = v6;
  id v9 = [v8 fileSystemRepresentation];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v30.tv_sec = 0LL;
  *(void *)&v30.tv_usec = 0LL;
  if (gettimeofday(&v30, 0LL))
  {
    uint64_t v11 = CDGetLogHandle("client");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v21 = __error();
      v22 = strerror(*v21);
      *(_DWORD *)buf = 136315138;
      v37 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "gettimeofday failed: %s", buf, 0xCu);
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __39__CacheDeletePruner_pruneDir_bundleID___block_invoke;
  block[3] = &unk_100008370;
  id v28 = v9;
  block[4] = self;
  timeval v29 = v30;
  id v13 = v10;
  id v26 = v13;
  v27 = &v31;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  v15 = v14;
  if (v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePruner testObject](self, "testObject"));
    id v35 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = __39__CacheDeletePruner_pruneDir_bundleID___block_invoke_14;
    v23[3] = &unk_100008398;
    id v24 = v15;
    id v18 = (id)assert_group_cache_deletion( v16,  v17,  v23,  &__block_literal_global);
  }

  else
  {
    (*((void (**)(dispatch_block_t))v14 + 2))(v14);
  }

  unint64_t v19 = v32[3];

  _Block_object_dispose(&v31, 8);
  return v19;
}

void __39__CacheDeletePruner_pruneDir_bundleID___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 56)));
  v16[0] = _NSConcreteStackBlock;
  v16[2] = __39__CacheDeletePruner_pruneDir_bundleID___block_invoke_2;
  v16[3] = &unk_100008348;
  id v3 = *(void **)(a1 + 40);
  v16[4] = *(void *)(a1 + 32);
  v16[1] = 3221225472LL;
  __int128 v19 = *(_OWORD *)(a1 + 64);
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  id v17 = v4;
  uint64_t v18 = v5;
  traverse_directory(v2, v16);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = *(id *)(a1 + 40);
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v12 + 1) + 8LL * (void)v10);
        rmdir((const char *)objc_msgSend(v11, "fileSystemRepresentation", (void)v12));
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }

    while (v8);
  }
}

uint64_t __39__CacheDeletePruner_pruneDir_bundleID___block_invoke_2(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a3 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void **)(a1 + 32);
  if (*(_BYTE *)a3)
  {
    if (v7 >= v8 - (uint64_t)objc_msgSend(v9, "dir_age"))
    {
      *(_BYTE *)(a3 + 1) = 1;
    }

    else
    {
      uint64_t v10 = CDGetLogHandle("client");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 67109378;
        *(_DWORD *)v25 = 167;
        *(_WORD *)&v25[4] = 2080;
        *(void *)&v25[6] = a2;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%d pruneDir rmdir'ing %s",  (uint8_t *)&v24,  0x12u);
      }

      if (rmdir(a2))
      {
        uint64_t v12 = CDGetLogHandle("client");
        __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          stat v20 = __error();
          v21 = strerror(*v20);
          int v24 = 136315394;
          *(void *)v25 = a2;
          *(_WORD *)&v25[8] = 2080;
          *(void *)&v25[10] = v21;
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Could not rmdir %s: %s\n",  (uint8_t *)&v24,  0x16u);
        }

        *(_BYTE *)(a3 + 1) = 1;
        __int128 v14 = *(void **)(a1 + 40);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
        [v14 addObject:v15];
      }
    }
  }

  else if (v7 <= v8 - (uint64_t)objc_msgSend(v9, "file_age"))
  {
    uint64_t v16 = CDGetLogHandle("client");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 67109378;
      *(_DWORD *)v25 = 182;
      *(_WORD *)&v25[4] = 2080;
      *(void *)&v25[6] = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%d pruneDir unlink'ing %s",  (uint8_t *)&v24,  0x12u);
    }

    if (unlink(a2))
    {
      uint64_t v18 = CDGetLogHandle("client");
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v22 = __error();
        __int16 v23 = strerror(*v22);
        int v24 = 136315394;
        *(void *)v25 = a2;
        *(_WORD *)&v25[8] = 2080;
        *(void *)&v25[10] = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "unlink failed on %s : %s",  (uint8_t *)&v24,  0x16u);
      }
    }

    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) += *(void *)(a3 + 8);
    }
  }

  return [*(id *)(a1 + 32) cancel] ^ 1;
}

uint64_t __39__CacheDeletePruner_pruneDir_bundleID___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __39__CacheDeletePruner_pruneDir_bundleID___block_invoke_2_15(id a1, NSError *a2, NSString *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = CDGetLogHandle("client");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to acquire termination assertion for '%@': %@",  (uint8_t *)&v8,  0x16u);
  }
}

- (int64_t)dir_age
{
  return self->_dir_age;
}

- (void)setDir_age:(int64_t)a3
{
  self->_dir_age = a3;
}

- (int64_t)file_age
{
  return self->_file_age;
}

- (void)setFile_age:(int64_t)a3
{
  self->_file_age = a3;
}

- (BOOL)cancel
{
  return self->_cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->_cancel = a3;
}

- (TestTelemetry)testObject
{
  return (TestTelemetry *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTestObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end