@interface SCATBluetoothDevice
+ (id)scatBluetoothDeviceWithDevice:(BTDeviceImpl *)a3 accessoryManager:(BTAccessoryManagerImpl *)a4;
- (BOOL)_setPropertiesFromDevice:(BTDeviceImpl *)a3 error:(id *)a4;
- (BOOL)connected;
- (NSString)addressString;
- (NSString)name;
- (SCATBluetoothDevice)initWithDevice:(BTDeviceImpl *)a3;
- (id)description;
- (unint64_t)deviceType;
@end

@implementation SCATBluetoothDevice

+ (id)scatBluetoothDeviceWithDevice:(BTDeviceImpl *)a3 accessoryManager:(BTAccessoryManagerImpl *)a4
{
  uint64_t AddressString = BTDeviceGetAddressString(a3, v42, 256LL);
  if ((_DWORD)AddressString)
  {
    int v7 = AddressString;
    uint64_t v8 = SWCHLogHW(AddressString, v6);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000AF8C8(v7, v9);
    }
LABEL_7:

LABEL_8:
    id v13 = 0LL;
    return v13;
  }

  uint64_t DeviceId = BTDeviceGetDeviceId(a3, &v27, &v26, &v25, &v24);
  if ((_DWORD)DeviceId)
  {
    uint64_t v12 = SWCHLogHW(DeviceId, v11);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000AF864();
    }
    goto LABEL_7;
  }

  int v23 = 0;
  uint64_t ConnectedServices = BTDeviceGetConnectedServices(a3, &v23);
  int v16 = ConnectedServices;
  uint64_t v18 = SWCHLogHW(ConnectedServices, v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (v16)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000AF800();
    }

    goto LABEL_8;
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316674;
    v29 = v42;
    __int16 v30 = 1024;
    int v31 = v27;
    __int16 v32 = 1024;
    int v33 = v26;
    __int16 v34 = 1024;
    int v35 = v25;
    __int16 v36 = 1024;
    int v37 = v24;
    __int16 v38 = 1024;
    int v39 = v23;
    __int16 v40 = 1024;
    int v41 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Creating SCATBluetooth device for device with address %s source %x vendor %x pid %x version %x services %x switchsupport %d",  buf,  0x30u);
  }

  objc_opt_class(&OBJC_CLASS___SCATBluetoothDevice, v21);
  id v13 = [[v22 alloc] initWithDevice:a3];
  return v13;
}

- (id)description
{
  *(void *)&double v4 = objc_opt_class(self, a2).n128_u64[0];
  if (self->_connected) {
    v5 = @"connected";
  }
  else {
    v5 = @"not connected";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@@%p: %@ (%@, %@)>",  v4,  v3,  self,  self->_name,  self->_addressString,  v5);
}

- (BOOL)_setPropertiesFromDevice:(BTDeviceImpl *)a3 error:(id *)a4
{
  int AddressString = BTDeviceGetAddressString(a3, v17, 256LL);
  if (AddressString)
  {
    if (a4)
    {
LABEL_3:
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1001565F0,  AddressString,  0LL));
      BOOL v9 = 0;
LABEL_4:
      *a4 = v8;
      return v9;
    }

    return 0;
  }

  v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
  uint64_t v11 = self->_addressString;
  self->_addressString = v10;

  int AddressString = BTDeviceGetName(a3, v17, 256LL);
  if (AddressString)
  {
    if (a4) {
      goto LABEL_3;
    }
    return 0;
  }

  id v13 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
  name = self->_name;
  self->_name = v13;

  int v16 = 0;
  int ConnectedServices = BTDeviceGetConnectedServices(a3, &v16);
  BOOL v9 = ConnectedServices == 0;
  if (!ConnectedServices)
  {
    self->_connected = v16 != 0;
    return v9;
  }

  if (a4)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1001565F0,  ConnectedServices,  0LL));
    goto LABEL_4;
  }

  return v9;
}

- (SCATBluetoothDevice)initWithDevice:(BTDeviceImpl *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATBluetoothDevice;
  double v4 = -[SCATBluetoothDevice init](&v9, "init");
  v5 = v4;
  if (!v4
    || (unsigned int v6 = -[SCATBluetoothDevice _setPropertiesFromDevice:error:](v4, "_setPropertiesFromDevice:error:", a3, 0LL),
        int v7 = 0LL,
        v6))
  {
    int v7 = v5;
  }

  return v7;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (BOOL)connected
{
  return self->_connected;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)deviceType
{
  return 0LL;
}

- (void).cxx_destruct
{
}

  ;
}

@end