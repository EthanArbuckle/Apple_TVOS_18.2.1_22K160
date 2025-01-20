@interface PDGetSerialNumbersTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 lastUpdatedTag:(id)a4 tagLastUpdateDate:(id)a5;
- (BOOL)_matchesGetSerialNumbersTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (NSDate)tagLastUpdateDate;
- (NSString)lastUpdatedTag;
- (PDGetSerialNumbersTask)initWithCoder:(id)a3;
- (PDGetSerialNumbersTask)initWithWebService:(id)a3 lastUpdatedTag:(id)a4 tagLastUpdateDate:(id)a5;
- (id)_resultFromResponseData:(id)a3;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (id)queryFields;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setLastUpdatedTag:(id)a3;
- (void)setTagLastUpdateDate:(id)a3;
@end

@implementation PDGetSerialNumbersTask

+ (id)taskWithWebService:(id)a3 lastUpdatedTag:(id)a4 tagLastUpdateDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithWebService:v10 lastUpdatedTag:v9 tagLastUpdateDate:v8];

  return v11;
}

- (PDGetSerialNumbersTask)initWithWebService:(id)a3 lastUpdatedTag:(id)a4 tagLastUpdateDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDGetSerialNumbersTask;
  id v10 = -[PDWebServiceConnectionTask initWithWebService:](&v16, "initWithWebService:", a3);
  if (v10)
  {
    id v11 = (NSString *)[v8 copy];
    lastUpdatedTag = v10->_lastUpdatedTag;
    v10->_lastUpdatedTag = v11;

    v13 = (NSDate *)[v9 copy];
    tagLastUpdateDate = v10->_tagLastUpdateDate;
    v10->_tagLastUpdateDate = v13;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDGetSerialNumbersTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDGetSerialNumbersTask;
  v6 = -[PDWebServiceConnectionTask initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"lastUpdatedTag");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    lastUpdatedTag = v6->_lastUpdatedTag;
    v6->_lastUpdatedTag = (NSString *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v10),  @"tagLastUpdateDate");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    tagLastUpdateDate = v6->_tagLastUpdateDate;
    v6->_tagLastUpdateDate = (NSDate *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDGetSerialNumbersTask;
  id v4 = a3;
  -[PDWebServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastUpdatedTag, @"lastUpdatedTag", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_tagLastUpdateDate forKey:@"tagLastUpdateDate"];
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);

  if (v3) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

- (id)method
{
  return @"GET";
}

- (id)endpointComponents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceIdentifier]);

  BOOL v6 = 0LL;
  if (v5 && v3)
  {
    v8[0] = @"v1";
    v8[1] = @"devices";
    v8[2] = v5;
    v8[3] = @"registrations";
    v8[4] = v3;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 5LL));
  }

  return v6;
}

- (id)queryFields
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetSerialNumbersTask lastUpdatedTag](self, "lastUpdatedTag"));
  if (v2) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v2,  @"passesUpdatedSince"));
  }
  else {
    v3 = 0LL;
  }

  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = [a3 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    v13 = self;
    __int16 v14 = 2048;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ got response with code %ld",  (uint8_t *)&v12,  0x16u);
  }

  if (v7 == (id)204)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___PDGetSerialNumbersResult);
  }

  else
  {
    if (v7 != (id)200)
    {
      -[PDWebServiceConnectionTask reportUnexpectedResponseCode:](self, "reportUnexpectedResponseCode:", v7);
      goto LABEL_13;
    }

    uint64_t v10 = (PDGetSerialNumbersResult *)objc_claimAutoreleasedReturnValue( -[PDGetSerialNumbersTask _resultFromResponseData:]( self,  "_resultFromResponseData:",  v6));
  }

  id v11 = v10;
  if (!v10)
  {
LABEL_13:
    -[PDNetworkTask fail](self, "fail");
    goto LABEL_14;
  }

  -[PDNetworkTask deliverResult:](self, "deliverResult:", v10);
  -[PDNetworkTask succeed](self, "succeed");

LABEL_14:
}

- (void)handleError:(id)a3
{
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v3 passTypeIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDGetSerialNumbersTask lastUpdatedTag](self, "lastUpdatedTag"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceURL]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Get serial #s task (for device %@, pass type %@, last updated %@; with web service url %@)",
                   v4,
                   v5,
                   v6,
                   v7));

  return v8;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  return -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDGetSerialNumbersTask, a2));
}

- (int64_t)actionForInactiveTask:(id)a3
{
  if (-[PDGetSerialNumbersTask _matchesGetSerialNumbersTask:](self, "_matchesGetSerialNumbersTask:", a3)) {
    return 2LL;
  }
  else {
    return 0LL;
  }
}

- (int64_t)actionForActiveTask:(id)a3
{
  if (-[PDGetSerialNumbersTask _matchesGetSerialNumbersTask:](self, "_matchesGetSerialNumbersTask:", a3)) {
    return 5LL;
  }
  else {
    return 0LL;
  }
}

- (BOOL)_matchesGetSerialNumbersTask:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 webService]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceURL]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  if ([v6 isEqual:v8])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
    unsigned __int8 v11 = [v9 isEqualToString:v10];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)_resultFromResponseData:(id)a3
{
  if (a3)
  {
    id v26 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v26));
    id v6 = v26;
    if (v4)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
      if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      {
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
        id v25 = 0LL;
        uint64_t v10 = PDTypecheckArrayOfObjectsForKey(v4, @"response", @"serialNumbers", v9, 1LL, &v25);
        uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
        id v12 = v25;

        if (v11)
        {
          -[PDWebServiceConnectionTask reportMalformedResponseError:](self, "reportMalformedResponseError:", v11);
          __int16 v14 = 0LL;
          id v6 = (id)v11;
        }

        else
        {
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString, v13);
          id v24 = 0LL;
          uint64_t v21 = PDTypecheckObjectForKey(v4, @"response", @"lastUpdated", v20, 1LL, &v24);
          id v6 = (id)objc_claimAutoreleasedReturnValue(v21);
          id v22 = v24;
          if (v6)
          {
            -[PDWebServiceConnectionTask reportMalformedResponseError:](self, "reportMalformedResponseError:", v6);
            __int16 v14 = 0LL;
          }

          else
          {
            __int16 v14 = objc_alloc_init(&OBJC_CLASS___PDGetSerialNumbersResult);
            -[PDGetSerialNumbersResult setSerialNumbers:](v14, "setSerialNumbers:", v12);
            -[PDGetSerialNumbersResult setLastUpdatedTag:](v14, "setLastUpdatedTag:", v22);
          }
        }
      }

      else
      {
        uint64_t v23 = objc_opt_class(v4, v8);
        uint64_t v18 = PDBasicError(@"Top-level JSON object must be a dictionary (instead found a %@)");
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

        -[PDWebServiceConnectionTask reportMalformedResponseError:](self, "reportMalformedResponseError:", v19, v23);
        __int16 v14 = 0LL;
        id v6 = (id)v19;
      }
    }

    else
    {
      -[PDWebServiceConnectionTask reportMalformedResponseError:](self, "reportMalformedResponseError:", v6);
      __int16 v14 = 0LL;
    }

    return v14;
  }

  else
  {
    uint64_t v15 = PDBasicError(@"Missing response data");
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[PDWebServiceConnectionTask reportMalformedResponseError:](self, "reportMalformedResponseError:", v16);

    return 0LL;
  }

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (NSDate)tagLastUpdateDate
{
  return self->_tagLastUpdateDate;
}

- (void)setTagLastUpdateDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end