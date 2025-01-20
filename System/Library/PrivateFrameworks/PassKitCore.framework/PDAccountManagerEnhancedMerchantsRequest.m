@interface PDAccountManagerEnhancedMerchantsRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)ignoreErrorBackoff;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)description;
- (PDAccountManagerEnhancedMerchantsRequest)initWithAccountIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5;
- (id)requestIdentifier;
- (unint64_t)cooldownLevel;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithEnhancedMerchants:(id)a3 error:(id)a4 lastUpdate:(id)a5;
@end

@implementation PDAccountManagerEnhancedMerchantsRequest

- (PDAccountManagerEnhancedMerchantsRequest)initWithAccountIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDAccountManagerEnhancedMerchantsRequest;
  v10 = -[PDAccountManagerEnhancedMerchantsRequest init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accountIdentifier, a3);
    v11->_ignoreErrorBackoff = a4;
    v11->_cooldownLevel = a5;
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completionHandlers = v11->_completionHandlers;
    v11->_completionHandlers = v12;
  }

  return v11;
}

- (unint64_t)requestType
{
  return 9LL;
}

- (id)requestIdentifier
{
  v3 = sub_1003DE65C(-[PDAccountManagerEnhancedMerchantsRequest requestType](self, "requestType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v4,  self->_accountIdentifier));

  return v5;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)-[PDAccountManagerEnhancedMerchantsRequest requestType](self, "requestType")) {
    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerEnhancedMerchantsRequest requestIdentifier](self, "requestIdentifier"));
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
    id v13 = v4;
    self->_cooldownLevel = PKStricterAccountEnhancedMerchantCooldownLevel( self->_cooldownLevel,  [v13 cooldownLevel]);
    completionHandlers = self->_completionHandlers;
    id v8 = (id)objc_claimAutoreleasedReturnValue([v13 completionHandlers]);

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

- (void)callCompletionsWithEnhancedMerchants:(id)a3 error:(id)a4 lastUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  unsigned __int8 v11 = self->_completionHandlers;
  id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      objc_super v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8LL * (void)v15) + 16LL))(*(void *)(*((void *)&v16 + 1) + 8LL * (void)v15));
        objc_super v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v13);
  }
}

- (NSString)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@: %p; ", objc_opt_class(self, v4), self);
  id v5 = sub_1003DE65C(-[PDAccountManagerEnhancedMerchantsRequest requestType](self, "requestType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestType: '%@'; ", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountManagerEnhancedMerchantsRequest requestIdentifier](self, "requestIdentifier"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestIdentifier: '%@'; ", v7);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"accountIdentifier: '%@'; ", self->_accountIdentifier);
  if (self->_ignoreErrorBackoff) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"ignoreErrorBackoff: '%@'; ", v8);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return (NSString *)v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)ignoreErrorBackoff
{
  return self->_ignoreErrorBackoff;
}

- (unint64_t)cooldownLevel
{
  return self->_cooldownLevel;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end