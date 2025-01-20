@interface CountdownRendererFormatProvider
- (BOOL)isFocusable;
- (CountdownRendererFormatProvider)init;
- (double)cornerRadius;
@end

@implementation CountdownRendererFormatProvider

- (CountdownRendererFormatProvider)init
{
  v4 = 0LL;
  v4 = -[CountdownRendererFormatProvider initWithFormat:](self, "initWithFormat:", 1LL);
  v3 = v4;
  objc_storeStrong((id *)&v4, 0LL);
  return v3;
}

- (double)cornerRadius
{
  return 4.0;
}

- (BOOL)isFocusable
{
  return 0;
}

@end