@interface CBPairingInfo
- (CBDevice)device;
- (CBPairingInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSError)error;
- (NSString)pin;
- (id)description;
- (int64_t)pairingType;
- (unsigned)flags;
- (void)encodeWithXPCObject:(id)a3;
- (void)setDevice:(id)a3;
- (void)setError:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setPairingType:(int64_t)a3;
- (void)setPin:(id)a3;
@end

@implementation CBPairingInfo

- (CBPairingInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[CBPairingInfo init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      [(id)objc_opt_class() description];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ init failed", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v18 = 0LL;
      goto LABEL_14;
    }

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  CUXPCEncodeObject();
  if (self->_error) {
    CUXPCEncodeNSError();
  }
  uint64_t flags = self->_flags;
  if ((_DWORD)flags) {
    xpc_dictionary_set_uint64(v4, "prFl", flags);
  }
  pin = self->_pin;
  xpc_object_t xdict = v4;
  v7 = -[NSString UTF8String](pin, "UTF8String");
  if (v7) {
    xpc_dictionary_set_string(xdict, "prPN", v7);
  }

  int64_t pairingType = self->_pairingType;
  if (pairingType) {
    xpc_dictionary_set_int64(xdict, "prTy", pairingType);
  }
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags32();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSError();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  id v4 = (__CFString *)0LL;

  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"?";
  }
  id v6 = v5;

  return v6;
}

- (CBDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_uint64_t flags = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_int64_t pairingType = a3;
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end