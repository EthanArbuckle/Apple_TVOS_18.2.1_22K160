@interface W5PeerDatabaseRequest
- (Class)responsePayloadClass;
- (NSFetchRequest)fetch;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerDatabaseRequest)initWithPeer:(id)a3 fetch:(id)a4 reply:(id)a5;
- (W5PeerDatabaseRequestPayload)requestPayload;
- (id)_currentVersion;
- (id)reply;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (void)handleResponse:(id)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setFetch:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeer:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequestPayload:(id)a3;
@end

@implementation W5PeerDatabaseRequest

- (W5PeerDatabaseRequest)initWithPeer:(id)a3 fetch:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___W5PeerDatabaseRequest;
  v12 = -[W5PeerDatabaseRequest init](&v23, "init");
  v13 = v12;
  if (v9 && v12 && (objc_storeStrong((id *)&v12->_peer, a3), v10) && (objc_storeStrong((id *)&v13->_fetch, a4), v11))
  {
    id v14 = objc_retainBlock(v11);
    id reply = v13->_reply;
    v13->_id reply = v14;

    identifier = v13->_identifier;
    v13->_discoveryFlags = 1LL;
    v13->_identifier = (NSString *)@"com.apple.wifi.peer.dbQuery";

    v17 = objc_alloc_init(&OBJC_CLASS___W5PeerDatabaseRequestPayload);
    requestPayload = v13->_requestPayload;
    v13->_requestPayload = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest _currentVersion](v13, "_currentVersion"));
    -[W5PeerDatabaseRequestPayload setVersion:](v13->_requestPayload, "setVersion:", v19);

    -[W5PeerDatabaseRequestPayload setFetchRequest:](v13->_requestPayload, "setFetchRequest:", v13->_fetch);
  }

  else
  {

    uint64_t v21 = sub_10008C90C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315138;
      v25 = "-[W5PeerDatabaseRequest initWithPeer:fetch:reply:]";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s: init error!",  (const char *)&v24);
    }

    v13 = 0LL;
  }

  return v13;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);

  if (!v5)
  {
    v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 payload]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchedResults]);
    if ([v6 status] == (id)1)
    {
      uint64_t v8 = sub_10008C90C();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v10)
        {
          int v24 = 136316162;
          v25 = "-[W5PeerDatabaseRequest handleResponse:]";
          __int16 v26 = 2080;
          v27 = "W5PeerDatabaseRequest.m";
          __int16 v28 = 1024;
          int v29 = 69;
          __int16 v30 = 2080;
          v31 = "-[W5PeerDatabaseRequest handleResponse:]";
          __int16 v32 = 2048;
          id v33 = [v7 count];
          LODWORD(v19) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) %s: peer fetched results count=%lu",  (const char *)&v24,  v19,  (_DWORD)v20,  (const char *)v21,  v22);
        }

        id v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest reply](self, "reply"));
        ((void (**)(void, void, void *))v11)[2](v11, 0LL, v7);
        goto LABEL_15;
      }

      if (v10)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest peer](self, "peer"));
        int v24 = 136316162;
        v25 = "-[W5PeerDatabaseRequest handleResponse:]";
        __int16 v26 = 2080;
        v27 = "W5PeerDatabaseRequest.m";
        __int16 v28 = 1024;
        int v29 = 72;
        __int16 v30 = 2080;
        v31 = "-[W5PeerDatabaseRequest handleResponse:]";
        __int16 v32 = 2112;
        id v33 = v17;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) %s: peer fetch ok, but no results peer='%@'",  &v24,  48);
      }

      id v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest reply](self, "reply"));
      NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
      objc_super v23 = @"W5NoErr";
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      uint64_t v16 = 0LL;
    }

    else
    {
      uint64_t v12 = sub_10008C90C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest peer](self, "peer"));
        int v24 = 136316162;
        v25 = "-[W5PeerDatabaseRequest handleResponse:]";
        __int16 v26 = 2080;
        v27 = "W5PeerDatabaseRequest.m";
        __int16 v28 = 1024;
        int v29 = 76;
        __int16 v30 = 2080;
        v31 = "-[W5PeerDatabaseRequest handleResponse:]";
        __int16 v32 = 2112;
        id v33 = v14;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) %s: failed to retrieve status object from peer='%@'",  &v24,  48);
      }

      id v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest reply](self, "reply"));
      NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
      uint64_t v21 = @"W5PeerDatabaseResponseUndefinedError";
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      uint64_t v16 = 14LL;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  v16,  v15));
    ((void (**)(void, void *, void))v11)[2](v11, v18, 0LL);

LABEL_15:
    goto LABEL_16;
  }

  v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest reply](self, "reply"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
  ((void (**)(void, void *, void))v6)[2](v6, v7, 0LL);
LABEL_16:
}

- (id)_currentVersion
{
  return &off_1000DEC58;
}

- (int64_t)controlFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDatabaseRequest peer](self, "peer"));
  id v3 = [v2 controlFlags];

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerDatabaseResponsePayload, a2);
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (NSFetchRequest)fetch
{
  return self->_fetch;
}

- (void)setFetch:(id)a3
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

- (W5PeerDatabaseRequestPayload)requestPayload
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