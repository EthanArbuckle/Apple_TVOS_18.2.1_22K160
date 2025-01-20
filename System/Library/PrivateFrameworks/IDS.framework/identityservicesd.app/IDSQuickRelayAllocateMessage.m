@interface IDSQuickRelayAllocateMessage
- (BOOL)wantsAPSRetries;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (BOOL)wantsIntegerUniqueIDs;
- (IDSQuickRelayAllocateMessage)initWithDictionary:(id)a3;
- (NSArray)recipients;
- (NSData)IDSSessionID;
- (NSData)activeRelayIP;
- (NSData)activeRelaySessionToken;
- (NSData)existingRelayIP;
- (NSData)existingRelaySessionToken;
- (NSData)existingRelaySignature;
- (NSData)inferredExternalIP;
- (NSData)previousAccessToken;
- (NSData)previousRelayIP;
- (NSData)relayIP;
- (NSData)relayIPv6;
- (NSData)relaySessionID;
- (NSData)relaySessionKey;
- (NSData)relaySessionToken;
- (NSData)relaySoftwareVersion;
- (NSData)requestID;
- (NSData)senderExternalIP;
- (NSDictionary)qrExperiments;
- (NSDictionary)qrForceExperiment;
- (NSNumber)allocateProtocolVersion;
- (NSNumber)allocateType;
- (NSNumber)errorCode;
- (NSNumber)groupMemberCount;
- (NSNumber)infoAttribute;
- (NSNumber)invitationRetryCount;
- (NSNumber)ipPreference;
- (NSNumber)isInternal;
- (NSNumber)isLightweightParticipant;
- (NSNumber)isNewUPlusOneSession;
- (NSNumber)isSharedSession;
- (NSNumber)linkScore;
- (NSNumber)linkSuggestion;
- (NSNumber)provider;
- (NSNumber)qrError;
- (NSNumber)qrReason;
- (NSNumber)relayExpiryTimeStamp;
- (NSNumber)relayHighPriorityPort;
- (NSNumber)relayPort;
- (NSNumber)selfAllocationCount;
- (NSString)appID;
- (NSString)conversationID;
- (NSString)errorMessage;
- (NSString)groupID;
- (NSString)protocol;
- (NSString)pskH3Settings;
- (NSString)pskTransportParameters;
- (NSString)relayBuildVersion;
- (NSString)reportingDataBlob;
- (NSString)requestIDStr;
- (NSString)senderURI;
- (NSString)testOptions;
- (NSString)userAgent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)init:(id)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (unint64_t)_recipientDataSize;
- (unint64_t)requestLength;
- (void)setActiveRelayIP:(id)a3;
- (void)setActiveRelaySessionToken:(id)a3;
- (void)setAllocateProtocolVersion:(id)a3;
- (void)setAllocateType:(id)a3;
- (void)setAppID:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setExistingRelayIP:(id)a3;
- (void)setExistingRelaySessionToken:(id)a3;
- (void)setExistingRelaySignature:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setGroupMemberCount:(id)a3;
- (void)setIDSSessionID:(id)a3;
- (void)setInferredExternalIP:(id)a3;
- (void)setInfoAttribute:(id)a3;
- (void)setInvitationRetryCount:(id)a3;
- (void)setIpPreference:(id)a3;
- (void)setIsInternal:(id)a3;
- (void)setIsLightweightParticipant:(id)a3;
- (void)setIsNewUPlusOneSession:(id)a3;
- (void)setIsSharedSession:(id)a3;
- (void)setLinkScore:(id)a3;
- (void)setLinkSuggestion:(id)a3;
- (void)setPreviousAccessToken:(id)a3;
- (void)setPreviousRelayIP:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setProvider:(id)a3;
- (void)setPskH3Settings:(id)a3;
- (void)setPskTransportParameters:(id)a3;
- (void)setQrError:(id)a3;
- (void)setQrExperiments:(id)a3;
- (void)setQrForceExperiment:(id)a3;
- (void)setQrReason:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setRelayBuildVersion:(id)a3;
- (void)setRelayExpiryTimeStamp:(id)a3;
- (void)setRelayHighPriorityPort:(id)a3;
- (void)setRelayIP:(id)a3;
- (void)setRelayIPv6:(id)a3;
- (void)setRelayPort:(id)a3;
- (void)setRelaySessionID:(id)a3;
- (void)setRelaySessionKey:(id)a3;
- (void)setRelaySessionToken:(id)a3;
- (void)setRelaySoftwareVersion:(id)a3;
- (void)setReportingDataBlob:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setRequestIDStr:(id)a3;
- (void)setSelfAllocationCount:(id)a3;
- (void)setSenderExternalIP:(id)a3;
- (void)setSenderURI:(id)a3;
- (void)setTestOptions:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation IDSQuickRelayAllocateMessage

- (id)init:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSQuickRelayAllocateMessage;
  v5 = -[IDSQuickRelayAllocateMessage init](&v9, "init");
  if (v5)
  {
    if (!v4) {
      id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    -[IDSQuickRelayAllocateMessage setRequestIDStr:](v5, "setRequestIDStr:", v6);

    v10[0] = 0xAAAAAAAAAAAAAAAALL;
    v10[1] = 0xAAAAAAAAAAAAAAAALL;
    [v4 getUUIDBytes:v10];
    v7 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v10, 16LL);
    -[IDSQuickRelayAllocateMessage setRequestID:](v5, "setRequestID:", v7);

    -[IDSQuickRelayAllocateMessage setTopic:](v5, "setTopic:", kIDSQuickRelayPushTopic);
    -[IDSQuickRelayAllocateMessage setWantsDeliveryStatus:](v5, "setWantsDeliveryStatus:", &__kCFBooleanFalse);
    -[IDSQuickRelayAllocateMessage setHighPriority:](v5, "setHighPriority:", 1LL);
  }

  return v5;
}

- (IDSQuickRelayAllocateMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_404;
  }
  v1068.receiver = self;
  v1068.super_class = (Class)&OBJC_CLASS___IDSQuickRelayAllocateMessage;
  self = -[IDSQuickRelayAllocateMessage init](&v1068, "init");

  if (!self) {
    goto LABEL_404;
  }
  uint64_t v5 = kIDSQRAllocateKey_RequestID;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_RequestID]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData, v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  v10 = (NSData *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);
  v11 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    requestID = self->_requestID;
    self->_requestID = v10;
LABEL_5:

    goto LABEL_12;
  }

  if (v11)
  {
    uint64_t v13 = OSLogHandleForIDSCategory("QRAllocator");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);
      id v17 = (id)objc_opt_class(&OBJC_CLASS___NSData, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);
      id v20 = (id)objc_opt_class(v18, v19);
      *(_DWORD *)buf = 138412802;
      id v1070 = v15;
      __int16 v1071 = 2112;
      id v1072 = v17;
      __int16 v1073 = 2112;
      id v1074 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Unexpected datatype. %@ should be of type %@, not %@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v21))
    {
      if (_IDSShouldLog(1LL, @"QRAllocator"))
      {
        requestID = (NSData *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSData, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);
        uint64_t v982 = v23;
        uint64_t v1025 = objc_opt_class(v24, v25);
        v939 = requestID;
        _IDSLogV( 1LL,  @"IDSFoundation",  @"QRAllocator",  @"Unexpected datatype. %@ should be of type %@, not %@");

        goto LABEL_5;
      }
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___IDSQuickRelayAllocateMessage;
  id v4 = -[IDSQuickRelayAllocateMessage copyWithZone:](&v52, "copyWithZone:", a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage requestID](self, "requestID"));
  [v4 setRequestID:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage requestIDStr](self, "requestIDStr"));
  [v4 setRequestIDStr:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage IDSSessionID](self, "IDSSessionID"));
  [v4 setIDSSessionID:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage senderURI](self, "senderURI"));
  [v4 setSenderURI:v8];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage recipients](self, "recipients"));
  [v4 setRecipients:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage activeRelayIP](self, "activeRelayIP"));
  [v4 setActiveRelayIP:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage activeRelaySessionToken](self, "activeRelaySessionToken"));
  [v4 setActiveRelaySessionToken:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage conversationID](self, "conversationID"));
  [v4 setConversationID:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage existingRelayIP](self, "existingRelayIP"));
  [v4 setExistingRelayIP:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage existingRelaySessionToken](self, "existingRelaySessionToken"));
  [v4 setExistingRelaySessionToken:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage existingRelaySignature](self, "existingRelaySignature"));
  [v4 setExistingRelaySignature:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage senderExternalIP](self, "senderExternalIP"));
  [v4 setSenderExternalIP:v16];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage appID](self, "appID"));
  [v4 setAppID:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage allocateProtocolVersion](self, "allocateProtocolVersion"));
  [v4 setAllocateProtocolVersion:v18];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayIP](self, "relayIP"));
  [v4 setRelayIP:v19];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayPort](self, "relayPort"));
  [v4 setRelayPort:v20];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayIPv6](self, "relayIPv6"));
  [v4 setRelayIPv6:v21];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySessionToken](self, "relaySessionToken"));
  [v4 setRelaySessionToken:v22];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySessionKey](self, "relaySessionKey"));
  [v4 setRelaySessionKey:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySessionID](self, "relaySessionID"));
  [v4 setRelaySessionID:v24];

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayExpiryTimeStamp](self, "relayExpiryTimeStamp"));
  [v4 setRelayExpiryTimeStamp:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySoftwareVersion](self, "relaySoftwareVersion"));
  [v4 setRelaySoftwareVersion:v26];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayBuildVersion](self, "relayBuildVersion"));
  [v4 setRelayBuildVersion:v27];

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayHighPriorityPort](self, "relayHighPriorityPort"));
  [v4 setRelayHighPriorityPort:v28];

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage ipPreference](self, "ipPreference"));
  [v4 setIpPreference:v29];

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage inferredExternalIP](self, "inferredExternalIP"));
  [v4 setInferredExternalIP:v30];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage provider](self, "provider"));
  [v4 setProvider:v31];

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage isSharedSession](self, "isSharedSession"));
  [v4 setIsSharedSession:v32];

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage groupID](self, "groupID"));
  [v4 setGroupID:v33];

  char v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage qrReason](self, "qrReason"));
  [v4 setQrReason:v34];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage qrError](self, "qrError"));
  [v4 setQrError:v35];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage previousAccessToken](self, "previousAccessToken"));
  [v4 setPreviousAccessToken:v36];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage previousRelayIP](self, "previousRelayIP"));
  [v4 setPreviousRelayIP:v37];

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage testOptions](self, "testOptions"));
  [v4 setTestOptions:v38];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage invitationRetryCount](self, "invitationRetryCount"));
  [v4 setInvitationRetryCount:v39];

  id v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage groupMemberCount](self, "groupMemberCount"));
  [v4 setGroupMemberCount:v40];

  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage selfAllocationCount](self, "selfAllocationCount"));
  [v4 setSelfAllocationCount:v41];

  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage errorCode](self, "errorCode"));
  [v4 setErrorCode:v42];

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage errorMessage](self, "errorMessage"));
  [v4 setErrorMessage:v43];

  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage isNewUPlusOneSession](self, "isNewUPlusOneSession"));
  [v4 setIsNewUPlusOneSession:v44];

  id v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage isLightweightParticipant](self, "isLightweightParticipant"));
  [v4 setIsLightweightParticipant:v45];

  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage isInternal](self, "isInternal"));
  [v4 setIsInternal:v46];

  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage userAgent](self, "userAgent"));
  [v4 setUserAgent:v47];

  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage pskTransportParameters](self, "pskTransportParameters"));
  [v4 setPskTransportParameters:v48];

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage pskH3Settings](self, "pskH3Settings"));
  [v4 setPskH3Settings:v49];

  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage qrForceExperiment](self, "qrForceExperiment"));
  [v4 setQrForceExperiment:v50];

  return v4;
}

- (BOOL)wantsBagKey
{
  return 0;
}

- (BOOL)wantsHTTPHeaders
{
  return 0;
}

- (BOOL)wantsCompressedBody
{
  return 0;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (BOOL)wantsIntegerUniqueIDs
{
  return 1;
}

- (int64_t)command
{
  return 200LL;
}

- (int64_t)responseCommand
{
  return 200LL;
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", kIDSQRAllocateKey_RequestID);
  -[NSMutableArray addObject:](v2, "addObject:", kIDSQRAllocateKey_IDSSessionID);
  -[NSMutableArray addObject:](v2, "addObject:", kIDSQRAllocateKey_Recipients);
  -[NSMutableArray addObject:](v2, "addObject:", kIDSQRAllocateKey_AllocateProtocolVersion);
  -[NSMutableArray addObject:](v2, "addObject:", kIDSQRAllocateKey_SenderURI);
  -[NSMutableArray addObject:](v2, "addObject:", kIDSQRAllocateKey_AppID);
  return v2;
}

- (id)messageBody
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v5 = [v4 isInternalInstall];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage additionalInternalHeaders](self, "additionalInternalHeaders"));
    -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage requestID](self, "requestID"));
  if (v7)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_RequestID, v7);
  }

  else
  {
    id v8 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1006A7E60();
    }
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage allocateType](self, "allocateType"));
  if (v9)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_AllocateType, v9);
  }

  else
  {
    id v10 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1006A7DE0();
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage IDSSessionID](self, "IDSSessionID"));
  if (v11)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_IDSSessionID, v11);
  }

  else
  {
    id v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1006A7D60();
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage recipients](self, "recipients"));
  if (v13)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_Recipients, v13);
  }

  else
  {
    id v14 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1006A7CE0();
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage senderURI](self, "senderURI"));
  if (v15)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_SenderURI, v15);
  }

  else
  {
    id v16 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1006A7C60();
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage allocateProtocolVersion](self, "allocateProtocolVersion"));
  if (v17)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_AllocateProtocolVersion, v17);
  }

  else
  {
    id v18 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1006A7BE0();
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage appID](self, "appID"));
  if (v19)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_AppID, v19);
  }

  else
  {
    id v20 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1006A7B60();
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage provider](self, "provider"));
  if (v21) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_Provider, v21);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage infoAttribute](self, "infoAttribute"));
  if (v22) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_PreferredRemoteInterface, v22);
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage groupID](self, "groupID"));
  if (v23) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_GroupID, v23);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage qrReason](self, "qrReason"));
  if (v24) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_Reason, v24);
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage qrError](self, "qrError"));
  if (v25) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_QRError, v25);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage previousAccessToken](self, "previousAccessToken"));
  if (v26) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_PreviousAccessToken, v26);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage previousRelayIP](self, "previousRelayIP"));
  if (v27) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_PreviousRelayIP, v27);
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage activeRelayIP](self, "activeRelayIP"));
  if (v28) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_ActiveRelayIP, v28);
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage activeRelaySessionToken](self, "activeRelaySessionToken"));
  if (v29) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_ActiveRelaySessionToken, v29);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage conversationID](self, "conversationID"));
  if (v30) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_ConversationID, v30);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage existingRelayIP](self, "existingRelayIP"));
  if (v31) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_ExistingRelayIP, v31);
  }

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage existingRelaySessionToken](self, "existingRelaySessionToken"));
  if (v32) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_ExistingRelaySessionToken, v32);
  }

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage existingRelaySignature](self, "existingRelaySignature"));
  if (v33) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_ExistingRelaySignature, v33);
  }

  char v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage senderExternalIP](self, "senderExternalIP"));
  if (v34) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_SenderExternalAddress, v34);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage testOptions](self, "testOptions"));
  if (v35) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_TestOptions, v35);
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage invitationRetryCount](self, "invitationRetryCount"));
  if (v36) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, IDSSessionInvitationRetryCountKey, v36);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage groupMemberCount](self, "groupMemberCount"));
  if (v37) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_GroupMemberCount, v37);
  }

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage selfAllocationCount](self, "selfAllocationCount"));
  if (v38) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_SelfAllocationCount, v38);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage isNewUPlusOneSession](self, "isNewUPlusOneSession"));
  if (v39) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_IsNewUPlusOneSession, v39);
  }

  id v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage isLightweightParticipant](self, "isLightweightParticipant"));
  if (v40) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_IsLightweightParticipant, v40);
  }

  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage userAgent](self, "userAgent"));
  if (v41) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_UserAgent, v41);
  }

  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage qrForceExperiment](self, "qrForceExperiment"));
  if (v42) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, kIDSQRAllocateKey_QRForceExperiment, v42);
  }

  v43 = v3;
  return v43;
}

- (BOOL)wantsAPSRetries
{
  return 1;
}

- (unint64_t)_recipientDataSize
{
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  v2 = self->_recipients;
  unint64_t v3 = 0LL;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v63,  v71,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v64;
    v6 = (void *)kIDSQRAllocateKey_RecipientPushToken;
    uint64_t v7 = (void *)kIDSQRAllocateKey_RecipientSessionToken;
    id v8 = (void *)kIDSQRAllocateKey_RecipientURI;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v64 != v5) {
          objc_enumerationMutation(v2);
        }
        id v10 = *(const __CFDictionary **)(*((void *)&v63 + 1) + 8LL * (void)i);
        v11 = (char *)[v6 length];
        BOOL v12 = __CFADD__(v3, v11);
        unint64_t v13 = (unint64_t)&v11[v3];
        if (v12)
        {
          uint64_t v32 = OSLogHandleForIDSCategory("QRAllocator");
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = [v6 length];
            *(_DWORD *)buf = 134218240;
            unint64_t v68 = v13;
            __int16 v69 = 2048;
            id v70 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Add overflow, dataSize: %lu, kIDSQRAllocateKey_RecipientPushToken length: %lu",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v35)
            && _IDSShouldLog(0LL, @"QRAllocator"))
          {
            [v6 length];
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Add overflow, dataSize: %lu, kIDSQRAllocateKey_RecipientPushToken length: %lu");
          }

          goto LABEL_90;
        }

        id v14 = (char *)[v7 length];
        BOOL v12 = __CFADD__(v13, v14);
        unint64_t v15 = (unint64_t)&v14[v13];
        if (v12)
        {
          uint64_t v36 = OSLogHandleForIDSCategory("QRAllocator");
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            id v38 = [v7 length];
            *(_DWORD *)buf = 134218240;
            unint64_t v68 = v15;
            __int16 v69 = 2048;
            id v70 = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Add overflow, dataSize: %lu, kIDSQRAllocateKey_RecipientSessionToken length: %lu",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v39)
            && _IDSShouldLog(0LL, @"QRAllocator"))
          {
            [v7 length];
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Add overflow, dataSize: %lu, kIDSQRAllocateKey_RecipientSessionToken length: %lu");
          }

          goto LABEL_90;
        }

        id v16 = (char *)[v8 length];
        BOOL v12 = __CFADD__(v15, v16);
        unint64_t v17 = (unint64_t)&v16[v15];
        if (v12)
        {
          uint64_t v40 = OSLogHandleForIDSCategory("QRAllocator");
          uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            id v42 = [v8 length];
            *(_DWORD *)buf = 134218240;
            unint64_t v68 = v17;
            __int16 v69 = 2048;
            id v70 = v42;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Add overflow, dataSize: %lu, kIDSQRAllocateKey_RecipientURI length: %lu",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v43)
            && _IDSShouldLog(0LL, @"QRAllocator"))
          {
            [v8 length];
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Add overflow, dataSize: %lu, kIDSQRAllocateKey_RecipientURI length: %lu");
          }

          goto LABEL_90;
        }

        if (v10) {
          BOOL v18 = v6 == 0LL;
        }
        else {
          BOOL v18 = 1;
        }
        int v19 = !v18;
        if (v18) {
          Value = 0LL;
        }
        else {
          Value = (void *)CFDictionaryGetValue(v10, v6);
        }
        uint64_t v21 = (char *)[Value length];
        BOOL v12 = __CFADD__(v17, v21);
        unint64_t v22 = (unint64_t)&v21[v17];
        if (v12)
        {
          uint64_t v44 = OSLogHandleForIDSCategory("QRAllocator");
          id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            if (v19) {
              uint64_t v46 = (void *)CFDictionaryGetValue(v10, v6);
            }
            else {
              uint64_t v46 = 0LL;
            }
            id v53 = [v46 length];
            *(_DWORD *)buf = 134218240;
            unint64_t v68 = v22;
            __int16 v69 = 2048;
            id v70 = v53;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Add overflow, dataSize: %lu, recipient's kIDSQRAllocateKey_RecipientPushToken length: %lu",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v54)
            && _IDSShouldLog(0LL, @"QRAllocator"))
          {
            if (v19) {
              char v55 = (void *)CFDictionaryGetValue(v10, v6);
            }
            else {
              char v55 = 0LL;
            }
            [v55 length];
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Add overflow, dataSize: %lu, recipient's kIDSQRAllocateKey_RecipientPushToken length: %lu");
          }

          goto LABEL_90;
        }

        if (v10) {
          BOOL v23 = v7 == 0LL;
        }
        else {
          BOOL v23 = 1;
        }
        int v24 = !v23;
        if (v23) {
          uint64_t v25 = 0LL;
        }
        else {
          uint64_t v25 = (void *)CFDictionaryGetValue(v10, v7);
        }
        v26 = (char *)[v25 length];
        BOOL v12 = __CFADD__(v22, v26);
        v27 = &v26[v22];
        if (v12)
        {
          uint64_t v47 = OSLogHandleForIDSCategory("QRAllocator");
          uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            if (v24) {
              v49 = (void *)CFDictionaryGetValue(v10, v7);
            }
            else {
              v49 = 0LL;
            }
            id v56 = [v49 length];
            *(_DWORD *)buf = 134218240;
            unint64_t v68 = (unint64_t)v27;
            __int16 v69 = 2048;
            id v70 = v56;
            _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Add overflow, dataSize: %lu, recipient's kIDSQRAllocateKey_RecipientSessionToken length: %lu",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v57)
            && _IDSShouldLog(0LL, @"QRAllocator"))
          {
            if (v24) {
              v58 = (void *)CFDictionaryGetValue(v10, v7);
            }
            else {
              v58 = 0LL;
            }
            [v58 length];
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Add overflow, dataSize: %lu, recipient's kIDSQRAllocateKey_RecipientSessionToken length: %lu");
          }

          goto LABEL_90;
        }

        if (v10) {
          BOOL v28 = v8 == 0LL;
        }
        else {
          BOOL v28 = 1;
        }
        int v29 = !v28;
        if (v28) {
          v30 = 0LL;
        }
        else {
          v30 = (void *)CFDictionaryGetValue(v10, v8);
        }
        id v31 = [v30 length];
        BOOL v12 = __CFADD__(v27, v31);
        unint64_t v3 = (unint64_t)v31 + (void)v27;
        if (v12)
        {
          uint64_t v50 = OSLogHandleForIDSCategory("QRAllocator");
          uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            if (v29) {
              objc_super v52 = (void *)CFDictionaryGetValue(v10, v8);
            }
            else {
              objc_super v52 = 0LL;
            }
            id v59 = [v52 length];
            *(_DWORD *)buf = 134218240;
            unint64_t v68 = v3;
            __int16 v69 = 2048;
            id v70 = v59;
            _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Add overflow, dataSize: %lu, recipient's kIDSQRAllocateKey_RecipientURI length: %lu",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v60)
            && _IDSShouldLog(0LL, @"QRAllocator"))
          {
            if (v29) {
              id v61 = (void *)CFDictionaryGetValue(v10, v8);
            }
            else {
              id v61 = 0LL;
            }
            [v61 length];
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Add overflow, dataSize: %lu, recipient's kIDSQRAllocateKey_RecipientURI length: %lu");
          }

- (unint64_t)requestLength
{
  unint64_t v3 = -[IDSQuickRelayAllocateMessage _recipientDataSize](self, "_recipientDataSize");
  if (v3 == -1LL) {
    return 0LL;
  }
  unint64_t v4 = v3;
  NSUInteger v5 = -[NSData length](self->_IDSSessionID, "length");
  NSUInteger v6 = v5 + v4;
  if (__CFADD__(v5, v4)) {
    return 0LL;
  }
  NSUInteger v7 = -[NSData length](self->_requestID, "length");
  uint64_t v8 = -[NSNumber integerValue](self->_allocateType, "integerValue");
  unint64_t result = 0LL;
  uint64_t v10 = v8 >> 63;
  BOOL v11 = __CFADD__(v7, v8);
  NSUInteger v12 = v7 + v8;
  if (v11) {
    uint64_t v13 = v10 + 1;
  }
  else {
    uint64_t v13 = v10;
  }
  uint64_t v14 = v13 << 63 >> 63;
  if (v14 == v13 && (v14 & 0x8000000000000000LL) == 0)
  {
    NSUInteger v15 = v6 + v12;
    if (__CFADD__(v6, v12)) {
      return 0LL;
    }
    NSUInteger v16 = -[NSString length](self->_appID, "length");
    NSUInteger v17 = v16 + 8;
    if (v16 >= 0xFFFFFFFFFFFFFFF8LL) {
      return 0LL;
    }
    NSUInteger v18 = v17 + v15;
    if (__CFADD__(v17, v15)) {
      return 0LL;
    }
    NSUInteger v19 = -[NSData length](self->_activeRelayIP, "length");
    NSUInteger v20 = -[NSData length](self->_activeRelaySessionToken, "length");
    NSUInteger v21 = v19 + v20;
    if (__CFADD__(v19, v20)) {
      return 0LL;
    }
    NSUInteger v22 = v21 + v18;
    if (__CFADD__(v21, v18)) {
      return 0LL;
    }
    NSUInteger v23 = -[NSString length](self->_conversationID, "length");
    NSUInteger v24 = v23 + v22;
    if (__CFADD__(v23, v22)) {
      return 0LL;
    }
    NSUInteger v25 = -[NSData length](self->_existingRelayIP, "length");
    NSUInteger v26 = -[NSData length](self->_existingRelaySessionToken, "length");
    NSUInteger v27 = v25 + v26;
    if (__CFADD__(v25, v26)) {
      return 0LL;
    }
    BOOL v11 = __CFADD__(v27, v24);
    NSUInteger v28 = v27 + v24;
    if (v11) {
      return 0LL;
    }
    NSUInteger v29 = -[NSData length](self->_existingRelaySignature, "length");
    NSUInteger v30 = -[NSData length](self->_senderExternalIP, "length");
    NSUInteger v31 = v29 + v30;
    if (__CFADD__(v29, v30)) {
      return 0LL;
    }
    NSUInteger v32 = v31 + v28;
    if (__CFADD__(v31, v28)) {
      return 0LL;
    }
    NSUInteger v33 = -[NSString length](self->_senderURI, "length");
    NSUInteger v34 = v33 + 8;
    if (v33 >= 0xFFFFFFFFFFFFFFF8LL) {
      return 0LL;
    }
    BOOL v11 = __CFADD__(v34, v32);
    NSUInteger v35 = v34 + v32;
    if (v11) {
      return 0LL;
    }
    NSUInteger v36 = -[NSString length](self->_groupID, "length");
    NSUInteger v37 = v36 + 8;
    if (v36 >= 0xFFFFFFFFFFFFFFF8LL) {
      return 0LL;
    }
    BOOL v11 = __CFADD__(v37, v35);
    unint64_t v38 = v37 + v35;
    if (v11) {
      return 0LL;
    }
    unint64_t v39 = v38 + 16;
    if (v38 >= 0xFFFFFFFFFFFFFFF0LL) {
      return 0LL;
    }
    NSUInteger v40 = -[NSData length](self->_previousAccessToken, "length");
    NSUInteger v41 = -[NSData length](self->_previousRelayIP, "length");
    NSUInteger v42 = v40 + v41;
    if (__CFADD__(v40, v41)) {
      return 0LL;
    }
    BOOL v11 = __CFADD__(v42, v39);
    NSUInteger v43 = v42 + v39;
    if (v11) {
      return 0LL;
    }
    NSUInteger v44 = -[NSString length](self->_testOptions, "length");
    uint64_t v45 = -[NSNumber integerValue](self->_invitationRetryCount, "integerValue");
    unint64_t result = 0LL;
    uint64_t v46 = v45 >> 63;
    BOOL v11 = __CFADD__(v44, v45);
    NSUInteger v47 = v44 + v45;
    if (v11) {
      uint64_t v48 = v46 + 1;
    }
    else {
      uint64_t v48 = v46;
    }
    uint64_t v49 = v48 << 63 >> 63;
    if (v49 == v48 && (v49 & 0x8000000000000000LL) == 0)
    {
      BOOL v11 = __CFADD__(v47, v43);
      NSUInteger v50 = v47 + v43;
      if (!v11)
      {
        NSInteger v51 = -[NSNumber integerValue](self->_groupMemberCount, "integerValue");
        NSInteger v52 = -[NSNumber integerValue](self->_selfAllocationCount, "integerValue");
        NSInteger v53 = v52 + v51;
        if ((((unsigned __int128)(v52 + (__int128)v51) >> 64) & 1) == 0)
        {
          BOOL v11 = __CFADD__(v53, v50);
          unint64_t v54 = v53 + v50;
          if (v11) {
            return 0LL;
          }
          else {
            return v54;
          }
        }
      }

      return 0LL;
    }
  }

  return result;
}

- (id)description
{
  if (-[NSData bytes](self->_IDSSessionID, "bytes")) {
    unint64_t v3 = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  -[NSData bytes](self->_IDSSessionID, "bytes"));
  }
  else {
    unint64_t v3 = 0LL;
  }
  if (-[NSData bytes](self->_relaySessionID, "bytes")) {
    unint64_t v4 = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  -[NSData bytes](self->_relaySessionID, "bytes"));
  }
  else {
    unint64_t v4 = 0LL;
  }
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSQuickRelayAllocateMessage;
  id v5 = -[IDSQuickRelayAllocateMessage description](&v12, "description");
  NSUInteger v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  requestIDStr = self->_requestIDStr;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v3, "UUIDString"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v4, "UUIDString"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:requestID = %@, IDSSessionID = %@ relaySessionID = %@",  v6,  requestIDStr,  v8,  v9));

  return v10;
}

- (void)setTestOptions:(id)a3
{
  id v4 = a3;
  testOptions = self->_testOptions;
  if (testOptions)
  {
    NSUInteger v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](testOptions, "stringByAppendingString:", @" "));
    NSUInteger v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](v6, "stringByAppendingString:", v4));
    uint64_t v8 = self->_testOptions;
    self->_testOptions = v7;
  }

  else
  {
    objc_super v9 = (NSString *)v4;
    NSUInteger v6 = self->_testOptions;
    self->_testOptions = v9;
  }

  uint64_t v10 = OSLogHandleForIDSCategory("QRAllocator");
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = self->_testOptions;
    *(_DWORD *)buf = 138412290;
    NSUInteger v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "testOptions changed to: %@", buf, 0xCu);
  }
}

- (NSData)requestID
{
  return (NSData *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setRequestID:(id)a3
{
}

- (NSString)requestIDStr
{
  return (NSString *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setRequestIDStr:(id)a3
{
}

- (NSNumber)allocateType
{
  return (NSNumber *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setAllocateType:(id)a3
{
}

- (NSData)IDSSessionID
{
  return (NSData *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setIDSSessionID:(id)a3
{
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setRecipients:(id)a3
{
}

- (NSString)senderURI
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setSenderURI:(id)a3
{
}

- (NSData)activeRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setActiveRelayIP:(id)a3
{
}

- (NSData)activeRelaySessionToken
{
  return (NSData *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setActiveRelaySessionToken:(id)a3
{
}

- (NSString)conversationID
{
  return (NSString *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setConversationID:(id)a3
{
}

- (NSData)existingRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setExistingRelayIP:(id)a3
{
}

- (NSData)existingRelaySessionToken
{
  return (NSData *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setExistingRelaySessionToken:(id)a3
{
}

- (NSData)existingRelaySignature
{
  return (NSData *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)setExistingRelaySignature:(id)a3
{
}

- (NSData)senderExternalIP
{
  return (NSData *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)setSenderExternalIP:(id)a3
{
}

- (NSString)appID
{
  return (NSString *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setAppID:(id)a3
{
}

- (NSData)relayIP
{
  return (NSData *)objc_getProperty(self, a2, 472LL, 1);
}

- (void)setRelayIP:(id)a3
{
}

- (NSNumber)relayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 480LL, 1);
}

- (void)setRelayPort:(id)a3
{
}

- (NSData)relaySessionKey
{
  return (NSData *)objc_getProperty(self, a2, 496LL, 1);
}

- (void)setRelaySessionKey:(id)a3
{
}

- (NSData)relaySessionToken
{
  return (NSData *)objc_getProperty(self, a2, 488LL, 1);
}

- (void)setRelaySessionToken:(id)a3
{
}

- (NSData)relaySessionID
{
  return (NSData *)objc_getProperty(self, a2, 504LL, 1);
}

- (void)setRelaySessionID:(id)a3
{
}

- (NSData)relaySoftwareVersion
{
  return (NSData *)objc_getProperty(self, a2, 528LL, 1);
}

- (void)setRelaySoftwareVersion:(id)a3
{
}

- (NSString)relayBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 536LL, 1);
}

- (void)setRelayBuildVersion:(id)a3
{
}

- (NSNumber)relayHighPriorityPort
{
  return (NSNumber *)objc_getProperty(self, a2, 544LL, 1);
}

- (void)setRelayHighPriorityPort:(id)a3
{
}

- (NSNumber)ipPreference
{
  return (NSNumber *)objc_getProperty(self, a2, 568LL, 1);
}

- (void)setIpPreference:(id)a3
{
}

- (NSNumber)relayExpiryTimeStamp
{
  return (NSNumber *)objc_getProperty(self, a2, 512LL, 1);
}

- (void)setRelayExpiryTimeStamp:(id)a3
{
}

- (NSData)inferredExternalIP
{
  return (NSData *)objc_getProperty(self, a2, 520LL, 1);
}

- (void)setInferredExternalIP:(id)a3
{
}

- (NSNumber)provider
{
  return (NSNumber *)objc_getProperty(self, a2, 376LL, 1);
}

- (void)setProvider:(id)a3
{
}

- (NSNumber)allocateProtocolVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 384LL, 1);
}

- (void)setAllocateProtocolVersion:(id)a3
{
}

- (NSNumber)isSharedSession
{
  return (NSNumber *)objc_getProperty(self, a2, 400LL, 1);
}

- (void)setIsSharedSession:(id)a3
{
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 408LL, 1);
}

- (void)setGroupID:(id)a3
{
}

- (NSNumber)qrReason
{
  return (NSNumber *)objc_getProperty(self, a2, 416LL, 1);
}

- (void)setQrReason:(id)a3
{
}

- (NSNumber)qrError
{
  return (NSNumber *)objc_getProperty(self, a2, 424LL, 1);
}

- (void)setQrError:(id)a3
{
}

- (NSData)previousAccessToken
{
  return (NSData *)objc_getProperty(self, a2, 432LL, 1);
}

- (void)setPreviousAccessToken:(id)a3
{
}

- (NSData)previousRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 440LL, 1);
}

- (void)setPreviousRelayIP:(id)a3
{
}

- (NSNumber)errorCode
{
  return (NSNumber *)objc_getProperty(self, a2, 576LL, 1);
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)errorMessage
{
  return (NSString *)objc_getProperty(self, a2, 584LL, 1);
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)testOptions
{
  return self->_testOptions;
}

- (NSNumber)invitationRetryCount
{
  return (NSNumber *)objc_getProperty(self, a2, 592LL, 1);
}

- (void)setInvitationRetryCount:(id)a3
{
}

- (NSNumber)groupMemberCount
{
  return (NSNumber *)objc_getProperty(self, a2, 600LL, 1);
}

- (void)setGroupMemberCount:(id)a3
{
}

- (NSNumber)selfAllocationCount
{
  return (NSNumber *)objc_getProperty(self, a2, 608LL, 1);
}

- (void)setSelfAllocationCount:(id)a3
{
}

- (NSNumber)isNewUPlusOneSession
{
  return (NSNumber *)objc_getProperty(self, a2, 624LL, 1);
}

- (void)setIsNewUPlusOneSession:(id)a3
{
}

- (NSNumber)isLightweightParticipant
{
  return (NSNumber *)objc_getProperty(self, a2, 680LL, 1);
}

- (void)setIsLightweightParticipant:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 672LL, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (NSDictionary)qrExperiments
{
  return (NSDictionary *)objc_getProperty(self, a2, 648LL, 1);
}

- (void)setQrExperiments:(id)a3
{
}

- (NSDictionary)qrForceExperiment
{
  return (NSDictionary *)objc_getProperty(self, a2, 656LL, 1);
}

- (void)setQrForceExperiment:(id)a3
{
}

- (NSString)pskTransportParameters
{
  return (NSString *)objc_getProperty(self, a2, 552LL, 1);
}

- (void)setPskTransportParameters:(id)a3
{
}

- (NSString)pskH3Settings
{
  return (NSString *)objc_getProperty(self, a2, 560LL, 1);
}

- (void)setPskH3Settings:(id)a3
{
}

- (NSString)protocol
{
  return (NSString *)objc_getProperty(self, a2, 392LL, 1);
}

- (void)setProtocol:(id)a3
{
}

- (NSNumber)infoAttribute
{
  return (NSNumber *)objc_getProperty(self, a2, 616LL, 1);
}

- (void)setInfoAttribute:(id)a3
{
}

- (NSString)reportingDataBlob
{
  return (NSString *)objc_getProperty(self, a2, 456LL, 1);
}

- (void)setReportingDataBlob:(id)a3
{
}

- (NSNumber)linkSuggestion
{
  return (NSNumber *)objc_getProperty(self, a2, 632LL, 1);
}

- (void)setLinkSuggestion:(id)a3
{
}

- (NSNumber)linkScore
{
  return (NSNumber *)objc_getProperty(self, a2, 640LL, 1);
}

- (void)setLinkScore:(id)a3
{
}

- (NSData)relayIPv6
{
  return (NSData *)objc_getProperty(self, a2, 688LL, 1);
}

- (void)setRelayIPv6:(id)a3
{
}

- (NSNumber)isInternal
{
  return (NSNumber *)objc_getProperty(self, a2, 664LL, 1);
}

- (void)setIsInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end