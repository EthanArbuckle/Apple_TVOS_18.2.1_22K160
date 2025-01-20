@interface MPEffectManager
+ (id)sharedManager;
+ (void)initialize;
+ (void)loadEffectManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (BOOL)allowTextCustomizationForEffectID:(id)a3 presetID:(id)a4 forTextAtIndex:(int64_t)a5;
- (BOOL)effectDoesAccumulate:(id)a3;
- (BOOL)effectNeedsPanoInformation:(id)a3;
- (BOOL)effectNeedsRandomSeedInformation:(id)a3;
- (BOOL)posterTimeIsStaticForEffectID:(id)a3 andPresetID:(id)a4;
- (BOOL)skipPanoramaScaleForEffectID:(id)a3;
- (BOOL)useUppercaseForEffectID:(id)a3 presetID:(id)a4 forTextAtIndex:(int64_t)a5;
- (MPEffectManager)initWithPaths:(id)a3;
- (double)defaultFullDurationForEffectID:(id)a3;
- (double)defaultMainDurationForEffectID:(id)a3;
- (double)defaultPhaseInDurationForEffectID:(id)a3;
- (double)defaultPhaseOutDurationForEffectID:(id)a3;
- (double)defaultPosterFrameTimeForEffect:(id)a3;
- (double)defaultPosterFrameTimeForEffectID:(id)a3 andPresetID:(id)a4;
- (double)durationPaddingForEffectID:(id)a3;
- (double)maxFontSizeInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5;
- (double)mediaAspectRatioForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6;
- (double)mediaAspectRatioForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6 imageAspectRatio:(double)a7;
- (double)mediaAspectRatioForEffectID:(id)a3 usingPresetID:(id)a4 atIndex:(int64_t)a5;
- (double)mediaAspectRatioForEffectID:(id)a3 usingPresetID:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6;
- (double)mediaAspectRatioHintForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6;
- (double)minimumEffectDurationForEffectID:(id)a3;
- (double)panoramaScaleOffsetForEffectID:(id)a3;
- (id)allCategoryIDs;
- (id)allEffectIDs;
- (id)aspectRatioForEffectID:(id)a3;
- (id)attributesForEffectID:(id)a3 andPresetID:(id)a4;
- (id)categoryIDsForEffectID:(id)a3;
- (id)controlForAttribute:(id)a3 forEffectID:(id)a4;
- (id)defaultStringForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5;
- (id)defaultStringForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5 needsNSConversion:(BOOL)a6;
- (id)descriptionForEffectID:(id)a3;
- (id)effectIDsForCategoryID:(id)a3;
- (id)effectsWithNumOfImages:(unint64_t)a3;
- (id)imageInputInfoForEffectID:(id)a3;
- (id)localizedCategoryNameFromCategoryID:(id)a3;
- (id)localizedEffectNameForEffectID:(id)a3;
- (id)localizedFontsForEffectID:(id)a3;
- (id)localizedSettingsUITitleForTitleKey:(id)a3 inEffect:(id)a4;
- (id)localizedString:(id)a3 forEffectID:(id)a4;
- (id)mediaAspectRatioHintsForEffectID:(id)a3 usingPresetID:(id)a4 defaultAspectRatio:(double)a5;
- (id)mediaAspectRatiosForEffectID:(id)a3 usingPresetID:(id)a4;
- (id)mediaAspectRatiosForEffectID:(id)a3 usingPresetID:(id)a4 defaultAspectRatio:(double)a5;
- (id)orientationForEffectID:(id)a3;
- (id)presetIDsForEffectID:(id)a3;
- (id)settingsUIControlDescriptionsForEffect:(id)a3;
- (id)showTimeScriptForEffectID:(id)a3 atSlideIndex:(int64_t)a4;
- (id)sizeScriptForEffectID:(id)a3 atIndex:(int64_t)a4;
- (id)versionOfEffectID:(id)a3;
- (int64_t)numberOfSecondarySlidesForEffectID:(id)a3;
- (int64_t)numberOfSlidesForEffectID:(id)a3;
- (int64_t)panoTypeForSlideAtIndex:(int64_t)a3 inEffect:(id)a4 forPresetID:(id)a5;
- (unint64_t)maxNumOfImagesPerEffectInList:(id)a3;
- (unint64_t)minNumOfImagesPerEffectInList:(id)a3;
- (unint64_t)numOfImagesForEffectID:(id)a3;
- (unint64_t)numOfImagesForEffectPresetID:(id)a3;
- (unint64_t)numOfTextsForEffectID:(id)a3;
- (void)_loadFontsFromPath:(id)a3 requiredFonts:(id)a4;
- (void)dealloc;
- (void)defaultDurationsForEffectID:(id)a3 phaseInDuration:(double *)a4 mainDuration:(double *)a5 phaseOutDuration:(double *)a6;
@end

@implementation MPEffectManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MPEffectManager;
  objc_msgSendSuper2(&v2, "initialize");
}

+ (id)sharedManager
{
  id result = (id)qword_2B04E0;
  if (!qword_2B04E0)
  {
    objc_sync_enter(a1);
    if (!qword_2B04E0) {
      qword_2B04E0 = -[MPEffectManager initWithPaths:](objc_alloc(&OBJC_CLASS___MPEffectManager), "initWithPaths:", 0LL);
    }
    objc_sync_exit(a1);
    return (id)qword_2B04E0;
  }

  return result;
}

+ (void)releaseSharedManager
{
  if (qword_2B04E0)
  {
    objc_sync_enter(a1);

    qword_2B04E0 = 0LL;
    objc_sync_exit(a1);
  }

- (void)dealloc
{
  v3 = self->mLock;
  -[NSLock lock](v3, "lock");

  self->mEffects = 0LL;
  self->mCategories = 0LL;

  self->mCachedAspectRatios = 0LL;
  self->mCachedBreakInfo = 0LL;

  self->mLock = 0LL;
  -[NSLock unlock](v3, "unlock");

  CFErrorRef error = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  mRegisteredFonts = self->mRegisteredFonts;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mRegisteredFonts,  "countByEnumeratingWithState:objects:count:",  &v11,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(mRegisteredFonts);
        }
        if (!CTFontManagerUnregisterFontsForURL( *(CFURLRef *)(*((void *)&v11 + 1) + 8LL * (void)i),  kCTFontManagerScopeProcess,  &error))
        {
          CFStringRef v9 = CFErrorCopyDescription(error);
          NSLog(@"CTFontManagerUnregisterFontsForURL failed, error '%@'\n", v9);
          CFRelease(v9);
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mRegisteredFonts,  "countByEnumeratingWithState:objects:count:",  &v11,  v16,  16LL);
    }

    while (v6);
  }

  self->mRegisteredFonts = 0LL;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MPEffectManager;
  -[MPEffectManager dealloc](&v10, "dealloc");
}

- (id)versionOfEffectID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"version");
}

- (unint64_t)numOfImagesForEffectID:(id)a3
{
  id v5 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:"),  "objectForKey:",  @"hasMultiImageInput");
  id v7 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"numberOfImages");
  id v8 = -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3);
  if (v7)
  {
    unint64_t result = (int)objc_msgSend(objc_msgSend(v8, "objectForKey:", @"numberOfImages"), "intValue");
    if ((_DWORD)result) {
      return result;
    }
    goto LABEL_9;
  }

  if (![v8 objectForKey:@"imageInputInfo"]
    || (unint64_t result = (unint64_t)objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"imageInputInfo"),  "count")) == 0)
  {
LABEL_9:
    if ([a3 rangeOfString:@"/"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      return 0LL;
    }

    else
    {
      id v9 = objc_msgSend(a3, "substringToIndex:", objc_msgSend(a3, "rangeOfString:", @"/"));
      id v10 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", v9),  "objectForKey:",  @"imageInputInfo");
      id v11 = -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", v9);
      if (v10)
      {
        return (unint64_t)objc_msgSend(objc_msgSend(v11, "objectForKey:", @"imageInputInfo"), "count");
      }

      else
      {
        unint64_t result = (unint64_t)[v11 objectForKey:@"numberOfImages"];
        if (result) {
          return (int)objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", v9),  "objectForKey:",  @"numberOfImages"),  "intValue");
        }
      }
    }
  }

  return result;
}

- (unint64_t)numOfTextsForEffectID:(id)a3
{
  return (int)objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"numberOfTexts"),  "intValue");
}

- (id)categoryIDsForEffectID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"categories");
}

- (id)effectIDsForCategoryID:(id)a3
{
  id v5 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  mEffects = self->mEffects;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mEffects,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(mEffects);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_msgSend( -[MPEffectManager categoryIDsForEffectID:](self, "categoryIDsForEffectID:", v11),  "containsObject:",  a3) & 1) != 0 || objc_msgSend(a3, "isEqualToString:", @"all"))
        {
          [v5 addObject:v11];
        }
      }

      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mEffects,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (id)localizedEffectNameForEffectID:(id)a3
{
  id result = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:"),  "objectForKey:",  @"localizedEffectName");
  if (!result) {
    return a3;
  }
  return result;
}

- (id)localizedCategoryNameFromCategoryID:(id)a3
{
  id result = -[NSMutableDictionary objectForKey:](self->mCategories, "objectForKey:");
  if (!result)
  {
    id v6 = -[MPEffectManager effectIDsForCategoryID:](self, "effectIDsForCategoryID:", a3);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
LABEL_5:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        id result = objc_msgSend( -[NSMutableDictionary objectForKey:]( self->mEffects,  "objectForKey:",  *(void *)(*((void *)&v11 + 1) + 8 * v10)),  "objectForKey:",  @"localizedCategoryName");
        if (result) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v8) {
            goto LABEL_5;
          }
          return a3;
        }
      }
    }

    else
    {
      return a3;
    }
  }

  return result;
}

- (id)localizedString:(id)a3 forEffectID:(id)a4
{
  id result = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a4),  "objectForKey:",  @"Localized Strings"),  "objectForKey:",  a3);
  if (!result) {
    return a3;
  }
  return result;
}

- (id)localizedSettingsUITitleForTitleKey:(id)a3 inEffect:(id)a4
{
  id result = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a4),  "objectForKey:",  @"localizedSettingsUI"),  "objectForKey:",  a3);
  if (!result) {
    return a3;
  }
  return result;
}

- (id)controlForAttribute:(id)a3 forEffectID:(id)a4
{
  id v5 = -[MPEffectManager settingsUIControlDescriptionsForEffect:](self, "settingsUIControlDescriptionsForEffect:", a4);
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v9);
        if (objc_msgSend( objc_msgSend(v10, "objectForKey:", kMPEffectUIControlAttributeKey[0]),  "isEqualToString:",  a3)) {
          return [v10 copy];
        }
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

- (id)settingsUIControlDescriptionsForEffect:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"settingsUI");
}

- (id)effectsWithNumOfImages:(unint64_t)a3
{
  id v5 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  mEffects = self->mEffects;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mEffects,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(mEffects);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (-[MPEffectManager numberOfSlidesForEffectID:](self, "numberOfSlidesForEffectID:", v11) == a3) {
          [v5 addObject:v11];
        }
      }

      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( mEffects,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

- (id)allEffectIDs
{
  return -[NSMutableDictionary allKeys](self->mEffects, "allKeys");
}

- (id)allCategoryIDs
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  objc_msgSend(v3, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->mCategories, "allKeys"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  obj = self->mEffects;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = -[MPEffectManager categoryIDsForEffectID:]( self,  "categoryIDsForEffectID:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)i));
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            for (j = 0LL; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)j);
            }

            id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }

          while (v10);
        }
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (id)defaultStringForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5
{
  return -[MPEffectManager defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:]( self,  "defaultStringForTextInEffectID:presetID:atIndex:needsNSConversion:",  a3,  a4,  a5,  1LL);
}

- (double)maxFontSizeInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5
{
  if (a4) {
    uint64_t v6 = (const __CFString *)a4;
  }
  else {
    uint64_t v6 = @"Default";
  }
  id v7 = objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  a3,  v6),  "objectForKey:",  @"textSettings");
  else {
    id v8 = [v7 objectAtIndex:a5];
  }
  id v9 = [v8 objectForKey:@"maxFontSize"];
  if (!v9) {
    return -1.0;
  }
  [v9 floatValue];
  return v10;
}

- (id)presetIDsForEffectID:(id)a3
{
  return objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "allKeys");
}

- (id)attributesForEffectID:(id)a3 andPresetID:(id)a4
{
  id v7 = (NSMutableDictionary *)objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "objectForKey:",  a4);
  if (!v7
    && (a4 = @"Default",
        (id v7 = (NSMutableDictionary *) objc_msgSend( objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "objectForKey:",  @"Default"),  "copy")) == 0)
    || !-[NSMutableDictionary objectForKey:](v7, "objectForKey:", @"processed"))
  {
    id v7 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7);
    id v8 = objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"presets"),  "mutableCopy");
    [v8 setObject:v7 forKey:a4];
    objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "setObject:forKey:",  v8,  @"presets");
  }

  -[NSLock unlock](self->mLock, "unlock");
  return v7;
}

- (id)descriptionForEffectID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3);
}

- (id)mediaAspectRatiosForEffectID:(id)a3 usingPresetID:(id)a4
{
  id v7 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v8 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfImagesForEffectID:",  a3);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = (uint64_t)v8;
  }
  if (v9 >= 1)
  {
    for (int64_t i = 0LL; i != v9; ++i)
    {
      -[MPEffectManager mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:]( self,  "mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:",  a3,  -[MPEffectManager attributesForEffectID:andPresetID:](self, "attributesForEffectID:andPresetID:", a3, a4),  i,  1.6);
      *(float *)&double v11 = v11;
      objc_msgSend( v7,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11),  ImageKey(i));
    }
  }

  return v7;
}

- (double)mediaAspectRatioForEffectID:(id)a3 usingPresetID:(id)a4 atIndex:(int64_t)a5
{
  id v6 = -[MPEffectManager mediaAspectRatiosForEffectID:usingPresetID:]( self,  "mediaAspectRatiosForEffectID:usingPresetID:",  a3,  a4);
  if (!v6) {
    return 9.22337204e18;
  }
  id v7 = v6;
  objc_msgSend(objc_msgSend(v7, "objectForKey:", ImageKey(a5)), "floatValue");
  return v8;
}

- (id)mediaAspectRatiosForEffectID:(id)a3 usingPresetID:(id)a4 defaultAspectRatio:(double)a5
{
  id v9 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v10 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfImagesForEffectID:",  a3);
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = (uint64_t)v10;
  }
  if (v11 >= 1)
  {
    for (int64_t i = 0LL; i != v11; ++i)
    {
      -[MPEffectManager mediaAspectRatioForEffectID:usingPresetID:atIndex:defaultAspectRatio:]( self,  "mediaAspectRatioForEffectID:usingPresetID:atIndex:defaultAspectRatio:",  a3,  a4,  i,  a5);
      *(float *)&double v13 = v13;
      objc_msgSend( v9,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13),  ImageKey(i));
    }
  }

  return v9;
}

- (double)mediaAspectRatioForEffectID:(id)a3 usingPresetID:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6
{
  uint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"as/%d/%@/%@/%f",  a5,  a3,  a4,  *(void *)&a6);
  id v12 = -[NSMutableDictionary objectForKey:](self->mCachedAspectRatios, "objectForKey:", v11);
  if (v12)
  {
    [v12 floatValue];
    return v13;
  }

  else
  {
    -[MPEffectManager mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:]( self,  "mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:",  a3,  -[MPEffectManager attributesForEffectID:andPresetID:](self, "attributesForEffectID:andPresetID:", a3, a4),  a5,  a6);
    double v14 = v15;
    *(float *)&double v15 = v15;
    -[NSMutableDictionary setObject:forKey:]( self->mCachedAspectRatios,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15),  v11);
  }

  return v14;
}

- (double)mediaAspectRatioForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6
{
  id v10 = -[MPEffectManager imageInputInfoForEffectID:](self, "imageInputInfoForEffectID:");
  uint64_t v11 = (char *)[v10 count];
  else {
    int64_t v12 = (int64_t)(v11 - 1);
  }
  id v13 = objc_msgSend(objc_msgSend(v10, "objectAtIndex:", v12), "objectForKey:", @"sizeScript");
  if (v13
    && (id v14 = v13,
        double v15 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6),  @"layerWidth",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0),  @"layerHeight",  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(uint64_t)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfImagesForEffectID:",  a3)),  @"numOfImages",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)a5),  @"indexOfImage",  0),  v16 = +[MPUtilities executeScript:withHeader:andAttributes:]( MPUtilities,  "executeScript:withHeader:andAttributes:",  v14,  v15,  a4),  v15,  v17 = CGSizeFromString(v16),  v17.height > 0.0))
  {
    return v17.width / v17.height;
  }

  else
  {
    return 9.22337204e18;
  }

- (id)imageInputInfoForEffectID:(id)a3
{
  return  objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"imageInputInfo"),  "copy");
}

- (double)defaultPhaseInDurationForEffectID:(id)a3
{
  double v4 = 0.0;
  -[MPEffectManager defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:]( self,  "defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:",  a3,  &v4,  0LL,  0LL);
  return v4;
}

- (double)defaultMainDurationForEffectID:(id)a3
{
  double v4 = 0.0;
  -[MPEffectManager defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:]( self,  "defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:",  a3,  0LL,  &v4,  0LL);
  return v4;
}

- (double)defaultPhaseOutDurationForEffectID:(id)a3
{
  double v4 = 0.0;
  -[MPEffectManager defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:]( self,  "defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:",  a3,  0LL,  0LL,  &v4);
  return v4;
}

- (void)defaultDurationsForEffectID:(id)a3 phaseInDuration:(double *)a4 mainDuration:(double *)a5 phaseOutDuration:(double *)a6
{
  if (objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "hasCustomTimingForEffectID:",  a3))
  {
    id v11 = objc_msgSend( +[MREffectManager sharedManager](MREffectManager, "sharedManager"),  "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:",  a3,  objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  a3,  @"Default"),  0,  0,  1.77777779);
    int64_t v12 = v11;
    if (a4)
    {
      [v11 phaseInDuration];
      *(void *)a4 = v13;
    }

    if (a5)
    {
      [v12 mainDuration];
      *(void *)a5 = v14;
    }

    if (a6)
    {
      [v12 phaseOutDuration];
LABEL_25:
      *(void *)a6 = v15;
    }
  }

  else
  {
    if (a4)
    {
      else {
        objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"phaseInDuration"),  "doubleValue");
      }
      *(void *)a4 = v16;
    }

    if (a5)
    {
      objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"mainDuration"),  "doubleValue");
      *(void *)a5 = v17;
      unsigned int v18 = [a3 hasPrefix:@"SlidingPanels"];
      double v19 = *a5;
      if (v18) {
        double v19 = *a5 + -1.0;
      }
      if ((v18 & 1) != 0 || v19 == 0.0)
      {
        if (v19 == 0.0) {
          double v19 = 3.0;
        }
        *a5 = v19;
      }
    }

    if (a6)
    {
      else {
        objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"phaseOutDuration"),  "doubleValue");
      }
      goto LABEL_25;
    }
  }

- (double)defaultPosterFrameTimeForEffectID:(id)a3 andPresetID:(id)a4
{
  if (!a4) {
    a4 = @"Default";
  }
  id v6 = objc_msgSend( -[MPEffectManager attributesForEffectID:andPresetID:](self, "attributesForEffectID:andPresetID:", a3, a4),  "objectForKey:",  @"posterTime");
  if (v6
    || (id v6 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"posterTime")) != 0)
  {
    [v6 doubleValue];
  }

  else
  {
    -[MPEffectManager defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:]( self,  "defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:",  a3,  &v9,  &v8,  0LL);
    return v9 + v8 * 0.5;
  }

  return result;
}

- (double)defaultPosterFrameTimeForEffect:(id)a3
{
  id v5 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:"),  "objectForKey:",  @"posterTime");
  if (v5)
  {
    [v5 doubleValue];
  }

  else
  {
    -[MPEffectManager defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:]( self,  "defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:",  a3,  &v8,  &v7,  0LL);
    double result = v8 + v7;
    if (v8 + v7 == 0.0) {
      return v7 * 0.5;
    }
  }

  return result;
}

- (int64_t)numberOfSlidesForEffectID:(id)a3
{
  id v5 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:"),  "objectForKey:",  @"hasMultiImageInput");
  id v7 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"numberOfSlides");
  if (v7) {
    return (int64_t)[v7 integerValue];
  }
  else {
    return (int64_t)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfImagesForEffectID:",  a3);
  }
}

- (int64_t)numberOfSecondarySlidesForEffectID:(id)a3
{
  int64_t result = (int64_t)objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"numberOfSecondarySlides");
  if (result) {
    return (int64_t)[(id)result integerValue];
  }
  return result;
}

- (id)orientationForEffectID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"orientation");
}

- (id)aspectRatioForEffectID:(id)a3
{
  id result = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:"),  "objectForKey:",  @"aspectRatio");
  if (!result)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

- (id)localizedFontsForEffectID:(id)a3
{
  return objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"Localized Fonts");
}

- (BOOL)skipPanoramaScaleForEffectID:(id)a3
{
  id v3 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"skipPanoramaScale");
  if (v3) {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (id)defaultStringForTextInEffectID:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5 needsNSConversion:(BOOL)a6
{
  if (a4) {
    double v9 = (const __CFString *)a4;
  }
  else {
    double v9 = @"Default";
  }
  id v10 = objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  a3,  v9),  "objectForKey:",  @"textSettings");
  else {
    id v11 = [v10 objectAtIndex:a5];
  }
  id v12 = [v11 objectForKey:@"fontSize"];
  uint64_t v13 = (const __CFString *)[v11 objectForKey:@"fontName"];
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = @"Helvetica";
  }
  id v15 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"Localized Fonts");
  if (v15)
  {
    id v16 = [v15 objectForKey:v14];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v14 = (const __CFString *)[v16 objectForKey:@"Name"];
      id v18 = [v17 objectForKey:@"Size"];
      if (!v14) {
        return 0LL;
      }
      id v12 = v18;
    }
  }

  double v19 = (const __CFString *)[v11 objectForKey:@"title"];
  if (v19) {
    __int128 v20 = v19;
  }
  else {
    __int128 v20 = @"Text";
  }
  __int128 v21 = +[MPUtilities CGColorFromString:]( MPUtilities,  "CGColorFromString:",  [v11 objectForKey:@"fontColor"]);
  [v12 floatValue];
  CTFontRef v23 = CTFontCreateWithName(v14, v22, 0LL);
  unsigned __int8 v33 = objc_msgSend(objc_msgSend(v11, "objectForKey:", @"alignment"), "intValue");
  objc_msgSend(objc_msgSend(v11, "objectForKey:", @"headIndent"), "floatValue");
  int v32 = v24;
  settings.spec = kCTParagraphStyleSpecifierAlignment;
  settings.valueSize = 1LL;
  settings.value = &v33;
  int v35 = 1;
  uint64_t v36 = 4LL;
  v37 = &v32;
  int v38 = 2;
  uint64_t v39 = 4LL;
  v40 = &v32;
  CTParagraphStyleRef v25 = CTParagraphStyleCreate(&settings, 3uLL);
  v26 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v21,  kCTForegroundColorAttributeName,  v23,  kCTFontAttributeName,  v25,  kCTParagraphStyleAttributeName,  0LL);
  CFRelease(v25);
  CFRelease(v23);
  id v27 = [v11 objectForKey:@"kern"];
  if (v27) {
    -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v27, kCTKernAttributeName);
  }
  id v28 = objc_msgSend(objc_msgSend(v11, "objectForKey:", @"shadow"), "mutableCopy");
  if (v28)
  {
    v29 = v28;
    if ([v28 objectForKey:@"offset"])
    {
      CGSize v30 = CGSizeFromString((NSString *)[v29 objectForKey:@"offset"]);
      objc_msgSend( v29,  "setObject:forKey:",  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v30.width, v30.height),  @"offset");
    }

    if ([v29 objectForKey:@"color"]) {
      objc_msgSend( v29,  "setObject:forKey:",  +[MPUtilities CGColorFromString:]( MPUtilities,  "CGColorFromString:",  objc_msgSend(v29, "objectForKey:", @"color")),  @"color");
    }
    if ([v29 objectForKey:@"blurRadius"])
    {
      objc_msgSend(objc_msgSend(v29, "objectForKey:", @"blurRadius"), "floatValue");
      objc_msgSend( v29,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"),  @"blurRadius");
    }

    -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v29, @"shadow");
  }

  return  -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v20,  v26);
}

- (BOOL)posterTimeIsStaticForEffectID:(id)a3 andPresetID:(id)a4
{
  if (a4) {
    id v6 = (const __CFString *)a4;
  }
  else {
    id v6 = @"Default";
  }
  id v7 = objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  a3,  v6),  "objectForKey:",  @"posterTimeIsStatic");
  if (v7
    || (id v7 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"posterTimeIsStatic")) != 0)
  {
    LOBYTE(v7) = [v7 BOOLValue];
  }

  return (char)v7;
}

- (id)showTimeScriptForEffectID:(id)a3 atSlideIndex:(int64_t)a4
{
  id v5 = -[MPEffectManager imageInputInfoForEffectID:](self, "imageInputInfoForEffectID:", a3);
  else {
    id v6 = [v5 objectAtIndex:a4];
  }
  return [v6 objectForKey:@"showTimeScript"];
}

- (double)minimumEffectDurationForEffectID:(id)a3
{
  id v3 = a3;
  if ([a3 rangeOfString:@"/"] != (id)0x7FFFFFFFFFFFFFFFLL) {
    id v3 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "rangeOfString:", @"/"));
  }
  id v5 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", v3),  "objectForKey:",  @"minimumEffectDuration");
  if (!v5) {
    return 0.0;
  }
  [v5 doubleValue];
  return result;
}

- (id)sizeScriptForEffectID:(id)a3 atIndex:(int64_t)a4
{
  id v5 = -[MPEffectManager imageInputInfoForEffectID:](self, "imageInputInfoForEffectID:", a3);
  else {
    id v6 = [v5 objectAtIndex:a4];
  }
  return [v6 objectForKey:@"sizeScript"];
}

- (double)defaultFullDurationForEffectID:(id)a3
{
  id v5 = +[MPUtilities idOfCombinedID:](&OBJC_CLASS___MPUtilities, "idOfCombinedID:");
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = a3;
  }
  -[MPEffectManager defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:]( self,  "defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:",  v6,  &v10,  &v9,  &v8);
  return v10 + v9 + v8;
}

- (unint64_t)numOfImagesForEffectPresetID:(id)a3
{
  id v3 = a3;
  if ([a3 rangeOfString:@"/"] != (id)0x7FFFFFFFFFFFFFFFLL) {
    id v3 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "rangeOfString:", @"/"));
  }
  return -[MPEffectManager numberOfSlidesForEffectID:](self, "numberOfSlidesForEffectID:", v3);
}

- (unint64_t)maxNumOfImagesPerEffectInList:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  unint64_t v7 = 0LL;
  uint64_t v8 = *(void *)v13;
  do
  {
    for (int64_t i = 0LL; i != v6; int64_t i = (char *)i + 1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(a3);
      }
      unint64_t v10 = -[MPEffectManager numberOfSlidesForEffectID:]( self,  "numberOfSlidesForEffectID:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)i));
      if (v10 > v7) {
        unint64_t v7 = v10;
      }
    }

    id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }

  while (v6);
  return v7;
}

- (unint64_t)minNumOfImagesPerEffectInList:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 99LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v13;
  unint64_t v8 = 99LL;
  do
  {
    for (int64_t i = 0LL; i != v6; int64_t i = (char *)i + 1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      unint64_t v10 = -[MPEffectManager numberOfSlidesForEffectID:]( self,  "numberOfSlidesForEffectID:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)i));
      if (v10 < v8) {
        unint64_t v8 = v10;
      }
    }

    id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }

  while (v6);
  return v8;
}

- (BOOL)effectNeedsRandomSeedInformation:(id)a3
{
  return objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"needsRandomSeed"),  "BOOLValue");
}

- (BOOL)effectNeedsPanoInformation:(id)a3
{
  return objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"needsPanoInformation"),  "BOOLValue");
}

- (BOOL)effectDoesAccumulate:(id)a3
{
  return objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"accumulates"),  "BOOLValue");
}

- (id)mediaAspectRatioHintsForEffectID:(id)a3 usingPresetID:(id)a4 defaultAspectRatio:(double)a5
{
  double v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"hint/%@/%@/%f",  a3,  a4,  *(void *)&a5);
  id v10 = -[NSMutableDictionary objectForKey:](self->mCachedAspectRatios, "objectForKey:", v9);
  if (!v10)
  {
    id v10 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    id v11 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfImagesForEffectID:",  a3);
    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v11 = objc_msgSend(-[MPEffectManager imageInputInfoForEffectID:](self, "imageInputInfoForEffectID:", a3), "count");
    }
    if ((uint64_t)v11 >= 1)
    {
      for (int64_t i = 0LL; (id)i != v11; ++i)
      {
        -[MPEffectManager mediaAspectRatioHintForEffectID:usingAttributes:atIndex:defaultAspectRatio:]( self,  "mediaAspectRatioHintForEffectID:usingAttributes:atIndex:defaultAspectRatio:",  a3,  -[MPEffectManager attributesForEffectID:andPresetID:](self, "attributesForEffectID:andPresetID:", a3, a4),  i,  a5);
        *(float *)&double v13 = v13;
        objc_msgSend( v10,  "setObject:forKey:",  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13),  ImageKey(i));
      }
    }

    -[NSMutableDictionary setObject:forKey:](self->mCachedAspectRatios, "setObject:forKey:", v10, v9);
  }

  return v10;
}

- (int64_t)panoTypeForSlideAtIndex:(int64_t)a3 inEffect:(id)a4 forPresetID:(id)a5
{
  double v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@-%ld", a4, a5, a3);
  id v10 = -[NSMutableDictionary objectForKey:](self->mCachedBreakInfo, "objectForKey:", v9);
  if (v10) {
    return (int64_t)[v10 integerValue];
  }
  id v12 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "imageInputInfoForEffectID:",  a4);
  id v13 = objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  a4,  a5);
  id v14 = objc_msgSend(objc_msgSend(v12, "objectAtIndex:", a3), "objectForKey:", @"panoType");
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
  if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
  {
    id v17 = [v14 integerValue];
  }

  else if (v14)
  {
    v31 = self;
    id v18 = -[MUMathExpressionFloatBased initWithString:error:]( objc_alloc(&OBJC_CLASS___MUMathExpressionFloatBased),  "initWithString:error:",  v14,  0LL);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v19 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (int64_t i = 0LL; i != v20; int64_t i = (char *)i + 1)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v13);
          }
          uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v24 = [v13 objectForKey:v23];
          uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber, v25);
          if ((objc_opt_isKindOfClass(v24, v26) & 1) == 0)
          {
            id v28 = (objc_class *)objc_opt_class(v24, v27);
            if (!-[NSString isEqualToString:](NSStringFromClass(v28), "isEqualToString:", @"NSCFBoolean")) {
              continue;
            }
          }

          [v24 doubleValue];
          *(float *)&double v29 = v29;
          -[MUMathExpressionFloatBased setValue:forVariable:](v18, "setValue:forVariable:", v23, v29);
        }

        id v20 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v20);
    }

    -[MUMathExpressionFloatBased evaluate](v18, "evaluate");
    id v17 = (id)(uint64_t)v30;

    self = v31;
  }

  else
  {
    id v17 = 0LL;
  }

  -[NSMutableDictionary setObject:forKey:]( self->mCachedBreakInfo,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v17),  v9);
  return (int64_t)v17;
}

- (double)mediaAspectRatioHintForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6
{
  id v11 = -[MPEffectManager imageInputInfoForEffectID:](self, "imageInputInfoForEffectID:");
  id v12 = (char *)[v11 count];
  else {
    int64_t v13 = (int64_t)(v12 - 1);
  }
  id v14 = objc_msgSend(objc_msgSend(v11, "objectAtIndex:", v13), "objectForKey:", @"aspectRatioHint");
  if (v14)
  {
    uint64_t v15 = v14;
    double v16 = 1.0;
    if (([v14 isEqualToString:@"all"] & 1) == 0)
    {
      double v16 = 1.5;
      if (([v15 isEqualToString:@"landscape"] & 1) == 0)
      {
        id v17 = -[MUMathExpressionFloatBased initWithString:error:]( objc_alloc(&OBJC_CLASS___MUMathExpressionFloatBased),  "initWithString:error:",  v15,  0LL);
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v18 = [a4 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v32;
          do
          {
            for (int64_t i = 0LL; i != v19; int64_t i = (char *)i + 1)
            {
              if (*(void *)v32 != v20) {
                objc_enumerationMutation(a4);
              }
              uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
              id v23 = [a4 objectForKey:v22];
              uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber, v24);
              if ((objc_opt_isKindOfClass(v23, v25) & 1) == 0)
              {
                uint64_t v27 = (objc_class *)objc_opt_class(v23, v26);
                if (!-[NSString isEqualToString:](NSStringFromClass(v27), "isEqualToString:", @"NSCFBoolean")) {
                  continue;
                }
              }

              [v23 doubleValue];
              *(float *)&double v28 = v28;
              -[MUMathExpressionFloatBased setValue:forVariable:](v17, "setValue:forVariable:", v22, v28);
            }

            id v19 = [a4 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }

          while (v19);
        }

        -[MUMathExpressionFloatBased evaluate](v17, "evaluate");
        double v16 = v29;
      }
    }

    return v16;
  }

  else
  {
    -[MPEffectManager mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:]( self,  "mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:",  a3,  a4,  a5,  a6);
  }

  return result;
}

- (double)mediaAspectRatioForEffectID:(id)a3 usingAttributes:(id)a4 atIndex:(int64_t)a5 defaultAspectRatio:(double)a6 imageAspectRatio:(double)a7
{
  id v12 = -[MPEffectManager imageInputInfoForEffectID:](self, "imageInputInfoForEffectID:");
  int64_t v13 = (char *)[v12 count];
  else {
    int64_t v14 = (int64_t)(v13 - 1);
  }
  id v15 = objc_msgSend(objc_msgSend(v12, "objectAtIndex:", v14), "objectForKey:", @"sizeScript");
  if (v15
    && (id v16 = v15,
        id v17 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6),  @"layerWidth",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0),  @"layerHeight",  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(uint64_t)objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "numOfImagesForEffectID:",  a3)),  @"numOfImages",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a7),  @"imageAspectRatio",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)a5),  @"indexOfImage",  0),  v18 = +[MPUtilities executeScript:withHeader:andAttributes:]( MPUtilities,  "executeScript:withHeader:andAttributes:",  v16,  v17,  a4),  v17,  v19 = CGSizeFromString(v18),  v19.height > 0.0))
  {
    return v19.width / v19.height;
  }

  else
  {
    return 9.22337204e18;
  }

- (double)panoramaScaleOffsetForEffectID:(id)a3
{
  id v3 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"panoramaScaleOffset");
  if (!v3) {
    return 0.0;
  }
  [v3 doubleValue];
  return result;
}

- (double)durationPaddingForEffectID:(id)a3
{
  id v3 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->mEffects, "objectForKey:", a3),  "objectForKey:",  @"durationPadding");
  if (!v3) {
    return 0.0;
  }
  [v3 doubleValue];
  return result;
}

- (BOOL)useUppercaseForEffectID:(id)a3 presetID:(id)a4 forTextAtIndex:(int64_t)a5
{
  if (a4) {
    id v6 = (const __CFString *)a4;
  }
  else {
    id v6 = @"Default";
  }
  id v7 = objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  a3,  v6),  "objectForKey:",  @"textSettings");
  else {
    id v8 = [v7 objectAtIndex:a5];
  }
  id v9 = [v8 objectForKey:@"uppercase"];
  if (v9) {
    LOBYTE(v9) = [v9 BOOLValue];
  }
  return (char)v9;
}

- (BOOL)allowTextCustomizationForEffectID:(id)a3 presetID:(id)a4 forTextAtIndex:(int64_t)a5
{
  if (a4) {
    id v6 = (const __CFString *)a4;
  }
  else {
    id v6 = @"Default";
  }
  id v7 = objc_msgSend( objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "attributesForEffectID:andPresetID:",  a3,  v6),  "objectForKey:",  @"textSettings");
  else {
    id v8 = [v7 objectAtIndex:a5];
  }
  id v9 = [v8 objectForKey:@"allowCustomization"];
  if (v9) {
    return [v9 BOOLValue];
  }
  else {
    return 1;
  }
}

+ (void)loadEffectManagerWithPaths:(id)a3
{
  if (qword_2B04E0)
  {

    qword_2B04E0 = 0LL;
  }

  qword_2B04E0 = -[MPEffectManager initWithPaths:](objc_alloc(&OBJC_CLASS___MPEffectManager), "initWithPaths:", a3);
}

- (MPEffectManager)initWithPaths:(id)a3
{
  v91.receiver = self;
  v91.super_class = (Class)&OBJC_CLASS___MPEffectManager;
  double v4 = -[MPEffectManager init](&v91, "init");
  if (v4)
  {
    v4->mEffects = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4->mCategories = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4->mCachedAspectRatios = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4->mCachedBreakInfo = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4->mRegisteredFonts = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v5 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v4->mLock = v5;
    -[NSLock setName:](v5, "setName:", @"MPEffectManager.lock");
    id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    id v8 = v6;
    if (a3) {
      [v6 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend( v6,  "addObject:",  -[NSString stringByAppendingPathComponent:]( -[NSBundle resourcePath]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(MPEffectManager, v7)),  "resourcePath"),  "stringByAppendingPathComponent:",  @"Content"));
    }
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    id obj = v8;
    id v59 = [v8 countByEnumeratingWithState:&v87 objects:v96 count:16];
    if (v59)
    {
      uint64_t v58 = *(void *)v88;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v88 != v58) {
            objc_enumerationMutation(obj);
          }
          uint64_t v60 = v9;
          v66 = *(void **)(*((void *)&v87 + 1) + 8 * v9);
          id v10 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"EffectDescriptions.plist",  @"EffectDescriptionsSynergy.plist",  0LL);
          __int128 v83 = 0u;
          __int128 v84 = 0u;
          __int128 v85 = 0u;
          __int128 v86 = 0u;
          v69 = v10;
          id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v83,  v95,  16LL);
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v84;
            do
            {
              for (int64_t i = 0LL; i != v12; int64_t i = (char *)i + 1)
              {
                if (*(void *)v84 != v13) {
                  objc_enumerationMutation(v69);
                }
                id v15 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [v66 stringByAppendingPathComponent:*(void *)(*((void *)&v83 + 1) + 8 * (void)i)]);
                if (v15)
                {
                  id v16 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v15,  2LL,  0LL,  0LL);
                  if (v16)
                  {
                    id v17 = v16;
                    __int128 v81 = 0u;
                    __int128 v82 = 0u;
                    __int128 v79 = 0u;
                    __int128 v80 = 0u;
                    id v18 = [v16 countByEnumeratingWithState:&v79 objects:v94 count:16];
                    if (v18)
                    {
                      id v19 = v18;
                      uint64_t v20 = *(void *)v80;
                      do
                      {
                        for (j = 0LL; j != v19; j = (char *)j + 1)
                        {
                          if (*(void *)v80 != v20) {
                            objc_enumerationMutation(v17);
                          }
                          uint64_t v22 = *(void *)(*((void *)&v79 + 1) + 8LL * (void)j);
                          id v23 = -[NSMutableDictionary initWithDictionary:]( [NSMutableDictionary alloc],  "initWithDictionary:",  [v17 objectForKey:v22]);
                          -[NSMutableDictionary setObject:forKey:](v4->mEffects, "setObject:forKey:", v23, v22);
                        }

                        id v19 = [v17 countByEnumeratingWithState:&v79 objects:v94 count:16];
                      }

                      while (v19);
                    }
                  }
                }
              }

              id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v69,  "countByEnumeratingWithState:objects:count:",  &v83,  v95,  16LL);
            }

            while (v12);
          }

          uint64_t v24 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
          id v67 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
          uint64_t v25 = -[NSFileManager contentsOfDirectoryAtPath:error:]( v24,  "contentsOfDirectoryAtPath:error:",  [v66 stringByAppendingPathComponent:@"Effects/"],  0);
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          v63 = v25;
          id v26 = -[NSArray countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v75,  v93,  16LL);
          uint64_t v27 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
          if (v26)
          {
            id v28 = v26;
            uint64_t v29 = *(void *)v76;
            uint64_t v61 = *(void *)v76;
            do
            {
              float v30 = 0LL;
              id v62 = v28;
              do
              {
                if (*(void *)v76 != v29) {
                  objc_enumerationMutation(v63);
                }
                id v31 = [v66 stringByAppendingFormat:@"/Effects/%@", *(void *)(*((void *)&v75 + 1) + 8 * (void)v30)];
                if (objc_msgSend( objc_msgSend(v31, "pathExtension"),  "isEqualToString:",  @"mrbEffect"))
                {
                  id v32 = [objc_alloc((Class)v27[206]) initWithPath:v31];
                  if (v32)
                  {
                    __int128 v33 = v32;
                    v64 = v30;
                    id v70 = v31;
                    id v34 = objc_msgSend(objc_msgSend(v31, "lastPathComponent"), "stringByDeletingPathExtension");
                    id v35 = [v33 pathForResource:@"EffectDescription" ofType:@"plist"];
                    v65 = v33;
                    uint64_t v36 = (NSDictionary *)[v33 pathForResource:@"LocalizedDescription" ofType:@"plist"];
                    if (v35)
                    {
                      v37 = v36;
                      int v38 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v35);
                      if (v38) {
                        id v39 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v38,  2LL,  0LL,  0LL);
                      }
                      else {
                        id v39 = 0LL;
                      }
                      v68 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Contents/Resources",  v31);
                      id v40 = objc_msgSend(objc_msgSend(v65, "infoDictionary"), "objectForKey:", @"CFBundleVersion");
                      id v41 = [v39 objectForKey:@"effects"];
                      if (v41)
                      {
                        v42 = v41;
                        if (v37) {
                          v37 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v37);
                        }
                        id v43 = -[NSDictionary objectForKey:](v37, "objectForKey:", @"_LOCALIZABLE_");
                        id v44 = -[NSDictionary objectForKey:](v37, "objectForKey:", @"effects");
                        __int128 v71 = 0u;
                        __int128 v72 = 0u;
                        __int128 v73 = 0u;
                        __int128 v74 = 0u;
                        id v45 = [v42 countByEnumeratingWithState:&v71 objects:v92 count:16];
                        if (v45)
                        {
                          id v46 = v45;
                          uint64_t v47 = *(void *)v72;
                          do
                          {
                            for (k = 0LL; k != v46; k = (char *)k + 1)
                            {
                              if (*(void *)v72 != v47) {
                                objc_enumerationMutation(v42);
                              }
                              uint64_t v49 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)k);
                              id v50 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
                              objc_msgSend(v50, "addEntriesFromDictionary:", objc_msgSend(v42, "objectForKey:", v49));
                              if (v43) {
                                [v50 addEntriesFromDictionary:v43];
                              }
                              id v51 = [v44 objectForKey:v49];
                              if (v51) {
                                objc_msgSend( v50,  "addEntriesFromDictionary:",  objc_msgSend(v51, "objectForKey:", @"_LOCALIZABLE_"));
                              }
                              [v50 setObject:v40 forKey:@"version"];
                              id v52 = [v50 objectForKey:@"Fonts"];
                              if (v52) {
                                [v67 addObjectsFromArray:v52];
                              }
                              [v50 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v70, @"Icon.tiff"), @"thumbnail" forKey];
                              [v50 setObject:v68 forKey:@"resourceFolderPath"];
                              -[NSMutableDictionary setObject:forKey:](v4->mEffects, "setObject:forKey:", v50, v49);
                            }

                            id v46 = [v42 countByEnumeratingWithState:&v71 objects:v92 count:16];
                          }

                          while (v46);
                        }
                      }

                      else
                      {
                        id v53 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
                        [v53 addEntriesFromDictionary:v39];
                        if (v37)
                        {
                          v54 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v37);
                          if (v54) {
                            objc_msgSend( v53,  "addEntriesFromDictionary:",  -[NSDictionary objectForKey:](v54, "objectForKey:", @"_LOCALIZABLE_"));
                          }
                        }

                        [v53 setObject:v40 forKey:@"version"];
                        id v55 = [v53 objectForKey:@"Fonts"];
                        if (v55) {
                          [v67 addObjectsFromArray:v55];
                        }
                        [v53 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@/Contents/Resources/%@", v31, @"Icon.tiff"), @"thumbnail" forKey];
                        [v53 setObject:v68 forKey:@"resourceFolderPath"];
                        -[NSMutableDictionary setObject:forKey:](v4->mEffects, "setObject:forKey:", v53, v34);
                      }
                    }

                    uint64_t v27 = &AVAudioTimePitchAlgorithmVarispeed_ptr;
                    uint64_t v29 = v61;
                    id v28 = v62;
                    float v30 = v64;
                  }
                }

                float v30 = (char *)v30 + 1;
              }

              while (v30 != v28);
              id v28 = -[NSArray countByEnumeratingWithState:objects:count:]( v63,  "countByEnumeratingWithState:objects:count:",  &v75,  v93,  16LL);
            }

            while (v28);
          }

          -[NSMutableDictionary addEntriesFromDictionary:]( v4->mCategories,  "addEntriesFromDictionary:",  +[NSDictionary dictionaryWithContentsOfFile:]( NSDictionary,  "dictionaryWithContentsOfFile:",  [v66 stringByAppendingPathComponent:@"LocalizedEffectCategories.plist"]));
          -[MPEffectManager _loadFontsFromPath:requiredFonts:]( v4,  "_loadFontsFromPath:requiredFonts:",  [v66 stringByAppendingPathComponent:@"Fonts"],  v67);
          uint64_t v9 = v60 + 1;
        }

        while ((id)(v60 + 1) != v59);
        id v59 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
      }

      while (v59);
    }
  }

  return v4;
}

- (void)_loadFontsFromPath:(id)a3 requiredFonts:(id)a4
{
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", a3, a4),  "fileExistsAtPath:",  a3))
  {
    id v6 = -[NSFileManager enumeratorAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "enumeratorAtPath:",  a3);
    id v7 = -[NSDirectoryEnumerator nextObject](v6, "nextObject");
    if (v7)
    {
      id v8 = v7;
      do
      {
        uint64_t v9 = +[NSURL fileURLWithPath:]( NSURL,  "fileURLWithPath:",  [a3 stringByAppendingPathComponent:v8]);
        CFErrorRef error = 0LL;
        if (CTFontManagerRegisterFontsForURL((CFURLRef)v9, kCTFontManagerScopeProcess, &error))
        {
          -[NSMutableArray addObject:](self->mRegisteredFonts, "addObject:", v9);
        }

        else
        {
          CFStringRef v10 = CFErrorCopyDescription(error);
          NSLog(@"CTFontManagerRegisterFontsForURL failed, error '%@'\n", v10);
          CFRelease(v10);
        }

        id v8 = -[NSDirectoryEnumerator nextObject](v6, "nextObject");
      }

      while (v8);
    }
  }

@end