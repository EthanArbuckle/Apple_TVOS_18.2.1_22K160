@interface DMDPaths
+ (NSString)managedAppsManifest;
+ (NSString)managedNonStoreBooksDirectory;
+ (NSString)managedNonStoreBooksManifestPath;
+ (NSString)managedStoreBooksManifestPath;
+ (NSString)managementPromptPolicyPath;
+ (NSString)mdmFilePath;
+ (NSString)purchasedBooksDirectory;
+ (NSString)purchasedBooksManifest;
+ (NSString)systemLostModeRequestPath;
+ (id)_managedNonStoreBooksSystemGroupContainer;
+ (id)_systemGroupContainerPathWithGroupIdentifier:(id)a3;
+ (id)_systemProfileLibraryDirectory;
+ (id)_systemProfileStorageDirectory;
+ (id)_userDirectory;
+ (id)configurationProfilesSystemGroupContainer;
@end

@implementation DMDPaths

+ (id)configurationProfilesSystemGroupContainer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046B84;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCD28 != -1) {
    dispatch_once(&qword_1000CCD28, block);
  }
  return (id)qword_1000CCD20;
}

+ (NSString)managementPromptPolicyPath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046CA0;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCD38 != -1) {
    dispatch_once(&qword_1000CCD38, block);
  }
  return (NSString *)(id)qword_1000CCD30;
}

+ (NSString)managedAppsManifest
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046D60;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCD48 != -1) {
    dispatch_once(&qword_1000CCD48, block);
  }
  return (NSString *)(id)qword_1000CCD40;
}

+ (NSString)purchasedBooksManifest
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046E20;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCD58 != -1) {
    dispatch_once(&qword_1000CCD58, block);
  }
  return (NSString *)(id)qword_1000CCD50;
}

+ (NSString)purchasedBooksDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046EE0;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCD68 != -1) {
    dispatch_once(&qword_1000CCD68, block);
  }
  return (NSString *)(id)qword_1000CCD60;
}

+ (NSString)managedStoreBooksManifestPath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046FA0;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCD78 != -1) {
    dispatch_once(&qword_1000CCD78, block);
  }
  return (NSString *)(id)qword_1000CCD70;
}

+ (NSString)managedNonStoreBooksDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100047060;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCD88 != -1) {
    dispatch_once(&qword_1000CCD88, block);
  }
  return (NSString *)(id)qword_1000CCD80;
}

+ (NSString)managedNonStoreBooksManifestPath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100047120;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCD98 != -1) {
    dispatch_once(&qword_1000CCD98, block);
  }
  return (NSString *)(id)qword_1000CCD90;
}

+ (NSString)systemLostModeRequestPath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000471E0;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCDA8 != -1) {
    dispatch_once(&qword_1000CCDA8, block);
  }
  return (NSString *)(id)qword_1000CCDA0;
}

+ (NSString)mdmFilePath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000472A0;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCDB8 != -1) {
    dispatch_once(&qword_1000CCDB8, block);
  }
  return (NSString *)(id)qword_1000CCDB0;
}

+ (id)_userDirectory
{
  return @"/var/mobile/";
}

+ (id)_systemProfileStorageDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004736C;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCDC8 != -1) {
    dispatch_once(&qword_1000CCDC8, block);
  }
  return (id)qword_1000CCDC0;
}

+ (id)_systemProfileLibraryDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004742C;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCDD8 != -1) {
    dispatch_once(&qword_1000CCDD8, block);
  }
  return (id)qword_1000CCDD0;
}

+ (id)_managedNonStoreBooksSystemGroupContainer
{
  v3 = (void *)qword_1000CCDE0;
  if (!qword_1000CCDE0)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( [a1 _systemGroupContainerPathWithGroupIdentifier:@"systemgroup.com.apple.media.books.managed"]);
    v5 = (void *)qword_1000CCDE0;
    qword_1000CCDE0 = v4;

    v3 = (void *)qword_1000CCDE0;
    if (!qword_1000CCDE0)
    {
      BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v6) {
        sub_100065A58(v6, v7, v8, v9, v10, v11, v12, v13);
      }
      v3 = (void *)qword_1000CCDE0;
    }
  }

  return v3;
}

+ (id)_systemGroupContainerPathWithGroupIdentifier:(id)a3
{
  uint64_t v14 = 1LL;
  id v3 = a3;
  uint64_t v4 = container_system_group_path_for_identifier(0, [v3 UTF8String], &v14);
  if (v4)
  {
    v5 = (void *)v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100065B0C((uint64_t)v3, (uint64_t)v5);
    }
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v5,  4LL));
    free(v5);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100065A90((uint64_t)v3, (uint64_t)&v14, v7, v8, v9, v10, v11, v12);
    }
    BOOL v6 = 0LL;
  }

  return v6;
}

@end