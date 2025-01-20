@interface AXTVSpeechVoiceVariantsViewController
- (AXSpeechSettingsModelController)speechModelController;
- (AXTVSpeechVoiceVariantsViewController)initWithFootprint:(id)a3 speechModelController:(id)a4;
- (BOOL)_hasAnyDeletableResources;
- (NSArray)resources;
- (TSKSettingItem)selectedVoiceItem;
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)editButtonItem;
- (id)_resourceForVoiceId:(id)a3;
- (id)_visibleSettingItemForVoiceID:(id)a3;
- (id)loadSettingGroups;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_handleDownloadProgressForVoiceId:(id)a3 progress:(float)a4 storageSize:(int64_t)a5 requiredDiskSpace:(BOOL)a6;
- (void)_handleItemClicked:(id)a3;
- (void)_handleResourceCacheDidReceiveUpdate;
- (void)_handleVoiceDeleted:(id)a3;
- (void)_handleVoiceDownloaded:(id)a3 cancelled:(BOOL)a4;
- (void)_promptUserToDeleteResource:(id)a3;
- (void)_promptUserToDownloadResource:(id)a3;
- (void)_speakSample:(id)a3;
- (void)_updateAccessoryTintColorForFocusedCell:(id)a3;
- (void)_updateNavigationItem;
- (void)_updateVoiceVariantItem:(id)a3;
- (void)dealloc;
- (void)resourceCacheDidReceiveUpdate;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditButtonItem:(id)a3;
- (void)setResources:(id)a3;
- (void)setSelectedVoiceItem:(id)a3;
- (void)setSpeechModelController:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)toggleEditMode:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXTVSpeechVoiceVariantsViewController

- (AXTVSpeechVoiceVariantsViewController)initWithFootprint:(id)a3 speechModelController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___AXTVSpeechVoiceVariantsViewController;
  v8 = -[AXTVSpeechVoiceVariantsViewController init](&v20, "init");
  v9 = v8;
  if (v8)
  {
    -[AXTVSpeechVoiceVariantsViewController setSpeechModelController:](v8, "setSpeechModelController:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    -[AXTVSpeechVoiceVariantsViewController setTitle:](v9, "setTitle:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 resources]);
    -[AXTVSpeechVoiceVariantsViewController setResources:](v9, "setResources:", v11);

    objc_initWeak(&location, v9);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10BBC;
    v17[3] = &unk_65980;
    objc_copyWeak(&v18, &location);
    [v7 setDownloadProgressForVoiceIdCallback:v17];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10C2C;
    v15[3] = &unk_659A8;
    objc_copyWeak(&v16, &location);
    [v7 setFinishedDownloadingResourceCallback:v15];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10C84;
    v13[3] = &unk_659D0;
    objc_copyWeak(&v14, &location);
    [v7 setFinishedDeletingResourceCallback:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController speechModelController](self, "speechModelController"));
  [v3 setDownloadProgressForVoiceIdCallback:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController speechModelController](self, "speechModelController"));
  [v4 setFinishedDownloadingResourceCallback:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController speechModelController](self, "speechModelController"));
  [v5 setFinishedDeletingResourceCallback:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXTVSpeechVoiceVariantsViewController;
  -[AXTVSpeechVoiceVariantsViewController dealloc](&v7, "dealloc");
}

- (id)loadSettingGroups
{
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController resources](self, "resources"));
  uint64_t v4 = AXSortedVoiceVariantsForDisplay();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = AXSortTTSAXResourcesForSiriVoicesIfNeeded();
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    v9 = 0LL;
    uint64_t v10 = *(void *)v26;
    do
    {
      v11 = 0LL;
      v12 = v9;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v11);
        uint64_t v14 = AXLocalizedVoiceVariantNameForResource(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 voiceId]);
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v15,  0LL,  v16,  0LL,  self,  "_handleItemClicked:"));

        objc_initWeak(&location, self);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_11028;
        v22[3] = &unk_65798;
        objc_copyWeak(&v23, &location);
        [v9 setUpdateBlock:v22];
        [v21 addObject:v9];
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

        v11 = (char *)v11 + 1;
        v12 = v9;
      }

      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v8);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v21));
  [v19 addObject:v17];
  -[AXTVSpeechVoiceVariantsViewController _updateNavigationItem](self, "_updateNavigationItem");

  return v19;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVSpeechVoiceVariantsViewController;
  -[AXTVSpeechVoiceVariantsViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  [v3 addObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  -[AXTVSpeechVoiceVariantsViewController reloadSettings](self, "reloadSettings");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVSpeechVoiceVariantsViewController;
  -[AXTVSpeechVoiceVariantsViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)toggleEditMode:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController tableView](self, "tableView", a3));
  unsigned int v5 = [v4 isEditing];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController tableView](self, "tableView"));
  [v6 setEditing:v5 ^ 1];

  -[AXTVSpeechVoiceVariantsViewController _updateNavigationItem](self, "_updateNavigationItem");
  -[AXTVSpeechVoiceVariantsViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v23 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v23 item]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 representedObject]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController _resourceForVoiceId:](self, "_resourceForVoiceId:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController speechModelController](self, "speechModelController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 downloadProgessByVoiceID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 voiceId]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
  [v12 floatValue];
  float v14 = v13;

  if (([v8 isInstalled] & 1) == 0 && (v14 <= 0.0 || v14 >= 1.0))
  {
    [v23 setAccessoryType:0];
    id v16 = objc_alloc(&OBJC_CLASS___UIImageView);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"icloud.and.arrow.down"));
    id v18 = -[UIImageView initWithImage:](v16, "initWithImage:", v17);

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v23 textLabel]);
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([v19 font]);

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v20,  0LL));
    -[UIImageView setPreferredSymbolConfiguration:](v18, "setPreferredSymbolConfiguration:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
    -[UIImageView setTintColor:](v18, "setTintColor:", v22);

    -[UIImageView sizeToFit](v18, "sizeToFit");
    [v23 setAccessoryView:v18];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 representedObject]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController _resourceForVoiceId:](self, "_resourceForVoiceId:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController speechModelController](self, "speechModelController"));
  LODWORD(v6) = [v8 isResourceUserDeletable:v7];

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", a5));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 representedObject]);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController _resourceForVoiceId:](self, "_resourceForVoiceId:", v6));

    -[AXTVSpeechVoiceVariantsViewController _promptUserToDeleteResource:](self, "_promptUserToDeleteResource:", v7);
  }

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AXTVSpeechVoiceVariantsViewController;
  id v8 = a4;
  id v9 = a3;
  -[AXTVSpeechVoiceVariantsViewController tableView:didUpdateFocusInContext:withAnimationCoordinator:]( &v12,  "tableView:didUpdateFocusInContext:withAnimationCoordinator:",  v9,  v8,  a5);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextFocusedIndexPath", v12.receiver, v12.super_class));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 cellForRowAtIndexPath:v10]);
  -[AXTVSpeechVoiceVariantsViewController _updateAccessoryTintColorForFocusedCell:]( self,  "_updateAccessoryTintColorForFocusedCell:",  v11);
}

- (UIBarButtonItem)doneButtonItem
{
  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    objc_super v4 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  0LL,  self,  "toggleEditMode:");
    unsigned int v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    doneButtonItem = self->_doneButtonItem;
  }

  return doneButtonItem;
}

- (UIBarButtonItem)editButtonItem
{
  editButtonItem = self->_editButtonItem;
  if (!editButtonItem)
  {
    objc_super v4 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  2LL,  self,  "toggleEditMode:");
    unsigned int v5 = self->_editButtonItem;
    self->_editButtonItem = v4;

    editButtonItem = self->_editButtonItem;
  }

  return editButtonItem;
}

- (BOOL)_hasAnyDeletableResources
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController speechModelController](self, "speechModelController"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController resources](self, "resources"));
  unsigned __int8 v5 = [v3 hasAnyUserDeletableResources:v4];

  return v5;
}

- (void)_updateNavigationItem
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController navigationItem](self, "navigationItem"));
  unsigned int v3 = -[AXTVSpeechVoiceVariantsViewController _hasAnyDeletableResources](self, "_hasAnyDeletableResources");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController tableView](self, "tableView"));
  unsigned int v5 = [v4 isEditing];

  if (!v3)
  {
    if (!v5)
    {
      [v8 setRightBarButtonItem:0];
      goto LABEL_8;
    }

    goto LABEL_5;
  }

  if (v5)
  {
LABEL_5:
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController doneButtonItem](self, "doneButtonItem"));
    goto LABEL_6;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController editButtonItem](self, "editButtonItem"));
LABEL_6:
  objc_super v7 = (void *)v6;
  [v8 setRightBarButtonItem:v6];

LABEL_8:
}

- (void)_updateAccessoryTintColorForFocusedCell:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController traitCollection](self, "traitCollection"));
  uint64_t v6 = (char *)[v5 userInterfaceStyle];

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController tableView](self, "tableView", 0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 visibleCells]);

  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (v13 != v4 && v6 == (_BYTE *)&dword_0 + 2) {
          uint64_t v15 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
        }
        else {
          uint64_t v15 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
        }
        id v16 = (void *)v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue([v13 accessoryView]);
        [v17 setTintColor:v16];
      }

      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }
}

- (void)_updateVoiceVariantItem:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_21;
  }
  id v43 = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController _resourceForVoiceId:](self, "_resourceForVoiceId:", v5));

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryLanguage]);
  uint64_t v8 = AXCLanguageCanonicalFormToGeneralLanguage();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController speechModelController](self, "speechModelController"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 selectedVoiceIdentifierForSpeechSourceKey:AXSpeechSourceKeyVoiceOver languageCode:v9]);

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController speechModelController](self, "speechModelController"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 downloadProgessByVoiceID]);
  float v14 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceId]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);
  [v15 floatValue];
  float v17 = v16;

  BOOL v18 = v17 < 1.0 && v17 > 0.0;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceId]);
  unsigned int v20 = [v11 isEqualToString:v19];

  if (v20)
  {
    [v43 setAccessoryTypes:2];
    -[AXTVSpeechVoiceVariantsViewController setSelectedVoiceItem:](self, "setSelectedVoiceItem:", v43);
  }

  else
  {
    [v43 setAccessoryTypes:0];
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v18)
  {
    uint64_t v24 = AXFormatFloatWithPercentage(0LL, v17, v22, v23);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    [v43 setLocalizedValue:v25];
  }

  else
  {
    [v43 setLocalizedValue:0];
  }

  if (([v6 isInstalled] & 1) == 0)
  {
    uint64_t v37 = AXLocalizedTileForResourceDownloadSizeRequired(v6);
    uint64_t v36 = objc_claimAutoreleasedReturnValue(v37);
    goto LABEL_15;
  }

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v6 speechVoice]);
  unsigned int v27 = [v26 canBeDownloaded];

  if (v27)
  {
    uint64_t v35 = AXLocalizedTileForResourceOnDiskSizeUsed(v6);
    uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
LABEL_15:
    v38 = (void *)v36;
    if (v36) {
      [v21 addObject:v36];
    }
  }

  id v39 = AXTVLocString(@"VOICE_PLAY_INSTRUCTIONS", v28, v29, v30, v31, v32, v33, v34, v42);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  [v21 addObject:v40];

  if (AXIsInternalInstall()) {
    [v21 addObject:@"*** INTERNAL ONLY ***\nYou must connect to the internal network to download additional voice assets"];
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue([v21 componentsJoinedByString:@"\n"]);
  [v43 setLocalizedDescription:v41];

  [v43 setPlayButtonAction:"_speakSample:"];
  id v4 = v43;
LABEL_21:
}

- (void)_handleItemClicked:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController _resourceForVoiceId:](self, "_resourceForVoiceId:", v5));

  if ([v6 isInstalled])
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController selectedVoiceItem](self, "selectedVoiceItem"));
    [v7 setDirty:1];

    [v4 setDirty:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController speechModelController](self, "speechModelController"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceId]);
    [v8 updateSelectedVoiceIdentifier:v9 forSpeechSourceKey:AXSpeechSourceKeyVoiceOver];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v11 = AXTVVoiceVariantWasSelectedNotification;
    id v13 = @"resource";
    float v14 = v6;
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    [v10 postNotificationName:v11 object:self userInfo:v12];

    -[AXTVSpeechVoiceVariantsViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

  else
  {
    -[AXTVSpeechVoiceVariantsViewController _promptUserToDownloadResource:](self, "_promptUserToDownloadResource:", v6);
  }
}

- (void)_promptUserToDownloadResource:(id)a3
{
  id v4 = a3;
  id v12 = AXTVLocString(@"unified.speech.download.voice.title", v5, v6, v7, v8, v9, v10, v11, v48);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = AXLocalizedVoiceVariantNameForResource(v4);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v23 = AXTVLocString(@"unified.speech.download.voice.message", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v13,  v24,  1LL));

  objc_initWeak(&location, self);
  id v33 = AXTVLocString(@"OK", v26, v27, v28, v29, v30, v31, v32, v49);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_11EC0;
  v53[3] = &unk_659F8;
  id v35 = v4;
  id v54 = v35;
  objc_copyWeak(&v55, &location);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v34,  0LL,  v53));
  [v25 addAction:v36];

  id v44 = AXTVLocString(@"Cancel", v37, v38, v39, v40, v41, v42, v43, v50);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_11F94;
  v51[3] = &unk_65A20;
  id v46 = v35;
  id v52 = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v45,  1LL,  v51));
  [v25 addAction:v47];

  -[AXTVSpeechVoiceVariantsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v25,  1LL,  0LL);
  objc_destroyWeak(&v55);

  objc_destroyWeak(&location);
}

- (void)_promptUserToDeleteResource:(id)a3
{
  id v4 = a3;
  id v12 = AXTVLocString(@"unified.speech.delete.voice.title", v5, v6, v7, v8, v9, v10, v11, v47);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = AXLocalizedVoiceVariantNameForResource(v4);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v23 = AXTVLocString(@"unified.speech.delete.voice.message", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v13,  v24,  1LL));

  objc_initWeak(&location, self);
  id v33 = AXTVLocString(@"Delete", v26, v27, v28, v29, v30, v31, v32, v48);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_12230;
  v50[3] = &unk_651D8;
  objc_copyWeak(&v52, &location);
  id v35 = v4;
  id v51 = v35;
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v34,  2LL,  v50));
  [v25 addAction:v36];

  id v44 = AXTVLocString(@"Cancel", v37, v38, v39, v40, v41, v42, v43, v49);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  id v46 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v45,  1LL,  0LL));
  [v25 addAction:v46];

  -[AXTVSpeechVoiceVariantsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v25,  1LL,  0LL);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

- (void)_speakSample:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController _resourceForVoiceId:](self, "_resourceForVoiceId:", v4));

  uint64_t v6 = AXTTSLogCommon();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "User requested play sample for voice resource: %@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController speechModelController](self, "speechModelController"));
  [v8 playSampleForResource:v5 completion:&stru_65A40];

  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, &stru_69430);
}

- (id)_visibleSettingItemForVoiceID:(id)a3
{
  id v25 = a3;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController visibleSettingGroups](self, "visibleSettingGroups"));
  id v22 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v22)
  {
    uint64_t v5 = *(void *)v31;
    uint64_t v24 = v4;
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(v4);
        }
        uint64_t v23 = v6;
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 settingItems]);
        id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v27;
          while (2)
          {
            for (i = 0LL; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 representedObject]);
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSpeechVoiceVariantsViewController _resourceForVoiceId:]( self,  "_resourceForVoiceId:",  v14));

              uint64_t v16 = objc_opt_class(&OBJC_CLASS___TTSAXResource);
              if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
              {
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 voiceId]);
                unsigned __int8 v18 = [v17 isEqualToString:v25];

                if ((v18 & 1) != 0)
                {
                  id v19 = v13;

                  id v4 = v24;
                  goto LABEL_20;
                }
              }
            }

            id v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v23 + 1;
        id v4 = v24;
        uint64_t v5 = v21;
      }

      while ((id)(v23 + 1) != v22);
      id v19 = 0LL;
      id v22 = [v24 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v22);
  }

  else
  {
    id v19 = 0LL;
  }

- (id)_resourceForVoiceId:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController resources](self, "resources", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 voiceId]);
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_handleResourceCacheDidReceiveUpdate
{
  uint64_t v3 = AXLogSpeechAssetDownload(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = self;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "AXTVSpeechVoiceVariantsViewController<%p>: Did receive voice cache update",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController resources](self, "resources"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 refreshedResourcesForResources:v6]);
  -[AXTVSpeechVoiceVariantsViewController setResources:](self, "setResources:", v7);

  -[AXTVSpeechVoiceVariantsViewController reloadSettings](self, "reloadSettings");
}

- (void)_handleDownloadProgressForVoiceId:(id)a3 progress:(float)a4 storageSize:(int64_t)a5 requiredDiskSpace:(BOOL)a6
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[AXTVSpeechVoiceVariantsViewController _visibleSettingItemForVoiceID:]( self,  "_visibleSettingItemForVoiceID:",  a3,  a5,  a6));
  [v7 setDirty:1];
  -[AXTVSpeechVoiceVariantsViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)_handleVoiceDownloaded:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v8 = AXLogSpeechAssetDownload(v6, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceId]);
    int v14 = 134218498;
    __int128 v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2048;
    BOOL v19 = v4;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "AXTVSpeechVoiceVariantsViewController<%p>: Did download voice '%@'. Cancelled:%ld",  (uint8_t *)&v14,  0x20u);
  }

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController resources](self, "resources"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 refreshedResourcesForResources:v12]);
  -[AXTVSpeechVoiceVariantsViewController setResources:](self, "setResources:", v13);

  -[AXTVSpeechVoiceVariantsViewController reloadSettings](self, "reloadSettings");
}

- (void)_handleVoiceDeleted:(id)a3
{
  id v4 = a3;
  uint64_t v6 = AXLogSpeechAssetDownload(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 voiceId]);
    int v12 = 134218242;
    __int128 v13 = self;
    __int16 v14 = 2112;
    __int128 v15 = v8;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "AXTVSpeechVoiceVariantsViewController<%p>: Did delete voice '%@'",  (uint8_t *)&v12,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSpeechVoiceVariantsViewController resources](self, "resources"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 refreshedResourcesForResources:v10]);
  -[AXTVSpeechVoiceVariantsViewController setResources:](self, "setResources:", v11);

  -[AXTVSpeechVoiceVariantsViewController reloadSettings](self, "reloadSettings");
}

- (void)resourceCacheDidReceiveUpdate
{
}

- (AXSpeechSettingsModelController)speechModelController
{
  return self->_speechModelController;
}

- (void)setSpeechModelController:(id)a3
{
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
}

- (void)setEditButtonItem:(id)a3
{
}

- (void)setDoneButtonItem:(id)a3
{
}

- (TSKSettingItem)selectedVoiceItem
{
  return self->_selectedVoiceItem;
}

- (void)setSelectedVoiceItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end