@interface SCATModernMenuGesturePinchSheet
- (CGRect)rectToClear;
- (SCATMenuPinchItemsViewDelegate)delegate;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sheetWillAppear:(BOOL)a3;
- (void)sheetWillDisappear:(BOOL)a3;
@end

@implementation SCATModernMenuGesturePinchSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = sub_10002B014(@"PINCH_IN");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_pinchIn",  self,  v5,  0LL,  2LL));
  [v3 addObject:v6];

  id v7 = sub_10002B014(@"PINCH_OUT");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_pinchOut",  self,  v8,  0LL,  2LL));
  [v3 addObject:v9];

  id v10 = sub_10002B014(@"ROTATE_CLOCKWISE");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_rotateClockwise",  self,  v11,  0LL,  2LL));
  [v3 addObject:v12];

  id v13 = sub_10002B014(@"ROTATE_COUNTERCLOCKWISE");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_rotateCounterclockwise",  self,  v14,  0LL,  2LL));
  [v3 addObject:v15];

  return v3;
}

- (void)sheetWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATModernMenuGesturePinchSheet;
  -[SCATModernMenuSheet sheetWillAppear:](&v5, "sheetWillAppear:", a3);
  self->_shouldStayInPinchModeDuringDisappearance = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePinchSheet delegate](self, "delegate"));
  [v4 didPushPinchItemsViewController:self];
}

- (void)sheetWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATModernMenuGesturePinchSheet;
  -[SCATModernMenuSheet sheetWillDisappear:](&v5, "sheetWillDisappear:", a3);
  if (!self->_shouldStayInPinchModeDuringDisappearance)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePinchSheet delegate](self, "delegate"));
    [v4 willPopPinchItemsViewController:self];
  }

- (CGRect)rectToClear
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePinchSheet delegate](self, "delegate"));
  [v3 rectToClearForPinchGesture:self];
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

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"gestures_pinchIn"])
  {
    self->_shouldStayInPinchModeDuringDisappearance = 1;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePinchSheet delegate](self, "delegate"));
    [v6 didChoosePinchIn:self];
  }

  else if ([v5 isEqualToString:@"gestures_pinchOut"])
  {
    self->_shouldStayInPinchModeDuringDisappearance = 1;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePinchSheet delegate](self, "delegate"));
    [v6 didChoosePinchOut:self];
  }

  else if ([v5 isEqualToString:@"gestures_rotateClockwise"])
  {
    self->_shouldStayInPinchModeDuringDisappearance = 1;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePinchSheet delegate](self, "delegate"));
    [v6 didChooseRotateClockwise:self];
  }

  else
  {
    if (![v5 isEqualToString:@"gestures_rotateCounterclockwise"])
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuGesturePinchSheet;
      -[SCATModernMenuSheet menuItemWasActivated:](&v7, "menuItemWasActivated:", v4);
      goto LABEL_10;
    }

    self->_shouldStayInPinchModeDuringDisappearance = 1;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGesturePinchSheet delegate](self, "delegate"));
    [v6 didChooseRotateCounterclockwise:self];
  }

LABEL_10:
}

- (SCATMenuPinchItemsViewDelegate)delegate
{
  return (SCATMenuPinchItemsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end