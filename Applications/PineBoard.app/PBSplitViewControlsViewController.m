@interface PBSplitViewControlsViewController
- (BOOL)isEditingControlsVisible;
- (PBPictureInPictureControlsDelegate)controlsDelegate;
- (PBSplitViewControlsViewController)initWithGeometry:(id)a3 delegate:(id)a4;
- (PBSplitViewControlsViewControllerDelegate)delegate;
- (PBSplitViewGeometry)geometry;
- (id)_layoutContextMenu;
- (id)_layoutOptionsMenu;
- (void)_expandSidebarAction:(id)a3;
- (void)_hideAction:(id)a3;
- (void)_leaveCallAction:(id)a3;
- (void)_menuGestureRecognized:(id)a3;
- (void)_startPictureInPictureAction:(id)a3;
- (void)_updateSafeAreaInsets;
- (void)dealloc;
- (void)loadView;
- (void)setControlsDelegate:(id)a3;
- (void)setEditingControlsVisible:(BOOL)a3 animationStyle:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation PBSplitViewControlsViewController

- (PBSplitViewControlsViewController)initWithGeometry:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBSplitViewControlsViewController;
  v9 = -[PBSplitViewControlsViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0LL, 0LL);
  v10 = v9;
  if (v9)
  {
    -[PBSplitViewControlsViewController setViewRespectsSystemMinimumLayoutMargins:]( v9,  "setViewRespectsSystemMinimumLayoutMargins:",  0LL);
    objc_storeStrong((id *)&v10->_geometry, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSplitViewControlsViewController;
  -[PBSplitViewControlsViewController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___PBSplitViewControlsContainerView);
  -[PBSplitViewControlsViewController setView:](self, "setView:", v3);
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBSplitViewControlsViewController;
  -[PBSplitViewControlsViewController viewDidLoad](&v14, "viewDidLoad");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 menuGestureRecognizer]);
  [v4 addTarget:self action:"_menuGestureRecognized:"];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 toggleStashingControl]);
  [v5 addTarget:self action:"_hideAction:" forControlEvents:0x2000];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 closeControl]);
  [v6 addTarget:self action:"_leaveCallAction:" forControlEvents:0x2000];

  objc_initWeak(&location, self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 layoutOptionsControl]);
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_100058EDC;
  v11 = &unk_1003D2288;
  objc_copyWeak(&v12, &location);
  [v7 setMenuProvider:&v8];
  -[PBSplitViewControlsViewController _updateSafeAreaInsets](self, "_updateSafeAreaInsets", v8, v9, v10, v11);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (BOOL)isEditingControlsVisible
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsViewController viewIfLoaded](self, "viewIfLoaded"));
  unsigned __int8 v3 = [v2 isEditingControlsVisible];

  return v3;
}

- (void)setEditingControlsVisible:(BOOL)a3 animationStyle:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsViewController view](self, "view"));
  [v7 setEditingControlsVisible:v5 animationStyle:a4];

  -[PBSplitViewControlsViewController _updateSafeAreaInsets](self, "_updateSafeAreaInsets");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsViewController:self didToggleVisibility:v5];
}

- (id)_layoutOptionsMenu
{
  v2 = self;
  objc_initWeak(&location, self);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBPIPControl layoutOptionPictureInPicture]( &OBJC_CLASS___PBPIPControl,  "layoutOptionPictureInPicture"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100059268;
  v19[3] = &unk_1003D22B0;
  objc_copyWeak(&v20, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 createActionWithHandler:v19]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBPIPControl layoutOptionSplitView](&OBJC_CLASS___PBPIPControl, "layoutOptionSplitView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 createActionWithHandler:0]);

  [v6 setState:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBPIPControl layoutOptionFullScreenSplitView]( &OBJC_CLASS___PBPIPControl,  "layoutOptionFullScreenSplitView"));
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_1000592A8;
  v17 = &unk_1003D22B0;
  objc_copyWeak(&v18, &location);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 createActionWithHandler:&v14]);

  v22[0] = v6;
  v22[1] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v22,  2LL,  v14,  v15,  v16,  v17));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v9));

  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  LODWORD(v2) = [WeakRetained controlsViewControllerShouldShowStartPictureInPicture:v2];

  if ((_DWORD)v2) {
    [v10 insertObject:v4 atIndex:0];
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIMenu menuWithTitle:image:identifier:options:children:]( &OBJC_CLASS___UIMenu,  "menuWithTitle:image:identifier:options:children:",  &stru_1003E2910,  0LL,  0LL,  33LL,  v10));

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v12;
}

- (id)_layoutContextMenu
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsViewController _layoutOptionsMenu](self, "_layoutOptionsMenu"));
  v6 = v2;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](&OBJC_CLASS___UIMenu, "menuWithChildren:", v3));

  return v4;
}

- (void)_menuGestureRecognized:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlsDelegate);
  [WeakRetained controlsProvider:self didRequestEditingControlsDismissalWithAnimationStyle:1];
}

- (void)_hideAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsViewControllerDidRequestHiding:self];
}

- (void)_startPictureInPictureAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsViewControllerDidRequestStartPictureInPicture:self];
}

- (void)_expandSidebarAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsViewControllerDidRequestExpanding:self];
}

- (void)_leaveCallAction:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance", a3));
  [v4 disconnectAllCalls];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlsViewControllerDidRequestClosing:self];
}

- (void)_updateSafeAreaInsets
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewControlsViewController viewIfLoaded](self, "viewIfLoaded"));
  v4 = v3;
  if (v3)
  {
    if ([v3 isEditingControlsVisible])
    {
      [v4 editingControlBounds];
      -[PBSplitViewInwardSizing setSafeAreaInsetBottom:](self->_geometry, "setSafeAreaInsetBottom:", v5);
    }

    else
    {
      -[PBSplitViewInwardSizing resetSafeAreaInsetsBottom](self->_geometry, "resetSafeAreaInsetsBottom");
    }
  }
}

- (PBSplitViewGeometry)geometry
{
  return (PBSplitViewGeometry *)self->_geometry;
}

- (PBPictureInPictureControlsDelegate)controlsDelegate
{
  return (PBPictureInPictureControlsDelegate *)objc_loadWeakRetained((id *)&self->_controlsDelegate);
}

- (void)setControlsDelegate:(id)a3
{
}

- (PBSplitViewControlsViewControllerDelegate)delegate
{
  return (PBSplitViewControlsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end