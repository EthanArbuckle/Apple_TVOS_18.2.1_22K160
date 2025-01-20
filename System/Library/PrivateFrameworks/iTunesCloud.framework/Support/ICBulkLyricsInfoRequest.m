@interface ICBulkLyricsInfoRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5;
- (ICBulkLyricsInfoRequest)initWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5;
- (id)_bodyDataForItemIDs:(id)a3 useLongIDs:(BOOL)a4;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICBulkLyricsInfoRequest

- (ICBulkLyricsInfoRequest)initWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/extra_data/cloud-lyrics-info",  v6));
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ICBulkLyricsInfoRequest;
  v10 = -[ICDRequest initWithAction:](&v13, "initWithAction:", v9);

  if (v10)
  {
    -[ICDRequest setMethod:](v10, "setMethod:", 1LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[ICBulkLyricsInfoRequest _bodyDataForItemIDs:useLongIDs:]( v10,  "_bodyDataForItemIDs:useLongIDs:",  v8,  v5));
    -[ICDRequest setBodyData:](v10, "setBodyData:", v11);
  }

  return v10;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICBulkLyricsInfoResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponseDataParser parseResponseData:]( &OBJC_CLASS___ICDResponseDataParser,  "parseResponseData:",  v4));

  [v3 setLyricsInfoDictionaries:v5];
  return v3;
}

- (id)_bodyDataForItemIDs:(id)a3 useLongIDs:(BOOL)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003C248;
  v8[3] = &unk_1001A2760;
  BOOL v10 = a4;
  id v9 = a3;
  id v4 = v9;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634356329LL, 2LL, v8);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v6;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v10 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v9)), "initWithDatabaseID:itemIDs:useLongIDs:", v6, v8, v5);

  return v10;
}

@end