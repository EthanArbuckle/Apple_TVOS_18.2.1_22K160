@interface ICCollaborationBeginRequest
- (ICCollaborationBeginRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4 sharingMode:(unint64_t)a5;
- (id)_requestBodyWithPlaylistCloudLibraryID:(unint64_t)a3 sharingMode:(unint64_t)a4;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationBeginRequest

- (ICCollaborationBeginRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4 sharingMode:(unint64_t)a5
{
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/collaboration",  *(void *)&a3));
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ICCollaborationBeginRequest;
  v9 = -[ICDRequest initWithAction:](&v12, "initWithAction:", v8);

  if (v9)
  {
    -[ICDRequest setMethod:](v9, "setMethod:", 1LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[ICCollaborationBeginRequest _requestBodyWithPlaylistCloudLibraryID:sharingMode:]( v9,  "_requestBodyWithPlaylistCloudLibraryID:sharingMode:",  a4,  a5));
    -[ICDRequest setBodyData:](v9, "setBodyData:", v10);
  }

  return v9;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICCollaborationBeginResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    v7 = -[ICCollaborationBeginResponseParserDelegate initWithResponse:]( objc_alloc(&OBJC_CLASS___ICCollaborationBeginResponseParserDelegate),  "initWithResponse:",  v3);
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (id)_requestBodyWithPlaylistCloudLibraryID:(unint64_t)a3 sharingMode:(unint64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100111F5C;
  v6[3] = &unk_1001A6E50;
  v6[4] = a3;
  v6[5] = a4;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634362227LL, 1LL, v6);
  return (id)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);
}

@end