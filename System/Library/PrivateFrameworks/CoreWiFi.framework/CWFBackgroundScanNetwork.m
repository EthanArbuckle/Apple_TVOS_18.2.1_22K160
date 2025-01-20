@interface CWFBackgroundScanNetwork
+ (BOOL)supportsSecureCoding;
- (BOOL)entry;
- (BOOL)exit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBackgroundScanNetwork:(id)a3;
- (CWFBackgroundScanNetwork)initWithCoder:(id)a3;
- (CWFChannel)channel;
- (NSString)BSSID;
- (NSString)description;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBSSID:(id)a3;
- (void)setChannel:(id)a3;
- (void)setEntry:(BOOL)a3;
- (void)setExit:(BOOL)a3;
@end

@implementation CWFBackgroundScanNetwork

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend_BSSID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)@"bssid", v15);

  objc_msgSend_channel(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONCompatibleKeyValueMap(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, (uint64_t)@"channel", v27);

  v28 = (void *)MEMORY[0x189607968];
  uint64_t v33 = objc_msgSend_entry(self, v29, v30, v31, v32);
  objc_msgSend_numberWithBool_(v28, v34, v33, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, (uint64_t)@"entry", v39);

  v40 = (void *)MEMORY[0x189607968];
  uint64_t v45 = objc_msgSend_exit(self, v41, v42, v43, v44);
  objc_msgSend_numberWithBool_(v40, v46, v45, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v50, (uint64_t)v49, (uint64_t)@"exit", v51);

  sub_1864586CC(v3, 0LL, 1u);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v52, (uint64_t)v55, v53, v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v56 = 0LL;
  }

  return v56;
}

- (NSString)description
{
  uint64_t v6 = (void *)NSString;
  objc_msgSend_BSSID(self, a2, v2, v3, v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v7, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_channel(self, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v22 = objc_msgSend_entry(self, v18, v19, v20, v21);
  unsigned int v27 = objc_msgSend_exit(self, v23, v24, v25, v26);
  objc_msgSend_stringWithFormat_( v6,  v28,  (uint64_t)@"bssid=%@, ch=%@, entry=%d, exit=%d",  v29,  v30,  v12,  v17,  v22,  v27);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v31;
}

- (BOOL)isEqualToBackgroundScanNetwork:(id)a3
{
  id v7 = a3;
  BSSID = self->_BSSID;
  objc_msgSend_BSSID(v7, v9, v10, v11, v12);
  uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (BSSID != v17)
  {
    if (!self->_BSSID || (objc_msgSend_BSSID(v7, v13, v14, v15, v16), (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v28 = 0;
      goto LABEL_23;
    }

    uint64_t v3 = (void *)v18;
    uint64_t v23 = self->_BSSID;
    objc_msgSend_BSSID(v7, v19, v20, v21, v22);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v23, v25, (uint64_t)v24, v26, v27))
    {
      BOOL v28 = 0;
LABEL_22:

      goto LABEL_23;
    }

    v52 = v24;
  }

  channel = self->_channel;
  objc_msgSend_channel(v7, v13, v14, v15, v16);
  v34 = (CWFChannel *)objc_claimAutoreleasedReturnValue();
  if (channel != v34)
  {
    if (!self->_channel) {
      goto LABEL_20;
    }
    uint64_t v35 = objc_msgSend_channel(v7, v30, v31, v32, v33);
    if (!v35) {
      goto LABEL_18;
    }
    uint64_t v4 = (void *)v35;
    v40 = self->_channel;
    objc_msgSend_channel(v7, v36, v37, v38, v39);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v40, v41, (uint64_t)v5, v42, v43))
    {
      BOOL v28 = 0;
      uint64_t v24 = v52;
LABEL_14:

      goto LABEL_21;
    }
  }

  int entry = self->_entry;
  if (entry == objc_msgSend_entry(v7, v30, v31, v32, v33))
  {
    int exit = self->_exit;
    BOOL v28 = exit == objc_msgSend_exit(v7, v45, v46, v47, v48);
    BOOL v50 = channel == v34;
    uint64_t v24 = v52;
    if (v50) {
      goto LABEL_21;
    }
    goto LABEL_14;
  }

  if (channel != v34)
  {

LABEL_18:
    BOOL v28 = 0;
    uint64_t v24 = v52;
    if (BSSID == v17) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFBackgroundScanNetwork *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToBackgroundScanNetwork = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToBackgroundScanNetwork = objc_msgSend_isEqualToBackgroundScanNetwork_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToBackgroundScanNetwork = 0;
  }

  return isEqualToBackgroundScanNetwork;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_BSSID, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_channel, v7, v8, v9, v10) ^ v6 ^ self->_entry ^ (unint64_t)self->_exit;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFBackgroundScanNetwork, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setBSSID_(v11, v12, (uint64_t)self->_BSSID, v13, v14);
  objc_msgSend_setChannel_(v11, v15, (uint64_t)self->_channel, v16, v17);
  objc_msgSend_setEntry_(v11, v18, self->_entry, v19, v20);
  objc_msgSend_setExit_(v11, v21, self->_exit, v22, v23);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BSSID = self->_BSSID;
  id v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)BSSID, (uint64_t)@"_BSSID", v6);
  objc_msgSend_encodeObject_forKey_(v13, v7, (uint64_t)self->_channel, (uint64_t)@"_channel", v8);
  objc_msgSend_encodeBool_forKey_(v13, v9, self->_entry, (uint64_t)@"_entry", v10);
  objc_msgSend_encodeBool_forKey_(v13, v11, self->_exit, (uint64_t)@"_exit", v12);
}

- (CWFBackgroundScanNetwork)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CWFBackgroundScanNetwork;
  uint64_t v5 = -[CWFBackgroundScanNetwork init](&v23, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)@"_BSSID", v8);
    BSSID = v5->_BSSID;
    v5->_BSSID = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)@"_channel", v13);
    channel = v5->_channel;
    v5->_channel = (CWFChannel *)v14;

    v5->_int entry = objc_msgSend_decodeBoolForKey_(v4, v16, (uint64_t)@"_entry", v17, v18);
    v5->_int exit = objc_msgSend_decodeBoolForKey_(v4, v19, (uint64_t)@"_exit", v20, v21);
  }

  return v5;
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
}

- (BOOL)entry
{
  return self->_entry;
}

- (void)setEntry:(BOOL)a3
{
  self->_int entry = a3;
}

- (BOOL)exit
{
  return self->_exit;
}

- (void)setExit:(BOOL)a3
{
  self->_int exit = a3;
}

- (CWFChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end