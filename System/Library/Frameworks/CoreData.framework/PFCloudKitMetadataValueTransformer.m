@interface PFCloudKitMetadataValueTransformer
+ (NSArray)allowedTopLevelClasses;
@end

@implementation PFCloudKitMetadataValueTransformer

+ (NSArray)allowedTopLevelClasses
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___PFCloudKitMetadataValueTransformer;
  v2 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithArray:",  objc_msgSendSuper2(&v13, sel_allowedTopLevelClasses));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  getCloudKitCKRecordClass();
  v14[0] = objc_opt_class();
  getCloudKitCKShareClass();
  v14[1] = objc_opt_class();
  getCloudKitCKRecordIDClass();
  v14[2] = objc_opt_class();
  getCloudKitCKRecordZoneIDClass();
  v14[3] = objc_opt_class();
  getCloudKitCKServerChangeTokenClass();
  v14[4] = objc_opt_class();
  getCloudKitCKNotificationInfoClass();
  v14[5] = objc_opt_class();
  v14[6] = objc_opt_class();
  v3 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v14 count:7];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [v2 addObject:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }

    while (v5);
  }

  return (NSArray *)v2;
}

@end