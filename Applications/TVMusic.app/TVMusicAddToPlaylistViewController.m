@interface TVMusicAddToPlaylistViewController
+ (void)_presentAddToPlaylistBehaviorDialogFromViewController:(id)a3 forSingleTrackAddition:(BOOL)a4 withCompletionHandler:(id)a5;
- (BOOL)_isTopLevelMenu;
- (BOOL)hideNewPlaylistOption;
- (MPModelGenericObject)objectToAdd;
- (MPModelLibraryRequest)mpRequest;
- (MPModelPlaylist)folderPlaylist;
- (MPSectionedCollection)collectionTracks;
- (NSString)itemNameToAdd;
- (TVMusicAddToPlaylistActionGroupView)actionGroupView;
- (TVMusicAddToPlaylistViewController)init;
- (TVMusicAddToPlaylistViewController)initWithItemName:(id)a3 completion:(id)a4;
- (TVMusicAddToPlaylistViewController)initWithObjectToAdd:(id)a3;
- (UIActivityIndicatorView)spinner;
- (UILabel)actionTitleLabel;
- (UIScrollView)actionScrollView;
- (id)_nameOfObjectToAdd;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)selectedPlaylistHandler;
- (void)_addToNewPlaylistNamed:(id)a3 parentPlaylist:(id)a4;
- (void)_addToPlaylist:(id)a3;
- (void)_addToPlaylist:(id)a3 objectToAdd:(id)a4;
- (void)_addToPlaylist:(id)a3 objectToAdd:(id)a4 songsToAdd:(id)a5;
- (void)_addToPlaylist:(id)a3 requestConfirmation:(BOOL)a4;
- (void)_configureViewWithMPResponse:(id)a3;
- (void)_dismissViewController:(id)a3;
- (void)_dismissViewControllerAnimated:(BOOL)a3;
- (void)_getSongsForAlbum:(id)a3;
- (void)_getSongsForPlaylist:(id)a3;
- (void)_handlePlayPauseGesture;
- (void)_presentViewController:(id)a3;
- (void)didSelectPlaylist:(id)a3;
- (void)setActionGroupView:(id)a3;
- (void)setActionScrollView:(id)a3;
- (void)setActionTitleLabel:(id)a3;
- (void)setCollectionTracks:(id)a3;
- (void)setFolderPlaylist:(id)a3;
- (void)setHideNewPlaylistOption:(BOOL)a3;
- (void)setItemNameToAdd:(id)a3;
- (void)setMpRequest:(id)a3;
- (void)setObjectToAdd:(id)a3;
- (void)setSelectedPlaylistHandler:(id)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVMusicAddToPlaylistViewController

- (TVMusicAddToPlaylistViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicAddToPlaylistViewController;
  v2 = -[TVMusicAddToPlaylistViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", 0LL, 0LL);
  v3 = v2;
  if (v2)
  {
    -[TVMusicAddToPlaylistViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 4LL);
    -[TVMusicAddToPlaylistViewController setTransitioningDelegate:](v3, "setTransitioningDelegate:", v3);
    -[TVMusicAddToPlaylistViewController setTitle:](v3, "setTitle:", &stru_100279068);
  }

  return v3;
}

- (TVMusicAddToPlaylistViewController)initWithObjectToAdd:(id)a3
{
  id v5 = a3;
  v6 = -[TVMusicAddToPlaylistViewController init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_objectToAdd, a3);
    if (qword_1002BE798 != -1) {
      dispatch_once(&qword_1002BE798, &stru_1002699D0);
    }
  }

  return v7;
}

- (TVMusicAddToPlaylistViewController)initWithItemName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[TVMusicAddToPlaylistViewController initWithObjectToAdd:](self, "initWithObjectToAdd:", 0LL);
  v9 = v8;
  if (v8)
  {
    -[TVMusicAddToPlaylistViewController setItemNameToAdd:](v8, "setItemNameToAdd:", v6);
    -[TVMusicAddToPlaylistViewController setSelectedPlaylistHandler:](v9, "setSelectedPlaylistHandler:", v7);
  }

  return v9;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVMusicAddToPlaylistViewController;
  -[TVMusicAddToPlaylistViewController viewDidLoad](&v27, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController objectToAdd](self, "objectToAdd"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController objectToAdd](self, "objectToAdd"));
    id v5 = [v4 type];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController objectToAdd](self, "objectToAdd"));
    id v7 = v6;
    if (v5 == (id)4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 playlist]);
      -[TVMusicAddToPlaylistViewController _getSongsForPlaylist:](self, "_getSongsForPlaylist:", v8);
LABEL_6:

      goto LABEL_7;
    }

    id v9 = [v6 type];

    if (v9 == (id)2)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController objectToAdd](self, "objectToAdd"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 album]);
      -[TVMusicAddToPlaylistViewController _getSongsForAlbum:](self, "_getSongsForAlbum:", v8);
      goto LABEL_6;
    }
  }

- (void)viewDidLayoutSubviews
{
  v119.receiver = self;
  v119.super_class = (Class)&OBJC_CLASS___TVMusicAddToPlaylistViewController;
  -[TVMusicAddToPlaylistViewController viewDidLayoutSubviews](&v119, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController spinner](self, "spinner"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController spinner](self, "spinner"));
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
    id v14 = [v13 bounds];
    double v19 = UIRectCenteredIntegralRect(v14, v6, v8, v10, v12, v15, v16, v17, v18);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController spinner](self, "spinner"));
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);
  }

  uint64_t v27 = objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
  if (v27)
  {
    v28 = (void *)v27;
    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView"));
    if (v29)
    {
      v30 = (void *)v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionGroupView](self, "actionGroupView"));

      if (!v31) {
        return;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
      [v32 safeAreaInsets];
      uint64_t v112 = v33;
      double v114 = v34;
      double v36 = v35;
      double v38 = v37;

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionGroupView](self, "actionGroupView"));
      [v39 intrinsicContentSize];
      double v41 = v40;
      double v43 = v42;

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
      [v44 intrinsicContentSize];
      double v46 = v45;

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
      v48 = (void *)objc_claimAutoreleasedReturnValue([v47 font]);
      [v48 descender];
      double v50 = v49 + 22.0;

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
      v52 = (void *)objc_claimAutoreleasedReturnValue([v51 font]);
      [v52 pointSize];
      double v54 = 72.0 - v53;

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
      [v55 bounds];
      double v56 = CGRectGetWidth(v120) - v36 - v38 + -100.0 + -100.0;

      if (v56 >= v41) {
        double v57 = v41;
      }
      else {
        double v57 = v56;
      }
      if (v57 >= 410.0) {
        double v58 = v57;
      }
      else {
        double v58 = 410.0;
      }
      double v116 = v43;
      double v59 = v43 + 30.0 + 60.0;
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView", v112));
      objc_msgSend(v60, "setContentSize:", v58, v59);

      v61 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
      [v61 bounds];
      double v117 = v36;
      double v118 = v38;
      double v62 = CGRectGetWidth(v121) - v36 - v38;

      double v115 = v58;
      if (v62 >= v58 + 100.0 + 100.0) {
        double v63 = v58 + 100.0 + 100.0;
      }
      else {
        double v63 = v62;
      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
      [v64 bounds];
      double v65 = v50;
      double v66 = CGRectGetHeight(v122) - v113 - v114 - v46 - v50 - v54;

      if (v66 <= v59)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
        [v83 bounds];
        double v88 = UIRectCenteredXInRect(0.0, v113 + v46 + v50 + v54, v63, v66, v84, v85, v86, v87);
        double v90 = v89;
        double v92 = v91;
        double v94 = v93;
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView"));
        objc_msgSend(v95, "setFrame:", v88, v90, v92, v94);

        double x = CGPointZero.x;
        double y = CGPointZero.y;
      }

      else
      {
        double x = CGPointZero.x;
        double y = CGPointZero.y;
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
        id v70 = [v69 bounds];
        double v75 = UIRectCenteredIntegralRect(v70, CGPointZero.x, y, v63, v59, v71, v72, v73, v74);
        double v77 = v76;
        double v79 = v78;
        double v81 = v80;
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView"));
        objc_msgSend(v82, "setFrame:", v75, v77, v79, v81);
      }

      double v96 = v65;
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView"));
      [v97 frame];
      double v100 = UIRectCenteredXInRect(0.0, 30.0, v115, v116, x, y, v98, v99);
      double v102 = v101;
      double v104 = v103;
      double v106 = v105;
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionGroupView](self, "actionGroupView"));
      objc_msgSend(v107, "setFrame:", v100, v102, v104, v106);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView"));
      [v28 frame];
      CGFloat v108 = CGRectGetMinY(v123) - v46 - v96;
      v109 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
      [v109 bounds];
      CGFloat v110 = CGRectGetWidth(v124) - v117 - v118;
      v111 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
      objc_msgSend(v111, "setFrame:", v117, v108, v110, v46);
    }
  }

- (void)didSelectPlaylist:(id)a3
{
  id v9 = a3;
  if ([v9 type] == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController selectedPlaylistHandler](self, "selectedPlaylistHandler"));

    double v5 = objc_alloc(&OBJC_CLASS___TVMusicAddToPlaylistViewController);
    if (v4)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController itemNameToAdd](self, "itemNameToAdd"));
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController selectedPlaylistHandler](self, "selectedPlaylistHandler"));
      double v8 = -[TVMusicAddToPlaylistViewController initWithItemName:completion:]( v5,  "initWithItemName:completion:",  v6,  v7);
    }

    else
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController objectToAdd](self, "objectToAdd"));
      double v8 = -[TVMusicAddToPlaylistViewController initWithObjectToAdd:](v5, "initWithObjectToAdd:", v6);
    }

    -[TVMusicAddToPlaylistViewController setFolderPlaylist:](v8, "setFolderPlaylist:", v9);
    -[TVMusicAddToPlaylistViewController setHideNewPlaylistOption:](v8, "setHideNewPlaylistOption:", 1LL);
    -[TVMusicAddToPlaylistViewController _presentViewController:](self, "_presentViewController:", v8);
  }

  else
  {
    -[TVMusicAddToPlaylistViewController _addToPlaylist:requestConfirmation:]( self,  "_addToPlaylist:requestConfirmation:",  v9,  1LL);
  }
}

- (void)_addToPlaylist:(id)a3 requestConfirmation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = v6;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    double v10 = sub_10001BE38;
    double v11 = &unk_100268B30;
    double v12 = self;
    id v13 = v6;
    double v8 = v9;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      v10((uint64_t)v8);
    }

    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001E054;
      block[3] = &unk_100268D60;
      double v15 = v8;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

  else
  {
    -[TVMusicAddToPlaylistViewController _addToPlaylist:](self, "_addToPlaylist:", v6);
  }
}

- (void)_addToPlaylist:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0LL;
  double v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10001C2E4;
  v16[3] = &unk_100269A48;
  double v18 = &v19;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController objectToAdd](self, "objectToAdd"));
  id v17 = v5;
  +[MPModelObject performWithoutEnforcement:](&OBJC_CLASS___MPModelObject, "performWithoutEnforcement:", v16);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLibraryManager sharedInstance](&OBJC_CLASS___TVMusicLibraryManager, "sharedInstance"));
  id v7 = [v6 cloudAddToPlaylistBehavior];

  if (*((_BYTE *)v20 + 24) || v7)
  {
    -[TVMusicAddToPlaylistViewController _addToPlaylist:objectToAdd:](self, "_addToPlaylist:objectToAdd:", v4, v5);
  }

  else
  {
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    double v11 = sub_10001C360;
    double v12 = &unk_1002691D8;
    id v13 = v5;
    id v14 = self;
    id v15 = v4;
    double v8 = &v9;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread", v9, v10))
    {
      v11((uint64_t)v8);
    }

    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001E054;
      block[3] = &unk_100268D60;
      double v24 = v8;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

  _Block_object_dispose(&v19, 8);
}

- (void)_addToPlaylist:(id)a3 objectToAdd:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 type] == (id)4 || objc_msgSend(v7, "type") == (id)2)
  {
    double v8 = (dispatch_queue_s *)qword_1002BE7A0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C518;
    block[3] = &unk_1002691D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }

  else
  {
    -[TVMusicAddToPlaylistViewController _addToPlaylist:objectToAdd:songsToAdd:]( self,  "_addToPlaylist:objectToAdd:songsToAdd:",  v6,  v7,  0LL);
  }
}

- (void)_addToPlaylist:(id)a3 objectToAdd:(id)a4 songsToAdd:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController selectedPlaylistHandler](self, "selectedPlaylistHandler"));

  if (!v11)
  {
    id v13 = [v9 type];
    if (v13 == (id)4)
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue([v9 playlist]);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10001CA84;
      v22[3] = &unk_100269A98;
      id v23 = v9;
      id v24 = v8;
      +[TVMusicLibraryUtilities addPlaylist:toPlaylist:songsToAdd:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "addPlaylist:toPlaylist:songsToAdd:completionHandler:",  v16,  v24,  v10,  v22);

      id v15 = v23;
    }

    else if (v13 == (id)2)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 album]);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10001C994;
      v25[3] = &unk_100269A98;
      id v26 = v9;
      id v27 = v8;
      +[TVMusicLibraryUtilities addAlbum:toPlaylist:songsToAdd:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "addAlbum:toPlaylist:songsToAdd:completionHandler:",  v17,  v27,  v10,  v25);

      id v15 = v26;
    }

    else
    {
      if (v13 != (id)1)
      {
        uint64_t v19 = off_1002B5B18;
        if (!os_log_type_enabled((os_log_t)off_1002B5B18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_11;
        }
        double v12 = v19;
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v9 anyObject]);
        LODWORD(block) = 138412290;
        *(void *)((char *)&block + 4) = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unsupported object type for adding to playlist: %@",  (uint8_t *)&block,  0xCu);

        goto LABEL_3;
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 song]);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10001C8A4;
      v28[3] = &unk_100269A98;
      id v29 = v9;
      id v30 = v8;
      +[TVMusicLibraryUtilities addSong:toPlaylist:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "addSong:toPlaylist:completionHandler:",  v14,  v30,  v28);

      id v15 = v29;
    }

    goto LABEL_11;
  }

  double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController selectedPlaylistHandler](self, "selectedPlaylistHandler"));
  (*((void (**)(os_log_s *, id))v12 + 2))(v12, v8);
LABEL_3:

LABEL_11:
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001CB74;
  v21[3] = &unk_100268CF0;
  v21[4] = self;
  double v18 = v21;
  *(void *)&__int128 block = _NSConcreteStackBlock;
  *((void *)&block + 1) = 3221225472LL;
  v32 = sub_10001E048;
  uint64_t v33 = &unk_100268D60;
  id v34 = v18;
  dispatch_async(&_dispatch_main_q, &block);
}

- (void)_dismissViewController:(id)a3
{
  id v4 = (TVMusicAddToPlaylistViewController *)objc_claimAutoreleasedReturnValue([a3 object]);

  if (v4 != self)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController presentingViewController](self, "presentingViewController"));
    [v5 dismissViewControllerAnimated:0 completion:0];
  }

- (void)_dismissViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController presentingViewController](self, "presentingViewController"));
  [v5 dismissViewControllerAnimated:v3 completion:0];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"TVMusicDismissAddToPlaylist" object:self];
}

- (id)_nameOfObjectToAdd
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController objectToAdd](self, "objectToAdd"));

  if (!v3)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController itemNameToAdd](self, "itemNameToAdd"));
    goto LABEL_15;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController objectToAdd](self, "objectToAdd"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 anyObject]);

  if ((objc_opt_respondsToSelector(v5, "title") & 1) != 0)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 title]);
  }

  else
  {
    if ((objc_opt_respondsToSelector(v5, "name") & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 name]);
  }

  uint64_t v8 = v6;
  if (!v6)
  {
LABEL_8:
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPModelAlbum, v7);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    {
      id v10 = v5;
      if ([v10 trackCount] == (id)1)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 representativeSong]);
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v11 title]);
      }

      else
      {
        uint64_t v8 = 0LL;
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

LABEL_15:
  if (v8) {
    double v12 = (__CFString *)v8;
  }
  else {
    double v12 = &stru_100279068;
  }
  return v12;
}

- (void)_getSongsForPlaylist:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)qword_1002BE7A0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001CE10;
  v7[3] = &unk_100268B30;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_getSongsForAlbum:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)qword_1002BE7A0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001CFF4;
  v7[3] = &unk_100268B30;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_presentViewController:(id)a3
{
}

- (void)_configureViewWithMPResponse:(id)a3
{
  id v5 = a3;
  if (!self->_alertControllerIsConfigured)
  {
    self->_alertControllerIsConfigured = 1;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController spinner](self, "spinner"));
    [v6 removeFromSuperview];

    -[TVMusicAddToPlaylistViewController setSpinner:](self, "setSpinner:", 0LL);
    uint64_t v7 = objc_alloc(&OBJC_CLASS___UIScrollView);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
    [v8 bounds];
    uint64_t v9 = -[UIScrollView initWithFrame:](v7, "initWithFrame:");
    -[TVMusicAddToPlaylistViewController setActionScrollView:](self, "setActionScrollView:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView"));
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView"));
    objc_msgSend(v11, "_setGradientMaskLengths:", 50.0, 0.0, 50.0, 0.0);

    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView"));
    [v12 setContentInsetAdjustmentBehavior:2];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView"));
    [v13 addSubview:v14];

    id v15 = objc_alloc(&OBJC_CLASS___TVMusicAddToPlaylistActionGroupView);
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
    [v16 bounds];
    id v17 = -[TVMusicAddToPlaylistActionGroupView initWithFrame:](v15, "initWithFrame:");
    -[TVMusicAddToPlaylistViewController setActionGroupView:](self, "setActionGroupView:", v17);

    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionScrollView](self, "actionScrollView"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionGroupView](self, "actionGroupView"));
    [v18 addSubview:v19];

    objc_initWeak(&location, self);
    if (!-[TVMusicAddToPlaylistViewController hideNewPlaylistOption](self, "hideNewPlaylistOption"))
    {
      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionGroupView](self, "actionGroupView"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedStringForKey:@"NewPlaylist" value:&stru_100279068 table:0]);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_10001D65C;
      v44[3] = &unk_100269B10;
      objc_copyWeak(&v45, &location);
      [v20 addActionWithText:v3 isFolder:0 handler:v44];

      objc_destroyWeak(&v45);
    }

    char v22 = (void *)objc_claimAutoreleasedReturnValue([v5 results]);
    double v38 = _NSConcreteStackBlock;
    uint64_t v39 = 3221225472LL;
    double v40 = sub_10001D748;
    double v41 = &unk_100269B38;
    double v42 = self;
    objc_copyWeak(&v43, &location);
    objc_msgSend(v22, "tvm_enumerateItemsUsingBlock:", &v38);

    id v23 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[TVMusicAddToPlaylistViewController setActionTitleLabel:]( self,  "setActionTitleLabel:",  v23,  v38,  v39,  v40,  v41,  v42);

    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
    [v25 setFont:v24];

    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
    [v26 setLineBreakMode:4];

    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
    [v27 setNumberOfLines:1];

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController folderPlaylist](self, "folderPlaylist"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 name]);
    id v30 = v29;
    if (!v29)
    {
      BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v30 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"AddToAPlaylist" value:&stru_100279068 table:0]);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
    [v31 setText:v30];

    if (!v29)
    {
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
    [v32 setTextAlignment:1];

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
    [v34 setTextColor:v33];

    double v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController view](self, "view"));
    double v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController actionTitleLabel](self, "actionTitleLabel"));
    [v36 addSubview:v37];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
}

- (void)_addToNewPlaylistNamed:(id)a3 parentPlaylist:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001D92C;
  v6[3] = &unk_100269B60;
  v6[4] = self;
  id v7 = a3;
  id v5 = v7;
  +[TVMusicLibraryUtilities createPlaylistWithName:parentPlaylist:completion:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "createPlaylistWithName:parentPlaylist:completion:",  v5,  a4,  v6);
}

- (BOOL)_isTopLevelMenu
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistViewController folderPlaylist](self, "folderPlaylist"));
  BOOL v3 = v2 == 0LL;

  return v3;
}

+ (void)_presentAddToPlaylistBehaviorDialogFromViewController:(id)a3 forSingleTrackAddition:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v23 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v9 = v8;
  if (v5) {
    id v10 = @"PLAYLIST_ADD_BEHAVIOR_ALERT_TITLE_SINGULAR";
  }
  else {
    id v10 = @"PLAYLIST_ADD_BEHAVIOR_ALERT_TITLE_PLURAL";
  }
  char v22 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_100279068 table:0]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"PLAYLIST_ADD_BEHAVIOR_ALERT_MESSAGE" value:&stru_100279068 table:0]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v22,  v12,  1LL));

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"PLAYLIST_ADD_BEHAVIOR_ADD_BUTTON" value:&stru_100279068 table:0]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001DCCC;
  v26[3] = &unk_100269708;
  id v16 = v7;
  id v27 = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  0LL,  v26));

  [v13 addAction:v17];
  double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"PLAYLIST_ADD_BEHAVIOR_DONT_ADD_BUTTON" value:&stru_100279068 table:0]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001DD14;
  v24[3] = &unk_100269708;
  id v25 = v16;
  id v20 = v16;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  0LL,  v24));

  [v13 addAction:v21];
  [v13 setPreferredAction:v21];
  [v23 presentViewController:v13 animated:1 completion:0];
}

- (void)_handlePlayPauseGesture
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
  [v2 togglePlayPause];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[TVMAddToPlaylistPresentationController initWithPresentedViewController:presentingViewController:]( objc_alloc(&OBJC_CLASS___TVMAddToPlaylistPresentationController),  "initWithPresentedViewController:presentingViewController:",  v7,  v6);

  return v8;
}

- (MPModelPlaylist)folderPlaylist
{
  return self->_folderPlaylist;
}

- (void)setFolderPlaylist:(id)a3
{
}

- (UILabel)actionTitleLabel
{
  return self->_actionTitleLabel;
}

- (void)setActionTitleLabel:(id)a3
{
}

- (UIScrollView)actionScrollView
{
  return self->_actionScrollView;
}

- (void)setActionScrollView:(id)a3
{
}

- (TVMusicAddToPlaylistActionGroupView)actionGroupView
{
  return self->_actionGroupView;
}

- (void)setActionGroupView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (MPModelLibraryRequest)mpRequest
{
  return self->_mpRequest;
}

- (void)setMpRequest:(id)a3
{
}

- (MPModelGenericObject)objectToAdd
{
  return self->_objectToAdd;
}

- (void)setObjectToAdd:(id)a3
{
}

- (MPSectionedCollection)collectionTracks
{
  return self->_collectionTracks;
}

- (void)setCollectionTracks:(id)a3
{
}

- (id)selectedPlaylistHandler
{
  return self->_selectedPlaylistHandler;
}

- (void)setSelectedPlaylistHandler:(id)a3
{
}

- (BOOL)hideNewPlaylistOption
{
  return self->_hideNewPlaylistOption;
}

- (void)setHideNewPlaylistOption:(BOOL)a3
{
  self->_hideNewPlaylistOption = a3;
}

- (NSString)itemNameToAdd
{
  return self->_itemNameToAdd;
}

- (void)setItemNameToAdd:(id)a3
{
}

- (void).cxx_destruct
{
}

@end