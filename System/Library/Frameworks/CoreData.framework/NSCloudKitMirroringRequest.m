@interface NSCloudKitMirroringRequest
+ (id)allRequestClasses;
- (BOOL)validateForUseWithStore:(id)a3 error:(id *)a4;
- (NSCloudKitMirroringRequest)initWithActivity:(id)a3 options:(id)a4 completionBlock:(id)a5;
- (NSCloudKitMirroringRequest)initWithOptions:(id)a3 completionBlock:(id)a4;
- (NSCloudKitMirroringRequestOptions)options;
- (NSUUID)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDefaultOptions;
- (id)description;
- (id)requestCompletionBlock;
- (uint64_t)_invokeContainerBlocksWithResult:(uint64_t)result;
- (uint64_t)invokeCompletionBlockWithResult:(uint64_t)result;
- (unint64_t)requestType;
- (void)addContainerBlock:(uint64_t)a1;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringRequest

- (NSCloudKitMirroringRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringRequest;
  v6 = -[NSCloudKitMirroringRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3) {
      uint64_t v8 = [a3 copy];
    }
    else {
      uint64_t v8 = -[NSCloudKitMirroringRequest createDefaultOptions](v6, "createDefaultOptions");
    }
    v7->_options = (NSCloudKitMirroringRequestOptions *)v8;
    v7->_requestIdentifier = (NSUUID *)objc_alloc_init(MEMORY[0x189607AB8]);
    v7->_requestCompletionBlock = (id)[a4 copy];
    v7->_deferredByBackgroundTimeout = 0;
    v7->_containerBlocks = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  }

  return v7;
}

- (NSCloudKitMirroringRequest)initWithActivity:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  v6 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](self, "initWithOptions:completionBlock:", a4, a5);
  if (v6) {
    v6->_schedulerActivity = (CKSchedulerActivity *)a3;
  }
  return v6;
}

- (void)dealloc
{
  self->_requestIdentifier = 0LL;
  self->_options = 0LL;

  self->_requestCompletionBlock = 0LL;
  self->_schedulerActivity = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (unint64_t)requestType
{
  return 9LL;
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> %@", NSStringFromClass(v4), self, self->_requestIdentifier];
}

- (id)createDefaultOptions
{
  return objc_alloc_init(&OBJC_CLASS___NSCloudKitMirroringRequestOptions);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringRequest;
  v4 = -[NSPersistentStoreRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[2] = self->_requestIdentifier;
  v4[3] = self->_options;
  v4[4] = self->_requestCompletionBlock;
  v4[8] = self->_schedulerActivity;
  *((_BYTE *)v4 + 56) = self->_isContainerRequest;
  v4[6] = -[NSMutableArray mutableCopy](self->_containerBlocks, "mutableCopy");
  return v4;
}

- (BOOL)validateForUseWithStore:(id)a3 error:(id *)a4
{
  return 1;
}

- (uint64_t)invokeCompletionBlockWithResult:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 32);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
    }
    return -[NSCloudKitMirroringRequest _invokeContainerBlocksWithResult:](v2);
  }

  return result;
}

- (uint64_t)_invokeContainerBlocksWithResult:(uint64_t)result
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (result)
  {
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    __int128 v5 = 0u;
    __int128 v6 = 0u;
    v1 = *(void **)(result + 48);
    result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v6;
      do
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v6 != v3) {
            objc_enumerationMutation(v1);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v5 + 1) + 8 * v4++) + 16LL))();
        }

        while (v2 != v4);
        result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
        uint64_t v2 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)addContainerBlock:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (void *)MEMORY[0x186E3E5D8]();
    __int128 v5 = (void *)[a2 copy];
    [*(id *)(a1 + 48) addObject:v5];

    objc_autoreleasePoolPop(v4);
  }

+ (id)allRequestClasses
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)MEMORY[0x189604010];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v3 = [MEMORY[0x189603F18] arrayWithObjects:&v5 count:11];
  return (id)objc_msgSend(v2, "setWithArray:", v3, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSCloudKitMirroringRequestOptions)options
{
  return self->_options;
}

- (id)requestCompletionBlock
{
  return self->_requestCompletionBlock;
}

@end