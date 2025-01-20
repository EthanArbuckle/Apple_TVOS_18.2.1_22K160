@interface NWConcrete_nw_content_context
- (NSString)description;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_content_context

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_content_context;
  -[NWConcrete_nw_content_context dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  return (NSString *)(id)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"<nw_content_context %s priority %f expiration %llu>",  (char *)self + 24,  *((void *)self + 10),  *((void *)self + 8));
}

- (id).cxx_construct
{
  *((_DWORD *)self + 28) = 0;
  return self;
}

@end