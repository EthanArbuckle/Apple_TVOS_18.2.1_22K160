@interface PS190CommitFirmwareUpdateCommand
- (BOOL)causesReset;
- (PS190CommitFirmwareUpdateCommand)initWithSubcommand:(unsigned __int8)a3;
- (id)description;
@end

@implementation PS190CommitFirmwareUpdateCommand

- (PS190CommitFirmwareUpdateCommand)initWithSubcommand:(unsigned __int8)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PS190CommitFirmwareUpdateCommand;
  return -[PS190Command initWithType:param0:param1:param2:count:data:]( &v4,  sel_initWithType_param0_param1_param2_count_data_,  153LL,  a3,  0LL,  0LL,  0LL,  0LL);
}

- (BOOL)causesReset
{
  return -[PS190Command param0](self, "param0") == 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PS190CommitFirmwareUpdateCommand;
  objc_super v4 = -[PS190Command rawDescription](&v8, sel_rawDescription);
  id v5 = (id)[v3 stringWithString:v4];

  objc_msgSend( v5,  "appendFormat:",  @" (%s)",  PS190StringForCommitFirmwareUpdateSubcommand(-[PS190Command param0](self, "param0")));
  id v6 = (id)[NSString stringWithFormat:@"<%@>", v5];

  return v6;
}

@end