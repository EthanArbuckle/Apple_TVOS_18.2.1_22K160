@interface TVSettingsDisplayModeFacade
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (TVSettingsDisplayModeFacade)sharedInstance;
+ (id)keyPathsForValuesAffectingBestNearbyModeForQMS;
+ (id)keyPathsForValuesAffectingQmsUnverifiedDisplayModes;
- (BOOL)hdr10PlusEnabled;
- (BOOL)shouldModeSwitchForDynamicRange;
- (BOOL)shouldModeSwitchForFrameRate;
- (BOOL)shouldShowDisplayAssistant;
- (BOOL)shouldUseQMSForFrameRateSwitching;
- (NSArray)commonResolutionsModes50Hz;
- (NSArray)commonResolutionsModes60Hz;
- (NSArray)commonResolutionsModesOthers;
- (NSArray)dynamicRangeOptions;
- (NSArray)frameRateOptions;
- (NSArray)otherResolutionsModes24Hz;
- (NSArray)otherResolutionsModes25Hz;
- (NSArray)otherResolutionsModes30Hz;
- (NSArray)otherResolutionsModes50Hz;
- (NSArray)otherResolutionsModes60Hz;
- (NSArray)otherResolutionsModesExact24Hz;
- (NSArray)otherResolutionsModesExact30Hz;
- (NSArray)otherResolutionsModesExact60Hz;
- (NSArray)otherResolutionsModesOthers;
- (NSArray)unverifiedDisplayModes;
- (NSArray)userVisibleHDRChromaModes;
- (NSArray)userVisibleSDRChromaModes;
- (NSArray)userVisibleSDRColorMappingModes;
- (NSArray)userVisibleSortedDisplayModes;
- (NSString)localizedCurrentSettings;
- (NSString)preferredDisplaySizeIdentifier;
- (PBSDisplayMode)bestNearbyModeForQMS;
- (PBSDisplayMode)selectedHDRChromaMode;
- (PBSDisplayMode)selectedSDRChromaMode;
- (PBSDisplayMode)selectedSDRColorMappingMode;
- (PBSDisplayModeSet)bestNearbyModeSetForQMS;
- (TSKMappingFormatter)dynamicRangeDescriptionFormatter;
- (TSKMappingFormatter)dynamicRangeOptionFormatter;
- (TSKMappingFormatter)frameRateDescriptionFormatter;
- (TSKMappingFormatter)frameRateOptionFormatter;
- (TSKMappingFormatter)preferredDisplaySizeDescriptionFormatter;
- (TSKMappingFormatter)preferredDisplaySizeOptionFormatter;
- (TVSettingsDisplayAssistantActionInfo)displayAssistantActionInfo;
- (TVSettingsDisplayModeFacade)init;
- (id)_recalculateBestQMSModeSet;
- (id)_recalculatedUnverifiedModes;
- (id)_recalculatedUserVisibleHDRChromaModes;
- (id)_recalculatedUserVisibleSDRChromaModes;
- (id)_recalculatedUserVisibleSDRColorMappingModes;
- (id)_sortedDisplayModesForUserPresentation:(id)a3;
- (id)qmsUnverifiedDisplayModes;
- (unint64_t)preferredDynamicRange;
- (unint64_t)preferredFrameRate;
- (void)_enumerateValidColorModesFromSortedModes:(id)a3 existingFiltering:(id)a4 withBlock:(id)a5;
- (void)_reloadDataFromCache;
- (void)dealloc;
- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4;
- (void)presentCableCheckDisplayAssistant;
- (void)presentUpgradeAttemptDisplayAssistant;
- (void)resetVideoSettingsWithCompletion:(id)a3;
- (void)setBestNearbyModeSetForQMS:(id)a3;
- (void)setCommonResolutionsModes50Hz:(id)a3;
- (void)setCommonResolutionsModes60Hz:(id)a3;
- (void)setCommonResolutionsModesOthers:(id)a3;
- (void)setDynamicRangeDescriptionFormatter:(id)a3;
- (void)setDynamicRangeOptionFormatter:(id)a3;
- (void)setFrameRateDescriptionFormatter:(id)a3;
- (void)setFrameRateOptionFormatter:(id)a3;
- (void)setHdr10PlusEnabled:(BOOL)a3;
- (void)setOtherResolutionsModes24Hz:(id)a3;
- (void)setOtherResolutionsModes25Hz:(id)a3;
- (void)setOtherResolutionsModes30Hz:(id)a3;
- (void)setOtherResolutionsModes50Hz:(id)a3;
- (void)setOtherResolutionsModes60Hz:(id)a3;
- (void)setOtherResolutionsModesExact24Hz:(id)a3;
- (void)setOtherResolutionsModesExact30Hz:(id)a3;
- (void)setOtherResolutionsModesExact60Hz:(id)a3;
- (void)setOtherResolutionsModesOthers:(id)a3;
- (void)setPreferredDisplaySizeDescriptionFormatter:(id)a3;
- (void)setPreferredDisplaySizeIdentifier:(id)a3;
- (void)setPreferredDisplaySizeOptionFormatter:(id)a3;
- (void)setPreferredDynamicRange:(unint64_t)a3;
- (void)setPreferredFrameRate:(unint64_t)a3;
- (void)setSelectedHDRChromaMode:(id)a3;
- (void)setSelectedSDRChromaMode:(id)a3;
- (void)setSelectedSDRColorMappingMode:(id)a3;
- (void)setShouldModeSwitchForDynamicRange:(BOOL)a3;
- (void)setShouldModeSwitchForFrameRate:(BOOL)a3;
- (void)setShouldUseQMSForFrameRateSwitching:(BOOL)a3;
- (void)setUnverifiedDisplayModes:(id)a3;
- (void)setUserVisibleHDRChromaModes:(id)a3;
- (void)setUserVisibleSDRChromaModes:(id)a3;
- (void)setUserVisibleSDRColorMappingModes:(id)a3;
- (void)setUserVisibleSortedDisplayModes:(id)a3;
- (void)updateDisplayManagerWithDisplayMode:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)updateDisplayManagerWithDisplayMode:(id)a3 reason:(id)a4 requestConfiguration:(id)a5 completion:(id)a6;
@end

@implementation TVSettingsDisplayModeFacade

+ (TVSettingsDisplayModeFacade)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091108;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1980 != -1) {
    dispatch_once(&qword_1001E1980, block);
  }
  return (TVSettingsDisplayModeFacade *)(id)qword_1001E1978;
}

- (TVSettingsDisplayModeFacade)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVSettingsDisplayModeFacade;
  v2 = -[TVSettingsDisplayModeFacade init](&v16, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentDisplayMode]);
    v5 = (PBSDisplayMode *)[v4 copy];
    cachedCurrentDisplayMode = v2->_cachedCurrentDisplayMode;
    v2->_cachedCurrentDisplayMode = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedDisplayModes]);
    v8 = (NSArray *)[v7 copy];
    cachedSortedDisplayModes = v2->_cachedSortedDisplayModes;
    v2->_cachedSortedDisplayModes = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSArray);
    cachedUnverifiedDisplayModes = v2->_cachedUnverifiedDisplayModes;
    v2->_cachedUnverifiedDisplayModes = v10;

    v2->_cachedCanHandleHighBandwidthModes = [v3 canHandleHighBandwidthModes];
    v2->_cachedShouldModeSwitchForDynamicRange = [v3 shouldModeSwitchForDynamicRange];
    v2->_cachedShouldModeSwitchForFrameRate = [v3 shouldModeSwitchForFrameRate];
    v2->_cachedShouldUseQMSForFrameRateSwitching = [v3 shouldUseQMSForFrameRateSwitching];
    v2->_cachedHDR10PlusEnabled = [v3 hdr10PlusMetadataEnabled];
    uint64_t v12 = PBSDisplaySizeIdentifierFromSize([v3 softwareDisplaySize]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    cachedDisplaySizeIdentifier = v2->_cachedDisplaySizeIdentifier;
    v2->_cachedDisplaySizeIdentifier = (NSString *)v13;

    -[TVSettingsDisplayModeFacade _reloadDataFromCache](v2, "_reloadDataFromCache");
    [v3 addStateObserver:v2];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  [v3 removeStateObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsDisplayModeFacade;
  -[TVSettingsDisplayModeFacade dealloc](&v4, "dealloc");
}

- (void)setSelectedSDRColorMappingMode:(id)a3
{
}

- (id)_recalculatedUserVisibleSDRColorMappingModes
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDisplayModeFacade userVisibleSortedDisplayModes](self, "userVisibleSortedDisplayModes"));
  id v6 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v6)
  {

    goto LABEL_34;
  }

  id v7 = v6;
  uint64_t v34 = 0LL;
  char v35 = 0;
  uint64_t v8 = *(void *)v37;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v37 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 currentDisplayMode]);
      unsigned int v12 = objc_msgSend(v10, "tvs_isEqualResolutionAndRefreshRate:", v11);

      if (v12 && [v10 dynamicRange] == (id)538423557)
      {
        id v13 = [v10 SDRColorMapping];
        if ((v13 != (id)538424066) | v35 & 1)
        {
          if (v13 == (id)538424066) {
            continue;
          }
        }

        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v4 currentDisplayMode]);
          if ([v14 SDRColorMapping] == (id)538424066)
          {
            id v15 = [v10 SDRChromaSubsampling];
            objc_super v16 = v5;
            v17 = v3;
            id v18 = [v14 SDRChromaSubsampling];

            char v35 = 0;
            BOOL v19 = v15 == v18;
            v3 = v17;
            v5 = v16;
            if (!v19) {
              continue;
            }
          }

          else
          {
            id v20 = [v10 SDRColorMapping];
            unsigned __int8 v21 = [v4 canHandleHighBandwidthModes];
            if ((v21 & 1) != 0 || v20 != (id)538424066)
            {
              if (v20 == (id)538424066) {
                unsigned __int8 v23 = v21;
              }
              else {
                unsigned __int8 v23 = 0;
              }

              if ((v23 & 1) == 0)
              {
                char v35 = 0;
                continue;
              }

              char v35 = 1;
            }

            else
            {
              unsigned __int8 v22 = [v10 isAboveBandwidthThreshold];

              if ((v22 & 1) != 0)
              {
                char v35 = 0;
                continue;
              }

              char v35 = 1;
            }
          }
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v3, "lastObject"));
        unsigned int v25 = [v24 isEqual:v10];

        if (v25) {
          ++v34;
        }
        else {
          -[NSMutableArray addObject:](v3, "addObject:", v10);
        }
      }
    }

    id v7 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }

  while (v7);

  if (v34 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1000F9BA0(v34, v26, v27, v28, v29, v30, v31, v32);
  }
LABEL_34:

  return v3;
}

- (void)setSelectedSDRChromaMode:(id)a3
{
}

- (id)_recalculatedUserVisibleSDRChromaModes
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDisplayModeFacade userVisibleSortedDisplayModes](self, "userVisibleSortedDisplayModes"));
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v23 = 0LL;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v4 currentDisplayMode]);
        unsigned int v12 = objc_msgSend(v10, "tvs_isEqualResolutionAndRefreshRate:", v11);

        if (v12 && [v10 SDRColorMapping] == (id)538424066)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v3, "lastObject"));
          unsigned int v14 = [v13 isEqual:v10];

          if (v14) {
            ++v23;
          }
          else {
            -[NSMutableArray addObject:](v3, "addObject:", v10);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v7);

    if (v23 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000F9BA0(v23, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  else
  {
  }

  return v3;
}

- (void)setSelectedHDRChromaMode:(id)a3
{
}

- (id)_recalculatedUserVisibleHDRChromaModes
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDisplayModeFacade userVisibleSortedDisplayModes](self, "userVisibleSortedDisplayModes"));
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v23 = 0LL;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v4 currentDisplayMode]);
        unsigned int v12 = objc_msgSend(v10, "tvs_isEqualResolutionAndRefreshRate:", v11);

        if (v12 && [v10 dynamicRange] == (id)538423556)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v3, "lastObject"));
          unsigned int v14 = [v13 isEqual:v10];

          if (v14) {
            ++v23;
          }
          else {
            -[NSMutableArray addObject:](v3, "addObject:", v10);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v7);

    if (v23 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000F9BA0(v23, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  else
  {
  }

  return v3;
}

- (id)_recalculatedUnverifiedModes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentDisplayMode]);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v32 = 0LL;
  v33[0] = &v32;
  v33[1] = 0x2020000000LL;
  v33[2] = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDisplayModeFacade userVisibleSortedDisplayModes](self, "userVisibleSortedDisplayModes"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100091C18;
  v27[3] = &unk_100192728;
  id v7 = v4;
  id v28 = v7;
  id v8 = v3;
  id v29 = v8;
  v9 = v5;
  uint64_t v30 = v9;
  uint64_t v31 = &v32;
  -[TVSettingsDisplayModeFacade _enumerateValidColorModesFromSortedModes:existingFiltering:withBlock:]( self,  "_enumerateValidColorModesFromSortedModes:existingFiltering:withBlock:",  v6,  0LL,  v27);

  if (*(void *)(v33[0] + 24LL) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1000F9C0C((uint64_t)v33, v10, v11, v12, v13, v14, v15, v16);
  }
  if (_os_feature_enabled_impl("PineBoard", "quamash")
    && [v8 displaySupportsQMS]
    && -[TVSettingsDisplayModeFacade shouldModeSwitchForFrameRate](self, "shouldModeSwitchForFrameRate")
    && -[TVSettingsDisplayModeFacade shouldUseQMSForFrameRateSwitching](self, "shouldUseQMSForFrameRateSwitching"))
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[PBSDisplayModeSet subsetRequiringVerificationByState:]( self->_bestNearbyModeSetForQMS,  "subsetRequiringVerificationByState:",  v8));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 sortedModes]);

    if ([v18 count])
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100091D08;
      v25[3] = &unk_100192750;
      v9 = v9;
      __int128 v26 = v9;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v25));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 filteredArrayUsingPredicate:v19]);

      if ([v20 count])
      {
        -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v20);
        uint64_t v21 = objc_claimAutoreleasedReturnValue( -[TVSettingsDisplayModeFacade _sortedDisplayModesForUserPresentation:]( self,  "_sortedDisplayModesForUserPresentation:",  v9));

        v9 = (NSMutableArray *)v21;
      }
    }
  }

  unsigned __int8 v22 = v30;
  uint64_t v23 = v9;

  _Block_object_dispose(&v32, 8);
  return v23;
}

- (id)_recalculateBestQMSModeSet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  if ([v2 displaySupportsQMS])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentDisplayMode]);
    objc_super v4 = (PBSDisplayModeSet *)objc_claimAutoreleasedReturnValue( +[PBSDisplayModeSet bestQMSCompatibilityModeSetNearMode:usingState:]( &OBJC_CLASS___PBSDisplayModeSet,  "bestQMSCompatibilityModeSetNearMode:usingState:",  v3,  v2));
  }

  else
  {
    objc_super v4 = -[PBSDisplayModeSet initWithCriteria:modes:]( objc_alloc(&OBJC_CLASS___PBSDisplayModeSet),  "initWithCriteria:modes:",  127LL,  &__NSArray0__struct);
  }

  return v4;
}

- (PBSDisplayMode)bestNearbyModeForQMS
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentDisplayMode]);

  else {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSDisplayModeSet closestModeToMode:](self->_bestNearbyModeSetForQMS, "closestModeToMode:", v4));
  }

  return (PBSDisplayMode *)v5;
}

- (id)qmsUnverifiedDisplayModes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBSDisplayModeSet subsetRequiringVerificationByState:]( self->_bestNearbyModeSetForQMS,  "subsetRequiringVerificationByState:",  v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedModes]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsDisplayModeFacade _sortedDisplayModesForUserPresentation:]( self,  "_sortedDisplayModesForUserPresentation:",  v5));

  return v6;
}

- (void)setShouldModeSwitchForDynamicRange:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  [v4 enableModeSwitchingForDynamicRange:v3];
}

- (void)setPreferredDynamicRange:(unint64_t)a3
{
  -[TVSettingsDisplayModeFacade setShouldModeSwitchForDynamicRange:]( self,  "setShouldModeSwitchForDynamicRange:",  a3 != 0);
}

- (unint64_t)preferredDynamicRange
{
  if (-[TVSettingsDisplayModeFacade shouldModeSwitchForDynamicRange](self, "shouldModeSwitchForDynamicRange")) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

- (TSKMappingFormatter)dynamicRangeOptionFormatter
{
  uint64_t v2 = TSKLocString(@"AVNativeModeSwitchingMatchVideoDynamicRangeOff");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v9[0] = v3;
  uint64_t v4 = TSKLocString(@"AVNativeModeSwitchingMatchVideoDynamicRangeOn");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  id v7 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AEFE0,  v6);
  return v7;
}

- (TSKMappingFormatter)dynamicRangeDescriptionFormatter
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentDisplayMode]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSDisplayManager dynamicRangeColorFormatter]( &OBJC_CLASS___PBSDisplayManager,  "dynamicRangeColorFormatter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForObjectValue:v3]);

  uint64_t v6 = TSKLocString(@"AVNativeModeSwitchingMatchVideoDynamicRangeDescriptionOff");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v5));
  uint64_t v9 = TSKLocString(@"AVNativeModeSwitchingMatchVideoDynamicRangeDescriptionAny");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v5, v8));
  v15[1] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));

  uint64_t v13 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AEFF8,  v12);
  return v13;
}

- (NSArray)dynamicRangeOptions
{
  return (NSArray *)&off_1001AF010;
}

- (void)setShouldModeSwitchForFrameRate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  [v4 enableModeSwitchingForFrameRate:v3];
}

- (void)setShouldUseQMSForFrameRateSwitching:(BOOL)a3
{
  if (self->_shouldUseQMSForFrameRateSwitching != a3)
  {
    BOOL v3 = a3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    [v4 enableQMSForFrameRateSwitching:v3];

    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3));
    +[TVCSMetrics reportChangeFor:toValue:](&OBJC_CLASS___TVCSMetrics, "reportChangeFor:toValue:", 10LL, v5);
  }

- (void)setHdr10PlusEnabled:(BOOL)a3
{
  if (self->_hdr10PlusEnabled != a3)
  {
    BOOL v3 = a3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    [v4 enableHDR10PlusMetadata:v3];

    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3));
    +[TVCSMetrics reportChangeFor:toValue:](&OBJC_CLASS___TVCSMetrics, "reportChangeFor:toValue:", 12LL, v5);
  }

- (void)setPreferredFrameRate:(unint64_t)a3
{
  -[TVSettingsDisplayModeFacade setShouldModeSwitchForFrameRate:](self, "setShouldModeSwitchForFrameRate:", a3 != 0);
}

- (unint64_t)preferredFrameRate
{
  if (-[TVSettingsDisplayModeFacade shouldModeSwitchForFrameRate](self, "shouldModeSwitchForFrameRate")) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

- (TSKMappingFormatter)frameRateOptionFormatter
{
  uint64_t v2 = TSKLocString(@"AVNativeModeSwitchingMatchVideoFrameRateOff");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v9[0] = v3;
  uint64_t v4 = TSKLocString(@"AVNativeModeSwitchingMatchVideoFrameRateOn");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[1] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  id v7 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AF028,  v6);
  return v7;
}

- (TSKMappingFormatter)frameRateDescriptionFormatter
{
  uint64_t v2 = TSKLocString(@"AVNativeModeSwitchingMatchVideoFrameRateDescriptionOff");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v9[0] = v3;
  uint64_t v4 = TSKLocString(@"AVNativeModeSwitchingMatchVideoFrameRateDescriptionAny");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[1] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  id v7 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AF040,  v6);
  return v7;
}

- (NSArray)frameRateOptions
{
  return (NSArray *)&off_1001AF058;
}

- (NSString)preferredDisplaySizeIdentifier
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  [v2 softwareDisplaySize];

  uint64_t v4 = PBSDisplaySizeIdentifierFromSize(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "A custom softwareDisplaySize has been set, returning Automatic for settings",  v9,  2u);
    }

    uint64_t v6 = (void *)PBSDisplaySizeIdentifierAutomatic;
  }

  id v7 = v6;

  return (NSString *)v7;
}

- (void)setPreferredDisplaySizeIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = PBSDisplaySizeFromIdentifier();
  double v6 = v5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Setting setPreferredDisplaySizeIdentifier to '%{public}@'",  (uint8_t *)&v8,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  objc_msgSend(v7, "updateSoftwareDisplaySize:", v4, v6);
}

- (TSKMappingFormatter)preferredDisplaySizeOptionFormatter
{
  uint64_t v2 = PBSAllDisplaySizeIdentifiers(self, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_map:", &stru_100192790));
  double v5 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  v3,  v4);

  return v5;
}

- (TSKMappingFormatter)preferredDisplaySizeDescriptionFormatter
{
  uint64_t v2 = PBSAllDisplaySizeIdentifiers(self, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_map:", &stru_1001927B0));
  double v5 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  v3,  v4);

  return v5;
}

- (BOOL)shouldShowDisplayAssistant
{
  unsigned int v3 = +[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR");
  if (v3)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDisplayModeFacade userVisibleSortedDisplayModes](self, "userVisibleSortedDisplayModes"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    char v6 = PBSDisplayResolutionIs4K([v5 resolution]);

    LOBYTE(v3) = v6;
  }

  return v3;
}

- (TVSettingsDisplayAssistantActionInfo)displayAssistantActionInfo
{
  if (-[TVSettingsDisplayModeFacade shouldShowDisplayAssistant](self, "shouldShowDisplayAssistant"))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSDisplayAssistantPresentationRequest upgradeAttemptRequestFromSource:]( &OBJC_CLASS___PBSDisplayAssistantPresentationRequest,  "upgradeAttemptRequestFromSource:",  1LL));
    unsigned int v3 = v2;
    if (v2)
    {
      id v4 = [v2 kind];
      if (v4 == (id)1)
      {
        double v5 = objc_alloc_init(&OBJC_CLASS___TVSettingsDisplayAssistantActionInfo);
        uint64_t v9 = TSKLocString(@"AVEnableHDR");
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        -[TVSettingsDisplayAssistantActionInfo setLocalizedTitle:](v5, "setLocalizedTitle:", v10);

        int v8 = @"AVEnableHDRDescription";
        goto LABEL_9;
      }

      if (v4 == (id)2)
      {
        double v5 = objc_alloc_init(&OBJC_CLASS___TVSettingsDisplayAssistantActionInfo);
        uint64_t v6 = TSKLocString(@"AVEnableDolbyVision");
        id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        -[TVSettingsDisplayAssistantActionInfo setLocalizedTitle:](v5, "setLocalizedTitle:", v7);

        int v8 = @"AVEnableDolbyVisionDescription";
LABEL_9:
        uint64_t v11 = TSKLocString(v8);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        -[TVSettingsDisplayAssistantActionInfo setLocalizedDescription:](v5, "setLocalizedDescription:", v12);

        -[TVSettingsDisplayAssistantActionInfo setPresentationRequest:](v5, "setPresentationRequest:", v3);
        goto LABEL_10;
      }
    }

    double v5 = 0LL;
LABEL_10:

    return v5;
  }

  double v5 = 0LL;
  return v5;
}

- (void)_enumerateValidColorModesFromSortedModes:(id)a3 existingFiltering:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v33 = (void (**)(void))a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentDisplayMode]);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100092C70;
  v35[3] = &unk_1001927D8;
  id v29 = v10;
  id v36 = v29;
  id v12 = v8;
  id v37 = v12;
  uint64_t v32 = objc_retainBlock(v35);
  uint64_t v13 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v30 = v9;
  if (v9) {
    uint64_t v14 = v9;
  }
  else {
    uint64_t v14 = &__NSDictionary0__struct;
  }
  uint64_t v15 = -[NSMutableDictionary initWithDictionary:](v13, "initWithDictionary:", v14);
  if ([v12 count])
  {
    unint64_t v16 = 0LL;
    uint64_t v34 = v15;
    do
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v16]);
      unsigned int v18 = -[NSMutableDictionary tvs_foundColorModeForDisplayMode:]( v15,  "tvs_foundColorModeForDisplayMode:",  v17);
      unsigned int v19 = v18;
      int v20 = v18 & 0xFFFFFF;
      if ((v18 & 1) != 0)
      {
        int IsDolbyVision = 0;
        unsigned __int8 v22 = v18;
        if ((v18 & 0x100) != 0)
        {
LABEL_8:
          unsigned __int8 v23 = BYTE1(v19);
          if ((v20 & 0x10000) != 0) {
            goto LABEL_9;
          }
          goto LABEL_18;
        }
      }

      else
      {
        int IsDolbyVision = PBSDynamicRangeIsDolbyVision([v17 dynamicRange]);
        unsigned __int8 v22 = IsDolbyVision;
        if ((v20 & 0x100) != 0) {
          goto LABEL_8;
        }
      }

      if ([v11 dynamicRange] == (id)538423556
        && objc_msgSend(v17, "tvs_isEqualResolutionAndRefreshRate:", v11))
      {
        id v31 = [v17 HDR10ChromaSubsampling];
        if (v31 != [v11 HDR10ChromaSubsampling]) {
          goto LABEL_14;
        }
      }

      else if ([v17 dynamicRange] != (id)538423556)
      {
LABEL_14:
        int v25 = 0;
        goto LABEL_17;
      }

      int v25 = ((uint64_t (*)(void *, void *, unint64_t))v32[2])(v32, v17, v16);
LABEL_17:
      unsigned __int8 v23 = v25;
      IsDolbyVision |= v25;
      if ((v20 & 0x10000) != 0)
      {
LABEL_9:
        uint64_t v24 = BYTE2(v19);
        uint64_t v15 = v34;
        goto LABEL_28;
      }

- (void)updateDisplayManagerWithDisplayMode:(id)a3 reason:(id)a4 requestConfiguration:(id)a5 completion:(id)a6
{
  id v9 = (void (**)(id, id))a5;
  uint64_t v10 = (void (**)(id, void))a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentDisplayMode]);
  unsigned int v15 = [v12 isEqual:v14];

  unint64_t v16 = -[PBSDisplayManagerUpdateRequest initWithDisplayMode:reason:]( objc_alloc(&OBJC_CLASS___PBSDisplayManagerUpdateRequest),  "initWithDisplayMode:reason:",  v12,  v11);
  if (v9) {
    v9[2](v9, v16);
  }
  if (v15
    && (-[PBSDisplayManagerUpdateRequest treatDisplayModeAsFallback](v16, "treatDisplayModeAsFallback") & 1) == 0)
  {
    if (v10) {
      v10[2](v10, 0LL);
    }
  }

  else
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100092EC0;
    v18[3] = &unk_100192800;
    unsigned int v19 = v10;
    [v17 updateDisplayManagerWithRequest:v16 completion:v18];
  }
}

- (void)updateDisplayManagerWithDisplayMode:(id)a3 reason:(id)a4 completion:(id)a5
{
}

- (void)resetVideoSettingsWithCompletion:(id)a3
{
  id v4 = a3;
  -[TVSettingsDisplayModeFacade setShouldModeSwitchForDynamicRange:](self, "setShouldModeSwitchForDynamicRange:", 0LL);
  -[TVSettingsDisplayModeFacade setShouldModeSwitchForFrameRate:](self, "setShouldModeSwitchForFrameRate:", 0LL);
  -[TVSettingsDisplayModeFacade setShouldUseQMSForFrameRateSwitching:]( self,  "setShouldUseQMSForFrameRateSwitching:",  1LL);
  -[TVSettingsDisplayModeFacade setHdr10PlusEnabled:](self, "setHdr10PlusEnabled:", 1LL);
  -[TVSettingsDisplayModeFacade setPreferredDisplaySizeIdentifier:]( self,  "setPreferredDisplaySizeIdentifier:",  PBSDisplaySizeIdentifierAutomatic);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 fallbackDisplayMode]);
  -[TVSettingsDisplayModeFacade updateDisplayManagerWithDisplayMode:reason:requestConfiguration:completion:]( self,  "updateDisplayManagerWithDisplayMode:reason:requestConfiguration:completion:",  v5,  @"Reset video settings",  &stru_100192840,  v4);
}

- (void)presentUpgradeAttemptDisplayAssistant
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDisplayModeFacade displayAssistantActionInfo](self, "displayAssistantActionInfo"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 presentationRequest]);

  if (v4)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    [v3 presentDisplayAssistantWithRequest:v4 dismissHandler:0];
  }
}

- (void)presentCableCheckDisplayAssistant
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[PBSDisplayAssistantPresentationRequest cableCheckRequestFromSource:]( &OBJC_CLASS___PBSDisplayAssistantPresentationRequest,  "cableCheckRequestFromSource:",  1LL));
  if (v3)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    [v2 presentDisplayAssistantWithRequest:v3 dismissHandler:0];
  }
}

- (id)_sortedDisplayModesForUserPresentation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v6 = (NSMutableArray *)v4;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v37,  v41,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        if (PBSDisplayResolutionIs4K([v11 resolution]))
        {
          if (([v11 isVirtual] & 1) == 0)
          {
            char v12 = 1;
            uint64_t v13 = v6;
            goto LABEL_13;
          }
        }

        else
        {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v37,  v41,  16LL);
    }

    while (v8);
  }

  char v12 = 0;
  uint64_t v13 = v5;
LABEL_13:

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v13, "sortedArrayUsingComparator:", &stru_100192880));
  unsigned int v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100093548;
  void v33[3] = &unk_1001928A8;
  char v36 = v12;
  uint64_t v17 = v15;
  uint64_t v34 = v17;
  unsigned int v18 = v16;
  char v35 = v18;
  -[TVSettingsDisplayModeFacade _enumerateValidColorModesFromSortedModes:existingFiltering:withBlock:]( self,  "_enumerateValidColorModesFromSortedModes:existingFiltering:withBlock:",  v14,  0LL,  v33);
  unsigned int v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10009362C;
  v30[3] = &unk_1001928D0;
  id v31 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v18);
  int v20 = v19;
  uint64_t v32 = v20;
  uint64_t v21 = v31;
  -[TVSettingsDisplayModeFacade _enumerateValidColorModesFromSortedModes:existingFiltering:withBlock:]( self,  "_enumerateValidColorModesFromSortedModes:existingFiltering:withBlock:",  v14,  v17,  v30);
  if (!-[NSMutableArray count](v18, "count"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No common resolution modes found, putting all resolutions in the first pane.",  buf,  2u);
    }

    unsigned __int8 v22 = (NSMutableArray *)-[NSMutableArray copy](v20, "copy");

    -[NSMutableArray removeAllObjects](v20, "removeAllObjects");
    unsigned int v18 = v22;
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100093678;
  v26[3] = &unk_1001928F8;
  id v27 = v18;
  unsigned int v28 = self;
  unsigned __int8 v23 = v18;
  uint64_t v24 = objc_retainBlock(v26);
  ((void (*)(void *, NSMutableArray *))v24[2])(v24, v23);
  ((void (*)(void *, NSMutableArray *))v24[2])(v24, v20);

  return v14;
}

- (void)_reloadDataFromCache
{
  self->_shouldModeSwitchForDynamicRange = self->_cachedShouldModeSwitchForDynamicRange;
  -[TVSettingsDisplayModeFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"shouldModeSwitchForDynamicRange");
  -[TVSettingsDisplayModeFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"shouldModeSwitchForFrameRate");
  self->_shouldModeSwitchForFrameRate = self->_cachedShouldModeSwitchForFrameRate;
  -[TVSettingsDisplayModeFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"shouldModeSwitchForFrameRate");
  -[TVSettingsDisplayModeFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"shouldUseQMSForFrameRateSwitching");
  self->_shouldUseQMSForFrameRateSwitching = self->_cachedShouldUseQMSForFrameRateSwitching;
  -[TVSettingsDisplayModeFacade didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"shouldUseQMSForFrameRateSwitching");
  -[TVSettingsDisplayModeFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"hdr10PlusEnabled");
  self->_hdr10PlusEnabled = self->_cachedHDR10PlusEnabled;
  -[TVSettingsDisplayModeFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"hdr10PlusEnabled");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsDisplayModeFacade _sortedDisplayModesForUserPresentation:]( self,  "_sortedDisplayModesForUserPresentation:",  self->_cachedSortedDisplayModes));
  -[TVSettingsDisplayModeFacade setUserVisibleSortedDisplayModes:](self, "setUserVisibleSortedDisplayModes:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsDisplayModeFacade _recalculatedUserVisibleSDRColorMappingModes]( self,  "_recalculatedUserVisibleSDRColorMappingModes"));
  -[TVSettingsDisplayModeFacade setUserVisibleSDRColorMappingModes:](self, "setUserVisibleSDRColorMappingModes:", v4);

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsDisplayModeFacade _recalculatedUserVisibleSDRChromaModes]( self,  "_recalculatedUserVisibleSDRChromaModes"));
  -[TVSettingsDisplayModeFacade setUserVisibleSDRChromaModes:](self, "setUserVisibleSDRChromaModes:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsDisplayModeFacade _recalculatedUserVisibleHDRChromaModes]( self,  "_recalculatedUserVisibleHDRChromaModes"));
  -[TVSettingsDisplayModeFacade setUserVisibleHDRChromaModes:](self, "setUserVisibleHDRChromaModes:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDisplayModeFacade _recalculateBestQMSModeSet](self, "_recalculateBestQMSModeSet"));
  -[TVSettingsDisplayModeFacade setBestNearbyModeSetForQMS:](self, "setBestNearbyModeSetForQMS:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsDisplayModeFacade _recalculatedUnverifiedModes](self, "_recalculatedUnverifiedModes"));
  -[TVSettingsDisplayModeFacade setUnverifiedDisplayModes:](self, "setUnverifiedDisplayModes:", v8);

  -[TVSettingsDisplayModeFacade setPreferredDisplaySizeIdentifier:]( self,  "setPreferredDisplaySizeIdentifier:",  self->_cachedDisplaySizeIdentifier);
}

- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4
{
  id v44 = a3;
  int cachedCanHandleHighBandwidthModes = self->_cachedCanHandleHighBandwidthModes;
  unsigned int v6 = [v44 canHandleHighBandwidthModes];
  int cachedShouldModeSwitchForDynamicRange = self->_cachedShouldModeSwitchForDynamicRange;
  unsigned int v8 = [v44 shouldModeSwitchForDynamicRange];
  int cachedShouldModeSwitchForFrameRate = self->_cachedShouldModeSwitchForFrameRate;
  unsigned int v10 = [v44 shouldModeSwitchForFrameRate];
  cachedCurrentDisplayMode = self->_cachedCurrentDisplayMode;
  char v12 = (void *)objc_claimAutoreleasedReturnValue([v44 currentDisplayMode]);
  unsigned int v13 = -[PBSDisplayMode isEqual:](cachedCurrentDisplayMode, "isEqual:", v12);

  cachedSortedDisplayModes = self->_cachedSortedDisplayModes;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v44 sortedDisplayModes]);
  unsigned int v43 = -[NSArray isEqualToArray:](cachedSortedDisplayModes, "isEqualToArray:", v15);

  int cachedShouldUseQMSForFrameRateSwitching = self->_cachedShouldUseQMSForFrameRateSwitching;
  unsigned int v16 = [v44 shouldUseQMSForFrameRateSwitching];
  int cachedHDR10PlusEnabled = self->_cachedHDR10PlusEnabled;
  unsigned int v42 = v16;
  unsigned int v40 = [v44 hdr10PlusMetadataEnabled];
  uint64_t v17 = PBSDisplaySizeIdentifierFromSize([v44 softwareDisplaySize]);
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  unsigned int v39 = -[NSString isEqual:](self->_cachedDisplaySizeIdentifier, "isEqual:", v18);
  unsigned int v37 = v13;
  if ((v13 & 1) == 0)
  {
    unsigned int v19 = v6;
    int v20 = cachedCanHandleHighBandwidthModes;
    unsigned int v21 = v10;
    unsigned int v22 = v8;
    int v23 = cachedShouldModeSwitchForFrameRate;
    int v24 = cachedShouldModeSwitchForDynamicRange;
    int v25 = (void *)objc_claimAutoreleasedReturnValue([v44 currentDisplayMode]);
    id v26 = (PBSDisplayMode *)[v25 copy];
    id v27 = self->_cachedCurrentDisplayMode;
    self->_cachedCurrentDisplayMode = v26;

    int cachedShouldModeSwitchForDynamicRange = v24;
    int cachedShouldModeSwitchForFrameRate = v23;
    unsigned int v8 = v22;
    unsigned int v10 = v21;
    int cachedCanHandleHighBandwidthModes = v20;
    unsigned int v6 = v19;
  }

  if ((v43 & 1) == 0)
  {
    unsigned int v28 = v6;
    int v29 = cachedCanHandleHighBandwidthModes;
    unsigned int v30 = v10;
    unsigned int v31 = v8;
    int v32 = cachedShouldModeSwitchForFrameRate;
    int v33 = cachedShouldModeSwitchForDynamicRange;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v44 sortedDisplayModes]);
    char v35 = (NSArray *)[v34 copy];
    char v36 = self->_cachedSortedDisplayModes;
    self->_cachedSortedDisplayModes = v35;

    int cachedShouldModeSwitchForDynamicRange = v33;
    int cachedShouldModeSwitchForFrameRate = v32;
    unsigned int v8 = v31;
    unsigned int v10 = v30;
    int cachedCanHandleHighBandwidthModes = v29;
    unsigned int v6 = v28;
  }

  if (cachedCanHandleHighBandwidthModes != v6) {
    self->_int cachedCanHandleHighBandwidthModes = [v44 canHandleHighBandwidthModes];
  }
  if (cachedShouldModeSwitchForDynamicRange != v8) {
    self->_int cachedShouldModeSwitchForDynamicRange = [v44 shouldModeSwitchForDynamicRange];
  }
  if (cachedShouldModeSwitchForFrameRate != v10) {
    self->_int cachedShouldModeSwitchForFrameRate = [v44 shouldModeSwitchForFrameRate];
  }
  if (cachedShouldUseQMSForFrameRateSwitching != v42) {
    self->_int cachedShouldUseQMSForFrameRateSwitching = [v44 shouldUseQMSForFrameRateSwitching];
  }
  if (cachedHDR10PlusEnabled != v40) {
    self->_int cachedHDR10PlusEnabled = [v44 hdr10PlusMetadataEnabled];
  }
  if ((v39 & 1) == 0) {
    objc_storeStrong((id *)&self->_cachedDisplaySizeIdentifier, v18);
  }
  if (cachedCanHandleHighBandwidthModes != v6
    || ((v37 ^ 1) & 1) != 0
    || ((v43 ^ 1) & 1) != 0
    || cachedShouldModeSwitchForDynamicRange != v8
    || cachedShouldModeSwitchForFrameRate != v10
    || cachedShouldUseQMSForFrameRateSwitching != v42
    || cachedHDR10PlusEnabled != v40
    || v39 != 1)
  {
    -[TVSettingsDisplayModeFacade _reloadDataFromCache](self, "_reloadDataFromCache");
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector("selectedSDRColorMappingMode");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) != 0) {
    goto LABEL_11;
  }
  unsigned int v8 = NSStringFromSelector("selectedSDRChromaMode");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  unsigned __int8 v10 = [v4 isEqualToString:v9];

  if ((v10 & 1) != 0) {
    goto LABEL_11;
  }
  id v11 = NSStringFromSelector("selectedHDRChromaMode");
  char v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned __int8 v13 = [v4 isEqualToString:v12];

  if ((v13 & 1) != 0) {
    goto LABEL_11;
  }
  uint64_t v14 = NSStringFromSelector("shouldModeSwitchForDynamicRange");
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  unsigned __int8 v16 = [v4 isEqualToString:v15];

  if ((v16 & 1) != 0) {
    goto LABEL_11;
  }
  uint64_t v17 = NSStringFromSelector("shouldModeSwitchForFrameRate");
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  unsigned __int8 v19 = [v4 isEqualToString:v18];

  if ((v19 & 1) != 0) {
    goto LABEL_11;
  }
  int v20 = NSStringFromSelector("shouldUseQMSForFrameRateSwitching");
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  unsigned __int8 v22 = [v4 isEqualToString:v21];

  if ((v22 & 1) != 0) {
    goto LABEL_11;
  }
  int v23 = NSStringFromSelector("bestNearbyModeSetForQMS");
  int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  unsigned __int8 v25 = [v4 isEqualToString:v24];

  if ((v25 & 1) != 0) {
    goto LABEL_11;
  }
  id v26 = NSStringFromSelector("bestNearbyModeForQMS");
  id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  unsigned __int8 v28 = [v4 isEqualToString:v27];

  if ((v28 & 1) != 0) {
    goto LABEL_11;
  }
  int v29 = NSStringFromSelector("qmsUnverifiedDisplayModes");
  unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  unsigned __int8 v31 = [v4 isEqualToString:v30];

  if ((v31 & 1) != 0
    || (int v32 = NSStringFromSelector("preferredDisplaySizeIdentifier"),
        int v33 = (void *)objc_claimAutoreleasedReturnValue(v32),
        unsigned __int8 v34 = [v4 isEqualToString:v33],
        v33,
        (v34 & 1) != 0))
  {
LABEL_11:
    unsigned __int8 v35 = 0;
  }

  else
  {
    v37.receiver = a1;
    v37.super_class = (Class)&OBJC_METACLASS___TVSettingsDisplayModeFacade;
    unsigned __int8 v35 = objc_msgSendSuper2(&v37, "automaticallyNotifiesObserversForKey:", v4);
  }

  return v35;
}

+ (id)keyPathsForValuesAffectingBestNearbyModeForQMS
{
  uint64_t v2 = NSStringFromSelector("bestNearbyModeSetForQMS");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));

  return v4;
}

+ (id)keyPathsForValuesAffectingQmsUnverifiedDisplayModes
{
  uint64_t v2 = NSStringFromSelector("bestNearbyModeSetForQMS");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));

  return v4;
}

- (PBSDisplayMode)selectedSDRColorMappingMode
{
  return self->_selectedSDRColorMappingMode;
}

- (NSArray)userVisibleSDRColorMappingModes
{
  return self->_userVisibleSDRColorMappingModes;
}

- (void)setUserVisibleSDRColorMappingModes:(id)a3
{
}

- (PBSDisplayMode)selectedSDRChromaMode
{
  return self->_selectedSDRChromaMode;
}

- (NSArray)userVisibleSDRChromaModes
{
  return self->_userVisibleSDRChromaModes;
}

- (void)setUserVisibleSDRChromaModes:(id)a3
{
}

- (PBSDisplayMode)selectedHDRChromaMode
{
  return self->_selectedHDRChromaMode;
}

- (NSArray)userVisibleHDRChromaModes
{
  return self->_userVisibleHDRChromaModes;
}

- (void)setUserVisibleHDRChromaModes:(id)a3
{
}

- (NSArray)commonResolutionsModes60Hz
{
  return self->_commonResolutionsModes60Hz;
}

- (void)setCommonResolutionsModes60Hz:(id)a3
{
}

- (NSArray)commonResolutionsModes50Hz
{
  return self->_commonResolutionsModes50Hz;
}

- (void)setCommonResolutionsModes50Hz:(id)a3
{
}

- (NSArray)commonResolutionsModesOthers
{
  return self->_commonResolutionsModesOthers;
}

- (void)setCommonResolutionsModesOthers:(id)a3
{
}

- (NSArray)otherResolutionsModes60Hz
{
  return self->_otherResolutionsModes60Hz;
}

- (void)setOtherResolutionsModes60Hz:(id)a3
{
}

- (NSArray)otherResolutionsModesExact60Hz
{
  return self->_otherResolutionsModesExact60Hz;
}

- (void)setOtherResolutionsModesExact60Hz:(id)a3
{
}

- (NSArray)otherResolutionsModes30Hz
{
  return self->_otherResolutionsModes30Hz;
}

- (void)setOtherResolutionsModes30Hz:(id)a3
{
}

- (NSArray)otherResolutionsModesExact30Hz
{
  return self->_otherResolutionsModesExact30Hz;
}

- (void)setOtherResolutionsModesExact30Hz:(id)a3
{
}

- (NSArray)otherResolutionsModes24Hz
{
  return self->_otherResolutionsModes24Hz;
}

- (void)setOtherResolutionsModes24Hz:(id)a3
{
}

- (NSArray)otherResolutionsModesExact24Hz
{
  return self->_otherResolutionsModesExact24Hz;
}

- (void)setOtherResolutionsModesExact24Hz:(id)a3
{
}

- (NSArray)otherResolutionsModes50Hz
{
  return self->_otherResolutionsModes50Hz;
}

- (void)setOtherResolutionsModes50Hz:(id)a3
{
}

- (NSArray)otherResolutionsModes25Hz
{
  return self->_otherResolutionsModes25Hz;
}

- (void)setOtherResolutionsModes25Hz:(id)a3
{
}

- (NSArray)otherResolutionsModesOthers
{
  return self->_otherResolutionsModesOthers;
}

- (void)setOtherResolutionsModesOthers:(id)a3
{
}

- (NSArray)userVisibleSortedDisplayModes
{
  return self->_userVisibleSortedDisplayModes;
}

- (void)setUserVisibleSortedDisplayModes:(id)a3
{
}

- (NSArray)unverifiedDisplayModes
{
  return self->_unverifiedDisplayModes;
}

- (void)setUnverifiedDisplayModes:(id)a3
{
}

- (void)setDynamicRangeOptionFormatter:(id)a3
{
}

- (void)setDynamicRangeDescriptionFormatter:(id)a3
{
}

- (void)setFrameRateOptionFormatter:(id)a3
{
}

- (void)setFrameRateDescriptionFormatter:(id)a3
{
}

- (void)setPreferredDisplaySizeOptionFormatter:(id)a3
{
}

- (void)setPreferredDisplaySizeDescriptionFormatter:(id)a3
{
}

- (NSString)localizedCurrentSettings
{
  return self->_localizedCurrentSettings;
}

- (BOOL)shouldModeSwitchForDynamicRange
{
  return self->_shouldModeSwitchForDynamicRange;
}

- (BOOL)shouldModeSwitchForFrameRate
{
  return self->_shouldModeSwitchForFrameRate;
}

- (BOOL)shouldUseQMSForFrameRateSwitching
{
  return self->_shouldUseQMSForFrameRateSwitching;
}

- (PBSDisplayModeSet)bestNearbyModeSetForQMS
{
  return self->_bestNearbyModeSetForQMS;
}

- (void)setBestNearbyModeSetForQMS:(id)a3
{
}

- (BOOL)hdr10PlusEnabled
{
  return self->_hdr10PlusEnabled;
}

- (void).cxx_destruct
{
}

@end