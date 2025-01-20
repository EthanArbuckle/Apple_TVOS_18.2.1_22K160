@interface TVSettingsUIScaleFacade
+ (id)sharedInstance;
- (NSArray)scaleOptions;
- (TSKMappingFormatter)userInterfaceStyleFormatter;
- (TVSettingsUIScaleFacade)init;
- (int64_t)uiScale;
- (void)_updateUIScale;
- (void)dealloc;
- (void)setUIScale:(int64_t)a3;
- (void)setUserInterfaceStyleFormatter:(id)a3;
@end

@implementation TVSettingsUIScaleFacade

+ (id)sharedInstance
{
  if (qword_1001E17D0 != -1) {
    dispatch_once(&qword_1001E17D0, &stru_100191018);
  }
  return (id)qword_1001E17C8;
}

- (TVSettingsUIScaleFacade)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsUIScaleFacade;
  v2 = -[TVSettingsUIScaleFacade init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"_updateUIScale" name:kAXSAppleTVScaledUIEnabledNotification object:0];

    -[TVSettingsUIScaleFacade _updateUIScale](v2, "_updateUIScale");
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:kAXSAppleTVScaledUIEnabledNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsUIScaleFacade;
  -[TVSettingsUIScaleFacade dealloc](&v4, "dealloc");
}

- (void)_updateUIScale
{
  self->_uiScale = _AXSAppleTVScaledUIEnabled( -[TVSettingsUIScaleFacade willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"uiScale")) != 0;
  -[TVSettingsUIScaleFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"uiScale");
}

- (TSKMappingFormatter)userInterfaceStyleFormatter
{
  uint64_t v2 = TSKLocString(@"UIScaleDefault");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v9[0] = v3;
  uint64_t v4 = TSKLocString(@"UIScaleLarge");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  v7 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AED70,  v6);
  return v7;
}

- (int64_t)uiScale
{
  return self->_uiScale;
}

- (void)setUIScale:(int64_t)a3
{
  if (self->_uiScale != a3) {
    _AXSSetAppleTVScaledUIEnabled(a3 == 1, a2);
  }
}

- (NSArray)scaleOptions
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUIScaleFacade userInterfaceStyleFormatter](self, "userInterfaceStyleFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputs]);

  return (NSArray *)v3;
}

- (void)setUserInterfaceStyleFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end