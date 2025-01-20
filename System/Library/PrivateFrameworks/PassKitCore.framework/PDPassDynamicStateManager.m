@interface PDPassDynamicStateManager
- (PDPassDynamicStateManager)init;
- (PDPassDynamicStateManager)initWithDatabaseManager:(id)a3;
- (PDPassDynamicStateManagerObserver)observer;
- (id)_passDynamicStateFromState:(id)a3;
- (id)passDynamicStateForUniqueIdentifier:(id)a3;
- (id)passDynamicStatesFromStates:(id)a3;
- (void)_process;
- (void)setDidUpdateDynamicStateForPassUniqueID:(id)a3;
- (void)setDidUpdateDynamicStatesForPassUniqueIDs:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation PDPassDynamicStateManager

- (PDPassDynamicStateManager)init
{
  return 0LL;
}

- (PDPassDynamicStateManager)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDPassDynamicStateManager;
  v6 = -[PDPassDynamicStateManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_databaseManager, a3);
  }

  return v7;
}

- (void)setDidUpdateDynamicStateForPassUniqueID:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  -[PDPassDynamicStateManager setDidUpdateDynamicStatesForPassUniqueIDs:]( self,  "setDidUpdateDynamicStatesForPassUniqueIDs:",  v5,  v6);
}

- (void)setDidUpdateDynamicStatesForPassUniqueIDs:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock(&self->_lock);
    uniqueIDs = self->_uniqueIDs;
    if (uniqueIDs)
    {
      -[NSMutableSet addObjectsFromArray:](uniqueIDs, "addObjectsFromArray:", v5);
      os_unfair_lock_unlock(&self->_lock);
    }

    else
    {
      v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v8 = self->_uniqueIDs;
      self->_uniqueIDs = v7;

      -[NSMutableSet addObjectsFromArray:](self->_uniqueIDs, "addObjectsFromArray:", v5);
      os_unfair_lock_unlock(&self->_lock);
      id v9 = PDHeavyQueue();
      v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100301D84;
      block[3] = &unk_100639300;
      block[4] = self;
      dispatch_async(v10, block);
    }
  }

  else
  {
    __break(1u);
  }

- (void)_process
{
  p_lock = &self->_lock;
  location = (id *)&self->_observer;
  for (i = &self->_lock; ; p_lock = i)
  {
    os_unfair_lock_lock(p_lock);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_uniqueIDs, "allObjects"));
    id v5 = [v4 count];
    uniqueIDs = self->_uniqueIDs;
    if (v5)
    {
      -[NSMutableSet removeAllObjects](uniqueIDs, "removeAllObjects");
      if (-[NSMutableSet count](self->_uniqueIDs, "count")) {
        __break(1u);
      }
    }

    else
    {
      self->_uniqueIDs = 0LL;
    }

    os_unfair_lock_unlock(p_lock);
    if (![v4 count]) {
      break;
    }
    v7 = objc_autoreleasePoolPush();
    v8 = (void *)PDOSTransactionCreate("PDPassDynamicStateManager.stateConstruction");
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)j);
          v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDPassDynamicStateManager passDynamicStateForUniqueIdentifier:]( self,  "passDynamicStateForUniqueIdentifier:",  v15,  location));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v15);
        }

        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v12);
    }

    id WeakRetained = objc_loadWeakRetained(location);
    [WeakRetained dynamicStateManager:self dynamicStatesDidUpdate:v9];

    objc_autoreleasePoolPop(v7);
  }
}

- (id)_passDynamicStateFromState:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[PKPassDynamicState alloc] _init];
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 liveRender]);
    [v4 setLiveRender:v5];

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 balanceModel]);
    [v4 setBalanceModel:v6];

    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 relevancyModel]);
    [v4 setRelevancyModel:v7];
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)passDynamicStateForUniqueIdentifier:(id)a3
{
  id v4 = sub_1001B4DA8(&self->_databaseManager->super.isa, (uint64_t)a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassDynamicStateManager _passDynamicStateFromState:](self, "_passDynamicStateFromState:", v5));

  return v6;
}

- (id)passDynamicStatesFromStates:(id)a3
{
  id v4 = a3;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_10030211C;
  id v11 = &unk_100655BA8;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v13 = self;
  id v5 = v12;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = -[NSMutableDictionary copy](v5, "copy", v8, v9, v10, v11);
  return v6;
}

- (PDPassDynamicStateManagerObserver)observer
{
  return (PDPassDynamicStateManagerObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end