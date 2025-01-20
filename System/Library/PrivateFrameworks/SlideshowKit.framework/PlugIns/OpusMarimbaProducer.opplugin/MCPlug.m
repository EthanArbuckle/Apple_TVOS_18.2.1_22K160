@interface MCPlug
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)preactivatesWithParent;
- (BOOL)startsPaused;
- (MCContainer)container;
- (MCPlug)init;
- (MCPlug)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSDictionary)actions;
- (NSSet)animationPaths;
- (double)fullDuration;
- (double)loopDuration;
- (double)numberOfLoops;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (id)actionForKey:(id)a3;
- (id)animationPathForKey:(id)a3;
- (id)imprint;
- (id)imprintsForActions;
- (id)imprintsForAnimationPaths;
- (unint64_t)countOfActions;
- (unint64_t)countOfAnimationPaths;
- (void)_copySelfToSnapshot:(id)a3;
- (void)addAnimationPath:(id)a3;
- (void)demolish;
- (void)demolishActions;
- (void)demolishAnimationPaths;
- (void)initActionsWithImprints:(id)a3;
- (void)initAnimationPathsWithImprints:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeActionForKey:(id)a3;
- (void)removeAllActions;
- (void)removeAllAnimationPaths;
- (void)removeAnimationPathForKey:(id)a3;
- (void)setAction:(id)a3 forKey:(id)a4;
- (void)setContainer:(id)a3;
- (void)setLoopDuration:(double)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPreactivatesWithParent:(BOOL)a3;
- (void)setStartsPaused:(BOOL)a3;
@end

@implementation MCPlug

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"fullDuration"]) {
    return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"phaseInDuration",  @"loopDuration",  @"phaseOutDuration",  0LL);
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MCPlug;
  return objc_msgSendSuper2(&v8, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCPlug)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCPlug;
  result = -[MCPlug init](&v3, "init");
  if (result) {
    result->mNumberOfLoops = 1.0;
  }
  return result;
}

- (MCPlug)initWithImprint:(id)a3 andMontage:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MCPlug;
  v5 = -[MCObject initWithImprint:andMontage:](&v21, "initWithImprint:andMontage:", a3, a4);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (MCContainer *) -[MCMontage containerForObjectID:]( v5->super.mMontage,  "containerForObjectID:",  [a3 objectForKey:@"containerID"]);
    v6->mContainer = v7;
    -[MCContainer referenceByPlug:](v7, "referenceByPlug:", v6);
    id v8 = [a3 objectForKey:@"animationPaths"];
    if (v8) {
      -[MCPlug initAnimationPathsWithImprints:](v6, "initAnimationPathsWithImprints:", v8);
    }
    id v9 = [a3 objectForKey:@"actions"];
    if (v9) {
      -[MCPlug initActionsWithImprints:](v6, "initActionsWithImprints:", v9);
    }
    id v10 = [a3 objectForKey:@"phaseInDuration"];
    double v11 = 0.0;
    double v12 = 0.0;
    if (v10) {
      objc_msgSend(v10, "doubleValue", 0.0);
    }
    v6->mPhaseInDuration = v12;
    id v13 = [a3 objectForKey:@"loopDuration"];
    if (v13)
    {
      [v13 doubleValue];
      double v11 = v14;
    }

    v6->mLoopDuration = v11;
    id v15 = [a3 objectForKey:@"phaseOutDuration"];
    if (v15) {
      [v15 doubleValue];
    }
    else {
      double v16 = 0.0;
    }
    v6->mPhaseOutDuration = v16;
    id v17 = [a3 objectForKey:@"numberOfLoops"];
    if (v17) {
      [v17 doubleValue];
    }
    else {
      double v18 = 1.0;
    }
    v6->mNumberOfLoops = v18;
    id v19 = [a3 objectForKey:@"flags"];
    if (v19) {
      LODWORD(v19) = [v19 unsignedIntegerValue];
    }
    v6->mFlags = v19;
  }

  return v6;
}

- (void)demolish
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCPlug;
  -[MCObject demolish](&v3, "demolish");
}

- (id)imprint
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCPlug;
  id v3 = -[MCObject imprint](&v6, "imprint");
  mContainer = self->mContainer;
  if (mContainer) {
    objc_msgSend(v3, "setObject:forKey:", -[MCObject objectID](mContainer, "objectID"), @"containerID");
  }
  if (-[NSMutableSet count](self->mAnimationPaths, "count")) {
    objc_msgSend( v3,  "setObject:forKey:",  -[MCPlug imprintsForAnimationPaths](self, "imprintsForAnimationPaths"),  @"animationPaths");
  }
  if (-[NSMutableDictionary count](self->mActions, "count")) {
    objc_msgSend(v3, "setObject:forKey:", -[MCPlug imprintsForActions](self, "imprintsForActions"), @"actions");
  }
  if (self->mPhaseInDuration != 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"phaseInDuration");
  }
  if (self->mLoopDuration != 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"loopDuration");
  }
  if (self->mPhaseOutDuration != 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"phaseOutDuration");
  }
  if (self->mNumberOfLoops != 1.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"numberOfLoops");
  }
  if (self->mFlags) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  self->mFlags),  @"flags");
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  else {
    uint64_t v7 = @"filters";
  }
  -[MCPlug willChangeValueForKey:](self, "willChangeValueForKey:", v7);
  -[MCPlug didChangeValueForKey:](self, "didChangeValueForKey:", v7);
}

- (MCContainer)container
{
  if (-[MCObject isSnapshot](self, "isSnapshot")) {
    return self->mContainer;
  }
  objc_sync_enter(self);
  id v3 = self->mContainer;
  objc_sync_exit(self);
  return v3;
}

- (void)setContainer:(id)a3
{
  if (self->mContainer != a3)
  {
    objc_sync_enter(self);
    mContainer = self->mContainer;
    if (a3)
    {
      objc_super v6 = (MCContainer *)a3;
      self->mContainer = v6;
      -[MCContainer referenceByPlug:](v6, "referenceByPlug:", self);
    }

    else
    {
      self->mContainer = 0LL;
    }

    -[MCContainer unreferenceByPlug:](mContainer, "unreferenceByPlug:", self);
    uint64_t v7 = mContainer;
    objc_sync_exit(self);
  }

- (void)setPhaseInDuration:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->mPhaseInDuration = a3;
}

- (void)setLoopDuration:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->mLoopDuration = a3;
}

- (void)setPhaseOutDuration:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->mPhaseOutDuration = a3;
}

- (double)fullDuration
{
  return self->mPhaseInDuration + self->mLoopDuration * self->mNumberOfLoops + self->mPhaseOutDuration;
}

- (void)setNumberOfLoops:(double)a3
{
  if (a3 <= 0.0) {
    a3 = 1.0;
  }
  self->mNumberOfLoops = a3;
}

- (BOOL)startsPaused
{
  return self->mFlags & 1;
}

- (void)setStartsPaused:(BOOL)a3
{
  self->mFlags = self->mFlags & 0xFFFFFFFE | a3;
}

- (BOOL)preactivatesWithParent
{
  return (LOBYTE(self->mFlags) >> 3) & 1;
}

- (void)setPreactivatesWithParent:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->mFlags = self->mFlags & 0xFFFFFFF7 | v3;
}

- (void)_copySelfToSnapshot:(id)a3
{
  if (self->mAnimationPaths)
  {
    v5 = -[MCPlug animationPaths](self, "animationPaths");
    if (-[NSSet count](v5, "count"))
    {
      *((void *)a3 + 4) = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSSet count](v5, "count"));
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v20;
        do
        {
          id v9 = 0LL;
          do
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend( *((id *)a3 + 4),  "addObject:",  objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v9), "snapshot"));
            id v9 = (char *)v9 + 1;
          }

          while (v7 != v9);
          id v7 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
        }

        while (v7);
      }
    }
  }

  if (self->mActions)
  {
    id v10 = -[MCPlug actions](self, "actions");
    if (-[NSDictionary count](v10, "count"))
    {
      *((void *)a3 + 5) = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSDictionary count](v10, "count"));
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v11 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          double v14 = 0LL;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend( *((id *)a3 + 5),  "setObject:forKey:",  objc_msgSend( -[NSDictionary objectForKey:]( v10,  "objectForKey:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)v14)),  "snapshot"),  *(void *)(*((void *)&v15 + 1) + 8 * (void)v14));
            double v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
        }

        while (v12);
      }
    }
  }

  *((void *)a3 + 7) = *(void *)&self->mPhaseInDuration;
  *((void *)a3 + 8) = *(void *)&self->mLoopDuration;
  *((void *)a3 + 9) = *(void *)&self->mPhaseOutDuration;
  *((void *)a3 + 10) = *(void *)&self->mNumberOfLoops;
  *((_DWORD *)a3 + 6) = self->mFlags;
}

- (double)phaseInDuration
{
  return self->mPhaseInDuration;
}

- (double)loopDuration
{
  return self->mLoopDuration;
}

- (double)phaseOutDuration
{
  return self->mPhaseOutDuration;
}

- (double)numberOfLoops
{
  return self->mNumberOfLoops;
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
          uint64_t v8 = 0LL;
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
              double v14 = @"keyframes";
              if ((isKindOfClass & 1) == 0)
              {
                uint64_t v15 = objc_opt_class(&OBJC_CLASS___MCAnimationPathCombo, v13);
                if ((objc_opt_isKindOfClass(v9, v15) & 1) == 0) {
                  goto LABEL_13;
                }
                [v9 addObserver:self forKeyPath:@"combineOperation" options:0 context:0];
                double v14 = @"animationPaths";
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
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
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
  v4 = -[MCPlug animationPaths](self, "animationPaths", 0LL);
  id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "imprint"));
        uint64_t v8 = (char *)v8 + 1;
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
  -[MCPlug willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL);
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
            -[MCPlug willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v17);
            -[NSMutableSet removeObject:](self->mAnimationPaths, "removeObject:", v10);
            objc_sync_exit(mAnimationPaths);
            -[MCPlug didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v17);

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
    -[MCPlug willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v3);
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
        -[MCPlug didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v3);

        return;
      }
    }
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
          uint64_t v8 = 0LL;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(a3);
            }
            -[NSMutableDictionary setObject:forKey:]( self->mActions,  "setObject:forKey:",  +[MCObjectLight objectWithImprint:]( MCObjectLight,  "objectWithImprint:",  [a3 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)]),  *(void *)(*((void *)&v9 + 1) + 8 * (void)v8));
            uint64_t v8 = (char *)v8 + 1;
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
    unsigned __int8 v4 = self->mActions;
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
  unsigned __int8 v4 = -[MCPlug actions](self, "actions");
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
  -[MCPlug didChangeValueForKey:](self, "didChangeValueForKey:", @"actions");
}

- (void)removeActionForKey:(id)a3
{
  if (self->mActions)
  {
    -[MCPlug willChangeValueForKey:](self, "willChangeValueForKey:", @"actions");
    mActions = self->mActions;
    objc_sync_enter(mActions);
    -[NSMutableDictionary removeObjectForKey:](self->mActions, "removeObjectForKey:", a3);
    objc_sync_exit(mActions);
    -[MCPlug didChangeValueForKey:](self, "didChangeValueForKey:", @"actions");
  }

- (void)removeAllActions
{
  if (self->mActions)
  {
    -[MCPlug willChangeValueForKey:](self, "willChangeValueForKey:", @"actions");
    mActions = self->mActions;
    objc_sync_enter(mActions);
    -[NSMutableDictionary removeAllObjects](self->mActions, "removeAllObjects");
    objc_sync_exit(mActions);
    -[MCPlug didChangeValueForKey:](self, "didChangeValueForKey:", @"actions");
  }

@end