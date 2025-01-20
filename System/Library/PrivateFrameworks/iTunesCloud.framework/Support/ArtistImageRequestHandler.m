@interface ArtistImageRequestHandler
+ (BOOL)supportsAccountlessHandling;
+ (id)accountlessHandler;
+ (id)handlers;
- (ArtistImageRequestHandler)initWithConfiguration:(id)a3;
- (CloudArtistHeroImageImporter)importer;
- (void)cancelAllOperations;
- (void)cancelAllOperationsAndWaitForOperationsToFinish:(BOOL)a3;
- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3;
- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3;
- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:(id)a3;
- (void)updateArtistHeroImagesWithClientIdentity:(id)a3;
@end

@implementation ArtistImageRequestHandler

- (ArtistImageRequestHandler)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned int v6 = [v5 isAudioAccessory];

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Device does not support ArtistImageRequestHandler",  buf,  2u);
    }

    v8 = 0LL;
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___ArtistImageRequestHandler;
    v9 = -[BaseRequestHandler initWithConfiguration:](&v13, "initWithConfiguration:", v4);
    if (v9)
    {
      v10 = -[CloudArtistHeroImageImporter initWithConfiguration:]( objc_alloc(&OBJC_CLASS___CloudArtistHeroImageImporter),  "initWithConfiguration:",  v4);
      importer = v9->_importer;
      v9->_importer = v10;
    }

    self = v9;
    v8 = self;
  }

  return v8;
}

- (void)updateArtistHeroImagesWithClientIdentity:(id)a3
{
}

- (void)updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v6 = [v5 shouldProhibitMusicActionForCurrentNetworkConditions];

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Skipping artist hero image update due to insufficient network conditions",  v8,  2u);
    }
  }

  else
  {
    -[CloudArtistHeroImageImporter updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:]( self->_importer,  "updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:",  v4);
  }
}

- (void)cancelAllOperations
{
}

- (void)cancelAllOperationsAndWaitForOperationsToFinish:(BOOL)a3
{
}

- (void)importArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3
{
}

- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3
{
}

- (CloudArtistHeroImageImporter)importer
{
  return self->_importer;
}

- (void).cxx_destruct
{
}

+ (id)handlers
{
  if (qword_1001DB8B8 != -1) {
    dispatch_once(&qword_1001DB8B8, &stru_1001A6FF8);
  }
  return (id)qword_1001DB8B0;
}

+ (BOOL)supportsAccountlessHandling
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned int v3 = [v2 isAudioAccessory];

  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Device does not support ArtistImageRequestHandler",  v6,  2u);
    }
  }

  return v3 ^ 1;
}

+ (id)accountlessHandler
{
  if (qword_1001DB8C8 != -1) {
    dispatch_once(&qword_1001DB8C8, &stru_1001A7018);
  }
  return (id)qword_1001DB8C0;
}

@end