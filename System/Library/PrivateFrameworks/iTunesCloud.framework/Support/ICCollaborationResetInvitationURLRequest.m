@interface ICCollaborationResetInvitationURLRequest
- (ICCollaborationResetInvitationURLRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4;
- (id)_requestBody;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationResetInvitationURLRequest

- (ICCollaborationResetInvitationURLRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/collaboration",  v5));
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ICCollaborationResetInvitationURLRequest;
  v9 = -[ICDRequest initWithAction:](&v12, "initWithAction:", v8);

  if (v9)
  {
    -[ICDRequest setMethod:](v9, "setMethod:", 1LL);
    objc_storeStrong((id *)&v9->_globalPlaylistID, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationResetInvitationURLRequest _requestBody](v9, "_requestBody"));
    -[ICDRequest setBodyData:](v9, "setBodyData:", v10);
  }

  return v9;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICCollaborationResetInvitationURLResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    id v7 = -[ICCollaborationResetInvitationURLResponseParserDelegate initWithResponse:]( objc_alloc(&OBJC_CLASS___ICCollaborationResetInvitationURLResponseParserDelegate),  "initWithResponse:",  v3);
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (id)_requestBody
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CBB04;
  v4[3] = &unk_1001A70B8;
  v4[4] = self;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634357362LL, 1LL, v4);
  return (id)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);
}

- (void).cxx_destruct
{
}

@end