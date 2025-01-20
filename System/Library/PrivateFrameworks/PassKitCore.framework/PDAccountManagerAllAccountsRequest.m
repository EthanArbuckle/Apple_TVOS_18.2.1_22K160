@interface PDAccountManagerAllAccountsRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSSet)completionHandlers;
- (NSString)description;
- (PDAccountManagerAllAccountsRequest)init;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithAccounts:(id)a3 error:(id)a4;
@end

@implementation PDAccountManagerAllAccountsRequest

- (PDAccountManagerAllAccountsRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDAccountManagerAllAccountsRequest;
  v2 = -[PDAccountManagerAllAccountsRequest init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;
  }

  return v2;
}

- (unint64_t)requestType
{
  return 0LL;
}

- (id)requestIdentifier
{
  return (id)sub_1003DE65C(-[PDAccountManagerAllAccountsRequest requestType](self, "requestType"));
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)-[PDAccountManagerAllAccountsRequest requestType](self, "requestType")) {
    goto LABEL_6;
  }
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerAllAccountsRequest requestIdentifier](self, "requestIdentifier"));
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_8;
  }

  v10 = v9;
  if (!v8 || !v9)
  {

    BOOL v12 = 0;
    goto LABEL_10;
  }

  unsigned __int8 v11 = [v8 isEqualToString:v9];

  if ((v11 & 1) != 0)
  {
LABEL_8:
    completionHandlers = self->_completionHandlers;
    id v8 = (id)objc_claimAutoreleasedReturnValue([v4 completionHandlers]);
    -[NSMutableSet unionSet:](completionHandlers, "unionSet:", v8);
    BOOL v12 = 1;
LABEL_10:

    goto LABEL_11;
  }

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    -[NSMutableSet addObject:](completionHandlers, "addObject:", v4);
  }

- (void)callCompletionsWithAccounts:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = self->_completionHandlers;
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
  id v5 = sub_1003DE65C(-[PDAccountManagerAllAccountsRequest requestType](self, "requestType"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestType: '%@'; ", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerAllAccountsRequest requestIdentifier](self, "requestIdentifier"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestIdentifier: '%@'; ", v7);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return (NSString *)v3;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end