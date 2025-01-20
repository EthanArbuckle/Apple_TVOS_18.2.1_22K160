@interface TVSettingsNotificationsFacade
+ (id)sharedInstance;
- (BBSettingsGateway)gateway;
- (NSArray)notificationSettings;
- (OS_dispatch_queue)gatewayQueue;
- (TVSettingsNotificationsFacade)init;
- (id)notificationSettingForIdentifier:(id)a3;
- (void)_updateBulletinSettingsSynchronously:(BOOL)a3;
- (void)_updateSettings:(id)a3;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)dealloc;
- (void)didBecomeActive:(id)a3;
- (void)setNotificationSettings:(id)a3;
@end

@implementation TVSettingsNotificationsFacade

+ (id)sharedInstance
{
  if (qword_1001E1558 != -1) {
    dispatch_once(&qword_1001E1558, &stru_10018E418);
  }
  return (id)qword_1001E1550;
}

- (TVSettingsNotificationsFacade)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsNotificationsFacade;
  v2 = -[TVSettingsNotificationsFacade init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.tvsettings.bbgateway", 0LL);
    gatewayQueue = v2->_gatewayQueue;
    v2->_gatewayQueue = (OS_dispatch_queue *)v3;

    v5 = -[BBSettingsGateway initWithQueue:]( objc_alloc(&OBJC_CLASS___BBSettingsGateway),  "initWithQueue:",  v2->_gatewayQueue);
    gateway = v2->_gateway;
    v2->_gateway = v5;

    -[TVSettingsNotificationsFacade _updateBulletinSettingsSynchronously:]( v2,  "_updateBulletinSettingsSynchronously:",  1LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    [v8 addObserver:v2];
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsNotificationsFacade;
  -[TVSettingsNotificationsFacade dealloc](&v5, "dealloc");
}

- (id)notificationSettingForIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNotificationsFacade notificationSettings](self, "notificationSettings", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)didBecomeActive:(id)a3
{
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000786C;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_updateSettings:(id)a3
{
  id v4 = a3;
  objc_super v5 = dispatch_group_create();
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v14 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sectionInfos]);
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      objc_super v10 = 0LL;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v10);
        dispatch_group_enter(v5);
        gateway = self->_gateway;
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 sectionID]);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100007A50;
        v16[3] = &unk_10018E440;
        v17 = v5;
        -[BBSettingsGateway setSectionInfo:forSectionID:withCompletion:]( gateway,  "setSectionInfo:forSectionID:withCompletion:",  v11,  v13,  v16);

        objc_super v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007A58;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_group_notify(v5, &_dispatch_main_q, block);
}

- (void)_updateBulletinSettingsSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007B08;
  v8[3] = &unk_10018E490;
  v8[4] = self;
  objc_super v5 = objc_retainBlock(v8);
  gateway = self->_gateway;
  if (v3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BBSettingsGateway activeSectionInfo](gateway, "activeSectionInfo"));
    ((void (*)(void *, void *))v5[2])(v5, v7);
  }

  else
  {
    -[BBSettingsGateway getSectionInfoForActiveSectionsWithCompletion:]( gateway,  "getSectionInfoForActiveSectionsWithCompletion:",  v5);
  }
}

- (NSArray)notificationSettings
{
  return self->_notificationSettings;
}

- (void)setNotificationSettings:(id)a3
{
}

- (BBSettingsGateway)gateway
{
  return self->_gateway;
}

- (OS_dispatch_queue)gatewayQueue
{
  return self->_gatewayQueue;
}

- (void).cxx_destruct
{
}

@end