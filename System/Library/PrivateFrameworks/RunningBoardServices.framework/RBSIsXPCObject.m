@interface RBSIsXPCObject
@end

@implementation RBSIsXPCObject

Class ___RBSIsXPCObject_block_invoke()
{
  Class result = NSClassFromString(@"OS_xpc_object");
  _RBSIsXPCObject_xpcClass = (uint64_t)result;
  return result;
}

@end