@interface W5PeerSnifferRequest
- (Class)responsePayloadClass;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerSnifferRequest)initWithPeer:(id)a3 requestType:(int64_t)a4 duration:(double)a5 uuid:(id)a6 channels:(id)a7 config:(id)a8 reply:(id)a9;
- (W5PeerSnifferRequestPayload)requestPayload;
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

@implementation W5PeerSnifferRequest

- (W5PeerSnifferRequest)initWithPeer:(id)a3 requestType:(int64_t)a4 duration:(double)a5 uuid:(id)a6 channels:(id)a7 config:(id)a8 reply:(id)a9
{
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___W5PeerSnifferRequest;
  v22 = -[W5PeerSnifferRequest init](&v35, "init");
  v23 = v22;
  if (!v17
    || !v22
    || (objc_storeStrong((id *)&v22->_peer, a3), !v21)
    || (id v24 = objc_retainBlock(v21), reply = v23->_reply, v23->_reply = v24, reply, a4 == 1)
    && (!v19 || (unint64_t)[v19 count] > 2))
  {

    uint64_t v33 = sub_10008C90C();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 136315650;
      v37 = "-[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:]";
      __int16 v38 = 2080;
      v39 = "W5PeerSnifferRequest.m";
      __int16 v40 = 1024;
      int v41 = 63;
      LODWORD(v34) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v36,  v34,  LODWORD(v35.receiver));
    }

    v23 = 0LL;
    goto LABEL_9;
  }

  identifier = v23->_identifier;
  v23->_discoveryFlags = 1LL;
  v23->_identifier = (NSString *)@"com.apple.wifi.peer.runSniffer";

  v27 = objc_alloc_init(&OBJC_CLASS___W5PeerSnifferRequestPayload);
  requestPayload = v23->_requestPayload;
  v23->_requestPayload = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest _currentVersion](v23, "_currentVersion"));
  -[W5PeerSnifferRequestPayload setVersion:](v23->_requestPayload, "setVersion:", v29);

  -[W5PeerSnifferRequestPayload setChannels:](v23->_requestPayload, "setChannels:", v19);
  -[W5PeerSnifferRequestPayload setDuration:](v23->_requestPayload, "setDuration:", a5);
  -[W5PeerSnifferRequestPayload setUuid:](v23->_requestPayload, "setUuid:", v18);
  -[W5PeerSnifferRequestPayload setType:](v23->_requestPayload, "setType:", a4);
  -[W5PeerSnifferRequestPayload setNoAutoStop:](v23->_requestPayload, "setNoAutoStop:", 0LL);
  if (v20)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"noAutoStop"]);
    -[W5PeerSnifferRequestPayload setNoAutoStop:]( v23->_requestPayload,  "setNoAutoStop:",  [v30 BOOLValue]);

    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"rotationInterval"]);
    -[W5PeerSnifferRequestPayload setRotationInterval:]( v23->_requestPayload,  "setRotationInterval:",  -[os_log_s integerValue](v31, "integerValue"));
LABEL_9:
  }

  return v23;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);

  if (v5)
  {
    v6 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest reply](self, "reply"));
    v7 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue([v4 error]);
    v6[2](v6, v7, 0LL, 0LL, 0LL);
  }

  else
  {
    v6 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue([v4 payload]);
    uint64_t v8 = sub_10008C90C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315906;
      v28 = "-[W5PeerSnifferRequest handleResponse:]";
      __int16 v29 = 2080;
      v30 = "W5PeerSnifferRequest.m";
      __int16 v31 = 1024;
      int v32 = 76;
      __int16 v33 = 2048;
      id v34 = [v6 status];
      LODWORD(v24) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) Response Status: %ld",  (const char *)&v27,  v24,  (_DWORD)v25,  v26);
    }

    if ([v6 status] == (id)1)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 filePaths]);
      if (v10
        && (v11 = (void *)v10,
            v12 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]),
            v12,
            v11,
            v12))
      {
        uint64_t v13 = sub_10008C90C();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (char *)objc_claimAutoreleasedReturnValue([v6 filePaths]);
          v16 = (char *)objc_claimAutoreleasedReturnValue([v6 uuid]);
          int v27 = 138543618;
          v28 = v15;
          __int16 v29 = 2114;
          v30 = v16;
          LODWORD(v24) = 22;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] Sniffer File Path(s) on Remote Peer: %{public}@, UUID: %{public}@",  &v27,  v24);
        }

        v7 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[W5PeerSnifferRequest reply]( self,  "reply"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 filePaths]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
        ((void (**)(void, void, void, void *, void *))v7)[2](v7, 0LL, 0LL, v17, v18);
      }

      else
      {
        v7 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[W5PeerSnifferRequest reply]( self,  "reply"));
        v7[2](v7, 0LL, 0LL, 0LL, 0LL);
      }
    }

    else
    {
      uint64_t v19 = sub_10008C90C();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = (char *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest peer](self, "peer"));
        int v27 = 138543362;
        v28 = v21;
        LODWORD(v24) = 12;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "[wifivelocity] Error on Remote Peer: %{public}@",  &v27,  v24);
      }

      v7 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest reply](self, "reply"));
      NSErrorUserInfoKey v25 = NSLocalizedFailureReasonErrorKey;
      v26 = @"W5PeerSnifferResponseUndefinedError";
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  13LL,  v22));
      ((void (**)(void, void *, void, void, void))v7)[2](v7, v23, 0LL, 0LL, 0LL);
    }
  }
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerSnifferResponsePayload, a2);
}

- (id)_currentVersion
{
  return &off_1000DEC70;
}

- (int64_t)controlFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest peer](self, "peer"));
  id v3 = [v2 controlFlags];

  return (int64_t)v3;
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

- (W5PeerSnifferRequestPayload)requestPayload
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