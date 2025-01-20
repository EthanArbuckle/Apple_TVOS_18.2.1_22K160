@interface PCIeNANDiBootUpdater
+ (id)IOMatchingPropertyTable;
- (BOOL)updateBootFirmwareWithError:(id *)a3;
- (PCIeNANDBootWriter)writer;
- (PCIeNANDiBootUpdater)initWithIOService:(unsigned int)a3;
- (void)dealloc;
@end

@implementation PCIeNANDiBootUpdater

+ (id)IOMatchingPropertyTable
{
  v3 = @"IOProviderClass";
  v4 = @"AppleEmbeddedNVMeController";
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
}

- (PCIeNANDiBootUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PCIeNANDiBootUpdater;
  v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v7, "initWithIOService:");
  if (v4)
  {
    v5 = -[PCIeNANDBootWriter initWithServiceNamed:parent:]( objc_alloc(&OBJC_CLASS___PCIeNANDBootWriter),  "initWithServiceNamed:parent:",  @"EmbeddedDeviceTypePcieBootFirmware",  v3);
    v4->_writer = v5;
    if (!v5)
    {

      return 0LL;
    }
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PCIeNANDiBootUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v3, "dealloc");
}

- (BOOL)updateBootFirmwareWithError:(id *)a3
{
  v5 = -[PCIeNANDiBootUpdater writer](self, "writer");
  -[PCIeNANDBootWriter setIsErase:](v5, "setIsErase:", -[MSUBootFirmwareUpdater isErase](self, "isErase"));
  -[PCIeNANDBootWriter setShouldCommit:]( v5,  "setShouldCommit:",  -[MSUBootFirmwareUpdater shouldCommit](self, "shouldCommit"));
  return -[PCIeNANDBootWriter writeFirmware:error:](v5, "writeFirmware:error:", self, a3) == 0;
}

- (PCIeNANDBootWriter)writer
{
  return (PCIeNANDBootWriter *)objc_getProperty(self, a2, 88LL, 1);
}

@end