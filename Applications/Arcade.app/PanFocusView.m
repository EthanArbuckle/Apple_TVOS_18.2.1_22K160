@interface PanFocusView
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC6ArcadeP33_00599866A72A07D21D537A40244FFFF312PanFocusView)initWithCoder:(id)a3;
- (_TtC6ArcadeP33_00599866A72A07D21D537A40244FFFF312PanFocusView)initWithFrame:(CGRect)a3;
@end

@implementation PanFocusView

- (BOOL)canBecomeFocused
{
  return 1;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_1000031E8((uint64_t *)&unk_1002DE0F0);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_100233570;
  *(void *)(v4 + 32) = self;
  uint64_t v8 = v4;
  specialized Array._endMutation()(v4);
  v5 = self;
  sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return (NSArray *)isa;
}

- (_TtC6ArcadeP33_00599866A72A07D21D537A40244FFFF312PanFocusView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  return -[PanFocusView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6ArcadeP33_00599866A72A07D21D537A40244FFFF312PanFocusView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[PanFocusView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end