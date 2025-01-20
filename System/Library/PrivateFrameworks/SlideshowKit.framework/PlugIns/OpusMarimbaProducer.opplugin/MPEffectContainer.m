@interface MPEffectContainer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)effectContainer;
- (BOOL)isTransitionConnected;
- (BOOL)shouldBeParallelizer;
- (CGColor)backgroundCGColor;
- (MPEffectContainer)init;
- (MPTransition)transition;
- (double)duration;
- (double)findMinDuration;
- (double)introTransitionDuration;
- (double)outroTransitionDuration;
- (double)startTime;
- (id)audioPlaylist;
- (id)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effects;
- (id)filters;
- (id)fullDebugLog;
- (id)nearestLayerGroup;
- (id)objectID;
- (id)objectInEffectsAtIndex:(int64_t)a3;
- (id)objectInFiltersAtIndex:(int64_t)a3;
- (id)parentDocument;
- (id)parentLayer;
- (id)plug;
- (id)plugID;
- (id)scriptingTransition;
- (id)userInfoAttributeForKey:(id)a3;
- (id)uuid;
- (int64_t)countOfEffects;
- (int64_t)countOfFilters;
- (int64_t)index;
- (int64_t)slideCount;
- (int64_t)textCount;
- (void)addEffect:(id)a3;
- (void)addEffects:(id)a3;
- (void)addFilter:(id)a3;
- (void)addFilters:(id)a3;
- (void)adjustPhasesWithDuration:(double)a3;
- (void)calculateDurationToSmallest:(BOOL)a3;
- (void)cleanup;
- (void)convertFromEffectContainerToParallelizer;
- (void)convertFromParallelizerToEffectContainer;
- (void)copyAudioPlaylist:(id)a3;
- (void)copyEffects:(id)a3;
- (void)copyFilters:(id)a3;
- (void)copyTransition:(id)a3;
- (void)copyVars:(id)a3;
- (void)dealloc;
- (void)disconnectTransition;
- (void)dump;
- (void)insertEffects:(id)a3 atIndex:(int64_t)a4;
- (void)insertFilters:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inEffectsAtIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inFiltersAtIndex:(int64_t)a4;
- (void)moveEffectsFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)reconnectTransition;
- (void)removeAllEffects;
- (void)removeAllFilters;
- (void)removeEffectsAtIndices:(id)a3;
- (void)removeFiltersAtIndices:(id)a3;
- (void)removeObjectFromEffectsAtIndex:(int64_t)a3;
- (void)removeObjectFromFiltersAtIndex:(int64_t)a3;
- (void)replaceObjectInEffectsAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceObjectInFiltersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)setAudioPlaylist:(id)a3;
- (void)setBackgroundCGColor:(CGColor *)a3;
- (void)setBackgroundColorString:(id)a3;
- (void)setContainerEffect:(id)a3;
- (void)setContainerParallelizer:(id)a3;
- (void)setContainerPlug:(id)a3;
- (void)setDuration:(double)a3;
- (void)setParentLayer:(id)a3;
- (void)setScriptingTransition:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTransition:(id)a3;
- (void)setUserInfoAttribute:(id)a3 forKey:(id)a4;
@end

@implementation MPEffectContainer

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return [a3 isEqualToString:@"effects"] ^ 1;
}

+ (id)effectContainer
{
  return objc_alloc_init((Class)a1);
}

- (MPEffectContainer)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPEffectContainer;
  result = -[MPEffectContainer init](&v3, "init");
  if (result)
  {
    result->_transitionDisconnected = 0;
    result->_audioPlaylist = 0LL;
    *(_OWORD *)&result->_containerPlug = 0u;
    *(_OWORD *)&result->_effects = 0u;
    *(_OWORD *)&result->_attributes = 0u;
    result->_backgroundColor = 0LL;
    result->_uuid = 0LL;
    result->_startTime = -1.0;
    result->_duration = 0.0;
  }

  return result;
}

- (id)description
{
  objc_super v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"======================== Effect Container %d Description =======================\n",  -[MPEffectContainer index](self, "index"));
  effects = self->_effects;
  if (effects) {
    effects = (NSMutableArray *)-[NSMutableArray count](effects, "count");
  }
  v5 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t               Effect Count: %d\n",  effects);
  filters = self->_filters;
  if (filters) {
    filters = (NSMutableArray *)-[NSMutableArray count](filters, "count");
  }
  v7 = -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"\t               Filter Count: %d\n",  filters);
  -[MPEffectContainer duration](self, "duration");
  v9 = -[NSString stringByAppendingFormat:]( v7,  "stringByAppendingFormat:",  @"\t                   Duration: %f\n",  v8);
  if (-[MPEffectContainer transition](self, "transition")) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = -[NSString stringByAppendingFormat:]( v9,  "stringByAppendingFormat:",  @"\t             Has Transition: %@\n",  v10);
  if (self->_containerPlug) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v13 = -[NSString stringByAppendingFormat:]( v11,  "stringByAppendingFormat:",  @"\t         Has Container Plug: %@\n",  v12);
  if (self->_containerParallelizer) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v13,  "stringByAppendingFormat:",  @"\t Has Container Parallelizer: %@\n",  v14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copyVars:self];
  [v4 copyEffects:self->_effects];
  [v4 copyFilters:self->_filters];
  [v4 copyTransition:self->_transition];
  [v4 copyAudioPlaylist:self->_audioPlaylist];
  return v4;
}

- (void)dealloc
{
  containerPlug = self->_containerPlug;
  if (containerPlug) {

  }
  self->_containerPlug = 0LL;
  containerParallelizer = self->_containerParallelizer;
  if (containerParallelizer) {

  }
  self->_containerParallelizer = 0LL;
  self->_audioPlaylist = 0LL;

  self->_attributes = 0LL;
  self->_effects = 0LL;

  self->_filters = 0LL;
  self->_transition = 0LL;
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    CGColorRelease(backgroundColor);
    self->_backgroundColor = 0LL;
  }

  self->_uuid = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPEffectContainer;
  -[MPEffectContainer dealloc](&v6, "dealloc");
}

- (id)effects
{
  return self->_effects;
}

- (void)addEffect:(id)a3
{
  objc_super v6 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  effects = self->_effects;
  if (effects) {
    id v5 = -[NSMutableArray count](effects, "count");
  }
  else {
    id v5 = 0LL;
  }
  -[MPEffectContainer insertEffects:atIndex:](self, "insertEffects:atIndex:", v6, v5);
}

- (void)addEffects:(id)a3
{
  effects = self->_effects;
  if (effects) {
    id v6 = -[NSMutableArray count](effects, "count");
  }
  else {
    id v6 = 0LL;
  }
  -[MPEffectContainer insertEffects:atIndex:](self, "insertEffects:atIndex:", a3, v6);
}

- (void)insertEffects:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_effects) {
    self->_effects = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  v7 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [a3 count]);
  -[MPEffectContainer willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  2LL,  v7,  @"effects");
  -[NSMutableArray insertObjects:atIndexes:](self->_effects, "insertObjects:atIndexes:", a3, v7);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * (void)i) setParentContainer:self];
      }

      id v9 = [a3 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }

    while (v9);
  }

  if (self->_containerPlug)
  {
    if (-[MPEffectContainer shouldBeParallelizer](self, "shouldBeParallelizer")
      || [a3 count] != (char *)&dword_0 + 1)
    {
      if (!self->_containerParallelizer) {
        -[MPEffectContainer convertFromEffectContainerToParallelizer](self, "convertFromEffectContainerToParallelizer");
      }
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      id v14 = [a3 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v40;
        do
        {
          for (j = 0LL; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v40 != v16) {
              objc_enumerationMutation(a3);
            }
            v18 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)j);
            id v19 = objc_msgSend(-[MPLayer montage](self->_parentLayer, "montage"), "createEffectContainer");
            objc_msgSend( v18,  "setPlug:",  -[MCContainerParallelizer setPlugForContainer:forID:]( self->_containerParallelizer,  "setPlugForContainer:forID:",  v19,  +[MPUtilities stringWithNewUUID](MPUtilities, "stringWithNewUUID")));
            [v18 setContainer:v19];
          }

          id v15 = [a3 countByEnumeratingWithState:&v39 objects:v49 count:16];
        }

        while (v15);
      }

      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      effects = self->_effects;
      id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v35,  v48,  16LL);
      if (v21)
      {
        id v22 = v21;
        __int16 v23 = 0;
        uint64_t v24 = *(void *)v36;
        do
        {
          for (k = 0LL; k != v22; k = (char *)k + 1)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(effects);
            }
            objc_msgSend( objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)k), "plug"),  "setZIndex:",  (__int16)(v23 + (_WORD)k));
          }

          id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v35,  v48,  16LL);
          v23 += (__int16)k;
        }

        while (v22);
      }
    }

    else
    {
      if (self->_containerParallelizer) {
        -[MPEffectContainer convertFromParallelizerToEffectContainer](self, "convertFromParallelizerToEffectContainer");
      }
      id v12 = objc_msgSend(-[MPLayer montage](self->_parentLayer, "montage"), "createEffectContainer");
      -[MCPlug setContainer:](self->_containerPlug, "setContainer:", v12);
      id v13 = [a3 lastObject];
      [v13 setPlug:0];
      [v13 setContainer:v12];
    }
  }

  if (-[NSMutableArray count](self->_effects, "count") && (-[MPEffectContainer duration](self, "duration"), v26 == 0.0))
  {
    -[MPEffectContainer calculateDurationToSmallest:](self, "calculateDurationToSmallest:", 0LL);
  }

  else
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v27 = [a3 countByEnumeratingWithState:&v31 objects:v47 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (m = 0LL; m != v28; m = (char *)m + 1)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(a3);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * (void)m) scaleMainDuration];
        }

        id v28 = [a3 countByEnumeratingWithState:&v31 objects:v47 count:16];
      }

      while (v28);
    }
  }

  -[MPEffectContainer outroTransitionDuration](self, "outroTransitionDuration");
  -[MPEffectContainer adjustPhasesWithDuration:](self, "adjustPhasesWithDuration:");
  -[MPEffectContainer didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  2LL,  v7,  @"effects");
}

- (void)removeEffectsAtIndices:(id)a3
{
  effects = self->_effects;
  if (effects && -[NSMutableArray count](effects, "count"))
  {
    id v6 = objc_autoreleasePoolPush();
    -[MPEffectContainer willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"effects");
    if ((unint64_t)-[NSMutableArray count](self->_effects, "count") < 2)
    {
      if (-[NSMutableArray count](self->_effects, "count") == (char *)&dword_0 + 1 && ![a3 firstIndex])
      {
        id v12 = -[NSMutableArray objectAtIndex:](self->_effects, "objectAtIndex:", 0LL);
        id v13 = v12;
        if (self->_containerPlug)
        {
          containerParallelizer = self->_containerParallelizer;
          if (containerParallelizer)
          {
            -[MCContainerParallelizer removePlug:](containerParallelizer, "removePlug:", [v12 plug]);

            self->_containerParallelizer = 0LL;
          }

          id v15 = (MCContainerParallelizer *) objc_msgSend( -[MPLayer montage](self->_parentLayer, "montage"),  "createParallelizerContainer");
          self->_containerParallelizer = v15;
          -[MCPlug setContainer:](self->_containerPlug, "setContainer:", v15);
        }

        [v13 setParentContainer:0];
        [v13 setPlug:0];
        [v13 setContainer:0];
      }
    }

    else
    {
      id v7 = [a3 lastIndex];
      if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        for (id i = v7; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
        {
          id v9 = -[NSMutableArray objectAtIndex:](self->_effects, "objectAtIndex:", i);
          uint64_t v10 = v9;
          v11 = self->_containerParallelizer;
          if (v11) {
            -[MCContainerParallelizer removePlug:](v11, "removePlug:", [v9 plug]);
          }
          [v10 setParentContainer:0];
          [v10 setPlug:0];
          [v10 setContainer:0];
        }
      }
    }

    -[NSMutableArray removeObjectsAtIndexes:](self->_effects, "removeObjectsAtIndexes:", a3);
    if (self->_containerParallelizer)
    {
      if (-[MPEffectContainer shouldBeParallelizer](self, "shouldBeParallelizer"))
      {
        if (self->_containerParallelizer)
        {
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          uint64_t v16 = self->_effects;
          id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
          if (v17)
          {
            id v18 = v17;
            __int16 v19 = 0;
            uint64_t v20 = *(void *)v23;
            do
            {
              for (j = 0LL; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v23 != v20) {
                  objc_enumerationMutation(v16);
                }
                objc_msgSend( objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)j), "plug"),  "setZIndex:",  (__int16)(v19 + (_WORD)j));
              }

              id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
              v19 += (__int16)j;
            }

            while (v18);
          }
        }
      }

      else
      {
        -[MPEffectContainer convertFromParallelizerToEffectContainer](self, "convertFromParallelizerToEffectContainer");
      }
    }

    -[MPEffectContainer didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"effects");
    objc_autoreleasePoolPop(v6);
  }

- (void)removeAllEffects
{
  if (-[NSMutableArray count](self->_effects, "count"))
  {
    objc_super v3 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  -[NSMutableArray count](self->_effects, "count"));
    -[MPEffectContainer removeEffectsAtIndices:](self, "removeEffectsAtIndices:", v3);
  }

- (void)moveEffectsFromIndices:(id)a3 toIndex:(int64_t)a4
{
  if (self->_effects)
  {
    containerParallelizer = self->_containerParallelizer;
    if (containerParallelizer)
    {
      id v8 = +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  -[MCContainerParallelizer zOrderedPlugs](containerParallelizer, "zOrderedPlugs"));
      id v9 = -[NSMutableArray objectsAtIndexes:](v8, "objectsAtIndexes:", a3);
      -[NSMutableArray removeObjectsAtIndexes:](v8, "removeObjectsAtIndexes:", a3);
      uint64_t v10 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [v9 count]);
      -[NSMutableArray insertObjects:atIndexes:](v8, "insertObjects:atIndexes:", v9, v10);

      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      if (v11)
      {
        id v12 = v11;
        __int16 v13 = 0;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (id i = 0LL; i != v12; id i = (char *)i + 1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v18 + 1) + 8 * (void)i) setZIndex:(__int16)(v13 + (_WORD)i)];
          }

          id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
          v13 += (__int16)i;
        }

        while (v12);
      }
    }

    id v16 = -[NSMutableArray objectsAtIndexes:](self->_effects, "objectsAtIndexes:", a3);
    -[NSMutableArray removeObjectsAtIndexes:](self->_effects, "removeObjectsAtIndexes:", a3);
    id v17 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [v16 count]);
    -[NSMutableArray insertObjects:atIndexes:](self->_effects, "insertObjects:atIndexes:", v16, v17);
  }

- (MPTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
  if (a3)
  {
    id v5 = objc_msgSend(-[MPEffectContainer parentLayer](self, "parentLayer"), "parentDocument");
    if (objc_msgSend( objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming[0]),  "BOOLValue"))
    {
      -[MPEffectContainer duration](self, "duration");
      double v7 = v6;
      parentLayer = self->_parentLayer;
      if (parentLayer)
      {
        id v9 = -[MPLayer effectContainers](parentLayer, "effectContainers");
        if (-[MPEffectContainer index](self, "index")) {
          id v10 = objc_msgSend(v9, "objectAtIndex:", (char *)-[MPEffectContainer index](self, "index") - 1);
        }
        else {
          id v10 = 0LL;
        }
        id v11 = -[MPEffectContainer index](self, "index");
        if (v11 != (char *)[v9 count] - 1)
        {
          id v12 = objc_msgSend(v9, "objectAtIndex:", (char *)-[MPEffectContainer index](self, "index") + 1);
          if (v12)
          {
            __int16 v13 = v12;
            [v12 duration];
            if (v7 >= v14) {
              double v7 = v14;
            }
            if ([v13 transition])
            {
              [v13 duration];
              double v16 = v15;
              objc_msgSend(objc_msgSend(v13, "transition"), "duration");
              double v18 = v16 - v17;
              if (v7 >= v18) {
                double v7 = v18;
              }
            }
          }
        }

        if (v10)
        {
          if ([v10 transition])
          {
            -[MPEffectContainer duration](self, "duration");
            double v20 = v19;
            objc_msgSend(objc_msgSend(v10, "transition"), "duration");
            double v22 = v20 - v21;
            if (v7 >= v22) {
              double v7 = v22;
            }
          }
        }
      }

      [a3 duration];
      if (v23 > v7) {
        [a3 setDuration:v7];
      }
    }
  }

  if (self->_parentLayer)
  {
    transition = self->_transition;
    double v25 = 0.0;
    double v26 = 0.0;
    if (transition && -[MPTransition parentContainer](transition, "parentContainer"))
    {
      -[MPTransition duration](self->_transition, "duration");
      double v26 = v27;
    }

    if (a3)
    {
      [a3 duration];
      double v25 = v28;
    }

    -[MPLayer duration](self->_parentLayer, "duration");
    double v30 = v29 - (v25 - v26);
  }

  else
  {
    double v30 = -1.0;
    double v26 = 0.0;
  }

  __int128 v31 = self->_transition;
  if (v31)
  {
    -[MPTransition setParent:](v31, "setParent:", 0LL);
    __int128 v32 = self->_transition;
    if (v32)
    {

      self->_transition = 0LL;
    }
  }

  if (a3)
  {
    __int128 v33 = (MPTransition *)a3;
    self->_transition = v33;
    -[MPTransition setParent:](v33, "setParent:", self);
    if (!-[MPEffectContainer isTransitionConnected](self, "isTransitionConnected"))
    {
      __int128 v34 = self->_parentLayer;
      -[MPTransition duration](self->_transition, "duration");
      -[MPLayer updateDurationPadding:](v34, "updateDurationPadding:", v35 - v26);
    }
  }

  else
  {
    containerPlug = self->_containerPlug;
    if (containerPlug)
    {
      uint64_t v37 = objc_opt_class(&OBJC_CLASS___MCPlugSerial, a2);
      if ((objc_opt_isKindOfClass(containerPlug, v37) & 1) != 0)
      {
        if (!-[MPEffectContainer isTransitionConnected](self, "isTransitionConnected")) {
          -[MPLayer updateDurationPadding:](self->_parentLayer, "updateDurationPadding:", -v26);
        }
        self->_transitionDisconnected = 0;
        -[MCPlug setTransitionID:](self->_containerPlug, "setTransitionID:", 0LL);
        -[MCPlug setTransitionDuration:](self->_containerPlug, "setTransitionDuration:", 0.0);
        -[MCPlug setTransitionAttributes:](self->_containerPlug, "setTransitionAttributes:", 0LL);
      }
    }
  }

  -[MPEffectContainer outroTransitionDuration](self, "outroTransitionDuration");
  -[MPEffectContainer adjustPhasesWithDuration:](self, "adjustPhasesWithDuration:");
  if (v30 != -1.0) {
    -[MPLayer setDuration:](self->_parentLayer, "setDuration:", v30);
  }
}

- (id)filters
{
  return self->_filters;
}

- (void)addFilter:(id)a3
{
  id v4 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", a3);
  filters = self->_filters;
  if (filters) {
    id v6 = -[NSMutableArray count](filters, "count");
  }
  else {
    id v6 = 0LL;
  }
  -[MPEffectContainer insertFilters:atIndex:](self, "insertFilters:atIndex:", v4, v6);
}

- (void)addFilters:(id)a3
{
  filters = self->_filters;
  if (filters) {
    id v6 = -[NSMutableArray count](filters, "count");
  }
  else {
    id v6 = 0LL;
  }
  -[MPEffectContainer insertFilters:atIndex:](self, "insertFilters:atIndex:", a3, v6);
}

- (void)insertFilters:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_filters) {
    self->_filters = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  double v7 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [a3 count]);
  -[MPEffectContainer willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  2LL,  v7,  @"filters");
  -[NSMutableArray insertObjects:atIndexes:](self->_filters, "insertObjects:atIndexes:", a3, v7);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (id i = 0LL; i != v9; id i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)i) setParent:self];
      }

      id v9 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v9);
  }

  if (self->_containerPlug)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v12 = [a3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (j = 0LL; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * (void)j),  "setFilter:",  -[MCPlug insertFilterWithFilterID:atIndex:]( self->_containerPlug,  "insertFilterWithFilterID:atIndex:",  objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)j), "filterID"),  (char *)j + a4));
        }

        id v13 = [a3 countByEnumeratingWithState:&v16 objects:v24 count:16];
        a4 += (int64_t)j;
      }

      while (v13);
    }
  }

  -[MPEffectContainer didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  2LL,  v7,  @"filters");
}

- (void)removeFiltersAtIndices:(id)a3
{
  filters = self->_filters;
  if (filters && -[NSMutableArray count](filters, "count"))
  {
    -[MPEffectContainer willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"filters");
    id v6 = [a3 lastIndex];
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v6; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v8 = -[NSMutableArray objectAtIndex:](self->_filters, "objectAtIndex:", i);
        [v8 setParent:0];
        [v8 setFilter:0];
      }
    }

    containerPlug = self->_containerPlug;
    if (containerPlug) {
      -[MCPlug removeFiltersAtIndices:](containerPlug, "removeFiltersAtIndices:", a3);
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_filters, "removeObjectsAtIndexes:", a3);
    -[MPEffectContainer didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"filters");
  }

- (void)removeAllFilters
{
  if (-[NSMutableArray count](self->_filters, "count"))
  {
    objc_super v3 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  -[NSMutableArray count](self->_filters, "count"));
    -[MPEffectContainer removeFiltersAtIndices:](self, "removeFiltersAtIndices:", v3);
  }

- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4
{
  if (self->_filters)
  {
    id v7 = [a3 firstIndex];
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = v7;
      do
      {
        id v9 = -[NSMutableArray objectAtIndex:](self->_filters, "objectAtIndex:", v8);
        -[NSMutableArray removeObjectAtIndex:](self->_filters, "removeObjectAtIndex:", v8);
        -[NSMutableArray insertObject:atIndex:](self->_filters, "insertObject:atIndex:", v9, a4 - ((uint64_t)v8 < a4));
        id v8 = [a3 indexGreaterThanIndex:v8];
        ++a4;
      }

      while (v8 != (id)0x7FFFFFFFFFFFFFFFLL);
    }

    containerPlug = self->_containerPlug;
    if (containerPlug) {
      -[MCPlug moveFiltersAtIndices:toIndex:](containerPlug, "moveFiltersAtIndices:toIndex:", a3, a4);
    }
  }

- (void)setBackgroundColorString:(id)a3
{
}

- (void)setBackgroundCGColor:(CGColor *)a3
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    CGColorRelease(backgroundColor);
    self->_backgroundColor = 0LL;
  }

  if (a3)
  {
    self->_backgroundColor = CGColorRetain(a3);
    if (self->_containerPlug)
    {
      containerParallelizer = self->_containerParallelizer;
      if (containerParallelizer
        || (-[MPEffectContainer convertFromEffectContainerToParallelizer]( self,  "convertFromEffectContainerToParallelizer"),  (containerParallelizer = self->_containerParallelizer) != 0LL))
      {
        id v7 = a3;
LABEL_14:
        -[MCContainerParallelizer setBackgroundColor:](containerParallelizer, "setBackgroundColor:", v7);
      }
    }
  }

  else if (self->_containerPlug && self->_containerParallelizer)
  {
    if (!-[MPEffectContainer shouldBeParallelizer](self, "shouldBeParallelizer")) {
      -[MPEffectContainer convertFromParallelizerToEffectContainer](self, "convertFromParallelizerToEffectContainer");
    }
    containerParallelizer = self->_containerParallelizer;
    if (containerParallelizer)
    {
      id v7 = 0LL;
      goto LABEL_14;
    }
  }

- (id)audioPlaylist
{
  return self->_audioPlaylist;
}

- (void)setAudioPlaylist:(id)a3
{
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {
    -[MPAudioPlaylist setParentObject:](audioPlaylist, "setParentObject:", 0LL);
    -[MPAudioPlaylist setMontage:](self->_audioPlaylist, "setMontage:", 0LL);
    -[MPAudioPlaylist setAudioPlaylist:](self->_audioPlaylist, "setAudioPlaylist:", 0LL);

    self->_audioPlaylist = 0LL;
  }

  if (a3)
  {
    id v6 = (MPAudioPlaylist *)a3;
    self->_audioPlaylist = v6;
    -[MPAudioPlaylist setParentObject:](v6, "setParentObject:", self);
    if (self->_containerPlug)
    {
      if (self->_containerParallelizer
        || (-[MPEffectContainer convertFromEffectContainerToParallelizer]( self,  "convertFromEffectContainerToParallelizer"),  self->_containerParallelizer))
      {
        -[MPAudioPlaylist setMontage:]( self->_audioPlaylist,  "setMontage:",  -[MPLayer montage](self->_parentLayer, "montage"));
        -[MPAudioPlaylist setAudioPlaylist:]( self->_audioPlaylist,  "setAudioPlaylist:",  -[MCContainer audioPlaylistCreateIfNeeded](self->_containerParallelizer, "audioPlaylistCreateIfNeeded"));
      }
    }
  }

  else if (self->_containerPlug {
         && self->_containerParallelizer
  }
         && !-[MPEffectContainer shouldBeParallelizer](self, "shouldBeParallelizer"))
  {
    -[MPEffectContainer convertFromParallelizerToEffectContainer](self, "convertFromParallelizerToEffectContainer");
  }

- (int64_t)index
{
  parentLayer = self->_parentLayer;
  if (!parentLayer) {
    return -1LL;
  }
  containerPlug = self->_containerPlug;
  if (!containerPlug) {
    return (int64_t)objc_msgSend( -[MPLayer effectContainers](parentLayer, "effectContainers"),  "indexOfObject:",  self);
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, a2);
  if ((objc_opt_isKindOfClass(containerPlug, v5) & 1) != 0)
  {
    parentLayer = self->_parentLayer;
    return (int64_t)objc_msgSend( -[MPLayer effectContainers](parentLayer, "effectContainers"),  "indexOfObject:",  self);
  }

  return (int64_t)-[MCPlug index](self->_containerPlug, "index");
}

- (id)parentLayer
{
  return self->_parentLayer;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    id v5 = objc_msgSend(-[MPEffectContainer parentLayer](self, "parentLayer"), "parentDocument");
    id v6 = -[MPEffectContainer nearestLayerGroup](self, "nearestLayerGroup");
    if (v6) {
      unsigned int v7 = [v6 autoAdjustDuration] ^ 1;
    }
    else {
      unsigned int v7 = 0;
    }
    if (objc_msgSend( objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming[0]),  "BOOLValue"))
    {
      if ((v7 & 1) == 0)
      {
        -[MPEffectContainer findMinDuration](self, "findMinDuration");
        if (v8 > v3)
        {
          -[MPEffectContainer findMinDuration](self, "findMinDuration");
          double v3 = v9;
        }
      }
    }

    -[MPEffectContainer duration](self, "duration");
    double v11 = v3 - v10;
    self->_duration = v3;
    parentLayer = self->_parentLayer;
    if (parentLayer) {
      char v13 = v7;
    }
    else {
      char v13 = 1;
    }
    if ((v13 & 1) == 0)
    {
      -[MPLayer duration](parentLayer, "duration");
      -[MPLayer setDuration:](self->_parentLayer, "setDuration:", v11 + v14);
    }

    if ((v7 & 1) == 0)
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      effects = self->_effects;
      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v23;
        do
        {
          for (id i = 0LL; i != v17; id i = (char *)i + 1)
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(effects);
            }
            [*(id *)(*((void *)&v22 + 1) + 8 * (void)i) scaleMainDuration];
          }

          id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
        }

        while (v17);
      }
    }

    if (self->_containerPlug && -[NSMutableArray count](self->_effects, "count") != (char *)&dword_0 + 1)
    {
      -[MCPlug loopDuration](self->_containerPlug, "loopDuration");
      double v21 = -0.0;
      if (!v7) {
        double v21 = v11;
      }
      -[MCPlug setLoopDuration:](self->_containerPlug, "setLoopDuration:", v21 + v20);
    }

    if ((v7 & 1) == 0)
    {
      -[MPEffectContainer outroTransitionDuration](self, "outroTransitionDuration");
      -[MPEffectContainer adjustPhasesWithDuration:](self, "adjustPhasesWithDuration:");
    }
  }

- (double)introTransitionDuration
{
  int64_t v3 = -[MPEffectContainer index](self, "index");
  if (!v3) {
    return 0.0;
  }
  id v4 = objc_msgSend( objc_msgSend(-[MPLayer effectContainers](self->_parentLayer, "effectContainers"), "objectAtIndex:", v3 - 1),  "transition");
  if (!v4) {
    return 0.0;
  }
  [v4 duration];
  return result;
}

- (double)outroTransitionDuration
{
  transition = self->_transition;
  if (!transition) {
    return 0.0;
  }
  -[MPTransition duration](transition, "duration");
  return result;
}

- (CGColor)backgroundCGColor
{
  return self->_backgroundColor;
}

- (double)duration
{
  return self->_duration;
}

- (id)container
{
  if (self->_containerParallelizer) {
    return self->_containerParallelizer;
  }
  else {
    return objc_msgSend(-[NSMutableArray lastObject](self->_effects, "lastObject"), "container");
  }
}

- (id)plug
{
  return self->_containerPlug;
}

- (void)dump
{
}

- (double)findMinDuration
{
  parentLayer = self->_parentLayer;
  if (!parentLayer) {
    return 0.0;
  }
  id v4 = -[MPLayer effectContainers](parentLayer, "effectContainers");
  if (-[MPEffectContainer index](self, "index")) {
    id v5 = objc_msgSend(v4, "objectAtIndex:", (char *)-[MPEffectContainer index](self, "index") - 1);
  }
  else {
    id v5 = 0LL;
  }
  if (-[MPEffectContainer transition](self, "transition"))
  {
    -[MPTransition duration](-[MPEffectContainer transition](self, "transition"), "duration");
    double v6 = v7 + 0.0;
    if (!v5) {
      return v6;
    }
  }

  else
  {
    double v6 = 0.0;
    if (!v5) {
      return v6;
    }
  }

  if ([v5 transition])
  {
    objc_msgSend(objc_msgSend(v5, "transition"), "duration");
    return v6 + v8;
  }

  return v6;
}

- (void)disconnectTransition
{
  if (-[MPEffectContainer transition](self, "transition"))
  {
    containerPlug = self->_containerPlug;
    if (containerPlug)
    {
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___MCPlugSerial, v3);
      if ((objc_opt_isKindOfClass(containerPlug, v5) & 1) != 0 && !self->_transitionDisconnected)
      {
        self->_transitionDisconnected = 1;
        -[MCPlug setTransitionID:](self->_containerPlug, "setTransitionID:", 0LL);
        -[MCPlug setTransitionDuration:](self->_containerPlug, "setTransitionDuration:", 0.0);
        parentLayer = self->_parentLayer;
        -[MPTransition duration](self->_transition, "duration");
        -[MPLayer updateDurationPadding:](parentLayer, "updateDurationPadding:");
      }
    }
  }

- (void)reconnectTransition
{
  if (self->_transitionDisconnected)
  {
    containerPlug = self->_containerPlug;
    if (containerPlug)
    {
      uint64_t v4 = objc_opt_class(&OBJC_CLASS___MCPlugSerial, a2);
      if ((objc_opt_isKindOfClass(containerPlug, v4) & 1) != 0)
      {
        self->_transitionDisconnected = 0;
        -[MCPlug setTransitionID:]( self->_containerPlug,  "setTransitionID:",  -[MPTransition transitionID](-[MPEffectContainer transition](self, "transition"), "transitionID"));
        -[MPTransition duration](-[MPEffectContainer transition](self, "transition"), "duration");
        -[MCPlug setTransitionDuration:](self->_containerPlug, "setTransitionDuration:");
        parentLayer = self->_parentLayer;
        -[MPTransition duration](self->_transition, "duration");
        -[MPLayer updateDurationPadding:](parentLayer, "updateDurationPadding:", -v6);
      }
    }
  }

- (BOOL)isTransitionConnected
{
  return !self->_transitionDisconnected;
}

- (id)fullDebugLog
{
  uint64_t v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@\n",  -[MPEffectContainer description](self, "description"));
  transition = self->_transition;
  if (transition) {
    uint64_t v3 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"%@\n",  -[MPTransition fullDebugLog](transition, "fullDebugLog"));
  }
  uint64_t v5 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"========================= Effect Container %d Effects =========================\n",  -[MPEffectContainer index](self, "index"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  effects = self->_effects;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (id i = 0LL; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(effects);
        }
        uint64_t v5 = -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"%@\n",  [*(id *)(*((void *)&v22 + 1) + 8 * (void)i) fullDebugLog]);
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
    }

    while (v8);
  }

  double v11 = -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"========================= Effect Container %d Filters =========================\n",  -[MPEffectContainer index](self, "index"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  filters = self->_filters;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(filters);
        }
        double v11 = -[NSString stringByAppendingFormat:]( v11,  "stringByAppendingFormat:",  @"%@\n",  [*(id *)(*((void *)&v18 + 1) + 8 * (void)j) fullDebugLog]);
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
    }

    while (v14);
  }

  return v11;
}

- (id)plugID
{
  return -[MCObject objectID](self->_containerPlug, "objectID");
}

- (id)objectID
{
  return -[MCObject objectID](self->_containerPlug, "objectID");
}

- (id)uuid
{
  return self->_uuid;
}

- (id)parentDocument
{
  return objc_msgSend(-[MPEffectContainer parentLayer](self, "parentLayer"), "parentDocument");
}

- (void)copyVars:(id)a3
{
  self->_startTime = *((double *)a3 + 10);
  self->_duration = *((double *)a3 + 11);
  uuid = self->_uuid;
  if (uuid)
  {

    self->_uuid = 0LL;
  }

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    CGColorRelease(backgroundColor);
    self->_backgroundColor = 0LL;
  }

  self->_backgroundColor = CGColorCreateCopy(*((CGColorRef *)a3 + 12));
}

- (void)copyEffects:(id)a3
{
  if (a3)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
          -[NSMutableArray addObject:](v5, "addObject:", v10);

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }

    -[MPEffectContainer addEffects:](self, "addEffects:", v5);
  }

- (void)copyFilters:(id)a3
{
  if (a3)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
          -[NSMutableArray addObject:](v5, "addObject:", v10);

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }

    -[MPEffectContainer addFilters:](self, "addFilters:", a3);
  }

- (void)copyTransition:(id)a3
{
  id v4 = [a3 copy];
  -[MPEffectContainer setTransition:](self, "setTransition:", v4);
}

- (void)copyAudioPlaylist:(id)a3
{
  id v4 = [a3 copy];
  -[MPEffectContainer setAudioPlaylist:](self, "setAudioPlaylist:", v4);
}

- (void)adjustPhasesWithDuration:(double)a3
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  effects = self->_effects;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (id i = 0LL; i != v7; id i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(effects);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend(v10, "effectAttributeForKey:", @"matchTransitionToPhase"),  "BOOLValue"))
        {
          [v10 phaseInDuration];
          double v12 = v11;
          -[MPEffectContainer introTransitionDuration](self, "introTransitionDuration");
          double v14 = v13;
          double v15 = v12 - v13;
          [v10 phaseOutDuration];
          double v17 = v16 - a3;
          [v10 mainDuration];
          double v19 = v18;
          if (v17 == 0.0)
          {
            if (v15 == 0.0) {
              continue;
            }
          }

          else
          {
            [v10 setPhaseOutDuration:a3];
            if (v15 == 0.0) {
              goto LABEL_12;
            }
          }

          [v10 setPhaseInDuration:v14];
LABEL_12:
          [v10 setMainDuration:v17 + v15 + v19];
          continue;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    }

    while (v7);
  }

- (void)cleanup
{
}

- (void)setContainerPlug:(id)a3
{
  containerPlug = self->_containerPlug;
  if (containerPlug)
  {

    self->_containerPlug = 0LL;
  }

  id v6 = (MCPlug *)a3;
  self->_containerPlug = v6;
  if (v6)
  {
    if (-[NSMutableArray count](self->_effects, "count") == (char *)&dword_0 + 1)
    {
      id v7 = -[NSMutableArray lastObject](self->_effects, "lastObject");
      [v7 phaseInDuration];
      -[MCPlug setPhaseInDuration:](self->_containerPlug, "setPhaseInDuration:");
      [v7 phaseOutDuration];
      -[MCPlug setPhaseOutDuration:](self->_containerPlug, "setPhaseOutDuration:");
      [v7 mainDuration];
    }

    else
    {
      -[MPEffectContainer duration](self, "duration");
    }

    -[MCPlug setLoopDuration:](self->_containerPlug, "setLoopDuration:");
    unsigned __int8 v19 = -[MPEffectContainer shouldBeParallelizer](self, "shouldBeParallelizer");
    containerParallelizer = self->_containerParallelizer;
    if ((v19 & 1) != 0)
    {
      if (!containerParallelizer) {
        -[MPEffectContainer convertFromEffectContainerToParallelizer](self, "convertFromEffectContainerToParallelizer");
      }
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      obj = self->_effects;
      id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v53,  v60,  16LL,  a3);
      if (v21)
      {
        id v22 = v21;
        __int16 v23 = 0;
        uint64_t v24 = *(void *)v54;
        do
        {
          for (id i = 0LL; i != v22; id i = (char *)i + 1)
          {
            if (*(void *)v54 != v24) {
              objc_enumerationMutation(obj);
            }
            double v26 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
            id v27 = objc_msgSend(-[MPLayer montage](self->_parentLayer, "montage"), "createEffectContainer");
            id v28 = -[MCContainerParallelizer setPlugForContainer:forID:]( self->_containerParallelizer,  "setPlugForContainer:forID:",  v27,  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"));
            [v26 setPlug:v28];
            [v26 setContainer:v27];
            [v28 setZIndex:(__int16)(v23 + (_WORD)i)];
          }

          id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v53,  v60,  16LL);
          v23 += (__int16)i;
        }

        while (v22);
      }
    }

    else
    {
      if (containerParallelizer) {

      }
      self->_containerParallelizer = 0LL;
      id v29 = objc_msgSend(-[MPLayer montage](self->_parentLayer, "montage", a3), "createEffectContainer");
      -[MCPlug setContainer:](self->_containerPlug, "setContainer:", v29);
      id v30 = -[NSMutableArray lastObject](self->_effects, "lastObject");
      [v30 setPlug:0];
      [v30 setContainer:v29];
    }

    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    filters = self->_filters;
    id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v49,  v59,  16LL);
    if (v32)
    {
      id v34 = v32;
      uint64_t v35 = *(void *)v50;
      do
      {
        for (j = 0LL; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v50 != v35) {
            objc_enumerationMutation(filters);
          }
          objc_msgSend( *(id *)(*((void *)&v49 + 1) + 8 * (void)j),  "setFilter:",  -[MCPlug addFilterWithFilterID:]( self->_containerPlug,  "addFilterWithFilterID:",  objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * (void)j), "filterID")));
        }

        id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v49,  v59,  16LL);
      }

      while (v34);
    }

    uint64_t v37 = objc_opt_class(&OBJC_CLASS___MCPlugSerial, v33);
    if ((objc_opt_isKindOfClass(v39, v37) & 1) != 0)
    {
      transition = self->_transition;
      if (transition)
      {
        -[MCPlug setTransitionID:]( self->_containerPlug,  "setTransitionID:",  -[MPTransition transitionID](transition, "transitionID"));
        -[MPTransition duration](self->_transition, "duration");
        -[MCPlug setTransitionDuration:](self->_containerPlug, "setTransitionDuration:");
        -[MPTransition applyFormattedAttributes](self->_transition, "applyFormattedAttributes");
      }
    }
  }

  else
  {
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    effects = self->_effects;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v45,  v58,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v46;
      do
      {
        for (k = 0LL; k != v10; k = (char *)k + 1)
        {
          if (*(void *)v46 != v11) {
            objc_enumerationMutation(effects);
          }
          double v13 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)k);
          [v13 setPlug:0];
          [v13 setContainer:0];
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v45,  v58,  16LL);
      }

      while (v10);
    }

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    double v14 = self->_filters;
    id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v41,  v57,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v42;
      do
      {
        for (m = 0LL; m != v16; m = (char *)m + 1)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * (void)m) setFilter:0];
        }

        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v41,  v57,  16LL);
      }

      while (v16);
    }
  }

- (void)setContainerParallelizer:(id)a3
{
  containerParallelizer = self->_containerParallelizer;
  if (containerParallelizer)
  {

    self->_containerParallelizer = 0LL;
  }

  id v6 = (MCContainerParallelizer *)a3;
  self->_containerParallelizer = v6;
  if (v6)
  {
    -[MCContainerParallelizer setBackgroundColor:](v6, "setBackgroundColor:", self->_backgroundColor);
    audioPlaylist = self->_audioPlaylist;
    if (!audioPlaylist) {
      return;
    }
    -[MPAudioPlaylist setMontage:](audioPlaylist, "setMontage:", -[MPLayer montage](self->_parentLayer, "montage"));
    uint64_t v8 = self->_audioPlaylist;
    id v9 = -[MCContainer audioPlaylistCreateIfNeeded](self->_containerParallelizer, "audioPlaylistCreateIfNeeded");
    id v10 = v8;
  }

  else
  {
    uint64_t v11 = self->_audioPlaylist;
    if (!v11) {
      return;
    }
    -[MPAudioPlaylist setMontage:](v11, "setMontage:", 0LL);
    id v10 = self->_audioPlaylist;
    id v9 = 0LL;
  }

  -[MPAudioPlaylist setAudioPlaylist:](v10, "setAudioPlaylist:", v9);
}

- (void)setContainerEffect:(id)a3
{
  id v4 = -[NSMutableArray lastObject](self->_effects, "lastObject");
  [v4 setPlug:0];
  [v4 setContainer:a3];
}

- (void)setParentLayer:(id)a3
{
  if (a3 && self->_parentLayer)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"An effect container may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPEffectContainer setStartTime:](v3, v4, v5);
  }

  else
  {
    self->_transitionDisconnected = 0;
    self->_parentLayer = (MPLayer *)a3;
  }

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (BOOL)shouldBeParallelizer
{
  if (-[NSMutableArray count](self->_effects, "count") == (char *)&dword_0 + 1
    && !-[MPEffectContainer backgroundCGColor](self, "backgroundCGColor")
    && !-[MPEffectContainer audioPlaylist](self, "audioPlaylist"))
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    effects = self->_effects;
    id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    if (!v3) {
      return (char)v3;
    }
    id v5 = v3;
    uint64_t v6 = *(void *)v10;
LABEL_8:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(effects);
      }
      if (v5 == (id)++v7)
      {
        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
        LOBYTE(v3) = 0;
        if (v5) {
          goto LABEL_8;
        }
        return (char)v3;
      }
    }
  }

  LOBYTE(v3) = 1;
  return (char)v3;
}

- (void)convertFromParallelizerToEffectContainer
{
  if (!-[MPEffectContainer shouldBeParallelizer](self, "shouldBeParallelizer") && self->_containerPlug)
  {
    id v3 = objc_msgSend(-[MPEffectContainer parentLayer](self, "parentLayer"), "parentDocument");
    objc_msgSend(objc_msgSend(v3, "montage"), "lock");
    id v4 = -[NSMutableArray lastObject](self->_effects, "lastObject");
    objc_msgSend(objc_msgSend(v4, "plug"), "phaseInDuration");
    double v6 = v5;
    objc_msgSend(objc_msgSend(v4, "plug"), "loopDuration");
    double v8 = v7;
    objc_msgSend(objc_msgSend(v4, "plug"), "phaseOutDuration");
    double v10 = v9;
    id v11 = [v4 container];
    if (v11)
    {
      __int128 v12 = v11;
      [v11 specialRetain];
      -[MCContainerParallelizer removePlug:](self->_containerParallelizer, "removePlug:", [v4 plug]);
      -[MCPlug setContainer:](self->_containerPlug, "setContainer:", v12);
      [v12 specialRelease];
    }

    -[MCPlug setPhaseInDuration:](self->_containerPlug, "setPhaseInDuration:", v6);
    -[MCPlug setPhaseOutDuration:](self->_containerPlug, "setPhaseOutDuration:", v10);
    -[MCPlug setLoopDuration:](self->_containerPlug, "setLoopDuration:", v8);
    containerParallelizer = self->_containerParallelizer;
    if (containerParallelizer)
    {

      self->_containerParallelizer = 0LL;
    }

    [v4 setPlug:0];
    objc_msgSend(objc_msgSend(v3, "montage"), "unlock");
  }

- (void)convertFromEffectContainerToParallelizer
{
  id v3 = objc_msgSend(-[MPEffectContainer parentLayer](self, "parentLayer"), "parentDocument");
  objc_msgSend(objc_msgSend(v3, "montage"), "lock");
  id v4 = -[NSMutableArray objectAtIndex:](self->_effects, "objectAtIndex:", 0LL);
  id v5 = objc_msgSend(objc_msgSend(v4, "container"), "specialRetain");
  containerParallelizer = self->_containerParallelizer;
  if (containerParallelizer)
  {

    self->_containerParallelizer = 0LL;
  }

  double v7 = (MCContainerParallelizer *) objc_msgSend( -[MPLayer montage](self->_parentLayer, "montage"),  "createParallelizerContainer");
  self->_containerParallelizer = v7;
  -[MCPlug setContainer:](self->_containerPlug, "setContainer:", v7);
  id v8 = -[MCContainerParallelizer setPlugForContainer:forID:]( self->_containerParallelizer,  "setPlugForContainer:forID:",  v5,  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"));
  [v5 specialRelease];
  -[MCPlug loopDuration](self->_containerPlug, "loopDuration");
  objc_msgSend(v8, "setLoopDuration:");
  -[MCPlug phaseInDuration](self->_containerPlug, "phaseInDuration");
  objc_msgSend(v8, "setPhaseInDuration:");
  -[MCPlug phaseOutDuration](self->_containerPlug, "phaseOutDuration");
  objc_msgSend(v8, "setPhaseOutDuration:");
  containerPlug = self->_containerPlug;
  -[MCPlug phaseInDuration](containerPlug, "phaseInDuration");
  double v11 = v10;
  -[MCPlug phaseOutDuration](self->_containerPlug, "phaseOutDuration");
  double v13 = v11 + v12;
  -[MCPlug loopDuration](containerPlug, "loopDuration");
  -[MCPlug setLoopDuration:](containerPlug, "setLoopDuration:", v14 + v13);
  -[MCPlug setPhaseInDuration:](self->_containerPlug, "setPhaseInDuration:", 0.0);
  -[MCPlug setPhaseOutDuration:](self->_containerPlug, "setPhaseOutDuration:", 0.0);
  [v4 setPlug:v8];
  objc_msgSend(objc_msgSend(v3, "montage"), "unlock");
}

- (void)calculateDurationToSmallest:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (char *)-[NSMutableArray count](self->_effects, "count");
  effects = self->_effects;
  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    id v7 = -[NSMutableArray lastObject](effects, "lastObject");
    [v7 phaseInDuration];
    double v9 = v8;
    [v7 phaseOutDuration];
    double v11 = v10;
    [v7 mainDuration];
    double v13 = v12;
    double v14 = v9 + v11 + v12;
    -[MPEffectContainer duration](self, "duration");
    if (v14 != v15)
    {
      double v16 = v15;
      -[MPEffectContainer willChangeValueForKey:](self, "willChangeValueForKey:", @"duration");
      self->_duration = v14;
      -[MPEffectContainer didChangeValueForKey:](self, "didChangeValueForKey:", @"duration");
      parentLayer = self->_parentLayer;
      if (parentLayer)
      {
        -[MPLayer duration](parentLayer, "duration");
        -[MPLayer setDuration:](self->_parentLayer, "setDuration:", v14 - v16 + v18);
      }

      containerPlug = self->_containerPlug;
      if (containerPlug)
      {
        -[MCPlug phaseInDuration](containerPlug, "phaseInDuration");
        if (v20 != v9) {
          -[MCPlug setPhaseInDuration:](self->_containerPlug, "setPhaseInDuration:", v9);
        }
        -[MCPlug phaseOutDuration](self->_containerPlug, "phaseOutDuration");
        if (v21 != v11) {
          -[MCPlug setPhaseOutDuration:](self->_containerPlug, "setPhaseOutDuration:", v11);
        }
        -[MCPlug loopDuration](self->_containerPlug, "loopDuration");
        if (v22 != v13) {
          -[MCPlug setLoopDuration:](self->_containerPlug, "setLoopDuration:", v13);
        }
      }
    }
  }

  else if ((unint64_t)-[NSMutableArray count](effects, "count") >= 2)
  {
    objc_msgSend(-[NSMutableArray objectAtIndex:](self->_effects, "objectAtIndex:", 0), "fullDuration");
    double v24 = v23;
    if (v3)
    {
      __int128 v57 = 0uLL;
      __int128 v58 = 0uLL;
      __int128 v55 = 0uLL;
      __int128 v56 = 0uLL;
      __int128 v25 = self->_effects;
      id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v55,  v61,  16LL);
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v56;
        do
        {
          for (id i = 0LL; i != v27; id i = (char *)i + 1)
          {
            if (*(void *)v56 != v28) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(*((void *)&v55 + 1) + 8 * (void)i) fullDuration];
            if (v30 < v24) {
              double v24 = v30;
            }
          }

          id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v55,  v61,  16LL);
        }

        while (v27);
      }
    }

    else
    {
      __int128 v53 = 0uLL;
      __int128 v54 = 0uLL;
      __int128 v51 = 0uLL;
      __int128 v52 = 0uLL;
      __int128 v31 = self->_effects;
      id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v51,  v60,  16LL);
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v52;
        do
        {
          for (j = 0LL; j != v33; j = (char *)j + 1)
          {
            if (*(void *)v52 != v34) {
              objc_enumerationMutation(v31);
            }
            [*(id *)(*((void *)&v51 + 1) + 8 * (void)j) fullDuration];
            if (v36 > v24) {
              double v24 = v36;
            }
          }

          id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v51,  v60,  16LL);
        }

        while (v33);
      }
    }

    -[MPEffectContainer duration](self, "duration");
    double v38 = v37;
    -[MPEffectContainer willChangeValueForKey:](self, "willChangeValueForKey:", @"duration");
    self->_duration = v24;
    -[MPEffectContainer didChangeValueForKey:](self, "didChangeValueForKey:", @"duration");
    uint64_t v39 = self->_parentLayer;
    if (v39)
    {
      -[MPLayer duration](v39, "duration");
      -[MPLayer setDuration:](self->_parentLayer, "setDuration:", v24 - v38 + v40);
    }

    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v41 = self->_effects;
    id v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v47,  v59,  16LL);
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v48;
      do
      {
        for (k = 0LL; k != v43; k = (char *)k + 1)
        {
          if (*(void *)v48 != v44) {
            objc_enumerationMutation(v41);
          }
          [*(id *)(*((void *)&v47 + 1) + 8 * (void)k) scaleMainDuration];
        }

        id v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v47,  v59,  16LL);
      }

      while (v43);
    }

    __int128 v46 = self->_containerPlug;
    if (v46) {
      -[MCPlug setLoopDuration:](v46, "setLoopDuration:", v24);
    }
  }

- (void)setUserInfoAttribute:(id)a3 forKey:(id)a4
{
  attributes = self->_attributes;
  if (!attributes)
  {
    attributes = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->_attributes = attributes;
  }

  -[NSMutableDictionary setObject:forKey:](attributes, "setObject:forKey:", a3, a4);
}

- (id)userInfoAttributeForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", a3);
}

- (int64_t)slideCount
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  effects = self->_effects;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  int64_t v5 = 0LL;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (id i = 0LL; i != v4; id i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(effects);
      }
      v5 += (int64_t)[*(id *)(*((void *)&v9 + 1) + 8 * (void)i) countOfSlides];
    }

    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  }

  while (v4);
  return v5;
}

- (int64_t)textCount
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  effects = self->_effects;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  int64_t v5 = 0LL;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (id i = 0LL; i != v4; id i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(effects);
      }
      v5 += (int64_t)[*(id *)(*((void *)&v9 + 1) + 8 * (void)i) countOfTexts];
    }

    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effects,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  }

  while (v4);
  return v5;
}

- (id)nearestLayerGroup
{
  id v2 = -[MPEffectContainer parentLayer](self, "parentLayer");
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0 && v2)
  {
    do
    {
      id v2 = [v2 parent];
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v5);
    }

    while ((objc_opt_isKindOfClass(v2, v6) & 1) == 0 && v2);
  }

  return v2;
}

- (int64_t)countOfEffects
{
  return (int64_t)-[NSMutableArray count](self->_effects, "count");
}

- (id)objectInEffectsAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_effects, "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 inEffectsAtIndex:(int64_t)a4
{
}

- (void)removeObjectFromEffectsAtIndex:(int64_t)a3
{
}

- (void)replaceObjectInEffectsAtIndex:(int64_t)a3 withObject:(id)a4
{
}

- (int64_t)countOfFilters
{
  return (int64_t)-[NSMutableArray count](self->_filters, "count");
}

- (id)objectInFiltersAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_filters, "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 inFiltersAtIndex:(int64_t)a4
{
}

- (void)removeObjectFromFiltersAtIndex:(int64_t)a3
{
}

- (void)replaceObjectInFiltersAtIndex:(int64_t)a3 withObject:(id)a4
{
}

- (id)scriptingTransition
{
  if (!self->_transition) {
    return +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
  }
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKey:",  -[MPTransition transitionID](self->_transition, "transitionID"),  @"transitionID");
  objc_msgSend(v3, "setObject:forKey:", -[MPTransition presetID](self->_transition, "presetID"), @"presetID");
  -[MPTransition duration](self->_transition, "duration");
  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"duration");
  return v3;
}

- (void)setScriptingTransition:(id)a3
{
  if ([a3 objectForKey:@"transitionID"])
  {
    if (objc_msgSend( objc_msgSend(a3, "objectForKey:", @"transitionID"),  "isEqualToString:",  &stru_259C60))
    {
      uint64_t v5 = 0LL;
    }

    else
    {
      uint64_t v5 = +[MPTransition transitionWithTransitionID:]( MPTransition,  "transitionWithTransitionID:",  [a3 objectForKey:@"transitionID"]);
      if ([a3 objectForKey:@"presetID"]) {
        -[MPTransition setPresetID:](v5, "setPresetID:", [a3 objectForKey:@"presetID"]);
      }
      if ([a3 objectForKey:@"duration"])
      {
        objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duration"), "doubleValue");
        -[MPTransition setDuration:](v5, "setDuration:");
      }
    }

    -[MPEffectContainer setTransition:](self, "setTransition:", v5);
  }

@end