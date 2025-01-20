@interface MTMoreActionSheetAction
+ (id)action;
+ (id)moreIcon;
- (MTMoreActionSheetAction)init;
@end

@implementation MTMoreActionSheetAction

+ (id)action
{
  return objc_alloc_init((Class)objc_opt_class(a1, a2));
}

- (MTMoreActionSheetAction)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"MORE_ACTIONS" value:&stru_100248948 table:0]);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTMoreActionSheetAction;
  v5 = -[IMAction initWithTitle:icon:](&v12, "initWithTitle:icon:", v4, 0LL);

  if (v5)
  {
    objc_initWeak(&location, v5);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006FBFC;
    v9[3] = &unk_100242570;
    objc_copyWeak(&v10, &location);
    -[IMAction setActionBlock:](v5, "setActionBlock:", v9);
    -[IMAction setConditionBlock:](v5, "setConditionBlock:", &stru_100242590);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10006FC80;
    v7[3] = &unk_1002425B8;
    objc_copyWeak(&v8, &location);
    -[IMAction setButtonBlock:](v5, "setButtonBlock:", v7);
    -[IMActionSheetAction setTitleForAlertControllerBlock:](v5, "setTitleForAlertControllerBlock:", &stru_1002425F8);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v5;
}

+ (id)moreIcon
{
  if (qword_1002B69D8 != -1) {
    dispatch_once(&qword_1002B69D8, &stru_100242618);
  }
  return (id)qword_1002B69D0;
}

@end