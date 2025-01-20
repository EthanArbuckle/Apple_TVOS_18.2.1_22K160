@interface MRDGroupSessionClient
- (MRDGroupSession)session;
- (MRDGroupSessionClient)initWithConnection:(id)a3 bundleID:(id)a4;
- (MSVBlockGuard)connectTimeoutGuard;
- (NSString)bundleID;
- (NSString)description;
- (NSString)sessionIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)client;
- (id)infoFromGroupSession:(id)a3;
- (id)initialStateFromSession:(id)a3 token:(id)a4;
- (id)transportParticipants:(id)a3 forSession:(id)a4;
- (int64_t)type;
- (void)connectToDiscoveryWithReply:(id)a3;
- (void)connectToSession:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)manager:(id)a3 activeSessionDidChange:(id)a4;
- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4;
- (void)manager:(id)a3 didJoinRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)manager:(id)a3 discoveredSessionsDidChange:(id)a4;
- (void)reevaluatePendingStateFromSession:(id)a3;
- (void)session:(id)a3 approvePendingParticipant:(id)a4 reply:(id)a5;
- (void)session:(id)a3 denyPendingParticipant:(id)a4 reply:(id)a5;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didUpdateMembers:(id)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4;
- (void)session:(id)a3 didUpdateSynchronizedMetadata:(id)a4;
- (void)session:(id)a3 removeAllParticipantsWithReply:(id)a4;
- (void)session:(id)a3 removeParticipant:(id)a4 reply:(id)a5;
- (void)sessionDidEnterLowPowerMode:(id)a3;
- (void)sessionDidExitLowPowerMode:(id)a3;
- (void)setConnectTimeoutGuard:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MRDGroupSessionClient

- (MRDGroupSessionClient)initWithConnection:(id)a3 bundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MRDGroupSessionClient;
  v9 = -[MRDGroupSessionClient init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_bundleID, a4);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 groupSessionServer]);
    v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 messageQueue]);
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("com.apple.MRDGroupSessionClient.queue", v12, v15);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v16;
  }

  return v10;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p bundleID=%@>",  objc_opt_class(self),  self,  self->_bundleID);
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(12LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionClient] <%p> Dealloc.",  buf,  0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDGroupSessionClient;
  -[MRDGroupSessionClient dealloc](&v5, "dealloc");
}

- (id)client
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient connection](self, "connection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000EEC0;
  v6[3] = &unk_100399508;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxyWithErrorHandler:v6]);

  return v4;
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F044;
  block[3] = &unk_100398F40;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)session:(id)a3 didUpdateMembers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F174;
  block[3] = &unk_100398F40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 4)
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000F28C;
    v8[3] = &unk_100398E60;
    id v9 = v6;
    id v10 = self;
    dispatch_async(v7, v8);
  }
}

- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F3E0;
  block[3] = &unk_100398F40;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)session:(id)a3 didUpdateSynchronizedMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F690;
  block[3] = &unk_100398F40;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)sessionDidEnterLowPowerMode:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F784;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sessionDidExitLowPowerMode:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F878;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)manager:(id)a3 discoveredSessionsDidChange:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000F96C;
  v8[3] = &unk_100398E60;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)manager:(id)a3 didJoinRemoteGroupSession:(id)a4
{
  id v5 = a4;
  id v6 = -[MRGroupSessionInfo initWithGroupSession:]( objc_alloc(&OBJC_CLASS___MRGroupSessionInfo),  "initWithGroupSession:",  v5);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FA90;
  block[3] = &unk_100398F40;
  void block[4] = self;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue", a3, a4));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FB60;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
  id v5 = a4;
  id v6 = -[MRGroupSessionInfo initWithGroupSession:]( objc_alloc(&OBJC_CLASS___MRGroupSessionInfo),  "initWithGroupSession:",  v5);

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000FC74;
  v9[3] = &unk_100398E60;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue", a3, a4));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FD3C;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)manager:(id)a3 activeSessionDidChange:(id)a4
{
  id v5 = a4;
  id v6 = -[MRGroupSessionInfo initWithGroupSession:]( objc_alloc(&OBJC_CLASS___MRGroupSessionInfo),  "initWithGroupSession:",  v5);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FE60;
  block[3] = &unk_100398F40;
  void block[4] = self;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

- (void)connectToSession:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  -[MRDGroupSessionClient setType:](self, "setType:", 0LL);
  -[MRDGroupSessionClient setSessionIdentifier:](self, "setSessionIdentifier:", v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 groupSessionServer]);
  v56 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionManager]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v56 session]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 routingServer]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 systemEndpointController]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 activeOutputDeviceUID:0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 originClientForDeviceUID:v14]);
  dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceInfo]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 groupSessionToken]);
  id v55 = [v17 copy];

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v18 nowPlayingServer]);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 originClientForDeviceUID:v6]);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v20 deviceInfo]);

  id v21 = (id)objc_claimAutoreleasedReturnValue([v10 identifier]);
  if (v21 == v6)
  {

    goto LABEL_11;
  }

  v22 = v21;
  unsigned int v23 = [v21 isEqual:v6];

  if (v23)
  {
LABEL_11:
    -[MRDGroupSessionClient setSession:](self, "setSession:", v10);
    [v10 addObserver:self];
    v38 = (void *)objc_claimAutoreleasedReturnValue([v10 joinToken]);
    v39 = (void *)objc_claimAutoreleasedReturnValue( -[MRDGroupSessionClient initialStateFromSession:token:]( self,  "initialStateFromSession:token:",  v10,  v38));

    uint64_t v41 = _MRLogForCategory(12LL, v40);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      sub_1002B48E8((uint64_t)v39, self, v42);
    }

    v7[2](v7, v39, 0LL);
    goto LABEL_14;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v55 sessionIdentifier]);
  if ([v24 isEqualToString:v6])
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v55 sharedSecret]);

    if (v25)
    {
      uint64_t v27 = _MRLogForCategory(12LL, v26);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient sessionIdentifier](self, "sessionIdentifier"));
        *(_DWORD *)buf = 138412290;
        v66 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionClient] Connecting to pending session: %@",  buf,  0xCu);
      }

      [v56 addObserver:self];
      objc_initWeak(&location, self);
      v30 = objc_alloc(&OBJC_CLASS___MSVBlockGuard);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_1000104D8;
      v57[3] = &unk_1003996F8;
      objc_copyWeak(&v61, &location);
      id v58 = v6;
      id v59 = v56;
      id v60 = v10;
      v31 = -[MSVBlockGuard initWithTimeout:interruptionHandler:]( v30,  "initWithTimeout:interruptionHandler:",  v57,  30.0);
      connectTimeoutGuard = self->_connectTimeoutGuard;
      self->_connectTimeoutGuard = v31;

      v33 = (void *)objc_claimAutoreleasedReturnValue( -[MRDGroupSessionClient initialStateFromSession:token:]( self,  "initialStateFromSession:token:",  0LL,  v55));
      uint64_t v35 = _MRLogForCategory(12LL, v34);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient connection](self, "connection"));
        sub_1002B4AA0((uint64_t)v33, v37, (uint64_t)buf, v36);
      }

      v7[2](v7, v33, 0LL);
      objc_destroyWeak(&v61);
      objc_destroyWeak(&location);
      goto LABEL_14;
    }
  }

  else
  {
  }

  if ([v54 hasPlaceholderGroupSession])
  {
    v44 = -[MRGroupSessionToken initWithDeviceInfo:]( objc_alloc(&OBJC_CLASS___MRGroupSessionToken),  "initWithDeviceInfo:",  v54);
    v63[0] = _MRGroupSessionTokenInitialSyncKey;
    v53 = (id *)v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MRGroupSessionToken data](v44, "data"));
    v63[1] = _MRGroupSessionPlaceholderInitialSyncKey;
    v64[0] = v45;
    v64[1] = &__kCFBooleanTrue;
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  2LL));

    uint64_t v48 = _MRLogForCategory(12LL, v47);
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      sub_1002B4980((uint64_t)v46, self, v49);
    }

    v7[2](v7, v46, 0LL);
  }

  else
  {
    uint64_t v50 = _MRLogForCategory(12LL, v43);
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_1002B4A18(self, v51);
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  2LL,  @"Could not find session for provided identifier."));
    ((void (**)(id, void *, void *))v7)[2](v7, 0LL, v52);
  }

- (id)initialStateFromSession:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 members]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 participants]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDGroupSessionClient transportParticipants:forSession:]( self,  "transportParticipants:forSession:",  v10,  v6));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 pendingParticipants]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "msv_compactMap:", &stru_100399718));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v6)
  {
    else {
      uint64_t v16 = 3LL;
    }
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
  [v15 setObject:v17 forKeyedSubscript:_MRGroupSessionStateInitialSyncKey];

  [v15 setObject:v11 forKeyedSubscript:_MRGroupSessionParticipantsInitialSyncKey];
  [v15 setObject:v14 forKeyedSubscript:_MRGroupSessionPendingParticipantsInitialSyncKey];
  [v15 setObject:v9 forKeyedSubscript:_MRGroupSessionMembersInitialSyncKey];
  v18 = (void *)objc_claimAutoreleasedReturnValue([v7 data]);

  [v15 setObject:v18 forKeyedSubscript:_MRGroupSessionTokenInitialSyncKey];
  return v15;
}

- (void)session:(id)a3 approvePendingParticipant:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient session](self, "session"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 identifier]);
  if (v12 == v8)
  {
  }

  else
  {
    id v13 = v12;
    unsigned __int8 v14 = [v8 isEqual:v12];

    if ((v14 & 1) == 0)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  2LL,  @"Session identifier does not match connected session."));
      v10[2](v10, v16);

      goto LABEL_8;
    }
  }

  uint64_t v17 = _MRLogForCategory(12LL, v15);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient bundleID](self, "bundleID"));
    int v22 = 138412546;
    unsigned int v23 = v19;
    __int16 v24 = 2112;
    v25 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionClient] Handling approve pending participant %@ from client: %@",  (uint8_t *)&v22,  0x16u);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v11 approvePendingParticipant:v21];

  v10[2](v10, 0LL);
LABEL_8:
}

- (void)session:(id)a3 denyPendingParticipant:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient session](self, "session"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 identifier]);
  if (v12 == v8)
  {
  }

  else
  {
    id v13 = v12;
    unsigned __int8 v14 = [v8 isEqual:v12];

    if ((v14 & 1) == 0)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  2LL,  @"Session identifier does not match connected session."));
      v10[2](v10, v16);

      goto LABEL_8;
    }
  }

  uint64_t v17 = _MRLogForCategory(12LL, v15);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient bundleID](self, "bundleID"));
    int v22 = 138412546;
    unsigned int v23 = v19;
    __int16 v24 = 2112;
    v25 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionClient] Handling deny pending participant %@ from client: %@",  (uint8_t *)&v22,  0x16u);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  [v11 denyPendingParticipant:v21];

  v10[2](v10, 0LL);
LABEL_8:
}

- (void)session:(id)a3 removeParticipant:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient session](self, "session"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 identifier]);
  if (v12 == v8)
  {
  }

  else
  {
    id v13 = v12;
    unsigned __int8 v14 = [v8 isEqual:v12];

    if ((v14 & 1) == 0)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  2LL,  @"Session identifier does not match connected session."));
      v10[2](v10, v16);

      goto LABEL_8;
    }
  }

  uint64_t v17 = _MRLogForCategory(12LL, v15);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient bundleID](self, "bundleID"));
    int v20 = 138412546;
    id v21 = v9;
    __int16 v22 = 2112;
    unsigned int v23 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionClient] Handling remove participant %@ from client: %@",  (uint8_t *)&v20,  0x16u);
  }

  [v11 revokeAutoApprovalForParticipant:v9];
  [v11 removeParticipant:v9];
  v10[2](v10, 0LL);
LABEL_8:
}

- (void)session:(id)a3 removeAllParticipantsWithReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient session](self, "session"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v9 == v6)
  {
  }

  else
  {
    id v10 = v9;
    unsigned __int8 v11 = [v6 isEqual:v9];

    if ((v11 & 1) == 0)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  2LL,  @"Session identifier does not match connected session."));
      v7[2](v7, v13);

      goto LABEL_8;
    }
  }

  uint64_t v14 = _MRLogForCategory(12LL, v12);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient bundleID](self, "bundleID"));
    int v17 = 138412290;
    v18 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionClient] Handling remove all command from client: %@",  (uint8_t *)&v17,  0xCu);
  }

  [v8 revokeAutoApprovalForAllParticipants];
  [v8 removeAllParticipants];
  v7[2](v7, 0LL);
LABEL_8:
}

- (void)connectToDiscoveryWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  -[MRDGroupSessionClient setType:](self, "setType:", 1LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 groupSessionServer]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v6 sessionManager]);

  [v10 addObserver:self];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveredSessions]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 session]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient infoFromGroupSession:](self, "infoFromGroupSession:", v8));
  v4[2](v4, v7, v9);
}

- (void)reevaluatePendingStateFromSession:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient sessionIdentifier](self, "sessionIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned __int8 v7 = [v5 isEqual:v6];

  if ((v7 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient connectTimeoutGuard](self, "connectTimeoutGuard"));
    unsigned int v10 = [v9 disarm];

    uint64_t v12 = _MRLogForCategory(12LL, v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient sessionIdentifier](self, "sessionIdentifier"));
        int v23 = 138412290;
        __int16 v24 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionClient] Pending session: %@ joined",  (uint8_t *)&v23,  0xCu);
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 groupSessionServer]);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 sessionManager]);

      -[os_log_s removeObserver:](v14, "removeObserver:", self);
      -[MRDGroupSessionClient setSession:](self, "setSession:", v4);
      [v4 addObserver:self];
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 joinToken]);
      objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( -[MRDGroupSessionClient initialStateFromSession:token:]( self,  "initialStateFromSession:token:",  v4,  v18));

      int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionClient client](self, "client"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      [v20 session:v21 didConnectWithInitialState:v19];
    }

    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      sub_1002B4B6C(self, v14);
    }
  }

  else
  {
    uint64_t v22 = _MRLogForCategory(12LL, v8);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1002B4BF0((uint64_t)v4, self, v14);
    }
  }
}

- (id)transportParticipants:(id)a3 forSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localParticipant]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 leader]);
  uint64_t v23 = 0LL;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100011538;
  v19[3] = &unk_100399740;
  id v9 = v7;
  id v20 = v9;
  uint64_t v22 = &v23;
  id v10 = v8;
  id v21 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msv_compactMap:", v19));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v11));

  if (!*((_BYTE *)v24 + 24))
  {
    id v13 = objc_alloc(&OBJC_CLASS___MRCodableGroupSessionParticipant);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 identity]);
    id v16 = objc_msgSend( v13,  "initWithIdentifier:identity:connected:guest:hidden:",  v14,  v15,  1,  objc_msgSend(v9, "guest"),  objc_msgSend(v9, "hidden"));

    [v16 setLocal:1];
    objc_msgSend(v16, "setHost:", objc_msgSend(v6, "isHosted"));
    [v12 addObject:v16];
  }

  id v17 = [v12 copy];

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (id)infoFromGroupSession:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = -[MRGroupSessionInfo initWithGroupSession:]( objc_alloc(&OBJC_CLASS___MRGroupSessionInfo),  "initWithGroupSession:",  v3);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (MRDGroupSession)session
{
  return (MRDGroupSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (MSVBlockGuard)connectTimeoutGuard
{
  return self->_connectTimeoutGuard;
}

- (void)setConnectTimeoutGuard:(id)a3
{
}

- (void).cxx_destruct
{
}

@end