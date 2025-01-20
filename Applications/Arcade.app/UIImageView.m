@interface UIImageView
- (CGRect)jet_focusedFrame;
- (double)lastBaselineFromBottom;
@end

@implementation UIImageView

- (CGRect)jet_focusedFrame
{
  v2 = self;
  double v3 = UIImageView.focusedFrame.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (double)lastBaselineFromBottom
{
  v2 = self;
  double v3 = -[UIImageView image](v2, "image");
  if (v3)
  {
    double v4 = v3;
    double v5 = COERCE_DOUBLE(UIImage.baselineOffsetFromBottom.getter());
    char v7 = v6;

    double result = v5;
    if ((v7 & 1) != 0) {
      return 0.0;
    }
  }

  else
  {

    return 0.0;
  }

  return result;
}

@end