@interface MPLayerEffect
+ (id)layerEffectWithEffectID:(id)a3;
+ (id)layerEffectWithEffectID:(id)a3 andPaths:(id)a4;
+ (id)layerEffectWithEffectID:(id)a3 andStrings:(id)a4;
+ (id)layerEffectWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5;
- (BOOL)isLive;
- (MPLayerEffect)init;
- (MPLayerEffect)initWithEffectID:(id)a3;
- (MPLayerEffect)initWithEffectID:(id)a3 andPaths:(id)a4;
- (MPLayerEffect)initWithEffectID:(id)a3 andStrings:(id)a4;
- (MPLayerEffect)initWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5;
- (MZEffectTiming)effectTiming;
- (NSArray)slides;
- (NSArray)texts;
- (NSString)effectID;
- (NSString)presetID;
- (double)lowestDisplayTime;
- (double)mainDuration;
- (id)_effectAttributes;
- (id)allSlides:(BOOL)a3;
- (id)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectAttributeForKey:(id)a3;
- (id)effectAttributes;
- (id)formattedAttributes;
- (id)secondarySlides;
- (id)slideForMCSlide:(id)a3;
- (id)slideInformation;
- (int64_t)liveIndex;
- (int64_t)maxNumberOfSecondarySlides;
- (int64_t)maxNumberOfSlides;
- (int64_t)randomSeed;
- (void)_updateEffectTiming;
- (void)_updateTiming:(BOOL)a3;
- (void)addSecondarySlide:(id)a3;
- (void)addSecondarySlides:(id)a3;
- (void)addSlide:(id)a3;
- (void)addSlides:(id)a3;
- (void)addText:(id)a3;
- (void)addTexts:(id)a3;
- (void)applyFormattedAttributes;
- (void)copySecondarySlides:(id)a3;
- (void)copySlides:(id)a3;
- (void)copyTexts:(id)a3;
- (void)createSecondarySlidesWithPaths:(id)a3;
- (void)createSlidesWithPaths:(id)a3;
- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4;
- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4 fillIn:(BOOL)a5;
- (void)dealloc;
- (void)insertSecondarySlides:(id)a3 atIndex:(int64_t)a4;
- (void)insertSlides:(id)a3 atIndex:(int64_t)a4;
- (void)insertTexts:(id)a3 atIndex:(int64_t)a4;
- (void)moveSlidesFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)moveTextsFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)removeAllSecondarySlides;
- (void)removeAllSlides;
- (void)removeAllTexts;
- (void)removeSecondarySlidesAtIndices:(id)a3;
- (void)removeSlidesAtIndices:(id)a3;
- (void)removeTextsAtIndices:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEffectAttribute:(id)a3 forKey:(id)a4;
- (void)setEffectAttributes:(id)a3;
- (void)setEffectID:(id)a3;
- (void)setLayerEffect:(id)a3;
- (void)setLiveIndex:(int64_t)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPresetID:(id)a3;
- (void)setRandomSeed:(int64_t)a3;
- (void)setSkipEffectTiming:(BOOL)a3;
- (void)updateTiming;
@end

@implementation MPLayerEffect

- (MPLayerEffect)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPLayerEffect;
  v2 = -[MPLayer init](&v4, "init");
  if (v2)
  {
    v2->_effectID = (NSString *)@"Undefined";
    v2->_presetID = (NSString *)@"Default";
    v2->_slides = 0LL;
    v2->_secondarySlides = 0LL;
    v2->_texts = 0LL;
    v2->_randomSeed = -1LL;
    v2->_effectAttributes = 0LL;
    v2->_liveIndex = 0LL;
  }

  return v2;
}

+ (id)layerEffectWithEffectID:(id)a3
{
  return [objc_alloc((Class)a1) initWithEffectID:a3];
}

+ (id)layerEffectWithEffectID:(id)a3 andPaths:(id)a4
{
  return [objc_alloc((Class)a1) initWithEffectID:a3 andPaths:a4];
}

+ (id)layerEffectWithEffectID:(id)a3 andStrings:(id)a4
{
  return [objc_alloc((Class)a1) initWithEffectID:a3 andStrings:a4];
}

+ (id)layerEffectWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5
{
  return [objc_alloc((Class)a1) initWithEffectID:a3 strings:a4 paths:a5];
}

- (MPLayerEffect)initWithEffectID:(id)a3
{
  return -[MPLayerEffect initWithEffectID:andPaths:](self, "initWithEffectID:andPaths:", a3, 0LL);
}

- (MPLayerEffect)initWithEffectID:(id)a3 andPaths:(id)a4
{
  v6 = -[MPLayerEffect init](self, "init");
  if (v6)
  {
    v6->_effectID = (NSString *)[a3 copy];
    v6->_presetID = (NSString *)[@"Default" copy];
    if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "effectNeedsRandomSeedInformation:",  v6->_effectID)) {
      v6->_randomSeed = arc4random();
    }
    v6->_supportsEffectTiming = objc_msgSend( +[MREffectManager sharedManager]( MREffectManager,  "sharedManager"),  "hasCustomTimingForEffectID:",  a3);
    -[MPLayerEffect createSlidesWithPaths:](v6, "createSlidesWithPaths:", a4);
    -[MPLayerEffect _updateTiming:](v6, "_updateTiming:", 0LL);
  }

  return v6;
}

- (MPLayerEffect)initWithEffectID:(id)a3 andStrings:(id)a4
{
  v6 = -[MPLayerEffect init](self, "init");
  if (v6)
  {
    v6->_effectID = (NSString *)[a3 copy];
    v6->_presetID = (NSString *)[@"Default" copy];
    if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "effectNeedsRandomSeedInformation:",  v6->_effectID)) {
      v6->_randomSeed = arc4random();
    }
    v6->_supportsEffectTiming = objc_msgSend( +[MREffectManager sharedManager]( MREffectManager,  "sharedManager"),  "hasCustomTimingForEffectID:",  a3);
    -[MPLayerEffect createTextsWithStrings:secondLineFactor:](v6, "createTextsWithStrings:secondLineFactor:", a4, 1.0);
    -[MPLayerEffect _updateTiming:](v6, "_updateTiming:", 0LL);
  }

  return v6;
}

- (MPLayerEffect)initWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5
{
  v8 = -[MPLayerEffect init](self, "init");
  if (v8)
  {
    v8->_effectID = (NSString *)[a3 copy];
    v8->_presetID = (NSString *)[@"Default" copy];
    if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "effectNeedsRandomSeedInformation:",  v8->_effectID)) {
      v8->_randomSeed = arc4random();
    }
    v8->_supportsEffectTiming = objc_msgSend( +[MREffectManager sharedManager]( MREffectManager,  "sharedManager"),  "hasCustomTimingForEffectID:",  a3);
    -[MPLayerEffect createTextsWithStrings:secondLineFactor:](v8, "createTextsWithStrings:secondLineFactor:", a4, 1.0);
    -[MPLayerEffect createSlidesWithPaths:](v8, "createSlidesWithPaths:", a5);
    -[MPLayerEffect _updateTiming:](v8, "_updateTiming:", 0LL);
  }

  return v8;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPLayerEffect;
  id v3 = -[MPLayer description](&v6, "description");
  if (self->_layerEffect) {
    objc_super v4 = @"YES";
  }
  else {
    objc_super v4 = @"NO";
  }
  return [v3 stringByAppendingFormat:@"\t          Has Layer Effect: %@\n", v4];
}

- (void)dealloc
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPLayerEffect;
  -[MPLayer cleanup](&v4, "cleanup");

  self->_effectTiming = 0LL;
  self->_effectID = 0LL;

  self->_presetID = 0LL;
  self->_slides = 0LL;

  self->_secondarySlides = 0LL;
  self->_texts = 0LL;

  self->_layerEffect = 0LL;
  self->_effectAttributes = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPLayerEffect;
  -[MPLayer dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPLayerEffect;
  id v4 = -[MPLayer copyWithZone:](&v6, "copyWithZone:", a3);
  [v4 copySlides:self->_slides];
  [v4 copySecondarySlides:self->_secondarySlides];
  [v4 copyTexts:self->_texts];
  [v4 setEffectID:self->_effectID];
  [v4 setPresetID:self->_presetID];
  [v4 setRandomSeed:self->_randomSeed];
  if (self->_effectAttributes) {
    objc_msgSend(v4, "setEffectAttributes:");
  }
  return v4;
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
  if (self->_randomSeed == -1
    && objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "effectNeedsRandomSeedInformation:",  self->_effectID))
  {
    self->_randomSeed = arc4random();
  }

  -[MPLayerEffect setPresetID:](self, "setPresetID:", @"Default");
  layerEffect = self->_layerEffect;
  if (layerEffect) {
    -[MCContainerEffect setEffectID:](layerEffect, "setEffectID:", a3);
  }
  self->_supportsEffectTiming = objc_msgSend( +[MREffectManager sharedManager]( MREffectManager,  "sharedManager"),  "hasCustomTimingForEffectID:",  self->_effectID);
  -[MPLayerEffect _updateTiming:](self, "_updateTiming:", 1LL);
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
  effectAttributes = self->_effectAttributes;
  if (effectAttributes)
  {

    self->_effectAttributes = 0LL;
  }

  if (self->_layerEffect) {
    -[MPLayerEffect applyFormattedAttributes](self, "applyFormattedAttributes");
  }
  if (self->_supportsEffectTiming) {
    -[MPLayerEffect _updateTiming:](self, "_updateTiming:", 1LL);
  }
}

- (int64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(int64_t)a3
{
  self->_randomSeed = a3;
  layerEffect = self->_layerEffect;
  if (layerEffect) {
    -[MCContainerEffect setEffectAttribute:forKey:]( layerEffect,  "setEffectAttribute:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"),  @"PresetID");
  }
  if (self->_supportsEffectTiming) {
    -[MPLayerEffect _updateTiming:](self, "_updateTiming:", 1LL);
  }
}

- (id)effectAttributes
{
  id result = self->_effectAttributes;
  if (!result) {
    return  objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  -[MPLayerEffect effectID](self, "effectID"),  -[MPLayerEffect presetID](self, "presetID")),  "mutableCopy");
  }
  return result;
}

- (void)setEffectAttributes:(id)a3
{
  effectAttributes = self->_effectAttributes;
  if (effectAttributes)
  {

    self->_effectAttributes = 0LL;
  }

  self->_effectAttributes = (NSMutableDictionary *)[a3 mutableCopy];
  if (self->_layerEffect) {
    -[MPLayerEffect applyFormattedAttributes](self, "applyFormattedAttributes");
  }
}

- (id)effectAttributeForKey:(id)a3
{
  effectAttributes = self->_effectAttributes;
  if (!effectAttributes) {
    return objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  -[MPLayerEffect effectID](self, "effectID"),  -[MPLayerEffect presetID](self, "presetID")),  "objectForKey:",  a3);
  }
  objc_sync_enter(self->_effectAttributes);
  id v6 = -[NSMutableDictionary objectForKey:](self->_effectAttributes, "objectForKey:", a3);
  objc_sync_exit(effectAttributes);
  return v6;
}

- (void)setEffectAttribute:(id)a3 forKey:(id)a4
{
  effectAttributes = self->_effectAttributes;
  if (!effectAttributes)
  {
    effectAttributes = (NSMutableDictionary *)objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager]( MPEffectManager,  "sharedManager"),  "attributesForEffectID:andPresetID:",  -[MPLayerEffect effectID](self, "effectID"),  -[MPLayerEffect presetID](self, "presetID")),  "mutableCopy");
    self->_effectAttributes = effectAttributes;
  }

  objc_sync_enter(effectAttributes);
  -[NSMutableDictionary setValue:forKey:](self->_effectAttributes, "setValue:forKey:", a3, a4);
  objc_sync_exit(effectAttributes);
  layerEffect = self->_layerEffect;
  if (layerEffect) {
    -[MCContainerEffect setEffectAttribute:forKey:](layerEffect, "setEffectAttribute:forKey:", a3, a4);
  }
}

- (NSArray)slides
{
  return &self->_slides->super;
}

- (void)addSlide:(id)a3
{
  id v4 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", a3);
  slides = self->_slides;
  if (slides) {
    id v6 = -[NSMutableArray count](slides, "count");
  }
  else {
    id v6 = 0LL;
  }
  -[MPLayerEffect insertSlides:atIndex:](self, "insertSlides:atIndex:", v4, v6);
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
  -[MPLayerEffect insertSlides:atIndex:](self, "insertSlides:atIndex:", a3, v6);
}

- (void)insertSlides:(id)a3 atIndex:(int64_t)a4
{
  context = objc_autoreleasePoolPush();
  if (!self->_slides) {
    self->_slides = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  v59 = +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [a3 count]);
  -[MPLayerEffect willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2LL);
  if (-[NSMutableArray count](self->_slides, "count")) {
    unsigned int v7 = -[MCContainerEffect isLive](self->_layerEffect, "isLive");
  }
  else {
    unsigned int v7 = 0;
  }
  -[NSMutableArray insertObjects:atIndexes:]( self->_slides,  "insertObjects:atIndexes:",  a3,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [a3 count]));
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v83 objects:v92 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v84;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v84 != v10) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v83 + 1) + 8 * (void)i) setParent:self];
      }

      id v9 = [a3 countByEnumeratingWithState:&v83 objects:v92 count:16];
    }

    while (v9);
  }

  if (self->_layerEffect)
  {
    v62 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (v7) {
      a4 = -[MCContainerEffect nextAvailableSlideIndex](self->_layerEffect, "nextAvailableSlideIndex");
    }
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    id v12 = [a3 countByEnumeratingWithState:&v79 objects:v91 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v61 = *(void *)v80;
      uint64_t v14 = -1LL;
      while (2)
      {
        v15 = 0LL;
        uint64_t v16 = v14;
        do
        {
          if (*(void *)v80 != v61) {
            objc_enumerationMutation(a3);
          }
          id v17 = [*(id *)(*((void *)&v79 + 1) + 8 * (void)v15) path];
          id v18 = v17;
          uint64_t v14 = v17 == 0LL;
          if (v16 != -1 && v16 != v14) {
            goto LABEL_34;
          }
          v15 = (char *)v15 + 1;
          uint64_t v16 = v17 == 0LL;
        }

        while (v13 != v15);
        id v13 = [a3 countByEnumeratingWithState:&v79 objects:v91 count:16];
        if (v13) {
          continue;
        }
        break;
      }

      if (!v18)
      {
LABEL_34:
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        id v24 = [a3 countByEnumeratingWithState:&v75 objects:v90 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v76;
          do
          {
            for (j = 0LL; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v76 != v26) {
                objc_enumerationMutation(a3);
              }
              v28 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)j);
              if ([v28 path]) {
                id v29 = -[MCContainerEffect insertSlideForAsset:atIndex:]( self->_layerEffect,  "insertSlideForAsset:atIndex:",  objc_msgSend( -[MPLayer montage](self, "montage"),  "videoAssetForFileAtPath:",  objc_msgSend(v28, "path")),  a4);
              }
              else {
                id v29 = -[MCContainerEffect insertSlideAtIndex:](self->_layerEffect, "insertSlideAtIndex:", a4);
              }
              -[NSMutableArray addObject:](v62, "addObject:", v29);
              if (v7) {
                a4 = -[MCContainerEffect nextAvailableSlideIndex](self->_layerEffect, "nextAvailableSlideIndex");
              }
              else {
                ++a4;
              }
            }

            id v25 = [a3 countByEnumeratingWithState:&v75 objects:v90 count:16];
          }

          while (v25);
        }

        goto LABEL_47;
      }
    }

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    id v20 = [a3 countByEnumeratingWithState:&v71 objects:v89 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v72;
      do
      {
        for (k = 0LL; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v72 != v22) {
            objc_enumerationMutation(a3);
          }
          -[NSMutableArray addObject:]( v19,  "addObject:",  objc_msgSend( -[MPLayer montage](self, "montage"),  "videoAssetForFileAtPath:",  objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * (void)k), "path")));
        }

        id v21 = [a3 countByEnumeratingWithState:&v71 objects:v89 count:16];
      }

      while (v21);
    }

    -[NSMutableArray addObjectsFromArray:]( v62,  "addObjectsFromArray:",  -[MCContainerEffect insertSlidesForAssets:atIndex:](self->_layerEffect, "insertSlidesForAssets:atIndex:", v19, a4));

LABEL_47:
    id v30 = -[NSMutableArray objectEnumerator](v62, "objectEnumerator");
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    id v31 = [a3 countByEnumeratingWithState:&v67 objects:v88 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v68;
      do
      {
        for (m = 0LL; m != v32; m = (char *)m + 1)
        {
          if (*(void *)v68 != v33) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * (void)m), "setSlide:", objc_msgSend(v30, "nextObject"));
        }

        id v32 = [a3 countByEnumeratingWithState:&v67 objects:v88 count:16];
      }

      while (v32);
    }
  }

  -[MPLayerEffect didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  2LL,  v59,  @"slides");
  if (self->_supportsEffectTiming)
  {
    id v35 = -[MPLayer parentDocument](self, "parentDocument");
    if (!v35)
    {
      if (objc_msgSend( +[MPAuthoringController sharedController]( MPAuthoringController,  "sharedController"),  "isAuthoring")) {
        id v35 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
      }
      else {
        id v35 = 0LL;
      }
    }

    id v36 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
    if ([v35 isLive]
      && (objc_opt_respondsToSelector(self->_effectTiming, "appendSlideInformation:andTextInformation:") & 1) != 0)
    {
      v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      id v38 = [a3 countByEnumeratingWithState:&v63 objects:v87 count:16];
      if (v38)
      {
        id v39 = v38;
        uint64_t v40 = *(void *)v64;
        double height = CGSizeZero.height;
        do
        {
          for (n = 0LL; n != v39; n = (char *)n + 1)
          {
            if (*(void *)v64 != v40) {
              objc_enumerationMutation(a3);
            }
            id v43 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)n) path];
            if (v43)
            {
              id v44 = v43;
              id v45 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
              if (v35) {
                [v35 resolutionForPath:v44];
              }
              else {
                objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "resolutionForAssetAtPath:",  v44);
              }
              if (v46 == CGSizeZero.width && v47 == height && v36 != 0LL) {
                [v36 resolutionForPath:v44];
              }
              double v50 = v46 / v47;
              *(float *)&double v50 = v50;
              objc_msgSend( v45,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v50),  @"aspectRatio");
              -[NSMutableArray addObject:](v37, "addObject:", v45);
            }
          }

          id v39 = [a3 countByEnumeratingWithState:&v63 objects:v87 count:16];
        }

        while (v39);
      }

      if (-[NSMutableArray count](v37, "count")) {
        -[MZEffectTiming appendSlideInformation:andTextInformation:]( self->_effectTiming,  "appendSlideInformation:andTextInformation:",  v37,  0LL);
      }

      -[MZEffectTiming phaseInDuration](self->_effectTiming, "phaseInDuration");
      double v52 = v51;
      -[MZEffectTiming phaseOutDuration](self->_effectTiming, "phaseOutDuration");
      double v54 = v53;
      -[MZEffectTiming mainDuration](self->_effectTiming, "mainDuration");
      double v56 = v55;
      -[MPLayerEffect setPhaseInDuration:](self, "setPhaseInDuration:", v52);
      -[MPLayerEffect setPhaseOutDuration:](self, "setPhaseOutDuration:", v54);
      -[MPLayerEffect setDuration:](self, "setDuration:", v54 + v52 + v56);
      if (-[NSMutableArray count](self->_slides, "count"))
      {
        v57 = objc_msgSend( objc_msgSend(-[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", 0), "slide"),  "index");
        v58 = (char *)((_BYTE *)objc_msgSend( objc_msgSend(-[NSMutableArray lastObject](self->_slides, "lastObject"), "slide"),  "index")
                     - v57
                     + 1);
      }

      else
      {
        v57 = 0LL;
        v58 = 0LL;
      }

      -[MZEffectTiming setMultiImageSlideRange:](self->_effectTiming, "setMultiImageSlideRange:", v57, v58);
    }

    else
    {
      -[MPLayerEffect _updateTiming:](self, "_updateTiming:", 1LL);
    }
  }

  objc_autoreleasePoolPop(context);
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
        unsigned int v7 = objc_autoreleasePoolPush();
        -[MPLayerEffect willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"slides");
        if (self->_layerEffect)
        {
          id v8 = [a3 mutableCopy];
          if (-[MCContainerEffect isLive](self->_layerEffect, "isLive")) {
            objc_msgSend( v8,  "shiftIndexesStartingAtIndex:by:",  objc_msgSend(v8, "firstIndex"),  self->_liveIndex - (void)objc_msgSend(a3, "count"));
          }
          -[MCContainerEffect removeSlidesAtIndices:](self->_layerEffect, "removeSlidesAtIndices:", v8);
        }

        id v9 = [a3 lastIndex];
        if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          for (id i = v9; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
          {
            id v11 = -[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", i);
            [v11 setParent:0];
            [v11 setSlide:0];
          }
        }

        -[NSMutableArray removeObjectsAtIndexes:](self->_slides, "removeObjectsAtIndexes:", a3);
        -[MPLayerEffect didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"slides");
        if (self->_supportsEffectTiming)
        {
          id v12 = -[MPLayer parentDocument](self, "parentDocument");
          if (!v12)
          {
            if (objc_msgSend( +[MPAuthoringController sharedController]( MPAuthoringController,  "sharedController"),  "isAuthoring")) {
              id v12 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
            }
            else {
              id v12 = 0LL;
            }
          }

          if (![v12 isLive]
            || (objc_opt_respondsToSelector(self->_effectTiming, "appendSlideInformation:andTextInformation:") & 1) == 0)
          {
            -[MPLayerEffect _updateTiming:](self, "_updateTiming:", 1LL);
          }

          if ([v12 isLive])
          {
            if (-[NSMutableArray count](self->_slides, "count"))
            {
              id v13 = objc_msgSend( objc_msgSend(-[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", 0), "slide"),  "index");
              uint64_t v14 = (char *)((_BYTE *)objc_msgSend( objc_msgSend(-[NSMutableArray lastObject](self->_slides, "lastObject"), "slide"),  "index")
                           - v13
                           + 1);
            }

            else
            {
              id v13 = 0LL;
              uint64_t v14 = 0LL;
            }

            -[MZEffectTiming setMultiImageSlideRange:](self->_effectTiming, "setMultiImageSlideRange:", v13, v14);
          }
        }

        objc_autoreleasePoolPop(v7);
      }
    }
  }

- (void)removeAllSlides
{
  slides = self->_slides;
  if (slides) {
    id v4 = -[NSMutableArray count](slides, "count");
  }
  else {
    id v4 = 0LL;
  }
  -[MPLayerEffect removeSlidesAtIndices:]( self,  "removeSlidesAtIndices:",  +[NSIndexSet indexSetWithIndexesInRange:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndexesInRange:", 0LL, v4));
}

- (void)moveSlidesFromIndices:(id)a3 toIndex:(int64_t)a4
{
  slides = self->_slides;
  if (slides)
  {
    if (self->_layerEffect)
    {
      -[MCContainerEffect moveSlidesAtIndices:toIndex:](self->_layerEffect, "moveSlidesAtIndices:toIndex:", a3, a4);
      slides = self->_slides;
    }

    id v8 = -[NSMutableArray objectsAtIndexes:](slides, "objectsAtIndexes:", a3);
    -[NSMutableArray removeObjectsAtIndexes:](self->_slides, "removeObjectsAtIndexes:", a3);
    -[NSMutableArray insertObjects:atIndexes:]( self->_slides,  "insertObjects:atIndexes:",  v8,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [v8 count]));
  }

- (id)secondarySlides
{
  return self->_secondarySlides;
}

- (void)addSecondarySlide:(id)a3
{
  id v4 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", a3);
  secondarySlides = self->_secondarySlides;
  if (secondarySlides) {
    id v6 = -[NSMutableArray count](secondarySlides, "count");
  }
  else {
    id v6 = 0LL;
  }
  -[MPLayerEffect insertSecondarySlides:atIndex:](self, "insertSecondarySlides:atIndex:", v4, v6);
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
  -[MPLayerEffect insertSecondarySlides:atIndex:](self, "insertSecondarySlides:atIndex:", a3, v6);
}

- (void)insertSecondarySlides:(id)a3 atIndex:(int64_t)a4
{
  context = objc_autoreleasePoolPush();
  if (!self->_secondarySlides) {
    self->_secondarySlides = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  id v24 = +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [a3 count]);
  -[MPLayerEffect willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2LL);
  -[NSMutableArray insertObjects:atIndexes:]( self->_secondarySlides,  "insertObjects:atIndexes:",  a3,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [a3 count]));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (id i = 0LL; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        [v11 setParent:self];
        [v11 setIsSecondary:1];
      }

      id v8 = [a3 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }

    while (v8);
  }

  if (self->_layerEffect)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v13 = [a3 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(a3);
          }
          id v17 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)j);
          if ([v17 path]) {
            id v18 = -[MCContainerEffect insertSlideForAsset:atIndex:]( self->_layerEffect,  "insertSlideForAsset:atIndex:",  objc_msgSend( -[MPLayer montage](self, "montage"),  "videoAssetForFileAtPath:",  objc_msgSend(v17, "path")),  (char *)-[MPLayerEffect maxNumberOfSlides](self, "maxNumberOfSlides") + (void)j + a4);
          }
          else {
            id v18 = -[MCContainerEffect insertSlideAtIndex:]( self->_layerEffect,  "insertSlideAtIndex:",  (char *)-[MPLayerEffect maxNumberOfSlides](self, "maxNumberOfSlides") + (void)j + a4);
          }
          -[NSMutableArray addObject:](v12, "addObject:", v18);
        }

        id v14 = [a3 countByEnumeratingWithState:&v30 objects:v39 count:16];
        a4 += (int64_t)j;
      }

      while (v14);
    }

    id v19 = -[NSMutableArray objectEnumerator](v12, "objectEnumerator");
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v20 = [a3 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (k = 0LL; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)k), "setSlide:", objc_msgSend(v19, "nextObject"));
        }

        id v21 = [a3 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }

      while (v21);
    }
  }

  -[MPLayerEffect didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  2LL,  v24,  @"secondarySlides");
  objc_autoreleasePoolPop(context);
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
        -[MPLayerEffect willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"secondarySlides");
        layerEffect = self->_layerEffect;
        if (layerEffect) {
          -[MCContainerEffect removeSlidesAtIndices:](layerEffect, "removeSlidesAtIndices:", a3);
        }
        id v9 = [a3 lastIndex];
        if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          for (id i = v9; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
          {
            id v11 = -[NSMutableArray objectAtIndex:](self->_secondarySlides, "objectAtIndex:", i);
            [v11 setParent:0];
            [v11 setSlide:0];
          }
        }

        -[NSMutableArray removeObjectsAtIndexes:](self->_secondarySlides, "removeObjectsAtIndexes:", a3);
        -[MPLayerEffect didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"secondarySlides");
        objc_autoreleasePoolPop(v7);
      }
    }
  }

- (NSArray)texts
{
  return &self->_texts->super;
}

- (void)addText:(id)a3
{
  id v4 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", a3);
  texts = self->_texts;
  if (texts) {
    id v6 = -[NSMutableArray count](texts, "count");
  }
  else {
    id v6 = 0LL;
  }
  -[MPLayerEffect insertTexts:atIndex:](self, "insertTexts:atIndex:", v4, v6);
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
  -[MPLayerEffect insertTexts:atIndex:](self, "insertTexts:atIndex:", a3, v6);
}

- (void)insertTexts:(id)a3 atIndex:(int64_t)a4
{
  id v7 = objc_autoreleasePoolPush();
  if (!self->_texts) {
    self->_texts = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  id v8 = +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [a3 count]);
  -[MPLayerEffect willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  2LL,  v8,  @"texts");
  -[NSMutableArray insertObjects:atIndexes:]( self->_texts,  "insertObjects:atIndexes:",  a3,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [a3 count]));
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
      id v12 = 0LL;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)v12) setParent:self];
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [a3 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }

    while (v10);
  }

  if (self->_layerEffect)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
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
        id v17 = 0LL;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(a3);
          }
          -[NSMutableArray addObject:]( v13,  "addObject:",  [*(id *)(*((void *)&v27 + 1) + 8 * (void)v17) attributedString]);
          id v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }

      while (v15);
    }

    id v18 = objc_msgSend( -[MCContainerEffect insertTextsForAttributedStrings:atIndex:]( self->_layerEffect,  "insertTextsForAttributedStrings:atIndex:",  v13,  a4),  "objectEnumerator");
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
        uint64_t v22 = 0LL;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)v22), "setText:", objc_msgSend(v18, "nextObject"));
          uint64_t v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = [a3 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }

      while (v20);
    }
  }

  -[MPLayerEffect didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2LL, v8, @"texts");
  objc_autoreleasePoolPop(v7);
}

- (void)removeTextsAtIndices:(id)a3
{
  texts = self->_texts;
  if (texts && -[NSMutableArray count](texts, "count"))
  {
    id v6 = objc_autoreleasePoolPush();
    -[MPLayerEffect willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"texts");
    layerEffect = self->_layerEffect;
    if (layerEffect) {
      -[MCContainerEffect removeTextsAtIndices:](layerEffect, "removeTextsAtIndices:", a3);
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
    -[MPLayerEffect didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"texts");
    objc_autoreleasePoolPop(v6);
  }

- (void)removeAllTexts
{
}

- (void)moveTextsFromIndices:(id)a3 toIndex:(int64_t)a4
{
  texts = self->_texts;
  if (texts)
  {
    if (self->_layerEffect)
    {
      -[MCContainerEffect moveTextsAtIndices:toIndex:](self->_layerEffect, "moveTextsAtIndices:toIndex:", a3, a4);
      texts = self->_texts;
    }

    id v8 = -[NSMutableArray objectsAtIndexes:](texts, "objectsAtIndexes:", a3);
    -[NSMutableArray removeObjectsAtIndexes:](self->_texts, "removeObjectsAtIndexes:", a3);
    -[NSMutableArray insertObjects:atIndexes:]( self->_texts,  "insertObjects:atIndexes:",  v8,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [v8 count]));
  }

- (void)removeAllSecondarySlides
{
  secondarySlides = self->_secondarySlides;
  if (secondarySlides) {
    id v4 = -[NSMutableArray count](secondarySlides, "count");
  }
  else {
    id v4 = 0LL;
  }
  -[MPLayerEffect removeSecondarySlidesAtIndices:]( self,  "removeSecondarySlidesAtIndices:",  +[NSIndexSet indexSetWithIndexesInRange:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndexesInRange:", 0LL, v4));
}

- (double)mainDuration
{
  double v4 = v3;
  -[MPLayer phaseInDuration](self, "phaseInDuration");
  double v6 = v4 - v5;
  -[MPLayer phaseOutDuration](self, "phaseOutDuration");
  return v6 - v7;
}

- (void)setDuration:(double)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MPLayerEffect;
  -[MPLayer setDuration:](&v19, "setDuration:", a3);
  effectTiming = self->_effectTiming;
  if (effectTiming)
  {
    -[MPLayerInternal phaseInDuration](self->super._internal, "phaseInDuration");
    double v6 = v5;
    -[MPLayerEffect mainDuration](self, "mainDuration");
    double v8 = v7;
    -[MPLayerInternal phaseOutDuration](self->super._internal, "phaseOutDuration");
    -[MZEffectTiming setPhaseInDuration:mainDuration:phaseOutDuration:]( effectTiming,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  v6,  v8,  v9);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = -[MPLayerEffect slides](self, "slides", 0LL);
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (id i = 0LL; i != v12; id i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) resetCachedTimes];
      }

      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v12);
  }

- (void)setPhaseInDuration:(double)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MPLayerEffect;
  -[MPLayer setPhaseInDuration:](&v19, "setPhaseInDuration:", a3);
  effectTiming = self->_effectTiming;
  if (effectTiming)
  {
    -[MPLayerInternal phaseInDuration](self->super._internal, "phaseInDuration");
    double v6 = v5;
    -[MPLayerEffect mainDuration](self, "mainDuration");
    double v8 = v7;
    -[MPLayerInternal phaseOutDuration](self->super._internal, "phaseOutDuration");
    -[MZEffectTiming setPhaseInDuration:mainDuration:phaseOutDuration:]( effectTiming,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  v6,  v8,  v9);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = -[MPLayerEffect slides](self, "slides", 0LL);
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (id i = 0LL; i != v12; id i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) resetCachedTimes];
      }

      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v12);
  }

- (void)setPhaseOutDuration:(double)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MPLayerEffect;
  -[MPLayer setPhaseOutDuration:](&v19, "setPhaseOutDuration:", a3);
  effectTiming = self->_effectTiming;
  if (effectTiming)
  {
    -[MPLayerInternal phaseInDuration](self->super._internal, "phaseInDuration");
    double v6 = v5;
    -[MPLayerEffect mainDuration](self, "mainDuration");
    double v8 = v7;
    -[MPLayerInternal phaseOutDuration](self->super._internal, "phaseOutDuration");
    -[MZEffectTiming setPhaseInDuration:mainDuration:phaseOutDuration:]( effectTiming,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  v6,  v8,  v9);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = -[MPLayerEffect slides](self, "slides", 0LL);
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (id i = 0LL; i != v12; id i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) resetCachedTimes];
      }

      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v12);
  }

- (void)_updateEffectTiming
{
  if (self->_supportsEffectTiming && !self->_skipEffectTiming)
  {

    self->_effectTiming = 0LL;
    id v3 = -[MPLayerEffect formattedAttributes](self, "formattedAttributes");
    id v4 = -[MPLayer parentDocument](self, "parentDocument");
    if (v4
      || (double v6 = 1.77777779,
          objc_msgSend( +[MPAuthoringController sharedController]( MPAuthoringController,  "sharedController"),  "isAuthoring"))
      && (id v4 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument")) != 0)
    {
      [v4 aspectRatio];
      double v6 = v5;
    }

    self->_effectTiming = (MZEffectTiming *) objc_msgSend( +[MREffectManager sharedManager]( MREffectManager,  "sharedManager"),  "customTimingWithEffectID:effectAttributes:slideInformation:textInformati on:inAspectRatio:",  self->_effectID,  v3,  -[MPLayerEffect slideInformation](self, "slideInformation"),  self->_texts,  v6);
  }

- (id)_effectAttributes
{
  id v3 =  objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  -[MPLayerEffect effectID](self, "effectID"),  -[MPLayerEffect presetID](self, "presetID")),  "mutableCopy");
  [v3 addEntriesFromDictionary:self->super._attributes];
  return v3;
}

- (void)_updateTiming:(BOOL)a3
{
  id v5 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  if (!self->_supportsEffectTiming)
  {
    if (a3) {
      return;
    }
    [v5 defaultDurationsForEffectID:self->_effectID phaseInDuration:&v13 mainDuration:&v14 phaseOutDuration:&v12];
    double v7 = v13;
    goto LABEL_7;
  }

  -[MPLayerEffect _updateEffectTiming](self, "_updateEffectTiming");
  -[MZEffectTiming phaseInDuration](self->_effectTiming, "phaseInDuration");
  double v7 = v6;
  double v13 = v6;
  -[MZEffectTiming phaseOutDuration](self->_effectTiming, "phaseOutDuration");
  double v9 = v8;
  double v12 = v8;
  -[MZEffectTiming mainDuration](self->_effectTiming, "mainDuration");
  double v14 = v10;
  if (!a3)
  {
LABEL_7:
    -[MPLayerInternal setPhaseInDuration:](self->super._internal, "setPhaseInDuration:", v7);
    -[MPLayerInternal setPhaseOutDuration:](self->super._internal, "setPhaseOutDuration:", v12);
    -[MPLayerInternal setDuration:](self->super._internal, "setDuration:", v14 + v13 + v12);
    return;
  }

  if (self->_supportsEffectTiming)
  {
    double v11 = v10;
    -[MPLayerEffect setPhaseInDuration:](self, "setPhaseInDuration:", v7);
    -[MPLayerEffect setPhaseOutDuration:](self, "setPhaseOutDuration:", v9);
    -[MPLayerEffect setDuration:](self, "setDuration:", v11 + v7 + v9);
  }

- (id)allSlides:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  double v6 = -[MPLayerEffect slides](self, "slides");
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (id i = 0LL; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if ([v11 path]) {
          [v5 addObject:v11];
        }
      }

      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    }

    while (v8);
  }

  if (v3)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v12 = -[MPLayerEffect secondarySlides](self, "secondarySlides", 0LL);
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          __int128 v17 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)j);
          if ([v17 path]) {
            [v5 addObject:v17];
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }

      while (v14);
    }
  }

  return v5;
}

- (MZEffectTiming)effectTiming
{
  return self->_effectTiming;
}

- (int64_t)liveIndex
{
  return self->_liveIndex;
}

- (void)setLiveIndex:(int64_t)a3
{
  self->_liveIndex = a3;
}

- (double)lowestDisplayTime
{
  effectTiming = self->_effectTiming;
  if (!effectTiming) {
    return 0.0;
  }
  -[MZEffectTiming lowestDisplayTime](effectTiming, "lowestDisplayTime");
  return result;
}

- (id)container
{
  return self->_layerEffect;
}

- (int64_t)maxNumberOfSlides
{
  return (int64_t)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSlidesForEffectID:",  -[MPLayerEffect effectID](self, "effectID"));
}

- (int64_t)maxNumberOfSecondarySlides
{
  return (int64_t)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSecondarySlidesForEffectID:",  -[MPLayerEffect effectID](self, "effectID"));
}

- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4
{
}

- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4 fillIn:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  uint64_t v9 = 136LL;
  if (a3 && !self->_texts && [a3 count]) {
    self->_texts = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  id v11 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfTextsForEffectID:",  -[MPLayerEffect effectID](self, "effectID"));
  if (v7) {
    id v12 = [v7 count];
  }
  else {
    id v12 = 0LL;
  }
  else {
    uint64_t v13 = (uint64_t)v12;
  }
  if (v5) {
    uint64_t v14 = (uint64_t)v11;
  }
  else {
    uint64_t v14 = v13;
  }
  if (v14 >= 1)
  {
    uint64_t v15 = 0LL;
    __int128 v16 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
    p_cache = (objc_class *)(&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2 + 16);
    while (1)
    {
      if (v7)
      {
        id v18 = v15 >= (uint64_t)v12 ? [v7 lastObject] : objc_msgSend(v7, "objectAtIndex:", v15);
        __int128 v19 = v18;
      }

      else
      {
        __int128 v19 = 0LL;
      }

      uint64_t v20 = objc_opt_class(v16[204], v10);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0) {
        break;
      }
      __int128 v21 = v19;
LABEL_32:
      id v35 = [objc_alloc(p_cache + 283) initWithAttributedString:v21];

      [v35 setParent:self];
      [*(id *)((char *)&self->super.super.isa + v9) addObject:v35];

      if (v14 == ++v15) {
        return;
      }
    }

    id v22 = v7;
    uint64_t v23 = v9;
    id v24 = v12;
    __int128 v25 = -[NSMutableAttributedString initWithAttributedString:]( [NSMutableAttributedString alloc],  "initWithAttributedString:",  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:",  -[MPLayerEffect effectID](self, "effectID"),  -[MPLayerEffect presetID](self, "presetID"),  v15));
    __int128 v21 = v25;
    if (v19)
    {
      -[NSMutableAttributedString replaceCharactersInRange:withString:]( v25,  "replaceCharactersInRange:withString:",  0LL,  -[NSMutableAttributedString length](v25, "length"),  v19);
      if (a4 == 1.0 || ![v19 length])
      {
        uint64_t v9 = v23;
        __int128 v16 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
LABEL_31:
        p_cache = (objc_class *)&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2.cache;
        goto LABEL_32;
      }

      __int128 v26 = (char *)objc_msgSend(v19, "lineRangeForRange:", 0, 1);
      __int128 v28 = &v26[v27];
      __int128 v29 = (char *)[v19 length];
      if (v29 != v28)
      {
        __int128 v36 = (char *)(v29 - v28);
        __int128 v30 = (const __CTFont *)objc_msgSend( -[NSMutableAttributedString attributesAtIndex:effectiveRange:]( v21,  "attributesAtIndex:effectiveRange:",  0,  v37),  "objectForKey:",  kCTFontAttributeName);
        __int128 v31 = CTFontCopyPostScriptName(v30);
        CGFloat Size = CTFontGetSize(v30);
        CTFontRef v33 = CTFontCreateWithName(v31, Size * a4, 0LL);
        CFRelease(v31);
        -[NSMutableAttributedString addAttribute:value:range:]( v21,  "addAttribute:value:range:",  kCTFontAttributeName,  v33,  v28,  v36);
        CTFontRef v34 = v33;
        id v12 = v24;
        CFRelease(v34);
      }
    }

    uint64_t v9 = v23;
    __int128 v16 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
    id v7 = v22;
    goto LABEL_31;
  }

- (void)createSlidesWithPaths:(id)a3
{
  id v5 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSlidesForEffectID:",  -[MPLayerEffect effectID](self, "effectID"));
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v5 = [a3 count];
  }
  if (self->_slides) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = (uint64_t)v5 < 1;
  }
  if (v6)
  {
  }

  else
  {
    self->_slides = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  unint64_t v7 = 0LL;
  do
  {
    else {
      uint64_t v9 = objc_alloc_init(&OBJC_CLASS___MPSlide);
    }
    uint64_t v10 = v9;
    -[MPSlide setParent:](v9, "setParent:", self);
    -[NSMutableArray addObject:](self->_slides, "addObject:", v10);

    ++v7;
  }

  while (v5 != (id)v7);
}

- (void)createSecondarySlidesWithPaths:(id)a3
{
  id v5 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSecondarySlidesForEffectID:",  -[MPLayerEffect effectID](self, "effectID"));
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
    id v11 = v10;
    -[MPSlide setParent:](v10, "setParent:", self);
    -[MPSlide setIsSecondary:](v11, "setIsSecondary:", 1LL);
    -[NSMutableArray addObject:](self->_secondarySlides, "addObject:", v11);

    ++v8;
  }

  while (v6 != (id)v8);
}

- (BOOL)isLive
{
  if (self->_layerEffect) {
    layerEffect = self->_layerEffect;
  }
  else {
    layerEffect = -[MPLayer parentDocument](self, "parentDocument");
  }
  return -[MCContainerEffect isLive](layerEffect, "isLive");
}

- (void)setSkipEffectTiming:(BOOL)a3
{
  self->_skipEffectTiming = a3;
}

- (void)updateTiming
{
}

- (id)formattedAttributes
{
  if (self->super._attributes) {
    BOOL v3 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  -[MPLayerEffect _effectAttributes](self, "_effectAttributes"));
  }
  else {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v4 = v3;
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  -[MPLayerEffect presetID](self, "presetID"),  @"PresetID");
  if ((self->_randomSeed & 0x8000000000000000LL) == 0) {
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"),  @"RandomSeed");
  }
  return v4;
}

- (void)applyFormattedAttributes
{
  if (self->_layerEffect)
  {
    -[MCContainerEffect setEffectAttributes:]( self->_layerEffect,  "setEffectAttributes:",  -[MPLayerEffect _effectAttributes](self, "_effectAttributes"));
    -[MCContainerEffect setEffectAttribute:forKey:]( self->_layerEffect,  "setEffectAttribute:forKey:",  -[MPLayerEffect presetID](self, "presetID"),  @"PresetID");
    if ((self->_randomSeed & 0x8000000000000000LL) == 0) {
      -[MCContainerEffect setEffectAttribute:forKey:]( self->_layerEffect,  "setEffectAttribute:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"),  @"RandomSeed");
    }
  }

- (id)slideInformation
{
  id v21 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v3 = -[MPLayer parentDocument](self, "parentDocument");
  if (!v3)
  {
    if (objc_msgSend( +[MPAuthoringController sharedController]( MPAuthoringController,  "sharedController"),  "isAuthoring")) {
      id v3 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
    }
    else {
      id v3 = 0LL;
    }
  }

  id v4 = objc_msgSend( +[MPAuthoringController sharedController](MPAuthoringController, "sharedController"),  "authoredDocument");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  slides = self->_slides;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    double height = CGSizeZero.height;
    do
    {
      for (id i = 0LL; i != v7; id i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(slides);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v12 = [v11 path];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          if (v3) {
            [v3 resolutionForPath:v13];
          }
          else {
            objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "resolutionForAssetAtPath:",  v13);
          }
          if (v15 == CGSizeZero.width && v16 == height && v4 != 0LL) {
            [v4 resolutionForPath:v13];
          }
          double v19 = v15 / v16;
          *(float *)&double v19 = v19;
          -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v19),  @"aspectRatio");
          if ([v11 hasMovie])
          {
            -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  @"isMovie");
            [v3 durationForPath:v13];
            -[NSMutableDictionary setObject:forKey:]( v14,  "setObject:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"duration");
          }

          [v21 addObject:v14];
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    }

    while (v7);
  }

  return v21;
}

- (void)setLayerEffect:(id)a3
{
  id v5 = (MCContainerEffect *)a3;
  self->_layerEffect = v5;
  if (v5)
  {
    -[MCContainerEffect setEffectID:](self->_layerEffect, "setEffectID:", -[MPLayerEffect effectID](self, "effectID"));
    -[MPLayerEffect applyFormattedAttributes](self, "applyFormattedAttributes");
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    slides = self->_slides;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v86,  v97,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v87;
      do
      {
        for (id i = 0LL; i != v10; id i = (char *)i + 1)
        {
          if (*(void *)v87 != v11) {
            objc_enumerationMutation(slides);
          }
          id v13 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
          if ([v13 path])
          {
            id v14 = objc_msgSend( -[MPLayer montage](self, "montage"),  "videoAssetForFileAtPath:",  objc_msgSend(v13, "path"));
            double v15 = v7;
          }

          else
          {
            -[NSMutableArray addObjectsFromArray:]( v6,  "addObjectsFromArray:",  -[MCContainerEffect addSlidesForAssets:](self->_layerEffect, "addSlidesForAssets:", v7));
            -[NSMutableArray removeAllObjects](v7, "removeAllObjects");
            id v14 = -[MCContainerEffect addSlide](self->_layerEffect, "addSlide");
            double v15 = v6;
          }

          -[NSMutableArray addObject:](v15, "addObject:", v14);
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( slides,  "countByEnumeratingWithState:objects:count:",  &v86,  v97,  16LL);
      }

      while (v10);
    }

    -[NSMutableArray addObjectsFromArray:]( v6,  "addObjectsFromArray:",  -[MCContainerEffect addSlidesForAssets:](self->_layerEffect, "addSlidesForAssets:", v7));
    -[NSMutableArray removeAllObjects](v7, "removeAllObjects");
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    secondarySlides = self->_secondarySlides;
    id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( secondarySlides,  "countByEnumeratingWithState:objects:count:",  &v82,  v96,  16LL);
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v83;
      do
      {
        for (j = 0LL; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v83 != v19) {
            objc_enumerationMutation(secondarySlides);
          }
          id v21 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)j);
          if ([v21 path])
          {
            id v22 = objc_msgSend( -[MPLayer montage](self, "montage"),  "videoAssetForFileAtPath:",  objc_msgSend(v21, "path"));
            __int128 v23 = v7;
          }

          else
          {
            -[NSMutableArray addObjectsFromArray:]( v6,  "addObjectsFromArray:",  -[MCContainerEffect addSlidesForAssets:](self->_layerEffect, "addSlidesForAssets:", v7));
            -[NSMutableArray removeAllObjects](v7, "removeAllObjects");
            id v22 = -[MCContainerEffect addSlide](self->_layerEffect, "addSlide");
            __int128 v23 = v6;
          }

          -[NSMutableArray addObject:](v23, "addObject:", v22);
        }

        id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( secondarySlides,  "countByEnumeratingWithState:objects:count:",  &v82,  v96,  16LL);
      }

      while (v18);
    }

    -[NSMutableArray addObjectsFromArray:]( v6,  "addObjectsFromArray:",  -[MCContainerEffect addSlidesForAssets:](self->_layerEffect, "addSlidesForAssets:", v7));

    id v24 = -[NSMutableArray objectEnumerator](v6, "objectEnumerator");
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v25 = self->_slides;
    id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v78,  v95,  16LL);
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v79;
      do
      {
        for (k = 0LL; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v79 != v28) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * (void)k), "setSlide:", objc_msgSend(v24, "nextObject"));
        }

        id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v78,  v95,  16LL);
      }

      while (v27);
    }

    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v30 = self->_secondarySlides;
    id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v74,  v94,  16LL);
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v75;
      do
      {
        for (m = 0LL; m != v32; m = (char *)m + 1)
        {
          if (*(void *)v75 != v33) {
            objc_enumerationMutation(v30);
          }
          objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * (void)m), "setSlide:", objc_msgSend(v24, "nextObject"));
        }

        id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v74,  v94,  16LL);
      }

      while (v32);
    }

    id v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    texts = self->_texts;
    id v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( texts,  "countByEnumeratingWithState:objects:count:",  &v70,  v93,  16LL);
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v71;
      do
      {
        for (n = 0LL; n != v38; n = (char *)n + 1)
        {
          if (*(void *)v71 != v39) {
            objc_enumerationMutation(texts);
          }
          -[NSMutableArray addObject:]( v35,  "addObject:",  [*(id *)(*((void *)&v70 + 1) + 8 * (void)n) attributedString]);
        }

        id v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( texts,  "countByEnumeratingWithState:objects:count:",  &v70,  v93,  16LL);
      }

      while (v38);
    }

    id v41 = objc_msgSend( -[MCContainerEffect addTextsForAttributedStrings:](self->_layerEffect, "addTextsForAttributedStrings:", v35),  "objectEnumerator");
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    v42 = self->_texts;
    id v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v66,  v92,  16LL);
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v67;
      do
      {
        for (iid i = 0LL; ii != v44; iid i = (char *)ii + 1)
        {
          if (*(void *)v67 != v45) {
            objc_enumerationMutation(v42);
          }
          objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * (void)ii), "setText:", objc_msgSend(v41, "nextObject"));
        }

        id v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v66,  v92,  16LL);
      }

      while (v44);
    }

    v65.receiver = self;
    v65.super_class = (Class)&OBJC_CLASS___MPLayerEffect;
    -[MPLayer configureActions](&v65, "configureActions");
  }

  else
  {
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    double v47 = self->_slides;
    id v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v61,  v91,  16LL);
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v62;
      do
      {
        for (jj = 0LL; jj != v49; jj = (char *)jj + 1)
        {
          if (*(void *)v62 != v50) {
            objc_enumerationMutation(v47);
          }
          [*(id *)(*((void *)&v61 + 1) + 8 * (void)jj) setSlide:0];
        }

        id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v61,  v91,  16LL);
      }

      while (v49);
    }

    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    double v52 = self->_texts;
    id v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v52,  "countByEnumeratingWithState:objects:count:",  &v57,  v90,  16LL);
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v58;
      do
      {
        for (kk = 0LL; kk != v54; kk = (char *)kk + 1)
        {
          if (*(void *)v58 != v55) {
            objc_enumerationMutation(v52);
          }
          [*(id *)(*((void *)&v57 + 1) + 8 * (void)kk) setText:0];
        }

        id v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v52,  "countByEnumeratingWithState:objects:count:",  &v57,  v90,  16LL);
      }

      while (v54);
    }
  }

- (void)copySlides:(id)a3
{
  if (a3)
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

    -[MPLayerEffect addSlides:](self, "addSlides:", v5);
  }

- (void)copySecondarySlides:(id)a3
{
  if (a3)
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

    -[MPLayerEffect addSecondarySlides:](self, "addSecondarySlides:", v5);
  }

- (void)copyTexts:(id)a3
{
  if (a3)
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

    -[MPLayerEffect addTexts:](self, "addTexts:", v5);
  }

- (id)slideForMCSlide:(id)a3
{
  id v5 = -[NSArray copy](-[MPLayerEffect slides](self, "slides"), "copy");
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
      id v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
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

  id v12 = objc_msgSend(-[MPLayerEffect secondarySlides](self, "secondarySlides"), "copy");
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
      id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
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
    id v10 = 0LL;
  }

  return v10;
}

@end