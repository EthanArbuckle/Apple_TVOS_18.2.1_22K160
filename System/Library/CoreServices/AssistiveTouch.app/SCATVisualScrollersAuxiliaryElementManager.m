@interface SCATVisualScrollersAuxiliaryElementManager
- (BOOL)_isGroupingEnabled;
- (BOOL)_showScroller:(int64_t)a3 withElement:(id)a4;
- (BOOL)containsElement:(id)a3;
- (BOOL)hasActivatedScrollSinceContextUpdate;
- (BOOL)isTopLevel;
- (BOOL)providesElements;
- (BOOL)scrollViewController:(id)a3 showHorizontalScrollerForContextElement:(id)a4;
- (BOOL)scrollViewController:(id)a3 showVerticalScrollerForContextElement:(id)a4;
- (NSArray)scrollerElements;
- (NSArray)scrollerGroups;
- (SCATVisualScrollersAuxiliaryElementManager)init;
- (SCATVisualScrollersAuxiliaryElementManager)initWithMode:(int64_t)a3;
- (id)_groupForElement:(id)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (id)scrollerElementsForContextElement;
- (id)scrollerGroupsForContextElement;
- (int64_t)mode;
- (void)dealloc;
- (void)scrollContainer:(id)a3 scrollInDirection:(int64_t)a4;
- (void)setContextElement:(id)a3;
- (void)setHasActivatedScrollSinceContextUpdate:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setScrollerElements:(id)a3;
- (void)setScrollerGroups:(id)a3;
@end

@implementation SCATVisualScrollersAuxiliaryElementManager

- (SCATVisualScrollersAuxiliaryElementManager)initWithMode:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SCATVisualScrollersAuxiliaryElementManager;
  v4 = -[SCATVisualScrollersAuxiliaryElementManager init](&v10, "init");
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v6 = objc_opt_new(&OBJC_CLASS___SCATVisualScrollersAuxiliaryElementViewController);
    -[SCATAuxiliaryElementManager setViewController:](v5, "setViewController:", v6);
    -[SCATVisualScrollersAuxiliaryElementViewController setScrollDelegate:](v6, "setScrollDelegate:", v5);
    -[SCATVisualScrollersAuxiliaryElementViewController setPositionRelativeToContextElement:]( v6,  "setPositionRelativeToContextElement:",  a3 == 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollersAuxiliaryElementViewController horizontalScroller](v6, "horizontalScroller"));
    [v7 setDelegate:v5];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollersAuxiliaryElementViewController verticalScroller](v6, "verticalScroller"));
    [v8 setDelegate:v5];
  }

  return v5;
}

- (SCATVisualScrollersAuxiliaryElementManager)init
{
  return -[SCATVisualScrollersAuxiliaryElementManager initWithMode:](self, "initWithMode:", 0LL);
}

- (void)dealloc
{
  if (-[SCATAuxiliaryElementManager isViewControllerLoaded](self, "isViewControllerLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
    [v3 setScrollDelegate:0];
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 verticalScroller]);
    [v4 setDelegate:0];

    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 horizontalScroller]);
    [v5 setDelegate:0];
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATVisualScrollersAuxiliaryElementManager;
  -[SCATVisualScrollersAuxiliaryElementManager dealloc](&v6, "dealloc");
}

- (BOOL)isTopLevel
{
  return self->_mode == 0;
}

- (NSArray)scrollerElements
{
  if (!self->_scrollerElements)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v4 verticalScroller]);
      v5 = (void *)objc_claimAutoreleasedReturnValue([v20 scrollUpView]);
      v26[0] = v5;
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 verticalScroller]);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scrollDownView]);
      v26[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 horizontalScroller]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scrollLeftView]);
      v26[2] = v9;
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v4 horizontalScroller]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 scrollRightView]);
      v26[3] = v11;
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL));
      scrollerElements = self->_scrollerElements;
      self->_scrollerElements = v12;

      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      v14 = self->_scrollerElements;
      id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          v18 = 0LL;
          do
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v21 + 1) + 8 * (void)v18) setScatAuxiliaryElementManager:self];
            v18 = (char *)v18 + 1;
          }

          while (v16 != v18);
          id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
        }

        while (v16);
      }
    }
  }

  return self->_scrollerElements;
}

- (NSArray)scrollerGroups
{
  if (!self->_scrollerGroups)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
      v5 = objc_alloc(&OBJC_CLASS___AXElementGroup);
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 verticalScroller]);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scrollUpView]);
      v48[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 verticalScroller]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scrollDownView]);
      v48[1] = v9;
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));
      v11 = -[AXElementGroup initWithElements:label:](v5, "initWithElements:label:", v10, 0LL);

      id v12 = sub_10002B014(@"ScrollUpDownContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      -[AXElementGroup setAccessibilityLabel:](v11, "setAccessibilityLabel:", v13);

      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      v14 = v11;
      id v15 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v40,  v47,  16LL);
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v41;
        do
        {
          v18 = 0LL;
          do
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v40 + 1) + 8 * (void)v18) setScatAuxiliaryElementManager:self];
            v18 = (char *)v18 + 1;
          }

          while (v16 != v18);
          id v16 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v40,  v47,  16LL);
        }

        while (v16);
      }

      -[AXElementGroup setScatAuxiliaryElementManager:](v14, "setScatAuxiliaryElementManager:", self);
      v19 = objc_alloc(&OBJC_CLASS___AXElementGroup);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v4 horizontalScroller]);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 scrollLeftView]);
      v46[0] = v21;
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 horizontalScroller]);
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 scrollRightView]);
      v46[1] = v23;
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));
      v25 = -[AXElementGroup initWithElements:label:](v19, "initWithElements:label:", v24, 0LL);

      id v26 = sub_10002B014(@"ScrollLeftRightContainer");
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      -[AXElementGroup setAccessibilityLabel:](v25, "setAccessibilityLabel:", v27);

      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      v28 = v25;
      id v29 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v36,  v45,  16LL);
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v37;
        do
        {
          v32 = 0LL;
          do
          {
            if (*(void *)v37 != v31) {
              objc_enumerationMutation(v28);
            }
            objc_msgSend( *(id *)(*((void *)&v36 + 1) + 8 * (void)v32),  "setScatAuxiliaryElementManager:",  self,  (void)v36);
            v32 = (char *)v32 + 1;
          }

          while (v30 != v32);
          id v30 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v36,  v45,  16LL);
        }

        while (v30);
      }

      -[AXElementGroup setScatAuxiliaryElementManager:](v28, "setScatAuxiliaryElementManager:", self);
      v44[0] = v14;
      v44[1] = v28;
      v33 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 2LL));
      scrollerGroups = self->_scrollerGroups;
      self->_scrollerGroups = v33;
    }
  }

  return self->_scrollerGroups;
}

- (BOOL)_isGroupingEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (BOOL)_showScroller:(int64_t)a3 withElement:(id)a4
{
  id v6 = a4;
  unsigned int v7 = -[SCATVisualScrollersAuxiliaryElementManager _isGroupingEnabled](self, "_isGroupingEnabled");
  int64_t v8 = -[SCATVisualScrollersAuxiliaryElementManager mode](self, "mode");
  int64_t v9 = v8;
  if (v7)
  {
    unint64_t v10 = (unint64_t)[v6 scatScanningBehaviorTraits];
    if (v9)
    {
      if (a3) {
        LOBYTE(v11) = v10 & 1;
      }
      else {
        BOOL v11 = (v10 & 2) != 0;
      }
    }

    else if (a3)
    {
      if ((v10 & 1) != 0 && ([v6 isGroup] & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v6 parentGroup]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 parentGroup]);
        LOBYTE(v11) = v14 == 0LL;
      }

      else
      {
        BOOL v11 = ((unint64_t)[v6 scatScanningBehaviorTraits] >> 2) & 1;
      }
    }

    else
    {
      BOOL v11 = (v10 >> 3) & 1;
    }
  }

  else if (v8)
  {
    unsigned __int8 v12 = [v6 scatScanningBehaviorTraits];
    if (a3) {
      LOBYTE(v11) = (v12 & 5) != 0LL;
    }
    else {
      LOBYTE(v11) = (v12 & 0xA) != 0LL;
    }
  }

  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (id)scrollerElementsForContextElement
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager contextElement](self, "contextElement"));
  unsigned int v25 = -[SCATVisualScrollersAuxiliaryElementManager _showScroller:withElement:]( self,  "_showScroller:withElement:",  1LL,  v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager contextElement](self, "contextElement"));
  unsigned int v5 = -[SCATVisualScrollersAuxiliaryElementManager _showScroller:withElement:]( self,  "_showScroller:withElement:",  0LL,  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
  id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 4LL));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollersAuxiliaryElementManager scrollerElements](self, "scrollerElements"));
  id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if (!v25)
        {
LABEL_9:
          if (!v5) {
            continue;
          }
          goto LABEL_13;
        }

        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 horizontalScroller]);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 scrollLeftView]);
        if (v11 == (void *)v13)
        {
        }

        else
        {
          v14 = (void *)v13;
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 horizontalScroller]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 scrollRightView]);

          if (v11 != v16) {
            goto LABEL_9;
          }
        }

        [v24 addObject:v11];
        if (!v5) {
          continue;
        }
LABEL_13:
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 verticalScroller]);
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 scrollUpView]);
        if (v11 == (void *)v18)
        {
        }

        else
        {
          v19 = (void *)v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue([v6 verticalScroller]);
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 scrollDownView]);

          if (v11 != v21) {
            continue;
          }
        }

        [v24 addObject:v11];
      }

      id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v8);
  }

  return v24;
}

- (id)scrollerGroupsForContextElement
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager contextElement](self, "contextElement"));
  unsigned int v4 = -[SCATVisualScrollersAuxiliaryElementManager _showScroller:withElement:]( self,  "_showScroller:withElement:",  1LL,  v3);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager contextElement](self, "contextElement"));
  unsigned int v6 = -[SCATVisualScrollersAuxiliaryElementManager _showScroller:withElement:]( self,  "_showScroller:withElement:",  0LL,  v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager viewController](self, "viewController"));
  id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollersAuxiliaryElementManager scrollerGroups](self, "scrollerGroups"));
  id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      BOOL v11 = 0LL;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v11);
        if (v4)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 horizontalScroller]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 scrollLeftView]);
          unsigned int v15 = [v12 containsObject:v14];

          if (v15) {
            [v20 addObject:v12];
          }
        }

        if (v6)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 verticalScroller]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 scrollUpView]);
          unsigned int v18 = [v12 containsObject:v17];

          if (v18) {
            [v20 addObject:v12];
          }
        }

        BOOL v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v9);
  }

  return v20;
}

- (id)_groupForElement:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATVisualScrollersAuxiliaryElementManager scrollerGroupsForContextElement]( self,  "scrollerGroupsForContextElement"));
  if ([v5 containsObject:v4])
  {
    id v6 = v5;
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned __int8 v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          if (objc_msgSend(v12, "isGroup", (void)v14)
            && ([v12 containsObject:v4] & 1) != 0)
          {
            id v6 = v12;

            goto LABEL_14;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v6 = 0LL;
  }

- (void)setContextElement:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SCATVisualScrollersAuxiliaryElementManager;
  -[SCATAuxiliaryElementManager setContextElement:](&v15, "setContextElement:", v4);
  -[SCATVisualScrollersAuxiliaryElementManager setHasActivatedScrollSinceContextUpdate:]( self,  "setHasActivatedScrollSinceContextUpdate:",  0LL);
  if ((id)-[SCATVisualScrollersAuxiliaryElementManager mode](self, "mode") == (id)1)
  {
    unsigned int v5 = [v4 isGroup];
    if (!v4 || v5)
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollersAuxiliaryElementManager scrollerGroups](self, "scrollerGroups", 0LL));
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0LL;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setParentGroup:v4];
            uint64_t v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }

        while (v8);
      }
    }
  }
}

- (BOOL)providesElements
{
  return 1;
}

- (id)firstElementWithOptions:(int *)a3
{
  if (-[SCATVisualScrollersAuxiliaryElementManager _isGroupingEnabled](self, "_isGroupingEnabled", a3)) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATVisualScrollersAuxiliaryElementManager scrollerGroupsForContextElement]( self,  "scrollerGroupsForContextElement"));
  }
  else {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATVisualScrollersAuxiliaryElementManager scrollerElementsForContextElement]( self,  "scrollerElementsForContextElement"));
  }
  unsigned int v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  return v6;
}

- (id)lastElementWithOptions:(int *)a3
{
  if (-[SCATVisualScrollersAuxiliaryElementManager _isGroupingEnabled](self, "_isGroupingEnabled", a3)) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATVisualScrollersAuxiliaryElementManager scrollerGroupsForContextElement]( self,  "scrollerGroupsForContextElement"));
  }
  else {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATVisualScrollersAuxiliaryElementManager scrollerElementsForContextElement]( self,  "scrollerElementsForContextElement"));
  }
  unsigned int v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

  return v6;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  if (-[SCATVisualScrollersAuxiliaryElementManager _isGroupingEnabled](self, "_isGroupingEnabled")) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollersAuxiliaryElementManager _groupForElement:](self, "_groupForElement:", v7));
  }
  else {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATVisualScrollersAuxiliaryElementManager scrollerElementsForContextElement]( self,  "scrollerElementsForContextElement"));
  }
  uint64_t v9 = v8;
  if (v8 && (uint64_t v10 = (char *)[v8 indexOfObject:v7], v10 != (char *)0x7FFFFFFFFFFFFFFFLL))
  {
    __int128 v14 = v10;
    objc_super v15 = (char *)[v9 count];
    BOOL v12 = v14 == 0LL;
    if (v14) {
      __int128 v16 = v14;
    }
    else {
      __int128 v16 = v15;
    }
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v16 - 1]);
    if (a4) {
      goto LABEL_7;
    }
  }

  else
  {
    __int128 v11 = 0LL;
    BOOL v12 = 0;
    if (a4) {
LABEL_7:
    }
      *a4 = v12;
  }

  return v11;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  if (-[SCATVisualScrollersAuxiliaryElementManager _isGroupingEnabled](self, "_isGroupingEnabled")) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollersAuxiliaryElementManager _groupForElement:](self, "_groupForElement:", v7));
  }
  else {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATVisualScrollersAuxiliaryElementManager scrollerElementsForContextElement]( self,  "scrollerElementsForContextElement"));
  }
  uint64_t v9 = v8;
  uint64_t v10 = (char *)[v8 indexOfObject:v7];

  if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    __int128 v11 = 0LL;
    BOOL v12 = 0;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  __int128 v13 = (char *)[v9 count] - 1;
  BOOL v12 = v10 == v13;
  if (v10 == v13) {
    __int128 v14 = 0LL;
  }
  else {
    __int128 v14 = v10 + 1;
  }
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v14]);
  if (a4) {
LABEL_11:
  }
    *a4 = v12;
LABEL_12:

  return v11;
}

- (BOOL)containsElement:(id)a3
{
  id v4 = a3;
  if (-[SCATVisualScrollersAuxiliaryElementManager _isGroupingEnabled](self, "_isGroupingEnabled"))
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollersAuxiliaryElementManager scrollerGroups](self, "scrollerGroups", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) containsObject:v4])
          {

            unsigned __int8 v10 = 1;
            goto LABEL_13;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    unsigned __int8 v10 = 0;
  }

  else
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollersAuxiliaryElementManager scrollerElements](self, "scrollerElements"));
    unsigned __int8 v10 = [v11 containsObject:v4];
  }

- (void)scrollContainer:(id)a3 scrollInDirection:(int64_t)a4
{
  unsigned __int8 v6 = -[SCATVisualScrollersAuxiliaryElementManager hasActivatedScrollSinceContextUpdate]( self,  "hasActivatedScrollSinceContextUpdate",  a3);
  -[SCATVisualScrollersAuxiliaryElementManager setHasActivatedScrollSinceContextUpdate:]( self,  "setHasActivatedScrollSinceContextUpdate:",  1LL);
  if ((unint64_t)a4 > 3)
  {
    uint64_t v7 = 0LL;
    if ((v6 & 1) != 0)
    {
LABEL_10:
      (*(void (**)(uint64_t))(v7 + 16))(v7);
      return;
    }
  }

  else
  {
    uint64_t v7 = (uint64_t)*(&off_100124118 + a4);
    if ((v6 & 1) != 0) {
      goto LABEL_10;
    }
  }

  if (!-[SCATVisualScrollersAuxiliaryElementManager mode](self, "mode")) {
    goto LABEL_10;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager contextElement](self, "contextElement"));
  unsigned __int8 v9 = [v8 isGroup];

  if ((v9 & 1) == 0)
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATVisualScrollersAuxiliaryElementManager.m",  443LL,  "-[SCATVisualScrollersAuxiliaryElementManager scrollContainer:scrollInDirection:]",  @"Suspicious, tried to scroll with a non-group context element");
    goto LABEL_10;
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SCATAuxiliaryElementManager contextElement](self, "contextElement"));
  if ([v12 containsNativeFocusElement])
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }

  else
  {
    switch(a4)
    {
      case 0LL:
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v12 topMostLeafAXElement]);
        goto LABEL_17;
      case 1LL:
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v12 bottomMostLeafAXElement]);
        goto LABEL_17;
      case 2LL:
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v12 leftMostLeafAXElement]);
        goto LABEL_17;
      case 3LL:
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v12 rightMostLeafAXElement]);
LABEL_17:
        __int128 v11 = (void *)v10;
        break;
      default:
        __int128 v11 = 0LL;
        break;
    }

    [v11 setNativeFocus];
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
}

- (BOOL)scrollViewController:(id)a3 showHorizontalScrollerForContextElement:(id)a4
{
  return -[SCATVisualScrollersAuxiliaryElementManager _showScroller:withElement:]( self,  "_showScroller:withElement:",  1LL,  a4);
}

- (BOOL)scrollViewController:(id)a3 showVerticalScrollerForContextElement:(id)a4
{
  return -[SCATVisualScrollersAuxiliaryElementManager _showScroller:withElement:]( self,  "_showScroller:withElement:",  0LL,  a4);
}

- (void)setScrollerElements:(id)a3
{
}

- (void)setScrollerGroups:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)hasActivatedScrollSinceContextUpdate
{
  return self->_hasActivatedScrollSinceContextUpdate;
}

- (void)setHasActivatedScrollSinceContextUpdate:(BOOL)a3
{
  self->_hasActivatedScrollSinceContextUpdate = a3;
}

- (void).cxx_destruct
{
}

@end