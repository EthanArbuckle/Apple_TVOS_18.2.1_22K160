@interface UIViewController
+ (id)tvh_mediaEntityCollectionViewControllerForMediaItem:(id)a3 mediaEntityCollectionType:(unint64_t)a4;
- (BOOL)tvh_ppt_isLoading;
- (NSCopying)tvh_identifier;
- (NSString)tvh_fetchControllerIdentifier;
- (TVHMediaLibrariesEnviroment)tvh_mediaLibrariesEnviroment;
- (TVHPlaybackManager)tvh_playbackManager;
- (UIViewController)tvh_fullViewChildViewController;
- (id)tvh_addFocusGuideFromView:(id)a3 toViews:(id)a4 withDirection:(unint64_t)a5;
- (id)tvh_customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4;
- (id)tvh_customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4;
- (void)_tvh_removeFullViewChildViewController;
- (void)_tvh_setFullViewChildViewController:(id)a3;
- (void)tvh_setFetchControllerIdentifier:(id)a3;
- (void)tvh_setFullViewChildViewController:(id)a3;
- (void)tvh_setIdentifier:(id)a3;
@end

@implementation UIViewController

- (BOOL)tvh_ppt_isLoading
{
  return 0;
}

- (TVHMediaLibrariesEnviroment)tvh_mediaLibrariesEnviroment
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVHApplicationDelegate sharedApplicationDelegate]( &OBJC_CLASS___TVHApplicationDelegate,  "sharedApplicationDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainSceneDelegate]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 rootViewController]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaLibrariesEnviroment]);
  return (TVHMediaLibrariesEnviroment *)v5;
}

- (TVHPlaybackManager)tvh_playbackManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController tvh_mediaLibrariesEnviroment](self, "tvh_mediaLibrariesEnviroment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playbackManager]);

  return (TVHPlaybackManager *)v3;
}

- (void)tvh_setIdentifier:(id)a3
{
}

- (NSCopying)tvh_identifier
{
  return (NSCopying *)objc_getAssociatedObject(self, "Identifier");
}

- (void)tvh_setFetchControllerIdentifier:(id)a3
{
}

- (NSString)tvh_fetchControllerIdentifier
{
  return (NSString *)objc_getAssociatedObject(self, "FetchControllerIdentifier");
}

- (UIViewController)tvh_fullViewChildViewController
{
  return (UIViewController *)objc_getAssociatedObject(self, "FullViewChildViewControllerIdentifier");
}

- (void)tvh_setFullViewChildViewController:(id)a3
{
  id v8 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[UIViewController tvh_fullViewChildViewController](self, "tvh_fullViewChildViewController"));

  if (v4 != v8)
  {
    -[UIViewController _tvh_removeFullViewChildViewController](self, "_tvh_removeFullViewChildViewController");
    if (v8)
    {
      -[UIViewController addChildViewController:](self, "addChildViewController:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
      [v6 bounds];
      objc_msgSend(v5, "setFrame:");

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
      [v7 addSubview:v5];

      [v8 didMoveToParentViewController:self];
      -[UIViewController _tvh_setFullViewChildViewController:](self, "_tvh_setFullViewChildViewController:", v8);
    }
  }
}

- (id)tvh_customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4
{
  id v4 = off_1000FC4E0;
  if (a3 != 2) {
    id v4 = &off_1000FC4F0;
  }
  return (id)objc_opt_new(*v4, a2);
}

- (id)tvh_customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4
{
  id v4 = off_1000FC4E0;
  if (a3 != 2) {
    id v4 = &off_1000FC4F0;
  }
  return (id)objc_opt_new(*v4, a2);
}

- (id)tvh_addFocusGuideFromView:(id)a3 toViews:(id)a4 withDirection:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  [v11 addLayoutGuide:v10];

  -[UIFocusGuide setPreferredFocusEnvironments:](v10, "setPreferredFocusEnvironments:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide widthAnchor](v10, "widthAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 widthAnchor]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v13]);
  [v14 setActive:1];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide heightAnchor](v10, "heightAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 heightAnchor]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v16]);
  [v17 setActive:1];

  switch(a5)
  {
    case 1uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide bottomAnchor](v10, "bottomAnchor"));
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 topAnchor]);
      goto LABEL_7;
    case 2uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v10, "topAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v8 topAnchor]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21]);
      [v22 setActive:1];

      uint64_t v23 = objc_claimAutoreleasedReturnValue(-[UIFocusGuide rightAnchor](v10, "rightAnchor"));
      goto LABEL_8;
    case 4uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v10, "topAnchor"));
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 bottomAnchor]);
LABEL_7:
      v26 = (void *)v19;
      v27 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v19]);
      [v27 setActive:1];

      uint64_t v23 = objc_claimAutoreleasedReturnValue(-[UIFocusGuide leftAnchor](v10, "leftAnchor"));
LABEL_8:
      v25 = (void *)v23;
      uint64_t v28 = objc_claimAutoreleasedReturnValue([v8 leftAnchor]);
      goto LABEL_10;
    case 8uLL:
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v10, "topAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v8 topAnchor]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v30]);
      [v31 setActive:1];

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leftAnchor](v10, "leftAnchor"));
      uint64_t v28 = objc_claimAutoreleasedReturnValue([v8 rightAnchor]);
LABEL_10:
      v32 = (void *)v28;
      v33 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v28]);
      [v33 setActive:1];

      break;
    default:
      id v24 = sub_10007A1C8();
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
        sub_10009CE04((os_log_t)v25);
      }
      break;
  }

  return v10;
}

+ (id)tvh_mediaEntityCollectionViewControllerForMediaItem:(id)a3 mediaEntityCollectionType:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
    id v8 = [v7 mediaCategoryType];

    id v9 = 0LL;
    if (a4 - 3 >= 0xFFFFFFFFFFFFFFFELL && v8 == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvh_mediaLibrary"));
      if (!v10)
      {
        id v9 = 0LL;
LABEL_15:

        goto LABEL_16;
      }

      if (a4 == 1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v6 albumIdentifier]);
        if (v11)
        {
          v12 = -[TVHMusicAlbumLookupViewController initWithAlbumIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicAlbumLookupViewController),  "initWithAlbumIdentifier:mediaLibrary:",  v11,  v10);
LABEL_12:
          id v9 = v12;
LABEL_14:

          goto LABEL_15;
        }
      }

      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v6 albumArtistIdentifier]);
        if (v11)
        {
          v12 = -[TVHMusicAlbumArtistLookupViewController initWithAlbumArtistIdentifier:mediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMusicAlbumArtistLookupViewController),  "initWithAlbumArtistIdentifier:mediaLibrary:",  v11,  v10);
          goto LABEL_12;
        }
      }

      id v9 = 0LL;
      goto LABEL_14;
    }
  }

  else
  {
    id v9 = 0LL;
  }

- (void)_tvh_removeFullViewChildViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController tvh_fullViewChildViewController](self, "tvh_fullViewChildViewController"));
  if (v3)
  {
    id v5 = v3;
    [v3 willMoveToParentViewController:0];
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
    [v4 removeFromSuperview];

    [v5 removeFromParentViewController];
    -[UIViewController _tvh_setFullViewChildViewController:](self, "_tvh_setFullViewChildViewController:", 0LL);
    v3 = v5;
  }
}

- (void)_tvh_setFullViewChildViewController:(id)a3
{
}

@end