@interface VOTItemChooserAdapter
+ (id)sharedInstance;
- (void)showItemChooser:(BOOL)a3 withItems:(id)a4;
@end

@implementation VOTItemChooserAdapter

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C8160;
  block[3] = &unk_100176EE0;
  block[4] = a1;
  if (qword_1001AD010 != -1) {
    dispatch_once(&qword_1001AD010, block);
  }
  return (id)qword_1001AD018;
}

- (void)showItemChooser:(BOOL)a3 withItems:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
  [v6 showUIServerBasedItemChooser:v4 withItems:v5];
}

@end