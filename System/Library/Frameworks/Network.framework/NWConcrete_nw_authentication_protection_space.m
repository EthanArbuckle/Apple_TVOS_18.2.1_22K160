@interface NWConcrete_nw_authentication_protection_space
- (void)dealloc;
@end

@implementation NWConcrete_nw_authentication_protection_space

- (void)dealloc
{
  realm = self->realm;
  if (realm)
  {
    free(realm);
    self->realm = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_authentication_protection_space;
  -[NWConcrete_nw_authentication_protection_space dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end