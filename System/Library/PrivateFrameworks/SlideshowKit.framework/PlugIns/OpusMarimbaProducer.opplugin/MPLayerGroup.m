@interface MPLayerGroup
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)autoAdjustDuration;
- (BOOL)detectFacesInBackground;
- (BOOL)isTriggered;
- (BOOL)layersCanPositionZIndex;
- (BOOL)nearingEndWithOptions:(id)a3;
- (BOOL)startsPaused;
- (CGColor)backgroundCGColor;
- (CGPoint)position;
- (CGSize)size;
- (MPLayerGroup)init;
- (NSArray)audioPaths;
- (NSArray)videoPaths;
- (NSDictionary)initialState;
- (NSString)uuid;
- (double)aspectRatioDidChange:(double)a3 atTime:(double)a4;
- (double)duration;
- (double)durationPadding;
- (double)numberOfLoops;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)posterTime;
- (double)rotationAngle;
- (double)scale;
- (double)timeIn;
- (double)videoDuration;
- (double)xRotationAngle;
- (double)yRotationAngle;
- (double)zPosition;
- (id)absoluteVideoPaths;
- (id)actionForKey:(id)a3;
- (id)actionableObjectForID:(id)a3;
- (id)actions;
- (id)allEffectContainers;
- (id)allEffects;
- (id)allSlides:(BOOL)a3;
- (id)allSongs;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)audioPlaylist;
- (id)authoredVersionInfo;
- (id)authoringOptionForKey:(id)a3;
- (id)authoringOptions;
- (id)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyedLayers;
- (id)layerForKey:(id)a3;
- (id)layerKey;
- (id)layerKeyDictionary;
- (id)layers;
- (id)liveLock;
- (id)mainLayers;
- (id)navigatorKey;
- (id)objectID;
- (id)objectInLayersAtIndex:(int64_t)a3;
- (id)observer;
- (id)orderedVideoPaths;
- (id)parent;
- (id)parentDocument;
- (id)plug;
- (id)plugID;
- (id)styleID;
- (id)valueInLayersWithName:(id)a3;
- (int64_t)countOfLayers;
- (int64_t)lastSlideUsed;
- (int64_t)zIndex;
- (unint64_t)loopingMode;
- (unint64_t)setStyleID:(id)a3;
- (void)addAudioPath:(id)a3;
- (void)addAudioPaths:(id)a3;
- (void)addLayer:(id)a3;
- (void)addLayers:(id)a3;
- (void)addVideoPath:(id)a3;
- (void)addVideoPaths:(id)a3;
- (void)cleanup;
- (void)configureActions;
- (void)copyActions:(id)a3;
- (void)copyAnimationPaths:(id)a3;
- (void)copyAudioPlaylist:(id)a3;
- (void)copyLayerDictionary:(id)a3;
- (void)copyLayers:(id)a3;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)insertLayers:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inLayersAtIndex:(int64_t)a4;
- (void)moveLayersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)reconfigureLoopingMode;
- (void)reconnectAll;
- (void)removeActionForKey:(id)a3;
- (void)removeAllAudioPaths;
- (void)removeAllLayers;
- (void)removeAllVideoPaths;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeLayerForKey:(id)a3;
- (void)removeLayersAtIndices:(id)a3;
- (void)removeObjectFromLayersAtIndex:(int64_t)a3;
- (void)removePath:(id)a3;
- (void)removePaths:(id)a3;
- (void)replaceObjectInLayersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)resetDuration;
- (void)setAction:(id)a3 forKey:(id)a4;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setAudioPaths:(id)a3;
- (void)setAudioPlaylist:(id)a3;
- (void)setAuthoredVersionInfo:(id)a3;
- (void)setAuthoringOption:(id)a3 forKey:(id)a4;
- (void)setAuthoringOptions:(id)a3;
- (void)setAutoAdjustDuration:(BOOL)a3;
- (void)setBackgroundCGColor:(CGColor *)a3;
- (void)setBackgroundColorString:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDuration:(double)a3;
- (void)setDurationPadding:(double)a3;
- (void)setInitialState:(id)a3;
- (void)setIsDocumentLayerGroup:(BOOL)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setLastSlideUsed:(int64_t)a3;
- (void)setLayer:(id)a3 forKey:(id)a4;
- (void)setLoopingMode:(unint64_t)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setParent:(id)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPlug:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setStartsPaused:(BOOL)a3;
- (void)setTimeIn:(double)a3;
- (void)setUsedAllPaths:(BOOL)a3;
- (void)setVideoPaths:(id)a3;
- (void)setXRotationAngle:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZIndex:(int64_t)a3;
- (void)setZPosition:(double)a3;
@end

@implementation MPLayerGroup

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if (([a3 isEqualToString:@"layers"] & 1) != 0
    || ([a3 isEqualToString:@"numberOfLoops"] & 1) != 0
    || ([a3 isEqualToString:@"audioPlaylist"] & 1) != 0)
  {
    return 0;
  }

  else
  {
    return [a3 isEqualToString:@"backgroundColor"] ^ 1;
  }

- (MPLayerGroup)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPLayerGroup;
  v2 = -[MPLayerGroup init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MPLayerGroupInternal);
    v2->_userProvidedVideoPaths = 0LL;
    v2->_userProvidedAudioPaths = 0LL;
    v2->_internal = v3;
    v2->_layers = 0LL;
    v2->_layerDictionary = 0LL;
    v2->_animationPaths = 0LL;
    v2->_actions = 0LL;
    v2->_authoringOptions = 0LL;
    -[MPLayerGroupInternal setUuid:]( v2->_internal,  "setUuid:",  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"));
    -[MPLayerGroupInternal setLayerKeyDictionary:](v2->_internal, "setLayerKeyDictionary:", 0LL);
    -[MPLayerGroupInternal setNumberOfLoops:](v2->_internal, "setNumberOfLoops:", 1.0);
    -[MPLayerGroupInternal setLoopingMode:](v2->_internal, "setLoopingMode:", 0LL);
    -[MPLayerGroupInternal setDurationPadding:](v2->_internal, "setDurationPadding:", 0.0);
    -[MPLayerGroupInternal setDuration:](v2->_internal, "setDuration:", 0.0);
    -[MPLayerGroupInternal setTimeIn:](v2->_internal, "setTimeIn:", 0.0);
    -[MPLayerGroupInternal setStartsPaused:](v2->_internal, "setStartsPaused:", 0LL);
    -[MPLayerGroupInternal setIsTriggered:](v2->_internal, "setIsTriggered:", 0LL);
    -[MPLayerGroupInternal setPhaseInDuration:](v2->_internal, "setPhaseInDuration:", 0.0);
    -[MPLayerGroupInternal setPhaseOutDuration:](v2->_internal, "setPhaseOutDuration:", 0.0);
    -[MPLayerGroupInternal setSendLiveNotification:](v2->_internal, "setSendLiveNotification:", 0LL);
    -[MPLayerGroupInternal setLiveLock:]( v2->_internal,  "setLiveLock:",  objc_alloc_init(&OBJC_CLASS___NSRecursiveLock));
    -[NSRecursiveLock setName:]( -[MPLayerGroupInternal liveLock](v2->_internal, "liveLock"),  "setName:",  @"MPLayerGroupInternal.liveLock");
    -[MPLayerGroupInternal setAutoAdjustDuration:](v2->_internal, "setAutoAdjustDuration:", 1LL);
    -[MPLayerGroupInternal setIsDocumentLayerGroup:](v2->_internal, "setIsDocumentLayerGroup:", 0LL);
    -[MPLayerGroupInternal setOpacity:](v2->_internal, "setOpacity:", 1.0);
    -[MPLayerGroupInternal setPosition:](v2->_internal, "setPosition:", CGPointZero.x, CGPointZero.y);
    -[MPLayerGroupInternal setZPosition:](v2->_internal, "setZPosition:", 0.0);
    -[MPLayerGroupInternal setSize:](v2->_internal, "setSize:", 2.0, 2.0);
    -[MPLayerGroupInternal setXRotationAngle:](v2->_internal, "setXRotationAngle:", 0.0);
    -[MPLayerGroupInternal setYRotationAngle:](v2->_internal, "setYRotationAngle:", 0.0);
    -[MPLayerGroupInternal setScale:](v2->_internal, "setScale:", 1.0);
    -[MPLayerGroupInternal setZIndex:](v2->_internal, "setZIndex:", 0LL);
    v2->_audioPlaylist = 0LL;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copyStruct:self->_internal];
  [v4 copyLayers:self->_layers];
  [v4 copyLayerDictionary:self->_layerDictionary];
  [v4 copyAudioPlaylist:self->_audioPlaylist];
  [v4 copyAnimationPaths:self->_animationPaths];
  [v4 copyActions:self->_actions];
  [v4 setVideoPaths:self->_userProvidedVideoPaths];
  [v4 setAudioPaths:self->_userProvidedAudioPaths];
  [v4 setAuthoringOptions:self->_authoringOptions];
  return v4;
}

- (void)dealloc
{
  v3 = -[MPLayerGroupInternal liveLock](self->_internal, "liveLock");
  -[NSRecursiveLock lock](v3, "lock");
  -[MPLayerGroup cleanup](self, "cleanup");

  self->_internal = 0LL;
  self->_parallelizer = 0LL;

  self->_plug = 0LL;
  self->_layers = 0LL;

  self->_layerDictionary = 0LL;
  self->_animationPaths = 0LL;

  self->_actions = 0LL;
  self->_audioPlaylist = 0LL;

  self->_authoringOptions = 0LL;
  self->_userProvidedVideoPaths = 0LL;

  self->_userProvidedAudioPaths = 0LL;
  -[NSRecursiveLock unlock](v3, "unlock");

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPLayerGroup;
  -[MPLayerGroup dealloc](&v4, "dealloc");
}

- (id)navigatorKey
{
  id parent = self->_parent;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPDocument, a2);
  if ((objc_opt_isKindOfClass(parent, v4) & 1) != 0) {
    return 0LL;
  }
  else {
    return objc_msgSend( objc_msgSend(self->_parent, "layerKeyDictionary"),  "objectForKey:",  -[MPLayerGroup uuid](self, "uuid"));
  }
}

- (id)styleID
{
  return -[NSMutableDictionary objectForKey:](self->_authoringOptions, "objectForKey:", kMPAuthoringStyleID);
}

- (unint64_t)setStyleID:(id)a3
{
  id v5 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "antialiasLevelForStyleID:",  -[MPLayerGroup styleID](self, "styleID"));
  -[NSRecursiveLock lock](-[MPLayerGroupInternal liveLock](self->_internal, "liveLock"), "lock");
  authoringOptions = self->_authoringOptions;
  if (!authoringOptions)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->_authoringOptions = v7;
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", @"Classic", kMPAuthoringStyleID);
    v8 = self->_authoringOptions;
    v9 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL);
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, kMPAuthoringAudioScalingMode);
    authoringOptions = self->_authoringOptions;
  }

  -[NSMutableDictionary setObject:forKey:](authoringOptions, "setObject:forKey:", a3, kMPAuthoringStyleID);
  id v10 = -[NSMutableDictionary objectForKey:](self->_authoringOptions, "objectForKey:", @"wasLive");
  if (objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "needsToBeLiveForStyleID:",  a3))
  {
    if (objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_authoringOptions,  "objectForKey:",  kMPAuthoringLive),  "BOOLValue")) {
      goto LABEL_10;
    }
    v11 = self->_authoringOptions;
    v12 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, kMPAuthoringLive);
    v13 = self->_authoringOptions;
    v14 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
    v15 = @"wasLive";
    goto LABEL_9;
  }

  if (v10 && ([v10 BOOLValue] & 1) == 0)
  {
    v13 = self->_authoringOptions;
    v14 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
    v15 = kMPAuthoringLive;
LABEL_9:
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, v15);
    -[MPLayerGroupInternal setSendLiveNotification:](self->_internal, "setSendLiveNotification:", 1LL);
  }

- (id)authoringOptions
{
  return self->_authoringOptions;
}

- (void)setAuthoringOption:(id)a3 forKey:(id)a4
{
  authoringOptions = self->_authoringOptions;
  objc_sync_enter(authoringOptions);
  if (!self->_authoringOptions)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->_authoringOptions = v8;
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", @"Classic", kMPAuthoringStyleID);
    v9 = self->_authoringOptions;
    id v10 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL);
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, kMPAuthoringAudioScalingMode);
  }

  if (!a3)
  {
    v12 = self->_authoringOptions;
    goto LABEL_7;
  }

  v11 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v12 = self->_authoringOptions;
  if (v11 == a3)
  {
LABEL_7:
    -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", a4);
    goto LABEL_8;
  }

  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", a3, a4);
LABEL_8:
  objc_sync_exit(authoringOptions);
}

- (id)authoringOptionForKey:(id)a3
{
  authoringOptions = self->_authoringOptions;
  objc_sync_enter(authoringOptions);
  id v6 = -[NSMutableDictionary objectForKey:](self->_authoringOptions, "objectForKey:", a3);
  objc_sync_exit(authoringOptions);
  return v6;
}

- (void)setAuthoringOptions:(id)a3
{
  authoringOptions = self->_authoringOptions;
  objc_sync_enter(authoringOptions);
  if (!self->_authoringOptions)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->_authoringOptions = v6;
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", @"Classic", kMPAuthoringStyleID);
    v7 = self->_authoringOptions;
    v8 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL);
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, kMPAuthoringAudioScalingMode);
  }

  if ([a3 objectForKey:kMPAuthoringLive])
  {
    if (objc_msgSend(-[MPLayerGroup layers](self, "layers"), "count"))
    {
      v9 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter postNotificationName:object:userInfo:]( v9,  "postNotificationName:object:userInfo:",  kMPAuthoringLiveDidChangeNotification,  -[MPLayerGroup parentDocument](self, "parentDocument"),  0LL);
      uint64_t v10 = 0LL;
    }

    else
    {
      uint64_t v10 = 1LL;
    }

    -[MPLayerGroupInternal setSendLiveNotification:](self->_internal, "setSendLiveNotification:", v10);
  }

  -[NSMutableDictionary removeAllObjects](self->_authoringOptions, "removeAllObjects");
  -[NSMutableDictionary addEntriesFromDictionary:](self->_authoringOptions, "addEntriesFromDictionary:", a3);
  objc_sync_exit(authoringOptions);
}

- (id)layers
{
  return self->_layers;
}

- (void)addLayer:(id)a3
{
}

- (void)addLayers:(id)a3
{
}

- (void)insertLayers:(id)a3 atIndex:(int64_t)a4
{
  context = objc_autoreleasePoolPush();
  if (!self->_layers) {
    self->_layers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  v7 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [a3 count]);
  objc_msgSend( -[MPLayerGroup observer](self, "observer"),  "willChange:valuesAtIndexes:forKey:",  2,  v7,  @"layers");
  unsigned int v19 = v7;
  -[NSMutableArray insertObjects:atIndexes:](self->_layers, "insertObjects:atIndexes:", a3, v7);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(a3);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        [v12 setParent:self];
        +[MPUtilities createPlugInContainer:forLayer:key:inDocument:]( &OBJC_CLASS___MPUtilities,  "createPlugInContainer:forLayer:key:inDocument:",  self->_parallelizer,  v12,  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"),  -[MPLayerGroup parentDocument](self, "parentDocument"));
      }

      id v9 = [a3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v9);
  }

  if (self->_parallelizer)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    layers = self->_layers;
    id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    if (v14)
    {
      id v15 = v14;
      __int16 v16 = 0;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (j = 0LL; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(layers);
          }
          objc_msgSend( objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)j), "plug"),  "setZIndex:",  (__int16)(v16 + (_WORD)j));
        }

        id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
        v16 += (__int16)j;
      }

      while (v15);
    }
  }

  if (-[MPLayerGroup parentDocument](self, "parentDocument")) {
    -[MPLayerGroup reconfigureLoopingMode](self, "reconfigureLoopingMode");
  }
  objc_msgSend( -[MPLayerGroup observer](self, "observer"),  "didChange:valuesAtIndexes:forKey:",  2,  v19,  @"layers");

  objc_autoreleasePoolPop(context);
}

- (void)removeAllLayers
{
  v3 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  -[NSMutableArray count](self->_layers, "count"));
  -[MPLayerGroup removeLayersAtIndices:](self, "removeLayersAtIndices:", v3);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = -[NSMutableDictionary allKeys](self->_layerDictionary, "allKeys", 0LL);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(v4);
        }
        -[MPLayerGroup removeLayerForKey:]( self,  "removeLayerForKey:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

  objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "unlock");
}

- (void)removeLayersAtIndices:(id)a3
{
  context = objc_autoreleasePoolPush();
  objc_msgSend( -[MPLayerGroup observer](self, "observer"),  "willChange:valuesAtIndexes:forKey:",  3,  a3,  @"layers");
  id v5 = [a3 lastIndex];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (id i = v5; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
    {
      id v7 = -[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:", i);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPLayerSerializer, v8);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
        [v7 reconnectAllTransitions];
      }
      if (self->_parallelizer)
      {
        objc_opt_respondsToSelector(v7, "plug");
        -[MCContainerParallelizer removePlug:](self->_parallelizer, "removePlug:", [v7 plug]);
        [v7 setPlug:0];
      }

      [v7 setParent:0];
      if ((objc_opt_respondsToSelector(v7, "setMontage:") & 1) != 0) {
        [v7 setMontage:0];
      }
      if ((objc_opt_respondsToSelector(v7, "setLayerSerializer:") & 1) != 0)
      {
        [v7 setLayerSerializer:0];
      }

      else if ((objc_opt_respondsToSelector(v7, "setLayerEffect:") & 1) != 0)
      {
        [v7 setLayerEffect:0];
      }

      else if ((objc_opt_respondsToSelector(v7, "setContainer:") & 1) != 0)
      {
        [v7 setContainer:0];
      }

      else
      {
        NSLog(@"what kind of container is that?!?!?");
      }
    }
  }

  -[NSMutableArray removeObjectsAtIndexes:](self->_layers, "removeObjectsAtIndexes:", a3);
  if (self->_parallelizer)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    layers = self->_layers;
    id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v11)
    {
      id v12 = v11;
      __int16 v13 = 0;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (j = 0LL; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(layers);
          }
          __int16 v16 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)j);
          objc_opt_respondsToSelector(v16, "plug");
          objc_msgSend(objc_msgSend(v16, "plug"), "setZIndex:", (__int16)(v13 + (_WORD)j));
        }

        id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
        v13 += (__int16)j;
      }

      while (v12);
    }
  }

  -[MPLayerGroup resetDuration](self, "resetDuration");
  objc_msgSend( -[MPLayerGroup observer](self, "observer"),  "didChange:valuesAtIndexes:forKey:",  3,  a3,  @"layers");
  objc_autoreleasePoolPop(context);
  objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "unlock");
}

- (void)moveLayersFromIndices:(id)a3 toIndex:(int64_t)a4
{
  parallelizer = self->_parallelizer;
  if (parallelizer)
  {
    uint64_t v8 = +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  -[MCContainerParallelizer zOrderedPlugs](parallelizer, "zOrderedPlugs"));
    id v9 = -[NSMutableArray objectsAtIndexes:](v8, "objectsAtIndexes:", a3);
    -[NSMutableArray removeObjectsAtIndexes:](v8, "removeObjectsAtIndexes:", a3);
    -[NSMutableArray insertObjects:atIndexes:]( v8,  "insertObjects:atIndexes:",  v9,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [v9 count]));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v10)
    {
      id v11 = v10;
      __int16 v12 = 0;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (id i = 0LL; i != v11; id i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)i) setZIndex:(__int16)(v12 + (_WORD)i)];
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        v12 += (__int16)i;
      }

      while (v11);
    }
  }

  id v15 = -[NSMutableArray objectsAtIndexes:](self->_layers, "objectsAtIndexes:", a3);
  -[NSMutableArray removeObjectsAtIndexes:](self->_layers, "removeObjectsAtIndexes:", a3);
  -[NSMutableArray insertObjects:atIndexes:]( self->_layers,  "insertObjects:atIndexes:",  v15,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [v15 count]));
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "didChangeValueForKey:", @"layers");
}

- (double)videoDuration
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  layers = self->_layers;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    double v6 = 0.0;
    while (1)
    {
      for (id i = 0LL; i != v4; id i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(layers);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v8 conformsToProtocol:&OBJC_PROTOCOL___MPNavigatorSupportInternal])
        {
          [v8 duration];
        }

        else
        {
          [v8 timeIn];
          double v11 = v10;
          [v8 duration];
          double v9 = v11 + v12;
        }

        if (v9 >= v6) {
          double v6 = v9;
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (!v4) {
        return v6;
      }
    }
  }

  return 0.0;
}

- (double)duration
{
  if (-[MPLayerGroupInternal autoAdjustDuration](self->_internal, "autoAdjustDuration"))
  {
    audioPlaylist = self->_audioPlaylist;
    if (audioPlaylist)
    {
      -[MPAudioPlaylist duration](audioPlaylist, "duration");
      double v5 = v4;
    }

    else
    {
      double v5 = 0.0;
    }

    -[MPLayerGroup videoDuration](self, "videoDuration");
    if (result < v5) {
      return v5;
    }
  }

  else
  {
    -[MPLayerGroupInternal duration](self->_internal, "duration");
  }

  return result;
}

- (void)setDuration:(double)a3
{
  if (a3 >= 0.0 || v5 != a3)
  {
    -[MPLayerGroupInternal setDuration:](self->_internal, "setDuration:", a3);
    if (self->_plug)
    {
      -[MPLayerGroupInternal phaseInDuration](self->_internal, "phaseInDuration");
      double v8 = a3 - v7;
      -[MPLayerGroupInternal phaseOutDuration](self->_internal, "phaseOutDuration");
      double v10 = v8 - v9;
      if (v10 < 0.0) {
        double v10 = 0.0;
      }
      -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v10);
    }
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

- (BOOL)isTriggered
{
  return -[MPLayerGroupInternal isTriggered](self->_internal, "isTriggered");
}

- (void)setIsTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPLayerGroupInternal setIsTriggered:](self->_internal, "setIsTriggered:");
  plug = self->_plug;
  if (plug) {
    -[MCPlugParallel setIsTriggered:](plug, "setIsTriggered:", v3);
  }
}

- (BOOL)startsPaused
{
  return -[MPLayerGroupInternal startsPaused](self->_internal, "startsPaused");
}

- (void)setStartsPaused:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPLayerGroupInternal setStartsPaused:](self->_internal, "setStartsPaused:");
  plug = self->_plug;
  if (plug) {
    -[MCPlug setStartsPaused:](plug, "setStartsPaused:", v3);
  }
}

- (id)parent
{
  return self->_parent;
}

- (id)audioPlaylist
{
  return self->_audioPlaylist;
}

- (void)setAudioPlaylist:(id)a3
{
  id v5 = -[MPLayerGroup parentDocument](self, "parentDocument");
  if (self->_audioPlaylist)
  {
    if (-[MPLayerGroupInternal backgroundAudioID](self->_internal, "backgroundAudioID")) {
      -[MCContainerParallelizer removePlugForID:]( self->_parallelizer,  "removePlugForID:",  -[MPLayerGroupInternal backgroundAudioID](self->_internal, "backgroundAudioID"));
    }
    if (v5 && [v5 documentLayerGroup] == self)
    {
      -[MPAudioPlaylist fadeOutDuration](self->_audioPlaylist, "fadeOutDuration");
      objc_msgSend(v5, "setAudioFadeOutDuration:");
    }

    -[MPAudioPlaylist setPlug:](self->_audioPlaylist, "setPlug:", 0LL);
    -[MPAudioPlaylist setParentObject:](self->_audioPlaylist, "setParentObject:", 0LL);
    -[MPAudioPlaylist setMontage:](self->_audioPlaylist, "setMontage:", 0LL);
    -[MPAudioPlaylist setAudioPlaylist:](self->_audioPlaylist, "setAudioPlaylist:", 0LL);

    self->_audioPlaylist = 0LL;
  }

  if (a3)
  {
    double v6 = (MPAudioPlaylist *)a3;
    self->_audioPlaylist = v6;
    -[MPAudioPlaylist setParentObject:](v6, "setParentObject:", self);
    if (self->_parallelizer)
    {
      if (v5 && [v5 documentLayerGroup] == self)
      {
        if (!-[MPLayerGroupInternal backgroundAudioID](self->_internal, "backgroundAudioID")) {
          -[MPLayerGroupInternal setBackgroundAudioID:]( self->_internal,  "setBackgroundAudioID:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ba%@",  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID")));
        }
        id v7 = objc_msgSend(objc_msgSend(v5, "montage"), "createParallelizerContainer");
        id v8 = -[MCContainerParallelizer setPlugForContainer:forID:]( self->_parallelizer,  "setPlugForContainer:forID:",  v7,  -[MPLayerGroupInternal backgroundAudioID](self->_internal, "backgroundAudioID"));
        [v8 setLoopDuration:0.0];
        [v8 setZIndex:100];
        -[MPAudioPlaylist setMontage:](self->_audioPlaylist, "setMontage:", [v5 montage]);
        -[MPAudioPlaylist setAudioPlaylist:]( self->_audioPlaylist,  "setAudioPlaylist:",  [v7 audioPlaylistCreateIfNeeded]);
        -[MPAudioPlaylist setPlug:](self->_audioPlaylist, "setPlug:", v8);
        -[MPAudioPlaylist fadeOutDuration](self->_audioPlaylist, "fadeOutDuration");
        objc_msgSend(v5, "setAudioFadeOutDuration:");
      }

      else
      {
        -[MPAudioPlaylist setMontage:](self->_audioPlaylist, "setMontage:", [v5 montage]);
        -[MPAudioPlaylist setAudioPlaylist:]( self->_audioPlaylist,  "setAudioPlaylist:",  -[MCContainer audioPlaylistCreateIfNeeded](self->_parallelizer, "audioPlaylistCreateIfNeeded"));
        -[MPAudioPlaylist setPlug:](self->_audioPlaylist, "setPlug:", self->_plug);
      }
    }
  }

  -[MPLayerGroup reconfigureLoopingMode](self, "reconfigureLoopingMode");
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "didChangeValueForKey:", @"audioPlaylist");
}

- (unint64_t)loopingMode
{
  return -[MPLayerGroupInternal loopingMode](self->_internal, "loopingMode");
}

- (void)setLoopingMode:(unint64_t)a3
{
}

- (CGColor)backgroundCGColor
{
  return -[MPLayerGroupInternal backgroundColor](self->_internal, "backgroundColor");
}

- (void)setBackgroundColorString:(id)a3
{
}

- (void)setBackgroundCGColor:(CGColor *)a3
{
  double v4 = self;
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChangeValueForKey:", @"backgroundColor");
  if (CGColorGetNumberOfComponents(a3) == 2)
  {
    id v5 = +[MPUtilities newColorSpaceForDevice](&OBJC_CLASS___MPUtilities, "newColorSpaceForDevice");
    double v6 = CGColorGetComponents(a3);
    components[0] = *v6;
    components[1] = *v6;
    components[2] = *v6;
    components[3] = v6[1];
    id v7 = CGColorCreate(v5, components);
    parallelizer = v4->_parallelizer;
    if (parallelizer) {
      -[MCContainerParallelizer setBackgroundColor:](parallelizer, "setBackgroundColor:", v7);
    }
    -[MPLayerGroupInternal setBackgroundColor:](v4->_internal, "setBackgroundColor:", a3);
    CGColorSpaceRelease(v5);
    CGColorRelease(v7);
  }

  else
  {
    -[MPLayerGroupInternal setBackgroundColor:](v4->_internal, "setBackgroundColor:", a3);
    double v9 = v4->_parallelizer;
    if (v9) {
      -[MCContainerParallelizer setBackgroundColor:](v9, "setBackgroundColor:", a3);
    }
  }

  objc_msgSend(-[MPLayerGroup observer](v4, "observer"), "didChangeValueForKey:", @"backgroundColor");
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "backgroundColorLayersForStyleID:",  -[MPLayerGroup styleID](v4, "styleID"));
  id v25 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v47;
    __int128 v24 = v4;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v10;
        uint64_t v29 = *(void *)(*((void *)&v46 + 1) + 8 * v10);
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        id v27 = -[MPLayerGroup layers](v4, "layers");
        id v30 = [v27 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v30)
        {
          uint64_t v28 = *(void *)v43;
          do
          {
            uint64_t v11 = 0LL;
            do
            {
              if (*(void *)v43 != v28) {
                objc_enumerationMutation(v27);
              }
              uint64_t v31 = v11;
              double v12 = *(void **)(*((void *)&v42 + 1) + 8 * v11);
              if (objc_msgSend(objc_msgSend(v12, "layerID"), "isEqualToString:", v29))
              {
                __int128 v40 = 0u;
                __int128 v41 = 0u;
                __int128 v38 = 0u;
                __int128 v39 = 0u;
                id v32 = [v12 effectContainers];
                id v13 = [v32 countByEnumeratingWithState:&v38 objects:v51 count:16];
                if (v13)
                {
                  id v14 = v13;
                  uint64_t v33 = *(void *)v39;
                  do
                  {
                    __int128 v15 = 0LL;
                    do
                    {
                      if (*(void *)v39 != v33) {
                        objc_enumerationMutation(v32);
                      }
                      __int128 v16 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v15);
                      __int128 v34 = 0u;
                      __int128 v35 = 0u;
                      __int128 v36 = 0u;
                      __int128 v37 = 0u;
                      id v17 = [v16 effects];
                      id v18 = [v17 countByEnumeratingWithState:&v34 objects:v50 count:16];
                      if (v18)
                      {
                        id v19 = v18;
                        uint64_t v20 = *(void *)v35;
                        do
                        {
                          __int128 v21 = 0LL;
                          do
                          {
                            if (*(void *)v35 != v20) {
                              objc_enumerationMutation(v17);
                            }
                            objc_msgSend( *(id *)(*((void *)&v34 + 1) + 8 * (void)v21),  "setEffectAttribute:forKey:",  +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", a3),  @"backgroundColorAsString");
                            __int128 v21 = (char *)v21 + 1;
                          }

                          while (v19 != v21);
                          id v19 = [v17 countByEnumeratingWithState:&v34 objects:v50 count:16];
                        }

                        while (v19);
                      }

                      __int128 v15 = (char *)v15 + 1;
                    }

                    while (v15 != v14);
                    id v14 = [v32 countByEnumeratingWithState:&v38 objects:v51 count:16];
                  }

                  while (v14);
                }
              }

              uint64_t v11 = v31 + 1;
            }

            while ((id)(v31 + 1) != v30);
            id v30 = [v27 countByEnumeratingWithState:&v42 objects:v52 count:16];
          }

          while (v30);
        }

        uint64_t v10 = v26 + 1;
        double v4 = v24;
      }

      while ((id)(v26 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }

    while (v25);
  }

- (NSString)uuid
{
  return -[MPLayerGroupInternal uuid](self->_internal, "uuid");
}

- (NSDictionary)initialState
{
  return -[MPLayerGroupInternal initialState](self->_internal, "initialState");
}

- (void)setInitialState:(id)a3
{
  parallelizer = self->_parallelizer;
  if (parallelizer) {
    -[MCContainer setInitialState:](parallelizer, "setInitialState:", a3);
  }
  -[MPLayerGroupInternal setInitialState:](self->_internal, "setInitialState:", a3);
}

- (void)addVideoPath:(id)a3
{
  userProvidedVideoPaths = self->_userProvidedVideoPaths;
  if (!userProvidedVideoPaths)
  {
    userProvidedVideoPaths = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_userProvidedVideoPaths = userProvidedVideoPaths;
  }

  -[NSMutableArray addObject:](userProvidedVideoPaths, "addObject:", a3);
}

- (void)addVideoPaths:(id)a3
{
  userProvidedVideoPaths = self->_userProvidedVideoPaths;
  if (!userProvidedVideoPaths)
  {
    userProvidedVideoPaths = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_userProvidedVideoPaths = userProvidedVideoPaths;
  }

  -[NSMutableArray addObjectsFromArray:](userProvidedVideoPaths, "addObjectsFromArray:", a3);
}

- (void)addAudioPath:(id)a3
{
  userProvidedAudioPaths = self->_userProvidedAudioPaths;
  if (!userProvidedAudioPaths)
  {
    userProvidedAudioPaths = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_userProvidedAudioPaths = userProvidedAudioPaths;
  }

  -[NSMutableArray addObject:](userProvidedAudioPaths, "addObject:", a3);
}

- (void)addAudioPaths:(id)a3
{
  userProvidedAudioPaths = self->_userProvidedAudioPaths;
  if (!userProvidedAudioPaths)
  {
    userProvidedAudioPaths = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_userProvidedAudioPaths = userProvidedAudioPaths;
  }

  -[NSMutableArray addObjectsFromArray:](userProvidedAudioPaths, "addObjectsFromArray:", a3);
}

- (void)removePath:(id)a3
{
  p_userProvidedVideoPaths = &self->_userProvidedVideoPaths;
  if ((-[NSMutableArray containsObject:](self->_userProvidedVideoPaths, "containsObject:") & 1) == 0)
  {
    userProvidedAudioPaths = self->_userProvidedAudioPaths;
    p_userProvidedAudioPaths = &self->_userProvidedAudioPaths;
    p_userProvidedVideoPaths = p_userProvidedAudioPaths;
  }

  -[NSMutableArray removeObjectAtIndex:]( *p_userProvidedVideoPaths,  "removeObjectAtIndex:",  -[NSMutableArray indexOfObject:](*p_userProvidedVideoPaths, "indexOfObject:", a3));
}

- (void)removePaths:(id)a3
{
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
        -[MPLayerGroup removePath:](self, "removePath:", *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

- (NSArray)videoPaths
{
  return &self->_userProvidedVideoPaths->super;
}

- (id)orderedVideoPaths
{
  id v2 = -[MPLayerGroup mainLayers](self, "mainLayers");
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v2;
  id v23 = [v2 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v42;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v4;
        id v5 = *(void **)(*((void *)&v41 + 1) + 8 * v4);
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        id v25 = [v5 effectContainers];
        id v27 = [v25 countByEnumeratingWithState:&v37 objects:v47 count:16];
        if (v27)
        {
          uint64_t v26 = *(void *)v38;
          do
          {
            uint64_t v6 = 0LL;
            do
            {
              if (*(void *)v38 != v26) {
                objc_enumerationMutation(v25);
              }
              uint64_t v28 = v6;
              uint64_t v7 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
              __int128 v33 = 0u;
              __int128 v34 = 0u;
              __int128 v35 = 0u;
              __int128 v36 = 0u;
              id v8 = [v7 effects];
              id v9 = [v8 countByEnumeratingWithState:&v33 objects:v46 count:16];
              if (v9)
              {
                id v10 = v9;
                uint64_t v11 = *(void *)v34;
                do
                {
                  for (id i = 0LL; i != v10; id i = (char *)i + 1)
                  {
                    if (*(void *)v34 != v11) {
                      objc_enumerationMutation(v8);
                    }
                    id v13 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
                    __int128 v29 = 0u;
                    __int128 v30 = 0u;
                    __int128 v31 = 0u;
                    __int128 v32 = 0u;
                    id v14 = [v13 slides];
                    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v45 count:16];
                    if (v15)
                    {
                      id v16 = v15;
                      uint64_t v17 = *(void *)v30;
                      do
                      {
                        for (j = 0LL; j != v16; j = (char *)j + 1)
                        {
                          if (*(void *)v30 != v17) {
                            objc_enumerationMutation(v14);
                          }
                          id v19 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)j);
                          if ([v19 path]) {
                            objc_msgSend(v3, "addObject:", objc_msgSend(v19, "path"));
                          }
                        }

                        id v16 = [v14 countByEnumeratingWithState:&v29 objects:v45 count:16];
                      }

                      while (v16);
                    }
                  }

                  id v10 = [v8 countByEnumeratingWithState:&v33 objects:v46 count:16];
                }

                while (v10);
              }

              uint64_t v6 = v28 + 1;
            }

            while ((id)(v28 + 1) != v27);
            id v27 = [v25 countByEnumeratingWithState:&v37 objects:v47 count:16];
          }

          while (v27);
        }

        uint64_t v4 = v24 + 1;
      }

      while ((id)(v24 + 1) != v23);
      id v23 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }

    while (v23);
  }

  return v3;
}

- (void)setVideoPaths:(id)a3
{
  userProvidedVideoPaths = self->_userProvidedVideoPaths;
  if (userProvidedVideoPaths) {

  }
  self->_userProvidedVideoPaths = (NSMutableArray *)[a3 mutableCopy];
}

- (NSArray)audioPaths
{
  return &self->_userProvidedAudioPaths->super;
}

- (void)setAudioPaths:(id)a3
{
  userProvidedAudioPaths = self->_userProvidedAudioPaths;
  if (userProvidedAudioPaths) {

  }
  self->_userProvidedAudioPaths = (NSMutableArray *)[a3 mutableCopy];
}

- (void)removeAllVideoPaths
{
}

- (void)removeAllAudioPaths
{
}

- (id)mainLayers
{
  id v3 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfMainLayerForStyleID:",  -[MPLayerGroup styleID](self, "styleID"));
  int64_t v4 = -[MPLayerGroup countOfLayers](self, "countOfLayers");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = -[MPLayerGroup layers](self, "layers", 0LL);
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (id i = 0LL; i != v7; id i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v4 -= [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) isAudioLayer];
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  else {
    int64_t v10 = (int64_t)v3;
  }
  if (v10 < 0) {
    id v11 = 0LL;
  }
  else {
    id v11 = -[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:");
  }
  -[NSRecursiveLock unlock](-[MPLayerGroupInternal liveLock](self->_internal, "liveLock"), "unlock");
  if (v11) {
    return +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v11);
  }
  else {
    return +[NSArray array](&OBJC_CLASS___NSArray, "array");
  }
}

- (double)numberOfLoops
{
  return result;
}

- (void)setNumberOfLoops:(double)a3
{
  if (a3 > 0.0)
  {
    objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChangeValueForKey:", @"numberOfLoops");
    -[MPLayerGroupInternal setNumberOfLoops:](self->_internal, "setNumberOfLoops:", a3);
    plug = self->_plug;
    if (plug)
    {
      -[MCPlug setNumberOfLoops:](plug, "setNumberOfLoops:", a3);
      if (-[MPLayerGroupInternal autoAdjustDuration](self->_internal, "autoAdjustDuration"))
      {
        -[MPLayerGroup resetDuration](self, "resetDuration");
      }

      else
      {
        -[MPLayerGroupInternal duration](self->_internal, "duration");
        double v7 = v6;
        -[MPLayerGroupInternal phaseInDuration](self->_internal, "phaseInDuration");
        double v9 = v7 - v8;
        -[MPLayerGroupInternal phaseOutDuration](self->_internal, "phaseOutDuration");
        double v11 = v9 - v10;
        if (v11 < 0.0) {
          double v11 = 0.0;
        }
        -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v11);
      }
    }

    objc_msgSend(-[MPLayerGroup observer](self, "observer"), "didChangeValueForKey:", @"numberOfLoops");
  }

- (double)phaseInDuration
{
  return result;
}

- (void)setPhaseInDuration:(double)a3
{
  if (v5 != a3)
  {
    -[MPLayerGroupInternal setPhaseInDuration:](self->_internal, "setPhaseInDuration:", a3);
    plug = self->_plug;
    if (plug)
    {
      -[MCPlug setPhaseInDuration:](plug, "setPhaseInDuration:", a3);
      if (-[MPLayerGroupInternal autoAdjustDuration](self->_internal, "autoAdjustDuration"))
      {
        -[MPLayerGroup resetDuration](self, "resetDuration");
      }

      else
      {
        -[MPLayerGroupInternal duration](self->_internal, "duration");
        double v8 = v7;
        -[MPLayerGroupInternal phaseInDuration](self->_internal, "phaseInDuration");
        double v10 = v8 - v9;
        -[MPLayerGroupInternal phaseOutDuration](self->_internal, "phaseOutDuration");
        double v12 = v10 - v11;
        if (v12 < 0.0) {
          double v12 = 0.0;
        }
        -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v12);
      }
    }
  }

- (double)phaseOutDuration
{
  return result;
}

- (void)setPhaseOutDuration:(double)a3
{
  if (a3 >= 0.0 && v5 != a3)
  {
    -[MPLayerGroupInternal setPhaseOutDuration:](self->_internal, "setPhaseOutDuration:", a3);
    plug = self->_plug;
    if (plug)
    {
      -[MCPlug setPhaseOutDuration:](plug, "setPhaseOutDuration:", a3);
      if (-[MPLayerGroupInternal autoAdjustDuration](self->_internal, "autoAdjustDuration"))
      {
        -[MPLayerGroup resetDuration](self, "resetDuration");
      }

      else
      {
        -[MPLayerGroupInternal duration](self->_internal, "duration");
        double v9 = v8;
        -[MPLayerGroupInternal phaseInDuration](self->_internal, "phaseInDuration");
        double v11 = v9 - v10;
        -[MPLayerGroupInternal phaseOutDuration](self->_internal, "phaseOutDuration");
        double v13 = v11 - v12;
        if (v13 < 0.0) {
          double v13 = 0.0;
        }
        -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v13);
      }
    }
  }

- (BOOL)autoAdjustDuration
{
  return -[MPLayerGroupInternal autoAdjustDuration](self->_internal, "autoAdjustDuration");
}

- (void)setAutoAdjustDuration:(BOOL)a3
{
}

- (id)layerKey
{
  if (objc_msgSend(-[MPLayerGroup parent](self, "parent"), "layersCanPositionZIndex")) {
    return objc_msgSend( objc_msgSend(-[MPLayerGroup parent](self, "parent"), "layerKeyDictionary"),  "objectForKey:",  -[MPLayerGroup uuid](self, "uuid"));
  }
  else {
    return 0LL;
  }
}

- (id)keyedLayers
{
  return self->_layerDictionary;
}

- (id)layerForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_layerDictionary, "objectForKey:", a3);
}

- (void)setLayer:(id)a3 forKey:(id)a4
{
  double v7 = objc_autoreleasePoolPush();
  layerDictionary = self->_layerDictionary;
  if (!layerDictionary)
  {
    self->_layerDictionary = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MPLayerGroupInternal setLayerKeyDictionary:]( self->_internal,  "setLayerKeyDictionary:",  objc_alloc_init(&OBJC_CLASS___NSMutableDictionary));
    layerDictionary = self->_layerDictionary;
  }

  if (-[NSMutableDictionary objectForKey:](layerDictionary, "objectForKey:", a4)) {
    -[MPLayerGroup removeLayerForKey:](self, "removeLayerForKey:", a4);
  }
  [a3 setParent:self];
  -[NSMutableDictionary setObject:forKey:](self->_layerDictionary, "setObject:forKey:", a3, a4);
  -[NSMutableDictionary setObject:forKey:]( -[MPLayerGroupInternal layerKeyDictionary](self->_internal, "layerKeyDictionary"),  "setObject:forKey:",  a4,  [a3 uuid]);
  if (self->_plug) {
    +[MPUtilities createPlugInContainer:forLayer:key:inDocument:]( &OBJC_CLASS___MPUtilities,  "createPlugInContainer:forLayer:key:inDocument:",  self->_parallelizer,  a3,  a4,  -[MPLayerGroup parentDocument](self, "parentDocument"));
  }
  if (-[MPLayerGroup parentDocument](self, "parentDocument"))
  {
    -[MPLayerGroup reconfigureLoopingMode](self, "reconfigureLoopingMode");
    objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "configureActions");
  }

  objc_autoreleasePoolPop(v7);
}

- (void)removeLayerForKey:(id)a3
{
  double v5 = objc_autoreleasePoolPush();
  id v6 = -[NSMutableDictionary objectForKey:](self->_layerDictionary, "objectForKey:", a3);
  if (v6)
  {
    double v8 = v6;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPLayerSerializer, v7);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
      [v8 reconnectAllTransitions];
    }
    parallelizer = self->_parallelizer;
    if (parallelizer)
    {
      -[MCContainerParallelizer removePlug:](parallelizer, "removePlug:", [v8 plug]);
      [v8 setPlug:0];
    }

    [v8 setParent:0];
    if ((objc_opt_respondsToSelector(v8, "setMontage:") & 1) != 0) {
      [v8 setMontage:0];
    }
    if ((objc_opt_respondsToSelector(v8, "setLayerSerializer:") & 1) != 0)
    {
      [v8 setLayerSerializer:0];
    }

    else if ((objc_opt_respondsToSelector(v8, "setLayerEffect:") & 1) != 0)
    {
      [v8 setLayerEffect:0];
    }

    else if ((objc_opt_respondsToSelector(v8, "setContainer:") & 1) != 0)
    {
      [v8 setContainer:0];
    }

    else
    {
      NSLog(@"what kind of container is that?!?!?");
    }

    -[NSMutableDictionary removeObjectForKey:]( -[MPLayerGroupInternal layerKeyDictionary](self->_internal, "layerKeyDictionary"),  "removeObjectForKey:",  [v8 uuid]);
    -[NSMutableDictionary removeObjectForKey:](self->_layerDictionary, "removeObjectForKey:", a3);
    -[MPLayerGroup resetDuration](self, "resetDuration");
    objc_autoreleasePoolPop(v5);
    objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "unlock");
  }

  else
  {
    objc_autoreleasePoolPop(v5);
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
    id v7 = -[MPLayerGroup animationPathForKey:](self, "animationPathForKey:", a4);
    if (v7)
    {
      double v8 = v7;
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
      __int128 v14 = off_24C620;
      if ((isKindOfClass & 1) == 0) {
        __int128 v14 = off_24C628;
      }
      id v15 = -[__objc2_class animationPathWithKey:](*v14, "animationPathWithKey:", a4);
      -[MCPlug addAnimationPath:](self->_plug, "addAnimationPath:", v15);
      [a3 setAnimationPath:v15];
    }
  }

  else
  {
    -[MPLayerGroup removeAnimationPathForKey:](self, "removeAnimationPathForKey:", a4);
  }

- (void)removeAnimationPathForKey:(id)a3
{
  id v5 = -[MPLayerGroup animationPathForKey:](self, "animationPathForKey:");
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
  if (plug)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v5);
    if ((objc_opt_isKindOfClass(plug, v7) & 1) != 0) {
      -[MCPlugParallel setOpacity:](self->_plug, "setOpacity:", a3);
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
  -[MPLayerGroupInternal setPosition:](self->_internal, "setPosition:");
  plug = self->_plug;
  if (plug)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v6);
    if ((objc_opt_isKindOfClass(plug, v8) & 1) != 0) {
      -[MCPlugParallel setPosition:](self->_plug, "setPosition:", x, y);
    }
  }

- (double)zPosition
{
  return result;
}

- (void)setZPosition:(double)a3
{
  plug = self->_plug;
  if (plug)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v5);
    if ((objc_opt_isKindOfClass(plug, v7) & 1) != 0) {
      -[MCPlugParallel setZPosition:](self->_plug, "setZPosition:", a3);
    }
  }

- (double)rotationAngle
{
  return result;
}

- (void)setRotationAngle:(double)a3
{
  plug = self->_plug;
  if (plug)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v5);
    if ((objc_opt_isKindOfClass(plug, v7) & 1) != 0) {
      -[MCPlugParallel setRotationAngle:](self->_plug, "setRotationAngle:", a3);
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
  -[MPLayerGroupInternal setSize:](self->_internal, "setSize:");
  plug = self->_plug;
  if (plug)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v6);
    if ((objc_opt_isKindOfClass(plug, v8) & 1) != 0) {
      -[MCPlugParallel setSize:](self->_plug, "setSize:", width, height);
    }
  }

- (double)xRotationAngle
{
  return result;
}

- (void)setXRotationAngle:(double)a3
{
  plug = self->_plug;
  if (plug)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v5);
    if ((objc_opt_isKindOfClass(plug, v7) & 1) != 0) {
      -[MCPlugParallel setXRotationAngle:](self->_plug, "setXRotationAngle:", a3);
    }
  }

- (double)yRotationAngle
{
  return result;
}

- (void)setYRotationAngle:(double)a3
{
  plug = self->_plug;
  if (plug)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v5);
    if ((objc_opt_isKindOfClass(plug, v7) & 1) != 0) {
      -[MCPlugParallel setYRotationAngle:](self->_plug, "setYRotationAngle:", a3);
    }
  }

- (double)scale
{
  return result;
}

- (void)setScale:(double)a3
{
  plug = self->_plug;
  if (plug)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v5);
    if ((objc_opt_isKindOfClass(plug, v7) & 1) != 0) {
      -[MCPlugParallel setScale:](self->_plug, "setScale:", a3);
    }
  }

- (int64_t)zIndex
{
  plug = self->_plug;
  if (plug && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, a2), (objc_opt_isKindOfClass(plug, v4) & 1) != 0)) {
    return -[MCPlugParallel zIndex](self->_plug, "zIndex");
  }
  else {
    return -[MPLayerGroupInternal zIndex](self->_internal, "zIndex");
  }
}

- (void)setZIndex:(int64_t)a3
{
  __int16 v3 = a3;
  -[MPLayerGroupInternal setZIndex:](self->_internal, "setZIndex:");
  if (objc_msgSend(-[MPLayerGroup parent](self, "parent"), "layersCanPositionZIndex"))
  {
    plug = self->_plug;
    if (plug) {
      -[MCPlugParallel setZIndex:](plug, "setZIndex:", v3);
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
    id v7 = -[MPLayerGroup actionForKey:](self, "actionForKey:", a4);
    if (v7) {
      [v7 setParent:0];
    }
    [a3 setParent:self];
    actions = self->_actions;
    if (!actions)
    {
      actions = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      self->_actions = actions;
    }

    -[NSMutableDictionary setObject:forKey:](actions, "setObject:forKey:", a3, a4);
    plug = self->_plug;
    if (plug) {
      objc_msgSend( a3,  "setAction:",  +[MPUtilities createMCAction:forPlug:withKey:]( MPUtilities,  "createMCAction:forPlug:withKey:",  a3,  plug,  a4));
    }
  }

  else
  {
    -[MPLayerGroup removeActionForKey:](self, "removeActionForKey:", a4);
  }

- (void)removeActionForKey:(id)a3
{
  id v5 = -[MPLayerGroup actionForKey:](self, "actionForKey:");
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

- (id)allEffectContainers
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  layers = self->_layers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
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
          objc_enumerationMutation(layers);
        }
        objc_msgSend( v3,  "addObjectsFromArray:",  objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "effectContainers"));
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)allEffects
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = -[MPLayerGroup allEffectContainers](self, "allEffectContainers", 0LL);
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend( v3,  "addObjectsFromArray:",  objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "effects"));
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)allSlides:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v6 = -[MPLayerGroup mainLayers](self, "mainLayers");
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (id i = 0LL; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( v5,  "addObjectsFromArray:",  objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)i), "allSlides:", v3));
      }

      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v8);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  layerDictionardouble y = self->_layerDictionary;
  id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerDictionary,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(layerDictionary);
        }
        objc_msgSend( v5,  "addObjectsFromArray:",  objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_layerDictionary,  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)j)),  "allSlides:",  v3));
      }

      id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerDictionary,  "countByEnumeratingWithState:objects:count:",  &v17,  v25,  16LL);
    }

    while (v13);
  }

  return v5;
}

- (id)allSongs
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  layers = self->_layers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (id i = 0LL; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(layers);
        }
        objc_msgSend( v3,  "addObjectsFromArray:",  objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)i), "allSongs"));
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    }

    while (v6);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  layerDictionardouble y = self->_layerDictionary;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerDictionary,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(layerDictionary);
        }
        objc_msgSend( v3,  "addObjectsFromArray:",  objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_layerDictionary,  "objectForKey:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)j)),  "allSongs"));
      }

      id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerDictionary,  "countByEnumeratingWithState:objects:count:",  &v15,  v23,  16LL);
    }

    while (v11);
  }

  objc_msgSend(v3, "addObjectsFromArray:", -[MPAudioPlaylist songs](self->_audioPlaylist, "songs"));
  return v3;
}

- (double)posterTime
{
  double v4 = v3;
  if (v3 == -1.0)
  {
    signed int v6 = objc_msgSend( objc_msgSend(-[MPLayerGroup mainLayers](self, "mainLayers"), "lastObject"),  "zIndex");
    uint64_t v7 = (unint64_t)-[NSMutableArray count](self->_layers, "count") <= v6
       ? (char *)-[NSMutableArray count](self->_layers, "count") - 1
       : (char *)v6;
    double v4 = 1.0;
    if (((unint64_t)v7 & 0x8000000000000000LL) == 0)
    {
      id v8 = -[MPLayerGroup objectInLayersAtIndex:](self, "objectInLayersAtIndex:");
      if ((uint64_t)[v8 countOfEffectContainers] >= 1)
      {
        uint64_t v9 = objc_msgSend(objc_msgSend(v8, "objectInEffectContainersAtIndex:", 0), "countOfEffects") == 0;
        if ((uint64_t)[v8 countOfEffectContainers] > v9)
        {
          id v10 = objc_msgSend(objc_msgSend(v8, "objectInEffectContainersAtIndex:", v9), "objectInEffectsAtIndex:", 0);
          [v10 phaseInDuration];
          double v4 = v11;
          objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "fadeInDuration");
          if (v4 < v12) {
            double v4 = v12;
          }
          if (v4 == 0.0)
          {
            [v10 mainDuration];
            return v13 * 0.5;
          }
        }
      }
    }
  }

  return v4;
}

- (id)absoluteVideoPaths
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  double v4 = -[MPLayerGroup videoPaths](self, "videoPaths", 0LL);
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (id i = 0LL; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (+[MPUtilities pathIsRelative:](&OBJC_CLASS___MPUtilities, "pathIsRelative:", v9)) {
          id v9 = objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "absolutePathForAssetAtPath:", v9);
        }
        [v3 addObject:v9];
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)parentDocument
{
  id v2 = -[MPLayerGroup parent](self, "parent");
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

- (id)plugID
{
  return -[MCPlugParallel idInSupercontainer](self->_plug, "idInSupercontainer");
}

- (id)objectID
{
  return -[MCObject objectID](self->_plug, "objectID");
}

- (BOOL)layersCanPositionZIndex
{
  return self->_layerDictionary != 0LL;
}

- (id)observer
{
  if (-[MPLayerGroupInternal isDocumentLayerGroup](self->_internal, "isDocumentLayerGroup")
    && objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "documentLayerGroup"))
  {
    return -[MPLayerGroup parentDocument](self, "parentDocument");
  }

  else
  {
    return self;
  }

- (void)setParent:(id)a3
{
  if (a3 && self->_parent)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"A layer may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPLayerGroup configureActions](v4, v5);
  }

  else
  {
    self->_id parent = a3;
    if (!-[MPLayerGroupInternal uuid](self->_internal, "uuid")) {
      -[MPLayerGroupInternal setUuid:]( self->_internal,  "setUuid:",  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"));
    }
    if (self->_parent)
    {
      if (objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "assetKeyDelegate")) {
        -[MPLayerGroup cachePaths](self, "cachePaths");
      }
    }
  }

- (void)configureActions
{
  if (-[MPLayerGroup parentDocument](self, "parentDocument")
    && (objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "isInBatchModify") & 1) == 0)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    layers = self->_layers;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v26,  v32,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v27;
      do
      {
        for (id i = 0LL; i != v5; id i = (char *)i + 1)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(layers);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * (void)i) configureActions];
        }

        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v26,  v32,  16LL);
      }

      while (v5);
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v8 = -[NSMutableDictionary allValues](self->_layerDictionary, "allValues");
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (j = 0LL; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) configureActions];
        }

        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }

      while (v10);
    }

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    actions = self->_actions;
    id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v18,  v30,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (k = 0LL; k != v15; k = (char *)k + 1)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(actions);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_actions,  "objectForKey:",  *(void *)(*((void *)&v18 + 1) + 8 * (void)k)),  "configureTarget");
        }

        id v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v18,  v30,  16LL);
      }

      while (v15);
    }
  }

- (id)container
{
  return self->_parallelizer;
}

- (void)setContainer:(id)a3
{
  if (self->_parallelizer)
  {
    if (-[MPLayerGroupInternal backgroundAudioID](self->_internal, "backgroundAudioID")) {
      -[MCContainerParallelizer removePlugForID:]( self->_parallelizer,  "removePlugForID:",  -[MPLayerGroupInternal backgroundAudioID](self->_internal, "backgroundAudioID"));
    }
    -[MCContainer specialRelease](self->_parallelizer, "specialRelease");
    self->_parallelizer = 0LL;
  }

  id v5 = (MCContainerParallelizer *)[a3 specialRetain];
  self->_parallelizer = v5;
  if (v5)
  {
    if (-[MPLayerGroupInternal backgroundColor](self->_internal, "backgroundColor")) {
      -[MCContainerParallelizer setBackgroundColor:]( self->_parallelizer,  "setBackgroundColor:",  -[MPLayerGroupInternal backgroundColor](self->_internal, "backgroundColor"));
    }
    if (-[MPLayerGroupInternal initialState](self->_internal, "initialState")) {
      -[MCContainer setInitialState:]( self->_parallelizer,  "setInitialState:",  -[MPLayerGroupInternal initialState](self->_internal, "initialState"));
    }
  }

  else
  {
    -[MPAudioPlaylist setAudioPlaylist:](self->_audioPlaylist, "setAudioPlaylist:", 0LL);
    -[MPAudioPlaylist setPlug:](self->_audioPlaylist, "setPlug:", 0LL);
  }

- (void)setPlug:(id)a3
{
  plug = self->_plug;
  if (plug)
  {

    self->_plug = 0LL;
  }

  uint64_t v6 = (MCPlugParallel *)a3;
  self->_plug = v6;
  if (v6)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v7);
    if ((objc_opt_isKindOfClass(a3, v8) & 1) != 0)
    {
      -[MCPlugParallel setSize:](self->_plug, "setSize:", 2.0, 2.0);
      -[MCPlugParallel setAudioPriority:](self->_plug, "setAudioPriority:", 2LL);
      -[MPLayerGroup position](self, "position");
      -[MCPlugParallel setPosition:](self->_plug, "setPosition:");
      -[MPLayerGroup size](self, "size");
      -[MCPlugParallel setSize:](self->_plug, "setSize:");
      -[MPLayerGroup zPosition](self, "zPosition");
      -[MCPlugParallel setZPosition:](self->_plug, "setZPosition:");
      -[MPLayerGroup rotationAngle](self, "rotationAngle");
      -[MCPlugParallel setRotationAngle:](self->_plug, "setRotationAngle:");
      -[MPLayerGroup xRotationAngle](self, "xRotationAngle");
      -[MCPlugParallel setXRotationAngle:](self->_plug, "setXRotationAngle:");
      -[MPLayerGroup yRotationAngle](self, "yRotationAngle");
      -[MCPlugParallel setYRotationAngle:](self->_plug, "setYRotationAngle:");
      -[MPLayerGroup scale](self, "scale");
      -[MCPlugParallel setScale:](self->_plug, "setScale:");
      -[MPLayerGroup opacity](self, "opacity");
      -[MCPlugParallel setOpacity:](self->_plug, "setOpacity:");
      -[MPLayerGroup timeIn](self, "timeIn");
      -[MCPlugParallel setTimeIn:](self->_plug, "setTimeIn:");
      -[MCPlugParallel setIsTriggered:]( self->_plug,  "setIsTriggered:",  -[MPLayerGroup isTriggered](self, "isTriggered"));
      -[MCPlug setStartsPaused:](self->_plug, "setStartsPaused:", -[MPLayerGroup startsPaused](self, "startsPaused"));
      if (objc_msgSend(-[MPLayerGroup parent](self, "parent"), "layersCanPositionZIndex")) {
        -[MCPlugParallel setZIndex:]( self->_plug,  "setZIndex:",  (__int16)-[MPLayerGroupInternal zIndex](self->_internal, "zIndex"));
      }
    }

    if (!-[MPLayerGroupInternal autoAdjustDuration](self->_internal, "autoAdjustDuration"))
    {
      -[MPLayerGroupInternal duration](self->_internal, "duration");
      double v10 = v9;
      -[MPLayerGroupInternal phaseInDuration](self->_internal, "phaseInDuration");
      double v12 = v10 - v11;
      -[MPLayerGroupInternal phaseOutDuration](self->_internal, "phaseOutDuration");
      double v14 = v12 - v13;
      if (v14 < 0.0) {
        double v14 = 0.0;
      }
      -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v14);
      -[MPLayerGroupInternal numberOfLoops](self->_internal, "numberOfLoops");
      -[MCPlug setNumberOfLoops:](self->_plug, "setNumberOfLoops:");
    }

    -[MPLayerGroup phaseInDuration](self, "phaseInDuration");
    -[MCPlug setPhaseInDuration:](self->_plug, "setPhaseInDuration:");
    -[MPLayerGroup phaseOutDuration](self, "phaseOutDuration");
    -[MCPlug setPhaseOutDuration:](self->_plug, "setPhaseOutDuration:");
    id obj = self->_layers;
    if (obj)
    {
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v93,  v103,  16LL);
      if (v15)
      {
        id v16 = v15;
        __int16 v17 = 0;
        uint64_t v18 = *(void *)v94;
        do
        {
          for (id i = 0LL; i != v16; id i = (char *)i + 1)
          {
            if (*(void *)v94 != v18) {
              objc_enumerationMutation(obj);
            }
            objc_msgSend( +[MPUtilities createPlugInContainer:forLayer:key:inDocument:]( MPUtilities,  "createPlugInContainer:forLayer:key:inDocument:",  self->_parallelizer,  *(void *)(*((void *)&v93 + 1) + 8 * (void)i),  +[MPUtilities stringWithNewUUID](MPUtilities, "stringWithNewUUID"),  -[MPLayerGroup parentDocument](self, "parentDocument")),  "setZIndex:",  (__int16)(v17 + (_WORD)i));
          }

          id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v93,  v103,  16LL);
          v17 += (__int16)i;
        }

        while (v16);
      }
    }

    layerDictionardouble y = self->_layerDictionary;
    if (layerDictionary)
    {
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      id v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerDictionary,  "countByEnumeratingWithState:objects:count:",  &v89,  v102,  16LL);
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v90;
        do
        {
          for (j = 0LL; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v90 != v23) {
              objc_enumerationMutation(layerDictionary);
            }
            +[MPUtilities createPlugInContainer:forLayer:key:inDocument:]( &OBJC_CLASS___MPUtilities,  "createPlugInContainer:forLayer:key:inDocument:",  self->_parallelizer,  -[NSMutableDictionary objectForKey:]( self->_layerDictionary,  "objectForKey:",  *(void *)(*((void *)&v89 + 1) + 8LL * (void)j)),  *(void *)(*((void *)&v89 + 1) + 8LL * (void)j),  -[MPLayerGroup parentDocument](self, "parentDocument"));
          }

          id v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layerDictionary,  "countByEnumeratingWithState:objects:count:",  &v89,  v102,  16LL);
        }

        while (v22);
      }
    }

    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    animationPaths = self->_animationPaths;
    id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v85,  v101,  16LL);
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v86;
      do
      {
        for (k = 0LL; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v86 != v28) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v30 = *(void *)(*((void *)&v85 + 1) + 8LL * (void)k);
          id v31 = -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", v30);
          uint64_t v33 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v32);
          if ((objc_opt_isKindOfClass(v31, v33) & 1) != 0) {
            __int128 v34 = off_24C620;
          }
          else {
            __int128 v34 = off_24C628;
          }
          id v35 = -[__objc2_class animationPathWithKey:](*v34, "animationPathWithKey:", v30);
          -[MCPlug addAnimationPath:](self->_plug, "addAnimationPath:", v35);
          [v31 setAnimationPath:v35];
        }

        id v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v85,  v101,  16LL);
      }

      while (v27);
    }

    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    actions = self->_actions;
    id v37 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v81,  v100,  16LL);
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v82;
      do
      {
        for (m = 0LL; m != v38; m = (char *)m + 1)
        {
          if (*(void *)v82 != v39) {
            objc_enumerationMutation(actions);
          }
          uint64_t v41 = *(void *)(*((void *)&v81 + 1) + 8LL * (void)m);
          id v42 = -[NSMutableDictionary objectForKey:](self->_actions, "objectForKey:", v41);
          objc_msgSend( v42,  "setAction:",  +[MPUtilities createMCAction:forPlug:withKey:]( MPUtilities,  "createMCAction:forPlug:withKey:",  v42,  self->_plug,  v41));
        }

        id v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v81,  v100,  16LL);
      }

      while (v38);
    }

    if (self->_audioPlaylist)
    {
      id v43 = -[MPLayerGroup parentDocument](self, "parentDocument");
      if (v43 && [v43 documentLayerGroup] == self)
      {
        if (!-[MPLayerGroupInternal backgroundAudioID](self->_internal, "backgroundAudioID")) {
          -[MPLayerGroupInternal setBackgroundAudioID:]( self->_internal,  "setBackgroundAudioID:",  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"));
        }
        id v65 = objc_msgSend( objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"),  "createParallelizerContainer");
        id v66 = -[MCContainerParallelizer setPlugForContainer:forID:]( self->_parallelizer,  "setPlugForContainer:forID:",  v65,  -[MPLayerGroupInternal backgroundAudioID](self->_internal, "backgroundAudioID"));
        [v66 setLoopDuration:0.0];
        [v66 setZIndex:100];
        -[MPAudioPlaylist setMontage:]( self->_audioPlaylist,  "setMontage:",  objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"));
        -[MPAudioPlaylist setAudioPlaylist:]( self->_audioPlaylist,  "setAudioPlaylist:",  [v65 audioPlaylistCreateIfNeeded]);
        -[MPAudioPlaylist setPlug:](self->_audioPlaylist, "setPlug:", v66);
        id v67 = -[MPLayerGroup parentDocument](self, "parentDocument");
        -[MPAudioPlaylist fadeOutDuration](self->_audioPlaylist, "fadeOutDuration");
        objc_msgSend(v67, "setAudioFadeOutDuration:");
      }

      else
      {
        -[MPAudioPlaylist setMontage:]( self->_audioPlaylist,  "setMontage:",  objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"));
        -[MPAudioPlaylist setAudioPlaylist:]( self->_audioPlaylist,  "setAudioPlaylist:",  -[MCContainer audioPlaylistCreateIfNeeded](self->_parallelizer, "audioPlaylistCreateIfNeeded"));
        -[MPAudioPlaylist setPlug:](self->_audioPlaylist, "setPlug:", self->_plug);
      }

      -[MPLayerGroup reconfigureLoopingMode](self, "reconfigureLoopingMode");
    }

    -[MPLayerGroup resetDuration](self, "resetDuration");
    -[MPLayerGroup configureActions](self, "configureActions");
  }

  else
  {
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    layers = self->_layers;
    id v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v77,  v99,  16LL);
    if (v45)
    {
      id v47 = v45;
      uint64_t v48 = *(void *)v78;
      do
      {
        for (n = 0LL; n != v47; n = (char *)n + 1)
        {
          if (*(void *)v78 != v48) {
            objc_enumerationMutation(layers);
          }
          v50 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)n);
          uint64_t v51 = objc_opt_class(&OBJC_CLASS___MPLayerSerializer, v46);
          if ((objc_opt_isKindOfClass(v50, v51) & 1) != 0)
          {
            [v50 setPlug:0];
            [v50 setLayerSerializer:0];
          }

          else
          {
            uint64_t v53 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v52);
            char isKindOfClass = objc_opt_isKindOfClass(v50, v53);
            [v50 setPlug:0];
            if ((isKindOfClass & 1) != 0) {
              [v50 setLayerEffect:0];
            }
            else {
              [v50 setContainer:0];
            }
          }
        }

        id v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v77,  v99,  16LL);
      }

      while (v47);
    }

    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    v55 = self->_animationPaths;
    id v56 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v73,  v98,  16LL);
    if (v56)
    {
      id v57 = v56;
      uint64_t v58 = *(void *)v74;
      do
      {
        for (iid i = 0LL; ii != v57; iid i = (char *)ii + 1)
        {
          if (*(void *)v74 != v58) {
            objc_enumerationMutation(v55);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_animationPaths,  "objectForKey:",  *(void *)(*((void *)&v73 + 1) + 8 * (void)ii)),  "setAnimationPath:",  0);
        }

        id v57 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  &v73,  v98,  16LL);
      }

      while (v57);
    }

    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    v60 = self->_actions;
    id v61 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v60,  "countByEnumeratingWithState:objects:count:",  &v69,  v97,  16LL);
    if (v61)
    {
      id v62 = v61;
      uint64_t v63 = *(void *)v70;
      do
      {
        for (jj = 0LL; jj != v62; jj = (char *)jj + 1)
        {
          if (*(void *)v70 != v63) {
            objc_enumerationMutation(v60);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_actions,  "objectForKey:",  *(void *)(*((void *)&v69 + 1) + 8 * (void)jj)),  "setAction:",  0);
        }

        id v62 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v60,  "countByEnumeratingWithState:objects:count:",  &v69,  v97,  16LL);
      }

      while (v62);
    }
  }

- (void)cleanup
{
  id v3 = -[NSMutableDictionary allKeys](self->_animationPaths, "allKeys");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MPLayerGroup removeAnimationPathForKey:]( self,  "removeAnimationPathForKey:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v7));
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v5);
  }

  id v8 = -[NSMutableDictionary allKeys](self->_actions, "allKeys");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      double v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[MPLayerGroup removeActionForKey:]( self,  "removeActionForKey:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v12));
        double v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v10);
  }

  self->_id parent = 0LL;
}

- (void)resetDuration
{
  if (-[MPLayerGroupInternal autoAdjustDuration](self->_internal, "autoAdjustDuration"))
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    layers = self->_layers;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
    double v5 = 0.0;
    double v6 = 0.0;
    if (v4)
    {
      id v7 = v4;
      uint64_t v8 = *(void *)v36;
      do
      {
        for (id i = 0LL; i != v7; id i = (char *)i + 1)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(layers);
          }
          id v10 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          if ([v10 conformsToProtocol:&OBJC_PROTOCOL___MPNavigatorSupportInternal])
          {
            [v10 duration];
            double v12 = v11;
            [v10 numberOfLoops];
            double v14 = v12 * v13;
          }

          else
          {
            [v10 timeIn];
            double v16 = v15;
            [v10 duration];
            double v18 = v17;
            [v10 numberOfLoops];
            double v14 = v16 + v18 * v19;
          }

          if (v14 >= v6) {
            double v6 = v14;
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
      }

      while (v7);
    }

    objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "lock");
    id v20 = -[MCContainerParallelizer plugForID:]( self->_parallelizer,  "plugForID:",  -[MPLayerGroupInternal backgroundAudioID](self->_internal, "backgroundAudioID"));
    if ((int *)-[MPLayerGroup loopingMode](self, "loopingMode") != &dword_4
      && -[MPLayerGroup loopingMode](self, "loopingMode"))
    {
      [v20 loopDuration];
      double v22 = v21;
      -[MPLayerGroup numberOfLoops](self, "numberOfLoops");
      double v5 = v22 * v23;
    }

    -[MPLayerGroupInternal phaseInDuration](self->_internal, "phaseInDuration");
    double v25 = v24;
    -[MPLayerGroupInternal phaseOutDuration](self->_internal, "phaseOutDuration");
    double v27 = v25 + v26;
    double v28 = v6 - v27;
    if (v6 - v27 < 0.0) {
      double v28 = 0.0;
    }
    double v29 = v27 + v28;
    if (v29 >= v5) {
      double v30 = v29;
    }
    else {
      double v30 = v5;
    }
    -[MPLayerGroupInternal durationPadding](self->_internal, "durationPadding");
    double v32 = v31 + v30 - v27;
    -[MCPlug loopDuration](self->_plug, "loopDuration");
    if (v33 != v32 || (-[MPLayerGroupInternal durationPadding](self->_internal, "durationPadding"), v34 > 0.00001))
    {
      objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChangeValueForKey:", @"duration");
      -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v32);
      objc_msgSend(-[MPLayerGroup observer](self, "observer"), "didChangeValueForKey:", @"duration");
    }

    objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "unlock");
  }

- (double)durationPadding
{
  return result;
}

- (void)setDurationPadding:(double)a3
{
  if (v4 < 0.0) {
    -[MPLayerGroupInternal setDurationPadding:](self->_internal, "setDurationPadding:", 0.0);
  }
  -[MPLayerGroup resetDuration](self, "resetDuration");
}

- (void)reconnectAll
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  layers = self->_layers;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (id i = 0LL; i != v4; id i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(layers);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MPNavigatorSupportInternal])
        {
          [v7 reconnectAll];
        }

        else
        {
          __int128 v16 = 0u;
          __int128 v17 = 0u;
          __int128 v14 = 0u;
          __int128 v15 = 0u;
          id v8 = objc_msgSend(v7, "effectContainers", 0);
          id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v15;
            do
            {
              for (j = 0LL; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v15 != v11) {
                  objc_enumerationMutation(v8);
                }
                double v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)j);
              }

              id v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
            }

            while (v10);
          }
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
    }

    while (v4);
  }

- (void)reconfigureLoopingMode
{
  if ((int *)-[MPLayerGroup loopingMode](self, "loopingMode") == &dword_4)
  {
    -[MPLayerGroup setNumberOfLoops:](self, "setNumberOfLoops:", 1.0);
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    layers = self->_layers;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v57,  v65,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v58;
      do
      {
        for (id i = 0LL; i != v5; id i = (char *)i + 1)
        {
          if (*(void *)v58 != v6) {
            objc_enumerationMutation(layers);
          }
          [*(id *)(*((void *)&v57 + 1) + 8 * (void)i) setNumberOfLoops:1.0];
        }

        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v57,  v65,  16LL);
      }

      while (v5);
    }

- (void)copyStruct:(id)a3
{
  Copdouble y = CGColorCreateCopy((CGColorRef)[a3 backgroundColor]);
  -[MPLayerGroupInternal setBackgroundColor:](self->_internal, "setBackgroundColor:", Copy);
  CGColorRelease(Copy);
}

- (void)copyLayers:(id)a3
{
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
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
        [v5 addObject:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  if ([v5 count]) {
    -[MPLayerGroup addLayers:](self, "addLayers:", v5);
  }
}

- (void)copyLayerDictionary:(id)a3
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
        -[MPLayerGroup setLayer:forKey:](self, "setLayer:forKey:", v10, v9);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

- (void)copyAudioPlaylist:(id)a3
{
  id v4 = [a3 copy];
  -[MPLayerGroup setAudioPlaylist:](self, "setAudioPlaylist:", v4);
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
        -[MPLayerGroup setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v10, v9);
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
        -[MPLayerGroup setAction:forKey:](self, "setAction:forKey:", v10, v9);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

- (id)authoredVersionInfo
{
  return -[MPLayerGroupInternal authoredVersionInfo](self->_internal, "authoredVersionInfo");
}

- (void)setAuthoredVersionInfo:(id)a3
{
}

- (id)liveLock
{
  return -[MPLayerGroupInternal liveLock](self->_internal, "liveLock");
}

- (BOOL)nearingEndWithOptions:(id)a3
{
  id v5 = [a3 objectForKey:@"requestedNumberOfSlides"];
  id v6 = [a3 objectForKey:@"container"];
  id v7 = -[MPLayerGroup parentDocument](self, "parentDocument");
  if (v5)
  {
    id v8 = +[MPUtilities effectForMCContainerEffect:inDocument:]( &OBJC_CLASS___MPUtilities,  "effectForMCContainerEffect:inDocument:",  v6,  v7);
    if (v8)
    {
      id v9 = v8;
      id v10 = 0LL;
      goto LABEL_6;
    }

- (double)aspectRatioDidChange:(double)a3 atTime:(double)a4
{
  id v7 = -[MPLayerGroup authoringOptionForKey:](self, "authoringOptionForKey:", kMPAuthoringAuthorOnAspectRatioChange);
  if (!v7 || ([v7 BOOLValue] & 1) != 0)
  {
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    id obj = +[MPUtilities effectContainersForTime:inDocument:]( &OBJC_CLASS___MPUtilities,  "effectContainersForTime:inDocument:",  -[MPLayerGroup parentDocument](self, "parentDocument"),  a4);
    id v9 = [obj countByEnumeratingWithState:&v98 objects:v107 count:16];
    __int128 v71 = self;
    if (v9)
    {
      id v10 = v9;
      BOOL v11 = 0;
      __int128 v12 = 0LL;
      uint64_t v75 = *(void *)v99;
      do
      {
        for (id i = 0LL; i != v10; id i = (char *)i + 1)
        {
          if (*(void *)v99 != v75) {
            objc_enumerationMutation(obj);
          }
          unint64_t v14 = *(void **)(*((void *)&v98 + 1) + 8LL * (void)i);
          __int128 v94 = 0u;
          __int128 v95 = 0u;
          __int128 v96 = 0u;
          __int128 v97 = 0u;
          id v15 = [v14 effects];
          id v16 = [v15 countByEnumeratingWithState:&v94 objects:v106 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v95;
            do
            {
              for (j = 0LL; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v95 != v18) {
                  objc_enumerationMutation(v15);
                }
                if ((uint64_t)[*(id *)(*((void *)&v94 + 1) + 8 * (void)j) countOfSlides] >= 1)
                {
                  BOOL v11 = v12 != 0LL;
                  else {
                    __int128 v12 = v14;
                  }
                }
              }

              id v17 = [v15 countByEnumeratingWithState:&v94 objects:v106 count:16];
            }

            while (v17);
          }
        }

        id v10 = [obj countByEnumeratingWithState:&v98 objects:v107 count:16];
      }

      while (v10);
    }

    else
    {
      BOOL v11 = 0;
      __int128 v12 = 0LL;
    }

    id v23 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    id v24 = [v12 parentLayer];
    id v25 = [v24 countOfEffectContainers];
    if ((uint64_t)v25 <= 3)
    {
      internal = v71->_internal;
      goto LABEL_70;
    }

    id v26 = v25;
    v68 = v24;
    [v12 startTime];
    double v28 = a4 - v27;
    [v12 duration];
    double v30 = v29 - v28;
    id v31 = (char *)[v12 index];
    if (v30 >= 3.0) {
      id v32 = v31 + 1;
    }
    else {
      id v32 = v31 + 2;
    }
    obja = (char *)[v12 index];
    uint64_t v33 = -2LL;
    if (!v11) {
      uint64_t v33 = -1LL;
    }
    uint64_t v69 = v33;
    __int128 v76 = +[NSIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndexesInRange:",  v32,  v26 - v32);
    id v66 = v32;
    if ((uint64_t)v26 > (uint64_t)v32)
    {
      id v35 = objc_msgSend(objc_msgSend(v68, "effectContainers"), "objectsAtIndexes:", v76);
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      id v36 = [v35 countByEnumeratingWithState:&v90 objects:v105 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v91;
        do
        {
          for (k = 0LL; k != v37; k = (char *)k + 1)
          {
            if (*(void *)v91 != v38) {
              objc_enumerationMutation(v35);
            }
            __int128 v40 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)k);
            __int128 v86 = 0u;
            __int128 v87 = 0u;
            __int128 v88 = 0u;
            __int128 v89 = 0u;
            id v41 = objc_msgSend(v40, "effects", v66);
            id v42 = [v41 countByEnumeratingWithState:&v86 objects:v104 count:16];
            if (v42)
            {
              id v43 = v42;
              uint64_t v44 = *(void *)v87;
              do
              {
                for (m = 0LL; m != v43; m = (char *)m + 1)
                {
                  if (*(void *)v87 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  objc_msgSend( v23,  "addObjectsFromArray:",  objc_msgSend(*(id *)(*((void *)&v86 + 1) + 8 * (void)m), "videoPaths"));
                }

                id v43 = [v41 countByEnumeratingWithState:&v86 objects:v104 count:16];
              }

              while (v43);
            }
          }

          id v37 = [v35 countByEnumeratingWithState:&v90 objects:v105 count:16];
        }

        while (v37);
      }
    }

    *(float *)&double v34 = a3;
    __int128 v46 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v34, v66);
    __int128 v47 = v71;
    -[MPLayerGroup setAuthoringOption:forKey:](v71, "setAuthoringOption:forKey:", v46, kMPAuthoringAspectRatio);
    id v48 = objc_msgSend(-[MPLayerGroup authoringOptions](v71, "authoringOptions"), "mutableCopy");
    __int128 v49 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL);
    [v48 setObject:v49 forKey:kMPAuthoringReorderMode];
    objc_msgSend( v48,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"skipEmptyContainerCheck");
    objc_msgSend( v48,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"keepTransitions");
    objc_msgSend( v48,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"fastInsert");
    objc_msgSend( v48,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"isChangingAspectRatio");
    [v48 removeObjectForKey:kMPAuthoringIntroEffectID];
    if ([v23 count])
    {
      objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "removeSlidesAtIndicies:inDocument:withOptions:",  v76,  -[MPLayerGroup parentDocument](v71, "parentDocument"),  v48);
      objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "insertVideoPaths:atIndex:inDocument:withOptions:",  v23,  v67,  -[MPLayerGroup parentDocument](v71, "parentDocument"),  v48);
    }

    unint64_t v50 = (unint64_t)&obja[v69];
    id v51 = -[MPLayerGroup authoringOptionForKey:]( v71,  "authoringOptionForKey:",  kMPAuthoringAuthorOldEffectsOnAspectRatioChange);
    if (v51)
    {
      unsigned int v52 = [v51 BOOLValue] ^ 1;
      if ((v50 & 0x8000000000000000LL) != 0) {
        goto LABEL_69;
      }
    }

    else
    {
      LOBYTE(v52) = 0;
      if ((v50 & 0x8000000000000000LL) != 0)
      {
LABEL_69:
        [v12 startTime];
        a4 = v28 + v64;

        internal = v47->_internal;
        goto LABEL_70;
      }
    }

    if ((v52 & 1) == 0)
    {
      id v77 = v48;
      BOOL objb = objc_msgSend(objc_msgSend(objc_msgSend(v68, "effectContainers"), "objectAtIndex:", 0), "countOfEffects") == 0;
      __int128 v70 = +[NSIndexSet indexSetWithIndexesInRange:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndexesInRange:");
      id v53 = objc_msgSend(objc_msgSend(v68, "effectContainers"), "objectsAtIndexes:", v70);
      [v23 removeAllObjects];
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      id v54 = [v53 countByEnumeratingWithState:&v82 objects:v103 count:16];
      if (v54)
      {
        id v55 = v54;
        uint64_t v56 = *(void *)v83;
        do
        {
          for (n = 0LL; n != v55; n = (char *)n + 1)
          {
            if (*(void *)v83 != v56) {
              objc_enumerationMutation(v53);
            }
            __int128 v58 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)n);
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            __int128 v80 = 0u;
            __int128 v81 = 0u;
            id v59 = [v58 effects];
            id v60 = [v59 countByEnumeratingWithState:&v78 objects:v102 count:16];
            if (v60)
            {
              id v61 = v60;
              uint64_t v62 = *(void *)v79;
              do
              {
                for (iid i = 0LL; ii != v61; iid i = (char *)ii + 1)
                {
                  if (*(void *)v79 != v62) {
                    objc_enumerationMutation(v59);
                  }
                  objc_msgSend( v23,  "addObjectsFromArray:",  objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * (void)ii), "videoPaths"));
                }

                id v61 = [v59 countByEnumeratingWithState:&v78 objects:v102 count:16];
              }

              while (v61);
            }
          }

          id v55 = [v53 countByEnumeratingWithState:&v82 objects:v103 count:16];
        }

        while (v55);
      }

      __int128 v47 = v71;
      id v48 = v77;
      objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "removeSlidesAtIndicies:inDocument:withOptions:",  v70,  -[MPLayerGroup parentDocument](v71, "parentDocument"),  v77);
      objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "insertVideoPaths:atIndex:inDocument:withOptions:",  v23,  objb,  -[MPLayerGroup parentDocument](v71, "parentDocument"),  v77);
    }

    goto LABEL_69;
  }

  *(float *)&double v8 = a3;
  unint64_t v21 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8);
  -[MPLayerGroup setAuthoringOption:forKey:](self, "setAuthoringOption:forKey:", v21, kMPAuthoringAspectRatio);
  objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "cleanup");
  internal = self->_internal;
LABEL_70:
  -[NSRecursiveLock unlock](-[MPLayerGroupInternal liveLock](internal, "liveLock"), "unlock");
  return a4;
}

- (void)setUsedAllPaths:(BOOL)a3
{
}

- (void)setLastSlideUsed:(int64_t)a3
{
  id v5 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  -[MPLayerGroup authoringOptions](self, "authoringOptions"));
  id v6 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3);
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, kMPAuthoringLiveSlideIndex);
  -[MPLayerGroup setAuthoringOptions:](self, "setAuthoringOptions:", v5);

  -[NSRecursiveLock unlock](-[MPLayerGroupInternal liveLock](self->_internal, "liveLock"), "unlock");
}

- (int64_t)lastSlideUsed
{
  id v2 = -[MPLayerGroup authoringOptions](self, "authoringOptions");
  int64_t result = (int64_t)[v2 objectForKey:kMPAuthoringLiveSlideIndex];
  if (result) {
    return (int64_t)[(id)result integerValue];
  }
  return result;
}

- (void)setIsDocumentLayerGroup:(BOOL)a3
{
}

- (id)actionableObjectForID:(id)a3
{
  if (self->_layerDictionary) {
    layers = (NSMutableArray *)-[NSMutableDictionary allValues](self->_layerDictionary, "allValues");
  }
  else {
    layers = self->_layers;
  }
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v35,  v41,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v36;
  double v8 = &off_26E000;
LABEL_6:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v36 != v7) {
      objc_enumerationMutation(layers);
    }
    id v10 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
    if ([v10 conformsToProtocol:v8[351]])
    {
      id v11 = [v10 actionableObjectForID:a3];
      if (v11) {
        return v11;
      }
    }

    else
    {
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v12 = [v10 effectContainers];
      id v13 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v32;
        uint64_t v23 = v7;
        id v24 = layers;
        uint64_t v25 = *(void *)v32;
        id v26 = v12;
LABEL_15:
        id v16 = 0LL;
        while (1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          id v10 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v16);
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          id v17 = [v10 effects];
          id v18 = [v17 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v28;
LABEL_21:
            uint64_t v21 = 0LL;
            while (1)
            {
              if (*(void *)v28 != v20) {
                objc_enumerationMutation(v17);
              }
              id v10 = *(void **)(*((void *)&v27 + 1) + 8 * v21);
              if (v19 == (id)++v21)
              {
                id v19 = [v17 countByEnumeratingWithState:&v27 objects:v39 count:16];
                if (v19) {
                  goto LABEL_21;
                }
                break;
              }
            }
          }

          id v16 = (char *)v16 + 1;
          uint64_t v15 = v25;
          id v12 = v26;
          if (v16 == v14)
          {
            id v14 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
            uint64_t v7 = v23;
            layers = v24;
            double v8 = &off_26E000;
            if (v14) {
              goto LABEL_15;
            }
            break;
          }
        }
      }
    }

    if ((id)++v9 == v6)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v35,  v41,  16LL);
      id v10 = 0LL;
      if (v6) {
        goto LABEL_6;
      }
      return v10;
    }
  }

- (id)layerKeyDictionary
{
  return -[MPLayerGroupInternal layerKeyDictionary](self->_internal, "layerKeyDictionary");
}

- (BOOL)detectFacesInBackground
{
  id v2 = -[MPLayerGroup authoringOptionForKey:](self, "authoringOptionForKey:", kMPAuthoringDetectFacesInBackground);
  if (v2) {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (int64_t)countOfLayers
{
  return (int64_t)-[NSMutableArray count](self->_layers, "count");
}

- (id)objectInLayersAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:", a3);
}

- (id)valueInLayersWithName:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  layers = self->_layers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(layers);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)insertObject:(id)a3 inLayersAtIndex:(int64_t)a4
{
}

- (void)removeObjectFromLayersAtIndex:(int64_t)a3
{
}

- (void)replaceObjectInLayersAtIndex:(int64_t)a3 withObject:(id)a4
{
}

@end