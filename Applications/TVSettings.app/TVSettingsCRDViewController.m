@interface TVSettingsCRDViewController
+ (id)_makeRequireCodeEveryTimeHomeChildViewControllerBlock;
+ (id)crdModeFormatter;
+ (void)_removeFromHomeAndEnableEveryTimeCode;
- (NSArray)photoCollectionGroups;
- (TSKSettingItem)backgroundPhotoSettingItem;
- (TVSettingsCRDPreviewViewController)crdPreviewViewController;
- (TVSettingsCRDViewController)initWithStyle:(int64_t)a3;
- (TVSettingsPhotoChooserViewController)_CRDBackgroundPhotoViewController;
- (id)_allowedPhotoCollectionGroups;
- (id)loadSettingGroups;
- (id)photoCollectionGroupsForController:(id)a3;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_fetchPhotoCollectionGroups;
- (void)_showPreview:(id)a3;
- (void)controller:(id)a3 didSelectAsset:(id)a4 inCollection:(id)a5 collectionGroup:(id)a6;
- (void)controller:(id)a3 didSelectCollectionGroup:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBackgroundPhotoSettingItem:(id)a3;
- (void)setCrdPreviewViewController:(id)a3;
- (void)setPhotoCollectionGroups:(id)a3;
- (void)set_CRDBackgroundPhotoViewController:(id)a3;
@end

@implementation TVSettingsCRDViewController

+ (id)crdModeFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100194BE8];
}

- (TVSettingsCRDViewController)initWithStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsCRDViewController;
  v3 = -[TVSettingsCRDViewController initWithStyle:](&v8, "initWithStyle:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TVSettingsCRDPreviewViewController);
    -[TVSettingsCRDViewController setCrdPreviewViewController:](v3, "setCrdPreviewViewController:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
    [v5 addObserver:v3 forKeyPath:@"availablePhotoCollections" options:0 context:off_1001E0B20];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    [v6 addObserver:v3 forKeyPath:@"localAccessory" options:0 context:&unk_1001E1C28];
    -[TVSettingsCRDViewController _fetchPhotoCollectionGroups](v3, "_fetchPhotoCollectionGroups");
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"availablePhotoCollections" context:off_1001E0B20];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"localAccessory" context:&unk_1001E1C28];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsCRDViewController;
  -[TVSettingsCRDViewController dealloc](&v5, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsAirPlayFacade sharedInstance](&OBJC_CLASS___TVSettingsAirPlayFacade, "sharedInstance"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1000DEBAC;
  v49[3] = &unk_10018E608;
  id v4 = v3;
  id v50 = v4;
  v42 = objc_retainBlock(v49);
  objc_super v5 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v7 = TSKLocString(@"APCRDTitle");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = TSKLocString(@"APCRDModeDisabledWithSaverInstructionalText");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v8,  v10,  v4,  @"mode",  0LL,  0LL));

  [v11 setAvailableValues:&off_1001AF298];
  id v12 = [(id)objc_opt_class(self) crdModeFormatter];
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v11 setLocalizedValueFormatter:v13];

  [v11 setUpdateBlock:&stru_100194C08];
  -[NSMutableArray addObject:](v6, "addObject:", v11);
  uint64_t v14 = TSKLocString(@"APCRDEveryTimeCodeTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = TSKLocString(@"APCRDEveryTimeCodeDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v15,  v17,  v41,  @"everyTimeCodeRequired",  0LL,  0LL));

  [v18 setUpdateBlock:&stru_100194C28];
  [v18 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v6, "addObject:", v18);
  uint64_t v19 = TSKLocString(@"APCRDPreviewTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v20,  0LL,  0LL,  0LL,  self,  "_showPreview:"));

  [v21 setUpdateBlock:v42];
  -[NSMutableArray addObject:](v6, "addObject:", v21);
  uint64_t v22 = TSKLocString(@"APCRDCustomMessageTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = TSKLocString(@"APCRDCustomMessageDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v23,  v25,  v4,  @"conferenceRoomDisplayMessage"));

  [v26 setEnabledInStoreDemoMode:0];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000DECB8;
  v47[3] = &unk_10018E608;
  id v27 = v4;
  id v48 = v27;
  [v26 setUpdateBlock:v47];
  uint64_t v28 = TSKLocString(@"APCRDCustomMessageInstructionText");
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  [v26 setLocalizedTextEntryInstructions:v29];

  -[NSMutableArray addObject:](v6, "addObject:", v26);
  -[TSKSettingGroup setSettingItems:](v5, "setSettingItems:", v6);
  v30 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v31 = TSKLocString(@"APCRDBackgroundSectionTitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = -[TSKSettingGroup initWithTitle:](v30, "initWithTitle:", v32);

  v34 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v35 = TSKLocString(@"APCRDBackgroundPhotoTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000DED10;
  v45[3] = &unk_10018E9D8;
  objc_copyWeak(&v46, &location);
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v36,  0LL,  v27,  @"conferenceRoomDisplayBackgroundPhotoName",  v45));

  [v37 setEnabledInStoreDemoMode:0];
  [v37 setAccessoryTypes:1];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000DED48;
  v43[3] = &unk_100194C50;
  v38 = v42;
  id v44 = v38;
  [v37 setUpdateBlock:v43];
  -[NSMutableArray addObject:](v34, "addObject:", v37);
  objc_storeStrong((id *)&self->_backgroundPhotoSettingItem, v37);
  -[TSKSettingGroup setSettingItems:](v33, "setSettingItems:", v34);
  -[TSKSettingGroup setUpdateBlock:](v33, "setUpdateBlock:", v38);
  v52[0] = v5;
  v52[1] = v33;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 2LL));

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
  return v39;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCRDViewController crdPreviewViewController](self, "crdPreviewViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));

  [v5 setDescriptionText:v6];
  return v5;
}

- (void)_showPreview:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance", a3));
  [v3 launchCRDApp];
}

- (id)photoCollectionGroupsForController:(id)a3
{
  return self->_photoCollectionGroups;
}

- (void)controller:(id)a3 didSelectCollectionGroup:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  [v6 setConferenceRoomDisplayBackgroundPhoto:0];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v5 photoCollectionGroupName]);

  [v7 setConferenceRoomDisplayBackgroundPhotoName:v8];
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsCRDViewController navigationController](self, "navigationController"));
  id v9 = [v10 popToViewController:self animated:1];
}

- (void)controller:(id)a3 didSelectAsset:(id)a4 inCollection:(id)a5 collectionGroup:(id)a6
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 fullResolutionURL]);
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v9));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", v16));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  [v11 setConferenceRoomDisplayBackgroundPhoto:v10];

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 collectionName]);

  [v12 setConferenceRoomDisplayBackgroundPhotoName:v13];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCRDViewController navigationController](self, "navigationController"));
  id v15 = [v14 popToViewController:self animated:1];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001E0B20 == a6)
  {
    -[TVSettingsCRDViewController _fetchPhotoCollectionGroups](self, "_fetchPhotoCollectionGroups");
    -[TVSettingsPhotoChooserViewController updatePhotoCollectionGroups]( self->__CRDBackgroundPhotoViewController,  "updatePhotoCollectionGroups");
  }

  else if (a6 == &unk_1001E1C28)
  {
    -[TVSettingsCRDViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___TVSettingsCRDViewController;
    -[TVSettingsCRDViewController observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_fetchPhotoCollectionGroups
{
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v23 availablePhotoCollectionGroups]);
  uint64_t v22 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCRDViewController _allowedPhotoCollectionGroups](self, "_allowedPhotoCollectionGroups"));
  id v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v6 = objc_alloc(&OBJC_CLASS___TVPhotoCollectionGroup);
  uint64_t v7 = TSKLocString(@"APCRDBackgroundNoneTitle");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = -[TVPhotoCollectionGroup initWithName:](v6, "initWithName:", v8);

  uint64_t v24 = v5;
  -[NSArray addObject:](v5, "addObject:", v9);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 photoCollections]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 photoSource]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sourceIdentifier]);

          if ([v19 isEqualToString:TVPhotoSourceAppProviderIdentifier])
          {
            uint64_t v20 = objc_claimAutoreleasedReturnValue([v17 collectionIdentifier]);

            uint64_t v19 = (void *)v20;
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v12);
  }

  photoCollectionGroups = v22->_photoCollectionGroups;
  v22->_photoCollectionGroups = v24;
}

- (id)_allowedPhotoCollectionGroups
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.TVPhotoSources.TVDefaultPhotosPlugin",  @"com.apple.TVPhotos",  0LL);
}

- (TVSettingsPhotoChooserViewController)_CRDBackgroundPhotoViewController
{
  CRDBackgroundPhotoViewController = self->__CRDBackgroundPhotoViewController;
  if (!CRDBackgroundPhotoViewController)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___TVSettingsPhotoChooserViewController);
    -[TVSettingsPhotoChooserViewController setDelegate:](v4, "setDelegate:", self);
    -[TVSettingsPhotoChooserViewController setDataSource:](v4, "setDataSource:", self);
    id v5 = self->__CRDBackgroundPhotoViewController;
    self->__CRDBackgroundPhotoViewController = v4;

    CRDBackgroundPhotoViewController = self->__CRDBackgroundPhotoViewController;
  }

  return CRDBackgroundPhotoViewController;
}

+ (id)_makeRequireCodeEveryTimeHomeChildViewControllerBlock
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localAccessory]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 home]);

  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000DF4D8;
    v8[3] = &unk_100194C90;
    v8[4] = a1;
    v6 = objc_retainBlock(v8);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

+ (void)_removeFromHomeAndEnableEveryTimeCode
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v2 forgetHomeConfiguration:&stru_100194CB0];
}

- (TVSettingsCRDPreviewViewController)crdPreviewViewController
{
  return self->_crdPreviewViewController;
}

- (void)setCrdPreviewViewController:(id)a3
{
}

- (NSArray)photoCollectionGroups
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPhotoCollectionGroups:(id)a3
{
}

- (TSKSettingItem)backgroundPhotoSettingItem
{
  return self->_backgroundPhotoSettingItem;
}

- (void)setBackgroundPhotoSettingItem:(id)a3
{
}

- (void)set_CRDBackgroundPhotoViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end