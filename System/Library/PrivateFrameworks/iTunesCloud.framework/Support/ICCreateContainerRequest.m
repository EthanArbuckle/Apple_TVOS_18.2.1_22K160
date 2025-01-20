@interface ICCreateContainerRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6;
- (ICCreateContainerRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 playlistProperties:(id)a4 trackList:(id)a5;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCreateContainerRequest

- (ICCreateContainerRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/edit",  v8));
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ICCreateContainerRequest;
  v13 = -[ICDRequest initWithAction:](&v16, "initWithAction:", v12);

  if (v13)
  {
    -[ICDRequest setMethod:](v13, "setMethod:", 1LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[ICCreateContainerRequest _bodyDataForDatabaseRevision:playlistProperties:trackList:]( v13,  "_bodyDataForDatabaseRevision:playlistProperties:trackList:",  v7,  v10,  v11));
    -[ICDRequest setBodyData:](v13, "setBodyData:", v14);
  }

  return v13;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICCreateContainerResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___CreateContainerResponseParserDelegate);
    [v6 setDelegate:v7];
    [v6 parse];
    objc_msgSend(v3, "setContainerID:", -[CreateContainerResponseParserDelegate containerID](v7, "containerID"));
    objc_msgSend( v3,  "setUpdateRequired:",  -[CreateContainerResponseParserDelegate updateRequired](v7, "updateRequired"));
  }

  return v3;
}

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 playlistProperties:(id)a4 trackList:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000DD0E4;
  v11[3] = &unk_1001A5A98;
  unsigned int v14 = a3;
  id v12 = a4;
  id v13 = a5;
  id v6 = v13;
  id v7 = v12;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1835360865LL, 1LL, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v9;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v13 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v12)),  "initWithDatabaseID:databaseRevision:playlistProperties:trackList:",  v8,  v7,  v11,  v10);

  return v13;
}

@end