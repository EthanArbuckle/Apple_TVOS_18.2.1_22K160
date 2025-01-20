@interface CUMobileDevice
- (BOOL)connected;
- (BOOL)paired;
- (BOOL)placeholder;
- (NSString)internalModel;
- (NSString)name;
- (NSString)udid;
- (NSString)wifiAddress;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)setConnected:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternalModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setUdid:(id)a3;
- (void)setWifiAddress:(id)a3;
@end

@implementation CUMobileDevice

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CUMobileDevice;
  -[CUMobileDevice dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    if (self->_connected) {
      *(_BYTE *)(v4 + 8) = 1;
    }
    identifier = self->_identifier;
    if (identifier) {
      objc_storeStrong((id *)(v4 + 16), identifier);
    }
    internalModel = self->_internalModel;
    name = self->_name;
    if (name) {
      objc_storeStrong((id *)(v5 + 32), name);
    }
    if (self->_paired) {
      *(_BYTE *)(v5 + 9) = 1;
    }
    if (self->_placeholder) {
      *(_BYTE *)(v5 + 10) = 1;
    }
    udid = self->_udid;
    if (udid) {
      objc_storeStrong((id *)(v5 + 40), udid);
    }
    wifiAddress = self->_wifiAddress;
    if (wifiAddress) {
      objc_storeStrong((id *)(v5 + 48), wifiAddress);
    }
  }

  return (id)v5;
}

- (id)description
{
  CFMutableStringRef v18 = 0LL;
  NSAppendPrintF(&v18);
  v3 = v18;
  uint64_t v4 = v3;
  if (self->_udid)
  {
    CFMutableStringRef v17 = v3;
    NSAppendPrintF(&v17);
    uint64_t v5 = v17;

    uint64_t v4 = v5;
  }

  if (self->_name)
  {
    CFMutableStringRef v16 = v4;
    NSAppendPrintF(&v16);
    v6 = v16;

    uint64_t v4 = v6;
  }

  if (self->_internalModel)
  {
    CFMutableStringRef v15 = v4;
    NSAppendPrintF(&v15);
    v7 = v15;

    uint64_t v4 = v7;
  }

  if (self->_wifiAddress)
  {
    CFMutableStringRef v14 = v4;
    NSAppendPrintF(&v14);
    v8 = v14;

    uint64_t v4 = v8;
  }

  CFMutableStringRef v13 = v4;
  NSAppendPrintF(&v13);
  v9 = v13;

  if (self->_placeholder)
  {
    CFMutableStringRef v12 = v9;
    NSAppendPrintF(&v12);
    v10 = v12;

    v9 = v10;
  }

  return v9;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)internalModel
{
  return self->_internalModel;
}

- (void)setInternalModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
}

- (NSString)wifiAddress
{
  return self->_wifiAddress;
}

- (void)setWifiAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end