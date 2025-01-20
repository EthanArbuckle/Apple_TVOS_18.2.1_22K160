@interface ValidDelegate
- (BOOL)finishedDownloading;
- (NSFileHandle)currentUpdateFile;
- (NSString)currentUpdateServer;
- (NSURL)currentUpdateFileURL;
- (OS_dispatch_queue)revDbUpdateQueue;
- (OS_os_transaction)transaction;
- (id)handler;
- (int64_t)versionFromTask:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)reschedule;
- (void)setCurrentUpdateFile:(id)a3;
- (void)setCurrentUpdateFileURL:(id)a3;
- (void)setCurrentUpdateServer:(id)a3;
- (void)setFinishedDownloading:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setRevDbUpdateQueue:(id)a3;
- (void)setTransaction:(id)a3;
- (void)updateDb:(int64_t)a3;
@end

@implementation ValidDelegate

- (void)reschedule
{
  v3 = sub_10000856C("validupdate");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_finishedDownloading) {
      v5 = "update";
    }
    else {
      v5 = "download";
    }
    int v7 = 136315394;
    v8 = v5;
    __int16 v9 = 2048;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s canceled at %f", (uint8_t *)&v7, 0x16u);
  }

  (*((void (**)(void))self->_handler + 2))();
  qword_100082DD8 = sub_100041B0C(0LL);
  sub_10003A9B4(*(double *)&qword_100082DD8);
  qword_100082DD0 = 0LL;
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0LL;
  }

- (void)updateDb:(int64_t)a3
{
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x3032000000LL;
  v27[3] = sub_100026C38;
  v27[4] = sub_100026C48;
  v5 = self->_currentUpdateFileURL;
  v28 = v5;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x3032000000LL;
  v25[3] = sub_100026C38;
  v25[4] = sub_100026C48;
  v26 = self->_currentUpdateServer;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = sub_100026C38;
  v23[4] = sub_100026C48;
  v6 = self->_currentUpdateFile;
  v24 = v6;
  if (v5 && v6)
  {
    v21[0] = 0LL;
    v21[1] = v21;
    v21[2] = 0x3032000000LL;
    v21[3] = sub_100026C38;
    v21[4] = sub_100026C48;
    id v22 = (id)0xAAAAAAAAAAAAAAAALL;
    id v22 = (id)os_transaction_create("com.apple.trustd.valid.updateDb");
    uint64_t v15 = 0LL;
    v16 = &v15;
    uint64_t v17 = 0x3032000000LL;
    v18 = sub_100026C38;
    v19 = sub_100026C48;
    id v20 = 0LL;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v8);
    v10 = (void *)v16[5];
    v16[5] = (uint64_t)v9;

    v11 = (dispatch_source_s *)v16[5];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100026C50;
    handler[3] = &unk_1000772B8;
    handler[4] = v21;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_activate((dispatch_object_t)v16[5]);
    revDbUpdateQueue = self->_revDbUpdateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100026CD4;
    v13[3] = &unk_1000772E0;
    v13[4] = self;
    v13[5] = v27;
    v13[6] = &v15;
    v13[7] = v21;
    v13[8] = v25;
    v13[9] = v23;
    v13[10] = a3;
    dispatch_async((dispatch_queue_t)revDbUpdateQueue, v13);
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(v21, 8);
  }

  else
  {
    -[ValidDelegate reschedule](self, "reschedule");
  }

  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

- (int64_t)versionFromTask:(id)a3
{
  id v3 = objc_claimAutoreleasedReturnValue([a3 taskDescription]);
  int64_t v4 = atol((const char *)[v3 cStringUsingEncoding:4]);

  return v4;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void))a6;
  v14 = (OS_os_transaction *)os_transaction_create("com.apple.trustd.valid.download");
  transaction = self->_transaction;
  self->_transaction = v14;

  id v16 = [v12 statusCode];
  uint64_t v17 = sub_10000856C("validupdate");
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue([v12 MIMEType]);
    *(_DWORD *)buf = 138413314;
    CFAbsoluteTime v47 = *(double *)&v10;
    __int16 v48 = 2112;
    id v49 = v11;
    __int16 v50 = 2048;
    id v51 = v16;
    __int16 v52 = 2112;
    v53 = v44;
    __int16 v54 = 2048;
    id v55 = [v12 expectedContentLength];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Session %@ data task %@ returned response %ld (%@), expecting %lld bytes",  buf,  0x34u);
  }

  if (sub_100044234() == qword_100082918 && v16 == (id)403)
  {
    v19 = sub_10000856C("validupdate");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFAbsoluteTime v47 = *(double *)&v11;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "failed to connect to URL. canceling task %@",  buf,  0xCu);
    }

    v13[2](v13, 0LL);
    qword_100082918 = 4LL;
LABEL_17:
    -[ValidDelegate reschedule](self, "reschedule");
    goto LABEL_29;
  }

  CFURLRef v21 = sub_100019F80((uint64_t)@"update-current");
  currentUpdateFileURL = self->_currentUpdateFileURL;
  if (v21) {
    v23 = (NSURL *)v21;
  }
  else {
    v23 = 0LL;
  }
  self->_currentUpdateFileURL = v23;

  v24 = -[NSURL fileSystemRepresentation](self->_currentUpdateFileURL, "fileSystemRepresentation");
  if (!v24)
  {
    v27 = sub_10000856C("validupdate");
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFAbsoluteTime v47 = *(double *)&v11;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "failed to find revocation info directory. canceling task %@",  buf,  0xCu);
    }

    v13[2](v13, 0LL);
    goto LABEL_17;
  }

  v25 = v24;
  remove(v24);
  int v26 = open(v25, 1538, 420LL);
  if (v26 < 0)
  {
    v29 = sub_10000856C("validupdate");
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_currentUpdateFileURL;
      int v32 = *__error();
      *(_DWORD *)buf = 138412546;
      CFAbsoluteTime v47 = *(double *)&v31;
      __int16 v48 = 1024;
      LODWORD(v49) = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "unable to open %@ (errno %d)", buf, 0x12u);
    }
  }

  else
  {
    close(v26);
  }

  v33 = sub_10000856C("validupdate");
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime v47 = Current;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "download started at %f", buf, 0xCu);
  }

  v36 = self->_currentUpdateFileURL;
  id v45 = 0LL;
  v37 = (NSFileHandle *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingToURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingToURL:error:",  v36,  &v45));
  id v38 = v45;
  currentUpdateFile = self->_currentUpdateFile;
  self->_currentUpdateFile = v37;

  if (self->_currentUpdateFile)
  {
    v13[2](v13, 1LL);
  }

  else
  {
    v40 = sub_10000856C("validupdate");
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = self->_currentUpdateFileURL;
      *(_DWORD *)buf = 138412802;
      CFAbsoluteTime v47 = *(double *)&v42;
      __int16 v48 = 2112;
      id v49 = v38;
      __int16 v50 = 2112;
      id v51 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "failed to open %@: %@. canceling task %@",  buf,  0x20u);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](&OBJC_CLASS___TrustAnalytics, "logger"));
    [v43 logResultForEvent:@"ValidUpdateEvent" hardFailure:0 result:v38];

    v13[2](v13, 0LL);
    -[ValidDelegate reschedule](self, "reschedule");
  }

LABEL_29:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  currentUpdateFile = self->_currentUpdateFile;
  if (currentUpdateFile)
  {
    -[NSFileHandle writeData:](currentUpdateFile, "writeData:", v10);
  }

  else
  {
    id v12 = sub_10000856C("validupdate");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "received data, but output file is not open",  v14,  2u);
    }

    [v9 cancel];
    -[ValidDelegate reschedule](self, "reschedule");
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10000856C("validupdate");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      int v19 = 138412802;
      CFAbsoluteTime Current = *(double *)&v8;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Session %@ task %@ failed with error %@",  (uint8_t *)&v19,  0x20u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](&OBJC_CLASS___TrustAnalytics, "logger"));
    [v14 logResultForEvent:@"ValidUpdateEvent" hardFailure:0 result:v10];

    -[ValidDelegate reschedule](self, "reschedule");
    -[NSFileHandle closeFile](self->_currentUpdateFile, "closeFile");
    currentUpdateFile = self->_currentUpdateFile;
    self->_currentUpdateFile = 0LL;

    currentUpdateServer = self->_currentUpdateServer;
    self->_currentUpdateServer = 0LL;

    currentUpdateFileURL = self->_currentUpdateFileURL;
    self->_currentUpdateFileURL = 0LL;
  }

  else
  {
    if (v13)
    {
      int v19 = 134217984;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "download finished at %f",  (uint8_t *)&v19,  0xCu);
    }

    self->_finishedDownloading = 1;
    -[ValidDelegate updateDb:](self, "updateDb:", -[ValidDelegate versionFromTask:](self, "versionFromTask:", v9));
  }

  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0LL;
  }
}

- (id)handler
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setHandler:(id)a3
{
}

- (OS_dispatch_queue)revDbUpdateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRevDbUpdateQueue:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (NSString)currentUpdateServer
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCurrentUpdateServer:(id)a3
{
}

- (NSFileHandle)currentUpdateFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCurrentUpdateFile:(id)a3
{
}

- (NSURL)currentUpdateFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCurrentUpdateFileURL:(id)a3
{
}

- (BOOL)finishedDownloading
{
  return self->_finishedDownloading;
}

- (void)setFinishedDownloading:(BOOL)a3
{
  self->_finishedDownloading = a3;
}

- (void).cxx_destruct
{
}

@end