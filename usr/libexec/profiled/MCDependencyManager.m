@interface MCDependencyManager
+ (id)sharedManager;
- (NSMutableDictionary)memberQueueSystemOrphansDict;
- (NSMutableDictionary)memberQueueUserOrphansDict;
- (id)_init;
- (id)memberQueueOrphanedParentsInSystemDomain:(id)a3;
- (id)memberQueueOrphanedParentsInUserDomain:(id)a3;
- (id)orphanedParentsForDomain:(id)a3;
- (id)orphanedParentsForSystemDomain:(id)a3;
- (id)orphanedParentsForUserDomain:(id)a3;
- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5;
- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6;
- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8;
- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7;
- (void)commitChanges;
- (void)commitChangesCompletion:(id)a3;
- (void)memberQueueAddDependent:(id)a3 toParent:(id)a4 inDomain:(id)a5;
- (void)memberQueueAddDependent:(id)a3 toParent:(id)a4 inDomain:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7;
- (void)memberQueueAddOrphanParent:(id)a3 inDomain:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6;
- (void)memberQueueRemoveDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5;
- (void)memberQueueRemoveDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 fromSystem:(BOOL)a6 user:(BOOL)a7;
- (void)memberQueueRemoveOrphanParent:(id)a3 inDomain:(id)a4 fromSystem:(BOOL)a5 user:(BOOL)a6;
- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5;
- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 fromSystem:(BOOL)a6 user:(BOOL)a7;
- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6;
- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6 fromSystem:(BOOL)a7 user:(BOOL)a8;
- (void)setMemberQueueSystemOrphansDict:(id)a3;
- (void)setMemberQueueUserOrphansDict:(id)a3;
@end

@implementation MCDependencyManager

+ (id)sharedManager
{
  return [a1 sharedReader];
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCDependencyManager;
  v2 = -[MCDependencyManager _init](&v8, "_init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4 = (void *)v2[1];
    v2[1] = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v6 = (void *)v2[2];
    v2[2] = v5;
  }

  return v2;
}

- (void)commitChanges
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000579D8;
  v4[3] = &unk_1000C29D0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  v3 = v5;
  -[MCDependencyManager commitChangesCompletion:](self, "commitChangesCompletion:", v4);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)commitChangesCompletion:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Committing dependency changes to disk.", buf, 2u);
  }

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100057ABC;
  v8[3] = &unk_1000C2EA8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)memberQueueAddOrphanParent:(id)a3 inDomain:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (v7)
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138543618;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Adding parent %{public}@ to domain %{public}@ orphan list.",  (uint8_t *)&v20,  0x16u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemOrphansDict](self, "memberQueueSystemOrphansDict"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

    if (!v14)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemOrphansDict](self, "memberQueueSystemOrphansDict"));
      [v15 setObject:v14 forKeyedSubscript:v11];
    }

    [v14 addObject:v10];
  }

  if (v6)
  {
    v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138543618;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Adding parent %{public}@ to domain %{public}@ orphan list.",  (uint8_t *)&v20,  0x16u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserOrphansDict](self, "memberQueueUserOrphansDict"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v11]);

    if (!v18)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserOrphansDict](self, "memberQueueUserOrphansDict"));
      [v19 setObject:v18 forKeyedSubscript:v11];
    }

    [v18 addObject:v10];
  }
}

- (void)memberQueueRemoveOrphanParent:(id)a3 inDomain:(id)a4 fromSystem:(BOOL)a5 user:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (v7)
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138543618;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Removing parent %{public}@ from domain %{public}@ orphan list.",  (uint8_t *)&v20,  0x16u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemOrphansDict](self, "memberQueueSystemOrphansDict"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

    if (v14)
    {
      [v14 removeObject:v10];
      if (![v14 count])
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemOrphansDict](self, "memberQueueSystemOrphansDict"));
        [v15 removeObjectForKey:v11];
      }
    }
  }

  if (v6)
  {
    v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138543618;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Removing parent %{public}@ from domain %{public}@ orphan list.",  (uint8_t *)&v20,  0x16u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserOrphansDict](self, "memberQueueUserOrphansDict"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v11]);

    if (v18)
    {
      [v18 removeObject:v10];
      if (![v18 count])
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserOrphansDict](self, "memberQueueUserOrphansDict"));
        [v19 removeObjectForKey:v11];
      }
    }
  }
}

- (id)orphanedParentsForDomain:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000580EC;
  v16 = sub_1000580FC;
  id v17 = 0LL;
  dispatch_semaphore_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058104;
  block[3] = &unk_1000C3AC0;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)orphanedParentsForSystemDomain:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000580EC;
  v16 = sub_1000580FC;
  id v17 = 0LL;
  dispatch_semaphore_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000582F4;
  block[3] = &unk_1000C3AE8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)orphanedParentsForUserDomain:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000580EC;
  v16 = sub_1000580FC;
  id v17 = 0LL;
  dispatch_semaphore_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058450;
  block[3] = &unk_1000C3AE8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)memberQueueOrphanedParentsInSystemDomain:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemOrphansDict](self, "memberQueueSystemOrphansDict"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (id)memberQueueOrphanedParentsInUserDomain:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserOrphansDict](self, "memberQueueUserOrphansDict"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5
{
}

- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = v14;
  if (v12 && v13 && v14)
  {
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000586F8;
    block[3] = &unk_1000C3B10;
    block[4] = self;
    id v19 = v12;
    id v20 = v13;
    id v21 = v15;
    BOOL v22 = a6;
    BOOL v23 = a7;
    dispatch_sync(v16, block);
  }

  else
  {
    id v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v25 = v12;
      __int16 v26 = 2114;
      id v27 = v13;
      __int16 v28 = 2114;
      v29 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Attempting to add dependent %{public}@ to parent %{public}@ in domain %{public}@. Ignoring.",  buf,  0x20u);
    }
  }
}

- (void)memberQueueAddDependent:(id)a3 toParent:(id)a4 inDomain:(id)a5
{
}

- (void)memberQueueAddDependent:(id)a3 toParent:(id)a4 inDomain:(id)a5 toSystem:(BOOL)a6 user:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v8)
  {
    v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      int v25 = 138543874;
      id v26 = v12;
      __int16 v27 = 2114;
      id v28 = v13;
      __int16 v29 = 2114;
      id v30 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Adding dependent %{public}@ to parent %{public}@ in domain %{public}@ to system",  (uint8_t *)&v25,  0x20u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v14]);

    if (!v17)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict"));
      [v18 setObject:v17 forKeyedSubscript:v14];
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v13]);
    if (!v19)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      [v17 setObject:v19 forKeyedSubscript:v13];
    }

    [v19 addObject:v12];
  }

  if (v7)
  {
    id v20 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      int v25 = 138543874;
      id v26 = v12;
      __int16 v27 = 2114;
      id v28 = v13;
      __int16 v29 = 2114;
      id v30 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Adding dependent %{public}@ to parent %{public}@ in domain %{public}@ to user",  (uint8_t *)&v25,  0x20u);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict"));
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v14]);

    if (!v22)
    {
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict"));
      [v23 setObject:v22 forKeyedSubscript:v14];
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v13]);
    if (!v24)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      [v22 setObject:v24 forKeyedSubscript:v13];
    }

    [v24 addObject:v12];
  }

  -[MCDependencyManager memberQueueRemoveOrphanParent:inDomain:fromSystem:user:]( self,  "memberQueueRemoveOrphanParent:inDomain:fromSystem:user:",  v13,  v14,  v8,  v7);
}

- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5
{
}

- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 fromSystem:(BOOL)a6 user:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = v14;
  if (v12 && v13 && v14)
  {
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100058B9C;
    block[3] = &unk_1000C3B10;
    block[4] = self;
    id v19 = v13;
    id v20 = v15;
    id v21 = v12;
    BOOL v22 = a6;
    BOOL v23 = a7;
    dispatch_sync(v16, block);
  }

  else
  {
    id v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v25 = v12;
      __int16 v26 = 2114;
      id v27 = v13;
      __int16 v28 = 2114;
      __int16 v29 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Attempting to remove dependent %{public}@ from parent %{public}@ in domain %{public}@. Ignoring.",  buf,  0x20u);
    }
  }
}

- (void)memberQueueRemoveDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5
{
}

- (void)memberQueueRemoveDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 fromSystem:(BOOL)a6 user:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v8)
  {
    v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      int v29 = 138543874;
      id v30 = v12;
      __int16 v31 = 2114;
      id v32 = v13;
      __int16 v33 = 2114;
      id v34 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Removing dependent %{public}@ from parent %{public}@ in domain %{public}@ from system",  (uint8_t *)&v29,  0x20u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v14]);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v13]);
      id v19 = v18;
      if (v18)
      {
        id v20 = [v18 indexOfObject:v12];
        if (v20 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          [v19 removeObjectAtIndex:v20];
          if (![v19 count])
          {
            [v17 removeObjectForKey:v13];
            -[MCDependencyManager memberQueueAddOrphanParent:inDomain:toSystem:user:]( self,  "memberQueueAddOrphanParent:inDomain:toSystem:user:",  v13,  v14,  1LL,  0LL);
            if (![v17 count])
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueSystemDomainsDict](self, "memberQueueSystemDomainsDict"));
              [v21 removeObjectForKey:v14];
            }
          }
        }
      }
    }
  }

  if (v7)
  {
    BOOL v22 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      int v29 = 138543874;
      id v30 = v12;
      __int16 v31 = 2114;
      id v32 = v13;
      __int16 v33 = 2114;
      id v34 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Removing dependent %{public}@ from parent %{public}@ in domain %{public}@ from user",  (uint8_t *)&v29,  0x20u);
    }

    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v14]);

    if (v24)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v13]);
      __int16 v26 = v25;
      if (v25)
      {
        id v27 = [v25 indexOfObject:v12];
        if (v27 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          [v26 removeObjectAtIndex:v27];
          if (![v26 count])
          {
            [v24 removeObjectForKey:v13];
            -[MCDependencyManager memberQueueAddOrphanParent:inDomain:toSystem:user:]( self,  "memberQueueAddOrphanParent:inDomain:toSystem:user:",  v13,  v14,  0LL,  1LL);
            if (![v24 count])
            {
              __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueueUserDomainsDict](self, "memberQueueUserDomainsDict"));
              [v28 removeObjectForKey:v14];
            }
          }
        }
      }
    }
  }
}

- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6
{
}

- (void)addDependent:(id)a3 ofParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6 toSystem:(BOOL)a7 user:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000590C4;
  block[3] = &unk_1000C3B38;
  block[4] = self;
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  BOOL v28 = a7;
  BOOL v29 = a8;
  id v27 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_sync(v18, block);
}

- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6
{
}

- (void)removeDependent:(id)a3 fromParent:(id)a4 inDomain:(id)a5 reciprocalDomain:(id)a6 fromSystem:(BOOL)a7 user:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCDependencyManager memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100059238;
  block[3] = &unk_1000C3B38;
  block[4] = self;
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  BOOL v28 = a7;
  BOOL v29 = a8;
  id v27 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_sync(v18, block);
}

- (NSMutableDictionary)memberQueueSystemOrphansDict
{
  return self->_memberQueueSystemOrphansDict;
}

- (void)setMemberQueueSystemOrphansDict:(id)a3
{
}

- (NSMutableDictionary)memberQueueUserOrphansDict
{
  return self->_memberQueueUserOrphansDict;
}

- (void)setMemberQueueUserOrphansDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end