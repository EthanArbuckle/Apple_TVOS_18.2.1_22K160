@interface OS_nw_nexus
- (void)dealloc;
@end

@implementation OS_nw_nexus

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_nw_nexus;
  -[OS_nw_nexus dealloc](&v3, sel_dealloc);
}

@end