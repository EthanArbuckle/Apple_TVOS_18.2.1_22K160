@interface CSDRelayCommonController
- (CSDRelayCommonController)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (void)handlePlayDTMFToneForKeyMessage:(id)a3;
- (void)handleRequestActionMessage:(id)a3;
- (void)handleRequestedAnswerMessage:(id)a3 withBehavior:(int64_t)a4;
- (void)handleSetTTYTypeMessage:(id)a3;
- (void)handleSetUplinkMutedMessage:(id)a3;
- (void)handleSuppressRingtoneMessage:(id)a3;
- (void)handleUpdateSystemVolumeMessageFromHost:(id)a3;
@end

@implementation CSDRelayCommonController

- (CSDRelayCommonController)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDRelayCommonController;
  v6 = -[CSDRelayCommonController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 callWithUniqueProxyIdentifier:v3]);

  return v5;
}

- (void)handleRequestedAnswerMessage:(id)a3 withBehavior:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc(&OBJC_CLASS___TUAnswerRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueProxyIdentifier]);
  id v11 = [v6 initWithUniqueProxyIdentifier:v7];

  [v11 setBehavior:a4];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceIdentifier]);
  [v11 setSourceIdentifier:v8];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v5 endpointIDSDestination]);
  [v11 setEndpointIDSDestination:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  [v10 answerWithRequest:v11];
}

- (void)handlePlayDTMFToneForKeyMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCommonController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    id v7 = [v4 DTMFKey];
    else {
      [v6 playLocalDTMFToneForKey:v7];
    }
  }

  else
  {
    id v8 = sub_1001704C4();
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v12 = 138412546;
      v13 = v10;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v12,  0x16u);
    }
  }
}

- (void)handleSetTTYTypeMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 callWithUniqueProxyIdentifier:v6]);

  if (v7)
  {
    objc_msgSend(v7, "setTtyType:", objc_msgSend(v4, "ttyType"));
  }

  else
  {
    id v8 = sub_1001704C4();
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v12 = 138412546;
      v13 = v10;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v12,  0x16u);
    }
  }
}

- (void)handleSetUplinkMutedMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 callWithUniqueProxyIdentifier:v6]);

  if (v7)
  {
    objc_msgSend(v7, "setUplinkMuted:", objc_msgSend(v4, "isUplinkMuted"));
  }

  else
  {
    id v8 = sub_1001704C4();
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v12 = 138412546;
      v13 = v10;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v12,  0x16u);
    }
  }
}

- (void)handleSuppressRingtoneMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCommonController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    [v6 suppressRingtoneDueToRemoteSuppression];
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      int v12 = v9;
      __int16 v13 = 2112;
      __int16 v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleUpdateSystemVolumeMessageFromHost:(id)a3
{
  id v7 = a3;
  if ([v7 hasSystemVolume])
  {
    [v7 systemVolume];
    int v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sharedAudioSystemController]( &OBJC_CLASS___TUAudioSystemController,  "sharedAudioSystemController"));
    LODWORD(v6) = v4;
    [v5 setActiveCategoryVolume:v6];
  }
}

- (void)handleRequestActionMessage:(id)a3
{
  id v4 = a3;
  int v5 = [v4 requestActionType];
  if (v5 > 35)
  {
    if (v5 == 36)
    {
      double v6 = self;
      id v7 = v4;
      uint64_t v8 = 2LL;
      goto LABEL_10;
    }

    if (v5 == 46)
    {
      double v6 = self;
      id v7 = v4;
      uint64_t v8 = 4LL;
      goto LABEL_10;
    }
  }

  else
  {
    if (v5 == 19)
    {
      double v6 = self;
      id v7 = v4;
      uint64_t v8 = 0LL;
      goto LABEL_10;
    }

    if (v5 == 20)
    {
      double v6 = self;
      id v7 = v4;
      uint64_t v8 = 1LL;
LABEL_10:
      -[CSDRelayCommonController handleRequestedAnswerMessage:withBehavior:]( v6,  "handleRequestedAnswerMessage:withBehavior:",  v7,  v8);
      goto LABEL_14;
    }
  }

  id v9 = sub_1001704C4();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring received request action message because it has a request action type we don't know how to handle: %@",  (uint8_t *)&v11,  0xCu);
  }

LABEL_14:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end