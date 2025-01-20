@interface PS190ProgramBoardIDOTPCommand
- (PS190ProgramBoardIDOTPCommand)initWithBoardID:(unsigned int)a3;
- (id)description;
- (unsigned)boardID;
@end

@implementation PS190ProgramBoardIDOTPCommand

- (PS190ProgramBoardIDOTPCommand)initWithBoardID:(unsigned int)a3
{
  unsigned int v9 = a3;
  id v5 = (id)[MEMORY[0x189603F48] dataWithBytes:&v9 length:3];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PS190ProgramBoardIDOTPCommand;
  v6 = -[PS190Command initWithType:param0:param1:param2:count:data:]( &v8,  sel_initWithType_param0_param1_param2_count_data_,  33LL,  2LL,  0LL,  0LL,  0LL,  v5);
  v6->_boardID = a3;

  return v6;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PS190ProgramBoardIDOTPCommand;
  v4 = -[PS190Command rawDescription](&v8, sel_rawDescription);
  id v5 = (id)[v3 stringWithString:v4];

  objc_msgSend(v5, "appendFormat:", @" 0x%08x", self->_boardID);
  id v6 = (id)[NSString stringWithFormat:@"<%@>", v5];

  return v6;
}

- (unsigned)boardID
{
  return self->_boardID;
}

@end