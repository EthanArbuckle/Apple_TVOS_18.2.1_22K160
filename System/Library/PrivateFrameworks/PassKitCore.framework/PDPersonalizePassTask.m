@interface PDPersonalizePassTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithWebService:(id)a3 updateContext:(id)a4 contact:(id)a5 personalizationToken:(id)a6 requiredPersonalizationFields:(unint64_t)a7 personalizationSource:(unint64_t)a8;
- (BOOL)_matchesGetPassTask:(id)a3;
- (BOOL)_matchesPersonalizePassTask:(id)a3;
- (BOOL)_matchesRegistrationTask:(id)a3;
- (BOOL)backoffComplete;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (BOOL)pertainsToPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (NSString)personalizationToken;
- (NSString)serialNumber;
- (PDPassUpdateContext)context;
- (PDPersonalizePassTask)initWithCoder:(id)a3;
- (PDPersonalizePassTask)initWithWebService:(id)a3 updateContext:(id)a4 contact:(id)a5 personalizationToken:(id)a6 requiredPersonalizationFields:(unint64_t)a7 personalizationSource:(unint64_t)a8;
- (PKContact)contact;
- (id)_resultFromResponseData:(id)a3;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (unint64_t)personalizationSource;
- (unint64_t)requiredPersonalizationFields;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
@end

@implementation PDPersonalizePassTask

+ (id)taskWithWebService:(id)a3 updateContext:(id)a4 contact:(id)a5 personalizationToken:(id)a6 requiredPersonalizationFields:(unint64_t)a7 personalizationSource:(unint64_t)a8
{
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [objc_alloc((Class)a1) initWithWebService:v17 updateContext:v16 contact:v15 personalizationToken:v14 requiredPersonalizationFields:a7 personalizationSource:a8];

  return v18;
}

- (PDPersonalizePassTask)initWithWebService:(id)a3 updateContext:(id)a4 contact:(id)a5 personalizationToken:(id)a6 requiredPersonalizationFields:(unint64_t)a7 personalizationSource:(unint64_t)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PDPersonalizePassTask;
  id v18 = -[PDWebServiceConnectionTask initWithWebService:](&v23, "initWithWebService:", a3);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_context, a4);
    objc_storeStrong((id *)&v19->_contact, a5);
    v20 = (NSString *)[v17 copy];
    personalizationToken = v19->_personalizationToken;
    v19->_personalizationToken = v20;

    v19->_requiredPersonalizationFields = a7;
    v19->_personalizationSource = a8;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPersonalizePassTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDPersonalizePassTask;
  v6 = -[PDWebServiceConnectionTask initWithCoder:](&v19, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PDPassUpdateContext, v5),  @"context");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    context = v6->_context;
    v6->_context = (PDPassUpdateContext *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKContact, v10),  @"contact");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    contact = v6->_contact;
    v6->_contact = (PKContact *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"personalizationToken");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    personalizationToken = v6->_personalizationToken;
    v6->_personalizationToken = (NSString *)v16;

    v6->_requiredPersonalizationFields = (unint64_t)[v4 decodeIntegerForKey:@"requiredPersonalizationFields"];
    v6->_personalizationSource = (unint64_t)[v4 decodeIntegerForKey:@"personalizationSource"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPersonalizePassTask;
  id v4 = a3;
  -[PDWebServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, @"context", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_contact forKey:@"contact"];
  [v4 encodeObject:self->_personalizationToken forKey:@"personalizationToken"];
  [v4 encodeInteger:self->_requiredPersonalizationFields forKey:@"requiredPersonalizationFields"];
  [v4 encodeInteger:self->_personalizationSource forKey:@"personalizationSource"];
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask serialNumber](self, "serialNumber"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask contact](self, "contact"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask personalizationToken](self, "personalizationToken"));
  if (v3) {
    BOOL v7 = v4 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v10 = !v7 && v5 != 0LL && v6 != 0LL;

  return v10;
}

- (NSString)serialNumber
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask context](self, "context"));
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
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask serialNumber](self, "serialNumber"));
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
  return @"POST";
}

- (id)endpointComponents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask serialNumber](self, "serialNumber"));
  objc_super v5 = (void *)v4;
  id v6 = 0LL;
  if (v3 && v4)
  {
    v8[0] = @"v1";
    v8[1] = @"passes";
    v8[2] = v3;
    v8[3] = v4;
    v8[4] = @"personalize";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 5LL));
  }

  return v6;
}

- (BOOL)backoffComplete
{
  return 1;
}

- (id)bodyDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unint64_t requiredPersonalizationFields = self->_requiredPersonalizationFields;
  if ((requiredPersonalizationFields & 1) != 0)
  {
    unsigned __int8 v11 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponentsFormatter);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask contact](self, "contact"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSPersonNameComponentsFormatter stringFromPersonNameComponents:]( v11,  "stringFromPersonNameComponents:",  v13));
    [v4 safelySetObject:v14 forKey:@"fullName"];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 givenName]);
    [v4 safelySetObject:v15 forKey:@"givenName"];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 familyName]);
    [v4 safelySetObject:v16 forKey:@"familyName"];

    unint64_t requiredPersonalizationFields = self->_requiredPersonalizationFields;
    if ((requiredPersonalizationFields & 2) == 0)
    {
LABEL_3:
      if ((requiredPersonalizationFields & 4) == 0) {
        goto LABEL_4;
      }
LABEL_12:
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask contact](self, "contact"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 emailAddress]);
      [v4 safelySetObject:v25 forKey:@"emailAddress"];

      if ((self->_requiredPersonalizationFields & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }

  else if ((requiredPersonalizationFields & 2) == 0)
  {
    goto LABEL_3;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask contact](self, "contact"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 postalAddress]);

  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v18 ISOCountryCode]);
  v20 = v19;
  if (v19) {
    id v21 = v19;
  }
  else {
    id v21 = (id)objc_claimAutoreleasedReturnValue([v18 suggestedCountryCode]);
  }
  v22 = v21;

  objc_super v23 = (void *)objc_claimAutoreleasedReturnValue([v18 postalCode]);
  [v4 safelySetObject:v23 forKey:@"postalCode"];

  [v4 safelySetObject:v22 forKey:@"ISOCountryCode"];
  unint64_t requiredPersonalizationFields = self->_requiredPersonalizationFields;
  if ((requiredPersonalizationFields & 4) != 0) {
    goto LABEL_12;
  }
LABEL_4:
  if ((requiredPersonalizationFields & 8) != 0)
  {
LABEL_5:
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask contact](self, "contact"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 phoneNumber]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 digits]);
    [v4 safelySetObject:v8 forKey:@"phoneNumber"];
  }

- (id)headerFields
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask context](self, "context"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationToken]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ApplePass %@", v5));

  [v3 setObject:v6 forKey:@"Authorization"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask context](self, "context"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastModifiedTag]);

  if (v8) {
    [v3 setObject:v8 forKey:@"If-Modified-Since"];
  }

  return v3;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = [a3 statusCode];
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    v13 = self;
    __int16 v14 = 2048;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ got response with code %ld",  (uint8_t *)&v12,  0x16u);
  }

  if (v7 != (id)200)
  {
    if (v7 == (id)401) {
      -[PDWebServiceConnectionTask reportAuthenticationFailure](self, "reportAuthenticationFailure");
    }
    else {
      -[PDWebServiceConnectionTask reportUnexpectedResponseCode:](self, "reportUnexpectedResponseCode:", v7);
    }
    goto LABEL_12;
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask _resultFromResponseData:](self, "_resultFromResponseData:", v6));
  if (!v10)
  {
LABEL_12:
    -[PDNetworkTask fail](self, "fail");
    goto LABEL_13;
  }

  unsigned __int8 v11 = (void *)v10;
  -[PDNetworkTask deliverResult:](self, "deliverResult:", v10);
  -[PDNetworkTask succeed](self, "succeed");

LABEL_13:
}

- (void)handleError:(id)a3
{
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask serialNumber](self, "serialNumber"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask context](self, "context"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastModifiedTag]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask webService](self, "webService"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Personalize pass task (pass type %@, serial number %@, if-modified-since %@; with web service url %@)",
                   v3,
                   v4,
                   v6,
                   v8));

  return v9;
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  if ((-[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, a2)) & 1) != 0 || (-[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDRegistrationTask, v4)) & 1) != 0)
  {
    return 1;
  }

  else
  {
    return -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDGetPassTask, v5));
  }

- (int64_t)actionForInactiveTask:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && -[PDPersonalizePassTask _matchesPersonalizePassTask:](self, "_matchesPersonalizePassTask:", v4))
  {
    int64_t v8 = 1LL;
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___PDRegistrationTask, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0
      && -[PDPersonalizePassTask _matchesRegistrationTask:](self, "_matchesRegistrationTask:", v4))
    {
      int64_t v8 = 5LL;
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___PDGetPassTask, v10);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
      {
        if (-[PDPersonalizePassTask _matchesGetPassTask:](self, "_matchesGetPassTask:", v4)) {
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
  }

  return v8;
}

- (int64_t)actionForActiveTask:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PDPersonalizePassTask, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && -[PDPersonalizePassTask _matchesPersonalizePassTask:](self, "_matchesPersonalizePassTask:", v4))
  {
    int64_t v8 = 3LL;
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___PDRegistrationTask, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0
      && -[PDPersonalizePassTask _matchesRegistrationTask:](self, "_matchesRegistrationTask:", v4))
    {
      int64_t v8 = 5LL;
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___PDGetPassTask, v10);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
      {
        if (-[PDPersonalizePassTask _matchesGetPassTask:](self, "_matchesGetPassTask:", v4)) {
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
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
    if ([v9 isEqualToString:v10])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask serialNumber](self, "serialNumber"));
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
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
    if ([v9 isEqualToString:v10])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask serialNumber](self, "serialNumber"));
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
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceURL]);
  if ([v6 isEqual:v8])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 passTypeIdentifier]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
    if ([v9 isEqualToString:v10])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask serialNumber](self, "serialNumber"));
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
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = -[PDPersonalizePassResult initWithSignatureData:]( objc_alloc(&OBJC_CLASS___PDPersonalizePassResult),  "initWithSignatureData:",  v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPersonalizePassTask personalizationToken](self, "personalizationToken"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask passTypeIdentifier](self, "passTypeIdentifier"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDWebServiceConnectionTask teamIdentifier](self, "teamIdentifier"));
    id v22 = 0LL;
    PKValidateIssuerDataSignature(v7, v4, v8, v9, 0LL, &v22);
    id v10 = v22;

    if (v10)
    {
      id v15 = PDTaskWarning( 0LL,  self,  v10,  @"Received invalid personalizaiton token signature",  v11,  v12,  v13,  v14,  v21);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_super v23 = v16;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
      -[PDNetworkTask reportWarnings:](self, "reportWarnings:", v17);
    }
  }

  else
  {
    uint64_t v18 = PDBasicError(@"Missing response data");
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[PDWebServiceConnectionTask reportMalformedResponseError:](self, "reportMalformedResponseError:", v19);

    uint64_t v5 = 0LL;
  }

  return v5;
}

- (PDPassUpdateContext)context
{
  return self->_context;
}

- (PKContact)contact
{
  return self->_contact;
}

- (NSString)personalizationToken
{
  return self->_personalizationToken;
}

- (unint64_t)requiredPersonalizationFields
{
  return self->_requiredPersonalizationFields;
}

- (unint64_t)personalizationSource
{
  return self->_personalizationSource;
}

- (void).cxx_destruct
{
}

@end