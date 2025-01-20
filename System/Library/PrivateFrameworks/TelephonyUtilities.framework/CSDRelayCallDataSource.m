@interface CSDRelayCallDataSource
+ (Class)callClass;
- (CSDRelayCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingActiveCalls:(id)a5;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingHeldCalls:(id)a5 andHoldingCalls:(id)a6;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileHoldingActiveCalls:(id)a5;
- (void)dealloc;
- (void)disconnectAllCalls:(id)a3 withReason:(int)a4;
- (void)disconnectCall:(id)a3 whileUngroupingCall:(id)a4;
- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6;
- (void)groupCalls:(id)a3 withCalls:(id)a4;
- (void)handleLocalFrequencyChanged:(id)a3;
- (void)handleLocalMeterLevelChanged:(id)a3;
- (void)handleMutedChanged:(id)a3;
- (void)handleRemoteFrequencyChanged:(id)a3;
- (void)handleRemoteMeterLevelChanged:(id)a3;
- (void)handleSendingAudioChanged:(id)a3;
- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4;
- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4;
@end

@implementation CSDRelayCallDataSource

- (CSDRelayCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CSDRelayCallDataSource;
  v7 = -[CSDCallDataSource initWithCallStateController:queue:](&v17, "initWithCallStateController:queue:", v6, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 queue]);
    id v9 =  +[CSDRelayConferenceInterface sharedInstanceWithQueue:]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstanceWithQueue:",  v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v7 selector:"handleLocalFrequencyChanged:" name:@"CSDRelayConferenceLocalFrequencyChangedNotification" object:0];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v7 selector:"handleRemoteFrequencyChanged:" name:@"CSDRelayConferenceRemoteFrequencyChangedNotification" object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v7 selector:"handleLocalMeterLevelChanged:" name:@"CSDRelayConferenceLocalMeterLevelChangedNotification" object:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v7 selector:"handleRemoteMeterLevelChanged:" name:@"CSDRelayConferenceRemoteMeterLevelChangedNotification" object:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v7 selector:"handleMutedChanged:" name:@"CSDRelayConferenceMutedChangedNotification" object:0];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:v7 selector:"handleSendingAudioChanged:" name:@"CSDRelayConferenceSendingAudioChangedNotification" object:0];
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDRelayCallDataSource;
  -[CSDRelayCallDataSource dealloc](&v4, "dealloc");
}

+ (Class)callClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CSDRelayCall, a2);
}

- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Asked to hold relay calls %@ while unholding relay calls %@",  (uint8_t *)&v12,  0x16u);
  }

  if ([v6 count] && objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 relayMessagingController]);
    [v11 sendSwapCallsMessageToHost];

LABEL_10:
    goto LABEL_11;
  }

  if ([v6 count])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    [v10 hold];
    goto LABEL_10;
  }

  if ([v7 count])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    [v10 unhold];
    goto LABEL_10;
  }

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingActiveCalls:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v49 = v8;
    __int16 v50 = 2112;
    id v51 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Asked to answer relay call %@ while disconnecting active relay calls %@",  buf,  0x16u);
  }

  if ([v8 canBeAnsweredWithRequest:v9])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 callController]);
    if ([v10 count])
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 relayMessagingController]);
      [v15 sendEndActiveAndAnswerCallMessageToHostForCall:v8];

      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v14 callContainer]);
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v16 callsHostedElsewhere]);

      id v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v42;
        while (2)
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v42 != v20) {
              objc_enumerationMutation(v17);
            }
            if ([*(id *)(*((void *)&v41 + 1) + 8 * (void)i) isOnHold])
            {

              __int128 v39 = 0u;
              __int128 v40 = 0u;
              __int128 v37 = 0u;
              __int128 v38 = 0u;
              id v28 = v10;
              id v29 = [v28 countByEnumeratingWithState:&v37 objects:v46 count:16];
              if (v29)
              {
                id v30 = v29;
                uint64_t v31 = *(void *)v38;
                do
                {
                  for (j = 0LL; j != v30; j = (char *)j + 1)
                  {
                    if (*(void *)v38 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) setLocallyDisconnectedWithReasonIfNone:0];
                  }

                  id v30 = [v28 countByEnumeratingWithState:&v37 objects:v46 count:16];
                }

                while (v30);
              }

              [v8 answerWithRequest:v9];
              goto LABEL_33;
            }
          }

          id v19 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      [v8 answerWithRequest:v9];
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v22 = v10;
      id v23 = [v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v34;
        do
        {
          for (k = 0LL; k != v24; k = (char *)k + 1)
          {
            if (*(void *)v34 != v25) {
              objc_enumerationMutation(v22);
            }
            objc_msgSend( *(id *)(*((void *)&v33 + 1) + 8 * (void)k),  "setLocallyDisconnectedWithReasonIfNone:",  0,  (void)v33);
          }

          id v24 = [v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
        }

        while (v24);
      }
    }

    else
    {
      [v8 answerWithRequest:v9];
      id v22 = (id)objc_claimAutoreleasedReturnValue([v13 relayMessagingController]);
      [v22 sendAnswerCallMessageToHostForCall:v8];
    }

LABEL_33:
  }

  else
  {
    id v27 = sub_1001704C4();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to answer call because canBeAnswered is NO: %@",  buf,  0xCu);
    }
  }
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingHeldCalls:(id)a5 andHoldingCalls:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_1001704C4();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Asked to answer relay call %@ while disconnecting held relay calls %@ and holding relay calls %@",  buf,  0x20u);
  }

  if ([v10 canBeAnsweredWithRequest:v11])
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v16 = v12;
    id v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        uint64_t v20 = 0LL;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend( *(id *)(*((void *)&v24 + 1) + 8 * (void)v20),  "setLocallyDisconnectedWithReasonIfNone:",  0,  (void)v24);
          uint64_t v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v18);
    }

    [v10 answerWithRequest:v11];
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 relayMessagingController]);
    [v22 sendEndHeldAndAnswerCallMessageToHostForCall:v10];
  }

  else
  {
    id v23 = sub_1001704C4();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to answer call because canBeAnswered is NO: %@",  buf,  0xCu);
    }
  }
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileHoldingActiveCalls:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Asked to answer relay call %@ while holding relay calls %@",  buf,  0x16u);
  }

  if ([v8 canBeAnsweredWithRequest:v9])
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        id v17 = 0LL;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v17), "setCallStatus:", 2, (void)v21);
          id v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v15);
    }

    [v8 answerWithRequest:v9];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 relayMessagingController]);
    [v19 sendHoldActiveAndAnswerCallMessageToHostForCall:v8];
  }

  else
  {
    id v20 = sub_1001704C4();
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to answer call because canBeAnswered is NO: %@",  buf,  0xCu);
    }
  }
}

- (void)groupCalls:(id)a3 withCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v5;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Asked to group relay calls %@ with relay calls %@",  buf,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  [v9 groupWithOtherCall:v10];

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * (void)v15) setCallStatus:1];
        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v13);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      id v20 = 0LL;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v20), "setCallStatus:", 1, (void)v21);
        id v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v18);
  }
}

- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Asked to ungroup relay call %@ from other relay calls in group %@",  buf,  0x16u);
  }

  [v5 ungroup];
  [v5 setCallStatus:1];
  if ([v6 count] == (id)1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    [v9 setCallGroupUUID:0];
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v14), "setCallStatus:", 2, (void)v15);
        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

- (void)disconnectCall:(id)a3 whileUngroupingCall:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Asked to disconnect relay call %@ while ungrouping relay call %@",  (uint8_t *)&v9,  0x16u);
  }

  [v5 disconnect];
  [v6 setCallGroupUUID:0];
}

- (void)disconnectAllCalls:(id)a3 withReason:(int)a4
{
  id v5 = a3;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to disconnect relay calls %@", buf, 0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * (void)v12),  "setLocallyDisconnectedWithReasonIfNone:",  0,  (void)v16);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  if ([v8 count])
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 relayMessagingController]);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
    [v14 sendDisconnectAllCallsMessageToHostForDisconnectedCall:v15];
  }
}

- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_1001704C4();
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v60 = v10;
    __int16 v61 = 2112;
    id v62 = v11;
    __int16 v63 = 2112;
    id v64 = v12;
    __int16 v65 = 2112;
    id v66 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Asked to disconnect relay calls %@ while holding relay calls %@ and unholding relay calls %@ and ungrouping calls %@",  buf,  0x2Au);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v16 = v10;
  id v17 = [v16 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v52;
    do
    {
      id v20 = 0LL;
      do
      {
        if (*(void *)v52 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v51 + 1) + 8 * (void)v20) setLocallyDisconnectedWithReasonIfNone:0];
        id v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }

    while (v18);
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v21 = v11;
  id v22 = [v21 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v48;
    do
    {
      __int128 v25 = 0LL;
      do
      {
        if (*(void *)v48 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v47 + 1) + 8 * (void)v25) setCallStatus:2];
        __int128 v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }

    while (v23);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v26 = v12;
  id v27 = [v26 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      id v30 = 0LL;
      do
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * (void)v30) setCallStatus:1];
        id v30 = (char *)v30 + 1;
      }

      while (v28 != v30);
      id v28 = [v26 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }

    while (v28);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v31 = v13;
  id v32 = [v31 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v40;
    do
    {
      __int128 v35 = 0LL;
      do
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(v31);
        }
        objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * (void)v35), "setCallGroupUUID:", 0, (void)v39);
        __int128 v35 = (char *)v35 + 1;
      }

      while (v33 != v35);
      id v33 = [v31 countByEnumeratingWithState:&v39 objects:v55 count:16];
    }

    while (v33);
  }

  if ([v16 count])
  {
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 relayMessagingController]);
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
    [v37 sendDisconnectCurrentCallAndActivateHeldMessageToHostForDisconnectedCall:v38];
  }
}

- (void)handleLocalFrequencyChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callController]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 callContainer]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callsHostedElsewhere]);
  -[CSDCallDataSource handleFrequencyDataChanged:inDirection:forCalls:]( self,  "handleFrequencyDataChanged:inDirection:forCalls:",  v10,  2LL,  v9);
}

- (void)handleRemoteFrequencyChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callController]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 callContainer]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callsHostedElsewhere]);
  -[CSDCallDataSource handleFrequencyDataChanged:inDirection:forCalls:]( self,  "handleFrequencyDataChanged:inDirection:forCalls:",  v10,  1LL,  v9);
}

- (void)handleLocalMeterLevelChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v13 = (id)objc_claimAutoreleasedReturnValue([v4 object]);
  [v13 floatValue];
  int v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callController]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callContainer]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 callsHostedElsewhere]);
  LODWORD(v12) = v7;
  -[CSDCallDataSource handleMeterLevelChanged:inDirection:forCalls:]( self,  "handleMeterLevelChanged:inDirection:forCalls:",  2LL,  v11,  v12);
}

- (void)handleRemoteMeterLevelChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v13 = (id)objc_claimAutoreleasedReturnValue([v4 object]);
  [v13 floatValue];
  int v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callController]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callContainer]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 callsHostedElsewhere]);
  LODWORD(v12) = v7;
  -[CSDCallDataSource handleMeterLevelChanged:inDirection:forCalls:]( self,  "handleMeterLevelChanged:inDirection:forCalls:",  1LL,  v11,  v12);
}

- (void)handleMutedChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received notification: %@", buf, 0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController", 0LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callController]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callContainer]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 callsHostedElsewhere]);

  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      __int128 v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) propertiesChanged];
        __int128 v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }
}

- (void)handleSendingAudioChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received notification: %@", buf, 0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSource callStateController](self, "callStateController", 0LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callController]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callContainer]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 callsHostedElsewhere]);

  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      __int128 v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) propertiesChanged];
        __int128 v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }
}

@end