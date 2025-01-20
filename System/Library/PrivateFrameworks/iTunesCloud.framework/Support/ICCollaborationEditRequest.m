@interface ICCollaborationEditRequest
- (ICCollaborationEditRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4 cloudLibraryRevision:(unsigned int)a5 properties:(id)a6 trackEdits:(id)a7;
- (id)_requestBody;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationEditRequest

- (ICCollaborationEditRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4 cloudLibraryRevision:(unsigned int)a5 properties:(id)a6 trackEdits:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  id v13 = a6;
  id v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/collaboration",  v11));
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ICCollaborationEditRequest;
  v16 = -[ICDRequest initWithAction:](&v19, "initWithAction:", v15);

  if (v16)
  {
    v16->_playlistCloudLibraryID = a4;
    v16->_cloudLibraryRevision = a5;
    objc_storeStrong((id *)&v16->_properties, a6);
    objc_storeStrong((id *)&v16->_trackEdits, a7);
    -[ICDRequest setMethod:](v16, "setMethod:", 1LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationEditRequest _requestBody](v16, "_requestBody"));
    -[ICDRequest setBodyData:](v16, "setBodyData:", v17);
  }

  return v16;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICCollaborationEditResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    v7 = -[ICCollaborationEditResponseParserDelegate initWithResponse:]( objc_alloc(&OBJC_CLASS___ICCollaborationEditResponseParserDelegate),  "initWithResponse:",  v3);
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (id)_requestBody
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000512C;
  v4[3] = &unk_1001A70B8;
  v4[4] = self;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634357349LL, 1LL, v4);
  return (id)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);
}

- (void).cxx_destruct
{
}

@end