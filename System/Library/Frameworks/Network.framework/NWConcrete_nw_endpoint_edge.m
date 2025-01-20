@interface NWConcrete_nw_endpoint_edge
- (NSString)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_endpoint_edge

- (void)dealloc
{
  name = self->name;
  if (name)
  {
    free(name);
    self->name = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_endpoint_edge;
  -[NWConcrete_nw_endpoint_edge dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  p_identifier = &self->identifier;
  id WeakRetained = objc_loadWeakRetained((id *)&self->endpoint);
  v5 = (__CFString *)CFStringCreateWithFormat(v2, 0LL, @"<nw_endpoint_edge %s %@>", p_identifier, WeakRetained);

  return (NSString *)v5;
}

- (id)redactedDescription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->endpoint);
  logging_description = nw_endpoint_get_logging_description(WeakRetained);
  v5 = (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"<nw_endpoint_edge %s %s>",  &self->identifier,  logging_description);

  return v5;
}

- (void).cxx_destruct
{
}

@end