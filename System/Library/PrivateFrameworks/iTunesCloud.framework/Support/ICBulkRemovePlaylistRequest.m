@interface ICBulkRemovePlaylistRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 containerID:(unsigned int)a4;
+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4;
@end

@implementation ICBulkRemovePlaylistRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 containerID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_alloc((Class)objc_opt_class(a1, a2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  id v9 = [v6 initWithDatabaseID:v5 sagaIDs:v8 itemKind:1];

  return v9;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v8 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v7)), "initWithDatabaseID:sagaIDs:itemKind:", v4, v6, 1);

  return v8;
}

@end