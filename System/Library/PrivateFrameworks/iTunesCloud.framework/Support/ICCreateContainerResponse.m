@interface ICCreateContainerResponse
- (BOOL)updateRequired;
- (unsigned)containerID;
- (void)setContainerID:(unsigned int)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICCreateContainerResponse

- (unsigned)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(unsigned int)a3
{
  self->_containerID = a3;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

@end