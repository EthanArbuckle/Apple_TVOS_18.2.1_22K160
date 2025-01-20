@interface NSMethodSignature(NSMethodSignatureComparison)
- (uint64_t)_isCompatibleWithMethodSignature:()NSMethodSignatureComparison;
@end

@implementation NSMethodSignature(NSMethodSignatureComparison)

- (uint64_t)_isCompatibleWithMethodSignature:()NSMethodSignatureComparison
{
  if (objc_msgSend(a1, "isEqual:")) {
    return 1LL;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0LL;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0LL;
  }
  uint64_t v6 = [a1 numberOfArguments];
  if (v6 != [a3 numberOfArguments]) {
    return 0LL;
  }
  uint64_t result = encodingsAreCompatible( (const char *)[a1 methodReturnType],  (const char *)objc_msgSend(a3, "methodReturnType"));
  if (!(_DWORD)result) {
    return result;
  }
  int v7 = [a1 _isBlock];
  if (!v6) {
    return 1LL;
  }
  uint64_t v8 = 0LL;
  do
  {
    uint64_t result = encodingsAreCompatible( (const char *)[a1 getArgumentTypeAtIndex:v8],  (const char *)objc_msgSend(a3, "getArgumentTypeAtIndex:", v8));
    if (!(_DWORD)result) {
      break;
    }
  }

  while (v6 - 1 != v8++);
  return result;
}

@end