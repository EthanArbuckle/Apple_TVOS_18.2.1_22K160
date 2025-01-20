@interface MCSlide
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)durationIsDefined;
- (BOOL)startTimeIsDefined;
- (CGPoint)center;
- (MCAssetVideo)asset;
- (MCContainerEffect)container;
- (MCPlugSlide)plug;
- (MCSlide)init;
- (MCSlide)initWithImprint:(id)a3 andMontage:(id)a4;
- (MCSong)song;
- (NSArray)orderedFilters;
- (NSDictionary)frameAttributes;
- (NSSet)animationPaths;
- (NSSet)filters;
- (NSString)frameID;
- (NSString)kenBurnsType;
- (double)audioDuckInDuration;
- (double)audioDuckOutDuration;
- (double)audioFadeInDuration;
- (double)audioFadeOutDuration;
- (double)duration;
- (double)rotation;
- (double)scale;
- (double)startTime;
- (float)audioDuckLevel;
- (float)audioVolume;
- (id)addFilterWithFilterID:(id)a3;
- (id)animationPathForKey:(id)a3;
- (id)filterAtIndex:(unint64_t)a3;
- (id)frameAttributeForKey:(id)a3;
- (id)imprint;
- (id)imprintsForAnimationPaths;
- (id)imprintsForFilters;
- (id)insertFilterWithFilterID:(id)a3 atIndex:(unint64_t)a4;
- (unint64_t)countOfAnimationPaths;
- (unint64_t)countOfFilters;
- (unint64_t)index;
- (unsigned)countOfLayouts;
- (unsigned)currentLayoutIndex;
- (void)_copySelfToSnapshot:(id)a3;
- (void)addAnimationPath:(id)a3;
- (void)demolish;
- (void)demolishAnimationPaths;
- (void)demolishFilters;
- (void)initAnimationPathsWithImprints:(id)a3;
- (void)initFiltersWithImprints:(id)a3;
- (void)moveFiltersAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)observeFilter:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllAnimationPaths;
- (void)removeAllFilters;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeFiltersAtIndices:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAudioDuckInDuration:(double)a3;
- (void)setAudioDuckLevel:(float)a3;
- (void)setAudioDuckOutDuration:(double)a3;
- (void)setAudioFadeInDuration:(double)a3;
- (void)setAudioFadeOutDuration:(double)a3;
- (void)setAudioVolume:(float)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentLayoutIndex:(unsigned __int8)a3;
- (void)setDuration:(double)a3;
- (void)setFrameAttribute:(id)a3 forKey:(id)a4;
- (void)setFrameAttributes:(id)a3;
- (void)setFrameID:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setKenBurnsType:(id)a3;
- (void)setPlug:(id)a3;
- (void)setRotation:(double)a3;
- (void)setScale:(double)a3;
- (void)setSongForAsset:(id)a3;
- (void)setStartTime:(double)a3;
- (void)undefineDuration;
- (void)undefineStartTime;
- (void)unobserveFilter:(id)a3;
@end

@implementation MCSlide

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"builtVolume"]) {
    return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"audioVolume",  @"fadeInDuration",  @"fadeOutDuration",  @"audioDuckLevel",  @"duckInDuration",  @"duckOutDuration",  0LL);
  }
  if ([a3 isEqualToString:@"builtAudio"])
  {
    v8 = @"builtVolume";
    uint64_t v9 = 0LL;
    return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"song",  @"startTime",  @"duration",  v8,  v9,  v10,  v11);
  }

  if ([a3 isEqualToString:@"audioNoVolume"])
  {
    v8 = 0LL;
    return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"song",  @"startTime",  @"duration",  v8,  v9,  v10,  v11);
  }

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___MCSlide;
  return objc_msgSendSuper2(&v12, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCSlide)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCSlide;
  result = -[MCSlide init](&v3, "init");
  if (result)
  {
    result->mAudioVolume = 1.0;
    result->mAudioDuckLevel = 1.0;
  }

  return result;
}

- (MCSlide)initWithImprint:(id)a3 andMontage:(id)a4
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MCSlide;
  uint64_t v6 = -[MCObject initWithImprint:andMontage:](&v35, "initWithImprint:andMontage:");
  if (v6)
  {
    id v7 = [a3 objectForKey:@"flags"];
    if (v7) {
      id v7 = [v7 unsignedIntegerValue];
    }
    v6->mFlags = (unint64_t)v7;
    id v8 = [a3 objectForKey:@"slideAssets"];
    if (v8)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_1ADF54;
      v34[3] = &unk_258E48;
      v34[4] = v6;
      v34[5] = a4;
      [v8 enumerateObjectsUsingBlock:v34];
    }

    id v9 = [a3 objectForKey:@"plug"];
    if (v9) {
      v6->mPlug = (MCPlugSlide *) +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  v9,  a4);
    }
    id v10 = [a3 objectForKey:@"song"];
    if (v10)
    {
      uint64_t v11 =  +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  v10,  a4);
      v6->mSong = (MCSong *)v11;
      -[MCObject setSlideIfSlideSong:](v11, "setSlideIfSlideSong:", v6);
      if (!-[MCObject isSnapshot](v6, "isSnapshot"))
      {
        -[MCSong addObserver:forKeyPath:options:context:]( v6->mSong,  "addObserver:forKeyPath:options:context:",  v6,  @"builtVolume",  0LL,  0LL);
        -[MCSong addObserver:forKeyPath:options:context:]( v6->mSong,  "addObserver:forKeyPath:options:context:",  v6,  @"builtAudio",  0LL,  0LL);
      }
    }

    id v12 = [a3 objectForKey:@"index"];
    if (v12) {
      id v12 = [v12 unsignedIntegerValue];
    }
    v6->mIndex = (unint64_t)v12;
    id v13 = [a3 objectForKey:@"audioVolume"];
    if (v13) {
      [v13 floatValue];
    }
    else {
      float v14 = 1.0;
    }
    v6->mAudioVolume = v14;
    id v15 = [a3 objectForKey:@"audioFadeInDuration"];
    double v16 = 0.0;
    double v17 = 0.0;
    if (v15) {
      objc_msgSend(v15, "doubleValue", 0.0);
    }
    v6->mAudioFadeInDuration = v17;
    id v18 = [a3 objectForKey:@"audioFadeOutDuration"];
    if (v18)
    {
      [v18 doubleValue];
      double v16 = v19;
    }

    v6->mAudioFadeOutDuration = v16;
    id v20 = [a3 objectForKey:@"audioDuckLevel"];
    if (v20) {
      [v20 floatValue];
    }
    else {
      float v21 = 1.0;
    }
    v6->mAudioDuckLevel = v21;
    id v22 = [a3 objectForKey:@"audioDuckInDuration"];
    double v23 = 0.0;
    double v24 = 0.0;
    if (v22) {
      objc_msgSend(v22, "doubleValue", 0.0);
    }
    v6->mAudioDuckInDuration = v24;
    id v25 = [a3 objectForKey:@"audioDuckOutDuration"];
    if (v25)
    {
      [v25 doubleValue];
      double v23 = v26;
    }

    v6->mAudioDuckOutDuration = v23;
    id v27 = [a3 objectForKey:@"startTime"];
    if (v27)
    {
      v6->mFlags |= 1uLL;
      [v27 doubleValue];
      v6->mStartTime = v28;
    }

    id v29 = [a3 objectForKey:@"duration"];
    if (v29)
    {
      v6->mFlags |= 2uLL;
      [v29 doubleValue];
      v6->mDuration = v30;
    }

    v6->mFrameID = (NSString *)[a3 objectForKey:@"frameID"];
    v6->mFrameAttributes = -[NSMutableDictionary initWithDictionary:]( [NSMutableDictionary alloc],  "initWithDictionary:",  [a3 objectForKey:@"frameAttributes"]);
    id v31 = [a3 objectForKey:@"filters"];
    if (v31) {
      -[MCSlide initFiltersWithImprints:](v6, "initFiltersWithImprints:", v31);
    }
    id v32 = [a3 objectForKey:@"animationPaths"];
    if (v32) {
      -[MCSlide initAnimationPathsWithImprints:](v6, "initAnimationPathsWithImprints:", v32);
    }
  }

  return v6;
}

- (void)demolish
{
  if (self->mSlideAsset)
  {
    -[MCSlide willChangeValueForKey:](self, "willChangeValueForKey:", @"asset");
    for (unint64_t i = 0LL; ; ++i)
    {
      mSlideAsset = self->mSlideAsset;
      unint64_t v5 = mSlideAsset ? ((self->mFlags >> 24) & 0xF) + 1 : 0LL;
      if (i >= v5) {
        break;
      }
      if (!-[MCObject isSnapshot](self, "isSnapshot")) {
        objc_msgSend(objc_msgSend(self->mSlideAsset[i], "asset"), "removeSlide:", self);
      }

      self->mSlideAsset[i] = 0LL;
    }

    free(mSlideAsset);
    self->mSlideAsset = 0LL;
    -[MCSlide didChangeValueForKey:](self, "didChangeValueForKey:", @"asset");
  }

  -[MCSlide setPlug:](self, "setPlug:", 0LL);
  mSong = self->mSong;
  if (mSong)
  {
    -[MCSlide willChangeValueForKey:](self, "willChangeValueForKey:", @"song");
    -[MCSong removeObserver:forKeyPath:](self->mSong, "removeObserver:forKeyPath:", self, @"builtVolume");
    -[MCSong removeObserver:forKeyPath:](self->mSong, "removeObserver:forKeyPath:", self, @"builtAudio");
    self->mSong = 0LL;
    -[MCSlide didChangeValueForKey:](self, "didChangeValueForKey:", @"song");
    -[MCSong demolish](mSong, "demolish");
  }

  self->mFrameID = 0LL;
  self->mFrameAttributes = 0LL;
  self->mContainer = 0LL;
  -[MCSlide demolishAnimationPaths](self, "demolishAnimationPaths");
  -[MCSlide demolishFilters](self, "demolishFilters");
  objc_sync_exit(self);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCSlide;
  -[MCObject demolish](&v7, "demolish");
}

- (id)imprint
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MCSlide;
  id v3 = -[MCObject imprint](&v29, "imprint");
  if (self->mFlags) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  self->mFlags),  @"flags");
  }
  if (self->mSlideAsset)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    double v28 = v3;
    if (self->mSlideAsset) {
      unint64_t v5 = ((self->mFlags >> 24) & 0xF) + 1;
    }
    else {
      unint64_t v5 = 0LL;
    }
    uint64_t v6 = -[NSMutableArray initWithCapacity:](v4, "initWithCapacity:", v5);
    unint64_t v7 = 0LL;
    char v8 = 0;
    while (1)
    {
      mSlideAsset = self->mSlideAsset;
      if (mSlideAsset) {
        mSlideAsset = (id *)(((self->mFlags >> 24) & 0xF) + 1);
      }
      id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v11 = (double *)self->mSlideAsset[v7];
      id v12 = [v11 asset];
      if (v12)
      {
        id v13 = v12;
        if ([v12 isSnapshot])
        {
          id v14 = [v13 imprint];
          id v15 = v10;
          double v16 = @"asset";
        }

        else
        {
          id v14 = [v13 objectID];
          id v15 = v10;
          double v16 = @"assetID";
        }

        -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v14, v16);
      }

      id v17 = [v11 kenBurnsType];
      if (v17) {
        -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v17, @"kenBurnsType");
      }
      double v18 = v11[3];
      if (v18 != 0.5)
      {
        *(float *)&double v18 = v18;
        -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v18),  @"centerX");
      }

      double v19 = v11[4];
      if (v19 != 0.5)
      {
        *(float *)&double v19 = v19;
        -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v19),  @"centerY");
      }

      double v20 = v11[5];
      if (v20 != 1.0)
      {
        *(float *)&double v20 = v20;
        -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v20),  @"scale");
      }

      double v21 = v11[6];
      if (v21 != 0.0)
      {
        *(float *)&double v21 = v21;
        -[NSMutableDictionary setObject:forKey:]( v10,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v21),  @"rotation");
      }

      -[NSMutableArray addObject:](v6, "addObject:", v10);
      v8 |= -[NSMutableDictionary count](v10, "count") != 0LL;

      ++v7;
    }

    id v3 = v28;
    if ((v8 & 1) != 0) {
      [v28 setObject:v6 forKey:@"slideAssets"];
    }
  }

  mPlug = self->mPlug;
  if (mPlug) {
    objc_msgSend(v3, "setObject:forKey:", -[MCPlug imprint](mPlug, "imprint"), @"plug");
  }
  mSong = self->mSong;
  if (mSong) {
    objc_msgSend(v3, "setObject:forKey:", -[MCSong imprint](mSong, "imprint"), @"song");
  }
  if (self->mIndex) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"),  @"index");
  }
  if (self->mAudioVolume != 1.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"),  @"audioVolume");
  }
  if (self->mAudioFadeInDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"audioFadeInDuration");
  }
  if (self->mAudioFadeOutDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"audioFadeOutDuration");
  }
  if (self->mAudioDuckLevel != 1.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"),  @"audioDuckLevel");
  }
  if (self->mAudioDuckInDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"audioDuckInDuration");
  }
  if (self->mAudioDuckOutDuration > 0.0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"),  @"audioDuckOutDuration");
  }
  unint64_t mFlags = self->mFlags;
  if ((mFlags & 1) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->mStartTime),  @"startTime");
    unint64_t mFlags = self->mFlags;
  }

  if ((mFlags & 2) != 0) {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->mDuration),  @"duration");
  }
  mFrameID = self->mFrameID;
  if (mFrameID) {
    [v3 setObject:mFrameID forKey:@"frameID"];
  }
  mFrameAttributes = self->mFrameAttributes;
  if (mFrameAttributes) {
    [v3 setObject:mFrameAttributes forKey:@"frameAttributes"];
  }
  if (-[NSMutableSet count](self->mAnimationPaths, "count")) {
    objc_msgSend( v3,  "setObject:forKey:",  -[MCSlide imprintsForAnimationPaths](self, "imprintsForAnimationPaths"),  @"animationPaths");
  }
  if (-[NSMutableSet count](self->mFilters, "count")) {
    objc_msgSend(v3, "setObject:forKey:", -[MCSlide imprintsForFilters](self, "imprintsForFilters"), @"filters");
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->mSong == a4)
  {
    -[MCSlide willChangeValueForKey:](self, "willChangeValueForKey:", a3);
    -[MCSlide didChangeValueForKey:](self, "didChangeValueForKey:", a3);
  }

  else {
    char v8 = @"filters";
  }
  -[MCSlide willChangeValueForKey:](self, "willChangeValueForKey:", v8);
  -[MCSlide didChangeValueForKey:](self, "didChangeValueForKey:", v8);
}

- (MCAssetVideo)asset
{
  if (!-[MCObject isSnapshot](self, "isSnapshot"))
  {
    objc_sync_enter(self);
    mSlideAsset = self->mSlideAsset;
    if (mSlideAsset)
    {
      unint64_t mFlags = self->mFlags;
      else {
        uint64_t v9 = 0LL;
      }
      id v10 = [mSlideAsset[v9] asset];
    }

    else
    {
      id v10 = 0LL;
    }

    uint64_t v11 = (MCAssetVideo *)v10;
    objc_sync_exit(self);
    return v11;
  }

  id v3 = self->mSlideAsset;
  if (!v3) {
    return 0LL;
  }
  unint64_t v4 = self->mFlags;
  unint64_t v5 = v4 >> 28;
  if (v5 <= ((v4 >> 24) & 0xF)) {
    id v6 = v3[v5];
  }
  else {
    id v6 = *v3;
  }
  return (MCAssetVideo *)[v6 asset];
}

- (void)setAsset:(id)a3
{
  mSlideAsset = self->mSlideAsset;
  unint64_t mFlags = self->mFlags;
  unint64_t v7 = mFlags >> 28;
  if (mSlideAsset)
  {
    unint64_t v8 = (mFlags >> 24) & 0xF;
    if (v7 <= v8)
    {
      id v10 = self->mSlideAsset;
LABEL_17:
      else {
        uint64_t v24 = 0LL;
      }
      id v10 = (id *)objc_msgSend(v10[v24], "asset", v29);
      goto LABEL_21;
    }

    unint64_t v9 = v8 + 1;
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  id v10 = (id *)calloc(v7 + 1, 8uLL);
  self->mSlideAsset = v10;
  self->unint64_t mFlags = self->mFlags & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(self->mFlags >> 28) << 24);
  if (mSlideAsset)
  {
    memcpy(v10, mSlideAsset, 8 * v9);
    free(mSlideAsset);
    id v10 = self->mSlideAsset;
  }

  if (v9)
  {
    uint64_t v11 = (v9 - 1);
    id v12 = (char *)v10[v11];
    __int128 v29 = *(_OWORD *)(v12 + 24);
    double v13 = *((double *)v12 + 5);
    uint64_t v14 = *((void *)v12 + 6);
    id v15 = [v12 asset];
    id v16 = [self->mSlideAsset[v11] kenBurnsType];
    id v10 = self->mSlideAsset;
    if (!v10) {
      goto LABEL_21;
    }
    goto LABEL_13;
  }

  id v15 = 0LL;
  id v16 = 0LL;
  __asm { FMOV            V0.2D, #0.5 }

  __int128 v29 = _Q0;
  uint64_t v14 = 0LL;
  double v13 = 1.0;
  if (v10)
  {
LABEL_13:
    unint64_t mFlags = self->mFlags;
    if (((mFlags >> 24) & 0xF) >= v9)
    {
      unint64_t v22 = v9;
      while (1)
      {
        self->mSlideAsset[v22] = objc_alloc_init(&OBJC_CLASS___MCSlideAsset);
        double v23 = self->mSlideAsset;
        *(_OWORD *)((char *)v23[v22] + 24) = v29;
        *((double *)v23[v22] + 5) = v13;
        *((void *)v23[v22] + 6) = v14;
        [v23[v22] setAsset:v15];
        [v15 addSlide:self];
        [self->mSlideAsset[v22] setKenBurnsType:v16];
        id v10 = self->mSlideAsset;
        if (!v10) {
          goto LABEL_21;
        }
        LODWORD(v9) = v9 + 1;
        unint64_t mFlags = self->mFlags;
        ++v22;
      }
    }

    goto LABEL_17;
  }

- (NSString)kenBurnsType
{
  if (!-[MCObject isSnapshot](self, "isSnapshot"))
  {
    objc_sync_enter(self);
    mSlideAsset = self->mSlideAsset;
    if (mSlideAsset)
    {
      unint64_t mFlags = self->mFlags;
      else {
        uint64_t v9 = 0LL;
      }
      id v10 = [mSlideAsset[v9] kenBurnsType];
    }

    else
    {
      id v10 = 0LL;
    }

    uint64_t v11 = (NSString *)v10;
    objc_sync_exit(self);
    return v11;
  }

  id v3 = self->mSlideAsset;
  if (!v3) {
    return 0LL;
  }
  unint64_t v4 = self->mFlags;
  unint64_t v5 = v4 >> 28;
  if (v5 <= ((v4 >> 24) & 0xF)) {
    id v6 = v3[v5];
  }
  else {
    id v6 = *v3;
  }
  return (NSString *)[v6 kenBurnsType];
}

- (void)setKenBurnsType:(id)a3
{
  mSlideAsset = self->mSlideAsset;
  unint64_t mFlags = self->mFlags;
  unint64_t v7 = mFlags >> 28;
  if (mSlideAsset)
  {
    unint64_t v8 = (mFlags >> 24) & 0xF;
    if (v7 <= v8)
    {
      id v10 = self->mSlideAsset;
LABEL_17:
      else {
        uint64_t v24 = 0LL;
      }
      id v10 = (id *)objc_msgSend(v10[v24], "kenBurnsType", v29);
      goto LABEL_21;
    }

    unint64_t v9 = v8 + 1;
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  id v10 = (id *)calloc(v7 + 1, 8uLL);
  self->mSlideAsset = v10;
  self->unint64_t mFlags = self->mFlags & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(self->mFlags >> 28) << 24);
  if (mSlideAsset)
  {
    memcpy(v10, mSlideAsset, 8 * v9);
    free(mSlideAsset);
    id v10 = self->mSlideAsset;
  }

  if (v9)
  {
    uint64_t v11 = (v9 - 1);
    id v12 = (char *)v10[v11];
    __int128 v29 = *(_OWORD *)(v12 + 24);
    double v13 = *((double *)v12 + 5);
    uint64_t v14 = *((void *)v12 + 6);
    id v15 = [v12 asset];
    id v16 = [self->mSlideAsset[v11] kenBurnsType];
    id v10 = self->mSlideAsset;
    if (!v10) {
      goto LABEL_21;
    }
    goto LABEL_13;
  }

  id v15 = 0LL;
  id v16 = 0LL;
  __asm { FMOV            V0.2D, #0.5 }

  __int128 v29 = _Q0;
  uint64_t v14 = 0LL;
  double v13 = 1.0;
  if (v10)
  {
LABEL_13:
    unint64_t mFlags = self->mFlags;
    if (((mFlags >> 24) & 0xF) >= v9)
    {
      unint64_t v22 = v9;
      while (1)
      {
        self->mSlideAsset[v22] = objc_alloc_init(&OBJC_CLASS___MCSlideAsset);
        double v23 = self->mSlideAsset;
        *(_OWORD *)((char *)v23[v22] + 24) = v29;
        *((double *)v23[v22] + 5) = v13;
        *((void *)v23[v22] + 6) = v14;
        [v23[v22] setAsset:v15];
        [v15 addSlide:self];
        [self->mSlideAsset[v22] setKenBurnsType:v16];
        id v10 = self->mSlideAsset;
        if (!v10) {
          goto LABEL_21;
        }
        LODWORD(v9) = v9 + 1;
        unint64_t mFlags = self->mFlags;
        ++v22;
      }
    }

    goto LABEL_17;
  }

- (CGPoint)center
{
  mSlideAsset = self->mSlideAsset;
  if (mSlideAsset)
  {
    unint64_t mFlags = self->mFlags;
    unint64_t v4 = mFlags >> 28;
    if (v4 <= ((mFlags >> 24) & 0xF)) {
      unint64_t v5 = (char *)mSlideAsset[v4];
    }
    else {
      unint64_t v5 = (char *)*mSlideAsset;
    }
    id v6 = (const CGPoint *)(v5 + 24);
    p_y = (CGFloat *)(v5 + 32);
  }

  else
  {
    id v6 = &CGPointZero;
    p_y = &CGPointZero.y;
  }

  double v8 = *p_y;
  double x = v6->x;
  result.y = v8;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat x = a3.x;
  mSlideAsset = self->mSlideAsset;
  if (mSlideAsset) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = a3.x == 0.5;
  }
  if (!v5 || a3.y != 0.5)
  {
    CGFloat y = a3.y;
    unint64_t mFlags = self->mFlags;
    unint64_t v10 = mFlags >> 28;
    if (mSlideAsset)
    {
      if (v10 <= ((mFlags >> 24) & 0xF))
      {
LABEL_21:
        double v23 = (CGFloat *)mSlideAsset[self->mFlags >> 28];
        v23[3] = x;
        v23[4] = y;
        return;
      }

      LODWORD(v11) = (BYTE3(mFlags) & 0xF) + 1;
    }

    else
    {
      LODWORD(v11) = 0;
    }

    id v12 = (id *)calloc(v10 + 1, 8uLL);
    self->mSlideAsset = v12;
    self->unint64_t mFlags = self->mFlags & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(self->mFlags >> 28) << 24);
    if (mSlideAsset)
    {
      memcpy(v12, mSlideAsset, 8LL * v11);
      free(mSlideAsset);
      id v12 = self->mSlideAsset;
    }

    if ((_DWORD)v11)
    {
      double v13 = (double *)v12[(v11 - 1)];
      double v14 = v13[3];
      double v15 = v13[4];
      double v17 = v13[5];
      uint64_t v16 = *((void *)v13 + 6);
      id v18 = [v13 asset];
      id v19 = [self->mSlideAsset[(v11 - 1)] kenBurnsType];
      id v12 = self->mSlideAsset;
    }

    else
    {
      id v18 = 0LL;
      id v19 = 0LL;
      uint64_t v16 = 0LL;
      double v14 = 0.5;
      double v17 = 1.0;
      double v15 = 0.5;
    }

    mSlideAsset = v12;
    if (((self->mFlags >> 24) & 0xF) >= v11)
    {
      unint64_t v20 = v11;
      do
      {
        self->mSlideAsset[v20] = objc_alloc_init(&OBJC_CLASS___MCSlideAsset);
        double v21 = self->mSlideAsset;
        unint64_t v22 = (double *)v21[v20];
        v22[3] = v14;
        v22[4] = v15;
        *((double *)v21[v20] + 5) = v17;
        *((void *)v21[v20] + 6) = v16;
        [v21[v20] setAsset:v18];
        [v18 addSlide:self];
        [self->mSlideAsset[v20] setKenBurnsType:v19];
        unint64_t v11 = (v11 + 1);
        ++v20;
      }

      while (((self->mFlags >> 24) & 0xF) >= v11);
      mSlideAsset = self->mSlideAsset;
    }

    goto LABEL_21;
  }

- (double)scale
{
  mSlideAsset = self->mSlideAsset;
  if (!mSlideAsset) {
    return 0.0;
  }
  unint64_t mFlags = self->mFlags;
  else {
    uint64_t v4 = 0LL;
  }
  return *((double *)mSlideAsset[v4] + 5);
}

- (void)setScale:(double)a3
{
  mSlideAsset = self->mSlideAsset;
  if (a3 != 1.0 || mSlideAsset != 0LL)
  {
    unint64_t mFlags = self->mFlags;
    unint64_t v8 = mFlags >> 28;
    if (mSlideAsset)
    {
      if (v8 <= ((mFlags >> 24) & 0xF))
      {
LABEL_18:
        *((double *)mSlideAsset[self->mFlags >> 28] + 5) = a3;
        return;
      }

      LODWORD(v9) = (BYTE3(mFlags) & 0xF) + 1;
    }

    else
    {
      LODWORD(v9) = 0;
    }

    unint64_t v10 = (id *)calloc(v8 + 1, 8uLL);
    self->mSlideAsset = v10;
    self->unint64_t mFlags = self->mFlags & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(self->mFlags >> 28) << 24);
    if (mSlideAsset)
    {
      memcpy(v10, mSlideAsset, 8LL * v9);
      free(mSlideAsset);
      unint64_t v10 = self->mSlideAsset;
    }

    if ((_DWORD)v9)
    {
      unint64_t v11 = (double *)v10[(v9 - 1)];
      double v12 = v11[3];
      double v13 = v11[4];
      double v15 = v11[5];
      uint64_t v14 = *((void *)v11 + 6);
      id v16 = [v11 asset];
      id v17 = [self->mSlideAsset[(v9 - 1)] kenBurnsType];
      unint64_t v10 = self->mSlideAsset;
    }

    else
    {
      id v16 = 0LL;
      id v17 = 0LL;
      uint64_t v14 = 0LL;
      double v12 = 0.5;
      double v15 = 1.0;
      double v13 = 0.5;
    }

    mSlideAsset = v10;
    if (((self->mFlags >> 24) & 0xF) >= v9)
    {
      unint64_t v18 = v9;
      do
      {
        self->mSlideAsset[v18] = objc_alloc_init(&OBJC_CLASS___MCSlideAsset);
        id v19 = self->mSlideAsset;
        unint64_t v20 = (double *)v19[v18];
        v20[3] = v12;
        v20[4] = v13;
        *((double *)v19[v18] + 5) = v15;
        *((void *)v19[v18] + 6) = v14;
        [v19[v18] setAsset:v16];
        [v16 addSlide:self];
        [self->mSlideAsset[v18] setKenBurnsType:v17];
        unint64_t v9 = (v9 + 1);
        ++v18;
      }

      while (((self->mFlags >> 24) & 0xF) >= v9);
      mSlideAsset = self->mSlideAsset;
    }

    goto LABEL_18;
  }

- (double)rotation
{
  mSlideAsset = self->mSlideAsset;
  if (!mSlideAsset) {
    return 0.0;
  }
  unint64_t mFlags = self->mFlags;
  else {
    uint64_t v4 = 0LL;
  }
  return *((double *)mSlideAsset[v4] + 6);
}

- (void)setRotation:(double)a3
{
  mSlideAsset = self->mSlideAsset;
  if (a3 != 1.0 || mSlideAsset != 0LL)
  {
    unint64_t mFlags = self->mFlags;
    unint64_t v8 = mFlags >> 28;
    if (mSlideAsset)
    {
      if (v8 <= ((mFlags >> 24) & 0xF))
      {
LABEL_18:
        *((double *)mSlideAsset[self->mFlags >> 28] + 6) = a3;
        return;
      }

      LODWORD(v9) = (BYTE3(mFlags) & 0xF) + 1;
    }

    else
    {
      LODWORD(v9) = 0;
    }

    unint64_t v10 = (id *)calloc(v8 + 1, 8uLL);
    self->mSlideAsset = v10;
    self->unint64_t mFlags = self->mFlags & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(self->mFlags >> 28) << 24);
    if (mSlideAsset)
    {
      memcpy(v10, mSlideAsset, 8LL * v9);
      free(mSlideAsset);
      unint64_t v10 = self->mSlideAsset;
    }

    if ((_DWORD)v9)
    {
      unint64_t v11 = (double *)v10[(v9 - 1)];
      double v12 = v11[3];
      double v13 = v11[4];
      double v15 = v11[5];
      uint64_t v14 = *((void *)v11 + 6);
      id v16 = [v11 asset];
      id v17 = [self->mSlideAsset[(v9 - 1)] kenBurnsType];
      unint64_t v10 = self->mSlideAsset;
    }

    else
    {
      id v16 = 0LL;
      id v17 = 0LL;
      uint64_t v14 = 0LL;
      double v12 = 0.5;
      double v15 = 1.0;
      double v13 = 0.5;
    }

    mSlideAsset = v10;
    if (((self->mFlags >> 24) & 0xF) >= v9)
    {
      unint64_t v18 = v9;
      do
      {
        self->mSlideAsset[v18] = objc_alloc_init(&OBJC_CLASS___MCSlideAsset);
        id v19 = self->mSlideAsset;
        unint64_t v20 = (double *)v19[v18];
        v20[3] = v12;
        v20[4] = v13;
        *((double *)v19[v18] + 5) = v15;
        *((void *)v19[v18] + 6) = v14;
        [v19[v18] setAsset:v16];
        [v16 addSlide:self];
        [self->mSlideAsset[v18] setKenBurnsType:v17];
        unint64_t v9 = (v9 + 1);
        ++v18;
      }

      while (((self->mFlags >> 24) & 0xF) >= v9);
      mSlideAsset = self->mSlideAsset;
    }

    goto LABEL_18;
  }

- (MCSong)song
{
  if (-[MCObject isSnapshot](self, "isSnapshot")) {
    return self->mSong;
  }
  objc_sync_enter(self);
  id v3 = self->mSong;
  objc_sync_exit(self);
  return v3;
}

- (void)setSongForAsset:(id)a3
{
  if (-[MCSong asset](self->mSong, "asset") != a3)
  {
    objc_sync_enter(self);
    -[MCSlide willChangeValueForKey:](self, "willChangeValueForKey:", @"song");
    mSong = self->mSong;
    if (mSong)
    {
      -[MCSong removeObserver:forKeyPath:](mSong, "removeObserver:forKeyPath:", self, @"builtVolume");
      -[MCSong removeObserver:forKeyPath:](self->mSong, "removeObserver:forKeyPath:", self, @"builtAudio");
      -[MCSong setSlideIfSlideSong:](self->mSong, "setSlideIfSlideSong:", 0LL);

      self->mSong = 0LL;
    }

    if (a3)
    {
      id v6 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCSong),  "initFromScratchWithMontage:",  self->super.mMontage);
      -[MCSong setAsset:](v6, "setAsset:", a3);
      -[MCSong setSlideIfSlideSong:](v6, "setSlideIfSlideSong:", self);
      -[MCSong addObserver:forKeyPath:options:context:]( v6,  "addObserver:forKeyPath:options:context:",  self,  @"builtVolume",  0LL,  0LL);
      -[MCSong addObserver:forKeyPath:options:context:]( v6,  "addObserver:forKeyPath:options:context:",  self,  @"builtAudio",  0LL,  0LL);
      self->mSong = v6;
    }

    -[MCSlide didChangeValueForKey:](self, "didChangeValueForKey:", @"song");
    objc_sync_exit(self);
  }

- (MCPlugSlide)plug
{
  if (-[MCObject isSnapshot](self, "isSnapshot")) {
    return self->mPlug;
  }
  objc_sync_enter(self);
  id v3 = self->mPlug;
  objc_sync_exit(self);
  return v3;
}

- (void)setPlug:(id)a3
{
  if (self->mPlug != a3)
  {
    objc_sync_enter(self);
    -[MCPlugSlide setParentSlide:](self->mPlug, "setParentSlide:", 0LL);

    BOOL v5 = (MCPlugSlide *)a3;
    self->mPlug = v5;
    -[MCPlugSlide setParentSlide:](v5, "setParentSlide:", self);
    objc_sync_exit(self);
  }

- (void)undefineStartTime
{
  self->mFlags &= ~1uLL;
}

- (BOOL)startTimeIsDefined
{
  return self->mFlags & 1;
}

- (void)setStartTime:(double)a3
{
  self->mStartTime = a3;
  self->mFlags |= 1uLL;
}

- (void)undefineDuration
{
  self->mFlags &= ~2uLL;
}

- (BOOL)durationIsDefined
{
  return (LOBYTE(self->mFlags) >> 1) & 1;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
  self->mFlags |= 2uLL;
}

- (id)frameAttributeForKey:(id)a3
{
  if (-[MCObject isSnapshot](self, "isSnapshot")) {
    return -[NSMutableDictionary objectForKey:](self->mFrameAttributes, "objectForKey:", a3);
  }
  objc_sync_enter(self);
  id v6 = -[NSMutableDictionary objectForKey:](self->mFrameAttributes, "objectForKey:", a3);
  objc_sync_exit(self);
  return v6;
}

- (void)setFrameAttribute:(id)a3 forKey:(id)a4
{
  mFrameAttributes = self->mFrameAttributes;
  if (a3)
  {
    if (mFrameAttributes) {
      -[NSMutableDictionary setObject:forKey:](mFrameAttributes, "setObject:forKey:", a3, a4);
    }
    else {
      self->mFrameAttributes = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  a3,  a4,  0LL);
    }
  }

  else if (mFrameAttributes)
  {
    -[NSMutableDictionary removeObjectForKey:](mFrameAttributes, "removeObjectForKey:", a4);
  }

  objc_sync_exit(self);
  -[MCSlide didChangeValueForKey:](self, "didChangeValueForKey:", @"frameAttributes");
}

- (NSDictionary)frameAttributes
{
  if (-[MCObject isSnapshot](self, "isSnapshot")) {
    return &self->mFrameAttributes->super;
  }
  objc_sync_enter(self);
  id v3 = +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  self->mFrameAttributes);
  objc_sync_exit(self);
  return v3;
}

- (void)setFrameAttributes:(id)a3
{
  if (self->mFrameAttributes != a3)
  {
    objc_sync_enter(self);

    self->mFrameAttributes = 0LL;
    if (a3) {
      self->mFrameAttributes = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a3);
    }
    objc_sync_exit(self);
  }

- (unsigned)countOfLayouts
{
  if (self->mSlideAsset) {
    return (BYTE3(self->mFlags) & 0xF) + 1;
  }
  else {
    return 0;
  }
}

- (unsigned)currentLayoutIndex
{
  return LODWORD(self->mFlags) >> 28;
}

- (void)setCurrentLayoutIndex:(unsigned __int8)a3
{
  int v3 = a3;
  if (self->mSlideAsset) {
    BOOL v5 = (self->mFlags & 0xF000000) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    self->unint64_t mFlags = (a3 << 28) & 0xFFFFFFFFF0000000LL | self->mFlags & 0xFFFFFFF;
  }

  else
  {
    -[MCSlide willChangeValueForKey:](self, "willChangeValueForKey:", @"asset");
    self->unint64_t mFlags = (v3 << 28) & 0xFFFFFFFFF0000000LL | self->mFlags & 0xFFFFFFF;
    -[MCSlide didChangeValueForKey:](self, "didChangeValueForKey:", @"asset");
  }

- (void)_copySelfToSnapshot:(id)a3
{
  *((void *)a3 + 8) = self->mFlags;
  if (self->mSlideAsset)
  {
    unint64_t v5 = 0LL;
    *((void *)a3 + 3) = malloc(((self->mFlags >> 21) & 0x78) + 8);
    mSlideAsset = self->mSlideAsset;
    if (!mSlideAsset) {
      goto LABEL_4;
    }
LABEL_3:
    mSlideAsset = (id *)(((self->mFlags >> 24) & 0xF) + 1);
LABEL_4:
    while (v5 < (unint64_t)mSlideAsset)
    {
      *(void *)(*((void *)a3 + 3) + 8 * v5) = objc_alloc_init(&OBJC_CLASS___MCSlideAsset);
      objc_msgSend( *(id *)(*((void *)a3 + 3) + 8 * v5),  "setAsset:",  objc_msgSend(objc_msgSend(self->mSlideAsset[v5], "asset"), "snapshot"));
      objc_msgSend( *(id *)(*((void *)a3 + 3) + 8 * v5),  "setKenBurnsType:",  objc_msgSend(self->mSlideAsset[v5], "kenBurnsType"));
      *(_OWORD *)(*(void *)(*((void *)a3 + 3) + 8 * v5) + 24LL) = *(_OWORD *)((char *)self->mSlideAsset[v5] + 24);
      mSlideAsset = self->mSlideAsset;
      uint64_t v7 = *((void *)a3 + 3);
      *(void *)(*(void *)(v7 + 8 * v5) + 40LL) = *((void *)mSlideAsset[v5] + 5);
      *(void *)(*(void *)(v7 + 8 * v5) + 48LL) = *((void *)mSlideAsset[v5] + 6);
      ++v5;
      if (mSlideAsset) {
        goto LABEL_3;
      }
    }
  }

  *((void *)a3 + 11) = -[MCObject snapshot](self->mSong, "snapshot");
  *((void *)a3 + 12) = self->mIndex;
  *((_DWORD *)a3 + 18) = LODWORD(self->mAudioVolume);
  *((void *)a3 + 13) = *(void *)&self->mAudioFadeInDuration;
  *((void *)a3 + 14) = *(void *)&self->mAudioFadeOutDuration;
  *((_DWORD *)a3 + 19) = LODWORD(self->mAudioDuckLevel);
  *((void *)a3 + 15) = *(void *)&self->mAudioDuckInDuration;
  *((void *)a3 + 16) = *(void *)&self->mAudioDuckOutDuration;
  *((void *)a3 + 17) = *(void *)&self->mStartTime;
  *((void *)a3 + 18) = *(void *)&self->mDuration;
  mFrameID = self->mFrameID;
  if (mFrameID) {
    *((void *)a3 + 19) = -[NSString copy](mFrameID, "copy");
  }
  mFrameAttributes = self->mFrameAttributes;
  if (mFrameAttributes) {
    *((void *)a3 + 4) = -[NSMutableDictionary copy](mFrameAttributes, "copy");
  }
  if (self->mAnimationPaths)
  {
    unint64_t v10 = -[MCSlide animationPaths](self, "animationPaths");
    if (-[NSSet count](v10, "count"))
    {
      *((void *)a3 + 5) = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSSet count](v10, "count"));
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v11 = -[NSSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
      if (v11)
      {
        uint64_t v12 = *(void *)v23;
        do
        {
          double v13 = 0LL;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend( *((id *)a3 + 5),  "addObject:",  objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v13), "snapshot"));
            double v13 = (char *)v13 + 1;
          }

          while (v11 != v13);
          id v11 = -[NSSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
        }

        while (v11);
      }
    }
  }

  if (self->mFilters)
  {
    uint64_t v14 = -[MCSlide filters](self, "filters");
    if (-[NSSet count](v14, "count"))
    {
      *((void *)a3 + 6) = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSSet count](v14, "count"));
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v15 = -[NSSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
      if (v15)
      {
        uint64_t v16 = *(void *)v19;
        do
        {
          id v17 = 0LL;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend( *((id *)a3 + 6),  "addObject:",  objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v17), "snapshot"));
            id v17 = (char *)v17 + 1;
          }

          while (v15 != v17);
          id v15 = -[NSSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
        }

        while (v15);
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
  self->mIndeCGFloat x = a3;
}

- (float)audioVolume
{
  return self->mAudioVolume;
}

- (void)setAudioVolume:(float)a3
{
  self->mAudioVolume = a3;
}

- (double)audioFadeInDuration
{
  return self->mAudioFadeInDuration;
}

- (void)setAudioFadeInDuration:(double)a3
{
  self->mAudioFadeInDuration = a3;
}

- (double)audioFadeOutDuration
{
  return self->mAudioFadeOutDuration;
}

- (void)setAudioFadeOutDuration:(double)a3
{
  self->mAudioFadeOutDuration = a3;
}

- (float)audioDuckLevel
{
  return self->mAudioDuckLevel;
}

- (void)setAudioDuckLevel:(float)a3
{
  self->mAudioDuckLevel = a3;
}

- (double)audioDuckInDuration
{
  return self->mAudioDuckInDuration;
}

- (void)setAudioDuckInDuration:(double)a3
{
  self->mAudioDuckInDuration = a3;
}

- (double)audioDuckOutDuration
{
  return self->mAudioDuckOutDuration;
}

- (void)setAudioDuckOutDuration:(double)a3
{
  self->mAudioDuckOutDuration = a3;
}

- (double)startTime
{
  return self->mStartTime;
}

- (double)duration
{
  return self->mDuration;
}

- (NSString)frameID
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFrameID:(id)a3
{
}

- (MCContainerEffect)container
{
  return self->mContainer;
}

- (void)setContainer:(id)a3
{
  self->mContainer = (MCContainerEffect *)a3;
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
          unint64_t v8 = 0LL;
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
              uint64_t v14 = @"keyframes";
              if ((isKindOfClass & 1) == 0)
              {
                uint64_t v15 = objc_opt_class(&OBJC_CLASS___MCAnimationPathCombo, v13);
                if ((objc_opt_isKindOfClass(v9, v15) & 1) == 0) {
                  goto LABEL_13;
                }
                [v9 addObserver:self forKeyPath:@"combineOperation" options:0 context:0];
                uint64_t v14 = @"animationPaths";
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
    uint64_t v4 = self->mAnimationPaths;
    id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (!v5) {
      goto LABEL_14;
    }
    uint64_t v6 = *(void *)v18;
    while (1)
    {
      for (unint64_t i = 0LL; i != v5; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        unint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
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
  uint64_t v4 = -[MCSlide animationPaths](self, "animationPaths", 0LL);
  id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      unint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "imprint"));
        unint64_t v8 = (char *)v8 + 1;
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
      for (unint64_t i = 0LL; i != v12; unint64_t i = (char *)i + 1)
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
  -[MCSlide willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL);
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
    for (unint64_t i = 0LL; i != v7; unint64_t i = (char *)i + 1)
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
            -[MCSlide willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v17);
            -[NSMutableSet removeObject:](self->mAnimationPaths, "removeObject:", v10);
            objc_sync_exit(mAnimationPaths);
            -[MCSlide didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v17);

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
    -[MCSlide willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v3);
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
      for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
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
        -[MCSlide didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"animationPaths",  1LL,  v3);

        return;
      }
    }
  }

- (void)initFiltersWithImprints:(id)a3
{
  if (a3)
  {
    if ([a3 count])
    {
      self->mFilters = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
              objc_enumerationMutation(a3);
            }
            uint64_t v9 = +[MCObject objectWithImprint:andMontage:]( &OBJC_CLASS___MCObject,  "objectWithImprint:andMontage:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8),  self->super.mMontage);
            -[NSMutableSet addObject:](self->mFilters, "addObject:", v9);
            if (!-[MCObject isSnapshot](self, "isSnapshot")) {
              -[MCSlide observeFilter:](self, "observeFilter:", v9);
            }
            uint64_t v8 = (char *)v8 + 1;
          }

          while (v6 != v8);
          id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }

        while (v6);
      }
    }
  }

- (void)demolishFilters
{
  mFilters = self->mFilters;
  if (mFilters)
  {
    objc_sync_enter(self->mFilters);
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    unsigned __int8 v4 = self->mFilters;
    id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        for (unint64_t i = 0LL; i != v5; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
          if (!-[MCObject isSnapshot](self, "isSnapshot")) {
            -[MCSlide unobserveFilter:](self, "unobserveFilter:", v8);
          }
          [v8 demolish];
        }

        id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      }

      while (v5);
    }

    if (self->mFilters)
    {
      objc_sync_enter(self);
      uint64_t v9 = self->mFilters;
      self->mFilters = 0LL;
      objc_sync_exit(self);
    }

    objc_sync_exit(mFilters);
  }

- (id)imprintsForFilters
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unsigned __int8 v4 = -[MCSlide filters](self, "filters", 0LL);
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

- (NSArray)orderedFilters
{
  if (-[MCObject isSnapshot](self, "isSnapshot"))
  {
    mCachedOrderedFilters = self->mCachedOrderedFilters;
    if (!mCachedOrderedFilters)
    {
      unsigned __int8 v4 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"index",  1LL);
      self->mCachedOrderedFilters = (NSArray *) objc_msgSend( -[NSMutableSet allObjects](self->mFilters, "allObjects"),  "sortedArrayUsingDescriptors:",  +[NSArray arrayWithObject:]( NSArray,  "arrayWithObject:",  v4));

      return self->mCachedOrderedFilters;
    }
  }

  else
  {
    mFilters = self->mFilters;
    if (mFilters)
    {
      objc_sync_enter(self->mFilters);
      id v6 = self->mCachedOrderedFilters;
      if (!v6)
      {
        uint64_t v7 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"index",  1LL);
        self->mCachedOrderedFilters = (NSArray *) objc_msgSend( -[NSMutableSet allObjects](self->mFilters, "allObjects"),  "sortedArrayUsingDescriptors:",  +[NSArray arrayWithObject:]( NSArray,  "arrayWithObject:",  v7));

        id v6 = self->mCachedOrderedFilters;
      }

      mCachedOrderedFilters = v6;
      objc_sync_exit(mFilters);
    }

    else
    {
      return 0LL;
    }
  }

  return mCachedOrderedFilters;
}

- (NSSet)filters
{
  id v3 = (NSSet *)sEmptySet;
  unsigned __int8 v4 = -[MCObject isSnapshot](self, "isSnapshot");
  mFilters = self->mFilters;
  if ((v4 & 1) == 0)
  {
    if (mFilters)
    {
      objc_sync_enter(self->mFilters);
      if (-[NSMutableSet count](self->mFilters, "count")) {
        id v3 = -[NSSet initWithSet:](objc_alloc(&OBJC_CLASS___NSSet), "initWithSet:", self->mFilters);
      }
      objc_sync_exit(mFilters);
    }

    return v3;
  }

  return &mFilters->super;
}

- (unint64_t)countOfFilters
{
  unsigned int v3 = -[MCObject isSnapshot](self, "isSnapshot");
  mFilters = self->mFilters;
  if (v3) {
    return (unint64_t)-[NSMutableSet count](self->mFilters, "count");
  }
  if (!mFilters) {
    return 0LL;
  }
  objc_sync_enter(self->mFilters);
  id v6 = -[NSMutableSet count](self->mFilters, "count");
  objc_sync_exit(mFilters);
  return (unint64_t)v6;
}

- (id)filterAtIndex:(unint64_t)a3
{
  if (-[MCObject isSnapshot](self, "isSnapshot"))
  {
    mCachedOrderedFilters = self->mCachedOrderedFilters;
    if (mCachedOrderedFilters) {
      return -[NSArray objectAtIndex:](mCachedOrderedFilters, "objectAtIndex:", a3);
    }
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    mFilters = self->mFilters;
    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mFilters,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
LABEL_9:
      uint64_t v13 = 0LL;
      while (1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(mFilters);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
        if ([v14 index] == (id)a3) {
          return v14;
        }
        if (v11 == (id)++v13)
        {
          id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mFilters,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
          uint64_t v14 = 0LL;
          if (v11) {
            goto LABEL_9;
          }
          return v14;
        }
      }
    }
  }

  else
  {
    uint64_t v7 = self->mFilters;
    if (v7)
    {
      objc_sync_enter(self->mFilters);
      uint64_t v8 = self->mCachedOrderedFilters;
      if (v8)
      {
        id v9 = -[NSArray objectAtIndex:](v8, "objectAtIndex:", a3);
LABEL_27:
        uint64_t v14 = v9;
      }

      else
      {
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v15 = self->mFilters;
        id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
        if (v16)
        {
          uint64_t v17 = *(void *)v21;
          while (2)
          {
            for (unint64_t i = 0LL; i != v16; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v21 != v17) {
                objc_enumerationMutation(v15);
              }
              __int128 v19 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
              if ([v19 index] == (id)a3)
              {
                id v9 = v19;
                goto LABEL_27;
              }
            }

            id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
            uint64_t v14 = 0LL;
            if (v16) {
              continue;
            }
            break;
          }
        }

        else
        {
          uint64_t v14 = 0LL;
        }
      }

      objc_sync_exit(v7);
      return v14;
    }
  }

  return 0LL;
}

- (id)addFilterWithFilterID:(id)a3
{
  return -[MCSlide insertFilterWithFilterID:atIndex:]( self,  "insertFilterWithFilterID:atIndex:",  a3,  -[MCSlide countOfFilters](self, "countOfFilters"));
}

- (id)insertFilterWithFilterID:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = -[MCObject initFromScratchWithMontage:]( objc_alloc(&OBJC_CLASS___MCFilter),  "initFromScratchWithMontage:",  self->super.mMontage);
  [v7 setFilterID:a3];
  [v7 setIndex:a4];
  if (!self->mFilters)
  {
    objc_sync_enter(self);
    self->mFilters = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    objc_sync_exit(self);
  }

  uint64_t v8 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v7, 0LL);
  -[MCSlide willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"filters",  1LL,  v8);
  obj = self->mFilters;
  objc_sync_enter(obj);

  self->mCachedOrderedFilters = 0LL;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  mFilters = self->mFilters;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mFilters,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (unint64_t i = 0LL; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(mFilters);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
      }

      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( mFilters,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v10);
  }

  -[NSMutableSet addObject:](self->mFilters, "addObject:", v7);
  -[MCSlide observeFilter:](self, "observeFilter:", v7);
  objc_sync_exit(obj);
  -[MCSlide didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"filters",  1LL,  v8);

  return v7;
}

- (void)removeFiltersAtIndices:(id)a3
{
  mFilters = self->mFilters;
  if (mFilters)
  {
    obj = mFilters;
    objc_sync_enter(mFilters);
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v7 = self->mFilters;
    id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (unint64_t i = 0LL; i != v8; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v11, "index")))
          {
            -[MCSlide unobserveFilter:](self, "unobserveFilter:", v11);
            -[NSMutableSet addObject:](v6, "addObject:", v11);
          }

          else
          {
            objc_msgSend( v11,  "setIndex:",  (_BYTE *)objc_msgSend(v11, "index")
            - (_BYTE *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v11, "index")));
          }
        }

        id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v8);
    }

    -[MCSlide willChangeValueForKey:withSetMutation:usingObjects:]( self,  "willChangeValueForKey:withSetMutation:usingObjects:",  @"filters",  2LL,  v6);

    self->mCachedOrderedFilters = 0LL;
    -[NSMutableSet minusSet:](self->mFilters, "minusSet:", v6);
    objc_sync_exit(obj);
    -[MCSlide didChangeValueForKey:withSetMutation:usingObjects:]( self,  "didChangeValueForKey:withSetMutation:usingObjects:",  @"filters",  2LL,  v6);
  }

- (void)removeAllFilters
{
}

- (void)moveFiltersAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  if (self->mFilters)
  {
    -[MCSlide willChangeValueForKey:](self, "willChangeValueForKey:", @"orderedFilters");
    mFilters = self->mFilters;
    objc_sync_enter(mFilters);

    self->mCachedOrderedFilters = 0LL;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = self->mFilters;
    id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
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

        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v9);
    }

    objc_sync_exit(mFilters);
    -[MCSlide didChangeValueForKey:](self, "didChangeValueForKey:", @"orderedFilters");
  }

- (void)observeFilter:(id)a3
{
}

- (void)unobserveFilter:(id)a3
{
}

@end