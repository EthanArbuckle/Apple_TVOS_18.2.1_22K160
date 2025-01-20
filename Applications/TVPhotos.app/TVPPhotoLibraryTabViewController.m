@interface TVPPhotoLibraryTabViewController
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (TVPContextMenuPresenter)contextMenuPresenter;
- (TVPLibraryFilterButton)libraryFilterButton;
- (TVPPhotoLibraryTabViewController)init;
- (TVPPhotoLibraryTabViewController)initWithCoder:(id)a3;
- (TVPPhotoLibraryTabViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVPPhotoLibraryTabViewController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4;
- (UIFocusGuide)libraryFilterButtonFocusGuide;
- (UIView)libraryButtonToVCFocusableView;
- (UIViewController)primaryContextMenuViewController;
- (UIViewController)secondaryContextMenuViewController;
- (id)_albumsListController;
- (id)_viewControllerForMode:(int64_t)a3;
- (id)contentFilterHiddenTypesForFilterController:(id)a3;
- (id)preferredFocusEnvironments;
- (void)_didUpdateFocus:(id)a3;
- (void)_reloadLibraryFilterButton;
- (void)_showLibraryFilterView;
- (void)filterController:(id)a3 contentFilterStateChanged:(id)a4;
- (void)libraryFilterViewController:(id)a3 selectedTag:(int64_t)a4;
- (void)navigateToTabMode:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)ppt_navigateToTabMode:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)setContextMenuPresenter:(id)a3;
- (void)setLibraryButtonToVCFocusableView:(id)a3;
- (void)setLibraryFilterButton:(id)a3;
- (void)setLibraryFilterButtonFocusGuide:(id)a3;
- (void)setSelectedViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation TVPPhotoLibraryTabViewController

- (id)_viewControllerForMode:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController viewControllers](self, "viewControllers"));
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = sub_1000460AC;
  v12 = sub_1000460BC;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000460C4;
  v7[3] = &unk_1000CB558;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateObjectsUsingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_albumsListController
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController _viewControllerForMode:](self, "_viewControllerForMode:", 3LL));
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryAlbumsListController, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      uint64_t v10 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryAlbumsListController, v9);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "px_descriptionForAssertionMessage"));
      [v8 handleFailureInMethod:a2, self, @"TVPPhotoLibraryTabViewController.m", 67, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[self _viewControllerForMode:TVPPhotoLibraryTabModeAlbums]", v12, v13 object file lineNumber description];
    }
  }

  return v5;
}

- (void)_didUpdateFocus:(id)a3
{
  id v12 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterButtonFocusGuide](self, "libraryFilterButtonFocusGuide"));
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterButton](self, "libraryFilterButton"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:UIFocusUpdateContextKey]);

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedItem]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterButton](self, "libraryFilterButton"));
      v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryTabViewController libraryFilterButtonFocusGuide]( self,  "libraryFilterButtonFocusGuide"));
      [v11 setEnabled:v9 != v10];
    }
  }
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 previouslyFocusedView]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterButton](self, "libraryFilterButton"));
  if (![v5 isEqual:v6])
  {

    goto LABEL_5;
  }

  id v7 = [v4 focusHeading];

  if (v7 != (id)1)
  {
LABEL_5:
    BOOL v8 = 1;
    goto LABEL_6;
  }

  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (void)_showLibraryFilterView
{
  v3 = objc_alloc(&OBJC_CLASS___TVPLibraryFilterViewController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterButton](self, "libraryFilterButton"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterState](self, "libraryFilterState"));
  uint64_t v6 = -[TVPLibraryFilterViewController initWithSourceView:libraryFilterState:]( v3,  "initWithSourceView:libraryFilterState:",  v4,  v5);

  -[TVPLibraryFilterViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 4LL);
  -[TVPLibraryFilterViewController setDelegate:](v6, "setDelegate:", self);
  -[TVPPhotoLibraryTabViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v6,  1LL,  0LL);
}

- (void)_reloadLibraryFilterButton
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController tabBar](self, "tabBar"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 trailingAccessoryView]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController tabBar](self, "tabBar"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider"));
    unsigned __int8 v9 = [v8 hasSharedLibraryOrPreview];

    if ((v9 & 1) != 0)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterState](self, "libraryFilterState"));
      id v11 = [v10 viewMode];

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterButton](self, "libraryFilterButton"));
      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterButton](self, "libraryFilterButton"));
        [v13 setViewMode:v11];
      }

      else
      {
        v64 = -[TVPLibraryFilterButton initWithViewMode:]( objc_alloc(&OBJC_CLASS___TVPLibraryFilterButton),  "initWithViewMode:",  v11);
        objc_initWeak(&location, self);
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472LL;
        v65[2] = sub_100046BE4;
        v65[3] = &unk_1000C9D18;
        objc_copyWeak(&v66, &location);
        -[TVPLibraryFilterButton setButtonAction:](v64, "setButtonAction:", v65);
        -[TVPLibraryFilterButton setTranslatesAutoresizingMaskIntoConstraints:]( v64,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController view](self, "view"));
        [v24 addSubview:v64];

        -[TVPPhotoLibraryTabViewController setLibraryFilterButton:](self, "setLibraryFilterButton:", v64);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v7 centerYAnchor]);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton centerYAnchor](v64, "centerYAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v26]);
        v75[0] = v27;
        v28 = (void *)objc_claimAutoreleasedReturnValue([v7 trailingAnchor]);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton trailingAnchor](v64, "trailingAnchor"));
        v30 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v29 constant:90.0]);
        v75[1] = v30;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v75, 2LL));
        +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v31);

        v63 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
        -[UIFocusGuide setIdentifier:](v63, "setIdentifier:", @"TVPhotos.LibraryFilterButton.Guide");
        v74 = v7;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v74, 1LL));
        -[UIFocusGuide setPreferredFocusEnvironments:](v63, "setPreferredFocusEnvironments:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton superview](v64, "superview"));
        [v33 addLayoutGuide:v63];

        v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v63, "topAnchor"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton bottomAnchor](v64, "bottomAnchor"));
        v57 = (void *)objc_claimAutoreleasedReturnValue([v61 constraintEqualToAnchor:v59 constant:1.0]);
        v73[0] = v57;
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leftAnchor](v63, "leftAnchor"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton leftAnchor](v64, "leftAnchor"));
        v35 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v34]);
        v73[1] = v35;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide rightAnchor](v63, "rightAnchor"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton rightAnchor](v64, "rightAnchor"));
        v38 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v37]);
        v73[2] = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide heightAnchor](v63, "heightAnchor"));
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToConstant:1.0]);
        v73[3] = v40;
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v73, 4LL));
        +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v41);

        -[TVPPhotoLibraryTabViewController setLibraryFilterButtonFocusGuide:]( self,  "setLibraryFilterButtonFocusGuide:",  v63);
        v42 = objc_alloc_init(&OBJC_CLASS___UIView);
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v42,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController view](self, "view"));
        [v43 addSubview:v42];

        v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v42, "topAnchor"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterButton bottomAnchor](v64, "bottomAnchor"));
        v58 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintEqualToAnchor:v62 constant:0.0]);
        v72[0] = v58;
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v42, "leadingAnchor"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController view](self, "view"));
        v54 = (void *)objc_claimAutoreleasedReturnValue([v56 leadingAnchor]);
        v52 = (void *)objc_claimAutoreleasedReturnValue([v53 constraintEqualToAnchor:v54]);
        v72[1] = v52;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v42, "trailingAnchor"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController view](self, "view"));
        v45 = (void *)objc_claimAutoreleasedReturnValue([v44 trailingAnchor]);
        v46 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v45]);
        v72[2] = v46;
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v42, "bottomAnchor"));
        v48 = (void *)objc_claimAutoreleasedReturnValue([v7 bottomAnchor]);
        v49 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v48]);
        v72[3] = v49;
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v72, 4LL));
        +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v50);

        -[TVPPhotoLibraryTabViewController setLibraryButtonToVCFocusableView:]( self,  "setLibraryButtonToVCFocusableView:",  v42);
        objc_destroyWeak(&v66);
        objc_destroyWeak(&location);
      }
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryTabViewController libraryButtonToVCFocusableView]( self,  "libraryButtonToVCFocusableView"));
      [v14 removeFromSuperview];

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterButton](self, "libraryFilterButton"));
      [v15 removeFromSuperview];

      -[TVPPhotoLibraryTabViewController setLibraryFilterButton:](self, "setLibraryFilterButton:", 0LL);
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v7 layoutGuides]);
      id v17 = [v16 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v69;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v69 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
            v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
            unsigned int v22 = [v21 isEqualToString:@"TVPhotos.LibraryFilterButton.Guide"];

            if (v22) {
              [v7 removeLayoutGuide:v20];
            }
          }

          id v17 = [v16 countByEnumeratingWithState:&v68 objects:v76 count:16];
        }

        while (v17);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterState](self, "libraryFilterState"));
      [v23 setViewMode:0];
    }
  }

- (TVPPhotoLibraryTabViewController)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryTabViewController;
  unsigned __int8 v9 = -[TVPPhotoLibraryTabViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0LL, 0LL);
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:]( &OBJC_CLASS___PXSharedLibraryStatusProvider,  "sharedLibraryStatusProviderWithPhotoLibrary:",  v7));
    sharedLibraryStatusProvider = v10->_sharedLibraryStatusProvider;
    v10->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v11;

    objc_storeStrong((id *)&v10->_libraryFilterState, a4);
    -[PXSharedLibraryStatusProvider registerChangeObserver:context:]( v10->_sharedLibraryStatusProvider,  "registerChangeObserver:context:",  v10,  off_1001021D8);
    -[PXLibraryFilterState registerChangeObserver:context:]( v10->_libraryFilterState,  "registerChangeObserver:context:",  v10,  off_1001021E0);
  }

  return v10;
}

- (TVPPhotoLibraryTabViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v9,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPPhotoLibraryTabViewController.m",  179,  @"%s is not available as initializer",  "-[TVPPhotoLibraryTabViewController initWithNibName:bundle:]");

  abort();
}

- (TVPPhotoLibraryTabViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v6,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPPhotoLibraryTabViewController.m",  183,  @"%s is not available as initializer",  "-[TVPPhotoLibraryTabViewController initWithCoder:]");

  abort();
}

- (TVPPhotoLibraryTabViewController)init
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TVPPhotoLibraryTabViewController.m",  187,  @"%s is not available as initializer",  "-[TVPPhotoLibraryTabViewController init]");

  abort();
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryTabViewController;
  -[TVPPhotoLibraryTabViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = -[TVPContextMenuPresenter initWithViewDelegate:]( objc_alloc(&OBJC_CLASS___TVPContextMenuPresenter),  "initWithViewDelegate:",  self);
  -[TVPPhotoLibraryTabViewController setContextMenuPresenter:](self, "setContextMenuPresenter:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_didUpdateFocus:" name:UIFocusDidUpdateNotification object:0];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryTabViewController;
  -[TVPPhotoLibraryTabViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterButton](self, "libraryFilterButton"));

  if (!v3) {
    -[TVPPhotoLibraryTabViewController _reloadLibraryFilterButton](self, "_reloadLibraryFilterButton");
  }
}

- (id)preferredFocusEnvironments
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController contextMenuPresenter](self, "contextMenuPresenter"));
  unsigned __int8 v4 = [v3 isContextMenuPresented];

  if ((v4 & 1) != 0)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController navigationController](self, "navigationController"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 topViewController]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    id v12 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));

    return v8;
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryTabViewController;
    id v10 = -[TVPPhotoLibraryTabViewController preferredFocusEnvironments](&v11, "preferredFocusEnvironments");
    return (id)objc_claimAutoreleasedReturnValue(v10);
  }

- (void)navigateToTabMode:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  unsigned __int8 v9 = a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController _viewControllerForMode:](self, "_viewControllerForMode:", a3));
  if (v7)
  {
    -[TVPPhotoLibraryTabViewController setSelectedViewController:](self, "setSelectedViewController:", v7);
    if (v9)
    {
      id v8 = (void (*)(void))v9[2];
LABEL_6:
      v8();
    }
  }

  else if (v9)
  {
    id v8 = (void (*)(void))v9[2];
    goto LABEL_6;
  }
}

- (void)ppt_navigateToTabMode:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController _viewControllerForMode:](self, "_viewControllerForMode:", a3));
  if (v8)
  {
    -[TVPPhotoLibraryTabViewController setSelectedViewController:](self, "setSelectedViewController:", v8);
    if (v7)
    {
      dispatch_time_t v9 = dispatch_time(0LL, 1000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000471D4;
      block[3] = &unk_1000CB580;
      id v12 = v7;
      BOOL v13 = v8 != 0LL;
      id v11 = v8;
      dispatch_after(v9, &_dispatch_main_q, block);
    }
  }

  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)setSelectedViewController:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController selectedViewController](self, "selectedViewController"));

  if (v5 != v4)
  {
    id v6 = [v4 tabMode];
    else {
      uint64_t v7 = (uint64_t)*(&off_1000CB5A0 + (void)v6);
    }
    uint64_t v8 = CPAnalyticsEventTabIdentifierChanged;
    uint64_t v11 = CPAnalyticsPayloadTabIdentifierDescriptionKey;
    uint64_t v12 = v7;
    dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    +[CPAnalytics sendEvent:withPayload:](&OBJC_CLASS___CPAnalytics, "sendEvent:withPayload:", v8, v9);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryTabViewController;
  -[TVPPhotoLibraryTabViewController setSelectedViewController:](&v10, "setSelectedViewController:", v4);
}

- (UIViewController)primaryContextMenuViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVPRootSettings sharedInstance](&OBJC_CLASS___TVPRootSettings, "sharedInstance"));
  v3 = -[TVPSettingsController initWithRootSettings:]( objc_alloc(&OBJC_CLASS___TVPSettingsController),  "initWithRootSettings:",  v2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000473B0;
  v6[3] = &unk_1000C9528;
  id v7 = v2;
  id v4 = v2;
  -[TVPSettingsController setOnViewDidDisappearBlock:](v3, "setOnViewDidDisappearBlock:", v6);

  return (UIViewController *)v3;
}

- (UIViewController)secondaryContextMenuViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController selectedViewController](self, "selectedViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController _albumsListController](self, "_albumsListController"));
  if (v3 == v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController photoLibrary](self, "photoLibrary"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PXContentFilterState defaultFilterStateForPhotoLibrary:]( &OBJC_CLASS___PXContentFilterState,  "defaultFilterStateForPhotoLibrary:",  v6));

    uint64_t v8 = objc_alloc(&OBJC_CLASS___TVPFilterViewController);
    dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterState](self, "libraryFilterState"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider"));
    id v5 = -[TVPFilterViewController initWithDelegate:libraryFilterState:initialContentFilterState:sharedLibraryStatusProvider:filterControllerOptions:]( v8,  "initWithDelegate:libraryFilterState:initialContentFilterState:sharedLibraryStatusProvider:filterControllerOptions:",  self,  v9,  v7,  v10,  0LL);
  }

  else
  {
    id v5 = 0LL;
  }

  return (UIViewController *)v5;
}

- (id)contentFilterHiddenTypesForFilterController:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController photoLibrary](self, "photoLibrary", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000205));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterState](self, "libraryFilterState"));
  uint64_t v7 = PXContentFilterHiddenTypesForAssetCollection(v5, v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (void)filterController:(id)a3 contentFilterStateChanged:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000475B4;
  v4[3] = &unk_1000C9D18;
  objc_copyWeak(&v5, &location);
  dispatch_async(&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if (off_1001021D8 == a5)
  {
    if ((v6 & 3) != 0)
    {
      objc_initWeak(&location, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100047714;
      block[3] = &unk_1000C9D18;
      dispatch_time_t v9 = &v14;
      objc_copyWeak(&v14, &location);
      objc_super v10 = block;
      goto LABEL_7;
    }
  }

  else if ((v6 & 1) != 0 && off_1001021E0 == a5)
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100047740;
    v11[3] = &unk_1000C9D18;
    dispatch_time_t v9 = &v12;
    objc_copyWeak(&v12, &location);
    objc_super v10 = v11;
LABEL_7:
    dispatch_async(&_dispatch_main_q, v10);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)libraryFilterViewController:(id)a3 selectedTag:(int64_t)a4
{
  uint64_t v5 = PXLibraryFilterViewModeFromItemTag(a4, a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryTabViewController libraryFilterState](self, "libraryFilterState"));
  [v6 setViewMode:v5];
}

- (TVPContextMenuPresenter)contextMenuPresenter
{
  return self->_contextMenuPresenter;
}

- (void)setContextMenuPresenter:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (TVPLibraryFilterButton)libraryFilterButton
{
  return self->_libraryFilterButton;
}

- (void)setLibraryFilterButton:(id)a3
{
}

- (UIFocusGuide)libraryFilterButtonFocusGuide
{
  return self->_libraryFilterButtonFocusGuide;
}

- (void)setLibraryFilterButtonFocusGuide:(id)a3
{
}

- (UIView)libraryButtonToVCFocusableView
{
  return self->_libraryButtonToVCFocusableView;
}

- (void)setLibraryButtonToVCFocusableView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end