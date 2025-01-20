@interface ICCollaborationJoinRequest
- (ICCollaborationJoinRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4 invitationURL:(id)a5;
- (id)_requestBody;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationJoinRequest

- (ICCollaborationJoinRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4 invitationURL:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/collaboration",  v7));
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ICCollaborationJoinRequest;
  v12 = -[ICDRequest initWithAction:](&v15, "initWithAction:", v11);

  if (v12)
  {
    -[ICDRequest setMethod:](v12, "setMethod:", 1LL);
    objc_storeStrong((id *)&v12->_globalPlaylistID, a4);
    objc_storeStrong((id *)&v12->_invitationURL, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationJoinRequest _requestBody](v12, "_requestBody"));
    -[ICDRequest setBodyData:](v12, "setBodyData:", v13);
  }

  return v12;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICCollaborationJoinResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    uint64_t v7 = -[ICCollaborationJoinResponseParserDelegate initWithResponse:]( objc_alloc(&OBJC_CLASS___ICCollaborationJoinResponseParserDelegate),  "initWithResponse:",  v3);
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (id)_requestBody
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000A3160;
  v4[3] = &unk_1001A70B8;
  v4[4] = self;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634357354LL, 1LL, v4);
  return (id)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);
}

- (void).cxx_destruct
{
}

@end