@interface ICCreateGeniusContainerResponse
- (unsigned)containerID;
- (void)setContainerID:(unsigned int)a3;
@end

@implementation ICCreateGeniusContainerResponse

- (unsigned)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(unsigned int)a3
{
  self->_containerID = a3;
}

@end