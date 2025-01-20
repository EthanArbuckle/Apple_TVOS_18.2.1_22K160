@interface ControlChannelConnectionWireProtocolVersion
+ (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion)current;
+ (void)setCurrent:(id)a3;
- (NSString)description;
- (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion)init;
- (int64_t)rawValue;
@end

@implementation ControlChannelConnectionWireProtocolVersion

+ (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion)current
{
  return (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion *)static ControlChannelConnectionWireProtocolVersion.current.getter();
}

+ (void)setCurrent:(id)a3
{
}

- (int64_t)rawValue
{
  return ControlChannelConnectionWireProtocolVersion.rawValue.getter();
}

- (NSString)description
{
  v2 = self;
  sub_188475F30();

  v3 = (void *)sub_1884CA040();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion)init
{
}

@end