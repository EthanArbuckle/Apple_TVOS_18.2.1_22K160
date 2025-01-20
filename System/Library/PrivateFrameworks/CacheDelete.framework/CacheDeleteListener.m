@interface CacheDeleteListener
+ (id)daemonListenerWithExportedObject:(id)a3;
+ (id)daemonPublicListenerWithExportedObject:(id)a3;
@end

@implementation CacheDeleteListener

+ (id)daemonListenerWithExportedObject:(id)a3
{
  id v3 = a3;
  v4 = -[CacheDeleteListener initWithName:listener:protocol:exportedObj:isExtension:]( objc_alloc(&OBJC_CLASS___CacheDeleteListener),  "initWithName:listener:protocol:exportedObj:isExtension:",  @"com.apple.cache_delete",  0LL,  &OBJC_PROTOCOL___CacheDeleteClientProtocol,  v3,  0LL);

  return v4;
}

+ (id)daemonPublicListenerWithExportedObject:(id)a3
{
  id v3 = a3;
  v4 = -[CacheDeleteListener initWithName:listener:protocol:exportedObj:isExtension:]( objc_alloc(&OBJC_CLASS___CacheDeleteListener),  "initWithName:listener:protocol:exportedObj:isExtension:",  @"com.apple.cache_delete.public",  0LL,  &OBJC_PROTOCOL___CacheDeletePublicClientProtocol,  v3,  0LL);

  return v4;
}

@end