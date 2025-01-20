@interface ButtonComponent
- (BOOL)isHighlighted;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSString)accessibilityLabel;
- (_TtC19CoreDynamicUIPlugin15ButtonComponent)init;
- (_TtC19CoreDynamicUIPlugin15ButtonComponent)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ButtonComponent

- (_TtC19CoreDynamicUIPlugin15ButtonComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin15ButtonComponent *)sub_DD00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_DE5C();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v5 = v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_DF18((uint64_t)v6, v5);
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_DF50();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v4 = self;
  sub_DFC0(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_E030();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_E0A4();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  uint64_t v5 = self;
  sub_E180();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_E200(v6, (uint64_t)v7);
}

- (_TtC19CoreDynamicUIPlugin15ButtonComponent)init
{
}

- (void).cxx_destruct
{
}

@end