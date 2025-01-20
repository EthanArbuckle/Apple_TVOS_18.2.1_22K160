@interface ICBulkArtworkInfoRequest
- (ICBulkArtworkInfoRequest)initWithDatabaseID:(unsigned int)a3 cloudIDs:(id)a4 itemKind:(unsigned __int8)a5 useLongIDs:(BOOL)a6;
- (id)_bodyDataForCloudIDs:(id)a3 itemKind:(unsigned __int8)a4 useLongIDs:(BOOL)a5;
- (id)_queryFilterString;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICBulkArtworkInfoRequest

- (ICBulkArtworkInfoRequest)initWithDatabaseID:(unsigned int)a3 cloudIDs:(id)a4 itemKind:(unsigned __int8)a5 useLongIDs:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/extra_data/cloud-artwork-info",  v8));
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ICBulkArtworkInfoRequest;
  v12 = -[ICDRequest initWithAction:](&v15, "initWithAction:", v11);

  if (v12)
  {
    -[ICDRequest setMethod:](v12, "setMethod:", 1LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[ICBulkArtworkInfoRequest _bodyDataForCloudIDs:itemKind:useLongIDs:]( v12,  "_bodyDataForCloudIDs:itemKind:useLongIDs:",  v10,  v7,  v6));
    -[ICDRequest setBodyData:](v12, "setBodyData:", v13);

    -[ICDRequest setRequestPersonalizationStyle:](v12, "setRequestPersonalizationStyle:", 2LL);
  }

  return v12;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICBulkArtworkInfoResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponseDataParser parseResponseData:]( &OBJC_CLASS___ICDResponseDataParser,  "parseResponseData:",  v4));

  [v3 setArtworkInfoDictionaries:v5];
  return v3;
}

- (id)_bodyDataForCloudIDs:(id)a3 itemKind:(unsigned __int8)a4 useLongIDs:(BOOL)a5
{
  uint64_t v5 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006782C;
  v10[3] = &unk_1001A39E0;
  BOOL v12 = a5;
  v10[4] = self;
  id v11 = a3;
  id v6 = v11;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634026049LL, v5, v10);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v8;
}

- (id)_queryFilterString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.itunes.extended-media-kind" stringByReplacingOccurrencesOfString:@"-" withString:@"\\-"]);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [&off_1001B4B90 count]));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [&off_1001B4B90 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(&off_1001B4B90);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"'%@:%d'",  v2,  [*(id *)(*((void *)&v12 + 1) + 8 * (void)v7) intValue]));
        [v3 addObject:v8];

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [&off_1001B4B90 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@","]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@)", v9));

  return v10;
}

@end