@interface MREffectManager
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)hasCustomTimingForEffectID:(id)a3;
- (BOOL)hasMultiImageInputForEffectID:(id)a3;
- (BOOL)isOpaqueForEffectID:(id)a3;
- (Class)classForEffectID:(id)a3;
- (MREffectManager)init;
- (double)defaultMainDurationForEffectID:(id)a3;
- (double)defaultPhaseInDurationForEffectID:(id)a3;
- (double)defaultPhaseOutDurationForEffectID:(id)a3;
- (double)lineSpacingFactorForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5;
- (id)attributeDescriptionForEffectID:(id)a3 andKey:(id)a4;
- (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
- (id)defaultEffectAttributesWithEffectID:(id)a3 andSlideInformation:(id)a4;
- (id)descriptionForEffectID:(id)a3;
- (id)effectWithEffectID:(id)a3;
- (id)imageInputInfosForEffectID:(id)a3;
- (id)imageProviderInfosForEffectID:(id)a3;
- (id)resourcePathForEffectID:(id)a3 andResource:(id)a4;
- (id)sizeScriptForEffectID:(id)a3 andKey:(id)a4;
- (void)cleanup;
- (void)dealloc;
- (void)recycleEffect:(id)a3;
- (void)releaseResources;
@end

@implementation MREffectManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectManager;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_2B0600) {
    qword_2B0600 = objc_alloc_init(&OBJC_CLASS___MREffectManager);
  }
}

+ (id)sharedManager
{
  return (id)qword_2B0600;
}

- (MREffectManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MREffectManager;
  objc_super v2 = -[MREffectManager init](&v4, "init");
  if (v2)
  {
    v2->mEffectSets = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->mEffectPools = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MREffectManager;
  -[MREffectManager dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  self->mEffectSets = 0LL;
  self->mEffectPools = 0LL;
}

- (void)releaseResources
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  obj = self->mEffectSets;
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
        id v8 = -[NSMutableDictionary objectForKey:](self->mEffectSets, "objectForKey:", v7);
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

  -[NSMutableDictionary removeAllObjects](self->mEffectSets, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mEffectPools, "removeAllObjects");
}

- (Class)classForEffectID:(id)a3
{
  id v3 = (objc_class *)a3;
  if (a3)
  {
    id v5 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "descriptionForEffectID:",  a3);
    v6 = (objc_class *)[v5 objectForKey:@"className"];
    uint64_t v7 = v6 ? v6 : v3;
    Class v8 = NSClassFromString((NSString *)[@"MREffect" stringByAppendingString:v7]);
    if (!v8
      || (id v3 = v8,
          id v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v8),
          v9 != +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v10))))
    {
      if (objc_msgSend(objc_msgSend(v5, "objectForKey:", @"imageInputInfo"), "count")) {
        return (Class)objc_opt_class(&OBJC_CLASS___MREffectJustASlide, v11);
      }
      return 0LL;
    }
  }

  return v3;
}

- (id)effectWithEffectID:(id)a3
{
  id v6 = -[NSMutableDictionary objectForKey:](self->mEffectPools, "objectForKey:", a3);
  uint64_t v7 = v6;
  if (v6 && [v6 count])
  {
    id v5 = [v7 anyObject];
    [v7 removeObject:v5];
  }

  else
  {
    id v5 = objc_msgSend( objc_alloc(-[MREffectManager classForEffectID:](self, "classForEffectID:", a3)),  "initWithEffectID:",  a3);
    if (v5)
    {
      id v8 = -[NSMutableDictionary objectForKey:](self->mEffectSets, "objectForKey:", a3);
      if (v8) {
        [v8 addObject:v5];
      }
      else {
        -[NSMutableDictionary setObject:forKey:]( self->mEffectSets,  "setObject:forKey:",  +[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v5),  a3);
      }
    }
  }

  objc_sync_exit(self);
  return v5;
}

- (void)recycleEffect:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mEffectPools, "objectForKey:", [a3 effectID]);
  if (v5) {
    [v5 addObject:a3];
  }
  else {
    -[NSMutableDictionary setObject:forKey:]( self->mEffectPools,  "setObject:forKey:",  +[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", a3),  [a3 effectID]);
  }
  objc_sync_exit(self);
}

- (id)descriptionForEffectID:(id)a3
{
  return objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "descriptionForEffectID:",  a3);
}

- (id)resourcePathForEffectID:(id)a3 andResource:(id)a4
{
  id v5 = objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "descriptionForEffectID:",  a3),  "objectForKey:",  @"resourceFolderPath");
  if (v5) {
    return [v5 stringByAppendingPathComponent:a4];
  }
  else {
    return a4;
  }
}

- (id)sizeScriptForEffectID:(id)a3 andKey:(id)a4
{
  return objc_msgSend( -[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3),  "objectForKey:",  objc_msgSend(a4, "stringByAppendingString:", @"SizeScript"));
}

- (BOOL)hasMultiImageInputForEffectID:(id)a3
{
  return objc_msgSend( objc_msgSend( -[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3),  "objectForKey:",  @"hasMultiImageInput"),  "BOOLValue");
}

- (id)imageInputInfosForEffectID:(id)a3
{
  return objc_msgSend( -[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3),  "objectForKey:",  @"imageInputInfo");
}

- (id)imageProviderInfosForEffectID:(id)a3
{
  return objc_msgSend( -[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3),  "objectForKey:",  @"imageProviderInfo");
}

- (BOOL)isOpaqueForEffectID:(id)a3
{
  if (objc_msgSend( -[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:"),  "objectForKey:",  @"isOpaque"))
  {
    return objc_msgSend( objc_msgSend( -[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3),  "objectForKey:",  @"isOpaque"),  "BOOLValue");
  }

  else
  {
    return 1;
  }

- (double)defaultPhaseInDurationForEffectID:(id)a3
{
  return result;
}

- (double)defaultMainDurationForEffectID:(id)a3
{
  return result;
}

- (double)defaultPhaseOutDurationForEffectID:(id)a3
{
  return result;
}

- (BOOL)hasCustomTimingForEffectID:(id)a3
{
  return -[objc_class hasCustomTiming]( -[MREffectManager classForEffectID:](self, "classForEffectID:", a3),  "hasCustomTiming");
}

- (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  return -[objc_class customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:]( -[MREffectManager classForEffectID:](self, "classForEffectID:"),  "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:",  a3,  a4,  a5,  a6,  a7);
}

- (id)defaultEffectAttributesWithEffectID:(id)a3 andSlideInformation:(id)a4
{
  return -[objc_class defaultEffectAttributesWithEffectID:andSlideInformation:]( -[MREffectManager classForEffectID:](self, "classForEffectID:"),  "defaultEffectAttributesWithEffectID:andSlideInformation:",  a3,  a4);
}

- (id)attributeDescriptionForEffectID:(id)a3 andKey:(id)a4
{
  return objc_msgSend( objc_msgSend( -[MREffectManager descriptionForEffectID:](self, "descriptionForEffectID:", a3),  "objectForKey:",  @"attributes"),  "objectForKey:",  a4);
}

- (double)lineSpacingFactorForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5
{
  if (a4) {
    id v6 = (const __CFString *)a4;
  }
  else {
    id v6 = @"Default";
  }
  id v7 = objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  a3,  v6),  "objectForKey:",  @"textSettings");
  else {
    id v8 = [v7 objectAtIndex:a5];
  }
  id v9 = [v8 objectForKey:@"lineSpacing"];
  if (!v9) {
    return 1.0;
  }
  [v9 floatValue];
  return v10;
}

@end