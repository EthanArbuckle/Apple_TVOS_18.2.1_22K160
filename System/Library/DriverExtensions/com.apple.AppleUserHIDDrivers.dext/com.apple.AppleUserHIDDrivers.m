BOOL AppleUserUSBHostHIDDevice::init(IOUserUSBHostHIDDevice *this)
{
  BOOL v2;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  v2 = IOUserUSBHostHIDDevice::init(this);
  if (v2)
  {
    if (!this->ivars) {
      sub_100003590();
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446722;
    v5 = "AppleUserUSBHostHIDDevice.cpp";
    v6 = 1024;
    v7 = 54;
    v8 = 1024;
    v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d]init:%x\n",  (uint8_t *)&v4,  0x18u);
  }

  return v2;
}

BOOL non-virtual thunk to'AppleUserUSBHostHIDDevice::init(AppleUserUSBHostHIDDevice *this)
{
  return AppleUserUSBHostHIDDevice::init((IOUserUSBHostHIDDevice *)((char *)this - 24));
}

uint64_t AppleUserUSBHostHIDDevice::Start_Impl(IOService *this, IOService *a2)
{
  uint64_t v4 = 3758097095LL;
  unsigned int v23 = 0;
  properties = 0LL;
  IOParseBootArgNumber("AppleUserUSBHostHIDDevice-debug", &v23, 4);
  if ((v23 & 1) != 0) {
    return v4;
  }
  uint64_t v5 = IOService::Start(this, a2, (OSDispatchMethod)&IOUserUSBHostHIDDevice::_Dispatch);
  if ((_DWORD)v5)
  {
    uint64_t v19 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__str = 136446722;
      *(void *)&__str[4] = "AppleUserUSBHostHIDDevice.cpp";
      *(_WORD *)&__str[12] = 1024;
      *(_DWORD *)&__str[14] = 77;
      *(_WORD *)&__str[18] = 1024;
      *(_DWORD *)&__str[20] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d]Start:0x%x\n",  (uint8_t *)__str,  0x18u);
    }

    uint64_t v4 = v19;
    goto LABEL_21;
  }

  if (!IOService::CopyProperties(this, &properties, (OSDispatchMethod)&IOUserUSBHostHIDDevice::_Dispatch))
  {
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v32 = 0u;
    memset(__str, 0, sizeof(__str));
    if (IOParseBootArgString("AppleUserUSBHostHIDDevice-blacklist", __str, 256))
    {
      __endptr = __str;
      uint64_t UInt64Value = OSDictionaryGetUInt64Value(properties, "VendorID");
      uint64_t v7 = UInt64Value | (OSDictionaryGetUInt64Value(properties, "ProductID") << 16);
      while (strtoull(__str, &__endptr, 0) != v7)
      {
        if (__endptr <= __str || !*__endptr) {
          goto LABEL_9;
        }
      }

      uint64_t v8 = 3758097095LL;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
        uint64_t v18 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136446978;
        *(void *)&registryEntryID[4] = "AppleUserUSBHostHIDDevice.cpp";
        __int16 v25 = 1024;
        int v26 = 97;
        __int16 v27 = 2048;
        uint64_t v28 = v18;
        __int16 v29 = 2048;
        uint64_t v30 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] Device blacklisted:0x%llx\n\n\n",  registryEntryID,  0x26u);
      }
    }

    else
    {
LABEL_9:
      uint64_t v8 = 0LL;
    }

    uint64_t v9 = OSDictionaryGetUInt64Value(properties, "AppleUserUSBHostHIDDevice-debug");
    if ((v9 & ~(unint64_t)v23) != 0)
    {
      uint64_t v12 = v9;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID(this, (uint64_t *)registryEntryID, 0LL);
        uint64_t v13 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136446978;
        *(void *)&registryEntryID[4] = "AppleUserUSBHostHIDDevice.cpp";
        __int16 v25 = 1024;
        int v26 = 105;
        __int16 v27 = 2048;
        uint64_t v28 = v13;
        __int16 v29 = 2048;
        uint64_t v30 = v12;
        v14 = "[%{public}s:%d][0x%llx] Device support require AppleUserUSBHostHIDDevice-debug:0x%llx\n\n\n";
        v15 = registryEntryID;
        uint32_t v16 = 38;
LABEL_20:
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v14,  (uint8_t *)v15,  v16);
      }
    }

    else
    {
      uint64_t v4 = v8;
      if (!(_DWORD)v8) {
        goto LABEL_12;
      }
    }

LABEL_21:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)__str = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)__str, 0LL);
      uint64_t v17 = *(void *)__str;
      *(_DWORD *)__str = 136446978;
      *(void *)&__str[4] = "AppleUserUSBHostHIDDevice.cpp";
      *(_WORD *)&__str[12] = 1024;
      *(_DWORD *)&__str[14] = 119;
      *(_WORD *)&__str[18] = 2048;
      *(void *)&__str[20] = v17;
      *(_WORD *)&__str[28] = 1024;
      *(_DWORD *)&__str[30] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] Start failed: 0x%x\n\n",  (uint8_t *)__str,  0x22u);
    }

    IOService::Stop(this, a2, 0LL);
    goto LABEL_13;
  }

LABEL_12:
  uint64_t v4 = IOService::RegisterService(this, 0LL);
  if ((_DWORD)v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(void *)__str = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)__str, 0LL);
    uint64_t v20 = *(void *)__str;
    *(_DWORD *)__str = 136446978;
    *(void *)&__str[4] = "AppleUserUSBHostHIDDevice.cpp";
    *(_WORD *)&__str[12] = 1024;
    *(_DWORD *)&__str[14] = 114;
    *(_WORD *)&__str[18] = 2048;
    *(void *)&__str[20] = v20;
    *(_WORD *)&__str[28] = 1024;
    *(_DWORD *)&__str[30] = v4;
    v14 = "[%{public}s:%d][0x%llx] RegisterService:0x%x\n\n\n";
    v15 = __str;
    uint32_t v16 = 34;
    goto LABEL_20;
  }

LABEL_13:
  if (properties)
  {
    ((void (*)(OSDictionary *))properties->release)(properties);
    properties = 0LL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)__str = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)__str, 0LL);
    uint64_t v10 = *(void *)__str;
    *(_DWORD *)__str = 136446978;
    *(void *)&__str[4] = "AppleUserUSBHostHIDDevice.cpp";
    *(_WORD *)&__str[12] = 1024;
    *(_DWORD *)&__str[14] = 126;
    *(_WORD *)&__str[18] = 2048;
    *(void *)&__str[20] = v10;
    *(_WORD *)&__str[28] = 1024;
    *(_DWORD *)&__str[30] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] Start ret: 0x%x\n\n",  (uint8_t *)__str,  0x22u);
  }

  return v4;
}

uint64_t AppleUserUSBHostHIDDevice::Stop_Impl(IOService *this, IOService *a2)
{
  uint64_t v3 = IOService::Stop(this, a2, (OSDispatchMethod)&IOUserUSBHostHIDDevice::_Dispatch);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)v6 = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)v6, 0LL);
    uint64_t v4 = *(void *)v6;
    *(_DWORD *)v6 = 136446978;
    *(void *)&v6[4] = "AppleUserUSBHostHIDDevice.cpp";
    __int16 v7 = 1024;
    int v8 = 137;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] Stop: 0x%x\n\n",  v6,  0x22u);
  }

  return v3;
}

uint64_t AppleUserHIDEventDriver::init(AppleUserHIDEventDriver *this)
{
  uint64_t v2 = AppleUserHIDEventService::init(this);
  if ((v2 & 1) != 0)
  {
    *((void *)this + 14) = IOMallocZeroTyped(24LL, 0x1020040EDCEB4C7LL);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446722;
    uint64_t v5 = "AppleUserHIDEventDriver.cpp";
    __int16 v6 = 1024;
    int v7 = 78;
    __int16 v8 = 1024;
    int v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d]Init:%x\n",  (uint8_t *)&v4,  0x18u);
  }

  return v2;
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::init(AppleUserHIDEventDriver *this)
{
  return AppleUserHIDEventDriver::init((AppleUserHIDEventDriver *)((char *)this - 24));
}

uint64_t AppleUserHIDEventDriver::free(AppleUserHIDEventDriver *this)
{
  uint64_t v2 = (void *)*((void *)this + 14);
  if (v2)
  {
    if (*v2)
    {
      (*(void (**)(void))(*(void *)*v2 + 16LL))(*v2);
      **((void **)this + 14) = 0LL;
      uint64_t v2 = (void *)*((void *)this + 14);
    }

    uint64_t v3 = v2[1];
    if (!v3
      || ((*(void (**)(void))(*(void *)v3 + 16LL))(v2[1]),
          *(void *)(*((void *)this + 14) + 8LL) = 0LL,
          (uint64_t v2 = (void *)*((void *)this + 14)) != 0LL))
    {
      IOFree(v2, 0x18uLL);
      *((void *)this + 14) = 0LL;
    }
  }

  return AppleUserHIDEventService::free(this);
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::free(AppleUserHIDEventDriver *this)
{
  return AppleUserHIDEventDriver::free((AppleUserHIDEventDriver *)((char *)this - 24));
}

void AppleUserHIDEventDriver::printDescription(AppleUserHIDEventDriver *this)
{
  uint64_t v2 = (OSDictionary *)**((void **)this + 14);
  if (!v2) {
    return;
  }
  OSObjectPtr Value = OSDictionaryGetValue(v2, "Product");
  int v4 = (const OSString *)OSMetaClassBase::safeMetaCast(Value, gOSStringMetaClass);
  OSObjectPtr v5 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "PrimaryUsagePage");
  __int16 v6 = (const OSNumber *)OSMetaClassBase::safeMetaCast(v5, gOSNumberMetaClass);
  OSObjectPtr v7 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "PrimaryUsage");
  __int16 v8 = (const OSNumber *)OSMetaClassBase::safeMetaCast(v7, gOSNumberMetaClass);
  OSObjectPtr v9 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "VendorID");
  uint64_t v10 = (const OSNumber *)OSMetaClassBase::safeMetaCast(v9, gOSNumberMetaClass);
  OSObjectPtr v11 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "ProductID");
  int v12 = (const OSNumber *)OSMetaClassBase::safeMetaCast(v11, gOSNumberMetaClass);
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
    return;
  }
  *(void *)uint64_t v17 = 0LL;
  IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)v17, 0LL);
  uint64_t v13 = *(void *)v17;
  if (v4)
  {
    CStringNoCopy = OSString::getCStringNoCopy(v4);
    if (v6) {
      goto LABEL_5;
    }
LABEL_12:
    uint32_t v15 = 0;
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  CStringNoCopy = (const char *)&unk_100003F4E;
  if (!v6) {
    goto LABEL_12;
  }
LABEL_5:
  uint32_t v15 = OSNumber::unsigned32BitValue(v6);
  if (v8) {
LABEL_6:
  }
    LODWORD(v8) = OSNumber::unsigned32BitValue(v8);
LABEL_7:
  if (v10) {
    LODWORD(v10) = OSNumber::unsigned32BitValue(v10);
  }
  if (v12) {
    uint32_t v16 = OSNumber::unsigned32BitValue(v12);
  }
  else {
    uint32_t v16 = 0;
  }
  *(_DWORD *)uint64_t v17 = 136448002;
  *(void *)&v17[4] = "AppleUserHIDEventDriver.cpp";
  __int16 v18 = 1024;
  int v19 = 116;
  __int16 v20 = 2048;
  uint64_t v21 = v13;
  __int16 v22 = 2082;
  unsigned int v23 = CStringNoCopy;
  __int16 v24 = 1024;
  uint32_t v25 = v15;
  __int16 v26 = 1024;
  int v27 = (int)v8;
  __int16 v28 = 1024;
  int v29 = (int)v10;
  __int16 v30 = 1024;
  uint32_t v31 = v16;
  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] %{public}s usagePage: %d usage: %d vid: %d pid: %d\n\n",  v17,  0x3Eu);
}

uint64_t AppleUserHIDEventDriver::parseGameControllerElement(IOUserHIDEventDriver *this, IOHIDElement *a2)
{
  if (LOBYTE(this[1].meta->IOUserHIDEventService::IOHIDEventService::IOService::OSObject::meta)) {
    return IOUserHIDEventDriver::parseGameControllerElement(this, a2);
  }
  else {
    return 0LL;
  }
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::parseGameControllerElement( AppleUserHIDEventDriver *this, IOHIDElement *a2)
{
  if (*(_BYTE *)(*((void *)this + 4) + 16LL)) {
    return IOUserHIDEventDriver::parseGameControllerElement((IOUserHIDEventDriver *)((char *)this - 80), a2);
  }
  else {
    return 0LL;
  }
}

uint64_t AppleUserHIDEventDriver::parseLEDElement(AppleUserHIDEventDriver *this, IOHIDElement *a2)
{
  int v4 = &a2->IOHIDElementInterface;
  int v5 = ((uint64_t (*)(IOHIDElementInterface *))a2->getUsagePage)(&a2->IOHIDElementInterface);
  BOOL v6 = ((unsigned int (*)(IOHIDElementInterface *))v4->getUsage)(v4) < 0x10000 && v5 == 8;
  uint64_t v7 = v6;
  if (v6)
  {
    __int16 v8 = *(OSArray **)(*((void *)this + 14) + 8LL);
    if (v8
      || (*(void *)(*((void *)this + 14) + 8LL) = OSArray::withCapacity(4u),
          (__int16 v8 = *(OSArray **)(*((void *)this + 14) + 8LL)) != 0LL))
    {
      OSArray::setObject(v8, a2);
    }
  }

  return v7;
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::parseLEDElement( AppleUserHIDEventDriver *this, IOHIDElement *a2)
{
  return AppleUserHIDEventDriver::parseLEDElement((AppleUserHIDEventDriver *)((char *)this - 80), a2);
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::handleGameControllerReport( AppleUserHIDEventDriver *this, unint64_t a2, unsigned int a3)
{
  return IOUserHIDEventDriver::handleGameControllerReport((IOUserHIDEventDriver *)((char *)this - 80), a2, a3);
}

uint64_t AppleUserHIDEventDriver::postProcessElements(AppleUserHIDEventDriver *this, OSDictionary *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)uint64_t v7 = 0LL;
    IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)v7, 0LL);
    uint64_t v4 = *(void *)v7;
    uint64_t v5 = *(void *)(*((void *)this + 14) + 8LL);
    if (v5) {
      LODWORD(v5) = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 72LL))(v5);
    }
    *(_DWORD *)uint64_t v7 = 136446978;
    *(void *)&v7[4] = "AppleUserHIDEventDriver.cpp";
    __int16 v8 = 1024;
    int v9 = 211;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] parseElements: led: %d\n\n",  v7,  0x22u);
  }

  return AppleUserHIDEventService::postProcessElements(this, a2);
}

OSDictionaryPtr AppleUserHIDEventDriver::setLEDProperties(AppleUserHIDEventDriver *this, OSDictionary *a2)
{
  OSDictionaryPtr result = OSDictionary::withCapacity(1u);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)(*((void *)this + 14) + 8LL);
    if (v6)
    {
      uint32_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 72LL))(v6);
      OSArrayPtr v8 = OSArray::withCapacity(v7);
      if (v8)
      {
        int v9 = v8;
        int v10 = (*(uint64_t (**)(void))(**(void **)(*((void *)this + 14) + 8LL) + 72LL))(*(void *)(*((void *)this + 14) + 8LL));
        if (v10)
        {
          int v11 = v10;
          for (uint32_t i = 0; i != v11; ++i)
          {
            Object = OSArray::getObject(*(const OSArray **)(*((void *)this + 14) + 8LL), i);
            unsigned int v14 = (**(uint64_t (***)(uint64_t))&Object[1].refcount)((uint64_t)&Object[1].refcount);
            OSNumberPtr v15 = OSNumber::withNumber(v14, 0x20uLL);
            OSArray::setObject(v9, v15);
            if (v15) {
              ((void (*)(OSNumberPtr))v15->release)(v15);
            }
          }
        }

        OSDictionary::setObject(v5, "Elements", v9);
        OSDictionary::setObject(a2, "LED", v5);
        ((void (*)(OSArray *))v9->release)(v9);
      }
    }

    return (OSDictionaryPtr)((uint64_t (*)(OSDictionary *))v5->release)(v5);
  }

  return result;
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::postProcessElements( AppleUserHIDEventDriver *this, OSDictionary *a2)
{
  return AppleUserHIDEventDriver::postProcessElements((AppleUserHIDEventDriver *)((char *)this - 80), a2);
}

uint64_t AppleUserHIDEventDriver::deviceSupported(AppleUserHIDEventDriver *this)
{
  int v24 = 0;
  uint64_t v2 = (OSDictionary *)**((void **)this + 14);
  if (!v2) {
    return 0LL;
  }
  OSObjectPtr Value = OSDictionaryGetValue(v2, "VendorID");
  uint64_t v4 = (const OSNumber *)OSMetaClassBase::safeMetaCast(Value, gOSNumberMetaClass);
  OSObjectPtr v5 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "ProductID");
  uint64_t v6 = (const OSNumber *)OSMetaClassBase::safeMetaCast(v5, gOSNumberMetaClass);
  OSObjectPtr v7 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "Product");
  OSArrayPtr v8 = (const OSString *)OSMetaClassBase::safeMetaCast(v7, gOSStringMetaClass);
  if (v8 && OSString::isEqualTo(v8, "KernelOnlyTestHIDUserDevice"))
  {
    uint64_t v14 = 0LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    *(_DWORD *)registryEntryID = 136446466;
    *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
    __int16 v26 = 1024;
    int v27 = 233;
    __int16 v22 = "[%{public}s:%d]Device has property to force kernel driver matching\n";
    uint32_t v23 = 18;
LABEL_33:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v22,  registryEntryID,  v23);
    return 0LL;
  }

  if (v4) {
    BOOL v9 = v6 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    goto LABEL_39;
  }
  if (OSNumber::unsigned32BitValue(v4) == 1452
    && (OSNumber::unsigned32BitValue(v6) == 33538 || OSNumber::unsigned32BitValue(v6) == 34304))
  {
    return 1LL;
  }

  if (OSNumber::unsigned32BitValue(v4) != 1452
    || (OSObjectPtr v10 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "PrimaryUsagePage"),
        int v11 = OSMetaClassBase::safeMetaCast(v10, gOSNumberMetaClass),
        OSObjectPtr v12 = OSDictionaryGetValue(**((OSDictionaryPtr **)this + 14), "PrimaryUsage"),
        int v13 = OSMetaClassBase::safeMetaCast(v12, gOSNumberMetaClass),
        uint64_t v14 = 0LL,
        v11)
    && v13)
  {
LABEL_39:
    IOParseBootArgNumber("AppleUserHIDEventDriver-debug", &v24, 4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v15 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136446722;
      *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
      __int16 v26 = 1024;
      int v27 = 262;
      __int16 v28 = 2048;
      uint64_t v29 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] Target embedded OS\n\n",  registryEntryID,  0x1Cu);
    }

    uint64_t v16 = *((void *)this + 14);
    if ((v24 & 8) != 0)
    {
      *(_BYTE *)(v16 + 16) = 1;
    }

    else
    {
      OSBooleanPtr v17 = (OSBooleanPtr)OSDictionaryGetValue(*(OSDictionaryPtr *)v16, "Authenticated");
      BOOL v18 = OSMetaClassBase::safeMetaCast(v17, gOSBooleanMetaClass) && v17 == kOSBooleanTrue;
      BOOL v19 = v18;
      *(_BYTE *)(*((void *)this + 14) + 16LL) = v19;
      if (v17) {
        ((void (*)(OSBooleanPtr))v17->release)(v17);
      }
    }

    if (((*(uint64_t (**)(AppleUserHIDEventDriver *, uint64_t, uint64_t))(*(void *)this + 112LL))( this,  1LL,  5LL) & 1) != 0 || (uint64_t v14 = 1LL,  (*(unsigned int (**)(AppleUserHIDEventDriver *, uint64_t, uint64_t))(*(void *)this + 112LL))( this,  1LL,  4LL)))
    {
      if (*(_BYTE *)(*((void *)this + 14) + 16LL)) {
        return 1LL;
      }
      uint64_t v14 = 0LL;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return v14;
      }
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v21 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136446722;
      *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
      __int16 v26 = 1024;
      int v27 = 273;
      __int16 v28 = 2048;
      uint64_t v29 = v21;
      __int16 v22 = "[%{public}s:%d][0x%llx] Un-authenticated game controller device attached\n\n";
      uint32_t v23 = 28;
      goto LABEL_33;
    }
  }

  return v14;
}

uint64_t AppleUserHIDEventDriver::handleStart(AppleUserHIDEventDriver *this, IOService *a2)
{
  uint64_t result = AppleUserHIDEventDriver::deviceSupported(this);
  if ((_DWORD)result) {
    return IOUserHIDEventService::handleStart((IOUserHIDEventService *)this, a2);
  }
  return result;
}

uint64_t non-virtual thunk to'AppleUserHIDEventDriver::handleStart( AppleUserHIDEventDriver *this, IOService *a2)
{
  uint64_t v3 = (IOUserHIDEventService *)((char *)this - 64);
  uint64_t result = AppleUserHIDEventDriver::deviceSupported((AppleUserHIDEventDriver *)((char *)this - 64));
  if ((_DWORD)result) {
    return IOUserHIDEventService::handleStart(v3, a2);
  }
  return result;
}

uint64_t AppleUserHIDEventDriver::Start_Impl(OSDictionary ***this, IOService *a2)
{
  uint64_t v4 = 3758097084LL;
  int v12 = 0;
  IOParseBootArgNumber("AppleUserHIDEventDriver-debug", &v12, 4);
  if ((v12 & 1) != 0) {
    return 3758097095LL;
  }
  IOService::CopyProperties(a2, this[14], 0LL);
  if (*this[14])
  {
    uint64_t v5 = IOService::Start((IOService *)this, a2, (OSDispatchMethod)&AppleUserHIDEventService::_Dispatch);
    if ((_DWORD)v5)
    {
      uint64_t v4 = v5;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
        uint64_t v8 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136446978;
        *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
        __int16 v14 = 1024;
        int v15 = 311;
        __int16 v16 = 2048;
        uint64_t v17 = v8;
        __int16 v18 = 1024;
        int v19 = v4;
        BOOL v9 = "[%{public}s:%d][0x%llx] Start: 0x%x\n\n";
LABEL_14:
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v9,  registryEntryID,  0x22u);
      }
    }

    else
    {
      uint64_t v4 = IOService::RegisterService((IOService *)this, 0LL);
      if (!(_DWORD)v4)
      {
LABEL_5:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(void *)registryEntryID = 0LL;
          IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
          uint64_t v6 = *(void *)registryEntryID;
          *(_DWORD *)registryEntryID = 136446978;
          *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
          __int16 v14 = 1024;
          int v15 = 322;
          __int16 v16 = 2048;
          uint64_t v17 = v6;
          __int16 v18 = 1024;
          int v19 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] Start ret: 0x%x\n\n",  registryEntryID,  0x22u);
        }

        AppleUserHIDEventDriver::printDescription((AppleUserHIDEventDriver *)this);
        return v4;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)registryEntryID = 0LL;
        IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
        uint64_t v10 = *(void *)registryEntryID;
        *(_DWORD *)registryEntryID = 136446978;
        *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
        __int16 v14 = 1024;
        int v15 = 314;
        __int16 v16 = 2048;
        uint64_t v17 = v10;
        __int16 v18 = 1024;
        int v19 = v4;
        BOOL v9 = "[%{public}s:%d][0x%llx] RegisterService: 0x%x\n\n";
        goto LABEL_14;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)registryEntryID = 0LL;
      IOService::GetRegistryEntryID((IOService *)this, (uint64_t *)registryEntryID, 0LL);
      uint64_t v11 = *(void *)registryEntryID;
      *(_DWORD *)registryEntryID = 136446978;
      *(void *)&registryEntryID[4] = "AppleUserHIDEventDriver.cpp";
      __int16 v14 = 1024;
      int v15 = 318;
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] Start failed: 0x%x\n\n",  registryEntryID,  0x22u);
    }

    IOService::Stop((IOService *)this, a2, 0LL);
    goto LABEL_5;
  }

  return v4;
}

uint64_t AppleUserHIDEventDriver::Stop_Impl(IOService *this, IOService *a2)
{
  uint64_t v3 = IOService::Stop(this, a2, (OSDispatchMethod)&AppleUserHIDEventService::_Dispatch);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(void *)uint64_t v6 = 0LL;
    IOService::GetRegistryEntryID(this, (uint64_t *)v6, 0LL);
    uint64_t v4 = *(void *)v6;
    *(_DWORD *)uint64_t v6 = 136446978;
    *(void *)&v6[4] = "AppleUserHIDEventDriver.cpp";
    __int16 v7 = 1024;
    int v8 = 333;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] Stop: 0x%x\n\n",  v6,  0x22u);
  }

  return v3;
}

uint64_t AppleUserHIDEventDriver::SetLEDState_Impl(IOService *this, int a2, int a3, uint64_t a4)
{
  uint64_t v5 = 3758097095LL;
  uint64_t v6 = *(void *)&this[2].meta->OSObject::OSObjectInterface::refcount;
  if (v6 && (*(unsigned int (**)(uint64_t))(*(void *)v6 + 72LL))(v6))
  {
    uint32_t v10 = 0;
    while (1)
    {
      p_refcount = (char *)&OSArray::getObject( *(const OSArray **)&this[2].meta->OSObject::OSObjectInterface::refcount,  v10)[1].refcount;
      if ((*(unsigned int (**)(char *))(*(void *)p_refcount + 40LL))(p_refcount) == a2
        && (*(unsigned int (**)(char *))(*(void *)p_refcount + 48LL))(p_refcount) == a3)
      {
        break;
      }

      if (++v10 >= (*(unsigned int (**)(void))(**(void **)&this[2].meta->OSObject::OSObjectInterface::refcount
                                                           + 72LL))(*(void *)&this[2].meta->OSObject::OSObjectInterface::refcount))
        return v5;
    }

    (*(void (**)(char *, uint64_t))(*(void *)p_refcount + 144LL))(p_refcount, a4);
    uint64_t v5 = (*(uint64_t (**)(char *, uint64_t))(*(void *)p_refcount + 192LL))(p_refcount, 1LL);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(void *)__int16 v14 = 0LL;
      IOService::GetRegistryEntryID(this, (uint64_t *)v14, 0LL);
      uint64_t v12 = *(void *)v14;
      *(_DWORD *)__int16 v14 = 136447490;
      *(void *)&v14[4] = "AppleUserHIDEventDriver.cpp";
      __int16 v15 = 1024;
      int v16 = 351;
      __int16 v17 = 2048;
      uint64_t v18 = v12;
      __int16 v19 = 1024;
      int v20 = a3;
      __int16 v21 = 1024;
      int v22 = a4;
      __int16 v23 = 1024;
      int v24 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%{public}s:%d][0x%llx] Set LED 0x%x: %d 0x%x\n\n",  v14,  0x2Eu);
    }
  }

  return v5;
}

uint64_t sub_100003210(void *a1)
{
  *a1 = off_100004220;
  return 0LL;
}

uint64_t AppleUserUSBHostHIDDeviceMetaClass::New(AppleUserUSBHostHIDDeviceMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100004260;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100004318;
  *(void *)&a2[1].refcount = &off_100004338;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100004368;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100004390;
  return 0LL;
}

uint64_t AppleUserUSBHostHIDDevice::Dispatch(IOUserUSBHostHIDDevice *this, IORPC *a2)
{
  IORPC v3 = *a2;
  return AppleUserUSBHostHIDDevice::_Dispatch(this, &v3);
}

uint64_t AppleUserUSBHostHIDDevice::_Dispatch(IOUserUSBHostHIDDevice *a1, IORPC *a2)
{
  uint64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid == 0x98E715041C459FA5LL)
  {
    IORPC v7 = *a2;
    return IOService::Stop_Invoke(&v7, a1, (IOService::Stop_Handler)AppleUserUSBHostHIDDevice::Stop_Impl);
  }

  else if (msgid == 0xAB6F76DDE6D693F2LL)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, a1, (IOService::Start_Handler)AppleUserUSBHostHIDDevice::Start_Impl);
  }

  else
  {
    IORPC v6 = *a2;
    return IOUserUSBHostHIDDevice::_Dispatch(a1, &v6);
  }
}

uint64_t AppleUserUSBHostHIDDeviceMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_1000033AC(void *a1)
{
  *a1 = off_100004478;
  return 0LL;
}

uint64_t AppleUserHIDEventDriverMetaClass::New(AppleUserHIDEventDriverMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000044B8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100004688;
  *(void *)&a2[1].refcount = &off_1000046A8;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000046F0;
  a2[2].OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100004720;
  a2[2].meta = (OSMetaClass *)off_1000047C0;
  return 0LL;
}

uint64_t AppleUserHIDEventDriver::Dispatch(OSMetaClassBase *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return AppleUserHIDEventDriver::_Dispatch(this, (AppleUserHIDEventDriver *)&v4, a3);
}

uint64_t AppleUserHIDEventDriver::_Dispatch(OSMetaClassBase *this, AppleUserHIDEventDriver *a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(*(IORPCMessageMach **)a2, 0)->msgid;
  switch(msgid)
  {
    case 0x98E715041C459FA5LL:
      *(_OWORD *)&v11.ivars = *(_OWORD *)a2;
      v11.IOHIDEventServiceInterface::__vftable = (IOHIDEventServiceInterface_vtbl *)*((void *)a2 + 2);
      return IOService::Stop_Invoke( (const IORPC *)&v11.ivars,  this,  (IOService::Stop_Handler)AppleUserHIDEventDriver::Stop_Impl);
    case 0xA871AA31861269BALL:
      *(_OWORD *)&v11.IOService::OSObject::OSMetaClassBase::__vftable = *(_OWORD *)a2;
      v11.meta = (OSMetaClass *)*((void *)a2 + 2);
      return IOHIDEventService::SetLEDState_Invoke( &v11,  (IORPC *)this,  (OSMetaClassBase *)AppleUserHIDEventDriver::SetLEDState_Impl,  v6);
    case 0xAB6F76DDE6D693F2LL:
      IORPC rpc = *(IORPC *)a2;
      return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)AppleUserHIDEventDriver::Start_Impl);
    default:
      __int128 v9 = *(_OWORD *)a2;
      uint64_t v10 = *((void *)a2 + 2);
      return AppleUserHIDEventService::_Dispatch((AppleUserHIDEventService *)this, (AppleUserHIDEventService *)&v9, v5);
  }

uint64_t AppleUserHIDEventDriverMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

void sub_100003590()
{
}