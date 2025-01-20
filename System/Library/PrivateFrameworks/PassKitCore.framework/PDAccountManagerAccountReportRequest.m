@interface PDAccountManagerAccountReportRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)description;
- (PDAccountManagerAccountReportRequest)initWithAccountIdentifier:(id)a3 report:(id)a4 trigger:(unint64_t)a5;
- (PKAccountReport)report;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (unint64_t)trigger;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithError:(id)a3;
- (void)setReport:(id)a3;
@end

@implementation PDAccountManagerAccountReportRequest

- (PDAccountManagerAccountReportRequest)initWithAccountIdentifier:(id)a3 report:(id)a4 trigger:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDAccountManagerAccountReportRequest;
  v11 = -[PDAccountManagerAccountReportRequest init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountIdentifier, a3);
    objc_storeStrong((id *)&v12->_report, a4);
    v12->_trigger = a5;
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completionHandlers = v12->_completionHandlers;
    v12->_completionHandlers = v13;
  }

  return v12;
}

- (unint64_t)requestType
{
  return 11LL;
}

- (id)requestIdentifier
{
  v3 = sub_1003DE65C(-[PDAccountManagerAccountReportRequest requestType](self, "requestType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v4,  self->_accountIdentifier));

  return v5;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 == (id)-[PDAccountManagerAccountReportRequest requestType](self, "requestType"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerAccountReportRequest requestIdentifier](self, "requestIdentifier"));
    id v8 = v6;
    id v9 = v7;
    id v10 = v9;
    if (v8 == v9)
    {
      unsigned __int8 v11 = 1;
    }

    else
    {
      unsigned __int8 v11 = 0;
      if (v8 && v9) {
        unsigned __int8 v11 = [v8 isEqualToString:v9];
      }
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    -[NSMutableSet addObject:](completionHandlers, "addObject:", v4);
  }

- (void)callCompletionsWithError:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_completionHandlers;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9) + 16LL))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (NSString)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@: %p; ", objc_opt_class(self, v4), self);
  id v5 = sub_1003DE65C(-[PDAccountManagerAccountReportRequest requestType](self, "requestType"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestType: '%@'; ", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerAccountReportRequest requestIdentifier](self, "requestIdentifier"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestIdentifier: '%@'; ", v7);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"accountIdentifier: '%@'; ", self->_accountIdentifier);
  uint64_t v8 = PKAccountWebServiceTransactionDataTriggerToString(self->_trigger);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"trigger: '%@'; ", v9);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return (NSString *)v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (PKAccountReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end