@interface ICSDKAddToLibraryRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 opaqueID:(id)a5 bundleID:(id)a6;
- (ICSDKAddToLibraryRequest)initWithAction:(id)a3 databaseID:(unsigned int)a4 databaseRevision:(unsigned int)a5 opaqueID:(id)a6 bundleID:(id)a7;
- (double)timeoutInterval;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 opaqueID:(id)a4;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICSDKAddToLibraryRequest

- (ICSDKAddToLibraryRequest)initWithAction:(id)a3 databaseID:(unsigned int)a4 databaseRevision:(unsigned int)a5 opaqueID:(id)a6 bundleID:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v11 = a6;
  id v12 = a7;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ICSDKAddToLibraryRequest;
  v13 = -[ICDRequest initWithAction:](&v17, "initWithAction:", a3);
  v14 = v13;
  if (v13)
  {
    -[ICDRequest setMethod:](v13, "setMethod:", 1LL);
    -[ICDRequest setRequestingBundleID:](v14, "setRequestingBundleID:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[ICSDKAddToLibraryRequest _bodyDataForDatabaseRevision:opaqueID:]( v14,  "_bodyDataForDatabaseRevision:opaqueID:",  v8,  v11));
    -[ICDRequest setBodyData:](v14, "setBodyData:", v15);
  }

  return v14;
}

- (double)timeoutInterval
{
  return 120.0;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICDResponse responseWithResponse:]( &OBJC_CLASS___ICSDKAddToLibraryResponse,  "responseWithResponse:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 responseData]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v4));
    id v6 = [[DKDAAPParser alloc] initWithStream:v5];
    v7 = objc_alloc_init(&OBJC_CLASS___SDKAddToLibraryResponseParserDelegate);
    [v6 setDelegate:v7];
    [v6 parse];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDKAddToLibraryResponseParserDelegate addedItems](v7, "addedItems"));
    id v9 = [v8 copy];
    [v3 setAddedItems:v9];

    objc_msgSend( v3,  "setUpdateRequired:",  -[SDKAddToLibraryResponseParserDelegate updateRequired](v7, "updateRequired"));
  }

  return v3;
}

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 opaqueID:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100118318;
  v8[3] = &unk_1001A70E0;
  unsigned int v10 = a3;
  id v9 = a4;
  id v4 = v9;
  uint64_t DataForItemKindContainer = ICDAAPUtilitiesCreateDataForItemKindContainer(1634353985LL, 0LL, v8);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(DataForItemKindContainer);

  return v6;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 opaqueID:(id)a5 bundleID:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/cloud-add",  v8));
  id v14 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v13)),  "initWithAction:databaseID:databaseRevision:opaqueID:bundleID:",  v12,  v8,  v7,  v11,  v10);

  return v14;
}

@end