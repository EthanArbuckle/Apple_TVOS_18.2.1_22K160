@interface SCATModernMenuConfirmGestureSheet
- (BOOL)allowsBackAction;
- (BOOL)allowsExitAction;
- (BOOL)shouldKeepScannerAwake;
- (CGRect)rectToClear;
- (SCATMenuGestureConfirmationItemsViewDelegate)delegate;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SCATModernMenuConfirmGestureSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuConfirmGestureSheet delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nameForConfirmationButton:self]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"general_done",  self,  v5,  0LL,  0LL));
  [v3 addObject:v6];

  id v7 = sub_10002B014(@"REDO_LINE_GESTURE");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"general_redo",  self,  v8,  0LL,  0LL));
  [v3 addObject:v9];

  id v10 = sub_10002B014(@"CANCEL_LINE_GESTURE");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"general_cancel",  self,  v11,  0LL,  0LL));
  [v3 addObject:v12];

  return v3;
}

- (BOOL)allowsBackAction
{
  return 0;
}

- (BOOL)allowsExitAction
{
  return 0;
}

- (CGRect)rectToClear
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"general_done"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuConfirmGestureSheet delegate](self, "delegate"));
    [v6 didConfirmGesture:self];
  }

  else if ([v5 isEqualToString:@"general_cancel"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuConfirmGestureSheet delegate](self, "delegate"));
    [v6 didCancelGesture:self];
  }

  else
  {
    if (![v5 isEqualToString:@"general_redo"])
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuConfirmGestureSheet;
      -[SCATModernMenuSheet menuItemWasActivated:](&v7, "menuItemWasActivated:", v4);
      goto LABEL_8;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuConfirmGestureSheet delegate](self, "delegate"));
    [v6 didRequestRedoGesture:self];
  }

LABEL_8:
}

- (SCATMenuGestureConfirmationItemsViewDelegate)delegate
{
  return (SCATMenuGestureConfirmationItemsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end