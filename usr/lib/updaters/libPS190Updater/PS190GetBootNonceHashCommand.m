@interface PS190GetBootNonceHashCommand
- (PS190GetBootNonceHashCommand)init;
- (id)description;
- (unsigned)responseSize;
@end

@implementation PS190GetBootNonceHashCommand

- (PS190GetBootNonceHashCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PS190GetBootNonceHashCommand;
  return -[PS190Command initWithType:param0:param1:param2:count:data:]( &v3,  sel_initWithType_param0_param1_param2_count_data_,  29LL,  0LL,  0LL,  0LL,  2LL,  0LL);
}

- (unsigned)responseSize
{
  return 32;
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PS190GetBootNonceHashCommand;
  v4 = -[PS190Command rawDescription](&v8, sel_rawDescription);
  id v5 = (id)[v3 stringWithString:v4];

  objc_msgSend(v5, "appendFormat:", @" Count: %u", -[PS190Command count](self, "count"));
  id v6 = (id)[NSString stringWithFormat:@"<%@>", v5];

  return v6;
}

@end