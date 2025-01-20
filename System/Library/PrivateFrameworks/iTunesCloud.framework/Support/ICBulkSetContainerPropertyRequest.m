@interface ICBulkSetContainerPropertyRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4 properties:(id)a5;
- (ICBulkSetContainerPropertyRequest)initWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4 properties:(id)a5;
- (id)_bodyDataForContainerIDs:(id)a3 properties:(id)a4;
@end

@implementation ICBulkSetContainerPropertyRequest

- (ICBulkSetContainerPropertyRequest)initWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/containers/edit",  v6));
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ICBulkSetContainerPropertyRequest;
  v11 = -[ICDRequest initWithAction:](&v14, "initWithAction:", v10);

  if (v11)
  {
    -[ICDRequest setMethod:](v11, "setMethod:", 1LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[ICBulkSetContainerPropertyRequest _bodyDataForContainerIDs:properties:]( v11,  "_bodyDataForContainerIDs:properties:",  v8,  v9));
    -[ICDRequest setBodyData:](v11, "setBodyData:", v12);
  }

  return v11;
}

- (id)_bodyDataForContainerIDs:(id)a3 properties:(id)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002E1E0;
  v11[3] = &unk_1001A3A08;
  id v12 = a3;
  id v13 = a4;
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[ICDAAPPropertyInfo sharedContainerPropertyInfo]( &OBJC_CLASS___ICDAAPPropertyInfo,  "sharedContainerPropertyInfo"));
  id v5 = v14;
  id v6 = v13;
  id v7 = v12;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1835360883LL, 1LL, v11);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v9;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v11 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v10)),  "initWithDatabaseID:containerIDs:properties:",  v6,  v9,  v8);

  return v11;
}

@end