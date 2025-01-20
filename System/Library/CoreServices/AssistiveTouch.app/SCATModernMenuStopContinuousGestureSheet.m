@interface SCATModernMenuStopContinuousGestureSheet
- (BOOL)allowsBackAction;
- (BOOL)allowsExitAction;
- (BOOL)shouldAllowDwellSelection;
- (BOOL)shouldKeepScannerAwake;
- (CGRect)rectToClear;
- (SCATMenuStopContinuousGestureItemViewDelegate)delegate;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SCATModernMenuStopContinuousGestureSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuStopContinuousGestureSheet delegate](self, "delegate"));
  char v5 = objc_opt_respondsToSelector(v4, "activationBehavior");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuStopContinuousGestureSheet delegate](self, "delegate"));
    id v7 = [v6 activationBehavior];
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = sub_10002B014(@"STOP");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"general_stop",  self,  v9,  0LL,  v7));
  [v3 addObject:v10];

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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuStopContinuousGestureSheet delegate](self, "delegate"));
  [v3 rectToClearForStop:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (BOOL)shouldAllowDwellSelection
{
  return 0;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"general_stop"])
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuStopContinuousGestureSheet delegate](self, "delegate"));
    [v6 didChooseStop:self];
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuStopContinuousGestureSheet;
    -[SCATModernMenuSheet menuItemWasActivated:](&v7, "menuItemWasActivated:", v4);
  }
}

- (SCATMenuStopContinuousGestureItemViewDelegate)delegate
{
  return (SCATMenuStopContinuousGestureItemViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end