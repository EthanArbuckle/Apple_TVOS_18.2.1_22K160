@interface NSFilePromiseWriteToken
- (NSURL)logicalURL;
- (NSURL)promiseURL;
- (void)dealloc;
- (void)setLogicalURL:(id)a3;
- (void)setPromiseURL:(id)a3;
@end

@implementation NSFilePromiseWriteToken

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFilePromiseWriteToken;
  -[NSFilePromiseWriteToken dealloc](&v3, sel_dealloc);
}

- (NSURL)promiseURL
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPromiseURL:(id)a3
{
}

- (NSURL)logicalURL
{
  return (NSURL *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLogicalURL:(id)a3
{
}

@end