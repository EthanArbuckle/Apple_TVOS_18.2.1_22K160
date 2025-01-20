@interface SagaSDKCreatePlaylistOperation
- (BOOL)waitForLibraryUpdate;
- (SagaSDKCreatePlaylistOperation)initWithCoder:(id)a3;
- (SagaSDKCreatePlaylistOperation)initWithConfiguration:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7 clientIdentity:(id)a8;
- (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SagaSDKCreatePlaylistOperation

- (SagaSDKCreatePlaylistOperation)initWithConfiguration:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7 clientIdentity:(id)a8
{
  id v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SagaSDKCreatePlaylistOperation;
  v15 = -[SagaCreatePlaylistOperation initWithConfiguration:playlistPersistentID:properties:trackList:clientIdentity:]( &v19,  "initWithConfiguration:playlistPersistentID:properties:trackList:clientIdentity:",  a3,  a4,  a5,  a6,  a8);
  if (v15)
  {
    v16 = (ICCloudItemIDList *)[v14 copy];
    trackList = v15->super._trackList;
    v15->super._trackList = v16;
  }

  return v15;
}

- (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6
{
  return +[ICSDKCreateContainerRequest requestWithDatabaseID:databaseRevision:playlistProperties:trackList:requestingBundleID:]( &OBJC_CLASS___ICSDKCreateContainerRequest,  "requestWithDatabaseID:databaseRevision:playlistProperties:trackList:requestingBundleID:",  *(void *)&a3,  *(void *)&a4,  a5,  a6,  self->super._trackList);
}

- (BOOL)waitForLibraryUpdate
{
  return 1;
}

- (SagaSDKCreatePlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SagaSDKCreatePlaylistOperation;
  v6 = -[SagaCreatePlaylistOperation initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"SagaSDKCreatePlaylistOperationRequestingBundleKey");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    trackList = v6->super._trackList;
    v6->super._trackList = (ICCloudItemIDList *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaSDKCreatePlaylistOperation;
  id v4 = a3;
  -[SagaCreatePlaylistOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->super._trackList,  @"SagaSDKCreatePlaylistOperationRequestingBundleKey",  v5.receiver,  v5.super_class);
}

- (void).cxx_destruct
{
}

@end