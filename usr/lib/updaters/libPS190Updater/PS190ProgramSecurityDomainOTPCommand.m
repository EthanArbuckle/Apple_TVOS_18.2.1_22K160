@interface PS190ProgramSecurityDomainOTPCommand
- (PS190ProgramSecurityDomainOTPCommand)initWithSecurityDomain:(unsigned __int8)a3;
- (id)description;
- (unsigned)securityDomain;
@end

@implementation PS190ProgramSecurityDomainOTPCommand

- (PS190ProgramSecurityDomainOTPCommand)initWithSecurityDomain:(unsigned __int8)a3
{
  unsigned __int8 v8 = a3;
  id v4 = (id)[MEMORY[0x189603F48] dataWithBytes:&v8 length:1];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PS190ProgramSecurityDomainOTPCommand;
  v5 = -[PS190Command initWithType:param0:param1:param2:count:data:]( &v7,  sel_initWithType_param0_param1_param2_count_data_,  33LL,  0LL,  0LL,  0LL,  0LL,  v4);
  v5->_securityDomain = v8;

  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PS190ProgramSecurityDomainOTPCommand;
  id v4 = -[PS190Command rawDescription](&v8, sel_rawDescription);
  id v5 = (id)[v3 stringWithString:v4];

  objc_msgSend(v5, "appendFormat:", @" 0x%02x", self->_securityDomain);
  id v6 = (id)[NSString stringWithFormat:@"<%@>", v5];

  return v6;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

@end