@interface OS_sysmon_table
- (void)dealloc;
@end

@implementation OS_sysmon_table

- (void)dealloc
{
  if (self[4].super.super.super.isa)
  {
    Class v3 = 0LL;
    do
    {

      Class v3 = (Class)((char *)v3 + 1);
    }

    while (v3 < self[4].super.super.super.isa);
  }

  free(self[5].super.super.super.isa);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___OS_sysmon_table;
  -[OS_sysmon_table dealloc](&v4, sel_dealloc);
}

@end