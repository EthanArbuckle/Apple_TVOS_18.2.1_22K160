@interface TVSSSlideshowUtilities
- (BOOL)themeHasAdditionalOptions:(id)a3;
- (TVSSSlideshowUtilities)init;
- (TVSSSlideshowUtilities)initWithMarimbaMode:(int64_t)a3;
- (double)timePerSlide;
- (id)_getRandomizedMarimbaTheme;
- (id)alertControllerDisplayingTimePerSlideOptionsForCell:(id)a3;
- (id)updateMarimbaDocument:(id)a3 photoAssets:(id)a4;
- (int64_t)mode;
- (void)_setTransitionTiming:(double)a3 marimbaView:(id)a4;
- (void)cleanUpMarimbaResources:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)updateMarimbaView:(id)a3 currentTheme:(id)a4 currentTransition:(id)a5;
- (void)updateMarimbaView:(id)a3 transitionTiming:(double)a4;
- (void)updateTransitionTimingForMarimbaView:(id)a3;
@end

@implementation TVSSSlideshowUtilities

- (TVSSSlideshowUtilities)initWithMarimbaMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSSSlideshowUtilities;
  result = -[TVSSSlideshowUtilities init](&v5, "init");
  if (result) {
    result->_mode = a3;
  }
  return result;
}

- (TVSSSlideshowUtilities)init
{
  return 0LL;
}

- (id)updateMarimbaDocument:(id)a3 photoAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v7 count]);
  v8 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v7 count]);
  v9 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v7 count]);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v11)
  {

    [v6 setVideoPaths:v9];
    id v26 = -[NSMutableDictionary copy](v8, "copy");
    [v6 setMediaProperties:v26];

    v25 = (_UNKNOWN **)&__kCFBooleanFalse;
    v24 = &kMPAuthoringUseClustering;
    goto LABEL_20;
  }

  id v12 = v11;
  v29 = v6;
  char v30 = 0;
  uint64_t v13 = *(void *)v34;
  v14 = v10;
  id v31 = v10;
  do
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v34 != v13) {
        objc_enumerationMutation(v14);
      }
      v16 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
      if (self->_mode)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 fullResolutionURL]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);

        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([@"appletv://" stringByAppendingString:v19]);

        -[NSMutableArray addObject:](v9, "addObject:", v20);
        -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v21 setObject:&off_10000CEB8 forKey:kMPMetaDataMediaType];
        v22 = (void *)objc_claimAutoreleasedReturnValue([v16 dateCreated]);
        if (v22)
        {
          [v21 setObject:v22 forKey:kMPMetaDataCreationDate];
          char v30 = 1;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v21, v20, v29);

        v14 = v31;
      }

      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v33 + 1) + 8 * (void)i) assetIdentifier]);
        -[NSMutableArray addObject:](v9, "addObject:", v18);
        -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v16, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v20 setObject:&off_10000CEB8 forKey:kMPMetaDataMediaType];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v20, v18);
      }
    }

    id v12 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }

  while (v12);

  id v6 = v29;
  [v29 setVideoPaths:v9];
  id v23 = -[NSMutableDictionary copy](v8, "copy");
  [v29 setMediaProperties:v23];

  v24 = &kMPAuthoringUseClustering;
  if ((v30 & 1) != 0)
  {
    [v29 setAuthoringOption:&__kCFBooleanTrue forKey:kMPAuthoringUseClustering];
    v25 = &off_10000CEB8;
    v24 = &kMPAuthoringImageOrderingMode;
  }

  else
  {
    v25 = (_UNKNOWN **)&__kCFBooleanFalse;
  }

  id v10 = v31;
LABEL_20:
  objc_msgSend(v6, "setAuthoringOption:forKey:", v25, *v24, v29);
  id v27 = -[NSMutableDictionary copy](v32, "copy");

  return v27;
}

- (void)updateMarimbaView:(id)a3 currentTheme:(id)a4 currentTransition:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 marimbaLayer]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 document]);
  if (self->_mode) {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedScreenSaverPreferences](&OBJC_CLASS___TVSPreferences, "sharedScreenSaverPreferences"));
  }
  else {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedSlideshowPreferences](&OBJC_CLASS___TVSPreferences, "sharedSlideshowPreferences"));
  }
  uint64_t v13 = (void *)v12;
  id v14 = v8;
  id v15 = v14;
  if (![v14 length])
  {
    if (self->_mode)
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v13 stringForKey:TVScreenSaverStyleKey]);
      v17 = (void *)v16;
      v18 = (void *)TVScreenSaverStyleKenBurns;
      if (v16) {
        v18 = (void *)v16;
      }
      id v15 = v18;
    }

    else
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue([v13 slideshowStyle]);
      v17 = v14;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000066D0((uint64_t)v15);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 styleID]);
  unsigned __int8 v20 = [v19 isEqualToString:v15];

  if ((v20 & 1) == 0)
  {
    if ([v15 isEqualToString:TVScreenSaverStyleRandom])
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue(-[TVSSSlideshowUtilities _getRandomizedMarimbaTheme](self, "_getRandomizedMarimbaTheme"));

      id v15 = (id)v21;
    }

    [v10 pause];
    [v10 gotoBeginning];
    [v11 applyStyle:v15];
    [v10 warmupRenderer];
    [v10 play];
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v11 documentAttributeForKey:kMPDocumentAuthoringOptions]);
  uint64_t v44 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v22));

  v43 = v15;
  if (!-[TVSSSlideshowUtilities themeHasAdditionalOptions:](self, "themeHasAdditionalOptions:", v15))
  {
    id v23 = 0LL;
    goto LABEL_23;
  }

  id v23 = v9;
  if ([v23 length])
  {
LABEL_23:
    v24 = (void *)v44;
    goto LABEL_24;
  }

  v24 = (void *)v44;
  if (self->_mode != 1
    || (v25 = (void *)objc_claimAutoreleasedReturnValue([v13 stringForKey:TVScreenSaverTransitionStyleKey]),
        v23,
        id v23 = v25,
        ![v25 length]))
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v13 slideshowTransitionStyle]);

    id v23 = (id)v26;
  }

- (void)updateTransitionTimingForMarimbaView:(id)a3
{
}

- (void)updateMarimbaView:(id)a3 transitionTiming:(double)a4
{
  id v15 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v15 marimbaLayer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 document]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 documentAttributeForKey:kMPDocumentAuthoringOptions]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 styleID]);
  unsigned int v11 = -[TVSSSlideshowUtilities themeHasAdditionalOptions:](self, "themeHasAdditionalOptions:", v10);

  if (v11)
  {
    [v9 removeObjectForKey:kMPAuthoringLayerTimeScale];
    if (a4 <= 0.0)
    {
      if (self->_mode) {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
      }
      else {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
      }
      uint64_t v13 = v12;
      if (self->_mode) {
        uint64_t v14 = (int)[v12 integerForKey:TVScreenSaverTimePerSlideKey];
      }
      else {
        uint64_t v14 = (uint64_t)[v12 timePerSlide];
      }
      if (v14 <= 0)
      {
        [v9 removeObjectForKey:kMPAuthoringMinimumEffectDuration];
        [v7 setDocumentAttribute:v9 forKey:kMPDocumentAuthoringOptions];
      }

      else
      {
        -[TVSSSlideshowUtilities timePerSlide](self, "timePerSlide");
        -[TVSSSlideshowUtilities _setTransitionTiming:marimbaView:](self, "_setTransitionTiming:marimbaView:", v15);
      }
    }

    else
    {
      -[TVSSSlideshowUtilities _setTransitionTiming:marimbaView:]( self,  "_setTransitionTiming:marimbaView:",  v15,  a4 + 2.0);
    }
  }

  else
  {
    [v9 setObject:&off_10000D0C0 forKey:kMPAuthoringLayerTimeScale];
    [v9 removeObjectForKey:kMPAuthoringMinimumEffectDuration];
    [v7 setDocumentAttribute:v9 forKey:kMPDocumentAuthoringOptions];
  }
}

- (void)cleanUpMarimbaResources:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 marimbaLayer]);
  [v4 pause];
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 document]);
  [v3 setAssetKeyDelegate:0];

  [v4 cleanup];
  +[MRMarimbaLayer releaseResources](&OBJC_CLASS___MRMarimbaLayer, "releaseResources");
}

- (double)timePerSlide
{
  if (self->_mode) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  }
  id v4 = v3;
  if (self->_mode) {
    uint64_t v5 = (int)[v3 integerForKey:TVScreenSaverTimePerSlideKey];
  }
  else {
    uint64_t v5 = (uint64_t)[v3 timePerSlide];
  }
  double v6 = (double)v5 + 2.0;

  return v6;
}

- (BOOL)themeHasAdditionalOptions:(id)a3
{
  id v3 = a3;
  else {
    unsigned __int8 v4 = [TVScreenSaverStyleKenBurns isEqual:v3];
  }

  return v4;
}

- (id)alertControllerDisplayingTimePerSlideOptionsForCell:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"TimePerSlide" value:&stru_10000C750 table:@"Localizable"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  &stru_10000C750,  1LL));
  id v8 = objc_opt_new(&OBJC_CLASS___NSDateComponentsFormatter);
  -[NSDateComponentsFormatter setUnitsStyle:](v8, "setUnitsStyle:", 3LL);
  -[NSDateComponentsFormatter setAllowedUnits:](v8, "setAllowedUnits:", 128LL);
  uint64_t v9 = 0LL;
  v23[0] = xmmword_1000084D0;
  v23[1] = xmmword_1000084E0;
  uint64_t v24 = 0x4034000000000000LL;
  do
  {
    double v10 = *(double *)((char *)v23 + v9);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponentsFormatter stringFromTimeInterval:](v8, "stringFromTimeInterval:", v10));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100005D98;
    v18[3] = &unk_10000C670;
    id v12 = v4;
    id v19 = v12;
    double v22 = v10;
    id v13 = v3;
    id v20 = v13;
    id v21 = v11;
    id v14 = v11;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  0LL,  v18));
    [v7 addAction:v15];

    v9 += 8LL;
  }

  while (v9 != 40);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
  [v7 addAction:v16];

  return v7;
}

- (void)_setTransitionTiming:(double)a3 marimbaView:(id)a4
{
  id v23 = (void *)objc_claimAutoreleasedReturnValue([a4 marimbaLayer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v23 document]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 documentAttributeForKey:kMPDocumentAuthoringOptions]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  [v7 setObject:v8 forKey:kMPAuthoringMinimumEffectDuration];

  double v22 = v7;
  [v5 setDocumentAttribute:v7 forKey:kMPDocumentAuthoringOptions];
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 layers]);
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 effectContainers]);
        id v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v25;
          do
          {
            for (j = 0LL; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v25 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)j);
              [v20 duration];
              if (v21 != a3) {
                [v20 setDuration:a3];
              }
            }

            id v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v17);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v11);
  }
}

- (id)_getRandomizedMarimbaTheme
{
  uint64_t v2 = TVScreenSaverStyleRandom;
  v8[0] = TVScreenSaverStyleRandom;
  v8[1] = TVScreenSaverStyleCascade;
  v8[2] = TVScreenSaverStyleFlipUp;
  v8[3] = TVScreenSaverStyleFloating;
  v8[4] = TVScreenSaverStyleOrigami;
  v8[5] = TVScreenSaverStyleReflections;
  v8[6] = TVScreenSaverStyleShiftingTiles;
  v8[7] = TVScreenSaverStyleShrinkingTiles;
  v8[8] = TVScreenSaverStyleSlidingPanels;
  v8[9] = TVScreenSaverStyleSnapshots;
  v8[10] = TVScreenSaverStyleKenBurns;
  v8[11] = TVScreenSaverStyleClassic;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 12LL));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v3));
  [v4 removeObject:v2];
  id v5 = objc_msgSend(v4, "objectAtIndex:", arc4random_uniform((uint32_t)objc_msgSend(v4, "count")));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

@end