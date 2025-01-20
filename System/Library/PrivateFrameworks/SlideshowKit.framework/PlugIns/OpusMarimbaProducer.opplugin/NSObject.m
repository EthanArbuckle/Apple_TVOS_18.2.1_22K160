@interface NSObject
- (double)performWithDoubleResultSelector:(SEL)a3 onThread:(id)a4 withObject:(id)a5;
@end

@implementation NSObject

- (double)performWithDoubleResultSelector:(SEL)a3 onThread:(id)a4 withObject:(id)a5
{
  id v12 = a5;
  v9 = +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  -[NSObject methodSignatureForSelector:](self, "methodSignatureForSelector:"));
  -[NSInvocation setTarget:](v9, "setTarget:", self);
  -[NSInvocation setSelector:](v9, "setSelector:", a3);
  if (a5) {
    -[NSInvocation setArgument:atIndex:](v9, "setArgument:atIndex:", &v12, 2LL);
  }
  -[NSInvocation performSelector:onThread:withObject:waitUntilDone:]( v9,  "performSelector:onThread:withObject:waitUntilDone:",  "invoke",  a4,  0LL,  1LL);
  double v11 = 0.0;
  -[NSInvocation getReturnValue:](v9, "getReturnValue:", &v11);
  return v11;
}

@end