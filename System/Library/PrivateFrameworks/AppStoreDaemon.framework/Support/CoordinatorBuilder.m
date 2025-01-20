@interface CoordinatorBuilder
- (CoordinatorBuilder)init;
@end

@implementation CoordinatorBuilder

- (CoordinatorBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CoordinatorBuilder;
  result = -[CoordinatorBuilder init](&v3, "init");
  if (result) {
    result->_clientID = 1LL;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end