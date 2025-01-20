@interface PREViewController
+ (id)viewController;
- (void)viewDidLoad;
@end

@implementation PREViewController

+ (id)viewController
{
  int v2 = _os_feature_enabled_impl("PreBoard", "ManualRestore");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = v3;
  if (v2) {
    v5 = @"PREMainMessageWithRestore";
  }
  else {
    v5 = @"PREMainMessage";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v5 value:&stru_10000CBB8 table:0]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"PREDialogTitle" value:&stru_10000CBB8 table:0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[PREViewController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___PREViewController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  v6,  1LL));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"PREResetAllSettingsButton" value:&stru_10000CBB8 table:0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  2LL,  &stru_10000C6D0));
  [v9 addAction:v12];

  if (_os_feature_enabled_impl("PreBoard", "ManualRestore"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"PRERestoreButton" value:&stru_10000CBB8 table:0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  2LL,  &stru_10000C770));
    [v9 addAction:v15];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"PRERestartButton" value:&stru_10000CBB8 table:0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  &stru_10000C810));

  [v9 addAction:v18];
  [v9 setPreferredAction:v18];

  return v9;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PREViewController;
  -[PREViewController viewDidLoad](&v2, "viewDidLoad");
}

@end