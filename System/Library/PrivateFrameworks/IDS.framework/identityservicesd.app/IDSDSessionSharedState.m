@interface IDSDSessionSharedState
- ($F18A97B9DD67A12B1A73262525205838)encryptionState;
- ($F18A97B9DD67A12B1A73262525205838)encryptionStateStruct;
- (BOOL)connectionTimerCleared;
- (BOOL)destinationIsDefaultPairedDevice:(id)a3;
- (BOOL)destinationIsGuestDevice:(id)a3;
- (BOOL)disableEncryption;
- (BOOL)disableRemoteDeviceEncryption;
- (BOOL)enableQuickRelay;
- (BOOL)enableSKE;
- (BOOL)enableSingleChannelDirectMode;
- (BOOL)encryptionInitialized;
- (BOOL)endSessionTimerCleared;
- (BOOL)forceInternetInvitation;
- (BOOL)inviteTimerCleared;
- (BOOL)isInUPlusOneMode;
- (BOOL)isInitiator;
- (BOOL)isScreenSharingSession;
- (BOOL)sharedSession;
- (BOOL)supportsReinitiate;
- (BOOL)useBTDatagramPipe;
- (BOOL)useQRDirectly;
- (BOOL)useSecureQRControlMessage;
- (IDSDSession)delegate;
- (IDSDSessionSharedState)initWithDictionary:(id)a3 serviceName:(id)a4 isInitiator:(BOOL)a5 uniqueID:(id)a6 accountID:(id)a7 destinations:(id)a8;
- (IDSMPFullLegacyIdentity)localUnauthenticatedFullIdentity;
- (IDSMPPublicLegacyIdentity)remoteUnauthenticatedPublicIdentity;
- (IDSURI)fromURI;
- (IMTimer)connectionTimer;
- (IMTimer)endSessionTimer;
- (IMTimer)inviteTimer;
- (IMTimer)packetLossTimer;
- (NSArray)requiredCapabilities;
- (NSArray)requiredLackOfCapabilities;
- (NSData)localBlob;
- (NSDate)startConnectingDate;
- (NSDictionary)destinationsLightweightStatus;
- (NSError)error;
- (NSNumber)remoteUseCloudPairedControlChannel;
- (NSNumber)remoteUsePhoneContinuityLocalMessage;
- (NSSet)destinations;
- (NSString)accountID;
- (NSString)groupID;
- (NSString)participantID;
- (NSString)pushTopic;
- (NSString)serviceName;
- (NSString)uniqueID;
- (NSUUID)clientUUID;
- (_IDSSessionConnection)connection;
- (double)connectionTimeout;
- (double)endSessionTimeout;
- (double)inviteSentTime;
- (double)inviteTimeout;
- (double)lastPacketTime;
- (id)getQuickRelayAllocateOptions:(id)a3;
- (id)publicIdentityFromData:(id)a3;
- (int64_t)clientType;
- (int64_t)transportType;
- (unint64_t)connectionCountHint;
- (unsigned)invitationRetryCount;
- (unsigned)peerProtocolVersion;
- (unsigned)seqSend;
- (unsigned)state;
- (void)_clearConnectionTimer;
- (void)_clearEndSessionTimeoutTimer;
- (void)_clearInvitationTimer;
- (void)_clearPacketLossTimer;
- (void)_connectionTimedOut;
- (void)_connectionTimerFiredOnMain;
- (void)_endSessionTimedOut;
- (void)_endSessionTimerFiredOnMain;
- (void)_inviteTimedOut;
- (void)_inviteTimerFiredOnMain;
- (void)clearAllTimers;
- (void)setAccountID:(id)a3;
- (void)setClientType:(int64_t)a3;
- (void)setClientUUID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionCountHint:(unint64_t)a3;
- (void)setConnectionTimeout:(double)a3;
- (void)setConnectionTimer;
- (void)setConnectionTimer:(id)a3;
- (void)setConnectionTimerCleared:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setDestinationsLightweightStatus:(id)a3;
- (void)setDisableEncryption:(BOOL)a3;
- (void)setDisableRemoteDeviceEncryption:(BOOL)a3;
- (void)setEnableQuickRelay:(BOOL)a3;
- (void)setEnableSKE:(BOOL)a3;
- (void)setEnableSingleChannelDirectMode:(BOOL)a3;
- (void)setEncryptionInitialized:(BOOL)a3;
- (void)setEncryptionStateStruct:(id *)a3;
- (void)setEndSessionTimeout:(double)a3;
- (void)setEndSessionTimeoutTimer;
- (void)setEndSessionTimer:(id)a3;
- (void)setEndSessionTimerCleared:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setForceInternetInvitation:(BOOL)a3;
- (void)setFromURI:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setInvitationRetryCount:(unsigned int)a3;
- (void)setInvitationTimer;
- (void)setInviteSentTime:(double)a3;
- (void)setInviteTimeout:(double)a3;
- (void)setInviteTimer:(id)a3;
- (void)setInviteTimerCleared:(BOOL)a3;
- (void)setIsInUPlusOneMode:(BOOL)a3;
- (void)setIsInitiator:(BOOL)a3;
- (void)setIsScreenSharingSession:(BOOL)a3;
- (void)setLastPacketTime:(double)a3;
- (void)setLocalBlob:(id)a3;
- (void)setLocalUnauthenticatedFullIdentity:(id)a3;
- (void)setPacketLossTimer:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setPeerProtocolVersion:(unsigned int)a3;
- (void)setRemoteUnauthenticatedPublicIdentity:(id)a3;
- (void)setRemoteUseCloudPairedControlChannel:(id)a3;
- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3;
- (void)setRequiredCapabilities:(id)a3;
- (void)setRequiredLackOfCapabilities:(id)a3;
- (void)setSeqSend:(unsigned int)a3;
- (void)setServiceName:(id)a3;
- (void)setSharedSession:(BOOL)a3;
- (void)setStartConnectingDate:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setUniqueID:(id)a3;
- (void)setUseBTDatagramPipe:(BOOL)a3;
- (void)setUseQRDirectly:(BOOL)a3;
- (void)setUseSecureQRControlMessage:(BOOL)a3;
@end

@implementation IDSDSessionSharedState

- (IDSDSessionSharedState)initWithDictionary:(id)a3 serviceName:(id)a4 isInitiator:(BOOL)a5 uniqueID:(id)a6 accountID:(id)a7 destinations:(id)a8
{
  id v14 = a3;
  id v135 = a4;
  id v141 = a6;
  id v140 = a7;
  id v139 = a8;
  v152.receiver = self;
  v152.super_class = (Class)&OBJC_CLASS___IDSDSessionSharedState;
  v15 = -[IDSDSessionSharedState init](&v152, "init");
  v16 = v15;
  if (!v15)
  {
LABEL_86:
    v119 = v16;
    goto LABEL_87;
  }

  objc_storeStrong((id *)&v15->_serviceName, a4);
  v16->_isInitiator = a5;
  if ([v141 length]) {
    v17 = (NSString *)v141;
  }
  else {
    v17 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  }
  uniqueID = v16->_uniqueID;
  v16->_uniqueID = v17;

  uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  participantID = v16->_participantID;
  v16->_participantID = (NSString *)v19;

  objc_storeStrong((id *)&v16->_accountID, a7);
  objc_storeStrong((id *)&v16->_destinations, a8);
  uint64_t v21 = IDSSessionPeerProtocolVersionKey;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionPeerProtocolVersionKey]);
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v21]);
  }

  else
  {
    uint64_t v24 = _IDSSessionProtocolVersionNumber();
    v23 = (void *)objc_claimAutoreleasedReturnValue(v24);
  }

  v25 = v23;
  v16->_peerProtocolVersion = [v23 unsignedIntValue];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionWaitForPreConnectionDataKey]);
  v16->_enableSKE = [v26 BOOLValue];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionDisableEncryptionKey]);
  v16->_disableEncryption = [v27 BOOLValue];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionForceInternetInvitationKey]);
  v16->_forceInternetInvitation = [v28 BOOLValue];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionSingleChannelDirectModeKey]);
  v16->_enableSingleChannelDirectMode = [v29 BOOLValue];

  v30 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionUseSecureQRControlMessageKey]);
  v16->_useSecureQRControlMessage = [v30 BOOLValue];

  uint64_t v132 = IDSSessionIsRealTimeKey;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:"));
  v16->_int useBTDatagramPipe = [v31 BOOLValue];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionInvitationIsRetryKey]);
  v16->_invitationRetryCount = [v32 BOOLValue];

  v16->_lastPacketTime = 0.0;
  uint64_t v33 = objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSGroupSessionMessagesGroupIDKey]);
  groupID = v16->_groupID;
  v16->_groupID = (NSString *)v33;

  v137 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionClientUUIDKey]);
  if (v137)
  {
    v35 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v137);
    clientUUID = v16->_clientUUID;
    v16->_clientUUID = v35;
  }

  v16->_useQRDirectly = IMGetDomainBoolForKey(@"com.apple.ids", @"SessionUseQRDirectly");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v142 = (void *)objc_claimAutoreleasedReturnValue([v37 accountWithUniqueID:v140]);

  v138 = (void *)objc_claimAutoreleasedReturnValue([v142 service]);
  __int128 v150 = 0u;
  __int128 v151 = 0u;
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  id v38 = v139;
  uint64_t v39 = (uint64_t)[v38 countByEnumeratingWithState:&v148 objects:v164 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v149;
    while (2)
    {
      for (uint64_t i = 0LL; i != v39; ++i)
      {
        if (*(void *)v149 != v40) {
          objc_enumerationMutation(v38);
        }
        v42 = *(void **)(*((void *)&v148 + 1) + 8 * i);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v42 prefixedURI]);
        unsigned int v44 = [v43 hasSuffix:@"inbox.appleid.apple.com"];

        if (v44)
        {
          uint64_t v45 = OSLogHandleForTransportCategory("IDSDSession");
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState uniqueID](v16, "uniqueID"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState destinations](v16, "destinations"));
            *(_DWORD *)buf = 138412802;
            uint64_t v155 = (uint64_t)v42;
            __int16 v156 = 2114;
            v157 = v47;
            __int16 v158 = 2112;
            uint64_t v159 = (uint64_t)v48;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "At least one destination is mako {destinationURI: %@, uniqueID: %{public}@, destinations: %@}",  buf,  0x20u);
          }

          uint64_t v50 = os_log_shim_legacy_logging_enabled(v49);
          if ((_DWORD)v50)
          {
            if (_IDSShouldLogTransport(v50))
            {
              v130 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState uniqueID](v16, "uniqueID"));
              v131 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState destinations](v16, "destinations"));
              v128 = v42;
              _IDSLogTransport( @"IDSDSession",  @"IDS",  @"At least one destination is mako {destinationURI: %@, uniqueID: %{public}@, destinations: %@}");

              if (_IDSShouldLog(0LL, @"IDSDSession"))
              {
                v130 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState uniqueID](v16, "uniqueID", v42, v130, v131));
                v131 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState destinations](v16, "destinations"));
                v128 = v42;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"At least one destination is mako {destinationURI: %@, uniqueID: %{public}@, destinations: %@}");
              }
            }
          }

          uint64_t v39 = 1LL;
          goto LABEL_26;
        }
      }

      uint64_t v39 = (uint64_t)[v38 countByEnumeratingWithState:&v148 objects:v164 count:16];
      if (v39) {
        continue;
      }
      break;
    }
  }

- ($F18A97B9DD67A12B1A73262525205838)encryptionState
{
  return ($F18A97B9DD67A12B1A73262525205838 *)&self->_encryptionStateStruct;
}

- (void)clearAllTimers
{
}

- (void)setInvitationTimer
{
  uint64_t v3 = im_primary_queue(self, a2);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030793C;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_inviteTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100307B08;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_inviteTimedOut
{
  if (!-[IDSDSessionSharedState inviteTimerCleared](self, "inviteTimerCleared"))
  {
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSDSessionSharedState inviteTimeout](self, "inviteTimeout");
      int v8 = 134217984;
      uint64_t v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Session invite timed out after %f seconds",  (uint8_t *)&v8,  0xCu);
    }

    if (-[IDSDSessionSharedState isInitiator](self, "isInitiator")) {
      uint64_t v5 = 4LL;
    }
    else {
      uint64_t v5 = 3LL;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState delegate](self, "delegate"));
    [v6 sendCancelInvitationMessage];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState delegate](self, "delegate"));
    [v7 endSessionWithReason:v5];
  }

- (void)_clearInvitationTimer
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100307C90;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_clearConnectionTimer
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100307DB4;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)setConnectionTimer
{
  id v3 = -[IDSDSessionSharedState _clearConnectionTimer](self, "_clearConnectionTimer");
  atomic_store(0, (unsigned __int8 *)&self->_connectionTimerCleared);
  uint64_t v5 = im_primary_queue(v3, v4);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100307ED8;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)_connectionTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100308168;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_connectionTimedOut
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_connectionTimerCleared);
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSDSessionSharedState connectionTimeout](self, "connectionTimeout");
      int v7 = 134217984;
      uint64_t v8 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Session connection timed out after %f seconds",  (uint8_t *)&v7,  0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState delegate](self, "delegate"));
    [v6 endSessionWithReason:6];
  }

- (void)_clearPacketLossTimer
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003082B4;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_clearEndSessionTimeoutTimer
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003083B0;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)setEndSessionTimeoutTimer
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003084D0;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_endSessionTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100308694;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_endSessionTimedOut
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_endSessionTimerCleared);
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSDSessionSharedState endSessionTimeout](self, "endSessionTimeout");
      int v8 = 134217984;
      uint64_t v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "End session timed out after %f seconds",  (uint8_t *)&v8,  0xCu);
    }

    if (self->_isInitiator) {
      uint64_t v6 = 11LL;
    }
    else {
      uint64_t v6 = 12LL;
    }
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState delegate](self, "delegate"));
    [v7 endSessionWithReason:v6];
  }

- (BOOL)supportsReinitiate
{
  if ((!-[IDSDSessionSharedState sharedSession](self, "sharedSession")
     || -[IDSDSessionSharedState isInUPlusOneMode](self, "isInUPlusOneMode"))
    && ((id)-[IDSDSessionSharedState clientType](self, "clientType") == (id)1
     || (id)-[IDSDSessionSharedState clientType](self, "clientType") == (id)5
     || (id)-[IDSDSessionSharedState clientType](self, "clientType") == (id)6)
    && -[IDSDSessionSharedState enableQuickRelay](self, "enableQuickRelay"))
  {
    return -[IDSDSessionSharedState useQRDirectly](self, "useQRDirectly");
  }

  else
  {
    return 0;
  }

- (id)getQuickRelayAllocateOptions:(id)a3
{
  id v4 = a3;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState accountID](self, "accountID"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 accountWithUniqueID:v7]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 service]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pushTopic]);

  if (v10)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AppID, v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A8060();
  }

  id v11 = v4;
  if (v11)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AllocateType, v11);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A7FE0();
  }

  if (([v11 intValue] & 0xFFFFFFFD) == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
    if (v12)
    {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_SelfAllocationCount, v12);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A7F60();
    }
  }

  if (-[IDSDSessionSharedState invitationRetryCount](self, "invitationRetryCount"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[IDSDSessionSharedState invitationRetryCount](self, "invitationRetryCount")));
    if (v13)
    {
      CFDictionarySetValue(Mutable, IDSSessionInvitationRetryCountKey, v13);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A7EE0();
    }
  }

  uint64_t v14 = IMGetDomainValueForKey(@"com.apple.ids", @"x-force-session-exp");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v15) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_QRForceExperiment, v15);
  }

  return Mutable;
}

- (BOOL)destinationIsGuestDevice:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 prefixedURI]);
  unsigned __int8 v4 = [v3 hasPrefix:@"guest-device:"];

  return v4;
}

- (BOOL)destinationIsDefaultPairedDevice:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a3 prefixedURI]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState accountID](self, "accountID"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState serviceName](self, "serviceName"));
  BOOL v7 = +[IDSDAccountController isDefaultPairedDeviceFromID:accountUniqueID:serviceName:]( &OBJC_CLASS___IDSDAccountController,  "isDefaultPairedDeviceFromID:accountUniqueID:serviceName:",  v4,  v5,  v6);

  return v7;
}

- (id)publicIdentityFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v14 = 0LL;
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMPPublicLegacyIdentity identityWithData:error:]( &OBJC_CLASS___IDSMPPublicLegacyIdentity,  "identityWithData:error:",  v3,  &v14));
    id v5 = v14;
    if (v4)
    {
      id v6 = v4;
    }

    else
    {
      uint64_t v10 = OSLogHandleForIDSCategory("Warning");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        id v16 = v5;
        __int16 v17 = 2113;
        id v18 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to create unauthenticated public identity from data {error: %{public}@, data: %{private}@}",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v12))
      {
        _IDSWarnV( @"IDSFoundation",  @"Failed to create unauthenticated public identity from data {error: %{public}@, data: %{private}@}");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed to create unauthenticated public identity from data {error: %{public}@, data: %{private}@}");
        _IDSLogTransport( @"Warning",  @"IDS",  @"Failed to create unauthenticated public identity from data {error: %{public}@, data: %{private}@}");
      }
    }
  }

  else
  {
    uint64_t v7 = OSLogHandleForIDSCategory("Warning");
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to create unauthenticated public identity from data becuase data is nil",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v9))
    {
      _IDSWarnV( @"IDSFoundation",  @"Failed to create unauthenticated public identity from data becuase data is nil");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed to create unauthenticated public identity from data becuase data is nil");
      _IDSLogTransport( @"Warning",  @"IDS",  @"Failed to create unauthenticated public identity from data becuase data is nil");
    }

    unsigned __int8 v4 = 0LL;
  }

  return v4;
}

- (NSString)pushTopic
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionSharedState accountID](self, "accountID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountWithUniqueID:v4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pushTopic]);

  return (NSString *)v7;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(int64_t)a3
{
  self->_clientType = a3;
}

- (NSUUID)clientUUID
{
  return self->_clientUUID;
}

- (void)setClientUUID:(id)a3
{
}

- (_IDSSessionConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (unint64_t)connectionCountHint
{
  return self->_connectionCountHint;
}

- (void)setConnectionCountHint:(unint64_t)a3
{
  self->_connectionCountHint = a3;
}

- (double)connectionTimeout
{
  return self->_connectionTimeout;
}

- (void)setConnectionTimeout:(double)a3
{
  self->_connectionTimeout = a3;
}

- (IMTimer)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setConnectionTimer:(id)a3
{
}

- (BOOL)connectionTimerCleared
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_connectionTimerCleared);
  return v2 & 1;
}

- (void)setConnectionTimerCleared:(BOOL)a3
{
}

- (NSSet)destinations
{
  return (NSSet *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setDestinations:(id)a3
{
}

- (NSDictionary)destinationsLightweightStatus
{
  return self->_destinationsLightweightStatus;
}

- (void)setDestinationsLightweightStatus:(id)a3
{
}

- (BOOL)disableEncryption
{
  return self->_disableEncryption;
}

- (void)setDisableEncryption:(BOOL)a3
{
  self->_disableEncryption = a3;
}

- (BOOL)disableRemoteDeviceEncryption
{
  return self->_disableRemoteDeviceEncryption;
}

- (void)setDisableRemoteDeviceEncryption:(BOOL)a3
{
  self->_disableRemoteDeviceEncryption = a3;
}

- (BOOL)enableQuickRelay
{
  return self->_enableQuickRelay;
}

- (void)setEnableQuickRelay:(BOOL)a3
{
  self->_enableQuickRelay = a3;
}

- (BOOL)enableSingleChannelDirectMode
{
  return self->_enableSingleChannelDirectMode;
}

- (void)setEnableSingleChannelDirectMode:(BOOL)a3
{
  self->_enableSingleChannelDirectMode = a3;
}

- (BOOL)enableSKE
{
  return self->_enableSKE;
}

- (void)setEnableSKE:(BOOL)a3
{
  self->_enableSKE = a3;
}

- (BOOL)encryptionInitialized
{
  return self->_encryptionInitialized;
}

- (void)setEncryptionInitialized:(BOOL)a3
{
  self->_encryptionInitialized = a3;
}

- (double)endSessionTimeout
{
  return self->_endSessionTimeout;
}

- (void)setEndSessionTimeout:(double)a3
{
  self->_endSessionTimeout = a3;
}

- (IMTimer)endSessionTimer
{
  return self->_endSessionTimer;
}

- (void)setEndSessionTimer:(id)a3
{
}

- (BOOL)endSessionTimerCleared
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_endSessionTimerCleared);
  return v2 & 1;
}

- (void)setEndSessionTimerCleared:(BOOL)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)forceInternetInvitation
{
  return self->_forceInternetInvitation;
}

- (void)setForceInternetInvitation:(BOOL)a3
{
  self->_forceInternetInvitation = a3;
}

- (IDSURI)fromURI
{
  return self->_fromURI;
}

- (void)setFromURI:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (double)inviteSentTime
{
  return self->_inviteSentTime;
}

- (void)setInviteSentTime:(double)a3
{
  self->_inviteSentTime = a3;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (void)setIsInitiator:(BOOL)a3
{
  self->_isInitiator = a3;
}

- (BOOL)isInUPlusOneMode
{
  return self->_isInUPlusOneMode;
}

- (void)setIsInUPlusOneMode:(BOOL)a3
{
  self->_isInUPlusOneMode = a3;
}

- (BOOL)isScreenSharingSession
{
  return self->_isScreenSharingSession;
}

- (void)setIsScreenSharingSession:(BOOL)a3
{
  self->_isScreenSharingSession = a3;
}

- (unsigned)invitationRetryCount
{
  return self->_invitationRetryCount;
}

- (void)setInvitationRetryCount:(unsigned int)a3
{
  self->_invitationRetryCount = a3;
}

- (double)inviteTimeout
{
  return self->_inviteTimeout;
}

- (void)setInviteTimeout:(double)a3
{
  self->_inviteTimeout = a3;
}

- (IMTimer)inviteTimer
{
  return self->_inviteTimer;
}

- (void)setInviteTimer:(id)a3
{
}

- (BOOL)inviteTimerCleared
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_inviteTimerCleared);
  return v2 & 1;
}

- (void)setInviteTimerCleared:(BOOL)a3
{
}

- (double)lastPacketTime
{
  return self->_lastPacketTime;
}

- (void)setLastPacketTime:(double)a3
{
  self->_lastPacketTime = a3;
}

- (NSData)localBlob
{
  return self->_localBlob;
}

- (void)setLocalBlob:(id)a3
{
}

- (IMTimer)packetLossTimer
{
  return self->_packetLossTimer;
}

- (void)setPacketLossTimer:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (unsigned)peerProtocolVersion
{
  return self->_peerProtocolVersion;
}

- (void)setPeerProtocolVersion:(unsigned int)a3
{
  self->_peerProtocolVersion = a3;
}

- (NSNumber)remoteUseCloudPairedControlChannel
{
  return self->_remoteUseCloudPairedControlChannel;
}

- (void)setRemoteUseCloudPairedControlChannel:(id)a3
{
}

- (NSNumber)remoteUsePhoneContinuityLocalMessage
{
  return self->_remoteUsePhoneContinuityLocalMessage;
}

- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (unsigned)seqSend
{
  return self->_seqSend;
}

- (void)setSeqSend:(unsigned int)a3
{
  self->_seqSend = a3;
}

- (BOOL)sharedSession
{
  return self->_sharedSession;
}

- (void)setSharedSession:(BOOL)a3
{
  self->_sharedSession = a3;
}

- (NSDate)startConnectingDate
{
  return self->_startConnectingDate;
}

- (void)setStartConnectingDate:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (BOOL)useBTDatagramPipe
{
  return self->_useBTDatagramPipe;
}

- (void)setUseBTDatagramPipe:(BOOL)a3
{
  self->_int useBTDatagramPipe = a3;
}

- (BOOL)useSecureQRControlMessage
{
  return self->_useSecureQRControlMessage;
}

- (void)setUseSecureQRControlMessage:(BOOL)a3
{
  self->_useSecureQRControlMessage = a3;
}

- (BOOL)useQRDirectly
{
  return self->_useQRDirectly;
}

- (void)setUseQRDirectly:(BOOL)a3
{
  self->_useQRDirectly = a3;
}

- (NSArray)requiredLackOfCapabilities
{
  return self->_requiredLackOfCapabilities;
}

- (void)setRequiredLackOfCapabilities:(id)a3
{
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (IDSMPFullLegacyIdentity)localUnauthenticatedFullIdentity
{
  return self->_localUnauthenticatedFullIdentity;
}

- (void)setLocalUnauthenticatedFullIdentity:(id)a3
{
}

- (IDSMPPublicLegacyIdentity)remoteUnauthenticatedPublicIdentity
{
  return self->_remoteUnauthenticatedPublicIdentity;
}

- (void)setRemoteUnauthenticatedPublicIdentity:(id)a3
{
}

- (IDSDSession)delegate
{
  return (IDSDSession *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- ($F18A97B9DD67A12B1A73262525205838)encryptionStateStruct
{
  return ($F18A97B9DD67A12B1A73262525205838 *)memcpy( retstr,  &self->_encryptionStateStruct,  sizeof($F18A97B9DD67A12B1A73262525205838));
}

- (void)setEncryptionStateStruct:(id *)a3
{
}

- (void).cxx_destruct
{
}

@end