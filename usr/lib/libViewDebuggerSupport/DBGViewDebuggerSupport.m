@interface DBGViewDebuggerSupport
+ (BOOL)_layerShouldSupersedeSnapshot:(id)a3;
+ (BOOL)_shouldEncodeLayers;
+ (BOOL)isHiddenForWindow:(id)a3;
+ (BOOL)isViewSubclass:(id)a3;
+ (BOOL)isWindowSubclass:(id)a3;
+ (double)firstBaselineOffsetFromTopForView:(id)a3;
+ (double)lastBaselineOffsetFromBottomForView:(id)a3;
+ (double)screenBackingScaleForView:(id)a3;
+ (double)screenBackingScaleForWindow:(id)a3;
+ (id)_arrayEncodedIndexPath:(id)a3;
+ (id)_collectSubviewInfoForView:(id)a3 encodeLayers:(BOOL)a4;
+ (id)_layerInfo:(id)a3 view:(id)a4;
+ (id)additionalRootLevelViewsToArchive;
+ (id)appWindows;
+ (id)classMap;
+ (id)collectViewInfo:(id)a3;
+ (id)displayNameForView:(id)a3;
+ (id)fetchViewHierarchy;
+ (id)fetchViewHierarchyWithOptions:(id)a3;
+ (id)layerForView:(id)a3;
+ (id)pathForClass:(Class)a3;
+ (id)primaryWindowFromWindows:(id)a3;
+ (id)snapshotMethodForView:(id)a3;
+ (id)snapshotView:(id)a3 errorString:(id *)a4;
+ (id)subviewsForView:(id)a3;
+ (id)titleForWindow:(id)a3;
+ (id)viewDebuggerEffectViewsToSnapshotAsImage;
+ (id)windowContentViewForWindow:(id)a3;
+ (unint64_t)majorVersion;
+ (unint64_t)minorVersion;
+ (void)_populateConstraintInfosArray:(id)a3 forViewHierarchy:(id)a4;
+ (void)_snapshotView:(id)a3 andAddDataToDictionary:(id)a4;
+ (void)addObjectBasics:(id)a3 toDict:(id)a4;
+ (void)addPathForClass:(Class)a3;
+ (void)addViewLayerInfo:(id)a3 toDict:(id)a4;
+ (void)addViewSubclassSpecificInfoForView:(id)a3 toDict:(id)a4;
+ (void)disableLayersAsSnapshots;
+ (void)enableLayersAsSnapshots;
@end

@implementation DBGViewDebuggerSupport

+ (unint64_t)majorVersion
{
  return 2LL;
}

+ (unint64_t)minorVersion
{
  return 0LL;
}

+ (id)classMap
{
  id result = (id)classMap_classMap;
  if (!classMap_classMap)
  {
    id result = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    classMap_classMap = (uint64_t)result;
  }

  return result;
}

+ (void)addPathForClass:(Class)a3
{
  id v5 = [a1 classMap];
  v6 = NSStringFromClass(a3);
  if (![v5 objectForKey:a3])
  {
    id v7 = [a1 pathForClass:a3];
    if (v7)
    {
      if (v6) {
        [v5 setObject:v7 forKey:v6];
      }
    }
  }

+ (id)pathForClass:(Class)a3
{
  v4 = NSStringFromClass(a3);
  id v5 = (objc_class *)-[objc_class superclass](a3, "superclass");
  if (v5)
  {
    v6 = v5;
    unint64_t v7 = 0LL;
    do
    {
      if (v6 == (objc_class *)objc_opt_class(&OBJC_CLASS___NSObject)) {
        break;
      }
      if (v7 > 0x3E8) {
        break;
      }
      v4 = -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", NSStringFromClass(v6));
      ++v7;
      v6 = (objc_class *)-[objc_class superclass](v6, "superclass");
    }

    while (v6);
  }

  return v4;
}

+ (id)fetchViewHierarchyWithOptions:(id)a3
{
  DBGViewDebuggerUseLayersAsSnapshots = 1;
  if ([a3 objectForKey:@"DBGViewDebuggerUseLayersAsSnapshots"]) {
    DBGViewDebuggerUseLayersAsSnapshots = objc_msgSend( objc_msgSend( a3,  "objectForKeyedSubscript:",  @"DBGViewDebuggerUseLayersAsSnapshots"),  "BOOLValue");
  }
  DBGViewDebuggerAlwaysEncodeLayers = 0;
  if ([a3 objectForKey:@"DBGViewDebuggerAlwaysEncodeLayers"]) {
    DBGViewDebuggerAlwaysEncodeLayers = objc_msgSend( objc_msgSend( a3,  "objectForKeyedSubscript:",  @"DBGViewDebuggerAlwaysEncodeLayers"),  "BOOLValue");
  }
  if ([a3 objectForKeyedSubscript:@"DBGViewDebuggerEffectViewsToSnapshotAsImage"]) {
    DBGViewDebuggerEffectViewsToSnapshotAsImage = (uint64_t)[a3 objectForKeyedSubscript:@"DBGViewDebuggerEffectViewsToSnapshotAsImage"];
  }
  if ([a3 objectForKeyedSubscript:@"DBGViewDebuggerEnableSceneDebugging"]) {
    DBGViewDebuggerEnableSceneDebugging = objc_msgSend( objc_msgSend( a3,  "objectForKeyedSubscript:",  @"DBGViewDebuggerEnableSceneDebugging"),  "BOOLValue");
  }
  return [a1 fetchViewHierarchy];
}

+ (id)viewDebuggerEffectViewsToSnapshotAsImage
{
  return (id)DBGViewDebuggerEffectViewsToSnapshotAsImage;
}

+ (void)enableLayersAsSnapshots
{
  DBGViewDebuggerUseLayersAsSnapshots = 1;
}

+ (void)disableLayersAsSnapshots
{
  DBGViewDebuggerUseLayersAsSnapshots = 0;
}

+ (id)fetchViewHierarchy
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v4 = [a1 appWindows];
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
  id obj = v4;
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v9 = [a1 windowContentViewForWindow:v8];
        if (v8 == v9)
        {
          id v10 = [a1 _collectSubviewInfoForView:v8 encodeLayers:1];
        }

        else
        {
          id v10 = [a1 collectViewInfo:v8];
          id v37 = [a1 _collectSubviewInfoForView:v9 encodeLayers:1];
          objc_msgSend( v10,  "setObject:forKey:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1),  @"subviews");
        }

        objc_msgSend( v10,  "setObject:forKey:",  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(a1, "isHiddenForWindow:", v8)),  @"hidden");
        id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        [a1 _populateConstraintInfosArray:v11 forViewHierarchy:v9];
        if ([v11 count]) {
          [v10 setObject:v11 forKey:@"constraints"];
        }
        id v12 = [a1 titleForWindow:v8];
        if ([v12 length]) {
          [v10 setObject:v12 forKey:@"displayName"];
        }
        [a1 screenBackingScaleForWindow:v8];
        objc_msgSend( v10,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"screenBackingScale");
        [v3 addObject:v10];
      }

      id v5 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    }

    while (v5);
  }

  id v13 = [a1 additionalRootLevelViewsToArchive];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)j);
        if ([a1 isViewSubclass:v17])
        {
          id v18 = [a1 _collectSubviewInfoForView:v17 encodeLayers:1];
          id v19 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
          [a1 _populateConstraintInfosArray:v19 forViewHierarchy:v17];
          if ([v19 count]) {
            [v18 setObject:v19 forKey:@"constraints"];
          }
          [a1 screenBackingScaleForView:v17];
          objc_msgSend( v18,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"screenBackingScale");
          [v3 addObject:v18];
        }
      }

      id v14 = [v13 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }

    while (v14);
  }

  id v20 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v20 setObject:v3 forKey:@"views"];
  objc_msgSend(v20, "setObject:forKey:", objc_msgSend(a1, "classMap"), @"classmap");
  id v21 = [a1 primaryWindowFromWindows:obj];
  if (v21) {
    [v20 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p", v21), @"primaryWindow" forKey];
  }
  uint64_t v24 = 0LL;
  id result = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v20,  200LL,  0LL,  &v24);
  if (v24)
  {
    v33 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error serializing view hierarchy information: %@",  v24);
    v34 = @"exceptions";
    v35 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL);
    return +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL),  200LL,  0LL,  0LL);
  }

  return result;
}

+ (id)collectViewInfo:(id)a3
{
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [a1 addObjectBasics:a3 toDict:v5];
  [a1 addFrameBasics:a3 toDict:v5];
  if ([a1 isViewSubclass:a3])
  {
    [a1 addViewBasics:a3 toDict:v5];
    [a1 addViewLayerInfo:a3 toDict:v5];
    [a1 addLayoutInfoForView:a3 toDict:v5];
    [a1 _snapshotView:a3 andAddDataToDictionary:v5];
    [a1 addViewSubclassSpecificInfoForView:a3 toDict:v5];
  }

  return v5;
}

+ (void)addObjectBasics:(id)a3 toDict:(id)a4
{
  unint64_t v7 = (objc_class *)objc_opt_class(a3);
  [a4 setObject:NSStringFromClass(v7) forKey:@"class"];
  [a1 addPathForClass:v7];
  [a4 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p", a3), @"address" forKey];
}

+ (void)addViewSubclassSpecificInfoForView:(id)a3 toDict:(id)a4
{
  if (DBGViewDebuggerEnableSceneDebugging)
  {
    Class v7 = NSClassFromString(@"SCNView");
    if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
    {
      id v8 = [a3 scene];
      if (v8)
      {
        id v9 = v8;
        Class v10 = NSClassFromString(@"SCNKeyedArchiver");
        if ((objc_opt_respondsToSelector(v10, "archivedDataWithRootObject:options:") & 1) != 0)
        {
          objc_msgSend( a4,  "setObject:forKey:",  -[objc_class archivedDataWithRootObject:options:]( v10,  "archivedDataWithRootObject:options:",  v9,  &off_4F038),  @"encodedDocumentData");
          objc_msgSend( a4,  "setObject:forKey:",  objc_msgSend(a1, "pathForClass:", objc_opt_class(v9)),  @"classPathRepresentedByEncodedDocumentData");
        }

        if ((objc_opt_respondsToSelector(a3, "pointOfView") & 1) != 0)
        {
          id v11 = [a3 valueForKey:@"pointOfView"];
          if (v11)
          {
            id v12 = v11;
            Class v13 = NSClassFromString(@"SCNScene");
            if (v13)
            {
              Class v14 = v13;
              if ((objc_opt_respondsToSelector(v13, "_indexPathForNode:") & 1) != 0)
              {
                id v15 = -[objc_class _indexPathForNode:](v14, "_indexPathForNode:", v12);
                if (v15)
                {
                  v16 = @"pointOfView";
                  id v17 = [a1 _arrayEncodedIndexPath:v15];
                  objc_msgSend( a4,  "setObject:forKey:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1),  @"encodedDocumentInfo");
                }
              }
            }
          }
        }
      }
    }
  }

+ (id)_arrayEncodedIndexPath:(id)a3
{
  id v4 = (char *)[a3 length];
  __chkstk_darwin();
  uint64_t v6 = (uint64_t *)((char *)&v10 - v5);
  objc_msgSend(a3, "getIndexes:range:", (char *)&v10 - v5, 0, v4);
  for (id i = &__NSArray0__struct; v4; --v4)
  {
    uint64_t v8 = *v6++;
    id i = objc_msgSend( i,  "arrayByAddingObject:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
  }

  return i;
}

+ (BOOL)_shouldEncodeLayers
{
  return (DBGViewDebuggerUseLayersAsSnapshots | DBGViewDebuggerAlwaysEncodeLayers) != 0;
}

+ (BOOL)_layerShouldSupersedeSnapshot:(id)a3
{
  id v5 = objc_msgSend(a1, "layerForView:");
  if (v5)
  {
    if ([a1 snapshotMethodForView:a3])
    {
LABEL_3:
      LOBYTE(v5) = 0;
      return (char)v5;
    }

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v6 = (void *)DBGViewDebuggerEffectViewsToSnapshotAsImage;
    id v7 = [(id)DBGViewDebuggerEffectViewsToSnapshotAsImage countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
LABEL_7:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = (objc_class *)objc_opt_class(a3);
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          LOBYTE(v5) = 1;
          if (v8) {
            goto LABEL_7;
          }
          return (char)v5;
        }
      }
    }

    LOBYTE(v5) = 1;
  }

  return (char)v5;
}

+ (void)_snapshotView:(id)a3 andAddDataToDictionary:(id)a4
{
  if (!DBGViewDebuggerUseLayersAsSnapshots
    || ([a1 _layerShouldSupersedeSnapshot:a3] & 1) == 0)
  {
    uint64_t v8 = 0LL;
    id v7 = [a1 snapshotView:a3 errorString:&v8];
    if (v7) {
      [a4 setObject:v7 forKey:@"imageData"];
    }
    if (v8) {
      [a4 setObject:v8 forKey:@"snapshottingError"];
    }
  }

+ (void)_populateConstraintInfosArray:(id)a3 forViewHierarchy:(id)a4
{
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = [a4 constraints];
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = &CAEncodeLayerTree_ptr;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_opt_class(v8[33]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          id v13 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
          [v13 setObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p", v11), @"address" forKey];
          [v13 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%p", objc_msgSend(v11, "firstItem")), @"firstItem" forKey];
          objc_msgSend( v13,  "setObject:forKey:",  +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  objc_msgSend(v11, "firstAttribute")),  @"firstAttribute");
          [v13 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%p", objc_msgSend(v11, "secondItem")), @"secondItem" forKey];
          objc_msgSend( v13,  "setObject:forKey:",  +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  objc_msgSend(v11, "secondAttribute")),  @"secondAttribute");
          objc_msgSend( v13,  "setObject:forKey:",  +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a4),  @"container");
          objc_msgSend( v13,  "setObject:forKey:",  +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  objc_msgSend(v11, "relation")),  @"relation");
          [v11 constant];
          objc_msgSend( v13,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"constant");
          [v11 multiplier];
          objc_msgSend( v13,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"multiplier");
          [v11 priority];
          objc_msgSend( v13,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14),  @"priority");
          __int128 v15 = (objc_class *)objc_opt_class(v11);
          [v13 setObject:NSStringFromClass(v15) forKey:@"class"];
          __int128 v16 = (const __CFString *)[v11 identifier];
          if (v16) {
            __int128 v17 = v16;
          }
          else {
            __int128 v17 = &stru_34740;
          }
          [v13 setObject:v17 forKey:@"identifier"];
          uint64_t v8 = &CAEncodeLayerTree_ptr;
          [a3 addObject:v13];
          [a1 addPathForClass:objc_opt_class(v11)];
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v7);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v18 = [a4 subviews];
  id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      v22 = 0LL;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        [a1 _populateConstraintInfosArray:a3 forViewHierarchy:*(void *)(*((void *)&v25 + 1) + 8 * (void)v22)];
        v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v20);
  }

+ (id)_collectSubviewInfoForView:(id)a3 encodeLayers:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_msgSend(a1, "collectViewInfo:");
  id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v9 = [a3 layer];
  uint64_t v10 = v9;
  if (v4 && v9 && [a1 _shouldEncodeLayers])
  {
    id v11 = (const void *)CAEncodeLayerTree(v10);
    [v7 setObject:v11 forKeyedSubscript:@"layerRoot"];
    CFTypeRef v12 = (id)CFMakeCollectable(v11);
  }

  if (objc_msgSend(objc_msgSend(a1, "subviewsForView:", a3), "count"))
  {
    uint64_t v13 = 0LL;
    if (v10) {
      int v14 = 1;
    }
    else {
      int v14 = !v4;
    }
    unsigned int v15 = 1;
    do
    {
      id v16 = objc_msgSend(objc_msgSend(a1, "subviewsForView:", a3), "objectAtIndexedSubscript:", v13);
      if (v16)
      {
        id v17 = v16;
        if (v14)
        {
          id v18 = [v16 layer];
          uint64_t v19 = 0LL;
          if (v4 && v18) {
            uint64_t v19 = objc_msgSend(objc_msgSend(v10, "sublayers"), "containsObject:", v18) ^ 1;
          }
        }

        else
        {
          uint64_t v19 = 1LL;
        }

        objc_msgSend(v8, "addObject:", objc_msgSend(a1, "_collectSubviewInfoForView:encodeLayers:", v17, v19));
      }

      uint64_t v13 = v15;
    }

    while ((unint64_t)objc_msgSend(objc_msgSend(a1, "subviewsForView:", a3), "count") > v15++);
  }

  [v7 setObject:v8 forKey:@"subviews"];
  return v7;
}

+ (id)_layerInfo:(id)a3 view:(id)a4
{
  if (!a3) {
    return 0LL;
  }
  id v7 = (objc_class *)objc_opt_class(a3);
  [a1 addPathForClass:v7];
  id v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%p", a3);
  v10[0] = @"layerDelegate";
  v11[0] = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%p",  [a3 delegate]);
  v10[1] = @"viewIdentifier";
  v11[1] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%p", a4);
  v10[2] = @"class";
  v10[3] = @"address";
  v11[2] = NSStringFromClass(v7);
  v11[3] = v8;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  4LL);
}

+ (id)appWindows
{
  return 0LL;
}

+ (id)windowContentViewForWindow:(id)a3
{
  return 0LL;
}

+ (id)additionalRootLevelViewsToArchive
{
  return 0LL;
}

+ (BOOL)isHiddenForWindow:(id)a3
{
  return 0;
}

+ (id)titleForWindow:(id)a3
{
  return &stru_34740;
}

+ (double)screenBackingScaleForWindow:(id)a3
{
  return 1.0;
}

+ (double)screenBackingScaleForView:(id)a3
{
  return 1.0;
}

+ (id)snapshotView:(id)a3 errorString:(id *)a4
{
  return 0LL;
}

+ (id)snapshotMethodForView:(id)a3
{
  return 0LL;
}

+ (id)layerForView:(id)a3
{
  return 0LL;
}

+ (id)subviewsForView:(id)a3
{
  return 0LL;
}

+ (BOOL)isWindowSubclass:(id)a3
{
  return 0;
}

+ (BOOL)isViewSubclass:(id)a3
{
  return 0;
}

+ (id)displayNameForView:(id)a3
{
  return 0LL;
}

+ (id)primaryWindowFromWindows:(id)a3
{
  return 0LL;
}

+ (void)addViewLayerInfo:(id)a3 toDict:(id)a4
{
  id v7 = objc_msgSend(a1, "layerForView:");
  if (v7)
  {
    id v8 = v7;
    id v9 = [a1 _layerInfo:v7 view:a3];
    if (v9) {
      [a4 setObject:v9 forKey:@"layer"];
    }
    objc_msgSend( a4,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(objc_msgSend(objc_msgSend(v8, "superlayer"), "sublayers"), "indexOfObject:", v8)),  @"layerIndex");
    uint64_t v10 = (objc_class *)objc_opt_class(v8);
    [a4 setObject:NSStringFromClass(v10) forKey:@"layerClass"];
    objc_msgSend( a4,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "masksToBounds")),  @"masksToBounds");
    objc_msgSend( a4,  "setObject:forKey:",  __50__DBGViewDebuggerSupport_addViewLayerInfo_toDict___block_invoke((uint64_t)objc_msgSend(v8, "transform"), v16),  @"transform");
    objc_msgSend( a4,  "setObject:forKey:",  __50__DBGViewDebuggerSupport_addViewLayerInfo_toDict___block_invoke( (uint64_t)objc_msgSend(v8, "sublayerTransform"),  v15),  @"sublayerTransform");
    [v8 position];
    double v12 = v11;
    id v17 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    id v18 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12);
    objc_msgSend( a4,  "setObject:forKey:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 2),  @"position");
    [v8 zPosition];
    objc_msgSend( a4,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"zPosition");
    [v8 anchorPoint];
    double v14 = v13;
    id v17 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
    id v18 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14);
    objc_msgSend( a4,  "setObject:forKey:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 2),  @"anchorPoint");
    [v8 anchorPointZ];
    objc_msgSend( a4,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"anchorPointZ");
    objc_msgSend( a4,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isDoubleSided")),  @"isDoubleSided");
  }

NSArray *__50__DBGViewDebuggerSupport_addViewLayerInfo_toDict___block_invoke(uint64_t a1, double *a2)
{
  v4[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *a2);
  v4[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[1]);
  v4[2] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[2]);
  v4[3] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[3]);
  v4[4] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[4]);
  v4[5] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[5]);
  v4[6] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[6]);
  v4[7] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[7]);
  v4[8] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[8]);
  v4[9] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[9]);
  v4[10] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[10]);
  v4[11] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[11]);
  v4[12] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[12]);
  v4[13] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[13]);
  v4[14] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[14]);
  v4[15] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2[15]);
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 16LL);
}

+ (double)firstBaselineOffsetFromTopForView:(id)a3
{
  return 0.0;
}

+ (double)lastBaselineOffsetFromBottomForView:(id)a3
{
  return 0.0;
}

id __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke( double a1,  double a2,  double a3,  double a4)
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v13[0] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2));
  v13[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  v13[2] = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  v13[3] = v10;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));

  return v11;
}

@end