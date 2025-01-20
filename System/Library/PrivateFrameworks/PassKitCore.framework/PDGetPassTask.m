@interface PDGetPassTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 updateContext:(id)a4 source:(int64_t)a5;
- (BOOL)_matchesGetPassTask:(id)a3;
- (BOOL)_matchesPersonalizePassTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (BOOL)serverRequested;
- (BOOL)userRequested;
- (NSString)serialNumber;
- (PDGetPassTask)initWithCoder:(id)a3;
- (PDGetPassTask)initWithWebService:(id)a3 updateContext:(id)a4 source:(int64_t)a5;
- (PDPassUpdateContext)context;
- (id)_resultFromResponseData:(id)a3;
- (id)description;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (int64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setServerRequested:(BOOL)a3;
- (void)setUserRequested:(BOOL)a3;
@end

@implementation PDGetPassTask

+ (id)taskWithWebService:(id)a3 updateContext:(id)a4 source:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithWebService:v9 updateContext:v8 source:a5];

  return v10;
}

- (PDGetPassTask)initWithWebService:(id)a3 updateContext:(id)a4 source:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDGetPassTask;
  id v10 = -[PDWebServiceConnectionTask initWithWebService:](&v13, "initWithWebService:", a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_context, a4);
    v11->_source = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDGetPassTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDGetPassTask;
  v6 = -[PDWebServiceConnectionTask initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PDPassUpdateContext, v5),  @"context");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    context = v6->_context;
    v6->_context = (PDPassUpdateContext *)v8;

    v6->_source = (int64_t)[v4 decodeIntegerForKey:@"source"];
    v6->_userRequested = [v4 decodeBoolForKey:@"userRequested"];
    v6->_serverRequested = [v4 decodeBoolForKey:@"serverRequested"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDGetPassTask;
  id v4 = a3;
  -[PDWebServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, @"context", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_source forKey:@"source"];
  [v4 encodeBool:self->_userRequested forKey:@"userRequested"];
  [v4 encodeBool:self->_serverRequested forKey:@"serverRequested"];
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask serialNumber](self, "serialNumber"));
  if (v3) {
    BOOL v5 = v4 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;

  return v6;
}

- (NSString)serialNumber
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serialNumber]);

  return (NSString *)v3;
}

- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask serialNumber](self, "serialNumber"));
    unsigned __int8 v11 = [v6 isEqualToString:v10];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)method
{
  return @"GET";
}

- (id)endpointComponents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[PDGetPassTask serialNumber](self, "serialNumber"));
  BOOL v5 = (void *)v4;
  id v6 = 0LL;
  if (v3 && v4)
  {
    v8[0] = @"v1";
    v8[1] = @"passes";
    v8[2] = v3;
    v8[3] = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 4LL));
  }

  return v6;
}

- (id)headerFields
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask context](self, "context"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationToken]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ApplePass %@", v5));

  [v3 setObject:v6 forKey:@"Authorization"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask context](self, "context"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastModifiedTag]);

  if (v8) {
    [v3 setObject:v8 forKey:@"If-Modified-Since"];
  }

  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    v15 = self;
    __int16 v16 = 2048;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ got response with code %ld",  (uint8_t *)&v14,  0x16u);
  }

  if (v8 == (id)401)
  {
    -[PDWebServiceConnectionTask reportAuthenticationFailure](self, "reportAuthenticationFailure");
    goto LABEL_15;
  }

  if (v8 == (id)304)
  {
    unsigned __int8 v11 = objc_alloc_init(&OBJC_CLASS___PDGetPassResult);
  }

  else
  {
    if (v8 != (id)200)
    {
      -[PDWebServiceConnectionTask reportUnexpectedResponseCode:](self, "reportUnexpectedResponseCode:", v8);
      goto LABEL_15;
    }

    unsigned __int8 v11 = (PDGetPassResult *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask _resultFromResponseData:](self, "_resultFromResponseData:", v7));
  }

  v12 = v11;
  if (!v11)
  {
LABEL_15:
    -[PDNetworkTask fail](self, "fail");
    goto LABEL_16;
  }

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pk_valueForHTTPHeaderField:", @"Last-Modified"));
  -[PDGetPassResult setLastModified:](v12, "setLastModified:", v13);

  -[PDNetworkTask deliverResult:](self, "deliverResult:", v12);
  -[PDNetworkTask succeed](self, "succeed");

LABEL_16:
}

- (void)handleError:(id)a3
{
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask serialNumber](self, "serialNumber"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask context](self, "context"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastModifiedTag]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Get pass task (pass type %@, serial number %@, if-modified-since %@; with web service url %@)",
                   v3,
                   v4,
                   v6,
                   v8));

  return v9;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  if ((-[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDGetPassTask, a2)) & 1) != 0) {
    return 1;
  }
  else {
    return -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, v4));
  }
}

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDGetPassTask, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && -[PDGetPassTask _matchesGetPassTask:](self, "_matchesGetPassTask:", v4))
  {
    if (-[PDGetPassTask userRequested](self, "userRequested"))
    {
      int64_t v8 = 1LL;
    }

    else if (self->_source == 2)
    {
      int64_t v8 = 5LL;
    }

    else
    {
      int64_t v8 = 2LL;
    }
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    {
      if (-[PDGetPassTask _matchesPersonalizePassTask:](self, "_matchesPersonalizePassTask:", v4)) {
        int64_t v8 = 5LL;
      }
      else {
        int64_t v8 = 0LL;
      }
    }

    else
    {
      int64_t v8 = 0LL;
    }
  }

  return v8;
}

- (int64_t)actionForActiveTask:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDGetPassTask, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && -[PDGetPassTask _matchesGetPassTask:](self, "_matchesGetPassTask:", v4))
  {
    int64_t v8 = 5LL;
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    {
      if (-[PDGetPassTask _matchesPersonalizePassTask:](self, "_matchesPersonalizePassTask:", v4)) {
        int64_t v8 = 5LL;
      }
      else {
        int64_t v8 = 0LL;
      }
    }

    else
    {
      int64_t v8 = 0LL;
    }
  }

  return v8;
}

- (BOOL)_matchesPersonalizePassTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 webService]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceURL]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  if ([v6 isEqual:v8])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
    if ([v9 isEqualToString:v10])
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask serialNumber](self, "serialNumber"));
      unsigned __int8 v13 = [v11 isEqualToString:v12];
    }

    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)_matchesGetPassTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 webService]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceURL]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  if ([v6 isEqual:v8])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
    if ([v9 isEqualToString:v10])
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask serialNumber](self, "serialNumber"));
      unsigned __int8 v13 = [v11 isEqualToString:v12];
    }

    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)_resultFromResponseData:(id)a3
{
  if (!a3)
  {
    uint64_t v19 = PDBasicError(@"Missing response data");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[PDWebServiceConnectionTask reportMalformedResponseError:](self, "reportMalformedResponseError:", v20);

    return 0LL;
  }

  id v39 = 0LL;
  id v40 = 0LL;
  id v4 = +[PKPass createWithData:warnings:error:](&OBJC_CLASS___PKPass, "createWithData:warnings:error:", a3, &v40, &v39);
  id v5 = v40;
  id v10 = v39;
  if (v4)
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if ((v13 & 1) != 0)
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask serialNumber](self, "serialNumber"));
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) != 0)
      {
        if (v5)
        {
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_100260414;
          v36[3] = &unk_10064FFD8;
          id v37 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
          v38 = self;
          id v17 = v37;
          [v5 enumerateObjectsUsingBlock:v36];
          -[PDNetworkTask reportWarnings:](self, "reportWarnings:", v17);
        }

        v18 = objc_alloc_init(&OBJC_CLASS___PDGetPassResult);
        -[PDGetPassResult setPass:](v18, "setPass:", v4);
        goto LABEL_14;
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetPassTask serialNumber](self, "serialNumber"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      id v29 = PDTaskError( 5LL,  self,  0LL,  @"Requested serial number %@, received serial number %@",  v30,  v31,  v32,  v33,  (uint64_t)v23);
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
      id v29 = PDTaskError( 5LL,  self,  0LL,  @"Requested pass of type %@, received pass of type %@",  v25,  v26,  v27,  v28,  (uint64_t)v23);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(v29);
    -[PDNetworkTask reportError:](self, "reportError:", v34);
  }

  else
  {
    id v22 = PDTaskError(4LL, self, v10, @"Received invalid pass data", v6, v7, v8, v9, v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[PDNetworkTask reportError:](self, "reportError:", v23);
  }

  v18 = 0LL;
LABEL_14:

  return v18;
}

- (PDPassUpdateContext)context
{
  return self->_context;
}

- (int64_t)source
{
  return self->_source;
}

- (BOOL)userRequested
{
  return self->_userRequested;
}

- (void)setUserRequested:(BOOL)a3
{
  self->_userRequested = a3;
}

- (BOOL)serverRequested
{
  return self->_serverRequested;
}

- (void)setServerRequested:(BOOL)a3
{
  self->_serverRequested = a3;
}

- (void).cxx_destruct
{
}

@end