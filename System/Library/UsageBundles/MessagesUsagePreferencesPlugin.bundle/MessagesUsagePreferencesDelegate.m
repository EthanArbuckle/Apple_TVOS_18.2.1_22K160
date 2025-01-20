@interface MessagesUsagePreferencesDelegate
- (BOOL)allowDeletionForCategory:(id)a3;
- (float)sizeForCategory:(id)a3;
- (id)usageBundleApps;
@end

@implementation MessagesUsagePreferencesDelegate

- (id)usageBundleApps
{
  LODWORD(v2) = 0;
  id v4 = +[PSUsageBundleApp usageBundleAppForBundleWithIdentifier:withTotalSize:]( &OBJC_CLASS___PSUsageBundleApp,  "usageBundleAppForBundleWithIdentifier:withTotalSize:",  @"com.apple.MobileSMS",  v2);
  uint64_t v12 = IMSharedHelperMessagesRootFolderPath();
  v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count]( +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL),  "count"));
  v6 = objc_autoreleasePoolPush();
  uint64_t v7 = IMSharedHelperMessagesRootFolderPath();
  uint64_t v8 = IMLegacyCalculateFileSizeForPath(v7);
  self->_totalSize = IMRoundFileSize(v8);
  objc_autoreleasePoolPop(v6);
  v9 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___MessagesUsagePreferencesDelegate)),  "localizedStringForKey:value:table:",  @"Messages (Saved)",  &stru_40C8,  @"MessagesUsagePreferences");
  -[NSMutableArray addObject:]( v5,  "addObject:",  +[PSUsageBundleCategory categoryNamed:withIdentifier:forUsageBundleApp:]( &OBJC_CLASS___PSUsageBundleCategory,  "categoryNamed:withIdentifier:forUsageBundleApp:",  v9,  IMSharedHelperMessagesRootFolderPath(),  v4));
  *(float *)&double v10 = (float)self->_totalSize;
  [v4 setTotalSize:v10];
  [v4 setCategories:v5];

  return +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v4, 0LL);
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  return 0;
}

- (float)sizeForCategory:(id)a3
{
  return result;
}

@end