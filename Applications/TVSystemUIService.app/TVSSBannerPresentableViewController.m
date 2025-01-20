@interface TVSSBannerPresentableViewController
- (BOOL)hasPrimaryAction;
- (BOOL)isTVSSBannerPresentable;
- (BOOL)supportsDisplayingAsMenuItem;
- (NSDictionary)presentableUserInfo;
- (NSSet)primaryActionTriggeringGestures;
- (NSString)menuBarShortTitle;
- (NSString)panelMessage;
- (NSString)panelMessageImageSymbolName;
- (NSString)targetProviderIdentifier;
- (TVSPPillContentContaining)pillContentView;
- (UIView)bannerContentView;
- (void)setPresentableUserInfo:(id)a3;
@end

@implementation TVSSBannerPresentableViewController

- (BOOL)isTVSSBannerPresentable
{
  return 1;
}

- (UIView)bannerContentView
{
  return objc_alloc_init(&OBJC_CLASS___UIView);
}

- (TVSPPillContentContaining)pillContentView
{
  return 0LL;
}

- (BOOL)hasPrimaryAction
{
  return 0;
}

- (NSSet)primaryActionTriggeringGestures
{
  return (NSSet *)TVSSBannerGesturesForTVSPBannerActionTriggerInUserInfo(self->_presentableUserInfo);
}

- (BOOL)supportsDisplayingAsMenuItem
{
  return TVSSBannerPresentableSupportsDisplayingAsMenuItem(self);
}

- (NSString)targetProviderIdentifier
{
  return (NSString *)TVSSBannerPresentableTargetProviderIdentifier(self);
}

- (NSString)menuBarShortTitle
{
  return (NSString *)TVSSBannerPresentableMenuBarShortTitle(self);
}

- (NSString)panelMessage
{
  return (NSString *)TVSSBannerPresentablePanelMessage(self);
}

- (NSString)panelMessageImageSymbolName
{
  return (NSString *)TVSSBannerPresentablePanelMessageImageSymbolName(self);
}

- (NSDictionary)presentableUserInfo
{
  return self->_presentableUserInfo;
}

- (void)setPresentableUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end