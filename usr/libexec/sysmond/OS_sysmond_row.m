@interface OS_sysmond_row
- (void)dealloc;
@end

@implementation OS_sysmond_row

- (void)dealloc
{
  OS_sysmond_row v3 = self[3];
  if (v3)
  {
    for (unint64_t i = 0LL; i < *(void *)&v3; ++i)
    {
      v5 = *(void **)(*(void *)&self[4] + 8 * i);
      if (v5)
      {
        xpc_release(v5);
        OS_sysmond_row v3 = self[3];
      }
    }
  }

  free(*(void **)&self[4]);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OS_sysmond_row;
  -[OS_sysmond_row dealloc](&v6, "dealloc");
}

@end