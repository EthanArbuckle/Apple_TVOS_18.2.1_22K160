@interface OS_dispatch_mach
- (OS_dispatch_mach)init;
- (void)_xref_dispose;
@end

@implementation OS_dispatch_mach

- (OS_dispatch_mach)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  if ((WORD2(self[14].super.super.super.isa) & 0x10) != 0) {
    self[11].super.super.super.isa[6].isa = (Class)195952365;
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_dispatch_mach;
  -[OS_object _xref_dispose](&v3, "_xref_dispose");
}

@end