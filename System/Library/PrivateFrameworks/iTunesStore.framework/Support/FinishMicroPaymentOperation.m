@interface FinishMicroPaymentOperation
- (BOOL)_parseResponse:(id)a3 returningError:(id *)a4;
- (NSNumber)userDSID;
- (NSString)transactionIdentifier;
- (StoreKitClientIdentity)clientIdentity;
- (void)dealloc;
- (void)run;
- (void)setClientIdentity:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setUserDSID:(id)a3;
@end

@implementation FinishMicroPaymentOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FinishMicroPaymentOperation;
  -[FinishMicroPaymentOperation dealloc](&v3, "dealloc");
}

- (StoreKitClientIdentity)clientIdentity
{
  objc_super v3 = self->_clientIdentity;
  -[FinishMicroPaymentOperation unlock](self, "unlock");
  return v3;
}

- (void)setClientIdentity:(id)a3
{
  clientIdentity = self->_clientIdentity;
  if (clientIdentity != a3)
  {

    self->_clientIdentity = (StoreKitClientIdentity *)[a3 copy];
  }

  -[FinishMicroPaymentOperation unlock](self, "unlock");
}

- (void)setTransactionIdentifier:(id)a3
{
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier != a3)
  {

    self->_transactionIdentifier = (NSString *)[a3 copy];
  }

  -[FinishMicroPaymentOperation unlock](self, "unlock");
}

- (void)setUserDSID:(id)a3
{
  userDSID = self->_userDSID;
  if (userDSID != a3)
  {

    self->_userDSID = (NSNumber *)a3;
  }

  -[FinishMicroPaymentOperation unlock](self, "unlock");
}

- (NSString)transactionIdentifier
{
  objc_super v3 = self->_transactionIdentifier;
  -[FinishMicroPaymentOperation unlock](self, "unlock");
  return v3;
}

- (NSNumber)userDSID
{
  objc_super v3 = self->_userDSID;
  -[FinishMicroPaymentOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  v4 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v3 setDataProvider:v4];
  v5 = -[SSMutableAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccountIdentifier:",  -[FinishMicroPaymentOperation userDSID](self, "userDSID"));
  -[SSMutableAuthenticationContext setAllowsBootstrapCellularData:]( v5,  "setAllowsBootstrapCellularData:",  -[StoreKitClientIdentity allowsBootstrapCellularData](self->_clientIdentity, "allowsBootstrapCellularData"));
  -[SSMutableAuthenticationContext setTokenType:](v5, "setTokenType:", 1LL);
  [v3 setAuthenticationContext:v5];

  v6 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  -[FinishMicroPaymentOperation transactionIdentifier](self, "transactionIdentifier"),  @"transactionId",  0LL);
  v7 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setAllowsBootstrapCellularData:]( v7,  "setAllowsBootstrapCellularData:",  -[StoreKitClientIdentity allowsBootstrapCellularData](self->_clientIdentity, "allowsBootstrapCellularData"));
  -[SSMutableURLRequestProperties setCachePolicy:](v7, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setRequestParameters:](v7, "setRequestParameters:", v6);
  -[SSMutableURLRequestProperties setURLBagKey:](v7, "setURLBagKey:", @"p2-in-app-transaction-done");
  if (-[StoreKitClientIdentity isSandboxed]( -[FinishMicroPaymentOperation clientIdentity](self, "clientIdentity"),  "isSandboxed"))
  {
    -[SSMutableURLRequestProperties setURLBagType:](v7, "setURLBagType:", 1LL);
  }

  [v3 setRequestProperties:v7];

  uint64_t v18 = 0LL;
  id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v8) {
    id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  v11 = (os_log_s *)[v8 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if ((_DWORD)v10)
  {
    int v19 = 138412546;
    uint64_t v20 = objc_opt_class(self);
    __int16 v21 = 2112;
    v22 = -[FinishMicroPaymentOperation transactionIdentifier](self, "transactionIdentifier");
    LODWORD(v17) = 22;
    uint64_t v12 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Finishing payment: %@",  &v19,  v17);
    if (v12)
    {
      v13 = (void *)v12;
      v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
      free(v13);
      v16 = v14;
      SSFileLog(v8, @"%@");
    }
  }

  if ((-[FinishMicroPaymentOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v3,  &v18,  v16) & 1) != 0)
  {
    BOOL v15 = -[FinishMicroPaymentOperation _parseResponse:returningError:]( self,  "_parseResponse:returningError:",  -[DaemonProtocolDataProvider output](v4, "output"),  &v18);
    -[FinishMicroPaymentOperation setError:](self, "setError:", v18);
    -[FinishMicroPaymentOperation setSuccess:](self, "setSuccess:", v15);
  }

  else
  {
    -[FinishMicroPaymentOperation setError:](self, "setError:", v18);
  }
}

- (BOOL)_parseResponse:(id)a3 returningError:(id *)a4
{
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(a3, v7) & 1) == 0)
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v15 = [v10 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    uint64_t v17 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      *(_DWORD *)__int16 v21 = 138412290;
      *(void *)&v21[4] = objc_opt_class(self);
      uint64_t v14 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "%@: Failed with non-dictionary response",  v21,  12,  *(_OWORD *)v21,  *(void *)&v21[16]);
LABEL_23:
      uint64_t v18 = (void *)v14;
      if (v14)
      {
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v18);
        SSFileLog(v10, @"%@");
      }
    }

@end