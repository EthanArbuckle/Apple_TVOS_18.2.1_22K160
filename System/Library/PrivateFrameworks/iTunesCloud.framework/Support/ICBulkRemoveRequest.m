@interface ICBulkRemoveRequest
- (ICBulkRemoveRequest)initWithDatabaseID:(unsigned int)a3 sagaIDs:(id)a4 itemKind:(unsigned __int8)a5;
- (id)_bodyDataForSagaIDs:(id)a3 itemKind:(unsigned __int8)a4;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICBulkRemoveRequest

- (ICBulkRemoveRequest)initWithDatabaseID:(unsigned int)a3 sagaIDs:(id)a4 itemKind:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ICBulkRemoveRequest;
  v9 = -[ICBulkRemoveRequest init](&v15, "init");
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/edit",  v6));
  v14.receiver = v9;
  v14.super_class = (Class)&OBJC_CLASS___ICBulkRemoveRequest;
  v11 = -[ICDRequest initWithAction:](&v14, "initWithAction:", v10);

  if (v11)
  {
    -[ICDRequest setMethod:](v11, "setMethod:", 1LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBulkRemoveRequest _bodyDataForSagaIDs:itemKind:](v11, "_bodyDataForSagaIDs:itemKind:", v8, v5));
    -[ICDRequest setBodyData:](v11, "setBodyData:", v12);
  }

  return v11;
}

- (id)_bodyDataForSagaIDs:(id)a3 itemKind:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100023CC0;
  v9[3] = &unk_1001A70B8;
  id v10 = a3;
  id v5 = v10;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1835360882LL, v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v7;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICRemoveFromLibraryResponse,  "responseWithResponse:",  a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    v7 = objc_alloc_init(&OBJC_CLASS___DeleteFromLibraryResponseParserDelegate);
    [v6 setDelegate:v7];
    [v6 parse];
    objc_msgSend( v3,  "setUpdateRequired:",  -[DeleteFromLibraryResponseParserDelegate updateRequired](v7, "updateRequired"));
  }

  return v3;
}

@end