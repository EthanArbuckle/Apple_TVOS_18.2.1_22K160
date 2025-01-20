@interface TVSSVideoMicMenuItemProvider
- (BOOL)_overrideAlwaysShowingItem;
- (BOOL)shouldShowMenuItem;
- (BOOL)updateVisualContentForMenuItem:(id)a3;
- (TVSSVideoMicBackingStore)backingStore;
- (TVSSVideoMicMenuItemProvider)init;
- (id)_currentItemContent;
- (id)log;
- (id)newMenuItem;
- (void)videoMicBackingStoreDidChange:(id)a3;
@end

@implementation TVSSVideoMicMenuItemProvider

- (TVSSVideoMicMenuItemProvider)init
{
  SEL v8 = a2;
  v9 = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSSVideoMicMenuItemProvider;
  v9 = -[TVSSMenuItemProvider initWithIdentifier:]( &v7,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.videoMicMenuItemProvider");
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v4 = objc_alloc(&OBJC_CLASS___TVSSVideoMicBackingStore);
    v5 = objc_alloc_init(&OBJC_CLASS___TVSSSensorActivityController);
    v6 = -[TVSSVideoMicBackingStore initWithSensorActivityController:](v4, "initWithSensorActivityController:");

    objc_storeStrong((id *)&v9->_backingStore, v6);
    -[TVSSVideoMicBackingStore setDelegate:](v6, "setDelegate:", v9);
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v9, "updateMenuItemWithReason:", @"Initial Update");
    objc_storeStrong((id *)&v6, 0LL);
  }

  v3 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  return v3;
}

- (void)videoMicBackingStoreDidChange:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = @"Camera/mic connection changed";
  -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v5, "updateMenuItemWithReason:", v3);
  -[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]( v5,  "updateCurrentMenuItemVisualContentWithReason:",  v3);
  objc_storeStrong((id *)&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)shouldShowMenuItem
{
  SEL v8 = self;
  location[1] = (id)a2;
  if (!-[TVSSVideoMicMenuItemProvider _overrideAlwaysShowingItem](self, "_overrideAlwaysShowingItem")) {
    return -[TVSSVideoMicBackingStore shouldShowMenuItem](v8->_backingStore, "shouldShowMenuItem");
  }
  location[0] = -[TVSSVideoMicMenuItemProvider log](v8, "log");
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v6;
    sub_100010524(v5);
  }

  objc_storeStrong(location, 0LL);
  return 1;
}

- (id)newMenuItem
{
  os_log_type_t v6 = self;
  v5[1] = (id)a2;
  v5[0] = -[TVSSMenuItem initWithIdentifier:platterViewControllerClass:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:platterViewControllerClass:",  @"com.apple.TVSystemUIService.camMicProviderItem",  objc_opt_class(&OBJC_CLASS___TVSSVideoMicPanelViewController));
  id v4 = -[TVSSVideoMicMenuItemProvider _currentItemContent](v6, "_currentItemContent");
  [v5[0] setVisualContent:v4];
  id v3 = v5[0];
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(v5, 0LL);
  return v3;
}

- (id)log
{
  id v4 = (dispatch_once_t *)&unk_100221CD0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B8C80);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221CC8;
}

- (BOOL)updateVisualContentForMenuItem:(id)a3
{
  objc_super v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = location[0];
  id v5 = -[TVSSVideoMicMenuItemProvider _currentItemContent](v7, "_currentItemContent");
  objc_msgSend(v4, "setVisualContent:");

  objc_storeStrong(location, 0LL);
  return 1;
}

- (id)_currentItemContent
{
  id v3 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
  id v4 =  +[UIImage _systemImageNamed:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:",  @"rectangle.inset.filled.and.camera");
  id v5 = -[TVSSImageContent initWithImage:](v3, "initWithImage:");

  return v5;
}

- (BOOL)_overrideAlwaysShowingItem
{
  id v4 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  id v3 = -[NSUserDefaults objectForKey:](v4, "objectForKey:", @"menuProvider.alwaysShowCameraMicItem");
  unsigned __int8 v5 = [v3 BOOLValue];

  return v5 & 1;
}

- (TVSSVideoMicBackingStore)backingStore
{
  return self->_backingStore;
}

- (void).cxx_destruct
{
}

@end