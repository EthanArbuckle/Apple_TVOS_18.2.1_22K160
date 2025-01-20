@interface CBServiceUUIDParamInfo
- (BOOL)isEqual:(id)a3;
- (CBServiceUUIDParamInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSData)blobData;
- (NSData)maskData;
- (NSData)serviceUUID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBlobData:(id)a3;
- (void)setMaskData:(id)a3;
- (void)setServiceUUID:(id)a3;
@end

@implementation CBServiceUUIDParamInfo

- (CBServiceUUIDParamInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[CBServiceUUIDParamInfo init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      [(id)objc_opt_class() description];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0LL;
      goto LABEL_7;
    }

- (void)encodeWithXPCObject:(id)a3
{
  xpc_object_t xdict = a3;
  serviceUUID = self->_serviceUUID;
  if (serviceUUID)
  {
    v5 = serviceUUID;
    uint64_t v6 = -[NSData bytes](v5, "bytes");
    if (v6) {
      v7 = (const char *)v6;
    }
    else {
      v7 = "";
    }
    size_t v8 = -[NSData length](v5, "length");

    xpc_dictionary_set_data(xdict, "sUID", v7, v8);
  }

  blobData = self->_blobData;
  if (blobData)
  {
    uint64_t v10 = blobData;
    id v11 = xdict;
    uint64_t v12 = v10;
    uint64_t v13 = -[NSData bytes](v12, "bytes");
    if (v13) {
      v14 = (const char *)v13;
    }
    else {
      v14 = "";
    }
    size_t v15 = -[NSData length](v12, "length");

    xpc_dictionary_set_data(v11, "uBlb", v14, v15);
  }

  maskData = self->_maskData;
  if (maskData)
  {
    uint64_t v17 = maskData;
    id v18 = xdict;
    uint64_t v19 = v17;
    uint64_t v20 = -[NSData bytes](v19, "bytes");
    if (v20) {
      uint64_t v21 = (const char *)v20;
    }
    else {
      uint64_t v21 = "";
    }
    size_t v22 = -[NSData length](v19, "length");

    xpc_dictionary_set_data(v18, "uMsk", v21, v22);
  }
}

- (id)description
{
  return (id)[objc_alloc(NSString) initWithFormat:@"ServiceUUID %@, blob %@, mask: %@", self->_serviceUUID, self->_blobData, self->_maskData];
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  v5 = -[CBServiceUUIDParamInfo blobData](self, "blobData");
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = -[CBServiceUUIDParamInfo maskData](self, "maskData");
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CBServiceUUIDParamInfo *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      char v13 = 1;
      goto LABEL_22;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v6 = v5;
      v7 = -[CBServiceUUIDParamInfo serviceUUID](self, "serviceUUID");
      -[CBServiceUUIDParamInfo serviceUUID](v6, "serviceUUID");
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = v7;
      id v10 = v8;
      if (v9 == v10)
      {
      }

      else
      {
        id v11 = v10;
        if ((v9 == 0LL) == (v10 != 0LL)) {
          goto LABEL_19;
        }
        char v12 = [v9 isEqual:v10];

        if ((v12 & 1) == 0) {
          goto LABEL_14;
        }
      }
      v14 = -[CBServiceUUIDParamInfo blobData](self, "blobData");
      -[CBServiceUUIDParamInfo blobData](v6, "blobData");
      size_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = v14;
      id v16 = v15;
      if (v9 == v16)
      {
      }

      else
      {
        id v11 = v16;
        if ((v9 == 0LL) == (v16 != 0LL)) {
          goto LABEL_19;
        }
        char v17 = [v9 isEqual:v16];

        if ((v17 & 1) == 0)
        {
LABEL_14:
          char v13 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }

      -[CBServiceUUIDParamInfo maskData](self, "maskData");
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBServiceUUIDParamInfo maskData](v6, "maskData");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = v18;
      id v20 = v19;
      id v11 = v20;
      if (v9 == v20)
      {
        char v13 = 1;
        goto LABEL_20;
      }

      if ((v9 == 0LL) != (v20 != 0LL))
      {
        char v13 = [v9 isEqual:v20];
LABEL_20:

        goto LABEL_21;
      }

- (NSData)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
}

- (NSData)blobData
{
  return self->_blobData;
}

- (void)setBlobData:(id)a3
{
}

- (NSData)maskData
{
  return self->_maskData;
}

- (void)setMaskData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end