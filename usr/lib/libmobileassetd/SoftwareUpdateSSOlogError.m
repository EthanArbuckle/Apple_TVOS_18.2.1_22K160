@interface SoftwareUpdateSSOlogError
@end

@implementation SoftwareUpdateSSOlogError

void __SoftwareUpdateSSOlogError_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SoftwareUpdateSSO", "Error");
  v2 = (void *)SoftwareUpdateSSOlogError_infoError;
  SoftwareUpdateSSOlogError_infoError = (uint64_t)v1;
}

@end