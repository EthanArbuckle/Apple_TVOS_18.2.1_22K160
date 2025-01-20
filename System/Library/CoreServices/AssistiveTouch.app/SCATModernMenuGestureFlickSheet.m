@interface SCATModernMenuGestureFlickSheet
- (SCATMenuFlickItemsViewDelegate)delegate;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SCATModernMenuGestureFlickSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = sub_10002B014(@"FLICK_UP");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_flickUp",  self,  v5,  0LL,  0LL));
  [v3 addObject:v6];

  id v7 = sub_10002B014(@"FLICK_DOWN");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_flickDown",  self,  v8,  0LL,  0LL));
  [v3 addObject:v9];

  id v10 = sub_10002B014(@"FLICK_LEFT");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_flickLeft",  self,  v11,  0LL,  0LL));
  [v3 addObject:v12];

  id v13 = sub_10002B014(@"FLICK_RIGHT");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_flickRight",  self,  v14,  0LL,  0LL));
  [v3 addObject:v15];

  id v16 = sub_10002B014(@"FLICK_ARBITRARY");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_flickCustom",  self,  v17,  0LL,  0LL));
  [v3 addObject:v18];

  return v3;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:@"gestures_flickUp"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFlickSheet delegate](self, "delegate"));
    [v6 didChooseFlickUp:self];
  }

  else if ([v5 isEqualToString:@"gestures_flickDown"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFlickSheet delegate](self, "delegate"));
    [v6 didChooseFlickDown:self];
  }

  else if ([v5 isEqualToString:@"gestures_flickLeft"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFlickSheet delegate](self, "delegate"));
    [v6 didChooseFlickLeft:self];
  }

  else if ([v5 isEqualToString:@"gestures_flickRight"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFlickSheet delegate](self, "delegate"));
    [v6 didChooseFlickRight:self];
  }

  else
  {
    if (![v5 isEqualToString:@"gestures_flickCustom"])
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuGestureFlickSheet;
      -[SCATModernMenuSheet menuItemWasActivated:](&v7, "menuItemWasActivated:", v4);
      goto LABEL_12;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuGestureFlickSheet delegate](self, "delegate"));
    [v6 didChooseArbitraryFlick:self];
  }

LABEL_12:
}

- (SCATMenuFlickItemsViewDelegate)delegate
{
  return (SCATMenuFlickItemsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end