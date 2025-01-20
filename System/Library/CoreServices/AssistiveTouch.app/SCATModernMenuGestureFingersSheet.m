@interface SCATModernMenuGestureFingersSheet
- (SCATMenuFingerItemsViewDelegate)delegate;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SCATModernMenuGestureFingersSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = AXFormatInteger(1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_fingers1",  self,  v5,  0LL,  2LL));
  [v3 addObject:v6];

  uint64_t v7 = AXFormatInteger(2LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_fingers2",  self,  v8,  0LL,  2LL));
  [v3 addObject:v9];

  uint64_t v10 = AXFormatInteger(3LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_fingers3",  self,  v11,  0LL,  2LL));
  [v3 addObject:v12];

  uint64_t v13 = AXFormatInteger(4LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_fingers4",  self,  v14,  0LL,  2LL));
  [v3 addObject:v15];

  uint64_t v16 = AXFormatInteger(5LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_fingers5",  self,  v17,  0LL,  2LL));
  [v3 addObject:v18];

  return v3;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"gestures_fingers1"])
  {
    uint64_t v6 = 1LL;
  }

  else if ([v5 isEqualToString:@"gestures_fingers2"])
  {
    uint64_t v6 = 2LL;
  }

  else if ([v5 isEqualToString:@"gestures_fingers3"])
  {
    uint64_t v6 = 3LL;
  }

  else if ([v5 isEqualToString:@"gestures_fingers4"])
  {
    uint64_t v6 = 4LL;
  }

  else
  {
    if (![v5 isEqualToString:@"gestures_fingers5"])
    {
      v8.receiver = self;
      v8.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFingersSheet;
      -[SCATModernMenuSheet menuItemWasActivated:](&v8, "menuItemWasActivated:", v4);
      goto LABEL_12;
    }

    uint64_t v6 = 5LL;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFingersSheet delegate](self, "delegate"));
  [v7 fingerItemsViewController:self didChooseNumberOfFingers:v6];

LABEL_12:
}

- (SCATMenuFingerItemsViewDelegate)delegate
{
  return (SCATMenuFingerItemsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end