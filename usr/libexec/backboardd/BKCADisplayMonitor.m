@interface BKCADisplayMonitor
- (BKCADisplayMonitor)init;
- (BKCADisplayMonitor)initWithDisplayProvider:(id)a3 log:(id)a4 filterPredicate:(id)a5;
- (BKCADisplayMonitor)initWithLog:(id)a3;
- (BKCADisplayMonitor)initWithLog:(id)a3 filterPredicate:(id)a4;
- (BOOL)_filterDisplay:(id)a3 usingPredicate:(id)a4;
- (BOOL)displayUUIDIsActive:(id)a3;
- (BOOL)hasActiveDisplays;
- (NSArray)activeDisplays;
- (id)_filterDisplays:(id)a3 usingPredicate:(id)a4;
- (id)_immutableDisplays;
- (id)addObserver:(id)a3;
- (id)immutableDisplayForUUID:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)reevaluateActiveDisplaysWithReason:(id)a3;
- (void)setDisplayFilterPredicate:(id)a3;
@end

@implementation BKCADisplayMonitor

- (void)dealloc
{
  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  if (!self->_displayLock_isInvalid)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"must invoke -invalidate before deallocating BKCADisplayMonitor"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v6 = NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v9 = (objc_class *)objc_opt_class(self, v8);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138544642;
      v14 = v7;
      __int16 v15 = 2114;
      v16 = v11;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2114;
      v20 = @"BKCADisplayMonitor.m";
      __int16 v21 = 1024;
      int v22 = 198;
      __int16 v23 = 2114;
      v24 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v5 UTF8String]);
    __break(0);
    JUMPOUT(0x100060380LL);
  }

  os_unfair_lock_unlock(p_displayLock);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___BKCADisplayMonitor;
  -[BKCADisplayMonitor dealloc](&v12, "dealloc");
}

- (BKCADisplayMonitor)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKSharedCADisplayProvider sharedInstance](&OBJC_CLASS___BKSharedCADisplayProvider, "sharedInstance"));
  v4 = -[BKCADisplayMonitor initWithDisplayProvider:log:filterPredicate:]( self,  "initWithDisplayProvider:log:filterPredicate:",  v3,  0LL,  0LL);

  return v4;
}

- (BKCADisplayMonitor)initWithLog:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSharedCADisplayProvider sharedInstance](&OBJC_CLASS___BKSharedCADisplayProvider, "sharedInstance"));
  v6 = -[BKCADisplayMonitor initWithDisplayProvider:log:filterPredicate:]( self,  "initWithDisplayProvider:log:filterPredicate:",  v5,  v4,  0LL);

  return v6;
}

- (BKCADisplayMonitor)initWithLog:(id)a3 filterPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKSharedCADisplayProvider sharedInstance](&OBJC_CLASS___BKSharedCADisplayProvider, "sharedInstance"));
  v9 = -[BKCADisplayMonitor initWithDisplayProvider:log:filterPredicate:]( self,  "initWithDisplayProvider:log:filterPredicate:",  v8,  v7,  v6);

  return v9;
}

- (BKCADisplayMonitor)initWithDisplayProvider:(id)a3 log:(id)a4 filterPredicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___BKCADisplayMonitor;
  v11 = -[BKCADisplayMonitor init](&v29, "init");
  if (v11)
  {
    if (!v8) {
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[BKSharedCADisplayProvider sharedInstance](&OBJC_CLASS___BKSharedCADisplayProvider, "sharedInstance"));
    }
    objc_storeStrong((id *)&v11->_displayProvider, v8);
    if (v9)
    {
      objc_super v12 = (OS_os_log *)v9;
    }

    else
    {
      id v13 = sub_10003F20C();
      objc_super v12 = (OS_os_log *)objc_claimAutoreleasedReturnValue(v13);
    }

    log = v11->_log;
    v11->_log = v12;

    v11->_displayLock._os_unfair_lock_opaque = 0;
    __int16 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    displayLock_displayUUIDKeyToImmutableCADisplay = v11->_displayLock_displayUUIDKeyToImmutableCADisplay;
    v11->_displayLock_displayUUIDKeyToImmutableCADisplay = v15;

    __int16 v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    displayLock_displayIndexToDisplayUUID = v11->_displayLock_displayIndexToDisplayUUID;
    v11->_displayLock_displayIndexToDisplayUUID = v17;

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor _immutableDisplays](v11, "_immutableDisplays"));
    uint64_t v20 = objc_claimAutoreleasedReturnValue( -[BKCADisplayMonitor _filterDisplays:usingPredicate:]( v11,  "_filterDisplays:usingPredicate:",  v19,  v11->_filterPredicateLock_displayFilterPredicate));
    __int16 v21 = v11->_displayLock_displayUUIDKeyToImmutableCADisplay;
    v11->_displayLock_displayUUIDKeyToImmutableCADisplay = (NSMutableDictionary *)v20;

    int v22 = v11->_displayLock_displayUUIDKeyToImmutableCADisplay;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000614EC;
    v27[3] = &unk_1000B7A68;
    __int16 v23 = v11;
    v28 = v23;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v27);
    v23->_filterPredicateLock._os_unfair_lock_opaque = 0;
    id v24 = [v10 copy];
    id filterPredicateLock_displayFilterPredicate = v11->_filterPredicateLock_displayFilterPredicate;
    v11->_id filterPredicateLock_displayFilterPredicate = v24;

    -[BKCADisplayProvider addMonitor:](v11->_displayProvider, "addMonitor:", v23);
  }

  return v11;
}

- (void)invalidate
{
  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  if (!self->_displayLock_isInvalid)
  {
    self->_displayLock_isInvalid = 1;
    -[BKCADisplayProvider removeMonitor:](self->_displayProvider, "removeMonitor:", self);
    displayProvider = self->_displayProvider;
    self->_displayProvider = 0LL;

    -[BSCompoundAssertion invalidate](self->_displayLock_observerAssertion, "invalidate");
    displayLock_observerAssertion = self->_displayLock_observerAssertion;
    self->_displayLock_observerAssertion = 0LL;

    os_unfair_lock_lock(&self->_filterPredicateLock);
    id filterPredicateLock_displayFilterPredicate = self->_filterPredicateLock_displayFilterPredicate;
    self->_id filterPredicateLock_displayFilterPredicate = 0LL;

    os_unfair_lock_unlock(&self->_filterPredicateLock);
  }

  os_unfair_lock_unlock(p_displayLock);
}

- (id)immutableDisplayForUUID:(id)a3
{
  id v4 = a3;
  p_displayLock = &self->_displayLock;
  os_unfair_lock_assert_not_owner(&self->_displayLock);
  os_unfair_lock_lock(&self->_displayLock);
  displayLock_displayUUIDKeyToImmutableCADisplay = self->_displayLock_displayUUIDKeyToImmutableCADisplay;
  id v7 = v4;
  id v8 = [v7 length];
  id v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    id v9 = v7;
  }
  id v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( displayLock_displayUUIDKeyToImmutableCADisplay,  "objectForKeyedSubscript:",  v10));
  os_unfair_lock_unlock(p_displayLock);

  return v11;
}

- (id)addObserver:(id)a3
{
  p_displayLock = &self->_displayLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_displayLock);
  os_unfair_lock_lock(p_displayLock);
  displayLock_observerAssertion = self->_displayLock_observerAssertion;
  if (!displayLock_observerAssertion)
  {
    id v8 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:",  @"backboardd.CADisplayMonitor"));
    id v9 = self->_displayLock_observerAssertion;
    self->_displayLock_observerAssertion = v8;

    displayLock_observerAssertion = self->_displayLock_observerAssertion;
  }

  id v10 = objc_msgSend((id)objc_opt_class(v5, v6), "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:withContext:]( displayLock_observerAssertion,  "acquireForReason:withContext:",  v11,  v5));

  os_unfair_lock_unlock(p_displayLock);
  return v12;
}

- (BOOL)displayUUIDIsActive:(id)a3
{
  p_displayLock = &self->_displayLock;
  id v5 = a3;
  os_unfair_lock_lock(p_displayLock);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_displayLock_displayUUIDKeyToImmutableCADisplay,  "objectForKey:",  v5));

  os_unfair_lock_unlock(p_displayLock);
  return v6 != 0LL;
}

- (NSArray)activeDisplays
{
  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_displayLock_displayUUIDKeyToImmutableCADisplay, "allValues"));
  os_unfair_lock_unlock(p_displayLock);
  return (NSArray *)v4;
}

- (BOOL)hasActiveDisplays
{
  v2 = self;
  p_displayLock = &self->_displayLock;
  os_unfair_lock_lock(&self->_displayLock);
  LOBYTE(v2) = -[NSMutableDictionary count](v2->_displayLock_displayUUIDKeyToImmutableCADisplay, "count") != 0LL;
  os_unfair_lock_unlock(p_displayLock);
  return (char)v2;
}

- (id)_immutableDisplays
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayProvider displays](self->_displayProvider, "displays"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_map:", &stru_1000B7AA8));

  return v4;
}

- (BOOL)_filterDisplay:(id)a3 usingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (**)(id, id, id *))a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 uniqueId]);
  id v9 = [v8 length];
  id v10 = (void *)BKSDisplayUUIDMainKey;
  if (v9) {
    id v10 = v8;
  }
  id v11 = v10;

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 currentMode]);
  if (v12)
  {
    id v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 availableModes]);
    id v15 = [v14 count];

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 currentMode]);
      id v17 = [v16 width];
      id v18 = [v16 height];
      unint64_t v19 = (unint64_t)v18;
      if (v17 && v18)
      {
        if (!v7)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v31 = v6;
            __int16 v32 = 2114;
            id v33 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Display is active %{public}@ %{public}@ because: connected",  buf,  0x16u);
          }

          goto LABEL_18;
        }

        id v29 = 0LL;
        char v20 = v7[2](v7, v6, &v29);
        id v21 = v29;
        int v22 = self->_log;
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if ((v20 & 1) != 0)
        {
          if (v23)
          {
            *(_DWORD *)buf = 138543874;
            id v31 = v6;
            __int16 v32 = 2114;
            id v33 = v11;
            __int16 v34 = 2114;
            double v35 = *(double *)&v21;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Display is active %{public}@ %{public}@ because: %{public}@",  buf,  0x20u);
          }

LABEL_18:
          BOOL v25 = 1;
          goto LABEL_23;
        }

        if (v23)
        {
          *(_DWORD *)buf = 138543874;
          id v31 = v6;
          __int16 v32 = 2114;
          id v33 = v11;
          __int16 v34 = 2114;
          double v35 = *(double *)&v21;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Display is inactive %{public}@ %{public}@ because: %{public}@",  buf,  0x20u);
        }
      }

      else
      {
        v26 = self->_log;
        BOOL v25 = 0;
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
LABEL_23:

          goto LABEL_24;
        }

        *(_DWORD *)buf = 138544130;
        id v31 = v6;
        __int16 v32 = 2114;
        id v33 = v11;
        __int16 v34 = 2048;
        double v35 = (double)(unint64_t)v17;
        __int16 v36 = 2048;
        double v37 = (double)v19;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Display is inactive %{public}@ %{public}@ because: size is (%g,%g)",  buf,  0x2Au);
      }

      BOOL v25 = 0;
      goto LABEL_23;
    }
  }

  id v24 = self->_log;
  BOOL v25 = 0;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Display is inactive %{public}@ because: not connected",  buf,  0xCu);
    BOOL v25 = 0;
  }

- (id)_filterDisplays:(id)a3 usingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    uint64_t v12 = (void *)BKSDisplayUUIDMainKey;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (-[BKCADisplayMonitor _filterDisplay:usingPredicate:](self, "_filterDisplay:usingPredicate:", v14, v7))
        {
          id v15 = (id)objc_claimAutoreleasedReturnValue([v14 uniqueId]);
          if ([v15 length]) {
            v16 = v15;
          }
          else {
            v16 = v12;
          }
          id v17 = v16;

          -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v14, v17);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v10);
  }

  return v19;
}

- (void)setDisplayFilterPredicate:(id)a3
{
  id v4 = [a3 copy];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = log;
    id v7 = objc_retainBlock(v4);
    int v10 = 134217984;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting display predicate: %p",  (uint8_t *)&v10,  0xCu);
  }

  os_unfair_lock_lock(&self->_filterPredicateLock);
  id v8 = objc_retainBlock(v4);
  id filterPredicateLock_displayFilterPredicate = self->_filterPredicateLock_displayFilterPredicate;
  self->_id filterPredicateLock_displayFilterPredicate = v8;

  os_unfair_lock_unlock(&self->_filterPredicateLock);
  -[BKCADisplayMonitor reevaluateActiveDisplaysWithReason:]( self,  "reevaluateActiveDisplaysWithReason:",  @"predicate changed");
}

- (void)reevaluateActiveDisplaysWithReason:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v67 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "reevaluateActiveDisplaysWithReason: %{public}@",  buf,  0xCu);
  }

  v41 = v4;
  os_unfair_lock_lock(&self->_filterPredicateLock);
  id v6 = [self->_filterPredicateLock_displayFilterPredicate copy];
  os_unfair_lock_unlock(&self->_filterPredicateLock);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor _immutableDisplays](self, "_immutableDisplays"));
  v40 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor _filterDisplays:usingPredicate:](self, "_filterDisplays:usingPredicate:"));
  os_unfair_lock_lock(&self->_displayLock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_displayLock_displayUUIDKeyToImmutableCADisplay, "allValues"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

  v38 = v7;
  objc_storeStrong((id *)&self->_displayLock_displayUUIDKeyToImmutableCADisplay, v7);
  -[NSMutableDictionary removeAllObjects](self->_displayLock_displayIndexToDisplayUUID, "removeAllObjects");
  displayLock_displayUUIDKeyToImmutableCADisplay = self->_displayLock_displayUUIDKeyToImmutableCADisplay;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_10006145C;
  v61[3] = &unk_1000B7A68;
  v61[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( displayLock_displayUUIDKeyToImmutableCADisplay,  "enumerateKeysAndObjectsUsingBlock:",  v61);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion context](self->_displayLock_observerAssertion, "context"));
  id v14 = [v13 copy];

  os_unfair_lock_unlock(&self->_displayLock);
  id v44 = [v11 mutableCopy];
  [v44 intersectSet:v9];
  id v43 = [v11 mutableCopy];
  [v43 minusSet:v9];
  double v37 = v9;
  id v15 = [v9 mutableCopy];
  __int16 v36 = v11;
  [v15 minusSet:v11];
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v14;
  id v16 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v58;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(obj);
        }
        __int128 v20 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        id v21 = v43;
        id v22 = [v21 countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v54;
          do
          {
            for (j = 0LL; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v54 != v24) {
                objc_enumerationMutation(v21);
              }
              [v20 monitor:self displayDidBecomeActive:*(void *)(*((void *)&v53 + 1) + 8 * (void)j)];
            }

            id v23 = [v21 countByEnumeratingWithState:&v53 objects:v64 count:16];
          }

          while (v23);
        }

        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        id v26 = v15;
        id v27 = [v26 countByEnumeratingWithState:&v49 objects:v63 count:16];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v50;
          do
          {
            for (k = 0LL; k != v28; k = (char *)k + 1)
            {
              if (*(void *)v50 != v29) {
                objc_enumerationMutation(v26);
              }
              [v20 monitor:self displayDidBecomeInactive:*(void *)(*((void *)&v49 + 1) + 8 * (void)k)];
            }

            id v28 = [v26 countByEnumeratingWithState:&v49 objects:v63 count:16];
          }

          while (v28);
        }

        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v31 = v44;
        id v32 = [v31 countByEnumeratingWithState:&v45 objects:v62 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v46;
          do
          {
            for (m = 0LL; m != v33; m = (char *)m + 1)
            {
              if (*(void *)v46 != v34) {
                objc_enumerationMutation(v31);
              }
              [v20 monitor:self activeDisplayPropertiesDidChange:*(void *)(*((void *)&v45 + 1) + 8 * (void)m)];
            }

            id v33 = [v31 countByEnumeratingWithState:&v45 objects:v62 count:16];
          }

          while (v33);
        }
      }

      id v17 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    }

    while (v17);
  }
}

- (void).cxx_destruct
{
}

@end