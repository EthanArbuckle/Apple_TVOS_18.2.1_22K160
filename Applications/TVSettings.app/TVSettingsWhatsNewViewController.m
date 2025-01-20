@interface TVSettingsWhatsNewViewController
- (void)viewDidLoad;
@end

@implementation TVSettingsWhatsNewViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsWhatsNewViewController;
  -[TVSettingsWhatsNewViewController viewDidLoad](&v9, "viewDidLoad");
  objc_initWeak(&location, self);
  uint64_t v10 = TVWNServiceOptionShouldDismissOnMenuEventKey;
  v11 = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100089018;
  v6[3] = &unk_100192320;
  objc_copyWeak(&v7, &location);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100089128;
  v4[3] = &unk_100192348;
  objc_copyWeak(&v5, &location);
  +[TVWNService shouldShowWhatsNewWithOptions:reply:dismissHandler:]( &OBJC_CLASS___TVWNService,  "shouldShowWhatsNewWithOptions:reply:dismissHandler:",  v3,  v6,  v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

@end