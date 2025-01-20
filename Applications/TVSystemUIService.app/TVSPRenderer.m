@interface TVSPRenderer
+ (TVSPRenderer)rendererWithAccessibilityItem:(id)a3 format:(int64_t)a4;
@end

@implementation TVSPRenderer

+ (TVSPRenderer)rendererWithAccessibilityItem:(id)a3 format:(int64_t)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = [location[0] identifier];
  v6 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:");

  objc_storeStrong(location, 0LL);
  return v6;
}

@end