@interface AppleTypeCPacketDumper
- (AppleTypeCPacketDumper)initWithFileName:(id)a3;
- (void)dumpCommand:(id)a3;
- (void)dumpResponse:(id)a3;
@end

@implementation AppleTypeCPacketDumper

- (AppleTypeCPacketDumper)initWithFileName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppleTypeCPacketDumper;
  return -[AppleTypeCPacketDumper init](&v4, sel_init, a3);
}

- (void)dumpCommand:(id)a3
{
  LOWORD(v8) = 0;
  id v4 = a3;
  *(_DWORD *)((char *)&v7 + 2) = bswap32(objc_msgSend(v4, "code", 10, v8));
  dumper = self->_dumper;
  [v4 inputData];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATCRTBloodhoundPacketDumper dumpPacket:type:metadata:metadataLength:]( dumper,  "dumpPacket:type:metadata:metadataLength:",  v6,  5LL,  &v7,  10LL);
}

- (void)dumpResponse:(id)a3
{
  id v4 = a3;
  __int16 v8 = 10;
  unsigned int v9 = bswap32([v4 code]);
  int v10 = 1;
  char v7 = [v4 result];
  [MEMORY[0x189603FB8] dataWithBytes:&v7 length:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v6 = [v4 bytesWritten];
    [v5 appendBytes:&v6 length:4];
  }

  -[ATCRTBloodhoundPacketDumper dumpPacket:type:metadata:metadataLength:]( self->_dumper,  "dumpPacket:type:metadata:metadataLength:",  v5,  5LL,  &v8,  10LL);
}

- (void).cxx_destruct
{
}

@end