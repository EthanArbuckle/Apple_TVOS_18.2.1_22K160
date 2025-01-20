@interface JaliscoArtworkImporter
- (BOOL)_cellularDataAllowedForMediaType:(unsigned int)a3;
- (JaliscoArtworkImporter)initWithConfiguration:(id)a3;
- (void)_importOriginalItemArtworkWithClientIdentity:(id)a3;
- (void)_importOriginalScreenshotsWithClientIdentity:(id)a3;
- (void)importAllItemArtworkAndScreenshotsWithClientIdentity:(id)a3;
- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
@end

@implementation JaliscoArtworkImporter

- (JaliscoArtworkImporter)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___JaliscoArtworkImporter;
  return -[CloudArtworkImporter initWithConfiguration:sourceType:](&v4, "initWithConfiguration:sourceType:", a3, 400LL);
}

- (void)importAllItemArtworkAndScreenshotsWithClientIdentity:(id)a3
{
  id v4 = a3;
  -[JaliscoArtworkImporter _importOriginalItemArtworkWithClientIdentity:]( self,  "_importOriginalItemArtworkWithClientIdentity:",  v4);
  -[JaliscoArtworkImporter _importOriginalScreenshotsWithClientIdentity:]( self,  "_importOriginalScreenshotsWithClientIdentity:",  v4);
}

- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertyPurchaseHistoryID,  a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:options:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:options:",  v10,  v11,  3LL));

  if (v12)
  {
    id v13 = [[ML3ArtworkTokenSet alloc] initWithEntity:v12 artworkType:1];
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 artworkTokenForSource:400]);
  }

  else
  {
    v14 = 0LL;
  }

  if ([v14 length])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:ML3TrackPropertyMediaType]);
    id v16 = [v15 unsignedIntValue];

    -[CloudArtworkImporter importArtworkForCloudID:artworkType:token:mediaType:allowsCellularData:clientIdentity:completionHandler:]( self,  "importArtworkForCloudID:artworkType:token:mediaType:allowsCellularData:clientIdentity:completionHandler:",  a3,  1LL,  v14,  v16,  -[JaliscoArtworkImporter _cellularDataAllowedForMediaType:](self, "_cellularDataAllowedForMediaType:", v16),  v8,  v9);
  }

  else if (v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No purchase_history_artwork_token for purchase_history_id = %llu",  a3));
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v21 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2008LL,  v18));

    v9[2](v9, v19);
  }
}

- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertyPurchaseHistoryID,  a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:options:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:options:",  v10,  v11,  3LL));

  if (v12)
  {
    id v13 = [[ML3ArtworkTokenSet alloc] initWithEntity:v12 artworkType:2];
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 artworkTokenForSource:400]);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:ML3TrackPropertyMediaType]);
      id v16 = [v15 unsignedIntValue];

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
      uint64_t v18 = [v17 isCellularDataRestrictedForVideos] ^ 1;

      -[CloudArtworkImporter importArtworkForCloudID:artworkType:token:mediaType:allowsCellularData:clientIdentity:completionHandler:]( self,  "importArtworkForCloudID:artworkType:token:mediaType:allowsCellularData:clientIdentity:completionHandler:",  a3,  2LL,  v14,  v16,  v18,  v8,  v9);
LABEL_6:

      goto LABEL_7;
    }
  }

  if (v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No purchase_history_screenshot_token for purchase_history_id = %llu",  a3));
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    v22 = v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    NSErrorUserInfoKey v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2008LL,  v19));

    v9[2](v9, v20);
    goto LABEL_6;
  }

- (void)_importOriginalItemArtworkWithClientIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005C504;
  v7[3] = &unk_1001A6570;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 databaseConnectionAllowingWrites:0 withBlock:v7];
}

- (void)_importOriginalScreenshotsWithClientIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  char v6 = [v5 isCellularDataRestrictedForVideos] ^ 1;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005C328;
  v9[3] = &unk_1001A6B48;
  char v12 = v6;
  id v10 = v4;
  v11 = self;
  id v8 = v4;
  [v7 databaseConnectionAllowingWrites:0 withBlock:v9];
}

- (BOOL)_cellularDataAllowedForMediaType:(unsigned int)a3
{
  if ((a3 & 0x408) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
    unsigned __int8 v4 = [v3 isCellularDataRestrictedForMusic];
  }

  else
  {
    if ((a3 & 0x10042) != 0)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICNetworkConstraints constraintsForSystemApplicationType:]( &OBJC_CLASS___ICNetworkConstraints,  "constraintsForSystemApplicationType:",  2LL));
      unsigned __int8 v5 = [v3 shouldAllowDataForCellularNetworkTypes];
      goto LABEL_6;
    }

    v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
    unsigned __int8 v4 = [v3 isCellularDataRestrictedForVideos];
  }

  unsigned __int8 v5 = v4 ^ 1;
LABEL_6:

  return v5;
}

@end