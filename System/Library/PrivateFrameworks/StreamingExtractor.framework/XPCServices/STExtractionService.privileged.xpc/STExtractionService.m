@interface STExtractionService
+ (void)addActiveExtractionService:(id)a3;
+ (void)removeExtractionService:(id)a3;
+ (void)setProcessTerminated;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)extractionPrepared;
- (BOOL)extractionValid;
- (BOOL)hasConnection;
- (NSString)sessionID;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)messageQueue;
- (STExtractionPlugin)plugin;
- (id)initForClient:(id)a3 connection:(id)a4;
- (int64_t)sandboxToken;
- (void)_checkProcessTerminated;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)extractionCompleteAtArchivePath:(id)a3;
- (void)extractionEnteredPassthroughMode;
- (void)invalidate;
- (void)processTerminated;
- (void)remote_finishStreamWithCompletionBlock:(id)a3;
- (void)remote_prepareForExtractionToPath:(id)a3 sandboxExtensionToken:(id)a4 options:(id)a5 withCompletionBlock:(id)a6;
- (void)remote_supplyBytes:(id)a3 withCompletionBlock:(id)a4;
- (void)remote_suspendStreamWithCompletionBlock:(id)a3;
- (void)remote_terminateStreamWithError:(id)a3 completionBlock:(id)a4;
- (void)setExtractionProgress:(double)a3;
- (void)setPlugin:(id)a3;
- (void)setSandboxToken:(int64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation STExtractionService

+ (void)addActiveExtractionService:(id)a3
{
  id v4 = a3;
  v5 = sub_1000015A8();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionID]);
    int v14 = 136446722;
    v15 = "+[STExtractionService addActiveExtractionService:]";
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: [%@] %@", (uint8_t *)&v14, 0x20u);
  }

  id v8 = a1;
  objc_sync_enter(v8);
  if (qword_10000D358)
  {
    [(id)qword_10000D358 addObject:v4];
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v4));
    v10 = (void *)qword_10000D358;
    qword_10000D358 = v9;
  }

  v11 = sub_1000015A8();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(id)qword_10000D358 count];
    int v14 = 136446466;
    v15 = "+[STExtractionService addActiveExtractionService:]";
    __int16 v16 = 2048;
    id v17 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}s: %lu services",  (uint8_t *)&v14,  0x16u);
  }

  objc_sync_exit(v8);
}

+ (void)removeExtractionService:(id)a3
{
  id v4 = a3;
  v5 = sub_1000015A8();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionID]);
    int v12 = 136446722;
    id v13 = "+[STExtractionService removeExtractionService:]";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: [%@] %@", (uint8_t *)&v12, 0x20u);
  }

  id v8 = a1;
  objc_sync_enter(v8);
  if (qword_10000D358)
  {
    [(id)qword_10000D358 removeObject:v4];
    uint64_t v9 = sub_1000015A8();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(id)qword_10000D358 count];
      int v12 = 136446466;
      id v13 = "+[STExtractionService removeExtractionService:]";
      __int16 v14 = 2048;
      id v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}s: %lu services remaining",  (uint8_t *)&v12,  0x16u);
    }
  }

  objc_sync_exit(v8);
}

+ (void)setProcessTerminated
{
  processTerminated = 1;
  id v2 = a1;
  objc_sync_enter(v2);
  if (qword_10000D358)
  {
    v3 = sub_1000015A8();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446466;
      v6 = "+[STExtractionService setProcessTerminated]";
      __int16 v7 = 2048;
      id v8 = [(id)qword_10000D358 count];
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s: suspending %lu extractions",  (uint8_t *)&v5,  0x16u);
    }

    [(id)qword_10000D358 enumerateObjectsUsingBlock:&stru_1000083C8];
  }

  objc_sync_exit(v2);
}

- (id)initForClient:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___STExtractionService;
  id v8 = -[STExtractionService init](&v20, "init");
  if (v8)
  {
    id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"StreamingExtraction session on behalf of %@", v6));
    uint64_t v10 = os_transaction_create([v9 UTF8String]);
    id v11 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.StreamingExtractor.STExtractionServiceMessageQueue", 0LL);
    id v13 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v12;

    if (*((void *)v8 + 5))
    {
      [v8 setSandboxToken:-1];
      *(_WORD *)(v8 + 17) = 1;
      if (v7)
      {
        objc_storeWeak((id *)v8 + 3, v7);
        v8[16] = 1;
        [v7 auditToken];
        *((_OWORD *)v8 + 4) = v18;
        *((_OWORD *)v8 + 5) = v19;
      }

      else
      {
        *(void *)&__int128 v14 = -1LL;
        *((void *)&v14 + 1) = -1LL;
        *((_OWORD *)v8 + 4) = v14;
        *((_OWORD *)v8 + 5) = v14;
      }
    }

    else
    {
      __int16 v16 = sub_1000015A8();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100004580();
      }

      id v8 = 0LL;
    }
  }

  return v8;
}

- (void)dealloc
{
  sessionTransaction = self->_sessionTransaction;
  self->_sessionTransaction = 0LL;

  if (-[STExtractionService sandboxToken](self, "sandboxToken") != -1)
  {
    sandbox_extension_release(-[STExtractionService sandboxToken](self, "sandboxToken"));
    -[STExtractionService setSandboxToken:](self, "setSandboxToken:", -1LL);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___STExtractionService;
  -[STExtractionService dealloc](&v4, "dealloc");
}

- (void)connectionInvalidated
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[STExtractionService messageQueue](self, "messageQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002828;
  block[3] = &unk_100008430;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)invalidate
{
  self->_extractionValid = 0;
  [(id)objc_opt_class() removeExtractionService:self];
}

- (void)processTerminated
{
  if (processTerminated)
  {
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[STExtractionService messageQueue](self, "messageQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100002984;
    block[3] = &unk_100008430;
    block[4] = self;
    dispatch_async(v3, block);
  }

- (void)_checkProcessTerminated
{
  if (processTerminated && -[STExtractionService extractionValid](self, "extractionValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STExtractionService plugin](self, "plugin"));

    if (v3)
    {
      if (-[STExtractionService extractionPrepared](self, "extractionPrepared"))
      {
        objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[STExtractionService plugin](self, "plugin"));
        [v4 suspendStreamWithCompletionBlock:&stru_100008450];
      }

      -[STExtractionService invalidate](self, "invalidate");
    }

    else
    {
      int v5 = sub_1000015A8();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10000461C();
      }
    }
  }

- (void)remote_prepareForExtractionToPath:(id)a3 sandboxExtensionToken:(id)a4 options:(id)a5 withCompletionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int128 v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[STExtractionService messageQueue](self, "messageQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002B44;
  block[3] = &unk_1000084C8;
  id v22 = v10;
  id v23 = v13;
  block[4] = self;
  id v20 = v12;
  id v21 = v11;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  dispatch_async(v14, block);
}

- (void)remote_supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[STExtractionService messageQueue](self, "messageQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003A2C;
  block[3] = &unk_100008518;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)remote_suspendStreamWithCompletionBlock:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[STExtractionService messageQueue](self, "messageQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003DB0;
  v7[3] = &unk_100008540;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)remote_finishStreamWithCompletionBlock:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[STExtractionService messageQueue](self, "messageQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003F54;
  v7[3] = &unk_100008540;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)remote_terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[STExtractionService messageQueue](self, "messageQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004118;
  block[3] = &unk_100008518;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setExtractionProgress:(double)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[STExtractionService xpcConnection](self, "xpcConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxy]);
  objc_msgSend(v4, "remote_setExtractionProgress:", a3);
}

- (void)extractionCompleteAtArchivePath:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[STExtractionService xpcConnection](self, "xpcConnection"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxy]);
  objc_msgSend(v5, "remote_extractionCompleteAtArchivePath:", v4);
}

- (void)extractionEnteredPassthroughMode
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[STExtractionService xpcConnection](self, "xpcConnection"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxy]);
  objc_msgSend(v2, "remote_extractionEnteredPassthroughMode");
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)hasConnection
{
  return self->_hasConnection;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[2].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (STExtractionPlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

- (int64_t)sandboxToken
{
  return self->_sandboxToken;
}

- (void)setSandboxToken:(int64_t)a3
{
  self->_sandboxToken = a3;
}

- (BOOL)extractionValid
{
  return self->_extractionValid;
}

- (BOOL)extractionPrepared
{
  return self->_extractionPrepared;
}

- (void).cxx_destruct
{
}

  ;
}

@end