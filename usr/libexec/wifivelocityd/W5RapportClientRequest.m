@interface W5RapportClientRequest
- (NSDictionary)options;
- (NSString)description;
- (W5PeerRequestPayload)payload;
- (W5RapportClientRequest)initWithPayload:(id)a3 options:(id)a4 handler:(id)a5;
- (id)handler;
@end

@implementation W5RapportClientRequest

- (W5RapportClientRequest)initWithPayload:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = sub_10008C90C();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_retainBlock(v11);
    int v26 = 136316418;
    v27 = "-[W5RapportClientRequest initWithPayload:options:handler:]";
    __int16 v28 = 2080;
    v29 = "W5RapportClientRequest.m";
    __int16 v30 = 1024;
    int v31 = 18;
    __int16 v32 = 2114;
    id v33 = v10;
    __int16 v34 = 2114;
    id v35 = v9;
    __int16 v36 = 2114;
    id v37 = v14;
    int v24 = 58;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) options=%{public}@, response=%{public}@, handler=%{public}@",  &v26,  v24);
  }

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___W5RapportClientRequest;
  v15 = -[W5RapportClientRequest init](&v25, "init");
  v16 = v15;
  if (v15
    && (objc_storeStrong((id *)&v15->_payload, a3),
        id v17 = objc_retainBlock(v11),
        id handler = v16->_handler,
        v16->_id handler = v17,
        handler,
        v16->_handler))
  {
    v19 = (NSDictionary *)v10;
    options = (os_log_s *)v16->_options;
    v16->_options = v19;
  }

  else
  {

    uint64_t v22 = sub_10008C90C();
    options = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(options, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315650;
      v27 = "-[W5RapportClientRequest initWithPayload:options:handler:]";
      __int16 v28 = 2080;
      v29 = "W5RapportClientRequest.m";
      __int16 v30 = 1024;
      int v31 = 34;
      LODWORD(v23) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  options,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v26,  v23,  LODWORD(v25.receiver));
    }

    v16 = 0LL;
  }

  return v16;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL));
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 appendFormat:@"<%@ : %p", v7, self];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportClientRequest payload](self, "payload"));
  [v3 appendFormat:@" payload='%@'", v8];

  [v3 appendString:@">"];
  id v9 = [v3 copy];

  return (NSString *)v9;
}

- (W5PeerRequestPayload)payload
{
  return self->_payload;
}

- (id)handler
{
  return self->_handler;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end