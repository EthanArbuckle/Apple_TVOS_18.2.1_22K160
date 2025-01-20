@interface ICCollaborationEditResponse
- (BOOL)updateRequired;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICCollaborationEditResponse

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

@end