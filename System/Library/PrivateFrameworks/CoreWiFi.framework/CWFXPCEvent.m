@interface CWFXPCEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToXPCEvent:(id)a3;
- (CWFXPCEvent)init;
- (CWFXPCEvent)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (NSDictionary)info;
- (NSString)interfaceName;
- (NSUUID)UUID;
- (id)__descriptionForEventType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)internalType;
- (int64_t)type;
- (unint64_t)acknowledgementTimeout;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAcknowledgementTimeout:(unint64_t)a3;
- (void)setInfo:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInternalType:(int64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation CWFXPCEvent

- (CWFXPCEvent)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CWFXPCEvent;
  v6 = -[CWFXPCEvent init](&v10, sel_init);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_UUID(MEMORY[0x189607AB8], v2, v3, v4, v5);
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;
  }

  return v6;
}

- (id)__descriptionForEventType
{
  unint64_t internalType = self->_internalType;
  else {
    sub_186451AFC(self->_type, a2, v2, v3, v4);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  v6 = (void *)NSString;
  objc_msgSend___descriptionForEventType(self, a2, v2, v3, v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  interfaceName = self->_interfaceName;
  objc_msgSend_UUIDString(self->_UUID, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v13, v14, 5, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1864535C8(self->_timestamp);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_( v6,  v19,  (uint64_t)@"type=%@, intf=%@, uuid=%@, timestamp=%@ ackTimeout=%lluns info=%@",  v20,  v21,  v7,  interfaceName,  v17,  v18,  self->_acknowledgementTimeout,  self->_info);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)isEqualToXPCEvent:(id)a3
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
LABEL_23:

      goto LABEL_24;
    }

    UUID = self->_UUID;
    objc_msgSend_UUID(v11, v12, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(UUID, v19, (uint64_t)v18, v20, v21))
    {
      BOOL v42 = 0;
LABEL_22:

      goto LABEL_23;
    }

    interfaceName = self->_interfaceName;
    objc_msgSend_interfaceName(v11, v22, v23, v24, v25);
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!self->_interfaceName
      || (objc_msgSend_interfaceName(v11, v27, v28, v29, v30), (uint64_t v32 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v42 = 0;
LABEL_21:

      goto LABEL_22;
    }

    uint64_t v3 = (void *)v32;
    v37 = self->_interfaceName;
    objc_msgSend_interfaceName(v11, v33, v34, v35, v36);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v37, v38, (uint64_t)v4, v39, v40))
    {
LABEL_13:
      int64_t type = self->_type;
      if (type == objc_msgSend_type(v11, v27, v28, v29, v30)
        && (int64_t internalType = self->_internalType, internalType == objc_msgSend_internalType(v11, v44, v45, v46, v47))
        && self->_timestamp
        && (objc_msgSend_timestamp(v11, v49, v50, v51, v52), (uint64_t v53 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v58 = (void *)v53;
        timestamp = self->_timestamp;
        objc_msgSend_timestamp(v11, v54, v55, v56, v57);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        char isEqual = objc_msgSend_isEqual_(timestamp, v61, (uint64_t)v60, v62, v63);

        BOOL v42 = isEqual;
      }

      else
      {
        char isEqual = 0;
        BOOL v42 = 0;
      }
    }

    else
    {
      char isEqual = 0;
    }

    BOOL v42 = isEqual;
    goto LABEL_21;
  }

  BOOL v42 = 0;
LABEL_24:

  return v42;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFXPCEvent *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToXPCEvent = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToXPCEvent = objc_msgSend_isEqualToXPCEvent_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToXPCEvent = 0;
  }

  return isEqualToXPCEvent;
}

- (unint64_t)hash
{
  int64_t v6 = self->_type ^ self->_internalType ^ objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10);
  return v6 ^ v11 ^ objc_msgSend_hash(self->_timestamp, v12, v13, v14, v15);
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFXPCEvent, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setType_(v11, v15, self->_type, v16, v17);
  objc_msgSend_setInternalType_(v11, v18, self->_internalType, v19, v20);
  objc_msgSend_setInterfaceName_(v11, v21, (uint64_t)self->_interfaceName, v22, v23);
  objc_msgSend_setTimestamp_(v11, v24, (uint64_t)self->_timestamp, v25, v26);
  objc_msgSend_setInfo_(v11, v27, (uint64_t)self->_info, v28, v29);
  objc_msgSend_setAcknowledgementTimeout_(v11, v30, self->_acknowledgementTimeout, v31, v32);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)UUID, (uint64_t)@"_UUID", v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_timestamp, (uint64_t)@"_timestamp", v9);
  objc_msgSend_encodeInteger_forKey_(v5, v10, self->_type, (uint64_t)@"_type", v11);
  objc_msgSend_encodeInteger_forKey_(v5, v12, self->_internalType, (uint64_t)@"_internalType", v13);
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)self->_interfaceName, (uint64_t)@"_interfaceName", v15);
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)self->_info, (uint64_t)@"_info", v17);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x189607968], v18, self->_acknowledgementTimeout, v19, v20);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v21, (uint64_t)v23, (uint64_t)@"_acknowledgementTimeout", v22);
}

- (CWFXPCEvent)initWithCoder:(id)a3
{
  v48[15] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___CWFXPCEvent;
  id v5 = -[CWFXPCEvent init](&v47, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)@"_UUID", v8);
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)@"_timestamp", v13);
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)@"_interfaceName", v18);
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v19;

    v5->_int64_t type = objc_msgSend_decodeIntegerForKey_(v4, v21, (uint64_t)@"_type", v22, v23);
    v5->_int64_t internalType = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)@"_internalType", v25, v26);
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    v48[2] = objc_opt_class();
    v48[3] = objc_opt_class();
    v48[4] = objc_opt_class();
    v48[5] = objc_opt_class();
    v48[6] = objc_opt_class();
    v48[7] = objc_opt_class();
    v48[8] = objc_opt_class();
    v48[9] = objc_opt_class();
    v48[10] = objc_opt_class();
    v48[11] = objc_opt_class();
    v48[12] = objc_opt_class();
    v48[13] = objc_opt_class();
    v48[14] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v27, (uint64_t)v48, 15, v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(MEMORY[0x189604010], v30, (uint64_t)v29, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, (uint64_t)@"_info", v35);
    info = v5->_info;
    v5->_info = (NSDictionary *)v36;

    uint64_t v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, (uint64_t)@"_acknowledgementTimeout", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_acknowledgementTimeout = objc_msgSend_unsignedLongLongValue(v41, v42, v43, v44, v45);
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

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (int64_t)internalType
{
  return self->_internalType;
}

- (void)setInternalType:(int64_t)a3
{
  self->_int64_t internalType = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (unint64_t)acknowledgementTimeout
{
  return self->_acknowledgementTimeout;
}

- (void)setAcknowledgementTimeout:(unint64_t)a3
{
  self->_acknowledgementTimeout = a3;
}

- (void).cxx_destruct
{
}

@end