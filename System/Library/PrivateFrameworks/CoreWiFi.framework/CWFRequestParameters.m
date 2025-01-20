@interface CWFRequestParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequestParameters:(id)a3;
- (CWFRequestParameters)init;
- (CWFRequestParameters)initWithCoder:(id)a3;
- (NSString)interfaceName;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)virtualInterfaceRole;
- (int64_t)qualityOfService;
- (int64_t)queuePriority;
- (unint64_t)hash;
- (unint64_t)timeout;
- (void)encodeWithCoder:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setQueuePriority:(int64_t)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)setUUID:(id)a3;
- (void)setVirtualInterfaceRole:(int)a3;
@end

@implementation CWFRequestParameters

- (CWFRequestParameters)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CWFRequestParameters;
  v6 = -[CWFRequestParameters init](&v10, sel_init);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_UUID(MEMORY[0x189607AB8], v2, v3, v4, v5);
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;
  }

  return v6;
}

- (id)description
{
  v6 = (void *)NSString;
  interfaceName = self->_interfaceName;
  unint64_t timeout = self->_timeout;
  objc_msgSend_UUIDString(self->_UUID, a2, v2, v3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v9, v10, 5, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_( v6,  v14,  (uint64_t)@"intf=%@ timeout=%lluns uuid=%@ priority=%ld qos=%ld",  v15,  v16,  interfaceName,  timeout,  v13,  self->_queuePriority,  self->_qualityOfService);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isEqualToRequestParameters:(id)a3
{
  id v6 = a3;
  uint64_t v11 = v6;
  if (self->_UUID)
  {
    objc_msgSend_UUID(v6, v7, v8, v9, v10);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      BOOL v42 = 0;
LABEL_22:

      goto LABEL_23;
    }

    UUID = self->_UUID;
    objc_msgSend_UUID(v11, v12, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(UUID, v19, (uint64_t)v18, v20, v21))
    {
      BOOL v42 = 0;
LABEL_21:

      goto LABEL_22;
    }

    interfaceName = self->_interfaceName;
    objc_msgSend_interfaceName(v11, v22, v23, v24, v25);
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!self->_interfaceName
      || (objc_msgSend_interfaceName(v11, v27, v28, v29, v30), (uint64_t v32 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v42 = 0;
LABEL_20:

      goto LABEL_21;
    }

    uint64_t v3 = (void *)v32;
    v37 = self->_interfaceName;
    objc_msgSend_interfaceName(v11, v33, v34, v35, v36);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v37, v38, (uint64_t)v4, v39, v40))
    {
LABEL_13:
      int virtualInterfaceRole = self->_virtualInterfaceRole;
      if (virtualInterfaceRole == objc_msgSend_virtualInterfaceRole(v11, v27, v28, v29, v30)
        && (unint64_t timeout = self->_timeout, timeout == objc_msgSend_timeout(v11, v44, v45, v46, v47))
        && (int64_t qualityOfService = self->_qualityOfService,
            qualityOfService == objc_msgSend_qualityOfService(v11, v49, v50, v51, v52)))
      {
        int64_t queuePriority = self->_queuePriority;
        BOOL v41 = queuePriority == objc_msgSend_queuePriority(v11, v54, v55, v56, v57);
        BOOL v42 = v41;
      }

      else
      {
        BOOL v41 = 0;
        BOOL v42 = 0;
      }
    }

    else
    {
      BOOL v41 = 0;
    }

    BOOL v42 = v41;
    goto LABEL_20;
  }

  BOOL v42 = 0;
LABEL_23:

  return v42;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFRequestParameters *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToRequestParameters = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToRequestParameters = objc_msgSend_isEqualToRequestParameters_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToRequestParameters = 0;
  }

  return isEqualToRequestParameters;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10) ^ v6 ^ self->_virtualInterfaceRole ^ self->_timeout ^ self->_qualityOfService ^ self->_queuePriority;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFRequestParameters, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  objc_msgSend_setQualityOfService_(v11, v18, self->_qualityOfService, v19, v20);
  objc_msgSend_setQueuePriority_(v11, v21, self->_queuePriority, v22, v23);
  objc_msgSend_setVirtualInterfaceRole_(v11, v24, self->_virtualInterfaceRole, v25, v26);
  objc_msgSend_setTimeout_(v11, v27, self->_timeout, v28, v29);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v21 = a3;
  objc_msgSend_encodeObject_forKey_(v21, v5, (uint64_t)UUID, (uint64_t)@"_UUID", v6);
  objc_msgSend_encodeObject_forKey_(v21, v7, (uint64_t)self->_interfaceName, (uint64_t)@"_interfaceName", v8);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x189607968], v9, self->_timeout, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v21, v13, (uint64_t)v12, (uint64_t)@"_timeout", v14);

  objc_msgSend_encodeInteger_forKey_(v21, v15, self->_qualityOfService, (uint64_t)@"_qualityOfService", v16);
  objc_msgSend_encodeInteger_forKey_(v21, v17, self->_queuePriority, (uint64_t)@"_queuePriority", v18);
  objc_msgSend_encodeInteger_forKey_( v21,  v19,  self->_virtualInterfaceRole,  (uint64_t)@"_virtualInterfaceRole",  v20);
}

- (CWFRequestParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CWFRequestParameters;
  uint64_t v5 = -[CWFRequestParameters init](&v34, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)@"_UUID", v8);
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)@"_interfaceName", v13);
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)@"_timeout", v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t timeout = objc_msgSend_unsignedLongLongValue(v19, v20, v21, v22, v23);

    v5->_int64_t qualityOfService = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)@"_qualityOfService", v25, v26);
    v5->_int64_t queuePriority = objc_msgSend_decodeIntegerForKey_(v4, v27, (uint64_t)@"_queuePriority", v28, v29);
    v5->_int virtualInterfaceRole = objc_msgSend_decodeIntegerForKey_( v4,  v30,  (uint64_t)@"_virtualInterfaceRole",  v31,  v32);
  }

  return v5;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (int)virtualInterfaceRole
{
  return self->_virtualInterfaceRole;
}

- (void)setVirtualInterfaceRole:(int)a3
{
  self->_int virtualInterfaceRole = a3;
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_unint64_t timeout = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_int64_t qualityOfService = a3;
}

- (int64_t)queuePriority
{
  return self->_queuePriority;
}

- (void)setQueuePriority:(int64_t)a3
{
  self->_int64_t queuePriority = a3;
}

- (void).cxx_destruct
{
}

@end