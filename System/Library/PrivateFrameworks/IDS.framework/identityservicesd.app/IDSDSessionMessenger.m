@interface IDSDSessionMessenger
- (BOOL)_canSendMessageLocally:(id)a3 toDestinations:(id)a4 withCommand:(id)a5;
- (BOOL)alwaysSkipSelf;
- (IDSDAccountController)accountController;
- (IDSDSession)delegate;
- (IDSDSessionMessenger)initWithDictionary:(id)a3 sharedState:(id)a4 accountController:(id)a5;
- (IDSDSessionSharedState)sharedState;
- (IDSPushHandler)pushHandler;
- (NSNumber)remoteUsePhoneContinuityLocalMessage;
- (void)_sendSinglePathMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 forceLocalDelivery:(BOOL)a6 messageGUID:(id)a7 fromURI:(id)a8 willSendBlock:(id)a9 completionBlock:(id)a10;
- (void)receivedEndMessage:(id)a3 fromURI:(id)a4;
- (void)receivedSessionMessage:(id)a3 fromURI:(id)a4;
- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5;
- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 fromURI:(id)a6;
- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 fromURI:(id)a6 willSendBlock:(id)a7 completionBlock:(id)a8;
- (void)sendMessage:(id)a3 withCommand:(id)a4;
- (void)sendReinitiateMessageWithSubcommand:(int64_t)a3;
- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setAlwaysSkipSelf:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3;
- (void)setSharedState:(id)a3;
@end

@implementation IDSDSessionMessenger

- (IDSDSessionMessenger)initWithDictionary:(id)a3 sharedState:(id)a4 accountController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSDSessionMessenger;
  v11 = -[IDSDSessionMessenger init](&v20, "init");
  if (v11)
  {
    id v19 = 0LL;
    IMGetConferenceSettings(0LL, &v19, 0LL, 0LL, 0LL);
    id v12 = v19;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
    pushHandler = v11->_pushHandler;
    v11->_pushHandler = (IDSPushHandler *)v13;

    objc_storeStrong((id *)&v11->_accountController, a5);
    if (!v11->_pushHandler)
    {
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Could not create IDSPushHandler for session",  v18,  2u);
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:IDSSessionAlwaysSkipSelfKey]);
    v11->_alwaysSkipSelf = [v16 BOOLValue];

    objc_storeStrong((id *)&v11->_sharedState, a4);
  }

  return v11;
}

- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4
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

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);

  if (v12)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageSessionID, v12);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695EB4();
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 participantID]);

  if (v14)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageParticipantID, v14);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695E34();
  }

  if (v6) {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, IDSDSessionMessageInfo, v6);
  }
  uint64_t v15 = OSLogHandleForTransportCategory("IDSDSessionMessenger");
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 uniqueID]);
    *(_DWORD *)buf = 138412802;
    id v28 = v7;
    __int16 v29 = 2112;
    v30 = v18;
    __int16 v31 = 2112;
    v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending MESSAGE to %@, %@ <%@>", buf, 0x20u);
  }

  uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
  if ((_DWORD)v20)
  {
    if (_IDSShouldLogTransport(v20))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v21 uniqueID]);
      v26 = v8;
      id v24 = v7;
      _IDSLogTransport(@"IDSDSessionMessenger", @"IDS", @"Sending MESSAGE to %@, %@ <%@>");

      if (_IDSShouldLog(0LL, @"IDSDSessionMessenger"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState", v7, v25, v8));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueID]);
        v26 = v8;
        id v24 = v7;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDSessionMessenger", @"Sending MESSAGE to %@, %@ <%@>");
      }
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 236LL, v24, v25, v26));
  -[IDSDSessionMessenger sendMessage:toDestinations:withCommand:]( self,  "sendMessage:toDestinations:withCommand:",  v8,  v7,  v23);
}

- (void)sendMessage:(id)a3 withCommand:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 destinations]);
  -[IDSDSessionMessenger sendMessage:toDestinations:withCommand:]( self,  "sendMessage:toDestinations:withCommand:",  v7,  v8,  v6);
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5
{
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 fromURI:(id)a6
{
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 fromURI:(id)a6 willSendBlock:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v17)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
    id v17 = (id)objc_claimAutoreleasedReturnValue([v20 fromURI]);
  }

  v35 = v19;
  v36 = v17;
  v37 = v18;
  v38 = v16;
  v39 = v14;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v15;
  id v21 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v21)
  {
    id v22 = v21;
    v41 = 0LL;
    v42 = 0LL;
    uint64_t v43 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v45 != v43) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 prefixedURI]);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 accountID]);
        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 serviceName]);
        unsigned int v30 = +[IDSDAccountController isDefaultPairedDeviceFromID:accountUniqueID:serviceName:]( &OBJC_CLASS___IDSDAccountController,  "isDefaultPairedDeviceFromID:accountUniqueID:serviceName:",  v25,  v27,  v29);

        if (v30)
        {
          __int16 v31 = v42;
          if (!v42)
          {
            __int16 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            v42 = v31;
          }
        }

        else
        {
          __int16 v31 = v41;
          if (!v41)
          {
            __int16 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            v41 = v31;
          }
        }

        -[NSMutableSet addObject:](v31, "addObject:", v24);
      }

      id v22 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }

    while (v22);
  }

  else
  {
    v41 = 0LL;
    v42 = 0LL;
  }

  if (-[NSMutableSet count](v42, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    -[IDSDSessionMessenger _sendSinglePathMessage:toDestinations:withCommand:forceLocalDelivery:messageGUID:fromURI:willSendBlock:completionBlock:]( self,  "_sendSinglePathMessage:toDestinations:withCommand:forceLocalDelivery:messageGUID:fromURI:willSendBlock:completionBlock:",  v39,  v42,  v38,  0LL,  v32,  v36,  v37,  v35);
  }

  v33 = v41;
  if (-[NSMutableSet count](v41, "count"))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    -[IDSDSessionMessenger _sendSinglePathMessage:toDestinations:withCommand:forceLocalDelivery:messageGUID:fromURI:willSendBlock:completionBlock:]( self,  "_sendSinglePathMessage:toDestinations:withCommand:forceLocalDelivery:messageGUID:fromURI:willSendBlock:completionBlock:",  v39,  v41,  v38,  0LL,  v34,  v36,  v37,  v35);
    if (-[IDSDSessionMessenger _canSendMessageLocally:toDestinations:withCommand:]( self,  "_canSendMessageLocally:toDestinations:withCommand:",  v39,  obj,  v38))
    {
      -[IDSDSessionMessenger _sendSinglePathMessage:toDestinations:withCommand:forceLocalDelivery:messageGUID:fromURI:willSendBlock:completionBlock:]( self,  "_sendSinglePathMessage:toDestinations:withCommand:forceLocalDelivery:messageGUID:fromURI:willSendBlock:completionBlock:",  v39,  v41,  v38,  1LL,  v34,  v36,  v37,  v35);
    }

    v33 = v41;
  }
}

- (void)_sendSinglePathMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 forceLocalDelivery:(BOOL)a6 messageGUID:(id)a7 fromURI:(id)a8 willSendBlock:(id)a9 completionBlock:(id)a10
{
  BOOL v88 = a6;
  id v91 = a3;
  id v93 = a4;
  id v94 = a5;
  id v95 = a7;
  v92 = (__CFString *)a8;
  id v89 = a9;
  id v90 = a10;
  v97 = self;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger accountController](self, "accountController"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountID]);
  v96 = (void *)objc_claimAutoreleasedReturnValue([v15 accountWithUniqueID:v17]);

  if (v96)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger pushHandler](self, "pushHandler"));
    id v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 pushToken]);

    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v109 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "My token -> %@", buf, 0xCu);
    }

    id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v106 = 0u;
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int128 v103 = 0u;
    id v22 = v93;
    v23 = 0LL;
    id v24 = [v22 countByEnumeratingWithState:&v103 objects:v114 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v104;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v104 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)i);
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 pushToken]);

          v23 = v28;
          __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 rawToken]);
          unsigned __int8 v30 = [v29 isEqualToData:v19];

          if ((v30 & 1) == 0) {
            -[NSMutableSet addObject:](v21, "addObject:", v27);
          }
        }

        id v24 = [v22 countByEnumeratingWithState:&v103 objects:v114 count:16];
      }

      while (v24);
    }

    if (-[NSMutableSet count](v21, "count"))
    {
      __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v96 unprefixedURIStringsFromRegistration]);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v21, "allObjects"));
        uint64_t v34 = IMLoggingStringForArray();
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        *(_DWORD *)buf = 138412802;
        v109 = v92;
        __int16 v110 = 2112;
        v111 = v32;
        __int16 v112 = 2112;
        v113 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "sendMessage - using fromID %@ given aliases %@  destinations: %@",  buf,  0x20u);
      }

      v87 = (void *)objc_claimAutoreleasedReturnValue([v22 anyObject]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v87 prefixedURI]);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 accountID]);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 serviceName]);
      unsigned int v86 = +[IDSDAccountController isDefaultPairedDeviceFromID:accountUniqueID:serviceName:]( &OBJC_CLASS___IDSDAccountController,  "isDefaultPairedDeviceFromID:accountUniqueID:serviceName:",  v36,  v38,  v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue([v22 anyObject]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 prefixedURI]);
      LODWORD(v37) = [v42 hasPrefix:@"guest-device:"];

      if ((v86 | v88 | v37) == 1)
      {
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
        if ([v43 forceInternetInvitation])
        {
          id v44 = 0LL;
        }

        else
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue([v96 service]);
          id v44 = [v55 allowLocalDelivery];
        }
      }

      else
      {
        id v44 = 0LL;
      }

      id v56 = objc_alloc_init(&OBJC_CLASS___IDSSendParameters);
      [v56 setPriority:300];
      v57 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v21));
      [v56 setDestinations:v57];

      [v56 setMessage:v91];
      [v56 setCommand:v94];
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString unprefixedURI](v92, "unprefixedURI"));
      [v56 setFromID:v58];

      [v56 setEncryptPayload:1];
      [v56 setIdentifier:v95];
      uint64_t v59 = IDSGetUUIDData(v95);
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      [v56 setMessageUUID:v60];

      [v56 setFireAndForget:1];
      [v56 setLocalDelivery:v44];
      objc_msgSend(v56, "setAlwaysSkipSelf:", -[IDSDSessionMessenger alwaysSkipSelf](v97, "alwaysSkipSelf"));
      uint64_t v107 = IDSRegistrationPropertyIsC2KEquipment;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v107, 1LL));
      [v56 setInterestingRegistrationProperties:v61];

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
      objc_msgSend(v56, "setSessionForceInternetInvitation:", objc_msgSend(v62, "forceInternetInvitation"));

      if ([v94 integerValue] == (id)232)
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
        [v63 inviteTimeout];
        double v65 = v64;

        [v56 setTimeout:v65];
        [v56 setEnforceRemoteTimeouts:1];
      }

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
      v67 = (void *)objc_claimAutoreleasedReturnValue([v66 requiredLackOfCapabilities]);
      id v68 = [v67 count];

      if (v68)
      {
        v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue([v70 requiredLackOfCapabilities]);
          *(_DWORD *)buf = 138412290;
          v109 = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "sendMessage - requires lack of properties {requiredLackOfCapabilities: %@}",  buf,  0xCu);
        }

        v72 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
        v73 = (void *)objc_claimAutoreleasedReturnValue([v72 requiredLackOfCapabilities]);
        [v56 setRequireLackOfRegistrationProperties:v73];
      }

      v74 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
      v75 = (void *)objc_claimAutoreleasedReturnValue([v74 requiredCapabilities]);
      id v76 = [v75 count];

      if (v76)
      {
        v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
          v79 = (__CFString *)objc_claimAutoreleasedReturnValue([v78 requiredCapabilities]);
          *(_DWORD *)buf = 138412290;
          v109 = v79;
          _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "sendMessage - requires properties {requiredCapabilities: %@}",  buf,  0xCu);
        }

        v80 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
        v81 = (void *)objc_claimAutoreleasedReturnValue([v80 requiredCapabilities]);
        [v56 setRequireAllRegistrationProperties:v81];
      }

      if (((!v88 | v86) & 1) == 0 && [v94 integerValue] == (id)236)
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](v97, "sharedState"));
        v83 = (void *)objc_claimAutoreleasedReturnValue([v82 uniqueID]);
        [v56 setSessionID:v83];
      }

      v101[0] = _NSConcreteStackBlock;
      v101[1] = 3221225472LL;
      v101[2] = sub_10004C268;
      v101[3] = &unk_1008F7C78;
      id v102 = v89;
      v98[0] = _NSConcreteStackBlock;
      v98[1] = 3221225472LL;
      v98[2] = sub_10004C27C;
      v98[3] = &unk_1008F7CA0;
      id v99 = v95;
      id v100 = v90;
      [v96 sendMessageWithSendParameters:v56 willSendBlock:v101 completionBlock:v98];
    }

    else
    {
      uint64_t v52 = OSLogHandleForIDSCategory("Warning");
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "No destinations to send message to, ignoring...",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v54))
      {
        _IDSWarnV(@"IDSFoundation", @"No destinations to send message to, ignoring...");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"No destinations to send message to, ignoring...");
        _IDSLogTransport(@"Warning", @"IDS", @"No destinations to send message to, ignoring...");
      }
    }

    goto LABEL_45;
  }

  uint64_t v45 = OSLogHandleForIDSCategory("Warning");
  __int128 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
    v48 = (void *)objc_claimAutoreleasedReturnValue([v47 accountID]);
    *(_DWORD *)buf = 138412546;
    v109 = @"IDSDSession";
    __int16 v110 = 2112;
    v111 = v48;
    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%@ - No account with unique ID %@ found to send a message, bailing...",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v49))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
    v84 = (void *)objc_claimAutoreleasedReturnValue([v50 accountID]);
    _IDSWarnV(@"IDSFoundation", @"%@ - No account with unique ID %@ found to send a message, bailing...");

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState", @"IDSDSession", v84));
    v85 = (void *)objc_claimAutoreleasedReturnValue([v51 accountID]);
    _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - No account with unique ID %@ found to send a message, bailing...");

    id v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState", @"IDSDSession", v85));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString accountID](v19, "accountID"));
    _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - No account with unique ID %@ found to send a message, bailing...");
LABEL_45:
  }
}

- (BOOL)_canSendMessageLocally:(id)a3 toDestinations:(id)a4 withCommand:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  if ([v11 clientType] != (id)4) {
    goto LABEL_14;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 236LL));
  if (([v10 isEqualToNumber:v12] & 1) == 0)
  {
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  if ([v13 state] != 5)
  {

    goto LABEL_13;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionMessenger remoteUsePhoneContinuityLocalMessage]( self,  "remoteUsePhoneContinuityLocalMessage"));

  if (!v14)
  {
LABEL_15:
    BOOL v19 = 0;
    goto LABEL_16;
  }

  uint64_t v15 = OSLogHandleForTransportCategory("IDSDSession");
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v21 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "This Phone Continuity session supports the local message. Trying the local...",  v21,  2u);
  }

  uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  if ((_DWORD)v18)
  {
    if (_IDSShouldLogTransport(v18))
    {
      _IDSLogTransport( @"IDSDSession",  @"IDS",  @"This Phone Continuity session supports the local message. Trying the local...");
      if (_IDSShouldLog(0LL, @"IDSDSession")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"This Phone Continuity session supports the local message. Trying the local...");
      }
    }
  }

  BOOL v19 = 1;
LABEL_16:

  return v19;
}

- (void)receivedSessionMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
    int v28 = 138412802;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    __int16 v32 = 2112;
    v33 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received MESSAGE %@ from %@, %@",  (uint8_t *)&v28,  0x20u);
  }

  uint64_t v11 = IDSDSessionMessageInfo;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDSessionMessageInfo]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v15));
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSData, v17);
    if ((objc_opt_isKindOfClass(v15, v18) & 1) == 0)
    {
      BOOL v19 = 0LL;
      goto LABEL_9;
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
  }

  BOOL v19 = (void *)v16;
LABEL_9:

  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
  -[IMMessageContext setShouldBoost:](v20, "setShouldBoost:", 1LL);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 pushTopic]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( [v21 broadcasterForTopic:v23 entitlement:kIDSSessionPrivateEntitlement command:0 messageContext:v20]);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
  [v24 sessionMessageReceived:v26 fromID:v27 withData:v19];
}

- (void)receivedEndMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSDSession](&OBJC_CLASS___IDSFoundationLog, "IDSDSession"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueID]);
    int v29 = 138412802;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    __int16 v33 = 2112;
    uint64_t v34 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received END %@ from %@, %@",  (uint8_t *)&v29,  0x20u);
  }

  uint64_t v11 = IDSDSessionMessageContext;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDSessionMessageContext]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v15));
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSData, v17);
    if ((objc_opt_isKindOfClass(v15, v18) & 1) == 0)
    {
      BOOL v19 = 0LL;
      goto LABEL_9;
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
  }

  BOOL v19 = (void *)v16;
LABEL_9:

  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
  -[IMMessageContext setShouldBoost:](v20, "setShouldBoost:", 1LL);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 pushTopic]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( [v21 broadcasterForTopic:v23 entitlement:kIDSSessionPrivateEntitlement command:0 messageContext:v20]);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
  [v24 sessionEndReceived:v26 fromID:v27 withData:v19];

  int v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger delegate](self, "delegate"));
  [v28 endSessionWithReason:7];
}

- (void)sendReinitiateMessageWithSubcommand:(int64_t)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v6 = _IDSSessionProtocolVersionNumber();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDSessionMessageVersion, v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695F34();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueID]);

  if (v9)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDSessionMessageSessionID, v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695EB4();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 participantID]);

  if (v11)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDSessionMessageParticipantID, v11);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695E34();
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  if (v12)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, IDSDSessionMessageReinitiateSubcommand, v12);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100695FB4();
  }

  uint64_t v13 = OSLogHandleForTransportCategory("IDSDSession");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 destinations]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uniqueID]);
    *(_DWORD *)buf = 138413058;
    v37 = v15;
    __int16 v38 = 2112;
    v39 = v5;
    __int16 v40 = 2112;
    v41 = v17;
    __int16 v42 = 2112;
    uint64_t v43 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Sending REINITIATE (subcommand %@) %@ to %@, %@",  buf,  0x2Au);
  }

  uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
  if ((_DWORD)v21)
  {
    if (_IDSShouldLogTransport(v21))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 destinations]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
      uint64_t v34 = v24;
      v35 = (void *)objc_claimAutoreleasedReturnValue([v25 uniqueID]);
      id v32 = v22;
      __int16 v33 = v5;
      _IDSLogTransport(@"IDSDSession", @"IDS", @"Sending REINITIATE (subcommand %@) %@ to %@, %@");

      if (_IDSShouldLog(0LL, @"IDSDSession"))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  a3,  v22,  v5,  v24,  v35));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
        int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 destinations]);
        int v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState"));
        uint64_t v34 = v28;
        v35 = (void *)objc_claimAutoreleasedReturnValue([v29 uniqueID]);
        id v32 = v26;
        __int16 v33 = v5;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSession",  @"Sending REINITIATE (subcommand %@) %@ to %@, %@");
      }
    }
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionMessenger sharedState](self, "sharedState", v32, v33, v34, v35));
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 destinations]);
  -[IDSDSessionMessenger sendMessage:toDestinations:withCommand:]( self,  "sendMessage:toDestinations:withCommand:",  v5,  v31,  &off_100946858);
}

- (BOOL)alwaysSkipSelf
{
  return self->_alwaysSkipSelf;
}

- (void)setAlwaysSkipSelf:(BOOL)a3
{
  self->_alwaysSkipSelf = a3;
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IDSDSession)delegate
{
  return (IDSDSession *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)remoteUsePhoneContinuityLocalMessage
{
  return self->_remoteUsePhoneContinuityLocalMessage;
}

- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3
{
}

- (IDSDSessionSharedState)sharedState
{
  return self->_sharedState;
}

- (void)setSharedState:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end