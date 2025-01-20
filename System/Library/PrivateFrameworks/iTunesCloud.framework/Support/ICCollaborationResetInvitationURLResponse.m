@interface ICCollaborationResetInvitationURLResponse
- (BOOL)updateRequired;
- (NSURL)updatedInvitationURL;
- (unsigned)updatedInviteURLExpirationDate;
- (void)setUpdateRequired:(BOOL)a3;
- (void)setUpdatedInvitationURL:(id)a3;
- (void)setUpdatedInviteURLExpirationDate:(unsigned int)a3;
@end

@implementation ICCollaborationResetInvitationURLResponse

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (NSURL)updatedInvitationURL
{
  return self->_updatedInvitationURL;
}

- (void)setUpdatedInvitationURL:(id)a3
{
}

- (unsigned)updatedInviteURLExpirationDate
{
  return self->_updatedInviteURLExpirationDate;
}

- (void)setUpdatedInviteURLExpirationDate:(unsigned int)a3
{
  self->_updatedInviteURLExpirationDate = a3;
}

- (void).cxx_destruct
{
}

@end