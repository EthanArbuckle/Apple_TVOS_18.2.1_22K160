@interface MRDGroupSessionTransportConnection
- (BOOL)hasAccessToPlayerPath:(id)a3;
- (BOOL)isAllowedToSendCommand:(unsigned int)a3;
- (BOOL)isAllowedToSendMessageType:(unint64_t)a3;
- (BOOL)isValid;
- (MRDGroupSession)groupSession;
- (MRDGroupSessionParticipant)participant;
- (MRDGroupSessionTransportConnection)initWithGroupSession:(id)a3 participant:(id)a4;
- (NSString)description;
- (id)error;
- (id)exportOutputDevice:(id)a3 endpoint:(id)a4;
- (id)outputDeviceForGroupSession:(id)a3;
- (unint64_t)sendTransportData:(id)a3 options:(id)a4;
- (void)closeWithError:(id)a3;
- (void)leaveSessionIfNeeded;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didReceiveMessageData:(id)a4 fromParticipant:(id)a5;
@end

@implementation MRDGroupSessionTransportConnection

- (MRDGroupSessionTransportConnection)initWithGroupSession:(id)a3 participant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MRDGroupSessionTransportConnection;
  v8 = -[MRDGroupSessionTransportConnection init](&v15, "init");
  v10 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_groupSession, v6);
    objc_storeStrong((id *)&v10->_participant, a4);
  }

  uint64_t v11 = _MRLogForCategory(12LL, v9);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionTransportConnection] %@ init",  buf,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v10->_groupSession);
  [WeakRetained addObserver:v10];

  return v10;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSession);
  v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained identifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p session=%@ participant=%@>",  v3,  self,  v5,  self->_participant));

  return (NSString *)v6;
}

- (id)error
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSError copy](v2->_error, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransportConnection groupSession](self, "groupSession"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransportConnection participant](self, "participant"));
  uint64_t v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v6 sendMessageData:v5 toParticipants:v8];

  id v9 = [v5 length];
  return (unint64_t)v9;
}

- (void)closeWithError:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransportConnection error](self, "error"));

  uint64_t v8 = _MRLogForCategory(12LL, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransportConnection error](self, "error"));
      int v20 = 138543874;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v5;
      __int16 v24 = 2114;
      v25 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionTransportConnection] %{public}@ Ignoring request to close connection with error: %{public}@, bec ause we already had error: %{public}@",  (uint8_t *)&v20,  0x20u);
    }
  }

  else
  {
    if (v10)
    {
      int v20 = 138543618;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionTransportConnection] %{public}@ Got request to close connection with error: %{public}@",  (uint8_t *)&v20,  0x16u);
    }

    v12 = self;
    objc_sync_enter(v12);
    objc_storeStrong((id *)&v12->_error, a3);
    objc_sync_exit(v12);

    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v12->_groupSession);
      id v14 = [WeakRetained state];

      if (v14 == (id)3)
      {
        -[MRDGroupSessionTransportConnection leaveSessionIfNeeded](v12, "leaveSessionIfNeeded");
      }

      else
      {
        uint64_t v16 = _MRLogForCategory(12LL, v15);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = sub_10014CE64((unint64_t)v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          int v20 = 138412546;
          v21 = v12;
          __int16 v22 = 2114;
          id v23 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionTransportConnection] %@ Not destroying session because state is: %{public}@",  (uint8_t *)&v20,  0x16u);
        }
      }
    }

    -[MRDGroupSessionTransportConnection _notifyDelegateDidCloseWithError:]( v12,  "_notifyDelegateDidCloseWithError:",  v5);
  }
}

- (BOOL)isValid
{
  return 1;
}

- (void)leaveSessionIfNeeded
{
  p_groupSession = &self->_groupSession;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSession);
  unsigned __int8 v5 = [WeakRetained isHosted];

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = _MRLogForCategory(12LL, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_loadWeakRetained((id *)p_groupSession);
      int v14 = 138543618;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionTransportConnection] %{public}@ Leaving session due to client disconnect: %{public}@",  (uint8_t *)&v14,  0x16u);
    }

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 groupSessionServer]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sessionManager]);

    id v13 = objc_loadWeakRetained((id *)p_groupSession);
    [v12 leaveRemoteControlGroupSession:v13];
  }

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  if (a4 != 3)
  {
    id v9 = v6;
    if (a4 == 4) {
      uint64_t v7 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  1LL,  @"Session changed state to invalidated"));
    }
    else {
      uint64_t v7 = -[NSError initWithMRError:description:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:description:",  105LL,  @"Session disconnected");
    }
    uint64_t v8 = v7;
    -[MRDGroupSessionTransportConnection closeWithError:](self, "closeWithError:", v7);

    id v6 = v9;
  }
}

- (void)session:(id)a3 didReceiveMessageData:(id)a4 fromParticipant:(id)a5
{
  id v11 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a5 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionTransportConnection participant](self, "participant"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v10 = [v7 isEqualToString:v9];

  if (v10) {
    -[MRDGroupSessionTransportConnection _notifyDelegateDidReceiveData:](self, "_notifyDelegateDidReceiveData:", v11);
  }
}

- (id)exportOutputDevice:(id)a3 endpoint:(id)a4
{
  id v5 = a3;
  if ([v5 isLocalDevice])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSession);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDGroupSessionTransportConnection outputDeviceForGroupSession:]( self,  "outputDeviceForGroupSession:",  WeakRetained));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 mergingVolumeFrom:v5]);
  }

  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)outputDeviceForGroupSession:(id)a3
{
  id v3 = a3;
  v4 = -[MRAVDistantOutputDevice initWithGroupSession:]( objc_alloc(&OBJC_CLASS___MRAVDistantOutputDevice),  "initWithGroupSession:",  v3);

  return v4;
}

- (BOOL)hasAccessToPlayerPath:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 client]);
  unsigned __int8 v4 = [v3 isSystemMediaApplication];

  return v4;
}

- (BOOL)isAllowedToSendMessageType:(unint64_t)a3
{
  if (qword_1003FDDF0 != -1) {
    dispatch_once(&qword_1003FDDF0, &stru_10039E660);
  }
  unsigned __int8 v4 = (void *)qword_1003FDDE8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  LOBYTE(v4) = [v4 containsObject:v5];

  return (char)v4;
}

- (BOOL)isAllowedToSendCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_1003FDE00 != -1) {
    dispatch_once(&qword_1003FDE00, &stru_10039E680);
  }
  unsigned __int8 v4 = (void *)qword_1003FDDF8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  LOBYTE(v4) = [v4 containsObject:v5] ^ 1;

  return (char)v4;
}

- (MRDGroupSession)groupSession
{
  return (MRDGroupSession *)objc_loadWeakRetained((id *)&self->_groupSession);
}

- (MRDGroupSessionParticipant)participant
{
  return self->_participant;
}

- (void).cxx_destruct
{
}

@end