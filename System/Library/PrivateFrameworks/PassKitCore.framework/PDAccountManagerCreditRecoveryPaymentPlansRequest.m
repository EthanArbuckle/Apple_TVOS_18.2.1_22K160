@interface PDAccountManagerCreditRecoveryPaymentPlansRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)force;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)description;
- (PDAccountManagerCreditRecoveryPaymentPlansRequest)initWithAccountIdentifier:(id)a3 force:(BOOL)a4;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithPaymentPlans:(id)a3 error:(id)a4;
@end

@implementation PDAccountManagerCreditRecoveryPaymentPlansRequest

- (PDAccountManagerCreditRecoveryPaymentPlansRequest)initWithAccountIdentifier:(id)a3 force:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDAccountManagerCreditRecoveryPaymentPlansRequest;
  v8 = -[PDAccountManagerCreditRecoveryPaymentPlansRequest init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountIdentifier, a3);
    v9->_force = a4;
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completionHandlers = v9->_completionHandlers;
    v9->_completionHandlers = v10;
  }

  return v9;
}

- (unint64_t)requestType
{
  return 14LL;
}

- (id)requestIdentifier
{
  v3 = sub_1003DE65C(-[PDAccountManagerCreditRecoveryPaymentPlansRequest requestType](self, "requestType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v4,  self->_accountIdentifier));

  return v5;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)-[PDAccountManagerCreditRecoveryPaymentPlansRequest requestType](self, "requestType")) {
    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerCreditRecoveryPaymentPlansRequest requestIdentifier](self, "requestIdentifier"));
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
LABEL_12:

    goto LABEL_13;
  }

  unsigned __int8 v11 = [v8 isEqualToString:v9];

  if ((v11 & 1) != 0)
  {
LABEL_8:
    completionHandlers = self->_completionHandlers;
    id v8 = (id)objc_claimAutoreleasedReturnValue([v4 completionHandlers]);
    -[NSMutableSet unionSet:](completionHandlers, "unionSet:", v8);
    BOOL v12 = 1;
    goto LABEL_12;
  }

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    -[NSMutableSet addObject:](completionHandlers, "addObject:", v4);
  }

- (void)callCompletionsWithPaymentPlans:(id)a3 error:(id)a4
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
  id v5 = sub_1003DE65C(-[PDAccountManagerCreditRecoveryPaymentPlansRequest requestType](self, "requestType"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestType: '%@'; ", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerCreditRecoveryPaymentPlansRequest requestIdentifier](self, "requestIdentifier"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestIdentifier: '%@'; ", v7);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"accountIdentifier: '%@'; ", self->_accountIdentifier);
  if (self->_force) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"force: '%@'; ", v8);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return (NSString *)v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)force
{
  return self->_force;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end