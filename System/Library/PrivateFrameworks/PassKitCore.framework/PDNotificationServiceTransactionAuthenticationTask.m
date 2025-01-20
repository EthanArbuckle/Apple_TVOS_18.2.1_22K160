@interface PDNotificationServiceTransactionAuthenticationTask
+ (BOOL)supportsSecureCoding;
+ (id)transactionAuthenticationTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 transactionServiceIdentifier:(id)a5 authenticationResultsData:(id)a6 signature:(id)a7;
- (BOOL)backoffComplete;
- (BOOL)isValid;
- (BOOL)matchesTask:(id)a3;
- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4;
- (NSData)authenticationResultsData;
- (NSData)signature;
- (NSString)dpanIdentifier;
- (NSString)transactionServiceIdentifier;
- (PDNotificationServiceTransactionAuthenticationTask)initWithCoder:(id)a3;
- (PDNotificationServiceTransactionAuthenticationTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 transactionServiceIdentifier:(id)a5 authenticationResultsData:(id)a6 signature:(id)a7;
- (id)_resultFromResponseData:(id)a3;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (int64_t)taskType;
- (void)_reportAuthenticationFailure;
- (void)_reportForbiddenErrorResponse:(id)a3;
- (void)_reportUnexpectedResponseCode:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
@end

@implementation PDNotificationServiceTransactionAuthenticationTask

+ (id)transactionAuthenticationTaskWithNotificationService:(id)a3 dpanIdentifier:(id)a4 transactionServiceIdentifier:(id)a5 authenticationResultsData:(id)a6 signature:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [objc_alloc((Class)a1) initWithNotificationService:v16 dpanIdentifier:v15 transactionServiceIdentifier:v14 authenticationResultsData:v13 signature:v12];

  return v17;
}

- (PDNotificationServiceTransactionAuthenticationTask)initWithNotificationService:(id)a3 dpanIdentifier:(id)a4 transactionServiceIdentifier:(id)a5 authenticationResultsData:(id)a6 signature:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PDNotificationServiceTransactionAuthenticationTask;
  id v17 = -[PDNotificationServiceConnectionTask initWithNotificationService:](&v20, "initWithNotificationService:", a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dpanIdentifier, a4);
    objc_storeStrong((id *)&v18->_transactionServiceIdentifier, a5);
    objc_storeStrong((id *)&v18->_authenticationResultsData, a6);
    objc_storeStrong((id *)&v18->_signature, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceTransactionAuthenticationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDNotificationServiceTransactionAuthenticationTask;
  v6 = -[PDNotificationServiceConnectionTask initWithCoder:](&v23, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"dpanIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    dpanIdentifier = v6->_dpanIdentifier;
    v6->_dpanIdentifier = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"transactionServiceIdentifier");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    transactionServiceIdentifier = v6->_transactionServiceIdentifier;
    v6->_transactionServiceIdentifier = (NSString *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v14),  @"authenticationResultsData");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    authenticationResultsData = v6->_authenticationResultsData;
    v6->_authenticationResultsData = (NSData *)v16;

    id v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v18), @"signature");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    signature = v6->_signature;
    v6->_signature = (NSData *)v20;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDNotificationServiceTransactionAuthenticationTask;
  id v4 = a3;
  -[PDNotificationServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dpanIdentifier, @"dpanIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_transactionServiceIdentifier forKey:@"transactionServiceIdentifier"];
  [v4 encodeObject:self->_authenticationResultsData forKey:@"authenticationResultsData"];
  [v4 encodeObject:self->_signature forKey:@"signature"];
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v6 = [v5 serviceType];

  if (v4 && self->_dpanIdentifier && self->_transactionServiceIdentifier && self->_authenticationResultsData)
  {
    if (self->_signature) {
      BOOL v7 = v6 == 0LL;
    }
    else {
      BOOL v7 = 0;
    }
    BOOL v8 = v7;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)taskType
{
  return 3LL;
}

- (id)endpointComponents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);

  if (v4
    && self->_dpanIdentifier
    && self->_transactionServiceIdentifier
    && (objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService")),
        id v6 = [v5 serviceType],
        v5,
        !v6))
  {
    v11[0] = @"devices";
    v11[1] = v4;
    dpanIdentifier = self->_dpanIdentifier;
    v11[2] = @"dpan";
    v11[3] = dpanIdentifier;
    transactionServiceIdentifier = self->_transactionServiceIdentifier;
    v11[4] = @"transactions";
    v11[5] = transactionServiceIdentifier;
    v11[6] = @"authenticationResults";
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 7LL));
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

- (id)method
{
  return @"POST";
}

- (id)bodyDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  self->_authenticationResultsData,  0LL,  0LL));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"authenticationResults");

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->_signature, "base64EncodedStringWithOptions:", 0LL));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"authenticationResultsSignature");

  id v6 = -[NSMutableDictionary copy](v3, "copy");
  return v6;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);
  dpanIdentifier = self->_dpanIdentifier;
  transactionServiceIdentifier = self->_transactionServiceIdentifier;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Transaction Authentication Task (Device ID: %@, DPAN ID: %@, Transaction ID: %@, Service URL: %@)",  v4,  dpanIdentifier,  transactionServiceIdentifier,  v8));

  return v9;
}

- (BOOL)matchesTask:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PDNotificationServiceTransactionAuthenticationTask;
  if (-[PDNotificationServiceConnectionTask matchesTask:](&v25, "matchesTask:", v4))
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDNotificationServiceTransactionAuthenticationTask, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      id v7 = v4;
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceTransactionAuthenticationTask dpanIdentifier](self, "dpanIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dpanIdentifier]);
      id v10 = v8;
      id v11 = v9;
      uint64_t v12 = v11;
      if (v10 == v11)
      {
      }

      else
      {
        LOBYTE(v13) = 0;
        uint64_t v14 = v11;
        id v15 = v10;
        if (!v10 || !v11) {
          goto LABEL_20;
        }
        unsigned int v16 = [v10 isEqualToString:v11];

        if (!v16)
        {
          LOBYTE(v13) = 0;
LABEL_21:

          goto LABEL_22;
        }
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationServiceTransactionAuthenticationTask transactionServiceIdentifier]( self,  "transactionServiceIdentifier"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 transactionServiceIdentifier]);
      id v15 = v17;
      id v19 = v18;
      uint64_t v14 = v19;
      if (v15 == v19)
      {
      }

      else
      {
        LOBYTE(v13) = 0;
        uint64_t v20 = v19;
        v21 = v15;
        if (!v15 || !v19) {
          goto LABEL_19;
        }
        unsigned int v13 = [v15 isEqualToString:v19];

        if (!v13) {
          goto LABEL_20;
        }
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationServiceTransactionAuthenticationTask authenticationResultsData]( self,  "authenticationResultsData"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 authenticationResultsData]);
      if (PKEqualObjects(v21, v20))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceTransactionAuthenticationTask signature](self, "signature"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v7 signature]);
        LOBYTE(v13) = PKEqualObjects(v24, v22);
      }

      else
      {
        LOBYTE(v13) = 0;
      }

- (BOOL)backoffComplete
{
  return 1;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = [a3 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    unsigned int v13 = self;
    __int16 v14 = 2048;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ got response with code %ld",  (uint8_t *)&v12,  0x16u);
  }

  if (v7 == (id)403)
  {
    id v11 = -[PDNotificationServiceConnectionForbiddenErrorResponse initWithData:]( objc_alloc(&OBJC_CLASS___PDNotificationServiceConnectionForbiddenErrorResponse),  "initWithData:",  v6);
    -[PDNotificationServiceTransactionAuthenticationTask _reportForbiddenErrorResponse:]( self,  "_reportForbiddenErrorResponse:",  v11);
    -[PDNetworkTask fail](self, "fail");
  }

  else if (v7 == (id)401)
  {
    -[PDNotificationServiceTransactionAuthenticationTask _reportAuthenticationFailure]( self,  "_reportAuthenticationFailure");
    -[PDNetworkTask failForAuthentication](self, "failForAuthentication");
  }

  else if (v7 == (id)200)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationServiceTransactionAuthenticationTask _resultFromResponseData:]( self,  "_resultFromResponseData:",  v6));
    -[PDNetworkTask deliverResult:](self, "deliverResult:", v10);

    -[PDNetworkTask succeed](self, "succeed");
  }

  else
  {
    -[PDNotificationServiceTransactionAuthenticationTask _reportUnexpectedResponseCode:]( self,  "_reportUnexpectedResponseCode:",  v7);
    -[PDNetworkTask fail](self, "fail");
  }
}

- (void)handleError:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    BOOL v8 = self;
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Connection Error for Task: %@ (%@)",  (uint8_t *)&v7,  0x16u);
  }

  -[PDNetworkTask fail](self, "fail");
}

- (BOOL)pertainsToNotificationService:(id)a3 andDPANIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  unsigned int v9 = [v8 isEqual:v7];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceTransactionAuthenticationTask dpanIdentifier](self, "dpanIdentifier"));
    unsigned __int8 v11 = [v10 isEqualToString:v6];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)_reportAuthenticationFailure
{
  id v7 = PDTaskError(0LL, self, 0LL, @"Authentication failure", v2, v3, v4, v5, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[PDNetworkTask reportError:](self, "reportError:", v9);
}

- (void)_reportUnexpectedResponseCode:(int64_t)a3
{
  id v8 = PDTaskError(1LL, self, 0LL, @"Unexpected response code %ld", v3, v4, v5, v6, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  -[PDNetworkTask reportError:](self, "reportError:", v9);
}

- (void)_reportForbiddenErrorResponse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 errorCode];
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 serverDebugDescription]);
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = self;
      __int16 v19 = 2048;
      id v20 = v7;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ got forbidden error code %ld, %@",  buf,  0x20u);
    }

    id v9 = [v4 errorCode];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 serverDebugDescription]);
    id v15 = PDTaskError((uint64_t)v9, self, 0LL, @"%@", v11, v12, v13, v14, (uint64_t)v10);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[PDNetworkTask reportError:](self, "reportError:", v16);
  }
}

- (id)_resultFromResponseData:(id)a3
{
  id v3 = a3;
  id v4 = -[PDNotificationServiceTransactionAuthenticationResponse initWithData:]( objc_alloc(&OBJC_CLASS___PDNotificationServiceTransactionAuthenticationResponse),  "initWithData:",  v3);

  return v4;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSString)transactionServiceIdentifier
{
  return self->_transactionServiceIdentifier;
}

- (NSData)authenticationResultsData
{
  return self->_authenticationResultsData;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
}

@end