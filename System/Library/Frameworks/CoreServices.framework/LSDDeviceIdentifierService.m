@interface LSDDeviceIdentifierService
@end

@implementation LSDDeviceIdentifierService

void __43___LSDDeviceIdentifierService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C681FA8];
  v3 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result;
  +[_LSDDeviceIdentifierService XPCInterface]::result = v2;

  v4 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result;
  if (+[_LSDDeviceIdentifierService XPCInterface]::result
    || ([MEMORY[0x1896077D8] currentHandler],
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        [v5 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"LSDDeviceIdentifierService.mm" lineNumber:287 description:@"Failed to create XPC interface object."],  v5,  (v4 = (void *)+[_LSDDeviceIdentifierService XPCInterface]::result) != 0))
  {
    [v4 setClass:objc_opt_class() forSelector:sel_getIdentifierOfType_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_generateIdentifiersWithVendorName_bundleIdentifier_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_generateIdentifiersWithVendorName_bundleIdentifier_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDDeviceIdentifierService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_urlContainsDeviceIdentifierForAdvertising_completionHandler_ argumentIndex:0 ofReply:0];
  }

@end