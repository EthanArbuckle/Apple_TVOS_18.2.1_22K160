@interface MPLayer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)effectLayer;
+ (id)layer;
+ (id)sequentialLayer;
- (BOOL)isAudioLayer;
- (BOOL)isTriggered;
- (BOOL)skipTimeCalculations;
- (BOOL)startsPaused;
- (CGPoint)position;
- (CGSize)size;
- (MPLayer)init;
- (NSString)layerID;
- (NSString)title;
- (double)duration;
- (double)height;
- (double)numberOfLoops;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)rotationAngle;
- (double)scale;
- (double)timeIn;
- (double)xRotationAngle;
- (double)yPosition;
- (double)yRotationAngle;
- (double)zPosition;
- (id)action;
- (id)actionForKey:(id)a3;
- (id)actions;
- (id)allSlides:(BOOL)a3;
- (id)allSongs;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)audioPlaylist;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectContainers;
- (id)filters;
- (id)fullDebugLog;
- (id)layerKey;
- (id)montage;
- (id)objectID;
- (id)objectInEffectContainersAtIndex:(int64_t)a3;
- (id)objectInFiltersAtIndex:(int64_t)a3;
- (id)parent;
- (id)parentDocument;
- (id)plug;
- (id)plugID;
- (id)scriptingAnimations;
- (id)uuid;
- (int64_t)audioPriority;
- (int64_t)countOfEffectContainers;
- (int64_t)countOfFilters;
- (int64_t)zIndex;
- (void)addEffectContainer:(id)a3;
- (void)addEffectContainers:(id)a3;
- (void)addFilter:(id)a3;
- (void)addFilters:(id)a3;
- (void)cleanup;
- (void)configureActions;
- (void)copyActions:(id)a3;
- (void)copyAnimationPaths:(id)a3;
- (void)copyAudioPlaylist:(id)a3;
- (void)copyEffectContainers:(id)a3;
- (void)copyFilters:(id)a3;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)insertFilters:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inEffectContainersAtIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inFiltersAtIndex:(int64_t)a4;
- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)reconnectAllTransitions;
- (void)reconnectTransitionForEffectContainerAtIndex:(int64_t)a3;
- (void)removeActionForKey:(id)a3;
- (void)removeAllEffectContainers;
- (void)removeAllFilters;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeFiltersAtIndices:(id)a3;
- (void)removeObjectFromEffectContainersAtIndex:(int64_t)a3;
- (void)removeObjectFromFiltersAtIndex:(int64_t)a3;
- (void)replaceObjectInEffectContainersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceObjectInFiltersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)resetStartTimes;
- (void)setAction:(id)a3 forKey:(id)a4;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setAudioPriority:(int64_t)a3;
- (void)setDuration:(double)a3;
- (void)setHeight:(double)a3;
- (void)setIsAudioLayer:(BOOL)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setLayerID:(id)a3;
- (void)setMontage:(id)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setParent:(id)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPlug:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setScriptingAnimations:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setSkipTimeCalculations:(BOOL)a3;
- (void)setStartsPaused:(BOOL)a3;
- (void)setTimeIn:(double)a3;
- (void)setTitle:(id)a3;
- (void)setWidth:(double)a3;
- (void)setXPosition:(double)a3;
- (void)setXRotationAngle:(double)a3;
- (void)setYPosition:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZIndex:(int64_t)a3;
- (void)setZPosition:(double)a3;
- (void)updateDurationPadding:(double)a3;
- (void)updateMainDuration;
@end

@implementation MPLayer

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return [a3 isEqualToString:@"effectContainers"] ^ 1;
}

+ (id)layer
{
  return objc_alloc_init(&OBJC_CLASS___MPLayerSerializer);
}

+ (id)sequentialLayer
{
  return objc_alloc_init(&OBJC_CLASS___MPLayerSerializer);
}

+ (id)effectLayer
{
  return objc_alloc_init(&OBJC_CLASS___MPLayerEffect);
}

- (MPLayer)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPLayer;
  v2 = -[MPLayer init](&v4, "init");
  if (v2)
  {
    v2->_internal = objc_alloc_init(&OBJC_CLASS___MPLayerInternal);
    v2->_effectContainers = 0LL;
    v2->_filters = 0LL;
    v2->_attributes = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_skipTimeCalculations = 0;
    v2->_actions = 0LL;
    v2->_audioPlaylist = 0LL;
    v2->_animationPaths = 0LL;
    -[MPLayerInternal setTitle:](v2->_internal, "setTitle:", 0LL);
    -[MPLayerInternal setNumberOfLoops:](v2->_internal, "setNumberOfLoops:", 1.0);
    -[MPLayerInternal setOpacity:](v2->_internal, "setOpacity:", 1.0);
    -[MPLayerInternal setPosition:](v2->_internal, "setPosition:", CGPointZero.x, CGPointZero.y);
    -[MPLayerInternal setZPosition:](v2->_internal, "setZPosition:", 0.0);
    -[MPLayerInternal setSize:](v2->_internal, "setSize:", 2.0, 2.0);
    -[MPLayerInternal setXRotationAngle:](v2->_internal, "setXRotationAngle:", 0.0);
    -[MPLayerInternal setYRotationAngle:](v2->_internal, "setYRotationAngle:", 0.0);
    -[MPLayerInternal setScale:](v2->_internal, "setScale:", 1.0);
    -[MPLayerInternal setTimeIn:](v2->_internal, "setTimeIn:", 0.0);
    -[MPLayerInternal setStartsPaused:](v2->_internal, "setStartsPaused:", 0LL);
    -[MPLayerInternal setIsTriggered:](v2->_internal, "setIsTriggered:", 0LL);
    -[MPLayerInternal setDuration:](v2->_internal, "setDuration:", 0.0);
    -[MPLayerInternal setPhaseInDuration:](v2->_internal, "setPhaseInDuration:", 0.0);
    -[MPLayerInternal setPhaseOutDuration:](v2->_internal, "setPhaseOutDuration:", 0.0);
    -[MPLayerInternal setIsAudioLayer:](v2->_internal, "setIsAudioLayer:", 0LL);
    -[MPLayerInternal setAudioPriority:](v2->_internal, "setAudioPriority:", 0LL);
    -[MPLayerInternal setDurationPadding:](v2->_internal, "setDurationPadding:", 0.0);
    -[MPLayerInternal setLayerID:](v2->_internal, "setLayerID:", 0LL);
    -[MPLayerInternal setZIndex:](v2->_internal, "setZIndex:", 0LL);
    -[MPLayerInternal setContainerLock:]( v2->_internal,  "setContainerLock:",  objc_alloc_init(&OBJC_CLASS___NSLock));
    -[NSLock setName:]( -[MPLayerInternal containerLock](v2->_internal, "containerLock"),  "setName:",  @"MPLayerInternal.containerLock");
    -[MPLayerInternal setUuid:]( v2->_internal,  "setUuid:",  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"));
    -[MPLayerInternal setCleaningUp:](v2->_internal, "setCleaningUp:", 0LL);
  }

  return v2;
}

- (id)description
{
  v3 = -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"============================= Layer %d Description =============================\n",  -[MPLayer zIndex](self, "zIndex")),  "stringByAppendingFormat:",  @"\t        Effect Container Count: %d\n",  -[NSMutableArray count](self->_effectContainers, "count")),  "stringByAppendingFormat:",  @"\t                  Filter Count: %d\n",  -[NSMutableArray count](self->_filters, "count"));
  -[MPLayer duration](self, "duration");
  v5 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                      Duration: %f\n",  v4);
  if (self->_plug) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"\t                Has Layer Plug: %@\n",  v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copyStruct:self->_internal];
  [v4 copyEffectContainers:self->_effectContainers];
  [v4 copyFilters:self->_filters];
  [v4 copyAnimationPaths:self->_animationPaths];
  [v4 copyAudioPlaylist:self->_audioPlaylist];
  [v4 copyActions:self->_actions];
  return v4;
}

- (void)dealloc
{
  montage = self->_montage;
  if (montage) {

  }
  self->_montage = 0LL;
  self->_internal = 0LL;

  self->_audioPlaylist = 0LL;
  self->_effectContainers = 0LL;

  self->_filters = 0LL;
  self->_attributes = 0LL;

  self->_animationPaths = 0LL;
  self->_actions = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPLayer;
  -[MPLayer dealloc](&v4, "dealloc");
}

- (NSString)title
{
  return -[MPLayerInternal title](self->_internal, "title");
}

- (void)setTitle:(id)a3
{
}

- (id)effectContainers
{
  return self->_effectContainers;
}

- (void)addEffectContainer:(id)a3
{
  objc_super v4 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  -[MPLayer insertEffectContainers:atIndex:]( self,  "insertEffectContainers:atIndex:",  v4,  -[NSMutableArray count](self->_effectContainers, "count"));
}

- (void)addEffectContainers:(id)a3
{
}

- (void)removeAllEffectContainers
{
  if (-[NSMutableArray count](self->_effectContainers, "count"))
  {
    v3 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  -[NSMutableArray count](self->_effectContainers, "count"));
    -[MPLayer removeEffectContainersAtIndices:](self, "removeEffectContainersAtIndices:", v3);
  }

- (id)filters
{
  return self->_filters;
}

- (void)addFilter:(id)a3
{
}

- (void)addFilters:(id)a3
{
}

- (void)insertFilters:(id)a3 atIndex:(int64_t)a4
{
  int64_t v4 = a4;
  v7 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [a3 count]);
  -[MPLayer willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2LL, v7, @"filters");
  filters = self->_filters;
  if (!filters)
  {
    filters = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_filters = filters;
  }

  -[NSMutableArray insertObjects:atIndexes:](filters, "insertObjects:atIndexes:", a3, v7);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v12) setParent:self];
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v10);
  }

  if (self->_plug)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v13 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)v16),  "setFilter:",  -[MCPlugParallel insertFilterWithFilterID:atIndex:]( self->_plug,  "insertFilterWithFilterID:atIndex:",  objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v16), "filterID"),  (char *)v16 + v4));
          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
        v4 += (int64_t)v16;
      }

      while (v14);
    }
  }

  -[MPLayer didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2LL, v7, @"filters");
}

- (void)removeFiltersAtIndices:(id)a3
{
  if (-[NSMutableArray count](self->_filters, "count"))
  {
    -[MPLayer willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3LL, a3, @"filters");
    id v5 = [a3 lastIndex];
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v5; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v7 = -[NSMutableArray objectAtIndex:](self->_filters, "objectAtIndex:", i);
        [v7 setParent:0];
        [v7 setFilter:0];
      }
    }

    plug = self->_plug;
    if (plug) {
      -[MCPlugParallel removeFiltersAtIndices:](plug, "removeFiltersAtIndices:", a3);
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_filters, "removeObjectsAtIndexes:", a3);
    -[MPLayer didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3LL, a3, @"filters");
  }

- (void)removeAllFilters
{
  if (-[NSMutableArray count](self->_filters, "count"))
  {
    v3 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  -[NSMutableArray count](self->_filters, "count"));
    -[MPLayer removeFiltersAtIndices:](self, "removeFiltersAtIndices:", v3);
  }

- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4
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

  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel moveFiltersAtIndices:toIndex:](plug, "moveFiltersAtIndices:toIndex:", a3, a4);
  }
}

- (id)animationPaths
{
  return self->_animationPaths;
}

- (id)animationPathForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", a3);
}

- (void)setAnimationPath:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v7 = -[MPLayer animationPathForKey:](self, "animationPathForKey:", a4);
    if (v7)
    {
      id v8 = v7;
      [v7 setParent:0];
      [v8 setAnimationPath:0];
    }

    [a3 setParent:self];
    animationPaths = self->_animationPaths;
    if (!animationPaths)
    {
      animationPaths = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      self->_animationPaths = animationPaths;
    }

    -[NSMutableDictionary setObject:forKey:](animationPaths, "setObject:forKey:", a3, a4);
    plug = self->_plug;
    if (plug)
    {
      -[MCPlug removeAnimationPathForKey:](plug, "removeAnimationPathForKey:", a4);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v11);
      char isKindOfClass = objc_opt_isKindOfClass(a3, v12);
      id v14 = off_24C620;
      if ((isKindOfClass & 1) == 0) {
        id v14 = off_24C628;
      }
      id v15 = -[__objc2_class animationPathWithKey:](*v14, "animationPathWithKey:", a4);
      -[MCPlug addAnimationPath:](self->_plug, "addAnimationPath:", v15);
      [a3 setAnimationPath:v15];
    }
  }

  else
  {
    -[MPLayer removeAnimationPathForKey:](self, "removeAnimationPathForKey:", a4);
  }

- (void)removeAnimationPathForKey:(id)a3
{
  id v5 = -[MPLayer animationPathForKey:](self, "animationPathForKey:");
  plug = self->_plug;
  if (plug)
  {
    -[MCPlug removeAnimationPathForKey:](plug, "removeAnimationPathForKey:", a3);
    [v5 setAnimationPath:0];
  }

  [v5 setParent:0];
  -[NSMutableDictionary removeObjectForKey:](self->_animationPaths, "removeObjectForKey:", a3);
}

- (double)opacity
{
  return result;
}

- (void)setOpacity:(double)a3
{
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setOpacity:](plug, "setOpacity:", a3);
  }
}

- (double)scale
{
  return result;
}

- (void)setScale:(double)a3
{
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setScale:](plug, "setScale:", a3);
  }
}

- (CGPoint)position
{
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[MPLayerInternal setPosition:](self->_internal, "setPosition:");
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setPosition:](plug, "setPosition:", x, y);
  }
}

- (double)zPosition
{
  return result;
}

- (void)setZPosition:(double)a3
{
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setZPosition:](plug, "setZPosition:", a3);
  }
}

- (double)rotationAngle
{
  return result;
}

- (void)setRotationAngle:(double)a3
{
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setRotationAngle:](plug, "setRotationAngle:", a3);
  }
}

- (CGSize)size
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[MPLayerInternal setSize:](self->_internal, "setSize:");
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setSize:](plug, "setSize:", width, height);
  }
}

- (double)xRotationAngle
{
  return result;
}

- (void)setXRotationAngle:(double)a3
{
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setXRotationAngle:](plug, "setXRotationAngle:", a3);
  }
}

- (double)yRotationAngle
{
  return result;
}

- (void)setYRotationAngle:(double)a3
{
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setYRotationAngle:](plug, "setYRotationAngle:", a3);
  }
}

- (int64_t)zIndex
{
  plug = self->_plug;
  if (plug) {
    return -[MCPlugParallel zIndex](plug, "zIndex");
  }
  else {
    return -[MPLayerInternal zIndex](self->_internal, "zIndex");
  }
}

- (void)setZIndex:(int64_t)a3
{
  __int16 v3 = a3;
  -[MPLayerInternal setZIndex:](self->_internal, "setZIndex:");
  if (objc_msgSend(-[MPLayer parent](self, "parent"), "layersCanPositionZIndex"))
  {
    plug = self->_plug;
    if (plug) {
      -[MCPlugParallel setZIndex:](plug, "setZIndex:", v3);
    }
  }

- (id)parent
{
  return self->_parent;
}

- (double)timeIn
{
  return result;
}

- (void)setTimeIn:(double)a3
{
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setTimeIn:](plug, "setTimeIn:", a3);
  }
}

- (double)duration
{
  return result;
}

- (void)setDuration:(double)a3
{
  if (a3 < 0.0)
  {
    NSLog(@"iLifeSlideshow: Trying to set a duration less than 0.", a2);
    a3 = 0.0;
  }

  -[MPLayerInternal setDuration:](self->_internal, "setDuration:", a3);
  -[MPLayer updateMainDuration](self, "updateMainDuration");
  -[MPLayer resetStartTimes](self, "resetStartTimes");
  if (!self->_skipTimeCalculations) {
    objc_msgSend(-[MPLayer parent](self, "parent"), "resetDuration");
  }
}

- (double)phaseInDuration
{
  return result;
}

- (void)setPhaseInDuration:(double)a3
{
  plug = self->_plug;
  if (plug)
  {
    -[MCPlug setPhaseInDuration:](plug, "setPhaseInDuration:", a3);
    -[MPLayer updateMainDuration](self, "updateMainDuration");
  }

- (double)phaseOutDuration
{
  return result;
}

- (void)setPhaseOutDuration:(double)a3
{
  plug = self->_plug;
  if (plug)
  {
    -[MCPlug setPhaseOutDuration:](plug, "setPhaseOutDuration:", a3);
    -[MPLayer updateMainDuration](self, "updateMainDuration");
  }

- (BOOL)isTriggered
{
  return -[MPLayerInternal isTriggered](self->_internal, "isTriggered");
}

- (void)setIsTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPLayerInternal setIsTriggered:](self->_internal, "setIsTriggered:");
  plug = self->_plug;
  if (plug)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v5);
    if ((objc_opt_isKindOfClass(plug, v7) & 1) != 0) {
      -[MCPlugParallel setIsTriggered:](self->_plug, "setIsTriggered:", v3);
    }
  }

- (BOOL)startsPaused
{
  return -[MPLayerInternal startsPaused](self->_internal, "startsPaused");
}

- (void)setStartsPaused:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPLayerInternal setStartsPaused:](self->_internal, "setStartsPaused:");
  plug = self->_plug;
  if (plug) {
    -[MCPlug setStartsPaused:](plug, "setStartsPaused:", v3);
  }
}

- (id)audioPlaylist
{
  return self->_audioPlaylist;
}

- (int64_t)audioPriority
{
  return -[MPLayerInternal audioPriority](self->_internal, "audioPriority");
}

- (void)setAudioPriority:(int64_t)a3
{
  __int16 v3 = a3;
  -[MPLayerInternal setAudioPriority:](self->_internal, "setAudioPriority:");
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setAudioPriority:](plug, "setAudioPriority:", v3);
  }
}

- (double)numberOfLoops
{
  return result;
}

- (void)setNumberOfLoops:(double)a3
{
  plug = self->_plug;
  if (plug)
  {
    -[MCPlug setNumberOfLoops:](plug, "setNumberOfLoops:", a3);
    -[MPLayer updateMainDuration](self, "updateMainDuration");
  }

  [self->_parent resetDuration];
}

- (BOOL)isAudioLayer
{
  return -[MPLayerInternal isAudioLayer](self->_internal, "isAudioLayer");
}

- (void)setIsAudioLayer:(BOOL)a3
{
}

- (void)setLayerID:(id)a3
{
}

- (NSString)layerID
{
  return -[MPLayerInternal layerID](self->_internal, "layerID");
}

- (id)layerKey
{
  if (objc_msgSend(-[MPLayer parent](self, "parent"), "layersCanPositionZIndex")) {
    return objc_msgSend( objc_msgSend(-[MPLayer parent](self, "parent"), "layerKeyDictionary"),  "objectForKey:",  -[MPLayer uuid](self, "uuid"));
  }
  else {
    return 0LL;
  }
}

- (id)actions
{
  return self->_actions;
}

- (id)actionForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_actions, "objectForKey:", a3);
}

- (void)setAction:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (!self->_actions) {
      self->_actions = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v7 = -[MPLayer actionForKey:](self, "actionForKey:", a4);
    if (v7) {
      [v7 setParent:0];
    }
    [a3 setParent:self];
    -[NSMutableDictionary setObject:forKey:](self->_actions, "setObject:forKey:", a3, a4);
    plug = self->_plug;
    if (plug) {
      objc_msgSend( a3,  "setAction:",  +[MPUtilities createMCAction:forPlug:withKey:]( MPUtilities,  "createMCAction:forPlug:withKey:",  a3,  plug,  a4));
    }
  }

  else
  {
    -[MPLayer removeActionForKey:](self, "removeActionForKey:", a4);
  }

- (void)removeActionForKey:(id)a3
{
  id v5 = -[MPLayer actionForKey:](self, "actionForKey:");
  plug = self->_plug;
  if (plug) {
    -[MCPlug removeActionForKey:](plug, "removeActionForKey:", a3);
  }
  [v5 setParent:0];
  -[NSMutableDictionary removeObjectForKey:](self->_actions, "removeObjectForKey:", a3);
}

- (id)plug
{
  return self->_plug;
}

- (id)montage
{
  return self->_montage;
}

- (id)allSlides:(BOOL)a3
{
  BOOL v31 = a3;
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  -[NSLock lock](-[MPLayerInternal containerLock](self->_internal, "containerLock"), "lock");
  id v5 = -[NSMutableArray copy](self->_effectContainers, "copy");
  -[NSLock unlock](-[MPLayerInternal containerLock](self->_internal, "containerLock"), "unlock");
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v5;
  id v28 = [v5 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v45;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        id v7 = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * v6), "effects"), "copy");
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id v30 = v7;
        id v8 = [v7 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v41;
          do
          {
            for (id i = 0LL; i != v9; id i = (char *)i + 1)
            {
              if (*(void *)v41 != v10) {
                objc_enumerationMutation(v30);
              }
              uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
              id v13 = objc_msgSend(objc_msgSend(v12, "slides"), "copy");
              __int128 v36 = 0u;
              __int128 v37 = 0u;
              __int128 v38 = 0u;
              __int128 v39 = 0u;
              id v14 = [v13 countByEnumeratingWithState:&v36 objects:v49 count:16];
              if (v14)
              {
                id v15 = v14;
                uint64_t v16 = *(void *)v37;
                do
                {
                  for (j = 0LL; j != v15; j = (char *)j + 1)
                  {
                    if (*(void *)v37 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    __int128 v18 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)j);
                    if ([v18 path] && objc_msgSend(v18, "parent")) {
                      [v4 addObject:v18];
                    }
                  }

                  id v15 = [v13 countByEnumeratingWithState:&v36 objects:v49 count:16];
                }

                while (v15);
              }

              if (v31)
              {
                id v19 = objc_msgSend(objc_msgSend(v12, "secondarySlides"), "copy");
                __int128 v32 = 0u;
                __int128 v33 = 0u;
                __int128 v34 = 0u;
                __int128 v35 = 0u;
                id v20 = [v19 countByEnumeratingWithState:&v32 objects:v48 count:16];
                if (v20)
                {
                  id v21 = v20;
                  uint64_t v22 = *(void *)v33;
                  do
                  {
                    for (k = 0LL; k != v21; k = (char *)k + 1)
                    {
                      if (*(void *)v33 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      __int128 v24 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)k);
                      if ([v24 path] && objc_msgSend(v24, "parent")) {
                        [v4 addObject:v24];
                      }
                    }

                    id v21 = [v19 countByEnumeratingWithState:&v32 objects:v48 count:16];
                  }

                  while (v21);
                }
              }
            }

            id v9 = [v30 countByEnumeratingWithState:&v40 objects:v50 count:16];
          }

          while (v9);
        }

        uint64_t v6 = v29 + 1;
      }

      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }

    while (v28);
  }

  return v4;
}

- (id)allSongs
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  effectContainers = self->_effectContainers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effectContainers,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (id i = 0LL; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(effectContainers);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(objc_msgSend(v9, "audioPlaylist"), "songs"));
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        id v10 = objc_msgSend(v9, "effects", 0);
        id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            for (j = 0LL; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              objc_msgSend( v3,  "addObjectsFromArray:",  objc_msgSend(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)j), "audioPlaylist"), "songs"));
            }

            id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }

          while (v12);
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effectContainers,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  id v3 = -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@\n",  -[MPLayer description](self, "description")),  "stringByAppendingFormat:",  @"============================ Layer %d Effect Containers =======================\n",  -[MPLayer zIndex](self, "zIndex"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  effectContainers = self->_effectContainers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effectContainers,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (id i = 0LL; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(effectContainers);
        }
        id v3 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"%@\n",  [*(id *)(*((void *)&v20 + 1) + 8 * (void)i) fullDebugLog]);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effectContainers,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v6);
  }

  id v9 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"================================ Layer %d Filters =============================\n",  -[MPLayer zIndex](self, "zIndex"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  filters = self->_filters;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(filters);
        }
        id v9 = -[NSString stringByAppendingFormat:]( v9,  "stringByAppendingFormat:",  @"%@\n",  [*(id *)(*((void *)&v16 + 1) + 8 * (void)j) fullDebugLog]);
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v12);
  }

  return v9;
}

- (id)parentDocument
{
  id v2 = -[MPLayer parent](self, "parent");
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPDocument, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0 && v2)
  {
    do
    {
      id v2 = [v2 parent];
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPDocument, v5);
    }

    while ((objc_opt_isKindOfClass(v2, v6) & 1) == 0 && v2);
  }

  return v2;
}

- (id)action
{
  return -[MCPlug actionForKey:](self->_plug, "actionForKey:", @"onHitStart");
}

- (id)plugID
{
  return -[MCPlugParallel idInSupercontainer](self->_plug, "idInSupercontainer");
}

- (id)objectID
{
  return -[MCObject objectID](self->_plug, "objectID");
}

- (id)uuid
{
  return -[MPLayerInternal uuid](self->_internal, "uuid");
}

- (void)copyStruct:(id)a3
{
}

- (void)copyEffectContainers:(id)a3
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
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
        -[NSMutableArray addObject:](v5, "addObject:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  -[MPLayer addEffectContainers:](self, "addEffectContainers:", v5);
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
        id v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
          -[NSMutableArray addObject:](v5, "addObject:", v10);

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v7);
    }

    -[MPLayer addFilters:](self, "addFilters:", a3);
  }

- (void)copyAnimationPaths:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (id i = 0LL; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        -[MPLayer setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v10, v9);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

- (void)copyActions:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (id i = 0LL; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        -[MPLayer setAction:forKey:](self, "setAction:forKey:", v10, v9);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

- (void)copyAudioPlaylist:(id)a3
{
  id v4 = [a3 copy];
  -[MPLayer setAudioPlaylist:](self, "setAudioPlaylist:", v4);
}

- (void)cleanup
{
  self->_skipTimeCalculations = 1;
  -[MPLayer removeAllEffectContainers](self, "removeAllEffectContainers");
  -[MPLayer removeAllFilters](self, "removeAllFilters");
  id v3 = -[NSMutableDictionary allKeys](self->_animationPaths, "allKeys");
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MPLayer removeAnimationPathForKey:]( self,  "removeAnimationPathForKey:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  -[MPLayer setAudioPlaylist:](self, "setAudioPlaylist:", 0LL);
}

- (void)setPlug:(id)a3
{
  id v5 = (MCPlugParallel *)a3;
  self->_plug = v5;
  if (v5)
  {
    -[MPLayer numberOfLoops](self, "numberOfLoops");
    -[MCPlug setNumberOfLoops:](self->_plug, "setNumberOfLoops:");
    -[MPLayer position](self, "position");
    -[MCPlugParallel setPosition:](self->_plug, "setPosition:");
    -[MPLayer size](self, "size");
    -[MCPlugParallel setSize:](self->_plug, "setSize:");
    -[MPLayer zPosition](self, "zPosition");
    -[MCPlugParallel setZPosition:](self->_plug, "setZPosition:");
    -[MPLayer rotationAngle](self, "rotationAngle");
    -[MCPlugParallel setRotationAngle:](self->_plug, "setRotationAngle:");
    -[MPLayer xRotationAngle](self, "xRotationAngle");
    -[MCPlugParallel setXRotationAngle:](self->_plug, "setXRotationAngle:");
    -[MPLayer yRotationAngle](self, "yRotationAngle");
    -[MCPlugParallel setYRotationAngle:](self->_plug, "setYRotationAngle:");
    -[MPLayer scale](self, "scale");
    -[MCPlugParallel setScale:](self->_plug, "setScale:");
    -[MPLayer opacity](self, "opacity");
    -[MCPlugParallel setOpacity:](self->_plug, "setOpacity:");
    -[MPLayer timeIn](self, "timeIn");
    -[MCPlugParallel setTimeIn:](self->_plug, "setTimeIn:");
    -[MCPlugParallel setIsTriggered:](self->_plug, "setIsTriggered:", -[MPLayer isTriggered](self, "isTriggered"));
    -[MCPlug setStartsPaused:](self->_plug, "setStartsPaused:", -[MPLayer startsPaused](self, "startsPaused"));
    -[MPLayer phaseInDuration](self, "phaseInDuration");
    -[MCPlug setPhaseInDuration:](self->_plug, "setPhaseInDuration:");
    -[MPLayer phaseOutDuration](self, "phaseOutDuration");
    -[MCPlug setPhaseOutDuration:](self->_plug, "setPhaseOutDuration:");
    -[MCPlugParallel setAudioPriority:]( self->_plug,  "setAudioPriority:",  (__int16)-[MPLayer audioPriority](self, "audioPriority"));
    if (objc_msgSend(-[MPLayer parent](self, "parent"), "layersCanPositionZIndex")) {
      -[MCPlugParallel setZIndex:]( self->_plug,  "setZIndex:",  (__int16)-[MPLayerInternal zIndex](self->_internal, "zIndex"));
    }
    -[MPLayer updateMainDuration](self, "updateMainDuration");
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    filters = self->_filters;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v55,  v63,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v56;
      do
      {
        for (id i = 0LL; i != v8; id i = (char *)i + 1)
        {
          if (*(void *)v56 != v9) {
            objc_enumerationMutation(filters);
          }
          objc_msgSend( *(id *)(*((void *)&v55 + 1) + 8 * (void)i),  "setFilter:",  -[MCPlugParallel addFilterWithFilterID:]( self->_plug,  "addFilterWithFilterID:",  objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * (void)i), "filterID")));
        }

        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v55,  v63,  16LL);
      }

      while (v8);
    }

    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    animationPaths = self->_animationPaths;
    id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v51,  v62,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v52;
      do
      {
        for (j = 0LL; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)j);
          id v17 = -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", v16);
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v18);
          if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0) {
            __int128 v20 = off_24C620;
          }
          else {
            __int128 v20 = off_24C628;
          }
          id v21 = -[__objc2_class animationPathWithKey:](*v20, "animationPathWithKey:", v16);
          -[MCPlug addAnimationPath:](self->_plug, "addAnimationPath:", v21);
          [v17 setAnimationPath:v21];
        }

        id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v51,  v62,  16LL);
      }

      while (v13);
    }

    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    actions = self->_actions;
    id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v47,  v61,  16LL);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v48;
      do
      {
        for (k = 0LL; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v48 != v25) {
            objc_enumerationMutation(actions);
          }
          uint64_t v27 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)k);
          id v28 = -[NSMutableDictionary objectForKey:](self->_actions, "objectForKey:", v27);
          objc_msgSend( v28,  "setAction:",  +[MPUtilities createMCAction:forPlug:withKey:]( MPUtilities,  "createMCAction:forPlug:withKey:",  v28,  self->_plug,  v27));
        }

        id v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v47,  v61,  16LL);
      }

      while (v24);
    }
  }

  else
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    uint64_t v29 = self->_filters;
    id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v43,  v60,  16LL);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v44;
      do
      {
        for (m = 0LL; m != v31; m = (char *)m + 1)
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v29);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * (void)m) setFilter:0];
        }

        id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v43,  v60,  16LL);
      }

      while (v31);
    }

    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v34 = self->_animationPaths;
    id v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v39,  v59,  16LL);
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v40;
      do
      {
        for (n = 0LL; n != v36; n = (char *)n + 1)
        {
          if (*(void *)v40 != v37) {
            objc_enumerationMutation(v34);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_animationPaths,  "objectForKey:",  *(void *)(*((void *)&v39 + 1) + 8 * (void)n)),  "setAnimationPath:",  0);
        }

        id v36 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v39,  v59,  16LL);
      }

      while (v36);
    }
  }

- (void)setParent:(id)a3
{
  if (a3 && self->_parent)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"A layer may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPLayer setMontage:](v4, v5, v6);
  }

  else
  {
    self->_parent = a3;
    if (!-[MPLayerInternal uuid](self->_internal, "uuid")) {
      -[MPLayerInternal setUuid:]( self->_internal,  "setUuid:",  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"));
    }
  }

- (void)setMontage:(id)a3
{
  montage = self->_montage;
  if (montage)
  {

    self->_montage = 0LL;
  }

  self->_montage = (MCMontage *)a3;
}

- (BOOL)skipTimeCalculations
{
  return self->_skipTimeCalculations;
}

- (void)setSkipTimeCalculations:(BOOL)a3
{
  self->_skipTimeCalculations = a3;
  -[MPLayer resetStartTimes](self, "resetStartTimes");
  if (!self->_skipTimeCalculations) {
    objc_msgSend(-[MPLayer parent](self, "parent"), "resetDuration");
  }
}

- (void)updateDurationPadding:(double)a3
{
  internal = self->_internal;
  -[MPLayerInternal durationPadding](internal, "durationPadding");
  -[MPLayerInternal setDurationPadding:](internal, "setDurationPadding:", v6 + a3);
  -[MPLayerInternal durationPadding](self->_internal, "durationPadding");
  if (v7 < 0.0) {
    -[MPLayerInternal setDurationPadding:](self->_internal, "setDurationPadding:", 0.0);
  }
  -[MPLayer updateMainDuration](self, "updateMainDuration");
  id v8 = -[MPLayer parent](self, "parent");
  objc_msgSend(-[MPLayer parent](self, "parent"), "durationPadding");
  [v8 setDurationPadding:v9 + a3];
}

- (void)updateMainDuration
{
  if (self->_plug)
  {
    -[MPLayer phaseInDuration](self, "phaseInDuration");
    double v4 = v3;
    -[MPLayer phaseOutDuration](self, "phaseOutDuration");
    double v6 = v4 + v5;
    -[MPLayer duration](self, "duration");
    double v8 = v7 - v6;
    if (v8 >= 0.0) {
      double v9 = v8;
    }
    else {
      double v9 = 0.0;
    }
    -[MPLayerInternal durationPadding](self->_internal, "durationPadding");
    -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v10 + v9);
  }

- (void)reconnectTransitionForEffectContainerAtIndex:(int64_t)a3
{
  if (-[MPLayer countOfEffectContainers](self, "countOfEffectContainers") > a3)
  {
    id v5 = -[NSMutableArray objectAtIndex:](self->_effectContainers, "objectAtIndex:", a3);
    if (([v5 isTransitionConnected] & 1) == 0)
    {
      objc_msgSend(objc_msgSend(v5, "transition"), "duration");
      -[MPLayer updateDurationPadding:](self, "updateDurationPadding:", -v6);
      effectContainers = self->_effectContainers;
      if (a3) {
        id v8 = -[NSMutableArray objectAtIndex:](effectContainers, "objectAtIndex:", a3 - 1);
      }
      else {
        id v8 = -[NSMutableArray lastObject](effectContainers, "lastObject");
      }
      double v9 = v8;
      if (([v8 isTransitionConnected] & 1) == 0)
      {
        objc_msgSend(objc_msgSend(v9, "transition"), "duration");
        -[MPLayer updateDurationPadding:](self, "updateDurationPadding:", -v10);
      }
    }
  }

- (void)reconnectAllTransitions
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  effectContainers = self->_effectContainers;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effectContainers,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (id i = 0LL; i != v4; id i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(effectContainers);
        }
        double v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effectContainers,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v4);
  }

- (void)resetStartTimes
{
  if (!self->_skipTimeCalculations)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    effectContainers = self->_effectContainers;
    id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effectContainers,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v13;
      double v6 = 0.0;
      do
      {
        for (id i = 0LL; i != v4; id i = (char *)i + 1)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(effectContainers);
          }
          __int128 v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          [v8 setStartTime:v6];
          [v8 duration];
          double v10 = v9;
          [v8 outroTransitionDuration];
          double v6 = v6 + v10 - v11;
        }

        id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( effectContainers,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v4);
    }
  }

- (void)configureActions
{
  if (-[MPLayer parentDocument](self, "parentDocument"))
  {
    if ((objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "isInBatchModify") & 1) == 0)
    {
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v8 = 0u;
      __int128 v9 = 0u;
      actions = self->_actions;
      id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v9;
        do
        {
          for (id i = 0LL; i != v5; id i = (char *)i + 1)
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(actions);
            }
            objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_actions,  "objectForKey:",  *(void *)(*((void *)&v8 + 1) + 8 * (void)i)),  "configureTarget");
          }

          id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
        }

        while (v5);
      }
    }
  }

- (int64_t)countOfEffectContainers
{
  return (int64_t)-[NSMutableArray count](self->_effectContainers, "count");
}

- (id)objectInEffectContainersAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_effectContainers, "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 inEffectContainersAtIndex:(int64_t)a4
{
}

- (void)removeObjectFromEffectContainersAtIndex:(int64_t)a3
{
}

- (void)replaceObjectInEffectContainersAtIndex:(int64_t)a3 withObject:(id)a4
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

- (void)setXPosition:(double)a3
{
}

- (double)yPosition
{
  return v2;
}

- (void)setYPosition:(double)a3
{
}

- (double)height
{
  return v2;
}

- (void)setHeight:(double)a3
{
}

- (void)setWidth:(double)a3
{
}

- (id)scriptingAnimations
{
  id v20 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = self->_animationPaths;
  id v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v29,  v34,  16LL);
  if (v21)
  {
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v2 = 0LL;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v2;
        id v3 = *(void **)(*((void *)&v29 + 1) + 8 * v2);
        id v22 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        id v4 = -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", v3);
        id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        id v7 = [v4 orderedKeyframes];
        id v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            for (id i = 0LL; i != v9; id i = (char *)i + 1)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              __int128 v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
              if (([v3 isEqualToString:@"size"] & 1) != 0
                || [v3 isEqualToString:@"position"])
              {
                [v12 point];
                v24[0] = (int)v13;
                [v12 point];
                v24[1] = (int)v14;
                __int128 v15 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v24, 4LL);
              }

              else
              {
                [v12 scalar];
                __int128 v15 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
              }

              [v6 addObject:v15];
              [v12 time];
              objc_msgSend(v5, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            }

            id v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }

          while (v9);
        }

        [v22 setObject:v5 forKey:@"times"];
        [v22 setObject:v6 forKey:@"values"];
        [v20 setObject:v22 forKey:v3];
        uint64_t v2 = v23 + 1;
      }

      while ((id)(v23 + 1) != v21);
      id v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v29,  v34,  16LL);
    }

    while (v21);
  }

  return v20;
}

- (void)setScriptingAnimations:(id)a3
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v21 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v24;
    do
    {
      for (id i = 0LL; i != v21; id i = (char *)i + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(a3);
        }
        id v5 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v6 = objc_msgSend(a3, "objectForKey:", v5, v19);
        id v7 = [v6 objectForKey:@"times"];
        id v8 = [v6 objectForKey:@"values"];
        id v9 = +[MPAnimationPathKeyframed animationPath](&OBJC_CLASS___MPAnimationPathKeyframed, "animationPath");
        uint64_t v10 = (char *)[v7 count];
        if ((uint64_t)v10 >= 1)
        {
          __int128 v11 = v10;
          for (j = 0LL; j != v11; ++j)
          {
            if (([v5 isEqualToString:@"size"] & 1) != 0
              || [v5 isEqualToString:@"position"])
            {
              objc_msgSend(objc_msgSend(v8, "objectAtIndex:", j), "getBytes:length:", v22, 4);
              double v13 = (double)v22[0];
              double v14 = (double)v22[1];
              objc_msgSend(objc_msgSend(v7, "objectAtIndex:", j), "doubleValue");
              objc_msgSend(v9, "createKeyframeWithPoint:atTime:", v13, v14, v15);
            }

            else
            {
              objc_msgSend(objc_msgSend(v8, "objectAtIndex:", j), "doubleValue");
              double v17 = v16;
              objc_msgSend(objc_msgSend(v7, "objectAtIndex:", j), "doubleValue");
              [v9 createKeyframeWithScalar:v17 atTime:v18];
            }
          }
        }

        -[MPLayer setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v9, v5);
      }

      id v21 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v21);
  }

@end