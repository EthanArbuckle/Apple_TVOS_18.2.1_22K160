@interface OS_ldap_connection
- (void)dealloc;
@end

@implementation OS_ldap_connection

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_ldap_connection;
  -[OS_ldap_connection dealloc](&v3, sel_dealloc);
}

@end