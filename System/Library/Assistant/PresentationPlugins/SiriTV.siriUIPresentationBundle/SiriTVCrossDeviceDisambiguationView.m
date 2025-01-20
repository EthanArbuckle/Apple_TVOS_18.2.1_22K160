@interface SiriTVCrossDeviceDisambiguationView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)preferredFocusEnvironments;
- (_TtC6SiriTV35SiriTVCrossDeviceDisambiguationView)initWithCoder:(id)a3;
- (_TtC6SiriTV35SiriTVCrossDeviceDisambiguationView)initWithFrame:(CGRect)a3;
@end

@implementation SiriTVCrossDeviceDisambiguationView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = 500.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  double v3 = (_TtC6SiriTV27ConversationViewCoordinator *)sub_6F47C();

  sub_9E24((uint64_t *)&unk_DFA00);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3, v5, v6, v7, v8, v9, v10, v11);
  return (NSArray *)isa;
}

- (_TtC6SiriTV35SiriTVCrossDeviceDisambiguationView)initWithFrame:(CGRect)a3
{
  return (_TtC6SiriTV35SiriTVCrossDeviceDisambiguationView *)sub_6F5EC( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6SiriTV35SiriTVCrossDeviceDisambiguationView)initWithCoder:(id)a3
{
  return (_TtC6SiriTV35SiriTVCrossDeviceDisambiguationView *)sub_6F66C(a3);
}

@end