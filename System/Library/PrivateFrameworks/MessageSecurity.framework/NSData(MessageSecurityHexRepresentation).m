@interface NSData(MessageSecurityHexRepresentation)
- (__CFString)asMessageSecurityHexString;
@end

@implementation NSData(MessageSecurityHexRepresentation)

- (__CFString)asMessageSecurityHexString
{
  if ([a1 length])
  {
    unint64_t v2 = 0LL;
    v3 = &stru_189B51650;
    do
    {
      id v4 = a1;
      -[__CFString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"%02X",  *(unsigned __int8 *)([v4 bytes] + v2));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v2;
      v3 = v5;
    }

    while (v2 < [v4 length]);
  }

  else
  {
    v5 = &stru_189B51650;
  }

  return v5;
}

@end