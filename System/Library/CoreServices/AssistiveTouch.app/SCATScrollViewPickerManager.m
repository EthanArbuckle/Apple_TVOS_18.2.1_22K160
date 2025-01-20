@interface SCATScrollViewPickerManager
- (BOOL)canBeActiveElementManager;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (NSArray)elementsToScroll;
- (NSArray)scrollViews;
- (SCATScrollViewPickerViewController)pickerViewController;
- (id)visualProvider;
- (int)scrollAction;
- (void)setElementsToScroll:(id)a3;
- (void)setPickerViewController:(id)a3;
- (void)setScrollAction:(int)a3;
- (void)setScrollViews:(id)a3;
@end

@implementation SCATScrollViewPickerManager

- (id)visualProvider
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScrollViewPickerManager pickerViewController](self, "pickerViewController"));

  if (!v3)
  {
    v4 = -[SCATElementManagerViewController initWithElementManager:]( objc_alloc(&OBJC_CLASS___SCATScrollViewPickerViewController),  "initWithElementManager:",  self);
    -[SCATScrollViewPickerManager setPickerViewController:](self, "setPickerViewController:", v4);
  }

  return -[SCATScrollViewPickerManager pickerViewController](self, "pickerViewController");
}

- (BOOL)canBeActiveElementManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScrollViewPickerManager scrollViews](self, "scrollViews"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 action] != (id)100
    && [v6 action] != (id)103
    && [v6 action] != (id)109)
  {
    goto LABEL_12;
  }

  if (([v7 scatIsAXElement] & 1) == 0)
  {
    id v17 = v7;
    *(void *)&double v8 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATScrollViewPickerManager.m",  53LL,  "-[SCATScrollViewPickerManager handleInputAction:withElement:]",  @"Unexpected element handled in scroll view picker manager: %@").n128_u64[0];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScrollViewPickerManager scrollViews](self, "scrollViews", v8, v17));

  if (!v9) {
    *(void *)&double v10 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATScrollViewPickerManager.m",  54LL,  "-[SCATScrollViewPickerManager handleInputAction:withElement:]",  @"Should not have been able to have the scroll view picker manager active, if it had no scroll views.").n128_u64[0];
  }
  if (objc_msgSend(v7, "scatIsAXElement", v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScrollViewPickerManager scrollViews](self, "scrollViews"));

    if (v11)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScrollViewPickerManager scrollViews](self, "scrollViews"));
      id v12 = [v11 indexOfObject:v7];

      LOBYTE(v11) = v12 != (id)0x7FFFFFFFFFFFFFFFLL;
      if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScrollViewPickerManager scrollViews](self, "scrollViews"));
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATScrollViewPickerManager.m",  58LL,  "-[SCATScrollViewPickerManager handleInputAction:withElement:]",  @"Unable to find scroll view %@ in our list %@");
      }

      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScrollViewPickerManager elementsToScroll](self, "elementsToScroll"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v12]);

        objc_msgSend(v14, "performAction:", -[SCATScrollViewPickerManager scrollAction](self, "scrollAction"));
        -[SCATScrollViewPickerManager setScrollViews:](self, "setScrollViews:", 0LL);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
        [v15 beginScanningWithFocusContext:0];
      }
    }
  }

  else
  {
LABEL_12:
    LOBYTE(v11) = 0;
  }

  return (char)v11;
}

- (NSArray)scrollViews
{
  return self->_scrollViews;
}

- (void)setScrollViews:(id)a3
{
}

- (NSArray)elementsToScroll
{
  return self->_elementsToScroll;
}

- (void)setElementsToScroll:(id)a3
{
}

- (int)scrollAction
{
  return self->_scrollAction;
}

- (void)setScrollAction:(int)a3
{
  self->_scrollAction = a3;
}

- (SCATScrollViewPickerViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (void)setPickerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end