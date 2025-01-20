@interface MCContainerSerializer
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (MCContainerSerializer)init;
- (MCContainerSerializer)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSArray)orderedPlugs;
- (NSDictionary)initialTransitionAttributes;
- (NSSet)plugs;
- (NSString)initialTransitionID;
- (double)duration;
- (double)initialTransitionDuration;
- (double)timeInForPlug:(id)a3;
- (id)addPlugForContainer:(id)a3;
- (id)addPlugsForContainers:(id)a3;
- (id)imprint;
- (id)insertPlugForContainer:(id)a3 atIndex:(unint64_t)a4;
- (id)insertPlugsForContainers:(id)a3 atIndex:(unint64_t)a4;
- (id)plugAtIndex:(unint64_t)a3;
- (unint64_t)countOfPlugs;
- (void)demolish;
- (void)movePlugsAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllPlugs;
- (void)removePlugsAtIndices:(id)a3;
- (void)setInitialTransitionAttributes:(id)a3;
- (void)setInitialTransitionDuration:(double)a3;
- (void)setInitialTransitionID:(id)a3;
@end

@implementation MCContainerSerializer

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MCContainerSerializer;
  return objc_msgSendSuper2(&v6, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCContainerSerializer)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCContainerSerializer;
  v2 = -[MCContainer init](&v4, "init");
  if (v2)
  {
    v2->mPlugs = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v2->mCachedDuration = -1.0;
  }

  return v2;
}

- (MCContainerSerializer)initWithImprint:(id)a3 andMontage:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MCContainerSerializer;
  objc_super v6 = -[MCContainer initWithImprint:andMontage:](&v19, "initWithImprint:andMontage:");
  if (v6)
  {
    id v7 = [a3 objectForKey:@"plugs"];
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i),  a4);
          -[NSMutableSet addObject:](v6->mPlugs, "addObject:", v12);
          -[MCObject setSupercontainer:](v12, "setSupercontainer:", v6);
          if (!-[MCObject isSnapshot](v6, "isSnapshot"))
          {
            -[MCObject addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v6,  @"fullDuration",  0LL,  0LL);
            -[MCObject addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v6,  @"transitionDuration",  0LL,  0LL);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }

      while (v9);
    }

    v6->_initialTransitionID = (NSString *)[a3 objectForKey:@"initialTransitionID"];
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"initialTransitionDuration"), "doubleValue");
    v6->_initialTransitionDuration = v13;
    v6->_initialTransitionAttributes = (NSDictionary *)[a3 objectForKey:@"initialTransitionAttributes"];
  }

  return v6;
}

- (void)demolish
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  objc_super v4 = self->mPlugs;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if (!-[MCObject isSnapshot](self, "isSnapshot"))
        {
          [v8 removeObserver:self forKeyPath:@"fullDuration"];
          [v8 removeObserver:self forKeyPath:@"transitionDuration"];
        }

        [v8 demolish];
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  self->mPlugs = 0LL;
  self->mCachedOrderedPlugs = 0LL;
  objc_sync_exit(mPlugs);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCContainerSerializer;
  -[MCContainer demolish](&v9, "demolish");
}

- (id)imprint
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MCContainerSerializer;
  id v3 = -[MCContainer imprint](&v18, "imprint");
  objc_super v4 = objc_autoreleasePoolPush();
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v6 = -[MCContainerSerializer plugs](self, "plugs", 0LL);
  id v7 = -[NSSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "imprint"));
      }

      id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
    }

    while (v8);
  }

  [v3 setObject:v5 forKey:@"plugs"];
  initialTransitionID = self->_initialTransitionID;
  if (initialTransitionID) {
    [v3 setObject:initialTransitionID forKey:@"initialTransitionID"];
  }
  if (self->_initialTransitionDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"initialTransitionDuration");
  }
  initialTransitionAttributes = self->_initialTransitionAttributes;
  if (initialTransitionAttributes) {
    [v3 setObject:initialTransitionAttributes forKey:@"initialTransitionAttributes"];
  }
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((objc_msgSend(a3, "isEqualToString:", @"fullDuration", a4, a5, a6) & 1) != 0
    || [a3 isEqualToString:@"transitionDuration"])
  {
    -[MCContainerSerializer willChangeValueForKey:](self, "willChangeValueForKey:", @"duration");
    objc_sync_enter(self);
    self->mCachedDuration = -1.0;
    objc_sync_exit(self);
    -[MCContainerSerializer didChangeValueForKey:](self, "didChangeValueForKey:", @"duration");
  }

- (double)duration
{
  double mCachedDuration = self->mCachedDuration;
  if (mCachedDuration < 0.0)
  {
    objc_sync_enter(self);
    mPlugs = self->mPlugs;
    objc_sync_enter(mPlugs);
    id v5 = (char *)-[NSMutableSet count](self->mPlugs, "count");
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v6 = self->mPlugs;
    id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v7)
    {
      id v8 = v5 - 1;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          __int128 v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          [v11 fullDuration];
          double v13 = v12;
          __int128 v14 = (char *)[v11 index];
          double v15 = 0.0;
          if (v14 < v8) {
            objc_msgSend(v11, "transitionDuration", 0.0);
          }
          double mCachedDuration = self->mCachedDuration + v13 - v15;
          self->double mCachedDuration = mCachedDuration;
        }

        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v7);
    }

    else
    {
      double mCachedDuration = 0.0;
    }

    objc_sync_exit(mPlugs);
    objc_sync_exit(self);
  }

  return mCachedDuration;
}

- (NSSet)plugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  if (-[NSMutableSet count](self->mPlugs, "count")) {
    objc_super v4 = -[NSSet initWithSet:](objc_alloc(&OBJC_CLASS___NSSet), "initWithSet:", self->mPlugs);
  }
  else {
    objc_super v4 = (NSSet *)sEmptySet;
  }
  objc_sync_exit(mPlugs);
  return v4;
}

- (unint64_t)countOfPlugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  id v4 = -[NSMutableSet count](self->mPlugs, "count");
  objc_sync_exit(mPlugs);
  return (unint64_t)v4;
}

- (id)plugAtIndex:(unint64_t)a3
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  mCachedOrderedPlugs = self->mCachedOrderedPlugs;
  if (mCachedOrderedPlugs)
  {
    id v7 = -[NSArray objectAtIndex:](mCachedOrderedPlugs, "objectAtIndex:", a3);
LABEL_13:
    double v13 = v7;
  }

  else
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = self->mPlugs;
    id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          double v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if ([v12 index] == (id)a3)
          {
            id v7 = v12;
            goto LABEL_13;
          }
        }

        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        double v13 = 0LL;
        if (v9) {
          continue;
        }
        break;
      }
    }

    else
    {
      double v13 = 0LL;
    }
  }

  objc_sync_exit(mPlugs);
  return v13;
}

- (id)addPlugForContainer:(id)a3
{
  id v4 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  id v5 = -[MCContainerSerializer insertPlugsForContainers:atIndex:]( self,  "insertPlugsForContainers:atIndex:",  v4,  -[MCContainerSerializer countOfPlugs](self, "countOfPlugs"));

  return [v5 objectAtIndex:0];
}

- (id)addPlugsForContainers:(id)a3
{
  return -[MCContainerSerializer insertPlugsForContainers:atIndex:]( self,  "insertPlugsForContainers:atIndex:",  a3,  -[MCContainerSerializer countOfPlugs](self, "countOfPlugs"));
}

- (id)insertPlugForContainer:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v6 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  id v7 = -[MCContainerSerializer insertPlugsForContainers:atIndex:](self, "insertPlugsForContainers:atIndex:", v6, a4);

  return [v7 objectAtIndex:0];
}

- (id)insertPlugsForContainers:(id)a3 atIndex:(unint64_t)a4
{
  id v22 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    int v7 = 0;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v11 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCPlugSerial),  "initFromScratchWithMontage:",  self->super.super.mMontage);
        [v11 setSupercontainer:self];
        [v11 setContainer:v10];
        [v11 setIndex:a4 + (v7 + (_DWORD)i)];
        [v22 addObject:v11];
        [v11 addObserver:self forKeyPath:@"fullDuration" options:0 context:0];
        [v11 addObserver:self forKeyPath:@"transitionDuration" options:0 context:0];
      }

      id v6 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
      v7 += (int)i;
    }

    while (v6);
  }

  if ([v22 count])
  {
    double v12 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v22);
    -[MCContainerSerializer willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  1LL,  v12);
    mPlugs = self->mPlugs;
    objc_sync_enter(mPlugs);

    self->mCachedOrderedPlugs = 0LL;
    double v13 = (char *)[a3 count];
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v14 = self->mPlugs;
    id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      do
      {
        for (j = 0LL; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          __int128 v18 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)j);
        }

        id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
      }

      while (v15);
    }

    -[NSMutableSet addObjectsFromArray:](self->mPlugs, "addObjectsFromArray:", v22);
    objc_sync_exit(mPlugs);
    -[MCContainerSerializer didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  1LL,  v12);
  }

  return v22;
}

- (void)removePlugsAtIndices:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  obj = self->mPlugs;
  objc_sync_enter(obj);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  mPlugs = self->mPlugs;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mPlugs,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(mPlugs);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v10, "index")))
        {
          -[NSMutableSet addObject:](v5, "addObject:", v10);
          [v10 removeObserver:self forKeyPath:@"fullDuration"];
          [v10 removeObserver:self forKeyPath:@"transitionDuration"];
        }

        else
        {
          objc_msgSend( v10,  "setIndex:",  (_BYTE *)objc_msgSend(v10, "index")
          - (_BYTE *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v10, "index")));
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mPlugs,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v7);
  }

  -[MCContainerSerializer willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  2LL,  v5);

  self->mCachedOrderedPlugs = 0LL;
  -[NSMutableSet minusSet:](self->mPlugs, "minusSet:", v5);
  objc_sync_exit(obj);
  -[MCContainerSerializer didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  2LL,  v5);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v5);
        }
        __int128 v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)j);
        [v14 setContainer:0];
        [v14 setSupercontainer:0];
      }

      id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v11);
  }
}

- (void)movePlugsAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);

  self->mCachedOrderedPlugs = 0LL;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v8 = self->mPlugs;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v12, "index")))
        {
          objc_msgSend( v12,  "setIndex:",  (char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index")) + a4);
        }

        else
        {
          double v13 = [v12 index];
          unint64_t v14 = v13 - (_BYTE *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index"));
          if (v14 >= a4) {
            v14 += (unint64_t)[a3 count];
          }
          [v12 setIndex:v14];
        }
      }

      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v9);
  }

  objc_sync_exit(mPlugs);
  -[MCContainerSerializer didChangeValueForKey:](self, "didChangeValueForKey:", @"orderedPlugs");
}

- (void)removeAllPlugs
{
}

- (NSArray)orderedPlugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  mCachedOrderedPlugs = self->mCachedOrderedPlugs;
  if (!mCachedOrderedPlugs)
  {
    id v5 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"index",  1LL);
    id v6 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v5, 0LL);
    self->mCachedOrderedPlugs = (NSArray *) objc_msgSend( -[NSMutableSet allObjects](self->mPlugs, "allObjects"),  "sortedArrayUsingDescriptors:",  v6);

    mCachedOrderedPlugs = self->mCachedOrderedPlugs;
  }

  id v7 = mCachedOrderedPlugs;
  objc_sync_exit(mPlugs);
  return v7;
}

- (double)timeInForPlug:(id)a3
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  if (!self->mCachedOrderedPlugs)
  {
    id v6 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"index",  1LL);
    id v7 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v6, 0LL);
    self->mCachedOrderedPlugs = (NSArray *) objc_msgSend( -[NSMutableSet allObjects](self->mPlugs, "allObjects"),  "sortedArrayUsingDescriptors:",  v7);
  }

  id v8 = [a3 index];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  mCachedOrderedPlugs = self->mCachedOrderedPlugs;
  id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( mCachedOrderedPlugs,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    double v12 = 0.0;
LABEL_5:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(mCachedOrderedPlugs);
      }
      unint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
      if ([v14 index] >= v8) {
        break;
      }
      [v14 fullDuration];
      double v16 = v15;
      [v14 transitionDuration];
      double v12 = v12 + v16 - v17;
      if (v10 == (id)++v13)
      {
        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( mCachedOrderedPlugs,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
        if (v10) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  else
  {
    double v12 = 0.0;
  }

  objc_sync_exit(mPlugs);
  return v12;
}

- (NSString)initialTransitionID
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setInitialTransitionID:(id)a3
{
}

- (double)initialTransitionDuration
{
  return self->_initialTransitionDuration;
}

- (void)setInitialTransitionDuration:(double)a3
{
  self->_initialTransitionDuration = a3;
}

- (NSDictionary)initialTransitionAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setInitialTransitionAttributes:(id)a3
{
}

@end