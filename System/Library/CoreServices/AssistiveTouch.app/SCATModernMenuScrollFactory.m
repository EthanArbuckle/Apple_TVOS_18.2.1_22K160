@interface SCATModernMenuScrollFactory
+ (id)_fallbackAncestorForAutoscrollForMenu:(id)a3;
+ (id)_fallbackAncestorForScrollToTopForMenu:(id)a3;
+ (id)_menuItemDetailsForScrollAction:(int)a3;
+ (id)menuItemForScrollAction:(int)a3 withDelegate:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
+ (void)_performFallbackScrollAncestorAction:(int)a3 withMenu:(id)a4;
+ (void)_performScrollAction:(int)a3 withMenu:(id)a4;
@end

@implementation SCATModernMenuScrollFactory

+ (id)menuItemForScrollAction:(int)a3 withDelegate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemDetailsForScrollAction:v4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 menu]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 menuItemWithItemDictionary:v7 menu:v8 delegate:v6]);

  return v9;
}

+ (id)_menuItemDetailsForScrollAction:(int)a3
{
  switch(a3)
  {
    case 2006:
      v38[0] = @"action_scrollDown";
      v37[0] = @"identifier";
      v37[1] = @"title";
      id v3 = sub_10002B014(@"Scroll-Down");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      v37[2] = @"activateBehavior";
      v38[1] = v4;
      v38[2] = &off_10012FB50;
      v5 = v38;
      id v6 = v37;
      goto LABEL_18;
    case 2007:
      v36[0] = @"action_scrollUp";
      v35[0] = @"identifier";
      v35[1] = @"title";
      id v9 = sub_10002B014(@"Scroll-Up");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v35[2] = @"activateBehavior";
      v36[1] = v4;
      v36[2] = &off_10012FB50;
      v5 = v36;
      id v6 = v35;
      goto LABEL_18;
    case 2008:
      v34[0] = @"action_scrollLeft";
      v33[0] = @"identifier";
      v33[1] = @"title";
      id v10 = sub_10002B014(@"Scroll-Left");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v33[2] = @"activateBehavior";
      v34[1] = v4;
      v34[2] = &off_10012FB50;
      v5 = v34;
      id v6 = v33;
      goto LABEL_18;
    case 2009:
      v32[0] = @"action_scrollRight";
      v31[0] = @"identifier";
      v31[1] = @"title";
      id v11 = sub_10002B014(@"Scroll-Right");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v31[2] = @"activateBehavior";
      v32[1] = v4;
      v32[2] = &off_10012FB50;
      v5 = v32;
      id v6 = v31;
      goto LABEL_18;
    case 2010:
    case 2011:
    case 2012:
    case 2013:
    case 2014:
    case 2015:
    case 2016:
    case 2017:
    case 2018:
      goto LABEL_6;
    case 2019:
      v30[0] = @"action_scrollNext";
      v29[0] = @"identifier";
      v29[1] = @"title";
      id v12 = sub_10002B014(@"Scroll-Next");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v30[1] = v4;
      v29[2] = @"imageName";
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
      unsigned int v14 = [v13 applicationIsRTL];
      v15 = @"SCATIcon_action_scrollRight";
      if (v14) {
        v15 = @"SCATIcon_action_scrollLeft";
      }
      v29[3] = @"activateBehavior";
      v30[2] = v15;
      v30[3] = &off_10012FB68;
      v16 = v30;
      v17 = v29;
      goto LABEL_16;
    case 2020:
      v28[0] = @"action_scrollPrevious";
      v27[0] = @"identifier";
      v27[1] = @"title";
      id v18 = sub_10002B014(@"Scroll-Next");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v28[1] = v4;
      v27[2] = @"imageName";
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
      unsigned int v19 = [v13 applicationIsRTL];
      v20 = @"SCATIcon_action_scrollLeft";
      if (v19) {
        v20 = @"SCATIcon_action_scrollRight";
      }
      v27[3] = @"activateBehavior";
      v28[2] = v20;
      v28[3] = &off_10012FB68;
      v16 = v28;
      v17 = v27;
LABEL_16:
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v17,  4LL));

      goto LABEL_19;
    default:
      if (a3 == 2030)
      {
        v26[0] = @"action_scrollToTop";
        v25[0] = @"identifier";
        v25[1] = @"title";
        id v22 = sub_10002B014(@"SCROLL_TOP");
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v25[2] = @"activateBehavior";
        v26[1] = v4;
        v26[2] = &off_10012FB80;
        v5 = v26;
        id v6 = v25;
      }

      else
      {
        if (a3 != 2031)
        {
LABEL_6:
          _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATModernMenuScrollFactory.m",  70LL,  "+[SCATModernMenuScrollFactory _menuItemDetailsForScrollAction:]",  @"Unhandled scroll action");
          return 0LL;
        }

        v24[0] = @"action_autoscroll";
        v23[0] = @"identifier";
        v23[1] = @"title";
        id v7 = sub_10002B014(@"Scroll-Auto");
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v23[2] = @"activateBehavior";
        v24[1] = v4;
        v24[2] = &off_10012FB68;
        v5 = v24;
        id v6 = v23;
      }

+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v28 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"identifier"]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"title"]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"imageName"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"activateBehavior"]);
  id v26 = [v9 unsignedIntegerValue];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"guidedAccess"]);
  id v11 = v10;
  if (v10) {
    unsigned int v12 = [v10 BOOLValue];
  }
  else {
    unsigned int v12 = 1;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"assistiveAccess"]);
  unsigned int v14 = v13;
  unsigned int v25 = v12;
  if (v13) {
    LOBYTE(v12) = [v13 BOOLValue];
  }
  if ([v8 isEqualToString:@"action_scrollUp"])
  {
    v35 = _NSConcreteStackBlock;
    v15 = (void **)sub_100096880;
    v16 = &v35;
  }

  else if ([v8 isEqualToString:@"action_scrollDown"])
  {
    v34 = _NSConcreteStackBlock;
    v15 = (void **)sub_100096890;
    v16 = &v34;
  }

  else if ([v8 isEqualToString:@"action_scrollLeft"])
  {
    v33 = _NSConcreteStackBlock;
    v15 = (void **)sub_1000968A0;
    v16 = &v33;
  }

  else if ([v8 isEqualToString:@"action_scrollRight"])
  {
    v32 = _NSConcreteStackBlock;
    v15 = (void **)sub_1000968B0;
    v16 = &v32;
  }

  else
  {
    if ([v8 isEqualToString:@"action_scrollNext"])
    {
      id v18 = &stru_100124970;
      goto LABEL_15;
    }

    if ([v8 isEqualToString:@"action_scrollPrevious"])
    {
      id v18 = &stru_100124990;
      goto LABEL_15;
    }

    if ([v8 isEqualToString:@"action_scrollToTop"])
    {
      v31 = _NSConcreteStackBlock;
      v15 = (void **)sub_100096958;
      v16 = &v31;
    }

    else
    {
      if (![v8 isEqualToString:@"action_autoscroll"])
      {
        id v18 = 0LL;
        goto LABEL_15;
      }

      v30 = _NSConcreteStackBlock;
      v15 = (void **)sub_100096A70;
      v16 = &v30;
    }
  }

  v16[1] = (void **)3221225472LL;
  v16[2] = v15;
  v16[3] = (void **)&unk_100123D48;
  v16[4] = (void **)a1;
  id v18 = objc_retainBlock(v16);
LABEL_15:
  *(void *)&double v19 = objc_opt_class(a1, v17).n128_u64[0];
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "updateBlockForIdentifier:", v8, v19));
  LOBYTE(v24) = v12;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:activateHandler:updateHandler:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssi stiveAccess:activateHandler:updateHandler:",  v8,  v28,  v29,  v27,  v26,  v25,  v24,  v18,  v21));

  return v22;
}

+ (id)updateBlockForIdentifier:(id)a3
{
  return &stru_1001249D0;
}

+ (id)_fallbackAncestorForScrollToTopForMenu:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fallbackScrollUpAncestor]);
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v3 fallbackScrollDownAncestor]);
  }
  id v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement elementWithUIElement:](&OBJC_CLASS___AXElement, "elementWithUIElement:", v7));
  return v8;
}

+ (id)_fallbackAncestorForAutoscrollForMenu:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fallbackScrollDownAncestor]);
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v3 fallbackScrollUpAncestor]);
  }
  id v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement elementWithUIElement:](&OBJC_CLASS___AXElement, "elementWithUIElement:", v7));
  return v8;
}

+ (void)_performFallbackScrollAncestorAction:(int)a3 withMenu:(id)a4
{
  id v17 = a4;
  switch(a3)
  {
    case 2006:
      v5 = (void *)objc_claimAutoreleasedReturnValue([v17 fallbackScrollDownAncestor]);
      unsigned __int8 v6 = [v5 performAXAction:2006];

      id v7 = v17;
      if ((v6 & 1) == 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v17 fallbackScrollUpAncestor]);
        id v9 = v8;
        uint64_t v10 = 2006LL;
        goto LABEL_11;
      }

      break;
    case 2007:
      v15 = (void *)objc_claimAutoreleasedReturnValue([v17 fallbackScrollUpAncestor]);
      unsigned __int8 v16 = [v15 performAXAction:2007];

      id v7 = v17;
      if ((v16 & 1) == 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v17 fallbackScrollDownAncestor]);
        id v9 = v8;
        uint64_t v10 = 2007LL;
        goto LABEL_11;
      }

      break;
    case 2008:
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 fallbackScrollLeftAncestor]);
      unsigned __int8 v12 = [v11 performAXAction:2008];

      id v7 = v17;
      if ((v12 & 1) == 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v17 fallbackScrollRightAncestor]);
        id v9 = v8;
        uint64_t v10 = 2008LL;
        goto LABEL_11;
      }

      break;
    case 2009:
      v13 = (void *)objc_claimAutoreleasedReturnValue([v17 fallbackScrollRightAncestor]);
      unsigned __int8 v14 = [v13 performAXAction:2009];

      id v7 = v17;
      if ((v14 & 1) == 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v17 fallbackScrollLeftAncestor]);
        id v9 = v8;
        uint64_t v10 = 2009LL;
LABEL_11:
        [v8 performAXAction:v10];

        goto LABEL_12;
      }

      break;
    default:
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATModernMenuScrollFactory.m",  232LL,  "+[SCATModernMenuScrollFactory _performFallbackScrollAncestorAction:withMenu:]",  @"Unhandled scroll action %i");
LABEL_12:
      id v7 = v17;
      break;
  }
}

+ (void)_performScrollAction:(int)a3 withMenu:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scrollableElement]);

  if (v8)
  {
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    id v18 = 0LL;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scrollViewsForAction:v4 elementsToScroll:&v18]);
    id v11 = v18;

    if ([v11 count] == (id)1)
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
      [v12 performAction:v4];
    }

    else if ((unint64_t)[v10 count] < 2)
    {
      _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Tried to perform scroll action %i that had no scroll views.");
    }

    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100096FC0;
      v13[3] = &unk_100122848;
      id v14 = v6;
      id v15 = v10;
      id v16 = v11;
      int v17 = v4;
      [v14 hideWithCompletion:v13];
    }
  }
}

@end