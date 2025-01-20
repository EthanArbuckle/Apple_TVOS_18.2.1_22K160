@interface NSValue
+ (id)tvh_valueWithMargin:(UIEdgeInsets)a3;
- (UIEdgeInsets)tvh_marginValue;
@end

@implementation NSValue

+ (id)tvh_valueWithMargin:(UIEdgeInsets)a3
{
  UIEdgeInsets v4 = a3;
  return (id)objc_claimAutoreleasedReturnValue( +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  &v4,  "{UIEdgeInsets=dddd}"));
}

- (UIEdgeInsets)tvh_marginValue
{
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  -[NSValue getValue:](self, "getValue:", &v6);
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = *((double *)&v7 + 1);
  double v4 = *(double *)&v7;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end