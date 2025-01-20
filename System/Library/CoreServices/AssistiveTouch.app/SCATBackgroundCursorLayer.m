@interface SCATBackgroundCursorLayer
- (double)_borderWidthForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (double)_boundsInsetForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
- (id)_fillColorForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6;
@end

@implementation SCATBackgroundCursorLayer

- (id)_fillColorForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  if (a3 == 4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[SCATCursorLayer _strokeColorForTheme:level:highVisibility:options:]( self,  "_strokeColorForTheme:level:highVisibility:options:",  4LL,  a4,  a5,  *(void *)&a6));
    unsigned int v8 = -[SCATCursorLayer isDark](self, "isDark");
    double v9 = 0.34;
    if (!v8) {
      double v9 = 0.5;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 colorWithAlphaComponent:v9]);
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (double)_boundsInsetForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  double result = 0.0;
  if (a5) {
    return 14.0;
  }
  return result;
}

- (double)_borderWidthForTheme:(int64_t)a3 level:(int64_t)a4 highVisibility:(BOOL)a5 options:(int)a6
{
  BOOL v6 = a5;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorLayer styleProvider](self, "styleProvider", a3, a4, a5, *(void *)&a6));
  [v8 cursorBackgroundBorderWidth];
  double v10 = v9;

  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorLayer styleProvider](self, "styleProvider"));
    [v11 cursorHighVisibilityMultiplier];
    double v10 = v10 * v12;
  }

  return v10;
}

@end