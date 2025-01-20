@interface DDIDSOutgoingMessage
- (BOOL)expectsResponse;
- (BOOL)forceLocalDelivery;
- (DAIDSDestination)destination;
- (DDIDSOutgoingMessage)initWithDestination:(id)a3 message:(id)a4 data:(id)a5;
- (DDIDSOutgoingMessage)initWithDestination:(id)a3 message:(id)a4 data:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8;
- (NSDictionary)dictionary;
- (NSString)description;
- (NSString)identifier;
- (NSString)peerResponseIdentifier;
- (id)response;
- (int64_t)retryCount;
- (void)setIdentifier:(id)a3;
- (void)setPeerResponseIdentifier:(id)a3;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation DDIDSOutgoingMessage

- (DDIDSOutgoingMessage)initWithDestination:(id)a3 message:(id)a4 data:(id)a5
{
  return -[DDIDSOutgoingMessage initWithDestination:message:data:forceLocalDelivery:expectsResponse:response:]( self,  "initWithDestination:message:data:forceLocalDelivery:expectsResponse:response:",  a3,  a4,  a5,  1LL,  0LL,  0LL);
}

- (DDIDSOutgoingMessage)initWithDestination:(id)a3 message:(id)a4 data:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___DDIDSOutgoingMessage;
  v19 = -[DDIDSOutgoingMessage init](&v35, "init");
  if (v19)
  {
    BOOL v33 = a7;
    v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    if (v17)
    {
      id v34 = 0LL;
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v17,  1LL,  &v34));
      id v22 = v34;
      -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v21, @"data");

      if (v22)
      {
        uint64_t v24 = DiagnosticLogHandleForCategory(7LL);
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10000E6C0(v22, v25);
        }
      }

      else
      {
        v26 = (objc_class *)objc_opt_class(v17, v23);
        v27 = NSStringFromClass(v26);
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v25, @"class");
      }
    }

    -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v16, @"messageName");
    dictionary = v19->_dictionary;
    v19->_dictionary = v20;
    v29 = v20;

    objc_storeStrong((id *)&v19->_destination, a3);
    v19->_forceLocalDelivery = a6;
    v19->_retryCount = 0LL;
    id v30 = objc_retainBlock(v18);
    id response = v19->_response;
    v19->_id response = v30;

    v19->_expectsResponse = v33;
  }

  return v19;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSOutgoingMessage dictionary](self, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[DDIDSOutgoingMessage retryCount](self, "retryCount")));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"dictionary: %@; retry count: %@",
                   v3,
                   v4));

  return (NSString *)v5;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (BOOL)forceLocalDelivery
{
  return self->_forceLocalDelivery;
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (id)response
{
  return self->_response;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)peerResponseIdentifier
{
  return self->_peerResponseIdentifier;
}

- (void)setPeerResponseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end