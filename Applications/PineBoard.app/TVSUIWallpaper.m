@interface TVSUIWallpaper
+ (id)pb_wallpaperViewForVariant:(int64_t)a3 bundleIdentifier:(id)a4;
@end

@implementation TVSUIWallpaper

+ (id)pb_wallpaperViewForVariant:(int64_t)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppearanceManager sharedInstance](&OBJC_CLASS___PBSystemAppearanceManager, "sharedInstance"));
  id v7 = [v6 effectiveUserInterfaceStyleForBundleIdentifier:v5];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper wallpaperViewForUserInterfaceStyle:variant:]( &OBJC_CLASS___TVSUIWallpaper,  "wallpaperViewForUserInterfaceStyle:variant:",  v7,  a3));
  [v8 setOpaque:1];
  return v8;
}

@end