@interface CFNetworkLogForAuthTimeoutIssueSync
@end

@implementation CFNetworkLogForAuthTimeoutIssueSync

uint64_t ____CFNetworkLogForAuthTimeoutIssueSync_block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CFNETWORK_LOG_AUTH_TIMEOUT", (CFStringRef)*MEMORY[0x189605188], 0LL);
  __CFNetworkLogForAuthTimeoutIssueSync::shouldLog = result;
  return result;
}

@end