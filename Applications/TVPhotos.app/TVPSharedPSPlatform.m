@interface TVPSharedPSPlatform
- (BOOL)MSASIsAllowedToTransferMetadata;
- (BOOL)MSASIsAllowedToUploadAssets;
- (BOOL)MSASPersonIDIsAllowedToDownloadAssets:(id)a3;
- (BOOL)personIDEnabledForAlbumSharing:(id)a3;
- (BOOL)personIDUsesProductionPushEnvironment:(id)a3;
- (BOOL)shouldEnableNewFeatures;
- (BOOL)shouldLogAtLevel:(int)a3;
- (Class)pluginClass;
- (id)albumSharingDaemon;
- (id)baseSharingURLForPersonID:(id)a3;
- (id)pathAlbumSharingDir;
- (id)personIDsEnabledForAlbumSharing;
- (id)pushTokenForPersonID:(id)a3;
@end

@implementation TVPSharedPSPlatform

- (BOOL)shouldLogAtLevel:(int)a3
{
  return 1;
}

- (id)albumSharingDaemon
{
  if (qword_1001033A0 != -1) {
    dispatch_once(&qword_1001033A0, &stru_1000CC610);
  }
  return (id)qword_1001033A8;
}

- (id)pathAlbumSharingDir
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"SharedPS"]);
  return v9;
}

- (Class)pluginClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVPSharedPSAccessObject, a2);
}

- (id)baseSharingURLForPersonID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v4, "activeAccount"));
  uint64_t v6 = kAccountDataclassSharedStreams;
  if ([v5 isProvisionedForDataclass:kAccountDataclassSharedStreams])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 propertiesForDataclass:v6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:@"url"]);
    if ([v8 length])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v3]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:@"sharedstreams"]);
    }

    else
    {
      v11 = 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (BOOL)personIDUsesProductionPushEnvironment:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v4, "activeAccount"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  unsigned int v7 = [v6 isEqualToString:v3];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 propertiesForDataclass:kAccountDataclassMediaStream]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"apsEnv"]);
    unsigned __int8 v10 = [v9 isEqualToString:@"production"];
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)pushTokenForPersonID:(id)a3
{
  unsigned __int8 v3 = -[TVPSharedPSPlatform personIDUsesProductionPushEnvironment:](self, "personIDUsesProductionPushEnvironment:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVCKPushNotificationServer sharedInstance]( &OBJC_CLASS___TVCKPushNotificationServer,  "sharedInstance"));
  v5 = v4;
  if ((v3 & 1) != 0) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 publicToken]);
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 devToken]);
  }
  unsigned int v7 = (void *)v6;

  return v7;
}

- (BOOL)personIDEnabledForAlbumSharing:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v4, "activeAccount"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  unsigned __int8 v7 = [v6 isEqualToString:v3];

  return v7;
}

- (id)personIDsEnabledForAlbumSharing
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v2, "activeAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_personID"));
  if (v4) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v4));
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)MSASIsAllowedToTransferMetadata
{
  return 1;
}

- (BOOL)MSASIsAllowedToUploadAssets
{
  return 0;
}

- (BOOL)MSASPersonIDIsAllowedToDownloadAssets:(id)a3
{
  return 1;
}

- (BOOL)shouldEnableNewFeatures
{
  return 1;
}

@end