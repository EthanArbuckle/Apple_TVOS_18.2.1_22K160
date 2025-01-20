@interface PDCloudStoreResetRequest
- (BOOL)_canCoalesceRequest:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (NSArray)completionHandlers;
- (NSDictionary)additionalZoneIDsByDatabaseIdentifier;
- (NSSet)includeCachedZonesForDatabaseIdentifiers;
- (PDCloudStoreResetRequest)init;
- (PDCloudStoreResetRequest)initWithCompletion:(id)a3;
- (id)description;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithSuccess:(BOOL)a3 error:(id)a4;
- (void)setAdditionalZoneIDsByDatabaseIdentifier:(id)a3;
- (void)setIncludeCachedZonesForDatabaseIdentifiers:(id)a3;
@end

@implementation PDCloudStoreResetRequest

- (PDCloudStoreResetRequest)initWithCompletion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDCloudStoreResetRequest;
  v5 = -[PDCloudStoreResetRequest init](&v11, "init");
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
  }

  return v5;
}

- (PDCloudStoreResetRequest)init
{
  return -[PDCloudStoreResetRequest initWithCompletion:](self, "initWithCompletion:", 0LL);
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v4);
  }

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PDCloudStoreResetRequest _canCoalesceRequest:](self, "_canCoalesceRequest:", v4);
  if (v5)
  {
    completionHandlers = self->_completionHandlers;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 completionHandlers]);
    -[NSMutableArray addObjectsFromArray:](completionHandlers, "addObjectsFromArray:", v7);
  }

  return v5;
}

- (void)callCompletionsWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = -[NSMutableArray copy](self->_completionHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      objc_super v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8LL * (void)v11) + 16LL))(*(void *)(*((void *)&v12 + 1) + 8LL * (void)v11));
        objc_super v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (BOOL)_canCoalesceRequest:(id)a3
{
  id v4 = a3;
  includeCachedZonesForDatabaseIdentifiers = self->_includeCachedZonesForDatabaseIdentifiers;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 includeCachedZonesForDatabaseIdentifiers]);
  LODWORD(includeCachedZonesForDatabaseIdentifiers) = PKEqualObjects(includeCachedZonesForDatabaseIdentifiers, v6);

  if ((_DWORD)includeCachedZonesForDatabaseIdentifiers)
  {
    additionalZoneIDsByDatabaseIdentifier = self->_additionalZoneIDsByDatabaseIdentifier;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 additionalZoneIDsByDatabaseIdentifier]);
    char v9 = PKEqualObjects(additionalZoneIDsByDatabaseIdentifier, v8);
  }

  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@: %p; ", objc_opt_class(self, v4), self);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"includeCachedZonesForDatabaseIdentifiers: '%@'; ",
    self->_includeCachedZonesForDatabaseIdentifiers);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"additionalZoneIDsByDatabaseIdentifier: '%@'; ",
    self->_additionalZoneIDsByDatabaseIdentifier);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return v3;
}

- (NSSet)includeCachedZonesForDatabaseIdentifiers
{
  return self->_includeCachedZonesForDatabaseIdentifiers;
}

- (void)setIncludeCachedZonesForDatabaseIdentifiers:(id)a3
{
}

- (NSDictionary)additionalZoneIDsByDatabaseIdentifier
{
  return self->_additionalZoneIDsByDatabaseIdentifier;
}

- (void)setAdditionalZoneIDsByDatabaseIdentifier:(id)a3
{
}

- (NSArray)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end