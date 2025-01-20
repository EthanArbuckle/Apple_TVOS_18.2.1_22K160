@interface OS_session_core
- (void)dealloc;
@end

@implementation OS_session_core

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_session_core;
  -[OS_session_core dealloc](&v3, sel_dealloc);
}

@end