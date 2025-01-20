@interface TVMusicLibraryHeaderView
- (BOOL)useWithLeftMenu;
- (NSArray)rightViews;
- (TVLabel)subtitleLabel;
- (TVLabel)titleLabel;
- (TVMusicLibraryHeaderView)initWithFrame:(CGRect)a3;
- (UIFocusGuide)bottomEdgeFocusGuide;
- (UIStackView)rightStackView;
- (UIView)lastFocusedView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setBottomEdgeFocusGuide:(id)a3;
- (void)setLastFocusedView:(id)a3;
- (void)setRightStackView:(id)a3;
- (void)setRightViews:(id)a3;
- (void)setUseWithLeftMenu:(BOOL)a3;
@end

@implementation TVMusicLibraryHeaderView

- (TVMusicLibraryHeaderView)initWithFrame:(CGRect)a3
{
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___TVMusicLibraryHeaderView;
  v3 = -[TVMusicLibraryHeaderView initWithFrame:]( &v65,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TVMusicLibraryHeaderView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0LL);
    v5 = objc_alloc_init(&OBJC_CLASS___TVLabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    LODWORD(v7) = 1144733696;
    -[TVLabel setContentCompressionResistancePriority:forAxis:]( v4->_titleLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleTitle1,  1024LL));
    -[TVLabel setFont:](v4->_titleLabel, "setFont:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityBColor](&OBJC_CLASS___TVThemeManager, "textOpacityBColor"));
    -[TVLabel setTextColor:](v4->_titleLabel, "setTextColor:", v9);

    -[TVLabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVMusicLibraryHeaderView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v10 = objc_alloc_init(&OBJC_CLASS___TVLabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v10;

    LODWORD(v12) = 1144733696;
    -[TVLabel setContentCompressionResistancePriority:forAxis:]( v4->_subtitleLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityBColor](&OBJC_CLASS___TVThemeManager, "textOpacityBColor"));
    -[TVLabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v13);

    -[TVLabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_subtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVMusicLibraryHeaderView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    v14 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    rightStackView = v4->_rightStackView;
    v4->_rightStackView = v14;

    LODWORD(v16) = 1144766464;
    -[UIStackView setContentCompressionResistancePriority:forAxis:]( v4->_rightStackView,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v16);
    -[UIStackView setAlignment:](v4->_rightStackView, "setAlignment:", 4LL);
    -[UIStackView setAxis:](v4->_rightStackView, "setAxis:", 0LL);
    -[UIStackView setDistribution:](v4->_rightStackView, "setDistribution:", 3LL);
    -[UIStackView setSpacing:](v4->_rightStackView, "setSpacing:", 25.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_rightStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVMusicLibraryHeaderView addSubview:](v4, "addSubview:", v4->_rightStackView);
    v17 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
    bottomEdgeFocusGuide = v4->_bottomEdgeFocusGuide;
    v4->_bottomEdgeFocusGuide = v17;

    -[TVMusicLibraryHeaderView addLayoutGuide:](v4, "addLayoutGuide:", v4->_bottomEdgeFocusGuide);
    v67 = v4->_rightStackView;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v67, 1LL));
    -[UIFocusGuide setPreferredFocusEnvironments:](v4->_bottomEdgeFocusGuide, "setPreferredFocusEnvironments:", v19);

    -[UIFocusGuide setEnabled:](v4->_bottomEdgeFocusGuide, "setEnabled:", 0LL);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[TVLabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryHeaderView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v62 = (void *)objc_claimAutoreleasedReturnValue([v64 leadingAnchor]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v62]);
    v66[0] = v61;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVLabel topAnchor](v4->_titleLabel, "topAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryHeaderView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v60 topAnchor]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v58 constant:28.0]);
    v66[1] = v57;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[TVLabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryHeaderView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v54 = (void *)objc_claimAutoreleasedReturnValue([v56 leadingAnchor]);
    v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54]);
    v66[2] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVLabel firstBaselineAnchor](v4->_subtitleLabel, "firstBaselineAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVLabel firstBaselineAnchor](v4->_titleLabel, "firstBaselineAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v51 constant:52.0]);
    v66[3] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v4->_rightStackView, "leadingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVLabel trailingAnchor](v4->_subtitleLabel, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintGreaterThanOrEqualToAnchor:v48 constant:25.0]);
    LODWORD(v20) = 1148829696;
    v46 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintWithPriority:v20]);
    v66[4] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v4->_rightStackView, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVLabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintGreaterThanOrEqualToAnchor:v44 constant:25.0]);
    LODWORD(v21) = 1148829696;
    v42 = (void *)objc_claimAutoreleasedReturnValue([v43 constraintWithPriority:v21]);
    v66[5] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v4->_rightStackView, "centerYAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVLabel centerYAnchor](v4->_titleLabel, "centerYAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v40]);
    v66[6] = v39;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v4->_rightStackView, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryHeaderView layoutMarginsGuide](v4, "layoutMarginsGuide"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v38 trailingAnchor]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v36]);
    v66[7] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leadingAnchor](v4->_bottomEdgeFocusGuide, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryHeaderView leadingAnchor](v4, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v33]);
    v66[8] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide trailingAnchor](v4->_bottomEdgeFocusGuide, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryHeaderView trailingAnchor](v4, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v22]);
    v66[9] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v4->_bottomEdgeFocusGuide, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v4->_rightStackView, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25 constant:2.0]);
    v66[10] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide heightAnchor](v4->_bottomEdgeFocusGuide, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToConstant:1.0]);
    v66[11] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 12LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v29);

    objc_storeStrong((id *)&v4->_lastFocusedView, v4->_rightStackView);
    -[TVMusicLibraryHeaderView setUseWithLeftMenu:](v4, "setUseWithLeftMenu:", 0LL);
  }

  return v4;
}

- (void)setUseWithLeftMenu:(BOOL)a3
{
  self->_useWithLeftMenu = a3;
  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_rightStackView, "bottomAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryHeaderView topAnchor](self, "topAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 constraintEqualToAnchor:v5 constant:230.0]);
    [v6 setActive:1];
  }

  -[TVMusicLibraryHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setRightViews:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryHeaderView rightStackView](self, "rightStackView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 subviews]);
  [v6 makeObjectsPerformSelector:"removeFromSuperview"];

  double v7 = (NSArray *)[v4 copy];
  rightViews = self->_rightViews;
  self->_rightViews = v7;

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v9 = self->_rightViews;
  id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryHeaderView rightStackView](self, "rightStackView", (void)v16));
        [v15 addArrangedSubview:v14];

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v11);
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicLibraryHeaderView;
  id v6 = a3;
  -[TVMusicLibraryHeaderView didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedView", v9.receiver, v9.super_class));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryHeaderView rightStackView](self, "rightStackView"));
  LODWORD(v6) = [v7 isDescendantOfView:v8];

  if ((_DWORD)v6) {
    -[TVMusicLibraryHeaderView setLastFocusedView:](self, "setLastFocusedView:", v7);
  }
}

- (TVLabel)titleLabel
{
  return self->_titleLabel;
}

- (TVLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (NSArray)rightViews
{
  return self->_rightViews;
}

- (UIFocusGuide)bottomEdgeFocusGuide
{
  return self->_bottomEdgeFocusGuide;
}

- (void)setBottomEdgeFocusGuide:(id)a3
{
}

- (UIView)lastFocusedView
{
  return self->_lastFocusedView;
}

- (void)setLastFocusedView:(id)a3
{
}

- (BOOL)useWithLeftMenu
{
  return self->_useWithLeftMenu;
}

- (UIStackView)rightStackView
{
  return self->_rightStackView;
}

- (void)setRightStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end