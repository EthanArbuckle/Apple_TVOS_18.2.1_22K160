@interface CheckinRentalOperation
- (BOOL)_handleCheckinAckResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleResponse:(id)a3 error:(id *)a4;
- (BOOL)_runCheckinAckOperationWithResponseData:(id)a3 error:(id *)a4;
- (CheckinRentalOperation)init;
- (CheckinRentalOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4;
- (CheckinRentalOperation)initWithCheckinRequest:(id)a3;
- (CheckinRentalOperation)initWithSinfs:(id)a3;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)userAgent;
- (SSURLConnectionResponse)URLResponse;
- (id)_bodyData;
- (id)_bodyDataWithCheckinAckResponseData:(id)a3;
- (void)_run;
- (void)dealloc;
- (void)run;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation CheckinRentalOperation

- (CheckinRentalOperation)init
{
  return -[CheckinRentalOperation initWithAccountIdentifier:rentalKeyIdentifier:]( self,  "initWithAccountIdentifier:rentalKeyIdentifier:",  0LL,  0LL);
}

- (CheckinRentalOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
{
  if (![a3 unsignedLongLongValue] || !objc_msgSend(a4, "unsignedLongLongValue")) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CheckinRentalOperation.m",  55LL,  @"Must have account and rental key identifier");
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CheckinRentalOperation;
  v8 = -[CheckinRentalOperation init](&v10, "init");
  if (v8)
  {
    v8->_accountIdentifier = (NSNumber *)[a3 copy];
    v8->_rentalKeyIdentifier = (NSNumber *)[a4 copy];
  }

  return v8;
}

- (CheckinRentalOperation)initWithSinfs:(id)a3
{
  if (![a3 count]) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CheckinRentalOperation.m",  64LL,  @"Must have sinfs");
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CheckinRentalOperation;
  v6 = -[CheckinRentalOperation init](&v10, "init");
  if (v6)
  {
    v7 = (NSArray *)[a3 copy];
    v6->_sinfs = v7;
    if (v7)
    {
      v8 = -[SinfsArray initWithSINFs:](objc_alloc(&OBJC_CLASS___SinfsArray), "initWithSINFs:", v6->_sinfs);
      v6->_accountIdentifier = (NSNumber *)-[SinfsArray copyValueForProperty:error:]( v8,  "copyValueForProperty:error:",  @"SinfPropertyAccountIdentifier",  0LL);
      v6->_rentalKeyIdentifier = (NSNumber *)-[SinfsArray copyValueForProperty:error:]( v8,  "copyValueForProperty:error:",  @"SinfPropertyFairPlayKeyIdentifier",  0LL);
    }
  }

  return v6;
}

- (CheckinRentalOperation)initWithCheckinRequest:(id)a3
{
  id v5 = [a3 accountIdentifier];
  id v6 = [a3 rentalKeyIdentifier];
  id v7 = [a3 sinfs];
  if (v5 && v6) {
    return -[CheckinRentalOperation initWithAccountIdentifier:rentalKeyIdentifier:]( self,  "initWithAccountIdentifier:rentalKeyIdentifier:",  v5,  v6);
  }
  if (v7) {
    return -[CheckinRentalOperation initWithSinfs:](self, "initWithSinfs:", v7);
  }

  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CheckinRentalOperation;
  -[CheckinRentalOperation dealloc](&v3, "dealloc");
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)clientIdentifierHeader
{
  objc_super v3 = self->_clientIdentifierHeader;
  -[CheckinRentalOperation unlock](self, "unlock");
  return v3;
}

- (NSNumber)rentalKeyIdentifier
{
  return self->_rentalKeyIdentifier;
}

- (void)setClientIdentifierHeader:(id)a3
{
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)[a3 copy];
  }

  -[CheckinRentalOperation unlock](self, "unlock");
}

- (void)setUserAgent:(id)a3
{
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  -[CheckinRentalOperation unlock](self, "unlock");
}

- (SSURLConnectionResponse)URLResponse
{
  objc_super v3 = self->_urlResponse;
  -[CheckinRentalOperation unlock](self, "unlock");
  return v3;
}

- (NSString)userAgent
{
  objc_super v3 = self->_userAgent;
  -[CheckinRentalOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
}

- (id)_bodyData
{
  if (!-[NSNumber unsignedLongLongValue](self->_accountIdentifier, "unsignedLongLongValue")
    || !-[NSNumber unsignedLongLongValue](self->_rentalKeyIdentifier, "unsignedLongLongValue"))
  {
LABEL_29:
    v4 = 0LL;
    v35 = 0LL;
    v36 = 0LL;
    goto LABEL_30;
  }

  objc_super v3 = sub_10002271C();
  if (!v3)
  {
    id v12 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v12) {
      id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v13 = [v12 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    v15 = (os_log_s *)[v12 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if ((_DWORD)v14)
    {
      int v37 = 138412290;
      uint64_t v38 = objc_opt_class(self);
      uint64_t v16 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%@: Could not get rental bag",  &v37,  12);
      if (v16)
      {
        v17 = (void *)v16;
        v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        v33 = v18;
        SSFileLog(v12, @"%@");
      }
    }

    goto LABEL_29;
  }

  v4 = v3;
  v35 = 0LL;
  v36 = 0LL;
  if ((sub_100022990(&v36, &v35) & 1) == 0)
  {
    id v25 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v25) {
      id v25 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v26 = [v25 shouldLog];
    else {
      LODWORD(v27) = v26;
    }
    v28 = (os_log_s *)[v25 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v27 = v27;
    }
    else {
      v27 &= 2u;
    }
    if ((_DWORD)v27)
    {
      uint64_t v29 = objc_opt_class(self);
      int v37 = 138412290;
      uint64_t v38 = v29;
      uint64_t v30 = _os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "%@: Could not get rental bag request",  &v37,  12);
      if (v30)
      {
        v31 = (void *)v30;
        v32 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v30, 4LL);
        free(v31);
        v33 = v32;
        SSFileLog(v25, @"%@");
      }
    }

- (id)_bodyDataWithCheckinAckResponseData:(id)a3
{
  if (-[NSNumber unsignedLongLongValue](self->_accountIdentifier, "unsignedLongLongValue")
    && -[NSNumber unsignedLongLongValue](self->_rentalKeyIdentifier, "unsignedLongLongValue")
    && [a3 length])
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v6 = v5;
    if (a3) {
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", a3, @"checkin-ack-sar");
    }
    accountIdentifier = self->_accountIdentifier;
    if (accountIdentifier) {
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", accountIdentifier, @"dsid");
    }
    id v8 = -[ISDevice guid](+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"), "guid");
    if (v8) {
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v8, @"guid");
    }
    id v9 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "productType");
    if (v9) {
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v9, @"hw.model");
    }
    rentalKeyIdentifier = self->_rentalKeyIdentifier;
    if (rentalKeyIdentifier) {
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", rentalKeyIdentifier, @"rental-id");
    }
    v11 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  100LL,  0LL,  0LL);

    return v11;
  }

  else
  {
    id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v13) {
      id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v14 = [v13 shouldLog];
    else {
      LODWORD(v15) = v14;
    }
    uint64_t v16 = (os_log_s *)[v13 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      int v19 = 138412290;
      uint64_t v20 = objc_opt_class(self);
      uint64_t v17 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%@: Could not generate checkin ack request body",  &v19,  12);
      if (v17)
      {
        v18 = (void *)v17;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
        free(v18);
        SSFileLog(v13, @"%@");
      }
    }

    return 0LL;
  }

- (BOOL)_handleResponse:(id)a3 error:(id *)a4
{
  unsigned int v26 = 0LL;
  id v7 = [a3 objectForKey:kISFailureTypeKey];
  if (v7)
  {
    id v8 = v7;
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    id v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      *(_DWORD *)uint64_t v27 = 138412546;
      *(void *)&v27[4] = objc_opt_class(self);
      __int16 v28 = 2112;
      uint64_t v29 = v8;
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Received failure type: %@",  v27,  22);
      if (v13)
      {
        unsigned int v14 = (void *)v13;
        uint64_t v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        id v25 = v15;
        SSFileLog(v9, @"%@");
      }
    }

    if ((objc_opt_respondsToSelector(v8, "intValue") & 1) == 0)
    {
      id v23 = (id)ISError(2LL, 0LL, 0LL);
      goto LABEL_23;
    }

    uint64_t v16 = (void *)SSError(SSServerErrorDomain, (int)[v8 intValue], 0, 0);
  }

  else
  {
    *(void *)uint64_t v27 = 0LL;
    id v17 = [a3 objectForKey:@"rental-bag-response"];
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    {
      id v19 = [a3 objectForKey:@"checkin-sar"];
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0 && sub_100023580(v17, v19))
      {
        unsigned __int8 v21 = -[CheckinRentalOperation _runCheckinAckOperationWithResponseData:error:]( self,  "_runCheckinAckOperationWithResponseData:error:",  *(void *)v27,  &v26);

        if ((v21 & 1) != 0)
        {
          BOOL result = 1;
          goto LABEL_24;
        }
      }
    }

    uint64_t v16 = (void *)ISError(0LL, 0LL, 0LL);
  }

  id v23 = objc_msgSend(v16, "errorBySettingFatalError:", 1, v25);
LABEL_23:
  id v24 = v23;
  BOOL result = 0;
  unsigned int v26 = v24;
LABEL_24:
  if (a4) {
    *a4 = v26;
  }
  return result;
}

- (BOOL)_handleCheckinAckResponse:(id)a3 error:(id *)a4
{
  id v6 = [a3 objectForKey:kISFailureTypeKey];
  id v7 = v6;
  if (v6)
  {
    id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v8) {
      id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    uint64_t v11 = (os_log_s *)[v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v15 = 138412546;
      uint64_t v16 = objc_opt_class(self);
      __int16 v17 = 2112;
      id v18 = v7;
      uint64_t v12 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Received failure type: %@",  &v15,  22);
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
        free(v13);
        SSFileLog(v8, @"%@");
      }
    }

    if ((objc_opt_respondsToSelector(v7, "intValue") & 1) == 0)
    {
      id v6 = (id)ISError(2LL, 0LL, 0LL);
      if (!a4) {
        return v7 == 0LL;
      }
      goto LABEL_16;
    }

    id v6 = objc_msgSend((id)ISError(0, 0, 0), "errorBySettingFatalError:", 1);
  }

  if (a4) {
LABEL_16:
  }
    *a4 = v6;
  return v7 == 0LL;
}

- (void)_run
{
  uint64_t v20 = 0LL;
  id v3 = -[CheckinRentalOperation _bodyData](self, "_bodyData");
  if (v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    id v5 = -[SSAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccountIdentifier:",  self->_accountIdentifier);
    [v4 setAuthenticationContext:v5];

    id v6 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
    [v4 setDataProvider:v6];
    -[DaemonProtocolDataProvider setShouldProcessDialogs:](v6, "setShouldProcessDialogs:", 0LL);
    id v7 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    -[SSMutableURLRequestProperties setCachePolicy:](v7, "setCachePolicy:", 1LL);
    -[SSMutableURLRequestProperties setClientIdentifier:]( v7,  "setClientIdentifier:",  -[CheckinRentalOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
    -[SSMutableURLRequestProperties setHTTPBody:](v7, "setHTTPBody:", v3);
    -[SSMutableURLRequestProperties setHTTPMethod:](v7, "setHTTPMethod:", @"POST");
    -[SSMutableURLRequestProperties setURLBagKey:](v7, "setURLBagKey:", @"rental-checkin");
    id v8 = -[CheckinRentalOperation userAgent](self, "userAgent");
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v7,  "setValue:forHTTPHeaderField:",  v8,  SSHTTPHeaderUserAgent);
    [v4 setRequestProperties:v7];

    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    uint64_t v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v21 = 138412290;
      uint64_t v22 = objc_opt_class(self);
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Checking in rental",  &v21,  12);
      if (v13)
      {
        unsigned int v14 = (void *)v13;
        int v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        id v19 = v15;
        SSFileLog(v9, @"%@");
      }
    }

    if (-[CheckinRentalOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v4,  &v20,  v19))
    {
      id v16 = -[DaemonProtocolDataProvider output](v6, "output");
      id v3 = (id)-[CheckinRentalOperation _handleResponse:error:](self, "_handleResponse:error:", v16, &v20);
      __int16 v17 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v16,  100LL,  0LL,  0LL);
      -[CheckinRentalOperation lock](self, "lock");

      self->_urlResponse = -[SSURLConnectionResponse initWithURLResponse:bodyData:]( [SSURLConnectionResponse alloc],  "initWithURLResponse:bodyData:",  [v4 response],  v17);
      -[CheckinRentalOperation unlock](self, "unlock");
    }

    else
    {
      id v3 = 0LL;
    }

    uint64_t v18 = v20;
  }

  else
  {
    uint64_t v18 = ISError(15LL, 0LL, 0LL);
    uint64_t v20 = v18;
  }

  -[CheckinRentalOperation setError:](self, "setError:", v18);
  -[CheckinRentalOperation setSuccess:](self, "setSuccess:", v3);
}

- (BOOL)_runCheckinAckOperationWithResponseData:(id)a3 error:(id *)a4
{
  id v23 = 0LL;
  id v6 = -[CheckinRentalOperation _bodyDataWithCheckinAckResponseData:](self, "_bodyDataWithCheckinAckResponseData:", a3);
  if (!v6)
  {
    BOOL v20 = 0;
    id v23 = (void *)ISError(15LL, 0LL, 0LL);
    if (!a4) {
      return v20;
    }
    goto LABEL_19;
  }

  id v7 = v6;
  id v8 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  id v9 = -[SSAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccountIdentifier:",  self->_accountIdentifier);
  [v8 setAuthenticationContext:v9];

  unsigned int v10 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v8 setDataProvider:v10];
  -[DaemonProtocolDataProvider setShouldProcessDialogs:](v10, "setShouldProcessDialogs:", 0LL);
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setCachePolicy:](v11, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setClientIdentifier:]( v11,  "setClientIdentifier:",  -[CheckinRentalOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  -[SSMutableURLRequestProperties setHTTPBody:](v11, "setHTTPBody:", v7);
  -[SSMutableURLRequestProperties setHTTPMethod:](v11, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setURLBagKey:](v11, "setURLBagKey:", @"rental-ack-checkin");
  uint64_t v12 = -[CheckinRentalOperation userAgent](self, "userAgent");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v11,  "setValue:forHTTPHeaderField:",  v12,  SSHTTPHeaderUserAgent);
  [v8 setRequestProperties:v11];

  id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v13) {
    id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v14 = [v13 shouldLog];
  else {
    LODWORD(v15) = v14;
  }
  id v16 = (os_log_s *)[v13 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    uint64_t v15 = v15;
  }
  else {
    v15 &= 2u;
  }
  if ((_DWORD)v15)
  {
    int v24 = 138412290;
    uint64_t v25 = objc_opt_class(self);
    uint64_t v17 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Acking rental checkin",  &v24,  12);
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      id v19 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
      free(v18);
      uint64_t v22 = v19;
      SSFileLog(v13, @"%@");
    }
  }

  if (-[CheckinRentalOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v8,  &v23,  v22)) {
    BOOL v20 = -[CheckinRentalOperation _handleCheckinAckResponse:error:]( self,  "_handleCheckinAckResponse:error:",  -[DaemonProtocolDataProvider output](v10, "output"),  &v23);
  }
  else {
    BOOL v20 = 0;
  }

  if (a4) {
LABEL_19:
  }
    *a4 = v23;
  return v20;
}

@end