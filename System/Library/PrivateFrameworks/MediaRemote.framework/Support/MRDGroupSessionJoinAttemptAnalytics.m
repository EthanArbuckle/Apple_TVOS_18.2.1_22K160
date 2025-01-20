@interface MRDGroupSessionJoinAttemptAnalytics
- (MRDGroupSessionJoinAttemptAnalytics)init;
- (MRDGroupSessionJoinAttemptAnalytics)initWithJoinMode:(id)a3;
- (MRDTimingEvent)recon;
- (MRDTimingEvent)request;
- (MRDTimingEvent)whaConnect;
- (NSNumber)joinMode;
- (void)setJoinMode:(id)a3;
- (void)setRecon:(id)a3;
- (void)setRequest:(id)a3;
- (void)setWhaConnect:(id)a3;
- (void)track;
- (void)trackWithError:(id)a3;
@end

@implementation MRDGroupSessionJoinAttemptAnalytics

- (NSNumber)joinMode
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics_joinMode);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics_joinMode, v4, 0LL, 0LL);
  return (NSNumber *)*v2;
}

- (void)setJoinMode:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics_joinMode);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics_joinMode, v7, 1LL, 0LL);
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (MRDTimingEvent)request
{
  v2 = self;
  id v3 = sub_1002018D4(&OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics____lazy_storage___request);

  return (MRDTimingEvent *)v3;
}

- (void)setRequest:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics____lazy_storage___request);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics____lazy_storage___request) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)recon
{
  v2 = self;
  id v3 = sub_10020081C();

  return (MRDTimingEvent *)v3;
}

- (void)setRecon:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics____lazy_storage___recon);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics____lazy_storage___recon) = (Class)a3;
  id v3 = a3;
}

- (MRDTimingEvent)whaConnect
{
  v2 = self;
  id v3 = sub_10020088C();

  return (MRDTimingEvent *)v3;
}

- (void)setWhaConnect:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics____lazy_storage___whaConnect);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics____lazy_storage___whaConnect) = (Class)a3;
  id v3 = a3;
}

- (MRDGroupSessionJoinAttemptAnalytics)initWithJoinMode:(id)a3
{
  id v3 = a3;
  v5 = (MRDGroupSessionJoinAttemptAnalytics *)sub_1002023A0(v3, v4);

  return v5;
}

- (void)trackWithError:(id)a3
{
}

- (void)track
{
}

- (MRDGroupSessionJoinAttemptAnalytics)init
{
  result = (MRDGroupSessionJoinAttemptAnalytics *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.GroupSessionJoinAttemptAnalytics",  45LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics_propertyMap));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics____lazy_storage___request));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDGroupSessionJoinAttemptAnalytics____lazy_storage___whaConnect));
}

@end