@interface ZWMenuViewController
- (AXAssertion)disableDashBoardGesturesAssertion;
- (BOOL)userIsInteractingWithMenu;
- (UITableView)tableView;
- (ZWMenuViewControllerDelegate)delegate;
- (id)_localizedTitleForMenuItemTag:(unint64_t)a3;
- (id)_menuOptionArray;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_dismissLensEffectChooserViewController:(id)a3;
- (void)_handleZoomFactorSliderDidChange:(id)a3;
- (void)_handleZoomFactorSliderTouchDidBegin:(id)a3;
- (void)_handleZoomFactorSliderTouchDidEnd:(id)a3;
- (void)_invertColorsChange;
- (void)_reloadMenuOptions;
- (void)_reloadTableData;
- (void)_setBackgroundStyleWithInvertColors;
- (void)loadView;
- (void)menuDockPositionChooserViewController:(id)a3 didChooseDockPosition:(id)a4;
- (void)menuLensEffectChooserViewController:(id)a3 didChooseLensEffect:(id)a4;
- (void)menuZoomModeChooserViewController:(id)a3 didChooseZoomMode:(id)a4;
- (void)preferredLensModesDidChange;
- (void)setDelegate:(id)a3;
- (void)setDisableDashBoardGesturesAssertion:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUserIsInteractingWithMenu:(BOOL)a3;
- (void)standbyModeDidChange;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)zoomCurrentLensEffectDidChange;
@end

@implementation ZWMenuViewController

- (void)loadView
{
  v3 = -[UITableView initWithFrame:]( objc_alloc(&OBJC_CLASS___UITableView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v4 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 2LL));
  v6 = -[UIVisualEffectView initWithEffect:](v4, "initWithEffect:", v5);

  -[ZWMenuViewController setTableView:](self, "setTableView:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v6, "contentView"));
  [v7 addSubview:v3];

  -[UIVisualEffectView setAccessibilityIgnoresInvertColors:](v6, "setAccessibilityIgnoresInvertColors:", 1LL);
  -[ZWMenuViewController setView:](self, "setView:", v6);
  -[UITableView setDelegate:](v3, "setDelegate:", self);
  -[UITableView setDataSource:](v3, "setDataSource:", self);
  -[UITableView setAutoresizingMask:](v3, "setAutoresizingMask:", 18LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](v3, "setBackgroundColor:", v8);

  -[UITableView setSeparatorInset:]( v3,  "setSeparatorInset:",  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
  -[UITableView setAccessibilityContainerType:](v3, "setAccessibilityContainerType:", 4LL);
  id v9 = ZWLocString(@"ZW_MENU_TOUCH_CONTAINER_LABEL");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[UITableView setAccessibilityLabel:](v3, "setAccessibilityLabel:", v10);

  -[ZWMenuViewController _reloadMenuOptions](self, "_reloadMenuOptions");
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = __32__ZWMenuViewController_loadView__block_invoke;
  v16 = &unk_6CB98;
  objc_copyWeak(&v17, &location);
  [v11 registerUpdateBlock:&v13 forRetrieveSelector:"zoomPeekZoomEverEnabled" withListener:self];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter",  v13,  v14,  v15,  v16));
  [v12 addObserver:self selector:"_invertColorsChange" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __32__ZWMenuViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadMenuOptions];
}

- (void)_reloadMenuOptions
{
  fullscreenMenuOptions = self->_fullscreenMenuOptions;
  self->_fullscreenMenuOptions = (NSArray *)&off_6F2D0;

  pipMenuOptions = self->_pipMenuOptions;
  self->_pipMenuOptions = (NSArray *)&off_6F2E8;

  dockMenuOptions = self->_dockMenuOptions;
  self->_dockMenuOptions = (NSArray *)&off_6F300;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v7 = [v6 zoomPeekZoomEverEnabled];

  if (v7)
  {
    v8 = self->_fullscreenMenuOptions;
    self->_fullscreenMenuOptions = (NSArray *)&off_6F318;

    id v9 = self->_pipMenuOptions;
    self->_pipMenuOptions = (NSArray *)&off_6F330;

    v10 = self->_dockMenuOptions;
    self->_dockMenuOptions = (NSArray *)&off_6F348;
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
  [v11 reloadData];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ZWMenuViewController;
  -[ZWMenuViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
  [v3 setEstimatedRowHeight:44.0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
  [v4 setRowHeight:UITableViewAutomaticDimension];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ZWMenuViewController;
  -[ZWMenuViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  if (ZWUseVibrantBlendModes())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.25, 1.0));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
    [v5 setSeparatorColor:v4];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 2LL));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
    [v8 setSeparatorEffect:v7];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
    [v7 setSeparatorColor:v6];
  }

  -[ZWMenuViewController _reloadTableData](self, "_reloadTableData");
  -[ZWMenuViewController _setBackgroundStyleWithInvertColors](self, "_setBackgroundStyleWithInvertColors");
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ZWMenuViewController;
  -[ZWMenuViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableDashboardSystemGestures,  @"Zoom: menu is visible"));
  -[ZWMenuViewController setDisableDashBoardGesturesAssertion:](self, "setDisableDashBoardGesturesAssertion:", v4);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
  [v5 menuDidAppear:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ZWMenuViewController;
  -[ZWMenuViewController viewDidDisappear:](&v8, "viewDidDisappear:", a3);
  -[ZWMenuViewController setDisableDashBoardGesturesAssertion:](self, "setDisableDashBoardGesturesAssertion:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController view](self, "view"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
  if (v5)
  {
  }

  else
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController presentedViewController](self, "presentedViewController"));

    if (v6) {
      goto LABEL_5;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
    [v4 menuDidDisappear:self];
  }

LABEL_5:
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 removeObserver:self];

  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0LL);
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ZWMenuViewController;
  -[ZWMenuViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
  [v3 contentSize];
  double v5 = v4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
  [v6 bounds];
  BOOL v8 = v5 > v7;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
  [v9 setScrollEnabled:v8];
}

- (void)_invertColorsChange
{
}

- (id)_menuOptionArray
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
  unsigned __int8 v4 = [v3 inFullscreenModeForMenuViewController:self];

  if ((v4 & 1) != 0)
  {
    double v5 = &OBJC_IVAR___ZWMenuViewController__fullscreenMenuOptions;
  }

  else
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
    unsigned __int8 v7 = [v6 inPIPModeForMenuViewController:self];

    if ((v7 & 1) != 0)
    {
      double v5 = &OBJC_IVAR___ZWMenuViewController__pipMenuOptions;
    }

    else
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
      unsigned int v9 = [v8 inDockedModeForMenuViewController:self];

      if (!v9)
      {
        id v10 = &__NSArray0__struct;
        return v10;
      }

      double v5 = &OBJC_IVAR___ZWMenuViewController__dockMenuOptions;
    }
  }

  id v10 = *(id *)((char *)&self->super.super.super.super.isa + *v5);
  return v10;
}

- (void)_reloadTableData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
  [v3 reloadData];

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
  [v4 layoutIfNeeded];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
  [v5 contentSize];
  -[ZWMenuViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController _menuOptionArray](self, "_menuOptionArray", a3, a4));
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController _menuOptionArray](self, "_menuOptionArray"));
  id v7 = [v5 row];

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v7]);
  unsigned int v9 = (char *)[v8 unsignedIntegerValue];

  if (v9 == (_BYTE *)&dword_4 + 3)
  {
    id v10 =  -[ZWMenuItemZoomLevelSliderTableViewCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___ZWMenuItemZoomLevelSliderTableViewCell),  "initWithStyle:reuseIdentifier:",  0LL,  0LL);
    -[ZWMenuItemZoomLevelSliderTableViewCell setSelectionStyle:](v10, "setSelectionStyle:", 0LL);
    id v11 = (UIView *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemZoomLevelSliderTableViewCell zoomLevelSlider](v10, "zoomLevelSlider"));

    -[UIView addTarget:action:forControlEvents:]( v11,  "addTarget:action:forControlEvents:",  self,  "_handleZoomFactorSliderTouchDidBegin:",  65537LL);
    -[UIView addTarget:action:forControlEvents:]( v11,  "addTarget:action:forControlEvents:",  self,  "_handleZoomFactorSliderDidChange:",  4096LL);
    -[UIView addTarget:action:forControlEvents:]( v11,  "addTarget:action:forControlEvents:",  self,  "_handleZoomFactorSliderTouchDidEnd:",  262336LL);
    HIDWORD(v12) = *(&AXZoomMinimumZoomLevel + 1);
    *(float *)&double v12 = AXZoomMinimumZoomLevel;
    -[UIView setMinimumValue:](v11, "setMinimumValue:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v13 zoomPreferredMaximumZoomScale];
    *(float *)&double v14 = v14;
    -[UIView setMaximumValue:](v11, "setMaximumValue:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
    [v15 zoomFactorForMenuViewController:self];
    *(float *)&double v16 = v16;
    -[UIView setValue:](v11, "setValue:", v16);
  }

  else
  {
    id v10 = -[ZWMenuItemSimpleButtonTableViewCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___ZWMenuItemSimpleButtonTableViewCell),  "initWithStyle:reuseIdentifier:",  0LL,  0LL);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController _localizedTitleForMenuItemTag:](self, "_localizedTitleForMenuItemTag:", v9));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemZoomLevelSliderTableViewCell textLabel](v10, "textLabel"));
    [v18 setText:v17];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemZoomLevelSliderTableViewCell textLabel](v10, "textLabel"));
    [v19 setNumberOfLines:0];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuItemZoomLevelSliderTableViewCell textLabel](v10, "textLabel"));
    [v20 setLineBreakMode:0];

    if (ZWUseVibrantBlendModes())
    {
      if (!UIAccessibilityIsInvertColorsEnabled()) {
        -[ZWMenuItemZoomLevelSliderTableViewCell _setDrawsAsBackdropOverlayWithBlendMode:]( v10,  "_setDrawsAsBackdropOverlayWithBlendMode:",  3LL);
      }
      id v11 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
      -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18LL);
      double v21 = 0.25;
    }

    else
    {
      id v11 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
      -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18LL);
      double v21 = 0.5;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v21, 1.0));
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v22);

    -[ZWMenuItemZoomLevelSliderTableViewCell setSelectedBackgroundView:](v10, "setSelectedBackgroundView:", v11);
  }

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v5 setBackgroundColor:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController _menuOptionArray](self, "_menuOptionArray"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "row")));
  id v9 = [v8 unsignedIntegerValue];

  switch((unint64_t)v9)
  {
    case 0uLL:
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
      [v10 toggleLensVisibilityWithMenuViewController:self];
      goto LABEL_8;
    case 1uLL:
      id v11 = &OBJC_CLASS___ZWMenuZoomModeChooserViewController;
      goto LABEL_7;
    case 2uLL:
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
      [v10 toggleLensResizeModeWithMenuViewController:self];
      goto LABEL_8;
    case 3uLL:
      id v11 = &OBJC_CLASS___ZWMenuDockPositionChooserViewController;
      goto LABEL_7;
    case 4uLL:
      id v11 = &OBJC_CLASS___ZWMenuLensEffectChooserViewController;
LABEL_7:
      id v10 = (void *)objc_opt_new(v11);
      double v12 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v10);
      [v10 setDelegate:self];
      -[UINavigationController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 3LL);
      -[UINavigationController setModalTransitionStyle:](v12, "setModalTransitionStyle:", 2LL);
      -[UINavigationController setNavigationBarHidden:](v12, "setNavigationBarHidden:", 1LL);
      -[ZWMenuViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v12,  1LL,  0LL);

LABEL_8:
      break;
    case 5uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
      [v13 toggleSlugVisibilityWithMenuViewController:self];
      goto LABEL_11;
    case 6uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
      [v13 togglePeekZoomWithMenuViewController:self];
LABEL_11:

      -[ZWMenuViewController _reloadTableData](self, "_reloadTableData");
      break;
    default:
      break;
  }

  [v14 deselectRowAtIndexPath:v6 animated:1];
}

- (void)zoomCurrentLensEffectDidChange
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoomCurrentLensEffect]);
  [v5 menuViewController:self didChooseLensEffect:v4];
}

- (void)_dismissLensEffectChooserViewController:(id)a3
{
}

- (id)_localizedTitleForMenuItemTag:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
      else {
        id v5 = @"ZW_MENU_BUTTON_TOGGLE_ZOOM_OUT";
      }
      id v6 = ZWLocString(v5);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);

      return v7;
    case 1uLL:
      BOOL v8 = @"ZW_MENU_BUTTON_LENS_MODE_LABEL";
      goto LABEL_17;
    case 2uLL:
      BOOL v8 = @"ZW_MENU_BUTTON_RESIZE_LENS_LABEL";
      goto LABEL_17;
    case 3uLL:
      BOOL v8 = @"ZW_MENU_BUTTON_DOCK_POSITION_LABEL";
      goto LABEL_17;
    case 4uLL:
      BOOL v8 = @"ZW_MENU_BUTTON_LENS_EFFECT_LABEL";
      goto LABEL_17;
    case 5uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unsigned int v10 = [v9 zoomShouldShowSlug];

      if (v10) {
        BOOL v8 = @"ZW_MENU_BUTTON_HIDE_SLUG_LABEL";
      }
      else {
        BOOL v8 = @"ZW_MENU_BUTTON_SHOW_SLUG_LABEL";
      }
LABEL_17:
      id v13 = ZWLocString(v8);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);
      break;
    case 6uLL:
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unsigned int v12 = [v11 zoomPeekZoomEnabled];

      if (v12) {
        id v7 = @"Enable Force Touch Zoom";
      }
      else {
        id v7 = @"Disable Force Touch Zoom";
      }
      break;
    default:
      id v7 = 0LL;
      break;
  }

  return v7;
}

- (void)_setBackgroundStyleWithInvertColors
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController popoverPresentationController](self, "popoverPresentationController"));
  [v2 _setBackgroundBlurDisabled:1];
}

- (void)_handleZoomFactorSliderDidChange:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
  [v4 value];
  float v6 = v5;

  [v7 menuViewController:self adjustZoomFactor:1 animated:v6];
}

- (void)_handleZoomFactorSliderTouchDidBegin:(id)a3
{
}

- (void)_handleZoomFactorSliderTouchDidEnd:(id)a3
{
  id v4 = a3;
  -[ZWMenuViewController setUserIsInteractingWithMenu:](self, "setUserIsInteractingWithMenu:", 0LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
  [v4 value];
  float v6 = v5;

  [v7 menuViewController:self finishedAdjustingZoomFactor:v6];
}

- (void)preferredLensModesDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___ZWMenuViewController;
  -[ZWZoomViewController preferredLensModesDidChange](&v2, "preferredLensModesDidChange");
}

- (void)standbyModeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ZWMenuViewController;
  -[ZWZoomViewController standbyModeDidChange](&v8, "standbyModeDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController tableView](self, "tableView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  0LL));
  float v5 = (void *)objc_claimAutoreleasedReturnValue([v3 cellForRowAtIndexPath:v4]);

  float v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController _localizedTitleForMenuItemTag:](self, "_localizedTitleForMenuItemTag:", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 textLabel]);
  [v7 setText:v6];
}

- (void)menuLensEffectChooserViewController:(id)a3 didChooseLensEffect:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
  [v6 menuViewController:self didChooseLensEffect:v5];
}

- (void)menuZoomModeChooserViewController:(id)a3 didChooseZoomMode:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __76__ZWMenuViewController_menuZoomModeChooserViewController_didChooseZoomMode___block_invoke;
  v7[3] = &unk_6CBC0;
  v7[4] = self;
  [v6 menuViewController:self didChooseZoomMode:v5 withCompletion:v7];
}

id __76__ZWMenuViewController_menuZoomModeChooserViewController_didChooseZoomMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadTableData];
}

- (void)menuDockPositionChooserViewController:(id)a3 didChooseDockPosition:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuViewController delegate](self, "delegate"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __84__ZWMenuViewController_menuDockPositionChooserViewController_didChooseDockPosition___block_invoke;
  v7[3] = &unk_6CBC0;
  v7[4] = self;
  [v6 menuViewController:self didChooseDockPosition:v5 withCompletion:v7];
}

id __84__ZWMenuViewController_menuDockPositionChooserViewController_didChooseDockPosition___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadTableData];
}

- (ZWMenuViewControllerDelegate)delegate
{
  return (ZWMenuViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)userIsInteractingWithMenu
{
  return self->_userIsInteractingWithMenu;
}

- (void)setUserIsInteractingWithMenu:(BOOL)a3
{
  self->_userIsInteractingWithMenu = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (AXAssertion)disableDashBoardGesturesAssertion
{
  return self->_disableDashBoardGesturesAssertion;
}

- (void)setDisableDashBoardGesturesAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end