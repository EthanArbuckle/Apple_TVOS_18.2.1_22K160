@interface NSString(MCMGroupIdentifier)
- (id)stringByExtractingTeamIDPrefix;
@end

@implementation NSString(MCMGroupIdentifier)

- (id)stringByExtractingTeamIDPrefix
{
  id v1 = a1;
  uint64_t v2 = [v1 cStringUsingEncoding:4];
  if ((unint64_t)[v1 lengthOfBytesUsingEncoding:4] >= 0xC && *(_BYTE *)(v2 + 10) == 46)
  {
    uint64_t v3 = 0LL;
    while (1)
    {
      int v4 = *(unsigned __int8 *)(v2 + v3);
      unsigned int v5 = v4 - 65;
      unsigned int v6 = v4 - 48;
      if (v5 >= 0x1A && v6 >= 0xA) {
        break;
      }
      if (++v3 == 10)
      {
        [v1 substringToIndex:10];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        return v8;
      }
    }
  }

  v8 = 0LL;
  return v8;
}

@end