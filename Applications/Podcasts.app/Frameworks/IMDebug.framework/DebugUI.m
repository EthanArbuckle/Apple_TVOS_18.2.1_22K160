@interface DebugUI
+ (BOOL)isDebugUrl:(id)a3;
+ (id)createScreenShotOfPresentedViewController:(id)a3;
+ (id)debugViewController;
+ (void)initializeDebugUI:(id)a3;
+ (void)showDebugUI;
@end

@implementation DebugUI

+ (BOOL)isDebugUrl:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 host]);
  unsigned __int8 v4 = [v3 isEqualToString:@"debug"];

  return v4;
}

+ (void)initializeDebugUI:(id)a3
{
  id v4 = a3;
  v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  a1,  "showDebugUI");
  -[UITapGestureRecognizer _setRequiresSystemGesturesToFail:](v5, "_setRequiresSystemGesturesToFail:", 0LL);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](v5, "setNumberOfTouchesRequired:", 2LL);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v5, "setNumberOfTapsRequired:", 2LL);
  [v4 addGestureRecognizer:v5];
}

+ (void)showDebugUI
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUtil sharedApplicationIfPossible](&OBJC_CLASS___DebugUtil, "sharedApplicationIfPossible"));
  if (v2)
  {
    id v19 = v2;
    NSLog(@"Showing Debug UI");
    v3 = (void *)showDebugUI_navController;
    if (!showDebugUI_navController)
    {
      id v4 = objc_alloc(&OBJC_CLASS___UINavigationController);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUI debugViewController](&OBJC_CLASS___DebugUI, "debugViewController"));
      v6 = -[UINavigationController initWithRootViewController:](v4, "initWithRootViewController:", v5);
      v7 = (void *)showDebugUI_navController;
      showDebugUI_navController = (uint64_t)v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
      v9 = (char *)[v8 userInterfaceIdiom];
      [(id)showDebugUI_navController setModalPresentationStyle:2 * (v9 == (_BYTE *)&dword_0 + 1)];

      v3 = (void *)showDebugUI_navController;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 presentingViewController]);

    v2 = v19;
    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v19 delegate]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 window]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 rootViewController]);

      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 presentedViewController]);
      if (v14)
      {
        do
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v13 presentedViewController]);

          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 presentedViewController]);
          v13 = v15;
        }

        while (v16);
      }

      else
      {
        v15 = v13;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[DebugUI createScreenShotOfPresentedViewController:]( &OBJC_CLASS___DebugUI,  "createScreenShotOfPresentedViewController:",  v15));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUI debugViewController](&OBJC_CLASS___DebugUI, "debugViewController"));
      [v18 setScreenShotImage:v17];

      [v15 presentViewController:showDebugUI_navController animated:1 completion:0];
      v2 = v19;
    }
  }
}

+ (id)debugViewController
{
  v2 = (void *)debugViewController_debugViewController;
  if (!debugViewController_debugViewController)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___IMDebugViewController);
    id v4 = (void *)debugViewController_debugViewController;
    debugViewController_debugViewController = (uint64_t)v3;

    v2 = (void *)debugViewController_debugViewController;
  }

  return v2;
}

+ (id)createScreenShotOfPresentedViewController:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 view]);
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v8 scale];
  CGFloat v10 = v9;
  v14.width = v5;
  v14.height = v7;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v10);

  [v3 bounds];
  objc_msgSend(v3, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v12;
}

@end