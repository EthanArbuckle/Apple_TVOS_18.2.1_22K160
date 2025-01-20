@interface TVSSProfilePanelViewController
- (BOOL)allowTip;
- (TVSSProfilePanelNoUserPlatterController)noUserPlatterController;
- (TVSSProfilePanelViewController)init;
- (TVSSProfileUserGridViewController)userGridViewViewController;
- (TVSUIProfilePanelUserController)profilePanelUserController;
- (_TtC17TVSystemUIService14TVSSTipManager)tip;
- (double)desiredWidth;
- (id)preferredFocusEnvironments;
- (void)configureHierarchy;
- (void)dealloc;
- (void)hostingViewController:(id)a3 willTransitionFromViewController:(id)a4 toViewController:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllowTip:(BOOL)a3;
- (void)setNoUserPlatterController:(id)a3;
- (void)setProfilePanelUserController:(id)a3;
- (void)setTip:(id)a3;
- (void)setUserGridViewViewController:(id)a3;
- (void)updateTip;
- (void)userGridViewControllerRequestsDismissal:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation TVSSProfilePanelViewController

- (TVSSProfilePanelViewController)init
{
  v17 = self;
  v16[1] = (id)a2;
  v16[0] = -[TVSUIProfilePanelUserController initWithUserImageDiameter:]( objc_alloc(&OBJC_CLASS___TVSUIProfilePanelUserController),  "initWithUserImageDiameter:",  96.0);
  id v10 = [v16[0] users];
  id v11 = [v10 count];

  v15[1] = v11;
  if (v11)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___TVSSProfileUserGridViewController);
    [v13 setDelegate:v17];
    v3 = v17;
    v17 = 0LL;
    v12.receiver = v3;
    v12.super_class = (Class)&OBJC_CLASS___TVSSProfilePanelViewController;
    v8 = -[TVSSProfilePanelViewController init](&v12, "init");
    v17 = v8;
    objc_storeStrong((id *)&v17, v8);
    if (v8) {
      objc_storeStrong((id *)&v17->_userGridViewViewController, v13);
    }
    objc_storeStrong(&v13, 0LL);
  }

  else
  {
    v15[0] = -[TVSSProfilePanelNoUserPlatterController initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSProfilePanelNoUserPlatterController),  "initWithIdentifier:",  @"com.apple.NoUserProfilePanel");
    v2 = v17;
    v17 = 0LL;
    v14.receiver = v2;
    v14.super_class = (Class)&OBJC_CLASS___TVSSProfilePanelViewController;
    v9 = -[TVSSProfilePanelViewController initWithPlatterController:](&v14, "initWithPlatterController:", v15[0]);
    v17 = v9;
    objc_storeStrong((id *)&v17, v9);
    if (v9) {
      objc_storeStrong((id *)&v17->_noUserPlatterController, v15[0]);
    }
    objc_storeStrong(v15, 0LL);
  }

  if (v17)
  {
    objc_storeStrong((id *)&v17->_profilePanelUserController, v16[0]);
    v4 = +[TVSSTips userProfileTipManager](&OBJC_CLASS____TtC17TVSystemUIService8TVSSTips, "userProfileTipManager");
    tip = v17->_tip;
    v17->_tip = v4;

    -[TVSSTipManager setPresentingViewController:](v17->_tip, "setPresentingViewController:", v17);
    -[TVSUIProfilePanelUserController addObserver:forKeyPath:options:context:]( v17->_profilePanelUserController,  "addObserver:forKeyPath:options:context:",  v17,  @"users",  0LL,  off_10021FC98);
  }

  v7 = v17;
  objc_storeStrong(v16, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  return v7;
}

- (void)configureHierarchy
{
  if (self->_userGridViewViewController)
  {
    -[TVSSProfilePanelViewController addChildViewController:]( self,  "addChildViewController:",  self->_userGridViewViewController);
    id v3 = -[TVSSProfilePanelViewController view](self, "view");
    id v2 = -[TVSSProfileUserGridViewController view](self->_userGridViewViewController, "view");
    objc_msgSend(v3, "addSubview:");

    id v4 = -[TVSSProfileUserGridViewController view](self->_userGridViewViewController, "view");
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v25 = -[TVSSProfilePanelViewController view](self, "view");
    id v24 = [v25 leadingAnchor];
    id v23 = -[TVSSProfileUserGridViewController view](self->_userGridViewViewController, "view");
    id v22 = [v23 leadingAnchor];
    id v21 = objc_msgSend(v24, "constraintEqualToAnchor:");
    v27[0] = v21;
    id v20 = -[TVSSProfilePanelViewController view](self, "view");
    id v19 = [v20 trailingAnchor];
    id v18 = -[TVSSProfileUserGridViewController view](self->_userGridViewViewController, "view");
    id v17 = [v18 trailingAnchor];
    id v16 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v27[1] = v16;
    id v15 = -[TVSSProfilePanelViewController view](self, "view");
    id v14 = [v15 topAnchor];
    id v13 = -[TVSSProfileUserGridViewController view](self->_userGridViewViewController, "view");
    id v12 = [v13 topAnchor];
    id v11 = objc_msgSend(v14, "constraintEqualToAnchor:");
    v27[2] = v11;
    id v10 = -[TVSSProfilePanelViewController view](self, "view");
    id v9 = [v10 bottomAnchor];
    id v8 = -[TVSSProfileUserGridViewController view](self->_userGridViewViewController, "view");
    id v7 = [v8 bottomAnchor];
    id v6 = objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:");
    v27[3] = v6;
    v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[TVSSProfileUserGridViewController didMoveToParentViewController:]( self->_userGridViewViewController,  "didMoveToParentViewController:",  self);
  }

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  -[TVSUIProfilePanelUserController removeObserver:forKeyPath:]( self->_profilePanelUserController,  "removeObserver:forKeyPath:",  self,  @"users");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSProfilePanelViewController;
  -[TVSSProfilePanelViewController dealloc](&v2, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = 0LL;
  objc_storeStrong(&v9, a5);
  if (a6 == off_10021FC98) {
    -[TVSSProfilePanelViewController updateTip](v12, "updateTip");
  }
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSSProfilePanelViewController;
  -[TVSSProfilePanelViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  if (v10->_allowTip)
  {
    if (v10->_noUserPlatterController)
    {
      tip = v10->_tip;
      id v6 = -[TVSSProfilePanelNoUserPlatterController contentView](v10->_noUserPlatterController, "contentView");
      -[TVSSTipManager setSourceView:](tip, "setSourceView:");
    }

    else
    {
      SEL v3 = v10->_tip;
      id v4 = -[TVSSProfileUserGridViewController view](v10->_userGridViewViewController, "view");
      -[TVSSTipManager setSourceView:](v3, "setSourceView:");
    }
  }

- (void)updateTip
{
  id v4 = -[TVSUIProfilePanelUserController suggestedUsers](self->_profilePanelUserController, "suggestedUsers");
  id v5 = [v4 count];

  self->_allowTip = v5 != 0LL;
  if (self->_userGridViewViewController)
  {
    tip = self->_tip;
    id v3 = -[TVSSProfileUserGridViewController view](self->_userGridViewViewController, "view");
    -[TVSSTipManager setSourceView:](tip, "setSourceView:");

    -[TVSSTipManager setPermittedArrowDirections:](self->_tip, "setPermittedArrowDirections:", 8LL);
  }

- (double)desiredWidth
{
  id v5 = self;
  SEL v4 = a2;
  if (self->_userGridViewViewController)
  {
    -[TVSSProfileUserGridViewController desiredWidth](v5->_userGridViewViewController, "desiredWidth");
  }

  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)&OBJC_CLASS___TVSSProfilePanelViewController;
    -[TVSSProfilePanelViewController desiredWidth](&v3, "desiredWidth");
  }

  return result;
}

- (id)preferredFocusEnvironments
{
  BOOL v8 = self;
  SEL v7 = a2;
  objc_super v2 = -[TVSSProfilePanelViewController userGridViewViewController](self, "userGridViewViewController");
  BOOL v5 = v2 == 0LL;

  if (v5)
  {
    v6.receiver = v8;
    v6.super_class = (Class)&OBJC_CLASS___TVSSProfilePanelViewController;
    id v9 = -[TVSSProfilePanelViewController preferredFocusEnvironments](&v6, "preferredFocusEnvironments");
  }

  else
  {
    SEL v4 = -[TVSSProfilePanelViewController userGridViewViewController](v8, "userGridViewViewController");
    id v9 = -[TVSSProfileUserGridViewController preferredFocusEnvironments](v4, "preferredFocusEnvironments");
  }

  return v9;
}

- (void)hostingViewController:(id)a3 willTransitionFromViewController:(id)a4 toViewController:(id)a5
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v7 = 0LL;
  objc_storeStrong(&v7, a5);
  if (v8 == v10)
  {
    -[TVSSTipManager stopObserving](v10->_tip, "stopObserving");
    -[TVSSTipManager setSourceView:](v10->_tip, "setSourceView:", 0LL);
  }

  else if (v7 == v10)
  {
    -[TVSSProfilePanelViewController updateTip](v10, "updateTip");
    if (v10->_allowTip) {
      -[TVSSTipManager startObserving](v10->_tip, "startObserving");
    }
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)userGridViewControllerRequestsDismissal:(id)a3
{
  SEL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSProfilePanelViewController dismissSystemMenuWithSourceIdentifier:]( v4,  "dismissSystemMenuWithSourceIdentifier:",  0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSUIProfilePanelUserController)profilePanelUserController
{
  return self->_profilePanelUserController;
}

- (void)setProfilePanelUserController:(id)a3
{
}

- (TVSSProfilePanelNoUserPlatterController)noUserPlatterController
{
  return self->_noUserPlatterController;
}

- (void)setNoUserPlatterController:(id)a3
{
}

- (TVSSProfileUserGridViewController)userGridViewViewController
{
  return self->_userGridViewViewController;
}

- (void)setUserGridViewViewController:(id)a3
{
}

- (_TtC17TVSystemUIService14TVSSTipManager)tip
{
  return self->_tip;
}

- (void)setTip:(id)a3
{
}

- (BOOL)allowTip
{
  return self->_allowTip;
}

- (void)setAllowTip:(BOOL)a3
{
  self->_allowTip = a3;
}

- (void).cxx_destruct
{
}

@end