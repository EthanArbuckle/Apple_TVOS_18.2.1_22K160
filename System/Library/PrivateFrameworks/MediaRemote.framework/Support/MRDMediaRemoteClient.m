@interface MRDMediaRemoteClient
- ($115C4C562B26FF47E01F9F4EA65B5887)realToken;
- (BOOL)_isAllowedAccessToDataFromPlayerPath:(id)a3;
- (BOOL)canBeNowPlaying;
- (BOOL)declaringAirplayActive;
- (BOOL)hasRequestedLegacyNowPlayingInfo;
- (BOOL)hasRequestedSupportedCommands;
- (BOOL)isActive;
- (BOOL)isAllowedAccessToDataFromPlayerPath:(id)a3;
- (BOOL)isEntitledFor:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInCriticalSection;
- (BOOL)isMediaRemoteDaemon;
- (BOOL)keepAlive;
- (BOOL)notificationRequiresTaskAssertionForPlayerPath:(id)a3;
- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3;
- (BOOL)takeAssertion:(int64_t)a3 forReason:(id)a4 duration:(double)a5;
- (BOOL)takeAssertionAndBlessForReason:(id)a3;
- (MRDMediaRemoteClient)initWithConnection:(id)a3;
- (MRDMediaRemoteUIService)remoteUIService;
- (MRDPairingHandler)pairingHandler;
- (MRDTaskAssertion)currentTaskAssertion;
- (MRDXPCMessageHandling)messageHandler;
- (MRPlaybackQueueClient)playbackQueueRequests;
- (MRPlayerPath)nowPlayingAirPlaySession;
- (MRXPCConnection)connection;
- (NSArray)applicationPickedRoutes;
- (NSData)auditToken;
- (NSString)bundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayName;
- (NSString)processName;
- (id)_runAssertionName;
- (id)createNowPlayingClient;
- (int)pid;
- (unint64_t)entitlements;
- (unint64_t)routeDiscoveryCount;
- (unsigned)euid;
- (unsigned)hardwareRemoteBehavior;
- (unsigned)outputDeviceDiscoveryMode;
- (unsigned)routeDiscoveryMode;
- (void)_handleXPCMessage:(id)a3;
- (void)_invalidate;
- (void)_postNotification:(id)a3;
- (void)_relayXPCMessage:(id)a3 andReply:(BOOL)a4 resultCallback:(id)a5;
- (void)_resumeConnection;
- (void)addPendingPlaybackSessionMigrateEvent:(id)a3 playerPath:(id)a4;
- (void)connectionDidResume:(id)a3;
- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3;
- (void)invalidateCriticalSectionAssertionForRequestID:(id)a3;
- (void)pauseNotifications;
- (void)postNotification:(id)a3;
- (void)relayXPCMessage:(id)a3 andReply:(BOOL)a4;
- (void)relayXPCMessage:(id)a3 andReply:(BOOL)a4 resultCallback:(id)a5;
- (void)resumeNotifications;
- (void)sendRemoteControlCommand:(id)a3 withCompletionBlock:(id)a4;
- (void)setApplicationPickedRoutes:(id)a3;
- (void)setCurrentTaskAssertion:(id)a3;
- (void)setDeclaringAirplayActive:(BOOL)a3;
- (void)setHardwareRemoteBehavior:(unsigned int)a3;
- (void)setHasRequestedLegacyNowPlayingInfo:(BOOL)a3;
- (void)setHasRequestedSupportedCommands:(BOOL)a3;
- (void)setKeepAlive:(BOOL)a3;
- (void)setMessageHandler:(id)a3;
- (void)setNowPlayingAirPlaySession:(id)a3;
- (void)setOutputDeviceDiscoveryMode:(unsigned int)a3;
- (void)setPairingHandler:(id)a3;
- (void)setRemoteUIService:(id)a3;
- (void)setRouteDiscoveryMode:(unsigned int)a3;
- (void)setWantsAssertionsForNotificationsWithPlayerPath:(id)a3;
- (void)takeCriticalSectionAssertionForRequestID:(id)a3 completion:(id)a4;
@end

@implementation MRDMediaRemoteClient

- (MRDMediaRemoteClient)initWithConnection:(id)a3
{
  id v74 = a3;
  v95.receiver = self;
  v95.super_class = (Class)&OBJC_CLASS___MRDMediaRemoteClient;
  v75 = -[MRDMediaRemoteClient init](&v95, "init");
  if (!v75) {
    goto LABEL_56;
  }
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  xpc_connection_get_audit_token(v74, &v93);
  *(_OWORD *)location = v93;
  __int128 v92 = v94;
  v4 = sub_10013D0D8(location);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  bundleIdentifier = v75->_bundleIdentifier;
  v75->_bundleIdentifier = (NSString *)v5;

  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472LL;
  v89[2] = sub_100126628;
  v89[3] = &unk_1003A1B00;
  v7 = v75;
  v90 = v7;
  v73 = objc_retainBlock(v89);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001266C4;
  block[3] = &unk_100399250;
  val = v7;
  v88 = val;
  if (qword_1003FE0B0 != -1) {
    dispatch_once(&qword_1003FE0B0, block);
  }
  v8 = objc_alloc(&OBJC_CLASS___MRXPCConnection);
  v9 = -[MRXPCConnection initWithConnection:queue:defaultReplyQueue:]( v8,  "initWithConnection:queue:defaultReplyQueue:",  v74,  qword_1003FE0A8,  qword_1003FE0A8);
  id v10 = val[20];
  val[20] = v9;

  v11 = (const char *)((uint64_t (*)(void *, const __CFString *))v73[2])(v73, @"serialQueue");
  dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
  dispatch_queue_t v14 = dispatch_queue_create(v11, v13);
  id v15 = val[2];
  val[2] = v14;

  objc_storeStrong(val + 3, (id)qword_1003FE0A0);
  v16 = -[MRPlaybackQueueClient initWithQueue:]( objc_alloc(&OBJC_CLASS___MRPlaybackQueueClient),  "initWithQueue:",  val[2]);
  id v17 = val[26];
  val[26] = v16;

  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v19 = val[7];
  val[7] = v18;

  v20 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  id v21 = val[8];
  val[8] = v20;

  [val[8] setMaxConcurrentOperationCount:1];
  *((_BYTE *)val + 104) = 0;
  v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v23 = val[14];
  val[14] = v22;

  v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v25 = val[15];
  val[15] = v24;

  v26 = objc_alloc(&OBJC_CLASS___MRXPCConnectionMonitor);
  v27 = (objc_class *)objc_opt_class(val);
  v28 = NSStringFromClass(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = -[MRXPCConnectionMonitor initWithXPCConnection:label:](v26, "initWithXPCConnection:label:", v74, v29);
  id v31 = val[12];
  val[12] = v30;

  [val[12] setDelegate:val];
  objc_initWeak(location, val);
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_1001267DC;
  v85[3] = &unk_1003A1B28;
  v70 = &v86;
  objc_copyWeak(&v86, location);
  [val[20] setMessageHandler:v85];
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472LL;
  v83[2] = sub_100126824;
  v83[3] = &unk_1003A1B28;
  v72 = &v84;
  objc_copyWeak(&v84, location);
  [val[20] setInvalidationHandler:v83];
  v32 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.send-commands", &v93);

  if (v32
    || (v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(val, "bundleIdentifier", &v86, &v84)),
        unsigned __int8 v34 = [v33 isEqualToString:@"com.apple.AssistantServices"],
        v33,
        (v34 & 1) != 0)
    || (v35 = (void *)objc_claimAutoreleasedReturnValue([val bundleIdentifier]),
        unsigned int v36 = [v35 isEqualToString:@"com.apple.lskdd"],
        v35,
        v36))
  {
    val[9] = (id)((unint64_t)val[9] | 2);
  }

  v37 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.nearby-device", &v93);

  if (v37) {
    val[9] = (id)((unint64_t)val[9] | 8);
  }
  v38 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.request-bless", &v93);

  if (v38) {
    val[9] = (id)((unint64_t)val[9] | 0x10);
  }
  v39 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.set-now-playing-app", &v93);

  if (v39
    || (v40 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings")),
        unsigned int v41 = [v40 supportMultiplayerHost],
        v40,
        v41))
  {
    val[9] = (id)((unint64_t)val[9] | 0x20);
  }

  v42 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.waking-now-playing-notifications", &v93);

  if (v42) {
    val[9] = (id)((unint64_t)val[9] | 0x80);
  }
  v43 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.set-default-supported-commands", &v93);

  if (v43) {
    val[9] = (id)((unint64_t)val[9] | 0x100);
  }
  v44 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.restrict-command-clients", &v93);

  if (v44) {
    val[9] = (id)((unint64_t)val[9] | 0x800);
  }
  v45 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.now-playing-read-access", &v93);

  if (v45) {
    val[9] = (id)((unint64_t)val[9] | 0x200);
  }
  v46 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.full-now-playing-read-access", &v93);

  if (v46) {
    val[9] = (id)((unint64_t)val[9] | 0x600);
  }
  v47 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.group-sessions", &v93);

  if (v47) {
    val[9] = (id)((unint64_t)val[9] | 0x1000);
  }
  v48 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.device-info", &v93);
  if (v48)
  {
  }

  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned __int8 v50 = [v49 supportsNativeThirdPartyApps];

    if ((v50 & 1) != 0) {
      goto LABEL_31;
    }
  }

  val[9] = (id)((unint64_t)val[9] | 0x2000);
LABEL_31:
  v51 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.critical-section-management", &v93);

  if (v51) {
    val[9] = (id)((unint64_t)val[9] | 0x4000);
  }
  v52 = (void *)xpc_copy_entitlement_for_token("com.apple.mediaremote.remote-control-discovery", &v93);
  if (v52)
  {
  }

  else
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned __int8 v54 = [v53 supportsNativeThirdPartyApps];

    if ((v54 & 1) != 0) {
      goto LABEL_37;
    }
  }

  val[9] = (id)((unint64_t)val[9] | 0x18000);
LABEL_37:
  xpc_object_t xdict = (xpc_object_t)xpc_copy_entitlement_for_token(0LL, &v93);
  if (xdict)
  {
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    id v55 = [&off_1003BBB70 countByEnumeratingWithState:&v79 objects:v96 count:16];
    if (v55)
    {
      int v56 = 0;
      uint64_t v77 = *(void *)v80;
      do
      {
        for (i = 0LL; i != v55; i = (char *)i + 1)
        {
          if (*(void *)v80 != v77) {
            objc_enumerationMutation(&off_1003BBB70);
          }
          id v58 = *(id *)(*((void *)&v79 + 1) + 8LL * (void)i);
          xpc_object_t array = xpc_dictionary_get_array(xdict, (const char *)[v58 UTF8String]);
          v60 = (void *)objc_claimAutoreleasedReturnValue(array);
          v61 = v60;
          if (v60)
          {
            int count = xpc_array_get_count(v60);
            if (count >= 1)
            {
              size_t v63 = 0LL;
              uint64_t v64 = count;
              while (1)
              {
                v65 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_array_get_string(v61, v63));
                v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
                unsigned __int8 v67 = [v66 isEqualToString:@"com.apple.PairingManager"];

                if ((v67 & 1) != 0) {
                  break;
                }
                if (v64 == ++v63) {
                  goto LABEL_51;
                }
              }

              ++v56;
            }
          }

          else
          {
            v56 += xpc_dictionary_get_BOOL(xdict, (const char *)[v58 UTF8String]);
          }

- (int)pid
{
  return -[MRXPCConnection pid](self->_connection, "pid");
}

- (unsigned)euid
{
  return -[MRXPCConnection uid](self->_connection, "uid");
}

- ($115C4C562B26FF47E01F9F4EA65B5887)realToken
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRXPCConnection connection](self->_connection, "connection"));
  xpc_connection_get_audit_token(v5, retstr);

  return result;
}

- (NSData)auditToken
{
  return (NSData *)(id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v3,  32LL));
}

- (NSString)displayName
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](self, "bundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%ld",  v3,  -[MRDMediaRemoteClient pid](self, "pid")));

  return (NSString *)v4;
}

- (NSString)processName
{
  processName = self->_processName;
  if (!processName)
  {
    int v4 = proc_pidpath(-[MRDMediaRemoteClient pid](self, "pid"), buffer, 0x1000u);
    if (v4 >= 1)
    {
      id v5 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  v4,  4LL);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v5, "lastPathComponent"));
      v7 = (NSString *)[v6 copy];
      v8 = self->_processName;
      self->_processName = v7;
    }

    processName = self->_processName;
  }

  return processName;
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class(self);
  int v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](self, "bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p, bundleIdentifier = %@, pid = %ld>",  v5,  self,  v6,  -[MRDMediaRemoteClient pid](self, "pid")));

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class(self);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](self, "bundleIdentifier"));
  uint64_t v5 = -[MRDMediaRemoteClient pid](self, "pid");
  uint64_t v6 = -[MRDMediaRemoteClient euid](self, "euid");
  connection = self->_connection;
  uint64_t v8 = MRCreateIndentedDebugDescriptionFromObject(self->_connectionMonitor);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p {\n    bundle identifier = %@\n    pid = %ld\n    euid = %ld\n    xpc connection = %@\n    connection monitor = %@\n",  v3,  self,  v4,  v5,  v6,  connection,  v9));

  if (self->_currentTaskAssertion) {
    [v10 appendFormat:@"    current task assertion = %@\n", self->_currentTaskAssertion];
  }
  if (-[NSMutableArray count](self->_assertions, "count"))
  {
    uint64_t v12 = MRCreateIndentedDebugDescriptionFromArray(self->_assertions);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v10 appendFormat:@"    assertions = %@\n", v13];
  }

  uint64_t routeDiscoveryMode = self->_routeDiscoveryMode;
  if ((_DWORD)routeDiscoveryMode)
  {
    id v15 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(routeDiscoveryMode, v11);
    [v10 appendFormat:@"    route discovery mode = %@\n", v15];
  }

  if (-[NSArray count](self->_applicationPickedRoutes, "count")) {
    [v10 appendFormat:@"    application picked routes = %@\n", self->_applicationPickedRoutes];
  }
  uint64_t hardwareRemoteBehavior = self->_hardwareRemoteBehavior;
  if ((_DWORD)hardwareRemoteBehavior)
  {
    id v17 = (void *)MRMediaRemoteCopyHardwareRemoteBehaviorDescription(hardwareRemoteBehavior);
    [v10 appendFormat:@"    hardware remote behavior = %@\n", v17];
  }

  if (self->_hasRequestedLegacyNowPlayingInfo) {
    objc_msgSend(v10, "appendFormat:", @"    has requested legacy nowPlayingInfo = %s\n", "YES");
  }
  if (self->_hasRequestedSupportedCommands) {
    objc_msgSend(v10, "appendFormat:", @"    has requested supported commands = %s\n", "YES");
  }
  if (self->_declaringAirplayActive) {
    [v10 appendFormat:@"    declaringAirplayActive = YES\n"];
  }
  if (self->_nowPlayingAirPlaySession) {
    [v10 appendFormat:@"    nowPlayingAirPlaySession = %@\n", self->_nowPlayingAirPlaySession];
  }
  if (-[NSMutableArray count](self->_subscribedWakingPlayerPaths, "count"))
  {
    uint64_t v18 = MRCreateIndentedDebugDescriptionFromArray(self->_subscribedWakingPlayerPaths);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v10 appendFormat:@"    subscribedWakingPlayerPaths = %@\n", v19];
  }

  playbackQueueRequests = self->_playbackQueueRequests;
  if (playbackQueueRequests)
  {
    uint64_t v21 = MRCreateIndentedDebugDescriptionFromObject(playbackQueueRequests);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v10 appendFormat:@"    playbackQueueRequests = %@\n", v22];
  }

  [v10 appendString:@"}\n"];
  [v10 appendFormat:@"}>"];
  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MRDMediaRemoteClient);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    unsigned int v7 = -[MRDMediaRemoteClient pid](self, "pid");
    unsigned int v8 = [v6 pid];

    BOOL v9 = v7 == v8;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setRouteDiscoveryMode:(unsigned int)a3
{
  if (self->_routeDiscoveryMode != a3)
  {
    self->_uint64_t routeDiscoveryMode = a3;
    uint64_t v4 = _MRLogForCategory(0LL, a2);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client switched route discovery mode to: %lu",  (uint8_t *)&v6,  0xCu);
    }
  }

- (void)setOutputDeviceDiscoveryMode:(unsigned int)a3
{
  if (self->_outputDeviceDiscoveryMode != a3)
  {
    self->_outputDeviceDiscoveryMode = a3;
    uint64_t v4 = _MRLogForCategory(0LL, a2);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client switched output device discovery mode to: %lu",  (uint8_t *)&v6,  0xCu);
    }
  }

- (NSArray)applicationPickedRoutes
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  BOOL v9 = sub_100126FC0;
  id v10 = sub_100126FD0;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100126FD8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)setApplicationPickedRoutes:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012708C;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (MRDPairingHandler)pairingHandler
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  BOOL v9 = sub_100126FC0;
  id v10 = sub_100126FD0;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100127170;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDPairingHandler *)v3;
}

- (void)setRemoteUIService:(id)a3
{
  id v5 = a3;
  -[MRDMediaRemoteUIService setBundleIdentifier:]( self->_remoteUIService,  "setBundleIdentifier:",  self->_bundleIdentifier);
}

- (void)setKeepAlive:(BOOL)a3
{
  if (self->_keepAlive != a3) {
    self->_keepAlive = a3;
  }
}

- (BOOL)hasRequestedLegacyNowPlayingInfo
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001272B8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canBeNowPlaying
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 originClientForOrigin:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "existingNowPlayingClientForPid:", -[MRDMediaRemoteClient pid](self, "pid")));
  LOBYTE(v3) = [v7 canBeNowPlaying];

  return (char)v3;
}

- (void)setDeclaringAirplayActive:(BOOL)a3
{
  if (self->_declaringAirplayActive != a3)
  {
    self->_declaringAirplayActive = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 postNotificationName:@"MRDMediaRemoteClientDeclaringAirplayActiveDidChange" object:self];
  }

- (BOOL)isMediaRemoteDaemon
{
  unsigned int v2 = -[MRDMediaRemoteClient pid](self, "pid");
  return v2 == getpid();
}

- (BOOL)isInCriticalSection
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100127540;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEntitledFor:(unint64_t)a3
{
  if ((a3 & ~self->_entitlements) != 0) {
    return -[MRDMediaRemoteClient isMediaRemoteDaemon](self, "isMediaRemoteDaemon");
  }
  else {
    return 1;
  }
}

- (void)addPendingPlaybackSessionMigrateEvent:(id)a3 playerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012763C;
  block[3] = &unk_100398F40;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
}

- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012777C;
  block[3] = &unk_100399DF8;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    uint64_t v18 = 0LL;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    uint64_t v21 = sub_100126FC0;
    v22 = sub_100126FD0;
    id v23 = 0LL;
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001279F0;
    block[3] = &unk_100399278;
    void block[4] = self;
    void block[5] = &v18;
    dispatch_sync(serialQueue, block);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = (id)v19[5];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "first", (void)v13));
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 second]);
          v4[2](v4, v11, v12);
        }

        id v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
      }

      while (v7);
    }

    _Block_object_dispose(&v18, 8);
  }
}

- (BOOL)_isAllowedAccessToDataFromPlayerPath:(id)a3
{
  return 1;
}

- (BOOL)isAllowedAccessToDataFromPlayerPath:(id)a3
{
  id v4 = a3;
  if (-[MRDMediaRemoteClient isEntitledFor:](self, "isEntitledFor:", 1024LL)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = -[MRDMediaRemoteClient _isAllowedAccessToDataFromPlayerPath:]( self,  "_isAllowedAccessToDataFromPlayerPath:",  v4);
  }

  return v5;
}

- (void)postNotification:(id)a3
{
  id v4 = a3;
  if (-[MRDMediaRemoteClient isMediaRemoteDaemon](self, "isMediaRemoteDaemon"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 notification]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MRMediaRemoteServiceClient sharedServiceClient]( &OBJC_CLASS___MRMediaRemoteServiceClient,  "sharedServiceClient"));
    MRNotificationServiceClientPostNotificationCallback(v5, v6, v7, 0LL);
  }

  else
  {
    objc_initWeak(&location, self);
    connectionMonitor = self->_connectionMonitor;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100127BCC;
    v9[3] = &unk_1003A1B50;
    objc_copyWeak(&v11, &location);
    v9[4] = self;
    id v10 = v4;
    -[MRXPCConnectionMonitor canSendMessage:](connectionMonitor, "canSendMessage:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)pauseNotifications
{
  if (!-[MRDMediaRemoteClient isInCriticalSection](self, "isInCriticalSection"))
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100127D54;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_sync(serialQueue, block);
  }

- (void)resumeNotifications
{
  uint64_t v13 = 0LL;
  __int128 v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  __int128 v16 = sub_100126FC0;
  id v17 = sub_100126FD0;
  id v18 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100127EFC;
  block[3] = &unk_100398EC8;
  void block[4] = self;
  void block[5] = &v13;
  dispatch_sync(serialQueue, block);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v4 = (id)v14[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[MRDMediaRemoteClient _postNotification:]( self,  "_postNotification:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  (void)v8);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }

    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

- (BOOL)notificationRequiresTaskAssertionForPlayerPath:(id)a3
{
  uint64_t v7 = 0LL;
  __int128 v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100127FF4;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  if (a3) {
    LOBYTE(a3) = *((_BYTE *)v8 + 24) != 0;
  }
  _Block_object_dispose(&v7, 8);
  return (char)a3;
}

- (void)setWantsAssertionsForNotificationsWithPlayerPath:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001280AC;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (BOOL)takeAssertion:(int64_t)a3 forReason:(id)a4 duration:(double)a5
{
  id v8 = a4;
  objc_initWeak(&location, self);
  uint64_t v9 = objc_alloc(&OBJC_CLASS___MRDTaskAssertion);
  uint64_t v10 = -[MRDMediaRemoteClient pid](self, "pid");
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](self, "bundleIdentifier"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100128298;
  v23[3] = &unk_1003A1B78;
  objc_copyWeak(&v24, &location);
  id v12 = -[MRDTaskAssertion initWithType:pid:bundleID:name:invalidationHandler:]( v9,  "initWithType:pid:bundleID:name:invalidationHandler:",  a3,  v10,  v11,  v8,  v23);

  if (-[MRDTaskAssertion invalidateInDuration:](v12, "invalidateInDuration:", a5))
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    __int128 v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    id v18 = sub_100128340;
    id v19 = &unk_1003A1BA0;
    objc_copyWeak(v22, &location);
    id v20 = v8;
    v22[1] = *(id *)&a5;
    uint64_t v21 = v12;
    dispatch_async(serialQueue, &v16);

    objc_destroyWeak(v22);
  }

  unsigned __int8 v14 = -[MRDTaskAssertion isValid](v12, "isValid", v16, v17, v18, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v14;
}

- (BOOL)takeAssertionAndBlessForReason:(id)a3
{
  if (-[MRDMediaRemoteClient takeAssertion:forReason:duration:]( self,  "takeAssertion:forReason:duration:",  4LL,  a3,  30.0))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](self, "bundleIdentifier"));
    unsigned __int8 v6 = sub_10013CEB0(v5);

    if ((v6 & 1) != 0) {
      return 1;
    }
    uint64_t v12 = _MRLogForCategory(0LL, v7);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002BA410((uint64_t)self, v10, v13);
    }
  }

  else
  {
    uint64_t v9 = _MRLogForCategory(0LL, v4);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002BA47C((uint64_t)self, v10, v11);
    }
  }

  return 0;
}

- (void)takeCriticalSectionAssertionForRequestID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100128690;
  block[3] = &unk_10039DCD0;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)invalidateCriticalSectionAssertionForRequestID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001289E0;
  block[3] = &unk_10039B590;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sendRemoteControlCommand:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 playerPath]);
  v65 = (void *)objc_claimAutoreleasedReturnValue([v9 client]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 origin]);
  unsigned int v11 = [v10 isLocal];

  if (v11) {
    goto LABEL_29;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 origin]);
  unsigned int v13 = [v12 isLocallyHosted];

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v65 bundleIdentifier]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](self, "bundleIdentifier"));
    unsigned int v16 = [v14 isEqual:v15];

    if (v16)
    {
LABEL_29:
    }
  }

  uint64_t v89 = 0LL;
  v90 = &v89;
  uint64_t v91 = 0x3032000000LL;
  __int128 v92 = sub_100126FC0;
  __int128 v93 = sub_100126FD0;
  id v94 = 0LL;
  uint64_t v17 = objc_alloc(&OBJC_CLASS___NSMutableString);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 commandID]);
  id v19 = -[NSMutableString initWithFormat:]( v17,  "initWithFormat:",  @"%@<%@>",  @"sendRemoteControlCommand",  v18);

  if (v9) {
    -[NSMutableString appendFormat:](v19, "appendFormat:", @" for %@", v9);
  }
  uint64_t v21 = _MRLogForCategory(10LL, v20);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v96 = v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_100129454;
  v84[3] = &unk_1003A1BF0;
  id v23 = v6;
  id v85 = v23;
  id v61 = v8;
  id v86 = v61;
  id v60 = v7;
  id v87 = v60;
  v88 = &v89;
  id v24 = objc_retainBlock(v84);
  id v25 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v23 description]);
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_1001296A8;
  v82[3] = &unk_100399530;
  v27 = v24;
  id v83 = v27;
  id v28 = [v25 initWithTimeout:v26 reason:v82 handler:0.0];

  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472LL;
  v79[2] = sub_100129710;
  v79[3] = &unk_100399DD0;
  id v63 = v28;
  id v80 = v63;
  v62 = v27;
  id v81 = v62;
  uint64_t v64 = objc_retainBlock(v79);
  if (-[MRDMediaRemoteClient isMediaRemoteDaemon](self, "isMediaRemoteDaemon"))
  {
    id v29 = [v23 commandType];
    v30 = (void *)objc_claimAutoreleasedReturnValue([v23 options]);
    MRServiceClientRemoteCommandCallback(v9, v29, v30, v64);
    goto LABEL_26;
  }

  uint64_t v57 = objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  -[MRDMediaRemoteClient pid](self, "pid")));
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_10012975C;
  v76[3] = &unk_1003A1C40;
  id v56 = (id)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:"));
  id v77 = v56;
  id v58 = v64;
  id v78 = v58;
  uint64_t v31 = objc_claimAutoreleasedReturnValue( +[RBSProcessMonitor monitorWithConfiguration:]( &OBJC_CLASS___RBSProcessMonitor,  "monitorWithConfiguration:",  v76));
  v32 = (void *)v90[5];
  v90[5] = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue([v9 origin]);
  if ([v33 isLocallyHosted])
  {
    unsigned int v34 = [v23 shouldImplicitlyLaunchApplication];

    if (!v34) {
      goto LABEL_18;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](self, "bundleIdentifier"));
    unsigned int v36 = sub_10013CEB0(v35);

    if (!v36) {
      goto LABEL_18;
    }
    uint64_t v38 = _MRLogForCategory(2LL, v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (NSMutableString *)objc_claimAutoreleasedReturnValue([v23 commandID]);
      *(_DWORD *)buf = 138543362;
      v96 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_DEFAULT,  "Set AVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute for command %{public}@",  buf,  0xCu);
    }
  }

LABEL_18:
  xpc_object_t v40 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v40, "MRXPC_MESSAGE_ID_KEY", 0x800000000000001uLL);
  xpc_dictionary_set_uint64(v40, "MRXPC_COMMAND_KEY", [v23 commandType]);
  id v59 = (id)objc_claimAutoreleasedReturnValue([v23 optionsData]);
  if (v59)
  {
    id v41 = v59;
    xpc_dictionary_set_data( v40,  "MRXPC_COMMAND_OPTIONS_KEY",  [v41 bytes],  (size_t)objc_msgSend(v41, "length"));
  }

  MRAddPlayerPathToXPCMessage(v40, v9);
  objc_initWeak((id *)buf, self);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v23 commandID]);
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sending remote control command %@",  v42));

  v44 = objc_alloc(&OBJC_CLASS___MRDTaskAssertion);
  uint64_t v45 = -[MRDMediaRemoteClient pid](self, "pid");
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](self, "bundleIdentifier"));
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_100129954;
  v74[3] = &unk_1003A1B78;
  objc_copyWeak(&v75, (id *)buf);
  v47 = -[MRDTaskAssertion initWithType:pid:bundleID:name:invalidationHandler:]( v44,  "initWithType:pid:bundleID:name:invalidationHandler:",  1LL,  v45,  v46,  v43,  v74);

  if (-[MRDTaskAssertion invalidateInDuration:](v47, "invalidateInDuration:", 10.0))
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001299FC;
    block[3] = &unk_10039B590;
    objc_copyWeak(&v73, (id *)buf);
    v72 = v47;
    dispatch_async(serialQueue, block);

    objc_destroyWeak(&v73);
  }

  uint64_t v50 = _MRLogForCategory(2LL, v48);
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue([v23 commandID]);
  v53 = (char *)[v52 hash];

  if ((unint64_t)(v53 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    *(_WORD *)v70 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v51,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v53,  "SendCommandXPCToApp",  "",  v70,  2u);
  }

  kdebug_trace(732233812LL, 0LL, 0LL, 0LL, 0LL);
  unsigned __int8 v54 = (void *)objc_claimAutoreleasedReturnValue(-[MRXPCConnection connection](self->_connection, "connection"));
  workerQueue = self->_workerQueue;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_100129A3C;
  v66[3] = &unk_1003A1C68;
  id v67 = v23;
  v68 = self;
  v69 = v58;
  sub_10013ADEC(v54, v40, workerQueue, v66);

  objc_destroyWeak(&v75);
  objc_destroyWeak((id *)buf);

  v30 = (void *)v57;
LABEL_26:

  _Block_object_dispose(&v89, 8);
}

- (void)relayXPCMessage:(id)a3 andReply:(BOOL)a4
{
}

- (void)relayXPCMessage:(id)a3 andReply:(BOOL)a4 resultCallback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  relayingMessages = self->_relayingMessages;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100129CE8;
  v13[3] = &unk_1003A1C90;
  objc_copyWeak(&v16, &location);
  v13[4] = self;
  id v11 = v8;
  id v14 = v11;
  BOOL v17 = a4;
  id v12 = v9;
  id v15 = v12;
  -[NSOperationQueue addOperationWithBlock:](relayingMessages, "addOperationWithBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_relayXPCMessage:(id)a3 andReply:(BOOL)a4 resultCallback:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRXPCConnection connection](self->_connection, "connection"));

  if (v10)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "MRXPC_MESSAGE_ID_KEY");
    if (uint64 == 0x700000000000002LL)
    {
      id v12 = @"RequestPlaybackQueue";
    }

    else if (uint64 == 0x500000000000001LL)
    {
      id v12 = @"BeginLoadingBrowsableContent";
    }

    else
    {
      id v12 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%llu", uint64);
    }

    id v24 = (__CFString *)v12;
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Relaying XPC message %@ to client %@",  v12,  self));
    id v14 = objc_alloc(&OBJC_CLASS___MRDTaskAssertion);
    uint64_t v15 = -[MRDMediaRemoteClient pid](self, "pid");
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](self, "bundleIdentifier"));
    BOOL v17 = -[MRDTaskAssertion initWithType:pid:bundleID:name:]( v14,  "initWithType:pid:bundleID:name:",  2LL,  v15,  v16,  v13);

    double v18 = 10.0;
    if (v6) {
      double v18 = 29.0;
    }
    if (-[MRDTaskAssertion invalidateInDuration:](v17, "invalidateInDuration:", v18))
    {
      serialQueue = (dispatch_queue_s *)self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10012A0CC;
      block[3] = &unk_100398E60;
      void block[4] = self;
      v33 = v17;
      dispatch_sync(serialQueue, block);
    }

    xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
    sub_10013A8FC(v20, v8);
    objc_initWeak(&location, self);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRXPCConnection connection](self->_connection, "connection"));
    v22 = &_dispatch_main_q;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10012A218;
    v25[3] = &unk_1003A1CB8;
    id v28 = v9;
    BOOL v30 = v6;
    id v26 = v8;
    objc_copyWeak(&v29, &location);
    id v23 = v17;
    v27 = v23;
    sub_10013ADEC(v21, v20, &_dispatch_main_q, v25);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  else if (v6)
  {
    sub_10013AB4C(v8, (uint64_t)"MRXPC_ERROR_CODE_KEY", 1LL, 4LL, 0LL);
  }
}

- (id)createNowPlayingClient
{
  char v3 = objc_alloc(&OBJC_CLASS___MRClient);
  uint64_t v4 = -[MRDMediaRemoteClient pid](self, "pid");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteClient bundleIdentifier](self, "bundleIdentifier"));
  BOOL v6 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]( v3,  "initWithProcessIdentifier:bundleIdentifier:",  v4,  v5);

  return v6;
}

- (void)connectionDidResume:(id)a3
{
}

- (void)_handleXPCMessage:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageHandler);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_messageHandler);
    [v5 handleXPCMessage:v6 fromClient:self];
  }
}

- (void)_invalidate
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"MRDMediaRemoteClientDidInvalidate" object:self];
}

- (id)_runAssertionName
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  objc_opt_class(self),  self->_bundleIdentifier);
}

- (void)_resumeConnection
{
  id v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MRXPCConnection connection](self->_connection, "connection"));
  uint64_t v4 = MRCreateXPCMessage(0x700000000000009LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  xpc_connection_send_message(v3, v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10012A5A4;
  v7[3] = &unk_1003A1CE0;
  v7[4] = self;
  [v6 restoreClientState:self handler:v7];
}

- (void)_postNotification:(id)a3
{
  id v14 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (-[MRDMediaRemoteClient isAllowedAccessToDataFromPlayerPath:](self, "isAllowedAccessToDataFromPlayerPath:", v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
    uint64_t v8 = MRGetPlayerPathFromUserInfo(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    unsigned int v10 = -[MRDMediaRemoteClient notificationRequiresTaskAssertionForPlayerPath:]( self,  "notificationRequiresTaskAssertionForPlayerPath:",  v9);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      [v11 wakingPlayerPathAssertionDuration];
      -[MRDMediaRemoteClient takeAssertion:forReason:duration:]( self,  "takeAssertion:forReason:duration:",  4LL,  @"WakingPlayerPathNotification");
    }

    id v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MRXPCConnection connection](self->_connection, "connection"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v14 xpcMessage]);
    xpc_connection_send_message(v12, v13);
  }
}

- (MRDXPCMessageHandling)messageHandler
{
  return (MRDXPCMessageHandling *)objc_loadWeakRetained((id *)&self->_messageHandler);
}

- (void)setMessageHandler:(id)a3
{
}

- (MRXPCConnection)connection
{
  return self->_connection;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (MRDTaskAssertion)currentTaskAssertion
{
  return self->_currentTaskAssertion;
}

- (void)setCurrentTaskAssertion:(id)a3
{
}

- (unsigned)hardwareRemoteBehavior
{
  return self->_hardwareRemoteBehavior;
}

- (void)setHardwareRemoteBehavior:(unsigned int)a3
{
  self->_uint64_t hardwareRemoteBehavior = a3;
}

- (unint64_t)routeDiscoveryCount
{
  return self->_routeDiscoveryCount;
}

- (unsigned)routeDiscoveryMode
{
  return self->_routeDiscoveryMode;
}

- (unsigned)outputDeviceDiscoveryMode
{
  return self->_outputDeviceDiscoveryMode;
}

- (MRDMediaRemoteUIService)remoteUIService
{
  return self->_remoteUIService;
}

- (void)setPairingHandler:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)keepAlive
{
  return self->_keepAlive;
}

- (void)setHasRequestedLegacyNowPlayingInfo:(BOOL)a3
{
  self->_hasRequestedLegacyNowPlayingInfo = a3;
}

- (BOOL)hasRequestedSupportedCommands
{
  return self->_hasRequestedSupportedCommands;
}

- (void)setHasRequestedSupportedCommands:(BOOL)a3
{
  self->_hasRequestedSupportedCommands = a3;
}

- (BOOL)declaringAirplayActive
{
  return self->_declaringAirplayActive;
}

- (MRPlayerPath)nowPlayingAirPlaySession
{
  return self->_nowPlayingAirPlaySession;
}

- (void)setNowPlayingAirPlaySession:(id)a3
{
}

- (unint64_t)entitlements
{
  return self->_entitlements;
}

- (MRPlaybackQueueClient)playbackQueueRequests
{
  return self->_playbackQueueRequests;
}

- (void).cxx_destruct
{
}

  ;
}

@end