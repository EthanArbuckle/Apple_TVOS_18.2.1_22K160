@interface ICCollaborationRespondToPendingCollaboratorResponse
- (BOOL)updateRequired;
- (unsigned)collaborationCloudLibraryID;
- (void)setCollaborationCloudLibraryID:(unsigned int)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICCollaborationRespondToPendingCollaboratorResponse

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (unsigned)collaborationCloudLibraryID
{
  return self->_collaborationCloudLibraryID;
}

- (void)setCollaborationCloudLibraryID:(unsigned int)a3
{
  self->_collaborationCloudLibraryID = a3;
}

@end