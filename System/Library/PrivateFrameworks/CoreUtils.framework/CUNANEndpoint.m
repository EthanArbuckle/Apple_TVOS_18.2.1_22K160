@interface CUNANEndpoint
- (CUNANEndpoint)initWithEndpointID:(const char *)a3 error:(id *)a4;
- (NSData)customData;
- (NSDictionary)textInfo;
- (NSString)identifier;
- (NSString)mockPeerEndpointString;
- (NSString)name;
- (NSString)serviceType;
- (WiFiAwareDiscoveryResult)discoveryResult;
- (WiFiMACAddress)macAddress;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)port;
- (int)rssi;
- (unsigned)instanceID;
- (unsigned)updateWithDiscoveryResult:(id)a3;
- (void)setCustomData:(id)a3;
- (void)setDiscoveryResult:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstanceID:(unsigned __int8)a3;
- (void)setMacAddress:(id)a3;
- (void)setMockPeerEndpointString:(id)a3;
- (void)setName:(id)a3;
- (void)setPort:(int)a3;
- (void)setRssi:(int)a3;
- (void)setServiceType:(id)a3;
- (void)setTextInfo:(id)a3;
@end

@implementation CUNANEndpoint

- (CUNANEndpoint)initWithEndpointID:(const char *)a3 error:(id *)a4
{
  v6 = -[CUNANEndpoint init](self, "init");
  if (!v6) {
    goto LABEL_6;
  }
  if (sscanf( a3,  "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx-%hhu",  &v13,  (char *)&v13 + 1,  (char *)&v13 + 2,  (char *)&v13 + 3,  &v14,  (char *)&v14 + 1,  &v12) != 7)
  {
    if (a4)
    {
      NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5CFLL);
      v10 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }

- (id)description
{
  return -[CUNANEndpoint descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v32 = 0LL;
  NSAppendPrintF_safe(&v32);
  v5 = v32;
  v6 = v5;
  if (self->_identifier)
  {
    v31 = v5;
    id v7 = (id *)&v31;
    uint64_t v8 = &v31;
  }

  else if (self->_macAddress)
  {
    v30 = v5;
    id v7 = (id *)&v30;
    uint64_t v8 = &v30;
  }

  else
  {
    v29 = v5;
    id v7 = (id *)&v29;
    uint64_t v8 = &v29;
  }

  NSAppendPrintF_safe(v8);
  v9 = (__CFString *)*v7;

  if (self->_serviceType)
  {
    CFMutableStringRef v28 = v9;
    NSAppendPrintF_safe(&v28);
    v10 = v28;

    v9 = v10;
  }

  if (self->_name)
  {
    CFMutableStringRef v27 = v9;
    NSAppendPrintF_safe(&v27);
    v11 = v27;

    v9 = v11;
  }

  if (self->_port)
  {
    CFMutableStringRef v26 = v9;
    NSAppendPrintF_safe(&v26);
    unsigned __int8 v12 = v26;

    v9 = v12;
  }

  if (self->_customData)
  {
    CFMutableStringRef v25 = v9;
    NSAppendPrintF_safe(&v25);
    unsigned int v13 = v25;

    v9 = v13;
  }

  discoveryResult = self->_discoveryResult;
  if (discoveryResult)
  {
    CFMutableStringRef v24 = v9;
    -[WiFiAwareDiscoveryResult datapathSupported](discoveryResult, "datapathSupported");
    -[WiFiAwareDiscoveryResult datapathSecurityRequired](self->_discoveryResult, "datapathSecurityRequired");
    -[WiFiAwareDiscoveryResult furtherServiceDiscoveryRequired]( self->_discoveryResult,  "furtherServiceDiscoveryRequired");
    NSAppendPrintF_safe(&v24);
    v15 = v24;

    v9 = v15;
  }

  CFMutableStringRef v23 = v9;
  NSAppendPrintF_safe(&v23);
  v16 = v23;

  CFMutableStringRef v22 = v16;
  NSPrintF();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe(&v22);
  v17 = v22;

  if (a3 <= 20)
  {
    CFMutableStringRef v21 = v17;
    NSAppendPrintF_safe(&v21);
    v18 = v21;

    v17 = v18;
  }

  return v17;
}

- (unsigned)updateWithDiscoveryResult:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_discoveryResult, a3);
  [v5 serviceSpecificInfo];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 blob];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  customData = self->_customData;
  v9 = v7;
  v10 = customData;
  if (v9 == v10)
  {

    unsigned int v13 = 0;
    unsigned __int16 v14 = v9;
LABEL_8:

    goto LABEL_9;
  }

  v11 = v10;
  if ((v9 == 0LL) == (v10 != 0LL))
  {

    goto LABEL_7;
  }

  char v12 = -[NSData isEqual:](v9, "isEqual:", v10);

  if ((v12 & 1) == 0)
  {
LABEL_7:
    v15 = v9;
    unsigned __int16 v14 = self->_customData;
    self->_customData = v15;
    unsigned int v13 = 1;
    goto LABEL_8;
  }

  unsigned int v13 = 0;
LABEL_9:
  if (!self->_identifier)
  {
    [v5 publisherAddress];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 data];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 publishID];
    _WiFiAwareCreateEndpointIdentifier(v17);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v18;

    if (self->_identifier) {
      unsigned int v13 = 1;
    }
  }

  [v6 instanceName];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CFMutableStringRef v21 = v20;
  if (v20)
  {
    name = self->_name;
    CFMutableStringRef v23 = v20;
    CFMutableStringRef v24 = name;
    if (v23 == v24)
    {

      goto LABEL_20;
    }

    CFMutableStringRef v25 = v24;
    if (v24)
    {
      char v26 = -[NSString isEqual:](v23, "isEqual:", v24);

      if ((v26 & 1) != 0) {
        goto LABEL_20;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_name, v21);
    v13 |= 2u;
  }

- (NSData)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)mockPeerEndpointString
{
  return self->_mockPeerEndpointString;
}

- (void)setMockPeerEndpointString:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)port
{
  return self->_port;
}

- (void)setPort:(int)a3
{
  self->_port = a3;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSDictionary)textInfo
{
  return self->_textInfo;
}

- (void)setTextInfo:(id)a3
{
}

- (WiFiAwareDiscoveryResult)discoveryResult
{
  return self->_discoveryResult;
}

- (void)setDiscoveryResult:(id)a3
{
}

- (unsigned)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(unsigned __int8)a3
{
  self->_instanceID = a3;
}

- (WiFiMACAddress)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end