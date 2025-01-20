@interface AXTVSpeechVoicesForLanguageViewController
- (AXLangMap)languageMap;
- (AXSpeechSettingsModelController)speechModelController;
- (AXTVSpeechVoicesForLanguageViewController)initWithLanguageMap:(id)a3 speechModelController:(id)a4;
- (NSString)languageID;
- (id)_createVoiceFootprints;
- (id)_selectedVoiceId;
- (id)loadSettingGroups;
- (id)voiceVariantChangedToken;
- (void)dealloc;
- (void)resourceCacheDidReceiveUpdate;
- (void)setLanguageID:(id)a3;
- (void)setLanguageMap:(id)a3;
- (void)setSpeechModelController:(id)a3;
- (void)setVoiceVariantChangedToken:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXTVSpeechVoicesForLanguageViewController

- (AXTVSpeechVoicesForLanguageViewController)initWithLanguageMap:(id)a3 speechModelController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___AXTVSpeechVoicesForLanguageViewController;
  v8 = -[AXTVSpeechVoicesForLanguageViewController init](&v21, "init");
  v9 = v8;
  if (v8)
  {
    -[AXTVSpeechVoicesForLanguageViewController setLanguageMap:](v8, "setLanguageMap:", v6);
    -[AXTVSpeechVoicesForLanguageViewController setSpeechModelController:](v9, "setSpeechModelController:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoicesForLanguageViewController languageMap](v9, "languageMap"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 generalLanguageID]);

    uint64_t v12 = AXLanguageConvertToCanonicalForm(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dialectForLanguageID:v13]);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 langMap]);
    -[AXTVSpeechVoicesForLanguageViewController setLanguageMap:](v9, "setLanguageMap:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoicesForLanguageViewController languageMap](v9, "languageMap"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 defaultDialect]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 languageNameInCurrentLocale]);
    -[AXTVSpeechVoicesForLanguageViewController setTitle:](v9, "setTitle:", v19);
  }

  return v9;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoicesForLanguageViewController voiceVariantChangedToken](self, "voiceVariantChangedToken"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSpeechVoicesForLanguageViewController voiceVariantChangedToken]( self,  "voiceVariantChangedToken"));
    [v4 removeObserver:v5];

    -[AXTVSpeechVoicesForLanguageViewController setVoiceVariantChangedToken:](self, "setVoiceVariantChangedToken:", 0LL);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXTVSpeechVoicesForLanguageViewController;
  -[AXTVSpeechVoicesForLanguageViewController dealloc](&v7, "dealloc");
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVSpeechVoicesForLanguageViewController;
  -[AXTVSpeechVoicesForLanguageViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  [v3 addObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AXTVSpeechVoicesForLanguageViewController;
  -[AXTVSpeechVoicesForLanguageViewController viewWillAppear:](&v15, "viewWillAppear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoicesForLanguageViewController voiceVariantChangedToken](self, "voiceVariantChangedToken"));

  if (!v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v6 = AXTVVoiceVariantWasSelectedNotification;
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    v11 = sub_39CF8;
    uint64_t v12 = &unk_65A68;
    objc_copyWeak(&v13, &location);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 addObserverForName:v6 object:0 queue:v7 usingBlock:&v9]);
    -[AXTVSpeechVoicesForLanguageViewController setVoiceVariantChangedToken:]( self,  "setVoiceVariantChangedToken:",  v8,  v9,  v10,  v11,  v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  if (self->_needsRefreshFromResourceCacheUpdateOnNextViewWillAppear)
  {
    -[AXTVSpeechVoicesForLanguageViewController reloadSettings](self, "reloadSettings");
    self->_needsRefreshFromResourceCacheUpdateOnNextViewWillAppear = 0;
  }

- (id)loadSettingGroups
{
  id v47 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoicesForLanguageViewController _createVoiceFootprints](self, "_createVoiceFootprints"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoicesForLanguageViewController _selectedVoiceId](self, "_selectedVoiceId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  +[AXSpeechSettingsModelController partitionVoiceFootprints:intoStandardVoices:andNoveltyVoices:]( &OBJC_CLASS___AXSpeechSettingsModelController,  "partitionVoiceFootprints:intoStandardVoices:andNoveltyVoices:",  v45,  v3,  v46);
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id obj = v3;
  id v51 = [obj countByEnumeratingWithState:&v76 objects:v83 count:16];
  if (v51)
  {
    v57 = 0LL;
    v58 = 0LL;
    objc_super v4 = 0LL;
    id v49 = *(id *)v77;
    v54 = 0LL;
    do
    {
      v5 = 0LL;
      id v6 = v4;
      do
      {
        if (*(id *)v77 != v49) {
          objc_enumerationMutation(obj);
        }
        objc_super v7 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dialect]);
        unsigned __int8 v9 = [v8 isEqual:v57];

        if ((v9 & 1) == 0)
        {
          if (v54)
          {
            [v54 setSettingItems:v58];
            [v47 addObject:v54];
          }

          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 dialect]);
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 languageNameAndLocaleInCurrentLocale]);

          uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          uint64_t v13 = objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v11,  v12));

          uint64_t v14 = objc_claimAutoreleasedReturnValue([v7 dialect]);
          v57 = (void *)v14;
          v58 = (id *)v12;
          v54 = (void *)v13;
        }

        objc_initWeak(&location, self);
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472LL;
        v73[2] = sub_3A4B8;
        v73[3] = &unk_657E8;
        v73[4] = v7;
        objc_copyWeak(&v74, &location);
        objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v15,  0LL,  v7,  0LL,  v73));

        __int128 v71 = 0u;
        __int128 v72 = 0u;
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        v16 = (void *)objc_claimAutoreleasedReturnValue([v7 resources]);
        id v17 = [v16 countByEnumeratingWithState:&v69 objects:v82 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v70;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v70 != v18) {
                objc_enumerationMutation(v16);
              }
              unsigned int v21 = [v2 isEqualToString:v20];

              if (v21)
              {
                [v7 setIsSelected:1];
                [v4 setAccessoryTypes:2];
              }
            }

            id v17 = [v16 countByEnumeratingWithState:&v69 objects:v82 count:16];
          }

          while (v17);
        }

        [v58 addObject:v4];
        objc_destroyWeak(&v74);
        objc_destroyWeak(&location);
        v5 = (char *)v5 + 1;
        id v6 = v4;
      }

      while (v5 != v51);
      id v51 = [obj countByEnumeratingWithState:&v76 objects:v83 count:16];
    }

    while (v51);

    if (v54)
    {
      [v54 setSettingItems:v58];
      [v47 addObject:v54];
    }

    else
    {
      v54 = 0LL;
    }
  }

  else
  {

    v54 = 0LL;
    v57 = 0LL;
    v58 = 0LL;
    objc_super v4 = 0LL;
  }

  if ([v46 count])
  {
    v52 = (id *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

    id v29 = AXTVLocString(@"unified.speech.novelty.voices.group.title", v22, v23, v24, v25, v26, v27, v28, v43);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v30,  v52));

    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id v50 = v46;
    to = (id *)[v50 countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (to)
    {
      uint64_t v55 = *(void *)v66;
      do
      {
        v31 = 0LL;
        v32 = v4;
        do
        {
          if (*(void *)v66 != v55) {
            objc_enumerationMutation(v50);
          }
          v33 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)v31);
          objc_initWeak(&location, self);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 name]);
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472LL;
          v63[2] = sub_3A528;
          v63[3] = &unk_657E8;
          v63[4] = v33;
          objc_copyWeak(&v64, &location);
          objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v34,  0LL,  v33,  0LL,  v63));

          __int128 v61 = 0u;
          __int128 v62 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          v35 = (void *)objc_claimAutoreleasedReturnValue([v33 resources]);
          id v36 = [v35 countByEnumeratingWithState:&v59 objects:v80 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v60;
            do
            {
              for (j = 0LL; j != v36; j = (char *)j + 1)
              {
                if (*(void *)v60 != v37) {
                  objc_enumerationMutation(v35);
                }
                unsigned int v40 = [v2 isEqualToString:v39];

                if (v40)
                {
                  [v33 setIsSelected:1];
                  [v4 setAccessoryTypes:2];
                }
              }

              id v36 = [v35 countByEnumeratingWithState:&v59 objects:v80 count:16];
            }

            while (v36);
          }

          [v52 addObject:v4];
          objc_destroyWeak(&v64);
          objc_destroyWeak(&location);
          v31 = (id *)((char *)v31 + 1);
          v32 = v4;
        }

        while (v31 != to);
        to = (id *)[v50 countByEnumeratingWithState:&v65 objects:v81 count:16];
      }

      while (to);
    }

    [v44 setSettingItems:v52];
    [v47 addObject:v44];
  }

  else
  {
    v52 = v58;
    v44 = v54;
  }

  id v41 = v47;

  return v41;
}

- (id)_selectedVoiceId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoicesForLanguageViewController speechModelController](self, "speechModelController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectedVoiceIdentifierForSpeechSourceKey:AXSpeechSourceKeyVoiceOver]);

  return v3;
}

- (id)_createVoiceFootprints
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localeIdentifier]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoicesForLanguageViewController languageMap](self, "languageMap"));
  uint64_t v7 = AXSortedDialectsForDisplay(v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v13);
        uint64_t v15 = AXRuntimeCheck_VoiceOverSupportsNeuralVoices(v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSpeechVoicesForLanguageViewController _selectedVoiceId]( self,  "_selectedVoiceId",  (void)v18));
        AXAddVoiceFootprintsToArrayForDialect(v3, v14, v16, 0LL, v15);

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v11 = v10;
    }

    while (v10);
  }

  return v3;
}

- (void)resourceCacheDidReceiveUpdate
{
  uint64_t v3 = AXLogSpeechAssetDownload(self, a2);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "AXTVSpeechVoicesForLanguageViewController Did receive voice cache update",  v5,  2u);
  }

  self->_needsRefreshFromResourceCacheUpdateOnNextViewWillAppear = 1;
}

- (AXSpeechSettingsModelController)speechModelController
{
  return self->_speechModelController;
}

- (void)setSpeechModelController:(id)a3
{
}

- (AXLangMap)languageMap
{
  return self->_languageMap;
}

- (void)setLanguageMap:(id)a3
{
}

- (NSString)languageID
{
  return self->_languageID;
}

- (void)setLanguageID:(id)a3
{
}

- (id)voiceVariantChangedToken
{
  return self->_voiceVariantChangedToken;
}

- (void)setVoiceVariantChangedToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end