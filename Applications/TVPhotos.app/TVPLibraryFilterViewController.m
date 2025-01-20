@interface TVPLibraryFilterViewController
- (PXLibraryFilterState)libraryFilterState;
- (TVPLibraryFilterViewController)initWithSourceView:(id)a3 libraryFilterState:(id)a4;
- (TVPLibraryFilterViewControllerDelegate)delegate;
- (UIView)sourceView;
- (id)_createLibraryFilterButtons;
- (id)_createMenuViews;
- (id)_createShowSharedIconButton;
- (id)_createSpacerView;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_didSelectButton:(id)a3;
- (void)_didSelectSharedBadgeButton:(id)a3;
- (void)_handleMenuTap:(id)a3;
- (void)_positionFilterView;
- (void)setDelegate:(id)a3;
- (void)setSourceView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVPLibraryFilterViewController

- (TVPLibraryFilterViewController)initWithSourceView:(id)a3 libraryFilterState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterViewController;
  v9 = -[TVPLibraryFilterViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0LL, 0LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceView, a3);
    objc_storeStrong((id *)&v10->_libraryFilterState, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterViewController;
  -[TVPLibraryFilterViewController viewDidLoad](&v63, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5002LL));
  v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);

  v6 = v5;
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v5,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v5, "layer"));
  [v7 setMasksToBounds:1];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v6, "layer"));
  [v8 setCornerRadius:24.0];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  [v9 addSubview:v6];

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](v6, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue([v60 leadingAnchor]);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v58 constraintEqualToAnchor:v56]);
  v68[0] = v54;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](v6, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v52 trailingAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v50 constraintEqualToAnchor:v48]);
  v68[1] = v45;
  v10 = v6;
  v62 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v6, "topAnchor"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 topAnchor]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v13]);
  v68[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v10, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bottomAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v17]);
  v68[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v19);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController _createMenuViews](self, "_createMenuViews"));
  v20 = -[UIStackView initWithArrangedSubviews:]( objc_alloc(&OBJC_CLASS___UIStackView),  "initWithArrangedSubviews:",  v61);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v20,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIStackView setAxis:](v20, "setAxis:", 1LL);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  [v21 addSubview:v20];

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v20, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  v53 = (void *)objc_claimAutoreleasedReturnValue([v57 leadingAnchor]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v53]);
  v67[0] = v51;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v20, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue([v49 trailingAnchor]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v46]);
  v67[1] = v44;
  v59 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v20, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 topAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v24]);
  v67[2] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v20, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 bottomAnchor]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v28]);
  v67[3] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 widthAnchor]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToConstant:400.0]);
  v66 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v66, 1LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v35);

  v36 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuTap:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v36, "setAllowedPressTypes:", &off_1000D1DC8);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  [v37 addGestureRecognizer:v36];

  uint64_t v64 = CPAnalyticsPayloadClassNameKey;
  v39 = (objc_class *)objc_opt_class(self, v38);
  v40 = NSStringFromClass(v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v65 = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
  +[CPAnalytics sendEvent:withPayload:]( &OBJC_CLASS___CPAnalytics,  "sendEvent:withPayload:",  @"com.apple.photos.CPAnalytics.filterSharedLibraryPresented",  v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v43 addObserver:self selector:"_applicationWillResignActiveNotification:" name:UIApplicationWillResignActiveNotification object:0];
}

- (void)_didSelectButton:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController delegate](self, "delegate"));
  objc_msgSend(v5, "libraryFilterViewController:selectedTag:", self, objc_msgSend(v4, "libraryFilterItemTag"));

  id v6 = [v4 libraryFilterItemTag];
  id v8 = (objc_class *)objc_opt_class(self, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  PXLibraryFilterSendAnalyticsForItemSelected(v6, v10);

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController presentingViewController](self, "presentingViewController"));
  [v11 dismissViewControllerAnimated:1 completion:0];
}

- (void)_didSelectSharedBadgeButton:(id)a3
{
  id v6 = a3;
  id v4 = [v6 checkmarkHidden];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController libraryFilterState](self, "libraryFilterState"));
  [v5 setSharedLibraryBadgeEnabled:v4];

  objc_msgSend(v6, "setCheckmarkHidden:", objc_msgSend(v6, "checkmarkHidden") ^ 1);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPLibraryFilterViewController;
  -[TVPLibraryFilterViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[TVPLibraryFilterViewController _positionFilterView](self, "_positionFilterView");
}

- (void)_positionFilterView
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  id v4 = [v3 effectiveUserInterfaceLayoutDirection];

  -[UIView frame](self->_sourceView, "frame");
  double v6 = v5;
  if (v4 != (id)1)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
    [v7 frame];
    double v9 = v8;
    -[UIView frame](self->_sourceView, "frame");
    double v6 = v6 - (v9 - v10);
  }

  -[UIView frame](self->_sourceView, "frame");
  double v12 = v11 + 20.0;
  -[UIView frame](self->_sourceView, "frame");
  double v14 = v12 + v13;
  id v21 = (id)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  [v21 frame];
  double v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  [v17 frame];
  double v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController view](self, "view"));
  objc_msgSend(v20, "setFrame:", v6, v14, v16, v19);
}

- (void)_handleMenuTap:(id)a3
{
  uint64_t v9 = CPAnalyticsPayloadClassNameKey;
  id v4 = (objc_class *)objc_opt_class(self, a2);
  double v5 = NSStringFromClass(v4);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  double v10 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  +[CPAnalytics sendEvent:withPayload:]( &OBJC_CLASS___CPAnalytics,  "sendEvent:withPayload:",  @"com.apple.photos.CPAnalytics.filterSharedLibraryDismissed",  v7);

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController presentingViewController](self, "presentingViewController"));
  [v8 dismissViewControllerAnimated:1 completion:0];
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController presentingViewController](self, "presentingViewController", a3));
  [v3 dismissViewControllerAnimated:0 completion:0];
}

- (id)_createMenuViews
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController _createLibraryFilterButtons](self, "_createLibraryFilterButtons"));
  id v4 = [v3 mutableCopy];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController _createSpacerView](self, "_createSpacerView"));
  [v4 addObject:v5];
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController _createShowSharedIconButton](self, "_createShowSharedIconButton"));
  [v4 addObject:v6];
  id v7 = [v4 copy];

  return v7;
}

- (id)_createLibraryFilterButtons
{
  id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v3 = [&off_1000D1DE0 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v20 = *(void *)v23;
    do
    {
      double v5 = 0LL;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(&off_1000D1DE0);
        }
        id v6 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v5), "integerValue", v20);
        uint64_t v7 = PXLibraryFilterTitleForItemTag(v6, 0LL);
        double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        uint64_t v9 = PXLibraryFilterMenuImageNameForItemTag(v6);
        double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        double v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVPLibraryFilterMenuButton buttonWithType:]( &OBJC_CLASS___TVPLibraryFilterMenuButton,  "buttonWithType:",  0LL));
        [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v11 setTitle:v8];
        [v11 setLibraryFilterItemTag:v6];
        double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController libraryFilterState](self, "libraryFilterState"));
        id v13 = [v12 viewMode];
        uint64_t v16 = PXLibraryFilterViewModeFromItemTag(v6, v14, v15);

        if (v13 == (id)v16) {
          [v11 setCheckmarkHidden:0];
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v10));
        [v11 setImage:v17];

        [v11 addTarget:self action:"_didSelectButton:" forControlEvents:0x2000];
        -[NSMutableArray addObject:](v21, "addObject:", v11);

        double v5 = (char *)v5 + 1;
      }

      while (v4 != v5);
      id v4 = [&off_1000D1DE0 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v4);
  }

  id v18 = -[NSMutableArray copy](v21, "copy");

  return v18;
}

- (id)_createSpacerView
{
  v2 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v2, "layer"));
  [v3 setZPosition:-1.79769313e308];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v2, "heightAnchor"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 constraintEqualToConstant:20.0]);
  [v5 setActive:1];

  id v6 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5004LL));
  double v8 = -[UIVisualEffectView initWithEffect:](v6, "initWithEffect:", v7);

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v8,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v8, "layer"));
  [v9 setMasksToBounds:1];

  -[UIView addSubview:](v2, "addSubview:", v8);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](v8, "leadingAnchor"));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v2, "leadingAnchor"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v22]);
  v24[0] = v21;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](v8, "trailingAnchor"));
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v2, "trailingAnchor"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v19]);
  v24[1] = v10;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v8, "topAnchor"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v2, "topAnchor"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
  v24[2] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v8, "bottomAnchor"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v2, "bottomAnchor"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v15]);
  v24[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v17);

  return v2;
}

- (id)_createShowSharedIconButton
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVPLibraryFilterMenuButton buttonWithType:]( &OBJC_CLASS___TVPLibraryFilterMenuButton,  "buttonWithType:",  0LL));
  uint64_t v5 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterMenu_ToggleBadge", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v3 setTitle:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPLibraryFilterViewController libraryFilterState](self, "libraryFilterState"));
  objc_msgSend(v3, "setCheckmarkHidden:", objc_msgSend(v7, "isSharedLibraryBadgeEnabled") ^ 1);

  [v3 addTarget:self action:"_didSelectSharedBadgeButton:" forControlEvents:0x2000];
  return v3;
}

- (TVPLibraryFilterViewControllerDelegate)delegate
{
  return (TVPLibraryFilterViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
}

@end