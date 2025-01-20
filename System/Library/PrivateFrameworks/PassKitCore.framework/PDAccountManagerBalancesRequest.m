@interface PDAccountManagerBalancesRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)accountIdentifier;
- (NSString)description;
- (PDAccountManagerBalancesRequest)initWithAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (unint64_t)type;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithBalances:(id)a3 error:(id)a4;
@end

@implementation PDAccountManagerBalancesRequest

- (PDAccountManagerBalancesRequest)initWithAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDAccountManagerBalancesRequest;
  v14 = -[PDAccountManagerBalancesRequest init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accountIdentifier, a3);
    objc_storeStrong((id *)&v15->_startDate, a4);
    objc_storeStrong((id *)&v15->_endDate, a5);
    v15->_type = a6;
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completionHandlers = v15->_completionHandlers;
    v15->_completionHandlers = v16;
  }

  return v15;
}

- (unint64_t)requestType
{
  return 10LL;
}

- (id)requestIdentifier
{
  v3 = sub_1003DE65C(-[PDAccountManagerBalancesRequest requestType](self, "requestType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v4,  self->_accountIdentifier));

  return v5;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)-[PDAccountManagerBalancesRequest requestType](self, "requestType")) {
    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerBalancesRequest requestIdentifier](self, "requestIdentifier"));
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_8;
  }

  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_13;
  }

  unsigned __int8 v11 = [v8 isEqualToString:v9];

  if ((v11 & 1) != 0)
  {
LABEL_8:
    v8 = v4;
    startDate = self->_startDate;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 startDate]);
    if (PKEqualObjects(startDate, v14))
    {
      endDate = self->_endDate;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v8 endDate]);
      if ((PKEqualObjects(endDate, v16) & 1) != 0)
      {
        unint64_t type = self->_type;
        id v18 = [v8 type];

        if ((id)type != v18) {
          goto LABEL_16;
        }
LABEL_13:
        BOOL v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }

LABEL_16:
    -[NSMutableSet unionSet:](self->_completionHandlers, "unionSet:", v8[1]);
    BOOL v12 = 1;
    goto LABEL_17;
  }

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    -[NSMutableSet addObject:](completionHandlers, "addObject:", v4);
  }

- (void)callCompletionsWithBalances:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v8 = self->_completionHandlers;
  id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      BOOL v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v12) + 16LL))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v12));
        BOOL v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }
}

- (NSString)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@: %p; ", objc_opt_class(self, v4), self);
  id v5 = sub_1003DE65C(-[PDAccountManagerBalancesRequest requestType](self, "requestType"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestType: '%@'; ", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerBalancesRequest requestIdentifier](self, "requestIdentifier"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestIdentifier: '%@'; ", v7);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"accountIdentifier: '%@'; ", self->_accountIdentifier);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"startDate: '%@'; ", self->_startDate);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"type: %lu; ", self->_type);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return (NSString *)v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end