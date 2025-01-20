@interface CSDRelayConferenceInterface
+ (CSDRelayConferenceInterface)sharedInstance;
+ (id)sharedInstanceWithQueue:(id)a3;
- (BOOL)isMutedForIdentifier:(id)a3;
- (BOOL)isSendingAudioForIdentifier:(id)a3;
- (CSDAVConference)activeConference;
- (CSDRelayConferenceInterface)initWithSerialQueue:(id)a3;
- (NSMutableArray)conferenceConnections;
- (NSMutableSet)conferencesAwaitingConnectionClose;
- (OS_dispatch_queue)queue;
- (double)closeConnectionTimeout;
- (double)connectionTimeout;
- (double)prepareToStopTimeout;
- (id)_conferenceConnectionsForConference:(id)a3;
- (id)activeConferenceConnectionForIdentifier:(id)a3;
- (id)conferenceConnectionForIdentifier:(id)a3;
- (id)conferenceCreationBlock;
- (int64_t)inputAudioPowerSpectrumTokenForIdentifier:(id)a3;
- (int64_t)outputAudioPowerSpectrumTokenForIdentifier:(id)a3;
- (int64_t)spatialAudioSourceIdentifierForIdentifier:(id)a3;
- (void)_cleanUpAllConferenceConnectionsForConference:(id)a3 withError:(id)a4;
- (void)_cleanUpConferenceConnection:(id)a3 error:(id)a4;
- (void)_postDidCloseNotificationForConference:(id)a3;
- (void)_postDidCloseNotificationForConferenceIfNecessary:(id)a3;
- (void)_prepareConferenceForConferenceConnection:(id)a3 remoteInviteDictionary:(id)a4;
- (void)_stopConference:(id)a3;
- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5;
- (void)conference:(id)a3 endedWithReason:(int64_t)a4 error:(id)a5;
- (void)conference:(id)a3 inputFrequencyLevelChangedTo:(id)a4;
- (void)conference:(id)a3 inputLevelChangedTo:(float)a4;
- (void)conference:(id)a3 outputFrequencyLevelChangedTo:(id)a4;
- (void)conference:(id)a3 outputLevelChangedTo:(float)a4;
- (void)conferenceFinishedPreparing:(id)a3;
- (void)conferenceStarted:(id)a3;
- (void)connectionClosedForConference:(id)a3;
- (void)dealloc;
- (void)mutedChangedForConference:(id)a3;
- (void)prepareConferenceConnection:(id)a3 remoteInviteDictionary:(id)a4 completion:(id)a5;
- (void)prepareConferenceForCall:(id)a3 remoteInviteDictionary:(id)a4 completion:(id)a5;
- (void)prepareToStopConferenceForIdentifier:(id)a3;
- (void)sendData:(id)a3 throughConferenceForIdentifier:(id)a4;
- (void)sendingAudioChangedForConference:(id)a3;
- (void)setCloseConnectionTimeout:(double)a3;
- (void)setConferenceActiveForIdentifier:(id)a3;
- (void)setConferenceConnections:(id)a3;
- (void)setConferenceCreationBlock:(id)a3;
- (void)setConferencesAwaitingConnectionClose:(id)a3;
- (void)setConnectionTimeout:(double)a3;
- (void)setMuted:(BOOL)a3 forIdentifier:(id)a4;
- (void)setPrepareToStopTimeout:(double)a3;
- (void)setQueue:(id)a3;
- (void)setSendingAudio:(BOOL)a3 forIdentifier:(id)a4;
- (void)startConferenceForIdentifier:(id)a3 usingTransport:(id)a4 remoteInviteDictionary:(id)a5 didStartHandler:(id)a6 didStopHandler:(id)a7;
- (void)stopConferenceForIdentifier:(id)a3;
- (void)updateConferenceForIdentifier:(id)a3 isUsingBaseband:(BOOL)a4 disableAudio:(BOOL)a5 isTinCan:(BOOL)a6;
- (void)uplinkMutedStatusChanged:(id)a3;
@end

@implementation CSDRelayConferenceInterface

+ (CSDRelayConferenceInterface)sharedInstance
{
  return (CSDRelayConferenceInterface *)+[CSDRelayConferenceInterface sharedInstanceWithQueue:]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstanceWithQueue:",  &_dispatch_main_q);
}

+ (id)sharedInstanceWithQueue:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B3DA8;
  block[3] = &unk_1003D7730;
  id v8 = a3;
  uint64_t v3 = qword_10044CF78;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10044CF78, block);
  }
  id v5 = (id)qword_10044CF70;

  return v5;
}

- (CSDRelayConferenceInterface)initWithSerialQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSDRelayConferenceInterface;
  v6 = -[CSDRelayConferenceInterface init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    conferenceConnections = v7->_conferenceConnections;
    v7->_conferenceConnections = (NSMutableArray *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    conferencesAwaitingConnectionClose = v7->_conferencesAwaitingConnectionClose;
    v7->_conferencesAwaitingConnectionClose = (NSMutableSet *)v10;

    id conferenceCreationBlock = v7->_conferenceCreationBlock;
    v7->_id conferenceCreationBlock = &stru_1003D9490;

    *(_OWORD *)&v7->_connectionTimeout = xmmword_1003791F0;
    v7->_prepareToStopTimeout = 10.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v7 selector:"uplinkMutedStatusChanged:" name:TUAudioSystemUplinkMuteStatusChangedNotification object:0];
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDRelayConferenceInterface;
  -[CSDRelayConferenceInterface dealloc](&v4, "dealloc");
}

- (void)uplinkMutedStatusChanged:(id)a3
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue", a3));
  dispatch_async(v3, &stru_1003D94B0);
}

- (BOOL)isMutedForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v4));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 conference]);
    unsigned __int8 v8 = [v7 isMuted];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)setMuted:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v6));
  unsigned int v9 = -[CSDRelayConferenceInterface isMutedForIdentifier:](self, "isMutedForIdentifier:", v6);
  if (!v8)
  {
    id v14 = sub_1001704C4();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections"));
      int v16 = 138412546;
      *(void *)v17 = v6;
      *(_WORD *)&v17[8] = 2112;
      *(void *)&v17[10] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] setMuted:forIdentifier: no conference connection found for identifier %@. All conference connections: %@",  (uint8_t *)&v16,  0x16u);
    }

    goto LABEL_8;
  }

  if (v9 != v4)
  {
    id v10 = sub_1001704C4();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109378;
      *(_DWORD *)v17 = v4;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Setting muted to %d for %@",  (uint8_t *)&v16,  0x12u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sharedAudioSystemController]( &OBJC_CLASS___TUAudioSystemController,  "sharedAudioSystemController"));
    [v12 setUplinkMuted:v4];

    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 conference]);
    -[os_log_s setMuted:](v13, "setMuted:", v4);
LABEL_8:
  }
}

- (BOOL)isSendingAudioForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v4));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 conference]);
    unsigned __int8 v8 = [v7 isSendingAudio];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (int64_t)inputAudioPowerSpectrumTokenForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v4));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 conference]);
    id v8 = [v7 inputAudioPowerSpectrumToken];
  }

  else
  {
    id v8 = 0LL;
  }

  return (int64_t)v8;
}

- (int64_t)outputAudioPowerSpectrumTokenForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v4));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 conference]);
    id v8 = [v7 outputAudioPowerSpectrumToken];
  }

  else
  {
    id v8 = 0LL;
  }

  return (int64_t)v8;
}

- (int64_t)spatialAudioSourceIdentifierForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v4));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 conference]);
    id v8 = [v7 callID];
  }

  else
  {
    id v8 = 0LL;
  }

  return (int64_t)v8;
}

- (void)setSendingAudio:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v6));
  unsigned int v9 = v8;
  if (!v8)
  {
    id v15 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections"));
      int v17 = 138412546;
      *(void *)v18 = v6;
      *(_WORD *)&v18[8] = 2112;
      *(void *)&v18[10] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] setSendingAudio:forIdentifier: no conference connection found for identifier %@. All conference connections: %@",  (uint8_t *)&v17,  0x16u);
    }

    goto LABEL_8;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 conference]);
  unsigned int v11 = [v10 isSendingAudio];

  if (v11 != v4)
  {
    id v12 = sub_1001704C4();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67109378;
      *(_DWORD *)v18 = v4;
      *(_WORD *)&v18[4] = 2112;
      *(void *)&v18[6] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Setting sending audio to %d for %@",  (uint8_t *)&v17,  0x12u);
    }

    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 conference]);
    -[os_log_s setSendingAudio:](v14, "setSendingAudio:", v4);
LABEL_8:
  }
}

- (void)prepareConferenceConnection:(id)a3 remoteInviteDictionary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v33 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v40 = v8;
    __int16 v41 = 2112;
    id v42 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Asked to prepare conference connection %@ remoteInviteDictionary %@",  buf,  0x16u);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections"));
  id v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v35;
LABEL_5:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v35 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
      if (([v18 isPreparedToStop] & 1) == 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 conference]);
        unsigned int v20 = [v19 state];

        if (v20 - 2 < 2 || (v20 - 4 <= 1 ? (BOOL v21 = v9 == 0LL) : (BOOL v21 = 1), !v21))
        {
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v18 conference]);
          if (v22) {
            break;
          }
        }
      }

      if (v15 == (id)++v17)
      {
        id v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v15) {
          goto LABEL_5;
        }
        goto LABEL_17;
      }
    }

    v28 = (void *)v22;

    id v29 = sub_1001704C4();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Not preparing a new conference because another conference already exists: %@",  buf,  0xCu);
    }

    [v8 setConference:v28];
    v27 = v33;
    [v8 setDidPrepareHandler:v33];
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections"));
    [v31 addObject:v8];

    if ((int)[v28 state] >= 3)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v28 localInviteDictionary]);
      [v8 invokeDidPrepareIfNecessary:v24];
      goto LABEL_27;
    }
  }

  else
  {
LABEL_17:

    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    v24 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v23));

    if (v24)
    {
      id v25 = sub_1001704C4();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      v27 = v33;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1002B4AD4((uint64_t)v24, v26);
      }
    }

    else
    {
      v27 = v33;
      [v8 setDidPrepareHandler:v33];
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections"));
      [v32 addObject:v8];

      -[CSDRelayConferenceInterface _prepareConferenceForConferenceConnection:remoteInviteDictionary:]( self,  "_prepareConferenceForConferenceConnection:remoteInviteDictionary:",  v8,  v9);
    }

    v28 = 0LL;
LABEL_27:
  }
}

- (void)prepareConferenceForCall:(id)a3 remoteInviteDictionary:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = -[CSDRelayConferenceConnection initWithCall:]( objc_alloc(&OBJC_CLASS___CSDRelayConferenceConnection),  "initWithCall:",  v10);
  -[CSDRelayConferenceInterface prepareConferenceConnection:remoteInviteDictionary:completion:]( self,  "prepareConferenceConnection:remoteInviteDictionary:completion:",  v12,  v9,  v8);
}

- (void)startConferenceForIdentifier:(id)a3 usingTransport:(id)a4 remoteInviteDictionary:(id)a5 didStartHandler:(id)a6 didStopHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (Block_layout *)a6;
  uint64_t v16 = (Block_layout *)a7;
  uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v17);

  id v18 = sub_1001704C4();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 138412290;
    id v38 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Asked to start conference for identifier %@",  (uint8_t *)&v37,  0xCu);
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v12));
  BOOL v21 = v20;
  if (v20)
  {
    [v20 setTransport:v13];
    if (v15) {
      uint64_t v22 = v15;
    }
    else {
      uint64_t v22 = &stru_1003D94F0;
    }
    [v21 setDidStartHandler:v22];
    if (v16) {
      v23 = v16;
    }
    else {
      v23 = &stru_1003D9510;
    }
    [v21 setDidStopHandler:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface activeConference](self, "activeConference"));

    if (v24)
    {
      id v25 = sub_1001704C4();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "We already have an active conference. Invoking this conference connection's didStart immediately",  (uint8_t *)&v37,  2u);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface activeConference](self, "activeConference"));
      [v21 setConference:v27];

      v28 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
      -[CSDRelayConferenceInterface setConferenceActiveForIdentifier:](self, "setConferenceActiveForIdentifier:", v28);

      [v21 invokeDidStartIfNecessary:1 error:0];
    }

    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v21 conference]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 remoteInviteDictionary]);

      if (!v32)
      {
        if (v14)
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v21 conference]);
          [v33 setRemoteInviteDictionary:v14];
        }

        else
        {
          id v34 = [v21 isHost];
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v21 conference]);
          [v33 setCaller:v34];
        }
      }

      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v21 conference]);
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v21 transport]);
      [v35 startConnectionWithTransport:v36];
    }
  }

  else
  {
    id v29 = sub_1001704C4();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1002B4B48((uint64_t)v12, self, v30);
    }
  }
}

- (void)sendData:(id)a3 throughConferenceForIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Asked to send data to conference for identifier %@",  (uint8_t *)&v13,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v6));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 conference]);
  [v12 sendData:v7];
}

- (void)updateConferenceForIdentifier:(id)a3 isUsingBaseband:(BOOL)a4 disableAudio:(BOOL)a5 isTinCan:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138413058;
    id v25 = v10;
    __int16 v26 = 1024;
    *(_DWORD *)v27 = v8;
    *(_WORD *)&v27[4] = 1024;
    *(_DWORD *)&v27[6] = v7;
    __int16 v28 = 1024;
    BOOL v29 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Asked to update conference for identifier %@ with isUsingBaseband=%d disableAudio=%d isTinCan=%d",  (uint8_t *)&v24,  0x1Eu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v10));
  id v15 = v14;
  if (v14)
  {
    [v14 setUsingBaseband:v8];
    [v15 setAudioDisabled:v7];
    unsigned int v16 = [v15 deviceRole];
    id v17 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      id v25 = v10;
      __int16 v26 = 1024;
      *(_DWORD *)v27 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Updating device role for identifier %@ to %d",  (uint8_t *)&v24,  0x12u);
    }

    id v19 = [v15 deviceRole];
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v15 conference]);
    [v20 setDeviceRole:v19];

    -[CSDRelayConferenceInterface setSendingAudio:forIdentifier:]( self,  "setSendingAudio:forIdentifier:",  [v15 isAudioDisabled] ^ 1,  v10);
  }

  else
  {
    id v21 = sub_1001704C4();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections"));
      int v24 = 138412546;
      id v25 = v10;
      __int16 v26 = 2112;
      *(void *)v27 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Did not find conference connection for identifier %@. All conference connections: %@",  (uint8_t *)&v24,  0x16u);
    }
  }
}

- (void)setConferenceActiveForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v4));
  if (v6)
  {
    id v7 = sub_1001704C4();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting conference connection active: %@",  (uint8_t *)&v10,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    -[CSDRelayConferenceInterface updateConferenceForIdentifier:isUsingBaseband:disableAudio:isTinCan:]( self,  "updateConferenceForIdentifier:isUsingBaseband:disableAudio:isTinCan:",  v9,  [v6 isUsingBaseband],  0,  objc_msgSend(v6, "isTinCan"));
  }
}

- (void)prepareToStopConferenceForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Asked to prepare to stop conference for identifier %@",  buf,  0xCu);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface activeConferenceConnectionForIdentifier:]( self,  "activeConferenceConnectionForIdentifier:",  v4));
  id v9 = v8;
  if (v8)
  {
    [v8 setPreparedToStop:1];
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 conference]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface _conferenceConnectionsForConference:]( self,  "_conferenceConnectionsForConference:",  v10));

    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          if (![*(id *)(*((void *)&v24 + 1) + 8 * (void)v15) isPreparedToStop])
          {

            goto LABEL_16;
          }

          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v16 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Pausing audio and setting up timeout for conference connection: %@",  buf,  0xCu);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 conference]);
    [v18 setSendingAudio:0];

    -[CSDRelayConferenceInterface prepareToStopTimeout](self, "prepareToStopTimeout");
    dispatch_time_t v20 = dispatch_time(0LL, (uint64_t)(v19 * 1000000000.0));
    id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000B544C;
    v22[3] = &unk_1003D7758;
    v22[4] = self;
    id v23 = v9;
    dispatch_after(v20, v21, v22);
  }

- (void)stopConferenceForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Asked to stop conference for identifier %@",  (uint8_t *)&v12,  0xCu);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface conferenceConnectionForIdentifier:]( self,  "conferenceConnectionForIdentifier:",  v4));
  if (v8)
  {
    -[CSDRelayConferenceInterface _cleanUpConferenceConnection:error:]( self,  "_cleanUpConferenceConnection:error:",  v8,  0LL);
  }

  else
  {
    id v9 = sub_1001704C4();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections"));
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Did not find conference connection for identifier %@. All conference connections: %@",  (uint8_t *)&v12,  0x16u);
    }
  }
}

- (id)activeConferenceConnectionForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        if ([v11 isEqualToString:v4]
          && ![v10 isPreparedToStop])
        {
          int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 conference]);
          int v13 = [v12 state];

          if (v13 <= 5)
          {
            id v7 = v10;
            goto LABEL_14;
          }
        }

        else
        {
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)conferenceConnectionForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)_conferenceConnectionsForConference:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v13 = (id)objc_claimAutoreleasedReturnValue([v12 conference]);

        if (v13 == v4) {
          [v6 addObject:v12];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  id v14 = [v6 copy];
  return v14;
}

- (CSDAVConference)activeConference
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (([v8 isPreparedToStop] & 1) == 0)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 conference]);
          if ([v9 state] == 4)
          {

LABEL_13:
            id v5 = (id)objc_claimAutoreleasedReturnValue([v8 conference]);
            goto LABEL_14;
          }

          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 conference]);
          unsigned int v11 = [v10 state];

          if (v11 == 5) {
            goto LABEL_13;
          }
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)_prepareConferenceForConferenceConnection:(id)a3 remoteInviteDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceCreationBlock](self, "conferenceCreationBlock"));
  uint64_t v9 = v8[2]();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 setConference:v10];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 conference]);
  [v11 setDelegate:self];

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 conference]);
  [v13 setDelegateQueue:v12];

  -[CSDRelayConferenceInterface connectionTimeout](self, "connectionTimeout");
  double v15 = v14;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 conference]);
  [v16 setConnectionTimeout:v15];

  __int128 v19 = objc_alloc_init(&OBJC_CLASS___CSDAVConferenceConfiguration);
  -[CSDAVConferenceConfiguration setCaller:](v19, "setCaller:", v6 == 0LL);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 capabilities]);
  -[CSDAVConferenceConfiguration setCapabilities:](v19, "setCapabilities:", v17);

  -[CSDAVConferenceConfiguration setRequiresInviteDictionary:](v19, "setRequiresInviteDictionary:", 1LL);
  -[CSDAVConferenceConfiguration setRemoteInviteDictionary:](v19, "setRemoteInviteDictionary:", v6);

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v7 conference]);
  [v18 prepareWithConfiguration:v19];
}

- (void)_cleanUpAllConferenceConnectionsForConference:(id)a3 withError:(id)a4
{
  id v6 = a4;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface _conferenceConnectionsForConference:]( self,  "_conferenceConnectionsForConference:",  a3,  0LL));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      unsigned int v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[CSDRelayConferenceInterface _cleanUpConferenceConnection:error:]( self,  "_cleanUpConferenceConnection:error:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11),  v6);
        unsigned int v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)_cleanUpConferenceConnection:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections"));
  unsigned int v9 = [v8 containsObject:v6];

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface conferenceConnections](self, "conferenceConnections"));
    [v10 removeObject:v6];

    id v11 = sub_1001704C4();
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Cleaning up conference connection %@",  buf,  0xCu);
    }

    [v6 invokeDidPrepareIfNecessary:0];
    NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Conference cleaned up before handling a didStart with error: %@",  v7));
    int v37 = v13;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.telephonyutilities",  1LL,  v14));
    [v6 invokeDidStartIfNecessary:0 error:v15];

    [v6 invokeDidStopIfNecessary:v7 == 0 error:v7];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 conference]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface _conferenceConnectionsForConference:]( self,  "_conferenceConnectionsForConference:",  v16));

    if ([v17 count]
      || (__int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 conference]),
          int v19 = [v18 state],
          v18,
          v19 < 4))
    {
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v20 = v17;
      id v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v21)
      {
        id v22 = v21;
        __int16 v28 = v17;
        id v29 = v7;
        id v30 = v6;
        uint64_t v23 = *(void *)v32;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v32 != v23) {
              objc_enumerationMutation(v20);
            }
            __int128 v25 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
            if ([v25 isPreparedToStop])
            {
              id v26 = sub_1001704C4();
              __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v39 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Also cleaning up conference connection which is already prepared to stop %@",  buf,  0xCu);
              }

              -[CSDRelayConferenceInterface _cleanUpConferenceConnection:error:]( self,  "_cleanUpConferenceConnection:error:",  v25,  0LL);
            }
          }

          id v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }

        while (v22);
        id v7 = v29;
        id v6 = v30;
        __int128 v17 = v28;
      }
    }

    else
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue([v6 conference]);
      -[CSDRelayConferenceInterface _stopConference:](self, "_stopConference:", v20);
    }
  }
}

- (void)_stopConference:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    __int128 v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Calling stop on conference %@",  (uint8_t *)&v11,  0xCu);
  }

  -[__CFString stop](v4, "stop");
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    __int128 v12 = @"CSDRelayConferenceConnectionWillCloseNotification";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 postNotificationName:@"CSDRelayConferenceConnectionWillCloseNotification" object:0];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface conferencesAwaitingConnectionClose]( self,  "conferencesAwaitingConnectionClose"));
  [v10 addObject:v4];
}

- (void)_postDidCloseNotificationForConferenceIfNecessary:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface conferencesAwaitingConnectionClose]( self,  "conferencesAwaitingConnectionClose"));
  unsigned int v5 = [v4 containsObject:v7];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface conferencesAwaitingConnectionClose]( self,  "conferencesAwaitingConnectionClose"));
    [v6 removeObject:v7];

    -[CSDRelayConferenceInterface _postDidCloseNotificationForConference:]( self,  "_postDidCloseNotificationForConference:",  v7);
  }
}

- (void)_postDidCloseNotificationForConference:(id)a3
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = @"CSDRelayConferenceConnectionDidCloseNotification";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v6, 0xCu);
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 postNotificationName:@"CSDRelayConferenceConnectionDidCloseNotification" object:0];
}

- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1001704C4();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  id v26 = @"CSDRelayConferenceConnectionDidReceiveDataNotificationDataKey";
  id v27 = v8;
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  int v19 = v7;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface _conferenceConnectionsForConference:]( self,  "_conferenceConnectionsForConference:",  v7));
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      __int128 v16 = 0LL;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v16);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v18 postNotificationName:@"CSDRelayConferenceConnectionDidReceiveDataNotification" object:v17 userInfo:v11];

        __int128 v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v14);
  }
}

- (void)conferenceFinishedPreparing:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface _conferenceConnectionsForConference:]( self,  "_conferenceConnectionsForConference:",  v4,  0LL));
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      int v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 localInviteDictionary]);
        [v12 invokeDidPrepareIfNecessary:v13];

        int v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v9);
  }
}

- (void)conferenceStarted:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface _conferenceConnectionsForConference:]( self,  "_conferenceConnectionsForConference:",  v4,  0LL));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      int v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) invokeDidStartIfNecessary:1 error:0];
        int v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)conference:(id)a3 endedWithReason:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1001704C4();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v23 = a4;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "reason: %ld error: %@", buf, 0x16u);
  }

  -[CSDRelayConferenceInterface _cleanUpAllConferenceConnectionsForConference:withError:]( self,  "_cleanUpAllConferenceConnectionsForConference:withError:",  v8,  v9);
  if ((unint64_t)a4 <= 7)
  {
    if (((1LL << a4) & 0xFA) != 0)
    {
      id v12 = sub_1001704C4();
      __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1002B4CC0((uint64_t)v9, a4, v13);
      }

      -[CSDRelayConferenceInterface _postDidCloseNotificationForConference:]( self,  "_postDidCloseNotificationForConference:",  v8);
    }

    else
    {
      id v14 = sub_1001704C4();
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Setting up close connection timeout because conference ended reason was normal",  buf,  2u);
      }

      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayConferenceInterface conferencesAwaitingConnectionClose]( self,  "conferencesAwaitingConnectionClose"));
      [v16 addObject:v8];

      -[CSDRelayConferenceInterface closeConnectionTimeout](self, "closeConnectionTimeout");
      dispatch_time_t v18 = dispatch_time(0LL, (uint64_t)(v17 * 1000000000.0));
      int v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayConferenceInterface queue](self, "queue"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000B6B60;
      v20[3] = &unk_1003D7758;
      v20[4] = self;
      id v21 = v8;
      dispatch_after(v18, v19, v20);
    }
  }
}

- (void)connectionClosedForConference:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

  -[CSDRelayConferenceInterface _cleanUpAllConferenceConnectionsForConference:withError:]( self,  "_cleanUpAllConferenceConnectionsForConference:withError:",  v4,  0LL);
  -[CSDRelayConferenceInterface _postDidCloseNotificationForConferenceIfNecessary:]( self,  "_postDidCloseNotificationForConferenceIfNecessary:",  v4);
}

- (void)mutedChangedForConference:(id)a3
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 postNotificationName:@"CSDRelayConferenceMutedChangedNotification" object:0];
}

- (void)sendingAudioChangedForConference:(id)a3
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 postNotificationName:@"CSDRelayConferenceSendingAudioChangedNotification" object:0];
}

- (void)conference:(id)a3 inputFrequencyLevelChangedTo:(id)a4
{
  id v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 postNotificationName:@"CSDRelayConferenceLocalFrequencyChangedNotification" object:v4];
}

- (void)conference:(id)a3 outputFrequencyLevelChangedTo:(id)a4
{
  id v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 postNotificationName:@"CSDRelayConferenceRemoteFrequencyChangedNotification" object:v4];
}

- (void)conference:(id)a3 inputLevelChangedTo:(float)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  *(float *)&double v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v5));
  [v7 postNotificationName:@"CSDRelayConferenceLocalMeterLevelChangedNotification" object:v6];
}

- (void)conference:(id)a3 outputLevelChangedTo:(float)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  *(float *)&double v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v5));
  [v7 postNotificationName:@"CSDRelayConferenceRemoteMeterLevelChangedNotification" object:v6];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)conferenceConnections
{
  return self->_conferenceConnections;
}

- (void)setConferenceConnections:(id)a3
{
}

- (NSMutableSet)conferencesAwaitingConnectionClose
{
  return self->_conferencesAwaitingConnectionClose;
}

- (void)setConferencesAwaitingConnectionClose:(id)a3
{
}

- (id)conferenceCreationBlock
{
  return self->_conferenceCreationBlock;
}

- (void)setConferenceCreationBlock:(id)a3
{
}

- (double)connectionTimeout
{
  return self->_connectionTimeout;
}

- (void)setConnectionTimeout:(double)a3
{
  self->_connectionTimeout = a3;
}

- (double)closeConnectionTimeout
{
  return self->_closeConnectionTimeout;
}

- (void)setCloseConnectionTimeout:(double)a3
{
  self->_closeConnectionTimeout = a3;
}

- (double)prepareToStopTimeout
{
  return self->_prepareToStopTimeout;
}

- (void)setPrepareToStopTimeout:(double)a3
{
  self->_prepareToStopTimeout = a3;
}

- (void).cxx_destruct
{
}

@end