@interface W5PeerSimpleResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSDictionary)dictionary;
- (NSNumber)version;
- (W5PeerSimpleResponsePayload)initWithRequest:(id)a3;
- (int64_t)status;
- (void)setDictionary:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerSimpleResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerSimpleResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___W5PeerSimpleResponsePayload;
  uint64_t v5 = -[W5PeerSimpleResponsePayload init](&v10, "init");
  if (v5)
  {
    id v6 = (NSDictionary *)v4;
    dictionary = (os_log_s *)v5->_dictionary;
    v5->_dictionary = v6;
  }

  else
  {
    uint64_t v9 = sub_10008C90C();
    dictionary = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(dictionary, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      v12 = "-[W5PeerSimpleResponsePayload initWithRequest:]";
      __int16 v13 = 2080;
      v14 = "W5PeerSimpleResponsePayload.m";
      __int16 v15 = 1024;
      int v16 = 33;
      __int16 v17 = 2114;
      uint64_t v18 = 0LL;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  dictionary,  0LL,  "[wifivelocity] %s (%s:%u) init error (error='%{public}@'",  &v11,  38);
    }
  }

  return v5;
}

- (NSNumber)version
{
  return self->version;
}

- (void)setVersion:(id)a3
{
  self->version = (NSNumber *)a3;
}

- (int64_t)status
{
  return self->status;
}

- (void)setStatus:(int64_t)a3
{
  self->status = a3;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end