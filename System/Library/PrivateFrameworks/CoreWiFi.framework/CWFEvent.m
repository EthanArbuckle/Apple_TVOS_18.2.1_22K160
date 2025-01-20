@interface CWFEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEvent:(id)a3;
- (CWFEvent)init;
- (CWFEventID)eventID;
- (NSDate)timestamp;
- (NSDictionary)info;
- (NSUUID)UUID;
- (id)JSONCompatibleKeyValueMap;
- (id)acknowledge;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)acknowledgementTimeout;
- (unint64_t)hash;
- (void)setAcknowledge:(id)a3;
- (void)setAcknowledgementTimeout:(unint64_t)a3;
- (void)setEventID:(id)a3;
- (void)setInfo:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation CWFEvent

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend_eventID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v13 = objc_msgSend_type(v8, v9, v10, v11, v12);
  sub_186451AFC(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v19, (uint64_t)v18, (uint64_t)@"type", v20);

  objc_msgSend_eventID(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v31, (uint64_t)v30, (uint64_t)@"interface_name", v32);

  objc_msgSend_timestamp(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, (uint64_t)@"timestamp", v39);

  objc_msgSend_UUID(self, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v44, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v50, (uint64_t)v49, (uint64_t)@"uuid", v51);

  v52 = (void *)MEMORY[0x189607968];
  uint64_t v57 = objc_msgSend_acknowledgementTimeout(self, v53, v54, v55, v56);
  objc_msgSend_numberWithUnsignedLongLong_(v52, v58, v57, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v62, (uint64_t)v61, (uint64_t)@"acknowledgement_timeout", v63);

  objc_msgSend_info(self, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, (uint64_t)@"info", v70);

  sub_1864586CC(v3, 0LL, 1u);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v71, (uint64_t)v74, v72, v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v75 = 0LL;
  }

  return v75;
}

- (CWFEvent)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CWFEvent;
  uint64_t v6 = -[CWFEvent init](&v10, sel_init);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_UUID(MEMORY[0x189607AB8], v2, v3, v4, v5);
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;
  }

  return v6;
}

- (int64_t)type
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v10 = objc_msgSend_type(v5, v6, v7, v8, v9);

  return v10;
}

- (void)setType:(int64_t)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setType_(v9, v6, a3, v7, v8);
}

- (id)description
{
  uint64_t v6 = (void *)NSString;
  eventID = self->_eventID;
  objc_msgSend_UUIDString(self->_UUID, a2, v2, v3, v4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v8, v9, 5, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1864535C8(self->_timestamp);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_( v6,  v14,  (uint64_t)@"%@, uuid=%@, timestamp=%@, ackTimeout=%lluns, info=%@",  v15,  v16,  eventID,  v12,  v13,  self->_acknowledgementTimeout,  self->_info);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v6 = a3;
  uint64_t v11 = v6;
  if (self->_UUID)
  {
    objc_msgSend_UUID(v6, v7, v8, v9, v10);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      char isEqual = 0;
LABEL_22:

      goto LABEL_23;
    }

    UUID = self->_UUID;
    objc_msgSend_UUID(v11, v12, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(UUID, v19, (uint64_t)v18, v20, v21))
    {
      char isEqual = 0;
LABEL_21:

      goto LABEL_22;
    }

    eventID = self->_eventID;
    objc_msgSend_eventID(v11, v22, v23, v24, v25);
    v31 = (CWFEventID *)objc_claimAutoreleasedReturnValue();
    if (eventID == v31)
    {
      timestamp = self->_timestamp;
      p_timestamp = &self->_timestamp;
      if (timestamp) {
        goto LABEL_14;
      }
    }

    else if (self->_eventID)
    {
      uint64_t v32 = objc_msgSend_eventID(v11, v27, v28, v29, v30);
      if (v32)
      {
        uint64_t v3 = (void *)v32;
        v37 = self->_eventID;
        objc_msgSend_eventID(v11, v33, v34, v35, v36);
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v37, v38, (uint64_t)v4, v39, v40) & 1) == 0
          || (uint64_t v42 = self->_timestamp, p_timestamp = &self->_timestamp, !v42))
        {
          char isEqual = 0;
LABEL_19:

          goto LABEL_20;
        }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFEvent *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToEvent = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToEvent = objc_msgSend_isEqualToEvent_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToEvent = 0;
  }

  return isEqualToEvent;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_eventID, v7, v8, v9, v10) ^ v6;
  return v11 ^ objc_msgSend_hash(self->_timestamp, v12, v13, v14, v15);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFEvent, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setEventID_(v11, v15, (uint64_t)self->_eventID, v16, v17);
  objc_msgSend_setTimestamp_(v11, v18, (uint64_t)self->_timestamp, v19, v20);
  objc_msgSend_setInfo_(v11, v21, (uint64_t)self->_info, v22, v23);
  objc_msgSend_setAcknowledgementTimeout_(v11, v24, self->_acknowledgementTimeout, v25, v26);
  objc_msgSend_setAcknowledge_(v11, v27, (uint64_t)self->_acknowledge, v28, v29);
  return v11;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (CWFEventID)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
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

- (id)acknowledge
{
  return self->_acknowledge;
}

- (void)setAcknowledge:(id)a3
{
}

- (void).cxx_destruct
{
}

@end