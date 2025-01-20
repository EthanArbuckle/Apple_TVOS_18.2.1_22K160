@interface ICBulkPlaylistArtworkInfoRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4;
@end

@implementation ICBulkPlaylistArtworkInfoRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v8 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v7)),  "initWithDatabaseID:cloudIDs:itemKind:useLongIDs:",  v4,  v6,  1,  0);

  return v8;
}

@end