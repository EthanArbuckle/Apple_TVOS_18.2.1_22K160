@interface MCFilter
- (MCFilter)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSDictionary)attributes;
- (NSSet)animationPaths;
- (NSString)filterID;
- (id)animationPathForKey:(id)a3;
- (id)attributeForKey:(id)a3;
- (id)imprint;
- (id)imprintsForAnimationPaths;
- (unint64_t)countOfAnimationPaths;
- (unint64_t)index;
- (void)_copySelfToSnapshot:(id)a3;
- (void)addAnimationPath:(id)a3;
- (void)demolish;
- (void)demolishAnimationPaths;
- (void)initAnimationPathsWithImprints:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllAnimationPaths;
- (void)removeAnimationPathForKey:(id)a3;
- (void)setAttribute:(id)a3 forKey:(id)a4;
- (void)setAttributes:(id)a3;
- (void)setFilterID:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation MCFilter

- (MCFilter)initWithImprint:(id)a3 andMontage:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCFilter;
  v5 = -[MCObject initWithImprint:andMontage:](&v8, "initWithImprint:andMontage:", a3, a4);
  if (v5)
  {
    v5->mFilterID = (NSString *)[a3 objectForKey:@"filterID"];
    v5->mAttributes = -[NSMutableDictionary initWithDictionary:]( [NSMutableDictionary alloc],  "initWithDictionary:",  [a3 objectForKey:@"attributes"]);
    id v6 = [a3 objectForKey:@"animationPaths"];
    if (v6) {
      -[MCFilter initAnimationPathsWithImprints:](v5, "initAnimationPathsWithImprints:", v6);
    }
  }

  return v5;
}

- (void)demolish
{
  self->mFilterID = 0LL;
  self->mAttributes = 0LL;
  -[MCFilter demolishAnimationPaths](self, "demolishAnimationPaths");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCFilter;
  -[MCObject demolish](&v3, "demolish");
}

- (id)imprint
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCFilter;
  id v3 = -[MCObject imprint](&v8, "imprint");
  v4 = v3;
  mFilterID = self->mFilterID;
  if (mFilterID) {
    [v3 setObject:mFilterID forKey:@"filterID"];
  }
  mAttributes = self->mAttributes;
  if (mAttributes) {
    [v4 setObject:mAttributes forKey:@"attributes"];
  }
  if (-[NSMutableSet count](self->mAnimationPaths, "count")) {
    objc_msgSend( v4,  "setObject:forKey:",  -[MCFilter imprintsForAnimationPaths](self, "imprintsForAnimationPaths"),  @"animationPaths");
  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

- (id)attributeForKey:(id)a3
{
  if (-[MCObject isSnapshot](self, "isSnapshot")) {
    return -[NSMutableDictionary objectForKey:](self->mAttributes, "objectForKey:", a3);
  }
  objc_sync_enter(self);
  id v6 = -[NSMutableDictionary objectForKey:](self->mAttributes, "objectForKey:", a3);
  objc_sync_exit(self);
  return v6;
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  mAttributes = self->mAttributes;
  if (a3)
  {
    if (mAttributes) {
      -[NSMutableDictionary setObject:forKey:](mAttributes, "setObject:forKey:", a3, a4);
    }
    else {
      self->mAttributes = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  a3,  a4,  0LL);
    }
  }

  else if (mAttributes)
  {
    -[NSMutableDictionary removeObjectForKey:](mAttributes, "removeObjectForKey:", a4);
  }

  objc_sync_exit(self);
  -[MCFilter didChangeValueForKey:](self, "didChangeValueForKey:", @"attributes");
}

- (NSDictionary)attributes
{
  if (-[MCObject isSnapshot](self, "isSnapshot")) {
    return &self->mAttributes->super;
  }
  objc_sync_enter(self);
  id v3 = +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  self->mAttributes);
  objc_sync_exit(self);
  return v3;
}

- (void)setAttributes:(id)a3
{
  self->mAttributes = 0LL;
  if (a3) {
    self->mAttributes = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a3);
  }
  objc_sync_exit(self);
}

- (void)_copySelfToSnapshot:(id)a3
{
  mFilterID = self->mFilterID;
  if (mFilterID) {
    *((void *)a3 + 6) = -[NSString copy](mFilterID, "copy");
  }
  mAttributes = self->mAttributes;
  if (mAttributes) {
    *((void *)a3 + 3) = -[NSMutableDictionary copy](mAttributes, "copy");
  }
  *((void *)a3 + 5) = self->mIndex;
  if (self->mAnimationPaths)
  {
    v7 = -[MCFilter animationPaths](self, "animationPaths");
    if (-[NSSet count](v7, "count"))
    {
      *((void *)a3 + 4) = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSSet count](v7, "count"));
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v8)
      {
        uint64_t v9 = *(void *)v12;
        do
        {
          v10 = 0LL;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend( *((id *)a3 + 4),  "addObject:",  objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "snapshot"));
            v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
        }

        while (v8);
      }
    }
  }

  objc_sync_exit(self);
}

- (unint64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (NSString)filterID
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setFilterID:(id)a3
{
}

- (void)initAnimationPathsWithImprints:(id)a3
{
  if (a3)
  {
    if ([a3 count])
    {
      self->mAnimationPaths = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v5 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v17;
        do
        {
          id v8 = 0LL;
          do
          {
            if (*(void *)v17 != v7) {
              objc_enumerationMutation(a3);
            }
            id v9 = +[MCObjectLight objectWithImprint:]( &OBJC_CLASS___MCObjectLight,  "objectWithImprint:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v8));
            -[NSMutableSet addObject:](self->mAnimationPaths, "addObject:", v9);
            if (!-[MCObject isSnapshot](self, "isSnapshot"))
            {
              uint64_t v11 = objc_opt_class(&OBJC_CLASS___MCAnimationPathKeyframed, v10);
              char isKindOfClass = objc_opt_isKindOfClass(v9, v11);
              __int128 v14 = @"keyframes";
              if ((isKindOfClass & 1) == 0)
              {
                uint64_t v15 = objc_opt_class(&OBJC_CLASS___MCAnimationPathCombo, v13);
                if ((objc_opt_isKindOfClass(v9, v15) & 1) == 0) {
                  goto LABEL_13;
                }
                [v9 addObserver:self forKeyPath:@"combineOperation" options:0 context:0];
                __int128 v14 = @"animationPaths";
              }

              [v9 addObserver:self forKeyPath:v14 options:0 context:0];
            }

- (void)demolishAnimationPaths
{
  mAnimationPaths = self->mAnimationPaths;
  if (mAnimationPaths)
  {
    obj = mAnimationPaths;
    objc_sync_enter(mAnimationPaths);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v4 = self->mAnimationPaths;
    id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (!v5) {
      goto LABEL_14;
    }
    uint64_t v6 = *(void *)v18;
    while (1)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (!-[MCObject isSnapshot](self, "isSnapshot"))
        {
          uint64_t v10 = objc_opt_class(&OBJC_CLASS___MCAnimationPathKeyframed, v9);
          char isKindOfClass = objc_opt_isKindOfClass(v8, v10);
          uint64_t v13 = @"keyframes";
          if ((isKindOfClass & 1) == 0)
          {
            uint64_t v14 = objc_opt_class(&OBJC_CLASS___MCAnimationPathCombo, v12);
            if ((objc_opt_isKindOfClass(v8, v14) & 1) == 0) {
              goto LABEL_12;
            }
            [v8 removeObserver:self forKeyPath:@"combineOperation"];
            uint64_t v13 = @"animationPaths";
          }

          [v8 removeObserver:self forKeyPath:v13];
        }

- (id)imprintsForAnimationPaths
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v4 = -[MCFilter animationPaths](self, "animationPaths", 0LL);
  id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "imprint"));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (NSSet)animationPaths
{
  id v3 = (NSSet *)sEmptySet;
  unsigned __int8 v4 = -[MCObject isSnapshot](self, "isSnapshot");
  mAnimationPaths = self->mAnimationPaths;
  if ((v4 & 1) == 0)
  {
    if (mAnimationPaths)
    {
      objc_sync_enter(self->mAnimationPaths);
      if (-[NSMutableSet count](self->mAnimationPaths, "count")) {
        id v3 = -[NSSet initWithSet:](objc_alloc(&OBJC_CLASS___NSSet), "initWithSet:", self->mAnimationPaths);
      }
      objc_sync_exit(mAnimationPaths);
    }

    return v3;
  }

  return &mAnimationPaths->super;
}

- (unint64_t)countOfAnimationPaths
{
  unsigned int v3 = -[MCObject isSnapshot](self, "isSnapshot");
  mAnimationPaths = self->mAnimationPaths;
  if (v3) {
    return (unint64_t)-[NSMutableSet count](self->mAnimationPaths, "count");
  }
  if (!mAnimationPaths) {
    return 0LL;
  }
  objc_sync_enter(self->mAnimationPaths);
  id v6 = -[NSMutableSet count](self->mAnimationPaths, "count");
  objc_sync_exit(mAnimationPaths);
  return (unint64_t)v6;
}

- (id)animationPathForKey:(id)a3
{
  if (-[MCObject isSnapshot](self, "isSnapshot"))
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    mAnimationPaths = self->mAnimationPaths;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mAnimationPaths,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
LABEL_4:
      uint64_t v8 = 0LL;
      while (1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(mAnimationPaths);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        if (v6 == (id)++v8)
        {
          id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mAnimationPaths,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
          uint64_t v9 = 0LL;
          if (v6) {
            goto LABEL_4;
          }
          return v9;
        }
      }
    }

    return 0LL;
  }

  __int128 v10 = self->mAnimationPaths;
  if (!v10) {
    return 0LL;
  }
  objc_sync_enter(self->mAnimationPaths);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v11 = self->mAnimationPaths;
  id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (objc_msgSend(objc_msgSend(v9, "key"), "isEqualToString:", a3))
        {
          if (v9) {
            id v15 = v9;
          }
          goto LABEL_24;
        }
      }

      id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = 0LL;
LABEL_24:
  objc_sync_exit(v10);
  return v9;
}

- (void)addAnimationPath:(id)a3
{
  if (!self->mAnimationPaths)
  {
    objc_sync_enter(self);
    self->mAnimationPaths = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    objc_sync_exit(self);
  }

  __int128 v11 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", a3, 0LL);
  -[MCFilter willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL);
  mAnimationPaths = self->mAnimationPaths;
  objc_sync_enter(mAnimationPaths);
  -[NSMutableSet addObject:](self->mAnimationPaths, "addObject:", a3);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCAnimationPathKeyframed, v6);
  if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
  {
    uint64_t v9 = @"keyframes";
LABEL_7:
    [a3 addObserver:self forKeyPath:v9 options:0 context:0];
    goto LABEL_8;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___MCAnimationPathCombo, v8);
  if ((objc_opt_isKindOfClass(a3, v10) & 1) != 0)
  {
    [a3 addObserver:self forKeyPath:@"combineOperation" options:0 context:0];
    uint64_t v9 = @"animationPaths";
    goto LABEL_7;
  }

- (void)removeAnimationPathForKey:(id)a3
{
  mAnimationPaths = self->mAnimationPaths;
  if (!mAnimationPaths) {
    return;
  }
  objc_sync_enter(self->mAnimationPaths);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v6 = self->mAnimationPaths;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = *(void *)v19;
  while (2)
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
      if (objc_msgSend(objc_msgSend(v10, "key"), "isEqualToString:", a3))
      {
        if (!v10) {
          goto LABEL_14;
        }
        id v11 = v10;
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___MCAnimationPathKeyframed, v12);
        if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
        {
          id v15 = @"keyframes";
        }

        else
        {
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___MCAnimationPathCombo, v14);
          if ((objc_opt_isKindOfClass(v10, v16) & 1) == 0)
          {
LABEL_18:
            __int128 v17 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v10, 0LL);
            -[MCFilter willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v17);
            -[NSMutableSet removeObject:](self->mAnimationPaths, "removeObject:", v10);
            objc_sync_exit(mAnimationPaths);
            -[MCFilter didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v17);

            return;
          }

          [v10 removeObserver:self forKeyPath:@"combineOperation"];
          id v15 = @"animationPaths";
        }

        [v10 removeObserver:self forKeyPath:v15];
        goto LABEL_18;
      }
    }

    id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v7) {
      continue;
    }
    break;
  }

- (void)removeAllAnimationPaths
{
  if (-[NSMutableSet count](self->mAnimationPaths, "count"))
  {
    obj = self->mAnimationPaths;
    objc_sync_enter(obj);
    unsigned int v3 = -[NSSet initWithArray:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithArray:",  -[NSMutableSet allObjects](self->mAnimationPaths, "allObjects"));
    -[MCFilter willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v3);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    mAnimationPaths = self->mAnimationPaths;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mAnimationPaths,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (!v6) {
      goto LABEL_13;
    }
    uint64_t v7 = *(void *)v17;
    while (1)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(mAnimationPaths);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___MCAnimationPathKeyframed, v5);
        char isKindOfClass = objc_opt_isKindOfClass(v9, v10);
        uint64_t v13 = @"keyframes";
        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___MCAnimationPathCombo, v12);
          if ((objc_opt_isKindOfClass(v9, v14) & 1) == 0) {
            continue;
          }
          [v9 removeObserver:self forKeyPath:@"combineOperation"];
          uint64_t v13 = @"animationPaths";
        }

        [v9 removeObserver:self forKeyPath:v13];
      }

      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mAnimationPaths,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (!v6)
      {
LABEL_13:
        -[NSMutableSet removeAllObjects](self->mAnimationPaths, "removeAllObjects");
        objc_sync_exit(obj);
        -[MCFilter didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v3);

        return;
      }
    }
  }

@end