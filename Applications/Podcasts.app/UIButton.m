@interface UIButton
- (double)mt_firstBaselineOffsetFromTop;
@end

@implementation UIButton

- (double)mt_firstBaselineOffsetFromTop
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self, "titleLabel"));
  objc_msgSend(v2, "mt_baselineOriginY");
  double v4 = v3;

  return v4;
}

@end