@interface SCATModernMenuGesturePanSheet
- (SCATMenuPanItemsViewDelegate)delegate;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SCATModernMenuGesturePanSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = sub_10002B014(@"PAN_LEFT");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_panLeft",  self,  v5,  0LL,  2LL));
  [v3 addObject:v6];

  id v7 = sub_10002B014(@"PAN_RIGHT");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_panRight",  self,  v8,  0LL,  2LL));
  [v3 addObject:v9];

  id v10 = sub_10002B014(@"PAN_UP");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_panUp",  self,  v11,  0LL,  2LL));
  [v3 addObject:v12];

  id v13 = sub_10002B014(@"PAN_DOWN");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_panDown",  self,  v14,  0LL,  2LL));
  [v3 addObject:v15];

  return v3;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"gestures_panLeft"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePanSheet delegate](self, "delegate"));
    [v6 didChoosePanLeft:self];
  }

  else if ([v5 isEqualToString:@"gestures_panRight"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePanSheet delegate](self, "delegate"));
    [v6 didChoosePanRight:self];
  }

  else if ([v5 isEqualToString:@"gestures_panUp"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePanSheet delegate](self, "delegate"));
    [v6 didChoosePanUp:self];
  }

  else
  {
    if (![v5 isEqualToString:@"gestures_panDown"])
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuGesturePanSheet;
      -[SCATModernMenuSheet menuItemWasActivated:](&v7, "menuItemWasActivated:", v4);
      goto LABEL_10;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePanSheet delegate](self, "delegate"));
    [v6 didChoosePanDown:self];
  }

LABEL_10:
}

- (SCATMenuPanItemsViewDelegate)delegate
{
  return (SCATMenuPanItemsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end