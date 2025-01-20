@interface AKNativeAnisetteServiceTrafficManager
+ (id)sharedSigningService;
- (AKNativeAnisetteServiceTrafficManager)init;
- (AKSigningTrafficClearanceRequest)activeSigningRequest;
- (NSMutableArray)pendingSigningRequests;
- (OS_dispatch_queue)trafficQueue;
- (void)setActiveSigningRequest:(id)a3;
- (void)setPendingSigningRequests:(id)a3;
@end

@implementation AKNativeAnisetteServiceTrafficManager

- (AKNativeAnisetteServiceTrafficManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKNativeAnisetteServiceTrafficManager;
  v2 = -[AKNativeAnisetteServiceTrafficManager init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingSigningRequests = v2->_pendingSigningRequests;
    v2->_pendingSigningRequests = (NSMutableArray *)v3;
  }

  return v2;
}

+ (id)sharedSigningService
{
  if (qword_10020F358 != -1) {
    dispatch_once(&qword_10020F358, &stru_1001C7370);
  }
  return (id)qword_10020F350;
}

- (NSMutableArray)pendingSigningRequests
{
  return self->_pendingSigningRequests;
}

- (void)setPendingSigningRequests:(id)a3
{
}

- (AKSigningTrafficClearanceRequest)activeSigningRequest
{
  return self->_activeSigningRequest;
}

- (void)setActiveSigningRequest:(id)a3
{
}

- (OS_dispatch_queue)trafficQueue
{
  return self->_trafficQueue;
}

- (void).cxx_destruct
{
}

@end