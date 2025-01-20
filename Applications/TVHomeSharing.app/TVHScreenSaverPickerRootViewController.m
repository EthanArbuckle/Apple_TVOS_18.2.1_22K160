@interface TVHScreenSaverPickerRootViewController
- (TVHScreenSaverPickerRootViewController)initWithMediaLibrariesEnviroment:(id)a3;
- (id)_browseViewControllersWithMediaLibrary:(id)a3 openURL:(id)a4;
@end

@implementation TVHScreenSaverPickerRootViewController

- (TVHScreenSaverPickerRootViewController)initWithMediaLibrariesEnviroment:(id)a3
{
  id v4 = a3;
  [v4 setConfiguringScreenSaverOnly:1];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHScreenSaverPickerRootViewController;
  v5 = -[TVHRootViewController initWithMediaLibrariesEnviroment:](&v8, "initWithMediaLibrariesEnviroment:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 screenSaverPicker]);
    [v6 setDelegate:v5];
  }

  return v5;
}

- (id)_browseViewControllersWithMediaLibrary:(id)a3 openURL:(id)a4
{
  id v4 = a3;
  v5 = -[TVHScreenSaverPickerViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHScreenSaverPickerViewController),  "initWithMediaLibrary:",  v4);

  objc_super v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v6;
}

@end