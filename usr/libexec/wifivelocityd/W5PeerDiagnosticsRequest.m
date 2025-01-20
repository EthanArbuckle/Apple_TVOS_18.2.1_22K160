@interface W5PeerDiagnosticsRequest
- (Class)responsePayloadClass;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerDiagnosticsRequest)initWithPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7;
- (W5PeerDiagnosticsRequestPayload)requestPayload;
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

@implementation W5PeerDiagnosticsRequest

- (W5PeerDiagnosticsRequest)initWithPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___W5PeerDiagnosticsRequest;
  v18 = -[W5PeerDiagnosticsRequest init](&v30, "init");
  v19 = v18;
  if (v18
    && (objc_storeStrong((id *)&v18->_peer, a3), v13)
    && (id v20 = objc_retainBlock(v17), reply = v19->_reply, v19->_reply = v20, reply, v17))
  {
    identifier = v19->_identifier;
    v19->_discoveryFlags = 1LL;
    v19->_identifier = (NSString *)@"com.apple.wifi.peer.peerDiagnostics";

    v23 = objc_alloc_init(&OBJC_CLASS___W5PeerDiagnosticsRequestPayload);
    requestPayload = v19->_requestPayload;
    v19->_requestPayload = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequest _currentVersion](v19, "_currentVersion"));
    -[W5PeerDiagnosticsRequestPayload setVersion:](v19->_requestPayload, "setVersion:", v25);

    -[W5PeerDiagnosticsRequestPayload setConfiguration:](v19->_requestPayload, "setConfiguration:", v15);
    -[W5PeerDiagnosticsRequestPayload setTests:](v19->_requestPayload, "setTests:", v14);
    -[W5PeerDiagnosticsRequestPayload setUuid:](v19->_requestPayload, "setUuid:", v16);
  }

  else
  {

    uint64_t v27 = sub_10008C90C();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315650;
      v32 = "-[W5PeerDiagnosticsRequest initWithPeer:diagnostics:configuration:uuid:reply:]";
      __int16 v33 = 2080;
      v34 = "W5PeerDiagnosticsRequest.m";
      __int16 v35 = 1024;
      int v36 = 53;
      LODWORD(v29) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v31,  v29,  LODWORD(v30.receiver));
    }

    v19 = 0LL;
  }

  return v19;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);

  if (v5)
  {
    v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequest reply](self, "reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
    ((void (**)(void, void *, void))v6)[2](v6, v7, 0LL);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 results]);
    if (!v9)
    {
      uint64_t v10 = sub_10008C90C();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
        int v16 = 136315906;
        id v17 = "-[W5PeerDiagnosticsRequest handleResponse:]";
        __int16 v18 = 2080;
        v19 = "W5PeerDiagnosticsRequest.m";
        __int16 v20 = 1024;
        int v21 = 66;
        __int16 v22 = 2114;
        v23 = v12;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] %s (%s:%u) results data is not in payload:%{public}@",  &v16,  38);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);
      id v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequest reply](self, "reply"));
      ((void (**)(void, void *, void))v14)[2](v14, v13, 0LL);
    }

    id v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequest reply](self, "reply"));
    ((void (**)(void, void, void *))v15)[2](v15, 0LL, v9);
  }
}

- (id)_currentVersion
{
  return &off_1000DF738;
}

- (int64_t)controlFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequest peer](self, "peer"));
  id v3 = [v2 controlFlags];

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerDiagnosticsResponsePayload, a2);
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

- (W5PeerDiagnosticsRequestPayload)requestPayload
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