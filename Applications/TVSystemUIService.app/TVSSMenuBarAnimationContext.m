@interface TVSSMenuBarAnimationContext
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSString)debugDescription;
- (NSString)description;
- (TVSPPillView)pillView;
- (TVSSBannerPresentable)bannerViewController;
- (TVSSBannerPresentable)previousBannerViewController;
- (TVSSMenuBarAnimationContext)initWithMenuMode:(unint64_t)a3 previousMenuMode:(unint64_t)a4 menuModeState:(id)a5 pillView:(id)a6 pillContentViewProvider:(id)a7 panelHostingViewController:(id)a8 bannerContext:(id)a9 previousBannerContext:(id)a10 bannerViewController:(id)a11 previousBannerViewController:(id)a12 bannerContainerViewController:(id)a13 dimmingView:(id)a14 presentationReason:(unint64_t)a15;
- (TVSSMenuItemPanelHostingViewController)panelHostingViewController;
- (TVSSMenuModeBannerContext)currentBannerContext;
- (TVSSMenuModeBannerContext)previousBannerContext;
- (TVSSMenuModeState)menuModeState;
- (TVSSPillContentViewProvider)pillContentViewProvider;
- (UIView)dimmingView;
- (UIViewController)bannerContainerViewController;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)menuMode;
- (unint64_t)presentationReason;
- (unint64_t)previousMenuMode;
@end

@implementation TVSSMenuBarAnimationContext

- (TVSSMenuBarAnimationContext)initWithMenuMode:(unint64_t)a3 previousMenuMode:(unint64_t)a4 menuModeState:(id)a5 pillView:(id)a6 pillContentViewProvider:(id)a7 panelHostingViewController:(id)a8 bannerContext:(id)a9 previousBannerContext:(id)a10 bannerViewController:(id)a11 previousBannerViewController:(id)a12 bannerContainerViewController:(id)a13 dimmingView:(id)a14 presentationReason:(unint64_t)a15
{
  v39 = self;
  SEL v38 = a2;
  unint64_t v37 = a3;
  unint64_t v36 = a4;
  id location = 0LL;
  objc_storeStrong(&location, a5);
  id v34 = 0LL;
  objc_storeStrong(&v34, a6);
  id v33 = 0LL;
  objc_storeStrong(&v33, a7);
  id v32 = 0LL;
  objc_storeStrong(&v32, a8);
  id v31 = 0LL;
  objc_storeStrong(&v31, a9);
  id v30 = 0LL;
  objc_storeStrong(&v30, a10);
  id v29 = 0LL;
  objc_storeStrong(&v29, a11);
  id v28 = 0LL;
  objc_storeStrong(&v28, a12);
  id v27 = 0LL;
  objc_storeStrong(&v27, a13);
  id v26 = 0LL;
  objc_storeStrong(&v26, a14);
  unint64_t v25 = a15;
  v15 = v39;
  v39 = 0LL;
  v24.receiver = v15;
  v24.super_class = (Class)&OBJC_CLASS___TVSSMenuBarAnimationContext;
  v23 = -[TVSSMenuBarAnimationContext init](&v24, "init");
  v39 = v23;
  objc_storeStrong((id *)&v39, v23);
  if (v23)
  {
    v39->_menuMode = v37;
    v39->_previousMenuMode = v36;
    objc_storeStrong((id *)&v39->_menuModeState, location);
    objc_storeStrong((id *)&v39->_pillView, v34);
    objc_storeStrong((id *)&v39->_pillContentViewProvider, v33);
    objc_storeStrong((id *)&v39->_panelHostingViewController, v32);
    objc_storeStrong((id *)&v39->_currentBannerContext, v31);
    objc_storeStrong((id *)&v39->_previousBannerContext, v30);
    objc_storeStrong((id *)&v39->_bannerViewController, v29);
    objc_storeStrong((id *)&v39->_previousBannerViewController, v28);
    objc_storeStrong((id *)&v39->_bannerContainerViewController, v27);
    objc_storeStrong((id *)&v39->_dimmingView, v26);
    v39->_presentationReason = v25;
    v16 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
    creationDate = v39->_creationDate;
    v39->_creationDate = v16;
  }

  v19 = v39;
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v39, 0LL);
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v57 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v32 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSMenuBarAnimationContext);
  BOOL v33 = 0;
  if ((objc_opt_isKindOfClass(v32, v3) & 1) != 0)
  {
    id menuMode = (id)v57->_menuMode;
    BOOL v33 = menuMode == [location[0] menuMode];
  }

  BOOL v30 = 0;
  if (v33)
  {
    id previousMenuMode = (id)v57->_previousMenuMode;
    BOOL v30 = previousMenuMode == [location[0] previousMenuMode];
  }

  char v54 = 0;
  unsigned __int8 v28 = 0;
  if (v30)
  {
    menuModeState = v57->_menuModeState;
    id v55 = [location[0] menuModeState];
    char v54 = 1;
    unsigned __int8 v28 = -[TVSSMenuModeState isEqual:](menuModeState, "isEqual:");
  }

  if ((v54 & 1) != 0) {

  }
  char v52 = 0;
  BOOL v26 = 0;
  if ((v28 & 1) != 0)
  {
    pillView = v57->_pillView;
    v53 = (TVSPPillView *)[location[0] pillView];
    char v52 = 1;
    BOOL v26 = pillView == v53;
  }

  if ((v52 & 1) != 0) {

  }
  char v50 = 0;
  BOOL v24 = 0;
  if (v26)
  {
    pillContentViewProvider = v57->_pillContentViewProvider;
    v51 = (TVSSPillContentViewProvider *)[location[0] pillContentViewProvider];
    char v50 = 1;
    BOOL v24 = pillContentViewProvider == v51;
  }

  if ((v50 & 1) != 0) {

  }
  char v48 = 0;
  BOOL v22 = 0;
  if (v24)
  {
    panelHostingViewController = v57->_panelHostingViewController;
    v49 = (TVSSMenuItemPanelHostingViewController *)[location[0] panelHostingViewController];
    char v48 = 1;
    BOOL v22 = panelHostingViewController == v49;
  }

  if ((v48 & 1) != 0) {

  }
  char v46 = 0;
  BOOL v20 = 0;
  if (v22)
  {
    currentBannerContext = v57->_currentBannerContext;
    v47 = (TVSSMenuModeBannerContext *)[location[0] currentBannerContext];
    char v46 = 1;
    BOOL v20 = currentBannerContext == v47;
  }

  if ((v46 & 1) != 0) {

  }
  char v44 = 0;
  BOOL v18 = 0;
  if (v20)
  {
    previousBannerContext = v57->_previousBannerContext;
    v45 = (TVSSMenuModeBannerContext *)[location[0] previousBannerContext];
    char v44 = 1;
    BOOL v18 = previousBannerContext == v45;
  }

  if ((v44 & 1) != 0) {

  }
  char v42 = 0;
  BOOL v16 = 0;
  if (v18)
  {
    bannerViewController = v57->_bannerViewController;
    v43 = (TVSSBannerPresentable *)[location[0] bannerViewController];
    char v42 = 1;
    BOOL v16 = bannerViewController == v43;
  }

  if ((v42 & 1) != 0) {

  }
  char v40 = 0;
  BOOL v14 = 0;
  if (v16)
  {
    previousBannerViewController = v57->_previousBannerViewController;
    v41 = (TVSSBannerPresentable *)[location[0] previousBannerViewController];
    char v40 = 1;
    BOOL v14 = previousBannerViewController == v41;
  }

  if ((v40 & 1) != 0) {

  }
  char v38 = 0;
  BOOL v12 = 0;
  if (v14)
  {
    bannerContainerViewController = v57->_bannerContainerViewController;
    v39 = (UIViewController *)[location[0] bannerContainerViewController];
    char v38 = 1;
    BOOL v12 = bannerContainerViewController == v39;
  }

  if ((v38 & 1) != 0) {

  }
  char v36 = 0;
  BOOL v10 = 0;
  if (v12)
  {
    dimmingView = v57->_dimmingView;
    unint64_t v37 = (UIView *)[location[0] dimmingView];
    char v36 = 1;
    BOOL v10 = dimmingView == v37;
  }

  if ((v36 & 1) != 0) {

  }
  BOOL v8 = 0;
  if (v10)
  {
    id presentationReason = (id)v57->_presentationReason;
    BOOL v8 = presentationReason == [location[0] presentationReason];
  }

  char v34 = 0;
  unsigned __int8 v6 = 0;
  if (v8)
  {
    creationDate = v57->_creationDate;
    id v35 = [location[0] creationDate];
    char v34 = 1;
    unsigned __int8 v6 = -[NSDate isEqualToDate:](creationDate, "isEqualToDate:");
  }

  if ((v34 & 1) != 0) {

  }
  objc_storeStrong(location, 0LL);
  return v6 & 1;
}

- (unint64_t)hash
{
  return self->_menuMode + 100 * self->_previousMenuMode;
}

- (id)succinctDescription
{
  id v3 = -[TVSSMenuBarAnimationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v3 = v8[0];
  id v4 = TVSSMenuModeDescription(v9->_menuMode);
  objc_msgSend(v3, "appendString:withName:");

  id v5 = v8[0];
  id v6 = TVSSMenuModeDescription(v9->_previousMenuMode);
  objc_msgSend(v5, "appendString:withName:");

  id v7 = v8[0];
  objc_storeStrong(v8, 0LL);
  return v7;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSMenuBarAnimationContext descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v21 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v23);
  BOOL v14 = v21;
  id v15 = TVSSMenuModeDescription(v23->_menuMode);
  -[BSDescriptionBuilder appendString:withName:](v14, "appendString:withName:");

  BOOL v16 = v21;
  id v17 = TVSSMenuModeDescription(v23->_previousMenuMode);
  -[BSDescriptionBuilder appendString:withName:](v16, "appendString:withName:");

  id v3 =  -[BSDescriptionBuilder appendObject:withName:]( v21,  "appendObject:withName:",  v23->_menuModeState,  @"menuModeState");
  id v4 =  -[BSDescriptionBuilder appendObject:withName:]( v21,  "appendObject:withName:",  v23->_pillView,  @"pillView");
  id v5 =  -[BSDescriptionBuilder appendObject:withName:]( v21,  "appendObject:withName:",  v23->_pillContentViewProvider,  @"pillContentViewProvider");
  id v6 =  -[BSDescriptionBuilder appendObject:withName:]( v21,  "appendObject:withName:",  v23->_panelHostingViewController,  @"panelHostingViewController");
  id v7 =  -[BSDescriptionBuilder appendObject:withName:]( v21,  "appendObject:withName:",  v23->_bannerViewController,  @"bannerViewController");
  id v8 =  -[BSDescriptionBuilder appendObject:withName:]( v21,  "appendObject:withName:",  v23->_previousBannerViewController,  @"previousBannerViewController");
  id v9 =  -[BSDescriptionBuilder appendObject:withName:]( v21,  "appendObject:withName:",  v23->_bannerContainerViewController,  @"bannerContainerViewController");
  id v10 =  -[BSDescriptionBuilder appendObject:withName:]( v21,  "appendObject:withName:",  v23->_dimmingView,  @"dimmingView");
  BOOL v18 = v21;
  v19 =  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v23->_presentationReason);
  id v11 = -[BSDescriptionBuilder appendObject:withName:](v18, "appendObject:withName:");

  id v12 =  -[BSDescriptionBuilder appendObject:withName:]( v21,  "appendObject:withName:",  v23->_creationDate,  @"creationDate");
  BOOL v20 = v21;
  objc_storeStrong((id *)&v21, 0LL);
  objc_storeStrong(location, 0LL);
  return v20;
}

- (NSString)description
{
  return (NSString *)-[TVSSMenuBarAnimationContext succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSMenuBarAnimationContext descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (unint64_t)menuMode
{
  return self->_menuMode;
}

- (unint64_t)previousMenuMode
{
  return self->_previousMenuMode;
}

- (TVSSMenuModeState)menuModeState
{
  return self->_menuModeState;
}

- (unint64_t)presentationReason
{
  return self->_presentationReason;
}

- (TVSPPillView)pillView
{
  return self->_pillView;
}

- (TVSSPillContentViewProvider)pillContentViewProvider
{
  return self->_pillContentViewProvider;
}

- (TVSSMenuItemPanelHostingViewController)panelHostingViewController
{
  return self->_panelHostingViewController;
}

- (TVSSMenuModeBannerContext)currentBannerContext
{
  return self->_currentBannerContext;
}

- (TVSSMenuModeBannerContext)previousBannerContext
{
  return self->_previousBannerContext;
}

- (TVSSBannerPresentable)bannerViewController
{
  return self->_bannerViewController;
}

- (TVSSBannerPresentable)previousBannerViewController
{
  return self->_previousBannerViewController;
}

- (UIViewController)bannerContainerViewController
{
  return self->_bannerContainerViewController;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
}

@end