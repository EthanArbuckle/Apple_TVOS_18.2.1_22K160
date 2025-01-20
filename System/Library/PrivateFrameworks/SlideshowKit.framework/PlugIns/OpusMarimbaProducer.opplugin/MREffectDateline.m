@interface MREffectDateline
+ (BOOL)_timeIs24HourFormat;
+ (BOOL)hasCustomTiming;
+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7;
+ (id)localizedDateStringForMainTitle:(id)a3 latest:(id)a4;
+ (id)localizedStringsDictByDate:(id)a3 useHours:(BOOL)a4;
+ (void)initialize;
- (BOOL)_isMovieForSlideAtIndex:(int64_t)a3;
- (BOOL)getVerticesCoordinates:(MREffectDateline *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsChapters;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (CGSize)_sizeForBreakAspectRatio:(double)a3 size:(CGSize)a4 inContext:(id)a5;
- (MREffectDateline)initWithEffectID:(id)a3;
- (_NSRange)_chapterRangeForSlide:(int64_t)a3 startIndex:(int64_t *)a4 endIndex:(int64_t *)a5;
- (double)_aspectRatioForSlideIndex:(int64_t)a3;
- (double)_calculateMainDurationWithAttributes:(id)a3;
- (double)_movieDurationForSlideAtIndex:(int64_t)a3;
- (double)_offsetForChapterIndex:(int64_t)a3 layoutIndex:(int64_t)a4 aspectRatio:(double)a5;
- (double)_startTimeForChapter:(int64_t)a3;
- (double)_startTimeForSlideIndex:(int64_t)a3 inChapter:(int64_t)a4;
- (double)displayTimeForSlideAtIndex:(unint64_t)a3;
- (double)displayTimeForTextAtIndex:(unint64_t)a3;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (double)lowestDisplayTime;
- (double)showDurationForSlideAtIndex:(unint64_t)a3;
- (double)showTimeForSlideAtIndex:(unint64_t)a3;
- (double)timeForNextChapterAfterTime:(double)a3;
- (double)timeForPreviousChapterBeforeTime:(double)a3;
- (id)_retainedByUserTextImageForString:(id)a3 string2:(id)a4 type:(int64_t)a5 inContext:(id)a6 firstLine:(CGRect *)a7 lastLine:(CGRect *)a8;
- (id)_retainedByUserTextImageForString:(id)a3 type:(int64_t)a4 inContext:(id)a5;
- (id)_weatherStringForCondition:(unint64_t)a3;
- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (int64_t)_chapterIndexForTime:(double)a3;
- (int64_t)_currentItemForChapter:(int64_t)a3 atTime:(double)a4 forDuration:(double *)a5 fromTime:(double *)a6;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_addTextImage:(id)a3 forKey:(id)a4 inDictionary:(id)a5;
- (void)_calculateDurations:(id)a3 slideInformation:(id)a4 aspectRatio:(double)a5;
- (void)_cleanUpDictionary:(id)a3;
- (void)_cleanup;
- (void)_drawChapterDateSwitch:(int64_t)a3 to:(int64_t)a4 progress:(double)a5 time:(double)a6 arguments:(id)a7 context:(id)a8;
- (void)_drawGrayChapters:(id)a3 time:(double)a4 arguments:(id)a5 showInfo:(BOOL)a6 startProgress:(double)a7 titleEnd:(double)a8 titleToChapter:(double)a9 drawPhotos:(BOOL)a10 startIndex:(int64_t)a11 exit:(double)a12 isExiting:(BOOL)a13 chapterIntro:(double)a14 chapterProgress:(double)a15;
- (void)_loadDateForChapter:(int64_t)a3 context:(id)a4;
- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_loadTextForChapter:(int64_t)a3 context:(id)a4;
- (void)_unload;
- (void)_unloadTextForChapter:(int64_t)a3;
- (void)_updateIndiciesWithAttributes:(id)a3;
- (void)_updateSlideProviders:(double)a3 context:(id)a4 renderArguments:(id)a5;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)endMorphing;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation MREffectDateline

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MREffectDateline;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareTexture1; \n\t\tDeclareTexture2; \n\t\tuniform lowp float mixFactor; \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp float a = SampleTexture2.r; \n\t\t\tgl_FragColor = uColor * vec4(mix(SampleTexture0.rgb, SampleTexture1.rgb, mixFactor), a); \n\t\t} \n\t\t",
    @"VertexTexture012",
    @"WeatherWindow");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n        DeclareTexture0; \n        DeclareTexture1; \n        uniform lowp float mixFactor; \n        DeclareForeColorU; \n        void main() \n        { \n            lowp float a = SampleTexture1.r; \n            gl_FragColor = uColor * vec4(SampleTexture0.rgb*mixFactor, a*ceil(SampleTexture0.a)); \n        } \n        ",
    @"VertexTexture012",
    @"DateWindowSingle");
}

- (MREffectDateline)initWithEffectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MREffectDateline;
  v4 = -[MREffect initWithEffectID:](&v6, "initWithEffectID:");
  if (v4)
  {
    *(void *)(v4 + 185) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v4 + 201) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)(v4 + 209) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)(v4 + 225) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v4 + 233) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v4 + 249) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)(v4 + 257) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v4 + 361) = objc_alloc_init(&OBJC_CLASS___MRCroppingSprite);
    *(void *)(v4 + 241) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v4 + 265) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(void *)(v4 + 281) = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    [*(id *)(v4 + 361) setNeedsInSpriteCoordinates:1];
    *(void *)(v4 + 305) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 305),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"textBlockBG.jpg"));
    [*(id *)(v4 + 305) setImageSizeScript:@"layerHeight*.6,layerHeight*.6"];
    objc_msgSend(*(id *)(v4 + 305), "setOriginalImageSize:", 2000.0, 2000.0);
    *(void *)(v4 + 313) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 313),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"dropQuote_open.png"));
    [*(id *)(v4 + 313) setImageSizeScript:@"layerHeight*.05,layerHeight*.05*imageAspectRatio"];
    objc_msgSend(*(id *)(v4 + 313), "setOriginalImageSize:", 210.0, 222.0);
    *(void *)(v4 + 321) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 321),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"dropQuote_close.png"));
    [*(id *)(v4 + 321) setImageSizeScript:@"layerHeight*.05,layerHeight*.05*imageAspectRatio"];
    objc_msgSend(*(id *)(v4 + 321), "setOriginalImageSize:", 210.0, 222.0);
    *(void *)(v4 + 329) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 329),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"dropQuote_box.jpg"));
    [*(id *)(v4 + 329) setImageSizeScript:@"layerHeight*.1,layerHeight*.1*imageAspectRatio"];
    objc_msgSend(*(id *)(v4 + 329), "setOriginalImageSize:", 700.0, 700.0);
    *(void *)(v4 + 337) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 337),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"weatherWindowMask.png"));
    objc_msgSend(*(id *)(v4 + 337), "setOriginalImageSize:", 370.0, 370.0);
    [*(id *)(v4 + 337) setWantsMonochromatic:1];
    *(void *)(v4 + 345) = objc_alloc_init(&OBJC_CLASS___MRImageProvider);
    objc_msgSend( *(id *)(v4 + 345),  "setAssetPath:",  objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "resourcePathForEffectID:andResource:",  a3,  @"dateWindowMask.png"));
    objc_msgSend(*(id *)(v4 + 345), "setOriginalImageSize:", 370.0, 370.0);
    [*(id *)(v4 + 337) setWantsMonochromatic:1];
  }

  return (MREffectDateline *)v4;
}

- (void)_cleanup
{
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  v3 = *(NSMutableDictionary **)((char *)&self->mWeatherImages + 1);
  id v4 = [v3 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v64;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v64 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( objc_msgSend( *(id *)((char *)&self->mWeatherImages + 1),  "objectForKey:",  *(void *)(*((void *)&v63 + 1) + 8 * (void)i)),  "removingFromCollection");
      }

      id v5 = [v3 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }

    while (v5);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  v8 = *(NSMutableDictionary **)((char *)&self->mText + 1);
  id v9 = [v8 countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v60;
    do
    {
      for (j = 0LL; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v60 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)((char *)&self->mText + 1) objectForKey:*(void *)(*((void *)&v59 + 1) + 8 * (void)j)];
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        id v14 = [v13 countByEnumeratingWithState:&v55 objects:v71 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v56;
          do
          {
            for (k = 0LL; k != v15; k = (char *)k + 1)
            {
              if (*(void *)v56 != v16) {
                objc_enumerationMutation(v13);
              }
              objc_msgSend( objc_msgSend(v13, "objectForKey:", *(void *)(*((void *)&v55 + 1) + 8 * (void)k)),  "removingFromCollection");
            }

            id v15 = [v13 countByEnumeratingWithState:&v55 objects:v71 count:16];
          }

          while (v15);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v59 objects:v72 count:16];
    }

    while (v10);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  v18 = *(NSMutableDictionary **)((char *)&self->mChapterDates + 1);
  id v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v70, 16, 233);
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v52;
    do
    {
      for (m = 0LL; m != v20; m = (char *)m + 1)
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)((char *)&self->mChapterDates + 1) objectForKey:*(void *)(*((void *)&v51 + 1) + 8 * (void)m)];
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        id v24 = [v23 countByEnumeratingWithState:&v47 objects:v69 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v48;
          do
          {
            for (n = 0LL; n != v25; n = (char *)n + 1)
            {
              if (*(void *)v48 != v26) {
                objc_enumerationMutation(v23);
              }
              objc_msgSend( objc_msgSend(v23, "objectForKey:", *(void *)(*((void *)&v47 + 1) + 8 * (void)n)),  "removingFromCollection");
            }

            id v25 = [v23 countByEnumeratingWithState:&v47 objects:v69 count:16];
          }

          while (v25);
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v51 objects:v70 count:16];
    }

    while (v20);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v28 = *(NSMutableArray **)((char *)&self->mIndicies + 1);
  id v29 = [v28 countByEnumeratingWithState:&v43 objects:v68 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v44;
    do
    {
      for (ii = 0LL; ii != v30; ii = (char *)ii + 1)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend( objc_msgSend( *(id *)((char *)&self->mIndicies + 1),  "objectForKey:",  *(void *)(*((void *)&v43 + 1) + 8 * (void)ii)),  "cleanup");
      }

      id v30 = [v28 countByEnumeratingWithState:&v43 objects:v68 count:16];
    }

    while (v30);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  v33 = *(NSMutableDictionary **)((char *)&self->mBreakInformation + 1);
  id v34 = [v33 countByEnumeratingWithState:&v39 objects:v67 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v40;
    do
    {
      for (jj = 0LL; jj != v35; jj = (char *)jj + 1)
      {
        if (*(void *)v40 != v36) {
          objc_enumerationMutation(v33);
        }
        objc_msgSend( objc_msgSend( *(id *)((char *)&self->mBreakInformation + 1),  "objectForKey:",  *(void *)(*((void *)&v39 + 1) + 8 * (void)jj)),  "cleanup");
      }

      id v35 = [v33 countByEnumeratingWithState:&v39 objects:v67 count:16];
    }

    while (v35);
  }

  *(NSMutableDictionary **)((char *)&self->mBreakInformation + 1) = 0LL;
  [*(id *)&self->mIsRotating cleanup];

  *(void *)&self->mIsRotating = 0LL;
  [*(id *)((char *)&self->mTextBackground + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mTextBackground + 1) = 0LL;
  [*(id *)((char *)&self->mQuoteOpen + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mQuoteOpen + 1) = 0LL;
  [*(id *)((char *)&self->mQuoteClose + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mQuoteClose + 1) = 0LL;
  [*(id *)((char *)&self->mQuoteBox + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mQuoteBox + 1) = 0LL;
  [*(id *)((char *)&self->mWeatherWindowMask + 1) cleanup];

  *(MRImageProvider **)((char *)&self->mWeatherWindowMask + 1) = 0LL;
  *(NSDictionary **)((char *)&self->mJournal + 1) = 0LL;

  *(void *)(&self->super._isInInteractiveMode + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mLengths + 1) = 0LL;

  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mChapters + 1) = 0LL;

  *(Class *)((char *)&self->super.super.isa + v38) = 0LL;
  *(NSMutableDictionary **)((char *)&self->mChapterNumDate + 1) = 0LL;

  *(MRImage **)((char *)&self->mGrayImage + 1) = 0LL;
  *(NSMutableArray **)((char *)&self->mIndicies + 1) = 0LL;

  *(NSMutableDictionary **)((char *)&self->mWeatherImages + 1) = 0LL;
  *(NSMutableDictionary **)((char *)&self->mChapterDates + 1) = 0LL;

  *(NSMutableArray **)((char *)&self->mChapterDurations + 1) = 0LL;
  *(NSMutableDictionary **)((char *)&self->mDayImages + 1) = 0LL;

  *(NSMutableDictionary **)((char *)&self->mMovieProviders + 1) = 0LL;
  BYTE1(self->mSlideInformation) = 0;
}

- (void)setPixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_mPixelSize = &self->super.mPixelSize;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v25.receiver = self;
    v25.super_class = (Class)&OBJC_CLASS___MREffectDateline;
    -[MREffect setPixelSize:](&v25, "setPixelSize:", a3.width, a3.height);
    objc_msgSend(*(id *)&self->mIsRotating, "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mTextBackground + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mQuoteOpen + 1), "setDefaultSize:", width, height);
    objc_msgSend(*(id *)((char *)&self->mQuoteClose + 1), "setDefaultSize:", width, height);
    objc_msgSend( *(id *)((char *)&self->mQuoteBox + 1),  "setDefaultSize:",  p_mPixelSize->width * 0.3,  p_mPixelSize->width * 0.3);
    objc_msgSend( *(id *)((char *)&self->mWeatherWindowMask + 1),  "setDefaultSize:",  p_mPixelSize->width * 0.3,  p_mPixelSize->width * 0.3);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v8 = objc_msgSend(*(id *)((char *)&self->mBreakInformation + 1), "allValues", 0);
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      double v12 = width / height;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          if (v12 < 1.0)
          {
            double v15 = p_mPixelSize->width * 0.800000012;
            [*(id *)(*((void *)&v21 + 1) + 8 * (void)i) imageAspectRatio];
            if (v16 > 1.33333333) {
              double v16 = 1.33333333;
            }
            goto LABEL_16;
          }

          [*(id *)(*((void *)&v21 + 1) + 8 * (void)i) imageAspectRatio];
          if (v17 < 0.5)
          {
            double v15 = p_mPixelSize->width * 0.75;
            [v14 imageAspectRatio];
LABEL_16:
            double v18 = v15 / v16;
            goto LABEL_20;
          }

          double v19 = p_mPixelSize->height * 0.800000012;
          [v14 imageAspectRatio];
          if (v12 < v20) {
            double v20 = v12;
          }
          double v15 = v19 * v20;
          double v18 = p_mPixelSize->height * 0.800000012;
LABEL_20:
          objc_msgSend(v14, "setDefaultSize:", v15, v18);
        }

        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v10);
    }
  }

+ (BOOL)hasCustomTiming
{
  return 1;
}

+ (id)customTimingWithEffectID:(id)a3 effectAttributes:(id)a4 slideInformation:(id)a5 textInformation:(id)a6 inAspectRatio:(double)a7
{
  id v10 = -[MREffectDateline initWithEffectID:](objc_alloc(&OBJC_CLASS___MREffectDateline), "initWithEffectID:", a3);
  -[MREffectDateline setAttributes:](v10, "setAttributes:", a4);
  id v11 = [a4 objectForKey:@"journal"];
  -[MREffectDateline _calculateDurations:slideInformation:aspectRatio:]( v10,  "_calculateDurations:slideInformation:aspectRatio:",  v11,  a5,  a7);
  -[MREffectDateline _updateIndiciesWithAttributes:](v10, "_updateIndiciesWithAttributes:", v11);
  -[MREffectDateline _calculateMainDurationWithAttributes:](v10, "_calculateMainDurationWithAttributes:", v11);
  -[MREffect setPhaseInDuration:mainDuration:phaseOutDuration:]( v10,  "setPhaseInDuration:mainDuration:phaseOutDuration:",  3.0,  v12 + -3.0 + -1.0,  1.0);
  return v10;
}

+ (id)localizedDateStringForMainTitle:(id)a3 latest:(id)a4
{
  if (!a3)
  {
    id v5 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
    return 0LL;
  }

  [a3 doubleValue];
  id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
  if (!a4) {
    return 0LL;
  }
LABEL_3:
  [a4 doubleValue];
  uint64_t v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
  v7 = 0LL;
  if (v5)
  {
    id v8 = v6;
    if (v6)
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      id v10 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
      id v11 = +[NSDateFormatter dateFormatFromTemplate:options:locale:]( NSDateFormatter,  "dateFormatFromTemplate:options:locale:",  [v10 localizedString:@"shortMonthTemplate" forEffectID:@"Dateline"],  0,  +[NSLocale currentLocale](NSLocale, "currentLocale"));
      double v12 = +[NSDateFormatter dateFormatFromTemplate:options:locale:]( NSDateFormatter,  "dateFormatFromTemplate:options:locale:",  [v10 localizedString:@"longMonthTemplate" forEffectID:@"Dateline"],  0,  +[NSLocale currentLocale](NSLocale, "currentLocale"));
      id v13 = +[NSDateFormatter dateFormatFromTemplate:options:locale:]( NSDateFormatter,  "dateFormatFromTemplate:options:locale:",  [v10 localizedString:@"yearTemplate" forEffectID:@"Dateline"],  0,  +[NSLocale currentLocale](NSLocale, "currentLocale"));
      -[NSDateFormatter setLocale:]( v9,  "setLocale:",  +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
      -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", @"y");
      id v14 = -[NSString integerValue](-[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v5), "integerValue");
      id v15 = -[NSString integerValue](-[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v8), "integerValue");
      -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", v11);
      id v16 = -[NSString integerValue](-[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v5), "integerValue");
      id v17 = -[NSString integerValue](-[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v8), "integerValue");
      -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", v13);
      if (v14 == v15 && v16 == v17)
      {
        double v18 = -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v5);
LABEL_17:
        v7 = v18;

        return v7;
      }

      if (v14 == v15)
      {
        if (-[NSString characterAtIndex:](v13, "characterAtIndex:", 0LL) == 121
          || -[NSString hasPrefix:](v13, "hasPrefix:", @"Gy"))
        {
          double v19 = -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v5);
          -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", v12);
          double v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - %@",  v19,  -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v8));
          goto LABEL_17;
        }

        double v20 = -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v8);
        -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", v12);
      }

      else
      {
        double v20 = -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v8);
      }

      double v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - %@",  -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v5),  v20);
      goto LABEL_17;
    }
  }

  return v7;
}

+ (id)localizedStringsDictByDate:(id)a3 useHours:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (a3)
  {
    [a3 doubleValue];
    v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
    id v8 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    id v9 = v8;
    if (v4) {
      id v10 = @"dd";
    }
    else {
      id v10 = @"EEE";
    }
    -[NSDateFormatter setDateFormat:](v8, "setDateFormat:", v10);
    id v11 = -[NSString uppercaseString](-[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v7), "uppercaseString");
    if (v11) {
      [v6 setObject:v11 forKey:@"Weekday"];
    }
    -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", @"MMM");
    double v12 = -[NSString uppercaseString](-[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v7), "uppercaseString");
    if (v12) {
      [v6 setObject:v12 forKey:@"shortMonth"];
    }
    if (v4)
    {
      if (+[MREffectDateline _timeIs24HourFormat](&OBJC_CLASS___MREffectDateline, "_timeIs24HourFormat"))
      {
        -[NSDateFormatter setDateFormat:]( v9,  "setDateFormat:",  +[NSDateFormatter dateFormatFromTemplate:options:locale:]( &OBJC_CLASS___NSDateFormatter,  "dateFormatFromTemplate:options:locale:",  @"HH:m",  0LL,  +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale")));
        id v13 = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
        id v14 = -[NSCalendar components:fromDate:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "components:fromDate:",  126LL,  v7);
        -[NSDateComponents setMinute:](v14, "setMinute:", 0LL);
        id v15 = -[NSDateFormatter stringFromDate:]( v9,  "stringFromDate:",  -[NSCalendar dateFromComponents:](v13, "dateFromComponents:", v14));
      }

      else
      {
        -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", @"h");
        id v16 = -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v7);
        -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", @"aaa");
        id v17 = -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v7);
        if (!v16 || !v17) {
          goto LABEL_18;
        }
        id v15 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v16,  @"hourIn12H",  v17,  @"ampm",  0LL);
      }
    }

    else
    {
      -[NSDateFormatter setDateFormat:]( v9,  "setDateFormat:",  +[NSDateFormatter dateFormatFromTemplate:options:locale:]( &OBJC_CLASS___NSDateFormatter,  "dateFormatFromTemplate:options:locale:",  @"dd",  0LL,  +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale")));
      id v15 = -[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v7);
      if (!v15) {
        goto LABEL_18;
      }
    }

    [v6 setObject:v15 forKey:@"day"];
LABEL_18:
  }

  return v6;
}

+ (BOOL)_timeIs24HourFormat
{
  objc_super v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setLocale:](v2, "setLocale:", +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  -[NSDateFormatter setDateStyle:](v2, "setDateStyle:", 0LL);
  -[NSDateFormatter setTimeStyle:](v2, "setTimeStyle:", 1LL);
  v3 = -[NSDateFormatter stringFromDate:](v2, "stringFromDate:", +[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v4 = -[NSString rangeOfString:](v3, "rangeOfString:", -[NSDateFormatter AMSymbol](v2, "AMSymbol"));
  id v5 = -[NSString rangeOfString:](v3, "rangeOfString:", -[NSDateFormatter PMSymbol](v2, "PMSymbol"));
  BOOL v7 = v4 == (id)0x7FFFFFFFFFFFFFFFLL && v5 == (id)0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (void)_updateIndiciesWithAttributes:(id)a3
{
  id v5 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  if (v5)
  {

    *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  }

  id v6 = (NSMutableDictionary *)a3;
  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = v6;
  BOOL v7 = *(NSMutableArray **)((char *)&self->mChapterDurations + 1);
  if (v7)
  {

    *(NSMutableArray **)((char *)&self->mChapterDurations + 1) = 0LL;
    id v6 = *(NSMutableDictionary **)((char *)&self->mSprites + 1);
  }

  *(NSMutableArray **)((char *)&self->mChapterDurations + 1) = (NSMutableArray *) -[NSMutableDictionary objectForKey:]( v6,  "objectForKey:",  @"chapters");
  id v8 = [*(id *)((char *)&self->mSprites + 1) objectForKey:@"chapters"];
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v8;
  id v22 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v29;
    __int128 v21 = self;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v9;
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        id v11 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        id v12 = [v10 objectForKey:@"items"];
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
              if (objc_msgSend( objc_msgSend(v17, "objectForKey:", @"type"),  "isEqualToString:",  @"photo")) {
                uint64_t v18 = (uint64_t)objc_msgSend(objc_msgSend(v17, "objectForKey:", @"photoIndex"), "integerValue");
              }
              else {
                uint64_t v18 = -1LL;
              }
              objc_msgSend( v11,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
            }

            id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v14);
        }

        [*(id *)((char *)&v21->mChapterNumDate + 1) addObject:v11];
        uint64_t v9 = v23 + 1;
      }

      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v22);
  }

- (double)_calculateMainDurationWithAttributes:(id)a3
{
  id v4 = [a3 objectForKey:@"mainTitle"];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = *(NSMutableArray **)((char *)&self->mLengths + 1);
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 0.0;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) doubleValue];
        double v9 = v9 + v11;
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  else
  {
    double v9 = 0.0;
  }

  double result = v9 + 6.0;
  if (!v4) {
    return v9;
  }
  return result;
}

- (double)showTimeForSlideAtIndex:(unint64_t)a3
{
  uint64_t v13 = -1LL;
  uint64_t v14 = -1LL;
  id v4 = -[MREffectDateline _chapterRangeForSlide:startIndex:endIndex:]( self,  "_chapterRangeForSlide:startIndex:endIndex:",  a3,  &v14,  &v13);
  if (v4)
  {
    -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v4);
    double v6 = v5;
  }

  else
  {
    double v6 = 0.0;
  }

  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL && v14 >= 8)
  {
    id v7 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mChapterDurations + 1), "objectAtIndex:", v4),  "objectForKey:",  @"title");
    double v8 = 9.0;
    if (!v7) {
      double v8 = 4.0;
    }
    double v9 = v6 + v8;
    -[MREffectDateline _startTimeForSlideIndex:inChapter:](self, "_startTimeForSlideIndex:inChapter:", v14 - 2, v4);
    double v11 = v10 + v9;
    if (v4) {
      return v11;
    }
    else {
      return v11 + 6.0;
    }
  }

  return v6;
}

- (double)showDurationForSlideAtIndex:(unint64_t)a3
{
  uint64_t v22 = -1LL;
  uint64_t v23 = -1LL;
  id v4 = -[MREffectDateline _chapterRangeForSlide:startIndex:endIndex:]( self,  "_chapterRangeForSlide:startIndex:endIndex:",  a3,  &v23,  &v22);
  double result = 0.0;
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v4;
    id v8 = v5;
    if (v4)
    {
      -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v4, 0.0);
      double v10 = v9;
    }

    else
    {
      double v10 = 0.0;
    }

    if (v23 >= 8)
    {
      id v11 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mChapterDurations + 1), "objectAtIndex:", v7),  "objectForKey:",  @"title");
      double v12 = 9.0;
      if (!v11) {
        double v12 = 4.0;
      }
      double v13 = v10 + v12;
      -[MREffectDateline _startTimeForSlideIndex:inChapter:](self, "_startTimeForSlideIndex:inChapter:", v23 - 2, v7);
      double v15 = v14 + v13;
      if (v7) {
        double v10 = v15;
      }
      else {
        double v10 = v15 + 6.0;
      }
    }

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = v7;
      __int128 v16 = &v23;
    }

    else
    {
      __int128 v16 = &v22;
    }

    -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v8);
    double v18 = v17;
    if (objc_msgSend( objc_msgSend(*(id *)((char *)&self->mChapterDurations + 1), "objectAtIndex:", v8),  "objectForKey:",  @"title"))
    {
      double v19 = 9.0;
    }

    else
    {
      double v19 = 4.0;
    }

    -[MREffectDateline _startTimeForSlideIndex:inChapter:](self, "_startTimeForSlideIndex:inChapter:", *v16 + 3, v8);
    double v21 = v18 + v19 + v20;
    if (!v7) {
      double v21 = v21 + 6.0;
    }
    return v21 - v10;
  }

  return result;
}

- (double)lowestDisplayTime
{
  return 0.0;
}

- (double)displayTimeForSlideAtIndex:(unint64_t)a3
{
  uint64_t v25 = -1LL;
  uint64_t v26 = -1LL;
  id v5 = -[MREffectDateline _chapterRangeForSlide:startIndex:endIndex:]( self,  "_chapterRangeForSlide:startIndex:endIndex:",  a3,  &v26,  &v25);
  double result = 2.0;
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = v5;
    -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v5, 2.0);
    double v9 = v8;
    id v10 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mChapterDurations + 1), "objectAtIndex:", v7),  "objectForKey:",  @"title");
    double v11 = 9.0;
    if (!v10) {
      double v11 = 4.0;
    }
    double v12 = v9 + v11;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    double v13 = *(NSMutableDictionary **)((char *)&self->mChapterNumDate + 1);
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = objc_msgSend( *(id *)(*((void *)&v21 + 1) + 8 * (void)i),  "indexOfObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
          if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v19 = v18;
            goto LABEL_14;
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v19 = 0LL;
LABEL_14:
    -[MREffectDateline _startTimeForSlideIndex:inChapter:](self, "_startTimeForSlideIndex:inChapter:", v19, v7);
    return v12 + v20 + 2.0;
  }

  return result;
}

- (double)displayTimeForTextAtIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isLoadedForTime:(double)a3
{
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v5 = [*(id *)((char *)&self->mIndicies + 1) objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    int v9 = 1;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        v9 &= [*(id *)(*((void *)&v29 + 1) + 8 * (void)i) isLoaded];
      }

      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v7);
  }

  else
  {
    LOBYTE(v9) = 1;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v11 = objc_msgSend(*(id *)((char *)&self->mBreakInformation + 1), "allValues", 0);
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
        [v16 showTime];
        if (v17 <= a3)
        {
          [v16 showTime];
          double v19 = v18;
          [v16 showDuration];
          if (v19 + v20 > a3)
          {
            if ((v9 & 1) == 0)
            {
              LOBYTE(v9) = 0;
              continue;
            }

- (void)setAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MREffectDateline;
  -[MREffect setAttributes:](&v7, "setAttributes:");
  mFlattenedAttributes = self->super.mFlattenedAttributes;
  if (mFlattenedAttributes != a3)
  {
    id v6 = *(NSMutableDictionary **)((char *)&self->mDayImages + 1);
    if (v6)
    {

      *(NSMutableDictionary **)((char *)&self->mDayImages + 1) = 0LL;
      mFlattenedAttributes = self->super.mFlattenedAttributes;
    }

    *(NSMutableDictionary **)((char *)&self->mDayImages + 1) = (NSMutableDictionary *) -[NSDictionary objectForKey:]( mFlattenedAttributes,  "objectForKey:",  @"breakInformation");
  }

- (void)_updateSlideProviders:(double)a3 context:(id)a4 renderArguments:(id)a5
{
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  id obj = -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs");
  id v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v90,  v94,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v91;
    id v10 = &OBJC_IVAR___MPFilter__internal;
    double v82 = 1.33333337;
    id v84 = a4;
    uint64_t v83 = *(void *)v91;
    do
    {
      id v11 = 0LL;
      id v85 = v8;
      do
      {
        if (*(void *)v91 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)v11);
        id v13 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs",  *(void *)&v82),  "objectForKey:",  v12);
        v88 = v12;
        v89 = NSIntegerFromString(v12, 5uLL);
        id v14 = -[MREffectDateline _chapterRangeForSlide:startIndex:endIndex:]( self,  "_chapterRangeForSlide:startIndex:endIndex:");
        if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          [v13 setShowTime:0.0];
          [v13 setShowDuration:0.0];
          goto LABEL_65;
        }

        id v16 = v14;
        unint64_t v17 = v15;
        if (v14)
        {
          -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v14);
          double v19 = v18;
        }

        else
        {
          double v19 = 0.0;
        }

        double v20 = v19 + -2.0;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v21 = (unint64_t)v16;
        }
        else {
          unint64_t v21 = v17;
        }
        -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v21);
        double v23 = v22;
        uint64_t v24 = v10[799];
        id v25 = [*(id *)((char *)&self->super.super.isa + v24) objectAtIndex:v21];
        id v26 = [v25 objectForKey:@"title"];
        v87 = v25;
        id v27 = objc_msgSend(objc_msgSend(v25, "objectForKey:", @"items"), "count");
        __int128 v28 = (char *)[*(id *)((char *)&self->super.super.isa + v24) count];
        if (v20 < 0.0) {
          double v20 = 0.0;
        }
        if (v26) {
          double v29 = 9.0;
        }
        else {
          double v29 = 4.0;
        }
        if ((uint64_t)v27 - 3 > -1 || v21 >= (unint64_t)(v28 - 1))
        {
          id v34 = v89;
          if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
            id v31 = v16;
          }
          else {
            id v31 = (id)v17;
          }
          -[MREffectDateline _startTimeForSlideIndex:inChapter:](self, "_startTimeForSlideIndex:inChapter:", 2LL, v31);
          double v32 = v23 + v29 + v35;
          v33 = v84;
          uint64_t v9 = v83;
          id v10 = &OBJC_IVAR___MPFilter__internal;
        }

        else
        {
          -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v21 + 1);
          v33 = v84;
          uint64_t v9 = v83;
          id v10 = &OBJC_IVAR___MPFilter__internal;
          id v34 = v89;
        }

        if (v16) {
          double v36 = v32;
        }
        else {
          double v36 = v32 + 6.0;
        }
        -[MREffectDateline _movieDurationForSlideAtIndex:](self, "_movieDurationForSlideAtIndex:", v34);
        if (v37 == 0.0)
        {
          [v13 setShowTime:v20];
          [v13 setShowDuration:v36 - v20];
        }

        else
        {
          uint64_t v38 = -[MRSlideProvider initWithEffectLayer:]( objc_alloc(&OBJC_CLASS___MRSlideProvider),  "initWithEffectLayer:",  self->super.mEffectLayer);
          [v13 defaultSize];
          -[MRSlideProvider setDefaultSize:](v38, "setDefaultSize:");
          -[MRSlideProvider setSlide:](v38, "setSlide:", [v13 slide]);
          -[MREffectDateline _startTimeForSlideIndex:inChapter:](self, "_startTimeForSlideIndex:inChapter:", -1LL, v16);
          double v40 = v39;
          -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v16);
          double v42 = v41;
          if ([v87 objectForKey:@"title"]) {
            double v43 = 9.0;
          }
          else {
            double v43 = 4.0;
          }
          [v13 setShowTime:v40 + v42 + v43];
          [v13 slideDuration];
          objc_msgSend(v13, "setShowDuration:");
          -[MRSlideProvider setShowTime:](v38, "setShowTime:", v20);
          -[MRSlideProvider setShowDuration:](v38, "setShowDuration:", v36 - v20);
          -[MRSlideProvider setIsStill:](v38, "setIsStill:", 1LL);
          [*(id *)((char *)&self->mBreakInformation + 1) setObject:v38 forKey:v88];
        }

        [v13 setWantsMipmap:1];
        [v13 setImageSizeScript:0];
        if (!BYTE3(self->mSlideInformation))
        {
          [v33 localAspectRatio];
          if (v47 >= 1.0)
          {
            [v13 imageAspectRatio];
            double v61 = v60;
            [v33 localAspectRatio];
            float v63 = 1.8 / v62;
            if (v61 >= 0.5)
            {
              double v68 = v63;
              [v13 imageAspectRatio];
              double v70 = v69;
              [v33 localAspectRatio];
              double v72 = v71;
              if (v70 < v72) {
                double v72 = v70;
              }
              double v59 = v72 * v68;
            }

            else
            {
              double v59 = (float)(v63 * 0.75);
            }

            double v49 = 1.79999995;
          }

          else
          {
            [v33 localAspectRatio];
            double v49 = (float)((float)(v48 * 1.8) / 1.3333);
            [v13 imageAspectRatio];
            double v51 = v50;
            [v33 localAspectRatio];
            BOOL v53 = v51 < 0.5;
            double v54 = v49 / v52;
            if (v53)
            {
              double v67 = 0.75;
            }

            else
            {
              [v13 imageAspectRatio];
              if (v67 > v82) {
                double v67 = v82;
              }
            }

            double v59 = v54 * v67;
          }

          goto LABEL_59;
        }

        [v13 imageAspectRatio];
        if (v44 >= 0.5)
        {
          [v13 imageAspectRatio];
          double v56 = v55;
          [v33 localAspectRatio];
          float v58 = v57;
          if (v56 <= 2.0)
          {
            [v13 imageAspectRatio];
            if (v64 <= v58) {
              double v64 = v58;
            }
            double v59 = 1.96000004;
            double v65 = 1.96000004 / v64;
            [v33 localAspectRatio];
            double v49 = v65 * v66;
            goto LABEL_59;
          }

          float v46 = v57 * 1.47;
        }

        else
        {
          [v33 localAspectRatio];
          float v46 = v45 * 2.6133;
        }

        double v49 = v46;
        double v59 = 1.96000004;
LABEL_59:
        unsigned int v73 = [v13 canPlay];
        [v13 imageAspectRatio];
        double v75 = v74;
        if (v73)
        {
          [v13 imageAspectRatio];
          double v77 = v76;
          [v33 localAspectRatio];
          double v79 = v78;
          if (v75 >= 1.0) {
            double v49 = v59 / v77 * v79;
          }
          else {
            double v59 = v49 * v77 / v79;
          }
        }

        else
        {
          -[MREffectDateline _sizeForBreakAspectRatio:size:inContext:]( self,  "_sizeForBreakAspectRatio:size:inContext:",  v33,  v74,  v59,  v49);
          double v59 = v80;
          double v49 = v81;
        }

        id v8 = v85;
        objc_msgSend( v13,  "setDefaultSize:",  v59 * 0.5 * self->super.mPixelSize.width,  v49 * 0.5 * self->super.mPixelSize.height);
LABEL_65:
        id v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v90,  v94,  16LL);
    }

    while (v8);
  }

- (CGSize)_sizeForBreakAspectRatio:(double)a3 size:(CGSize)a4 inContext:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  if (a3 < 0.5 || a3 > 2.0)
  {
    double v10 = self->super.mPixelSize.width * 0.5;
    double v11 = (double)(int)[a5 maxTextureSize];
    if (a3 <= 1.0)
    {
      double v14 = width * v10 / a3;
      if (v14 > v11)
      {
        double v15 = (double)(int)[a5 maxTextureSize] / v14;
        if (v15 < 0.5) {
          double v15 = 0.5;
        }
        double width = width * v15;
      }
    }

    else
    {
      double v12 = height * v10 * a3;
      if (v12 > v11)
      {
        double v13 = (double)(int)[a5 maxTextureSize] / v12;
        if (v13 < 0.5) {
          double v13 = 0.5;
        }
        double height = height * v13;
      }
    }
  }

  double v16 = width;
  double v17 = height;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (_NSRange)_chapterRangeForSlide:(int64_t)a3 startIndex:(int64_t *)a4 endIndex:(int64_t *)a5
{
  *a4 = -1LL;
  *a5 = -1LL;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = *(NSMutableDictionary **)((char *)&self->mChapterNumDate + 1);
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v21;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        id v13 = objc_msgSend( *(id *)(*((void *)&v20 + 1) + 8 * (void)i),  "indexOfObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
        if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          double v14 = a5;
          if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
            double v14 = a4;
          }
          else {
            uint64_t v10 = (uint64_t)i + v8;
          }
          if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v11 = (uint64_t)i + v8;
          }
          *double v14 = (int64_t)v13;
        }
      }

      v8 += (uint64_t)v7;
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v7);
  }

  else
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v15 = v11;
  NSUInteger v16 = v10;
  result.length = v16;
  result.location = v15;
  return result;
}

- (void)_calculateDurations:(id)a3 slideInformation:(id)a4 aspectRatio:(double)a5
{
  uint64_t v8 = *(NSMutableDictionary **)((char *)&self->mMovieProviders + 1);
  if (v8)
  {

    *(NSMutableDictionary **)((char *)&self->mMovieProviders + 1) = 0LL;
  }

  *(NSMutableDictionary **)((char *)&self->mMovieProviders + 1) = (NSMutableDictionary *)objc_msgSend(a4, "copy", a5);
  id v9 = [a3 objectForKey:@"chapters"];
  uint64_t v10 = (char *)[v9 count];
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v9;
  id v34 = [v9 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v34)
  {
    uint64_t v11 = 0LL;
    double v32 = v10 - 1;
    uint64_t v33 = *(void *)v42;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        uint64_t v36 = v11;
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v12;
        id v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
        if ([v13 objectForKey:@"title"]) {
          double v14 = 9.0;
        }
        else {
          double v14 = 4.0;
        }
        id v15 = [v13 objectForKey:@"items"];
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        id v16 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v38;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v38 != v18) {
                objc_enumerationMutation(v15);
              }
              __int128 v20 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
              objc_msgSend( v20,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14),  @"startTime");
              id v21 = [v20 objectForKey:@"type"];
              if ([v21 isEqualToString:@"photo"])
              {
                id v22 = objc_msgSend(objc_msgSend(v20, "objectForKey:", @"photoIndex"), "integerValue");
                if (a4)
                {
                  id v23 = [a4 count];
                  LODWORD(v24) = -1.0;
                  if (v22 < v23) {
                    objc_msgSend( objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v22, v24), "objectForKey:", @"aspectRatio"),  "floatValue");
                  }
                  double v25 = *(float *)&v24;
                }

                else
                {
                  -[MREffectDateline _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", v22);
                  double v25 = v26;
                }

                if (-[MREffectDateline _isMovieForSlideAtIndex:](self, "_isMovieForSlideAtIndex:", v22))
                {
                  -[MREffectDateline _movieDurationForSlideAtIndex:](self, "_movieDurationForSlideAtIndex:", v22);
                  double v14 = v14 + v27;
                }

                else if (v25 >= 0.5 && v25 <= 2.0)
                {
                  double v14 = v14 + 4.0;
                }

                else
                {
                  if (v25 >= 1.0) {
                    double v29 = v25 / 1.33333337;
                  }
                  else {
                    double v29 = 0.75 / v25;
                  }
                  double v14 = v14 + v29 * 4.0;
                }
              }

              else if ([v21 isEqualToString:@"text"])
              {
                double v14 = v14 + 4.0;
              }
            }

            id v17 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }

          while (v17);
        }

        double v30 = v14 + 2.0;
        uint64_t v11 = v36 + 1;
        *(float *)&double v30 = v30;
        objc_msgSend( *(id *)((char *)&self->mLengths + 1),  "addObject:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30));
        uint64_t v12 = v35 + 1;
      }

      while ((id)(v35 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }

    while (v34);
  }

- (BOOL)_isMovieForSlideAtIndex:(int64_t)a3
{
  if (*(NSMutableDictionary **)((char *)&self->mMovieProviders + 1)) {
    return objc_msgSend( objc_msgSend( objc_msgSend(*(id *)((char *)&self->mMovieProviders + 1), "objectAtIndex:", a3),  "objectForKey:",  @"isMovie"),  "BOOLValue");
  }
  else {
    return objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( self->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(a3)),  "canPlay");
  }
}

- (double)_movieDurationForSlideAtIndex:(int64_t)a3
{
  if (*(NSMutableDictionary **)((char *)&self->mMovieProviders + 1)) {
    objc_msgSend( objc_msgSend( objc_msgSend(*(id *)((char *)&self->mMovieProviders + 1), "objectAtIndex:", a3),  "objectForKey:",  @"duration"),  "doubleValue");
  }
  else {
    objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(a3)),  "slideDuration");
  }
  return result;
}

- (double)_aspectRatioForSlideIndex:(int64_t)a3
{
  id v5 = *(NSMutableDictionary **)((char *)&self->mMovieProviders + 1);
  if (v5)
  {
    objc_msgSend( objc_msgSend(objc_msgSend(v5, "objectAtIndex:", a3), "objectForKey:", @"aspectRatio"),  "floatValue");
    return v6;
  }

  else
  {
    double v7 = -1.0;
    if (-[NSDictionary count]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "count") > a3)
    {
      id v8 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey(a3));
      if (v8)
      {
        [v8 imageAspectRatio];
        return result;
      }
    }
  }

  return v7;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v7 = self;
  if (!BYTE3(self->mSlideInformation)) {
    goto LABEL_4;
  }
  [a4 localAspectRatio];
  if (v8 < 0.6)
  {
    if (BYTE3(v7->mSlideInformation)) {
      goto LABEL_6;
    }
LABEL_4:
    [a4 localAspectRatio];
    if (v9 >= 0.6) {
      goto LABEL_6;
    }
  }

  BYTE1(v7->mSlideInformation) = 0;
LABEL_6:
  if (BYTE1(v7->mSlideInformation))
  {
    id v10 = a4;
    goto LABEL_144;
  }

  uint64_t v11 = *(NSMutableDictionary **)((char *)&v7->mSprites + 1);
  if (v11)
  {

    *(NSMutableDictionary **)((char *)&v7->mSprites + 1) = 0LL;
  }

  uint64_t v12 = (NSMutableDictionary *) -[NSDictionary objectForKey:]( v7->super.mFlattenedAttributes,  "objectForKey:",  @"journal");
  *(NSMutableDictionary **)((char *)&v7->mSprites + 1) = v12;
  id v13 = *(NSMutableArray **)((char *)&v7->mChapterDurations + 1);
  double v176 = a3;
  if (v13)
  {

    *(NSMutableArray **)((char *)&v7->mChapterDurations + 1) = 0LL;
    uint64_t v12 = *(NSMutableDictionary **)((char *)&v7->mSprites + 1);
  }

  *(NSMutableArray **)((char *)&v7->mChapterDurations + 1) = (NSMutableArray *) -[NSMutableDictionary objectForKey:]( v12,  "objectForKey:",  @"chapters");
  [a4 localAspectRatio];
  BYTE3(v7->mSlideInformation) = v14 < 0.6;
  uint64_t v15 = *(uint64_t *)((char *)&v7->mSprites + 1);
  [a4 localAspectRatio];
  -[MREffectDateline _calculateDurations:slideInformation:aspectRatio:]( v7,  "_calculateDurations:slideInformation:aspectRatio:",  v15,  0LL,  v16);
  [*(id *)((char *)&v7->mJournal + 1) removeAllObjects];
  [*(id *)((char *)&v7->mChapterNumDate + 1) removeAllObjects];
  [a4 localAspectRatio];
  float v18 = v17;
  __int128 v220 = 0u;
  __int128 v221 = 0u;
  __int128 v222 = 0u;
  __int128 v223 = 0u;
  id obj = *(NSMutableArray **)((char *)&v7->mChapterDurations + 1);
  v188 = v7;
  id v179 = [obj countByEnumeratingWithState:&v220 objects:v231 count:16];
  if (v179)
  {
    uint64_t v178 = *(void *)v221;
    do
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v221 != v178) {
          objc_enumerationMutation(obj);
        }
        uint64_t v180 = v19;
        __int128 v20 = *(void **)(*((void *)&v220 + 1) + 8 * v19);
        id v184 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        id v21 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
        id v22 = [v20 objectForKey:@"items"];
        __int128 v216 = 0u;
        __int128 v217 = 0u;
        __int128 v218 = 0u;
        __int128 v219 = 0u;
        id v182 = v22;
        id v23 = [v22 countByEnumeratingWithState:&v216 objects:v230 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v217;
          do
          {
            for (i = 0LL; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v217 != v25) {
                objc_enumerationMutation(v182);
              }
              double v27 = *(void **)(*((void *)&v216 + 1) + 8LL * (void)i);
              id v28 = [v27 objectForKey:@"type"];
              if ([v28 isEqualToString:@"photo"])
              {
                id v29 = objc_msgSend(objc_msgSend(v27, "objectForKey:", @"photoIndex"), "integerValue");
                id v30 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs]( v188->super.mEffectLayer,  "slideProvidersForElementIDs"),  "objectForKey:",  ImageKey((int64_t)v29));
                objc_msgSend( v184,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v29));
                if (BYTE3(v188->mSlideInformation))
                {
                  [v30 imageAspectRatio];
                  if (v31 >= 0.5)
                  {
                    [v30 imageAspectRatio];
                    double v44 = v43;
                    [a4 localAspectRatio];
                    float v46 = v45;
                    if (v44 <= 2.0)
                    {
                      [v30 imageAspectRatio];
                      if (v52 <= v46) {
                        double v52 = v46;
                      }
                      double v53 = 1.96000004 / v52;
                      [a4 localAspectRatio];
                      double v33 = v53 * v54;
                    }

                    else
                    {
                      double v33 = (float)(v45 * 1.47);
                    }

                    double v34 = 1.96000004;
                  }

                  else
                  {
                    [a4 localAspectRatio];
                    double v33 = (float)(v32 * 2.6133);
                    double v34 = 1.96000004;
                  }
                }

                else if (v18 >= 1.0)
                {
                  [v30 imageAspectRatio];
                  double v49 = v48;
                  [a4 localAspectRatio];
                  float v51 = 1.8 / v50;
                  if (v49 >= 0.5)
                  {
                    double v58 = v51;
                    [v30 imageAspectRatio];
                    double v60 = v59;
                    [a4 localAspectRatio];
                    double v62 = v61;
                    if (v60 < v62) {
                      double v62 = v60;
                    }
                    double v34 = v62 * v58;
                  }

                  else
                  {
                    double v34 = (float)(v51 * 0.75);
                  }

                  double v33 = 1.79999995;
                }

                else
                {
                  [a4 localAspectRatio];
                  double v33 = (float)((float)(v38 * 1.8) / 1.3333);
                  [v30 imageAspectRatio];
                  double v40 = v39;
                  [a4 localAspectRatio];
                  BOOL v161 = v40 < 0.5;
                  double v42 = v33 / v41;
                  if (v161)
                  {
                    double v55 = 0.75;
                  }

                  else
                  {
                    [v30 imageAspectRatio];
                    if (v55 > 1.33333337) {
                      double v55 = 1.33333337;
                    }
                  }

                  double v34 = v42 * v55;
                }

                if (BYTE3(v188->mSlideInformation)) {
                  double v34 = v33;
                }
              }

              else
              {
                objc_msgSend( v184,  "addObject:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -1));
                int v35 = BYTE3(v188->mSlideInformation);
                [a4 localAspectRatio];
                if (v35)
                {
                  double v37 = (float)(v36 * 1.47);
                  double v34 = 1.96000004;
                }

                else if (v18 >= 1.0)
                {
                  float v56 = 1.8 / v36;
                  [a4 localAspectRatio];
                  if (v57 > 1.0) {
                    float v57 = 1.0;
                  }
                  double v34 = (float)(v56 * v57);
                  double v37 = 1.79999995;
                }

                else
                {
                  double v37 = (float)((float)(v36 * 1.8) / 1.3333);
                  [a4 localAspectRatio];
                  double v34 = v37 / v47;
                }

                if (BYTE3(v188->mSlideInformation)) {
                  double v34 = v37;
                }
              }

              *(float *)&double v34 = v34;
              objc_msgSend( v21,  "addObject:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34));
            }

            id v24 = [v182 countByEnumeratingWithState:&v216 objects:v230 count:16];
          }

          while (v24);
        }

        double v7 = v188;
        if ([v21 count]) {
          [*(id *)((char *)&v188->mJournal + 1) addObject:v21];
        }
        [*(id *)((char *)&v188->mChapterNumDate + 1) addObject:v184];
        uint64_t v19 = v180 + 1;
      }

      while ((id)(v180 + 1) != v179);
      id v179 = [obj countByEnumeratingWithState:&v220 objects:v231 count:16];
    }

    while (v179);
  }

  if (BYTE2(v7->mSlideInformation))
  {
    __int128 v210 = 0u;
    __int128 v211 = 0u;
    __int128 v208 = 0u;
    __int128 v209 = 0u;
    id v185 = *(NSMutableArray **)((char *)&v7->mChapterDurations + 1);
    id v63 = [v185 countByEnumeratingWithState:&v208 objects:v228 count:16];
    if (v63)
    {
      id v64 = v63;
      uint64_t v65 = *(void *)v209;
      do
      {
        for (j = 0LL; j != v64; j = (char *)j + 1)
        {
          if (*(void *)v209 != v65) {
            objc_enumerationMutation(v185);
          }
          id v67 = [*(id *)(*((void *)&v208 + 1) + 8 * (void)j) objectForKey:@"weather"];
          if (v67)
          {
            id v68 = [v67 integerValue];
            id v69 = -[MREffectDateline _weatherStringForCondition:](v188, "_weatherStringForCondition:", v68);
            if (v69) {
              objc_msgSend( objc_msgSend(*(id *)((char *)&v188->mIndicies + 1), "objectForKey:", v69),  "setDefaultSize:",  v188->super.mPixelSize.width * 0.3,  v188->super.mPixelSize.width * 0.3);
            }
            int v70 = (_DWORD)v68 - 1;
            uint64_t v71 = 3LL;
            do
            {
              int v72 = v70 - 1;
              if (v70 < 1) {
                v70 += 18;
              }
              id v73 = -[MREffectDateline _weatherStringForCondition:](v188, "_weatherStringForCondition:", v70);
              if (![*(id *)((char *)&v188->mIndicies + 1) objectForKey:v73]) {
                objc_msgSend( objc_msgSend(*(id *)((char *)&v188->mIndicies + 1), "objectForKey:", v73),  "setDefaultSize:",  v188->super.mPixelSize.width * 0.3,  v188->super.mPixelSize.width * 0.3);
              }
              int v70 = v72;
              --v71;
            }

            while (v71);
          }
        }

        id v64 = [v185 countByEnumeratingWithState:&v208 objects:v228 count:16];
      }

      while (v64);
    }

    __int128 v206 = 0u;
    __int128 v207 = 0u;
    __int128 v204 = 0u;
    __int128 v205 = 0u;
    double v74 = -[NSDictionary allValues]( -[MRLayerEffect slideProvidersForElementIDs](v188->super.mEffectLayer, "slideProvidersForElementIDs"),  "allValues");
    id v75 = -[NSArray countByEnumeratingWithState:objects:count:]( v74,  "countByEnumeratingWithState:objects:count:",  &v204,  v227,  16LL);
    if (v75)
    {
      id v76 = v75;
      uint64_t v77 = *(void *)v205;
      do
      {
        for (k = 0LL; k != v76; k = (char *)k + 1)
        {
          if (*(void *)v205 != v77) {
            objc_enumerationMutation(v74);
          }
          double v79 = *(void **)(*((void *)&v204 + 1) + 8LL * (void)k);
          if (BYTE3(v188->mSlideInformation))
          {
            [*(id *)(*((void *)&v204 + 1) + 8 * (void)k) imageAspectRatio];
            if (v80 < 0.5)
            {
              [a4 localAspectRatio];
              float v82 = v81 * 2.6133;
              goto LABEL_96;
            }

            [v79 imageAspectRatio];
            double v91 = v90;
            [a4 localAspectRatio];
            float v93 = v92;
            if (v91 <= 2.0)
            {
              [v79 imageAspectRatio];
              if (v99 <= v93) {
                double v99 = v93;
              }
              double v100 = 1.96000004 / v99;
              [a4 localAspectRatio];
              double v85 = v100 * v101;
            }

            else
            {
              float v82 = v92 * 1.47;
LABEL_96:
              double v85 = v82;
            }

            double v98 = 1.96000004;
            goto LABEL_110;
          }

          [a4 localAspectRatio];
          if (v83 >= 1.0)
          {
            [v79 imageAspectRatio];
            double v95 = v94;
            [a4 localAspectRatio];
            float v97 = 1.8 / v96;
            if (v95 >= 0.5)
            {
              double v103 = v97;
              [v79 imageAspectRatio];
              double v105 = v104;
              [a4 localAspectRatio];
              double v107 = v106;
              if (v105 < v107) {
                double v107 = v105;
              }
              double v98 = v107 * v103;
            }

            else
            {
              double v98 = (float)(v97 * 0.75);
            }

            double v85 = 1.79999995;
          }

          else
          {
            [a4 localAspectRatio];
            double v85 = (float)((float)(v84 * 1.8) / 1.3333);
            [v79 imageAspectRatio];
            double v87 = v86;
            [a4 localAspectRatio];
            BOOL v161 = v87 < 0.5;
            double v89 = v85 / v88;
            if (v161)
            {
              double v102 = 0.75;
            }

            else
            {
              [v79 imageAspectRatio];
              if (v102 > 1.33333337) {
                double v102 = 1.33333337;
              }
            }

            double v98 = v89 * v102;
          }

- (id)_weatherStringForCondition:(unint64_t)a3
{
  if (a3 - 1 > 0x11) {
    return 0LL;
  }
  else {
    return off_258AA8[a3 - 1];
  }
}

- (double)_offsetForChapterIndex:(int64_t)a3 layoutIndex:(int64_t)a4 aspectRatio:(double)a5
{
  id v7 = objc_msgSend(*(id *)((char *)&self->mJournal + 1), "objectAtIndex:", a3, a5);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    int64_t v10 = 0LL;
    uint64_t v11 = *(void *)v28;
    double v12 = 0.0;
    int64_t v26 = a4;
LABEL_3:
    uint64_t v13 = 0LL;
    if (v10 <= a4) {
      int64_t v14 = a4;
    }
    else {
      int64_t v14 = v10;
    }
    int64_t v15 = v10 - v14;
    while (1)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(v7);
      }
      float v16 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
      if (!(v15 + v13)) {
        break;
      }
      int v17 = BYTE3(self->mSlideInformation);
      [*(id *)(*((void *)&v27 + 1) + 8 * v13) floatValue];
      double v19 = (float)(v18 + 0.05);
      if (v17) {
        double v19 = -v19;
      }
      double v12 = v12 + v19;
      if (v9 == (id)++v13)
      {
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
        v10 += v13;
        a4 = v26;
        if (v9) {
          goto LABEL_3;
        }
        float v16 = 0LL;
        break;
      }
    }
  }

  else
  {
    float v16 = 0LL;
    double v12 = 0.0;
  }

  int v20 = BYTE3(self->mSlideInformation);
  objc_msgSend(objc_msgSend(v7, "objectAtIndex:", 0), "floatValue");
  float v22 = v21;
  [v16 floatValue];
  double v24 = (float)((float)(v22 - v23) * 0.5);
  if (!v20) {
    double v24 = -v24;
  }
  return v12 + v24;
}

- (int64_t)_chapterIndexForTime:(double)a3
{
  if (a3 >= 6.0)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    float v6 = *(NSMutableArray **)((char *)&self->mLengths + 1);
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      int64_t v9 = 0LL;
      double v10 = a3 + -6.0;
      uint64_t v11 = *(void *)v18;
      double v12 = 0.0;
      while (2)
      {
        uint64_t v13 = 0LL;
        int64_t v5 = (int64_t)v8 + v9;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * (void)v13) floatValue];
          double v12 = v12 + v14;
          if (v10 < v12)
          {
            int64_t v5 = (int64_t)v13 + v9;
            goto LABEL_14;
          }

          uint64_t v13 = (char *)v13 + 1;
        }

        while (v8 != v13);
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        int64_t v9 = v5;
        if (v8) {
          continue;
        }
        break;
      }
    }

    else
    {
      int64_t v5 = 0LL;
    }
  }

  else
  {
    int64_t v5 = -1LL;
  }

- (double)_startTimeForChapter:(int64_t)a3
{
  double v3 = 6.0;
  if (a3)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    int64_t v5 = *(NSMutableArray **)((char *)&self->mLengths + 1);
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      int64_t v8 = 0LL;
      uint64_t v9 = *(void *)v16;
LABEL_4:
      uint64_t v10 = 0LL;
      if (v8 <= a3) {
        int64_t v11 = a3;
      }
      else {
        int64_t v11 = v8;
      }
      int64_t v12 = v8 - v11;
      while (1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        if (!(v12 + v10)) {
          break;
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v10) floatValue];
        double v3 = v3 + v13;
        if (v7 == (id)++v10)
        {
          id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          v8 += v10;
          if (v7) {
            goto LABEL_4;
          }
          return v3;
        }
      }
    }
  }

  return v3;
}

- (double)_startTimeForSlideIndex:(int64_t)a3 inChapter:(int64_t)a4
{
  id v6 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mChapterDurations + 1), "objectAtIndex:", a4),  "objectForKey:",  @"items");
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v7) {
    return 0.0;
  }
  id v8 = v7;
  int64_t v9 = 0LL;
  uint64_t v10 = *(void *)v27;
  double v11 = 0.0;
  int64_t v24 = a3;
LABEL_3:
  uint64_t v12 = 0LL;
  if (v9 <= a3) {
    int64_t v13 = a3;
  }
  else {
    int64_t v13 = v9;
  }
  int64_t v25 = v9;
  int64_t v14 = v9 - v13;
  while (1)
  {
    if (*(void *)v27 != v10) {
      objc_enumerationMutation(v6);
    }
    if (!(v14 + v12)) {
      return v11;
    }
    __int128 v15 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
    id v16 = [v15 objectForKey:@"type"];
    if ([v16 isEqualToString:@"photo"])
    {
      id v17 = objc_msgSend(objc_msgSend(v15, "objectForKey:", @"photoIndex"), "integerValue");
      -[MREffectDateline _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", v17);
      double v19 = v18;
      if (-[MREffectDateline _isMovieForSlideAtIndex:](self, "_isMovieForSlideAtIndex:", v17))
      {
        -[MREffectDateline _movieDurationForSlideAtIndex:](self, "_movieDurationForSlideAtIndex:", v17);
      }

      else
      {
        double v20 = 4.0;
        if (v19 < 0.5 || v19 > 2.0)
        {
          if (v19 >= 1.0) {
            double v22 = v19 / 1.33333337;
          }
          else {
            double v22 = 0.75 / v19;
          }
          double v20 = v22 * 4.0;
        }
      }
    }

    else if ([v16 isEqualToString:@"text"])
    {
      double v20 = 4.0;
    }

    else
    {
      double v20 = 0.0;
    }

    double v11 = v11 + v20;
    if (v8 == (id)++v12)
    {
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      a3 = v24;
      int64_t v9 = v25 + v12;
      if (v8) {
        goto LABEL_3;
      }
      return v11;
    }
  }

- (int64_t)_currentItemForChapter:(int64_t)a3 atTime:(double)a4 forDuration:(double *)a5 fromTime:(double *)a6
{
  id v8 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mChapterDurations + 1), "objectAtIndex:", a3),  "objectForKey:",  @"items");
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  int64_t result = (int64_t)[v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (result)
  {
    id v10 = (id)result;
    int64_t v11 = 0LL;
    uint64_t v12 = *(void *)v29;
    double v13 = 0.0;
    while (2)
    {
      int64_t v14 = 0LL;
      int64_t v24 = (int64_t)v10 + v11;
      int64_t v25 = v11;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v8);
        }
        __int128 v15 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v14);
        id v16 = [v15 objectForKey:@"type"];
        if ([v16 isEqualToString:@"photo"])
        {
          id v17 = objc_msgSend(objc_msgSend(v15, "objectForKey:", @"photoIndex"), "integerValue");
          -[MREffectDateline _aspectRatioForSlideIndex:](self, "_aspectRatioForSlideIndex:", v17);
          double v19 = v18;
          if (-[MREffectDateline _isMovieForSlideAtIndex:](self, "_isMovieForSlideAtIndex:", v17))
          {
            -[MREffectDateline _movieDurationForSlideAtIndex:](self, "_movieDurationForSlideAtIndex:", v17);
            double v21 = v20;
          }

          else
          {
            double v21 = 4.0;
            if (v19 < 0.5 || v19 > 2.0)
            {
              if (v19 >= 1.0) {
                double v23 = v19 / 1.33333337;
              }
              else {
                double v23 = 0.75 / v19;
              }
              double v21 = v23 * 4.0;
            }
          }
        }

        else if ([v16 isEqualToString:@"text"])
        {
          double v21 = 4.0;
        }

        else
        {
          double v21 = 0.0;
        }

        double v13 = v13 + v21;
        if (v13 > a4)
        {
          int64_t result = (int64_t)v14 + v25;
          goto LABEL_27;
        }

        int64_t v14 = (char *)v14 + 1;
      }

      while (v10 != v14);
      id v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      int64_t result = v24;
      int64_t v11 = v24;
      if (v10) {
        continue;
      }
      break;
    }
  }

  else
  {
    double v21 = 0.0;
    double v13 = 0.0;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v7 = a3;
  if (a3 < 0.5)
  {
    objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "shaderForShaderID:inContext:withArguments:",  @"WeatherWindow",  a4,  0);
    objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "shaderForShaderID:inContext:withArguments:",  @"DateWindowSingle",  a4,  0);
  }

  [a4 localAspectRatio];
  float v10 = v9;
  __int128 v467 = 0u;
  __int128 v468 = 0u;
  __int128 v469 = 0u;
  __int128 v470 = 0u;
  id v11 = [*(id *)(&self->super._isInInteractiveMode + 1) objectEnumerator];
  id v12 = [v11 countByEnumeratingWithState:&v467 objects:v477 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v468;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v468 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v467 + 1) + 8 * (void)i) setHitIsActive:0];
      }

      id v13 = [v11 countByEnumeratingWithState:&v467 objects:v477 count:16];
    }

    while (v13);
  }

  id v16 = (char *)[*(id *)((char *)&self->mChapterDurations + 1) count];
  int64_t v17 = -[MREffectDateline _chapterIndexForTime:](self, "_chapterIndexForTime:", v7);
  double v18 = v16 - 1;
  else {
    unint64_t v19 = v17;
  }
  double v459 = v7;
  float v446 = v10;
  if (v19 == -1LL)
  {
    id v46 = [*(id *)((char *)&self->mChapters + 1) objectForKey:@"mainTitle"];
    id v47 = [*(id *)((char *)&self->mChapters + 1) objectForKey:@"mainSubtitle"];
    objc_msgSend(v46, "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    double v49 = v48 * 3.5;
    double v51 = v50 * 3.5;
    objc_msgSend(v47, "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    double v461 = v49;
    double v54 = v49 * 0.5 + -1.0;
    double v455 = v51;
    double v447 = v52 * 3.5;
    double v55 = -0.5;
    double v443 = v53 * 3.5;
    if (v10 >= 1.0)
    {
      double v437 = v53 * 3.5 * -0.5;
      double v440 = v52 * 3.5 * 0.5 + -1.0;
      double v449 = v54;
      double v452 = v51 * 0.5;
      [a4 setShader:@"PlainTexture"];
      double v56 = 0.0;
      double v57 = 20.0;
    }

    else
    {
      double v449 = v54 + 0.5;
      double v452 = v51 * 0.5 + 0.400000006;
      double v437 = v53 * 3.5 * -0.5 + 0.400000006;
      double v440 = v52 * 3.5 * 0.5 + -1.0 + 0.5;
      [a4 setShader:@"PlainTexture"];
      if (BYTE3(self->mSlideInformation)) {
        double v55 = 0.5;
      }
      else {
        double v55 = -0.75;
      }
      double v56 = -1.5;
      double v57 = 15.0;
    }

    if (v7 >= 3.0)
    {
      if (v7 >= 5.0)
      {
        double v75 = v7 + -5.0;
        double v107 = datelineEaseInEaseOut(v7 + -5.0);
        if (v10 >= 1.0)
        {
          double v57 = v107 * -32.0 + 20.0;
          double v81 = v107 * 46.0 + -39.0;
          double v80 = v107 * 3.4000001 + -3.4000001;
          [a4 localAspectRatio];
          double v77 = -0.5 - flt_1FB720[v145 <= 1.5] * v107;
          [a4 localAspectRatio];
          double v110 = dbl_1FB850[v146 <= 1.5];
          double v111 = 0.0;
        }

        else
        {
          double v57 = v107 * -26.0 + 14.0;
          double v81 = v107 * 43.0 + -39.0;
          double v80 = v107 * 1.20000005 + -1.89999998;
          float v108 = 0.5;
          if (!BYTE3(self->mSlideInformation)) {
            float v108 = -0.75;
          }
          double v77 = v108 - (float)(v108 + -0.75) * v107;
          [a4 localAspectRatio];
          double v110 = (float)(-1.5 - (float)((float)((float)((float)(1.7778 / v109) + -1.0) * 0.6) + -0.2));
          double v111 = -1.5;
        }

        double v78 = v111 - v110 * v107;
        double obja = 1.0;
        goto LABEL_135;
      }

      double v82 = 0.5;
      double v83 = (v7 + -3.0) * 0.5;
      if (v10 >= 1.0)
      {
        double v57 = v83 * -0.0 + 20.0;
        double v80 = v83 * 0.0999999046 + -3.5;
        double v77 = v83 * -0.0 + -0.5;
        double v78 = v83 * -0.0 + 0.0;
      }

      else
      {
        double v57 = 15.0 - v83;
        double v80 = v83 * 0.100000024 + -2.0;
        if (!BYTE3(self->mSlideInformation)) {
          double v82 = -0.75;
        }
        double v77 = v82 + v83 * -0.0;
        double v78 = v83 * -0.0 + -1.5;
      }

      double v81 = v83 + -40.0;
      double v75 = 0.0;
      double obja = 1.0;
    }

    else
    {
      double v75 = 0.0;
      double obja = v7 / 3.0;
      double v76 = Spline1(v7 / 3.0, 0.0, 0.75, 0.25, 1.0, 0.0, 0.0, 1.0, 1.0);
      double v77 = v55 + (1.0 - v76) * flt_1FB748[v10 < 1.0];
      double v78 = v56 + (1.0 - v76) * flt_1FB750[v10 < 1.0];
      float v79 = -3.5;
      if (v10 < 1.0) {
        float v79 = -2.0;
      }
      double v80 = 1.5 - (1.5 - v79) * v76;
      double v81 = -40.0;
    }

    double v107 = 0.0;
LABEL_135:
    MRMatrix_Clear((uint64_t)v476);
    if (BYTE3(self->mSlideInformation))
    {
      double v81 = v81 * 0.699999988;
      double v80 = v80 * datelineEaseInEaseOut(1.0 - v75);
      double v78 = v78 + datelineEaseInEaseOut(v75) * -0.5;
      double v57 = 0.0;
    }

    float v147 = v57;
    float v148 = v81;
    MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v476, v147, v148, 0.0);
    float v149 = v78;
    float v150 = v77;
    float v151 = v80;
    *(float *)&double v152 = MRMatrix_Translate((float *)v476, v149, v150, v151);
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v476, v475, v152);
    MRMatrix_Clear((uint64_t)v474);
    float v153 = 20.0 - v57;
    float v154 = 48.0;
    if (v446 < 1.0) {
      float v154 = 25.0;
    }
    double v155 = v154;
    if (BYTE3(self->mSlideInformation))
    {
      float v153 = 5.0;
      double v155 = 25.0;
    }

    float v156 = v155 - v81;
    MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v474, v153, v156, 0.0);
    double v157 = 0.0;
    if (v459 < 2.0 && v446 < 1.0) {
      double v157 = (1.0 - datelineEaseInEaseOut(v459 * 0.5)) * 10.0;
    }
    float v158 = -3.8;
    if (v446 >= 1.0) {
      float v158 = 0.0;
    }
    if (BYTE3(self->mSlideInformation))
    {
      double v157 = v157 + 0.5;
      float v159 = -2.5;
    }

    else
    {
      float v159 = v158;
    }

    BOOL v160 = v446 >= 1.0 || v107 < 0.0;
    float v161 = v107 * 8.0 + 0.5 + v157;
    if (v160) {
      float v162 = 1.0;
    }
    else {
      float v162 = v161;
    }
    if (v446 >= 1.0)
    {
      float v164 = 1.3;
    }

    else
    {
      [a4 localAspectRatio];
      if (v163 >= 0.7) {
        float v164 = -2.5;
      }
      else {
        float v164 = -2.3;
      }
    }

    *(float *)&double v165 = MRMatrix_Translate((float *)v474, v159, v162, v164);
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v474, v473, v165);
    if (v107 > 0.0)
    {
      double v169 = 1.0 - v107;
      *(float *)&double v169 = 1.0 - v107;
      LODWORD(v168) = 1.0;
      LODWORD(v166) = LODWORD(v169);
      LODWORD(v167) = LODWORD(v169);
      [a4 setForeColorRed:v472 green:v169 blue:v166 alpha:v167 saveTo:v168];
    }

    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v47,  a4,  v440,  v437,  v447,  v443);
    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v46,  a4,  v449,  v452,  v461,  v455);
    if (v107 > 0.0) {
      [a4 restoreForeColor:v472];
    }
    [a4 restoreModelViewMatrix:v473];
    if (BYTE3(self->mSlideInformation))
    {
      MRMatrix_Clear((uint64_t)v474);
      float v170 = (1.0 - v75) * v81;
      *(float *)&double v171 = MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v474, 0.0, v170, 0.0);
      objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v474, 0, v171);
    }

    BOOL v172 = v75 > 0.5;
    double v173 = 1.0;
    double v174 = 0.0;
    double v175 = 0.0;
    double v176 = self;
    id v177 = a4;
    double v178 = v459;
    id v179 = a5;
    uint64_t v180 = 0LL;
    double v181 = obja;
    double v182 = v75;
    unint64_t v183 = 0LL;
    goto LABEL_176;
  }

  int64_t v20 = v17;
  id v21 = [*(id *)((char *)&self->mChapterDurations + 1) objectAtIndex:v19];
  -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v19);
  double v23 = v22;
  id v24 = [v21 objectForKey:@"title"];
  if (v24) {
    double v25 = 9.0;
  }
  else {
    double v25 = 4.0;
  }
  id v26 = objc_msgSend(*(id *)((char *)&self->mChapters + 1), "objectForKey:", NSStringWithInteger("chapter", v19));
  objc_msgSend(objc_msgSend(*(id *)((char *)&self->mLengths + 1), "objectAtIndex:", v19), "doubleValue");
  double v28 = v7 - v23;
  if (v7 - v23 < v25)
  {
    [a4 setShader:@"PlainTexture"];
    [a4 localAspectRatio];
    float v30 = v29;
    float v31 = 7.0;
    if (v10 < 1.0) {
      float v31 = 4.0;
    }
    double v32 = v31;
    float v33 = -0.7;
    if (v10 >= 1.0) {
      float v33 = 0.0;
    }
    double v34 = v33;
    if (v10 < 1.0)
    {
      double v35 = -1.0;
      double v36 = v25 + -1.0;
      if (v28 < v25 + -1.0)
      {
        double v37 = v28 / v36;
        double v451 = (float)((float)((float)((float)(1.7778 / v30) + -1.0) * 0.6) + -0.2);
        double v454 = fmin(v28, 1.0);
        double v38 = v28 / v36 + -12.0;
        if (v24) {
          double v35 = -3.0;
        }
        double v39 = v32 - v35 * v37;
        double v40 = v34 + v37 * -0.0;
        double v460 = v37 * 0.00999999046 + 0.75;
        [a4 localAspectRatio];
        float v42 = (float)((float)((float)(1.7778 / v41) + -1.0) * 0.6) + -0.2;
        [a4 localAspectRatio];
        double v44 = v454;
        double v45 = (float)(v42 - (float)((float)((float)((float)(1.7778 / v43) + -1.0) * 0.6) + -0.2));
        goto LABEL_78;
      }
    }

    else
    {
      [a4 localAspectRatio];
      double v36 = v25 + -1.0;
      if (v28 < v25 + -1.0)
      {
        if (v84 > 1.5) {
          double v85 = 0.2;
        }
        else {
          double v85 = 0.466666;
        }
        double v451 = v85;
        BOOL v61 = v30 > 1.5;
        float v86 = 0.3;
        if (v61) {
          float v87 = 0.3;
        }
        else {
          float v87 = 0.4;
        }
        double v462 = v87;
        double v37 = v28 / v36;
        double v456 = fmin(v28, 1.0);
        double v38 = v28 / v36 + -12.0;
        double v88 = -3.0;
        if (!v24) {
          double v88 = -1.0;
        }
        double v39 = v32 - v88 * v37;
        double v40 = v34 + v37 * -0.0;
        [a4 localAspectRatio];
        if (v89 <= 1.5) {
          float v86 = 0.4;
        }
        [a4 localAspectRatio];
        double v460 = v462 - (float)(v86 - flt_1FB6E8[v90 <= 1.5]) * v37;
        [a4 localAspectRatio];
        if (v91 > 1.5) {
          double v92 = 0.2;
        }
        else {
          double v92 = 0.466666;
        }
        [a4 localAspectRatio];
        if (v93 > 1.5) {
          double v94 = 0.2;
        }
        else {
          double v94 = 0.466666;
        }
        double v44 = v456;
        double v45 = v92 - v94;
LABEL_78:
        double v95 = v451 - v45 * v37;
        float v96 = 1.0;
        double v97 = 0.0;
LABEL_172:
        if (BYTE3(self->mSlideInformation))
        {
          double v39 = v39 * 0.699999988;
          double v188 = 1.0 - v97;
          double v95 = v95 + v188 * -0.5;
          double v40 = 0.0;
          double v38 = 0.0;
        }

        else
        {
          double v188 = 1.0 - v97;
        }

        MRMatrix_Clear((uint64_t)v476);
        float v189 = v38;
        float v190 = v39;
        MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v476, v189, v190, 0.0);
        v191.f32[0] = v96;
        MRMatrix_Scale((float32x2_t *)v476, v191, v96, 1.0);
        float v192 = v95;
        float v193 = v460;
        float v194 = v40;
        *(float *)&double v195 = MRMatrix_Translate((float *)v476, v192, v193, v194);
        objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v476, v475, v195);
        double v181 = 1.0;
        double v182 = 1.0;
        double v176 = self;
        id v177 = a4;
        double v178 = v459;
        id v179 = a5;
        uint64_t v180 = 1LL;
        double v173 = v188;
        BOOL v172 = 1LL;
        unint64_t v183 = v19;
        double v174 = v44;
        double v175 = v37;
LABEL_176:
        -[MREffectDateline _drawGrayChapters:time:arguments:showInfo:startProgress:titleEnd:titleToChapter:drawPhotos:startIndex:exit:isExiting:chapterIntro:chapterProgress:]( v176,  "_drawGrayChapters:time:arguments:showInfo:startProgress:titleEnd:titleToChapter:drawPhotos:startIndex:exit:isE xiting:chapterIntro:chapterProgress:",  v177,  v179,  v180,  v172,  v183,  0LL,  v178,  v181,  v182,  v173,  0.0,  v174,  v175);
LABEL_177:
        [a4 restoreModelViewMatrix:v475];
        goto LABEL_178;
      }
    }

    double v97 = datelineEaseInEaseOut(v28 - v36);
    objc_msgSend( objc_msgSend(objc_msgSend(*(id *)((char *)&self->mJournal + 1), "objectAtIndex:", v19), "objectAtIndex:", 0),  "floatValue");
    double v101 = v100 * 0.5;
    double v102 = -11.0;
    double v457 = v101;
    if (v10 >= 1.0)
    {
      double v131 = 10.0;
      if (!v24) {
        double v131 = 8.0;
      }
      double v39 = v131 - v131 * v97;
      double v40 = v97 * -0.0 + 0.0;
      [a4 localAspectRatio];
      if (v132 > 1.5) {
        float v133 = 0.31;
      }
      else {
        float v133 = 0.41;
      }
      double v134 = v133;
      [a4 localAspectRatio];
      if (v135 > 1.5) {
        float v136 = 0.31;
      }
      else {
        float v136 = 0.41;
      }
      double v460 = v134 - v136 * v97;
      [a4 localAspectRatio];
      if (v137 > 1.5) {
        double v138 = 0.2;
      }
      else {
        double v138 = 0.466666;
      }
      [a4 localAspectRatio];
      if (v139 > 1.5) {
        double v140 = 0.2;
      }
      else {
        double v140 = 0.466666;
      }
      double v141 = v138 - v140 * v97;
      double v104 = (char *)&self->mSlideInformation + 3;
    }

    else
    {
      if (v24) {
        double v103 = 7.0;
      }
      else {
        double v103 = 5.0;
      }
      double v104 = (char *)&self->mSlideInformation + 3;
      if (BYTE3(self->mSlideInformation))
      {
        [a4 localAspectRatio];
        double v106 = v97 * (v101 / v105);
      }

      else
      {
        double v106 = 0.0;
      }

      double v39 = v103 - v103 * v97;
      double v40 = v97 * 0.699999988 + -0.699999988;
      double v460 = v97 * -0.75999999 + 0.75999999 + v106;
      [a4 localAspectRatio];
      double v185 = (float)((float)((float)((float)(1.7778 / v184) + -1.0) * 0.6) + -0.2);
      [a4 localAspectRatio];
      double v141 = v185 - (float)((float)((float)((float)(1.7778 / v186) + -1.0) * 0.6) + -0.2) * v97;
      double v102 = -11.0;
    }

    double v38 = v102 + v97 * 11.0;
    double v187 = v97 * (v457 + -1.0);
    if (*v104) {
      double v187 = 0.0;
    }
    double v95 = v141 - v187;
    double v44 = 1.0;
    float v96 = v97 * 4.0 + 1.0;
    double v37 = 1.0;
    goto LABEL_172;
  }

  double v58 = v7 - (v23 + v25);
  double v59 = v27 - v25;
  double v60 = v27 - v25 + -2.0;
  BOOL v61 = v58 > v60 && v20 < (uint64_t)v18;
  if (v61)
  {
    [a4 setShader:@"PlainTexture"];
    if (v58 >= v59 + -0.5)
    {
      double v99 = datelineEaseInEaseOut(v58 - (v59 + -0.5) + v58 - (v59 + -0.5));
      double v98 = 1.0;
    }

    else
    {
      double v98 = datelineEaseInEaseOut((v58 - v60) / 1.5);
      double v99 = 0.0;
    }

    id v116 = [*(id *)((char *)&self->mJournal + 1) objectAtIndex:v19];
    double v117 = (char *)[v116 count];
    [a4 localAspectRatio];
    -[MREffectDateline _offsetForChapterIndex:layoutIndex:aspectRatio:]( self,  "_offsetForChapterIndex:layoutIndex:aspectRatio:",  v19,  v117 - 1,  v118);
    double v120 = v119;
    uint64_t v121 = 3LL;
    v122 = &v117[-v121];
    [a4 localAspectRatio];
    -[MREffectDateline _offsetForChapterIndex:layoutIndex:aspectRatio:]( self,  "_offsetForChapterIndex:layoutIndex:aspectRatio:",  v19,  v122,  v123);
    if (BYTE3(self->mSlideInformation))
    {
      else {
        v125 = 0LL;
      }
      double v126 = v120 - v124;
      objc_msgSend(objc_msgSend(v116, "objectAtIndex:", v125), "floatValue");
      double v128 = v126 + v127 * -0.5;
      [a4 localAspectRatio];
      double v130 = v128 / v129;
    }

    else
    {
      unint64_t v143 = v117 - 3;
      if ((uint64_t)v117 > 3)
      {
        double v120 = v120 - v124;
        uint64_t v144 = v116;
      }

      else
      {
        uint64_t v144 = v116;
        unint64_t v143 = 0LL;
      }

      objc_msgSend(objc_msgSend(v144, "objectAtIndex:", v143), "floatValue");
      double v130 = v120 + v197 * 0.5 + -1.0;
    }

    if (v10 >= 1.0)
    {
      double v198 = v98 * 7.0;
      double v199 = v98 * 0.0;
      [a4 localAspectRatio];
      double v202 = v98 * flt_1FB6C8[v208 <= 1.5];
      [a4 localAspectRatio];
      double v207 = dbl_1FB830[v209 <= 1.5] * v98 - v130 * (1.0 - v98);
      int v205 = BYTE3(self->mSlideInformation);
    }

    else
    {
      double v198 = v98 * 4.0;
      double v199 = v98 * -0.699999988;
      double v200 = (1.0 - v98) * v130;
      if (BYTE3(self->mSlideInformation)) {
        double v201 = v200;
      }
      else {
        double v201 = 0.0;
      }
      double v202 = -(v201 - v98 * 0.75);
      [a4 localAspectRatio];
      double v204 = (float)((float)((float)((float)(1.7778 / v203) + -1.0) * 0.6) + -0.2);
      int v205 = BYTE3(self->mSlideInformation);
      if (BYTE3(self->mSlideInformation)) {
        double v206 = 0.0;
      }
      else {
        double v206 = v200;
      }
      double v207 = -(v206 - v204 * v98);
    }

    if (v205)
    {
      double v198 = v198 * 0.699999988;
      double v207 = v207 + v98 * -0.5;
      double v199 = 0.0;
      double v210 = 0.0;
    }

    else
    {
      double v210 = v98 * -12.0;
    }

    MRMatrix_Clear((uint64_t)v476);
    float v211 = v210;
    float v212 = v198;
    MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v476, v211, v212, 0.0);
    v213.f32[0] = v98 * -4.0 + 5.0;
    MRMatrix_Scale((float32x2_t *)v476, v213, v213.f32[0], 1.0);
    float v214 = v207;
    float v215 = v202;
    float v216 = v199;
    *(float *)&double v217 = MRMatrix_Translate((float *)v476, v214, v215, v216);
    objc_msgSend(a4, "composeModelViewMatrix:saveTo:", v476, v475, v217);
    -[MREffectDateline _drawGrayChapters:time:arguments:showInfo:startProgress:titleEnd:titleToChapter:drawPhotos:startIndex:exit:isExiting:chapterIntro:chapterProgress:]( self,  "_drawGrayChapters:time:arguments:showInfo:startProgress:titleEnd:titleToChapter:drawPhotos:startIndex:exit:isExiti ng:chapterIntro:chapterProgress:",  a4,  a5,  1LL,  1LL,  v19,  1LL,  v459,  1.0,  1.0,  v98,  v99,  0.0,  1.0);
    if (v99 > 0.0) {
      -[MREffectDateline _drawChapterDateSwitch:to:progress:time:arguments:context:]( self,  "_drawChapterDateSwitch:to:progress:time:arguments:context:",  v19,  v19 + 1,  a5,  a4,  v99,  v459);
    }
    goto LABEL_177;
  }

  if (v58 <= v59 + -1.0) {
    double v62 = 1.0;
  }
  else {
    double v62 = v59 + -1.0 - v58 + 1.0;
  }
  double v430 = v62;
  id v63 = [v21 objectForKey:@"items"];
  v474[0] = 0.0;
  v473[0] = 0.0;
  uint64_t v64 = -[MREffectDateline _currentItemForChapter:atTime:forDuration:fromTime:]( self,  "_currentItemForChapter:atTime:forDuration:fromTime:",  v19,  v474,  v473,  v58);
  id obj = v63;
  uint64_t v65 = (char *)[v63 count];
  [a4 localAspectRatio];
  -[MREffectDateline _offsetForChapterIndex:layoutIndex:aspectRatio:]( self,  "_offsetForChapterIndex:layoutIndex:aspectRatio:",  v19,  v64,  v66);
  double v68 = v67;
  double v407 = 1.0;
  BOOL v69 = v58 - v473[0] >= 1.0 || v64 == 0;
  int v70 = !v69;
  int v434 = v70;
  int64_t v410 = v64;
  double v409 = v58 - v473[0];
  if (v69)
  {
    uint64_t v73 = v64;
    double v71 = 0.0;
  }

  else
  {
    double v71 = datelineEaseInEaseOut(v58 - v473[0]);
    [a4 localAspectRatio];
    -[MREffectDateline _offsetForChapterIndex:layoutIndex:aspectRatio:]( self,  "_offsetForChapterIndex:layoutIndex:aspectRatio:",  v19,  v64 - 1,  v72);
    uint64_t v73 = v64;
    double v68 = v74 + (v68 - v74) * v71;
  }

  if (v58 > v60 + -0.25)
  {
    double v112 = datelineEaseInEaseOut((v58 - (v60 + -0.25)) * 4.0);
    uint64_t v73 = v64;
    double v407 = 1.0 - v112;
  }

  double v113 = v409;
  double v397 = v474[0] + -0.5;
  if (v409 >= v474[0] + -0.5)
  {
    double v142 = datelineEaseInEaseOut(v409 - (v474[0] + -0.5) + v409 - (v474[0] + -0.5));
    uint64_t v73 = v64;
    double v115 = 1.0 - v142;
  }

  else
  {
    if (!v73)
    {
      double v115 = datelineEaseInEaseOut(v58 + v58);
      double v196 = v474[0] + -0.300000012;
      if (v409 < v474[0] + -0.300000012) {
        goto LABEL_204;
      }
LABEL_203:
      double v219 = 1.0 - datelineEaseInEaseOut((v409 - v196) / 0.300000012);
      goto LABEL_208;
    }

    double v113 = v409;
    BOOL v114 = v409 >= 1.0 && v409 < 1.5;
    if (v114)
    {
      double v218 = datelineEaseInEaseOut(v409 + -1.0 + v409 + -1.0);
      uint64_t v73 = v64;
      double v115 = v218;
    }

    else
    {
      double v115 = 0.0;
      if (v409 >= 1.5) {
        double v115 = 1.0;
      }
    }
  }

  double v196 = v474[0] + -0.300000012;
  if (v113 >= v474[0] + -0.300000012) {
    goto LABEL_203;
  }
  if (!v73)
  {
LABEL_204:
    double v220 = v58 / 0.300000012;
    goto LABEL_205;
  }

  double v219 = 1.0;
  if (v409 >= 1.0 && v409 < 1.29999995)
  {
    double v220 = (v409 + -1.0) / 0.300000012;
LABEL_205:
    double v219 = datelineEaseInEaseOut(v220);
    goto LABEL_208;
  }

  if (v409 < 1.29999995) {
    double v219 = 0.0;
  }
LABEL_208:
  double v406 = v219;
  double v396 = v71;
  if ((v434 & 1) == 0)
  {
    double v396 = 0.0;
    if (v115 > 0.0) {
      double v396 = 1.0;
    }
  }

  double v221 = 1.0;
  if (v64 <= 1 && v58 < 1.0) {
    double v221 = datelineEaseInEaseOut(v58);
  }
  [a4 setShader:@"PlainTexture"];
  id v223 = [*(id *)((char *)&self->mJournal + 1) objectAtIndex:v19];
  v224 = v223;
  double v225 = 0.0;
  if (!BYTE3(self->mSlideInformation))
  {
    objc_msgSend(objc_msgSend(v223, "objectAtIndex:", 0), "floatValue");
    double v225 = v226 * -0.5;
  }

  objc_msgSend(objc_msgSend(v224, "objectAtIndex:", 0), "floatValue");
  float v228 = v227;
  id v429 = [v26 objectForKey:@"items"];
  __int128 v463 = 0u;
  __int128 v464 = 0u;
  __int128 v465 = 0u;
  __int128 v466 = 0u;
  id v229 = [obj countByEnumeratingWithState:&v463 objects:v471 count:16];
  if (v229)
  {
    id v230 = v229;
    uint64_t v231 = 0LL;
    BOOL v232 = 0;
    double v233 = v407 * v115;
    double v234 = v228 * 0.5;
    uint64_t v450 = v64 + 1;
    uint64_t v453 = *(void *)v464;
    int64_t v448 = v64 - 2;
    double v403 = 1.0 - v71 * 0.800000012;
    double v402 = v71 * 0.800000012 + 0.200000003;
    uint64_t v395 = -v64;
    float v235 = 0.1;
    if (v10 < 1.0) {
      float v235 = 0.0;
    }
    double v404 = v407 * v221;
    double v405 = v235;
    float v236 = v407 * v221;
    double v237 = v409 + -1.0;
    CGFloat height = CGSizeZero.height;
    float v238 = 1.0 - v406;
    float v399 = v238;
    float v400 = v236;
    double v401 = v233;
    float v239 = v233;
    float v398 = v239;
    double v441 = v68;
    v428 = v224;
    id v442 = a5;
LABEL_223:
    uint64_t v240 = 0LL;
    uint64_t v433 = v395 + v231;
    uint64_t v431 = v231;
    id v432 = v230;
    while (1)
    {
      if (*(void *)v464 != v453) {
        objc_enumerationMutation(obj);
      }
      int64_t v241 = v231 + v240;
      if (v231 + v240 > v450) {
        break;
      }
      if (v241 < v448)
      {
        int v242 = BYTE3(self->mSlideInformation);
        objc_msgSend(objc_msgSend(v224, "objectAtIndex:", v231 + v240), "floatValue");
        double v244 = (float)(v243 + 0.05);
        if (v242) {
          double v234 = v234 - v244;
        }
        else {
          double v225 = v225 + v244;
        }
        goto LABEL_385;
      }

      uint64_t v245 = v433 + v240;
      v246 = *(void **)(*((void *)&v463 + 1) + 8 * v240);
      if (v434)
      {
        double v247 = v403;
        if (v433 + v240 != -1) {
          double v247 = 0.200000003;
        }
        if (!v245) {
          double v247 = v402;
        }
      }

      else
      {
        double v247 = 1.0;
        if (v245) {
          double v247 = 0.200000003;
        }
      }

      double v248 = v430 * v247;
      *(float *)&double v248 = v248;
      LODWORD(v237) = 1.0;
      LODWORD(v233) = LODWORD(v248);
      objc_msgSend( a4,  "setForeColorRed:green:blue:alpha:saveTo:",  v475,  v248,  COERCE_DOUBLE(__PAIR64__(HIDWORD(v430), LODWORD(v248))),  v233,  v237);
      double v458 = v225;
      if (!objc_msgSend( objc_msgSend(v246, "objectForKey:", @"type"),  "isEqualToString:",  @"photo"))
      {
        if (v232)
        {
          [a4 unsetShader];
          [a4 setShader:@"PlainTexture"];
        }

        int v254 = BYTE3(self->mSlideInformation);
        [a4 localAspectRatio];
        if (v254)
        {
          double v256 = (float)(v255 * 1.47);
          double v257 = 1.96000004;
          v258 = v429;
        }

        else
        {
          v258 = v429;
          if (v10 >= 1.0)
          {
            double v257 = (float)(1.8 / v255);
            double v256 = 1.79999995;
          }

          else
          {
            double v256 = (float)((float)(v255 * 1.8) / 1.3333);
            [a4 localAspectRatio];
            double v257 = v256 / v262;
          }
        }

        if (BYTE3(self->mSlideInformation))
        {
          double v274 = v234 + v256 * -0.5 - v68;
          double v275 = 0.0;
        }

        else
        {
          double v275 = v225 + v257 * 0.5 - v68;
          double v274 = v405;
        }

        id v276 = [*(id *)&self->mIsRotating retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v7];
        +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v276,  a4,  v275,  v274,  v257,  v256);
        [v276 releaseByUser];
        id v277 = objc_msgSend(v258, "objectForKey:", NSStringWithInteger("text", v241));
        p_mPixelSize = &self->super.mPixelSize;
        objc_msgSend( v277,  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
        double v425 = v234;
        double v426 = v279;
        double v445 = v256;
        double v438 = v257;
        double v424 = v280;
        if (BYTE3(self->mSlideInformation))
        {
          double v411 = v234 + v256 * -0.5 - v68;
          double v412 = 0.0;
        }

        else
        {
          double v411 = v405;
          double v412 = v225 + v257 * 0.5 - v68;
        }

        objc_msgSend(objc_msgSend(v258, "objectForKey:", NSStringWithInteger("lastTextRect", v241)), "CGRectValue");
        double v417 = v282;
        double v420 = v281;
        double v413 = self->super.mPixelSize.height;
        double v414 = v283;
        double width = p_mPixelSize->width;
        double v416 = v284;
        objc_msgSend(objc_msgSend(v258, "objectForKey:", NSStringWithInteger("firstTextRect", v241)), "CGRectValue");
        double v286 = v285;
        double v288 = v287;
        double v290 = v289;
        double v292 = p_mPixelSize->width;
        double v291 = self->super.mPixelSize.height;
        BOOL v293 = BYTE3(self->mSlideInformation) == 0;
        [*(id *)((char *)&self->mTextBackground + 1) imageAspectRatio];
        double v295 = v294;
        [a4 localAspectRatio];
        float v297 = v296;
        id v298 = [*(id *)((char *)&self->mTextBackground + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v459];
        id v299 = [*(id *)((char *)&self->mQuoteOpen + 1) retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v459];
        double v302 = 1.0;
        BOOL v304 = v404 < 1.0 && v241 < 2;
        HIDWORD(v305) = HIDWORD(v407);
        int v306 = v407 < 1.0 || v304;
        if (v306 == 1)
        {
          *(float *)&double v305 = v400;
          *(float *)&double v302 = v400;
          *(float *)&double v300 = v400;
          *(float *)&double v301 = v400;
          [a4 composeForeColorRed:v476 green:v305 blue:v302 alpha:v300 saveTo:v301];
        }

        double v307 = (v288 + v290) / v291 + (v288 + v290) / v291;
        double v308 = dbl_1FB840[v293];
        double v309 = v308 / v295 * v297;
        double v310 = v412 - v426 * 0.5;
        double v311 = v286 / v292 + v286 / v292 + v310 - v308;
        double v312 = v411 - v424 * 0.5;
        double v313 = v312 + v307 - v309 * 0.25;
        double v314 = (v420 + v417) / width + (v420 + v417) / width + v310 + v308;
        double v418 = v312 + (v416 + v414) / v413 + (v416 + v414) / v413 - v309 * 0.25;
        double v421 = v314;
        [a4 blend:2];
        +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v277,  a4,  v412,  v411,  v426,  v424);
        +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v298,  a4,  v311,  v313,  v308,  v309);
        +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v299,  a4,  v421,  v418,  v308,  v309);
        [a4 blend:0];
        if (v306) {
          [a4 restoreForeColor:v476];
        }
        [v298 releaseByUser];
        [v299 releaseByUser];
        LOBYTE(v315) = 0;
        double v316 = v445 + 0.0500000007;
        double v68 = v441;
        double v317 = v438 + 0.0500000007;
        if (!BYTE3(self->mSlideInformation)) {
          double v316 = 0.0;
        }
        double v234 = v425 - v316;
        if (BYTE3(self->mSlideInformation)) {
          double v317 = -0.0;
        }
        double v7 = v459;
        double v225 = v458 + v317;
        float v10 = v446;
        uint64_t v231 = v431;
        goto LABEL_384;
      }

      uint64_t v444 = v433 + v240;
      v249 = ImageKey((int64_t)objc_msgSend( objc_msgSend(v246, "objectForKey:", @"photoIndex"),  "integerValue"));
      id v250 = -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  v249);
      unsigned int v251 = [v250 canPlay];
      if (v251)
      {
        id v252 = [*(id *)((char *)&self->mBreakInformation + 1) objectForKey:v249];
        if (v444) {
          id v253 = 0LL;
        }
        else {
          id v253 = v252;
        }
        if (v444) {
          id v250 = v252;
        }
      }

      else
      {
        id v253 = 0LL;
      }

      v423 = v253;
      if (BYTE3(self->mSlideInformation))
      {
        [v250 imageAspectRatio];
        if (v259 < 0.5)
        {
          [a4 localAspectRatio];
          float v261 = v260 * 2.6133;
LABEL_263:
          double v264 = v261;
          double v273 = 1.96000004;
          goto LABEL_301;
        }

        [v250 imageAspectRatio];
        double v270 = v269;
        [a4 localAspectRatio];
        float v272 = v271;
        if (v270 > 2.0)
        {
          float v261 = v271 * 1.47;
          goto LABEL_263;
        }

        [v250 imageAspectRatio];
        if (v322 <= v272) {
          double v322 = v272;
        }
        double v273 = 1.96000004;
        double v323 = 1.96000004 / v322;
        [a4 localAspectRatio];
        double v264 = v323 * v324;
      }

      else if (v10 >= 1.0)
      {
        [v250 imageAspectRatio];
        double v319 = v318;
        [a4 localAspectRatio];
        float v321 = 1.8 / v320;
        if (v319 >= 0.5)
        {
          double v326 = v321;
          [v250 imageAspectRatio];
          double v328 = v327;
          [a4 localAspectRatio];
          double v330 = v329;
          if (v328 < v330) {
            double v330 = v328;
          }
          double v273 = v330 * v326;
        }

        else
        {
          double v273 = (float)(v321 * 0.75);
        }

        double v264 = 1.79999995;
      }

      else
      {
        [a4 localAspectRatio];
        double v264 = (float)((float)(v263 * 1.8) / 1.3333);
        [v250 imageAspectRatio];
        double v266 = v265;
        [a4 localAspectRatio];
        BOOL v114 = v266 < 0.5;
        double v268 = v264 / v267;
        if (v114)
        {
          double v325 = 0.75;
        }

        else
        {
          [v250 imageAspectRatio];
          if (v325 > 1.33333337) {
            double v325 = 1.33333337;
          }
        }

        double v273 = v268 * v325;
      }

- (void)_drawGrayChapters:(id)a3 time:(double)a4 arguments:(id)a5 showInfo:(BOOL)a6 startProgress:(double)a7 titleEnd:(double)a8 titleToChapter:(double)a9 drawPhotos:(BOOL)a10 startIndex:(int64_t)a11 exit:(double)a12 isExiting:(BOOL)a13 chapterIntro:(double)a14 chapterProgress:(double)a15
{
  BOOL v614 = a13;
  BOOL v16 = a10;
  BOOL v552 = a6;
  __int128 v657 = xmmword_1FB8A0;
  if (!*(MRImageProvider **)((char *)&self->mDateWindowMask + 1))
  {
    double v23 = (MRImageProvider *)objc_msgSend( objc_msgSend(a3, "imageManager"),  "retainedByUserImageWithSize:andColor:",  &v657,  1.0,  1.0);
    *(MRImageProvider **)((char *)&self->mDateWindowMask + 1) = v23;
    -[MRImageProvider setLabel:](v23, "setLabel:", @"Marimba Dateline Gray");
  }

  v596 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v24 = [*(id *)((char *)&self->mJournal + 1) count];
  double v25 = (char *)[*(id *)((char *)&self->mJournal + 1) count];
  else {
    uint64_t v26 = (uint64_t)&v25[-a11];
  }
  double v27 = 0.150000006;
  if (v16) {
    double v27 = 0.400000006;
  }
  double v629 = v27;
  [a3 localAspectRatio];
  float v29 = v28;
  int v30 = BYTE3(self->mSlideInformation);
  id v31 = objc_msgSend( *(id *)((char *)&self->mJournal + 1),  "objectsAtIndexes:",  +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a11, v26));
  double v32 = datelineEaseInEaseOut(a14);
  double v33 = datelineEaseInEaseOut(a8);
  __int128 v641 = 0u;
  __int128 v642 = 0u;
  __int128 v643 = 0u;
  __int128 v644 = 0u;
  id obj = [v31 reverseObjectEnumerator];
  v568 = (char *)[obj countByEnumeratingWithState:&v641 objects:v651 count:16];
  if (v568)
  {
    double v620 = v32;
    double v34 = v29;
    double v570 = a12;
    double v35 = a14;
    double v537 = a8;
    double v36 = a7;
    double v37 = v33;
    double v603 = (1.0 - a9) * -0.25 + 1.25;
    double v38 = fabs(v29 + -1.5);
    BOOL v39 = v38 < 0.00001;
    BOOL v40 = v29 < 1.5 || v38 < 0.00001;
    int v41 = v29 <= 1.5 || v40;
    int v623 = v41;
    BOOL v374 = v38 < 0.00001;
    double v42 = dbl_1FB860[v29 < 1.5];
    if (v374) {
      double v42 = -1.08500001;
    }
    double v622 = v42;
    BOOL v615 = v29 > 0.7;
    if (v30) {
      double v43 = 0.25;
    }
    else {
      double v43 = -0.200000003;
    }
    else {
      uint64_t v44 = (uint64_t)v24;
    }
    BOOL v45 = a12 < 1.0 && v614;
    BOOL v559 = v45;
    double v527 = v35;
    int v46 = v35 >= 0.5 || v614;
    int v536 = v46;
    double v47 = v35 * 5.0;
    float v619 = v29;
    float v48 = v35 * 5.0;
    unsigned int v49 = vcvtms_u32_f32(v48);
    double v50 = v35 * 5.0 - (double)v49;
    double v510 = v50 * -0.523598776;
    float v52 = v50;
    BOOL v53 = v570 > 0.0 && v614;
    char v535 = v53;
    float v51 = v50 * -0.523598776;
    __float2 v54 = __sincosf_stret(v51);
    id v604 = 0LL;
    id v560 = 0LL;
    v600 = 0LL;
    v593 = 0LL;
    if (v49 == 4) {
      float v55 = 1.0;
    }
    else {
      float v55 = v52;
    }
    float v514 = v55;
    if (a11) {
      int v56 = v16;
    }
    else {
      int v56 = 1;
    }
    int v558 = v56;
    if (v552) {
      double v57 = 1.0;
    }
    else {
      double v57 = v36;
    }
    float v58 = 0.56;
    if (!v552) {
      float v58 = 1.0;
    }
    float v550 = v58;
    double v59 = v570;
    float v60 = 0.6;
    if (v619 < 1.0) {
      float v60 = 1.0;
    }
    unint64_t v594 = v26 + a11;
    uint64_t v565 = *(void *)v642;
    double v61 = v60 - v43;
    double v62 = 0.5;
    double v564 = v37 * -0.119999997;
    double v547 = (float)(1.0 / (float)v44);
    double v548 = v37 * 0.119999997;
    float v63 = v37 * -0.439999998 + 1.0;
    float v546 = v63;
    float v64 = v570 * 0.439999998 + 0.560000002;
    float v545 = v64;
    float v65 = 0.275;
    double v66 = (1.79999995 / v34 + -1.79999995) * 0.5;
    float v67 = 0.0;
    if (v619 < 1.0) {
      float v65 = 0.0;
    }
    double v68 = v66 * v34;
    double v69 = 0.6;
    if (v619 < 1.0) {
      double v69 = 0.75;
    }
    double v526 = v69;
    double v509 = (float)((float)floorf(v48) + 1.0) - v47;
    if (v619 >= 1.0) {
      float v67 = 0.1;
    }
    double v70 = 0.275000006;
    if (v619 < 1.0) {
      double v70 = 0.0;
    }
    double v531 = v70;
    if (v619 >= 1.0) {
      double v68 = 0.0;
    }
    double v539 = v68;
    int v71 = v619 < 1.0 || v40;
    double v72 = dbl_1FB870[v39];
    uint64_t v73 = 0LL;
    if (v619 < 1.0) {
      double v72 = flt_1FB7A0[v615];
    }
    if (!v71) {
      double v72 = 0.0;
    }
    double v525 = v72;
    double v74 = -0.625000007;
    if (v623) {
      double v74 = v622;
    }
    double v524 = v74;
    double v541 = (v57 + -0.200000003) / 0.800000012;
    float v75 = (1.0 - v537) * 30.0;
    float v557 = v75;
    double v553 = v66 * v34 + -0.100000001;
    double v540 = v65;
    double v529 = fabs(v37 + -1.0);
    double v76 = fmin(a9, 1.0);
    double v523 = v76 * (v37 + -0.5 + v37 + -0.5);
    double v538 = v76 * 0.338;
    float v77 = v76;
    float v556 = v77;
    double v521 = v34 * 0.349999994 * -0.5 + -0.154999986;
    double v522 = v34 * 0.349999994;
    double v544 = fabs(v537 + -1.0);
    double v520 = flt_1FB790[v619 < 1.0];
    double v519 = flt_1FB798[v619 < 1.0];
    float v78 = v620;
    float v534 = v78;
    int v533 = !v614;
    float v79 = (1.0 - v620) * 70.0;
    float v80 = (1.0 - v620) * 90.0;
    float v515 = v80;
    float v516 = v79;
    double v551 = v34;
    double v513 = v34 * 0.8;
    unsigned int v530 = v49;
    int v508 = ~v49;
    BOOL v599 = v16;
    int v580 = !v16;
    double v81 = 1.0 - (4.0 - v527 * 5.0);
    float v82 = -(1.0 - a9) * 0.800000012 + 1.0;
    float v583 = v82;
    double v621 = v67;
    float v83 = 1.0 - a9;
    float v588 = v83;
    double y = CGPointZero.y;
    double height = CGSizeZero.height;
    double v549 = v61;
    double v562 = v37 * -0.0500000007;
    double v563 = -v61;
    uint64_t v566 = v44;
    double v84 = (double)v44;
    double v555 = v37;
    double v542 = v37 * 0.0500000007;
    double v543 = (double)v44;
    double v85 = 1.0;
    double v567 = v57;
    double v532 = v57 / 0.800000012;
    double v518 = v81;
    double v512 = v81 + -0.200000003;
    double v561 = fabs(v570);
    int64_t v86 = a11;
    int64_t v576 = a11;
    while (1)
    {
      uint64_t v87 = 0LL;
      v511 = v73;
      unint64_t v592 = (unint64_t)v73;
      do
      {
        if (*(void *)v642 != v565) {
          objc_enumerationMutation(obj);
        }
        unint64_t v88 = v594 - 1;
        uint64_t v575 = v87;
        id v601 = *(id *)(*((void *)&v641 + 1) + 8 * v87);
        BOOL v90 = v59 > 0.0 && v594 - 2 == v86;
        double v91 = (double)(uint64_t)(v88 - v86);
        double v92 = 1.0;
        if (v566 != 1) {
          double v92 = v85 - v91 / v543;
        }
        double v93 = v563 * v91;
        double v94 = v562 * v91;
        HIDWORD(v95) = HIDWORD(v564);
        double v96 = v564 * v91;
        if (v614)
        {
          double v93 = v93 + v549 * v59;
          double v94 = v94 + v542 * v59;
          double v96 = v96 + v548 * v59;
          double v92 = v92 + v547 * v59;
        }

        --v594;
        if (v88 == v86)
        {
          __int128 v654 = *(_OWORD *)[a3 foreColor];
        }

        else
        {
          double v97 = COERCE_DOUBLE(__PAIR64__(HIDWORD(v555), LODWORD(v550)));
          if (v559 && v90) {
            *(float *)&double v97 = v545;
          }
          if ((!v559 || !v90) && !v552 && v555 < 1.0) {
            *(float *)&double v97 = v546;
          }
          LODWORD(v81) = 1.0;
          LODWORD(v95) = LODWORD(v97);
          LODWORD(v84) = LODWORD(v97);
          [a3 composeForeColorRed:&v654 green:v97 blue:v95 alpha:v84 saveTo:v81];
        }

        double v98 = 1.0;
        double v99 = v567;
        if (v567 >= 1.0)
        {
          double v627 = 1.0;
          unint64_t v105 = v594;
        }

        else
        {
          double v100 = 0.0;
          if (v567 >= 0.200000003)
          {
            double v101 = 1.0;
            double v102 = 0.0;
            if (v592 <= 9)
            {
              double v101 = dbl_1FB8E0[v592];
              double v102 = dbl_1FB930[v592];
            }

            if (v541 >= v102)
            {
              double v100 = 1.0;
              if (v541 < v101)
              {
                double v103 = v541 - v102;
                if (v541 - v102 < 0.0) {
                  double v103 = 0.0;
                }
                double v104 = datelineEaseInEaseOut(v103 / (v101 - v102));
                double v99 = v567;
                double v100 = v104;
              }
            }
          }

          unint64_t v105 = v594;
          double v627 = v100;
          if (v99 <= 0.800000012)
          {
            double v98 = 0.0;
            double v106 = 1.0;
            double v107 = 0.0;
            if (v592 <= 9)
            {
              double v106 = dbl_1FB8E0[v592];
              double v107 = dbl_1FB930[v592];
            }

            if (v532 >= v107)
            {
              double v108 = v532 - v107;
              if (v532 - v107 < 0.0) {
                double v108 = 0.0;
              }
              double v109 = v108 / (v106 - v107);
              if (v532 < v106) {
                double v98 = v109;
              }
              else {
                double v98 = 1.0;
              }
            }
          }
        }

        int v110 = v105 == v86 || v90;
        if (v110 == 1)
        {
          id v560 = [*(id *)((char *)&self->mChapterDurations + 1) objectAtIndex:v105];
          id v604 = [v560 objectForKey:@"items"];
        }

        MRMatrix_Clear((uint64_t)v656);
        if (v105 == v86 && v59 > 0.0) {
          double v93 = v93 + v59 * 0.25;
        }
        if (BYTE3(self->mSlideInformation)) {
          MRMatrix_SetRotationFromAnglesXYZDeg((uint64_t)v656, 0.0, v557, 0.0);
        }
        float v112 = v94;
        float v113 = v96;
        float v114 = v93;
        *(float *)&double v115 = MRMatrix_Translate(v656, v112, v113, v114);
        objc_msgSend(a3, "composeModelViewMatrix:saveTo:", v656, v655, v115);
        id v116 = NSStringWithInteger("chapter", v594);
        id v117 = [*(id *)((char *)&self->mChapterDates + 1) objectForKey:v116];
        double x = CGPointZero.x;
        double v121 = 1.0;
        if ([v117 count])
        {
          id v122 = [v117 objectForKey:@"day"];
          objc_msgSend( v122,  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
          double v125 = v123;
          double v126 = v124;
          double v624 = v124;
          if (BYTE3(self->mSlideInformation))
          {
            double v127 = v123 * 5.0 * v62 + -1.0;
            double v128 = -5.0;
            double v129 = v124 * -5.0 * v62 + 1.0 + v540 - v553;
            double v130 = v125 * -5.0;
          }

          else
          {
            double v128 = -5.0;
            double v130 = v123 * -5.0;
            double v127 = v123 * -5.0 * v62 + -1.0 + -0.0500000007;
            double v129 = v126 * -5.0 * v62 + 1.0 + v531 - v539;
          }

          double x = v127 + v130 * v62;
          double v131 = v127 * 0.200000003;
          double v132 = v129 * 0.200000003;
          if (v98 < 1.0)
          {
            double v133 = 1.0 - (v98 * v128 + 4.0);
            double v605 = v132;
            double v589 = v127 * 0.200000003;
            if (v133 > 0.200000003)
            {
              double v134 = atan(v133 + -0.200000003);
              HIDWORD(v130) = -1074191877;
              double v133 = (v134 / -1.57079633 + 1.0) * 0.200000003;
            }

            v611 = v116;
            double v608 = x;
            if (v98 < 0.25)
            {
              double v135 = datelineEaseInEaseOut(v98 * 4.0);
              goto LABEL_129;
            }

            double v135 = 0.75;
            LODWORD(v135) = 1.0;
            if (v98 > 0.75)
            {
              double v141 = datelineEaseInEaseOut((v98 + -0.75) * 4.0);
              HIDWORD(v130) = 1070965194;
              double v135 = (v92 * -0.338 + 1.0) * (1.0 - v141) + v92 * 0.338;
LABEL_129:
              *(float *)&double v135 = v135;
            }

            int v142 = v110;
            LODWORD(v131) = 1.0;
            LODWORD(v130) = LODWORD(v135);
            LODWORD(v132) = LODWORD(v135);
            [a3 composeForeColorRed:v649 green:v135 blue:v130 alpha:v132 saveTo:v131];
            double v143 = v98 * 5.0;
            float v144 = v98 * 5.0;
            float v145 = fminf(floorf(v144), 4.0);
            unsigned int v146 = v145;
            else {
              id v147 = [v117 objectForKey:off_258A48[v146]];
            }
            if (v146 <= 2) {
              id v122 = [v117 objectForKey:off_258A48[v146 + 1]];
            }
            double v616 = v92;
            double v148 = v143 - (double)v146;
            if (v147)
            {
              id v147 = [v147 retainedByUserImage];
              float v149 = v148 * -0.392699082;
              __float2 v150 = __sincosf_stret(v149);
              [v147 setCenterX:(float)(1.0 - v150.__cosval)];
              [v147 setCenterY:(float)(v150.__sinval * -6.0)];
              double v62 = 0.5;
              [v147 setRotationAngle:-(v148 * -0.392699082)];
              [v147 setScale:0.4];
            }

            id v151 = a5;
            if (v122)
            {
              double v152 = (float)((float)v145 + 1.0) - v143;
              id v122 = [v122 retainedByUserImage];
              if (v146 == 4) {
                double v152 = -v133;
              }
              float v153 = v152 * 0.392699082;
              __float2 v154 = __sincosf_stret(v153);
              [v122 setCenterX:(float)(1.0 - v154.__cosval)];
              [v122 setCenterY:(float)(v154.__sinval * -6.0)];
              [v122 setRotationAngle:-(v152 * 0.392699082)];
              [v122 setScale:0.4];
              [v122 centerY];
              if (v155 > 0.0)
              {
                [v122 centerY];
                [v122 setCenterY:(1.0 - v98) * v156];
              }

              id v151 = a5;
            }

            double v59 = v570;
            double x = v608;
            double v157 = v125 * 2.5;
            double v158 = v624 * 2.5;
            id v159 = [*(id *)((char *)&self->mQuoteBox + 1) retainedByUserRenderedImageAtTime:a3 inContext:v151 withArguments:a4];
            [a3 unsetShader];
            [a3 blend:3];
            [a3 setShader:@"WeatherWindow"];
            *(float *)&double v160 = v148;
            if (v146 == 4) {
              *(float *)&double v160 = 1.0;
            }
            [a3 setShaderUniformFloat:@"mixFactor" forKey:v160];
            double v161 = v157 / v158 * v551;
            float v162 = v161;
            *(float *)&double v161 = v162;
            [a3 setImage:v122 onTextureUnit:1 withReferenceAspectRatio:v648 state:v161];
            *(float *)&double v163 = v162;
            [a3 setImage:v159 onTextureUnit:2 withReferenceAspectRatio:v647 state:v163];
            float v164 = objc_alloc(&OBJC_CLASS___MRCroppingSprite);
            LODWORD(v165) = 0;
            double v166 = -[MRCroppingSprite initWithPosition:size:zRotation:context:]( v164,  "initWithPosition:size:zRotation:context:",  a3,  v589,  v605,  v157,  v158,  v165);
            -[MRCroppingSprite renderImageInner:inContext:](v166, "renderImageInner:inContext:", v147, a3);

            [a3 unsetImage:v159 onTextureUnit:2 state:v647];
            [a3 unsetImage:v122 onTextureUnit:1 state:v648];
            [a3 blend:0];
            [v159 releaseByUser];
            [v122 releaseByUser];
            [v147 releaseByUser];
            [a3 restoreForeColor:v649];
            double v121 = 1.0;
            int v110 = v142;
            double v92 = v616;
            id v116 = v611;
            goto LABEL_156;
          }

          float v136 = v538 * v92;
          double v137 = v127 * 0.200000003;
          double v138 = v132;
          if (v614 && v90)
          {
            double v139 = v136;
            double v130 = (float)(1.0 - v136);
            double v140 = v139 + v130 * v59;
            *(float *)&double v140 = v140;
          }

          else
          {
            HIDWORD(v140) = 1055193269;
            HIDWORD(v132) = HIDWORD(v529);
            if (v529 >= 0.00001 || (*(float *)&double v140 = v556, v594 != v86))
            {
              HIDWORD(v131) = HIDWORD(v555);
              double v132 = (float)(1.0 - v136);
              double v140 = v136 + v132 * v555;
              *(float *)&double v140 = v140;
              if (v555 >= 1.0) {
                *(float *)&double v140 = v538 * v92;
              }
              if (v594 != v86) {
                *(float *)&double v140 = v538 * v92;
              }
            }
          }

          LODWORD(v131) = 1.0;
          LODWORD(v130) = LODWORD(v140);
          LODWORD(v132) = LODWORD(v140);
          [a3 composeForeColorRed:v649 green:v140 blue:v130 alpha:v132 saveTo:v131];
          if (v592)
          {
            [a3 blend:2];
            +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v122,  a3,  v137,  v138,  v125,  v624);
            [a3 blend:0];
          }

          else
          {
            +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  v122,  a3,  v137,  v138,  v125,  v624);
          }

          [a3 restoreForeColor:v649];
        }

- (void)_drawChapterDateSwitch:(int64_t)a3 to:(int64_t)a4 progress:(double)a5 time:(double)a6 arguments:(id)a7 context:(id)a8
{
  float v15 = v14;
  BOOL v16 = NSStringWithInteger("chapter", a3);
  int64_t v17 = NSStringWithInteger("chapter", a4);
  id v18 = [*(id *)((char *)&self->mText + 1) objectForKey:v16];
  id v19 = [*(id *)((char *)&self->mText + 1) objectForKey:v17];
  if ([v18 count] && objc_msgSend(v19, "count"))
  {
    double v20 = v15;
    id v21 = [*(id *)((char *)&self->mChapterDates + 1) objectForKey:v16];
    double v22 = v21;
    if (BYTE3(self->mSlideInformation))
    {
      double v23 = (1.79999995 / v20 + -1.79999995) * 0.5 * v20 + -0.100000001;
    }

    else
    {
      double v23 = 0.0;
      if (v15 < 1.0) {
        double v23 = (1.79999995 / v20 + -1.79999995) * 0.5 * v20;
      }
    }

    double v207 = v23;
    double x = CGPointZero.x;
    id v25 = [v21 count];
    double v26 = CGPointZero.x;
    if (v25)
    {
      objc_msgSend( objc_msgSend(v22, "objectForKey:", @"day", CGPointZero.x),  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      if (BYTE3(self->mSlideInformation))
      {
        double v28 = v27 * 5.0 * 0.5 + -1.0;
        double v29 = v27 * -5.0;
      }

      else
      {
        double v29 = v27 * -5.0;
        double v28 = v29 * 0.5 + -1.0 + -0.0500000007;
      }

      double v26 = v28 + v29 * 0.5;
    }

    double v205 = v26;
    id v30 = [*(id *)((char *)&self->mChapterDates + 1) objectForKey:v17];
    if ([v30 count])
    {
      objc_msgSend( objc_msgSend(v30, "objectForKey:", @"day"),  "relativeSizeInContextPixelSize:",  self->super.mPixelSize.width,  self->super.mPixelSize.height);
      if (BYTE3(self->mSlideInformation))
      {
        double v32 = v31 * 5.0 * 0.5 + -1.0;
        double v33 = v31 * -5.0;
      }

      else
      {
        double v33 = v31 * -5.0;
        double v32 = v33 * 0.5 + -1.0 + -0.0500000007;
      }

      double x = v32 + v33 * 0.5;
    }

    id v34 = [v18 objectForKey:@"month"];
    id v35 = [v19 objectForKey:@"month"];
    objc_msgSend(v34, "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    double v37 = v36;
    double v39 = v38;
    double v40 = 0.6;
    if (v15 < 1.0) {
      double v40 = 0.75;
    }
    double v225 = v40;
    if (v36 > v40)
    {
      double v39 = v39 / (v36 / v40);
      double v37 = v40;
    }

    BOOL v41 = v15 >= 1.0;
    objc_msgSend(v35, "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    double v212 = x;
    if (v42 <= v225)
    {
      double v220 = v43;
      double v225 = v42;
    }

    else
    {
      double v220 = v43 / (v42 / v225);
    }

    BOOL v44 = v15 >= 1.0;
    id v45 = [v18 objectForKey:@"weekday"];
    id v46 = [v19 objectForKey:@"weekday"];
    objc_msgSend(v45, "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    double v48 = v47;
    double v50 = v49;
    objc_msgSend(v46, "relativeSizeInContextPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    double v53 = 1.0;
    if (a5 < 1.0)
    {
      double v195 = v52;
      double v210 = v50;
      double v217 = v48;
      double v200 = a6;
      double v186 = v20;
      double v54 = -5.0;
      double v55 = 0.5;
      double v222 = v39;
      double v56 = v39 * -5.0;
      float v57 = flt_1FB7E8[v41];
      double v216 = v37;
      double v58 = v37 * -5.0;
      double v59 = v225 * -5.0;
      double v60 = v220 * -5.0;
      double v219 = a5;
      double v61 = (1.0 - (a5 * -1.25 + 1.0)) * 4.0;
      double v201 = v51;
      if (v61 <= 0.200000003)
      {
        double v182 = (1.0 - (a5 * -1.25 + 1.0)) * 4.0;
      }

      else
      {
        double v62 = v37 * -5.0;
        double v63 = v56;
        float v64 = flt_1FB7E8[v41];
        double v65 = atan(v61 + -0.200000003);
        double v60 = v220 * -5.0;
        float v57 = v64;
        double v56 = v63;
        double v59 = v225 * -5.0;
        double v58 = v62;
        double v53 = 1.0;
        double v55 = 0.5;
        double v182 = (v65 / -1.57079633 + 1.0) * 0.200000003;
      }

      double v66 = v53 + v56 * v55;
      double v67 = v57;
      double v68 = v212 + v59 * v55;
      double v69 = v53 + v60 * v55;
      double v70 = 0.0;
      if (a5 >= 0.200000003) {
        double v70 = (a5 + -0.200000003) / 0.800000012;
      }
      double v213 = v70;
      double v71 = v66 + v67;
      double v72 = v205 + v58 * v55 + -0.100000001;
      double v73 = v68 + -0.100000001;
      double v74 = v69 + v67;
      double v75 = (1.0 - (v70 * -1.25 + 1.0)) * 4.0;
      if (v75 <= 0.200000003)
      {
        double v184 = (1.0 - (v70 * -1.25 + 1.0)) * 4.0;
      }

      else
      {
        double v76 = v205 + v58 * v55 + -0.100000001;
        double v77 = v68 + -0.100000001;
        double v78 = v69 + v67;
        double v79 = atan(v75 + -0.200000003);
        double v74 = v78;
        double v55 = 0.5;
        double v73 = v77;
        double v54 = -5.0;
        double v72 = v76;
        double v184 = (v79 / -1.57079633 + 1.0) * 0.200000003;
      }

      double v80 = v71 - v207;
      double v81 = v72 + v58 * v55;
      double v82 = v74 - v207;
      double v83 = v73 + v59 * v55;
      double v84 = v217 * v54;
      float v85 = flt_1FB7F0[v44];
      float v86 = a5 * 1.25;
      unsigned int v87 = vcvtms_u32_f32(v86);
      double v88 = v201 * v54;
      double v89 = v219 * 1.25 - (double)v87;
      double v199 = v89;
      double v190 = v72;
      double v192 = v73;
      double v208 = v74 - v207;
      if (v34)
      {
        double v187 = v83;
        double v181 = v72 + v58 * v55;
        float v179 = flt_1FB7F0[v44];
        id v90 = [v34 retainedByUserImage];
        float v91 = v89 * -0.523598776;
        __float2 v92 = __sincosf_stret(v91);
        [v90 setCenterX:(float)(1.0 - v92.__cosval)];
        [v90 setCenterY:(float)(v92.__sinval * -6.0)];
        [v90 setRotationAngle:-(v89 * -0.523598776)];
        double v185 = v90;
        [v90 setScale:0.5];
        double v88 = v201 * v54;
        double v84 = v217 * v54;
        float v85 = v179;
        double v81 = v181;
        double v83 = v187;
        double v55 = 0.5;
        double v82 = v208;
      }

      else
      {
        double v185 = 0LL;
      }

      double v93 = v220;
      double v94 = v213;
      double v95 = v81 + v84 * v55;
      double v188 = v80;
      double v96 = v80 - v222 * v55;
      double v97 = v85;
      double v98 = v83 + v88 * v55;
      double v99 = v82 - v220 * v55;
      if (v35)
      {
        double v177 = v98;
        double v178 = v96;
        double v180 = v95;
        double v100 = (float)((float)floorf(v86) + 1.0) - v219 * 1.25;
        id v101 = [v35 retainedByUserImage];
        if (v87 == 1) {
          double v100 = v182 * -0.25;
        }
        float v102 = v100 * 0.523598776;
        __float2 v103 = __sincosf_stret(v102);
        [v101 setCenterX:(float)(1.0 - v103.__cosval)];
        [v101 setCenterY:(float)(v103.__sinval * -6.0)];
        [v101 setRotationAngle:-(v100 * 0.523598776)];
        [v101 setScale:0.5];
        [v101 centerY];
        if (v104 > 0.0)
        {
          [v101 centerY];
          [v101 setCenterY:(1.0 - v219) * v105];
          [v101 rotationAngle];
          [v101 setRotationAngle:(1.0 - v219) * v106];
        }

        id v107 = a7;
        double v93 = v220;
        double v108 = v222;
        double v94 = v213;
        double v109 = v216;
        double v82 = v208;
        double v95 = v180;
        double v98 = v177;
        double v96 = v178;
      }

      else
      {
        id v101 = 0LL;
        id v107 = a7;
        double v108 = v222;
        double v109 = v216;
      }

      double v110 = v95 + -0.075000003;
      double v111 = v96 - v97;
      double v112 = v98 + -0.075000003;
      double v113 = v99 - v97;
      double v224 = v190 * 0.200000003;
      double v221 = v188 * 0.200000003;
      double v114 = v192 * 0.200000003;
      double v115 = v82 * 0.200000003;
      double v116 = v225 - v109;
      double v117 = v93 - v108;
      double v118 = v201 - v217;
      double v119 = v195 - v210;
      double v120 = v94 * 1.25;
      float v121 = v94 * 1.25;
      unsigned int v122 = vcvtms_u32_f32(v121);
      double v123 = v94 * 1.25 - (double)v122;
      unsigned int v206 = v87;
      double v209 = v123;
      if (v45)
      {
        double v226 = v110;
        double v214 = v111;
        double v202 = v112;
        double v196 = v113;
        double v189 = v117;
        double v191 = v82 * 0.200000003;
        double v183 = v119;
        id v124 = [v45 retainedByUserImage];
        float v125 = v123 * -0.523598776;
        __float2 v126 = __sincosf_stret(v125);
        [v124 setCenterX:(float)(1.0 - v126.__cosval)];
        [v124 setCenterY:(float)(v126.__sinval * -6.0)];
        [v124 setRotationAngle:-(v123 * -0.523598776)];
        [v124 setScale:0.5];
        double v119 = v183;
        double v117 = v189;
        double v115 = v191;
        double v114 = v192 * 0.200000003;
        double v113 = v196;
        double v112 = v202;
        double v111 = v214;
        double v110 = v226;
      }

      else
      {
        id v124 = 0LL;
      }

      double v127 = v110 * 0.200000003;
      double v128 = v111 * 0.200000003;
      double v129 = v112 * 0.200000003;
      double v130 = v113 * 0.200000003;
      double v131 = v114 - v224;
      double v132 = v115 - v221;
      double v133 = v216 + v116 * v219;
      double v211 = v210 + v119 * v219;
      double v215 = v222 + v117 * v219;
      double v218 = v217 + v118 * v219;
      if (v46)
      {
        double v193 = v115 - v221;
        double v197 = v114 - v224;
        double v203 = v113 * 0.200000003;
        double v227 = v112 * 0.200000003;
        double v134 = v216 + v116 * v219;
        double v135 = (float)((float)floorf(v121) + 1.0);
        double v136 = v184 * -0.25;
        double v137 = v135 - v120;
        id v46 = [v46 retainedByUserImage];
        if (v122 != 1) {
          double v136 = v137;
        }
        float v138 = v136 * 0.523598776;
        __float2 v139 = __sincosf_stret(v138);
        [v46 setCenterX:(float)(1.0 - v139.__cosval)];
        [v46 setCenterY:(float)(v139.__sinval * -6.0)];
        [v46 setRotationAngle:-(v136 * 0.523598776)];
        [v46 setScale:0.5];
        [v46 centerY];
        double v141 = v219;
        if (v140 > 0.0)
        {
          [v46 centerY];
          [v46 setCenterY:(1.0 - v219) * v142];
          [v46 rotationAngle];
          [v46 setRotationAngle:(1.0 - v219) * v143];
        }

        double v144 = v186;
        double v145 = v127;
        double v146 = v128;
        double v133 = v134;
        double v129 = v227;
        double v130 = v203;
        double v132 = v193;
        double v131 = v197;
      }

      else
      {
        double v141 = v219;
        double v144 = v186;
        double v145 = v127;
        double v146 = v128;
      }

      double v204 = v129 - v145;
      double v228 = v130 - v146;
      double v194 = v221 + v132 * v141;
      double v198 = v224 + v131 * v141;
      id v147 = [*(id *)((char *)&self->mWeatherWindowMask + 1) retainedByUserRenderedImageAtTime:a8 inContext:v107 withArguments:v200];
      [a8 unsetShader];
      [a8 blend:2];
      if (v124) {
        double v148 = @"WeatherWindow";
      }
      else {
        double v148 = @"DateWindowSingle";
      }
      [a8 setShader:v148];
      double v149 = v133 + v133;
      double v150 = v215 + v215;
      id v151 = objc_alloc(&OBJC_CLASS___MRCroppingSprite);
      LODWORD(v152) = 0;
      float v153 = -[MRCroppingSprite initWithPosition:size:zRotation:context:]( v151,  "initWithPosition:size:zRotation:context:",  a8,  v224,  v221,  v216,  v222,  v152);
      HIDWORD(v154) = HIDWORD(v199);
      *(float *)&double v154 = v199;
      if (v206 == 1) {
        *(float *)&double v154 = 1.0;
      }
      [a8 setShaderUniformFloat:@"mixFactor" forKey:v154];
      double v155 = v149 / v150 * v144;
      float v156 = v155;
      if (v185)
      {
        *(float *)&double v155 = v155;
        [a8 setImage:v101 onTextureUnit:1 withReferenceAspectRatio:v230 state:v155];
        *(float *)&double v157 = v156;
        [a8 setImage:v147 onTextureUnit:2 withReferenceAspectRatio:&v229 state:v157];
        LODWORD(v158) = 0;
        -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v153,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v185,  a8,  v198,  v194,  v149,  v150,  v158);
        [a8 unsetImage:v147 onTextureUnit:2 state:&v229];
        [a8 unsetImage:v101 onTextureUnit:1 state:v230];
        double v159 = v209;
        double v161 = v211 + v211;
        double v160 = v218 + v218;
        double v162 = v204;
        if (v124)
        {
LABEL_63:
          double v164 = v145 + v162 * v141;
          HIDWORD(v166) = HIDWORD(v228);
          double v165 = v146 + v228 * v141;
          *(float *)&double v166 = v159;
          if (v122 == 1) {
            *(float *)&double v166 = 1.0;
          }
          [a8 setShaderUniformFloat:@"mixFactor" forKey:v166];
          double v167 = v160 / v161 * v144;
          float v168 = v167;
          if (v46)
          {
            *(float *)&double v167 = v167;
            [a8 setImage:v46 onTextureUnit:1 withReferenceAspectRatio:v230 state:v167];
            *(float *)&double v169 = v168;
            [a8 setImage:v147 onTextureUnit:2 withReferenceAspectRatio:&v229 state:v169];
            if (v124) {
              id v171 = v124;
            }
            else {
              id v171 = v46;
            }
            LODWORD(v170) = 0;
            -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v153,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v171,  a8,  v164,  v165,  v160,  v161,  v170);
            [a8 unsetImage:v147 onTextureUnit:2 state:&v229];
            double v172 = v230;
            id v173 = a8;
            id v174 = v46;
          }

          else
          {
            *(float *)&double v167 = v167;
            [a8 setImage:v147 onTextureUnit:1 withReferenceAspectRatio:&v229 state:v167];
            if (v124) {
              id v176 = v124;
            }
            else {
              id v176 = 0LL;
            }
            LODWORD(v175) = 0;
            -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v153,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v176,  a8,  v164,  v165,  v160,  v161,  v175);
            double v172 = &v229;
            id v173 = a8;
            id v174 = v147;
          }

          [v173 unsetImage:v174 onTextureUnit:1 state:v172];
          [a8 blend:0];

          [v147 releaseByUser];
          [v101 releaseByUser];
          [v185 releaseByUser];
          [v46 releaseByUser];
          [v124 releaseByUser];
          return;
        }
      }

      else
      {
        *(float *)&double v155 = v155;
        [a8 setImage:v147 onTextureUnit:1 withReferenceAspectRatio:&v229 state:v155];
        LODWORD(v163) = 0;
        -[MRCroppingSprite renderImageInner:inContext:atPosition:andSize:zRotation:]( v153,  "renderImageInner:inContext:atPosition:andSize:zRotation:",  v101,  a8,  v198,  v194,  v149,  v150,  v163);
        [a8 unsetImage:v147 onTextureUnit:1 state:&v229];
        double v159 = v209;
        double v161 = v211 + v211;
        double v160 = v218 + v218;
        double v162 = v204;
      }

      [a8 unsetShader];
      [a8 setShader:v148];
      goto LABEL_63;
    }
  }

- (id)elementHitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  float v10 = *(void **)(&self->super._isInInteractiveMode + 1);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    id v13 = 0LL;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        BOOL v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v17 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:v16];
        if (v17 && objc_msgSend(v17, "hitAtPoint:withInverseMatrix:localPoint:", a4, &v20, x, y))
        {
          if (!v13)
          {
            if (a5) {
LABEL_16:
            }
              *a5 = v20;
            id v13 = v16;
            continue;
          }

          if ([v16 compare:v13] == (char *)&dword_0 + 1)
          {
            id v13 = v16;
            BOOL v18 = a5 == 0LL;
          }

          else
          {
            BOOL v18 = 1;
          }

          if (!v18) {
            goto LABEL_16;
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v12) {
        return v13;
      }
    }
  }

  return 0LL;
}

- (BOOL)getVerticesCoordinates:(MREffectDateline *)self withMatrix:(SEL)a2 forElement:(CGPoint *)(a3
{
  id v7 = [*(id *)(&self->super._isInInteractiveMode + 1) objectForKey:a5];
  if (v7) {
    LOBYTE(v7) = [v7 getVerticesCoordinates:a3 withMatrix:a4];
  }
  return (char)v7;
}

- (void)_cleanUpDictionary:(id)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(a3);
        }
        id v9 = [a3 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * (void)v8)];
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___MRImage, v10);
        if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
        {
          [v9 removingFromCollection];
        }

        else
        {
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSValue, v12);
          if ((objc_opt_isKindOfClass(v9, v13) & 1) == 0) {
            -[MREffectDateline _cleanUpDictionary:](self, "_cleanUpDictionary:", v9);
          }
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  [a3 removeAllObjects];
}

- (id)_retainedByUserTextImageForString:(id)a3 type:(int64_t)a4 inContext:(id)a5
{
  return -[MREffectDateline _retainedByUserTextImageForString:string2:type:inContext:firstLine:lastLine:]( self,  "_retainedByUserTextImageForString:string2:type:inContext:firstLine:lastLine:",  a3,  0LL,  a4,  a5,  &v6,  v7);
}

- (id)_retainedByUserTextImageForString:(id)a3 string2:(id)a4 type:(int64_t)a5 inContext:(id)a6 firstLine:(CGRect *)a7 lastLine:(CGRect *)a8
{
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
  id v14 = -[NSDictionary objectForKey:](self->super.mAttributes, "objectForKey:", @"PresetID");
  [a6 localAspectRatio];
  float v16 = v15;
  id v17 = +[MPEffectManager sharedManager](&OBJC_CLASS___MPEffectManager, "sharedManager");
  mEffectID = self->super.mEffectID;
  if (a5 == 100)
  {
    id v19 =  objc_msgSend( objc_msgSend( v17,  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  mEffectID,  v14,  2,  0),  "mutableCopy");
    objc_msgSend(v19, "replaceCharactersInRange:withString:", 0, objc_msgSend(v19, "length"), a3);
    id v20 =  objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  self->super.mEffectID,  v14,  9,  0),  "mutableCopy");
    objc_msgSend(v20, "replaceCharactersInRange:withString:", 0, objc_msgSend(v20, "length"), a4);
    [v19 appendAttributedString:v20];
  }

  else
  {
    id v19 =  objc_msgSend( objc_msgSend( v17,  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  mEffectID,  v14,  a5,  0),  "mutableCopy");
    objc_msgSend(v19, "replaceCharactersInRange:withString:", 0, objc_msgSend(v19, "length"), a3);
  }

  p_mPixelSize = &self->super.mPixelSize;
  -[MRTextRenderer setResolution:]( v13,  "setResolution:",  self->super.mPixelSize.width,  self->super.mPixelSize.height,  a8);
  double width = self->super.mPixelSize.width;
  double height = self->super.mPixelSize.height;
  if (a5 != 5)
  {
    uint64_t v24 = 1LL;
    switch(a5)
    {
      case 0LL:
        if (width >= height) {
          double v25 = p_mPixelSize->width;
        }
        else {
          double v25 = self->super.mPixelSize.height;
        }
        if (BYTE3(self->mSlideInformation)) {
          double width = v25 * 0.800000012;
        }
        else {
          double width = v25;
        }
        uint64_t v24 = 2LL;
        goto LABEL_32;
      case 1LL:
        if (width < height) {
          double width = self->super.mPixelSize.height;
        }
        goto LABEL_6;
      case 2LL:
      case 3LL:
      case 4LL:
      case 9LL:
        goto LABEL_32;
      case 6LL:
        if (v16 >= 1.0)
        {
          double width = height * 0.699999988;
          uint64_t v24 = 14LL;
        }

        else
        {
          objc_msgSend(a6, "localAspectRatio", 1);
          double height = width * 0.800000012 * v26 / 1.33333337;
          [a6 localAspectRatio];
          uint64_t v24 = 11LL;
          double width = height / v27;
        }

        goto LABEL_32;
      case 7LL:
        objc_msgSend(a6, "localAspectRatio", 1);
        if (v28 >= 0.6)
        {
          double height = self->super.mPixelSize.height;
          double width = height * 0.800000012;
        }

        else
        {
          double width = p_mPixelSize->width * 0.600000024;
          double height = self->super.mPixelSize.height * 0.5;
        }

        [a6 localAspectRatio];
        BOOL v31 = v30 < 0.6;
        float v32 = 2.0;
        float v33 = 4.0;
        goto LABEL_29;
      case 8LL:
        objc_msgSend(a6, "localAspectRatio", 1);
        if (v29 >= 0.6)
        {
          double height = self->super.mPixelSize.height;
          double width = height * 0.75;
        }

        else
        {
          double width = p_mPixelSize->width * 0.600000024;
          double height = self->super.mPixelSize.height * 0.699999988;
        }

        [a6 localAspectRatio];
        BOOL v31 = v34 < 0.6;
        float v32 = 7.0;
        float v33 = 12.0;
LABEL_29:
        if (v31) {
          float v32 = v33;
        }
        uint64_t v24 = (uint64_t)v32;
        goto LABEL_32;
      default:
        goto LABEL_33;
    }
  }

  double width = width * 0.899999976;
LABEL_6:
  uint64_t v24 = 1LL;
LABEL_32:
  -[MRTextRenderer setMaxNumberOfLines:](v13, "setMaxNumberOfLines:", v24);
LABEL_33:
  -[MRTextRenderer setTruncate:](v13, "setTruncate:", 1LL);
  -[MRTextRenderer setDefinedSize:](v13, "setDefinedSize:", width, height);
  -[MRTextRenderer setText:](v13, "setText:", v19);
  -[MRLayerEffect _rendererSize](self->super.mEffectLayer, "_rendererSize");
  +[MRRenderer textScaleForResolution:](&OBJC_CLASS___MRRenderer, "textScaleForResolution:");
  -[MRTextRenderer setScale:](v13, "setScale:");
  -[MRTextRenderer setInset:](v13, "setInset:", 1.0, 1.0);
  if (a5 == 5)
  {
    -[MRTextRenderer setRenderAtDefinedSize:](v13, "setRenderAtDefinedSize:", 0LL);
  }

  else
  {
    -[MRTextRenderer sizeOfText](v13, "sizeOfText");
    -[MRTextRenderer setDefinedSize:](v13, "setDefinedSize:");
    -[MRTextRenderer setRenderAtDefinedSize:](v13, "setRenderAtDefinedSize:", 1LL);
    if (a5 == 6)
    {
      id v35 = -[MRTextRenderer numberOfLines](v13, "numberOfLines");
      uint64_t v36 = 13LL;
      if (v16 < 1.0) {
        uint64_t v36 = 10LL;
      }
      else {
        double v37 = v35 - 1;
      }
      -[MRTextRenderer tightFrameOfLineAtIndex:](v13, "tightFrameOfLineAtIndex:", v37);
      *double v51 = v38;
      v51[1] = v39;
      v51[2] = v40;
      v51[3] = v41;
      -[MRTextRenderer tightFrameOfLineAtIndex:](v13, "tightFrameOfLineAtIndex:", 0LL);
      a7->origin.double x = v42;
      a7->origin.double y = v43;
      a7->size.double width = v44;
      a7->size.double height = v45;
    }
  }

  id v46 = -[MRTextRenderer retainedContext](v13, "retainedContext");
  if (v46)
  {
    double v47 = v46;
    id v48 = objc_msgSend(objc_msgSend(a6, "imageManager"), "retainedByUserImageWithCGContext:", v46);
    [v48 setLabel:@"Marimba Dateline Text"];
    CGContextRelease(v47);
  }

  else
  {
    id v48 = 0LL;
  }

  return v48;
}

- (void)_addTextImage:(id)a3 forKey:(id)a4 inDictionary:(id)a5
{
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = [*(id *)((char *)&self->mBreakInformation + 1) objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v9) beginLiveUpdate];
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v7);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = objc_msgSend(*(id *)((char *)&self->mIndicies + 1), "objectEnumerator", 0);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) beginLiveUpdate];
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v12);
  }

  BYTE1(self->mSlideInformation) = 0;
  BYTE2(self->mSlideInformation) = 1;
}

- (void)endMorphing
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v3 = [*(id *)((char *)&self->mIndicies + 1) objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v7) endLiveUpdate];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v5);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = objc_msgSend(*(id *)((char *)&self->mBreakInformation + 1), "objectEnumerator", 0);
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) endLiveUpdate];
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v10);
  }

  BYTE2(self->mSlideInformation) = 0;
}

- (void)_unloadTextForChapter:(int64_t)a3
{
  id v4 = NSStringWithInteger("chapter", a3);
  id v5 = [*(id *)((char *)&self->mText + 1) objectForKey:v4];
  if (v5)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v6 = objc_msgSend(v5, "objectEnumerator", 0);
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) removingFromCollection];
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v8);
    }

    [*(id *)((char *)&self->mText + 1) removeObjectForKey:v4];
    id v11 = [*(id *)((char *)&self->mChapters + 1) objectForKey:v4];
    if (v11)
    {
      -[MREffectDateline _cleanUpDictionary:](self, "_cleanUpDictionary:", v11);
      [*(id *)((char *)&self->mChapters + 1) removeObjectForKey:v4];
    }
  }

- (void)_loadTextForChapter:(int64_t)a3 context:(id)a4
{
  id v7 = NSStringWithInteger("chapter", a3);
  if (![*(id *)((char *)&self->mChapters + 1) objectForKey:v7])
  {
    unsigned int v52 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", @"hourBased"),  "BOOLValue");
    int64_t v53 = a3;
    id v8 = [*(id *)((char *)&self->mChapterDurations + 1) objectAtIndex:a3];
    id v9 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    id v10 = [v8 objectForKey:@"title"];
    if (v10)
    {
      id v11 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( self,  "_retainedByUserTextImageForString:type:inContext:",  v10,  7LL,  a4);
      if (v11)
      {
        __int128 v12 = v11;
        -[MREffectDateline _addTextImage:forKey:inDictionary:]( self,  "_addTextImage:forKey:inDictionary:",  v11,  @"title",  v9);
        [v12 releaseByUser];
      }
    }

    double v56 = v7;
    id v13 = [v8 objectForKey:@"subtitle"];
    if (v13)
    {
      id v14 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( self,  "_retainedByUserTextImageForString:type:inContext:",  v13,  8LL,  a4);
      if (v14)
      {
        __int128 v15 = v14;
        -[MREffectDateline _addTextImage:forKey:inDictionary:]( self,  "_addTextImage:forKey:inDictionary:",  v14,  @"subtitle",  v9);
        [v15 releaseByUser];
      }
    }

    double v54 = v9;
    id v58 = a4;
    double v59 = self;
    id v57 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    double v55 = v8;
    id v16 = [v8 objectForKey:@"items"];
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v17 = [v16 countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = 0LL;
      uint64_t v20 = *(void *)v63;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v63 != v20) {
            objc_enumerationMutation(v16);
          }
          __int128 v22 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
          id v23 = [v22 objectForKey:@"type"];
          if ([v23 isEqualToString:@"photo"])
          {
            id v24 = [v22 objectForKey:@"caption"];
            if (v24)
            {
              id v25 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( v59,  "_retainedByUserTextImageForString:type:inContext:",  v24,  5LL,  v58);
              if (v25)
              {
                float v26 = v25;
                -[MREffectDateline _addTextImage:forKey:inDictionary:]( v59,  "_addTextImage:forKey:inDictionary:",  v25,  NSStringWithInteger("text", (unint64_t)i + v19),  v57);
LABEL_21:
                [v26 releaseByUser];
                continue;
              }
            }
          }

          else if ([v23 isEqualToString:@"text"])
          {
            id v27 = [v22 objectForKey:@"string"];
            if (v27)
            {
              id v28 = -[MREffectDateline _retainedByUserTextImageForString:string2:type:inContext:firstLine:lastLine:]( v59,  "_retainedByUserTextImageForString:string2:type:inContext:firstLine:lastLine:",  v27,  0LL,  6LL,  v58,  v61,  v60);
              if (v28)
              {
                float v26 = v28;
                -[MREffectDateline _addTextImage:forKey:inDictionary:]( v59,  "_addTextImage:forKey:inDictionary:",  v28,  NSStringWithInteger("text", (unint64_t)i + v19),  v57);
                objc_msgSend( v57,  "setObject:forKey:",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v61[0], v61[1], v61[2], v61[3]),  NSStringWithInteger("firstTextRect", (unint64_t)i + v19));
                objc_msgSend( v57,  "setObject:forKey:",  +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v60[0], v60[1], v60[2], v60[3]),  NSStringWithInteger("lastTextRect", (unint64_t)i + v19));
                goto LABEL_21;
              }
            }
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v62 objects:v66 count:16];
        v19 += (uint64_t)i;
      }

      while (v18);
    }

    [v54 setObject:v57 forKey:@"items"];
    float v29 = v59;
    [*(id *)((char *)&v59->mChapters + 1) setObject:v54 forKey:v7];
    id v30 = [v55 objectForKey:@"date"];
    id v31 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    if (v30)
    {
      [v30 doubleValue];
      float v32 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
      float v33 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      float v34 = v33;
      if (v52) {
        id v35 = @"dd";
      }
      else {
        id v35 = @"EEE";
      }
      -[NSDateFormatter setDateFormat:](v33, "setDateFormat:", v35);
      uint64_t v36 = -[NSString uppercaseString]( -[NSDateFormatter stringFromDate:](v34, "stringFromDate:", v32),  "uppercaseString");
      if (v36)
      {
        double v37 = v36;
        id v38 = [*(id *)((char *)&v59->mWeatherImages + 1) objectForKey:v36];
        if (v38
          || (id v38 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( v59,  "_retainedByUserTextImageForString:type:inContext:",  v37,  3,  v58),  [v38 insertingInCollection],  objc_msgSend(*(id *)((char *)&v59->mWeatherImages + 1), "setObject:forKey:", v38, v37),  objc_msgSend(v38, "releaseByUser"),  v38))
        {
          -[MREffectDateline _addTextImage:forKey:inDictionary:]( v59,  "_addTextImage:forKey:inDictionary:",  v38,  @"weekday",  v31);
        }

        if (!v53)
        {
          id v39 = -[NSDate copy](v32, "copy");
          uint64_t v40 = &dword_18;
          do
          {
            id v39 = [v39 dateByAddingTimeInterval:-86400.0];
            uint64_t v41 = -[NSDateFormatter stringFromDate:](v34, "stringFromDate:", v39);
            id v42 = [*(id *)((char *)&v59->mWeatherImages + 1) objectForKey:v41];
            if (v42
              || (id v42 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( v59,  "_retainedByUserTextImageForString:type:inContext:",  v41,  3,  v58),  [v42 insertingInCollection],  objc_msgSend(*(id *)((char *)&v59->mWeatherImages + 1), "setObject:forKey:", v42, v41),  objc_msgSend(v42, "releaseByUser"),  v42))
            {
              -[MREffectDateline _addTextImage:forKey:inDictionary:]( v59,  "_addTextImage:forKey:inDictionary:",  v42,  *(__CFString **)((char *)off_258A88 + v40),  v31);
            }

            v40 -= 8LL;
          }

          while (v40);
        }
      }

      -[NSDateFormatter setDateFormat:](v34, "setDateFormat:", @"MMM");
      CGFloat v43 = -[NSString uppercaseString]( -[NSDateFormatter stringFromDate:](v34, "stringFromDate:", v32),  "uppercaseString");
      if (v43)
      {
        CGFloat v44 = v43;
        id v45 = [*(id *)((char *)&v59->mWeatherImages + 1) objectForKey:v43];
        if (v45
          || (id v45 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( v59,  "_retainedByUserTextImageForString:type:inContext:",  v44,  4,  v58),  [v45 insertingInCollection],  objc_msgSend(*(id *)((char *)&v59->mWeatherImages + 1), "setObject:forKey:", v45, v44),  objc_msgSend(v45, "releaseByUser"),  v45))
        {
          -[MREffectDateline _addTextImage:forKey:inDictionary:]( v59,  "_addTextImage:forKey:inDictionary:",  v45,  @"month",  v31);
        }

        if (!v53)
        {
          id v46 = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
          double v47 = (NSDate *)-[NSDate copy](v32, "copy");
          uint64_t v48 = &dword_18;
          do
          {
            double v49 = -[NSCalendar components:fromDate:](v46, "components:fromDate:", 28LL, v47);
            -[NSDateComponents setMonth:](v49, "setMonth:", (char *)-[NSDateComponents month](v49, "month") - 1);
            double v47 = -[NSCalendar dateFromComponents:](v46, "dateFromComponents:", v49);
            double v50 = -[NSDateFormatter stringFromDate:](v34, "stringFromDate:", v47);
            id v51 = [*(id *)((char *)&v59->mWeatherImages + 1) objectForKey:v50];
            if (v51
              || (id v51 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( v59,  "_retainedByUserTextImageForString:type:inContext:",  v50,  4,  v58),  [v51 insertingInCollection],  objc_msgSend(*(id *)((char *)&v59->mWeatherImages + 1), "setObject:forKey:", v51, v50),  objc_msgSend(v51, "releaseByUser"),  v51))
            {
              -[MREffectDateline _addTextImage:forKey:inDictionary:]( v59,  "_addTextImage:forKey:inDictionary:",  v51,  *(__CFString **)((char *)off_258A68 + v48),  v31);
            }

            v48 -= 8LL;
          }

          while (v48);
        }
      }

      float v29 = v59;
      id v7 = v56;
    }

    [*(id *)((char *)&v29->mText + 1) setObject:v31 forKey:v7];
  }

- (void)_loadDateForChapter:(int64_t)a3 context:(id)a4
{
  id v7 = NSStringWithInteger("chapter", a3);
  if (![*(id *)((char *)&self->mChapterDates + 1) objectForKey:v7])
  {
    unsigned int v8 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", @"hourBased"),  "BOOLValue");
    id v9 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->mChapterDurations + 1), "objectAtIndex:", a3),  "objectForKey:",  @"date");
    id v10 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    if (v9)
    {
      [v9 doubleValue];
      id v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
      __int128 v12 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      id v42 = v7;
      if (v8)
      {
        if (+[MREffectDateline _timeIs24HourFormat](&OBJC_CLASS___MREffectDateline, "_timeIs24HourFormat"))
        {
          -[NSDateFormatter setDateFormat:]( v12,  "setDateFormat:",  +[NSDateFormatter dateFormatFromTemplate:options:locale:]( &OBJC_CLASS___NSDateFormatter,  "dateFormatFromTemplate:options:locale:",  @"HH:m",  0LL,  +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale")));
          id v13 = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
          id v14 = -[NSCalendar components:fromDate:]( +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"),  "components:fromDate:",  126LL,  v11);
          -[NSDateComponents setMinute:](v14, "setMinute:", 0LL);
          __int128 v15 = -[NSCalendar dateFromComponents:](v13, "dateFromComponents:", v14);
          id v16 = -[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v15);
          id v17 = [*(id *)((char *)&self->mWeatherImages + 1) objectForKey:v16];
          if (v17
            || (id v17 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( self,  "_retainedByUserTextImageForString:type:inContext:",  v16,  2,  a4),  [v17 insertingInCollection],  objc_msgSend(*(id *)((char *)&self->mWeatherImages + 1), "setObject:forKey:", v17, v16),  objc_msgSend(v17, "releaseByUser"),  v17))
          {
            -[MREffectDateline _addTextImage:forKey:inDictionary:]( self,  "_addTextImage:forKey:inDictionary:",  v17,  @"day",  v10);
          }

          id v18 = -[NSDate copy](v15, "copy");
          uint64_t v19 = &dword_18;
          do
          {
            id v18 = [v18 dateByAddingTimeInterval:-3600.0];
            uint64_t v20 = -[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v18);
            id v21 = [*(id *)((char *)&self->mWeatherImages + 1) objectForKey:v20];
            if (v21
              || (id v21 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( self,  "_retainedByUserTextImageForString:type:inContext:",  v20,  2,  a4),  [v21 insertingInCollection],  objc_msgSend(*(id *)((char *)&self->mWeatherImages + 1), "setObject:forKey:", v21, v20),  objc_msgSend(v21, "releaseByUser"),  v21))
            {
              -[MREffectDateline _addTextImage:forKey:inDictionary:]( self,  "_addTextImage:forKey:inDictionary:",  v21,  *(__CFString **)((char *)off_258A48 + v19),  v10);
            }

            v19 -= 8LL;
          }

          while (v19);
        }

        else
        {
          id v41 = a4;
          -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", @"h");
          float v29 = -[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v11);
          -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", @"aaa");
          id v30 = -[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v11);
          if (v29) {
            BOOL v31 = v30 == 0LL;
          }
          else {
            BOOL v31 = 1;
          }
          if (!v31)
          {
            float v32 = v30;
            float v33 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v29, v30);
            id v34 = [*(id *)((char *)&self->mWeatherImages + 1) objectForKey:v33];
            if (v34
              || (id v34 = -[MREffectDateline _retainedByUserTextImageForString:string2:type:inContext:firstLine:lastLine:]( self,  "_retainedByUserTextImageForString:string2:type:inContext:firstLine:lastLine:",  v29,  v32,  100,  v41,  v44,  v43),  [v34 insertingInCollection],  objc_msgSend(*(id *)((char *)&self->mWeatherImages + 1), "setObject:forKey:", v34, v33),  objc_msgSend(v34, "releaseByUser"),  v34))
            {
              -[MREffectDateline _addTextImage:forKey:inDictionary:]( self,  "_addTextImage:forKey:inDictionary:",  v34,  @"day",  v10);
            }

            id v35 = -[NSDate copy](v11, "copy");
            uint64_t v36 = &dword_18;
            do
            {
              id v35 = [v35 dateByAddingTimeInterval:-3600.0];
              -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", @"h");
              double v37 = -[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v35);
              -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", @"aaa");
              id v38 = -[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v35);
              id v39 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v37, v38);
              id v40 = [*(id *)((char *)&self->mWeatherImages + 1) objectForKey:v39];
              if (v40
                || (id v40 = -[MREffectDateline _retainedByUserTextImageForString:string2:type:inContext:firstLine:lastLine:]( self,  "_retainedByUserTextImageForString:string2:type:inContext:firstLine:lastLine:",  v37,  v38,  100,  v41,  v44,  v43),  [v40 insertingInCollection],  objc_msgSend(*(id *)((char *)&self->mWeatherImages + 1), "setObject:forKey:", v40, v39),  objc_msgSend(v40, "releaseByUser"),  v40))
              {
                -[MREffectDateline _addTextImage:forKey:inDictionary:]( self,  "_addTextImage:forKey:inDictionary:",  v40,  *(__CFString **)((char *)off_258A48 + v36),  v10);
              }

              v36 -= 8LL;
            }

            while (v36);
          }
        }
      }

      else
      {
        -[NSDateFormatter setDateFormat:]( v12,  "setDateFormat:",  +[NSDateFormatter dateFormatFromTemplate:options:locale:]( &OBJC_CLASS___NSDateFormatter,  "dateFormatFromTemplate:options:locale:",  @"dd",  0LL,  +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale")));
        __int128 v22 = -[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v11);
        if (v22)
        {
          id v23 = v22;
          id v24 = [*(id *)((char *)&self->mWeatherImages + 1) objectForKey:v22];
          if (v24
            || (id v24 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( self,  "_retainedByUserTextImageForString:type:inContext:",  v23,  2,  a4),  [v24 insertingInCollection],  objc_msgSend(*(id *)((char *)&self->mWeatherImages + 1), "setObject:forKey:", v24, v23),  objc_msgSend(v24, "releaseByUser"),  v24))
          {
            -[MREffectDateline _addTextImage:forKey:inDictionary:]( self,  "_addTextImage:forKey:inDictionary:",  v24,  @"day",  v10);
          }

          id v25 = -[NSDate copy](v11, "copy");
          uint64_t v26 = &dword_18;
          do
          {
            id v25 = [v25 dateByAddingTimeInterval:-86400.0];
            id v27 = -[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v25);
            id v28 = [*(id *)((char *)&self->mWeatherImages + 1) objectForKey:v27];
            if (v28
              || (id v28 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( self,  "_retainedByUserTextImageForString:type:inContext:",  v27,  2,  a4),  [v28 insertingInCollection],  objc_msgSend(*(id *)((char *)&self->mWeatherImages + 1), "setObject:forKey:", v28, v27),  objc_msgSend(v28, "releaseByUser"),  v28))
            {
              -[MREffectDateline _addTextImage:forKey:inDictionary:]( self,  "_addTextImage:forKey:inDictionary:",  v28,  *(__CFString **)((char *)off_258A48 + v26),  v10);
            }

            v26 -= 8LL;
          }

          while (v26);
        }
      }

      id v7 = v42;
    }

    [*(id *)((char *)&self->mChapterDates + 1) setObject:v10 forKey:v7];
  }

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  id v9 = (char *)objc_msgSend(*(id *)((char *)&self->mChapterDurations + 1), "count", a4, a5, a6);
  int64_t v10 = -[MREffectDateline _chapterIndexForTime:](self, "_chapterIndexForTime:", a3);
  id v11 = v9 - 1;
  else {
    __int128 v12 = (char *)v10;
  }
  int64_t v13 = v10;
  id v14 = [*(id *)((char *)&self->mChapterDurations + 1) objectAtIndex:v12];
  -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v12);
  double v16 = v15;
  double v17 = v15 + 1.0;
  if (v12) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = v17 <= a3;
  }
  if (!v18) {
    return !a4;
  }
  if (objc_msgSend(v14, "objectForKey:", @"title", v17)) {
    double v19 = 9.0;
  }
  else {
    double v19 = 4.0;
  }
  id v20 = [v14 objectForKey:@"items"];
  double v21 = a3 - v16;
  if (v21 < v19)
  {
    if (!a4) {
      return [v20 count] != 0;
    }
    return 1;
  }

  if (a4) {
    return 1;
  }
  objc_msgSend(objc_msgSend(objc_msgSend(v20, "lastObject"), "objectForKey:", @"startTime"), "doubleValue");
  return v21 < v23 || v13 < (uint64_t)v11;
}

- (double)interestingTimeForTime:(double)a3
{
  id v5 = (char *)[*(id *)((char *)&self->mChapterDurations + 1) count];
  int64_t v6 = -[MREffectDateline _chapterIndexForTime:](self, "_chapterIndexForTime:", a3);
  else {
    id v7 = (char *)v6;
  }
  double v8 = 3.0;
  if (v7 != (char *)-1LL)
  {
    id v9 = [*(id *)((char *)&self->mChapterDurations + 1) objectAtIndex:v7];
    -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v7);
    double v11 = v10 + 0.001;
    if (v7 || v11 + 1.0 <= a3)
    {
      if ([v9 objectForKey:@"title"]) {
        double v12 = 9.0;
      }
      else {
        double v12 = 4.0;
      }
      id v13 = [v9 objectForKey:@"items"];
      double v14 = a3 - v11;
      if (v14 >= v12)
      {
        double v16 = v13;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        id v17 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = 0LL;
          uint64_t v20 = *(void *)v28;
          double v8 = v11;
LABEL_16:
          uint64_t v21 = 0LL;
          uint64_t v22 = -v19;
          v19 += (uint64_t)v18;
          while (1)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v16);
            }
            objc_msgSend( objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v21), "objectForKey:", @"startTime"),  "doubleValue");
            double v24 = v22 == v21 ? 0.0 : 1.0;
            double v25 = v24 + v23;
            if (v14 < v25) {
              break;
            }
            double v8 = v11 + v25;
            if (v18 == (id)++v21)
            {
              id v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
              if (v18) {
                goto LABEL_16;
              }
              return v8;
            }
          }
        }

        else
        {
          return v11;
        }
      }

      else
      {
        double v15 = 0.0;
        if (!v7) {
          double v15 = 1.0;
        }
        return v15 + v11;
      }
    }
  }

  return v8;
}

- (double)interestingTimeForElement:(id)a3
{
  unsigned int v4 = objc_msgSend(objc_msgSend(a3, "substringFromIndex:", 5), "intValue");
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v5 = *(NSMutableArray **)((char *)&self->mChapterDurations + 1);
  int64_t v6 = (char *)[v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  double v7 = 3.0;
  if (v6)
  {
    __int128 v29 = self;
    double v8 = 0LL;
    uint64_t v9 = *(void *)v36;
    uint64_t v26 = *(void *)v36;
    __int128 v27 = v5;
    do
    {
      double v10 = 0LL;
      double v25 = &v6[(void)v8];
      __int128 v28 = v6;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v10);
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v12 = objc_msgSend(v11, "objectForKey:", @"items", v25);
        id v13 = (char *)[v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13)
        {
          double v14 = v13;
          double v15 = 0LL;
          uint64_t v16 = *(void *)v32;
          while (2)
          {
            id v17 = 0LL;
            __int128 v30 = &v14[(void)v15];
            do
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v12);
              }
              id v18 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v17);
              if (v4 == objc_msgSend(objc_msgSend(v18, "objectForKey:", @"photoIndex"), "intValue"))
              {
                objc_msgSend(objc_msgSend(v18, "objectForKey:", @"startTime"), "doubleValue");
                double v20 = v19;
                -[MREffectDateline _startTimeForChapter:](v29, "_startTimeForChapter:", v8);
                double v22 = v20 + v21;
                double v23 = 1.0;
                if (!&v17[(void)v15]) {
                  double v23 = 0.0;
                }
                return v23 + v22;
              }

              ++v17;
            }

            while (v14 != v17);
            double v14 = (char *)[v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
            double v15 = v30;
            if (v14) {
              continue;
            }
            break;
          }
        }

        ++v8;
        ++v10;
        id v5 = v27;
        uint64_t v9 = v26;
      }

      while (v10 != v28);
      int64_t v6 = (char *)[v27 countByEnumeratingWithState:&v35 objects:v40 count:16];
      double v8 = v25;
    }

    while (v6);
  }

  return v7;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  double v11 = (char *)[*(id *)((char *)&self->mChapterDurations + 1) count];
  int64_t v12 = -[MREffectDateline _chapterIndexForTime:](self, "_chapterIndexForTime:", a6);
  else {
    id v13 = (char *)v12;
  }
  if (v13 == (char *)-1LL)
  {
    -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", 0LL);
    double v25 = v24 + -3.0;
    goto LABEL_18;
  }

  id v14 = [*(id *)((char *)&self->mChapterDurations + 1) objectAtIndex:v13];
  -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v13);
  double v16 = v15;
  double v17 = v15 + 1.0;
  if (v13) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = v17 <= a6;
  }
  if (!v18)
  {
    double v25 = v16 + -3.0;
LABEL_18:
    double v26 = -1.0;
LABEL_19:
    double v23 = v25 + v26;
    double v22 = 2.0;
    goto LABEL_20;
  }

  if (objc_msgSend(v14, "objectForKey:", @"title", v17)) {
    double v19 = 9.0;
  }
  else {
    double v19 = 4.0;
  }
  id v20 = [v14 objectForKey:@"items"];
  if (a6 - v16 < v19)
  {
    double v21 = 0.0;
    double v22 = 1.0;
    if (!v13) {
      double v21 = 1.0;
    }
    double v23 = v19 + -1.0 - v21;
LABEL_20:
    uint64_t v27 = 0x3FB999999999999ALL;
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  __int128 v28 = v20;
  double v34 = 0.0;
  double v35 = 0.0;
  __int128 v29 = -[MREffectDateline _currentItemForChapter:atTime:forDuration:fromTime:]( self,  "_currentItemForChapter:atTime:forDuration:fromTime:",  v13,  &v35,  &v34,  a6 - (v16 + v19));
  if (v29 >= (char *)[v28 count] - 1)
  {
    objc_msgSend(objc_msgSend(*(id *)((char *)&self->mLengths + 1), "objectAtIndex:", v13), "doubleValue");
    double v32 = v31 - v19 - v34;
    double v33 = 1.0;
    if (!v29) {
      double v33 = 0.0;
    }
    double v25 = v32 - v33;
    double v26 = -2.0;
    goto LABEL_19;
  }

  double v22 = 1.0;
  uint64_t v27 = 0LL;
  if (v29) {
    double v30 = 1.0;
  }
  else {
    double v30 = 0.0;
  }
  double v23 = v35 - v30;
  if (a3) {
LABEL_21:
  }
    *a3 = v23;
LABEL_22:
  if (a4) {
    *(void *)a4 = v27;
  }
  if (a5) {
    *a5 = v22;
  }
}

- (BOOL)supportsChapters
{
  return 1;
}

- (double)timeForNextChapterAfterTime:(double)a3
{
  id v5 = [*(id *)((char *)&self->mChapterDurations + 1) count];
  int64_t v6 = -[MREffectDateline _chapterIndexForTime:](self, "_chapterIndexForTime:", a3);
  double result = 3.0;
  if (v6 < (uint64_t)v5 - 1)
  {
    -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v6 + 1, 3.0);
    return v8 + 0.001;
  }

  return result;
}

- (double)timeForPreviousChapterBeforeTime:(double)a3
{
  id v5 = (char *)[*(id *)((char *)&self->mChapterDurations + 1) count];
  int64_t v6 = -[MREffectDateline _chapterIndexForTime:](self, "_chapterIndexForTime:", a3);
  double v7 = v5 - 1;
  else {
    uint64_t v8 = v6;
  }
  if (v8 >= 1)
  {
    double v7 = (char *)(v8 - 1);
LABEL_7:
    -[MREffectDateline _startTimeForChapter:](self, "_startTimeForChapter:", v7);
    return v9 + 0.001;
  }

  if (v8) {
    goto LABEL_7;
  }
  return 3.0;
}

- (void)_loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mNeedsToUpdateTexts)
  {
    uint64_t v8 = (char *)objc_msgSend(*(id *)((char *)&self->mChapterDurations + 1), "count", a4, a5);
    if ([*(id *)((char *)&self->mChapters + 1) count])
    {
      if ((uint64_t)v8 >= 1)
      {
        for (unint64_t i = 0LL; (char *)i != v8; ++i)
        {
          -[MREffectDateline _unloadTextForChapter:](self, "_unloadTextForChapter:", i);
          double v10 = NSStringWithInteger("chapter", i);
          id v11 = [*(id *)((char *)&self->mChapterDates + 1) objectForKey:v10];
          if (v11)
          {
            -[MREffectDateline _cleanUpDictionary:](self, "_cleanUpDictionary:", v11);
            [*(id *)((char *)&self->mChapterDates + 1) removeObjectForKey:v10];
          }
        }
      }

      id v12 = [*(id *)((char *)&self->mChapters + 1) objectForKey:@"mainTitle"];
      if (v12) {
        [v12 removingFromCollection];
      }
      id v13 = [*(id *)((char *)&self->mChapters + 1) objectForKey:@"mainSubtitle"];
      if (v13) {
        [v13 removingFromCollection];
      }
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v14 = objc_msgSend(*(id *)((char *)&self->mWeatherImages + 1), "objectEnumerator", 0);
      id v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v28;
        do
        {
          for (j = 0LL; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) removingFromCollection];
          }

          id v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }

        while (v16);
      }

      [*(id *)((char *)&self->mWeatherImages + 1) removeAllObjects];
      [*(id *)((char *)&self->mChapters + 1) removeAllObjects];
    }

    uint64_t v19 = -[MREffectDateline _chapterIndexForTime:](self, "_chapterIndexForTime:", a3);
    -[MREffectDateline _loadTextForChapter:context:](self, "_loadTextForChapter:context:", v19 & ~(v19 >> 63), a4);
    if ((uint64_t)v8 >= 1)
    {
      for (k = 0LL; k != v8; ++k)
        -[MREffectDateline _loadDateForChapter:context:](self, "_loadDateForChapter:context:", k, a4);
    }

    id v21 = [*(id *)((char *)&self->mSprites + 1) objectForKey:@"mainTitle"];
    if (v21)
    {
      id v22 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( self,  "_retainedByUserTextImageForString:type:inContext:",  v21,  0LL,  a4);
      if (v22)
      {
        double v23 = v22;
        -[MREffectDateline _addTextImage:forKey:inDictionary:]( self,  "_addTextImage:forKey:inDictionary:",  v22,  @"mainTitle",  *(NSMutableArray **)((char *)&self->mChapters + 1));
        [v23 releaseByUser];
      }
    }

    id v24 = +[MREffectDateline localizedDateStringForMainTitle:latest:]( MREffectDateline,  "localizedDateStringForMainTitle:latest:",  [*(id *)((char *)&self->mSprites + 1) objectForKey:@"startDate"],  objc_msgSend(*(id *)((char *)&self->mSprites + 1), "objectForKey:", @"endDate"));
    if (v24)
    {
      id v25 = -[MREffectDateline _retainedByUserTextImageForString:type:inContext:]( self,  "_retainedByUserTextImageForString:type:inContext:",  v24,  1LL,  a4);
      if (v25)
      {
        double v26 = v25;
        -[MREffectDateline _addTextImage:forKey:inDictionary:]( self,  "_addTextImage:forKey:inDictionary:",  v25,  @"mainSubtitle",  *(NSMutableArray **)((char *)&self->mChapters + 1));
        [v26 releaseByUser];
      }
    }
  }

  self->super.mNeedsToUpdateTexts = 0;
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  double width = self->super.mPixelSize.width;
  double height = self->super.mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  return 3LL;
}

- (void)_unload
{
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v3 = *(NSMutableDictionary **)((char *)&self->mWeatherImages + 1);
  id v4 = [v3 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v64;
    do
    {
      for (unint64_t i = 0LL; i != v5; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v64 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( objc_msgSend( *(id *)((char *)&self->mWeatherImages + 1),  "objectForKey:",  *(void *)(*((void *)&v63 + 1) + 8 * (void)i)),  "removingFromCollection");
      }

      id v5 = [v3 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }

    while (v5);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  uint64_t v8 = *(NSMutableDictionary **)((char *)&self->mText + 1);
  id v9 = [v8 countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v60;
    do
    {
      for (j = 0LL; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v60 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)((char *)&self->mText + 1) objectForKey:*(void *)(*((void *)&v59 + 1) + 8 * (void)j)];
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        id v14 = [v13 countByEnumeratingWithState:&v55 objects:v71 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v56;
          do
          {
            for (k = 0LL; k != v15; k = (char *)k + 1)
            {
              if (*(void *)v56 != v16) {
                objc_enumerationMutation(v13);
              }
              objc_msgSend( objc_msgSend(v13, "objectForKey:", *(void *)(*((void *)&v55 + 1) + 8 * (void)k)),  "removingFromCollection");
            }

            id v15 = [v13 countByEnumeratingWithState:&v55 objects:v71 count:16];
          }

          while (v15);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v59 objects:v72 count:16];
    }

    while (v10);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  BOOL v18 = *(NSMutableDictionary **)((char *)&self->mChapterDates + 1);
  id v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v70, 16, 233);
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v52;
    do
    {
      for (m = 0LL; m != v20; m = (char *)m + 1)
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)((char *)&self->mChapterDates + 1) objectForKey:*(void *)(*((void *)&v51 + 1) + 8 * (void)m)];
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        id v24 = [v23 countByEnumeratingWithState:&v47 objects:v69 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v48;
          do
          {
            for (n = 0LL; n != v25; n = (char *)n + 1)
            {
              if (*(void *)v48 != v26) {
                objc_enumerationMutation(v23);
              }
              objc_msgSend( objc_msgSend(v23, "objectForKey:", *(void *)(*((void *)&v47 + 1) + 8 * (void)n)),  "removingFromCollection");
            }

            id v25 = [v23 countByEnumeratingWithState:&v47 objects:v69 count:16];
          }

          while (v25);
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v51 objects:v70 count:16];
    }

    while (v20);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v28 = *(NSMutableArray **)((char *)&self->mIndicies + 1);
  id v29 = [v28 countByEnumeratingWithState:&v43 objects:v68 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v44;
    do
    {
      for (iunint64_t i = 0LL; ii != v30; iunint64_t i = (char *)ii + 1)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend( objc_msgSend( *(id *)((char *)&self->mIndicies + 1),  "objectForKey:",  *(void *)(*((void *)&v43 + 1) + 8 * (void)ii)),  "unload");
      }

      id v30 = [v28 countByEnumeratingWithState:&v43 objects:v68 count:16];
    }

    while (v30);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  double v33 = *(NSMutableDictionary **)((char *)&self->mBreakInformation + 1);
  id v34 = [v33 countByEnumeratingWithState:&v39 objects:v67 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v40;
    do
    {
      for (jj = 0LL; jj != v35; jj = (char *)jj + 1)
      {
        if (*(void *)v40 != v36) {
          objc_enumerationMutation(v33);
        }
        objc_msgSend( objc_msgSend( *(id *)((char *)&self->mBreakInformation + 1),  "objectForKey:",  *(void *)(*((void *)&v39 + 1) + 8 * (void)jj)),  "unload");
      }

      id v35 = [v33 countByEnumeratingWithState:&v39 objects:v67 count:16];
    }

    while (v35);
  }

  [*(id *)((char *)&self->mBreakInformation + 1) removeAllObjects];
  -[MREffectDateline _cleanUpDictionary:]( self,  "_cleanUpDictionary:",  *(NSMutableArray **)((char *)&self->mChapters + 1));
  [*(id *)&self->mIsRotating unload];
  [*(id *)((char *)&self->mTextBackground + 1) unload];
  [*(id *)((char *)&self->mQuoteOpen + 1) unload];
  [*(id *)((char *)&self->mQuoteClose + 1) unload];
  [*(id *)((char *)&self->mQuoteBox + 1) unload];
  [*(id *)((char *)&self->mWeatherWindowMask + 1) unload];
  [*(id *)((char *)&self->mDateWindowMask + 1) releaseByUser];
  *(MRImageProvider **)((char *)&self->mDateWindowMask + 1) = 0LL;
  [*(id *)((char *)&self->mJournal + 1) removeAllObjects];
  [*(id *)(&self->super._isInInteractiveMode + 1) removeAllObjects];
  [*(id *)((char *)&self->mLengths + 1) removeAllObjects];
  [*(id *)((char *)&self->mChapters + 1) removeAllObjects];

  *(NSMutableDictionary **)((char *)&self->mSprites + 1) = 0LL;
  [*(id *)((char *)&self->super.super.isa + v38) removeAllObjects];
  [*(id *)((char *)&self->mChapterNumDate + 1) removeAllObjects];
  [*(id *)((char *)&self->mIndicies + 1) removeAllObjects];
  [*(id *)((char *)&self->mWeatherImages + 1) removeAllObjects];
  [*(id *)((char *)&self->mChapterDates + 1) removeAllObjects];

  *(NSMutableArray **)((char *)&self->mChapterDurations + 1) = 0LL;
  *(NSMutableDictionary **)((char *)&self->mDayImages + 1) = 0LL;
  BYTE1(self->mSlideInformation) = 0;
  BYTE2(self->mSlideInformation) = 0;
}

@end