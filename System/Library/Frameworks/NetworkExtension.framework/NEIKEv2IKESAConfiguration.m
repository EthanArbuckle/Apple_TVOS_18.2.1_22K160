@interface NEIKEv2IKESAConfiguration
- (BOOL)allowRedirect;
- (BOOL)allowTCPEncapsulation;
- (BOOL)disableSwitchToNATTPorts;
- (BOOL)forceUDPEncapsulation;
- (BOOL)preferInitiatorProposalOrder;
- (BOOL)randomizeLocalPort;
- (BOOL)requestChildlessSA;
- (BOOL)requestPPK;
- (BOOL)serverMode;
- (BOOL)strictNonceSizeChecks;
- (BOOL)useTLSForTCPEncapsulation;
- (NEIKEv2IKESAConfiguration)init;
- (NSArray)customIKESAInitPayloads;
- (NSArray)customIKESAInitVendorPayloads;
- (NSArray)proposals;
- (NSSet)extraSupportedSignatureHashes;
- (NSSet)supportedSecurePasswordMethods;
- (NSString)outgoingInterfaceName;
- (NWAddressEndpoint)redirectedFromServer;
- (NWEndpoint)localEndpoint;
- (NWEndpoint)remoteEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unsigned)headerOverhead;
- (unsigned)maximumPacketSize;
- (unsigned)nonceSize;
- (unsigned)tcpEncapsulationPort;
- (void)setAllowRedirect:(BOOL)a3;
- (void)setAllowTCPEncapsulation:(BOOL)a3;
- (void)setCustomIKESAInitPayloads:(id)a3;
- (void)setCustomIKESAInitVendorPayloads:(id)a3;
- (void)setDisableSwitchToNATTPorts:(BOOL)a3;
- (void)setExtraSupportedSignatureHashes:(id)a3;
- (void)setForceUDPEncapsulation:(BOOL)a3;
- (void)setHeaderOverhead:(unsigned int)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setMaximumPacketSize:(unsigned int)a3;
- (void)setNonceSize:(unsigned int)a3;
- (void)setOutgoingInterfaceName:(id)a3;
- (void)setPreferInitiatorProposalOrder:(BOOL)a3;
- (void)setProposals:(id)a3;
- (void)setRandomizeLocalPort:(BOOL)a3;
- (void)setRedirectedFromServer:(id)a3;
- (void)setRemoteEndpoint:(id)a3;
- (void)setRequestChildlessSA:(BOOL)a3;
- (void)setRequestPPK:(BOOL)a3;
- (void)setServerMode:(BOOL)a3;
- (void)setStrictNonceSizeChecks:(BOOL)a3;
- (void)setSupportedSecurePasswordMethods:(id)a3;
- (void)setTcpEncapsulationPort:(unsigned __int16)a3;
- (void)setUseTLSForTCPEncapsulation:(BOOL)a3;
@end

@implementation NEIKEv2IKESAConfiguration

- (NEIKEv2IKESAConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2IKESAConfiguration;
  v2 = -[NEIKEv2IKESAConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NEIKEv2IKESAConfiguration setNonceSize:](v2, "setNonceSize:", 16LL);
    -[NEIKEv2IKESAConfiguration setMaximumPacketSize:](v3, "setMaximumPacketSize:", 0LL);
    -[NEIKEv2IKESAConfiguration setHeaderOverhead:](v3, "setHeaderOverhead:", 0xFFFFFFFFLL);
    v4 = v3;
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }

  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  -[NEIKEv2IKESAConfiguration localEndpoint](self, "localEndpoint");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"Local Endpoint" andIndent:v5 options:a4];
  v9 = -[NEIKEv2IKESAConfiguration remoteEndpoint](self, "remoteEndpoint");
  [v7 appendPrettyObject:v9 withName:@"Remote Endpoint" andIndent:v5 options:a4];
  v10 = -[NEIKEv2IKESAConfiguration outgoingInterfaceName](self, "outgoingInterfaceName");
  [v7 appendPrettyObject:v10 withName:@"Outgoing Interface" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIKEv2IKESAConfiguration randomizeLocalPort](self, "randomizeLocalPort"),  @"Randomize Local Port",  v5,  a4);
  v11 = -[NEIKEv2IKESAConfiguration proposals](self, "proposals");
  [v7 appendPrettyObject:v11 withName:@"Proposals" andIndent:v5 options:a4];
  v12 = -[NEIKEv2IKESAConfiguration customIKESAInitPayloads](self, "customIKESAInitPayloads");
  [v7 appendPrettyObject:v12 withName:@"Custom Payloads" andIndent:v5 options:a4];
  v13 = -[NEIKEv2IKESAConfiguration customIKESAInitVendorPayloads](self, "customIKESAInitVendorPayloads");
  [v7 appendPrettyObject:v13 withName:@"Vendor Payloads" andIndent:v5 options:a4];
  v14 = -[NEIKEv2IKESAConfiguration redirectedFromServer](self, "redirectedFromServer");
  [v7 appendPrettyObject:v14 withName:@"Redirected From" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIKEv2IKESAConfiguration allowRedirect](self, "allowRedirect"),  @"Allow Redirect",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIKEv2IKESAConfiguration disableSwitchToNATTPorts](self, "disableSwitchToNATTPorts"),  @"Disable NAT Ports",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIKEv2IKESAConfiguration forceUDPEncapsulation](self, "forceUDPEncapsulation"),  @"Force UDP Encapsulation",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIKEv2IKESAConfiguration serverMode](self, "serverMode"),  @"Server Mode",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIKEv2IKESAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"),  @"Prefer Initiator Proposal Order",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEIKEv2IKESAConfiguration nonceSize](self, "nonceSize"),  @"Nonce Size",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEIKEv2IKESAConfiguration requestPPK](self, "requestPPK"),  @"Request PPK",  v5,  a4);
  v15 = -[NEIKEv2IKESAConfiguration extraSupportedSignatureHashes](self, "extraSupportedSignatureHashes");
  [v7 appendPrettyObject:v15 withName:@"Extra Supported Signature Hashes" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  return -[NEIKEv2IKESAConfiguration descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NEIKEv2IKESAConfiguration localEndpoint](self, "localEndpoint");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[v5 copy];
  [v4 setLocalEndpoint:v6];
  v7 = -[NEIKEv2IKESAConfiguration remoteEndpoint](self, "remoteEndpoint");
  objc_super v8 = (void *)[v7 copy];
  [v4 setRemoteEndpoint:v8];
  v9 = -[NEIKEv2IKESAConfiguration outgoingInterfaceName](self, "outgoingInterfaceName");
  v10 = (void *)[v9 copy];
  [v4 setOutgoingInterfaceName:v10];

  objc_msgSend( v4,  "setRandomizeLocalPort:",  -[NEIKEv2IKESAConfiguration randomizeLocalPort](self, "randomizeLocalPort"));
  objc_msgSend(v4, "setServerMode:", -[NEIKEv2IKESAConfiguration serverMode](self, "serverMode"));
  objc_msgSend(v4, "setAllowRedirect:", -[NEIKEv2IKESAConfiguration allowRedirect](self, "allowRedirect"));
  objc_msgSend( v4,  "setDisableSwitchToNATTPorts:",  -[NEIKEv2IKESAConfiguration disableSwitchToNATTPorts](self, "disableSwitchToNATTPorts"));
  objc_msgSend( v4,  "setAllowTCPEncapsulation:",  -[NEIKEv2IKESAConfiguration allowTCPEncapsulation](self, "allowTCPEncapsulation"));
  objc_msgSend( v4,  "setUseTLSForTCPEncapsulation:",  -[NEIKEv2IKESAConfiguration useTLSForTCPEncapsulation](self, "useTLSForTCPEncapsulation"));
  objc_msgSend( v4,  "setForceUDPEncapsulation:",  -[NEIKEv2IKESAConfiguration forceUDPEncapsulation](self, "forceUDPEncapsulation"));
  objc_msgSend( v4,  "setPreferInitiatorProposalOrder:",  -[NEIKEv2IKESAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"));
  objc_msgSend( v4,  "setTcpEncapsulationPort:",  -[NEIKEv2IKESAConfiguration tcpEncapsulationPort](self, "tcpEncapsulationPort"));
  objc_msgSend(v4, "setNonceSize:", -[NEIKEv2IKESAConfiguration nonceSize](self, "nonceSize"));
  objc_msgSend( v4,  "setStrictNonceSizeChecks:",  -[NEIKEv2IKESAConfiguration strictNonceSizeChecks](self, "strictNonceSizeChecks"));
  v11 = -[NEIKEv2IKESAConfiguration redirectedFromServer](self, "redirectedFromServer");
  v12 = (void *)[v11 copy];
  [v4 setRedirectedFromServer:v12];
  v13 = -[NEIKEv2IKESAConfiguration proposals](self, "proposals");
  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x189603F18]);
    v15 = -[NEIKEv2IKESAConfiguration proposals](self, "proposals");
    v16 = (void *)[v14 initWithArray:v15 copyItems:1];
    [v4 setProposals:v16];
  }
  v17 = -[NEIKEv2IKESAConfiguration customIKESAInitPayloads](self, "customIKESAInitPayloads");
  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x189603F18]);
    v19 = -[NEIKEv2IKESAConfiguration customIKESAInitPayloads](self, "customIKESAInitPayloads");
    v20 = (void *)[v18 initWithArray:v19 copyItems:1];
    [v4 setCustomIKESAInitPayloads:v20];
  }
  v21 = -[NEIKEv2IKESAConfiguration customIKESAInitVendorPayloads](self, "customIKESAInitVendorPayloads");
  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x189603F18]);
    v23 = -[NEIKEv2IKESAConfiguration customIKESAInitVendorPayloads](self, "customIKESAInitVendorPayloads");
    v24 = (void *)[v22 initWithArray:v23 copyItems:1];
    [v4 setCustomIKESAInitVendorPayloads:v24];
  }

  objc_msgSend(v4, "setMaximumPacketSize:", -[NEIKEv2IKESAConfiguration maximumPacketSize](self, "maximumPacketSize"));
  objc_msgSend(v4, "setHeaderOverhead:", -[NEIKEv2IKESAConfiguration headerOverhead](self, "headerOverhead"));
  objc_msgSend( v4,  "setRequestChildlessSA:",  -[NEIKEv2IKESAConfiguration requestChildlessSA](self, "requestChildlessSA"));
  objc_msgSend(v4, "setRequestPPK:", -[NEIKEv2IKESAConfiguration requestPPK](self, "requestPPK"));
  v25 = -[NEIKEv2IKESAConfiguration extraSupportedSignatureHashes](self, "extraSupportedSignatureHashes");
  if (v25)
  {
    id v26 = objc_alloc(MEMORY[0x189604010]);
    v27 = -[NEIKEv2IKESAConfiguration extraSupportedSignatureHashes](self, "extraSupportedSignatureHashes");
    v28 = (void *)[v26 initWithSet:v27 copyItems:1];
    [v4 setExtraSupportedSignatureHashes:v28];
  }
  v29 = -[NEIKEv2IKESAConfiguration supportedSecurePasswordMethods](self, "supportedSecurePasswordMethods");
  if (v29)
  {
    id v30 = objc_alloc(MEMORY[0x189604010]);
    v31 = -[NEIKEv2IKESAConfiguration supportedSecurePasswordMethods](self, "supportedSecurePasswordMethods");
    v32 = (void *)[v30 initWithSet:v31 copyItems:1];
    [v4 setSupportedSecurePasswordMethods:v32];
  }

  return v4;
}

- (NSArray)proposals
{
  return self->_proposals;
}

- (void)setProposals:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v4 = (NSArray *)[a3 copy];
  proposals = self->_proposals;
  self->_proposals = v4;

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v6 = self->_proposals;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        ++v9;
        if (v12) {
          *(_BYTE *)(v12 + 8) = v9;
        }
      }

      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }
}

- (NWEndpoint)localEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setLocalEndpoint:(id)a3
{
}

- (NWEndpoint)remoteEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRemoteEndpoint:(id)a3
{
}

- (NSString)outgoingInterfaceName
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setOutgoingInterfaceName:(id)a3
{
}

- (BOOL)randomizeLocalPort
{
  return self->_randomizeLocalPort;
}

- (void)setRandomizeLocalPort:(BOOL)a3
{
  self->_randomizeLocalPort = a3;
}

- (BOOL)serverMode
{
  return self->_serverMode;
}

- (void)setServerMode:(BOOL)a3
{
  self->_serverMode = a3;
}

- (BOOL)allowRedirect
{
  return self->_allowRedirect;
}

- (void)setAllowRedirect:(BOOL)a3
{
  self->_allowRedirect = a3;
}

- (BOOL)disableSwitchToNATTPorts
{
  return self->_disableSwitchToNATTPorts;
}

- (void)setDisableSwitchToNATTPorts:(BOOL)a3
{
  self->_disableSwitchToNATTPorts = a3;
}

- (BOOL)allowTCPEncapsulation
{
  return self->_allowTCPEncapsulation;
}

- (void)setAllowTCPEncapsulation:(BOOL)a3
{
  self->_allowTCPEncapsulation = a3;
}

- (BOOL)useTLSForTCPEncapsulation
{
  return self->_useTLSForTCPEncapsulation;
}

- (void)setUseTLSForTCPEncapsulation:(BOOL)a3
{
  self->_useTLSForTCPEncapsulation = a3;
}

- (BOOL)forceUDPEncapsulation
{
  return self->_forceUDPEncapsulation;
}

- (void)setForceUDPEncapsulation:(BOOL)a3
{
  self->_forceUDPEncapsulation = a3;
}

- (BOOL)preferInitiatorProposalOrder
{
  return self->_preferInitiatorProposalOrder;
}

- (void)setPreferInitiatorProposalOrder:(BOOL)a3
{
  self->_preferInitiatorProposalOrder = a3;
}

- (unsigned)tcpEncapsulationPort
{
  return self->_tcpEncapsulationPort;
}

- (void)setTcpEncapsulationPort:(unsigned __int16)a3
{
  self->_tcpEncapsulationPort = a3;
}

- (unsigned)nonceSize
{
  return self->_nonceSize;
}

- (void)setNonceSize:(unsigned int)a3
{
  self->_nonceSize = a3;
}

- (BOOL)strictNonceSizeChecks
{
  return self->_strictNonceSizeChecks;
}

- (void)setStrictNonceSizeChecks:(BOOL)a3
{
  self->_strictNonceSizeChecks = a3;
}

- (NWAddressEndpoint)redirectedFromServer
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setRedirectedFromServer:(id)a3
{
}

- (NSArray)customIKESAInitPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setCustomIKESAInitPayloads:(id)a3
{
}

- (NSArray)customIKESAInitVendorPayloads
{
  return (NSArray *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCustomIKESAInitVendorPayloads:(id)a3
{
}

- (unsigned)maximumPacketSize
{
  return self->_maximumPacketSize;
}

- (void)setMaximumPacketSize:(unsigned int)a3
{
  self->_maximumPacketSize = a3;
}

- (unsigned)headerOverhead
{
  return self->_headerOverhead;
}

- (void)setHeaderOverhead:(unsigned int)a3
{
  self->_headerOverhead = a3;
}

- (BOOL)requestChildlessSA
{
  return self->_requestChildlessSA;
}

- (void)setRequestChildlessSA:(BOOL)a3
{
  self->_requestChildlessSA = a3;
}

- (BOOL)requestPPK
{
  return self->_requestPPK;
}

- (void)setRequestPPK:(BOOL)a3
{
  self->_requestPPK = a3;
}

- (NSSet)extraSupportedSignatureHashes
{
  return (NSSet *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setExtraSupportedSignatureHashes:(id)a3
{
}

- (NSSet)supportedSecurePasswordMethods
{
  return (NSSet *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setSupportedSecurePasswordMethods:(id)a3
{
}

- (void).cxx_destruct
{
}

@end