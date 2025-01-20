@interface QueueAwareOperation
- (BOOL)shouldProcessSpecificArtists;
- (CloudArtworkImporter)artworkImporter;
- (ICUserIdentity)userIdentity;
- (ML3MusicLibrary)musicLibrary;
- (NSArray)albumArtistPersistentIDsToUpdate;
- (NSArray)artistPersistentIDsToUpdate;
- (NSOperationQueue)operationQueue;
- (OS_tcc_identity)clientIdentity;
- (QueueAwareOperation)initWithArtworkImporter:(id)a3 clientIdentity:(id)a4 operationQueue:(id)a5 artistPersistentIDsToUpdate:(id)a6 albumArtistPersistentIDsToUpdate:(id)a7;
- (void)setAlbumArtistPersistentIDsToUpdate:(id)a3;
- (void)setArtistPersistentIDsToUpdate:(id)a3;
@end

@implementation QueueAwareOperation

- (QueueAwareOperation)initWithArtworkImporter:(id)a3 clientIdentity:(id)a4 operationQueue:(id)a5 artistPersistentIDsToUpdate:(id)a6 albumArtistPersistentIDsToUpdate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___QueueAwareOperation;
  v16 = -[QueueAwareOperation init](&v24, "init");
  if (v16)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v12 musicLibrary]);
    v18 = *(void **)&v16->_shouldProcessSpecificArtists;
    *(void *)&v16->_shouldProcessSpecificArtists = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v12 configuration]);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 userIdentity]);
    musicLibrary = v16->_musicLibrary;
    v16->_musicLibrary = (ML3MusicLibrary *)v20;

    objc_storeStrong((id *)&v16->_clientIdentity, a3);
    objc_storeWeak((id *)&v16->_artworkImporter, v13);
    id v22 = [v14 count];
    LOBYTE(v16->super._private) = (char *)[v15 count] + (void)v22 != 0;
    objc_storeStrong((id *)&v16->_userIdentity, a6);
    objc_storeStrong((id *)&v16->_operationQueue, a7);
  }

  return v16;
}

- (OS_tcc_identity)clientIdentity
{
  return *(OS_tcc_identity **)&self->super._private1;
}

- (ML3MusicLibrary)musicLibrary
{
  return *(ML3MusicLibrary **)&self->_shouldProcessSpecificArtists;
}

- (CloudArtworkImporter)artworkImporter
{
  return (CloudArtworkImporter *)self->_clientIdentity;
}

- (ICUserIdentity)userIdentity
{
  return self->_musicLibrary;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_loadWeakRetained((id *)&self->_artworkImporter);
}

- (BOOL)shouldProcessSpecificArtists
{
  return (BOOL)self->super._private;
}

- (NSArray)artistPersistentIDsToUpdate
{
  return (NSArray *)self->_userIdentity;
}

- (void)setArtistPersistentIDsToUpdate:(id)a3
{
}

- (NSArray)albumArtistPersistentIDsToUpdate
{
  return (NSArray *)self->_operationQueue;
}

- (void)setAlbumArtistPersistentIDsToUpdate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end