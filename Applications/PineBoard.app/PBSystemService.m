@interface PBSystemService
+ (id)_singleton;
+ (id)activeConnections;
+ (id)allocWithZone:(_NSZone *)a3;
+ (void)notifyDefaultKioskAppPurgeTopShelfContentForApplicationIdentifiers:(id)a3;
+ (void)start;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PBAssertionServiceListener)assertionServiceListener;
- (PBBasicServiceListener)videoSubscriberAccountListener;
- (PBCaptiveNetworkServiceListener)captiveNetworkListener;
- (PBHeadphoneBannerServiceListener)headphoneBannerServiceListener;
- (PBHomeUIServiceListener)homeUIListener;
- (PBOverlayLayoutServiceListener)overlayLayourListener;
- (PBPictureInPictureServiceListener)pictureInPictureListener;
- (PBPreferencesServiceListener)preferencesServiceListener;
- (PBRestrictionServiceListener)restrictionServiceListener;
- (PBSEARCConfiguratorServiceListener)earcConfiguratiorListener;
- (PBScheduledSleepServiceListener)scheduledSleepServiceListener;
- (PBSuggestedUserProfileManagerServiceListener)suggestedUserProfileManagerListener;
- (PBSystemService)init;
- (PBSystemServiceConnection)defaultKioskConnection;
- (PBUserProfileApplicationManagerListener)userProfileApplicationListener;
- (PBUserProfileManagerServiceListener)userProfileManagerListener;
- (PBUserProfilePictureServiceListener)userProfilePictureListener;
- (PBVolumeControlServiceListener)volumeControlListener;
- (_TtC9PineBoard30PBTVUserManagerServiceListener)tvUserManagerServiceListener;
- (id)_activeConnections;
- (id)_init;
- (void)_handleInvalidationForConnection:(id)a3;
- (void)_notifyDefaultKioskAppPurgeTopShelfContentForApplicationIdentifiers:(id)a3;
- (void)_startServices;
- (void)dealloc;
- (void)setAssertionServiceListener:(id)a3;
- (void)setCaptiveNetworkListener:(id)a3;
- (void)setDefaultKioskConnection:(id)a3;
- (void)setEarcConfiguratiorListener:(id)a3;
- (void)setHeadphoneBannerServiceListener:(id)a3;
- (void)setHomeUIListener:(id)a3;
- (void)setOverlayLayourListener:(id)a3;
- (void)setPictureInPictureListener:(id)a3;
- (void)setPreferencesServiceListener:(id)a3;
- (void)setRestrictionServiceListener:(id)a3;
- (void)setScheduledSleepServiceListener:(id)a3;
- (void)setSuggestedUserProfileManagerListener:(id)a3;
- (void)setTvUserManagerServiceListener:(id)a3;
- (void)setUserProfileApplicationListener:(id)a3;
- (void)setUserProfileManagerListener:(id)a3;
- (void)setUserProfilePictureListener:(id)a3;
- (void)setVideoSubscriberAccountListener:(id)a3;
- (void)setVolumeControlListener:(id)a3;
@end

@implementation PBSystemService

+ (id)_singleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100100404;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470EA8 != -1) {
    dispatch_once(&qword_100470EA8, block);
  }
  return (id)qword_100470EA0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001004A8;
  v4[3] = &unk_1003D32B0;
  v4[4] = a3;
  v4[5] = a1;
  if (qword_100470EB8 != -1) {
    dispatch_once(&qword_100470EB8, v4);
  }
  return (id)qword_100470EB0;
}

- (id)_init
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___PBSystemService;
  v2 = -[PBSystemService init](&v41, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PBAssertionServiceListener);
    assertionServiceListener = v2->_assertionServiceListener;
    v2->_assertionServiceListener = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___PBCaptiveNetworkServiceListener);
    captiveNetworkListener = v2->_captiveNetworkListener;
    v2->_captiveNetworkListener = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___PBHeadphoneBannerServiceListener);
    headphoneBannerServiceListener = v2->_headphoneBannerServiceListener;
    v2->_headphoneBannerServiceListener = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___PBSEARCConfiguratorServiceListener);
    earcConfiguratiorListener = v2->_earcConfiguratiorListener;
    v2->_earcConfiguratiorListener = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___PBHomeUIServiceListener);
    homeUIListener = v2->_homeUIListener;
    v2->_homeUIListener = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___PBOverlayLayoutServiceListener);
    overlayLayourListener = v2->_overlayLayourListener;
    v2->_overlayLayourListener = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___PBPictureInPictureServiceListener);
    pictureInPictureListener = v2->_pictureInPictureListener;
    v2->_pictureInPictureListener = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___PBPreferencesServiceListener);
    preferencesServiceListener = v2->_preferencesServiceListener;
    v2->_preferencesServiceListener = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___PBRestrictionServiceListener);
    restrictionServiceListener = v2->_restrictionServiceListener;
    v2->_restrictionServiceListener = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___PBScheduledSleepServiceListener);
    scheduledSleepServiceListener = v2->_scheduledSleepServiceListener;
    v2->_scheduledSleepServiceListener = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___PBSuggestedUserProfileManagerServiceListener);
    suggestedUserProfileManagerListener = v2->_suggestedUserProfileManagerListener;
    v2->_suggestedUserProfileManagerListener = v23;

    v25 = objc_alloc_init(&OBJC_CLASS____TtC9PineBoard30PBTVUserManagerServiceListener);
    tvUserManagerServiceListener = v2->_tvUserManagerServiceListener;
    v2->_tvUserManagerServiceListener = v25;

    v27 = objc_alloc_init(&OBJC_CLASS___PBUserProfileApplicationManagerListener);
    userProfileApplicationListener = v2->_userProfileApplicationListener;
    v2->_userProfileApplicationListener = v27;

    v29 = objc_alloc_init(&OBJC_CLASS___PBUserProfileManagerServiceListener);
    userProfileManagerListener = v2->_userProfileManagerListener;
    v2->_userProfileManagerListener = v29;

    v31 = objc_alloc_init(&OBJC_CLASS___PBUserProfilePictureServiceListener);
    userProfilePictureListener = v2->_userProfilePictureListener;
    v2->_userProfilePictureListener = v31;

    v33 = objc_alloc(&OBJC_CLASS___PBBasicServiceListener);
    uint64_t v34 = PBSVideoSubscriberAccountServiceConfiguration();
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = -[PBBasicServiceListener initWithConfiguration:serviceBuilder:]( v33,  "initWithConfiguration:serviceBuilder:",  v35,  &stru_1003D7698);
    videoSubscriberAccountListener = v2->_videoSubscriberAccountListener;
    v2->_videoSubscriberAccountListener = v36;

    v38 = objc_alloc_init(&OBJC_CLASS___PBVolumeControlServiceListener);
    volumeControlListener = v2->_volumeControlListener;
    v2->_volumeControlListener = v38;
  }

  return v2;
}

- (PBSystemService)init
{
  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSystemService;
  -[PBSystemService dealloc](&v3, "dealloc");
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010086C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470EC0 != -1) {
    dispatch_once(&qword_100470EC0, block);
  }
}

+ (void)notifyDefaultKioskAppPurgeTopShelfContentForApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _singleton]);
  [v5 _notifyDefaultKioskAppPurgeTopShelfContentForApplicationIdentifiers:v4];
}

+ (id)activeConnections
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _singleton]);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _activeConnections]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v3));

  return v4;
}

- (id)_activeConnections
{
  return self->_activeConnections;
}

- (void)_notifyDefaultKioskAppPurgeTopShelfContentForApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  acceptSerialQueue = (dispatch_queue_s *)self->_acceptSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001009D8;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(acceptSerialQueue, v7);
}

- (void)_startServices
{
  objc_super v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PBSystemService.XPCListener", 0LL);
  acceptSerialQueue = self->_acceptSerialQueue;
  self->_acceptSerialQueue = v3;

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  activeConnections = self->_activeConnections;
  self->_activeConnections = v5;

  v7 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.PineBoardServices");
  serviceListener = self->_serviceListener;
  self->_serviceListener = v7;

  -[NSXPCListener setDelegate:](self->_serviceListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_serviceListener, "resume");
  -[PBAssertionServiceListener activate](self->_assertionServiceListener, "activate");
  -[PBCaptiveNetworkServiceListener activate](self->_captiveNetworkListener, "activate");
  -[PBHeadphoneBannerServiceListener activate](self->_headphoneBannerServiceListener, "activate");
  -[PBSEARCConfiguratorServiceListener activate](self->_earcConfiguratiorListener, "activate");
  -[PBHomeUIServiceListener activate](self->_homeUIListener, "activate");
  -[PBOverlayLayoutServiceListener activate](self->_overlayLayourListener, "activate");
  -[PBPictureInPictureServiceListener activate](self->_pictureInPictureListener, "activate");
  -[PBPreferencesServiceListener activate](self->_preferencesServiceListener, "activate");
  -[PBRestrictionServiceListener activate](self->_restrictionServiceListener, "activate");
  -[PBScheduledSleepServiceListener activate](self->_scheduledSleepServiceListener, "activate");
  -[PBSuggestedUserProfileManagerServiceListener activate](self->_suggestedUserProfileManagerListener, "activate");
  -[PBTVUserManagerServiceListener activate](self->_tvUserManagerServiceListener, "activate");
  -[PBUserProfileApplicationManagerListener activate](self->_userProfileApplicationListener, "activate");
  -[PBUserProfileManagerServiceListener activate](self->_userProfileManagerListener, "activate");
  -[PBUserProfilePictureServiceListener activate](self->_userProfilePictureListener, "activate");
  -[PBBasicServiceListener activate](self->_videoSubscriberAccountListener, "activate");
  -[PBVolumeControlServiceListener activate](self->_volumeControlListener, "activate");
}

- (void)_handleInvalidationForConnection:(id)a3
{
  id v4 = a3;
  acceptSerialQueue = (dispatch_queue_s *)self->_acceptSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100100B9C;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(acceptSerialQueue, v7);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  acceptSerialQueue = (dispatch_queue_s *)self->_acceptSerialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100100C4C;
  v9[3] = &unk_1003CFEB8;
  id v10 = v5;
  v11 = self;
  id v7 = v5;
  dispatch_async(acceptSerialQueue, v9);

  return 1;
}

- (PBSystemServiceConnection)defaultKioskConnection
{
  return (PBSystemServiceConnection *)objc_loadWeakRetained((id *)&self->_defaultKioskConnection);
}

- (void)setDefaultKioskConnection:(id)a3
{
}

- (PBAssertionServiceListener)assertionServiceListener
{
  return self->_assertionServiceListener;
}

- (void)setAssertionServiceListener:(id)a3
{
}

- (PBCaptiveNetworkServiceListener)captiveNetworkListener
{
  return self->_captiveNetworkListener;
}

- (void)setCaptiveNetworkListener:(id)a3
{
}

- (PBHeadphoneBannerServiceListener)headphoneBannerServiceListener
{
  return self->_headphoneBannerServiceListener;
}

- (void)setHeadphoneBannerServiceListener:(id)a3
{
}

- (PBSEARCConfiguratorServiceListener)earcConfiguratiorListener
{
  return self->_earcConfiguratiorListener;
}

- (void)setEarcConfiguratiorListener:(id)a3
{
}

- (PBHomeUIServiceListener)homeUIListener
{
  return self->_homeUIListener;
}

- (void)setHomeUIListener:(id)a3
{
}

- (PBOverlayLayoutServiceListener)overlayLayourListener
{
  return self->_overlayLayourListener;
}

- (void)setOverlayLayourListener:(id)a3
{
}

- (PBPictureInPictureServiceListener)pictureInPictureListener
{
  return self->_pictureInPictureListener;
}

- (void)setPictureInPictureListener:(id)a3
{
}

- (PBPreferencesServiceListener)preferencesServiceListener
{
  return self->_preferencesServiceListener;
}

- (void)setPreferencesServiceListener:(id)a3
{
}

- (PBScheduledSleepServiceListener)scheduledSleepServiceListener
{
  return self->_scheduledSleepServiceListener;
}

- (void)setScheduledSleepServiceListener:(id)a3
{
}

- (PBRestrictionServiceListener)restrictionServiceListener
{
  return self->_restrictionServiceListener;
}

- (void)setRestrictionServiceListener:(id)a3
{
}

- (PBSuggestedUserProfileManagerServiceListener)suggestedUserProfileManagerListener
{
  return self->_suggestedUserProfileManagerListener;
}

- (void)setSuggestedUserProfileManagerListener:(id)a3
{
}

- (_TtC9PineBoard30PBTVUserManagerServiceListener)tvUserManagerServiceListener
{
  return self->_tvUserManagerServiceListener;
}

- (void)setTvUserManagerServiceListener:(id)a3
{
}

- (PBUserProfileApplicationManagerListener)userProfileApplicationListener
{
  return self->_userProfileApplicationListener;
}

- (void)setUserProfileApplicationListener:(id)a3
{
}

- (PBUserProfileManagerServiceListener)userProfileManagerListener
{
  return self->_userProfileManagerListener;
}

- (void)setUserProfileManagerListener:(id)a3
{
}

- (PBUserProfilePictureServiceListener)userProfilePictureListener
{
  return self->_userProfilePictureListener;
}

- (void)setUserProfilePictureListener:(id)a3
{
}

- (PBBasicServiceListener)videoSubscriberAccountListener
{
  return self->_videoSubscriberAccountListener;
}

- (void)setVideoSubscriberAccountListener:(id)a3
{
}

- (PBVolumeControlServiceListener)volumeControlListener
{
  return self->_volumeControlListener;
}

- (void)setVolumeControlListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end