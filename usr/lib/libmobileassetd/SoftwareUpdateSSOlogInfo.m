@interface SoftwareUpdateSSOlogInfo
@end

@implementation SoftwareUpdateSSOlogInfo

void __SoftwareUpdateSSOlogInfo_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SoftwareUpdateSSO", "Notice");
  v2 = (void *)SoftwareUpdateSSOlogInfo_infoLog;
  SoftwareUpdateSSOlogInfo_infoLog = (uint64_t)v1;
}

@end