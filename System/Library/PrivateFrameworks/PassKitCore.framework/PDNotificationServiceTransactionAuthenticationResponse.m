@interface PDNotificationServiceTransactionAuthenticationResponse
- (NSData)signingCertificate;
- (PDNotificationServiceTransactionAuthenticationResponse)initWithData:(id)a3;
- (PKTransactionAuthenticationContext)updatedAuthenticationContext;
- (id)description;
- (int64_t)authenticationFailure;
- (int64_t)updatedTransactionStatus;
- (void)setAuthenticationFailure:(int64_t)a3;
- (void)setSigningCertificate:(id)a3;
- (void)setUpdatedAuthenticationContext:(id)a3;
- (void)setUpdatedTransactionStatus:(int64_t)a3;
@end

@implementation PDNotificationServiceTransactionAuthenticationResponse

- (PDNotificationServiceTransactionAuthenticationResponse)initWithData:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v13 = 0LL;
    goto LABEL_13;
  }

  id v29 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v4,  0LL,  &v29));
  id v7 = v29;
  if (v7)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v7;
      v10 = "PDNotificationServiceTransactionAuthenticationResponse failed to parse response data with error: %@";
      v11 = v9;
      uint32_t v12 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v5, v14) & 1) == 0)
  {
    uint64_t v15 = PKLogFacilityTypeGetObject(6LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "PDNotificationServiceTransactionAuthenticationResponse body is not a dictionary";
      v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_10;
    }

- (id)description
{
  uint64_t v3 = PKPaymentTransactionStatusToString(self->_updatedTransactionStatus, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = PKTransactionAuthenticationFailureToString(self->_authenticationFailure);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<TransactionAuthenticationResponse, updated transaction status: %@, authentication failure: %@, signing certificate: %tu bytes, updated authentication context: %@>",  v4,  v6,  -[NSData length](self->_signingCertificate, "length"),  self->_updatedAuthenticationContext));

  return v7;
}

- (int64_t)updatedTransactionStatus
{
  return self->_updatedTransactionStatus;
}

- (void)setUpdatedTransactionStatus:(int64_t)a3
{
  self->_updatedTransactionStatus = a3;
}

- (PKTransactionAuthenticationContext)updatedAuthenticationContext
{
  return self->_updatedAuthenticationContext;
}

- (void)setUpdatedAuthenticationContext:(id)a3
{
}

- (int64_t)authenticationFailure
{
  return self->_authenticationFailure;
}

- (void)setAuthenticationFailure:(int64_t)a3
{
  self->_authenticationFailure = a3;
}

- (NSData)signingCertificate
{
  return self->_signingCertificate;
}

- (void)setSigningCertificate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end