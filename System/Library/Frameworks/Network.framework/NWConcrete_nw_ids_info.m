@interface NWConcrete_nw_ids_info
- (NSString)description;
- (void)dealloc;
@end

@implementation NWConcrete_nw_ids_info

- (void)dealloc
{
  session_id = self->session_id;
  if (session_id)
  {
    free(session_id);
    self->session_id = 0LL;
  }

  pseudonym = self->pseudonym;
  if (pseudonym)
  {
    free(pseudonym);
    self->pseudonym = 0LL;
  }

  push_token = self->push_token;
  if (push_token)
  {
    free(push_token);
    self->push_token = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_ids_info;
  -[NWConcrete_nw_ids_info dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)(id)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"<nw_ids_info session:%s pseudonym:%s pushtoken:%s>",  self->session_id,  self->pseudonym,  self->push_token);
}

@end