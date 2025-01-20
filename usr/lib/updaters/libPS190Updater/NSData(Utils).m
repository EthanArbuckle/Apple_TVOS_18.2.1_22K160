@interface NSData(Utils)
- (id)byteString;
@end

@implementation NSData(Utils)

- (id)byteString
{
  id v2 = (id)[MEMORY[0x189607940] string];
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  if ([v3 length])
  {
    unint64_t v5 = 0LL;
    do
      objc_msgSend(v2, "appendFormat:", @"%02x", *(unsigned __int8 *)(v4 + v5++));
    while (v5 < [v3 length]);
  }

  id v6 = (id)[NSString stringWithString:v2];

  return v6;
}

@end