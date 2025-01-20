@interface ADHomeKitService
- (ADHomeKitService)init;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_hmConnection;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)preheatDomain:(id)a3;
- (void)resetExternalResources;
@end

@implementation ADHomeKitService

- (ADHomeKitService)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADHomeKitService;
  v2 = -[ADHomeKitService init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[ADService setIdentifier:](v3, "setIdentifier:", v6);

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("ADHomeKitServiceTargetQueue", v8);

    targetQueue = v3->_targetQueue;
    v3->_targetQueue = (OS_dispatch_queue *)v9;
  }

  return v3;
}

- (id)domains
{
  uint64_t v3 = SAHAGroupIdentifier;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

- (id)commandsForDomain:(id)a3
{
  if ([a3 isEqualToString:SAHAGroupIdentifier])
  {
    uint64_t v5 = SAHACommandClassIdentifier;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (void)preheatDomain:(id)a3
{
  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002D7D30;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

- (void)resetExternalResources
{
  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002D7D18;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(targetQueue, block);
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002D7A04;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(targetQueue, block);
}

- (id)_hmConnection
{
  hmConnection = self->_hmConnection;
  if (!hmConnection)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___HMClientConnection);
    uint64_t v5 = self->_hmConnection;
    self->_hmConnection = v4;

    hmConnection = self->_hmConnection;
  }

  return hmConnection;
}

- (void).cxx_destruct
{
}

@end