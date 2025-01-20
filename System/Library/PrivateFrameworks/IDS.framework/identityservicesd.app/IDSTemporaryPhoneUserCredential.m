@interface IDSTemporaryPhoneUserCredential
- (IDSAuthenticationCertificate)phoneAuthenticationCertificate;
- (IDSTemporaryPhoneUserCredential)initWithDataRepresentation:(id)a3;
- (IDSTemporaryPhoneUserCredential)initWithPhoneAuthenticationCertificate:(id)a3;
- (NSData)dataRepresentation;
- (NSString)description;
- (int64_t)realm;
@end

@implementation IDSTemporaryPhoneUserCredential

- (IDSTemporaryPhoneUserCredential)initWithPhoneAuthenticationCertificate:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___IDSTemporaryPhoneUserCredential;
    v6 = -[IDSTemporaryPhoneUserCredential init](&v11, "init");
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_phoneAuthenticationCertificate, a3);
    }
    self = v7;
    v8 = self;
  }

  else
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Trying to create temporary user credential with nil argument. Returning nil. { cert: %@ }",  buf,  0xCu);
    }

    v8 = 0LL;
  }

  return v8;
}

- (int64_t)realm
{
  return 2LL;
}

- (IDSTemporaryPhoneUserCredential)initWithDataRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = -[IDSAuthenticationCertificate initWithDataRepresentation:]( objc_alloc(&OBJC_CLASS___IDSAuthenticationCertificate),  "initWithDataRepresentation:",  v4);
  }

  else
  {
    id v5 = 0LL;
  }

  v6 = -[IDSTemporaryPhoneUserCredential initWithPhoneAuthenticationCertificate:]( self,  "initWithPhoneAuthenticationCertificate:",  v5);

  return v6;
}

- (NSData)dataRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[IDSTemporaryPhoneUserCredential phoneAuthenticationCertificate]( self,  "phoneAuthenticationCertificate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataRepresentation]);

  return (NSData *)v3;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSTemporaryPhoneUserCredential phoneAuthenticationCertificate]( self,  "phoneAuthenticationCertificate"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> cert: %@",  v3,  self,  v4));

  return (NSString *)v5;
}

- (IDSAuthenticationCertificate)phoneAuthenticationCertificate
{
  return self->_phoneAuthenticationCertificate;
}

- (void).cxx_destruct
{
}

@end