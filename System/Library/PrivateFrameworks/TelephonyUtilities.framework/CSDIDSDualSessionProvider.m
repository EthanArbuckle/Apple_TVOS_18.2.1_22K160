@interface CSDIDSDualSessionProvider
- (BOOL)isAudioEnabled;
- (BOOL)shouldUseSocketForTransport;
- (CSDIDSDualSessionProvider)initWithSession:(id)a3 queue:(id)a4;
- (CSDIDSDualSessionProviderDelegate)delegate;
- (IDSSession)session;
- (NSString)UUID;
- (NSString)description;
- (NSString)destination;
- (int)socket;
- (int64_t)invitationTimeout;
- (unint64_t)initialLinkType;
- (unsigned)endedReason;
- (void)acceptInvitationWithData:(id)a3;
- (void)cancelInvitationWithData:(id)a3;
- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3;
- (void)declineInvitationWithData:(id)a3;
- (void)end;
- (void)reconnectSession;
- (void)sendData:(id)a3;
- (void)sendData:(id)a3 toDestinations:(id)a4;
- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4;
- (void)session:(id)a3 didReceiveReport:(id)a4;
- (void)session:(id)a3 invitationSentToTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5;
- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5;
- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5;
- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5;
- (void)session:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5;
- (void)sessionEnded:(id)a3;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionStarted:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInvitationTimeout:(int64_t)a3;
- (void)setPreferences:(id)a3;
- (void)setStreamPreferences:(id)a3;
@end

@implementation CSDIDSDualSessionProvider

- (CSDIDSDualSessionProvider)initWithSession:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSDIDSDualSessionProvider;
  v9 = -[CSDIDSDualSessionProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    -[IDSSession setDelegate:queue:](v10->_session, "setDelegate:queue:", v10, v8);
  }

  return v10;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (unsigned)endedReason
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  unsigned int v3 = [v2 sessionEndedReason];

  return v3;
}

- (NSString)UUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sessionID]);

  return (NSString *)v3;
}

- (BOOL)shouldUseSocketForTransport
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  unsigned __int8 v3 = [v2 shouldUseSocketForTransport];

  return v3;
}

- (int)socket
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  int v3 = [v2 socket];

  return v3;
}

- (NSString)destination
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 destination]);

  return (NSString *)v3;
}

- (unint64_t)initialLinkType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  id v3 = [v2 initialLinkType];

  return (unint64_t)v3;
}

- (BOOL)isAudioEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  unsigned __int8 v3 = [v2 isAudioEnabled];

  return v3;
}

- (void)setAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v4 setIsAudioEnabled:v3];
}

- (int64_t)invitationTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  id v3 = [v2 invitationTimeOut];

  return (int64_t)v3;
}

- (void)setInvitationTimeout:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v4 setInvitationTimeOut:a3];
}

- (void)setPreferences:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "preferences: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v7 setPreferences:v4];
}

- (void)setStreamPreferences:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "streamPreferences: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v7 setStreamPreferences:v4];
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v5 sendSessionMessage:v4];
}

- (void)sendData:(id)a3 toDestinations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v8 sendSessionMessage:v7 toDestinations:v6];
}

- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v7 sendInvitationWithData:v6 declineOnError:v4];
}

- (void)acceptInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v5 acceptInvitationWithData:v4];
}

- (void)cancelInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v5 cancelInvitationWithData:v4];
}

- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v4 cancelInvitationWithRemoteEndedReasonOverride:v3];
}

- (void)declineInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v5 declineInvitationWithData:v4];
}

- (void)reconnectSession
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v2 reconnectSession];
}

- (void)end
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider session](self, "session"));
  [v2 endSession];
}

- (void)sessionStarted:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider delegate](self, "delegate", a3));
  [v4 sessionProviderStarted:self];
}

- (void)sessionEnded:(id)a3
{
}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
}

- (void)session:(id)a3 didReceiveReport:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);

  v10 = -[NSUUID initWithUUIDString:](v7, "initWithUUIDString:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
  [v9 idsReportsReceived:v5 forSessionWithUUID:v10];
}

- (void)session:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider delegate](self, "delegate"));
  [v9 sessionProvider:self receivedSessionMessageFromID:v8 withData:v7];
}

- (void)session:(id)a3 invitationSentToTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider delegate](self, "delegate"));
  [v8 sessionProvider:self invitationSentToPushTokens:v7 shouldBreakBeforeMake:v5];
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider delegate](self, "delegate"));
  [v8 sessionProvider:self endedWithReason:v5 error:v7];
}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider delegate](self, "delegate"));
  [v9 sessionProvider:self receivedInvitationAcceptFromID:v8 withData:v7];
}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider delegate](self, "delegate"));
  [v9 sessionProvider:self receivedInvitationCancelFromID:v8 withData:v7];
}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSDualSessionProvider delegate](self, "delegate"));
  [v9 sessionProvider:self receivedInvitationDeclineFromID:v8 withData:v7];
}

- (CSDIDSDualSessionProviderDelegate)delegate
{
  return (CSDIDSDualSessionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (IDSSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
}

@end