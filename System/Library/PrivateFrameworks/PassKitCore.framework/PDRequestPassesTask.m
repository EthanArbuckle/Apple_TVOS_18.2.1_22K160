@interface PDRequestPassesTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 issuerBindingData:(id)a4;
- (BOOL)_matchesRequestPassesTask:(id)a3;
- (BOOL)backoffComplete;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (PDRequestPassesTask)initWithCoder:(id)a3;
- (PKIssuerBindingData)issuerBindingData;
- (id)_initTaskWithWebService:(id)a3 issuerBindingData:(id)a4;
- (id)_resultFromResponseData:(id)a3 multiplePasses:(BOOL)a4;
- (id)bodyDictionary;
- (id)description;
- (id)method;
- (id)queryFields;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
@end

@implementation PDRequestPassesTask

+ (id)taskWithWebService:(id)a3 issuerBindingData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) _initTaskWithWebService:v7 issuerBindingData:v6];

  return v8;
}

- (id)_initTaskWithWebService:(id)a3 issuerBindingData:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDRequestPassesTask;
  id v8 = -[PDWebServiceConnectionTask initWithWebService:](&v11, "initWithWebService:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_issuerBindingData, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDRequestPassesTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDRequestPassesTask;
  id v6 = -[PDWebServiceConnectionTask initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKIssuerBindingData, v5),  @"issuerBindingData");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    issuerBindingData = v6->_issuerBindingData;
    v6->_issuerBindingData = (PKIssuerBindingData *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDRequestPassesTask;
  id v4 = a3;
  -[PDWebServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_issuerBindingData,  @"issuerBindingData",  v5.receiver,  v5.super_class);
}

- (BOOL)isValid
{
  return self->_issuerBindingData != 0LL;
}

- (id)method
{
  return @"POST";
}

- (id)queryFields
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKIssuerBindingData sessionIdentifier](self->_issuerBindingData, "sessionIdentifier"));
  if (v2) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v2,  @"sessionIdentifier"));
  }
  else {
    v3 = 0LL;
  }

  return v3;
}

- (BOOL)backoffComplete
{
  return 1;
}

- (id)bodyDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKIssuerBindingData signedData](self->_issuerBindingData, "signedData"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 hexEncoding]);
  [v3 safelySetObject:v5 forKey:@"issuerBindingData"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKIssuerBindingData createdKeyHash](self->_issuerBindingData, "createdKeyHash"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 hexEncoding]);
  [v3 safelySetObject:v7 forKey:@"keyHash"];

  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    v16 = self;
    __int16 v17 = 2048;
    id v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ got response with code %ld",  (uint8_t *)&v15,  0x16u);
  }

  if (v8 != (id)200)
  {
    if (v8 == (id)401) {
      -[PDWebServiceConnectionTask reportAuthenticationFailure](self, "reportAuthenticationFailure");
    }
    else {
      -[PDWebServiceConnectionTask reportUnexpectedResponseCode:](self, "reportUnexpectedResponseCode:", v8);
    }
    goto LABEL_12;
  }

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v6 MIMEType]);
  id v12 = [v11 isEqualToString:@"application/vnd.apple.pkpasses"];

  uint64_t v13 = objc_claimAutoreleasedReturnValue( -[PDRequestPassesTask _resultFromResponseData:multiplePasses:]( self,  "_resultFromResponseData:multiplePasses:",  v7,  v12));
  if (!v13)
  {
LABEL_12:
    -[PDNetworkTask fail](self, "fail");
    goto LABEL_13;
  }

  v14 = (void *)v13;
  -[PDNetworkTask deliverResult:](self, "deliverResult:", v13);
  -[PDNetworkTask succeed](self, "succeed");

LABEL_13:
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  return -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDRequestPassesTask, a2));
}

- (int64_t)actionForInactiveTask:(id)a3
{
  if (-[PDRequestPassesTask _matchesRequestPassesTask:](self, "_matchesRequestPassesTask:", a3)) {
    return 2LL;
  }
  else {
    return 0LL;
  }
}

- (int64_t)actionForActiveTask:(id)a3
{
  if (-[PDRequestPassesTask _matchesRequestPassesTask:](self, "_matchesRequestPassesTask:", a3)) {
    return 5LL;
  }
  else {
    return 0LL;
  }
}

- (BOOL)_matchesRequestPassesTask:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 webService]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceURL]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  if ([v6 isEqual:v8])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 issuerBindingData]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDRequestPassesTask issuerBindingData](self, "issuerBindingData"));
    unsigned __int8 v11 = [v9 isEqual:v10];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)_resultFromResponseData:(id)a3 multiplePasses:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (v4)
    {
      id v8 = NSTemporaryDirectory();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKIssuerBindingData sessionIdentifier](self->_issuerBindingData, "sessionIdentifier"));
      id v11 = (id)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v10]);

      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v12 removeItemAtPath:v11 error:0];

      [v6 writeToFile:v11 atomically:1];
      id v13 = objc_alloc(&OBJC_CLASS___PKPassesXPCContainer);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11));
      id v15 = [v13 initWithFileURL:v14];

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_1002621E4;
      v32[3] = &unk_100650000;
      v16 = v7;
      v33 = v16;
      [v15 unarchivePassesWithBlock:v32];
      __int16 v17 = -[PDRequestPassesResult initWithPassesData:error:]( objc_alloc(&OBJC_CLASS___PDRequestPassesResult),  "initWithPassesData:error:",  v16,  0LL);
    }

    else
    {
      id v31 = 0LL;
      id v11 = +[PKPass createWithData:warnings:error:]( &OBJC_CLASS___PKPass,  "createWithData:warnings:error:",  v6,  0LL,  &v31);
      id v15 = v31;
      if (v11)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v11 archiveData]);
        -[NSMutableArray safelyAddObject:](v7, "safelyAddObject:", v24);

        v25 = objc_alloc(&OBJC_CLASS___PDRequestPassesResult);
        v26 = v7;
        id v27 = 0LL;
      }

      else
      {
        id v28 = PDTaskError(4LL, self, v15, @"Received invalid pass data", v20, v21, v22, v23, (uint64_t)v31);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        -[PDNetworkTask reportError:](self, "reportError:", v29);

        v25 = objc_alloc(&OBJC_CLASS___PDRequestPassesResult);
        v26 = 0LL;
        id v27 = v15;
      }

      __int16 v17 = -[PDRequestPassesResult initWithPassesData:error:](v25, "initWithPassesData:error:", v26, v27);
    }
  }

  else
  {
    uint64_t v18 = PDBasicError(@"Missing response data");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[PDWebServiceConnectionTask reportMalformedResponseError:](self, "reportMalformedResponseError:", v19);

    __int16 v17 = 0LL;
  }

  return v17;
}

- (void)handleError:(id)a3
{
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDRequestPassesTask issuerBindingData](self, "issuerBindingData"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceURL]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Request pass task (issuerData: %@); with web service url %@"),
                   v4,
                   v6));

  return v7;
}

- (PKIssuerBindingData)issuerBindingData
{
  return self->_issuerBindingData;
}

- (void).cxx_destruct
{
}

@end