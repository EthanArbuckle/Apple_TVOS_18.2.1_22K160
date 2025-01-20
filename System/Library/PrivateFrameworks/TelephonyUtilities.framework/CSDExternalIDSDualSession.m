@interface CSDExternalIDSDualSession
- (BOOL)receivedInvitationAccept;
- (CSDExternalIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteFromID:(id)a5 remoteProtocolVersion:(id)a6;
- (CSDExternalIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5;
- (NSString)remoteFromID;
- (id)initAsInitiatorWithSessionProvider:(id)a3;
- (id)initAsReceiverWithSessionProvider:(id)a3 remoteFromID:(id)a4 remoteProtocolVersion:(int)a5;
- (unint64_t)initialLinkType;
- (void)acceptInvitationWithData:(id)a3;
- (void)cancelInvitationWithReason:(int)a3;
- (void)sendInvitationWithData:(id)a3;
- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5;
- (void)setReceivedInvitationAccept:(BOOL)a3;
- (void)setRemoteFromID:(id)a3;
@end

@implementation CSDExternalIDSDualSession

- (CSDExternalIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3, a4, a5));
  [v7 handleFailureInMethod:a2 object:self file:@"CSDExternalIDSDualSession.m" lineNumber:29 description:@"Use another initializer instead"];

  return 0LL;
}

- (CSDExternalIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteFromID:(id)a5 remoteProtocolVersion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSDExternalIDSDualSession;
  v11 = -[CSDIDSDualSession initWithSessionProvider:isInitiator:remoteProtocolVersion:]( &v15,  "initWithSessionProvider:isInitiator:remoteProtocolVersion:",  a3,  v7,  a6);
  if (v11)
  {
    v12 = (NSString *)[v10 copy];
    remoteFromID = v11->_remoteFromID;
    v11->_remoteFromID = v12;
  }

  return v11;
}

- (id)initAsReceiverWithSessionProvider:(id)a3 remoteFromID:(id)a4 remoteProtocolVersion:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  v11 = -[CSDExternalIDSDualSession initWithSessionProvider:isInitiator:remoteFromID:remoteProtocolVersion:]( self,  "initWithSessionProvider:isInitiator:remoteFromID:remoteProtocolVersion:",  v9,  0LL,  v8,  v10);

  return v11;
}

- (id)initAsInitiatorWithSessionProvider:(id)a3
{
  return -[CSDExternalIDSDualSession initWithSessionProvider:isInitiator:remoteFromID:remoteProtocolVersion:]( self,  "initWithSessionProvider:isInitiator:remoteFromID:remoteProtocolVersion:",  a3,  1LL,  0LL,  0LL);
}

- (unint64_t)initialLinkType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSession sessionProvider](self, "sessionProvider"));
  id v3 = [v2 initialLinkType];

  return (unint64_t)v3;
}

- (void)sendInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = @"non-nil";
    if (!v4) {
      BOOL v7 = @"nil";
    }
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v8, 0x16u);
  }

  -[CSDIDSDualSession _sendInvitationWithData:declineOnError:alwaysSendData:]( self,  "_sendInvitationWithData:declineOnError:alwaysSendData:",  v4,  0LL,  0LL);
}

- (void)acceptInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = @"non-nil";
    if (!v4) {
      BOOL v7 = @"nil";
    }
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v8, 0x16u);
  }

  -[CSDIDSDualSession _acceptInvitationWithData:alwaysSendData:]( self,  "_acceptInvitationWithData:alwaysSendData:",  v4,  0LL);
}

- (void)cancelInvitationWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    int v8 = self;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "self: %@ reason: %d", (uint8_t *)&v7, 0x12u);
  }

  -[CSDIDSDualSession _cancelInvitationWithData:reason:alwaysSendData:]( self,  "_cancelInvitationWithData:reason:alwaysSendData:",  0LL,  v3,  0LL);
}

- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[CSDExternalIDSDualSession receivedInvitationAccept](self, "receivedInvitationAccept"))
  {
    id v11 = sub_1001704C4();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring invitation accept since we have previously processed one.",  buf,  2u);
    }
  }

  else
  {
    -[CSDExternalIDSDualSession setReceivedInvitationAccept:](self, "setReceivedInvitationAccept:", 1LL);
    -[CSDExternalIDSDualSession setRemoteFromID:](self, "setRemoteFromID:", v9);
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___CSDExternalIDSDualSession;
    -[CSDIDSDualSession sessionProvider:receivedInvitationAcceptFromID:withData:]( &v13,  "sessionProvider:receivedInvitationAcceptFromID:withData:",  v8,  v9,  v10);
  }
}

- (NSString)remoteFromID
{
  return self->_remoteFromID;
}

- (void)setRemoteFromID:(id)a3
{
}

- (BOOL)receivedInvitationAccept
{
  return self->_receivedInvitationAccept;
}

- (void)setReceivedInvitationAccept:(BOOL)a3
{
  self->_receivedInvitationAccept = a3;
}

- (void).cxx_destruct
{
}

@end