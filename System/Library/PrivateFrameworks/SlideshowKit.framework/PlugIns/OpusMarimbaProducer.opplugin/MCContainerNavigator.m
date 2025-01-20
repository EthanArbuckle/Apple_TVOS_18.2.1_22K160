@interface MCContainerNavigator
- (MCContainerNavigator)init;
- (MCContainerNavigator)initWithImprint:(id)a3 andMontage:(id)a4;
- (MCPlugHaven)startPlug;
- (NSSet)plugs;
- (NSString)startPlugID;
- (id)imprint;
- (id)plugForID:(id)a3;
- (id)setPlugForContainer:(id)a3 forID:(id)a4;
- (unint64_t)countOfPlugs;
- (void)changeIDOfPlug:(id)a3 toID:(id)a4;
- (void)demolish;
- (void)removeAllPlugs;
- (void)removePlug:(id)a3;
- (void)removePlugForID:(id)a3;
- (void)setStartPlugID:(id)a3;
@end

@implementation MCContainerNavigator

- (MCContainerNavigator)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCContainerNavigator;
  v2 = -[MCContainer init](&v4, "init");
  if (v2) {
    v2->mPlugs = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  return v2;
}

- (MCContainerNavigator)initWithImprint:(id)a3 andMontage:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MCContainerNavigator;
  v6 = -[MCContainer initWithImprint:andMontage:](&v20, "initWithImprint:andMontage:");
  if (v6)
  {
    id v15 = a3;
    id v7 = [a3 objectForKey:@"plugs"];
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v11),  a4);
          -[NSMutableDictionary setObject:forKey:]( v6->mPlugs,  "setObject:forKey:",  v12,  -[MCObject idInSupercontainer](v12, "idInSupercontainer"));
          -[MCObject setSupercontainer:](v12, "setSupercontainer:", v6);
          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v9);
    }

    v13 = (NSString *)[v15 objectForKey:@"startPlugID"];
    v6->mStartPlugID = v13;
    v6->mStartPlug = (MCPlugHaven *)-[NSMutableDictionary objectForKey:](v6->mPlugs, "objectForKey:", v13);
  }

  return v6;
}

- (void)demolish
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);

  self->mStartPlugID = 0LL;
  self->mStartPlug = 0LL;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = -[NSMutableDictionary objectEnumerator](self->mPlugs, "objectEnumerator");
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) demolish];
      }

      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  self->mPlugs = 0LL;
  objc_sync_exit(mPlugs);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCContainerNavigator;
  -[MCContainer demolish](&v8, "demolish");
}

- (id)imprint
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCContainerNavigator;
  id v3 = -[MCContainer imprint](&v17, "imprint");
  id v4 = objc_autoreleasePoolPush();
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = -[MCContainerNavigator plugs](self, "plugs", 0LL);
  id v7 = -[NSSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)i), "imprint"));
      }

      id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    }

    while (v8);
  }

  [v3 setObject:v5 forKey:@"plugs"];
  mStartPlugID = self->mStartPlugID;
  if (mStartPlugID) {
    [v3 setObject:mStartPlugID forKey:@"startPlugID"];
  }
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (NSSet)plugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  if (-[NSMutableDictionary count](self->mPlugs, "count")) {
    id v4 =  -[NSSet initWithArray:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithArray:",  -[NSMutableDictionary allValues](self->mPlugs, "allValues"));
  }
  else {
    id v4 = (NSSet *)sEmptySet;
  }
  objc_sync_exit(mPlugs);
  return v4;
}

- (unint64_t)countOfPlugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  id v4 = -[NSMutableDictionary count](self->mPlugs, "count");
  objc_sync_exit(mPlugs);
  return (unint64_t)v4;
}

- (id)plugForID:(id)a3
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  id v6 = -[NSMutableDictionary objectForKey:](self->mPlugs, "objectForKey:", a3);
  objc_sync_exit(mPlugs);
  return v6;
}

- (id)setPlugForContainer:(id)a3 forID:(id)a4
{
  id v7 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCPlugHaven),  "initFromScratchWithMontage:",  self->super.super.mMontage);
  [v7 setSupercontainer:self];
  [v7 setContainer:a3];
  [v7 setIDInSupercontainer:a4];
  id v8 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v7, 0LL);
  -[MCContainerNavigator willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  1LL,  v8);
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  -[NSMutableDictionary setObject:forKey:](self->mPlugs, "setObject:forKey:", v7, a4);
  if (!self->mStartPlugID)
  {
    __int128 v10 = (NSString *)a4;
    self->mStartPlugID = v10;
    self->mStartPlug = (MCPlugHaven *)-[NSMutableDictionary objectForKey:](self->mPlugs, "objectForKey:", v10);
  }

  objc_sync_exit(mPlugs);
  -[MCContainerNavigator didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  1LL,  v8);

  return v7;
}

- (void)changeIDOfPlug:(id)a3 toID:(id)a4
{
  id v7 = [a3 idInSupercontainer];
  if (([a4 isEqualToString:v7] & 1) == 0)
  {
    mPlugs = self->mPlugs;
    objc_sync_enter(mPlugs);
    id v9 = v7;
    -[NSMutableDictionary setObject:forKey:](self->mPlugs, "setObject:forKey:", a3, a4);
    -[NSMutableDictionary removeObjectForKey:](self->mPlugs, "removeObjectForKey:", v7);

    [a3 setIDInSupercontainer:a4];
    objc_sync_exit(mPlugs);
  }

- (void)removePlug:(id)a3
{
  id v6 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", a3, 0LL);
  -[MCContainerNavigator willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  2LL);
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  if (objc_msgSend(objc_msgSend(a3, "idInSupercontainer"), "isEqualToString:", self->mStartPlugID))
  {

    self->mStartPlugID = 0LL;
    self->mStartPlug = 0LL;
  }

  -[NSMutableDictionary removeObjectForKey:]( self->mPlugs,  "removeObjectForKey:",  [a3 idInSupercontainer]);
  objc_sync_exit(mPlugs);
  -[MCContainerNavigator didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  2LL,  v6);
  [a3 setContainer:0];
  [a3 setSupercontainer:0];
}

- (void)removePlugForID:(id)a3
{
  id v4 = -[MCContainerNavigator plugForID:](self, "plugForID:", a3);
  if (v4) {
    -[MCContainerNavigator removePlug:](self, "removePlug:", v4);
  }
}

- (void)removeAllPlugs
{
  id v3 = -[MCContainerNavigator plugs](self, "plugs");
  -[MCContainerNavigator willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  2LL,  v3);
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);

  self->mStartPlugID = 0LL;
  self->mStartPlug = 0LL;
  -[NSMutableDictionary removeAllObjects](self->mPlugs, "removeAllObjects");
  objc_sync_exit(mPlugs);
  -[MCContainerNavigator didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  2LL,  v3);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        [v8 setContainer:0];
        [v8 setSupercontainer:0];
      }

      id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

- (void)setStartPlugID:(id)a3
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  mStartPlugID = self->mStartPlugID;
  if (a3)
  {
    if (mStartPlugID) {

    }
    id v7 = (NSString *)a3;
    self->mStartPlugID = v7;
    id v8 = (MCPlugHaven *)-[NSMutableDictionary objectForKey:](self->mPlugs, "objectForKey:", v7);
  }

  else if (mStartPlugID)
  {

    id v8 = 0LL;
    self->mStartPlugID = 0LL;
  }

  else
  {
    id v8 = 0LL;
  }

  self->mStartPlug = v8;
  objc_sync_exit(mPlugs);
}

- (NSString)startPlugID
{
  return self->mStartPlugID;
}

- (MCPlugHaven)startPlug
{
  return self->mStartPlug;
}

@end