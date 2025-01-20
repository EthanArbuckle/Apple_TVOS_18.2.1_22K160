@interface SCATModernMenuGestureFreehandStopSheet
- (BOOL)allowsBackAction;
- (BOOL)allowsExitAction;
- (BOOL)shouldAllowDwellSelection;
- (NSString)actionToStop;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setActionToStop:(id)a3;
@end

@implementation SCATModernMenuGestureFreehandStopSheet

- (id)makeMenuItemsIfNeeded
{
  if ((AXDeviceIsPad(self, a2) & 1) != 0)
  {
    id v3 = sub_10002B014(@"FREEHAND_STOP_TWO_LINES");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandStopSheet actionToStop](self, "actionToStop"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v5));
  }

  else
  {
    id v7 = sub_10002B014(@"STOP");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuGestureFreehandItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"freehand_stop",  self,  v6,  @"SCATIcon_general_stop",  2LL));
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

  return v9;
}

- (BOOL)allowsBackAction
{
  return 0;
}

- (BOOL)allowsExitAction
{
  return 0;
}

- (BOOL)shouldAllowDwellSelection
{
  return 0;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v6 = [v5 isEqualToString:@"freehand_stop"];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFreehandSheetBase delegate](self, "delegate"));
    [v7 stopForFreehandSheet:self];
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFreehandStopSheet;
    -[SCATModernMenuGestureFreehandSheetBase menuItemWasActivated:](&v8, "menuItemWasActivated:", v4);
  }
}

- (NSString)actionToStop
{
  return self->_actionToStop;
}

- (void)setActionToStop:(id)a3
{
}

- (void).cxx_destruct
{
}

@end