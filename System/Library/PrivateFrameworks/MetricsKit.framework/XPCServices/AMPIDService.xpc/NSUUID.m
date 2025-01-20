@interface NSUUID
- (id)mt_base62String;
@end

@implementation NSUUID

- (id)mt_base62String
{
  uint64_t v2 = 0LL;
  v3 = v7;
  do
  {
    unsigned int v4 = v8[v2];
    for (uint64_t i = 5LL; i != -1; --i)
    {
      v3[i] = aAbcdefghijklmn[v4 % 0x3E];
      v4 /= 0x3Eu;
    }

    ++v2;
    v3 += 6;
  }

  while (v2 != 4);
  return  -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v7,  24LL,  4LL);
}

@end