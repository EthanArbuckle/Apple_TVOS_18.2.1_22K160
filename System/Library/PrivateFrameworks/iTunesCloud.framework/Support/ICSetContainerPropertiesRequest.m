@interface ICSetContainerPropertiesRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 containerID:(unsigned int)a5 trackList:(id)a6 properties:(id)a7;
- (ICSetContainerPropertiesRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 containerID:(unsigned int)a5 trackList:(id)a6 properties:(id)a7;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 containerID:(unsigned int)a4 trackList:(id)a5 properties:(id)a6;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICSetContainerPropertiesRequest

- (ICSetContainerPropertiesRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 containerID:(unsigned int)a5 trackList:(id)a6 properties:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a6;
  id v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/edit",  v10));
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ICSetContainerPropertiesRequest;
  v15 = -[ICDRequest initWithAction:](&v18, "initWithAction:", v14);

  if (v15)
  {
    -[ICDRequest setMethod:](v15, "setMethod:", 1LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[ICSetContainerPropertiesRequest _bodyDataForDatabaseRevision:containerID:trackList:properties:]( v15,  "_bodyDataForDatabaseRevision:containerID:trackList:properties:",  v9,  v8,  v12,  v13));
    -[ICDRequest setBodyData:](v15, "setBodyData:", v16);
  }

  return v15;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICSetContainerPropertiesResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    v7 = objc_alloc_init(&OBJC_CLASS___SetContainerPropertiesResponseParserDelegate);
    [v6 setDelegate:v7];
    [v6 parse];
    objc_msgSend( v3,  "setUpdateRequired:",  -[SetContainerPropertiesResponseParserDelegate updateRequired](v7, "updateRequired"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SetContainerPropertiesResponseParserDelegate globalPlaylistID](v7, "globalPlaylistID"));
    [v3 setGlobalPlaylistID:v8];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SetContainerPropertiesResponseParserDelegate subscribedContainerURL](v7, "subscribedContainerURL"));
    [v3 setSubscribedContainerURL:v9];
  }

  return v3;
}

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 containerID:(unsigned int)a4 trackList:(id)a5 properties:(id)a6
{
  id v9 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004AEB0;
  v15[3] = &unk_1001A2F18;
  unsigned int v18 = a3;
  unsigned int v19 = a4;
  id v16 = a6;
  id v17 = v9;
  id v10 = v9;
  id v11 = v16;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1835360883LL, 1LL, v15);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v13;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 containerID:(unsigned int)a5 trackList:(id)a6 properties:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = a6;
  id v15 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v14)),  "initWithDatabaseID:databaseRevision:containerID:trackList:properties:",  v10,  v9,  v8,  v13,  v12);

  return v15;
}

@end