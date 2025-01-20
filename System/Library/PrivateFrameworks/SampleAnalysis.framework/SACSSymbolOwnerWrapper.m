@interface SACSSymbolOwnerWrapper
- (uint64_t)symbolOwner;
- (void)dealloc;
@end

@implementation SACSSymbolOwnerWrapper

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SACSSymbolOwnerWrapper;
  -[SACSSymbolOwnerWrapper dealloc](&v3, sel_dealloc);
}

- (uint64_t)symbolOwner
{
  if (result)
  {
    objc_copyStruct(&v1, (const void *)(result + 16), 16LL, 1, 0);
    return v1;
  }

  return result;
}

@end