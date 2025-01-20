@interface MPStyleManager
+ (id)sharedManager;
+ (void)loadStyleManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (BOOL)authorOnAspectRatioChangeForStyleID:(id)a3;
- (BOOL)canCancelAuthoringForStyleID:(id)a3;
- (BOOL)canUseClusteringForStyleID:(id)a3;
- (BOOL)easeKenBurnsForStyleID:(id)a3;
- (BOOL)hasImagesForLayerID:(id)a3 forStyleID:(id)a4;
- (BOOL)isDynamicForStyleID:(id)a3;
- (BOOL)machineMeetsRequirementsForStyleID:(id)a3;
- (BOOL)needsFaceDetectionForStyleID:(id)a3;
- (BOOL)needsReauthorOnAspectRatioChange:(id)a3;
- (BOOL)needsStyleUpdateOnSlideChangeForStyleID:(id)a3;
- (BOOL)needsTimingUpdateOnSlideChangeForStyleID:(id)a3;
- (BOOL)needsToBeLiveForStyleID:(id)a3;
- (BOOL)supportsRandomTransitionForStyleID:(id)a3;
- (CGColor)backgroundCGColorForStyleID:(id)a3;
- (CGSize)defaultSizeForZIndex:(int64_t)a3 ofStyle:(id)a4;
- (MPStyleManager)initWithPaths:(id)a3;
- (double)allowUserDefinedDurationForStyleID:(id)a3;
- (double)basePeriodForLayerIndex:(int64_t)a3 ofStyle:(id)a4;
- (double)defaultAutoKenBurnsLikelihoodForEffect:(id)a3 withPreset:(id)a4 ofStyle:(id)a5;
- (double)defaultAutoKenBurnsLikelihoodForZIndex:(int64_t)a3 ofStyle:(id)a4;
- (double)defaultEffectDurationForLayer:(int64_t)a3 ofStyle:(id)a4;
- (double)defaultFilterLikelihoodForZIndex:(int64_t)a3 ofStyle:(id)a4;
- (double)defaultTransitionDurationForLayer:(int64_t)a3 ofStyle:(id)a4 withAspectRatio:(double)a5;
- (double)delayFaceDetectionForStyleID:(id)a3;
- (double)displayDurationFactorForEffectID:(id)a3 inStyleID:(id)a4;
- (double)displayDurationFactorForStyleID:(id)a3;
- (double)minimumDurationForEffectID:(id)a3 forStyleID:(id)a4;
- (double)minimumEffectDurationForStyleID:(id)a3;
- (double)navigationIncrementForStyleID:(id)a3;
- (double)posterTimeForStyleID:(id)a3;
- (double)shortestDurationForEffectID:(id)a3 forStyleID:(id)a4;
- (double)shortestEffectDurationForStyleID:(id)a3;
- (id)_containerDescriptionForLayerAtIndex:(int64_t)a3 ofStyle:(id)a4;
- (id)allStyleIDs;
- (id)backgroundColorLayersForStyleID:(id)a3;
- (id)defaultColorSchemeForStyleID:(id)a3;
- (id)defaultPositionForZIndex:(int64_t)a3 ofStyle:(id)a4;
- (id)demoDocumentWithImages:(id)a3 properties:(id)a4 count:(int64_t)a5 options:(id)a6;
- (id)descriptionForStyleID:(id)a3;
- (id)effectIDsForStyleID:(id)a3;
- (id)effectPresetIDsForLayerIndex:(int64_t)a3 ofStyleID:(id)a4;
- (id)effectPresetIDsForStyleID:(id)a3;
- (id)effectPresetsForLayerIndex:(int64_t)a3 ofStyleID:(id)a4;
- (id)framesForStyleID:(id)a3;
- (id)interstitialEffectLayoutForStyleID:(id)a3;
- (id)interstitialEffectLayoutsForStyleID:(id)a3;
- (id)layerIDForLayerIndex:(int64_t)a3 ofStyle:(id)a4;
- (id)localizedNameForStyleID:(id)a3;
- (id)localizedNameForStyleID:(id)a3 withLanguage:(id)a4;
- (id)previewPathForStyleID:(id)a3;
- (id)resourcePathForStyleID:(id)a3;
- (id)songPathsForStyleID:(id)a3;
- (id)thumbnailPathForStyleID:(id)a3;
- (id)thumbnailPathForStyleID:(id)a3 scaleFactor:(double)a4;
- (id)titleEffectLayoutForStyleID:(id)a3;
- (id)titleEffectLayoutsForStyleID:(id)a3;
- (id)transitionsForStyleID:(id)a3;
- (id)versionOfStyleID:(id)a3;
- (int64_t)antialiasLevelForStyleID:(id)a3;
- (int64_t)defaultAutoKenBurnsLevelForEffect:(id)a3 withPreset:(id)a4 ofStyle:(id)a5;
- (int64_t)defaultAutoKenBurnsLevelForZIndex:(int64_t)a3 ofStyle:(id)a4;
- (int64_t)dynamicBatchSizeForStyleID:(id)a3;
- (int64_t)indexOfMainLayerForStyleID:(id)a3;
- (int64_t)indexOfTitleEffectLayerForStyleID:(id)a3;
- (int64_t)kenBurnsOffsetTypeForStyleID:(id)a3;
- (int64_t)layerIndexForLayerID:(id)a3 ofStyle:(id)a4;
- (int64_t)numberOfSlidesToPreloadForStyleID:(id)a3;
- (unint64_t)mediaPresentationOrderForStyleID:(id)a3;
- (unint64_t)regionOfInterestPickModeForStyleID:(id)a3;
- (unint64_t)reorderModeForStyleID:(id)a3;
- (unint64_t)subtitleOrderForStyleID:(id)a3;
- (void)dealloc;
- (void)reloadBundles;
@end

@implementation MPStyleManager

+ (id)sharedManager
{
  id result = (id)qword_2B05A8;
  if (!qword_2B05A8)
  {
    objc_sync_enter(a1);
    if (!qword_2B05A8) {
      qword_2B05A8 = -[MPStyleManager initWithPaths:](objc_alloc(&OBJC_CLASS___MPStyleManager), "initWithPaths:", 0LL);
    }
    objc_sync_exit(a1);
    return (id)qword_2B05A8;
  }

  return result;
}

+ (void)releaseSharedManager
{
  if (qword_2B05A8)
  {
    objc_sync_enter(a1);

    qword_2B05A8 = 0LL;
    objc_sync_exit(a1);
  }

- (void)dealloc
{
  self->mStyles = 0LL;
  self->mPaths = 0LL;

  self->mCurrentLocale = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPStyleManager;
  -[MPStyleManager dealloc](&v3, "dealloc");
}

- (id)allStyleIDs
{
  char v3 = 1;
  return objc_msgSend( -[NSMutableDictionary allKeys](self->mStyles, "allKeys"),  "sortedArrayUsingFunction:context:",  sortByLocalizedName,  &v3);
}

- (id)descriptionForStyleID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3);
}

- (id)versionOfStyleID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"version");
}

- (BOOL)needsFaceDetectionForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"needsFaceDetection");
  if (v3) {
    return [v3 BOOLValue];
  }
  else {
    return 1;
  }
}

- (double)delayFaceDetectionForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"delayFaceDetection");
  if (!v3) {
    return 0.0;
  }
  [v3 doubleValue];
  return result;
}

- (BOOL)needsToBeLiveForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"needsToBeLive");
  if (v3) {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (BOOL)isDynamicForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"isDynamic");
  if (v3) {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (int64_t)dynamicBatchSizeForStyleID:(id)a3
{
  int64_t result = (int64_t)objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"dynamicBatchSize");
  if (result) {
    return (int64_t)[(id)result integerValue];
  }
  return result;
}

- (id)localizedNameForStyleID:(id)a3
{
  v5 = +[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages");
  if (v5 && (v6 = v5, -[NSArray count](v5, "count"))) {
    v7 = -[NSArray objectAtIndex:](v6, "objectAtIndex:", 0LL);
  }
  else {
    v7 = &stru_259C60;
  }
  id result = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"localizedStyleName");
  if (!result) {
    return a3;
  }
  return result;
}

- (id)localizedNameForStyleID:(id)a3 withLanguage:(id)a4
{
  v5 = +[NSDictionary dictionaryWithContentsOfFile:]( NSDictionary,  "dictionaryWithContentsOfFile:",  objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:"),  "objectForKey:",  @"resources"),  "stringByAppendingPathComponent:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@.lproj/LocalizedDescription.plist",  a4)));
  if (v5) {
    v5 = -[NSDictionary objectForKey:](v5, "objectForKey:", @"_LOCALIZABLE_");
  }
  id result = -[NSDictionary objectForKey:](v5, "objectForKey:", @"localizedStyleName");
  if (!result) {
    return a3;
  }
  return result;
}

- (id)thumbnailPathForStyleID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"thumbnail");
}

- (id)thumbnailPathForStyleID:(id)a3 scaleFactor:(double)a4
{
  id v5 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"thumbnail");
  v6 = v5;
  if (a4 > 1.0)
  {
    id v7 = objc_msgSend( objc_msgSend(objc_msgSend(v5, "stringByDeletingPathExtension"), "stringByAppendingString:", @"@2x"),  "stringByAppendingPathExtension:",  objc_msgSend(v5, "pathExtension"));
    if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v7))
    {
      return v7;
    }
  }

  return v6;
}

- (id)previewPathForStyleID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"preview");
}

- (id)resourcePathForStyleID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"resources");
}

- (id)framesForStyleID:(id)a3
{
  id v5 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  id v6 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"layout");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( v5,  "addObjectsFromArray:",  objc_msgSend( objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10)),  "objectForKey:",  @"slideFramesCriteria"));
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)effectPresetIDsForStyleID:(id)a3
{
  id v5 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  id v6 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"layout");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( v5,  "addObjectsFromArray:",  objc_msgSend( objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10)),  "objectForKey:",  @"effectPresets"));
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)effectPresetsForLayerIndex:(int64_t)a3 ofStyleID:(id)a4
{
  id v5 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a4),  "objectForKey:",  @"layout");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v6) {
    return 0LL;
  }
  id v7 = v6;
  id v8 = 0LL;
  uint64_t v9 = *(void *)v15;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = [v5 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * (void)i)];
      if (objc_msgSend(objc_msgSend(v11, "objectForKey:", @"zIndex"), "integerValue") == (id)a3)
      {
        id v12 = [v11 objectForKey:@"effectPresets"];
        if ([v12 count]) {
          id v8 = v12;
        }
      }
    }

    id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }

  while (v7);
  return v8;
}

- (CGColor)backgroundCGColorForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"backgroundColor");
  if (!v3 || (v4 = +[MPUtilities CGColorFromString:](&OBJC_CLASS___MPUtilities, "CGColorFromString:", v3)) == 0LL)
  {
    id v5 = +[MPUtilities newColorSpaceForDevice]( &OBJC_CLASS___MPUtilities,  "newColorSpaceForDevice",  0LL,  0LL,  0LL,  unk_1F80B0);
    v4 = CGColorCreate(v5, (const CGFloat *)&v7);
    CGColorSpaceRelease(v5);
  }

  return v4;
}

- (id)effectIDsForStyleID:(id)a3
{
  id v5 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"layout");
  id v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        id v7 = objc_msgSend( objc_msgSend(obj, "objectForKey:", *(void *)(*((void *)&v22 + 1) + 8 * (void)v6)),  "objectForKey:",  @"effectPresets");
        if ([v7 count])
        {
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          id v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v19;
            do
            {
              id v11 = 0LL;
              do
              {
                if (*(void *)v19 != v10) {
                  objc_enumerationMutation(v7);
                }
                id v12 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v11) valueForKey:@"presetID"];
                if (v12)
                {
                  id v13 = v12;
                  if ([v12 rangeOfString:@"/"] != (id)0x7FFFFFFFFFFFFFFFLL) {
                    id v13 = objc_msgSend(v13, "substringToIndex:", objc_msgSend(v13, "rangeOfString:", @"/"));
                  }
                  [v5 addObject:v13];
                }

                id v11 = (char *)v11 + 1;
              }

              while (v9 != v11);
              id v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }

            while (v9);
          }
        }

        id v6 = (char *)v6 + 1;
      }

      while (v6 != v16);
      id v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v16);
  }

  return v5;
}

- (id)transitionsForStyleID:(id)a3
{
  id v5 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"layout");
  id v18 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v6;
        id v7 = objc_msgSend( objc_msgSend(obj, "objectForKey:", *(void *)(*((void *)&v25 + 1) + 8 * v6), v17),  "objectForKey:",  @"transitionPresets");
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          id v10 = v8;
          uint64_t v11 = *(void *)v22;
          do
          {
            id v12 = 0LL;
            do
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v7);
              }
              id v13 = *(id *)(*((void *)&v21 + 1) + 8LL * (void)v12);
              uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
              if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
                id v13 = [v13 objectForKey:@"presetID"];
              }
              id v15 = +[MPUtilities idOfCombinedID:](&OBJC_CLASS___MPUtilities, "idOfCombinedID:", v13);
              if (v15) {
                [v5 addObject:v15];
              }
              id v12 = (char *)v12 + 1;
            }

            while (v10 != v12);
            id v10 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }

          while (v10);
        }

        uint64_t v6 = v20 + 1;
      }

      while ((id)(v20 + 1) != v18);
      id v18 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v18);
  }

  return v5;
}

- (id)songPathsForStyleID:(id)a3
{
  return  objc_msgSend( objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"songs"),  "copy");
}

- (int64_t)indexOfMainLayerForStyleID:(id)a3
{
  id v3 = -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3);
  v4 = (const __CFString *)[v3 objectForKey:@"mainLayer"];
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = @"background";
  }
  return (int64_t)objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(v3, "objectForKey:", @"layout"), "objectForKey:", v5),  "objectForKey:",  @"zIndex"),  "integerValue");
}

- (int64_t)indexOfTitleEffectLayerForStyleID:(id)a3
{
  v4 = (const __CFString *)objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "titleEffectLayoutForStyleID:",  a3),  "objectForKey:",  @"layer");
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = @"background";
  }
  return (int64_t)objc_msgSend( objc_msgSend( objc_msgSend( objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"layout"),  "objectForKey:",  v5),  "objectForKey:",  @"zIndex"),  "integerValue");
}

- (id)titleEffectLayoutsForStyleID:(id)a3
{
  return objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"titleEffects");
}

- (id)interstitialEffectLayoutsForStyleID:(id)a3
{
  return objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"interstitialEffects");
}

- (id)interstitialEffectLayoutForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"interstitialEffects");
  uint64_t v4 = (uint64_t)[v3 count];
  if (v4 < 1) {
    return 0LL;
  }
  else {
    return [v3 objectAtIndex:rand() % v4];
  }
}

- (id)titleEffectLayoutForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"titleEffects");
  uint64_t v4 = (uint64_t)[v3 count];
  if (v4 < 1) {
    return 0LL;
  }
  else {
    return [v3 objectAtIndex:rand() % v4];
  }
}

- (double)shortestEffectDurationForStyleID:(id)a3
{
  id v5 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfMainLayerForStyleID:",  a3);
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "defaultEffectDurationForLayer:ofStyle:",  v5,  a3);
  double v7 = v6;
  if (v6 < 0.0)
  {
    id v8 = -[MPStyleManager effectPresetIDsForLayerIndex:ofStyleID:]( self,  "effectPresetIDsForLayerIndex:ofStyleID:",  v5,  a3);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      double v7 = -1.0;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultFullDurationForEffectID:",  *(void *)(*((void *)&v18 + 1) + 8 * (void)i));
          if (v13 < v7 || v7 == -1.0) {
            double v7 = v13;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v10);
    }

    else
    {
      double v7 = -1.0;
    }
  }

  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "minimumEffectDurationForStyleID:",  a3);
  if (v7 < v15) {
    double v7 = v15;
  }
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "basePeriodForLayerIndex:ofStyle:",  v5,  a3);
  return fmax(v7 * v16, 0.0);
}

- (double)shortestDurationForEffectID:(id)a3 forStyleID:(id)a4
{
  id v6 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfMainLayerForStyleID:",  a4);
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "defaultEffectDurationForLayer:ofStyle:",  v6,  a4);
  double v8 = v7;
  if (v7 < 0.0)
  {
    objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultFullDurationForEffectID:",  a3);
    double v8 = v9;
  }

  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "minimumEffectDurationForStyleID:",  a4);
  if (v8 < v10) {
    double v8 = v10;
  }
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "basePeriodForLayerIndex:ofStyle:",  v6,  a4);
  return fmax(v8 * v11, 0.0);
}

- (double)minimumDurationForEffectID:(id)a3 forStyleID:(id)a4
{
  if (v6 == 0.0) {
    objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultFullDurationForEffectID:",  a3);
  }
  double v7 = v6;
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "minimumEffectDurationForStyleID:",  a4);
  if (v7 >= v8) {
    double v8 = v7;
  }
  return fmax(v8, 0.0);
}

- (double)minimumEffectDurationForStyleID:(id)a3
{
  id v3 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"layout");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    double v7 = -1.0;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = objc_msgSend( objc_msgSend(v3, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * (void)i)),  "objectForKey:",  @"minimumEffectDuration");
        if (v9)
        {
          [v9 doubleValue];
          if (v10 < v7 || v7 == -1.0) {
            double v7 = v10;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v5);
  }

  else
  {
    double v7 = -1.0;
  }

  return fmax(v7, 0.0);
}

- (BOOL)machineMeetsRequirementsForStyleID:(id)a3
{
  return 1;
}

- (BOOL)supportsRandomTransitionForStyleID:(id)a3
{
  id v3 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"supportsRandomTransition");
  if (v3) {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (id)defaultColorSchemeForStyleID:(id)a3
{
  return objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"defaultColorScheme");
}

- (BOOL)authorOnAspectRatioChangeForStyleID:(id)a3
{
  return objc_msgSend( objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"authorOnAspectRatioChange"),  "BOOLValue");
}

- (unint64_t)subtitleOrderForStyleID:(id)a3
{
  unint64_t result = (unint64_t)objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"interstitialMode");
  if (result) {
    return (unint64_t)[(id)result integerValue];
  }
  return result;
}

- (int64_t)numberOfSlidesToPreloadForStyleID:(id)a3
{
  id v3 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"numOfSlidesToPreload");
  if (v3) {
    return (int64_t)[v3 integerValue];
  }
  else {
    return 15LL;
  }
}

- (BOOL)needsTimingUpdateOnSlideChangeForStyleID:(id)a3
{
  id v3 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"timingUpdateOnSlideChange");
  if (v3) {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (BOOL)needsStyleUpdateOnSlideChangeForStyleID:(id)a3
{
  id v3 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"styleUpdateOnSlideChange");
  if (v3) {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (BOOL)needsReauthorOnAspectRatioChange:(id)a3
{
  id v3 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"needsAuthorOnAspectChange");
  if (v3) {
    return [v3 BOOLValue];
  }
  else {
    return 1;
  }
}

- (double)posterTimeForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"posterTime");
  if (!v3) {
    return -1.0;
  }
  [v3 doubleValue];
  return result;
}

- (BOOL)canUseClusteringForStyleID:(id)a3
{
  id v3 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"canUseClustering");
  if (v3) {
    return [v3 BOOLValue];
  }
  else {
    return 1;
  }
}

+ (void)loadStyleManagerWithPaths:(id)a3
{
  if (qword_2B05A8)
  {

    qword_2B05A8 = 0LL;
  }

  qword_2B05A8 = -[MPStyleManager initWithPaths:](objc_alloc(&OBJC_CLASS___MPStyleManager), "initWithPaths:", a3);
}

- (unint64_t)mediaPresentationOrderForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"mediaPresentationOrder");
  if (v3) {
    return (unint64_t)[v3 integerValue];
  }
  else {
    return 2LL;
  }
}

- (id)demoDocumentWithImages:(id)a3 properties:(id)a4 count:(int64_t)a5 options:(id)a6
{
  double v11 = (const __CFString *)[a6 objectForKey:kMPAuthoringStyleID];
  if (v11) {
    id v12 = v11;
  }
  else {
    id v12 = @"Classic";
  }
  id v13 = -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", v12);
  id v14 = [v13 objectForKey:@"demoSlideCount"];
  if (v14) {
    id v15 = [v14 integerValue];
  }
  else {
    id v15 = &dword_0 + 2;
  }
  if (a5 != -1)
  {
    id v15 = (id)a5;
  }

  if ([a3 count] >= v15) {
    a3 = objc_msgSend( a3,  "objectsAtIndexes:",  +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v15));
  }
  __int128 v16 = objc_alloc_init(&OBJC_CLASS___MPDocument);
  -[MPDocument _setMediaProperties:](v16, "_setMediaProperties:", a4);
  uint64_t v17 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  -[MPDocument documentAttributeForKey:](v16, "documentAttributeForKey:", kMPDocumentAuthoringOptions[0]));
  __int128 v18 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
  -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v18, kMPAuthoringUseTitleEffect);
  __int128 v19 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
  -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v19, kMPAuthoringUseDefaultAudio);
  LODWORD(v20) = 0;
  __int128 v21 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v20);
  -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v21, kMPAuthoringMovieVolume);
  __int128 v22 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
  -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v22, kMPAuthoringSaveVersionInformation);
  __int128 v23 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
  -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v23, kMPAuthoringRequestGeneratedImages);
  id v24 = [v13 objectForKey:@"demoOptions"];
  if (v24) {
    -[NSMutableDictionary addEntriesFromDictionary:](v17, "addEntriesFromDictionary:", v24);
  }
  if (a6) {
    -[NSMutableDictionary addEntriesFromDictionary:](v17, "addEntriesFromDictionary:", a6);
  }
  -[MPDocument setDocumentAttribute:forKey:](v16, "setDocumentAttribute:forKey:", v17, kMPDocumentAuthoringOptions[0]);
  -[MPDocument addVideoPaths:](v16, "addVideoPaths:", a3);
  -[MPDocument applyStyle:](v16, "applyStyle:", v12);
  return v16;
}

- (int64_t)antialiasLevelForStyleID:(id)a3
{
  int64_t result = (int64_t)objc_msgSend( -[NSMutableDictionary objectForKey:](self->mStyles, "objectForKey:", a3),  "objectForKey:",  @"antialiasLevel");
  if (result) {
    return (int64_t)[(id)result integerValue];
  }
  return result;
}

- (double)displayDurationFactorForStyleID:(id)a3
{
  unsigned int v5 = [a3 hasSuffix:@"Mobile"];
  double result = 1.0;
  if (v5)
  {
    id v7 = -[MPStyleManager effectPresetIDsForLayerIndex:ofStyleID:]( self,  "effectPresetIDsForLayerIndex:ofStyleID:",  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager", 1.0),  "indexOfMainLayerForStyleID:",  a3),  a3);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = 0LL;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfImagesForEffectID:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)i));
        }

        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
      double v14 = (double)v10;
    }

    else
    {
      double v14 = 0.0;
    }

    return 1.0 / v14;
  }

  return result;
}

- (double)displayDurationFactorForEffectID:(id)a3 inStyleID:(id)a4
{
  unsigned int v5 = objc_msgSend(a3, "hasPrefix:", @"HangingPictures", a4);
  double result = 1.0;
  if (v5) {
    return 1.0
  }
         / (double)(uint64_t)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager", 1.0),  "numOfImagesForEffectID:",  a3);
  return result;
}

- (int64_t)kenBurnsOffsetTypeForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "valueForKey:",  @"kenBurnsOffsetType");
  if (v3) {
    return (int64_t)[v3 integerValue];
  }
  else {
    return -1LL;
  }
}

- (BOOL)easeKenBurnsForStyleID:(id)a3
{
  id v3 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "valueForKey:",  @"easeKenBurns");
  if (v3) {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (CGSize)defaultSizeForZIndex:(int64_t)a3 ofStyle:(id)a4
{
  id v5 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a4),  "objectForKey:",  @"layout");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  CGFloat width = 2.0;
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [v5 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * (void)v10)];
        if (objc_msgSend(objc_msgSend(v11, "objectForKey:", @"zIndex"), "integerValue") == (id)a3)
        {
          id v13 = (NSString *)[v11 objectForKey:@"size"];
          double height = 2.0;
          if (v13)
          {
            CGSize v14 = CGSizeFromString(v13);
            double height = v14.height;
            CGFloat width = v14.width;
          }

          goto LABEL_12;
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  double height = 2.0;
LABEL_12:
  double v15 = width;
  result.double height = height;
  result.CGFloat width = v15;
  return result;
}

- (unint64_t)reorderModeForStyleID:(id)a3
{
  unint64_t result = (unint64_t)objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"reorderMode");
  if (result) {
    return (unint64_t)[(id)result integerValue];
  }
  return result;
}

- (id)defaultPositionForZIndex:(int64_t)a3 ofStyle:(id)a4
{
  id v5 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a4),  "objectForKey:",  @"layout");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [v5 objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v7 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

- (double)defaultFilterLikelihoodForZIndex:(int64_t)a3 ofStyle:(id)a4
{
  id v5 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a4),  "objectForKey:",  @"layout");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  double v7 = -1.0;
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [v5 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * (void)i)];
        if (objc_msgSend(objc_msgSend(v11, "objectForKey:", @"zIndex"), "integerValue") == (id)a3)
        {
          id v12 = [v11 objectForKey:@"filterLikelihood"];
          if (v12)
          {
            [v12 floatValue];
            return v13;
          }

          return v7;
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  return v7;
}

- (double)defaultAutoKenBurnsLikelihoodForZIndex:(int64_t)a3 ofStyle:(id)a4
{
  id v5 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a4),  "objectForKey:",  @"layout");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  double result = -1.0;
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [v5 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * (void)i)];
        if (objc_msgSend(objc_msgSend(v11, "objectForKey:", @"zIndex"), "integerValue") == (id)a3)
        {
          id v12 = [v11 objectForKey:@"autoKenBurnsLikelihood"];
          double result = -1.0;
          if (v12)
          {
            objc_msgSend(v12, "floatValue", -1.0);
            double result = v13;
          }

          goto LABEL_12;
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    double result = -1.0;
  }

- (int64_t)defaultAutoKenBurnsLevelForZIndex:(int64_t)a3 ofStyle:(id)a4
{
  id v5 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a4),  "objectForKey:",  @"layout");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = [v5 objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        return 1LL;
      }
    }

    id v11 = [v10 objectForKey:@"autoKenBurnsLevel"];
    if (v11)
    {
      int64_t result = (int64_t)[v11 integerValue];
      if (result != -1) {
        return result;
      }
    }
  }

  return 1LL;
}

- (double)defaultAutoKenBurnsLikelihoodForEffect:(id)a3 withPreset:(id)a4 ofStyle:(id)a5
{
  id v7 = -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a5);
  id v8 = [v7 objectForKey:@"layout"];
  uint64_t v9 = (const __CFString *)[v7 objectForKey:@"mainLayer"];
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = @"background";
  }
  id v11 = objc_msgSend(objc_msgSend(v8, "objectForKey:", v10), "objectForKey:", @"effectPresets");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v12) {
    return -1.0;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v23;
  double v15 = -1.0;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v11);
      }
      __int128 v17 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
      id v18 = [v17 valueForKey:@"presetID"];
      if ([v18 hasPrefix:a3])
      {
        if ([v18 hasSuffix:a4])
        {
          id v19 = [v17 objectForKey:@"autoKenBurnsLikelihood"];
          if (v19)
          {
            [v19 floatValue];
            double v15 = v20;
          }
        }
      }
    }

    id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }

  while (v13);
  return v15;
}

- (int64_t)defaultAutoKenBurnsLevelForEffect:(id)a3 withPreset:(id)a4 ofStyle:(id)a5
{
  id v7 = -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a5);
  id v8 = [v7 objectForKey:@"layout"];
  uint64_t v9 = (const __CFString *)[v7 objectForKey:@"mainLayer"];
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = @"background";
  }
  id v11 = objc_msgSend(objc_msgSend(v8, "objectForKey:", v10), "objectForKey:", @"effectPresets");
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v12) {
    return 1LL;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v22;
  id v15 = &dword_0 + 1;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v11);
      }
      __int128 v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
      id v18 = [v17 valueForKey:@"presetID"];
      if ([v18 hasPrefix:a3])
      {
        if ([v18 hasSuffix:a4])
        {
          id v19 = [v17 objectForKey:@"autoKenBurnsLevel"];
          if (v19) {
            id v15 = [v19 integerValue];
          }
        }
      }
    }

    id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }

  while (v13);
  return (int64_t)v15;
}

- (id)effectPresetIDsForLayerIndex:(int64_t)a3 ofStyleID:(id)a4
{
  id v6 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  id v7 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a4),  "objectForKey:",  @"layout");
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [v7 objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * (void)v11)];
        if (objc_msgSend(objc_msgSend(v12, "objectForKey:", @"zIndex"), "integerValue") == (id)a3)
        {
          id v13 = [v12 objectForKey:@"effectPresets"];
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v22;
            do
            {
              __int128 v17 = 0LL;
              do
              {
                if (*(void *)v22 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v17) valueForKey:@"presetID"];
                if (v18) {
                  [v6 addObject:v18];
                }
                __int128 v17 = (char *)v17 + 1;
              }

              while (v15 != v17);
              id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }

            while (v15);
          }
        }

        id v11 = (char *)v11 + 1;
      }

      while (v11 != v9);
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v9);
  }

  return v6;
}

- (double)defaultEffectDurationForLayer:(int64_t)a3 ofStyle:(id)a4
{
  id v4 = -[MPStyleManager _containerDescriptionForLayerAtIndex:ofStyle:]( self,  "_containerDescriptionForLayerAtIndex:ofStyle:",  a3,  a4);
  if (!v4) {
    return -1.0;
  }
  id v5 = v4;
  if (![v4 objectForKey:@"recommendedEffectDuration"]) {
    return -1.0;
  }
  objc_msgSend(objc_msgSend(v5, "objectForKey:", @"recommendedEffectDuration"), "doubleValue");
  return result;
}

- (double)defaultTransitionDurationForLayer:(int64_t)a3 ofStyle:(id)a4 withAspectRatio:(double)a5
{
  id v6 = -[MPStyleManager _containerDescriptionForLayerAtIndex:ofStyle:]( self,  "_containerDescriptionForLayerAtIndex:ofStyle:",  a3,  a4);
  if (!v6) {
    return -1.0;
  }
  id v7 = v6;
  double v8 = -1.0;
  if (a5 >= 1.0
    || (id v9 = [v6 objectForKey:@"recommendedPortraitTransitionDuration"]) == 0
    || ([v9 doubleValue], double v8 = v10, v10 < 0.0))
  {
    id v11 = [v7 objectForKey:@"recommendedTransitionDuration"];
    if (v11)
    {
      [v11 doubleValue];
      return result;
    }
  }

  return v8;
}

- (double)basePeriodForLayerIndex:(int64_t)a3 ofStyle:(id)a4
{
  id v4 = objc_msgSend( -[MPStyleManager _containerDescriptionForLayerAtIndex:ofStyle:]( self,  "_containerDescriptionForLayerAtIndex:ofStyle:",  a3,  a4),  "objectForKey:",  @"basePeriod");
  if (!v4) {
    return 1.0;
  }
  [v4 doubleValue];
  return result;
}

- (int64_t)layerIndexForLayerID:(id)a3 ofStyle:(id)a4
{
  return (int64_t)objc_msgSend( objc_msgSend( objc_msgSend( objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a4),  "objectForKey:",  @"layout"),  "objectForKey:",  a3),  "objectForKey:",  @"zIndex"),  "integerValue");
}

- (id)layerIDForLayerIndex:(int64_t)a3 ofStyle:(id)a4
{
  id v5 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a4),  "objectForKey:",  @"layout");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0LL;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    double v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend( objc_msgSend(objc_msgSend(v5, "objectForKey:", v10), "objectForKey:", @"zIndex"),  "integerValue") == (id)a3) {
      return v10;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (id)backgroundColorLayersForStyleID:(id)a3
{
  id v3 = -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3);
  id v4 = [v3 objectForKey:@"backgroundColorLayer"];
  if (v4) {
    return +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v4);
  }
  else {
    return [v3 objectForKey:@"backgroundColorLayers"];
  }
}

- (unint64_t)regionOfInterestPickModeForStyleID:(id)a3
{
  return (unint64_t)objc_msgSend( objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"roiPickMode"),  "integerValue");
}

- (BOOL)canCancelAuthoringForStyleID:(id)a3
{
  return objc_msgSend( objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a3),  "objectForKey:",  @"canCancelAuthoring"),  "BOOLValue");
}

- (BOOL)hasImagesForLayerID:(id)a3 forStyleID:(id)a4
{
  id v4 = objc_msgSend( objc_msgSend( objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a4),  "objectForKey:",  @"layout"),  "objectForKey:",  a3),  "objectForKey:",  @"hasImages");
  return v5;
}

- (double)navigationIncrementForStyleID:(id)a3
{
  id v3 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"navigationIncrement");
  if (!v3) {
    return -1.0;
  }
  [v3 doubleValue];
  return result;
}

- (double)allowUserDefinedDurationForStyleID:(id)a3
{
  unsigned __int8 v4 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "isDynamicForStyleID:",  a3);
  double result = 0.0;
  if ((v4 & 1) == 0)
  {
    id v6 = objc_msgSend( objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager", 0.0),  "descriptionForStyleID:",  a3),  "objectForKey:",  @"allowUserDefinedDuration");
    if (v6) {
      return (double)[v6 BOOLValue];
    }
    else {
      return 1.0;
    }
  }

  return result;
}

- (MPStyleManager)initWithPaths:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MPStyleManager;
  unsigned __int8 v4 = -[MPStyleManager init](&v10, "init");
  if (v4)
  {
    id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    id v7 = v5;
    if (a3) {
      [v5 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend( v5,  "addObject:",  -[NSString stringByAppendingPathComponent:]( -[NSBundle resourcePath]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(MPStyleManager, v6)),  "resourcePath"),  "stringByAppendingPathComponent:",  @"Content"));
    }
    v4->mPaths = (NSArray *)v7;
    -[MPStyleManager reloadBundles](v4, "reloadBundles");
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    srand(Current);
    if (!-[NSMutableDictionary count](v4->mStyles, "count")) {
      NSLog(@"iLife Slideshow: No Styles Found");
    }
  }

  return v4;
}

- (void)reloadBundles
{
  v2 = self;
  mCurrentLocale = self->mCurrentLocale;
  if (mCurrentLocale)
  {

    v2->mCurrentLocale = 0LL;
  }

  unsigned __int8 v4 = +[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages");
  if (v4 && (id v5 = v4, -[NSArray count](v4, "count"))) {
    uint64_t v6 = (const __CFString *)objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", 0), "copy");
  }
  else {
    uint64_t v6 = &stru_259C60;
  }
  v2->mCurrentLocale = &v6->isa;
  mStyles = v2->mStyles;
  if (mStyles)
  {

    v2->mStyles = 0LL;
  }

  v2->mStyles = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obj = v2->mPaths;
  id v42 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v64,  v70,  16LL);
  if (v42)
  {
    uint64_t v8 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
    uint64_t v41 = *(void *)v65;
    v44 = v2;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v65 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v9;
        v55 = *(void **)(*((void *)&v64 + 1) + 8 * v9);
        id v10 = -[AVAudioTimePitchAlgorithm dataWithContentsOfFile:]( (id)v8[211],  "dataWithContentsOfFile:",  [v55 stringByAppendingPathComponent:@"StyleDescriptions.plist"]);
        if (v10)
        {
          id v11 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v10,  2LL,  0LL,  0LL);
          if (v11) {
            -[NSMutableDictionary addEntriesFromDictionary:](v2->mStyles, "addEntriesFromDictionary:", v11);
          }
        }

        __int128 v12 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  [v55 stringByAppendingPathComponent:@"Styles/"],  0);
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        v48 = v12;
        id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v60,  v69,  16LL);
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v61;
          uint64_t v45 = *(void *)v61;
          do
          {
            uint64_t v16 = 0LL;
            id v46 = v14;
            do
            {
              if (*(void *)v61 != v15) {
                objc_enumerationMutation(v48);
              }
              id v17 = [v55 stringByAppendingFormat:@"/Styles/%@", *(void *)(*((void *)&v60 + 1) + 8 * (void)v16)];
              if (objc_msgSend(objc_msgSend(v17, "pathExtension"), "isEqualToString:", @"mrbStyle"))
              {
                id v18 = -[NSBundle initWithPath:](objc_alloc(&OBJC_CLASS___NSBundle), "initWithPath:", v17);
                if (v18)
                {
                  v49 = v16;
                  id v19 = v18;
                  id v47 = objc_msgSend(objc_msgSend(v17, "lastPathComponent"), "stringByDeletingPathExtension");
                  float v20 = -[NSBundle pathForResource:ofType:]( v19,  "pathForResource:ofType:",  @"StyleDescription",  @"plist");
                  v50 = v19;
                  __int128 v21 = -[NSBundle pathForResource:ofType:]( v19,  "pathForResource:ofType:",  @"LocalizedDescription",  @"plist");
                  if (v20)
                  {
                    __int128 v22 = v21;
                    id v23 = -[AVAudioTimePitchAlgorithm dataWithContentsOfFile:]( (id)v8[211],  "dataWithContentsOfFile:",  v20);
                    if (v23)
                    {
                      id v24 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v23,  2LL,  0LL,  0LL);
                      if (v24)
                      {
                        __int128 v25 = v24;
                        if (v22)
                        {
                          __int128 v26 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v22);
                          if (v26) {
                            objc_msgSend( v25,  "addEntriesFromDictionary:",  -[NSDictionary objectForKey:](v26, "objectForKey:", @"_LOCALIZABLE_"));
                          }
                        }

                        objc_msgSend( v25,  "setObject:forKey:",  -[NSDictionary objectForKey:]( -[NSBundle infoDictionary](v50, "infoDictionary"),  "objectForKey:",  @"CFBundleVersion"),  @"version");
                        id v27 = [v17 stringByAppendingPathComponent:@"Contents/Resources/"];
                        [v25 setObject:v27 forKey:@"resources"];
                        objc_msgSend( v25,  "setObject:forKey:",  objc_msgSend(v27, "stringByAppendingPathComponent:", @"Icon.tiff"),  @"thumbnail");
                        objc_msgSend( v25,  "setObject:forKey:",  objc_msgSend(v27, "stringByAppendingPathComponent:", @"Preview.mov"),  @"preview");
                        [v25 setObject:v17 forKey:@"bundlePath"];
                        id v54 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
                        id v52 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
                        id v28 = [v25 objectForKey:@"songs_embedded"];
                        if (!v28) {
                          id v28 = [v25 objectForKey:@"songs"];
                        }
                        __int128 v58 = 0u;
                        __int128 v59 = 0u;
                        __int128 v56 = 0u;
                        __int128 v57 = 0u;
                        id v29 = [v28 countByEnumeratingWithState:&v56 objects:v68 count:16];
                        if (v29)
                        {
                          id v30 = v29;
                          uint64_t v53 = *(void *)v57;
                          id v51 = v28;
                          do
                          {
                            for (i = 0LL; i != v30; i = (char *)i + 1)
                            {
                              if (*(void *)v57 != v53) {
                                objc_enumerationMutation(v51);
                              }
                              id v32 = [*(id *)(*((void *)&v56 + 1) + 8 * (void)i) objectForKey:@"path"];
                              v33 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Audio/%@",  v55,  v32);
                              [v54 addObject:v33];
                              id v34 = objc_msgSend( +[MPSongManager sharedManager](MPSongManager, "sharedManager"),  "songMetadataForPath:",  v32);
                              v35 = +[NSDictionary dictionaryWithContentsOfFile:]( NSDictionary,  "dictionaryWithContentsOfFile:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/Audio/%@",  v55,  [v34 objectForKey:@"beats"]));
                              if (v35)
                              {
                                v36 = v35;
                                objc_msgSend( v52,  "setObject:forKey:",  -[NSDictionary objectForKey:](v35, "objectForKey:", @"beats"),  v33);
                                objc_msgSend( +[MPSongManager sharedManager](MPSongManager, "sharedManager"),  "storeBeats:forPath:",  -[NSDictionary objectForKey:](v36, "objectForKey:", @"beats"),  v33);
                              }

                              id v37 = [v34 objectForKey:@"duration"];
                              if (v37)
                              {
                                id v38 = v37;
                                v39 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0);
                                objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "cacheAttributes:forPath:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  v39,  kMPMetaDataStartTime,  v38,  kMPMetaDataStopTime,  v38,  kMPMetaDataDuration,  0),  v33);
                              }
                            }

                            id v30 = [v51 countByEnumeratingWithState:&v56 objects:v68 count:16];
                          }

                          while (v30);
                        }

                        [v25 setObject:v54 forKey:@"songs"];
                        [v25 setObject:v52 forKey:@"beats"];
                        v2 = v44;
                        -[NSMutableDictionary setObject:forKey:](v44->mStyles, "setObject:forKey:", v25, v47);
                        uint64_t v8 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
                      }
                    }
                  }

                  uint64_t v15 = v45;
                  id v14 = v46;
                  uint64_t v16 = v49;
                }
              }

              uint64_t v16 = (char *)v16 + 1;
            }

            while (v16 != v14);
            id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v60,  v69,  16LL);
          }

          while (v14);
        }

        uint64_t v9 = v43 + 1;
      }

      while ((id)(v43 + 1) != v42);
      id v42 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v64,  v70,  16LL);
    }

    while (v42);
  }

- (id)_containerDescriptionForLayerAtIndex:(int64_t)a3 ofStyle:(id)a4
{
  id v5 = objc_msgSend( -[MPStyleManager descriptionForStyleID:](self, "descriptionForStyleID:", a4),  "objectForKey:",  @"layout");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0LL;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    id v10 = [v5 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

@end