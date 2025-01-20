@interface UCRemotePasteboardGeneration
- (BOOL)dataRequested;
- (BOOL)returnEarly;
- (NSError)error;
- (NSUUID)uuid;
- (OS_dispatch_queue)respQueue;
- (UASharedPasteboardDataRequester)dataRequester;
- (UASharedPasteboardInfo)pbInfo;
- (UCRemotePasteboardGeneration)initWithRequester:(id)a3;
- (id)stateAsString;
- (int64_t)streamProtocolVersion;
- (unint64_t)state;
- (void)dealloc;
- (void)requestRemotePasteboardData:(id)a3;
- (void)requestRemoteTypeInfo:(id)a3;
- (void)setDataRequested:(BOOL)a3;
- (void)setDataRequester:(id)a3;
- (void)setError:(id)a3;
- (void)setPbInfo:(id)a3;
- (void)setRespQueue:(id)a3;
- (void)setReturnEarly:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStreamProtocolVersion:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)updateState:(unint64_t)a3;
@end

@implementation UCRemotePasteboardGeneration

- (UCRemotePasteboardGeneration)initWithRequester:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UCRemotePasteboardGeneration;
  v5 = -[UCRemotePasteboardGeneration init](&v15, "init");
  v6 = v5;
  if (v5)
  {
    -[UCRemotePasteboardGeneration setDataRequester:](v5, "setDataRequester:", v4);
    -[UCRemotePasteboardGeneration setDataRequested:](v6, "setDataRequested:", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[UCRemotePasteboardGeneration setUuid:](v6, "setUuid:", v7);

    -[UCRemotePasteboardGeneration setState:](v6, "setState:", 0LL);
    dispatch_queue_attr_t initially_inactive = dispatch_queue_attr_make_initially_inactive(0LL);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(initially_inactive);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.useractivity.remotegenerationresponse", v9);
    -[UCRemotePasteboardGeneration setRespQueue:](v6, "setRespQueue:", v10);

    os_log_t v11 = sub_100039584(@"pasteboard-fetch");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UCRemotePasteboardGeneration uuid](v6, "uuid"));
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Created remote generation %{public}@",  buf,  0xCu);
    }
  }

  return v6;
}

- (id)stateAsString
{
  unint64_t v2 = -[UCRemotePasteboardGeneration state](self, "state");
  if (v2 - 1 > 5) {
    return @"New";
  }
  else {
    return *(&off_1000BD300 + v2 - 1);
  }
}

- (void)updateState:(unint64_t)a3
{
  unint64_t v5 = -[UCRemotePasteboardGeneration state](self, "state");
  if (v5 == 6 || v5 == 1)
  {
    os_log_t v6 = sub_100039584(@"pasteboard-fetch");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[UCRemotePasteboardGeneration state](self, "state")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
      int v10 = 138412546;
      os_log_t v11 = v8;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Cannot update state from %@ to %@",  (uint8_t *)&v10,  0x16u);
    }
  }

  else
  {
    -[UCRemotePasteboardGeneration setState:](self, "setState:", a3);
  }

- (void)dealloc
{
  os_log_t v3 = sub_100039584(@"pasteboard-fetch");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UCRemotePasteboardGeneration uuid](self, "uuid"));
    os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UCRemotePasteboardGeneration stateAsString](self, "stateAsString"));
    *(_DWORD *)buf = 138543618;
    int v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Remote generation dealloc (type requested, data requested): %{public}@ %@",  buf,  0x16u);
  }

  v7 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[UCRemotePasteboardGeneration respQueue](self, "respQueue"));
  dispatch_activate(v7);

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UCRemotePasteboardGeneration;
  -[UCRemotePasteboardGeneration dealloc](&v8, "dealloc");
}

- (void)requestRemoteTypeInfo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UCRemotePasteboardGeneration respQueue](self, "respQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100023BA8;
  block[3] = &unk_1000BD290;
  block[4] = self;
  id v6 = v4;
  id v19 = v6;
  dispatch_async(v5, block);

  if (-[UCRemotePasteboardGeneration state](self, "state") <= 1)
  {
    os_log_t v7 = sub_100039584(@"pasteboard-server");
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[REMOTE GEN] Fetching remote type info",  buf,  2u);
    }

    v9 = objc_alloc_init(&OBJC_CLASS___UARemotePasteboardTypeInfoRequestedEvent);
    uint64_t v10 = mach_absolute_time();
    -[UCRemotePasteboardGeneration updateState:](self, "updateState:", 2LL);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[UCRemotePasteboardGeneration dataRequester](self, "dataRequester"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100023CC8;
    v13[3] = &unk_1000BD2B8;
    objc_super v15 = self;
    uint64_t v16 = v10;
    v14 = v9;
    __int16 v12 = v9;
    [v11 requestRemotePasteboardInfo:v13];
  }
}

- (void)requestRemotePasteboardData:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ((id)-[UCRemotePasteboardGeneration state](self, "state") == (id)6)
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -125LL,  0LL));
    v4[2](v4, 0LL, v5);
  }

  else
  {
    uint64_t v25 = 0LL;
    v26 = &v25;
    uint64_t v27 = 0x3032000000LL;
    v28 = sub_10002475C;
    v29 = sub_10002476C;
    id v30 = 0LL;
    if (-[UCRemotePasteboardGeneration state](self, "state") <= 2)
    {
      dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
      os_log_t v7 = sub_100039584(@"pasteboard-server");
      objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[REMOTE GEN] Requesting types before PB data",  buf,  2u);
      }

      v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472LL;
      v20 = sub_100024774;
      v21 = &unk_1000BD2E0;
      v23 = &v25;
      v9 = v6;
      v22 = v9;
      -[UCRemotePasteboardGeneration requestRemoteTypeInfo:](self, "requestRemoteTypeInfo:", &v18);
      os_log_t v10 = sub_100039584(@"pasteboard-server");
      __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "[REMOTE GEN] Waiting on type results",  buf,  2u);
      }

      dispatch_time_t v12 = dispatch_time(0LL, 7000000000LL);
      if (dispatch_semaphore_wait(v9, v12))
      {
        os_log_t v13 = sub_100039584(@"pasteboard-server-remote-gen");
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "[REMOTE GEN] Timeout requesting type info",  buf,  2u);
        }

        uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  UAContinuityErrorDomain,  -120LL,  0LL,  v18,  v19,  v20,  v21));
        uint64_t v16 = (void *)v26[5];
        v26[5] = v15;
      }
    }

    if (v26[5])
    {
      ((void (*)(void (**)(id, void, void *), void))v4[2])(v4, 0LL);
    }

    else
    {
      -[UCRemotePasteboardGeneration setDataRequested:](self, "setDataRequested:", 1LL);
      if ((id)-[UCRemotePasteboardGeneration streamProtocolVersion](self, "streamProtocolVersion") == (id)2)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[UCRemotePasteboardGeneration dataRequester](self, "dataRequester"));
        [v17 requestStreamEndpointDataV2:v4];
      }

      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[UCRemotePasteboardGeneration dataRequester](self, "dataRequester"));
        [v17 requestStreamEndpointData:v4];
      }
    }

    _Block_object_dispose(&v25, 8);
  }
}

- (UASharedPasteboardDataRequester)dataRequester
{
  return (UASharedPasteboardDataRequester *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDataRequester:(id)a3
{
}

- (UASharedPasteboardInfo)pbInfo
{
  return (UASharedPasteboardInfo *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPbInfo:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)returnEarly
{
  return self->_returnEarly;
}

- (void)setReturnEarly:(BOOL)a3
{
  self->_returnEarly = a3;
}

- (int64_t)streamProtocolVersion
{
  return self->_streamProtocolVersion;
}

- (void)setStreamProtocolVersion:(int64_t)a3
{
  self->_streamProtocolVersion = a3;
}

- (BOOL)dataRequested
{
  return self->_dataRequested;
}

- (void)setDataRequested:(BOOL)a3
{
  self->_dataRequested = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (OS_dispatch_queue)respQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRespQueue:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end