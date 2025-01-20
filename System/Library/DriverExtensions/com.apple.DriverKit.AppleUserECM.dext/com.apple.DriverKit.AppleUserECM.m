uint64_t AppleUserECMData::Start_Impl(IOService *this, IOService *a2)
{
  OSMetaClassBase *v4;
  OSMetaClassBase *v5;
  uint64_t v6;
  const IOUSBConfigurationDescriptor *v7;
  AppleUserECMData *v8;
  const IOUSBInterfaceDescriptor *v9;
  BOOL matched;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  const char *v15;
  int v16;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  v16 = 0;
  IOParseBootArgNumber("AppleUserECM-debug", &v16, 4);
  if ((v16 & 1) != 0)
  {
    v13 = 3758097084LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v13;
    }
    *(_DWORD *)buf = 136315650;
    v18 = "AppleUserECMData.cpp";
    v19 = 1024;
    v20 = 61;
    v21 = 2080;
    v22 = "(debugMask & kAppleUserECMDebugDisabled) == 0";
    v15 = "[%s:%d] Assertion failed: %s.  driver disabled via boot-arg; aborting\n\n";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, 0x1Cu);
    return v13;
  }

  v4 = OSMetaClassBase::safeMetaCast(a2, gIOUSBHostInterfaceMetaClass);
  if (!v4)
  {
    v13 = 3758097084LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v13;
    }
    *(_DWORD *)buf = 136315650;
    v18 = "AppleUserECMData.cpp";
    v19 = 1024;
    v20 = 64;
    v21 = 2080;
    v22 = "interface != NULL";
    v15 = "[%s:%d] Assertion failed: %s.  AppleUserECMData failed start. interface == NULL\n\n";
    goto LABEL_16;
  }

  v5 = v4;
  v6 = ((uint64_t (*)(OSMetaClassBase *))v4->__vftable[1].release)(v4);
  if (!v6)
  {
    v13 = 3758097084LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v13;
    }
    *(_DWORD *)buf = 136315650;
    v18 = "AppleUserECMData.cpp";
    v19 = 1024;
    v20 = 67;
    v21 = 2080;
    v22 = "configurationDescriptor != NULL";
    v15 = "[%s:%d] Assertion failed: %s.  AppleUserECMData failed start. configurationDescriptor == NULL\n\n";
    goto LABEL_16;
  }

  v7 = (const IOUSBConfigurationDescriptor *)v6;
  v8 = (AppleUserECMData *)((uint64_t (*)(OSMetaClassBase *, uint64_t))v5->__vftable[1].isEqualTo)(v5, v6);
  if (v8)
  {
    v9 = (const IOUSBInterfaceDescriptor *)v8;
    matched = AppleUserECMData::matchControlInterfaceWithUnionFunctionalDescriptor( v8,  v7,  (const IOUSBInterfaceDescriptor *)v8);
    v11 = matched;
    v12 = AppleUserECMData::matchControlInterfaceWithInterfaceAssociationDescriptor((AppleUserECMData *)matched, v7, v9);
    if (v11 || v12) {
      v13 = IOService::Start(this, a2, (OSDispatchMethod)&IOService::_Dispatch);
    }
    else {
      v13 = 3758097084LL;
    }
  }

  else
  {
    v13 = 3758097084LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "AppleUserECMData.cpp";
      v19 = 1024;
      v20 = 70;
      v21 = 2080;
      v22 = "myInterfaceDescriptor != NULL";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s:%d] Assertion failed: %s.  AppleUserECMData failed start. myInterfaceDescriptor == NULL\n\n",  buf,  0x1Cu);
    }
  }

  IOUSBHostFreeDescriptor(v7);
  return v13;
}

BOOL AppleUserECMData::matchControlInterfaceWithUnionFunctionalDescriptor( AppleUserECMData *this, const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *a3)
{
  InterfaceDescriptor = IOUSBGetNextInterfaceDescriptor(configurationDescriptor, 0LL);
  BOOL v6 = InterfaceDescriptor != 0LL;
  if (InterfaceDescriptor)
  {
    v7 = (const IOUSBDescriptorHeader *)InterfaceDescriptor;
    do
    {
      if (v7[2].bDescriptorType == 2 && v7[3].bLength == 6)
      {
        v8 = configurationDescriptor;
        v9 = v7;
        v10 = 0LL;
        while (1)
        {
          AssociatedDescriptorWithType = IOUSBGetNextAssociatedDescriptorWithType(v8, v9, v10, 0x24u);
          v10 = AssociatedDescriptorWithType;
          if (!AssociatedDescriptorWithType) {
            break;
          }
          if (AssociatedDescriptorWithType->bLength >= 4u && AssociatedDescriptorWithType[1].bLength == 6)
          {
            int bLength = AssociatedDescriptorWithType[2].bLength;
            if (bLength == a3->bInterfaceNumber)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int v13 = v7[1].bLength;
                v15[0] = 67109376;
                v15[1] = bLength;
                __int16 v16 = 1024;
                int v17 = v13;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleUserECMData interface %d belongs to ECM, matched with UNF (%d)\n",  (uint8_t *)v15,  0xEu);
              }

              return v6;
            }
          }

          v8 = configurationDescriptor;
          v9 = v7;
        }
      }

      v7 = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceDescriptor(configurationDescriptor, v7);
      BOOL v6 = v7 != 0LL;
    }

    while (v7);
  }

  return v6;
}

BOOL AppleUserECMData::matchControlInterfaceWithInterfaceAssociationDescriptor( AppleUserECMData *this, const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *a3)
{
  InterfaceAssociationDescriptor = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceAssociationDescriptor( configurationDescriptor,  0LL);
  BOOL v6 = InterfaceAssociationDescriptor != 0LL;
  if (InterfaceAssociationDescriptor)
  {
    while (1)
    {
      if (InterfaceAssociationDescriptor[2].bLength == 2 && InterfaceAssociationDescriptor[2].bDescriptorType == 6)
      {
        int bInterfaceNumber = a3->bInterfaceNumber;
        if (bInterfaceNumber - 1 == InterfaceAssociationDescriptor[1].bLength
          && InterfaceAssociationDescriptor[1].bDescriptorType == 2)
        {
          break;
        }
      }

      InterfaceAssociationDescriptor = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceAssociationDescriptor( configurationDescriptor,  InterfaceAssociationDescriptor);
      BOOL v6 = InterfaceAssociationDescriptor != 0LL;
      if (!InterfaceAssociationDescriptor) {
        return v6;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = bInterfaceNumber;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleUserECMData interface %d belongs to ECM, matched with IAD\n",  (uint8_t *)v9,  8u);
    }
  }

  return v6;
}

uint64_t AppleUserECM::init(AppleUserECM *this)
{
  uint64_t result = IOMallocZeroTyped(344LL, 0x1020040DDC72E4FLL);
  *((void *)this + 9) = result;
  if (result)
  {
    uint64_t result = IOUserNetworkEthernet::init((IOUserNetworkEthernet *)this);
    if ((_DWORD)result)
    {
      IOParseBootArgNumber("AppleUserECM-debug", *((void **)this + 9), 4);
      **((_DWORD **)this + 9) |= 2u;
      *(_DWORD *)(*((void *)this + 9) + 316LL) = 1518;
      *(_WORD *)(*((void *)this + 9) + 324LL) = 12;
      return 1LL;
    }
  }

  return result;
}

uint64_t non-virtual thunk to'AppleUserECM::init(AppleUserECM *this)
{
  return AppleUserECM::init((AppleUserECM *)((char *)this - 24));
}

void AppleUserECM::free(IOUserNetworkEthernet *this)
{
  v2 = *(_BYTE **)&this[1].refcount;
  if (v2)
  {
    if ((*v2 & 8) == 0
      || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
      || (int v3 = 136315394,
          v4 = "AppleUserECM",
          __int16 v5 = 2080,
          BOOL v6 = "free",
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: \n",  (uint8_t *)&v3,  0x16u),  (v2 = *(_BYTE **)&this[1].refcount) != 0LL))
    {
      IOFree(v2, 0x158uLL);
      *(void *)&this[1].refcount = 0LL;
    }
  }

  IOUserNetworkEthernet::free(this);
}

void non-virtual thunk to'AppleUserECM::free(AppleUserECM *this)
{
}

uint64_t AppleUserECM::Start_Impl(IOService *this, IOService *provider)
{
  v38 = 0LL;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  memset(&v37, 0, sizeof(v37));
  v4 = this[1].OSObject::OSObjectInterface::__vftable;
  if (((uint64_t)v4->init & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "AppleUserECM";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Start_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  int init = (int)v4->init;
  if (((uint64_t)v4->init & 1) != 0)
  {
    uint64_t v8 = 3758097131LL;
    if ((init & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "AppleUserECM";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Start_Impl";
      v9 = "%s::%s: driver disabled via boot-arg; aborting\n";
      uint32_t v10 = 22;
LABEL_53:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
      return v8;
    }

    return v8;
  }

  uint64_t v6 = IOService::Start(this, provider, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch);
  v7 = this[1].OSObject::OSObjectInterface::__vftable;
  if ((_DWORD)v6)
  {
    uint64_t v8 = v6;
    if (v7 && ((uint64_t)v7->init & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "AppleUserECM";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Start_Impl";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v8;
      v9 = "%s::%s: Start(provider, SUPERDISPATCH) returned 0x%08x\n";
LABEL_52:
      uint32_t v10 = 28;
      goto LABEL_53;
    }

    return v8;
  }

  uint64_t ActionTxPacketsAvailable = OSObject::CopyDispatchQueue(this, "Default", (IODispatchQueue **)&v7->free, 0LL);
  if ((_DWORD)ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t ActionTxPacketsAvailable = IODispatchQueue::Create( "AppleUserECMRxDispatchQueue",  0LL,  0LL,  (IODispatchQueue **)&this[1].OSObject::OSObjectInterface::__vftable[1]);
  if ((_DWORD)ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t ActionTxPacketsAvailable = OSObject::SetDispatchQueue( this,  "rxDispatchQueue",  (IODispatchQueue *)this[1].OSObject::OSObjectInterface::__vftable[1].init,  0LL);
  if ((_DWORD)ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  this[1].OSObject::OSObjectInterface::__vftable[1].free = (void (__cdecl *)(OSObjectInterface *__hidden))OSMetaClassBase::safeMetaCast(provider, gIOUSBHostInterfaceMetaClass);
  free = this[1].OSObject::OSObjectInterface::__vftable[1].free;
  if (!free)
  {
    uint64_t v8 = 0LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "AppleUserECM.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 247;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "ivars->controlInterface != NULL";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%s:%d] Assertion failed: %s.  provider not an IOUSBHostInterface\n",  buf,  0x1Cu);
      uint64_t v8 = 0LL;
    }

    goto LABEL_48;
  }

  (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)free + 8LL))(free);
  uint64_t DataInterface = AppleUserECM::findDataInterface( (AppleUserECM *)this,  (IOUSBHostInterface *)this[1].OSObject::OSObjectInterface::__vftable[1].free,  (IOUSBHostInterface **)&this[1].OSObject::OSObjectInterface::__vftable[2]);
  if ((_DWORD)DataInterface)
  {
    uint64_t v8 = DataInterface;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 251;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to find dataInterface\n";
    goto LABEL_80;
  }

  uint64_t v14 = IOUSBHostInterface::Open( (IOUSBHostInterface *)this[1].OSObject::OSObjectInterface::__vftable[1].free,  this,  0,  0LL,  0LL);
  if ((_DWORD)v14)
  {
    uint64_t v8 = v14;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 254;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to open our control interface\n";
    goto LABEL_80;
  }

  uint64_t v15 = IOUSBHostInterface::Open( (IOUSBHostInterface *)this[1].OSObject::OSObjectInterface::__vftable[2].init,  this,  0,  0LL,  0LL);
  if ((_DWORD)v15)
  {
    uint64_t v8 = v15;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 257;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to open our data interface\n";
    goto LABEL_80;
  }

  uint64_t v16 = IOUSBHostInterface::SelectAlternateSetting( (IOUSBHostInterface *)this[1].OSObject::OSObjectInterface::__vftable[2].init,  0,  0LL);
  if ((_DWORD)v16)
  {
    uint64_t v8 = v16;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 260;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to select alt setting 0\n\n";
    goto LABEL_80;
  }

  uint64_t v17 = IOUSBHostInterface::SelectAlternateSetting( (IOUSBHostInterface *)this[1].OSObject::OSObjectInterface::__vftable[2].init,  (uint8_t)this[1].OSObject::OSObjectInterface::__vftable[4].init,  0LL);
  if ((_DWORD)v17)
  {
    uint64_t v8 = v17;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    int init_low = LOBYTE(this[1].OSObject::OSObjectInterface::__vftable[4].init);
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 263;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    __int16 v40 = 1024;
    int v41 = init_low;
    v34 = "[%s:%d] Assertion failed: %s.  failed to select alt setting %d\n\n";
    uint32_t v36 = 34;
LABEL_81:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    goto LABEL_47;
  }

  uint64_t ActionTxPacketsAvailable = AppleUserECM::activate((AppleUserECM *)this);
  if ((_DWORD)ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  AppleUserECM::updateEthernetPacketFilter((AppleUserECM *)this);
  uint64_t FunctionalDescriptors = AppleUserECM::getFunctionalDescriptors((AppleUserECM *)this);
  if ((_DWORD)FunctionalDescriptors)
  {
    uint64_t v8 = FunctionalDescriptors;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 273;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to parse functional descriptors\n";
    goto LABEL_80;
  }

  v19 = this[1].OSObject::OSObjectInterface::__vftable;
  if (((uint64_t)v19->init & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = BYTE4(v19[19].init);
    int v21 = BYTE5(v19[19].init);
    int v22 = BYTE6(v19[19].init);
    int init_high = HIBYTE(v19[19].init);
    int free_low = LOBYTE(v19[19].free);
    int v25 = BYTE1(v19[19].free);
    *(_DWORD *)buf = 136316930;
    *(void *)&buf[4] = "AppleUserECM";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Start_Impl";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v20;
    __int16 v40 = 1024;
    int v41 = v21;
    __int16 v42 = 1024;
    int v43 = v22;
    __int16 v44 = 1024;
    int v45 = init_high;
    __int16 v46 = 1024;
    int v47 = free_low;
    __int16 v48 = 1024;
    int v49 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: Calling RegisterEthernetInterface(MAC address = %02x:%02x:%02x:%02x:%02x:%02x\n",  buf,  0x3Au);
    v19 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  v37.packetCount = (uint32_t)v19[21].init;
  v37.bufferCount = v37.packetCount;
  *(void *)&v37.bufferSize = 0x100000800LL;
  v37.poolFlags = 0x10000000;
  uint64_t v26 = IOUserNetworkPacketBufferPool::CreateWithOptions( 0LL,  "AppleUserECM",  &v37,  (IOUserNetworkPacketBufferPool **)&v19[15]);
  if ((_DWORD)v26)
  {
    uint64_t v8 = v26;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 296;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to create our IOUserNetworkPacketBufferPool\n";
    goto LABEL_80;
  }

  uint64_t v27 = IOUserNetworkTxCompletionQueue::Create( (IOUserNetworkPacketBufferPool *)this[1].OSObject::OSObjectInterface::__vftable[15].init,  this,  (uint32_t)this[1].OSObject::OSObjectInterface::__vftable[20].free,  0,  (IODispatchQueue *)this[1].free,  (IOUserNetworkTxCompletionQueue **)&this[1].OSObject::OSObjectInterface::__vftable[16]);
  if ((_DWORD)v27)
  {
    uint64_t v8 = v27;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 306;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to create our IOUserNetworkTxCompletionQueue\n";
    goto LABEL_80;
  }

  uint64_t v28 = IOUserNetworkTxSubmissionQueue::Create( (IOUserNetworkPacketBufferPool *)this[1].OSObject::OSObjectInterface::__vftable[15].init,  this,  (uint32_t)this[1].OSObject::OSObjectInterface::__vftable[20].free,  0,  (IODispatchQueue *)this[1].free,  (IOUserNetworkTxSubmissionQueue **)&this[1].OSObject::OSObjectInterface::__vftable[15].free);
  if ((_DWORD)v28)
  {
    uint64_t v8 = v28;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 314;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to create our IOUserNetworkTxSubmissionQueue\n";
    goto LABEL_80;
  }

  uint64_t ActionTxPacketsAvailable = AppleUserECM::CreateActionTxPacketsAvailable( this,  8uLL,  (OSAction **)&this[1].OSObject::OSObjectInterface::__vftable[17].free);
  if ((_DWORD)ActionTxPacketsAvailable
    || (uint64_t ActionTxPacketsAvailable = (*(uint64_t (**)(void (__cdecl *)(OSObjectInterface *__hidden), IODataQueueDispatchSource **))(*(void *)this[1].OSObject::OSObjectInterface::__vftable[15].free + 72LL))( this[1].OSObject::OSObjectInterface::__vftable[15].free,  &v38),  (_DWORD)ActionTxPacketsAvailable))
  {
LABEL_55:
    uint64_t v8 = ActionTxPacketsAvailable;
    goto LABEL_47;
  }

  uint64_t v8 = IODataQueueDispatchSource::SetDataAvailableHandler( v38,  (OSAction *)this[1].OSObject::OSObjectInterface::__vftable[17].free,  0LL);
  if (v38)
  {
    ((void (*)(IODataQueueDispatchSource *))v38->release)(v38);
    v38 = 0LL;
  }

  if ((_DWORD)v8) {
    goto LABEL_47;
  }
  uint64_t v29 = IOUserNetworkRxSubmissionQueue::Create( (IOUserNetworkPacketBufferPool *)this[1].OSObject::OSObjectInterface::__vftable[15].init,  this,  HIDWORD(this[1].OSObject::OSObjectInterface::__vftable[20].free),  0,  (IODispatchQueue *)this[1].free,  (IOUserNetworkRxSubmissionQueue **)&this[1].OSObject::OSObjectInterface::__vftable[16].free);
  if ((_DWORD)v29)
  {
    uint64_t v8 = v29;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 334;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to create our IOUserNetworkRxSubmissionQueue\n";
    goto LABEL_80;
  }

  uint64_t v30 = IOUserNetworkRxCompletionQueue::Create( (IOUserNetworkPacketBufferPool *)this[1].OSObject::OSObjectInterface::__vftable[15].init,  this,  HIDWORD(this[1].OSObject::OSObjectInterface::__vftable[20].free),  0,  (IODispatchQueue *)this[1].free,  (IOUserNetworkRxCompletionQueue **)&this[1].OSObject::OSObjectInterface::__vftable[17]);
  if ((_DWORD)v30)
  {
    uint64_t v8 = v30;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 342;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "status == kIOReturnSuccess";
    v34 = "[%s:%d] Assertion failed: %s.  failed to create our IOUserNetworkRxCompletionQueue\n";
LABEL_80:
    uint32_t v36 = 28;
    goto LABEL_81;
  }

  uint64_t ActionTxPacketsAvailable = AppleUserECM::CreateActionRxPacketsAvailable( this,  8uLL,  (OSAction **)&this[1].OSObject::OSObjectInterface::__vftable[18]);
  if ((_DWORD)ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t ActionTxPacketsAvailable = (*(uint64_t (**)(void (__cdecl *)(OSObjectInterface *__hidden), IODataQueueDispatchSource **))(*(void *)this[1].OSObject::OSObjectInterface::__vftable[16].free + 72LL))( this[1].OSObject::OSObjectInterface::__vftable[16].free,  &v38);
  if ((_DWORD)ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t v8 = IODataQueueDispatchSource::SetDataAvailableHandler( v38,  (OSAction *)this[1].OSObject::OSObjectInterface::__vftable[18].init,  0LL);
  if (v38)
  {
    ((void (*)(IODataQueueDispatchSource *))v38->release)(v38);
    v38 = 0LL;
  }

  if ((_DWORD)v8) {
    goto LABEL_47;
  }
  *(_OWORD *)buf = xmmword_10000A150;
  *(void *)&buf[16] = 0x10003600100030LL;
  *(_DWORD *)&buf[24] = 1048631;
  uint64_t ActionTxPacketsAvailable = ((uint64_t (*)(IOService *, _BYTE *, uint64_t))this->OSObject::OSMetaClassBase::__vftable[1].release)( this,  buf,  7LL);
  if ((_DWORD)ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t ActionTxPacketsAvailable = IOUserNetworkEthernet::SelectMediaType((IOUserNetworkEthernet *)this, 0x22u, 0LL);
  if ((_DWORD)ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t ActionTxPacketsAvailable = IOUserNetworkEthernet::SetSoftwareVlanSupport((IOUserNetworkEthernet *)this, 1);
  if ((_DWORD)ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  v31 = this[1].OSObject::OSObjectInterface::__vftable;
  __int128 v50 = *(_OWORD *)&v31[15].free;
  __int128 v51 = *(_OWORD *)&v31[16].free;
  uint64_t ActionTxPacketsAvailable = ((uint64_t (*)(IOService *, unint64_t, BOOL (__cdecl *)(OSObjectInterface *__hidden), __int128 *, uint64_t))this->OSObject::OSMetaClassBase::__vftable[1].getMetaClass)( this,  HIDWORD(v31[19].init) | ((unint64_t)LOWORD(v31[19].free) << 32),  v31[15].init,  &v50,  4LL);
  if ((_DWORD)ActionTxPacketsAvailable) {
    goto LABEL_55;
  }
  uint64_t v8 = IOService::RegisterService(this, 0LL);
  if ((_DWORD)v8) {
LABEL_47:
  }
    IOService::Stop(this, provider, 0LL);
LABEL_48:
  v32 = this[1].OSObject::OSObjectInterface::__vftable;
  if (v32 && ((uint64_t)v32->init & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "AppleUserECM";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Start_Impl";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v8;
    v9 = "%s::%s: 0x%08x\n";
    goto LABEL_52;
  }

  return v8;
}

uint64_t AppleUserECM::findDataInterface(AppleUserECM *this, IOUSBHostInterface *a2, IOUSBHostInterface **a3)
{
  interface = 0LL;
  device = 0LL;
  uintptr_t ref = 0LL;
  unsigned __int8 v30 = -1;
  uint64_t v6 = (_BYTE *)*((void *)this + 9);
  if (v6 && (*v6 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "AppleUserECM";
    __int16 v36 = 2080;
    IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
  }

  uint64_t v7 = 3758097136LL;
  if (a3)
  {
    uint64_t v8 = (const IOUSBConfigurationDescriptor *)((uint64_t (*)(IOUSBHostInterface *))a2->CopyConfigurationDescriptor)(a2);
    if (v8)
    {
      uint64_t v9 = ((uint64_t (*)(IOUSBHostInterface *, const IOUSBConfigurationDescriptor *))a2->GetInterfaceDescriptor)( a2,  v8);
      if (v9)
      {
        uint32_t v10 = (const IOUSBDescriptorHeader *)v9;
        *(_BYTE *)(*((void *)this + 9) + 65LL) = *(_BYTE *)(v9 + 2);
        uint64_t v11 = IOUSBHostInterface::CopyDevice(a2, &device, 0LL);
        if ((_DWORD)v11 || (uint64_t v11 = IOUSBHostDevice::CreateInterfaceIterator(device, &ref, 0LL), (_DWORD)v11))
        {
          uint64_t v7 = v11;
        }

        else
        {
          BOOL DataInterfaceWithUnionFunctionalDescriptor = AppleUserECM::findDataInterfaceWithUnionFunctionalDescriptor( this,  v8,  v10,  &v30);
          BOOL DataInterfaceWithInterfaceAssociationDescriptor = AppleUserECM::findDataInterfaceWithInterfaceAssociationDescriptor( this,  v8,  (const IOUSBInterfaceDescriptor *)v10,  &v30);
          if (DataInterfaceWithUnionFunctionalDescriptor || DataInterfaceWithInterfaceAssociationDescriptor)
          {
            uint64_t v7 = IOUSBHostDevice::CopyInterface(device, ref, &interface, 0LL);
            if (!(_DWORD)v7)
            {
              uint64_t v14 = interface;
              if (interface)
              {
                while (1)
                {
                  uint64_t v15 = ((uint64_t (*)(IOUSBHostInterface *, const IOUSBConfigurationDescriptor *))v14->GetInterfaceDescriptor)( v14,  v8);
                  if (v15)
                  {
                    InterfaceDescriptor = (const IOUSBDescriptorHeader *)v15;
                    uint64_t v17 = (_BYTE *)*((void *)this + 9);
                    if (v17)
                    {
                      if ((*v17 & 8) == 0
                        || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
                        || (*(_DWORD *)buf = 136315394,
                            v35 = "AppleUserECM",
                            __int16 v36 = 2080,
                            IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface",
                            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: ----------------------\n",  buf,  0x16u),  (uint64_t v17 = (_BYTE *)*((void *)this + 9)) != 0LL))
                      {
                        if ((*v17 & 8) == 0) {
                          goto LABEL_76;
                        }
                        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_76;
                        }
                        int bLength = InterfaceDescriptor->bLength;
                        *(_DWORD *)buf = 136315650;
                        v35 = "AppleUserECM";
                        __int16 v36 = 2080;
                        IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                        __int16 v38 = 1024;
                        int v39 = bLength;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bLength = 0x%x",  buf,  0x1Cu);
                        uint64_t v17 = (_BYTE *)*((void *)this + 9);
                        if (v17)
                        {
LABEL_76:
                          if ((*v17 & 8) == 0) {
                            goto LABEL_77;
                          }
                          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                            goto LABEL_77;
                          }
                          int bDescriptorType = InterfaceDescriptor->bDescriptorType;
                          *(_DWORD *)buf = 136315650;
                          v35 = "AppleUserECM";
                          __int16 v36 = 2080;
                          IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                          __int16 v38 = 1024;
                          int v39 = bDescriptorType;
                          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bDescriptorType = 0x%x",  buf,  0x1Cu);
                          uint64_t v17 = (_BYTE *)*((void *)this + 9);
                          if (v17)
                          {
LABEL_77:
                            if ((*v17 & 8) == 0) {
                              goto LABEL_78;
                            }
                            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                              goto LABEL_78;
                            }
                            int v20 = InterfaceDescriptor[1].bLength;
                            *(_DWORD *)buf = 136315650;
                            v35 = "AppleUserECM";
                            __int16 v36 = 2080;
                            IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                            __int16 v38 = 1024;
                            int v39 = v20;
                            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bInterfaceNumber = 0x%x",  buf,  0x1Cu);
                            uint64_t v17 = (_BYTE *)*((void *)this + 9);
                            if (v17)
                            {
LABEL_78:
                              if ((*v17 & 8) == 0) {
                                goto LABEL_79;
                              }
                              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                goto LABEL_79;
                              }
                              int v21 = InterfaceDescriptor[1].bDescriptorType;
                              *(_DWORD *)buf = 136315650;
                              v35 = "AppleUserECM";
                              __int16 v36 = 2080;
                              IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                              __int16 v38 = 1024;
                              int v39 = v21;
                              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: bAlternateSetting = 0x%x",  buf,  0x1Cu);
                              uint64_t v17 = (_BYTE *)*((void *)this + 9);
                              if (v17)
                              {
LABEL_79:
                                if ((*v17 & 8) == 0) {
                                  goto LABEL_80;
                                }
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_80;
                                }
                                int v22 = InterfaceDescriptor[2].bLength;
                                *(_DWORD *)buf = 136315650;
                                v35 = "AppleUserECM";
                                __int16 v36 = 2080;
                                IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                                __int16 v38 = 1024;
                                int v39 = v22;
                                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: bNumEndpoints = 0x%x",  buf,  0x1Cu);
                                uint64_t v17 = (_BYTE *)*((void *)this + 9);
                                if (v17)
                                {
LABEL_80:
                                  if ((*v17 & 8) == 0) {
                                    goto LABEL_81;
                                  }
                                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                    goto LABEL_81;
                                  }
                                  int v23 = InterfaceDescriptor[2].bDescriptorType;
                                  *(_DWORD *)buf = 136315650;
                                  v35 = "AppleUserECM";
                                  __int16 v36 = 2080;
                                  IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                                  __int16 v38 = 1024;
                                  int v39 = v23;
                                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: bInterfaceClass = 0x%x",  buf,  0x1Cu);
                                  uint64_t v17 = (_BYTE *)*((void *)this + 9);
                                  if (v17)
                                  {
LABEL_81:
                                    if ((*v17 & 8) == 0) {
                                      goto LABEL_82;
                                    }
                                    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                      goto LABEL_82;
                                    }
                                    int v24 = InterfaceDescriptor[3].bLength;
                                    *(_DWORD *)buf = 136315650;
                                    v35 = "AppleUserECM";
                                    __int16 v36 = 2080;
                                    IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                                    __int16 v38 = 1024;
                                    int v39 = v24;
                                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: bInterfaceSubClass = 0x%x",  buf,  0x1Cu);
                                    uint64_t v17 = (_BYTE *)*((void *)this + 9);
                                    if (v17)
                                    {
LABEL_82:
                                      if ((*v17 & 8) == 0) {
                                        goto LABEL_83;
                                      }
                                      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                        goto LABEL_83;
                                      }
                                      int v25 = InterfaceDescriptor[3].bDescriptorType;
                                      *(_DWORD *)buf = 136315650;
                                      v35 = "AppleUserECM";
                                      __int16 v36 = 2080;
                                      IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                                      __int16 v38 = 1024;
                                      int v39 = v25;
                                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: bInterfaceProtocol = 0x%x",  buf,  0x1Cu);
                                      uint64_t v17 = (_BYTE *)*((void *)this + 9);
                                      if (v17)
                                      {
LABEL_83:
                                        if ((*v17 & 8) != 0
                                          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                        {
                                          int v26 = InterfaceDescriptor[4].bLength;
                                          *(_DWORD *)buf = 136315650;
                                          v35 = "AppleUserECM";
                                          __int16 v36 = 2080;
                                          IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                                          __int16 v38 = 1024;
                                          int v39 = v26;
                                          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: iInterface = 0x%x",  buf,  0x1Cu);
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }

                    if (InterfaceDescriptor[2].bDescriptorType == 10
                      && !InterfaceDescriptor[3].bLength
                      && !InterfaceDescriptor[3].bDescriptorType
                      && InterfaceDescriptor[1].bLength == v30)
                    {
                      break;
                    }
                  }

                  if (interface)
                  {
                    ((void (*)(IOUSBHostInterface *))interface->release)(interface);
                    interface = 0LL;
                  }

                  uint64_t v7 = IOUSBHostDevice::CopyInterface(device, ref, &interface, 0LL);
                  uint64_t v14 = interface;
                  if ((_DWORD)v7) {
                    BOOL v27 = 1;
                  }
                  else {
                    BOOL v27 = interface == 0LL;
                  }
                  if (v27) {
                    goto LABEL_57;
                  }
                }

                *a3 = interface;
                while (InterfaceDescriptor[2].bLength != 2)
                {
                  InterfaceDescriptor = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceDescriptor( v8,  InterfaceDescriptor);
                  if (!InterfaceDescriptor)
                  {
                    uint64_t v7 = 3758097136LL;
                    goto LABEL_57;
                  }
                }

                uint64_t v29 = (_BYTE *)*((void *)this + 9);
                if ((*v29 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v35 = "AppleUserECM";
                  __int16 v36 = 2080;
                  IOUserNetworkPacketBufferPoolOptions v37 = "findDataInterface";
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: alt setting found\n",  buf,  0x16u);
                  uint64_t v29 = (_BYTE *)*((void *)this + 9);
                }

                uint64_t v7 = 0LL;
                v29[64] = InterfaceDescriptor[1].bDescriptorType;
              }
            }

LABEL_57:
            IOUSBHostDevice::DestroyInterfaceIterator(device, ref, 0LL);
          }

          else
          {
            uint64_t v7 = 0LL;
          }
        }
      }
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (device)
  {
    ((void (*)(IOUSBHostDevice *))device->release)(device);
    device = 0LL;
  }

  if (v8) {
    IOUSBHostFreeDescriptor(v8);
  }
  return v7;
}

uint64_t AppleUserECM::activate(AppleUserECM *this)
{
  uint8_t speed = 0;
  uint64_t USBPipe = AppleUserECM::findUSBPipe( this,  *(IOUSBHostInterface **)(*((void *)this + 9) + 32LL),  0,  2,  (IOUSBHostPipe **)(*((void *)this + 9) + 144LL),  (unsigned __int16 *)(*((void *)this + 9) + 152LL));
  if ((_DWORD)USBPipe)
  {
    uint64_t v15 = USBPipe;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 977;
    __int16 v24 = 2080;
    int v25 = "status == kIOReturnSuccess";
    uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to find our tx pipe\n";
    goto LABEL_45;
  }

  uint64_t v3 = IOUSBHostPipe::GetSpeed(*(const IOUSBHostPipe **)(*((void *)this + 9) + 144LL), &speed, 0LL);
  if ((_DWORD)v3)
  {
    uint64_t v15 = v3;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 980;
    __int16 v24 = 2080;
    int v25 = "status == kIOReturnSuccess";
    uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to find speed\n";
    goto LABEL_45;
  }

  unsigned int v4 = speed;
  if (!speed)
  {
    uint64_t v15 = 0LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 981;
    __int16 v24 = 2080;
    int v25 = "speed > kIOUSBHostConnectionSpeedNone";
    v18 = "[%s:%d] Assertion failed: %s.  invalid speed\n";
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v18, buf, 0x1Cu);
    return 0LL;
  }

  if (speed >= 4u)
  {
    unsigned int v4 = 4;
    uint8_t speed = 4;
  }

  __int16 v5 = (_DWORD *)((char *)&unk_10000A160 + 16 * v4);
  *(_DWORD *)(*((void *)this + 9) + 184LL) = *v5;
  *(_DWORD *)(*((void *)this + 9) + 232LL) = v5[1];
  *(_DWORD *)(*((void *)this + 9) + 328LL) = v5[2];
  *(_DWORD *)(*((void *)this + 9) + 332LL) = v5[3];
  *(_DWORD *)(*((void *)this + 9) + 336LL) = *(_DWORD *)(*((void *)this + 9) + 332LL)
                                             + *(_DWORD *)(*((void *)this + 9) + 328LL);
  *(void *)(*((void *)this + 9) + 160LL) = AppleUserECM::allocateUSBPackets( this,  *(IOUSBHostPipe **)(*((void *)this + 9) + 144LL),  *(_DWORD *)(*((void *)this + 9) + 184LL),  2048LL);
  uint64_t v6 = *((void *)this + 9);
  if (!*(void *)(v6 + 160))
  {
    uint64_t v15 = 0LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 995;
    __int16 v24 = 2080;
    int v25 = "ivars->usbTxPackets != NULL";
    v18 = "[%s:%d] Assertion failed: %s.  failed to allocate our tx packets\n";
    goto LABEL_34;
  }

  *(_DWORD *)(v6 + 168) = *(_DWORD *)(v6 + 184);
  uint64_t ActionTxComplete = AppleUserECM::CreateActionTxComplete( (OSObject *)this,  8uLL,  (OSAction **)(*((void *)this + 9) + 176LL));
  if ((_DWORD)ActionTxComplete) {
    return ActionTxComplete;
  }
  uint64_t v8 = AppleUserECM::findUSBPipe( this,  *(IOUSBHostInterface **)(*((void *)this + 9) + 32LL),  1,  2,  (IOUSBHostPipe **)(*((void *)this + 9) + 192LL),  0LL);
  if ((_DWORD)v8)
  {
    uint64_t v15 = v8;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 1004;
    __int16 v24 = 2080;
    int v25 = "status == kIOReturnSuccess";
    uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to find our rx pipe\n";
    goto LABEL_45;
  }

  *(void *)(*((void *)this + 9) + 200LL) = AppleUserECM::allocateUSBPackets( this,  *(IOUSBHostPipe **)(*((void *)this + 9) + 192LL),  *(_DWORD *)(*((void *)this + 9) + 232LL),  2048LL);
  uint64_t v9 = *((void *)this + 9);
  if (!*(void *)(v9 + 200))
  {
    uint64_t v15 = 0LL;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return v15;
    }
    *(_DWORD *)buf = 136315650;
    int v21 = "AppleUserECM.cpp";
    __int16 v22 = 1024;
    int v23 = 1007;
    __int16 v24 = 2080;
    int v25 = "ivars->usbRxPackets != NULL";
    v18 = "[%s:%d] Assertion failed: %s.  failed to allocate our rx packets\n";
    goto LABEL_34;
  }

  *(_DWORD *)(v9 + 216) = *(_DWORD *)(v9 + 232);
  uint64_t ActionTxComplete = AppleUserECM::CreateActionRxComplete( (OSObject *)this,  8uLL,  (OSAction **)(*((void *)this + 9) + 224LL));
  if (!(_DWORD)ActionTxComplete)
  {
    uint64_t v10 = AppleUserECM::findUSBPipe( this,  *(IOUSBHostInterface **)(*((void *)this + 9) + 24LL),  1,  3,  (IOUSBHostPipe **)(*((void *)this + 9) + 72LL),  (unsigned __int16 *)(*((void *)this + 9) + 88LL));
    if ((_DWORD)v10)
    {
      uint64_t v15 = v10;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return v15;
      }
      *(_DWORD *)buf = 136315650;
      int v21 = "AppleUserECM.cpp";
      __int16 v22 = 1024;
      int v23 = 1020;
      __int16 v24 = 2080;
      int v25 = "status == kIOReturnSuccess";
      uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to find our interrupt pipe\n";
    }

    else
    {
      uint64_t v11 = IOTimerDispatchSource::Create( *(IODispatchQueue **)(*((void *)this + 9) + 8LL),  (IOTimerDispatchSource **)(*((void *)this + 9) + 128LL));
      if ((_DWORD)v11)
      {
        uint64_t v15 = v11;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          return v15;
        }
        *(_DWORD *)buf = 136315650;
        int v21 = "AppleUserECM.cpp";
        __int16 v22 = 1024;
        int v23 = 1023;
        __int16 v24 = 2080;
        int v25 = "status == kIOReturnSuccess";
        uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to create interrupt read timer source\n";
      }

      else
      {
        uint64_t TimerOccurred = AppleUserECM::CreateActionInterruptReadTimerOccurred( (OSObject *)this,  8uLL,  (OSAction **)(*((void *)this + 9) + 136LL));
        if ((_DWORD)TimerOccurred)
        {
          uint64_t v15 = TimerOccurred;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            return v15;
          }
          *(_DWORD *)buf = 136315650;
          int v21 = "AppleUserECM.cpp";
          __int16 v22 = 1024;
          int v23 = 1026;
          __int16 v24 = 2080;
          int v25 = "status == kIOReturnSuccess";
          uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to create interrupt read timer action\n";
        }

        else
        {
          uint64_t v13 = IOTimerDispatchSource::SetHandler( *(IOTimerDispatchSource **)(*((void *)this + 9) + 128LL),  *(OSAction **)(*((void *)this + 9) + 136LL),  0LL);
          if ((_DWORD)v13)
          {
            uint64_t v15 = v13;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              return v15;
            }
            *(_DWORD *)buf = 136315650;
            int v21 = "AppleUserECM.cpp";
            __int16 v22 = 1024;
            int v23 = 1029;
            __int16 v24 = 2080;
            int v25 = "status == kIOReturnSuccess";
            uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to set interrupt read timer handler\n";
          }

          else
          {
            uint64_t ActionTxComplete = (*(uint64_t (**)(void, uint64_t, void, uint64_t))(**(void **)(*((void *)this + 9) + 24LL)
                                                                                           + 88LL))( *(void *)(*((void *)this + 9) + 24LL),  1LL,  *(unsigned __int16 *)(*((void *)this + 9) + 88LL),  *((void *)this + 9) + 80LL);
            if ((_DWORD)ActionTxComplete) {
              return ActionTxComplete;
            }
            uint64_t ActionTxComplete = IOMemoryDescriptor::Map( *(IOMemoryDescriptor **)(*((void *)this + 9) + 80LL),  0LL,  0LL,  0LL,  IOVMPageSize,  (uint64_t *)(*((void *)this + 9) + 96LL),  (uint64_t *)(*((void *)this + 9) + 104LL));
            if ((_DWORD)ActionTxComplete) {
              return ActionTxComplete;
            }
            uint64_t ActionTxComplete = AppleUserECM::CreateActionInterruptReadComplete( (OSObject *)this,  8uLL,  (OSAction **)(*((void *)this + 9) + 112LL));
            if ((_DWORD)ActionTxComplete) {
              return ActionTxComplete;
            }
            uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(**(void **)(*((void *)this + 9)
                                                                                             + 24LL)
                                                                               + 88LL))( *(void *)(*((void *)this + 9) + 24LL),  3LL,  1024LL,  *((void *)this + 9) + 40LL);
            if (!(_DWORD)v14) {
              return IOMemoryDescriptor::Map( *(IOMemoryDescriptor **)(*((void *)this + 9) + 40LL),  0LL,  0LL,  0LL,  IOVMPageSize,  (uint64_t *)(*((void *)this + 9) + 48LL),  (uint64_t *)(*((void *)this + 9) + 56LL));
            }
            uint64_t v15 = v14;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              return v15;
            }
            *(_DWORD *)buf = 136315650;
            int v21 = "AppleUserECM.cpp";
            __int16 v22 = 1024;
            int v23 = 1051;
            __int16 v24 = 2080;
            int v25 = "status == kIOReturnSuccess";
            uint64_t v17 = "[%s:%d] Assertion failed: %s.  failed to allocate our device request buffer\n";
          }
        }
      }
    }

LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v17, buf, 0x1Cu);
    return v15;
  }

  return ActionTxComplete;
}

uint64_t AppleUserECM::updateEthernetPacketFilter(AppleUserECM *this)
{
  uint64_t v2 = *((void *)this + 9);
  if (*(_BYTE *)(v2 + 296)) {
    uint64_t v3 = *(unsigned __int16 *)(v2 + 324);
  }
  else {
    uint64_t v3 = 0LL;
  }
  if ((*(_BYTE *)v2 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int16 *)(v2 + 324);
    *(_DWORD *)buf = 136315906;
    uint64_t v9 = "AppleUserECM";
    __int16 v10 = 2080;
    uint64_t v11 = "updateEthernetPacketFilter";
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 1024;
    int v15 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: filter = 0x%04x / 0x%04x\n",  buf,  0x22u);
    uint64_t v2 = *((void *)this + 9);
  }

  uint64_t v5 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void, void, void, void, int))(**(void **)(v2 + 24) + 104LL))( *(void *)(v2 + 24),  33LL,  67LL,  v3,  *(unsigned __int8 *)(v2 + 65),  0LL,  0LL,  0LL,  5000);
  if ((_DWORD)v5)
  {
    uint64_t v6 = (_BYTE *)*((void *)this + 9);
    if (v6)
    {
      if ((*v6 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v9 = "AppleUserECM";
        __int16 v10 = 2080;
        uint64_t v11 = "updateEthernetPacketFilter";
        __int16 v12 = 1024;
        int v13 = v3;
        __int16 v14 = 1024;
        int v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: updateEthernetPacketFilter() for 0x%x failed with 0x%x\n",  buf,  0x22u);
      }
    }
  }

  return v5;
}

uint64_t AppleUserECM::getFunctionalDescriptors(AppleUserECM *this)
{
  uint64_t v2 = *((void *)this + 9);
  if ((*(_BYTE *)v2 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    __int16 v22 = "AppleUserECM";
    __int16 v23 = 2080;
    __int16 v24 = "getFunctionalDescriptors";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: \n",  (uint8_t *)&v21,  0x16u);
    uint64_t v2 = *((void *)this + 9);
  }

  uint64_t v3 = 3758097136LL;
  uint64_t v4 = *(void *)(v2 + 24);
  if (v4)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 56LL))(v4);
    if (v5)
    {
      uint64_t v6 = (const IOUSBConfigurationDescriptor *)v5;
      uint64_t v7 = (const IOUSBDescriptorHeader *)(*(uint64_t (**)(void, uint64_t))(**(void **)(*((void *)this + 9) + 24LL)
                                                                                     + 64LL))( *(void *)(*((void *)this + 9) + 24LL),  v5);
      if (v7)
      {
        uint64_t v8 = v7;
        *(_DWORD *)(*((void *)this + 9) + 320LL) = 0;
        AssociatedDescriptorWithType = IOUSBGetNextAssociatedDescriptorWithType(v6, v7, 0LL, 0x24u);
        if (AssociatedDescriptorWithType)
        {
          __int16 v10 = AssociatedDescriptorWithType;
          while (v10->bLength <= 0xCu || v10[1].bLength != 15)
          {
            __int16 v10 = IOUSBGetNextAssociatedDescriptorWithType(v6, v8, v10, 0x24u);
            if (!v10) {
              goto LABEL_29;
            }
          }

          unsigned int v11 = (unsigned __int16)v10[4];
          uint64_t v12 = *((void *)this + 9);
          if (*(_DWORD *)(v12 + 316) > v11)
          {
            *(_DWORD *)(v12 + 316) = v11;
            uint64_t v12 = *((void *)this + 9);
          }

          *(_DWORD *)(v12 + 320) = (unsigned __int16)v10[5];
          int v13 = (const IOUSBStringDescriptor *)(*(uint64_t (**)(void, void))(**(void **)(*((void *)this + 9) + 24LL)
                                                                                         + 80LL))( *(void *)(*((void *)this + 9) + 24LL),  v10[1].bDescriptorType);
          if (v13)
          {
            if (v13->bLength < 3u)
            {
LABEL_27:
              uint64_t v3 = 0LL;
              goto LABEL_28;
            }

            uint64_t v14 = 0LL;
            int v15 = 0;
            while (1)
            {
              int v16 = v13->bString[v14];
              char v17 = v16 - 48;
              if ((v16 - 48) >= 0xA)
              {
                if ((v16 - 97) > 5)
                {
                  if ((v16 - 65) > 5)
                  {
                    uint64_t v3 = 3758096385LL;
LABEL_28:
                    IOUSBHostFreeDescriptor(v13);
                    break;
                  }

                  char v17 = v16 - 55;
                }

                else
                {
                  char v17 = v16 - 87;
                }
              }

              if ((v14 & 2) != 0)
              {
                uint64_t v19 = *((void *)this + 9) + v15++;
                char v18 = *(_BYTE *)(v19 + 308) | v17;
              }

              else
              {
                char v18 = 16 * v17;
                uint64_t v19 = *((void *)this + 9) + v15;
              }

              *(_BYTE *)(v19 + 308) = v18;
              v14 += 2LL;
              if (v14 >= v13->bLength - 2LL) {
                goto LABEL_27;
              }
            }
          }
        }
      }

LABEL_29:
      IOUSBHostFreeDescriptor(v6);
    }
  }

  return v3;
}

uint64_t AppleUserECM::reportMediaCapabilities(AppleUserECM *this)
{
  __int128 v2 = xmmword_10000A150;
  uint64_t v3 = 0x10003600100030LL;
  int v4 = 1048631;
  return (*(uint64_t (**)(AppleUserECM *, __int128 *, uint64_t))(*(void *)this + 72LL))(this, &v2, 7LL);
}

uint64_t AppleUserECM::Stop_Impl(IOService *this, IOService *provider)
{
  int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  if (v4 && ((uint64_t)v4->init & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "AppleUserECM";
    __int16 v23 = 2080;
    __int16 v24 = "Stop_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  if (LOBYTE(v4[18].free)) {
    sub_100009D38();
  }
  int init = (IOUSBHostInterface *)v4[2].init;
  if (init)
  {
    IOUSBHostInterface::Close(init, this, 0, 0LL);
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  free = (IOUSBHostInterface *)v4[1].free;
  if (free)
  {
    IOUSBHostInterface::Close(free, this, 0, 0LL);
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  uint64_t v7 = (IODispatchQueue *)v4[1].init;
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100005FF8;
    block[3] = &unk_10000C288;
    block[4] = this;
    IODispatchQueue::DispatchSync(v7, block);
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  uint64_t v8 = v4[17].init;
  if (v8)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v8 + 16LL))(v8);
    this[1].OSObject::OSObjectInterface::__vftable[17].int init = 0LL;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  uint64_t v9 = v4[16].free;
  if (v9)
  {
    (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v9 + 16LL))(v9);
    this[1].OSObject::OSObjectInterface::__vftable[16].free = 0LL;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  __int16 v10 = v4[16].init;
  if (v10)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v10 + 16LL))(v10);
    this[1].OSObject::OSObjectInterface::__vftable[16].int init = 0LL;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  unsigned int v11 = v4[15].free;
  if (v11)
  {
    (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v11 + 16LL))(v11);
    this[1].OSObject::OSObjectInterface::__vftable[15].free = 0LL;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  uint64_t v12 = v4[18].init;
  if (v12)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v12 + 16LL))(v12);
    this[1].OSObject::OSObjectInterface::__vftable[18].int init = 0LL;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  int v13 = v4[17].free;
  if (v13)
  {
    (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v13 + 16LL))(v13);
    this[1].OSObject::OSObjectInterface::__vftable[17].free = 0LL;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  uint64_t v14 = v4[15].init;
  if (v14)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v14 + 16LL))(v14);
    this[1].OSObject::OSObjectInterface::__vftable[15].int init = 0LL;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  int v15 = v4[1].free;
  if (v15)
  {
    (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v15 + 16LL))(v15);
    this[1].OSObject::OSObjectInterface::__vftable[1].free = 0LL;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  int v16 = v4[2].init;
  if (v16)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v16 + 16LL))(v16);
    this[1].OSObject::OSObjectInterface::__vftable[2].int init = 0LL;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  char v17 = v4[1].init;
  if (v17)
  {
    (*(void (**)(BOOL (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v17 + 16LL))(v17);
    this[1].OSObject::OSObjectInterface::__vftable[1].int init = 0LL;
    int v4 = this[1].OSObject::OSObjectInterface::__vftable;
  }

  char v18 = v4->free;
  if (v18)
  {
    (*(void (**)(void (__cdecl *)(OSObjectInterface *__hidden)))(*(void *)v18 + 16LL))(v18);
    this[1].free = 0LL;
  }

  return IOService::Stop(this, provider, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch);
}

uint64_t sub_100005FF8(uint64_t a1)
{
  return AppleUserECM::deactivate(*(AppleUserECM **)(a1 + 32));
}

uint64_t AppleUserECM::deactivate(AppleUserECM *this)
{
  uint64_t v2 = *((void *)this + 9);
  uint64_t v3 = *(IODispatchSource **)(v2 + 128);
  if (v3)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_10000870C;
    handler[3] = &unk_10000C368;
    handler[4] = this;
    IODispatchSource::Cancel(v3, handler, 0LL);
    uint64_t v2 = *((void *)this + 9);
  }

  uint64_t v4 = *(void *)(v2 + 136);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 16LL))(v4);
    *(void *)(*((void *)this + 9) + 136LL) = 0LL;
    uint64_t v2 = *((void *)this + 9);
  }

  uint64_t v5 = *(void *)(v2 + 72);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 16LL))(v5);
    *(void *)(*((void *)this + 9) + 72LL) = 0LL;
    uint64_t v2 = *((void *)this + 9);
  }

  uint64_t v6 = *(void *)(v2 + 112);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 16LL))(v6);
    *(void *)(*((void *)this + 9) + 112LL) = 0LL;
    uint64_t v2 = *((void *)this + 9);
  }

  uint64_t v7 = *(void *)(v2 + 80);
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 16LL))(v7);
    *(void *)(*((void *)this + 9) + 80LL) = 0LL;
    uint64_t v2 = *((void *)this + 9);
  }

  *(_BYTE *)(v2 + 120) = 0;
  uint64_t v8 = *((void *)this + 9);
  uint64_t v9 = *(void *)(v8 + 192);
  if (v9)
  {
    (*(void (**)(uint64_t))(*(void *)v9 + 16LL))(v9);
    *(void *)(*((void *)this + 9) + 192LL) = 0LL;
    uint64_t v8 = *((void *)this + 9);
  }

  uint64_t v10 = *(void *)(v8 + 224);
  if (v10)
  {
    (*(void (**)(uint64_t))(*(void *)v10 + 16LL))(v10);
    *(void *)(*((void *)this + 9) + 224LL) = 0LL;
    uint64_t v8 = *((void *)this + 9);
  }

  AppleUserECM::freeUSBPackets(this, *(void **)(v8 + 200), *(_DWORD *)(v8 + 232));
  *(void *)(*((void *)this + 9) + 200LL) = 0LL;
  *(_DWORD *)(*((void *)this + 9) + 212LL) = 0;
  *(_DWORD *)(*((void *)this + 9) + 208LL) = 0;
  uint64_t v11 = *((void *)this + 9);
  uint64_t v12 = *(void *)(v11 + 144);
  if (v12)
  {
    (*(void (**)(uint64_t))(*(void *)v12 + 16LL))(v12);
    *(void *)(*((void *)this + 9) + 144LL) = 0LL;
    uint64_t v11 = *((void *)this + 9);
  }

  uint64_t v13 = *(void *)(v11 + 176);
  if (v13)
  {
    (*(void (**)(uint64_t))(*(void *)v13 + 16LL))(v13);
    *(void *)(*((void *)this + 9) + 176LL) = 0LL;
    uint64_t v11 = *((void *)this + 9);
  }

  AppleUserECM::freeUSBPackets(this, *(void **)(v11 + 160), *(_DWORD *)(v11 + 184));
  *(void *)(*((void *)this + 9) + 160LL) = 0LL;
  *(_DWORD *)(*((void *)this + 9) + 172LL) = 0;
  uint64_t result = *(void *)(*((void *)this + 9) + 40LL);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16LL))(result);
    *(void *)(*((void *)this + 9) + 40LL) = 0LL;
  }

  return result;
}

uint64_t AppleUserECM::SetInterfaceEnable_Impl(AppleUserECM *this, uint64_t a2)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  int v14 = 0;
  uint64_t v4 = *((void *)this + 9);
  if ((*(_BYTE *)v4 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v16 = "AppleUserECM";
    __int16 v17 = 2080;
    char v18 = "SetInterfaceEnable_Impl";
    __int16 v19 = 1024;
    int v20 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: isEnable %d\n",  buf,  0x1Cu);
    uint64_t v4 = *((void *)this + 9);
  }

  uint64_t v5 = *(IODispatchQueue **)(v4 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 1107296256LL;
  block[2] = sub_1000063DC;
  block[3] = &unk_10000C2A8;
  char v10 = a2;
  block[4] = &v11;
  void block[5] = this;
  IODispatchQueue::DispatchSync(v5, block);
  uint64_t v6 = (_BYTE *)*((void *)this + 9);
  if (v6 && (*v6 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *((_DWORD *)v12 + 6);
    *(_DWORD *)buf = 136315650;
    int v16 = "AppleUserECM";
    __int16 v17 = 2080;
    char v18 = "SetInterfaceEnable_Impl";
    __int16 v19 = 1024;
    int v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: 0x%08x\n",  buf,  0x1Cu);
  }

  if ((_DWORD)a2) {
    a2 = *((unsigned int *)v12 + 6);
  }
  else {
    *((_DWORD *)v12 + 6) = 0;
  }
  ++qword_100010000;
  _Block_object_dispose(&v11, 8);
  return a2;
}

uint64_t sub_1000063DC(uint64_t a1)
{
  v1 = *(AppleUserECM **)(a1 + 40);
  if (!*(_BYTE *)(a1 + 48)) {
    goto LABEL_12;
  }
  *(_BYTE *)(*((void *)v1 + 9) + 296LL) = 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = AppleUserECM::updateEthernetPacketFilter(v1);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_12;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = IOUserNetworkPacketQueue::SetEnable( *(IOUserNetworkPacketQueue **)(*((void *)v1 + 9)
                                                                                               + 248LL),
                                                                  1,
                                                                  0LL);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_12;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = IOUserNetworkPacketQueue::SetEnable( *(IOUserNetworkPacketQueue **)(*((void *)v1 + 9)
                                                                                               + 256LL),
                                                                  1,
                                                                  0LL);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_12;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = IOUserNetworkPacketQueue::SetEnable( *(IOUserNetworkPacketQueue **)(*((void *)v1 + 9)
                                                                                               + 264LL),
                                                                  1,
                                                                  0LL);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_12;
  }
  uint64_t v3 = *((void *)v1 + 9);
  if ((*(_BYTE *)v3 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);
    int v6 = 136315650;
    int v7 = "AppleUserECM";
    __int16 v8 = 2080;
    uint64_t v9 = "SetInterfaceEnable_Impl_block_invoke";
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: rxCompletionQueue isEnable %d\n",  (uint8_t *)&v6,  0x1Cu);
    uint64_t v3 = *((void *)v1 + 9);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = IOUserNetworkPacketQueue::SetEnable( *(IOUserNetworkPacketQueue **)(v3 + 272),  1,  0LL);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)
    || (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = IOUserNetworkEthernet::SelectMediaType( (IOUserNetworkEthernet *)v1,  0x20u,  0LL)) != 0 || (uint64_t result = AppleUserECM::readInterruptPipe(v1),  (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result) != 0))
  {
LABEL_12:
    *(_BYTE *)(*((void *)v1 + 9) + 296LL) = 0;
    AppleUserECM::updateEthernetPacketFilter(v1);
    IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9) + 248LL), 0, 0LL);
    IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9) + 256LL), 0, 0LL);
    IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9) + 264LL), 0, 0LL);
    return IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(*((void *)v1 + 9) + 272LL), 0, 0LL);
  }

  return result;
}

uint64_t AppleUserECM::readInterruptPipe(AppleUserECM *this)
{
  uint64_t v2 = *((void *)this + 9);
  if ((*(_BYTE *)v2 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "AppleUserECM";
    __int16 v6 = 2080;
    int v7 = "readInterruptPipe";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: \n",  (uint8_t *)&v4,  0x16u);
    uint64_t v2 = *((void *)this + 9);
  }

  if (*(_BYTE *)(v2 + 120)) {
    return 0LL;
  }
  bzero(*(void **)(v2 + 96), *(void *)(v2 + 104));
  uint64_t result = IOUSBHostPipe::AsyncIO( *(IOUSBHostPipe **)(*((void *)this + 9) + 72LL),  *(IOMemoryDescriptor **)(*((void *)this + 9) + 80LL),  *(_DWORD *)(*((void *)this + 9) + 104LL),  *(OSAction **)(*((void *)this + 9) + 112LL),  0,  0LL);
  if ((_DWORD)result == -536850432)
  {
    IOUSBHostPipe::ClearStall(*(IOUSBHostPipe **)(*((void *)this + 9) + 72LL), 1, 0LL);
    uint64_t result = IOUSBHostPipe::AsyncIO( *(IOUSBHostPipe **)(*((void *)this + 9) + 72LL),  *(IOMemoryDescriptor **)(*((void *)this + 9) + 80LL),  *(_DWORD *)(*((void *)this + 9) + 104LL),  *(OSAction **)(*((void *)this + 9) + 112LL),  0,  0LL);
  }

  *(_BYTE *)(*((void *)this + 9) + 120LL) = (_DWORD)result == 0;
  return result;
}

void sub_1000067B0(uint64_t a1, uint64_t a2)
{
}

void sub_1000067C0(uint64_t a1)
{
}

uint64_t AppleUserECM::SetPromiscuousModeEnable_Impl(AppleUserECM *this, __int16 a2)
{
  uint64_t v9 = 0LL;
  __int16 v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  int v12 = -536870198;
  int v4 = (_BYTE *)*((void *)this + 9);
  if (v4 && (*v4 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v14 = "AppleUserECM";
    __int16 v15 = 2080;
    int v16 = "SetPromiscuousModeEnable_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
  }

  *(_WORD *)(*((void *)this + 9) + 324LL) = *(_WORD *)(*((void *)this + 9) + 324LL) & 0xFFFE | a2;
  uint64_t v5 = *(IODispatchQueue **)(*((void *)this + 9) + 16LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256LL;
  v8[2] = sub_10000692C;
  v8[3] = &unk_10000C2D8;
  v8[4] = &v9;
  v8[5] = this;
  IODispatchQueue::DispatchSync(v5, v8);
  uint64_t v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t sub_10000692C(uint64_t a1)
{
  uint64_t result = AppleUserECM::updateEthernetPacketFilter(*(AppleUserECM **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t AppleUserECM::SetAllMulticastModeEnable_Impl(AppleUserECM *this, int a2)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  int v13 = -536870198;
  int v4 = (_BYTE *)*((void *)this + 9);
  if (v4 && (*v4 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "AppleUserECM";
    __int16 v16 = 2080;
    __int16 v17 = "SetAllMulticastModeEnable_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
  }

  if (a2) {
    __int16 v5 = 2;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)(*((void *)this + 9) + 324LL) = *(_WORD *)(*((void *)this + 9) + 324LL) & 0xFFFD | v5;
  uint64_t v6 = *(IODispatchQueue **)(*((void *)this + 9) + 16LL);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256LL;
  _DWORD v9[2] = sub_100006AC8;
  v9[3] = &unk_10000C308;
  v9[4] = &v10;
  v9[5] = this;
  IODispatchQueue::DispatchSync(v6, v9);
  uint64_t v7 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t sub_100006AC8(uint64_t a1)
{
  uint64_t result = AppleUserECM::updateEthernetPacketFilter(*(AppleUserECM **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t AppleUserECM::setMulticastAddresses(AppleUserECM *this, const ether_addr *__src, unsigned int a3)
{
  uint64_t v15 = 0LL;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  int v18 = -536870201;
  unsigned __int16 v14 = 0;
  uint64_t v6 = *((void *)this + 9);
  if ((*(_BYTE *)v6 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v20 = "AppleUserECM";
    __int16 v21 = 2080;
    __int16 v22 = "setMulticastAddresses";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    uint64_t v6 = *((void *)this + 9);
  }

  if ((*(_DWORD *)(v6 + 320) & 0x8000) == 0 && (*(_DWORD *)(v6 + 320) & 0x7FFFu) >= a3)
  {
    if (!a3)
    {
      *(_WORD *)(v6 + 324) &= ~0x10u;
      goto LABEL_12;
    }

    unint64_t v7 = 2LL * ((3 * (_WORD)a3) & 0x7FFF);
    if (*(void *)(v6 + 56) >= v7)
    {
      memcpy(*(void **)(v6 + 48), __src, 2LL * ((3 * (_WORD)a3) & 0x7FFF));
      int v8 = (*(uint64_t (**)(void, uint64_t, uint64_t, void, void, uint64_t, void, unsigned __int16 *, int))(**(void **)(*((void *)this + 9) + 24LL) + 104LL))( *(void *)(*((void *)this + 9) + 24LL),  33LL,  64LL,  (unsigned __int16)a3,  *(unsigned __int8 *)(*((void *)this + 9) + 65LL),  2LL * ((3 * (_WORD)a3) & 0x7FFF),  *(void *)(*((void *)this + 9) + 40LL),  &v14,  5000);
      uint64_t v9 = v16;
      *((_DWORD *)v16 + 6) = v8;
      if (v14 != (_DWORD)v7)
      {
        *((_DWORD *)v9 + 6) = -536870198;
        goto LABEL_14;
      }

      if (!v8)
      {
        *(_WORD *)(*((void *)this + 9) + 324LL) |= 0x10u;
LABEL_12:
        uint64_t v10 = *(IODispatchQueue **)(*((void *)this + 9) + 16LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 1107296256LL;
        block[2] = sub_100006D10;
        block[3] = &unk_10000C338;
        block[4] = &v15;
        void block[5] = this;
        IODispatchQueue::DispatchSync(v10, block);
      }
    }
  }

LABEL_14:
  uint64_t v11 = *((unsigned int *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t sub_100006D10(uint64_t a1)
{
  uint64_t result = AppleUserECM::updateEthernetPacketFilter(*(AppleUserECM **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t non-virtual thunk to'AppleUserECM::setMulticastAddresses( AppleUserECM *this, const ether_addr *a2, unsigned int a3)
{
  return AppleUserECM::setMulticastAddresses((AppleUserECM *)((char *)this - 48), a2, a3);
}

uint64_t AppleUserECM::SelectMediaType_Impl(AppleUserECM *this, int a2)
{
  uint64_t v4 = *((void *)this + 9);
  if ((*(_BYTE *)v4 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "AppleUserECM";
    __int16 v9 = 2080;
    uint64_t v10 = "SelectMediaType_Impl";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: \n",  (uint8_t *)&v7,  0x16u);
    uint64_t v4 = *((void *)this + 9);
  }

  *(_DWORD *)(v4 + 304) = a2;
  *(_DWORD *)(*((void *)this + 9) + 300LL) = 1;
  *(_BYTE *)(*((void *)this + 9) + 297LL) = 0;
  uint64_t v5 = *((void *)this + 9);
  if ((*(_DWORD *)(v5 + 304) | 2) != 0x22) {
    return 3758097095LL;
  }
  (*(void (**)(AppleUserECM *, void))(*(void *)this + 128LL))(this, *(unsigned int *)(v5 + 300));
  return 0LL;
}

uint64_t AppleUserECM::TxPacketsAvailable_Impl(AppleUserECM *this, OSAction *a2)
{
  uint64_t v3 = (_BYTE *)*((void *)this + 9);
  if ((*v3 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v6 = "AppleUserECM";
    __int16 v7 = 2080;
    int v8 = "TxPacketsAvailable_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    uint64_t v3 = (_BYTE *)*((void *)this + 9);
  }

  if (v3[296]) {
    return AppleUserECM::handleTxPacketsAvailable(this);
  }
  else {
    return IOLog( "AppleUserECM::TxPacketsAvailable() called with isEnabledCounter=%lld and isEnabled=false\n",  qword_100010000);
  }
}

uint64_t AppleUserECM::handleTxPacketsAvailable(AppleUserECM *this)
{
  kern_return_t v14;
  kern_return_t v15;
  uint32_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  unsigned int v21;
  _BYTE *v22;
  unsigned int v23;
  uint32_t ioTransferAcceptedCount;
  uint8_t v25[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  kern_return_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  _OWORD v35[32];
  memset(v35, 0, sizeof(v35));
  uint64_t v2 = *((void *)this + 9);
  uint64_t v3 = *(void *)(v2 + 160);
  signed int v4 = *(_DWORD *)(v2 + 172);
  ioTransferAcceptedCount = 0;
  if ((*(_BYTE *)v2 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "AppleUserECM";
    v33 = 2080;
    v34 = "handleTxPacketsAvailable";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    uint64_t v2 = *((void *)this + 9);
  }

  uint64_t result = (*(uint64_t (**)(void, _OWORD *, void))(**(void **)(v2 + 248) + 104LL))( *(void *)(v2 + 248),  v35,  (*(_DWORD *)(v2 + 168) / 2));
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t v6 = 0LL;
  uint32_t v7 = 0;
  __int16 v23 = result;
  uint64_t v8 = result - 1LL;
  while (1)
  {
    unsigned int v9 = (*(uint64_t (**)(void))(**((void **)v35 + v6) + 224LL))(*((void *)v35 + v6));
    uint64_t v10 = (*(uint64_t (**)(void))(**((void **)v35 + v6) + 184LL))(*((void *)v35 + v6));
    unsigned __int8 v11 = (*(uint64_t (**)(void))(**((void **)v35 + v6) + 240LL))(*((void *)v35 + v6));
    memcpy(*(void **)(v3 + 24LL * v4 + 8), (const void *)(v10 + v11), v9);
    *(_DWORD *)&buf[4 * v7] = v9;
    uint64_t v12 = *((void *)this + 9);
    if (!(v9 % *(unsigned __int16 *)(v12 + 152)))
    {
      ++v7;
      ++v4;
      *(_DWORD *)&buf[4 * v7] = 0;
    }

    ++v7;
    if (v8 != v6 && v7 < 0xF)
    {
      unsigned int v13 = *(_DWORD *)(v12 + 184);
      if (v4 + 1 < v13) {
        unsigned int v13 = 0;
      }
      signed int v4 = v4 + 1 - v13;
      goto LABEL_19;
    }

    ioTransferAcceptedCount = 0;
    unsigned __int16 v14 = IOUSBHostPipe::AsyncIOBundled( *(IOUSBHostPipe **)(v12 + 144),  *(_DWORD *)(v12 + 172),  v7,  &ioTransferAcceptedCount,  (const unsigned int *)buf,  v7,  *(OSAction **)(v12 + 176),  0,  0LL);
    uint64_t v15 = v14;
    __int16 v16 = ioTransferAcceptedCount;
    *(_DWORD *)(*((void *)this + 9) + 168LL) -= ioTransferAcceptedCount;
    *(_DWORD *)(*((void *)this + 9) + 172LL) += v16;
    uint64_t v17 = *((void *)this + 9);
    int v18 = *(_DWORD *)(v17 + 172);
    __int16 v19 = *(_DWORD *)(v17 + 184);
    int v20 = v18 >= v19;
    __int16 v21 = v18 - v19;
    if (v20) {
      *(_DWORD *)(v17 + 172) = v21;
    }
    if (v14) {
      break;
    }
    if (v8 == v6) {
      return (*(uint64_t (**)(void, _OWORD *, void))(**(void **)(*((void *)this + 9) + 256LL) + 88LL))( *(void *)(*((void *)this + 9) + 256LL),  v35,  v23);
    }
    uint32_t v7 = 0;
    signed int v4 = *(_DWORD *)(*((void *)this + 9) + 172LL);
LABEL_19:
    ++v6;
  }

  __int16 v22 = (_BYTE *)*((void *)this + 9);
  if (v22 && (*v22 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v25 = 136315650;
    int v26 = "AppleUserECM";
    BOOL v27 = 2080;
    uint64_t v28 = "handleTxPacketsAvailable";
    uint64_t v29 = 1024;
    unsigned __int8 v30 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: Error on AsyncIOBundled = 0x%08x\n",  v25,  0x1Cu);
  }

  return (*(uint64_t (**)(void, _OWORD *, void))(**(void **)(*((void *)this + 9) + 256LL) + 88LL))( *(void *)(*((void *)this + 9) + 256LL),  v35,  v23);
}

void AppleUserECM::RxPacketsAvailable_Impl(AppleUserECM *this, OSAction *a2)
{
  uint64_t v3 = (_BYTE *)*((void *)this + 9);
  if ((*v3 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "AppleUserECM";
    __int16 v6 = 2080;
    uint32_t v7 = "RxPacketsAvailable_Impl";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: \n",  (uint8_t *)&v4,  0x16u);
    uint64_t v3 = (_BYTE *)*((void *)this + 9);
  }

  if (v3[296]) {
    AppleUserECM::handleRxPacketsAvailable(this);
  }
}

void AppleUserECM::handleRxPacketsAvailable(AppleUserECM *this)
{
  kern_return_t v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;
  BOOL v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v2 = *((void *)this + 9);
  int v3 = *(_DWORD *)(v2 + 216);
  if ((*(_BYTE *)v2 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned __int16 v14 = "AppleUserECM";
    uint64_t v15 = 2080;
    __int16 v16 = "handleRxPacketsAvailable";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
  }

  if (v3)
  {
    do
    {
      if (v3 >= 16) {
        uint32_t v4 = 16;
      }
      else {
        uint32_t v4 = v3;
      }
      *(_DWORD *)buf = 0;
      uint64_t v5 = IOUSBHostPipe::AsyncIOBundled( *(IOUSBHostPipe **)(*((void *)this + 9) + 192LL),  *(_DWORD *)(*((void *)this + 9) + 208LL),  v4,  (uint32_t *)buf,  dword_10000A1B0,  v4,  *(OSAction **)(*((void *)this + 9) + 224LL),  0,  0LL);
      __int16 v6 = *(_DWORD *)buf;
      *(_DWORD *)(*((void *)this + 9) + 216LL) -= *(_DWORD *)buf;
      *(_DWORD *)(*((void *)this + 9) + 208LL) += v6;
      uint32_t v7 = *((void *)this + 9);
      uint64_t v8 = *(_DWORD *)(v7 + 208);
      unsigned int v9 = *(_DWORD *)(v7 + 232);
      uint64_t v10 = v8 >= v9;
      unsigned __int8 v11 = v8 - v9;
      if (v10) {
        *(_DWORD *)(v7 + 208) = v11;
      }
      v3 -= v4;
      if (v5) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v3 == 0;
      }
    }

    while (!v12);
  }
}

void AppleUserECM::TxComplete_Impl( AppleUserECM *this, OSAction *a2, unsigned int a3, int a4, const unsigned int *a5, int a6, const int *a7)
{
  uint64_t v9 = *((void *)this + 9);
  if ((*(_BYTE *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(_DWORD *)(v9 + 168);
    int v11 = 136315650;
    uint64_t v12 = "AppleUserECM";
    __int16 v13 = 2080;
    unsigned __int16 v14 = "TxComplete_Impl";
    __int16 v15 = 1024;
    int v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: usbTxPacketsAvailable %d\n",  (uint8_t *)&v11,  0x1Cu);
    uint64_t v9 = *((void *)this + 9);
  }

  *(_DWORD *)(v9 + 168) += a4;
  if (*(_BYTE *)(*((void *)this + 9) + 296LL)) {
    AppleUserECM::handleTxPacketsAvailable(this);
  }
}

void AppleUserECM::RxComplete_Impl( AppleUserECM *this, OSAction *a2, unsigned int a3, int a4, const unsigned int *a5, int a6, const int *a7)
{
  LODWORD(v9) = a4;
  memset(v33, 0, sizeof(v33));
  uint64_t v11 = *((void *)this + 9);
  int v12 = *(_DWORD *)(v11 + 212);
  if ((*(_BYTE *)v11 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned __int8 v30 = "AppleUserECM";
    __int16 v31 = 2080;
    v32 = "RxComplete_Impl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s::%s: \n", buf, 0x16u);
    uint64_t v11 = *((void *)this + 9);
  }

  if (*(_BYTE *)(v11 + 296))
  {
    uint64_t v13 = 0LL;
    if ((_DWORD)v9)
    {
      unsigned __int16 v14 = a7;
      __int16 v15 = a5;
      uint64_t v16 = v9;
      do
      {
        if (!*v14++)
        {
          if (*v15) {
            uint64_t v13 = (v13 + 1);
          }
          else {
            uint64_t v13 = v13;
          }
        }

        ++v15;
        --v16;
      }

      while (v16);
    }

    uint64_t v18 = (*(uint64_t (**)(void, _OWORD *, uint64_t))(**(void **)(v11 + 264) + 104LL))( *(void *)(v11 + 264),  v33,  v13);
    if ((_DWORD)v9)
    {
      signed int v19 = 0;
      int v28 = v9;
      uint64_t v9 = v9;
      do
      {
        if (*a5)
        {
          BOOL v20 = *a7 || v19 >= v18;
          if (!v20)
          {
            (*(void (**)(void, void))(**((void **)v33 + v19) + 232LL))(*((void *)v33 + v19), 0LL);
            (*(void (**)(void, void))(**((void **)v33 + v19) + 216LL))(*((void *)v33 + v19), *a5);
            __int16 v21 = (void *)(*(uint64_t (**)(void))(**((void **)v33 + v19) + 184LL))(*((void *)v33 + v19));
            ++v19;
            uint64_t v22 = *(void *)(*((void *)this + 9) + 200LL) + 24LL * v12;
            memcpy(v21, *(const void **)(v22 + 8), *a5);
            (*(void (**)(AppleUserECM *, void, void))(*(void *)this + 384LL))( this,  *(void *)(v22 + 8),  *a5);
          }
        }

        uint64_t v23 = *((void *)this + 9);
        if (v12 + 1 == *(_DWORD *)(v23 + 232)) {
          int v12 = 0;
        }
        else {
          ++v12;
        }
        ++a7;
        ++a5;
        --v9;
      }

      while (v9);
      LODWORD(v9) = v28;
    }

    else
    {
      uint64_t v23 = *((void *)this + 9);
    }

    *(_DWORD *)(v23 + 212) = v12;
    *(_DWORD *)(*((void *)this + 9) + 216LL) += v9;
    (*(void (**)(void, _OWORD *, uint64_t))(**(void **)(*((void *)this + 9) + 272LL) + 88LL))( *(void *)(*((void *)this + 9) + 272LL),  v33,  v18);
  }

  else
  {
    *(_DWORD *)(v11 + 216) += v9;
    *(_DWORD *)(*((void *)this + 9) + 212LL) += v9;
    uint64_t v24 = *((void *)this + 9);
    unsigned int v25 = *(_DWORD *)(v24 + 212);
    unsigned int v26 = *(_DWORD *)(v24 + 232);
    BOOL v20 = v25 >= v26;
    unsigned int v27 = v25 - v26;
    if (v20) {
      *(_DWORD *)(v24 + 212) = v27;
    }
  }

void AppleUserECM::InterruptReadComplete_Impl( AppleUserECM *this, OSAction *a2, kern_return_t a3, unsigned int a4)
{
  kern_return_t v8;
  uint64_t v9;
  uint64_t v10;
  kern_return_t v11;
  int v12;
  kern_return_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint32_t v17;
  __uint64_t v18;
  kern_return_t v19;
  _BYTE *v20;
  kern_return_t v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  BOOL v30;
  int v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  kern_return_t v36;
  __int16 v37;
  kern_return_t v38;
  __int16 v39;
  unsigned int v40;
  uint32_t v7 = (_BYTE *)*((void *)this + 9);
  if ((*v7 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7[296];
    __int16 v31 = 136316162;
    v32 = "AppleUserECM";
    v33 = 2080;
    v34 = "InterruptReadComplete_Impl";
    v35 = 1024;
    __int16 v36 = v8;
    IOUserNetworkPacketBufferPoolOptions v37 = 1024;
    __int16 v38 = a3;
    int v39 = 1024;
    __int16 v40 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: isEnabled %d, status 0x%x, actualByteCount %d\n",  (uint8_t *)&v31,  0x28u);
    uint32_t v7 = (_BYTE *)*((void *)this + 9);
  }

  v7[120] = 0;
  uint64_t v9 = *((void *)this + 9);
  if (*(_BYTE *)(v9 + 296))
  {
    if (a3 == -536870186 || a3 == -536870165)
    {
      if ((*(_BYTE *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v31 = 136315394;
        v32 = "AppleUserECM";
        v33 = 2080;
        v34 = "InterruptReadComplete_Impl";
        uint64_t v16 = "%s::%s: kIOReturnTimeout or kIOReturnAborted\n";
        uint64_t v17 = 22;
LABEL_31:
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v16,  (uint8_t *)&v31,  v17);
      }
    }

    else
    {
      if (!a3)
      {
        if (a4 >= 8)
        {
          int v10 = *(void *)(v9 + 96);
          if (*(_BYTE *)(v10 + 1) == 42)
          {
            if ((*(_BYTE *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v31 = 136315394;
              v32 = "AppleUserECM";
              v33 = 2080;
              v34 = "InterruptReadComplete_Impl";
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: kUSBCDCNotificationTypeConnectionSpeedChange\n",  (uint8_t *)&v31,  0x16u);
            }

            if (a4 >= 0x10 && *(unsigned __int16 *)(v10 + 6) >= 8u)
            {
              uint64_t v22 = *(_DWORD *)(v10 + 12);
              if (*(_DWORD *)(v10 + 8) > v22) {
                uint64_t v22 = *(_DWORD *)(v10 + 8);
              }
              uint64_t v23 = 1048630;
              uint64_t v24 = 1048624;
              unsigned int v25 = 1048614;
              if (v22 <= 0x98967F) {
                unsigned int v26 = 34;
              }
              else {
                unsigned int v26 = 1048611;
              }
              if (v22 <= 0x5F5E0FF) {
                unsigned int v25 = v26;
              }
              if (v22 <= 0x3B9AC9FF) {
                uint64_t v24 = v25;
              }
              if (v22 <= 0x9502F8FF) {
                uint64_t v23 = v24;
              }
              if (v22 == 705032704) {
                unsigned int v27 = 1048631;
              }
              else {
                unsigned int v27 = v23;
              }
              int v28 = *((void *)this + 9);
              if (v27 != *(_DWORD *)(v28 + 304))
              {
                uint64_t v29 = *(_DWORD *)(v28 + 300);
                if (v29 == 1 || (v27 != 34 ? (unsigned __int8 v30 = v29 == 3) : (unsigned __int8 v30 = 0), v30))
                {
                  (*(void (**)(AppleUserECM *))(*(void *)this + 128LL))(this);
                  int v28 = *((void *)this + 9);
                }

                *(_DWORD *)(v28 + 304) = v27;
              }
            }
          }

          else if (!*(_BYTE *)(v10 + 1))
          {
            if ((*(_BYTE *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v11 = *(unsigned __int16 *)(v10 + 2);
              __int16 v31 = 136315650;
              v32 = "AppleUserECM";
              v33 = 2080;
              v34 = "InterruptReadComplete_Impl";
              v35 = 1024;
              __int16 v36 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: kUSBCDCNotificationTypeNetworkConnection %u\n",  (uint8_t *)&v31,  0x1Cu);
              uint64_t v9 = *((void *)this + 9);
            }

            int v12 = *(unsigned __int16 *)(v10 + 2);
            uint64_t v13 = *(_WORD *)(v10 + 2) != 0;
            if (*(unsigned __int8 *)(v9 + 297) != v13)
            {
              if ((*(_BYTE *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v31 = 136315650;
                v32 = "AppleUserECM";
                v33 = 2080;
                v34 = "InterruptReadComplete_Impl";
                v35 = 1024;
                __int16 v36 = v13;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: Link state change: 0x%02x\n",  (uint8_t *)&v31,  0x1Cu);
                uint64_t v9 = *((void *)this + 9);
              }

              if (v12) {
                unsigned __int16 v14 = 3LL;
              }
              else {
                unsigned __int16 v14 = 1LL;
              }
              __int16 v15 = *(unsigned int *)(v9 + 304);
              if (!v12 || (_DWORD)v15 != 34)
              {
                (*(void (**)(AppleUserECM *, uint64_t, uint64_t))(*(void *)this + 128LL))(this, v14, v15);
                uint64_t v9 = *((void *)this + 9);
              }

              *(_DWORD *)(v9 + 300) = v14;
              *(_BYTE *)(*((void *)this + 9) + 297LL) = v13;
            }
          }
        }

        goto LABEL_32;
      }

      if ((*(_BYTE *)v9 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v31 = 136315650;
        v32 = "AppleUserECM";
        v33 = 2080;
        v34 = "InterruptReadComplete_Impl";
        v35 = 1024;
        __int16 v36 = a3;
        uint64_t v16 = "%s::%s: Unknown status 0x%08x on Interrupt pipe\n";
        uint64_t v17 = 28;
        goto LABEL_31;
      }
    }

LABEL_32:
    uint64_t v18 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    signed int v19 = IOTimerDispatchSource::WakeAtTime( *(IOTimerDispatchSource **)(*((void *)this + 9) + 128LL),  0x88uLL,  v18 + 100000000,  0LL,  0LL);
    if (v19)
    {
      BOOL v20 = (_BYTE *)*((void *)this + 9);
      if (v20)
      {
        if ((*v20 & 2) != 0)
        {
          __int16 v21 = v19;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v31 = 136315650;
            v32 = "AppleUserECM";
            v33 = 2080;
            v34 = "InterruptReadComplete_Impl";
            v35 = 1024;
            __int16 v36 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: error setting interrupt read timer 0x%08x\n",  (uint8_t *)&v31,  0x1Cu);
          }
        }
      }
    }
  }

uint64_t AppleUserECM::findUSBPipe( AppleUserECM *this, IOUSBHostInterface *a2, int a3, int a4, IOUSBHostPipe **a5, unsigned __int16 *a6)
{
  int v12 = (_BYTE *)*((void *)this + 9);
  if (v12 && (*v12 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136315394;
    v34 = "AppleUserECM";
    __int16 v35 = 2080;
    __int16 v36 = "findUSBPipe";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: \n",  (uint8_t *)&v33,  0x16u);
  }

  uint64_t v13 = 3758097136LL;
  uint64_t v14 = ((uint64_t (*)(IOUSBHostInterface *))a2->CopyConfigurationDescriptor)(a2);
  if (v14)
  {
    __int16 v15 = (const IOUSBConfigurationDescriptor *)v14;
    uint64_t v16 = ((uint64_t (*)(IOUSBHostInterface *, uint64_t))a2->GetInterfaceDescriptor)(a2, v14);
    if (v16)
    {
      uint64_t v17 = (const IOUSBInterfaceDescriptor *)v16;
      uint64_t v18 = (_BYTE *)*((void *)this + 9);
      if (v18)
      {
        if ((*v18 & 8) == 0
          || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
          || (int v33 = 136315394,
              v34 = "AppleUserECM",
              __int16 v35 = 2080,
              __int16 v36 = "findUSBPipe",
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: ----------------------\n",  (uint8_t *)&v33,  0x16u),  (uint64_t v18 = (_BYTE *)*((void *)this + 9)) != 0LL))
        {
          if ((*v18 & 8) == 0) {
            goto LABEL_51;
          }
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_51;
          }
          int bLength = v17->bLength;
          int v33 = 136315650;
          v34 = "AppleUserECM";
          __int16 v35 = 2080;
          __int16 v36 = "findUSBPipe";
          __int16 v37 = 1024;
          int v38 = bLength;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bLength = 0x%x",  (uint8_t *)&v33,  0x1Cu);
          uint64_t v18 = (_BYTE *)*((void *)this + 9);
          if (v18)
          {
LABEL_51:
            if ((*v18 & 8) == 0) {
              goto LABEL_52;
            }
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_52;
            }
            int bDescriptorType = v17->bDescriptorType;
            int v33 = 136315650;
            v34 = "AppleUserECM";
            __int16 v35 = 2080;
            __int16 v36 = "findUSBPipe";
            __int16 v37 = 1024;
            int v38 = bDescriptorType;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bDescriptorType = 0x%x",  (uint8_t *)&v33,  0x1Cu);
            uint64_t v18 = (_BYTE *)*((void *)this + 9);
            if (v18)
            {
LABEL_52:
              if ((*v18 & 8) == 0) {
                goto LABEL_53;
              }
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_53;
              }
              int bInterfaceNumber = v17->bInterfaceNumber;
              int v33 = 136315650;
              v34 = "AppleUserECM";
              __int16 v35 = 2080;
              __int16 v36 = "findUSBPipe";
              __int16 v37 = 1024;
              int v38 = bInterfaceNumber;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bInterfaceNumber = 0x%x",  (uint8_t *)&v33,  0x1Cu);
              uint64_t v18 = (_BYTE *)*((void *)this + 9);
              if (v18)
              {
LABEL_53:
                if ((*v18 & 8) == 0) {
                  goto LABEL_54;
                }
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_54;
                }
                int bAlternateSetting = v17->bAlternateSetting;
                int v33 = 136315650;
                v34 = "AppleUserECM";
                __int16 v35 = 2080;
                __int16 v36 = "findUSBPipe";
                __int16 v37 = 1024;
                int v38 = bAlternateSetting;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bAlternateSetting = 0x%x",  (uint8_t *)&v33,  0x1Cu);
                uint64_t v18 = (_BYTE *)*((void *)this + 9);
                if (v18)
                {
LABEL_54:
                  if ((*v18 & 8) == 0) {
                    goto LABEL_55;
                  }
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_55;
                  }
                  int bNumEndpoints = v17->bNumEndpoints;
                  int v33 = 136315650;
                  v34 = "AppleUserECM";
                  __int16 v35 = 2080;
                  __int16 v36 = "findUSBPipe";
                  __int16 v37 = 1024;
                  int v38 = bNumEndpoints;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bNumEndpoints = 0x%x",  (uint8_t *)&v33,  0x1Cu);
                  uint64_t v18 = (_BYTE *)*((void *)this + 9);
                  if (v18)
                  {
LABEL_55:
                    if ((*v18 & 8) == 0) {
                      goto LABEL_56;
                    }
                    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_56;
                    }
                    int bInterfaceClass = v17->bInterfaceClass;
                    int v33 = 136315650;
                    v34 = "AppleUserECM";
                    __int16 v35 = 2080;
                    __int16 v36 = "findUSBPipe";
                    __int16 v37 = 1024;
                    int v38 = bInterfaceClass;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bInterfaceClass = 0x%x",  (uint8_t *)&v33,  0x1Cu);
                    uint64_t v18 = (_BYTE *)*((void *)this + 9);
                    if (v18)
                    {
LABEL_56:
                      if ((*v18 & 8) == 0) {
                        goto LABEL_57;
                      }
                      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_57;
                      }
                      int bInterfaceSubClass = v17->bInterfaceSubClass;
                      int v33 = 136315650;
                      v34 = "AppleUserECM";
                      __int16 v35 = 2080;
                      __int16 v36 = "findUSBPipe";
                      __int16 v37 = 1024;
                      int v38 = bInterfaceSubClass;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bInterfaceSubClass = 0x%x",  (uint8_t *)&v33,  0x1Cu);
                      uint64_t v18 = (_BYTE *)*((void *)this + 9);
                      if (v18)
                      {
LABEL_57:
                        if ((*v18 & 8) == 0) {
                          goto LABEL_58;
                        }
                        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_58;
                        }
                        int bInterfaceProtocol = v17->bInterfaceProtocol;
                        int v33 = 136315650;
                        v34 = "AppleUserECM";
                        __int16 v35 = 2080;
                        __int16 v36 = "findUSBPipe";
                        __int16 v37 = 1024;
                        int v38 = bInterfaceProtocol;
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int bInterfaceProtocol = 0x%x",  (uint8_t *)&v33,  0x1Cu);
                        uint64_t v18 = (_BYTE *)*((void *)this + 9);
                        if (v18)
                        {
LABEL_58:
                          if ((*v18 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                          {
                            int iInterface = v17->iInterface;
                            int v33 = 136315650;
                            v34 = "AppleUserECM";
                            __int16 v35 = 2080;
                            __int16 v36 = "findUSBPipe";
                            __int16 v37 = 1024;
                            int v38 = iInterface;
                            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: int iInterface = 0x%x",  (uint8_t *)&v33,  0x1Cu);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      EndpointDescriptor = IOUSBGetNextEndpointDescriptor(v15, v17, 0LL);
      if (EndpointDescriptor)
      {
        uint64_t v29 = EndpointDescriptor;
        int v30 = a3 << 7;
        while (1)
        {
          if ((v29->bmAttributes & 3) == a4)
          {
            uint8_t bEndpointAddress = v29->bEndpointAddress;
          }

          uint64_t v29 = IOUSBGetNextEndpointDescriptor(v15, v17, (const IOUSBDescriptorHeader *)v29);
          if (!v29) {
            goto LABEL_47;
          }
        }

        if (a6) {
          *a6 = v29->wMaxPacketSize;
        }
        uint64_t v13 = IOUSBHostInterface::CopyPipe(a2, bEndpointAddress, a5, 0LL);
      }
    }

LABEL_47:
    IOUSBHostFreeDescriptor(v15);
  }

  return v13;
}

void *AppleUserECM::allocateUSBPackets(AppleUserECM *this, IOUSBHostPipe *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = (_BYTE *)*((void *)this + 9);
  if (v8 && (*v8 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    uint64_t v14 = "AppleUserECM";
    __int16 v15 = 2080;
    uint64_t v16 = "allocateUSBPackets";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: \n",  (uint8_t *)&v13,  0x16u);
  }

  uint64_t v9 = (void *)IOMallocZeroTyped(24LL * a3, 0x102004024DAA5DELL);
  if (!v9 || IOUSBHostPipe::CreateMemoryDescriptorRing(a2, a3, 0LL))
  {
LABEL_15:
    AppleUserECM::freeUSBPackets(this, v9, a3);
    return 0LL;
  }

  if (a3)
  {
    uint64_t v10 = 0LL;
    for (i = v9;
          !(*(unsigned int (**)(void, uint64_t, uint64_t, void *))(**(void **)(*((void *)this + 9)
                                                                                            + 32LL)
                                                                              + 88LL))( *(void *)(*((void *)this + 9) + 32LL),  3LL,  a4,  i);
          i += 3)
    {
      if (!*i) {
        return v9;
      }
      if (IOMemoryDescriptor::Map((IOMemoryDescriptor *)*i, 0LL, 0LL, 0LL, IOVMPageSize, i + 1, i + 2)
        || IOUSBHostPipe::SetMemoryDescriptor(a2, (IOMemoryDescriptor *)*i, v10, 0LL))
      {
        break;
      }

      if (a3 == ++v10) {
        return v9;
      }
    }

    goto LABEL_15;
  }

  return v9;
}

uint64_t sub_10000870C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(*(void *)(v1 + 72) + 128LL);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16LL))(result);
    *(void *)(*(void *)(v1 + 72) + 128LL) = 0LL;
  }

  return result;
}

void AppleUserECM::freeUSBPackets(AppleUserECM *this, void *address, unsigned int a3)
{
  uint64_t v5 = (_BYTE *)*((void *)this + 9);
  if (v5 && (*v5 & 8) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "AppleUserECM";
    __int16 v11 = 2080;
    int v12 = "freeUSBPackets";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: \n",  (uint8_t *)&v9,  0x16u);
  }

  if (address)
  {
    if (a3)
    {
      uint64_t v6 = a3;
      uint32_t v7 = address;
      do
      {
        if (*v7)
        {
          (*(void (**)(void))(*(void *)*v7 + 16LL))(*v7);
          void *v7 = 0LL;
        }

        v7 += 3;
        --v6;
      }

      while (v6);
      size_t v8 = 24LL * a3;
    }

    else
    {
      size_t v8 = 0LL;
    }

    IOFree(address, v8);
  }

BOOL AppleUserECM::findDataInterfaceWithUnionFunctionalDescriptor( AppleUserECM *this, const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *parentDescriptor, unsigned __int8 *a4)
{
  AssociatedDescriptorWithType = IOUSBGetNextAssociatedDescriptorWithType( configurationDescriptor,  parentDescriptor,  0LL,  0x24u);
  BOOL v9 = AssociatedDescriptorWithType != 0LL;
  if (AssociatedDescriptorWithType)
  {
    while (AssociatedDescriptorWithType->bLength < 4u || AssociatedDescriptorWithType[1].bLength != 6)
    {
      AssociatedDescriptorWithType = IOUSBGetNextAssociatedDescriptorWithType( configurationDescriptor,  parentDescriptor,  AssociatedDescriptorWithType,  0x24u);
      BOOL v9 = AssociatedDescriptorWithType != 0LL;
      if (!AssociatedDescriptorWithType) {
        return v9;
      }
    }

    int bLength = AssociatedDescriptorWithType[2].bLength;
    *a4 = bLength;
    int v12 = (_BYTE *)*((void *)this + 9);
    if (v12 && (*v12 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = parentDescriptor[1].bLength;
      int v14 = 136315906;
      __int16 v15 = "AppleUserECM";
      __int16 v16 = 2080;
      uint64_t v17 = "findDataInterfaceWithUnionFunctionalDescriptor";
      __int16 v18 = 1024;
      int v19 = v13;
      __int16 v20 = 1024;
      int v21 = bLength;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: AppleUserECM interface %d found suitable UNF (%d)\n",  (uint8_t *)&v14,  0x22u);
    }
  }

  return v9;
}

BOOL AppleUserECM::findDataInterfaceWithInterfaceAssociationDescriptor( AppleUserECM *this, const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *a3, unsigned __int8 *a4)
{
  InterfaceAssociationDescriptor = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceAssociationDescriptor( configurationDescriptor,  0LL);
  BOOL v9 = InterfaceAssociationDescriptor != 0LL;
  if (InterfaceAssociationDescriptor)
  {
    while (1)
    {
      if (InterfaceAssociationDescriptor[2].bLength == 2 && InterfaceAssociationDescriptor[2].bDescriptorType == 6)
      {
        int bLength = InterfaceAssociationDescriptor[1].bLength;
        if (bLength == a3->bInterfaceNumber && InterfaceAssociationDescriptor[1].bDescriptorType == 2) {
          break;
        }
      }

      InterfaceAssociationDescriptor = (const IOUSBDescriptorHeader *)IOUSBGetNextInterfaceAssociationDescriptor( configurationDescriptor,  InterfaceAssociationDescriptor);
      BOOL v9 = InterfaceAssociationDescriptor != 0LL;
      if (!InterfaceAssociationDescriptor) {
        return v9;
      }
    }

    *a4 = bLength + 1;
    int v12 = (_BYTE *)*((void *)this + 9);
    if (v12 && (*v12 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int bInterfaceNumber = a3->bInterfaceNumber;
      int v14 = 136315650;
      __int16 v15 = "AppleUserECM";
      __int16 v16 = 2080;
      uint64_t v17 = "findDataInterfaceWithInterfaceAssociationDescriptor";
      __int16 v18 = 1024;
      int v19 = bInterfaceNumber;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s::%s: AppleUserECM interface %d found suitable IAD\n",  (uint8_t *)&v14,  0x1Cu);
    }
  }

  return v9;
}

void AppleUserECM::printPacket(AppleUserECM *this, unsigned __int8 *a2, int a3)
{
  if ((**((_BYTE **)this + 9) & 4) != 0) {
    IOLogBuffer("AppleUserECM::printPacket", a2, a3);
  }
}

void non-virtual thunk to'AppleUserECM::printPacket(AppleUserECM *this, unsigned __int8 *a2, int a3)
{
  if ((**((_BYTE **)this + 1) & 4) != 0) {
    IOLogBuffer("AppleUserECM::printPacket", a2, a3);
  }
}

uint64_t sub_100008B80(void *a1)
{
  *a1 = off_10000C438;
  return 0LL;
}

uint64_t AppleUserECMDataMetaClass::New(AppleUserECMDataMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000C478;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000C4C0;
  return 0LL;
}

uint64_t AppleUserECMData::Dispatch(IOService *this, IORPC *a2)
{
  IORPC v3 = *a2;
  return AppleUserECMData::_Dispatch(this, &v3);
}

uint64_t AppleUserECMData::_Dispatch(IOService *a1, IORPC *a2)
{
  if (IORPCMessageFromMach(a2->message, 0)->msgid == 0xAB6F76DDE6D693F2LL)
  {
    IORPC rpc = *a2;
    return IOService::Start_Invoke(&rpc, a1, (IOService::Start_Handler)AppleUserECMData::Start_Impl);
  }

  else
  {
    IORPC v5 = *a2;
    return IOService::_Dispatch(a1, &v5);
  }

uint64_t AppleUserECMDataMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100008CC4(void *a1)
{
  *a1 = off_10000C940;
  return 0LL;
}

uint64_t AppleUserECMMetaClass::New(AppleUserECMMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000C980;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_10000CB18;
  *(void *)&a2[1].refcount = &off_10000CB38;
  a2[1].OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CC90;
  return 0LL;
}

uint64_t AppleUserECM::Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return AppleUserECM::_Dispatch(this, &v4, a3);
}

uint64_t AppleUserECM::_Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  int64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid <= 0x18F06319DAB994C1LL)
  {
    if (msgid > (uint64_t)0xE042A87972611224LL)
    {
      switch(msgid)
      {
        case 0xE042A87972611225LL:
          if (!OSMetaClassBase::IsRemote(this))
          {
            IORPC v37 = *a2;
            return IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke( &v37,  this,  (IOUserNetworkEthernet::SetAllMulticastModeEnable_Handler)AppleUserECM::SetAllMulticastModeEnable_Impl);
          }

          __int128 v38 = *(_OWORD *)&a2->message;
          uint64_t v39 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v38;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        case 0xE072FCC26CF639ACLL:
          if (!OSMetaClassBase::IsRemote(this))
          {
            IORPC v40 = *a2;
            return IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke( &v40,  this,  (IOUserNetworkEthernet::SetPromiscuousModeEnable_Handler)AppleUserECM::SetPromiscuousModeEnable_Impl);
          }

          __int128 v41 = *(_OWORD *)&a2->message;
          uint64_t v42 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v41;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        case 0xF421A9D80F9A1FDALL:
          if (!OSMetaClassBase::IsRemote(this))
          {
            IORPC v43 = *a2;
            return IOUserNetworkEthernet::SetInterfaceEnable_Invoke( &v43,  this,  (IOUserNetworkEthernet::SetInterfaceEnable_Handler)AppleUserECM::SetInterfaceEnable_Impl);
          }

          __int128 v44 = *(_OWORD *)&a2->message;
          uint64_t v45 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v44;
          return OSMetaClassBase::Dispatch(this, p_invoke);
      }
    }

    else
    {
      switch(msgid)
      {
        case 0x98E715041C459FA5LL:
          IORPC rpc = *a2;
          return IOService::Stop_Invoke(&rpc, this, (IOService::Stop_Handler)AppleUserECM::Stop_Impl);
        case 0xAB6F76DDE6D693F2LL:
          IORPC v47 = *a2;
          return IOService::Start_Invoke(&v47, this, (IOService::Start_Handler)AppleUserECM::Start_Impl);
        case 0xC3E63AC546EBD1FELL:
          if (!OSMetaClassBase::IsRemote(this))
          {
            IORPC v34 = *a2;
            return IOUserNetworkEthernet::SelectMediaType_Invoke( &v34,  this,  (IOUserNetworkEthernet::SelectMediaType_Handler)AppleUserECM::SelectMediaType_Impl);
          }

          __int128 v35 = *(_OWORD *)&a2->message;
          uint64_t v36 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v35;
          return OSMetaClassBase::Dispatch(this, p_invoke);
      }
    }

LABEL_40:
    IORPC v14 = *a2;
    return IOUserNetworkEthernet::_Dispatch(this, &v14);
  }

  if (msgid <= 0x49B96B1A38AA6597LL)
  {
    if (msgid == 0x18F06319DAB994C2LL)
    {
      if (!OSMetaClassBase::IsRemote(this))
      {
        IORPC v15 = *a2;
        return IOTimerDispatchSource::TimerOccurred_Invoke( &v15,  this,  (IOTimerDispatchSource::TimerOccurred_Handler)AppleUserECM::InterruptReadTimerOccurred_Impl,  (const OSMetaClass *)gOSAction_AppleUserECM_InterruptReadTimerOccurredMetaClass);
      }

      __int128 v16 = *(_OWORD *)&a2->message;
      uint64_t v17 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v16;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }

    if (msgid != 0x1A87CDD6BE193E74LL)
    {
      if (msgid != 0x39F9B9387C35AD11LL) {
        goto LABEL_40;
      }
      if (OSMetaClassBase::IsRemote(this))
      {
        __int128 v22 = *(_OWORD *)&a2->message;
        uint64_t v23 = *(void *)&a2->sendSize;
        p_IORPC invoke = (IORPC *)&v22;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      }

      __int128 v20 = *(_OWORD *)&a2->message;
      uint64_t v21 = *(void *)&a2->sendSize;
      size_t v8 = (const OSMetaClass *)gOSAction_AppleUserECM_RxCompleteMetaClass;
      BOOL v9 = AppleUserECM::RxComplete_Impl;
      uint64_t v10 = (IORPC *)&v20;
      return IOUSBHostPipe::CompleteAsyncIOBundled_Invoke( v10,  this,  (IOUSBHostPipe::CompleteAsyncIOBundled_Handler)v9,  v8);
    }

    if (OSMetaClassBase::IsRemote(this))
    {
      __int128 v28 = *(_OWORD *)&a2->message;
      uint64_t v29 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v28;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }

    IORPC v27 = *a2;
    __int16 v11 = (const OSMetaClass *)gOSAction_AppleUserECM_RxPacketsAvailableMetaClass;
    int v12 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))AppleUserECM::RxPacketsAvailable_Impl;
    int v13 = &v27;
    return IODataQueueDispatchSource::DataAvailable_Invoke(v13, this, v12, v11);
  }

  if (msgid == 0x49B96B1A38AA6598LL)
  {
    if (OSMetaClassBase::IsRemote(this))
    {
      __int128 v25 = *(_OWORD *)&a2->message;
      uint64_t v26 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v25;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }

    IORPC v24 = *a2;
    size_t v8 = (const OSMetaClass *)gOSAction_AppleUserECM_TxCompleteMetaClass;
    BOOL v9 = AppleUserECM::TxComplete_Impl;
    uint64_t v10 = &v24;
    return IOUSBHostPipe::CompleteAsyncIOBundled_Invoke( v10,  this,  (IOUSBHostPipe::CompleteAsyncIOBundled_Handler)v9,  v8);
  }

  if (msgid != 0x6D29AF5C0FF1913ALL)
  {
    if (msgid != 0x720B4D3E4DAE28B5LL) {
      goto LABEL_40;
    }
    if (OSMetaClassBase::IsRemote(this))
    {
      __int128 v32 = *(_OWORD *)&a2->message;
      uint64_t v33 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v32;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }

    __int128 v30 = *(_OWORD *)&a2->message;
    uint64_t v31 = *(void *)&a2->sendSize;
    __int16 v11 = (const OSMetaClass *)gOSAction_AppleUserECM_TxPacketsAvailableMetaClass;
    int v12 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))AppleUserECM::TxPacketsAvailable_Impl;
    int v13 = (IORPC *)&v30;
    return IODataQueueDispatchSource::DataAvailable_Invoke(v13, this, v12, v11);
  }

  if (!OSMetaClassBase::IsRemote(this))
  {
    IORPC v18 = *a2;
    return IOUSBHostPipe::CompleteAsyncIO_Invoke( &v18,  this,  (IOUSBHostPipe::CompleteAsyncIO_Handler)AppleUserECM::InterruptReadComplete_Impl,  (const OSMetaClass *)gOSAction_AppleUserECM_InterruptReadCompleteMetaClass);
  }

  IORPC invoke = *a2;
  p_IORPC invoke = &invoke;
  return OSMetaClassBase::Dispatch(this, p_invoke);
}

uint64_t AppleUserECMMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t AppleUserECM::CreateActionTxPacketsAvailable(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_TxPacketsAvailable");
  if (!v6) {
    return 3758097085LL;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x720B4D3E4DAE28B5uLL, 0xF799C876BAF566F3LL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t AppleUserECM::CreateActionRxPacketsAvailable(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_RxPacketsAvailable");
  if (!v6) {
    return 3758097085LL;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x1A87CDD6BE193E74uLL, 0xF799C876BAF566F3LL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t AppleUserECM::CreateActionTxComplete(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_TxComplete");
  if (!v6) {
    return 3758097085LL;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x49B96B1A38AA6598uLL, 0xDD0623CAA00A3C04LL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t AppleUserECM::CreateActionRxComplete(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_RxComplete");
  if (!v6) {
    return 3758097085LL;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x39F9B9387C35AD11uLL, 0xDD0623CAA00A3C04LL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t AppleUserECM::CreateActionInterruptReadComplete(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_InterruptReadComplete");
  if (!v6) {
    return 3758097085LL;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x6D29AF5C0FF1913AuLL, 0xC320A3EEA932C04ALL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t AppleUserECM::CreateActionInterruptReadTimerOccurred(OSObject *this, size_t a2, OSAction **a3)
{
  uint64_t v6 = OSString::withCString("OSAction_AppleUserECM_InterruptReadTimerOccurred");
  if (!v6) {
    return 3758097085LL;
  }
  uint32_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x18F06319DAB994C2uLL, 0xF4AB1C3CBB5AE47uLL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t sub_100009648(void *a1)
{
  *a1 = off_10000CCA8;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_TxPacketsAvailableMetaClass::New( OSAction_AppleUserECM_TxPacketsAvailableMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CCE8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CD30;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_TxPacketsAvailable::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_TxPacketsAvailable::_Dispatch( OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_TxPacketsAvailableMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100009764(void *a1)
{
  *a1 = off_10000CD50;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_RxPacketsAvailableMetaClass::New( OSAction_AppleUserECM_RxPacketsAvailableMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CD90;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CDD8;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_RxPacketsAvailable::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_RxPacketsAvailable::_Dispatch( OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_RxPacketsAvailableMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100009880(void *a1)
{
  *a1 = off_10000CDF8;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_TxCompleteMetaClass::New( OSAction_AppleUserECM_TxCompleteMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CE38;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CE80;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_TxComplete::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_TxComplete::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_TxCompleteMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10000999C(void *a1)
{
  *a1 = off_10000CEA0;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_RxCompleteMetaClass::New( OSAction_AppleUserECM_RxCompleteMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CEE0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CF28;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_RxComplete::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_RxComplete::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_RxCompleteMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100009AB8(void *a1)
{
  *a1 = off_10000CF48;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_InterruptReadCompleteMetaClass::New( OSAction_AppleUserECM_InterruptReadCompleteMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000CF88;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000CFD0;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_InterruptReadComplete::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_InterruptReadComplete::_Dispatch( OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_InterruptReadCompleteMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100009BD4(void *a1)
{
  *a1 = off_10000CFF0;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_InterruptReadTimerOccurredMetaClass::New( OSAction_AppleUserECM_InterruptReadTimerOccurredMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_10000D030;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_10000D078;
  return 0LL;
}

uint64_t OSAction_AppleUserECM_InterruptReadTimerOccurred::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_AppleUserECM_InterruptReadTimerOccurred::_Dispatch( OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_AppleUserECM_InterruptReadTimerOccurredMetaClass::Dispatch( OSMetaClassBase *this, IORPC *a2)
{
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100009CF0()
{
  return gOSAction_AppleUserECM_TxPacketsAvailableMetaClass;
}

uint64_t sub_100009CFC()
{
  return gOSAction_AppleUserECM_RxPacketsAvailableMetaClass;
}

uint64_t sub_100009D08()
{
  return gOSAction_AppleUserECM_TxCompleteMetaClass;
}

uint64_t sub_100009D14()
{
  return gOSAction_AppleUserECM_RxCompleteMetaClass;
}

uint64_t sub_100009D20()
{
  return gOSAction_AppleUserECM_InterruptReadCompleteMetaClass;
}

uint64_t sub_100009D2C()
{
  return gOSAction_AppleUserECM_InterruptReadTimerOccurredMetaClass;
}

void sub_100009D38()
{
}