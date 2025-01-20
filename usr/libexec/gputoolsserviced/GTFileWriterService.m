@interface GTFileWriterService
- (BOOL)_finishSession:(unint64_t)a3 error:(id *)a4;
- (GTFileWriterService)initWithConnectionProvider:(id)a3 deviceUDID:(id)a4 urlAccessProvider:(id)a5;
- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8;
- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 toURL:(id)a6 options:(id)a7 completionHandler:(id)a8;
- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation GTFileWriterService

- (GTFileWriterService)initWithConnectionProvider:(id)a3 deviceUDID:(id)a4 urlAccessProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___GTFileWriterService;
  v12 = -[GTFileWriterService init](&v26, "init");
  if (v12)
  {
    v13 = NSTemporaryDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    DeleteAllArchives(v14);

    v15 = GTTransportArchiveDirectory();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    DeleteAllArchives(v16);

    os_log_t v17 = os_log_create("com.apple.gputools.transport", "FileWriterService");
    log = v12->_log;
    v12->_log = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessions = v12->_sessions;
    v12->_sessions = v19;

    objc_storeStrong((id *)&v12->_connectionProvider, a3);
    objc_storeStrong((id *)&v12->_deviceUDID, a4);
    objc_storeStrong((id *)&v12->_urlAccessProvider, a5);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.gputools.filetransfer", 0LL);
    fileTransferQueue = v12->_fileTransferQueue;
    v12->_fileTransferQueue = (OS_dispatch_queue *)v21;

    dispatch_semaphore_t v23 = dispatch_semaphore_create(1LL);
    writeSem = v12->_writeSem;
    v12->_writeSem = (OS_dispatch_semaphore *)v23;
  }

  return v12;
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  os_log_t v17 = GTTransportArchiveDirectory();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v15]);
  id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v19, 1LL));

  -[GTFileWriterService initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:]( self,  "initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:",  v16,  v15,  v14,  v20,  v13,  v12);
}

- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  ++dword_10003DCF4;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
  os_log_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByDeletingPathExtension]);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 pathExtension]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingFormat:", @"-%04u", dword_10003DCF4));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingPathExtension:v18]);

  dispatch_queue_t v21 = NSTemporaryDirectory();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  dispatch_semaphore_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByAppendingPathComponent:v20]);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v23, 1LL));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10000BFF4;
  v28[3] = &unk_100030A08;
  id v29 = v24;
  id v30 = v12;
  v28[4] = self;
  id v25 = v24;
  id v26 = v12;
  -[GTFileWriterService initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:]( self,  "initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:",  v15,  v11,  v14,  v25,  v13,  v28);
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 toURL:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v49 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    v42 = log;
    id v43 = [v17 chunkSize];
    unint64_t v44 = (unint64_t)[v17 compressionAlgorithm];
    if (v44 > 5) {
      v45 = "<UNKNOWN>";
    }
    else {
      v45 = off_100030B30[v44];
    }
    *(_DWORD *)buf = 138413314;
    id v61 = v49;
    __int16 v62 = 2112;
    id v63 = v15;
    __int16 v64 = 2112;
    id v65 = v16;
    __int16 v66 = 2048;
    id v67 = v43;
    __int16 v68 = 2080;
    v69 = v45;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "Initiate transfer basePath:%@ device:%@ toURL:%@ chunkSize:%lu compression:%s",  buf,  0x34u);
  }

  if (sub_10000C598(v17))
  {
    id v53 = 0LL;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[GTFileWriterSession sessionWithFileEntries:relativeToURL:options:error:]( &OBJC_CLASS___GTFileWriterSession,  "sessionWithFileEntries:relativeToURL:options:error:",  v14,  v16,  v17,  &v53));
    id v21 = v53;
    if (v20)
    {
      id v47 = v16;
      id v48 = v14;
      unint64_t v22 = self->_sessionCounts + 1;
      self->_sessionCounts = v22;
      sessions = self->_sessions;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v22));
      -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v20, v24);

      id v25 = (void *)objc_claimAutoreleasedReturnValue( -[GTConnectionProvider connectionForDeviceUDID:]( self->_connectionProvider,  "connectionForDeviceUDID:",  v15));
      id v26 = v25;
      if (v25)
      {
        id v27 = sub_100008428(v25, v15, self->_connectionProvider);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        if (v28)
        {
          id v29 = objc_alloc(&OBJC_CLASS___GTFileWriterServiceXPCProxy);
          id v46 = v15;
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v28 serviceProperties]);
          v31 = -[GTFileWriterServiceXPCProxy initWithConnection:remoteProperties:]( v29,  "initWithConnection:remoteProperties:",  v26,  v30);

          deviceUDID = self->_deviceUDID;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472LL;
          v50[2] = sub_10000C5E8;
          v50[3] = &unk_100030A30;
          v50[4] = self;
          unint64_t v52 = v22;
          id v51 = v18;
          v33 = v49;
          v34 = deviceUDID;
          id v15 = v46;
          -[GTFileWriterServiceXPCProxy beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:]( v31,  "beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:",  v48,  v49,  v34,  v17,  v22,  v50);
        }

        else
        {
          NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
          v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Service is unavailable: \"%@\",  @"GTFileWriterService""));
          v55 = v40;
          v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
          v31 = (GTFileWriterServiceXPCProxy *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  1LL,  v41));

          (*((void (**)(id, GTFileWriterServiceXPCProxy *))v18 + 2))(v18, v31);
          v33 = v49;
        }
      }

      else
      {
        NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to find remote connection"));
        v57 = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  5LL,  v39));

        (*((void (**)(id, void *))v18 + 2))(v18, v28);
        v33 = v49;
      }

      id v16 = v47;
      id v14 = v48;
    }

    else
    {
      (*((void (**)(id, id))v18 + 2))(v18, v21);
      v33 = v49;
    }
  }

  else
  {
    NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
    id v35 = v16;
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTFileWriterService",  @"options sent to initiateTransfer are invalid."));
    v59 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
    id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v37));

    id v16 = v35;
    (*((void (**)(id, id))v18 + 2))(v18, v21);
    v33 = v49;
  }
}

- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GTURLAccessProvider urlForPath:](self->_urlAccessProvider, "urlForPath:", v15));
  if ([v14 count])
  {
    if (sub_10000C598(v17))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue( -[GTConnectionProvider connectionForDeviceUDID:]( self->_connectionProvider,  "connectionForDeviceUDID:",  v16));
      id v21 = v20;
      if (v20)
      {
        id v41 = v16;
        id v22 = sub_100008428(v20, v16, self->_connectionProvider);
        uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
        v42 = (void *)v23;
        if (v23)
        {
          v24 = (void *)v23;
          id v25 = objc_alloc(&OBJC_CLASS___GTFileWriterServiceXPCProxy);
          id v43 = v19;
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 serviceProperties]);
          id v27 = -[GTFileWriterServiceXPCProxy initWithConnection:remoteProperties:]( v25,  "initWithConnection:remoteProperties:",  v21,  v26);

          [v43 startAccessingSecurityScopedResource];
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v15,  1LL));
          fileTransferQueue = self->_fileTransferQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10000CBA8;
          block[3] = &unk_100030AA8;
          id v45 = v14;
          id v46 = v28;
          id v47 = v17;
          id v48 = self;
          id v49 = v27;
          unint64_t v52 = a7;
          id v50 = v43;
          id v51 = v18;
          id v30 = v27;
          id v31 = v28;
          v19 = v43;
          id v32 = v31;
          dispatch_async((dispatch_queue_t)fileTransferQueue, block);
        }

        else
        {
          NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
          v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Service is unavailable: \"%@\",  @"GTFileWriterService""));
          NSErrorUserInfoKey v54 = v39;
          v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
          id v32 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  1LL,  v40));

          (*((void (**)(id, id))v18 + 2))(v18, v32);
        }

        id v16 = v41;
        v38 = v42;
      }

      else
      {
        NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to find remote connection"));
        NSErrorUserInfoKey v56 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  5LL,  v37));

        (*((void (**)(id, void *))v18 + 2))(v18, v38);
      }
    }

    else
    {
      NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid argument sent to service %@: %@",  @"GTFileWriterService",  @"options sent to beginTransferSessionWithFileEntries is invalid"));
      NSErrorUserInfoKey v58 = v34;
      id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.gputools.transport",  4LL,  v35));

      (*((void (**)(id, void *))v18 + 2))(v18, v21);
    }
  }

  else
  {
    NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
    v60 = @"No files specified";
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  v21));
    (*((void (**)(id, void *))v18 + 2))(v18, v33);
  }
}

- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5
{
  sessions = self->_sessions;
  id v8 = a5;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v11));
  [v10 writeFileData:v9 completionHandler:v8];
}

- (BOOL)_finishSession:(unint64_t)a3 error:(id *)a4
{
  sessions = self->_sessions;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v8));

  id v10 = self->_sessions;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

  LOBYTE(a4) = [v9 finish:a4];
  return (char)a4;
}

- (void).cxx_destruct
{
}

@end