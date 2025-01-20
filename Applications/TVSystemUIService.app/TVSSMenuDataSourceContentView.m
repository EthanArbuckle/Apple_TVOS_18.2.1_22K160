@interface TVSSMenuDataSourceContentView
- (BOOL)_hasItemsForLayoutViewFromMenuDataSource:(id)a3;
- (BOOL)_hasPrivacyItemBeforeProfileItemInMenuDataSource:(id)a3;
- (BOOL)disablesContainerStyling;
- (NSDictionary)menuItemHostViewsDict;
- (NSLayoutConstraint)containerAlignedToTrailingConstraint;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)layoutViewLeadingConstraint;
- (NSLayoutConstraint)layoutViewTrailingConstraint;
- (NSLayoutConstraint)layoutViewWidthConstraint;
- (NSLayoutConstraint)transitionEdgeLayoutGuideBottomConstraint;
- (NSLayoutConstraint)transitionEdgeLayoutGuideLeadingConstraint;
- (NSLayoutConstraint)transitionEdgeLayoutGuideTopConstraint;
- (NSLayoutConstraint)transitionEdgeLayoutGuideTrailingConstraint;
- (TVSPLayoutResult)layoutResult;
- (TVSPLayoutView)layoutView;
- (TVSPMenuBarContentViewConfiguration)configuration;
- (TVSPPaddableContainerView)paddableContainerView;
- (TVSSMenuDataSource)dataSource;
- (TVSSMenuDataSourceContentView)init;
- (TVSSMenuDataSourceContentView)initWithConfiguration:(id)a3;
- (TVSSMenuDataSourceContentView)initWithFrame:(CGRect)a3;
- (UILayoutGuide)transitionEdgeLayoutGuide;
- (UIView)containerView;
- (UIView)leadingItemContainerView;
- (UIView)leadingMenuItemView;
- (UIView)trailingItemContainerView;
- (UIView)trailingMenuItemView;
- (UIView)trailingView;
- (id)_generateMenuItemHostViewForMenuItem:(id)a3;
- (id)_hostViewForIdentifier:(id)a3;
- (id)_hostViewsForLayoutViewFromMenuDataSource:(id)a3;
- (id)_itemsForLayoutViewFromMenuDataSource:(id)a3;
- (id)_layoutResultForMenuDataSource:(id)a3 configuration:(id)a4 menuItemHostViewsDict:(id)a5;
- (id)preferredFocusEnvironments;
- (unint64_t)contentLayoutMode;
- (void)_addObservationsForDataSource:(id)a3;
- (void)_recomputeLayoutViewFromDataSource:(id)a3 animator:(id)a4;
- (void)_removeObservationsForDataSource:(id)a3;
- (void)_setDataSource:(id)a3 animator:(id)a4 forcedUpdate:(BOOL)a5;
- (void)_updateConstraintsAndSpacing;
- (void)_updateForUserInterfaceStyleChange;
- (void)_updateLeadingView:(id)a3;
- (void)_updateTrailingView:(id)a3;
- (void)dealloc;
- (void)menuItemVisualContentDidChange:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentLayoutMode:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDataSource:(id)a3 animator:(id)a4;
- (void)setLayoutResult:(id)a3;
- (void)setTransitionEdgeLayoutGuideBottomConstraint:(id)a3;
- (void)setTransitionEdgeLayoutGuideLeadingConstraint:(id)a3;
- (void)setTransitionEdgeLayoutGuideTopConstraint:(id)a3;
- (void)setTransitionEdgeLayoutGuideTrailingConstraint:(id)a3;
@end

@implementation TVSSMenuDataSourceContentView

- (TVSSMenuDataSourceContentView)init
{
  v6 = self;
  id v4 =  +[TVSPMenuBarContentViewConfiguration standardConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "standardConfiguration");
  v6 = 0LL;
  v6 = -[TVSSMenuDataSourceContentView initWithConfiguration:](self, "initWithConfiguration:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0LL);
  return v5;
}

- (TVSSMenuDataSourceContentView)initWithConfiguration:(id)a3
{
  v86 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v86;
  v86 = 0LL;
  v84.receiver = v3;
  v84.super_class = (Class)&OBJC_CLASS___TVSSMenuDataSourceContentView;
  v83 = -[TVSSMenuDataSourceContentView initWithFrame:]( &v84,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v86 = v83;
  objc_storeStrong((id *)&v86, v83);
  if (v83)
  {
    id v4 = (TVSPMenuBarContentViewConfiguration *)[location[0] copy];
    configuration = v86->_configuration;
    v86->_configuration = v4;

    objc_storeStrong((id *)&v86->_menuItemHostViewsDict, &__NSDictionary0__struct);
    -[TVSSMenuDataSourceContentView setTranslatesAutoresizingMaskIntoConstraints:]( v86,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v6 = objc_alloc_init(&OBJC_CLASS___UIView);
    containerView = v86->_containerView;
    v86->_containerView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v86->_containerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v8 = objc_alloc(&OBJC_CLASS___TVSPPaddableContainerView);
    v9 = -[TVSPPaddableContainerView initWithView:](v8, "initWithView:", v86->_containerView);
    paddableContainerView = v86->_paddableContainerView;
    v86->_paddableContainerView = v9;

    -[TVSPPaddableContainerView setTranslatesAutoresizingMaskIntoConstraints:]( v86->_paddableContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSMenuDataSourceContentView addSubview:](v86, "addSubview:", v86->_paddableContainerView);
    v11 = objc_alloc_init(&OBJC_CLASS___UIView);
    leadingItemContainerView = v86->_leadingItemContainerView;
    v86->_leadingItemContainerView = v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v86->_leadingItemContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView addSubview:](v86->_containerView, "addSubview:", v86->_leadingItemContainerView);
    v13 = objc_alloc_init(&OBJC_CLASS___TVSPLayoutView);
    layoutView = v86->_layoutView;
    v86->_layoutView = v13;

    -[TVSPLayoutView setTranslatesAutoresizingMaskIntoConstraints:]( v86->_layoutView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v34 = -[TVSPLayoutView layer](v86->_layoutView, "layer");
    [v34 setAllowsGroupBlending:0];

    sub_10005AE34();
    -[TVSPLayoutView setMaskOutsets:](v86->_layoutView, "setMaskOutsets:", v15, v16, v17, v18);
    -[UIView addSubview:](v86->_containerView, "addSubview:", v86->_layoutView);
    v19 = objc_alloc_init(&OBJC_CLASS___UIView);
    trailingItemContainerView = v86->_trailingItemContainerView;
    v86->_trailingItemContainerView = v19;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v86->_trailingItemContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v35 = -[UIView layer](v86->_trailingItemContainerView, "layer");
    -[CALayer setAllowsGroupBlending:](v35, "setAllowsGroupBlending:", 0LL);

    -[UIView addSubview:](v86->_containerView, "addSubview:", v86->_trailingItemContainerView);
    v36 = -[UIView heightAnchor](v86->_containerView, "heightAnchor");
    -[TVSPMenuBarContentViewConfiguration maximumContentHeight](v86->_configuration, "maximumContentHeight");
    v21 = -[NSLayoutDimension constraintEqualToConstant:](v36, "constraintEqualToConstant:");
    heightConstraint = v86->_heightConstraint;
    v86->_heightConstraint = v21;

    id v38 = -[TVSPLayoutView leadingAnchor](v86->_layoutView, "leadingAnchor");
    v37 = -[UIView trailingAnchor](v86->_leadingItemContainerView, "trailingAnchor");
    v23 = (NSLayoutConstraint *)objc_msgSend(v38, "constraintEqualToAnchor:");
    layoutViewLeadingConstraint = v86->_layoutViewLeadingConstraint;
    v86->_layoutViewLeadingConstraint = v23;

    id v40 = -[TVSPLayoutView trailingAnchor](v86->_layoutView, "trailingAnchor");
    v39 = -[UIView leadingAnchor](v86->_trailingItemContainerView, "leadingAnchor");
    v25 = (NSLayoutConstraint *)objc_msgSend(v40, "constraintEqualToAnchor:");
    layoutViewTrailingConstraint = v86->_layoutViewTrailingConstraint;
    v86->_layoutViewTrailingConstraint = v25;

    id v41 = -[TVSPLayoutView widthAnchor](v86->_layoutView, "widthAnchor");
    v27 = (NSLayoutConstraint *)[v41 constraintEqualToConstant:0.0];
    layoutViewWidthConstraint = v86->_layoutViewWidthConstraint;
    v86->_layoutViewWidthConstraint = v27;

    v43 = -[UIView leadingAnchor](v86->_containerView, "leadingAnchor");
    v42 = -[UIView leadingAnchor](v86->_trailingItemContainerView, "leadingAnchor");
    v29 = (NSLayoutConstraint *)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v43, "constraintEqualToAnchor:");
    containerAlignedToTrailingConstraint = v86->_containerAlignedToTrailingConstraint;
    v86->_containerAlignedToTrailingConstraint = v29;

    id v80 = -[TVSPPaddableContainerView leadingAnchor](v86->_paddableContainerView, "leadingAnchor");
    id v79 = -[TVSSMenuDataSourceContentView leadingAnchor](v86, "leadingAnchor");
    id v78 = objc_msgSend(v80, "constraintEqualToAnchor:");
    v88[0] = v78;
    id v77 = -[TVSPPaddableContainerView trailingAnchor](v86->_paddableContainerView, "trailingAnchor");
    id v76 = -[TVSSMenuDataSourceContentView trailingAnchor](v86, "trailingAnchor");
    id v75 = objc_msgSend(v77, "constraintEqualToAnchor:");
    v88[1] = v75;
    id v74 = -[TVSPPaddableContainerView topAnchor](v86->_paddableContainerView, "topAnchor");
    id v73 = -[TVSSMenuDataSourceContentView topAnchor](v86, "topAnchor");
    id v72 = objc_msgSend(v74, "constraintEqualToAnchor:");
    v88[2] = v72;
    id v71 = -[TVSPPaddableContainerView bottomAnchor](v86->_paddableContainerView, "bottomAnchor");
    id v70 = -[TVSSMenuDataSourceContentView bottomAnchor](v86, "bottomAnchor");
    id v69 = objc_msgSend(v71, "constraintEqualToAnchor:");
    v88[3] = v69;
    v68 = -[UIView leadingAnchor](v86->_leadingItemContainerView, "leadingAnchor");
    v67 = -[UIView leadingAnchor](v86->_containerView, "leadingAnchor");
    id v66 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v68, "constraintEqualToAnchor:");
    v88[4] = v66;
    v65 = -[UIView topAnchor](v86->_leadingItemContainerView, "topAnchor");
    v64 = -[UIView topAnchor](v86->_containerView, "topAnchor");
    id v63 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v65, "constraintEqualToAnchor:");
    v88[5] = v63;
    v62 = -[UIView bottomAnchor](v86->_leadingItemContainerView, "bottomAnchor");
    v61 = -[UIView bottomAnchor](v86->_containerView, "bottomAnchor");
    id v60 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v62, "constraintEqualToAnchor:");
    v88[6] = v60;
    v88[7] = v86->_layoutViewLeadingConstraint;
    id v59 = -[TVSPLayoutView topAnchor](v86->_layoutView, "topAnchor");
    v58 = -[UIView topAnchor](v86->_containerView, "topAnchor");
    id v57 = objc_msgSend(v59, "constraintEqualToAnchor:");
    v88[8] = v57;
    id v56 = -[TVSPLayoutView bottomAnchor](v86->_layoutView, "bottomAnchor");
    v55 = -[UIView bottomAnchor](v86->_containerView, "bottomAnchor");
    id v54 = objc_msgSend(v56, "constraintEqualToAnchor:");
    v88[9] = v54;
    v88[10] = v86->_layoutViewTrailingConstraint;
    v88[11] = v86->_layoutViewWidthConstraint;
    v53 = -[UIView topAnchor](v86->_trailingItemContainerView, "topAnchor");
    v52 = -[UIView topAnchor](v86->_containerView, "topAnchor");
    id v51 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v53, "constraintEqualToAnchor:");
    v88[12] = v51;
    v50 = -[UIView bottomAnchor](v86->_trailingItemContainerView, "bottomAnchor");
    v49 = -[UIView bottomAnchor](v86->_containerView, "bottomAnchor");
    id v48 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v50, "constraintEqualToAnchor:");
    v88[13] = v48;
    v47 = -[UIView trailingAnchor](v86->_trailingItemContainerView, "trailingAnchor");
    v46 = -[UIView trailingAnchor](v86->_containerView, "trailingAnchor");
    id v45 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v47, "constraintEqualToAnchor:");
    v88[14] = v45;
    v88[15] = v86->_heightConstraint;
    v44 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v88, 16LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[TVSSMenuDataSourceContentView _updateConstraintsAndSpacing](v86, "_updateConstraintsAndSpacing");
    -[TVSSMenuDataSourceContentView layoutIfNeeded](v86, "layoutIfNeeded");
    v81 = v86;
    uint64_t v87 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v82 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v87, 1LL);
    id v31 =  -[TVSSMenuDataSourceContentView registerForTraitChanges:withAction:]( v81,  "registerForTraitChanges:withAction:");
  }

  v33 = v86;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v86, 0LL);
  return v33;
}

  ;
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  -[TVSSMenuDataSourceContentView _removeObservationsForDataSource:]( self,  "_removeObservationsForDataSource:",  self->_dataSource);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSMenuDataSourceContentView;
  -[TVSSMenuDataSourceContentView dealloc](&v2, "dealloc");
}

- (TVSSMenuDataSourceContentView)initWithFrame:(CGRect)a3
{
  CGRect v8 = a3;
  v7 = self;
  id v5 =  +[TVSPMenuBarContentViewConfiguration standardConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "standardConfiguration");
  v7 = 0LL;
  v7 = -[TVSSMenuDataSourceContentView initWithConfiguration:](self, "initWithConfiguration:");
  v6 = v7;

  objc_storeStrong((id *)&v7, 0LL);
  return v6;
}

- (void)setDataSource:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = v7;
  id v3 = location[0];
  id v5 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  -[TVSSMenuDataSourceContentView setDataSource:animator:](v4, "setDataSource:animator:", v3);

  objc_storeStrong(location, 0LL);
}

- (void)setDataSource:(id)a3 animator:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSMenuDataSourceContentView _setDataSource:animator:forcedUpdate:]( v7,  "_setDataSource:animator:forcedUpdate:",  location[0],  v5,  0LL);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (UILayoutGuide)transitionEdgeLayoutGuide
{
  v21 = self;
  v20[1] = (id)a2;
  if (!self->_transitionEdgeLayoutGuide)
  {
    v20[0] = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    -[TVSSMenuDataSourceContentView addLayoutGuide:](v21, "addLayoutGuide:", v20[0]);
    id v5 = -[TVSSMenuDataSourceContentView leadingAnchor](v21, "leadingAnchor");
    id v4 = [v20[0] leadingAnchor];
    id v3 = objc_msgSend(v5, "constraintEqualToAnchor:");
    -[TVSSMenuDataSourceContentView setTransitionEdgeLayoutGuideLeadingConstraint:]( v21,  "setTransitionEdgeLayoutGuideLeadingConstraint:");

    id v8 = -[TVSSMenuDataSourceContentView trailingAnchor](v21, "trailingAnchor");
    id v7 = [v20[0] trailingAnchor];
    id v6 = objc_msgSend(v8, "constraintEqualToAnchor:");
    -[TVSSMenuDataSourceContentView setTransitionEdgeLayoutGuideTrailingConstraint:]( v21,  "setTransitionEdgeLayoutGuideTrailingConstraint:");

    id v11 = -[TVSSMenuDataSourceContentView topAnchor](v21, "topAnchor");
    id v10 = [v20[0] topAnchor];
    id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
    -[TVSSMenuDataSourceContentView setTransitionEdgeLayoutGuideTopConstraint:]( v21,  "setTransitionEdgeLayoutGuideTopConstraint:");

    id v14 = -[TVSSMenuDataSourceContentView bottomAnchor](v21, "bottomAnchor");
    id v13 = [v20[0] bottomAnchor];
    id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
    -[TVSSMenuDataSourceContentView setTransitionEdgeLayoutGuideBottomConstraint:]( v21,  "setTransitionEdgeLayoutGuideBottomConstraint:");

    v19 =  -[TVSSMenuDataSourceContentView transitionEdgeLayoutGuideLeadingConstraint]( v21,  "transitionEdgeLayoutGuideLeadingConstraint");
    v22[0] = v19;
    double v18 =  -[TVSSMenuDataSourceContentView transitionEdgeLayoutGuideTrailingConstraint]( v21,  "transitionEdgeLayoutGuideTrailingConstraint");
    v22[1] = v18;
    double v17 =  -[TVSSMenuDataSourceContentView transitionEdgeLayoutGuideTopConstraint]( v21,  "transitionEdgeLayoutGuideTopConstraint");
    v22[2] = v17;
    double v16 =  -[TVSSMenuDataSourceContentView transitionEdgeLayoutGuideBottomConstraint]( v21,  "transitionEdgeLayoutGuideBottomConstraint");
    v22[3] = v16;
    double v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_storeStrong((id *)&v21->_transitionEdgeLayoutGuide, v20[0]);
    objc_storeStrong(v20, 0LL);
  }

  return v21->_transitionEdgeLayoutGuide;
}

- (id)preferredFocusEnvironments
{
  id v6 = self;
  v5[1] = (id)a2;
  id v3 = -[TVSSMenuDataSourceContentView traitCollection](self, "traitCollection");
  v5[0] = [v3 objectForTrait:objc_opt_class(TVSSMenuBarActiveItemIdentifierTrait)];

  id location = -[TVSSMenuDataSourceContentView _hostViewForIdentifier:](v6, "_hostViewForIdentifier:", v5[0]);
  if (location)
  {
    id v8 = location;
    id v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL);
  }

  else
  {
    id v7 = &__NSArray0__struct;
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v5, 0LL);
  return v7;
}

- (BOOL)disablesContainerStyling
{
  return 0;
}

- (void)setContentLayoutMode:(unint64_t)a3
{
  if (a3 != self->_contentLayoutMode)
  {
    self->_contentLayoutMode = a3;
    -[TVSSMenuDataSourceContentView _updateConstraintsAndSpacing](self, "_updateConstraintsAndSpacing");
  }

- (UIView)trailingView
{
  return -[TVSSMenuDataSourceContentView trailingMenuItemView](self, "trailingMenuItemView", a2, self);
}

- (void)_recomputeLayoutViewFromDataSource:(id)a3 animator:(id)a4
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v6 = v22;
  id v5 = location[0];
  id v9 = -[TVSSMenuDataSourceContentView configuration](v22, "configuration");
  id v8 = -[TVSSMenuDataSourceContentView menuItemHostViewsDict](v22, "menuItemHostViewsDict");
  id v7 =  -[TVSSMenuDataSourceContentView _layoutResultForMenuDataSource:configuration:menuItemHostViewsDict:]( v6,  "_layoutResultForMenuDataSource:configuration:menuItemHostViewsDict:",  v5,  v9);
  -[TVSSMenuDataSourceContentView setLayoutResult:](v22, "setLayoutResult:");

  id v19 =  -[TVSSMenuDataSourceContentView _hostViewsForLayoutViewFromMenuDataSource:]( v22,  "_hostViewsForLayoutViewFromMenuDataSource:",  location[0]);
  id v11 = -[TVSSMenuDataSourceContentView layoutView](v22, "layoutView");
  id v10 = -[TVSSMenuDataSourceContentView layoutResult](v22, "layoutResult");
  -[TVSPLayoutView applyLayoutResult:managedSubviews:animator:](v11, "applyLayoutResult:managedSubviews:animator:");

  id v12 = v20;
  id v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  double v16 = sub_10005B834;
  double v17 = &unk_1001B5A60;
  double v18 = v22;
  objc_msgSend(v12, "addAnimation:");
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_generateMenuItemHostViewForMenuItem:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v11 = 0LL;
  id v12 = &v11;
  int v13 = 838860800;
  int v14 = 48;
  int v15 = sub_10005BA48;
  double v16 = sub_10005BA9C;
  id v17 = 0LL;
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_10005BAC8;
  id v9 = &unk_1001B7C68;
  v10[1] = &v11;
  v10[0] = location[0];
  +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", &v5);
  id v4 = (id)v12[5];
  objc_storeStrong(v10, 0LL);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)_addObservationsForDataSource:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = [location[0] items];
  id v8 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      [v10 addMenuItemObserver:v12];
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)_removeObservationsForDataSource:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = [location[0] items];
  id v8 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      [v10 removeMenuItemObserver:v12];
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

- (id)_hostViewForIdentifier:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v4 = -[TVSSMenuDataSourceContentView menuItemHostViewsDict](v8, "menuItemHostViewsDict");
  id v6 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", location[0]);

  id v5 = v6;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (void)setConfiguration:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (([location[0] isEqual:v6->_configuration] & 1) == 0)
  {
    uint64_t v3 = (TVSPMenuBarContentViewConfiguration *)[location[0] copy];
    configuration = v6->_configuration;
    v6->_configuration = v3;

    -[TVSSMenuDataSourceContentView _updateConstraintsAndSpacing](v6, "_updateConstraintsAndSpacing");
  }

  objc_storeStrong(location, 0LL);
}

- (id)_layoutResultForMenuDataSource:(id)a3 configuration:(id)a4 menuItemHostViewsDict:(id)a5
{
  id obj = a4;
  id v54 = a5;
  uint64_t v87 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v85 = 0LL;
  objc_storeStrong(&v85, obj);
  id v84 = 0LL;
  objc_storeStrong(&v84, v54);
  id v83 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v82 =  -[TVSSMenuDataSourceContentView _itemsForLayoutViewFromMenuDataSource:]( v87,  "_itemsForLayoutViewFromMenuDataSource:",  location[0]);
  v55 = __b;
  memset(__b, 0, sizeof(__b));
  id v56 = v82;
  id v57 = [v56 countByEnumeratingWithState:__b objects:v90 count:16];
  uint64_t v58 = 0LL;
  if (v57)
  {
    uint64_t v50 = *(void *)__b[2];
    uint64_t v51 = v58;
    id v52 = v57;
    while (1)
    {
      unint64_t v48 = (unint64_t)v52;
      uint64_t v49 = v51;
      if (*(void *)__b[2] != v50) {
        objc_enumerationMutation(v56);
      }
      id v81 = *(id *)(__b[1] + 8 * v49);
      menuItemHostViewsDict = v87->_menuItemHostViewsDict;
      id v44 = [v81 identifier];
      v47 = &v79;
      id v79 = -[NSDictionary objectForKeyedSubscript:](menuItemHostViewsDict, "objectForKeyedSubscript:");

      [v79 bounds];
      uint64_t v75 = v5;
      uint64_t v76 = v6;
      *(double *)&__int128 v77 = v7;
      *((double *)&v77 + 1) = v8;
      __int128 v78 = v77;
      id v45 = v83;
      id v46 = +[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:", v7, v8);
      objc_msgSend(v45, "addObject:");

      objc_storeStrong(&v79, 0LL);
      uint64_t v51 = v49 + 1;
      id v52 = (id)v48;
      if (v49 + 1 >= v48)
      {
        uint64_t v51 = v58;
        id v52 = [v56 countByEnumeratingWithState:__b objects:v90 count:16];
        if (!v52) {
          break;
        }
      }
    }
  }

  [v85 maximumContentHeight];
  double v74 = v9;
  id v73 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v72 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  for (unint64_t i = 0LL; ; ++i)
  {
    unint64_t v42 = i;
    id v40 = &v70;
    id v70 = [v82 objectAtIndexedSubscript:i];
    v39 = &v69;
    id v69 = [v70 identifier];
    id v30 = [v83 objectAtIndexedSubscript:i];
    [v30 CGSizeValue];
    double v67 = v10;
    uint64_t v68 = v11;

    v32 = &OBJC_CLASS___TVSPColumn;
    id v89 = v69;
    uint64_t v31 = 1LL;
    id v35 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v89);
    id v34 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v74);
    id v88 = v34;
    id v33 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v88, 1LL);
    id v38 = (id *)&v66;
    id v66 =  +[TVSPColumn columnWithIdentifiers:itemHeights:]( &OBJC_CLASS___TVSPColumn,  "columnWithIdentifiers:itemHeights:",  v35);

    -[NSMutableArray addObject:](v73, "addObject:", v66);
    v36 = v72;
    id v37 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v67);
    -[NSMutableArray addObject:](v36, "addObject:");

    id v41 = 0LL;
    objc_storeStrong((id *)&v66, 0LL);
    objc_storeStrong(&v69, 0LL);
    objc_storeStrong(&v70, 0LL);
  }

  v27 = (id *)&v73;
  v26 = (id *)&v72;
  v25 = (id *)&v65;
  v65 =  +[TVSPRow rowWithColumns:height:columnWidths:]( &OBJC_CLASS___TVSPRow,  "rowWithColumns:height:columnWidths:",  v73,  v72,  v74);
  uint64_t v20 = 0LL;
  sub_10005C770();
  double v61 = v12;
  double v62 = v13;
  double v63 = v14;
  double v64 = v15;
  id v21 = objc_alloc(&OBJC_CLASS___TVSPLayoutEnvironment);
  v28 = &v85;
  [v85 itemSpacing];
  id v17 = objc_msgSend( v21,  "initWithContainerFrame:contentInsets:sizeProviders:rowSpacing:columnSpacing:",  &__NSArray0__struct,  v61,  v62,  v63,  v64,  NSDirectionalEdgeInsetsZero.top,  NSDirectionalEdgeInsetsZero.leading,  NSDirectionalEdgeInsetsZero.bottom,  NSDirectionalEdgeInsetsZero.trailing,  0,  v16);
  v24 = &v60;
  id v60 = v17;
  id v18 = -[TVSPRow layoutResultsForEnvironment:](v65, "layoutResultsForEnvironment:", v17);
  v22 = &v59;
  id v59 = v18;
  id v23 = v18;
  id v29 = 0LL;
  objc_storeStrong(v22, 0LL);
  objc_storeStrong(v24, v29);
  objc_storeStrong(v25, v29);
  objc_storeStrong(v26, v29);
  objc_storeStrong(v27, v29);
  objc_storeStrong(&v82, v29);
  objc_storeStrong(&v83, v29);
  objc_storeStrong(&v84, v29);
  objc_storeStrong(v28, v29);
  objc_storeStrong(location, v29);
  return v23;
}

  ;
}

- (id)_itemsForLayoutViewFromMenuDataSource:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = &__NSArray0__struct;
  id v7 = [location[0] items];
  id v8 = [v7 array];

  if ((unint64_t)[v8 count] > 2)
  {
    uint64_t v3 = (char *)[v8 count];
    uint64_t v13 = 1LL;
    double v12 = v3 - 2;
    uint64_t v14 = 1LL;
    double v15 = v3 - 2;
    id v4 = objc_msgSend(v8, "subarrayWithRange:", 1, v3 - 2);
    id v5 = v9;
    id v9 = v4;

    id v11 = v9;
  }

  else
  {
    id v11 = &__NSArray0__struct;
  }

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v11;
}

- (id)_hostViewsForLayoutViewFromMenuDataSource:(id)a3
{
  v24 = self;
  SEL v23 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v21 =  -[TVSSMenuDataSourceContentView _itemsForLayoutViewFromMenuDataSource:]( v24,  "_itemsForLayoutViewFromMenuDataSource:",  location);
  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = v21;
  id v16 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
  if (v16)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0LL;
    id v14 = v16;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(id *)(__b[1] + 8 * v13);
      id v9 = v24;
      id v10 = [v19 identifier];
      id v17 = -[TVSSMenuDataSourceContentView _hostViewForIdentifier:](v9, "_hostViewForIdentifier:");

      if (!v17)
      {
        id v8 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
        SEL v5 = v23;
        uint64_t v6 = v24;
        id v7 = [v19 identifier];
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v8,  "handleFailureInMethod:object:file:lineNumber:description:",  v5,  v6,  @"TVSSMenuDataSourceContentView.m",  337LL,  @"no known host view for identifier %@",  v7);
      }

      -[NSMutableArray addObject:](v20, "addObject:", v17);
      objc_storeStrong(&v17, 0LL);
      ++v13;
      if (v11 + 1 >= (unint64_t)v14)
      {
        uint64_t v13 = 0LL;
        id v14 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  id v4 = v20;
  objc_storeStrong((id *)&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&location, 0LL);
  return v4;
}

- (BOOL)_hasItemsForLayoutViewFromMenuDataSource:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] items];
  id v5 = [v4 count];

  objc_storeStrong(location, 0LL);
  return (unint64_t)v5 > 2;
}

- (BOOL)_hasPrivacyItemBeforeProfileItemInMenuDataSource:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v17 = 0;
  id v12 = [location[0] items];
  uint64_t v13 = (char *)[v12 count];

  id v16 = v13;
  if ((unint64_t)v13 >= 2)
  {
    id v5 = [location[0] items];
    id v15 = [v5 objectAtIndexedSubscript:v16 - 1];

    id v6 = [location[0] items];
    id v14 = [v6 objectAtIndexedSubscript:v16 - 2];

    id v7 = [v15 identifier];
    unsigned __int8 v8 = [v7 isEqual:@"com.apple.TVSystemUIService.currentUser.item"];

    id v9 = [v14 identifier];
    unsigned __int8 v10 = [v9 isEqual:@"com.apple.TVSystemUIService.privacyMenuItem"];

    char v11 = 0;
    if ((v10 & 1) != 0) {
      char v11 = v8 & 1;
    }
    char v17 = v11;
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong(&v15, 0LL);
  }

  char v4 = v17;
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (void)_updateLeadingView:(id)a3
{
  SEL v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] != v23->_leadingMenuItemView)
  {
    if (v23->_leadingMenuItemView) {
      -[UIView removeFromSuperview](v23->_leadingMenuItemView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&v23->_leadingMenuItemView, location[0]);
    if (v23->_leadingMenuItemView)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v23->_leadingMenuItemView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      -[UIView addSubview:](v23->_leadingItemContainerView, "addSubview:", v23->_leadingMenuItemView);
      id v15 = -[UIView leadingAnchor](v23->_leadingMenuItemView, "leadingAnchor");
      id v14 = -[UIView leadingAnchor](v23->_leadingItemContainerView, "leadingAnchor");
      id v13 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v15, "constraintEqualToAnchor:");
      v24[0] = v13;
      id v12 = -[UIView trailingAnchor](v23->_leadingMenuItemView, "trailingAnchor");
      char v11 = -[UIView trailingAnchor](v23->_leadingItemContainerView, "trailingAnchor");
      id v10 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v12, "constraintEqualToAnchor:");
      v24[1] = v10;
      id v9 = -[UIView topAnchor](v23->_leadingMenuItemView, "topAnchor");
      unsigned __int8 v8 = -[UIView topAnchor](v23->_leadingItemContainerView, "topAnchor");
      id v7 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v9, "constraintEqualToAnchor:");
      v24[2] = v7;
      id v6 = -[UIView bottomAnchor](v23->_leadingMenuItemView, "bottomAnchor");
      id v5 = -[UIView bottomAnchor](v23->_leadingItemContainerView, "bottomAnchor");
      id v4 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v6, "constraintEqualToAnchor:");
      v24[3] = v4;
      uint64_t v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL);
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

      id v16 = _NSConcreteStackBlock;
      int v17 = -1073741824;
      int v18 = 0;
      id v19 = sub_10005D340;
      uint64_t v20 = &unk_1001B5A60;
      id v21 = v23;
      +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", &v16);
      -[TVSSMenuDataSourceContentView _updateConstraintsAndSpacing](v23, "_updateConstraintsAndSpacing");
      objc_storeStrong((id *)&v21, 0LL);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateTrailingView:(id)a3
{
  uint64_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] != v20->_trailingMenuItemView)
  {
    if (v20->_trailingMenuItemView) {
      -[UIView removeFromSuperview](v20->_trailingMenuItemView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&v20->_trailingMenuItemView, location[0]);
    if (v20->_trailingMenuItemView)
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v20->_trailingMenuItemView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      -[UIView addSubview:](v20->_trailingItemContainerView, "addSubview:", v20->_trailingMenuItemView);
      id v12 = -[UIView leadingAnchor](v20->_trailingMenuItemView, "leadingAnchor");
      char v11 = -[UIView leadingAnchor](v20->_trailingItemContainerView, "leadingAnchor");
      id v10 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v12, "constraintEqualToAnchor:");
      v21[0] = v10;
      id v9 = -[UIView trailingAnchor](v20->_trailingMenuItemView, "trailingAnchor");
      unsigned __int8 v8 = -[UIView trailingAnchor](v20->_trailingItemContainerView, "trailingAnchor");
      id v7 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v9, "constraintEqualToAnchor:");
      v21[1] = v7;
      id v6 = -[UIView centerYAnchor](v20->_trailingMenuItemView, "centerYAnchor");
      id v5 = -[UIView centerYAnchor](v20->_trailingItemContainerView, "centerYAnchor");
      id v4 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v6, "constraintEqualToAnchor:");
      v21[2] = v4;
      uint64_t v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL);
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

      id v13 = _NSConcreteStackBlock;
      int v14 = -1073741824;
      int v15 = 0;
      id v16 = sub_10005D744;
      int v17 = &unk_1001B5A60;
      int v18 = v20;
      +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", &v13);
      -[TVSSMenuDataSourceContentView _updateConstraintsAndSpacing](v20, "_updateConstraintsAndSpacing");
      objc_storeStrong((id *)&v18, 0LL);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateConstraintsAndSpacing
{
  v47 = self;
  SEL v46 = a2;
  BOOL v45 = self->_contentLayoutMode == 1;
  -[NSLayoutConstraint setActive:](self->_containerAlignedToTrailingConstraint, "setActive:", v45);
  -[NSLayoutConstraint setActive:](v47->_layoutViewTrailingConstraint, "setActive:", !v45);
  id v44 = -[TVSSMenuDataSourceContentView configuration](v47, "configuration");
  -[TVSPMenuBarContentViewConfiguration maximumContentHeight](v44, "maximumContentHeight");
  double v24 = v2;
  v25 = -[TVSSMenuDataSourceContentView heightConstraint](v47, "heightConstraint");
  -[NSLayoutConstraint setConstant:](v25, "setConstant:", v24);

  v26 = -[TVSSMenuDataSourceContentView dataSource](v47, "dataSource");
  unsigned __int8 v27 = -[TVSSMenuDataSourceContentView _hasItemsForLayoutViewFromMenuDataSource:]( v47,  "_hasItemsForLayoutViewFromMenuDataSource:");

  char v43 = v27 & 1;
  -[TVSPMenuBarContentViewConfiguration itemSpacing](v44, "itemSpacing");
  uint64_t v42 = v3;
  uint64_t v41 = v3;
  v28 = -[TVSSMenuDataSourceContentView dataSource](v47, "dataSource");
  unsigned __int8 v29 = -[TVSSMenuDataSourceContentView _hasPrivacyItemBeforeProfileItemInMenuDataSource:]( v47,  "_hasPrivacyItemBeforeProfileItemInMenuDataSource:");

  char v40 = v29 & 1;
  double v39 = 0.0;
  if ((v29 & 1) != 0)
  {
    -[TVSPMenuBarContentViewConfiguration privacyToProfileSpacing](v44, "privacyToProfileSpacing");
    double v39 = -v4;
  }

  else if ((v43 & 1) != 0)
  {
    -[TVSPMenuBarContentViewConfiguration trailingItemSpacing](v44, "trailingItemSpacing");
    double v39 = -v5;
  }

  id v13 = -[TVSSMenuDataSourceContentView layoutViewLeadingConstraint](v47, "layoutViewLeadingConstraint", v41);
  -[NSLayoutConstraint setConstant:](v13, "setConstant:", v12);

  int v14 = -[TVSSMenuDataSourceContentView layoutViewTrailingConstraint](v47, "layoutViewTrailingConstraint");
  -[NSLayoutConstraint setConstant:](v14, "setConstant:", v39);

  -[TVSPMenuBarContentViewConfiguration preferredLayoutMargins](v44, "preferredLayoutMargins");
  *(void *)&__int128 v37 = v6;
  *((void *)&v37 + 1) = v7;
  *(void *)&__int128 v38 = v8;
  *((void *)&v38 + 1) = v9;
  __int128 v35 = v37;
  __int128 v36 = v38;
  int v15 = -[TVSSMenuDataSourceContentView paddableContainerView](v47, "paddableContainerView");
  __int128 v33 = v37;
  __int128 v34 = v38;
  -[TVSPPaddableContainerView setPaddingInsets:](v15, "setPaddingInsets:", v37, v38);

  id v10 = -[TVSSMenuDataSourceContentView effectiveUserInterfaceLayoutDirection]( v47,  "effectiveUserInterfaceLayoutDirection");
  BOOL v32 = v10 == (id)1;
  double v11 = -1.0;
  if (v10 != (id)1) {
    double v11 = 1.0;
  }
  double v31 = v11;
  id v30 = -[TVSSMenuDataSourceContentView transitionEdgeLayoutGuide](v47, "transitionEdgeLayoutGuide");
  double v16 = *(double *)&v37;
  int v17 =  -[TVSSMenuDataSourceContentView transitionEdgeLayoutGuideTopConstraint]( v47,  "transitionEdgeLayoutGuideTopConstraint");
  -[NSLayoutConstraint setConstant:](v17, "setConstant:", v16);

  double v18 = -*(double *)&v38;
  id v19 =  -[TVSSMenuDataSourceContentView transitionEdgeLayoutGuideBottomConstraint]( v47,  "transitionEdgeLayoutGuideBottomConstraint");
  -[NSLayoutConstraint setConstant:](v19, "setConstant:", v18);

  double v20 = *((double *)&v37 + 1);
  id v21 =  -[TVSSMenuDataSourceContentView transitionEdgeLayoutGuideLeadingConstraint]( v47,  "transitionEdgeLayoutGuideLeadingConstraint");
  -[NSLayoutConstraint setConstant:](v21, "setConstant:", v20);

  double v22 = v31 * *((double *)&v38 + 1);
  SEL v23 =  -[TVSSMenuDataSourceContentView transitionEdgeLayoutGuideTrailingConstraint]( v47,  "transitionEdgeLayoutGuideTrailingConstraint");
  -[NSLayoutConstraint setConstant:](v23, "setConstant:", v22);

  objc_storeStrong((id *)&v30, 0LL);
  objc_storeStrong((id *)&v44, 0LL);
}

- (void)_updateForUserInterfaceStyleChange
{
  double v4 = -[TVSSMenuDataSourceContentView dataSource](self, "dataSource");
  id v3 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  -[TVSSMenuDataSourceContentView _setDataSource:animator:forcedUpdate:]( self,  "_setDataSource:animator:forcedUpdate:",  v4);
}

- (void)_setDataSource:(id)a3 animator:(id)a4 forcedUpdate:(BOOL)a5
{
  __int128 v33 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v31 = 0LL;
  objc_storeStrong(&v31, a4);
  BOOL v30 = a5;
  if (a5 || (BSEqualObjects(v33->_dataSource, location[0]) & 1) == 0)
  {
    id v29 = 0LL;
    id v28 = 0LL;
    id v27 = [location[0] items];
    char v24 = 0;
    if ((unint64_t)[v27 count] < 2)
    {
      id v5 = 0LL;
    }

    else
    {
      id v25 = [v27 firstObject];
      char v24 = 1;
      id v5 = v25;
    }

    id v26 = v5;
    if ((v24 & 1) != 0) {

    }
    SEL v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    memset(__b, 0, sizeof(__b));
    id v16 = v27;
    id v17 = [v16 countByEnumeratingWithState:__b objects:v34 count:16];
    if (v17)
    {
      uint64_t v13 = *(void *)__b[2];
      uint64_t v14 = 0LL;
      id v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)__b[2] != v13) {
          objc_enumerationMutation(v16);
        }
        id v22 = *(id *)(__b[1] + 8 * v14);
        id v20 =  -[TVSSMenuDataSourceContentView _generateMenuItemHostViewForMenuItem:]( v33,  "_generateMenuItemHostViewForMenuItem:",  v22);
        id v9 = v20;
        id v10 = v23;
        id v11 = [v22 identifier];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9);

        objc_storeStrong(&v29, v20);
        if (v22 == v26) {
          objc_storeStrong(&v28, v20);
        }
        objc_storeStrong(&v20, 0LL);
        ++v14;
        if (v12 + 1 >= (unint64_t)v15)
        {
          uint64_t v14 = 0LL;
          id v15 = [v16 countByEnumeratingWithState:__b objects:v34 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }

    objc_storeStrong((id *)&v33->_menuItemHostViewsDict, v23);
    -[TVSSMenuDataSourceContentView _removeObservationsForDataSource:]( v33,  "_removeObservationsForDataSource:",  v33->_dataSource);
    objc_storeStrong((id *)&v33->_dataSource, location[0]);
    -[TVSSMenuDataSourceContentView _addObservationsForDataSource:](v33, "_addObservationsForDataSource:", location[0]);
    -[TVSSMenuDataSourceContentView _updateLeadingView:](v33, "_updateLeadingView:", v28);
    -[TVSSMenuDataSourceContentView _updateTrailingView:](v33, "_updateTrailingView:", v29);
    uint64_t v7 = v33;
    id v6 = location[0];
    id v8 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
    -[TVSSMenuDataSourceContentView _recomputeLayoutViewFromDataSource:animator:]( v7,  "_recomputeLayoutViewFromDataSource:animator:",  v6);

    objc_storeStrong((id *)&v23, 0LL);
    objc_storeStrong(&v26, 0LL);
    objc_storeStrong(&v27, 0LL);
    objc_storeStrong(&v28, 0LL);
    objc_storeStrong(&v29, 0LL);
  }

  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)menuItemVisualContentDidChange:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (unint64_t)contentLayoutMode
{
  return self->_contentLayoutMode;
}

- (TVSPMenuBarContentViewConfiguration)configuration
{
  return self->_configuration;
}

- (TVSSMenuDataSource)dataSource
{
  return self->_dataSource;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (TVSPPaddableContainerView)paddableContainerView
{
  return self->_paddableContainerView;
}

- (UIView)leadingItemContainerView
{
  return self->_leadingItemContainerView;
}

- (TVSPLayoutView)layoutView
{
  return self->_layoutView;
}

- (UIView)trailingItemContainerView
{
  return self->_trailingItemContainerView;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (NSLayoutConstraint)layoutViewLeadingConstraint
{
  return self->_layoutViewLeadingConstraint;
}

- (NSLayoutConstraint)layoutViewTrailingConstraint
{
  return self->_layoutViewTrailingConstraint;
}

- (NSLayoutConstraint)layoutViewWidthConstraint
{
  return self->_layoutViewWidthConstraint;
}

- (NSLayoutConstraint)containerAlignedToTrailingConstraint
{
  return self->_containerAlignedToTrailingConstraint;
}

- (NSDictionary)menuItemHostViewsDict
{
  return self->_menuItemHostViewsDict;
}

- (UIView)leadingMenuItemView
{
  return self->_leadingMenuItemView;
}

- (UIView)trailingMenuItemView
{
  return self->_trailingMenuItemView;
}

- (TVSPLayoutResult)layoutResult
{
  return self->_layoutResult;
}

- (void)setLayoutResult:(id)a3
{
}

- (NSLayoutConstraint)transitionEdgeLayoutGuideLeadingConstraint
{
  return self->_transitionEdgeLayoutGuideLeadingConstraint;
}

- (void)setTransitionEdgeLayoutGuideLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)transitionEdgeLayoutGuideTrailingConstraint
{
  return self->_transitionEdgeLayoutGuideTrailingConstraint;
}

- (void)setTransitionEdgeLayoutGuideTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)transitionEdgeLayoutGuideTopConstraint
{
  return self->_transitionEdgeLayoutGuideTopConstraint;
}

- (void)setTransitionEdgeLayoutGuideTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)transitionEdgeLayoutGuideBottomConstraint
{
  return self->_transitionEdgeLayoutGuideBottomConstraint;
}

- (void)setTransitionEdgeLayoutGuideBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end