@interface FudStorage
+ (FudStorage)storageWithFile:(id)a3;
- (BOOL)_load;
- (BOOL)_overrideAllowRemoteFindNow;
- (BOOL)_policyAllowsRemoteFind:(id)a3 filter:(id)a4 revision:(id)a5 date:(id)a6;
- (BOOL)isAnyStateMachineActive;
- (BOOL)isAnyStateMachineActiveForPlugin:(id)a3;
- (BOOL)isPluginTracked:(id)a3;
- (BOOL)policyAllowsRemoteFindNow:(id)a3 filter:(id)a4 revision:(id)a5;
- (BOOL)registerClient:(id)a3 withGroup:(id)a4;
- (BOOL)registerClient:(id)a3 withPlugin:(id)a4;
- (BOOL)save;
- (BOOL)setStateMachine:(id)a3 forPlugin:(id)a4 forFilter:(id)a5;
- (BOOL)unregisterClient:(id)a3 fromPlugin:(id)a4;
- (FudStorage)initWithStorageFile:(id)a3;
- (NSMutableDictionary)pluginToPolicy;
- (NSString)storageFile;
- (id)getClientWithName:(id)a3;
- (id)getFiltersInExclusionGroup:(id)a3;
- (id)getPolicyForFilterName:(id)a3;
- (id)getPolicyForPlugin:(id)a3;
- (id)getRegisteredClientsForPlugin:(id)a3;
- (id)getStateMachineForFilterName:(id)a3;
- (void)addPolicy:(id)a3;
- (void)dealloc;
- (void)recordSuccessfulRemoteFindForPolicy:(id)a3 filter:(id)a4 revision:(id)a5 date:(id)a6;
- (void)setPoliciesWithArray:(id)a3;
- (void)setStorageFile:(id)a3;
- (void)unregisterAllClients;
- (void)unregisterClientFromAllPlugins:(id)a3;
@end

@implementation FudStorage

+ (FudStorage)storageWithFile:(id)a3
{
  if ((unint64_t)a3 | qword_10008E340)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100018A5C;
    block[3] = &unk_100074F50;
    block[4] = a3;
    if (qword_10008E348 != -1) {
      dispatch_once(&qword_10008E348, block);
    }
    return (FudStorage *)qword_10008E340;
  }

  else
  {
    FudLog(3LL, @"Can't initialize with nil file to load or save to!");
    id v4 = a1;
    return 0LL;
  }

- (FudStorage)initWithStorageFile:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___FudStorage;
  id v4 = -[FudStorage init](&v6, "init");
  if (v4)
  {
    FudLog(7LL, @"Initializing Storage...");
    v4->storageFile = (NSString *)[a3 copy];
    v4->pluginToClients = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
    v4->pluginToPolicy = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
    v4->pluginToStateMachines = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
    v4->pluginToRemoteCheckDate = 0LL;
    v4->lock = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
  }

  return v4;
}

- (void)addPolicy:(id)a3
{
  if (a3) {
    -[NSMutableDictionary setObject:forKey:]( self->pluginToPolicy,  "setObject:forKey:",  a3,  [a3 pluginName]);
  }
  else {
    FudLog(3LL, @"Can't load NULL policy");
  }
  -[NSRecursiveLock unlock](self->lock, "unlock");
}

- (void)setPoliciesWithArray:(id)a3
{
  if (a3)
  {
    -[NSMutableDictionary removeAllObjects](self->pluginToPolicy, "removeAllObjects");
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(a3);
          }
          -[NSMutableDictionary setObject:forKey:]( self->pluginToPolicy,  "setObject:forKey:",  *(void *)(*((void *)&v9 + 1) + 8 * (void)i),  [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) pluginName]);
        }

        id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }
  }

  else
  {
    FudLog(3LL, @"Can't load NULL policies array");
  }

  -[NSRecursiveLock unlock](self->lock, "unlock");
}

- (void)dealloc
{
  self->storageFile = 0LL;
  self->pluginToPolicy = 0LL;

  self->pluginToClients = 0LL;
  self->pluginToStateMachines = 0LL;

  self->pluginToRemoteCheckDate = 0LL;
  self->lock = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FudStorage;
  -[FudStorage dealloc](&v3, "dealloc");
}

- (id)getPolicyForPlugin:(id)a3
{
  if (a3) {
    a3 = -[NSMutableDictionary objectForKey:](self->pluginToPolicy, "objectForKey:", a3);
  }
  else {
    FudLog(3LL, @"Can't get policy for nil plugin name");
  }
  -[NSRecursiveLock unlock](self->lock, "unlock");
  return a3;
}

- (id)getPolicyForFilterName:(id)a3
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v17 = self;
  id v5 = -[NSMutableDictionary allValues](self->pluginToPolicy, "allValues");
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v11 = [v10 matchingFilters];
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v19;
LABEL_8:
          uint64_t v15 = 0LL;
          while (1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            if (objc_msgSend( objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "filterName"),  "isEqualToString:",  a3)) {
              break;
            }
            if (v13 == (id)++v15)
            {
              id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v13) {
                goto LABEL_8;
              }
              goto LABEL_16;
            }
          }

          if (v10) {
            goto LABEL_19;
          }
        }

- (void)unregisterAllClients
{
}

- (id)getRegisteredClientsForPlugin:(id)a3
{
  if (a3) {
    a3 = -[NSMutableDictionary objectForKey:](self->pluginToClients, "objectForKey:", a3);
  }
  else {
    FudLog(3LL, @"Can't get clients for nil plugin name");
  }
  -[NSRecursiveLock unlock](self->lock, "unlock");
  return a3;
}

- (BOOL)registerClient:(id)a3 withPlugin:(id)a4
{
  if (!a3 || ![a3 name])
  {
    id v15 = a3;
    id v12 = @"Can't register invalid client '%@'";
    goto LABEL_17;
  }

  if (!-[FudStorage isPluginTracked:](self, "isPluginTracked:", a4))
  {
    id v15 = [a3 name];
    id v16 = a4;
    id v12 = @"Client '%@' can't register for unknown plugin '%@'";
LABEL_17:
    uint64_t v13 = 3LL;
LABEL_18:
    FudLog(v13, v12);
    goto LABEL_19;
  }

  id v7 = (NSMutableArray *)-[NSMutableDictionary objectForKey:](self->pluginToClients, "objectForKey:", a4);
  if (!v7)
  {
    id v7 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL);
    -[NSMutableDictionary setObject:forKey:](self->pluginToClients, "setObject:forKey:", v7, a4);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend( objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v11), "name"),  "isEqualToString:",  objc_msgSend(a3, "name")))
        {
          id v15 = [a3 name];
          id v16 = a4;
          id v12 = @"Client is already registered for plugin, preventing double registration. client:%@ plugin:%@";
          uint64_t v13 = 7LL;
          goto LABEL_18;
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  -[NSMutableArray addObject:](v7, "addObject:", a3);
LABEL_19:
  -[NSRecursiveLock unlock](self->lock, "unlock", v15, v16);
  return 1;
}

- (BOOL)registerClient:(id)a3 withGroup:(id)a4
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  pluginToPolicy = self->pluginToPolicy;
  id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( pluginToPolicy,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (!v8) {
    goto LABEL_14;
  }
  id v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v19;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(pluginToPolicy);
      }
      uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
      id v14 = -[NSMutableDictionary objectForKey:](self->pluginToPolicy, "objectForKey:", v13, v17);
      if (v14)
      {
        if ([v14 doesPolicyContainGroup:a4])
        {
          -[FudStorage registerClient:withPlugin:](self, "registerClient:withPlugin:", a3, v13);
          char v10 = 1;
        }
      }

      else
      {
        id v17 = v13;
        FudLog(3LL, @"Error, nil policy for plugin: %@");
      }
    }

    id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( pluginToPolicy,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  }

  while (v9);
  if ((v10 & 1) != 0)
  {
    BOOL v15 = 1;
  }

  else
  {
LABEL_14:
    id v17 = a4;
    FudLog(3LL, @"There are no plugins with group name '%@'");
    BOOL v15 = 0;
  }

  -[NSRecursiveLock unlock](self->lock, "unlock", v17);
  return v15;
}

- (void)unregisterClientFromAllPlugins:(id)a3
{
  id v5 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v26 = self;
  id obj = -[NSMutableDictionary allKeys](self->pluginToClients, "allKeys");
  id v6 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        id v11 = -[NSMutableDictionary objectForKey:](v26->pluginToClients, "objectForKey:", v10);
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v12 = [v11 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v32;
          do
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v32 != v14) {
                objc_enumerationMutation(v11);
              }
              if (objc_msgSend( objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * (void)j), "name"),  "isEqualToString:",  a3)) {
                -[NSMutableArray addObject:](v5, "addObject:", v10);
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v31 objects:v40 count:16];
          }

          while (v13);
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v7);
  }

  if (-[NSMutableArray count](v5, "count"))
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v27,  v39,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (k = 0LL; k != v17; k = (char *)k + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v5);
          }
          uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)k);
          if (-[FudStorage unregisterClient:fromPlugin:](v26, "unregisterClient:fromPlugin:", a3, v20, v23, v24))
          {
            id v23 = a3;
            uint64_t v24 = v20;
            uint64_t v21 = 7LL;
            __int128 v22 = @"Successfully unregistered client '%@' from plugin '%@'";
          }

          else
          {
            id v23 = a3;
            uint64_t v24 = v20;
            uint64_t v21 = 3LL;
            __int128 v22 = @"Failed to unregister client '%@' from plugin '%@', continuing...";
          }

          FudLog(v21, v22);
        }

        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v27,  v39,  16LL);
      }

      while (v17);
    }
  }

  else
  {
    id v23 = a3;
    FudLog(7LL, @"Client '%@' isn't registered for any plugins");
  }

  -[NSRecursiveLock unlock](v26->lock, "unlock", v23);
}

- (BOOL)unregisterClient:(id)a3 fromPlugin:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      if (-[FudStorage isPluginTracked:](self, "isPluginTracked:", a4))
      {
        id v7 = -[NSMutableDictionary objectForKey:](self->pluginToClients, "objectForKey:", a4);
        if (v7)
        {
          uint64_t v8 = v7;
          unint64_t v9 = 0LL;
          if ([v7 count])
          {
            int v10 = 0;
            do
            {
              if (objc_msgSend( objc_msgSend(objc_msgSend(v8, "objectAtIndex:", v9), "name"),  "isEqualToString:",  a3)) {
                break;
              }
              unint64_t v9 = (unsigned __int16)++v10;
            }

            while ((unint64_t)[v8 count] > (unsigned __int16)v10);
          }

          if ([v8 count] != (id)v9)
          {
            [v8 removeObjectAtIndex:v9];
            LOBYTE(a3) = 1;
            goto LABEL_16;
          }

          id v11 = @"Can't unregister a client that is not currently registered.";
        }

        else
        {
          id v13 = a4;
          id v11 = @"There are no registered clients for plugin '%@'";
        }
      }

      else
      {
        id v13 = a3;
        id v14 = a4;
        id v11 = @"Client '%@' can't register for unknown plugin '%@'";
      }
    }

    else
    {
      id v11 = @"Can't register for nil plugin name";
    }

    FudLog(3LL, v11);
    LOBYTE(a3) = 0;
  }

  else
  {
    FudLog(3LL, @"Can't register for plugin events with nil client identifier");
  }

- (id)getClientWithName:(id)a3
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v17 = self;
  id v5 = -[NSMutableDictionary allValues](self->pluginToClients, "allValues");
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v19;
LABEL_8:
          uint64_t v14 = 0LL;
          while (1)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            BOOL v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
            if (v12 == (id)++v14)
            {
              id v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v12) {
                goto LABEL_8;
              }
              goto LABEL_16;
            }
          }

          if (v15) {
            goto LABEL_19;
          }
        }

- (BOOL)isPluginTracked:(id)a3
{
  LOBYTE(a3) = -[FudStorage getPolicyForPlugin:](self, "getPolicyForPlugin:", a3) != 0LL;
  -[NSRecursiveLock unlock](self->lock, "unlock");
  return (char)a3;
}

- (BOOL)setStateMachine:(id)a3 forPlugin:(id)a4 forFilter:(id)a5
{
  if (!a4 || !a5)
  {
    id v15 = a5;
    id v16 = a4;
    uint64_t v13 = @"Can't set state machine with invalid filter name: %@ plugin name: %@";
LABEL_11:
    FudLog(3LL, v13);
    BOOL v12 = 0;
    goto LABEL_12;
  }

  id v9 = -[FudStorage getPolicyForFilterName:](self, "getPolicyForFilterName:", a5);
  if (!v9)
  {
    uint64_t v13 = @"Can't set state machine since filter is unknown";
    goto LABEL_11;
  }

  int v10 = v9;
  id v11 = -[NSMutableDictionary objectForKey:]( self->pluginToStateMachines,  "objectForKey:",  [v9 pluginName]);
  if (!v11)
  {
    id v11 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    -[NSMutableDictionary setValue:forKey:]( self->pluginToStateMachines,  "setValue:forKey:",  v11,  [v10 pluginName]);
  }

  [v11 removeObjectForKey:a5];
  if (a3) {
    [v11 setValue:a3 forKey:a5];
  }
  BOOL v12 = 1;
LABEL_12:
  -[NSRecursiveLock unlock](self->lock, "unlock", v15, v16);
  return v12;
}

- (id)getStateMachineForFilterName:(id)a3
{
  id v5 = -[FudStorage getPolicyForFilterName:](self, "getPolicyForFilterName:", a3);
  if (v5)
  {
    id v6 = objc_msgSend( -[NSMutableDictionary objectForKey:]( self->pluginToStateMachines,  "objectForKey:",  objc_msgSend(v5, "pluginName")),  "objectForKey:",  a3);
  }

  else
  {
    FudLog(3LL, @"Can't set state machine with untracked filter name");
    id v6 = 0LL;
  }

  -[NSRecursiveLock unlock](self->lock, "unlock");
  return v6;
}

- (BOOL)isAnyStateMachineActiveForPlugin:(id)a3
{
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v5 = -[NSMutableDictionary allValues](self->pluginToPolicy, "allValues");
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        id v11 = [v10 matchingFilters];
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          while (2)
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = -[FudStorage getStateMachineForFilterName:]( self,  "getStateMachineForFilterName:",  [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) filterName]);
              if ([v16 isActive]
                && (objc_msgSend(objc_msgSend(v16, "stateMachinePluginName"), "isEqualToString:", a3) & 1) != 0)
              {
                BOOL v17 = 1;
                goto LABEL_20;
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v19;
      }

      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      BOOL v17 = 0;
    }

    while (v7);
  }

  else
  {
    BOOL v17 = 0;
  }

- (BOOL)isAnyStateMachineActive
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = -[NSMutableDictionary allValues](self->pluginToPolicy, "allValues");
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v9 = objc_msgSend(v8, "matchingFilters", 0);
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              if (objc_msgSend( -[FudStorage getStateMachineForFilterName:]( self,  "getStateMachineForFilterName:",  objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)j), "filterName")),  "isActive"))
              {
                BOOL v14 = 1;
                goto LABEL_19;
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
      BOOL v14 = 0;
    }

    while (v5);
  }

  else
  {
    BOOL v14 = 0;
  }

- (id)getFiltersInExclusionGroup:(id)a3
{
  id v5 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL);
  -[NSRecursiveLock lock](self->lock, "lock");
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v18 = self;
  id obj = -[NSMutableDictionary allValues](self->pluginToPolicy, "allValues");
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        id v11 = [v10 matchingFilters];
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              __int128 v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)j);
            }

            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }

          while (v13);
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v7);
  }

  -[NSRecursiveLock unlock](v18->lock, "unlock");
  return v5;
}

- (BOOL)_overrideAllowRemoteFindNow
{
  int v2 = MGGetBoolAnswer(@"InternalBuild", a2);
  if (v2) {
    id v3 = @"Override forcing remote server check due to internal build";
  }
  else {
    id v3 = @"Cannot override forcing remote server check due to customer build";
  }
  FudLog(5LL, v3);
  return v2;
}

- (BOOL)_policyAllowsRemoteFind:(id)a3 filter:(id)a4 revision:(id)a5 date:(id)a6
{
  id v10 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", a4, a5);
  if (!a6) {
    a6 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  }
  -[NSRecursiveLock lock](self->lock, "lock");
  pluginToRemoteCheckDate = self->pluginToRemoteCheckDate;
  if (pluginToRemoteCheckDate)
  {
    id v12 = -[NSMutableDictionary objectForKey:](pluginToRemoteCheckDate, "objectForKey:", [a3 pluginName]);
    if (v12)
    {
      id v13 = v12;
      id v14 = [v12 objectForKey:v10];
      if (v14)
      {
        id v15 = v14;
        id v24 = [a3 pluginName];
        FudLog(5LL, @"%s: last remote find for plugin %@, filter %@: %@");
        objc_msgSend( v15,  "timeIntervalSinceDate:",  a6,  "-[FudStorage _policyAllowsRemoteFind:filter:revision:date:]",  v24,  a4,  v15);
        double v17 = v16 / -3600.0;
        double v25 = v16 / -3600.0;
        FudLog(5LL, @"%s: %g hours have elapsed since last remote find");
        objc_msgSend( a3,  "remoteFirmwareCheckInterval",  "-[FudStorage _policyAllowsRemoteFind:filter:revision:date:]",  *(void *)&v25);
        double v19 = v18;
        double v23 = v18;
        FudLog(5LL, @"%s: policy allows remote find every %g hours");
        if (v17 >= 0.0)
        {
          if (v17 < v19)
          {
            __int128 v22 = "-[FudStorage _policyAllowsRemoteFind:filter:revision:date:]";
            FudLog(5LL, @"%s: Disallowing remote find now");
            BOOL v20 = 0;
            goto LABEL_10;
          }

          __int128 v22 = "-[FudStorage _policyAllowsRemoteFind:filter:revision:date:]";
          FudLog(5LL, @"%s: Allowing remote find now");
        }

        else
        {
          FudLog(5LL, @"%s: Last remote find in the future. Allowing remote find now");
          FudLog(5LL, @"%s: resetting remote find timestamp for filter+revision %@");
          objc_msgSend( v13,  "removeObjectForKey:",  v10,  "-[FudStorage _policyAllowsRemoteFind:filter:revision:date:]",  v10);
        }
      }
    }
  }

  else
  {
    -[FudStorage _load](self, "_load");
  }

  BOOL v20 = 1;
LABEL_10:
  -[NSRecursiveLock unlock](self->lock, "unlock", v22, *(void *)&v23);
  return v20;
}

- (BOOL)policyAllowsRemoteFindNow:(id)a3 filter:(id)a4 revision:(id)a5
{
  if (-[FudStorage _overrideAllowRemoteFindNow](self, "_overrideAllowRemoteFindNow")) {
    return 1;
  }
  else {
    return -[FudStorage _policyAllowsRemoteFind:filter:revision:date:]( self,  "_policyAllowsRemoteFind:filter:revision:date:",  a3,  a4,  a5,  0LL);
  }
}

- (void)recordSuccessfulRemoteFindForPolicy:(id)a3 filter:(id)a4 revision:(id)a5 date:(id)a6
{
  id v10 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", a4, a5);
  if (a3 && a4)
  {
    id v11 = v10;
    if (!a6) {
      a6 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    }
    -[NSRecursiveLock lock](self->lock, "lock");
    pluginToRemoteCheckDate = self->pluginToRemoteCheckDate;
    if (pluginToRemoteCheckDate)
    {
      id v13 = (NSMutableDictionary *)-[NSMutableDictionary objectForKey:]( pluginToRemoteCheckDate,  "objectForKey:",  [a3 pluginName]);
      if (!v13) {
        id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      }
    }

    else if (-[FudStorage _load](self, "_load"))
    {
      id v13 = 0LL;
    }

    else
    {
      self->pluginToRemoteCheckDate = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setValue:forKey:]( self->pluginToRemoteCheckDate,  "setValue:forKey:",  v13,  [a3 pluginName]);
    }

    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", a6, v11);
    -[NSRecursiveLock unlock](self->lock, "unlock");
    [a3 pluginName];
    id v14 = @"%s: successful remote find recorded for plugin %@ filter+revision %@ with date/time %@";
    uint64_t v15 = 5LL;
  }

  else
  {
    id v14 = @"Can't set state machine with invalid filter name: %@ plugin: %@";
    uint64_t v15 = 3LL;
  }

  FudLog(v15, v14);
}

- (BOOL)save
{
  pluginToRemoteCheckDate = self->pluginToRemoteCheckDate;
  if (pluginToRemoteCheckDate && -[NSMutableDictionary count](pluginToRemoteCheckDate, "count"))
  {
    id v4 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    if (!-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", self->storageFile)) {
      -[NSFileManager createFileAtPath:contents:attributes:]( v4,  "createFileAtPath:contents:attributes:",  self->storageFile,  0LL,  0LL);
    }
    -[NSMutableDictionary writeToFile:atomically:]( self->pluginToRemoteCheckDate,  "writeToFile:atomically:",  self->storageFile,  1LL);
  }

  -[NSRecursiveLock unlock](self->lock, "unlock");
  return 1;
}

- (BOOL)_load
{
  if (self->pluginToRemoteCheckDate)
  {
    BOOL v3 = 1;
  }

  else if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  self->storageFile))
  {
    id v4 = (NSMutableDictionary *)-[NSMutableDictionary copy]( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  self->storageFile),  "copy");
    self->pluginToRemoteCheckDate = v4;
    BOOL v3 = v4 != 0LL;
  }

  else
  {
    BOOL v3 = 0;
  }

  -[NSRecursiveLock unlock](self->lock, "unlock");
  return v3;
}

- (NSMutableDictionary)pluginToPolicy
{
  return self->pluginToPolicy;
}

- (NSString)storageFile
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setStorageFile:(id)a3
{
}

@end