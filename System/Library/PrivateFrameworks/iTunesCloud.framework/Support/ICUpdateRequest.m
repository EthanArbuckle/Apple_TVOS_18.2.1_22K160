@interface ICUpdateRequest
+ (id)requestWithDatabaseRevision:(unsigned int)a3;
- (ICUpdateRequest)initWithDatabaseRevision:(unsigned int)a3;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICUpdateRequest

+ (id)requestWithDatabaseRevision:(unsigned int)a3
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1, a2)), "initWithDatabaseRevision:", *(void *)&a3);
}

- (ICUpdateRequest)initWithDatabaseRevision:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = -[ICDRequest initWithAction:](self, "initWithAction:", @"update");
  v5 = v4;
  if (v4)
  {
    -[ICDRequest setMethod:](v4, "setMethod:", 1LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICUpdateRequest _bodyDataForDatabaseRevision:](v5, "_bodyDataForDatabaseRevision:", v3));
    -[ICDRequest setBodyData:](v5, "setBodyData:", v6);

    -[ICDRequest setRequestPersonalizationStyle:](v5, "setRequestPersonalizationStyle:", 2LL);
  }

  return v5;
}

- (id)canonicalResponseForResponse:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICDResponse responseWithResponse:](&OBJC_CLASS___ICUpdateResponse, "responseWithResponse:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 responseData]);
  if ([v5 length])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v5));
    id v7 = [[DKDAAPParser alloc] initWithStream:v6];
    v8 = objc_alloc_init(&OBJC_CLASS___UpdateResponseParserDelegate);
    [v7 setDelegate:v8];
    [v7 parse];
    objc_msgSend(v4, "setDatabaseRevision:", -[UpdateResponseParserDelegate serverRevision](v8, "serverRevision"));
    objc_msgSend( v4,  "setHasAddToPlaylistBehavior:",  -[UpdateResponseParserDelegate hasAddToPlaylistBehavior](v8, "hasAddToPlaylistBehavior"));
    objc_msgSend( v4,  "setAddToPlaylistBehavior:",  -[UpdateResponseParserDelegate addToPlaylistBehavior](v8, "addToPlaylistBehavior"));
    objc_msgSend( v4,  "setHasNeedsResetSync:",  -[UpdateResponseParserDelegate hasNeedsResetSync](v8, "hasNeedsResetSync"));
    objc_msgSend(v4, "setNeedsResetSync:", -[UpdateResponseParserDelegate needsResetSync](v8, "needsResetSync"));
    objc_msgSend( v4,  "setHasAddToLibraryWhenFavoritingBehavior:",  -[UpdateResponseParserDelegate hasAddToLibraryWhenFavoritingBehavior](v8, "hasAddToLibraryWhenFavoritingBehavior"));
    objc_msgSend( v4,  "setAddToLibraryWhenFavoritingBehavior:",  -[UpdateResponseParserDelegate addToLibraryWhenFavoritingBehavior](v8, "addToLibraryWhenFavoritingBehavior"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 responseHeaderFields]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:ICStoreHTTPHeaderKeyXDAAPClientFeaturesVersion]);
    if (_NSIsNSString())
    {
      [v4 setHasClientFeaturesVersion:1];
      [v4 setClientFeaturesVersion:v10];
    }
  }

  return v4;
}

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100020894;
  v5[3] = &unk_1001A2178;
  unsigned int v6 = a3;
  uint64_t Data = ICDAAPUtilitiesCreateData(v5, a2);
  return (id)objc_claimAutoreleasedReturnValue(Data);
}

@end