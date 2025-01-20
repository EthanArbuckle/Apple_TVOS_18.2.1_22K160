@interface MPCropController
+ (id)sharedController;
+ (void)releaseSharedController;
- (CGPoint)checkFarApartROIs:(id)a3 withImageSize:(CGSize)a4 visibleAspectRatio:(double)a5 roiCenter:(CGPoint)a6;
- (MPCropController)init;
- (double)durationOfSlide:(id)a3;
- (id)delegate;
- (void)_applyCropToSlidesInEffectContainersWithArguments:(id)a3;
- (void)applyAnimatedCropToBreakSlide:(id)a3 withOptions:(id)a4;
- (void)applyAnimatedCropToSlide:(id)a3 withOptions:(id)a4;
- (void)applyAnimatedCropToSlide:(id)a3 withOptions:(id)a4 centeredAt:(CGPoint)a5 alwaysZoomIn:(BOOL)a6;
- (void)applyAnimatedCropWithROIsToSlide:(id)a3 withOptions:(id)a4;
- (void)applyCropToSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)applyCropToSlide:(id)a3 withOptions:(id)a4;
- (void)applyCropToSlidesInEffectContainers:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)applyMultiFaceAnimatedCropToSlide:(id)a3 withOptions:(id)a4;
- (void)applyStationaryCropToSlide:(id)a3 withOptions:(id)a4;
- (void)batchCrop:(id)a3;
- (void)cleanup;
- (void)cropSlidesForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)cropSlidesInDocument:(id)a3 withOptions:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setupWithDocument:(id)a3 andOptions:(id)a4;
@end

@implementation MPCropController

+ (id)sharedController
{
  id result = (id)qword_2AE678;
  if (!qword_2AE678)
  {
    objc_sync_enter(a1);
    if (!qword_2AE678) {
      qword_2AE678 = objc_alloc_init(&OBJC_CLASS___MPCropController);
    }
    objc_sync_exit(a1);
    return (id)qword_2AE678;
  }

  return result;
}

+ (void)releaseSharedController
{
  if (qword_2AE678)
  {
    objc_sync_enter(a1);

    qword_2AE678 = 0LL;
    objc_sync_exit(a1);
  }

- (MPCropController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPCropController;
  v2 = -[MPCropController init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->_delegate = 0LL;
    v2->_cropLock = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
  }

  return v3;
}

- (void)dealloc
{
  self->_cropLock = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPCropController;
  -[MPCropController dealloc](&v3, "dealloc");
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (void)batchCrop:(id)a3
{
  v26 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id delegate = self->_delegate;
  if (!delegate)
  {
    char v6 = 0;
    goto LABEL_5;
  }

  char v6 = objc_opt_respondsToSelector(delegate, "document:shouldUseDefaultAnimatedPathsForSlide:inEffect:");
  id v7 = self->_delegate;
  if (!v7)
  {
LABEL_5:
    int v8 = 1;
    goto LABEL_6;
  }

  int v8 = objc_opt_respondsToSelector(v7, "document:needsAnimationPathsAppliedForSlide:inEffect:") ^ 1;
LABEL_6:
  int v23 = v8;
  v9 = -[NSMutableDictionary initWithDictionary:]( [NSMutableDictionary alloc],  "initWithDictionary:",  [a3 objectForKey:@"options"]);
  id v24 = [a3 objectForKey:@"document"];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = [a3 objectForKey:@"slidesToCrop"];
  id v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v10) {
    goto LABEL_29;
  }
  id v11 = v10;
  int v12 = 0;
  uint64_t v13 = *(void *)v28;
  uint64_t v14 = -1LL;
  do
  {
    v15 = 0LL;
    do
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v15);
      id v17 = objc_msgSend(objc_msgSend(v16, "nearestLayer"), "zIndex");
      if (v17 != (id)-1LL && v17 != (id)v14)
      {
        uint64_t v19 = (uint64_t)v17;
        v20 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v17);
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v20, kMPAuthoringLayerIndex);
        uint64_t v14 = v19;
      }

      unsigned int v21 = objc_msgSend( self->_delegate,  "document:shouldUseDefaultAnimatedPathsForSlide:inEffect:",  v24,  v16,  objc_msgSend(v16, "parentEffect"));
      if ((v21 | v23) & 1) != 0 || ([v16 isSecondary])
      {
        if (!v21) {
          goto LABEL_22;
        }
LABEL_21:
        -[MPCropController applyCropToSlide:withOptions:](self, "applyCropToSlide:withOptions:", v16, v9);
        goto LABEL_22;
      }

      objc_msgSend( self->_delegate,  "document:needsAnimationPathsAppliedForSlide:inEffect:",  v24,  v16,  objc_msgSend(v16, "parentEffect"));
LABEL_22:
      if (v12 == 30)
      {

        v26 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
        int v12 = 0;
      }

      else
      {
        ++v12;
      }

      v15 = (char *)v15 + 1;
    }

    while (v11 != v15);
    id v22 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    id v11 = v22;
  }

  while (v22);
LABEL_29:

  -[NSAutoreleasePool drain](v26, "drain");
}

- (void)cropSlidesInDocument:(id)a3 withOptions:(id)a4
{
}

- (void)cropSlidesForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  v9 = objc_autoreleasePoolPush();
  -[NSRecursiveLock lock](self->_cropLock, "lock");
  id v51 = [a5 mutableCopy];
  if (!v51) {
    id v51 = objc_msgSend(objc_msgSend(a3, "authoringOptions"), "mutableCopy");
  }
  -[MPCropController setupWithDocument:andOptions:](self, "setupWithDocument:andOptions:", a4, a5);
  id v10 = (char *)+[MPAuthoringUtilities reconfigureRangeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "reconfigureRangeFromOptions:",  a5);
  NSUInteger v12 = v11;
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obj = [a3 layers];
  id v45 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v45)
  {
    v40 = v9;
    char v14 = 0;
    v54 = 0LL;
    NSUInteger v15 = 0LL;
    v52 = &v10[v12];
    uint64_t v42 = *(void *)v65;
    id v49 = a4;
    v50 = self;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v65 != v42) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)v16);
        v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v17 zIndex]);
        [v51 setObject:v18 forKey:kMPAuthoringLayerIndex];
        id v19 = [v17 effectContainers];
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        id v47 = [v19 countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v47)
        {
          uint64_t v20 = *(void *)v61;
          char v21 = v14;
          v48 = v16;
          v43 = v19;
          uint64_t v44 = *(void *)v61;
LABEL_10:
          uint64_t v22 = 0LL;
LABEL_11:
          if (*(void *)v61 != v20)
          {
            uint64_t v23 = v22;
            objc_enumerationMutation(v19);
            uint64_t v22 = v23;
          }

          uint64_t v46 = v22;
          id v24 = *(void **)(*((void *)&v60 + 1) + 8 * v22);
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          id v53 = [v24 effects];
          id v25 = [v53 countByEnumeratingWithState:&v56 objects:v68 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v55 = *(void *)v57;
LABEL_15:
            uint64_t v27 = 0LL;
            while (1)
            {
              if (*(void *)v57 != v55) {
                objc_enumerationMutation(v53);
              }
              __int128 v28 = *(void **)(*((void *)&v56 + 1) + 8 * v27);
              NSUInteger v29 = (NSUInteger)objc_msgSend(objc_msgSend(v28, "slides"), "count");
              if (v12)
              {
                v71.NSUInteger location = (NSUInteger)v10;
                v71.NSUInteger length = v12;
                v72.NSUInteger location = v15;
                v72.NSUInteger length = v29;
                NSRange v31 = NSIntersectionRange(v71, v72);
                NSUInteger location = v31.location;
                NSUInteger length = v31.length;
                if (v31.length) {
                  goto LABEL_22;
                }
              }

              else
              {
                NSUInteger location = v15;
                NSUInteger length = v29;
                if (v29)
                {
LABEL_22:
                  v33 = v10;
                  -[NSMutableArray addObjectsFromArray:]( v13,  "addObjectsFromArray:",  objc_msgSend(objc_msgSend(v28, "slides"), "subarrayWithRange:", location - v15, length));
                  -[NSMutableArray addObjectsFromArray:]( v13,  "addObjectsFromArray:",  [v28 secondarySlides]);
                  if ((unint64_t)-[NSMutableArray count](v13, "count") >= 0x7D1)
                  {
                    v34 = v54;
                    if (!v54)
                    {
                      v34 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
                      -[NSOperationQueue setMaxConcurrentOperationCount:](v34, "setMaxConcurrentOperationCount:", 1LL);
                    }

                    v35 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  v13,  @"slidesToCrop",  v49,  @"document",  [v51 copy],  @"options",  0);
                    v36 = -[NSInvocationOperation initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSInvocationOperation),  "initWithTarget:selector:object:",  v50,  "batchCrop:",  v35);
                    -[NSInvocationOperation setQualityOfService:](v36, "setQualityOfService:", 9LL);
                    -[NSInvocationOperation setQueuePriority:](v36, "setQueuePriority:", -8LL);
                    v54 = v34;
                    -[NSOperationQueue addOperation:](v34, "addOperation:", v36);

                    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  }

                  id v10 = v33;
                }
              }

              v15 += v29;
              if (v12 && v15 >= (unint64_t)v52)
              {
                char v14 = 1;
                a4 = v49;
                self = v50;
                v16 = v48;
                goto LABEL_37;
              }

              if (v26 == (id)++v27)
              {
                id v26 = [v53 countByEnumeratingWithState:&v56 objects:v68 count:16];
                if (v26) {
                  goto LABEL_15;
                }
LABEL_33:
                char v21 = 0;
                uint64_t v22 = v46 + 1;
                a4 = v49;
                self = v50;
                v16 = v48;
                id v19 = v43;
                uint64_t v20 = v44;
                if ((id)(v46 + 1) == v47)
                {
                  id v37 = [v43 countByEnumeratingWithState:&v60 objects:v69 count:16];
                  uint64_t v20 = v44;
                  char v21 = 0;
                  char v14 = 0;
                  id v47 = v37;
                  if (!v37) {
                    goto LABEL_37;
                  }
                  goto LABEL_10;
                }

                goto LABEL_11;
              }
            }
          }

          if ((v21 & 1) == 0) {
            goto LABEL_33;
          }
          char v14 = 1;
        }

- (void)_applyCropToSlidesInEffectContainersWithArguments:(id)a3
{
  v4 = objc_autoreleasePoolPush();
  objc_msgSend( +[MPCropController sharedController](MPCropController, "sharedController"),  "applyCropToSlidesInEffectContainers:inDocument:withOptions:",  objc_msgSend(a3, "objectForKey:", @"effectContainers"),  objc_msgSend(a3, "objectForKey:", @"document"),  objc_msgSend(a3, "objectForKey:", @"options"));
  objc_autoreleasePoolPop(v4);
}

- (void)applyCropToSlidesInEffectContainers:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v27 = a4;
  __int128 v28 = self;
  id v9 = a5;
  -[MPCropController setupWithDocument:andOptions:](self, "setupWithDocument:andOptions:", a4, a5);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = a3;
  id v25 = [a3 countByEnumeratingWithState:&v33 objects:v38 count:16];
  NSUInteger v11 = 0LL;
  if (v25)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v12;
        uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        id v14 = [v13 effects];
        id v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v30;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
              -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", [v19 slides]);
              -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", [v19 secondarySlides]);
              if ((unint64_t)-[NSMutableArray count](v10, "count") >= 0x7D1)
              {
                if (!v11)
                {
                  NSUInteger v11 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
                  -[NSOperationQueue setMaxConcurrentOperationCount:](v11, "setMaxConcurrentOperationCount:", 1LL);
                }

                uint64_t v20 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v10,  @"slidesToCrop",  v27,  @"document",  v9,  @"options",  0LL);
                char v21 = -[NSInvocationOperation initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSInvocationOperation),  "initWithTarget:selector:object:",  v28,  "batchCrop:",  v20);
                -[NSInvocationOperation setQualityOfService:](v21, "setQualityOfService:", 9LL);
                -[NSInvocationOperation setQueuePriority:](v21, "setQueuePriority:", -8LL);
                -[NSOperationQueue addOperation:](v11, "addOperation:", v21);

                id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }

          while (v16);
        }

        uint64_t v12 = v26 + 1;
      }

      while ((id)(v26 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v25);
  }

  uint64_t v22 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v10,  @"slidesToCrop",  v27,  @"document",  v9,  @"options",  0LL);
  -[MPCropController batchCrop:](v28, "batchCrop:", v22);

  if (v11)
  {
    -[NSOperationQueue waitUntilAllOperationsAreFinished](v11, "waitUntilAllOperationsAreFinished");
  }

  -[MPCropController cleanup](v28, "cleanup");
  -[NSRecursiveLock unlock](v28->_cropLock, "unlock");
}

- (void)applyCropToSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  if (!a5) {
    a5 = objc_msgSend(objc_msgSend(a4, "documentLayerGroup"), "authoringOptions");
  }
  -[MPCropController setupWithDocument:andOptions:](self, "setupWithDocument:andOptions:", a4, a5);
  id v9 = objc_msgSend(objc_msgSend(a3, "nearestLayer"), "zIndex");
  id v10 = [a5 mutableCopy];
  if (v9 != (id)-1LL)
  {
    NSUInteger v11 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9);
    [v10 setObject:v11 forKey:kMPAuthoringLayerIndex];
  }

  -[MPCropController applyCropToSlide:withOptions:](self, "applyCropToSlide:withOptions:", a3, v10);
  -[MPCropController cleanup](self, "cleanup");
  -[NSRecursiveLock unlock](self->_cropLock, "unlock");
}

- (void)setupWithDocument:(id)a3 andOptions:(id)a4
{
  authoredDocument = self->_authoredDocument;
  if (authoredDocument)
  {

    self->_authoredDocument = 0LL;
  }

  self->_authoredDocument = (MPDocument *)a3;
}

- (void)cleanup
{
  self->_authoredDocument = 0LL;
}

- (void)applyCropToSlide:(id)a3 withOptions:(id)a4
{
  v4 = (NSMutableDictionary *)a4;
  +[MPAuthoringUtilities kenBurnsLikelihoodFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "kenBurnsLikelihoodFromOptions:",  a4);
  double v8 = v7;
  unsigned __int8 v9 = +[MPAuthoringUtilities kenBurnsBreaksFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "kenBurnsBreaksFromOptions:",  v4);
  -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", [a3 path]);
  double v12 = v10 / v11;
  if (v10 / v11 >= 0.5 && v12 <= 2.0)
  {
    BOOL v20 = 0;
  }

  else
  {
    +[MPAuthoringUtilities aspectRatioFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "aspectRatioFromOptions:", v4);
    double v15 = v14;
    id v16 = [a3 parentEffect];
    objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:imageAspectRatio:",  objc_msgSend(v16, "effectID"),  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  objc_msgSend(v16, "effectID"),  objc_msgSend(v16, "presetID")),  objc_msgSend(a3, "index"),  v15,  v12);
    double v18 = v12 / v17;
    double v19 = v17 / v12;
    if (v12 >= 1.0) {
      double v19 = v18;
    }
    BOOL v20 = v19 >= 1.1;
  }

  if (v8 == 1.0) {
    char v21 = 1;
  }
  else {
    char v21 = v9 & v20;
  }
  int64_t v22 = +[MPAuthoringUtilities kenBurnsLevelFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "kenBurnsLevelFromOptions:",  v4);
  id v23 = [a3 parentEffect];
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = [v23 effectID];
    id v26 = [v24 presetID];
    id v27 = +[MPAuthoringUtilities styleFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "styleFromOptions:", v4);
    objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "defaultAutoKenBurnsLikelihoodForEffect:withPreset:ofStyle:",  v25,  v26,  v27);
    if (v28 > -1.0)
    {
      if (v28 == 1.0) {
        char v21 = 1;
      }
      id v29 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "defaultAutoKenBurnsLevelForEffect:withPreset:ofStyle:",  v25,  v26,  v27);
      if ((v21 & 1) != 0)
      {
        int64_t v22 = (int64_t)v29;
        goto LABEL_19;
      }

- (void)applyAnimatedCropToSlide:(id)a3 withOptions:(id)a4
{
}

- (void)applyAnimatedCropWithROIsToSlide:(id)a3 withOptions:(id)a4
{
  id v7 = -[MPDocument regionsOfInterestForPath:detect:]( self->_authoredDocument,  "regionsOfInterestForPath:detect:",  [a3 path],  +[MPAuthoringUtilities performFaceDetectionFromOptions:]( MPAuthoringUtilities,  "performFaceDetectionFromOptions:",  a4));
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  double v31 = y;
  double v32 = CGRectZero.origin.x;
  double v29 = height;
  double v30 = width;
  if (v7)
  {
    double v12 = v7;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v13 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    double v31 = y;
    double v32 = CGRectZero.origin.x;
    double v29 = height;
    double v30 = width;
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v34;
      double v31 = y;
      double v32 = CGRectZero.origin.x;
      double v29 = height;
      double v30 = width;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          CGRect v38 = CGRectFromString((NSString *)[*(id *)(*((void *)&v33 + 1) + 8 * (void)i) objectForKey:kMPMetaDataRegionOfInterestBounds]);
          CGFloat v17 = v38.origin.x;
          CGFloat v18 = v38.origin.y;
          CGFloat v19 = v38.size.width;
          double v20 = v38.size.height;
          BOOL v21 = v38.size.width == 0.0;
          double v23 = v31;
          double v22 = v32;
          double v25 = v29;
          double v24 = v30;
          if (!v21 && v20 != 0.0)
          {
            v43.origin.CGFloat x = CGRectZero.origin.x;
            v43.origin.CGFloat y = y;
            v43.size.CGFloat width = width;
            v43.size.CGFloat height = height;
            if (CGRectEqualToRect(*(CGRect *)&v22, v43))
            {
              double v31 = v18;
              double v32 = v17;
              double v29 = v20;
              double v30 = v19;
            }

            else
            {
              v39.origin.CGFloat x = v17;
              v39.origin.CGFloat y = v18;
              v39.size.CGFloat width = v19;
              v39.size.CGFloat height = v20;
              v44.origin.CGFloat x = CGRectZero.origin.x;
              v44.origin.CGFloat y = y;
              v44.size.CGFloat width = width;
              v44.size.CGFloat height = height;
              if (!CGRectEqualToRect(v39, v44))
              {
                v40.origin.CGFloat y = v31;
                v40.origin.CGFloat x = v32;
                v40.size.CGFloat height = v29;
                v40.size.CGFloat width = v30;
                v45.origin.CGFloat x = v17;
                v45.origin.CGFloat y = v18;
                v45.size.CGFloat width = v19;
                v45.size.CGFloat height = v20;
                CGRect v41 = CGRectUnion(v40, v45);
                double v31 = v41.origin.y;
                double v32 = v41.origin.x;
                double v29 = v41.size.height;
                double v30 = v41.size.width;
              }
            }
          }

          CGFloat x = CGRectZero.origin.x;
        }

        id v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v14);
    }
  }

  v42.origin.CGFloat x = v32;
  v42.origin.CGFloat y = v31;
  v42.size.CGFloat width = v30;
  v42.size.CGFloat height = v29;
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  BOOL v26 = CGRectEqualToRect(v42, v46);
  double v27 = 0.5;
  double v28 = 0.5;
  if (!v26) {
    +[MPAuthoringUtilities kbCenterPointFromRect:]( &OBJC_CLASS___MPAuthoringUtilities,  "kbCenterPointFromRect:",  v32,  v31,  v30,  v29);
  }
  -[MPCropController applyAnimatedCropToSlide:withOptions:centeredAt:alwaysZoomIn:]( self,  "applyAnimatedCropToSlide:withOptions:centeredAt:alwaysZoomIn:",  a3,  a4,  1LL,  v27,  v28);
}

- (void)applyStationaryCropToSlide:(id)a3 withOptions:(id)a4
{
  unint64_t v7 = +[MPAuthoringUtilities croppingModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "croppingModeFromOptions:",  a4);
  if (v7 == 1)
  {
    [a3 setSizingMode:@"Scale to Fit"];
    double v8 = 0.5;
LABEL_16:
    double v16 = 0.5;
    goto LABEL_17;
  }

  unint64_t v9 = v7;
  -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", [a3 path]);
  double v11 = v10;
  double v13 = v12;
  double v14 = v10 / v12;
  double v8 = 0.5;
  if (v10 / v12 >= 0.5 && v14 <= 2.0)
  {
    if (v9 == 2 && v14 <= 1.0)
    {
      CGFloat v17 = kMPSlideSizingModeFit;
    }

    else
    {
      if (v9 != 4) {
        goto LABEL_22;
      }
      CGFloat v17 = kMPSlideSizingModeBestFit;
    }

    [a3 setSizingMode:*v17];
    goto LABEL_16;
  }

  if (v9) {
    goto LABEL_16;
  }
  double v16 = 0.5;
  if (objc_msgSend(objc_msgSend(a3, "sizingMode"), "isEqual:", @"Scale to Fit"))
  {
LABEL_22:
    id v74 = [a3 parentEffect];
    id v18 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "imageInputInfoForEffectID:",  objc_msgSend(v74, "effectID"));
    CGFloat v19 = (char *)[v18 count] - 1;
    double v20 = (char *)[a3 index];
    if (v19 >= v20) {
      BOOL v21 = v20;
    }
    else {
      BOOL v21 = v19;
    }
    id v22 = [v18 objectAtIndex:v21];
    id v23 = [v22 objectForKey:@"kenBurnsType"];
    unsigned int v24 = [v23 hasSuffix:@"to Fit"];
    unsigned int v25 = [a3 hasMovie];
    if (!+[MPAuthoringUtilities useROIFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "useROIFromOptions:", a4)
      || (v25 & 1) != 0
      || (v24 & 1) != 0)
    {
      if (v24)
      {
        [a3 setSizingMode:v23];
        char v31 = 1;
        goto LABEL_51;
      }
    }

    else
    {
      BOOL v26 = (NSString *)[a3 userInfoAttributeForKey:@"pickedROIRect"];
      if (v26)
      {
        CGRect v84 = CGRectFromString(v26);
        CGRect v85 = CGRectInset(v84, -0.0500000007, -0.0500000007);
        double x = v85.origin.x;
        double y = v85.origin.y;
        double width = v85.size.width;
        double height = v85.size.height;
        v92.origin.double x = CGRectZero.origin.x;
        v92.origin.double y = CGRectZero.origin.y;
        v92.size.double width = CGRectZero.size.width;
        v92.size.double height = CGRectZero.size.height;
        if (CGRectEqualToRect(v85, v92))
        {
          char v31 = 0;
          double v8 = 0.5;
LABEL_51:
          double v16 = 0.5;
LABEL_52:
          if (v25
            && +[MPAuthoringUtilities fitMoviesWhenPossibleFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "fitMoviesWhenPossibleFromOptions:",  a4)
            && objc_msgSend(objc_msgSend(a3, "parentEffect"), "countOfSlides") == (char *)&dword_0 + 1
            && (+[MPAuthoringUtilities croppingModeForFitMoviesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "croppingModeForFitMoviesFromOptions:",  a4) & 0x80000000) == 0)
          {
            v50 = @"Scale to Fit";
          }

          else
          {
            if (v9 == 3) {
              char v51 = 1;
            }
            else {
              char v51 = v31;
            }
            if ((v51 & 1) != 0) {
              goto LABEL_17;
            }
            v50 = @"Crop to Fit";
          }

          [a3 setSizingMode:v50];
          goto LABEL_17;
        }

        +[MPAuthoringUtilities kbCenterPointFromRect:]( &OBJC_CLASS___MPAuthoringUtilities,  "kbCenterPointFromRect:",  x,  y,  width,  height);
        double v16 = 1.0;
        double v8 = 1.0;
        if (v52 > 1.0)
        {
LABEL_76:
          char v31 = 0;
          if (v53 <= v16)
          {
            if (v53 >= 0.0) {
              double v16 = v53;
            }
            else {
              double v16 = 0.0;
            }
          }

          goto LABEL_52;
        }

- (CGPoint)checkFarApartROIs:(id)a3 withImageSize:(CGSize)a4 visibleAspectRatio:(double)a5 roiCenter:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double height = a4.height;
  double width = a4.width;
  +[MPAuthoringUtilities rectToFitIn:withAspectRatio:]( &OBJC_CLASS___MPAuthoringUtilities,  "rectToFitIn:withAspectRatio:",  0.0,  0.0,  a4.width,  a4.height,  a5);
  double v13 = width * x - v12 * 0.5;
  double v14 = height * y - v11 * 0.5;
  BOOL v15 = v12 + v13 <= width;
  double v155 = v11;
  double v156 = v12;
  double v16 = width - v12;
  double v127 = v16;
  if (v15) {
    double v16 = v13;
  }
  if (v13 >= 0.0) {
    double v17 = v16;
  }
  else {
    double v17 = 0.0;
  }
  double v18 = height - v11;
  double rect2_24 = height - v11;
  if (v11 + v14 <= height) {
    double v18 = height * y - v11 * 0.5;
  }
  __int128 v167 = 0u;
  __int128 v168 = 0u;
  double rect2_8 = 0.0;
  if (v14 >= 0.0) {
    double v19 = v18;
  }
  else {
    double v19 = 0.0;
  }
  __int128 v165 = 0uLL;
  __int128 v166 = 0uLL;
  id v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v165, v171, 16, v18);
  CGFloat v22 = CGRectZero.size.width;
  CGFloat v21 = CGRectZero.size.height;
  CGFloat v153 = v22;
  CGFloat v154 = v21;
  if (!v20) {
    goto LABEL_21;
  }
  id v23 = v20;
  double rect1 = y;
  double v149 = x;
  uint64_t v24 = *(void *)v166;
  LOBYTE(v25) = 1;
  do
  {
    for (i = 0LL; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v166 != v24) {
        objc_enumerationMutation(a3);
      }
      CGRect v173 = CGRectFromString((NSString *)[*(id *)(*((void *)&v165 + 1) + 8 * (void)i) objectForKey:kMPMetaDataRegionOfInterestBounds]);
      double v27 = width * v173.origin.x;
      double v28 = height * v173.origin.y;
      double v29 = width * v173.size.width;
      double v30 = height * v173.size.height;
      v173.origin.double x = width * v173.origin.x;
      v173.origin.double y = height * v173.origin.y;
      v173.size.double width = width * v173.size.width;
      v173.size.double height = height * v173.size.height;
      v194.origin.double x = v17;
      v194.origin.double y = v19;
      v194.size.double height = v155;
      v194.size.double width = v156;
      CGRect v174 = CGRectIntersection(v173, v194);
      BOOL IsNull = CGRectIsNull(v174);
      double v32 = v153;
      double v33 = v154;
      if (!IsNull)
      {
        v175.origin.double x = v27;
        v175.origin.double y = v28;
        v175.size.double width = v29;
        v175.size.double height = v30;
        v195.origin.double x = v17;
        v195.origin.double y = v19;
        v195.size.double height = v155;
        v195.size.double width = v156;
        *(CGRect *)(&v32 - 2) = CGRectIntersection(v175, v195);
      }

      int v25 = (v32 * v33 / (v29 * v30) <= 0.5) & v25;
    }

    id v23 = [a3 countByEnumeratingWithState:&v165 objects:v171 count:16];
  }

  while (v23);
  CGFloat v22 = v153;
  CGFloat v21 = v154;
  double v35 = rect1;
  double v34 = v149;
  if (v25)
  {
LABEL_21:
    double v134 = -v155;
    double v135 = -v156;
    CGFloat v36 = CGRectZero.origin.y;
    __int128 v163 = 0u;
    __int128 v164 = 0u;
    __int128 v161 = 0u;
    __int128 v162 = 0u;
    id v37 = [a3 countByEnumeratingWithState:&v161 objects:v170 count:16];
    CGFloat v130 = v21;
    CGFloat v131 = CGRectZero.origin.x;
    CGFloat v122 = v36;
    CGFloat rect1a = v36;
    CGFloat v38 = v22;
    if (v37)
    {
      id v39 = v37;
      uint64_t v40 = *(void *)v162;
      double v150 = CGRectZero.origin.x;
      double v41 = v36;
      double v43 = v153;
      CGFloat v42 = v154;
      double rect2_8 = 0.0;
LABEL_23:
      CGFloat v44 = 0LL;
      CGFloat v45 = v150;
      CGFloat rect1a = v41;
      CGFloat v38 = v43;
      while (1)
      {
        if (*(void *)v162 != v40) {
          objc_enumerationMutation(a3);
        }
        CGRect v176 = CGRectFromString((NSString *)[*(id *)(*((void *)&v161 + 1) + 8 * (void)v44) objectForKey:kMPMetaDataRegionOfInterestBounds]);
        double v150 = v45;
        double v50 = rect1a;
        double v51 = v38;
        double v52 = v42;
        CGFloat v130 = v42;
        CGFloat v131 = v45;
        if (v176.size.width != 0.0)
        {
          CGFloat v46 = v176.size.height;
          double v150 = v45;
          double v50 = rect1a;
          double v51 = v38;
          double v52 = v42;
          if (v176.size.height != 0.0)
          {
            CGFloat v53 = v176.origin.x;
            CGFloat v139 = v176.size.height;
            CGFloat v143 = v176.origin.y;
            CGFloat r1 = v176.size.width;
            v177.origin.double x = v45;
            v177.origin.double y = rect1a;
            v177.size.double width = v38;
            v177.size.double height = v42;
            v196.origin.double x = CGRectZero.origin.x;
            v196.origin.double y = v122;
            v196.size.double width = v153;
            v196.size.double height = v154;
            if (CGRectEqualToRect(v177, v196))
            {
              double v150 = v53;
              double v52 = v139;
              double v50 = v143;
              double v51 = r1;
            }

            else
            {
              v178.origin.double x = v53;
              v178.size.double width = r1;
              v178.origin.double y = v143;
              v178.size.double height = v139;
              v197.origin.double x = CGRectZero.origin.x;
              v197.origin.double y = v122;
              v197.size.double width = v153;
              v197.size.double height = v154;
              BOOL v54 = CGRectEqualToRect(v178, v197);
              CGFloat v46 = v53;
              double v47 = v143;
              double v50 = rect1a;
              double v48 = r1;
              double v49 = v139;
              double v150 = v45;
              double v51 = v38;
              double v52 = v42;
              if (!v54)
              {
                v179.origin.double x = v45;
                v179.origin.double y = rect1a;
                v179.size.double width = v38;
                v179.size.double height = v42;
                CGRect v180 = CGRectUnion(v179, *(CGRect *)&v46);
                double v150 = v180.origin.x;
                double v50 = v180.origin.y;
                double v51 = v180.size.width;
                double v52 = v180.size.height;
              }
            }
          }
        }

        +[MPAuthoringUtilities kbCenterPointFromRect:]( &OBJC_CLASS___MPAuthoringUtilities,  "kbCenterPointFromRect:",  v150,  v50,  v51,  v52,  v46,  v47,  v48,  v49);
        double v57 = width * v55 + v135 * 0.5;
        double v58 = height * v56 + v134 * 0.5;
        double v60 = v155;
        double v59 = v156;
        double v61 = v127;
        if (v156 + v57 <= width) {
          double v61 = v57;
        }
        if (v57 < 0.0) {
          double v61 = 0.0;
        }
        double v62 = rect2_24;
        if (v155 + v58 <= height) {
          double v62 = v58;
        }
        if (v58 >= 0.0) {
          double v63 = v62;
        }
        else {
          double v63 = 0.0;
        }
        double r1a = v51;
        double v140 = v50;
        double v64 = height * v50;
        double v65 = width * v51;
        double v144 = v52;
        double v66 = height * v52;
        CGFloat v67 = v61;
        v181.origin.double x = width * v150;
        v181.origin.double y = v64;
        v181.size.double width = v65;
        v181.size.double height = v66;
        CGFloat v68 = v67;
        CGFloat r2 = v63;
        CGRect v182 = CGRectIntersection(v181, *(CGRect *)(&v59 - 2));
        BOOL v69 = CGRectIsNull(v182);
        double v70 = v153;
        double v71 = v154;
        if (!v69)
        {
          v183.origin.double x = width * v150;
          v183.origin.double y = v64;
          v183.size.double width = v65;
          v183.size.double height = v66;
          v198.origin.double x = v67;
          v198.origin.double y = r2;
          v198.size.double height = v155;
          v198.size.double width = v156;
          *(CGRect *)(&v70 - 2) = CGRectIntersection(v183, v198);
        }

        double v72 = v70 * v71 / (v65 * v66);
        double v43 = r1a;
        double v41 = v140;
        CGFloat v42 = v144;
        if (v72 != 1.0) {
          break;
        }
        CGFloat v44 = (char *)v44 + 1;
        CGFloat v45 = v150;
        double rect2_8 = 1.0;
        CGFloat rect1a = v140;
        CGFloat v38 = r1a;
        if (v39 == v44)
        {
          CGFloat v42 = v144;
          id v39 = [a3 countByEnumeratingWithState:&v161 objects:v170 count:16];
          double rect2_8 = 1.0;
          CGFloat v130 = v144;
          CGFloat v131 = v150;
          CGFloat rect1a = v140;
          CGFloat v38 = r1a;
          if (v39) {
            goto LABEL_23;
          }
          break;
        }
      }
    }

    CGFloat v121 = v38;
    id v73 = [a3 reverseObjectEnumerator];
    id v74 = [v73 nextObject];
    if (v74)
    {
      double v120 = 0.0;
      CGFloat v76 = v153;
      CGFloat v75 = v154;
      double v77 = CGRectZero.origin.x;
      CGFloat r2a = CGRectZero.origin.x;
      CGFloat r1b = v122;
      CGFloat v141 = v122;
      CGFloat v145 = v153;
      double v151 = v154;
      do
      {
        CGRect v184 = CGRectFromString((NSString *)objc_msgSend( v74,  "objectForKey:",  kMPMetaDataRegionOfInterestBounds,  *(void *)&v120));
        double v78 = v184.size.height;
        double v80 = v141;
        double v79 = v145;
        CGFloat v81 = v151;
        double v128 = v75;
        if (v184.size.width != 0.0)
        {
          double v77 = r2a;
          double v80 = r1b;
          double v79 = v76;
          CGFloat v81 = v75;
          if (v78 != 0.0)
          {
            CGFloat v142 = v184.origin.x;
            CGFloat v146 = v184.origin.y;
            CGFloat v152 = v184.size.width;
            CGFloat v123 = v78;
            double v77 = r2a;
            v185.origin.double x = r2a;
            double v80 = r1b;
            v185.origin.double y = r1b;
            v185.size.double width = v76;
            v185.size.double height = v75;
            v199.origin.double x = CGRectZero.origin.x;
            v199.origin.double y = v122;
            v199.size.double width = v153;
            v199.size.double height = v154;
            if (CGRectEqualToRect(v185, v199))
            {
              double v77 = v142;
              double v80 = v146;
              double v79 = v152;
              CGFloat v81 = v123;
            }

            else
            {
              v186.origin.double x = v142;
              v186.origin.double y = v146;
              v186.size.double width = v152;
              v200.origin.double x = CGRectZero.origin.x;
              v186.size.double height = v123;
              v200.origin.double y = v122;
              v200.size.double width = v153;
              v200.size.double height = v154;
              BOOL v82 = CGRectEqualToRect(v186, v200);
              CGFloat v83 = v142;
              CGFloat v84 = v146;
              CGFloat v85 = v152;
              CGFloat v86 = v123;
              double v79 = v76;
              CGFloat v81 = v75;
              if (!v82)
              {
                v187.origin.double x = r2a;
                v187.origin.double y = r1b;
                v187.size.double width = v76;
                v187.size.double height = v75;
                *(CGRect *)(&v81 - 3) = CGRectUnion(v187, *(CGRect *)&v83);
                double v77 = v87;
                double v80 = v88;
                double v79 = v89;
              }
            }
          }
        }

        double v151 = v81;
        +[MPAuthoringUtilities kbCenterPointFromRect:]( &OBJC_CLASS___MPAuthoringUtilities,  "kbCenterPointFromRect:",  v77,  v80,  v79);
        double v92 = width * v91 + v135 * 0.5;
        double v93 = 0.0;
        CGFloat v94 = 0.0;
        double v95 = v79;
        if (v92 >= 0.0)
        {
          CGFloat v94 = v92;
          if (v156 + v92 > width) {
            CGFloat v94 = v127;
          }
        }

        double v96 = height * v90 + v134 * 0.5;
        if (v96 >= 0.0)
        {
          double v93 = height * v90 + v134 * 0.5;
          if (v155 + v96 > height) {
            double v93 = rect2_24;
          }
        }

        double v124 = v77;
        double v97 = width * v77;
        CGFloat v141 = v80;
        CGFloat v145 = v79;
        double v98 = height * v80;
        double v99 = width * v95;
        v188.origin.double x = v97;
        v188.origin.double y = height * v80;
        v188.size.double width = width * v95;
        v188.size.double height = height * v151;
        CGFloat v100 = v94;
        CGFloat v101 = v93;
        double v103 = v155;
        double v102 = v156;
        CGRect v189 = CGRectIntersection(v188, *(CGRect *)(&v93 - 1));
        BOOL v104 = CGRectIsNull(v189);
        double v105 = v153;
        double v106 = v154;
        if (!v104)
        {
          v190.origin.double x = v97;
          v190.origin.double y = v98;
          v190.size.double width = v99;
          v190.size.double height = height * v151;
          v201.origin.double x = v94;
          v201.origin.double y = v101;
          v201.size.double height = v155;
          v201.size.double width = v156;
          *(CGRect *)(&v105 - 2) = CGRectIntersection(v190, v201);
        }

        double v107 = v106 * v105 / (v99 * (height * v151));
        CGFloat v75 = v128;
        double v77 = v124;
        if (v107 != 1.0) {
          break;
        }
        id v74 = [v73 nextObject];
        double v120 = 1.0;
        CGFloat v75 = v151;
        CGFloat v76 = v145;
        CGFloat r1b = v141;
        CGFloat r2a = v124;
      }

      while (v74);
    }

    else
    {
      double v120 = 0.0;
      CGFloat r2a = CGRectZero.origin.x;
      CGFloat r1b = v122;
      CGFloat v76 = v153;
      CGFloat v75 = v154;
    }

    CGFloat v129 = v75;
    v191.origin.double x = v131;
    v191.origin.double y = rect1a;
    v191.size.double width = v121;
    double v108 = v122;
    v191.size.double height = v130;
    CGFloat v109 = CGRectZero.origin.x;
    v202.origin.double x = CGRectZero.origin.x;
    v202.origin.double y = v122;
    CGFloat v111 = v153;
    CGFloat v110 = v154;
    v202.size.double width = v153;
    v202.size.double height = v154;
    if (!CGRectEqualToRect(v191, v202)) {
      goto LABEL_78;
    }
    v192.origin.double x = r2a;
    v192.origin.double y = r1b;
    v192.size.double width = v76;
    v192.size.double height = v129;
    v203.origin.double x = CGRectZero.origin.x;
    v203.origin.double y = v122;
    v203.size.double width = v153;
    v203.size.double height = v154;
    if (CGRectEqualToRect(v192, v203))
    {
      __int128 v159 = 0u;
      __int128 v160 = 0u;
      __int128 v157 = 0u;
      __int128 v158 = 0u;
      id v112 = [a3 countByEnumeratingWithState:&v157 objects:v169 count:16];
      if (v112)
      {
        id v113 = v112;
        uint64_t v114 = *(void *)v158;
        do
        {
          for (j = 0LL; j != v113; j = (char *)j + 1)
          {
            if (*(void *)v158 != v114) {
              objc_enumerationMutation(a3);
            }
            CGRect v193 = CGRectFromString((NSString *)objc_msgSend( *(id *)(*((void *)&v157 + 1) + 8 * (void)j),  "objectForKey:",  kMPMetaDataRegionOfInterestBounds,  *(void *)&v120));
            if (v193.origin.y > v108)
            {
              CGFloat v110 = v193.size.height;
              CGFloat v111 = v193.size.width;
              double v108 = v193.origin.y;
              CGFloat v109 = v193.origin.x;
            }
          }

          id v113 = [a3 countByEnumeratingWithState:&v157 objects:v169 count:16];
        }

        while (v113);
      }

      double v116 = v109;
      double v117 = v108;
      double v118 = v111;
      double v119 = v110;
    }

    else
    {
LABEL_78:
      double v117 = r1b;
      double v116 = r2a;
      if (rect2_8 <= v120)
      {
        double v118 = v76;
        double v119 = v129;
      }

      else
      {
        double v116 = v131;
        double v117 = rect1a;
        double v118 = v121;
        double v119 = v130;
      }
    }

    +[MPAuthoringUtilities kbCenterPointFromRect:]( &OBJC_CLASS___MPAuthoringUtilities,  "kbCenterPointFromRect:",  v116,  v117,  v118,  v119,  *(void *)&v120);
  }

  result.double y = v35;
  result.double x = v34;
  return result;
}

- (void)applyAnimatedCropToBreakSlide:(id)a3 withOptions:(id)a4
{
  p_cache = &OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2.cache;
  double v10 = v8 / v9;
  unint64_t v11 = +[MPAuthoringUtilities croppingModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "croppingModeFromOptions:",  a4);
  +[MPAuthoringUtilities aspectRatioFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "aspectRatioFromOptions:", a4);
  double v13 = v12;
  int64_t v14 = +[MPAuthoringUtilities kenBurnsOffsetTypeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "kenBurnsOffsetTypeFromOptions:",  a4);
  if (v11 == 1
    || ((BOOL v15 = @"Crop to Fit", v11 == 4) || v11 == 2)
    && (v10 < 1.0 ? (v16 = v13 <= 1.0) : (v16 = 1), !v16 || (v10 > 1.0 ? (BOOL v17 = v13 < 1.0) : (BOOL v17 = 0), v17)))
  {
    BOOL v15 = @"Scale to Fit";
  }

  id v18 = -[MPDocument regionsOfInterestForPath:]( self->_authoredDocument,  "regionsOfInterestForPath:",  [a3 path]);
  double v19 = v18;
  if (v10 < 1.0)
  {
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v20 = [v18 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (!v20) {
      goto LABEL_38;
    }
    id v21 = v20;
    int64_t v55 = v14;
    double v57 = v15;
    int v22 = 0;
    int v23 = 0;
    uint64_t v24 = *(void *)v64;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v64 != v24) {
          objc_enumerationMutation(v19);
        }
        CGRect v69 = CGRectFromString((NSString *)objc_msgSend( *(id *)(*((void *)&v63 + 1) + 8 * (void)i),  "objectForKey:",  kMPMetaDataRegionOfInterestBounds,  v55,  v57));
        v23 |= v69.origin.y < 0.333000004;
        v22 |= v69.origin.y > 0.666000009;
      }

      id v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v68, 16, v69.origin.x);
    }

    while (v21);
    int64_t v14 = v55;
    BOOL v15 = v57;
    p_cache = (void **)(&OBJC_METACLASS___SYNMediaWallCollectionViewCellMainView2 + 16);
    if (((v22 ^ v23) & 1) != 0)
    {
      if ((v22 & 1) == 0) {
        goto LABEL_25;
      }
    }

    else
    {
LABEL_38:
      LOBYTE(v22) = random() & 1;
      if (!(_BYTE)v22)
      {
LABEL_25:
        double v26 = 1.0;
        if ((v22 & 1) == 0)
        {
          double v27 = 0.5;
          double v28 = 0.0;
LABEL_41:
          double v37 = 0.5;
          goto LABEL_47;
        }

- (void)applyAnimatedCropToSlide:(id)a3 withOptions:(id)a4 centeredAt:(CGPoint)a5 alwaysZoomIn:(BOOL)a6
{
  CGFloat y = a5.y;
  double x = a5.x;
  -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", [a3 path]);
  double v12 = v11;
  double v14 = v13;
  -[MPCropController durationOfSlide:](self, "durationOfSlide:", a3);
  double v118 = v15;
  if (v15 == -1.0)
  {
    +[MPAuthoringUtilities durationPerEffectFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "durationPerEffectFromOptions:",  a4);
    double v118 = v16;
  }

  double v17 = v12 / v14;
  +[MPAuthoringUtilities kenBurnsZoomFactorFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "kenBurnsZoomFactorFromOptions:",  a4);
  double v19 = v18;
  double v109 = y;
  if (a6) {
    unsigned int v20 = 1;
  }
  else {
    unsigned int v20 = +[MPAuthoringUtilities kenBurnsAlwaysZoomInFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "kenBurnsAlwaysZoomInFromOptions:",  a4);
  }
  +[MPAuthoringUtilities aspectRatioFromOptions:](&OBJC_CLASS___MPAuthoringUtilities, "aspectRatioFromOptions:", a4);
  double v22 = v21;
  id v23 = [a3 parentEffect];
  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:imageAspectRatio:",  objc_msgSend(v23, "effectID"),  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  objc_msgSend(v23, "effectID"),  objc_msgSend(v23, "presetID")),  objc_msgSend(a3, "index"),  v22,  v12 / v14);
  if (v24 == 9.22337204e18) {
    double v25 = v22;
  }
  else {
    double v25 = v24;
  }
  unint64_t v26 = +[MPAuthoringUtilities croppingModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "croppingModeFromOptions:",  a4);
  if ([a3 hasMovie]
    && +[MPAuthoringUtilities fitMoviesWhenPossibleFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "fitMoviesWhenPossibleFromOptions:",  a4))
  {
    unint64_t v27 = +[MPAuthoringUtilities croppingModeForFitMoviesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "croppingModeForFitMoviesFromOptions:",  a4);
    BOOL v28 = (v27 & 0x80000000) == 0LL;
    if ((v27 & 0x80000000) == 0) {
      unint64_t v26 = v27;
    }
  }

  else
  {
    BOOL v28 = 0;
  }

  if (v17 > 1.0)
  {
    BOOL v29 = v22 < 1.0 && v26 == 4;
  }

  else
  {
    if (v26 != 2)
    {
      BOOL v29 = v22 > 1.0 && v26 == 4;
      goto LABEL_38;
    }

    BOOL v29 = 1;
  }

  if (v26 == 2 && v29)
  {
    int v31 = kMPSlideSizingModeFit;
    goto LABEL_43;
  }

  int v32 = v26 != 2 || v29;
  if (v32 != 1)
  {
    BOOL v29 = 0;
LABEL_41:
    int v31 = kMPSlideSizingModeCrop;
    goto LABEL_43;
  }

- (void)applyMultiFaceAnimatedCropToSlide:(id)a3 withOptions:(id)a4
{
  double v69 = v8;
  double v70 = v7;
  id v9 = -[MPDocument regionsOfInterestForPath:detect:]( self->_authoredDocument,  "regionsOfInterestForPath:detect:",  [a3 path],  +[MPAuthoringUtilities performFaceDetectionFromOptions:]( MPAuthoringUtilities,  "performFaceDetectionFromOptions:",  a4));
  +[MPAuthoringUtilities kenBurnsZoomFactorFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "kenBurnsZoomFactorFromOptions:",  a4);
  double v67 = v10;
  +[MPAuthoringUtilities kenBurnsPanFactorFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "kenBurnsPanFactorFromOptions:",  a4);
  double v68 = v11;
  double x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  double v72 = width;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  CGFloat rect2_24 = height;
  if (v9)
  {
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    id v19 = [v9 countByEnumeratingWithState:&v83 objects:v88 count:16];
    double x = CGRectZero.origin.x;
    double v16 = y;
    double v17 = width;
    double v18 = height;
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v84;
      double x = CGRectZero.origin.x;
      double v16 = y;
      double v17 = width;
      double v18 = height;
      double v71 = y;
      do
      {
        double v22 = 0LL;
        do
        {
          CGFloat v75 = v16;
          CGFloat v77 = x;
          if (*(void *)v84 != v21) {
            objc_enumerationMutation(v9);
          }
          CGRect v89 = CGRectFromString((NSString *)[*(id *)(*((void *)&v83 + 1) + 8 * (void)v22) objectForKey:kMPMetaDataRegionOfInterestBounds]);
          if (v89.size.width == 0.0) {
            goto LABEL_13;
          }
          CGFloat v23 = v89.size.height;
          if (v89.size.height == 0.0) {
            goto LABEL_13;
          }
          double x = v89.origin.x;
          double v16 = v89.origin.y;
          CGFloat v24 = v89.size.width;
          v90.origin.CGFloat y = v75;
          v90.origin.double x = v77;
          v90.size.CGFloat width = v17;
          v90.size.double height = v18;
          v97.origin.double x = CGRectZero.origin.x;
          v97.origin.CGFloat y = y;
          v97.size.CGFloat width = width;
          v97.size.double height = rect2_24;
          if (CGRectEqualToRect(v90, v97))
          {
            double v17 = v24;
            double v18 = v23;
            goto LABEL_14;
          }

          v91.origin.double x = x;
          v91.origin.CGFloat y = v16;
          v91.size.CGFloat width = v24;
          v91.size.double height = v23;
          v98.origin.double x = CGRectZero.origin.x;
          v98.origin.CGFloat y = y;
          v98.size.CGFloat width = width;
          v98.size.double height = rect2_24;
          if (CGRectEqualToRect(v91, v98))
          {
            CGFloat y = v71;
            CGFloat width = v72;
LABEL_13:
            double v16 = v75;
            double x = v77;
            goto LABEL_14;
          }

          v92.origin.CGFloat y = v75;
          v92.origin.double x = v77;
          v92.size.double height = v18;
          v92.size.CGFloat width = v17;
          v99.origin.double x = x;
          v99.origin.CGFloat y = v16;
          v99.size.CGFloat width = v24;
          v99.size.double height = v23;
          CGRect v93 = CGRectUnion(v92, v99);
          double x = v93.origin.x;
          double v16 = v93.origin.y;
          double v17 = v93.size.width;
          double v18 = v93.size.height;
          CGFloat y = v71;
          CGFloat width = v72;
LABEL_14:
          double v22 = (char *)v22 + 1;
          double height = rect2_24;
        }

        while (v20 != v22);
        id v25 = [v9 countByEnumeratingWithState:&v83 objects:v88 count:16];
        id v20 = v25;
      }

      while (v25);
    }
  }

  v94.origin.double x = x;
  v94.origin.CGFloat y = v16;
  v94.size.CGFloat width = v17;
  v94.size.double height = v18;
  v100.origin.double x = CGRectZero.origin.x;
  v100.origin.CGFloat y = y;
  v100.size.CGFloat width = width;
  v100.size.double height = height;
  BOOL v26 = CGRectEqualToRect(v94, v100);
  double v27 = 0.5;
  double v28 = 0.5;
  if (!v26) {
    +[MPAuthoringUtilities kbCenterPointFromRect:]( &OBJC_CLASS___MPAuthoringUtilities,  "kbCenterPointFromRect:",  x,  v16,  v17,  v18);
  }
  double rect2_16 = v17;
  double v76 = v27;
  double v78 = v28;
  CGFloat v29 = v72;
  double v30 = CGRectZero.origin.x;
  double v31 = y;
  double v32 = v72;
  CGFloat v33 = height;
  if (v9)
  {
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    id v34 = [v9 countByEnumeratingWithState:&v79 objects:v87 count:16];
    double v30 = CGRectZero.origin.x;
    double v31 = y;
    double v32 = v72;
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v80;
      double v30 = CGRectZero.origin.x;
      double v31 = y;
      double v32 = v72;
      do
      {
        for (i = 0LL; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v80 != v36) {
            objc_enumerationMutation(v9);
          }
          CGRect v95 = CGRectFromString((NSString *)[*(id *)(*((void *)&v79 + 1) + 8 * (void)i) objectForKey:kMPMetaDataRegionOfInterestBounds]);
          if (v95.size.width * v95.size.height > v32 * height)
          {
            double v30 = v95.origin.x;
            double v31 = v95.origin.y;
            double v32 = v95.size.width;
            double height = v95.size.height;
          }
        }

        id v35 = [v9 countByEnumeratingWithState:&v79 objects:v87 count:16];
      }

      while (v35);
      CGFloat v29 = v72;
      CGFloat v33 = rect2_24;
    }
  }

  v96.origin.double x = v30;
  v96.origin.CGFloat y = v31;
  v96.size.CGFloat width = v32;
  v96.size.double height = height;
  v101.origin.double x = CGRectZero.origin.x;
  v101.origin.CGFloat y = y;
  v101.size.CGFloat width = v29;
  v101.size.double height = v33;
  double v38 = 0.5;
  double v39 = 0.5;
  if (!CGRectEqualToRect(v96, v101))
  {
    +[MPAuthoringUtilities kbCenterPointFromRect:]( &OBJC_CLASS___MPAuthoringUtilities,  "kbCenterPointFromRect:",  v30,  v31,  v32,  height);
    double v38 = v40;
    double v39 = v41;
  }

  double v42 = v70 / v69;
  double v43 = randomFloatInRange(1.00999999, 1.03899999);
  double v44 = randomFloatInRange(1.27099995, 1.29999995);
  unint64_t v45 = +[MPAuthoringUtilities croppingModeFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "croppingModeFromOptions:",  a4);
  if ([a3 hasMovie]
    && +[MPAuthoringUtilities fitMoviesWhenPossibleFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "fitMoviesWhenPossibleFromOptions:",  a4))
  {
    +[MPAuthoringUtilities croppingModeForFitMoviesFromOptions:]( &OBJC_CLASS___MPAuthoringUtilities,  "croppingModeForFitMoviesFromOptions:",  a4);
  }

  if (v42 < 1.0 && v45 == 2) {
    goto LABEL_38;
  }
  if (v42 >= 1.0 && v45 == 2 || !v45)
  {
    double v46 = kMPSlideSizingModeCrop;
  }

  else
  {
    if (v45 == 1)
    {
LABEL_38:
      double v46 = kMPSlideSizingModeFit;
      goto LABEL_45;
    }

    double v46 = kMPSlideSizingModeBestFit;
  }

- (double)durationOfSlide:(id)a3
{
  id v4 = [a3 parentEffect];
  double result = -1.0;
  if (v4) {
    objc_msgSend(objc_msgSend(a3, "parentEffect", -1.0), "fullDuration");
  }
  if (result == 0.0) {
    return -1.0;
  }
  return result;
}

@end