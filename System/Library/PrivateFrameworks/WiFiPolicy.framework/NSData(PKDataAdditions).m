@interface NSData(PKDataAdditions)
- (id)SHA1Hash;
- (id)hexEncoding;
@end

@implementation NSData(PKDataAdditions)

- (id)SHA1Hash
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  CC_SHA1((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:md length:20];
}

- (id)hexEncoding
{
  id v2 = objc_alloc_init(MEMORY[0x189607940]);
  uint64_t v3 = [a1 length];
  uint64_t v4 = [a1 bytes];
  if (v3)
  {
    v5 = (unsigned __int8 *)v4;
    do
    {
      unsigned int v6 = *v5++;
      objc_msgSend(v2, "appendFormat:", @"%02x", v6);
      --v3;
    }

    while (v3);
  }

  return v2;
}

@end