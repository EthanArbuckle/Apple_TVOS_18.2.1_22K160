@interface CLPedestrianFenceSession
- (CLPedestrianFenceServiceClientProtocol)client;
- (CLPedestrianFenceSession)initWithClient:(id)a3 identifier:(id)a4 atTime:(double)a5 atMonotonicTime:(double)a6;
- (NSMutableDictionary)fenceIDToIndex;
- (NSMutableDictionary)fenceMetadata;
- (NSString)clientIdentifier;
- (void)dealloc;
- (void)setClient:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setFenceIDToIndex:(id)a3;
- (void)setFenceMetadata:(id)a3;
@end

@implementation CLPedestrianFenceSession

- (CLPedestrianFenceSession)initWithClient:(id)a3 identifier:(id)a4 atTime:(double)a5 atMonotonicTime:(double)a6
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLPedestrianFenceSession;
  v10 = -[CLPedestrianFenceSession init](&v12, "init");
  if (v10)
  {
    v10->_client = (CLPedestrianFenceServiceClientProtocol *)a3;
    v10->_clientIdentifier = (NSString *)a4;
    v10->_fenceIDToIndex = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v10->_fenceMetadata = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v10->_sessionStartTimeSince1970 = a5;
    v10->_sessionStartTime = a6;
    v10->_numFences = 0;
  }

  return v10;
}

- (void)dealloc
{
  self->_client = 0LL;
  self->_clientIdentifier = 0LL;

  self->_fenceIDToIndex = 0LL;
  self->_fenceMetadata = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPedestrianFenceSession;
  -[CLPedestrianFenceSession dealloc](&v3, "dealloc");
}

- (CLPedestrianFenceServiceClientProtocol)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSMutableDictionary)fenceIDToIndex
{
  return self->_fenceIDToIndex;
}

- (void)setFenceIDToIndex:(id)a3
{
}

- (NSMutableDictionary)fenceMetadata
{
  return self->_fenceMetadata;
}

- (void)setFenceMetadata:(id)a3
{
}

@end