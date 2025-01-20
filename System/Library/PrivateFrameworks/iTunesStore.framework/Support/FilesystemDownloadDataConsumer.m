@interface FilesystemDownloadDataConsumer
- (BOOL)_checkHashForByteCount:(int64_t)a3;
- (BOOL)_hashAndWriteData:(id)a3 error:(id *)a4;
- (BOOL)_openFile;
- (BOOL)consumeData:(id)a3 error:(id *)a4;
- (BOOL)finish:(id *)a3;
- (BOOL)hasConsumedData;
- (FilesystemDownloadDataConsumer)initWithPath:(id)a3 MD5Hashes:(id)a4 numberOfBytesToHash:(int64_t)a5;
- (unint64_t)diskUsage;
- (unint64_t)resumptionOffset;
- (void)_truncateToSize:(int64_t)a3;
- (void)dealloc;
- (void)reset;
- (void)suspend;
- (void)truncate;
@end

@implementation FilesystemDownloadDataConsumer

- (FilesystemDownloadDataConsumer)initWithPath:(id)a3 MD5Hashes:(id)a4 numberOfBytesToHash:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___FilesystemDownloadDataConsumer;
  v10 = -[FilesystemDownloadDataConsumer init](&v16, "init");
  if (v10)
  {
    id v11 = [v9 copy];
    v12 = *(void **)(v10 + 25);
    *(void *)(v10 + 25) = v11;

    *(void *)(v10 + 129) = a5;
    id v13 = [v8 copy];
    v14 = *(void **)(v10 + 137);
    *(void *)(v10 + 137) = v13;

    [v10 _openFile];
    if (*(_DWORD *)(v10 + 17) == -1)
    {

      v10 = 0LL;
    }
  }

  return (FilesystemDownloadDataConsumer *)v10;
}

- (void)dealloc
{
  int v3 = *(_DWORD *)((char *)&self->_bytesWritten + 1);
  if (v3 != -1) {
    close(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FilesystemDownloadDataConsumer;
  -[FilesystemDownloadDataConsumer dealloc](&v4, "dealloc");
}

- (BOOL)consumeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (*(uint64_t *)((char *)&self->_md5Context.num + 1) < 1)
  {
    int v10 = *(_DWORD *)((char *)&self->_bytesWritten + 1);
    id v11 = v6;
    ssize_t v12 = write(v10, [v11 bytes], (size_t)objc_msgSend(v11, "length"));
    if (v12 < 0)
    {
      id v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
      id v9 = (id)objc_claimAutoreleasedReturnValue(v13);
      BOOL v8 = 0;
    }

    else
    {
      id v9 = 0LL;
      *(void *)(&self->super._overrideProgress + 1) += v12;
      *(unint64_t *)((char *)&self->_resumptionOffset + 1) += v12;
      BOOL v8 = 1;
    }
  }

  else
  {
    id v17 = 0LL;
    BOOL v8 = -[FilesystemDownloadDataConsumer _hashAndWriteData:error:](self, "_hashAndWriteData:error:", v6, &v17);
    id v9 = v17;
  }

  if (BYTE5(self->_bytesWritten)) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = *(void *)(&self->super._overrideProgress + 1) > 0LL;
  }
  BYTE5(self->_bytesWritten) = v14;
  if (a4) {
    char v15 = v8;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
    *a4 = v9;
  }

  return v8;
}

- (unint64_t)diskUsage
{
  return *(void *)(&self->super._overrideProgress + 1);
}

- (BOOL)finish:(id *)a3
{
  if (*(_DWORD *)((char *)&self->_bytesWritten + 1) == -1)
  {
    id v5 = 0LL;
    BOOL v6 = 1;
  }

  else
  {
    if (*(uint64_t *)((char *)&self->_md5Context.num + 1) < 1
      || *(int64_t *)((char *)&self->_resumptionOffset + 1) >= *(void *)(&self->super._overrideProgress + 1)
      || -[FilesystemDownloadDataConsumer _checkHashForByteCount:](self, "_checkHashForByteCount:"))
    {
      id v5 = 0LL;
      BOOL v6 = 1;
    }

    else
    {
      uint64_t v8 = ISError(8LL, 0LL, 0LL);
      id v5 = (id)objc_claimAutoreleasedReturnValue(v8);
      -[FilesystemDownloadDataConsumer _truncateToSize:]( self,  "_truncateToSize:",  *(unint64_t *)((char *)&self->_resumptionOffset + 1));
      BOOL v6 = 0;
    }

    close(*(_DWORD *)((char *)&self->_bytesWritten + 1));
    *(_DWORD *)((char *)&self->_bytesWritten + 1) = -1;
    if (a3 && !v6)
    {
      id v5 = v5;
      BOOL v6 = 0;
      *a3 = v5;
    }
  }

  return v6;
}

- (void)reset
{
  BYTE5(self->_bytesWritten) = *(NSString **)((char *)&self->_path + 1) != 0LL;
}

- (void)suspend
{
  int v3 = *(_DWORD *)((char *)&self->_bytesWritten + 1);
  if (v3 != -1)
  {
    close(v3);
    *(_DWORD *)((char *)&self->_bytesWritten + 1) = -1;
  }

- (void)truncate
{
}

- (BOOL)_checkHashForByteCount:(int64_t)a3
{
  uint64_t v5 = ISStringFromDigest(md, 16LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  float v7 = (double)a3 / (double)*(uint64_t *)((char *)&self->_md5Context.num + 1);
  unint64_t v8 = (uint64_t)(float)(ceilf(v7) + -1.0);
  if ((unint64_t)[*(id *)((char *)&self->_fd + 1) count] <= v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v9) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v19 = [v9 shouldLog];
    else {
      LODWORD(v10) = v19;
    }
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      v20 = (void *)objc_opt_class(self);
      v21 = *(void **)((char *)&self->_md5Context.num + 1);
      int v25 = 138413058;
      v26 = v20;
      __int16 v27 = 2048;
      unint64_t v28 = v8;
      __int16 v29 = 2048;
      int64_t v30 = a3;
      __int16 v31 = 2048;
      v32 = v21;
      id v22 = v20;
      v23 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Invalid chunk index: %ld, for bytes written: %lld, bytes to hash: %ld",  &v25,  42);

      if (!v23)
      {
        LOBYTE(v10) = 0;
        goto LABEL_27;
      }

      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      SSFileLog(v9, @"%@");
      LOBYTE(v10) = 0;
    }

    goto LABEL_26;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_fd + 1) objectAtIndex:v8]);
  LOBYTE(v10) = [v6 isEqualToString:v9];
  if ((v10 & 1) == 0)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v11) {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v12 = -[os_log_s shouldLog](v11, "shouldLog");
    else {
      LODWORD(v13) = v12;
    }
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v11, "OSLogObject"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      char v15 = (void *)objc_opt_class(self);
      unint64_t v16 = *(void *)((char *)&self->_md5Context.num + 1) * v8;
      int v25 = 138413314;
      v26 = v15;
      __int16 v27 = 2048;
      unint64_t v28 = v16;
      __int16 v29 = 2048;
      int64_t v30 = a3;
      __int16 v31 = 2112;
      v32 = v6;
      __int16 v33 = 2112;
      v34 = v9;
      id v17 = v15;
      v18 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%@: Hash mismatch for chunk: (%lld:%lld), %@ should be %@",  &v25,  52);

      if (!v18)
      {
LABEL_26:

        goto LABEL_27;
      }

      BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
      free(v18);
      SSFileLog(v11, @"%@");
    }

    goto LABEL_26;
  }

- (BOOL)_hashAndWriteData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = *(void *)(&self->super._overrideProgress + 1);
  uint64_t v8 = *(void *)((char *)&self->_md5Context.num + 1);
  uint64_t v9 = (uint64_t)[v6 length];
  if (v9 < 1)
  {
LABEL_13:
    id v16 = 0LL;
    BOOL v17 = 1;
    goto LABEL_19;
  }

  uint64_t v10 = v9;
  v21 = a4;
  uint64_t v11 = 0LL;
  uint64_t v12 = v7 % v8;
  while (1)
  {
    uint64_t v13 = *(void *)((char *)&self->_md5Context.num + 1);
    uint64_t v14 = v13 - v12 >= v10 - v11 ? v10 - v11 : v13 - v12;
    if (v14 >= 1)
    {
      CC_MD5_Update( (CC_MD5_CTX *)((char *)&self->_hashes + 1), (char *)[v6 bytes] + v11, v14);
      uint64_t v13 = *(void *)((char *)&self->_md5Context.num + 1);
    }

    if (v14 + v12 == v13) {
      break;
    }
LABEL_11:
    ssize_t v15 = write( *(_DWORD *)((char *)&self->_bytesWritten + 1), (char *)[v6 bytes] + v11, v14);
    if (v15 < v14)
    {
      uint64_t v18 = ISError(7LL, 0LL, 0LL);
      id v16 = (id)objc_claimAutoreleasedReturnValue(v18);
      goto LABEL_16;
    }

    uint64_t v12 = 0LL;
    v11 += v14;
    *(void *)(&self->super._overrideProgress + 1) += v15;
    if (v11 >= v10) {
      goto LABEL_13;
    }
  }

  if (-[FilesystemDownloadDataConsumer _checkHashForByteCount:]( self,  "_checkHashForByteCount:",  *(void *)(&self->super._overrideProgress + 1) + v14))
  {
    CC_MD5_Init((CC_MD5_CTX *)((char *)&self->_hashes + 1));
    *(unint64_t *)((char *)&self->_resumptionOffset + 1) += v13;
    goto LABEL_11;
  }

  uint64_t v19 = ISError(8LL, 0LL, 0LL);
  id v16 = (id)objc_claimAutoreleasedReturnValue(v19);
  -[FilesystemDownloadDataConsumer _truncateToSize:]( self,  "_truncateToSize:",  *(unint64_t *)((char *)&self->_resumptionOffset + 1));
LABEL_16:
  if (v21)
  {
    id v16 = v16;
    BOOL v17 = 0;
    id *v21 = v16;
  }

  else
  {
    BOOL v17 = 0;
  }

- (BOOL)_openFile
{
  int v3 = (const char *)[*(id *)((char *)&self->_numberOfBytesToHash + 1) fileSystemRepresentation];
  int v4 = open(v3, 522, 420LL);
  *(_DWORD *)((char *)&self->_bytesWritten + 1) = v4;
  if (v4 == -1) {
    return 0;
  }
  fcntl(v4, 48, 1LL);
  fcntl(*(_DWORD *)((char *)&self->_bytesWritten + 1), 76, 1LL);
  CC_MD5_Init((CC_MD5_CTX *)((char *)&self->_hashes + 1));
  if (stat(v3, &v18) != -1)
  {
    st_size = (NSString *)v18.st_size;
    *(void *)(&self->super._overrideProgress + 1) = v18.st_size;
    *(NSString **)((char *)&self->_path + 1) = st_size;
  }

  uint64_t v6 = *(void *)((char *)&self->_md5Context.num + 1);
  if (v6 >= 1)
  {
    unint64_t v7 = *(unint64_t *)((char *)&self->_path + 1);
    if (v7)
    {
      off_t v8 = v7 / v6 * v6;
      *(unint64_t *)((char *)&self->_resumptionOffset + 1) = v8;
      if ((NSString *)v8 != *(NSString **)((char *)&self->_path + 1))
      {
        uint64_t v9 = *(unint64_t *)((char *)&self->_resumptionOffset + 1);
        uint64_t v10 = *(uint64_t *)((char *)&self->_path + 1) - v9;
        uint64_t v11 = v10 >= 0x4000 ? (NSString *)0x4000 : (NSString *)(*(char **)((char *)&self->_path + 1) - v9);
        uint64_t v12 = malloc((size_t)v11);
        if (!v12) {
          goto LABEL_21;
        }
        uint64_t v13 = v12;
        if (v10 < 1)
        {
          uint64_t i = 0LL;
        }

        else
        {
          for (uint64_t i = 0LL; i < v10; i += v16)
          {
            ssize_t v15 = read(*(_DWORD *)((char *)&self->_bytesWritten + 1), v13, (size_t)v11);
            if (!v15) {
              break;
            }
            ssize_t v16 = v15;
          }
        }

        free(v13);
        if (i != v10) {
LABEL_21:
        }
          -[FilesystemDownloadDataConsumer _truncateToSize:](self, "_truncateToSize:", 0LL);
      }
    }
  }

  return *(_DWORD *)((char *)&self->_bytesWritten + 1) != -1;
}

- (void)_truncateToSize:(int64_t)a3
{
  *(void *)(&self->super._overrideProgress + 1) = a3;
  BYTE5(self->_bytesWritten) = a3 > 0;
  *(NSString **)((char *)&self->_path + 1) = (NSString *)a3;
  *(unint64_t *)((char *)&self->_resumptionOffset + 1) = a3;
}

- (BOOL)hasConsumedData
{
  return BYTE5(self->_bytesWritten);
}

- (unint64_t)resumptionOffset
{
  return *(unint64_t *)((char *)&self->_path + 1);
}

- (void).cxx_destruct
{
}

@end