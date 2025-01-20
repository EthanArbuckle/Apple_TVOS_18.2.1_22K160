@interface PDPaymentOffersManagerCatalogFetchRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)fromPush;
- (NSSet)completionHandlers;
- (NSString)description;
- (PDPaymentOffersManagerCatalogFetchRequest)initWithFromPush:(BOOL)a3 completion:(id)a4;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithCatalog:(id)a3 error:(id)a4;
@end

@implementation PDPaymentOffersManagerCatalogFetchRequest

- (PDPaymentOffersManagerCatalogFetchRequest)initWithFromPush:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDPaymentOffersManagerCatalogFetchRequest;
  v7 = -[PDPaymentOffersManagerCatalogFetchRequest init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_fromPush = a3;
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    completionHandlers = v8->_completionHandlers;
    v8->_completionHandlers = v9;

    -[PDPaymentOffersManagerCatalogFetchRequest addCompletion:](v8, "addCompletion:", v6);
  }

  return v8;
}

- (unint64_t)requestType
{
  return 0LL;
}

- (id)requestIdentifier
{
  return @"catalog";
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)-[PDPaymentOffersManagerCatalogFetchRequest requestType](self, "requestType")) {
    goto LABEL_6;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentOffersManagerCatalogFetchRequest requestIdentifier](self, "requestIdentifier"));
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
    id v8 = v4;
    completionHandlers = self->_completionHandlers;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 completionHandlers]);
    -[NSMutableSet unionSet:](completionHandlers, "unionSet:", v10);
    BOOL v12 = 1;
    goto LABEL_12;
  }

- (void)addCompletion:(id)a3
{
  completionHandlers = self->_completionHandlers;
  id v4 = objc_retainBlock(a3);
  -[NSMutableSet pk_safelyAddObject:](completionHandlers, "pk_safelyAddObject:", v4);
}

- (void)callCompletionsWithCatalog:(id)a3 error:(id)a4
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
  -[PDPaymentOffersManagerCatalogFetchRequest requestType](self, "requestType");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestType: '%@'; ", @"catalog");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentOffersManagerCatalogFetchRequest requestIdentifier](self, "requestIdentifier"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requestIdentifier: '%@'; ", v5);

  if (self->_fromPush) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"fromPush: '%@'; ", v6);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return (NSString *)v3;
}

- (BOOL)fromPush
{
  return self->_fromPush;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end