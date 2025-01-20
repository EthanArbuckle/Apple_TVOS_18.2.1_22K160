@interface MTPlaylistSettingsViewController
+ (CGSize)podcastImageSize;
+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4;
- (BOOL)isPresentedModally;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)userDriven;
- (MTLibrary)library;
- (MTPlaylistSettingsViewController)initWithPlaylistUuid:(id)a3 library:(id)a4;
- (MTPlaylistSettingsViewControllerDelegate)delegate;
- (NSIndexPath)appearanceSelectedPath;
- (NSString)playlistUuid;
- (UIAlertController)deleteStationAlertController;
- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4;
- (id)addPodcastsViewController;
- (id)deletePlaylistBlock;
- (id)metricDataSource;
- (id)metricsName;
- (id)newSettingsController;
- (id)titleForCurrentPodcasts;
- (void)_updateUngroupedListSetting:(BOOL)a3;
- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6;
- (void)deletePlaylist:(id)a3;
- (void)removePodcastAtIndex:(unint64_t)a3;
- (void)saveNewPlaylists;
- (void)selectAppearancePathIfNecessary;
- (void)setAddPodcastsViewController:(id)a3;
- (void)setAppearanceSelectedPath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeletePlaylistBlock:(id)a3;
- (void)setDeleteStationAlertController:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setPlaylistUuid:(id)a3;
- (void)setUserDriven:(BOOL)a3;
- (void)showAddPodcastsSheet;
- (void)sourceList:(id)a3 didSelectItemUuid:(id)a4 atIndexPath:(id)a5;
- (void)syncControllerOperationCompleted:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)updateContainerOrder:(int)a3;
- (void)updatePodcastCount;
- (void)updateSetting:(id)a3 value:(id)a4;
- (void)updateShowSetting:(int64_t)a3 forSettings:(id)a4;
- (void)updateTitle:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTPlaylistSettingsViewController

- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 isEqualToString:@"podcasts"];
  if ((_DWORD)v8 && !isTV(v8))
  {
    double v10 = 50.0;
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___MTPlaylistSettingsViewController;
    -[MTGenericSettingsViewController heightForRowWithDescription:inGroupWithIdentifier:]( &v12,  "heightForRowWithDescription:inGroupWithIdentifier:",  v6,  v7);
    double v10 = v9;
  }

  return v10;
}

- (MTPlaylistSettingsViewController)initWithPlaylistUuid:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTPlaylistSettingsViewController;
  double v9 = -[MTGenericSettingsViewController init](&v12, "init");
  double v10 = v9;
  if (v9)
  {
    v9->_userDriven = 1;
    objc_storeStrong((id *)&v9->_playlistUuid, a3);
    objc_storeStrong((id *)&v10->_library, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTPlaylistSettingsViewController;
  -[MTTVGenericSettingsViewController viewDidLoad](&v4, "viewDidLoad");
  id v3 = -[MTPlaylistSettingsViewController newSettingsController](self, "newSettingsController");
  -[MTGenericSettingsViewController setSettingsController:](self, "setSettingsController:", v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTPlaylistSettingsViewController;
  -[MTGenericSettingsViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MTPlaylistSettingsViewController selectAppearancePathIfNecessary](self, "selectAppearancePathIfNecessary");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTPlaylistSettingsViewController;
  -[MTPlaylistSettingsViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v6,  "viewWillTransitionToSize:withTransitionCoordinator:",  a4,  a3.width,  a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController deleteStationAlertController](self, "deleteStationAlertController"));
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)selectAppearancePathIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController appearanceSelectedPath](self, "appearanceSelectedPath"));

  if (v3)
  {
    -[MTPlaylistSettingsViewController setUserDriven:](self, "setUserDriven:", 0LL);
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController tableView](self, "tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController appearanceSelectedPath](self, "appearanceSelectedPath"));
    -[MTTVGenericSettingsViewController tableView:didSelectRowAtIndexPath:]( self,  "tableView:didSelectRowAtIndexPath:",  v4,  v5);

    -[MTPlaylistSettingsViewController setUserDriven:](self, "setUserDriven:", 1LL);
    -[MTPlaylistSettingsViewController setAppearanceSelectedPath:](self, "setAppearanceSelectedPath:", 0LL);
  }

- (BOOL)isPresentedModally
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController presentingViewController](self, "presentingViewController"));
  if (v3)
  {
    BOOL v4 = 1;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController navigationController](self, "navigationController"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 presentingViewController]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 presentedViewController]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController navigationController](self, "navigationController"));
    BOOL v4 = v7 == v8;
  }

  return v4;
}

- (void)deletePlaylist:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainQueueContext]);

  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_1000D049C;
  v27 = sub_1000D04AC;
  id v28 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000D04B4;
  v19[3] = &unk_1002404B8;
  v22 = &v23;
  id v7 = v6;
  id v20 = v7;
  v21 = self;
  [v7 performBlockAndWait:v19];
  LOBYTE(v6) = -[MTPlaylistSettingsViewController isPresentedModally](self, "isPresentedModally");
  objc_initWeak(&location, self);
  uint64_t v8 = v24[5];
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController library](self, "library"));
  objc_super v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_1000D0510;
  v15 = &unk_100243FE0;
  char v17 = (char)v6;
  objc_copyWeak(&v16, &location);
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController controllerForDeletingStation:fromLibrary:deletionCompletion:]( &OBJC_CLASS___UIAlertController,  "controllerForDeletingStation:fromLibrary:deletionCompletion:",  v8,  v9,  &v12));
  -[MTPlaylistSettingsViewController setDeleteStationAlertController:]( self,  "setDeleteStationAlertController:",  v10,  v12,  v13,  v14,  v15);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController deleteStationAlertController](self, "deleteStationAlertController"));
  -[MTPlaylistSettingsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v23, 8);
}

+ (id)cellClassForSettingType:(int64_t)a3 inGroupWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 5 && (id v8 = [v6 isEqualToString:@"podcasts"], (_DWORD)v8))
  {
    else {
      double v9 = &OBJC_CLASS___MTPlaylistSettingsPodcastGroupCell;
    }
    objc_super v12 = (objc_class *)objc_opt_class(v9);
    uint64_t v13 = NSStringFromClass(v12);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v13);
  }

  else
  {
    v16.receiver = a1;
    v16.super_class = (Class)&OBJC_METACLASS___MTPlaylistSettingsViewController;
    id v10 = objc_msgSendSuper2(&v16, "cellClassForSettingType:inGroupWithIdentifier:", a3, v7);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  }

  v14 = (void *)v11;

  return v14;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MTPlaylistSettingsViewController;
  id v12 = a6;
  -[MTTVGenericSettingsViewController configureCell:atIndexPath:withDescription:inGroupWithIdentifier:]( &v25,  "configureCell:atIndexPath:withDescription:inGroupWithIdentifier:",  v10,  a4,  v11,  v12);
  LODWORD(a4) = objc_msgSend(v12, "isEqualToString:", @"podcasts", v25.receiver, v25.super_class);

  if ((_DWORD)a4 && [v11 type] == (id)5)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___MTPlaylistSettingsPodcastGroupCell);
    if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v10 artworkView]);
      [v15 setArtworkKey:v14];
    }

    else
    {
      [(id)objc_opt_class(self) podcastImageSize];
      double v17 = v16;
      double v19 = v18;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageForKey:size:", v14, v17, v19));

      if (!v15)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "imageForKey:size:", kMTLibraryDefaultImageKey, v17, v19));
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v10 imageView]);
      [v22 setImage:v15];
    }
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  unsigned int v24 = [v23 isEqualToString:@"add"];

  if (v24) {
    [v10 setAccessoryType:1];
  }
}

- (id)newSettingsController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

  v5 = objc_alloc_init(&OBJC_CLASS___MTSettingsController);
  objc_initWeak(&location, self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000D09D4;
  v11[3] = &unk_100244118;
  id v7 = v4;
  id v12 = v7;
  uint64_t v13 = self;
  objc_copyWeak(&v15, &location);
  id v8 = v6;
  id v14 = v8;
  [v7 performBlockAndWait:v11];
  -[MTSettingsController setGroups:](v5, "setGroups:", v8);
  v17[0] = @"station";
  v17[1] = @"include";
  v17[2] = @"podcasts";
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  -[MTSettingsController setOrder:](v5, "setOrder:", v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v5;
}

- (id)titleForCurrentPodcasts
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainOrPrivateContext]);

  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 0;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  uint64_t v29 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000D1DD4;
  v16[3] = &unk_100240670;
  id v5 = v4;
  id v17 = v5;
  double v18 = self;
  double v19 = &v30;
  id v20 = &v26;
  v21 = &v22;
  [v5 performBlockAndWait:v16];
  if (*((_BYTE *)v31 + 24))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"PODCAST_ALL" value:&stru_100248948 table:0]);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"%@ of %@" value:&stru_100248948 table:0]);

    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v27[3]));
    uint64_t v10 = IMAccessibilityLocalizedNumber(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v23[3]));
    uint64_t v13 = IMAccessibilityLocalizedNumber(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v6,  @"%@ %@",  0LL,  v11,  v14));
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v7;
}

- (void)updatePodcastCount
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController titleForCurrentPodcasts](self, "titleForCurrentPodcasts"));
  [v4 setValue:v3 forSettingWithIdentifier:@"add" inGroup:@"podcasts"];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 order]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groups]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v8]);

  if ([v8 isEqualToString:@"podcasts"])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupSettings]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    unsigned __int8 v15 = [v14 isEqualToString:@"add"];

    char v16 = v15 ^ 1;
  }

  else
  {
    char v16 = 0;
  }

  return v16;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1) {
    -[MTPlaylistSettingsViewController removePodcastAtIndex:]( self,  "removePodcastAtIndex:",  (char *)objc_msgSend(a5, "row", a3) - 1);
  }
}

- (void)removePodcastAtIndex:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000D2164;
  v11[3] = &unk_100240710;
  id v12 = v6;
  uint64_t v13 = self;
  unint64_t v14 = a3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v11];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v8 setIsPlaylistSyncDirty:1];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsViewController settingsController](self, "settingsController"));
  [v9 removeSettingAtIndex:a3 + 1 fromGroupWithIdentifier:@"podcasts"];

  -[MTPlaylistSettingsViewController updatePodcastCount](self, "updatePodcastCount");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettingsDidChangeSetting:self];
}

- (void)updateShowSetting:(int64_t)a3 forSettings:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainOrPrivateContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000D2304;
  v13[3] = &unk_100240710;
  id v14 = v8;
  id v15 = v6;
  int64_t v16 = a3;
  id v9 = v6;
  id v10 = v8;
  [v10 performBlockAndWaitWithSave:v13];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v11 setIsPlaylistSyncDirty:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettingsDidChangeSetting:self];
}

- (void)updateSetting:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mainOrPrivateContext]);

  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1000D24D4;
  double v18 = &unk_100240C10;
  id v19 = v9;
  id v20 = self;
  id v21 = v7;
  id v22 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = v9;
  [v12 performBlockAndWaitWithSave:&v15];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SyncKeysRepository shared]( &OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository,  "shared",  v15,  v16,  v17,  v18));
  [v13 setIsPlaylistSyncDirty:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettingsDidChangeSetting:self];
}

- (void)updateContainerOrder:(int)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000D26A8;
  v10[3] = &unk_100244168;
  id v11 = v6;
  id v12 = self;
  int v13 = a3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v10];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v8 setIsPlaylistSyncDirty:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettingsDidChangeSetting:self];
}

- (void)showAddPodcastsSheet
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_1000D049C;
  uint64_t v24 = sub_1000D04AC;
  id v25 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainOrPrivateContext]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000D290C;
  v10[3] = &unk_100243440;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  id v14 = &v20;
  id v15 = &v16;
  id v7 = v3;
  int v13 = v7;
  [v6 performBlockAndWait:v10];
  id v8 = -[MTTVStationSelectPodcastsListViewController initWithStyle:]( objc_alloc(&OBJC_CLASS___MTTVStationSelectPodcastsListViewController),  "initWithStyle:",  1LL);
  -[MTTVStationSelectPodcastsListViewController setSaveDelegate:](v8, "setSaveDelegate:", self);
  -[MTTVStationSelectPodcastsListViewController setPlaylistName:](v8, "setPlaylistName:", v21[5]);
  -[MTTVStationSelectPodcastsListViewController setPodcastUuids:](v8, "setPodcastUuids:", v7);
  -[MTTVStationSelectPodcastsListViewController setAllPodcastsSelected:]( v8,  "setAllPodcastsSelected:",  *((unsigned __int8 *)v17 + 24));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController playlistUuid](self, "playlistUuid"));
  -[MTTVStationSelectPodcastsListViewController setPlaylistUuid:](v8, "setPlaylistUuid:", v9);

  -[MTPlaylistSettingsViewController setAddPodcastsViewController:](self, "setAddPodcastsViewController:", v8);
  -[MTPlaylistSettingsViewController showViewController:sender:](self, "showViewController:sender:", v8, self);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

- (void)saveNewPlaylists
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainOrPrivateContext]);

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000D2B74;
  v6[3] = &unk_1002412B0;
  id v5 = v4;
  id v7 = v5;
  id v8 = self;
  objc_copyWeak(&v9, &location);
  [v5 performBlock:v6];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)sourceList:(id)a3 didSelectItemUuid:(id)a4 atIndexPath:(id)a5
{
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void)_updateUngroupedListSetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000D2F84;
  v10[3] = &unk_100241458;
  id v11 = v6;
  id v12 = self;
  BOOL v13 = v3;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v10];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v8 setIsPlaylistSyncDirty:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettings:self didChangeLayout:!v3];
}

- (id)metricsName
{
  return @"PlaylistSettings";
}

- (id)metricDataSource
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainOrPrivateContext]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsViewController playlistUuid](self, "playlistUuid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 playlistForUuid:v5]);

  return v6;
}

- (void)syncControllerOperationCompleted:(id)a3
{
  id v4 = -[MTPlaylistSettingsViewController newSettingsController](self, "newSettingsController", a3);
  -[MTGenericSettingsViewController setSettingsController:](self, "setSettingsController:", v4);
}

- (void)updateTitle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000D31DC;
  v11[3] = &unk_100240980;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v4;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlockAndWaitWithSave:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained playlistSettingsDidChangeSetting:self];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v10 setIsPlaylistSyncDirty:1];
}

+ (CGSize)podcastImageSize
{
  double v2 = 30.0;
  double v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MTPlaylistSettingsViewControllerDelegate)delegate
{
  return (MTPlaylistSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)playlistUuid
{
  return self->_playlistUuid;
}

- (void)setPlaylistUuid:(id)a3
{
}

- (id)deletePlaylistBlock
{
  return self->_deletePlaylistBlock;
}

- (void)setDeletePlaylistBlock:(id)a3
{
}

- (BOOL)userDriven
{
  return self->_userDriven;
}

- (void)setUserDriven:(BOOL)a3
{
  self->_userDriven = a3;
}

- (NSIndexPath)appearanceSelectedPath
{
  return self->_appearanceSelectedPath;
}

- (void)setAppearanceSelectedPath:(id)a3
{
}

- (MTLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (id)addPodcastsViewController
{
  return self->_addPodcastsViewController;
}

- (void)setAddPodcastsViewController:(id)a3
{
}

- (UIAlertController)deleteStationAlertController
{
  return self->_deleteStationAlertController;
}

- (void)setDeleteStationAlertController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end