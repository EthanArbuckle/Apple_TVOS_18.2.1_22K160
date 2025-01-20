@interface APSCourierConnectionProtocolConnection
- (APSCourierConnectionManager)connectionManager;
- (APSCourierConnectionProtocolConnection)init;
- (BOOL)didPushCauseWake;
- (BOOL)generationMatches:(unint64_t)a3;
- (BOOL)isConnected;
- (BOOL)isPowerEfficientToUse;
- (BOOL)isPreferredInterface;
- (BOOL)isSuspended;
- (BOOL)secureHandshakeEnabled;
- (NSHashTable)dataListeners;
- (NSHashTable)stateListeners;
- (NSNumber)maxLargeMessageSize;
- (NSNumber)maxMessageSize;
- (NSString)description;
- (NSString)identifier;
- (NSString)serverHostname;
- (NSString)serverIPAddress;
- (id)aps_prettyDescription;
- (id)interfaceMonitor;
- (id)sendMessage:(id)a3 topicHash:(id)a4 lastRTT:(id)a5 token:(id)a6 ultraConstrainedAllowed:(BOOL)a7 withCompletion:(id)a8;
- (int)linkQuality;
- (int64_t)connectionType;
- (int64_t)interface;
- (int64_t)interfaceConstraint;
- (void)addDataListener:(id)a3;
- (void)addStateListener:(id)a3;
- (void)connectionSetupComplete;
- (void)disconnectWithReason:(unsigned int)a3;
- (void)enumerateDataRecipient:(id)a3;
- (void)enumerateStateListeners:(id)a3;
- (void)noteConnected;
- (void)noteConnectionFailureWithReason:(unsigned int)a3;
- (void)noteInvalidPresence;
- (void)removeDataListener:(id)a3;
- (void)removeStateListener:(id)a3;
- (void)sendActivityTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7;
- (void)sendConnectMessageWithToken:(id)a3 presenceFlags:(unsigned int)a4 certificates:(id)a5 nonce:(id)a6 signature:(id)a7 hostCertificateInfo:(id)a8 withCompletion:(id)a9;
- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 certificates:(id)a6 nonce:(id)a7 signature:(id)a8 hostCertificateInfo:(id)a9 withCompletion:(id)a10;
- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 hwVersion:(id)a6 swVersion:(id)a7 swBuild:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 withCompletion:(id)a12;
- (void)sendFilterMessageWithEnabledTopicsByHash:(id)a3 ignoredTopicsByHash:(id)a4 opportunisticTopicsByHash:(id)a5 nonWakingTopicsByHash:(id)a6 pausedTopicsByHash:(id)a7 saltsByTopic:(id)a8 token:(id)a9 version:(unint64_t)a10 expectsResponse:(BOOL)a11 withCompletion:(id)a12;
- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 generation:(int64_t)a5 token:(id)a6;
- (void)sendMessageTracingAckWithTopicHash:(id)a3 topic:(id)a4 tracingUUID:(id)a5 status:(int)a6 token:(id)a7;
- (void)sendMessageTransportAcknowledgeMessage;
- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5;
- (void)sendSetActiveState:(BOOL)a3 forInterval:(unsigned int)a4;
- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4;
- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 withCompletion:(id)a9;
- (void)setConnectionManager:(id)a3;
- (void)setDataListeners:(id)a3;
- (void)setInterface:(int64_t)a3;
- (void)setSecureHandshakeEnabled:(BOOL)a3;
- (void)setStateListeners:(id)a3;
@end

@implementation APSCourierConnectionProtocolConnection

- (APSCourierConnectionProtocolConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___APSCourierConnectionProtocolConnection;
  v2 = -[APSCourierConnectionProtocolConnection init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 517LL));
    stateListeners = v2->_stateListeners;
    v2->_stateListeners = (NSHashTable *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 517LL));
    dataListeners = v2->_dataListeners;
    v2->_dataListeners = (NSHashTable *)v5;
  }

  return v2;
}

- (void)enumerateStateListeners:(id)a3
{
  v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = self->_stateListeners;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateDataRecipient:(id)a3
{
  v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = self->_dataListeners;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)interfaceMonitor
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "pcInterfaceMonitorOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));

  return v4;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = sub_10003CEE4(-[APSCourierConnectionProtocolConnection interface](self, "interface"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; %@>",
                   v3,
                   self,
                   v5));

  return (NSString *)v6;
}

- (id)aps_prettyDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionTimeForInterface:self->_interface]);

  id v5 = sub_10003CEE4(self->_interface);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v4)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v8 = v7;
    [v4 doubleValue];
    double v10 = v8 - v9;
  }

  else
  {
    double v10 = 0.0;
  }

  if (-[APSCourierConnectionProtocolConnection isConnected](self, "isConnected")) {
    __int128 v11 = @"YES";
  }
  else {
    __int128 v11 = @"NO";
  }
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection serverIPAddress](self, "serverIPAddress"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection serverHostname](self, "serverHostname"));
  char v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@; connectedFor: %.1fs; isConnected: %@; serverIPAddress: %@; serverHostname: %@; linkQuality: %d>",
                    v6,
                    *(void *)&v10,
                    v11,
                    v12,
                    v13,
                    -[APSCourierConnectionProtocolConnection linkQuality](self, "linkQuality")));

  return v14;
}

- (void)addStateListener:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection stateListeners](self, "stateListeners"));
  [v5 addObject:v4];
}

- (void)removeStateListener:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection stateListeners](self, "stateListeners"));
  [v5 removeObject:v4];
}

- (void)addDataListener:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection dataListeners](self, "dataListeners"));
  [v5 addObject:v4];
}

- (void)removeDataListener:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection dataListeners](self, "dataListeners"));
  [v5 removeObject:v4];
}

- (BOOL)isSuspended
{
  v2 = self;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  LOBYTE(v2) = objc_msgSend( v3,  "isSuspendedOnInterface:",  -[APSCourierConnectionProtocolConnection interface](v2, "interface"));

  return (char)v2;
}

- (BOOL)isConnected
{
  v2 = self;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  LOBYTE(v2) = objc_msgSend( v3,  "isConnectedOnInterface:",  -[APSCourierConnectionProtocolConnection interface](v2, "interface"));

  return (char)v2;
}

- (BOOL)isPowerEfficientToUse
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection interfaceMonitor](self, "interfaceMonitor"));
  unsigned __int8 v3 = [v2 isRadioHot];

  return v3;
}

- (int)linkQuality
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection interfaceMonitor](self, "interfaceMonitor"));
  int v3 = [v2 linkQuality];

  return v3;
}

- (BOOL)isPreferredInterface
{
  v2 = self;
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v4 = [v3 preferredInterface];
  LOBYTE(v2) = v4 == (id)-[APSCourierConnectionProtocolConnection interface](v2, "interface");

  return (char)v2;
}

- (BOOL)didPushCauseWake
{
  v2 = self;
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 courierConnection]);
  LOBYTE(v2) = objc_msgSend( v4,  "didPushCauseWakeOnInterface:",  -[APSCourierConnectionProtocolConnection interface](v2, "interface"));

  return (char)v2;
}

- (NSString)serverIPAddress
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "serverIPAddressForInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));

  return (NSString *)v4;
}

- (NSString)serverHostname
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "serverHostnameForInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));

  return (NSString *)v4;
}

- (NSString)identifier
{
  return (NSString *)sub_10003CEE4(-[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (int64_t)connectionType
{
  int64_t result = self->_interface;
  if ((unint64_t)result >= 2)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000BFFA0(self, v4);
    }

    return 0LL;
  }

  return result;
}

- (NSNumber)maxMessageSize
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "maxMessageSizeForInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));

  return (NSNumber *)v4;
}

- (NSNumber)maxLargeMessageSize
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "maxLargeMessageSizeForInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));

  return (NSNumber *)v4;
}

- (int64_t)interfaceConstraint
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v4 = objc_msgSend( v3,  "interfaceConstraintForInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface"));

  return (int64_t)v4;
}

- (void)noteConnected
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v3,  "markInitiallyConnectedOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (void)connectionSetupComplete
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v3,  "_delayedPerformKeepAliveOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (void)disconnectWithReason:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v5,  "disconnectStreamForInterface:withReason:",  -[APSCourierConnectionProtocolConnection interface](self, "interface"),  v3);

  if ((_DWORD)v3 == 7)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
    objc_msgSend(v6, "stopManagerOnInterface:", -[APSCourierConnectionProtocolConnection interface](self, "interface"));
  }

- (void)noteConnectionFailureWithReason:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v5,  "handleConnectionFailureOnInterface:forceDelayedReconnect:withReason:",  -[APSCourierConnectionProtocolConnection interface](self, "interface"),  0,  v3);
}

- (void)noteInvalidPresence
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionRetryManager]);
  [v2 notePresenceFailure];
}

- (void)sendSetActiveState:(BOOL)a3 forInterval:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v7,  "sendSetActiveState:forInterval:onInterface:",  v5,  v4,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (void)sendMessageTracingAckWithTopicHash:(id)a3 topic:(id)a4 tracingUUID:(id)a5 status:(int)a6 token:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v14,  "sendMessageTracingAckWithTopicHash:tracingUUID:status:token:onInterface:",  v13,  v12,  v7,  v11,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 withCompletion:(id)a9
{
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = a5;
  id v16 = a9;
  id v17 = a7;
  id v18 = a4;
  id v19 = a3;
  id v20 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v20,  "sendTokenGenerateMessageWithTopicHash:baseToken:appId:expirationTTL:vapidPublicKeyHash:type:withCompletion:onInterface:",  v19,  v18,  v12,  v11,  v17,  a8,  v16,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v10,  "sendPubSubChannelListWithMetadata:baseToken:messageID:onInterface:",  v9,  v8,  v5,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (void)sendActivityTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v13,  "sendActivityTrackingRequestWithMessageID:pushToken:salt:trackingFlag:timestamp:onInterface:",  a3,  v12,  a5,  v8,  a7,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (BOOL)generationMatches:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  LOBYTE(a3) = objc_msgSend( v5,  "generationMatches:forInterface:",  a3,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));

  return a3;
}

- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 generation:(int64_t)a5 token:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v11,  "sendMessageAcknowledgeMessageWithResponse:messageId:token:onInterface:",  a3,  v10,  v9,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (void)sendMessageTransportAcknowledgeMessage
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v3,  "sendMessageTransportAcknowledgeMessageOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v7,  "sendTaskControlMessageWithMetadata:messageId:onInterface:",  v6,  a4,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (void)sendFilterMessageWithEnabledTopicsByHash:(id)a3 ignoredTopicsByHash:(id)a4 opportunisticTopicsByHash:(id)a5 nonWakingTopicsByHash:(id)a6 pausedTopicsByHash:(id)a7 saltsByTopic:(id)a8 token:(id)a9 version:(unint64_t)a10 expectsResponse:(BOOL)a11 withCompletion:(id)a12
{
  id v30 = a12;
  id v18 = a9;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v31 = (id)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allKeys]);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v22 allKeys]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v21 allKeys]);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v20 allKeys]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v19 allKeys]);

  LOBYTE(v29) = a11;
  objc_msgSend( v31,  "sendFilterMessageWithEnabledHashes:ignoredHashes:opportunisticHashes:nonWakingHashes:pausedHashes:token:version:expe ctsResponse:onInterface:withCompletion:",  v24,  v25,  v26,  v27,  v28,  v18,  a10,  v29,  -[APSCourierConnectionProtocolConnection interface](self, "interface"),  v30);
}

- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 hwVersion:(id)a6 swVersion:(id)a7 swBuild:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 withCompletion:(id)a12
{
  uint64_t v15 = *(void *)&a4;
  id v39 = a12;
  id v36 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v37 = a3;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v23,  "currentKeepAliveIntervalOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
  unint64_t v25 = llround(v24 / 60.0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  v41 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v26,  "currentKeepAliveStateOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));

  v27 = -[APSKeepAliveMetadata initWithUsingWWAN:keepAliveInterval:delayedResponseInterval:usingServerStats:keepAliveState:hwVersion:swVersion:swBuild:]( objc_alloc(&OBJC_CLASS___APSKeepAliveMetadata),  "initWithUsingWWAN:keepAliveInterval:delayedResponseInterval:usingServerStats:keepAliveState:hwVersion:swVersion:swBuild:",  -[APSCourierConnectionProtocolConnection interface](self, "interface") == 0,  v25,  0LL,  0LL,  v41,  v22,  v21,  v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  v35 = v27;
  if ((_DWORD)v15 == 2) {
    uint64_t v29 = 0LL;
  }
  else {
    uint64_t v29 = v27;
  }
  v38 = v19;
  if ((_DWORD)v15 == 2) {
    id v19 = 0LL;
  }
  id v30 = v18;
  if ((_DWORD)v15 == 2)
  {
    id v18 = 0LL;
    id v31 = 0LL;
  }

  else
  {
    id v31 = v36;
  }

  if ((_DWORD)v15 == 2)
  {
    unsigned __int8 v32 = 0;
  }

  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
    unsigned __int8 v32 = [v34 redirectCount];
  }

  LOBYTE(v33) = v32;
  objc_msgSend( v28,  "sendConnectMessageWithToken:state:interface:activeInterval:presenceFlags:metadata:certificates:nonce:signature:redir ectCount:withCompletion:onInterface:",  v37,  v15,  3,  0,  a5,  v29,  v19,  v18,  v31,  v33,  v39,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));

  if ((_DWORD)v15 != 2) {
}
  }

- (void)sendConnectMessageWithToken:(id)a3 presenceFlags:(unsigned int)a4 certificates:(id)a5 nonce:(id)a6 signature:(id)a7 hostCertificateInfo:(id)a8 withCompletion:(id)a9
{
  id v40 = a9;
  id v42 = a8;
  id v41 = a7;
  id v15 = a6;
  id v43 = a5;
  id v39 = a3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v16,  "currentKeepAliveIntervalOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
  unint64_t v18 = llround(v17 / 60.0);

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  v45 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v19,  "currentKeepAliveStateOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));

  id v20 = -[APSKeepAliveMetadata initWithUsingWWAN:keepAliveInterval:keepAliveState:]( objc_alloc(&OBJC_CLASS___APSKeepAliveMetadata),  "initWithUsingWWAN:keepAliveInterval:keepAliveState:",  -[APSCourierConnectionProtocolConnection interface](self, "interface") == 0,  v18,  v45);
  else {
    int v21 = 0;
  }
  unsigned int v35 = v21;
  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  int64_t v33 = -[APSCourierConnectionProtocolConnection interface](self, "interface");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  unsigned __int8 v22 = [v38 redirectCount];
  id v37 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v36 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v37,  "tcpHandshakeTimeMillisecondsOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));
  double v23 = (double)(uint64_t)[v36 integerValue];
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v34,  "dnsResolutionTimeMillisecondsOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));
  double v24 = (double)(uint64_t)[v32 integerValue];
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  v26 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v25,  "tlsHandshakeTimeMillisecondsOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));
  double v27 = (double)(uint64_t)[v26 integerValue];
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v28,  "consecutiveConnectionFailureReasonOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));
  LOBYTE(v30) = v22;
  objc_msgSend( v31,  "sendConnectMessageWithToken:interface:activeInterval:presenceFlags:metadata:certificates:nonce:signature:hostCertifi cateInfo:redirectCount:tcpHandshakeTimeMilliseconds:dnsResolveTimeMilliseconds:tlsHandshakeTimeMilliseconds:consecut iveConnectionFailureReason:withCompletion:onInterface:",  v39,  v33,  v35,  a4,  v20,  v43,  v23,  v24,  v27,  v15,  v41,  v42,  v30,  v29,  v40,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 certificates:(id)a6 nonce:(id)a7 signature:(id)a8 hostCertificateInfo:(id)a9 withCompletion:(id)a10
{
  id v28 = a10;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  objc_msgSend( v20,  "currentKeepAliveIntervalOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
  unint64_t v22 = llround(v21 / 60.0);

  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v31 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v23,  "currentKeepAliveStateOnInterface:",  -[APSCourierConnectionProtocolConnection interface](self, "interface")));

  double v24 = -[APSKeepAliveMetadata initWithUsingWWAN:keepAliveInterval:keepAliveState:]( objc_alloc(&OBJC_CLASS___APSKeepAliveMetadata),  "initWithUsingWWAN:keepAliveInterval:keepAliveState:",  -[APSCourierConnectionProtocolConnection interface](self, "interface") == 0,  v22,  v31);
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  LOBYTE(v27) = [v26 redirectCount];
  objc_msgSend( v25,  "sendConnectMessageWithToken:state:presenceFlags:metadata:certificates:nonce:signature:hostCertificateInfo:redirectCo unt:withCompletion:onInterface:",  v19,  a4,  a5,  v24,  v18,  v17,  v16,  v15,  v27,  v28,  -[APSCourierConnectionProtocolConnection interface](self, "interface"));
}

- (id)sendMessage:(id)a3 topicHash:(id)a4 lastRTT:(id)a5 token:(id)a6 ultraConstrainedAllowed:(BOOL)a7 withCompletion:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSCourierConnectionProtocolConnection connectionManager](self, "connectionManager"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v19,  "_sendOutgoingMessage:topicHash:lastRTT:token:onInterface:ultraConstrainedAllowed:withCompletion:",  v18,  v17,  v16,  v15,  -[APSCourierConnectionProtocolConnection interface](self, "interface"),  v8,  v14));

  return v20;
}

- (int64_t)interface
{
  return self->_interface;
}

- (void)setInterface:(int64_t)a3
{
  self->_interface = a3;
}

- (APSCourierConnectionManager)connectionManager
{
  return (APSCourierConnectionManager *)objc_loadWeakRetained((id *)&self->_connectionManager);
}

- (void)setConnectionManager:(id)a3
{
}

- (NSHashTable)stateListeners
{
  return self->_stateListeners;
}

- (void)setStateListeners:(id)a3
{
}

- (NSHashTable)dataListeners
{
  return self->_dataListeners;
}

- (void)setDataListeners:(id)a3
{
}

- (BOOL)secureHandshakeEnabled
{
  return self->_secureHandshakeEnabled;
}

- (void)setSecureHandshakeEnabled:(BOOL)a3
{
  self->_secureHandshakeEnabled = a3;
}

- (void).cxx_destruct
{
}

@end