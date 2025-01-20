@interface ICSubscribedContainersRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4;
- (ICSubscribedContainersRequest)initWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4;
- (id)_bodyDataForContainerIDs:(id)a3;
@end

@implementation ICSubscribedContainersRequest

- (ICSubscribedContainersRequest)initWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/subscribed-containers",  v4));
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ICSubscribedContainersRequest;
  v8 = -[ICDRequest initWithAction:](&v11, "initWithAction:", v7);

  if (v8)
  {
    -[ICDRequest setMethod:](v8, "setMethod:", 1LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSubscribedContainersRequest _bodyDataForContainerIDs:](v8, "_bodyDataForContainerIDs:", v6));
    -[ICDRequest setBodyData:](v8, "setBodyData:", v9);
  }

  return v8;
}

- (id)_bodyDataForContainerIDs:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A11AC;
  v7[3] = &unk_1001A70B8;
  id v8 = a3;
  id v3 = v8;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634366275LL, 1LL, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v5;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v8 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v7)), "initWithDatabaseID:containerIDs:", v4, v6);

  return v8;
}

@end