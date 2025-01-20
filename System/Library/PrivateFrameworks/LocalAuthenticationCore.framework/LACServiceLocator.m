@interface LACServiceLocator
- (LACServiceLocator)init;
- (id)serviceWithIdentifier:(id)a3;
- (void)registerService:(id)a3 identifier:(id)a4;
@end

@implementation LACServiceLocator

- (LACServiceLocator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LACServiceLocator;
  v2 = -[LACServiceLocator init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189607920] strongToWeakObjectsMapTable];
    services = v2->_services;
    v2->_services = (NSMapTable *)v3;
  }

  return v2;
}

- (void)registerService:(id)a3 identifier:(id)a4
{
}

- (id)serviceWithIdentifier:(id)a3
{
  return -[NSMapTable objectForKey:](self->_services, "objectForKey:", a3);
}

- (void).cxx_destruct
{
}

@end