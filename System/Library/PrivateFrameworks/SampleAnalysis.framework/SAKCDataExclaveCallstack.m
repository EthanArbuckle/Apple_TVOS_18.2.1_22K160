@interface SAKCDataExclaveCallstack
- (void)initWithInfo:(void *)a3 addresses:;
@end

@implementation SAKCDataExclaveCallstack

- (void)initWithInfo:(void *)a3 addresses:
{
  id v5 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_CLASS___SAKCDataExclaveCallstack;
    v6 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v6;
    if (v6)
    {
      v6[1] = a2;
      uint64_t v7 = [v5 copy];
      v8 = (void *)a1[2];
      a1[2] = v7;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
}

@end