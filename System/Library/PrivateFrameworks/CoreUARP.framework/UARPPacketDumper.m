@interface UARPPacketDumper
- (UARPPacketDumper)initWithFileName:(id)a3;
- (void)dump:(id)a3 accessoryID:(id)a4 uarpStatus:(unsigned int)a5 direction:(unint64_t)a6;
- (void)dump:(id)a3 uuid:(id)a4 uarpStatus:(unsigned int)a5 direction:(unint64_t)a6;
@end

@implementation UARPPacketDumper

- (UARPPacketDumper)initWithFileName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UARPPacketDumper;
  v5 = -[UARPPacketDumper init](&v10, sel_init);
  if (v5
    && (v6 = -[BloodhoundPacketDumper initWithFileName:]( objc_alloc(&OBJC_CLASS___BloodhoundPacketDumper),  "initWithFileName:",  v4),  bloodhoundDumper = v5->_bloodhoundDumper,  v5->_bloodhoundDumper = v6,  bloodhoundDumper,  !v5->_bloodhoundDumper))
  {
    v8 = 0LL;
  }

  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)dump:(id)a3 accessoryID:(id)a4 uarpStatus:(unsigned int)a5 direction:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  [a4 uuid];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UARPPacketDumper dump:uuid:uarpStatus:direction:](self, "dump:uuid:uarpStatus:direction:", v10, v11, v7, a6);
}

- (void)dump:(id)a3 uuid:(id)a4 uarpStatus:(unsigned int)a5 direction:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  memset(&v12[3], 0, 15);
  id v10 = a3;
  objc_msgSend(a4, "getUUIDBytes:", v12, 23);
  *(_DWORD *)&v12[8] = a5;
  LOBYTE(v12[10]) = v6;
  -[BloodhoundPacketDumper dumpPacket:type:metadata:metadataLength:]( self->_bloodhoundDumper,  "dumpPacket:type:metadata:metadataLength:",  v10,  3LL,  &v11,  23LL);
}

- (void).cxx_destruct
{
}

@end