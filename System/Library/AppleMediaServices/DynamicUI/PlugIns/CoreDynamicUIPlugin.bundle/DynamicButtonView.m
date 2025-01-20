@interface DynamicButtonView
- (BOOL)canBecomeFocused;
- (BOOL)hasContent;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSString)accessibilityLabel;
- (_TtC19CoreDynamicUIPlugin17DynamicButtonView)init;
- (_TtC19CoreDynamicUIPlugin17DynamicButtonView)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin17DynamicButtonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DynamicButtonView

- (_TtC19CoreDynamicUIPlugin17DynamicButtonView)init
{
  return (_TtC19CoreDynamicUIPlugin17DynamicButtonView *)sub_1AB28();
}

- (_TtC19CoreDynamicUIPlugin17DynamicButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin17DynamicButtonView *)sub_1AD3C( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC19CoreDynamicUIPlugin17DynamicButtonView)initWithCoder:(id)a3
{
  return (_TtC19CoreDynamicUIPlugin17DynamicButtonView *)sub_1AF80(a3);
}

- (BOOL)hasContent
{
  v2 = self;
  unsigned __int8 v3 = sub_1B2C8();

  return v3 & 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B318();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  double v9 = sub_1B46C(width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease(a4);

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1B600((uint64_t)v2);
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

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = self;
  double v10 = sub_1B8BC(width, height, a4, a5);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1B928();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void).cxx_destruct
{
}

@end