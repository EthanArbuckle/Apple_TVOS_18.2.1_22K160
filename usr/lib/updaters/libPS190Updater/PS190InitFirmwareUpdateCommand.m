@interface PS190InitFirmwareUpdateCommand
- (PS190InitFirmwareUpdateCommand)initWithSubcommand:(unsigned __int8)a3 version:(const PS190RawAppFirmwareVersion *)a4;
- (id)description;
@end

@implementation PS190InitFirmwareUpdateCommand

- (PS190InitFirmwareUpdateCommand)initWithSubcommand:(unsigned __int8)a3 version:(const PS190RawAppFirmwareVersion *)a4
{
  uint64_t v4 = a3;
  id v6 = (id)[MEMORY[0x189603F48] dataWithBytes:a4 length:3];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PS190InitFirmwareUpdateCommand;
  v7 = -[PS190Command initWithType:param0:param1:param2:count:data:]( &v9,  sel_initWithType_param0_param1_param2_count_data_,  151LL,  v4,  0LL,  0LL,  0LL,  v6);

  return v7;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PS190InitFirmwareUpdateCommand;
  uint64_t v4 = -[PS190Command rawDescription](&v12, sel_rawDescription);
  id v5 = (id)[v3 stringWithString:v4];

  inited = PS190StringForInitFirmwareUpdateSubcommand(-[PS190Command param0](self, "param0"));
  v7 = -[PS190Command data](self, "data");
  v8 = -[NSData bytes](v7, "bytes");

  id v9 = (id)PS190StringForRawAppFirmwareVersion(v8);
  [v5 appendFormat:@" (%s) %@", inited, v9];
  id v10 = (id)[NSString stringWithFormat:@"<%@>", v5];

  return v10;
}

@end