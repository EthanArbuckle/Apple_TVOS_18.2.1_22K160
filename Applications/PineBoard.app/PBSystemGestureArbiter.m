@interface PBSystemGestureArbiter
+ (id)_selectionPolicyForMode:(int64_t)a3;
- ($A932E4DD85C175DE602CAFF6485A0071)_descriptorResultsForGestureRecognizer:(id)a3 andGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (NSMapTable)descriptorCache;
- (PBSystemGestureArbiter)initWithSystemGestureTable:(id)a3;
- (PBSystemGestureFailurePolicy)defaultFailurePolicy;
- (PBSystemGestureSelectionPolicy)selectionPolicy;
- (PBSystemGestureTable)table;
- (id)_descriptorResultForGestureRecognizer:(id)a3;
- (int64_t)selectionMode;
- (void)_resetCacheWithReason:(id)a3;
- (void)resetCacheWithReason:(id)a3 forGestureRecognizer:(id)a4;
- (void)setSelectionMode:(int64_t)a3;
@end

@implementation PBSystemGestureArbiter

- (PBSystemGestureArbiter)initWithSystemGestureTable:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBSystemGestureArbiter;
  v6 = -[PBSystemGestureArbiter init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_table, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  261LL,  0LL));
    descriptorCache = v7->_descriptorCache;
    v7->_descriptorCache = (NSMapTable *)v8;

    v7->_selectionMode = 0LL;
    id v10 = [(id)objc_opt_class(v7) _selectionPolicyForMode:v7->_selectionMode];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    selectionPolicy = v7->_selectionPolicy;
    v7->_selectionPolicy = (PBSystemGestureSelectionPolicy *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___PBSystemGestureDefaultFailurePolicy);
    defaultFailurePolicy = v7->_defaultFailurePolicy;
    v7->_defaultFailurePolicy = (PBSystemGestureFailurePolicy *)v13;
  }

  return v7;
}

- (void)setSelectionMode:(int64_t)a3
{
  if (self->_selectionMode != a3)
  {
    id v5 = sub_1000C2E10(self);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10027C2B4(a3, v6);
    }

    self->_selectionMode = a3;
    id v7 = [(id)objc_opt_class(self) _selectionPolicyForMode:self->_selectionMode];
    uint64_t v8 = (PBSystemGestureSelectionPolicy *)objc_claimAutoreleasedReturnValue(v7);
    selectionPolicy = self->_selectionPolicy;
    self->_selectionPolicy = v8;

    -[PBSystemGestureArbiter _resetCacheWithReason:](self, "_resetCacheWithReason:", @"SelectionModeChange");
  }

- (void)resetCacheWithReason:(id)a3 forGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000C2E10(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:

    goto LABEL_6;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_descriptorCache, "objectForKey:", v7));

  if (v10)
  {
    id v11 = sub_1000C2E10(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
      sub_10027C340((uint64_t)v6, (uint64_t)v7, (os_log_s *)v9);
    }
    goto LABEL_5;
  }

- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureArbiter _descriptorResultForGestureRecognizer:]( self,  "_descriptorResultForGestureRecognizer:",  v6));
  v9 = v8;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 systemGestureRecipe]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 recognitionPolicy]);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 gestureRecognizerDescriptor]);
      unsigned int v14 = [v12 gestureRecognizer:v13 shouldReceivePress:v7];

      id v15 = sub_1000C2E10(self);
      objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v6));
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v7));
        int v20 = 138543874;
        v21 = v18;
        __int16 v22 = 2114;
        v23 = v19;
        __int16 v24 = 1024;
        unsigned int v25 = v14;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%{public}@ should receive press (%{public}@): %{BOOL}d",  (uint8_t *)&v20,  0x1Cu);
      }
    }

    else
    {
      LOBYTE(v14) = 1;
    }
  }

  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[PBSystemGestureArbiter _descriptorResultsForGestureRecognizer:andGestureRecognizer:]( self,  "_descriptorResultsForGestureRecognizer:andGestureRecognizer:",  v6,  v7);
  id v10 = v9;
  id v11 = v8;
  id v12 = v10;
  LOBYTE(v13) = 0;
  if (v8 && v10)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 systemGestureRecipe]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 simultaneousRecognitionPolicy]);
    if (v15)
    {
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v11 gestureRecognizerDescriptor]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v12 gestureRecognizerDescriptor]);
      unsigned int v13 = [v15 gestureRecognizer:v16 shouldRecognizeSimultaneouslyWithGestureRecognizer:v17];
      id v18 = sub_1000C2E10(self);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        int v21 = 138544130;
        __int16 v22 = v16;
        __int16 v23 = 2114;
        __int16 v24 = v17;
        __int16 v25 = 1024;
        unsigned int v26 = v13;
        __int16 v27 = 2114;
        v28 = v15;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%{public}@ should recognize simultaneously with %{public}@: %{BOOL}d {policy=%{public}@}",  (uint8_t *)&v21,  0x26u);
      }
    }

    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[PBSystemGestureArbiter _descriptorResultsForGestureRecognizer:andGestureRecognizer:]( self,  "_descriptorResultsForGestureRecognizer:andGestureRecognizer:",  v6,  v7);
  id v10 = v9;
  id v11 = v8;
  id v12 = v10;
  if (v8 && v10)
  {
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 gestureRecognizerDescriptor]);
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v12 gestureRecognizerDescriptor]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 systemGestureRecipe]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 systemGestureRecipe]);
    objc_super v16 = (PBSystemGestureFailurePolicy *)objc_claimAutoreleasedReturnValue([v14 failurePolicy]);
    defaultFailurePolicy = v16;
    if (!v16) {
      defaultFailurePolicy = self->_defaultFailurePolicy;
    }
    id v18 = defaultFailurePolicy;

    unsigned int v19 = -[PBSystemGestureFailurePolicy gestureRecognizer:ofRecipe:shouldRequireFailureOfGestureRecognizer:ofRecipe:]( v18,  "gestureRecognizer:ofRecipe:shouldRequireFailureOfGestureRecognizer:ofRecipe:",  v13,  v14,  v26,  v15);
    id v20 = sub_1000C2E10(self);
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      unsigned int v28 = v19;
      __int16 v29 = 2114;
      v30 = v13;
      __int16 v31 = 2114;
      v32 = v26;
      __int16 v33 = 2114;
      v34 = v18;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "A should require failure of B: %{BOOL}d {A=%{public}@, B=%{public}@, policy=%{public}@}",  buf,  0x26u);
    }
  }

  else
  {
    id v22 = sub_1000C2E10(self);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v23 = (id)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v6));
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  v7));
      sub_10027C3F0(v23, v24, (uint64_t)buf, v13);
    }

    LOBYTE(v19) = 0;
  }

  return v19;
}

- (id)_descriptorResultForGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_descriptorCache, "objectForKey:", v4));
  if (!v5)
  {
    table = self->_table;
    id v10 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable recipesForGestureRecognizers:withSelectionPolicy:]( table,  "recipesForGestureRecognizers:withSelectionPolicy:",  v7,  self->_selectionPolicy));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v4]);

    if (v5) {
      -[NSMapTable setObject:forKey:](self->_descriptorCache, "setObject:forKey:", v5, v4);
    }
  }

  return v5;
}

- ($A932E4DD85C175DE602CAFF6485A0071)_descriptorResultsForGestureRecognizer:(id)a3 andGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 2LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_descriptorCache, "objectForKey:", v6));
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_descriptorCache, "objectForKey:", v7));
  id v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    id v15 = v9;
    id v16 = v11;
    goto LABEL_15;
  }

  if (v9)
  {
    if (v10) {
      goto LABEL_8;
    }
  }

  else
  {
    -[NSMutableArray addObject:](v8, "addObject:", v6);
    if (v11) {
      goto LABEL_8;
    }
  }

  -[NSMutableArray addObject:](v8, "addObject:", v7);
LABEL_8:
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable recipesForGestureRecognizers:withSelectionPolicy:]( self->_table,  "recipesForGestureRecognizers:withSelectionPolicy:",  v8,  self->_selectionPolicy));
  unsigned int v14 = v13;
  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v6]);
    if (v9) {
      -[NSMapTable setObject:forKey:](self->_descriptorCache, "setObject:forKey:", v9, v6);
    }
  }

  if (!v11)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v7]);
    if (v11) {
      -[NSMapTable setObject:forKey:](self->_descriptorCache, "setObject:forKey:", v11, v7);
    }
  }

  id v15 = v9;
  id v16 = v11;

LABEL_15:
  v17 = v15;
  id v18 = v16;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (void)_resetCacheWithReason:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = -[NSMapTable count](self->_descriptorCache, "count");
  id v6 = sub_1000C2E10(self);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Resetting entire cache {reason=%{public}@}",  (uint8_t *)&v10,  0xCu);
    }

    -[NSMapTable removeAllObjects](self->_descriptorCache, "removeAllObjects");
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10027C458((uint64_t)v4, v8, v9);
    }
  }
}

+ (id)_selectionPolicyForMode:(int64_t)a3
{
  v3 = &off_1003CDC80;
  if (a3 != 1) {
    v3 = off_1003CDC78;
  }
  return objc_alloc_init(*v3);
}

- (int64_t)selectionMode
{
  return self->_selectionMode;
}

- (PBSystemGestureSelectionPolicy)selectionPolicy
{
  return self->_selectionPolicy;
}

- (PBSystemGestureTable)table
{
  return self->_table;
}

- (NSMapTable)descriptorCache
{
  return self->_descriptorCache;
}

- (PBSystemGestureFailurePolicy)defaultFailurePolicy
{
  return self->_defaultFailurePolicy;
}

- (void).cxx_destruct
{
}

@end