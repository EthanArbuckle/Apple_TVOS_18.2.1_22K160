@interface MPNavigator
- (BOOL)isTriggered;
- (BOOL)startsPaused;
- (CGPoint)position;
- (CGSize)size;
- (MPNavigator)init;
- (NSString)initialLayer;
- (double)duration;
- (double)numberOfLoops;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)rotationAngle;
- (double)scale;
- (double)timeIn;
- (double)xRotationAngle;
- (double)yRotationAngle;
- (double)zPosition;
- (id)actionForKey:(id)a3;
- (id)actionableObjectForID:(id)a3;
- (id)actions;
- (id)allSlides:(BOOL)a3;
- (id)allSongs;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layerForKey:(id)a3;
- (id)layerKey;
- (id)layerKeyDictionary;
- (id)layers;
- (id)navigatorKey;
- (id)objectID;
- (id)parent;
- (id)parentDocument;
- (id)plug;
- (id)plugID;
- (id)uuid;
- (int64_t)zIndex;
- (void)cleanup;
- (void)configureActions;
- (void)copyActions:(id)a3;
- (void)copyAnimationPaths:(id)a3;
- (void)copyLayers:(id)a3;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)reconnectAll;
- (void)removeActionForKey:(id)a3;
- (void)removeAllLayers;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeLayerForKey:(id)a3;
- (void)setAction:(id)a3 forKey:(id)a4;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setContainer:(id)a3;
- (void)setDuration:(double)a3;
- (void)setInitialLayer:(id)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setLayer:(id)a3 forKey:(id)a4;
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
- (void)setXRotationAngle:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZIndex:(int64_t)a3;
- (void)setZPosition:(double)a3;
@end

@implementation MPNavigator

- (MPNavigator)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPNavigator;
  v2 = -[MPNavigator init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MPNavigatorInternal);
    v2->_animationPaths = 0LL;
    v2->_layers = 0LL;
    v2->_actions = 0LL;
    v2->_internal = v3;
    -[MPNavigatorInternal setUuid:]( v2->_internal,  "setUuid:",  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"));
    -[MPNavigatorInternal setLayerKeyDictionary:]( v2->_internal,  "setLayerKeyDictionary:",  objc_alloc_init(&OBJC_CLASS___NSMutableDictionary));
    -[MPNavigatorInternal setStartPlugID:](v2->_internal, "setStartPlugID:", 0LL);
    -[MPNavigatorInternal setOpacity:](v2->_internal, "setOpacity:", 1.0);
    -[MPNavigatorInternal setPosition:](v2->_internal, "setPosition:", CGPointZero.x, CGPointZero.y);
    -[MPNavigatorInternal setZPosition:](v2->_internal, "setZPosition:", 0.0);
    -[MPNavigatorInternal setSize:](v2->_internal, "setSize:", 2.0, 2.0);
    -[MPNavigatorInternal setXRotationAngle:](v2->_internal, "setXRotationAngle:", 0.0);
    -[MPNavigatorInternal setYRotationAngle:](v2->_internal, "setYRotationAngle:", 0.0);
    -[MPNavigatorInternal setYRotationAngle:](v2->_internal, "setYRotationAngle:", 0.0);
    -[MPNavigatorInternal setScale:](v2->_internal, "setScale:", 1.0);
    -[MPNavigatorInternal setZIndex:](v2->_internal, "setZIndex:", 0LL);
    -[MPNavigatorInternal setNumberOfLoops:](v2->_internal, "setNumberOfLoops:", 1.0);
    -[MPNavigatorInternal setDuration:](v2->_internal, "setDuration:", 10000000.0);
    -[MPNavigatorInternal setTimeIn:](v2->_internal, "setTimeIn:", 0.0);
    -[MPNavigatorInternal setStartsPaused:](v2->_internal, "setStartsPaused:", 0LL);
    -[MPNavigatorInternal setIsTriggered:](v2->_internal, "setIsTriggered:", 0LL);
    -[MPNavigatorInternal setPhaseInDuration:](v2->_internal, "setPhaseInDuration:", 0.0);
    -[MPNavigatorInternal setPhaseOutDuration:](v2->_internal, "setPhaseOutDuration:", 0.0);
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copyStruct:self->_internal];
  [v4 copyLayers:self->_layers];
  [v4 copyAnimationPaths:self->_animationPaths];
  [v4 copyActions:self->_actions];
  return v4;
}

- (void)dealloc
{
  self->_internal = 0LL;
  self->_navigator = 0LL;

  self->_plug = 0LL;
  self->_animationPaths = 0LL;

  self->_layers = 0LL;
  self->_actions = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPNavigator;
  -[MPNavigator dealloc](&v3, "dealloc");
}

- (id)navigatorKey
{
  id parent = self->_parent;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPNavigator, a2);
  if ((objc_opt_isKindOfClass(parent, v4) & 1) != 0) {
    return objc_msgSend( objc_msgSend(self->_parent, "layerKeyDictionary"),  "objectForKey:",  -[MPNavigator uuid](self, "uuid"));
  }
  else {
    return 0LL;
  }
}

- (id)parent
{
  return self->_parent;
}

- (id)layerKey
{
  if (objc_msgSend(-[MPNavigator parent](self, "parent"), "layersCanPositionZIndex")) {
    return objc_msgSend( objc_msgSend(-[MPNavigator parent](self, "parent"), "layerKeyDictionary"),  "objectForKey:",  -[MPNavigator uuid](self, "uuid"));
  }
  else {
    return 0LL;
  }
}

- (id)layerForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:", a3);
}

- (void)setLayer:(id)a3 forKey:(id)a4
{
  if (-[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:", a4)) {
    -[MPNavigator removeLayerForKey:](self, "removeLayerForKey:", a4);
  }
  if (!self->_layers) {
    self->_layers = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  [a3 setParent:self];
  -[NSMutableDictionary setObject:forKey:](self->_layers, "setObject:forKey:", a3, a4);
  -[NSMutableDictionary setObject:forKey:]( -[MPNavigatorInternal layerKeyDictionary](self->_internal, "layerKeyDictionary"),  "setObject:forKey:",  a4,  [a3 uuid]);
  if (self->_navigator)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPNavigator, v7);
    char isKindOfClass = objc_opt_isKindOfClass(a3, v8);
    id v10 = objc_msgSend(-[MPNavigator parentDocument](self, "parentDocument"), "montage");
    if ((isKindOfClass & 1) != 0)
    {
      id v11 = [v10 createNavigatorContainer];
      id v12 = -[MCContainerNavigator setPlugForContainer:forID:](self->_navigator, "setPlugForContainer:forID:", v11, a4);
      [a3 setContainer:v11];
      [a3 setPlug:v12];
    }

    else
    {
      id v13 = [v10 createParallelizerContainer];
      id v14 = -[MCContainerNavigator setPlugForContainer:forID:](self->_navigator, "setPlugForContainer:forID:", v13, a4);
      [a3 setContainer:v13];
      [a3 setPlug:v14];
      [a3 resetDuration];
    }

    objc_msgSend(-[MPNavigator parentDocument](self, "parentDocument"), "configureActions");
  }

- (void)removeLayerForKey:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:");
  v6 = v5;
  if (self->_navigator)
  {
    id v7 = [v5 plug];
    if (v7) {
      -[MCContainerNavigator removePlug:](self->_navigator, "removePlug:", v7);
    }
  }

  [v6 setPlug:0];
  [v6 setContainer:0];
  [v6 setParent:0];
  -[NSMutableDictionary removeObjectForKey:]( -[MPNavigatorInternal layerKeyDictionary](self->_internal, "layerKeyDictionary"),  "removeObjectForKey:",  [v6 uuid]);
  -[NSMutableDictionary removeObjectForKey:](self->_layers, "removeObjectForKey:", a3);
  if (-[NSString isEqualToString:]( -[MPNavigatorInternal startPlugID](self->_internal, "startPlugID"),  "isEqualToString:",  a3))
  {
    if (-[NSMutableDictionary count](self->_layers, "count")) {
      id v8 = objc_msgSend(-[NSMutableDictionary allKeys](self->_layers, "allKeys"), "objectAtIndex:", 0);
    }
    else {
      id v8 = 0LL;
    }
    -[MPNavigator setInitialLayer:](self, "setInitialLayer:", v8);
  }

- (void)removeAllLayers
{
  id v3 = -[NSMutableDictionary copy](self->_layers, "copy");
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
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MPNavigator removeLayerForKey:]( self,  "removeLayerForKey:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (NSString)initialLayer
{
  return -[MPNavigatorInternal startPlugID](self->_internal, "startPlugID");
}

- (void)setInitialLayer:(id)a3
{
  navigator = self->_navigator;
  if (navigator)
  {
    if (a3)
    {
      id v6 = objc_msgSend( objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:", a3), "plug"),  "idInSupercontainer");
      navigator = self->_navigator;
    }

    else
    {
      id v6 = 0LL;
    }

    -[MCContainerNavigator setStartPlugID:](navigator, "setStartPlugID:", v6);
  }

- (id)layers
{
  return self->_layers;
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
    id v7 = -[MPNavigator animationPathForKey:](self, "animationPathForKey:", a4);
    if (v7)
    {
      __int128 v8 = v7;
      [v7 setParent:0];
      [v8 setAnimationPath:0];
    }

    if (!self->_animationPaths) {
      self->_animationPaths = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    [a3 setParent:self];
    -[NSMutableDictionary setObject:forKey:](self->_animationPaths, "setObject:forKey:", a3, a4);
    plug = self->_plug;
    if (plug)
    {
      -[MCPlug removeAnimationPathForKey:](plug, "removeAnimationPathForKey:", a4);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v10);
      char isKindOfClass = objc_opt_isKindOfClass(a3, v11);
      id v13 = off_24C620;
      if ((isKindOfClass & 1) == 0) {
        id v13 = off_24C628;
      }
      id v14 = -[__objc2_class animationPathWithKey:](*v13, "animationPathWithKey:", a4);
      -[MCPlug addAnimationPath:](self->_plug, "addAnimationPath:", v14);
      [a3 setAnimationPath:v14];
    }
  }

  else
  {
    -[MPNavigator removeAnimationPathForKey:](self, "removeAnimationPathForKey:", a4);
  }

- (void)removeAnimationPathForKey:(id)a3
{
  id v6 = -[MPNavigator animationPathForKey:](self, "animationPathForKey:");
  plug = self->_plug;
  if (plug)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v5);
    if ((objc_opt_isKindOfClass(plug, v8) & 1) != 0)
    {
      -[MCPlug removeAnimationPathForKey:](self->_plug, "removeAnimationPathForKey:", a3);
      [v6 setAnimationPath:0];
    }
  }

  [v6 setParent:0];
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
      -[MCPlug setOpacity:](self->_plug, "setOpacity:", a3);
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
  -[MPNavigatorInternal setPosition:](self->_internal, "setPosition:");
  plug = self->_plug;
  if (plug)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v6);
    if ((objc_opt_isKindOfClass(plug, v8) & 1) != 0) {
      -[MCPlug setPosition:](self->_plug, "setPosition:", x, y);
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
      -[MCPlug setZPosition:](self->_plug, "setZPosition:", a3);
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
      -[MCPlug setRotationAngle:](self->_plug, "setRotationAngle:", a3);
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
  -[MPNavigatorInternal setSize:](self->_internal, "setSize:");
  plug = self->_plug;
  if (plug)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v6);
    if ((objc_opt_isKindOfClass(plug, v8) & 1) != 0) {
      -[MCPlug setSize:](self->_plug, "setSize:", width, height);
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
      -[MCPlug setXRotationAngle:](self->_plug, "setXRotationAngle:", a3);
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
      -[MCPlug setYRotationAngle:](self->_plug, "setYRotationAngle:", a3);
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
      -[MCPlug setScale:](self->_plug, "setScale:", a3);
    }
  }

- (int64_t)zIndex
{
  plug = self->_plug;
  if (plug) {
    return (int)-[MCPlug zIndex](plug, "zIndex");
  }
  else {
    return -[MPNavigatorInternal zIndex](self->_internal, "zIndex");
  }
}

- (void)setZIndex:(int64_t)a3
{
  __int16 v3 = a3;
  -[MPNavigatorInternal setZIndex:](self->_internal, "setZIndex:");
  if (objc_msgSend(-[MPNavigator parent](self, "parent"), "layersCanPositionZIndex"))
  {
    plug = self->_plug;
    if (plug) {
      -[MCPlug setZIndex:](plug, "setZIndex:", v3);
    }
  }

- (double)timeIn
{
  return result;
}

- (void)setTimeIn:(double)a3
{
  plug = self->_plug;
  if (plug)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v5);
    if ((objc_opt_isKindOfClass(plug, v7) & 1) != 0) {
      -[MCPlug setTimeIn:](self->_plug, "setTimeIn:", a3);
    }
  }

- (double)duration
{
  return result;
}

- (void)setDuration:(double)a3
{
  if (self->_plug)
  {
    -[MPNavigatorInternal phaseInDuration](self->_internal, "phaseInDuration");
    double v6 = a3 - v5;
    -[MPNavigatorInternal phaseOutDuration](self->_internal, "phaseOutDuration");
    double v8 = v6 - v7;
    if (v8 < 0.0) {
      double v8 = 0.0;
    }
    -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v8);
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
    -[MPNavigatorInternal duration](self->_internal, "duration");
    double v7 = v6;
    -[MPNavigatorInternal phaseInDuration](self->_internal, "phaseInDuration");
    double v9 = v7 - v8;
    -[MPNavigatorInternal phaseOutDuration](self->_internal, "phaseOutDuration");
    double v11 = v9 - v10;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v11);
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
    -[MPNavigatorInternal duration](self->_internal, "duration");
    double v7 = v6;
    -[MPNavigatorInternal phaseInDuration](self->_internal, "phaseInDuration");
    double v9 = v7 - v8;
    -[MPNavigatorInternal phaseOutDuration](self->_internal, "phaseOutDuration");
    double v11 = v9 - v10;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v11);
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
    -[MPNavigatorInternal duration](self->_internal, "duration");
    double v7 = v6;
    -[MPNavigatorInternal phaseInDuration](self->_internal, "phaseInDuration");
    double v9 = v7 - v8;
    -[MPNavigatorInternal phaseOutDuration](self->_internal, "phaseOutDuration");
    double v11 = v9 - v10;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v11);
  }

- (BOOL)isTriggered
{
  return -[MPNavigatorInternal isTriggered](self->_internal, "isTriggered");
}

- (void)setIsTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPNavigatorInternal setIsTriggered:](self->_internal, "setIsTriggered:");
  plug = self->_plug;
  if (plug)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v5);
    if ((objc_opt_isKindOfClass(plug, v7) & 1) != 0) {
      -[MCPlug setIsTriggered:](self->_plug, "setIsTriggered:", v3);
    }
  }

- (BOOL)startsPaused
{
  return -[MPNavigatorInternal startsPaused](self->_internal, "startsPaused");
}

- (void)setStartsPaused:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPNavigatorInternal setStartsPaused:](self->_internal, "setStartsPaused:");
  plug = self->_plug;
  if (plug) {
    -[MCPlug setStartsPaused:](plug, "setStartsPaused:", v3);
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
    id v7 = -[MPNavigator actionForKey:](self, "actionForKey:", a4);
    if (v7) {
      [v7 setParent:0];
    }
    if (!self->_actions) {
      self->_actions = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
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
    -[MPNavigator removeActionForKey:](self, "removeActionForKey:", a4);
  }

- (void)removeActionForKey:(id)a3
{
  id v5 = -[MPNavigator actionForKey:](self, "actionForKey:");
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

- (id)allSlides:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  layers = self->_layers;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(layers);
        }
        objc_msgSend( v5,  "addObjectsFromArray:",  objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_layers,  "objectForKey:",  *(void *)(*((void *)&v12 + 1) + 8 * (void)i)),  "allSlides:",  v3));
      }

      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (id)allSongs
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  layers = self->_layers;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(layers);
        }
        objc_msgSend( v3,  "addObjectsFromArray:",  objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_layers,  "objectForKey:",  *(void *)(*((void *)&v10 + 1) + 8 * (void)i)),  "allSongs"));
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)parentDocument
{
  id v2 = -[MPNavigator parent](self, "parent");
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
  return -[MCPlug idInSupercontainer](self->_plug, "idInSupercontainer");
}

- (id)objectID
{
  return -[MCObject objectID](self->_plug, "objectID");
}

- (id)uuid
{
  return -[MPNavigatorInternal uuid](self->_internal, "uuid");
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parent)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"A layer may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPNavigator configureActions](v4, v5);
  }

  else
  {
    self->_id parent = a3;
    if (!-[MPNavigatorInternal uuid](self->_internal, "uuid")) {
      -[MPNavigatorInternal setUuid:]( self->_internal,  "setUuid:",  +[MPUtilities stringWithNewUUID](&OBJC_CLASS___MPUtilities, "stringWithNewUUID"));
    }
  }

- (void)configureActions
{
  if (-[MPNavigator parentDocument](self, "parentDocument")
    && (objc_msgSend(-[MPNavigator parentDocument](self, "parentDocument"), "isInBatchModify") & 1) == 0)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    layers = self->_layers;
    id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(layers);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_layers,  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)i)),  "configureActions");
        }

        id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v17,  v22,  16LL);
      }

      while (v5);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    actions = self->_actions;
    id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (j = 0LL; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(actions);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_actions,  "objectForKey:",  *(void *)(*((void *)&v13 + 1) + 8 * (void)j)),  "configureTarget");
        }

        id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v13,  v21,  16LL);
      }

      while (v10);
    }
  }

- (void)setContainer:(id)a3
{
  navigator = self->_navigator;
  if (navigator)
  {
    -[MCContainer specialRelease](navigator, "specialRelease");
    self->_navigator = 0LL;
  }

  self->_navigator = (MCContainerNavigator *)[a3 specialRetain];
}

- (void)setPlug:(id)a3
{
  plug = self->_plug;
  if (plug)
  {

    self->_plug = 0LL;
  }

  uint64_t v6 = (MCPlug *)a3;
  self->_plug = v6;
  if (v6)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v7);
    if ((objc_opt_isKindOfClass(a3, v8) & 1) != 0)
    {
      -[MPNavigator size](self, "size");
      -[MCPlug setSize:](self->_plug, "setSize:");
      -[MPNavigator position](self, "position");
      -[MCPlug setPosition:](self->_plug, "setPosition:");
      -[MCPlug setAudioPriority:](self->_plug, "setAudioPriority:", 2LL);
      -[MPNavigator zPosition](self, "zPosition");
      -[MCPlug setZPosition:](self->_plug, "setZPosition:");
      -[MPNavigator rotationAngle](self, "rotationAngle");
      -[MCPlug setRotationAngle:](self->_plug, "setRotationAngle:");
      -[MPNavigator xRotationAngle](self, "xRotationAngle");
      -[MCPlug setXRotationAngle:](self->_plug, "setXRotationAngle:");
      -[MPNavigator yRotationAngle](self, "yRotationAngle");
      -[MCPlug setYRotationAngle:](self->_plug, "setYRotationAngle:");
      -[MPNavigator scale](self, "scale");
      -[MCPlug setScale:](self->_plug, "setScale:");
      -[MPNavigator opacity](self, "opacity");
      -[MCPlug setOpacity:](self->_plug, "setOpacity:");
      -[MPNavigator timeIn](self, "timeIn");
      -[MCPlug setTimeIn:](self->_plug, "setTimeIn:");
      -[MCPlug setIsTriggered:](self->_plug, "setIsTriggered:", -[MPNavigator isTriggered](self, "isTriggered"));
      if (objc_msgSend(-[MPNavigator parent](self, "parent"), "layersCanPositionZIndex")) {
        -[MCPlug setZIndex:]( self->_plug,  "setZIndex:",  (__int16)-[MPNavigatorInternal zIndex](self->_internal, "zIndex"));
      }
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      animationPaths = self->_animationPaths;
      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v83,  v92,  16LL);
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v84;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v84 != v12) {
              objc_enumerationMutation(animationPaths);
            }
            uint64_t v14 = *(void *)(*((void *)&v83 + 1) + 8LL * (void)i);
            id v15 = -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", v14);
            uint64_t v17 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v16);
            if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0) {
              __int128 v18 = off_24C620;
            }
            else {
              __int128 v18 = off_24C628;
            }
            id v19 = -[__objc2_class animationPathWithKey:](*v18, "animationPathWithKey:", v14);
            -[MCPlug addAnimationPath:](self->_plug, "addAnimationPath:", v19);
            [v15 setAnimationPath:v19];
          }

          id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v83,  v92,  16LL);
        }

        while (v11);
      }

      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      actions = self->_actions;
      id v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v79,  v91,  16LL);
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v80;
        do
        {
          for (j = 0LL; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v80 != v23) {
              objc_enumerationMutation(actions);
            }
            uint64_t v25 = *(void *)(*((void *)&v79 + 1) + 8LL * (void)j);
            id v26 = -[NSMutableDictionary objectForKey:](self->_actions, "objectForKey:", v25);
            objc_msgSend( v26,  "setAction:",  +[MPUtilities createMCAction:forPlug:withKey:]( MPUtilities,  "createMCAction:forPlug:withKey:",  v26,  self->_plug,  v25));
          }

          id v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v79,  v91,  16LL);
        }

        while (v22);
      }
    }

    -[MPNavigatorInternal duration](self->_internal, "duration");
    double v28 = v27;
    -[MPNavigatorInternal phaseInDuration](self->_internal, "phaseInDuration");
    double v30 = v28 - v29;
    -[MPNavigatorInternal phaseOutDuration](self->_internal, "phaseOutDuration");
    double v32 = v30 - v31;
    if (v32 < 0.0) {
      double v32 = 0.0;
    }
    -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:", v32);
    -[MPNavigatorInternal numberOfLoops](self->_internal, "numberOfLoops");
    -[MCPlug setNumberOfLoops:](self->_plug, "setNumberOfLoops:");
    -[MPNavigator phaseInDuration](self, "phaseInDuration");
    -[MCPlug setPhaseInDuration:](self->_plug, "setPhaseInDuration:");
    -[MPNavigator phaseOutDuration](self, "phaseOutDuration");
    -[MCPlug setPhaseOutDuration:](self->_plug, "setPhaseOutDuration:");
    -[MCPlug setStartsPaused:](self->_plug, "setStartsPaused:", -[MPNavigator startsPaused](self, "startsPaused"));
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    layers = self->_layers;
    id v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v75,  v90,  16LL);
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v76;
      do
      {
        for (k = 0LL; k != v35; k = (char *)k + 1)
        {
          if (*(void *)v76 != v36) {
            objc_enumerationMutation(layers);
          }
          uint64_t v38 = *(void *)(*((void *)&v75 + 1) + 8LL * (void)k);
          id v39 = -[NSMutableDictionary objectForKey:](self->_layers, "objectForKey:", v38);
          uint64_t v41 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v40);
          if ((objc_opt_isKindOfClass(v39, v41) & 1) != 0)
          {
            id v43 = objc_msgSend( objc_msgSend(-[MPNavigator parentDocument](self, "parentDocument"), "montage"),  "createParallelizerContainer");
          }

          else
          {
            uint64_t v44 = objc_opt_class(&OBJC_CLASS___MPNavigator, v42);
            if ((objc_opt_isKindOfClass(v39, v44) & 1) == 0) {
              continue;
            }
            id v43 = objc_msgSend( objc_msgSend(-[MPNavigator parentDocument](self, "parentDocument"), "montage"),  "createNavigatorContainer");
          }

          id v45 = v43;
          id v46 = -[MCContainerNavigator setPlugForContainer:forID:]( self->_navigator,  "setPlugForContainer:forID:",  v43,  v38);
          [v39 setContainer:v45];
          [v39 setPlug:v46];
        }

        id v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v75,  v90,  16LL);
      }

      while (v35);
    }

    if (-[MPNavigatorInternal startPlugID](self->_internal, "startPlugID")) {
      -[MCContainerNavigator setStartPlugID:]( self->_navigator,  "setStartPlugID:",  objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_layers,  "objectForKey:",  -[MPNavigatorInternal startPlugID](self->_internal, "startPlugID")),  "plug"),  "idInSupercontainer"));
    }
    -[MPNavigator configureActions](self, "configureActions");
  }

  else
  {
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id v47 = -[NSMutableDictionary allValues](self->_layers, "allValues");
    id v48 = [v47 countByEnumeratingWithState:&v71 objects:v89 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v72;
      do
      {
        for (m = 0LL; m != v49; m = (char *)m + 1)
        {
          if (*(void *)v72 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)m);
          [v52 setPlug:0];
          [v52 setContainer:0];
        }

        id v49 = [v47 countByEnumeratingWithState:&v71 objects:v89 count:16];
      }

      while (v49);
    }

    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    v53 = self->_animationPaths;
    id v54 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v67,  v88,  16LL);
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v68;
      do
      {
        for (n = 0LL; n != v55; n = (char *)n + 1)
        {
          if (*(void *)v68 != v56) {
            objc_enumerationMutation(v53);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_animationPaths,  "objectForKey:",  *(void *)(*((void *)&v67 + 1) + 8 * (void)n)),  "setAnimationPath:",  0);
        }

        id v55 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v67,  v88,  16LL);
      }

      while (v55);
    }

    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    v58 = self->_actions;
    id v59 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v58,  "countByEnumeratingWithState:objects:count:",  &v63,  v87,  16LL);
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v64;
      do
      {
        for (ii = 0LL; ii != v60; ii = (char *)ii + 1)
        {
          if (*(void *)v64 != v61) {
            objc_enumerationMutation(v58);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_actions,  "objectForKey:",  *(void *)(*((void *)&v63 + 1) + 8 * (void)ii)),  "setAction:",  0);
        }

        id v60 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v58,  "countByEnumeratingWithState:objects:count:",  &v63,  v87,  16LL);
      }

      while (v60);
    }
  }

- (void)cleanup
{
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v3 = -[NSMutableDictionary allValues](self->_layers, "allValues");
  id v4 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * (void)v7) cleanup];
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }

    while (v5);
  }

  -[MPNavigator removeAllLayers](self, "removeAllLayers");
  id v8 = -[NSMutableDictionary allKeys](self->_animationPaths, "allKeys");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        -[MPNavigator removeAnimationPathForKey:]( self,  "removeAnimationPathForKey:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)v12));
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }

    while (v10);
  }

  id v13 = -[NSMutableDictionary allKeys](self->_actions, "allKeys");
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[MPNavigator removeActionForKey:]( self,  "removeActionForKey:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v17));
        uint64_t v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }

    while (v15);
  }

  self->_id parent = 0LL;
}

- (void)copyStruct:(id)a3
{
}

- (void)copyLayers:(id)a3
{
  id v5 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v11 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v10), "copy");
        [v5 setObject:v11 forKey:v10];
      }

      id v7 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v7);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v12 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v5);
        }
        -[MPNavigator setLayer:forKey:]( self,  "setLayer:forKey:",  [v5 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * (void)j)],  *(void *)(*((void *)&v16 + 1) + 8 * (void)j));
      }

      id v13 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }

    while (v13);
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
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        -[MPNavigator setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v10, v9);
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
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        -[MPNavigator setAction:forKey:](self, "setAction:forKey:", v10, v9);
      }

      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

- (void)reconnectAll
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  layers = self->_layers;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(layers);
        }
        objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_layers,  "objectForKey:",  *(void *)(*((void *)&v8 + 1) + 8 * (void)i)),  "reconnectAll");
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

- (id)actionableObjectForID:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  layers = self->_layers;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (!v6) {
    return 0LL;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(layers);
    }
    id v10 = -[NSMutableDictionary objectForKey:]( self->_layers,  "objectForKey:",  *(void *)(*((void *)&v13 + 1) + 8 * v9));
    id v11 = [v10 actionableObjectForID:a3];
    if (v11) {
      return v11;
    }
    if (v7 == (id)++v9)
    {
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( layers,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      id v10 = 0LL;
      if (v7) {
        goto LABEL_3;
      }
      return v10;
    }
  }

- (id)layerKeyDictionary
{
  return -[MPNavigatorInternal layerKeyDictionary](self->_internal, "layerKeyDictionary");
}

@end