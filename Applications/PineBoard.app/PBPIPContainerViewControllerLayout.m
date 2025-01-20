@interface PBPIPContainerViewControllerLayout
- (BOOL)_shouldDodgeFocusedFrame:(CGRect)a3;
- (BOOL)isKeyboardFocused;
- (CGRect)lastFocusedFrame;
- (CGRect)preferredIntrinsicFrame;
- (CGRect)preferredPictureInPictureFrameForQuadrant:(int64_t)a3 pipInsets:(UIEdgeInsets)a4;
- (CGSize)_preferredPictureInPictureSizeAllowingPortrait:(BOOL)a3;
- (CGSize)maxPictureInPictureSizeForAspectRatio:(double)a3;
- (CGSize)preferredFullscreenSize;
- (CGSize)preferredIntrinsicSize;
- (CGSize)preferredLandscapeBoundingSize;
- (CGSize)preferredPictureInPictureInstrisicContentSize;
- (CGSize)preferredPictureInPictureSize;
- (NSArray)constraintsFillingParentView;
- (NSArray)constraintsFittingParentView;
- (NSLayoutConstraint)accessoryLeftConstraint;
- (NSLayoutConstraint)accessoryRightConstraint;
- (NSLayoutConstraint)accessoryYCenterConstraint;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)framedHeightConstraint;
- (NSLayoutConstraint)framedLeftConstraint;
- (NSLayoutConstraint)framedTopConstraint;
- (NSLayoutConstraint)framedWidthConstraint;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)leftConstraint;
- (NSLayoutConstraint)leftConstraintWithAccessory;
- (NSLayoutConstraint)preferredBottomConstraint;
- (NSLayoutConstraint)preferredHeightConstraint;
- (NSLayoutConstraint)preferredLeftConstraint;
- (NSLayoutConstraint)preferredRightConstraint;
- (NSLayoutConstraint)preferredTopConstraint;
- (NSLayoutConstraint)preferredWidthConstraint;
- (NSLayoutConstraint)rightConstraint;
- (NSLayoutConstraint)rightConstraintWithAccessory;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)widthConstraint;
- (OS_dispatch_source)focusDodgingTimer;
- (PBPIPContainerViewController)containerViewController;
- (PBPIPContainerViewControllerLayout)initWithContainerViewController:(id)a3;
- (PBPIPContainerViewControllerLayoutDelegate)delegate;
- (PBSplitViewGeometry)splitViewGeometry;
- (PGPictureInPictureApplication)application;
- (UILayoutGuide)preferredPositionLayoutGuide;
- (UIViewController)accessoryViewController;
- (double)contentAspectRatio;
- (id)_allConstraints;
- (id)_parentView;
- (id)_pipLayoutGuide;
- (id)_positionConstraintsForAccessoryFullyVisibleForQuadrant:(int64_t)a3;
- (id)_positionConstraintsForAccessoryPreparedToAppearForQuadrant:(int64_t)a3;
- (id)_positionConstraintsForNoAccessoryForQuadrant:(int64_t)a3;
- (int)keyboardFocusedNotifyToken;
- (int64_t)accessoryState;
- (int64_t)appearanceStyle;
- (int64_t)quadrant;
- (int64_t)state;
- (void)_cancelUpdateForDodgingFocusedFrame;
- (void)_handleKeyboardNotification;
- (void)_layoutIfNeededAnimated:(BOOL)a3 completion:(id)a4;
- (void)_notifyDelegateDidUpdateConstraints;
- (void)_registerForKeyboardNotifications;
- (void)_setUpConstraints;
- (void)_stageUpdateForDodgingFocusedFrame;
- (void)_unregisterFromKeyboardNotifications;
- (void)_updateConstraintsForFocusedFrame:(CGRect)a3 shouldDodge:(BOOL)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAccessoryState:(int64_t)a3;
- (void)setAppearanceStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsKeyboardFocused:(BOOL)a3;
- (void)setSplitViewGeometry:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateConstraintsFillingParentView;
- (void)updateConstraintsFillingWorkspaceApplicationHostingView;
- (void)updateConstraintsFittingParentView;
- (void)updateConstraintsForFocusedFrame:(CGRect)a3;
- (void)updateConstraintsForNestedSplitView;
- (void)updateConstraintsForPictureInPictureQuadrant:(int64_t)a3;
- (void)updateConstraintsForPreferredPictureInPictureSize;
- (void)updateConstraintsForStashedState;
- (void)updateConstraintsForUnstashedState;
@end

@implementation PBPIPContainerViewControllerLayout

- (PBPIPContainerViewControllerLayout)initWithContainerViewController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBPIPContainerViewControllerLayout;
  v6 = -[PBPIPContainerViewControllerLayout init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containerViewController, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 pictureInPictureViewController]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 pagingAccessoryViewController]);
    accessoryViewController = v7->_accessoryViewController;
    v7->_accessoryViewController = (UIViewController *)v9;

    CGSize size = CGRectZero.size;
    v7->_lastFocusedFrame.origin = CGRectZero.origin;
    v7->_lastFocusedFrame.CGSize size = size;
    -[PBPIPContainerViewControllerLayout _setUpConstraints](v7, "_setUpConstraints");
    v7->_isKeyboardFocused = 0;
    -[PBPIPContainerViewControllerLayout _registerForKeyboardNotifications](v7, "_registerForKeyboardNotifications");
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBPIPContainerViewControllerLayout;
  -[PBPIPContainerViewControllerLayout dealloc](&v3, "dealloc");
}

- (void)_setUpConstraints
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewController view](self->_containerViewController, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _parentView](self, "_parentView"));
  v122 = (void *)objc_claimAutoreleasedReturnValue([v3 topAnchor]);
  v120 = (void *)objc_claimAutoreleasedReturnValue([v4 topAnchor]);
  v119 = (void *)objc_claimAutoreleasedReturnValue([v122 constraintEqualToAnchor:v120]);
  v125[0] = v119;
  v118 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomAnchor]);
  v117 = (void *)objc_claimAutoreleasedReturnValue([v4 bottomAnchor]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v118 constraintEqualToAnchor:v117]);
  v125[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 leadingAnchor]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v7]);
  v125[2] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 trailingAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 trailingAnchor]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10]);
  v125[3] = v11;
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v125, 4LL));
  constraintsFillingParentView = self->_constraintsFillingParentView;
  self->_constraintsFillingParentView = v12;

  -[PBPIPContainerViewControllerLayout preferredIntrinsicSize](self, "preferredIntrinsicSize");
  double v15 = v14;
  double v17 = v16;
  v123 = (void *)objc_claimAutoreleasedReturnValue([v3 widthAnchor]);
  v121 = (void *)objc_claimAutoreleasedReturnValue([v123 constraintEqualToConstant:v15]);
  v124[0] = v121;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 heightAnchor]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToConstant:v17]);
  v124[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v21 = v4;
  v116 = v4;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 centerXAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v22]);
  v124[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 centerYAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v21 centerYAnchor]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25]);
  v124[3] = v26;
  v27 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v124, 4LL));
  constraintsFittingParentView = self->_constraintsFittingParentView;
  self->_constraintsFittingParentView = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _pipLayoutGuide](self, "_pipLayoutGuide"));
  -[PBPIPContainerViewControllerLayout preferredPictureInPictureSize](self, "preferredPictureInPictureSize");
  double v31 = v30;
  double v33 = v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v3 heightAnchor]);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToConstant:v33]);
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue([v3 widthAnchor]);
  v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToConstant:v31]);
  widthConstraint = self->_widthConstraint;
  self->_widthConstraint = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue([v3 topAnchor]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v29 topAnchor]);
  v42 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v41]);
  topConstraint = self->_topConstraint;
  self->_topConstraint = v42;

  v44 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v29 bottomAnchor]);
  v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v45]);
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v46;

  v48 = (void *)objc_claimAutoreleasedReturnValue([v3 leftAnchor]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v29 leftAnchor]);
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v49]);
  leftConstraint = self->_leftConstraint;
  self->_leftConstraint = v50;

  v52 = (void *)objc_claimAutoreleasedReturnValue([v3 rightAnchor]);
  v53 = (void *)objc_claimAutoreleasedReturnValue([v29 rightAnchor]);
  v54 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v53]);
  rightConstraint = self->_rightConstraint;
  self->_rightConstraint = v54;

  v56 = (void *)objc_claimAutoreleasedReturnValue([v3 topAnchor]);
  v57 = (void *)objc_claimAutoreleasedReturnValue([v116 topAnchor]);
  v58 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v57]);
  framedTopConstraint = self->_framedTopConstraint;
  self->_framedTopConstraint = v58;

  v60 = (void *)objc_claimAutoreleasedReturnValue([v3 leftAnchor]);
  v61 = (void *)objc_claimAutoreleasedReturnValue([v116 leftAnchor]);
  v62 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v60 constraintEqualToAnchor:v61]);
  framedLeftConstraint = self->_framedLeftConstraint;
  self->_framedLeftConstraint = v62;

  v64 = (void *)objc_claimAutoreleasedReturnValue([v3 heightAnchor]);
  v65 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToConstant:v33]);
  framedHeightConstraint = self->_framedHeightConstraint;
  self->_framedHeightConstraint = v65;

  v67 = (void *)objc_claimAutoreleasedReturnValue([v3 widthAnchor]);
  v68 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToConstant:v31]);
  framedWidthConstraint = self->_framedWidthConstraint;
  self->_framedWidthConstraint = v68;

  v70 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
  preferredPositionLayoutGuide = self->_preferredPositionLayoutGuide;
  self->_preferredPositionLayoutGuide = v70;

  [v116 addLayoutGuide:self->_preferredPositionLayoutGuide];
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](self->_preferredPositionLayoutGuide, "heightAnchor"));
  v73 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToConstant:v33]);
  preferredHeightConstraint = self->_preferredHeightConstraint;
  self->_preferredHeightConstraint = v73;

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_preferredPositionLayoutGuide, "widthAnchor"));
  v76 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v75 constraintEqualToConstant:v31]);
  preferredWidthConstraint = self->_preferredWidthConstraint;
  self->_preferredWidthConstraint = v76;

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_preferredPositionLayoutGuide, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue([v29 topAnchor]);
  v80 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v78 constraintEqualToAnchor:v79]);
  preferredTopConstraint = self->_preferredTopConstraint;
  self->_preferredTopConstraint = v80;

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_preferredPositionLayoutGuide, "bottomAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue([v29 bottomAnchor]);
  v84 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v82 constraintEqualToAnchor:v83]);
  preferredBottomConstraint = self->_preferredBottomConstraint;
  self->_preferredBottomConstraint = v84;

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](self->_preferredPositionLayoutGuide, "leftAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue([v29 leftAnchor]);
  v88 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v86 constraintEqualToAnchor:v87]);
  preferredLeftConstraint = self->_preferredLeftConstraint;
  self->_preferredLeftConstraint = v88;

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](self->_preferredPositionLayoutGuide, "rightAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue([v29 rightAnchor]);
  v92 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v90 constraintEqualToAnchor:v91]);
  preferredRightConstraint = self->_preferredRightConstraint;
  self->_preferredRightConstraint = v92;

  accessoryViewController = self->_accessoryViewController;
  if (accessoryViewController)
  {
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](accessoryViewController, "view"));
    v96 = (void *)objc_claimAutoreleasedReturnValue([v95 leftAnchor]);
    v97 = (void *)objc_claimAutoreleasedReturnValue([v29 leftAnchor]);
    v98 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v96 constraintEqualToAnchor:v97]);
    leftConstraintWithAccessory = self->_leftConstraintWithAccessory;
    self->_leftConstraintWithAccessory = v98;

    v100 = (void *)objc_claimAutoreleasedReturnValue([v95 rightAnchor]);
    v101 = (void *)objc_claimAutoreleasedReturnValue([v29 rightAnchor]);
    v102 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v100 constraintEqualToAnchor:v101]);
    rightConstraintWithAccessory = self->_rightConstraintWithAccessory;
    self->_rightConstraintWithAccessory = v102;

    v104 = (void *)objc_claimAutoreleasedReturnValue([v3 centerYAnchor]);
    v105 = (void *)objc_claimAutoreleasedReturnValue([v95 centerYAnchor]);
    v106 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v104 constraintEqualToAnchor:v105]);
    accessoryYCenterConstraint = self->_accessoryYCenterConstraint;
    self->_accessoryYCenterConstraint = v106;

    v108 = (void *)objc_claimAutoreleasedReturnValue([v3 leftAnchor]);
    v109 = (void *)objc_claimAutoreleasedReturnValue([v95 rightAnchor]);
    v110 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v108 constraintEqualToAnchor:v109 constant:16.0]);
    accessoryLeftConstraint = self->_accessoryLeftConstraint;
    self->_accessoryLeftConstraint = v110;

    v112 = (void *)objc_claimAutoreleasedReturnValue([v95 leftAnchor]);
    v113 = (void *)objc_claimAutoreleasedReturnValue([v3 rightAnchor]);
    v114 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v112 constraintEqualToAnchor:v113 constant:16.0]);
    accessoryRightConstraint = self->_accessoryRightConstraint;
    self->_accessoryRightConstraint = v114;
  }
}

- (void)setSplitViewGeometry:(id)a3
{
  id v5 = (PBSplitViewGeometry *)a3;
  splitViewGeometry = self->_splitViewGeometry;
  if (splitViewGeometry != v5)
  {
    -[PBSplitViewGeometry removeObserverForInsetFrame:](splitViewGeometry, "removeObserverForInsetFrame:", self);
    objc_storeStrong((id *)&self->_splitViewGeometry, a3);
    -[PBSplitViewGeometry addObserverForInsetFrame:](self->_splitViewGeometry, "addObserverForInsetFrame:", self);
  }
}

- (PGPictureInPictureApplication)application
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout containerViewController](self, "containerViewController"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pictureInPictureViewController]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 application]);

  return (PGPictureInPictureApplication *)v4;
}

- (double)contentAspectRatio
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewController pictureInPictureViewController]( self->_containerViewController,  "pictureInPictureViewController"));
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  return v4 / v6;
}

- (CGSize)preferredPictureInPictureSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_preferredPictureInPictureSizeAllowingPortrait:(BOOL)a3
{
  BOOL v3 = a3;
  -[PBPIPContainerViewControllerLayout contentAspectRatio](self, "contentAspectRatio");
  double v6 = v5;
  if (self->_appearanceStyle == 1)
  {
    splitViewGeometry = self->_splitViewGeometry;
    if (splitViewGeometry)
    {
      -[PBSplitViewGeometry insetFrameForEdges:](splitViewGeometry, "insetFrameForEdges:", 15LL);
      double v8 = 320.0;
      double v10 = fmax(v9, 320.0);
      if (!v3) {
        goto LABEL_12;
      }
    }

    else
    {
      double v8 = 320.0;
      double v10 = 320.0;
      if (!v3)
      {
LABEL_12:
        if (BSFloatGreaterThanOrEqualToFloat(v6, 1.0))
        {
          if (v10 / v6 < v8) {
            double v8 = v10 / v6;
          }
        }

        else if (v6 * v8 < v10)
        {
          double v10 = v6 * v8;
        }

        id v13 = sub_100083780();
        double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v25.width = v10;
          v25.height = v8;
          double v15 = NSStringFromCGSize(v25);
          double v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          int v19 = 138412802;
          v20 = v16;
          __int16 v21 = 2048;
          double v22 = v10 / v8;
          __int16 v23 = 2048;
          double v24 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PiP size: %@, aspectRatio: %f, contentAspectRatio: %f",  (uint8_t *)&v19,  0x20u);
        }

        goto LABEL_21;
      }
    }
  }

  else
  {
    -[PBPIPContainerViewControllerLayout maxPictureInPictureSizeForAspectRatio:]( self,  "maxPictureInPictureSizeForAspectRatio:",  v5);
    double v10 = v11;
    double v8 = v12;
    if (!v3) {
      goto LABEL_12;
    }
  }

  if (v6 >= v10 / v8) {
    goto LABEL_12;
  }
  if (v8 / (1.0 / v6) < v10) {
    double v10 = v8 / (1.0 / v6);
  }
LABEL_21:
  double v17 = v10;
  double v18 = v8;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)preferredPictureInPictureInstrisicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)preferredFullscreenSize
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _parentView](self, "_parentView"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)preferredIntrinsicSize
{
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGRect)preferredIntrinsicFrame
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewController pictureInPictureViewController]( self->_containerViewController,  "pictureInPictureViewController"));
  [v3 preferredContentSize];
  CGFloat v5 = v4;
  CGFloat v7 = v6;

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _parentView](self, "_parentView"));
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v25.CGFloat width = v5;
  v25.CGFloat height = v7;
  v28.origin.CGFloat x = v10;
  v28.origin.CGFloat y = v12;
  v28.size.CGFloat width = v14;
  v28.size.CGFloat height = v16;
  CGRect v26 = AVMakeRectWithAspectRatioInsideRect(v25, v28);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGSize)preferredLandscapeBoundingSize
{
  double v4 = v3;
  -[PBPIPContainerViewControllerLayout maxPictureInPictureSizeForAspectRatio:]( self,  "maxPictureInPictureSizeForAspectRatio:");
  if (v4 >= v5 / v6) {
    -[PBPIPContainerViewControllerLayout preferredIntrinsicSize](self, "preferredIntrinsicSize");
  }
  else {
    -[PBPIPContainerViewControllerLayout preferredFullscreenSize](self, "preferredFullscreenSize");
  }
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)maxPictureInPictureSizeForAspectRatio:(double)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout application](self, "application"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationForBundleIdentifier:v7]);

  if ([v8 isFaceTime])
  {
    if ((BSFloatEqualToFloat(a3, 1.0) & 1) != 0)
    {
      double v9 = 320.0;
      double v10 = 320.0;
    }

    else
    {
      int v11 = BSFloatGreaterThanFloat(a3, 1.0);
      if (v11) {
        double v9 = 518.0;
      }
      else {
        double v9 = 320.0;
      }
      if (v11) {
        double v10 = 320.0;
      }
      else {
        double v10 = 518.0;
      }
    }
  }

  else
  {
    double v10 = 320.0;
    double v9 = 570.0;
  }

  double v12 = v9;
  double v13 = v10;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (CGRect)preferredPictureInPictureFrameForQuadrant:(int64_t)a3 pipInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout containerViewController](self, "containerViewController"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 parentViewController]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);

  -[PBPIPContainerViewControllerLayout preferredPictureInPictureSize](self, "preferredPictureInPictureSize");
  double v14 = v13;
  double v16 = v15;
  switch(a3)
  {
    case 0LL:
      [v12 frame];
      double left = CGRectGetMaxX(v21) - right - v14;
      break;
    case 1LL:
      break;
    case 2LL:
      goto LABEL_5;
    case 3LL:
      [v12 frame];
      double left = CGRectGetMaxX(v22) - right - v14;
LABEL_5:
      [v12 frame];
      double top = CGRectGetMaxY(v23) - bottom - v16;
      break;
    default:
      double top = 0.0;
      double left = 0.0;
      break;
  }

  double v17 = left;
  double v18 = top;
  double v19 = v14;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)setAccessoryState:(int64_t)a3
{
  if (self->_accessoryViewController)
  {
    self->_accessoryState = a3;
    -[PBPIPContainerViewControllerLayout updateConstraintsForPictureInPictureQuadrant:]( self,  "updateConstraintsForPictureInPictureQuadrant:",  self->_quadrant);
  }

  else
  {
    self->_accessoryState = 0LL;
  }

- (id)_positionConstraintsForNoAccessoryForQuadrant:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      topConstraint = self->_topConstraint;
      p_topConstraint = &topConstraint;
      uint64_t v4 = 26LL;
      uint64_t v5 = 23LL;
      goto LABEL_8;
    case 1LL:
      int v11 = self->_topConstraint;
      p_topConstraint = &v11;
      uint64_t v4 = 25LL;
      uint64_t v5 = 23LL;
      goto LABEL_6;
    case 2LL:
      bottomConstraint = self->_bottomConstraint;
      p_topConstraint = &bottomConstraint;
      uint64_t v4 = 25LL;
      uint64_t v5 = 24LL;
LABEL_6:
      uint64_t v7 = 14LL;
      goto LABEL_9;
    case 3LL:
      double v13 = self->_bottomConstraint;
      p_topConstraint = &v13;
      uint64_t v4 = 26LL;
      uint64_t v5 = 24LL;
LABEL_8:
      uint64_t v7 = 15LL;
LABEL_9:
      Class v8 = (&self->super.isa)[v5];
      p_topConstraint[1] = (NSLayoutConstraint *)(&self->super.isa)[v7];
      p_topConstraint[2] = (NSLayoutConstraint *)v8;
      p_topConstraint[3] = (NSLayoutConstraint *)(&self->super.isa)[v4];
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:"));
      break;
    default:
      double v6 = 0LL;
      break;
  }

  return v6;
}

- (id)_positionConstraintsForAccessoryPreparedToAppearForQuadrant:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      double v3 = &topConstraint;
      topConstraint = self->_topConstraint;
      uint64_t v4 = 29LL;
      uint64_t v5 = 26LL;
      uint64_t v6 = 23LL;
      goto LABEL_8;
    case 1LL:
      double v3 = &v13;
      double v13 = self->_topConstraint;
      uint64_t v4 = 28LL;
      uint64_t v5 = 25LL;
      uint64_t v6 = 23LL;
      goto LABEL_6;
    case 2LL:
      double v3 = &bottomConstraint;
      bottomConstraint = self->_bottomConstraint;
      uint64_t v4 = 28LL;
      uint64_t v5 = 25LL;
      uint64_t v6 = 24LL;
LABEL_6:
      uint64_t v8 = 14LL;
      goto LABEL_9;
    case 3LL:
      double v3 = &v15;
      double v15 = self->_bottomConstraint;
      uint64_t v4 = 29LL;
      uint64_t v5 = 26LL;
      uint64_t v6 = 24LL;
LABEL_8:
      uint64_t v8 = 15LL;
LABEL_9:
      Class v9 = (&self->super.isa)[v6];
      v3[1] = (NSLayoutConstraint *)(&self->super.isa)[v8];
      v3[2] = (NSLayoutConstraint *)v9;
      accessoryYCenterConstraint = self->_accessoryYCenterConstraint;
      v3[3] = (NSLayoutConstraint *)(&self->super.isa)[v5];
      v3[4] = accessoryYCenterConstraint;
      v3[5] = (NSLayoutConstraint *)(&self->super.isa)[v4];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:"));
      break;
    default:
      uint64_t v7 = 0LL;
      break;
  }

  return v7;
}

- (id)_positionConstraintsForAccessoryFullyVisibleForQuadrant:(int64_t)a3
{
  switch(a3)
  {
    case 0LL:
      double v3 = &topConstraint;
      topConstraint = self->_topConstraint;
      uint64_t v4 = 29LL;
      uint64_t v5 = 26LL;
      uint64_t v6 = 23LL;
      goto LABEL_8;
    case 1LL:
      double v3 = &v13;
      double v13 = self->_topConstraint;
      uint64_t v4 = 28LL;
      uint64_t v5 = 25LL;
      uint64_t v6 = 23LL;
      goto LABEL_6;
    case 2LL:
      double v3 = &bottomConstraint;
      bottomConstraint = self->_bottomConstraint;
      uint64_t v4 = 28LL;
      uint64_t v5 = 25LL;
      uint64_t v6 = 24LL;
LABEL_6:
      uint64_t v8 = 30LL;
      goto LABEL_9;
    case 3LL:
      double v3 = &v15;
      double v15 = self->_bottomConstraint;
      uint64_t v4 = 29LL;
      uint64_t v5 = 26LL;
      uint64_t v6 = 24LL;
LABEL_8:
      uint64_t v8 = 31LL;
LABEL_9:
      Class v9 = (&self->super.isa)[v6];
      v3[1] = (NSLayoutConstraint *)(&self->super.isa)[v8];
      v3[2] = (NSLayoutConstraint *)v9;
      accessoryYCenterConstraint = self->_accessoryYCenterConstraint;
      v3[3] = (NSLayoutConstraint *)(&self->super.isa)[v5];
      v3[4] = accessoryYCenterConstraint;
      v3[5] = (NSLayoutConstraint *)(&self->super.isa)[v4];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:"));
      break;
    default:
      uint64_t v7 = 0LL;
      break;
  }

  return v7;
}

- (void)updateConstraintsForPictureInPictureQuadrant:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _allConstraints](self, "_allConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v5);

  int64_t accessoryState = self->_accessoryState;
  if (accessoryState == 2)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewControllerLayout _positionConstraintsForAccessoryFullyVisibleForQuadrant:]( self,  "_positionConstraintsForAccessoryFullyVisibleForQuadrant:",  a3));
    goto LABEL_7;
  }

  if (accessoryState == 1)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewControllerLayout _positionConstraintsForAccessoryPreparedToAppearForQuadrant:]( self,  "_positionConstraintsForAccessoryPreparedToAppearForQuadrant:",  a3));
    goto LABEL_7;
  }

  uint64_t v7 = 0LL;
  if (!accessoryState)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[PBPIPContainerViewControllerLayout _positionConstraintsForNoAccessoryForQuadrant:]( self,  "_positionConstraintsForNoAccessoryForQuadrant:",  a3));
LABEL_7:
    uint64_t v7 = (void *)v8;
  }

  __int128 v12 = *(_OWORD *)&self->_heightConstraint;
  preferredWidthConstraint = self->_preferredWidthConstraint;
  preferredHeightConstraint = self->_preferredHeightConstraint;
  double v14 = preferredWidthConstraint;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 4LL));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 arrayByAddingObjectsFromArray:v10]);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v11);
  -[PBPIPContainerViewControllerLayout setState:](self, "setState:", 0LL);
  self->_quadrant = a3;
  -[PBPIPContainerViewControllerLayout _notifyDelegateDidUpdateConstraints](self, "_notifyDelegateDidUpdateConstraints");
}

- (void)updateConstraintsFillingParentView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _allConstraints](self, "_allConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v3);

  +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  self->_constraintsFillingParentView);
  -[PBPIPContainerViewControllerLayout setState:](self, "setState:", 1LL);
}

- (void)updateConstraintsFittingParentView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _allConstraints](self, "_allConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v3);

  +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  self->_constraintsFittingParentView);
  -[PBPIPContainerViewControllerLayout setState:](self, "setState:", 1LL);
}

- (void)updateConstraintsFillingWorkspaceApplicationHostingView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _parentView](self, "_parentView"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 window]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 coordinateSpace]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mainWorkspace]);
  [v7 frameForSceneWithKey:@"application" onCoordinateSpace:v5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _allConstraints](self, "_allConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v16);

  -[NSLayoutConstraint setConstant:](self->_framedTopConstraint, "setConstant:", v11);
  -[NSLayoutConstraint setConstant:](self->_framedLeftConstraint, "setConstant:", v9);
  -[NSLayoutConstraint setConstant:](self->_framedHeightConstraint, "setConstant:", v15);
  -[NSLayoutConstraint setConstant:](self->_framedWidthConstraint, "setConstant:", v13);
  framedTopConstraint = self->_framedTopConstraint;
  __int128 v19 = *(_OWORD *)&self->_framedLeftConstraint;
  framedWidthConstraint = self->_framedWidthConstraint;
  double v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &framedTopConstraint,  4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v17);
  -[PBPIPContainerViewControllerLayout setState:](self, "setState:", 1LL);
}

- (void)updateConstraintsForNestedSplitView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _allConstraints](self, "_allConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v5 = [v4 userInterfaceLayoutDirection];

  if (v5 == (id)1)
  {
    topConstraint = self->_topConstraint;
    p_topConstraint = &topConstraint;
    uint64_t v7 = 25LL;
    uint64_t v8 = 14LL;
  }

  else
  {
    CGRect v21 = self->_topConstraint;
    p_topConstraint = &v21;
    uint64_t v7 = 26LL;
    uint64_t v8 = 15LL;
  }

  preferredTopConstraint = self->_preferredTopConstraint;
  p_topConstraint[1] = (NSLayoutConstraint *)(&self->super.isa)[v8];
  p_topConstraint[2] = preferredTopConstraint;
  p_topConstraint[3] = (NSLayoutConstraint *)(&self->super.isa)[v7];
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:"));
  -[PBPIPContainerViewControllerLayout preferredPictureInPictureSize](self, "preferredPictureInPictureSize");
  double v12 = v11;
  double v14 = v13;
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v13);
  -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", v12);
  -[NSLayoutConstraint setConstant:](self->_preferredHeightConstraint, "setConstant:", v14);
  -[NSLayoutConstraint setConstant:](self->_preferredWidthConstraint, "setConstant:", v12);
  __int128 v18 = *(_OWORD *)&self->_heightConstraint;
  preferredWidthConstraint = self->_preferredWidthConstraint;
  preferredHeightConstraint = self->_preferredHeightConstraint;
  double v20 = preferredWidthConstraint;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 4LL));
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v10 arrayByAddingObjectsFromArray:v16]);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v17);
  -[PBPIPContainerViewControllerLayout setState:](self, "setState:", 0LL);
  -[PBPIPContainerViewControllerLayout _notifyDelegateDidUpdateConstraints](self, "_notifyDelegateDidUpdateConstraints");
}

- (void)updateConstraintsForFocusedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_lastFocusedFrame = a3;
  if (-[PBPIPContainerViewControllerLayout _shouldDodgeFocusedFrame:](self, "_shouldDodgeFocusedFrame:"))
  {
    -[PBPIPContainerViewControllerLayout _stageUpdateForDodgingFocusedFrame](self, "_stageUpdateForDodgingFocusedFrame");
  }

  else
  {
    -[PBPIPContainerViewControllerLayout _cancelUpdateForDodgingFocusedFrame]( self,  "_cancelUpdateForDodgingFocusedFrame");
    -[PBPIPContainerViewControllerLayout _updateConstraintsForFocusedFrame:shouldDodge:]( self,  "_updateConstraintsForFocusedFrame:shouldDodge:",  0LL,  x,  y,  width,  height);
  }

- (void)_stageUpdateForDodgingFocusedFrame
{
  if (!self->_focusDodgingTimer)
  {
    double v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    focusDodgingTimer = self->_focusDodgingTimer;
    self->_focusDodgingTimer = v3;

    objc_initWeak(&location, self);
    id v5 = self->_focusDodgingTimer;
    dispatch_time_t v6 = dispatch_time(0LL, 200000000LL);
    dispatch_source_set_timer((dispatch_source_t)v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    uint64_t v7 = self->_focusDodgingTimer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001E09E8;
    v8[3] = &unk_1003D0890;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v7, v8);
    dispatch_activate((dispatch_object_t)self->_focusDodgingTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

- (void)_cancelUpdateForDodgingFocusedFrame
{
  focusDodgingTimer = self->_focusDodgingTimer;
  if (focusDodgingTimer)
  {
    dispatch_source_cancel((dispatch_source_t)focusDodgingTimer);
    uint64_t v4 = self->_focusDodgingTimer;
    self->_focusDodgingTimer = 0LL;
  }

- (void)_updateConstraintsForFocusedFrame:(CGRect)a3 shouldDodge:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _pipLayoutGuide](self, "_pipLayoutGuide"));
  [v10 layoutFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  -[PBPIPContainerViewControllerLayout preferredPictureInPictureSize](self, "preferredPictureInPictureSize");
  double v20 = v18 - v19;
  unint64_t quadrant = self->_quadrant;
  BOOL v22 = quadrant >= 2;
  unint64_t v23 = quadrant - 2;
  if (!v22)
  {
    double v24 = y + height - v14 + 60.0;
    if (!v4) {
      double v24 = 0.0;
    }
    if (self->_isKeyboardFocused && v24 > v20) {
      goto LABEL_16;
    }
    topConstraint = self->_topConstraint;
    if (v24 < v20) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  if (v23 <= 1)
  {
    double v24 = y - v14 - v18 + -60.0;
    if (!v4) {
      double v24 = 0.0;
    }
    double v25 = -v20;
    if (self->_isKeyboardFocused && v24 < v25)
    {
LABEL_16:
      -[PBPIPContainerViewControllerLayout preferredPictureInPictureSize](self, "preferredPictureInPictureSize");
      double v30 = v16 - v29;
      int64_t v31 = self->_quadrant;
      if ((unint64_t)(v31 - 1) < 2)
      {
        double v34 = x + width - v12 + 60.0;
        if (!v4) {
          double v34 = 0.0;
        }
        leftConstraint = self->_leftConstraint;
        if (v34 < v30) {
          double v30 = v34;
        }
      }

      else
      {
        if (v31 != 3 && v31) {
          goto LABEL_31;
        }
        double v32 = x - v12 - v16 + -60.0;
        if (!v4) {
          double v32 = 0.0;
        }
        leftConstraint = self->_rightConstraint;
        double v30 = -v30;
        if (v32 >= v30) {
          double v30 = v32;
        }
      }

      -[NSLayoutConstraint setConstant:](leftConstraint, "setConstant:", v30);
LABEL_31:
      uint64_t v27 = 13LL;
      uint64_t v28 = 12LL;
      goto LABEL_32;
    }

    topConstraint = self->_bottomConstraint;
    if (v24 > v25) {
      goto LABEL_10;
    }
LABEL_9:
    double v24 = 0.0;
LABEL_10:
    -[NSLayoutConstraint setConstant:](topConstraint, "setConstant:", v24);
  }

  uint64_t v27 = 14LL;
  uint64_t v28 = 15LL;
LABEL_32:
  -[objc_class setConstant:]((&self->super.isa)[v28], "setConstant:", 0.0);
  -[objc_class setConstant:]((&self->super.isa)[v27], "setConstant:", 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _parentView](self, "_parentView"));
  [v35 setNeedsLayout];

  -[PBPIPContainerViewControllerLayout _layoutIfNeededAnimated:completion:]( self,  "_layoutIfNeededAnimated:completion:",  1LL,  0LL);
}

- (BOOL)_shouldDodgeFocusedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsNull(a3)
    || (v19.origin.CGFloat x = x, v19.origin.y = y, v19.size.width = width, v19.size.height = height, CGRectIsInfinite(v19)))
  {
    LOBYTE(v8) = 0;
  }

  else
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    BOOL v8 = !CGRectIsEmpty(v20);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v9 bounds];
  double v10 = v21.size.width;
  double v11 = v21.size.height;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  CGRect v22 = CGRectIntersection(v21, v25);
  double v12 = fmax(v22.size.height, 0.0) * fmax(v22.size.width, 0.0) / (fmax(v11, 0.0) * fmax(v10, 0.0));

  BOOL v13 = v12 < 0.7 && v8;
  -[UILayoutGuide layoutFrame](self->_preferredPositionLayoutGuide, "layoutFrame");
  v26.origin.CGFloat x = v14;
  v26.origin.CGFloat y = v15;
  v26.size.double width = v16;
  v26.size.double height = v17;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  CGRect v24 = CGRectIntersection(v23, v26);
  return fmax(v24.size.height, 0.0) * fmax(v24.size.width, 0.0) / (fmax(height, 0.0) * fmax(width, 0.0)) > 0.1 && v13;
}

- (void)updateConstraintsForPreferredPictureInPictureSize
{
  double v4 = v3;
  double v6 = v5;
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", v4);
  -[NSLayoutConstraint setConstant:](self->_preferredHeightConstraint, "setConstant:", v6);
  -[NSLayoutConstraint setConstant:](self->_preferredWidthConstraint, "setConstant:", v4);
  -[PBPIPContainerViewControllerLayout _notifyDelegateDidUpdateConstraints](self, "_notifyDelegateDidUpdateConstraints");
}

- (void)updateConstraintsForStashedState
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _pipLayoutGuide](self, "_pipLayoutGuide"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 owningView]);
  [v4 frame];
  double v6 = v5;

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _pipLayoutGuide](self, "_pipLayoutGuide"));
  [v7 layoutFrame];
  double v9 = v8;
  double v11 = v10;

  -[NSLayoutConstraint constant](self->_widthConstraint, "constant");
  int64_t quadrant = self->_quadrant;
  if ((unint64_t)(quadrant - 1) < 2)
  {
    leftConstraint = self->_leftConstraint;
    double v14 = -(v12 + v9 * 2.0);
    goto LABEL_6;
  }

  if (!quadrant || quadrant == 3)
  {
    double v14 = v12 + (v6 - v9 - v11) * 2.0;
    leftConstraint = self->_rightConstraint;
LABEL_6:
    -[NSLayoutConstraint setConstant:](leftConstraint, "setConstant:", v14);
  }

- (void)updateConstraintsForUnstashedState
{
  unint64_t quadrant = self->_quadrant;
  if (quadrant <= 3) {
    [*(id *)((char *)&self->super.isa + qword_1002ECED8[quadrant]) setConstant:0.0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (&off_1003D3188 == a6)
  {
    if (self->_appearanceStyle == 1 && self->_splitViewGeometry) {
      -[PBPIPContainerViewControllerLayout updateConstraintsForNestedSplitView]( self,  "updateConstraintsForNestedSplitView");
    }
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___PBPIPContainerViewControllerLayout;
    -[PBPIPContainerViewControllerLayout observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (id)_parentView
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout containerViewController](self, "containerViewController"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 parentViewController]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);

  return v4;
}

- (id)_pipLayoutGuide
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout containerViewController](self, "containerViewController"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 parentViewController]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___PBPIPRootViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 pipInsetLayoutGuide]);
  }

  else
  {
    id v6 = sub_100083780();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100290FCC((uint64_t)v3, v7);
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v8 safeAreaLayoutGuide]);
  }

  return v5;
}

- (id)_allConstraints
{
  __int128 v16 = *(_OWORD *)&self->_heightConstraint;
  topConstraint = self->_topConstraint;
  __int128 v18 = *(_OWORD *)&self->_bottomConstraint;
  rightConstraint = self->_rightConstraint;
  __int128 v3 = *(_OWORD *)&self->_framedHeightConstraint;
  __int128 v20 = *(_OWORD *)&self->_framedTopConstraint;
  __int128 v21 = v3;
  preferredWidthConstraint = self->_preferredWidthConstraint;
  preferredHeightConstraint = self->_preferredHeightConstraint;
  CGRect v23 = preferredWidthConstraint;
  preferredBottomConstraint = self->_preferredBottomConstraint;
  preferredTopConstraint = self->_preferredTopConstraint;
  CGRect v25 = preferredBottomConstraint;
  preferredRightConstraint = self->_preferredRightConstraint;
  preferredLeftConstraint = self->_preferredLeftConstraint;
  uint64_t v27 = preferredRightConstraint;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 16LL));
  double v8 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v7);
  -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", self->_constraintsFillingParentView);
  -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", self->_constraintsFittingParentView);
  if (self->_accessoryViewController)
  {
    rightConstraintWithAccessorCGFloat y = self->_rightConstraintWithAccessory;
    accessoryRightConstraint = self->_accessoryRightConstraint;
    v13[0] = self->_leftConstraintWithAccessory;
    v13[1] = rightConstraintWithAccessory;
    __int128 v14 = *(_OWORD *)&self->_accessoryYCenterConstraint;
    CGFloat v15 = accessoryRightConstraint;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 5LL));
    -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v11);
  }

  return v8;
}

- (void)_notifyDelegateDidUpdateConstraints
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained containerViewControllerLayoutDidUpdateConstraints:self];
}

- (void)_layoutIfNeededAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    uint64_t v7 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  200.0,  35.0,  0.0,  0.0);
    double v8 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v7,  0.0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001E13D0;
    v14[3] = &unk_1003CFF08;
    v14[4] = self;
    -[UIViewPropertyAnimator addAnimations:](v8, "addAnimations:", v14);
    double v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    id v11 = sub_1001E1400;
    id v12 = &unk_1003D3F80;
    id v13 = v6;
    -[UIViewPropertyAnimator addCompletion:](v8, "addCompletion:", &v9);
    -[UIViewPropertyAnimator startAnimation](v8, "startAnimation", v9, v10, v11, v12);
  }

  else
  {
    uint64_t v7 = (UISpringTimingParameters *)objc_claimAutoreleasedReturnValue(-[PBPIPContainerViewControllerLayout _parentView](self, "_parentView"));
    -[UISpringTimingParameters layoutIfNeeded](v7, "layoutIfNeeded");
  }
}

- (void)_registerForKeyboardNotifications
{
  __int128 v3 = (const char *)UIKeyboardOnScreenNotifyKey;
  BOOL v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001E1500;
  v5[3] = &unk_1003D2CA8;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &self->_keyboardFocusedNotifyToken, &_dispatch_main_q, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_unregisterFromKeyboardNotifications
{
  int keyboardFocusedNotifyToken = self->_keyboardFocusedNotifyToken;
  if (keyboardFocusedNotifyToken != -1)
  {
    notify_cancel(keyboardFocusedNotifyToken);
    self->_int keyboardFocusedNotifyToken = -1;
  }

- (void)_handleKeyboardNotification
{
  uint64_t state64 = 0LL;
  if (notify_get_state(self->_keyboardFocusedNotifyToken, &state64)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = state64 == 1;
  }
  BOOL v4 = v3;
  self->_isKeyboardFocused = v4;
  if (v3) {
    -[PBPIPContainerViewControllerLayout _stageUpdateForDodgingFocusedFrame](self, "_stageUpdateForDodgingFocusedFrame");
  }
}

- (PBPIPContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)accessoryState
{
  return self->_accessoryState;
}

- (PBPIPContainerViewControllerLayoutDelegate)delegate
{
  return (PBPIPContainerViewControllerLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBSplitViewGeometry)splitViewGeometry
{
  return self->_splitViewGeometry;
}

- (UIViewController)accessoryViewController
{
  return self->_accessoryViewController;
}

- (NSArray)constraintsFillingParentView
{
  return self->_constraintsFillingParentView;
}

- (NSArray)constraintsFittingParentView
{
  return self->_constraintsFittingParentView;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (NSLayoutConstraint)leftConstraint
{
  return self->_leftConstraint;
}

- (NSLayoutConstraint)rightConstraint
{
  return self->_rightConstraint;
}

- (NSLayoutConstraint)framedTopConstraint
{
  return self->_framedTopConstraint;
}

- (NSLayoutConstraint)framedLeftConstraint
{
  return self->_framedLeftConstraint;
}

- (NSLayoutConstraint)framedHeightConstraint
{
  return self->_framedHeightConstraint;
}

- (NSLayoutConstraint)framedWidthConstraint
{
  return self->_framedWidthConstraint;
}

- (UILayoutGuide)preferredPositionLayoutGuide
{
  return self->_preferredPositionLayoutGuide;
}

- (NSLayoutConstraint)preferredHeightConstraint
{
  return self->_preferredHeightConstraint;
}

- (NSLayoutConstraint)preferredWidthConstraint
{
  return self->_preferredWidthConstraint;
}

- (NSLayoutConstraint)preferredTopConstraint
{
  return self->_preferredTopConstraint;
}

- (NSLayoutConstraint)preferredBottomConstraint
{
  return self->_preferredBottomConstraint;
}

- (NSLayoutConstraint)preferredLeftConstraint
{
  return self->_preferredLeftConstraint;
}

- (NSLayoutConstraint)preferredRightConstraint
{
  return self->_preferredRightConstraint;
}

- (NSLayoutConstraint)accessoryYCenterConstraint
{
  return self->_accessoryYCenterConstraint;
}

- (NSLayoutConstraint)accessoryLeftConstraint
{
  return self->_accessoryLeftConstraint;
}

- (NSLayoutConstraint)accessoryRightConstraint
{
  return self->_accessoryRightConstraint;
}

- (NSLayoutConstraint)leftConstraintWithAccessory
{
  return self->_leftConstraintWithAccessory;
}

- (NSLayoutConstraint)rightConstraintWithAccessory
{
  return self->_rightConstraintWithAccessory;
}

- (int64_t)quadrant
{
  return self->_quadrant;
}

- (OS_dispatch_source)focusDodgingTimer
{
  return self->_focusDodgingTimer;
}

- (CGRect)lastFocusedFrame
{
  double x = self->_lastFocusedFrame.origin.x;
  double y = self->_lastFocusedFrame.origin.y;
  double width = self->_lastFocusedFrame.size.width;
  double height = self->_lastFocusedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isKeyboardFocused
{
  return self->_isKeyboardFocused;
}

- (void)setIsKeyboardFocused:(BOOL)a3
{
  self->_isKeyboardFocused = a3;
}

- (int)keyboardFocusedNotifyToken
{
  return self->_keyboardFocusedNotifyToken;
}

- (int64_t)appearanceStyle
{
  return self->_appearanceStyle;
}

- (void)setAppearanceStyle:(int64_t)a3
{
  self->_appearanceStyle = a3;
}

- (void).cxx_destruct
{
}

@end