@interface MRDGroupSessionCreateTimingEvents
- (MRDGroupSessionCreateTimingEvents)init;
- (MRDGroupSessionCreateTimingEvents)initWithRouteType:(unsigned __int8)a3;
- (MRDTimingEvent)nearbyGroup;
- (MRDTimingEvent)nearbyInvitation;
- (unsigned)routeType;
- (void)setNearbyGroup:(id)a3;
- (void)setNearbyInvitation:(id)a3;
- (void)setRouteType:(unsigned __int8)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDGroupSessionCreateTimingEvents

- (unsigned)routeType
{
  v2 = (unsigned __int8 *)self + OBJC_IVAR___MRDGroupSessionCreateTimingEvents_routeType;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDGroupSessionCreateTimingEvents_routeType, v4, 0LL, 0LL);
  return *v2;
}

- (void)setRouteType:(unsigned __int8)a3
{
  v4 = (unsigned __int8 *)self + OBJC_IVAR___MRDGroupSessionCreateTimingEvents_routeType;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDGroupSessionCreateTimingEvents_routeType, v5, 1LL, 0LL);
  unsigned __int8 *v4 = a3;
}

- (MRDTimingEvent)nearbyGroup
{
  v2 = self;
  id v3 = sub_100200DD4();

  return (MRDTimingEvent *)v3;
}

- (void)setNearbyGroup:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionCreateTimingEvents____lazy_storage___nearbyGroup);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionCreateTimingEvents____lazy_storage___nearbyGroup) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)nearbyInvitation
{
  v2 = self;
  id v3 = sub_100200E44();

  return (MRDTimingEvent *)v3;
}

- (void)setNearbyInvitation:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDGroupSessionCreateTimingEvents____lazy_storage___nearbyInvitation);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionCreateTimingEvents____lazy_storage___nearbyInvitation) = (Class)a3;
  id v3 = a3;
}

- (MRDGroupSessionCreateTimingEvents)initWithRouteType:(unsigned __int8)a3
{
  return (MRDGroupSessionCreateTimingEvents *)sub_100201038(a3, (uint64_t)a2);
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDGroupSessionCreateTimingEvents)init
{
  result = (MRDGroupSessionCreateTimingEvents *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.GroupSessionCreateTimingEvents",  43LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___MRDGroupSessionCreateTimingEvents_propertyMap));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDGroupSessionCreateTimingEvents____lazy_storage___nearbyGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDGroupSessionCreateTimingEvents____lazy_storage___nearbyInvitation));
}

@end