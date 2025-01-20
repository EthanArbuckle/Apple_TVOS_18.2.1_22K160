@interface SAThreadCallTree
- (SADispatchQueue)dispatchQueue;
- (SASwiftTask)swiftTask;
- (SAThread)thread;
- (uint64_t)initWithThread:(void *)a3 dispatchQueue:(void *)a4 swiftTask:(void *)a5 rootObjects:;
@end

@implementation SAThreadCallTree

- (uint64_t)initWithThread:(void *)a3 dispatchQueue:(void *)a4 swiftTask:(void *)a5 rootObjects:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!a1) {
    goto LABEL_7;
  }
  if (v10 || v11 || v12)
  {
    v24.receiver = a1;
    v24.super_class = (Class)&OBJC_CLASS___SAThreadCallTree;
    v14 = (id *)objc_msgSendSuper2(&v24, sel_initWithRootObjects_, v13);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
    }

- (SAThread)thread
{
  return (SAThread *)objc_getProperty(self, a2, 16LL, 1);
}

- (SADispatchQueue)dispatchQueue
{
  return (SADispatchQueue *)objc_getProperty(self, a2, 24LL, 1);
}

- (SASwiftTask)swiftTask
{
  return (SASwiftTask *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end