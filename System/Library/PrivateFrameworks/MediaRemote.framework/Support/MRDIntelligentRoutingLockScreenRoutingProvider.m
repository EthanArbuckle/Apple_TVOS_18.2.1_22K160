@interface MRDIntelligentRoutingLockScreenRoutingProvider
- (MRDIntelligentRoutingLockScreenRoutingProvider)init;
- (MRDIntelligentRoutingLockScreenRoutingProvider)initWithDelegate:(id)a3 queue:(id)a4 routeRecommender:(id)a5 routeRecommendationStore:(id)a6;
- (MRDLockScreenRoutingProviderDelegate)delegate;
- (NSArray)nearbyDeviceIdentifiers;
- (void)setDelegate:(id)a3;
- (void)startObservationIfNeeded;
- (void)update;
@end

@implementation MRDIntelligentRoutingLockScreenRoutingProvider

- (MRDLockScreenRoutingProviderDelegate)delegate
{
  return (MRDLockScreenRoutingProviderDelegate *)sub_10021399C( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRDIntelligentRoutingLockScreenRoutingProvider_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MRDIntelligentRoutingLockScreenRoutingProvider)initWithDelegate:(id)a3 queue:(id)a4 routeRecommender:(id)a5 routeRecommendationStore:(id)a6
{
  id v10 = a4;
  swift_unknownObjectRetain(a5);
  return (MRDIntelligentRoutingLockScreenRoutingProvider *)sub_100212F0C((uint64_t)a3, v10, (uint64_t)a5, a6);
}

- (void)update
{
  v2 = self;
  sub_1002130EC();
}

- (NSArray)nearbyDeviceIdentifiers
{
  v2 = self;
  sub_100213370();

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)startObservationIfNeeded
{
  v2 = self;
  sub_100213768();
}

- (MRDIntelligentRoutingLockScreenRoutingProvider)init
{
  result = (MRDIntelligentRoutingLockScreenRoutingProvider *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.MRDIntelligentRoutingLockScreenRoutingProvider",  59LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___MRDIntelligentRoutingLockScreenRoutingProvider_routeRecommender));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDIntelligentRoutingLockScreenRoutingProvider_routeRecommendationStore));
}

@end