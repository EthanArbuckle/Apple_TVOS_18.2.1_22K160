@interface IDSUTunPeer
- (BOOL)_allCloudConnectionsAreIdle;
- (BOOL)_allConnectionsAreIdle;
- (BOOL)_messageTypeSupportedForCloudConnection:(int64_t)a3;
- (BOOL)_shouldLogTransportStats;
- (BOOL)hasSpaceForMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4 messageType:(int64_t)a5;
- (BOOL)isClassCConnected;
- (BOOL)isCloudConnected;
- (BOOL)isConnected;
- (BOOL)isDefaultPairedDevice;
- (BOOL)isMagnetIndicatingPeerIsAwake;
- (BOOL)isNearby;
- (BOOL)isPeerAlwaysConnected;
- (BOOL)localSetupInProgress;
- (BOOL)manager:(id)a3 cbuuidDidDiscover:(id)a4;
- (BOOL)pendingCloudEnable;
- (BOOL)sendAckForMessageWithSequenceNumber:(unsigned int)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 connectionType:(int64_t)a6;
- (BOOL)supportsCloudConnections;
- (IDSUTunPeer)initWithIdentifier:(id)a3 btUUID:(id)a4 uniqueID:(id)a5 shouldUseIPsecLink:(BOOL)a6 isNearby:(BOOL)a7 isClassCConnected:(BOOL)a8;
- (IDSUTunPeerDelegate)delegate;
- (NSDictionary)defaultPriorityMessageStatistics;
- (NSDictionary)sendingMessageStatistics;
- (NSDictionary)syncPriorityMessageStatistics;
- (NSDictionary)urgentCloudPriorityMessageStatistics;
- (NSDictionary)urgentPriorityMessageStatistics;
- (NSString)btUUID;
- (NSString)identifier;
- (NSString)originalbtUUID;
- (NSString)uniqueID;
- (id)_connectionForPriority:(int64_t)a3 messageType:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
- (id)_copyPowerlogDictionaryWithOutgoingStats:(id)a3 incomingStats:(id)a4;
- (id)_copyStatisticsDict:(id)a3;
- (id)createConnectionWithIdentifier:(id)a3 priority:(int64_t)a4 shouldUseIPsecLink:(BOOL)a5 dataProtectionClass:(unsigned int)a6;
- (id)defaultCloudPriorityMessageStatistics;
- (id)rapportClient;
- (id)syncCloudPriorityMessageStatistics;
- (int)continuityConnectCount;
- (int64_t)_connectionTypeForConnection:(id)a3;
- (int64_t)_priorityForConnection:(id)a3;
- (os_unfair_lock_s)emptyStatesLock;
- (unsigned)linkType;
- (void)_accumulateStats:(id)a3 intoMessages:(unint64_t *)a4 andBytes:(unint64_t *)a5;
- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4;
- (void)_checkServicesPreferringInfraWiFi:(unsigned int)a3;
- (void)_clearCloudDisableTimer;
- (void)_clearDisableTimer;
- (void)_cloudDisableTimerFired:(id)a3;
- (void)_disableTimerFired:(id)a3;
- (void)_handleCBUUIDDidConnect:(id)a3 isDefaultPairedDevice:(BOOL)a4 isAlwaysConnected:(BOOL)a5;
- (void)_handleCBUUIDFailToConnect:(id)a3 withReason:(id)a4;
- (void)_powerLogServices:(id)a3 prefersInfraWifi:(BOOL)a4;
- (void)_powerlogDictionaryForPriority:(int64_t)a3;
- (void)_powerlogDictionaryForSockets;
- (void)_powerlogTransportStats;
- (void)_startCloudDisableTimerIfNecessary;
- (void)_startDisableTimerIfNecessary;
- (void)_startPowerLogTimersForAllPriorities;
- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4;
- (void)cancelMessageID:(id)a3;
- (void)clearStats;
- (void)connection:(id)a3 connectivityChanged:(BOOL)a4;
- (void)connection:(id)a3 dataReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14;
- (void)connection:(id)a3 messageReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14;
- (void)connection:(id)a3 protobufReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14;
- (void)connection:(id)a3 receivedAppLevelAckWithTopic:(id)a4 fromID:(id)a5 messageID:(id)a6 peerResponseIdentifier:(id)a7;
- (void)connectionHasSpaceForMessages:(id)a3 dataProtectionClass:(unsigned int)a4;
- (void)connectionIsEmpty:(id)a3;
- (void)connectionIsEmptyOfCloudMessages:(id)a3;
- (void)dealloc;
- (void)disableCloudConnectionForReason:(int64_t)a3;
- (void)disableConnectionForReason:(int64_t)a3 shouldWait:(BOOL)a4;
- (void)dropDisallowedMessages;
- (void)enableCloudConnection;
- (void)enableConnection;
- (void)forceOTRNegotiationForTopic:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5;
- (void)kickProgressBlockForMessageID:(id)a3;
- (void)logCurrentTransportStatsAndResetTimers;
- (void)manager:(id)a3 cbuuidDidConnect:(id)a4 isAlwaysConnected:(BOOL)a5;
- (void)manager:(id)a3 cbuuidDidDisconnect:(id)a4;
- (void)manager:(id)a3 cbuuidDidFailToConnect:(id)a4 withReason:(id)a5;
- (void)performBlock:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
- (void)performBlockForAllConnections:(id)a3;
- (void)performBlockForDirectConnections:(id)a3;
- (void)performBlockSynchronouslyForAllConnections:(id)a3;
- (void)sendMessage:(id)a3 priority:(int64_t)a4 messageType:(int64_t)a5;
- (void)setBtUUID:(id)a3;
- (void)setContinuityConnectCount:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setEmptyStatesLock:(os_unfair_lock_s)a3;
- (void)setEnableOTR:(BOOL)a3;
- (void)setIsClassCConnected:(BOOL)a3;
- (void)setIsCloudConnected:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsDefaultPairedDevice:(BOOL)a3;
- (void)setIsMagnetIndicatingPeerIsAwake:(BOOL)a3;
- (void)setIsNearby:(BOOL)a3;
- (void)setIsPeerAlwaysConnected:(BOOL)a3;
- (void)setLinkPreferences:(id)a3;
- (void)setLinkType:(unsigned __int8)a3;
- (void)setLocalSetupInProgress:(BOOL)a3;
- (void)setOriginalbtUUID:(id)a3;
- (void)setPendingCloudEnable:(BOOL)a3;
- (void)setPreferInfraWiFi:(BOOL)a3 services:(id)a4;
- (void)setSupportsCloudConnections:(BOOL)a3;
- (void)setUniqueID:(id)a3;
- (void)trafficClassesChanged;
- (void)unpairStart;
@end

@implementation IDSUTunPeer

- (id)createConnectionWithIdentifier:(id)a3 priority:(int64_t)a4 shouldUseIPsecLink:(BOOL)a5 dataProtectionClass:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  switch(a4)
  {
    case 100LL:
      v11 = @"-Sync";
      uint64_t v12 = 100LL;
      v13 = @"sync";
      break;
    case 300LL:
      v11 = @"-Urgent";
      uint64_t v12 = 300LL;
      v13 = @"urgent";
      break;
    case 200LL:
      v11 = @"-Default";
      uint64_t v12 = 200LL;
      v13 = @"default";
      break;
    default:
      throwsIDSAbortException();
      uint64_t v12 = 0LL;
      v13 = 0LL;
      v11 = 0LL;
      break;
  }

  if (v6 > 2)
  {
    v14 = &stru_100912B50;
  }

  else
  {
    v14 = off_1008F8118[(int)v6];
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v14));
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v10,  v11,  v14));
  v24 = v10;
  BOOL v16 = a5;
  BYTE1(v22) = a5;
  LOBYTE(v22) = 0;
  v17 = -[IDSUTunConnection initWithIdentifier:socketPriority:btUUID:uniqueID:incomingServiceMap:outgoingServiceMap:isCloudEnabled:shouldUseIPsecLink:]( objc_alloc(&OBJC_CLASS___IDSUTunConnection),  "initWithIdentifier:socketPriority:btUUID:uniqueID:incomingServiceMap:outgoingServiceMap:isCloudEnabled:shouldUseIPsecLink:",  v15,  v12,  self->_btUUID,  self->_uniqueID,  self->_incomingServiceMap,  self->_outgoingServiceMap,  v22);
  -[IDSUTunConnection setSupportsLegacyOTRSessionToken:](v17, "setSupportsLegacyOTRSessionToken:", 1LL);
  -[IDSUTunConnection setMaxQueueSize:](v17, "setMaxQueueSize:", 5242880LL);
  -[IDSUTunConnection setDelegate:](v17, "setDelegate:", self);
  -[IDSUTunConnection setSupportedMessageTypes:](v17, "setSupportedMessageTypes:", &off_100948700);
  -[IDSUTunConnection setIdsPriority:](v17, "setIdsPriority:", a4);
  -[IDSUTunConnection setDataProtectionClass:](v17, "setDataProtectionClass:", v6);
  -[IDSUTunConnection setName:](v17, "setName:", v13);
  if (a4 == 300 || a4 == 200)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@Cloud%@",  v24,  v11,  v14));
    BYTE1(v23) = v16;
    LOBYTE(v23) = 1;
    v19 = -[IDSUTunConnection initWithIdentifier:socketPriority:btUUID:uniqueID:incomingServiceMap:outgoingServiceMap:isCloudEnabled:shouldUseIPsecLink:]( objc_alloc(&OBJC_CLASS___IDSUTunConnection),  "initWithIdentifier:socketPriority:btUUID:uniqueID:incomingServiceMap:outgoingServiceMap:isCloudEnabled:shouldUseIPsecLink:",  v18,  v12,  self->_btUUID,  self->_uniqueID,  self->_incomingServiceMap,  self->_outgoingServiceMap,  v23);
    -[IDSUTunConnection setSupportsLegacyOTRSessionToken:](v19, "setSupportsLegacyOTRSessionToken:", 0LL);
    -[IDSUTunConnection setMaxQueueSize:](v19, "setMaxQueueSize:", 0x200000LL);
    -[IDSUTunConnection setDelegate:](v19, "setDelegate:", self);
    -[IDSUTunConnection setSupportedMessageTypes:](v19, "setSupportedMessageTypes:", &off_100948718);
    -[IDSUTunConnection setCloudConnection:](v17, "setCloudConnection:", v19);
    -[IDSUTunConnection setIdsPriority:](v19, "setIdsPriority:", a4);
    -[IDSUTunConnection setDataProtectionClass:](v19, "setDataProtectionClass:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v13, "stringByAppendingString:", @" Cloud"));
    -[IDSUTunConnection setName:](v19, "setName:", v20);
  }

  return v17;
}

- (IDSUTunPeer)initWithIdentifier:(id)a3 btUUID:(id)a4 uniqueID:(id)a5 shouldUseIPsecLink:(BOOL)a6 isNearby:(BOOL)a7 isClassCConnected:(BOOL)a8
{
  BOOL v9 = a6;
  v13 = (__CFString *)a3;
  id v92 = a4;
  id v14 = a5;
  v95.receiver = self;
  v95.super_class = (Class)&OBJC_CLASS___IDSUTunPeer;
  v15 = -[IDSUTunPeer init](&v95, "init");
  if (v15)
  {
    v15->_isDefaultPairedDevice = [v14 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];
    BOOL v16 = (NSString *)-[__CFString copy](v13, "copy");
    identifier = v15->_identifier;
    v15->_identifier = v16;

    v18 = (NSString *)[v14 copy];
    uniqueID = v15->_uniqueID;
    v15->_uniqueID = v18;

    v15->_isMagnetIndicatingPeerIsAwake = 1;
    v15->_shouldUseIPsecLink = v9;
    v15->_emptyStatesLock._os_unfair_lock_opaque = 0;
    if (v9) {
      v15->_isNearby = a7;
    }
    if (!v15->_isDefaultPairedDevice)
    {
      v20 = (NSString *)[v92 copy];
      btUUID = v15->_btUUID;
      v15->_btUUID = v20;

      v15->_supportsCloudConnections = 1;
    }

    uint64_t v22 = IMGetDomainValueForKey(@"com.apple.ids", @"PipePeripheralUUID");
    v91 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v15->_waitForDefaultPairedDevice = 0;
    if (v15->_isDefaultPairedDevice)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
      [v23 prepareDefaultPairedConnectionInfoWithDeviceUniqueID:v14 shouldUseIPsecLink:v9];

      v15->_waitForDefaultPairedDevice = 1;
    }

    uint64_t v24 = OSLogHandleForIDSCategory("UTunPeer");
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v105 = v15;
      __int16 v106 = 2112;
      v107 = v13;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Initing IDSUTunPeer %p %@", buf, 0x16u);
    }

    uint64_t v27 = OSLogHandleForIDSCategory("UTunPeer");
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = @"YES";
      if (v15->_isDefaultPairedDevice) {
        v30 = @"YES";
      }
      else {
        v30 = @"NO";
      }
      if (v15->_waitForDefaultPairedDevice) {
        v31 = @"YES";
      }
      else {
        v31 = @"NO";
      }
      v32 = v15->_btUUID;
      v33 = v15->_uniqueID;
      if (!v9) {
        v29 = @"NO";
      }
      *(_DWORD *)buf = 138413570;
      v105 = (IDSUTunPeer *)v32;
      __int16 v106 = 2112;
      v107 = v30;
      __int16 v108 = 2112;
      v109 = v91;
      __int16 v110 = 2112;
      v111 = v31;
      __int16 v112 = 2112;
      v113 = v33;
      __int16 v114 = 2112;
      v115 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "btuuid %@ isDefaultPairedDevice: %@ pipePeripheralUUIDString: %@ waitForDefaultPairedDevice: %@ uniqueID %@ shou ldUseIPsecLink: %@",  buf,  0x3Eu);
    }

    if (os_log_shim_legacy_logging_enabled(v34) && _IDSShouldLog(0LL, @"UTunPeer")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"btuuid %@ isDefaultPairedDevice: %@ pipePeripheralUUIDString: %@ waitForDefaultPairedDevice: %@ uniqueID %@ shouldUseIPsecLink: %@");
    }
    v35 = objc_alloc(&OBJC_CLASS___IDSUTunPeerServiceMap);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"incoming:%@",  v15->_btUUID));
    v37 = -[IDSUTunPeerServiceMap initWithName:](v35, "initWithName:", v36);
    incomingServiceMap = v15->_incomingServiceMap;
    v15->_incomingServiceMap = v37;

    v39 = objc_alloc(&OBJC_CLASS___IDSUTunPeerServiceMap);
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"outgoing:%@",  v15->_btUUID));
    v41 = -[IDSUTunPeerServiceMap initWithName:](v39, "initWithName:", v40);
    outgoingServiceMap = v15->_outgoingServiceMap;
    v15->_outgoingServiceMap = v41;

    v43 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    connectedStates = v15->_connectedStates;
    v15->_connectedStates = v43;

    v45 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    emptyStates = v15->_emptyStates;
    v15->_emptyStates = v45;

    if (v9)
    {
      v47 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:]( v15,  "createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:",  v13,  300LL,  1LL,  0LL));
      v48 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:]( v15,  "createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:",  v13,  300LL,  1LL,  2LL));
      v49 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:]( v15,  "createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:",  v13,  200LL,  1LL,  0LL));
      v50 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:]( v15,  "createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:",  v13,  200LL,  1LL,  2LL));
      v51 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:]( v15,  "createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:",  v13,  100LL,  1LL,  0LL));
      v52 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:]( v15,  "createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:",  v13,  100LL,  1LL,  2LL));
      v99[0] = v47;
      v99[1] = v48;
      v99[2] = v49;
      v99[3] = v50;
      v99[4] = v51;
      v99[5] = v52;
      uint64_t v53 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v99, 6LL));
      directConnections = v15->_directConnections;
      v15->_directConnections = (NSArray *)v53;

      v98[0] = v47;
      v98[1] = v48;
      uint64_t v55 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v98, 2LL));
      urgentDirectConnections = v15->_urgentDirectConnections;
      v15->_urgentDirectConnections = (NSArray *)v55;

      v97[0] = v49;
      v97[1] = v50;
      uint64_t v57 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v97, 2LL));
      defaultDirectConnections = v15->_defaultDirectConnections;
      v15->_defaultDirectConnections = (NSArray *)v57;

      v96[0] = v51;
      v96[1] = v52;
      uint64_t v59 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v96, 2LL));
      syncDirectConnections = v15->_syncDirectConnections;
      v15->_syncDirectConnections = (NSArray *)v59;

      urgentConnectionForAck = v15->_urgentConnectionForAck;
      v15->_urgentConnectionForAck = v48;
      v62 = v48;

      defaultConnectionForAck = v15->_defaultConnectionForAck;
      v15->_defaultConnectionForAck = v50;
      v64 = v50;

      syncConnectionForAck = v15->_syncConnectionForAck;
      v15->_syncConnectionForAck = v52;
      v66 = v52;

      uint64_t v67 = objc_claimAutoreleasedReturnValue(-[IDSUTunConnection cloudConnection](v62, "cloudConnection"));
      urgentCloudConnectionForAck = v15->_urgentCloudConnectionForAck;
      v15->_urgentCloudConnectionForAck = (IDSUTunConnection *)v67;

      uint64_t v69 = objc_claimAutoreleasedReturnValue(-[IDSUTunConnection cloudConnection](v64, "cloudConnection"));
      defaultCloudConnectionForAck = v15->_defaultCloudConnectionForAck;
      v15->_defaultCloudConnectionForAck = (IDSUTunConnection *)v69;

      v15->_isClassCConnected = a8;
    }

    else
    {
      v71 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:]( v15,  "createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:",  v13,  300LL,  0LL,  3LL));
      v72 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:]( v15,  "createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:",  v13,  200LL,  0LL,  3LL));
      v73 = (IDSUTunConnection *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:]( v15,  "createConnectionWithIdentifier:priority:shouldUseIPsecLink:dataProtectionClass:",  v13,  100LL,  0LL,  3LL));
      v103[0] = v71;
      v103[1] = v72;
      v103[2] = v73;
      uint64_t v74 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v103, 3LL));
      v75 = v15->_directConnections;
      v15->_directConnections = (NSArray *)v74;

      v102 = v71;
      uint64_t v76 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v102, 1LL));
      v77 = v15->_urgentDirectConnections;
      v15->_urgentDirectConnections = (NSArray *)v76;

      v101 = v72;
      uint64_t v78 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v101, 1LL));
      v79 = v15->_defaultDirectConnections;
      v15->_defaultDirectConnections = (NSArray *)v78;

      v100 = v73;
      uint64_t v80 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v100, 1LL));
      v81 = v15->_syncDirectConnections;
      v15->_syncDirectConnections = (NSArray *)v80;

      v82 = v15->_urgentConnectionForAck;
      v15->_urgentConnectionForAck = v71;
      v47 = v71;

      v83 = v15->_defaultConnectionForAck;
      v15->_defaultConnectionForAck = v72;
      v49 = v72;

      v84 = v15->_syncConnectionForAck;
      v15->_syncConnectionForAck = v73;
      v51 = v73;

      uint64_t v85 = objc_claimAutoreleasedReturnValue(-[IDSUTunConnection cloudConnection](v47, "cloudConnection"));
      v86 = v15->_urgentCloudConnectionForAck;
      v15->_urgentCloudConnectionForAck = (IDSUTunConnection *)v85;

      uint64_t v87 = objc_claimAutoreleasedReturnValue(-[IDSUTunConnection cloudConnection](v49, "cloudConnection"));
      v88 = v15->_defaultCloudConnectionForAck;
      v15->_defaultCloudConnectionForAck = (IDSUTunConnection *)v87;
    }

    if (-[IDSUTunPeer _shouldLogTransportStats](v15, "_shouldLogTransportStats")) {
      -[IDSUTunPeer _powerlogTransportStats](v15, "_powerlogTransportStats");
    }
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472LL;
    v93[2] = sub_100051DC8;
    v93[3] = &unk_1008F6010;
    v94 = v15;
    im_dispatch_after_primary_queue(v93, 0.0);
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v3 = OSLogHandleForIDSCategory("UTunPeer");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " Deallocing UTunPeer %p", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v5) && _IDSShouldLog(0LL, @"UTunPeer"))
  {
    v17 = self;
    _IDSLogV(0LL, @"IDSFoundation", @"UTunPeer", @" Deallocing UTunPeer %p");
  }

  -[IMDispatchTimer invalidate](self->_disableTimer, "invalidate", v17);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSWPLinkManager sharedInstance](&OBJC_CLASS___IDSWPLinkManager, "sharedInstance"));
  [v6 removeConnectivityDelegate:self];

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v7 = self->_directConnections;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        [v11 setDelegate:0];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudConnection]);
        [v12 setDelegate:0];

        [v11 setCloudConnection:0];
        [v11 invalidateTimeoutTimer];
      }

      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v8);
  }

  powerLogTimerUrgent = self->_powerLogTimerUrgent;
  if (powerLogTimerUrgent) {
    dispatch_source_cancel((dispatch_source_t)powerLogTimerUrgent);
  }
  powerLogTimerDefault = self->_powerLogTimerDefault;
  if (powerLogTimerDefault) {
    dispatch_source_cancel((dispatch_source_t)powerLogTimerDefault);
  }
  powerLogTimerSync = self->_powerLogTimerSync;
  if (powerLogTimerSync) {
    dispatch_source_cancel((dispatch_source_t)powerLogTimerSync);
  }
  powerLogTimerSockets = self->_powerLogTimerSockets;
  if (powerLogTimerSockets) {
    dispatch_source_cancel((dispatch_source_t)powerLogTimerSockets);
  }
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSUTunPeer;
  -[IDSUTunPeer dealloc](&v18, "dealloc");
}

- (void)performBlockForDirectConnections:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  obj = self->_directConnections;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1000521D8;
        v13[3] = &unk_1008F6358;
        id v11 = v4;
        v13[4] = v9;
        id v14 = v11;
        objc_msgSend(v10, "performBlockWithPriority:priority:", v13, objc_msgSend(v9, "priority"));

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v6);
  }
}

- (void)performBlockForAllConnections:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  obj = self->_directConnections;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v8);
        BOOL supportsCloudConnections = self->_supportsCloudConnections;
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_10005236C;
        v14[3] = &unk_1008F7D90;
        id v12 = v4;
        v14[4] = v9;
        id v15 = v12;
        BOOL v16 = supportsCloudConnections;
        objc_msgSend(v11, "performBlockWithPriority:priority:", v14, objc_msgSend(v9, "priority"));

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v6);
  }
}

- (void)performBlockSynchronouslyForAllConnections:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  obj = self->_directConnections;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v8);
        BOOL supportsCloudConnections = self->_supportsCloudConnections;
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100052578;
        v14[3] = &unk_1008F7D90;
        id v12 = v4;
        v14[4] = v9;
        id v15 = v12;
        BOOL v16 = supportsCloudConnections;
        objc_msgSend(v11, "performBlockSYNCHRONOUSLYWithPriority:priority:", v14, objc_msgSend(v9, "priority"));

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v6);
  }
}

- (void)performBlock:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  id v8 = a3;
  if (self->_shouldUseIPsecLink)
  {
    if (a5 >= 3)
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog UTunPeer](&OBJC_CLASS___IDSFoundationLog, "UTunPeer"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v18 = a5;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Sending message with unexpected data protection class (%d) - using C",  buf,  8u);
      }

      int v9 = 0;
    }

    else
    {
      int v9 = dword_100717368[a5];
    }
  }

  else
  {
    int v9 = 3;
  }

  if (a4 > 199)
  {
    if (a4 == 300)
    {
LABEL_20:
      uint64_t v11 = 7LL;
      goto LABEL_21;
    }

    if (a4 == 200)
    {
      uint64_t v11 = 8LL;
      goto LABEL_21;
    }

- (void)setSupportsCloudConnections:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  if (self->_supportsCloudConnections != v3)
  {
    self->_BOOL supportsCloudConnections = v3;
    if (v3 && !self->_waitForDefaultPairedDevice) {
      -[IDSUTunPeer enableCloudConnection](self, "enableCloudConnection");
    }
  }

- (void)setBtUUID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  if (!v4 || self->_isDefaultPairedDevice || -[NSString isEqualToString:](self->_btUUID, "isEqualToString:", v4))
  {
    uint64_t v6 = OSLogHandleForIDSCategory("UTunPeer");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      btUUID = self->_btUUID;
      *(_DWORD *)buf = 138412802;
      v28 = self;
      __int16 v29 = 2112;
      v30 = btUUID;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ ignoring btuuid update from %@ to %@",  buf,  0x20u);
    }
  }

  else
  {
    id v10 = (NSString *)[v4 copy];
    uint64_t v11 = self->_btUUID;
    self->_btUUID = v10;

    id v12 = v10;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    obj = self->_directConnections;
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v33,  16LL);
    if (v13)
    {
      uint64_t v14 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(obj);
          }
          int v16 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          BOOL supportsCloudConnections = self->_supportsCloudConnections;
          int v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472LL;
          v20[2] = sub_100052B84;
          v20[3] = &unk_1008F7DE0;
          v20[4] = v16;
          __int128 v21 = v12;
          BOOL v22 = supportsCloudConnections;
          objc_msgSend(v18, "performBlockWithPriority:priority:", v20, objc_msgSend(v16, "priority"));
        }

        id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v33,  16LL);
      }

      while (v13);
    }
  }
}

- (BOOL)sendAckForMessageWithSequenceNumber:(unsigned int)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 connectionType:(int64_t)a6
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100052C90;
  v8[3] = &unk_1008F7E08;
  v8[5] = a4;
  v8[6] = a6;
  unsigned int v9 = a5;
  unsigned int v10 = a3;
  v8[4] = &v11;
  -[IDSUTunPeer performBlock:priority:dataProtectionClass:](self, "performBlock:priority:dataProtectionClass:", v8);
  char v6 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)hasSpaceForMessagesWithPriority:(int64_t)a3 dataProtectionClass:(unsigned int)a4 messageType:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v9 assertRunningWithPriority:a3];

  uint64_t v13 = 0LL;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100052F54;
  v11[3] = &unk_1008F7E30;
  v11[4] = &v13;
  v11[5] = a5;
  int v12 = v6;
  -[IDSUTunPeer performBlock:priority:dataProtectionClass:]( self,  "performBlock:priority:dataProtectionClass:",  v11,  a3,  v6);
  LOBYTE(a5) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return a5;
}

- (BOOL)isConnected
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  BOOL v3 = self->_directConnections;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (-[IDSUTunPeer isClassCConnected](self, "isClassCConnected", (void)v18)
          || [v8 dataProtectionClass])
        {
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_connectedStates,  "objectForKeyedSubscript:",  v8));
          unsigned int v10 = [v9 BOOLValue];

          if (!v10) {
            goto LABEL_15;
          }
          if (self->_supportsCloudConnections)
          {
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 cloudConnection]);

            if (v11)
            {
              connectedStates = self->_connectedStates;
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 cloudConnection]);
              char v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( connectedStates,  "objectForKeyedSubscript:",  v13));
              unsigned int v15 = [v14 BOOLValue];

              if (!v15)
              {
LABEL_15:
                BOOL v16 = 0;
                goto LABEL_16;
              }
            }
          }
        }
      }

      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = [&off_100948730 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(&off_100948730);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v11]);
        uint64_t v13 = (char *)[v12 unsignedLongLongValue];

        char v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
        unsigned int v15 = &v13[(void)[v14 unsignedLongLongValue]];

        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v15));
        [v6 setObject:v16 forKey:v11];
      }

      id v8 = [&off_100948730 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }
}

- (id)_copyStatisticsDict:(id)a3
{
  id v3 = a3;
  __int128 v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  context = objc_autoreleasePoolPush();
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v4;
        uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * v4);
        id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v7 = [&off_100948748 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v24;
          do
          {
            unsigned int v10 = 0LL;
            do
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(&off_100948748);
              }
              uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v10);
              int v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v5]);
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);
              id v14 = [v13 unsignedLongValue];

              unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v14));
              -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v15, v11);

              unsigned int v10 = (char *)v10 + 1;
            }

            while (v8 != v10);
            id v8 = [&off_100948748 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }

          while (v8);
        }

        -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v6, v5);

        uint64_t v4 = v22 + 1;
      }

      while ((id)(v22 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v21);
  }

  objc_autoreleasePoolPop(context);
  return v20;
}

- (NSDictionary)sendingMessageStatistics
{
  __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_10005397C;
  v45 = sub_10005398C;
  id v46 = (id)0xAAAAAAAAAAAAAAAALL;
  id v46 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  context = objc_autoreleasePoolPush();
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100053994;
  v40[3] = &unk_1008F7E58;
  v40[4] = self;
  v40[5] = &v41;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v40 priority:200];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100053B20;
  v39[3] = &unk_1008F7E58;
  v39[4] = self;
  v39[5] = &v41;
  [v4 performBlockSYNCHRONOUSLYWithPriority:v39 priority:300];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100053CAC;
  v38[3] = &unk_1008F7E58;
  v38[4] = self;
  v38[5] = &v41;
  [v5 performBlockSYNCHRONOUSLYWithPriority:v38 priority:100];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v7 = (id)v42[5];
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v35;
    do
    {
      unsigned int v10 = 0LL;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v34 + 1) + 8 * (void)v10) allKeys]);
        [v6 addObjectsFromArray:v11];

        unsigned int v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v34 objects:v49 count:16];
    }

    while (v8);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v6;
  id v12 = [obj countByEnumeratingWithState:&v30 objects:v48 count:16];
  if (v12)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v13);
        unsigned int v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v16 = (id)v42[5];
        id v17 = [v16 countByEnumeratingWithState:&v26 objects:v47 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v27;
          do
          {
            uint64_t v19 = 0LL;
            do
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v16);
              }
              -[IDSUTunPeer _addStatsFromDict:toAggregate:](self, "_addStatsFromDict:toAggregate:", v20, v15);

              uint64_t v19 = (char *)v19 + 1;
            }

            while (v17 != v19);
            id v17 = [v16 countByEnumeratingWithState:&v26 objects:v47 count:16];
          }

          while (v17);
        }

        -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v15, v14);
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v13 != v12);
      id v12 = [obj countByEnumeratingWithState:&v30 objects:v48 count:16];
    }

    while (v12);
  }

  objc_autoreleasePoolPop(context);
  _Block_object_dispose(&v41, 8);

  return (NSDictionary *)v25;
}

- (NSDictionary)syncPriorityMessageStatistics
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unsigned int v10 = sub_10005397C;
  uint64_t v11 = sub_10005398C;
  id v12 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100053ED0;
  v6[3] = &unk_1008F7E80;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v6 priority:100];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSDictionary)defaultPriorityMessageStatistics
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unsigned int v10 = sub_10005397C;
  uint64_t v11 = sub_10005398C;
  id v12 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100054034;
  v6[3] = &unk_1008F7E80;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v6 priority:200];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSDictionary)urgentPriorityMessageStatistics
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unsigned int v10 = sub_10005397C;
  uint64_t v11 = sub_10005398C;
  id v12 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100054198;
  v6[3] = &unk_1008F7E80;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v6 priority:300];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSDictionary)urgentCloudPriorityMessageStatistics
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unsigned int v10 = sub_10005397C;
  uint64_t v11 = sub_10005398C;
  id v12 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000542FC;
  v6[3] = &unk_1008F7E80;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v6 priority:300];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)defaultCloudPriorityMessageStatistics
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unsigned int v10 = sub_10005397C;
  uint64_t v11 = sub_10005398C;
  id v12 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100054470;
  v6[3] = &unk_1008F7E80;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockSYNCHRONOUSLYWithPriority:v6 priority:200];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)syncCloudPriorityMessageStatistics
{
  return 0LL;
}

- (void)_accumulateStats:(id)a3 intoMessages:(unint64_t *)a4 andBytes:(unint64_t *)a5
{
  if (a3)
  {
    id v7 = a3;
    id v9 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"localDeliveryQueueStatMessageCount"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"localDeliveryQueueStatBytes"]);

    if (a4 && v9) {
      *a4 += (unint64_t)[v9 unsignedLongLongValue];
    }
    if (a5)
    {
      if (v8) {
        *a5 += (unint64_t)[v8 unsignedLongLongValue];
      }
    }
  }

- (id)_copyPowerlogDictionaryWithOutgoingStats:(id)a3 incomingStats:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v68;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v68 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v67 + 1) + 8 * (void)v12) allKeys]);
        [v8 addObjectsFromArray:v13];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
    }

    while (v10);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v45 = v7;
  id v14 = [v45 countByEnumeratingWithState:&v63 objects:v74 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v64;
    do
    {
      id v17 = 0LL;
      do
      {
        if (*(void *)v64 != v16) {
          objc_enumerationMutation(v45);
        }
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v63 + 1) + 8 * (void)v17) allKeys]);
        [v8 addObjectsFromArray:v18];

        id v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v45 countByEnumeratingWithState:&v63 objects:v74 count:16];
    }

    while (v15);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v42 = v8;
  id v44 = [v42 countByEnumeratingWithState:&v59 objects:v73 count:16];
  CFMutableDictionaryRef Mutable = 0LL;
  if (v44)
  {
    uint64_t v43 = *(void *)v60;
    do
    {
      __int128 v20 = 0LL;
      do
      {
        if (*(void *)v60 != v43) {
          objc_enumerationMutation(v42);
        }
        uint64_t v21 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)v20);
        uint64_t v57 = 0LL;
        uint64_t v58 = 0LL;
        uint64_t v55 = 0LL;
        uint64_t v56 = 0LL;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        id v22 = obj;
        id v23 = [v22 countByEnumeratingWithState:&v51 objects:v72 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v52;
          do
          {
            __int128 v26 = 0LL;
            do
            {
              if (*(void *)v52 != v25) {
                objc_enumerationMutation(v22);
              }
              -[IDSUTunPeer _accumulateStats:intoMessages:andBytes:]( self,  "_accumulateStats:intoMessages:andBytes:",  v27,  &v58,  &v57);

              __int128 v26 = (char *)v26 + 1;
            }

            while (v24 != v26);
            id v24 = [v22 countByEnumeratingWithState:&v51 objects:v72 count:16];
          }

          while (v24);
        }

        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v28 = v45;
        id v29 = [v28 countByEnumeratingWithState:&v47 objects:v71 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v48;
          do
          {
            __int128 v32 = 0LL;
            do
            {
              if (*(void *)v48 != v31) {
                objc_enumerationMutation(v28);
              }
              -[IDSUTunPeer _accumulateStats:intoMessages:andBytes:]( self,  "_accumulateStats:intoMessages:andBytes:",  v33,  &v56,  &v55);

              __int128 v32 = (char *)v32 + 1;
            }

            while (v30 != v32);
            id v30 = [v28 countByEnumeratingWithState:&v47 objects:v71 count:16];
          }

          while (v30);
        }

        if (!Mutable) {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        }
        __int128 v34 = objc_alloc(&OBJC_CLASS___NSDictionary);
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v57));
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v58));
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v55));
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v56));
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[IDSUTunPeer linkType](self, "linkType")));
        v40 = -[NSDictionary initWithObjectsAndKeys:]( v34,  "initWithObjectsAndKeys:",  v35,  @"IDSLocalOutgoingMessageBytes",  v36,  @"IDSLocalOutgoingMessages",  v37,  @"IDSLocalIncomingMessageBytes",  v38,  @"IDSLocalIncomingMessages",  v39,  @"IDSLocalLinkType",  0LL);

        -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v40, v21);
        __int128 v20 = (char *)v20 + 1;
      }

      while (v20 != v44);
      id v44 = [v42 countByEnumeratingWithState:&v59 objects:v73 count:16];
    }

    while (v44);
  }

  return Mutable;
}

- (void)_powerlogDictionaryForPriority:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v5 assertRunningWithPriority:a3];

  context = objc_autoreleasePoolPush();
  uint64_t v6 = 9LL;
  if (a3 == 200) {
    uint64_t v6 = 8LL;
  }
  if (a3 == 300) {
    uint64_t v6 = 7LL;
  }
  id v7 = (&self->super.isa)[v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  id v29 = sub_100054DB8;
  id v30 = &unk_1008F7EA8;
  id v10 = v8;
  id v31 = v10;
  __int128 v32 = self;
  id v11 = v9;
  id v33 = v11;
  -[objc_class enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", &v27);
  id v12 = -[IDSUTunPeer _copyPowerlogDictionaryWithOutgoingStats:incomingStats:]( self,  "_copyPowerlogDictionaryWithOutgoingStats:incomingStats:",  v10,  v11);
  if (v12)
  {
    uint64_t v13 = OSLogHandleForIDSCategory("UTunPeer");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v12 count];
      uint64_t v16 = @"Sync";
      if (a3 == 200) {
        uint64_t v16 = @"Default";
      }
      *(_DWORD *)buf = 136315906;
      __int128 v35 = "-[IDSUTunPeer _powerlogDictionaryForPriority:]";
      __int16 v38 = 2112;
      __int16 v36 = 2048;
      __int128 v37 = self;
      if (a3 == 300) {
        uint64_t v16 = @"URGENT";
      }
      v39 = v16;
      __int16 v40 = 2048;
      id v41 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: self %p reporting stats for %@ %lu",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v17) && _IDSShouldLog(0LL, @"UTunPeer"))
    {
      if (a3 == 200) {
        uint64_t v18 = @"Default";
      }
      else {
        uint64_t v18 = @"Sync";
      }
      if (a3 == 300) {
        uint64_t v19 = @"URGENT";
      }
      else {
        uint64_t v19 = v18;
      }
      id v24 = v19;
      id v25 = [v12 count];
      id v22 = "-[IDSUTunPeer _powerlogDictionaryForPriority:]";
      id v23 = self;
      _IDSLogV(0LL, @"IDSFoundation", @"UTunPeer", @"%s: self %p reporting stats for %@ %lu");
    }

    if (a3 == 200) {
      __int128 v20 = @"Default";
    }
    else {
      __int128 v20 = @"Sync";
    }
    if (a3 == 300) {
      uint64_t v21 = @"URGENT";
    }
    else {
      uint64_t v21 = v20;
    }
    objc_msgSend( v12,  "setObject:forKey:",  v21,  @"IDSLocalStatisticsCategory",  v22,  v23,  v24,  v25,  context,  v27,  v28,  v29,  v30,  v31,  v32);
    IDSPowerLogDictionary(@"IDS Local Network Stats", v12);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_powerlogDictionaryForSockets
{
  context = objc_autoreleasePoolPush();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
  uint64_t v3 = kIDSDefaultPairedDeviceID;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v2 perServiceDataSentForDevice:kIDSDefaultPairedDeviceID services:0]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v4 perServiceDataReceivedForDevice:v3 services:0]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v28 allKeys]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v27 allKeys]);
  [v6 addObjectsFromArray:v7];

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v6;
  id v29 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v29)
  {
    CFMutableDictionaryRef Mutable = 0LL;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
        *(void *)buf = 0LL;
        uint64_t v32 = 0LL;
        uint64_t v33 = 0LL;
        uint64_t v31 = 0LL;
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:v10]);
        -[IDSUTunPeer _accumulateStats:intoMessages:andBytes:]( self,  "_accumulateStats:intoMessages:andBytes:",  v11,  buf,  &v33);

        id v12 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:v10]);
        -[IDSUTunPeer _accumulateStats:intoMessages:andBytes:]( self,  "_accumulateStats:intoMessages:andBytes:",  v12,  &v32,  &v31);

        if (!Mutable) {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        }
        uint64_t v13 = objc_alloc(&OBJC_CLASS___NSDictionary);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v33));
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)buf));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v31));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v32));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[IDSUTunPeer linkType](self, "linkType")));
        uint64_t v19 = -[NSDictionary initWithObjectsAndKeys:]( v13,  "initWithObjectsAndKeys:",  v14,  @"IDSLocalOutgoingSocketBytes",  v15,  @"IDSLocalOutgoingSocketPackets",  v16,  @"IDSLocalIncomingSocketBytes",  v17,  @"IDSLocalIncomingSocketPackets",  v18,  @"IDSLocalLinkType",  0LL);

        -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v19, v10);
      }

      id v29 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }

    while (v29);

    if (Mutable)
    {
      -[__CFDictionary setObject:forKey:]( Mutable,  "setObject:forKey:",  @"Sockets",  @"IDSLocalStatisticsCategory");
      uint64_t v20 = OSLogHandleForIDSCategory("IDSUTunPeer");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = -[__CFDictionary count](Mutable, "count");
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[IDSUTunPeer _powerlogDictionaryForSockets]";
        __int16 v39 = 2048;
        __int16 v40 = self;
        __int16 v41 = 2048;
        id v42 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: self %p reporting stats for sockets %lu services",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v23)
        && _IDSShouldLog(0LL, @"IDSUTunPeer"))
      {
        -[__CFDictionary count](Mutable, "count");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSUTunPeer",  @"%s: self %p reporting stats for sockets %lu services");
      }

      IDSPowerLogDictionary(@"IDS Local Network Stats", Mutable);
    }
  }

  else
  {

    CFMutableDictionaryRef Mutable = 0LL;
  }

  objc_autoreleasePoolPop(context);
}

- (void)_powerlogTransportStats
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMWeakReference weakRefWithObject:](&OBJC_CLASS___IMWeakReference, "weakRefWithObject:", self));
  if (!self->_shouldUseIPsecLink)
  {
    uint64_t v4 = OSLogHandleForIDSCategory("UTunPeer");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldUseIPsecLink) {
        uint64_t v6 = @"YES";
      }
      else {
        uint64_t v6 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Enabling power logging for sockets {_shouldUseIPsecLink: %@}",  buf,  0xCu);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8)
    {
      uint64_t v8 = _IDSShouldLog(0LL, @"UTunPeer");
      if ((_DWORD)v8) {
        uint64_t v8 = _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"Enabling power logging for sockets {_shouldUseIPsecLink: %@}");
      }
    }

    uint64_t v10 = im_primary_queue(v8, v9);
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v11);
    powerLogTimerSockets = self->_powerLogTimerSockets;
    self->_powerLogTimerSockets = v12;

    id v14 = self->_powerLogTimerSockets;
    if (v14)
    {
      dispatch_time_t v15 = dispatch_time(0LL, 60000000000LL);
      dispatch_source_set_timer((dispatch_source_t)v14, v15, 0xDF8475800uLL, 0x3B9ACA00uLL);
      uint64_t v16 = self->_powerLogTimerSockets;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000555C8;
      handler[3] = &unk_1008F6010;
      id v18 = v3;
      dispatch_source_set_event_handler((dispatch_source_t)v16, handler);
      dispatch_activate((dispatch_object_t)self->_powerLogTimerSockets);
    }
  }
}

- (void)_startPowerLogTimersForAllPriorities
{
  uint64_t v3 = OSLogHandleForIDSCategory("UTunPeer");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v37 = "-[IDSUTunPeer _startPowerLogTimersForAllPriorities]";
    __int16 v38 = 2048;
    __int16 v39 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: self %p Enabling power logging for transport stats",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v5) && _IDSShouldLog(0LL, @"UTunPeer"))
  {
    uint64_t v28 = "-[IDSUTunPeer _startPowerLogTimersForAllPriorities]";
    id v29 = self;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"%s: self %p Enabling power logging for transport stats");
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[IMWeakReference weakRefWithObject:]( &OBJC_CLASS___IMWeakReference,  "weakRefWithObject:",  self,  v28,  v29));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 queueForPriority:300]);
  uint64_t v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v8);
  powerLogTimerUrgent = self->_powerLogTimerUrgent;
  self->_powerLogTimerUrgent = v9;

  id v11 = self->_powerLogTimerUrgent;
  if (v11)
  {
    dispatch_time_t v12 = dispatch_time(0LL, 60000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v11, v12, 0xDF8475800uLL, 0x3B9ACA00uLL);
    uint64_t v13 = self->_powerLogTimerUrgent;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000559CC;
    handler[3] = &unk_1008F6010;
    id v35 = v6;
    dispatch_source_set_event_handler((dispatch_source_t)v13, handler);
    dispatch_activate((dispatch_object_t)self->_powerLogTimerUrgent);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  dispatch_time_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 queueForPriority:200]);
  uint64_t v16 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v15);
  powerLogTimerDefault = self->_powerLogTimerDefault;
  self->_powerLogTimerDefault = v16;

  id v18 = self->_powerLogTimerDefault;
  if (v18)
  {
    dispatch_time_t v19 = dispatch_time(0LL, 60000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v18, v19, 0xDF8475800uLL, 0x3B9ACA00uLL);
    uint64_t v20 = self->_powerLogTimerDefault;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100055A00;
    v32[3] = &unk_1008F6010;
    id v33 = v6;
    dispatch_source_set_event_handler((dispatch_source_t)v20, v32);
    dispatch_activate((dispatch_object_t)self->_powerLogTimerDefault);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v21 queueForPriority:100]);
  uint64_t v23 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v22);
  powerLogTimerSync = self->_powerLogTimerSync;
  self->_powerLogTimerSync = v23;

  id v25 = self->_powerLogTimerSync;
  if (v25)
  {
    dispatch_time_t v26 = dispatch_time(0LL, 60000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v25, v26, 0xDF8475800uLL, 0x3B9ACA00uLL);
    __int128 v27 = self->_powerLogTimerSync;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100055A34;
    v30[3] = &unk_1008F6010;
    id v31 = v6;
    dispatch_source_set_event_handler((dispatch_source_t)v27, v30);
    dispatch_activate((dispatch_object_t)self->_powerLogTimerSync);
  }
}

- (void)logCurrentTransportStatsAndResetTimers
{
  uint64_t v3 = OSLogHandleForIDSCategory("UTunPeer");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v35 = (IDSUTunPeer *)"-[IDSUTunPeer logCurrentTransportStatsAndResetTimers]";
    __int16 v36 = 2048;
    __int128 v37 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: self %p Will log the current transport stats and restart timers.",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v5) && _IDSShouldLog(0LL, @"UTunPeer"))
  {
    dispatch_time_t v26 = "-[IDSUTunPeer logCurrentTransportStatsAndResetTimers]";
    __int128 v27 = self;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"%s: self %p Will log the current transport stats and restart timers.");
  }

  unsigned int v6 = -[IDSUTunPeer _shouldLogTransportStats](self, "_shouldLogTransportStats", v26, v27);
  if (v6 && self->_shouldUseIPsecLink)
  {
    powerLogTimerUrgent = self->_powerLogTimerUrgent;
    if (powerLogTimerUrgent)
    {
      dispatch_source_cancel((dispatch_source_t)powerLogTimerUrgent);
      uint64_t v8 = self->_powerLogTimerUrgent;
      self->_powerLogTimerUrgent = 0LL;
    }

    powerLogTimerDefault = self->_powerLogTimerDefault;
    if (powerLogTimerDefault)
    {
      dispatch_source_cancel((dispatch_source_t)powerLogTimerDefault);
      uint64_t v10 = self->_powerLogTimerDefault;
      self->_powerLogTimerDefault = 0LL;
    }

    powerLogTimerSync = self->_powerLogTimerSync;
    if (powerLogTimerSync)
    {
      dispatch_source_cancel((dispatch_source_t)powerLogTimerSync);
      dispatch_time_t v12 = self->_powerLogTimerSync;
      self->_powerLogTimerSync = 0LL;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMWeakReference weakRefWithObject:](&OBJC_CLASS___IMWeakReference, "weakRefWithObject:", self));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100055E50;
    v32[3] = &unk_1008F6010;
    id v15 = v13;
    id v33 = v15;
    [v14 performBlockUrgentPriority:v32];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100055E84;
    v30[3] = &unk_1008F6010;
    id v17 = v15;
    id v31 = v17;
    [v16 performBlockDefaultPriority:v30];

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100055EB8;
    v28[3] = &unk_1008F6010;
    id v29 = v17;
    id v19 = v17;
    [v18 performBlockSyncPriority:v28];

    -[IDSUTunPeer _startPowerLogTimersForAllPriorities](self, "_startPowerLogTimersForAllPriorities");
  }

  else
  {
    uint64_t v20 = OSLogHandleForIDSCategory("UTunPeer");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = @"NO";
      BOOL shouldUseIPsecLink = self->_shouldUseIPsecLink;
      if (v6) {
        id v24 = @"YES";
      }
      else {
        id v24 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      id v35 = self;
      __int16 v36 = 2112;
      if (shouldUseIPsecLink) {
        id v22 = @"YES";
      }
      __int128 v37 = (IDSUTunPeer *)v24;
      __int16 v38 = 2112;
      __int16 v39 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@ logCurrentTransportStatsAndResetTimers shouldLog=%@, _shouldUseIPsecLink=%@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v25) && _IDSShouldLog(0LL, @"UTunPeer")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"%@ logCurrentTransportStatsAndResetTimers shouldLog=%@, _shouldUseIPsecLink=%@");
    }
  }

- (void)setLocalSetupInProgress:(BOOL)a3
{
  if (self->_localSetupInProgress != a3)
  {
    BOOL v3 = a3;
    self->_localSetupInProgress = a3;
    uint64_t v5 = OSLogHandleForTransportCategory("UTunPeer");
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"NO";
      if (v3) {
        uint64_t v7 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "LOCALSETUP: %@ has been told to localSetupInProgress %@",  buf,  0x16u);
    }

    uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
    if ((_DWORD)v9 && _IDSShouldLogTransport(v9))
    {
      _IDSLogTransport( @"UTunPeer",  @"IDS",  @"LOCALSETUP: %@ has been told to localSetupInProgress %@");
      if (_IDSShouldLog(0LL, @"UTunPeer")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"LOCALSETUP: %@ has been told to localSetupInProgress %@");
      }
    }
  }

- (void)enableConnection
{
  uint64_t v3 = OSLogHandleForIDSCategory("UTunPeer");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = uniqueID;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "enableConnection for peer %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v6) && _IDSShouldLog(0LL, @"UTunPeer"))
  {
    uint64_t v7 = self->_uniqueID;
    _IDSLogV(0LL, @"IDSFoundation", @"UTunPeer", @"enableConnection for peer %@");
  }

  if (self->_isDefaultPairedDevice) {
    self->_waitForDefaultPairedDevice = 0;
  }
  -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", &stru_1008F7EE8, v7);
}

- (void)enableCloudConnection
{
  uint64_t v3 = OSLogHandleForTransportCategory("UTunPeer");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412290;
    id v22 = uniqueID;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "enableCloudConnection for peer %@", buf, 0xCu);
  }

  uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
  if ((_DWORD)v7)
  {
    if (_IDSShouldLogTransport(v7))
    {
      id v14 = self->_uniqueID;
      _IDSLogTransport(@"UTunPeer", @"IDS", @"enableCloudConnection for peer %@");
      if (_IDSShouldLog(0LL, @"UTunPeer"))
      {
        id v14 = self->_uniqueID;
        _IDSLogV(0LL, @"IDSFoundation", @"UTunPeer", @"enableCloudConnection for peer %@");
      }
    }
  }

  if (self->_supportsCloudConnections)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v8 = self->_directConnections;
    id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          __int16 v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v11);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance",  v14));
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_1000563F0;
          v15[3] = &unk_1008F6010;
          v15[4] = v12;
          objc_msgSend(v13, "performBlockWithPriority:priority:", v15, objc_msgSend(v12, "priority"));

          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v9);
    }
  }

- (void)disableConnectionForReason:(int64_t)a3 shouldWait:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = OSLogHandleForIDSCategory("UTunPeer");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "disabling connection %@", buf, 0xCu);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    uint64_t v11 = _IDSShouldLog(0LL, @"UTunPeer");
    if ((_DWORD)v11)
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
      _IDSLogV(0LL, @"IDSFoundation", @"UTunPeer", @"disabling connection %@");
    }
  }

  im_assert_primary_base_queue(v11, v12);
  uint64_t v13 = OSLogHandleForIDSCategory("UTunPeer");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412802;
    uint64_t v21 = uniqueID;
    __int16 v22 = 2048;
    uint64_t v23 = self;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "disable Connection for peer %@:%p withReason %ld",  buf,  0x20u);
  }

  if (self->_isDefaultPairedDevice) {
    self->_waitForDefaultPairedDevice = 1;
  }
  if (v4)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100056820;
    v19[3] = &unk_1008F7F08;
    v19[4] = a3;
    -[IDSUTunPeer performBlockSynchronouslyForAllConnections:](self, "performBlockSynchronouslyForAllConnections:", v19);
  }

  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100056974;
    v18[3] = &unk_1008F7F08;
    v18[4] = a3;
    -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", v18);
  }

- (void)disableCloudConnectionForReason:(int64_t)a3
{
  uint64_t v4 = OSLogHandleForTransportCategory("UTunPeer");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412802;
    dispatch_time_t v26 = uniqueID;
    __int16 v27 = 2048;
    uint64_t v28 = self;
    __int16 v29 = 2048;
    int64_t v30 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "disable cloud connection for peer %@:%p withReason %ld",  buf,  0x20u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      uint64_t v16 = self;
      int64_t v17 = a3;
      id v15 = self->_uniqueID;
      _IDSLogTransport(@"UTunPeer", @"IDS", @"disable cloud connection for peer %@:%p withReason %ld");
      if (_IDSShouldLog(0LL, @"UTunPeer"))
      {
        uint64_t v16 = self;
        int64_t v17 = a3;
        id v15 = self->_uniqueID;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"disable cloud connection for peer %@:%p withReason %ld");
      }
    }
  }

  if (self->_supportsCloudConnections)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = self->_directConnections;
    id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance",  v15,  v16,  v17));
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          v19[2] = sub_100056D4C;
          v19[3] = &unk_1008F68C8;
          v19[4] = v13;
          void v19[5] = a3;
          objc_msgSend(v14, "performBlockWithPriority:priority:", v19, objc_msgSend(v13, "priority"));

          uint64_t v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      }

      while (v10);
    }
  }

- (void)setEnableOTR:(BOOL)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100056E10;
  v5[3] = &unk_1008F7F28;
  BOOL v6 = a3;
  -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", v5);
}

- (void)setIsMagnetIndicatingPeerIsAwake:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  if (self->_isMagnetIndicatingPeerIsAwake != v3)
  {
    self->_isMagnetIndicatingPeerIsAwake = v3;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100056E94;
    v5[3] = &unk_1008F7F28;
    BOOL v6 = v3;
    -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", v5);
  }

- (void)_powerLogServices:(id)a3 prefersInfraWifi:(BOOL)a4
{
  BOOL v4 = a4;
  id value = a3;
  id v6 = [value count];
  uint64_t v7 = @"Client Request";
  if (!v6) {
    uint64_t v7 = @"Idle Remove";
  }
  uint64_t v8 = v7;
  id v9 = self->_servicesPreferringInfraWiFi;
  if (!v9) {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v11 = (__CFDictionary *)v10;
  if (v9) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, @"IDSServicePrefersInfraWifi", v9);
  }
  CFDictionarySetValue(v11, @"Reason", v8);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  if (v12) {
    CFDictionarySetValue(v11, @"InfraWiFiState", v12);
  }

  if ([value count] && value) {
    CFDictionarySetValue(v11, @"Services", value);
  }
  IDSPowerLogDictionary(@"IDS Local InfraWiFi Request", v11);
}

- (void)_checkServicesPreferringInfraWiFi:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  im_assert_primary_base_queue(self, a2);
  uint64_t v66 = v3;
  if (self->_dispatchCounterInfraWiFi == (_DWORD)v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
    id v6 = [v5 copyLinkStatsDict];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"InfraWiFi"]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"packetsReceived"]);
    __int128 v64 = (char *)[v8 unsignedLongLongValue];

    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id obj = self->_servicesPreferringInfraWiFi;
    id v68 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v71,  v89,  16LL);
    if (v68)
    {
      unint64_t v9 = 0LL;
      uint64_t v67 = *(void *)v72;
      do
      {
        for (i = 0LL; i != v68; i = (char *)i + 1)
        {
          if (*(void *)v72 != v67) {
            objc_enumerationMutation(obj);
          }
          unint64_t v11 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)i);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer syncPriorityMessageStatistics]( self,  "syncPriorityMessageStatistics",  v57,  v58,  v59));
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"]);
          id v15 = (char *)[v14 unsignedLongLongValue];

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunPeer defaultPriorityMessageStatistics](self, "defaultPriorityMessageStatistics"));
          int64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v11]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"]);
          id v19 = [v18 unsignedLongLongValue];

          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunPeer urgentPriorityMessageStatistics](self, "urgentPriorityMessageStatistics"));
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v11]);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"]);
          unint64_t v23 = (unint64_t)[v22 unsignedLongLongValue];

          __int16 v24 = &v15[(void)v19 + v23];
          if (self->_supportsCloudConnections)
          {
            int64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer urgentCloudPriorityMessageStatistics]( self,  "urgentCloudPriorityMessageStatistics"));
            dispatch_time_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v11]);
            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"]);
            id v28 = [v27 unsignedLongLongValue];

            __int16 v24 = &v24[(void)v28];
            if (self->_supportsCloudConnections)
            {
              __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer defaultCloudPriorityMessageStatistics]( self,  "defaultCloudPriorityMessageStatistics"));
              int64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:v11]);
              id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"]);
              id v32 = [v31 unsignedLongLongValue];

              __int16 v24 = &v24[(void)v32];
            }
          }

          uint64_t v33 = OSLogHandleForTransportCategory("UTunPeer");
          __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109634;
            int v76 = v66;
            __int16 v77 = 2112;
            unint64_t v78 = v11;
            __int16 v79 = 2048;
            uint64_t v80 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "_checkServicesPreferringInfraWiFi %u: Service %@ has %llu delivered messages",  buf,  0x1Cu);
          }

          uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
          if ((_DWORD)v36)
          {
            if (_IDSShouldLogTransport(v36))
            {
              unint64_t v58 = v11;
              __int128 v59 = v24;
              uint64_t v57 = v66;
              _IDSLogTransport( @"UTunPeer",  @"IDS",  @"_checkServicesPreferringInfraWiFi %u: Service %@ has %llu delivered messages");
              if (_IDSShouldLog(0LL, @"UTunPeer"))
              {
                unint64_t v58 = v11;
                __int128 v59 = v24;
                uint64_t v57 = v66;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"_checkServicesPreferringInfraWiFi %u: Service %@ has %llu delivered messages");
              }
            }
          }

          v9 += (unint64_t)v24;
        }

        id v68 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v71,  v89,  16LL);
      }

      while (v68);
    }

    else
    {
      unint64_t v9 = 0LL;
    }

    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
    id v38 = [v37 totalPacketsReceivedForDevice:kIDSDefaultPairedDeviceID services:self->_servicesPreferringInfraWiFi];

    uint64_t v39 = OSLogHandleForTransportCategory("UTunPeer");
    __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t totalPacketsReceivedInfraWiFi = self->_totalPacketsReceivedInfraWiFi;
      unint64_t totalPacketsReceivedClientSockets = self->_totalPacketsReceivedClientSockets;
      unint64_t totalDeliveredMessagesInfraWiFi = self->_totalDeliveredMessagesInfraWiFi;
      *(_DWORD *)buf = 67110656;
      int v76 = v66;
      __int16 v77 = 2048;
      unint64_t v78 = totalPacketsReceivedInfraWiFi;
      __int16 v79 = 2048;
      uint64_t v80 = v64;
      __int16 v81 = 2048;
      unint64_t v82 = totalPacketsReceivedClientSockets;
      __int16 v83 = 2048;
      id v84 = v38;
      __int16 v85 = 2048;
      unint64_t v86 = totalDeliveredMessagesInfraWiFi;
      __int16 v87 = 2048;
      unint64_t v88 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "_checkServicesPreferringInfraWiFi %u: InfraWiFi received %llu -> %llu packets. Client sockets received %llu -> % llu packets. Total delivered %llu -> %llu",  buf,  0x44u);
    }

    uint64_t v45 = os_log_shim_legacy_logging_enabled(v44);
    if ((_DWORD)v45)
    {
      if (_IDSShouldLogTransport(v45))
      {
        unint64_t v62 = self->_totalDeliveredMessagesInfraWiFi;
        unint64_t v63 = v9;
        unint64_t v60 = self->_totalPacketsReceivedClientSockets;
        id v61 = v38;
        unint64_t v58 = self->_totalPacketsReceivedInfraWiFi;
        __int128 v59 = v64;
        uint64_t v57 = v66;
        _IDSLogTransport( @"UTunPeer",  @"IDS",  @"_checkServicesPreferringInfraWiFi %u: InfraWiFi received %llu -> %llu packets. Client sockets received %llu -> %llu packets. Total delivered %llu -> %llu");
        if (_IDSShouldLog(0LL, @"UTunPeer"))
        {
          unint64_t v62 = self->_totalDeliveredMessagesInfraWiFi;
          unint64_t v63 = v9;
          unint64_t v60 = self->_totalPacketsReceivedClientSockets;
          id v61 = v38;
          unint64_t v58 = self->_totalPacketsReceivedInfraWiFi;
          __int128 v59 = v64;
          uint64_t v57 = v66;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"_checkServicesPreferringInfraWiFi %u: InfraWiFi received %llu -> %llu packets. Client sockets received %llu -> %llu packets. Total delivered %llu -> %llu");
        }
      }
    }

    if (v9 == self->_totalDeliveredMessagesInfraWiFi
      && v38 == (id)self->_totalPacketsReceivedClientSockets
      && v64 == (char *)self->_totalPacketsReceivedInfraWiFi)
    {
      uint64_t v46 = OSLogHandleForTransportCategory("UTunPeer");
      __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v76 = v66;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "_checkServicesPreferringInfraWiFi %u: No message delivered and no client socket packet received for services p referring InfraWiFi - disabling it now",  buf,  8u);
      }

      uint64_t v49 = os_log_shim_legacy_logging_enabled(v48);
      if ((_DWORD)v49)
      {
        if (_IDSShouldLogTransport(v49))
        {
          uint64_t v57 = v66;
          _IDSLogTransport( @"UTunPeer",  @"IDS",  @"_checkServicesPreferringInfraWiFi %u: No message delivered and no client socket packet received for services preferring InfraWiFi - disabling it now");
          if (_IDSShouldLog(0LL, @"UTunPeer"))
          {
            uint64_t v57 = v66;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"_checkServicesPreferringInfraWiFi %u: No message delivered and no client socket packet received for services preferring InfraWiFi - disabling it now");
          }
        }
      }

      servicesPreferringInfraWiFi = self->_servicesPreferringInfraWiFi;
      if (servicesPreferringInfraWiFi)
      {
        -[NSMutableSet removeAllObjects](servicesPreferringInfraWiFi, "removeAllObjects");
        if (!-[NSMutableSet count](self->_servicesPreferringInfraWiFi, "count"))
        {
          __int128 v51 = self->_servicesPreferringInfraWiFi;
          self->_servicesPreferringInfraWiFi = 0LL;
        }

        -[IDSUTunPeer _powerLogServices:prefersInfraWifi:]( self,  "_powerLogServices:prefersInfraWifi:",  0LL,  0LL,  v57,  v58,  v59,  v60,  v61,  v62,  v63);
      }

      __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance", v57));
      [v52 setPreferInfraWiFi:0];
    }

    else
    {
      self->_unint64_t totalDeliveredMessagesInfraWiFi = v9;
      self->_unint64_t totalPacketsReceivedInfraWiFi = (unint64_t)v64;
      self->_unint64_t totalPacketsReceivedClientSockets = (unint64_t)v38;
      dispatch_time_t v53 = dispatch_time(0LL, 90000000000LL);
      uint64_t v55 = im_primary_queue(v53, v54);
      uint64_t v56 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v55);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100057770;
      block[3] = &unk_1008F78D8;
      block[4] = self;
      int v70 = v66;
      dispatch_after(v53, v56, block);
    }
  }

- (void)setPreferInfraWiFi:(BOOL)a3 services:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  im_assert_primary_base_queue(v6, v7);
  if (self->_isDefaultPairedDevice && [v6 count])
  {
    if (self->_localSetupInProgress)
    {
      uint64_t v8 = OSLogHandleForTransportCategory("UTunPeer");
      unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Local Setup is not complete yet - ignore preferInfraWiFi for %@",  buf,  0xCu);
      }

      uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
      if ((_DWORD)v11)
      {
        if (_IDSShouldLogTransport(v11))
        {
          _IDSLogTransport( @"UTunPeer",  @"IDS",  @"Local Setup is not complete yet - ignore preferInfraWiFi for %@");
          if (_IDSShouldLog(0LL, @"UTunPeer")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"Local Setup is not complete yet - ignore preferInfraWiFi for %@");
          }
        }
      }
    }

    else
    {
      uint64_t v12 = -[NSMutableSet initWithSet:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithSet:",  self->_servicesPreferringInfraWiFi);
      if (v4)
      {
        servicesPreferringInfraWiFi = self->_servicesPreferringInfraWiFi;
        if (!servicesPreferringInfraWiFi)
        {
          id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          id v15 = self->_servicesPreferringInfraWiFi;
          self->_servicesPreferringInfraWiFi = v14;

          servicesPreferringInfraWiFi = self->_servicesPreferringInfraWiFi;
        }

        -[NSMutableSet addObjectsFromArray:](servicesPreferringInfraWiFi, "addObjectsFromArray:", v6);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
        [v16 setPreferInfraWiFi:1];

        unsigned int v17 = self->_dispatchCounterInfraWiFi + 1;
        self->_dispatchCounterInfraWiFi = v17;
        dispatch_time_t v18 = dispatch_time(0LL, 90000000000LL);
        uint64_t v20 = im_primary_queue(v18, v19);
        __int128 v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100057AD8;
        block[3] = &unk_1008F78D8;
        block[4] = self;
        unsigned int v33 = v17;
        dispatch_after(v18, v21, block);
      }

      else
      {
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v22 = v6;
        id v23 = [v22 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v29;
          do
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v29 != v24) {
                objc_enumerationMutation(v22);
              }
              -[NSMutableSet removeObject:]( self->_servicesPreferringInfraWiFi,  "removeObject:",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)i));
            }

            id v23 = [v22 countByEnumeratingWithState:&v28 objects:v34 count:16];
          }

          while (v23);
        }

        if (!-[NSMutableSet count](self->_servicesPreferringInfraWiFi, "count"))
        {
          dispatch_time_t v26 = self->_servicesPreferringInfraWiFi;
          self->_servicesPreferringInfraWiFi = 0LL;
        }

        if (!self->_servicesPreferringInfraWiFi)
        {
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
          [v27 setPreferInfraWiFi:0];

          ++self->_dispatchCounterInfraWiFi;
        }
      }
    }
  }
}

- (void)setLinkPreferences:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  if (v4 && self->_isDefaultPairedDevice)
  {
    if (self->_localSetupInProgress)
    {
      uint64_t v6 = OSLogHandleForTransportCategory("UTunPeer");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Local Setup is not complete yet - ignore setLinkPreferences for %{public}@",  buf,  0xCu);
      }

      uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
      if ((_DWORD)v9)
      {
        if (_IDSShouldLogTransport(v9))
        {
          _IDSLogTransport( @"UTunPeer",  @"IDS",  @"Local Setup is not complete yet - ignore setLinkPreferences for %{public}@");
          if (_IDSShouldLog(0LL, @"UTunPeer")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"Local Setup is not complete yet - ignore setLinkPreferences for %{public}@");
          }
        }
      }
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
      [v10 setLinkPreferences:v4];
    }
  }
}

- (void)setIsConnected:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  if (self->_isConnected != v3)
  {
    self->_isConnected = v3;
    if (v3) {
      -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", &stru_1008F7F48);
    }
  }

- (void)unpairStart
{
  if (-[NSMutableSet count](self->_servicesPreferringInfraWiFi, "count"))
  {
    servicesPreferringInfraWiFi = self->_servicesPreferringInfraWiFi;
    self->_servicesPreferringInfraWiFi = 0LL;

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
    [v4 setPreferInfraWiFi:0];
  }

  ++self->_dispatchCounterInfraWiFi;
}

- (void)dropDisallowedMessages
{
}

- (void)trafficClassesChanged
{
}

- (void)clearStats
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
  [v3 clearStats];
}

- (void)cancelMessageID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  if ([v4 length])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100057E6C;
    v6[3] = &unk_1008F7FD0;
    id v7 = v4;
    -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", v6);
  }
}

- (void)kickProgressBlockForMessageID:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  if ([v4 length])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100057F00;
    v6[3] = &unk_1008F7FD0;
    id v7 = v4;
    -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", v6);
  }
}

- (void)sendMessage:(id)a3 priority:(int64_t)a4 messageType:(int64_t)a5
{
  id v8 = a3;
  __int128 v34 = _os_activity_create( (void *)&_mh_execute_header,  "UTUNPeer sendMessage",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v34, &state);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  [v9 assertRunningWithPriority:a4];

  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSUTunPeer _connectionForPriority:messageType:dataProtectionClass:]( self,  "_connectionForPriority:messageType:dataProtectionClass:",  a4,  a5,  [v8 dataProtectionClass]));
    uint64_t v11 = v10;
    if (!self->_waitForDefaultPairedDevice) {
      [v10 setEnabled:1];
    }
    os_unfair_lock_lock(&self->_emptyStatesLock);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_emptyStates,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  v11);
    os_unfair_lock_unlock(&self->_emptyStatesLock);
    if ([v8 requireBluetooth] && !self->_isNearby)
    {
      uint64_t v24 = OSLogHandleForTransportCategory("UTunPeer");
      int64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_time_t v26 = (void *)objc_claimAutoreleasedReturnValue([v8 messageUUID]);
        *(_DWORD *)buf = 138412290;
        id v36 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Bluetooth is required but we are not nearby - failing message %@",  buf,  0xCu);
      }

      uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
      if ((_DWORD)v28)
      {
        if (_IDSShouldLogTransport(v28))
        {
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v8 messageUUID]);
          _IDSLogTransport( @"UTunPeer",  @"IDS",  @"Bluetooth is required but we are not nearby - failing message %@");

          if (_IDSShouldLog(0LL, @"UTunPeer"))
          {
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageUUID", v30));
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"Bluetooth is required but we are not nearby - failing message %@");
          }
        }
      }

      id v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionBlock", v30));
      if (!v19) {
        goto LABEL_26;
      }
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v8 toDeviceID]);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_100058490;
      v32[3] = &unk_1008F7BD8;
      id v22 = (id *)v32;
      void v32[4] = v11;
      id v23 = v29;
      v32[5] = v23;
      id v19 = v19;
      v32[6] = v19;
      [v21 performBlockMainQueue:v32];
    }

    else
    {
      if (![v8 requireLocalWiFi]
        || (id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUTunPeer rapportClient](self, "rapportClient")),
            unsigned __int8 v13 = [v12 isDeviceDiscovered:self->_uniqueID],
            v12,
            (v13 & 1) != 0))
      {
        [v11 sendMessage:v8];
        [v11 resumeConnectivity];
LABEL_27:

        goto LABEL_28;
      }

      uint64_t v14 = OSLogHandleForTransportCategory("UTunPeer");
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 messageUUID]);
        *(_DWORD *)buf = 138412290;
        id v36 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Local WiFi is required but we are not discovered by Rapport - failing message %@",  buf,  0xCu);
      }

      uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
      if ((_DWORD)v18)
      {
        if (_IDSShouldLogTransport(v18))
        {
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v8 messageUUID]);
          _IDSLogTransport( @"UTunPeer",  @"IDS",  @"Local WiFi is required but we are not discovered by Rapport - failing message %@");

          if (_IDSShouldLog(0LL, @"UTunPeer"))
          {
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageUUID", v30));
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"Local WiFi is required but we are not discovered by Rapport - failing message %@");
          }
        }
      }

      id v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionBlock", v30));
      if (!v19)
      {
LABEL_26:

        goto LABEL_27;
      }

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 toDeviceID]);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100058584;
      v31[3] = &unk_1008F7BD8;
      id v22 = (id *)v31;
      v31[4] = v11;
      id v23 = v20;
      v31[5] = v23;
      id v19 = v19;
      v31[6] = v19;
      [v21 performBlockMainQueue:v31];
    }

    goto LABEL_26;
  }

- (id)rapportClient
{
  return +[IDSRapportClient sharedInstance](&OBJC_CLASS___IDSRapportClient, "sharedInstance");
}

- (id)_connectionForPriority:(int64_t)a3 messageType:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v8 = a3 != 100
    && -[IDSUTunPeer _messageTypeSupportedForCloudConnection:](self, "_messageTypeSupportedForCloudConnection:", a4)
    && self->_supportsCloudConnections;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_10005397C;
  uint64_t v17 = sub_10005398C;
  id v18 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100058798;
  v11[3] = &unk_1008F7FF8;
  BOOL v12 = v8;
  v11[4] = &v13;
  -[IDSUTunPeer performBlock:priority:dataProtectionClass:]( self,  "performBlock:priority:dataProtectionClass:",  v11,  a3,  v5);
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (BOOL)_messageTypeSupportedForCloudConnection:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (int64_t)_priorityForConnection:(id)a3
{
  return (int64_t)[a3 idsPriority];
}

- (int64_t)_connectionTypeForConnection:(id)a3
{
  else {
    return 1LL;
  }
}

- (void)connection:(id)a3 connectivityChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  objc_msgSend(v7, "assertRunningWithPriority:", objc_msgSend(v6, "idsPriority"));

  uint64_t v8 = OSLogHandleForIDSCategory("UTunPeer");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 identifier]);
    uint64_t v11 = (void *)v10;
    BOOL v12 = @"NO";
    *(_DWORD *)buf = 138413058;
    uint64_t v27 = self;
    if (v4) {
      BOOL v12 = @"YES";
    }
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2112;
    uint64_t v31 = v10;
    __int16 v32 = 2112;
    unsigned int v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ %@ %@ isConnected changed to %@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled(v13) && _IDSShouldLog(0LL, @"UTunPeer"))
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 identifier]);
    uint64_t v15 = (void *)v14;
    uint64_t v16 = @"NO";
    if (v4) {
      uint64_t v16 = @"YES";
    }
    uint64_t v21 = v14;
    id v22 = v16;
    id v19 = self;
    id v20 = v6;
    _IDSLogV(0LL, @"IDSFoundation", @"UTunPeer", @"%@ %@ %@ isConnected changed to %@");
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance",  v19,  v20,  v21,  v22));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100058A74;
  v23[3] = &unk_1008F7DE0;
  v23[4] = self;
  id v24 = v6;
  BOOL v25 = v4;
  id v18 = v6;
  [v17 performBlockMainQueue:v23];
}

- (void)connection:(id)a3 protobufReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14
{
  id v34 = a12;
  id v21 = a11;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  objc_msgSend( v28,  "assertRunningWithPriority:",  -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v27));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v29 = -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v27);
  int64_t v30 = -[IDSUTunPeer _connectionTypeForConnection:](self, "_connectionTypeForConnection:", v27);

  LOBYTE(v33) = a14;
  LOBYTE(v32) = a13;
  LOWORD(v31) = __PAIR16__(a10, a9);
  objc_msgSend( WeakRetained,  "peer:protobufReceived:topic:command:fromID:messageID:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:messageU UID:priority:isCompressed:connectionType:didWakeHint:",  self,  v26,  v25,  v24,  v23,  v22,  v31,  v21,  v34,  v29,  v32,  v30,  v33);
}

- (void)connection:(id)a3 dataReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14
{
  id v34 = a12;
  id v21 = a11;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  objc_msgSend( v28,  "assertRunningWithPriority:",  -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v27));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v29 = -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v27);
  int64_t v30 = -[IDSUTunPeer _connectionTypeForConnection:](self, "_connectionTypeForConnection:", v27);

  LOBYTE(v33) = a14;
  LOBYTE(v32) = a13;
  LOWORD(v31) = __PAIR16__(a10, a9);
  objc_msgSend( WeakRetained,  "peer:dataReceived:topic:command:fromID:messageID:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:messageUUID: priority:isCompressed:connectionType:didWakeHint:",  self,  v26,  v25,  v24,  v23,  v22,  v31,  v21,  v34,  v29,  v32,  v30,  v33);
}

- (void)connection:(id)a3 messageReceived:(id)a4 topic:(id)a5 command:(id)a6 fromID:(id)a7 messageID:(id)a8 wantsAppAck:(BOOL)a9 expectsPeerResponse:(BOOL)a10 peerResponseIdentifier:(id)a11 messageUUID:(id)a12 isCompressed:(BOOL)a13 didWakeHint:(BOOL)a14
{
  id v34 = a12;
  id v21 = a11;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  objc_msgSend( v28,  "assertRunningWithPriority:",  -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v27));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v29 = -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v27);
  int64_t v30 = -[IDSUTunPeer _connectionTypeForConnection:](self, "_connectionTypeForConnection:", v27);

  LOBYTE(v33) = a14;
  LOBYTE(v32) = a13;
  LOWORD(v31) = __PAIR16__(a10, a9);
  objc_msgSend( WeakRetained,  "peer:messageReceived:topic:command:fromID:messageID:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:messageUU ID:priority:isCompressed:connectionType:didWakeHint:",  self,  v26,  v25,  v24,  v23,  v22,  v31,  v21,  v34,  v29,  v32,  v30,  v33);
}

- (void)connection:(id)a3 receivedAppLevelAckWithTopic:(id)a4 fromID:(id)a5 messageID:(id)a6 peerResponseIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  objc_msgSend( v17,  "assertRunningWithPriority:",  -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v16));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v18 = -[IDSUTunPeer _priorityForConnection:](self, "_priorityForConnection:", v16);
  int64_t v19 = -[IDSUTunPeer _connectionTypeForConnection:](self, "_connectionTypeForConnection:", v16);

  [WeakRetained peer:self receivedAppLevelAckWithTopic:v15 fromID:v14 messageID:v13 peerResponseIdentifier:v12 priority:v18 connectionType:v19];
}

- (void)connectionHasSpaceForMessages:(id)a3 dataProtectionClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  im_assert_primary_base_queue(v11, v6);
  id v7 = [v11 idsPriority];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v7 == (id)300)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 supportedMessageTypes]);
    [WeakRetained peerHasSpaceForUrgentMessages:self dataProtectionClass:v4 withTypes:v9];
  }

  else
  {
    id v10 = [v11 idsPriority];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 supportedMessageTypes]);
    [WeakRetained peerHasSpaceForNonUrgentMessages:self priority:v10 dataProtectionClass:v4 withTypes:v9];
  }
}

- (void)setPendingCloudEnable:(BOOL)a3
{
  self->_pendingCloudEnable = 1;
  if (!self->_supportsCloudConnections)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100059344;
    v3[3] = &unk_1008F7FD0;
    v3[4] = self;
    -[IDSUTunPeer performBlockForDirectConnections:](self, "performBlockForDirectConnections:", v3);
  }

- (void)connectionIsEmpty:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_emptyStatesLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_emptyStates,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  v4);
  os_unfair_lock_unlock(&self->_emptyStatesLock);
  if (self->_pendingCloudEnable && !self->_supportsCloudConnections)
  {
    uint64_t v5 = OSLogHandleForTransportCategory("UTunPeer");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if ([v4 idsPriority] == (id)300)
      {
        id v7 = @"URGENT";
      }

      else
      {
        id v8 = [v4 idsPriority];
        id v7 = @"Sync";
        if (v8 == (id)200) {
          id v7 = @"Default";
        }
      }

      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Enabling %@ Cloud Connections on this peer",  buf,  0xCu);
    }

    uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
    if ((_DWORD)v10 && _IDSShouldLogTransport(v10))
    {
      if ([v4 idsPriority] == (id)300)
      {
        id v11 = @"URGENT";
      }

      else
      {
        id v12 = [v4 idsPriority];
        id v11 = @"Sync";
        if (v12 == (id)200) {
          id v11 = @"Default";
        }
      }

      id v15 = v11;
      _IDSLogTransport(@"UTunPeer", @"IDS", @"Enabling %@ Cloud Connections on this peer");
      if (_IDSShouldLog(0LL, @"UTunPeer"))
      {
        if (objc_msgSend(v4, "idsPriority", v15) == (id)300)
        {
          id v13 = @"URGENT";
        }

        else
        {
          id v14 = [v4 idsPriority];
          id v13 = @"Sync";
          if (v14 == (id)200) {
            id v13 = @"Default";
          }
        }

        id v15 = v13;
        _IDSLogV(0LL, @"IDSFoundation", @"UTunPeer", @"Enabling %@ Cloud Connections on this peer");
      }
    }

    *(_WORD *)&self->_BOOL supportsCloudConnections = 1;
    -[IDSUTunPeer enableCloudConnection](self, "enableCloudConnection", v15);
  }

  if (!self->_isPeerAlwaysConnected) {
    -[IDSUTunPeer _startDisableTimerIfNecessary](self, "_startDisableTimerIfNecessary");
  }
}

- (void)connectionIsEmptyOfCloudMessages:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("UTunPeer");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"YES";
    if (self->_pendingCloudEnable) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    BOOL isPeerAlwaysConnected = self->_isPeerAlwaysConnected;
    if (self->_supportsCloudConnections) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    if (!isPeerAlwaysConnected) {
      id v7 = @"NO";
    }
    uint64_t v33 = v8;
    __int16 v34 = 2112;
    uint64_t v35 = v10;
    __int16 v36 = 2112;
    __int128 v37 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_pendingCloudEnable: %@, _supportsCloudConnections: %@, _isPeerAlwaysConnected: %@",  buf,  0x20u);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12 && _IDSShouldLogTransport(v12))
  {
    id v13 = self->_pendingCloudEnable ? @"YES" : @"NO";
    id v14 = self->_supportsCloudConnections ? @"YES" : @"NO";
    id v15 = self->_isPeerAlwaysConnected ? @"YES" : @"NO";
    int64_t v30 = v14;
    uint64_t v31 = v15;
    int64_t v29 = v13;
    _IDSLogTransport( @"UTunPeer",  @"IDS",  @"_pendingCloudEnable: %@, _supportsCloudConnections: %@, _isPeerAlwaysConnected: %@");
    if (_IDSShouldLog(0LL, @"UTunPeer"))
    {
      if (self->_pendingCloudEnable) {
        id v16 = @"YES";
      }
      else {
        id v16 = @"NO";
      }
      if (self->_supportsCloudConnections) {
        uint64_t v17 = @"YES";
      }
      else {
        uint64_t v17 = @"NO";
      }
      if (self->_isPeerAlwaysConnected) {
        int64_t v18 = @"YES";
      }
      else {
        int64_t v18 = @"NO";
      }
      int64_t v30 = (__CFString *)v17;
      uint64_t v31 = (__CFString *)v18;
      int64_t v29 = (__CFString *)v16;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"_pendingCloudEnable: %@, _supportsCloudConnections: %@, _isPeerAlwaysConnected: %@");
    }
  }

  if (self->_pendingCloudEnable && !self->_supportsCloudConnections)
  {
    uint64_t v19 = OSLogHandleForTransportCategory("UTunPeer");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if ([v4 idsPriority] == (id)300)
      {
        id v21 = @"URGENT";
      }

      else
      {
        id v22 = [v4 idsPriority];
        id v21 = @"Sync";
        if (v22 == (id)200) {
          id v21 = @"Default";
        }
      }

      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Enabling %@ Cloud Connections on this peer",  buf,  0xCu);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24 && _IDSShouldLogTransport(v24))
    {
      if ([v4 idsPriority] == (id)300)
      {
        id v25 = @"URGENT";
      }

      else
      {
        id v26 = [v4 idsPriority];
        id v25 = @"Sync";
        if (v26 == (id)200) {
          id v25 = @"Default";
        }
      }

      int64_t v29 = (__CFString *)v25;
      _IDSLogTransport(@"UTunPeer", @"IDS", @"Enabling %@ Cloud Connections on this peer");
      if (_IDSShouldLog(0LL, @"UTunPeer"))
      {
        if (objc_msgSend(v4, "idsPriority", v29) == (id)300)
        {
          id v27 = @"URGENT";
        }

        else
        {
          id v28 = [v4 idsPriority];
          id v27 = @"Sync";
          if (v28 == (id)200) {
            id v27 = @"Default";
          }
        }

        int64_t v29 = (__CFString *)v27;
        _IDSLogV(0LL, @"IDSFoundation", @"UTunPeer", @"Enabling %@ Cloud Connections on this peer");
      }
    }

    *(_WORD *)&self->_BOOL supportsCloudConnections = 1;
    -[IDSUTunPeer enableCloudConnection](self, "enableCloudConnection", v29, v30, v31);
  }

  if (!self->_isPeerAlwaysConnected) {
    -[IDSUTunPeer _startCloudDisableTimerIfNecessary](self, "_startCloudDisableTimerIfNecessary");
  }
}

- (void)_handleCBUUIDDidConnect:(id)a3 isDefaultPairedDevice:(BOOL)a4 isAlwaysConnected:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  im_assert_primary_base_queue(v8, v9);
  uint64_t v10 = OSLogHandleForTransportCategory("UTunPeer");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = self;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ LinkManager did connect cbuuid %@ - enabling connections",  buf,  0x16u);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      id v21 = self;
      unint64_t v22 = (unint64_t)v8;
      _IDSLogTransport( @"UTunPeer",  @"IDS",  @"%@ LinkManager did connect cbuuid %@ - enabling connections");
      if (_IDSShouldLog(0LL, @"UTunPeer"))
      {
        id v21 = self;
        unint64_t v22 = (unint64_t)v8;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"%@ LinkManager did connect cbuuid %@ - enabling connections");
      }
    }
  }

  if (v5) {
    -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", &stru_1008F8018);
  }
  if (!a4)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lockedContinuityPeerID:v8]);

    if (!v15)
    {
      ++self->_continuityConnectCount;
      uint64_t v16 = OSLogHandleForIDSCategory("UTunPeer");
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uniqueID = self->_uniqueID;
        int continuityConnectCount = self->_continuityConnectCount;
        *(_DWORD *)buf = 138412546;
        id v26 = (IDSUTunPeer *)uniqueID;
        __int16 v27 = 1024;
        LODWORD(v28) = continuityConnectCount;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "continuityConnectCount for peer %@ is changed to %d.",  buf,  0x12u);
      }

      if (os_log_shim_legacy_logging_enabled(v20) && _IDSShouldLog(0LL, @"UTunPeer"))
      {
        id v21 = (IDSUTunPeer *)self->_uniqueID;
        unint64_t v22 = self->_continuityConnectCount;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"continuityConnectCount for peer %@ is changed to %d.");
      }
    }
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100059C9C;
  v23[3] = &unk_1008F7F28;
  BOOL v24 = a4;
  -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", v23, v21, v22);
  self->_BOOL isPeerAlwaysConnected = v5;
  if (!v5)
  {
    -[IDSUTunPeer _clearDisableTimer](self, "_clearDisableTimer");
    -[IDSUTunPeer _startDisableTimerIfNecessary](self, "_startDisableTimerIfNecessary");
  }
}

- (void)manager:(id)a3 cbuuidDidConnect:(id)a4 isAlwaysConnected:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = (IDSUTunPeer *)a4;
  im_assert_primary_base_queue(v9, v10);
  uint64_t v11 = OSLogHandleForIDSCategory("UTunPeer");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    if (v5) {
      uint64_t v13 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v49 = v9;
    __int16 v50 = 2112;
    __int128 v51 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "manager:cbuuidDidConnect:%@ isAlwaysConnected:%@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(0LL, @"UTunPeer"))
  {
    id v15 = @"NO";
    if (v5) {
      id v15 = @"YES";
    }
    __int128 v37 = v9;
    uint64_t v39 = v15;
    _IDSLogV(0LL, @"IDSFoundation", @"UTunPeer", @"manager:cbuuidDidConnect:%@ isAlwaysConnected:%@");
  }

  BOOL v16 = -[NSString isEqualToString:]( self->_uniqueID,  "isEqualToString:",  IDSDeviceDefaultPairedDeviceUniqueID,  v37,  v39);
  if (v16)
  {
    uint64_t v17 = 0LL;
    goto LABEL_14;
  }

  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance"));
  uint64_t v17 = (IDSUTunPeer *)objc_claimAutoreleasedReturnValue([v18 lockedContinuityPeerID:v9]);

  if (!v17 || (-[IDSUTunPeer isEqualToString:](v17, "isEqualToString:", self->_uniqueID) & 1) != 0)
  {
LABEL_14:
    if (v9 && -[NSString isEqualToString:](self->_btUUID, "isEqualToString:", v9))
    {
      if (v16 || v17)
      {
        uint64_t v31 = OSLogHandleForIDSCategory("UTunPeer");
        uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uniqueID = self->_uniqueID;
          __int16 v34 = @"NO";
          *(_DWORD *)buf = 138412802;
          if (v16) {
            __int16 v34 = @"YES";
          }
          uint64_t v49 = (IDSUTunPeer *)uniqueID;
          __int16 v50 = 2112;
          __int128 v51 = v34;
          __int16 v52 = 2112;
          dispatch_time_t v53 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Enable peer %@ now. (isDefaultPairedDevice %@   lockedPeer %@)",  buf,  0x20u);
        }

        if (os_log_shim_legacy_logging_enabled(v35)
          && _IDSShouldLog(0LL, @"UTunPeer"))
        {
          __int16 v36 = @"NO";
          if (v16) {
            __int16 v36 = @"YES";
          }
          __int16 v40 = v36;
          __int16 v41 = v17;
          id v38 = self->_uniqueID;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"Enable peer %@ now. (isDefaultPairedDevice %@   lockedPeer %@)");
        }

        -[IDSUTunPeer _handleCBUUIDDidConnect:isDefaultPairedDevice:isAlwaysConnected:]( self,  "_handleCBUUIDDidConnect:isDefaultPairedDevice:isAlwaysConnected:",  v9,  v16,  v5,  v38,  v40,  v41);
      }

      else
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
        uint64_t v20 = self->_uniqueID;
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = sub_10005A2D0;
        v44[3] = &unk_1008F8040;
        v44[4] = self;
        uint64_t v45 = v9;
        BOOL v46 = v16;
        BOOL v47 = v5;
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_10005A2E4;
        v42[3] = &unk_1008F5F80;
        v42[4] = self;
        uint64_t v43 = v45;
        [v19 addContinuityPeer:v20 btUUID:v43 connectBlock:v44 failureBlock:v42];

        uint64_t v17 = 0LL;
      }
    }

    else
    {
      uint64_t v21 = OSLogHandleForTransportCategory("UTunPeer");
      unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        btUUID = self->_btUUID;
        *(_DWORD *)buf = 138412802;
        uint64_t v49 = self;
        __int16 v50 = 2112;
        __int128 v51 = (const __CFString *)v9;
        __int16 v52 = 2112;
        dispatch_time_t v53 = (IDSUTunPeer *)btUUID;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "IGNORING %@ LinkManager did connect cbuuid %@ - enabling connections (%@)",  buf,  0x20u);
      }

      uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
      if ((_DWORD)v25)
      {
        if (_IDSShouldLogTransport(v25))
        {
          _IDSLogTransport( @"UTunPeer",  @"IDS",  @"IGNORING %@ LinkManager did connect cbuuid %@ - enabling connections (%@)");
          if (_IDSShouldLog(0LL, @"UTunPeer")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"IGNORING %@ LinkManager did connect cbuuid %@ - enabling connections (%@)");
          }
        }
      }
    }

    goto LABEL_41;
  }

  uint64_t v26 = OSLogHandleForTransportCategory("UTunPeer");
  __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = self->_uniqueID;
    *(_DWORD *)buf = 138412802;
    uint64_t v49 = v17;
    __int16 v50 = 2112;
    __int128 v51 = (const __CFString *)v9;
    __int16 v52 = 2112;
    dispatch_time_t v53 = (IDSUTunPeer *)v28;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Peer %@ is already locked for btUUID %@, ignore peer %@.",  buf,  0x20u);
  }

  uint64_t v30 = os_log_shim_legacy_logging_enabled(v29);
  if ((_DWORD)v30)
  {
    if (_IDSShouldLogTransport(v30))
    {
      _IDSLogTransport( @"UTunPeer",  @"IDS",  @"Peer %@ is already locked for btUUID %@, ignore peer %@.");
      if (_IDSShouldLog(0LL, @"UTunPeer")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"Peer %@ is already locked for btUUID %@, ignore peer %@.");
      }
    }
  }

- (void)_handleCBUUIDFailToConnect:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  im_assert_primary_base_queue(v7, v8);
  if (v6 && -[NSString isEqualToString:](self->_btUUID, "isEqualToString:", v6))
  {
    uint64_t v9 = OSLogHandleForTransportCategory("UTunPeer");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "cbuuidDidFailToConnect for peer %@, disabling peer connections!",  buf,  0xCu);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        id v13 = v6;
        _IDSLogTransport( @"UTunPeer",  @"IDS",  @"cbuuidDidFailToConnect for peer %@, disabling peer connections!");
        if (_IDSShouldLog(0LL, @"UTunPeer"))
        {
          id v13 = v6;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"cbuuidDidFailToConnect for peer %@, disabling peer connections!");
        }
      }
    }

    -[IDSUTunPeer _clearDisableTimer](self, "_clearDisableTimer", v13);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10005A4B0;
    v14[3] = &unk_1008F7FD0;
    id v15 = v7;
    -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", v14);
  }
}

- (void)manager:(id)a3 cbuuidDidFailToConnect:(id)a4 withReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_originalbtUUID)
  {
    uint64_t v11 = OSLogHandleForTransportCategory("UTunPeer");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Skip handling _handleCBUUIDFailToConnect for Phone continuity local message case.",  v15,  2u);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        _IDSLogTransport( @"UTunPeer",  @"IDS",  @"Skip handling _handleCBUUIDFailToConnect for Phone continuity local message case.");
        if (_IDSShouldLog(0LL, @"UTunPeer")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"Skip handling _handleCBUUIDFailToConnect for Phone continuity local message case.");
        }
      }
    }
  }

  else
  {
    -[IDSUTunPeer _handleCBUUIDFailToConnect:withReason:](self, "_handleCBUUIDFailToConnect:withReason:", v9, v10);
  }
}

- (void)manager:(id)a3 cbuuidDidDisconnect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  im_assert_primary_base_queue(v7, v8);
  -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", &stru_1008F8060);
  if (v7 && -[NSString isEqualToString:](self->_btUUID, "isEqualToString:", v7))
  {
    uint64_t v9 = OSLogHandleForTransportCategory("UTunPeer");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      BOOL v16 = self;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ LinkManager did disconnect cbuuid %@ - kicking our disable timer",  buf,  0x16u);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        uint64_t v13 = self;
        id v14 = v7;
        _IDSLogTransport( @"UTunPeer",  @"IDS",  @"%@ LinkManager did disconnect cbuuid %@ - kicking our disable timer");
        if (_IDSShouldLog(0LL, @"UTunPeer"))
        {
          uint64_t v13 = self;
          id v14 = v7;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"%@ LinkManager did disconnect cbuuid %@ - kicking our disable timer");
        }
      }
    }

    -[IDSUTunPeer _startDisableTimerIfNecessary](self, "_startDisableTimerIfNecessary", v13, v14);
  }
}

- (BOOL)manager:(id)a3 cbuuidDidDiscover:(id)a4
{
  id v5 = a4;
  im_assert_primary_base_queue(v5, v6);
  if (v5 && -[NSString isEqualToString:](self->_btUUID, "isEqualToString:", v5))
  {
    BOOL isNearby = self->_isNearby;
    BOOL v8 = 1;
    self->_BOOL isNearby = 1;
    if (!isNearby)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained peerNearbyStateChanged:self forceNotify:0];

      BOOL v8 = 1;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_allConnectionsAreIdle
{
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = -86;
  id v3 = self->_urgentDirectConnections;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10005AA8C;
  v20[3] = &unk_1008F7E58;
  id v5 = v3;
  uint64_t v21 = v5;
  unint64_t v22 = &v23;
  [v4 performBlockSYNCHRONOUSLYWithPriority:v20 priority:300];

  if (!*((_BYTE *)v24 + 24)) {
    goto LABEL_4;
  }
  uint64_t v6 = self->_defaultDirectConnections;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10005AB94;
  v17[3] = &unk_1008F7E58;
  BOOL v8 = v6;
  id v18 = v8;
  uint64_t v19 = &v23;
  [v7 performBlockSYNCHRONOUSLYWithPriority:v17 priority:200];

  if (*((_BYTE *)v24 + 24))
  {
    uint64_t v9 = self->_syncDirectConnections;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10005AC9C;
    v14[3] = &unk_1008F7E58;
    uint64_t v11 = v9;
    id v15 = v11;
    BOOL v16 = &v23;
    [v10 performBlockSYNCHRONOUSLYWithPriority:v14 priority:100];

    BOOL v12 = *((_BYTE *)v24 + 24) != 0;
  }

  else
  {
LABEL_4:
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v12;
}

- (void)_clearDisableTimer
{
  disableTimer = self->_disableTimer;
  self->_disableTimer = 0LL;
}

- (void)_startDisableTimerIfNecessary
{
  disableTimer = self->_disableTimer;
  if (disableTimer)
  {
    -[IMDispatchTimer updateTimerInterval:repeats:](disableTimer, "updateTimerInterval:repeats:", 15LL, 0LL);
  }

  else
  {
    id v4 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
    uint64_t v6 = im_primary_queue(v4, v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10005AE9C;
    v10[3] = &unk_1008F8088;
    v10[4] = self;
    BOOL v8 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v4,  "initWithQueue:interval:repeats:handlerBlock:",  v7,  15LL,  0LL,  v10);
    uint64_t v9 = self->_disableTimer;
    self->_disableTimer = v8;
  }

- (void)_disableTimerFired:(id)a3
{
  if (-[IDSUTunPeer _allConnectionsAreIdle](self, "_allConnectionsAreIdle"))
  {
    if (self->_btUUID) {
      -[IDSUTunPeer performBlockForDirectConnections:](self, "performBlockForDirectConnections:", &stru_1008F80A8);
    }
  }

- (BOOL)_allCloudConnectionsAreIdle
{
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = -86;
  id v3 = self->_urgentDirectConnections;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10005B0FC;
  v14[3] = &unk_1008F7E58;
  uint64_t v5 = v3;
  id v15 = v5;
  BOOL v16 = &v17;
  [v4 performBlockSYNCHRONOUSLYWithPriority:v14 priority:300];

  if (*((_BYTE *)v18 + 24) && -[NSArray count](self->_defaultDirectConnections, "count"))
  {
    uint64_t v6 = self->_defaultDirectConnections;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10005B21C;
    v11[3] = &unk_1008F7E58;
    BOOL v8 = v6;
    BOOL v12 = v8;
    uint64_t v13 = &v17;
    [v7 performBlockSYNCHRONOUSLYWithPriority:v11 priority:200];
  }

  char v9 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (void)_clearCloudDisableTimer
{
  cloudDisableTimer = self->_cloudDisableTimer;
  self->_cloudDisableTimer = 0LL;
}

- (void)_startCloudDisableTimerIfNecessary
{
  cloudDisableTimer = self->_cloudDisableTimer;
  if (cloudDisableTimer)
  {
    unint64_t v4 = (unint64_t)sub_10005AF08();
    -[IMDispatchTimer updateTimerInterval:repeats:](cloudDisableTimer, "updateTimerInterval:repeats:", v4, 0LL);
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
    uint64_t v7 = im_primary_queue(v5, v6);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10005B440;
    v11[3] = &unk_1008F8088;
    void v11[4] = self;
    char v9 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v5,  "initWithQueue:interval:repeats:handlerBlock:",  v8,  (unint64_t)sub_10005AF08(),  0LL,  v11);
    id v10 = self->_cloudDisableTimer;
    self->_cloudDisableTimer = v9;
  }

- (void)_cloudDisableTimerFired:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  -[IDSUTunPeer _clearCloudDisableTimer](self, "_clearCloudDisableTimer");
  if (-[IDSUTunPeer _allCloudConnectionsAreIdle](self, "_allCloudConnectionsAreIdle"))
  {
    if (self->_isDefaultPairedDevice) {
      p_uniqueID = (NSString **)&kIDSDefaultPairedDeviceID;
    }
    else {
      p_uniqueID = &self->_uniqueID;
    }
    uint64_t v7 = *p_uniqueID;
    uint64_t v8 = OSLogHandleForTransportCategory("UTunPeer");
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Tearing Down Global Link For %@ Due To Inactivity",  buf,  0xCu);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11)
    {
      if (_IDSShouldLogTransport(v11))
      {
        _IDSLogTransport(@"UTunPeer", @"IDS", @"Tearing Down Global Link For %@ Due To Inactivity");
        if (_IDSShouldLog(0LL, @"UTunPeer")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"Tearing Down Global Link For %@ Due To Inactivity");
        }
      }
    }

    if (self->_shouldUseIPsecLink)
    {
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
      [v12 defaultPeerSetWantsQuickRelayRequest:0];
    }

    else
    {
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
      [v12 disconnectGlobalLinkForDevice:v7 isReinitiating:0 completionHandler:0];
    }
  }
}

- (void)setIsPeerAlwaysConnected:(BOOL)a3
{
  BOOL v3 = a3;
  im_assert_primary_base_queue(self, a2);
  if (self->_isPeerAlwaysConnected != v3)
  {
    self->_BOOL isPeerAlwaysConnected = v3;
    uint64_t v5 = OSLogHandleForTransportCategory("UTunPeer");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"YES";
      if (!self->_isPeerAlwaysConnected) {
        uint64_t v7 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ isPeerAlwaysConnected is changed to %@",  buf,  0x16u);
    }

    uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
    if ((_DWORD)v9)
    {
      if (_IDSShouldLogTransport(v9))
      {
        _IDSLogTransport(@"UTunPeer", @"IDS", @"%@ isPeerAlwaysConnected is changed to %@");
      }
    }

    if (self->_isPeerAlwaysConnected) {
      -[IDSUTunPeer _clearCloudDisableTimer](self, "_clearCloudDisableTimer");
    }
    else {
      -[IDSUTunPeer _startCloudDisableTimerIfNecessary](self, "_startCloudDisableTimerIfNecessary");
    }
  }

- (void)forceOTRNegotiationForTopic:(id)a3 priority:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_shouldUseIPsecLink)
  {
    uint64_t v10 = OSLogHandleForTransportCategory("UTunPeer");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ forceOTRNegotiationForTopic is no-op when ipsec is used",  buf,  0xCu);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        _IDSLogTransport( @"UTunPeer",  @"IDS",  @"%@ forceOTRNegotiationForTopic is no-op when ipsec is used");
        if (_IDSShouldLog(0LL, @"UTunPeer")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunPeer",  @"%@ forceOTRNegotiationForTopic is no-op when ipsec is used");
        }
      }
    }
  }

  else
  {
    BOOL supportsCloudConnections = self->_supportsCloudConnections;
    switch(a4)
    {
      case 100LL:
        id v18 = self->_syncDirectConnections;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_10005BC94;
        v30[3] = &unk_1008F80D0;
        uint64_t v31 = v18;
        id v32 = v8;
        uint64_t v34 = 100LL;
        id v33 = v9;
        BOOL v35 = supportsCloudConnections;
        char v20 = v18;
        [v19 performBlockSyncPriority:v30];

        break;
      case 200LL:
        uint64_t v21 = self->_defaultDirectConnections;
        unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_10005BDBC;
        v24[3] = &unk_1008F80D0;
        uint64_t v25 = v21;
        id v26 = v8;
        uint64_t v28 = 200LL;
        id v27 = v9;
        BOOL v29 = supportsCloudConnections;
        uint64_t v23 = v21;
        [v22 performBlockDefaultPriority:v24];

        break;
      case 300LL:
        id v15 = self->_urgentDirectConnections;
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472LL;
        v36[2] = sub_10005BB6C;
        v36[3] = &unk_1008F80D0;
        __int128 v37 = v15;
        id v38 = v8;
        uint64_t v40 = 300LL;
        id v39 = v9;
        BOOL v41 = supportsCloudConnections;
        uint64_t v17 = v15;
        [v16 performBlockUrgentPriority:v36];

        break;
    }
  }
}

- (void)admissionPolicyChangedForTopic:(id)a3 allowed:(BOOL)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005BF64;
  v7[3] = &unk_1008F80F8;
  id v8 = a3;
  BOOL v9 = a4;
  id v6 = v8;
  -[IDSUTunPeer performBlockForAllConnections:](self, "performBlockForAllConnections:", v7);
}

- (BOOL)_shouldLogTransportStats
{
  if (self->_isDefaultPairedDevice) {
    return IDSShouldPowerLog(@"IDS Local Network Stats", a2);
  }
  else {
    return 0;
  }
}

- (IDSUTunPeerDelegate)delegate
{
  return (IDSUTunPeerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)btUUID
{
  return self->_btUUID;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (BOOL)isDefaultPairedDevice
{
  return self->_isDefaultPairedDevice;
}

- (void)setIsDefaultPairedDevice:(BOOL)a3
{
  self->_isDefaultPairedDevice = a3;
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (void)setIsNearby:(BOOL)a3
{
  self->_BOOL isNearby = a3;
}

- (BOOL)localSetupInProgress
{
  return self->_localSetupInProgress;
}

- (BOOL)isMagnetIndicatingPeerIsAwake
{
  return self->_isMagnetIndicatingPeerIsAwake;
}

- (BOOL)supportsCloudConnections
{
  return self->_supportsCloudConnections;
}

- (BOOL)pendingCloudEnable
{
  return self->_pendingCloudEnable;
}

- (BOOL)isPeerAlwaysConnected
{
  return self->_isPeerAlwaysConnected;
}

- (int)continuityConnectCount
{
  return self->_continuityConnectCount;
}

- (void)setContinuityConnectCount:(int)a3
{
  self->_int continuityConnectCount = a3;
}

- (NSString)originalbtUUID
{
  return self->_originalbtUUID;
}

- (void)setOriginalbtUUID:(id)a3
{
}

- (BOOL)isCloudConnected
{
  return self->_isCloudConnected;
}

- (void)setIsCloudConnected:(BOOL)a3
{
  self->_isCloudConnected = a3;
}

- (BOOL)isClassCConnected
{
  return self->_isClassCConnected;
}

- (void)setIsClassCConnected:(BOOL)a3
{
  self->_isClassCConnected = a3;
}

- (unsigned)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(unsigned __int8)a3
{
  self->_linkType = a3;
}

- (os_unfair_lock_s)emptyStatesLock
{
  return self->_emptyStatesLock;
}

- (void)setEmptyStatesLock:(os_unfair_lock_s)a3
{
  self->_emptyStatesLock = a3;
}

- (void).cxx_destruct
{
}

@end