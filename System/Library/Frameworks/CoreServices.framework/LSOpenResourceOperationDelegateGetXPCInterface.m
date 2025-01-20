@interface LSOpenResourceOperationDelegateGetXPCInterface
@end

@implementation LSOpenResourceOperationDelegateGetXPCInterface

void ___LSOpenResourceOperationDelegateGetXPCInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C687958];
  v1 = (void *)_LSOpenResourceOperationDelegateGetXPCInterface::result;
  _LSOpenResourceOperationDelegateGetXPCInterface::result = v0;

  v2 = (void *)_LSOpenResourceOperationDelegateGetXPCInterface::result;
  if (_LSOpenResourceOperationDelegateGetXPCInterface::result) {
    goto LABEL_2;
  }
  [MEMORY[0x1896077D8] currentHandler];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"NSXPCInterface *_LSOpenResourceOperationDelegateGetXPCInterface()_block_invoke"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 handleFailureInFunction:v4 file:@"LSOpenOperation.mm" lineNumber:131 description:@"Failed to create XPC interface object."];

  v2 = (void *)_LSOpenResourceOperationDelegateGetXPCInterface::result;
  if (_LSOpenResourceOperationDelegateGetXPCInterface::result)
  {
LABEL_2:
    [v2 setClass:objc_opt_class() forSelector:sel_openResourceOperation_didFinishCopyingResource_ argumentIndex:0 ofReply:0];
    [(id)_LSOpenResourceOperationDelegateGetXPCInterface::result setClass:objc_opt_class() forSelector:sel_openResourceOperation_didFinishCopyingResource_ argumentIndex:1 ofReply:0];
  }

@end