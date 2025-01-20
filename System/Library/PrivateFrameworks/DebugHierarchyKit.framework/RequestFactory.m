@interface RequestFactory
+ (id)_crossPlatformPropertyActions;
+ (id)_effectViewClassNames;
+ (id)_propertyActionsForMac;
+ (id)_propertyActionsForMacCatalyst;
+ (id)_propertyActionsForPlatform:(id)a3;
+ (id)_propertyActionsForTvOS;
+ (id)_propertyActionsForWatchOS;
+ (id)_propertyActionsForiOS;
+ (id)_requestForEncodedLayersWithSnapshot:(id)a3;
+ (id)_requestForEncodedSceneKitScenesWithSnapshot:(id)a3;
+ (id)_requestForRenderedEffectViewsWithSnapshot:(id)a3;
+ (id)_requestForRenderedMultiLayerViewsWithSnapshot:(id)a3;
+ (id)_requestForRenderedSpriteKitTexturesWithSnapshot:(id)a3;
+ (id)_requestForRenderedViewsWithSnapshot:(id)a3;
+ (id)additionalRequestsWithSnapshot:(id)a3;
+ (id)initialRequestForPlatform:(id)a3;
+ (id)requestForRemainingLazyPropertiesWithSnapshot:(id)a3;
@end

@implementation RequestFactory

+ (id)initialRequestForPlatform:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _crossPlatformPropertyActions]);
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _propertyActionsForPlatform:v4]);
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithName:discoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithName:discoveryType:actions:completion:",  @"Initial request",  1LL,  v5,  0LL));
  return v8;
}

+ (id)additionalRequestsWithSnapshot:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _requestForEncodedLayersWithSnapshot:v4]);
  if (v6) {
    -[NSMutableArray addObject:](v5, "addObject:", v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _requestForRenderedEffectViewsWithSnapshot:v4]);

  if (v7) {
    -[NSMutableArray addObject:](v5, "addObject:", v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _requestForRenderedMultiLayerViewsWithSnapshot:v4]);

  if (v8) {
    -[NSMutableArray addObject:](v5, "addObject:", v8);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _requestForRenderedViewsWithSnapshot:v4]);

  if (v9) {
    -[NSMutableArray addObject:](v5, "addObject:", v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _requestForRenderedSpriteKitTexturesWithSnapshot:v4]);

  if (v10) {
    -[NSMutableArray addObject:](v5, "addObject:", v10);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _requestForEncodedSceneKitScenesWithSnapshot:v4]);

  if (v11) {
    -[NSMutableArray addObject:](v5, "addObject:", v11);
  }

  return v5;
}

+ (id)requestForRemainingLazyPropertiesWithSnapshot:(id)a3
{
  id v3 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v3 setPropertyNames:&off_29C78 exlusive:1];
  id v7 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithName:discoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithName:discoveryType:actions:completion:",  @"Fetch remaining lazy properties",  2LL,  v4,  0LL));

  [v5 setTimeout:180.0];
  return v5;
}

+ (id)_requestForEncodedLayersWithSnapshot:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"groupingIdentifier == 'com.apple.QuartzCore.CALayer'"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 rootLevelSnapshotGroups]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects", 0));
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)v13) identifier]);
        [v8 addObject:v14];

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v11);
  }

  if ([v8 count])
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
    id v16 = [v8 copy];
    [v15 setObjectIdentifiers:v16 exlusive:0];

    [v15 setPropertyNames:&off_29C90 exlusive:0];
    id v24 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithName:discoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithName:discoveryType:actions:completion:",  @"Fetch encoded layers",  2LL,  v17,  0LL));
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

+ (id)_requestForRenderedEffectViewsWithSnapshot:(id)a3
{
  id v25 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _effectViewClassNames]);
  if ([v4 count])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v23 = v4;
    id obj = v4;
    id v6 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = (void *)objc_claimAutoreleasedReturnValue( [v25 nodesKindOfRuntimeClass:*(void *)(*((void *)&v30 + 1) + 8 * (void)i)]);
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          id v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v27;
            do
            {
              for (j = 0LL; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v27 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
                if ([v15 hasPropertyWithName:@"snapshotImageRenderedUsingDrawHierarchyInRect"])
                {
                  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
                  [v5 addObject:v16];
                }
              }

              id v12 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
            }

            while (v12);
          }
        }

        id v7 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }

      while (v7);
    }

    if ([v5 count])
    {
      id v17 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
      id v18 = [v5 copy];
      [v17 setObjectIdentifiers:v18 exlusive:0];

      [v17 setPropertyNames:&off_29CA8 exlusive:0];
      id v19 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyRunLoopAction);
      v34[0] = v17;
      v34[1] = v19;
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithName:discoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithName:discoveryType:actions:completion:",  @"Fetch rendered effect view snapshots",  2LL,  v20,  0LL));
    }

    else
    {
      __int128 v21 = 0LL;
    }

    id v4 = v23;
  }

  else
  {
    __int128 v21 = 0LL;
  }

  return v21;
}

+ (id)_requestForRenderedMultiLayerViewsWithSnapshot:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithBlock:]( &OBJC_CLASS___NSPredicate,  "predicateWithBlock:",  &__block_literal_global_0));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 nodesMatchingPredicate:v5]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (objc_msgSend( v12,  "hasPropertyWithName:",  @"snapshotImageRenderedUsingDrawHierarchyInRect",  (void)v20))
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
          [v4 addObject:v13];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v9);
  }

  if ([v4 count])
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
    id v15 = [v4 copy];
    [v14 setObjectIdentifiers:v15 exlusive:0];

    [v14 setPropertyNames:&off_29CC0 exlusive:0];
    id v16 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyRunLoopAction);
    v24[0] = v14;
    v24[1] = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithName:discoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithName:discoveryType:actions:completion:",  @"Fetch rendered multi-layer view snapshots",  2LL,  v17,  0LL));
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

BOOL __65__RequestFactory__requestForRenderedMultiLayerViewsWithSnapshot___block_invoke( id a1,  DBGSnapshotNode *a2,  NSDictionary *a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode propertyWithName:](a2, "propertyWithName:", @"dbgRenderingModeIsMultiLayer"));
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (id)_requestForRenderedViewsWithSnapshot:(id)a3
{
  id v4 = a3;
  v45 = (void *)objc_claimAutoreleasedReturnValue([a1 _effectViewClassNames]);
  v42 = v4;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifierToNodeMap]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectEnumerator]);

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!v7) {
    goto LABEL_43;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v51;
  do
  {
    uint64_t v10 = 0LL;
    do
    {
      if (*(void *)v51 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 runtimeType]);
      if ([v12 isKindOfTypeWithName:@"UIView"])
      {
      }

      else
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 runtimeType]);
        unsigned int v14 = [v13 isKindOfTypeWithName:@"NSView"];

        if (!v14) {
          goto LABEL_36;
        }
      }

      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id v15 = v45;
      id v16 = [v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v47;
        while (2)
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v47 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v11 runtimeType]);
            LOBYTE(v20) = [v21 isKindOfTypeWithName:v20];

            if ((v20 & 1) != 0)
            {
              BOOL v22 = 0;
              goto LABEL_25;
            }
          }

          id v17 = [v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v15 = (id)objc_claimAutoreleasedReturnValue([v11 runtimeType]);
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v11 runtimeType]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 runtimeType]);
      if ([v24 isKindOfTypeWithName:@"GLKView"])
      {

LABEL_23:
        BOOL v22 = 1;
LABEL_24:

        goto LABEL_25;
      }

      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v11 runtimeType]);
      unsigned __int8 v34 = [v33 isKindOfTypeWithName:@"ARView"];

      if ((v34 & 1) == 0)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v11 groupWithID:@"com.apple.QuartzCore.CALayer"]);
        id v15 = v35;
        if (v35)
        {
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v35 allObjects]);
          BOOL v22 = [v23 count] == 0;
          goto LABEL_24;
        }

+ (id)_requestForRenderedSpriteKitTexturesWithSnapshot:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 nodesKindOfRuntimeClass:@"SKNode"]);
  if ([v3 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if (objc_msgSend(v10, "hasPropertyWithName:", @"visualRepresentation", (void)v17))
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
            [v4 addObject:v11];
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v7);
    }

    if ([v4 count])
    {
      id v12 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
      id v13 = [v4 copy];
      [v12 setObjectIdentifiers:v13 exlusive:0];

      [v12 setPropertyNames:&off_29CF0 exlusive:0];
      id v21 = v12;
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithName:discoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithName:discoveryType:actions:completion:",  @"Fetch visual representations of sprites",  2LL,  v14,  0LL));
    }

    else
    {
      id v15 = 0LL;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

+ (id)_requestForEncodedSceneKitScenesWithSnapshot:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nodesKindOfRuntimeClass:@"SCNScene"]);
  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          if ([v11 hasPropertyWithName:@"encodedPresentationScene"])
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
            [v5 addObject:v12];
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v8);
    }

    if ([v5 count])
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
      id v14 = [v5 copy];
      [v13 setObjectIdentifiers:v14 exlusive:0];

      [v13 setPropertyNames:&off_29D08 exlusive:0];
      id v15 = (void *)objc_claimAutoreleasedReturnValue([&__NSArray0__struct arrayByAddingObject:v13]);
    }

    else
    {
      id v15 = &__NSArray0__struct;
    }
  }

  else
  {
    id v15 = &__NSArray0__struct;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 nodesKindOfRuntimeClass:@"SCNView"]);
  if ([v16 count])
  {
    __int128 v30 = v4;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v18 = v16;
    id v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (j = 0LL; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          __int128 v23 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
          if ([v23 hasPropertyWithName:@"pointOfViewIndexPath"])
          {
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
            [v17 addObject:v24];
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }

      while (v20);
    }

    if ([v17 count])
    {
      id v25 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
      id v26 = [v17 copy];
      [v25 setObjectIdentifiers:v26 exlusive:0];

      [v25 setPropertyNames:&off_29D20 exlusive:0];
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v15 arrayByAddingObject:v25]);

      id v15 = (void *)v27;
    }

    id v4 = v30;
  }

  if ([v15 count]) {
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithName:discoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithName:discoveryType:actions:completion:",  @"Fetch encoded SCNScenes",  2LL,  v15,  0LL));
  }
  else {
    unsigned int v28 = 0LL;
  }

  return v28;
}

+ (id)_crossPlatformPropertyActions
{
  id v2 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v2 setPropertyNames:&off_29D38 exlusive:0];
  id v3 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v3 setTypes:&off_29D50 exlusive:0];
  [v3 setPropertyNames:&off_29D68 exlusive:0];
  id v4 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v4 setTypes:&off_29D80 exlusive:0];
  [v4 setPropertyNames:&off_29D98 exlusive:0];
  id v5 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v5 setTypes:&off_29DB0 exlusive:0];
  [v5 setPropertyNames:&off_29DC8 exlusive:0];
  id v6 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v6 setTypes:&off_29DE0 exlusive:0];
  [v6 setPropertyNames:&off_29DF8 exlusive:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 5LL));

  return v7;
}

+ (id)_propertyActionsForPlatform:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Mac"])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([a1 _propertyActionsForMac]);
  }

  else if ([v4 isEqualToString:@"MacCatalyst"])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([a1 _propertyActionsForMacCatalyst]);
  }

  else if ([v4 isEqualToString:@"iOS"])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([a1 _propertyActionsForiOS]);
  }

  else if ([v4 isEqualToString:@"watchOS"])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([a1 _propertyActionsForWatchOS]);
  }

  else
  {
    if (![v4 isEqualToString:@"tvOS"])
    {
      id v6 = 0LL;
      goto LABEL_12;
    }

    uint64_t v5 = objc_claimAutoreleasedReturnValue([a1 _propertyActionsForTvOS]);
  }

  id v6 = (void *)v5;
LABEL_12:

  return v6;
}

+ (id)_propertyActionsForMac
{
  id v2 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v2 setTypes:&off_29E10 exlusive:0];
  [v2 setPropertyNames:&off_29E28 exlusive:0];
  id v3 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v3 setTypes:&off_29E40 exlusive:0];
  [v3 setPropertyNames:&off_29E58 exlusive:0];
  id v4 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v4 setTypes:&off_29E70 exlusive:0];
  [v4 setPropertyNames:&off_29E88 exlusive:0];
  id v5 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v5 setTypes:&off_29EA0 exlusive:0];
  [v5 setPropertyNames:&off_29EB8 exlusive:0];
  id v6 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v6 setTypes:&off_29ED0 exlusive:0];
  [v6 setPropertyNames:&off_29EE8 exlusive:0];
  id v7 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v7 setTypes:&off_29F00 exlusive:0];
  [v7 setPropertyNames:&off_29F18 exlusive:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 6LL));

  return v8;
}

+ (id)_propertyActionsForMacCatalyst
{
  id v2 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v2 setTypes:&off_29F30 exlusive:0];
  [v2 setPropertyNames:&off_29F48 exlusive:0];
  id v3 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v3 setTypes:&off_29F60 exlusive:0];
  [v3 setPropertyNames:&off_29F78 exlusive:0];
  id v4 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v4 setTypes:&off_29F90 exlusive:0];
  [v4 setPropertyNames:&off_29FA8 exlusive:0];
  id v5 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v5 setTypes:&off_29FC0 exlusive:0];
  [v5 setPropertyNames:&off_29FD8 exlusive:0];
  id v6 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v6 setTypes:&off_29FF0 exlusive:0];
  [v6 setPropertyNames:&off_2A008 exlusive:0];
  id v7 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v7 setTypes:&off_2A020 exlusive:0];
  [v7 setPropertyNames:&off_2A038 exlusive:0];
  id v8 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v8 setTypes:&off_2A050 exlusive:0];
  [v8 setPropertyNames:&off_2A068 exlusive:0];
  id v9 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v9 setTypes:&off_2A080 exlusive:0];
  [v9 setPropertyNames:&off_2A098 exlusive:0];
  id v10 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v10 setTypes:&off_2A0B0 exlusive:0];
  [v10 setPropertyNames:&off_2A0C8 exlusive:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 9LL));

  return v11;
}

+ (id)_propertyActionsForiOS
{
  id v2 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v2 setTypes:&off_2A0E0 exlusive:0];
  [v2 setPropertyNames:&off_2A0F8 exlusive:0];
  id v3 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v3 setTypes:&off_2A110 exlusive:0];
  [v3 setPropertyNames:&off_2A128 exlusive:0];
  id v4 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v4 setTypes:&off_2A140 exlusive:0];
  [v4 setPropertyNames:&off_2A158 exlusive:0];
  id v5 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v5 setTypes:&off_2A170 exlusive:0];
  [v5 setPropertyNames:&off_2A188 exlusive:0];
  id v6 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v6 setTypes:&off_2A1A0 exlusive:0];
  [v6 setPropertyNames:&off_2A1B8 exlusive:0];
  id v7 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v7 setTypes:&off_2A1D0 exlusive:0];
  [v7 setPropertyNames:&off_2A1E8 exlusive:0];
  id v8 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v8 setTypes:&off_2A200 exlusive:0];
  [v8 setPropertyNames:&off_2A218 exlusive:0];
  id v9 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v9 setTypes:&off_2A230 exlusive:0];
  [v9 setPropertyNames:&off_2A248 exlusive:0];
  id v10 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v10 setTypes:&off_2A260 exlusive:0];
  [v10 setPropertyNames:&off_2A278 exlusive:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 9LL));

  return v11;
}

+ (id)_propertyActionsForWatchOS
{
  id v2 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v2 setTypes:&off_2A290 exlusive:0];
  [v2 setPropertyNames:&off_2A2A8 exlusive:0];
  id v3 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v3 setTypes:&off_2A2C0 exlusive:0];
  [v3 setPropertyNames:&off_2A2D8 exlusive:0];
  id v4 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v4 setTypes:&off_2A2F0 exlusive:0];
  [v4 setPropertyNames:&off_2A308 exlusive:0];
  id v5 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v5 setTypes:&off_2A320 exlusive:0];
  [v5 setPropertyNames:&off_2A338 exlusive:0];
  id v6 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v6 setTypes:&off_2A350 exlusive:0];
  [v6 setPropertyNames:&off_2A368 exlusive:0];
  id v7 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v7 setTypes:&off_2A380 exlusive:0];
  [v7 setPropertyNames:&off_2A398 exlusive:0];
  id v8 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v8 setTypes:&off_2A3B0 exlusive:0];
  [v8 setPropertyNames:&off_2A3C8 exlusive:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 7LL));

  return v9;
}

+ (id)_propertyActionsForTvOS
{
  id v2 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v2 setTypes:&off_2A3E0 exlusive:0];
  [v2 setPropertyNames:&off_2A3F8 exlusive:0];
  id v3 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v3 setTypes:&off_2A410 exlusive:0];
  [v3 setPropertyNames:&off_2A428 exlusive:0];
  id v4 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v4 setTypes:&off_2A440 exlusive:0];
  [v4 setPropertyNames:&off_2A458 exlusive:0];
  id v5 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v5 setTypes:&off_2A470 exlusive:0];
  [v5 setPropertyNames:&off_2A488 exlusive:0];
  id v6 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v6 setTypes:&off_2A4A0 exlusive:0];
  [v6 setPropertyNames:&off_2A4B8 exlusive:0];
  id v7 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v7 setTypes:&off_2A4D0 exlusive:0];
  [v7 setPropertyNames:&off_2A4E8 exlusive:0];
  id v8 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyPropertyAction);
  [v8 setTypes:&off_2A500 exlusive:0];
  [v8 setPropertyNames:&off_2A518 exlusive:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 7LL));

  return v9;
}

+ (id)_effectViewClassNames
{
  return &off_2A530;
}

@end