@interface UILabel
- (BOOL)textFitsNumberOfLines:(int64_t)a3 forWidth:(double)a4;
- (double)mt_baselineOriginY;
- (double)mt_capOriginY;
@end

@implementation UILabel

- (double)mt_capOriginY
{
  double MinY = CGRectGetMinY(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self, "font"));
  objc_msgSend(v4, "mt_offsetFromCapHeightToAscent");
  double v6 = MinY + v5;

  return v6;
}

- (double)mt_baselineOriginY
{
  double MaxY = CGRectGetMaxY(v6);
  -[UILabel _baselineOffsetFromBottom](self, "_baselineOffsetFromBottom");
  return MaxY - v4;
}

- (BOOL)textFitsNumberOfLines:(int64_t)a3 forWidth:(double)a4
{
  if (!a3) {
    return 1;
  }
  -[UILabel textRectForBounds:limitedToNumberOfLines:]( self,  "textRectForBounds:limitedToNumberOfLines:",  0.0,  0.0,  a4,  1.79769313e308);
  double v8 = v7;
  -[UILabel textRectForBounds:limitedToNumberOfLines:]( self,  "textRectForBounds:limitedToNumberOfLines:",  a3 + 1,  0.0,  0.0,  a4,  1.79769313e308);
  return v9 - v8 <= 0.00000011920929;
}

@end