@interface PDNotificationServiceConnectionTask
+ (BOOL)supportsSecureCoding;
- (BOOL)matchesTask:(id)a3;
- (BOOL)pertainsToNotificationService:(id)a3;
- (PDNotificationService)notificationService;
- (PDNotificationServiceConnectionTask)initWithCoder:(id)a3;
- (PDNotificationServiceConnectionTask)initWithNotificationService:(id)a3;
- (const)backoffLevels;
- (id)bodyDictionary;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (id)queryFields;
- (id)request;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)taskType;
- (unint64_t)numberOfBackoffLevels;
- (void)encodeWithCoder:(id)a3;
- (void)setNotificationService:(id)a3;
@end

@implementation PDNotificationServiceConnectionTask

- (PDNotificationServiceConnectionTask)initWithNotificationService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDNotificationServiceConnectionTask;
  v6 = -[PDNetworkTask init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_notificationService, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNotificationServiceConnectionTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDNotificationServiceConnectionTask;
  v6 = -[PDNetworkTask initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PDNotificationService, v5),  @"notificationService");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    notificationService = v6->_notificationService;
    v6->_notificationService = (PDNotificationService *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDNotificationServiceConnectionTask;
  id v4 = a3;
  -[PDNetworkTask encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationServiceConnectionTask notificationService]( self,  "notificationService",  v6.receiver,  v6.super_class));
  [v4 encodeObject:v5 forKey:@"notificationService"];
}

- (id)request
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceURL]);

  if ((id)-[PDNotificationServiceConnectionTask taskType](self, "taskType") == (id)1)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 registrationURL]);
    uint64_t v8 = (void *)v7;
    if (v7) {
      objc_super v9 = (void *)v7;
    }
    else {
      objc_super v9 = v4;
    }
    id v10 = v9;

    id v4 = v10;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));

    id v4 = (void *)v12;
  }

  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask endpointComponents](self, "endpointComponents"));
  id v14 = [v13 countByEnumeratingWithState:&v69 objects:v79 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v70;
    do
    {
      v17 = 0LL;
      v18 = v4;
      do
      {
        if (*(void *)v70 != v16) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLPathAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLPathAllowedCharacterSet"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAddingPercentEncodingWithAllowedCharacters:v20]);
        id v4 = (void *)objc_claimAutoreleasedReturnValue([v18 URLByAppendingPathComponent:v21]);

        v17 = (char *)v17 + 1;
        v18 = v4;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v69 objects:v79 count:16];
    }

    while (v15);
  }

  v56 = self;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask queryFields](self, "queryFields"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  obj = (void *)objc_claimAutoreleasedReturnValue([v58 allKeys]);
  id v22 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v66;
    v25 = @"?";
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v66 != v24) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
        v29 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAddingPercentEncodingWithAllowedCharacters:v28]);

        v30 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKey:v27]);
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
        v32 = (void *)objc_claimAutoreleasedReturnValue([v30 stringByAddingPercentEncodingWithAllowedCharacters:v31]);

        [v59 appendFormat:@"%@%@=%@", v25, v29, v32];
        v25 = @"&";
      }

      id v23 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
    }

    while (v23);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v4 absoluteString]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 stringByAppendingString:v59]);
  uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v34));

  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask method](v56, "method"));
    *(_DWORD *)buf = 138412546;
    v75 = v38;
    __int16 v76 = 2112;
    uint64_t v77 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Generating %@ request with URL <%@>",  buf,  0x16u);
  }

  v55 = (void *)v35;
  v39 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask method](v56, "method"));
  -[NSMutableURLRequest setHTTPMethod:](v39, "setHTTPMethod:", v40);

  -[NSMutableURLRequest setHTTPShouldHandleCookies:](v39, "setHTTPShouldHandleCookies:", 0LL);
  -[NSMutableURLRequest setCachePolicy:](v39, "setCachePolicy:", 1LL);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask headerFields](v56, "headerFields"));
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 allKeys]);
  id v43 = [v42 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v62;
    do
    {
      for (j = 0LL; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v62 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)j);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v47]);
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v39, "setValue:forHTTPHeaderField:", v48, v47);

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v47]);
          *(_DWORD *)buf = 138412546;
          v75 = v47;
          __int16 v76 = 2112;
          uint64_t v77 = (uint64_t)v49;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Request contains header field <%@: %@>",  buf,  0x16u);
        }
      }

      id v44 = [v42 countByEnumeratingWithState:&v61 objects:v73 count:16];
    }

    while (v44);
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask bodyDictionary](v56, "bodyDictionary"));
  if (v50)
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Request contains body dictionary %@",  buf,  0xCu);
    }

    id v60 = 0LL;
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v50,  0LL,  &v60));
    id v53 = v60;
    if (!v51) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Could not create json data for %@: %@",  objc_opt_class(v56, v52),  v53);
    }
    -[NSMutableURLRequest setHTTPBody:](v39, "setHTTPBody:", v51);
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v39,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Accept");
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v39,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
  }

  return v39;
}

- (id)method
{
  return 0LL;
}

- (id)endpointComponents
{
  return 0LL;
}

- (id)queryFields
{
  return 0LL;
}

- (id)headerFields
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v5 = PKRFC1123StringForDate();
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v3 setObject:v6 forKeyedSubscript:@"Date"];

  [v3 setObject:@"1" forKey:@"x-compatibility-version"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 authenticationToken]);

  if (v8)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AuthenticationToken %@",  v8));
    [v3 setObject:v9 forKeyedSubscript:@"Authorization"];
  }

  return v3;
}

- (id)bodyDictionary
{
  return 0LL;
}

- (const)backoffLevels
{
  return (const $82EDB067EE6F192B39F18594CC8676AD *)&_FasterBackoffLevels;
}

- (unint64_t)numberOfBackoffLevels
{
  return 7LL;
}

- (int64_t)actionForActiveTask:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[PDNetworkTask actionForInactiveTask:](self, "actionForInactiveTask:", v4);
  LODWORD(self) = -[PDNotificationServiceConnectionTask matchesTask:](self, "matchesTask:", v4);

  if ((_DWORD)self) {
    return 3LL;
  }
  else {
    return v5;
  }
}

- (BOOL)matchesTask:(id)a3
{
  return sub_10027AA80(self, a3);
}

- (BOOL)pertainsToNotificationService:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNotificationServiceConnectionTask notificationService](self, "notificationService"));
  unsigned __int8 v6 = [v5 matchesNotificationService:v4];

  return v6;
}

- (PDNotificationService)notificationService
{
  return self->_notificationService;
}

- (void)setNotificationService:(id)a3
{
}

- (int64_t)taskType
{
  return self->_taskType;
}

- (void).cxx_destruct
{
}

@end