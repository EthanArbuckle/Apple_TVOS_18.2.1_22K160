@interface MRDNowPlayingOriginClient
- (BOOL)_shouldHandleNotification:(id)a3;
- (BOOL)containsActiveStream;
- (BOOL)isActivityActive;
- (BOOL)isMuted;
- (BOOL)isPlaying;
- (MRDDeviceInfoDataSource)deviceInfoDataSource;
- (MRDMediaRemoteClient)overrideClient;
- (MRDNowPlayingClient)activeNowPlayingClient;
- (MRDNowPlayingClient)computedNowPlayingClient;
- (MRDNowPlayingClient)explicitNowPlayingClient;
- (MRDNowPlayingClient)inferredNowPlayingClient;
- (MRDNowPlayingDataSource)nowPlayingDataSource;
- (MRDNowPlayingOriginClient)initWithDeviceInfoDataSource:(id)a3 delegate:(id)a4;
- (MRDNowPlayingOriginClient)initWithOrigin:(id)a3 deviceInfo:(id)a4 delegate:(id)a5;
- (MRDNowPlayingOriginClient)initWithOrigin:(id)a3 deviceInfo:(id)a4 deviceInfoDataSource:(id)a5 delegate:(id)a6;
- (MRDNowPlayingOriginClientDelegate)delegate;
- (MRDeviceInfo)deviceInfo;
- (MRMutableApplicationActivity)activity;
- (MROrigin)origin;
- (MRPlayerPath)activePlayerPath;
- (MRPlayerPath)playerPath;
- (NSArray)activePlayerClients;
- (NSArray)mostRecentPlayers;
- (NSArray)nowPlayingAudioFormatContentInfos;
- (NSArray)nowPlayingClients;
- (NSData)deviceInfoData;
- (NSDate)registrationDate;
- (NSDictionary)defaultSupportedCommands;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)devicePlaybackSessionID;
- (double)timeSincePlaybackStarted;
- (double)timeSincePlaying;
- (float)volume;
- (id)_onQueue_addNowPlayingClient:(id)a3;
- (id)_onQueue_calculateActiveNowPlayingClient;
- (id)_onQueue_calculateActiveNowPlayingPlayerClients;
- (id)_onQueue_calculateComputedNowPlayingClient;
- (id)_onQueue_calculateInferredNowPlayingClient;
- (id)_playerPathForNowPlayingClient:(id)a3;
- (id)activeContent;
- (id)applicationConnectionOutgoingMessageCallback;
- (id)createNewApplicationConnectionCallback;
- (id)defaultSupportedCommandsDataForClient:(id)a3;
- (id)defaultSupportedCommandsForClient:(id)a3;
- (id)existingNowPlayingClientForClient:(id)a3;
- (id)existingNowPlayingClientForDisplayID:(id)a3;
- (id)existingNowPlayingClientForPid:(int)a3;
- (id)existingNowPlayingClientForPlayerPath:(id)a3;
- (id)nowPlayingClientForClient:(id)a3;
- (id)nowPlayingClientForPlayerPath:(id)a3;
- (unsigned)_onQueue_calculateInferredPlaybackStateForPlayer:(id)a3;
- (unsigned)_stateFromDataSource:(id)a3;
- (unsigned)volumeControlCapabilities;
- (void)_handleActivePlayerDidChange:(id)a3;
- (void)_handleNowPlayingAppMaybeDidChange:(id)a3;
- (void)_handleNowPlayingApplicationDidUnregisterCanBeNowPlaying:(id)a3;
- (void)_handleOriginIsPlayingDidChange:(id)a3;
- (void)_handlePlayerDidRegister:(id)a3;
- (void)_handlePlayerIsPlayingDidChange:(id)a3;
- (void)_handlePlayerPictureInPictureEnabledDidChange:(id)a3;
- (void)_handlePlayerPropertiesDidChange:(id)a3;
- (void)_onQueue_maybeSavePlaybackStateForNotification:(id)a3;
- (void)_onQueue_maybeSetupPlaybackTimeoutTimerForNotification:(id)a3;
- (void)_onQueue_reevaluateStateWithReason:(id)a3;
- (void)_onQueue_reloadInferredStateFromDataSource:(id)a3 reason:(id)a4;
- (void)_onQueue_removeNowPlayingClient:(id)a3;
- (void)_onQueue_updateActivityStatus:(int)a3;
- (void)_registerCallbacks;
- (void)clearDefaultSupportedCommandsData;
- (void)deviceInfoDataSource:(id)a3 deviceInfoDidChange:(id)a4;
- (void)nowPlayingDataSourceNowPlayingApplicationDidChange:(id)a3;
- (void)nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:(id)a3;
- (void)nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:(id)a3;
- (void)nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:(id)a3;
- (void)nowPlayingDataSourceNowPlayingSessionsPlaybackStateDidChange:(id)a3;
- (void)registerApplicationConnectionOutgoingMessageCallback:(id)a3;
- (void)registerCreateNewApplicationConnectionCallback:(id)a3;
- (void)removeAllClients;
- (void)removeNowPlayingClientForClient:(id)a3;
- (void)setActivity:(id)a3;
- (void)setComputedNowPlayingClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDeviceInfoData:(id)a3;
- (void)setDevicePlaybackSessionID:(id)a3;
- (void)setExplicitNowPlayingClient:(id)a3;
- (void)setInferredNowPlayingClient:(id)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setNowPlayingDataSource:(id)a3;
- (void)setOverrideClient:(id)a3;
- (void)setVolume:(float)a3;
- (void)setVolumeControlCapabilities:(unsigned int)a3;
- (void)updateDefaultSupportedCommandsData:(id)a3 forClient:(id)a4;
- (void)updateLastPlayingDate:(id)a3;
@end

@implementation MRDNowPlayingOriginClient

- (BOOL)containsActiveStream
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient activeNowPlayingClient](self, "activeNowPlayingClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePlayerClient]);
  unsigned __int8 v4 = [v3 isActiveStream];

  return v4;
}

- (id)activeContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient activeNowPlayingClient](self, "activeNowPlayingClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePlayerClient]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeContent]);

  return v4;
}

- (MRDNowPlayingOriginClient)initWithOrigin:(id)a3 deviceInfo:(id)a4 deviceInfoDataSource:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___MRDNowPlayingOriginClient;
  v15 = -[MRDNowPlayingOriginClient init](&v42, "init");
  if (!v15) {
    goto LABEL_15;
  }
  dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
  dispatch_queue_t v18 = dispatch_queue_create("com.apple.mediaremote.MRDNowPlayingOriginClient", v17);
  serialQueue = v15->_serialQueue;
  v15->_serialQueue = (OS_dispatch_queue *)v18;

  objc_storeStrong((id *)&v15->_origin, a3);
  -[MRDNowPlayingOriginClient setDeviceInfo:](v15, "setDeviceInfo:", v12);
  objc_storeStrong((id *)&v15->_deviceInfoDataSource, a5);
  -[MRDDeviceInfoDataSource setDelegate:](v15->_deviceInfoDataSource, "setDelegate:", v15);
  objc_storeWeak((id *)&v15->_delegate, v14);
  v20 = -[MRPlayerPath initWithOrigin:client:player:]( objc_alloc(&OBJC_CLASS___MRPlayerPath),  "initWithOrigin:client:player:",  v15->_origin,  0LL,  0LL);
  playerPath = v15->_playerPath;
  v15->_playerPath = v20;

  if (!-[MROrigin isLocal](v15->_origin, "isLocal"))
  {
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    goto LABEL_6;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  id v23 = [v22 localPlaybackState];

  if ((MRMediaRemotePlaybackStateIsAdvancing(v23) & 1) != 0)
  {
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
LABEL_6:
    lastPlayingDate = v15->_lastPlayingDate;
    v15->_lastPlayingDate = (NSDate *)v24;
    goto LABEL_11;
  }

  lastPlayingDate = (NSDate *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate localLastPlayingDate](lastPlayingDate, "localLastPlayingDate"));
  v27 = v26;
  if (v26) {
    v28 = v26;
  }
  else {
    v28 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  }
  v29 = v15->_lastPlayingDate;
  v15->_lastPlayingDate = v28;

LABEL_11:
  uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  registrationDate = v15->_registrationDate;
  v15->_registrationDate = (NSDate *)v30;

  if (-[MROrigin isLocallyHosted](v15->_origin, "isLocallyHosted"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v33 = [v32 computeDevicePlaybackSessionID];

    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v35 = objc_claimAutoreleasedReturnValue([v34 UUIDString]);
      devicePlaybackSessionID = v15->_devicePlaybackSessionID;
      v15->_devicePlaybackSessionID = (NSString *)v35;
    }
  }

  v37 = (dispatch_queue_s *)v15->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100098EC4;
  block[3] = &unk_100399250;
  v38 = v15;
  v41 = v38;
  dispatch_sync(v37, block);
  -[MRDNowPlayingOriginClient _registerCallbacks](v38, "_registerCallbacks");

LABEL_15:
  return v15;
}

- (MRDNowPlayingOriginClient)initWithOrigin:(id)a3 deviceInfo:(id)a4 delegate:(id)a5
{
  return -[MRDNowPlayingOriginClient initWithOrigin:deviceInfo:deviceInfoDataSource:delegate:]( self,  "initWithOrigin:deviceInfo:deviceInfoDataSource:delegate:",  a3,  a4,  0LL,  a5);
}

- (MRDNowPlayingOriginClient)initWithDeviceInfoDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInfo]);
  v10 = -[MRDNowPlayingOriginClient initWithOrigin:deviceInfo:deviceInfoDataSource:delegate:]( self,  "initWithOrigin:deviceInfo:deviceInfoDataSource:delegate:",  v8,  v9,  v7,  v6);

  return v10;
}

- (NSString)description
{
  id v3 = -[NSMutableArray count](self->_nowPlayingClients, "count");
  unsigned __int8 v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)v6;
  v8 = "s";
  if (v3 == (id)1) {
    v8 = "";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p origin=%@ %llu nowPlayingClient%s>",  v6,  self,  self->_origin,  v3,  v8));

  return (NSString *)v9;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class(self);
  unsigned __int8 v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = MRCreateIndentedDebugDescriptionFromObject(self->_origin);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = MRCreateIndentedDebugDescriptionFromObject(self->_deviceInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  double volume = self->_volume;
  id v11 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(self->_volumeControlCapabilities);
  id v12 = @"NO";
  if (self->_isMuted) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  -[MRDNowPlayingOriginClient timeSincePlaying](self, "timeSincePlaying");
  uint64_t v15 = v14;
  -[MRDNowPlayingOriginClient timeSincePlaybackStarted](self, "timeSincePlaybackStarted");
  uint64_t v17 = v16;
  if (-[MRDNowPlayingOriginClient isPlaying](self, "isPlaying")) {
    id v12 = @"YES";
  }
  dispatch_queue_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient devicePlaybackSessionID](self, "devicePlaybackSessionID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@ %p {\n  origin = %@\n  deviceInfo = %@\n  double volume = %f\n  volume capabilities = %@\n  isMuted = %@\n  time since playing = %lf\n  time since playback started = %lf\n  is playing = %@\n  devicePlaybackSessionID = %@\n",  v5,  self,  v7,  v9,  *(void *)&volume,  v11,  v13,  v15,  v17,  v12,  v18));

  activeNowPlayingClient = self->_activeNowPlayingClient;
  if (activeNowPlayingClient)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient client](activeNowPlayingClient, "client"));
    [v19 appendFormat:@"  active now playing client = %@\n", v21];
  }

  overrideClient = self->_overrideClient;
  if (overrideClient)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](overrideClient, "bundleIdentifier"));
    [v19 appendFormat:@"  override client = %@\n", v23];
  }

  explicitNowPlayingClient = self->_explicitNowPlayingClient;
  if (explicitNowPlayingClient)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient client](explicitNowPlayingClient, "client"));
    uint64_t v26 = MRCreateIndentedDebugDescriptionFromObject(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    [v19 appendFormat:@"  explicit now playing client = %@\n", v27];
  }

  computedNowPlayingClient = self->_computedNowPlayingClient;
  if (computedNowPlayingClient)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient client](computedNowPlayingClient, "client"));
    uint64_t v30 = MRCreateIndentedDebugDescriptionFromObject(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    [v19 appendFormat:@"  computed now playing client = %@\n", v31];
  }

  inferredNowPlayingClient = self->_inferredNowPlayingClient;
  if (inferredNowPlayingClient)
  {
    unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient client](inferredNowPlayingClient, "client"));
    uint64_t v34 = MRCreateIndentedDebugDescriptionFromObject(v33);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    [v19 appendFormat:@"  inferred now playing client = %@\n", v35];
  }

  activity = self->_activity;
  if (activity)
  {
    uint64_t v37 = MRCreateIndentedDebugDescriptionFromObject(activity);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    [v19 appendFormat:@"  app activity = %@\n", v38];
  }

  nowPlayingDataSource = self->_nowPlayingDataSource;
  if (nowPlayingDataSource)
  {
    uint64_t v40 = MRCreateIndentedDebugDescriptionFromObject(nowPlayingDataSource);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    [v19 appendFormat:@"  datasource = %@\n", v41];
  }

  objc_super v42 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient defaultSupportedCommands](self, "defaultSupportedCommands"));
  if ([v42 count])
  {
    v43 = (void *)MRMediaRemoteCopyReadableDictionaryDescription(v42);
    uint64_t v44 = MRCreateIndentedDebugDescriptionFromObject(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    [v19 appendFormat:@"  default supportedCommands = %@\n", v45];
  }

  if (-[NSMutableArray count](self->_nowPlayingClients, "count"))
  {
    nowPlayingClients = self->_nowPlayingClients;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_100099378;
    v51[3] = &unk_10039E188;
    v51[4] = self;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](nowPlayingClients, "sortedArrayUsingComparator:", v51));
    uint64_t v48 = MRCreateIndentedDebugDescriptionFromArray(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    [v19 appendFormat:@"all now playing clients = %@\n", v49];
  }

  return (NSString *)v19;
}

- (NSArray)activePlayerClients
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100099508;
  v10 = sub_100099518;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100099520;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (MRPlayerPath)activePlayerPath
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100099508;
  v10 = sub_100099518;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009960C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRPlayerPath *)v3;
}

- (MRDeviceInfo)deviceInfo
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100099508;
  v10 = sub_100099518;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100099714;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDeviceInfo *)v3;
}

- (void)setDeviceInfo:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000997C8;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (NSData)deviceInfoData
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100099508;
  v10 = sub_100099518;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100099B2C;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

- (float)volume
{
  uint64_t v6 = 0LL;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100099C30;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setVolume:(float)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100099CA0;
  v4[3] = &unk_10039A990;
  v4[4] = self;
  float v5 = a3;
  msv_dispatch_sync_on_queue(serialQueue, v4);
}

- (unsigned)volumeControlCapabilities
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100099DBC;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setVolumeControlCapabilities:(unsigned int)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100099E2C;
  v4[3] = &unk_10039A990;
  v4[4] = self;
  unsigned int v5 = a3;
  msv_dispatch_sync_on_queue(serialQueue, v4);
}

- (BOOL)isMuted
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100099F3C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsMuted:(BOOL)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100099FAC;
  v4[3] = &unk_10039A9E0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(serialQueue, v4);
}

- (NSArray)nowPlayingClients
{
  char v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  serialQueue = self->_serialQueue;
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_10009A234;
  id v11 = &unk_100398E60;
  id v12 = self;
  id v13 = v3;
  BOOL v5 = v3;
  msv_dispatch_sync_on_queue(serialQueue, &v8);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v5, "allObjects", v8, v9, v10, v11, v12));

  return (NSArray *)v6;
}

- (NSArray)mostRecentPlayers
{
  char v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009A438;
  v9[3] = &unk_100398E60;
  v9[4] = self;
  BOOL v5 = v3;
  v10 = v5;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

- (MRDNowPlayingClient)activeNowPlayingClient
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_100099508;
  v10 = sub_100099518;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009A780;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDNowPlayingClient *)v3;
}

- (void)setComputedNowPlayingClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009A810;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)setExplicitNowPlayingClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009AA48;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)setInferredNowPlayingClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009AC80;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)setOverrideClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009AEB8;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)setActivity:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009B0FC;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (BOOL)isActivityActive
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009B3CC;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isPlaying
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009B510;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)timeSincePlaying
{
  uint64_t v6 = 0LL;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009B758;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)timeSincePlaybackStarted
{
  uint64_t v6 = 0LL;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009B9E8;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)nowPlayingClientForClient:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___MRPlayerPath);
  -[MRPlayerPath setOrigin:](v5, "setOrigin:", self->_origin);
  -[MRPlayerPath setClient:](v5, "setClient:", v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient nowPlayingClientForPlayerPath:](self, "nowPlayingClientForPlayerPath:", v5));
  return v6;
}

- (id)nowPlayingClientForPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_100099508;
  uint64_t v17 = sub_100099518;
  id v18 = 0LL;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009BBC4;
  v9[3] = &unk_10039C6E8;
  id v6 = v4;
  id v11 = self;
  id v12 = &v13;
  id v10 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)existingNowPlayingClientForPlayerPath:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 client]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient existingNowPlayingClientForClient:]( self,  "existingNowPlayingClientForClient:",  v4));

  return v5;
}

- (id)existingNowPlayingClientForPid:(int)a3
{
  id v4 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]( objc_alloc(&OBJC_CLASS___MRClient),  "initWithProcessIdentifier:bundleIdentifier:",  *(void *)&a3,  0LL);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient existingNowPlayingClientForClient:]( self,  "existingNowPlayingClientForClient:",  v4));

  return v5;
}

- (id)existingNowPlayingClientForDisplayID:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]( objc_alloc(&OBJC_CLASS___MRClient),  "initWithProcessIdentifier:bundleIdentifier:",  0LL,  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient existingNowPlayingClientForClient:]( self,  "existingNowPlayingClientForClient:",  v5));
  return v6;
}

- (id)existingNowPlayingClientForClient:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100099508;
  uint64_t v16 = sub_100099518;
  id v17 = 0LL;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009BE50;
  v9[3] = &unk_100399DF8;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)removeAllClients
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009C05C;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)removeNowPlayingClientForClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009C1E8;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)_onQueue_removeNowPlayingClient:(id)a3
{
  id v4 = (MRDNowPlayingClient *)a3;
  uint64_t v6 = _MRLogForCategory(1LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient client](v4, "client"));
    playerPath = self->_playerPath;
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v8;
    __int16 v31 = 2114;
    v32 = playerPath;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingOriginClient] Removing nowPlayingClient %{public}@ for %{public}@",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient playerClients](v4, "playerClients"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * (void)v14) player]);
        -[MRDNowPlayingClient removePlayerClientForPlayer:](v4, "removePlayerClientForPlayer:", v15);

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v12);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingOriginClient:self clientDidUnregister:v4];

  -[NSMutableArray removeObject:](self->_nowPlayingClients, "removeObject:", v4);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient client](v4, "client"));
  unsigned int v18 = -[MRDMediaRemoteClient pid](self->_overrideClient, "pid");
  if (self->_explicitNowPlayingClient == v4) {
    -[MRDNowPlayingOriginClient setExplicitNowPlayingClient:](self, "setExplicitNowPlayingClient:", 0LL);
  }
  if (self->_inferredNowPlayingClient == v4) {
    -[MRDNowPlayingOriginClient setInferredNowPlayingClient:](self, "setInferredNowPlayingClient:", 0LL);
  }
  if (self->_computedNowPlayingClient == v4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient _onQueue_calculateComputedNowPlayingClient]( self,  "_onQueue_calculateComputedNowPlayingClient"));
    -[MRDNowPlayingOriginClient setComputedNowPlayingClient:](self, "setComputedNowPlayingClient:", v19);
  }

  activity = self->_activity;
  if (activity)
  {
    unsigned int v21 = -[MRMutableApplicationActivity creatorProcessID](activity, "creatorProcessID");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient client](v4, "client"));
    unsigned int v23 = [v22 processIdentifier];

    if (v21 == v23) {
      -[MRDNowPlayingOriginClient setActivity:](self, "setActivity:", 0LL);
    }
  }
}

- (void)updateDefaultSupportedCommandsData:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009C588;
  block[3] = &unk_100398F40;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
}

- (id)defaultSupportedCommandsDataForClient:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100099508;
  uint64_t v16 = sub_100099518;
  id v17 = 0LL;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009C710;
  v9[3] = &unk_10039C6E8;
  void v9[4] = self;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)defaultSupportedCommandsForClient:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient defaultSupportedCommandsDataForClient:]( self,  "defaultSupportedCommandsDataForClient:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRCommandInfo commandInfosFromData:](&OBJC_CLASS___MRCommandInfo, "commandInfosFromData:", v3));

  return v4;
}

- (NSDictionary)defaultSupportedCommands
{
  uint64_t v24 = 0LL;
  __int128 v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  __int128 v27 = sub_100099508;
  v28 = sub_100099518;
  id v29 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009C968;
  block[3] = &unk_100398EC8;
  void block[4] = self;
  void block[5] = &v24;
  dispatch_sync(serialQueue, block);
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  double v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)v25[5];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_10009C9F0;
  uint64_t v16 = &unk_10039E1D0;
  uint64_t v5 = v3;
  id v17 = v5;
  unsigned int v18 = &v19;
  id v6 = [v4 enumerateKeysAndObjectsUsingBlock:&v13];
  if (!*((_BYTE *)v20 + 24))
  {
    id v7 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID(v6);
    id v11 = (void *)MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands(v7, v8, v9, v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v7, v13, v14, v15, v16);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v24, 8);

  return (NSDictionary *)v5;
}

- (void)clearDefaultSupportedCommandsData
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009CACC;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)updateLastPlayingDate:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009CB54;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (NSArray)nowPlayingAudioFormatContentInfos
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSource nowPlayingAudioFormatContentInfos]( self->_nowPlayingDataSource,  "nowPlayingAudioFormatContentInfos"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  return (NSArray *)v3;
}

- (void)setDevicePlaybackSessionID:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009CC3C;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)registerCreateNewApplicationConnectionCallback:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009CCC4;
  block[3] = &unk_100399F10;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(serialQueue, block);
}

- (void)registerApplicationConnectionOutgoingMessageCallback:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009CD70;
  block[3] = &unk_100399F10;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(serialQueue, block);
}

- (void)setNowPlayingDataSource:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_nowPlayingDataSource, a3);
  -[MRDNowPlayingDataSource addObserver:](self->_nowPlayingDataSource, "addObserver:", self);
  if (self->_nowPlayingDataSource)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009CE38;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_async(serialQueue, block);
  }
}

- (void)nowPlayingDataSourceNowPlayingApplicationDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009CEC8;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009CF58;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009CFE8;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)nowPlayingDataSourceNowPlayingSessionsPlaybackStateDidChange:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009D078;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector(WeakRetained, "nowPlayingOriginClientDidChangeAudioFormatContentInfo:");

  if ((v6 & 1) != 0)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 nowPlayingOriginClientDidChangeAudioFormatContentInfo:self];
  }

- (void)_onQueue_reloadInferredStateFromDataSource:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3)
  {
    id v20 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient _onQueue_calculateInferredNowPlayingClient]( self,  "_onQueue_calculateInferredNowPlayingClient"));
    -[MRDNowPlayingOriginClient setInferredNowPlayingClient:](self, "setInferredNowPlayingClient:", v8);

    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    uint64_t v9 = self->_nowPlayingClients;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v13);
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 playerClients]);
          id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v22;
            do
            {
              uint64_t v19 = 0LL;
              do
              {
                if (*(void *)v22 != v18) {
                  objc_enumerationMutation(v15);
                }
                objc_msgSend( *(id *)(*((void *)&v21 + 1) + 8 * (void)v19),  "setInferredPlaybackState:",  -[MRDNowPlayingOriginClient _onQueue_calculateInferredPlaybackStateForPlayer:]( self,  "_onQueue_calculateInferredPlaybackStateForPlayer:",  *(void *)(*((void *)&v21 + 1) + 8 * (void)v19)));
                uint64_t v19 = (char *)v19 + 1;
              }

              while (v17 != v19);
              id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }

            while (v17);
          }

          id v13 = (char *)v13 + 1;
        }

        while (v13 != v11);
        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
      }

      while (v11);
    }

    id v7 = v20;
    -[MRDNowPlayingOriginClient _onQueue_reevaluateStateWithReason:](self, "_onQueue_reevaluateStateWithReason:", v20);
  }
}

- (void)deviceInfoDataSource:(id)a3 deviceInfoDidChange:(id)a4
{
  id v7 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient origin](self, "origin"));
  unsigned int v6 = [v5 isLocal];

  if (v6) {
    -[MRDNowPlayingOriginClient setDeviceInfo:](self, "setDeviceInfo:", v7);
  }
}

- (void)_handleNowPlayingAppMaybeDidChange:(id)a3
{
  id v5 = a3;
  if (-[MRDNowPlayingOriginClient _shouldHandleNotification:](self, "_shouldHandleNotification:"))
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009D3E4;
    block[3] = &unk_100398E60;
    void block[4] = self;
    id v7 = v5;
    dispatch_sync(serialQueue, block);
  }
}

- (void)_handlePlayerIsPlayingDidChange:(id)a3
{
  id v5 = a3;
  if (-[MRDNowPlayingOriginClient _shouldHandleNotification:](self, "_shouldHandleNotification:"))
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009D540;
    block[3] = &unk_100398E60;
    void block[4] = self;
    id v7 = v5;
    dispatch_sync(serialQueue, block);
  }
}

- (void)_handleOriginIsPlayingDidChange:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo(v4);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if ([v6 isLocal])
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009D66C;
    block[3] = &unk_100398E60;
    void block[4] = self;
    id v10 = v8;
    dispatch_sync(serialQueue, block);
  }
}

- (void)_handlePlayerPropertiesDidChange:(id)a3
{
  if (self->_nowPlayingDataSource)
  {
    id v4 = a3;
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSString);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

    uint64_t v8 = MRGetPlayerPathFromUserInfo(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = -[NSString initWithFormat:](v5, "initWithFormat:", @"%@-%@", v6, v9);

    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009D77C;
    block[3] = &unk_100398E60;
    void block[4] = self;
    uint64_t v14 = v10;
    uint64_t v12 = v10;
    dispatch_async(serialQueue, block);
  }

- (void)_handlePlayerPictureInPictureEnabledDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo(v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);

  if ([v7 isEqual:self->_origin])
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009D820;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_sync(serialQueue, block);
  }
}

- (void)_handleActivePlayerDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo(v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);

  if ([v7 isEqual:self->_origin])
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009D8C4;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_sync(serialQueue, block);
  }
}

- (void)_handleNowPlayingApplicationDidUnregisterCanBeNowPlaying:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo(v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);

  if ([v7 isEqual:self->_origin])
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009D968;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_sync(serialQueue, block);
  }
}

- (void)_handlePlayerDidRegister:(id)a3
{
  id v4 = a3;
  if (self->_nowPlayingDataSource)
  {
    id v16 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = MRGetOriginFromUserInfo(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if ([v7 isEqual:self->_origin])
    {
      uint64_t v8 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v16 userInfo]);
      uint64_t v11 = MRGetPlayerPathFromUserInfo(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = -[NSString initWithFormat:](v8, "initWithFormat:", @"%@-%@", v9, v12);

      serialQueue = (dispatch_queue_s *)self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10009DAA4;
      block[3] = &unk_100398E60;
      void block[4] = self;
      uint64_t v18 = v13;
      uint64_t v15 = v13;
      dispatch_sync(serialQueue, block);
    }

    id v4 = v16;
  }
}

- (BOOL)_shouldHandleNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetOriginFromUserInfo(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if ([v7 isEqual:self->_origin])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey]);
    unsigned __int8 v10 = [v9 BOOLValue];

    char v11 = v10 ^ 1;
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)_onQueue_calculateActiveNowPlayingClient
{
  overrideClient = self->_overrideClient;
  if (overrideClient)
  {
    id v4 = (MRDNowPlayingClient *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient existingNowPlayingClientForPid:]( self,  "existingNowPlayingClientForPid:",  -[MRDMediaRemoteClient pid](overrideClient, "pid")));
    return v4;
  }

  explicitNowPlayingClient = self->_explicitNowPlayingClient;
  if (!explicitNowPlayingClient)
  {
    if (self->_computedNowPlayingClient
      && (id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings")),
          unsigned int v8 = [v7 computeNowPlayingApplication],
          v7,
          v8))
    {
      explicitNowPlayingClient = self->_computedNowPlayingClient;
    }

    else
    {
      explicitNowPlayingClient = self->_inferredNowPlayingClient;
      if (!explicitNowPlayingClient)
      {
        id v4 = 0LL;
        goto LABEL_10;
      }
    }
  }

  id v4 = explicitNowPlayingClient;
LABEL_10:
  if (self->_activity)
  {
    -[MRDNowPlayingOriginClient timeSincePlaying](self, "timeSincePlaying");
    double v10 = v9;
    char v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v11 mediaRecentlyPlayedInterval];
    double v13 = v12;

    if (v10 > v13)
    {
      uint64_t v14 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]( objc_alloc(&OBJC_CLASS___MRClient),  "initWithProcessIdentifier:bundleIdentifier:",  -[MRMutableApplicationActivity creatorProcessID](self->_activity, "creatorProcessID"),  0LL);
      uint64_t v15 = objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient nowPlayingClientForClient:](self, "nowPlayingClientForClient:", v14));

      id v4 = (MRDNowPlayingClient *)v15;
    }
  }

  return v4;
}

- (id)_onQueue_calculateComputedNowPlayingClient
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient mostRecentPlayers](self, "mostRecentPlayers"));
  id v4 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v9);
        char v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 client]);
        double v13 = (MRDNowPlayingClient *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient nowPlayingClientForClient:]( self,  "nowPlayingClientForClient:",  v12));

        if (v13 == self->_computedNowPlayingClient || v13 == self->_inferredNowPlayingClient) {
          goto LABEL_12;
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 snapshotForIsPlaying:0]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 date]);

        if (!v15) {
          goto LABEL_11;
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v16 timeIntervalSinceDate:v15];
        double v18 = v17;

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
        [v19 nowPlayingApplicationTimeout];
        double v21 = v20;

        if (v18 <= v21)
        {
LABEL_11:

LABEL_12:
LABEL_13:
          double v13 = (MRDNowPlayingClient *)objc_claimAutoreleasedReturnValue([v10 playerPath]);
          -[NSMutableArray addObject:](v4, "addObject:", v13);
          goto LABEL_14;
        }

LABEL_14:
        double v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v22 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v7 = v22;
    }

    while (v22);
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v4, "firstObject"));
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 client]);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient nowPlayingClientForClient:](self, "nowPlayingClientForClient:", v24));

  return v25;
}

- (id)_onQueue_calculateInferredNowPlayingClient
{
  v2 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  double v3 = v2->_nowPlayingDataSource;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v5 = [v4 supportNowPlayingPIP];

  id v6 = &MSVWeakLinkStringConstant_ptr;
  if (!v5)
  {
LABEL_20:
    id v26 = objc_alloc((Class)v6[83]);
    id v27 = (id)-[MRDNowPlayingDataSource nowPlayingApplicationPID](v3, "nowPlayingApplicationPID");
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingDataSource nowPlayingApplicationDisplayID](v3, "nowPlayingApplicationDisplayID"));
    id v29 = [v26 initWithProcessIdentifier:v27 bundleIdentifier:v28];

    id v33 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient existingNowPlayingClientForClient:]( v2,  "existingNowPlayingClientForClient:",  v29));
    goto LABEL_21;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingDataSource nowPlayingApplications](v3, "nowPlayingApplications"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v10)
  {

    goto LABEL_20;
  }

  id v11 = v10;
  __int16 v31 = v3;
  uint64_t v12 = *(void *)v35;
  uint64_t v32 = *(void *)v35;
  id v33 = 0LL;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v35 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
      id v15 = objc_alloc((Class)v6[83]);
      id v16 = [v14 pid];
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v14 nowPlayingApplicationDisplayID]);
      id v18 = [v15 initWithProcessIdentifier:v16 bundleIdentifier:v17];

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient existingNowPlayingClientForClient:]( v2,  "existingNowPlayingClientForClient:",  v18));
      if ([v14 isEligible])
      {
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 activePlayerClient]);
        if ([v20 canBeNowPlayingPlayer])
        {
          id v21 = v9;
          id v22 = v2;
          __int128 v23 = v6;
          if (v33)
          {
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v33 activePlayerClient]);
            unsigned int v25 = [v24 isPictureInPictureEnabled];

            if (!v25)
            {
              id v6 = v23;
              v2 = v22;
              id v9 = v21;
              uint64_t v12 = v32;
              goto LABEL_15;
            }
          }

          else
          {
          }

          double v20 = v33;
          id v33 = v19;
          id v6 = v23;
          v2 = v22;
          id v9 = v21;
          uint64_t v12 = v32;
        }
      }

- (unsigned)_onQueue_calculateInferredPlaybackStateForPlayer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v5 = self->_nowPlayingDataSource;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v7 = [v6 supportMultiplayerHost];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingDataSource nowPlayingSessions](v5, "nowPlayingSessions"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 audioSessionID]));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);

    else {
      unsigned int v12 = 2;
    }

    goto LABEL_32;
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  if ([v13 supportNowPlayingPIP])
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mxSessionIDs]);
    id v16 = [v15 count];

    if (v16)
    {
      double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v35 = v5;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingDataSource nowPlayingApplications](v5, "nowPlayingApplications"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allValues]);

      id v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v20) {
        goto LABEL_20;
      }
      id v21 = v20;
      uint64_t v22 = *(void *)v37;
      while (1)
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          __int128 v24 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 client]);
          unsigned int v27 = [v26 processIdentifier];
          if (v27 == [v24 pid])
          {
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v24 mxSessionIDs]);

            if (!v28) {
              continue;
            }
            unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 mxSessionIDs]);
            [v17 unionSet:v25];
          }

          else
          {
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (!v21)
        {
LABEL_20:

          unsigned int v5 = v35;
          if (-[MRDNowPlayingDataSource nowPlayingApplicationIsInterrupted](v35, "nowPlayingApplicationIsInterrupted")) {
            int v29 = 4;
          }
          else {
            int v29 = 1;
          }
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
          __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 mxSessionIDs]);
          else {
            unsigned int v12 = 2;
          }

          goto LABEL_32;
        }
      }
    }
  }

  else
  {
  }

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient inferredNowPlayingClient](self, "inferredNowPlayingClient"));
  id v33 = (id)objc_claimAutoreleasedReturnValue([v32 activePlayerClient]);
  if (v33 == v4) {
    unsigned int v12 = -[MRDNowPlayingOriginClient _stateFromDataSource:](self, "_stateFromDataSource:", v5);
  }
  else {
    unsigned int v12 = 2;
  }

LABEL_32:
  return v12;
}

- (id)_onQueue_calculateActiveNowPlayingPlayerClients
{
  double v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient nowPlayingClients](self, "nowPlayingClients"));
  id v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        unsigned int v5 = *(void **)(*((void *)&v26 + 1) + 8 * v4);
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playerClients]);
        id v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v23;
          do
          {
            id v10 = 0LL;
            do
            {
              if (*(void *)v23 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v10);
              unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient activeNowPlayingClient](self, "activeNowPlayingClient"));
              uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 activePlayerClient]);
              if ((void *)v13 == v11)
              {

LABEL_15:
                -[NSMutableSet addObject:](v3, "addObject:", v11);
                goto LABEL_16;
              }

              uint64_t v14 = (void *)v13;
              unsigned __int8 v15 = [v11 isPictureInPictureEnabled];

              if ((v15 & 1) != 0) {
                goto LABEL_15;
              }
LABEL_16:
              id v10 = (char *)v10 + 1;
            }

            while (v8 != v10);
            id v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }

          while (v8);
        }

        uint64_t v4 = v21 + 1;
      }

      while ((id)(v21 + 1) != v20);
      id v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v20);
  }

  id v16 = -[NSMutableSet copy](v3, "copy");
  return v16;
}

- (void)_onQueue_reevaluateStateWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(1LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1002B748C((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient _playerPathForNowPlayingClient:]( self,  "_playerPathForNowPlayingClient:",  self->_activeNowPlayingClient));
  unsigned __int8 v15 = (MRDNowPlayingClient *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient _onQueue_calculateActiveNowPlayingClient]( self,  "_onQueue_calculateActiveNowPlayingClient"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient _playerPathForNowPlayingClient:]( self,  "_playerPathForNowPlayingClient:",  v15));
  if (v15 == self->_activeNowPlayingClient) {
    goto LABEL_21;
  }
  uint64_t v18 = _MRLogForCategory(1LL, v16);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v64 = v14;
    __int16 v65 = 2114;
    v66 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingOriginClient] ActiveNowPlayingClient changed from %{public}@ to %{public}@",  buf,  0x16u);
  }

  objc_storeStrong((id *)&self->_activeNowPlayingClient, v15);
  if (!self->_activeNowPlayingClient)
  {
    uint64_t v33 = _MRLogForCategory(1LL, v20);
    __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_1002B73BC((uint64_t)self, v34, v35, v36, v37, v38, v39, v40);
    }

    activeNowPlayingClientTransaction = self->_activeNowPlayingClientTransaction;
    self->_activeNowPlayingClientTransaction = 0LL;
    goto LABEL_14;
  }

  if (!self->_activeNowPlayingClientTransaction)
  {
    uint64_t v21 = _MRLogForCategory(1LL, v20);
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_1002B7424((uint64_t)self, v22, v23, v24, v25, v26, v27, v28);
    }

    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath description](self->_playerPath, "description"));
    activeNowPlayingClientTransaction = (MROSTransaction *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.mediaremoted.MRDNowPlayingOriginClient/%@",  v29));

    __int16 v31 = -[MROSTransaction initWithName:]( objc_alloc(&OBJC_CLASS___MROSTransaction),  "initWithName:",  activeNowPlayingClientTransaction);
    uint64_t v32 = self->_activeNowPlayingClientTransaction;
    self->_activeNowPlayingClientTransaction = v31;

    MRRegisterTransaction(self->_activeNowPlayingClientTransaction);
LABEL_14:
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v42 = [v17 copy];
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient activePlayerClient](self->_activeNowPlayingClient, "activePlayerClient"));
  objc_msgSend( WeakRetained,  "nowPlayingOriginClient:activePlayerPathDidChange:withPlaybackState:",  self,  v42,  objc_msgSend(v43, "playbackState"));

  if (!self->_activity) {
    goto LABEL_21;
  }
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v14 client]);
  unsigned int v45 = [v44 processIdentifier];
  unsigned int v46 = -[MRMutableApplicationActivity creatorProcessID](self->_activity, "creatorProcessID");

  if (v45 == v46)
  {
    uint64_t v47 = 4LL;
  }

  else
  {
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient client](self->_activeNowPlayingClient, "client"));
    unsigned int v49 = [v48 processIdentifier];
    unsigned int v50 = -[MRMutableApplicationActivity creatorProcessID](self->_activity, "creatorProcessID");

    if (v49 != v50) {
      goto LABEL_21;
    }
    uint64_t v47 = 2LL;
  }

  -[MRDNowPlayingOriginClient _onQueue_updateActivityStatus:](self, "_onQueue_updateActivityStatus:", v47);
LABEL_21:
  v51 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient _onQueue_calculateActiveNowPlayingPlayerClients]( self,  "_onQueue_calculateActiveNowPlayingPlayerClients"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", self->_activePlayerClients));
  unsigned __int8 v53 = [v52 isEqualToSet:v51];

  if ((v53 & 1) == 0)
  {
    uint64_t v55 = _MRLogForCategory(1LL, v54);
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray mr_map:](self->_activePlayerClients, "mr_map:", &stru_10039E210));
      v58 = (void *)objc_claimAutoreleasedReturnValue([v51 allObjects]);
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "mr_map:", &stru_10039E230));
      *(_DWORD *)buf = 138543618;
      v64 = v57;
      __int16 v65 = 2114;
      v66 = v59;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingOriginClient] ActiveNowPlayingPlayersClients changed from %{public}@ to %{public}@",  buf,  0x16u);
    }

    v60 = (NSArray *)objc_claimAutoreleasedReturnValue([v51 allObjects]);
    activePlayerClients = self->_activePlayerClients;
    self->_activePlayerClients = v60;

    id v62 = objc_loadWeakRetained((id *)&self->_delegate);
    [v62 nowPlayingOriginClient:self activePlayerClientsDidChange:self->_activePlayerClients];
  }
}

- (void)_onQueue_updateActivityStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  activity = self->_activity;
  if (activity)
  {
    if (-[MRMutableApplicationActivity status](activity, "status") != (_DWORD)v3)
    {
      -[MRMutableApplicationActivity setStatus:](self->_activity, "setStatus:", v3);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v6 = -[MRMutableApplicationActivity copy](self->_activity, "copy");
      [WeakRetained nowPlayingOriginClient:self applicationActivityStatusDidChange:v6];
    }
  }

- (id)_onQueue_addNowPlayingClient:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v6 = _MRLogForCategory(1LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingOriginClient] Creating nowPlayingClient for %{public}@",  buf,  0xCu);
  }

  uint64_t v8 = -[MRDNowPlayingClient initWithPlayerPath:]( objc_alloc(&OBJC_CLASS___MRDNowPlayingClient),  "initWithPlayerPath:",  v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nowPlayingServer]);
  -[MRDNowPlayingClient setDelegate:](v8, "setDelegate:", v10);

  nowPlayingClients = self->_nowPlayingClients;
  if (!nowPlayingClients)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v13 = self->_nowPlayingClients;
    self->_nowPlayingClients = v12;

    nowPlayingClients = self->_nowPlayingClients;
  }

  -[NSMutableArray addObject:](nowPlayingClients, "addObject:", v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingOriginClient:self clientDidRegister:v8];

  -[MRDNowPlayingClient initializeDisplayName](v8, "initializeDisplayName");
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient playerClientForPlayer:](v8, "playerClientForPlayer:", v15));

  nowPlayingDataSource = self->_nowPlayingDataSource;
  uint64_t v18 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 playerPath]);
  uint64_t v20 = -[NSString initWithFormat:](v18, "initWithFormat:", @"addNowPlayingClient-%@", v19);
  -[MRDNowPlayingOriginClient _onQueue_reloadInferredStateFromDataSource:reason:]( self,  "_onQueue_reloadInferredStateFromDataSource:reason:",  nowPlayingDataSource,  v20);

  return v8;
}

- (void)_onQueue_maybeSetupPlaybackTimeoutTimerForNotification:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10009F02C;
  v25[3] = &unk_10039E258;
  v25[4] = self;
  if (sub_10009F02C((uint64_t)v25))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient activePlayerClient](self->_activeNowPlayingClient, "activePlayerClient"));
    if ([v5 isPlaying])
    {
      playbackTimer = self->_playbackTimer;
      id v7 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      uint64_t v10 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@ is playing for notification <%@>", v8, v9);
      -[MRPersistentTimer invalidateWithReason:](playbackTimer, "invalidateWithReason:", v10);
    }

    else
    {
      -[MRDNowPlayingOriginClient timeSincePlaying](self, "timeSincePlaying");
      double v12 = v11;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      [v13 mediaRecentlyPlayedInterval];
      double v15 = v14 + 5.0;

      if (v12 < v15)
      {
        uint64_t v16 = objc_alloc(&OBJC_CLASS___MRPersistentTimer);
        serialQueue = self->_serialQueue;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_10009F0C0;
        v23[3] = &unk_100398E60;
        v23[4] = self;
        id v24 = v4;
        uint64_t v18 = -[MRPersistentTimer initWithInterval:name:queue:block:]( v16,  "initWithInterval:name:queue:block:",  @"com.apple.mediaremote.originclient.playbacktimer",  serialQueue,  v23,  v15 - v12);
        uint64_t v19 = self->_playbackTimer;
        self->_playbackTimer = v18;

LABEL_8:
        goto LABEL_9;
      }

      uint64_t v20 = self->_playbackTimer;
      uint64_t v21 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
      __int128 v22 = -[NSString initWithFormat:](v21, "initWithFormat:", @"%@ was not playing recently", v8);
      -[MRPersistentTimer invalidateWithReason:](v20, "invalidateWithReason:", v22);
    }

    goto LABEL_8;
  }

- (void)_onQueue_maybeSavePlaybackStateForNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingClient activePlayerClient](self->_activeNowPlayingClient, "activePlayerClient"));
  unsigned int v5 = [v4 playbackState];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v7 = [v6 localPlaybackState];

  uint64_t v8 = self->_lastPlayingDate;
  if (v7 != v5)
  {
    if (qword_1003FDDE0 != -1) {
      dispatch_once(&qword_1003FDDE0, &stru_10039E278);
    }
    uint64_t v9 = (dispatch_queue_s *)qword_1003FDDD8;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10009F30C;
    v10[3] = &unk_100399B70;
    unsigned int v12 = v5;
    unsigned int v13 = v7;
    double v11 = v8;
    dispatch_async(v9, v10);
  }
}

- (void)_registerCallbacks
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = kMRMediaRemotePlayerIsPlayingDidChangeNotification;
  [v3 addObserver:self selector:"_handleNowPlayingAppMaybeDidChange:" name:kMRMediaRemotePlayerIsPlayingDidChangeNotification object:0];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleNowPlayingAppMaybeDidChange:" name:kMRMediaRemoteNowPlayingApplicationDidRegisterCanBeNowPlaying object:0];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_handleNowPlayingAppMaybeDidChange:" name:kMRMediaRemoteNowPlayingApplicationDidUnregisterCanBeNowPlaying object:0];

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v8 = kMRMediaRemoteNowPlayingPlayerDidRegister;
  [v7 addObserver:self selector:"_handleNowPlayingAppMaybeDidChange:" name:kMRMediaRemoteNowPlayingPlayerDidRegister object:0];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v10 = kMRMediaRemoteNowPlayingPlayerDidUnregister;
  [v9 addObserver:self selector:"_handleNowPlayingAppMaybeDidChange:" name:kMRMediaRemoteNowPlayingPlayerDidUnregister object:0];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v11 addObserver:self selector:"_handlePlayerIsPlayingDidChange:" name:v4 object:0];

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v12 addObserver:self selector:"_handleOriginIsPlayingDidChange:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v13 addObserver:self selector:"_handlePlayerPropertiesDidChange:" name:kMRMediaRemotePlayerStateDidChange object:0];

  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v14 addObserver:self selector:"_handlePlayerPictureInPictureEnabledDidChange:" name:kMRMediaRemotePlayerPictureInPictureDidChange object:0];

  double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v15 addObserver:self selector:"_handleActivePlayerDidChange:" name:kMRMediaRemoteActivePlayerDidChange object:0];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v16 addObserver:self selector:"_handleNowPlayingApplicationDidUnregisterCanBeNowPlaying:" name:v10 object:0];

  double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v17 addObserver:self selector:"_handlePlayerDidRegister:" name:v8 object:0];

  if (-[MROrigin isLocal](self->_origin, "isLocal"))
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009F684;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_sync(serialQueue, block);
  }

- (unsigned)_stateFromDataSource:(id)a3
{
  id v3 = a3;
  else {
    unsigned int v4 = 2;
  }
  unsigned int v5 = [v3 nowPlayingApplicationIsInterrupted];

  if (v5) {
    return 4;
  }
  else {
    return v4;
  }
}

- (id)_playerPathForNowPlayingClient:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activePlayerClient]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 playerPath]);

  if (!v6)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v4 playerPath]);
    if (!v6) {
      id v6 = -[MRPlayerPath copy](self->_playerPath, "copy");
    }
  }

  return v6;
}

- (MROrigin)origin
{
  return self->_origin;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setDeviceInfoData:(id)a3
{
}

- (MRMutableApplicationActivity)activity
{
  return self->_activity;
}

- (MRDMediaRemoteClient)overrideClient
{
  return self->_overrideClient;
}

- (MRDNowPlayingClient)explicitNowPlayingClient
{
  return self->_explicitNowPlayingClient;
}

- (MRDNowPlayingDataSource)nowPlayingDataSource
{
  return self->_nowPlayingDataSource;
}

- (MRDDeviceInfoDataSource)deviceInfoDataSource
{
  return self->_deviceInfoDataSource;
}

- (NSString)devicePlaybackSessionID
{
  return self->_devicePlaybackSessionID;
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (id)createNewApplicationConnectionCallback
{
  return self->_createNewApplicationConnectionCallback;
}

- (id)applicationConnectionOutgoingMessageCallback
{
  return self->_applicationConnectionOutgoingMessageCallback;
}

- (MRDNowPlayingOriginClientDelegate)delegate
{
  return (MRDNowPlayingOriginClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MRDNowPlayingClient)computedNowPlayingClient
{
  return self->_computedNowPlayingClient;
}

- (MRDNowPlayingClient)inferredNowPlayingClient
{
  return self->_inferredNowPlayingClient;
}

- (void).cxx_destruct
{
}

@end