@interface ICBulkSetItemPropertyRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 albumArtistCloudLibraryIDs:(id)a4 properties:(id)a5;
+ (id)requestWithDatabaseID:(unsigned int)a3 albumCloudLibraryIDs:(id)a4 properties:(id)a5;
+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 properties:(id)a5 useLongIDs:(BOOL)a6;
- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 albumArtistCloudLibraryIDs:(id)a4 properties:(id)a5;
- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 albumCloudLibraryIDs:(id)a4 properties:(id)a5;
- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 properties:(id)a5 useLongIDs:(BOOL)a6;
- (id)_bodyDataForItemIDs:(id)a3 properties:(id)a4 useLongIDs:(BOOL)a5;
- (id)_bodyDataForItemKind:(unsigned __int8)a3 cloudLibraryIDs:(id)a4 properties:(id)a5;
@end

@implementation ICBulkSetItemPropertyRequest

- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 properties:(id)a5 useLongIDs:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/items/edit",  v8));
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ICBulkSetItemPropertyRequest;
  v13 = -[ICDRequest initWithAction:](&v16, "initWithAction:", v12);

  if (v13)
  {
    -[ICDRequest setMethod:](v13, "setMethod:", 1LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[ICBulkSetItemPropertyRequest _bodyDataForItemIDs:properties:useLongIDs:]( v13,  "_bodyDataForItemIDs:properties:useLongIDs:",  v10,  v11,  v6));
    -[ICDRequest setBodyData:](v13, "setBodyData:", v14);
  }

  return v13;
}

- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 albumArtistCloudLibraryIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/edit",  v6));
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ICBulkSetItemPropertyRequest;
  id v11 = -[ICDRequest initWithAction:](&v14, "initWithAction:", v10);

  if (v11)
  {
    -[ICDRequest setMethod:](v11, "setMethod:", 1LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[ICBulkSetItemPropertyRequest _bodyDataForItemKind:cloudLibraryIDs:properties:]( v11,  "_bodyDataForItemKind:cloudLibraryIDs:properties:",  6LL,  v8,  v9));
    -[ICDRequest setBodyData:](v11, "setBodyData:", v12);
  }

  return v11;
}

- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 albumCloudLibraryIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/edit",  v6));
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ICBulkSetItemPropertyRequest;
  id v11 = -[ICDRequest initWithAction:](&v14, "initWithAction:", v10);

  if (v11)
  {
    -[ICDRequest setMethod:](v11, "setMethod:", 1LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[ICBulkSetItemPropertyRequest _bodyDataForItemKind:cloudLibraryIDs:properties:]( v11,  "_bodyDataForItemKind:cloudLibraryIDs:properties:",  7LL,  v8,  v9));
    -[ICDRequest setBodyData:](v11, "setBodyData:", v12);
  }

  return v11;
}

- (id)_bodyDataForItemIDs:(id)a3 properties:(id)a4 useLongIDs:(BOOL)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B340C;
  v12[3] = &unk_1001A4BC0;
  BOOL v16 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[ICDAAPPropertyInfo sharedItemPropertyInfo](&OBJC_CLASS___ICDAAPPropertyInfo, "sharedItemPropertyInfo"));
  id v6 = v15;
  id v7 = v14;
  id v8 = v13;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1835360883LL, 2LL, v12);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v10;
}

- (id)_bodyDataForItemKind:(unsigned __int8)a3 cloudLibraryIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000B3010;
  v13[3] = &unk_1001A4BC0;
  id v14 = a4;
  id v15 = a5;
  char v17 = v6;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[ICDAAPPropertyInfo sharedItemPropertyInfo](&OBJC_CLASS___ICDAAPPropertyInfo, "sharedItemPropertyInfo"));
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1835360883LL, v6, v13);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v11;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 properties:(id)a5 useLongIDs:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a4;
  id v13 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithDatabaseID:itemIDs:properties:useLongIDs:",  v8,  v11,  v10,  v6);

  return v13;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 albumArtistCloudLibraryIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v10)),  "initWithDatabaseID:albumArtistCloudLibraryIDs:properties:",  v6,  v9,  v8);

  return v11;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 albumCloudLibraryIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v10)),  "initWithDatabaseID:albumCloudLibraryIDs:properties:",  v6,  v9,  v8);

  return v11;
}

@end