@interface MSDComponent
- (BOOL)forRemoval;
- (BOOL)result;
- (BOOL)rollbackOperations;
- (MSDComponent)initWithName:(id)a3 andOperations:(id)a4;
- (MSDComponentObserver)observer;
- (NSMutableOrderedSet)activeOperations;
- (NSMutableOrderedSet)finishedOperations;
- (NSMutableOrderedSet)removeOperations;
- (NSMutableOrderedSet)stagedOperations;
- (NSString)description;
- (NSString)name;
- (id)_cloneComponent;
- (id)_cloneOperations:(id)a3;
- (id)_handleRetryableOperation:(id)a3;
- (id)activateStagedOperations;
- (id)createRemovableCounterpartComponent;
- (id)errors;
- (id)finishedOperationContexts;
- (id)setupIntraComponentDependency:(BOOL)a3;
- (int64_t)retryCount;
- (os_unfair_lock_s)componentLock;
- (unint64_t)diskSpaceRequired;
- (void)_addStagedOperation:(id)a3 forRollback:(BOOL)a4;
- (void)_addStagedOperations:(id)a3 forRollback:(BOOL)a4;
- (void)_cancelRemainingOperations;
- (void)_estimateDiskSpaceRequirementFromOperations:(id)a3;
- (void)_handleActiveOperationsDepleted;
- (void)_handleCancelledOperation:(id)a3;
- (void)_handleFailedOperation:(id)a3;
- (void)_handleSkippedOperation:(id)a3;
- (void)_handleSuccessfulOperation:(id)a3;
- (void)_rollbackFinishedOperations;
- (void)addInstallDependency:(id)a3;
- (void)addObserver:(id)a3;
- (void)addRemoveOperations:(id)a3;
- (void)discardStagedOperationsAndTriggerCompletion;
- (void)operation:(id)a3 didProduceNewOperation:(id)a4 forRollback:(BOOL)a5;
- (void)operationWillFinish:(id)a3;
- (void)setActiveOperations:(id)a3;
- (void)setComponentLock:(os_unfair_lock_s)a3;
- (void)setDiskSpaceRequired:(unint64_t)a3;
- (void)setFinishedOperations:(id)a3;
- (void)setForRemoval:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setObserver:(id)a3;
- (void)setRemoveOperations:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setRollbackOperations:(BOOL)a3;
- (void)setStagedOperations:(id)a3;
@end

@implementation MSDComponent

- (MSDComponent)initWithName:(id)a3 andOperations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MSDComponent;
  v8 = -[MSDComponent init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDComponent setName:](v8, "setName:", v6);
    -[MSDComponent setRetryCount:](v9, "setRetryCount:", 3LL);
    -[MSDComponent setForRemoval:](v9, "setForRemoval:", 0LL);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    -[MSDComponent setRemoveOperations:](v9, "setRemoveOperations:", v10);

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    -[MSDComponent setStagedOperations:](v9, "setStagedOperations:", v11);

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    -[MSDComponent setActiveOperations:](v9, "setActiveOperations:", v12);

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    -[MSDComponent setFinishedOperations:](v9, "setFinishedOperations:", v13);

    -[MSDComponent _addStagedOperations:forRollback:](v9, "_addStagedOperations:forRollback:", v7, 0LL);
    -[MSDComponent _estimateDiskSpaceRequirementFromOperations:](v9, "_estimateDiskSpaceRequirementFromOperations:", v7);
    -[MSDComponent setObserver:](v9, "setObserver:", 0LL);
    -[MSDComponent setComponentLock:](v9, "setComponentLock:", 0LL);
  }

  return v9;
}

- (BOOL)result
{
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (([v9 result] & 1) == 0 && !objc_msgSend(v9, "skipped"))
        {
          BOOL v10 = 0;
          goto LABEL_12;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = 1;
LABEL_12:

  os_unfair_lock_unlock(p_componentLock);
  return v10;
}

- (id)finishedOperationContexts
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) context]);
        if (v10) {
          -[NSMutableSet addObject:](v3, "addObject:", v10);
        }

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_componentLock);
  return v3;
}

- (id)errors
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);

        if (v11)
        {
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
          -[NSMutableArray addObject:](v3, "addObject:", v12);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  os_unfair_lock_unlock(p_componentLock);
  return v3;
}

- (void)addObserver:(id)a3
{
  p_componentLock = &self->_componentLock;
  id v5 = a3;
  os_unfair_lock_lock(p_componentLock);
  -[MSDComponent setObserver:](self, "setObserver:", v5);

  os_unfair_lock_unlock(p_componentLock);
}

- (void)addRemoveOperations:(id)a3
{
  p_componentLock = &self->_componentLock;
  id v5 = a3;
  os_unfair_lock_lock(p_componentLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent removeOperations](self, "removeOperations"));
  [v6 addObjectsFromArray:v5];

  os_unfair_lock_unlock(p_componentLock);
}

- (id)activateStagedOperations
{
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  id v5 = [v4 copy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  [v6 removeAllObjects];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  [v7 unionOrderedSet:v5];

  os_unfair_lock_unlock(p_componentLock);
  return v5;
}

- (id)createRemovableCounterpartComponent
{
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent removeOperations](self, "removeOperations"));
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___MSDComponent);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent name](self, "name"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent removeOperations](self, "removeOperations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 array]);
    BOOL v10 = -[MSDComponent initWithName:andOperations:](v6, "initWithName:andOperations:", v7, v9);

    -[MSDComponent setForRemoval:](v10, "setForRemoval:", 1LL);
  }

  else
  {
    BOOL v10 = 0LL;
  }

  os_unfair_lock_unlock(p_componentLock);
  return v10;
}

- (id)setupIntraComponentDependency:(BOOL)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  os_unfair_lock_t lock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  id v5 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v53;
    v35 = v4;
    uint64_t v37 = *(void *)v53;
    do
    {
      uint64_t v8 = 0LL;
      id v38 = v6;
      do
      {
        if (*(void *)v53 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v8);
        if ([v9 type] == (id)1)
        {
          v42 = v8;
          BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 context]);
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 uniqueName]);

          v41 = (void *)v11;
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v11));
          v43 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableArray addObject:](v43, "addObject:", v9);
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 dependents]);
          id v13 = [v12 countByEnumeratingWithState:&v48 objects:v61 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v49;
            while (2)
            {
              for (i = 0LL; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v49 != v15) {
                  objc_enumerationMutation(v12);
                }
                __int128 v17 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
                if ([v17 type] == (id)2)
                {
                  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 context]);
                  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 context]);

                  if (v18 == v19)
                  {
                    -[NSMutableArray addObject:](v43, "addObject:", v17);
                    __int128 v46 = 0u;
                    __int128 v47 = 0u;
                    __int128 v44 = 0u;
                    __int128 v45 = 0u;
                    v20 = (void *)objc_claimAutoreleasedReturnValue([v17 dependents]);
                    id v21 = [v20 countByEnumeratingWithState:&v44 objects:v60 count:16];
                    if (v21)
                    {
                      id v22 = v21;
                      uint64_t v23 = *(void *)v45;
                      while (2)
                      {
                        for (j = 0LL; j != v22; j = (char *)j + 1)
                        {
                          if (*(void *)v45 != v23) {
                            objc_enumerationMutation(v20);
                          }
                          v25 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)j);
                          if ([v25 type] == (id)3)
                          {
                            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 context]);
                            v27 = (void *)objc_claimAutoreleasedReturnValue([v17 context]);

                            if (v26 == v27)
                            {
                              -[NSMutableArray addObject:](v43, "addObject:", v25);
                              goto LABEL_28;
                            }
                          }
                        }

                        id v22 = [v20 countByEnumeratingWithState:&v44 objects:v60 count:16];
                        if (v22) {
                          continue;
                        }
                        break;
                      }
                    }

- (void)addInstallDependency:(id)a3
{
  id v4 = a3;
  v27 = self;
  os_unfair_lock_t lock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  v25 = v4;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 stagedOperations]);
  id v5 = [obj countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    uint64_t v26 = *(void *)v36;
    do
    {
      uint64_t v8 = 0LL;
      id v28 = v6;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v8);
        if ([v9 type] == (id)3)
        {
          BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
          if (![v10 isEqualToString:@"MSDProvisioningProfileInstallOperation"])
          {

LABEL_11:
            BOOL v30 = v8;
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](v27, "stagedOperations"));
            id v13 = [v12 countByEnumeratingWithState:&v31 objects:v47 count:16];
            if (!v13) {
              goto LABEL_27;
            }
            id v14 = v13;
            uint64_t v15 = *(void *)v32;
            while (2)
            {
              uint64_t v16 = 0LL;
LABEL_14:
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v12);
              }
              __int128 v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
              if ([v17 type] == (id)3
                && ([v17 runInstallInParallel] & 1) == 0)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
                if ([v18 isEqualToString:@"MSDProvisioningProfileInstallOperation"])
                {
                  unsigned __int8 v19 = [v17 isLeaf];

                  if ((v19 & 1) == 0) {
                    goto LABEL_25;
                  }
                }

                else
                {
                }

                id v20 = sub_10003A95C();
                id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  id v22 = (void *)objc_claimAutoreleasedReturnValue([v17 component]);
                  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 component]);
                  *(_DWORD *)buf = 138413058;
                  v40 = v17;
                  __int16 v41 = 2112;
                  v42 = v22;
                  __int16 v43 = 2112;
                  __int128 v44 = v9;
                  __int16 v45 = 2112;
                  __int128 v46 = v23;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Setting up install dependency: %@(%@) -> %@(%@)",  buf,  0x2Au);
                }

                [v17 addDependency:v9];
              }

- (void)discardStagedOperationsAndTriggerCompletion
{
  p_componentLock = &self->_componentLock;
  os_unfair_lock_lock(&self->_componentLock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) cancel];
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  [v9 unionOrderedSet:v10];

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  [v11 removeAllObjects];

  -[MSDComponent _handleActiveOperationsDepleted](self, "_handleActiveOperationsDepleted");
  os_unfair_lock_unlock(p_componentLock);
}

- (void)operationWillFinish:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    __int128 v17 = self;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Operation will finish: %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  os_unfair_lock_lock(&self->_componentLock);
  if (([v4 isCancelled] & 1) == 0)
  {
    if ([v4 type] == (id)5)
    {
      os_unfair_lock_unlock(&self->_componentLock);
      uint64_t v7 = 0LL;
LABEL_7:
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent observer](self, "observer"));
      [v8 componentDidComplete:self];
LABEL_8:

      goto LABEL_9;
    }

    if ([v4 result])
    {
      -[MSDComponent _handleSuccessfulOperation:](self, "_handleSuccessfulOperation:", v4);
    }

    else if ([v4 skipped])
    {
      -[MSDComponent _handleSkippedOperation:](self, "_handleSkippedOperation:", v4);
    }

    else
    {
      if ([v4 retryable])
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent _handleRetryableOperation:](self, "_handleRetryableOperation:", v4));
        goto LABEL_18;
      }

      -[MSDComponent _handleFailedOperation:](self, "_handleFailedOperation:", v4);
    }

    uint64_t v7 = 0LL;
LABEL_18:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
    id v10 = [v9 count];

    if (v10)
    {
      os_unfair_lock_unlock(&self->_componentLock);
      if (!v7)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent observer](self, "observer"));
        [v8 componentDidHaveNewOperationStaged:self];
        goto LABEL_8;
      }

      BOOL v11 = 0;
    }

    else
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
      if ([v12 count])
      {
        BOOL v11 = 0;
      }

      else
      {
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
        BOOL v11 = [v13 count] == 0;
      }

      os_unfair_lock_unlock(&self->_componentLock);
      if (!v7)
      {
LABEL_29:
        if (!v11) {
          goto LABEL_9;
        }
        goto LABEL_7;
      }
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent observer](self, "observer"));
    [v14 component:self didProduceClonedComponent:v7];

    if (v10)
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent observer](self, "observer"));
      [v15 componentDidHaveNewOperationStaged:self];

      if (!v11) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }

    goto LABEL_29;
  }

  -[MSDComponent _handleCancelledOperation:](self, "_handleCancelledOperation:", v4);
  os_unfair_lock_unlock(&self->_componentLock);
  uint64_t v7 = 0LL;
LABEL_9:
}

- (void)operation:(id)a3 didProduceNewOperation:(id)a4 forRollback:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = sub_10003A95C();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543874;
    __int128 v12 = self;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 1024;
    BOOL v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: New operation produced: %{public}@ rollback: %{BOOL}d",  (uint8_t *)&v11,  0x1Cu);
  }

  os_unfair_lock_lock(&self->_componentLock);
  -[MSDComponent _addStagedOperation:forRollback:](self, "_addStagedOperation:forRollback:", v7, v5);
  os_unfair_lock_unlock(&self->_componentLock);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent observer](self, "observer"));
  [v10 componentDidHaveNewOperationStaged:self];
}

- (void)_addStagedOperations:(id)a3 forRollback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[MSDComponent _addStagedOperation:forRollback:]( self,  "_addStagedOperation:forRollback:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  v4);
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)_addStagedOperation:(id)a3 forRollback:(BOOL)a4
{
  id v7 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  [v6 addObject:v7];

  if (!a4)
  {
    [v7 associateWithComponent:self];
    [v7 addObserver:self];
  }
}

- (void)_estimateDiskSpaceRequirementFromOperations:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) context]);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueName]);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 diskSpacedRequired]);
        if (v13)
        {
          __int128 v14 = (void *)v13;
          unsigned __int8 v15 = [v4 containsObject:v12];

          if ((v15 & 1) == 0)
          {
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v11 diskSpacedRequired]);
            v8 += (uint64_t)[v16 unsignedLongLongValue];

            [v4 addObject:v12];
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  -[MSDComponent setDiskSpaceRequired:](self, "setDiskSpaceRequired:", v8);
}

- (id)_cloneComponent
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent stagedOperations](self, "stagedOperations"));
  -[NSMutableOrderedSet unionOrderedSet:](v3, "unionOrderedSet:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  -[NSMutableOrderedSet unionOrderedSet:](v3, "unionOrderedSet:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v3, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent _cloneOperations:](self, "_cloneOperations:", v6));

  uint64_t v8 = objc_alloc(&OBJC_CLASS___MSDComponent);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent name](self, "name"));
  id v10 = -[MSDComponent initWithName:andOperations:](v8, "initWithName:andOperations:", v9, v7);

  -[MSDComponent setRetryCount:](v10, "setRetryCount:", -[MSDComponent retryCount](self, "retryCount"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  id v12 = [v11 mutableCopy];
  -[MSDComponent setFinishedOperations:](v10, "setFinishedOperations:", v12);

  return v10;
}

- (id)_cloneOperations:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v3 count])
  {
    unint64_t v6 = 0LL;
    do
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:v6]);
      uint64_t v9 = (objc_class *)objc_opt_class(v7, v8);
      id v10 = NSStringFromClass(v9);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 context]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[MSDOperationRepository createOperationFromIdentifier:withContext:]( &OBJC_CLASS___MSDOperationRepository,  "createOperationFromIdentifier:withContext:",  v11,  v12));

      -[NSMutableArray addObject:](v5, "addObject:", v13);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 hash]));
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, v15);

      ++v6;
    }

    while ((unint64_t)[v3 count] > v6);
  }

  if (-[NSMutableArray count](v5, "count"))
  {
    uint64_t v16 = 0LL;
    id v28 = v3;
    do
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v5, "objectAtIndex:", v16, v28));
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      uint64_t v29 = v16;
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:v16]);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dependencies]);

      id v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          uint64_t v23 = 0LL;
          do
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(*((void *)&v30 + 1) + 8 * (void)v23) hash]));
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v24));

            if (v25)
            {
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v5, "objectAtIndex:", (int)[v25 intValue]));
              [v17 addDependency:v26];
            }

            uint64_t v23 = (char *)v23 + 1;
          }

          while (v21 != v23);
          id v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }

        while (v21);
      }

      uint64_t v16 = v29 + 1;
      id v3 = v28;
    }

    while ((unint64_t)-[NSMutableArray count](v5, "count") > v29 + 1);
  }

  return v5;
}

- (void)_cancelRemainingOperations
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  id v3 = [v2 mutableCopy];

  __int128 v14 = v3;
  if ([v3 count])
  {
    do
    {
      BOOL v4 = objc_autoreleasePoolPush();
      id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v6 = v14;
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            __int128 v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
            if ([v11 isAllDependentInComponentCancelled])
            {
              id v12 = sub_10003A95C();
              uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v20 = v11;
                _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Cancelling operation: %{public}@",  buf,  0xCu);
              }

              [v11 cancel];
            }
          }

          id v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
        }

        while (v8);
      }

      [v6 minusSet:v5];
      objc_autoreleasePoolPop(v4);
    }

    while ([v6 count]);
  }
}

- (void)_rollbackFinishedOperations
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  id v4 = [v3 copy];

  -[MSDComponent setRollbackOperations:](self, "setRollbackOperations:", 1LL);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v9);
        id v11 = sub_10003A95C();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          __int128 v18 = v10;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Rolling back finished operation: %@",  buf,  0xCu);
        }

        [v10 rollback];
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }

    while (v7);
  }
}

- (void)_handleActiveOperationsDepleted
{
  if (!-[MSDComponent forRemoval](self, "forRemoval"))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___MSDOperationContext);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent name](self, "name"));
    -[MSDOperationContext setIdentifier:](v3, "setIdentifier:", v4);

    id v5 = (id)objc_claimAutoreleasedReturnValue( +[MSDOperationRepository createOperationFromIdentifier:withContext:]( &OBJC_CLASS___MSDOperationRepository,  "createOperationFromIdentifier:withContext:",  @"MSDComponentCompleteOperation",  v3));
    -[MSDComponent _addStagedOperation:forRollback:](self, "_addStagedOperation:forRollback:", v5, 0LL);
  }

- (void)_handleSuccessfulOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100099A70();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  [v7 removeObject:v4];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  [v8 addObject:v4];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  id v10 = [v9 count];

  if (!v10) {
    -[MSDComponent _handleActiveOperationsDepleted](self, "_handleActiveOperationsDepleted");
  }
}

- (void)_handleFailedOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100099AD0();
  }

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    unsigned int v8 = [v7 pauseContentUpdateOnError];

    if (v8)
    {
      do
      {
        id v9 = sub_10003A95C();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 v18 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Pausing content update as requested. Will check the value again in 30s.",  v18,  2u);
        }

        sleep(0x1Eu);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
        unsigned __int8 v12 = [v11 pauseContentUpdateOnError];
      }

      while ((v12 & 1) != 0);
    }
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  [v13 removeObject:v4];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  [v14 addObject:v4];

  -[MSDComponent _cancelRemainingOperations](self, "_cancelRemainingOperations");
  -[MSDComponent _rollbackFinishedOperations](self, "_rollbackFinishedOperations");
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent finishedOperations](self, "finishedOperations"));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  [v15 unionOrderedSet:v16];

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent activeOperations](self, "activeOperations"));
  [v17 removeAllObjects];

  -[MSDComponent _handleActiveOperationsDepleted](self, "_handleActiveOperationsDepleted");
}

- (id)_handleRetryableOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100099B30();
  }

  -[MSDComponent setRetryCount:](self, "setRetryCount:", (char *)-[MSDComponent retryCount](self, "retryCount") - 1);
  if (-[MSDComponent retryCount](self, "retryCount") <= 0)
  {
    id v8 = sub_10003A95C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      unsigned __int8 v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Component retry count exhausted.",  (uint8_t *)&v11,  0xCu);
    }

    -[MSDComponent _handleFailedOperation:](self, "_handleFailedOperation:", v4);
    id v7 = 0LL;
  }

  else
  {
    -[MSDComponent _cancelRemainingOperations](self, "_cancelRemainingOperations");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent _cloneComponent](self, "_cloneComponent"));
  }

  return v7;
}

- (void)_handleSkippedOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100099B90();
  }

  -[MSDComponent _handleSuccessfulOperation:](self, "_handleSuccessfulOperation:", v4);
}

- (void)_handleCancelledOperation:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100099BF0();
  }

  if (-[MSDComponent rollbackOperations](self, "rollbackOperations"))
  {
    id v7 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Rolling back cancelled operation: %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    [v4 rollback];
  }
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponent name](self, "name"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: Name: %@>",  v5,  v6));

  return (NSString *)v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)forRemoval
{
  return self->_forRemoval;
}

- (void)setForRemoval:(BOOL)a3
{
  self->_forRemoval = a3;
}

- (unint64_t)diskSpaceRequired
{
  return self->_diskSpaceRequired;
}

- (void)setDiskSpaceRequired:(unint64_t)a3
{
  self->_diskSpaceRequired = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)rollbackOperations
{
  return self->_rollbackOperations;
}

- (void)setRollbackOperations:(BOOL)a3
{
  self->_rollbackOperations = a3;
}

- (NSMutableOrderedSet)removeOperations
{
  return self->_removeOperations;
}

- (void)setRemoveOperations:(id)a3
{
}

- (NSMutableOrderedSet)stagedOperations
{
  return self->_stagedOperations;
}

- (void)setStagedOperations:(id)a3
{
}

- (NSMutableOrderedSet)activeOperations
{
  return self->_activeOperations;
}

- (void)setActiveOperations:(id)a3
{
}

- (NSMutableOrderedSet)finishedOperations
{
  return self->_finishedOperations;
}

- (void)setFinishedOperations:(id)a3
{
}

- (MSDComponentObserver)observer
{
  return (MSDComponentObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
}

- (os_unfair_lock_s)componentLock
{
  return self->_componentLock;
}

- (void)setComponentLock:(os_unfair_lock_s)a3
{
  self->_componentLock = a3;
}

- (void).cxx_destruct
{
}

@end