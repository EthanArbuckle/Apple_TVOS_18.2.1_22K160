@interface PDRegistrationTask
+ (BOOL)supportsSecureCoding;
+ (id)_taskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5 requestedStatus:(unint64_t)a6;
+ (id)registerTaskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5;
+ (id)unregisterTaskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5;
- (BOOL)_matchesPersonalizePassTask:(id)a3;
- (BOOL)_matchesRegistrationTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (NSString)authenticationToken;
- (NSString)serialNumber;
- (PDRegistrationTask)initWithCoder:(id)a3;
- (PDRegistrationTask)initWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5 requestedStatus:(unint64_t)a6;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (unint64_t)requestedStatus;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setAuthenticationToken:(id)a3;
- (void)setRequestedStatus:(unint64_t)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation PDRegistrationTask

+ (id)registerTaskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5
{
  return _[a1 _taskWithWebService:a3 serialNumber:a4 authToken:a5 requestedStatus:1];
}

+ (id)unregisterTaskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5
{
  return _[a1 _taskWithWebService:a3 serialNumber:a4 authToken:a5 requestedStatus:2];
}

+ (id)_taskWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5 requestedStatus:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithWebService:v12 serialNumber:v11 authToken:v10 requestedStatus:a6];

  return v13;
}

- (PDRegistrationTask)initWithWebService:(id)a3 serialNumber:(id)a4 authToken:(id)a5 requestedStatus:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDRegistrationTask;
  id v12 = -[PDWebServiceConnectionTask initWithWebService:](&v18, "initWithWebService:", a3);
  if (v12)
  {
    id v13 = (NSString *)[v10 copy];
    serialNumber = v12->_serialNumber;
    v12->_serialNumber = v13;

    v15 = (NSString *)[v11 copy];
    authenticationToken = v12->_authenticationToken;
    v12->_authenticationToken = v15;

    v12->_requestedStatus = a6;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDRegistrationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDRegistrationTask;
  v6 = -[PDWebServiceConnectionTask initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"serialNumber");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    serialNumber = v6->_serialNumber;
    v6->_serialNumber = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"authenticationToken");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    authenticationToken = v6->_authenticationToken;
    v6->_authenticationToken = (NSString *)v12;

    v6->_requestedStatus = (unint64_t)[v4 decodeIntegerForKey:@"requestedStatus"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDRegistrationTask;
  id v4 = a3;
  -[PDWebServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_serialNumber, @"serialNumber", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_authenticationToken forKey:@"authenticationToken"];
  [v4 encodeInteger:self->_requestedStatus forKey:@"requestedStatus"];
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDRegistrationTask serialNumber](self, "serialNumber"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIdentifier]);

  if (v3) {
    BOOL v7 = v4 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v9 = !v7 && v6 != 0LL;

  return v9;
}

- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDRegistrationTask serialNumber](self, "serialNumber"));
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
  if ((id)-[PDRegistrationTask requestedStatus](self, "requestedStatus") == (id)1) {
    return @"POST";
  }
  else {
    return @"DELETE";
  }
}

- (id)endpointComponents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDRegistrationTask serialNumber](self, "serialNumber"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIdentifier]);

  id v7 = 0LL;
  if (v6 && v3 && v4)
  {
    v9[0] = @"v1";
    v9[1] = @"devices";
    v9[2] = v6;
    v9[3] = @"registrations";
    v9[4] = v3;
    v9[5] = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 6LL));
  }

  return v7;
}

- (id)headerFields
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDRegistrationTask authenticationToken](self, "authenticationToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ApplePass %@", v2));

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v3,  @"Authorization"));
  return v4;
}

- (id)bodyDictionary
{
  if ((id)-[PDRegistrationTask requestedStatus](self, "requestedStatus") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pushToken]);
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v4,  @"pushToken"));
  }

  else
  {
    objc_super v5 = 0LL;
  }

  return v5;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  unint64_t v5 = (unint64_t)[a3 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    unsigned int v9 = self;
    __int16 v10 = 2048;
    unint64_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ got response with code %ld",  (uint8_t *)&v8,  0x16u);
  }

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 0xC8)
  {
    -[PDNetworkTask succeed](self, "succeed");
  }

  else
  {
    if (v5 == 401) {
      -[PDWebServiceConnectionTask reportAuthenticationFailure](self, "reportAuthenticationFailure");
    }
    else {
      -[PDWebServiceConnectionTask reportUnexpectedResponseCode:](self, "reportUnexpectedResponseCode:", v5);
    }
    -[PDNetworkTask fail](self, "fail");
  }

- (void)handleError:(id)a3
{
}

- (id)description
{
  if ((id)-[PDRegistrationTask requestedStatus](self, "requestedStatus") == (id)1) {
    v3 = @"Register";
  }
  else {
    v3 = @"Unregister";
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDRegistrationTask serialNumber](self, "serialNumber"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceURL]);
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ task (for device %@, pass type %@, serial number %@; with web service url %@)",
                    v3,
                    v5,
                    v6,
                    v7,
                    v9));

  return v10;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  if ((-[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDRegistrationTask, a2)) & 1) != 0) {
    return 1;
  }
  else {
    return -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, v4));
  }
}

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDRegistrationTask, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && -[PDRegistrationTask _matchesRegistrationTask:](self, "_matchesRegistrationTask:", v4))
  {
    int64_t v8 = 1LL;
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    {
      if (-[PDRegistrationTask _matchesPersonalizePassTask:](self, "_matchesPersonalizePassTask:", v4)) {
        int64_t v8 = 6LL;
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
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDRegistrationTask, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && -[PDRegistrationTask _matchesRegistrationTask:](self, "_matchesRegistrationTask:", v4))
  {
    id v8 = -[PDRegistrationTask requestedStatus](self, "requestedStatus");
    if (v8 == [v4 requestedStatus]) {
      int64_t v9 = 3LL;
    }
    else {
      int64_t v9 = 5LL;
    }
  }

  else
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, v7);
    if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
    {
      if (-[PDRegistrationTask _matchesPersonalizePassTask:](self, "_matchesPersonalizePassTask:", v4)) {
        int64_t v9 = 6LL;
      }
      else {
        int64_t v9 = 0LL;
      }
    }

    else
    {
      int64_t v9 = 0LL;
    }
  }

  return v9;
}

- (BOOL)_matchesPersonalizePassTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 webService]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceURL]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  if ([v6 isEqual:v8])
  {
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
    if ([v9 isEqualToString:v10])
    {
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDRegistrationTask serialNumber](self, "serialNumber"));
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

- (BOOL)_matchesRegistrationTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 webService]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceURL]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  if ([v6 isEqual:v8])
  {
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
    if ([v9 isEqualToString:v10])
    {
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDRegistrationTask serialNumber](self, "serialNumber"));
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

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (unint64_t)requestedStatus
{
  return self->_requestedStatus;
}

- (void)setRequestedStatus:(unint64_t)a3
{
  self->_requestedStatus = a3;
}

- (void).cxx_destruct
{
}

@end