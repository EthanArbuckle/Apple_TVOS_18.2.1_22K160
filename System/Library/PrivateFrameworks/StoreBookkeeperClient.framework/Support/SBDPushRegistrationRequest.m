@interface SBDPushRegistrationRequest
+ (id)requestForDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 typeRegistrationURL:(id)a6;
- (BOOL)isEqualToRegistrationRequest:(id)a3;
- (BOOL)optIn;
- (NSNumber)storeAccountID;
- (NSString)domain;
- (SBDPushRegistrationRequest)initWithDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 typeRegistrationURL:(id)a6;
- (id)_requestPropertiesForDomain:(id)a3 optIn:(BOOL)a4 typeRegistrationURL:(id)a5;
@end

@implementation SBDPushRegistrationRequest

- (SBDPushRegistrationRequest)initWithDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 typeRegistrationURL:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[SBDPushRegistrationRequest _requestPropertiesForDomain:optIn:typeRegistrationURL:]( self,  "_requestPropertiesForDomain:optIn:typeRegistrationURL:",  v11,  v8,  a6));
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SBDPushRegistrationRequest;
  v14 = -[SBDPushRegistrationRequest initWithRequestProperties:](&v17, "initWithRequestProperties:", v13);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_domain, a3);
    v15->_optIn = v8;
    objc_storeStrong((id *)&v15->_storeAccountID, a5);
  }

  return v15;
}

- (id)_requestPropertiesForDomain:(id)a3 optIn:(BOOL)a4 typeRegistrationURL:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [[SSMutableURLRequestProperties alloc] initWithURL:v7];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  [v9 setITunesStoreRequest:1];
  if (qword_1000238D8 != -1) {
    dispatch_once(&qword_1000238D8, &stru_10001D188);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"bookkeeperDomain:%@",  v8));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v5));
  v17[0] = @"guid";
  v17[1] = @"notification-type";
  v18[0] = qword_1000238D0;
  v18[1] = @"mzbookkeeper";
  v17[2] = @"put-parameters";
  v15 = v10;
  v16 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  v18[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));

  [v9 setRequestParameters:v13];
  return v9;
}

- (BOOL)isEqualToRegistrationRequest:(id)a3
{
  v4 = (SBDPushRegistrationRequest *)a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SBDPushRegistrationRequest);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    if (self == v4)
    {
      unsigned __int8 v13 = 1;
    }

    else
    {
      domain = self->_domain;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SBDPushRegistrationRequest domain](v4, "domain"));
      if (-[NSString isEqual:](domain, "isEqual:", v7)
        && (BOOL optIn = self->_optIn, optIn == -[SBDPushRegistrationRequest optIn](v4, "optIn")))
      {
        storeAccountID = self->_storeAccountID;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SBDPushRegistrationRequest storeAccountID](v4, "storeAccountID"));
        if (-[NSNumber isEqual:](storeAccountID, "isEqual:", v10))
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SBDPushRegistrationRequest requestProperties](self, "requestProperties"));
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SBDPushRegistrationRequest requestProperties](v4, "requestProperties"));
          unsigned __int8 v13 = [v11 isEqual:v12];
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
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (NSNumber)storeAccountID
{
  return self->_storeAccountID;
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)optIn
{
  return self->_optIn;
}

- (void).cxx_destruct
{
}

+ (id)requestForDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 typeRegistrationURL:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithDomain:v12 optIn:v7 accountID:v11 typeRegistrationURL:v10];

  return v13;
}

@end