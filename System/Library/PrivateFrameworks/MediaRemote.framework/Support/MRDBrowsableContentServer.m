@interface MRDBrowsableContentServer
- (BOOL)_messageCanLaunchApp:(id)a3;
- (BOOL)_messageRequiresMediaServerBlessing:(id)a3;
- (BOOL)_takeProcessAssertionForClient:(id)a3 withReason:(id)a4;
- (MRDBrowsableContentAPICoordinator)apiCoordinator;
- (MRDBrowsableContentServer)init;
- (void)_clearQueuedBeginLoadingMessagesForApp:(id)a3;
- (void)_clientDidRegisterCanBeNowPlaying:(id)a3;
- (void)_clientDidUnregisterCanBeNowPlaying:(id)a3;
- (void)_enqueueCompletion:(id)a3 forUnavailableDestinationApp:(id)a4;
- (void)_handleBeginLoadingBrowsableContentMessage:(id)a3 fromClient:(id)a4;
- (void)_handleBrowsableContentDidFinishLoadingFromClient:(id)a3 indexPath:(id)a4 withError:(id)a5;
- (void)_handleGetAppsSupportingBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSupportedBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestPlaybackInitializationMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetSupportedBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSupportedAPIsDidChangeForClient:(id)a3;
- (void)_relayMessage:(id)a3 toClientWithBundleIDAndReply:(id)a4;
- (void)_scheduleEndProcessAssertionForClient:(id)a3;
- (void)_sendInitiatePlaybackMessage:(id)a3;
- (void)_sendQueuedBeginLoadingMessagesForAvailableApp:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
@end

@implementation MRDBrowsableContentServer

- (MRDBrowsableContentServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MRDBrowsableContentServer;
  v2 = -[MRDBrowsableContentServer init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    queuedInitiatePlaybackMessages = v2->_queuedInitiatePlaybackMessages;
    v2->_queuedInitiatePlaybackMessages = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    queuedRelayableMessages = v2->_queuedRelayableMessages;
    v2->_queuedRelayableMessages = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___MRDBrowsableContentAPICoordinator);
    apiCoordinator = v2->_apiCoordinator;
    v2->_apiCoordinator = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queuedBeginLoadingBlocks = v2->_queuedBeginLoadingBlocks;
    v2->_queuedBeginLoadingBlocks = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v2 selector:"_clientDidRegisterCanBeNowPlaying:" name:kMRMediaRemoteNowPlayingApplicationDidRegisterCanBeNowPlaying object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v2 selector:"_clientDidUnregisterCanBeNowPlaying:" name:kMRMediaRemoteNowPlayingApplicationDidUnregisterCanBeNowPlaying object:0];
  }

  return v2;
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0x500000000000001uLL:
      -[MRDBrowsableContentServer _handleBeginLoadingBrowsableContentMessage:fromClient:]( self,  "_handleBeginLoadingBrowsableContentMessage:fromClient:",  xdict,  v6);
      break;
    case 0x500000000000002uLL:
    case 0x500000000000003uLL:
    case 0x500000000000004uLL:
    case 0x500000000000005uLL:
    case 0x50000000000000AuLL:
      uint64_t v7 = MRCreateStringFromXPCMessage(xdict, "MRXPC_BUNDLE_ID_KEY");
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      -[MRDBrowsableContentServer _relayMessage:toClientWithBundleIDAndReply:]( self,  "_relayMessage:toClientWithBundleIDAndReply:",  xdict,  v8);

      break;
    case 0x500000000000006uLL:
      -[MRDBrowsableContentServer _handleRequestPlaybackInitializationMessage:fromClient:]( self,  "_handleRequestPlaybackInitializationMessage:fromClient:",  xdict,  v6);
      break;
    case 0x500000000000007uLL:
      -[MRDBrowsableContentServer _handleGetSupportedBrowsableContentAPIsMessage:fromClient:]( self,  "_handleGetSupportedBrowsableContentAPIsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x500000000000008uLL:
      -[MRDBrowsableContentServer _handleSetSupportedBrowsableContentAPIsMessage:fromClient:]( self,  "_handleSetSupportedBrowsableContentAPIsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x500000000000009uLL:
      -[MRDBrowsableContentServer _handleGetAppsSupportingBrowsableContentAPIsMessage:fromClient:]( self,  "_handleGetAppsSupportingBrowsableContentAPIsMessage:fromClient:",  xdict,  v6);
      break;
    default:
      break;
  }
}

- (void)collectDiagnostic:(id)a3
{
}

- (void)_handleBeginLoadingBrowsableContentMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MRCreateStringFromXPCMessage(v6, "MRXPC_BUNDLE_ID_KEY");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v11 = v10;
  if (v9) {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 clientForBundleIdentifier:v9]);
  }
  else {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 localNowPlayingClient]);
  }
  v13 = (void *)v12;

  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  v21 = sub_100048530;
  v22 = &unk_10039B5B8;
  id v23 = v6;
  v24 = self;
  id v14 = v6;
  v15 = objc_retainBlock(&v19);
  if (v13 && objc_msgSend(v13, "canBeNowPlaying", v19, v20, v21, v22, v23, v24))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
    -[MRDBrowsableContentServer _clearQueuedBeginLoadingMessagesForApp:]( self,  "_clearQueuedBeginLoadingMessagesForApp:",  v16);

    ((void (*)(void ***, void *))v15[2])(v15, v13);
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier", v19, v20, v21, v22));

    if (v17)
    {
      Error = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
      -[MRDBrowsableContentServer _enqueueCompletion:forUnavailableDestinationApp:]( self,  "_enqueueCompletion:forUnavailableDestinationApp:",  v15,  Error);
    }

    else
    {
      Error = (void *)MRMediaRemoteCreateError(4LL);
      -[MRDBrowsableContentServer _handleBrowsableContentDidFinishLoadingFromClient:indexPath:withError:]( self,  "_handleBrowsableContentDidFinishLoadingFromClient:indexPath:withError:",  v7,  0LL,  0LL,  Error);
    }
  }
}

- (void)_enqueueCompletion:(id)a3 forUnavailableDestinationApp:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = _MRLogForCategory(0LL, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Client %@ not available. Enqueuing beginLoading message",  (uint8_t *)&v14,  0xCu);
  }

  queuedBeginLoadingBlocks = self->_queuedBeginLoadingBlocks;
  id v12 = [v7 copy];

  id v13 = objc_retainBlock(v12);
  -[NSMutableDictionary setObject:forKey:](queuedBeginLoadingBlocks, "setObject:forKey:", v13, v6);
}

- (void)_sendQueuedBeginLoadingMessagesForAvailableApp:(id)a3
{
  id v4 = a3;
  id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_queuedBeginLoadingBlocks,  "objectForKey:",  v4));
  if (v6)
  {
    uint64_t v7 = _MRLogForCategory(0LL, v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Client %@ now available. Dequeuing beginLoading message",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clientForBundleIdentifier:v4]);

    if (v10)
    {
      ((void (**)(void, void *))v6)[2](v6, v10);
    }

    else
    {
      uint64_t v12 = _MRLogForCategory(0LL, v11);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client %@ not available even though it can be now playing app",  (uint8_t *)&v14,  0xCu);
      }
    }
  }

  -[MRDBrowsableContentServer _clearQueuedBeginLoadingMessagesForApp:]( self,  "_clearQueuedBeginLoadingMessagesForApp:",  v4);
}

- (void)_clearQueuedBeginLoadingMessagesForApp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedBeginLoadingBlocks, "objectForKey:", v4));

  if (v5)
  {
    uint64_t v7 = _MRLogForCategory(0LL, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Clearing beginLoading message for client %@",  (uint8_t *)&v9,  0xCu);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_queuedBeginLoadingBlocks, "removeObjectForKey:", v4);
  }
}

- (void)_clientDidRegisterCanBeNowPlaying:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo();
  id v8 = (id)objc_claimAutoreleasedReturnValue(v5);

  if ([v8 isLocal])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    -[MRDBrowsableContentServer _sendQueuedBeginLoadingMessagesForAvailableApp:]( self,  "_sendQueuedBeginLoadingMessagesForAvailableApp:",  v7);
  }
}

- (void)_clientDidUnregisterCanBeNowPlaying:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo();
  id v8 = (id)objc_claimAutoreleasedReturnValue(v5);

  if ([v8 isLocal])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    -[MRDBrowsableContentServer _clearQueuedBeginLoadingMessagesForApp:]( self,  "_clearQueuedBeginLoadingMessagesForApp:",  v7);
  }
}

- (void)_handleRequestPlaybackInitializationMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MRCreateDataFromXPCMessage(v5, "MRXPC_INDEXPATH_DATA_KEY");
  uint64_t v7 = MRCreateStringFromXPCMessage(v5, "MRXPC_BUNDLE_ID_KEY");
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localNowPlayingClient]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    id v8 = [v11 copy];
  }

  uint64_t v12 = -[MRDInitiatePlaybackMessage initWithBundleID:indexPathData:]( objc_alloc(&OBJC_CLASS___MRDInitiatePlaybackMessage),  "initWithBundleID:indexPathData:",  v8,  v6);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDInitiatePlaybackMessage bundleID](v12, "bundleID"));
  id v15 = v13;
  if (v13)
  {
    if (sub_10013AF48(v13))
    {
      -[MRDBrowsableContentServer _sendInitiatePlaybackMessage:](self, "_sendInitiatePlaybackMessage:", v12);
    }

    else
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100048DA0;
      v19[3] = &unk_10039B5E0;
      v19[4] = self;
      uint64_t v20 = v12;
      id v21 = v15;
      sub_10013B068(v21, 0LL, v19);
    }
  }

  else
  {
    uint64_t v16 = _MRLogForCategory(0LL, v14);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Warning: cannot handle initiate playback message without a bundle ID.",  v18,  2u);
    }
  }
}

- (void)_handleGetSupportedBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreateStringFromXPCMessage(v5, "MRXPC_BUNDLE_ID_KEY");
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  sub_10013AB4C( v5,  (uint64_t)"MRXPC_CONTENT_API_MASK_KEY",  1LL,  -[MRDBrowsableContentAPICoordinator supportedAPIsForApplication:]( self->_apiCoordinator,  "supportedAPIsForApplication:",  v7),  0LL);
}

- (void)_handleSetSupportedBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  -[MRDBrowsableContentAPICoordinator setSupportedAPIs:forApplication:]( self->_apiCoordinator,  "setSupportedAPIs:forApplication:",  xpc_dictionary_get_uint64(v7, "MRXPC_CONTENT_API_MASK_KEY"),  v8);
  sub_10013AD7C(v7, 0);

  -[MRDBrowsableContentServer _handleSupportedAPIsDidChangeForClient:]( self,  "_handleSupportedAPIsDidChangeForClient:",  v6);
}

- (void)_handleGetAppsSupportingBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = -[MRDBrowsableContentAPICoordinator applicationsSupportingAPIs:]( self->_apiCoordinator,  "applicationsSupportingAPIs:",  xpc_dictionary_get_uint64(v5, "MRXPC_CONTENT_API_MASK_KEY"));
  id v8 = (id)objc_claimAutoreleasedReturnValue(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v8,  200LL,  0LL,  0LL));
  sub_10013AC78(v5, (uint64_t)"MRXPC_BUNDLE_ID_ARRAY_DATA_KEY", v7, 0LL);
}

- (void)_relayMessage:(id)a3 toClientWithBundleIDAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  int v9 = v8;
  if (v7) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 clientForBundleIdentifier:v7]);
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 localNowPlayingClient]);
  }
  uint64_t v11 = (void *)v10;

  if (v11)
  {
    if (-[MRDBrowsableContentServer _messageRequiresMediaServerBlessing:]( self,  "_messageRequiresMediaServerBlessing:",  v6))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
      unsigned __int8 v13 = sub_10013CEB0(v12);

      if ((v13 & 1) == 0)
      {
        uint64_t v15 = _MRLogForCategory(0LL, v14);
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v31 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Error preparing client %{public}@ for browsable content message relay.",  buf,  0xCu);
        }
      }

      uint64_t v17 = _MRLogForCategory(0LL, v14);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Beginning task assertion for client %@ in preparation for playback initiated by the browsable content system.",  buf,  0xCu);
      }

      v19 = objc_alloc(&OBJC_CLASS___MRDTaskAssertion);
      id v20 = [v11 pid];
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
      v22 = -[MRDTaskAssertion initWithType:pid:bundleID:name:]( v19,  "initWithType:pid:bundleID:name:",  3LL,  v20,  v21,  @"BrowsableContent playback initiated");

      -[MRDTaskAssertion invalidateInDuration:](v22, "invalidateInDuration:", 5.0);
    }

    [v11 relayXPCMessage:v6 andReply:1];
  }

  else
  {
    unsigned int v23 = -[MRDBrowsableContentServer _messageCanLaunchApp:](self, "_messageCanLaunchApp:", v6);
    if (v7 && v23)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000492E4;
      v27[3] = &unk_10039B5E0;
      v27[4] = self;
      id v28 = v6;
      id v29 = v7;
      sub_10013B068(v29, 0LL, v27);
    }

    else
    {
      uint64_t v25 = _MRLogForCategory(0LL, v24);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Warning: could not relay browsable content message. No client found for bundle ID %@.",  buf,  0xCu);
      }
    }
  }
}

- (void)_sendInitiatePlaybackMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  if ((sub_10013CEB0(v5) & 1) == 0)
  {
    uint64_t v7 = _MRLogForCategory(0LL, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Error preparing client %@ for playback initialization.",  (uint8_t *)&v19,  0xCu);
    }
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clientForBundleIdentifier:v5]);

  if (v10)
  {
    -[MRDBrowsableContentServer _takeProcessAssertionForClient:withReason:]( self,  "_takeProcessAssertionForClient:withReason:",  v10,  @"Sending initiatePlaybackMessage");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 indexPathData]);
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v13, "MRXPC_MESSAGE_ID_KEY", 0x500000000000006uLL);
    id v14 = objc_claimAutoreleasedReturnValue([v4 bundleID]);
    xpc_dictionary_set_string(v13, "MRXPC_BUNDLE_ID_KEY", (const char *)[v14 UTF8String]);

    id v15 = v12;
    xpc_dictionary_set_data( v13,  "MRXPC_INDEXPATH_DATA_KEY",  [v15 bytes],  (size_t)objc_msgSend(v15, "length"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);
    uint64_t v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v16 connection]);
    xpc_connection_send_message(v17, v13);

    -[MRDBrowsableContentServer _scheduleEndProcessAssertionForClient:]( self,  "_scheduleEndProcessAssertionForClient:",  v10);
  }

  else
  {
    uint64_t v18 = _MRLogForCategory(0LL, v11);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "Warning: no client found for bundle ID %@. Dropping initiate playback message.",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)_handleBrowsableContentDidFinishLoadingFromClient:(id)a3 indexPath:(id)a4 withError:(id)a5
{
  unint64_t var1 = a4.var1;
  var0 = a4.var0;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", var0, 8 * var1);
  uint64_t v19 = kMRMediaRemoteIndexPathDataUserInfoKey;
  id v20 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  id v12 = [v11 mutableCopy];

  if (v9)
  {
    xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    if (v13) {
      [v12 setObject:v13 forKey:kMRMediaRemoteBrowsableContentErrorLocalizedDescriptionKey];
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    if (v14)
    {
      [v12 setObject:v14 forKey:kMRMediaRemoteBrowsableContentErrorDomainKey];
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 code]));
      [v12 setObject:v15 forKey:kMRMediaRemoteBrowsableContentErrorCodeKey];
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);

  if (v16)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    [v12 setObject:v17 forKey:kMRMediaRemoteBrowsableContentBundleIdentifierUserInfoKey];
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  [v18 postClientNotificationNamed:kMRMediaRemoteApplicationFinishedLoadingContentNotification userInfo:v12];
}

- (void)_handleSupportedAPIsDidChangeForClient:(id)a3
{
  id v31 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v31 bundleIdentifier]);
  id v5 = -[NSMutableArray copy](self->_queuedInitiatePlaybackMessages, "copy");
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v38;
    *(void *)&__int128 v7 = 138412546LL;
    __int128 v30 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleID", v30));
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          uint64_t v15 = _MRLogForCategory(0LL, v14);
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            v43 = v11;
            __int16 v44 = 2112;
            id v45 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Sending queued initiate playback message %@ to client %@.",  buf,  0x16u);
          }

          -[MRDBrowsableContentServer _sendInitiatePlaybackMessage:](self, "_sendInitiatePlaybackMessage:", v11);
          -[NSMutableArray removeObject:](self->_queuedInitiatePlaybackMessages, "removeObject:", v11);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }

    while (v8);
  }

  id v17 = -[NSMutableArray copy](self->_queuedRelayableMessages, "copy");
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        unsigned int v23 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
        uint64_t v24 = MRCreateStringFromXPCMessage(v23, "MRXPC_BUNDLE_ID_KEY");
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        if ([v25 isEqualToString:v4])
        {
          uint64_t v27 = _MRLogForCategory(0LL, v26);
          id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v43 = v23;
            __int16 v44 = 2112;
            id v45 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Sending queued relayable message %@ to client %@",  buf,  0x16u);
          }

          -[MRDBrowsableContentServer _relayMessage:toClientWithBundleIDAndReply:]( self,  "_relayMessage:toClientWithBundleIDAndReply:",  v23,  v4);
          -[NSMutableArray removeObject:](self->_queuedRelayableMessages, "removeObject:", v23);
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v20);
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  [v29 postClientNotificationNamed:kMRMediaRemoteBrowsableContentAPIChangedNotification userInfo:0];
}

- (BOOL)_takeProcessAssertionForClient:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = _MRLogForCategory(0LL, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    int v21 = 138412290;
    v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Browsable Content Server: Taking process assertion for %@.",  (uint8_t *)&v21,  0xCu);
  }

  uint64_t v11 = objc_alloc(&OBJC_CLASS___MRDTaskAssertion);
  id v12 = [v5 pid];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  uint64_t v14 = -[MRDTaskAssertion initWithType:pid:bundleID:name:](v11, "initWithType:pid:bundleID:name:", 3LL, v12, v13, v6);

  unsigned int v16 = -[MRDTaskAssertion isValid](v14, "isValid");
  if (v16)
  {
    [v5 setCurrentTaskAssertion:v14];
  }

  else
  {
    uint64_t v17 = _MRLogForCategory(0LL, v15);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
      int v21 = 138412290;
      v22 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Unable to take task assertion for %@.",  (uint8_t *)&v21,  0xCu);
    }
  }

  return v16;
}

- (void)_scheduleEndProcessAssertionForClient:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a3 currentTaskAssertion]);
  [v3 invalidateInDuration:10.0];
}

- (BOOL)_messageCanLaunchApp:(id)a3
{
  return (xpc_dictionary_get_uint64(a3, "MRXPC_MESSAGE_ID_KEY") & 0x500000000000000LL) != 0;
}

- (BOOL)_messageRequiresMediaServerBlessing:(id)a3
{
  return xpc_dictionary_get_uint64(a3, "MRXPC_MESSAGE_ID_KEY") == 0x500000000000006LL;
}

- (MRDBrowsableContentAPICoordinator)apiCoordinator
{
  return self->_apiCoordinator;
}

- (void).cxx_destruct
{
}

@end