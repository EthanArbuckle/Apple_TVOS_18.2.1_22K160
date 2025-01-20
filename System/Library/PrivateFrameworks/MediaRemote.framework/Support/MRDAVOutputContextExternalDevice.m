@interface MRDAVOutputContextExternalDevice
+ (id)_resolveReason:(id)a3 uid:(id)a4 name:(id)a5 requestID:(id)a6;
+ (void)_createPlayerAndWaitForCanBeNowPlaying:(id)a3 deviceInfo:(id)a4 completion:(id)a5;
+ (void)_createPlayerAndWaitForConnection:(id)a3 command:(id)a4 deviceInfo:(id)a5 completion:(id)a6;
+ (void)_createPlayerForClient:(id)a3 playerPath:(id)a4 deviceInfo:(id)a5 completion:(id)a6;
+ (void)_reportStreamCountAnalytics;
+ (void)_sendCommandPreview:(unsigned int)a3 options:(id)a4 playerPath:(id)a5;
+ (void)initialize;
+ (void)prewarm;
+ (void)prewarmApp:(id)a3 origin:(id)a4 deviceInfo:(id)a5;
+ (void)prewarmSoon;
- (BOOL)disconnectWhenUndiscoverable;
- (BOOL)isPaired;
- (BOOL)isUsingSystemPairing;
- (BOOL)supportsDesignatedGroupLeaderUpdates;
- (BOOL)supportsIdleDisconnection;
- (BOOL)verifyCreatedPlayerPath:(id)a3 forClient:(id)a4 error:(id *)a5;
- (BOOL)wantsNowPlayingArtworkNotifications;
- (BOOL)wantsNowPlayingNotifications;
- (BOOL)wantsOutputDeviceNotifications;
- (BOOL)wantsSystemEndpointNotifications;
- (BOOL)wantsVolumeNotifications;
- (MRAVConcreteOutputContext)outputContext;
- (MRAVOutputDevice)designatedGroupLeader;
- (MRDAVOutputContextExternalDevice)initWithOutputContext:(id)a3;
- (MRDAirPlayLeaderInfoPublisher)airplayPublisher;
- (MROrigin)origin;
- (NSError)disconnectionError;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)connectionStateCallbackQueue;
- (OS_dispatch_queue)deviceInfoCallbackQueue;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)outputDevicesRemovedCallbackQueue;
- (OS_dispatch_queue)outputDevicesUpdatedCallbackQueue;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_queue)volumeCallbackQueue;
- (OS_dispatch_queue)volumeControlCapabilitiesCallbackQueue;
- (OS_dispatch_queue)volumeMutedCallbackQueue;
- (OS_dispatch_queue)workerQueue;
- (id)_createResolvedPlayerPathFromPlayerPath:(id)a3;
- (id)_generateDeviceInfoWithDesignatedGroupLeader:(id)a3 outputContext:(id)a4;
- (id)_resolveReason:(id)a3;
- (id)connectionStateCallback;
- (id)currentClientUpdatesConfigMessage;
- (id)customOrigin;
- (id)deviceInfo;
- (id)deviceInfoCallback;
- (id)dictionaryRepresentation;
- (id)errorForCurrentState;
- (id)groupSessionToken;
- (id)hostName;
- (id)name;
- (id)outputDeviceForUID:(id)a3 error:(id *)a4;
- (id)outputDevicesRemovedCallback;
- (id)outputDevicesUpdatedCallback;
- (id)subscribedPlayerPaths;
- (id)supportedMessages;
- (id)uid;
- (id)volumeCallback;
- (id)volumeControlCapabilitiesCallback;
- (id)volumeMutedCallback;
- (int64_t)port;
- (unsigned)connectionState;
- (void)_createPlayerAndWaitForCanBeNowPlaying:(id)a3 completion:(id)a4;
- (void)_createPlayerAndWaitForConnection:(id)a3 command:(id)a4 completion:(id)a5;
- (void)_handlePlaybackQueueRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handlePlaybackSessionMigrateBeginRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handlePlaybackSessionMigrateEndRequest:(id)a3 error:(id)a4 forPlayerPath:(id)a5 completion:(id)a6;
- (void)_handlePlaybackSessionMigrateRequest:(id)a3 request:(id)a4 forPlayerPath:(id)a5 completion:(id)a6;
- (void)_handlePlaybackSessionRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handleRemoteCommand:(unsigned int)a3 withOptions:(id)a4 playerPath:(id)a5 completion:(id)a6;
- (void)_notifyActiveSessionMaybeWillBeHijackedByNativePlaybackFromOutputContextModification:(id)a3;
- (void)_onQueue_clearLocalOriginForwaderWithReason:(id)a3;
- (void)_onQueue_destroyPlayerPathsForOrigin:(id)a3;
- (void)_onQueue_forwardOriginToLocalOrigin:(id)a3;
- (void)_reevaluateDeviceInfo;
- (void)_sendMessageForPlayerPath:(id)a3 timeout:(double)a4 reason:(id)a5 factory:(id)a6 completion:(id)a7;
- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)anyDeviceInfoDidChangeNotification:(id)a3;
- (void)cleanUp;
- (void)clusterController:(id)a3 clusterTypeDidChange:(unsigned int)a4;
- (void)commitOutputDeviceToContextIfNeededWithReason:(id)a3 completion:(id)a4;
- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)destroyPlayersForClient:(id)a3 origin:(id)a4;
- (void)disconnect:(id)a3;
- (void)localClusterTypeDidChangeNotification:(id)a3;
- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)outputContextDataSourceDidAddOutputDeviceNotification:(id)a3;
- (void)outputContextDataSourceDidRemoveOutputDeviceNotification:(id)a3;
- (void)outputContextDataSourceIsMutedDidChangeNotification:(id)a3;
- (void)outputContextDataSourceOutputDeviceDidChangeNotification:(id)a3;
- (void)outputContextDataSourceVolumeControlCapabilitiesDidChangeNotification:(id)a3;
- (void)outputContextDataSourceVolumeDidChangeNotification:(id)a3;
- (void)outputContextRequestToAddLocalOutputDeviceNotification:(id)a3;
- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5;
- (void)registerForNotifications;
- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)sendMessageWithType:(unint64_t)a3 playerPath:(id)a4 timeout:(double)a5 reason:(id)a6 factory:(id)a7 completion:(id)a8;
- (void)setConnectionState:(unsigned int)a3;
- (void)setConnectionStateCallback:(id)a3;
- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4;
- (void)setConnectionStateCallbackQueue:(id)a3;
- (void)setDesignatedGroupLeader:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDeviceInfoCallback:(id)a3;
- (void)setDeviceInfoCallbackQueue:(id)a3;
- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setNotificationQueue:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setOutputContext:(id)a3;
- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)setOutputDevicesRemovedCallback:(id)a3;
- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4;
- (void)setOutputDevicesRemovedCallbackQueue:(id)a3;
- (void)setOutputDevicesUpdatedCallback:(id)a3;
- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4;
- (void)setOutputDevicesUpdatedCallbackQueue:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setVolumeCallback:(id)a3;
- (void)setVolumeCallbackQueue:(id)a3;
- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeControlCapabilitiesCallback:(id)a3;
- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeControlCapabilitiesCallbackQueue:(id)a3;
- (void)setVolumeMutedCallback:(id)a3;
- (void)setVolumeMutedCallbackQueue:(id)a3;
- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setWorkerQueue:(id)a3;
- (void)updateDesignatedGroupLeader:(id)a3;
@end

@implementation MRDAVOutputContextExternalDevice

- (MRDAVOutputContextExternalDevice)initWithOutputContext:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MRDAVOutputContextExternalDevice;
  v6 = (MRDAVOutputContextExternalDevice *)-[MRDAVOutputContextExternalDevice _init](&v27, "_init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("MRDAVOutputContextExternalDevice.serialQueue", v8);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("MRDAVOutputContextExternalDevice.workerQueue", v12);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("MRDAVOutputContextExternalDevice.notificationQueue", v16);
    notificationQueue = v6->_notificationQueue;
    v6->_notificationQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v6->_outputContext, a3);
    v6->_connectionState = 3;
    v19 = -[MROutputContextController initWithOutputContext:]( objc_alloc(&OBJC_CLASS___MROutputContextController),  "initWithOutputContext:",  v5);
    outputContextController = v6->_outputContextController;
    v6->_outputContextController = v19;

    -[MRDAVOutputContextExternalDevice registerForNotifications](v6, "registerForNotifications");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVClusterController sharedController](&OBJC_CLASS___MRAVClusterController, "sharedController"));
    [v21 registerObserver:v6];

    uint64_t v23 = MRLogCategoryConnections(v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice outputContext](v6, "outputContext"));
      *(_DWORD *)buf = 138543618;
      v29 = v6;
      __int16 v30 = 2114;
      v31 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Creating outputContextExternalDevice for outputContext %{public}@",  buf,  0x16u);
    }
  }

  return v6;
}

- (void)dealloc
{
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F8824;
  v5[3] = &unk_100399250;
  v5[4] = self;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDAVOutputContextExternalDevice;
  -[MRDAVOutputContextExternalDevice dealloc](&v4, "dealloc");
}

+ (void)initialize
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v4 = [v3 supportMultiplayerHost];

  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000F8920;
    v8[3] = &unk_10039A688;
    v8[4] = a1;
    sub_10013D6FC(&_dispatch_main_q, v8);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000F8928;
    v7[3] = &unk_1003A08C8;
    v7[4] = a1;
    id v6 =  [v5 addObserverForName:kMRMediaRemotePlayerIsPlayingDidChangeNotification object:0 queue:0 usingBlock:v7];
  }

+ (void)prewarmSoon
{
  dispatch_time_t v3 = dispatch_time(0LL, 3000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8AE0;
  block[3] = &unk_10039A688;
  block[4] = a1;
  dispatch_after(v3, v5, block);
}

+ (void)prewarm
{
  id v2 = a1;
  id v32 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID(a1);
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localOriginClient]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 defaultSupportedCommandsDataForClient:v32]);

  dispatch_queue_attr_t v7 = (void *)MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nowPlayingServer]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localOriginClient]);
  dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 defaultSupportedCommandsDataForClient:v7]);

  if (!v6 || !v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 outputContextForOutputDeviceUID:@"PREWARM-DUMMY-DEVICE"]);

    if (!v13)
    {
      [v2 prewarmSoon];
      goto LABEL_12;
    }

    v31 = v7;
    v14 = objc_alloc_init(&OBJC_CLASS___MRDeviceInfo);
    -[MRDeviceInfo setDeviceUID:](v14, "setDeviceUID:", @"PREWARM-DUMMY-DEVICE");
    -[MRDeviceInfo setName:](v14, "setName:", @"PREWARM-DUMMY-DEVICE");
    dispatch_queue_attr_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 nowPlayingServer]);
    dispatch_queue_t v17 = (void *)v13;
    id v18 = v2;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v16 localOriginClient]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceInfo]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
    -[MRDeviceInfo setIdentifier:](v14, "setIdentifier:", v21);

    id v2 = v18;
    uint64_t v22 = v17;

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v17 contextID]);
    -[MRDeviceInfo setRoutingContextID:](v14, "setRoutingContextID:", v23);

    v24 = objc_alloc(&OBJC_CLASS___MROrigin);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDeviceInfo name](v14, "name"));
    v26 = -[MROrigin initWithIdentifier:type:displayName:](v24, "initWithIdentifier:type:displayName:", 0LL, 1LL, v25);

    objc_super v27 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 nowPlayingServer]);
    [v28 registerOrigin:v26 deviceInfo:v14];

    if (!v6) {
      [v2 prewarmApp:v32 origin:v26 deviceInfo:v14];
    }
    dispatch_queue_attr_t v7 = v31;
    if (!v11)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      unsigned int v30 = [v29 prewarmPodcasts];

      if (v30) {
        [v2 prewarmApp:v31 origin:v26 deviceInfo:v14];
      }
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8E04;
  block[3] = &unk_10039A688;
  block[4] = v2;
  if (qword_1003FDF58 != -1) {
    dispatch_once(&qword_1003FDF58, block);
  }
LABEL_12:
}

+ (void)prewarmApp:(id)a3 origin:(id)a4 deviceInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);

  v14 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"prewarmApp",  v13);
  v16 = v14;
  if (v8) {
    -[NSMutableString appendFormat:](v14, "appendFormat:", @" for %@", v8);
  }
  uint64_t v17 = _MRLogForCategory(10LL, v15);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unsigned int v30 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v19 = -[MRClient initWithBundleIdentifier:](objc_alloc(&OBJC_CLASS___MRClient), "initWithBundleIdentifier:", v8);
  v20 = -[MRPlayerPath initWithOrigin:client:player:]( objc_alloc(&OBJC_CLASS___MRPlayerPath),  "initWithOrigin:client:player:",  v10,  v19,  0LL);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000F9148;
  v24[3] = &unk_1003A08F0;
  id v25 = v8;
  v26 = @"prewarmApp";
  id v27 = v13;
  id v28 = v11;
  id v21 = v11;
  id v22 = v13;
  id v23 = v8;
  [a1 _createPlayerAndWaitForCanBeNowPlaying:v20 deviceInfo:v9 completion:v24];
}

- (id)dictionaryRepresentation
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1000F959C;
  dispatch_queue_attr_t v11 = sub_1000F95AC;
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F95B4;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  msv_dispatch_sync_on_queue(serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVConcreteOutputContext uniqueIdentifier](self->_outputContext, "uniqueIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputDevice uid](self->_designatedGroupLeader, "uid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MROrigin displayName](self->_origin, "displayName"));
  signed int v7 = -[MROrigin identifier](self->_origin, "identifier");
  if (self->_originForwarder) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p id=%@ leader=%@ origin=%@-%ld originFwd=%@>",  v3,  self,  v4,  v5,  v6,  v7,  v8));

  return (NSString *)v9;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class(self);
  uint64_t v4 = MRCreateIndentedDebugDescriptionFromObject(self->_designatedGroupLeader);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = -[MROrigin identifier](self->_origin, "identifier");
  signed int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MROrigin displayName](self->_origin, "displayName"));
  uint64_t v8 = MRCreateIndentedDebugDescriptionFromObject(self->_originForwarder);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = MRCreateIndentedDebugDescriptionFromObject(self->_disconnectionError);
  dispatch_queue_attr_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = MRCreateIndentedDebugDescriptionFromObject(self->_outputContextController);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = MRCreateIndentedDebugDescriptionFromObject(self->_outputContext);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p {\n    designatedGroupLeader = %@\n    origin = %d:%@\n    originForwarder = %@\n    disconnectionError = %@    outputContextController = %@\n    outputContext = %@\n}>",  v3,  self,  v5,  v6,  v7,  v9,  v11,  v13,  v15));

  return (NSString *)v16;
}

- (id)name
{
  uint64_t v6 = 0LL;
  signed int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000F959C;
  uint64_t v10 = sub_1000F95AC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F9970;
  v5[3] = &unk_100399278;
  v5[4] = self;
  void v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)hostName
{
  return 0LL;
}

- (int64_t)port
{
  return 0LL;
}

- (BOOL)supportsIdleDisconnection
{
  return 0;
}

- (id)customOrigin
{
  uint64_t v6 = 0LL;
  signed int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000F959C;
  uint64_t v10 = sub_1000F95AC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F9AA0;
  v5[3] = &unk_100399278;
  v5[4] = self;
  void v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)deviceInfo
{
  uint64_t v6 = 0LL;
  signed int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000F959C;
  uint64_t v10 = sub_1000F95AC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F9BB4;
  v5[3] = &unk_100399278;
  v5[4] = self;
  void v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unsigned)connectionState
{
  uint64_t v6 = 0LL;
  signed int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F9CA0;
  v5[3] = &unk_100399278;
  v5[4] = self;
  void v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setConnectionState:(unsigned int)a3
{
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2020000000LL;
  char v12 = 0;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000F9DB0;
  v9[3] = &unk_10039AA08;
  v9[4] = self;
  v9[5] = v11;
  unsigned int v10 = a3;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F9DE8;
  v7[3] = &unk_10039AA08;
  unsigned int v8 = a3;
  v7[4] = self;
  void v7[5] = v11;
  dispatch_async(notificationQueue, v7);
  _Block_object_dispose(v11, 8);
}

- (id)uid
{
  uint64_t v6 = 0LL;
  signed int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000F959C;
  unsigned int v10 = sub_1000F95AC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F9F7C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  void v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)supportsDesignatedGroupLeaderUpdates
{
  return 1;
}

- (void)updateDesignatedGroupLeader:(id)a3
{
  if (self->_disconnectionError)
  {
    uint64_t v4 = MRLogCategoryConnections(self);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      signed int v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Ignoring attempt to updateDesignatedGroupLeader on previously disconnected device: %@",  (uint8_t *)&v6,  0xCu);
    }
  }

  else
  {
    -[MRDAVOutputContextExternalDevice setDesignatedGroupLeader:](self, "setDesignatedGroupLeader:", a3);
  }

- (BOOL)disconnectWhenUndiscoverable
{
  return 1;
}

- (void)setDeviceInfo:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_1000F959C;
  unsigned int v30 = sub_1000F95AC;
  id v31 = 0LL;
  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000FA314;
  v23[3] = &unk_100399CB8;
  id v25 = &v26;
  v23[4] = self;
  id v6 = v4;
  id v24 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v23);
  signed int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 routingContextID]);

  if (v7)
  {
    uint64_t v8 = (NSError *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice origin](self, "origin"));
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nowPlayingServer]);
      [v10 updateDeviceInfo:v6 origin:v8];
    }

    id v11 = self->_serialQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000FA358;
    v21[3] = &unk_100398E60;
    v21[4] = self;
    id v12 = v6;
    id v22 = v12;
    msv_dispatch_sync_on_queue(v11, v21);
    notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000FA428;
    block[3] = &unk_100399CB8;
    v20 = &v26;
    id v18 = v12;
    v19 = self;
    dispatch_async(notificationQueue, block);
  }

  else
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v27[5] routingContextID]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 routingContextID]);
    uint64_t v8 = -[NSError initWithMRError:format:]( v14,  "initWithMRError:format:",  32LL,  @"Invalid routingContextID detected. From %@ to %@",  v15,  v16);

    -[MRDAVOutputContextExternalDevice disconnect:](self, "disconnect:", v8);
  }

  _Block_object_dispose(&v26, 8);
}

- (void)setOrigin:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  p_origin = &self->_origin;
  if (self->_origin)
  {
    -[MRDAVOutputContextExternalDevice _onQueue_destroyPlayerPathsForOrigin:]( self,  "_onQueue_destroyPlayerPathsForOrigin:");
    -[MRDAVOutputContextExternalDevice _onQueue_clearLocalOriginForwaderWithReason:]( self,  "_onQueue_clearLocalOriginForwaderWithReason:",  @"Clear Origin");
    signed int v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingServer]);
    [v8 unregisterOrigin:*p_origin];

    airplayPublisher = self->_airplayPublisher;
    self->_airplayPublisher = 0LL;
  }

  objc_storeStrong((id *)&self->_origin, a3);
  if (v5)
  {
    objc_initWeak(location, self);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000FA988;
    v42[3] = &unk_1003A0918;
    objc_copyWeak(&v43, location);
    v42[4] = self;
    MRMediaRemoteSetCommandHandler(v5, v42);
    unsigned int v10 = *p_origin;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1000FAAA8;
    v40[3] = &unk_1003A0940;
    objc_copyWeak(&v41, location);
    v40[4] = self;
    MRMediaRemotePlaybackQueueDataSourceSetRequestCallback(v10, v40);
    id v11 = *p_origin;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000FAB58;
    v38[3] = &unk_1003A0940;
    objc_copyWeak(&v39, location);
    v38[4] = self;
    MRMediaRemotePlaybackSessionSetRequestCallbackForOrigin(v11, v38);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 originClientForOrigin:*p_origin]);

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000FAC50;
    v36[3] = &unk_1003A0968;
    objc_copyWeak(&v37, location);
    v36[4] = self;
    [v13 setPlaybackSessionMigrateRequestCallback:v36];
    uint64_t v14 = *p_origin;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000FAD2C;
    v34[3] = &unk_1003A0990;
    objc_copyWeak(&v35, location);
    v34[4] = self;
    MRMediaRemotePlaybackSessionSetMigrateBeginCallbackForOrigin(v14, v34);
    uint64_t v15 = *p_origin;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000FAE34;
    v32[3] = &unk_1003A09B8;
    objc_copyWeak(&v33, location);
    v32[4] = self;
    MRMediaRemotePlaybackSessionSetMigrateEndCallbackForOrigin(v15, v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 nowPlayingServer]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 originClientForOrigin:v5]);

    if (_os_feature_enabled_impl("MediaRemote", "ApplicationConnection"))
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_1000FAF44;
      v30[3] = &unk_1003A0A08;
      objc_copyWeak(&v31, location);
      v30[4] = self;
      objc_msgSend(v18, "registerCreateNewApplicationConnectionCallback:", v30, &v37, &v39, &v41, &v43);
      objc_destroyWeak(&v31);
    }

    else
    {
      objc_msgSend(v18, "registerCreateNewApplicationConnectionCallback:", &stru_1003A0A28, &v37, &v39, &v41, &v43);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
    unsigned int v20 = [v19 supportAirPlayLeaderInfoSync];

    if (v20)
    {
      id v21 = objc_alloc(&OBJC_CLASS___MRDAirPlayLeaderInfoPublisher);
      id v22 = *p_origin;
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice outputContext](self, "outputContext"));
      id v24 = -[MRDAirPlayLeaderInfoPublisher initWithOrigin:outputContext:]( v21,  "initWithOrigin:outputContext:",  v22,  v23);
      id v25 = self->_airplayPublisher;
      self->_airplayPublisher = v24;
    }

    if (-[MRAVOutputDevice isLocalDevice](self->_designatedGroupLeader, "isLocalDevice")) {
      -[MRDAVOutputContextExternalDevice _onQueue_forwardOriginToLocalOrigin:]( self,  "_onQueue_forwardOriginToLocalOrigin:",  *p_origin);
    }

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(v26);

    objc_destroyWeak(v27);
    objc_destroyWeak(v28);
    objc_destroyWeak(v29);
    objc_destroyWeak(location);
  }
}

- (MRAVOutputDevice)designatedGroupLeader
{
  uint64_t v6 = 0LL;
  signed int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000F959C;
  unsigned int v10 = sub_1000F95AC;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000FB484;
  v5[3] = &unk_100399278;
  v5[4] = self;
  void v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRAVOutputDevice *)v3;
}

- (void)setDesignatedGroupLeader:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  unsigned int v20 = sub_1000F959C;
  id v21 = sub_1000F95AC;
  serialQueue = self->_serialQueue;
  id v22 = 0LL;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_1000FB694;
  id v12 = &unk_10039EC18;
  uint64_t v15 = &v23;
  id v6 = v4;
  id v13 = v6;
  uint64_t v14 = self;
  v16 = &v17;
  msv_dispatch_sync_on_queue(serialQueue, &v9);
  if (*((_BYTE *)v24 + 24) && [v6 isLocalDevice])
  {
    uint64_t v27 = MRExternalDeviceConnectionReasonUserInfoKey;
    uint64_t v28 = @"Automatic NativeEndpoint Connection";
    signed int v7 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    -[MRDAVOutputContextExternalDevice connectWithOptions:userInfo:](self, "connectWithOptions:userInfo:", 0LL, v7);
LABEL_6:

    goto LABEL_7;
  }

  if (!v6)
  {
    uint64_t v8 = objc_alloc(&OBJC_CLASS___NSError);
    signed int v7 = -[NSError initWithMRError:format:]( v8,  "initWithMRError:format:",  32LL,  @"OutputContextExternalDevice does not have a designatedGroupLeader. (PreviousGroupLeader=%@)",  v18[5],  v9,  v10,  v11,  v12);
    -[MRDAVOutputContextExternalDevice disconnect:](self, "disconnect:", v7);
    goto LABEL_6;
  }

- (void)_handleRemoteCommand:(unsigned int)a3 withOptions:(id)a4 playerPath:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  v49 = sub_1000F959C;
  v50 = sub_1000F95AC;
  unsigned int v30 = v9;
  id v51 = [v9 copy];
  uint64_t v12 = objc_claimAutoreleasedReturnValue([(id)v47[5] objectForKeyedSubscript:kMRMediaRemoteOptionCommandID]);
  id v13 = (void *)v12;
  uint64_t v14 = @"handleRemoteCommand";
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  uint64_t v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 client]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
  id v18 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
  unsigned int v19 = [v17 isEqualToString:v18];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000FBC18;
  v40[3] = &unk_1003A0A78;
  id v43 = &v46;
  v40[4] = self;
  id v20 = v10;
  id v41 = v20;
  unsigned int v44 = a3;
  char v45 = v19;
  id v21 = v11;
  id v42 = v21;
  id v22 = objc_retainBlock(v40);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000FC11C;
  v35[3] = &unk_10039D7B8;
  unsigned int v39 = a3;
  id v23 = v20;
  id v36 = v23;
  id v24 = v15;
  id v37 = v24;
  uint64_t v25 = v22;
  id v38 = v25;
  char v26 = objc_retainBlock(v35);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 routingServer]);
  unsigned int v29 = [v28 airplayActive];

  if (a3 == 132 || (v19 & v29) == 1 && a3 != 122 && a3 != 133)
  {
    ((void (*)(void *))v26[2])(v26);
  }

  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000FC384;
    v32[3] = &unk_10039C8D0;
    id v33 = v21;
    v34 = v26;
    -[MRDAVOutputContextExternalDevice commitOutputDeviceToContextIfNeededWithReason:completion:]( self,  "commitOutputDeviceToContextIfNeededWithReason:completion:",  v24,  v32);
  }

  _Block_object_dispose(&v46, 8);
}

+ (void)_sendCommandPreview:(unsigned int)a3 options:(id)a4 playerPath:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nowPlayingServer]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localOriginClient]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 overrideClient]);

  if (v12)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    MRAddPlayerPathToUserInfo(v13, v8);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v14,  kMRMediaRemoteOptionCommandType);

    uint64_t v15 = kMRMediaRemoteOptionCommandID;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMRMediaRemoteOptionCommandID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, v15);

    uint64_t v17 = kMRMediaRemoteOptionSenderID;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMRMediaRemoteOptionSenderID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v18, v17);

    uint64_t v19 = kMRMediaRemoteOptionRemoteControlInterfaceIdentifier;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMRMediaRemoteOptionRemoteControlInterfaceIdentifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v20, v19);

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v22 = _MRMediaRemoteWillSendCommandToPlayerNotification;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000FC5F8;
    v23[3] = &unk_1003995A8;
    id v24 = v12;
    [v21 postClientNotificationNamed:v22 userInfo:v13 predicate:v23];
  }
}

- (id)_createResolvedPlayerPathFromPlayerPath:(id)a3
{
  id v3 = (MRPlayerPath *)a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v5 = [v4 supportMultiplayerHost];

  uint64_t v6 = v3;
  if ((v5 & 1) == 0)
  {
    id v7 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](v3, "client"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath player](v3, "player"));
    uint64_t v6 = -[MRPlayerPath initWithOrigin:client:player:](v7, "initWithOrigin:client:player:", v8, v9, v10);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](v3, "client"));

  if (!v11)
  {
    uint64_t v12 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath origin](v6, "origin"));
    uint64_t v14 = objc_alloc(&OBJC_CLASS___MRClient);
    uint64_t v15 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID(v14);
    v16 = -[MRClient initWithBundleIdentifier:](v14, "initWithBundleIdentifier:", v15);
    uint64_t v17 = -[MRPlayerPath initWithOrigin:client:player:](v12, "initWithOrigin:client:player:", v13, v16, 0LL);

    uint64_t v6 = v17;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v19 = [v18 homepodDemoMode];

  if (v19)
  {
    id v20 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](v6, "client"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath player](v6, "player"));
    id v24 = -[MRPlayerPath initWithOrigin:client:player:](v20, "initWithOrigin:client:player:", v21, v22, v23);

    uint64_t v6 = v24;
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  char v26 = (void *)objc_claimAutoreleasedReturnValue([v25 deviceInfo]);

  LOBYTE(v25) = [v26 isAirPlayActive];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](v3, "client"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 bundleIdentifier]);
  unsigned int v29 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
  unsigned __int8 v30 = [v28 isEqualToString:v29];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000FC8EC;
  v34[3] = &unk_1003A0AC0;
  char v35 = (char)v25;
  unsigned __int8 v36 = v30;
  if (sub_1000FC8EC((uint64_t)v34))
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
    uint64_t v32 = objc_claimAutoreleasedReturnValue(-[MRPlayerPath playerPathByRedirectingToOrigin:](v6, "playerPathByRedirectingToOrigin:", v31));

    uint64_t v6 = (MRPlayerPath *)v32;
  }

  return v6;
}

- (void)_createPlayerAndWaitForConnection:(id)a3 command:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_opt_class(self);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice deviceInfo](self, "deviceInfo"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000FCA80;
  v14[3] = &unk_1003A0B10;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v11 _createPlayerAndWaitForConnection:v10 command:v9 deviceInfo:v12 completion:v14];
}

+ (void)_createPlayerAndWaitForConnection:(id)a3 command:(id)a4 deviceInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v58 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);

  v16 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"createPlayerAndWaitForConnection",  v15);
  id v18 = v16;
  if (v10) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @" for %@", v10);
  }
  uint64_t v19 = _MRLogForCategory(10LL, v17);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v78 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v22 = _MRLogForCategory(2LL, v21);
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = (char *)[v15 hash];
  if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v25 = (os_signpost_id_t)v24;
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "createPlayerAndWaitForConnection",  "",  buf,  2u);
    }
  }

  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_1000FD198;
  v70[3] = &unk_1003A0B38;
  id v26 = v15;
  id v71 = v26;
  v72 = @"createPlayerAndWaitForConnection";
  id v57 = v13;
  id v73 = v57;
  id v56 = v12;
  id v74 = v56;
  uint64_t v27 = objc_retainBlock(v70);
  id v28 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  id v55 = a1;
  unsigned int v29 = (void *)objc_opt_class(a1);
  unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue([v11 WHAIdentifier]);
  v59 = v11;
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( [v29 _resolveReason:@"createPlayerAndWaitForConnection" uid:v30 name:v31 requestID:v26]);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_1000FD698;
  v68[3] = &unk_100399530;
  id v33 = v27;
  id v69 = v33;
  id v34 = [v28 initWithTimeout:v32 reason:v68 handler:8.0];

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_1000FD6AC;
  v65[3] = &unk_10039C808;
  id v35 = v34;
  id v66 = v35;
  unsigned __int8 v36 = v33;
  id v67 = v36;
  id v37 = objc_retainBlock(v65);
  id v38 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v38 nowPlayingServer]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 queryExistingPlayerPath:v10]);

  id v41 = (void *)objc_claimAutoreleasedReturnValue([v10 client]);
  id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 bundleIdentifier]);
  id v43 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
  unsigned int v44 = [v42 isEqualToString:v43];

  if (v44)
  {
    ((void (*)(void *, id, void))v37[2])(v37, v10, 0LL);
    char v45 = v58;
    goto LABEL_19;
  }

  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v40 playerClient]);

  char v45 = v58;
  if (v46)
  {
    v47 = (NSError *)objc_claimAutoreleasedReturnValue([v40 playerClient]);
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSError playerPath](v47, "playerPath"));
    ((void (*)(void *, void *, void))v37[2])(v37, v48, 0LL);

LABEL_12:
    goto LABEL_19;
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue([v10 client]);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v49 bundleIdentifier]);

  if (!v50)
  {
    v47 = -[NSError initWithMRError:format:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:format:",  35LL,  @"Could not find application in playerPath %@",  v10);
    ((void (*)(void *, void, NSError *))v37[2])(v37, 0LL, v47);
    goto LABEL_12;
  }

  uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v58, v51) & 1) != 0)
  {
    uint64_t v75 = kMRMediaRemoteOptionCommandType;
    id v76 = v58;
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v76,  &v75,  1LL));
  }

  else
  {
    v52 = 0LL;
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue([v10 client]);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v53 bundleIdentifier]);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_1000FD70C;
  v60[3] = &unk_1003A0B60;
  v63 = v37;
  id v61 = v10;
  id v64 = v55;
  id v62 = v59;
  sub_10013B9F8(v54, 0LL, v52, v60, 7.0);

LABEL_19:
}

- (void)_createPlayerAndWaitForCanBeNowPlaying:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_opt_class(self);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice deviceInfo](self, "deviceInfo"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000FD898;
  void v11[3] = &unk_1003A0B10;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 _createPlayerAndWaitForCanBeNowPlaying:v7 deviceInfo:v9 completion:v11];
}

+ (void)_createPlayerAndWaitForCanBeNowPlaying:(id)a3 deviceInfo:(id)a4 completion:(id)a5
{
  id v39 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);

  id v12 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"createPlayerAndWaitForCanBeNowPlaying",  v11);
  uint64_t v14 = v12;
  if (v39) {
    -[NSMutableString appendFormat:](v12, "appendFormat:", @" for %@", v39);
  }
  uint64_t v15 = _MRLogForCategory(10LL, v13);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v18 = _MRLogForCategory(2LL, v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = (char *)[v11 hash];
  if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v20,  "createPlayerAndWaitForCanBeNowPlaying",  "",  (uint8_t *)&buf,  2u);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v57 = 0x3032000000LL;
  id v58 = sub_1000F959C;
  v59 = sub_1000F95AC;
  id v60 = 0LL;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1000FDE0C;
  v50[3] = &unk_1003A0B88;
  id v21 = v11;
  id v51 = v21;
  v52 = @"createPlayerAndWaitForCanBeNowPlaying";
  id v22 = v9;
  id v53 = v22;
  id v37 = v8;
  id v54 = v37;
  p___int128 buf = &buf;
  id v23 = objc_retainBlock(v50);
  id v24 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  os_signpost_id_t v25 = (void *)objc_opt_class(a1);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 WHAIdentifier]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue( [v25 _resolveReason:@"createPlayerAndWaitForCanBeNowPlaying" uid:v26 name:v27 requestID:v21]);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1000FE2E4;
  v48[3] = &unk_100399530;
  unsigned int v29 = v23;
  id v49 = v29;
  id v30 = [v24 initWithTimeout:v28 reason:v48 handler:8.0];

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000FE2FC;
  v45[3] = &unk_1003A0BB0;
  id v31 = v30;
  id v46 = v31;
  uint64_t v32 = v29;
  id v47 = v32;
  id v33 = objc_retainBlock(v45);
  id v34 = (void *)objc_opt_class(a1);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000FE378;
  v40[3] = &unk_1003A0C00;
  unsigned int v44 = &buf;
  id v35 = v33;
  id v43 = v35;
  id v41 = @"createPlayerAndWaitForCanBeNowPlaying";
  id v36 = v21;
  id v42 = v36;
  [v34 _createPlayerAndWaitForConnection:v39 command:0 deviceInfo:v7 completion:v40];

  _Block_object_dispose(&buf, 8);
}

+ (void)_createPlayerForClient:(id)a3 playerPath:(id)a4 deviceInfo:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);

  v16 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"createPlayer",  v15);
  uint64_t v18 = v16;
  if (v9) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @" for %@", v9);
  }
  uint64_t v19 = _MRLogForCategory(10LL, v17);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v43 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v22 = _MRLogForCategory(2LL, v21);
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = (char *)[v15 hash];
  if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v25 = (os_signpost_id_t)v24;
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "CreatePlayer",  "",  buf,  2u);
    }
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000FE990;
  v37[3] = &unk_1003A0B38;
  id v38 = v15;
  id v39 = v9;
  id v40 = v13;
  id v41 = v10;
  id v26 = v10;
  id v27 = v13;
  id v28 = v9;
  id v29 = v15;
  id v30 = objc_retainBlock(v37);
  [v12 takeAssertion:1 forReason:@"CreatePlayer" duration:30.0];
  uint64_t v31 = MRCreateXPCMessage(0x40000000000000BLL);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  MRAddDeviceInfoToXPCMessage(v32, v11);

  MRAddPlayerPathToXPCMessage(v32, v28);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v12 connection]);

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000FEDF4;
  v35[3] = &unk_1003A0C28;
  id v36 = v30;
  id v34 = v30;
  [v33 sendMessage:v32 queue:&_dispatch_main_q reply:v35];
}

- (void)sendMessageWithType:(unint64_t)a3 playerPath:(id)a4 timeout:(double)a5 reason:(id)a6 factory:(id)a7 completion:(id)a8
{
  id v14 = a7;
  id v18 = a8;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000FEF44;
  v19[3] = &unk_1003A0C50;
  id v20 = v14;
  unint64_t v21 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000FEFC0;
  v17[3] = &unk_1003A0C28;
  id v15 = v18;
  id v16 = v14;
  -[MRDAVOutputContextExternalDevice _sendMessageForPlayerPath:timeout:reason:factory:completion:]( self,  "_sendMessageForPlayerPath:timeout:reason:factory:completion:",  a4,  a6,  v19,  v17,  a5);
}

- (void)_sendMessageForPlayerPath:(id)a3 timeout:(double)a4 reason:(id)a5 factory:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000FF1F0;
  v31[3] = &unk_100399530;
  id v17 = v14;
  id v32 = v17;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000FF204;
  v28[3] = &unk_1003A0C78;
  id v29 = [v16 initWithTimeout:v12 reason:v31 handler:a4];
  id v30 = v17;
  id v18 = v17;
  id v19 = v29;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000FF264;
  v23[3] = &unk_1003A0CA0;
  id v24 = v12;
  os_signpost_id_t v25 = self;
  id v26 = v13;
  id v27 = objc_retainBlock(v28);
  id v20 = v27;
  id v21 = v12;
  id v22 = v13;
  -[MRDAVOutputContextExternalDevice _createPlayerAndWaitForCanBeNowPlaying:completion:]( self,  "_createPlayerAndWaitForCanBeNowPlaying:completion:",  v15,  v23);
}

- (void)_handlePlaybackQueueRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000FF5B4;
  v29[3] = &unk_10039DB80;
  id v10 = a5;
  id v30 = v10;
  id v11 = objc_retainBlock(v29);
  id v12 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVOutputContextExternalDevice _resolveReason:]( self,  "_resolveReason:",  @"_handlePlaybackQueueRequest"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000FF5C0;
  v27[3] = &unk_100399530;
  id v14 = v11;
  id v28 = v14;
  id v15 = [v12 initWithTimeout:v13 reason:v27 handler:7.0];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 client]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "clientForPID:", objc_msgSend(v17, "processIdentifier")));

  if (v18)
  {
    uint64_t v19 = MRCreateXPCMessage(0x700000000000002LL);
    id v20 = (NSError *)objc_claimAutoreleasedReturnValue(v19);
    MRAddPlayerPathToXPCMessage(v20, v9);
    MRAddPlaybackQueueRequestToXPCMessage(v20, v8);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    [v18 takeAssertion:2 forReason:v21 duration:30.0];

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 connection]);
    workerQueue = self->_workerQueue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000FF5D4;
    v24[3] = &unk_1003A0C78;
    id v25 = v15;
    id v26 = v14;
    [v22 sendMessage:v20 queue:workerQueue reply:v24];

LABEL_5:
    goto LABEL_6;
  }

  if ([v15 disarm])
  {
    id v20 = -[NSError initWithMRError:format:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:format:",  4LL,  @"Could not find xpcClient for playerPath %@",  v9);
    ((void (*)(void *, void, NSError *))v14[2])(v14, 0LL, v20);
    goto LABEL_5;
  }

- (void)_handlePlaybackSessionRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVOutputContextExternalDevice _resolveReason:]( self,  "_resolveReason:",  @"_handlePlaybackSessionRequest"));
  id v16 = v10;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000FF774;
  v17[3] = &unk_1003A0CC8;
  id v18 = v8;
  id v19 = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000FF7A4;
  v15[3] = &unk_1003A0CF0;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[MRDAVOutputContextExternalDevice sendMessageWithType:playerPath:timeout:reason:factory:completion:]( self,  "sendMessageWithType:playerPath:timeout:reason:factory:completion:",  0x20000000000002FLL,  v13,  v11,  v17,  v15,  7.0);
}

- (void)_handlePlaybackSessionMigrateRequest:(id)a3 request:(id)a4 forPlayerPath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000FF918;
  v17[3] = &unk_1003A0D40;
  id v21 = v10;
  id v22 = a6;
  id v18 = v11;
  id v19 = v12;
  id v20 = self;
  id v13 = v10;
  id v14 = v12;
  id v15 = v11;
  id v16 = v22;
  -[MRDAVOutputContextExternalDevice commitOutputDeviceToContextIfNeededWithReason:completion:]( self,  "commitOutputDeviceToContextIfNeededWithReason:completion:",  @"_handlePlaybackSessionMigrateRequest",  v17);
}

- (void)_handlePlaybackSessionMigrateBeginRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVOutputContextExternalDevice _resolveReason:]( self,  "_resolveReason:",  @"_handlePlaybackSessionMigrateBeginRequest"));
  id v15 = v9;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000FFD34;
  v16[3] = &unk_1003A0D68;
  id v17 = v8;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000FFD88;
  v14[3] = &unk_1003A0CF0;
  id v12 = v9;
  id v13 = v8;
  -[MRDAVOutputContextExternalDevice sendMessageWithType:playerPath:timeout:reason:factory:completion:]( self,  "sendMessageWithType:playerPath:timeout:reason:factory:completion:",  0x400000000000008LL,  v10,  v11,  v16,  v14,  7.0);
}

- (void)_handlePlaybackSessionMigrateEndRequest:(id)a3 error:(id)a4 forPlayerPath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVOutputContextExternalDevice _resolveReason:]( self,  "_resolveReason:",  @"_handlePlaybackSessionMigrateEndRequest"));
  id v19 = v12;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000FFECC;
  v20[3] = &unk_1003A0CC8;
  id v21 = v10;
  id v22 = v11;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000FFF20;
  v18[3] = &unk_1003A0CF0;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  -[MRDAVOutputContextExternalDevice sendMessageWithType:playerPath:timeout:reason:factory:completion:]( self,  "sendMessageWithType:playerPath:timeout:reason:factory:completion:",  0x400000000000009LL,  v13,  v14,  v20,  v18,  7.0);
}

- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FFFFC;
  block[3] = &unk_10039D198;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010010C;
  block[3] = &unk_10039D198;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010021C;
  block[3] = &unk_10039D198;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010032C;
  block[3] = &unk_10039D198;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010043C;
  block[3] = &unk_10039D198;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010054C;
  block[3] = &unk_10039D198;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010065C;
  block[3] = &unk_10039D198;
  id v13 = v7;
  id v14 = v6;
  void block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  outputContextController = self->_outputContextController;
  id v17 = 0LL;
  id v10 = (dispatch_queue_s *)a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100100784;
  v13[3] = &unk_100399830;
  unsigned int v16 = -[MROutputContextController volumeControlCapabilitiesForOutputDeviceUID:error:]( outputContextController,  "volumeControlCapabilitiesForOutputDeviceUID:error:",  a3,  &v17);
  id v14 = v17;
  id v15 = v8;
  id v11 = v14;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  outputContextController = self->_outputContextController;
  id v18 = 0LL;
  id v10 = (dispatch_queue_s *)a4;
  -[MROutputContextController volumeForOutputDeviceUID:error:]( outputContextController,  "volumeForOutputDeviceUID:error:",  a3,  &v18);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10010087C;
  v14[3] = &unk_100399830;
  int v17 = v11;
  id v15 = v18;
  id v16 = v8;
  id v12 = v15;
  id v13 = v8;
  dispatch_async(v10, v14);
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v38 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice designatedGroupLeader](self, "designatedGroupLeader"));
  int v17 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v18 = objc_opt_class(self);
  id v40 = v16;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 debugName]);
  id v20 = -[NSString initWithFormat:](v17, "initWithFormat:", @"%@:%p-%@>", v18, self, v19);

  id v21 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 requestID]);
  id v23 = -[NSMutableString initWithFormat:]( v21,  "initWithFormat:",  @"%@<%@>",  @"OutputContextExtenalDevice.setOutputDeviceVolume",  v22);

  if (v20) {
    -[NSMutableString appendFormat:](v23, "appendFormat:", @" for %@", v20);
  }
  uint64_t v25 = _MRLogForCategory(10LL, v24);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v58 = v23;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100100C48;
  v49[3] = &unk_1003A0D90;
  float v56 = a3;
  id v39 = v20;
  v50 = v39;
  id v51 = @"OutputContextExtenalDevice.setOutputDeviceVolume";
  id v27 = v12;
  id v52 = v27;
  id v28 = v15;
  id v53 = v28;
  id v29 = v13;
  id v54 = v29;
  id v30 = v14;
  id v55 = v30;
  uint64_t v31 = objc_retainBlock(v49);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100101098;
  v44[3] = &unk_10039DE60;
  v44[4] = self;
  float v48 = a3;
  id v32 = v38;
  id v45 = v32;
  id v33 = v27;
  id v46 = v33;
  id v34 = v31;
  id v47 = v34;
  id v35 = objc_retainBlock(v44);
  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVConcreteOutputContext outputDeviceUIDs](self->_outputContext, "outputDeviceUIDs"));
  id v37 = [v36 count];

  if (v37 || !-[MRAVOutputDevice isLocalDevice](self->_designatedGroupLeader, "isLocalDevice"))
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1001010F4;
    v41[3] = &unk_10039C8D0;
    id v42 = v34;
    id v43 = v35;
    -[MRDAVOutputContextExternalDevice commitOutputDeviceToContextIfNeededWithReason:completion:]( self,  "commitOutputDeviceToContextIfNeededWithReason:completion:",  @"setOutputDeviceVolume",  v41);
  }

  else
  {
    ((void (*)(void *))v35[2])(v35);
  }
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v41 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice designatedGroupLeader](self, "designatedGroupLeader"));
  int v17 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v18 = objc_opt_class(self);
  id v43 = v16;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 debugName]);
  id v20 = -[NSString initWithFormat:](v17, "initWithFormat:", @"%@:%p-%@>", v18, self, v19);

  id v21 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 requestID]);
  id v23 = -[NSMutableString initWithFormat:]( v21,  "initWithFormat:",  @"%@<%@>",  @"OutputContextExtenalDevice.adjustOutputDeviceVolume",  v22);

  if (v20) {
    -[NSMutableString appendFormat:](v23, "appendFormat:", @" for %@", v20);
  }
  uint64_t v25 = _MRLogForCategory(10LL, v24);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v61 = v23;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100101514;
  v52[3] = &unk_10039CBD0;
  int64_t v59 = a3;
  id v42 = v20;
  id v53 = v42;
  id v54 = @"OutputContextExtenalDevice.adjustOutputDeviceVolume";
  id v27 = v12;
  id v55 = v27;
  id v28 = v15;
  id v56 = v28;
  id v29 = v13;
  id v57 = v29;
  id v30 = v14;
  id v58 = v30;
  uint64_t v31 = objc_retainBlock(v52);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10010195C;
  v47[3] = &unk_1003A0DB8;
  v47[4] = self;
  int64_t v51 = a3;
  id v32 = v41;
  id v48 = v32;
  id v33 = v27;
  id v49 = v33;
  id v34 = v31;
  id v50 = v34;
  id v35 = objc_retainBlock(v47);
  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVConcreteOutputContext outputDeviceUIDs](self->_outputContext, "outputDeviceUIDs"));
  id v37 = [v36 count];

  if (v37 || !-[MRAVOutputDevice isLocalDevice](self->_designatedGroupLeader, "isLocalDevice"))
  {
    id v38 = objc_alloc(&OBJC_CLASS___NSString);
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v33 requestID]);
    id v40 = -[NSString initWithFormat:]( v38,  "initWithFormat:",  @"%@<%@>",  @"OutputContextExtenalDevice.adjustOutputDeviceVolume",  v39);

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1001019B8;
    v44[3] = &unk_10039C8D0;
    id v45 = v34;
    id v46 = v35;
    -[MRDAVOutputContextExternalDevice commitOutputDeviceToContextIfNeededWithReason:completion:]( self,  "commitOutputDeviceToContextIfNeededWithReason:completion:",  v40,  v44);
  }

  else
  {
    ((void (*)(void *))v35[2])(v35);
  }
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v41 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice designatedGroupLeader](self, "designatedGroupLeader"));
  int v17 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v18 = objc_opt_class(self);
  id v43 = v16;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 debugName]);
  id v20 = -[NSString initWithFormat:](v17, "initWithFormat:", @"%@:%p-%@>", v18, self, v19);

  id v21 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 requestID]);
  id v23 = -[NSMutableString initWithFormat:]( v21,  "initWithFormat:",  @"%@<%@>",  @"OutputContextExtenalDevice.muteOutputDeviceVolume",  v22);

  if (v20) {
    -[NSMutableString appendFormat:](v23, "appendFormat:", @" for %@", v20);
  }
  uint64_t v25 = _MRLogForCategory(10LL, v24);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v61 = v23;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100101DD8;
  v52[3] = &unk_1003A0DE0;
  BOOL v59 = a3;
  id v42 = v20;
  id v53 = v42;
  id v54 = @"OutputContextExtenalDevice.muteOutputDeviceVolume";
  id v27 = v12;
  id v55 = v27;
  id v28 = v15;
  id v56 = v28;
  id v29 = v13;
  id v57 = v29;
  id v30 = v14;
  id v58 = v30;
  uint64_t v31 = objc_retainBlock(v52);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100102228;
  v47[3] = &unk_1003A0E08;
  v47[4] = self;
  BOOL v51 = a3;
  id v32 = v41;
  id v48 = v32;
  id v33 = v27;
  id v49 = v33;
  id v34 = v31;
  id v50 = v34;
  id v35 = objc_retainBlock(v47);
  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVConcreteOutputContext outputDeviceUIDs](self->_outputContext, "outputDeviceUIDs"));
  id v37 = [v36 count];

  if (v37 || !-[MRAVOutputDevice isLocalDevice](self->_designatedGroupLeader, "isLocalDevice"))
  {
    id v38 = objc_alloc(&OBJC_CLASS___NSString);
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v33 requestID]);
    id v40 = -[NSString initWithFormat:]( v38,  "initWithFormat:",  @"%@<%@>",  @"OutputContextExtenalDevice.muteOutputDeviceVolume",  v39);

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_100102284;
    v44[3] = &unk_10039C8D0;
    id v45 = v34;
    id v46 = v35;
    -[MRDAVOutputContextExternalDevice commitOutputDeviceToContextIfNeededWithReason:completion:]( self,  "commitOutputDeviceToContextIfNeededWithReason:completion:",  v40,  v44);
  }

  else
  {
    ((void (*)(void *))v35[2])(v35);
  }
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10010236C;
  v10[3] = &unk_100398F18;
  int v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  -[MRDAVOutputContextExternalDevice commitOutputDeviceToContextIfNeededWithReason:completion:]( v11,  "commitOutputDeviceToContextIfNeededWithReason:completion:",  @"modifyOutputContext",  v10);
}

- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100102428;
  block[3] = &unk_100399EC0;
  id v8 = a4;
  id v6 = v8;
  dispatch_sync((dispatch_queue_t)a5, block);
}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  id v40 = a5;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v41 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice deviceInfo](self, "deviceInfo"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:MRExternalDeviceConnectionReasonUserInfoKey]);

  int v11 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v12 = objc_opt_class(self);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDeviceInfo WHAIdentifier](self->_deviceInfo, "WHAIdentifier"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDeviceInfo name](self->_deviceInfo, "name"));
  id v15 = -[NSString initWithFormat:](v11, "initWithFormat:", @"%@:%p-%@:%@", v12, self, v13, v14);

  id v16 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"OutputContextExternalDevice.connectWithOptions",  v9);
  uint64_t v18 = v16;
  if (v15) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @" for %@", v15);
  }
  if (v10) {
    -[NSMutableString appendFormat:](v18, "appendFormat:", @" because %@", v10);
  }
  id v42 = (void *)v10;
  uint64_t v19 = _MRLogForCategory(10LL, v17);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v57 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  qos_class_t v21 = qos_class_self();
  id v22 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"com.apple.mediaremote.outputContextExternalDevice.connect.%@", v9);
  id v23 = -[NSString UTF8String](v22, "UTF8String");
  dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);
  dispatch_queue_attr_t v26 = dispatch_queue_attr_make_with_qos_class(v25, v21, 0);
  id v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v26);
  id v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[MRDAVOutputContextExternalDevice connectionStateCallbackQueue]( self,  "connectionStateCallbackQueue"));
  dispatch_queue_t v29 = dispatch_queue_create_with_target_V2(v23, v27, v28);

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100102820;
  v48[3] = &unk_1003A0E30;
  qos_class_t v55 = v21;
  id v49 = @"OutputContextExternalDevice.connectWithOptions";
  id v30 = v9;
  id v50 = v30;
  BOOL v51 = v15;
  dispatch_queue_t v53 = v29;
  id v54 = v40;
  id v52 = v8;
  uint64_t v31 = v29;
  id v32 = v40;
  id v33 = v8;
  id v34 = v15;
  id v35 = objc_retainBlock(v48);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100102BA0;
  block[3] = &unk_10039C830;
  void block[4] = self;
  unsigned int v44 = @"OutputContextExternalDevice.connectWithOptions";
  id v45 = v30;
  id v46 = v41;
  id v47 = v35;
  id v37 = v41;
  id v38 = v30;
  id v39 = v35;
  dispatch_sync(serialQueue, block);
}

- (id)_generateDeviceInfoWithDesignatedGroupLeader:(id)a3 outputContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingServer]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localOriginClient]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceInfo]);

  if ([v5 isLocalDevice])
  {
    int v11 = v10;
  }

  else
  {
    int v11 = -[MRDeviceInfo initWithOutputDevice:](objc_alloc(&OBJC_CLASS___MRDeviceInfo), "initWithOutputDevice:", v5);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 outputDevices]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 groupID]);
    if (v14)
    {
      -[MRDeviceInfo setGroupUID:](v11, "setGroupUID:", v14);
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 groupID]);
      -[MRDeviceInfo setGroupUID:](v11, "setGroupUID:", v15);
    }

    -[MRDeviceInfo setAirPlayActive:](v11, "setAirPlayActive:", 1LL);
    -[MRDeviceInfo setSupportsOutputContextSync:]( v11,  "setSupportsOutputContextSync:",  [v10 supportsOutputContextSync]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    -[MRDeviceInfo setIdentifier:](v11, "setIdentifier:", v16);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 systemMediaApplication]);
    -[MRDeviceInfo setSystemMediaApplication:](v11, "setSystemMediaApplication:", v17);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 systemPodcastApplication]);
    -[MRDeviceInfo setSystemPodcastApplication:](v11, "setSystemPodcastApplication:", v18);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 systemBooksApplication]);
    -[MRDeviceInfo setSystemBooksApplication:](v11, "setSystemBooksApplication:", v19);

    -[MRDeviceInfo setSupportsSharedQueue:](v11, "setSupportsSharedQueue:", [v10 supportsSharedQueue]);
    -[MRDeviceInfo setSharedQueueVersion:](v11, "setSharedQueueVersion:", [v10 sharedQueueVersion]);
    -[MRDeviceInfo setSupportsMultiplayer:](v11, "setSupportsMultiplayer:", [v10 supportsMultiplayer]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 buildVersion]);
    -[MRDeviceInfo setBuildVersion:](v11, "setBuildVersion:", v20);

    -[MRDeviceInfo setProtocolVersion:](v11, "setProtocolVersion:", [v10 protocolVersion]);
  }

  qos_class_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 outputDevices]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100103380;
  v26[3] = &unk_10039B9D0;
  id v27 = v5;
  id v22 = v5;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "msv_compactMap:", v26));

  -[MRDeviceInfo setGroupedDevices:](v11, "setGroupedDevices:", v23);
  -[MRDeviceInfo setGroupLogicalDeviceCount:](v11, "setGroupLogicalDeviceCount:", [v23 count]);
  dispatch_queue_attr_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 contextID]);
  -[MRDeviceInfo setRoutingContextID:](v11, "setRoutingContextID:", v24);

  return v11;
}

- (void)disconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MRLogCategoryConnections(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@ disconnecting with error %{public}@",  buf,  0x16u);
  }

  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100103514;
  v9[3] = &unk_100398E60;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v9);
}

- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 3LL);
  (*((void (**)(id, NSError *))a5 + 2))(v6, v7);
}

- (id)supportedMessages
{
  return  [[MRSupportedProtocolMessages alloc] initWithLastSupportedMessageType:137];
}

- (BOOL)isPaired
{
  return 1;
}

- (BOOL)isUsingSystemPairing
{
  return 1;
}

- (BOOL)wantsNowPlayingNotifications
{
  return 1;
}

- (BOOL)wantsNowPlayingArtworkNotifications
{
  return 0;
}

- (BOOL)wantsVolumeNotifications
{
  return 1;
}

- (BOOL)wantsOutputDeviceNotifications
{
  return 1;
}

- (BOOL)wantsSystemEndpointNotifications
{
  return 0;
}

- (id)errorForCurrentState
{
  return 0LL;
}

- (id)currentClientUpdatesConfigMessage
{
  return 0LL;
}

- (id)groupSessionToken
{
  return 0LL;
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_1001038FC;
  uint64_t v17 = &unk_10039DAC0;
  id v8 = v6;
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  id v10 = objc_retainBlock(&v14);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server", v14, v15, v16, v17));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupSessionServer]);

  if (v12)
  {
    [v12 requestGroupSessionWithCompletion:v10];
  }

  else
  {
    __int16 v13 = -[NSError initWithMRError:description:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:description:",  6LL,  @"Feature not enabled");
    ((void (*)(void ***, void, NSError *))v10[2])(v10, 0LL, v13);
  }
}

- (void)registerForNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"outputContextDataSourceOutputDevicesDidChangeNotification:" name:MROutputContextDataSourceDidReloadNotification object:self->_outputContextController];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"outputContextDataSourceOutputDeviceDidChangeNotification:" name:MROutputContextDataSourceDidChangeOutputDeviceNotification object:self->_outputContextController];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"outputContextDataSourceDidAddOutputDeviceNotification:" name:MROutputContextDataSourceDidAddOutputDeviceNotification object:self->_outputContextController];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"outputContextDataSourceDidRemoveOutputDeviceNotification:" name:MROutputContextDataSourceDidRemoveOutputDeviceNotification object:self->_outputContextController];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"outputContextDataSourceVolumeControlCapabilitiesDidChangeNotification:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilitiesNotification object:self->_outputContextController];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 addObserver:self selector:"outputContextDataSourceVolumeDidChangeNotification:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeNotification object:self->_outputContextController];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 addObserver:self selector:"outputContextDataSourceIsMutedDidChangeNotification:" name:MROutputContextDataSourceOutputDeviceDidChangeVolumeMutedNotification object:self->_outputContextController];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 addObserver:self selector:"outputContextRequestToAddLocalOutputDeviceNotification:" name:MRAVOutputContextModificationRequestToAddLocalDeviceNotification object:self->_outputContext];

  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v11 addObserver:self selector:"anyDeviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];

  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v12 addObserver:self selector:"localClusterTypeDidChangeNotification:" name:@"MRDAVOutputContextExternalDeviceDiscoveryLocalClusterTypeDidChangeNotification" object:0];
}

- (void)outputContextDataSourceOutputDeviceDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);

  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100103CC4;
  v8[3] = &unk_100398E60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  msv_dispatch_sync_on_queue(serialQueue, v8);
}

- (void)outputContextDataSourceDidAddOutputDeviceNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);

  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100103EBC;
  v8[3] = &unk_100398E60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  msv_dispatch_sync_on_queue(serialQueue, v8);
}

- (void)outputContextDataSourceDidRemoveOutputDeviceNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);

  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001040B4;
  v8[3] = &unk_100398E60;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  msv_dispatch_sync_on_queue(serialQueue, v8);
}

- (void)outputContextDataSourceVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:MROutputContextDataSourceVolumeCapabilitiesUserInfoKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);

  if (v11) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    unsigned int v9 = [v11 intValue];
    serialQueue = self->_serialQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10010431C;
    v12[3] = &unk_10039A9B8;
    v12[4] = self;
    unsigned int v14 = v9;
    id v13 = v7;
    msv_dispatch_sync_on_queue(serialQueue, v12);
  }
}

- (void)outputContextDataSourceVolumeDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:MROutputContextDataSourceVolumeUserInfoKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);

  if (v10) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    serialQueue = self->_serialQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100104544;
    void v11[3] = &unk_100398F40;
    v11[4] = self;
    id v12 = v10;
    id v13 = v7;
    msv_dispatch_sync_on_queue(serialQueue, v11);
  }
}

- (void)outputContextDataSourceIsMutedDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:MROutputContextDataSourceVolumeMutedUserInfoKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MROutputContextDataSourceOutputDeviceUserInfoKey]);

  if (v11) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    unsigned __int8 v9 = [v11 BOOLValue];
    serialQueue = self->_serialQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100104788;
    v12[3] = &unk_10039AA30;
    v12[4] = self;
    unsigned __int8 v14 = v9;
    id v13 = v7;
    msv_dispatch_sync_on_queue(serialQueue, v12);
  }
}

- (void)outputContextRequestToAddLocalOutputDeviceNotification:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:MRAVOutputContextModificationInitiatorUserInfoKey]);

  if (([v5 isEqualToString:@"Prewarm"] & 1) == 0) {
    -[MRDAVOutputContextExternalDevice _notifyActiveSessionMaybeWillBeHijackedByNativePlaybackFromOutputContextModification:]( self,  "_notifyActiveSessionMaybeWillBeHijackedByNativePlaybackFromOutputContextModification:",  v6);
  }
}

- (void)_notifyActiveSessionMaybeWillBeHijackedByNativePlaybackFromOutputContextModification:(id)a3
{
  id v4 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:MRAVOutputContextModificationIdentifierUserInfoKey]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v6,  kMRMediaRemoteOptionCommandID);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:MRAVOutputContextModificationInitiatorUserInfoKey]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v8,  kMRMediaRemoteOptionSenderID);

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v9,  kMRMediaRemoteOptionRemoteControlInterfaceIdentifier);

  [(id)objc_opt_class(self) _sendCommandPreview:0 options:v10 playerPath:0];
}

- (void)anyDeviceInfoDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
}

- (void)localClusterTypeDidChangeNotification:(id)a3
{
  id v3 = (MRDAVOutputContextExternalDevice *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = self;
  if (v3 != self)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice designatedGroupLeader](self, "designatedGroupLeader"));
    unsigned int v6 = [v5 isLocalDevice];

    if (!v6) {
      return;
    }
    id v7 = -[NSError initWithMRError:format:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:format:",  32LL,  @"Local device changed clusterType in discovery");
    -[MRDAVOutputContextExternalDevice disconnect:](self, "disconnect:", v7);
    id v4 = (MRDAVOutputContextExternalDevice *)v7;
  }
}

- (void)clusterController:(id)a3 clusterTypeDidChange:(unsigned int)a4
{
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice designatedGroupLeader](self, "designatedGroupLeader", a3));
  unsigned int v7 = [v6 isLocalDevice];

  if (v7)
  {
    uint64_t v9 = MRLogCategoryConnections(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543618;
      uint64_t v17 = self;
      __int16 v18 = 1024;
      unsigned int v19 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Local device changed clusterType to: %u",  buf,  0x12u);
    }

    id v11 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100104CA4;
    v14[3] = &unk_1003A0E98;
    unsigned int v15 = a4;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100104D20;
    v12[3] = &unk_1003A0EC0;
    v12[4] = self;
    unsigned int v13 = a4;
    [v11 searchEndpointsWithPredicate:v14 timeout:@"clusterTypeDidChange" reason:0 queue:v12 completion:30.0];
  }

- (void)_reevaluateDeviceInfo
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice designatedGroupLeader](self, "designatedGroupLeader"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice outputContext](self, "outputContext"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDAVOutputContextExternalDevice _generateDeviceInfoWithDesignatedGroupLeader:outputContext:]( self,  "_generateDeviceInfoWithDesignatedGroupLeader:outputContext:",  v5,  v3));
  -[MRDAVOutputContextExternalDevice setDeviceInfo:](self, "setDeviceInfo:", v4);
}

- (void)cleanUp
{
  designatedGroupLeader = self->_designatedGroupLeader;
  self->_designatedGroupLeader = 0LL;

  -[MRDAVOutputContextExternalDevice setOrigin:](self, "setOrigin:", 0LL);
}

- (id)outputDeviceForUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  __int16 v18 = sub_1000F959C;
  unsigned int v19 = sub_1000F95AC;
  id v20 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010507C;
  block[3] = &unk_100399CB8;
  unsigned __int8 v14 = &v15;
  void block[4] = self;
  id v8 = v6;
  id v13 = v8;
  dispatch_sync(serialQueue, block);
  uint64_t v9 = (void *)v16[5];
  if (a4 && !v9)
  {
    *a4 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 39LL);
    uint64_t v9 = (void *)v16[5];
  }

  id v10 = v9;

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)commitOutputDeviceToContextIfNeededWithReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001052B4;
  v23[3] = &unk_10039FE50;
  void v23[4] = self;
  id v8 = v6;
  id v24 = v8;
  uint64_t v9 = objc_retainBlock(v23);
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 1;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010553C;
  block[3] = &unk_1003A0F30;
  void block[4] = self;
  id v11 = v8;
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  __int16 v18 = &v19;
  dispatch_sync(serialQueue, block);
  if (!*((_BYTE *)v20 + 24)) {
    ((void (*)(void *, void))v13[2])(v13, 0LL);
  }

  _Block_object_dispose(&v19, 8);
}

- (void)_onQueue_forwardOriginToLocalOrigin:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_origin && !self->_originForwarder)
  {
    uint64_t v6 = MRLogCategoryConnections(v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice outputContext](self, "outputContext"));
      int v14 = 138544130;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v5;
      __int16 v18 = 2114;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Begin Forwarding Origin Data from %{public}@ to %{public}@ for outputContext %{public}@",  (uint8_t *)&v14,  0x2Au);
    }

    id v10 = objc_alloc(&OBJC_CLASS___MRDOriginForwarder);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
    id v12 = -[MRDOriginForwarder initWithOrigin:destinationOrigin:](v10, "initWithOrigin:destinationOrigin:", v5, v11);
    originForwarder = self->_originForwarder;
    self->_originForwarder = v12;
  }
}

- (void)_onQueue_clearLocalOriginForwaderWithReason:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_originForwarder)
  {
    uint64_t v6 = MRLogCategoryConnections(v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543618;
      uint64_t v75 = self;
      __int16 v76 = 2112;
      v77 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Begin clearing all localOrigin nowPlayingData because %@",  buf,  0x16u);
    }

    qos_class_t v55 = self;
    id v56 = v5;

    id v8 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 originClientForOrigin:v10]);

    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id v58 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nowPlayingClients]);
    id v13 = [v12 countByEnumeratingWithState:&v67 objects:v73 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v68;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v68 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)i);
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 client]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
          unsigned __int8 v20 = [v19 isEqualToString:v8];

          if ((v20 & 1) == 0)
          {
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 playerPath]);
            [v58 removeClient:v21];
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v67 objects:v73 count:16];
      }

      while (v14);
    }

    char v22 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[MRPlayerPath localPlayerPath](&OBJC_CLASS___MRPlayerPath, "localPlayerPath"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 existingOriginClientRequestsForPlayerPath:v23]);

    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v57 = v24;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 nowPlayingClientRequests]);
    id v26 = [v25 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v64;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v64 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)j);
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 client]);
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 bundleIdentifier]);
          unsigned __int8 v33 = [v32 isEqualToString:v8];

          if ((v33 & 1) == 0)
          {
            id v34 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
            id v35 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin anyOrigin](&OBJC_CLASS___MROrigin, "anyOrigin"));
            id v36 = (void *)objc_claimAutoreleasedReturnValue([v30 client]);
            id v37 = -[MRPlayerPath initWithOrigin:client:player:](v34, "initWithOrigin:client:player:", v35, v36, 0LL);

            [v57 removeClient:v37];
          }
        }

        id v27 = [v25 countByEnumeratingWithState:&v63 objects:v72 count:16];
      }

      while (v27);
    }

    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 nowPlayingServer]);
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 localOriginClient]);

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 nowPlayingClients]);
    id v42 = [v41 countByEnumeratingWithState:&v59 objects:v71 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v60;
      do
      {
        for (k = 0LL; k != v43; k = (char *)k + 1)
        {
          if (*(void *)v60 != v44) {
            objc_enumerationMutation(v41);
          }
          id v46 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)k);
          id v47 = (void *)objc_claimAutoreleasedReturnValue([v46 client]);
          id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 bundleIdentifier]);
          unsigned __int8 v49 = [v48 isEqualToString:v8];

          if ((v49 & 1) == 0)
          {
            id v50 = (void *)objc_claimAutoreleasedReturnValue([v46 client]);
            [v40 removeNowPlayingClientForClient:v50];
          }
        }

        id v43 = [v41 countByEnumeratingWithState:&v59 objects:v71 count:16];
      }

      while (v43);
    }

    uint64_t v52 = MRLogCategoryConnections(v51);
    dispatch_queue_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    id v5 = v56;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543618;
      uint64_t v75 = v55;
      __int16 v76 = 2112;
      v77 = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "%{public}@ End clearing all localOrigin nowPlayingData because %@",  buf,  0x16u);
    }

    originForwarder = v55->_originForwarder;
    v55->_originForwarder = 0LL;
  }
}

- (id)_resolveReason:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_opt_class(self);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice uid](self, "uid"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVOutputContextExternalDevice name](self, "name"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 _resolveReason:v4 uid:v6 name:v7 requestID:0]);

  return v8;
}

+ (id)_resolveReason:(id)a3 uid:(id)a4 name:(id)a5 requestID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"OutputContextExternalDevice-%@-%@:%@<%@>",  v11,  v10,  v12,  v9);

  return v13;
}

- (void)_onQueue_destroyPlayerPathsForOrigin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MRLogCategoryConnections(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    uint64_t v19 = self;
    __int16 v20 = 2114;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Destroying playerPaths for origin: %{public}@",  buf,  0x16u);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server", 0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allClients]);

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[MRDAVOutputContextExternalDevice destroyPlayersForClient:origin:]( self,  "destroyPlayersForClient:origin:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v12),  v4);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

- (void)destroyPlayersForClient:(id)a3 origin:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = MRCreateXPCMessage(0x40000000000000CLL);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v7);
  MRAddOriginToXPCMessage(v9, v5);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
  [v8 sendMessage:v9 queue:0 reply:0];
}

- (BOOL)verifyCreatedPlayerPath:(id)a3 forClient:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = sub_1000F959C;
  uint64_t v28 = sub_1000F95AC;
  id v29 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100106888;
  v23[3] = &unk_100399278;
  void v23[4] = self;
  void v23[5] = &v24;
  dispatch_sync(serialQueue, v23);
  uint64_t v11 = (void *)v25[5];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 origin]);
  id v13 = v11;
  id v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_8;
  }

  __int128 v15 = v14;
  unsigned __int8 v16 = [v13 isEqual:v14];

  if ((v16 & 1) != 0)
  {
LABEL_8:
    BOOL v21 = 1;
    goto LABEL_9;
  }

  uint64_t v18 = MRLogCategoryConnections(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138543618;
    uint64_t v31 = self;
    __int16 v32 = 2114;
    id v33 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@ Origin changed while creating player: %{public}@  - Destroying",  buf,  0x16u);
  }

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 origin]);
  -[MRDAVOutputContextExternalDevice destroyPlayersForClient:origin:](self, "destroyPlayersForClient:origin:", v9, v20);

  BOOL v21 = 0;
  if (a5) {
    *a5 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 6LL);
  }
LABEL_9:
  _Block_object_dispose(&v24, 8);

  return v21;
}

+ (void)_reportStreamCountAnalytics
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localOriginClient]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 routingServer]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 hostedRoutingService]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hostedRoutingController]);

  id v30 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 availableEndpoints]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "msv_filter:", &stru_1003A0F70));

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100106CCC;
  v36[3] = &unk_1003A0F98;
  id v29 = v4;
  id v37 = v29;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "msv_compactMap:", v36));
  if ([v6 considerLocalOriginAsSeperateStream])
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 arrayByAddingObject:v5]);

    id v13 = (void *)v14;
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "msv_filter:", &stru_1003A0FB8));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "msv_filter:", &stru_1003A0FD8));
  uint64_t v31 = v5;
  if ([v6 considerLocalOriginAsSeperateStream])
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 arrayByAddingObject:v17]);

    unsigned __int8 v16 = (void *)v18;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "msv_firstWhere:", &stru_1003A1018));
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v15 count]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v20, @"stream_count");

  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v16 count]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v21,  @"stream_count_can_handoff");

  char v22 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceInfo]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v22 isAirPlayActive]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v23,  @"is_local_receiver");

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19 != 0LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v24,  @"is_local_playing");

  if (MSVDeviceOSIsInternalInstall(v25))
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "msv_map:", &stru_1003A1038));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v26,  @"handoffable_endpoints_debug");

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100106DC4;
    v34[3] = &unk_1003A1060;
    id v35 = v6;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "msv_map:", v34));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v27,  @"playing_player_paths_debug");
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100106FF0;
  v32[3] = &unk_100399650;
  id v33 = v2;
  uint64_t v28 = v2;
  MRAnalyticsSendEvent(@"com.apple.mediaremote.playback-attempt", 0LL, v32);
}

- (id)subscribedPlayerPaths
{
  return self->subscribedPlayerPaths;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
}

- (MRAVConcreteOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setOutputContext:(id)a3
{
}

- (MROrigin)origin
{
  return self->_origin;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (id)connectionStateCallback
{
  return self->_connectionStateCallback;
}

- (void)setConnectionStateCallback:(id)a3
{
}

- (OS_dispatch_queue)connectionStateCallbackQueue
{
  return self->_connectionStateCallbackQueue;
}

- (void)setConnectionStateCallbackQueue:(id)a3
{
}

- (id)outputDevicesUpdatedCallback
{
  return self->_outputDevicesUpdatedCallback;
}

- (void)setOutputDevicesUpdatedCallback:(id)a3
{
}

- (OS_dispatch_queue)outputDevicesUpdatedCallbackQueue
{
  return self->_outputDevicesUpdatedCallbackQueue;
}

- (void)setOutputDevicesUpdatedCallbackQueue:(id)a3
{
}

- (id)outputDevicesRemovedCallback
{
  return self->_outputDevicesRemovedCallback;
}

- (void)setOutputDevicesRemovedCallback:(id)a3
{
}

- (OS_dispatch_queue)outputDevicesRemovedCallbackQueue
{
  return self->_outputDevicesRemovedCallbackQueue;
}

- (void)setOutputDevicesRemovedCallbackQueue:(id)a3
{
}

- (id)volumeCallback
{
  return self->_volumeCallback;
}

- (void)setVolumeCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeCallbackQueue
{
  return self->_volumeCallbackQueue;
}

- (void)setVolumeCallbackQueue:(id)a3
{
}

- (id)volumeControlCapabilitiesCallback
{
  return self->_volumeControlCapabilitiesCallback;
}

- (void)setVolumeControlCapabilitiesCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeControlCapabilitiesCallbackQueue
{
  return self->_volumeControlCapabilitiesCallbackQueue;
}

- (void)setVolumeControlCapabilitiesCallbackQueue:(id)a3
{
}

- (id)volumeMutedCallback
{
  return self->_volumeMutedCallback;
}

- (void)setVolumeMutedCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeMutedCallbackQueue
{
  return self->_volumeMutedCallbackQueue;
}

- (void)setVolumeMutedCallbackQueue:(id)a3
{
}

- (id)deviceInfoCallback
{
  return self->_deviceInfoCallback;
}

- (void)setDeviceInfoCallback:(id)a3
{
}

- (OS_dispatch_queue)deviceInfoCallbackQueue
{
  return self->_deviceInfoCallbackQueue;
}

- (void)setDeviceInfoCallbackQueue:(id)a3
{
}

- (MRDAirPlayLeaderInfoPublisher)airplayPublisher
{
  return self->_airplayPublisher;
}

- (NSError)disconnectionError
{
  return self->_disconnectionError;
}

- (void).cxx_destruct
{
}

@end