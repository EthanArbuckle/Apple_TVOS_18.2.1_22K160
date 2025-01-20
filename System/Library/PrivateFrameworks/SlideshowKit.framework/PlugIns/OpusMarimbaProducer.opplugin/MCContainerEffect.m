@interface MCContainerEffect
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)isLive;
- (MCContainerEffect)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSArray)orderedSlides;
- (NSArray)orderedTexts;
- (NSDictionary)actions;
- (NSDictionary)effectAttributes;
- (NSSet)slides;
- (NSSet)texts;
- (NSString)effectID;
- (id)actionForKey:(id)a3;
- (id)addSlide;
- (id)addSlideForAsset:(id)a3;
- (id)addSlideForContainer:(id)a3;
- (id)addSlides:(int64_t)a3;
- (id)addSlidesForAssets:(id)a3;
- (id)addTextForAsset:(id)a3 andKey:(id)a4;
- (id)addTextForAttributedString:(id)a3;
- (id)addTextsForAssets:(id)a3 andKey:(id)a4;
- (id)addTextsForAttributedStrings:(id)a3;
- (id)effectAttributeForKey:(id)a3;
- (id)imprint;
- (id)imprintsForActions;
- (id)insertSlideAtIndex:(int64_t)a3;
- (id)insertSlideForAsset:(id)a3 atIndex:(unint64_t)a4;
- (id)insertSlideForContainer:(id)a3 atIndex:(unint64_t)a4;
- (id)insertSlidesForAssets:(id)a3 atIndex:(unint64_t)a4;
- (id)insertTextForAsset:(id)a3 andKey:(id)a4 atIndex:(unint64_t)a5;
- (id)insertTextForAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (id)insertTextsForAssets:(id)a3 andKey:(id)a4 atIndex:(unint64_t)a5;
- (id)insertTextsForAttributedStrings:(id)a3 atIndex:(unint64_t)a4;
- (id)slideAtIndex:(unint64_t)a3;
- (id)textAtIndex:(unint64_t)a3;
- (unint64_t)countOfActions;
- (unint64_t)countOfSlides;
- (unint64_t)countOfTexts;
- (unint64_t)nextAvailableSlideIndex;
- (unint64_t)nextAvailableTextIndex;
- (void)addEffectAttributes:(id)a3;
- (void)demolish;
- (void)demolishActions;
- (void)initActionsWithImprints:(id)a3;
- (void)moveSlidesAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)moveTextsAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeActionForKey:(id)a3;
- (void)removeAllActions;
- (void)removeAllSlides;
- (void)removeAllTexts;
- (void)removeSlidesAtIndices:(id)a3;
- (void)removeTextsAtIndices:(id)a3;
- (void)setAction:(id)a3 forKey:(id)a4;
- (void)setEffectAttribute:(id)a3 forKey:(id)a4;
- (void)setEffectAttributes:(id)a3;
- (void)setEffectID:(id)a3;
- (void)setIsLive:(BOOL)a3;
@end

@implementation MCContainerEffect

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MCContainerEffect;
  return objc_msgSendSuper2(&v6, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCContainerEffect)initWithImprint:(id)a3 andMontage:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MCContainerEffect;
  objc_super v6 = -[MCContainer initWithImprint:andMontage:](&v31, "initWithImprint:andMontage:");
  if (v6)
  {
    id v7 = [a3 objectForKey:@"slides"];
    if (v7)
    {
      v8 = v7;
      if ([v7 count])
      {
        v6->mSlides = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v28;
          do
          {
            for (i = 0LL; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)i),  a4);
              -[NSMutableArray addObject:](v6->mSlides, "addObject:", v13);
              -[MCObject setContainer:](v13, "setContainer:", v6);
            }

            id v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
          }

          while (v10);
        }
      }
    }

    id v14 = [a3 objectForKey:@"texts"];
    if (v14)
    {
      v15 = v14;
      if ([v14 count])
      {
        v6->mTexts = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v16 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            for (j = 0LL; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)j),  a4);
              -[NSMutableArray addObject:](v6->mTexts, "addObject:", v20);
              -[MCObject setContainer:](v20, "setContainer:", v6);
              if (!-[MCObject isSnapshot](v6, "isSnapshot")) {
                -[MCObject addObserver:forKeyPath:options:context:]( v20,  "addObserver:forKeyPath:options:context:",  v6,  @"attributedString",  0LL,  0LL);
              }
            }

            id v17 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
          }

          while (v17);
        }
      }
    }

    id v21 = [a3 objectForKey:@"actions"];
    if (v21) {
      -[MCContainerEffect initActionsWithImprints:](v6, "initActionsWithImprints:", v21);
    }
    v6->mEffectID = (NSString *)[a3 objectForKey:@"effectID"];
    v6->mEffectAttributes = -[NSMutableDictionary initWithDictionary:]( [NSMutableDictionary alloc],  "initWithDictionary:",  [a3 objectForKey:@"effectAttributes"]);
  }

  return v6;
}

- (void)demolish
{
  self->mEffectID = 0LL;
  self->mEffectAttributes = 0LL;
  -[MCContainerEffect demolishActions](self, "demolishActions");
  mSlides = self->mSlides;
  objc_sync_enter(mSlides);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v4 = self->mSlides;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)i) demolish];
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v5);
  }

  objc_sync_enter(self);
  v8 = self->mSlides;
  self->mSlides = 0LL;
  objc_sync_exit(self);
  objc_sync_exit(mSlides);
  mTexts = self->mTexts;
  objc_sync_enter(mTexts);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = self->mTexts;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)j);
        if (!-[MCObject isSnapshot](self, "isSnapshot")) {
          [v14 removeObserver:self forKeyPath:@"attributedString"];
        }
        [v14 demolish];
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v11);
  }

  objc_sync_enter(self);

  self->mTexts = 0LL;
  objc_sync_exit(self);
  objc_sync_exit(mTexts);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCContainerEffect;
  -[MCContainer demolish](&v15, "demolish");
}

- (id)imprint
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MCContainerEffect;
  id v3 = -[MCContainer imprint](&v26, "imprint");
  v4 = objc_autoreleasePoolPush();
  id v5 = -[MCContainerEffect slides](self, "slides");
  if (-[NSSet count](v5, "count"))
  {
    id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v7 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v28,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v10), "imprint"));
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v28,  16LL);
      }

      while (v8);
    }

    [v3 setObject:v6 forKey:@"slides"];
  }

  id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  uint64_t v12 = -[MCContainerEffect texts](self, "texts");
  if (-[NSSet count](v12, "count"))
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v13 = -[NSSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v18,  v27,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        __int128 v16 = 0LL;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v16), "imprint"));
          __int128 v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = -[NSSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v18,  v27,  16LL);
      }

      while (v14);
    }

    [v3 setObject:v11 forKey:@"texts"];
  }

  if (-[NSMutableDictionary count](self->mActions, "count")) {
    objc_msgSend( v3,  "setObject:forKey:",  -[MCContainerEffect imprintsForActions](self, "imprintsForActions"),  @"actions");
  }
  [v3 setObject:self->mEffectID forKey:@"effectID"];
  [v3 setObject:self->mEffectAttributes forKey:@"effectAttributes"];
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MCText, a2);
  if ((objc_opt_isKindOfClass(a4, v8) & 1) != 0)
  {
    -[MCContainerEffect willChangeValueForKey:](self, "willChangeValueForKey:", @"texts");
    -[MCContainerEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"texts");
  }

- (NSSet)slides
{
  v2 = (NSSet *)sEmptySet;
  mSlides = self->mSlides;
  if (mSlides)
  {
    objc_sync_enter(self->mSlides);
    if (-[NSMutableArray count](self->mSlides, "count")) {
      v2 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", self->mSlides);
    }
    objc_sync_exit(mSlides);
  }

  return v2;
}

- (NSArray)orderedSlides
{
  mSlides = self->mSlides;
  if (!mSlides) {
    return (NSArray *)sEmptyArray;
  }
  objc_sync_enter(self->mSlides);
  if ((self->super.mFlags & 1) == 0)
  {
    v4 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"index",  1LL);
    id v5 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v4, 0LL);
    -[NSMutableArray sortUsingDescriptors:](self->mSlides, "sortUsingDescriptors:", v5);

    self->super.mFlags |= 1u;
  }

  id v6 = self->mSlides;
  objc_sync_exit(mSlides);
  return &v6->super;
}

- (unint64_t)countOfSlides
{
  mSlides = self->mSlides;
  if (!mSlides) {
    return 0LL;
  }
  objc_sync_enter(self->mSlides);
  id v4 = -[NSMutableArray count](self->mSlides, "count");
  objc_sync_exit(mSlides);
  return (unint64_t)v4;
}

- (unint64_t)nextAvailableSlideIndex
{
  mSlides = self->mSlides;
  if (!mSlides) {
    return 0LL;
  }
  objc_sync_enter(self->mSlides);
  if (self->mIsLive)
  {
    id v4 = self->mSlides;
    if ((self->super.mFlags & 1) != 0)
    {
      id v7 = (char *)objc_msgSend(-[NSMutableArray lastObject](v4, "lastObject"), "index") + 1;
    }

    else if (-[NSMutableArray count](v4, "count") {
           && (__int128 v14 = 0u,
    }
               __int128 v15 = 0u,
               __int128 v12 = 0u,
               __int128 v13 = 0u,
               id v5 = self->mSlides,
               (id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL)) != 0LL))
    {
      id v7 = 0LL;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (char *)[*(id *)(*((void *)&v12 + 1) + 8 * (void)i) index];
          if (v7 <= v10 + 1) {
            id v7 = v10 + 1;
          }
        }

        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v6);
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = (char *)-[NSMutableArray count](self->mSlides, "count");
  }

  objc_sync_exit(mSlides);
  return (unint64_t)v7;
}

- (id)slideAtIndex:(unint64_t)a3
{
  mSlides = self->mSlides;
  if (mSlides)
  {
    objc_sync_enter(self->mSlides);
    if ((self->super.mFlags & 1) != 0)
    {
      if ((unint64_t)-[NSMutableArray count](self->mSlides, "count") > a3)
      {
        id v12 = -[NSMutableArray objectAtIndex:](self->mSlides, "objectAtIndex:", a3);
LABEL_17:
        id v11 = v12;
        goto LABEL_18;
      }
    }

    else
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v6 = self->mSlides;
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7)
      {
        uint64_t v8 = *(void *)v15;
        while (2)
        {
          for (i = 0LL; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v6);
            }
            id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
            if ([v10 index] == (id)a3)
            {
              id v12 = v10;
              goto LABEL_17;
            }
          }

          id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
          id v11 = 0LL;
          if (v7) {
            continue;
          }
          goto LABEL_18;
        }
      }
    }

    id v11 = 0LL;
LABEL_18:
    objc_sync_exit(mSlides);
    return v11;
  }

  id v11 = 0LL;
  return v11;
}

- (id)addSlide
{
  return objc_msgSend(-[MCContainerEffect addSlides:](self, "addSlides:", 1), "objectAtIndex:", 0);
}

- (id)addSlides:(int64_t)a3
{
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  unint64_t v6 = -[MCContainerEffect nextAvailableSlideIndex](self, "nextAvailableSlideIndex");
  if (a3)
  {
    unint64_t v7 = v6;
    do
    {
      id v8 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCSlide),  "initFromScratchWithMontage:",  self->super.super.mMontage);
      [v8 setIndex:v7];
      [v5 addObject:v8];
      [v8 setContainer:self];

      ++v7;
      --a3;
    }

    while (a3);
  }

  if ([v5 count])
  {
    uint64_t v9 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v5);
    -[MCContainerEffect willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"slides",  1LL,  v9);
    mSlides = self->mSlides;
    if (mSlides)
    {
      objc_sync_enter(self->mSlides);
      if ((self->super.mFlags & 1) != 0)
      {
        objc_sync_enter(self);
        id v11 = -[NSMutableArray initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithArray:",  self->mSlides);
        id v12 = self->mSlides;
        self->mSlides = v11;
        objc_sync_exit(self);
      }

      -[NSMutableArray addObjectsFromArray:](self->mSlides, "addObjectsFromArray:", v5);
    }

    else
    {
      objc_sync_enter(self);
      self->mSlides = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v5);
      self->super.mFlags |= 1u;
      mSlides = self;
    }

    objc_sync_exit(mSlides);
    -[MCContainerEffect didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"slides",  1LL,  v9);
  }

  return v5;
}

- (id)insertSlideAtIndex:(int64_t)a3
{
  id v5 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCSlide),  "initFromScratchWithMontage:",  self->super.super.mMontage);
  [v5 setIndex:a3];
  [v5 setContainer:self];
  unint64_t v6 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v5, 0LL);
  -[MCContainerEffect willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"slides",  1LL,  v6);
  mSlides = self->mSlides;
  if (mSlides)
  {
    __int128 v17 = self->mSlides;
    objc_sync_enter(mSlides);
    if ((self->super.mFlags & 1) != 0)
    {
      objc_sync_enter(self);
      id v8 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", self->mSlides);
      uint64_t v9 = self->mSlides;
      self->mSlides = v8;
      self->super.mFlags ^= 1u;
      objc_sync_exit(self);
    }

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v10 = self->mSlides;
    id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          __int128 v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      }

      while (v11);
    }

    -[NSMutableArray addObject:](self->mSlides, "addObject:", v5);
    __int128 v15 = (MCContainerEffect *)v17;
  }

  else
  {
    objc_sync_enter(self);
    self->mSlides = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  v5,  0LL);
    self->super.mFlags |= 1u;
    __int128 v15 = self;
  }

  objc_sync_exit(v15);
  -[MCContainerEffect didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"slides",  1LL,  v6);

  return v5;
}

- (id)addSlideForAsset:(id)a3
{
  id v4 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  id v5 = -[MCContainerEffect insertSlidesForAssets:atIndex:]( self,  "insertSlidesForAssets:atIndex:",  v4,  -[MCContainerEffect nextAvailableSlideIndex](self, "nextAvailableSlideIndex"));

  return [v5 objectAtIndex:0];
}

- (id)addSlidesForAssets:(id)a3
{
  return -[MCContainerEffect insertSlidesForAssets:atIndex:]( self,  "insertSlidesForAssets:atIndex:",  a3,  -[MCContainerEffect nextAvailableSlideIndex](self, "nextAvailableSlideIndex"));
}

- (id)insertSlideForAsset:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t v6 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  id v7 = -[MCContainerEffect insertSlidesForAssets:atIndex:](self, "insertSlidesForAssets:atIndex:", v6, a4);

  return [v7 objectAtIndex:0];
}

- (id)insertSlidesForAssets:(id)a3 atIndex:(unint64_t)a4
{
  id v26 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    id v7 = 0LL;
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0LL;
      __int128 v24 = v7;
      id v10 = &v7[a4];
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)v9);
        id v12 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCSlide),  "initFromScratchWithMontage:",  self->super.super.mMontage);
        [v12 setAsset:v11];
        [v12 setIndex:(char *)v9 + (void)v10];
        [v26 addObject:v12];
        [v12 setContainer:self];

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [a3 countByEnumeratingWithState:&v31 objects:v36 count:16];
      id v7 = (char *)v9 + (void)v24;
    }

    while (v6);
    if ((char *)v9 + (void)v24)
    {
      __int128 v13 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v26);
      -[MCContainerEffect willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"slides",  1LL,  v13);
      mSlides = self->mSlides;
      if (mSlides)
      {
        objc_sync_enter(self->mSlides);
        if ((self->super.mFlags & 1) != 0)
        {
          objc_sync_enter(self);
          __int128 v15 = -[NSMutableArray initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithArray:",  self->mSlides);
          __int128 v16 = self->mSlides;
          self->mSlides = v15;
          self->super.mFlags ^= 1u;
          objc_sync_exit(self);
        }

        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v17 = self->mSlides;
        id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
        if (v18)
        {
          uint64_t v19 = *(void *)v28;
          __int128 v20 = (char *)v9 + (void)v24;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v17);
              }
              __int128 v22 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
            }

            id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v27,  v35,  16LL);
          }

          while (v18);
        }

        -[NSMutableArray addObjectsFromArray:](self->mSlides, "addObjectsFromArray:", v26);
      }

      else
      {
        objc_sync_enter(self);
        self->mSlides = -[NSMutableArray initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithArray:",  v26);
        self->super.mFlags |= 1u;
        mSlides = self;
      }

      objc_sync_exit(mSlides);
      -[MCContainerEffect didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"slides",  1LL,  v13);
    }
  }

  return v26;
}

- (id)addSlideForContainer:(id)a3
{
  return -[MCContainerEffect insertSlideForContainer:atIndex:]( self,  "insertSlideForContainer:atIndex:",  a3,  -[MCContainerEffect nextAvailableSlideIndex](self, "nextAvailableSlideIndex"));
}

- (id)insertSlideForContainer:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCSlide),  "initFromScratchWithMontage:",  self->super.super.mMontage);
  id v8 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCPlugSlide),  "initFromScratchWithMontage:",  self->super.super.mMontage);
  [v8 setContainer:a3];
  [v7 setPlug:v8];

  [v7 setIndex:a4];
  [v7 setContainer:self];
  uint64_t v9 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v7, 0LL);
  -[MCContainerEffect willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"slides",  1LL,  v9);
  mSlides = self->mSlides;
  if (mSlides)
  {
    __int128 v20 = self->mSlides;
    objc_sync_enter(mSlides);
    if ((self->super.mFlags & 1) != 0)
    {
      objc_sync_enter(self);
      uint64_t v11 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", self->mSlides);
      id v12 = self->mSlides;
      self->mSlides = v11;
      self->super.mFlags ^= 1u;
      objc_sync_exit(self);
    }

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v13 = self->mSlides;
    id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    if (v14)
    {
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v13);
          }
          __int128 v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        }

        id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
      }

      while (v14);
    }

    -[NSMutableArray addObject:](self->mSlides, "addObject:", v7);
    id v18 = (MCContainerEffect *)v20;
  }

  else
  {
    objc_sync_enter(self);
    self->mSlides = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  v7,  0LL);
    self->super.mFlags |= 1u;
    id v18 = self;
  }

  objc_sync_exit(v18);
  -[MCContainerEffect didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"slides",  1LL,  v9);

  return v7;
}

- (void)removeSlidesAtIndices:(id)a3
{
  mSlides = self->mSlides;
  if (mSlides)
  {
    obj = mSlides;
    objc_sync_enter(mSlides);
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v7 = self->mSlides;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v11, "index")))
          {
            -[NSMutableSet addObject:](v6, "addObject:", v11);
          }

          else if (!self->mIsLive)
          {
            objc_msgSend( v11,  "setIndex:",  (_BYTE *)objc_msgSend(v11, "index")
            - (_BYTE *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v11, "index")));
          }
        }

        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
      }

      while (v8);
    }

    -[MCContainerEffect willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"slides",  2LL,  v6);
    if ((self->super.mFlags & 1) != 0)
    {
      objc_sync_enter(self);
      id v12 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", self->mSlides);
      __int128 v13 = self->mSlides;
      self->mSlides = v12;
      objc_sync_exit(self);
    }

    -[NSMutableArray removeObjectsInArray:]( self->mSlides,  "removeObjectsInArray:",  -[NSMutableSet allObjects](v6, "allObjects"));
    objc_sync_exit(obj);
    -[MCContainerEffect didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"slides",  2LL,  v6);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v6);
          }
          __int128 v17 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)j);
          [v17 setContainer:0];
          [v17 demolish];
        }

        id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
      }

      while (v14);
    }
  }

- (void)removeAllSlides
{
}

- (void)moveSlidesAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  if (self->mSlides)
  {
    -[MCContainerEffect willChangeValueForKey:](self, "willChangeValueForKey:", @"orderedSlides");
    mSlides = self->mSlides;
    objc_sync_enter(mSlides);
    self->super.mFlags &= ~1u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = self->mSlides;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
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
          id v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v12, "index")))
          {
            objc_msgSend( v12,  "setIndex:",  (char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index")) + a4);
          }

          else
          {
            __int128 v13 = [v12 index];
            unint64_t v14 = v13 - (_BYTE *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index"));
            if (v14 >= a4) {
              v14 += (unint64_t)[a3 count];
            }
            [v12 setIndex:v14];
          }
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v9);
    }

    objc_sync_exit(mSlides);
    -[MCContainerEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"orderedSlides");
  }

- (NSSet)texts
{
  v2 = (NSSet *)sEmptySet;
  mTexts = self->mTexts;
  if (mTexts)
  {
    objc_sync_enter(self->mTexts);
    if (-[NSMutableArray count](self->mTexts, "count")) {
      v2 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", self->mTexts);
    }
    objc_sync_exit(mTexts);
  }

  return v2;
}

- (NSArray)orderedTexts
{
  mTexts = self->mTexts;
  if (!mTexts) {
    return (NSArray *)sEmptyArray;
  }
  objc_sync_enter(self->mTexts);
  if ((self->super.mFlags & 2) == 0)
  {
    id v4 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"index",  1LL);
    -[NSMutableArray sortUsingDescriptors:]( self->mTexts,  "sortUsingDescriptors:",  +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v4));

    self->super.mFlags |= 2u;
  }

  id v5 = self->mTexts;
  objc_sync_exit(mTexts);
  return &v5->super;
}

- (unint64_t)countOfTexts
{
  mTexts = self->mTexts;
  if (!mTexts) {
    return 0LL;
  }
  objc_sync_enter(self->mTexts);
  id v4 = -[NSMutableArray count](self->mTexts, "count");
  objc_sync_exit(mTexts);
  return (unint64_t)v4;
}

- (unint64_t)nextAvailableTextIndex
{
  mTexts = self->mTexts;
  if (!mTexts) {
    return 0LL;
  }
  objc_sync_enter(self->mTexts);
  if (self->mIsLive)
  {
    id v4 = self->mTexts;
    if ((self->super.mFlags & 2) != 0)
    {
      id v7 = (char *)objc_msgSend(-[NSMutableArray lastObject](v4, "lastObject"), "index") + 1;
    }

    else if (-[NSMutableArray count](v4, "count") {
           && (__int128 v14 = 0u,
    }
               __int128 v15 = 0u,
               __int128 v12 = 0u,
               __int128 v13 = 0u,
               id v5 = self->mTexts,
               (id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL)) != 0LL))
    {
      id v7 = 0LL;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (char *)[*(id *)(*((void *)&v12 + 1) + 8 * (void)i) index];
          if (v7 <= v10 + 1) {
            id v7 = v10 + 1;
          }
        }

        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v6);
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = (char *)-[NSMutableArray count](self->mTexts, "count");
  }

  objc_sync_exit(mTexts);
  return (unint64_t)v7;
}

- (id)textAtIndex:(unint64_t)a3
{
  mTexts = self->mTexts;
  if (mTexts)
  {
    objc_sync_enter(self->mTexts);
    if ((self->super.mFlags & 2) != 0)
    {
      if ((unint64_t)-[NSMutableArray count](self->mTexts, "count") > a3)
      {
        id v12 = -[NSMutableArray objectAtIndex:](self->mTexts, "objectAtIndex:", a3);
LABEL_17:
        uint64_t v11 = v12;
        goto LABEL_18;
      }
    }

    else
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v6 = self->mTexts;
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7)
      {
        uint64_t v8 = *(void *)v15;
        while (2)
        {
          for (i = 0LL; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
            if ([v10 index] == (id)a3)
            {
              id v12 = v10;
              goto LABEL_17;
            }
          }

          id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
          uint64_t v11 = 0LL;
          if (v7) {
            continue;
          }
          goto LABEL_18;
        }
      }
    }

    uint64_t v11 = 0LL;
LABEL_18:
    objc_sync_exit(mTexts);
    return v11;
  }

  uint64_t v11 = 0LL;
  return v11;
}

- (id)addTextForAttributedString:(id)a3
{
  return objc_msgSend( -[MCContainerEffect insertTextsForAttributedStrings:atIndex:]( self,  "insertTextsForAttributedStrings:atIndex:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3),  -[MCContainerEffect nextAvailableTextIndex](self, "nextAvailableTextIndex")),  "objectAtIndex:",  0);
}

- (id)addTextsForAttributedStrings:(id)a3
{
  return -[MCContainerEffect insertTextsForAttributedStrings:atIndex:]( self,  "insertTextsForAttributedStrings:atIndex:",  a3,  -[MCContainerEffect nextAvailableTextIndex](self, "nextAvailableTextIndex"));
}

- (id)addTextForAsset:(id)a3 andKey:(id)a4
{
  return objc_msgSend( -[MCContainerEffect insertTextsForAssets:andKey:atIndex:]( self,  "insertTextsForAssets:andKey:atIndex:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3),  a4,  -[MCContainerEffect nextAvailableTextIndex](self, "nextAvailableTextIndex")),  "objectAtIndex:",  0);
}

- (id)addTextsForAssets:(id)a3 andKey:(id)a4
{
  return -[MCContainerEffect insertTextsForAssets:andKey:atIndex:]( self,  "insertTextsForAssets:andKey:atIndex:",  a3,  a4,  -[MCContainerEffect nextAvailableTextIndex](self, "nextAvailableTextIndex"));
}

- (id)insertTextForAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  return objc_msgSend( -[MCContainerEffect insertTextsForAttributedStrings:atIndex:]( self,  "insertTextsForAttributedStrings:atIndex:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3),  a4),  "objectAtIndex:",  0);
}

- (id)insertTextsForAttributedStrings:(id)a3 atIndex:(unint64_t)a4
{
  id v27 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    id v6 = 0LL;
    uint64_t v7 = *(void *)v33;
    do
    {
      uint64_t v8 = 0LL;
      __int128 v23 = v6;
      id v9 = &v6[a4];
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v8);
        id v11 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCText),  "initFromScratchWithMontage:",  self->super.super.mMontage);
        [v11 setAttributedString:v10];
        [v11 setIndex:(char *)v8 + (void)v9];
        [v27 addObject:v11];
        [v11 setContainer:self];
        [v11 addObserver:self forKeyPath:@"attributedString" options:0 context:0];

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id v5 = [a3 countByEnumeratingWithState:&v32 objects:v37 count:16];
      id v6 = (char *)v8 + (void)v23;
    }

    while (v5);
    if ((char *)v8 + (void)v23)
    {
      id v12 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v27);
      -[MCContainerEffect willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"texts",  1LL,  v12);
      mTexts = self->mTexts;
      if (mTexts)
      {
        objc_sync_enter(self->mTexts);
        if ((self->super.mFlags & 2) != 0)
        {
          objc_sync_enter(self);
          __int128 v14 = -[NSMutableArray initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithArray:",  self->mTexts);
          __int128 v15 = self->mTexts;
          self->mTexts = v14;
          self->super.mFlags ^= 2u;
          objc_sync_exit(self);
        }

        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v16 = self->mTexts;
        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v28,  v36,  16LL,  v23);
        if (v17)
        {
          uint64_t v18 = *(void *)v29;
          __int128 v19 = (char *)v8 + v24;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v16);
              }
              __int128 v21 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
            }

            id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v28,  v36,  16LL);
          }

          while (v17);
        }

        -[NSMutableArray addObjectsFromArray:](self->mTexts, "addObjectsFromArray:", v27);
      }

      else
      {
        objc_sync_enter(self);
        self->mTexts = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v27);
        self->super.mFlags |= 2u;
        mTexts = self;
      }

      objc_sync_exit(mTexts);
      -[MCContainerEffect didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"texts",  1LL,  v12);
    }
  }

  return v27;
}

- (id)insertTextForAsset:(id)a3 andKey:(id)a4 atIndex:(unint64_t)a5
{
  return objc_msgSend( -[MCContainerEffect insertTextsForAssets:andKey:atIndex:]( self,  "insertTextsForAssets:andKey:atIndex:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3),  a4,  a5),  "objectAtIndex:",  0);
}

- (id)insertTextsForAssets:(id)a3 andKey:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3, a4);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v22 = 0LL;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = a5 + v22;
      v22 += (uint64_t)v8;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCText),  "initFromScratchWithMontage:",  self->super.super.mMontage);
        [v11 setIndex:v10];
        [v7 addObject:v11];
        [v11 setContainer:self];
        [v11 addObserver:self forKeyPath:@"attributedString" options:0 context:0];

        ++v10;
        id v8 = (char *)v8 - 1;
      }

      while (v8);
      id v8 = [a3 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v8);
    if (v22)
    {
      id v12 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v7);
      -[MCContainerEffect willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"texts",  1LL,  v12);
      mTexts = self->mTexts;
      if (mTexts)
      {
        objc_sync_enter(self->mTexts);
        if ((self->super.mFlags & 2) != 0)
        {
          objc_sync_enter(self);
          __int128 v14 = -[NSMutableArray initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithArray:",  self->mTexts);
          __int128 v15 = self->mTexts;
          self->mTexts = v14;
          self->super.mFlags ^= 2u;
          objc_sync_exit(self);
        }

        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v16 = self->mTexts;
        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL,  v22);
        if (v17)
        {
          uint64_t v18 = *(void *)v26;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v26 != v18) {
                objc_enumerationMutation(v16);
              }
              __int128 v20 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
            }

            id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v25,  v33,  16LL);
          }

          while (v17);
        }

        -[NSMutableArray addObjectsFromArray:](self->mTexts, "addObjectsFromArray:", v7);
      }

      else
      {
        objc_sync_enter(self);
        self->mTexts = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v7);
        self->super.mFlags |= 2u;
        mTexts = self;
      }

      objc_sync_exit(mTexts);
      -[MCContainerEffect didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"texts",  1LL,  v12);
    }
  }

  return v7;
}

- (void)removeTextsAtIndices:(id)a3
{
  mTexts = self->mTexts;
  if (mTexts)
  {
    obj = mTexts;
    objc_sync_enter(mTexts);
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v7 = self->mTexts;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v11, "index")))
          {
            -[NSMutableSet addObject:](v6, "addObject:", v11);
            [v11 removeObserver:self forKeyPath:@"attributedString"];
          }

          else if (!self->mIsLive)
          {
            objc_msgSend( v11,  "setIndex:",  (_BYTE *)objc_msgSend(v11, "index")
            - (_BYTE *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v11, "index")));
          }
        }

        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
      }

      while (v8);
    }

    -[MCContainerEffect willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"texts",  2LL,  v6);
    if ((self->super.mFlags & 2) != 0)
    {
      objc_sync_enter(self);
      id v12 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", self->mTexts);
      __int128 v13 = self->mTexts;
      self->mTexts = v12;
      objc_sync_exit(self);
    }

    -[NSMutableArray removeObjectsInArray:]( self->mTexts,  "removeObjectsInArray:",  -[NSMutableSet allObjects](v6, "allObjects"));
    objc_sync_exit(obj);
    -[MCContainerEffect didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"texts",  2LL,  v6);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v6);
          }
          id v17 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)j);
          [v17 setContainer:0];
          [v17 demolish];
        }

        id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
      }

      while (v14);
    }
  }

- (void)removeAllTexts
{
}

- (void)moveTextsAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  mTexts = self->mTexts;
  objc_sync_enter(mTexts);
  self->super.mFlags &= ~2u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = self->mTexts;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
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
        id v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v12, "index")))
        {
          objc_msgSend( v12,  "setIndex:",  (char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index")) + a4);
        }

        else
        {
          __int128 v13 = [v12 index];
          unint64_t v14 = v13 - (_BYTE *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index"));
          if (v14 >= a4) {
            v14 += (unint64_t)[a3 count];
          }
          [v12 setIndex:v14];
        }
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v9);
  }

  objc_sync_exit(mTexts);
  -[MCContainerEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"orderedTexts");
}

- (id)effectAttributeForKey:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mEffectAttributes, "objectForKey:", a3);
  objc_sync_exit(self);
  return v5;
}

- (void)setEffectAttribute:(id)a3 forKey:(id)a4
{
  mEffectAttributes = self->mEffectAttributes;
  if (a3)
  {
    if (mEffectAttributes) {
      -[NSMutableDictionary setObject:forKey:](mEffectAttributes, "setObject:forKey:", a3, a4);
    }
    else {
      self->mEffectAttributes = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  a3,  a4,  0LL);
    }
  }

  else if (mEffectAttributes)
  {
    -[NSMutableDictionary removeObjectForKey:](mEffectAttributes, "removeObjectForKey:", a4);
  }

  objc_sync_exit(self);
  -[MCContainerEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"effectAttributes");
}

- (void)addEffectAttributes:(id)a3
{
  if (a3 && [a3 count])
  {
    -[MCContainerEffect willChangeValueForKey:](self, "willChangeValueForKey:", @"effectAttributes");
    objc_sync_enter(self);
    mEffectAttributes = self->mEffectAttributes;
    if (mEffectAttributes) {
      -[NSMutableDictionary addEntriesFromDictionary:](mEffectAttributes, "addEntriesFromDictionary:", a3);
    }
    else {
      self->mEffectAttributes = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a3);
    }
    objc_sync_exit(self);
    -[MCContainerEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"effectAttributes");
  }

- (NSDictionary)effectAttributes
{
  id v3 = +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  self->mEffectAttributes);
  objc_sync_exit(self);
  return v3;
}

- (void)setEffectAttributes:(id)a3
{
  self->mEffectAttributes = 0LL;
  if (a3) {
    self->mEffectAttributes = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a3);
  }
  objc_sync_exit(self);
}

- (NSString)effectID
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setEffectID:(id)a3
{
}

- (BOOL)isLive
{
  return self->mIsLive;
}

- (void)setIsLive:(BOOL)a3
{
  self->mIsLive = a3;
}

- (void)initActionsWithImprints:(id)a3
{
  if (a3)
  {
    if ([a3 count])
    {
      self->mActions = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          id v8 = 0LL;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(a3);
            }
            -[NSMutableDictionary setObject:forKey:]( self->mActions,  "setObject:forKey:",  +[MCObjectLight objectWithImprint:]( MCObjectLight,  "objectWithImprint:",  [a3 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)]),  *(void *)(*((void *)&v9 + 1) + 8 * (void)v8));
            id v8 = (char *)v8 + 1;
          }

          while (v6 != v8);
          id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }

        while (v6);
      }
    }
  }

- (void)demolishActions
{
  mActions = self->mActions;
  if (mActions)
  {
    objc_sync_enter(self->mActions);
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = self->mActions;
    id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->mActions,  "objectForKey:",  *(void *)(*((void *)&v8 + 1) + 8 * (void)i)),  "demolish");
        }

        id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      }

      while (v5);
    }

    objc_sync_enter(self);

    self->mActions = 0LL;
    objc_sync_exit(self);
    objc_sync_exit(mActions);
  }

- (id)imprintsForActions
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v4 = -[MCContainerEffect actions](self, "actions");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      __int128 v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend( v3,  "setObject:forKey:",  objc_msgSend( -[NSDictionary objectForKey:](v4, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8)),  "imprint"),  *(void *)(*((void *)&v10 + 1) + 8 * (void)v8));
        __int128 v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (NSDictionary)actions
{
  id v3 = (NSDictionary *)sEmptyDictionary;
  unsigned __int8 v4 = -[MCObject isSnapshot](self, "isSnapshot");
  mActions = self->mActions;
  if ((v4 & 1) == 0)
  {
    if (mActions)
    {
      objc_sync_enter(self->mActions);
      if (-[NSMutableDictionary count](self->mActions, "count")) {
        id v3 =  -[NSDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:",  self->mActions);
      }
      objc_sync_exit(mActions);
    }

    return v3;
  }

  return &mActions->super;
}

- (unint64_t)countOfActions
{
  unsigned int v3 = -[MCObject isSnapshot](self, "isSnapshot");
  mActions = self->mActions;
  if (v3) {
    return (unint64_t)-[NSMutableDictionary count](self->mActions, "count");
  }
  if (!mActions) {
    return 0LL;
  }
  objc_sync_enter(self->mActions);
  id v6 = -[NSMutableDictionary count](self->mActions, "count");
  objc_sync_exit(mActions);
  return (unint64_t)v6;
}

- (id)actionForKey:(id)a3
{
  unsigned int v5 = -[MCObject isSnapshot](self, "isSnapshot");
  mActions = self->mActions;
  if (v5) {
    return -[NSMutableDictionary objectForKey:](self->mActions, "objectForKey:", a3);
  }
  if (!mActions) {
    return 0LL;
  }
  objc_sync_enter(self->mActions);
  id v8 = -[NSMutableDictionary objectForKey:](self->mActions, "objectForKey:", a3);
  objc_sync_exit(mActions);
  return v8;
}

- (void)setAction:(id)a3 forKey:(id)a4
{
  mActions = self->mActions;
  if (!mActions)
  {
    objc_sync_enter(self);
    self->mActions = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_sync_exit(self);
    mActions = self->mActions;
  }

  objc_sync_enter(mActions);
  -[NSMutableDictionary setObject:forKey:](self->mActions, "setObject:forKey:", a3, a4);
  objc_sync_exit(mActions);
  -[MCContainerEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"actions");
}

- (void)removeActionForKey:(id)a3
{
  if (self->mActions)
  {
    -[MCContainerEffect willChangeValueForKey:](self, "willChangeValueForKey:", @"actions");
    mActions = self->mActions;
    objc_sync_enter(mActions);
    -[NSMutableDictionary removeObjectForKey:](self->mActions, "removeObjectForKey:", a3);
    objc_sync_exit(mActions);
    -[MCContainerEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"actions");
  }

- (void)removeAllActions
{
  if (self->mActions)
  {
    -[MCContainerEffect willChangeValueForKey:](self, "willChangeValueForKey:", @"actions");
    mActions = self->mActions;
    objc_sync_enter(mActions);
    -[NSMutableDictionary removeAllObjects](self->mActions, "removeAllObjects");
    objc_sync_exit(mActions);
    -[MCContainerEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"actions");
  }

@end