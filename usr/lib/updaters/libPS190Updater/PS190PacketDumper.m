@interface PS190PacketDumper
- (PS190PacketDumper)initWithFileName:(id)a3;
- (void)dumpAppFirmwareVersion:(id)a3;
- (void)dumpBoardID:(id)a3;
- (void)dumpBootNonceHash:(id)a3;
- (void)dumpBootStatus:(id)a3;
- (void)dumpBootloaderVersion:(id)a3;
- (void)dumpCMDIFPacket:(id)a3 cmdifType:(unsigned __int16)a4;
- (void)dumpCPROFuse:(id)a3;
- (void)dumpCRC32:(id)a3;
- (void)dumpCSECFuse:(id)a3;
- (void)dumpChipID:(id)a3;
- (void)dumpCommand:(id)a3;
- (void)dumpDBGDFuse:(id)a3;
- (void)dumpDPCDPacketType:(unsigned __int16)a3 address:(unsigned int)a4 bytes:(const char *)a5 length:(unsigned int)a6;
- (void)dumpDPCDRegisterRead:(unsigned int)a3 bytes:(const char *)a4 length:(unsigned int)a5;
- (void)dumpDPCDRegisterWrite:(unsigned int)a3 bytes:(const char *)a4 length:(unsigned int)a5;
- (void)dumpECID:(id)a3;
- (void)dumpEpoch:(id)a3;
- (void)dumpOTPSerialNumber:(id)a3;
- (void)dumpRHKPFuse:(id)a3;
- (void)dumpSDOMFuse:(id)a3;
- (void)dumpSiliconID:(id)a3;
@end

@implementation PS190PacketDumper

- (PS190PacketDumper)initWithFileName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PS190PacketDumper;
  return -[PS190PacketDumper init](&v4, sel_init, a3);
}

- (void)dumpCommand:(id)a3
{
  id v4 = (id)[a3 snifferPacket];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v4, 0LL);
}

- (void)dumpAppFirmwareVersion:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  int v7 = [v5 version];

  char v9 = BYTE2(v7);
  __int16 v8 = v7;
  [v6 appendBytes:&v8 length:3];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 1LL);
}

- (void)dumpChipID:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  int v7 = [v5 chipID];

  int v8 = v7;
  [v6 appendBytes:&v8 length:4];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 2LL);
}

- (void)dumpBoardID:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  int v7 = [v5 boardID];

  int v8 = v7;
  [v6 appendBytes:&v8 length:4];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 3LL);
}

- (void)dumpEpoch:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  uint64_t v7 = [v5 epoch];

  [v6 appendByte:v7];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 4LL);
}

- (void)dumpBootloaderVersion:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  __int16 v7 = [v5 version];

  __int16 v8 = v7;
  [v6 appendBytes:&v8 length:2];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 5LL);
}

- (void)dumpSDOMFuse:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  uint64_t v7 = [v5 value];

  [v6 appendByte:v7];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 6LL);
}

- (void)dumpCPROFuse:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  uint64_t v7 = [v5 value];

  [v6 appendByte:v7];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 7LL);
}

- (void)dumpCSECFuse:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  uint64_t v7 = [v5 value];

  [v6 appendByte:v7];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 14LL);
}

- (void)dumpRHKPFuse:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  uint64_t v7 = [v5 value];

  [v6 appendByte:v7];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 15LL);
}

- (void)dumpDBGDFuse:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  uint64_t v7 = [v5 value];

  [v6 appendByte:v7];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 16LL);
}

- (void)dumpBootStatus:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  uint64_t v7 = [v5 status];

  [v6 appendByte:v7];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 8LL);
}

- (void)dumpOTPSerialNumber:(id)a3
{
  id v4 = (id)[a3 data];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v4, 9LL);
}

- (void)dumpSiliconID:(id)a3
{
  id v4 = (id)[a3 data];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v4, 10LL);
}

- (void)dumpECID:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  uint64_t v7 = [v5 value];

  uint64_t v8 = v7;
  [v6 appendBytes:&v8 length:8];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 11LL);
}

- (void)dumpBootNonceHash:(id)a3
{
  id v4 = (id)[a3 data];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v4, 12LL);
}

- (void)dumpCRC32:(id)a3
{
  id v4 = (void *)MEMORY[0x189603FB8];
  id v5 = a3;
  id v6 = (id)[v4 data];
  int v7 = [v5 value];

  int v8 = v7;
  [v6 appendBytes:&v8 length:4];
  -[PS190PacketDumper dumpCMDIFPacket:cmdifType:](self, "dumpCMDIFPacket:cmdifType:", v6, 13LL);
}

- (void)dumpCMDIFPacket:(id)a3 cmdifType:(unsigned __int16)a4
{
  v4[0] = 4;
  v4[1] = a4;
  -[PS190BloodhoundPacketDumper dumpPacket:type:metadata:metadataLength:]( self->_dumper,  "dumpPacket:type:metadata:metadataLength:",  a3,  7LL,  v4,  4LL);
}

- (void)dumpDPCDRegisterRead:(unsigned int)a3 bytes:(const char *)a4 length:(unsigned int)a5
{
  id v5 = a4;
  uint64_t v6 = *(void *)&a3;
  if (a3 == 1520 || (a3 & 0xFFFFFFF0) == 0x5C0)
  {
    -[PS190PacketDumper dumpDPCDPacketType:address:bytes:length:]( self,  "dumpDPCDPacketType:address:bytes:length:",  1LL,  *(void *)&a3,  a4,  *(void *)&a5);
  }

  else if (a5)
  {
    uint64_t v8 = a5;
    do
    {
      -[PS190PacketDumper dumpDPCDPacketType:address:bytes:length:]( self,  "dumpDPCDPacketType:address:bytes:length:",  1LL,  v6,  v5++,  1LL);
      uint64_t v6 = (v6 + 1);
      --v8;
    }

    while (v8);
  }

- (void)dumpDPCDRegisterWrite:(unsigned int)a3 bytes:(const char *)a4 length:(unsigned int)a5
{
  id v5 = a4;
  uint64_t v6 = *(void *)&a3;
  if (a3 - 1490 > 0x1E || ((1 << (a3 + 46)) & 0x40000011) == 0)
  {
    if (a5)
    {
      uint64_t v9 = a5;
      do
      {
        -[PS190PacketDumper dumpDPCDPacketType:address:bytes:length:]( self,  "dumpDPCDPacketType:address:bytes:length:",  2LL,  v6,  v5++,  1LL);
        uint64_t v6 = (v6 + 1);
        --v9;
      }

      while (v9);
    }
  }

  else
  {
    -[PS190PacketDumper dumpDPCDPacketType:address:bytes:length:]( self,  "dumpDPCDPacketType:address:bytes:length:",  2LL,  *(void *)&a3,  a4,  *(void *)&a5);
  }

- (void)dumpDPCDPacketType:(unsigned __int16)a3 address:(unsigned int)a4 bytes:(const char *)a5 length:(unsigned int)a6
{
  uint64_t v8 = *(void *)&a4;
  int v11 = 65542;
  unsigned __int16 v12 = a3;
  id v10 = (id)[MEMORY[0x189603FB8] data];
  [v10 appendLittleInt32:v8];
  [v10 appendBytes:a5 length:a6];
  -[PS190BloodhoundPacketDumper dumpPacket:type:metadata:metadataLength:]( self->_dumper,  "dumpPacket:type:metadata:metadataLength:",  v10,  8LL,  &v11,  6LL);
}

- (void).cxx_destruct
{
}

@end