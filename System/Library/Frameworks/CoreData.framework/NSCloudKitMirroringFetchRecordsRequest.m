@interface NSCloudKitMirroringFetchRecordsRequest
- (BOOL)validateForUseWithStore:(id)a3 error:(id *)a4;
- (NSArray)objectIDsToFetch;
- (NSCloudKitMirroringFetchRecordsRequest)initWithOptions:(id)a3 completionBlock:(id)a4;
- (NSDictionary)entityNameToAttributesToFetch;
- (void)dealloc;
- (void)setEntityNameToAttributeNamesToFetch:(id)a3;
- (void)setEntityNameToAttributesToFetch:(id)a3;
- (void)setObjectIDsToFetch:(id)a3;
- (void)throwNotEditable:(uint64_t)a1;
@end

@implementation NSCloudKitMirroringFetchRecordsRequest

- (NSCloudKitMirroringFetchRecordsRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringFetchRecordsRequest;
  v4 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](&v6, sel_initWithOptions_completionBlock_, a3, a4);
  if (v4)
  {
    v4->_objectIDsToFetch = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    v4->_entityNameToAttributeNamesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x189603F68]);
    v4->_entityNameToAttributesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x189603F68]);
    v4->_editable = 1;
    v4->_perOperationObjectThreshold = 400LL;
  }

  return v4;
}

- (void)dealloc
{
  self->_entityNameToAttributesToFetch = 0LL;
  self->_entityNameToAttributeNamesToFetch = 0LL;

  self->_objectIDsToFetch = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringFetchRecordsRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (NSDictionary)entityNameToAttributesToFetch
{
  return self->_entityNameToAttributesToFetch;
}

- (void)setEntityNameToAttributesToFetch:(id)a3
{
  if (self->_editable)
  {
    entityNameToAttributesToFetch = self->_entityNameToAttributesToFetch;
    if (entityNameToAttributesToFetch != a3)
    {

      self->_entityNameToAttributesToFetch = (NSDictionary *)[a3 copy];
      if (-[NSDictionary count](self->_entityNameToAttributeNamesToFetch, "count"))
      {

        self->_entityNameToAttributeNamesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x189603F68]);
      }
    }
  }

  else
  {
    -[NSCloudKitMirroringFetchRecordsRequest throwNotEditable:]((uint64_t)self, a2);
  }

- (void)throwNotEditable:(uint64_t)a1
{
  if (a1)
  {
    objc_super v3 = (void *)MEMORY[0x189603F70];
    uint64_t v4 = *MEMORY[0x189603A58];
    v5 = (void *)NSString;
    objc_super v6 = NSStringFromSelector(aSelector);
    v7 = (void *)[v3 exceptionWithName:v4, objc_msgSend( v5, "stringWithFormat:", @"%@ called after the request was sent to %@\nRequest: %@", v6, NSStringFromSelector(sel_executeRequest_error_), a1), 0 reason userInfo];
    objc_exception_throw(v7);
  }

- (void)setEntityNameToAttributeNamesToFetch:(id)a3
{
  if (self->_editable)
  {
    entityNameToAttributeNamesToFetch = self->_entityNameToAttributeNamesToFetch;
    if (entityNameToAttributeNamesToFetch != a3)
    {

      self->_entityNameToAttributeNamesToFetch = (NSDictionary *)[a3 copy];
      if (-[NSDictionary count](self->_entityNameToAttributesToFetch, "count"))
      {

        self->_entityNameToAttributesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x189603F68]);
      }
    }
  }

  else
  {
    -[NSCloudKitMirroringFetchRecordsRequest throwNotEditable:]((uint64_t)self, a2);
  }

- (void)setObjectIDsToFetch:(id)a3
{
  if (self->_editable)
  {
    objectIDsToFetch = self->_objectIDsToFetch;
    if (objectIDsToFetch != a3)
    {

      self->_objectIDsToFetch = (NSArray *)[a3 copy];
    }
  }

  else
  {
    -[NSCloudKitMirroringFetchRecordsRequest throwNotEditable:]((uint64_t)self, a2);
  }

- (BOOL)validateForUseWithStore:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x1895F89C0];
  v29 = 0LL;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringFetchRecordsRequest;
  if (!-[NSCloudKitMirroringRequest validateForUseWithStore:error:](&v28, sel_validateForUseWithStore_error_, a3, &v29)) {
    goto LABEL_10;
  }
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
  if (-[NSDictionary count](self->_entityNameToAttributesToFetch, "count"))
  {
    entityNameToAttributesToFetch = self->_entityNameToAttributesToFetch;
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke;
    v27[3] = &unk_189EA9800;
    v27[4] = v9;
    v27[5] = v8;
    v27[6] = v7;
    v11 = v27;
LABEL_6:
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( entityNameToAttributesToFetch,  "enumerateKeysAndObjectsUsingBlock:",  v11);
    goto LABEL_7;
  }

  if (-[NSDictionary count](self->_entityNameToAttributeNamesToFetch, "count"))
  {
    entityNameToAttributesToFetch = self->_entityNameToAttributeNamesToFetch;
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_3;
    v26[3] = &unk_189EA9800;
    v26[4] = v9;
    v26[5] = v8;
    v26[6] = v7;
    v11 = v26;
    goto LABEL_6;
  }

void __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke( id *a1,  uint64_t a2,  void *a3)
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a1[4], "entitiesByName"), "objectForKey:", a2);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (id)[a1[5] objectForKey:a2];
    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
      [a1[5] setObject:v9 forKey:a2];
      id v8 = v9;
    }

    id v10 = v8;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_2;
    v11[3] = &unk_189EA97D8;
    v11[4] = v7;
    v11[5] = v8;
    v11[6] = a1[6];
    v11[7] = a2;
    [a3 enumerateObjectsUsingBlock:v11];
  }

  else
  {
    [a1[6] addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ - entity not found in model", a2)];
  }

uint64_t __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "attributesByName"), "objectForKey:", objc_msgSend(a2, "name"));
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void **)(a1 + 40);
  }

  else
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v5 = [NSString stringWithFormat:@"%@.%@ - attribute not found on entity", *(void *)(a1 + 56), objc_msgSend(a2, "name")];
    uint64_t v6 = v7;
  }

  return [v6 addObject:v5];
}

void __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_3( id *a1,  uint64_t a2,  void *a3)
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a1[4], "entitiesByName"), "objectForKey:", a2);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (id)[a1[5] objectForKey:a2];
    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
      [a1[5] setObject:v9 forKey:a2];
      id v8 = v9;
    }

    id v10 = v8;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_4;
    v11[3] = &unk_189EA9828;
    v11[4] = v7;
    v11[5] = v8;
    v11[6] = a1[6];
    v11[7] = a2;
    [a3 enumerateObjectsUsingBlock:v11];
  }

  else
  {
    [a1[6] addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ - entity not found in model", a2)];
  }

uint64_t __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "attributesByName"), "objectForKey:", a2);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void **)(a1 + 40);
  }

  else
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v5 = [NSString stringWithFormat:@"%@.%@ - attribute not found on entity", *(void *)(a1 + 56), a2];
    uint64_t v6 = v7;
  }

  return [v6 addObject:v5];
}

- (NSArray)objectIDsToFetch
{
  return self->_objectIDsToFetch;
}

@end