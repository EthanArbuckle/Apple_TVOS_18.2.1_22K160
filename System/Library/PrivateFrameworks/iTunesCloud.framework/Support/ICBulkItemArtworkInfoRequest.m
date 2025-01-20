@interface ICBulkItemArtworkInfoRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5;
@end

@implementation ICBulkItemArtworkInfoRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v10 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v9)),  "initWithDatabaseID:cloudIDs:itemKind:useLongIDs:",  v6,  v8,  2,  v5);

  return v10;
}

@end