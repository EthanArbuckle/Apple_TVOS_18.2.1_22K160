@interface TVSettingsNotificationsViewController
- (TVSettingsNotificationsViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TVSettingsNotificationsViewController

- (TVSettingsNotificationsViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsNotificationsViewController;
  v3 = -[TVSettingsNotificationsViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsNotificationsFacade sharedInstance]( &OBJC_CLASS___TVSettingsNotificationsFacade,  "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"notificationSettings" options:0 context:off_1001DF558];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsNotificationsFacade sharedInstance]( &OBJC_CLASS___TVSettingsNotificationsFacade,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"notificationSettings" context:off_1001DF558];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsNotificationsViewController;
  -[TVSettingsNotificationsViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsNotificationsFacade sharedInstance]( &OBJC_CLASS___TVSettingsNotificationsFacade,  "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v2,  @"notificationSettings",  &stru_10018F280));
  [v4 setSortsByTitle:1];
  [v3 addObject:v4];

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF558 == a6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsNotificationsFacade sharedInstance]( &OBJC_CLASS___TVSettingsNotificationsFacade,  "sharedInstance",  a3,  a4,  a5));
    id v10 = (id)objc_claimAutoreleasedReturnValue([v7 notificationSettings]);

    if (![v10 count])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsNotificationsViewController navigationController](self, "navigationController"));
      id v9 = [v8 popViewControllerAnimated:1];
    }
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___TVSettingsNotificationsViewController;
    -[TVSettingsNotificationsViewController observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

@end