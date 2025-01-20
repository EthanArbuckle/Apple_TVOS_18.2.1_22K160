@interface TVSettingsUserAccessFacade
+ (id)sharedInstance;
- (BOOL)isEnabledOnDevice;
- (BOOL)setAllowAccess:(BOOL)a3 forInfo:(id)a4;
- (id)fetchInfoMapping;
- (void)setEnabledOnDevice:(BOOL)a3;
@end

@implementation TVSettingsUserAccessFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E6390;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E1C90 != -1) {
    dispatch_once(&qword_1001E1C90, block);
  }
  return (id)qword_1001E1C88;
}

- (void)setEnabledOnDevice:(BOOL)a3
{
  if (self->_enabledOnDevice != a3)
  {
    BOOL v3 = a3;
    -[TVSettingsUserAccessFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"enabledOnDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVProfileService sharedInstance](&OBJC_CLASS___TVProfileService, "sharedInstance"));
    [v5 setEnabledOnDevice:v3];

    self->_enabledOnDevice = v3;
    -[TVSettingsUserAccessFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"enabledOnDevice");
  }

- (id)fetchInfoMapping
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_queue_t v6 = dispatch_queue_create("[TVSettingsUserAccessFacade fetchInfoMapping]", v5);

  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVProfileService sharedInstance](&OBJC_CLASS___TVProfileService, "sharedInstance"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E65CC;
  v15[3] = &unk_100194F18;
  v16 = v7;
  dispatch_queue_t v17 = v6;
  v18 = self;
  id v9 = v3;
  id v19 = v9;
  v10 = v6;
  v11 = v7;
  [v8 fetchIdentifiersOfEntitledInstalledApplications:v15];

  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = v19;
  id v13 = v9;

  return v13;
}

- (BOOL)setAllowAccess:(BOOL)a3 forInfo:(id)a4
{
  BOOL v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a4 identifier]);
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVProfileService sharedInstance](&OBJC_CLASS___TVProfileService, "sharedInstance"));
  [v6 setAllowedAccess:v4 toApplicationWithIdentifier:v5];

  return 1;
}

- (BOOL)isEnabledOnDevice
{
  return self->_enabledOnDevice;
}

@end