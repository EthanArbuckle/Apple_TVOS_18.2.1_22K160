@interface INMediaItemResolutionResult
- (BOOL)_isResolutionTerminal;
@end

@implementation INMediaItemResolutionResult

- (BOOL)_isResolutionTerminal
{
  unint64_t v2 = (unint64_t)-[INMediaItemResolutionResult resolutionResultCode](self, "resolutionResultCode");
  return (v2 & 0xFFFFFFFFFFFFFFFDLL) != 0 && v2 != 3;
}

@end