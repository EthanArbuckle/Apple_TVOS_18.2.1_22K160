@interface TVSettingsScreenSaverTypesViewController
- (TVPiCloudPhotosWelcomeViewController)iCloudWelcomeViewController;
- (TVSettingsScreenSaverTypesViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (id)title;
- (void)_goToPhotoSettingsIfPossible;
- (void)_openSettings;
- (void)_openiCloudPhotosTypesViewControllerAnimated:(BOOL)a3;
- (void)_turnOnWelcomeSectionType:(int64_t)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)selectedItem:(id)a3;
- (void)setICloudWelcomeViewController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsScreenSaverTypesViewController

- (TVSettingsScreenSaverTypesViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverTypesViewController;
  v3 = -[TVSettingsScreenSaverTypesViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"screenSaverStyle" options:0 context:off_1001DF8E8];
    [v4 addObserver:v3 forKeyPath:@"selectedPhotoCollection" options:0 context:off_1001DF8F0];
    [v4 addObserver:v3 forKeyPath:@"idleScreenSaverType" options:0 context:off_1001DF8F8];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"screenSaverStyle" context:off_1001DF8E8];
  [v3 removeObserver:self forKeyPath:@"selectedPhotoCollection" context:off_1001DF8F0];
  [v3 removeObserver:self forKeyPath:@"idleScreenSaverType" context:off_1001DF8F8];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverTypesViewController;
  -[TVSettingsScreenSaverTypesViewController dealloc](&v4, "dealloc");
}

- (id)title
{
  return (id)TSKLocString(@"SaverStylePageTitle");
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  [v5 invalidateCachedAvailablePhotoCollectionGroups];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverTypesViewController;
  -[TVSettingsScreenSaverTypesViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverTypesViewController;
  -[TVSettingsScreenSaverTypesViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  [v3 setAuthenticationNeededToChangeiCloudPhotoOptions];
}

- (id)loadSettingGroups
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003CE98;
  v8[3] = &unk_100190290;
  objc_copyWeak(&v10, &location);
  id v4 = v3;
  id v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v4,  @"otherAvailablePhotoCollectionGroups",  v8));
  v12 = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF8F0 == a6 || off_1001DF8E8 == a6 || off_1001DF8F8 == a6)
  {
    -[TVSettingsScreenSaverTypesViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVSettingsScreenSaverTypesViewController;
    -[TVSettingsScreenSaverTypesViewController observeValueForKeyPath:ofObject:change:context:]( &v8,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)selectedItem:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  if (v4)
  {
    id v11 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
    if (v11 == (id)qword_1001E22F0)
    {
      [v5 setIdleScreenSaverType:TVISScreenSaverTypeAerial];
    }

    else if (v11 == (id)qword_1001E2300)
    {
      if ([v5 myPhotosScreenSaverOptionShouldBeEnabled]) {
        -[TVSettingsScreenSaverTypesViewController _openiCloudPhotosTypesViewControllerAnimated:]( self,  "_openiCloudPhotosTypesViewControllerAnimated:",  1LL);
      }
      else {
        -[TVSettingsScreenSaverTypesViewController _goToPhotoSettingsIfPossible](self, "_goToPhotoSettingsIfPossible");
      }
    }

    else
    {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v11 photoCollections]);
      id v7 = [v6 count];

      if ((unint64_t)v7 < 2)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 photoCollections]);
        objc_super v8 = (TVSettingsScreenSaverPhotoCollectionsViewController *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

        [v5 setSelectedPhotoCollection:v8];
      }

      else
      {
        objc_super v8 = -[TVSettingsScreenSaverPhotoCollectionsViewController initWithPhotoCollectionGroup:]( objc_alloc(&OBJC_CLASS___TVSettingsScreenSaverPhotoCollectionsViewController),  "initWithPhotoCollectionGroup:",  v11);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverTypesViewController navigationController](self, "navigationController"));
        [v9 pushViewController:v8 animated:1];
      }
    }

    id v4 = v11;
  }
}

- (void)_goToPhotoSettingsIfPossible
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProfilesSnapshot]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryUserProfile]);

  if (v5)
  {
    -[TVSettingsScreenSaverTypesViewController _openSettings](self, "_openSettings");
  }

  else
  {
    uint64_t v6 = TSKLocString(@"iCloudPhotoDefaultUserAlertTitle");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = TSKLocString(@"iCloudPhotoDefaultUserAlertMessage");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v9,  1LL));

    objc_initWeak(&location, self);
    uint64_t v11 = TSKLocString(@"iCloudPhotoDefaultUserAlertOKAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    v19 = sub_10003D5E8;
    v20 = &unk_10018F4E8;
    objc_copyWeak(&v21, &location);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  0LL,  &v17));
    objc_msgSend(v10, "addAction:", v13, v17, v18, v19, v20);

    uint64_t v14 = TSKLocString(@"iCloudPhotoDefaultUserAlertCancelAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  0LL));
    [v10 addAction:v16];

    -[TVSettingsScreenSaverTypesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v10,  1LL,  0LL);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

- (void)_openSettings
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  if ([v3 defaultUserSignedIn])
  {
    objc_initWeak(&location, self);
    id v4 = -[TVPiCloudPhotosWelcomeViewController initDisplaySharedAlbums:]( [TVPiCloudPhotosWelcomeViewController alloc],  "initDisplaySharedAlbums:",  [v3 primaryUseriCloudSharedPhotosEnabled] ^ 1);
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472LL;
    id v9 = sub_10003D784;
    id v10 = &unk_10018EE68;
    objc_copyWeak(&v11, &location);
    [v4 setOnSelection:&v7];
    -[TVSettingsScreenSaverTypesViewController setICloudWelcomeViewController:]( self,  "setICloudWelcomeViewController:",  v4,  v7,  v8,  v9,  v10);
    -[TVSettingsScreenSaverTypesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v4,  1LL,  0LL);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"prefs:root=USERS&primaryUser=true&action=setUpiCloudPhotos&animate=YES"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v6 openSensitiveURL:v5 withOptions:0];
  }
}

- (void)_openiCloudPhotosTypesViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___TVSettingsScreenSaverICloudPhotosTypesViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsScreenSaverTypesViewController navigationController](self, "navigationController"));
  [v5 pushViewController:v6 animated:v3];
}

- (void)_turnOnWelcomeSectionType:(int64_t)a3
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10003D9B0;
  v11[3] = &unk_10018E810;
  objc_copyWeak(&v12, &location);
  v5 = objc_retainBlock(v11);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  if (!a3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsScreenSaverTypesViewController iCloudWelcomeViewController]( self,  "iCloudWelcomeViewController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10003DA84;
    v10[3] = &unk_10018FA70;
    uint64_t v8 = v10;
    v10[4] = v5;
    [v6 setiCloudPhotoLibraryEnabled:1 presentingViewController:v7 propertySetCompletion:v10];
    goto LABEL_5;
  }

  if (a3 == 1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsScreenSaverTypesViewController iCloudWelcomeViewController]( self,  "iCloudWelcomeViewController"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10003DA98;
    v9[3] = &unk_10018FA70;
    uint64_t v8 = v9;
    v9[4] = v5;
    [v6 setiCloudSharedPhotosEnabled:1 presentingViewController:v7 propertySetCompletion:v9];
LABEL_5:
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (TVPiCloudPhotosWelcomeViewController)iCloudWelcomeViewController
{
  return self->_iCloudWelcomeViewController;
}

- (void)setICloudWelcomeViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end