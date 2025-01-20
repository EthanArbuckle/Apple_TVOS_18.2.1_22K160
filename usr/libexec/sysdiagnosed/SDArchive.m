@interface SDArchive
- (BOOL)shouldParallelCompress:(int)a3;
- (OS_dispatch_queue)tarQueue;
- (SDArchive)initWithFD:(int)a3 withOptions:(int)a4 withName:(id)a5;
- (SDArchive)initWithPath:(id)a3 withOptions:(int)a4 withName:(id)a5;
- (int)_initlibArchiveshouldCompress:(int)a3;
- (int)_initlibParallelCompressionWithOption:(int)a3;
- (int)_writeArchiveHeader:(void *)a3;
- (int)_writeChunk:(int)a3 maxSize:(int64_t)a4;
- (int)archiveFD;
- (int)getProtectionClass;
- (int64_t)_writeEntryData:(void *)a3 size:(int64_t)a4;
- (int64_t)archiveStatus;
- (int64_t)getUncompressedSize;
- (void)_createHeaderEntrywithFile:(id)a3 attributes:(stat *)a4;
- (void)_disposeEntry:(void *)a3;
- (void)_getCompressionParameters:(id *)a3 forAlgo:(int)a4;
- (void)addArchiveFile:(id)a3;
- (void)addArchiveObject:(id)a3;
- (void)addDirectoryToArchive:(id)a3 withDirName:(id)a4;
- (void)addFileToArchive:(id)a3 withFileName:(id)a4;
- (void)closeArchive;
- (void)finalizeArchiveAndClose:(BOOL)a3;
- (void)setArchiveFD:(int)a3;
- (void)setArchiveStatus:(int64_t)a3;
- (void)setTarQueue:(id)a3;
@end

@implementation SDArchive

- (int)_initlibArchiveshouldCompress:(int)a3
{
  self->_archive = (archive *)archive_write_new(self, a2);
  if (a3)
  {
    if (a3 != 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Invalid compression type for tar",  v11,  2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v10 log:@"SDArchive: Invalid compression type for tar"];

      return -1;
    }

    archive_write_add_filter_gzip();
    archive_write_set_options(self->_archive, "compression-level=1");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Creating tar with gzip compression",  buf,  2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v6 = v5;
    v7 = @"SDArchive: Creating tar with gzip compression";
  }

  else
  {
    archive_write_add_filter_none();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Creating tar without compression",  v12,  2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v6 = v5;
    v7 = @"SDArchive: Creating tar without compression";
  }

  [v5 log:v7];

  archive_write_set_format_pax(self->_archive);
  if (!archive_write_open_fd(self->_archive, self->_archiveFD))
  {
    disk_new = (archive *)archive_read_disk_new();
    int result = 0;
    self->_disk_reader = disk_new;
    return result;
  }

  return -1;
}

- (void)_getCompressionParameters:(id *)a3 forAlgo:(int)a4
{
  a3->var0 = 2;
  a3->var1 = a4;
  unint64_t v4 = 0x100000LL;
  if (a4 == 3) {
    unint64_t v4 = 0x400000LL;
  }
  a3->var2 = v4;
  a3->var3 = v4;
}

- (int)_initlibParallelCompressionWithOption:(int)a3
{
  if ((a3 - 2) >= 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Invalid compression type for yaa",  buf,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v9 = v8;
    v10 = @"SDArchive: Invalid compression type for yaa";
    goto LABEL_11;
  }

  uint64_t v4 = dword_100064D28[a3 - 2];
  p_archiveFD = 0LL;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  *(_OWORD *)buf = 0u;
  -[SDArchive _getCompressionParameters:forAlgo:](self, "_getCompressionParameters:forAlgo:", buf, v4);
  p_archiveFD = &self->_archiveFD;
  *(void *)&__int128 v19 = sub_10004FF08;
  v5 = (void *)ParallelCompressionOStreamCreate(buf);
  self->_ostream = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ParallelCompressionOStreamCreate failed",  v13,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v9 = v8;
    v10 = @"ParallelCompressionOStreamCreate failed";
LABEL_11:
    [v8 log:v10];
    int v7 = -1;
LABEL_12:

    return v7;
  }

  *(void *)v13 = 0LL;
  v14 = &ParallelCompressionOStreamWrite;
  v15 = &ParallelCompressionOStreamAbort;
  v16 = v5;
  v6 = (void *)ParallelArchiveWriterCreate(v13);
  self->_writer = v6;
  if (!v6)
  {
    ParallelCompressionOStreamDestroy(self->_ostream);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ParallelArchiveWriterCreate failed",  v12,  2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v9 log:@"ParallelArchiveWriterCreate failed"];
    int v7 = 0;
    goto LABEL_12;
  }

  return 0;
}

- (BOOL)shouldParallelCompress:(int)a3
{
  return (a3 - 2) < 3;
}

- (SDArchive)initWithPath:(id)a3 withOptions:(int)a4 withName:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v9 = (const char *)[a3 fileSystemRepresentation];
  BOOL v10 = -[SystemDiagnostic isDeviceUnlockedSinceBoot]_0();
  uint64_t v11 = sub_100022E38(v9, v10);
  if ((_DWORD)v11 == -1)
  {
    v12 = 0LL;
  }

  else
  {
    self = -[SDArchive initWithFD:withOptions:withName:](self, "initWithFD:withOptions:withName:", v11, v5, v8);
    v12 = self;
  }

  return v12;
}

- (SDArchive)initWithFD:(int)a3 withOptions:(int)a4 withName:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a5;
  if ((a3 & 0x80000000) == 0)
  {
    v42.receiver = self;
    v42.super_class = (Class)&OBJC_CLASS___SDArchive;
    BOOL v10 = -[SDArchive init](&v42, "init");
    self = v10;
    if (!v10) {
      goto LABEL_31;
    }
    v10->_int archiveFD = a3;
    v10->_archiveStatus = 0LL;
    v10->_shouldCompress = (v6 & 0xFFFFFFFD) != 0;
    v10->_uncompressed_size = 0LL;
    v10->_compressed_size = 0LL;
    v10->_useParallelCompression = -[SDArchive shouldParallelCompress:](v10, "shouldParallelCompress:", v6);
    uint64_t v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
    objects = self->_objects;
    self->_objects = v11;

    objc_storeStrong((id *)&self->_name, a5);
    id v13 = sub_100022A9C(self->_archiveFD);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue([v14 stringByDeletingPathExtension]);
    basePath = self->_basePath;
    self->_basePath = v15;

    if (self->_shouldCompress && !self->_useParallelCompression)
    {
      v17 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingPathExtension](self->_basePath, "stringByDeletingPathExtension"));
      __int128 v18 = self->_basePath;
      self->_basePath = v17;
    }

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingString:]( self->_basePath,  "stringByAppendingString:",  @"-diagnostic_summary.log"));
    v20 = v19;
    if (v19)
    {
      id v21 = v19;
      v22 = fopen((const char *)[v21 fileSystemRepresentation], "wx");
      self->_summaryFD = v22;
      if (!v22)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v23 = __error();
          v24 = strerror(*v23);
          *(_DWORD *)buf = 138412546;
          id v44 = v21;
          __int16 v45 = 2080;
          *(void *)v46 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to open fd at %@ with error %s",  buf,  0x16u);
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        v26 = __error();
        [v25 log:@"Failed to open fd at %@ with error %s", v21, strerror(*v26)];
      }
    }

    if (self->_useParallelCompression)
    {
      v27 = dlopen(0LL, 2);
      if (v27)
      {
        v28 = v27;
        dlerror();
        if (!dlsym(v28, "ParallelArchiveWriterCreate"))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Couldn't locate PatallelCompression. Defaulting to libarchive",  buf,  2u);
          }

          v29 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v29 log:@"SDArchive: Couldn't locate PatallelCompression. Defaulting to libarchive"];

          self->_useParallelCompression = 0;
        }

        dlclose(v28);
        if (self->_useParallelCompression)
        {
          unsigned int v30 = -[SDArchive _initlibParallelCompressionWithOption:](self, "_initlibParallelCompressionWithOption:", v6);
LABEL_23:
          unsigned int v32 = v30;
          BOOL v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
          if (v32)
          {
            if (v33)
            {
              *(_DWORD *)buf = 138412290;
              id v44 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Error creating archive at path %@",  buf,  0xCu);
            }

            v34 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
            [v34 log:@"SDArchive: Error creating archive at path %@", v14];

            goto LABEL_27;
          }

          if (v33)
          {
            unsigned int v36 = -[SDArchive getProtectionClass](self, "getProtectionClass");
            int archiveFD = self->_archiveFD;
            *(_DWORD *)buf = 138412802;
            id v44 = v14;
            __int16 v45 = 1024;
            *(_DWORD *)v46 = v36;
            *(_WORD *)&v46[4] = 1024;
            *(_DWORD *)&v46[6] = archiveFD;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Successfully created tar at %@ with class %d and descriptor %d",  buf,  0x18u);
          }

          v38 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          [v38 log:@"SDArchive: Successfully created tar at %@ with class %d and descriptor %d", v14, -[SDArchive getProtectionClass](self, "getProtectionClass"), self->_archiveFD];

          v39 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.sysdiagnose.tar", 0LL);
          tarQueue = self->_tarQueue;
          self->_tarQueue = v39;

LABEL_31:
          self = self;
          v35 = self;
          goto LABEL_32;
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Couldn't get handle to current executable",  buf,  2u);
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        [v31 log:@"Couldn't get handle to current executable"];

        self->_useParallelCompression = 0;
      }
    }

    unsigned int v30 = -[SDArchive _initlibArchiveshouldCompress:](self, "_initlibArchiveshouldCompress:", v6);
    goto LABEL_23;
  }

- (int)_writeChunk:(int)a3 maxSize:(int64_t)a4
{
  unint64_t v4 = a4;
  else {
    size_t v7 = a4;
  }
  ssize_t v8 = read(a3, v13, v7);
  if (v8 < 1) {
    return 0;
  }
  ssize_t v9 = v8;
  while (1)
  {
    int64_t v10 = -[SDArchive _writeEntryData:size:](self, "_writeEntryData:size:", v13, v9);
    if (v10 != v9) {
      break;
    }
    self->_archiveStatus = 0LL;
    v4 -= v9;
    if (v4)
    {
      size_t v11 = v4 >= 0x2000 ? 0x2000LL : v4;
      ssize_t v9 = read(a3, v13, v11);
      if (v9 > 0) {
        continue;
      }
    }

    return 0;
  }

  self->_archiveStatus = v10;
  return -1;
}

- (void)_createHeaderEntrywithFile:(id)a3 attributes:(stat *)a4
{
  id v6 = a3;
  size_t v7 = (const char *)[v6 UTF8String];
  if (!self->_useParallelCompression)
  {
    uint64_t v11 = archive_entry_new();
    if (v11)
    {
      ssize_t v9 = (void *)v11;
      archive_entry_copy_stat(v11, a4);
      archive_entry_set_pathname(v9, v7);
      goto LABEL_18;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: archive_entry_new() failed!",  buf,  2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v14, "log:", @"SDArchive: archive_entry_new() failed!", v19);
LABEL_16:

LABEL_17:
    ssize_t v9 = 0LL;
    goto LABEL_18;
  }

  ssize_t v8 = malloc(0x890uLL);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = __error();
      id v13 = strerror(*v12);
      *(_DWORD *)buf = 136315138;
      id v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: malloc failed, err : %s",  buf,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    v15 = __error();
    objc_msgSend(v14, "log:", @"SDArchive: malloc failed, err : %s", strerror(*v15));
    goto LABEL_16;
  }

  ssize_t v9 = v8;
  bzero(v8, 0x890uLL);
  if (strlen(v7) >= 0x400)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = (char *)v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: header entry for file path %@ is too long, skipping.",  buf,  0xCu);
    }

    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v10 log:@"SDArchive: header entry for file path %@ is too long, skipping.", v6];

    free(v9);
    goto LABEL_17;
  }

  uint64_t v16 = *(void *)&a4->st_uid;
  *((_DWORD *)v9 + 4) = a4->st_flags;
  *((_DWORD *)v9 + 5) = 33188;
  off_t st_size = a4->st_size;
  v9[8] = st_size;
  v9[5] = st_size;
  void *v9 = 0x4600008201LL;
  v9[1] = v16;
  __strlcpy_chk(v9 + 18, v7, 1024LL, 1024LL);
LABEL_18:

  return v9;
}

- (void)_disposeEntry:(void *)a3
{
  if (self->_useParallelCompression) {
    free(a3);
  }
  else {
    archive_entry_free(a3, a2);
  }
}

- (int)_writeArchiveHeader:(void *)a3
{
  if (self->_useParallelCompression)
  {
    int v4 = ParallelArchiveWriteEntryHeader(self->_writer, a3, 0LL, 0LL);
    if (v4 < 0) {
      self->_int64_t archiveStatus = -30LL;
    }
  }

  else
  {
    int v4 = archive_write_header(self->_archive, a3);
    if (v4)
    {
      self->_int64_t archiveStatus = (int)archive_errno(self->_archive);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int64_t archiveStatus = self->_archiveStatus;
        uint64_t v6 = archive_error_string(self->_archive);
        *(_DWORD *)buf = 134218242;
        int64_t v10 = archiveStatus;
        __int16 v11 = 2080;
        uint64_t v12 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: failed to write header. Status: %zd, reason: %s",  buf,  0x16u);
      }

      size_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend( v7,  "log:",  @"SDArchive: failed to write header. Status: %zd, reason: %s",  self->_archiveStatus,  archive_error_string(self->_archive));
    }
  }

  return v4;
}

- (int64_t)_writeEntryData:(void *)a3 size:(int64_t)a4
{
  int64_t v4 = a4;
  if (self->_useParallelCompression)
  {
    uint64_t v6 = ParallelArchiveWriteEntryData(self->_writer, a3, a4);
    if ((_DWORD)v6)
    {
      uint64_t v7 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: ParallelCompression failed with error %d",  buf,  8u);
      }

      ssize_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      objc_msgSend(v8, "log:", @"SDArchive: ParallelCompression failed with error %d", v7);

      return (int)v7;
    }
  }

  else
  {
    uint64_t v9 = archive_write_data(self->_archive, a3, a4);
    if (v9 != v4)
    {
      int64_t v10 = v9;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = archive_errno(self->_archive);
        uint64_t v12 = archive_error_string(self->_archive);
        *(_DWORD *)buf = 134218498;
        int64_t v17 = v10;
        __int16 v18 = 1024;
        int v19 = v11;
        __int16 v20 = 2080;
        uint64_t v21 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: SDArchive failed by returning %zd with error number %d and string %s",  buf,  0x1Cu);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      uint64_t v14 = archive_errno(self->_archive);
      objc_msgSend( v13,  "log:",  @"SDArchive: SDArchive failed by returning %zd with error number %d and string %s",  v10,  v14,  archive_error_string(self->_archive));

      return v10;
    }
  }

  return v4;
}

- (void)addArchiveObject:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 fd];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sourcePath]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 targetPath]);
  ssize_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 offsets]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 sizes]);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000579F0();
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v14 = @"SDArchive: not going to add file to archive, as its source path is nil";
    objc_msgSend(v13, "stderrWrite:", @"SDArchive: not going to add file to archive, as its source path is nil");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v16 = v15;
    goto LABEL_12;
  }

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100057A34((uint64_t)v6);
    }
    int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v14 = @"SDArchive: not going to add source file %@ to archive, as its target path is nil";
    [v17 stderrWrite:@"SDArchive: not going to add source file %@ to archive, as its target path is nil", v6];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    uint64_t v16 = v15;
    v49 = v6;
LABEL_12:
    objc_msgSend(v15, "log:", v14, v49);
LABEL_13:

    goto LABEL_14;
  }

  id v10 = 0LL;
  int64_t archiveStatus = self->_archiveStatus;
  if (archiveStatus == -30 || archiveStatus == 1)
  {
    id v12 = 0LL;
    goto LABEL_15;
  }

  if (self->_archiveFD < 0)
  {
LABEL_14:
    id v10 = 0LL;
    id v12 = 0LL;
    goto LABEL_15;
  }

  if (-[NSMutableSet containsObject:](self->_objects, "containsObject:", v7))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: not going to add %@ to the archive, as it is already present",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v16 log:@"SDArchive: not going to add %@ to the archive, as it is already present", v7];
    goto LABEL_13;
  }

  -[NSMutableSet addObject:](self->_objects, "addObject:", v7);
  if (v5 == -1)
  {
    id v18 = v6;
    unsigned int v5 = sub_10004D5F8((const char *)[v18 fileSystemRepresentation], 0);
    if (v5 == -1)
    {
      uint64_t v33 = *__error();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf.st_dev = 138412802;
        *(void *)&buf.st_mode = v18;
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)strerror(v33);
        HIWORD(buf.st_gid) = 1024;
        buf.st_rdev = v33;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Error opening source file %@: %s (%d)",  (uint8_t *)&buf,  0x1Cu);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      [v34 log:@"SDArchive: Error opening source file %@: %s (%d)", v18, strerror(v33), v33];

      goto LABEL_14;
    }
  }

  if (fstat(v5, &buf) == -1)
  {
    uint64_t v30 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v55 = 138412802;
      v56 = (char *)v6;
      __int16 v57 = 2080;
      v58 = strerror(v30);
      __int16 v59 = 1024;
      int v60 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Failed to stat source file %@: %s (%d)",  v55,  0x1Cu);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v31 log:@"SDArchive: Failed to stat source file %@: %s (%d)", v6, strerror(v30), v30];

    id v10 = 0LL;
    id v12 = 0LL;
  }

  else
  {
    unsigned int v52 = v5;
    if (v8
      && [v8 count]
      && (int v19 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKeyPath:@"@sum.self"]),
          id v20 = [v19 longLongValue],
          v19,
          v20)
      && (uint64_t)v20 < buf.st_size)
    {
      buf.off_t st_size = (off_t)v20;
    }

    else
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
      v54 = v21;
      uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", buf.st_size));
      v53 = v23;
      uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL));

      uint64_t v9 = (void *)v24;
      ssize_t v8 = (void *)v22;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v7 pathComponents]);
    id v10 = [v25 mutableCopy];

    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v10));
    v26 = -[SDArchive _createHeaderEntrywithFile:attributes:](self, "_createHeaderEntrywithFile:attributes:", v12, &buf);
    if (v26)
    {
      v27 = v26;
      if (!self->_useParallelCompression)
      {
        archive_entry_copy_sourcepath(v26, [v6 UTF8String]);
        archive_read_disk_entry_from_file(self->_disk_reader, v27, v5, &buf);
        archive_entry_set_mode(v27, 33188LL);
      }

      v50 = v27;
      if (-[SDArchive _writeArchiveHeader:](self, "_writeArchiveHeader:", v27))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (char *)[v12 UTF8String];
          *(_DWORD *)v55 = 136315138;
          v56 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: failed to write header for file, %s",  v55,  0xCu);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
        id v12 = v12;
        objc_msgSend( v29,  "log:",  @"SDArchive: failed to write header for file, %s",  objc_msgSend(v12, "UTF8String"));

        -[SDArchive _disposeEntry:](self, "_disposeEntry:", v50);
      }

      else
      {
        v51 = v9;
        if ([v8 count])
        {
          uint64_t v35 = 0LL;
          while (1)
          {
            unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v35]);
            unint64_t v37 = (unint64_t)[v36 longLongValue];

            if (v37)
            {
              off_t v38 = lseek(v52, v37, (v37 >> 62) & 2);
              if (v38 < 0) {
                break;
              }
            }

            v39 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndexedSubscript:v35]);
            id v40 = [v39 longLongValue];

            if (-[SDArchive _writeChunk:maxSize:](self, "_writeChunk:maxSize:", v52, v40))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v55 = 138412546;
                v56 = (char *)v6;
                __int16 v57 = 2112;
                v58 = (char *)v12;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Failed for file: %@, with destination at: %@",  v55,  0x16u);
              }

              v41 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
              [v41 log:@"SDArchive: Failed for file: %@, with destination at: %@", v6, v12];

              goto LABEL_62;
            }
          }

          int64_t v42 = v38;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v43 = __error();
            id v44 = strerror(*v43);
            *(_DWORD *)v55 = 136315138;
            v56 = v44;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "lseek failed :%s",  v55,  0xCu);
          }

          __int16 v45 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
          v46 = __error();
          objc_msgSend(v45, "log:", @"lseek failed :%s", strerror(*v46));

          self->_int64_t archiveStatus = v42;
        }

- (void)addFileToArchive:(id)a3 withFileName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  ssize_t v8 = -[SDArchiveFile initWithPath:target:ofType:]( objc_alloc(&OBJC_CLASS___SDArchiveFile),  "initWithPath:target:ofType:",  v7,  v6,  NSFileTypeRegular);

  -[SDArchive addArchiveObject:](self, "addArchiveObject:", v8);
}

- (void)addDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  id v5 = a3;
  id v23 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v21 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v5, 1LL));
  v30[0] = NSURLNameKey;
  v30[1] = NSURLIsDirectoryKey;
  ssize_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v6 enumeratorAtURL:v7 includingPropertiesForKeys:v8 options:20 errorHandler:&stru_100089DF8]);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v14);
        uint64_t v16 = objc_autoreleasePoolPush();
        id v24 = 0LL;
        [v15 getResourceValue:&v24 forKey:NSURLIsDirectoryKey error:0];
        id v17 = v24;
        if (([v17 BOOLValue] & 1) == 0)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 relativePath]);
          int v19 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v23 stringByAppendingPathComponent:v18]);
          -[SDArchive addFileToArchive:withFileName:](self, "addFileToArchive:withFileName:", v19, v20);
        }

        objc_autoreleasePoolPop(v16);
        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v12);
  }
}

- (void)addArchiveFile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    NSFileAttributeType v5 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue([v4 fileType]);

    if (v5 == NSFileTypeDirectory)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 sourcePath]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 targetPath]);
      -[SDArchive addDirectoryToArchive:withDirName:](self, "addDirectoryToArchive:withDirName:", v6, v7);
    }

    else
    {
      -[SDArchive addArchiveObject:](self, "addArchiveObject:", v8);
    }

    id v4 = v8;
  }
}

- (int)getProtectionClass
{
  return sub_100022B98(self->_archiveFD);
}

- (int64_t)getUncompressedSize
{
  return self->_uncompressed_size;
}

- (void)closeArchive
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int archiveFD = self->_archiveFD;
    *(_DWORD *)stat buf = 67109120;
    int v9 = archiveFD;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Closing archive with descriptor %d",  buf,  8u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v4, "log:", @"SDArchive: Closing archive with descriptor %d", self->_archiveFD);

  int v5 = self->_archiveFD;
  if (v5 < 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = self->_archiveFD;
      *(_DWORD *)stat buf = 67109120;
      int v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDArchive: Not a valid tar descriptor %d to close",  buf,  8u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "log:", @"SDArchive: Not a valid tar descriptor %d to close", self->_archiveFD);
  }

  else
  {
    close(v5);
  }

  self->_int archiveFD = -1;
}

- (void)finalizeArchiveAndClose:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingString:]( self->_basePath,  "stringByAppendingString:",  @"-diagnostic_summary.log"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](self->_basePath, "lastPathComponent"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"/summaries/diagnostic_summary.log"]);

  summaryFD = self->_summaryFD;
  if (summaryFD)
  {
    fclose(summaryFD);
    -[SDArchive addFileToArchive:withFileName:](self, "addFileToArchive:withFileName:", v5, v7);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v15 = 0LL;
    unsigned __int8 v10 = [v9 removeItemAtPath:v5 error:&v15];
    id v11 = v15;

    if ((v10 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
        *(_DWORD *)stat buf = 138412290;
        id v17 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SDARCHIVE: error removing summary file %@",  buf,  0xCu);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
      [v13 log:@"SDARCHIVE: error removing summary file %@", v14];
    }
  }

  if (self->_useParallelCompression)
  {
    ParallelArchiveWriterDestroy(self->_writer);
    ParallelCompressionOStreamDestroy(self->_ostream);
    if (!v3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  archive_write_close(self->_archive);
  archive_write_free(self->_archive);
  archive_read_free(self->_disk_reader);
  if (v3) {
LABEL_9:
  }
    -[SDArchive closeArchive](self, "closeArchive");
LABEL_10:
  if (!self->_archiveStatus) {
    self->_int64_t archiveStatus = 1LL;
  }
}

- (OS_dispatch_queue)tarQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setTarQueue:(id)a3
{
}

- (int64_t)archiveStatus
{
  return self->_archiveStatus;
}

- (void)setArchiveStatus:(int64_t)a3
{
  self->_int64_t archiveStatus = a3;
}

- (int)archiveFD
{
  return self->_archiveFD;
}

- (void)setArchiveFD:(int)a3
{
  self->_int archiveFD = a3;
}

- (void).cxx_destruct
{
}

@end