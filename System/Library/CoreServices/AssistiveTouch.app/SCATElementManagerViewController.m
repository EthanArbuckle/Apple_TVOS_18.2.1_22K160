@interface SCATElementManagerViewController
- (BOOL)isDisplayed;
- (SCATElementManager)elementManager;
- (SCATElementManagerViewController)initWithElementManager:(id)a3;
- (SCATStyleProvider)styleProvider;
- (id)viewsRequiringStateUpdate;
- (void)didDismiss:(BOOL)a3;
- (void)didPresentWithDisplayContext:(id)a3 animated:(BOOL)a4;
- (void)didUpdateWithDisplayContext:(id)a3 animated:(BOOL)a4;
- (void)dismiss:(BOOL)a3;
- (void)presentWithDisplayContext:(id)a3 animated:(BOOL)a4;
- (void)setElementManager:(id)a3;
- (void)updateCustomFocusingViewStateForViewsWithElement:(id)a3;
- (void)viewDidLoad;
- (void)willDismiss:(BOOL)a3;
- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4;
@end

@implementation SCATElementManagerViewController

- (SCATElementManagerViewController)initWithElementManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATElementManagerViewController;
  v5 = -[SCATElementManagerViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0LL, 0LL);
  v6 = v5;
  if (v5) {
    -[SCATElementManagerViewController setElementManager:](v5, "setElementManager:", v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATElementManagerViewController;
  -[SCATElementManagerViewController viewDidLoad](&v3, "viewDidLoad");
  -[SCATElementManagerViewController updateCustomFocusingViewStateForViewsWithElement:]( self,  "updateCustomFocusingViewStateForViewsWithElement:",  0LL);
}

- (SCATStyleProvider)styleProvider
{
  return (SCATStyleProvider *)+[SCATStyleProvider sharedStyleProvider]( &OBJC_CLASS___SCATStyleProvider,  "sharedStyleProvider");
}

- (void)presentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    -[SCATElementManagerViewController willPresentWithDisplayContext:animated:]( self,  "willPresentWithDisplayContext:animated:",  v6,  v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManagerViewController view](self, "view"));
    objc_super v8 = v7;
    if (v4)
    {
      [v7 setAlpha:0.0];

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManagerViewController view](self, "view"));
      [v6 addSubview:v9];

      -[SCATElementManagerViewController didAddSubviewToDisplayContext:](self, "didAddSubviewToDisplayContext:", v6);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000AB280;
      v13[3] = &unk_100121D18;
      v13[4] = self;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1000AB2B4;
      v10[3] = &unk_100122EE8;
      v10[4] = self;
      id v11 = v6;
      BOOL v12 = v4;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v13,  v10,  0.3);
    }

    else
    {
      [v6 addSubview:v7];

      -[SCATElementManagerViewController didAddSubviewToDisplayContext:](self, "didAddSubviewToDisplayContext:", v6);
      -[SCATElementManagerViewController didPresentWithDisplayContext:animated:]( self,  "didPresentWithDisplayContext:animated:",  v6,  0LL);
    }
  }
}

- (void)dismiss:(BOOL)a3
{
  BOOL v3 = a3;
  -[SCATElementManagerViewController willDismiss:](self, "willDismiss:");
  if (v3)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000AB398;
    v8[3] = &unk_100121D18;
    v8[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000AB3CC;
    v6[3] = &unk_1001232D0;
    v6[4] = self;
    char v7 = 1;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v8,  v6,  0.3);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManagerViewController view](self, "view"));
    [v5 removeFromSuperview];

    -[SCATElementManagerViewController didDismiss:](self, "didDismiss:", 0LL);
  }

- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManagerViewController elementManager](self, "elementManager", a3, a4));
  [v4 visualProviderWillPresent];
}

- (void)didPresentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManagerViewController elementManager](self, "elementManager", a3, a4));
  [v4 visualProviderDidPresent];
}

- (void)didUpdateWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManagerViewController elementManager](self, "elementManager", a3, a4));
  [v4 visualProviderDidUpdate];
}

- (void)willDismiss:(BOOL)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManagerViewController elementManager](self, "elementManager", a3));
  [v3 visualProviderWillDismiss];
}

- (void)didDismiss:(BOOL)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManagerViewController elementManager](self, "elementManager", a3));
  [v3 visualProviderDidDismiss];
}

- (id)viewsRequiringStateUpdate
{
  return 0LL;
}

- (void)updateCustomFocusingViewStateForViewsWithElement:(id)a3
{
  id v4 = a3;
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 parentGroup]);
  }
  id v6 = v5;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManagerViewController viewsRequiringStateUpdate](self, "viewsRequiringStateUpdate"));
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v22 + 1) + 8LL * (void)i);
        if (v12 == v4)
        {
          uint64_t v15 = 1LL;
          goto LABEL_17;
        }

        if (([v6 containsObject:*(void *)(*((void *)&v22 + 1) + 8 * (void)i)] & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 subviews]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
          if ([v6 containsObject:v14])
          {
          }

          else
          {
            uint64_t v16 = v10;
            v17 = v6;
            id v18 = v4;
            v19 = v7;
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
            unsigned __int8 v21 = [v20 assistiveTouchGroupElementsEnabled];

            char v7 = v19;
            id v4 = v18;
            id v6 = v17;
            uint64_t v10 = v16;

            if ((v21 & 1) != 0)
            {
              uint64_t v15 = 0LL;
              goto LABEL_17;
            }
          }
        }

        uint64_t v15 = 2LL;
LABEL_17:
        [v12 updateFocusState:v15];
      }

      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v9);
  }
}

- (BOOL)isDisplayed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManagerViewController view](self, "view"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 window]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (SCATElementManager)elementManager
{
  return (SCATElementManager *)objc_loadWeakRetained((id *)&self->_elementManager);
}

- (void)setElementManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end