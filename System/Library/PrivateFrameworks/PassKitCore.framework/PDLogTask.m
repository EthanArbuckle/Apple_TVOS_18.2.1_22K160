@interface PDLogTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 error:(id)a4;
+ (id)taskWithWebService:(id)a3 warnings:(id)a4;
- (BOOL)_hasRoomForAdditionalLogs;
- (BOOL)_matchesLogTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (NSArray)logs;
- (PDLogTask)initWithCoder:(id)a3;
- (PDLogTask)initWithWebService:(id)a3 logs:(id)a4;
- (const)backoffLevels;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (unint64_t)numberOfBackoffLevels;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)mergeWithNewerTask:(id)a3;
- (void)setLogs:(id)a3;
@end

@implementation PDLogTask

+ (id)taskWithWebService:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v9 = sub_100262C64(v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v14 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v12 = [v8 initWithWebService:v7 logs:v11];

  return v12;
}

+ (id)taskWithWebService:(id)a3 warnings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100262E24;
  v11[3] = &unk_100650028;
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  id v8 = v12;
  [v6 enumerateObjectsUsingBlock:v11];

  id v9 = [objc_alloc((Class)a1) initWithWebService:v7 logs:v8];
  return v9;
}

- (PDLogTask)initWithWebService:(id)a3 logs:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDLogTask;
  id v7 = -[PDWebServiceConnectionTask initWithWebService:](&v11, "initWithWebService:", a3);
  if (v7)
  {
    id v8 = (NSArray *)[v6 copy];
    logs = v7->_logs;
    v7->_logs = v8;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDLogTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDLogTask;
  id v6 = -[PDWebServiceConnectionTask initWithCoder:](&v14, "initWithCoder:", v4);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
    id v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___NSString, v8),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"logs"]);
    logs = v6->_logs;
    v6->_logs = (NSArray *)v11;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDLogTask;
  id v4 = a3;
  -[PDWebServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_logs, @"logs", v5.receiver, v5.super_class);
}

- (id)method
{
  return @"POST";
}

- (id)endpointComponents
{
  return &off_100691100;
}

- (id)bodyDictionary
{
  objc_super v5 = @"logs";
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDLogTask logs](self, "logs"));
  id v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v5 = [a3 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceURL]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Log task (pass type %@, web service url %@)",  v3,  v5));

  return v6;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  return -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDLogTask, a2));
}

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  if (-[PDLogTask _matchesLogTask:](self, "_matchesLogTask:", v4))
  {
    else {
      int64_t v5 = 5LL;
    }
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (int64_t)actionForActiveTask:(id)a3
{
  if (-[PDLogTask _matchesLogTask:](self, "_matchesLogTask:", a3)) {
    return 5LL;
  }
  else {
    return 0LL;
  }
}

- (void)mergeWithNewerTask:(id)a3
{
  logs = self->_logs;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 logs]);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](logs, "arrayByAddingObjectsFromArray:", v6));
  -[PDLogTask setLogs:](self, "setLogs:", v5);
}

- (const)backoffLevels
{
  return (const $82EDB067EE6F192B39F18594CC8676AD *)&_FasterBackoffLevels;
}

- (unint64_t)numberOfBackoffLevels
{
  return 7LL;
}

- (BOOL)_matchesLogTask:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 webService]);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceURL]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceURL]);
  unsigned __int8 v8 = [v5 isEqual:v7];

  return v8;
}

- (BOOL)_hasRoomForAdditionalLogs
{
  return -[NSArray count](self->_logs, "count") < 0x32;
}

- (NSArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end