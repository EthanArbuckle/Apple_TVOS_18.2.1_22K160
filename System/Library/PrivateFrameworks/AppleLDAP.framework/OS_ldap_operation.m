@interface OS_ldap_operation
- (void)dealloc;
@end

@implementation OS_ldap_operation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_ldap_operation;
  -[OS_ldap_operation dealloc](&v3, sel_dealloc);
}

@end