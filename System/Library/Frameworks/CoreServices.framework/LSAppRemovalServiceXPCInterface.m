@interface LSAppRemovalServiceXPCInterface
@end

@implementation LSAppRemovalServiceXPCInterface

void ___LSAppRemovalServiceXPCInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6934E0];
  v1 = (void *)_LSAppRemovalServiceXPCInterface_interface;
  _LSAppRemovalServiceXPCInterface_interface = v0;
}

@end