@interface DynamicButtonView
- (BOOL)canBecomeFocused;
- (BOOL)hasContent;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSString)accessibilityLabel;
- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)init;
- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DynamicButtonView

- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)init
{
  return (_TtC20StoreDynamicUIPlugin17DynamicButtonView *)sub_5D3D4();
}

- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin17DynamicButtonView *)sub_5D5E8( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)initWithCoder:(id)a3
{
  return (_TtC20StoreDynamicUIPlugin17DynamicButtonView *)sub_5D82C(a3);
}

- (BOOL)hasContent
{
  v2 = self;
  unsigned __int8 v3 = sub_5DB18();

  return v3 & 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5DB68();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v7 = self;
  double v8 = sub_5DCBC(width);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease(a4);

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_5DE50((uint64_t)v2);
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
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
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v5 = v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_5CC3C((uint64_t)v6, v5);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = self;
  double v10 = sub_5E10C(width, height, a4, a5);
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
  sub_5E178();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void).cxx_destruct
{
}

@end