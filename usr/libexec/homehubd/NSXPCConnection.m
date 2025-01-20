@interface NSXPCConnection
- (HHDClientProxy)clientProxy;
@end

@implementation NSXPCConnection

- (HHDClientProxy)clientProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection exportedObject](self, "exportedObject"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___HHDClientProxy, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    v5 = v2;
  }
  else {
    v5 = 0LL;
  }
  v6 = v5;

  return v6;
}

@end