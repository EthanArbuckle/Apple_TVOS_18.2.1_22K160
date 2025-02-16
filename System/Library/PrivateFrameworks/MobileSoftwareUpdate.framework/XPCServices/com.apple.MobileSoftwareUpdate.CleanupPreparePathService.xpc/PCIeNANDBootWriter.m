@interface PCIeNANDBootWriter
- (BOOL)isErase;
- (BOOL)shouldCommit;
- (PCIeNANDBootWriter)initWithService:(unsigned int)a3;
- (PCIeNANDBootWriter)initWithServiceNamed:(id)a3 parent:(unsigned int)a4;
- (int)writeFirmware:(id)a3 error:(id *)a4;
- (void)appendImage:(id)a3 snapID:(int)a4;
- (void)dealloc;
- (void)resetImages;
- (void)setIsErase:(BOOL)a3;
- (void)setShouldCommit:(BOOL)a3;
@end

@implementation PCIeNANDBootWriter

- (PCIeNANDBootWriter)initWithService:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PCIeNANDBootWriter;
  v4 = -[PCIeNANDBootWriter init](&v6, "init");
  if (v4)
  {
    if (IOObjectConformsTo(a3, "AppleNVMeFWNamespaceDevice"))
    {
      v4->_service = a3;
      IOObjectRetain(a3);
    }

    else
    {

      return 0LL;
    }
  }

  return v4;
}

- (PCIeNANDBootWriter)initWithServiceNamed:(id)a3 parent:(unsigned int)a4
{
  uint64_t Namespace = MSUBootFirmwareFindNamespace(a4, (uint64_t)a3);
  objc_super v6 = -[PCIeNANDBootWriter initWithService:](self, "initWithService:", Namespace);
  if ((_DWORD)Namespace && IOObjectRelease(Namespace)) {
    -[PCIeNANDBootWriter initWithServiceNamed:parent:].cold.1(&v8, v9);
  }
  return v6;
}

- (void)dealloc
{
  io_object_t service = self->_service;
  if (service) {
    IOObjectRelease(service);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PCIeNANDBootWriter;
  -[PCIeNANDBootWriter dealloc](&v4, "dealloc");
}

- (void)resetImages
{
  v2 = self;

  v2->_imageData = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  *(_OWORD *)((char *)&v2->_table.header.var0.all + 4) = 0u;
  v2 = (PCIeNANDBootWriter *)((char *)v2 + 20);
  *(_DWORD *)(&v2[-1]._shouldCommit + 3) = 1;
  *(_OWORD *)&v2->_table.header.var0.var0.version = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[1] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[3] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[5] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[7] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[9] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[11] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[13] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[15] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[17] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[19] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[21] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[23] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[25] = 0u;
  *(_OWORD *)&v2->_table.descriptor.var0.all[27] = 0u;
  *(_OWORD *)((char *)&v2->_table.descriptor.var0.all[28] + 4) = 0u;
}

- (void)appendImage:(id)a3 snapID:(int)a4
{
  char v4 = a4;
  id v7 = [a3 length];
  imageData = self->_imageData;
  NSUInteger v9 = -[NSMutableData length](imageData, "length");
  if (v7)
  {
    uint64_t num_images = self->_table.descriptor.var0.var0.num_images;
    if (num_images <= 0x1F)
    {
      NSUInteger v11 = v9;
      -[NSMutableData appendData:](imageData, "appendData:", a3);
      unint64_t v12 = (-[NSMutableData length](imageData, "length") + 0x3FFF) & 0xFFFFFFFFFFFFC000LL;
      -[NSMutableData setLength:](imageData, "setLength:", v12);
      self->_table.header.var0.var0.firmware_sectors_written = v12 >> 12;
      self->_table.descriptor.var0.var0.uint64_t num_images = num_images + 1;
      v13 = &(&self->super.isa)[num_images];
      *((_BYTE *)v13 + 32) = v4;
      *(_WORD *)((char *)v13 + 33) = 0;
      *((_BYTE *)v13 + 35) = 0;
      *((_WORD *)v13 + 18) = v11 >> 12;
      *((_WORD *)v13 + 19) = (v12 >> 12) - (v11 >> 12);
    }
  }

- (int)writeFirmware:(id)a3 error:(id *)a4
{
  kern_return_t v7;
  id v8;
  NSMutableData *v9;
  io_connect_t connect;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t input;
  NSUInteger v16;
  _OWORD v17[5];
  connect = 0;
  if ([a3 shouldCommit])
  {
    id v7 = IOServiceOpen(self->_service, mach_task_self_, 0, &connect);
    if (!v7)
    {
      uint64_t v8 = objc_msgSend(a3, "copyFirmwareWithRestoreInfo:", objc_msgSend(a3, "llbData"));
      -[PCIeNANDBootWriter resetImages](self, "resetImages");
      -[PCIeNANDBootWriter appendImage:snapID:](self, "appendImage:snapID:", v8, 1LL);
      -[PCIeNANDBootWriter appendImage:snapID:](self, "appendImage:snapID:", [a3 ans2Data], 3);

      input = 0LL;
      v16 = 0LL;
      input = (uint64_t)-[NSMutableData bytes](self->_imageData, "bytes");
      v16 = -[NSMutableData length](self->_imageData, "length");
      id v7 = IOConnectCallScalarMethod(connect, 0, &input, 2u, 0LL, 0LL);
      if (!v7)
      {
        NSUInteger v9 = +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &self->_table,  272LL);
        -[NSMutableData setLength:](v9, "setLength:", 4096LL);
        v13 = 0LL;
        v14 = 0LL;
        v13 = (uint64_t)-[NSMutableData bytes](v9, "bytes");
        v14 = -[NSMutableData length](v9, "length");
        id v7 = IOConnectCallScalarMethod(connect, 1u, &v13, 2u, 0LL, 0LL);
      }
    }

    -[PCIeNANDBootWriter resetImages](self, "resetImages");
    if (a4 && v7) {
      *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v7,  0LL);
    }
  }

  else
  {
    id v7 = 0;
  }

  if (connect && IOServiceClose(connect)) {
    -[PCIeNANDBootWriter writeFirmware:error:].cold.1(&v12, v17);
  }
  return v7;
}

- (BOOL)isErase
{
  return self->_isErase;
}

- (void)setIsErase:(BOOL)a3
{
  self->_isErase = a3;
}

- (BOOL)shouldCommit
{
  return self->_shouldCommit;
}

- (void)setShouldCommit:(BOOL)a3
{
  self->_shouldCommit = a3;
}

  ;
}

- (void)initWithServiceNamed:(void *)a1 parent:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
  uint64_t v7 = OUTLINED_FUNCTION_0(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

- (void)writeFirmware:(void *)a1 error:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
  uint64_t v7 = OUTLINED_FUNCTION_0(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

@end