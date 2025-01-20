@interface ICCollaborationLeaveResponse
- (BOOL)updateRequired;
- (NSString)globalPlaylistID;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICCollaborationLeaveResponse

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (void)setGlobalPlaylistID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end