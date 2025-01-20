@interface NSString(LSDebuggingAdditions)
+ (__CFString)NSStringFromLSInstallPhase:()LSDebuggingAdditions;
+ (__CFString)NSStringFromLSInstallState:()LSDebuggingAdditions;
+ (__CFString)NSStringFromLSInstallType:()LSDebuggingAdditions;
@end

@implementation NSString(LSDebuggingAdditions)

+ (__CFString)NSStringFromLSInstallPhase:()LSDebuggingAdditions
{
  if (a3 < 5) {
    return off_189D770D8[a3];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"(LSInstallPhase)%llu", a3);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (__CFString)NSStringFromLSInstallState:()LSDebuggingAdditions
{
  if (a3 < 6) {
    return off_189D77100[a3];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"(LSInstallState)%llu", a3);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (__CFString)NSStringFromLSInstallType:()LSDebuggingAdditions
{
  if (a3 < 0xB) {
    return off_189D77130[a3];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"(LSInstallType)%llu", a3);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

@end