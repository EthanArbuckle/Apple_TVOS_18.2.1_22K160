@interface AppleTypeCRetimerFifoDumper
- (AppleTypeCRetimerFifoDumper)initWithBloodhoundDumper:(id)a3;
- (void)dumpAccessForRegisterAddress:(unsigned __int8)a3 ioReturn:(unsigned int)a4 data:(id)a5;
@end

@implementation AppleTypeCRetimerFifoDumper

- (AppleTypeCRetimerFifoDumper)initWithBloodhoundDumper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerFifoDumper;
  v6 = -[AppleTypeCRetimerFifoDumper init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dumper, a3);
  }

  return v7;
}

- (void)dumpAccessForRegisterAddress:(unsigned __int8)a3 ioReturn:(unsigned int)a4 data:(id)a5
{
  __int16 v5 = 7;
  unsigned __int8 v6 = a3;
  unsigned int v7 = a4;
  -[ATCRTBloodhoundPacketDumper dumpPacket:type:metadata:metadataLength:]( self->_dumper,  "dumpPacket:type:metadata:metadataLength:",  a5,  10LL,  &v5,  7LL);
}

- (void).cxx_destruct
{
}

@end