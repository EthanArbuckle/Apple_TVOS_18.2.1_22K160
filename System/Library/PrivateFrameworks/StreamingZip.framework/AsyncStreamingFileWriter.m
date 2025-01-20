@interface AsyncStreamingFileWriter
- (BOOL)_executeWithError:(id *)a3;
- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8;
- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)performCachedWrites;
- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4;
- (BOOL)setOwnership;
- (BOOL)suspendWithError:(id *)a3;
- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (NSMutableData)fileData;
- (OS_dispatch_group)trackingGroup;
- (StreamingFileWriterErrorDelegate)errorDelegate;
- (StreamingFileWriterQueueReservation)reservation;
- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 reservation:(id)a11 error:(id *)a12;
- (int)oflag;
- (int64_t)currentOffsetWithError:(id *)a3;
- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (timeval)accessTime;
- (timeval)modTime;
- (unint64_t)executeFileOperationFlags;
- (unsigned)gid;
- (unsigned)mode;
- (unsigned)omode;
- (unsigned)uid;
- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5;
- (void)dealloc;
- (void)executeAsyncOperation;
- (void)setAccessTime:(timeval)a3;
- (void)setErrorDelegate:(id)a3;
- (void)setExecuteFileOperationFlags:(unint64_t)a3;
- (void)setFileData:(id)a3;
- (void)setGid:(unsigned int)a3;
- (void)setIncompleteExtractionAttribute;
- (void)setModTime:(timeval)a3;
- (void)setMode:(unsigned __int16)a3;
- (void)setSetOwnership:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
@end

@implementation AsyncStreamingFileWriter

- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8
{
  return 1;
}

- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 reservation:(id)a11 error:(id *)a12
{
  BOOL v13 = a7;
  uint64_t v14 = a5;
  uint64_t v15 = *(void *)&a4;
  id v28 = a9;
  id v18 = a10;
  id v27 = a11;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___AsyncStreamingFileWriter;
  id v19 = a3;
  int64_t v20 = a8;
  v21 = -[StreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:]( &v29,  sel__initForWritingToPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_error_,  v19,  v15,  v14,  a6,  v13,  a8,  a12);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong(v21 + 7, a9);
    objc_storeStrong(v22 + 8, a11);
    *((_DWORD *)v22 + 10) = v15;
    *((_WORD *)v22 + 17) = v14;
    *((_BYTE *)v22 + 32) = v13;
    objc_storeWeak(v22 + 11, v18);
    v22[10] = (id)17;
    uint64_t v23 = [MEMORY[0x189603FB8] dataWithCapacity:v20];
    id v24 = v22[9];
    v22[9] = (id)v23;
  }

  return v22;
}

- (void)dealloc
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AsyncStreamingFileWriter;
  -[StreamingFileWriter closeCurrentOutputFD](&v4, sel_closeCurrentOutputFD);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AsyncStreamingFileWriter;
  -[StreamingFileWriter dealloc](&v3, sel_dealloc);
}

- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  SZGetLoggingHandle();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v12 = -[StreamingFileWriter path](self, "path");
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v12;
    _os_log_error_impl( &dword_1870CA000,  v7,  OS_LOG_TYPE_ERROR,  "Read not available on async file operation for %@",  buf,  0xCu);
  }
  v8 = -[StreamingFileWriter path](self, "path");
  _CreateError( (uint64_t)"-[AsyncStreamingFileWriter readIntoBuffer:length:error:]",  391LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Read not available on async file operation for %@",  v9,  (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5) {
    *a5 = v10;
  }

  return -1LL;
}

- (int64_t)currentOffsetWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (-[StreamingFileWriter currentOutputFD](self, "currentOutputFD") < 0)
  {
    SZGetLoggingHandle();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = -[StreamingFileWriter path](self, "path");
      *(_DWORD *)buf = 138412290;
      BOOL v13 = v10;
      _os_log_error_impl( &dword_1870CA000,  v6,  OS_LOG_TYPE_ERROR,  "Getting current output offset not available on async file operation for %@",  buf,  0xCu);
    }
    v7 = -[StreamingFileWriter path](self, "path");
    _CreateError( (uint64_t)"-[AsyncStreamingFileWriter currentOffsetWithError:]",  406LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Getting current output offset not available on async file operation for %@",  v8,  (uint64_t)v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3) {
      *a3 = v9;
    }

    return -1LL;
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___AsyncStreamingFileWriter;
    return -[StreamingFileWriter currentOffsetWithError:](&v11, sel_currentOffsetWithError_, a3);
  }

- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  SZGetLoggingHandle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[StreamingFileWriter path](self, "path");
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    BOOL v13 = v11;
    _os_log_error_impl( &dword_1870CA000,  v6,  OS_LOG_TYPE_ERROR,  "Setting current output offset not available on async file operation for %@",  buf,  0xCu);
  }
  v7 = -[StreamingFileWriter path](self, "path");
  _CreateError( (uint64_t)"-[AsyncStreamingFileWriter setCurrentOffset:error:]",  415LL,  @"SZExtractorErrorDomain",  1LL,  0LL,  0LL,  @"Setting current output offset not available on async file operation for %@",  v8,  (uint64_t)v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4) {
    *a4 = v9;
  }

  return 0;
}

- (void)setIncompleteExtractionAttribute
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  SZGetLoggingHandle();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    -[StreamingFileWriter path](self, "path");
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = 138412290;
    v6 = v4;
    _os_log_fault_impl( &dword_1870CA000,  v3,  OS_LOG_TYPE_FAULT,  "Setting incomplete extraction attribute not available on this async file operation for %@",  (uint8_t *)&v5,  0xCu);
  }
}

- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 appendBytes:a3 length:a4];

  -[AsyncStreamingFileWriter setExecuteFileOperationFlags:]( self,  "setExecuteFileOperationFlags:",  -[AsyncStreamingFileWriter executeFileOperationFlags](self, "executeFileOperationFlags") | 4);
  return 1;
}

- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[AsyncStreamingFileWriter setSetOwnership:](self, "setSetOwnership:", a3);
  -[AsyncStreamingFileWriter setUid:](self, "setUid:", v6);
  -[AsyncStreamingFileWriter setGid:](self, "setGid:", v5);
  -[AsyncStreamingFileWriter setExecuteFileOperationFlags:]( self,  "setExecuteFileOperationFlags:",  -[AsyncStreamingFileWriter executeFileOperationFlags](self, "executeFileOperationFlags") | 2);
}

- (BOOL)_executeWithError:(id *)a3
{
  char v5 = -[AsyncStreamingFileWriter executeFileOperationFlags](self, "executeFileOperationFlags");
  if ((v5 & 1) != 0)
  {
    -[StreamingFileWriter path](self, "path");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___AsyncStreamingFileWriter;
    unsigned int v7 = -[StreamingFileWriter _openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:]( &v22,  sel__openCurrentOutputFDForPath_withOpenFlags_mode_performCachedWrites_quarantineInfo_error_,  v6,  -[AsyncStreamingFileWriter oflag](self, "oflag"),  -[AsyncStreamingFileWriter omode](self, "omode"),  -[AsyncStreamingFileWriter performCachedWrites](self, "performCachedWrites"),  0LL,  a3);

    if (!v7) {
      goto LABEL_12;
    }
  }

  if ((v5 & 2) != 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___AsyncStreamingFileWriter;
    -[StreamingFileWriter configureFileAndSetOwnership:toUID:GID:]( &v21,  sel_configureFileAndSetOwnership_toUID_GID_,  -[AsyncStreamingFileWriter setOwnership](self, "setOwnership"),  -[AsyncStreamingFileWriter uid](self, "uid"),  -[AsyncStreamingFileWriter gid](self, "gid"));
  }

  if ((v5 & 4) == 0) {
    goto LABEL_16;
  }
  id v8 = -[AsyncStreamingFileWriter fileData](self, "fileData");
  uint64_t v9 = [v8 bytes];
  v10 = -[AsyncStreamingFileWriter fileData](self, "fileData");
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___AsyncStreamingFileWriter;
  LODWORD(v9) = -[StreamingFileWriter writeBuffer:length:error:]( &v20,  sel_writeBuffer_length_error_,  v9,  [v10 length],  a3);

  if (!(_DWORD)v9)
  {
LABEL_12:
    LOBYTE(v16) = 0;
  }

  else
  {
LABEL_16:
    if ((v5 & 8) == 0
      || (uint64_t v11 = -[AsyncStreamingFileWriter accessTime](self, "accessTime"),
          uint64_t v13 = v12,
          uint64_t v14 = -[AsyncStreamingFileWriter modTime](self, "modTime"),
          v19.receiver = self,
          v19.super_class = (Class)&OBJC_CLASS___AsyncStreamingFileWriter,
          BOOL v16 = -[StreamingFileWriter finalizeFileWithAccessTime:modTime:mode:error:]( &v19,  sel_finalizeFileWithAccessTime_modTime_mode_error_,  v11,  v13,  v14,  v15,  -[AsyncStreamingFileWriter mode](self, "mode"),  a3)))
    {
      if ((v5 & 0x10) != 0)
      {
        v18.receiver = self;
        v18.super_class = (Class)&OBJC_CLASS___AsyncStreamingFileWriter;
        -[StreamingFileWriter closeCurrentOutputFD](&v18, sel_closeCurrentOutputFD);
      }

      -[AsyncStreamingFileWriter setExecuteFileOperationFlags:](self, "setExecuteFileOperationFlags:", 0LL);
      LOBYTE(v16) = 1;
    }
  }

  return v16;
}

- (void)executeAsyncOperation
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  -[StreamingFileWriter path](self, "path");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v4 = -[StreamingFileWriter fileSize](self, "fileSize");
  SZGetLoggingHandle();
  char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v3;
    _os_log_debug_impl(&dword_1870CA000, v5, OS_LOG_TYPE_DEBUG, "Writing %@ asynchronously", buf, 0xCu);
  }

  SZGetTraceHandle();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v3;
    __int16 v15 = 2048;
    int64_t v16 = v4;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "ASYNC_WRITE",  "Start async operation for %@ size %lld",  buf,  0x16u);
  }

  id v12 = 0LL;
  BOOL v7 = -[AsyncStreamingFileWriter _executeWithError:](self, "_executeWithError:", &v12);
  id v8 = v12;
  if (!v7)
  {
    SZGetLoggingHandle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v3;
      __int16 v15 = 2112;
      int64_t v16 = (int64_t)v8;
      _os_log_error_impl(&dword_1870CA000, v9, OS_LOG_TYPE_ERROR, "Async operation for %@ failed: %@", buf, 0x16u);
    }
    v10 = -[AsyncStreamingFileWriter errorDelegate](self, "errorDelegate");
    [v10 streamingFileWriter:self didEncounterError:v8];
  }

  SZGetTraceHandle();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v3;
    __int16 v15 = 2048;
    int64_t v16 = v4;
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v11,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ASYNC_WRITE",  "End async operation for %@ size %lld",  buf,  0x16u);
  }
}

- (BOOL)suspendWithError:(id *)a3
{
  return -[AsyncStreamingFileWriter _executeWithError:](self, "_executeWithError:", a3);
}

- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4.tv_usec;
  __darwin_time_t tv_sec = a4.tv_sec;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[AsyncStreamingFileWriter setAccessTime:](self, "setAccessTime:", a3.tv_sec, *(void *)&a3.tv_usec);
  -[AsyncStreamingFileWriter setModTime:](self, "setModTime:", tv_sec, v8);
  -[AsyncStreamingFileWriter setMode:](self, "setMode:", v7);
  -[AsyncStreamingFileWriter setExecuteFileOperationFlags:]( self,  "setExecuteFileOperationFlags:",  -[AsyncStreamingFileWriter executeFileOperationFlags](self, "executeFileOperationFlags") | 8);
  SZGetTraceHandle();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    -[StreamingFileWriter path](self, "path");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    objc_super v19 = v12;
    __int16 v20 = 2048;
    int64_t v21 = -[StreamingFileWriter fileSize](self, "fileSize");
    _os_signpost_emit_with_name_impl( &dword_1870CA000,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "ASYNC_ENQUEUE",  "Enqueueing async operation for %@ size %lld",  buf,  0x16u);
  }

  +[StreamingFileWriterQueue sharedInstance](&OBJC_CLASS___StreamingFileWriterQueue, "sharedInstance");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = 0LL;
  char v14 = [v13 insertAsyncFileOperation:self error:&v17];
  id v15 = v17;

  if (a6 && (v14 & 1) == 0) {
    *a6 = v15;
  }

  return v14;
}

- (OS_dispatch_group)trackingGroup
{
  return self->_trackingGroup;
}

- (StreamingFileWriterQueueReservation)reservation
{
  return self->_reservation;
}

- (int)oflag
{
  return self->_oflag;
}

- (unsigned)omode
{
  return self->_omode;
}

- (BOOL)performCachedWrites
{
  return self->_performCachedWrites;
}

- (NSMutableData)fileData
{
  return self->_fileData;
}

- (void)setFileData:(id)a3
{
}

- (BOOL)setOwnership
{
  return self->_setOwnership;
}

- (void)setSetOwnership:(BOOL)a3
{
  self->_setOwnership = a3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (unsigned)gid
{
  return self->_gid;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (timeval)accessTime
{
  p_accessTime = &self->_accessTime;
  __darwin_time_t tv_sec = self->_accessTime.tv_sec;
  uint64_t v4 = *(void *)&p_accessTime->tv_usec;
  result.tv_usec = v4;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setAccessTime:(timeval)a3
{
  self->_accessTime = a3;
}

- (timeval)modTime
{
  p_modTime = &self->_modTime;
  __darwin_time_t tv_sec = self->_modTime.tv_sec;
  uint64_t v4 = *(void *)&p_modTime->tv_usec;
  result.tv_usec = v4;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setModTime:(timeval)a3
{
  self->_modTime = a3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setMode:(unsigned __int16)a3
{
  self->_mode = a3;
}

- (unint64_t)executeFileOperationFlags
{
  return self->_executeFileOperationFlags;
}

- (void)setExecuteFileOperationFlags:(unint64_t)a3
{
  self->_executeFileOperationFlags = a3;
}

- (StreamingFileWriterErrorDelegate)errorDelegate
{
  return (StreamingFileWriterErrorDelegate *)objc_loadWeakRetained((id *)&self->_errorDelegate);
}

- (void)setErrorDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end