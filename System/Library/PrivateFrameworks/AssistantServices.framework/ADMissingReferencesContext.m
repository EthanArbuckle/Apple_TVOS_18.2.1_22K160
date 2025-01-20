@interface ADMissingReferencesContext
- (ADMissingReferencesContext)initWithMissingReferences:(id)a3 forRequestId:(id)a4;
- (BOOL)hasBeenFulfilled;
- (NSArray)missingReferences;
- (NSMutableSet)_mutableResolvedIds;
- (NSSet)resolvedReferences;
- (NSString)requestId;
- (id)fulfillmentBlock;
- (void)setFulfillmentBlock:(id)a3;
- (void)setHasBeenFulfilled:(BOOL)a3;
- (void)set_mutableResolvedIds:(id)a3;
@end

@implementation ADMissingReferencesContext

- (ADMissingReferencesContext)initWithMissingReferences:(id)a3 forRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ADMissingReferencesContext;
  v8 = -[ADMissingReferencesContext init](&v16, "init");
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    missingReferences = v8->_missingReferences;
    v8->_missingReferences = v9;

    v11 = (NSString *)[v7 copy];
    requestId = v8->_requestId;
    v8->_requestId = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    mutableResolvedIds = v8->_mutableResolvedIds;
    v8->_mutableResolvedIds = v13;
  }

  return v8;
}

- (NSSet)resolvedReferences
{
  return (NSSet *)self->_mutableResolvedIds;
}

- (NSMutableSet)_mutableResolvedIds
{
  return self->_mutableResolvedIds;
}

- (void)set_mutableResolvedIds:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSArray)missingReferences
{
  return self->_missingReferences;
}

- (id)fulfillmentBlock
{
  return self->_fulfillmentBlock;
}

- (void)setFulfillmentBlock:(id)a3
{
}

- (BOOL)hasBeenFulfilled
{
  return self->_hasBeenFulfilled;
}

- (void)setHasBeenFulfilled:(BOOL)a3
{
  self->_hasBeenFulfilled = a3;
}

- (void).cxx_destruct
{
}

@end