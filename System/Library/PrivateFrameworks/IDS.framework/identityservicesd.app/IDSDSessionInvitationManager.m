@interface IDSDSessionInvitationManager
- (BOOL)_isLocalDeviceSafeviewAdviserInitiatorOnLoboMacOrLaterAndRemoteDeviceIsPreTiboAnyPlatform;
- (BOOL)_isValidDestination:(id)a3;
- (BOOL)remoteAssumeRemoteDeviceEncryption;
- (BOOL)useStunMICheck;
- (IDSDSession)delegate;
- (IDSDSessionInvitationManager)initWithDictionary:(id)a3 sharedState:(id)a4 messenger:(id)a5;
- (IDSDSessionMessenger)messenger;
- (IDSDSessionSharedState)sharedState;
- (NSData)quickRelaySessionToken;
- (NSData)remoteBlob;
- (NSDictionary)preferences;
- (id)_acceptedDeviceToken;
- (id)_acceptedDeviceUniqueID;
- (id)publicIdentityDataFromLocalFullIdentity;
- (unsigned)SSRCRecv;
- (unsigned)SSRCSend;
- (unsigned)seqRecvStart;
- (unsigned)seqSendStart;
- (void)_sendAcceptMessageWithContext:(id)a3 connectionData:(id)a4;
- (void)_sendCancelInvitationToDestinations:(id)a3 withData:(id)a4;
- (void)_sendInvitationMessageToDestinations:(id)a3 withOptions:(id)a4 contextData:(id)a5 declineOnError:(BOOL)a6 connectionData:(id)a7;
- (void)_sendInvitationWithOptions:(id)a3 data:(id)a4 declineOnError:(BOOL)a5;
- (void)acceptInvitation;
- (void)acceptInvitationWithData:(id)a3;
- (void)cancelInvitation;
- (void)cancelInvitationWithData:(id)a3;
- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3;
- (void)declineInvitation;
- (void)declineInvitationWithData:(id)a3;
- (void)declineInvitationWithData:(id)a3 forceFromURI:(id)a4 additionalMessageAttributes:(id)a5;
- (void)receivedAcceptMessage:(id)a3 fromURI:(id)a4;
- (void)receivedCancelMessage:(id)a3 fromURI:(id)a4;
- (void)receivedDeclineMessage:(id)a3 fromURI:(id)a4;
- (void)sendCancelInvitationToDestinations:(id)a3 remoteEndReason:(unsigned int)a4 data:(id)a5;
- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4;
- (void)sendInvitationWithOptions:(id)a3 declineOnError:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setMessenger:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setQuickRelaySessionToken:(id)a3;
- (void)setRemoteAssumeRemoteDeviceEncryption:(BOOL)a3;
- (void)setRemoteBlob:(id)a3;
- (void)setSSRCRecv:(unsigned int)a3;
- (void)setSSRCSend:(unsigned int)a3;
- (void)setSeqRecvStart:(unsigned int)a3;
- (void)setSeqSendStart:(unsigned int)a3;
- (void)setSharedState:(id)a3;
- (void)setUseStunMICheck:(BOOL)a3;
@end

@implementation IDSDSessionInvitationManager

- (IDSDSessionInvitationManager)initWithDictionary:(id)a3 sharedState:(id)a4 messenger:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSDSessionInvitationManager;
  v11 = -[IDSDSessionInvitationManager init](&v15, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:IDSSessionUseStunMessageIntegrityKey]);
    v11->_useStunMICheck = [v12 BOOLValue];

    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:IDSDSessionMessageAssumeRemoteDeviceEncryption]);
    v11->_remoteAssumeRemoteDeviceEncryption = [v13 BOOLValue];

    objc_storeStrong((id *)&v11->_sharedState, a4);
    objc_storeStrong((id *)&v11->_messenger, a5);
  }

  return v11;
}

- (void)sendInvitationWithOptions:(id)a3 declineOnError:(BOOL)a4
{
}

- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4
{
}

- (void)_sendInvitationWithOptions:(id)a3 data:(id)a4 declineOnError:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);
  if (v11)
  {

LABEL_6:
    BOOL v74 = v5;
    v75 = v9;
    v76 = v8;
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountID]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 accountWithUniqueID:v17]);

    v80 = v18;
    unsigned int v79 = [v18 accountType];
    v19 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 destinations]);
    v22 = -[NSMutableSet initWithSet:](v19, "initWithSet:", v21);

    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 destinations]);

    id obj = v24;
    id v83 = [v24 countByEnumeratingWithState:&v90 objects:v102 count:16];
    v14 = 0LL;
    v25 = 0LL;
    if (!v83) {
      goto LABEL_33;
    }
    uint64_t v82 = *(void *)v91;
    uint64_t v77 = IDSDevicePropertyIsActivePairedDevice;
    uint64_t v78 = IDSDevicePropertyDefaultLocalDevice;
    unsigned int v26 = v79;
    while (1)
    {
      for (i = 0LL; i != v83; i = (char *)i + 1)
      {
        if (*(void *)v91 != v82) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)i);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
        unsigned int v30 = [v29 destinationIsDefaultPairedDevice:v28];

        if (v30)
        {
          if (!v14) {
            v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          }
          v31 = v14;
          goto LABEL_30;
        }

        if (v26 == 2)
        {
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v95 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Using local account, can only send invitation to active device, ignoring %@...",  buf,  0xCu);
          }

          -[NSMutableSet removeObject:](v22, "removeObject:", v28);
        }

        else
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v28 prefixedURI]);
          unsigned int v34 = [v33 hasPrefix:@"device:"];

          if (!v34) {
            goto LABEL_27;
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue([v28 unprefixedURI]);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v80 dependentRegistrationMatchingUUID:v35]);

          if (!v36) {
            goto LABEL_26;
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v78]);
          unsigned int v38 = [v37 BOOLValue];

          v39 = v25;
          v40 = v14;
          v41 = v22;
          v42 = self;
          v43 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v77]);
          unsigned __int8 v44 = [v43 BOOLValue];

          self = v42;
          v22 = v41;
          v14 = v40;
          v25 = v39;
          if (!v38 || (v44 & 1) != 0)
          {
LABEL_26:

            unsigned int v26 = v79;
LABEL_27:
            if (!v25) {
              v25 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            }
            v31 = v25;
LABEL_30:
            -[NSMutableSet addObject:](v31, "addObject:", v28);
            continue;
          }

          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v95 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Trying to send invite to inactive device, ignoring %@...",  buf,  0xCu);
          }

          -[NSMutableSet removeObject:](v22, "removeObject:", v28);
          unsigned int v26 = v79;
        }
      }

      id v83 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
      if (!v83)
      {
LABEL_33:

        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
          v48 = (void *)objc_claimAutoreleasedReturnValue([v47 destinations]);
          *(_DWORD *)buf = 138413058;
          v95 = v48;
          __int16 v96 = 2112;
          v97 = (const __CFString *)v22;
          __int16 v98 = 2112;
          v99 = v14;
          __int16 v100 = 2112;
          v101 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Send invitation with destinations %@ newDestinations %@ pairedDestinations %@ allOtherDestinations %@",  buf,  0x2Au);
        }

        v49 = v25;

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
        [v50 setDestinations:v22];

        id v9 = v75;
        id v8 = v76;
        if (-[NSMutableSet count](v14, "count"))
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
          unsigned __int8 v52 = [v51 forceInternetInvitation];

          if ((v52 & 1) == 0)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
              unsigned int v56 = [v55 isScreenSharingSession];
              v57 = @"NO";
              if (v56) {
                v57 = @"YES";
              }
              *(_DWORD *)buf = 138412546;
              v95 = v53;
              __int16 v96 = 2112;
              v97 = v57;
              _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Got connection data %@, isScreenSharingSession %@",  buf,  0x16u);
            }

            -[IDSDSessionInvitationManager _sendInvitationMessageToDestinations:withOptions:contextData:declineOnError:connectionData:]( self,  "_sendInvitationMessageToDestinations:withOptions:contextData:declineOnError:connectionData:",  v14,  v76,  v75,  v74,  v53);
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
            [v58 setInvitationTimer];
          }
        }

        if (-[NSMutableSet count](v25, "count")
          || (v59 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState")),
              unsigned int v60 = [v59 forceInternetInvitation],
              v59,
              v60))
        {
          v61 = v25;
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
          unsigned int v63 = [v62 forceInternetInvitation];

          if (v63)
          {
            v64 = v14;

            v61 = v64;
          }

          v65 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
          v84[0] = _NSConcreteStackBlock;
          v84[1] = 3221225472LL;
          v84[2] = sub_1002BF1A0;
          v84[3] = &unk_1008FFBE0;
          v84[4] = self;
          v85 = v61;
          id v86 = v76;
          id v87 = v75;
          BOOL v89 = v74;
          v88 = v14;
          v66 = v61;
          [v65 networkingIsAvailable:v84];
        }

        v67 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
        [v67 setState:3];

        v68 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager preferences](self, "preferences"));
        -[IDSDSessionInvitationManager _setLinkPreferences:](self, "_setLinkPreferences:", v68);

        v69 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
        v71 = (void *)objc_claimAutoreleasedReturnValue([v70 destinations]);
        v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v71 count]));
        [v69 submitAWDMetricsForIDSSessionInvitationSentWithNumberOfRecipients:v72];

        v73 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
        [v73 updateCriticalReliabilityState];

        goto LABEL_48;
      }
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  unsigned int v13 = [v12 isScreenSharingSession];

  if (!v13) {
    goto LABEL_6;
  }
  v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "No legacy connection, bailing...",  buf,  2u);
  }

- (void)_sendInvitationMessageToDestinations:(id)a3 withOptions:(id)a4 contextData:(id)a5 declineOnError:(BOOL)a6 connectionData:(id)a7
{
  BOOL v8 = a6;
  id v88 = a3;
  id v12 = a4;
  id v13 = a5;
  id v89 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueID]);

  if (v15)
  {
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v17 = _IDSSessionProtocolVersionNumber();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (v18)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageVersion, v18);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100695F34();
    }

    id v23 = v89;
    if (v23)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageBlob, v23);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A730C();
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 uniqueID]);

    if (v25)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageSessionID, v25);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100695EB4();
    }

    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 participantID]);

    if (v27)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageParticipantID, v27);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100695E34();
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v28 transportType]));

    if (v29)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageTransportType, v29);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A728C();
    }

    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    if (v30)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageDeclineOnNetworkError, v30);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A720C();
    }

    if (v12) {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageInviteOptions, v12);
    }
    if (v13) {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageContext, v13);
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager quickRelaySessionToken](self, "quickRelaySessionToken"));
    if (v31) {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageQuickRelaySessionToken, v31);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v32 enableSKE]));

    if (v33) {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageNeedsToWaitForPreConnectionData, v33);
    }

    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v34 disableEncryption]));

    if (v35) {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageDisableEncryption, v35);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v36 enableSingleChannelDirectMode]));

    if (v37) {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageSingleChannelDirectMode, v37);
    }

    CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageUseStunMessageIntegrity, &__kCFBooleanTrue);
    CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageUseSecureQRControlMessage, &__kCFBooleanTrue);
    unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v38 useBTDatagramPipe]));

    if (v39) {
      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageIsRealTime, v39);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 localUnauthenticatedFullIdentity]);

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionInvitationManager publicIdentityDataFromLocalFullIdentity]( self,  "publicIdentityDataFromLocalFullIdentity"));
      if (!v42)
      {
        uint64_t v61 = OSLogHandleForIDSCategory("Warning");
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "Failed to send invitation because failed to create unauthenticated public key",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v63))
        {
          _IDSWarnV( @"IDSFoundation",  @"Failed to send invitation because failed to create unauthenticated public key");
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed to send invitation because failed to create unauthenticated public key");
          _IDSLogTransport( @"Warning",  @"IDS",  @"Failed to send invitation because failed to create unauthenticated public key");
        }

        goto LABEL_80;
      }

      CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSSessionUnauthenticatedPublicKey, v42);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    BOOL v44 = [v43 connectionCountHint] == 0;

    if (!v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v45 connectionCountHint]));

      if (v46) {
        CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageConnectionCountHint, v46);
      }
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    unsigned int v48 = [v47 isScreenSharingSession];

    if (v48)
    {
      if (SecRandomCopyBytes(kSecRandomDefault, 0x3CuLL, self->keyMaterial))
      {
        uint64_t v49 = OSLogHandleForIDSCategory("Warning");
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          int v51 = *__error();
          unsigned __int8 v52 = __error();
          v53 = strerror(*v52);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v51;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = v53;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "SecRandomCopyBytes failed %d (%s), bailing...",  buf,  0x12u);
        }

        v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
        v55 = (void *)objc_claimAutoreleasedReturnValue([v54 serviceName]);
        uint64_t v56 = *__error();
        v57 = __error();
        id v87 = strerror(*v57);
        DLCWarn(v55, @"IDSDSession", 0LL, @"SecRandomCopyBytes failed %d (%s), bailing...");

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate", v56, v87));
        [v58 endSessionWithReason:17];

LABEL_80:
        goto LABEL_81;
      }

      v64 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  self->keyMaterial,  60LL,  0LL);
      if (v64) {
        CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageKeyMaterial, v64);
      }
      -[IDSDSessionInvitationManager setSSRCSend:](self, "setSSRCSend:", arc4random());
      v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[IDSDSessionInvitationManager SSRCSend](self, "SSRCSend")));
      if (v65)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageSelfSSRC, v65);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1006A718C();
      }

      uint64_t v66 = arc4random();
      -[IDSDSessionInvitationManager setSeqSendStart:](self, "setSeqSendStart:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      [v67 setSeqSend:v66];

      v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)-[IDSDSessionInvitationManager seqSendStart](self, "seqSendStart")));
      if (v68)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v16, IDSDSessionMessageSelfSeqStart, v68);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1006A710C();
      }
    }

    else
    {
      CFDictionarySetValue( (CFMutableDictionaryRef)v16,  IDSDSessionMessageUseCloudPairedControlChannel,  &__kCFBooleanTrue);
      CFDictionarySetValue( (CFMutableDictionaryRef)v16,  IDSDSessionMessageUsePhoneContinuityLocalMessage,  &__kCFBooleanTrue);
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
      int v60 = [v59 isWithDefaultPairedDevice];

      if ((v60 & 1) == 0) {
        CFDictionarySetValue( (CFMutableDictionaryRef)v16,  IDSDSessionMessageAssumeRemoteDeviceEncryption,  &__kCFBooleanTrue);
      }
    }

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
    [v69 registerClientChannel];

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    [v70 inviteSentTime];
    BOOL v72 = v71 == 0.0;

    if (v72)
    {
      double v74 = ids_monotonic_time(v73);
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      [v75 setInviteSentTime:v74];
    }

    v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue([v77 uniqueID]);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v88;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v78;
      *(_WORD *)&buf[22] = 2112;
      __int16 v100 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "Sending invitation to %@, %@ <%@>",  buf,  0x20u);
    }

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    LOBYTE(v100) = 0;
    unsigned int v79 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
    -[IMMessageContext setShouldBoost:](v79, "setShouldBoost:", 1LL);
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue([v81 pushTopic]);
    id v83 = (void *)objc_claimAutoreleasedReturnValue( [v80 broadcasterForTopic:v82 entitlement:kIDSSessionEntitlement command:0 messageContext:v79]);

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager messenger](self, "messenger"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 232LL));
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472LL;
    v94[2] = sub_1002C0BFC;
    v94[3] = &unk_1008FFC28;
    objc_copyWeak(&v97, &location);
    v94[4] = self;
    id v95 = v83;
    __int16 v96 = buf;
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_1002C1170;
    v90[3] = &unk_1008FFC50;
    __int128 v93 = buf;
    id v86 = v95;
    id v91 = v86;
    __int128 v92 = self;
    [v84 sendMessage:v16 toDestinations:v88 withCommand:v85 fromURI:0 willSendBlock:v94 completionBlock:v90];

    objc_destroyWeak(&v97);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);
    goto LABEL_80;
  }

  uint64_t v19 = OSLogHandleForTransportCategory("IDSDSession");
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Not sending invitation because of missing uniqueID",  buf,  2u);
  }

  uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
  if ((_DWORD)v22)
  {
    if (_IDSShouldLogTransport(v22))
    {
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Not sending invitation because of missing uniqueID");
      if (_IDSShouldLog(0LL, @"IDSDSession")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Not sending invitation because of missing uniqueID");
      }
    }
  }

- (void)_sendCancelInvitationToDestinations:(id)a3 withData:(id)a4
{
}

- (void)sendCancelInvitationToDestinations:(id)a3 remoteEndReason:(unsigned int)a4 data:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  unsigned __int8 v11 = [v10 isInitiator];

  if ((v11 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    [v12 clearAllTimers];

    if ((_DWORD)v6) {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
    }
    else {
      id v13 = 0LL;
    }
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v19 = _IDSSessionProtocolVersionNumber();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (v20)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSDSessionMessageVersion, v20);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100695F34();
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueID]);

    if (v22)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSDSessionMessageSessionID, v22);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100695EB4();
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 participantID]);

    if (v24)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSDSessionMessageParticipantID, v24);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100695E34();
    }

    if (v13) {
      CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSDSessionMessageRemoteEndReason, v13);
    }
    if (v9) {
      CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSDSessionMessageContext, v9);
    }
    if (![v8 count])
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 destinations]);

      id v8 = (id)v26;
    }

    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 uniqueID]);
      int v34 = 138412802;
      id v35 = v8;
      __int16 v36 = 2112;
      v37 = v29;
      __int16 v38 = 2112;
      v39 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Sending CANCEL %@, %@ <%@>",  (uint8_t *)&v34,  0x20u);
    }

    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager messenger](self, "messenger"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 235LL));
    [v30 sendMessage:v18 toDestinations:v8 withCommand:v31];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 count]));
    [v32 submitAWDMetricsForIDSSessionCancelSentWithRemoteEndReason:v6 numberOfRecipients:v33];
  }

  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory("Warning");
    objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v34) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "We are the receiver, we can only DECLINE the invite, not CANCEL",  (uint8_t *)&v34,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v16))
    {
      _IDSWarnV(@"IDSFoundation", @"We are the receiver, we can only DECLINE the invite, not CANCEL");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"We are the receiver, we can only DECLINE the invite, not CANCEL");
      *(void *)&double v17 = _IDSLogTransport( @"Warning",  @"IDS",  @"We are the receiver, we can only DECLINE the invite, not CANCEL").n128_u64[0];
    }

    -[IDSDSessionInvitationManager declineInvitationWithData:](self, "declineInvitationWithData:", v9, v17);
  }
}

- (id)_acceptedDeviceUniqueID
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 destinations]);
    *(_DWORD *)buf = 138412290;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Looking for device unique ID in: %@", buf, 0xCu);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 destinations]);

  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v20 = v9;
    while (2)
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v12), "pushToken", v20));
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v20;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "  => Push token: %@", buf, 0xCu);
        }

        if (v13)
        {
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 rawToken]);
          double v17 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceIDForPushToken:v16]);

          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            v27 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "    => Found unique ID: %@", buf, 0xCu);
          }

          if ([v17 length])
          {

            goto LABEL_21;
          }
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "  => No unique ID found", buf, 2u);
  }

  double v17 = 0LL;
LABEL_21:

  return v17;
}

- (id)_acceptedDeviceToken
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 destinations]);
    *(_DWORD *)buf = 138412290;
    __int128 v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Looking for device token in: %@", buf, 0xCu);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 destinations]);

  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v18;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v16 = v9;
LABEL_5:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "pushToken", v16));
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16;
        __int128 v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "  => Push token: %@", buf, 0xCu);
      }

      if (v13) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "  => No token found", buf, 2u);
    }

    id v13 = 0LL;
  }

  return v13;
}

- (void)cancelInvitation
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
  [v3 endSessionWithReason:5];
}

- (void)cancelInvitationWithData:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
  [v4 endSessionWithReason:5];
}

- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
  [v4 endSessionWithReason:5];
}

- (void)acceptInvitation
{
}

- (void)acceptInvitationWithData:(id)a3
{
  id value = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSDate);
  v132 = self;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  [v5 setStartConnectingDate:v4];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
  unsigned int v7 = [v6 isWithDefaultPairedDevice];

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_21;
  }
  if (v7) {
    __int128 v9 = @"YES";
  }
  else {
    __int128 v9 = @"NO";
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
  else {
    uint64_t v11 = @"NO";
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
  else {
    id v13 = @"NO";
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
  id v15 = [v14 clientType];
  if (v15 == (id)1)
  {
    int v16 = 0;
  }

  else
  {
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    if ([v130 clientType] == (id)5)
    {
      int v16 = 0;
    }

    else
    {
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
      int v16 = 1;
      if ([v129 clientType] != (id)6)
      {
        __int128 v17 = @"NO";
        goto LABEL_16;
      }
    }
  }

  __int128 v17 = @"YES";
LABEL_16:
  *(_DWORD *)buf = 138413058;
  v138 = v9;
  __int16 v139 = 2112;
  v140 = v11;
  __int16 v141 = 2112;
  v142 = (void *)v13;
  __int16 v143 = 2112;
  v144 = v17;
  _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "acceptInvitationWithData isWithDefaultDevice (%@) enableQuickRelay (%@), useQRDirectly (%@), isFaceTime(%@)",  buf,  0x2Au);
  if (v16) {

  }
  if (v15 != (id)1) {
LABEL_21:
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager remoteBlob](v132, "remoteBlob"));
  if (v18) {
    int v19 = 1;
  }
  else {
    int v19 = v7;
  }
  if (v19 == 1)
  {
  }

  else
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    unsigned __int8 v21 = [v20 enableQuickRelay];

    if ((v21 & 1) == 0)
    {
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "No remote blob, bailing...", buf, 2u);
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v132, "delegate"));
      [v42 endSessionWithReason:9];
      goto LABEL_121;
    }
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
  [v22 clearAllTimers];

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
  [v23 setConnectionTimer];

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
  [v24 setState:4];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v132, "delegate"));
  [v25 registerClientChannel];

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
  unsigned int v27 = [v26 isScreenSharingSession];

  if (v27)
  {
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager remoteBlob](v132, "remoteBlob"));
      *(_DWORD *)buf = 138412290;
      v138 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "acceptInvitationWithData remoteBlob %@",  buf,  0xCu);
    }

    unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 connection]);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager remoteBlob](v132, "remoteBlob"));
    [v31 receivedRemoteConnectionData:v32];

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    int v34 = (void *)objc_claimAutoreleasedReturnValue([v33 connection]);
    v135[0] = _NSConcreteStackBlock;
    v135[1] = 3221225472LL;
    v135[2] = sub_1002C2F48;
    v135[3] = &unk_1008FF198;
    v135[4] = v132;
    id v136 = value;
    [v34 createConnectionData:0 handler:v135];

LABEL_120:
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager preferences](v132, "preferences"));
    -[IDSDSessionInvitationManager _setLinkPreferences:](v132, "_setLinkPreferences:", v117);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v132, "delegate"));
    [v42 submitAWDMetricsForIDSSessionAcceptSent];
    goto LABEL_121;
  }

  if (v7)
  {
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    unsigned int v36 = [v35 forceInternetInvitation];

    if (!v36)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v132, "delegate"));
      [v64 openSocketToDevice:kIDSDefaultPairedDeviceID];

      v65 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v66 = _IDSSessionProtocolVersionNumber();
      v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      if (v67)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSDSessionMessageVersion, v67);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100695F34();
      }

      __int128 v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
      if (v93)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSDSessionMessageBlob, v93);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1006A730C();
      }

      v94 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
      id v95 = (void *)objc_claimAutoreleasedReturnValue([v94 uniqueID]);

      if (v95)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSDSessionMessageSessionID, v95);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100695EB4();
      }

      __int16 v96 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
      id v97 = (void *)objc_claimAutoreleasedReturnValue([v96 participantID]);

      if (v97)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSDSessionMessageParticipantID, v97);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100695E34();
      }

      if (value) {
        CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSDSessionMessageContext, value);
      }
      CFDictionarySetValue( (CFMutableDictionaryRef)v65,  IDSDSessionMessageUseCloudPairedControlChannel,  &__kCFBooleanTrue);
      CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSDSessionMessageUseStunMessageIntegrity, &__kCFBooleanTrue);
      CFDictionarySetValue((CFMutableDictionaryRef)v65, IDSDSessionMessageUseSecureQRControlMessage, &__kCFBooleanTrue);
      __int16 v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        v99 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
        __int16 v100 = (__CFString *)objc_claimAutoreleasedReturnValue([v99 destinations]);
        v101 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
        v102 = (__CFString *)objc_claimAutoreleasedReturnValue([v101 uniqueID]);
        *(_DWORD *)buf = 138412802;
        v138 = v100;
        __int16 v139 = 2112;
        v140 = v102;
        __int16 v141 = 2112;
        v142 = v65;
        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Sending accept to %@, %@ <%@>", buf, 0x20u);
      }

      v103 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager messenger](v132, "messenger"));
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 233LL));
      [v103 sendMessage:v65 withCommand:v104];

      goto LABEL_120;
    }
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager _acceptedDeviceUniqueID](v132, "_acceptedDeviceUniqueID"));

  BOOL v38 = v37 == 0LL;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
  v40 = v39;
  if (v38)
  {
    unsigned __int8 v43 = [v39 useQRDirectly];

    if ((v43 & 1) == 0
      && !-[IDSDSessionInvitationManager remoteAssumeRemoteDeviceEncryption](v132, "remoteAssumeRemoteDeviceEncryption"))
    {
      v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        v119 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
        v120 = (__CFString *)objc_claimAutoreleasedReturnValue([v119 fromURI]);
        v121 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
        v122 = (__CFString *)objc_claimAutoreleasedReturnValue([v121 uniqueID]);
        *(_DWORD *)buf = 138412546;
        v138 = v120;
        __int16 v139 = 2112;
        v140 = v122;
        _os_log_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_DEFAULT,  "At ACCEPT invitaion - from %@, session %@, expecting remote device encryption but remote does not specify",  buf,  0x16u);
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v132, "delegate"));
      [v42 endSessionWithReason:17];
      goto LABEL_121;
    }
  }

  else
  {
    [v39 setDisableRemoteDeviceEncryption:1];
  }

  BOOL v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
  unsigned int v45 = [v44 enableQuickRelay];

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    if (([v46 useQRDirectly] & 1) == 0)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
      if ([v47 clientType] != (id)1)
      {
        unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
        if ([v48 clientType] != (id)5)
        {
          v123 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
          BOOL v124 = [v123 clientType] == (id)6;

          if (!v124) {
            goto LABEL_50;
          }
          goto LABEL_49;
        }
      }
    }

LABEL_49:
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v132, "delegate"));
    [v49 startQRSession];

LABEL_50:
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[IDSQuickRelayAllocator sharedInstance](&OBJC_CLASS___IDSQuickRelayAllocator, "sharedInstance"));
    int v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue([v51 uniqueID]);
    [v50 requestAllocationForRecipient:v52];
    goto LABEL_55;
  }

  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager remoteBlob](v132, "remoteBlob"));
    *(_DWORD *)buf = 138412290;
    v138 = v54;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "acceptInvitationWithData remoteBlob %@",  buf,  0xCu);
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v55 localBlob]);
  BOOL v57 = v56 == 0LL;

  if (!v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v132, "delegate"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    int v60 = (void *)objc_claimAutoreleasedReturnValue([v59 uniqueID]);
    [v58 openSocketToDevice:v60];

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
    int v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue([v51 uniqueID]);
    objc_msgSend( v50,  "startConnectionForDevice:isInitiator:remotePartyID:useStunMICheck:",  v52,  0,  0,  -[IDSDSessionInvitationManager useStunMICheck](v132, "useStunMICheck"));
LABEL_55:

    uint64_t v61 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v62 = _IDSSessionProtocolVersionNumber();
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    if (v63)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v61, IDSDSessionMessageVersion, v63);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100695F34();
    }

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    v69 = (void *)objc_claimAutoreleasedReturnValue([v68 localBlob]);

    if (v69)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v61, IDSDSessionMessageBlob, v69);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A730C();
    }

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    double v71 = (void *)objc_claimAutoreleasedReturnValue([v70 uniqueID]);

    if (v71)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v61, IDSDSessionMessageSessionID, v71);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100695EB4();
    }

    BOOL v72 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v72 participantID]);

    if (v73)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v61, IDSDSessionMessageParticipantID, v73);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100695E34();
    }

    if (value) {
      CFDictionarySetValue((CFMutableDictionaryRef)v61, IDSDSessionMessageContext, value);
    }
    CFDictionarySetValue((CFMutableDictionaryRef)v61, IDSDSessionMessageUseStunMessageIntegrity, &__kCFBooleanTrue);
    CFDictionarySetValue((CFMutableDictionaryRef)v61, IDSDSessionMessageUseSecureQRControlMessage, &__kCFBooleanTrue);
    double v74 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager _acceptedDeviceUniqueID](v132, "_acceptedDeviceUniqueID"));
    BOOL v75 = v74 == 0LL;

    if (v75) {
      CFDictionarySetValue( (CFMutableDictionaryRef)v61,  IDSDSessionMessageAssumeRemoteDeviceEncryption,  &__kCFBooleanTrue);
    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v76 localUnauthenticatedFullIdentity]);

    if (!v77) {
      goto LABEL_115;
    }
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
    unsigned int v79 = (void *)objc_claimAutoreleasedReturnValue([v78 localUnauthenticatedFullIdentity]);
    id v134 = 0LL;
    v80 = (__CFString *)objc_claimAutoreleasedReturnValue([v79 publicIdentityWithError:&v134]);
    v81 = (__CFString *)v134;

    if (v80)
    {
      v133 = v81;
      uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataRepresentationWithError:](v80, "dataRepresentationWithError:", &v133));
      id v83 = v133;

      if (v82)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v61, IDSSessionUnauthenticatedPublicKey, v82);
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v138 = v80;
          _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "Sending unauthenticated public identity {publicIdentity: %{private}@}",  buf,  0xCu);
        }
      }

      else
      {
        uint64_t v105 = OSLogHandleForIDSCategory("Warning");
        v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          v138 = v83;
          __int16 v139 = 2113;
          v140 = v80;
          _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_ERROR,  "Failed to create data from public public identity {error: %{public}@, publicIdentity: %{private}@}",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v107))
        {
          _IDSWarnV( @"IDSFoundation",  @"Failed to create data from public public identity {error: %{public}@, publicIdentity: %{private}@}");
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed to create data from public public identity {error: %{public}@, publicIdentity: %{private}@}");
          v125 = v83;
          v126 = v80;
          _IDSLogTransport( @"Warning",  @"IDS",  @"Failed to create data from public public identity {error: %{public}@, publicIdentity: %{private}@}");
        }
      }
    }

    else
    {
      uint64_t v85 = OSLogHandleForIDSCategory("Warning");
      id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        id v87 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
        id v88 = (__CFString *)objc_claimAutoreleasedReturnValue([v87 localUnauthenticatedFullIdentity]);
        *(_DWORD *)buf = 138543619;
        v138 = v81;
        __int16 v139 = 2113;
        v140 = v88;
        _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_ERROR,  "Failed to create public identity from full identity {error: %{public}@, fullIdentity: %{private}@}",  buf,  0x16u);
      }

      if (!os_log_shim_legacy_logging_enabled(v89))
      {
        id v83 = v81;
        goto LABEL_114;
      }

      __int128 v90 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
      v127 = (void *)objc_claimAutoreleasedReturnValue([v90 localUnauthenticatedFullIdentity]);
      _IDSWarnV( @"IDSFoundation",  @"Failed to create public identity from full identity {error: %{public}@, fullIdentity: %{private}@}");

      id v91 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState", v81, v127));
      v128 = (void *)objc_claimAutoreleasedReturnValue([v91 localUnauthenticatedFullIdentity]);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed to create public identity from full identity {error: %{public}@, fullIdentity: %{private}@}");

      uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState", v81, v128));
      v125 = v81;
      v126 = (__CFString *)objc_claimAutoreleasedReturnValue([v82 localUnauthenticatedFullIdentity]);
      _IDSLogTransport( @"Warning",  @"IDS",  @"Failed to create public identity from full identity {error: %{public}@, fullIdentity: %{private}@}");

      id v83 = v81;
    }

LABEL_114:
LABEL_115:
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState", v125, v126));
    unsigned __int8 v109 = [v108 isScreenSharingSession];

    if ((v109 & 1) == 0)
    {
      CFDictionarySetValue( (CFMutableDictionaryRef)v61,  IDSDSessionMessageUseCloudPairedControlChannel,  &__kCFBooleanTrue);
      CFDictionarySetValue( (CFMutableDictionaryRef)v61,  IDSDSessionMessageUsePhoneContinuityLocalMessage,  &__kCFBooleanTrue);
    }

    v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      v111 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
      v112 = (__CFString *)objc_claimAutoreleasedReturnValue([v111 destinations]);
      v113 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v132, "sharedState"));
      v114 = (__CFString *)objc_claimAutoreleasedReturnValue([v113 uniqueID]);
      *(_DWORD *)buf = 138412802;
      v138 = v112;
      __int16 v139 = 2112;
      v140 = v114;
      __int16 v141 = 2112;
      v142 = v61;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Sending accept to %@, %@ <%@>", buf, 0x20u);
    }

    v115 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager messenger](v132, "messenger"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 233LL));
    [v115 sendMessage:v61 withCommand:v116];

    goto LABEL_120;
  }

  __int128 v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "Failed to get local connection data, bailing...",  buf,  2u);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v132, "delegate"));
  [v42 endSessionWithReason:8];
LABEL_121:
}

- (void)_sendAcceptMessageWithContext:(id)a3 connectionData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v9 = _IDSSessionProtocolVersionNumber();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageVersion, v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695F34();
  }

  id v11 = v7;
  if (v11)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageBlob, v11);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A730C();
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);

  if (v13)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageSessionID, v13);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695EB4();
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 participantID]);

  if (v15)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageParticipantID, v15);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695E34();
  }

  if (v6) {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageContext, v6);
  }
  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 localUnauthenticatedFullIdentity]);

  if (v17)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionInvitationManager publicIdentityDataFromLocalFullIdentity]( self,  "publicIdentityDataFromLocalFullIdentity"));
    if (!v18)
    {
      uint64_t v30 = OSLogHandleForIDSCategory("Warning");
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Failed to send IDSSession because failed to create unauthenticatedPublicIdentityData",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v32))
      {
        _IDSWarnV( @"IDSFoundation",  @"Failed to send IDSSession because failed to create unauthenticatedPublicIdentityData");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed to send IDSSession because failed to create unauthenticatedPublicIdentityData");
        _IDSLogTransport( @"Warning",  @"IDS",  @"Failed to send IDSSession because failed to create unauthenticatedPublicIdentityData");
      }

      goto LABEL_57;
    }

    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localUnauthenticatedFullIdentity]);
      *(_DWORD *)buf = 138477827;
      *(void *)int v60 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Sending unauthenticated public identity {localUnauthenticatedFullIdentity: %{private}@}",  buf,  0xCu);
    }

    CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSSessionUnauthenticatedPublicKey, v18);
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  unsigned int v23 = [v22 isScreenSharingSession];

  if (!v23)
  {
LABEL_54:
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      int v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue([v51 destinations]);
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      v54 = (void *)objc_claimAutoreleasedReturnValue([v53 uniqueID]);
      *(_DWORD *)buf = 138412802;
      *(void *)int v60 = v52;
      *(_WORD *)&v60[8] = 2112;
      *(void *)&v60[10] = v54;
      __int16 v61 = 2112;
      uint64_t v62 = v8;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Sending accept to %@, %@, <%@>", buf, 0x20u);
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager messenger](self, "messenger"));
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 233LL));
    [v55 sendMessage:v8 withCommand:v56];

    goto LABEL_57;
  }

  __int128 v24 = malloc(0x3CuLL);
  if (v24)
  {
    v25 = v24;
    if (SecRandomCopyBytes(kSecRandomDefault, 0x3CuLL, v24))
    {
      int v26 = *__error();
      unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = strerror(v26);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v60 = v26;
        *(_WORD *)&v60[4] = 2080;
        *(void *)&v60[6] = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "SecRandomCopyBytes failed %d (%s), bailing...",  buf,  0x12u);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
      [v29 endSessionWithReason:17];

      free(v25);
      goto LABEL_57;
    }

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_1002C39E4;
    v58[3] = &unk_1008FC7D8;
    v58[4] = v25;
    id v35 =  -[NSData initWithBytesNoCopy:length:deallocator:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:deallocator:",  v25,  60LL,  v58);
    BOOL v57 = v35;
    if (v35)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageKeyMaterial, v35);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A738C();
    }

    uint64_t v36 = arc4random();
    self->_SSRCSend = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v36));
    if (v37)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageSelfSSRC, v37);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A718C();
    }

    uint64_t v38 = arc4random();
    -[IDSDSessionInvitationManager setSeqSendStart:](self, "setSeqSendStart:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    [v39 setSeqSend:v38];

    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  LOWORD(self->_seqSendStart)));
    if (v40)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageSelfSeqStart, v40);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A710C();
    }

    for (uint64_t i = 0LL; i != 60; ++i)
      self->keyMaterial[i] ^= *((_BYTE *)v25 + i);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    BOOL v43 = [v42 peerProtocolVersion] > 1;

    BOOL v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    unsigned int v45 = [v44 encryptionState];

    int v46 = sub_1001FCBA8( v45,  (uint64_t)self->keyMaterial,  60,  0,  -[IDSDSessionInvitationManager SSRCSend](self, "SSRCSend"),  (__int16)-[IDSDSessionInvitationManager seqSendStart](self, "seqSendStart"),  -[IDSDSessionInvitationManager SSRCRecv](self, "SSRCRecv"),  (__int16)-[IDSDSessionInvitationManager seqRecvStart](self, "seqRecvStart"),  v43);
    *(_OWORD *)&self->keyMaterial[44] = 0u;
    *(_OWORD *)&self->keyMaterial[16] = 0u;
    *(_OWORD *)&self->keyMaterial[32] = 0u;
    *(_OWORD *)self->keyMaterial = 0u;
    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
      [v47 endSessionWithReason:17];

      unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      [v48 setEncryptionInitialized:0];

      goto LABEL_57;
    }

    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    [v49 setEncryptionInitialized:1];

    goto LABEL_54;
  }

  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Malloc error when creating key material, ending call...",  buf,  2u);
  }

  int v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
  [v34 endSessionWithReason:17];

LABEL_57:
}

- (void)declineInvitation
{
}

- (void)declineInvitationWithData:(id)a3
{
}

- (void)declineInvitationWithData:(id)a3 forceFromURI:(id)a4 additionalMessageAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  [v11 clearAllTimers];

  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v13 = _IDSSessionProtocolVersionNumber();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v12, IDSDSessionMessageVersion, v14);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695F34();
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);

  if (v16)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v12, IDSDSessionMessageSessionID, v16);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695EB4();
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 participantID]);

  if (v18)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v12, IDSDSessionMessageParticipantID, v18);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695E34();
  }

  if (v8) {
    CFDictionarySetValue((CFMutableDictionaryRef)v12, IDSDSessionMessageContext, v8);
  }
  -[NSMutableDictionary addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", v10);

  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 destinations]);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueID]);
    int v31 = 138412802;
    uint64_t v32 = v21;
    __int16 v33 = 2112;
    int v34 = v23;
    __int16 v35 = 2112;
    uint64_t v36 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Sending decline to %@, %@ <%@>",  (uint8_t *)&v31,  0x20u);
  }

  if (!v9)
  {
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    id v9 = (id)objc_claimAutoreleasedReturnValue([v24 fromURI]);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager messenger](self, "messenger"));
  int v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 destinations]);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 234LL));
  [v25 sendMessage:v12 toDestinations:v27 withCommand:v28 fromURI:v9];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
  [v29 submitAWDMetricsForIDSSessionDeclineSent];

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
  [v30 endSessionWithReason:2];
}

- (BOOL)_isLocalDeviceSafeviewAdviserInitiatorOnLoboMacOrLaterAndRemoteDeviceIsPreTiboAnyPlatform
{
  return 0;
}

- (id)publicIdentityDataFromLocalFullIdentity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localUnauthenticatedFullIdentity]);

  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localUnauthenticatedFullIdentity]);
    id v30 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 publicIdentityWithError:&v30]);
    id v8 = (IDSDSessionInvitationManager *)v30;

    if (v7)
    {
      v29 = v8;
      id v9 = (id)objc_claimAutoreleasedReturnValue([v7 dataRepresentationWithError:&v29]);
      id v10 = v29;

      if (v9)
      {
        id v9 = v9;
        id v8 = v10;
        id v11 = v9;
      }

      else
      {
        uint64_t v23 = OSLogHandleForIDSCategory("Warning");
        __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543875;
          uint64_t v32 = v10;
          __int16 v33 = 2113;
          int v34 = v7;
          __int16 v35 = 2113;
          uint64_t v36 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to get data from unauthenticated public identity {error: %{public}@, publicIdentity: %{private}@, ses sion: %{private}@}",  buf,  0x20u);
        }

        if (os_log_shim_legacy_logging_enabled(v25))
        {
          _IDSWarnV( @"IDSFoundation",  @"Failed to get data from unauthenticated public identity {error: %{public}@, publicIdentity: %{private}@, session: %{private}@}");
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed to get data from unauthenticated public identity {error: %{public}@, publicIdentity: %{private}@, session: %{private}@}");
          _IDSLogTransport( @"Warning",  @"IDS",  @"Failed to get data from unauthenticated public identity {error: %{public}@, publicIdentity: %{private}@, session: %{private}@}");
        }

        id v8 = v10;
        id v11 = 0LL;
      }
    }

    else
    {
      uint64_t v16 = OSLogHandleForIDSCategory("Warning");
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
        int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localUnauthenticatedFullIdentity]);
        *(_DWORD *)buf = 138543875;
        uint64_t v32 = v8;
        __int16 v33 = 2113;
        int v34 = v19;
        __int16 v35 = 2113;
        uint64_t v36 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to get unauthenticated public identity from full identity {error: %{public}@, fullIdentity: %{private}@ , session: %{private}@}",  buf,  0x20u);
      }

      if (!os_log_shim_legacy_logging_enabled(v20))
      {
        id v11 = 0LL;
        goto LABEL_20;
      }

      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      int v26 = (void *)objc_claimAutoreleasedReturnValue([v21 localUnauthenticatedFullIdentity]);
      _IDSWarnV( @"IDSFoundation",  @"Failed to get unauthenticated public identity from full identity {error: %{public}@, fullIdentity: %{private}@, session: %{private}@}");

      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState", v8, v26, self));
      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v22 localUnauthenticatedFullIdentity]);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed to get unauthenticated public identity from full identity {error: %{public}@, fullIdentity: %{private}@, session: %{private}@}");

      id v9 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState", v8, v27, self));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v9 localUnauthenticatedFullIdentity]);
      _IDSLogTransport( @"Warning",  @"IDS",  @"Failed to get unauthenticated public identity from full identity {error: %{public}@, fullIdentity: %{private}@, session: %{private}@}");

      id v11 = 0LL;
    }

LABEL_20:
    return v11;
  }

  uint64_t v12 = OSLogHandleForIDSCategory("Warning");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v32 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to create unauthenticated public key because of nil full identity {session: %{private}@}",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v14))
  {
    _IDSWarnV( @"IDSFoundation",  @"Failed to create unauthenticated public key because of nil full identity {session: %{private}@}");
    _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failed to create unauthenticated public key because of nil full identity {session: %{private}@}");
    _IDSLogTransport( @"Warning",  @"IDS",  @"Failed to create unauthenticated public key because of nil full identity {session: %{private}@}");
  }

  return 0LL;
}

- (void)receivedAcceptMessage:(id)a3 fromURI:(id)a4
{
  id v228 = a3;
  v229 = (NSMutableSet *)a4;
  v232 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
  [v6 submitAWDMetricsForIDSSessionAcceptReceived];

  id v7 = objc_alloc_init(&OBJC_CLASS___NSDate);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
  [v8 setStartConnectingDate:v7];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
  LODWORD(v8) = [v9 state];

  if (v8 >= 4)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v241 = v229;
      id v11 = "Ignoring incoming accept from %@, session is not waiting for an invite response anymore";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      goto LABEL_149;
    }

    goto LABEL_149;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
  unsigned __int8 v13 = [v12 isInitiator];

  if ((v13 & 1) != 0)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
    unsigned int v233 = [v14 destinationIsDefaultPairedDevice:v229];

    uint64_t v15 = IDSDSessionMessageBlob;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v228 objectForKey:IDSDSessionMessageBlob]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString, v17);
    if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v228 objectForKey:v15]);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v19));
    }

    else
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v228 objectForKey:v15]);
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSData, v21);
      if ((objc_opt_isKindOfClass(v19, v22) & 1) == 0)
      {
        uint64_t v23 = 0LL;
LABEL_14:

        v227 = v23;
        if (-[os_log_s length](v23, "length")) {
          char v24 = 1;
        }
        else {
          char v24 = v233;
        }
        if ((v24 & 1) == 0)
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          unsigned __int8 v26 = [v25 enableQuickRelay];

          if ((v26 & 1) == 0)
          {
            uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "No remote blob, bailing...", buf, 2u);
            }

            v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v232, "delegate"));
            [v37 endSessionWithReason:9];

            goto LABEL_148;
          }
        }

        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        unsigned int v28 = [v27 destinationIsGuestDevice:v229];

        if (!v28) {
          goto LABEL_31;
        }
        uint64_t v30 = IDSSessionUnauthenticatedPublicKey;
        int v31 = (void *)objc_claimAutoreleasedReturnValue([v228 objectForKey:IDSSessionUnauthenticatedPublicKey]);
        uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString, v32);
        if ((objc_opt_isKindOfClass(v31, v33) & 1) != 0)
        {
          int v34 = (void *)objc_claimAutoreleasedReturnValue([v228 objectForKey:v30]);
          uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v34));
        }

        else
        {
          int v34 = (void *)objc_claimAutoreleasedReturnValue([v228 objectForKey:v30]);
          uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSData, v38);
          if ((objc_opt_isKindOfClass(v34, v39) & 1) == 0)
          {
            v40 = 0LL;
            goto LABEL_29;
          }

          uint64_t v35 = objc_claimAutoreleasedReturnValue([v228 objectForKey:v30]);
        }

        v40 = (void *)v35;
LABEL_29:

        if (!v40)
        {
          _IMWarn(@"Unauthenticated invitation accept missing public key, bailing...");
          uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v232, "delegate"));
          [v89 endSessionWithReason:14];

LABEL_148:
          id v10 = v227;
          goto LABEL_149;
        }

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 publicIdentityFromData:v40]);

        BOOL v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        [v43 setRemoteUnauthenticatedPublicIdentity:v42];

LABEL_31:
        uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSString, v29);
        id v45 = sub_1002C5AF0(v44, v228, IDSDSessionMessageParticipantID);
        v226 = (void *)objc_claimAutoreleasedReturnValue(v45);
        if (![v226 length])
        {
          id v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "No participantID, bailing...", buf, 2u);
          }

          v225 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v232, "delegate"));
          [v225 endSessionWithReason:14];
          goto LABEL_147;
        }

        uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSNumber, v46);
        id v48 = sub_1002C5AF0(v47, v228, IDSDSessionMessageVersion);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        v225 = v49;
        if (!v49)
        {
          id v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "No message version, bailing...",  buf,  2u);
          }

          id v230 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v232, "delegate"));
          [v230 endSessionWithReason:14];

          goto LABEL_147;
        }

        id v50 = [v49 unsignedIntValue];
        int v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        [v51 setPeerProtocolVersion:v50];

        unsigned __int8 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          *(_DWORD *)buf = 67109120;
          LODWORD(v241) = [v53 peerProtocolVersion];
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Setting peer protocol version to %d",  buf,  8u);
        }

        uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSNumber, v54);
        id v56 = sub_1002C5AF0(v55, v228, IDSDSessionMessageUseCloudPairedControlChannel);
        BOOL v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        [v58 setRemoteUseCloudPairedControlChannel:v57];

        uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSNumber, v59);
        id v61 = sub_1002C5AF0(v60, v228, IDSDSessionMessageUsePhoneContinuityLocalMessage);
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        [v63 setRemoteUsePhoneContinuityLocalMessage:v62];

        uint64_t v65 = objc_opt_class(&OBJC_CLASS___NSNumber, v64);
        uint64_t v66 = (void *)IDSDSessionMessageUseStunMessageIntegrity;
        id v67 = sub_1002C5AF0(v65, v228, IDSDSessionMessageUseStunMessageIntegrity);
        v69 = (void *)objc_claimAutoreleasedReturnValue(v67);
        if (v69) {
          v70 = &OBJC_CLASS___NSNumber_ptr;
        }
        else {
          v70 = &OBJC_CLASS___NSString_ptr;
        }
        uint64_t v71 = objc_opt_class(*v70, v68);
        id v72 = sub_1002C5AF0(v71, v228, v66);
        uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        -[IDSDSessionInvitationManager setUseStunMICheck:](v232, "setUseStunMICheck:", [v73 BOOLValue]);

        double v74 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        LODWORD(v73) = [v74 peerProtocolVersion] < 4;

        if ((_DWORD)v73)
        {
          uint64_t v76 = objc_opt_class(&OBJC_CLASS___NSNumber, v75);
          uint64_t v77 = (void *)IDSDSessionMessageUseSecureQRControlMessage;
          id v78 = sub_1002C5AF0(v76, v228, IDSDSessionMessageUseSecureQRControlMessage);
          v80 = (void *)objc_claimAutoreleasedReturnValue(v78);
          if (v80) {
            v81 = &OBJC_CLASS___NSNumber_ptr;
          }
          else {
            v81 = &OBJC_CLASS___NSString_ptr;
          }
          uint64_t v82 = objc_opt_class(*v81, v79);
          id v83 = sub_1002C5AF0(v82, v228, v77);
          v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
          id v85 = [v84 BOOLValue];
          id v86 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          [v86 setUseSecureQRControlMessage:v85];
        }

        else
        {
          v80 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          [v80 setUseSecureQRControlMessage:1];
        }

        __int128 v90 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        unsigned int v91 = [v90 isScreenSharingSession];

        if (v91)
        {
          uint64_t v92 = IDSDSessionMessageKeyMaterial;
          __int128 v93 = (void *)objc_claimAutoreleasedReturnValue([v228 objectForKey:IDSDSessionMessageKeyMaterial]);
          uint64_t v95 = objc_opt_class(&OBJC_CLASS___NSString, v94);
          if ((objc_opt_isKindOfClass(v93, v95) & 1) != 0)
          {
            __int16 v96 = (void *)objc_claimAutoreleasedReturnValue([v228 objectForKey:v92]);
            id v231 = (id)objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v96));
          }

          else
          {
            __int16 v96 = (void *)objc_claimAutoreleasedReturnValue([v228 objectForKey:v92]);
            uint64_t v98 = objc_opt_class(&OBJC_CLASS___NSData, v97);
            if ((objc_opt_isKindOfClass(v96, v98) & 1) != 0) {
              id v231 = (id)objc_claimAutoreleasedReturnValue([v228 objectForKey:v92]);
            }
            else {
              id v231 = 0LL;
            }
          }

          uint64_t v100 = objc_opt_class(&OBJC_CLASS___NSNumber, v99);
          id v101 = sub_1002C5AF0(v100, v228, IDSDSessionMessageSelfSSRC);
          v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
          uint64_t v104 = objc_opt_class(&OBJC_CLASS___NSNumber, v103);
          id v105 = sub_1002C5AF0(v104, v228, IDSDSessionMessageSelfSeqStart);
          uint64_t v106 = objc_claimAutoreleasedReturnValue(v105);
          uint64_t v107 = (void *)v106;
          if (!v231 || !v102 || !v106) {
            goto LABEL_64;
          }
          id v108 = v231;
          unsigned __int8 v109 = [v108 bytes];
          if ([v108 length] != (id)60)
          {
            v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
            if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v119,  OS_LOG_TYPE_DEFAULT,  "receivedAcceptMessage: remoteKeyMaterialLength is not equal to remoteKeyMaterialLength, bailing...",  buf,  2u);
            }

            v120 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v232, "delegate"));
            [v120 endSessionWithReason:14];

            v118 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
            goto LABEL_69;
          }

          -[IDSDSessionInvitationManager setSSRCRecv:](v232, "setSSRCRecv:", [v102 unsignedIntValue]);
          -[IDSDSessionInvitationManager setSeqRecvStart:]( v232,  "setSeqRecvStart:",  [v107 unsignedShortValue]);
          uint64_t v110 = 0LL;
          keyMaterial = v232->keyMaterial;
          do
          {
            v232->keyMaterial[v110] ^= v109[v110];
            ++v110;
          }

          while (v110 != 60);
          v112 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          BOOL v113 = [v112 peerProtocolVersion] > 1;

          v114 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          v115 = [v114 encryptionState];

          int v116 = sub_1001FCBA8( v115,  (uint64_t)keyMaterial,  60,  1,  -[IDSDSessionInvitationManager SSRCSend](v232, "SSRCSend"),  (__int16)-[IDSDSessionInvitationManager seqSendStart](v232, "seqSendStart"),  -[IDSDSessionInvitationManager SSRCRecv](v232, "SSRCRecv"),  (__int16)-[IDSDSessionInvitationManager seqRecvStart](v232, "seqRecvStart"),  v113);
          *(_OWORD *)&v232->keyMaterial[44] = 0u;
          *(_OWORD *)&v232->keyMaterial[16] = 0u;
          *(_OWORD *)&v232->keyMaterial[32] = 0u;
          *(_OWORD *)keyMaterial = 0u;
          if (v116)
          {
LABEL_64:
            v117 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v232, "delegate"));
            [v117 endSessionWithReason:17];

            v118 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
LABEL_69:
            v121 = v118;
            [v118 setEncryptionInitialized:0];

LABEL_146:
LABEL_147:

            goto LABEL_148;
          }

          v122 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          [v122 setEncryptionInitialized:1];
        }

        v123 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        [v123 clearAllTimers];

        BOOL v124 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        [v124 setState:4];

        id v231 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet pushToken](v229, "pushToken"));
        v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
        {
          v126 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          v127 = (void *)objc_claimAutoreleasedReturnValue([v126 uniqueID]);
          *(_DWORD *)buf = 138412802;
          v241 = v229;
          __int16 v242 = 2112;
          v243 = v127;
          __int16 v244 = 2112;
          id v245 = v231;
          _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEFAULT,  "Received accept from %@, session %@, fromToken %@.",  buf,  0x20u);
        }

        v128 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        v129 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        unsigned int v130 = [v129 destinationIsGuestDevice:v229];

        __int128 v237 = 0u;
        __int128 v238 = 0u;
        __int128 v235 = 0u;
        __int128 v236 = 0u;
        v131 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        v132 = (void *)objc_claimAutoreleasedReturnValue([v131 destinations]);

        v133 = 0LL;
        id v134 = [v132 countByEnumeratingWithState:&v235 objects:v239 count:16];
        if (v134)
        {
          uint64_t v135 = *(void *)v236;
          do
          {
            for (uint64_t i = 0LL; i != v134; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v236 != v135) {
                objc_enumerationMutation(v132);
              }
              v137 = *(NSMutableSet **)(*((void *)&v235 + 1) + 8LL * (void)i);
              if (v233)
              {
                v138 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
                unsigned __int8 v139 = [v138 destinationIsDefaultPairedDevice:v137];

                if ((v139 & 1) != 0) {
                  continue;
                }
              }

              if (!v130 || (-[NSMutableSet isEqualToURI:](v137, "isEqualToURI:", v229) & 1) == 0)
              {
                v140 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet pushToken](v137, "pushToken"));

                if (([v140 isEqualToPushToken:v231] & 1) == 0)
                {
                  -[NSMutableSet addObject:](v128, "addObject:", v137);
                  __int16 v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
                  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v241 = v137;
                    _os_log_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_DEFAULT,  "Adding %@ to set to cancel",  buf,  0xCu);
                  }
                }

                v133 = v140;
              }
            }

            id v134 = [v132 countByEnumeratingWithState:&v235 objects:v239 count:16];
          }

          while (v134);
        }

        if (-[NSMutableSet count](v128, "count"))
        {
          v142 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v241 = v128;
            _os_log_impl( (void *)&_mh_execute_header,  v142,  OS_LOG_TYPE_DEFAULT,  "Canceling invitations to %@",  buf,  0xCu);
          }

          -[IDSDSessionInvitationManager sendCancelInvitationToDestinations:remoteEndReason:data:]( v232,  "sendCancelInvitationToDestinations:remoteEndReason:data:",  v128,  29LL,  0LL);
        }

        if (v233)
        {
          __int16 v143 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          unsigned __int8 v144 = [v143 forceInternetInvitation];

          if ((v144 & 1) == 0)
          {
            v145 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
            v146 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
            v147 = (void *)objc_claimAutoreleasedReturnValue([v146 uniqueID]);
            [v145 stopUDPGlobalLinkForDevice:v147];
          }
        }

        v148 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v229, 0LL, v225);
        v149 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        [v149 setDestinations:v148];

        -[IDSDSessionInvitationManager setRemoteBlob:](v232, "setRemoteBlob:", v227);
        v150 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        [v150 setConnectionTimer];

        v151 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
        LODWORD(v149) = [v151 isScreenSharingSession];

        if ((_DWORD)v149)
        {
          v152 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v152,  OS_LOG_TYPE_DEFAULT,  "Starting screen sharing connection with remote blob",  buf,  2u);
          }

          v153 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          v154 = (void *)objc_claimAutoreleasedReturnValue([v153 connection]);
          [v154 receivedRemoteConnectionData:v227];

          v155 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          v156 = (void *)objc_claimAutoreleasedReturnValue([v155 connection]);
          v157 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          id v158 = [v157 peerProtocolVersion];
          v234[0] = _NSConcreteStackBlock;
          v234[1] = 3221225472LL;
          v234[2] = sub_1002C5B98;
          v234[3] = &unk_1008F8C80;
          v234[4] = v232;
          [v156 startConnectionAsInitiator:1 peerProtocolVersion:v158 errorHandler:v234];

          goto LABEL_138;
        }

        v159 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager _acceptedDeviceUniqueID](v232, "_acceptedDeviceUniqueID"));
        if (v159) {
          char v160 = 1;
        }
        else {
          char v160 = v233;
        }
        if ((v160 & 1) != 0)
        {
        }

        else if (!-[IDSDSessionInvitationManager _isLocalDeviceSafeviewAdviserInitiatorOnLoboMacOrLaterAndRemoteDeviceIsPreTiboAnyPlatform]( v232,  "_isLocalDeviceSafeviewAdviserInitiatorOnLoboMacOrLaterAndRemoteDeviceIsPreTiboAnyPlatform"))
        {
          v186 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          unsigned __int8 v187 = [v186 useQRDirectly];

          if ((v187 & 1) != 0) {
            goto LABEL_108;
          }
          v188 = (void *)objc_claimAutoreleasedReturnValue( [v228 objectForKeyedSubscript:IDSDSessionMessageAssumeRemoteDeviceEncryption]);
          unsigned int v189 = [v188 BOOLValue];

          v190 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          v161 = v190;
          if (!v189)
          {
            int v220 = [v190 disableRemoteDeviceEncryption];

            if ((v220 & 1) == 0)
            {
              v221 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
              if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
              {
                v222 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
                v223 = (void *)objc_claimAutoreleasedReturnValue([v222 uniqueID]);
                *(_DWORD *)buf = 138412546;
                v241 = v229;
                __int16 v242 = 2112;
                v243 = v223;
                _os_log_impl( (void *)&_mh_execute_header,  v221,  OS_LOG_TYPE_DEFAULT,  "Received accept from %@, session %@, expecting remote device encryption but remote does not specify",  buf,  0x16u);
              }

              v210 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v232, "delegate"));
              [v210 endSessionWithReason:17];
              goto LABEL_145;
            }

            goto LABEL_108;
          }

          [v190 setDisableRemoteDeviceEncryption:0];
LABEL_107:

LABEL_108:
          v162 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v162,  OS_LOG_TYPE_DEFAULT,  "Starting connection with remote blob",  buf,  2u);
          }

          v163 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          if ([v163 destinationIsDefaultPairedDevice:v229])
          {
            v164 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
            unsigned int v165 = [v164 forceInternetInvitation];

            if (!v165)
            {
              v166 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v232, "delegate"));
              [v166 openSocketToDevice:kIDSDefaultPairedDeviceID];

              goto LABEL_138;
            }
          }

          else
          {
          }

          v167 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](v232, "delegate"));
          v168 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          v169 = (void *)objc_claimAutoreleasedReturnValue([v168 uniqueID]);
          [v167 openSocketToDevice:v169];

          v170 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
          LODWORD(v168) = [v170 enableQuickRelay];

          if ((_DWORD)v168)
          {
            v171 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQuickRelayAllocator sharedInstance]( &OBJC_CLASS___IDSQuickRelayAllocator,  "sharedInstance"));
            v172 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
            v173 = (void *)objc_claimAutoreleasedReturnValue([v172 uniqueID]);
            v174 = (void *)objc_claimAutoreleasedReturnValue([v231 rawToken]);
            v175 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v171 getRelaySessionIDForIDSSessionID:v173 pushToken:v174]);

            v176 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQuickRelayAllocator sharedInstance]( &OBJC_CLASS___IDSQuickRelayAllocator,  "sharedInstance"));
            v177 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
            v178 = (void *)objc_claimAutoreleasedReturnValue([v177 uniqueID]);
            v179 = (void *)objc_claimAutoreleasedReturnValue([v231 rawToken]);
            [v176 setInitiatorsAcceptedToken:v178 pushToken:v179];

            if (v175)
            {
              Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              v181 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
              v182 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v181 useSecureQRControlMessage]));

              if (v182)
              {
                CFDictionarySetValue(Mutable, IDSGlobalLinkOptionUseSecureControlMessageKey, v182);
              }

              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                sub_1006A740C();
              }

              uint64_t v195 = OSLogHandleForTransportCategory("IDSDSession");
              v196 = (os_log_s *)objc_claimAutoreleasedReturnValue(v195);
              if (os_log_type_enabled(v196, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v241 = v175;
                _os_log_impl( (void *)&_mh_execute_header,  v196,  OS_LOG_TYPE_DEFAULT,  "Accepted relay-session-id %@.",  buf,  0xCu);
              }

              uint64_t v198 = os_log_shim_legacy_logging_enabled(v197);
              if ((_DWORD)v198)
              {
                if (_IDSShouldLogTransport(v198))
                {
                  v224 = v175;
                  _IDSLogTransport(@"IDSDSession", @"IDS", @"Accepted relay-session-id %@.");
                  if (_IDSShouldLog(0LL, @"IDSDSession"))
                  {
                    v224 = v175;
                    _IDSLogV(0LL, @"IDSFoundation", @"IDSDSession", @"Accepted relay-session-id %@.");
                  }
                }
              }

              v199 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunController sharedInstance]( &OBJC_CLASS___IDSUTunController,  "sharedInstance",  v224));
              v200 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
              v201 = (void *)objc_claimAutoreleasedReturnValue([v200 uniqueID]);
              [v199 setAcceptedRelaySession:v201 relaySessionID:v175 options:Mutable];
            }

            else
            {
              uint64_t v191 = OSLogHandleForTransportCategory("IDSDSession");
              v192 = (os_log_s *)objc_claimAutoreleasedReturnValue(v191);
              if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v241 = 0LL;
                _os_log_impl( (void *)&_mh_execute_header,  v192,  OS_LOG_TYPE_DEFAULT,  "Accepted relay-session-id %@ waits for QR connection.",  buf,  0xCu);
              }

              uint64_t v194 = os_log_shim_legacy_logging_enabled(v193);
              if ((_DWORD)v194)
              {
                if (_IDSShouldLogTransport(v194))
                {
                  v224 = 0LL;
                  _IDSLogTransport( @"IDSDSession",  @"IDS",  @"Accepted relay-session-id %@ waits for QR connection.");
                  if (_IDSShouldLog(0LL, @"IDSDSession"))
                  {
                    v224 = 0LL;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Accepted relay-session-id %@ waits for QR connection.");
                  }
                }
              }
            }
          }

          else
          {
            v183 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
            v184 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](v232, "sharedState"));
            v185 = (void *)objc_claimAutoreleasedReturnValue([v184 uniqueID]);
            objc_msgSend( v183,  "startConnectionForDevice:isInitiator:remotePartyID:useStunMICheck:",  v185,  1,  v226,  -[IDSDSessionInvitationManager useStunMICheck](v232, "useStunMICheck"));
          }

- (void)receivedDeclineMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
    *(_DWORD *)buf = 138412802;
    id v58 = v6;
    __int16 v59 = 2112;
    id v60 = v7;
    __int16 v61 = 2112;
    uint64_t v62 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received decline %@ from %@, %@", buf, 0x20u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
  [v11 submitAWDMetricsForIDSSessionDeclineReceived];

  if (-[IDSDSessionInvitationManager _isValidDestination:](self, "_isValidDestination:", v7))
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
    id v14 = sub_1002C5AF0(v13, v6, IDSDSessionMessageAllowOtherInvites);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = IDSDSessionMessageContext;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDSessionMessageContext]);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString, v18);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v16]);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v20));
    }

    else
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v16]);
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSData, v26);
      if ((objc_opt_isKindOfClass(v20, v27) & 1) == 0)
      {
        uint64_t v22 = 0LL;
LABEL_12:

        uint64_t v28 = JWDecodeDictionary(v22);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v28);
        uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary, v29);
        if ((objc_opt_isKindOfClass(v23, v30) & 1) != 0)
        {
          int v31 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:IDSDSessionMessageDeclineReason]);
          unsigned int v32 = [v31 unsignedIntValue];
        }

        else
        {
          unsigned int v32 = 0;
        }

        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v58) = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Invite was declined { givenReason: %u }",  buf,  8u);
        }

        if (v32 == 13) {
          int v34 = 15;
        }
        else {
          int v34 = 2;
        }
        unsigned int v56 = v34;
        if ([v15 BOOLValue])
        {
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 destinations]);
          v37 = (IMMessageContext *)[v36 mutableCopy];

          -[IMMessageContext removeObject:](v37, "removeObject:", v7);
          id v38 = -[IMMessageContext copy](v37, "copy");
          uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v58 = v7;
            __int16 v59 = 2112;
            id v60 = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Invite was declined with reason alias deactivated { fromURI: %@, _inviteTokens: %@ }",  buf,  0x16u);
          }

          if ([v38 count])
          {
            v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Suppressing decline, other recipients",  buf,  2u);
            }

- (BOOL)_isValidDestination:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 prefixedURI]);
  unsigned __int8 v6 = [v5 isEqualToIgnoringCase:IDSDefaultPairedDevice];

  if ((v6 & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 prefixedURI]);
    if ([v8 hasPrefix:@"device:"])
    {
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      unsigned int v10 = [v9 destinationIsGuestDevice:v4];

      if (!v10)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 pushToken]);
        if (v12)
        {
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState", 0LL));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 destinations]);

          id v7 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v7)
          {
            uint64_t v19 = *(void *)v25;
            while (2)
            {
              for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v22 = v21;
                if (v21 && ([v21 isEqualToPushToken:v12] & 1) != 0)
                {

                  LOBYTE(v7) = 1;
                  goto LABEL_29;
                }
              }

              id v7 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v7) {
                continue;
              }
              break;
            }
          }

- (void)receivedCancelMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
    *(_DWORD *)buf = 138412802;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    __int128 v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received CANCEL %@ from %@, %@", buf, 0x20u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager delegate](self, "delegate"));
  [v11 submitAWDMetricsForIDSSessionCancelReceived];

  if (-[IDSDSessionInvitationManager _isValidDestination:](self, "_isValidDestination:", v7))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    [v12 clearAllTimers];

    id v13 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v7, 0LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
    [v14 setDestinations:v13];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1002C67B8;
    v20[3] = &unk_1008F5F58;
    uint64_t v21 = (os_log_s *)v6;
    uint64_t v22 = self;
    id v23 = v7;
    im_dispatch_after_primary_queue(v20, 1.0);

    uint64_t v15 = v21;
  }

  else
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueID]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionInvitationManager sharedState](self, "sharedState"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 destinations]);
      *(_DWORD *)buf = 138412802;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v17;
      __int16 v28 = 2112;
      __int128 v29 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Ignoring CANCEL from %@, %@, not in destinations: %@",  buf,  0x20u);
    }
  }
}

- (IDSDSession)delegate
{
  return (IDSDSession *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSData)quickRelaySessionToken
{
  return self->_quickRelaySessionToken;
}

- (void)setQuickRelaySessionToken:(id)a3
{
}

- (NSData)remoteBlob
{
  return self->_remoteBlob;
}

- (void)setRemoteBlob:(id)a3
{
}

- (unsigned)seqRecvStart
{
  return self->_seqRecvStart;
}

- (void)setSeqRecvStart:(unsigned int)a3
{
  self->_seqRecvStart = a3;
}

- (unsigned)SSRCRecv
{
  return self->_SSRCRecv;
}

- (void)setSSRCRecv:(unsigned int)a3
{
  self->_SSRCRecv = a3;
}

- (IDSDSessionMessenger)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (BOOL)remoteAssumeRemoteDeviceEncryption
{
  return self->_remoteAssumeRemoteDeviceEncryption;
}

- (void)setRemoteAssumeRemoteDeviceEncryption:(BOOL)a3
{
  self->_remoteAssumeRemoteDeviceEncryption = a3;
}

- (unsigned)seqSendStart
{
  return self->_seqSendStart;
}

- (void)setSeqSendStart:(unsigned int)a3
{
  self->_seqSendStart = a3;
}

- (IDSDSessionSharedState)sharedState
{
  return self->_sharedState;
}

- (void)setSharedState:(id)a3
{
}

- (unsigned)SSRCSend
{
  return self->_SSRCSend;
}

- (void)setSSRCSend:(unsigned int)a3
{
  self->_SSRCSend = a3;
}

- (BOOL)useStunMICheck
{
  return self->_useStunMICheck;
}

- (void)setUseStunMICheck:(BOOL)a3
{
  self->_useStunMICheck = a3;
}

- (void).cxx_destruct
{
}

@end