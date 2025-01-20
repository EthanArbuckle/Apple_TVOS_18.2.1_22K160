@interface W5PeerDebugConfigurationRequest
- (Class)responsePayloadClass;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerDebugConfigurationRequest)initWithPeer:(id)a3 type:(unint64_t)a4 debugConfiguration:(id)a5 reply:(id)a6;
- (W5PeerDebugRequestPayload)requestPayload;
- (id)_currentVersion;
- (id)reply;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (unint64_t)type;
- (void)handleResponse:(id)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeer:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequestPayload:(id)a3;
@end

@implementation W5PeerDebugConfigurationRequest

- (W5PeerDebugConfigurationRequest)initWithPeer:(id)a3 type:(unint64_t)a4 debugConfiguration:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___W5PeerDebugConfigurationRequest;
  v14 = -[W5PeerDebugConfigurationRequest init](&v26, "init");
  v15 = v14;
  if (v11 && v14 && (objc_storeStrong((id *)&v14->_peer, a3), v13))
  {
    id v16 = objc_retainBlock(v13);
    id reply = v15->_reply;
    v15->_id reply = v16;

    v15->_type = a4;
    v15->_discoveryFlags = 1LL;
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)@"com.apple.wifi.peer.debugConfiguration";

    v19 = objc_alloc_init(&OBJC_CLASS___W5PeerDebugRequestPayload);
    requestPayload = v15->_requestPayload;
    v15->_requestPayload = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugConfigurationRequest _currentVersion](v15, "_currentVersion"));
    -[W5PeerDebugRequestPayload setVersion:](v15->_requestPayload, "setVersion:", v21);

    -[W5PeerDebugRequestPayload setRequestType:](v15->_requestPayload, "setRequestType:", v15->_type);
    if (v12) {
      -[W5PeerDebugRequestPayload setConfiguration:](v15->_requestPayload, "setConfiguration:", v12);
    }
  }

  else
  {

    uint64_t v23 = sub_10008C90C();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315650;
      v28 = "-[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:]";
      __int16 v29 = 2080;
      v30 = "W5PeerDebugConfigurationRequest.m";
      __int16 v31 = 1024;
      int v32 = 58;
      LODWORD(v25) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v27,  v25,  LODWORD(v26.receiver));
    }

    v15 = 0LL;
  }

  return v15;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 error]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);

  if (v9 || (id)-[W5PeerDebugConfigurationRequest type](self, "type") != (id)1) {
    v6 = 0LL;
  }
  else {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 configuration]);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugConfigurationRequest reply](self, "reply"));

  if (v7)
  {
    v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerDebugConfigurationRequest reply](self, "reply"));
    ((void (**)(void, id, void *))v8)[2](v8, v9, v6);
  }
}

- (id)_currentVersion
{
  return &off_1000DEC88;
}

- (int64_t)controlFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugConfigurationRequest peer](self, "peer"));
  id v3 = [v2 controlFlags];

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerDebugResponsePayload, a2);
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

- (unint64_t)type
{
  return self->_type;
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

- (W5PeerDebugRequestPayload)requestPayload
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