@interface MRFrameManager
+ (id)sharedManager;
+ (void)initialize;
- (MRFrameManager)init;
- (id)frameWithFrameID:(id)a3;
- (id)resourcePathForFrameID:(id)a3 andResource:(id)a4;
- (id)sizeScriptForFrameID:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)recycleFrame:(id)a3;
- (void)releaseResources;
@end

@implementation MRFrameManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRFrameManager;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_2B0670) {
    qword_2B0670 = objc_alloc_init(&OBJC_CLASS___MRFrameManager);
  }
}

+ (id)sharedManager
{
  return (id)qword_2B0670;
}

- (MRFrameManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRFrameManager;
  objc_super v2 = -[MRFrameManager init](&v4, "init");
  if (v2)
  {
    v2->mFrameSets = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->mFramePools = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRFrameManager;
  -[MRFrameManager dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  self->mFrameSets = 0LL;
  self->mFramePools = 0LL;
}

- (void)releaseResources
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  obj = self->mFrameSets;
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
        id v8 = -[NSMutableDictionary objectForKey:](self->mFrameSets, "objectForKey:", v7);
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

  -[NSMutableDictionary removeAllObjects](self->mFrameSets, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mFramePools, "removeAllObjects");
}

- (id)frameWithFrameID:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    id v5 = -[NSMutableDictionary objectForKey:](self->mFramePools, "objectForKey:", a3);
    v6 = v5;
    if (v5 && [v5 count])
    {
      uint64_t v7 = (NSNull *)[v6 anyObject];
      if (v7 != +[NSNull null](&OBJC_CLASS___NSNull, "null"))
      {
        [v6 removeObject:v7];
LABEL_21:
        objc_sync_exit(self);
        return v7;
      }
    }

    else
    {
      id v8 = objc_msgSend( objc_msgSend( +[MPFrameManager sharedManager](MPFrameManager, "sharedManager"),  "descriptionForFrameID:",  a3),  "objectForKey:",  @"className");
      if (v8) {
        id v9 = v8;
      }
      else {
        id v9 = a3;
      }
      id v10 = NSClassFromString((NSString *)[@"MRFrame" stringByAppendingString:v9]);
      uint64_t v11 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v10);
      if (v11 == +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v12))
        && v10 != 0LL)
      {
        uint64_t v7 = (NSNull *)[[v10 alloc] initWithFrameID:a3];
        if (v7)
        {
          id v14 = -[NSMutableDictionary objectForKey:](self->mFrameSets, "objectForKey:", a3);
          if (v14) {
            [v14 addObject:v7];
          }
          else {
            -[NSMutableDictionary setObject:forKey:]( self->mFrameSets,  "setObject:forKey:",  +[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v7),  a3);
          }

          goto LABEL_21;
        }
      }

      -[NSMutableDictionary setObject:forKey:]( self->mFramePools,  "setObject:forKey:",  +[NSMutableSet setWithObject:]( &OBJC_CLASS___NSMutableSet,  "setWithObject:",  +[NSNull null](&OBJC_CLASS___NSNull, "null")),  a3);
    }

    uint64_t v7 = 0LL;
    goto LABEL_21;
  }

  return 0LL;
}

- (void)recycleFrame:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mFramePools, "objectForKey:", [a3 frameID]);
  if (v5) {
    [v5 addObject:a3];
  }
  else {
    -[NSMutableDictionary setObject:forKey:]( self->mFramePools,  "setObject:forKey:",  +[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", a3),  [a3 frameID]);
  }
  objc_sync_exit(self);
}

- (id)resourcePathForFrameID:(id)a3 andResource:(id)a4
{
  id v5 = objc_msgSend( objc_msgSend( +[MPFrameManager sharedManager](MPFrameManager, "sharedManager"),  "descriptionForFrameID:",  a3),  "objectForKey:",  @"resourceFolderPath");
  if (v5) {
    return [v5 stringByAppendingPathComponent:a4];
  }
  else {
    return a4;
  }
}

- (id)sizeScriptForFrameID:(id)a3
{
  return objc_msgSend( objc_msgSend( +[MPFrameManager sharedManager](MPFrameManager, "sharedManager"),  "descriptionForFrameID:",  a3),  "objectForKey:",  @"sizeScript");
}

@end