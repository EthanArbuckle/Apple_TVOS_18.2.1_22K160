@interface W5PeerStatusRequest
- (Class)responsePayloadClass;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerStatusRequest)initWithPeer:(id)a3 reply:(id)a4;
- (W5PeerStatusRequestPayload)requestPayload;
- (id)_currentVersion;
- (id)reply;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (void)handleResponse:(id)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeer:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequestPayload:(id)a3;
@end

@implementation W5PeerStatusRequest

- (W5PeerStatusRequest)initWithPeer:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___W5PeerStatusRequest;
  v9 = -[W5PeerStatusRequest init](&v20, "init");
  v10 = v9;
  if (v7 && v9 && (objc_storeStrong((id *)&v9->_peer, a3), v8))
  {
    id v11 = objc_retainBlock(v8);
    id reply = v10->_reply;
    v10->_id reply = v11;

    identifier = v10->_identifier;
    v10->_discoveryFlags = 1LL;
    v10->_identifier = (NSString *)@"com.apple.wifi.peer.connectionState";

    v14 = objc_alloc_init(&OBJC_CLASS___W5PeerStatusRequestPayload);
    requestPayload = v10->_requestPayload;
    v10->_requestPayload = v14;

    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest _currentVersion](v10, "_currentVersion"));
    -[W5PeerStatusRequestPayload setVersion:](v10->_requestPayload, "setVersion:", v16);
  }

  else
  {

    uint64_t v18 = sub_10008C90C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      v22 = "-[W5PeerStatusRequest initWithPeer:reply:]";
      __int16 v23 = 2080;
      v24 = "W5PeerStatusRequest.m";
      __int16 v25 = 1024;
      int v26 = 48;
      LODWORD(v19) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v21,  v19,  LODWORD(v20.receiver));
    }

    v10 = 0LL;
  }

  return v10;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);

  if (v5)
  {
    v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest reply](self, "reply"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
    ((void (**)(void, void *, void))v6)[2](v6, v7, 0LL);
  }

  else
  {
    v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 payload]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 peerStatus]);
    id v8 = [v6 status];
    uint64_t v9 = sub_10008C90C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8 == (id)1 && v7)
    {
      if (v11)
      {
        int v18 = 136315906;
        v19 = "-[W5PeerStatusRequest handleResponse:]";
        __int16 v20 = 2080;
        int v21 = "W5PeerStatusRequest.m";
        __int16 v22 = 1024;
        int v23 = 62;
        __int16 v24 = 2114;
        __int16 v25 = v7;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) peer status='%{public}@'",  &v18,  38);
      }

      v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest reply](self, "reply"));
      ((void (**)(void, void, void *))v12)[2](v12, 0LL, v7);
    }

    else
    {
      if (v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest peer](self, "peer"));
        int v18 = 136315906;
        v19 = "-[W5PeerStatusRequest handleResponse:]";
        __int16 v20 = 2080;
        int v21 = "W5PeerStatusRequest.m";
        __int16 v22 = 1024;
        int v23 = 65;
        __int16 v24 = 2114;
        __int16 v25 = v13;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) failed to retrieve status object from peer='%{public}@'",  &v18,  38);
      }

      v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest reply](self, "reply"));
      NSErrorUserInfoKey v16 = NSLocalizedFailureReasonErrorKey;
      v17 = @"W5PeerStatusResponseUndefinedError";
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  15LL,  v14));
      ((void (**)(void, void *, void))v12)[2](v12, v15, 0LL);
    }
  }
}

- (id)_currentVersion
{
  return &off_1000DECA0;
}

- (int64_t)controlFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusRequest peer](self, "peer"));
  id v3 = [v2 controlFlags];

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerStatusResponsePayload, a2);
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (int64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(int64_t)a3
{
  self->_discoveryFlags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (W5PeerStatusRequestPayload)requestPayload
{
  return self->_requestPayload;
}

- (void)setRequestPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end