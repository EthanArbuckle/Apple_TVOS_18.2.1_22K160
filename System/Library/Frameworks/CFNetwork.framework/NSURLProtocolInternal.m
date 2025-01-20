@interface NSURLProtocolInternal
- (void)dealloc;
- (void)initWithRequest:(void *)a3 cachedResponse:(void *)a4 client:;
@end

@implementation NSURLProtocolInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLProtocolInternal;
  -[NSURLProtocolInternal dealloc](&v3, sel_dealloc);
}

- (void)initWithRequest:(void *)a3 cachedResponse:(void *)a4 client:
{
  if (!a1) {
    return 0LL;
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_CLASS___NSURLProtocolInternal;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[2] = a2;
    v7[3] = a3;
    v7[1] = a4;
  }

  return v7;
}

@end