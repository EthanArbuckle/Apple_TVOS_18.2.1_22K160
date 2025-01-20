@interface LACOnenessSessionMonitor
- (BOOL)isMonitoring;
- (BOOL)isSessionActive;
- (LACOnenessSessionMonitor)initWithReplyQueue:(id)a3;
- (id)makeModel;
- (id)model;
- (id)replyQueue;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation LACOnenessSessionMonitor

- (LACOnenessSessionMonitor)initWithReplyQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LACOnenessSessionMonitor;
  v6 = -[LACOnenessSessionMonitor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    uint64_t v8 = -[LACOnenessSessionMonitor makeModel](v7, "makeModel");
    model = v7->_model;
    v7->_model = (LACOnenessSessionMonitoring *)v8;
  }

  return v7;
}

- (id)model
{
  return self->_model;
}

- (id)replyQueue
{
  return self->_replyQueue;
}

- (void).cxx_destruct
{
}

- (BOOL)isMonitoring
{
  return @objc LACOnenessSessionMonitor.isMonitoring.getter( self,  (uint64_t)a2,  (SEL *)&selRef_isMonitoring);
}

- (BOOL)isSessionActive
{
  return @objc LACOnenessSessionMonitor.isMonitoring.getter( self,  (uint64_t)a2,  (SEL *)&selRef_isSessionActive);
}

- (void)startMonitoring
{
}

- (void)stopMonitoring
{
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)makeModel
{
  v2 = self;
  id v3 = LACOnenessSessionMonitor.makeModel()();

  return v3;
}

@end