@interface W5PeerGenericRequestListener
- (BOOL)handleClientRequest:(id)a3;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (id)requestHandler;
- (void)invalidate;
- (void)setIdentifier:(id)a3;
- (void)setRequestHandler:(id)a3;
@end

@implementation W5PeerGenericRequestListener

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
  if (v5)
  {
    uint64_t v6 = sub_10008C90C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 info]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
      int v18 = 136316162;
      v19 = "-[W5PeerGenericRequestListener handleClientRequest:]";
      __int16 v20 = 2080;
      v21 = "W5PeerGenericRequestListener.m";
      __int16 v22 = 1024;
      int v23 = 21;
      __int16 v24 = 2114;
      v25 = v8;
      __int16 v26 = 2114;
      v27 = v9;
      int v15 = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) RECV REQUEST (info=%{public}@, options=%{public}@)",  &v18,  v15);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequestListener requestHandler](self, "requestHandler"));
    if (v10)
    {
      v11 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[W5PeerGenericRequestListener requestHandler]( self,  "requestHandler"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v5 info]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100088E04;
      v16[3] = &unk_1000D3490;
      id v17 = v4;
      ((void (**)(void, void *, void *, void *))v11)[2](v11, v12, v13, v16);
    }
  }

  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerGenericRequestPayload, a2);
}

- (void)invalidate
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)requestHandler
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRequestHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end