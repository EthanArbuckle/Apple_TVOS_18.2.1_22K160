@interface TVSSPrivacyMenuItemProvider
- (BOOL)hasIndicatorForMenuBar;
- (BOOL)shouldShowMenuItem;
- (TVSSPrivacyController)privacyController;
- (TVSSPrivacyMenuItemProvider)initWithPrivacyController:(id)a3;
- (id)log;
- (id)newMenuItem;
- (void)_updateHasIndicatorForMenuBar;
- (void)privacyControllerStateDidChange:(id)a3;
- (void)setHasIndicatorForMenuBar:(BOOL)a3;
@end

@implementation TVSSPrivacyMenuItemProvider

- (TVSSPrivacyMenuItemProvider)initWithPrivacyController:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSPrivacyMenuItemProvider;
  v8 = -[TVSSMenuItemProvider initWithIdentifier:]( &v6,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.privacyMenuItemProvider");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v8->_privacyController, location[0]);
    -[TVSSPrivacyController addControllerObserver:](v8->_privacyController, "addControllerObserver:", v8);
    -[TVSSPrivacyMenuItemProvider _updateHasIndicatorForMenuBar](v8, "_updateHasIndicatorForMenuBar");
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v8, "updateMenuItemWithReason:", @"Initial update");
  }

  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (BOOL)shouldShowMenuItem
{
  return -[TVSSPrivacyMenuItemProvider hasIndicatorForMenuBar](self, "hasIndicatorForMenuBar", a2, self);
}

- (id)newMenuItem
{
  v8 = self;
  v7[1] = (id)a2;
  v7[0] = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:hasFocusableContent:",  @"com.apple.TVSystemUIService.privacyMenuItem",  0LL);
  v3 = objc_alloc(&OBJC_CLASS___TVSSPrivacyVisualContent);
  v5 = -[TVSSPrivacyMenuItemProvider privacyController](v8, "privacyController");
  v4 = -[TVSSPrivacyVisualContent initWithPrivacyController:](v3, "initWithPrivacyController:");
  objc_msgSend(v7[0], "setVisualContent:");

  id v6 = v7[0];
  objc_storeStrong(v7, 0LL);
  return v6;
}

- (id)log
{
  return PrivacyLog();
}

- (void)privacyControllerStateDidChange:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSPrivacyMenuItemProvider _updateHasIndicatorForMenuBar](v4, "_updateHasIndicatorForMenuBar");
  objc_storeStrong(location, 0LL);
}

- (void)setHasIndicatorForMenuBar:(BOOL)a3
{
  if (self->_hasIndicatorForMenuBar != a3)
  {
    self->_hasIndicatorForMenuBar = a3;
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( self,  "updateMenuItemWithReason:",  @"hasIndicatorForMenuBar Did Change");
  }

- (void)_updateHasIndicatorForMenuBar
{
  v3 = -[TVSSPrivacyMenuItemProvider privacyController](self, "privacyController");
  v2 = -[TVSSPrivacyController privacyState](v3, "privacyState");
  -[TVSSPrivacyMenuItemProvider setHasIndicatorForMenuBar:]( self,  "setHasIndicatorForMenuBar:",  -[TVSSPrivacyState hasActiveIndicatorAtDisplayPosition:](v2, "hasActiveIndicatorAtDisplayPosition:", 1LL));
}

- (TVSSPrivacyController)privacyController
{
  return self->_privacyController;
}

- (BOOL)hasIndicatorForMenuBar
{
  return self->_hasIndicatorForMenuBar;
}

- (void).cxx_destruct
{
}

@end