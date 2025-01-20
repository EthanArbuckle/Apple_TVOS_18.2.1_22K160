@interface ICCollaborationEndRequest
- (ICCollaborationEndRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4;
- (id)_requestBodyWithPlaylistCloudLibraryID:(unint64_t)a3;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationEndRequest

- (ICCollaborationEndRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/collaboration",  *(void *)&a3));
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ICCollaborationEndRequest;
  v7 = -[ICDRequest initWithAction:](&v10, "initWithAction:", v6);

  if (v7)
  {
    -[ICDRequest setMethod:](v7, "setMethod:", 1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[ICCollaborationEndRequest _requestBodyWithPlaylistCloudLibraryID:]( v7,  "_requestBodyWithPlaylistCloudLibraryID:",  a4));
    -[ICDRequest setBodyData:](v7, "setBodyData:", v8);
  }

  return v7;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICCollaborationEndResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    v7 = -[ICCollaborationEndResponseParserDelegate initWithResponse:]( objc_alloc(&OBJC_CLASS___ICCollaborationEndResponseParserDelegate),  "initWithResponse:",  v3);
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (id)_requestBodyWithPlaylistCloudLibraryID:(unint64_t)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000F69F4;
  v5[3] = &unk_1001A63E0;
  v5[4] = a3;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634362213LL, 1LL, v5);
  return (id)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);
}

@end