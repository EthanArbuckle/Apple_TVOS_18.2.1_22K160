@interface UIRefreshControl
- (void)setLastRefreshDate:(id)a3;
- (void)setLastRefreshDate:(id)a3 textColor:(id)a4;
@end

@implementation UIRefreshControl

- (void)setLastRefreshDate:(id)a3
{
}

- (void)setLastRefreshDate:(id)a3 textColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (qword_1002B6BA8 != -1) {
      dispatch_once(&qword_1002B6BA8, &stru_100244B50);
    }
    NSAttributedStringKey v16 = NSForegroundColorAttributeName;
    v8 = v7;
    if (!v7) {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor refreshControlTextColor](&OBJC_CLASS___UIColor, "refreshControlTextColor"));
    }
    v17 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    if (!v7) {

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"LAST_REFRESH_FORMAT" value:&stru_100248948 table:0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 friendlyDisplayString]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1002B6BA0 stringFromDate:v6]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v12, v13));

    v15 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v14,  v9);
  }

  else
  {
    v15 = 0LL;
  }

  -[UIRefreshControl setAttributedTitle:](self, "setAttributedTitle:", v15);
}

@end