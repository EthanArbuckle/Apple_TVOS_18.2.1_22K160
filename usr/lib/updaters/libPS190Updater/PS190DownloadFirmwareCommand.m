@interface PS190DownloadFirmwareCommand
- (PS190DownloadFirmwareCommand)initWithBlock:(id)a3;
- (id)description;
@end

@implementation PS190DownloadFirmwareCommand

- (PS190DownloadFirmwareCommand)initWithBlock:(id)a3
{
  v4 = (void *)MEMORY[0x189603F48];
  id v5 = a3;
  id v6 = (id)objc_msgSend( v4,  "dataWithBytes:length:",  objc_msgSend(v5, "bytes"),  4096);
  unsigned __int8 v7 = [v5 number];
  uint64_t v8 = [v5 crc8];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PS190DownloadFirmwareCommand;
  v9 = -[PS190Command initWithType:param0:param1:param2:count:data:]( &v11,  sel_initWithType_param0_param1_param2_count_data_,  152LL,  v7,  0LL,  v8,  0LL,  v6);

  return v9;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PS190DownloadFirmwareCommand;
  v4 = -[PS190Command rawDescription](&v8, sel_rawDescription);
  id v5 = (id)[v3 stringWithString:v4];

  objc_msgSend( v5,  "appendFormat:",  @" Block Number: %u, CRC8: 0x%02x",  -[PS190Command param0](self, "param0"),  -[PS190Command param2](self, "param2"));
  id v6 = (id)[NSString stringWithFormat:@"<%@>", v5];

  return v6;
}

@end