@interface MADAutoAssetConnectorObserver
+ (BOOL)supportsSecureCoding;
- (BOOL)pathToServerIsUp;
- (MADAutoAssetConnectorObserver)initWithCoder:(id)a3;
- (NSURL)pathToServer;
- (NWPathEvaluator)pathEvaluator;
- (OS_dispatch_queue)pathStatusDispatchQueue;
- (id)initForServerPath:(id)a3;
- (id)summary;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPathEvaluator:(id)a3;
- (void)setPathToServerIsUp:(BOOL)a3;
@end

@implementation MADAutoAssetConnectorObserver

- (id)initForServerPath:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MADAutoAssetConnectorObserver;
  v6 = -[MADAutoAssetConnectorObserver init](&v35, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pathToServer, a3);
    pathEvaluator = v7->_pathEvaluator;
    v7->_pathEvaluator = 0LL;

    v9 = (const char *)[@"com.apple.MobileAsset.autoassetconnectorobserver.status" UTF8String];
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create(v9, v11);
    pathStatusDispatchQueue = v7->_pathStatusDispatchQueue;
    v7->_pathStatusDispatchQueue = (OS_dispatch_queue *)v12;

    v7->_pathToServerIsUp = 0;
    if (!objc_opt_class(&OBJC_CLASS___NWPathEvaluator)
      || !objc_opt_class(&OBJC_CLASS___NWEndpoint)
      || !objc_opt_class(&OBJC_CLASS___NWHostEndpoint)
      || !objc_opt_class(&OBJC_CLASS___NWParameters))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorObserver pathToServer](v7, "pathToServer"));
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue([v29 absoluteString]);
        *(_DWORD *)buf = 138543362;
        v37 = v30;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "[CONNECTION-OBSERVER] {initForServerPath} NWPathEvaluator not available | pathToServer:%{public}@",  buf,  0xCu);
      }

      goto LABEL_18;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NWHostEndpoint endpointWithHostname:port:]( &OBJC_CLASS___NWHostEndpoint,  "endpointWithHostname:port:",  v14,  @"443"));

    id v16 = objc_alloc_init(&OBJC_CLASS___NWParameters);
    v17 = -[NWPathEvaluator initWithEndpoint:parameters:]( objc_alloc(&OBJC_CLASS___NWPathEvaluator),  "initWithEndpoint:parameters:",  v15,  v16);
    v18 = v7->_pathEvaluator;
    v7->_pathEvaluator = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NWPathEvaluator path](v7->_pathEvaluator, "path"));
    v20 = (char *)[v19 status];
    if (v20 == (_BYTE *)&dword_0 + 1)
    {
      -[MADAutoAssetConnectorObserver setPathToServerIsUp:](v7, "setPathToServerIsUp:", 1LL);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 oslog]);

      if (!os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:

        -[NWPathEvaluator addObserver:forKeyPath:options:context:]( v7->_pathEvaluator,  "addObserver:forKeyPath:options:context:",  v7,  @"path",  5LL,  0LL);
LABEL_18:

        goto LABEL_19;
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorObserver pathToServer](v7, "pathToServer"));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v23 absoluteString]);
      *(_DWORD *)buf = 138543362;
      v37 = v24;
      v25 = "[CONNECTION-OBSERVER] {initForServerPath} starting UP | pathStatus:NWPathStatusSatisfied | pathToServer:%{public}@";
      v26 = (os_log_s *)v22;
      uint32_t v27 = 12;
    }

    else
    {
      unint64_t v31 = (unint64_t)v20;
      -[MADAutoAssetConnectorObserver setPathToServerIsUp:](v7, "setPathToServerIsUp:", 0LL);
      if (v31 > 3) {
        v32 = @"UNKNOWN";
      }
      else {
        v32 = *(&off_34F7C8 + v31);
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v33 oslog]);

      if (!os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorObserver pathToServer](v7, "pathToServer"));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v23 absoluteString]);
      *(_DWORD *)buf = 138543618;
      v37 = v32;
      __int16 v38 = 2114;
      v39 = v24;
      v25 = "[CONNECTION-OBSERVER] {initForServerPath} starting DOWN | pathStatus:%{public}@ | pathToServer:%{public}@";
      v26 = (os_log_s *)v22;
      uint32_t v27 = 22;
    }

    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);

    goto LABEL_17;
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorObserver pathEvaluator](self, "pathEvaluator"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorObserver pathEvaluator](self, "pathEvaluator"));
    [v4 removeObserver:self forKeyPath:@"path"];

    -[MADAutoAssetConnectorObserver setPathEvaluator:](self, "setPathEvaluator:", 0LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MADAutoAssetConnectorObserver;
  -[MADAutoAssetConnectorObserver dealloc](&v5, "dealloc");
}

- (MADAutoAssetConnectorObserver)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MADAutoAssetConnectorObserver;
  objc_super v5 = -[MADAutoAssetConnectorObserver init](&v12, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"pathToServer"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    pathToServer = v5->_pathToServer;
    v5->_pathToServer = (NSURL *)v7;

    v5->_pathToServerIsUp = [v4 decodeBoolForKey:@"pathToServerIsUp"];
    pathEvaluator = v5->_pathEvaluator;
    v5->_pathEvaluator = 0LL;

    pathStatusDispatchQueue = v5->_pathStatusDispatchQueue;
    v5->_pathStatusDispatchQueue = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorObserver pathToServer](self, "pathToServer"));
  [v5 encodeObject:v4 forKey:@"pathToServer"];

  objc_msgSend( v5,  "encodeBool:forKey:",  -[MADAutoAssetConnectorObserver pathToServerIsUp](self, "pathToServerIsUp"),  @"pathToServerIsUp");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetConnectorObserver pathStatusDispatchQueue]( self,  "pathStatusDispatchQueue",  a3,  a4,  a5,  a6));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __80__MADAutoAssetConnectorObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_34DBC0;
  block[4] = self;
  dispatch_async(v7, block);
}

void __80__MADAutoAssetConnectorObserver_observeValueForKeyPath_ofObject_change_context___block_invoke( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathEvaluator]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  id v4 = (char *)[v3 status];
  if (v4 == (_BYTE *)&dword_0 + 2)
  {
    if ([*(id *)(a1 + 32) pathToServerIsUp])
    {
      [*(id *)(a1 + 32) setPathToServerIsUp:0];
      dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathToServer]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 absoluteString]);
        int v14 = 138543362;
        v15 = v13;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "[CONNECTION-OBSERVER] {observeValueForKeyPath} connection DOWN | pathStatus:NWPathStatusUnsatisfied | pathToServer:%{public}@",  (uint8_t *)&v14,  0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathToServer]);
      +[MADAutoAssetConnector observedNetworkPathToServerDown:]( &OBJC_CLASS___MADAutoAssetConnector,  "observedNetworkPathToServerDown:",  v9);
      goto LABEL_11;
    }
  }

  else if (v4 == (_BYTE *)&dword_0 + 1 && ([*(id *)(a1 + 32) pathToServerIsUp] & 1) == 0)
  {
    [*(id *)(a1 + 32) setPathToServerIsUp:1];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathToServer]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 absoluteString]);
      int v14 = 138543362;
      v15 = v8;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "[CONNECTION-OBSERVER] {observeValueForKeyPath} connection UP | pathStatus:NWPathStatusSatisfied | pathToServer:%{public}@",  (uint8_t *)&v14,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pathToServer]);
    +[MADAutoAssetConnector observedNetworkPathToServerUp:]( &OBJC_CLASS___MADAutoAssetConnector,  "observedNetworkPathToServerUp:",  v9);
LABEL_11:
  }
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorObserver pathToServer](self, "pathToServer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorObserver pathEvaluator](self, "pathEvaluator"));
  id v5 = @"Y";
  if (!v4) {
    id v5 = @"N";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[pathToServer:%@|pathEvaluator:%@]",  v3,  v5));

  return v6;
}

- (NSURL)pathToServer
{
  return self->_pathToServer;
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
}

- (OS_dispatch_queue)pathStatusDispatchQueue
{
  return self->_pathStatusDispatchQueue;
}

- (BOOL)pathToServerIsUp
{
  return self->_pathToServerIsUp;
}

- (void)setPathToServerIsUp:(BOOL)a3
{
  self->_pathToServerIsUp = a3;
}

- (void).cxx_destruct
{
}

@end