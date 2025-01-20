@interface SCATModernMenuBackgroundContainerView
- (BOOL)isShowingFooterView;
- (BOOL)shouldUseDockContentPadding;
- (NSArray)dockVerticalConstraints;
- (NSArray)dockVerticalPortraitConstraints;
- (NSArray)verticalConstraints;
- (NSLayoutConstraint)dockBottomConstraint;
- (NSLayoutConstraint)dockBottomSafeConstraint;
- (NSLayoutConstraint)dockTopConstraint;
- (NSLayoutConstraint)dockTopSafeConstraint;
- (NSLayoutConstraint)footerToContainerVerticalConstraint;
- (NSLayoutConstraint)footerViewHiddenConstraint;
- (NSLayoutConstraint)viewBottomConstraint;
- (NSLayoutConstraint)viewLeadingConstraint;
- (NSLayoutConstraint)viewTopConstraint;
- (NSLayoutConstraint)viewTrailingConstraint;
- (SCATModernMenuBackgroundContainerView)initWithFrame:(CGRect)a3;
- (SCATModernMenuContentViewContainer)contentViewContainer;
- (SCATModernMenuFooterView)footerView;
- (UIEdgeInsets)contentPadding;
- (int64_t)dockPosition;
- (void)_setupSubviewConstraints;
- (void)orientationDidChange;
- (void)setContentViewContainer:(id)a3;
- (void)setDockBottomConstraint:(id)a3;
- (void)setDockBottomSafeConstraint:(id)a3;
- (void)setDockPosition:(int64_t)a3;
- (void)setDockTopConstraint:(id)a3;
- (void)setDockTopSafeConstraint:(id)a3;
- (void)setDockVerticalConstraints:(id)a3;
- (void)setDockVerticalPortraitConstraints:(id)a3;
- (void)setFooterToContainerVerticalConstraint:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setShouldUseDockContentPadding:(BOOL)a3;
- (void)setShowingFooterView:(BOOL)a3;
- (void)setVerticalConstraints:(id)a3;
- (void)setViewBottomConstraint:(id)a3;
- (void)setViewLeadingConstraint:(id)a3;
- (void)setViewTopConstraint:(id)a3;
- (void)setViewTrailingConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation SCATModernMenuBackgroundContainerView

- (SCATModernMenuBackgroundContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SCATModernMenuBackgroundContainerView;
  v7 = -[SCATModernMenuBackgroundContainerView initWithFrame:](&v11, "initWithFrame:");
  if (v7)
  {
    v8 = -[SCATModernMenuContentViewContainer initWithFrame:]( objc_alloc(&OBJC_CLASS___SCATModernMenuContentViewContainer),  "initWithFrame:",  x,  y,  width,  height);
    -[SCATModernMenuContentViewContainer setTranslatesAutoresizingMaskIntoConstraints:]( v8,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SCATModernMenuBackgroundContainerView setContentViewContainer:](v7, "setContentViewContainer:", v8);
    -[SCATModernMenuBackgroundContainerView addSubview:](v7, "addSubview:", v8);
    v9 = -[SCATModernMenuFooterView initWithFrame:]( objc_alloc(&OBJC_CLASS___SCATModernMenuFooterView),  "initWithFrame:",  x,  y,  width,  height);
    -[SCATModernMenuFooterView setTranslatesAutoresizingMaskIntoConstraints:]( v9,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SCATModernMenuBackgroundContainerView setFooterView:](v7, "setFooterView:", v9);
    -[SCATModernMenuBackgroundContainerView addSubview:](v7, "addSubview:", v9);
    -[SCATModernMenuBackgroundContainerView setShowingFooterView:](v7, "setShowingFooterView:", 1LL);
    -[SCATModernMenuBackgroundContainerView _setupSubviewConstraints](v7, "_setupSubviewConstraints");
  }

  return v7;
}

- (void)_setupSubviewConstraints
{
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView contentViewContainer](self, "contentViewContainer"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v76 topAnchor]);
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView topAnchor](self, "topAnchor"));
  v3 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v75 constraintEqualToAnchor:v74 constant:0.0]);
  viewTopConstraint = self->_viewTopConstraint;
  self->_viewTopConstraint = v3;

  v80[0] = v3;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView bottomAnchor](self, "bottomAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView footerView](self, "footerView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue([v73 bottomAnchor]);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToAnchor:v71 constant:0.0]);
  viewBottomConstraint = self->_viewBottomConstraint;
  self->_viewBottomConstraint = v5;

  v80[1] = v5;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView contentViewContainer](self, "contentViewContainer"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v70 leadingAnchor]);
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView leadingAnchor](self, "leadingAnchor"));
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v69 constraintGreaterThanOrEqualToAnchor:v68 constant:0.0]);
  viewLeadingConstraint = self->_viewLeadingConstraint;
  self->_viewLeadingConstraint = v7;

  v80[2] = v7;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView contentViewContainer](self, "contentViewContainer"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v67 trailingAnchor]);
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView trailingAnchor](self, "trailingAnchor"));
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v66 constraintLessThanOrEqualToAnchor:v65 constant:0.0]);
  viewTrailingConstraint = self->_viewTrailingConstraint;
  self->_viewTrailingConstraint = v9;

  v80[3] = v9;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView contentViewContainer](self, "contentViewContainer"));
  v63 = (void *)objc_claimAutoreleasedReturnValue([v64 centerXAnchor]);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView centerXAnchor](self, "centerXAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v62]);
  v80[4] = v61;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView footerView](self, "footerView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue([v60 topAnchor]);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView contentViewContainer](self, "contentViewContainer"));
  v57 = (void *)objc_claimAutoreleasedReturnValue([v59 bottomAnchor]);
  objc_super v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v58 constraintEqualToAnchor:v57]);
  footerToContainerVerticalConstraint = self->_footerToContainerVerticalConstraint;
  self->_footerToContainerVerticalConstraint = v11;

  v80[5] = v11;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView footerView](self, "footerView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue([v56 centerXAnchor]);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView centerXAnchor](self, "centerXAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54]);
  v80[6] = v53;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView footerView](self, "footerView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 leadingAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView leadingAnchor](self, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintGreaterThanOrEqualToAnchor:v15]);
  v80[7] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView footerView](self, "footerView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 trailingAnchor]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView trailingAnchor](self, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintLessThanOrEqualToAnchor:v19]);
  v80[8] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v80, 9LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v21);

  v22 = self->_viewBottomConstraint;
  v79[0] = self->_viewTopConstraint;
  v79[1] = v22;
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 2LL));
  verticalConstraints = self->_verticalConstraints;
  self->_verticalConstraints = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView contentViewContainer](self, "contentViewContainer"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 topAnchor]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView topAnchor](self, "topAnchor"));
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v27 constant:0.0]);
  dockTopConstraint = self->_dockTopConstraint;
  self->_dockTopConstraint = v28;

  v78[0] = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView bottomAnchor](self, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView footerView](self, "footerView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 bottomAnchor]);
  v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v32 constant:0.0]);
  dockBottomConstraint = self->_dockBottomConstraint;
  self->_dockBottomConstraint = v33;

  v78[1] = v33;
  v35 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v78, 2LL));
  dockVerticalConstraints = self->_dockVerticalConstraints;
  self->_dockVerticalConstraints = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView contentViewContainer](self, "contentViewContainer"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 topAnchor]);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 topAnchor]);
  v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v38 constraintGreaterThanOrEqualToAnchor:v40]);
  dockTopSafeConstraint = self->_dockTopSafeConstraint;
  self->_dockTopSafeConstraint = v41;

  v77[0] = v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 bottomAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView footerView](self, "footerView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue([v45 bottomAnchor]);
  v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v44 constraintGreaterThanOrEqualToAnchor:v46]);
  dockBottomSafeConstraint = self->_dockBottomSafeConstraint;
  self->_dockBottomSafeConstraint = v47;

  v77[1] = v47;
  v49 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77, 2LL));
  dockVerticalPortraitConstraints = self->_dockVerticalPortraitConstraints;
  self->_dockVerticalPortraitConstraints = v49;

  LODWORD(v51) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_dockTopConstraint, "setPriority:", v51);
  LODWORD(v52) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_dockBottomConstraint, "setPriority:", v52);
}

- (void)updateConstraints
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SCATModernMenuBackgroundContainerView;
  -[SCATModernMenuBackgroundContainerView updateConstraints](&v24, "updateConstraints");
  -[SCATModernMenuBackgroundContainerView contentPadding](self, "contentPadding");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView viewTopConstraint](self, "viewTopConstraint"));
  [v11 setConstant:v4];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView viewBottomConstraint](self, "viewBottomConstraint"));
  [v12 setConstant:v8];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView viewLeadingConstraint](self, "viewLeadingConstraint"));
  [v13 setConstant:v6];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView viewTrailingConstraint](self, "viewTrailingConstraint"));
  [v14 setConstant:-v10];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView dockTopConstraint](self, "dockTopConstraint"));
  [v15 setConstant:v4];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView dockBottomConstraint](self, "dockBottomConstraint"));
  [v16 setConstant:v8];

  if (!-[SCATModernMenuBackgroundContainerView shouldUseDockContentPadding](self, "shouldUseDockContentPadding"))
  {
    +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  self->_dockVerticalPortraitConstraints);
    +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  self->_dockVerticalConstraints);
    verticalConstraints = self->_verticalConstraints;
    goto LABEL_5;
  }

  +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  self->_verticalConstraints);
  +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  self->_dockVerticalConstraints);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned int v18 = [v17 isLandscape];

  verticalConstraints = self->_dockVerticalPortraitConstraints;
  if (!v18)
  {
LABEL_5:
    +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  verticalConstraints);
    goto LABEL_6;
  }

  +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  verticalConstraints);
LABEL_6:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SCATMenuLabel titleFont](&OBJC_CLASS___SCATMenuLabel, "titleFont"));
  [v20 descender];
  double v22 = v8 + v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuBackgroundContainerView footerToContainerVerticalConstraint]( self,  "footerToContainerVerticalConstraint"));
  [v23 setConstant:v22];
}

- (NSLayoutConstraint)footerViewHiddenConstraint
{
  footerViewHiddenConstraint = self->_footerViewHiddenConstraint;
  if (!footerViewHiddenConstraint)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView footerView](self, "footerView"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 heightAnchor]);
    double v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v5 constraintEqualToConstant:0.0]);
    double v7 = self->_footerViewHiddenConstraint;
    self->_footerViewHiddenConstraint = v6;

    footerViewHiddenConstraint = self->_footerViewHiddenConstraint;
  }

  return footerViewHiddenConstraint;
}

- (void)setShowingFooterView:(BOOL)a3
{
  if (self->_showingFooterView != a3)
  {
    self->_showingFooterView = a3;
    double v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuBackgroundContainerView footerViewHiddenConstraint]( self,  "footerViewHiddenConstraint"));
    [v4 setActive:!self->_showingFooterView];

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuBackgroundContainerView footerView](self, "footerView"));
    [v5 setHidden:!self->_showingFooterView];

    -[SCATModernMenuBackgroundContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

- (void)setShouldUseDockContentPadding:(BOOL)a3
{
  if (self->_shouldUseDockContentPadding != a3)
  {
    self->_shouldUseDockContentPadding = a3;
    -[SCATModernMenuBackgroundContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

- (void)setDockPosition:(int64_t)a3
{
  if (self->_dockPosition != a3)
  {
    self->_dockPosition = a3;
    -[SCATModernMenuBackgroundContainerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

- (void)orientationDidChange
{
}

- (UIEdgeInsets)contentPadding
{
  double v2 = 23.0;
  double v3 = 20.0;
  double v4 = 30.0;
  double v5 = 20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (SCATModernMenuContentViewContainer)contentViewContainer
{
  return self->_contentViewContainer;
}

- (void)setContentViewContainer:(id)a3
{
}

- (SCATModernMenuFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (BOOL)isShowingFooterView
{
  return self->_showingFooterView;
}

- (BOOL)shouldUseDockContentPadding
{
  return self->_shouldUseDockContentPadding;
}

- (int64_t)dockPosition
{
  return self->_dockPosition;
}

- (NSLayoutConstraint)viewTopConstraint
{
  return self->_viewTopConstraint;
}

- (void)setViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)viewBottomConstraint
{
  return self->_viewBottomConstraint;
}

- (void)setViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)viewLeadingConstraint
{
  return self->_viewLeadingConstraint;
}

- (void)setViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)viewTrailingConstraint
{
  return self->_viewTrailingConstraint;
}

- (void)setViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)footerToContainerVerticalConstraint
{
  return self->_footerToContainerVerticalConstraint;
}

- (void)setFooterToContainerVerticalConstraint:(id)a3
{
}

- (NSArray)verticalConstraints
{
  return self->_verticalConstraints;
}

- (void)setVerticalConstraints:(id)a3
{
}

- (NSArray)dockVerticalConstraints
{
  return self->_dockVerticalConstraints;
}

- (void)setDockVerticalConstraints:(id)a3
{
}

- (NSArray)dockVerticalPortraitConstraints
{
  return self->_dockVerticalPortraitConstraints;
}

- (void)setDockVerticalPortraitConstraints:(id)a3
{
}

- (NSLayoutConstraint)dockTopConstraint
{
  return self->_dockTopConstraint;
}

- (void)setDockTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockBottomConstraint
{
  return self->_dockBottomConstraint;
}

- (void)setDockBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockTopSafeConstraint
{
  return self->_dockTopSafeConstraint;
}

- (void)setDockTopSafeConstraint:(id)a3
{
}

- (NSLayoutConstraint)dockBottomSafeConstraint
{
  return self->_dockBottomSafeConstraint;
}

- (void)setDockBottomSafeConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end