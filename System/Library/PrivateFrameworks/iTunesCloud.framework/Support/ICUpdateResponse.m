@interface ICUpdateResponse
- (BOOL)hasAddToLibraryWhenFavoritingBehavior;
- (BOOL)hasAddToPlaylistBehavior;
- (BOOL)hasClientFeaturesVersion;
- (BOOL)hasNeedsResetSync;
- (NSString)clientFeaturesVersion;
- (unsigned)addToLibraryWhenFavoritingBehavior;
- (unsigned)addToPlaylistBehavior;
- (unsigned)databaseRevision;
- (unsigned)needsResetSync;
- (void)setAddToLibraryWhenFavoritingBehavior:(unsigned __int8)a3;
- (void)setAddToPlaylistBehavior:(unsigned __int8)a3;
- (void)setClientFeaturesVersion:(id)a3;
- (void)setDatabaseRevision:(unsigned int)a3;
- (void)setHasAddToLibraryWhenFavoritingBehavior:(BOOL)a3;
- (void)setHasAddToPlaylistBehavior:(BOOL)a3;
- (void)setHasClientFeaturesVersion:(BOOL)a3;
- (void)setHasNeedsResetSync:(BOOL)a3;
- (void)setNeedsResetSync:(unsigned __int8)a3;
@end

@implementation ICUpdateResponse

- (unsigned)databaseRevision
{
  return self->_databaseRevision;
}

- (void)setDatabaseRevision:(unsigned int)a3
{
  self->_databaseRevision = a3;
}

- (BOOL)hasAddToPlaylistBehavior
{
  return self->_hasAddToPlaylistBehavior;
}

- (void)setHasAddToPlaylistBehavior:(BOOL)a3
{
  self->_hasAddToPlaylistBehavior = a3;
}

- (BOOL)hasAddToLibraryWhenFavoritingBehavior
{
  return self->_hasAddToLibraryWhenFavoritingBehavior;
}

- (void)setHasAddToLibraryWhenFavoritingBehavior:(BOOL)a3
{
  self->_hasAddToLibraryWhenFavoritingBehavior = a3;
}

- (BOOL)hasNeedsResetSync
{
  return self->_hasNeedsResetSync;
}

- (void)setHasNeedsResetSync:(BOOL)a3
{
  self->_hasNeedsResetSync = a3;
}

- (BOOL)hasClientFeaturesVersion
{
  return self->_hasClientFeaturesVersion;
}

- (void)setHasClientFeaturesVersion:(BOOL)a3
{
  self->_hasClientFeaturesVersion = a3;
}

- (unsigned)addToPlaylistBehavior
{
  return self->_addToPlaylistBehavior;
}

- (void)setAddToPlaylistBehavior:(unsigned __int8)a3
{
  self->_addToPlaylistBehavior = a3;
}

- (unsigned)addToLibraryWhenFavoritingBehavior
{
  return self->_addToLibraryWhenFavoritingBehavior;
}

- (void)setAddToLibraryWhenFavoritingBehavior:(unsigned __int8)a3
{
  self->_addToLibraryWhenFavoritingBehavior = a3;
}

- (unsigned)needsResetSync
{
  return self->_needsResetSync;
}

- (void)setNeedsResetSync:(unsigned __int8)a3
{
  self->_needsResetSync = a3;
}

- (NSString)clientFeaturesVersion
{
  return self->_clientFeaturesVersion;
}

- (void)setClientFeaturesVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end