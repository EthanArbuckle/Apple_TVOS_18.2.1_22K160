@interface __NSGenericDeallocHandler
- (unint64_t)retainCount;
- (void)finalize;
- (void)release;
@end

@implementation __NSGenericDeallocHandler

- (unint64_t)retainCount
{
  return 1LL;
}

- (void)release
{
  block = (void (**)(id, SEL))self->_block;
  if (block)
  {
    block[2](block, a2);
    _Block_release(self->_block);
    self->_block = 0LL;
    object_dispose(self);
  }

  else
  {
    __break(1u);
  }

- (void)finalize
{
  block = (void (**)(id, SEL))self->_block;
  if (block)
  {
    block[2](block, a2);
    _Block_release(self->_block);
    self->_block = 0LL;
  }

  else
  {
    __break(1u);
  }

@end