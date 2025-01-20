@interface TVSettingsLocationSystemServicesViewController
- (id)loadSettingGroups;
@end

@implementation TVSettingsLocationSystemServicesViewController

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsLocationServicesFacade sharedInstance]( &OBJC_CLASS___TVSettingsLocationServicesFacade,  "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessTypeFormatter]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100086678;
  v13[3] = &unk_10018E608;
  id v14 = v2;
  id v4 = v2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000866BC;
  v10[3] = &unk_100192140;
  id v11 = v3;
  v12 = objc_retainBlock(v13);
  id v5 = v3;
  v6 = v12;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v4,  @"systemServiceItems",  v10));
  v15 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));

  return v8;
}

@end