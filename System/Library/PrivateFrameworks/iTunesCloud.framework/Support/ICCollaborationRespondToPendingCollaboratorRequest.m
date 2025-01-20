@interface ICCollaborationRespondToPendingCollaboratorRequest
- (ICCollaborationRespondToPendingCollaboratorRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4 socialProfileID:(id)a5 approval:(BOOL)a6;
- (id)_requestBody;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationRespondToPendingCollaboratorRequest

- (ICCollaborationRespondToPendingCollaboratorRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4 socialProfileID:(id)a5 approval:(BOOL)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/collaboration",  v9));
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ICCollaborationRespondToPendingCollaboratorRequest;
  v14 = -[ICDRequest initWithAction:](&v17, "initWithAction:", v13);

  if (v14)
  {
    -[ICDRequest setMethod:](v14, "setMethod:", 1LL);
    objc_storeStrong((id *)&v14->_globalPlaylistID, a4);
    objc_storeStrong((id *)&v14->_socialProfileID, a5);
    v14->_approval = a6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationRespondToPendingCollaboratorRequest _requestBody](v14, "_requestBody"));
    -[ICDRequest setBodyData:](v14, "setBodyData:", v15);
  }

  return v14;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICCollaborationRespondToPendingCollaboratorResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    v7 = -[ICCollaborationRespondToPendingCollaboratorResponseParserDelegate initWithResponse:]( objc_alloc(&OBJC_CLASS___ICCollaborationRespondToPendingCollaboratorResponseParserDelegate),  "initWithResponse:",  v3);
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (id)_requestBody
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000E4178;
  v4[3] = &unk_1001A70B8;
  v4[4] = self;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634357313LL, 1LL, v4);
  return (id)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);
}

- (void).cxx_destruct
{
}

@end