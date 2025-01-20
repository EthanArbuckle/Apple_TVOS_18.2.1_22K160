@interface SagaArtworkImporter
- (SagaArtworkImporter)initWithConfiguration:(id)a3;
- (void)_importOriginalContainerArtworkWithClientIdentity:(id)a3;
- (void)_importOriginalItemArtworkWithClientIdentity:(id)a3;
- (void)importAllItemArtworkWithClientIdentity:(id)a3;
- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
@end

@implementation SagaArtworkImporter

- (SagaArtworkImporter)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SagaArtworkImporter;
  return -[CloudArtworkImporter initWithConfiguration:sourceType:](&v4, "initWithConfiguration:sourceType:", a3, 200LL);
}

- (void)importAllItemArtworkWithClientIdentity:(id)a3
{
  id v4 = a3;
  -[SagaArtworkImporter _importOriginalItemArtworkWithClientIdentity:]( self,  "_importOriginalItemArtworkWithClientIdentity:",  v4);
  -[SagaArtworkImporter _importOriginalContainerArtworkWithClientIdentity:]( self,  "_importOriginalContainerArtworkWithClientIdentity:",  v4);
}

- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  [v10 setClientIdentity:v8];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertyStoreSagaID,  a3));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:options:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:options:",  v11,  v12,  7LL));

  if (v13)
  {
    id v14 = [[ML3ArtworkTokenSet alloc] initWithEntity:v13 artworkType:1];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 artworkTokenForSource:200]);
  }

  else
  {
    v15 = 0LL;
  }

  if ([v15 length])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForProperty:ML3TrackPropertyMediaType]);
    id v17 = [v16 unsignedIntValue];

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
    uint64_t v19 = [v18 isCellularDataRestrictedForMusic] ^ 1;

    -[CloudArtworkImporter importArtworkForCloudID:artworkType:token:mediaType:allowsCellularData:clientIdentity:completionHandler:]( self,  "importArtworkForCloudID:artworkType:token:mediaType:allowsCellularData:clientIdentity:completionHandler:",  a3,  1LL,  v15,  v17,  v19,  v8,  v9);
  }

  else if (v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No cloud_artwork_token for item saga id = %llu",  a3));
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    v24 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2008LL,  v21));

    v9[2](v9, v22);
  }
}

- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  [v10 setClientIdentity:v8];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3TrackPropertyStoreSagaID,  a3));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:options:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:options:",  v11,  v12,  7LL));

  if (v13)
  {
    id v14 = [[ML3ArtworkTokenSet alloc] initWithEntity:v13 artworkType:2];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 artworkTokenForSource:200]);
  }

  else
  {
    v15 = 0LL;
  }

  if ([v15 length])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForProperty:ML3TrackPropertyMediaType]);
    id v17 = [v16 unsignedIntValue];

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
    uint64_t v19 = [v18 isCellularDataRestrictedForMusic] ^ 1;

    -[CloudArtworkImporter importArtworkForCloudID:artworkType:token:mediaType:allowsCellularData:clientIdentity:completionHandler:]( self,  "importArtworkForCloudID:artworkType:token:mediaType:allowsCellularData:clientIdentity:completionHandler:",  a3,  2LL,  v15,  v17,  v19,  v8,  v9);
  }

  else if (v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No cloud_screenshot_token for item saga id = %llu",  a3));
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    v24 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2008LL,  v21));

    v9[2](v9, v22);
  }
}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  [v10 setClientIdentity:v8];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3ContainerPropertyStoreCloudID,  a3));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Container anyInLibrary:predicate:]( &OBJC_CLASS___ML3Container,  "anyInLibrary:predicate:",  v11,  v12));

  if (v13)
  {
    id v14 = [[ML3ArtworkTokenSet alloc] initWithEntity:v13 artworkType:5];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 artworkTokenForSource:200]);
  }

  else
  {
    v15 = 0LL;
  }

  if ([v15 length])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
    uint64_t v17 = [v16 isCellularDataRestrictedForMusic] ^ 1;

    -[CloudArtworkImporter importArtworkForCloudID:artworkType:token:mediaType:allowsCellularData:clientIdentity:completionHandler:]( self,  "importArtworkForCloudID:artworkType:token:mediaType:allowsCellularData:clientIdentity:completionHandler:",  a3,  5LL,  v15,  8LL,  v17,  v8,  v9);
  }

  else if (v9)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No cloud_artwork_token for playlist saga id = %llu",  a3));
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    v22 = v18;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2008LL,  v19));

    v9[2](v9, v20);
  }
}

- (void)_importOriginalItemArtworkWithClientIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  char v6 = [v5 isCellularDataRestrictedForMusic] ^ 1;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10010C6BC;
  v9[3] = &unk_1001A6B48;
  char v12 = v6;
  id v10 = v4;
  v11 = self;
  id v8 = v4;
  [v7 databaseConnectionAllowingWrites:0 withBlock:v9];
}

- (void)_importOriginalContainerArtworkWithClientIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  char v6 = [v5 isCellularDataRestrictedForMusic] ^ 1;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImporter musicLibrary](self, "musicLibrary"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10010C4F0;
  v9[3] = &unk_1001A6B48;
  char v12 = v6;
  id v10 = v4;
  v11 = self;
  id v8 = v4;
  [v7 databaseConnectionAllowingWrites:0 withBlock:v9];
}

@end