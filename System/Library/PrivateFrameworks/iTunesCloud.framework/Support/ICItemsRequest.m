@interface ICItemsRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7;
+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8;
+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8 paginationToken:(id)a9;
+ (id)requestWithDatabaseID:(unsigned int)a3 paginationToken:(id)a4;
- (ICItemsRequest)initWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8 paginationToken:(id)a9;
- (double)timeoutInterval;
- (id)_bodyDataForMetadataFilter:(id)a3 queryFilter:(id)a4 purchaseTokens:(id)a5 includeHiddenItems:(BOOL)a6 includePreorders:(BOOL)a7 paginationToken:(id)a8;
@end

@implementation ICItemsRequest

- (ICItemsRequest)initWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8 paginationToken:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v13 = *(void *)&a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/items",  v13));
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ICItemsRequest;
  v20 = -[ICDRequest initWithAction:](&v23, "initWithAction:", v19);

  if (v20)
  {
    -[ICDRequest setMethod:](v20, "setMethod:", 1LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue( -[ICItemsRequest _bodyDataForMetadataFilter:queryFilter:purchaseTokens:includeHiddenItems:includePreorders:paginationToken:]( v20,  "_bodyDataForMetadataFilter:queryFilter:purchaseTokens:includeHiddenItems:includePreorders:paginationToken:",  v15,  v16,  v17,  v10,  v9,  v18));
    -[ICDRequest setBodyData:](v20, "setBodyData:", v21);

    -[ICDRequest setRequestPersonalizationStyle:](v20, "setRequestPersonalizationStyle:", 2LL);
  }

  return v20;
}

- (double)timeoutInterval
{
  return 180.0;
}

- (id)_bodyDataForMetadataFilter:(id)a3 queryFilter:(id)a4 purchaseTokens:(id)a5 includeHiddenItems:(BOOL)a6 includePreorders:(BOOL)a7 paginationToken:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000ECF00;
  v23[3] = &unk_1001A6220;
  id v24 = v13;
  id v25 = v14;
  BOOL v28 = a6;
  BOOL v29 = a7;
  id v26 = a8;
  id v27 = v15;
  id v16 = v15;
  id v17 = v26;
  id v18 = v14;
  id v19 = v13;
  uint64_t DataForContainer = ICDAAPUtilitiesCreateDataForContainer(1633973106LL, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue(DataForContainer);

  return v21;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 paginationToken:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v8 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v7)),  "initWithDatabaseID:metadataFilter:queryFilter:purchaseTokens:includeHiddenItems:includePreorders:paginationToken:",  v4,  0,  0,  0,  0,  0,  v6);

  return v8;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v10 = *(void *)&a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v16 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v15)),  "initWithDatabaseID:metadataFilter:queryFilter:purchaseTokens:includeHiddenItems:includePreorders:paginationToken:",  v10,  v14,  v13,  v12,  v7,  0,  0);

  return v16;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v12 = *(void *)&a3;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v18 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v17)),  "initWithDatabaseID:metadataFilter:queryFilter:purchaseTokens:includeHiddenItems:includePreorders:paginationToken:",  v12,  v16,  v15,  v14,  v9,  v8,  0);

  return v18;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8 paginationToken:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v14 = *(void *)&a3;
  id v16 = a9;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v21 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v20)),  "initWithDatabaseID:metadataFilter:queryFilter:purchaseTokens:includeHiddenItems:includePreorders:paginationToken:",  v14,  v19,  v18,  v17,  v10,  v9,  v16);

  return v21;
}

@end