@interface MRDCreateEndpointAnalytics
- (MRDCreateEndpointAnalytics)init;
- (MRDCreateEndpointAnalytics)initWithRequestID:(id)a3;
- (MRDTimingEvent)createHostedEndpoint;
- (MRDTimingEvent)createRemoteHostedEndpoint;
- (MRDTimingEvent)modifyOutputContext;
- (NSString)operationTypeString;
- (NSString)requestID;
- (int64_t)operationType;
- (void)setCreateHostedEndpoint:(id)a3;
- (void)setCreateRemoteHostedEndpoint:(id)a3;
- (void)setModifyOutputContext:(id)a3;
- (void)setOperationType:(int64_t)a3;
- (void)setOperationTypeString:(id)a3;
- (void)setRequestID:(id)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDCreateEndpointAnalytics

- (NSString)requestID
{
  return (NSString *)sub_10021FBE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRDCreateEndpointAnalytics_requestID);
}

- (void)setRequestID:(id)a3
{
}

- (int64_t)operationType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MRDCreateEndpointAnalytics_operationType);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDCreateEndpointAnalytics_operationType, v4, 0LL, 0LL);
  return *v2;
}

- (void)setOperationType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MRDCreateEndpointAnalytics_operationType);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDCreateEndpointAnalytics_operationType, v5, 1LL, 0LL);
  int64_t *v4 = a3;
}

- (NSString)operationTypeString
{
  return (NSString *)sub_10021FBE0( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRDCreateEndpointAnalytics_operationTypeString);
}

- (void)setOperationTypeString:(id)a3
{
}

- (MRDTimingEvent)createHostedEndpoint
{
  v2 = self;
  id v3 = sub_10021C858();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateHostedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createHostedEndpoint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createHostedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createRemoteHostedEndpoint
{
  v2 = self;
  id v3 = sub_10021C8C8();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateRemoteHostedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createRemoteHostedEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createRemoteHostedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)modifyOutputContext
{
  v2 = self;
  id v3 = sub_10021C938();

  return (MRDTimingEvent *)v3;
}

- (void)setModifyOutputContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___modifyOutputContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___modifyOutputContext) = (Class)a3;
  id v3 = a3;
}

- (MRDCreateEndpointAnalytics)initWithRequestID:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (MRDCreateEndpointAnalytics *)sub_10021CC84(v3, v4);
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDCreateEndpointAnalytics)init
{
  result = (MRDCreateEndpointAnalytics *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.CreateEndpointAnalytics",  36LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createHostedEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___createRemoteHostedEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateEndpointAnalytics____lazy_storage___modifyOutputContext));
}

@end