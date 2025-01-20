@interface FileWriteStreamAdapter
- (ChunkedDigest)digest;
- (FileWriteStreamAdapter)initWithDownloadPath:(id)a3;
- (NSString)logKey;
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)setDigest:(id)a3;
- (void)setLogKey:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation FileWriteStreamAdapter

- (FileWriteStreamAdapter)initWithDownloadPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FileWriteStreamAdapter;
  v6 = -[FileWriteStreamAdapter init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_downloadPath, a3);
  }

  return v7;
}

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  verifier = self->_verifier;
  if (verifier)
  {
    id v15 = 0LL;
    unsigned int v9 = -[DigestVerifier verifyData:error:](verifier, "verifyData:error:", v6, &v15);
    id v10 = v15;
    if (!v9)
    {
      v7[2](v7, v10, 0LL);
      goto LABEL_9;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  outputStream = self->_outputStream;
  id v12 = v6;
  if (-[NSOutputStream write:maxLength:]( outputStream,  "write:maxLength:",  [v12 bytes],  objc_msgSend(v12, "length")) == -1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSOutputStream streamError](self->_outputStream, "streamError"));
  }

  else
  {
    id v13 = [v12 length];
    v14 = 0LL;
    self->_savedBytes += (unint64_t)v13;
  }

  v7[2](v7, v14, 0LL);

LABEL_9:
}

- (void)finishWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  verifier = self->_verifier;
  if (verifier)
  {
    id v10 = 0LL;
    unsigned int v6 = -[DigestVerifier finalAndVerifyError:](verifier, "finalAndVerifyError:", &v10);
    id v7 = v10;
    v8 = v7;
    if (v6) {
      id v9 = 0LL;
    }
    else {
      id v9 = v7;
    }
  }

  else
  {
    v8 = 0LL;
    id v9 = 0LL;
  }

  -[NSOutputStream close](self->_outputStream, "close");
  ((void (**)(id, id))v4)[2](v4, v9);
}

- (void)prepareWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, unint64_t, void *))a3;
  if (self->_digest)
  {
    id v5 = -[DigestVerifier initWithChunkedDigest:resumptionOffset:]( objc_alloc(&OBJC_CLASS___DigestVerifier),  "initWithChunkedDigest:resumptionOffset:",  self->_digest,  0LL);
    verifier = self->_verifier;
    self->_verifier = v5;
  }

  self->_unint64_t savedBytes = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  self->_downloadPath));
  if (v7)
  {
    if (-[ChunkedDigest chunkSize](self->_digest, "chunkSize"))
    {
      if (qword_10032EE98 != -1) {
        dispatch_once(&qword_10032EE98, &stru_1002E9E30);
      }
      v8 = (os_log_s *)off_1003288C0;
      if (os_log_type_enabled((os_log_t)off_1003288C0, OS_LOG_TYPE_DEFAULT))
      {
        logKey = self->_logKey;
        downloadPath = self->_downloadPath;
        *(_DWORD *)buf = 138543618;
        v44 = logKey;
        __int16 v45 = 2114;
        unint64_t v46 = (unint64_t)downloadPath;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Validating existing partial download: %{public}@",  buf,  0x16u);
      }

      while (1)
      {
        unsigned int v11 = -[ChunkedDigest chunkSize](self->_digest, "chunkSize");
        id v42 = 0LL;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 readDataUpToLength:v11 error:&v42]);
        id v13 = v42;
        if (v13) {
          break;
        }
        id v14 = [v12 length];
        if (v14 != (id)-[ChunkedDigest chunkSize](self->_digest, "chunkSize")) {
          break;
        }
        id v15 = self->_verifier;
        uint64_t v41 = 0LL;
        unsigned __int8 v16 = -[DigestVerifier verifyData:error:](v15, "verifyData:error:", v12, &v41);

        if ((v16 & 1) == 0) {
          goto LABEL_18;
        }
      }
    }

    else
    {
      if (qword_10032EE98 != -1) {
        dispatch_once(&qword_10032EE98, &stru_1002E9E30);
      }
      v17 = (os_log_s *)off_1003288C0;
      if (os_log_type_enabled((os_log_t)off_1003288C0, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_logKey;
        v19 = self->_downloadPath;
        *(_DWORD *)buf = 138543618;
        v44 = v18;
        __int16 v45 = 2114;
        unint64_t v46 = (unint64_t)v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Not validating existing partial download because chunkSize is zero: %{public}@",  buf,  0x16u);
      }
    }

- (void)suspendWithCompletionHandler:(id)a3
{
  outputStream = self->_outputStream;
  v4 = (void (**)(id, void))a3;
  -[NSOutputStream close](outputStream, "close");
  v4[2](v4, 0LL);
}

- (void)truncateWithCompletionHandler:(id)a3
{
  outputStream = self->_outputStream;
  id v5 = (void (**)(id, id))a3;
  -[NSOutputStream close](outputStream, "close");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  downloadPath = self->_downloadPath;
  id v9 = 0LL;
  [v6 removeItemAtPath:downloadPath error:&v9];
  id v8 = v9;

  v5[2](v5, v8);
}

- (void)resetWithCompletionHandler:(id)a3
{
  outputStream = self->_outputStream;
  v4 = (void (**)(id, void))a3;
  -[NSOutputStream close](outputStream, "close");
  v4[2](v4, 0LL);
}

- (ChunkedDigest)digest
{
  return (ChunkedDigest *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDigest:(id)a3
{
}

- (NSString)logKey
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setLogKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end