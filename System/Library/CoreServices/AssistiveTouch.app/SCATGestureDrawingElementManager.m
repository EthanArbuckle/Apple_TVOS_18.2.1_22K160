@interface SCATGestureDrawingElementManager
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)allowsDwellSelection;
- (BOOL)shouldKeepScannerAwake;
- (SCATGestureDrawingElementManager)initWithStartingFingerPositions:(id)a3 menu:(id)a4;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)identifier;
- (id)lastElementWithOptions:(int *)a3;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)driver:(id)a3 willUnfocusFromContext:(id)a4;
- (void)scannerWillMakeManagerActive:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4;
- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4;
@end

@implementation SCATGestureDrawingElementManager

- (SCATGestureDrawingElementManager)initWithStartingFingerPositions:(id)a3 menu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SCATGestureDrawingElementManager;
  v8 = -[SCATGestureDrawingElementManager init](&v11, "init");
  if (v8)
  {
    v9 = -[SCATGestureDrawingViewController initWithElementManager:startingFingerPositions:menu:]( objc_alloc(&OBJC_CLASS___SCATGestureDrawingViewController),  "initWithElementManager:startingFingerPositions:menu:",  v8,  v6,  v7);
    -[SCATElementManager setVisualProvider:](v8, "setVisualProvider:", v9);
  }

  return v8;
}

- (id)identifier
{
  return off_100157168[0];
}

- (id)firstElementWithOptions:(int *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingElementManager drawingViewController](self, "drawingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstElementWithOptions:a3]);

  return v5;
}

- (id)lastElementWithOptions:(int *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingElementManager drawingViewController](self, "drawingViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastElementWithOptions:a3]);

  return v5;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingElementManager drawingViewController](self, "drawingViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 elementAfter:v8 didWrap:a4 options:a5]);

  return v10;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingElementManager drawingViewController](self, "drawingViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 elementBefore:v8 didWrap:a4 options:a5]);

  return v10;
}

- (void)scannerWillMakeManagerActive:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATGestureDrawingElementManager;
  id v4 = a3;
  -[SCATElementManager scannerWillMakeManagerActive:](&v6, "scannerWillMakeManagerActive:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGestureDrawingElementManager drawingViewController]( self,  "drawingViewController",  v6.receiver,  v6.super_class));
  [v5 scannerWillMakeManagerActive:v4];
}

- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATGestureDrawingElementManager;
  id v6 = a3;
  -[SCATElementManager scannerWillMakeManagerActive:forDisplayID:]( &v8,  "scannerWillMakeManagerActive:forDisplayID:",  v6,  v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGestureDrawingElementManager drawingViewController]( self,  "drawingViewController",  v8.receiver,  v8.super_class));
  [v7 scannerWillMakeManagerActive:v6 forDisplayID:v4];
}

- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATGestureDrawingElementManager;
  id v6 = a4;
  id v7 = a3;
  -[SCATElementManager scannerWillMakeManagerInactive:activeElementManager:]( &v9,  "scannerWillMakeManagerInactive:activeElementManager:",  v7,  v6);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGestureDrawingElementManager drawingViewController]( self,  "drawingViewController",  v9.receiver,  v9.super_class));
  [v8 scannerWillMakeManagerInactive:v7 activeElementManager:v6];
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SCATGestureDrawingElementManager;
  id v7 = a4;
  -[SCATElementManager driver:didFocusOnContext:oldContext:](&v15, "driver:didFocusOnContext:oldContext:", a3, v7, a5);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "element", v15.receiver, v15.super_class));

  objc_opt_class(&OBJC_CLASS___SCATMenuItemElement, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v8 menuItem]);
    [v11 setStyle:2];
    objc_opt_class(&OBJC_CLASS___SCATModernMenuGestureFreehandItem, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
    {
      id v14 = v11;
      [v14 setFocused:1];
    }
  }
}

- (void)driver:(id)a3 willUnfocusFromContext:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SCATGestureDrawingElementManager;
  -[SCATElementManager driver:willUnfocusFromContext:](&v15, "driver:willUnfocusFromContext:", a3, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);
  objc_opt_class(&OBJC_CLASS___SCATMenuItemElement, v8);
  LOBYTE(self) = objc_opt_isKindOfClass(v7, v9);

  if ((self & 1) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 menuItem]);

    [v11 setStyle:0];
    objc_opt_class(&OBJC_CLASS___SCATModernMenuGestureFreehandItem, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
    {
      id v14 = v11;
      [v14 setFocused:0];
    }
  }
}

- (BOOL)allowsDwellSelection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATGestureDrawingElementManager drawingViewController](self, "drawingViewController"));
  unsigned __int8 v3 = [v2 allowsDwellSelection];

  return v3;
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  return 0;
}

@end