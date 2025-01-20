@interface CSDVoIPProcessAssertionManager
- (CSDVoIPProcessAssertionManager)initWithSerialQueue:(id)a3;
- (NSCountedSet)processAssertions;
- (OS_dispatch_queue)serialQueue;
- (void)acquireProcessAssertionForBundleIdentifier:(id)a3;
- (void)invalidateProcessAssertionForBundleIdentifier:(id)a3;
- (void)setProcessAssertions:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation CSDVoIPProcessAssertionManager

- (CSDVoIPProcessAssertionManager)initWithSerialQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSDVoIPProcessAssertionManager;
  v6 = -[CSDVoIPProcessAssertionManager init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serialQueue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    processAssertions = v7->_processAssertions;
    v7->_processAssertions = v8;
  }

  return v7;
}

- (void)acquireProcessAssertionForBundleIdentifier:(id)a3
{
}

- (void)invalidateProcessAssertionForBundleIdentifier:(id)a3
{
}

- (NSCountedSet)processAssertions
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDVoIPProcessAssertionManager serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_processAssertions;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setProcessAssertions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end