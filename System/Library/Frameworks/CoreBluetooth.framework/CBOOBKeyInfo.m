@interface CBOOBKeyInfo
- (BOOL)isEqual:(id)a3;
- (CBOOBKeyInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSData)btAddressData;
- (NSData)irkData;
- (id)description;
- (unint64_t)hash;
- (unint64_t)proxyHash;
- (unsigned)addressType;
- (unsigned)btAddressType;
- (unsigned)keyType;
- (unsigned)version;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAddressType:(unsigned __int8)a3;
- (void)setBtAddressData:(id)a3;
- (void)setBtAddressType:(unsigned __int8)a3;
- (void)setIrkData:(id)a3;
- (void)setKeyType:(unsigned __int8)a3;
- (void)setVersion:(unsigned __int16)a3;
@end

@implementation CBOOBKeyInfo

- (CBOOBKeyInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[CBOOBKeyInfo init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      [(id)objc_opt_class() description];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ init failed", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_13;
  }

  if (MEMORY[0x18959FCE0](v6) != MEMORY[0x1895F9250])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v27);
      v17 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }

    goto LABEL_13;
  }

  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_btAddressType = 0;
  }

  else if (v14 == 5)
  {
    goto LABEL_13;
  }

  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_btAddressType = 0;
  }

  else if (v15 == 5)
  {
    int v16 = CUXPCDecodeUInt64RangedEx();
    if (v16 == 6)
    {
      v7->_addressType = 0;
    }

    else if (v16 == 5)
    {
      goto LABEL_13;
    }
  }

  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v7->_keyType = 0;
    goto LABEL_18;
  }

  if (v18 == 5)
  {
LABEL_13:
    v17 = 0LL;
    goto LABEL_22;
  }

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  btAddressData = self->_btAddressData;
  xpc_object_t xdict = v4;
  if (btAddressData)
  {
    id v6 = btAddressData;
    uint64_t v7 = -[NSData bytes](v6, "bytes");
    if (v7) {
      uint64_t v8 = (const char *)v7;
    }
    else {
      uint64_t v8 = "";
    }
    size_t v9 = -[NSData length](v6, "length");

    xpc_dictionary_set_data(xdict, "btAd", v8, v9);
  }

  if (self->_btAddressType
    && (xpc_dictionary_set_uint64(xdict, "btAT", self->_btAddressType), (unsigned int btAddressType = self->_btAddressType) != 0)
    || (unsigned int btAddressType = self->_addressType) != 0)
  {
    xpc_dictionary_set_uint64(xdict, "btAT", btAddressType);
  }

  irkData = self->_irkData;
  if (irkData)
  {
    uint64_t v12 = irkData;
    id v13 = xdict;
    int v14 = v12;
    uint64_t v15 = -[NSData bytes](v14, "bytes");
    if (v15) {
      int v16 = (const char *)v15;
    }
    else {
      int v16 = "";
    }
    size_t v17 = -[NSData length](v14, "length");

    xpc_dictionary_set_data(v13, "irkD", v16, v17);
  }

  int v18 = xdict;
  if (self->_keyType)
  {
    xpc_dictionary_set_uint64(xdict, "irkT", self->_keyType);
    int v18 = xdict;
  }
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 length];
  v5 = -[CBOOBKeyInfo btAddressData](self, "btAddressData");
  id v6 = v5;
  if (v4 == 7)
  {
    uint64_t v7 = objc_msgSend(v5, "subdataWithRange:", 1, 6);

    id v6 = (void *)v7;
  }

  id v8 = objc_alloc(NSString);
  CUPrintNSDataAddress();
  size_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v10 = self->_addressType | self->_btAddressType;
  -[CBOOBKeyInfo irkData](self, "irkData");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSObjectMasked();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags32();
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = (void *)[v8 initWithFormat:@"Addr %@, AddrType: %x, IRK %@, keyUsage: %@", v9, v10, v12, v13];

  return v14;
}

- (unint64_t)hash
{
  if (-[CBOOBKeyInfo keyType](self, "keyType")) {
    return -[CBOOBKeyInfo proxyHash](self, "proxyHash");
  }
  -[CBOOBKeyInfo btAddressData](self, "btAddressData");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 hash];
  -[CBOOBKeyInfo irkData](self, "irkData");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (unint64_t)proxyHash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ -[CBOOBKeyInfo keyType](self, "keyType");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CBOOBKeyInfo *)a3;
  unint64_t v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      BOOL v14 = 1;
      goto LABEL_20;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v6 = v5;
      int v7 = -[CBOOBKeyInfo addressType](self, "addressType");
      if (v7 != -[CBOOBKeyInfo addressType](v6, "addressType")) {
        goto LABEL_18;
      }
      -[CBOOBKeyInfo btAddressData](self, "btAddressData");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBOOBKeyInfo btAddressData](v6, "btAddressData");
      size_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = v8;
      id v11 = v9;
      if (v10 == v11)
      {
      }

      else
      {
        uint64_t v12 = v11;
        if ((v10 == 0LL) == (v11 != 0LL)) {
          goto LABEL_17;
        }
        char v13 = [v10 isEqual:v11];

        if ((v13 & 1) == 0) {
          goto LABEL_18;
        }
      }

      int v15 = -[CBOOBKeyInfo btAddressType](self, "btAddressType");
      if (v15 != -[CBOOBKeyInfo btAddressType](v6, "btAddressType")) {
        goto LABEL_18;
      }
      -[CBOOBKeyInfo irkData](self, "irkData");
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBOOBKeyInfo irkData](v6, "irkData");
      size_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = v16;
      id v18 = v17;
      if (v10 == v18)
      {

LABEL_22:
        int v21 = -[CBOOBKeyInfo keyType](self, "keyType");
        BOOL v14 = v21 == -[CBOOBKeyInfo keyType](v6, "keyType");
        goto LABEL_19;
      }

      uint64_t v12 = v18;
      if ((v10 == 0LL) != (v18 != 0LL))
      {
        char v19 = [v10 isEqual:v18];

        if ((v19 & 1) != 0) {
          goto LABEL_22;
        }
LABEL_18:
        BOOL v14 = 0;
LABEL_19:

        goto LABEL_20;
      }

- (NSData)btAddressData
{
  return self->_btAddressData;
}

- (void)setBtAddressData:(id)a3
{
}

- (unsigned)btAddressType
{
  return self->_btAddressType;
}

- (void)setBtAddressType:(unsigned __int8)a3
{
  self->_unsigned int btAddressType = a3;
}

- (unsigned)addressType
{
  return self->_addressType;
}

- (void)setAddressType:(unsigned __int8)a3
{
  self->_addressType = a3;
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
}

- (unsigned)keyType
{
  return self->_keyType;
}

- (void)setKeyType:(unsigned __int8)a3
{
  self->_keyType = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
}

@end