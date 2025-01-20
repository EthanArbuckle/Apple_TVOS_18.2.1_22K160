@interface W5PeerGenericRequest
- (Class)responsePayloadClass;
- (NSDictionary)requestInfo;
- (NSString)identifier;
- (W5Peer)peer;
- (W5PeerRequestPayload)requestPayload;
- (id)responseHandler;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (void)handleResponse:(id)a3;
- (void)setControlFlags:(int64_t)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeer:(id)a3;
- (void)setRequestInfo:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation W5PeerGenericRequest

- (W5PeerRequestPayload)requestPayload
{
  v3 = objc_alloc_init(&OBJC_CLASS___W5PeerGenericRequestPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequest requestInfo](self, "requestInfo"));
  -[W5PeerGenericRequestPayload setInfo:](v3, "setInfo:", v4);

  return (W5PeerRequestPayload *)v3;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
  uint64_t v7 = sub_10008C90C();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
    int v16 = 136316162;
    v17 = "-[W5PeerGenericRequest handleResponse:]";
    __int16 v18 = 2080;
    v19 = "W5PeerGenericRequest.m";
    __int16 v20 = 1024;
    int v21 = 27;
    __int16 v22 = 2114;
    v23 = v9;
    __int16 v24 = 2114;
    v25 = v10;
    int v15 = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) RECV RESPONSE (info=%{public}@, options=%{public}@)",  &v16,  v15);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequest responseHandler](self, "responseHandler"));
  if (v11)
  {
    v12 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[W5PeerGenericRequest responseHandler]( self,  "responseHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 info]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
    ((void (**)(void, void *, void *, void *))v12)[2](v12, v5, v13, v14);
  }
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerGenericResponsePayload, a2);
}

- (int64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(int64_t)a3
{
  self->_controlFlags = a3;
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

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (NSDictionary)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end