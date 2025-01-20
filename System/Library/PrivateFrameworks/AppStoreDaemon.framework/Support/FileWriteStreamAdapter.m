@interface FileWriteStreamAdapter
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation FileWriteStreamAdapter

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  verifier = self->_verifier;
  if (verifier)
  {
    id v15 = 0LL;
    int v9 = sub_100239684((uint64_t)verifier, v6, &v15);
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
    int v6 = sub_100239270((uint64_t)verifier, &v10);
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
    v5 = (DigestVerifier *)sub_100239190(objc_alloc(&OBJC_CLASS___DigestVerifier), self->_digest, 0LL);
    verifier = self->_verifier;
    self->_verifier = v5;
  }

  self->_unint64_t savedBytes = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  self->_downloadPath));
  if (v7)
  {
    digest = self->_digest;
    if (digest) {
      BOOL v9 = digest->_chunkSize == 0;
    }
    else {
      BOOL v9 = 1;
    }
    uint64_t v10 = ASDLogHandleForCategory(10LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        logKey = self->_logKey;
        downloadPath = self->_downloadPath;
        *(_DWORD *)buf = 138412546;
        v61 = logKey;
        __int16 v62 = 2114;
        unint64_t v63 = (unint64_t)downloadPath;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@] Not validating existing partial download because chunkSize is zero: %{public}@",  buf,  0x16u);
      }
    }

    else
    {
      if (v12)
      {
        id v15 = self->_logKey;
        v16 = self->_downloadPath;
        *(_DWORD *)buf = 138412546;
        v61 = v15;
        __int16 v62 = 2114;
        unint64_t v63 = (unint64_t)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@] Validating existing partial download: %{public}@",  buf,  0x16u);
      }

      while (1)
      {
        v17 = objc_autoreleasePoolPush();
        v18 = self->_digest;
        uint64_t v19 = v18 ? v18->_chunkSize : 0LL;
        id v59 = 0LL;
        v20 = (void *)objc_claimAutoreleasedReturnValue([v7 readDataUpToLength:v19 error:&v59]);
        id v21 = v59;
        if (v21) {
          break;
        }
        v22 = (ChunkedDigest *)[v20 length];
        v23 = self->_digest;
        if (v23) {
          v23 = (ChunkedDigest *)v23->_chunkSize;
        }
        if (v22 != v23) {
          break;
        }
        v24 = self->_verifier;
        uint64_t v58 = 0LL;
        char v25 = sub_100239684((uint64_t)v24, v20, &v58);

        objc_autoreleasePoolPop(v17);
        if ((v25 & 1) == 0) {
          goto LABEL_23;
        }
      }

      objc_autoreleasePoolPop(v17);
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
  v5 = (void (**)(id, id))a3;
  -[NSOutputStream close](outputStream, "close");
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
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

- (void).cxx_destruct
{
}

@end