@interface SecConcrete_sec_protocol_configuration
- (SecConcrete_sec_protocol_configuration)init;
@end

@implementation SecConcrete_sec_protocol_configuration

- (SecConcrete_sec_protocol_configuration)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SecConcrete_sec_protocol_configuration;
  v2 = -[SecConcrete_sec_protocol_configuration init](&v6, sel_init);
  if (v2)
  {
    v3 = (OS_xpc_object *)xpc_dictionary_create(0LL, 0LL, 0LL);
    dictionary = v2->dictionary;
    v2->dictionary = v3;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end