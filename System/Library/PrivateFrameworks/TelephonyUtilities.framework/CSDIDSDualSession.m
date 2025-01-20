@interface CSDIDSDualSession
- (BOOL)hasConnected;
- (BOOL)hasStartedConnecting;
- (BOOL)isInitiator;
- (CSDIDSDualSession)init;
- (CSDIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5;
- (CSDIDSDualSessionDelegate)delegate;
- (CSDIDSDualSessionProvider)sessionProvider;
- (CSDIDSTransport)transport;
- (NSNumber)remoteProtocolVersionNumber;
- (double)invitationTimeout;
- (id)initAsInitiatorWithSessionProvider:(id)a3;
- (id)initAsReceiverWithSessionProvider:(id)a3 remoteProtocolVersion:(int)a4;
- (id)propertiesDescription;
- (int)endedReason;
- (int)remoteProtocolVersion;
- (int)state;
- (int64_t)underlyingErrorCode;
- (void)_acceptInvitationWithData:(id)a3 alwaysSendData:(BOOL)a4;
- (void)_cancelInvitationWithData:(id)a3 reason:(int)a4 alwaysSendData:(BOOL)a5;
- (void)_declineInvitationWithData:(id)a3 alwaysSendData:(BOOL)a4;
- (void)_sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4 alwaysSendData:(BOOL)a5;
- (void)acceptInvitation;
- (void)cancelInvitation;
- (void)declineInvitation;
- (void)end;
- (void)reconnectSession;
- (void)sendData:(id)a3;
- (void)sendInvitation;
- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5;
- (void)sessionProvider:(id)a3 invitationSentToPushTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5;
- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5;
- (void)sessionProviderStarted:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndedReason:(int)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setHasStartedConnecting:(BOOL)a3;
- (void)setInvitationTimeout:(double)a3;
- (void)setReceiverProtocolVersion:(int)a3;
- (void)setRemoteProtocolVersionNumber:(id)a3;
- (void)setState:(int)a3;
@end

@implementation CSDIDSDualSession

- (CSDIDSDualSession)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CSDIDSDualSession.m",  31,  @"%s is not available. Use a designated initializer instead.",  "-[CSDIDSDualSession init]");

  return 0LL;
}

- (CSDIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSDIDSDualSession;
  v11 = -[CSDIDSSession initWithSessionProvider:](&v15, "initWithSessionProvider:", v9);
  v12 = v11;
  if (v11)
  {
    v11->_state = 1;
    p_sessionProvider = (id *)&v11->_sessionProvider;
    objc_storeStrong((id *)&v11->_sessionProvider, a3);
    [*p_sessionProvider setDelegate:v12];
    [*p_sessionProvider setAudioEnabled:0];
    v12->_initiator = a4;
    objc_storeStrong((id *)&v12->_remoteProtocolVersionNumber, a5);
  }

  return v12;
}

- (id)initAsInitiatorWithSessionProvider:(id)a3
{
  return -[CSDIDSDualSession initWithSessionProvider:isInitiator:remoteProtocolVersion:]( self,  "initWithSessionProvider:isInitiator:remoteProtocolVersion:",  a3,  1LL,  0LL);
}

- (id)initAsReceiverWithSessionProvider:(id)a3 remoteProtocolVersion:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  v8 = -[CSDIDSDualSession initWithSessionProvider:isInitiator:remoteProtocolVersion:]( self,  "initWithSessionProvider:isInitiator:remoteProtocolVersion:",  v6,  0LL,  v7);

  return v8;
}

- (id)propertiesDescription
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CSDIDSDualSession;
  v3 = -[CSDIDSSession propertiesDescription](&v10, "propertiesDescription");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v5 = -[CSDIDSDualSession isInitiator](self, "isInitiator");
  uint64_t v6 = -[CSDIDSDualSession state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession remoteProtocolVersionNumber](self, "remoteProtocolVersionNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ isInitiator=%d state=%d remoteProtocolVersion=%@>",  v4,  v5,  v6,  v7));

  return v8;
}

- (int64_t)underlyingErrorCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
  int64_t v3 = [v2 endedReason];

  return v3;
}

- (int)remoteProtocolVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession remoteProtocolVersionNumber](self, "remoteProtocolVersionNumber"));
  int v3 = [v2 intValue];

  return v3;
}

- (void)setState:(int)a3
{
  if (self->_state < a3)
  {
    self->_state = a3;
    if (a3 == 3)
    {
      -[CSDIDSDualSession setHasStartedConnecting:](self, "setHasStartedConnecting:", 1LL);
      -[CSDIDSDualSession setHasConnected:](self, "setHasConnected:", 1LL);
    }

    else if (a3 == 2)
    {
      -[CSDIDSDualSession setHasStartedConnecting:](self, "setHasStartedConnecting:", 1LL);
    }

    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 postNotificationName:@"CSDIDSDualSessionStateChangedNotification" object:self];
  }

- (void)setReceiverProtocolVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[CSDIDSDualSession isInitiator](self, "isInitiator")
    && (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession remoteProtocolVersionNumber](self, "remoteProtocolVersionNumber")),
        v5,
        !v5))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
    -[CSDIDSDualSession setRemoteProtocolVersionNumber:](self, "setRemoteProtocolVersionNumber:");
  }

  else
  {
    id v6 = sub_1001704C4();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = !-[CSDIDSDualSession isInitiator](self, "isInitiator");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession remoteProtocolVersionNumber](self, "remoteProtocolVersionNumber"));
      *(_DWORD *)buf = 138412802;
      v12 = self;
      __int16 v13 = 1024;
      unsigned int v14 = v8;
      __int16 v15 = 1024;
      BOOL v16 = v9 != 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] called for session %@ that was not the initiator (%d) or that already had a version set (%d)",  buf,  0x18u);
    }
  }

- (CSDIDSTransport)transport
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
  unsigned int v4 = [v3 shouldUseSocketForTransport];

  unsigned int v5 = objc_alloc(&OBJC_CLASS___CSDIDSTransport);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
  v7 = v6;
  if (v4)
  {
    unsigned int v8 = -[CSDIDSTransport initWithSocket:](v5, "initWithSocket:", [v6 socket]);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 destination]);
    unsigned int v8 = -[CSDIDSTransport initWithDestination:](v5, "initWithDestination:", v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
  -[CSDIDSTransport setInitialLinkType:](v8, "setInitialLinkType:", [v10 initialLinkType]);

  return v8;
}

- (double)invitationTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
  double v3 = (double)(uint64_t)[v2 invitationTimeout];

  return v3;
}

- (void)setInvitationTimeout:(double)a3
{
  uint64_t v3 = (uint64_t)a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
  [v4 setInvitationTimeout:v3];
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    __int16 v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sendData self: %@", (uint8_t *)&v12, 0xCu);
  }

  unsigned int v7 = -[CSDIDSDualSession state](self, "state");
  if (v7 - 1 < 3)
  {
    id v8 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      __int16 v13 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Session %@ is connected. Sending data",  (uint8_t *)&v12,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
    [v10 sendData:v4];
LABEL_10:

    goto LABEL_11;
  }

  if (v7 - 4 < 2)
  {
    id v11 = sub_1001704C4();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      __int16 v13 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "Session %@ is ending/ended. Dropping data on the floor",  (uint8_t *)&v12,  0xCu);
    }

    goto LABEL_10;
  }

- (void)sendInvitation
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sendInvitation self: %@", (uint8_t *)&v5, 0xCu);
  }

  -[CSDIDSDualSession _sendInvitationWithData:declineOnError:alwaysSendData:]( self,  "_sendInvitationWithData:declineOnError:alwaysSendData:",  0LL,  0LL,  0LL);
}

- (void)_sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4 alwaysSendData:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  unsigned int v9 = -[CSDIDSDualSession state](self, "state");
  if (v9 - 2 >= 4)
  {
    if (v9 == 1)
    {
      id v10 = sub_1001704C4();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        BOOL v16 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Session %@ is waiting. Sending invitation",  (uint8_t *)&v15,  0xCu);
      }

      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
      [v12 sendInvitationWithData:v8 declineOnError:v6];
    }
  }

  else if (v8 && v5)
  {
    -[CSDIDSDualSession sendData:](self, "sendData:", v8);
  }

  else
  {
    id v13 = sub_1001704C4();
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      BOOL v16 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Session %@ is not waiting. Not sending invitation",  (uint8_t *)&v15,  0xCu);
    }
  }
}

- (void)acceptInvitation
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    BOOL v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "acceptInvitation self: %@",  (uint8_t *)&v5,  0xCu);
  }

  -[CSDIDSDualSession _acceptInvitationWithData:alwaysSendData:]( self,  "_acceptInvitationWithData:alwaysSendData:",  0LL,  0LL);
}

- (void)_acceptInvitationWithData:(id)a3 alwaysSendData:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = -[CSDIDSDualSession state](self, "state");
  if (v7 - 2 >= 4)
  {
    if (v7 == 1)
    {
      id v8 = sub_1001704C4();
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        unsigned int v14 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Session %@ is waiting. Accepting invitation",  (uint8_t *)&v13,  0xCu);
      }

      -[CSDIDSDualSession setState:](self, "setState:", 2LL);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
      [v10 acceptInvitationWithData:v6];
    }
  }

  else if (v6 && v4)
  {
    -[CSDIDSDualSession sendData:](self, "sendData:", v6);
  }

  else
  {
    id v11 = sub_1001704C4();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      unsigned int v14 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Session %@ is not waiting. Not accepting invitation",  (uint8_t *)&v13,  0xCu);
    }
  }
}

- (void)cancelInvitation
{
  id v3 = sub_1001704C4();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "cancelInvitation self: %@",  (uint8_t *)&v5,  0xCu);
  }

  -[CSDIDSDualSession _cancelInvitationWithData:reason:alwaysSendData:]( self,  "_cancelInvitationWithData:reason:alwaysSendData:",  0LL,  0LL,  0LL);
}

- (void)_cancelInvitationWithData:(id)a3 reason:(int)a4 alwaysSendData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  unsigned int v9 = -[CSDIDSDualSession state](self, "state");
  if (v9 - 2 >= 4)
  {
    if (v9 != 1) {
      goto LABEL_26;
    }
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      v22 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Session %@ is waiting. Canceling invitation",  (uint8_t *)&v21,  0xCu);
    }

    -[CSDIDSDualSession setState:](self, "setState:", 4LL);
    if (v8)
    {
      if (a4)
      {
        id v12 = sub_1001704C4();
        int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] Asked to cancel invitation with non-nil data and a concrete cancel reason, but that combination is unsupported",  (uint8_t *)&v21,  2u);
        }
      }

      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
      int v15 = v14;
      id v16 = v8;
LABEL_14:
      [v14 cancelInvitationWithData:v16];
LABEL_25:

      goto LABEL_26;
    }

    if (a4 == 2)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
      int v15 = v19;
      uint64_t v20 = 30LL;
    }

    else
    {
      if (a4 != 1)
      {
        if (a4) {
          goto LABEL_26;
        }
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
        int v15 = v14;
        id v16 = 0LL;
        goto LABEL_14;
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
      int v15 = v19;
      uint64_t v20 = 29LL;
    }

    [v19 cancelInvitationWithRemoteEndedReasonOverride:v20];
    goto LABEL_25;
  }

  if (v8 && v5)
  {
    -[CSDIDSDualSession sendData:](self, "sendData:", v8);
  }

  else
  {
    id v17 = sub_1001704C4();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      v22 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Session %@ is not waiting. Not canceling invitation",  (uint8_t *)&v21,  0xCu);
    }
  }

- (void)declineInvitation
{
  id v3 = sub_1001704C4();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "declineInvitation self: %@",  (uint8_t *)&v5,  0xCu);
  }

  -[CSDIDSDualSession _declineInvitationWithData:alwaysSendData:]( self,  "_declineInvitationWithData:alwaysSendData:",  0LL,  0LL);
}

- (void)_declineInvitationWithData:(id)a3 alwaysSendData:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = -[CSDIDSDualSession state](self, "state");
  if (v7 - 2 >= 4)
  {
    if (v7 == 1)
    {
      id v8 = sub_1001704C4();
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        unsigned int v14 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Session %@ is waiting. Declining invitation",  (uint8_t *)&v13,  0xCu);
      }

      -[CSDIDSDualSession setState:](self, "setState:", 4LL);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
      [v10 declineInvitationWithData:v6];
    }
  }

  else if (v6 && v4)
  {
    -[CSDIDSDualSession sendData:](self, "sendData:", v6);
  }

  else
  {
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      unsigned int v14 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Session %@ is not waiting. Not declining invitation",  (uint8_t *)&v13,  0xCu);
    }
  }
}

- (void)reconnectSession
{
  id v3 = sub_1001704C4();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    unsigned int v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "reconnectSession self: %@",  (uint8_t *)&v6,  0xCu);
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
  [v5 reconnectSession];
}

- (void)end
{
  id v3 = sub_1001704C4();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    unsigned int v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "end self: %@", (uint8_t *)&v6, 0xCu);
  }

  -[CSDIDSDualSession setState:](self, "setState:", 4LL);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
  [v5 end];
}

- (void)sessionProviderStarted:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v4 shouldUseSocketForTransport];
    unsigned int v8 = [v4 socket];
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 destination]);
    int v11 = 138413058;
    id v12 = self;
    __int16 v13 = 1024;
    unsigned int v14 = v7;
    __int16 v15 = 1024;
    unsigned int v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Session %@ started (shouldUseSocketForTransport: %d socket: %d, destination: %@)",  (uint8_t *)&v11,  0x22u);
  }

  -[CSDIDSDualSession setState:](self, "setState:", 3LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v10, "sessionStarted:") & 1) != 0) {
    [v10 sessionStarted:self];
  }
}

- (void)sessionProvider:(id)a3 invitationSentToPushTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = sub_1001704C4();
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 1024;
    BOOL v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received invitation SENT for session %@ with tokens %@ shouldBreakBeforeMake %d",  (uint8_t *)&v12,  0x1Cu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v10, "session:invitationSentToPushTokens:shouldBreakBeforeMake:") & 1) != 0)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
    [v10 session:self invitationSentToPushTokens:v11 shouldBreakBeforeMake:v5];
  }
}

- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = sub_1001704C4();
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v23 = 138412802;
    *(void *)&v23[4] = self;
    *(_WORD *)&v23[12] = 1024;
    *(_DWORD *)&v23[14] = a4;
    *(_WORD *)&v23[18] = 2112;
    *(void *)&v23[20] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Session %@ ended with reason %d: %@",  v23,  0x1Cu);
  }

  -[CSDIDSDualSession setState:](self, "setState:", 5LL);
  switch(a4)
  {
    case 0u:
    case 0xBu:
      id v15 = sub_1001704C4();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)v23 = 138412546;
      *(void *)&v23[4] = self;
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = a4;
      goto LABEL_15;
    case 1u:
    case 6u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xEu:
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
      id v10 = sub_1001704C4();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1002B4010();
      }
      uint64_t v12 = 6LL;
      goto LABEL_7;
    case 2u:
    case 7u:
    case 0xCu:
      id v14 = sub_1001704C4();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)v23 = 138412546;
      *(void *)&v23[4] = self;
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = a4;
      goto LABEL_11;
    case 3u:
    case 4u:
      id v16 = sub_1001704C4();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v23 = 138412546;
        *(void *)&v23[4] = self;
        *(_WORD *)&v23[12] = 1024;
        *(_DWORD *)&v23[14] = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Session %@ appears to have ended with an unanswered reason: %d",  v23,  0x12u);
      }

      uint64_t v12 = 4LL;
      goto LABEL_7;
    case 5u:
      unsigned int v18 = -[CSDIDSDualSession isInitiator](self, "isInitiator");
      id v19 = sub_1001704C4();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      BOOL v20 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          *(_DWORD *)v23 = 138412546;
          *(void *)&v23[4] = self;
          *(_WORD *)&v23[12] = 1024;
          *(_DWORD *)&v23[14] = 5;
LABEL_15:
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Session %@ appears to have ended with a local hangup reason: %d",  v23,  0x12u);
        }

- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received invitation ACCEPT with data for session %@ from %@",  (uint8_t *)&v12,  0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession delegate](self, "delegate"));
  [v11 session:self receivedInvitationAcceptWithData:v8];
}

- (void)sessionProvider:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received invitation CANCEL with data for session %@ from %@",  (uint8_t *)&v12,  0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession delegate](self, "delegate"));
  [v11 session:self receivedInvitationCancelWithData:v8];
}

- (void)sessionProvider:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received invitation DECLINE with data for session %@ from %@",  (uint8_t *)&v12,  0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession delegate](self, "delegate"));
  [v11 session:self receivedInvitationDeclineWithData:v8];
}

- (void)sessionProvider:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received session MESSAGE for session %@ from %@",  (uint8_t *)&v12,  0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession delegate](self, "delegate"));
  [v11 session:self receivedData:v8];
}

- (CSDIDSDualSessionDelegate)delegate
{
  return (CSDIDSDualSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int)endedReason
{
  return self->_endedReason;
}

- (void)setEndedReason:(int)a3
{
  self->_endedReason = a3;
}

- (BOOL)isInitiator
{
  return self->_initiator;
}

- (int)state
{
  return self->_state;
}

- (BOOL)hasStartedConnecting
{
  return self->_hasStartedConnecting;
}

- (void)setHasStartedConnecting:(BOOL)a3
{
  self->_hasStartedConnecting = a3;
}

- (BOOL)hasConnected
{
  return self->_hasConnected;
}

- (void)setHasConnected:(BOOL)a3
{
  self->_hasConnected = a3;
}

- (NSNumber)remoteProtocolVersionNumber
{
  return self->_remoteProtocolVersionNumber;
}

- (void)setRemoteProtocolVersionNumber:(id)a3
{
}

- (CSDIDSDualSessionProvider)sessionProvider
{
  return self->_sessionProvider;
}

- (void).cxx_destruct
{
}

@end