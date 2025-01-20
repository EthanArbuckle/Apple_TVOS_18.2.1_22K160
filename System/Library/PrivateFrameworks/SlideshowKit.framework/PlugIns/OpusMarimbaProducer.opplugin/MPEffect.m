@interface MPEffect
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)effectWithEffectID:(id)a3;
+ (id)effectWithEffectID:(id)a3 andPaths:(id)a4;
+ (id)effectWithEffectID:(id)a3 andStrings:(id)a4;
+ (id)effectWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5;
- (BOOL)hasMovies;
- (BOOL)hasPanoramasInDocument:(id)a3;
- (BOOL)isLive;
- (BOOL)isTextOnly;
- (BOOL)needsParallelizer;
- (BOOL)replaceSlides;
- (BOOL)supportsEffectTiming;
- (BOOL)supportsUnlimitedSlides;
- (CGPoint)position;
- (CGSize)size;
- (MPEffect)init;
- (MPEffect)initWithEffectID:(id)a3;
- (MPEffect)initWithEffectID:(id)a3 andPaths:(id)a4;
- (MPEffect)initWithEffectID:(id)a3 andStrings:(id)a4;
- (MPEffect)initWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5;
- (MZEffectTiming)effectTiming;
- (NSArray)slides;
- (NSArray)texts;
- (NSString)effectID;
- (NSString)presetID;
- (double)fullDuration;
- (double)height;
- (double)lowestDisplayTime;
- (double)mainDuration;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)rotationAngle;
- (double)scale;
- (double)xRotationAngle;
- (double)yPosition;
- (double)yRotationAngle;
- (double)zPosition;
- (id)_effectAttributes;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)audioPlaylist;
- (id)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectAttributeForKey:(id)a3;
- (id)effectPresetID;
- (id)filters;
- (id)formattedAttributes;
- (id)fullDebugLog;
- (id)nearestLayerGroup;
- (id)nearestPlug;
- (id)objectID;
- (id)objectInFiltersAtIndex:(int64_t)a3;
- (id)objectInSlidesAtIndex:(int64_t)a3;
- (id)objectInTextsAtIndex:(int64_t)a3;
- (id)parentContainer;
- (id)parentDocument;
- (id)plug;
- (id)plugID;
- (id)scriptingAnimations;
- (id)secondarySlides;
- (id)slideForMCSlide:(id)a3;
- (id)slideInformationWithDocument:(id)a3;
- (id)uuid;
- (id)videoPaths;
- (int64_t)audioPriority;
- (int64_t)countOfFilters;
- (int64_t)countOfSlides;
- (int64_t)countOfTexts;
- (int64_t)liveIndex;
- (int64_t)maxNumberOfSecondarySlides;
- (int64_t)maxNumberOfSlides;
- (int64_t)randomSeed;
- (int64_t)zIndex;
- (void)_updateEffectTimingWithDocument:(id)a3;
- (void)_updateEffectTimingWithDocument:(id)a3 forExport:(BOOL)a4;
- (void)_updateTiming:(BOOL)a3;
- (void)_updateTiming:(BOOL)a3 forExport:(BOOL)a4;
- (void)addFilter:(id)a3;
- (void)addFilters:(id)a3;
- (void)addSecondarySlide:(id)a3;
- (void)addSecondarySlides:(id)a3;
- (void)addSlide:(id)a3;
- (void)addSlides:(id)a3;
- (void)addText:(id)a3;
- (void)addTexts:(id)a3;
- (void)applyFormattedAttributes;
- (void)cleanup;
- (void)copyAnimationPaths:(id)a3;
- (void)copyAudioPlaylist:(id)a3;
- (void)copyFilters:(id)a3;
- (void)copySecondarySlides:(id)a3;
- (void)copySlides:(id)a3;
- (void)copyTexts:(id)a3;
- (void)copyVars:(id)a3;
- (void)createSecondarySlidesWithPaths:(id)a3;
- (void)createSlidesWithPaths:(id)a3;
- (void)createTextsWithDefaultStrings;
- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4;
- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4 fillIn:(BOOL)a5;
- (void)dealloc;
- (void)dump;
- (void)insertFilters:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inFiltersAtIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inSlidesAtIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inTextsAtIndex:(int64_t)a4;
- (void)insertSecondarySlides:(id)a3 atIndex:(int64_t)a4;
- (void)insertSlides:(id)a3 atIndex:(int64_t)a4;
- (void)insertTexts:(id)a3 atIndex:(int64_t)a4;
- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)moveSlidesFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)moveTextsFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)reconfigureSlides;
- (void)removeAllFilters;
- (void)removeAllSecondarySlides;
- (void)removeAllSlides;
- (void)removeAllTexts;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeFiltersAtIndices:(id)a3;
- (void)removeObjectFromFiltersAtIndex:(int64_t)a3;
- (void)removeObjectFromSlidesAtIndex:(int64_t)a3;
- (void)removeObjectFromTextsAtIndex:(int64_t)a3;
- (void)removeSecondarySlidesAtIndices:(id)a3;
- (void)removeSlidesAtIndices:(id)a3;
- (void)removeTextsAtIndices:(id)a3;
- (void)replaceObjectInFiltersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceObjectInSlidesAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceObjectInTextsAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceSlide:(id)a3 atIndex:(int64_t)a4;
- (void)replaceSlideAtIndex:(int64_t)a3 withSlide:(id)a4;
- (void)replaceTextsWitStrings:(id)a3;
- (void)scaleMainDuration;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setAudioPlaylist:(id)a3;
- (void)setAudioPriority:(int64_t)a3;
- (void)setContainer:(id)a3;
- (void)setEffectAttribute:(id)a3 forKey:(id)a4;
- (void)setEffectAttributes:(id)a3;
- (void)setEffectID:(id)a3;
- (void)setFullDuration:(double)a3;
- (void)setHeight:(double)a3;
- (void)setLiveIndex:(int64_t)a3;
- (void)setMainDuration:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setParentContainer:(id)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPlug:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setPresetID:(id)a3;
- (void)setRandomSeed:(int64_t)a3;
- (void)setReplaceSlides:(BOOL)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setScriptingAnimations:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setSkipEffectTiming:(BOOL)a3;
- (void)setWidth:(double)a3;
- (void)setXPosition:(double)a3;
- (void)setXRotationAngle:(double)a3;
- (void)setYPosition:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZPosition:(double)a3;
- (void)updateEffectAttributes;
- (void)updateTiming;
- (void)updateTimingForExport;
@end

@implementation MPEffect

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  else {
    return [a3 isEqualToString:@"texts"] ^ 1;
  }
}

+ (id)effectWithEffectID:(id)a3
{
  return [objc_alloc((Class)a1) initWithEffectID:a3];
}

+ (id)effectWithEffectID:(id)a3 andPaths:(id)a4
{
  return [objc_alloc((Class)a1) initWithEffectID:a3 andPaths:a4];
}

+ (id)effectWithEffectID:(id)a3 andStrings:(id)a4
{
  return [objc_alloc((Class)a1) initWithEffectID:a3 andStrings:a4];
}

+ (id)effectWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5
{
  return [objc_alloc((Class)a1) initWithEffectID:a3 strings:a4 paths:a5];
}

- (MPEffect)initWithEffectID:(id)a3
{
  return -[MPEffect initWithEffectID:andPaths:](self, "initWithEffectID:andPaths:", a3, 0LL);
}

- (MPEffect)initWithEffectID:(id)a3 andPaths:(id)a4
{
  v6 = -[MPEffect init](self, "init");
  v7 = v6;
  if (v6)
  {
    effectID = v6->_effectID;
    if (effectID)
    {

      v7->_effectID = 0LL;
    }

    v7->_effectID = (NSString *)[a3 copy];
    presetID = v7->_presetID;
    if (presetID)
    {

      v7->_presetID = 0LL;
    }

    v7->_presetID = (NSString *)[@"Default" copy];
    v7->_supportsEffectTiming = objc_msgSend( +[MREffectManager sharedManager]( MREffectManager,  "sharedManager"),  "hasCustomTimingForEffectID:",  a3);
    if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "effectNeedsRandomSeedInformation:",  v7->_effectID)) {
      v7->_randomSeed = arc4random();
    }
    -[MPEffect createSlidesWithPaths:](v7, "createSlidesWithPaths:", a4);
    -[MPEffect _updateTiming:](v7, "_updateTiming:", 0LL);
  }

  return v7;
}

- (MPEffect)initWithEffectID:(id)a3 andStrings:(id)a4
{
  v6 = -[MPEffect init](self, "init");
  v7 = v6;
  if (v6)
  {
    effectID = v6->_effectID;
    if (effectID)
    {

      v7->_effectID = 0LL;
    }

    v7->_effectID = (NSString *)[a3 copy];
    presetID = v7->_presetID;
    if (presetID)
    {

      v7->_presetID = 0LL;
    }

    v7->_presetID = (NSString *)[@"Default" copy];
    v7->_supportsEffectTiming = objc_msgSend( +[MREffectManager sharedManager]( MREffectManager,  "sharedManager"),  "hasCustomTimingForEffectID:",  a3);
    if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "effectNeedsRandomSeedInformation:",  v7->_effectID)) {
      v7->_randomSeed = arc4random();
    }
    -[MPEffect createTextsWithStrings:secondLineFactor:](v7, "createTextsWithStrings:secondLineFactor:", a4, 1.0);
    -[MPEffect _updateTiming:](v7, "_updateTiming:", 0LL);
  }

  return v7;
}

- (MPEffect)initWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5
{
  v8 = -[MPEffect init](self, "init");
  v9 = v8;
  if (v8)
  {
    effectID = v8->_effectID;
    if (effectID)
    {

      v9->_effectID = 0LL;
    }

    v9->_effectID = (NSString *)[a3 copy];
    presetID = v9->_presetID;
    if (presetID)
    {

      v9->_presetID = 0LL;
    }

    v9->_presetID = (NSString *)[@"Default" copy];
    v9->_supportsEffectTiming = objc_msgSend( +[MREffectManager sharedManager]( MREffectManager,  "sharedManager"),  "hasCustomTimingForEffectID:",  a3);
    if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "effectNeedsRandomSeedInformation:",  v9->_effectID)) {
      v9->_randomSeed = arc4random();
    }
    -[MPEffect createTextsWithStrings:secondLineFactor:](v9, "createTextsWithStrings:secondLineFactor:", a4, 1.0);
    -[MPEffect createSlidesWithPaths:](v9, "createSlidesWithPaths:", a5);
    -[MPEffect _updateTiming:](v9, "_updateTiming:", 0LL);
  }

  return v9;
}

- (MPEffect)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPEffect;
  v2 = -[MPEffect init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *((void *)v2 + 5) = 0LL;
    *((void *)v2 + 13) = 0x3FF0000000000000LL;
    *((CGPoint *)v2 + 7) = CGPointZero;
    *((_OWORD *)v2 + 8) = xmmword_1F6F70;
    *((void *)v2 + 18) = 0x4000000000000000LL;
    *((void *)v2 + 20) = 0LL;
    *((void *)v2 + 21) = 0LL;
    *((void *)v2 + 22) = 0x3FF0000000000000LL;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 200) = 0u;
    *(_OWORD *)(v2 + 232) = xmmword_1F6F80;
    *((void *)v2 + 27) = [@"Undefined" copy];
    *((void *)v3 + 28) = [@"Default" copy];
    *(_OWORD *)(v3 + 8) = 0u;
    *(_OWORD *)(v3 + 24) = 0u;
    *((_OWORD *)v3 + 3) = 0u;
    *((_OWORD *)v3 + 4) = 0u;
    *(_OWORD *)(v3 + 73) = 0u;
    *((void *)v3 + 31) = 0LL;
    *((void *)v3 + 32) = 0LL;
    v3[264] = 0;
  }

  return (MPEffect *)v3;
}

- (id)description
{
  v3 = -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"============================= Effect %d Description ============================\n",  -[MPEffect zIndex](self, "zIndex")),  "stringByAppendingFormat:",  @"\t                         ID: %@\n",  -[MPEffect effectID](self, "effectID")),  "stringByAppendingFormat:",  @"\t                  Preset ID: %@\n",  -[MPEffect presetID](self, "presetID")),  "stringByAppendingFormat:",  @"\t                 Attributes: %@\n",  -[MPEffect effectAttributes](self, "effectAttributes"));
  slides = self->_slides;
  if (slides) {
    slides = (NSMutableArray *)-[NSMutableArray count](slides, "count");
  }
  objc_super v5 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                Slide Count: %d\n",  slides);
  texts = self->_texts;
  if (texts) {
    texts = (NSMutableArray *)-[NSMutableArray count](texts, "count");
  }
  v7 = -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"\t                 Text Count: %d\n",  texts);
  filters = self->_filters;
  if (filters) {
    filters = (NSMutableArray *)-[NSMutableArray count](filters, "count");
  }
  v9 = -[NSString stringByAppendingFormat:]( v7,  "stringByAppendingFormat:",  @"\t               Filter Count: %d\n",  filters);
  -[MPEffect mainDuration](self, "mainDuration");
  v11 = -[NSString stringByAppendingFormat:]( v9,  "stringByAppendingFormat:",  @"\t              Main Duration: %f\n",  v10);
  -[MPEffect phaseInDuration](self, "phaseInDuration");
  v13 = -[NSString stringByAppendingFormat:]( v11,  "stringByAppendingFormat:",  @"\t          Phase In Duration: %f\n",  v12);
  -[MPEffect phaseOutDuration](self, "phaseOutDuration");
  v15 = -[NSString stringByAppendingFormat:]( v13,  "stringByAppendingFormat:",  @"\t         Phase Out Duration: %f\n",  v14);
  -[MPEffect opacity](self, "opacity");
  v17 = -[NSString stringByAppendingFormat:]( v15,  "stringByAppendingFormat:",  @"\t                    Opacity: %f\n",  v16);
  -[MPEffect position](self, "position");
  v18 = -[NSString stringByAppendingFormat:]( v17,  "stringByAppendingFormat:",  @"\t                   Position: %@\n",  NSStringFromCGPoint(v32));
  -[MPEffect size](self, "size");
  v19 = -[NSString stringByAppendingFormat:]( v18,  "stringByAppendingFormat:",  @"\t                       Size: %@\n",  NSStringFromCGSize(v33));
  -[MPEffect zPosition](self, "zPosition");
  id v21 = objc_msgSend(v19, "stringByAppendingFormat:", @"\t                 Z Position: %f\n", v20);
  -[MPEffect xRotationAngle](self, "xRotationAngle");
  id v23 = objc_msgSend(v21, "stringByAppendingFormat:", @"\t           X Rotation Angle: %f\n", v22);
  -[MPEffect yRotationAngle](self, "yRotationAngle");
  id v25 = objc_msgSend(v23, "stringByAppendingFormat:", @"\t           Y Rotation Angle: %f\n", v24);
  -[MPEffect rotationAngle](self, "rotationAngle");
  id v27 = objc_msgSend(v25, "stringByAppendingFormat:", @"\t           Z Rotation Angle: %f\n", v26);
  if (self->_plug) {
    v28 = @"YES";
  }
  else {
    v28 = @"NO";
  }
  id v29 = [v27 stringByAppendingFormat:@"\t            Has Effect Plug: %@\n", v28];
  if (self->_container) {
    v30 = @"YES";
  }
  else {
    v30 = @"NO";
  }
  return [v29 stringByAppendingFormat:@"\t Has Effect EffectContainer: %@\n", v30];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copyVars:self];
  [v4 copySlides:self->_slides];
  [v4 copySecondarySlides:self->_secondarySlides];
  [v4 copyTexts:self->_texts];
  [v4 copyFilters:self->_filters];
  [v4 copyAnimationPaths:self->_animationPaths];
  [v4 copyAudioPlaylist:self->_audioPlaylist];
  return v4;
}

- (void)dealloc
{
  plug = self->_plug;
  if (plug) {

  }
  self->_plug = 0LL;
  container = self->_container;
  if (container) {

  }
  self->_container = 0LL;
  self->_attributes = 0LL;

  self->_slides = 0LL;
  self->_secondarySlides = 0LL;

  self->_texts = 0LL;
  self->_animationPaths = 0LL;

  self->_filters = 0LL;
  self->_audioPlaylist = 0LL;

  self->_effectTiming = 0LL;
  self->_effectID = 0LL;

  self->_presetID = 0LL;
  self->_uuid = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPEffect;
  -[MPEffect dealloc](&v5, "dealloc");
}

- (NSString)effectID
{
  return self->_effectID;
}

- (void)setEffectID:(id)a3
{
  effectID = self->_effectID;
  if (effectID)
  {

    self->_effectID = 0LL;
  }

  self->_effectID = (NSString *)[a3 copy];
  self->_supportsEffectTiming = objc_msgSend( +[MREffectManager sharedManager]( MREffectManager,  "sharedManager"),  "hasCustomTimingForEffectID:",  a3);
  -[MPEffect _updateTiming:](self, "_updateTiming:", 1LL);
  if (self->_randomSeed == -1
    && objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "effectNeedsRandomSeedInformation:",  self->_effectID))
  {
    self->_randomSeed = arc4random();
  }

  -[MPEffect setPresetID:](self, "setPresetID:", @"Default");
  if (self->_replaceSlides) {
    -[MPEffect reconfigureSlides](self, "reconfigureSlides");
  }
  container = self->_container;
  if (container) {
    -[MCContainerEffect setEffectID:](container, "setEffectID:", a3);
  }
}

- (NSString)presetID
{
  if (self->_presetID) {
    return self->_presetID;
  }
  else {
    return (NSString *)@"Default";
  }
}

- (void)setPresetID:(id)a3
{
  presetID = self->_presetID;
  if (presetID)
  {

    self->_presetID = 0LL;
  }

  self->_presetID = (NSString *)[a3 copy];
  attributes = self->_attributes;
  if (attributes)
  {

    self->_attributes = 0LL;
  }

  -[MPEffect applyFormattedAttributes](self, "applyFormattedAttributes");
  if (self->_supportsEffectTiming) {
    -[MPEffect _updateTiming:](self, "_updateTiming:", 1LL);
  }
}

- (void)setEffectAttributes:(id)a3
{
  attributes = self->_attributes;
  if (attributes)
  {

    self->_attributes = 0LL;
  }

  self->_attributes = (NSMutableDictionary *)[a3 mutableCopy];
  -[MPEffect applyFormattedAttributes](self, "applyFormattedAttributes");
  if (self->_supportsEffectTiming) {
    -[MPEffect _updateTiming:](self, "_updateTiming:", 1LL);
  }
}

- (id)effectAttributeForKey:(id)a3
{
  return objc_msgSend(-[MPEffect _effectAttributes](self, "_effectAttributes"), "objectForKey:", a3);
}

- (void)setEffectAttribute:(id)a3 forKey:(id)a4
{
  attributes = self->_attributes;
  if (!attributes)
  {
    attributes = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->_attributes = attributes;
  }

  -[NSMutableDictionary setValue:forKey:](attributes, "setValue:forKey:", a3, a4);
  container = self->_container;
  if (container) {
    -[MCContainerEffect setEffectAttribute:forKey:](container, "setEffectAttribute:forKey:", a3, a4);
  }
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
  if (self->_container)
  {
    if (a3 == 1.0
      && self->_plug
      && (parentContainer = self->_parentContainer) != 0LL
      && !-[MPEffectContainer shouldBeParallelizer](parentContainer, "shouldBeParallelizer"))
    {
      -[MPEffectContainer convertFromParallelizerToEffectContainer]( self->_parentContainer,  "convertFromParallelizerToEffectContainer");
    }

    else
    {
      plug = self->_plug;
      if (a3 != 1.0 && plug == 0LL)
      {
        -[MPEffectContainer convertFromEffectContainerToParallelizer]( self->_parentContainer,  "convertFromEffectContainerToParallelizer");
      }

      else if (plug)
      {
        -[MCPlugParallel setOpacity:](plug, "setOpacity:", a3);
      }
    }
  }

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  if (self->_container)
  {
    if (a3 != 1.0
      && self->_plug
      && (parentContainer = self->_parentContainer) != 0LL
      && !-[MPEffectContainer shouldBeParallelizer](parentContainer, "shouldBeParallelizer"))
    {
      -[MPEffectContainer convertFromParallelizerToEffectContainer]( self->_parentContainer,  "convertFromParallelizerToEffectContainer");
    }

    else
    {
      plug = self->_plug;
      if (a3 == 1.0 && plug == 0LL)
      {
        -[MPEffectContainer convertFromEffectContainerToParallelizer]( self->_parentContainer,  "convertFromEffectContainerToParallelizer");
      }

      else if (plug)
      {
        -[MCPlugParallel setScale:](plug, "setScale:", a3);
      }
    }
  }

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
  if (self->_container)
  {
    double y = a3.y;
    double x = a3.x;
    plug = self->_plug;
    if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
    {
      if (!plug)
      {
        -[MPEffectContainer convertFromEffectContainerToParallelizer]( self->_parentContainer,  "convertFromEffectContainerToParallelizer");
        return;
      }

      goto LABEL_11;
    }

    if (plug)
    {
      if (-[MPEffect needsParallelizer](self, "needsParallelizer"))
      {
        plug = self->_plug;
        if (plug) {
LABEL_11:
        }
          -[MCPlugParallel setPosition:](plug, "setPosition:", x, y);
      }

      else
      {
        -[MPEffectContainer convertFromParallelizerToEffectContainer]( self->_parentContainer,  "convertFromParallelizerToEffectContainer");
      }
    }
  }

- (double)zPosition
{
  return self->_zPosition;
}

- (void)setZPosition:(double)a3
{
  self->_zPosition = a3;
  if (self->_container)
  {
    if (a3 == 0.0
      && self->_plug
      && (parentContainer = self->_parentContainer) != 0LL
      && !-[MPEffectContainer shouldBeParallelizer](parentContainer, "shouldBeParallelizer"))
    {
      -[MPEffectContainer convertFromParallelizerToEffectContainer]( self->_parentContainer,  "convertFromParallelizerToEffectContainer");
    }

    else
    {
      plug = self->_plug;
      if (a3 != 0.0 && plug == 0LL)
      {
        -[MPEffectContainer convertFromEffectContainerToParallelizer]( self->_parentContainer,  "convertFromEffectContainerToParallelizer");
      }

      else if (plug)
      {
        -[MCPlugParallel setZPosition:](plug, "setZPosition:", a3);
      }
    }
  }

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
  if (self->_container)
  {
    if (a3 == 0.0
      && self->_plug
      && (parentContainer = self->_parentContainer) != 0LL
      && !-[MPEffectContainer shouldBeParallelizer](parentContainer, "shouldBeParallelizer"))
    {
      -[MPEffectContainer convertFromParallelizerToEffectContainer]( self->_parentContainer,  "convertFromParallelizerToEffectContainer");
    }

    else
    {
      plug = self->_plug;
      if (a3 != 0.0 && plug == 0LL)
      {
        -[MPEffectContainer convertFromEffectContainerToParallelizer]( self->_parentContainer,  "convertFromEffectContainerToParallelizer");
      }

      else if (plug)
      {
        -[MCPlugParallel setRotationAngle:](plug, "setRotationAngle:", a3);
      }
    }
  }

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
  if (self->_container)
  {
    double height = a3.height;
    double width = a3.width;
    plug = self->_plug;
    if (a3.width != 2.0 || a3.height != 2.0)
    {
      if (!plug)
      {
        -[MPEffectContainer convertFromEffectContainerToParallelizer]( self->_parentContainer,  "convertFromEffectContainerToParallelizer");
        return;
      }

      goto LABEL_12;
    }

    if (plug)
    {
      if (!self->_parentContainer)
      {
LABEL_12:
        -[MCPlugParallel setSize:](plug, "setSize:", width, height);
        return;
      }

      if (-[MPEffectContainer shouldBeParallelizer](self->_parentContainer, "shouldBeParallelizer"))
      {
        plug = self->_plug;
        if (plug) {
          goto LABEL_12;
        }
      }

      else
      {
        -[MPEffectContainer convertFromParallelizerToEffectContainer]( self->_parentContainer,  "convertFromParallelizerToEffectContainer");
      }
    }
  }

- (double)xRotationAngle
{
  return self->_xRotationAngle;
}

- (void)setXRotationAngle:(double)a3
{
  self->_xRotationAngle = a3;
  if (self->_container)
  {
    if (a3 == 0.0
      && self->_plug
      && (parentContainer = self->_parentContainer) != 0LL
      && !-[MPEffectContainer shouldBeParallelizer](parentContainer, "shouldBeParallelizer"))
    {
      -[MPEffectContainer convertFromParallelizerToEffectContainer]( self->_parentContainer,  "convertFromParallelizerToEffectContainer");
    }

    else
    {
      plug = self->_plug;
      if (a3 != 0.0 && plug == 0LL)
      {
        -[MPEffectContainer convertFromEffectContainerToParallelizer]( self->_parentContainer,  "convertFromEffectContainerToParallelizer");
      }

      else if (plug)
      {
        -[MCPlugParallel setXRotationAngle:](plug, "setXRotationAngle:", a3);
      }
    }
  }

- (double)yRotationAngle
{
  return self->_yRotationAngle;
}

- (void)setYRotationAngle:(double)a3
{
  self->_yRotationAngle = a3;
  if (self->_container)
  {
    if (a3 == 0.0
      && self->_plug
      && (parentContainer = self->_parentContainer) != 0LL
      && !-[MPEffectContainer shouldBeParallelizer](parentContainer, "shouldBeParallelizer"))
    {
      -[MPEffectContainer convertFromParallelizerToEffectContainer]( self->_parentContainer,  "convertFromParallelizerToEffectContainer");
    }

    else
    {
      plug = self->_plug;
      if (a3 != 0.0 && plug == 0LL)
      {
        -[MPEffectContainer convertFromEffectContainerToParallelizer]( self->_parentContainer,  "convertFromEffectContainerToParallelizer");
      }

      else if (plug)
      {
        -[MCPlugParallel setYRotationAngle:](plug, "setYRotationAngle:", a3);
      }
    }
  }

- (double)fullDuration
{
  double v4 = v3;
  -[MPEffect mainDuration](self, "mainDuration");
  double v6 = v4 + v5;
  -[MPEffect phaseOutDuration](self, "phaseOutDuration");
  return v6 + v7;
}

- (void)setFullDuration:(double)a3
{
  double v6 = v5 - a3;
  -[MPEffect mainDuration](self, "mainDuration");
  -[MPEffect setMainDuration:](self, "setMainDuration:", v7 + v6);
}

- (double)phaseInDuration
{
  return self->_phaseInDuration;
}

- (void)setPhaseInDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    -[MPEffect phaseInDuration](self, "phaseInDuration");
    if (v5 != v3)
    {
      id v6 = objc_msgSend( objc_msgSend(-[MPEffect parentContainer](self, "parentContainer"), "parentLayer"),  "parentDocument");
      id v7 = -[MPEffect nearestLayerGroup](self, "nearestLayerGroup");
      if (v7) {
        unsigned int v8 = [v7 autoAdjustDuration] ^ 1;
      }
      else {
        unsigned int v8 = 0;
      }
      if (self->_parentContainer)
      {
        if (((objc_msgSend( objc_msgSend(v6, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming[0]),  "BOOLValue") ^ 1 | v8) & 1) == 0)
        {
          -[MPEffect phaseInDuration](self, "phaseInDuration");
          double v10 = v9 - v3;
          -[MPEffect fullDuration](self, "fullDuration");
          double v12 = v11 - v10;
          -[MPEffectContainer findMinDuration](self->_parentContainer, "findMinDuration");
          if (v12 < v13)
          {
            -[MPEffectContainer findMinDuration](self->_parentContainer, "findMinDuration");
            double v15 = v14;
            -[MPEffect phaseOutDuration](self, "phaseOutDuration");
            double v17 = v15 - v16;
            -[MPEffect mainDuration](self, "mainDuration");
            double v3 = v17 - v18;
          }
        }
      }

      -[MPEffect phaseInDuration](self, "phaseInDuration");
      self->_phaseInDuration = v3;
      if ((v8 & 1) == 0) {
        -[MPEffectContainer calculateDurationToSmallest:]( self->_parentContainer,  "calculateDurationToSmallest:",  v3 < v19);
      }
      if (self->_container)
      {
        plug = self->_plug;
        if (!plug) {
          plug = -[MPEffectContainer plug](self->_parentContainer, "plug");
        }
        -[MCPlug setPhaseInDuration:](plug, "setPhaseInDuration:", v3);
      }

      effectTiming = self->_effectTiming;
      if (effectTiming) {
        -[MZEffectTiming setPhaseInDuration:mainDuration:phaseOutDuration:]( effectTiming,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  self->_phaseInDuration,  self->_mainDuration,  self->_phaseOutDuration);
      }
    }
  }

- (double)phaseOutDuration
{
  return self->_phaseOutDuration;
}

- (void)setPhaseOutDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    -[MPEffect phaseOutDuration](self, "phaseOutDuration");
    if (v5 != v3)
    {
      id v6 = objc_msgSend( objc_msgSend(-[MPEffect parentContainer](self, "parentContainer"), "parentLayer"),  "parentDocument");
      id v7 = -[MPEffect nearestLayerGroup](self, "nearestLayerGroup");
      if (v7) {
        unsigned int v8 = [v7 autoAdjustDuration] ^ 1;
      }
      else {
        unsigned int v8 = 0;
      }
      if (self->_parentContainer)
      {
        if (((objc_msgSend( objc_msgSend(v6, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming[0]),  "BOOLValue") ^ 1 | v8) & 1) == 0)
        {
          -[MPEffect phaseOutDuration](self, "phaseOutDuration");
          double v10 = v9 - v3;
          -[MPEffect fullDuration](self, "fullDuration");
          double v12 = v11 - v10;
          -[MPEffectContainer findMinDuration](self->_parentContainer, "findMinDuration");
          if (v12 < v13)
          {
            -[MPEffectContainer findMinDuration](self->_parentContainer, "findMinDuration");
            double v15 = v14;
            -[MPEffect phaseInDuration](self, "phaseInDuration");
            double v17 = v15 - v16;
            -[MPEffect mainDuration](self, "mainDuration");
            double v3 = v17 - v18;
          }
        }
      }

      -[MPEffect phaseOutDuration](self, "phaseOutDuration");
      self->_phaseOutDuration = v3;
      if ((v8 & 1) == 0) {
        -[MPEffectContainer calculateDurationToSmallest:]( self->_parentContainer,  "calculateDurationToSmallest:",  v3 < v19);
      }
      if (self->_container)
      {
        plug = self->_plug;
        if (!plug) {
          plug = -[MPEffectContainer plug](self->_parentContainer, "plug");
        }
        -[MCPlug setPhaseOutDuration:](plug, "setPhaseOutDuration:", v3);
      }

      effectTiming = self->_effectTiming;
      if (effectTiming) {
        -[MZEffectTiming setPhaseInDuration:mainDuration:phaseOutDuration:]( effectTiming,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  self->_phaseInDuration,  self->_mainDuration,  self->_phaseOutDuration);
      }
    }
  }

- (double)mainDuration
{
  return self->_mainDuration;
}

- (void)setMainDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    -[MPEffect mainDuration](self, "mainDuration");
    if (v5 != v3)
    {
      id v6 = objc_msgSend( objc_msgSend(-[MPEffect parentContainer](self, "parentContainer"), "parentLayer"),  "parentDocument");
      id v7 = -[MPEffect nearestLayerGroup](self, "nearestLayerGroup");
      if (v7) {
        unsigned int v8 = [v7 autoAdjustDuration] ^ 1;
      }
      else {
        unsigned int v8 = 0;
      }
      if (self->_parentContainer)
      {
        if (((objc_msgSend( objc_msgSend(v6, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming[0]),  "BOOLValue") ^ 1 | v8) & 1) == 0)
        {
          -[MPEffect mainDuration](self, "mainDuration");
          double v10 = v9 - v3;
          -[MPEffect fullDuration](self, "fullDuration");
          double v12 = v11 - v10;
          -[MPEffectContainer findMinDuration](self->_parentContainer, "findMinDuration");
          if (v12 < v13)
          {
            -[MPEffectContainer findMinDuration](self->_parentContainer, "findMinDuration");
            double v15 = v14;
            -[MPEffect phaseInDuration](self, "phaseInDuration");
            double v17 = v15 - v16;
            -[MPEffect phaseOutDuration](self, "phaseOutDuration");
            double v3 = v17 - v18;
          }
        }
      }

      -[MPEffect mainDuration](self, "mainDuration");
      self->_mainDuration = v3;
      if ((v8 & 1) == 0) {
        -[MPEffectContainer calculateDurationToSmallest:]( self->_parentContainer,  "calculateDurationToSmallest:",  v3 < v19);
      }
      if (self->_container)
      {
        plug = self->_plug;
        if (!plug) {
          plug = -[MPEffectContainer plug](self->_parentContainer, "plug");
        }
        -[MCPlug setLoopDuration:](plug, "setLoopDuration:", v3);
      }

      effectTiming = self->_effectTiming;
      if (effectTiming) {
        -[MZEffectTiming setPhaseInDuration:mainDuration:phaseOutDuration:]( effectTiming,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  self->_phaseInDuration,  self->_mainDuration,  self->_phaseOutDuration);
      }
    }
  }

- (int64_t)zIndex
{
  parentContainer = self->_parentContainer;
  if (!parentContainer) {
    return -1LL;
  }
  if (self->_container) {
    return -[MCPlugParallel zIndex](self->_plug, "zIndex");
  }
  return (int64_t)objc_msgSend(-[MPEffectContainer effects](parentContainer, "effects"), "indexOfObject:", self);
}

- (NSArray)slides
{
  return &self->_slides->super;
}

- (void)addSlide:(id)a3
{
  id v6 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  slides = self->_slides;
  if (slides) {
    id v5 = -[NSMutableArray count](slides, "count");
  }
  else {
    id v5 = 0LL;
  }
  -[MPEffect insertSlides:atIndex:](self, "insertSlides:atIndex:", v6, v5);
}

- (void)addSlides:(id)a3
{
  slides = self->_slides;
  if (slides) {
    id v6 = -[NSMutableArray count](slides, "count");
  }
  else {
    id v6 = 0LL;
  }
  -[MPEffect insertSlides:atIndex:](self, "insertSlides:atIndex:", a3, v6);
}

- (void)insertSlides:(id)a3 atIndex:(int64_t)a4
{
  id v7 = objc_autoreleasePoolPush();
  if (!self->_slides) {
    self->_slides = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  unsigned int v8 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [a3 count]);
  if (!self->_replaceSlides) {
    -[MPEffect willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2LL, v8, @"slides");
  }
  if (-[NSMutableArray count](self->_slides, "count")) {
    unsigned int v9 = -[MCContainerEffect isLive](self->_container, "isLive");
  }
  else {
    unsigned int v9 = 0;
  }
  v59 = v8;
  -[NSMutableArray insertObjects:atIndexes:](self->_slides, "insertObjects:atIndexes:", a3, v8);
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  id v10 = [a3 countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v82;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v82 != v12) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v81 + 1) + 8 * (void)i) setParent:self];
      }

      id v11 = [a3 countByEnumeratingWithState:&v81 objects:v90 count:16];
    }

    while (v11);
  }

  if (self->_container)
  {
    v57 = v7;
    double v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (v9) {
      a4 = -[MCContainerEffect nextAvailableSlideIndex](self->_container, "nextAvailableSlideIndex");
    }
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    id v15 = [a3 countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v60 = *(void *)v78;
      uint64_t v17 = -1LL;
      while (2)
      {
        double v18 = 0LL;
        uint64_t v19 = v17;
        do
        {
          if (*(void *)v78 != v60) {
            objc_enumerationMutation(a3);
          }
          id v20 = [*(id *)(*((void *)&v77 + 1) + 8 * (void)v18) path];
          id v21 = v20;
          uint64_t v17 = v20 == 0LL;
          if (v19 != -1 && v19 != v17) {
            goto LABEL_36;
          }
          double v18 = (char *)v18 + 1;
          uint64_t v19 = v20 == 0LL;
        }

        while (v16 != v18);
        id v16 = [a3 countByEnumeratingWithState:&v77 objects:v89 count:16];
        if (v16) {
          continue;
        }
        break;
      }

      if (!v21)
      {
LABEL_36:
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        id v27 = [a3 countByEnumeratingWithState:&v73 objects:v88 count:16];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v74;
          do
          {
            for (j = 0LL; j != v28; j = (char *)j + 1)
            {
              if (*(void *)v74 != v29) {
                objc_enumerationMutation(a3);
              }
              v31 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)j);
              if ([v31 path]) {
                id v32 = -[MCContainerEffect insertSlideForAsset:atIndex:]( self->_container,  "insertSlideForAsset:atIndex:",  objc_msgSend( objc_msgSend( -[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"),  "montage"),  "videoAssetForFileAtPath:",  objc_msgSend(v31, "path")),  a4);
              }
              else {
                id v32 = -[MCContainerEffect insertSlideAtIndex:](self->_container, "insertSlideAtIndex:", a4);
              }
              -[NSMutableArray addObject:](v14, "addObject:", v32);
              if (v9) {
                a4 = -[MCContainerEffect nextAvailableSlideIndex](self->_container, "nextAvailableSlideIndex");
              }
              else {
                ++a4;
              }
            }

            id v28 = [a3 countByEnumeratingWithState:&v73 objects:v88 count:16];
          }

          while (v28);
        }

        goto LABEL_49;
      }
    }

    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id v23 = [a3 countByEnumeratingWithState:&v69 objects:v87 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v70;
      do
      {
        for (k = 0LL; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v70 != v25) {
            objc_enumerationMutation(a3);
          }
          -[NSMutableArray addObject:]( v22,  "addObject:",  objc_msgSend( objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage"),  "videoAssetForFileAtPath:",  objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * (void)k), "path")));
        }

        id v24 = [a3 countByEnumeratingWithState:&v69 objects:v87 count:16];
      }

      while (v24);
    }

    -[NSMutableArray addObjectsFromArray:]( v14,  "addObjectsFromArray:",  -[MCContainerEffect insertSlidesForAssets:atIndex:](self->_container, "insertSlidesForAssets:atIndex:", v22, a4));

LABEL_49:
    id v33 = -[NSMutableArray objectEnumerator](v14, "objectEnumerator");
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id v34 = [a3 countByEnumeratingWithState:&v65 objects:v86 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v66;
      do
      {
        for (m = 0LL; m != v35; m = (char *)m + 1)
        {
          if (*(void *)v66 != v36) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * (void)m), "setSlide:", objc_msgSend(v33, "nextObject"));
        }

        id v35 = [a3 countByEnumeratingWithState:&v65 objects:v86 count:16];
      }

      while (v35);
    }

    id v7 = v57;
  }

  v38 = v59;
  if (!self->_replaceSlides) {
    -[MPEffect didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2LL, v59, @"slides");
  }
  if (self->_supportsEffectTiming)
  {
    id v39 = -[MPEffect parentDocument](self, "parentDocument");
    if (!v39)
    {
      if (objc_msgSend( +[MPAuthoringController sharedController]( MPAuthoringController,  "sharedController"),  "isAuthoring")) {
        id v39 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
      }
      else {
        id v39 = 0LL;
      }
    }

    id v40 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
    if ([v39 isLive]
      && (objc_opt_respondsToSelector(self->_effectTiming, "appendSlideInformation:andTextInformation:") & 1) != 0)
    {
      v58 = v7;
      v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      id v42 = [a3 countByEnumeratingWithState:&v61 objects:v85 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v62;
        double height = CGSizeZero.height;
        do
        {
          for (n = 0LL; n != v43; n = (char *)n + 1)
          {
            if (*(void *)v62 != v44) {
              objc_enumerationMutation(a3);
            }
            id v47 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)n) path];
            if (v47)
            {
              id v48 = v47;
              v49 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              if (v39) {
                [v39 resolutionForPath:v48];
              }
              else {
                objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "resolutionForAssetAtPath:",  v48);
              }
              if (v50 == CGSizeZero.width && v51 == height && v40 != 0LL) {
                [v40 resolutionForPath:v48];
              }
              double v54 = v50 / v51;
              *(float *)&double v54 = v54;
              -[NSMutableDictionary setObject:forKey:]( v49,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v54),  @"aspectRatio");
              -[NSMutableArray addObject:](v41, "addObject:", v49);
            }
          }

          id v43 = [a3 countByEnumeratingWithState:&v61 objects:v85 count:16];
        }

        while (v43);
      }

      if (-[NSMutableArray count](v41, "count")) {
        -[MZEffectTiming appendSlideInformation:andTextInformation:]( self->_effectTiming,  "appendSlideInformation:andTextInformation:",  v41,  0LL);
      }

      -[MZEffectTiming phaseInDuration](self->_effectTiming, "phaseInDuration");
      -[MPEffect setPhaseInDuration:](self, "setPhaseInDuration:");
      -[MZEffectTiming phaseOutDuration](self->_effectTiming, "phaseOutDuration");
      -[MPEffect setPhaseOutDuration:](self, "setPhaseOutDuration:");
      -[MZEffectTiming mainDuration](self->_effectTiming, "mainDuration");
      -[MPEffect setMainDuration:](self, "setMainDuration:");
      id v7 = v58;
      v38 = v59;
      if (-[NSMutableArray count](self->_slides, "count"))
      {
        v55 = objc_msgSend( objc_msgSend(-[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", 0), "slide"),  "index");
        v56 = (char *)((_BYTE *)objc_msgSend( objc_msgSend(-[NSMutableArray lastObject](self->_slides, "lastObject"), "slide"),  "index")
                     - v55
                     + 1);
      }

      else
      {
        v55 = 0LL;
        v56 = 0LL;
      }

      -[MZEffectTiming setMultiImageSlideRange:](self->_effectTiming, "setMultiImageSlideRange:", v55, v56);
    }

    else
    {
      -[MPEffect _updateTiming:](self, "_updateTiming:", 1LL);
    }
  }

  objc_autoreleasePoolPop(v7);
}

- (void)removeSlidesAtIndices:(id)a3
{
  slides = self->_slides;
  if (slides)
  {
    if (-[NSMutableArray count](slides, "count"))
    {
      id v6 = [a3 lastIndex];
      if (v6 < -[NSMutableArray count](self->_slides, "count"))
      {
        id v7 = objc_autoreleasePoolPush();
        if (self->_replaceSlides) {
          uint64_t v8 = 4LL;
        }
        else {
          uint64_t v8 = 3LL;
        }
        -[MPEffect willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  v8,  a3,  @"slides");
        if (self->_container)
        {
          id v9 = [a3 mutableCopy];
          if (-[MCContainerEffect isLive](self->_container, "isLive")) {
            objc_msgSend( v9,  "shiftIndexesStartingAtIndex:by:",  objc_msgSend(v9, "firstIndex"),  self->_liveIndex - (void)objc_msgSend(a3, "count"));
          }
          -[MCContainerEffect removeSlidesAtIndices:](self->_container, "removeSlidesAtIndices:", v9);
        }

        id v10 = [a3 lastIndex];
        if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          for (id i = v10; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
          {
            id v12 = -[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", i);
            [v12 setParent:0];
            [v12 setSlide:0];
          }
        }

        -[NSMutableArray removeObjectsAtIndexes:](self->_slides, "removeObjectsAtIndexes:", a3);
        if (self->_replaceSlides)
        {
          id v13 = [a3 firstIndex];
          if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            for (id j = v13; j != (id)0x7FFFFFFFFFFFFFFFLL; id j = [a3 indexGreaterThanIndex:j])
            {
              id v15 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  +[MPSlide slide](&OBJC_CLASS___MPSlide, "slide"),  0LL);
              -[MPEffect insertSlides:atIndex:](self, "insertSlides:atIndex:", v15, j);
            }
          }
        }

        -[MPEffect didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  v8,  a3,  @"slides");
        if (self->_supportsEffectTiming)
        {
          id v16 = -[MPEffect parentDocument](self, "parentDocument");
          if (!v16)
          {
            if (objc_msgSend( +[MPAuthoringController sharedController]( MPAuthoringController,  "sharedController"),  "isAuthoring")) {
              id v16 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
            }
            else {
              id v16 = 0LL;
            }
          }

          if (![v16 isLive]
            || (objc_opt_respondsToSelector(self->_effectTiming, "appendSlideInformation:andTextInformation:") & 1) == 0)
          {
            -[MPEffect _updateTiming:](self, "_updateTiming:", 1LL);
          }

          if ([v16 isLive])
          {
            if (-[NSMutableArray count](self->_slides, "count"))
            {
              uint64_t v17 = objc_msgSend( objc_msgSend(-[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", 0), "slide"),  "index");
              double v18 = (char *)((_BYTE *)objc_msgSend( objc_msgSend(-[NSMutableArray lastObject](self->_slides, "lastObject"), "slide"),  "index")
                           - v17
                           + 1);
            }

            else
            {
              uint64_t v17 = 0LL;
              double v18 = 0LL;
            }

            -[MZEffectTiming setMultiImageSlideRange:](self->_effectTiming, "setMultiImageSlideRange:", v17, v18);
          }
        }

        objc_autoreleasePoolPop(v7);
      }
    }
  }

- (void)removeAllSlides
{
  if (-[NSMutableArray count](self->_slides, "count"))
  {
    double v3 = objc_alloc(&OBJC_CLASS___NSIndexSet);
    slides = self->_slides;
    if (slides) {
      id v5 = -[NSMutableArray count](slides, "count");
    }
    else {
      id v5 = 0LL;
    }
    id v6 = -[NSIndexSet initWithIndexesInRange:](v3, "initWithIndexesInRange:", 0LL, v5);
    -[MPEffect removeSlidesAtIndices:](self, "removeSlidesAtIndices:", v6);
  }

- (void)replaceSlideAtIndex:(int64_t)a3 withSlide:(id)a4
{
  if (self->_slides)
  {
    id v7 = -[NSIndexSet initWithIndex:](objc_alloc(&OBJC_CLASS___NSIndexSet), "initWithIndex:", a3);
    -[MPEffect willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 4LL, v7, @"slides");
    container = self->_container;
    if (container)
    {
      -[MCContainerEffect removeSlidesAtIndices:](container, "removeSlidesAtIndices:", v7);
      id v9 = -[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", a3);
      [v9 setParent:0];
      [v9 setSlide:0];
    }

    -[NSMutableArray removeObjectsAtIndexes:](self->_slides, "removeObjectsAtIndexes:", v7);
    BOOL replaceSlides = self->_replaceSlides;
    self->_BOOL replaceSlides = 1;
    id v11 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a4, 0LL);
    -[MPEffect insertSlides:atIndex:](self, "insertSlides:atIndex:", v11, a3);

    self->_BOOL replaceSlides = replaceSlides;
    -[MPEffect didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 4LL, v7, @"slides");

    if (self->_supportsEffectTiming) {
      -[MPEffect _updateTiming:](self, "_updateTiming:", 1LL);
    }
  }

- (void)replaceSlide:(id)a3 atIndex:(int64_t)a4
{
}

- (void)moveSlidesFromIndices:(id)a3 toIndex:(int64_t)a4
{
  slides = self->_slides;
  if (slides)
  {
    if (self->_container)
    {
      -[MCContainerEffect moveSlidesAtIndices:toIndex:](self->_container, "moveSlidesAtIndices:toIndex:", a3, a4);
      slides = self->_slides;
    }

    id v8 = -[NSMutableArray objectsAtIndexes:](slides, "objectsAtIndexes:", a3);
    -[NSMutableArray removeObjectsAtIndexes:](self->_slides, "removeObjectsAtIndexes:", a3);
    id v9 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [v8 count]);
    -[NSMutableArray insertObjects:atIndexes:](self->_slides, "insertObjects:atIndexes:", v8, v9);
  }

- (id)secondarySlides
{
  return self->_secondarySlides;
}

- (void)addSecondarySlide:(id)a3
{
  id v6 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  secondarySlides = self->_secondarySlides;
  if (secondarySlides) {
    id v5 = -[NSMutableArray count](secondarySlides, "count");
  }
  else {
    id v5 = 0LL;
  }
  -[MPEffect insertSecondarySlides:atIndex:](self, "insertSecondarySlides:atIndex:", v6, v5);
}

- (void)addSecondarySlides:(id)a3
{
  secondarySlides = self->_secondarySlides;
  if (secondarySlides) {
    id v6 = -[NSMutableArray count](secondarySlides, "count");
  }
  else {
    id v6 = 0LL;
  }
  -[MPEffect insertSecondarySlides:atIndex:](self, "insertSecondarySlides:atIndex:", a3, v6);
}

- (void)insertSecondarySlides:(id)a3 atIndex:(int64_t)a4
{
  id v7 = objc_autoreleasePoolPush();
  if (!self->_secondarySlides) {
    self->_secondarySlides = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  id v8 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [a3 count]);
  if (!self->_replaceSlides) {
    -[MPEffect willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  2LL,  v8,  @"secondarySlides");
  }
  -[NSMutableArray insertObjects:atIndexes:](self->_secondarySlides, "insertObjects:atIndexes:", a3, v8);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (id i = 0LL; i != v10; id i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(a3);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        [v13 setParent:self];
        [v13 setIsSecondary:1];
      }

      id v10 = [a3 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v10);
  }

  if (self->_container)
  {
    uint64_t v26 = v7;
    double v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v15 = [a3 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (id j = 0LL; j != v16; id j = (char *)j + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(a3);
          }
          uint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
          if ([v19 path]) {
            id v20 = -[MCContainerEffect insertSlideForAsset:atIndex:]( self->_container,  "insertSlideForAsset:atIndex:",  objc_msgSend( objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage"),  "videoAssetForFileAtPath:",  objc_msgSend(v19, "path")),  (char *)-[MPEffect maxNumberOfSlides](self, "maxNumberOfSlides") + (void)j + a4);
          }
          else {
            id v20 = -[MCContainerEffect insertSlideAtIndex:]( self->_container,  "insertSlideAtIndex:",  (char *)-[MPEffect maxNumberOfSlides](self, "maxNumberOfSlides") + (void)j + a4);
          }
          -[NSMutableArray addObject:](v14, "addObject:", v20);
        }

        id v16 = [a3 countByEnumeratingWithState:&v31 objects:v40 count:16];
        a4 += (int64_t)j;
      }

      while (v16);
    }

    id v21 = -[NSMutableArray objectEnumerator](v14, "objectEnumerator");
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v22 = [a3 countByEnumeratingWithState:&v27 objects:v39 count:16];
    id v7 = v26;
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (k = 0LL; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)k), "setSlide:", objc_msgSend(v21, "nextObject"));
        }

        id v23 = [a3 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }

      while (v23);
    }
  }

  if (!self->_replaceSlides) {
    -[MPEffect didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  2LL,  v8,  @"secondarySlides");
  }

  objc_autoreleasePoolPop(v7);
}

- (void)removeSecondarySlidesAtIndices:(id)a3
{
  secondarySlides = self->_secondarySlides;
  if (secondarySlides)
  {
    if (-[NSMutableArray count](secondarySlides, "count"))
    {
      id v6 = [a3 lastIndex];
      if (v6 < -[NSMutableArray count](self->_secondarySlides, "count"))
      {
        id v7 = objc_autoreleasePoolPush();
        if (self->_replaceSlides) {
          uint64_t v8 = 4LL;
        }
        else {
          uint64_t v8 = 3LL;
        }
        -[MPEffect willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  v8,  a3,  @"secondarySlides");
        if (self->_container)
        {
          id v9 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
          id v10 = (char *)[a3 firstIndex];
          if (v10 != (char *)0x7FFFFFFFFFFFFFFFLL)
          {
          }

          -[MCContainerEffect removeSlidesAtIndices:](self->_container, "removeSlidesAtIndices:", v9);
        }

        id v12 = [a3 lastIndex];
        if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          for (id j = v12; j != (id)0x7FFFFFFFFFFFFFFFLL; id j = [a3 indexLessThanIndex:j])
          {
            id v14 = -[NSMutableArray objectAtIndex:](self->_secondarySlides, "objectAtIndex:", j);
            [v14 setParent:0];
            [v14 setSlide:0];
          }
        }

        -[NSMutableArray removeObjectsAtIndexes:](self->_secondarySlides, "removeObjectsAtIndexes:", a3);
        -[MPEffect didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  v8,  a3,  @"secondarySlides");
        objc_autoreleasePoolPop(v7);
      }
    }
  }

- (void)removeAllSecondarySlides
{
  if (-[NSMutableArray count](self->_secondarySlides, "count"))
  {
    double v3 = objc_alloc(&OBJC_CLASS___NSIndexSet);
    secondarySlides = self->_secondarySlides;
    if (secondarySlides) {
      id v5 = -[NSMutableArray count](secondarySlides, "count");
    }
    else {
      id v5 = 0LL;
    }
    id v6 = -[NSIndexSet initWithIndexesInRange:](v3, "initWithIndexesInRange:", 0LL, v5);
    -[MPEffect removeSecondarySlidesAtIndices:](self, "removeSecondarySlidesAtIndices:", v6);
  }

- (BOOL)supportsUnlimitedSlides
{
  return objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfImagesForEffectID:",  -[MPEffect effectID](self, "effectID")) == (id)-1;
}

- (BOOL)replaceSlides
{
  return self->_replaceSlides;
}

- (void)setReplaceSlides:(BOOL)a3
{
  self->_BOOL replaceSlides = a3;
}

- (void)_updateEffectTimingWithDocument:(id)a3
{
}

- (void)_updateEffectTimingWithDocument:(id)a3 forExport:(BOOL)a4
{
  if (!self->_supportsEffectTiming || self->_skipEffectTiming) {
    return;
  }
  BOOL v5 = a4;

  self->_effectTiming = 0LL;
  id v7 = -[MPEffect formattedAttributes](self, "formattedAttributes");
  if (!a3)
  {
    a3 = -[MPEffect parentDocument](self, "parentDocument");
    if (!a3)
    {
      double v9 = 1.77777779;
      if (!objc_msgSend( +[MPAuthoringController sharedController]( MPAuthoringController,  "sharedController"),  "isAuthoring"))
      {
        a3 = 0LL;
        goto LABEL_7;
      }

      a3 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
      if (!a3) {
        goto LABEL_7;
      }
    }
  }

  [a3 aspectRatio];
  double v9 = v8;
LABEL_7:
  if (v5)
  {
    id v7 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7);
    -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"updateEffectAuthoredTimingForExport");
  }

  id v10 = (MZEffectTiming *) objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:",  self->_effectID,  v7,  -[MPEffect slideInformationWithDocument:](self, "slideInformationWithDocument:", a3),  self->_texts,  v9);
  self->_effectTiming = v10;
  if ((objc_opt_respondsToSelector(v10, "effectAuthoredAttributes") & 1) != 0 && v5)
  {
    id v11 = -[MZEffectTiming effectAuthoredAttributes](self->_effectTiming, "effectAuthoredAttributes");
    if (v11)
    {
      id v12 = v11;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v13 = objc_msgSend(v11, "keyEnumerator", 0);
      id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          for (id i = 0LL; i != v15; id i = (char *)i + 1)
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            -[MPEffect setEffectAttribute:forKey:]( self,  "setEffectAttribute:forKey:",  [v12 objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)i)],  *(void *)(*((void *)&v18 + 1) + 8 * (void)i));
          }

          id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v15);
      }
    }
  }

- (void)_updateTiming:(BOOL)a3
{
}

- (void)_updateTiming:(BOOL)a3 forExport:(BOOL)a4
{
  if (!self->_cleaningUp)
  {
    BOOL v4 = a4;
    id v7 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
    if (self->_supportsEffectTiming)
    {
      -[MPEffect _updateEffectTimingWithDocument:forExport:]( self,  "_updateEffectTimingWithDocument:forExport:",  0LL,  v4);
      -[MZEffectTiming phaseInDuration](self->_effectTiming, "phaseInDuration");
      double v9 = v8;
      -[MZEffectTiming phaseOutDuration](self->_effectTiming, "phaseOutDuration");
      double v11 = v10;
      -[MZEffectTiming mainDuration](self->_effectTiming, "mainDuration");
      double v13 = v12;
      if (a3)
      {
        if (self->_supportsEffectTiming)
        {
          -[MPEffect setPhaseInDuration:](self, "setPhaseInDuration:", v9);
          -[MPEffect setPhaseOutDuration:](self, "setPhaseOutDuration:", v11);
          -[MPEffect setMainDuration:](self, "setMainDuration:", v13);
        }

        return;
      }
    }

    else
    {
      if (a3) {
        return;
      }
      [v7 defaultDurationsForEffectID:self->_effectID phaseInDuration:&v15 mainDuration:&v16 phaseOutDuration:&v14];
      double v11 = v14;
      double v9 = v15;
      double v13 = v16;
    }

    self->_phaseInDuration = v9;
    self->_phaseOutDuration = v11;
    self->_mainDuration = v13;
  }

- (double)lowestDisplayTime
{
  effectTiming = self->_effectTiming;
  if (!effectTiming) {
    return -1.0;
  }
  -[MZEffectTiming lowestDisplayTime](effectTiming, "lowestDisplayTime");
  return result;
}

- (NSArray)texts
{
  return &self->_texts->super;
}

- (void)addText:(id)a3
{
  id v6 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  texts = self->_texts;
  if (texts) {
    id v5 = -[NSMutableArray count](texts, "count");
  }
  else {
    id v5 = 0LL;
  }
  -[MPEffect insertTexts:atIndex:](self, "insertTexts:atIndex:", v6, v5);
}

- (void)addTexts:(id)a3
{
  texts = self->_texts;
  if (texts) {
    id v6 = -[NSMutableArray count](texts, "count");
  }
  else {
    id v6 = 0LL;
  }
  -[MPEffect insertTexts:atIndex:](self, "insertTexts:atIndex:", a3, v6);
}

- (void)insertTexts:(id)a3 atIndex:(int64_t)a4
{
  id v7 = objc_autoreleasePoolPush();
  if (!self->_texts) {
    self->_texts = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  double v8 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [a3 count]);
  -[MPEffect willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2LL, v8, @"texts");
  -[NSMutableArray insertObjects:atIndexes:](self->_texts, "insertObjects:atIndexes:", a3, v8);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      double v12 = 0LL;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)v12) setParent:self];
        double v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [a3 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }

    while (v10);
  }

  if (self->_container)
  {
    double v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v14 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(a3);
          }
          -[NSMutableArray addObject:]( v13,  "addObject:",  [*(id *)(*((void *)&v27 + 1) + 8 * (void)v17) attributedString]);
          uint64_t v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }

      while (v15);
    }

    id v18 = objc_msgSend( -[MCContainerEffect insertTextsForAttributedStrings:atIndex:]( self->_container,  "insertTextsForAttributedStrings:atIndex:",  v13,  a4),  "objectEnumerator");
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v19 = [a3 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        id v22 = 0LL;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)v22), "setText:", objc_msgSend(v18, "nextObject"));
          id v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = [a3 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }

      while (v20);
    }
  }

  -[MPEffect didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2LL, v8, @"texts");

  objc_autoreleasePoolPop(v7);
}

- (void)removeTextsAtIndices:(id)a3
{
  texts = self->_texts;
  if (texts && -[NSMutableArray count](texts, "count"))
  {
    id v6 = objc_autoreleasePoolPush();
    -[MPEffect willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3LL, a3, @"texts");
    container = self->_container;
    if (container) {
      -[MCContainerEffect removeTextsAtIndices:](container, "removeTextsAtIndices:", a3);
    }
    id v8 = [a3 lastIndex];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v8; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v10 = -[NSMutableArray objectAtIndex:](self->_texts, "objectAtIndex:", i);
        [v10 setParent:0];
        [v10 setText:0];
      }
    }

    -[NSMutableArray removeObjectsAtIndexes:](self->_texts, "removeObjectsAtIndexes:", a3);
    -[MPEffect didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3LL, a3, @"texts");
    objc_autoreleasePoolPop(v6);
  }

- (void)removeAllTexts
{
  if (-[NSMutableArray count](self->_texts, "count"))
  {
    double v3 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  -[NSMutableArray count](self->_texts, "count"));
    -[MPEffect removeTextsAtIndices:](self, "removeTextsAtIndices:", v3);
  }

- (void)moveTextsFromIndices:(id)a3 toIndex:(int64_t)a4
{
  texts = self->_texts;
  if (texts)
  {
    if (self->_container)
    {
      -[MCContainerEffect moveTextsAtIndices:toIndex:](self->_container, "moveTextsAtIndices:toIndex:", a3, a4);
      texts = self->_texts;
    }

    id v8 = -[NSMutableArray objectsAtIndexes:](texts, "objectsAtIndexes:", a3);
    -[NSMutableArray removeObjectsAtIndexes:](self->_texts, "removeObjectsAtIndexes:", a3);
    id v9 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [v8 count]);
    -[NSMutableArray insertObjects:atIndexes:](self->_texts, "insertObjects:atIndexes:", v8, v9);
  }

- (BOOL)isTextOnly
{
  return !-[NSMutableArray count](self->_slides, "count") && -[NSMutableArray count](self->_texts, "count") != 0LL;
}

- (id)filters
{
  return self->_filters;
}

- (void)addFilter:(id)a3
{
  BOOL v4 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", a3);
  filters = self->_filters;
  if (filters) {
    id v6 = -[NSMutableArray count](filters, "count");
  }
  else {
    id v6 = 0LL;
  }
  -[MPEffect insertFilters:atIndex:](self, "insertFilters:atIndex:", v4, v6);
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
  -[MPEffect insertFilters:atIndex:](self, "insertFilters:atIndex:", a3, v6);
}

- (void)insertFilters:(id)a3 atIndex:(int64_t)a4
{
  int64_t v4 = a4;
  id v7 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [a3 count]);
  -[MPEffect willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2LL, v7, @"filters");
  filters = self->_filters;
  if (!filters)
  {
    filters = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    self->_filters = filters;
  }

  -[NSMutableArray insertObjects:atIndexes:](filters, "insertObjects:atIndexes:", a3, v7);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      double v12 = 0LL;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * (void)v12) setParent:self];
        double v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v10);
  }

  id v13 = -[NSMutableArray count](self->_filters, "count");
  plug = self->_plug;
  if (v13)
  {
    if (!plug)
    {
      -[MPEffectContainer convertFromEffectContainerToParallelizer]( self->_parentContainer,  "convertFromEffectContainerToParallelizer");
      goto LABEL_21;
    }
  }

  else if (!plug)
  {
    goto LABEL_21;
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v15 = [a3 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend( *(id *)(*((void *)&v19 + 1) + 8 * (void)v18),  "setFilter:",  -[MCPlugParallel insertFilterWithFilterID:atIndex:]( self->_plug,  "insertFilterWithFilterID:atIndex:",  objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v18), "filterID"),  (char *)v18 + v4));
        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [a3 countByEnumeratingWithState:&v19 objects:v27 count:16];
      v4 += (int64_t)v18;
    }

    while (v16);
  }

- (void)removeFiltersAtIndices:(id)a3
{
  filters = self->_filters;
  if (filters && -[NSMutableArray count](filters, "count"))
  {
    -[MPEffect willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"filters");
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

    plug = self->_plug;
    if (plug) {
      -[MCPlugParallel removeFiltersAtIndices:](plug, "removeFiltersAtIndices:", a3);
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_filters, "removeObjectsAtIndexes:", a3);
    if (!-[NSMutableArray count](self->_filters, "count")
      && self->_plug
      && !-[MPEffect needsParallelizer](self, "needsParallelizer"))
    {
      -[MPEffectContainer convertFromParallelizerToEffectContainer]( self->_parentContainer,  "convertFromParallelizerToEffectContainer");
    }

    -[MPEffect didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3LL, a3, @"filters");
  }

- (void)removeAllFilters
{
  if (-[NSMutableArray count](self->_filters, "count"))
  {
    double v3 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  0LL,  -[NSMutableArray count](self->_filters, "count"));
    -[MPEffect removeFiltersAtIndices:](self, "removeFiltersAtIndices:", v3);
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
  id result = self->_animationPaths;
  if (result) {
    return [result objectForKey:a3];
  }
  return result;
}

- (void)setAnimationPath:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (!self->_animationPaths) {
      self->_animationPaths = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v7 = -[MPEffect animationPathForKey:](self, "animationPathForKey:", a4);
    if (v7)
    {
      id v8 = v7;
      [v7 setParent:0];
      [v8 setAnimationPath:0];
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
    -[MPEffect removeAnimationPathForKey:](self, "removeAnimationPathForKey:", a4);
  }

- (void)removeAnimationPathForKey:(id)a3
{
  if (self->_animationPaths)
  {
    id v5 = -[MPEffect animationPathForKey:](self, "animationPathForKey:");
    plug = self->_plug;
    if (plug)
    {
      -[MCPlug removeAnimationPathForKey:](plug, "removeAnimationPathForKey:", a3);
      [v5 setAnimationPath:0];
    }

    [v5 setParent:0];
    -[NSMutableDictionary removeObjectForKey:](self->_animationPaths, "removeObjectForKey:", a3);
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
    if (self->_container)
    {
      -[MPAudioPlaylist setMontage:]( self->_audioPlaylist,  "setMontage:",  objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage"));
      -[MPAudioPlaylist setAudioPlaylist:]( self->_audioPlaylist,  "setAudioPlaylist:",  -[MCContainer audioPlaylistCreateIfNeeded](self->_container, "audioPlaylistCreateIfNeeded"));
    }
  }

- (int64_t)audioPriority
{
  return self->_audioPriority;
}

- (void)setAudioPriority:(int64_t)a3
{
  self->_audioPrioritdouble y = a3;
}

- (id)parentContainer
{
  return self->_parentContainer;
}

- (int64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(int64_t)a3
{
  self->_randomSeed = a3;
  container = self->_container;
  if (container) {
    -[MCContainerEffect setEffectAttribute:forKey:]( container,  "setEffectAttribute:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"),  @"PresetID");
  }
  if (self->_supportsEffectTiming) {
    -[MPEffect _updateTiming:](self, "_updateTiming:", 1LL);
  }
}

- (MZEffectTiming)effectTiming
{
  return self->_effectTiming;
}

- (int64_t)maxNumberOfSlides
{
  return (int64_t)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSlidesForEffectID:",  -[MPEffect effectID](self, "effectID"));
}

- (int64_t)maxNumberOfSecondarySlides
{
  return (int64_t)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSecondarySlidesForEffectID:",  -[MPEffect effectID](self, "effectID"));
}

- (int64_t)liveIndex
{
  return self->_liveIndex;
}

- (void)setLiveIndex:(int64_t)a3
{
  self->_liveIndedouble x = a3;
}

- (id)container
{
  return self->_container;
}

- (id)plug
{
  return self->_plug;
}

- (void)createTextsWithDefaultStrings
{
  double v3 = (char *)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfTextsForEffectID:",  -[MPEffect effectID](self, "effectID"));
  int64_t v4 = v3;
  if (self->_texts) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = (uint64_t)v3 < 1;
  }
  if (v5)
  {
  }

  else
  {
    self->_texts = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  id v6 = 0LL;
  do
  {
    id v7 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:",  -[MPEffect effectID](self, "effectID"),  -[MPEffect presetID](self, "presetID"),  v6);
    if (v7)
    {
      id v8 = +[MPText textWithAttributedString:](&OBJC_CLASS___MPText, "textWithAttributedString:", v7);
      -[MPText setParent:](v8, "setParent:", self);
      -[NSMutableArray addObject:](self->_texts, "addObject:", v8);
    }

    ++v6;
  }

  while (v4 != v6);
}

- (void)replaceTextsWitStrings:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v5 = [a3 count];
    if ((uint64_t)v5 >= 1)
    {
      id v6 = v5;
      unint64_t v7 = 0LL;
      id v8 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
      id v9 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
      while (v7 >= (unint64_t)-[NSMutableArray count](self->_texts, "count"))
      {
LABEL_15:
        if (v6 == (id)++v7) {
          return;
        }
      }

      id v10 = [v3 objectAtIndex:v7];
      id v12 = -[NSMutableArray objectAtIndex:](self->_texts, "objectAtIndex:", v7);
      if (v10)
      {
        uint64_t v13 = objc_opt_class(v9[204], v11);
        id v14 = v10;
        if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
        {
          id v15 = [objc_alloc((Class)v8[227]) initWithAttributedString:v10];
LABEL_14:
          [v12 setAttributedString:v15];

          goto LABEL_15;
        }
      }

      else
      {
        id v14 = 0LL;
      }

      if ([0 length])
      {
        id v16 = objc_alloc((Class)v8[227]);
        id v17 = [v12 attributedString];
        id v18 = v16;
      }

      else
      {
        id v29 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
        id v19 = v14;
        id v20 = v6;
        id v21 = v3;
        __int128 v22 = v8;
        __int128 v23 = v9;
        __int128 v24 = -[MPEffect effectID](self, "effectID");
        __int128 v25 = -[MPEffect presetID](self, "presetID");
        __int128 v26 = v24;
        id v9 = v23;
        id v8 = v22;
        id v3 = v21;
        id v6 = v20;
        id v14 = v19;
        id v27 = [v29 defaultStringForTextInEffectID:v26 presetID:v25 atIndex:v7];
        id v18 = objc_alloc((Class)v8[227]);
        id v17 = v27;
      }

      id v28 = [v18 initWithAttributedString:v17];
      id v15 = v28;
      if (v10) {
        objc_msgSend(v28, "replaceCharactersInRange:withString:", 0, objc_msgSend(v28, "length"), v14);
      }
      goto LABEL_14;
    }
  }

- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4
{
}

- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4 fillIn:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3 && !self->_texts && [a3 count]) {
    self->_texts = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  p_vtable = &OBJC_CLASS___MPEffect.vtable;
  uint64_t v11 = (char *)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfTextsForEffectID:",  -[MPEffect effectID](self, "effectID"));
  if (a3) {
    id v12 = (char *)[a3 count];
  }
  else {
    id v12 = 0LL;
  }
  else {
    uint64_t v13 = v12;
  }
  if (!v5) {
    uint64_t v11 = v13;
  }
  if ((uint64_t)v11 >= 1)
  {
    id v14 = 0LL;
    __int128 v31 = v12;
    do
    {
      if (a3)
      {
        else {
          id v15 = [a3 objectAtIndex:v14];
        }
        id v16 = v15;
      }

      else
      {
        id v16 = 0LL;
      }

      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSAttributedString, v10);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        id v18 = v16;
      }

      else
      {
        id v19 = -[NSMutableAttributedString initWithAttributedString:]( [NSMutableAttributedString alloc],  "initWithAttributedString:",  objc_msgSend( objc_msgSend(p_vtable + 492, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:",  -[MPEffect effectID](self, "effectID"),  -[MPEffect presetID](self, "presetID"),  v14));
        id v18 = v19;
        if (v16)
        {
          -[NSMutableAttributedString replaceCharactersInRange:withString:]( v19,  "replaceCharactersInRange:withString:",  0LL,  -[NSMutableAttributedString length](v19, "length"),  v16);
          if (a4 != 1.0)
          {
            if ([v16 length])
            {
              id v20 = (char *)objc_msgSend(v16, "lineRangeForRange:", 0, 1);
              __int128 v22 = &v20[v21];
              __int128 v23 = (char *)[v16 length];
              if (v23 != v22)
              {
                __int128 v32 = (char *)(v23 - v22);
                __int128 v24 = (const __CTFont *)objc_msgSend( -[NSMutableAttributedString attributesAtIndex:effectiveRange:]( v18,  "attributesAtIndex:effectiveRange:",  0,  v33),  "objectForKey:",  kCTFontAttributeName);
                __int128 v25 = p_vtable;
                __int128 v26 = CTFontCopyPostScriptName(v24);
                CGFloat Size = CTFontGetSize(v24);
                CTFontRef v28 = CTFontCreateWithName(v26, Size * a4, 0LL);
                id v29 = v26;
                p_vtable = v25;
                CFRelease(v29);
                id v12 = v31;
                -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  kCTFontAttributeName,  v28,  v22,  v32);
                CFRelease(v28);
              }
            }
          }
        }
      }

      __int128 v30 = -[MPText initWithAttributedString:](objc_alloc(&OBJC_CLASS___MPText), "initWithAttributedString:", v18);

      -[MPText setParent:](v30, "setParent:", self);
      -[NSMutableArray addObject:](self->_texts, "addObject:", v30);

      ++v14;
    }

    while (v11 != v14);
  }

- (void)createSlidesWithPaths:(id)a3
{
  id v5 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSlidesForEffectID:",  -[MPEffect effectID](self, "effectID"));
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v5 = [a3 count];
  }
  if (self->_slides || (uint64_t)v5 < 1)
  {
  }

  else
  {
    self->_slides = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  for (unint64_t i = 0LL; (id)i != v5; ++i)
  {
    else {
      id v8 = objc_alloc_init(&OBJC_CLASS___MPSlide);
    }
    id v9 = v8;
    -[MPSlide setParent:](v8, "setParent:", self);
    -[NSMutableArray addObject:](self->_slides, "addObject:", v9);
  }

- (void)createSecondarySlidesWithPaths:(id)a3
{
  id v5 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSecondarySlidesForEffectID:",  -[MPEffect effectID](self, "effectID"));
  id v6 = v5;
  if (self->_secondarySlides) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = (uint64_t)v5 < 1;
  }
  if (v7)
  {
  }

  else
  {
    self->_secondarySlides = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  unint64_t v8 = 0LL;
  do
  {
    else {
      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___MPSlide);
    }
    uint64_t v11 = v10;
    -[MPSlide setParent:](v10, "setParent:", self);
    -[MPSlide setIsSecondary:](v11, "setIsSecondary:", 1LL);
    -[NSMutableArray addObject:](self->_secondarySlides, "addObject:", v11);

    ++v8;
  }

  while (v6 != (id)v8);
}

- (void)reconfigureSlides
{
  id v3 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSlidesForEffectID:",  -[MPEffect effectID](self, "effectID"));
  int64_t v4 = -[NSMutableArray count](self->_slides, "count");
  id v5 = -[NSMutableArray count](self->_slides, "count");
  if (v4 >= v3)
  {
    if (v3 >= v5) {
      return;
    }
    uint64_t v13 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  v3,  (_BYTE *)-[NSMutableArray count](self->_slides, "count") - v3);
    id v14 = -[NSMutableArray objectsAtIndexes:](self->_slides, "objectsAtIndexes:", v13);
    self->_BOOL replaceSlides = 0;
    -[MPEffect removeSlidesAtIndices:](self, "removeSlidesAtIndices:", v13);

    self->_BOOL replaceSlides = 1;
    id v15 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v14,  @"slides",  0LL);
    id v9 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    uint64_t v10 = MPEffectDidRemoveSlidesNotification;
    uint64_t v11 = self;
    id v12 = v15;
  }

  else
  {
    uint64_t v6 = v3 - v5;
    BOOL v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (v6 >= 1)
    {
      do
      {
        -[NSMutableArray addObject:](v7, "addObject:", +[MPSlide slide](&OBJC_CLASS___MPSlide, "slide"));
        --v6;
      }

      while (v6);
    }

    self->_BOOL replaceSlides = 0;
    -[MPEffect addSlides:](self, "addSlides:", v7);
    self->_BOOL replaceSlides = 1;
    unint64_t v8 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v7,  @"slides",  0LL);

    id v9 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    uint64_t v10 = MPEffectDidAddSlidesNotification;
    uint64_t v11 = self;
    id v12 = v8;
  }

  -[NSNotificationCenter postNotificationName:object:userInfo:]( v9,  "postNotificationName:object:userInfo:",  v10,  v11,  v12);
}

- (void)dump
{
}

- (id)fullDebugLog
{
  id v3 = -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@\n",  -[MPEffect description](self, "description")),  "stringByAppendingFormat:",  @"=============================== Effect %d Slides =============================\n",  -[MPEffect zIndex](self, "zIndex"));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  slides = self->_slides;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v30,  v36,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(slides);
        }
        id v3 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"%@\n",  [*(id *)(*((void *)&v30 + 1) + 8 * (void)i) fullDebugLog]);
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v30,  v36,  16LL);
    }

    while (v6);
  }

  id v9 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"=============================== Effect %d Texts ==============================\n",  -[MPEffect zIndex](self, "zIndex"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  texts = self->_texts;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( texts,  "countByEnumeratingWithState:objects:count:",  &v26,  v35,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (id j = 0LL; j != v12; id j = (char *)j + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(texts);
        }
        id v9 = -[NSString stringByAppendingFormat:]( v9,  "stringByAppendingFormat:",  @"%@\n",  [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) fullDebugLog]);
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( texts,  "countByEnumeratingWithState:objects:count:",  &v26,  v35,  16LL);
    }

    while (v12);
  }

  id v15 = -[NSString stringByAppendingFormat:]( v9,  "stringByAppendingFormat:",  @"============================== Effect %d Filters =============================\n",  -[MPEffect zIndex](self, "zIndex"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  filters = self->_filters;
  id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v22,  v34,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (k = 0LL; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(filters);
        }
        id v15 = -[NSString stringByAppendingFormat:]( v15,  "stringByAppendingFormat:",  @"%@\n",  [*(id *)(*((void *)&v22 + 1) + 8 * (void)k) fullDebugLog]);
      }

      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v22,  v34,  16LL);
    }

    while (v18);
  }

  return v15;
}

- (id)videoPaths
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  int64_t v4 = -[MPEffect slides](self, "slides", 0LL);
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      unint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) path];
        if (v9) {
          [v3 addObject:v9];
        }
        unint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)effectPresetID
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  -[MPEffect effectID](self, "effectID"),  -[MPEffect presetID](self, "presetID"));
}

- (BOOL)isLive
{
  if (self->_container) {
    container = self->_container;
  }
  else {
    container = -[MPEffect parentDocument](self, "parentDocument");
  }
  return -[MCContainerEffect isLive](container, "isLive");
}

- (void)setSkipEffectTiming:(BOOL)a3
{
  self->_skipEffectTiming = a3;
}

- (void)updateTiming
{
}

- (void)updateTimingForExport
{
}

- (id)_effectAttributes
{
  id v3 =  objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  -[MPEffect effectID](self, "effectID"),  -[MPEffect presetID](self, "presetID")),  "mutableCopy");
  [v3 addEntriesFromDictionary:self->_attributes];
  return v3;
}

- (id)formattedAttributes
{
  if (self->_attributes) {
    id v3 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  -[MPEffect _effectAttributes](self, "_effectAttributes"));
  }
  else {
    id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  int64_t v4 = v3;
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  -[MPEffect presetID](self, "presetID"),  @"PresetID");
  if ((self->_randomSeed & 0x8000000000000000LL) == 0) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"),  @"RandomSeed");
  }
  return v4;
}

- (void)applyFormattedAttributes
{
  if (self->_container)
  {
    -[MCContainerEffect setEffectAttributes:]( self->_container,  "setEffectAttributes:",  -[MPEffect _effectAttributes](self, "_effectAttributes"));
    -[MCContainerEffect setEffectAttribute:forKey:]( self->_container,  "setEffectAttribute:forKey:",  -[MPEffect presetID](self, "presetID"),  @"PresetID");
    if ((self->_randomSeed & 0x8000000000000000LL) == 0) {
      -[MCContainerEffect setEffectAttribute:forKey:]( self->_container,  "setEffectAttribute:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"),  @"RandomSeed");
    }
  }

- (BOOL)supportsEffectTiming
{
  return self->_supportsEffectTiming;
}

- (id)slideInformationWithDocument:(id)a3
{
  id v23 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  if (!a3)
  {
    a3 = -[MPEffect parentDocument](self, "parentDocument");
    if (!a3)
    {
      if (objc_msgSend( +[MPAuthoringController sharedController]( MPAuthoringController,  "sharedController"),  "isAuthoring")) {
        a3 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
      }
      else {
        a3 = 0LL;
      }
    }
  }

  id v5 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  slides = self->_slides;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    double height = CGSizeZero.height;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(slides);
        }
        __int128 v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v11);
        id v13 = [v12 path];
        if (v13)
        {
          id v14 = v13;
          id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          if (a3) {
            [a3 resolutionForPath:v14];
          }
          else {
            objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "resolutionForAssetAtPath:",  v14);
          }
          if (v16 == CGSizeZero.width && v17 == height && v5 != 0LL) {
            [v5 resolutionForPath:v14];
          }
          double v20 = v16 / v17;
          *(float *)&double v20 = v20;
          -[NSMutableDictionary setObject:forKey:]( v15,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v20),  @"aspectRatio");
          if ([v12 slide])
          {
          }

          else if ([a3 isMovieAtPath:v14])
          {
LABEL_25:
            -[NSMutableDictionary setObject:forKey:]( v15,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"isMovie");
            [a3 durationForPath:v14];
            -[NSMutableDictionary setObject:forKey:]( v15,  "setObject:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"duration");
          }

          [v23 addObject:v15];
        }

        __int128 v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      id v8 = v21;
    }

    while (v21);
  }

  return v23;
}

- (void)updateEffectAttributes
{
  id v3 = objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "defaultEffectAttributesWithEffectID:andSlideInformation:",  self->_effectID,  -[MPEffect slideInformationWithDocument:](self, "slideInformationWithDocument:", 0));
  if (v3)
  {
    id v4 = v3;
    id v5 = -[MPEffect effectAttributes](self, "effectAttributes");
    [v5 addEntriesFromDictionary:v4];
    -[MPEffect setEffectAttributes:](self, "setEffectAttributes:", v5);
  }

- (id)plugID
{
  return objc_msgSend(-[MPEffect nearestPlug](self, "nearestPlug"), "objectID");
}

- (id)objectID
{
  return objc_msgSend(-[MPEffect nearestPlug](self, "nearestPlug"), "objectID");
}

- (id)uuid
{
  return self->_uuid;
}

- (id)parentDocument
{
  return objc_msgSend( objc_msgSend(-[MPEffect parentContainer](self, "parentContainer"), "parentLayer"),  "parentDocument");
}

- (id)nearestPlug
{
  if (self->_plug) {
    return self->_plug;
  }
  else {
    return objc_msgSend(-[MPEffect parentContainer](self, "parentContainer"), "plug");
  }
}

- (void)copyVars:(id)a3
{
  self->_position = (CGPoint)*((_OWORD *)a3 + 7);
  self->_size = *(CGSize *)((char *)a3 + 136);
  self->_zPosition = *((double *)a3 + 16);
  self->_rotationAngle = *((double *)a3 + 19);
  self->_xRotationAngle = *((double *)a3 + 20);
  self->_yRotationAngle = *((double *)a3 + 21);
  self->_scale = *((double *)a3 + 22);
  self->_opacitdouble y = *((double *)a3 + 13);
  self->_timeIn = *((double *)a3 + 23);
  self->_phaseInDuration = *((double *)a3 + 24);
  self->_phaseOutDuration = *((double *)a3 + 25);
  self->_mainDuration = *((double *)a3 + 26);
  self->_audioPrioritdouble y = *((void *)a3 + 29);
  effectID = self->_effectID;
  if (effectID)
  {

    self->_effectID = 0LL;
  }

  self->_effectID = (NSString *)[*((id *)a3 + 27) copy];
  presetID = self->_presetID;
  if (presetID)
  {

    self->_presetID = 0LL;
  }

  self->_presetID = (NSString *)[*((id *)a3 + 28) copy];
  uuid = self->_uuid;
  if (uuid)
  {

    self->_uuid = 0LL;
  }

- (void)copySlides:(id)a3
{
  if (a3)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
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

    -[MPEffect addSlides:](self, "addSlides:", v5);
  }

- (void)copySecondarySlides:(id)a3
{
  if (a3)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
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

    -[MPEffect addSecondarySlides:](self, "addSecondarySlides:", v5);
  }

- (void)copyTexts:(id)a3
{
  if (a3)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
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

    -[MPEffect addTexts:](self, "addTexts:", v5);
  }

- (void)copyFilters:(id)a3
{
  if (a3)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
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

    -[MPEffect addFilters:](self, "addFilters:", a3);
  }

- (void)copyAnimationPaths:(id)a3
{
  if (a3)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
          id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
          -[MPEffect setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v10, v9);
        }

        id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }
  }

- (void)copyAudioPlaylist:(id)a3
{
  id v4 = [a3 copy];
  -[MPEffect setAudioPlaylist:](self, "setAudioPlaylist:", v4);
}

- (void)cleanup
{
  self->_cleaningUp = 1;
  *(_WORD *)&self->_BOOL replaceSlides = 0;
  -[MPEffect removeAllSlides](self, "removeAllSlides");
  -[MPEffect removeAllSecondarySlides](self, "removeAllSecondarySlides");
  -[MPEffect removeAllTexts](self, "removeAllTexts");
  -[MPEffect removeAllFilters](self, "removeAllFilters");
  -[MPEffect setAudioPlaylist:](self, "setAudioPlaylist:", 0LL);
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
        -[MPEffect removeAnimationPathForKey:]( self,  "removeAnimationPathForKey:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
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
    -[MPEffect opacity](self, "opacity");
    -[MCPlugParallel setOpacity:](self->_plug, "setOpacity:");
    -[MPEffect position](self, "position");
    -[MCPlugParallel setPosition:](self->_plug, "setPosition:");
    -[MPEffect rotationAngle](self, "rotationAngle");
    -[MCPlugParallel setRotationAngle:](self->_plug, "setRotationAngle:");
    -[MPEffect size](self, "size");
    -[MCPlugParallel setSize:](self->_plug, "setSize:");
    -[MPEffect xRotationAngle](self, "xRotationAngle");
    -[MCPlugParallel setXRotationAngle:](self->_plug, "setXRotationAngle:");
    -[MPEffect yRotationAngle](self, "yRotationAngle");
    -[MCPlugParallel setYRotationAngle:](self->_plug, "setYRotationAngle:");
    -[MPEffect scale](self, "scale");
    -[MCPlugParallel setScale:](self->_plug, "setScale:");
    -[MPEffect phaseOutDuration](self, "phaseOutDuration");
    -[MCPlug setPhaseOutDuration:](self->_plug, "setPhaseOutDuration:");
    -[MPEffect phaseInDuration](self, "phaseInDuration");
    -[MCPlug setPhaseInDuration:](self->_plug, "setPhaseInDuration:");
    -[MPEffect mainDuration](self, "mainDuration");
    -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:");
    -[MCPlugParallel setAudioPriority:]( self->_plug,  "setAudioPriority:",  (__int16)-[MPEffect audioPriority](self, "audioPriority"));
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    filters = self->_filters;
    id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v45,  v52,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v46;
      do
      {
        for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v46 != v10) {
            objc_enumerationMutation(filters);
          }
          objc_msgSend( *(id *)(*((void *)&v45 + 1) + 8 * (void)i),  "setFilter:",  -[MCPlugParallel addFilterWithFilterID:]( self->_plug,  "addFilterWithFilterID:",  objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * (void)i), "filterID")));
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v45,  v52,  16LL);
      }

      while (v9);
    }

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    animationPaths = self->_animationPaths;
    id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v41,  v51,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (id j = 0LL; j != v14; id j = (char *)j + 1)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)j);
          id v18 = -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", v17);
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v19);
          if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0) {
            id v21 = off_24C620;
          }
          else {
            id v21 = off_24C628;
          }
          id v22 = -[__objc2_class animationPathWithKey:](*v21, "animationPathWithKey:", v17);
          -[MCPlug addAnimationPath:](self->_plug, "addAnimationPath:", v22);
          [v18 setAnimationPath:v22];
        }

        id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v41,  v51,  16LL);
      }

      while (v14);
    }
  }

  else
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v23 = self->_filters;
    id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v37,  v50,  16LL);
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (k = 0LL; k != v25; k = (char *)k + 1)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * (void)k) setFilter:0];
        }

        id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v37,  v50,  16LL);
      }

      while (v25);
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v28 = self->_animationPaths;
    id v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v33,  v49,  16LL);
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v34;
      do
      {
        for (m = 0LL; m != v30; m = (char *)m + 1)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(v28);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_animationPaths,  "objectForKey:",  *(void *)(*((void *)&v33 + 1) + 8 * (void)m)),  "setAnimationPath:",  0);
        }

        id v30 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v33,  v49,  16LL);
      }

      while (v30);
    }
  }

- (void)setContainer:(id)a3
{
  container = self->_container;
  if (container)
  {
    -[MCContainer specialRelease](container, "specialRelease");
    self->_container = 0LL;
  }

  uint64_t v6 = (MCContainerEffect *)[a3 specialRetain];
  self->_container = v6;
  if (v6)
  {
    -[MCContainerEffect setEffectID:](self->_container, "setEffectID:", -[MPEffect effectID](self, "effectID"));
    -[MPEffect applyFormattedAttributes](self, "applyFormattedAttributes");
    id v7 = objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage");
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    slides = self->_slides;
    id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v92,  v103,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v93;
      do
      {
        for (unint64_t i = 0LL; i != v12; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v93 != v13) {
            objc_enumerationMutation(slides);
          }
          uint64_t v15 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)i);
          if ([v15 path])
          {
            id v16 = objc_msgSend(v7, "videoAssetForFileAtPath:", objc_msgSend(v15, "path"));
            uint64_t v17 = v9;
          }

          else
          {
            -[NSMutableArray addObjectsFromArray:]( v8,  "addObjectsFromArray:",  -[MCContainerEffect addSlidesForAssets:](self->_container, "addSlidesForAssets:", v9));
            -[NSMutableArray removeAllObjects](v9, "removeAllObjects");
            id v16 = -[MCContainerEffect addSlide](self->_container, "addSlide");
            uint64_t v17 = v8;
          }

          -[NSMutableArray addObject:](v17, "addObject:", v16);
        }

        id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v92,  v103,  16LL);
      }

      while (v12);
    }

    -[NSMutableArray addObjectsFromArray:]( v8,  "addObjectsFromArray:",  -[MCContainerEffect addSlidesForAssets:](self->_container, "addSlidesForAssets:", v9));
    -[NSMutableArray removeAllObjects](v9, "removeAllObjects");
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    secondarySlides = self->_secondarySlides;
    id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( secondarySlides,  "countByEnumeratingWithState:objects:count:",  &v88,  v102,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v89;
      do
      {
        for (id j = 0LL; j != v20; id j = (char *)j + 1)
        {
          if (*(void *)v89 != v21) {
            objc_enumerationMutation(secondarySlides);
          }
          id v23 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)j);
          if ([v23 path])
          {
            id v24 = objc_msgSend(v7, "videoAssetForFileAtPath:", objc_msgSend(v23, "path"));
            id v25 = v9;
          }

          else
          {
            -[NSMutableArray addObjectsFromArray:]( v8,  "addObjectsFromArray:",  -[MCContainerEffect addSlidesForAssets:](self->_container, "addSlidesForAssets:", v9));
            -[NSMutableArray removeAllObjects](v9, "removeAllObjects");
            id v24 = -[MCContainerEffect addSlide](self->_container, "addSlide");
            id v25 = v8;
          }

          -[NSMutableArray addObject:](v25, "addObject:", v24);
        }

        id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( secondarySlides,  "countByEnumeratingWithState:objects:count:",  &v88,  v102,  16LL);
      }

      while (v20);
    }

    -[NSMutableArray addObjectsFromArray:]( v8,  "addObjectsFromArray:",  -[MCContainerEffect addSlidesForAssets:](self->_container, "addSlidesForAssets:", v9));

    id v26 = -[NSMutableArray objectEnumerator](v8, "objectEnumerator");
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v27 = self->_slides;
    id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v84,  v101,  16LL);
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v85;
      do
      {
        for (k = 0LL; k != v29; k = (char *)k + 1)
        {
          if (*(void *)v85 != v30) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend(*(id *)(*((void *)&v84 + 1) + 8 * (void)k), "setSlide:", objc_msgSend(v26, "nextObject"));
        }

        id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v84,  v101,  16LL);
      }

      while (v29);
    }

    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v32 = self->_secondarySlides;
    id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v80,  v100,  16LL);
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v81;
      do
      {
        for (m = 0LL; m != v34; m = (char *)m + 1)
        {
          if (*(void *)v81 != v35) {
            objc_enumerationMutation(v32);
          }
          objc_msgSend(*(id *)(*((void *)&v80 + 1) + 8 * (void)m), "setSlide:", objc_msgSend(v26, "nextObject"));
        }

        id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v80,  v100,  16LL);
      }

      while (v34);
    }

    __int128 v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    texts = self->_texts;
    id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( texts,  "countByEnumeratingWithState:objects:count:",  &v76,  v99,  16LL);
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v77;
      do
      {
        for (n = 0LL; n != v40; n = (char *)n + 1)
        {
          if (*(void *)v77 != v41) {
            objc_enumerationMutation(texts);
          }
          -[NSMutableArray addObject:]( v37,  "addObject:",  [*(id *)(*((void *)&v76 + 1) + 8 * (void)n) attributedString]);
        }

        id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( texts,  "countByEnumeratingWithState:objects:count:",  &v76,  v99,  16LL);
      }

      while (v40);
    }

    id v43 = objc_msgSend( -[MCContainerEffect addTextsForAttributedStrings:](self->_container, "addTextsForAttributedStrings:", v37),  "objectEnumerator");
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v44 = self->_texts;
    id v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v72,  v98,  16LL);
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v73;
      do
      {
        for (iunint64_t i = 0LL; ii != v46; iunint64_t i = (char *)ii + 1)
        {
          if (*(void *)v73 != v47) {
            objc_enumerationMutation(v44);
          }
          objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * (void)ii), "setText:", objc_msgSend(v43, "nextObject"));
        }

        id v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v72,  v98,  16LL);
      }

      while (v46);
    }

    audioPlaylist = self->_audioPlaylist;
    if (audioPlaylist)
    {
      -[MPAudioPlaylist setMontage:]( audioPlaylist,  "setMontage:",  objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage"));
      double v50 = self->_audioPlaylist;
      double v51 = -[MCContainer audioPlaylistCreateIfNeeded](self->_container, "audioPlaylistCreateIfNeeded");
      v52 = v50;
LABEL_72:
      -[MPAudioPlaylist setAudioPlaylist:](v52, "setAudioPlaylist:", v51);
    }
  }

  else
  {
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    v53 = self->_slides;
    id v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v68,  v97,  16LL);
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v69;
      do
      {
        for (jid j = 0LL; jj != v55; jid j = (char *)jj + 1)
        {
          if (*(void *)v69 != v56) {
            objc_enumerationMutation(v53);
          }
          [*(id *)(*((void *)&v68 + 1) + 8 * (void)jj) setSlide:0];
        }

        id v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v68,  v97,  16LL);
      }

      while (v55);
    }

    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    v58 = self->_texts;
    id v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v58,  "countByEnumeratingWithState:objects:count:",  &v64,  v96,  16LL);
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v65;
      do
      {
        for (kk = 0LL; kk != v60; kk = (char *)kk + 1)
        {
          if (*(void *)v65 != v61) {
            objc_enumerationMutation(v58);
          }
          [*(id *)(*((void *)&v64 + 1) + 8 * (void)kk) setText:0];
        }

        id v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v58,  "countByEnumeratingWithState:objects:count:",  &v64,  v96,  16LL);
      }

      while (v60);
    }

    __int128 v63 = self->_audioPlaylist;
    if (v63)
    {
      -[MPAudioPlaylist setMontage:](v63, "setMontage:", 0LL);
      v52 = self->_audioPlaylist;
      double v51 = 0LL;
      goto LABEL_72;
    }
  }

- (void)setParentContainer:(id)a3
{
  if (a3 && self->_parentContainer)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"An effect container may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPEffect needsParallelizer](v3, v4);
  }

  else
  {
    self->_parentContainer = (MPEffectContainer *)a3;
  }

- (BOOL)needsParallelizer
{
  if (v3 != 1.0) {
    return 1;
  }
  -[MPEffect position](self, "position");
  -[MPEffect rotationAngle](self, "rotationAngle");
  if (v7 != 0.0) {
    return 1;
  }
  -[MPEffect size](self, "size");
  BOOL result = 1;
  if (v10 == 2.0 && v9 == 2.0)
  {
    -[MPEffect zPosition](self, "zPosition");
    if (v11 == 0.0)
    {
      -[MPEffect xRotationAngle](self, "xRotationAngle");
      if (v12 == 0.0)
      {
        -[MPEffect yRotationAngle](self, "yRotationAngle");
        if (v13 == 0.0)
        {
          -[MPEffect scale](self, "scale");
          if (v14 == 1.0
            && !objc_msgSend(-[MPEffect filters](self, "filters"), "count")
            && !objc_msgSend(-[MPEffect animationPaths](self, "animationPaths"), "count"))
          {
            parentContainer = self->_parentContainer;
            if (!parentContainer || -[MPEffectContainer countOfEffects](parentContainer, "countOfEffects") <= 1) {
              return 0;
            }
          }
        }
      }
    }

    return 1;
  }

  return result;
}

- (void)scaleMainDuration
{
  double v4 = v3;
  -[MPEffect phaseInDuration](self, "phaseInDuration");
  double v6 = v5;
  -[MPEffect phaseOutDuration](self, "phaseOutDuration");
  double v8 = v7;
  -[MPEffect mainDuration](self, "mainDuration");
  double v10 = v9;
  double v11 = v6 + v8 + v9;
  if (v4 == v11) {
    goto LABEL_26;
  }
  double v12 = v9 + v4 - v11;
  if (v12 >= 0.0)
  {
    if (v9 != v12)
    {
      -[MPEffect willChangeValueForKey:](self, "willChangeValueForKey:", @"mainDuration");
      self->_mainDuration = v12;
      -[MPEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"mainDuration");
    }

    if (self->_container)
    {
      plug = self->_plug;
      if (!plug) {
        plug = -[MPEffectContainer plug](self->_parentContainer, "plug");
      }
      -[MCPlug loopDuration](plug, "loopDuration");
      if (v24 != v12)
      {
        id v22 = plug;
        double v21 = v12;
        goto LABEL_25;
      }
    }
  }

  else
  {
    double v13 = v6 / (v6 + v8);
    double v14 = v4 * v13;
    double v15 = 1.0 - v13;
    if (v4 * v13 != v6)
    {
      -[MPEffect willChangeValueForKey:](self, "willChangeValueForKey:", @"phaseInDuration");
      self->_phaseInDuration = v14;
      -[MPEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"phaseInDuration");
    }

    double v16 = v4 * v15;
    if (v10 != 0.0)
    {
      -[MPEffect willChangeValueForKey:](self, "willChangeValueForKey:", @"mainDuration");
      self->_mainDuration = 0.0;
      -[MPEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"mainDuration");
    }

    if (v16 != v8)
    {
      -[MPEffect willChangeValueForKey:](self, "willChangeValueForKey:", @"phaseOutDuration");
      self->_phaseOutDuration = v16;
      -[MPEffect didChangeValueForKey:](self, "didChangeValueForKey:", @"phaseOutDuration");
    }

    if (self->_container)
    {
      uint64_t v17 = self->_plug;
      if (!v17) {
        uint64_t v17 = -[MPEffectContainer plug](self->_parentContainer, "plug");
      }
      -[MCPlug phaseInDuration](v17, "phaseInDuration");
      if (v18 != v14) {
        -[MCPlug setPhaseInDuration:](v17, "setPhaseInDuration:", v14);
      }
      -[MCPlug phaseOutDuration](v17, "phaseOutDuration");
      if (v19 != v16) {
        -[MCPlug setPhaseOutDuration:](v17, "setPhaseOutDuration:", v16);
      }
      -[MCPlug loopDuration](v17, "loopDuration");
      if (v20 != 0.0)
      {
        double v21 = 0.0;
        id v22 = v17;
LABEL_25:
        -[MCPlug setLoopDuration:](v22, "setLoopDuration:", v21);
      }
    }
  }

- (BOOL)hasMovies
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  slides = self->_slides;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      double v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(slides);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) hasMovie])
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }

        double v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }

  return (char)v3;
}

- (BOOL)hasPanoramasInDocument:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  slides = self->_slides;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      __int128 v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(slides);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) isPanoramaInDocument:a3])
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }

        __int128 v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }

  return (char)v5;
}

- (id)nearestLayerGroup
{
  return objc_msgSend(-[MPEffect parentContainer](self, "parentContainer"), "nearestLayerGroup");
}

- (id)slideForMCSlide:(id)a3
{
  id v5 = -[NSArray copy](-[MPEffect slides](self, "slides"), "copy");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v5);
      }
      __int128 v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      id v11 = objc_msgSend(objc_msgSend(v10, "slide"), "index");
      if (v11 == [a3 index]) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (v10) {
      return v10;
    }
  }

  else
  {
LABEL_9:
  }

  id v12 = objc_msgSend(-[MPEffect secondarySlides](self, "secondarySlides"), "copy");
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
LABEL_13:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v15) {
        objc_enumerationMutation(v12);
      }
      __int128 v10 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
      id v17 = objc_msgSend(objc_msgSend(v10, "slide"), "index");
      if (v17 == [a3 index]) {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v14) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
  }

  else
  {
LABEL_19:
    __int128 v10 = 0LL;
  }

  return v10;
}

- (int64_t)countOfSlides
{
  return (int64_t)-[NSMutableArray count](self->_slides, "count");
}

- (id)objectInSlidesAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 inSlidesAtIndex:(int64_t)a4
{
}

- (void)removeObjectFromSlidesAtIndex:(int64_t)a3
{
}

- (void)replaceObjectInSlidesAtIndex:(int64_t)a3 withObject:(id)a4
{
}

- (int64_t)countOfTexts
{
  return (int64_t)-[NSMutableArray count](self->_texts, "count");
}

- (id)objectInTextsAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_texts, "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 inTextsAtIndex:(int64_t)a4
{
}

- (void)removeObjectFromTextsAtIndex:(int64_t)a3
{
}

- (void)replaceObjectInTextsAtIndex:(int64_t)a3 withObject:(id)a4
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
  obid j = self->_animationPaths;
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
            for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
              if (([v3 isEqualToString:@"size"] & 1) != 0
                || [v3 isEqualToString:@"position"])
              {
                [v12 point];
                v24[0] = (int)v13;
                [v12 point];
                v24[1] = (int)v14;
                uint64_t v15 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v24, 4LL);
              }

              else
              {
                [v12 scalar];
                uint64_t v15 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
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
      for (unint64_t i = 0LL; i != v21; unint64_t i = (char *)i + 1)
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
          id v11 = v10;
          for (id j = 0LL; j != v11; ++j)
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

        -[MPEffect setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v9, v5);
      }

      id v21 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v21);
  }

@end