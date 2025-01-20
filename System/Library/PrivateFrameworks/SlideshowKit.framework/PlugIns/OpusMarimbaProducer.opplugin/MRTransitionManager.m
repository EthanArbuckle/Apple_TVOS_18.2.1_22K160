@interface MRTransitionManager
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)canHandleKenBurnsForTransitionID:(id)a3;
- (BOOL)needsSourceLayerImageForPrecomputingForTransitionID:(id)a3;
- (BOOL)needsSourceLayerToBeOpaqueForSimple3DTransitionSubtype:(int64_t)a3;
- (BOOL)needsTargetLayerImageForPrecomputingForTransitionID:(id)a3;
- (BOOL)needsTargetLayerToBeOpaqueForSimple3DTransitionSubtype:(int64_t)a3;
- (BOOL)noContentsMotionForTransitionID:(id)a3;
- (MRTransitionManager)initWithPaths:(id)a3;
- (id)descriptionForTransitionID:(id)a3;
- (id)resourcePathForTransitionID:(id)a3 andResource:(id)a4;
- (id)transitionWithTransitionID:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)recycleTransition:(id)a3;
- (void)releaseResources;
@end

@implementation MRTransitionManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRTransitionManager;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_2B0608) {
    qword_2B0608 = -[MRTransitionManager initWithPaths:]( objc_alloc(&OBJC_CLASS___MRTransitionManager),  "initWithPaths:",  0LL);
  }
}

+ (id)sharedManager
{
  return (id)qword_2B0608;
}

- (MRTransitionManager)initWithPaths:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRTransitionManager;
  v3 = -[MRTransitionManager init](&v5, "init", a3);
  if (v3)
  {
    v3->mTransitionSets = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3->mTransitionPools = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTransitionManager;
  -[MRTransitionManager dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  self->mTransitionSets = 0LL;
  self->mTransitionPools = 0LL;
}

- (void)releaseResources
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  obj = self->mTransitionSets;
  id v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        id v8 = -[NSMutableDictionary objectForKey:](self->mTransitionSets, "objectForKey:", v7);
        id v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            for (j = 0LL; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)j);
              else {
                [v13 cleanup];
              }
            }

            id v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }

          while (v10);
        }
      }

      id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    }

    while (v4);
  }

  -[NSMutableDictionary removeAllObjects](self->mTransitionSets, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mTransitionPools, "removeAllObjects");
}

- (id)transitionWithTransitionID:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    id v5 = -[NSMutableDictionary objectForKey:](self->mTransitionPools, "objectForKey:", a3);
    v6 = v5;
    if (v5 && [v5 count])
    {
      uint64_t v7 = (NSNull *)[v6 anyObject];
      if (v7 != +[NSNull null](&OBJC_CLASS___NSNull, "null"))
      {
        [v6 removeObject:v7];
LABEL_19:
        objc_sync_exit(self);
        return v7;
      }
    }

    else
    {
      id v8 = objc_msgSend( -[MRTransitionManager descriptionForTransitionID:](self, "descriptionForTransitionID:", a3),  "objectForKey:",  @"className");
      if (v8) {
        id v9 = v8;
      }
      else {
        id v9 = a3;
      }
      id v10 = NSClassFromString((NSString *)[@"MRTransition" stringByAppendingString:v9]);
      uint64_t v11 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v10);
      if (v11 == +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v12)))
      {
        if (v10)
        {
          uint64_t v7 = (NSNull *)[[v10 alloc] initWithTransitionID:a3];
          if (v7)
          {
            id v13 = -[NSMutableDictionary objectForKey:](self->mTransitionSets, "objectForKey:", a3);
            if (v13) {
              [v13 addObject:v7];
            }
            else {
              -[NSMutableDictionary setObject:forKey:]( self->mTransitionSets,  "setObject:forKey:",  +[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v7),  a3);
            }

            goto LABEL_19;
          }
        }
      }

      -[NSMutableDictionary setObject:forKey:]( self->mTransitionPools,  "setObject:forKey:",  +[NSMutableSet setWithObject:]( &OBJC_CLASS___NSMutableSet,  "setWithObject:",  +[NSNull null](&OBJC_CLASS___NSNull, "null")),  a3);
    }

    uint64_t v7 = 0LL;
    goto LABEL_19;
  }

  return 0LL;
}

- (void)recycleTransition:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mTransitionPools, "objectForKey:", [a3 transitionID]);
  if (v5) {
    [v5 addObject:a3];
  }
  else {
    -[NSMutableDictionary setObject:forKey:]( self->mTransitionPools,  "setObject:forKey:",  +[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", a3),  [a3 transitionID]);
  }
  objc_sync_exit(self);
}

- (id)descriptionForTransitionID:(id)a3
{
  return objc_msgSend( +[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"),  "descriptionForTransitionID:",  a3);
}

- (id)resourcePathForTransitionID:(id)a3 andResource:(id)a4
{
  id v5 = objc_msgSend( -[MRTransitionManager descriptionForTransitionID:](self, "descriptionForTransitionID:", a3),  "objectForKey:",  @"resourceFolderPath");
  if (v5) {
    return [v5 stringByAppendingPathComponent:a4];
  }
  else {
    return a4;
  }
}

- (BOOL)canHandleKenBurnsForTransitionID:(id)a3
{
  return objc_msgSend( objc_msgSend( -[MRTransitionManager descriptionForTransitionID:]( self,  "descriptionForTransitionID:",  a3),  "objectForKey:",  @"canHandleKenBurns"),  "BOOLValue");
}

- (BOOL)noContentsMotionForTransitionID:(id)a3
{
  return objc_msgSend( objc_msgSend( -[MRTransitionManager descriptionForTransitionID:]( self,  "descriptionForTransitionID:",  a3),  "objectForKey:",  @"noContentsMotion"),  "BOOLValue");
}

- (BOOL)needsSourceLayerImageForPrecomputingForTransitionID:(id)a3
{
  return objc_msgSend( objc_msgSend( -[MRTransitionManager descriptionForTransitionID:]( self,  "descriptionForTransitionID:",  a3),  "objectForKey:",  @"needsSourceLayerImage"),  "BOOLValue");
}

- (BOOL)needsTargetLayerImageForPrecomputingForTransitionID:(id)a3
{
  return objc_msgSend( objc_msgSend( -[MRTransitionManager descriptionForTransitionID:]( self,  "descriptionForTransitionID:",  a3),  "objectForKey:",  @"needsTargetLayerImage"),  "BOOLValue");
}

- (BOOL)needsSourceLayerToBeOpaqueForSimple3DTransitionSubtype:(int64_t)a3
{
  return a3 == 6;
}

- (BOOL)needsTargetLayerToBeOpaqueForSimple3DTransitionSubtype:(int64_t)a3
{
  return a3 == 5;
}

@end