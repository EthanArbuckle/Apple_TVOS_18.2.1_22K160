@interface PBAppSwitcherViewController
- (BOOL)acceptsEventFocus;
- (BOOL)expectsEventForwarding;
- (PBAppSwitcherCollectionViewController)collectionViewController;
- (PBAppSwitcherDataSource)dataSource;
- (PBAppSwitcherManager)appSwitcherManager;
- (PBAppSwitcherViewController)initWithWorkspaceGeometry:(id)a3 dataSource:(id)a4;
- (PBWorkspaceGeometry)workspaceGeometry;
- (id)preferredFocusEnvironments;
- (id)transitionCompletion;
- (void)invalidateSceneLayoutElements;
- (void)setCollectionViewController:(id)a3;
- (void)setTransitionCompletion:(id)a3;
- (void)transitionToSwitcherWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBAppSwitcherViewController

- (PBAppSwitcherViewController)initWithWorkspaceGeometry:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBAppSwitcherViewController;
  v9 = -[PBAppSwitcherViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0LL, 0LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workspaceGeometry, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PBAppSwitcherViewController;
  -[PBAppSwitcherViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper wallpaperViewForVariant:]( &OBJC_CLASS___TVSUIWallpaper,  "wallpaperViewForVariant:",  3LL));
  [v12 setAutoresizingMask:18];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherViewController view](self, "view"));
  [v13 addSubview:v12];

  v14 = -[PBAppSwitcherCollectionViewController initWithWorkspaceGeometry:dataSource:]( objc_alloc(&OBJC_CLASS___PBAppSwitcherCollectionViewController),  "initWithWorkspaceGeometry:dataSource:",  self->_workspaceGeometry,  self->_dataSource);
  collectionViewController = self->_collectionViewController;
  self->_collectionViewController = v14;

  -[PBAppSwitcherViewController addChildViewController:]( self,  "addChildViewController:",  self->_collectionViewController);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self->_collectionViewController, "view"));
  objc_msgSend(v16, "setFrame:", v5, v7, v9, v11);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewController view](self->_collectionViewController, "view"));
  [v17 addSubview:v18];

  -[PBAppSwitcherCollectionViewController didMoveToParentViewController:]( self->_collectionViewController,  "didMoveToParentViewController:",  self);
}

- (id)preferredFocusEnvironments
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBAppSwitcherCollectionViewController preferredFocusEnvironments]( self->_collectionViewController,  "preferredFocusEnvironments"));
}

- (void)transitionToSwitcherWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherViewController view](self, "view"));
  [v5 layoutIfNeeded];

  collectionViewController = self->_collectionViewController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001C1FA4;
  v8[3] = &unk_1003CFF30;
  id v9 = v4;
  id v7 = v4;
  -[PBAppSwitcherCollectionViewController transitionToSwitcherWithCompletion:]( collectionViewController,  "transitionToSwitcherWithCompletion:",  v8);
}

- (void)invalidateSceneLayoutElements
{
}

- (BOOL)expectsEventForwarding
{
  return 0;
}

- (BOOL)acceptsEventFocus
{
  return 1;
}

- (PBWorkspaceGeometry)workspaceGeometry
{
  return self->_workspaceGeometry;
}

- (PBAppSwitcherDataSource)dataSource
{
  return self->_dataSource;
}

- (PBAppSwitcherCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void)setCollectionViewController:(id)a3
{
}

- (id)transitionCompletion
{
  return self->_transitionCompletion;
}

- (void)setTransitionCompletion:(id)a3
{
}

- (PBAppSwitcherManager)appSwitcherManager
{
  return self->_appSwitcherManager;
}

- (void).cxx_destruct
{
}

@end