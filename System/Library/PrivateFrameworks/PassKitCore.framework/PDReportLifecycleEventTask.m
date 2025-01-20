@interface PDReportLifecycleEventTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 serialNumber:(id)a4 state:(unint64_t)a5;
- (BOOL)_matchesPassLifecycleTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (NSString)serialNumber;
- (PDReportLifecycleEventTask)initWithCoder:(id)a3;
- (const)backoffLevels;
- (id)_initTaskWithWebService:(id)a3 serialNumber:(id)a4 state:(unint64_t)a5;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (unint64_t)numberOfBackoffLevels;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
@end

@implementation PDReportLifecycleEventTask

+ (id)taskWithWebService:(id)a3 serialNumber:(id)a4 state:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) _initTaskWithWebService:v9 serialNumber:v8 state:a5];

  return v10;
}

- (id)_initTaskWithWebService:(id)a3 serialNumber:(id)a4 state:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDReportLifecycleEventTask;
  id v10 = -[PDWebServiceConnectionTask initWithWebService:](&v13, "initWithWebService:", a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_serialNumber, a4);
    v11->_state = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDReportLifecycleEventTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDReportLifecycleEventTask;
  v6 = -[PDWebServiceConnectionTask initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"serialNumber");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    serialNumber = v6->_serialNumber;
    v6->_serialNumber = (NSString *)v8;

    v6->_state = (unint64_t)[v4 decodeIntegerForKey:@"state"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDReportLifecycleEventTask;
  id v4 = a3;
  -[PDWebServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_serialNumber, @"serialNumber", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_state forKey:@"state"];
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  if (v3)
  {
    if (self->_serialNumber) {
      BOOL v5 = v4 == 0LL;
    }
    else {
      BOOL v5 = 1;
    }
    BOOL v6 = !v5;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)method
{
  return @"POST";
}

- (id)endpointComponents
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  id v4 = (void *)v3;
  if (v3 && (serialNumber = self->_serialNumber) != 0LL)
  {
    v8[0] = @"v1";
    v8[1] = @"passes";
    v8[2] = v3;
    v8[3] = serialNumber;
    v8[4] = @"passLifecycleUpdate";
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 5LL));
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

- (id)bodyDictionary
{
  BOOL v6 = @"passState";
  uint64_t v2 = PKPassLifecycleStateToString(self->_state, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v7 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  return v4;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v5 = [a3 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2048;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ got response with code %ld",  (uint8_t *)&v8,  0x16u);
  }

  if (v5 == (id)200)
  {
    -[PDNetworkTask succeed](self, "succeed");
  }

  else
  {
    -[PDWebServiceConnectionTask reportUnexpectedResponseCode:](self, "reportUnexpectedResponseCode:", v5);
    -[PDNetworkTask fail](self, "fail");
  }

- (void)handleError:(id)a3
{
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  serialNumber = self->_serialNumber;
  unint64_t state = self->_state;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceURL]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Pass Lifecycle Event (pass type %@, serial number %@, pass lifecycle state %ld, web service url %@)",  v3,  serialNumber,  state,  v7));

  return v8;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  return -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDReportLifecycleEventTask, a2));
}

- (int64_t)actionForInactiveTask:(id)a3
{
  if (-[PDReportLifecycleEventTask _matchesPassLifecycleTask:](self, "_matchesPassLifecycleTask:", a3)) {
    return 4LL;
  }
  else {
    return 0LL;
  }
}

- (int64_t)actionForActiveTask:(id)a3
{
  if (-[PDReportLifecycleEventTask _matchesPassLifecycleTask:](self, "_matchesPassLifecycleTask:", a3)) {
    return 5LL;
  }
  else {
    return 0LL;
  }
}

- (const)backoffLevels
{
  return (const $82EDB067EE6F192B39F18594CC8676AD *)&_FasterBackoffLevels;
}

- (unint64_t)numberOfBackoffLevels
{
  return 7LL;
}

- (BOOL)_matchesPassLifecycleTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 webService]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceURL]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  unsigned int v9 = [v6 isEqual:v8];

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDReportLifecycleEventTask serialNumber](self, "serialNumber"));
  unsigned __int8 v12 = [v10 isEqualToString:v11];

  id v13 = [v4 state];
  if (v13 == (id)-[PDReportLifecycleEventTask state](self, "state")) {
    BOOL v14 = v12;
  }
  else {
    BOOL v14 = 0;
  }
  return v9 && v14;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end