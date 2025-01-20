@interface ICCreateGeniusContainerRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 playlistName:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6;
- (ICCreateGeniusContainerRequest)initWithDatabaseID:(unsigned int)a3 playlistName:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6;
- (id)_bodyDataForPlaylistName:(id)a3 seedItemIDs:(id)a4 itemIDs:(id)a5;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCreateGeniusContainerRequest

- (ICCreateGeniusContainerRequest)initWithDatabaseID:(unsigned int)a3 playlistName:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/edit",  v8));
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ICCreateGeniusContainerRequest;
  v14 = -[ICDRequest initWithAction:](&v17, "initWithAction:", v13);

  if (v14)
  {
    -[ICDRequest setMethod:](v14, "setMethod:", 1LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[ICCreateGeniusContainerRequest _bodyDataForPlaylistName:seedItemIDs:itemIDs:]( v14,  "_bodyDataForPlaylistName:seedItemIDs:itemIDs:",  v10,  v11,  v12));
    -[ICDRequest setBodyData:](v14, "setBodyData:", v15);
  }

  return v14;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICCreateGeniusContainerResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponseDataParser parseResponseData:]( &OBJC_CLASS___ICDResponseDataParser,  "parseResponseData:",  v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"dmap.itemid"]);
  objc_msgSend(v3, "setContainerID:", objc_msgSend(v7, "unsignedIntValue"));

  return v3;
}

- (id)_bodyDataForPlaylistName:(id)a3 seedItemIDs:(id)a4 itemIDs:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100068C70;
  v15[3] = &unk_1001A3A08;
  id v16 = v7;
  id v17 = a5;
  id v18 = v8;
  id v9 = v8;
  id v10 = v17;
  id v11 = v7;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1835360865LL, 1LL, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v13;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 playlistName:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v14 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v13)),  "initWithDatabaseID:playlistName:seedItemIDs:itemIDs:",  v8,  v12,  v11,  v10);

  return v14;
}

@end