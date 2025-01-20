@interface ICSDKCreateContainerRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7;
- (ICSDKCreateContainerRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7;
@end

@implementation ICSDKCreateContainerRequest

- (ICSDKCreateContainerRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ICSDKCreateContainerRequest;
  v13 = -[ICCreateContainerRequest initWithDatabaseID:databaseRevision:playlistProperties:trackList:]( &v16,  "initWithDatabaseID:databaseRevision:playlistProperties:trackList:",  v10,  v9,  a5,  a6);
  v14 = v13;
  if (v13) {
    -[ICDRequest setRequestingBundleID:](v13, "setRequestingBundleID:", v12);
  }

  return v14;
}

- (void).cxx_destruct
{
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v16 = objc_msgSend( objc_alloc((Class)objc_opt_class(a1, v15)),  "initWithDatabaseID:databaseRevision:playlistProperties:trackList:requestingBundleID:",  v10,  v9,  v14,  v13,  v12);

  return v16;
}

@end