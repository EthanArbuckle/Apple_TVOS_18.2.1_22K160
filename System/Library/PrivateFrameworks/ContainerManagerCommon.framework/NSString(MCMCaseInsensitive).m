@interface NSString(MCMCaseInsensitive)
- (uint64_t)MCM_isEqualToString:()MCMCaseInsensitive caseSensitive:;
@end

@implementation NSString(MCMCaseInsensitive)

- (uint64_t)MCM_isEqualToString:()MCMCaseInsensitive caseSensitive:
{
  if (a4) {
    return objc_msgSend(a1, "isEqualToString:");
  }
  else {
    return [a1 compare:a3 options:1] == 0;
  }
}

@end