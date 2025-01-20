@interface IDSPhoneUserAuthenticationCertificate
- (IDSAuthenticationCertificate)authenticationCertificate;
- (IDSPhoneUserAuthenticationCertificate)initWithPhoneUser:(id)a3 authenticationCertificate:(id)a4;
- (IDSUser)phoneUser;
- (id)description;
@end

@implementation IDSPhoneUserAuthenticationCertificate

- (IDSPhoneUserAuthenticationCertificate)initWithPhoneUser:(id)a3 authenticationCertificate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSPhoneUserAuthenticationCertificate;
  v9 = -[IDSPhoneUserAuthenticationCertificate init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_phoneUser, a3);
    objc_storeStrong((id *)&v10->_authenticationCertificate, a4);
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUserAuthenticationCertificate phoneUser](self, "phoneUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneUserAuthenticationCertificate authenticationCertificate](self, "authenticationCertificate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p phoneUser: %@ authenticationCertificate: %@>",  v3,  self,  v4,  v5));

  return v6;
}

- (IDSUser)phoneUser
{
  return self->_phoneUser;
}

- (IDSAuthenticationCertificate)authenticationCertificate
{
  return self->_authenticationCertificate;
}

- (void).cxx_destruct
{
}

@end