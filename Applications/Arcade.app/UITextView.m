@interface UITextView
- (BOOL)jet_isTextExtraTall;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIEdgeInsets)jet_languageAwareOutsets;
- (int64_t)jet_textLength;
@end

@implementation UITextView

- (BOOL)jet_isTextExtraTall
{
  v2 = self;
  char v3 = UITextView.isTextExtraTall.getter();

  return v3 & 1;
}

- (UIEdgeInsets)jet_languageAwareOutsets
{
  v2 = self;
  char v3 = -[UITextView font](v2, "font");
  if (v3)
  {
    v4 = v3;
    CGFloat top = UIFont.languageAwareOutsets.getter();
    CGFloat left = v6;
    CGFloat bottom = v8;
    CGFloat right = v10;
  }

  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }

  double v12 = top;
  double v13 = left;
  double v14 = bottom;
  double v15 = right;
  result.CGFloat right = v15;
  result.CGFloat bottom = v14;
  result.CGFloat left = v13;
  result.CGFloat top = v12;
  return result;
}

- (int64_t)jet_textLength
{
  v2 = self;
  char v3 = -[UITextView text](v2, "text");
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    uint64_t v7 = v6;

    int64_t v8 = String.count.getter(v5, v7);
    swift_bridgeObjectRelease(v7);
    return v8;
  }

  else
  {

    return 0LL;
  }

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  uint64_t v6 = self;
  _sSo10UITextViewC6ArcadeE12measurements7fitting2inSo14JUMeasurementsVSo6CGSizeV_So18UITraitEnvironment_ptF_0();
  double v8 = v7;
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

@end