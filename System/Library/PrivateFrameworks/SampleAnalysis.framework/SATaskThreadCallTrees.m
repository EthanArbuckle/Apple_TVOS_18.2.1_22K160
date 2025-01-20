@interface SATaskThreadCallTrees
- (NSArray)threadCallTrees;
- (SATask)task;
- (void)initWithTask:(void *)a3 threadCallTrees:;
@end

@implementation SATaskThreadCallTrees

- (void)initWithTask:(void *)a3 threadCallTrees:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_CLASS___SATaskThreadCallTrees;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 1, a2);
      uint64_t v9 = [v7 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (SATask)task
{
  return (SATask *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSArray)threadCallTrees
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end