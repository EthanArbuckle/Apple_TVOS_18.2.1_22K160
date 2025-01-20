@interface MRDRemoteControlServer
- (BOOL)_applicationIsRunning:(id)a3;
- (BOOL)_checkAndMaybeUpdateNowPlayingAppStackPopRateLimitingWithInterval:(double)a3;
- (BOOL)_clearQueuedCommand:(id)a3 forUnavailableApplicationWithDisplayID:(id)a4;
- (BOOL)_isCommandCacheCreating:(unsigned int)a3;
- (BOOL)_isCommandCacheable:(unsigned int)a3;
- (MRDCommandClientRestriction)commandClientsRestriction;
- (MRDRemoteControlServer)init;
- (NSArray)remoteControlClients;
- (NSMutableDictionary)applicationConnections;
- (id)_attributedCommand:(id)a3 forClient:(id)a4;
- (id)_contextuallyAwareDestinationAppDisplayIDForCommand:(id)a3;
- (id)_createBroadcastCommandPlayerPathForClient:(id)a3;
- (id)_createBroadcastCommandResponseFromStatuses:(id)a3 forClient:(id)a4;
- (id)_destinationClientForRemoteControlCommand:(id)a3;
- (id)_effectiveContextIDForCommand:(id)a3;
- (id)_enqueuedCommandsForDisplayID:(id)a3;
- (id)_onQueue_createAndActivateConnection:(id)a3 forClient:(id)a4;
- (id)_onQueue_presentDialogWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 completion:(id)a7;
- (id)_persistPlaybackSessionAndUpdateOptionsForSessionPreloadCommand:(id)a3 forClient:(id)a4 error:(id *)a5;
- (id)_populateApplicationSpecificDataForPrepareForSetQueueCommand:(id)a3 forClient:(id)a4;
- (id)_remoteControlContextForCommand:(id)a3;
- (id)_resolveCommandBeforeSend:(id)a3 toClient:(id)a4 error:(id *)a5;
- (id)_resolvedLocalDeviceDestinationAppDisplayIdentifierForCommand:(id)a3;
- (void)_cleanUpPersistedSessionForSessionPreloadCommand:(id)a3;
- (void)_clearAllQueuedCommandsForReason:(id)a3;
- (void)_clientDidConnectNotification:(id)a3;
- (void)_enqueueCommand:(id)a3 forApplication:(id)a4 withCompletion:(id)a5;
- (void)_enqueueCommand:(id)a3 forUnavailableApplicationWithDisplayID:(id)a4;
- (void)_forwardCommand:(id)a3 completion:(id)a4;
- (void)_handleApplicationConnectionDidInvalidateNotification:(id)a3;
- (void)_handleBroadcastCommandMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCloseApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCreateApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPendingCommandsMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlayerIsPlayingDidChangeNotification:(id)a3;
- (void)_handleRestrictCommandClientsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendCommandMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendPlaybackSessionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendPlaybackSessionMigrateBeginMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendPlaybackSessionMigrateEndMessage:(id)a3 fromClient:(id)a4;
- (void)_handleTriggerAudioFadeMessage:(id)a3 fromClient:(id)a4;
- (void)_performCommandProcessingAfterSend:(id)a3;
- (void)_sendExternalCommand:(id)a3 withCompletionHandler:(id)a4;
- (void)_sendLocalCommand:(id)a3 withCompletionHandler:(id)a4;
- (void)_sendQueuedCommandsForDestinationClient:(id)a3;
- (void)_sendRemoteControlCommand:(id)a3 completion:(id)a4;
- (void)_sendRemoteControlCommand:(id)a3 toDestinationClient:(id)a4 withCompletion:(id)a5;
- (void)_sendRemoteControlCommand:(id)a3 toDestinationClient:(id)a4 withLegacyCompletion:(id)a5;
- (void)_shouldIgnoreCommand:(id)a3 completion:(id)a4;
- (void)broadcastRemoteControlCommand:(id)a3;
- (void)broadcastRemoteControlCommand:(id)a3 completion:(id)a4;
- (void)clearContextsForClient:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)handleClientBoundApplicationConnectionMessage:(id)a3;
- (void)handleInvalidateApplicationConnectionMessage:(id)a3;
- (void)handleServerBoundApplicationConnectionMessage:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)phoneCallObserver:(id)a3 callDidChange:(id)a4;
- (void)registerIncomingApplicationConnection:(id)a3 clientBoundMessageHandler:(id)a4 completion:(id)a5;
- (void)sendRemoteControlCommand:(id)a3;
- (void)sendRemoteControlCommand:(id)a3 completion:(id)a4;
- (void)sendRemoteControlCommand:(id)a3 toClients:(id)a4 completion:(id)a5;
- (void)setCommandClientsRestriction:(id)a3;
@end

@implementation MRDRemoteControlServer

- (MRDRemoteControlServer)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MRDRemoteControlServer;
  v2 = -[MRDRemoteControlServer init](&v25, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaremote.MRDRemoteControlServer", v4);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    commandQueuesForDisplayIDs = v2->_commandQueuesForDisplayIDs;
    v2->_commandQueuesForDisplayIDs = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    remoteControlContexts = v2->_remoteControlContexts;
    v2->_remoteControlContexts = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    redirectionCache = v2->_redirectionCache;
    v2->_redirectionCache = (NSMutableDictionary *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___MRDPhoneCallObserver);
    callObserver = v2->_callObserver;
    v2->_callObserver = v13;

    -[MRDPhoneCallObserver setDelegate:](v2->_callObserver, "setDelegate:", v2);
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.mediaremote.MRDMediaRemoteUIService", v18);
    remoteAlertWorkerQueue = v2->_remoteAlertWorkerQueue;
    v2->_remoteAlertWorkerQueue = (OS_dispatch_queue *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v21 addObserver:v2 selector:"_clientDidConnectNotification:" name:@"MRDMediaRemoteClientDidConnect" object:0];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v22 addObserver:v2 selector:"_handlePlayerIsPlayingDidChangeNotification:" name:kMRMediaRemotePlayerIsPlayingDidChangeNotification object:0];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v23 addObserver:v2 selector:"_handleApplicationConnectionDidInvalidateNotification:" name:@"MRDApplicationConnectionDidInvalidateNotification" object:0];
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  if (notify_is_valid_token(self->_fadeOutNotificationToken)) {
    notify_cancel(self->_fadeOutNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDRemoteControlServer;
  -[MRDRemoteControlServer dealloc](&v4, "dealloc");
}

- (void)sendRemoteControlCommand:(id)a3
{
}

- (void)sendRemoteControlCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, MRCommandResult *))a4;
  if ([v6 isAVRCPCommand])
  {
    if (-[MRDPhoneCallObserver callControllerWillHandleCommandForBargeCalls:]( self->_callObserver,  "callControllerWillHandleCommandForBargeCalls:",  v6))
    {
      v8 = -[MRCommandResult initWithHandlerStatuses:sendError:]( objc_alloc(&OBJC_CLASS___MRCommandResult),  "initWithHandlerStatuses:sendError:",  &off_1003BBA80,  0LL);
      uint64_t v10 = _MRLogForCategory(2LL, v9);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Yielding AVRCP command to bargeCallHandler",  buf,  2u);
      }

      if (v7) {
        v7[2](v7, v8);
      }
    }

    else
    {
      qos_class_t v12 = qos_class_self();
      callObserver = self->_callObserver;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100011CB8;
      v14[3] = &unk_100399790;
      dispatch_queue_attr_t v17 = v7;
      qos_class_t v18 = v12;
      id v15 = v6;
      v16 = self;
      -[MRDPhoneCallObserver handleMediaRemoteCommand:completion:]( callObserver,  "handleMediaRemoteCommand:completion:",  v15,  v14);
    }
  }

  else
  {
    -[MRDRemoteControlServer _sendRemoteControlCommand:completion:]( self,  "_sendRemoteControlCommand:completion:",  v6,  v7);
  }
}

- (void)_sendRemoteControlCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(2LL, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 commandID]);
  qos_class_t v12 = (char *)[v11 hash];

  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v12,  "SendCommandDaemon",  "",  (uint8_t *)&buf,  2u);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000121E8;
  v33[3] = &unk_1003997E0;
  id v13 = v6;
  id v34 = v13;
  v35 = self;
  id v14 = v7;
  id v36 = v14;
  id v15 = objc_retainBlock(v33);
  id v16 = [v13 mutableCopy];
  if (-[MRDRemoteControlServer _isCommandCacheCreating:]( self,  "_isCommandCacheCreating:",  [v13 commandType]))
  {
    qos_class_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlServer _effectiveContextIDForCommand:]( self,  "_effectiveContextIDForCommand:",  v13));
    if (v18)
    {
      uint64_t v19 = _MRLogForCategory(2LL, v17);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Got a cache creating command from assistant, context: %{public}@.",  (uint8_t *)&buf,  0xCu);
      }

      serialQueue = self->_serialQueue;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100012898;
      v31[3] = &unk_100398E60;
      v31[4] = self;
      id v32 = v18;
      msv_dispatch_sync_on_queue(serialQueue, v31);
    }
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  if (-[MRDRemoteControlServer _isCommandCacheable:](self, "_isCommandCacheable:", [v13 commandType]))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlServer _effectiveContextIDForCommand:]( self,  "_effectiveContextIDForCommand:",  v13));
    v23 = v22;
    if (v22)
    {
      v24 = self->_serialQueue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100012A54;
      v25[3] = &unk_100399808;
      v25[4] = self;
      id v26 = v22;
      id v27 = v13;
      id v29 = v14;
      p___int128 buf = &buf;
      id v28 = v16;
      msv_dispatch_sync_on_queue(v24, v25);
    }
  }

  if (!*(_BYTE *)(*((void *)&buf + 1) + 24LL)) {
    -[MRDRemoteControlServer _forwardCommand:completion:](self, "_forwardCommand:completion:", v16, v15);
  }
  _Block_object_dispose(&buf, 8);
}

- (void)broadcastRemoteControlCommand:(id)a3
{
}

- (void)broadcastRemoteControlCommand:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 playerPath]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  unsigned int v9 = [v8 isLocal];

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlServer remoteControlClients](self, "remoteControlClients"));
    -[MRDRemoteControlServer sendRemoteControlCommand:toClients:completion:]( self,  "sendRemoteControlCommand:toClients:completion:",  v11,  v10,  v6);
  }

  else if (v6)
  {
    v6[2](v6, 3LL, 0LL);
  }
}

- (void)sendRemoteControlCommand:(id)a3 toClients:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100012F04;
  v19[3] = &unk_100399858;
  id v20 = a5;
  id v10 = v20;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100012FD0;
  v14[3] = &unk_100399920;
  id v15 = v8;
  id v16 = v9;
  uint64_t v17 = self;
  qos_class_t v18 = objc_retainBlock(v19);
  id v11 = v9;
  qos_class_t v12 = v18;
  id v13 = v8;
  -[MRDRemoteControlServer _shouldIgnoreCommand:completion:](self, "_shouldIgnoreCommand:completion:", v13, v14);
}

- (void)clearContextsForClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000137EC;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (NSArray)remoteControlClients
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allClients]);

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return (NSArray *)v4;
}

- (void)registerIncomingApplicationConnection:(id)a3 clientBoundMessageHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013C64;
  block[3] = &unk_1003999C0;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async_and_wait(serialQueue, block);
}

- (void)handleClientBoundApplicationConnectionMessage:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001400C;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(serialQueue, block);
}

- (void)handleServerBoundApplicationConnectionMessage:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014110;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(serialQueue, block);
}

- (void)handleInvalidateApplicationConnectionMessage:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014214;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(serialQueue, block);
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0x400000000000001uLL:
      -[MRDRemoteControlServer _handleSendCommandMessage:fromClient:]( self,  "_handleSendCommandMessage:fromClient:",  xdict,  v6);
      break;
    case 0x400000000000002uLL:
      -[MRDRemoteControlServer _handleBroadcastCommandMessage:fromClient:]( self,  "_handleBroadcastCommandMessage:fromClient:",  xdict,  v6);
      break;
    case 0x400000000000003uLL:
      -[MRDRemoteControlServer _handlePrewarmMediaControlsCommandMessage:fromClient:]( self,  "_handlePrewarmMediaControlsCommandMessage:fromClient:",  xdict,  v6);
      break;
    case 0x400000000000004uLL:
      -[MRDRemoteControlServer _handlePresentMediaControlsCommandMessage:fromClient:]( self,  "_handlePresentMediaControlsCommandMessage:fromClient:",  xdict,  v6);
      break;
    case 0x400000000000005uLL:
      -[MRDRemoteControlServer _handleDismissMediaControlsCommandMessage:fromClient:]( self,  "_handleDismissMediaControlsCommandMessage:fromClient:",  xdict,  v6);
      break;
    case 0x400000000000006uLL:
      -[MRDRemoteControlServer _handleGetPendingCommandsMessage:fromClient:]( self,  "_handleGetPendingCommandsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x400000000000007uLL:
      -[MRDRemoteControlServer _handleSendPlaybackSessionMessage:fromClient:]( self,  "_handleSendPlaybackSessionMessage:fromClient:",  xdict,  v6);
      break;
    case 0x400000000000008uLL:
      -[MRDRemoteControlServer _handleSendPlaybackSessionMigrateBeginMessage:fromClient:]( self,  "_handleSendPlaybackSessionMigrateBeginMessage:fromClient:",  xdict,  v6);
      break;
    case 0x400000000000009uLL:
      -[MRDRemoteControlServer _handleSendPlaybackSessionMigrateEndMessage:fromClient:]( self,  "_handleSendPlaybackSessionMigrateEndMessage:fromClient:",  xdict,  v6);
      break;
    case 0x40000000000000AuLL:
      -[MRDRemoteControlServer _handleTriggerAudioFadeMessage:fromClient:]( self,  "_handleTriggerAudioFadeMessage:fromClient:",  xdict,  v6);
      break;
    case 0x40000000000000DuLL:
      -[MRDRemoteControlServer _handleRestrictCommandClientsMessage:fromClient:]( self,  "_handleRestrictCommandClientsMessage:fromClient:",  xdict,  v6);
      break;
    case 0x40000000000000EuLL:
      -[MRDRemoteControlServer _handleCreateApplicationConnectionMessage:fromClient:]( self,  "_handleCreateApplicationConnectionMessage:fromClient:",  xdict,  v6);
      break;
    case 0x40000000000000FuLL:
      -[MRDRemoteControlServer _handleSendApplicationConnectionMessage:fromClient:]( self,  "_handleSendApplicationConnectionMessage:fromClient:",  xdict,  v6);
      break;
    case 0x400000000000010uLL:
      -[MRDRemoteControlServer _handleCloseApplicationConnectionMessage:fromClient:]( self,  "_handleCloseApplicationConnectionMessage:fromClient:",  xdict,  v6);
      break;
    default:
      break;
  }
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000144B8;
  block[3] = &unk_100398E60;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)_handleSendCommandMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace(732233772LL, 0LL, 0LL, 0LL, 0LL);
  id v8 = sub_100014700(v6, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v11 = _MRLogForCategory(2LL, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    id v24 = v7;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received command from client %{public}@: %{public}@",  buf,  0x16u);
  }

  uint64_t v14 = _MRLogForCategory(2LL, v13);
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 commandID]);
  uint64_t v17 = (char *)[v16 hash];

  if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v17,  "SendCommandXPCToDaemon",  "",  buf,  2u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100014924;
  v20[3] = &unk_1003999E8;
  id v21 = v6;
  id v22 = v9;
  id v18 = v9;
  id v19 = v6;
  -[MRDRemoteControlServer sendRemoteControlCommand:completion:](self, "sendRemoteControlCommand:completion:", v18, v20);
}

- (void)_handleBroadcastCommandMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100014700(v6, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v11 = _MRLogForCategory(2LL, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received broadcast command from client %{public}@: %{public}@",  buf,  0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100014B84;
  v14[3] = &unk_100399A50;
  id v15 = v6;
  id v13 = v6;
  -[MRDRemoteControlServer broadcastRemoteControlCommand:completion:]( self,  "broadcastRemoteControlCommand:completion:",  v9,  v14);
}

- (void)_handleGetPendingCommandsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage(v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100014D08;
  v11[3] = &unk_100399A78;
  v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue(v8);
  id v9 = v13;
  id v10 = v6;
  sub_10013ADE4(v7, v11);
}

- (void)_handleSendPlaybackSessionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nowPlayingServer]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 queryExistingPlayerPathForXPCMessage:v6 forClient:v7]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 unresolvedPlayerPath]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 client]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v14 launchApplicationTimeoutInterval];
  double v16 = v15;

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 origin]);
  unsigned __int8 v19 = [v18 isLocal];

  if ((v19 & 1) != 0)
  {
    if (v13)
    {
      serialQueue = (dispatch_queue_s *)self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100015268;
      block[3] = &unk_100398E60;
      void block[4] = self;
      id v21 = v13;
      id v31 = v21;
      dispatch_async(serialQueue, block);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000152C8;
      v25[3] = &unk_100399AA0;
      id v26 = v6;
      id v27 = v7;
      id v28 = self;
      id v29 = v21;
      sub_10013C460(v29, 0LL, v25, v16);

      id v22 = v31;
LABEL_8:

      goto LABEL_9;
    }

    sub_10013ADE4(v6, &stru_100399AE0);
  }

  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v10 xpcClient]);

    if (!v23)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_100015224;
      v32[3] = &unk_100399350;
      id v33 = v10;
      sub_10013ADE4(v6, v32);
      id v22 = v33;
      goto LABEL_8;
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v10 xpcClient]);
    [v24 relayXPCMessage:v6 andReply:1];
  }

- (void)_handleSendPlaybackSessionMigrateBeginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingServer]);
  id v14 = (id)objc_claimAutoreleasedReturnValue([v8 queryExistingPlayerPathForXPCMessage:v6 forClient:v5]);

  uint64_t v9 = MRCreateProtobufFromXPCMessage(v6);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 request]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);
  [v5 addPendingPlaybackSessionMigrateEvent:v11 playerPath:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 xpcClient]);
  [v13 relayXPCMessage:v6 andReply:1];
}

- (void)_handleSendPlaybackSessionMigrateEndMessage:(id)a3 fromClient:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nowPlayingServer]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 queryExistingPlayerPathForXPCMessage:v14 forClient:v5]);

  uint64_t v9 = MRCreateProtobufFromXPCMessage(v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 request]);
  unsigned int v12 = [v5 removePendingPlaybackSessionMigrateEvent:v11];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
    [v13 relayXPCMessage:v14 andReply:1];
  }

  else
  {
    sub_10013ADE4(v14, 0LL);
  }
}

- (void)_handleTriggerAudioFadeMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nowPlayingServer]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 queryExistingPlayerPathForXPCMessage:v6 forClient:v7]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 origin]);
  unsigned __int8 v13 = [v12 isLocal];

  if ((v13 & 1) != 0)
  {
    uint64_t v14 = MRCreateProtobufFromXPCMessage(v6);
    double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ([v15 fadeType])
    {
      uint64_t v17 = _MRLogForCategory(0LL, v16);
      __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 client]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);
        *(_DWORD *)__int128 buf = 138477827;
        v46 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Requesting fade in on next playback for client %{private}@",  buf,  0xCu);
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 client]);
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
      [v22 setAttribute:v25 forKey:AVSystemController_AllowAppToFadeInTemporarilyAttribute error:0];

      sub_10013ADE4(v6, &stru_100399BB8);
    }

    else
    {
      objc_initWeak((id *)buf, self);
      id v28 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_100015D28;
      v42[3] = &unk_100399B28;
      objc_copyWeak(&v44, (id *)buf);
      id v29 = v6;
      id v43 = v29;
      id v30 = [v28 initWithTimeout:@"Did not receive fade out notification" reason:v42 handler:1.0];
      serialQueue = (dispatch_queue_s *)self->_serialQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100015DE8;
      handler[3] = &unk_100399B98;
      id v32 = v30;
      id v39 = v32;
      objc_copyWeak(&v41, (id *)buf);
      id v40 = v29;
      notify_register_dispatch( "com.apple.mediaexperience.fadeoutappliedforplaybackhandoff",  &self->_fadeOutNotificationToken,  serialQueue,  handler);
      id v33 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      LODWORD(v29) = [v33 supportMultiplayerHost];

      if ((_DWORD)v29)
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 player]);

        id v36 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v35 audioSessionID]));
        [v36 setAttribute:v37 forKey:AVSystemController_InterruptAudioSessionIDForHandoff error:0];
      }

      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
        [v35 setAttribute:0 forKey:AVSystemController_AppToInterruptCurrentNowPlayingSessionAttribute error:0];
      }

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 xpcClient]);

    if (v26)
    {
      xpc_dictionary_set_uint64(v6, "MRXPC_MESSAGE_ID_KEY", 0x70000000000000AuLL);
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v10 xpcClient]);
      [v27 relayXPCMessage:v6 andReply:1];
    }
  }
}

- (void)_handleRestrictCommandClientsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 entitlements] & 0x800) == 0)
  {
    uint64_t v9 = _MRLogForCategory(0LL, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002B4DFC(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    sub_10013AD7C(v6, 3u);
  }

  __int16 v18 = (void *)MRCreateDataFromXPCMessage(v6, "MRXPC_RESTRICT_COMMANDS_ARRAY_DATA_KEY");
  uint64_t v19 = MRCreateArrayFromData(v18, &stru_100399BF8);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  *(void *)&__int128 v21 = -1LL;
  *((void *)&v21 + 1) = -1LL;
  *(_OWORD *)__int128 buf = v21;
  *(_OWORD *)&uint8_t buf[16] = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 32LL));
  memset(buf, 0, sizeof(buf));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 32LL));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000163A4;
  v43[3] = &unk_100399C20;
  id v24 = v22;
  id v44 = v24;
  id v25 = v23;
  id v45 = v25;
  uint64_t v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "msv_filter:", v43));
  id v27 = (void *)v26;
  id v28 = &__NSArray0__struct;
  if (v26) {
    id v28 = (void *)v26;
  }
  id v29 = v28;

  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v29));
  id v31 = [v30 count];
  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlServer commandClientsRestriction](self, "commandClientsRestriction"));
  if (v31)
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue( +[MRDCommandClientRestriction restrictedTo:by:]( &OBJC_CLASS___MRDCommandClientRestriction,  "restrictedTo:by:",  v30,  v7));
    -[MRDRemoteControlServer setCommandClientsRestriction:](self, "setCommandClientsRestriction:", v33);

    uint64_t v35 = _MRLogForCategory(0LL, v34);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlServer commandClientsRestriction](self, "commandClientsRestriction"));
      *(_DWORD *)__int128 buf = 138412802;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[RestrictedCommandClients Mode] %@ requested to enable restrictions: %@. Previous state: %@",  buf,  0x20u);
    }
  }

  else
  {
    -[MRDRemoteControlServer setCommandClientsRestriction:](self, "setCommandClientsRestriction:", 0LL);
    uint64_t v39 = _MRLogForCategory(0LL, v38);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[RestrictedCommandClients Mode] %@ requested to disable restriction. Previous state: %@",  buf,  0x16u);
    }
  }

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000163F4;
  v41[3] = &unk_100399350;
  id v42 = v30;
  id v40 = v30;
  sub_10013ADE4(v6, v41);
}

- (void)_handleCreateApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MRCreateProtobufFromXPCMessage(v6);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 context]);
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x3032000000LL;
  v19[3] = sub_100012748;
  void v19[4] = sub_100012758;
  id v20 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000165F0;
  block[3] = &unk_100399C68;
  __int16 v18 = v19;
  void block[4] = self;
  id v12 = v10;
  id v16 = v12;
  id v13 = v7;
  id v17 = v13;
  dispatch_async_and_wait(serialQueue, block);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001662C;
  v14[3] = &unk_100399C90;
  void v14[4] = v19;
  sub_10013ADE4(v6, v14);

  _Block_object_dispose(v19, 8);
}

- (void)_handleCloseApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  uint64_t v5 = MRCreateProtobufFromXPCMessage(a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 context]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016750;
  block[3] = &unk_100398F40;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async_and_wait(serialQueue, block);
}

- (void)_handleSendApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MRCreateProtobufFromXPCMessage(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 context]);
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = sub_100012748;
  id v36 = sub_100012758;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_100012748;
  id v30 = sub_100012758;
  id v31 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016A28;
  block[3] = &unk_100399CB8;
  id v25 = &v32;
  void block[4] = self;
  id v12 = v10;
  id v24 = v12;
  dispatch_async_and_wait(serialQueue, block);
  id v14 = (void *)v33[5];
  if (v14)
  {
    id v15 = [v14 type];
    id v16 = (void *)v33[5];
    if (v15 == (id)1) {
      [v16 handleClientBoundMessage:v9];
    }
    else {
      [v16 handleServerBoundMessage:v9];
    }
  }

  else
  {
    uint64_t v17 = _MRLogForCategory(0LL, v13);
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      sub_1002B4E2C(v19, (uint64_t)v38, v18);
    }

    id v20 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 1LL);
    __int128 v21 = (void *)v27[5];
    v27[5] = (uint64_t)v20;
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100016A98;
  v22[3] = &unk_100399C90;
  v22[4] = &v26;
  sub_10013ADE4(v6, v22);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

- (id)_onQueue_createAndActivateConnection:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationPlayerPath]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 nowPlayingServer]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 origin]);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([(id)v10 originClientForOrigin:v11]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationPlayerPath]);
  LOBYTE(v10) = [v12 isResolved];

  if ((v10 & 1) != 0) {
    goto LABEL_7;
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationPlayerPath]);
  unsigned int v14 = [v13 isSystemMediaApplication];

  if (v14)
  {
    id v15 = objc_alloc(&OBJC_CLASS___MRClient);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v35 deviceInfo]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 systemMediaApplication]);
  }

  else
  {
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationPlayerPath]);
    unsigned int v19 = [v18 isSystemPodcastsApplication];

    if (!v19) {
      goto LABEL_7;
    }
    id v15 = objc_alloc(&OBJC_CLASS___MRClient);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v35 deviceInfo]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 systemPodcastApplication]);
  }

  id v20 = (void *)v17;
  __int128 v21 = -[MRClient initWithBundleIdentifier:](v15, "initWithBundleIdentifier:", v17);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationPlayerPath]);
  [v22 setClient:v21];

LABEL_7:
  v23 = objc_alloc(&OBJC_CLASS___MRApplicationConnectionRequestInfo);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceInfo]);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 createNowPlayingClient]);
  id v27 = -[MRApplicationConnectionRequestInfo initWithDeviceInfo:client:](v23, "initWithDeviceInfo:client:", v25, v26);

  uint64_t v28 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( [v35 createNewApplicationConnectionCallback]);
  if (v28)
  {
    id v29 = -[MRDApplicationConnection initWithContext:]( objc_alloc(&OBJC_CLASS___MRDApplicationConnection),  "initWithContext:",  v6);
    objc_initWeak(&location, v7);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100016EB0;
    v40[3] = &unk_100399CE0;
    objc_copyWeak(&v41, &location);
    -[MRDApplicationConnection setClientBoundMessageHandler:](v29, "setClientBoundMessageHandler:", v40);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlServer applicationConnections](self, "applicationConnections"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    [v30 setObject:v29 forKeyedSubscript:v31];

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100016F84;
    v36[3] = &unk_100399D30;
    v36[4] = self;
    id v37 = v6;
    id v38 = v7;
    uint64_t v32 = v29;
    uint64_t v39 = v32;
    ((void (**)(void, MRDApplicationConnection *, MRApplicationConnectionRequestInfo *, void *))v28)[2]( v28,  v32,  v27,  v36);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

    id v33 = 0LL;
  }

  else
  {
    id v33 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 14LL);
  }

  return v33;
}

- (void)_clientDidConnectNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[MRDRemoteControlServer _sendQueuedCommandsForDestinationClient:]( self,  "_sendQueuedCommandsForDestinationClient:",  v4);
}

- (void)_handlePlayerIsPlayingDidChangeNotification:(id)a3
{
  id v14 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if ([v6 isLocal])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey]);
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
      uint64_t v11 = MRGetPlayerPathFromUserInfo();
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      uint64_t v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ started playback",  v12);
      -[MRDRemoteControlServer _clearAllQueuedCommandsForReason:](self, "_clearAllQueuedCommandsForReason:", v13);
    }
  }
}

- (void)_handleApplicationConnectionDidInvalidateNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"MRDApplicationConnectionInvalidationReasonKey"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  uint64_t v10 = _MRLogForCategory(2LL, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    unsigned int v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[MRDRemoteControlServer] applicationConnectionDidInvalidate - connection: %@, reason: %@",  buf,  0x16u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100017428;
  v14[3] = &unk_100398E60;
  void v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  dispatch_async_and_wait(serialQueue, v14);
}

- (void)phoneCallObserver:(id)a3 callDidChange:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000174C4;
  v4[3] = &unk_100399D58;
  v4[4] = self;
  objc_msgSend(a3, "numberOfActivePhoneCalls:", v4, a4);
}

- (void)_forwardCommand:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 playerPath]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  if (([v8 isLocal] & 1) == 0)
  {

    id v11 = v12;
    goto LABEL_5;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v10 = [v9 supportMultiplayerHost];

  id v11 = v12;
  if ((v10 & 1) != 0)
  {
LABEL_5:
    -[MRDRemoteControlServer _sendExternalCommand:withCompletionHandler:]( self,  "_sendExternalCommand:withCompletionHandler:",  v11,  v6);
    goto LABEL_6;
  }

  -[MRDRemoteControlServer _sendLocalCommand:withCompletionHandler:]( self,  "_sendLocalCommand:withCompletionHandler:",  v12,  v6);
LABEL_6:
}

- (void)_sendLocalCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 commandType];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v10 = [v7 mutableCopy];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000176A8;
  v14[3] = &unk_100399D80;
  unsigned int v19 = v8;
  id v15 = v10;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v6;
  id v11 = v6;
  id v12 = v9;
  id v13 = v10;
  -[MRDRemoteControlServer _shouldIgnoreCommand:completion:](self, "_shouldIgnoreCommand:completion:", v13, v14);
}

- (void)_sendExternalCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 playerPath]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 origin]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 clientWithRegisteredCustomOrigin:v10]);
  if (v12)
  {
    -[MRDRemoteControlServer _sendRemoteControlCommand:toDestinationClient:withCompletion:]( self,  "_sendRemoteControlCommand:toDestinationClient:withCompletion:",  v6,  v12,  v7);
  }

  else
  {
    uint64_t v13 = _MRLogForCategory(0LL, v11);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      uint64_t v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "The client that registered the custom origin %{public}@ no longer exists, so this command will be ignored.",  (uint8_t *)&v16,  0xCu);
    }

    if (v7)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MRCommandResult commandResultWithSendError:]( &OBJC_CLASS___MRCommandResult,  "commandResultWithSendError:",  6LL));
      v7[2](v7, v15);
    }
  }
}

- (void)_sendRemoteControlCommand:(id)a3 toDestinationClient:(id)a4 withLegacyCompletion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100017D0C;
  v9[3] = &unk_100399DA8;
  id v10 = a5;
  id v8 = v10;
  -[MRDRemoteControlServer _sendRemoteControlCommand:toDestinationClient:withCompletion:]( self,  "_sendRemoteControlCommand:toDestinationClient:withCompletion:",  a3,  a4,  v9);
}

- (void)_sendRemoteControlCommand:(id)a3 toDestinationClient:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 commandID]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100017F18;
  v28[3] = &unk_100399530;
  id v13 = v10;
  id v29 = v13;
  id v14 = [v11 initWithTimeout:v12 reason:v28 handler:0.0];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100017F6C;
  v25[3] = &unk_100399DD0;
  id v26 = v14;
  id v27 = v13;
  id v15 = v13;
  id v16 = v14;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100017FBC;
  v20[3] = &unk_100399920;
  id v21 = v8;
  id v22 = self;
  id v23 = v9;
  id v24 = objc_retainBlock(v25);
  id v17 = v9;
  id v18 = v24;
  id v19 = v8;
  -[MRDRemoteControlServer _shouldIgnoreCommand:completion:](self, "_shouldIgnoreCommand:completion:", v19, v20);
}

- (void)_enqueueCommand:(id)a3 forApplication:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 _setCompletionHandler:v10];
  -[MRDRemoteControlServer _enqueueCommand:forUnavailableApplicationWithDisplayID:]( self,  "_enqueueCommand:forUnavailableApplicationWithDisplayID:",  v8,  v9);
  uint64_t v12 = _MRLogForCategory(2LL, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    id v36 = v9;
    __int16 v37 = 2114;
    id v38 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Destination app %{public}@ not available for command %{public}@, and command requested a launch. Enqueueing comman d for later execution.",  buf,  0x16u);
  }

  id v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  id v29 = sub_1000191AC;
  id v30 = &unk_100398F18;
  id v31 = self;
  id v32 = v8;
  id v33 = v9;
  id v34 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  id v17 = objc_retainBlock(&v27);
  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 commandID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v19,  kMRMediaRemoteOptionCommandID);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 senderID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v20,  kMRMediaRemoteOptionSenderID);

  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v16 appOptions]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v21,  kMRMediaRemoteOptionSendOptionsNumber);

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v16 commandType]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v22,  kMRMediaRemoteOptionCommandType);

  id v23 = objc_alloc(&OBJC_CLASS___NSString);
  id v24 = (void *)MRMediaRemoteCopyCommandDescription([v16 commandType]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v16 commandID]);
  id v26 = -[NSString initWithFormat:](v23, "initWithFormat:", @"command<%@>=%@", v24, v25, v27, v28, v29, v30, v31);

  sub_10013B180(v15, v26, v18, v17);
}

- (void)_enqueueCommand:(id)a3 forUnavailableApplicationWithDisplayID:(id)a4
{
  id v29 = a4;
  id v5 = a3;
  kdebug_trace(732233804LL, 0LL, 0LL, 0LL, 0LL);
  id v6 = [v5 mutableCopy];
  id v7 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 origin]);
  id v10 = objc_alloc(&OBJC_CLASS___MRClient);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 client]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
  id v14 = -[MRClient initWithBundleIdentifier:](v10, "initWithBundleIdentifier:", v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 unresolvedPlayerPath]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 player]);
  id v17 = -[MRPlayerPath initWithOrigin:client:player:](v7, "initWithOrigin:client:player:", v9, v14, v16);
  [v6 setPlayerPath:v17];

  serialQueue = self->_serialQueue;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100019958;
  v33[3] = &unk_100398F40;
  void v33[4] = self;
  id v19 = v29;
  id v34 = v19;
  id v20 = v6;
  id v35 = v20;
  msv_dispatch_sync_on_queue(serialQueue, v33);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v21 queuedCommandsTimeoutInterval];
  double v23 = v22;

  dispatch_time_t v24 = dispatch_time(0LL, (uint64_t)(v23 * 1000000000.0));
  id v25 = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000199C4;
  block[3] = &unk_100398F40;
  void block[4] = self;
  id v31 = v19;
  id v32 = v20;
  id v26 = v20;
  id v27 = v19;
  dispatch_after(v24, v25, block);
}

- (void)_sendQueuedCommandsForDestinationClient:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = sub_100012748;
  uint64_t v28 = sub_100012758;
  id v29 = 0LL;
  serialQueue = self->_serialQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100019E04;
  v20[3] = &unk_100399DF8;
  id v6 = v4;
  id v21 = v6;
  double v22 = self;
  double v23 = &v24;
  msv_dispatch_sync_on_queue(serialQueue, v20);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = (id)v25[5];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        kdebug_trace(732233808LL, 0LL, 0LL, 0LL, 0LL);
        uint64_t v13 = _MRLogForCategory(2LL, v12);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138543618;
          id v31 = v11;
          __int16 v32 = 2114;
          id v33 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Sending previously queued command %{public}@ to client %{public}@.",  buf,  0x16u);
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 _completionHandler]);
        -[MRDRemoteControlServer _sendRemoteControlCommand:toDestinationClient:withCompletion:]( self,  "_sendRemoteControlCommand:toDestinationClient:withCompletion:",  v11,  v6,  v15);
      }

      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v34 count:16];
    }

    while (v8);
  }

  _Block_object_dispose(&v24, 8);
}

- (BOOL)_clearQueuedCommand:(id)a3 forUnavailableApplicationWithDisplayID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  __int128 v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 1;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100019F68;
  v12[3] = &unk_100399EE8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(serialQueue, v12);
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

- (void)_clearAllQueuedCommandsForReason:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A048;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (id)_enqueuedCommandsForDisplayID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100012748;
  uint64_t v16 = sub_100012758;
  id v17 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A410;
  block[3] = &unk_100399CB8;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_resolvedLocalDeviceDestinationAppDisplayIdentifierForCommand:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 destinationAppDisplayID]);
  if (([v5 isEqualToString:kMRMediaRemoteSystemMediaApplicationDisplayIdentifier] & 1) != 0
    || [v5 isEqualToString:@"com.apple.Fuse"])
  {
    uint64_t v6 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    goto LABEL_4;
  }

  if ([v5 isEqualToString:kMRMediaRemoteSystemPodcastApplicationDisplayIdentifier])
  {
    uint64_t v6 = MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
    goto LABEL_4;
  }

  if ([v5 isEqualToString:kMRMediaRemoteSystemBooksApplicationDisplayIdentifier])
  {
    uint64_t v6 = MRMediaRemoteCopyLocalDeviceSystemBooksApplicationDisplayID();
    goto LABEL_4;
  }

  if ([v4 isContextSensitive])
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[MRDRemoteControlServer _contextuallyAwareDestinationAppDisplayIDForCommand:]( self,  "_contextuallyAwareDestinationAppDisplayIDForCommand:",  v4));
LABEL_4:
    id v7 = (id)v6;
    if (v6) {
      goto LABEL_6;
    }
  }

  id v7 = v5;
LABEL_6:
  if ([v7 isEqualToString:@"com.apple.mediaremoted"])
  {
    id v8 = v5;

    id v7 = v8;
  }

  return v7;
}

- (id)_destinationClientForRemoteControlCommand:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v6 = [v4 destinationAppProcessID];
  uint64_t v7 = objc_claimAutoreleasedReturnValue( -[MRDRemoteControlServer _resolvedLocalDeviceDestinationAppDisplayIdentifierForCommand:]( self,  "_resolvedLocalDeviceDestinationAppDisplayIdentifierForCommand:",  v4));
  id v8 = (void *)v7;
  if ((_DWORD)v6)
  {
    if (!v7
      || (id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 destinationAppDisplayID]),
          unsigned int v10 = [v8 isEqualToString:v9],
          v9,
          v10))
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 clientForPID:v6]);
LABEL_7:
      uint64_t v12 = (void *)v11;
      goto LABEL_8;
    }

- (id)_remoteControlContextForCommand:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_100012748;
  uint64_t v18 = sub_100012758;
  id v19 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contextID]);
  id v6 = v5;
  if (v5)
  {
    serialQueue = self->_serialQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001A868;
    v10[3] = &unk_100399C68;
    id v13 = &v14;
    v10[4] = self;
    id v11 = v5;
    id v12 = v4;
    msv_dispatch_sync_on_queue(serialQueue, v10);
  }

  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)_contextuallyAwareDestinationAppDisplayIDForCommand:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlServer _remoteControlContextForCommand:]( self,  "_remoteControlContextForCommand:",  v4));
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 routedCommands]);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseObjectEnumerator", 0));
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if ([v12 isContextSensitive])
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 routedAppDisplayID]);
            id v9 = [v13 copy];

            goto LABEL_12;
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (void)_shouldIgnoreCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_23;
  }
  unsigned int v8 = [v6 commandType];
  if (!sub_10013A8C4(v8))
  {
LABEL_9:
    unsigned int v12 = 0;
    goto LABEL_10;
  }

  if (![v6 isAVRCPCommand])
  {
    if (sub_10013A8AC(v8))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      unsigned int v12 = [v13 shouldSendCommandsDuringPhoneCall] ^ 1;

      goto LABEL_10;
    }

    goto LABEL_9;
  }

  uint64_t v10 = _MRLogForCategory(0LL, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Command is an AVRCP command: skipping straight to call observer check to determine whether we should ignore the command or not.",  buf,  2u);
  }

  unsigned int v12 = 1;
LABEL_10:
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  if ([v14 supportExpanseMigration])
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRExpanseManager sharedManager](&OBJC_CLASS___MRExpanseManager, "sharedManager"));
    unsigned int v16 = [v15 expanseSessionActive];

    v12 &= ~v16;
  }

  else
  {
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  if (([v17 supportExpanseMigration] & 1) == 0)
  {

LABEL_20:
    if (([v6 alwaysIgnoreDuringCall] | v12) == 1)
    {
      callObserver = self->_callObserver;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10001AD50;
      v24[3] = &unk_100399F38;
      id v26 = v7;
      id v25 = v6;
      -[MRDPhoneCallObserver numberOfActivePhoneCalls:](callObserver, "numberOfActivePhoneCalls:", v24);
    }

    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }

    goto LABEL_23;
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRExpanseManager sharedManager](&OBJC_CLASS___MRExpanseManager, "sharedManager"));
  unsigned int v19 = [v18 expanseSessionHasActiveActivity];

  if (!v19) {
    goto LABEL_20;
  }
  uint64_t v21 = _MRLogForCategory(0LL, v20);
  double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Ignoring command because of active SharePlay activity.",  buf,  2u);
  }

  (*((void (**)(id, uint64_t))v7 + 2))(v7, 1LL);
LABEL_23:
}

- (BOOL)_checkAndMaybeUpdateNowPlayingAppStackPopRateLimitingWithInterval:(double)a3
{
  uint64_t v7 = 0LL;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001AEF0;
  block[3] = &unk_100399F60;
  void block[4] = self;
  void block[5] = &v7;
  *(double *)&block[6] = a3;
  dispatch_sync(serialQueue, block);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_applicationIsRunning:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001B040;
  v8[3] = &unk_100398EC8;
  id v6 = v4;
  id v9 = v6;
  char v10 = &v11;
  msv_dispatch_sync_on_queue(serialQueue, v8);
  LOBYTE(serialQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (id)_createBroadcastCommandResponseFromStatuses:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS____MRSendCommandResultMessageProtobuf);
  id v8 = objc_alloc_init(&OBJC_CLASS____MRNowPlayingPlayerPathProtobuf);
  -[_MRSendCommandResultMessageProtobuf setPlayerPath:](v7, "setPlayerPath:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  char v10 = (void *)objc_claimAutoreleasedReturnValue([v9 protobuf]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MRSendCommandResultMessageProtobuf playerPath](v7, "playerPath"));
  [v11 setOrigin:v10];

  id v12 = objc_alloc_init(&OBJC_CLASS____MRNowPlayingClientProtobuf);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[_MRSendCommandResultMessageProtobuf playerPath](v7, "playerPath"));
  [v13 setClient:v12];

  id v14 = [v6 pid];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[_MRSendCommandResultMessageProtobuf playerPath](v7, "playerPath"));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 client]);
  [v16 setProcessIdentifier:v14];

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[_MRSendCommandResultMessageProtobuf playerPath](v7, "playerPath"));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 client]);
  [v19 setBundleIdentifier:v17];

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v20 = v5;
  id v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      uint64_t v24 = 0LL;
      do
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v24);
        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0) {
          -[_MRSendCommandResultMessageProtobuf addHandlerReturnStatus:]( v7,  "addHandlerReturnStatus:",  objc_msgSend(v25, "intValue", (void)v28));
        }
        uint64_t v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v22);
  }

  return v7;
}

- (id)_createBroadcastCommandPlayerPathForClient:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___MRClient);
  id v5 = [v3 pid];

  -[MRClient setProcessIdentifier:](v4, "setProcessIdentifier:", v5);
  id v6 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  id v8 = -[MRPlayerPath initWithOrigin:client:player:](v6, "initWithOrigin:client:player:", v7, v4, 0LL);

  return v8;
}

- (BOOL)_isCommandCacheCreating:(unsigned int)a3
{
  return (a3 - 121 < 0xD) & (0x1013u >> (a3 - 121));
}

- (BOOL)_isCommandCacheable:(unsigned int)a3
{
  BOOL result = 1;
  if (a3 > 0x1A || ((1 << a3) & 0x6000001) == 0) {
    return a3 == 134;
  }
  return result;
}

- (id)_effectiveContextIDForCommand:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 optionValueForKey:kMRMediaRemoteOptionIsRedirectingCommand]);
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) != 0)
  {
    id v6 = 0LL;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 optionValueForKey:kMRMediaRemoteOptionCommandSequenceUUID]);
    if ([v7 length]) {
      id v8 = v7;
    }
    else {
      id v8 = (id)objc_claimAutoreleasedReturnValue([v3 optionValueForKey:kMRMediaRemoteOptionContextID]);
    }
    id v6 = v8;
  }

  return v6;
}

- (id)_resolveCommandBeforeSend:(id)a3 toClient:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 mutableCopy];
  uint64_t v11 = kMRMediaRemoteOptionClientPreferredLanguages;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 optionValueForKey:kMRMediaRemoteOptionClientPreferredLanguages]);

  if (!v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsJoinedByString:@","]);

    [v10 setOptionValue:v14 forKey:v11];
  }

  if ([v8 commandType] == 136)
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlServer _persistPlaybackSessionAndUpdateOptionsForSessionPreloadCommand:forClient:error:]( self,  "_persistPlaybackSessionAndUpdateOptionsForSessionPreloadCommand:forClient:error:",  v10,  v9,  a5));
  }

  else if ([v8 commandType] == 132)
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue( -[MRDRemoteControlServer _populateApplicationSpecificDataForPrepareForSetQueueCommand:forClient:]( self,  "_populateApplicationSpecificDataForPrepareForSetQueueCommand:forClient:",  v10,  v9));
  }

  else if (MRMediaRemoteCommandSupportsAttribution([v8 commandType]))
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[MRDRemoteControlServer _attributedCommand:forClient:](self, "_attributedCommand:forClient:", v10, v9));
  }

  else
  {
    id v15 = v8;
  }

  unsigned int v16 = v15;

  return v16;
}

- (void)_performCommandProcessingAfterSend:(id)a3
{
  id v4 = a3;
  if ([v4 commandType] == 136) {
    -[MRDRemoteControlServer _cleanUpPersistedSessionForSessionPreloadCommand:]( self,  "_cleanUpPersistedSessionForSessionPreloadCommand:",  v4);
  }
}

- (id)_populateApplicationSpecificDataForPrepareForSetQueueCommand:(id)a3 forClient:(id)a4
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 optionValueForKey:kMRMediaRemoteOptionPrepareForSetQueueIsProactive]);
  unsigned __int8 v6 = [v5 BOOLValue];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 optionValueForKey:kMRMediaRemoteOptionPrepareForSetQueueProactiveReason]);
  if ((v6 & 1) == 0)
  {
    uint64_t v24 = _MRLogForCategory(0LL, v7);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v64 = v4;
      id v25 = "Not populating PPFSQ command options - command is not proactive - command: %@";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v25, buf, 0xCu);
    }

- (id)_persistPlaybackSessionAndUpdateOptionsForSessionPreloadCommand:(id)a3 forClient:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = kMRMediaRemoteOptionPlaybackSessionData;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 optionValueForKey:kMRMediaRemoteOptionPlaybackSessionData]);
  id v11 = [[MRPlaybackSession alloc] initWithData:v10];
  uint64_t v12 = v11;
  if (v11 && (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]), v13, v13))
  {
    BOOL v14 = NSTemporaryDirectory();
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15));

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v38 = 0LL;
    [v17 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v38];
    id v18 = v38;

    if (v18)
    {
      if (a5)
      {
        id v18 = v18;
        id v19 = 0LL;
        *a5 = v18;
      }

      else
      {
        id v19 = 0LL;
      }
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByAppendingPathComponent:v20]);

      id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 playbackSessionData]);
      id v37 = 0LL;
      [v22 writeToURL:v21 options:1 error:&v37];
      id v18 = v37;

      if (v18)
      {
        id v19 = 0LL;
        if (a5) {
          *a5 = v18;
        }
      }

      else
      {
        if (v8)
        {
          [v8 realToken];
        }

        else
        {
          __int128 v35 = 0u;
          __int128 v36 = 0u;
        }

        uint64_t v23 = APP_SANDBOX_READ;
        id v24 = objc_claimAutoreleasedReturnValue([v21 path]);
        id v25 = [v24 UTF8String];
        v34[0] = v35;
        v34[1] = v36;
        id v26 = (void *)sandbox_extension_issue_file_to_process(v23, v25, SANDBOX_EXTENSION_DEFAULT, v34);

        id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
        free(v26);
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v21 path]);
        [v7 setOptionValue:v28 forKey:kMRMediaRemoteOptionPlaybackSessionFilePath];

        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        [v7 setOptionValue:v29 forKey:kMRMediaRemoteOptionPlaybackSessionIdentifier];

        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v12 type]);
        [v7 setOptionValue:v30 forKey:kMRMediaRemoteOptionPlaybackSessionType];

        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v12 revision]);
        [v7 setOptionValue:v31 forKey:kMRMediaRemoteOptionPlaybackSessionRevision];

        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
        [v7 setOptionValue:v32 forKey:kMRMediaRemoteOptionPlaybackSessionMetadata];

        [v7 setOptionValue:0 forKey:v9];
        [v7 setOptionValue:v27 forKey:kMRMediaRemoteOptionSandboxExtensionToken];
        id v19 = [v7 copy];
      }
    }
  }

  else
  {
    id v19 = 0LL;
    if (a5) {
      *a5 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 2LL);
    }
  }

  return v19;
}

- (void)_cleanUpPersistedSessionForSessionPreloadCommand:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 optionValueForKey:kMRMediaRemoteOptionPlaybackSessionFilePath]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v4 removeItemAtURL:v3 error:0];
}

- (id)_onQueue_presentDialogWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(&OBJC_CLASS___MSVSystemDialogOptions);
  [v17 setAlertHeader:v16];

  [v17 setAlertMessage:v15];
  [v17 setDefaultButtonTitle:v14];

  [v17 setAlternateButtonTitle:v13];
  [v17 setShowAsTopmost:1];
  [v17 setForceModalAlertAppearance:1];
  [v17 setShowOnLockscreen:1];
  [v17 setDismissOverlaysOnLockscreen:0];
  id v18 = -[MSVSystemDialog initWithOptions:](objc_alloc(&OBJC_CLASS___MSVSystemDialog), "initWithOptions:", v17);
  -[MSVSystemDialog dismiss](self->_remoteControlDialog, "dismiss");
  objc_storeStrong((id *)&self->_remoteControlDialog, v18);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001C1F4;
  v24[3] = &unk_100399F10;
  id v19 = v18;
  id v25 = v19;
  id v26 = v12;
  id v20 = v12;
  dispatch_async(&_dispatch_main_q, v24);
  id v21 = v26;
  id v22 = v19;

  return v22;
}

- (id)_attributedCommand:(id)a3 forClient:(id)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nowPlayingServer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 queryExistingPlayerPath:v7]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 originClient]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceInfo]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 buildVersion]);
  unsigned int v12 = [v11 hasPrefix:@"21J"];

  if (v12) {
    goto LABEL_13;
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 client]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
  int IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication(v15);

  if (!IsSystemMediaApplication) {
    goto LABEL_13;
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kMRMediaRemoteOptionOriginatedFromRemoteDevice]);
  unsigned int v19 = [v18 BOOLValue];

  if (v19)
  {
    uint64_t v20 = kMRMediaRemoteOptionApplicationUserIdentity;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 optionValueForKey:kMRMediaRemoteOptionApplicationUserIdentity]);
    id v22 = -[MRUserIdentity initWithProtobufData:]( objc_alloc(&OBJC_CLASS___MRUserIdentity),  "initWithProtobufData:",  v21);
    if (v22)
    {
      uint64_t v23 = v22;
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClient]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 participantDataSource]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 donateAttribution:v23]);

      [v4 setOptionValue:v26 forKey:kMRMediaRemoteOptionAssociatedParticipantIdentifier];
      [v4 setOptionValue:0 forKey:v20];
      id v27 = v4;

      goto LABEL_14;
    }

    goto LABEL_12;
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:kMRMediaRemoteOptionHomeKitUserIdentifier]);

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMusicUserStateCenter sharedCenter](&OBJC_CLASS___MRDMusicUserStateCenter, "sharedCenter"));
  __int128 v30 = v29;
  if (v21) {
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v29 identityForHomeUserIdentifier:v21]);
  }
  else {
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v29 localActiveIdentity]);
  }
  __int16 v32 = (void *)v31;

  if (!v32)
  {
LABEL_12:

LABEL_13:
    id v38 = v4;
    goto LABEL_14;
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 origin]);
  unsigned int v35 = [v34 isLocal];

  if (v35)
  {
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[MRPlaybackQueueParticipant expectedIdentifierForUserIdentity:withRandomData:]( &OBJC_CLASS___MRPlaybackQueueParticipant,  "expectedIdentifierForUserIdentity:withRandomData:",  v32,  0LL));
    id v37 = &kMRMediaRemoteOptionAssociatedParticipantIdentifier;
  }

  else
  {
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v32 protobufData]);
    id v37 = &kMRMediaRemoteOptionApplicationUserIdentity;
  }

  [v4 setOptionValue:v36 forKey:*v37];

  id v40 = v4;
LABEL_14:

  return v4;
}

- (NSMutableDictionary)applicationConnections
{
  applicationConnections = self->_applicationConnections;
  if (!applicationConnections)
  {
    id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v5 = self->_applicationConnections;
    self->_applicationConnections = v4;

    applicationConnections = self->_applicationConnections;
  }

  return applicationConnections;
}

- (MRDCommandClientRestriction)commandClientsRestriction
{
  return self->_commandClientsRestriction;
}

- (void)setCommandClientsRestriction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end