@interface OS_sysmon_row
- (void)dealloc;
@end

@implementation OS_sysmon_row

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_sysmon_row;
  -[OS_sysmon_row dealloc](&v3, sel_dealloc);
}

@end