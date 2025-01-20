@interface TVSettingsColorBarsViewController
- (id)title;
- (void)loadView;
@end

@implementation TVSettingsColorBarsViewController

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = -[TVSettingsColorBarsView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSettingsColorBarsView),  "initWithFrame:",  v5,  v7,  v9,  v11);
  -[TVSettingsColorBarsViewController setView:](self, "setView:", v12);
}

- (id)title
{
  return 0LL;
}

@end