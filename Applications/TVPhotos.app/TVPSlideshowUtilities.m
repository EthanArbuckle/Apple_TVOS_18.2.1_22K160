@interface TVPSlideshowUtilities
- (BOOL)themeHasAdditionalOptions:(id)a3;
- (NSString)currentTheme;
- (NSUUID)uuid;
- (TVPSlideshowUtilities)init;
- (TVPSlideshowUtilities)initWithMarimbaMode:(int64_t)a3;
- (double)timePerSlide;
- (id)_getRandomizedMarimbaTheme;
- (id)alertControllerDisplayingTimePerSlideOptionsForCell:(id)a3;
- (id)updateMarimbaDocument:(id)a3 photoAssets:(id)a4;
- (int64_t)mode;
- (void)_setTransitionTiming:(double)a3 marimbaView:(id)a4;
- (void)cleanUpMarimbaResources:(id)a3;
- (void)logSlideshowDidEndReachingSlideshowEnd:(BOOL)a3;
- (void)logSlideshowDidPause;
- (void)logSlideshowDidResume;
- (void)logSlideshowDidStartWithAssetCountsByPlaybackStyle:(id)a3 repeating:(BOOL)a4 shuffled:(BOOL)a5 defaultSlideDuration:(double)a6;
- (void)setCurrentTheme:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)updateMarimbaView:(id)a3 currentTheme:(id)a4 currentTransition:(id)a5;
- (void)updateMarimbaView:(id)a3 transitionTiming:(double)a4;
- (void)updateTransitionTimingForMarimbaView:(id)a3;
@end

@implementation TVPSlideshowUtilities

- (TVPSlideshowUtilities)initWithMarimbaMode:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPSlideshowUtilities;
  v4 = -[TVPSlideshowUtilities init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;
  }

  return v5;
}

- (TVPSlideshowUtilities)init
{
  return 0LL;
}

- (id)updateMarimbaDocument:(id)a3 photoAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v7 count]);
  v8 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v7 count]);
  objc_super v9 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v7 count]);
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
        [v21 setObject:&off_1000D1860 forKey:kMPMetaDataMediaType];
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
        [v20 setObject:&off_1000D1860 forKey:kMPMetaDataMediaType];
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
    v25 = &off_1000D1860;
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

  -[TVPSlideshowUtilities setCurrentTheme:](self, "setCurrentTheme:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 styleID]);
  unsigned __int8 v20 = [v19 isEqualToString:v15];

  if ((v20 & 1) == 0)
  {
    if ([v15 isEqualToString:TVScreenSaverStyleRandom])
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue(-[TVPSlideshowUtilities _getRandomizedMarimbaTheme](self, "_getRandomizedMarimbaTheme"));

      id v15 = (id)v21;
    }

    [v10 pause];
    [v10 gotoBeginning];
    [v11 applyStyle:v15];
    [v10 warmupRenderer];
    [v10 play];
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v11 documentAttributeForKey:kMPDocumentAuthoringOptions]);
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v22));

  v45 = v15;
  if (-[TVPSlideshowUtilities themeHasAdditionalOptions:](self, "themeHasAdditionalOptions:", v15))
  {
    id v23 = v9;
    if (![v23 length])
    {
      if (self->_mode != 1
        || (v24 = (void *)objc_claimAutoreleasedReturnValue([v13 stringForKey:TVScreenSaverTransitionStyleKey]),
            v23,
            id v23 = v24,
            ![v24 length]))
      {
        uint64_t v25 = objc_claimAutoreleasedReturnValue([v13 slideshowTransitionStyle]);

        id v23 = (id)v25;
      }
    }
  }

  else
  {
    id v23 = 0LL;
  }

  if ([v23 length])
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowUtilities currentTheme](self, "currentTheme"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByAppendingFormat:@"-%@", v23]);
    -[TVPSlideshowUtilities setCurrentTheme:](self, "setCurrentTheme:", v27);

    id v60 = v23;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v60, 1LL));
    v29 = v46;
    [v46 setObject:v28 forKey:kMPAuthoringTransitionList];
  }

  else
  {
    v29 = v46;
    [v46 removeObjectForKey:kMPAuthoringTransitionList];
  }

  [v11 setDocumentAttribute:v29 forKey:kMPDocumentAuthoringOptions];
  if (v23)
  {
    v40 = v13;
    id v41 = v14;
    v43 = v10;
    id v44 = v9;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    v42 = v11;
    id obj = (id)objc_claimAutoreleasedReturnValue([v11 layers]);
    id v49 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v49)
    {
      uint64_t v48 = *(void *)v55;
      do
      {
        for (i = 0LL; i != v49; i = (char *)i + 1)
        {
          if (*(void *)v55 != v48) {
            objc_enumerationMutation(obj);
          }
          id v31 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          v32 = (void *)objc_claimAutoreleasedReturnValue([v31 effectContainers]);
          id v33 = [v32 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = *(void *)v51;
            do
            {
              for (j = 0LL; j != v34; j = (char *)j + 1)
              {
                if (*(void *)v51 != v35) {
                  objc_enumerationMutation(v32);
                }
                v38 = (void *)objc_claimAutoreleasedReturnValue([v37 transitionID]);
                unsigned __int8 v39 = [v23 isEqualToString:v38];

                if ((v39 & 1) == 0)
                {
                  [v37 setTransitionID:v23];
                  [v37 setPresetID:@"Default"];
                }
              }

              id v34 = [v32 countByEnumeratingWithState:&v50 objects:v58 count:16];
            }

            while (v34);
          }
        }

        id v49 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      }

      while (v49);
    }

    id v10 = v43;
    id v9 = v44;
    id v14 = v41;
    id v11 = v42;
    uint64_t v13 = v40;
    v29 = v46;
  }
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
  unsigned int v11 = -[TVPSlideshowUtilities themeHasAdditionalOptions:](self, "themeHasAdditionalOptions:", v10);

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
        -[TVPSlideshowUtilities timePerSlide](self, "timePerSlide");
        -[TVPSlideshowUtilities _setTransitionTiming:marimbaView:](self, "_setTransitionTiming:marimbaView:", v15);
      }
    }

    else
    {
      -[TVPSlideshowUtilities _setTransitionTiming:marimbaView:]( self,  "_setTransitionTiming:marimbaView:",  v15,  a4 + 2.0);
    }
  }

  else
  {
    [v9 setObject:&off_1000D1EA8 forKey:kMPAuthoringLayerTimeScale];
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
  v62[0] = 0LL;
  v62[1] = v62;
  v62[2] = 0x2020000000LL;
  v62[3] = 3LL;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedSlideshowPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedSlideshowPreferences"));
  double v6 = (void *)objc_opt_new(&OBJC_CLASS___NSDateComponentsFormatter, v5);
  [v6 setUnitsStyle:3];
  [v6 setAllowedUnits:128];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"TimePerSlide" value:&stru_1000CC6C8 table:0]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v8,  &stru_1000CC6C8,  1LL));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 stringFromTimeInterval:2.0]);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_100078EE4;
  v57[3] = &unk_1000CC648;
  v61 = v62;
  id v11 = v4;
  id v58 = v11;
  id v12 = v3;
  id v59 = v12;
  id v13 = v6;
  id v60 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  0LL,  v57));
  [v9 addAction:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringFromTimeInterval:3.0]);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100078F6C;
  v52[3] = &unk_1000CC648;
  __int128 v56 = v62;
  id v16 = v11;
  id v53 = v16;
  id v17 = v12;
  id v54 = v17;
  id v18 = v13;
  id v55 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  0LL,  v52));
  [v9 addAction:v19];

  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringFromTimeInterval:5.0]);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100078FF4;
  v47[3] = &unk_1000CC648;
  __int128 v51 = v62;
  id v21 = v16;
  id v48 = v21;
  id v22 = v17;
  id v49 = v22;
  id v23 = v18;
  id v50 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v20,  0LL,  v47));
  [v9 addAction:v24];

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 stringFromTimeInterval:10.0]);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10007907C;
  v42[3] = &unk_1000CC648;
  v46 = v62;
  id v26 = v21;
  id v43 = v26;
  id v27 = v22;
  id v44 = v27;
  id v28 = v23;
  id v45 = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v25,  0LL,  v42));
  [v9 addAction:v29];

  char v30 = (void *)objc_claimAutoreleasedReturnValue([v28 stringFromTimeInterval:20.0]);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100079104;
  v37[3] = &unk_1000CC648;
  id v41 = v62;
  id v31 = v26;
  id v38 = v31;
  id v32 = v27;
  id v39 = v32;
  id v33 = v28;
  id v40 = v33;
  id v34 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v30,  0LL,  v37));
  [v9 addAction:v34];

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
  [v9 addAction:v35];

  _Block_object_dispose(v62, 8);
  return v9;
}

- (void)logSlideshowDidStartWithAssetCountsByPlaybackStyle:(id)a3 repeating:(BOOL)a4 shuffled:(BOOL)a5 defaultSlideDuration:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  if (-[TVPSlideshowUtilities mode](self, "mode")) {
    uint64_t v11 = 6LL;
  }
  else {
    uint64_t v11 = 2LL;
  }
  id v18 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  7LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowUtilities uuid](self, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v12,  PXAnalyticsPayloadSlideshowSessionIdentifierKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v10,  PXAnalyticsPayloadSlideshowAssetCountsByPlaybackStyleKey);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowUtilities currentTheme](self, "currentTheme"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v13,  PXAnalyticsPayloadSlideshowStyleKey);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v14,  PXAnalyticsPayloadSlideshowTriggerTypeKey);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v15,  PXAnalyticsPayloadSlideshowRepeatingKey);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v16,  PXAnalyticsPayloadSlideshowShuffledKey);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a6));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v17,  PXAnalyticsPayloadSlideshowDefaultSlideDurationKey);

  +[CPAnalytics sendEvent:withPayload:]( &OBJC_CLASS___CPAnalytics,  "sendEvent:withPayload:",  PXAnalyticsEventSlideshowPlaybackStarted,  v18);
}

- (void)logSlideshowDidPause
{
  uint64_t v2 = PXAnalyticsEventSlideshowPlaybackPaused;
  uint64_t v5 = PXAnalyticsPayloadSlideshowSessionIdentifierKey;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowUtilities uuid](self, "uuid"));
  double v6 = v3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  +[CPAnalytics sendEvent:withPayload:](&OBJC_CLASS___CPAnalytics, "sendEvent:withPayload:", v2, v4);
}

- (void)logSlideshowDidResume
{
  uint64_t v2 = PXAnalyticsEventSlideshowPlaybackResumed;
  uint64_t v5 = PXAnalyticsPayloadSlideshowSessionIdentifierKey;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowUtilities uuid](self, "uuid"));
  double v6 = v3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  +[CPAnalytics sendEvent:withPayload:](&OBJC_CLASS___CPAnalytics, "sendEvent:withPayload:", v2, v4);
}

- (void)logSlideshowDidEndReachingSlideshowEnd:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = PXAnalyticsEventSlideshowPlaybackEnded;
  v9[0] = PXAnalyticsPayloadSlideshowSessionIdentifierKey;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSlideshowUtilities uuid](self, "uuid"));
  v10[0] = v5;
  v9[1] = PXAnalyticsPayloadSlideshowTerminationTypeKey;
  if (v3) {
    uint64_t v6 = 2LL;
  }
  else {
    uint64_t v6 = 1LL;
  }
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6));
  v10[1] = v7;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  +[CPAnalytics sendEvent:withPayload:](&OBJC_CLASS___CPAnalytics, "sendEvent:withPayload:", v4, v8);
}

- (void)_setTransitionTiming:(double)a3 marimbaView:(id)a4
{
  id v23 = (void *)objc_claimAutoreleasedReturnValue([a4 marimbaLayer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v23 document]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 documentAttributeForKey:kMPDocumentAuthoringOptions]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v6));

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  [v7 setObject:v8 forKey:kMPAuthoringMinimumEffectDuration];

  id v22 = v7;
  [v5 setDocumentAttribute:v7 forKey:kMPDocumentAuthoringOptions];
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 layers]);
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
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
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
              unsigned __int8 v20 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)j);
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
  v10[0] = TVScreenSaverStyleRandom;
  v10[1] = TVScreenSaverStyleCascade;
  void v10[2] = TVScreenSaverStyleFlipUp;
  v10[3] = TVScreenSaverStyleFloating;
  v10[4] = TVScreenSaverStyleOrigami;
  v10[5] = TVScreenSaverStyleReflections;
  v10[6] = TVScreenSaverStyleShiftingTiles;
  v10[7] = TVScreenSaverStyleShrinkingTiles;
  v10[8] = TVScreenSaverStyleSlidingPanels;
  v10[9] = TVScreenSaverStyleSnapshots;
  v10[10] = TVScreenSaverStyleKenBurns;
  v10[11] = TVScreenSaverStyleClassic;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 12LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v3));
  [v4 removeObject:v2];
  unint64_t v5 = arc4random();
  unint64_t v6 = (int)(v5 % (unint64_t)[v4 count]);
  else {
    unint64_t v7 = v6;
  }
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:v7]);

  return v8;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)currentTheme
{
  return self->_currentTheme;
}

- (void)setCurrentTheme:(id)a3
{
}

- (void).cxx_destruct
{
}

@end