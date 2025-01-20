@interface MADArtworkServer
- (MADArtworkServer)init;
- (NSOperationQueue)artworkServiceQueue;
- (void)processArtworkColorAnalysisRequest:(id)a3 withReply:(id)a4;
- (void)processArtworkRequest:(id)a3 completionHandler:(id)a4;
- (void)setArtworkServiceQueue:(id)a3;
@end

@implementation MADArtworkServer

- (MADArtworkServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MADArtworkServer;
  v2 = -[MADArtworkServer init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    -[MADArtworkServer setArtworkServiceQueue:](v2, "setArtworkServiceQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADArtworkServer artworkServiceQueue](v2, "artworkServiceQueue"));
    [v4 setMaxConcurrentOperationCount:1];

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADArtworkServer artworkServiceQueue](v2, "artworkServiceQueue"));
    [v5 setName:@"com.apple.mediaartworkd.artworkServiceQueue"];

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaartworkd.calloutQueue", 0LL);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v6;
  }

  return v2;
}

- (void)processArtworkRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1000026C8(3);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 debugDescription]);
    *(_DWORD *)buf = 138543362;
    v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received artwork request: %{public}@",  buf,  0xCu);
  }

  v12 = (objc_class *)[v7 operationClass];
  if (!v12)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v17 handleFailureInMethod:a2 object:self file:@"MADArtworkServer.m" lineNumber:45 description:@"Artwork service request must specify an operationClass"];
  }

  id v13 = [[v12 alloc] initWithArtworkRequest:v7];
  objc_msgSend(v13, "setQueuePriority:", objc_msgSend(v7, "operationPriority"));
  objc_initWeak((id *)buf, v13);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_100002174;
  v21 = &unk_1000041E0;
  objc_copyWeak(&v25, (id *)buf);
  id v14 = v7;
  id v22 = v14;
  id v15 = v8;
  v23 = self;
  id v24 = v15;
  [v13 setCompletionBlock:&v18];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADArtworkServer artworkServiceQueue](self, "artworkServiceQueue", v18, v19, v20, v21));
  [v16 addOperation:v13];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (void)processArtworkColorAnalysisRequest:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1000026C8(3);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 debugDescription]);
    *(_DWORD *)buf = 138543362;
    v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received artwork color analysis request: %{public}@",  buf,  0xCu);
  }

  v12 = (objc_class *)[v7 operationClass];
  if (!v12)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v17 handleFailureInMethod:a2 object:self file:@"MADArtworkServer.m" lineNumber:81 description:@"Artwork service color analysis request must specify an operationClass"];
  }

  id v13 = [[v12 alloc] initWithArtworkRequest:v7];
  objc_msgSend(v13, "setQueuePriority:", objc_msgSend(v7, "operationPriority"));
  objc_initWeak((id *)buf, v13);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_100001EE0;
  v21 = &unk_1000041E0;
  objc_copyWeak(&v25, (id *)buf);
  id v14 = v7;
  id v22 = v14;
  id v15 = v8;
  v23 = self;
  id v24 = v15;
  [v13 setCompletionBlock:&v18];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADArtworkServer artworkServiceQueue](self, "artworkServiceQueue", v18, v19, v20, v21));
  [v16 addOperation:v13];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (NSOperationQueue)artworkServiceQueue
{
  return self->_artworkServiceQueue;
}

- (void)setArtworkServiceQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end