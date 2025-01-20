@interface StreamingFileWriter
+ (id)fileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 error:(id *)a11;
+ (id)synchronousFileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 error:(id *)a8;
- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8;
- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4;
- (BOOL)suspendWithError:(id *)a3;
- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (NSString)path;
- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 error:(id *)a9;
- (id)description;
- (int)currentOutputFD;
- (int64_t)currentOffsetWithError:(id *)a3;
- (int64_t)fileSize;
- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)closeCurrentOutputFD;
- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5;
- (void)dealloc;
- (void)setCurrentOutputFD:(int)a3;
- (void)setIncompleteExtractionAttribute;
@end

@implementation StreamingFileWriter

- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8
{
  unsigned int v10 = a5;
  id v13 = a3;
  uint64_t v14 = -[StreamingFileWriter fileSize](self, "fileSize");
  id v15 = v13;
  v16 = (const char *)[v15 fileSystemRepresentation];

  if ((a4 & 0x200) != 0) {
    uint64_t v37 = v10;
  }
  uint64_t v17 = open(v16, a4, v37);
  uint64_t v18 = v17;
  if ((v17 & 0x80000000) == 0)
  {
    if (fcntl(v17, 68, 1LL) < 0)
    {
      int v25 = *__error();
      v26 = sub_100004680();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v39 = v16;
        __int16 v40 = 1024;
        int v41 = v25;
        __int16 v42 = 2080;
        v43 = strerror(v25);
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Could not mark %s static: %d (%s)",  buf,  0x1Cu);
      }

      if (a6) {
        goto LABEL_20;
      }
    }

    else if (a6)
    {
LABEL_20:
      if (fcntl(v18, 76, 1LL) < 0)
      {
        int v31 = *__error();
        v32 = sub_100004680();
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v35 = strerror(v31);
          *(_DWORD *)buf = 136315650;
          v39 = v16;
          __int16 v40 = 1024;
          int v41 = v31;
          __int16 v42 = 2080;
          v43 = v35;
          _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Unable to set F_SINGLE_WRITER on %s : %d (%s)",  buf,  0x1Cu);
        }
      }

      -[StreamingFileWriter setCurrentOutputFD:](self, "setCurrentOutputFD:", v18);
      id v24 = 0LL;
      goto LABEL_25;
    }

    if ((v14 >= 0x8000 || v14 == -1) && fcntl(v18, 48, 1LL) < 0)
    {
      int v28 = *__error();
      v29 = sub_100004680();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v36 = strerror(v28);
        *(_DWORD *)buf = 136315650;
        v39 = v16;
        __int16 v40 = 1024;
        int v41 = v28;
        __int16 v42 = 2080;
        v43 = v36;
        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Unable to set F_NOCACHE accessing file %s : %d (%s)",  buf,  0x1Cu);
      }
    }

    goto LABEL_20;
  }

  int v19 = *__error();
  v20 = sub_100004680();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v39 = v16;
    __int16 v40 = 1024;
    int v41 = v19;
    __int16 v42 = 2080;
    v43 = strerror(v19);
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to open %s : %d (%s)", buf, 0x1Cu);
  }

  strerror(v19);
  id v23 = sub_100007A7C( (uint64_t)"-[StreamingFileWriter _openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:]",  93LL,  NSPOSIXErrorDomain,  v19,  0LL,  0LL,  @"Failed to open %s : %d (%s)",  v22,  (uint64_t)v16);
  id v24 = (id)objc_claimAutoreleasedReturnValue(v23);
  if (a8)
  {
    id v24 = v24;
    *a8 = v24;
  }

- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 error:(id *)a9
{
  BOOL v10 = a7;
  uint64_t v12 = a5;
  uint64_t v13 = *(void *)&a4;
  id v16 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___StreamingFileWriter;
  uint64_t v17 = -[StreamingFileWriter init](&v21, "init");
  uint64_t v18 = v17;
  if (v17
    && (v17->_fileSize = a8,
        objc_storeStrong((id *)&v17->_path, a3),
        v18->_currentOutputFD = -1,
        !-[StreamingFileWriter _openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:]( v18,  "_openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:",  v16,  v13,  v12,  v10,  a6,  a9)))
  {
    int v19 = 0LL;
  }

  else
  {
    int v19 = v18;
  }

  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StreamingFileWriter;
  -[StreamingFileWriter dealloc](&v3, "dealloc");
}

- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  ssize_t v7 = read(-[StreamingFileWriter currentOutputFD](self, "currentOutputFD"), a3, a4);
  if (v7 == -1)
  {
    int v8 = *__error();
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriter path](self, "path"));
    BOOL v10 = sub_100004680();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v9;
      __int16 v21 = 1024;
      int v22 = v8;
      __int16 v23 = 2080;
      id v24 = strerror(v8);
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to read bytes from %@ : %d (%s)",  buf,  0x1Cu);
    }

    NSErrorUserInfoKey v17 = NSFilePathErrorKey;
    uint64_t v18 = v9;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    strerror(v8);
    id v14 = sub_100007A7C( (uint64_t)"-[StreamingFileWriter readIntoBuffer:length:error:]",  210LL,  NSPOSIXErrorDomain,  v8,  0LL,  v12,  @"Failed to read bytes from %@ : %d (%s)",  v13,  (uint64_t)v9);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (a5) {
      *a5 = v15;
    }
  }

  return v7;
}

- (int64_t)currentOffsetWithError:(id *)a3
{
  off_t v5 = lseek(-[StreamingFileWriter currentOutputFD](self, "currentOutputFD"), 0LL, 1);
  if (v5 == -1)
  {
    uint64_t v6 = *__error();
    ssize_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriter path](self, "path"));
    int v8 = sub_100004680();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v7;
      __int16 v19 = 2080;
      v20 = strerror(v6);
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to seek to current offset in output file at path %@ : %s",  buf,  0x16u);
    }

    NSErrorUserInfoKey v15 = NSFilePathErrorKey;
    id v16 = v7;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    strerror(v6);
    id v12 = sub_100007A7C( (uint64_t)"-[StreamingFileWriter currentOffsetWithError:]",  225LL,  NSPOSIXErrorDomain,  v6,  0LL,  v10,  @"Failed to seek to current offset in output file at path %@ : %s",  v11,  (uint64_t)v7);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (a3) {
      *a3 = v13;
    }
  }

  return v5;
}

- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4
{
  off_t v7 = lseek(-[StreamingFileWriter currentOutputFD](self, "currentOutputFD"), a3, 0);
  if (v7 == -1)
  {
    uint64_t v8 = *__error();
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriter path](self, "path"));
    BOOL v10 = sub_100004680();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      int64_t v20 = a3;
      __int16 v21 = 2112;
      int v22 = v9;
      __int16 v23 = 2080;
      id v24 = strerror(v8);
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to seek to offset %llu in output file at path %@ : %s",  buf,  0x20u);
    }

    NSErrorUserInfoKey v17 = NSFilePathErrorKey;
    uint64_t v18 = v9;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    strerror(v8);
    id v14 = sub_100007A7C( (uint64_t)"-[StreamingFileWriter setCurrentOffset:error:]",  239LL,  NSPOSIXErrorDomain,  v8,  0LL,  v12,  @"Failed to seek to offset %llu in output file at path %@ : %s",  v13,  a3);
    NSErrorUserInfoKey v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (a4) {
      *a4 = v15;
    }
  }

  return v7 != -1;
}

- (void)setIncompleteExtractionAttribute
{
  if (fsetxattr( -[StreamingFileWriter currentOutputFD](self, "currentOutputFD"),  "com.apple.streamingzip.incomplete_extraction",  "y",  1uLL,  0,  0))
  {
    int v3 = *__error();
    v4 = sub_100004680();
    off_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriter path](self, "path"));
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2080;
      BOOL v10 = strerror(v3);
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Failed to set incomplete extraction xattr on %@ : %s",  (uint8_t *)&v7,  0x16u);
    }
  }

- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  int v9 = -[StreamingFileWriter currentOutputFD](self, "currentOutputFD");
  uint64_t v10 = 0LL;
  do
  {
    if (a4 == v10) {
      return 1;
    }
    ssize_t v11 = write(v9, (char *)a3 + v10, a4 - v10);
    v10 += v11;
  }

  while ((v11 & 0x8000000000000000LL) == 0);
  if (a4 == -1LL) {
    return 1;
  }
  uint64_t v12 = *__error();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriter path](self, "path"));
  id v14 = sub_100004680();
  NSErrorUserInfoKey v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v13;
    __int16 v25 = 2080;
    v26 = strerror(v12);
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to write data to output file at %@: %s",  buf,  0x16u);
  }

  NSErrorUserInfoKey v21 = NSFilePathErrorKey;
  int v22 = v13;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  strerror(v12);
  id v18 = sub_100007A7C( (uint64_t)"-[StreamingFileWriter writeBuffer:length:error:]",  263LL,  NSPOSIXErrorDomain,  v12,  0LL,  v16,  @"Failed to write data to output file at %@: %s",  v17,  (uint64_t)v13);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (a5) {
    *a5 = v19;
  }

  return 0;
}

- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5
{
  BOOL v7 = a3;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriter path](self, "path"));
  uint64_t v10 = -[StreamingFileWriter fileSize](self, "fileSize");
  int v11 = -[StreamingFileWriter currentOutputFD](self, "currentOutputFD");
  int v12 = v11;
  if (v10 > 0x4000)
  {
    *(void *)&buf[16] = v10;
    uint64_t v26 = 0LL;
    *(void *)buf = 0x300000002LL;
    *(void *)&buf[8] = 0LL;
    if (fcntl(v11, 42, buf) == -1)
    {
      int v13 = *__error();
      id v14 = sub_100004680();
      NSErrorUserInfoKey v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v24 = strerror(v13);
        *(_DWORD *)int v28 = 134218498;
        uint64_t v29 = v10;
        __int16 v30 = 2112;
        int v31 = v9;
        __int16 v32 = 2080;
        v33 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Advisory preallocation of %lld bytes for %@ failed: %s",  v28,  0x20u);
      }
    }
  }

  if (fchmod(v12, 0x180u))
  {
    int v16 = *__error();
    uint64_t v17 = sub_100004680();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v22 = strerror(v16);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Setting initial mode on %@ failed: %s",  buf,  0x16u);
    }
  }

  if (v7 && fchown(v12, a4, a5))
  {
    int v19 = *__error();
    int64_t v20 = sub_100004680();
    NSErrorUserInfoKey v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = strerror(v19);
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a4;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a5;
      LOWORD(v26) = 1024;
      *(_DWORD *)((char *)&v26 + 2) = v19;
      HIWORD(v26) = 2080;
      v27 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to fchown %@ to (%d:%d) : %d (%s)",  buf,  0x28u);
    }
  }
}

- (BOOL)suspendWithError:(id *)a3
{
  return 1;
}

- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  int v6 = a5;
  uint64_t v7 = *(void *)&a4.tv_usec;
  __darwin_time_t tv_sec = a4.tv_sec;
  uint64_t v9 = *(void *)&a3.tv_usec;
  __darwin_time_t v10 = a3.tv_sec;
  int v12 = -[StreamingFileWriter currentOutputFD]( self,  "currentOutputFD",  a3.tv_sec,  *(void *)&a3.tv_usec,  a4.tv_sec,  *(void *)&a4.tv_usec,  a5,  a6);
  v27.__darwin_time_t tv_sec = v10;
  *(void *)&v27.tv_usec = v9;
  __darwin_time_t v28 = tv_sec;
  uint64_t v29 = v7;
  if (futimes(v12, &v27))
  {
    int v13 = *__error();
    id v14 = sub_100004680();
    NSErrorUserInfoKey v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriter path](self, "path"));
      int v23 = 138412546;
      id v24 = v20;
      __int16 v25 = 2080;
      v26[0] = strerror(v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to set times on %@ : %s",  (uint8_t *)&v23,  0x16u);
    }
  }

  if (fchmod(v12, v6))
  {
    int v16 = *__error();
    uint64_t v17 = sub_100004680();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSErrorUserInfoKey v21 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriter path](self, "path"));
      int v22 = strerror(v16);
      int v23 = 138412802;
      id v24 = v21;
      __int16 v25 = 1024;
      LODWORD(v26[0]) = v6;
      WORD2(v26[0]) = 2080;
      *(void *)((char *)v26 + 6) = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to set mode of %@ to 0%o: %s",  (uint8_t *)&v23,  0x1Cu);
    }
  }

  return 1;
}

- (void)closeCurrentOutputFD
{
  int v3 = -[StreamingFileWriter currentOutputFD](self, "currentOutputFD");
  if ((v3 & 0x80000000) == 0)
  {
    close(v3);
    -[StreamingFileWriter setCurrentOutputFD:](self, "setCurrentOutputFD:", 0xFFFFFFFFLL);
  }

- (id)description
{
  int v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  off_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[StreamingFileWriter path](self, "path"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: path=%@>",  v5,  v6));

  return v7;
}

- (int)currentOutputFD
{
  return self->_currentOutputFD;
}

- (void)setCurrentOutputFD:(int)a3
{
  self->_currentOutputFD = a3;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

+ (id)fileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 error:(id *)a11
{
  uint64_t v12 = a7;
  uint64_t v14 = a5;
  uint64_t v15 = *(void *)&a4;
  id v16 = a3;
  uint64_t v17 = (dispatch_group_s *)a9;
  id v18 = a10;
  char v24 = 0;
  if (qword_10002F3B0 != -1) {
    dispatch_once(&qword_10002F3B0, &stru_100028B08);
  }
  if (byte_10002F3B8) {
    goto LABEL_4;
  }
  unsigned int v23 = v12;
  int64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[StreamingFileWriterQueue sharedInstance](&OBJC_CLASS___StreamingFileWriterQueue, "sharedInstance"));
  NSErrorUserInfoKey v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 reserveAsyncOperationForFileSize:a8 path:v16 group:v17 operationPendingForPath:&v24]);

  if (v24) {
    dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  }
  uint64_t v12 = v23;
  if (!v21)
  {
LABEL_4:
    id v19 = -[StreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:]( objc_alloc(&OBJC_CLASS___StreamingFileWriter),  "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:",  v16,  v15,  v14,  a6,  v12,  a8,  a11);
  }

  else
  {
    id v19 = -[AsyncStreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:errorDelegate:reservation:error:]( objc_alloc(&OBJC_CLASS___AsyncStreamingFileWriter),  "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup: errorDelegate:reservation:error:",  v16,  v15,  v14,  a6,  v23,  a8,  v17,  v18,  v21,  a11);
  }

  return v19;
}

+ (id)synchronousFileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v11 = a5;
  uint64_t v12 = *(void *)&a4;
  id v13 = a3;
  id v14 = -[StreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:]( objc_alloc(&OBJC_CLASS___StreamingFileWriter),  "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:",  v13,  v12,  v11,  a6,  v9,  -1LL,  a8);

  return v14;
}

@end