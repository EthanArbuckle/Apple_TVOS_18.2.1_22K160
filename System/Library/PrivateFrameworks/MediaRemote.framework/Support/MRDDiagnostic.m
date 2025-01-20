@interface MRDDiagnostic
- (BOOL)groupSessionDiscoveryEnabled;
- (BOOL)isAdvertisingProximity;
- (BOOL)lockScreenWidgetActive;
- (BOOL)lockScreenWidgetVisible;
- (MRApplicationActivity)currentAppActivity;
- (MRDCommandClientRestriction)commandClientsRestriction;
- (MRDDiagnostic)init;
- (MRDMediaRemoteClient)daemonClient;
- (MRDMediaRemoteClient)frontmostClient;
- (MRDMediaRemoteClient)localNowPlayingClient;
- (MRDMediaRemoteClient)systemMediaClient;
- (MRDPreemptiveRemoteControlConnectionManager)automaticRemoteControlConnections;
- (MRDRemoteControlService)remoteControlService;
- (MRDVolumeController)volumeController;
- (MROrigin)activeOrigin;
- (MRPlayerPath)electedPlayer;
- (MRPlayerPath)lockScreenPlayerPath;
- (NSArray)activeClients;
- (NSArray)activeTransactions;
- (NSArray)autoConnectedEndpoints;
- (NSArray)autoConnectingEndpoints;
- (NSArray)connectedExternalDevices;
- (NSArray)discoveredGroupSessions;
- (NSArray)discoverySessions;
- (NSArray)endpoints;
- (NSArray)groupSessionAdvertiserEvents;
- (NSArray)hostedDiscoverySessions;
- (NSArray)immediateDevices;
- (NSArray)mediumDevices;
- (NSArray)migratingDevices;
- (NSArray)migrationEvents;
- (NSArray)nearbyDevices;
- (NSArray)notifiedGroupSessions;
- (NSArray)originClients;
- (NSArray)originForwarders;
- (NSArray)promptingDevices;
- (NSArray)queuedInitiatePlaybackMessages;
- (NSArray)recentlyDismissedSystemEndpoints;
- (NSArray)recordingEndpointClients;
- (NSArray)registeredVirtualAudioDevices;
- (NSArray)remoteControlContexts;
- (NSArray)televisionEndpoints;
- (NSArray)transactions;
- (NSDate)dateCreated;
- (NSDictionary)enqueuedCommands;
- (NSDictionary)hostedExternalDevices;
- (NSDictionary)systemActiveEndpoints;
- (NSDictionary)uiActivitiesInfo;
- (NSString)advertisingReasonDescription;
- (NSString)batchedNowPlayingState;
- (NSString)currentGroupSession;
- (NSString)discoverySession;
- (NSString)electedPlayerReason;
- (NSString)groupSessionAdvertiserState;
- (NSString)groupSessionAssertionManagerState;
- (NSString)groupSessionCoordinatorState;
- (NSString)groupSessionManagerAdvertiseReason;
- (NSString)localReceiverPairingIdentity;
- (NSString)mediaControlDiagnostic;
- (NSString)remoteASEState;
- (_MRAVAirPlaySecuritySettingsProtobuf)airplaySecuritySettings;
- (double)transactionWaitDuration;
- (id)createDiagnosticInfo;
- (unint64_t)allowedTransactionMemory;
- (unint64_t)usedTransactionMemory;
- (unsigned)hostedRouteDiscoveryMode;
- (unsigned)systemDiscoveryMode;
- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5;
- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6;
- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6 usingDebugDescription:(BOOL)a7;
- (void)_appendNullableObjectDescription:(id)a3 toString:(id)a4 withTitle:(id)a5;
- (void)_appendNullableObjectDescription:(id)a3 toString:(id)a4 withTitle:(id)a5 usingDebugDescription:(BOOL)a6;
- (void)_appendSubheader:(id)a3 toString:(id)a4;
- (void)setActiveClients:(id)a3;
- (void)setActiveOrigin:(id)a3;
- (void)setActiveTransactions:(id)a3;
- (void)setAdvertisingReasonDescription:(id)a3;
- (void)setAirplaySecuritySettings:(id)a3;
- (void)setAllowedTransactionMemory:(unint64_t)a3;
- (void)setAutoConnectedEndpoints:(id)a3;
- (void)setAutoConnectingEndpoints:(id)a3;
- (void)setAutomaticRemoteControlConnections:(id)a3;
- (void)setBatchedNowPlayingState:(id)a3;
- (void)setCommandClientsRestriction:(id)a3;
- (void)setConnectedExternalDevices:(id)a3;
- (void)setCurrentAppActivity:(id)a3;
- (void)setCurrentGroupSession:(id)a3;
- (void)setDaemonClient:(id)a3;
- (void)setDiscoveredGroupSessions:(id)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setDiscoverySessions:(id)a3;
- (void)setElectedPlayer:(id)a3;
- (void)setElectedPlayerReason:(id)a3;
- (void)setEndpoints:(id)a3;
- (void)setEnqueuedCommands:(id)a3;
- (void)setFrontmostClient:(id)a3;
- (void)setGroupSessionAdvertiserEvents:(id)a3;
- (void)setGroupSessionAdvertiserState:(id)a3;
- (void)setGroupSessionAssertionManagerState:(id)a3;
- (void)setGroupSessionCoordinatorState:(id)a3;
- (void)setGroupSessionDiscoveryEnabled:(BOOL)a3;
- (void)setGroupSessionManagerAdvertiseReason:(id)a3;
- (void)setHostedDiscoverySessions:(id)a3;
- (void)setHostedExternalDevices:(id)a3;
- (void)setHostedRouteDiscoveryMode:(unsigned int)a3;
- (void)setImmediateDevices:(id)a3;
- (void)setIsAdvertisingProximity:(BOOL)a3;
- (void)setLocalNowPlayingClient:(id)a3;
- (void)setLocalReceiverPairingIdentity:(id)a3;
- (void)setLockScreenPlayerPath:(id)a3;
- (void)setLockScreenWidgetActive:(BOOL)a3;
- (void)setLockScreenWidgetVisible:(BOOL)a3;
- (void)setMediaControlDiagnostic:(id)a3;
- (void)setMediumDevices:(id)a3;
- (void)setMigratingDevices:(id)a3;
- (void)setMigrationEvents:(id)a3;
- (void)setNearbyDevices:(id)a3;
- (void)setNotifiedGroupSessions:(id)a3;
- (void)setOriginClients:(id)a3;
- (void)setOriginForwarders:(id)a3;
- (void)setPromptingDevices:(id)a3;
- (void)setQueuedInitiatePlaybackMessages:(id)a3;
- (void)setRecentlyDismissedSystemEndpoints:(id)a3;
- (void)setRecordingEndpointClients:(id)a3;
- (void)setRegisteredVirtualAudioDevices:(id)a3;
- (void)setRemoteASEState:(id)a3;
- (void)setRemoteControlContexts:(id)a3;
- (void)setRemoteControlService:(id)a3;
- (void)setSystemActiveEndpoints:(id)a3;
- (void)setSystemDiscoveryMode:(unsigned int)a3;
- (void)setSystemMediaClient:(id)a3;
- (void)setTelevisionEndpoints:(id)a3;
- (void)setTransactionWaitDuration:(double)a3;
- (void)setTransactions:(id)a3;
- (void)setUiActivitiesInfo:(id)a3;
- (void)setUsedTransactionMemory:(unint64_t)a3;
- (void)setVolumeController:(id)a3;
@end

@implementation MRDDiagnostic

- (MRDDiagnostic)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRDDiagnostic;
  v2 = -[MRDDiagnostic init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSDate);
    dateCreated = v2->_dateCreated;
    v2->_dateCreated = v3;
  }

  return v2;
}

- (id)createDiagnosticInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendString:](v3, "appendString:", @"MediaRemote Diagnostic\n");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Collected at: %@\n", self->_dateCreated);
  -[NSMutableString appendString:]( v3,  "appendString:",  @"================================================================================\n\n");
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:indentLevel:usingDebugDescription:]( self,  "_appendDescribableArray:toString:withTitle:indentLevel:usingDebugDescription:",  self->_activeClients,  v3,  @"Active Clients",  0LL,  1LL);
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_activeTransactions,  v3,  @"Active Transactions");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_currentAppActivity,  v3,  @"Current App Activity");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_localNowPlayingClient,  v3,  @"Local Now Playing Client");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_systemMediaClient,  v3,  @"System Media Client");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_frontmostClient,  v3,  @"Frontmost Client");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_daemonClient,  v3,  @"Daemon Client");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:usingDebugDescription:]( self,  "_appendNullableObjectDescription:toString:withTitle:usingDebugDescription:",  self->_volumeController,  v3,  @"VolumeController",  1LL);
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"UI Server", v3);
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_uiActivitiesInfo,  v3,  @"UI Activities Info");
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"Now Playing Server", v3);
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:indentLevel:usingDebugDescription:]( self,  "_appendDescribableArray:toString:withTitle:indentLevel:usingDebugDescription:",  self->_originClients,  v3,  @"Origin Clients",  0LL,  1LL);
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_activeOrigin,  v3,  @"Active Origin");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_electedPlayer,  v3,  @"Elected Player");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_electedPlayerReason,  v3,  @"Elected Player Reason");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_lockScreenWidgetActive));
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  v4,  v3,  @"LockScreen Widget Active");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_lockScreenWidgetActive));
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  v5,  v3,  @"LockScreen Widget Visible");

  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_lockScreenPlayerPath,  v3,  @"LockScreen Widget PlayerPath");
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_originForwarders,  v3,  @"Origin Forwarders");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"Remote Control Server", v3);
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_enqueuedCommands,  v3,  @"Enqueued Commands");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_remoteControlContexts,  v3,  @"Remote Control Contexts");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_commandClientsRestriction,  v3,  @"RestrictedCommandClient Mode Restriction");
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"Browsable Content Server", v3);
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_queuedInitiatePlaybackMessages,  v3,  @"Queued Initiate Playback Messages");
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"External Device Server", v3);
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:indentLevel:usingDebugDescription:]( self,  "_appendDescribableArray:toString:withTitle:indentLevel:usingDebugDescription:",  self->_connectedExternalDevices,  v3,  @"Connected Devices",  0LL,  1LL);
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_televisionEndpoints,  v3,  @"Television Endpoints");
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:usingDebugDescription:]( self,  "_appendNullableObjectDescription:toString:withTitle:usingDebugDescription:",  self->_discoverySessions,  v3,  @"External Discovery Sessions",  0LL);
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:usingDebugDescription:]( self,  "_appendNullableObjectDescription:toString:withTitle:usingDebugDescription:",  self->_remoteControlService,  v3,  @"RemoteControlService",  1LL);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:usingDebugDescription:]( self,  "_appendNullableObjectDescription:toString:withTitle:usingDebugDescription:",  v6,  v3,  @"LocalEndpoint",  1LL);

  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDAVOutputContextManager sharedManager](&OBJC_CLASS___MRDAVOutputContextManager, "sharedManager"));
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:usingDebugDescription:]( self,  "_appendNullableObjectDescription:toString:withTitle:usingDebugDescription:",  v7,  v3,  @"OutputContexts",  1LL);

  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:usingDebugDescription:]( self,  "_appendNullableObjectDescription:toString:withTitle:usingDebugDescription:",  self->_batchedNowPlayingState,  v3,  @"BatchedNowPlayingState",  0LL);
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:usingDebugDescription:]( self,  "_appendNullableObjectDescription:toString:withTitle:usingDebugDescription:",  self->_remoteASEState,  v3,  @"RemoteASEState",  0LL);
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"Routing Server", v3);
  v9 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(self->_systemDiscoveryMode, v8);
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  v9,  v3,  @"System Discovery Mode (Legacy)");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MRAVAirPlaySecuritySettingsProtobuf description](self->_airplaySecuritySettings, "description"));
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  v10,  v3,  @"AirPlay Security Settings");

  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_localReceiverPairingIdentity,  v3,  @"Local Receiver Pairing Identity");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_systemActiveEndpoints,  v3,  @"System Active Endpoints");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_recentlyDismissedSystemEndpoints,  v3,  @"Recently Dissmised Recommendations");
  if (-[NSArray count](self->_autoConnectedEndpoints, "count")) {
    -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_autoConnectingEndpoints,  v3,  @"Auto Connecting Endpoints");
  }
  if (-[NSArray count](self->_autoConnectedEndpoints, "count")) {
    -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_autoConnectedEndpoints,  v3,  @"Auto Connected Endpoints");
  }
  if (-[NSArray count](self->_migrationEvents, "count")) {
    -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_migrationEvents,  v3,  @"Proximity Events");
  }
  if (-[NSArray count](self->_nearbyDevices, "count")) {
    -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_nearbyDevices,  v3,  @"Nearby Devices");
  }
  if (-[NSArray count](self->_mediumDevices, "count")) {
    -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_mediumDevices,  v3,  @"Medium Devices");
  }
  if (-[NSArray count](self->_immediateDevices, "count")) {
    -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_immediateDevices,  v3,  @"Immediate Devices");
  }
  if (-[NSArray count](self->_migratingDevices, "count")) {
    -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_migratingDevices,  v3,  @"Proximal Migrating Devices");
  }
  automaticRemoteControlConnections = self->_automaticRemoteControlConnections;
  if (automaticRemoteControlConnections) {
    -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:usingDebugDescription:]( self,  "_appendNullableObjectDescription:toString:withTitle:usingDebugDescription:",  automaticRemoteControlConnections,  v3,  @"Preemptive RemoteControl Connections",  1LL);
  }
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"Hosted Routing", v3);
  v13 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(self->_hostedRouteDiscoveryMode, v12);
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  v13,  v3,  @"Hosted Discovery Mode");

  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:indentLevel:usingDebugDescription:]( self,  "_appendDescribableArray:toString:withTitle:indentLevel:usingDebugDescription:",  self->_hostedDiscoverySessions,  v3,  @"Discovery Sessions",  0LL,  1LL);
  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  -[NSMutableString appendString:](v3, "appendString:", @"Endpoints:\n");
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSDictionary count](self->_hostedExternalDevices, "count")));
  endpoints = self->_endpoints;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1000F1078;
  v51[3] = &unk_1003A0700;
  id v16 = v14;
  id v52 = v16;
  v53 = self;
  v17 = v3;
  v54 = v17;
  -[NSArray enumerateObjectsUsingBlock:](endpoints, "enumerateObjectsUsingBlock:", v51);
  id v18 = -[NSDictionary mutableCopy](self->_hostedExternalDevices, "mutableCopy");
  v42 = v16;
  [v18 removeObjectsForKeys:v16];
  if ([v18 count])
  {
    -[NSMutableString appendString:](v17, "appendString:", @"Remaining External Devices\n");
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_1000F11C0;
    v48[3] = &unk_1003A0728;
    v19 = v17;
    v49 = v19;
    v50 = self;
    [v18 enumerateKeysAndObjectsUsingBlock:v48];
    -[NSMutableString appendString:](v19, "appendString:", @"\n");
  }

  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:usingDebugDescription:]( self,  "_appendNullableObjectDescription:toString:withTitle:usingDebugDescription:",  self->_discoverySession,  v17,  @"Concrete Discovery Session",  1LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v21 = [v20 supportMultiplayerHost];

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MRDStreamCapacityManager sharedManager](&OBJC_CLASS___MRDStreamCapacityManager, "sharedManager"));
    -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:usingDebugDescription:]( self,  "_appendNullableObjectDescription:toString:withTitle:usingDebugDescription:",  v22,  v17,  @"Stream Count",  1LL);
  }

  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"Virtual Audio Server", v17);
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_recordingEndpointClients,  v17,  @"Recording Endpoint Clients");
  -[NSMutableString appendString:](v17, "appendString:", @"\n");
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_registeredVirtualAudioDevices,  v17,  @"Registered Virtual Audio Devices");
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"Transaction Server", v17);
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  self->_transactions,  v17,  @"Transactions");
  -[NSMutableString appendString:](v17, "appendString:", @"\n");
  -[NSMutableString appendFormat:]( v17,  "appendFormat:",  @"Used Transaction Memory: %llu bytes\n",  self->_usedTransactionMemory);
  -[NSMutableString appendFormat:]( v17,  "appendFormat:",  @"Allowed Transaction Memory: %llu bytes\n",  self->_allowedTransactionMemory);
  -[NSMutableString appendFormat:]( v17,  "appendFormat:",  @"Transaction Wait Duration: %f seconds\n",  *(void *)&self->_transactionWaitDuration);
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"Group Sessions", v17);
  groupSessionAssertionManagerState = self->_groupSessionAssertionManagerState;
  if (groupSessionAssertionManagerState) {
    -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  groupSessionAssertionManagerState,  v17,  @"Assertion manager state");
  }
  v41 = v18;
  -[NSMutableString appendString:](v17, "appendString:", @"\n");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_currentGroupSession,  v17,  @"Current group session");
  -[NSMutableString appendString:](v17, "appendString:", @"\n");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_groupSessionManagerAdvertiseReason,  v17,  @"Advertiser reason");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_groupSessionAdvertiserState,  v17,  @"Advertiser state");
  -[MRDDiagnostic _appendDescribableArray:toString:withTitle:indentLevel:]( self,  "_appendDescribableArray:toString:withTitle:indentLevel:",  self->_groupSessionAdvertiserEvents,  v17,  @"Advertiser log history",  1LL);
  -[NSMutableString appendString:](v17, "appendString:", @"\n");
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_groupSessionDiscoveryEnabled));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stringValue]);
  -[NSMutableString appendFormat:](v17, "appendFormat:", @"GroupSession discovery enabled: %@\n", v25);

  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_discoveredGroupSessions,  v17,  @"Discovered group sessions");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_notifiedGroupSessions,  v17,  @"Notified group sessions");
  -[NSMutableString appendString:](v17, "appendString:", @"\n");
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  self->_groupSessionCoordinatorState,  v17,  @"Coordinator state");
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"Companion Link", v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedCompanionLinkClient"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 companionLinkDevices]);

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v27;
  id v28 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(obj);
        }
        v55 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        v32 = v55;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v32 mediaRouteIdentifier]);
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RPDevice<routeID: %@>",  v34));
        -[MRDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  v33,  v17,  v35);

        v36 = (void *)objc_claimAutoreleasedReturnValue([v32 homeKitUserIdentifiers]);
        -[MRDDiagnostic _appendDescribableArray:toString:withTitle:]( self,  "_appendDescribableArray:toString:withTitle:",  v36,  v17,  @"Home Users");

        -[NSMutableString appendString:](v17, "appendString:", @"\n");
      }

      id v29 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
    }

    while (v29);
  }

  -[MRDDiagnostic _appendSubheader:toString:]( self,  "_appendSubheader:toString:",  @"MediaRemote User defaults",  v17);
  v37 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mediaremote");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryRepresentation](v37, "dictionaryRepresentation"));
  -[MRDDiagnostic _appendNullableObjectDescription:toString:withTitle:]( self,  "_appendNullableObjectDescription:toString:withTitle:",  v38,  v17,  @"UserDefaults");
  -[NSMutableString appendString:](v17, "appendString:", @"\n");
  -[MRDDiagnostic _appendSubheader:toString:](self, "_appendSubheader:toString:", @"Media Control", v17);
  -[NSMutableString appendString:](v17, "appendString:", self->_mediaControlDiagnostic);
  v39 = (void *)MRDiagnosticCreate(self->_dateCreated, v17);

  return v39;
}

- (void)_appendSubheader:(id)a3 toString:(id)a4
{
}

- (void)_appendNullableObjectDescription:(id)a3 toString:(id)a4 withTitle:(id)a5
{
}

- (void)_appendNullableObjectDescription:(id)a3 toString:(id)a4 withTitle:(id)a5 usingDebugDescription:(BOOL)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v13)
  {
    if (a6) {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v13 debugDescription]);
    }
    else {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v13 description]);
    }
    uint64_t v12 = (__CFString *)v11;
  }

  else
  {
    uint64_t v12 = @"(None)";
  }

  [v9 appendFormat:@"%@: %@\n", v10, v12];
}

- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5
{
}

- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6
{
}

- (void)_appendDescribableArray:(id)a3 toString:(id)a4 withTitle:(id)a5 indentLevel:(unsigned int)a6 usingDebugDescription:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  for (i = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
        a6;
        --a6)
  {
    [i appendString:@"    "];
  }

  [v12 appendFormat:@"%@%@:", i, v13];
  if ([v11 count])
  {
    id v23 = v13;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v15 = v11;
    id v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        v19 = 0LL;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v19);
          if (v7) {
            uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 debugDescription]);
          }
          else {
            uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 description]);
          }
          v22 = (void *)v21;
          [v12 appendFormat:@"\n%@%@", i, v21];

          v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v17);
    }

    id v13 = v23;
  }

  else
  {
    [v12 appendFormat:@"\n%@(None)", i];
  }

  [v12 appendString:@"\n"];
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSArray)activeClients
{
  return self->_activeClients;
}

- (void)setActiveClients:(id)a3
{
}

- (NSArray)activeTransactions
{
  return self->_activeTransactions;
}

- (void)setActiveTransactions:(id)a3
{
}

- (MRApplicationActivity)currentAppActivity
{
  return self->_currentAppActivity;
}

- (void)setCurrentAppActivity:(id)a3
{
}

- (MRDMediaRemoteClient)localNowPlayingClient
{
  return self->_localNowPlayingClient;
}

- (void)setLocalNowPlayingClient:(id)a3
{
}

- (MRDMediaRemoteClient)systemMediaClient
{
  return self->_systemMediaClient;
}

- (void)setSystemMediaClient:(id)a3
{
}

- (MRDMediaRemoteClient)frontmostClient
{
  return self->_frontmostClient;
}

- (void)setFrontmostClient:(id)a3
{
}

- (MRDMediaRemoteClient)daemonClient
{
  return self->_daemonClient;
}

- (void)setDaemonClient:(id)a3
{
}

- (MRDVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
}

- (NSArray)originClients
{
  return self->_originClients;
}

- (void)setOriginClients:(id)a3
{
}

- (MROrigin)activeOrigin
{
  return self->_activeOrigin;
}

- (void)setActiveOrigin:(id)a3
{
}

- (MRPlayerPath)electedPlayer
{
  return self->_electedPlayer;
}

- (void)setElectedPlayer:(id)a3
{
}

- (NSString)electedPlayerReason
{
  return self->_electedPlayerReason;
}

- (void)setElectedPlayerReason:(id)a3
{
}

- (BOOL)lockScreenWidgetActive
{
  return self->_lockScreenWidgetActive;
}

- (void)setLockScreenWidgetActive:(BOOL)a3
{
  self->_lockScreenWidgetActive = a3;
}

- (BOOL)lockScreenWidgetVisible
{
  return self->_lockScreenWidgetVisible;
}

- (void)setLockScreenWidgetVisible:(BOOL)a3
{
  self->_lockScreenWidgetVisible = a3;
}

- (MRPlayerPath)lockScreenPlayerPath
{
  return self->_lockScreenPlayerPath;
}

- (void)setLockScreenPlayerPath:(id)a3
{
}

- (NSArray)originForwarders
{
  return self->_originForwarders;
}

- (void)setOriginForwarders:(id)a3
{
}

- (NSDictionary)enqueuedCommands
{
  return self->_enqueuedCommands;
}

- (void)setEnqueuedCommands:(id)a3
{
}

- (NSArray)remoteControlContexts
{
  return self->_remoteControlContexts;
}

- (void)setRemoteControlContexts:(id)a3
{
}

- (MRDCommandClientRestriction)commandClientsRestriction
{
  return self->_commandClientsRestriction;
}

- (void)setCommandClientsRestriction:(id)a3
{
}

- (NSArray)queuedInitiatePlaybackMessages
{
  return self->_queuedInitiatePlaybackMessages;
}

- (void)setQueuedInitiatePlaybackMessages:(id)a3
{
}

- (NSArray)connectedExternalDevices
{
  return self->_connectedExternalDevices;
}

- (void)setConnectedExternalDevices:(id)a3
{
}

- (NSArray)televisionEndpoints
{
  return self->_televisionEndpoints;
}

- (void)setTelevisionEndpoints:(id)a3
{
}

- (NSArray)discoverySessions
{
  return self->_discoverySessions;
}

- (void)setDiscoverySessions:(id)a3
{
}

- (MRDRemoteControlService)remoteControlService
{
  return self->_remoteControlService;
}

- (void)setRemoteControlService:(id)a3
{
}

- (NSString)batchedNowPlayingState
{
  return self->_batchedNowPlayingState;
}

- (void)setBatchedNowPlayingState:(id)a3
{
}

- (NSString)remoteASEState
{
  return self->_remoteASEState;
}

- (void)setRemoteASEState:(id)a3
{
}

- (unsigned)systemDiscoveryMode
{
  return self->_systemDiscoveryMode;
}

- (void)setSystemDiscoveryMode:(unsigned int)a3
{
  self->_systemDiscoveryMode = a3;
}

- (_MRAVAirPlaySecuritySettingsProtobuf)airplaySecuritySettings
{
  return self->_airplaySecuritySettings;
}

- (void)setAirplaySecuritySettings:(id)a3
{
}

- (NSString)localReceiverPairingIdentity
{
  return self->_localReceiverPairingIdentity;
}

- (void)setLocalReceiverPairingIdentity:(id)a3
{
}

- (NSDictionary)systemActiveEndpoints
{
  return self->_systemActiveEndpoints;
}

- (void)setSystemActiveEndpoints:(id)a3
{
}

- (NSArray)recentlyDismissedSystemEndpoints
{
  return self->_recentlyDismissedSystemEndpoints;
}

- (void)setRecentlyDismissedSystemEndpoints:(id)a3
{
}

- (NSArray)autoConnectedEndpoints
{
  return self->_autoConnectedEndpoints;
}

- (void)setAutoConnectedEndpoints:(id)a3
{
}

- (NSArray)autoConnectingEndpoints
{
  return self->_autoConnectingEndpoints;
}

- (void)setAutoConnectingEndpoints:(id)a3
{
}

- (NSArray)migrationEvents
{
  return self->_migrationEvents;
}

- (void)setMigrationEvents:(id)a3
{
}

- (NSArray)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
}

- (NSArray)mediumDevices
{
  return self->_mediumDevices;
}

- (void)setMediumDevices:(id)a3
{
}

- (NSArray)promptingDevices
{
  return self->_promptingDevices;
}

- (void)setPromptingDevices:(id)a3
{
}

- (NSArray)immediateDevices
{
  return self->_immediateDevices;
}

- (void)setImmediateDevices:(id)a3
{
}

- (NSArray)migratingDevices
{
  return self->_migratingDevices;
}

- (void)setMigratingDevices:(id)a3
{
}

- (BOOL)isAdvertisingProximity
{
  return self->_isAdvertisingProximity;
}

- (void)setIsAdvertisingProximity:(BOOL)a3
{
  self->_isAdvertisingProximity = a3;
}

- (NSString)advertisingReasonDescription
{
  return self->_advertisingReasonDescription;
}

- (void)setAdvertisingReasonDescription:(id)a3
{
}

- (MRDPreemptiveRemoteControlConnectionManager)automaticRemoteControlConnections
{
  return self->_automaticRemoteControlConnections;
}

- (void)setAutomaticRemoteControlConnections:(id)a3
{
}

- (unsigned)hostedRouteDiscoveryMode
{
  return self->_hostedRouteDiscoveryMode;
}

- (void)setHostedRouteDiscoveryMode:(unsigned int)a3
{
  self->_hostedRouteDiscoveryMode = a3;
}

- (NSArray)hostedDiscoverySessions
{
  return self->_hostedDiscoverySessions;
}

- (void)setHostedDiscoverySessions:(id)a3
{
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
}

- (NSDictionary)hostedExternalDevices
{
  return self->_hostedExternalDevices;
}

- (void)setHostedExternalDevices:(id)a3
{
}

- (NSString)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
}

- (NSArray)recordingEndpointClients
{
  return self->_recordingEndpointClients;
}

- (void)setRecordingEndpointClients:(id)a3
{
}

- (NSArray)registeredVirtualAudioDevices
{
  return self->_registeredVirtualAudioDevices;
}

- (void)setRegisteredVirtualAudioDevices:(id)a3
{
}

- (NSArray)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (unint64_t)usedTransactionMemory
{
  return self->_usedTransactionMemory;
}

- (void)setUsedTransactionMemory:(unint64_t)a3
{
  self->_usedTransactionMemory = a3;
}

- (unint64_t)allowedTransactionMemory
{
  return self->_allowedTransactionMemory;
}

- (void)setAllowedTransactionMemory:(unint64_t)a3
{
  self->_allowedTransactionMemory = a3;
}

- (double)transactionWaitDuration
{
  return self->_transactionWaitDuration;
}

- (void)setTransactionWaitDuration:(double)a3
{
  self->_transactionWaitDuration = a3;
}

- (NSDictionary)uiActivitiesInfo
{
  return self->_uiActivitiesInfo;
}

- (void)setUiActivitiesInfo:(id)a3
{
}

- (NSString)currentGroupSession
{
  return self->_currentGroupSession;
}

- (void)setCurrentGroupSession:(id)a3
{
}

- (NSString)groupSessionManagerAdvertiseReason
{
  return self->_groupSessionManagerAdvertiseReason;
}

- (void)setGroupSessionManagerAdvertiseReason:(id)a3
{
}

- (NSString)groupSessionAdvertiserState
{
  return self->_groupSessionAdvertiserState;
}

- (void)setGroupSessionAdvertiserState:(id)a3
{
}

- (NSArray)groupSessionAdvertiserEvents
{
  return self->_groupSessionAdvertiserEvents;
}

- (void)setGroupSessionAdvertiserEvents:(id)a3
{
}

- (BOOL)groupSessionDiscoveryEnabled
{
  return self->_groupSessionDiscoveryEnabled;
}

- (void)setGroupSessionDiscoveryEnabled:(BOOL)a3
{
  self->_groupSessionDiscoveryEnabled = a3;
}

- (NSArray)discoveredGroupSessions
{
  return self->_discoveredGroupSessions;
}

- (void)setDiscoveredGroupSessions:(id)a3
{
}

- (NSArray)notifiedGroupSessions
{
  return self->_notifiedGroupSessions;
}

- (void)setNotifiedGroupSessions:(id)a3
{
}

- (NSString)groupSessionCoordinatorState
{
  return self->_groupSessionCoordinatorState;
}

- (void)setGroupSessionCoordinatorState:(id)a3
{
}

- (NSString)groupSessionAssertionManagerState
{
  return self->_groupSessionAssertionManagerState;
}

- (void)setGroupSessionAssertionManagerState:(id)a3
{
}

- (NSString)mediaControlDiagnostic
{
  return self->_mediaControlDiagnostic;
}

- (void)setMediaControlDiagnostic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end