@interface PDAccountStatementMetadataProcessorRequest
- (BOOL)_canCoalesceRequest:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (NSArray)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)statementIdentifier;
- (PDAccountStatementMetadataProcessorRequest)initWithAccountIdentifier:(id)a3 statementIdentifier:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (id)description;
- (unint64_t)reason;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithStatementMetadata:(id)a3 error:(id)a4;
@end

@implementation PDAccountStatementMetadataProcessorRequest

- (PDAccountStatementMetadataProcessorRequest)initWithAccountIdentifier:(id)a3 statementIdentifier:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDAccountStatementMetadataProcessorRequest;
  v14 = -[PDAccountStatementMetadataProcessorRequest init](&v18, "init");
  if (v14)
  {
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    completionHandlers = v14->_completionHandlers;
    v14->_completionHandlers = v15;

    objc_storeStrong((id *)&v14->_accountIdentifier, a3);
    objc_storeStrong((id *)&v14->_statementIdentifier, a4);
    v14->_reason = a5;
    -[PDAccountStatementMetadataProcessorRequest addCompletion:](v14, "addCompletion:", v13);
  }

  return v14;
}

- (void)addCompletion:(id)a3
{
  completionHandlers = self->_completionHandlers;
  id v4 = objc_retainBlock(a3);
  -[NSMutableArray safelyAddObject:](completionHandlers, "safelyAddObject:", v4);
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PDAccountStatementMetadataProcessorRequest _canCoalesceRequest:](self, "_canCoalesceRequest:", v4);
  if (v5)
  {
    completionHandlers = self->_completionHandlers;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 completionHandlers]);
    -[NSMutableArray addObjectsFromArray:](completionHandlers, "addObjectsFromArray:", v7);
  }

  return v5;
}

- (void)callCompletionsWithStatementMetadata:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v8 = self->_completionHandlers;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v12) + 16LL))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v12));
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }
}

- (BOOL)_canCoalesceRequest:(id)a3
{
  id v4 = a3;
  accountIdentifier = self->_accountIdentifier;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
  id v7 = accountIdentifier;
  v8 = v6;
  id v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_10;
  }

  if (v7) {
    BOOL v10 = v8 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {

    goto LABEL_19;
  }

  unsigned int v11 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

  if (v11)
  {
LABEL_10:
    statementIdentifier = self->_statementIdentifier;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 statementIdentifier]);
    __int128 v14 = statementIdentifier;
    __int128 v15 = v13;
    id v7 = v15;
    if (v14 == v15)
    {

      goto LABEL_16;
    }

    if (v14 && v15)
    {
      unsigned int v16 = -[NSString isEqualToString:](v14, "isEqualToString:", v15);

      if (!v16) {
        goto LABEL_19;
      }
LABEL_16:
      id reason = (id)self->_reason;
      BOOL v18 = reason == [v4 reason];
LABEL_20:

      goto LABEL_21;
    }

LABEL_19:
    BOOL v18 = 0;
    goto LABEL_20;
  }

  BOOL v18 = 0;
LABEL_21:

  return v18;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@: %p; ", objc_opt_class(self, v4), self);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"accountIdentifier: '%@'; ", self->_accountIdentifier);
  if (self->_statementIdentifier) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"statementIdentifier: '%@'; ",
  }
      self->_statementIdentifier);
  unint64_t reason = self->_reason;
  id v6 = @"statementChanged";
  if (reason == 1) {
    id v6 = @"manualTrigger";
  }
  if (reason == 2) {
    id v7 = @"scheduledActivity";
  }
  else {
    id v7 = v6;
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"reason: '%@'; ", v7);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSArray)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end