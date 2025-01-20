@interface MPSlide
+ (id)slide;
+ (id)slideWithPath:(id)a3;
- (BOOL)canZoom;
- (BOOL)determineShowTime:(double *)a3 showDuration:(double *)a4;
- (BOOL)hasAnimationPathForKey:(id)a3;
- (BOOL)hasMovie;
- (BOOL)isPanoramaInDocument:(id)a3;
- (BOOL)isSecondary;
- (BOOL)needsStyleUpdateOnSlideChange;
- (BOOL)needsTimingUpdateOnSlideChange;
- (CGPoint)center;
- (MPFrame)frame;
- (MPLayerGroup)layerGroup;
- (MPSlide)init;
- (MPSlide)initWithLayerGroup:(id)a3;
- (MPSlide)initWithPath:(id)a3;
- (NSString)absolutePath;
- (NSString)path;
- (NSString)sizingMode;
- (double)aspectRatio;
- (double)audioDuckInDuration;
- (double)audioDuckLevel;
- (double)audioDuckOutDuration;
- (double)audioFadeInDuration;
- (double)audioFadeOutDuration;
- (double)audioVolume;
- (double)duration;
- (double)maxDuration;
- (double)originalAspectRatio;
- (double)rotation;
- (double)scale;
- (double)showDisplayStartTime;
- (double)showDisplayTime;
- (double)showDuration;
- (double)showTime;
- (double)startTime;
- (id)action;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)filters;
- (id)fullDebugLog;
- (id)keyframedAnimationPathForKey:(id)a3;
- (id)nearestLayer;
- (id)objectInFilterAtIndex:(int64_t)a3;
- (id)parent;
- (id)parentDocument;
- (id)parentEffect;
- (id)parentSubtitleEffect;
- (id)scriptingAnimations;
- (id)scriptingFrame;
- (id)slide;
- (id)userInfoAttributeForKey:(id)a3;
- (int64_t)countOfFilter;
- (int64_t)index;
- (int64_t)liveIndex;
- (void)addFilter:(id)a3;
- (void)addFilters:(id)a3;
- (void)cleanup;
- (void)copyAnimationPaths:(id)a3;
- (void)copyFilters:(id)a3;
- (void)copyFrame:(id)a3;
- (void)copyLayerGroup:(id)a3;
- (void)copyVars:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)duplicateAnimationPaths;
- (void)insertFilters:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inFilterAtIndex:(int64_t)a4;
- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)removeAllFilters;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeFiltersAtIndices:(id)a3;
- (void)removeObjectFromFilterAtIndex:(int64_t)a3;
- (void)replaceObjectInFilterAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)resetCachedTimes;
- (void)setAbsolutePath:(id)a3;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setAudioDuckInDuration:(double)a3;
- (void)setAudioDuckLevel:(double)a3;
- (void)setAudioDuckOutDuration:(double)a3;
- (void)setAudioFadeInDuration:(double)a3;
- (void)setAudioFadeOutDuration:(double)a3;
- (void)setAudioVolume:(double)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setDuration:(double)a3;
- (void)setFrame:(id)a3;
- (void)setIsSecondary:(BOOL)a3;
- (void)setLayerGroup:(id)a3;
- (void)setMediaType:(unint64_t)a3;
- (void)setMirrorToDuplicatePaths:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setPath:(id)a3;
- (void)setRotation:(double)a3;
- (void)setScale:(double)a3;
- (void)setScriptingAnimations:(id)a3;
- (void)setScriptingFrame:(id)a3;
- (void)setSizingMode:(id)a3;
- (void)setSlide:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setUserInfoAttribute:(id)a3 forKey:(id)a4;
@end

@implementation MPSlide

+ (id)slide
{
  return objc_alloc_init((Class)a1);
}

+ (id)slideWithPath:(id)a3
{
  return [objc_alloc((Class)a1) initWithPath:a3];
}

- (MPSlide)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MPSlide;
  result = -[MPSlide init](&v9, "init");
  if (result)
  {
    result->_slide = 0LL;
    *(_OWORD *)&result->_filters = 0u;
    *(_OWORD *)&result->_path = 0u;
    *(_OWORD *)&result->_frame = 0u;
    __asm { FMOV            V1.2D, #-1.0 }

    *(_OWORD *)&result->_startTime = _Q1;
    *(_OWORD *)&result->_audioFadeInDuration = 0u;
    *(_OWORD *)&result->_audioDuckInDuration = 0u;
    result->_sizingMode = 0LL;
    result->_mediaType = -1LL;
    *(_OWORD *)&result->_center.y = xmmword_1F6B70;
    *(_OWORD *)&result->_rotation = xmmword_1F6190;
    __asm { FMOV            V0.2D, #1.0 }

    *(_OWORD *)&result->_audioDuckLevel = _Q0;
    result->_mirrorToDuplicatePaths = 0;
    *(int64x2_t *)&result->_cachedShowTime = vdupq_n_s64(0xC059000000000000LL);
  }

  return result;
}

- (MPSlide)initWithPath:(id)a3
{
  v4 = -[MPSlide init](self, "init");
  v5 = v4;
  if (a3 && v4) {
    v4->_path = (NSString *)[a3 copy];
  }
  return v5;
}

- (MPSlide)initWithLayerGroup:(id)a3
{
  v4 = -[MPSlide init](self, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      layerGroup = (MPLayerGroup *)a3;
      v5->_layerGroup = layerGroup;
    }

    else
    {
      layerGroup = v4->_layerGroup;
    }

    -[MPLayerGroup setParent:](layerGroup, "setParent:", v5);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copyVars:self];
  if (self->_path) {
    objc_msgSend(v4, "setPath:");
  }
  if (self->_layerGroup) {
    objc_msgSend(v4, "copyLayerGroup:");
  }
  [v4 copyFilters:self->_filters];
  [v4 copyAnimationPaths:self->_animationPaths];
  [v4 copyFrame:self->_frame];
  return v4;
}

- (id)description
{
  v3 = -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"============================= Slide %d Description =============================\n",  -[MPSlide index](self, "index")),  "stringByAppendingFormat:",  @"\t                          Path: %@\n",  -[MPSlide path](self, "path")),  "stringByAppendingFormat:",  @"\t                 Absolute Path: %@\n",  -[MPSlide absolutePath](self, "absolutePath"));
  filters = self->_filters;
  if (filters) {
    filters = (NSMutableArray *)-[NSMutableArray count](filters, "count");
  }
  v5 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                  Filter Count: %d\n",  filters);
  if (-[MPSlide frame](self, "frame")) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"\t                     Has Frame: %@\n",  v6);
  if (self->_slide) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v7,  "stringByAppendingFormat:",  @"\t                     Has Slide: %@\n",  v8);
}

- (void)dealloc
{
  self->_slide = 0LL;
  self->_filters = 0LL;

  self->_animationPaths = 0LL;
  self->_attributes = 0LL;

  self->_path = 0LL;
  self->_layerGroup = 0LL;

  self->_frame = 0LL;
  self->_sizingMode = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPSlide;
  -[MPSlide dealloc](&v3, "dealloc");
}

- (MPFrame)frame
{
  return self->_frame;
}

- (void)setFrame:(id)a3
{
  frame = self->_frame;
  if (frame)
  {

    self->_frame = 0LL;
  }

  v6 = (MPFrame *)a3;
  self->_frame = v6;
  -[MPFrame setParentSlide:](v6, "setParentSlide:", self);
  if (self->_slide) {
    -[MCSlide setFrameID:](self->_slide, "setFrameID:", [a3 frameID]);
  }
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  if (a3) {
    -[MPSlide setLayerGroup:](self, "setLayerGroup:", 0LL);
  }
  if (!-[MPSlide isSecondary](self, "isSecondary")) {
    -[MPSlide setAbsolutePath:](self, "setAbsolutePath:", 0LL);
  }
  path = self->_path;
  if (path)
  {

    self->_path = 0LL;
  }

  if (a3) {
    self->_path = (NSString *)[a3 copy];
  }
  double v6 = -1.0;
  double v7 = -1.0;
  if (self->_duration != -1.0) {
    -[MPSlide duration](self, "duration", -1.0);
  }
  -[MPSlide setDuration:](self, "setDuration:", v7);
  if (self->_startTime != -1.0)
  {
    -[MPSlide startTime](self, "startTime");
    double v6 = v8;
  }

  -[MPSlide setStartTime:](self, "setStartTime:", v6);
  objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "resolutionForPath:", a3);
  self->_cachedSize.width = v9;
  self->_cachedSize.height = v10;
  slide = self->_slide;
  if (slide)
  {
    if (self->_path)
    {
      id v12 = objc_msgSend( objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "montage"),  "videoAssetForFileAtPath:",  self->_path);
      slide = self->_slide;
    }

    else
    {
      id v12 = 0LL;
    }

    -[MCSlide setAsset:](slide, "setAsset:", v12);
  }

- (NSString)absolutePath
{
  path = self->_path;
  if (+[MPUtilities pathIsRelative:](&OBJC_CLASS___MPUtilities, "pathIsRelative:", path)
    && (id v4 = -[MPSlide parentDocument](self, "parentDocument")) != 0LL)
  {
    return (NSString *)[v4 absolutePathForAssetAtPath:self->_path];
  }

  else
  {
    return path;
  }

- (void)setAbsolutePath:(id)a3
{
  if (self->_path) {
    objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "setAbsolutePath:forKey:", a3, self->_path);
  }
  if (a3)
  {
    objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "resolutionForPath:", a3);
    self->_cachedSize.width = v5;
    self->_cachedSize.height = v6;
  }

  else
  {
    objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "absolutePathForAssetAtPath:", self->_path);
  }

  if (-[MCSlide asset](self->_slide, "asset")) {
    -[MCAsset setPath:](-[MCSlide asset](self->_slide, "asset"), "setPath:", self->_path);
  }
  if (self->_mirrorToDuplicatePaths)
  {
    slide = self->_slide;
    if (slide)
    {
      double v8 = -[MCAssetVideo slides](-[MCSlide asset](slide, "asset"), "slides");
      if (v8)
      {
        CGFloat v9 = v8;
        if (-[NSSet count](v8, "count") >= 2)
        {
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          id v10 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v19;
            do
            {
              for (i = 0LL; i != v11; i = (char *)i + 1)
              {
                if (*(void *)v19 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = *(MCSlide **)(*((void *)&v18 + 1) + 8LL * (void)i);
                if (v14 != self->_slide)
                {
                  v15 = +[MPUtilities slideForSlide:inDocument:]( &OBJC_CLASS___MPUtilities,  "slideForSlide:inDocument:",  v14,  -[MPSlide parentDocument](self, "parentDocument"));
                  if (v15) {
                    BOOL v16 = v15 == self;
                  }
                  else {
                    BOOL v16 = 1;
                  }
                  if (!v16)
                  {
                    v17 = v15;
                    if ((objc_msgSend( objc_msgSend(-[MPSlide parent](v15, "parent"), "effectID"),  "isEqualToString:",  objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0) {
                      -[MPSlide setAbsolutePath:](v17, "setAbsolutePath:", a3);
                    }
                  }
                }
              }

              id v11 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
            }

            while (v11);
          }
        }
      }
    }
  }

- (MPLayerGroup)layerGroup
{
  return self->_layerGroup;
}

- (void)setLayerGroup:(id)a3
{
  layerGroup = self->_layerGroup;
  if (layerGroup != a3)
  {
    if (a3)
    {
      -[MPSlide setPath:](self, "setPath:", 0LL);
      layerGroup = self->_layerGroup;
    }

    if (layerGroup)
    {
      -[MPLayerGroup setParent:](layerGroup, "setParent:", 0LL);

      self->_layerGroup = 0LL;
    }

    if (a3)
    {
      CGFloat v6 = (MPLayerGroup *)a3;
      self->_layerGroup = v6;
      -[MPLayerGroup setParent:](v6, "setParent:", self);
    }

    slide = self->_slide;
    if (slide)
    {
      double v8 = self->_layerGroup;
      if (v8)
      {
        id v9 = +[MPUtilities createPlugInSlide:forLayer:inDocument:]( &OBJC_CLASS___MPUtilities,  "createPlugInSlide:forLayer:inDocument:",  slide,  v8,  -[MPSlide parentDocument](self, "parentDocument"));
        id v10 = self->_slide;
      }

      else
      {
        id v10 = self->_slide;
        id v9 = 0LL;
      }

      -[MCSlide setPlug:](v10, "setPlug:", v9);
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
  -[MPSlide insertFilters:atIndex:](self, "insertFilters:atIndex:", v4, v6);
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
  -[MPSlide insertFilters:atIndex:](self, "insertFilters:atIndex:", a3, v6);
}

- (void)insertFilters:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_filters) {
    self->_filters = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  double v7 = -[NSIndexSet initWithIndexesInRange:]( [NSIndexSet alloc],  "initWithIndexesInRange:",  a4,  [a3 count]);
  -[MPSlide willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2LL, v7, @"filters");
  -[NSMutableArray insertObjects:atIndexes:](self->_filters, "insertObjects:atIndexes:", a3, v7);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v50 + 1) + 8 * (void)i) setParent:self];
      }

      id v9 = [a3 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }

    while (v9);
  }

  if (self->_slide)
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v12 = [a3 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v47;
      do
      {
        for (j = 0LL; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v47 != v14) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend( *(id *)(*((void *)&v46 + 1) + 8 * (void)j),  "setFilter:",  -[MCSlide insertFilterWithFilterID:atIndex:]( self->_slide,  "insertFilterWithFilterID:atIndex:",  objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * (void)j), "filterID"),  (char *)j + a4));
        }

        id v13 = [a3 countByEnumeratingWithState:&v46 objects:v56 count:16];
        a4 += (int64_t)j;
      }

      while (v13);
    }
  }

  id v16 = -[MPSlide parentDocument](self, "parentDocument");
  v35 = v7;
  -[MPSlide didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 2LL, v7, @"filters");
  if (self->_mirrorToDuplicatePaths)
  {
    slide = self->_slide;
    if (slide)
    {
      __int128 v18 = -[MCAssetVideo slides](-[MCSlide asset](slide, "asset"), "slides");
      if (v18)
      {
        __int128 v19 = v18;
        if (-[NSSet count](v18, "count") >= 2)
        {
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          id v20 = -[NSSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v42,  v55,  16LL);
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v43;
            p_info = &OBJC_METACLASS___MRImageProvider.info;
            v36 = v19;
            id v37 = v16;
            do
            {
              for (k = 0LL; k != v21; k = (char *)k + 1)
              {
                if (*(void *)v43 != v22) {
                  objc_enumerationMutation(v19);
                }
                v25 = *(MCSlide **)(*((void *)&v42 + 1) + 8LL * (void)k);
                if (v25 != self->_slide)
                {
                  v26 = (MPSlide *)[p_info + 261 slideForSlide:v25 inDocument:v16];
                  if (v26 && v26 != self)
                  {
                    v28 = v26;
                    if ((objc_msgSend( objc_msgSend(-[MPSlide parent](v26, "parent"), "effectID"),  "isEqualToString:",  objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)
                    {
                      id v29 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
                      __int128 v38 = 0u;
                      __int128 v39 = 0u;
                      __int128 v40 = 0u;
                      __int128 v41 = 0u;
                      filters = self->_filters;
                      id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v38,  v54,  16LL);
                      if (v31)
                      {
                        id v32 = v31;
                        uint64_t v33 = *(void *)v39;
                        do
                        {
                          for (m = 0LL; m != v32; m = (char *)m + 1)
                          {
                            if (*(void *)v39 != v33) {
                              objc_enumerationMutation(filters);
                            }
                            objc_msgSend( v29,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * (void)m), "copy"));
                          }

                          id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v38,  v54,  16LL);
                        }

                        while (v32);
                      }

                      -[MPSlide removeAllFilters](v28, "removeAllFilters");
                      -[MPSlide insertFilters:atIndex:](v28, "insertFilters:atIndex:", v29, 0LL);
                      __int128 v19 = v36;
                      id v16 = v37;
                      p_info = (__objc2_class_ro **)(&OBJC_METACLASS___MRImageProvider + 32);
                    }
                  }
                }
              }

              id v21 = -[NSSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v42,  v55,  16LL);
            }

            while (v21);
          }
        }
      }
    }
  }
}

- (void)removeFiltersAtIndices:(id)a3
{
  filters = self->_filters;
  if (filters && -[NSMutableArray count](filters, "count"))
  {
    -[MPSlide willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 3LL, a3, @"filters");
    id v6 = -[MPSlide parentDocument](self, "parentDocument");
    id v7 = [a3 lastIndex];
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v7; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v9 = -[NSMutableArray objectAtIndex:](self->_filters, "objectAtIndex:", i);
        [v9 setParent:0];
        [v9 setFilter:0];
      }
    }

    slide = self->_slide;
    if (slide) {
      -[MCSlide removeFiltersAtIndices:](slide, "removeFiltersAtIndices:", a3);
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_filters, "removeObjectsAtIndexes:", a3);
    if (self->_mirrorToDuplicatePaths)
    {
      id v11 = self->_slide;
      if (v11)
      {
        id v12 = -[MCAssetVideo slides](-[MCSlide asset](v11, "asset"), "slides");
        if (v12)
        {
          id v13 = v12;
          if (-[NSSet count](v12, "count") >= 2)
          {
            __int128 v24 = 0u;
            __int128 v25 = 0u;
            __int128 v22 = 0u;
            __int128 v23 = 0u;
            id v14 = -[NSSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
            if (v14)
            {
              id v15 = v14;
              uint64_t v16 = *(void *)v23;
              do
              {
                for (j = 0LL; j != v15; j = (char *)j + 1)
                {
                  if (*(void *)v23 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  __int128 v18 = *(MCSlide **)(*((void *)&v22 + 1) + 8LL * (void)j);
                  if (v18 != self->_slide)
                  {
                    __int128 v19 = +[MPUtilities slideForSlide:inDocument:]( &OBJC_CLASS___MPUtilities,  "slideForSlide:inDocument:",  v18,  v6);
                    if (v19) {
                      BOOL v20 = v19 == self;
                    }
                    else {
                      BOOL v20 = 1;
                    }
                    if (!v20)
                    {
                      id v21 = v19;
                      if ((objc_msgSend( objc_msgSend(-[MPSlide parent](v19, "parent"), "effectID"),  "isEqualToString:",  objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0) {
                        -[MPSlide removeFiltersAtIndices:](v21, "removeFiltersAtIndices:", a3);
                      }
                    }
                  }
                }

                id v15 = -[NSSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
              }

              while (v15);
            }
          }
        }
      }
    }

    -[MPSlide didChange:valuesAtIndexes:forKey:](self, "didChange:valuesAtIndexes:forKey:", 3LL, a3, @"filters");
  }

- (void)removeAllFilters
{
  if (-[NSMutableArray count](self->_filters, "count"))
  {
    objc_super v3 = objc_alloc(&OBJC_CLASS___NSIndexSet);
    filters = self->_filters;
    if (filters) {
      id v5 = -[NSMutableArray count](filters, "count");
    }
    else {
      id v5 = 0LL;
    }
    id v6 = -[NSIndexSet initWithIndexesInRange:](v3, "initWithIndexesInRange:", 0LL, v5);
    -[MPSlide removeFiltersAtIndices:](self, "removeFiltersAtIndices:", v6);
  }

- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4
{
  if (self->_filters)
  {
    id v6 = [a3 firstIndex];
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = v6;
      do
      {
        id v8 = -[NSMutableArray objectAtIndex:](self->_filters, "objectAtIndex:", v7);
        -[NSMutableArray removeObjectAtIndex:](self->_filters, "removeObjectAtIndex:", v7);
        -[NSMutableArray insertObject:atIndex:]( self->_filters,  "insertObject:atIndex:",  v8,  (void)((__PAIR128__(a4, (unint64_t)v7) - (unint64_t)a4) >> 64));
        id v7 = [a3 indexGreaterThanIndex:v7];
        ++a4;
      }

      while (v7 != (id)0x7FFFFFFFFFFFFFFFLL);
    }

    slide = self->_slide;
    if (slide) {
      -[MCSlide moveFiltersAtIndices:toIndex:](slide, "moveFiltersAtIndices:toIndex:", a3, a4);
    }
    id v10 = -[MPSlide parentDocument](self, "parentDocument");
    if (self->_mirrorToDuplicatePaths)
    {
      id v11 = v10;
      id v12 = self->_slide;
      if (v12)
      {
        id v13 = -[MCAssetVideo slides](-[MCSlide asset](v12, "asset"), "slides");
        if (v13)
        {
          id v14 = v13;
          if (-[NSSet count](v13, "count") >= 2)
          {
            __int128 v26 = 0u;
            __int128 v27 = 0u;
            __int128 v24 = 0u;
            __int128 v25 = 0u;
            id v15 = -[NSSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v25;
              do
              {
                for (id i = 0LL; i != v16; id i = (char *)i + 1)
                {
                  if (*(void *)v25 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  __int128 v19 = *(MCSlide **)(*((void *)&v24 + 1) + 8LL * (void)i);
                  if (v19 != self->_slide)
                  {
                    BOOL v20 = +[MPUtilities slideForSlide:inDocument:]( &OBJC_CLASS___MPUtilities,  "slideForSlide:inDocument:",  v19,  v11);
                    if (v20) {
                      BOOL v21 = v20 == self;
                    }
                    else {
                      BOOL v21 = 1;
                    }
                    if (!v21)
                    {
                      __int128 v22 = v20;
                      if ((objc_msgSend( objc_msgSend(-[MPSlide parent](v20, "parent"), "effectID"),  "isEqualToString:",  objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0) {
                        -[MPSlide moveFiltersFromIndices:toIndex:](v22, "moveFiltersFromIndices:toIndex:", a3, a4);
                      }
                    }
                  }
                }

                id v16 = -[NSSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
              }

              while (v16);
            }
          }
        }
      }
    }
  }

- (id)animationPaths
{
  BOOL v5 = v4 == 0.5 && v3 == 0.5;
  if (!v5 && !-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", @"center"))
  {
    id v6 = +[MPAnimationPathKeyframed animationPath](&OBJC_CLASS___MPAnimationPathKeyframed, "animationPath");
    -[MPSlide center](self, "center");
    objc_msgSend(v6, "createKeyframeWithPoint:atTime:");
    -[MPSlide setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v6, @"center");
  }

  -[MPSlide scale](self, "scale");
  if (v7 != 1.0 && !-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", @"scale"))
  {
    id v8 = +[MPAnimationPathKeyframed animationPath](&OBJC_CLASS___MPAnimationPathKeyframed, "animationPath");
    -[MPSlide scale](self, "scale");
    objc_msgSend(v8, "createKeyframeWithScalar:atTime:");
    -[MPSlide setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v8, @"scale");
  }

  -[MPSlide rotation](self, "rotation");
  if (v9 != 0.0 && !-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", @"angle"))
  {
    id v10 = +[MPAnimationPathKeyframed animationPath](&OBJC_CLASS___MPAnimationPathKeyframed, "animationPath");
    -[MPSlide rotation](self, "rotation");
    objc_msgSend(v10, "createKeyframeWithScalar:atTime:");
    -[MPSlide setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v10, @"angle");
  }

  return self->_animationPaths;
}

- (id)animationPathForKey:(id)a3
{
  animationPaths = self->_animationPaths;
  if (!animationPaths || (id v6 = -[NSMutableDictionary objectForKey:](animationPaths, "objectForKey:", a3)) == 0LL)
  {
    if ([a3 isEqualToString:@"center"])
    {
      id v6 = +[MPAnimationPathKeyframed animationPath](&OBJC_CLASS___MPAnimationPathKeyframed, "animationPath");
      -[MPSlide center](self, "center");
      objc_msgSend(v6, "createKeyframeWithPoint:atTime:");
      double v7 = @"center";
    }

    else if ([a3 isEqualToString:@"scale"])
    {
      id v6 = +[MPAnimationPathKeyframed animationPath](&OBJC_CLASS___MPAnimationPathKeyframed, "animationPath");
      -[MPSlide scale](self, "scale");
      objc_msgSend(v6, "createKeyframeWithScalar:atTime:");
      double v7 = @"scale";
    }

    else
    {
      id v6 = +[MPAnimationPathKeyframed animationPath](&OBJC_CLASS___MPAnimationPathKeyframed, "animationPath");
      -[MPSlide rotation](self, "rotation");
      objc_msgSend(v6, "createKeyframeWithScalar:atTime:");
      double v7 = @"angle";
    }

    -[MPSlide setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v6, v7);
  }

  return v6;
}

- (BOOL)hasAnimationPathForKey:(id)a3
{
  animationPaths = self->_animationPaths;
  if (animationPaths) {
    LOBYTE(animationPaths) = -[NSMutableDictionary objectForKeyedSubscript:]( animationPaths,  "objectForKeyedSubscript:",  a3) != 0LL;
  }
  return (char)animationPaths;
}

- (id)keyframedAnimationPathForKey:(id)a3
{
  id v3 = -[MPSlide animationPathForKey:](self, "animationPathForKey:", a3);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MPAnimationPathKeyframed, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    return v3;
  }
  else {
    return 0LL;
  }
}

- (void)setAnimationPath:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    animationPaths = self->_animationPaths;
    if (animationPaths
      || (animationPaths = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary),
          (self->_animationPaths = animationPaths) != 0LL))
    {
      id v8 = -[NSMutableDictionary objectForKey:](animationPaths, "objectForKey:", a4);
      if (v8)
      {
        double v9 = v8;
        [v8 setParent:0];
        [v9 setAnimationPath:0];
      }
    }

    [a3 setParent:self];
    -[NSMutableDictionary setObject:forKey:](self->_animationPaths, "setObject:forKey:", a3, a4);
    slide = self->_slide;
    if (slide)
    {
      -[MCSlide removeAnimationPathForKey:](slide, "removeAnimationPathForKey:", a4);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v11);
      char isKindOfClass = objc_opt_isKindOfClass(a3, v12);
      id v14 = off_24C620;
      if ((isKindOfClass & 1) == 0) {
        id v14 = off_24C628;
      }
      id v15 = -[__objc2_class animationPathWithKey:](*v14, "animationPathWithKey:", a4);
      -[MCSlide addAnimationPath:](self->_slide, "addAnimationPath:", v15);
      [a3 setAnimationPath:v15];
    }

    id v29 = a3;
    id v16 = -[MPSlide parentDocument](self, "parentDocument");
    if (self->_mirrorToDuplicatePaths)
    {
      id v17 = v16;
      __int128 v18 = self->_slide;
      if (v18)
      {
        __int128 v19 = -[MCAssetVideo slides](-[MCSlide asset](v18, "asset"), "slides");
        if (v19)
        {
          BOOL v20 = v19;
          if (-[NSSet count](v19, "count") >= 2)
          {
            __int128 v32 = 0u;
            __int128 v33 = 0u;
            __int128 v30 = 0u;
            __int128 v31 = 0u;
            id v21 = -[NSSet countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
            if (v21)
            {
              id v22 = v21;
              uint64_t v23 = *(void *)v31;
              do
              {
                for (id i = 0LL; i != v22; id i = (char *)i + 1)
                {
                  if (*(void *)v31 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  __int128 v25 = *(MCSlide **)(*((void *)&v30 + 1) + 8LL * (void)i);
                  if (v25 != self->_slide)
                  {
                    __int128 v26 = +[MPUtilities slideForSlide:inDocument:]( &OBJC_CLASS___MPUtilities,  "slideForSlide:inDocument:",  v25,  v17);
                    if (v26) {
                      BOOL v27 = v26 == self;
                    }
                    else {
                      BOOL v27 = 1;
                    }
                    if (!v27)
                    {
                      v28 = v26;
                      if ((objc_msgSend( objc_msgSend(-[MPSlide parent](v26, "parent"), "effectID"),  "isEqualToString:",  objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0) {
                        -[MPSlide setAnimationPath:forKey:]( v28,  "setAnimationPath:forKey:",  [v29 copy],  a4);
                      }
                    }
                  }
                }

                id v22 = -[NSSet countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
              }

              while (v22);
            }
          }
        }
      }
    }
  }

  else
  {
    -[MPSlide removeAnimationPathForKey:](self, "removeAnimationPathForKey:", a4);
  }

- (void)removeAnimationPathForKey:(id)a3
{
  animationPaths = self->_animationPaths;
  if (animationPaths)
  {
    id v6 = -[NSMutableDictionary objectForKey:](animationPaths, "objectForKey:");
    id v7 = -[MPSlide parentDocument](self, "parentDocument");
    slide = self->_slide;
    if (slide)
    {
      -[MCSlide removeAnimationPathForKey:](slide, "removeAnimationPathForKey:", a3);
      [v6 setAnimationPath:0];
    }

    [v6 setParent:0];
    -[NSMutableDictionary removeObjectForKey:](self->_animationPaths, "removeObjectForKey:", a3);
    if (self->_mirrorToDuplicatePaths)
    {
      double v9 = self->_slide;
      if (v9)
      {
        id v10 = -[MCAssetVideo slides](-[MCSlide asset](v9, "asset"), "slides");
        if (v10)
        {
          uint64_t v11 = v10;
          if (-[NSSet count](v10, "count") >= 2)
          {
            __int128 v22 = 0u;
            __int128 v23 = 0u;
            __int128 v20 = 0u;
            __int128 v21 = 0u;
            id v12 = -[NSSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
            if (v12)
            {
              id v13 = v12;
              uint64_t v14 = *(void *)v21;
              do
              {
                for (id i = 0LL; i != v13; id i = (char *)i + 1)
                {
                  if (*(void *)v21 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  id v16 = *(MCSlide **)(*((void *)&v20 + 1) + 8LL * (void)i);
                  if (v16 != self->_slide)
                  {
                    id v17 = +[MPUtilities slideForSlide:inDocument:]( &OBJC_CLASS___MPUtilities,  "slideForSlide:inDocument:",  v16,  v7);
                    if (v17) {
                      BOOL v18 = v17 == self;
                    }
                    else {
                      BOOL v18 = 1;
                    }
                    if (!v18)
                    {
                      __int128 v19 = v17;
                      if ((objc_msgSend( objc_msgSend(-[MPSlide parent](v17, "parent"), "effectID"),  "isEqualToString:",  objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0) {
                        -[MPSlide removeAnimationPathForKey:](v19, "removeAnimationPathForKey:", a3);
                      }
                    }
                  }
                }

                id v13 = -[NSSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
              }

              while (v13);
            }
          }
        }
      }
    }
  }

- (double)showTime
{
  double result = self->_cachedShowTime;
  if (result < 0.0)
  {
    if (-[MPEffectSupport effectTiming](self->_parent, "effectTiming"))
    {
      objc_msgSend( -[MPEffectSupport effectTiming](self->_parent, "effectTiming"),  "showTimeForSlideAtIndex:",  -[MPSlide liveIndex](self, "liveIndex"));
    }

    else
    {
      unint64_t v5 = 0xBFF0000000000000LL;
      double v6 = 0.0;
      unsigned int v4 = -[MPSlide determineShowTime:showDuration:](self, "determineShowTime:showDuration:", &v6, &v5);
      double result = 0.0;
      if (!v4) {
        return result;
      }
      double result = v6;
    }

    self->_cachedShowTime = result;
  }

  return result;
}

- (double)showDuration
{
  double cachedShowDuration = self->_cachedShowDuration;
  if (cachedShowDuration < 0.0)
  {
    if (-[MPEffectSupport effectTiming](self->_parent, "effectTiming"))
    {
      objc_msgSend( -[MPEffectSupport effectTiming](self->_parent, "effectTiming"),  "showDurationForSlideAtIndex:",  -[MPSlide liveIndex](self, "liveIndex"));
      double cachedShowDuration = v4;
      self->_double cachedShowDuration = v4;
    }

    else
    {
      double v8 = -1.0;
      double v9 = 0.0;
      -[MPEffectSupport fullDuration](self->_parent, "fullDuration");
      double cachedShowDuration = v5;
      if (-[MPSlide determineShowTime:showDuration:](self, "determineShowTime:showDuration:", &v9, &v8))
      {
        if (v8 + v9 > cachedShowDuration || v8 < 0.0) {
          double cachedShowDuration = cachedShowDuration - v9;
        }
        else {
          double cachedShowDuration = v8;
        }
        self->_double cachedShowDuration = cachedShowDuration;
      }
    }
  }

  return cachedShowDuration;
}

- (double)showDisplayTime
{
  parent = self->_parent;
  if (!parent) {
    return 0.0;
  }
  id v4 = -[MPEffectSupport effectTiming](parent, "effectTiming");
  if (v4)
  {
    objc_msgSend(v4, "displayTimeForSlideAtIndex:", -[MPSlide liveIndex](self, "liveIndex"));
  }

  else
  {
    id v5 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "imageInputInfoForEffectID:",  -[MPEffectSupport effectID](self->_parent, "effectID"));
    unint64_t v6 = -[MPSlide index](self, "index");
    else {
      id v7 = objc_msgSend(v5, "objectAtIndex:", -[MPSlide index](self, "index"));
    }
    id v8 = [v7 objectForKey:@"showDisplayTime"];
    if (v8)
    {
      [v8 doubleValue];
      double v10 = v9;
      objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:",  -[MPEffectSupport effectID](self->_parent, "effectID"),  0,  &v19,  0);
      if (objc_msgSend( -[MPEffectSupport effectID](self->_parent, "effectID"),  "hasPrefix:",  @"SlidingPanels"))
      {
        double v10 = v10 + -0.5;
        double v19 = v19 + 0.83333;
      }

      -[MPEffectSupport mainDuration](self->_parent, "mainDuration");
      double v12 = v10 * (v11 / v19);
      -[MPEffectSupport phaseInDuration](self->_parent, "phaseInDuration");
      double v14 = v12 + v13;
      objc_msgSend(-[MPEffectSupport parentContainer](self->_parent, "parentContainer"), "introTransitionDuration");
      if (v14 >= result) {
        return v14;
      }
    }

    else
    {
      -[MPSlide showTime](self, "showTime");
      double v16 = v15;
      -[MPSlide showDuration](self, "showDuration");
      return v16 + v17 * 0.5;
    }
  }

  return result;
}

- (double)showDisplayStartTime
{
  double v12 = 0.0;
  id v3 = -[MPEffectSupport effectTiming](self->_parent, "effectTiming", 0xBFF0000000000000LL);
  if (v3 && (id v4 = v3, (objc_opt_respondsToSelector(v3, "showTimeForSlideAtIndex:") & 1) != 0))
  {
    objc_msgSend(v4, "showTimeForSlideAtIndex:", -[MPSlide liveIndex](self, "liveIndex"));
  }

  else if (-[MPSlide determineShowTime:showDuration:](self, "determineShowTime:showDuration:", &v12, &v11))
  {
    return v12;
  }

  else
  {
    id v6 = objc_msgSend( objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "imageInputInfoForEffectID:",  -[MPEffectSupport effectID](self->_parent, "effectID")),  "objectAtIndex:",  -[MPSlide index](self, "index")),  "objectForKey:",  @"showDisplayStartTime");
    if (v6)
    {
      id v7 = v6;
      -[MPSlide showDisplayTime](self, "showDisplayTime");
      double v9 = v8;
      [v7 doubleValue];
      return fmax(v9 - v10, 0.0);
    }

    else
    {
      return 0.0;
    }
  }

  return result;
}

- (double)startTime
{
  double result = self->_startTime;
  if (result == -1.0)
  {
    id v4 = -[MPSlide parentDocument](self, "parentDocument");
    if (v4) {
      objc_msgSend(v4, "startTimeForPath:", -[MPSlide path](self, "path"));
    }
    else {
      objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "startTimeForAssetAtPath:",  -[MPSlide absolutePath](self, "absolutePath"));
    }
  }

  return result;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
  slide = self->_slide;
  if (a3 == -1.0 || slide == 0LL)
  {
    if (a3 == -1.0 && slide != 0LL) {
      -[MCSlide undefineStartTime](slide, "undefineStartTime");
    }
  }

  else
  {
    -[MCSlide setStartTime:](slide, "setStartTime:");
  }

- (double)duration
{
  double result = self->_duration;
  if (result == -1.0)
  {
    id v4 = -[MPSlide parentDocument](self, "parentDocument");
    if (v4) {
      objc_msgSend(v4, "stopTimeForPath:", -[MPSlide path](self, "path"));
    }
    else {
      objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "durationForAssetAtPath:",  -[MPSlide absolutePath](self, "absolutePath"));
    }
    double v6 = v5;
    -[MPSlide startTime](self, "startTime");
    return v6 - v7;
  }

  return result;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  slide = self->_slide;
  if (a3 == -1.0 || slide == 0LL)
  {
    if (a3 == -1.0 && slide != 0LL) {
      -[MCSlide undefineDuration](slide, "undefineDuration");
    }
  }

  else
  {
    -[MCSlide setDuration:](slide, "setDuration:");
  }

- (double)audioVolume
{
  double result = self->_audioVolume;
  if (result == -1.0) {
    return 1.0;
  }
  return result;
}

- (void)setAudioVolume:(double)a3
{
  self->_audioVolume = a3;
  slide = self->_slide;
  if (slide)
  {
    *(float *)&a3 = a3;
    -[MCSlide setAudioVolume:](slide, "setAudioVolume:", a3);
  }

- (double)audioFadeInDuration
{
  return self->_audioFadeInDuration;
}

- (void)setAudioFadeInDuration:(double)a3
{
  self->_audioFadeInDuration = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setAudioFadeInDuration:](slide, "setAudioFadeInDuration:");
  }
}

- (double)audioFadeOutDuration
{
  return self->_audioFadeOutDuration;
}

- (void)setAudioFadeOutDuration:(double)a3
{
  self->_audioFadeOutDuration = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setAudioFadeOutDuration:](slide, "setAudioFadeOutDuration:");
  }
}

- (double)audioDuckInDuration
{
  return self->_audioDuckInDuration;
}

- (void)setAudioDuckInDuration:(double)a3
{
  self->_audioDuckInDuration = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setAudioDuckInDuration:](slide, "setAudioDuckInDuration:");
  }
}

- (double)audioDuckOutDuration
{
  return self->_audioDuckOutDuration;
}

- (void)setAudioDuckOutDuration:(double)a3
{
  self->_audioDuckOutDuration = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setAudioDuckOutDuration:](slide, "setAudioDuckOutDuration:");
  }
}

- (double)audioDuckLevel
{
  return self->_audioDuckLevel;
}

- (void)setAudioDuckLevel:(double)a3
{
  self->_audioDuckLevel = a3;
  slide = self->_slide;
  if (slide)
  {
    *(float *)&a3 = a3;
    -[MCSlide setAudioDuckLevel:](slide, "setAudioDuckLevel:", a3);
  }

- (NSString)sizingMode
{
  double result = self->_sizingMode;
  if (!result)
  {
    if (self->_parent)
    {
      id v4 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "imageInputInfoForEffectID:",  -[MPEffectSupport effectID](self->_parent, "effectID"));
      BOOL isSecondary = self->_isSecondary;
      unint64_t v6 = -[MPSlide index](self, "index");
      if (isSecondary) {
        v6 += (unint64_t)-[MPEffectSupport maxNumberOfSlides](self->_parent, "maxNumberOfSlides");
      }
      if (v6 < (unint64_t)[v4 count])
      {
        double result = (NSString *)[v4 objectAtIndex:v6];
        if (!result) {
          return result;
        }
        return (NSString *)-[NSString objectForKey:](result, "objectForKey:", @"kenBurnsType");
      }

      if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSlidesForEffectID:",  -[MPEffectSupport effectID](self->_parent, "effectID")) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        double result = (NSString *)[v4 lastObject];
        if (!result) {
          return result;
        }
        return (NSString *)-[NSString objectForKey:](result, "objectForKey:", @"kenBurnsType");
      }
    }

    return 0LL;
  }

  return result;
}

- (void)setSizingMode:(id)a3
{
  sizingMode = self->_sizingMode;
  if (sizingMode)
  {

    self->_sizingMode = 0LL;
  }

  self->_sizingMode = (NSString *)[a3 copy];
  frame = self->_frame;
  if (frame) {
    -[MPFrame setFrameAttribute:forKey:](frame, "setFrameAttribute:forKey:", a3, @"sizingMode");
  }
  slide = self->_slide;
  if (slide
    && (-[MCSlide kenBurnsType](slide, "kenBurnsType")
     || !-[NSString isEqualToString:](self->_sizingMode, "isEqualToString:", @"Crop to Fit")))
  {
    -[MCSlide setKenBurnsType:](self->_slide, "setKenBurnsType:", a3);
  }

  if (self->_mirrorToDuplicatePaths)
  {
    double v8 = self->_slide;
    if (v8)
    {
      double v9 = -[MCAssetVideo slides](-[MCSlide asset](v8, "asset"), "slides");
      if (v9)
      {
        double v10 = v9;
        if (-[NSSet count](v9, "count") >= 2)
        {
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          id v11 = -[NSSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              for (id i = 0LL; i != v12; id i = (char *)i + 1)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                double v15 = *(MCSlide **)(*((void *)&v19 + 1) + 8LL * (void)i);
                if (v15 != self->_slide)
                {
                  double v16 = +[MPUtilities slideForSlide:inDocument:]( &OBJC_CLASS___MPUtilities,  "slideForSlide:inDocument:",  v15,  -[MPSlide parentDocument](self, "parentDocument"));
                  if (v16) {
                    BOOL v17 = v16 == self;
                  }
                  else {
                    BOOL v17 = 1;
                  }
                  if (!v17)
                  {
                    BOOL v18 = v16;
                    if ((objc_msgSend( objc_msgSend(-[MPSlide parent](v16, "parent"), "effectID"),  "isEqualToString:",  objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0) {
                      -[MPSlide setSizingMode:](v18, "setSizingMode:", a3);
                    }
                  }
                }
              }

              id v12 = -[NSSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
            }

            while (v12);
          }
        }
      }
    }
  }

- (int64_t)index
{
  parent = self->_parent;
  if (!parent) {
    return -1LL;
  }
  if (self->_isSecondary && !self->_slide) {
    goto LABEL_7;
  }
  if (!objc_msgSend(-[MPSlide parentEffect](self, "parentEffect"), "isLive") || !self->_isSecondary)
  {
    if (!self->_slide || objc_msgSend(-[MPSlide parentEffect](self, "parentEffect"), "isLive"))
    {
      id v4 = -[MPEffectSupport slides](self->_parent, "slides");
      return (int64_t)[v4 indexOfObject:self];
    }

    BOOL isSecondary = self->_isSecondary;
    int64_t v5 = -[MCSlide index](self->_slide, "index");
    if (isSecondary) {
      v5 -= (uint64_t)objc_msgSend(-[MPEffectSupport slides](self->_parent, "slides"), "count");
    }
    return v5;
  }

  parent = self->_parent;
LABEL_7:
  id v4 = -[MPEffectSupport secondarySlides](parent, "secondarySlides");
  return (int64_t)[v4 indexOfObject:self];
}

- (int64_t)liveIndex
{
  parent = self->_parent;
  if (!parent) {
    return -1LL;
  }
  slide = self->_slide;
  if (self->_isSecondary)
  {
    if (slide)
    {
      unint64_t v5 = -[MCSlide index](self->_slide, "index");
      return v5 - (void)objc_msgSend(-[MPEffectSupport slides](self->_parent, "slides"), "count");
    }

    id v7 = -[MPEffectSupport secondarySlides](parent, "secondarySlides");
  }

  else
  {
    if (slide) {
      return -[MCSlide index](self->_slide, "index");
    }
    id v7 = -[MPEffectSupport slides](parent, "slides");
  }

  return (int64_t)[v7 indexOfObject:self];
}

- (double)aspectRatio
{
  return 9.22337204e18;
}

- (id)parentEffect
{
  return self->_parent;
}

- (id)parent
{
  return self->_parent;
}

- (id)parentSubtitleEffect
{
  parent = self->_parent;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPEffect, a2);
  if ((objc_opt_isKindOfClass(parent, v4) & 1) == 0) {
    return 0LL;
  }
  id v5 = -[MPSlide nearestLayer](self, "nearestLayer");
  id v6 = -[MPEffectSupport parentContainer](self->_parent, "parentContainer");
  id v7 = (char *)objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "subtitleOrderForStyleID:",  objc_msgSend(objc_msgSend(v5, "parentDocument"), "styleID"));
  if (v7)
  {
    if (v7 == (_BYTE *)&dword_0 + 2) {
      uint64_t v8 = -1LL;
    }
    else {
      uint64_t v8 = 1LL;
    }
    id v6 = objc_msgSend(v5, "objectInEffectContainersAtIndex:", (char *)objc_msgSend(v6, "index") + v8);
  }

  return objc_msgSend(objc_msgSend(v6, "effects"), "lastObject");
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setCenter:](slide, "setCenter:");
  }
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setScale:](slide, "setScale:");
  }
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setRotation:](slide, "setRotation:");
  }
}

- (BOOL)isSecondary
{
  return self->_isSecondary;
}

- (id)userInfoAttributeForKey:(id)a3
{
  id result = self->_attributes;
  if (result) {
    return [result objectForKey:a3];
  }
  return result;
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

- (BOOL)hasMovie
{
  unint64_t mediaType = self->_mediaType;
  if (mediaType != -1LL) {
    return mediaType == 3;
  }
  slide = self->_slide;
  if ((!slide || !-[MCSlide asset](slide, "asset")) && !self->_path) {
    return 0;
  }
  id v6 = -[MPSlide parentDocument](self, "parentDocument");
  if (v6) {
    unsigned int v7 = objc_msgSend(v6, "isMovieAtPath:", -[MPSlide path](self, "path"));
  }
  else {
    unsigned int v7 = +[MPFileValidationManager validateFilesForMovies:extensionsOnly:]( &OBJC_CLASS___MPFileValidationManager,  "validateFilesForMovies:extensionsOnly:",  +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  -[MPSlide absolutePath](self, "absolutePath")),  0LL);
  }
  BOOL v3 = v7;
  if (v7) {
    uint64_t v8 = 3LL;
  }
  else {
    uint64_t v8 = 2LL;
  }
  -[MPSlide setMediaType:](self, "setMediaType:", v8);
  return v3;
}

- (BOOL)needsStyleUpdateOnSlideChange
{
  id v3 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "imageInputInfoForEffectID:",  -[MPEffectSupport effectID](self->_parent, "effectID"));
  BOOL isSecondary = self->_isSecondary;
  unint64_t v5 = -[MPSlide index](self, "index");
  if (isSecondary) {
    v5 += (unint64_t)-[MPEffectSupport maxNumberOfSlides](self->_parent, "maxNumberOfSlides");
  }
  if (v5 >= (unint64_t)[v3 count])
  {
    if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSlidesForEffectID:",  -[MPEffectSupport effectID](self->_parent, "effectID")) == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v6 = [v3 lastObject];
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = [v3 objectAtIndex:v5];
  }

  id v7 = [v6 objectForKey:@"panoType"];
  if (v7) {
    BOOL v8 = [v7 integerValue] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = -[MPSlide parentDocument](self, "parentDocument");
  id v10 = [v9 styleID];
  if (v9) {
    return objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "needsStyleUpdateOnSlideChangeForStyleID:",  v10) & v8;
  }
  else {
    return 0;
  }
}

- (BOOL)needsTimingUpdateOnSlideChange
{
  id v3 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "imageInputInfoForEffectID:",  -[MPEffectSupport effectID](self->_parent, "effectID"));
  BOOL isSecondary = self->_isSecondary;
  unint64_t v5 = -[MPSlide index](self, "index");
  if (isSecondary) {
    v5 += (unint64_t)-[MPEffectSupport maxNumberOfSlides](self->_parent, "maxNumberOfSlides");
  }
  if (v5 >= (unint64_t)[v3 count])
  {
    if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numberOfSlidesForEffectID:",  -[MPEffectSupport effectID](self->_parent, "effectID")) == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v6 = [v3 lastObject];
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = [v3 objectAtIndex:v5];
  }

  id v7 = [v6 objectForKey:@"panoType"];
  if (v7) {
    BOOL v8 = [v7 integerValue] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = -[MPSlide parentDocument](self, "parentDocument");
  id v10 = [v9 styleID];
  if (v9) {
    return objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "needsTimingUpdateOnSlideChangeForStyleID:",  v10) & v8;
  }
  else {
    return 0;
  }
}

- (double)originalAspectRatio
{
  double width = self->_cachedSize.width;
  double result = 0.0;
  if (width != 0.0)
  {
    double height = self->_cachedSize.height;
    if (height != 0.0) {
      return width / height;
    }
  }

  return result;
}

- (id)slide
{
  return self->_slide;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  id v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@\n",  -[MPSlide description](self, "description"));
  frame = self->_frame;
  if (frame) {
    id v3 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"%@\n",  -[MPFrame fullDebugLog](frame, "fullDebugLog"));
  }
  unint64_t v5 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"=============================== Slide %d Filters =============================\n",  -[MPSlide index](self, "index"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  filters = self->_filters;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(filters);
        }
        unint64_t v5 = -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"%@\n",  [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) fullDebugLog]);
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_unint64_t mediaType = a3;
}

- (double)maxDuration
{
  return 0.0;
}

- (BOOL)canZoom
{
  id v3 = -[MPSlide parentDocument](self, "parentDocument");
  id v4 = [v3 styleID];
  if (([v4 isEqualToString:@"KenBurns"] & 1) != 0
    || ([v4 isEqualToString:@"Classic"] & 1) != 0)
  {
    return 1;
  }

  else
  {
    return !-[MPSlide isPanoramaInDocument:](self, "isPanoramaInDocument:", v3);
  }

- (id)action
{
  return objc_msgSend( objc_msgSend(-[MPSlide parent](self, "parent"), "container"),  "actionForKey:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"slide%d",  -[MPSlide index](self, "index")));
}

- (void)resetCachedTimes
{
  *(int64x2_t *)&self->_cachedShowTime = vdupq_n_s64(0xC059000000000000LL);
}

- (void)setMirrorToDuplicatePaths:(BOOL)a3
{
  self->_mirrorToDuplicatePaths = a3;
}

- (void)setIsSecondary:(BOOL)a3
{
  self->_BOOL isSecondary = a3;
}

- (void)copyVars:(id)a3
{
  self->_startTime = *((double *)a3 + 9);
  self->_duration = *((double *)a3 + 10);
  self->_audioVolume = *((double *)a3 + 20);
  self->_audioFadeInDuration = *((double *)a3 + 11);
  self->_audioFadeOutDuration = *((double *)a3 + 12);
  self->_audioDuckInDuration = *((double *)a3 + 13);
  self->_audioDuckOutDuration = *((double *)a3 + 14);
  self->_audioDuckLevel = *((double *)a3 + 15);
  sizingMode = self->_sizingMode;
  if (sizingMode)
  {

    self->_sizingMode = 0LL;
  }

  self->_sizingMode = (NSString *)[*((id *)a3 + 21) copy];
}

- (void)copyFrame:(id)a3
{
  frame = self->_frame;
  if (frame)
  {

    self->_frame = 0LL;
  }

  id v6 = [a3 copy];
  -[MPSlide setFrame:](self, "setFrame:", v6);
}

- (void)copyLayerGroup:(id)a3
{
  layerGroup = self->_layerGroup;
  if (layerGroup)
  {

    self->_layerGroup = 0LL;
  }

  id v6 = [a3 copy];
  -[MPSlide setLayerGroup:](self, "setLayerGroup:", v6);
}

- (void)copyFilters:(id)a3
{
  if (a3)
  {
    unint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
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

    -[MPSlide addFilters:](self, "addFilters:", v5);
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
        for (id i = 0LL; i != v6; id i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
          id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
          -[MPSlide setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v10, v9);
        }

        id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }
  }

- (void)cleanup
{
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
        -[MPSlide removeAnimationPathForKey:]( self,  "removeAnimationPathForKey:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

- (id)parentDocument
{
  return -[MPEffectSupport parentDocument](self->_parent, "parentDocument");
}

- (id)nearestLayer
{
  parent = self->_parent;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPEffect, a2);
  if ((objc_opt_isKindOfClass(parent, v4) & 1) != 0) {
    return objc_msgSend(objc_msgSend(-[MPSlide parent](self, "parent"), "parentContainer"), "parentLayer");
  }
  else {
    return self->_parent;
  }
}

- (BOOL)determineShowTime:(double *)a3 showDuration:(double *)a4
{
  if (-[MPSlide index](self, "index") == -1 || !self->_parent)
  {
    LOBYTE(v7) = 0;
  }

  else
  {
    id v7 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "showTimeScriptForEffectID:atSlideIndex:",  -[MPEffectSupport effectID](self->_parent, "effectID"),  -[MPSlide index](self, "index"));
    if (v7)
    {
      id v8 = v7;
      __int128 v9 = objc_alloc(&OBJC_CLASS___NSDictionary);
      -[MPEffectSupport phaseInDuration](self->_parent, "phaseInDuration");
      __int128 v10 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
      -[MPEffectSupport mainDuration](self->_parent, "mainDuration");
      __int128 v11 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
      -[MPEffectSupport phaseOutDuration](self->_parent, "phaseOutDuration");
      __int128 v12 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
      -[MPEffectSupport fullDuration](self->_parent, "fullDuration");
      __int128 v13 = -[NSDictionary initWithObjectsAndKeys:]( v9,  "initWithObjectsAndKeys:",  v10,  @"phaseInDuration",  v11,  @"mainDuration",  v12,  @"phaseOutDuration",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"fullDuration",  0LL);
      __int128 v14 = +[MPUtilities executeScript:withHeader:andAttributes:]( &OBJC_CLASS___MPUtilities,  "executeScript:withHeader:andAttributes:",  v8,  v13,  -[MPEffectSupport effectAttributes](self->_parent, "effectAttributes"));

      if (v14)
      {
        CGSize v15 = CGSizeFromString(v14);
        if (a3) {
          *a3 = v15.width;
        }
        if (a4) {
          *a4 = v15.height;
        }
      }

      LOBYTE(v7) = 1;
    }
  }

  return (char)v7;
}

- (void)setSlide:(id)a3
{
  slide = self->_slide;
  if (slide)
  {

    self->_slide = 0LL;
  }

  uint64_t v6 = (MCSlide *)a3;
  self->_slide = v6;
  if (v6)
  {
    frame = self->_frame;
    if (frame)
    {
      -[MCSlide setFrameID:](self->_slide, "setFrameID:", -[MPFrame frameID](frame, "frameID"));
      -[MCSlide setFrameAttribute:forKey:]( self->_slide,  "setFrameAttribute:forKey:",  -[MPFrame presetID](self->_frame, "presetID"),  @"PresetID");
      -[MCSlide setFrameAttribute:forKey:]( self->_slide,  "setFrameAttribute:forKey:",  -[MPFrame frameAttributes](self->_frame, "frameAttributes"),  @"specificAttributes");
    }

    if (self->_sizingMode
      && (-[MCSlide kenBurnsType](self->_slide, "kenBurnsType")
       || !-[NSString isEqualToString:](self->_sizingMode, "isEqualToString:", @"Crop to Fit")))
    {
      -[MCSlide setKenBurnsType:](self->_slide, "setKenBurnsType:", self->_sizingMode);
    }

    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    filters = self->_filters;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v86,  v96,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v87;
      do
      {
        for (id i = 0LL; i != v10; id i = (char *)i + 1)
        {
          if (*(void *)v87 != v11) {
            objc_enumerationMutation(filters);
          }
          objc_msgSend( *(id *)(*((void *)&v86 + 1) + 8 * (void)i),  "setFilter:",  -[MCSlide addFilterWithFilterID:]( self->_slide,  "addFilterWithFilterID:",  objc_msgSend(*(id *)(*((void *)&v86 + 1) + 8 * (void)i), "filterID")));
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( filters,  "countByEnumeratingWithState:objects:count:",  &v86,  v96,  16LL);
      }

      while (v10);
    }

    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    animationPaths = self->_animationPaths;
    id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v82,  v95,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v83;
      do
      {
        for (j = 0LL; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v83 != v16) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v18 = *(void *)(*((void *)&v82 + 1) + 8LL * (void)j);
          id v19 = -[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", v18);
          uint64_t v21 = objc_opt_class(&OBJC_CLASS___MPAnimationPathCombo, v20);
          if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0) {
            __int128 v22 = off_24C620;
          }
          else {
            __int128 v22 = off_24C628;
          }
          id v23 = -[__objc2_class animationPathWithKey:](*v22, "animationPathWithKey:", v18);
          -[MCSlide addAnimationPath:](self->_slide, "addAnimationPath:", v23);
          [v19 setAnimationPath:v23];
        }

        id v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v82,  v95,  16LL);
      }

      while (v15);
    }

    if (self->_cachedSize.width == CGSizeZero.width && self->_cachedSize.height == CGSizeZero.height)
    {
      objc_msgSend( -[MPSlide parentDocument](self, "parentDocument"),  "resolutionForPath:",  -[MPSlide path](self, "path"));
      self->_cachedSize.double width = v25;
      self->_cachedSize.double height = v26;
    }

    -[MPSlide center](self, "center");
    -[MCSlide setCenter:](self->_slide, "setCenter:");
    -[MPSlide rotation](self, "rotation");
    -[MCSlide setRotation:](self->_slide, "setRotation:");
    -[MPSlide scale](self, "scale");
    -[MCSlide setScale:](self->_slide, "setScale:");
    if (-[MPSlide hasMovie](self, "hasMovie"))
    {
      if (self->_path)
      {
        if (self->_startTime != -1.0) {
          -[MCSlide setStartTime:](self->_slide, "setStartTime:");
        }
        if (self->_duration != -1.0) {
          -[MCSlide setDuration:](self->_slide, "setDuration:");
        }
      }

      double audioVolume = self->_audioVolume;
      if (audioVolume != -1.0)
      {
        *(float *)&double audioVolume = audioVolume;
        -[MCSlide setAudioVolume:](self->_slide, "setAudioVolume:", audioVolume);
      }

      -[MPSlide audioFadeInDuration](self, "audioFadeInDuration");
      -[MCSlide setAudioFadeInDuration:](self->_slide, "setAudioFadeInDuration:");
      -[MPSlide audioFadeOutDuration](self, "audioFadeOutDuration");
      -[MCSlide setAudioFadeOutDuration:](self->_slide, "setAudioFadeOutDuration:");
      -[MPSlide audioDuckInDuration](self, "audioDuckInDuration");
      -[MCSlide setAudioDuckInDuration:](self->_slide, "setAudioDuckInDuration:");
      -[MPSlide audioDuckOutDuration](self, "audioDuckOutDuration");
      -[MCSlide setAudioDuckOutDuration:](self->_slide, "setAudioDuckOutDuration:");
      -[MPSlide audioDuckLevel](self, "audioDuckLevel");
      *(float *)&double v28 = v28;
      -[MCSlide setAudioDuckLevel:](self->_slide, "setAudioDuckLevel:", v28);
    }

    layerGroup = self->_layerGroup;
    if (layerGroup) {
      id v30 = +[MPUtilities createPlugInSlide:forLayer:inDocument:]( &OBJC_CLASS___MPUtilities,  "createPlugInSlide:forLayer:inDocument:",  self->_slide,  layerGroup,  -[MPSlide parentDocument](self, "parentDocument"));
    }
    else {
      id v30 = 0LL;
    }
    -[MCSlide setPlug:](self->_slide, "setPlug:", v30);
    if (self->_mirrorToDuplicatePaths)
    {
      __int128 v41 = self->_slide;
      if (v41)
      {
        obj = -[MCAssetVideo slides](-[MCSlide asset](v41, "asset"), "slides");
        if (obj)
        {
          if (-[NSSet count](obj, "count") >= 2)
          {
            __int128 v80 = 0u;
            __int128 v81 = 0u;
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            id v42 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v78,  v94,  16LL);
            if (v42)
            {
              id v43 = v42;
              uint64_t v44 = *(void *)v79;
              do
              {
                for (k = 0LL; k != v43; k = (char *)k + 1)
                {
                  if (*(void *)v79 != v44) {
                    objc_enumerationMutation(obj);
                  }
                  __int128 v46 = *(MCSlide **)(*((void *)&v78 + 1) + 8LL * (void)k);
                  if (v46 != self->_slide)
                  {
                    __int128 v47 = +[MPUtilities slideForSlide:inDocument:]( &OBJC_CLASS___MPUtilities,  "slideForSlide:inDocument:",  v46,  -[MPSlide parentDocument](self, "parentDocument"));
                    if (v47 && v47 != self)
                    {
                      __int128 v49 = v47;
                      if ((objc_msgSend( objc_msgSend(-[MPSlide parent](v47, "parent"), "effectID"),  "isEqualToString:",  objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)
                      {
                        id v50 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
                        __int128 v74 = 0u;
                        __int128 v75 = 0u;
                        __int128 v76 = 0u;
                        __int128 v77 = 0u;
                        __int128 v51 = self->_filters;
                        id v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v74,  v93,  16LL);
                        if (v52)
                        {
                          id v53 = v52;
                          uint64_t v54 = *(void *)v75;
                          do
                          {
                            for (m = 0LL; m != v53; m = (char *)m + 1)
                            {
                              if (*(void *)v75 != v54) {
                                objc_enumerationMutation(v51);
                              }
                              objc_msgSend( v50,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * (void)m), "copy"));
                            }

                            id v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v74,  v93,  16LL);
                          }

                          while (v53);
                        }

                        -[MPSlide removeAllFilters](v49, "removeAllFilters");
                        -[MPSlide addFilters:](v49, "addFilters:", v50);
                        -[MPSlide setSizingMode:](v49, "setSizingMode:", self->_sizingMode);
                        __int128 v72 = 0u;
                        __int128 v73 = 0u;
                        __int128 v70 = 0u;
                        __int128 v71 = 0u;
                        v56 = self->_animationPaths;
                        id v57 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v56,  "countByEnumeratingWithState:objects:count:",  &v70,  v92,  16LL);
                        if (v57)
                        {
                          id v58 = v57;
                          uint64_t v59 = *(void *)v71;
                          do
                          {
                            for (n = 0LL; n != v58; n = (char *)n + 1)
                            {
                              if (*(void *)v71 != v59) {
                                objc_enumerationMutation(v56);
                              }
                              -[MPSlide setAnimationPath:forKey:]( v49,  "setAnimationPath:forKey:",   objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_animationPaths,  "objectForKey:",  *(void *)(*((void *)&v70 + 1) + 8 * (void)n)),  "copy"),  *(void *)(*((void *)&v70 + 1) + 8 * (void)n));
                            }

                            id v58 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v56,  "countByEnumeratingWithState:objects:count:",  &v70,  v92,  16LL);
                          }

                          while (v58);
                        }
                      }
                    }
                  }
                }

                id v43 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v78,  v94,  16LL);
              }

              while (v43);
            }
          }
        }
      }
    }
  }

  else
  {
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v31 = self->_filters;
    id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v66,  v91,  16LL);
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v67;
      do
      {
        for (iid i = 0LL; ii != v33; iid i = (char *)ii + 1)
        {
          if (*(void *)v67 != v34) {
            objc_enumerationMutation(v31);
          }
          [*(id *)(*((void *)&v66 + 1) + 8 * (void)ii) setFilter:0];
        }

        id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v66,  v91,  16LL);
      }

      while (v33);
    }

    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    v36 = self->_animationPaths;
    id v37 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v62,  v90,  16LL);
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v63;
      do
      {
        for (jj = 0LL; jj != v38; jj = (char *)jj + 1)
        {
          if (*(void *)v63 != v39) {
            objc_enumerationMutation(v36);
          }
          objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_animationPaths,  "objectForKey:",  *(void *)(*((void *)&v62 + 1) + 8 * (void)jj)),  "setAnimationPath:",  0);
        }

        id v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v62,  v90,  16LL);
      }

      while (v38);
    }
  }

- (void)duplicateAnimationPaths
{
  if (self->_mirrorToDuplicatePaths)
  {
    slide = self->_slide;
    if (slide)
    {
      obj = -[MCAssetVideo slides](-[MCSlide asset](slide, "asset"), "slides");
      if (obj)
      {
        if (-[NSSet count](obj, "count") >= 2)
        {
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          id v4 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
          if (v4)
          {
            id v5 = v4;
            uint64_t v6 = *(void *)v23;
            do
            {
              for (id i = 0LL; i != v5; id i = (char *)i + 1)
              {
                if (*(void *)v23 != v6) {
                  objc_enumerationMutation(obj);
                }
                id v8 = *(MCSlide **)(*((void *)&v22 + 1) + 8LL * (void)i);
                if (v8 != self->_slide)
                {
                  id v9 = +[MPUtilities slideForSlide:inDocument:]( &OBJC_CLASS___MPUtilities,  "slideForSlide:inDocument:",  v8,  -[MPSlide parentDocument](self, "parentDocument"));
                  if (v9 && v9 != self)
                  {
                    uint64_t v11 = v9;
                    if ((objc_msgSend( objc_msgSend(-[MPSlide parent](v9, "parent"), "effectID"),  "isEqualToString:",  objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)
                    {
                      __int128 v20 = 0u;
                      __int128 v21 = 0u;
                      __int128 v18 = 0u;
                      __int128 v19 = 0u;
                      animationPaths = self->_animationPaths;
                      id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
                      if (v13)
                      {
                        id v14 = v13;
                        uint64_t v15 = *(void *)v19;
                        do
                        {
                          for (j = 0LL; j != v14; j = (char *)j + 1)
                          {
                            if (*(void *)v19 != v15) {
                              objc_enumerationMutation(animationPaths);
                            }
                            -[MPSlide setAnimationPath:forKey:]( v11,  "setAnimationPath:forKey:",   objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_animationPaths,  "objectForKey:",  *(void *)(*((void *)&v18 + 1) + 8 * (void)j)),  "copy"),  *(void *)(*((void *)&v18 + 1) + 8 * (void)j));
                          }

                          id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( animationPaths,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
                        }

                        while (v14);
                      }
                    }
                  }
                }
              }

              id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
            }

            while (v5);
          }
        }
      }
    }
  }

- (void)setParent:(id)a3
{
  if (a3 && self->_parent)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"A slide may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPSlide isPanoramaInDocument:](v3, v4, v5);
  }

  else
  {
    self->_parent = (MPEffectSupport *)a3;
    -[MPSlide resetCachedTimes](self, "resetCachedTimes");
  }

- (BOOL)isPanoramaInDocument:(id)a3
{
  double v5 = v3 / v4;
  return v5 > 2.0 || v5 < 0.5;
}

- (int64_t)countOfFilter
{
  return (int64_t)-[NSMutableArray count](self->_filters, "count");
}

- (id)objectInFilterAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_filters, "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 inFilterAtIndex:(int64_t)a4
{
  uint64_t v6 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  -[MPSlide insertFilters:atIndex:](self, "insertFilters:atIndex:", v6, a4);
}

- (void)removeObjectFromFilterAtIndex:(int64_t)a3
{
  double v4 = -[NSIndexSet initWithIndex:](objc_alloc(&OBJC_CLASS___NSIndexSet), "initWithIndex:", a3);
  -[MPSlide removeFiltersAtIndices:](self, "removeFiltersAtIndices:", v4);
}

- (void)replaceObjectInFilterAtIndex:(int64_t)a3 withObject:(id)a4
{
}

- (id)scriptingAnimations
{
  id v20 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  obj = self->_animationPaths;
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
        double v3 = *(void **)(*((void *)&v29 + 1) + 8 * v2);
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
              if ([v3 isEqualToString:@"center"])
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
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (id i = 0LL; i != v5; id i = (char *)i + 1)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(a3);
        }
        id v7 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v8 = [a3 objectForKey:v7];
        id v9 = [v8 objectForKey:@"times"];
        id v10 = [v8 objectForKey:@"values"];
        id v11 = +[MPAnimationPathKeyframed animationPath](&OBJC_CLASS___MPAnimationPathKeyframed, "animationPath");
        __int128 v12 = (char *)[v9 count];
        if ((uint64_t)v12 >= 1)
        {
          double v13 = v12;
          for (j = 0LL; j != v13; ++j)
          {
            if ([v7 isEqualToString:@"center"])
            {
              objc_msgSend(objc_msgSend(v10, "objectAtIndex:", j), "getBytes:length:", v23, 4);
              double v15 = (double)v23[0];
              double v16 = (double)v23[1];
              objc_msgSend(objc_msgSend(v9, "objectAtIndex:", j), "doubleValue");
              objc_msgSend(v11, "createKeyframeWithPoint:atTime:", v15, v16, v17);
            }

            else
            {
              objc_msgSend(objc_msgSend(v10, "objectAtIndex:", j), "doubleValue");
              double v19 = v18;
              objc_msgSend(objc_msgSend(v9, "objectAtIndex:", j), "doubleValue");
              [v11 createKeyframeWithScalar:v19 atTime:v20];
            }
          }
        }

        -[MPSlide setAnimationPath:forKey:](self, "setAnimationPath:forKey:", v11, v7);
      }

      id v5 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v5);
  }

- (id)scriptingFrame
{
  if (!self->_frame) {
    return +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
  }
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", -[MPFrame frameID](self->_frame, "frameID"), @"frameID");
  objc_msgSend(v3, "setObject:forKey:", -[MPFrame presetID](self->_frame, "presetID"), @"presetID");
  return v3;
}

- (void)setScriptingFrame:(id)a3
{
  if ([a3 objectForKey:@"frameID"])
  {
    if (objc_msgSend( objc_msgSend(a3, "objectForKey:", @"frameID"),  "isEqualToString:",  &stru_259C60))
    {
      id v5 = 0LL;
    }

    else
    {
      id v5 = +[MPFrame frameWithFrameID:]( MPFrame,  "frameWithFrameID:",  [a3 objectForKey:@"frameID"]);
      if ([a3 objectForKey:@"presetID"]) {
        -[MPFrame setPresetID:](v5, "setPresetID:", [a3 objectForKey:@"presetID"]);
      }
    }

    -[MPSlide setFrame:](self, "setFrame:", v5);
  }

@end