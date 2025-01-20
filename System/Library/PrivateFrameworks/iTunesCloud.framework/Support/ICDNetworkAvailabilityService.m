@interface ICDNetworkAvailabilityService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDNetworkAvailabilityService)init;
- (void)_canShowCloudDownloadButtonsDidChangeNotification:(id)a3;
- (void)_canShowCloudTracksDidChangeNotification:(id)a3;
- (void)_isCellularDataRestrictedDidChangeNotification:(id)a3;
- (void)_setupNotifications;
- (void)canShowCloudDownloadButtonsWithCompletion:(id)a3;
- (void)canShowCloudMusicWithCompletion:(id)a3;
- (void)canShowCloudVideoWithCompletion:(id)a3;
- (void)dealloc;
- (void)hasProperNetworkConditionsToPlayMediaWithCompletion:(id)a3;
- (void)hasProperNetworkConditionsToShowCloudMediaWithCompletion:(id)a3;
- (void)isCellularDataRestrictedForMusicWithCompletion:(id)a3;
- (void)isCellularDataRestrictedForStoreAppsWithCompletion:(id)a3;
- (void)isCellularDataRestrictedForVideosWithCompletion:(id)a3;
- (void)shouldProhibitMusicActionForCurrentNetworkConditionsWithCompletion:(id)a3;
- (void)shouldProhibitStoreAppsActionForCurrentNetworkConditionsWithCompletion:(id)a3;
- (void)shouldProhibitVideosActionForCurrentNetworkConditionsWithCompletion:(id)a3;
@end

@implementation ICDNetworkAvailabilityService

- (ICDNetworkAvailabilityService)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ICDNetworkAvailabilityService;
  v2 = -[ICDNetworkAvailabilityService init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[ICDNetworkAvailabilityService _setupNotifications](v2, "_setupNotifications");
  }
  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ICDNetworkAvailabilityService;
  -[ICDNetworkAvailabilityService dealloc](&v4, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = objc_msgSend(v5, "icd_isConnectionAllowedForService:", 2);
  if (v6)
  {
    unsigned int v7 = [v5 processIdentifier];
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(v13, 0, sizeof(v13));
    }
    uint64_t v8 = MSVBundleIDForAuditToken(v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v15 = self;
      __int16 v16 = 2114;
      v17 = v9;
      __int16 v18 = 1024;
      unsigned int v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ICDNetworkAvailabilityService %p - XPC connection from %{public}@[%d]",  buf,  0x1Cu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ICCloudServerAvailabilityServiceProtocol));
    [v5 setExportedInterface:v11];
    [v5 setExportedObject:self];
    [v5 resume];
  }

  return v6;
}

- (void)hasProperNetworkConditionsToPlayMediaWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))(v4, [v5 hasProperNetworkConditionsToPlayMedia]);
}

- (void)hasProperNetworkConditionsToShowCloudMediaWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))(v4, [v5 hasProperNetworkConditionsToShowCloudMedia]);
}

- (void)isCellularDataRestrictedForMusicWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))(v4, [v5 isCellularDataRestrictedForMusic]);
}

- (void)shouldProhibitMusicActionForCurrentNetworkConditionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))( v4,  [v5 shouldProhibitMusicActionForCurrentNetworkConditions]);
}

- (void)isCellularDataRestrictedForVideosWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))(v4, [v5 isCellularDataRestrictedForVideos]);
}

- (void)shouldProhibitVideosActionForCurrentNetworkConditionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))( v4,  [v5 shouldProhibitVideosActionForCurrentNetworkConditions]);
}

- (void)isCellularDataRestrictedForStoreAppsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))(v4, [v5 isCellularDataRestrictedForStoreApps]);
}

- (void)shouldProhibitStoreAppsActionForCurrentNetworkConditionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))( v4,  [v5 shouldProhibitStoreAppsActionForCurrentNetworkConditions]);
}

- (void)canShowCloudDownloadButtonsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))(v4, [v5 canShowCloudDownloadButtons]);
}

- (void)canShowCloudMusicWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))(v4, [v5 canShowCloudMusic]);
}

- (void)canShowCloudVideoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  (*((void (**)(id, id))a3 + 2))(v4, [v5 canShowCloudVideo]);
}

- (void)_setupNotifications
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_canShowCloudDownloadButtonsDidChangeNotification:" name:ICCloudAvailabilityControllerCanShowCloudDownloadButtonsDidChangeNotification object:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_canShowCloudTracksDidChangeNotification:" name:ICCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification object:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_isCellularDataRestrictedDidChangeNotification:" name:ICCloudAvailabilityControllerIsCellularDataRestrictedDidChangeNotification object:0];
}

- (void)_canShowCloudDownloadButtonsDidChangeNotification:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  ICCloudAvailabilityControllerCanShowCloudDownloadButtonsDidChangeNotification,  0LL,  0LL,  1u);
}

- (void)_canShowCloudTracksDidChangeNotification:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  ICCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification,  0LL,  0LL,  1u);
}

- (void)_isCellularDataRestrictedDidChangeNotification:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  ICCloudAvailabilityControllerIsCellularDataRestrictedDidChangeNotification,  0LL,  0LL,  1u);
}

@end