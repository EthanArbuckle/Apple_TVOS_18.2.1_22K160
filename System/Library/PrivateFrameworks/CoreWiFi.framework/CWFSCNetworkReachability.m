@interface CWFSCNetworkReachability
- (BOOL)isMonitoringEvents;
- (CWFSCNetworkReachability)init;
- (id)eventHandler;
- (unsigned)flags;
- (void)dealloc;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFSCNetworkReachability

- (CWFSCNetworkReachability)init
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CWFSCNetworkReachability;
  v2 = -[CWFSCNetworkReachability init](&v12, sel_init);
  if (!v2) {
    goto LABEL_7;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.corewifi.SC-reach-mutex", v3);
  mutexQueue = v2->_mutexQueue;
  v2->_mutexQueue = (OS_dispatch_queue *)v4;

  if (!v2->_mutexQueue) {
    goto LABEL_7;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.corewifi.SC-reach-event", v6);
  eventQueue = v2->_eventQueue;
  v2->_eventQueue = (OS_dispatch_queue *)v7;

  if (!v2->_eventQueue) {
    goto LABEL_7;
  }
  sockaddr address = (sockaddr)xmmword_18653E130;
  v9 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x189604DB0], &address);
  v2->_reachabilityRef = v9;
  if (v9)
  {
    v11.version = 0LL;
    memset(&v11.retain, 0, 24);
    v11.info = v2;
    SCNetworkReachabilitySetCallback(v9, (SCNetworkReachabilityCallBack)sub_186454A20, &v11);
  }

  else
  {
LABEL_7:

    return 0LL;
  }

  return v2;
}

- (void)dealloc
{
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CWFSCNetworkReachability;
  -[CWFSCNetworkReachability dealloc](&v4, sel_dealloc);
}

- (void)startEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186454C0C;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186454CAC;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_186454D84;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)flags
{
  SCNetworkReachabilityFlags flags = 0;
  SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags);
  return flags;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end