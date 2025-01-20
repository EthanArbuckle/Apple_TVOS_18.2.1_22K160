@interface NSCKRecordMetadataReceiptArchive
+ (BOOL)supportsSecureCoding;
- (NSCKRecordMetadataReceiptArchive)initWithCoder:(id)a3;
- (NSCKRecordMetadataReceiptArchive)initWithReceiptsToEncode:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateArchivedRecordIDsUsingBlock:(id)a3;
@end

@implementation NSCKRecordMetadataReceiptArchive

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCKRecordMetadataReceiptArchive)initWithReceiptsToEncode:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSCKRecordMetadataReceiptArchive;
  v3 = -[NSCKRecordMetadataReceiptArchive init](&v17, sel_init);
  if (v3)
  {
    v3->_zoneIDToArchivedReceipts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v4 = [a3 countByEnumeratingWithState:&v13 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(a3);
          }
          v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v9 = (void *)[v8 createRecordIDForMovedRecord];
          id v10 = (id)-[NSMutableDictionary objectForKey:]( v3->_zoneIDToArchivedReceipts,  "objectForKey:",  [v9 zoneID]);
          if (!v10)
          {
            id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
            -[NSMutableDictionary setObject:forKey:]( v3->_zoneIDToArchivedReceipts,  "setObject:forKey:",  v10,  [v9 zoneID]);
          }

          v18 = @"movedAt";
          uint64_t v19 = [v8 movedAt];
          objc_msgSend( v10,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1),  objc_msgSend(v9, "recordName"));
        }

        uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v20 count:16];
      }

      while (v5);
    }
  }

  return v3;
}

- (void)dealloc
{
  self->_zoneIDToArchivedReceipts = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCKRecordMetadataReceiptArchive;
  -[NSCKRecordMetadataReceiptArchive dealloc](&v3, sel_dealloc);
}

- (NSCKRecordMetadataReceiptArchive)initWithCoder:(id)a3
{
  v8[4] = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSCKRecordMetadataReceiptArchive;
  uint64_t v4 = -[NSCKRecordMetadataReceiptArchive init](&v7, sel_init);
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x189604010];
    v8[0] = objc_opt_class();
    getCloudKitCKRecordZoneIDClass();
    v8[1] = objc_opt_class();
    v8[2] = objc_opt_class();
    v8[3] = objc_opt_class();
    v4->_zoneIDToArchivedReceipts = (NSMutableDictionary *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v5,  "setWithArray:",  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:count:",  v8,  4)),  @"archiveDictionary");
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)enumerateArchivedRecordIDsUsingBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  obj = self->_zoneIDToArchivedReceipts;
  uint64_t v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
  if (v16)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v4;
        uint64_t v5 = *(void *)(*((void *)&v22 + 1) + 8 * v4);
        uint64_t v6 = (void *)-[NSMutableDictionary objectForKey:](self->_zoneIDToArchivedReceipts, "objectForKey:", v5);
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (uint64_t i = 0LL; i != v8; ++i)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              v12 = (void *)[objc_alloc(getCloudKitCKRecordIDClass()) initWithRecordName:v11 zoneID:v5];
              (*((void (**)(id, void *, uint64_t))a3 + 2))( a3,  v12,  objc_msgSend((id)objc_msgSend(v6, "objectForKey:", v11), "objectForKey:", @"movedAt"));
            }

            uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }

          while (v8);
        }

        uint64_t v4 = v17 + 1;
      }

      while (v17 + 1 != v16);
      uint64_t v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v27,  16LL);
    }

    while (v16);
  }

@end