@interface DBGViewDebuggerSupport_iOS
+ (BOOL)_isEffectView:(id)a3;
+ (BOOL)_viewHasAmbiguousLayout:(id)a3;
+ (BOOL)ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:(id)a3;
+ (BOOL)ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:(id)a3;
+ (BOOL)isHiddenForWindow:(id)a3;
+ (BOOL)isViewSubclass:(id)a3;
+ (BOOL)isWindowSubclass:(id)a3;
+ (double)firstBaselineOffsetFromTopForView:(id)a3;
+ (double)lastBaselineOffsetFromBottomForView:(id)a3;
+ (double)screenBackingScaleForView:(id)a3;
+ (double)screenBackingScaleForWindow:(id)a3;
+ (id)_messagesUIExtensionViews;
+ (id)_renderEffectViewUsingDrawHierarchyInRect:(id)a3;
+ (id)appWindows;
+ (id)displayNameForView:(id)a3;
+ (id)layerForView:(id)a3;
+ (id)primaryWindowFromWindows:(id)a3;
+ (id)snapshotMethodForView:(id)a3;
+ (id)snapshotView:(id)a3 errorString:(id *)a4;
+ (id)subviewsForView:(id)a3;
+ (id)viewForFirstBaselineLayoutPointerForView:(id)a3;
+ (id)viewForLastBaselineLayoutPointerForView:(id)a3;
+ (id)windowContentViewForWindow:(id)a3;
+ (unint64_t)ambiguityStatusMaskForView:(id)a3;
+ (void)addFrameBasics:(id)a3 toDict:(id)a4;
+ (void)addLayoutInfoForView:(id)a3 toDict:(id)a4;
+ (void)addViewBasics:(id)a3 toDict:(id)a4;
@end

@implementation DBGViewDebuggerSupport_iOS

+ (id)displayNameForView:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSAttributedString);
    char v9 = objc_opt_isKindOfClass(v7, v8);

    if ((v9 & 1) == 0) {
      goto LABEL_5;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v10 string]);
  }

  if (!v7)
  {
LABEL_5:
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___UIButton);
    if ((objc_opt_isKindOfClass(v3, v11) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v3 currentTitle]);
      goto LABEL_18;
    }

    if ((objc_opt_respondsToSelector(v3, "text") & 1) != 0)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v3 text]);
    }

    else
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___UIDatePicker);
      if ((objc_opt_isKindOfClass(v3, v13) & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v3 date]);
        id v15 = (id)objc_claimAutoreleasedReturnValue([v14 description]);
LABEL_17:
        v7 = v15;

        goto LABEL_18;
      }

      if ((objc_opt_respondsToSelector(v3, "title") & 1) == 0)
      {
        v7 = 0LL;
        goto LABEL_18;
      }

      uint64_t v12 = objc_claimAutoreleasedReturnValue([v3 title]);
    }

    v14 = (void *)v12;
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0) {
      v17 = v14;
    }
    else {
      v17 = 0LL;
    }
    id v15 = v17;
    goto LABEL_17;
  }

+ (id)primaryWindowFromWindows:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 keyWindow]);

  if (v5)
  {
    id v6 = v5;
  }

  else
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
LABEL_5:
      uint64_t v11 = 0LL;
      while (1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if (v9 == (id)++v11)
        {
          id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }

      id v13 = v12;

      if (v13) {
        goto LABEL_15;
      }
    }

    else
    {
LABEL_11:
    }

    id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject", (void)v15));
  }

  id v13 = v6;
LABEL_15:

  return v13;
}

+ (id)snapshotMethodForView:(id)a3
{
  id v3 = a3;
  Class v4 = NSClassFromString(@"SKView");
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (Class v5 = NSClassFromString(@"SCNView"), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    || (Class v6 = NSClassFromString(@"GLKView"), (objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    || (Class v7 = NSClassFromString(@"RealityKit.ARView"), (objc_opt_isKindOfClass(v3, v7) & 1) != 0))
  {
    id v8 = @"snapshot";
  }

  else
  {
    id v8 = 0LL;
  }

  return (id)v8;
}

+ (id)appWindows
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 windows]);

  return v3;
}

+ (id)windowContentViewForWindow:(id)a3
{
  return a3;
}

+ (BOOL)isHiddenForWindow:(id)a3
{
  return [a3 isHidden];
}

+ (double)screenBackingScaleForWindow:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 screen]);
  [v3 scale];
  double v5 = v4;

  return v5;
}

+ (double)screenBackingScaleForView:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);
  if (v5)
  {
    Class v6 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);
    [a1 screenBackingScaleForWindow:v6];
    double v8 = v7;
  }

  else
  {
    double v8 = 1.0;
  }

  return v8;
}

+ (id)_messagesUIExtensionViews
{
  Class v2 = NSClassFromString(@"_MSExtensionGlobalState");
  if (!v2) {
    return 0LL;
  }
  Class v3 = v2;
  if ((objc_opt_respondsToSelector(v2, "sharedInstance") & 1) == 0) {
    return 0LL;
  }
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[objc_class sharedInstance](v3, "sharedInstance"));
  double v5 = (void *)v4;
  if (v4 && (objc_opt_respondsToSelector(v4, "activeExtensionContext") & 1) != 0)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 activeExtensionContext]);
    double v7 = (void *)v6;
    if (v6 && (objc_opt_respondsToSelector(v6, "viewController") & 1) != 0)
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 viewController]);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIViewController);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
        id v13 = v10;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
      }

      else
      {
        uint64_t v11 = 0LL;
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

+ (id)layerForView:(id)a3
{
  return [a3 layer];
}

+ (id)subviewsForView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 contentView]);

    if (v5)
    {
      uint64_t v9 = v5;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    return v6;
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v3 subviews]);

    return v7;
  }

+ (BOOL)isWindowSubclass:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIWindow);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

+ (BOOL)isViewSubclass:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIView);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

+ (id)snapshotView:(id)a3 errorString:(id *)a4
{
  id v6 = a3;
  [v6 bounds];
  double v8 = v7;
  [v6 bounds];
  uint64_t v10 = 0LL;
  if (v8 > 0.0 && v9 > 0.0 && v8 * v9 < 16000000.0)
  {
    Class v11 = NSClassFromString(@"GLKView");
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0
      || (Class v12 = NSClassFromString(@"SKView"), (objc_opt_isKindOfClass(v6, v12) & 1) != 0)
      || (Class v13 = NSClassFromString(@"SCNView"), (objc_opt_isKindOfClass(v6, v13) & 1) != 0)
      || (Class v14 = NSClassFromString(@"RealityKit.ARView"), (objc_opt_isKindOfClass(v6, v14) & 1) != 0))
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v6 snapshot]);
    }

    else
    {
      if (![a1 _isEffectView:v6])
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v6 subviews]);
        id v20 = [v19 count];
        v21 = (char *)&v37 - ((4LL * (void)v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        if (v20)
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndex:i]);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 layer]);
            [v24 opacity];
            *(_DWORD *)&v21[4 * (void)i] = v25;

            v26 = (void *)objc_claimAutoreleasedReturnValue([v23 layer]);
            LODWORD(v27) = 0;
            [v26 setOpacity:v27];
          }
        }

        [v6 bounds];
        v38.width = v28;
        v38.height = v29;
        UIGraphicsBeginImageContextWithOptions(v38, 0, 0.0);
        CurrentContext = (UIImage *)UIGraphicsGetCurrentContext();
        if (CurrentContext)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue([v6 layer]);
          [v30 renderInContext:CurrentContext];

          ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
          CurrentContext = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
        }

        UIGraphicsEndImageContext();
        if (v20)
        {
          for (j = 0LL; j != v20; j = (char *)j + 1)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndex:j]);
            int v34 = *(_DWORD *)&v21[4 * (void)j];
            v35 = (void *)objc_claimAutoreleasedReturnValue([v33 layer]);
            LODWORD(v36) = v34;
            [v35 setOpacity:v36];
          }
        }

        if (!CurrentContext) {
          goto LABEL_12;
        }
LABEL_10:
        __int128 v17 = UIImagePNGRepresentation(CurrentContext);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (v10)
        {
LABEL_13:

          goto LABEL_14;
        }

        if (!*a4)
        {
          uint64_t v10 = 0LL;
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Problem getting view snapshot for %@",  v6));
          goto LABEL_13;
        }

+ (BOOL)_isEffectView:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewDebuggerEffectViewsToSnapshotAsImage", 0));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v10 = (objc_class *)objc_opt_class(v4);
        Class v11 = NSStringFromClass(v10);
        Class v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        LOBYTE(v9) = [v9 isEqualToString:v12];

        if ((v9 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

+ (id)_renderEffectViewUsingDrawHierarchyInRect:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 window]);
  if (!v4)
  {
    id v5 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);

    if (v6)
    {
      do
      {
        id v4 = (id)objc_claimAutoreleasedReturnValue([v5 superview]);

        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
        id v5 = v4;
      }

      while (v7);
    }

    else
    {
      id v4 = v5;
    }
  }

  [v3 bounds];
  objc_msgSend(v4, "convertRect:fromView:", v3);
  double x = v8;
  double y = v10;
  double width = v12;
  double height = v14;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  0LL,  0LL));
  id v17 = v3;
  __int128 v18 = v17;
  if (v4 == v17)
  {
    v72 = v17;
  }

  else
  {
    v19 = v17;
    do
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue([v19 superview]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 subviews]);
      v22 = (char *)[v21 indexOfObject:v19];

      v23 = (void *)objc_claimAutoreleasedReturnValue([v20 subviews]);
      v24 = (char *)[v23 count];
      int v25 = v22 + 1;

      if (v24 > v22 + 1)
      {
        while (1)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue([v20 subviews]);
          double v27 = (char *)[v26 count];

          if (v25 >= v27) {
            break;
          }
          CGFloat v28 = (void *)objc_claimAutoreleasedReturnValue([v20 subviews]);
          CGFloat v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:v25]);

          [v29 alpha];
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v16 setObject:v30 forKey:v29];

          [v29 setAlpha:0.0];
          ++v25;
        }
      }

      if ([v20 clipsToBounds])
      {
        [v20 bounds];
        objc_msgSend(v4, "convertRect:fromView:", v20);
        v87.origin.double x = v31;
        v87.origin.double y = v32;
        v87.size.double width = v33;
        v87.size.double height = v34;
        v85.origin.double x = x;
        v85.origin.double y = y;
        v85.size.double width = width;
        v85.size.double height = height;
        CGRect v86 = CGRectIntersection(v85, v87);
        double x = v86.origin.x;
        double y = v86.origin.y;
        double width = v86.size.width;
        double height = v86.size.height;
      }

      v19 = v20;
    }

    while (v20 != v4);
    v72 = v4;
  }

  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v18 subviews]);
  id v36 = [v35 countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v78;
    do
    {
      for (i = 0LL; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v78 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
        [v40 alpha];
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v16 setObject:v41 forKey:v40];

        [v40 setAlpha:0.0];
      }

      id v37 = [v35 countByEnumeratingWithState:&v77 objects:v82 count:16];
    }

    while (v37);
  }

  [v4 bounds];
  double v43 = v42;
  double v45 = v44;
  v83.double width = width;
  v83.double height = height;
  UIGraphicsBeginImageContextWithOptions(v83, 0, 0.0);
  objc_msgSend(v4, "drawViewHierarchyInRect:afterScreenUpdates:", 1, -x, -y, v43, v45);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v47 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  [v18 bounds];
  if (v49 != width || v48 != height)
  {
    objc_msgSend(v18, "convertRect:fromView:", v4, x, y, width, height);
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    [v18 bounds];
    v84.double width = v58;
    v84.double height = v59;
    UIGraphicsBeginImageContextWithOptions(v84, 0, 0.0);
    objc_msgSend(v47, "drawInRect:blendMode:alpha:", 0, v51, v53, v55, v57, 1.0);
    v60 = UIGraphicsGetImageFromCurrentImageContext();
    uint64_t v61 = objc_claimAutoreleasedReturnValue(v60);

    UIGraphicsEndImageContext();
    v47 = (void *)v61;
  }

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  v62 = (void *)objc_claimAutoreleasedReturnValue([v16 keyEnumerator]);
  id v63 = [v62 countByEnumeratingWithState:&v73 objects:v81 count:16];
  if (v63)
  {
    id v64 = v63;
    uint64_t v65 = *(void *)v74;
    do
    {
      for (j = 0LL; j != v64; j = (char *)j + 1)
      {
        if (*(void *)v74 != v65) {
          objc_enumerationMutation(v62);
        }
        v67 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)j);
        v68 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v67]);
        [v68 doubleValue];
        double v70 = v69;

        [v67 setAlpha:v70];
      }

      id v64 = [v62 countByEnumeratingWithState:&v73 objects:v81 count:16];
    }

    while (v64);
  }

  return v47;
}

+ (void)addFrameBasics:(id)a3 toDict:(id)a4
{
  id v5 = a4;
  [a3 frame];
  id v10 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v6, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  [v5 setObject:v11 forKey:@"frame"];
}

+ (void)addViewBasics:(id)a3 toDict:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  if ([a1 isViewSubclass:v25])
  {
    id v7 = v25;
    [v7 frame];
    id v12 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v8, v9, v10, v11);
    Class v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v6 setObject:v13 forKey:@"frame"];

    [v7 bounds];
    id v18 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v6 setObject:v19 forKey:@"bounds"];

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 superview]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%p", v20));

    [v6 setObject:v21 forKey:@"superview"];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isHidden]));
    [v6 setObject:v22 forKey:@"hidden"];

    v23 = (void *)objc_claimAutoreleasedReturnValue([a1 displayNameForView:v7]);
    if (v23) {
      [v6 setObject:v23 forKey:@"displayName"];
    }
    [v7 contentScaleFactor];
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v6 setObject:v24 forKey:@"contentsScale"];
  }
}

+ (void)addLayoutInfoForView:(id)a3 toDict:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintsAffectingLayoutForAxis:0]);
  double v8 = arrayOfObjectPointers(v7);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v6 setObject:v9 forKey:@"horizontalAffectingConstraints"];

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintsAffectingLayoutForAxis:1]);
  double v11 = arrayOfObjectPointers(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v6 setObject:v12 forKey:@"verticalAffectingConstraints"];

  Class v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [a1 _viewHasAmbiguousLayout:v25]));
  [v6 setObject:v13 forKey:@"hasAmbiguousLayout"];

  if ([a1 _viewHasAmbiguousLayout:v25])
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [a1 ambiguityStatusMaskForView:v25]));
    [v6 setObject:v14 forKey:@"ambiguityStatusMask"];
  }

  [a1 firstBaselineOffsetFromTopForView:v25];
  double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v6 setObject:v15 forKey:@"firstBaselineOffsetFromTop"];

  [a1 lastBaselineOffsetFromBottomForView:v25];
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v6 setObject:v16 forKey:@"lastBaselineOffsetFromBottom"];

  double v17 = (void *)objc_claimAutoreleasedReturnValue([a1 viewForFirstBaselineLayoutPointerForView:v25]);
  if (v17) {
    [v6 setObject:v17 forKey:@"viewForFirstBaselineLayout"];
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 viewForLastBaselineLayoutPointerForView:v25]);
  if (v18) {
    [v6 setObject:v18 forKey:@"viewForLastBaselineLayout"];
  }
  [v25 layoutMargins];
  id v23 = __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(v19, v20, v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v6 setObject:v24 forKey:@"layoutMargins"];
}

+ (BOOL)_viewHasAmbiguousLayout:(id)a3
{
  id v3 = a3;
  if (viewWantsAutoLayout(v3))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _layoutVariablesWithAmbiguousValue]);
    BOOL v5 = [v4 count] != 0;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (unint64_t)ambiguityStatusMaskForView:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _layoutVariablesWithAmbiguousValue]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
  if (!v7) {
    goto LABEL_7;
  }
  while ((objc_msgSend(v7, "_uiib_hostsLayoutEngine") & 1) == 0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 superview]);

    id v7 = (void *)v8;
    if (!v8) {
      goto LABEL_7;
    }
  }

  else {
LABEL_7:
  }
    double v9 = 0LL;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 _minXVariable]);
  if (v10)
  {
    else {
      unint64_t v11 = 0LL;
    }
  }

  else
  {
    unint64_t v11 = 0LL;
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 _minYVariable]);
  if (v12)
  {
  }

  Class v13 = (void *)objc_claimAutoreleasedReturnValue([v4 _boundsWidthVariable]);
  if (v13)
  {
  }

  double v14 = (void *)objc_claimAutoreleasedReturnValue([v4 _boundsHeightVariable]);
  uint64_t v20 = v12;
  if (v14)
  {
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_contentWidthVariable", v20));
  double v22 = (void *)v10;
  if (!v15) {
    goto LABEL_41;
  }
  if (([a1 ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:v4] & 1) == 0
    && [v6 containsObject:v15])
  {
    v11 |= 0x20uLL;
  }

  if (v9
    && ([a1 ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:v4] & 1) == 0)
  {
    double v16 = v6;
    id v17 = a1;
  }

  else
  {
LABEL_41:
    double v16 = v6;
    id v17 = a1;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 _contentHeightVariable]);
  if (v18)
  {
    if (([v17 ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:v4] & 1) == 0
      && [v16 containsObject:v18])
    {
      v11 |= 0x40uLL;
    }

    if (v9
      && ([v17 ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:v4] & 1) == 0
      && ![v9 hasValue:0 forVariable:v18])
    {
      v11 |= 0x8000uLL;
    }
  }

  return v11;
}

+ (BOOL)ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIScrollView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 subviews]);
    BOOL v6 = [v5 count] == 0;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIScrollView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 subviews]);
    BOOL v6 = [v5 count] == 0;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (double)firstBaselineOffsetFromTopForView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (viewWantsAutoLayout(v3))
  {
    uint64_t v4 = v3;
    if ((objc_opt_respondsToSelector(v3, "viewForFirstBaselineLayout") & 1) != 0)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewForFirstBaselineLayout]);
    }
  }

  double v5 = 0.0;
  if (viewWantsAutoLayout(v4)
    && (objc_opt_respondsToSelector(v4, "_firstBaselineOffsetFromTop") & 1) != 0)
  {
    [v4 _firstBaselineOffsetFromTop];
    double v5 = v6;
  }

  [v4 bounds];
  objc_msgSend(v4, "alignmentRectForFrame:");
  objc_msgSend(v4, "convertRect:toView:", v3);
  double v8 = v7;
  [v3 bounds];
  objc_msgSend(v3, "alignmentRectForFrame:");
  double v10 = v5 + v8 + v9;

  return v10;
}

+ (double)lastBaselineOffsetFromBottomForView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (viewWantsAutoLayout(v3))
  {
    uint64_t v4 = v3;
    if ((objc_opt_respondsToSelector(v3, "viewForLastBaselineLayout") & 1) != 0)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewForLastBaselineLayout]);
    }
  }

  double v5 = 0.0;
  if (viewWantsAutoLayout(v4) && (objc_opt_respondsToSelector(v4, "_baselineOffsetFromBottom") & 1) != 0)
  {
    [v4 _baselineOffsetFromBottom];
    double v5 = v6;
  }

  [v4 bounds];
  objc_msgSend(v4, "alignmentRectForFrame:");
  objc_msgSend(v4, "convertRect:toView:", v3);
  double v8 = v7;
  double v10 = v9;
  [v3 bounds];
  objc_msgSend(v3, "alignmentRectForFrame:");
  double v13 = v5 + v11 + v12 - (v8 + v10);

  return v13;
}

+ (id)viewForFirstBaselineLayoutPointerForView:(id)a3
{
  id v3 = a3;
  if (!viewWantsAutoLayout(v3)
    || (objc_opt_respondsToSelector(v3, "viewForFirstBaselineLayout") & 1) == 0)
  {
    uint64_t v4 = 0LL;
    goto LABEL_6;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewForFirstBaselineLayout]);
  if (!v4)
  {
LABEL_6:
    double v5 = 0LL;
    goto LABEL_7;
  }

  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%p", v4));
LABEL_7:

  return v5;
}

+ (id)viewForLastBaselineLayoutPointerForView:(id)a3
{
  id v3 = a3;
  if (!viewWantsAutoLayout(v3) || (objc_opt_respondsToSelector(v3, "viewForLastBaselineLayout") & 1) == 0)
  {
    uint64_t v4 = 0LL;
    goto LABEL_6;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewForLastBaselineLayout]);
  if (!v4)
  {
LABEL_6:
    double v5 = 0LL;
    goto LABEL_7;
  }

  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%p", v4));
LABEL_7:

  return v5;
}

@end