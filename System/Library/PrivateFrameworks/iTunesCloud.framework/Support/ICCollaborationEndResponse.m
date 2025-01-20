@interface ICCollaborationEndResponse
- (BOOL)updateRequired;
- (NSString)convertedPlaylistGlobalID;
- (unsigned)convertedPlaylistCloudLibraryID;
- (unsigned)playlistCloudLibraryIDToDelete;
- (void)setConvertedPlaylistCloudLibraryID:(unsigned int)a3;
- (void)setConvertedPlaylistGlobalID:(id)a3;
- (void)setPlaylistCloudLibraryIDToDelete:(unsigned int)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICCollaborationEndResponse

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (unsigned)convertedPlaylistCloudLibraryID
{
  return self->_convertedPlaylistCloudLibraryID;
}

- (void)setConvertedPlaylistCloudLibraryID:(unsigned int)a3
{
  self->_convertedPlaylistCloudLibraryID = a3;
}

- (NSString)convertedPlaylistGlobalID
{
  return self->_convertedPlaylistGlobalID;
}

- (void)setConvertedPlaylistGlobalID:(id)a3
{
}

- (unsigned)playlistCloudLibraryIDToDelete
{
  return self->_playlistCloudLibraryIDToDelete;
}

- (void)setPlaylistCloudLibraryIDToDelete:(unsigned int)a3
{
  self->_playlistCloudLibraryIDToDelete = a3;
}

- (void).cxx_destruct
{
}

@end