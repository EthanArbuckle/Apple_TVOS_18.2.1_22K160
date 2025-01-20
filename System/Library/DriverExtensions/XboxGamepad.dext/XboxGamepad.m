BOOL XboxUSBDevice::init(IOService *this)
{
  BOOL v2;
  v2 = IOService::init(this);
  if (v2)
  {
    if (!this->ivars) {
      XboxUSBDevice::init();
    }
    this[1].OSObject::OSMetaClassBase::__vftable = (IOService_vtbl *)IOMallocZeroTyped(8LL, 0x2004093837F09LL);
  }

  return v2;
}

BOOL non-virtual thunk to'XboxUSBDevice::init(XboxUSBDevice *this)
{
  return XboxUSBDevice::init((IOService *)((char *)this - 24));
}

void XboxUSBDevice::free(IOService *this)
{
  this[1].getMetaClass = 0LL;
  v2 = this[1].OSObject::OSMetaClassBase::__vftable;
  if (v2)
  {
    IOFree(v2, 8uLL);
    this[1].OSObject::OSMetaClassBase::__vftable = 0LL;
  }

  IOService::free(this);
}

void non-virtual thunk to'XboxUSBDevice::free(XboxUSBDevice *this)
{
}

uint64_t XboxUSBDevice::Start_Impl(XboxUSBDevice *this, IOService *anObject)
{
  properties = 0LL;
  **((void **)this + 6) = OSMetaClassBase::safeMetaCast(anObject, gIOUSBHostDeviceMetaClass);
  if (!**((void **)this + 6))
  {
    uint64_t v27 = 3758097084LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v27;
    }
    ClassName = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v32 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v48 = 2048;
    uint64_t v49 = v32;
    v33 = "[%s 0x%llx] Provider is not an 'IOUSBHostDevice'.\n";
LABEL_40:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v33,  registryEntryID,  0x16u);
    return v27;
  }

  uint64_t v4 = IOService::Start((IOService *)this, anObject, (OSDispatchMethod)&IOService::_Dispatch);
  if ((_DWORD)v4) {
    return v4;
  }
  unsigned int v5 = IOService::CopyProperties((IOService *)this, &properties, (OSDispatchMethod)&IOService::_Dispatch);
  if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v7 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v6;
    __int16 v48 = 2048;
    uint64_t v49 = v7;
    __int16 v50 = 1024;
    int v51 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] #NOTE CopyProperties() failed: %{mach.errno}d\n",  registryEntryID,  0x1Cu);
  }

  uint64_t v8 = (*(uint64_t (**)(void))(***((void ***)this + 6) + 64LL))(**((void **)this + 6));
  if (!v8)
  {
    uint64_t v27 = 3758097086LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v27;
    }
    v34 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v35 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v34;
    __int16 v48 = 2048;
    uint64_t v49 = v35;
    v33 = "[%s 0x%llx] Failed to obtain the device descriptor. CopyDeviceDescriptor() returned NULL.\n";
    goto LABEL_40;
  }

  v9 = (const IOUSBDeviceDescriptor *)v8;
  uint32_t v10 = *(unsigned __int8 *)(v8 + 17);
  if (v10)
  {
    OSArrayPtr v11 = OSArray::withCapacity(v10);
    if (v11)
    {
      v12 = v11;
      if (v9->bNumConfigurations)
      {
        unsigned __int8 v13 = 0;
        while (1)
        {
          uint64_t v14 = (*(uint64_t (**)(void, void))(***((void ***)this + 6) + 72LL))( **((void **)this + 6),  v13);
          if (!v14) {
            break;
          }
          v15 = (const IOUSBConfigurationDescriptor *)v14;
          v16 = v9;
          v17 = OSDictionaryCreate();
          if (v17)
          {
            v18 = v17;
            OSDictionarySetUInt64Value(v17, "bLength", v15->bLength);
            OSDictionarySetUInt64Value(v18, "bDescriptorType", v15->bDescriptorType);
            OSDictionarySetUInt64Value(v18, "wTotalLength", v15->wTotalLength);
            OSDictionarySetUInt64Value(v18, "bNumInterfaces", v15->bNumInterfaces);
            OSDictionarySetUInt64Value(v18, "bConfigurationValue", v15->bConfigurationValue);
            OSDictionarySetUInt64Value(v18, "iConfiguration", v15->iConfiguration);
            OSDictionarySetUInt64Value(v18, "bmAttributes", v15->bmAttributes);
            OSDictionarySetUInt64Value(v18, "MaxPower", v15->MaxPower);
            OSArray::setObject(v12, v18);
            ((void (*)(OSDictionary *))v18->release)(v18);
          }

          IOUSBHostFreeDescriptor(v15);
          ++v13;
          v9 = v16;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v29 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
          *(void *)registryEntryID = 0LL;
          IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
          uint64_t v30 = *(void *)registryEntryID;
          *(_DWORD *)registryEntryID = 136315650;
          *(void *)&registryEntryID[4] = v29;
          __int16 v48 = 2048;
          uint64_t v49 = v30;
          __int16 v50 = 1024;
          int v51 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] #NOTE CopyConfigurationDescriptor(%d) returned NULL.\n",  registryEntryID,  0x1Cu);
        }

        uint64_t v27 = v5;
        goto LABEL_30;
      }

LABEL_15:
      v19 = OSDictionaryCreate();
      if (v19)
      {
        v20 = v19;
        OSDictionarySetValue(v19, "Configurations", v12);
        IOService::SetProperties((IOService *)this, v20, 0LL);
        ((void (*)(OSDictionary *))v20->release)(v20);
      }

      ((void (*)(OSArray *))v12->release)(v12);
    }

    if (properties
      && (OSObjectPtr Value = OSDictionaryGetValue(properties, "kUSBPreferredConfiguration"),
          (v22 = (const OSNumber *)OSMetaClassBase::safeMetaCast(Value, gOSNumberMetaClass)) != 0LL))
    {
      int v23 = OSNumber::unsigned8BitValue(v22);
    }

    else
    {
      int v23 = 0;
    }

    uint64_t v24 = IOUSBHostDevice::Open(**((IOUSBHostDevice ***)this + 6), (IOService *)this, 0, 0LL, 0LL);
    if ((_DWORD)v24)
    {
      uint64_t v27 = v24;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v39 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
        uint64_t v40 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136315650;
        *(void *)&registryEntryID[4] = v39;
        __int16 v48 = 2048;
        uint64_t v49 = v40;
        __int16 v50 = 1024;
        int v51 = v27;
        v38 = "[%s 0x%llx] Could not open provider. Open failed: %{mach.errno}d\n";
        uint32_t v41 = 28;
LABEL_50:
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v38,  registryEntryID,  v41);
      }
    }

    else
    {
      if (v23)
      {
        v25 = 0LL;
        goto LABEL_27;
      }

      uint64_t v26 = (*(uint64_t (**)(void, void))(***((void ***)this + 6) + 72LL))(**((void **)this + 6), 0LL);
      if (v26)
      {
        v25 = (const IOUSBConfigurationDescriptor *)v26;
        int v23 = *(unsigned __int8 *)(v26 + 5);
LABEL_27:
        uint64_t v27 = IOUSBHostDevice::SetConfiguration(**((IOUSBHostDevice ***)this + 6), v23, 1, 0LL);
        if ((_DWORD)v27 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v42 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
          *(void *)registryEntryID = 0LL;
          IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
          uint64_t v43 = *(void *)registryEntryID;
          *(_DWORD *)registryEntryID = 136315906;
          *(void *)&registryEntryID[4] = v42;
          __int16 v48 = 2048;
          uint64_t v49 = v43;
          __int16 v50 = 1024;
          int v51 = v23;
          __int16 v52 = 1024;
          int v53 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Could not apply configuration. SetConfiguration(%d) failed: %{mach.errno}d\n",  registryEntryID,  0x22u);
        }

        if (v25) {
          IOUSBHostFreeDescriptor(v25);
        }
        goto LABEL_30;
      }

      uint64_t v27 = 3758097086LL;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v44 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
        uint64_t v45 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136315394;
        *(void *)&registryEntryID[4] = v44;
        __int16 v48 = 2048;
        uint64_t v49 = v45;
        v38 = "[%s 0x%llx] CopyConfigurationDescriptor(0) returned NULL.\n";
        goto LABEL_49;
      }
    }
  }

  else
  {
    uint64_t v27 = 3758097129LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v36 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v37 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v36;
      __int16 v48 = 2048;
      uint64_t v49 = v37;
      v38 = "[%s 0x%llx] Device descriptor has no configurations.\n";
LABEL_49:
      uint32_t v41 = 22;
      goto LABEL_50;
    }
  }

    IOHIDDevice::CompleteReport(this, a6, v8, 0, 0LL);
    return v8;
  }

  AsyncSendAction = XboxHIDDevice::getAsyncSendAction(this);
  if (!AsyncSendAction)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v19 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      v20 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v19;
      uint64_t v26 = 2048;
      uint64_t v27 = v20;
      v18 = "[%s 0x%llx] No available action\n";
      goto LABEL_14;
    }

    goto LABEL_15;
  }

  v12 = AsyncSendAction;
  Reference = OSAction::GetReference(AsyncSendAction);
  *Reference = a6;
  Reference[1] = a2;
  ((void (*)(IOMemoryDescriptor *))a2->retain)(a2);
  ((void (*)(OSAction *))a6->retain)(a6);
  uint64_t v14 = IOUSBHostPipe::AsyncIO( (IOUSBHostPipe *)this[1].IOService::OSObject::OSObjectInterface::__vftable[7].init,  a2,  returnLength,  v12,  0,  0LL);
  uint64_t v8 = 0LL;
  if ((_DWORD)v14)
  {
    v21 = v14;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v22 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      int v23 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v22;
      uint64_t v26 = 2048;
      uint64_t v27 = v23;
      v28 = 1024;
      v29 = returnLength;
      uint64_t v30 = 1024;
      v31 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] _outPipe->AsyncIO(%d):0x%x\n",  registryEntryID,  0x22u);
    }

    IOHIDDevice::CompleteReport(this, a6, v21, 0, 0LL);
    XboxHIDDevice::returnAction(this, v12);
    return v21;
  }

  return v8;
}

LABEL_30:
  IOUSBHostFreeDescriptor(v9);
  return v27;
}

uint64_t XboxUSBDevice::Stop_Impl(IOService *this, IOService *a2)
{
  kern_return_t v7;
  const char *v8;
  uint64_t v9;
  _BYTE v11[12];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  kern_return_t v15;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)OSArrayPtr v11 = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)v11, 0LL);
    uint64_t v5 = *(void *)v11;
    *(_DWORD *)OSArrayPtr v11 = 136315394;
    *(void *)&v11[4] = ClassName;
    v12 = 2048;
    unsigned __int8 v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Stop\n",  v11,  0x16u);
  }

  getMetaClass = (IOUSBHostDevice *)this[1].getMetaClass;
  if (getMetaClass)
  {
    uint64_t v7 = IOUSBHostDevice::Close(getMetaClass, this, 0, 0LL);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = OSMetaClassBase::GetClassName(this);
      *(void *)OSArrayPtr v11 = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)v11, 0LL);
      v9 = *(void *)v11;
      *(_DWORD *)OSArrayPtr v11 = 136315650;
      *(void *)&v11[4] = v8;
      v12 = 2048;
      unsigned __int8 v13 = v9;
      uint64_t v14 = 1024;
      v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Close provider interface: %{mach.errno}d\n",  v11,  0x1Cu);
    }
  }

  return IOService::Stop(this, a2, (OSDispatchMethod)&IOService::_Dispatch);
}

BOOL XboxHIDDevice::init(IOService *this)
{
  BOOL v2 = IOService::init(this);
  if (v2)
  {
    if (!this->ivars) {
      XboxHIDDevice::init();
    }
    this[1].ivars = (IOService_IVars *)IOMallocZeroTyped(176LL, 0x1060040E6D5B738LL);
  }

  return v2;
}

BOOL non-virtual thunk to'XboxHIDDevice::init(XboxHIDDevice *this)
{
  return XboxHIDDevice::init((IOService *)((char *)this - 24));
}

void XboxHIDDevice::free(IOService *this)
{
  ivars = this[1].ivars;
  uint64_t v3 = *((void *)ivars + 19);
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
    *((void *)this[1].ivars + 19) = 0LL;
    ivars = this[1].ivars;
  }

  uint64_t v4 = *((void *)ivars + 20);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 16LL))(v4);
    *((void *)this[1].ivars + 20) = 0LL;
    ivars = this[1].ivars;
  }

  uint64_t v5 = *((void *)ivars + 18);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 16LL))(v5);
    *((void *)this[1].ivars + 18) = 0LL;
    ivars = this[1].ivars;
  }

  uint64_t v6 = *((void *)ivars + 17);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 16LL))(v6);
    *((void *)this[1].ivars + 17) = 0LL;
    ivars = this[1].ivars;
  }

  uint64_t v7 = *((void *)ivars + 16);
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 16LL))(v7);
    *((void *)this[1].ivars + 16) = 0LL;
    ivars = this[1].ivars;
  }

  uint64_t v8 = *((void *)ivars + 14);
  if (v8)
  {
    (*(void (**)(uint64_t))(*(void *)v8 + 16LL))(v8);
    *((void *)this[1].ivars + 14) = 0LL;
    ivars = this[1].ivars;
  }

  *((void *)ivars + 13) = 0LL;
  v9 = this[1].ivars;
  uint64_t v10 = *((void *)v9 + 12);
  if (v10)
  {
    (*(void (**)(uint64_t))(*(void *)v10 + 16LL))(v10);
    *((void *)this[1].ivars + 12) = 0LL;
    v9 = this[1].ivars;
  }

  uint64_t v11 = *((void *)v9 + 6);
  if (v11)
  {
    (*(void (**)(uint64_t))(*(void *)v11 + 16LL))(v11);
    *((void *)this[1].ivars + 6) = 0LL;
    v9 = this[1].ivars;
  }

  *((void *)v9 + 5) = 0LL;
  v12 = this[1].ivars;
  unsigned __int8 v13 = (const IOUSBDeviceDescriptor *)*((void *)v12 + 2);
  if (v13)
  {
    IOUSBHostFreeDescriptor(v13);
    *((void *)this[1].ivars + 2) = 0LL;
    v12 = this[1].ivars;
  }

  *((void *)v12 + 3) = 0LL;
  uint64_t v14 = this[1].ivars;
  if (*((void *)v14 + 2))
  {
    IOUSBHostFreeDescriptor(*((const IOUSBDeviceDescriptor **)v14 + 2));
    *((void *)this[1].ivars + 2) = 0LL;
    uint64_t v14 = this[1].ivars;
  }

  if (*(void *)v14)
  {
    (*(void (**)(void))(**(void **)v14 + 16LL))(*(void *)v14);
    *(void *)this[1].ivars = 0LL;
    uint64_t v14 = this[1].ivars;
  }

  uint64_t v15 = *((void *)v14 + 1);
  if (!v15
    || ((*(void (**)(void))(*(void *)v15 + 16LL))(*((void *)v14 + 1)),
        *((void *)this[1].ivars + 1) = 0LL,
        (uint64_t v14 = this[1].ivars) != 0LL))
  {
    IOFree(v14, 0xB0uLL);
    this[1].ivars = 0LL;
  }

  IOService::free(this);
}

void non-virtual thunk to'XboxHIDDevice::free(XboxHIDDevice *this)
{
}

uint64_t XboxHIDDevice::Start_Impl(XboxHIDDevice *this, IOService *a2)
{
  properties = 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v5 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v70 = 2048;
    uint64_t v71 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Start\n",  registryEntryID,  0x16u);
  }

  uint64_t v6 = OSObject::CopyDispatchQueue( (OSObject *)this,  "Default",  (IODispatchQueue **)(*((void *)this + 11) + 144LL),  0LL);
  if ((_DWORD)v6)
  {
    uint64_t v37 = v6;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v39 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v40 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v39;
    __int16 v70 = 2048;
    uint64_t v71 = v40;
    __int16 v72 = 1024;
    int v73 = v37;
    uint32_t v41 = "[%s 0x%llx] Failed to obtain 'Default' queue. CopyDispatchQueue() returned %{mach.errno}x\n";
LABEL_60:
    uint32_t v62 = 28;
LABEL_66:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v41,  registryEntryID,  v62);
    goto LABEL_33;
  }

  *(void *)(*((void *)this + 11) + 8LL) = OSMetaClassBase::safeMetaCast(a2, gIOUSBHostInterfaceMetaClass);
  uint64_t v7 = *(void *)(*((void *)this + 11) + 8LL);
  if (!v7)
  {
    uint64_t v37 = 3758097084LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v42 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v43 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v42;
    __int16 v70 = 2048;
    uint64_t v71 = v43;
    uint32_t v41 = "[%s 0x%llx] Provider is not a 'IOUSBHostInterface'.\n";
LABEL_65:
    uint32_t v62 = 22;
    goto LABEL_66;
  }

  (*(void (**)(uint64_t))(*(void *)v7 + 8LL))(v7);
  uint64_t v8 = IOUSBHostInterface::CopyDevice( *(IOUSBHostInterface **)(*((void *)this + 11) + 8LL),  *((IOUSBHostDevice ***)this + 11),  0LL);
  if ((_DWORD)v8)
  {
    uint64_t v37 = v8;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v44 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v45 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v44;
    __int16 v70 = 2048;
    uint64_t v71 = v45;
    __int16 v72 = 1024;
    int v73 = v37;
    uint32_t v41 = "[%s 0x%llx] Failed to obtain USBHostDevice.  CopyDevice() returned %x\n";
    goto LABEL_60;
  }

  *(void *)(*((void *)this + 11) + 16LL) = (*(uint64_t (**)(void))(***((void ***)this + 11) + 64LL))(**((void **)this + 11));
  uint64_t v9 = *((void *)this + 11);
  if (!*(void *)(v9 + 16))
  {
    uint64_t v37 = 3758097086LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v46 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v47 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v46;
    __int16 v70 = 2048;
    uint64_t v71 = v47;
    uint32_t v41 = "[%s 0x%llx] Failed to obtain USB device descriptor.\n";
    goto LABEL_65;
  }

  *(void *)(*((void *)this + 11) + 24LL) = (*(uint64_t (**)(void))(**(void **)(v9 + 8) + 56LL))(*(void *)(v9 + 8));
  uint64_t v10 = *((void *)this + 11);
  if (!*(void *)(v10 + 24))
  {
    uint64_t v37 = 3758097086LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    __int16 v48 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v49 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v48;
    __int16 v70 = 2048;
    uint64_t v71 = v49;
    uint32_t v41 = "[%s 0x%llx] Failed to obtain the current USB configuration descriptor.\n";
    goto LABEL_65;
  }

  *(void *)(*((void *)this + 11) + 32LL) = (*(uint64_t (**)(void))(**(void **)(v10 + 8) + 64LL))(*(void *)(v10 + 8));
  if (!*(void *)(*((void *)this + 11) + 32LL))
  {
    uint64_t v37 = 3758097086LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    __int16 v50 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v51 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v50;
    __int16 v70 = 2048;
    uint64_t v71 = v51;
    uint32_t v41 = "[%s 0x%llx] Failed to obtain the USB interface descriptor.\n";
    goto LABEL_65;
  }

  uint64_t v11 = IOService::Start((IOService *)this, a2, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  if ((_DWORD)v11)
  {
    uint64_t v37 = v11;
    goto LABEL_33;
  }

  uint64_t v12 = IOService::CopyProperties((IOService *)this, &properties, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  if ((_DWORD)v12)
  {
    uint64_t v37 = v12;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    __int16 v52 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v53 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v52;
    __int16 v70 = 2048;
    uint64_t v71 = v53;
    __int16 v72 = 1024;
    int v73 = v37;
    uint32_t v41 = "[%s 0x%llx] Failed to obtain HIDDevice properties. CopyProperties() returned %{mach.errno}x\n";
    goto LABEL_60;
  }

  uint8_t speed = 0;
  uint64_t v13 = IOUSBHostPipe::GetSpeed(*(const IOUSBHostPipe **)(*((void *)this + 11) + 48LL), &speed, 0LL);
  if ((_DWORD)v13)
  {
    uint64_t v37 = v13;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v54 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v55 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v54;
    __int16 v70 = 2048;
    uint64_t v71 = v55;
    __int16 v72 = 1024;
    int v73 = v37;
    uint32_t v41 = "[%s 0x%llx] Failed to get inPipe speed. GetSpeed() returned %{mach.errno}x\n";
    goto LABEL_60;
  }

  *(_DWORD *)(*((void *)this + 11) + 80LL) = IOUSBGetEndpointIntervalMicroframes( speed,  *(const IOUSBEndpointDescriptor **)(*((void *)this + 11) + 40LL));
  *(_DWORD *)(*((void *)this + 11) + 84LL) = 125 * *(_DWORD *)(*((void *)this + 11) + 80LL);
  *(_DWORD *)(*((void *)this + 11) + 56LL) = IOUSBGetEndpointMaxPacketSize( speed,  *(const IOUSBEndpointDescriptor **)(*((void *)this + 11) + 40LL));
  uint64_t v14 = (const OSNumber *)(*(uint64_t (**)(XboxHIDDevice *))(*(void *)this + 120LL))(this);
  if (v14
    && (uint64_t v15 = v14,
        uint64_t v16 = OSNumber::unsigned64BitValue(v14),
        ((void (*)(const OSNumber *))v15->release)(v15),
        v16))
  {
    uint64_t v17 = *((void *)this + 11);
    unint64_t v18 = *(unsigned int *)(v17 + 56);
  }

  else
  {
    uint64_t v17 = *((void *)this + 11);
    unint64_t v18 = *(unsigned int *)(v17 + 56);
    if (!(_DWORD)v18)
    {
      uint64_t v37 = 3758097084LL;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v65 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
        uint64_t v66 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136315394;
        *(void *)&registryEntryID[4] = v65;
        __int16 v70 = 2048;
        uint64_t v71 = v66;
        uint32_t v41 = "[%s 0x%llx] Invalid inboundMaxTransferSize.\n";
        goto LABEL_65;
      }

      goto LABEL_33;
    }

    uint64_t v16 = *(unsigned int *)(v17 + 56);
  }

  *(void *)(v17 + 72) = (v16 + (v18 - 1)) / v18 * v18;
  else {
    uint32_t v19 = 8u / *(_DWORD *)(*((void *)this + 11) + 80LL);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v20 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v21 = *(void *)registryEntryID;
    uint64_t v22 = *((void *)this + 11);
    BOOL v23 = *(void *)(v22 + 48) != 0LL;
    int v24 = *(_DWORD *)(v22 + 56);
    uint64_t v25 = *(void *)(v22 + 72);
    int v26 = *(_DWORD *)(v22 + 80);
    LODWORD(v22) = *(_DWORD *)(v22 + 84);
    *(_DWORD *)registryEntryID = 136317186;
    *(void *)&registryEntryID[4] = v20;
    __int16 v70 = 2048;
    uint64_t v71 = v21;
    __int16 v72 = 1024;
    int v73 = v23;
    __int16 v74 = 1024;
    int v75 = v16;
    __int16 v76 = 1024;
    int v77 = v24;
    __int16 v78 = 1024;
    int v79 = v25;
    __int16 v80 = 1024;
    int v81 = v26;
    __int16 v82 = 1024;
    int v83 = v22;
    __int16 v84 = 1024;
    uint32_t v85 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] inPipe:%d inboundMaxTransferSize:%d inMaxPacketSize:%d inBufferSize:%d endpointIntervalMicroframes:%d( %d us) numInBuffs:%d\n",  registryEntryID,  0x40u);
  }

  *(void *)(*((void *)this + 11) + 96LL) = OSArray::withCapacity(v19);
  if (!*(void *)(*((void *)this + 11) + 96LL))
  {
    uint64_t v37 = 3758097085LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v56 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v57 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v56;
    __int16 v70 = 2048;
    uint64_t v71 = v57;
    uint32_t v41 = "[%s 0x%llx] inputRequestActions\n";
    goto LABEL_65;
  }

  uint64_t v27 = (*(uint64_t (**)(XboxHIDDevice *))(*(void *)this + 136LL))(this);
  if ((_DWORD)v27)
  {
    uint64_t v37 = v27;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v58 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v59 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v58;
    __int16 v70 = 2048;
    uint64_t v71 = v59;
    __int16 v72 = 1024;
    int v73 = v37;
    uint32_t v41 = "[%s 0x%llx] setupAsyncReceive:%{mach.errno}x\n";
    goto LABEL_60;
  }

  uint8_t speed = 0;
  uint64_t v28 = IOUSBHostPipe::GetSpeed(*(const IOUSBHostPipe **)(*((void *)this + 11) + 112LL), &speed, 0LL);
  if ((_DWORD)v28)
  {
    uint64_t v37 = v28;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v60 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v61 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v60;
    __int16 v70 = 2048;
    uint64_t v71 = v61;
    __int16 v72 = 1024;
    int v73 = v37;
    uint32_t v41 = "[%s 0x%llx] Failed to get outPipe speed. GetSpeed() returned %{mach.errno}x\n";
    goto LABEL_60;
  }

  *(_DWORD *)(*((void *)this + 11) + 120LL) = IOUSBGetEndpointMaxPacketSize( speed,  *(const IOUSBEndpointDescriptor **)(*((void *)this + 11) + 104LL));
  v29 = (const OSNumber *)(*(uint64_t (**)(XboxHIDDevice *))(*(void *)this + 128LL))(this);
  if (v29
    && (uint64_t v30 = v29,
        uint64_t v31 = OSNumber::unsigned64BitValue(v29),
        ((void (*)(const OSNumber *))v30->release)(v30),
        v31))
  {
    uint64_t v32 = *((void *)this + 11);
  }

  else
  {
    uint64_t v32 = *((void *)this + 11);
    LODWORD(v31) = *(_DWORD *)(v32 + 120);
  }

  *(_DWORD *)(v32 + 124) = v31;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v33 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v34 = *(void *)registryEntryID;
    uint64_t v35 = *((void *)this + 11);
    BOOL v36 = *(void *)(v35 + 112) != 0LL;
    LODWORD(v35) = *(_DWORD *)(v35 + 120);
    *(_DWORD *)registryEntryID = 136316162;
    *(void *)&registryEntryID[4] = v33;
    __int16 v70 = 2048;
    uint64_t v71 = v34;
    __int16 v72 = 1024;
    int v73 = v36;
    __int16 v74 = 1024;
    int v75 = v31;
    __int16 v76 = 1024;
    int v77 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] outPipe:%d outboundMaxTransferSize:%d outMaxPacketSize:%d\n",  registryEntryID,  0x28u);
  }

  *(void *)(*((void *)this + 11) + 128LL) = OSArray::withCapacity(2u);
  if (*(void *)(*((void *)this + 11) + 128LL))
  {
    uint64_t v37 = (*(uint64_t (**)(XboxHIDDevice *))(*(void *)this + 144LL))(this);
    if (!(_DWORD)v37) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

  uint64_t v37 = 3758097086LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v63 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v64 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = v63;
    __int16 v70 = 2048;
    uint64_t v71 = v64;
    uint32_t v41 = "[%s 0x%llx] outputReportActions\n";
    goto LABEL_65;
  }

LABEL_33:
  IOService::Stop((IOService *)this, a2, 0LL);
LABEL_34:
  if (properties) {
    ((void (*)(OSDictionary *))properties->release)(properties);
  }
  return v37;
}

uint64_t XboxHIDDevice::Stop_Impl(IOService *this, IOService *a2)
{
  kern_return_t v7;
  const char *v8;
  uint64_t v9;
  IOService_IVars *ivars;
  uint64_t v11;
  int v12;
  unsigned int *v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  unsigned int *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  unsigned int v22;
  IOService_IVars *v24;
  IODispatchSource *v25;
  uint64_t v26;
  void v28[2];
  uint64_t (*v29)(uint64_t, const OSArray *);
  void *v30;
  void *v31;
  void handler[7];
  _BYTE registryEntryID[24];
  kern_return_t v34;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v5 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    *(_WORD *)&_BYTE registryEntryID[12] = 2048;
    *(void *)&registryEntryID[14] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Stop\n",  registryEntryID,  0x16u);
  }

  *((_BYTE *)this[1].ivars + 168) = 1;
  uint64_t v6 = (IOUSBHostInterface *)*((void *)this[1].ivars + 1);
  if (v6)
  {
    uint64_t v7 = IOUSBHostInterface::Close(v6, this, 0, 0LL);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v9 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = v8;
      *(_WORD *)&_BYTE registryEntryID[12] = 2048;
      *(void *)&registryEntryID[14] = v9;
      *(_WORD *)&registryEntryID[22] = 1024;
      uint64_t v34 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Close interface: 0x%x\n",  registryEntryID,  0x1Cu);
    }
  }

  *(void *)registryEntryID = 0LL;
  *(void *)&registryEntryID[8] = registryEntryID;
  *(void *)&registryEntryID[16] = 0x2000000000LL;
  uint64_t v34 = 0;
  ivars = this[1].ivars;
  uint64_t v11 = *((void *)ivars + 16);
  if (v11)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 72LL))(v11);
    uint64_t v13 = (unsigned int *)(*(void *)&registryEntryID[8] + 24LL);
    do
      uint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 + v12, v13));
    ivars = this[1].ivars;
  }

  uint64_t v15 = *((void *)ivars + 12);
  if (v15)
  {
    uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 72LL))(v15);
    uint64_t v17 = (unsigned int *)(*(void *)&registryEntryID[8] + 24LL);
    do
      unint64_t v18 = __ldaxr(v17);
    while (__stlxr(v18 + v16, v17));
    ivars = this[1].ivars;
  }

  uint32_t v19 = *((void *)ivars + 19);
  v20 = *(void *)&registryEntryID[8];
  if (v19)
  {
    uint64_t v21 = (unsigned int *)(*(void *)&registryEntryID[8] + 24LL);
    do
      uint64_t v22 = __ldaxr(v21);
    while (__stlxr(v22 + 1, v21));
    v20 = *(void *)&registryEntryID[8];
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 1107296256LL;
  handler[2] = ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_37;
  handler[3] = &__block_descriptor_tmp_39;
  handler[4] = registryEntryID;
  handler[5] = this;
  handler[6] = a2;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 1107296256LL;
  v29 = ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_40;
  uint64_t v30 = &__block_descriptor_tmp_43;
  uint64_t v31 = handler;
  if (atomic_load((unsigned int *)(v20 + 24)))
  {
    int v24 = this[1].ivars;
    if (*((void *)v24 + 16))
    {
      ((void (*)(void *))v29)(v28);
      int v24 = this[1].ivars;
    }

    if (*((void *)v24 + 12))
    {
      ((void (*)(void *))v29)(v28);
      int v24 = this[1].ivars;
    }

    uint64_t v25 = (IODispatchSource *)*((void *)v24 + 19);
    if (v25) {
      IODispatchSource::Cancel(v25, handler, 0LL);
    }
    int v26 = 0LL;
  }

  else
  {
    int v26 = IOService::Stop(this, a2, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  }

  _Block_object_dispose(registryEntryID, 8);
  return v26;
}

IOService *___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_37(uint64_t a1)
{
  result = *(IOService **)(a1 + 40);
  uint64_t v3 = (unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  do
  {
    unsigned int v4 = __ldxr(v3);
    BOOL v5 = v4 != 0;
    unsigned int v6 = v4 - 1;
  }

  while (__stxr(v6, v3));
  if (v6 == 0 || !v5) {
    return (IOService *)IOService::Stop(result, *(IOService **)(a1 + 48), (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  }
  return result;
}

void __copy_helper_block_8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_8_32r(uint64_t a1)
{
}

uint64_t ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_40(uint64_t a1, const OSArray *a2)
{
  uint64_t result = ((uint64_t (*)(const OSArray *))a2->getCount)(a2);
  if ((_DWORD)result)
  {
    uint32_t v5 = 0;
    do
    {
      Object = (OSAction *)OSArray::getObject(a2, v5);
      v8[0] = 0LL;
      v8[1] = v8;
      v8[2] = 0x2000000000LL;
      Reference = 0LL;
      Reference = OSAction::GetReference(Object);
      if (Object)
      {
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 1107296256LL;
        v7[2] = ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_2;
        v7[3] = &__block_descriptor_tmp_41;
        v7[4] = *(void *)(a1 + 32);
        v7[5] = v8;
        OSAction::Cancel(Object, v7);
      }

      _Block_object_dispose(v8, 8);
      ++v5;
      uint64_t result = ((uint64_t (*)(const OSArray *))a2->getCount)(a2);
    }

    while (v5 < result);
  }

  return result;
}

uint64_t ___ZN13XboxHIDDevice9Stop_ImplEP9IOService_block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (*v2)
  {
    (*(void (**)(void))(*(void *)*v2 + 16LL))(*v2);
    **(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
    BOOL v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }

  uint64_t v3 = v2[1];
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) + 8LL) = 0LL;
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __copy_helper_block_8_32b40r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_8_32b40r(uint64_t a1)
{
}

void __copy_helper_block_8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_8_32b(uint64_t a1)
{
}

uint64_t XboxHIDDevice::SetPowerState_Impl(IOService *this, uint32_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t v7 = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)v7, 0LL);
    uint64_t v5 = *(void *)v7;
    *(_DWORD *)uint64_t v7 = 136315650;
    *(void *)&v7[4] = ClassName;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    __int16 v10 = 1024;
    uint32_t v11 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Set power state: %x\n",  v7,  0x1Cu);
  }

  return IOService::SetPowerState(this, a2, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
}

uint64_t XboxHIDDevice::handleStart(IOUserHIDDevice *this, IOService *a2)
{
  kern_return_t v6;
  const IOUSBEndpointDescriptor *EndpointDescriptor;
  const IOUSBEndpointDescriptor *v8;
  int v9;
  unsigned __int8 v10;
  int v11;
  const char *v12;
  uint64_t v13;
  int v14;
  int v15;
  IOUserHIDDevice *v16;
  uint64_t v17;
  uint64_t v18;
  IOUSBHostPipe **v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  kern_return_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const IOUSBHostPipe *v33;
  kern_return_t v34;
  kern_return_t v35;
  kern_return_t TimeoutOccurred;
  kern_return_t v37;
  uint64_t result;
  kern_return_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint32_t v43;
  kern_return_t v44;
  BOOL v45;
  const char *v46;
  uint64_t v47;
  kern_return_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  kern_return_t v55;
  const char *v56;
  uint64_t v57;
  kern_return_t v58;
  const char *v59;
  uint64_t v60;
  kern_return_t v61;
  const char *v62;
  uint64_t v63;
  kern_return_t v64;
  const char *v65;
  uint64_t v66;
  int v67;
  int v68;
  uint8_t speed;
  _BYTE registryEntryID[12];
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  kern_return_t v74;
  __int16 v75;
  int v76;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v5 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    uint64_t v71 = 2048;
    __int16 v72 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] ::handleStart()\n",  registryEntryID,  0x16u);
  }

  if (!IOUserHIDDevice::handleStart(this, a2)) {
    goto LABEL_57;
  }
  unsigned int v6 = IOUSBHostInterface::Open(*(IOUSBHostInterface **)(*(void *)&this[1].refcount + 8LL), this, 0, 0LL, 0LL);
  if (v6)
  {
    __int16 v48 = v6;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_57;
    }
    uint64_t v49 = OSMetaClassBase::GetClassName(this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
    __int16 v50 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v49;
    uint64_t v71 = 2048;
    __int16 v72 = v50;
    int v73 = 1024;
    __int16 v74 = v48;
    v42 = "[%s 0x%llx] Failed to open interface: %{mach.errno}x\n";
LABEL_55:
    uint64_t v43 = 28;
LABEL_56:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v42,  registryEntryID,  v43);
    goto LABEL_57;
  }

  EndpointDescriptor = IOUSBGetNextEndpointDescriptor( *(const IOUSBConfigurationDescriptor **)(*(void *)&this[1].refcount + 24LL),  *(const IOUSBInterfaceDescriptor **)(*(void *)&this[1].refcount + 32LL),  0LL);
  if (!EndpointDescriptor)
  {
    __int16 v10 = 0;
    uint64_t v9 = 0;
    LOBYTE(v67) = 0;
    v68 = 0;
LABEL_39:
    uint64_t v28 = *(void *)&this[1].refcount;
    if (*(void *)(v28 + 48) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v29 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v30 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v29;
      uint64_t v71 = 2048;
      __int16 v72 = v30;
      int v73 = 1024;
      __int16 v74 = v10;
      int v75 = 1024;
      __int16 v76 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] found in pipe (addr:%d, type:%d)\n",  registryEntryID,  0x22u);
      uint64_t v28 = *(void *)&this[1].refcount;
    }

    if (*(void *)(v28 + 112) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v32 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v31;
      uint64_t v71 = 2048;
      __int16 v72 = v32;
      int v73 = 1024;
      __int16 v74 = v67;
      int v75 = 1024;
      __int16 v76 = v68;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] found out pipe (addr:%d, type:%d)\n",  registryEntryID,  0x22u);
      uint64_t v28 = *(void *)&this[1].refcount;
    }

    v33 = *(const IOUSBHostPipe **)(v28 + 48);
    if (v33)
    {
      if (*(void *)(v28 + 112))
      {
        uint8_t speed = 0;
        uint64_t v34 = IOUSBHostPipe::GetSpeed(v33, &speed, 0LL);
        if (v34)
        {
          uint64_t v55 = v34;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_57;
          }
          v56 = OSMetaClassBase::GetClassName(this);
          *(void *)registryEntryID = 0LL;
          IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
          uint64_t v57 = *(void *)registryEntryID;
          *(_DWORD *)registryEntryID = 136315650;
          *(void *)&registryEntryID[4] = v56;
          uint64_t v71 = 2048;
          __int16 v72 = v57;
          int v73 = 1024;
          __int16 v74 = v55;
          v42 = "[%s 0x%llx] Failed to get inPipe speed. GetSpeed() returned %{mach.errno}x\n";
        }

        else
        {
          *(_DWORD *)(*(void *)&this[1].refcount + 84LL) = 125
                                                           * IOUSBGetEndpointIntervalMicroframes( speed,  *(const IOUSBEndpointDescriptor **)(*(void *)&this[1].refcount + 40LL));
          uint64_t v35 = IOTimerDispatchSource::Create( *(IODispatchQueue **)(*(void *)&this[1].refcount + 144LL),  (IOTimerDispatchSource **)(*(void *)&this[1].refcount + 152LL));
          if (v35)
          {
            v58 = v35;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_57;
            }
            uint64_t v59 = OSMetaClassBase::GetClassName(this);
            *(void *)registryEntryID = 0LL;
            IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
            v60 = *(void *)registryEntryID;
            *(_DWORD *)registryEntryID = 136315650;
            *(void *)&registryEntryID[4] = v59;
            uint64_t v71 = 2048;
            __int16 v72 = v60;
            int v73 = 1024;
            __int16 v74 = v58;
            v42 = "[%s 0x%llx] IOTimerDispatchSource::Create:%x\n";
          }

          else
          {
            TimeoutOccurred = XboxHIDDevice::CreateActionAsyncReadTimeoutOccurred( this,  8uLL,  (OSAction **)(*(void *)&this[1].refcount + 160LL));
            if (TimeoutOccurred)
            {
              uint64_t v61 = TimeoutOccurred;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_57;
              }
              uint32_t v62 = OSMetaClassBase::GetClassName(this);
              *(void *)registryEntryID = 0LL;
              IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
              v63 = *(void *)registryEntryID;
              *(_DWORD *)registryEntryID = 136315650;
              *(void *)&registryEntryID[4] = v62;
              uint64_t v71 = 2048;
              __int16 v72 = v63;
              int v73 = 1024;
              __int16 v74 = v61;
              v42 = "[%s 0x%llx] CreateActionTimerOccurred:%x\n";
            }

            else
            {
              uint64_t v37 = IOTimerDispatchSource::SetHandler( *(IOTimerDispatchSource **)(*(void *)&this[1].refcount + 152LL),  *(OSAction **)(*(void *)&this[1].refcount + 160LL),  0LL);
              if (!v37) {
                return 1LL;
              }
              uint64_t v64 = v37;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_57;
              }
              v65 = OSMetaClassBase::GetClassName(this);
              *(void *)registryEntryID = 0LL;
              IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
              uint64_t v66 = *(void *)registryEntryID;
              *(_DWORD *)registryEntryID = 136315650;
              *(void *)&registryEntryID[4] = v65;
              uint64_t v71 = 2048;
              __int16 v72 = v66;
              int v73 = 1024;
              __int16 v74 = v64;
              v42 = "[%s 0x%llx] IOTimerDispatchSource::SetHandler:%x\n";
            }
          }
        }

        goto LABEL_55;
      }

      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_57;
      }
      uint64_t v53 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      v54 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v53;
      uint64_t v71 = 2048;
      __int16 v72 = v54;
      v42 = "[%s 0x%llx] missing outPipe\n";
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_57;
      }
      uint64_t v51 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      __int16 v52 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v51;
      uint64_t v71 = 2048;
      __int16 v72 = v52;
      v42 = "[%s 0x%llx] missing inPipe\n";
    }

    uint64_t v43 = 22;
    goto LABEL_56;
  }

  __int16 v8 = EndpointDescriptor;
  v67 = 0;
  v68 = 0;
  uint64_t v9 = 0;
  __int16 v10 = 0;
  while (1)
  {
    uint32_t v11 = IOUSBGetEndpointType(v8);
    if (v11 != 3)
    {
      if (v11 == 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = OSMetaClassBase::GetClassName(this);
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
        uint64_t v13 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136315394;
        *(void *)&registryEntryID[4] = v12;
        uint64_t v71 = 2048;
        __int16 v72 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Unexpected Bulk pipe found but ignored.\n",  registryEntryID,  0x16u);
      }

      goto LABEL_36;
    }

    uint64_t v14 = IOUSBGetEndpointDirection(v8);
    uint64_t v15 = v14;
    uint64_t v16 = this;
    uint64_t v17 = *(void *)&this[1].refcount;
    if (v14 == 1) {
      unint64_t v18 = 48LL;
    }
    else {
      unint64_t v18 = 112LL;
    }
    if (v14 == 1) {
      uint32_t v19 = (IOUSBHostPipe **)(v17 + 48);
    }
    else {
      uint32_t v19 = (IOUSBHostPipe **)(v17 + 112);
    }
    if (v14 == 1) {
      v20 = 40LL;
    }
    else {
      v20 = 104LL;
    }
    uint64_t v21 = *(void *)(v17 + v18);
    if (v21)
    {
      uint64_t v22 = v68;
      if (v15 == 1) {
        uint64_t v22 = v9;
      }
      if (v22 == 3)
      {
        this = v16;
        goto LABEL_36;
      }

      (*(void (**)(uint64_t))(*(void *)v21 + 16LL))(v21);
      *(void *)(v17 + v18) = 0LL;
    }

    BOOL v23 = IOUSBGetEndpointAddress(v8);
    int v24 = v68;
    if (v15 == 1) {
      uint64_t v9 = 3;
    }
    else {
      int v24 = 3;
    }
    if (v15 == 1) {
      __int16 v10 = v23;
    }
    uint64_t v25 = v67;
    if (v15 != 1) {
      uint64_t v25 = v23;
    }
    v67 = v25;
    v68 = v24;
    *(void *)(v17 + v20) = v8;
    this = v16;
    int v26 = IOUSBHostInterface::CopyPipe(*(IOUSBHostInterface **)(*(void *)&v16[1].refcount + 8LL), v23, v19, 0LL);
    if (v26) {
      break;
    }
    uint64_t v27 = *(void *)&v16[1].refcount;
    if (*(void *)(v27 + 48) && *(void *)(v27 + 112)) {
      goto LABEL_39;
    }
LABEL_36:
    __int16 v8 = IOUSBGetNextEndpointDescriptor( *(const IOUSBConfigurationDescriptor **)(*(void *)&this[1].refcount + 24LL),  *(const IOUSBInterfaceDescriptor **)(*(void *)&this[1].refcount + 32LL),  (const IOUSBDescriptorHeader *)v8);
    if (!v8) {
      goto LABEL_39;
    }
  }

  v39 = v26;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = OSMetaClassBase::GetClassName(v16);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID(v16, (uint64_t *)registryEntryID, 0LL);
    uint32_t v41 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v40;
    uint64_t v71 = 2048;
    __int16 v72 = v41;
    int v73 = 1024;
    __int16 v74 = v39;
    v42 = "[%s 0x%llx] CopyPipe:%x\n";
    goto LABEL_55;
  }

LABEL_57:
  v44 = IOUSBHostInterface::Close(*(IOUSBHostInterface **)(*(void *)&this[1].refcount + 8LL), this, 0, 0LL);
  uint64_t v45 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v45)
  {
    v46 = OSMetaClassBase::GetClassName(this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v47 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v46;
    uint64_t v71 = 2048;
    __int16 v72 = v47;
    int v73 = 1024;
    __int16 v74 = v44;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Close interface: 0x%x\n",  registryEntryID,  0x1Cu);
    return 0LL;
  }

  return result;
}

uint64_t non-virtual thunk to'XboxHIDDevice::handleStart(XboxHIDDevice *this, IOService *a2)
{
  return XboxHIDDevice::handleStart((IOUserHIDDevice *)((char *)this - 64), a2);
}

OSDictionary *XboxHIDDevice::newDeviceDescription(XboxHIDDevice *this)
{
  kern_return_t v5;
  OSObject *Value;
  OSStringPtr v7;
  OSStringPtr v8;
  OSStringPtr v9;
  OSStringPtr v10;
  OSStringPtr v11;
  OSStringPtr v12;
  const char *ClassName;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  kern_return_t v19;
  const char *v20;
  uint64_t v21;
  OSDictionary *properties;
  _BYTE registryEntryID[12];
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  kern_return_t v27;
  properties = 0LL;
  BOOL v2 = (const IOUSBDeviceDescriptor *)(*(uint64_t (**)(void))(***((void ***)this + 11) + 64LL))(**((void **)this + 11));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v15 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = ClassName;
      int v24 = 2048;
      uint64_t v25 = v15;
      uint64_t v16 = "[%s 0x%llx] CopyDeviceDescriptor\n";
LABEL_21:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v16,  registryEntryID,  0x16u);
    }

LABEL_22:
    unsigned int v4 = 0LL;
    goto LABEL_12;
  }

  OSDictionaryPtr v3 = OSDictionary::withCapacity(0xAu);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
      unint64_t v18 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v17;
      int v24 = 2048;
      uint64_t v25 = v18;
      uint64_t v16 = "[%s 0x%llx] OSDictionaryCreate\n";
      goto LABEL_21;
    }

    goto LABEL_22;
  }

  unsigned int v4 = v3;
  uint64_t v5 = IOService::CopyProperties(*(IOService **)(*((void *)this + 11) + 8LL), &properties, 0LL);
  if (v5)
  {
    uint32_t v19 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v20 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v21 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = v20;
      int v24 = 2048;
      uint64_t v25 = v21;
      int v26 = 1024;
      uint64_t v27 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] CopyProperties:%x\n",  registryEntryID,  0x1Cu);
    }
  }

  else
  {
    OSDictionarySetUInt64Value(v4, "ReportInterval", *(unsigned int *)(*((void *)this + 11) + 84LL));
    OSDictionarySetUInt64Value(v4, "VendorID", v2->idVendor);
    OSDictionarySetUInt64Value(v4, "ProductID", v2->idProduct);
    OSDictionarySetStringValue(v4, "Transport", "USB");
    OSDictionarySetUInt64Value(v4, "VersionNumber", v2->bcdDevice);
    OSDictionarySetUInt64Value(v4, "CountryCode", 0LL);
    OSObjectPtr Value = OSDictionaryGetValue(properties, "locationID");
    if (Value) {
      OSDictionarySetValue(v4, "LocationID", Value);
    }
    uint64_t v7 = XboxHIDDevice::copyStringAtIndex((IOService *)this, v2->iManufacturer, 1033);
    if (v7)
    {
      __int16 v8 = v7;
      OSDictionarySetValue(v4, "Manufacturer", v7);
      ((void (*)(OSStringPtr))v8->release)(v8);
    }

    uint64_t v9 = XboxHIDDevice::copyStringAtIndex((IOService *)this, v2->iProduct, 1033);
    if (v9)
    {
      __int16 v10 = v9;
      OSDictionarySetValue(v4, "Product", v9);
      ((void (*)(OSStringPtr))v10->release)(v10);
    }

    uint32_t v11 = XboxHIDDevice::copyStringAtIndex((IOService *)this, v2->iSerialNumber, 1033);
    if (v11)
    {
      uint64_t v12 = v11;
      OSDictionarySetValue(v4, "SerialNumber", v11);
      ((void (*)(OSStringPtr))v12->release)(v12);
    }
  }

LABEL_12:
  if (properties)
  {
    ((void (*)(OSDictionary *))properties->release)(properties);
    properties = 0LL;
  }

  if (v2) {
    IOUSBHostFreeDescriptor(v2);
  }
  return v4;
}

OSStringPtr XboxHIDDevice::copyStringAtIndex(IOService *this, int a2, int a3)
{
  if (!a2) {
    return 0LL;
  }
  unsigned int v6 = (const IOUSBStringDescriptor *)(*(uint64_t (**)(void))(**((void **)this[1].ivars + 1) + 72LL))(*((void *)this[1].ivars + 1));
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)uint32_t v19 = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)v19, 0LL);
      uint64_t v17 = *(void *)v19;
      *(_DWORD *)uint32_t v19 = 136315906;
      *(void *)&v19[4] = ClassName;
      __int16 v20 = 2048;
      uint64_t v21 = v17;
      __int16 v22 = 1024;
      int v23 = a2;
      __int16 v24 = 1024;
      int v25 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] CopyStringDescriptor(%d,%d)\n",  v19,  0x22u);
    }

    return 0LL;
  }

  uint64_t v7 = v6;
  uint64_t bLength = v6->bLength;
  if ((bLength & 0xFE) == 2)
  {
    size_t v9 = 0LL;
  }

  else
  {
    int v10 = 0;
    size_t v9 = 0LL;
    unint64_t v11 = (unint64_t)(bLength - 2) >> 1;
    unsigned int v12 = 1;
    do
    {
      __int16 v13 = *(_WORD *)&v6->bString[v10];
      if (!v13) {
        break;
      }
      v19[v9] = v13;
      size_t v9 = v12;
      BOOL v14 = v11 > v12++;
      v10 += 2;
    }

    while (v14);
  }

  v19[v9] = 0;
  OSStringPtr v15 = OSStringCreate(v19, v9);
  IOUSBHostFreeDescriptor(v7);
  return v15;
}

OSDictionary *non-virtual thunk to'XboxHIDDevice::newDeviceDescription(XboxHIDDevice *this)
{
  return XboxHIDDevice::newDeviceDescription((XboxHIDDevice *)((char *)this - 64));
}

OSMetaClassBase *XboxHIDDevice::newMaxInboundTransferSize(IOService *this)
{
  kern_return_t v2;
  OSObjectPtr Value;
  OSMetaClassBase *v4;
  OSMetaClassBase *v5;
  kern_return_t v7;
  const char *ClassName;
  uint64_t v9;
  OSDictionary *properties;
  _BYTE registryEntryID[12];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  kern_return_t v15;
  properties = 0LL;
  BOOL v2 = IOService::CopyProperties(this, &properties, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  if (v2)
  {
    uint64_t v7 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      size_t v9 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = ClassName;
      unsigned int v12 = 2048;
      __int16 v13 = v9;
      BOOL v14 = 1024;
      OSStringPtr v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Failed to obtain HIDDevice properties. CopyProperties() returned %{mach.errno}x\n",  registryEntryID,  0x1Cu);
    }

    uint64_t v5 = 0LL;
  }

  else
  {
    OSObjectPtr Value = OSDictionaryGetValue(properties, "MaxInputReportSize");
    unsigned int v4 = OSMetaClassBase::safeMetaCast(Value, gOSNumberMetaClass);
    uint64_t v5 = v4;
    if (v4) {
      ((void (*)(OSMetaClassBase *))v4->retain)(v4);
    }
  }

  if (properties) {
    ((void (*)(OSDictionary *))properties->release)(properties);
  }
  return v5;
}

OSMetaClassBase *non-virtual thunk to'XboxHIDDevice::newMaxInboundTransferSize(XboxHIDDevice *this)
{
  return XboxHIDDevice::newMaxInboundTransferSize((IOService *)((char *)this - 80));
}

OSMetaClassBase *XboxHIDDevice::newMaxOutboundTransferSize(IOService *this)
{
  kern_return_t v2;
  OSObjectPtr Value;
  OSMetaClassBase *v4;
  OSObjectPtr v5;
  OSMetaClassBase *v6;
  BOOL v7;
  OSMetaClassBase *v8;
  BOOL v9;
  kern_return_t v11;
  const char *ClassName;
  uint64_t v13;
  OSDictionary *properties;
  _BYTE registryEntryID[12];
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  kern_return_t v19;
  properties = 0LL;
  BOOL v2 = IOService::CopyProperties(this, &properties, (OSDispatchMethod)&IOUserHIDDevice::_Dispatch);
  if (v2)
  {
    unint64_t v11 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      __int16 v13 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = ClassName;
      uint64_t v16 = 2048;
      uint64_t v17 = v13;
      unint64_t v18 = 1024;
      uint32_t v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Failed to obtain HIDDevice properties. CopyProperties() returned %{mach.errno}x\n",  registryEntryID,  0x1Cu);
    }

    unsigned int v4 = 0LL;
  }

  else
  {
    OSObjectPtr Value = OSDictionaryGetValue(properties, "MaxOutputReportSize");
    unsigned int v4 = OSMetaClassBase::safeMetaCast(Value, gOSNumberMetaClass);
    uint64_t v5 = OSDictionaryGetValue(properties, "MaxFeatureReportSize");
    unsigned int v6 = OSMetaClassBase::safeMetaCast(v5, gOSNumberMetaClass);
    if (v4) {
      uint64_t v7 = v6 == 0LL;
    }
    else {
      uint64_t v7 = 0;
    }
    if (v7 || ((__int16 v8 = v6, !v4) ? (v9 = v6 == 0LL) : (v9 = 1), v9))
    {
      ((void (*)(OSMetaClassBase *))v4->retain)(v4);
    }

    else
    {
      ((void (*)(OSMetaClassBase *))v6->retain)(v6);
      unsigned int v4 = v8;
    }
  }

  if (properties) {
    ((void (*)(OSDictionary *))properties->release)(properties);
  }
  return v4;
}

OSMetaClassBase *non-virtual thunk to'XboxHIDDevice::newMaxOutboundTransferSize(XboxHIDDevice *this)
{
  return XboxHIDDevice::newMaxOutboundTransferSize((IOService *)((char *)this - 80));
}

uint64_t XboxHIDDevice::setupAsyncReceive(IOService *this)
{
  anObject = 0LL;
  uint64_t v22 = 0LL;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v3 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    __int16 v24 = 2048;
    uint64_t v25 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] ::setupAsyncReceive()\n",  registryEntryID,  0x16u);
  }

  while (1)
  {
    unsigned int v4 = (*(uint64_t (**)(void))(**((void **)this[1].ivars + 12) + 72LL))(*((void *)this[1].ivars + 12));
    if (v4 >= (*(unsigned int (**)(void))(**((void **)this[1].ivars + 12) + 80LL))(*((void *)this[1].ivars + 12))
      && (*(unsigned int (**)(void))(**((void **)this[1].ivars + 12) + 72LL))(*((void *)this[1].ivars
                                                                                             + 12)))
    {
      return 0LL;
    }

    uint64_t v5 = (*(uint64_t (**)(void, uint64_t, void, uint64_t *))(**((void **)this[1].ivars + 1) + 88LL))( *((void *)this[1].ivars + 1),  1LL,  *((void *)this[1].ivars + 9),  &v22);
    if ((_DWORD)v5)
    {
      uint64_t v12 = v5;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return v12;
      }
      BOOL v14 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v15 = *(void *)registryEntryID;
      uint64_t v16 = (OSMetaClassBase *)*((void *)this[1].ivars + 9);
      *(_DWORD *)registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v14;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 1024;
      int v29 = v12;
      uint64_t v17 = "[%s 0x%llx] Could not create input buffer. CreateIOBuffer(%{bytes}llu) failed: %{mach.errno}d\n";
      uint32_t v18 = 38;
      goto LABEL_17;
    }

    uint64_t ActionCompleteAsyncReceive = XboxHIDDevice::CreateActionCompleteAsyncReceive(this, 0x18uLL, (OSAction **)&anObject);
    if ((_DWORD)ActionCompleteAsyncReceive) {
      break;
    }
    uint64_t v7 = v22;
    *((void *)OSAction::GetReference((OSAction *)anObject) + 1) = v7;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v9 = *(void *)registryEntryID;
      int v10 = anObject;
      int v11 = (*(uint64_t (**)(void))(**((void **)this[1].ivars + 12) + 72LL))(*((void *)this[1].ivars + 12));
      *(_DWORD *)registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v8;
      __int16 v24 = 2048;
      uint64_t v25 = v9;
      __int16 v26 = 2048;
      uint64_t v27 = v10;
      __int16 v28 = 1024;
      int v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Add element %p to input action array: %u\n",  registryEntryID,  0x26u);
    }

    OSArray::setObject(*((OSArray **)this[1].ivars + 12), anObject);
    if (anObject)
    {
      ((void (*)(OSMetaClassBase *))anObject->release)(anObject);
      anObject = 0LL;
    }
  }

  uint64_t v12 = ActionCompleteAsyncReceive;
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
    return v12;
  }
  uint32_t v19 = OSMetaClassBase::GetClassName(this);
  *(void *)registryEntryID = 0LL;
  IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
  uint64_t v20 = *(void *)registryEntryID;
  *(_DWORD *)registryEntryID = 136315650;
  *(void *)&registryEntryID[4] = v19;
  __int16 v24 = 2048;
  uint64_t v25 = v20;
  __int16 v26 = 1024;
  LODWORD(v27) = v12;
  uint64_t v17 = "[%s 0x%llx] CreateActionCompleteInputReport:%x\n";
  uint32_t v18 = 28;
LABEL_17:
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v17, registryEntryID, v18);
  return v12;
}

uint64_t non-virtual thunk to'XboxHIDDevice::setupAsyncReceive(XboxHIDDevice *this)
{
  return XboxHIDDevice::setupAsyncReceive((IOService *)((char *)this - 80));
}

uint64_t XboxHIDDevice::scheduleAsyncReceive(IOService *this)
{
  kern_return_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  _BYTE registryEntryID[12];
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v3 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315394;
    *(void *)&registryEntryID[4] = ClassName;
    uint64_t v20 = 2048;
    uint64_t v21 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] ::scheduleAsyncReceive()\n",  registryEntryID,  0x16u);
  }

  ivars = this[1].ivars;
  if (!*((_BYTE *)ivars + 168))
  {
    uint64_t v5 = *((void *)ivars + 12);
    if (v5)
    {
      if (!(*(unsigned int (**)(uint64_t))(*(void *)v5 + 72LL))(v5))
      {
        unsigned int v7 = 0;
        char v8 = 1;
        goto LABEL_19;
      }

      uint32_t v6 = 0;
      unsigned int v7 = 0;
      char v8 = 1;
      while (1)
      {
        Object = OSArray::getObject(*((const OSArray **)this[1].ivars + 12), v6);
        int v10 = (OSAction *)OSMetaClassBase::safeMetaCast(Object, gOSActionMetaClass);
        if (!v10)
        {
          unsigned int v7 = -536870206;
          goto LABEL_19;
        }

        int v11 = v10;
        Reference = OSAction::GetReference(v10);
        if (!*((_BYTE *)Reference + 16)) {
          break;
        }
LABEL_16:
      }

      __int16 v13 = (IOMemoryDescriptor **)Reference;
      unsigned int v7 = IOUSBHostPipe::AsyncIO( *((IOUSBHostPipe **)this[1].ivars + 6),  *((IOMemoryDescriptor **)Reference + 1),  *((_DWORD *)this[1].ivars + 18),  v11,  0,  0LL);
      if (v7 == -536850432)
      {
        BOOL v14 = IOUSBHostPipe::ClearStall(*((IOUSBHostPipe **)this[1].ivars + 6), 0, 0LL);
        if (v14)
        {
          unsigned int v7 = v14;
LABEL_14:
          char v8 = 0;
          goto LABEL_16;
        }

        unsigned int v7 = IOUSBHostPipe::AsyncIO( *((IOUSBHostPipe **)this[1].ivars + 6),  v13[1],  *((_DWORD *)this[1].ivars + 18),  v11,  0,  0LL);
      }

      if (!v7)
      {
        *((_BYTE *)v13 + 16) = 1;
        goto LABEL_16;
      }

      goto LABEL_14;
    }
  }

  char v8 = 1;
  unsigned int v7 = -536870185;
LABEL_19:
  if ((v7 != 0) | v8 & 1) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = 3758097084LL;
  }
  if ((_DWORD)v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = OSMetaClassBase::GetClassName(this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v17 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = v16;
    uint64_t v20 = 2048;
    uint64_t v21 = v17;
    uint64_t v22 = 1024;
    int v23 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] scheduleAsyncReceive:0x%x\n",  registryEntryID,  0x1Cu);
  }

  return v15;
}

uint64_t non-virtual thunk to'XboxHIDDevice::scheduleAsyncReceive(XboxHIDDevice *this)
{
  return XboxHIDDevice::scheduleAsyncReceive((IOService *)((char *)this - 80));
}

void XboxHIDDevice::scheduleAsyncRecieveRetry(IOService *this, kern_return_t a2)
{
  kern_return_t v15;
  kern_return_t v16;
  const char *v17;
  uint64_t v18;
  _BYTE v19[12];
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  kern_return_t v23;
  __int16 v24;
  BOOL v25;
  __int16 v26;
  unint64_t v27;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint32_t v19 = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)v19, 0LL);
    uint64_t v5 = *(void *)v19;
    *(_DWORD *)uint32_t v19 = 136315650;
    *(void *)&v19[4] = ClassName;
    uint64_t v20 = 2048;
    uint64_t v21 = v5;
    uint64_t v22 = 1024;
    int v23 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] ::scheduleAsyncRecieveRetry(%x)\n",  v19,  0x1Cu);
  }

  ivars = this[1].ivars;
  if (!*((_BYTE *)ivars + 168))
  {
    int v7 = *((_DWORD *)ivars + 22);
    if (v7)
    {
      if (a2 == -536870165)
      {
        uint64_t v8 = (1000 * *((_DWORD *)ivars + 21));
LABEL_12:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = OSMetaClassBase::GetClassName(this);
          *(void *)uint32_t v19 = 0LL;
          IOService::GetRegistryEntryID(this, (uint64_t *)v19, 0LL);
          uint64_t v12 = *(void *)v19;
          int v13 = *((_DWORD *)this[1].ivars + 22);
          *(_DWORD *)uint32_t v19 = 136316162;
          *(void *)&v19[4] = v11;
          uint64_t v20 = 2048;
          uint64_t v21 = v12;
          uint64_t v22 = 1024;
          int v23 = a2;
          __int16 v24 = 1024;
          uint64_t v25 = v13;
          __int16 v26 = 2048;
          uint64_t v27 = v8 / 0xF4240uLL;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Schedule retry reason:0x%x count:%d deadline:%llums\n",  v19,  0x2Cu);
        }

        __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        uint64_t v15 = IOTimerDispatchSource::WakeAtTime( *((IOTimerDispatchSource **)this[1].ivars + 19),  0x88uLL,  v14 + v8,  0LL,  0LL);
        if (v15)
        {
          uint64_t v16 = v15;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = OSMetaClassBase::GetClassName(this);
            *(void *)uint32_t v19 = 0LL;
            IOService::GetRegistryEntryID(this, (uint64_t *)v19, 0LL);
            uint32_t v18 = *(void *)v19;
            *(_DWORD *)uint32_t v19 = 136315650;
            *(void *)&v19[4] = v17;
            uint64_t v20 = 2048;
            uint64_t v21 = v18;
            uint64_t v22 = 1024;
            int v23 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] WakeAtTime:0x%x\n",  v19,  0x1Cu);
          }
        }

        return;
      }

LABEL_11:
      *((_DWORD *)ivars + 22) = v7 - 1;
      uint64_t v8 = 50000000LL;
      goto LABEL_12;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = OSMetaClassBase::GetClassName(this);
      *(void *)uint32_t v19 = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)v19, 0LL);
      uint64_t v10 = *(void *)v19;
      *(_DWORD *)uint32_t v19 = 136315906;
      *(void *)&v19[4] = v9;
      uint64_t v20 = 2048;
      uint64_t v21 = v10;
      uint64_t v22 = 1024;
      int v23 = a2;
      __int16 v24 = 1024;
      uint64_t v25 = a2 != -536870165;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Retries exhausted, reason:0x%x, wantsReset:%d\n\n",  v19,  0x22u);
    }

    if (a2 != -536870165)
    {
      XboxHIDDevice::reset((XboxHIDDevice *)this);
      *((_DWORD *)this[1].ivars + 22) = 10;
      ivars = this[1].ivars;
      int v7 = *((_DWORD *)ivars + 22);
      goto LABEL_11;
    }
  }
}

void XboxHIDDevice::reset(XboxHIDDevice *this)
{
  kern_return_t v4;
  kern_return_t v5;
  const char *v6;
  uint64_t v7;
  _BYTE v8[12];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  kern_return_t v12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
    *(void *)uint64_t v8 = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)v8, 0LL);
    uint64_t v3 = *(void *)v8;
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)&v8[4] = ClassName;
    uint64_t v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] USB Device Reset\n",  v8,  0x16u);
  }

  unsigned int v4 = IOUSBHostDevice::Reset(**((IOUSBHostDevice ***)this + 11), 0LL);
  if (v4)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v6 = OSMetaClassBase::GetClassName((OSMetaClassBase *)this);
      *(void *)uint64_t v8 = 0LL;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)v8, 0LL);
      int v7 = *(void *)v8;
      *(_DWORD *)uint64_t v8 = 136315650;
      *(void *)&v8[4] = v6;
      uint64_t v9 = 2048;
      uint64_t v10 = v7;
      int v11 = 1024;
      uint64_t v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Reset:0x%x\n",  v8,  0x1Cu);
    }
  }

void non-virtual thunk to'XboxHIDDevice::scheduleAsyncRecieveRetry(XboxHIDDevice *this, kern_return_t a2)
{
}

void XboxHIDDevice::cancelAsyncRecieveRetry(IOService *this)
{
  kern_return_t v4;
  kern_return_t v5;
  const char *v6;
  uint64_t v7;
  _BYTE v8[12];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  kern_return_t v12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t v8 = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)v8, 0LL);
    uint64_t v3 = *(void *)v8;
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)&v8[4] = ClassName;
    uint64_t v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] ::cancelAsyncRecieveRetry()\n",  v8,  0x16u);
  }

  unsigned int v4 = IOTimerDispatchSource::WakeAtTime( *((IOTimerDispatchSource **)this[1].ivars + 19),  0LL,  0xFFFFFFFFFFFFFFFFLL,  0LL,  0LL);
  if (v4)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v6 = OSMetaClassBase::GetClassName(this);
      *(void *)uint64_t v8 = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)v8, 0LL);
      int v7 = *(void *)v8;
      *(_DWORD *)uint64_t v8 = 136315650;
      *(void *)&v8[4] = v6;
      uint64_t v9 = 2048;
      uint64_t v10 = v7;
      int v11 = 1024;
      uint64_t v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] WakeAtTime:0x%x\n",  v8,  0x1Cu);
    }
  }

  *((_DWORD *)this[1].ivars + 22) = 10;
}

void non-virtual thunk to'XboxHIDDevice::cancelAsyncRecieveRetry(XboxHIDDevice *this)
{
}

uint64_t XboxHIDDevice::AsyncReadTimeoutOccurred_Impl(IOService *this, OSAction *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)int v7 = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)v7, 0LL);
    uint64_t v4 = *(void *)v7;
    int v5 = *((_DWORD *)this[1].ivars + 22);
    *(_DWORD *)int v7 = 136315650;
    *(void *)&v7[4] = ClassName;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] TimerOccurred retry:%d\n",  v7,  0x1Cu);
  }

  IOTimerDispatchSource::WakeAtTime( *((IOTimerDispatchSource **)this[1].ivars + 19),  0LL,  0xFFFFFFFFFFFFFFFFLL,  0LL,  0LL);
  uint64_t result = ((uint64_t (*)(IOService *))this->OSObject::OSMetaClassBase::__vftable[2].Dispatch)(this);
  if ((_DWORD)result) {
    return ((uint64_t (*)(IOService *, uint64_t))this->OSObject::OSMetaClassBase::__vftable[2].init)( this,  result);
  }
  return result;
}

void XboxHIDDevice::CompleteAsyncReceive_Impl( IOService *this, OSAction *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint32_t v19 = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)v19, 0LL);
    uint64_t v11 = *(void *)v19;
    *(_DWORD *)uint32_t v19 = 136315650;
    *(void *)&v19[4] = ClassName;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    __int16 v22 = 1024;
    int v23 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] ::CompleteAsyncReceive(%x)\n",  v19,  0x1Cu);
  }

  Reference = OSAction::GetReference(a2);
  Reference[16] = 0;
  if ((_DWORD)a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = OSMetaClassBase::GetClassName(this);
      *(void *)uint32_t v19 = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)v19, 0LL);
      uint64_t v14 = *(void *)v19;
      *(_DWORD *)uint32_t v19 = 136315650;
      *(void *)&v19[4] = v13;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      __int16 v22 = 1024;
      int v23 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] CompleteInReport:0x%x\n",  v19,  0x1Cu);
    }

    if (*((_BYTE *)this[1].ivars + 168)) {
      return;
    }
LABEL_14:
    ((void (*)(IOService *, uint64_t))this->OSObject::OSMetaClassBase::__vftable[2].init)(this, a3);
    return;
  }

  if (!*((_BYTE *)this[1].ivars + 168))
  {
    uint64_t v15 = Reference;
    ((void (*)(IOService *))this->OSObject::OSMetaClassBase::__vftable[2].free)(this);
    if (*((void *)this[1].ivars + 9) >= (unint64_t)a4)
    {
      ((void (*)(IOService *, uint64_t, void, uint64_t))this->OSObject::OSMetaClassBase::__vftable[2].getMetaClass)( this,  a5,  *((void *)v15 + 1),  a4);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = OSMetaClassBase::GetClassName(this);
      *(void *)uint32_t v19 = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)v19, 0LL);
      uint64_t v17 = *(void *)v19;
      uint64_t v18 = *((void *)this[1].ivars + 9);
      *(_DWORD *)uint32_t v19 = 136315906;
      *(void *)&v19[4] = v16;
      __int16 v20 = 2048;
      uint64_t v21 = v17;
      __int16 v22 = 1024;
      int v23 = a4;
      __int16 v24 = 1024;
      int v25 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] CompleteAsyncReceive actualByteCount:%d inBufferSize:%d\n",  v19,  0x22u);
    }

    a3 = ((uint64_t (*)(IOService *))this->OSObject::OSMetaClassBase::__vftable[2].Dispatch)(this);
    if ((_DWORD)a3) {
      goto LABEL_14;
    }
  }

void XboxHIDDevice::CompleteAsyncSend_Impl(IOHIDDevice *this, OSAction *a2, IOReturn a3, uint32_t a4)
{
  kern_return_t v14;
  kern_return_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  OSObjectInterface_vtbl *v20;
  unint64_t free_low;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint32_t bytesTransferred;
  uint64_t returnLength;
  _BYTE registryEntryID[12];
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  IOReturn v32;
  __int16 v33;
  OSAction *v34;
  Reference = OSAction::GetReference(a2);
  uint64_t v9 = *(OSAction **)Reference;
  __int16 v10 = (IOMemoryDescriptor *)*((void *)Reference + 1);
  returnLength = 0LL;
  bytesTransferred = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)registryEntryID = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
    uint64_t v12 = *(void *)registryEntryID;
    *(_DWORD *)registryEntryID = 136315650;
    *(void *)&registryEntryID[4] = ClassName;
    int v29 = 2048;
    uint64_t v30 = v12;
    uint64_t v31 = 1024;
    uint64_t v32 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] ::CompleteAsyncSend(%x)\n",  registryEntryID,  0x1Cu);
  }

  if (v10) {
    BOOL v13 = v9 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      int v23 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = v22;
      int v29 = 2048;
      uint64_t v30 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] ComleteOutputReport: Missing completion info, cannot complete callback.\n",  registryEntryID,  0x16u);
    }
  }

  else
  {
    if (a3 == -536850432)
    {
      uint64_t v14 = IOUSBHostPipe::ClearStall( (IOUSBHostPipe *)this[1].IOService::OSObject::OSObjectInterface::__vftable[7].init,  1,  0LL);
      if (v14)
      {
        uint64_t v15 = v14;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = OSMetaClassBase::GetClassName(this);
          *(void *)registryEntryID = 0LL;
          IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
          uint64_t v17 = *(void *)registryEntryID;
          *(_DWORD *)registryEntryID = 136315650;
          *(void *)&registryEntryID[4] = v16;
          int v29 = 2048;
          uint64_t v30 = v17;
          uint64_t v31 = 1024;
          uint64_t v32 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Could not clear stall: 0x%x\n",  registryEntryID,  0x1Cu);
        }
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      uint32_t v19 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315906;
      *(void *)&registryEntryID[4] = v18;
      int v29 = 2048;
      uint64_t v30 = v19;
      uint64_t v31 = 1024;
      uint64_t v32 = a3;
      v33 = 2048;
      uint64_t v34 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] CompleteAsyncSend:0x%x %p\n",  registryEntryID,  0x26u);
    }

    if (a3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = OSMetaClassBase::GetClassName(this);
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
        int v25 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136315650;
        *(void *)&registryEntryID[4] = v24;
        int v29 = 2048;
        uint64_t v30 = v25;
        uint64_t v31 = 1024;
        uint64_t v32 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] CompleteAsyncSend:0x%x\n",  registryEntryID,  0x1Cu);
      }
    }

    else
    {
      IOMemoryDescriptor::GetLength(v10, &returnLength);
      __int16 v20 = this[1].IOService::OSObject::OSObjectInterface::__vftable;
      free_low = LODWORD(v20[7].free);
      if (returnLength != free_low && !(returnLength % free_low) && returnLength != HIDWORD(v20[7].free)) {
        IOUSBHostPipe::IO((IOUSBHostPipe *)v20[7].init, (IOMemoryDescriptor *)v20[8].free, 0, &bytesTransferred, 0, 0LL);
      }
    }

    IOHIDDevice::CompleteReport(this, v9, a3, a4, 0LL);
  }

  XboxHIDDevice::returnAction(this, a2);
}

void XboxHIDDevice::returnAction(IOService *this, OSAction *a2)
{
  if (a2)
  {
    Reference = OSAction::GetReference(a2);
    if (*Reference)
    {
      (*(void (**)(void))(*(void *)*Reference + 16LL))(*Reference);
      void *Reference = 0LL;
    }

    uint64_t v5 = Reference[1];
    if (v5)
    {
      (*(void (**)(uint64_t))(*(void *)v5 + 16LL))(v5);
      Reference[1] = 0LL;
    }

    *((_BYTE *)Reference + 16) = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)__int16 v8 = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)v8, 0LL);
      uint64_t v7 = *(void *)v8;
      *(_DWORD *)__int16 v8 = 136315650;
      *(void *)&v8[4] = ClassName;
      __int16 v9 = 2048;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Return action: %p\n",  v8,  0x20u);
    }
  }

OSAction *XboxHIDDevice::getAsyncSendAction(IOService *this)
{
  uint64_t v2 = *((void *)this[1].ivars + 16);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v16 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = ClassName;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      uint64_t v17 = "[%s 0x%llx] getAsyncSendAction\n";
      uint32_t v18 = 22;
LABEL_22:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v17,  registryEntryID,  v18);
      return 0LL;
    }

    return 0LL;
  }

  if (!(*(unsigned int (**)(uint64_t))(*(void *)v2 + 72LL))(v2))
  {
LABEL_6:
    __int16 v24 = 0LL;
    goto LABEL_7;
  }

  uint32_t v3 = 0;
  while (1)
  {
    Object = (OSAction *)OSArray::getObject(*((const OSArray **)this[1].ivars + 16), v3);
    Reference = OSAction::GetReference(Object);
    if (!Reference[16]) {
      break;
    }
  }

  __int16 v24 = Object;
  Reference[16] = 1;
  if (!Object)
  {
LABEL_7:
    int v6 = XboxHIDDevice::CreateActionCompleteAsyncSend(this, 0x18uLL, &v24);
    if (v6)
    {
      int v19 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = OSMetaClassBase::GetClassName(this);
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
        uint64_t v21 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136315650;
        *(void *)&registryEntryID[4] = v20;
        __int16 v26 = 2048;
        uint64_t v27 = v21;
        __int16 v28 = 1024;
        LODWORD(v29) = v19;
        uint64_t v17 = "[%s 0x%llx] CreateActionCompleteAsyncSend:%x\n";
LABEL_21:
        uint32_t v18 = 28;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v7 = OSAction::GetReference(v24);
      *uint64_t v7 = 0LL;
      v7[1] = 0LL;
      *((_BYTE *)v7 + 16) = 1;
      BOOL v8 = OSArray::setObject(*((OSArray **)this[1].ivars + 16), v24);
      BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v9)
        {
          uint64_t v10 = OSMetaClassBase::GetClassName(this);
          *(void *)registryEntryID = 0LL;
          IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
          uint64_t v12 = v24;
          uint64_t v11 = *(void *)registryEntryID;
          int v13 = (*(uint64_t (**)(void))(**((void **)this[1].ivars + 16) + 72LL))(*((void *)this[1].ivars
                                                                                               + 16));
          *(_DWORD *)registryEntryID = 136315906;
          *(void *)&registryEntryID[4] = v10;
          __int16 v26 = 2048;
          uint64_t v27 = v11;
          __int16 v28 = 2048;
          int v29 = v12;
          __int16 v30 = 1024;
          int v31 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Add element %p to output action array: %u\n",  registryEntryID,  0x26u);
        }

        ((void (*)(OSAction *))v24->release)(v24);
        return v24;
      }

      if (v9)
      {
        __int16 v22 = OSMetaClassBase::GetClassName(this);
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
        uint64_t v23 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136315650;
        *(void *)&registryEntryID[4] = v22;
        __int16 v26 = 2048;
        uint64_t v27 = v23;
        __int16 v28 = 1024;
        LODWORD(v29) = -536870211;
        uint64_t v17 = "[%s 0x%llx] Out actions array setObject:%x\n";
        goto LABEL_21;
      }
    }

    return 0LL;
  }

  return Object;
}

uint64_t XboxHIDDevice::handlePayload(XboxHIDDevice *this, unint64_t a2, IOMemoryDescriptor *a3)
{
  return 0LL;
}

uint64_t non-virtual thunk to'XboxHIDDevice::handlePayload( XboxHIDDevice *this, unint64_t a2, IOMemoryDescriptor *a3)
{
  return 0LL;
}

uint64_t XboxHIDDevice::setReport( IOHIDDevice *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  uint64_t returnLength;
  _BYTE registryEntryID[12];
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v8 = 3758097086LL;
  returnLength = 0LL;
  if (LOBYTE(this[1].IOService::OSObject::OSObjectInterface::__vftable[10].free))
  {
    uint64_t v8 = 3758097111LL;
    goto LABEL_15;
  }

  if (!a6)
  {
    uint64_t v8 = 3758097090LL;
    goto LABEL_15;
  }

  IOMemoryDescriptor::GetLength(a2, &returnLength);
  uint64_t v10 = this[1].IOService::OSObject::OSObjectInterface::__vftable;
  if (!v10[7].init || !LODWORD(v10[7].free))
  {
    uint64_t v8 = 3758097112LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v17 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315394;
      *(void *)&registryEntryID[4] = ClassName;
      __int16 v26 = 2048;
      uint64_t v27 = v17;
      uint32_t v18 = "[%s 0x%llx] Pipes not ready\n";
LABEL_14:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v18,  registryEntryID,  0x16u);
    }

uint64_t non-virtual thunk to'XboxHIDDevice::setReport( XboxHIDDevice *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return XboxHIDDevice::setReport((IOHIDDevice *)((char *)this - 48), a2, a3, a4, a5, a6);
}

BOOL Xbox360Gamepad::init(IOService *this)
{
  BOOL result = XboxHIDDevice::init(this);
  if (result && !this->ivars) {
    Xbox360Gamepad::init();
  }
  return result;
}

BOOL non-virtual thunk to'Xbox360Gamepad::init(Xbox360Gamepad *this)
{
  return Xbox360Gamepad::init((IOService *)((char *)this - 24));
}

void Xbox360Gamepad::free(IOService *this)
{
  uint64_t v2 = this[2].OSObject::OSMetaClassBase::__vftable;
  if (v2)
  {
    IOFree(v2, 1uLL);
    this[2].OSObject::OSMetaClassBase::__vftable = 0LL;
  }

  XboxHIDDevice::free(this);
}

void non-virtual thunk to'Xbox360Gamepad::free(Xbox360Gamepad *this)
{
}

uint64_t Xbox360Gamepad::Start_Impl(IOService *this, IOService *a2)
{
  uint64_t v3 = IOService::Start(this, a2, (OSDispatchMethod)XboxHIDDevice::_Dispatch);
  if ((_DWORD)v3) {
    return v3;
  }
  uint64_t v4 = IOService::RegisterService(this, 0LL);
  if ((_DWORD)v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t v8 = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)v8, 0LL);
    uint64_t v7 = *(void *)v8;
    *(_DWORD *)uint64_t v8 = 136315650;
    *(void *)&v8[4] = ClassName;
    __int16 v9 = 2048;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] Could not register service: %{mach.errno}d\n",  v8,  0x1Cu);
  }

  return v4;
}

uint64_t Xbox360Gamepad::Stop_Impl(IOService *this, IOService *a2)
{
  return IOService::Stop(this, a2, (OSDispatchMethod)XboxHIDDevice::_Dispatch);
}

uint64_t Xbox360Gamepad::handlePayload(Xbox360Gamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return 0LL;
}

uint64_t non-virtual thunk to'Xbox360Gamepad::handlePayload( Xbox360Gamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return 0LL;
}

uint64_t Xbox360Gamepad::getReport( Xbox360Gamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return 3758097095LL;
}

uint64_t non-virtual thunk to'Xbox360Gamepad::getReport( Xbox360Gamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return 3758097095LL;
}

uint64_t Xbox360Gamepad::setReport( IOHIDDevice *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  uint64_t returnLength;
  uint64_t v6 = 3758097090LL;
  returnLength = 0LL;
  if (a3 != kIOHIDReportTypeOutput) {
    return 3758097095LL;
  }
  IOMemoryDescriptor::GetLength(a2, &returnLength);
  if (a4 == 1)
  {
    if (returnLength != 3) {
      return v6;
    }
    return XboxHIDDevice::setReport(this, a2, kIOHIDReportTypeOutput, a4, a5, a6);
  }

  if (!(_BYTE)a4 && returnLength == 8) {
    return XboxHIDDevice::setReport(this, a2, kIOHIDReportTypeOutput, a4, a5, a6);
  }
  return v6;
}

uint64_t non-virtual thunk to'Xbox360Gamepad::setReport( Xbox360Gamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return Xbox360Gamepad::setReport((IOHIDDevice *)((char *)this - 48), a2, a3, a4, a5, a6);
}

OSDictionary *non-virtual thunk to'Xbox360Gamepad::newDeviceDescription(Xbox360Gamepad *this)
{
  return XboxHIDDevice::newDeviceDescription((Xbox360Gamepad *)((char *)this - 64));
}

OSDataPtr Xbox360Gamepad::newReportDescriptor(Xbox360Gamepad *this)
{
  return OSDataCreate(&Xbox360HIDGamepadDeviceDescriptor, 0xD4uLL);
}

OSDataPtr non-virtual thunk to'Xbox360Gamepad::newReportDescriptor(Xbox360Gamepad *this)
{
  return OSDataCreate(&Xbox360HIDGamepadDeviceDescriptor, 0xD4uLL);
}

BOOL XboxOneSGamepad::init(IOService *this)
{
  BOOL result = XboxWirelessGamepad::init(this);
  if (result && !this->ivars) {
    XboxOneSGamepad::init();
  }
  return result;
}

BOOL non-virtual thunk to'XboxOneSGamepad::init(XboxOneSGamepad *this)
{
  return XboxOneSGamepad::init((IOService *)((char *)this - 24));
}

void non-virtual thunk to'XboxOneSGamepad::free(XboxOneSGamepad *this)
{
}

uint64_t XboxOneSGamepad::Start_Impl(IOService *this, IOService *a2)
{
  return IOService::Start(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxOneSGamepad::Stop_Impl(IOService *this, IOService *a2)
{
  return IOService::Stop(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxOneSGamepad::handlePayload( XboxOneSGamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return (*(uint64_t (**)(XboxOneSGamepad *, uint64_t, IOMemoryDescriptor *, uint64_t, void, void))(*(void *)this + 56LL))( this,  a2,  a3,  a4,  0LL,  0LL);
}

uint64_t non-virtual thunk to'XboxOneSGamepad::handlePayload( XboxOneSGamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return (*(uint64_t (**)(char *, uint64_t, IOMemoryDescriptor *, uint64_t, void, void))(*((void *)this - 10) + 56LL))( (char *)this - 80,  a2,  a3,  a4,  0LL,  0LL);
}

OSDataPtr XboxOneSGamepad::newReportDescriptor(XboxOneSGamepad *this)
{
  return OSDataCreate(&XboxOneSGamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

OSDataPtr non-virtual thunk to'XboxOneSGamepad::newReportDescriptor(XboxOneSGamepad *this)
{
  return OSDataCreate(&XboxOneSGamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

BOOL XboxSeriesXGamepad::init(IOService *this)
{
  BOOL result = XboxWirelessGamepad::init(this);
  if (result && !this->ivars) {
    XboxSeriesXGamepad::init();
  }
  return result;
}

BOOL non-virtual thunk to'XboxSeriesXGamepad::init(XboxSeriesXGamepad *this)
{
  return XboxSeriesXGamepad::init((IOService *)((char *)this - 24));
}

void non-virtual thunk to'XboxSeriesXGamepad::free(XboxSeriesXGamepad *this)
{
}

uint64_t XboxSeriesXGamepad::Start_Impl(IOService *this, IOService *a2)
{
  return IOService::Start(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxSeriesXGamepad::Stop_Impl(IOService *this, IOService *a2)
{
  return IOService::Stop(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxSeriesXGamepad::handlePayload( XboxSeriesXGamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return (*(uint64_t (**)(XboxSeriesXGamepad *, uint64_t, IOMemoryDescriptor *, uint64_t, void, void))(*(void *)this + 56LL))( this,  a2,  a3,  a4,  0LL,  0LL);
}

uint64_t non-virtual thunk to'XboxSeriesXGamepad::handlePayload( XboxSeriesXGamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return (*(uint64_t (**)(char *, uint64_t, IOMemoryDescriptor *, uint64_t, void, void))(*((void *)this - 10) + 56LL))( (char *)this - 80,  a2,  a3,  a4,  0LL,  0LL);
}

OSDataPtr XboxSeriesXGamepad::newReportDescriptor(XboxSeriesXGamepad *this)
{
  return OSDataCreate(&XboxSeriesXGamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

OSDataPtr non-virtual thunk to'XboxSeriesXGamepad::newReportDescriptor(XboxSeriesXGamepad *this)
{
  return OSDataCreate(&XboxSeriesXGamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

BOOL XboxEliteV2Gamepad::init(IOService *this)
{
  BOOL result = XboxWirelessGamepad::init(this);
  if (result && !this->ivars) {
    XboxEliteV2Gamepad::init();
  }
  return result;
}

BOOL non-virtual thunk to'XboxEliteV2Gamepad::init(XboxEliteV2Gamepad *this)
{
  return XboxEliteV2Gamepad::init((IOService *)((char *)this - 24));
}

void non-virtual thunk to'XboxEliteV2Gamepad::free(XboxEliteV2Gamepad *this)
{
}

uint64_t XboxEliteV2Gamepad::Start_Impl(IOService *this, IOService *a2)
{
  return IOService::Start(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxEliteV2Gamepad::Stop_Impl(IOService *this, IOService *a2)
{
  return IOService::Stop(this, a2, (OSDispatchMethod)XboxWirelessGamepad::_Dispatch);
}

uint64_t XboxEliteV2Gamepad::handlePayload( XboxEliteV2Gamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return (*(uint64_t (**)(XboxEliteV2Gamepad *, uint64_t, IOMemoryDescriptor *, uint64_t, void, void))(*(void *)this + 56LL))( this,  a2,  a3,  a4,  0LL,  0LL);
}

uint64_t non-virtual thunk to'XboxEliteV2Gamepad::handlePayload( XboxEliteV2Gamepad *this, uint64_t a2, IOMemoryDescriptor *a3, uint64_t a4)
{
  return (*(uint64_t (**)(char *, uint64_t, IOMemoryDescriptor *, uint64_t, void, void))(*((void *)this - 10) + 56LL))( (char *)this - 80,  a2,  a3,  a4,  0LL,  0LL);
}

OSDataPtr XboxEliteV2Gamepad::newReportDescriptor(XboxEliteV2Gamepad *this)
{
  return OSDataCreate(&XboxEliteV2GamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

OSDataPtr non-virtual thunk to'XboxEliteV2Gamepad::newReportDescriptor(XboxEliteV2Gamepad *this)
{
  return OSDataCreate(&XboxEliteV2GamepadUSBHIDDeviceDescriptor, 0x37uLL);
}

BOOL XboxWirelessGamepad::init(IOService *this)
{
  BOOL result = XboxHIDDevice::init(this);
  if (result && !this->ivars) {
    XboxWirelessGamepad::init();
  }
  return result;
}

BOOL non-virtual thunk to'XboxWirelessGamepad::init(XboxWirelessGamepad *this)
{
  return XboxWirelessGamepad::init((IOService *)((char *)this - 24));
}

void XboxWirelessGamepad::free(IOService *this)
{
  uint64_t v2 = this[2].OSObject::OSMetaClassBase::__vftable;
  if (v2)
  {
    IOFree(v2, 1uLL);
    this[2].OSObject::OSMetaClassBase::__vftable = 0LL;
  }

  XboxHIDDevice::free(this);
}

void non-virtual thunk to'XboxWirelessGamepad::free(XboxWirelessGamepad *this)
{
}

uint64_t XboxWirelessGamepad::Start_Impl(IOService *this, IOService *a2)
{
  uint64_t v3 = IOService::Start(this, a2, (OSDispatchMethod)XboxHIDDevice::_Dispatch);
  if ((_DWORD)v3) {
    return v3;
  }
  uint64_t v4 = IOService::RegisterService(this, 0LL);
  if ((_DWORD)v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    ClassName = OSMetaClassBase::GetClassName(this);
    *(void *)uint64_t v8 = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)v8, 0LL);
    uint64_t v7 = *(void *)v8;
    *(_DWORD *)uint64_t v8 = 136315650;
    *(void *)&v8[4] = ClassName;
    __int16 v9 = 2048;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] RegisterService:0x%x\n\n",  v8,  0x1Cu);
  }

  return v4;
}

uint64_t XboxWirelessGamepad::Stop_Impl(IOService *this, IOService *a2)
{
  return IOService::Stop(this, a2, (OSDispatchMethod)XboxHIDDevice::_Dispatch);
}

uint64_t XboxWirelessGamepad::handlePayload(XboxWirelessGamepad *this, uint64_t a2, IOMemoryDescriptor *a3)
{
  return (*(uint64_t (**)(XboxWirelessGamepad *, uint64_t, IOMemoryDescriptor *, void, void, void))(*(void *)this + 56LL))( this,  a2,  a3,  0LL,  0LL,  0LL);
}

uint64_t non-virtual thunk to'XboxWirelessGamepad::handlePayload( XboxWirelessGamepad *this, uint64_t a2, IOMemoryDescriptor *a3)
{
  return (*(uint64_t (**)(char *, uint64_t, IOMemoryDescriptor *, void, void, void))(*((void *)this - 10)
                                                                                                  + 56LL))( (char *)this - 80,  a2,  a3,  0LL,  0LL,  0LL);
}

uint64_t XboxWirelessGamepad::getReport( XboxWirelessGamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return 3758097095LL;
}

uint64_t non-virtual thunk to'XboxWirelessGamepad::getReport( XboxWirelessGamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return 3758097095LL;
}

uint64_t XboxWirelessGamepad::setReport( IOHIDDevice *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  kern_return_t v12;
  IOMemoryMap *v13;
  BOOL v14;
  const char *v15;
  uint64_t v16;
  kern_return_t Length;
  uint64_t Address;
  uint64_t v19;
  const char *ClassName;
  uint64_t v21;
  IOMemoryMap *v23;
  uint64_t returnLength;
  _BYTE registryEntryID[12];
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  kern_return_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v6 = 3758097090LL;
  uint64_t v23 = 0LL;
  returnLength = 0LL;
  if (a3 != kIOHIDReportTypeOutput) {
    return 3758097095LL;
  }
  int v12 = IOMemoryDescriptor::CreateMapping(a2, 2uLL, 0LL, 0LL, 0LL, 0LL, &v23, 0LL);
  int v13 = v23;
  uint64_t v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v12 || !v13)
  {
    if (v14)
    {
      ClassName = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v21 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136315650;
      *(void *)&registryEntryID[4] = ClassName;
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      __int16 v28 = 1024;
      int v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] CreateMapping:0x%x\n\n",  registryEntryID,  0x1Cu);
    }
  }

  else
  {
    if (v14)
    {
      uint64_t v15 = OSMetaClassBase::GetClassName(this);
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v16 = *(void *)registryEntryID;
      Length = IOMemoryMap::GetLength(v23);
      Address = IOMemoryMap::GetAddress(v23);
      int v19 = IOMemoryMap::GetLength(v23);
      *(_DWORD *)registryEntryID = 136316163;
      *(void *)&registryEntryID[4] = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 1040;
      int v29 = Length;
      __int16 v30 = 2097;
      int v31 = Address;
      uint64_t v32 = 2048;
      v33 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s 0x%llx] %{private}.*P (%{bytes}llu)\n",  registryEntryID,  0x30u);
      int v13 = v23;
    }

    ((void (*)(IOMemoryMap *))v13->free)(v13);
  }

  IOMemoryDescriptor::GetLength(a2, &returnLength);
  if (a4 == 5)
  {
    if (returnLength != 5) {
      return v6;
    }
    return XboxHIDDevice::setReport(this, a2, kIOHIDReportTypeOutput, a4, a5, a6);
  }

  return v6;
}

uint64_t non-virtual thunk to'XboxWirelessGamepad::setReport( XboxWirelessGamepad *this, IOMemoryDescriptor *a2, IOHIDReportType a3, unsigned int a4, unsigned int a5, OSAction *a6)
{
  return XboxWirelessGamepad::setReport((IOHIDDevice *)((char *)this - 48), a2, a3, a4, a5, a6);
}

OSDictionary *non-virtual thunk to'XboxWirelessGamepad::newDeviceDescription(XboxWirelessGamepad *this)
{
  return XboxHIDDevice::newDeviceDescription((XboxWirelessGamepad *)((char *)this - 64));
}

uint64_t XboxHIDDevice_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_10000C5D8;
  return 0LL;
}

uint64_t XboxHIDDeviceMetaClass::New(XboxHIDDeviceMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000C618;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000C6D0;
  *(void *)&a2[1].refcount = &off_10000C6F0;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000C720;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000C748;
  return 0LL;
}

uint64_t XboxHIDDevice::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxHIDDevice::_Dispatch(this, &v4, a3);
}

uint64_t XboxHIDDevice::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  int64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid > 0xE5C9619006DC5EFLL)
  {
    switch(msgid)
    {
      case 0xE5C9619006DC5F0LL:
        if (OSMetaClassBase::IsRemote(this))
        {
          __int128 v13 = *(_OWORD *)&a2->message;
          uint64_t v14 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v13;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }

        IORPC v12 = *a2;
        uint64_t v8 = (const OSMetaClass *)gOSAction_XboxHIDDevice_CompleteAsyncSendMetaClass;
        __int16 v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, IOReturn, uint32_t, uint64_t))XboxHIDDevice::CompleteAsyncSend_Impl;
        uint64_t v10 = &v12;
        break;
      case 0x4DC93D20F2BBA29ELL:
        if (!OSMetaClassBase::IsRemote(this))
        {
          IORPC v19 = *a2;
          return IOTimerDispatchSource::TimerOccurred_Invoke( &v19,  this,  (IOTimerDispatchSource::TimerOccurred_Handler)XboxHIDDevice::AsyncReadTimeoutOccurred_Impl,  (const OSMetaClass *)gOSAction_XboxHIDDevice_AsyncReadTimeoutOccurredMetaClass);
        }

        IORPC invoke = *a2;
        p_IORPC invoke = &invoke;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      case 0x60CC679B9C025AFELL:
        if (OSMetaClassBase::IsRemote(this))
        {
          __int128 v17 = *(_OWORD *)&a2->message;
          uint64_t v18 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v17;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }

        __int128 v15 = *(_OWORD *)&a2->message;
        uint64_t v16 = *(void *)&a2->sendSize;
        uint64_t v8 = (const OSMetaClass *)gOSAction_XboxHIDDevice_CompleteAsyncReceiveMetaClass;
        __int16 v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, IOReturn, uint32_t, uint64_t))XboxHIDDevice::CompleteAsyncReceive_Impl;
        uint64_t v10 = (IORPC *)&v15;
        break;
      default:
LABEL_14:
        IORPC v11 = *a2;
        return IOUserHIDDevice::_Dispatch(this, &v11);
    }

    return IOUSBHostPipe::CompleteAsyncIO_Invoke(v10, this, v9, v8);
  }

  if (msgid == 0x98E715041C459FA5LL)
  {
    IORPC v22 = *a2;
    return IOService::Stop_Invoke(&v22, this, (IOService::Stop_Handler)XboxHIDDevice::Stop_Impl);
  }

  if (msgid != 0xAB6F76DDE6D693F2LL)
  {
    if (msgid == 0xD200FDE7D57ECCA6LL)
    {
      IORPC rpc = *a2;
      return IOService::SetPowerState_Invoke( &rpc,  this,  (IOService::SetPowerState_Handler)XboxHIDDevice::SetPowerState_Impl);
    }

    goto LABEL_14;
  }

  IORPC v23 = *a2;
  return IOService::Start_Invoke(&v23, this, (IOService::Start_Handler)XboxHIDDevice::Start_Impl);
}

uint64_t XboxHIDDeviceMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t XboxHIDDevice::CreateActionAsyncReadTimeoutOccurred(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred");
  if (!v6) {
    return 3758097085LL;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x4DC93D20F2BBA29EuLL, 0xF4AB1C3CBB5AE47uLL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t XboxHIDDevice::CreateActionCompleteAsyncReceive(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_XboxHIDDevice_CompleteAsyncReceive");
  if (!v6) {
    return 3758097085LL;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x60CC679B9C025AFEuLL, 0xC320A3EEA932C04ALL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t XboxHIDDevice::CreateActionCompleteAsyncSend(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_XboxHIDDevice_CompleteAsyncSend");
  if (!v6) {
    return 3758097085LL;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0xE5C9619006DC5F0uLL, 0xC320A3EEA932C04ALL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_10000C790;
  return 0LL;
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurredMetaClass::New( OSAction_XboxHIDDevice_AsyncReadTimeoutOccurredMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000C7D0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000C818;
  return 0LL;
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred::_Dispatch( OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurredMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncReceive_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_10000C838;
  return 0LL;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncReceiveMetaClass::New( OSAction_XboxHIDDevice_CompleteAsyncReceiveMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000C878;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000C8C0;
  return 0LL;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncReceive::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncReceiveMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncSend_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_10000C8E0;
  return 0LL;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncSendMetaClass::New( OSAction_XboxHIDDevice_CompleteAsyncSendMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000C920;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000C968;
  return 0LL;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncSend::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncSendMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred::getMetaClass( OSAction_XboxHIDDevice_AsyncReadTimeoutOccurred *this)
{
  return gOSAction_XboxHIDDevice_AsyncReadTimeoutOccurredMetaClass;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncReceive::getMetaClass( OSAction_XboxHIDDevice_CompleteAsyncReceive *this)
{
  return gOSAction_XboxHIDDevice_CompleteAsyncReceiveMetaClass;
}

uint64_t OSAction_XboxHIDDevice_CompleteAsyncSend::getMetaClass( OSAction_XboxHIDDevice_CompleteAsyncSend *this)
{
  return gOSAction_XboxHIDDevice_CompleteAsyncSendMetaClass;
}

uint64_t XboxUSBDevice_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_10000CA28;
  return 0LL;
}

uint64_t XboxUSBDeviceMetaClass::New(XboxUSBDeviceMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CA68;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000CAB0;
  return 0LL;
}

uint64_t XboxUSBDevice::Dispatch(IOService *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxUSBDevice::_Dispatch(this, &v4, a3);
}

uint64_t XboxUSBDevice::_Dispatch(IOService *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5LL)
  {
    IORPC v8 = *a2;
    return IOService::Stop_Invoke(&v8, this, (IOService::Stop_Handler)XboxUSBDevice::Stop_Impl);
  }

  else if (msgid == 0xAB6F76DDE6D693F2LL)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)XboxUSBDevice::Start_Impl);
  }

  else
  {
    IORPC v7 = *a2;
    return IOService::_Dispatch(this, &v7);
  }

uint64_t XboxUSBDeviceMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t Xbox360Gamepad_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_10000CB70;
  return 0LL;
}

uint64_t Xbox360GamepadMetaClass::New(Xbox360GamepadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CBB0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000CC68;
  *(void *)&a2[1].refcount = &off_10000CC88;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CCB8;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CCE0;
  return 0LL;
}

uint64_t Xbox360Gamepad::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return Xbox360Gamepad::_Dispatch(this, &v4, a3);
}

uint64_t Xbox360Gamepad::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5LL)
  {
    IORPC v9 = *a2;
    return IOService::Stop_Invoke(&v9, this, (IOService::Stop_Handler)Xbox360Gamepad::Stop_Impl);
  }

  else if (msgid == 0xAB6F76DDE6D693F2LL)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)Xbox360Gamepad::Start_Impl);
  }

  else
  {
    IORPC v8 = *a2;
    return XboxHIDDevice::_Dispatch(this, &v8, v5);
  }

uint64_t Xbox360GamepadMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t XboxWirelessGamepad_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_10000CDC8;
  return 0LL;
}

uint64_t XboxWirelessGamepadMetaClass::New(XboxWirelessGamepadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CE08;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000CEC0;
  *(void *)&a2[1].refcount = &off_10000CEE0;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CF10;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CF38;
  return 0LL;
}

uint64_t XboxWirelessGamepad::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxWirelessGamepad::_Dispatch(this, &v4, a3);
}

uint64_t XboxWirelessGamepad::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5LL)
  {
    IORPC v9 = *a2;
    return IOService::Stop_Invoke(&v9, this, (IOService::Stop_Handler)XboxWirelessGamepad::Stop_Impl);
  }

  else if (msgid == 0xAB6F76DDE6D693F2LL)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)XboxWirelessGamepad::Start_Impl);
  }

  else
  {
    IORPC v8 = *a2;
    return XboxHIDDevice::_Dispatch(this, &v8, v5);
  }

uint64_t XboxWirelessGamepadMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t XboxSeriesXGamepad_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_10000D020;
  return 0LL;
}

uint64_t XboxSeriesXGamepadMetaClass::New(XboxSeriesXGamepadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000D060;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000D118;
  *(void *)&a2[1].refcount = &off_10000D138;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000D168;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000D190;
  return 0LL;
}

uint64_t XboxSeriesXGamepad::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxSeriesXGamepad::_Dispatch(this, &v4, a3);
}

uint64_t XboxSeriesXGamepad::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5LL)
  {
    IORPC v9 = *a2;
    return IOService::Stop_Invoke(&v9, this, (IOService::Stop_Handler)XboxSeriesXGamepad::Stop_Impl);
  }

  else if (msgid == 0xAB6F76DDE6D693F2LL)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)XboxSeriesXGamepad::Start_Impl);
  }

  else
  {
    IORPC v8 = *a2;
    return XboxWirelessGamepad::_Dispatch(this, &v8, v5);
  }

uint64_t XboxSeriesXGamepadMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t XboxEliteV2Gamepad_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_10000D278;
  return 0LL;
}

uint64_t XboxEliteV2GamepadMetaClass::New(XboxEliteV2GamepadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000D2B8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000D370;
  *(void *)&a2[1].refcount = &off_10000D390;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000D3C0;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000D3E8;
  return 0LL;
}

uint64_t XboxEliteV2Gamepad::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxEliteV2Gamepad::_Dispatch(this, &v4, a3);
}

uint64_t XboxEliteV2Gamepad::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5LL)
  {
    IORPC v9 = *a2;
    return IOService::Stop_Invoke(&v9, this, (IOService::Stop_Handler)XboxEliteV2Gamepad::Stop_Impl);
  }

  else if (msgid == 0xAB6F76DDE6D693F2LL)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)XboxEliteV2Gamepad::Start_Impl);
  }

  else
  {
    IORPC v8 = *a2;
    return XboxWirelessGamepad::_Dispatch(this, &v8, v5);
  }

uint64_t XboxEliteV2GamepadMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t XboxOneSGamepad_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)off_10000D4D0;
  return 0LL;
}

uint64_t XboxOneSGamepadMetaClass::New(XboxOneSGamepadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000D510;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000D5C8;
  *(void *)&a2[1].refcount = &off_10000D5E8;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000D618;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000D640;
  return 0LL;
}

uint64_t XboxOneSGamepad::Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return XboxOneSGamepad::_Dispatch(this, &v4, a3);
}

uint64_t XboxOneSGamepad::_Dispatch(IOUserHIDDevice *this, IORPC *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5LL)
  {
    IORPC v9 = *a2;
    return IOService::Stop_Invoke(&v9, this, (IOService::Stop_Handler)XboxOneSGamepad::Stop_Impl);
  }

  else if (msgid == 0xAB6F76DDE6D693F2LL)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)XboxOneSGamepad::Start_Impl);
  }

  else
  {
    IORPC v8 = *a2;
    return XboxWirelessGamepad::_Dispatch(this, &v8, v5);
  }

uint64_t XboxOneSGamepadMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

void XboxUSBDevice::init()
{
}

void XboxHIDDevice::init()
{
}

void Xbox360Gamepad::init()
{
}

void XboxOneSGamepad::init()
{
}

void XboxSeriesXGamepad::init()
{
}

void XboxEliteV2Gamepad::init()
{
}

void XboxWirelessGamepad::init()
{
}