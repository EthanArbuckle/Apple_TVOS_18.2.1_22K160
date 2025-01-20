@interface MCContainerParallelizer
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (CGColor)backgroundColor;
- (MCContainerParallelizer)init;
- (MCContainerParallelizer)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSArray)zOrderedPlugs;
- (NSSet)plugs;
- (id)imprint;
- (id)plugForID:(id)a3;
- (id)setPlugForContainer:(id)a3 forID:(id)a4;
- (id)setPlugProxyForPlug:(id)a3;
- (unint64_t)countOfPlugs;
- (void)changeIDOfPlug:(id)a3 toID:(id)a4;
- (void)demolish;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllPlugs;
- (void)removePlug:(id)a3;
- (void)removePlugForID:(id)a3;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setBackgroundColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
@end

@implementation MCContainerParallelizer

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MCContainerParallelizer;
  return objc_msgSendSuper2(&v6, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCContainerParallelizer)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCContainerParallelizer;
  v2 = -[MCContainer init](&v4, "init");
  if (v2) {
    v2->mPlugs = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  return v2;
}

- (MCContainerParallelizer)initWithImprint:(id)a3 andMontage:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MCContainerParallelizer;
  objc_super v6 = -[MCContainer initWithImprint:andMontage:](&v20, "initWithImprint:andMontage:");
  if (v6)
  {
    id v7 = [a3 objectForKey:@"plugs"];
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  a4);
          -[NSMutableDictionary setObject:forKey:]( v6->mPlugs,  "setObject:forKey:",  v12,  -[MCObject idInSupercontainer](v12, "idInSupercontainer"));
          -[MCObject setSupercontainer:](v12, "setSupercontainer:", v6);
          if (!-[MCObject isSnapshot](v6, "isSnapshot")) {
            -[MCObject addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v6,  @"zIndex",  0LL,  0LL);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }

      while (v9);
    }

    v13 = (NSString *)[a3 objectForKey:@"backgroundColor"];
    if (v13)
    {
      CGRect components = CGRectFromString(v13);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v6->mBackgroundColor = CGColorCreate(DeviceRGB, &components.origin.x);
      CGColorSpaceRelease(DeviceRGB);
    }
  }

  return v6;
}

- (void)demolish
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = -[NSMutableDictionary objectEnumerator](self->mPlugs, "objectEnumerator");
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (!-[MCObject isSnapshot](self, "isSnapshot")) {
          [v8 removeObserver:self forKeyPath:@"zIndex"];
        }
        [v8 demolish];
      }

      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  self->mPlugs = 0LL;
  self->mCachedZOrderedPlugs = 0LL;
  objc_sync_exit(mPlugs);
  mBackgroundColor = self->mBackgroundColor;
  if (mBackgroundColor)
  {
    CGColorRelease(mBackgroundColor);
    self->mBackgroundColor = 0LL;
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCContainerParallelizer;
  -[MCContainer demolish](&v10, "demolish");
}

- (id)imprint
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCContainerParallelizer;
  id v3 = -[MCContainer imprint](&v17, "imprint");
  id v4 = objc_autoreleasePoolPush();
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = -[MCContainerParallelizer plugs](self, "plugs", 0LL);
  id v7 = -[NSSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      objc_super v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "imprint"));
        objc_super v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v18,  16LL);
    }

    while (v8);
  }

  [v3 setObject:v5 forKey:@"plugs"];
  mBackgroundColor = self->mBackgroundColor;
  if (mBackgroundColor)
  {
    CGRect v19 = *(CGRect *)CGColorGetComponents(mBackgroundColor);
    [v3 setObject:NSStringFromCGRect(v19) forKey:@"backgroundColor"];
  }

  objc_autoreleasePoolPop(v4);
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"zIndex", a4, a5, a6))
  {
    -[MCContainerParallelizer willChangeValueForKey:](self, "willChangeValueForKey:", @"zOrderedPlugs");
    mPlugs = self->mPlugs;
    objc_sync_enter(mPlugs);

    self->mCachedZOrderedPlugs = 0LL;
    objc_sync_exit(mPlugs);
    -[MCContainerParallelizer didChangeValueForKey:](self, "didChangeValueForKey:", @"zOrderedPlugs");
  }

- (CGColor)backgroundColor
{
  CGColorRef v3 = CGColorRetain(self->mBackgroundColor);
  objc_sync_exit(self);
  return v3;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  if (!CGColorEqualToColor(a3, self->mBackgroundColor))
  {
    objc_sync_enter(self);
    -[MCContainerParallelizer willChangeValueForKey:](self, "willChangeValueForKey:", @"backgroundColor");
    CGColorRelease(self->mBackgroundColor);
    size_t NumberOfComponents = CGColorGetNumberOfComponents(a3);
    if (NumberOfComponents == 2)
    {
      uint64_t v6 = CGColorGetComponents(a3);
      components[0] = *v6;
      components[1] = components[0];
      components[2] = components[0];
      components[3] = v6[1];
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      self->mBackgroundColor = CGColorCreate(DeviceRGB, components);
      CGColorSpaceRelease(DeviceRGB);
    }

    else if (NumberOfComponents == 4)
    {
      self->mBackgroundColor = CGColorRetain(a3);
    }

    else
    {
      NSLog(@"Background color is in an unsupported color space (not generic gray or RGB)\n");
      self->mBackgroundColor = 0LL;
    }

    -[MCContainerParallelizer didChangeValueForKey:](self, "didChangeValueForKey:", @"backgroundColor");
    objc_sync_exit(self);
  }

- (void)setBackgroundColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  self->mBackgroundColor = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  -[MCContainerParallelizer didChangeValueForKey:](self, "didChangeValueForKey:", @"backgroundColor");
  objc_sync_exit(self);
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
  id v7 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCPlugParallel),  "initFromScratchWithMontage:",  self->super.super.mMontage);
  [v7 setSupercontainer:self];
  [v7 setContainer:a3];
  [v7 setIDInSupercontainer:a4];
  [v7 addObserver:self forKeyPath:@"zIndex" options:0 context:0];
  id v8 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v7, 0LL);
  -[MCContainerParallelizer willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  1LL,  v8);
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);

  self->mCachedZOrderedPlugs = 0LL;
  -[NSMutableDictionary setObject:forKey:](self->mPlugs, "setObject:forKey:", v7, a4);
  objc_sync_exit(mPlugs);
  -[MCContainerParallelizer didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  1LL,  v8);

  return v7;
}

- (id)setPlugProxyForPlug:(id)a3
{
  id v5 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCPlugProxy),  "initFromScratchWithMontage:",  self->super.super.mMontage);
  [v5 setPlug:a3];
  [v5 addObserver:self forKeyPath:@"zIndex" options:0 context:0];
  id v6 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v5, 0LL);
  -[MCContainerParallelizer willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  1LL,  v6);
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);

  self->mCachedZOrderedPlugs = 0LL;
  -[NSMutableDictionary setObject:forKey:]( self->mPlugs,  "setObject:forKey:",  v5,  [a3 idInSupercontainer]);
  objc_sync_exit(mPlugs);
  -[MCContainerParallelizer didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  1LL,  v6);

  return v5;
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
  -[MCContainerParallelizer willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  2LL);
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);

  self->mCachedZOrderedPlugs = 0LL;
  -[NSMutableDictionary removeObjectForKey:]( self->mPlugs,  "removeObjectForKey:",  [a3 idInSupercontainer]);
  objc_sync_exit(mPlugs);
  -[MCContainerParallelizer didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  2LL,  v6);
  [a3 setContainer:0];
  [a3 setSupercontainer:0];
}

- (void)removePlugForID:(id)a3
{
  id v4 = -[MCContainerParallelizer plugForID:](self, "plugForID:", a3);
  if (v4) {
    -[MCContainerParallelizer removePlug:](self, "removePlug:", v4);
  }
}

- (void)removeAllPlugs
{
  CGColorRef v3 = -[MCContainerParallelizer plugs](self, "plugs");
  -[MCContainerParallelizer willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  2LL,  v3);
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);

  self->mCachedZOrderedPlugs = 0LL;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = -[NSMutableDictionary objectEnumerator](self->mPlugs, "objectEnumerator");
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)i) removeObserver:self forKeyPath:@"zIndex"];
      }

      id v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->mPlugs, "removeAllObjects");
  objc_sync_exit(mPlugs);
  -[MCContainerParallelizer didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"plugs",  2LL,  v3);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v9 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      for (j = 0LL; j != v9; j = (char *)j + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v3);
        }
        __int128 v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)j);
        [v12 setContainer:0];
        [v12 setSupercontainer:0];
      }

      id v9 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
    }

    while (v9);
  }

- (NSArray)zOrderedPlugs
{
  mPlugs = self->mPlugs;
  objc_sync_enter(mPlugs);
  mCachedZOrderedPlugs = self->mCachedZOrderedPlugs;
  if (!mCachedZOrderedPlugs)
  {
    id v5 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"zIndex",  1LL);
    id v6 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v5, 0LL);
    self->mCachedZOrderedPlugs = (NSArray *) objc_msgSend( -[NSMutableDictionary allValues](self->mPlugs, "allValues"),  "sortedArrayUsingDescriptors:",  v6);

    mCachedZOrderedPlugs = self->mCachedZOrderedPlugs;
  }

  uint64_t v7 = mCachedZOrderedPlugs;
  objc_sync_exit(mPlugs);
  return v7;
}

@end