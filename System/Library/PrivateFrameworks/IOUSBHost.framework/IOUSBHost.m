}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t OUTLINED_FUNCTION_2(void *a1, const char *a2)
{
  return [a1 cStringUsingEncoding:4];
}

  ;
}

const IOUSBDescriptorHeader *__cdecl IOUSBGetNextDescriptor( const IOUSBDescriptorHeader *configurationDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  if (configurationDescriptor)
  {
    if (currentDescriptor)
    {
      if (currentDescriptor >= configurationDescriptor
        && (v2 = &configurationDescriptor->bLength + *(_WORD *)&configurationDescriptor[1],
            v2 >= (uint8_t *)currentDescriptor))
      {
        unint64_t bLength = currentDescriptor->bLength;
        else {
          v5 = (const IOUSBDescriptorHeader *)((char *)currentDescriptor + bLength);
        }
        if (bLength >= 2) {
          return v5;
        }
        else {
          return 0LL;
        }
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      uint64_t v3 = configurationDescriptor->bLength;
      else {
        return 0LL;
      }
    }
  }

  return configurationDescriptor;
}

const IOUSBDescriptorHeader *__cdecl IOUSBGetNextDescriptorWithType( const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *currentDescriptor, const uint8_t type)
{
  int v3 = type;
  do
  {
    result = IOUSBGetNextDescriptor(configurationDescriptor, currentDescriptor);
    currentDescriptor = result;
  }

  while (result && result->bDescriptorType != v3);
  return result;
}

const IOUSBDescriptorHeader *__cdecl IOUSBGetNextAssociatedDescriptor( const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *parentDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  result = 0LL;
  if (!configurationDescriptor || !parentDescriptor) {
    return result;
  }
  if (currentDescriptor)
  {
    if (currentDescriptor >= (const IOUSBDescriptorHeader *)configurationDescriptor)
    {
      v5 = (char *)(&configurationDescriptor->bLength + configurationDescriptor->wTotalLength);
      if (v5 >= (char *)currentDescriptor)
      {
        unint64_t bLength = currentDescriptor->bLength;
        v7 = &currentDescriptor->bLength + bLength;
LABEL_11:
        else {
          v9 = (const IOUSBDescriptorHeader *)v7;
        }
        if (bLength >= 2) {
          v8 = v9;
        }
        else {
          v8 = 0LL;
        }
        goto LABEL_17;
      }
    }
  }

  else if (parentDescriptor >= (const IOUSBDescriptorHeader *)configurationDescriptor)
  {
    v5 = (char *)(&configurationDescriptor->bLength + configurationDescriptor->wTotalLength);
    if (v5 >= (char *)parentDescriptor)
    {
      unint64_t bLength = parentDescriptor->bLength;
      v7 = &parentDescriptor->bLength + bLength;
      goto LABEL_11;
    }
  }

  v8 = 0LL;
LABEL_17:
  int bDescriptorType = parentDescriptor->bDescriptorType;
  do
  {
    Descriptor = IOUSBGetNextDescriptor(configurationDescriptor, parentDescriptor);
    parentDescriptor = Descriptor;
  }

  while (Descriptor && Descriptor->bDescriptorType != bDescriptorType);
  if (Descriptor <= v8) {
    return 0LL;
  }
  else {
    return v8;
  }
}

const IOUSBDescriptorHeader *__cdecl IOUSBGetNextAssociatedDescriptorWithType( const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *parentDescriptor, const IOUSBDescriptorHeader *currentDescriptor, const uint8_t type)
{
  result = 0LL;
  if (configurationDescriptor)
  {
    v6 = parentDescriptor;
    if (parentDescriptor)
    {
      int v7 = type;
      v8 = currentDescriptor;
      if (currentDescriptor)
      {
        do
        {
          Descriptor = IOUSBGetNextDescriptor(configurationDescriptor, v8);
          v8 = Descriptor;
        }

        while (Descriptor && Descriptor->bDescriptorType != v7);
      }

      else
      {
        v8 = parentDescriptor;
        do
        {
          v10 = IOUSBGetNextDescriptor(configurationDescriptor, v8);
          v8 = v10;
        }

        while (v10 && v10->bDescriptorType != v7);
      }

      int bDescriptorType = v6->bDescriptorType;
      do
      {
        v12 = IOUSBGetNextDescriptor(configurationDescriptor, v6);
        v6 = v12;
      }

      while (v12 && v12->bDescriptorType != bDescriptorType);
      if (v12 > v8 || v12 == 0LL) {
        return v8;
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

const IOUSBInterfaceAssociationDescriptor *__cdecl IOUSBGetNextInterfaceAssociationDescriptor( const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  do
  {
    result = (const IOUSBInterfaceAssociationDescriptor *)IOUSBGetNextDescriptor( configurationDescriptor,  currentDescriptor);
    currentDescriptor = (const IOUSBDescriptorHeader *)result;
  }

  while (result && result->bDescriptorType != 11);
  return result;
}

const IOUSBInterfaceDescriptor *__cdecl IOUSBGetNextInterfaceDescriptor( const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  do
  {
    result = (const IOUSBInterfaceDescriptor *)IOUSBGetNextDescriptor(configurationDescriptor, currentDescriptor);
    currentDescriptor = (const IOUSBDescriptorHeader *)result;
  }

  while (result && result->bDescriptorType != 4);
  return result;
}

const IOUSBEndpointDescriptor *__cdecl IOUSBGetNextEndpointDescriptor( const IOUSBConfigurationDescriptor *configurationDescriptor, const IOUSBInterfaceDescriptor *interfaceDescriptor, const IOUSBDescriptorHeader *currentDescriptor)
{
  return (const IOUSBEndpointDescriptor *)IOUSBGetNextAssociatedDescriptorWithType( configurationDescriptor,  (const IOUSBDescriptorHeader *)interfaceDescriptor,  currentDescriptor,  5u);
}

const IOUSBDeviceCapabilityDescriptorHeader *__cdecl IOUSBGetNextCapabilityDescriptor( const IOUSBDeviceCapabilityDescriptorHeader *bosDescriptor, const IOUSBDeviceCapabilityDescriptorHeader *currentDescriptor)
{
  if (bosDescriptor)
  {
    if (currentDescriptor)
    {
      if (currentDescriptor >= bosDescriptor
        && (v2 = &bosDescriptor->bLength + *(unsigned __int16 *)&bosDescriptor->bDevCapabilityType,
            v2 >= (uint8_t *)currentDescriptor))
      {
        unint64_t bLength = currentDescriptor->bLength;
        else {
          v5 = (const IOUSBDeviceCapabilityDescriptorHeader *)((char *)currentDescriptor + bLength);
        }
        if (bLength >= 3) {
          return v5;
        }
        else {
          return 0LL;
        }
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      uint64_t v3 = bosDescriptor->bLength;
      else {
        return 0LL;
      }
    }
  }

  return bosDescriptor;
}

const IOUSBDeviceCapabilityDescriptorHeader *__cdecl IOUSBGetNextCapabilityDescriptorWithType( const IOUSBBOSDescriptor *bosDescriptor, const IOUSBDeviceCapabilityDescriptorHeader *currentDescriptor, const uint8_t type)
{
  int v3 = type;
  for (i = bosDescriptor; ; bosDescriptor = i)
  {
    result = IOUSBGetNextCapabilityDescriptor(bosDescriptor, currentDescriptor);
    currentDescriptor = result;
    if (!result || result->bDescriptorType == 16 && result->bDevCapabilityType == v3) {
      break;
    }
  }

  return result;
}

const IOUSBDeviceCapabilityUSB2Extension *__cdecl IOUSBGetUSB20ExtensionDeviceCapabilityDescriptor( const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBDeviceCapabilityUSB2Extension *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0LL, 2u);
}

const IOUSBDeviceCapabilitySuperSpeedUSB *__cdecl IOUSBGetSuperSpeedDeviceCapabilityDescriptor( const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBDeviceCapabilitySuperSpeedUSB *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0LL, 3u);
}

const IOUSBDeviceCapabilitySuperSpeedPlusUSB *__cdecl IOUSBGetSuperSpeedPlusDeviceCapabilityDescriptor( const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBDeviceCapabilitySuperSpeedPlusUSB *)IOUSBGetNextCapabilityDescriptorWithType( bosDescriptor,  0LL,  0xAu);
}

const IOUSBDeviceCapabilityContainerID *__cdecl IOUSBGetContainerIDDescriptor(const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBDeviceCapabilityContainerID *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0LL, 4u);
}

const IOUSBPlatformCapabilityDescriptor *__cdecl IOUSBGetPlatformCapabilityDescriptor( const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBPlatformCapabilityDescriptor *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0LL, 5u);
}

const IOUSBPlatformCapabilityDescriptor *__cdecl IOUSBGetPlatformCapabilityDescriptorWithUUID( const IOUSBBOSDescriptor *bosDescriptor, uuid_t uuid)
{
  v4 = 0LL;
  do
  {
    CapabilityDescriptorWithType = IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, v4, 5u);
    v4 = CapabilityDescriptorWithType;
  }

  while (CapabilityDescriptorWithType && uuid_compare(uuid, &CapabilityDescriptorWithType[1].bDescriptorType));
  return (const IOUSBPlatformCapabilityDescriptor *)v4;
}

const IOUSBDeviceCapabilityBillboard *__cdecl IOUSBGetBillboardDescriptor(const IOUSBBOSDescriptor *bosDescriptor)
{
  return (const IOUSBDeviceCapabilityBillboard *)IOUSBGetNextCapabilityDescriptorWithType(bosDescriptor, 0LL, 0xDu);
}

uint8_t IOUSBGetEndpointDirection(const IOUSBEndpointDescriptor *descriptor)
{
  if ((descriptor->bmAttributes & 3) != 0) {
    return descriptor->bEndpointAddress >> 7;
  }
  else {
    LOBYTE(v1) = 2;
  }
  return v1;
}

uint8_t IOUSBGetEndpointType(const IOUSBEndpointDescriptor *descriptor)
{
  return descriptor->bmAttributes & 3;
}

uint8_t IOUSBGetEndpointAddress(const IOUSBEndpointDescriptor *descriptor)
{
  return descriptor->bEndpointAddress & 0x8F;
}

uint8_t IOUSBGetEndpointNumber(const IOUSBEndpointDescriptor *descriptor)
{
  return descriptor->bEndpointAddress & 0xF;
}

uint8_t IOUSBGetEndpointUsageType(const IOUSBEndpointDescriptor *descriptor)
{
  return (descriptor->bmAttributes >> 4) & 3;
}

uint8_t IOUSBGetEndpointSynchronizationType(const IOUSBEndpointDescriptor *descriptor)
{
  return (descriptor->bmAttributes >> 2) & 3;
}

uint16_t IOUSBGetEndpointMaxPacketSize(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor)
{
  return descriptor->wMaxPacketSize & 0x7FF;
}

uint32_t IOUSBGetEndpointBurstSize( uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor, const IOUSBSuperSpeedEndpointCompanionDescriptor *companionDescriptor, const IOUSBSuperSpeedPlusIsochronousEndpointCompanionDescriptor *sspCompanionDescriptor)
{
  unsigned int wMaxPacketSize = descriptor->wMaxPacketSize;
  uint32_t result = wMaxPacketSize & 0x7FF;
  if (usbDeviceSpeed - 1 < 3)
  {
    int bMaxBurst = (wMaxPacketSize >> 11) & 3;
  }

  else
  {
    int v7 = descriptor->bmAttributes & 3;
    if (usbDeviceSpeed - 5 >= 2)
    {
      if (usbDeviceSpeed != 4) {
        return 0;
      }
      if ((descriptor->bmAttributes & 3) == 0) {
        return result;
      }
      if (v7 == 1)
      {
        LOBYTE(bmAttributes) = companionDescriptor->bmAttributes;
LABEL_13:
        __int16 v10 = result + result * companionDescriptor->bMaxBurst;
        return (unsigned __int16)(v10 + v10 * (bmAttributes & 3));
      }
    }

    else
    {
      if ((descriptor->bmAttributes & 3) == 0) {
        return result;
      }
      if (v7 == 1)
      {
        int bmAttributes = (char)companionDescriptor->bmAttributes;
        if (sspCompanionDescriptor && bmAttributes < 0) {
          return sspCompanionDescriptor->dwBytesPerInterval;
        }
        goto LABEL_13;
      }
    }

    int bMaxBurst = companionDescriptor->bMaxBurst;
  }

  result += result * bMaxBurst;
  return result;
}

uint8_t IOUSBGetEndpointMult( uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor, const IOUSBSuperSpeedEndpointCompanionDescriptor *companionDescriptor, const IOUSBSuperSpeedPlusIsochronousEndpointCompanionDescriptor *sspCompanionDescriptor)
{
  int v4 = descriptor->bmAttributes & 3;
  if (usbDeviceSpeed - 5 >= 2)
  {
    if (usbDeviceSpeed == 3)
    {
      if ((descriptor->bmAttributes & 1) != 0) {
        return (descriptor->wMaxPacketSize >> 11) & 3;
      }
    }

    else if (usbDeviceSpeed == 4 && v4 == 1)
    {
      LOBYTE(bmAttributes) = companionDescriptor->bmAttributes;
LABEL_12:
      LOBYTE(bmAttributes) = bmAttributes & 3;
      return bmAttributes;
    }

    goto LABEL_11;
  }

  if (v4 != 1)
  {
LABEL_11:
    LOBYTE(bmAttributes) = 0;
    return bmAttributes;
  }

  int bmAttributes = (char)companionDescriptor->bmAttributes;
  if ((bmAttributes & 0x80000000) == 0 || (descriptor->wMaxPacketSize & 0x7FF) == 0) {
    goto LABEL_12;
  }
  return (((descriptor->wMaxPacketSize & 0x7FF) + sspCompanionDescriptor->dwBytesPerInterval - 1) & -(descriptor->wMaxPacketSize & 0x7FF))
       / ((companionDescriptor->bMaxBurst & 0x1Fu) + 1)
       / (descriptor->wMaxPacketSize & 0x7FFu)
       - 1;
}

uint32_t IOUSBGetEndpointIntervalEncodedMicroframes( uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor)
{
  if (usbDeviceSpeed - 3 < 3)
  {
    if ((descriptor->bmAttributes & 1) != 0) {
      return descriptor->bInterval;
    }
    if (usbDeviceSpeed == 3 && descriptor->bInterval)
    {
      uint32_t result = 0;
      do
        int v3 = 1 << result++;
      while (v3 < descriptor->bInterval);
      return result;
    }

    return 0;
  }

  if (usbDeviceSpeed - 1 >= 2) {
    return 0;
  }
  int v4 = descriptor->bmAttributes & 3;
  if (v4 == 1) {
    return descriptor->bInterval + 3;
  }
  if (v4 != 3) {
    return 0;
  }
  uint32_t result = 3;
  do
    ++result;
  while (1 << result <= 8 * descriptor->bInterval);
  return result;
}

uint32_t IOUSBGetEndpointIntervalMicroframes( uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor)
{
  uint32_t v2 = IOUSBGetEndpointIntervalEncodedMicroframes(usbDeviceSpeed, descriptor);
  if (v2) {
    return 1 << (v2 - 1);
  }
  else {
    return 0;
  }
}

uint32_t IOUSBGetEndpointIntervalFrames(uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor)
{
  uint32_t v2 = IOUSBGetEndpointIntervalEncodedMicroframes(usbDeviceSpeed, descriptor);
  if (v2) {
    return (1 << (v2 - 1)) >> 3;
  }
  else {
    return 0;
  }
}

uint32_t IOUSBGetEndpointMaxStreamsEncoded( uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor, const IOUSBSuperSpeedEndpointCompanionDescriptor *companionDescriptor)
{
  if (usbDeviceSpeed >= 4 && (descriptor->bmAttributes & 3) == 2) {
    return companionDescriptor->bmAttributes & 0x1F;
  }
  else {
    return 0;
  }
}

uint32_t IOUSBGetEndpointMaxStreams( uint32_t usbDeviceSpeed, const IOUSBEndpointDescriptor *descriptor, const IOUSBSuperSpeedEndpointCompanionDescriptor *companionDescriptor)
{
  if (usbDeviceSpeed >= 4 && (descriptor->bmAttributes & 3) == 2 && (companionDescriptor->bmAttributes & 0x1F) != 0) {
    return 1 << companionDescriptor->bmAttributes;
  }
  else {
    return 0;
  }
}

uint32_t IOUSBGetConfigurationMaxPowerMilliAmps( uint32_t usbDeviceSpeed, const IOUSBConfigurationDescriptor *descriptor)
{
  if (!descriptor) {
    return 0;
  }
  if (usbDeviceSpeed - 1 < 3)
  {
    unsigned int MaxPower = descriptor->MaxPower;
    BOOL v3 = MaxPower >= 0xFA;
    BOOL v4 = MaxPower == 250;
    uint32_t v5 = 2 * MaxPower;
    goto LABEL_6;
  }

  if (usbDeviceSpeed - 4 >= 2) {
    return 0;
  }
  unsigned int v6 = descriptor->MaxPower;
  BOOL v3 = v6 >= 0x71;
  BOOL v4 = v6 == 113;
  uint32_t v5 = 8 * v6;
LABEL_6:
  if (!v4 && v3) {
    return 0;
  }
  else {
    return v5;
  }
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return [0 cStringUsingEncoding:4];
}

LABEL_24:
    return 0;
  }

  if (-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage") != message)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"The specified message %p does not match the current transfer %p.",  message,  -[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage"));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (error)
    {
      v65 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 localizedStringForKey:@"Transfer completion message was not sent." value:&stru_18A275388 table:0];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v23;
      v66 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 localizedStringForKey:v21 value:&stru_18A275388 table:0];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v25;
      v67 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v27;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v68 forKeys:&v65 count:3];
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v28];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      goto LABEL_23;
    }

    goto LABEL_24;
  }

  if (!-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")
    || ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x80) == 0
    || ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x40) != 0)
  {
    if (error)
    {
      v65 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v38 localizedStringForKey:@"Transfer completion message was not sent." value:&stru_18A275388 table:0];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v39;
      v66 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 localizedStringForKey:@"The current transfer cannot generate a transfer completion." value:&stru_18A275388 table:0];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v41;
      v67 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v43;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v68 forKeys:&v65 count:3];
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870184 userInfo:v44];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v45 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v45) {
        -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:].cold.1( v45,  v46);
      }
    }

    return 0;
  }

  else {
    v37 = 0LL;
  }
  if (v37 >= transferLength) {
    v47 = transferLength;
  }
  else {
    v47 = v37;
  }
  if (v37 < transferLength && status == IOUSBHostCIMessageStatusSuccess) {
    v49 = IOUSBHostCIMessageStatusOverrunError;
  }
  else {
    v49 = status;
  }
  v50 = -[IOUSBHostCIEndpointStateMachine deviceAddress](v10, "deviceAddress");
  v63[0] = (v49 << 8) | (v50 << 16) | (-[IOUSBHostCIEndpointStateMachine endpointAddress]( v10,  "endpointAddress") << 24) | 0xC03D;
  v63[1] = v47;
  v64 = -[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage");
  if (v49 != IOUSBHostCIMessageStatusEndpointStopped)
  {
    if (v49 == IOUSBHostCIMessageStatusSuccess)
    {
      v51 = (uint64_t)(-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage") + 16);
      while (1)
      {
        -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](v10, "setCurrentTransferMessage:", v51);
        if (((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x80) == 0
          || ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x40) == 0
          || (*(_DWORD *)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage") & 0x3F) != 0x3C)
        {
          break;
        }

        v51 = (uint64_t)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[8];
        if (!v51)
        {
          if (error)
          {
            v65 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            [v52 localizedStringForKey:@"Transfer completion message was not sent." value:&stru_18A275388 table:0];
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v53;
            v66 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            [v54 localizedStringForKey:@"Found a link to an invalid transfer structure address." value:&stru_18A275388 table:0];
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v55;
            v67 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            [v56 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v57;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v68 forKeys:&v65 count:3];
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v58];
            *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
            v59 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v59) {
              -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:].cold.2( v59,  v60);
            }
          }

          return -[IOUSBHostControllerInterface enqueueInterrupt:error:]( v10->_controllerInterface,  "enqueueInterrupt:error:",  v63,  error);
        }
      }
    }

    else
    {
      -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](v10, "setCurrentTransferMessage:", 0LL);
    }
  }

  return -[IOUSBHostControllerInterface enqueueInterrupt:error:]( v10->_controllerInterface,  "enqueueInterrupt:error:",  v63,  error);
}

id OUTLINED_FUNCTION_5()
{
  return v0;
}

void _ioCompletionCallback(void (**a1)(void, void, void), uint64_t a2, unsigned int a3)
{
  if (a1)
  {
    id v3 = a1;
    a1[2](a1, a2, a3);
    a1 = (void (**)(void, void, void))v3;
  }
}

LABEL_23:
    v27 = 0LL;
    goto LABEL_24;
  }

  v15 = (const __CFNumber *)IORegistryEntryCreateCFProperty( -[IOUSBHostObject ioService](v9, "ioService"),  @"bInterfaceNumber",  v11,  0);
  if (!v15)
  {
    if (error)
    {
      v47 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 localizedStringForKey:@"Failed to create IOUSBHostInterface." value:&stru_18A275388 table:0];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      valuePtr = v38;
      v48 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 localizedStringForKey:@"Unable to obtain interface number." value:&stru_18A275388 table:0];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v40;
      v49 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v42;
      [MEMORY[0x189603F68] dictionaryWithObjects:&valuePtr forKeys:&v47 count:3];
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870212 userInfo:v34];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v43 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v43) {
        -[IOUSBHostInterface initWithIOService:options:queue:error:interestHandler:].cold.3(v43, v44);
      }
LABEL_22:

      goto LABEL_23;
    }

    goto LABEL_23;
  }

  v16 = v15;
  v17 = CFGetTypeID(v15);
  if (v17 == CFNumberGetTypeID())
  {
    LOBYTE(valuePtr) = 0;
    CFNumberGetValue(v16, kCFNumberSInt8Type, &valuePtr);
    -[IOUSBHostInterface setInterfaceNumber:](v9, "setInterfaceNumber:", valuePtr);
  }

  CFRelease(v16);
LABEL_15:
  v27 = v9;
LABEL_24:

  return v27;
}

LABEL_11:
    LOBYTE(v26) = 0;
    return v26;
  }

  if (-[IOUSBHostCIControllerStateMachine lastFrameNumber](self, "lastFrameNumber") > frame
    || -[IOUSBHostCIControllerStateMachine lastFrameTimestamp](self, "lastFrameTimestamp") > timestamp)
  {
    if (error)
    {
      v32 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 localizedStringForKey:@"Frame update was not sent." value:&stru_18A275388 table:0];
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v10;
      v33 = *MEMORY[0x1896075F0];
      objc_msgSend(MEMORY[0x1896077F8], "mainBundle", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 localizedStringForKey:@"The frame number or timestamp cannot regress." value:&stru_18A275388 table:0];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v12;
      v34 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v14;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v32 count:3];
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v15];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v16) {
        -[IOUSBHostCIControllerStateMachine enqueueUpdatedFrame:timestamp:error:].cold.1(v16, v17);
      }
LABEL_10:

      goto LABEL_11;
    }

    goto LABEL_11;
  }
  v28 = -[IOUSBHostCIControllerStateMachine controllerInterface]( self,  "controllerInterface",  49161LL,  frame,  49162LL,  timestamp);
  v26 = [v28 enqueueInterrupts:&v29 count:2 error:error];

  if (v26)
  {
    -[IOUSBHostCIControllerStateMachine setLastFrameNumber:](self, "setLastFrameNumber:", frame);
    -[IOUSBHostCIControllerStateMachine setLastFrameTimestamp:](self, "setLastFrameTimestamp:", timestamp);
  }

  return v26;
}

  if (a8)
  {
    v34[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 localizedStringForKey:@"Unable to send IO." value:&stru_18A275388 table:0];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v24;
    v34[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v26;
    v34[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v28;
    [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:v34 count:3];
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v21 userInfo:v29];
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v30) {
      -[IOUSBHostPipe sendIORequestWithData:bytesTransferred:completionTimeout:error:].cold.1(v30, v31);
    }
  }

  v22 = 0;
LABEL_16:

  return v22;
}

LABEL_15:
    -[IOUSBHostControllerInterface destroy](v19, "destroy");
    v43 = 0LL;
    goto LABEL_16;
  }

  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  v22 = os_log_create( "com.apple.iokit.usb.framework.IOUSBHost",  (const char *)[v21 cStringUsingEncoding:4]);
  -[IOUSBHostControllerInterface setLog:](v19, "setLog:", v22);

  -[IOUSBHostControllerInterface setInterruptRateHz:](v19, "setInterruptRateHz:", interruptRateHz);
  -[IOUSBHostControllerInterface setCommandHandler:](v19, "setCommandHandler:", v17);
  -[IOUSBHostControllerInterface setDoorbellHandler:](v19, "setDoorbellHandler:", v18);
  -[IOUSBHostControllerInterface setInterestHandler:](v19, "setInterestHandler:", interestHandler);
  if (-[NSData length](v15, "length") >= 0x10 && (-[NSData length](v15, "length") & 0xF) == 0)
  {
    v23 = [MEMORY[0x189603F48] dataWithData:v15];
    capabilitiesData = v19->_capabilitiesData;
    v19->_capabilitiesData = (NSData *)v23;

    -[IOUSBHostControllerInterface setCapabilities:]( v19,  "setCapabilities:",  -[NSData bytes](v19->_capabilitiesData, "bytes"));
  }

  if (!-[IOUSBHostControllerInterface capabilities](v19, "capabilities")
    || (*(_BYTE *)-[IOUSBHostControllerInterface capabilities](v19, "capabilities") & 0x3F) != 0)
  {
    if (error)
    {
      v173 = v15;
      v175 = v17;
      v25 = v16;
      v180 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)&connect = v27;
      v181 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 localizedStringForKey:@"Capabilities are not valid." value:&stru_18A275388 table:0];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *((void *)&connect + 1) = v29;
      v182 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v31;
      [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v32];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v33) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.2( v33,  v34);
      }
LABEL_13:

      v16 = v25;
      v15 = v173;
LABEL_14:
      v17 = v175;
      goto LABEL_15;
    }

    goto LABEL_15;
  }

  v45 = -[IOUSBHostCIControllerStateMachine initWithInterface:error:]( objc_alloc(&OBJC_CLASS___IOUSBHostCIControllerStateMachine),  "initWithInterface:error:",  v19,  error);
  -[IOUSBHostControllerInterface setControllerStateMachine:](v19, "setControllerStateMachine:", v45);
  v46 = -[IOUSBHostControllerInterface controllerStateMachine](v19, "controllerStateMachine");
  if (!v46) {
    goto LABEL_15;
  }
  v174 = v16;
  v175 = v17;
  v47 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:0x10000];
  -[IOUSBHostControllerInterface setInterrupts:](v19, "setInterrupts:", v47);

  v48 = (void *)NSString;
  v49 = (objc_class *)objc_opt_class();
  NSStringFromClass(v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = [v48 stringWithFormat:@"%@.%@", @"com.apple.iokit.usb.framework.IOUSBHost", v50];
  v52 = dispatch_queue_create((const char *)[v51 UTF8String], 0);
  -[IOUSBHostControllerInterface setInterruptQueue:](v19, "setInterruptQueue:", v52);

  v53 = objc_alloc_init(MEMORY[0x1896079F8]);
  -[IOUSBHostControllerInterface setInterruptLock:](v19, "setInterruptLock:", v53);
  v54 = -[IOUSBHostControllerInterface interrupts](v19, "interrupts");
  if (!v54)
  {
    if (error)
    {
      v180 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      [v60 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)&connect = v61;
      v181 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      [v62 localizedStringForKey:@"Failed to allocate interruptData." value:&stru_18A275388 table:0];
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *((void *)&connect + 1) = v63;
      v182 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      [v64 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v65;
      [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v66];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v67 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v67) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.3( v67,  v68);
      }
      goto LABEL_56;
    }

LABEL_57:
    v16 = v174;
    goto LABEL_14;
  }
  v55 = -[IOUSBHostControllerInterface interruptQueue](v19, "interruptQueue");
  if (!v55)
  {
    v16 = v174;
    v17 = v175;
    if (!error) {
      goto LABEL_15;
    }
    v180 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    [v69 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&connect = v70;
    v181 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    [v71 localizedStringForKey:@"Failed to allocate interruptQueue." value:&stru_18A275388 table:0];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *((void *)&connect + 1) = v72;
    v182 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    [v73 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v74;
    [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v66];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v75 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v75) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.4( v75,  v76);
    }
    goto LABEL_56;
  }
  v56 = -[IOUSBHostControllerInterface interruptLock](v19, "interruptLock");
  v16 = v174;
  v17 = v175;
  if (!v56)
  {
    if (!error) {
      goto LABEL_15;
    }
    v180 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    [v77 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&connect = v78;
    v181 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    [v79 localizedStringForKey:@"Failed to allocate interruptLock." value:&stru_18A275388 table:0];
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    *((void *)&connect + 1) = v80;
    v182 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    [v81 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v82;
    [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v66];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v83 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v83) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.5( v83,  v84);
    }
    goto LABEL_56;
  }

  v57 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:4096];
  -[IOUSBHostControllerInterface setDoorbells:](v19, "setDoorbells:", v57);
  v58 = -[IOUSBHostControllerInterface doorbells](v19, "doorbells");
  if (!v58)
  {
    if (error)
    {
      v180 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      [v171 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)&connect = v85;
      v181 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      [v86 localizedStringForKey:@"Unable to allocate memory for doorbells." value:&stru_18A275388 table:0];
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *((void *)&connect + 1) = v87;
      v182 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      [v88 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v89;
      [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v90];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v91 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v91) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.12( v91,  v92);
      }

      v16 = v174;
      v17 = v175;
    }
    v93 = -[IOUSBHostControllerInterface doorbells](v19, "doorbells");
    [v93 setLength:4096];

    goto LABEL_15;
  }
  v59 = -[IOUSBHostControllerInterface doorbells](v19, "doorbells");
  [v59 setLength:4096];

  v94 = IOServiceMatching("AppleUSBUserHCIResources");
  if (v94)
  {
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086A8], v94);
    if (MatchingService)
    {
      v96 = MatchingService;
      LODWORD(connect) = 0;
      IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, (io_connect_t *)&connect);
      -[IOUSBHostControllerInterface setIoConnect:](v19, "setIoConnect:", connect);
      IOObjectRelease(v96);
    }
  }

  if (!-[IOUSBHostControllerInterface ioConnect](v19, "ioConnect"))
  {
    if (!error) {
      goto LABEL_15;
    }
    v180 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    [v109 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&connect = v110;
    v181 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    [v111 localizedStringForKey:@"Unable to connect to the kernel." value:&stru_18A275388 table:0];
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    *((void *)&connect + 1) = v112;
    v182 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    [v113 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v114;
    [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870195 userInfo:v66];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v115 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v115) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.6( v115,  v116);
    }
    goto LABEL_56;
  }

  v97 = objc_alloc_init(MEMORY[0x189607AB8]);
  -[IOUSBHostControllerInterface setUuid:](v19, "setUuid:", v97);
  v98 = -[IOUSBHostControllerInterface uuid](v19, "uuid");
  if (!v98)
  {
    if (!error) {
      goto LABEL_15;
    }
    v180 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    [v117 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&connect = v118;
    v181 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    [v119 localizedStringForKey:@"Failed to create UUID." value:&stru_18A275388 table:0];
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    *((void *)&connect + 1) = v120;
    v182 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    [v121 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v122;
    [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v66];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v123 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v123) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.7( v123,  v124);
    }
    goto LABEL_56;
  }
  v99 = -[IOUSBHostControllerInterface uuid](v19, "uuid");
  [v99 UUIDString];
  v100 = (const void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v99) = IOConnectSetCFProperty( -[IOUSBHostControllerInterface ioConnect](v19, "ioConnect"),  @"IOUSBHostControllerInterfaceUUID",  v100);
  CFRelease(v100);
  if ((_DWORD)v99)
  {
    if (!error) {
      goto LABEL_14;
    }
    v180 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    [v101 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&connect = v102;
    v181 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    [v103 localizedStringForKey:@"Unable to set UUID property." value:&stru_18A275388 table:0];
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    *((void *)&connect + 1) = v104;
    v182 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    [v105 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v106;
    [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v66];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v107 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v107) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.11( v107,  v108);
    }
    goto LABEL_56;
  }

  v125 = -[IOUSBHostControllerInterface ioConnect](v19, "ioConnect");
  v126 = v15;
  if (IOConnectCallStructMethod(v125, 2u, -[NSData bytes](v126, "bytes"), -[NSData length](v126, "length"), 0LL, 0LL))
  {
    if (error)
    {
      v180 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      [v127 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)&connect = v128;
      v181 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      [v129 localizedStringForKey:@"Capabilities structure was rejected." value:&stru_18A275388 table:0];
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      *((void *)&connect + 1) = v130;
      v182 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      [v131 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v132;
      [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v66];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v133 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v133) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.10( v133,  v134);
      }
LABEL_56:

      goto LABEL_57;
    }

    goto LABEL_57;
  }

  v135 = IOServiceMatching("IOUserClient");
  v178 = @"IOUSBHostControllerInterfaceUUID";
  v136 = -[IOUSBHostControllerInterface uuid](v19, "uuid");
  [v136 UUIDString];
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = v137;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setObject:forKeyedSubscript:](v135, "setObject:forKeyedSubscript:", v138, @"IOPropertyMatch");

  v139 = -[IOUSBHostInterestNotifier initWithOwner:matchingDictionary:callback:]( objc_alloc(&OBJC_CLASS___IOUSBHostInterestNotifier),  "initWithOwner:matchingDictionary:callback:",  v19,  v135,  _internalInterestCallback);
  -[IOUSBHostControllerInterface setInterestNotifier:](v19, "setInterestNotifier:", v139);
  v140 = -[IOUSBHostControllerInterface interestNotifier](v19, "interestNotifier");
  if (!v140)
  {
    v17 = v175;
    if (error)
    {
      v180 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      [v172 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)&connect = v141;
      v181 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      [v142 localizedStringForKey:@"Unable to create interest notifier." value:&stru_18A275388 table:0];
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      *((void *)&connect + 1) = v143;
      v182 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      [v144 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v145;
      [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
      v146 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870212 userInfo:v146];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v147 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v147) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.8( v147,  v148);
      }

      v17 = v175;
    }

    v16 = v174;
    goto LABEL_15;
  }

  v16 = v174;
  v17 = v175;
  if (v174)
  {
    -[IOUSBHostControllerInterface setQueue:](v19, "setQueue:", v174);
  }

  else
  {
    v149 = (void *)NSString;
    v150 = (objc_class *)objc_opt_class();
    NSStringFromClass(v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = [v149 stringWithFormat:@"%@.%@", @"com.apple.iokit.usb.framework.IOUSBHost", v151];
    v153 = dispatch_queue_create((const char *)[v152 UTF8String], 0);
    -[IOUSBHostControllerInterface setQueue:](v19, "setQueue:", v153);

    v16 = 0LL;
    v17 = v175;
  }
  v154 = -[IOUSBHostControllerInterface queue](v19, "queue");
  if (v154)
  {
    -[IOUSBHostControllerInterface setNotificationPortRef:]( v19,  "setNotificationPortRef:",  IONotificationPortCreate(*MEMORY[0x1896086A8]));
    if (-[IOUSBHostControllerInterface notificationPortRef](v19, "notificationPortRef"))
    {
      v155 = -[IOUSBHostControllerInterface notificationPortRef](v19, "notificationPortRef");
      -[IOUSBHostControllerInterface queue](v19, "queue");
      v156 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      IONotificationPortSetDispatchQueue(v155, v156);

      v17 = v175;
    }
  }

  v157 = -[IOUSBHostControllerInterface queue](v19, "queue");
  if (!v157
    || (v158 = (void *)v157,
        v159 = -[IOUSBHostControllerInterface notificationPortRef](v19, "notificationPortRef"),
        v158,
        !v159))
  {
    if (!error) {
      goto LABEL_15;
    }
    v180 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    [v163 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&connect = v164;
    v181 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    [v165 localizedStringForKey:@"Unable to create notification port." value:&stru_18A275388 table:0];
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    *((void *)&connect + 1) = v166;
    v182 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    [v167 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v168;
    [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v66];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v169 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v169) {
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.9( v169,  v170);
    }
    goto LABEL_56;
  }

  if (!-[IOUSBHostControllerInterface commandAsyncCallbackWithResult:error:]( v19,  "commandAsyncCallbackWithResult:error:",  3758096385LL,  error)
    || !-[IOUSBHostControllerInterface doorbellAsyncCallbacKWithResult:length:error:]( v19,  "doorbellAsyncCallbacKWithResult:length:error:",  3758096385LL,  0LL,  error))
  {
    goto LABEL_15;
  }

  -[IOUSBHostControllerInterface log](v19, "log");
  v160 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
  {
    v161 = -[IOUSBHostControllerInterface uuid](v19, "uuid");
    [v161 UUIDString];
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(connect) = 138412290;
    *(void *)((char *)&connect + 4) = v162;
    _os_log_impl( &dword_18874A000,  v160,  OS_LOG_TYPE_INFO,  "created IOUSBHostControllerInterface with UUID %@",  (uint8_t *)&connect,  0xCu);
  }

  v43 = v19;
  v17 = v175;
LABEL_16:

  return v43;
}

void _internalInterestCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  v8 = v7;
  if ((_DWORD)a3 == -536850430)
  {
    [v7 log];
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      _internalInterestCallback_cold_1((IOUSBHostCIExceptionType)a4, v9);
    }
  }
}

void sub_1887564C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void _commandAsyncCallback(void *a1, int a2)
{
  if (a1 && ([a1 destroyed] & 1) == 0)
  {
    [a1 queue];
    BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = ___commandAsyncCallback_block_invoke;
    v5[3] = &unk_18A2749C8;
    id v6 = a1;
    int v7 = a2;
    dispatch_async(v4, v5);
  }
}

void _doorbellAsyncCallback(void *a1, int a2, uint64_t a3)
{
  if (a1 && ([a1 destroyed] & 1) == 0)
  {
    [a1 queue];
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = ___doorbellAsyncCallback_block_invoke;
    block[3] = &unk_18A2749F0;
    int v10 = a2;
    id v8 = a1;
    uint64_t v9 = a3;
    dispatch_async(v6, block);
  }
}

LABEL_47:
              [v5 appendString:@" Link Change"];
              goto LABEL_48;
            }
          }

          else if ((v20 & 0x40000) == 0)
          {
            goto LABEL_46;
          }

          [v5 appendString:@" Connect Change"];
          if ((message->data1 & 0x100000) == 0) {
            goto LABEL_48;
          }
          goto LABEL_47;
        }

LABEL_41:
        [v5 appendString:@" Connected"];
        data1 = message->data1;
        goto LABEL_42;
      }

      if ((message->control & 0x3F) == 0x1E && (message->data1 & 0x160000) != 0)
      {
        [v5 appendString:@" Clear Change Bits:"];
        int v10 = message->data1;
        if ((v10 & 0x20000) != 0)
        {
          [v5 appendString:@" Overcurrent"];
          int v10 = message->data1;
          if ((v10 & 0x40000) == 0)
          {
LABEL_10:
            if ((v10 & 0x100000) == 0) {
              return (NSString *)v5;
            }
            goto LABEL_69;
          }
        }

        else if ((v10 & 0x40000) == 0)
        {
          goto LABEL_10;
        }

        [v5 appendString:@" Connect"];
        if ((message->data1 & 0x100000) == 0) {
          return (NSString *)v5;
        }
LABEL_69:
        id v6 = @" Link";
        goto LABEL_3;
      }

      return (NSString *)v5;
    case 0x20uLL:
      objc_msgSend(v5, "appendFormat:", @" Port Route 0x%08x", message->data0 & 0xFFFFFF);
      if ((message->control & 0x4000) != 0) {
        objc_msgSend( v5,  "appendFormat:",  @" Device Address %llu Status %s",  LOBYTE(message->data1),  v9,  v24,  v25,  v26);
      }
      return (NSString *)v5;
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
      objc_msgSend(v5, "appendFormat:", @" Device Address %u", LOBYTE(message->data0));
      if ((message->control & 0x4000) != 0) {
        goto LABEL_36;
      }
      if ((message->control & 0x3F) != 0x24) {
        return (NSString *)v5;
      }
      objc_msgSend(v5, "appendFormat:", @" Descriptor 0x%016llx", message->data1);
      v15 = (_BYTE *)message->data1;
      if (!v15) {
        return (NSString *)v5;
      }
      objc_msgSend(v5, "appendString:", @" (");
      if (!*v15) {
        goto LABEL_35;
      }
      v16 = 0LL;
      do
      {
        if (v16) {
          v17 = " ";
        }
        else {
          v17 = "0x";
        }
        objc_msgSend(v5, "appendFormat:", @"%s%02x", v17, v15[v16]);
        v14 = *v15;
        if (v16 > 6) {
          break;
        }
        ++v16;
      }

      while (v16 < v14);
      goto LABEL_33;
    case 0x28uLL:
    case 0x29uLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
      objc_msgSend( v5,  "appendFormat:",  @" Device %d Endpoint 0x%02x",  message->data0,  BYTE1(message->data0));
      if ((message->control & 0x4000) != 0)
      {
LABEL_36:
        objc_msgSend(v5, "appendFormat:", @" Status %s", v9, v23, v24, v25, v26);
        return (NSString *)v5;
      }

      switch(message->control & 0x3F)
      {
        case '(':
        case ',':
          objc_msgSend(v5, "appendFormat:", @" Descriptor 0x%016llx", message->data1);
          v11 = (_BYTE *)message->data1;
          if (!v11) {
            return (NSString *)v5;
          }
          objc_msgSend(v5, "appendString:", @" (");
          if (!*v11) {
            goto LABEL_35;
          }
          v12 = 0LL;
          do
          {
            if (v12) {
              v13 = " ";
            }
            else {
              v13 = "0x";
            }
            objc_msgSend(v5, "appendFormat:", @"%s%02x", v13, v11[v12]);
            v14 = *v11;
            if (v12 > 6) {
              break;
            }
            ++v12;
          }

          while (v12 < v14);
          break;
        case '-':
          if ((message->data1 & 1) != 0) {
            v21 = "YES";
          }
          else {
            v21 = "NO";
          }
          objc_msgSend(v5, "appendFormat:", @" Clear State %s", v21, v23, v24, v25, v26);
          return (NSString *)v5;
        case '.':
          objc_msgSend(v5, "appendFormat:", @" Transfer Structure 0x%016llx", message->data1, v23, v24, v25, v26);
          goto LABEL_65;
        default:
          return (NSString *)v5;
      }

LABEL_33:
LABEL_35:
      id v6 = @"");
      goto LABEL_3;
    case 0x38uLL:
      objc_msgSend( v5,  "appendFormat:",  @" Request 0x%02x %02x %04x %04x %04x",  LOBYTE(message->data1),  BYTE1(message->data1),  WORD1(message->data1),  WORD2(message->data1),  HIWORD(message->data1));
      return (NSString *)v5;
    case 0x39uLL:
      objc_msgSend( v5,  "appendFormat:",  @" Length 0x%x Buffer 0x%016llx\n",  message->data0 & 0xFFFFFFF,  message->data1,  v24,  v25,  v26);
      return (NSString *)v5;
    case 0x3DuLL:
      objc_msgSend( v5,  "appendFormat:",  @" Device %u Endpoint 0x%02lx Length %u Status %s Transfer Structure 0x%016llx",  BYTE2(control),  control >> 24,  message->data0 & 0xFFFFFFF,  v7,  message->data1);
LABEL_65:
      if (message->data1)
      {
        [v5 appendString:@": "];
        v22 = -[IOUSBHostControllerInterface descriptionForMessage:](self, "descriptionForMessage:", message->data1);
        [v5 appendString:v22];
      }

      return (NSString *)v5;
    default:
      return (NSString *)v5;
  }

uint64_t ___commandAsyncCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) commandAsyncCallbackWithResult:*(unsigned int *)(a1 + 40) error:0];
}

uint64_t ___doorbellAsyncCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doorbellAsyncCallbacKWithResult:*(unsigned int *)(a1 + 48) length:*(void *)(a1 + 40) error:0];
}

void _ioCompletionCallback_0(void (**a1)(void, void, void), uint64_t a2, unsigned int a3)
{
  if (a1)
  {
    id v3 = a1;
    a1[2](a1, a2, a3);
    a1 = (void (**)(void, void, void))v3;
  }
}

void _isochCompletionCallback(void (**a1)(void))
{
  if (a1)
  {
    int v1 = a1;
    a1[2]();
    a1 = v1;
  }
}

LABEL_40:
    v30 = 0LL;
    goto LABEL_41;
  }

  -[IOUSBHostObject setIoNotificationPortRef:]( v15,  "setIoNotificationPortRef:",  IONotificationPortCreate(*MEMORY[0x1896086A8]));
  if (!-[IOUSBHostObject ioNotificationPortRef](v15, "ioNotificationPortRef"))
  {
    if (error)
    {
      v119 = v12;
      v31 = v13;
      v124 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      [v73 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_18A275388 table:0];
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v74;
      v125 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      [v75 localizedStringForKey:@"Unable to create IONotificationPort port." value:&stru_18A275388 table:0];
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v76;
      v126 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      [v77 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v78;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v124 count:3];
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v38];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v79 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v79) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.5(v79, v80);
      }
LABEL_33:

      v13 = v31;
      v12 = v119;
      goto LABEL_40;
    }

    goto LABEL_40;
  }

  v51 = -[IOUSBHostObject ioNotificationPortRef](v15, "ioNotificationPortRef");
  -[IOUSBHostObject queue](v15, "queue");
  v52 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  IONotificationPortSetDispatchQueue(v51, v52);

  v122 = 0LL;
  LOBYTE(v51) = -[IOUSBHostObject openWithOptions:error:](v15, "openWithOptions:error:", options, &v122);
  v53 = v122;
  v54 = v53;
  if ((v51 & 1) == 0)
  {
    v111 = [v53 code];
    [v54 userInfo];
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = *MEMORY[0x1896075F0];
    [v81 objectForKeyedSubscript:*MEMORY[0x1896075F0]];
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    [v54 userInfo];
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = *MEMORY[0x189607618];
    v112 = v84;
    [v84 objectForKeyedSubscript:*MEMORY[0x189607618]];
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v83;
    if (error)
    {
      v109 = error;
      v110 = v81;
      v116 = v54;
      v120 = v12;
      v114 = v13;
      v124 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v88 = v87;
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      [v89 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_18A275388 table:0];
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v90;
      v125 = v82;
      [MEMORY[0x1896077F8] mainBundle];
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      [v91 localizedStringForKey:v87 value:&stru_18A275388 table:0];
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v92;
      v126 = v85;
      [MEMORY[0x1896077F8] mainBundle];
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      [v93 localizedStringForKey:v86 value:&stru_18A275388 table:0];
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v94;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v124 count:3];
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      v87 = v88;
      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v111 userInfo:v95];
      *v109 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.8(v88, v96);
      }

      v13 = v114;
      v54 = v116;
      v12 = v120;
      v81 = v110;
    }

    goto LABEL_39;
  }

  v121 = 0LL;
  -[IOUSBHostObject setDeviceDescriptor:]( v15,  "setDeviceDescriptor:",  -[IOUSBHostObject descriptorWithType:length:error:](v15, "descriptorWithType:length:error:", 1LL, &v121, error));
  if (!-[IOUSBHostObject deviceDescriptor](v15, "deviceDescriptor")
    || (v55 = v121, v55 < *(unsigned __int8 *)-[IOUSBHostObject deviceDescriptor](v15, "deviceDescriptor")))
  {
    if (error)
    {
      v113 = v13;
      v115 = v54;
      v124 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      [v56 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_18A275388 table:0];
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v57;
      v125 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      [v58 localizedStringForKey:@"Unable to obtain device descriptor." value:&stru_18A275388 table:0];
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v59;
      v126 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      [v60 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v61;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v124 count:3];
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870212 userInfo:v62];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v63 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v63) {
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.6(v63, v64);
      }

      v13 = v113;
      v54 = v115;
    }

LABEL_39:
    goto LABEL_40;
  }

  if (v13)
  {
    -[IOUSBHostObject setInterestHandler:](v15, "setInterestHandler:", v13);

    v98 = -[IOUSBHostInterestNotifier initWithOwner:service:callback:]( objc_alloc(&OBJC_CLASS___IOUSBHostInterestNotifier),  "initWithOwner:service:callback:",  v15,  v10,  _interestNotificationCallback);
    -[IOUSBHostObject setInterestNotifier:](v15, "setInterestNotifier:", v98);
    v99 = -[IOUSBHostObject interestNotifier](v15, "interestNotifier");
    if (!v99)
    {
      if (error)
      {
        v117 = v54;
        v124 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        [v100 localizedStringForKey:@"Failed to create IOUSBHostObject." value:&stru_18A275388 table:0];
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = v101;
        v125 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        [v102 localizedStringForKey:@"Unable to create IOUSBHostInterestNotifier" value:&stru_18A275388 table:0];
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = v103;
        v126 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        [v104 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = v105;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v124 count:3];
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870212 userInfo:v106];
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        v107 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v107) {
          -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.7(v107, v108);
        }

        v54 = v117;
      }

      v13 = 0LL;
      goto LABEL_39;
    }
  }

  v13 = 0LL;
LABEL_10:
  v30 = v15;
LABEL_41:

  return v30;
}

void _interestNotificationCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = a1;
  if (v6)
  {
    unsigned __int8 v7 = atomic_load(v6 + 8);
    if ((v7 & 1) == 0)
    {
      uint64_t v9 = v6;
      [v6 interestHandler];
      id v8 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, unsigned __int8 *, uint64_t, uint64_t))v8)[2](v8, v9, a3, a4);

      id v6 = v9;
    }
  }
}

LABEL_21:
  return v25;
}

void sub_18875C760(_Unwind_Exception *a1)
{
}

LABEL_20:
      v41 = 0;
      goto LABEL_21;
    }
  }

  if (v31)
  {
    v14 = 0LL;
    if (error) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }

  if (*(unsigned __int16 *)&request.bmRequestType != 1792LL)
  {
    v41 = 1;
    goto LABEL_22;
  }
  v43 = -[IOUSBHostObject descriptorCache](self, "descriptorCache");
  objc_sync_enter(v43);
  v44 = -[IOUSBHostObject descriptorCache](self, "descriptorCache");
  v45 = HIBYTE(request.wValue) | ((unint64_t)LOBYTE(request.wValue) << 8) | (*(_DWORD *)&request.wIndex << 16);
  [MEMORY[0x189607968] numberWithUnsignedInteger:v45];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  [v44 objectForKey:v46];
  v14 = (IOUSBHostCompletionHandler)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v47 = -[IOUSBHostObject descriptorCache](self, "descriptorCache");
    [MEMORY[0x189607968] numberWithUnsignedInteger:v45];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 removeObjectForKey:v48];
    v49 = -[IOUSBHostObject invalidDescriptorCache](self, "invalidDescriptorCache");
    [v49 addObject:v14];
  }

  objc_sync_exit(v43);

  v41 = 1;
LABEL_21:

LABEL_22:
  return v41;
}

void sub_18875CD18(_Unwind_Exception *a1)
{
}

void _ioCompletionCallback_1(void (**a1)(void, void, void), uint64_t a2, unsigned int a3)
{
  if (a1)
  {
    id v3 = a1;
    a1[2](a1, a2, a3);
    a1 = (void (**)(void, void, void))v3;
  }
}

void sub_18875D384(_Unwind_Exception *a1)
{
}

LABEL_8:
  v19 = 0LL;
  return (NSMutableData *)v19;
}

  if (v4) {
    return v4;
  }
  else {
    return "Unknown";
  }
}

  if (v4) {
    return v4;
  }
  else {
    return "Unknown";
  }
}

  if (v4) {
    return v4;
  }
  else {
    return "Unknown";
  }
}

  if (v4) {
    return v4;
  }
  else {
    return "Unknown";
  }
}

  if (v1) {
    return v1;
  }
  else {
    return "Unknown";
  }
}

  if (v1) {
    return v1;
  }
  else {
    return "Unknown";
  }
}

  if (v1) {
    return v1;
  }
  else {
    return "Unknown";
  }
}

  if (v1) {
    return v1;
  }
  else {
    return "Unknown";
  }
}

  if (v1) {
    return v1;
  }
  else {
    return "Unknown";
  }
}

void _internalMatchingCallback(void *a1, io_iterator_t a2)
{
  id v3 = a1;
  if (a2)
  {
    id v5 = v3;
    io_object_t v4 = IOIteratorNext(a2);
    id v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "setService:");
      IOObjectRelease([v5 matchingIterator]);
      [v5 setMatchingIterator:0];
      id v3 = v5;
    }
  }
}

void sub_18875E864( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void _internalInterestCallback_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a1;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109376;
    v11[1] = a3;
    __int16 v12 = 2048;
    uint64_t v13 = a4;
    _os_log_impl( &dword_18874A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Notification message 0x%08x argument 0x%016lx",  (uint8_t *)v11,  0x12u);
  }

  [v6 lock];
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 lock];

  if (([v6 destroyed] & 1) == 0)
  {
    id v8 = (void (*)(void *, uint64_t, uint64_t, uint64_t))[v6 callback];
    [v6 owner];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8(v9, [v6 service], a3, a4);
  }

  [v6 lock];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 unlock];
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

const char *IOFindNameForValue(int a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if (v2 && *(_DWORD *)a2 != a1)
  {
    id v3 = (void *)(a2 + 24);
    do
    {
      uint64_t v2 = *v3;
      if (!*v3) {
        break;
      }
      int v4 = *((_DWORD *)v3 - 2);
      v3 += 2;
    }

    while (v4 != a1);
  }

  if (v2) {
    return (const char *)v2;
  }
  else {
    return "Unknown";
  }
}

IOReturn IOUSBHostCIMessageStatusToIOReturn(IOUSBHostCIMessageStatus status)
{
  if (status > IOUSBHostCIMessageStatusMissedServiceError) {
    return -536870212;
  }
  else {
    return dword_188763548[status];
  }
}

IOUSBHostCIMessageStatus IOUSBHostCIMessageStatusFromIOReturn(IOReturn status)
{
  if (status > -536870169)
  {
    IOReturn v1 = -536870164;
    if (status) {
      int v9 = 13;
    }
    else {
      int v9 = 1;
    }
    if (status == -536850432) {
      int v10 = 11;
    }
    else {
      int v10 = v9;
    }
    if (status == -536870163) {
      IOUSBHostCIMessageStatus v4 = IOUSBHostCIMessageStatusTransactionError;
    }
    else {
      IOUSBHostCIMessageStatus v4 = v10;
    }
    int v5 = -536870168;
    int v6 = 10;
    BOOL v7 = status == -536870165;
    int v8 = 7;
  }

  else
  {
    IOReturn v1 = -536870187;
    if (status == -536870174) {
      int v2 = 3;
    }
    else {
      int v2 = 13;
    }
    if (status == -536870185) {
      int v3 = 2;
    }
    else {
      int v3 = v2;
    }
    if (status == -536870186) {
      IOUSBHostCIMessageStatus v4 = IOUSBHostCIMessageStatusTimeout;
    }
    else {
      IOUSBHostCIMessageStatus v4 = v3;
    }
    int v5 = -536870210;
    int v6 = 6;
    BOOL v7 = status == -536870206;
    int v8 = 4;
  }

  if (v7) {
    IOUSBHostCIMessageStatus v11 = v8;
  }
  else {
    IOUSBHostCIMessageStatus v11 = IOUSBHostCIMessageStatusError;
  }
  if (status == v5) {
    IOUSBHostCIMessageStatus v11 = v6;
  }
  if (status <= v1) {
    return v11;
  }
  else {
    return v4;
  }
}

BOOL IOUSBHostCILinkStateEnabled(const IOUSBHostCILinkState linkState)
{
  return (linkState < 0x10) & (0x800Fu >> linkState);
}

const char *__cdecl IOUSBHostCIMessageTypeToString(IOUSBHostCIMessageType type)
{
  if (type)
  {
    uint64_t v1 = 0LL;
    while (1)
    {
      uint64_t v2 = v1 + 16;
      if (v1 == 528) {
        break;
      }
      int v3 = *(_DWORD *)((char *)&IOUSBHostCIMessageTypeToString_namedValues + v1 + 16);
      v1 += 16LL;
      if (v3 == type)
      {
        IOUSBHostCIMessageStatus v4 = *(const char **)((char *)&IOUSBHostCIMessageTypeToString_namedValues + v2 + 8);
        goto LABEL_8;
      }
    }

    IOUSBHostCIMessageStatus v4 = 0LL;
  }

  else
  {
    IOUSBHostCIMessageStatus v4 = "IOUSBHostCIMessageTypeControllerCapabilities";
  }

const char *__cdecl IOUSBHostCIMessageStatusToString(IOUSBHostCIMessageStatus status)
{
  if (status)
  {
    uint64_t v1 = 0LL;
    while (1)
    {
      uint64_t v2 = v1 + 16;
      if (v1 == 208) {
        break;
      }
      int v3 = *(_DWORD *)((char *)&IOUSBHostCIMessageStatusToString_namedValues + v1 + 16);
      v1 += 16LL;
      if (v3 == status)
      {
        IOUSBHostCIMessageStatus v4 = *(const char **)((char *)&IOUSBHostCIMessageStatusToString_namedValues + v2 + 8);
        goto LABEL_8;
      }
    }

    IOUSBHostCIMessageStatus v4 = 0LL;
  }

  else
  {
    IOUSBHostCIMessageStatus v4 = "IOUSBHostCIMessageStatusReserved";
  }

const char *__cdecl IOUSBHostCILinkStateToString(IOUSBHostCILinkState linkState)
{
  if (linkState)
  {
    uint64_t v1 = 0LL;
    while (1)
    {
      uint64_t v2 = v1 + 16;
      if (v1 == 192) {
        break;
      }
      int v3 = *(_DWORD *)((char *)&IOUSBHostCILinkStateToString_namedValues + v1 + 16);
      v1 += 16LL;
      if (v3 == linkState)
      {
        IOUSBHostCIMessageStatus v4 = *(const char **)((char *)&IOUSBHostCILinkStateToString_namedValues + v2 + 8);
        goto LABEL_8;
      }
    }

    IOUSBHostCIMessageStatus v4 = 0LL;
  }

  else
  {
    IOUSBHostCIMessageStatus v4 = "U0";
  }

const char *__cdecl IOUSBHostCIDeviceSpeedToString(IOUSBHostCIDeviceSpeed speed)
{
  if (speed)
  {
    uint64_t v1 = 0LL;
    while (1)
    {
      uint64_t v2 = v1 + 16;
      if (v1 == 96) {
        break;
      }
      int v3 = *(_DWORD *)((char *)&IOUSBHostCIDeviceSpeedToString_namedValues + v1 + 16);
      v1 += 16LL;
      if (v3 == speed)
      {
        IOUSBHostCIMessageStatus v4 = *(const char **)((char *)&IOUSBHostCIDeviceSpeedToString_namedValues + v2 + 8);
        goto LABEL_8;
      }
    }

    IOUSBHostCIMessageStatus v4 = 0LL;
  }

  else
  {
    IOUSBHostCIMessageStatus v4 = "None";
  }

const char *__cdecl IOUSBHostCIExceptionTypeToString(IOUSBHostCIExceptionType exceptionType)
{
  if (exceptionType == IOUSBHostCIExceptionTypeCapabilitiesInvalid)
  {
    uint64_t v1 = "IOUSBHostCIExceptionTypeCapabilitiesInvalid";
  }

  else
  {
    uint64_t v2 = 0LL;
    while (1)
    {
      uint64_t v3 = v2 + 16;
      if (v2 == 176) {
        break;
      }
      int v4 = *(_DWORD *)((char *)&IOUSBHostCIExceptionTypeToString_namedValues + v2 + 16);
      v2 += 16LL;
      if (v4 == exceptionType)
      {
        uint64_t v1 = *(const char **)((char *)&IOUSBHostCIExceptionTypeToString_namedValues + v3 + 8);
        goto LABEL_8;
      }
    }

    uint64_t v1 = 0LL;
  }

const char *__cdecl IOUSBHostCIControllerStateToString(IOUSBHostCIControllerState controllerState)
{
  if (controllerState == IOUSBHostCIControllerStateActive)
  {
    uint64_t v1 = "Active";
  }

  else
  {
    uint64_t v2 = 0LL;
    while (1)
    {
      uint64_t v3 = v2 + 16;
      if (v2 == 32) {
        break;
      }
      int v4 = *(_DWORD *)((char *)&IOUSBHostCIControllerStateToString_namedValues + v2 + 16);
      v2 += 16LL;
      if (v4 == controllerState)
      {
        uint64_t v1 = *(const char **)((char *)&IOUSBHostCIControllerStateToString_namedValues + v3 + 8);
        goto LABEL_8;
      }
    }

    uint64_t v1 = 0LL;
  }

const char *__cdecl IOUSBHostCIPortStateToString(IOUSBHostCIPortState portState)
{
  if (portState == IOUSBHostCIPortStateActive)
  {
    uint64_t v1 = "Active";
  }

  else
  {
    uint64_t v2 = 0LL;
    while (1)
    {
      uint64_t v3 = v2 + 16;
      if (v2 == 48) {
        break;
      }
      int v4 = *(_DWORD *)((char *)&IOUSBHostCIPortStateToString_namedValues + v2 + 16);
      v2 += 16LL;
      if (v4 == portState)
      {
        uint64_t v1 = *(const char **)((char *)&IOUSBHostCIPortStateToString_namedValues + v3 + 8);
        goto LABEL_8;
      }
    }

    uint64_t v1 = 0LL;
  }

const char *__cdecl IOUSBHostCIDeviceStateToString(IOUSBHostCIDeviceState deviceState)
{
  if (deviceState == IOUSBHostCIDeviceStateActive)
  {
    uint64_t v1 = "Active";
  }

  else
  {
    uint64_t v2 = 0LL;
    while (1)
    {
      uint64_t v3 = v2 + 16;
      if (v2 == 32) {
        break;
      }
      int v4 = *(_DWORD *)((char *)&IOUSBHostCIDeviceStateToString_namedValues + v2 + 16);
      v2 += 16LL;
      if (v4 == deviceState)
      {
        uint64_t v1 = *(const char **)((char *)&IOUSBHostCIDeviceStateToString_namedValues + v3 + 8);
        goto LABEL_8;
      }
    }

    uint64_t v1 = 0LL;
  }

const char *__cdecl IOUSBHostCIEndpointStateToString(IOUSBHostCIEndpointState endpointState)
{
  if (endpointState == IOUSBHostCIEndpointStateActive)
  {
    uint64_t v1 = "Active";
  }

  else
  {
    uint64_t v2 = 0LL;
    while (1)
    {
      uint64_t v3 = v2 + 16;
      if (v2 == 48) {
        break;
      }
      int v4 = *(_DWORD *)((char *)&IOUSBHostCIEndpointStateToString_namedValues + v2 + 16);
      v2 += 16LL;
      if (v4 == endpointState)
      {
        uint64_t v1 = *(const char **)((char *)&IOUSBHostCIEndpointStateToString_namedValues + v3 + 8);
        goto LABEL_8;
      }
    }

    uint64_t v1 = 0LL;
  }

void _internalInterestCallback_cold_1(IOUSBHostCIExceptionType a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  int v4 = IOUSBHostCIExceptionTypeToString(a1);
  _os_log_fault_impl(&dword_18874A000, a2, OS_LOG_TYPE_FAULT, "Fatal error: %s", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_3();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallAsyncMethod( mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CA8]( *(void *)&connection,  *(void *)&selector,  *(void *)&wake_port,  reference,  *(void *)&referenceCnt,  input,  *(void *)&inputCnt,  inputStruct);
}

kern_return_t IOConnectCallAsyncScalarMethod( mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x189607CB0]( *(void *)&connection,  *(void *)&selector,  *(void *)&wake_port,  reference,  *(void *)&referenceCnt,  input,  *(void *)&inputCnt,  output);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallScalarMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x189607CC0]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallStructMethod( mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CC8]( *(void *)&connection,  *(void *)&selector,  inputStruct,  inputStructCnt,  outputStruct,  outputStructCnt);
}

kern_return_t IOConnectMapMemory64( io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x189607CE0]( *(void *)&connect,  *(void *)&memoryType,  *(void *)&intoTask,  atAddress,  ofSize,  *(void *)&options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x189607CF0](*(void *)&connect, propertyName, property);
}

kern_return_t IOConnectSetNotificationPort( io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x189607CF8](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectUnmapMemory64( io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x189607D20](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x189608340](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification( IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x189608540](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification( IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x189608548](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB0](flags, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FD4B8](uu1, uu2);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

uint64_t objc_msgSend_descriptorWithType_length_index_languageID_requestType_requestRecipient_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_descriptorWithType_length_index_languageID_requestType_requestRecipient_error_);
}

uint64_t objc_msgSend_enqueueControlRequest_data_completionTimeout_error_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_enqueueControlRequest_data_completionTimeout_error_completionHandler_);
}

uint64_t objc_msgSend_enqueueDeviceRequest_data_completionTimeout_error_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_enqueueDeviceRequest_data_completionTimeout_error_completionHandler_);
}

uint64_t objc_msgSend_enqueueIORequestWithData_frameList_frameListCount_firstFrameNumber_options_error_completionHandler_version_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_enqueueIORequestWithData_frameList_frameListCount_firstFrameNumber_options_error_completionHandler_version_);
}

uint64_t objc_msgSend_initWithHostInterface_endpointAddress_ioConnection_ioNotificationPortRef_deviceAddress_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithHostInterface_endpointAddress_ioConnection_ioNotificationPortRef_deviceAddress_);
}

uint64_t objc_msgSend_sendIORequestWithData_frameList_frameListCount_firstFrameNumber_options_error_version_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_sendIORequestWithData_frameList_frameListCount_firstFrameNumber_options_error_version_);
}