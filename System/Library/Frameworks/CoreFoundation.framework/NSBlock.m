@interface NSBlock
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)invoke;
- (void)performAfterDelay:(double)a3;
@end

@implementation NSBlock

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

+ (id)alloc
{
  return 0LL;
}

- (void)invoke
{
}

- (void)performAfterDelay:(double)a3
{
  double v4 = a3 * 1000.0 * 1000.0 * 1000.0;
  else {
    int64_t v5 = (unint64_t)v4;
  }
  dispatch_time_t v6 = dispatch_time(0LL, v5);
  qos_class_t v7 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v7, 0LL);
  dispatch_after(v6, global_queue, self);
}

- (id)debugDescription
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (((uint64_t)self[1].super.isa & 0x2000000) != 0)
  {
    Class isa = self[3].super.isa;
    v3 = _Block_signature(self);
    Class v4 = isa[2].isa;
    Class v5 = isa[3].isa;
  }

  else
  {
    v3 = _Block_signature(self);
    Class v4 = 0LL;
    Class v5 = 0LL;
  }

  Class v7 = self[2].super.isa;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  v9 = (objc_class *)objc_opt_class();
  Name = class_getName(v9);
  v11 = "<unknown signature>";
  if (v3) {
    v11 = v3;
  }
  CFStringAppendFormat(Mutable, 0LL, @"<%s: %p>\n signature: \"%s\"", Name, self, v11);
  if (v7 && dladdr(v7, &v19))
  {
    dli_fname = "<unknown invoke library>";
    if (v19.dli_fname) {
      dli_fname = v19.dli_fname;
    }
    dli_sname = "<unknown invoke symbol>";
    if (v19.dli_sname) {
      dli_sname = v19.dli_sname;
    }
  }

  if (v4 && dladdr(v4, &v19))
  {
    v14 = "<unknown copy library>";
    if (v19.dli_fname) {
      v14 = v19.dli_fname;
    }
    v15 = "<unknown copy symbol>";
    if (v19.dli_sname) {
      v15 = v19.dli_sname;
    }
  }

  if (v5 && dladdr(v5, &v19))
  {
    v16 = "<unknown dispose library>";
    if (v19.dli_fname) {
      v16 = v19.dli_fname;
    }
    v17 = "<unknown dispose symbol>";
    if (v19.dli_sname) {
      v17 = v19.dli_sname;
    }
  }

  return Mutable;
}

@end