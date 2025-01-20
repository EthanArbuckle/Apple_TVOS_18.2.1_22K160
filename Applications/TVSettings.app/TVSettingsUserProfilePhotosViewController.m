@interface TVSettingsUserProfilePhotosViewController
- (TSKPreviewViewController)appPreviewViewController;
- (TVSettingsUserProfileFacade)userProfileFacade;
- (TVSettingsUserProfilePhotosFacade)userProfilePhotosFacade;
- (TVSettingsUserProfilePhotosViewController)initWithUserProfileFacade:(id)a3;
- (id)_iCloudPhotosGroup;
- (id)_sharingFilterGroup;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_didSelectSharingFilterItem:(id)a3;
- (void)_enableMemoriesContent:(id)a3;
- (void)_enableiCloudMyPhotoStream:(id)a3;
- (void)_enableiCloudPhotoLibrary:(id)a3;
- (void)_enableiCloudSharedAlbums:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppPreviewViewController:(id)a3;
- (void)setUserProfileFacade:(id)a3;
- (void)setUserProfilePhotosFacade:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsUserProfilePhotosViewController

- (TVSettingsUserProfilePhotosViewController)initWithUserProfileFacade:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfilePhotosViewController;
  v6 = -[TVSettingsUserProfilePhotosViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userProfileFacade, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___TVSettingsUserProfilePhotosFacade);
    userProfilePhotosFacade = v7->_userProfilePhotosFacade;
    v7->_userProfilePhotosFacade = v8;

    -[TVSettingsUserProfileFacade addObserver:forKeyPath:options:context:]( v7->_userProfileFacade,  "addObserver:forKeyPath:options:context:",  v7,  @"userHasBeenRemoved",  1LL,  off_1001E0978);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfilePhotosViewController;
  -[TVSettingsUserProfilePhotosViewController dealloc](&v3, "dealloc");
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfilePhotosViewController;
  -[TVSettingsUserProfilePhotosViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  if (-[TVSettingsUserProfileFacade userHasBeenRemoved](self->_userProfileFacade, "userHasBeenRemoved"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosViewController navigationController](self, "navigationController"));
    id v5 = [v4 popViewControllerAnimated:1];
  }

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfilePhotosViewController;
  -[TVSettingsUserProfilePhotosViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[TVSettingsUserProfileFacade setAuthenticationNeededToChangeiCloudPhotoOptions]( self->_userProfileFacade,  "setAuthenticationNeededToChangeiCloudPhotoOptions");
}

- (id)loadSettingGroups
{
  objc_super v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosViewController _iCloudPhotosGroup](self, "_iCloudPhotosGroup"));
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  if (_os_feature_enabled_impl("IdleScreen", "Fizzgig"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosViewController _sharingFilterGroup](self, "_sharingFilterGroup"));
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }

  id v6 = -[NSMutableArray copy](v3, "copy");

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E0978 == a6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsUserProfilePhotosViewController navigationController]( self,  "navigationController",  a3,  a4,  a5));
    id v6 = [v7 popViewControllerAnimated:1];
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfilePhotosViewController;
    -[TVSettingsUserProfilePhotosViewController observeValueForKeyPath:ofObject:change:context:]( &v8,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_appPreviewViewController)
  {
    id v5 = objc_alloc(&OBJC_CLASS___TSKVibrantImageView);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Photos-Settings"));
    id v7 = [v5 initWithImage:v6];

    objc_super v8 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
    appPreviewViewController = self->_appPreviewViewController;
    self->_appPreviewViewController = v8;

    -[TSKPreviewViewController setContentView:](self->_appPreviewViewController, "setContentView:", v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
  -[TSKPreviewViewController setDescriptionText:](self->_appPreviewViewController, "setDescriptionText:", v10);
  objc_super v11 = self->_appPreviewViewController;

  return v11;
}

- (id)_iCloudPhotosGroup
{
  v37 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = self->_userProfileFacade;
  uint64_t v5 = TSKLocString(@"iCloudPhotoLibraryDescription");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfileFacade user](self->_userProfileFacade, "user"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 iCloudUsername]);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v8));

  uint64_t v9 = TSKLocString(@"iCloudPhotoLibrarySectionTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v10,  v36,  v4,  @"iCloudPhotoLibraryEnabled",  self,  "_enableiCloudPhotoLibrary:"));

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v35 setLocalizedValueFormatter:v11];

  -[NSMutableArray addObject:](v3, "addObject:", v35);
  uint64_t v12 = TSKLocString(@"iCloudPhotoMemoryTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = TSKLocString(@"iCloudPhotoMemoryDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v13,  v15,  v4,  @"memoriesContentEnabled",  self,  "_enableMemoriesContent:"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v16 setLocalizedValueFormatter:v17];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000D5284;
  v40[3] = &unk_10018E608;
  v18 = v4;
  v41 = v18;
  [v16 setUpdateBlock:v40];
  -[NSMutableArray addObject:](v3, "addObject:", v16);
  uint64_t v19 = TSKLocString(@"MyPhotoStreamTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = TSKLocString(@"MyPhotoStreamDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v20,  v22,  v18,  @"iCloudPhotoStreamEnabled",  self,  "_enableiCloudMyPhotoStream:"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v23 setLocalizedValueFormatter:v24];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000D52C8;
  v38[3] = &unk_10018E608;
  v39 = v18;
  v25 = v18;
  [v23 setUpdateBlock:v38];
  -[NSMutableArray addObject:](v3, "addObject:", v23);
  uint64_t v26 = TSKLocString(@"iCloudSharedAlbumsTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  uint64_t v28 = TSKLocString(@"iCloudSharedAlbumsDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v27,  v29,  v25,  @"iCloudSharedPhotosEnabled",  self,  "_enableiCloudSharedAlbums:"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v30 setLocalizedValueFormatter:v31];

  -[NSMutableArray addObject:](v3, "addObject:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem privacyItemWithIdentifier:]( &OBJC_CLASS___TSKSettingItem,  "privacyItemWithIdentifier:",  @"com.apple.onboarding.appleid"));
  -[NSMutableArray addObject:](v3, "addObject:", v32);
  id v33 = -[NSMutableArray copy](v3, "copy");
  -[TSKSettingGroup setSettingItems:](v37, "setSettingItems:", v33);

  return v37;
}

- (id)_sharingFilterGroup
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosViewController userProfilePhotosFacade](self, "userProfilePhotosFacade"));
  uint64_t v4 = TSKLocString(@"PhotosSharingFilterGroupTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D53EC;
  v8[3] = &unk_100194930;
  v8[4] = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v5,  v3,  @"sharingFilters",  v8));

  [v6 setAutoHide:1];
  return v6;
}

- (void)_enableiCloudPhotoLibrary:(id)a3
{
}

- (void)_enableiCloudSharedAlbums:(id)a3
{
}

- (void)_enableiCloudMyPhotoStream:(id)a3
{
}

- (void)_enableMemoriesContent:(id)a3
{
}

- (void)_didSelectSharingFilterItem:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosViewController userProfilePhotosFacade](self, "userProfilePhotosFacade"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v4 setSelectedSharingFilterWithID:v5];
}

- (TVSettingsUserProfileFacade)userProfileFacade
{
  return self->_userProfileFacade;
}

- (void)setUserProfileFacade:(id)a3
{
}

- (TVSettingsUserProfilePhotosFacade)userProfilePhotosFacade
{
  return self->_userProfilePhotosFacade;
}

- (void)setUserProfilePhotosFacade:(id)a3
{
}

- (TSKPreviewViewController)appPreviewViewController
{
  return self->_appPreviewViewController;
}

- (void)setAppPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end