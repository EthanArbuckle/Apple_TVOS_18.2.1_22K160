@interface MRDNowPlayingAirPlaySessionEvents
- (BOOL)discoverableGroupLeader;
- (MRDNowPlayingAirPlaySessionEvents)init;
- (MRDNowPlayingAirPlaySessionEvents)initWithClusterType:(unsigned int)a3 modelID:(id)a4;
- (MRDTimingEvent)addLocalDevice;
- (MRDTimingEvent)findEndpoint;
- (MRDTimingEvent)interruptions;
- (MRDTimingEvent)originForward;
- (MRDTimingEvent)reloadDeviceInfo;
- (MRDTimingEvent)removeLocalDevice;
- (MRDTimingEvent)sourceOutputContext;
- (NSString)modelID;
- (unsigned)clusterType;
- (void)setAddLocalDevice:(id)a3;
- (void)setClusterType:(unsigned int)a3;
- (void)setDiscoverableGroupLeader:(BOOL)a3;
- (void)setFindEndpoint:(id)a3;
- (void)setInterruptions:(id)a3;
- (void)setModelID:(id)a3;
- (void)setOriginForward:(id)a3;
- (void)setReloadDeviceInfo:(id)a3;
- (void)setRemoveLocalDevice:(id)a3;
- (void)setSourceOutputContext:(id)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDNowPlayingAirPlaySessionEvents

- (BOOL)discoverableGroupLeader
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_discoverableGroupLeader;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_discoverableGroupLeader, v4, 0LL, 0LL);
  return *v2;
}

- (void)setDiscoverableGroupLeader:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_discoverableGroupLeader;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_discoverableGroupLeader, v5, 1LL, 0LL);
  BOOL *v4 = a3;
}

- (unsigned)clusterType
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_clusterType);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_clusterType, v4, 0LL, 0LL);
  return *v2;
}

- (void)setClusterType:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_clusterType);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_clusterType, v5, 1LL, 0LL);
  unsigned int *v4 = a3;
}

- (NSString)modelID
{
  v2 = (char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_modelID;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_modelID, v6, 0LL, 0LL);
  uint64_t v3 = *((void *)v2 + 1);
  swift_bridgeObjectRetain(v3);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setModelID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents_modelID);
  swift_beginAccess(v7, v9, 1LL, 0LL);
  uint64_t v8 = v7[1];
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (MRDTimingEvent)sourceOutputContext
{
  v2 = self;
  id v3 = sub_100201628();

  return (MRDTimingEvent *)v3;
}

- (void)setSourceOutputContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___sourceOutputContext);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___sourceOutputContext) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)removeLocalDevice
{
  v2 = self;
  id v3 = sub_100201698();

  return (MRDTimingEvent *)v3;
}

- (void)setRemoveLocalDevice:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___removeLocalDevice);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___removeLocalDevice) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)addLocalDevice
{
  v2 = self;
  id v3 = sub_100201708();

  return (MRDTimingEvent *)v3;
}

- (void)setAddLocalDevice:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___addLocalDevice);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___addLocalDevice) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)reloadDeviceInfo
{
  v2 = self;
  id v3 = sub_100201778();

  return (MRDTimingEvent *)v3;
}

- (void)setReloadDeviceInfo:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___reloadDeviceInfo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___reloadDeviceInfo) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)originForward
{
  v2 = self;
  id v3 = sub_1002017E8();

  return (MRDTimingEvent *)v3;
}

- (void)setOriginForward:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___originForward);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___originForward) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)findEndpoint
{
  v2 = self;
  id v3 = sub_100201858();

  return (MRDTimingEvent *)v3;
}

- (void)setFindEndpoint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___findEndpoint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___findEndpoint) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)interruptions
{
  v2 = self;
  id v3 = sub_1002018C8();

  return (MRDTimingEvent *)v3;
}

- (void)setInterruptions:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___interruptions);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___interruptions) = (Class)a3;
  id v3 = a3;
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDNowPlayingAirPlaySessionEvents)initWithClusterType:(unsigned int)a3 modelID:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (MRDNowPlayingAirPlaySessionEvents *)sub_100201F74(a3, v5, v6);
}

- (MRDNowPlayingAirPlaySessionEvents)init
{
  result = (MRDNowPlayingAirPlaySessionEvents *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.NowPlayingAirPlaySessionEvents",  43LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___sourceOutputContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___removeLocalDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___addLocalDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___reloadDeviceInfo));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___originForward));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___findEndpoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDNowPlayingAirPlaySessionEvents____lazy_storage___interruptions));
}

@end