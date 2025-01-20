@interface SKPaymentDiscount
- (NSNumber)timestamp;
- (NSString)identifier;
- (NSString)keyIdentifier;
- (NSString)signature;
- (NSUUID)nonce;
- (SKPaymentDiscount)initWithIdentifier:(NSString *)identifier keyIdentifier:(NSString *)keyIdentifier nonce:(NSUUID *)nonce signature:(NSString *)signature timestamp:(NSNumber *)timestamp;
@end

@implementation SKPaymentDiscount

- (SKPaymentDiscount)initWithIdentifier:(NSString *)identifier keyIdentifier:(NSString *)keyIdentifier nonce:(NSUUID *)nonce signature:(NSString *)signature timestamp:(NSNumber *)timestamp
{
  v12 = identifier;
  v13 = keyIdentifier;
  v14 = nonce;
  v15 = signature;
  v16 = timestamp;
  v17 = v16;
  if (!v12 || !v13 || !v14 || !v15 || !v16)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    unsigned int v31 = [v30 shouldLog];
    else {
      unsigned int v32 = v31;
    }
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      uint64_t v34 = v32;
    }
    else {
      uint64_t v34 = v32 & 2;
    }
    if ((_DWORD)v34)
    {
      v38[0] = 0;
      v35 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  16LL,  "Found nil parameter when creating SKPaymentDiscount",  v38,  2);

      if (!v35)
      {
LABEL_19:

        v29 = 0LL;
        goto LABEL_20;
      }

      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL));
      free(v35);
      SSFileLog(v30, @"%@");
    }

    goto LABEL_19;
  }

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___SKPaymentDiscount;
  v18 = -[SKPaymentDiscount init](&v37, "init");
  if (v18)
  {
    v19 = (NSString *)-[NSString copy](v12, "copy");
    v20 = v18->_identifier;
    v18->_identifier = v19;

    v21 = (NSString *)-[NSString copy](v13, "copy");
    v22 = v18->_keyIdentifier;
    v18->_keyIdentifier = v21;

    v23 = (NSUUID *)-[NSUUID copy](v14, "copy");
    v24 = v18->_nonce;
    v18->_nonce = v23;

    v25 = (NSString *)-[NSString copy](v15, "copy");
    v26 = v18->_signature;
    v18->_signature = v25;

    v27 = (NSNumber *)-[NSNumber copy](v17, "copy");
    v28 = v18->_timestamp;
    v18->_timestamp = v27;
  }

  self = v18;
  v29 = self;
LABEL_20:

  return v29;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSUUID)nonce
{
  return self->_nonce;
}

- (NSString)signature
{
  return self->_signature;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end