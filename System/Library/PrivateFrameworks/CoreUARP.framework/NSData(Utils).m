@interface NSData(Utils)
- (id)byteString;
@end

@implementation NSData(Utils)

- (id)byteString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  if ([v3 length])
  {
    unint64_t v5 = 0LL;
    do
      objc_msgSend(v2, "appendFormat:", @"%02x", *(unsigned __int8 *)(v4 + v5++));
    while (v5 < [v3 length]);
  }

  [NSString stringWithString:v2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end