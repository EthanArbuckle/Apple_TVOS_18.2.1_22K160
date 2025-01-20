@interface TVSettingsAppearanceFacade
+ (id)sharedInstance;
- (NSArray)appearanceOptions;
- (TSKMappingFormatter)userInterfaceStyleFormatter;
- (TVSettingsAppearanceFacade)init;
- (int64_t)systemAppearance;
- (void)_updateSystemAppearance;
- (void)invalidateSystemAppearance;
- (void)setSystemAppearance:(int64_t)a3;
- (void)setUserInterfaceStyleFormatter:(id)a3;
@end

@implementation TVSettingsAppearanceFacade

+ (id)sharedInstance
{
  if (qword_1001E1598 != -1) {
    dispatch_once(&qword_1001E1598, &stru_10018EDF0);
  }
  return (id)qword_1001E1590;
}

- (TVSettingsAppearanceFacade)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsAppearanceFacade;
  v2 = -[TVSettingsAppearanceFacade init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v3 addObserver:v2 selector:"_updateSystemAppearance" name:PBSSystemAppearanceDidChangeNotification object:0];

    -[TVSettingsAppearanceFacade _updateSystemAppearance](v2, "_updateSystemAppearance");
  }

  return v2;
}

- (int64_t)systemAppearance
{
  if (self->_systemAppearanceNeedsUpdate)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000160B4;
    v5[3] = &unk_10018EE40;
    v5[4] = self;
    [v3 systemAppearanceWithReply:v5];
  }

  return self->_systemAppearance;
}

- (void)setSystemAppearance:(int64_t)a3
{
  if (self->_systemAppearance != a3)
  {
    self->_systemAppearance = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
    [v4 setSystemAppearance:a3];
  }

- (void)invalidateSystemAppearance
{
  self->_systemAppearanceNeedsUpdate = 1;
}

- (void)_updateSystemAppearance
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100016258;
  v3[3] = &unk_10018EE68;
  objc_copyWeak(&v4, &location);
  [v2 systemAppearanceWithReply:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (TSKMappingFormatter)userInterfaceStyleFormatter
{
  uint64_t v2 = TSKLocString(@"UserInterfaceStyleLight");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v13[0] = v3;
  uint64_t v4 = TSKLocString(@"UserInterfaceStyleDark");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));

  v7 = (void *)objc_claimAutoreleasedReturnValue([&off_1001AEAD0 arrayByAddingObject:&off_1001ACC60]);
  uint64_t v8 = TSKLocString(@"UserInterfaceStyleAutomatic");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObject:v9]);

  v11 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  v7,  v10);
  return v11;
}

- (NSArray)appearanceOptions
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppearanceFacade userInterfaceStyleFormatter](self, "userInterfaceStyleFormatter"));
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