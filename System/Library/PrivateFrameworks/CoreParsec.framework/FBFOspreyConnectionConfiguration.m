@interface FBFOspreyConnectionConfiguration
- (BOOL)disableDeviceAuthentication;
- (NSDictionary)extraHeaders;
- (_TtC11FlusherUtil32FBFOspreyConnectionConfiguration)init;
- (void)prepare:(id)a3;
- (void)setDisableDeviceAuthentication:(BOOL)a3;
- (void)setExtraHeaders:(id)a3;
@end

@implementation FBFOspreyConnectionConfiguration

- (BOOL)disableDeviceAuthentication
{
  return sub_10004AC90() & 1;
}

- (void)setDisableDeviceAuthentication:(BOOL)a3
{
}

- (NSDictionary)extraHeaders
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setExtraHeaders:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  v5 = self;
  sub_10004AD90(v4);
}

- (void)prepare:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10004B0CC(v4);
}

- (_TtC11FlusherUtil32FBFOspreyConnectionConfiguration)init
{
}

- (void).cxx_destruct
{
}

@end