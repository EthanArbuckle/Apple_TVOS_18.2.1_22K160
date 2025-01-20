@interface PS190CalculateCRC32Command
- (PS190CalculateCRC32Command)initWithBlockStartNumber:(unsigned __int8)a3 blockEndNumber:(unsigned __int8)a4;
- (id)description;
- (unsigned)responseSize;
@end

@implementation PS190CalculateCRC32Command

- (PS190CalculateCRC32Command)initWithBlockStartNumber:(unsigned __int8)a3 blockEndNumber:(unsigned __int8)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190CalculateCRC32Command;
  return -[PS190Command initWithType:param0:param1:param2:count:data:]( &v5,  sel_initWithType_param0_param1_param2_count_data_,  154LL,  a3,  a4,  0LL,  0LL,  0LL);
}

- (unsigned)responseSize
{
  return 4;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PS190CalculateCRC32Command;
  v4 = -[PS190Command rawDescription](&v8, sel_rawDescription);
  id v5 = (id)[v3 stringWithString:v4];

  objc_msgSend( v5,  "appendFormat:",  @" Start: %u, End: %u",  -[PS190Command param0](self, "param0"),  -[PS190Command param1](self, "param1"));
  id v6 = (id)[NSString stringWithFormat:@"<%@>", v5];

  return v6;
}

@end