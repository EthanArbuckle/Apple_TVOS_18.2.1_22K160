@interface SOSCircleForEachRetiredPeer
@end

@implementation SOSCircleForEachRetiredPeer

CFDictionaryRef __SOSCircleForEachRetiredPeer_block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  result = *(const __CFDictionary **)(a2 + 16);
  if (result) {
    return CFDictionaryGetValue(result, @"RetirementDate" != 0LL);
  }
  return result;
}

@end