@interface MPTransitionManager
+ (id)sharedManager;
+ (void)loadTransitionManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (MPTransitionManager)initWithPaths:(id)a3;
- (double)beatStrengthForTransitionID:(id)a3;
- (double)bestBeatTimeForTransitionID:(id)a3;
- (double)defaultDurationForTransitionID:(id)a3;
- (id)allCategoryIDs;
- (id)allTransitionIDs;
- (id)attributesForTransitionID:(id)a3 andPresetID:(id)a4;
- (id)categoryIDsForTransitionID:(id)a3;
- (id)constraintsForTransitionPresetsMatchingList:(id)a3 andCriteria:(id)a4;
- (id)controlForAttribute:(id)a3 forTransitionID:(id)a4;
- (id)descriptionForTransitionID:(id)a3;
- (id)localizedCategoryNameFromCategoryID:(id)a3;
- (id)localizedNameForTransitionID:(id)a3 withLanguage:(id)a4;
- (id)localizedSettingsUITitleForTitleKey:(id)a3 inTransition:(id)a4;
- (id)localizedTransitionNameForTransitionID:(id)a3;
- (id)localizedTransitionNameForTransitionID:(id)a3 andPresetID:(id)a4;
- (id)presetsForTransitionID:(id)a3;
- (id)randomTransitionPresetFromList:(id)a3 abidingWithConstraints:(id)a4;
- (id)settingsUIControlDescriptionsForTransition:(id)a3;
- (id)transitionPresetsMatchingCriteria:(id)a3;
- (id)transitionsForCategoryID:(id)a3;
- (id)versionOfTransitionID:(id)a3;
- (int64_t)transitionNeedsRandomSeedInformation:(id)a3;
- (void)dealloc;
@end

@implementation MPTransitionManager

+ (id)sharedManager
{
  id result = (id)qword_2B04B8;
  if (!qword_2B04B8)
  {
    objc_sync_enter(a1);
    if (!qword_2B04B8) {
      qword_2B04B8 = -[MPTransitionManager initWithPaths:]( objc_alloc(&OBJC_CLASS___MPTransitionManager),  "initWithPaths:",  0LL);
    }
    objc_sync_exit(a1);
    return (id)qword_2B04B8;
  }

  return result;
}

+ (void)releaseSharedManager
{
  if (qword_2B04B8)
  {
    objc_sync_enter(a1);

    qword_2B04B8 = 0LL;
    objc_sync_exit(a1);
  }

- (void)dealloc
{
  self->mTransitionPresets = 0LL;
  self->mTransitions = 0LL;

  self->mTransitionCategories = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPTransitionManager;
  -[MPTransitionManager dealloc](&v3, "dealloc");
}

- (id)allTransitionIDs
{
  return -[NSMutableDictionary allKeys](self->mTransitions, "allKeys");
}

- (id)allCategoryIDs
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  objc_msgSend(v3, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->mTransitionCategories, "allKeys"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  obj = self->mTransitions;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = -[MPTransitionManager categoryIDsForTransitionID:]( self,  "categoryIDsForTransitionID:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)i));
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            for (j = 0LL; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)j);
            }

            id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }

          while (v10);
        }
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (id)versionOfTransitionID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"version");
}

- (id)categoryIDsForTransitionID:(id)a3
{
  return  objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"categories"),  "copy");
}

- (id)descriptionForTransitionID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3);
}

- (id)transitionsForCategoryID:(id)a3
{
  id v5 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  mTransitions = self->mTransitions;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mTransitions,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(mTransitions);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_msgSend( -[MPTransitionManager categoryIDsForTransitionID:]( self,  "categoryIDsForTransitionID:",  v11),  "containsObject:",  a3) & 1) != 0 || objc_msgSend(a3, "isEqualToString:", @"all"))
        {
          [v5 addObject:v11];
        }
      }

      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mTransitions,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (id)localizedTransitionNameForTransitionID:(id)a3
{
  id result = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:"),  "objectForKey:",  @"localizedTransitionName");
  if (!result)
  {
    else {
      return a3;
    }
  }

  return result;
}

- (id)localizedNameForTransitionID:(id)a3 withLanguage:(id)a4
{
  id v5 = +[NSDictionary dictionaryWithContentsOfFile:]( NSDictionary,  "dictionaryWithContentsOfFile:",  objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:"),  "objectForKey:",  @"resources"),  "stringByAppendingPathComponent:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@.lproj/LocalizedDescription.plist",  a4)));
  if (v5) {
    id v5 = -[NSDictionary objectForKey:](v5, "objectForKey:", @"_LOCALIZABLE_");
  }
  id result = -[NSDictionary objectForKey:](v5, "objectForKey:", @"localizedTransitionName");
  if (!result) {
    return a3;
  }
  return result;
}

- (id)localizedTransitionNameForTransitionID:(id)a3 andPresetID:(id)a4
{
  id result = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:"),  "objectForKey:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"localizedPresetID%@",  a4));
  if (!result)
  {
    else {
      return a3;
    }
  }

  return result;
}

- (id)localizedCategoryNameFromCategoryID:(id)a3
{
  id result = -[NSMutableDictionary objectForKey:](self->mTransitionCategories, "objectForKey:");
  if (!result)
  {
    id v6 = -[MPTransitionManager transitionsForCategoryID:](self, "transitionsForCategoryID:", a3);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
LABEL_5:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        id result = objc_msgSend( -[NSMutableDictionary objectForKey:]( self->mTransitions,  "objectForKey:",  *(void *)(*((void *)&v11 + 1) + 8 * v10)),  "objectForKey:",  @"localizedCategoryName");
        if (result) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v8) {
            goto LABEL_5;
          }
          return a3;
        }
      }
    }

    else
    {
      return a3;
    }
  }

  return result;
}

- (id)attributesForTransitionID:(id)a3 andPresetID:(id)a4
{
  id v8 = (NSMutableDictionary *)objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "objectForKey:",  a4);
  if (!v8)
  {
    id v8 = (NSMutableDictionary *)objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "objectForKey:",  @"Default");
    if (!v8)
    {
      id v8 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  0LL);
      id v9 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "mutableCopy");
      [v9 setObject:v8 forKey:@"Default"];
      objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "setObject:forKey:",  v9,  @"presets");
    }
  }

  return v8;
}

- (id)localizedSettingsUITitleForTitleKey:(id)a3 inTransition:(id)a4
{
  id result = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a4),  "objectForKey:",  @"localizedSettingsUI"),  "objectForKey:",  a3);
  if (!result) {
    return a3;
  }
  return result;
}

- (id)settingsUIControlDescriptionsForTransition:(id)a3
{
  return  objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"settingsUI"),  "copy");
}

- (id)controlForAttribute:(id)a3 forTransitionID:(id)a4
{
  id v5 = -[MPTransitionManager settingsUIControlDescriptionsForTransition:]( self,  "settingsUIControlDescriptionsForTransition:",  a4);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0LL;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend( objc_msgSend(v10, "objectForKey:", kMPTransitionUIControlAttributeKey[0]),  "isEqualToString:",  a3)) {
      return v10;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (double)defaultDurationForTransitionID:(id)a3
{
  id v5 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"duration");
  if (!v5) {
    return 1.0;
  }
  [v5 doubleValue];
  return result;
}

- (id)presetsForTransitionID:(id)a3
{
  return objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "allKeys");
}

+ (void)loadTransitionManagerWithPaths:(id)a3
{
  if (qword_2B04B8)
  {

    qword_2B04B8 = 0LL;
  }

  qword_2B04B8 = -[MPTransitionManager initWithPaths:]( objc_alloc(&OBJC_CLASS___MPTransitionManager),  "initWithPaths:",  a3);
}

- (id)constraintsForTransitionPresetsMatchingList:(id)a3 andCriteria:(id)a4
{
  id v5 = a3;
  if (!a3) {
    id v5 = -[NSMutableDictionary allKeys](self->mTransitions, "allKeys");
  }
  if (![v5 count]) {
    return 0LL;
  }
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v52;
    id obj = v5;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(obj);
        }
        __int128 v11 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        if ([v11 rangeOfString:@"/"] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v12 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", v11),  "objectForKey:",  @"presets"),  "allKeys");
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          id v13 = [v12 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v48;
            do
            {
              for (j = 0LL; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v48 != v15) {
                  objc_enumerationMutation(v12);
                }
                -[NSMutableSet addObject:]( v6,  "addObject:",  [v11 stringByAppendingPathComponent:*(void *)(*((void *)&v47 + 1) + 8 * (void)j)]);
              }

              id v14 = [v12 countByEnumeratingWithState:&v47 objects:v57 count:16];
            }

            while (v14);
          }
        }

        else
        {
          -[NSMutableSet addObject:](v6, "addObject:", v11);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    }

    while (v8);
  }

  id v32 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v43,  v56,  16LL);
  if (v34)
  {
    uint64_t v33 = *(void *)v44;
    do
    {
      for (k = 0LL; k != v34; k = (char *)k + 1)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(v6);
        }
        __int128 v18 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)k);
        id v19 = [v18 stringByDeletingLastPathComponent];
        id v20 = [v18 lastPathComponent];
        id v21 = -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", v19);
        id v22 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", v19),  "objectForKey:",  @"presets"),  "objectForKey:",  v20);
        id obja = v21;
        id v23 = [v21 objectForKey:@"tags"];
        v36 = v22;
        id v24 = [v22 objectForKey:@"tags"];
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v25 = [a4 countByEnumeratingWithState:&v39 objects:v55 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v40;
LABEL_28:
          uint64_t v28 = 0LL;
          while (1)
          {
            if (*(void *)v40 != v27) {
              objc_enumerationMutation(a4);
            }
            uint64_t v29 = *(void *)(*((void *)&v39 + 1) + 8 * v28);
            if (([v24 containsObject:v29] & 1) == 0
              && ![v23 containsObject:v29])
            {
              break;
            }

            if (v26 == (id)++v28)
            {
              id v26 = [a4 countByEnumeratingWithState:&v39 objects:v55 count:16];
              if (v26) {
                goto LABEL_28;
              }
              goto LABEL_37;
            }
          }

          if (v29) {
            continue;
          }
        }

- (id)randomTransitionPresetFromList:(id)a3 abidingWithConstraints:(id)a4
{
  if (a4)
  {
    id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v22 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      id v20 = v6;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(a3);
          }
          uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          id v9 = [a3 objectForKey:v8];
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          id v10 = [a4 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v24;
LABEL_9:
            uint64_t v13 = 0LL;
            while (1)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(a4);
              }
              uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
              if ([v9 objectForKey:v14])
              {
                objc_msgSend(objc_msgSend(a4, "objectForKey:", v14), "floatValue");
                NSUInteger v16 = (unint64_t)v15;
                NSRange v17 = NSRangeFromString((NSString *)[v9 objectForKey:v14]);
                if (v16 < v17.location || v16 - v17.location >= v17.length) {
                  break;
                }
              }

              if (v11 == (id)++v13)
              {
                id v11 = [a4 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                goto LABEL_21;
              }
            }

            if (v14) {
              continue;
            }
          }

- (id)transitionPresetsMatchingCriteria:(id)a3
{
  id v28 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v23 = self;
  id obj = self->mTransitions;
  id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  v47,  16LL);
  if (v26)
  {
    uint64_t v25 = *(void *)v42;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v5;
        __int128 v29 = *(void **)(*((void *)&v41 + 1) + 8 * v5);
        if (([v29 isEqualToString:@"Default"] & 1) == 0)
        {
          id v6 = -[NSMutableDictionary objectForKey:](v23->mTransitions, "objectForKey:", v29);
          id v7 = (NSDictionary *)[v6 objectForKey:@"presets"];
          if (!v7) {
            id v7 = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"),  @"Default");
          }
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          id v32 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v37,  v46,  16LL);
          if (v32)
          {
            uint64_t v30 = *(void *)v38;
            v31 = v7;
            do
            {
              for (i = 0LL; i != v32; i = (char *)i + 1)
              {
                if (*(void *)v38 != v30) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v9 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
                id v10 = -[NSDictionary objectForKey:](v7, "objectForKey:", v9);
                __int128 v33 = 0u;
                __int128 v34 = 0u;
                __int128 v35 = 0u;
                __int128 v36 = 0u;
                id v11 = [a3 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v11)
                {
                  id v12 = v11;
                  uint64_t v13 = *(void *)v34;
LABEL_16:
                  uint64_t v14 = 0LL;
                  while (1)
                  {
                    if (*(void *)v34 != v13) {
                      objc_enumerationMutation(a3);
                    }
                    uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
                    if ([v10 objectForKey:v15])
                    {
                      objc_msgSend(objc_msgSend(a3, "objectForKey:", v15), "floatValue");
                      NSUInteger v17 = (unint64_t)v16;
                      __int128 v18 = v10;
                    }

                    else
                    {
                      if (![v6 objectForKey:v15]) {
                        goto LABEL_27;
                      }
                      objc_msgSend(objc_msgSend(a3, "objectForKey:", v15), "floatValue");
                      NSUInteger v17 = (unint64_t)v19;
                      __int128 v18 = v6;
                    }

                    NSRange v20 = NSRangeFromString((NSString *)[v18 objectForKey:v15]);
                    if (v17 < v20.location || v17 - v20.location >= v20.length)
                    {
                      if (v15) {
                        goto LABEL_32;
                      }
                      break;
                    }

- (double)beatStrengthForTransitionID:(id)a3
{
  id v3 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"beatStrength");
  if (!v3) {
    return 0.375;
  }
  [v3 floatValue];
  return v4;
}

- (double)bestBeatTimeForTransitionID:(id)a3
{
  id v3 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"bestBeatTime");
  if (!v3) {
    return -1.0;
  }
  [v3 floatValue];
  return v4;
}

- (int64_t)transitionNeedsRandomSeedInformation:(id)a3
{
  return objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mTransitions, "objectForKey:", a3),  "objectForKey:",  @"needsRandomSeed"),  "BOOLValue");
}

- (MPTransitionManager)initWithPaths:(id)a3
{
  v81.receiver = self;
  v81.super_class = (Class)&OBJC_CLASS___MPTransitionManager;
  float v4 = -[MPTransitionManager init](&v81, "init");
  if (v4)
  {
    v4->mTransitions = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4->mTransitionCategories = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    id v7 = v5;
    if (a3) {
      [v5 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend( v5,  "addObject:",  -[NSString stringByAppendingPathComponent:]( -[NSBundle resourcePath]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(MPTransitionManager, v6)),  "resourcePath"),  "stringByAppendingPathComponent:",  @"Content"));
    }
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    id obj = v7;
    __int128 v49 = (char *)[v7 countByEnumeratingWithState:&v77 objects:v87 count:16];
    if (v49)
    {
      uint64_t v48 = *(void *)v78;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v78 != v48) {
            objc_enumerationMutation(obj);
          }
          __int128 v50 = v8;
          v55 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)v8);
          -[NSMutableDictionary addEntriesFromDictionary:]( v4->mTransitionCategories,  "addEntriesFromDictionary:",  +[NSDictionary dictionaryWithContentsOfFile:]( NSDictionary,  "dictionaryWithContentsOfFile:",  [v55 stringByAppendingPathComponent:@"LocalizedTransitionCategories.plist"]));
          uint64_t v9 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"TransitionDescriptions.plist",  @"TransitionDescriptionsSynergy.plist",  0LL);
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          __int128 v52 = v9;
          id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v73,  v86,  16LL);
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v74;
            do
            {
              for (i = 0LL; i != v11; i = (char *)i + 1)
              {
                if (*(void *)v74 != v12) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v14 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [v55 stringByAppendingPathComponent:*(void *)(*((void *)&v73 + 1) + 8 * (void)i)]);
                if (v14)
                {
                  id v15 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v14,  2LL,  0LL,  0LL);
                  if (v15)
                  {
                    float v16 = v15;
                    __int128 v71 = 0u;
                    __int128 v72 = 0u;
                    __int128 v69 = 0u;
                    __int128 v70 = 0u;
                    id v17 = [v15 countByEnumeratingWithState:&v69 objects:v85 count:16];
                    if (v17)
                    {
                      id v18 = v17;
                      uint64_t v19 = *(void *)v70;
                      do
                      {
                        for (j = 0LL; j != v18; j = (char *)j + 1)
                        {
                          if (*(void *)v70 != v19) {
                            objc_enumerationMutation(v16);
                          }
                          -[NSMutableDictionary setObject:forKey:]( v4->mTransitions,  "setObject:forKey:",   objc_msgSend( objc_msgSend(v16, "objectForKey:", *(void *)(*((void *)&v69 + 1) + 8 * (void)j)),  "mutableCopy"),  *(void *)(*((void *)&v69 + 1) + 8 * (void)j));
                        }

                        id v18 = [v16 countByEnumeratingWithState:&v69 objects:v85 count:16];
                      }

                      while (v18);
                    }
                  }
                }
              }

              id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v52,  "countByEnumeratingWithState:objects:count:",  &v73,  v86,  16LL);
            }

            while (v11);
          }

          uint64_t v21 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  [v55 stringByAppendingPathComponent:@"Transitions/"],  0);
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v65,  v84,  16LL);
          __int128 v23 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
          if (v22)
          {
            id v24 = v22;
            uint64_t v25 = *(void *)v66;
            __int128 v53 = v21;
            do
            {
              for (k = 0LL; k != v24; k = (char *)k + 1)
              {
                if (*(void *)v66 != v25) {
                  objc_enumerationMutation(v21);
                }
                id v27 = [v55 stringByAppendingFormat:@"/Transitions/%@", *(void *)(*((void *)&v65 + 1) + 8 * (void)k)];
                if (objc_msgSend( objc_msgSend(v27, "pathExtension"),  "isEqualToString:",  @"mrbTransition"))
                {
                  id v28 = [objc_alloc((Class)v23[206]) initWithPath:v27];
                  if (v28)
                  {
                    __int128 v29 = v28;
                    id v30 = objc_msgSend(objc_msgSend(v27, "lastPathComponent"), "stringByDeletingPathExtension");
                    id v31 = [v29 pathForResource:@"TransitionDescription" ofType:@"plist"];
                    id v32 = [v29 pathForResource:@"LocalizedDescription" ofType:@"plist"];
                    if (v31)
                    {
                      id v33 = v32;
                      __int128 v34 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v31);
                      if (v34)
                      {
                        id v35 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v34,  2LL,  0LL,  0LL);
                        if (v35)
                        {
                          __int128 v36 = v35;
                          if (v33)
                          {
                            __int128 v37 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v33);
                            if (v37) {
                              objc_msgSend( v36,  "addEntriesFromDictionary:",  -[NSDictionary objectForKey:](v37, "objectForKey:", @"_LOCALIZABLE_"));
                            }
                          }

                          objc_msgSend( v36,  "setObject:forKey:",  objc_msgSend(objc_msgSend(v29, "infoDictionary"), "objectForKey:", @"CFBundleVersion"),  @"version");
                          objc_msgSend( v36,  "setObject:forKey:",  objc_msgSend(v27, "stringByAppendingPathComponent:", @"Contents/Resources/"),  @"resources");
                          [v36 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v27, @"Icon.tiff"), @"thumbnail" forKey];
                          [v36 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v27, objc_msgSend(v36, "objectForKey:", @"patchName")), @"patchPath" forKey];
                          -[NSMutableDictionary setObject:forKey:](v4->mTransitions, "setObject:forKey:", v36, v30);
                          uint64_t v21 = v53;
                        }
                      }
                    }

                    __int128 v23 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
                  }
                }
              }

              id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v65,  v84,  16LL);
            }

            while (v24);
          }

          uint64_t v8 = v50 + 1;
        }

        while (v50 + 1 != v49);
        __int128 v49 = (char *)[obj countByEnumeratingWithState:&v77 objects:v87 count:16];
      }

      while (v49);
    }

    v4->mTransitionPresets = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    mTransitions = v4->mTransitions;
    id v56 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mTransitions,  "countByEnumeratingWithState:objects:count:",  &v61,  v83,  16LL);
    if (v56)
    {
      id v54 = *(id *)v62;
      do
      {
        for (m = 0LL; m != v56; m = (char *)m + 1)
        {
          if (*(id *)v62 != v54) {
            objc_enumerationMutation(mTransitions);
          }
          __int128 v39 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)m);
          id v40 = objc_msgSend( -[NSMutableDictionary objectForKey:](v4->mTransitions, "objectForKey:", v39),  "objectForKey:",  @"presets");
          if (v40)
          {
            __int128 v41 = v40;
            __int128 v59 = 0u;
            __int128 v60 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            id v42 = [v40 countByEnumeratingWithState:&v57 objects:v82 count:16];
            if (v42)
            {
              id v43 = v42;
              uint64_t v44 = *(void *)v58;
              do
              {
                for (n = 0LL; n != v43; n = (char *)n + 1)
                {
                  if (*(void *)v58 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  -[NSMutableDictionary setObject:forKey:]( v4->mTransitionPresets,  "setObject:forKey:",  [v41 objectForKey:*(void *)(*((void *)&v57 + 1) + 8 * (void)n)],  objc_msgSend( v39,  "stringByAppendingPathComponent:",  *(void *)(*((void *)&v57 + 1) + 8 * (void)n)));
                }

                id v43 = [v41 countByEnumeratingWithState:&v57 objects:v82 count:16];
              }

              while (v43);
            }
          }

          else
          {
            -[NSMutableDictionary setObject:forKey:]( v4->mTransitionPresets,  "setObject:forKey:",  +[NSDictionary dictionary](NSDictionary, "dictionary"),  [v39 stringByAppendingPathComponent:@"Default"]);
          }
        }

        id v56 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mTransitions,  "countByEnumeratingWithState:objects:count:",  &v61,  v83,  16LL);
      }

      while (v56);
    }
  }

  return v4;
}

@end