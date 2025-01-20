@interface MTAddPodcastOrStationController
- (BOOL)userHasSomePodcasts;
- (MTAddPodcastOrStationController)init;
- (UIAlertController)alertController;
- (id)createAndSaveStationWithTitle:(id)a3;
- (id)plusButtonItem;
- (id)presentingViewController;
- (void)dismissAllModalsAnimated:(BOOL)a3;
- (void)performSubscribe:(id)a3;
- (void)plusButtonPressed:(id)a3;
- (void)presentAddPodcastUI;
- (void)presentAddPodcastUIWithUrl:(id)a3;
- (void)presentAddStationUI;
- (void)presentStationWithTitle:(id)a3;
- (void)setAlertController:(id)a3;
@end

@implementation MTAddPodcastOrStationController

- (MTAddPodcastOrStationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTAddPodcastOrStationController;
  v2 = -[MTAddPodcastOrStationController init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)plusButtonItem
{
  plusButtonItem = self->_plusButtonItem;
  if (!plusButtonItem)
  {
    v4 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]( objc_alloc(&OBJC_CLASS___UIBarButtonItem),  "initWithBarButtonSystemItem:target:action:",  4LL,  self,  "plusButtonPressed:");
    v5 = self->_plusButtonItem;
    self->_plusButtonItem = v4;

    plusButtonItem = self->_plusButtonItem;
  }

  return plusButtonItem;
}

- (void)plusButtonPressed:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"Add Podcast" value:&stru_100248948 table:0]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"Add Station" value:&stru_100248948 table:0]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"Cancel" value:&stru_100248948 table:0]);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  0LL,  0LL));
  -[MTAddPodcastOrStationController setAlertController:](self, "setAlertController:", v11);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10005E688;
  v23[3] = &unk_100241F90;
  v23[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  0LL,  v23));
  [v11 addAction:v12];

  if (-[MTAddPodcastOrStationController userHasSomePodcasts](self, "userHasSomePodcasts"))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10005E690;
    v22[3] = &unk_100241F90;
    v22[4] = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  0LL,  v22));
    [v11 addAction:v13];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  1LL,  0LL));
  [v11 addAction:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 popoverPresentationController]);
  [v15 setBarButtonItem:v4];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](&OBJC_CLASS___UIColor, "appTintColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
  [v17 setTintColor:v16];

  [v11 setModalPresentationStyle:2];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAddPodcastOrStationController presentingViewController](self, "presentingViewController"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10005E698;
  v20[3] = &unk_10023FF98;
  id v21 = v11;
  id v19 = v11;
  [v18 presentViewController:v19 animated:1 completion:v20];
}

- (void)presentAddPodcastUI
{
}

- (void)presentAddPodcastUIWithUrl:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"Add Podcast" value:&stru_100248948 table:0]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"ADD_PODCAST_MESSAGE" value:&stru_100248948 table:0]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"Follow" value:&stru_100248948 table:0]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"Cancel" value:&stru_100248948 table:0]);

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));
  -[MTAddPodcastOrStationController setAlertController:](self, "setAlertController:", v13);
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x3032000000LL;
  v27[3] = sub_10005E9F0;
  v27[4] = sub_10005EA00;
  id v28 = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10005EA08;
  v24[3] = &unk_100242268;
  v26 = v27;
  id v14 = v4;
  id v25 = v14;
  [v13 addTextFieldWithConfigurationHandler:v24];
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  0LL));
  [v13 addAction:v15];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10005EA78;
  v23[3] = &unk_100242290;
  v23[4] = self;
  void v23[5] = v27;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  0LL,  v23));
  [v13 addAction:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](&OBJC_CLASS___UIColor, "appTintColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
  [v18 setTintColor:v17];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](&OBJC_CLASS___MTApplication, "appController"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10005EBA4;
  v21[3] = &unk_100240240;
  v21[4] = self;
  id v20 = v13;
  id v22 = v20;
  [v19 dismissNowPlayingAnimated:1 completion:v21];

  _Block_object_dispose(v27, 8);
}

- (void)performSubscribe:(id)a3
{
  id v3 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___MTAddPodcastParams);
  -[MTAddPodcastParams setUrl:](v5, "setUrl:", v3);

  -[MTAddPodcastParams setUserInitiated:](v5, "setUserInitiated:", 1LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTSubscriptionManager sharedInstance](&OBJC_CLASS___MTSubscriptionManager, "sharedInstance"));
  [v4 subscribeToPodcastWithParams:v5];
}

- (void)presentAddStationUI
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"NEW_PLAYLIST_ALERT" value:&stru_100248948 table:0]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"Save Playlist" value:&stru_100248948 table:0]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"Cancel" value:&stru_100248948 table:0]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"TITLE_PLACEHOLDER" value:&stru_100248948 table:0]);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  &stru_100248948,  1LL));
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x3032000000LL;
  v26[3] = sub_10005E9F0;
  v26[4] = sub_10005EA00;
  id v27 = 0LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10005EF74;
  v23[3] = &unk_1002422B8;
  id v12 = v10;
  id v24 = v12;
  id v25 = v26;
  [v11 addTextFieldWithConfigurationHandler:v23];
  id v19 = (void *)v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  1LL,  0LL));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10005EFBC;
  v22[3] = &unk_100242290;
  v22[4] = self;
  void v22[5] = v26;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  0LL,  v22));
  [v11 addAction:v13];
  [v11 addAction:v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](&OBJC_CLASS___UIColor, "appTintColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
  [v16 setTintColor:v15];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](&OBJC_CLASS___MTApplication, "appController"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10005F04C;
  v20[3] = &unk_100240240;
  void v20[4] = self;
  id v18 = v11;
  id v21 = v18;
  [v17 dismissNowPlayingAnimated:1 completion:v20];

  _Block_object_dispose(v26, 8);
}

- (void)presentStationWithTitle:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTAddPodcastOrStationController createAndSaveStationWithTitle:]( self,  "createAndSaveStationWithTitle:",  v6));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](&OBJC_CLASS___MTApplication, "appController"));
    [v5 presentStation:v4 new:1];
  }
}

- (id)createAndSaveStationWithTitle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainOrPrivateContext]);

  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x3032000000LL;
  v25[3] = sub_10005E9F0;
  v25[4] = sub_10005EA00;
  id v26 = 0LL;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_10005E9F0;
  v23 = sub_10005EA00;
  id v24 = 0LL;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_10005F28C;
  id v14 = &unk_100241ED8;
  v17 = &v19;
  id v6 = v5;
  id v15 = v6;
  id v7 = v3;
  id v16 = v7;
  id v18 = v25;
  [v6 performBlockAndWaitWithSave:&v11];
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[SyncKeysRepository shared]( &OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository,  "shared",  v11,  v12,  v13,  v14));
  [v8 setIsPlaylistSyncDirty:1];

  id v9 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(v25, 8);
  return v9;
}

- (id)presentingViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](&OBJC_CLASS___MTApplication, "appController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 rootViewController]);

  return v3;
}

- (BOOL)userHasSomePodcasts
{
  v2 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
  id v3 = -[NSFetchRequest initWithEntityName:](v2, "initWithEntityName:", kMTPodcastEntityName);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts]( &OBJC_CLASS___MTPodcast,  "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  -[NSFetchRequest setPredicate:](v3, "setPredicate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainQueueContext]);
  uint64_t v11 = 0LL;
  id v7 = [v6 countForFetchRequest:v3 error:&v11];

  BOOL v9 = v7 != (id)0x7FFFFFFFFFFFFFFFLL && v7 != 0LL;
  return v9;
}

- (void)dismissAllModalsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAddPodcastOrStationController alertController](self, "alertController"));

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAddPodcastOrStationController alertController](self, "alertController"));
    [v6 dismissViewControllerAnimated:v3 completion:0];
  }

- (UIAlertController)alertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_alertController);
}

- (void)setAlertController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end