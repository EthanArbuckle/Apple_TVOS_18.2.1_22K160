@interface PDPeerPaymentWebServiceAccountFetch
- (BOOL)_canCoalesceRequest:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)fromPush;
- (BOOL)updateAccount;
- (BOOL)updateAssociatedAccounts;
- (BOOL)updatePass;
- (PDPeerPaymentWebServiceAccountFetch)initWithCompletionHandler:(id)a3;
- (id)description;
- (id)diagnosticReasonString;
- (void)addDiagnosticReason:(id)a3;
- (void)addDiagnosticReasons:(id)a3;
- (void)callCompletionsWithAccount:(id)a3;
- (void)setFromPush:(BOOL)a3;
- (void)setUpdateAccount:(BOOL)a3;
- (void)setUpdateAssociatedAccounts:(BOOL)a3;
- (void)setUpdatePass:(BOOL)a3;
@end

@implementation PDPeerPaymentWebServiceAccountFetch

- (PDPeerPaymentWebServiceAccountFetch)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDPeerPaymentWebServiceAccountFetch;
  v5 = -[PDPeerPaymentWebServiceAccountFetch init](&v13, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    completionHandlers = v5->_completionHandlers;
    v5->_completionHandlers = v6;

    if (v4)
    {
      v8 = v5->_completionHandlers;
      id v9 = objc_retainBlock(v4);
      -[NSMutableArray addObject:](v8, "addObject:", v9);
    }

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    diagnosticReasons = v5->_diagnosticReasons;
    v5->_diagnosticReasons = v10;
  }

  return v5;
}

- (void)addDiagnosticReason:(id)a3
{
}

- (void)addDiagnosticReasons:(id)a3
{
  if (a3) {
    -[NSMutableSet unionSet:](self->_diagnosticReasons, "unionSet:");
  }
}

- (void)callCompletionsWithAccount:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_completionHandlers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
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
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (id)diagnosticReasonString
{
  if (-[NSMutableSet count](self->_diagnosticReasons, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_diagnosticReasons, "allObjects"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingSelector:"compare:"]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@","]);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PDPeerPaymentWebServiceAccountFetch _canCoalesceRequest:](self, "_canCoalesceRequest:", v4);
  if (v5)
  {
    -[NSMutableArray addObjectsFromArray:](self->_completionHandlers, "addObjectsFromArray:", v4[1]);
    -[NSMutableSet unionSet:](self->_diagnosticReasons, "unionSet:", v4[2]);
  }

  return v5;
}

- (BOOL)_canCoalesceRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  BOOL v9 = 0;
  if (v4)
  {
    int updateAccount = self->_updateAccount;
    if (updateAccount == [v4 updateAccount])
    {
      int updateAssociatedAccounts = self->_updateAssociatedAccounts;
      if (updateAssociatedAccounts == [v5 updateAssociatedAccounts])
      {
        int updatePass = self->_updatePass;
      }
    }
  }

  return v9;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = v4;
  if (self->_updateAccount) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  [v4 appendFormat:@"updateAccount: '%@'; ", v6];
  if (self->_updateAssociatedAccounts) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  [v5 appendFormat:@"updateAssociatedAccounts: '%@'; ", v7];
  if (self->_updatePass) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  [v5 appendFormat:@"updatePass: '%@'; ", v8];
  [v5 appendFormat:@"diagnosticReasons: '%@'; ", self->_diagnosticReasons];
  id v9 = [v5 copy];

  return v9;
}

- (BOOL)updateAccount
{
  return self->_updateAccount;
}

- (void)setUpdateAccount:(BOOL)a3
{
  self->_int updateAccount = a3;
}

- (BOOL)updateAssociatedAccounts
{
  return self->_updateAssociatedAccounts;
}

- (void)setUpdateAssociatedAccounts:(BOOL)a3
{
  self->_int updateAssociatedAccounts = a3;
}

- (BOOL)updatePass
{
  return self->_updatePass;
}

- (void)setUpdatePass:(BOOL)a3
{
  self->_int updatePass = a3;
}

- (BOOL)fromPush
{
  return self->_fromPush;
}

- (void)setFromPush:(BOOL)a3
{
  self->_fromPush = a3;
}

- (void).cxx_destruct
{
}

@end