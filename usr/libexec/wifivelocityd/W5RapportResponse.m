@interface W5RapportResponse
+ (id)responseWithPayload:(id)a3 options:(id)a4 error:(id)a5;
- (NSDictionary)options;
- (NSError)error;
- (W5PeerPayload)payload;
- (W5RapportResponse)initWithPayload:(id)a3 options:(id)a4 error:(id)a5;
- (void)setError:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation W5RapportResponse

+ (id)responseWithPayload:(id)a3 options:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v11)), "initWithPayload:options:error:", v10, v9, v8);

  return v12;
}

- (W5RapportResponse)initWithPayload:(id)a3 options:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___W5RapportResponse;
  id v12 = -[W5RapportResponse init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_storeStrong((id *)&v13->_payload, a3);
    objc_storeStrong((id *)&v13->_options, a4);
    uint64_t v14 = sub_10008C90C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136316418;
      v20 = "-[W5RapportResponse initWithPayload:options:error:]";
      __int16 v21 = 2080;
      v22 = "W5RapportResponse.m";
      __int16 v23 = 1024;
      int v24 = 34;
      __int16 v25 = 2114;
      id v26 = v9;
      __int16 v27 = 2114;
      id v28 = v10;
      __int16 v29 = 2114;
      id v30 = v11;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) payload='%{public}@' options='%{public}@' error='%{public}@'",  &v19,  58);
    }
  }

  else
  {
    uint64_t v17 = sub_10008C90C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315650;
      v20 = "-[W5RapportResponse initWithPayload:options:error:]";
      __int16 v21 = 2080;
      v22 = "W5RapportResponse.m";
      __int16 v23 = 1024;
      int v24 = 40;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  &v19,  28);
    }
  }

  return v13;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (W5PeerPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end