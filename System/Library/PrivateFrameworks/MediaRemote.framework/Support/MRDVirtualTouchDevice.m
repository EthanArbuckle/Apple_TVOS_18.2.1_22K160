@interface MRDVirtualTouchDevice
- (BOOL)handleHIDReport:(id)a3;
- (BOOL)handleTouchEvent:(_MRHIDTouchEvent *)a3;
- (MRDVirtualTouchDevice)initWithDeviceDescriptor:(id)a3;
- (MRVirtualTouchDeviceDescriptor)deviceDescriptor;
- (__IOHIDUserDevice)ioDevice;
- (id)_newIOKitDeviceProperties;
- (id)deviceProperties;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
@end

@implementation MRDVirtualTouchDevice

- (MRDVirtualTouchDevice)initWithDeviceDescriptor:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MRDVirtualTouchDevice;
  v5 = -[MRDVirtualTouchDevice init](&v19, "init");
  if (!v5) {
    goto LABEL_6;
  }
  v6 = (MRVirtualTouchDeviceDescriptor *)[v4 copy];
  deviceDescriptor = v5->_deviceDescriptor;
  v5->_deviceDescriptor = v6;

  do
  {
    unsigned int v8 = __ldxr(&dword_1003FE0BC);
    signed int v9 = v8 + 1;
  }

  while (__stxr(v9, &dword_1003FE0BC));
  v5->_uniqueIdentifier = v9;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  activeTouchEventsForFingerIndices = v5->_activeTouchEventsForFingerIndices;
  v5->_activeTouchEventsForFingerIndices = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDVirtualTouchDevice deviceProperties](v5, "deviceProperties"));
  uint64_t v13 = IOHIDUserDeviceCreate(kCFAllocatorDefault, v12);
  v5->_ioDevice = (__IOHIDUserDevice *)v13;
  if (v13)
  {

LABEL_6:
    v15 = v5;
    goto LABEL_10;
  }

  uint64_t v16 = _MRLogForCategory(0LL, v14);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    sub_1002BA764(v17);
  }

  v15 = 0LL;
LABEL_10:

  return v15;
}

- (void)dealloc
{
  ioDevice = self->_ioDevice;
  if (ioDevice) {
    CFRelease(ioDevice);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDVirtualTouchDevice;
  -[MRDVirtualTouchDevice dealloc](&v4, "dealloc");
}

- (id)deviceProperties
{
  deviceProperties = self->_deviceProperties;
  if (!deviceProperties)
  {
    objc_super v4 = -[MRDVirtualTouchDevice _newIOKitDeviceProperties](self, "_newIOKitDeviceProperties");
    v5 = self->_deviceProperties;
    self->_deviceProperties = v4;

    deviceProperties = self->_deviceProperties;
  }

  return deviceProperties;
}

- (BOOL)handleHIDReport:(id)a3
{
  ioDevice = self->_ioDevice;
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = [v5 length];

  int v9 = IOHIDUserDeviceHandleReport(ioDevice, v6, v7);
  if (v9)
  {
    uint64_t v10 = _MRLogForCategory(0LL, v8);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t uniqueIdentifier = self->_uniqueIdentifier;
      int v14 = 134218240;
      unint64_t v15 = uniqueIdentifier;
      __int16 v16 = 1024;
      int v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "WARNING: Failed to handle HID report for device ID %llu. (kernel error = %d)",  (uint8_t *)&v14,  0x12u);
    }
  }

  return v9 == 0;
}

- (BOOL)handleTouchEvent:(_MRHIDTouchEvent *)a3
{
  __int128 v5 = *(_OWORD *)&a3->var2;
  __int128 v17 = *(_OWORD *)&a3->var0.var0.var0;
  __int128 v18 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithMRHIDTouchEvent:](&OBJC_CLASS___NSValue, "valueWithMRHIDTouchEvent:", &v17));
  activeTouchEventsForFingerIndices = self->_activeTouchEventsForFingerIndices;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3->var3));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( activeTouchEventsForFingerIndices,  "setObject:forKeyedSubscript:",  v6,  v8);

  *(void *)&__int128 v17 = 0LL;
  *((void *)&v17 + 1) = &v17;
  *(void *)&__int128 v18 = 0x3010000000LL;
  *((void *)&v18 + 1) = &unk_100341F6E;
  memset(v19, 0, sizeof(v19));
  v19[12] = a3->var1 == 5;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  int v16 = 0;
  int v9 = self->_activeTouchEventsForFingerIndices;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10012B004;
  v14[3] = &unk_1003A1D08;
  v14[4] = &v17;
  v14[5] = v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v14);
  if (a3->var1 - 1 >= 3)
  {
    uint64_t v10 = self->_activeTouchEventsForFingerIndices;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3->var3));
    -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);
  }

  BOOL v12 = IOHIDUserDeviceHandleReportWithTimeStamp( self->_ioDevice,  a3->var2,  (const uint8_t *)(*((void *)&v17 + 1) + 32LL),  13LL) == 0;
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);
  return v12;
}

- (id)_newIOKitDeviceProperties
{
  LODWORD(v18) = -1073638137;
  __int128 v15 = xmmword_10034BAD8;
  __int128 v16 = unk_10034BAE8;
  __int128 v17 = xmmword_10034BAF8;
  __int128 v11 = xmmword_10034BA98;
  __int128 v12 = unk_10034BAA8;
  __int128 v13 = xmmword_10034BAB8;
  __int128 v14 = unk_10034BAC8;
  __int128 v9 = xmmword_10034BA78;
  __int128 v10 = unk_10034BA88;
  HIBYTE(v11) = (int)v3;
  LOBYTE(v12) = (unsigned __int16)(int)v3 >> 8;
  HIWORD(v15) = (int)v3;
  WORD6(v12) = (int)v4;
  *(_WORD *)((char *)&v16 + 11) = WORD6(v12);
  __int128 v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v9, 148LL);
  -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  v6,  @"ReportDescriptor",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MRVirtualTouchDeviceDescriptor isIntegratedDisplay](self->_deviceDescriptor, "isIntegratedDisplay")));
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, @"DisplayIntegrated");

  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &off_1003BB810, @"ProductID");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &off_1003BB828, @"VendorID");

  return v5;
}

- (MRVirtualTouchDeviceDescriptor)deviceDescriptor
{
  return self->_deviceDescriptor;
}

- (unint64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (__IOHIDUserDevice)ioDevice
{
  return self->_ioDevice;
}

- (void).cxx_destruct
{
}

@end