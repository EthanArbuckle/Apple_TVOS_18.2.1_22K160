@interface PFCloudKitOperationBatch
- (PFCloudKitOperationBatch)init;
- (uint64_t)addRecord:(uint64_t)result;
- (void)addDeletedRecordID:(uint64_t)a3 forRecordOfType:;
- (void)dealloc;
@end

@implementation PFCloudKitOperationBatch

- (PFCloudKitOperationBatch)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PFCloudKitOperationBatch;
  v2 = -[PFCloudKitOperationBatch init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sizeInBytes = 0LL;
    v2->_recordTypeToDeletedRecordID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v3->_records = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v3->_deletedRecordIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v3->_recordIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  }

  return v3;
}

- (void)dealloc
{
  self->_recordTypeToDeletedRecordID = 0LL;
  self->_records = 0LL;

  self->_deletedRecordIDs = 0LL;
  self->_recordIDs = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitOperationBatch;
  -[PFCloudKitOperationBatch dealloc](&v3, sel_dealloc);
}

- (uint64_t)addRecord:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    *(void *)(result + 40) += [a2 size];
    [*(id *)(v3 + 24) addObject:a2];
    return objc_msgSend(*(id *)(v3 + 32), "addObject:", objc_msgSend(a2, "recordID"));
  }

  return result;
}

- (void)addDeletedRecordID:(uint64_t)a3 forRecordOfType:
{
  if (a1)
  {
    [*(id *)(a1 + 8) addObject:a2];
    *(void *)(a1 + 40) += +[PFCloudKitSerializer estimateByteSizeOfRecordID:]( (uint64_t)&OBJC_CLASS___PFCloudKitSerializer,  a2);
    id v6 = (id)[*(id *)(a1 + 16) objectForKey:a3];
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x189603FE0]);
      [*(id *)(a1 + 16) setObject:v7 forKey:a3];
      id v6 = v7;
    }

    id v8 = v6;
    [v6 addObject:a2];
  }

@end