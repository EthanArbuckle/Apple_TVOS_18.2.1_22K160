@interface NSURLError
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLError

- (void)encodeWithCoder:(id)a3
{
  v7[5] = *MEMORY[0x1895F89C0];
  v5 = -[NSError userInfo](self, "userInfo");
  v6 = (void *)-[NSDictionary mutableCopy](v5, "mutableCopy");
  [v6 removeObjectForKey:@"NSErrorPeerCertificateChainKey"];
  [v6 removeObjectForKey:@"NSErrorClientCertificateChainKey"];
  [v6 removeObjectForKey:@"NSURLErrorFailingURLPeerTrustErrorKey"];
  [v6 removeObjectForKey:@"NSUnderlyingError"];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __dictionaryThatCanCode_block_invoke;
  v7[3] = &unk_189C9A768;
  v7[4] = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[NSError encodeWithCoder:]( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  -[NSError domain](self, "domain"),  -[NSError code](self, "code"),  v6),  "encodeWithCoder:",  a3);
}

@end