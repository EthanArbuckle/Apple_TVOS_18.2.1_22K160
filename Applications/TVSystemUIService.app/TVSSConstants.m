@interface TVSSConstants
+ (BOOL)isScaledUI;
+ (CGSize)bannerMaximumSize;
+ (CGSize)bannerMinimumSize;
+ (CGSize)templateBannerImageMaxSize;
+ (CGSize)templateBannerMediaImageSize;
+ (CGSize)templateBannerMediaImageSmallSize;
+ (UIColor)focusedMenuItemTextColor;
+ (UIColor)normalMenuItemTextColor;
+ (UIColor)selectedMenuItemBackgroundColor;
+ (UIColor)selectedMenuItemTextColor;
+ (UIFont)extraLargeGlyphFont;
+ (double)bannerAppToastTopSpacing;
+ (double)bannerAppToastTrailingSpacing;
+ (double)itemDiameter;
+ (double)itemFocusedSizeIncrease;
+ (double)nowPlayingLargePlaybackButtonDiameter;
+ (double)nowPlayingPlaybackButtonDiameter;
+ (double)nowPlayingTransportBarHeight;
+ (double)templateBannerImageRoundedRectCornerRadius;
@end

@implementation TVSSConstants

+ (BOOL)isScaledUI
{
  return +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI", a2, a1) & 1;
}

+ (double)itemDiameter
{
  unsigned __int8 v2 = objc_msgSend(a1, "isScaledUI", a2, a1);
  double result = 60.0;
  if ((v2 & 1) == 0) {
    return 50.0;
  }
  return result;
}

+ (double)itemFocusedSizeIncrease
{
  unsigned __int8 v2 = objc_msgSend(a1, "isScaledUI", a2, a1);
  double result = 10.0;
  if ((v2 & 1) == 0) {
    return 8.0;
  }
  return result;
}

+ (UIColor)normalMenuItemTextColor
{
  v4 = (dispatch_once_t *)&unk_100221DD8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BB138);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (UIColor *)(id)qword_100221DE0;
}

+ (UIColor)selectedMenuItemTextColor
{
  return (UIColor *)objc_msgSend(a1, "normalMenuItemTextColor", a2, a1);
}

+ (UIColor)focusedMenuItemTextColor
{
  id v3 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
  id v4 = objc_msgSend(v3, "tvsp_lightStyleColor");

  return (UIColor *)v4;
}

+ (UIColor)selectedMenuItemBackgroundColor
{
  id v4 = (dispatch_once_t *)&unk_100221DE8;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BB178);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (UIColor *)(id)qword_100221DF0;
}

+ (UIFont)extraLargeGlyphFont
{
  unsigned __int8 v2 = [a1 isScaledUI];
  double v3 = 144.0;
  if ((v2 & 1) == 0) {
    double v3 = 120.0;
  }
  return +[UIFont systemFontOfSize:weight:](&OBJC_CLASS___UIFont, "systemFontOfSize:weight:", v3, UIFontWeightMedium);
}

+ (double)nowPlayingTransportBarHeight
{
  unsigned __int8 v2 = objc_msgSend(a1, "isScaledUI", a2, a1);
  double result = 10.0;
  if ((v2 & 1) == 0) {
    return 6.0;
  }
  return result;
}

+ (double)nowPlayingPlaybackButtonDiameter
{
  unsigned __int8 v2 = objc_msgSend(a1, "isScaledUI", a2, a1);
  double result = 94.0;
  if ((v2 & 1) == 0) {
    return 78.0;
  }
  return result;
}

+ (double)nowPlayingLargePlaybackButtonDiameter
{
  unsigned __int8 v2 = objc_msgSend(a1, "isScaledUI", a2, a1);
  double result = 108.0;
  if ((v2 & 1) == 0) {
    return 90.0;
  }
  return result;
}

+ (CGSize)bannerMinimumSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

  ;
}

+ (CGSize)bannerMaximumSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)templateBannerImageMaxSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)templateBannerMediaImageSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)templateBannerMediaImageSmallSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)templateBannerImageRoundedRectCornerRadius
{
  return 8.0;
}

+ (double)bannerAppToastTopSpacing
{
  return 57.0;
}

+ (double)bannerAppToastTrailingSpacing
{
  return 80.0;
}

@end