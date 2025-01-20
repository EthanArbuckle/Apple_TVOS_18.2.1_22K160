@interface NEIPsecNexus
- (BOOL)setDefaultInputHandler:(nw_protocol *)a3;
- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5;
- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5 netifRingSize:(unsigned int)a6 kernelPipeTxRingSize:(unsigned int)a7 kernelPipeRxRingSize:(unsigned int)a8;
- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5 netifRingSize:(unsigned int)a6 kernelPipeTxRingSize:(unsigned int)a7 kernelPipeRxRingSize:(unsigned int)a8 execUUID:(id)a9;
- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 shouldCreateKernelChannel:(BOOL)a5;
- (NSArray)nexusInstances;
- (uint64_t)initializeWithCount:(void *)a1;
- (void)setNexusInstances:(id)a3;
- (void)setRemotePacketProxy:(id)a3;
@end

@implementation NEIPsecNexus

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 shouldCreateKernelChannel:(BOOL)a5
{
  BOOL v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NEIPsecNexus;
  v6 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:]( &v19,  sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_,  2LL,  a3,  2LL,  a4,  a5);
  v7 = v6;
  if (!v6)
  {
    ne_log_obj();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)v18 = 0;
    v17 = "[super initWithLevel:name:delegate:] failed";
    goto LABEL_12;
  }

  if (v5)
  {
    uint64_t Channel = NEVirtualInterfaceCreateChannel((uint64_t)-[NENexus virtualInterface](v6, "virtualInterface"));
    if (Channel)
    {
      v10 = (void *)Channel;
      id v11 = objc_getProperty(v7, v9, 112LL, 1);
      v13 = v11;
      if (v11) {
        objc_setProperty_atomic(v11, v12, v10, 8LL);
      }

      goto LABEL_7;
    }

    ne_log_obj();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v14 = 0LL;
      goto LABEL_8;
    }

    *(_WORD *)v18 = 0;
    v17 = "NEVirtualInterfaceCreateChannel failed";
LABEL_12:
    _os_log_fault_impl(&dword_1876B1000, v16, OS_LOG_TYPE_FAULT, v17, v18, 2u);
    goto LABEL_10;
  }

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5
{
  return -[NEIPsecNexus initWithName:delegate:enableWithChannelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:]( self,  "initWithName:delegate:enableWithChannelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:",  a3,  a4,  *(void *)&a5,  0LL,  0LL,  0LL);
}

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5 netifRingSize:(unsigned int)a6 kernelPipeTxRingSize:(unsigned int)a7 kernelPipeRxRingSize:(unsigned int)a8
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEIPsecNexus;
  v9 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:]( &v15,  sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_netifRingSize_kernelPipeTxRingSize_kernelPipeRxRingSize_execUUID_,  2LL,  a3,  2LL,  a4,  *(void *)&a5,  *(void *)&a6,  __PAIR64__(a8, a7),  0LL);
  v10 = v9;
  if (!v9)
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_FAULT,  "[super initWithLevel:name:delegate:] failed",  buf,  2u);
    }

    goto LABEL_7;
  }

  if (!-[NEIPsecNexus initializeWithCount:](v9, a5))
  {
LABEL_7:
    id v11 = 0LL;
    goto LABEL_8;
  }

  id v11 = v10;
LABEL_8:

  return v11;
}

- (NEIPsecNexus)initWithName:(id)a3 delegate:(id)a4 enableWithChannelCount:(unsigned int)a5 netifRingSize:(unsigned int)a6 kernelPipeTxRingSize:(unsigned int)a7 kernelPipeRxRingSize:(unsigned int)a8 execUUID:(id)a9
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NEIPsecNexus;
  v10 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:netifRingSize:kernelPipeTxRingSize:kernelPipeRxRingSize:execUUID:]( &v16,  sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_netifRingSize_kernelPipeTxRingSize_kernelPipeRxRingSize_execUUID_,  2LL,  a3,  2LL,  a4,  *(void *)&a5,  *(void *)&a6,  __PAIR64__(a8, a7),  a9);
  id v11 = v10;
  if (!v10)
  {
    ne_log_obj();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_FAULT,  "[super initWithLevel:name:delegate:] failed",  buf,  2u);
    }

    goto LABEL_7;
  }

  if (!-[NEIPsecNexus initializeWithCount:](v10, a5))
  {
LABEL_7:
    v12 = 0LL;
    goto LABEL_8;
  }

  v12 = v11;
LABEL_8:

  return v12;
}

- (BOOL)setDefaultInputHandler:(nw_protocol *)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (self)
    {
      id Property = objc_getProperty(self, a2, 112LL, 1);
      v6 = Property;
      if (Property) {
        id Property = objc_getProperty(Property, v5, 8LL, 1);
      }
    }

    else
    {
      v6 = 0LL;
      id Property = 0LL;
    }

    id v7 = Property;
    uint64_t protocol_handler = nw_channel_get_protocol_handler();

    if (protocol_handler)
    {
      (**(void (***)(uint64_t, nw_protocol *))(protocol_handler + 24))(protocol_handler, a3);
      return 1;
    }

    ne_log_obj();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "Could not get kernel channel protocol",  (uint8_t *)&v11,  2u);
    }
  }

  else
  {
    ne_log_obj();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      v12 = "-[NEIPsecNexus setDefaultInputHandler:]";
      _os_log_fault_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_FAULT,  "%s called with null inputHandler",  (uint8_t *)&v11,  0xCu);
    }
  }

  return 0;
}

- (void)setRemotePacketProxy:(id)a3
{
  id v4 = a3;
  -[NEInternetNexus setPacketProxy:](self, "setPacketProxy:", v4);
  if (v4)
  {
    -[NEIPsecNexus setDefaultInputHandler:](self, "setDefaultInputHandler:", [v4 protocol]);
    if (self)
    {
      id Property = (NEIPsecNexus *)objc_getProperty(self, v5, 112LL, 1);
      self = Property;
      if (Property) {
        id Property = (NEIPsecNexus *)objc_getProperty(Property, v7, 8LL, 1);
      }
    }

    else
    {
      id Property = 0LL;
    }

    v8 = Property;
    uint64_t protocol_handler = nw_channel_get_protocol_handler();

    if (protocol_handler)
    {
      [v4 setDefaultOutputProtocolHandler:protocol_handler];
    }

    else
    {
      ne_log_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v11 = 0;
        _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, "Could not get kernel channel protocol", v11, 2u);
      }
    }
  }
}

- (NSArray)nexusInstances
{
  return self->_nexusInstances;
}

- (void)setNexusInstances:(id)a3
{
}

- (void).cxx_destruct
{
}

- (uint64_t)initializeWithCount:(void *)a1
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (![a1 virtualInterface]) {
    return 1LL;
  }
  id v4 = NEVirtualInterfaceCopyNexusInstances([a1 virtualInterface], a2);
  if (v4)
  {
    BOOL v5 = v4;
    int Count = CFArrayGetCount(v4);
    if (Count == a2)
    {
      id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
      if (a2)
      {
        CFIndex v8 = 0LL;
        v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        uint64_t v10 = a2;
        do
        {
          ValueAtIndex = (const __CFUUID *)CFArrayGetValueAtIndex(v5, v8);
          v12 = (__CFString *)CFUUIDCreateString(v9, ValueAtIndex);
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v12];
          [v7 addObject:v13];

          ++v8;
        }

        while (v10 != v8);
      }

      CFRelease(v5);
      [a1 setNexusInstances:v7];

      return 1LL;
    }

    ne_log_obj();
    objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17[0] = 67109634;
      v17[1] = a2;
      __int16 v18 = 1024;
      int v19 = Count;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_fault_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_FAULT,  "Expected to create %u channels, created %u:%@",  (uint8_t *)v17,  0x18u);
    }

    CFRelease(v5);
  }

  else
  {
    ne_log_obj();
    objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v17[0]) = 0;
      _os_log_fault_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_FAULT,  "NEVirtualInterfaceCopyNexusInstances failed",  (uint8_t *)v17,  2u);
    }
  }

  return 0LL;
}

@end