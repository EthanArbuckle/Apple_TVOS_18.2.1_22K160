@interface GKFireworksPseudonymManager
- (BOOL)inFlightProvision;
- (GKFireworksPseudonymManager)initWithService:(id)a3;
- (IDSService)service;
- (OS_dispatch_queue)queue;
- (void)provisionPseudonymIfNeeded:(id)a3;
- (void)revokePseudonym:(id)a3 withCompletionHandler:(id)a4;
- (void)setInFlightProvision:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
@end

@implementation GKFireworksPseudonymManager

- (GKFireworksPseudonymManager)initWithService:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"GKFireworksPseudonymManager.m", 34, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___GKFireworksPseudonymManager;
  v7 = -[GKFireworksPseudonymManager init](&v15, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_service, a3);
    v8->_inFlightProvision = 0;
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.gamekit.pseudonymQueue", v10);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;
  }

  return v8;
}

- (void)provisionPseudonymIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKFireworksPseudonymManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B55F8;
  v7[3] = &unk_10026B310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)revokePseudonym:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKFireworksPseudonymManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B5C54;
  block[3] = &unk_10026B148;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (BOOL)inFlightProvision
{
  return self->_inFlightProvision;
}

- (void)setInFlightProvision:(BOOL)a3
{
  self->_inFlightProvision = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end