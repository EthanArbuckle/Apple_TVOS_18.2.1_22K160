@interface SPIiBootUpdater
+ (id)IOMatchingPropertyTable;
- (BOOL)updateBootFirmwareWithError:(id *)a3;
- (IOServiceWriter)writer;
- (SPIiBootUpdater)initWithIOService:(unsigned int)a3;
- (id)_stitchFirmwareImage;
- (void)dealloc;
@end

@implementation SPIiBootUpdater

+ (id)IOMatchingPropertyTable
{
  v3 = @"IOProviderClass";
  v4 = @"AppleEmbeddedSimpleSPINORFlasherDriver";
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL);
}

- (SPIiBootUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SPIiBootUpdater;
  v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v18, "initWithIOService:");
  v5 = v4;
  if (v4)
  {
    unsigned int v6 = [(id)objc_opt_class(v4) supportsDualiBoot];
    BOOL v13 = v6 == 0;
    if (v6) {
      v14 = @"Device supports dual SPI boot.";
    }
    else {
      v14 = @"Device does not support dual SPI boot.";
    }
    if (v13) {
      v15 = &off_1000604D8;
    }
    else {
      v15 = off_1000604D0;
    }
    iBU_LOG_real( (uint64_t)v14,  "-[SPIiBootUpdater initWithIOService:]",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)v18.receiver);
    v16 = (IOServiceWriter *)[objc_alloc(*v15) initWithService:v3];
    v5->_writer = v16;
    if (!v16)
    {

      return 0LL;
    }
  }

  return v5;
}

- (BOOL)updateBootFirmwareWithError:(id *)a3
{
  uint64_t v57 = 0LL;
  if (!-[IOServiceWriter isAvailable](-[SPIiBootUpdater writer](self, "writer"), "isAvailable"))
  {
    v34 = -[SPIiBootUpdater writer](self, "writer");
    iBU_LOG_real( (uint64_t)@"SPIWriter %@ was unavailable at write-time",  "-[SPIiBootUpdater updateBootFirmwareWithError:]",  v35,  v36,  v37,  v38,  v39,  v40,  (uint64_t)v34);
    if (a3)
    {
      v55 = -[SPIiBootUpdater writer](self, "writer");
      v46 = MSUBootFirmwareError( 6LL,  0LL,  (uint64_t)@"SPIWriter %@ was unavailable at write-time",  v41,  v42,  v43,  v44,  v45,  (uint64_t)v55);
LABEL_15:
      BOOL v13 = 0;
      *a3 = v46;
      return v13;
    }

    return 0;
  }

  id v5 = -[SPIiBootUpdater _stitchFirmwareImage](self, "_stitchFirmwareImage");
  -[IOServiceWriter setIsErase:]( -[SPIiBootUpdater writer](self, "writer"),  "setIsErase:",  -[MSUBootFirmwareUpdater isErase](self, "isErase"));
  -[IOServiceWriter setShouldCommit:]( -[SPIiBootUpdater writer](self, "writer"),  "setShouldCommit:",  -[MSUBootFirmwareUpdater shouldCommit](self, "shouldCommit"));
  if (!v5)
  {
    iBU_LOG_real( (uint64_t)@"SPI writer firmware data was nil!",  "-[SPIiBootUpdater updateBootFirmwareWithError:]",  v6,  v7,  v8,  v9,  v10,  v11,  v53);
    if (a3)
    {
      v46 = MSUBootFirmwareError( 6LL,  0LL,  (uint64_t)@"SPI writer firmware data was nil!",  v47,  v48,  v49,  v50,  v51,  v56);
      goto LABEL_15;
    }

    return 0;
  }

  iBU_LOG_real( (uint64_t)@"Beginning write of iBoot data block to writer.",  "-[SPIiBootUpdater updateBootFirmwareWithError:]",  v6,  v7,  v8,  v9,  v10,  v11,  v53);
  unsigned int v12 = -[IOServiceWriter writeData:withError:]( -[SPIiBootUpdater writer](self, "writer"),  "writeData:withError:",  v5,  &v57);
  BOOL v13 = v12 == 0;
  if (v12)
  {
    v14 = -[SPIiBootUpdater writer](self, "writer");
    iBU_LOG_real( (uint64_t)@"Updater %@ failed to write to SPI",  "-[SPIiBootUpdater updateBootFirmwareWithError:]",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)v14);
    if (a3)
    {
      uint64_t v21 = v57;
      v22 = -[SPIiBootUpdater writer](self, "writer");
      *a3 = MSUBootFirmwareError( 3LL,  v21,  (uint64_t)@"Updater %@ failed to write to SPI",  v23,  v24,  v25,  v26,  v27,  (uint64_t)v22);
    }
  }

  if (!-[IOServiceWriter finished](-[SPIiBootUpdater writer](self, "writer"), "finished")) {
    iBU_LOG_real( (uint64_t)@"Failed to clean up SPI iBoot writer.",  "-[SPIiBootUpdater updateBootFirmwareWithError:]",  v28,  v29,  v30,  v31,  v32,  v33,  v54);
  }
  if (v12) {
    iBU_LOG_real( (uint64_t)@"Failed to fully update iBoot firmware images",  "-[SPIiBootUpdater updateBootFirmwareWithError:]",  v28,  v29,  v30,  v31,  v32,  v33,  v54);
  }

  return v13;
}

- (id)_stitchFirmwareImage
{
  uint64_t v3 = -[MSUBootFirmwareUpdater llbData](self, "llbData");
  v4 = -[MSUBootFirmwareUpdater ibootData](self, "ibootData");
  id v5 = -[MSUBootFirmwareUpdater ans2Data](self, "ans2Data");
  uint64_t v6 = -[MSUBootFirmwareUpdater logoData](self, "logoData");
  id v7 = -[MSUBootFirmwareUpdater _restoreInfoDictionary](self, "_restoreInfoDictionary");
  id v8 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", v3, v7);
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = v8;
  uint64_t v10 = -[NSMutableData initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithCapacity:",  (char *)-[NSData length](v4, "length") + -[NSData length](v3, "length") + 100);
  -[NSMutableData appendData:](v10, "appendData:", v9);

  if (v4)
  {
    if (v10)
    {
      id v11 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", v4, v7);
      if (v11)
      {
        unsigned int v12 = v11;
        -[NSMutableData appendData:](v10, "appendData:", v11);
      }
    }
  }

  if (v5)
  {
    if (v10)
    {
      id v13 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", v5, v7);
      if (v13)
      {
        v14 = v13;
        -[NSMutableData appendData:](v10, "appendData:", v13);
      }
    }
  }

  if (v6)
  {
    if (v10)
    {
      id v15 = -[MSUBootFirmwareUpdater _encodeFirmware:withRestoreInfo:](self, "_encodeFirmware:withRestoreInfo:", v6, v7);
      if (v15)
      {
        uint64_t v16 = v15;
        -[NSMutableData appendData:](v10, "appendData:", v15);
      }
    }
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SPIiBootUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v3, "dealloc");
}

- (IOServiceWriter)writer
{
  return (IOServiceWriter *)objc_getProperty(self, a2, 88LL, 1);
}

@end