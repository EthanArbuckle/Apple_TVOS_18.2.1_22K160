@interface NEInternetNexus
- (BOOL)setDefaultInputHandler:(nw_protocol *)a3;
- (BOOL)setUseFlowswitch:(BOOL)a3;
- (NEInternetNexus)initWithName:(id)a3 delegate:(id)a4;
- (NEInternetNexus)initWithName:(id)a3 delegate:(id)a4 shouldCreateKernelChannel:(BOOL)a5;
- (NWRemotePacketProxy)packetProxy;
- (void)dealloc;
- (void)setPacketProxy:(id)a3;
- (void)setRemotePacketProxy:(id)a3;
@end

@implementation NEInternetNexus

- (NEInternetNexus)initWithName:(id)a3 delegate:(id)a4 shouldCreateKernelChannel:(BOOL)a5
{
  BOOL v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NEInternetNexus;
  v6 = -[NENexus initWithLevel:name:virtualInterfaceType:delegate:channelCount:]( &v19,  sel_initWithLevel_name_virtualInterfaceType_delegate_channelCount_,  2LL,  a3,  1LL,  a4,  0LL);
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

- (NEInternetNexus)initWithName:(id)a3 delegate:(id)a4
{
  return -[NEInternetNexus initWithName:delegate:shouldCreateKernelChannel:]( self,  "initWithName:delegate:shouldCreateKernelChannel:",  a3,  a4,  1LL);
}

- (void)dealloc
{
  if (self)
  {
    utunProtocol = self->_utunProtocol;
    if (utunProtocol)
    {
      free(utunProtocol);
      self->_utunProtocol = 0LL;
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEInternetNexus;
  -[NENexus dealloc](&v4, sel_dealloc);
}

- (BOOL)setDefaultInputHandler:(nw_protocol *)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    ne_log_obj();
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    int v17 = 136315138;
    v18 = "-[NEInternetNexus setDefaultInputHandler:]";
    v13 = "%s called with null inputHandler";
    v14 = v4;
    uint32_t v15 = 12;
    goto LABEL_16;
  }

  if (self && self->_utunProtocol)
  {
    ne_log_obj();
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      return 0;
    }

    LOWORD(v17) = 0;
    v16 = "Already have default interface input handler set";
LABEL_20:
    _os_log_error_impl(&dword_1876B1000, v4, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v17, 2u);
    goto LABEL_5;
  }

  if (nw_utun_protocol_identifier_packetProtocolOnceToken != -1) {
    dispatch_once(&nw_utun_protocol_identifier_packetProtocolOnceToken, &__block_literal_global_22821);
  }
  v6 = (nw_protocol *)nw_protocol_create();
  if (!self || (self->_utunProtocol = v6) == 0LL)
  {
    ne_log_obj();
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    LOWORD(v17) = 0;
    v13 = "nw_protocol_create(utun) failed";
    v14 = v4;
    uint32_t v15 = 2;
LABEL_16:
    _os_log_fault_impl(&dword_1876B1000, v14, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v17, v15);
    goto LABEL_5;
  }

  id Property = objc_getProperty(self, v7, 112LL, 1);
  v10 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v9, 8LL, 1);
  }
  id v11 = Property;
  uint64_t protocol_handler = nw_channel_get_protocol_handler();

  if (!protocol_handler)
  {
    ne_log_obj();
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    LOWORD(v17) = 0;
    v16 = "Could not get kernel channel protocol";
    goto LABEL_20;
  }

  (*(void (**)(void))self->_utunProtocol->callbacks)();
  (**(void (***)(uint64_t, nw_protocol *))(protocol_handler + 24))(protocol_handler, self->_utunProtocol);
  return 1;
}

- (void)setRemotePacketProxy:(id)a3
{
  id v6 = a3;
  -[NEInternetNexus setPacketProxy:](self, "setPacketProxy:", v6);
  objc_super v4 = v6;
  if (v6)
  {
    -[NEInternetNexus setDefaultInputHandler:](self, "setDefaultInputHandler:", [v6 protocol]);
    if (self) {
      utunProtocol = self->_utunProtocol;
    }
    else {
      utunProtocol = 0LL;
    }
    [v6 setDefaultOutputProtocolHandler:utunProtocol];
    objc_super v4 = v6;
  }
}

- (BOOL)setUseFlowswitch:(BOOL)a3
{
  return NEVirtualInterfaceEnableFlowswitch((uint64_t)-[NENexus virtualInterface](self, "virtualInterface"), a3);
}

- (NWRemotePacketProxy)packetProxy
{
  return (NWRemotePacketProxy *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setPacketProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end