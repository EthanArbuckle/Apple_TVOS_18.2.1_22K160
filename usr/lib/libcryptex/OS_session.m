@interface OS_session
- (void)dealloc;
@end

@implementation OS_session

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_session;
  -[OS_session dealloc](&v3, sel_dealloc);
}

@end