@interface TVPFilterViewController
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation TVPFilterViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPFilterViewController;
  -[TVPFilterViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPFilterViewController tableView](self, "tableView"));
  [v3 setInsetsContentViewsToSafeArea:0];
  [v3 setInsetsLayoutMarginsFromSafeArea:0];
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 0.0, 20.0, 0.0, 20.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v3 setBackgroundColor:v4];

  [v3 setRemembersLastFocusedIndexPath:1];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  BOOL v5 = (uint64_t)-[TVPFilterViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", a3) > 1
    && a4 == 1;
  double result = 0.0;
  if (v5) {
    return 30.0;
  }
  return result;
}

@end