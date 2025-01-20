@interface VMUDirectDominees
- (VMUDirectDominees)initWithDominatorGraph:(id)a3 rootNode:(unsigned int)a4;
- (id)nextObject;
@end

@implementation VMUDirectDominees

- (VMUDirectDominees)initWithDominatorGraph:(id)a3 rootNode:(unsigned int)a4
{
  v6 = (VMUDominatorGraph *)a3;
  self->_node = -[VMUDominatorGraph firstDominates](v6, "firstDominates")[4LL * a4];
  dg = self->_dg;
  self->_dg = v6;

  return self;
}

- (id)nextObject
{
  if (self->_node == -1)
  {
    v3 = 0LL;
  }

  else
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_node = -[VMUDominatorGraph nextDominates](self->_dg, "nextDominates")[4LL * self->_node];
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end