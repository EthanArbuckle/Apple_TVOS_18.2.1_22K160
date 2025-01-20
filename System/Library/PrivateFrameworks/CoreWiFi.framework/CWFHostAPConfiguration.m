@interface CWFHostAPConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)forceBeaconInterval100ms;
- (BOOL)forceHiddenMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHostAPConfiguration:(id)a3;
- (CWFChannel)channel;
- (CWFHostAPConfiguration)initWithCoder:(id)a3;
- (NSData)IEList;
- (NSData)SSID;
- (NSString)bridgeInterfaceName;
- (NSString)password;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)PHYMode;
- (int)bridgeMode;
- (int)bridgeType;
- (unint64_t)hash;
- (unint64_t)securityType;
- (void)encodeWithCoder:(id)a3;
- (void)setBridgeInterfaceName:(id)a3;
- (void)setBridgeMode:(int)a3;
- (void)setBridgeType:(int)a3;
- (void)setChannel:(id)a3;
- (void)setForceBeaconInterval100ms:(BOOL)a3;
- (void)setForceHiddenMode:(BOOL)a3;
- (void)setIEList:(id)a3;
- (void)setPHYMode:(int)a3;
- (void)setPassword:(id)a3;
- (void)setSSID:(id)a3;
- (void)setSecurityType:(unint64_t)a3;
@end

@implementation CWFHostAPConfiguration

- (id)description
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHumanReadableStringFromData(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_hasPrefix_(v12, v13, (uint64_t)@" ", v14, v15) & 1) != 0
    || objc_msgSend_hasSuffix_(v12, v16, (uint64_t)@" ", v17, v18))
  {
    uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v16, (uint64_t)@"'%@'", v17, v18, v12);

    v12 = (void *)v19;
  }

  objc_msgSend_appendFormat_(v6, v16, (uint64_t)@"%@ - ", v17, v18, v12);
  objc_msgSend_SSID(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHexadecimalStringFromData(v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v30, (uint64_t)@"ssid=%@, ", v31, v32, v29);

  uint64_t v37 = objc_msgSend_securityType(self, v33, v34, v35, v36);
  sub_186453234(v37, 0LL, 0LL, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v41, (uint64_t)@"security=%@, ", v42, v43, v40);

  objc_msgSend_channel(self, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v49, (uint64_t)@"channel=[%@], ", v50, v51, v48);

  objc_msgSend_password(self, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v57, (uint64_t)@"hasPassword=%d, ", v58, v59, v56 != 0);

  if (objc_msgSend_PHYMode(self, v60, v61, v62, v63))
  {
    int v68 = objc_msgSend_PHYMode(self, v64, v65, v66, v67);
    sub_1864534A4(v68, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v74, (uint64_t)@"phy=%@, ", v75, v76, v73);
  }

  if (objc_msgSend_forceHiddenMode(self, v64, v65, v66, v67))
  {
    unsigned int v81 = objc_msgSend_forceHiddenMode(self, v77, v78, v79, v80);
    objc_msgSend_appendFormat_(v6, v82, (uint64_t)@"forceHidden=%d, ", v83, v84, v81);
  }

  if (objc_msgSend_forceBeaconInterval100ms(self, v77, v78, v79, v80))
  {
    unsigned int v89 = objc_msgSend_forceBeaconInterval100ms(self, v85, v86, v87, v88);
    objc_msgSend_appendFormat_(v6, v90, (uint64_t)@"forceBI100=%d, ", v91, v92, v89);
  }

  if (objc_msgSend_bridgeMode(self, v85, v86, v87, v88)
    || objc_msgSend_bridgeType(self, v93, v94, v95, v96)
    || (objc_msgSend_bridgeInterfaceName(self, v93, v94, v95, v96),
        v97 = (void *)objc_claimAutoreleasedReturnValue(),
        v97,
        v97))
  {
    uint64_t v98 = objc_msgSend_bridgeMode(self, v93, v94, v95, v96);
    uint64_t v103 = objc_msgSend_bridgeType(self, v99, v100, v101, v102);
    objc_msgSend_bridgeInterfaceName(self, v104, v105, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_( v6,  v109,  (uint64_t)@"bridge=[mode=%d, type=%d, intf=%@], ",  v110,  v111,  v98,  v103,  v108);
  }

  objc_msgSend_IEList(self, v93, v94, v95, v96);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHexadecimalStringFromData(v112, v113, v114, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v118, (uint64_t)@"IEList=%@", v119, v120, v117);

  return v6;
}

- (BOOL)isEqualToHostAPConfiguration:(id)a3
{
  id v6 = a3;
  SSID = self->_SSID;
  objc_msgSend_SSID(v6, v8, v9, v10, v11);
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (SSID == v16)
  {
    unint64_t securityType = self->_securityType;
    if (securityType == objc_msgSend_securityType(v6, v12, v13, v14, v15)) {
      goto LABEL_8;
    }
LABEL_13:
    char isEqual = 0;
    goto LABEL_46;
  }

  if (!self->_SSID) {
    goto LABEL_13;
  }
  uint64_t v17 = objc_msgSend_SSID(v6, v12, v13, v14, v15);
  if (!v17) {
    goto LABEL_13;
  }
  uint64_t v3 = (void *)v17;
  uint64_t v22 = self->_SSID;
  objc_msgSend_SSID(v6, v18, v19, v20, v21);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25) & 1) == 0
    || (unint64_t v30 = self->_securityType, v30 != objc_msgSend_securityType(v6, v26, v27, v28, v29)))
  {
    char isEqual = 0;
LABEL_45:

    goto LABEL_46;
  }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFHostAPConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToHostAPConfiguration = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToHostAPConfiguration = objc_msgSend_isEqualToHostAPConfiguration_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToHostAPConfiguration = 0;
  }

  return isEqualToHostAPConfiguration;
}

- (unint64_t)hash
{
  unint64_t v6 = self->_securityType ^ objc_msgSend_hash(self->_SSID, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_channel, v7, v8, v9, v10);
  unint64_t v16 = v6 ^ v11 ^ objc_msgSend_hash(self->_password, v12, v13, v14, v15) ^ self->_PHYMode ^ (unint64_t)self->_forceHiddenMode ^ self->_forceBeaconInterval100ms ^ self->_bridgeMode;
  uint64_t bridgeType = self->_bridgeType;
  uint64_t v22 = bridgeType ^ objc_msgSend_hash(self->_bridgeInterfaceName, v18, v19, v20, v21);
  return v16 ^ v22 ^ objc_msgSend_hash(self->_IEList, v23, v24, v25, v26);
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFHostAPConfiguration, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setSSID_(v11, v12, (uint64_t)self->_SSID, v13, v14);
  objc_msgSend_setSecurityType_(v11, v15, self->_securityType, v16, v17);
  objc_msgSend_setChannel_(v11, v18, (uint64_t)self->_channel, v19, v20);
  objc_msgSend_setPassword_(v11, v21, (uint64_t)self->_password, v22, v23);
  objc_msgSend_setPHYMode_(v11, v24, self->_PHYMode, v25, v26);
  objc_msgSend_setForceHiddenMode_(v11, v27, self->_forceHiddenMode, v28, v29);
  objc_msgSend_setForceBeaconInterval100ms_(v11, v30, self->_forceBeaconInterval100ms, v31, v32);
  objc_msgSend_setBridgeMode_(v11, v33, self->_bridgeMode, v34, v35);
  objc_msgSend_setBridgeType_(v11, v36, self->_bridgeType, v37, v38);
  objc_msgSend_setBridgeInterfaceName_(v11, v39, (uint64_t)self->_bridgeInterfaceName, v40, v41);
  objc_msgSend_setIEList_(v11, v42, (uint64_t)self->_IEList, v43, v44);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  SSID = self->_SSID;
  id v27 = a3;
  objc_msgSend_encodeObject_forKey_(v27, v5, (uint64_t)SSID, (uint64_t)@"_SSID", v6);
  objc_msgSend_encodeInteger_forKey_(v27, v7, self->_securityType, (uint64_t)@"_securityType", v8);
  objc_msgSend_encodeObject_forKey_(v27, v9, (uint64_t)self->_channel, (uint64_t)@"_channel", v10);
  objc_msgSend_encodeObject_forKey_(v27, v11, (uint64_t)self->_password, (uint64_t)@"_password", v12);
  objc_msgSend_encodeInteger_forKey_(v27, v13, self->_PHYMode, (uint64_t)@"_PHYMode", v14);
  objc_msgSend_encodeBool_forKey_(v27, v15, self->_forceHiddenMode, (uint64_t)@"_forceHiddenMode", v16);
  objc_msgSend_encodeBool_forKey_( v27,  v17,  self->_forceBeaconInterval100ms,  (uint64_t)@"_forceBeaconInterval100ms",  v18);
  objc_msgSend_encodeInteger_forKey_(v27, v19, self->_bridgeMode, (uint64_t)@"_bridgeMode", v20);
  objc_msgSend_encodeInteger_forKey_(v27, v21, self->_bridgeType, (uint64_t)@"_bridgeType", v22);
  objc_msgSend_encodeObject_forKey_( v27,  v23,  (uint64_t)self->_bridgeInterfaceName,  (uint64_t)@"_bridgeInterfaceName",  v24);
  objc_msgSend_encodeObject_forKey_(v27, v25, (uint64_t)self->_IEList, (uint64_t)@"_IEList", v26);
}

- (CWFHostAPConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___CWFHostAPConfiguration;
  v5 = -[CWFHostAPConfiguration init](&v50, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)@"_SSID", v8);
    SSID = v5->_SSID;
    v5->_SSID = (NSData *)v9;

    v5->_unint64_t securityType = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)@"_securityType", v12, v13);
    uint64_t v14 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)@"_channel", v16);
    channel = v5->_channel;
    v5->_channel = (CWFChannel *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)@"_password", v21);
    password = v5->_password;
    v5->_password = (NSString *)v22;

    v5->_int PHYMode = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)@"_PHYMode", v25, v26);
    v5->_int forceHiddenMode = objc_msgSend_decodeBoolForKey_(v4, v27, (uint64_t)@"_forceHiddenMode", v28, v29);
    v5->_int forceBeaconInterval100ms = objc_msgSend_decodeBoolForKey_( v4,  v30,  (uint64_t)@"_forceBeaconInterval100ms",  v31,  v32);
    v5->_int bridgeMode = objc_msgSend_decodeIntegerForKey_(v4, v33, (uint64_t)@"_bridgeMode", v34, v35);
    v5->_uint64_t bridgeType = objc_msgSend_decodeIntegerForKey_(v4, v36, (uint64_t)@"_bridgeType", v37, v38);
    uint64_t v39 = objc_opt_class();
    uint64_t v42 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, (uint64_t)@"_bridgeInterfaceName", v41);
    bridgeInterfaceName = v5->_bridgeInterfaceName;
    v5->_bridgeInterfaceName = (NSString *)v42;

    uint64_t v44 = objc_opt_class();
    uint64_t v47 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, (uint64_t)@"_IEList", v46);
    IEList = v5->_IEList;
    v5->_IEList = (NSData *)v47;
  }

  return v5;
}

- (NSData)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (CWFChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (unint64_t)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(unint64_t)a3
{
  self->_unint64_t securityType = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int)PHYMode
{
  return self->_PHYMode;
}

- (void)setPHYMode:(int)a3
{
  self->_int PHYMode = a3;
}

- (NSData)IEList
{
  return self->_IEList;
}

- (void)setIEList:(id)a3
{
}

- (BOOL)forceHiddenMode
{
  return self->_forceHiddenMode;
}

- (void)setForceHiddenMode:(BOOL)a3
{
  self->_int forceHiddenMode = a3;
}

- (BOOL)forceBeaconInterval100ms
{
  return self->_forceBeaconInterval100ms;
}

- (void)setForceBeaconInterval100ms:(BOOL)a3
{
  self->_int forceBeaconInterval100ms = a3;
}

- (int)bridgeMode
{
  return self->_bridgeMode;
}

- (void)setBridgeMode:(int)a3
{
  self->_int bridgeMode = a3;
}

- (int)bridgeType
{
  return self->_bridgeType;
}

- (void)setBridgeType:(int)a3
{
  self->_uint64_t bridgeType = a3;
}

- (NSString)bridgeInterfaceName
{
  return self->_bridgeInterfaceName;
}

- (void)setBridgeInterfaceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end