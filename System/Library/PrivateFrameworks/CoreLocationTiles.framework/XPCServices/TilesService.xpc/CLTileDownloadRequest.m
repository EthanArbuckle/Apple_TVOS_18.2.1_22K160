@interface CLTileDownloadRequest
- (CLTileDownloadRequest)initWithQueue:(id)a3;
- (NSURL)decompressionDestination;
- (NSURLSession)session;
- (NSURLSessionDownloadTask)task;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (id)decompressionCompletionHandler;
- (void)cancel;
- (void)dealloc;
- (void)downloadWithURLRequest:(id)a3 withDecompressionURL:(id)a4 completionHandler:(id)a5;
- (void)onDownloadCompleted:(id)a3 withResponse:(id)a4 withError:(id)a5;
- (void)serveCompletionHandler:(id)a3 withResponse:(id)a4 withError:(id)a5;
- (void)setDecompressionCompletionHandler:(id)a3;
- (void)setDecompressionDestination:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation CLTileDownloadRequest

- (CLTileDownloadRequest)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLTileDownloadRequest;
  v4 = -[CLTileDownloadRequest init](&v7, "init");
  v5 = v4;
  if (v4) {
    -[CLTileDownloadRequest setQueue:](v4, "setQueue:", a3);
  }
  return v5;
}

- (void)downloadWithURLRequest:(id)a3 withDecompressionURL:(id)a4 completionHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3321888768LL;
  v11[2] = sub_1000065D8;
  v11[3] = &unk_10000C668;
  v11[5] = v13;
  v12 = v14;
  if (v14)
  {
    p_shared_weak_owners = &v14->__shared_weak_owners_;
    do
      unint64_t v10 = __ldxr((unint64_t *)p_shared_weak_owners);
    while (__stxr(v10 + 1, (unint64_t *)p_shared_weak_owners));
  }

  v11[4] = self;
  -[CLTileDownloadRequest setTask:]( self,  "setTask:",  -[NSURLSession downloadTaskWithRequest:completionHandler:]( -[CLTileDownloadRequest session](self, "session"),  "downloadTaskWithRequest:completionHandler:",  a3,  v11));
  -[NSURLSessionDownloadTask resume](-[CLTileDownloadRequest task](self, "task"), "resume");
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  if (v14) {
    std::__shared_weak_count::__release_weak(v14);
  }
}

- (void)cancel
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLTileDownloadRequest;
  -[CLTileDownloadRequest dealloc](&v2, "dealloc");
}

- (void)onDownloadCompleted:(id)a3 withResponse:(id)a4 withError:(id)a5
{
  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C698);
  }
  v9 = (os_log_s *)qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290307;
    int v30 = 0;
    __int16 v31 = 2082;
    v32 = "";
    __int16 v33 = 2113;
    id v34 = a3;
    __int16 v35 = 2113;
    v36 = a4;
    __int16 v37 = 2113;
    v38 = (CLTileDownloadRequest *)[a5 description];
    __int16 v39 = 2050;
    id v40 = -[CLTileDownloadRequest decompressionCompletionHandler](self, "decompressionCompletionHandler");
    __int16 v41 = 2050;
    v42 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#TilesService onDowloadCompleted, location:%{private, location:escape_only}@, respo nse:%{private, location:escape_only}@, error:%{private, location:escape_only}@, decompressionCompletionHan dler:%{public}p, self:%{public}p}",  buf,  0x44u);
  }

  if (-[CLTileDownloadRequest decompressionCompletionHandler](self, "decompressionCompletionHandler"))
  {
    if (a5)
    {
      unint64_t v10 = self;
      v11 = 0LL;
      id v12 = a4;
      uint64_t v13 = (NSError *)a5;
LABEL_8:
      -[CLTileDownloadRequest serveCompletionHandler:withResponse:withError:]( v10,  "serveCompletionHandler:withResponse:withError:",  v11,  v12,  v13);
      return;
    }

    if (a3)
    {
      v15 = (const char *)objc_msgSend(objc_msgSend(a3, "path"), "UTF8String");
      if (!v15) {
        sub_100007A24();
      }
      char v16 = decompress( v15,  -[NSString UTF8String]( -[NSURL path]( -[CLTileDownloadRequest decompressionDestination](self, "decompressionDestination"),  "path"),  "UTF8String"));
      id v28 = 0LL;
      if (!-[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  a3,  &v28)
        || v28)
      {
        if (qword_100010AE0 != -1) {
          dispatch_once(&qword_100010AE0, &stru_10000C698);
        }
        v17 = (os_log_s *)qword_100010AE8;
        if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_ERROR))
        {
          id v18 = [v28 description];
          *(_DWORD *)buf = 68289795;
          int v30 = 0;
          __int16 v31 = 2082;
          v32 = "";
          __int16 v33 = 2113;
          id v34 = a3;
          __int16 v35 = 2113;
          v36 = v18;
          __int16 v37 = 2050;
          v38 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#TilesService unable to remove file at location, location:%{private, location:e scape_only}@, fileRemovalError:%{private, location:escape_only}@, self:%{public}p}",  buf,  0x30u);
          if (qword_100010AE0 != -1) {
            dispatch_once(&qword_100010AE0, &stru_10000C698);
          }
        }

        v19 = (os_log_s *)qword_100010AE8;
        if (os_signpost_enabled((os_log_t)qword_100010AE8))
        {
          id v20 = [v28 description];
          *(_DWORD *)buf = 68289795;
          int v30 = 0;
          __int16 v31 = 2082;
          v32 = "";
          __int16 v33 = 2113;
          id v34 = a3;
          __int16 v35 = 2113;
          v36 = v20;
          __int16 v37 = 2050;
          v38 = self;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#TilesService unable to remove file at location",  "{msg%{public}.0s:#TilesService unable to remove file at location, location:%{private, location:e scape_only}@, fileRemovalError:%{private, location:escape_only}@, self:%{public}p}",  buf,  0x30u);
        }
      }

      if ((v16 & 1) != 0)
      {
        if (qword_100010AE0 != -1) {
          dispatch_once(&qword_100010AE0, &stru_10000C698);
        }
        v21 = (os_log_s *)qword_100010AE8;
        if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)(int)[a4 statusCode];
          v23 = -[CLTileDownloadRequest decompressionDestination](self, "decompressionDestination");
          *(_DWORD *)buf = 68289795;
          int v30 = 0;
          __int16 v31 = 2082;
          v32 = "";
          __int16 v33 = 2050;
          id v34 = v22;
          __int16 v35 = 2113;
          v36 = v23;
          __int16 v37 = 2050;
          v38 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#TilesService Successfully downloaded and decompressed file, statusCode:%{publi c}ld, decompressionDestination:%{private, location:escape_only}@, self:%{public}p}",  buf,  0x30u);
        }

        v11 = -[CLTileDownloadRequest decompressionDestination](self, "decompressionDestination");
        unint64_t v10 = self;
        id v12 = a4;
        uint64_t v13 = 0LL;
      }

      else
      {
        -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  -[CLTileDownloadRequest decompressionDestination](self, "decompressionDestination"),  0LL);
        uint64_t v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kCLTileErrorDomain",  1LL,  0LL);
        unint64_t v10 = self;
        v11 = 0LL;
        id v12 = a4;
      }

      goto LABEL_8;
    }

    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C698);
    }
    v24 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_ERROR))
    {
      id v25 = [0 path];
      *(_DWORD *)buf = 68289539;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2113;
      id v34 = v25;
      __int16 v35 = 2050;
      v36 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#TilesService did not receive a valid download location, locationPath:%{private, lo cation:escape_only}@, self:%{public}p}",  buf,  0x26u);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C698);
      }
    }

    v26 = (os_log_s *)qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      id v27 = [0 path];
      *(_DWORD *)buf = 68289539;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2113;
      id v34 = v27;
      __int16 v35 = 2050;
      v36 = self;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#TilesService did not receive a valid download location",  "{msg%{public}.0s:#TilesService did not receive a valid download location, locationPath:%{private, lo cation:escape_only}@, self:%{public}p}",  buf,  0x26u);
    }
  }

  else
  {
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C698);
    }
    v14 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v30 = 0;
      __int16 v31 = 2082;
      v32 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#TilesService task has already been served}",  buf,  0x12u);
    }
  }

- (void)serveCompletionHandler:(id)a3 withResponse:(id)a4 withError:(id)a5
{
  v9 = -[CLTileDownloadRequest decompressionCompletionHandler](self, "decompressionCompletionHandler");
  v9[2](v9, a3, a4, a5);
  -[CLTileDownloadRequest setDecompressionCompletionHandler:](self, "setDecompressionCompletionHandler:", 0LL);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  self->_session = (NSURLSession *)a3;
}

- (NSURLSessionDownloadTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (id)decompressionCompletionHandler
{
  return self->_decompressionCompletionHandler;
}

- (void)setDecompressionCompletionHandler:(id)a3
{
}

- (NSURL)decompressionDestination
{
  return self->_decompressionDestination;
}

- (void)setDecompressionDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  self->_callbackValidity._vptr$CLCallbackDropManager = (void **)off_10000C488;
  v3 = (char *)operator new(0x20uLL);
  *((void *)v3 + 2) = 0LL;
  *(void *)v3 = off_10000C4C0;
  *((void *)v3 + 1) = 0LL;
  self->_callbackValidity.fToken.__cntrl_ = (__shared_weak_count *)v3;
  *((_DWORD *)v3 + 6) = 31337;
  self->_callbackValidity.fToken.__ptr_ = (int *)(v3 + 24);
  return self;
}

@end