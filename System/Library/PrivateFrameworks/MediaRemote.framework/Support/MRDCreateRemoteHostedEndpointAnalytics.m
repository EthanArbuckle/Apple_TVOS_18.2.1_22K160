@interface MRDCreateRemoteHostedEndpointAnalytics
- (MRDCreateRemoteHostedEndpointAnalytics)init;
- (MRDCreateRemoteHostedEndpointAnalytics)initWithRequestID:(id)a3;
- (MRDTimingEvent)connectToTransientExternalDevice;
- (MRDTimingEvent)createHostedEndpoint;
- (MRDTimingEvent)createTransientExternalDevice;
- (MRDTimingEvent)searchForGroupUID;
- (NSString)requestID;
- (void)setConnectToTransientExternalDevice:(id)a3;
- (void)setCreateHostedEndpoint:(id)a3;
- (void)setCreateTransientExternalDevice:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setSearchForGroupUID:(id)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDCreateRemoteHostedEndpointAnalytics

- (NSString)requestID
{
  return (NSString *)sub_10021FBE0( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics_requestID);
}

- (void)setRequestID:(id)a3
{
}

- (MRDTimingEvent)createTransientExternalDevice
{
  v2 = self;
  id v3 = sub_10021B834();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateTransientExternalDevice:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createTransientExternalDevice);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createTransientExternalDevice) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)connectToTransientExternalDevice
{
  v2 = self;
  id v3 = sub_10021B8A4();

  return (MRDTimingEvent *)v3;
}

- (void)setConnectToTransientExternalDevice:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___connectToTransientExternalDevice);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___connectToTransientExternalDevice) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)createHostedEndpoint
{
  v2 = self;
  id v3 = sub_10021B914();

  return (MRDTimingEvent *)v3;
}

- (void)setCreateHostedEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createHostedEndpoint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createHostedEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)searchForGroupUID
{
  v2 = self;
  id v3 = sub_10021B984();

  return (MRDTimingEvent *)v3;
}

- (void)setSearchForGroupUID:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___searchForGroupUID);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___searchForGroupUID) = (Class)a3;
  id v3 = a3;
}

- (MRDCreateRemoteHostedEndpointAnalytics)initWithRequestID:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = (Class *)((char *)&self->super.isa + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics_eventName);
  void *v7 = 0xD000000000000030LL;
  v7[1] = 0x800000010033DBB0LL;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics_tracked) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createTransientExternalDevice) = 0LL;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___connectToTransientExternalDevice) = 0LL;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createHostedEndpoint) = 0LL;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___searchForGroupUID) = 0LL;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics_requestID);
  uint64_t *v8 = v6;
  v8[1] = v9;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[MRDCreateRemoteHostedEndpointAnalytics init](&v11, "init");
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDCreateRemoteHostedEndpointAnalytics)init
{
  result = (MRDCreateRemoteHostedEndpointAnalytics *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.CreateRemoteHostedEndpointAnalytics",  48LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createTransientExternalDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___connectToTransientExternalDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___createHostedEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDCreateRemoteHostedEndpointAnalytics____lazy_storage___searchForGroupUID));
}

@end