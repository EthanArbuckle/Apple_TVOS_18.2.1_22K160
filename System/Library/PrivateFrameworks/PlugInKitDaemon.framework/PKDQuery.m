@interface PKDQuery
+ (id)queryWithCriteria:(id)a3 discoveryUUID:(id)a4 database:(id)a5;
- (BOOL)_allowPlugInForRecord:(id)a3;
- (BOOL)_needsFilter;
- (BOOL)allowPlugInWithBundleIdentifier:(id)a3 entitlements:(id)a4;
- (BOOL)criteriaIsSimple;
- (NSDictionary)criteria;
- (NSString)signpostIdentifier;
- (NSUUID)discoveryUUID;
- (PKDatabase)database;
- (id)_allPlugIns;
- (id)_electionPatternAsArray;
- (id)_filterDictForRecord:(id)a3;
- (id)_findPlugIns;
- (id)_findPlugInsFromEnumerator:(id)a3;
- (id)_findPlugInsWithExtensionPoint:(id)a3 platforms:(id)a4;
- (id)_findPlugInsWithExtensionPoints:(id)a3 platforms:(id)a4;
- (id)_findPlugInsWithIdentifier:(id)a3;
- (id)_lsPattern:(id)a3;
- (id)findPlugIns;
- (unint64_t)interval;
- (void)_findPlugIns;
- (void)_safelyAddPlugIn:(id)a3 toSet:(id)a4;
- (void)setCriteria:(id)a3;
- (void)setDiscoveryUUID:(id)a3;
- (void)setInterval:(unint64_t)a3;
- (void)setSignpostIdentifier:(id)a3;
- (void)signpostBegin;
- (void)signpostEnd;
@end

@implementation PKDQuery

+ (id)queryWithCriteria:(id)a3 discoveryUUID:(id)a4 database:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new(a1);
  v12 = *(void **)(v11 + 8);
  *(void *)(v11 + 8) = v8;
  id v13 = v8;

  v14 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;

  objc_storeWeak((id *)(v11 + 32), v10);
  return (id)v11;
}

- (BOOL)allowPlugInWithBundleIdentifier:(id)a3 entitlements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery _electionPatternAsArray](self, "_electionPatternAsArray"));
  if (v8)
  {
    id v9 = [v7 objectForKey:PKOverrideEntitlement ofClass:objc_opt_class(NSString)];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;

      id v6 = v12;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery database](self, "database"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 annotationForIdentifier:v6]);

    v15 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:PKAnnotationElectionKey]);
    if (!v15)
    {
      id v16 = [v7 objectForKey:PKAutoElectEntitlement ofClass:objc_opt_class(NSNumber)];
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      else {
        v15 = &off_25FF0;
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%d",  [v15 integerValue]));
    unsigned __int8 v20 = [v8 containsObject:v18];
    if ((v20 & 1) == 0)
    {
      uint64_t v21 = pklog_handle_for_category(6LL, v19);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery discoveryUUID](self, "discoveryUUID"));
        *(_DWORD *)buf = 138412802;
        v26 = v23;
        __int16 v27 = 2112;
        id v28 = v6;
        __int16 v29 = 2114;
        v30 = v15;
        _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "[d %@] [%@] rejecting; election criteria excludes election state: %{public}@",
          buf,
          0x20u);
      }
    }
  }

  else
  {
    unsigned __int8 v20 = 1;
  }

  return v20;
}

- (id)findPlugIns
{
  return (id)objc_claimAutoreleasedReturnValue(-[PKDQuery _findPlugIns](self, "_findPlugIns"));
}

- (void)signpostBegin
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery criteria](self, "criteria"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:PKProtocolAttribute]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;

  -[PKDQuery setSignpostIdentifier:](self, "setSignpostIdentifier:", v7);
  uint64_t v9 = pklog_handle_for_category(3LL, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery discoveryUUID](self, "discoveryUUID"));
  -[PKDQuery setInterval:](self, "setInterval:", os_signpost_id_make_with_pointer(v10, v11));

  uint64_t v13 = pklog_handle_for_category(3LL, v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  unint64_t v15 = -[PKDQuery interval](self, "interval");
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery discoveryUUID](self, "discoveryUUID"));
      int v18 = 138543619;
      uint64_t v19 = v17;
      __int16 v20 = 2113;
      id v21 = v7;
      _os_signpost_emit_with_name_impl( &dword_0,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v16,  "LSQuery",  " discoveryUUID=%{public, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@ ",  (uint8_t *)&v18,  0x16u);
    }
  }
}

- (void)signpostEnd
{
  uint64_t v3 = pklog_handle_for_category(3LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = -[PKDQuery interval](self, "interval");
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)id v7 = 0;
      _os_signpost_emit_with_name_impl( &dword_0,  v4,  OS_SIGNPOST_INTERVAL_END,  v6,  "LSQuery",  (const char *)&unk_1DDCE,  v7,  2u);
    }
  }
}

- (BOOL)criteriaIsSimple
{
  if (criteriaIsSimple_onceToken != -1) {
    dispatch_once(&criteriaIsSimple_onceToken, &__block_literal_global_0);
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery criteria](self, "criteria"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  LOBYTE(v3) = [v5 isSubsetOfSet:criteriaIsSimple_simpleSet];
  return (char)v3;
}

void __28__PKDQuery_criteriaIsSimple__block_invoke(id a1)
{
  v1 = objc_alloc(&OBJC_CLASS___NSSet);
  v5[0] = PKProtocolAttribute;
  v5[1] = PKIdentifierAttribute;
  v5[2] = PKCFBundleIdentifierAttribute;
  v5[3] = PKExtensionPlatformsAttribute;
  v5[4] = PKExtensionActivationRuleAttribute;
  v5[5] = PKUserElectionAttribute;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 6LL));
  uint64_t v3 = -[NSSet initWithArray:](v1, "initWithArray:", v2);
  v4 = (void *)criteriaIsSimple_simpleSet;
  criteriaIsSimple_simpleSet = (uint64_t)v3;
}

- (id)_findPlugIns
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery criteria](self, "criteria"));
  unsigned __int8 v4 = -[PKDQuery criteriaIsSimple](self, "criteriaIsSimple");
  uint64_t v6 = pklog_handle_for_category(6LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      id v21 = v3;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "got simple query: %@", (uint8_t *)&v20, 0xCu);
    }

    if ([v3 count])
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:PKIdentifierAttribute]);
      id v10 = v9;
      if (!v9) {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:PKCFBundleIdentifierAttribute]);
      }
      id v11 = v10;
      if (!v9) {

      }
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery _findPlugInsWithIdentifier:](self, "_findPlugInsWithIdentifier:", v11));
LABEL_22:

        goto LABEL_23;
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:PKProtocolAttribute]);
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:PKExtensionPlatformsAttribute]);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
      {
        uint64_t v17 = objc_claimAutoreleasedReturnValue( -[PKDQuery _findPlugInsWithExtensionPoint:platforms:]( self,  "_findPlugInsWithExtensionPoint:platforms:",  v14,  v15));
      }

      else
      {
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v14, v18) & 1) == 0)
        {
          uint64_t v13 = 0LL;
          goto LABEL_21;
        }

        uint64_t v17 = objc_claimAutoreleasedReturnValue( -[PKDQuery _findPlugInsWithExtensionPoints:platforms:]( self,  "_findPlugInsWithExtensionPoints:platforms:",  v14,  v15));
      }

      uint64_t v13 = (void *)v17;
LABEL_21:

      goto LABEL_22;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery _allPlugIns](self, "_allPlugIns"));
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PKDQuery _findPlugIns].cold.1();
    }

    uint64_t v13 = 0LL;
  }

- (BOOL)_needsFilter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery _electionPatternAsArray](self, "_electionPatternAsArray"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)_safelyAddPlugIn:(id)a3 toSet:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[PKDPlugIn nullPlugIn](&OBJC_CLASS___PKDPlugIn, "nullPlugIn"));
    BOOL v7 = v6 != v8;
  }

  else
  {
    BOOL v7 = 0;
  }

  if (v7) {
    [v5 addObject:v8];
  }
}

- (id)_lsPattern:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0 || ![v3 length]) {
    goto LABEL_8;
  }
  id v5 = [v3 characterAtIndex:0];
  if ((_DWORD)v5 != 61)
  {
    id v7 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet alphanumericCharacterSet](&OBJC_CLASS___NSCharacterSet, "alphanumericCharacterSet"));
    LODWORD(v7) = [v8 characterIsMember:v7];

    if ((_DWORD)v7)
    {
      id v6 = v3;
      goto LABEL_7;
    }

- (id)_electionPatternAsArray
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery criteria](self, "criteria"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:PKUserElectionAttribute]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        uint64_t v10 = 0LL;
        else {
          uint64_t v11 = (uint64_t)v8;
        }
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PKDQuery _lsPattern:]( self,  "_lsPattern:",  *(void *)(*((void *)&v17 + 1) + 8 * v10),  (void)v17));
          if (!v12)
          {

            unint64_t v15 = 0LL;
            goto LABEL_17;
          }

          [v6 addObject:v12];

          ++v10;
        }

        while (v11 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v13 = v6;
    id v6 = v13;
  }

  else
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v4, v14) & 1) == 0)
    {
      unint64_t v15 = 0LL;
      goto LABEL_19;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery _lsPattern:](self, "_lsPattern:", v4));
    id v21 = v6;
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  }

  unint64_t v15 = v13;
LABEL_17:

LABEL_19:
  return v15;
}

- (id)_filterDictForRecord:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 entitlements]);
  uint64_t v6 = PKOverrideEntitlement;
  id v7 = [v5 objectForKey:PKOverrideEntitlement ofClass:objc_opt_class(NSString)];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, v6);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 entitlements]);
  uint64_t v10 = PKAutoElectEntitlement;
  id v11 = [v9 objectForKey:PKAutoElectEntitlement ofClass:objc_opt_class(NSNumber)];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v10);

  id v13 = -[NSMutableDictionary copy](v4, "copy");
  return v13;
}

- (BOOL)_allowPlugInForRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery _filterDictForRecord:](self, "_filterDictForRecord:", v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);

  LOBYTE(self) = -[PKDQuery allowPlugInWithBundleIdentifier:entitlements:]( self,  "allowPlugInWithBundleIdentifier:entitlements:",  v6,  v5);
  return (char)self;
}

- (id)_findPlugInsFromEnumerator:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  context = objc_autoreleasePoolPush();
  if (-[PKDQuery _needsFilter](self, "_needsFilter"))
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = __39__PKDQuery__findPlugInsFromEnumerator___block_invoke;
    v23[3] = &unk_24AD8;
    v23[4] = self;
    [v4 setFilter:v23];
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0LL;
      else {
        uint64_t v11 = (uint64_t)v8;
      }
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery database](self, "database"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery discoveryUUID](self, "discoveryUUID"));
        unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v13 plugInForExtensionRecord:v12 discoveryInstanceUUID:v14 extensionPointCache:v6]);

        -[PKDQuery _safelyAddPlugIn:toSet:](self, "_safelyAddPlugIn:toSet:", v15, v5);
        ++v10;
      }

      while (v11 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v8);
  }

  objc_autoreleasePoolPop(context);
  id v16 = -[NSMutableSet copy](v5, "copy");

  return v16;
}

id __39__PKDQuery__findPlugInsFromEnumerator___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _allowPlugInForRecord:a2];
}

- (id)_allPlugIns
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery database](self, "database"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 external]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ls]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 plugInRecordEnumerator]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery _findPlugInsFromEnumerator:](self, "_findPlugInsFromEnumerator:", v6));
  return v7;
}

- (id)_findPlugInsWithExtensionPoint:(id)a3 platforms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  v40 = v6;
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    if (!v7)
    {
      id v39 = 0LL;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery database](self, "database"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 external]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 ls]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 extensionPointRecordEnumeratorForExtensionPointIdentifier:v6]);

      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v11 = v26;
      id v27 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v42;
        do
        {
          uint64_t v29 = 0LL;
          else {
            uint64_t v30 = (uint64_t)v27;
          }
          do
          {
            if (*(void *)v42 != v28) {
              objc_enumerationMutation(v11);
            }
            uint64_t v31 = *(void *)(*((void *)&v41 + 1) + 8 * v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery database](self, "database"));
            v33 = (void *)objc_claimAutoreleasedReturnValue([v32 external]);
            v34 = (void *)objc_claimAutoreleasedReturnValue([v33 ls]);
            v35 = (void *)objc_claimAutoreleasedReturnValue([v34 plugInRecordEnumeratorForExtensionPointRecord:v31]);

            if (v35)
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery _findPlugInsFromEnumerator:](self, "_findPlugInsFromEnumerator:", v35));
              -[NSMutableSet unionSet:](v8, "unionSet:", v36);
            }

            ++v29;
          }

          while (v30 != v29);
          id v27 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }

        while (v27);
      }

      goto LABEL_26;
    }

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v12)
    {
      id v39 = v7;
      uint64_t v13 = *(void *)v46;
      do
      {
        uint64_t v14 = 0LL;
        else {
          uint64_t v15 = (uint64_t)v12;
        }
        do
        {
          if (*(void *)v46 != v13) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery database](self, "database", v39));
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 external]);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 ls]);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v19,  "plugInRecordEnumeratorWithExtensionPointName:platform:",  v40,  objc_msgSend(v16, "unsignedIntValue")));

          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery _findPlugInsFromEnumerator:](self, "_findPlugInsFromEnumerator:", v20));
          -[NSMutableSet unionSet:](v8, "unionSet:", v21);

          ++v14;
        }

        while (v15 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }

      while (v12);
LABEL_26:
      id v7 = v39;
    }
  }

  else
  {
    uint64_t v22 = pklog_handle_for_category(3LL, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      -[PKDQuery _findPlugInsWithExtensionPoint:platforms:].cold.1();
    }
  }

  id v37 = -[NSMutableSet copy](v8, "copy");
  return v37;
}

- (id)_findPlugInsWithExtensionPoints:(id)a3 platforms:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v9 = objc_autoreleasePoolPush();
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0LL;
      else {
        uint64_t v14 = (uint64_t)v11;
      }
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[PKDQuery _findPlugInsWithExtensionPoint:platforms:]( self,  "_findPlugInsWithExtensionPoint:platforms:",  *(void *)(*((void *)&v18 + 1) + 8 * v13),  v7,  (void)v18));
        -[NSMutableSet unionSet:](v8, "unionSet:", v15);

        ++v13;
      }

      while (v14 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }

  objc_autoreleasePoolPop(v9);
  id v16 = -[NSMutableSet copy](v8, "copy");

  return v16;
}

- (id)_findPlugInsWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v6 = objc_autoreleasePoolPush();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery database](self, "database"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 external]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 ls]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 plugInRecordForIdentifier:v4]);

  if (v10)
  {
    if (!-[PKDQuery _needsFilter](self, "_needsFilter")
      || -[PKDQuery _allowPlugInForRecord:](self, "_allowPlugInForRecord:", v10))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery database](self, "database"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKDQuery discoveryUUID](self, "discoveryUUID"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v13 plugInForExtensionRecord:v10 discoveryInstanceUUID:v14 extensionPointCache:v12]);

      -[PKDQuery _safelyAddPlugIn:toSet:](self, "_safelyAddPlugIn:toSet:", v15, v5);
      int v16 = 1;
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v17 = pklog_handle_for_category(3LL, v11);
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[PKDQuery _findPlugInsWithIdentifier:].cold.1();
    }
  }

  self = (PKDQuery *)-[NSMutableSet copy](v5, "copy");
  int v16 = 0;
LABEL_9:

  objc_autoreleasePoolPop(v6);
  if (v16) {
    self = (PKDQuery *)-[NSMutableSet copy](v5, "copy");
  }

  return self;
}

- (NSDictionary)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
}

- (unint64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(unint64_t)a3
{
  self->_interval = a3;
}

- (NSString)signpostIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSignpostIdentifier:(id)a3
{
}

- (PKDatabase)database
{
  return (PKDatabase *)objc_loadWeakRetained((id *)&self->_database);
}

- (NSUUID)discoveryUUID
{
  return self->_discoveryUUID;
}

- (void)setDiscoveryUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_findPlugIns
{
}

- (void)_findPlugInsWithExtensionPoint:platforms:.cold.1()
{
}

- (void)_findPlugInsWithIdentifier:.cold.1()
{
}

@end