@interface MRDUserDefaultsLockScreenRoutingProvider
- (MRDLockScreenRoutingProviderDelegate)delegate;
- (MRDUserDefaultsLockScreenRoutingProvider)init;
- (MRDUserDefaultsLockScreenRoutingProvider)initWithDelegate:(id)a3 queue:(id)a4;
- (NSArray)nearbyDeviceIdentifiers;
- (void)setDelegate:(id)a3;
- (void)setNearbyDeviceIdentifiers:(id)a3;
- (void)update;
@end

@implementation MRDUserDefaultsLockScreenRoutingProvider

- (MRDLockScreenRoutingProviderDelegate)delegate
{
  return (MRDLockScreenRoutingProviderDelegate *)sub_10021399C( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRDUserDefaultsLockScreenRoutingProvider_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)nearbyDeviceIdentifiers
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___MRDUserDefaultsLockScreenRoutingProvider_nearbyDeviceIdentifiers);
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDUserDefaultsLockScreenRoutingProvider_nearbyDeviceIdentifiers,  v6,  0LL,  0LL);
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain(v3);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setNearbyDeviceIdentifiers:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MRDUserDefaultsLockScreenRoutingProvider_nearbyDeviceIdentifiers);
  swift_beginAccess(v5, v7, 1LL, 0LL);
  uint64_t v6 = *v5;
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease(v6);
}

- (MRDUserDefaultsLockScreenRoutingProvider)initWithDelegate:(id)a3 queue:(id)a4
{
  return (MRDUserDefaultsLockScreenRoutingProvider *)sub_100213D40((uint64_t)a3, a4);
}

- (void)update
{
  v2 = self;
  sub_100213F7C();
}

- (MRDUserDefaultsLockScreenRoutingProvider)init
{
  result = (MRDUserDefaultsLockScreenRoutingProvider *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.UserDefaultsLockScreenRoutingProvider",  50LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end