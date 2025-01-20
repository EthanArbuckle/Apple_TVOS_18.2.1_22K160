@interface NWConcrete_nw_browse_result
- (NSString)description;
- (id).cxx_construct;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_browse_result

- (void)dealloc
{
  v3 = (void *)*((void *)self + 4);
  if (v3)
  {
    free(v3);
    *((void *)self + 4) = 0LL;
  }

  v4 = (void *)*((void *)self + 5);
  if (v4)
  {
    free(v4);
    *((void *)self + 5) = 0LL;
  }

  v5 = (void *)*((void *)self + 3);
  *((void *)self + 3) = 0LL;

  v6 = (void *)*((void *)self + 2);
  *((void *)self + 2) = 0LL;

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_browse_result;
  -[NWConcrete_nw_browse_result dealloc](&v7, sel_dealloc);
}

- (NSString)description
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  description = nw_browse_result_get_description(self, 0);
  return (NSString *)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (id)redactedDescription
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  description = nw_browse_result_get_description(self, 1);
  return (id)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 12) = 0;
  return self;
}

@end