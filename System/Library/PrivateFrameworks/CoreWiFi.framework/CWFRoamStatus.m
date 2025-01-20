@interface CWFRoamStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRoamStatus:(id)a3;
- (CWFRoamStatus)init;
- (CWFRoamStatus)initWithCoder:(id)a3;
- (NSData)SSID;
- (NSDate)endedAt;
- (NSDate)startedAt;
- (NSString)description;
- (NSString)fromBSSID;
- (NSString)interfaceName;
- (NSString)networkName;
- (NSString)originOUI;
- (NSString)targetOUI;
- (NSString)toBSSID;
- (NSUUID)UUID;
- (double)duration;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (int)reason;
- (int)status;
- (int64_t)fromRSSI;
- (int64_t)toRSSI;
- (unint64_t)fromChannel;
- (unint64_t)hash;
- (unint64_t)timeEnded;
- (unint64_t)timeStarted;
- (unint64_t)toChannel;
- (void)encodeWithCoder:(id)a3;
- (void)setEndedAt:(id)a3;
- (void)setFromBSSID:(id)a3;
- (void)setFromChannel:(unint64_t)a3;
- (void)setFromRSSI:(int64_t)a3;
- (void)setInterfaceName:(id)a3;
- (void)setOriginOUI:(id)a3;
- (void)setReason:(int)a3;
- (void)setSSID:(id)a3;
- (void)setStartedAt:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTargetOUI:(id)a3;
- (void)setTimeEnded:(unint64_t)a3;
- (void)setTimeStarted:(unint64_t)a3;
- (void)setToBSSID:(id)a3;
- (void)setToChannel:(unint64_t)a3;
- (void)setToRSSI:(int64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation CWFRoamStatus

- (CWFRoamStatus)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CWFRoamStatus;
  v6 = -[CWFRoamStatus init](&v10, sel_init);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_UUID(MEMORY[0x189607AB8], v2, v3, v4, v5);
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;
  }

  return v6;
}

- (double)duration
{
  if (!objc_msgSend_timeEnded(self, a2, v2, v3, v4)) {
    return 0.0;
  }
  objc_msgSend_timeEnded(self, v6, v7, v8, v9);
  objc_msgSend_timeStarted(self, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_timeEnded(self, v14, v15, v16, v17);
  return (double)(unint64_t)(v18 - objc_msgSend_timeStarted(self, v19, v20, v21, v22)) / 1000.0;
}

- (NSString)networkName
{
  id v3 = objc_alloc(NSString);
  return (NSString *)(id)objc_msgSend_initWithData_encoding_( v3,  v4,  (uint64_t)self->_SSID,  4,  v5);
}

- (NSString)description
{
  v59 = (void *)NSString;
  objc_msgSend_UUIDString(self->_UUID, a2, v2, v3, v4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_substringToIndex_(v62, v6, 5, v7, v8);
  interfaceName = self->_interfaceName;
  v58 = (void *)v9;
  objc_msgSend_networkName(self, v10, v11, v12, v13);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v61, v14, v15, v16, v17);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHexadecimalStringFromData(self->_SSID, v18, v19, v20, v21);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v60, v22, v23, v24, v25);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1864535C8(self->_startedAt);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1864535C8(self->_endedAt);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_duration(self, v26, v27, v28, v29);
  unint64_t v31 = (unint64_t)(v30 * 1000.0);
  sub_186453E38(self->_reason);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186453E38(self->_status);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  originOUI = self->_originOUI;
  objc_msgSend_redactedForWiFi(self->_fromBSSID, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t fromRSSI = self->_fromRSSI;
  targetOUI = self->_targetOUI;
  unint64_t fromChannel = self->_fromChannel;
  objc_msgSend_redactedForWiFi(self->_toBSSID, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_( v59,  v48,  (uint64_t)@"uuid=%@, intf=%@, ssid='%@' (%@), start=%@, end=%@ (%lums), reason=%@, status=%@, from=[oui=%@ bssid=%@ ch=%lu rssi=%ld] to=[oui=%@ bssid=%@ ch=%lu rssi=%ld]",  v49,  v50,  v58,  interfaceName,  v56,  v55,  v54,  v53,  v31,  v32,  v33,  originOUI,  v39,  fromChannel,  fromRSSI,  targetOUI,  v47,  self->_toChannel,  self->_toRSSI);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v51;
}

- (BOOL)isEqualToRoamStatus:(id)a3
{
  id v6 = a3;
  UUID = self->_UUID;
  objc_msgSend_UUID(v6, v8, v9, v10, v11);
  uint64_t v16 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  if (UUID != v16)
  {
    if (!self->_UUID || (objc_msgSend_UUID(v6, v12, v13, v14, v15), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      char isEqual = 0;
      goto LABEL_78;
    }

    uint64_t v3 = (void *)v17;
    uint64_t v22 = self->_UUID;
    objc_msgSend_UUID(v6, v18, v19, v20, v21);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      char isEqual = 0;
LABEL_77:

      goto LABEL_78;
    }
  }

  interfaceName = self->_interfaceName;
  objc_msgSend_interfaceName(v6, v12, v13, v14, v15);
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (interfaceName != v32)
  {
    if (!self->_interfaceName)
    {
      char isEqual = 0;
LABEL_57:

      goto LABEL_76;
    }

    uint64_t v33 = objc_msgSend_interfaceName(v6, v28, v29, v30, v31);
    if (!v33) {
      goto LABEL_74;
    }
    v253 = (void *)v33;
    uint64_t v38 = self->_interfaceName;
    uint64_t v39 = objc_msgSend_interfaceName(v6, v34, v35, v36, v37);
    v40 = v38;
    v41 = (void *)v39;
    if ((objc_msgSend_isEqual_(v40, v42, v39, v43, v44) & 1) == 0)
    {

LABEL_73:
      goto LABEL_74;
    }

    v251 = v41;
  }

  SSID = self->_SSID;
  objc_msgSend_SSID(v6, v28, v29, v30, v31);
  uint64_t v50 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (SSID == v50)
  {
    v252 = SSID;
LABEL_19:
    originOUI = self->_originOUI;
    objc_msgSend_originOUI(v6, v46, v47, v48, v49);
    v64 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (originOUI != v64)
    {
      if (!self->_originOUI)
      {
        char isEqual = 0;
        goto LABEL_53;
      }

      v250 = v64;
      uint64_t v69 = objc_msgSend_originOUI(v6, v65, v66, v67, v68);
      if (v69)
      {
        v242 = interfaceName;
        v74 = originOUI;
        v245 = (void *)v69;
        v75 = v4;
        v76 = self->_originOUI;
        uint64_t v77 = objc_msgSend_originOUI(v6, v70, v71, v72, v73);
        v78 = v76;
        v79 = (void *)v77;
        if (objc_msgSend_isEqual_(v78, v80, v77, v81, v82))
        {
          v241 = v79;
          uint64_t v4 = v75;
          v247 = v74;
          interfaceName = v242;
          goto LABEL_27;
        }

        uint64_t v4 = v75;
        if (v252 == v50)
        {
        }

        else
        {
        }

        BOOL v134 = v242 == v32;
      }

      else
      {

        if (v252 == v50)
        {
        }

        else
        {
        }

        BOOL v134 = interfaceName == v32;
      }

      if (v134)
      {
LABEL_74:

        goto LABEL_75;
      }

      goto LABEL_72;
    }

    v247 = originOUI;
    v250 = v64;
LABEL_27:
    fromBSSID = self->_fromBSSID;
    objc_msgSend_fromBSSID(v6, v65, v66, v67, v68);
    v84 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (fromBSSID == v84)
    {
      v246 = v84;
      v244 = v4;
      goto LABEL_37;
    }

    if (!self->_fromBSSID)
    {
      char isEqual = 0;
      goto LABEL_51;
    }

    v246 = v84;
    uint64_t v89 = objc_msgSend_fromBSSID(v6, v85, v86, v87, v88);
    if (v89)
    {
      v240 = (void *)v89;
      v244 = v4;
      v94 = self->_fromBSSID;
      uint64_t v95 = objc_msgSend_fromBSSID(v6, v90, v91, v92, v93);
      v96 = v94;
      v97 = (void *)v95;
      if (objc_msgSend_isEqual_(v96, v98, v95, v99, v100))
      {
        v239 = v97;
LABEL_37:
        unint64_t fromChannel = self->_fromChannel;
        if (fromChannel != objc_msgSend_fromChannel(v6, v85, v86, v87, v88)
          || (int64_t fromRSSI = self->_fromRSSI, fromRSSI != objc_msgSend_fromRSSI(v6, v102, v103, v104, v105)))
        {
          char isEqual = 0;
          v84 = v246;
          uint64_t v4 = v244;
          if (fromBSSID == v246) {
            goto LABEL_51;
          }
          goto LABEL_45;
        }

        targetOUI = self->_targetOUI;
        objc_msgSend_targetOUI(v6, v107, v108, v109, v110);
        v112 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (targetOUI == v112)
        {
          v234 = fromBSSID;
          v237 = v112;
        }

        else
        {
          if (!self->_targetOUI)
          {
            char isEqual = 0;
            goto LABEL_108;
          }

          v237 = v112;
          uint64_t v117 = objc_msgSend_targetOUI(v6, v113, v114, v115, v116);
          if (!v117)
          {

            if (fromBSSID == v246)
            {
            }

            else
            {
            }

            v205 = v250;
            uint64_t v4 = v244;
            if (v247 != v250) {
              goto LABEL_128;
            }
            goto LABEL_119;
          }

          v235 = targetOUI;
          v231 = (void *)v117;
          v122 = self->_targetOUI;
          uint64_t v123 = objc_msgSend_targetOUI(v6, v118, v119, v120, v121);
          v124 = v122;
          v125 = (void *)v123;
          if ((objc_msgSend_isEqual_(v124, v126, v123, v127, v128) & 1) == 0)
          {

            v203 = v246;
            uint64_t v4 = v244;
            if (fromBSSID == v246)
            {

              goto LABEL_127;
            }

            goto LABEL_126;
          }

          v234 = fromBSSID;
          v230 = v125;
          targetOUI = v235;
        }

        toBSSID = self->_toBSSID;
        objc_msgSend_toBSSID(v6, v113, v114, v115, v116);
        v137 = (NSString *)objc_claimAutoreleasedReturnValue();
        v232 = toBSSID;
        v236 = targetOUI;
        if (toBSSID == v137)
        {
          v233 = v137;
          goto LABEL_87;
        }

        if (!self->_toBSSID)
        {
          char isEqual = 0;
          fromBSSID = v234;
LABEL_106:

          v112 = v237;
          if (v236 != v237)
          {

            v112 = v237;
          }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFRoamStatus *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToRoamStatus = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToRoamStatus = objc_msgSend_isEqualToRoamStatus_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToRoamStatus = 0;
  }

  return isEqualToRoamStatus;
}

- (unint64_t)hash
{
  uint64_t v52 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_hash(self->_interfaceName, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_hash(self->_SSID, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_hash(self->_startedAt, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_hash(self->_endedAt, v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_hash(self->_originOUI, v26, v27, v28, v29);
  uint64_t v35 = objc_msgSend_hash(self->_fromBSSID, v31, v32, v33, v34);
  unint64_t fromChannel = self->_fromChannel;
  int64_t fromRSSI = self->_fromRSSI;
  uint64_t v40 = objc_msgSend_hash(self->_targetOUI, v36, v37, v38, v39);
  uint64_t v45 = objc_msgSend_hash(self->_toBSSID, v41, v42, v43, v44);
  v47.i64[0] = fromRSSI;
  v46.i64[0] = fromChannel;
  v47.i64[1] = self->_toRSSI;
  v46.i64[1] = self->_toChannel;
  int8x16_t v48 = veorq_s8(v46, v47);
  return *(void *)&veor_s8(*(int8x8_t *)v48.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v48, v48, 8uLL)) ^ self->_timeStarted ^ self->_timeEnded ^ self->_status ^ v45 ^ self->_reason ^ v40 ^ v35 ^ v30 ^ v25 ^ v20 ^ v15 ^ v10 ^ v52;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v6 = (void *)objc_msgSend_allocWithZone_(CWFRoamStatus, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  objc_msgSend_setSSID_(v11, v18, (uint64_t)self->_SSID, v19, v20);
  objc_msgSend_setReason_(v11, v21, self->_reason, v22, v23);
  objc_msgSend_setStatus_(v11, v24, self->_status, v25, v26);
  objc_msgSend_setStartedAt_(v11, v27, (uint64_t)self->_startedAt, v28, v29);
  objc_msgSend_setEndedAt_(v11, v30, (uint64_t)self->_endedAt, v31, v32);
  objc_msgSend_setOriginOUI_(v11, v33, (uint64_t)self->_originOUI, v34, v35);
  objc_msgSend_setFromBSSID_(v11, v36, (uint64_t)self->_fromBSSID, v37, v38);
  objc_msgSend_setFromChannel_(v11, v39, self->_fromChannel, v40, v41);
  objc_msgSend_setFromRSSI_(v11, v42, self->_fromRSSI, v43, v44);
  objc_msgSend_setTargetOUI_(v11, v45, (uint64_t)self->_targetOUI, v46, v47);
  objc_msgSend_setToBSSID_(v11, v48, (uint64_t)self->_toBSSID, v49, v50);
  objc_msgSend_setToChannel_(v11, v51, self->_toChannel, v52, v53);
  objc_msgSend_setToRSSI_(v11, v54, self->_toRSSI, v55, v56);
  objc_msgSend_setTimeStarted_(v11, v57, self->_timeStarted, v58, v59);
  objc_msgSend_setTimeEnded_(v11, v60, self->_timeEnded, v61, v62);
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
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_interfaceName, (uint64_t)@"_interfaceName", v9);
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)self->_startedAt, (uint64_t)@"_startedAt", v11);
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)self->_endedAt, (uint64_t)@"_endedAt", v13);
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)self->_SSID, (uint64_t)@"_SSID", v15);
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)self->_originOUI, (uint64_t)@"_originOUI", v17);
  objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)self->_fromBSSID, (uint64_t)@"_fromBSSID", v19);
  objc_msgSend_encodeInteger_forKey_(v5, v20, self->_fromRSSI, (uint64_t)@"_fromRSSI", v21);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v22, self->_fromChannel, v23, v24);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v26, (uint64_t)v25, (uint64_t)@"_fromChannel", v27);

  objc_msgSend_encodeObject_forKey_(v5, v28, (uint64_t)self->_targetOUI, (uint64_t)@"_targetOUI", v29);
  objc_msgSend_encodeObject_forKey_(v5, v30, (uint64_t)self->_toBSSID, (uint64_t)@"_toBSSID", v31);
  objc_msgSend_encodeInteger_forKey_(v5, v32, self->_toRSSI, (uint64_t)@"_toRSSI", v33);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v34, self->_toChannel, v35, v36);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v38, (uint64_t)v37, (uint64_t)@"_toChannel", v39);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v40, self->_reason, v41, v42);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v44, (uint64_t)v43, (uint64_t)@"_reason", v45);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v46, self->_status, v47, v48);
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v50, (uint64_t)v49, (uint64_t)@"_status", v51);

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x189607968], v52, self->_timeStarted, v53, v54);
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v56, (uint64_t)v55, (uint64_t)@"_timeStarted", v57);

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x189607968], v58, self->_timeEnded, v59, v60);
  id v63 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v61, (uint64_t)v63, (uint64_t)@"_timeEnded", v62);
}

- (CWFRoamStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v106.receiver = self;
  v106.super_class = (Class)&OBJC_CLASS___CWFRoamStatus;
  id v5 = -[CWFRoamStatus init](&v106, sel_init);
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
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)@"_startedAt", v18);
    startedAt = v5->_startedAt;
    v5->_startedAt = (NSDate *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)@"_endedAt", v23);
    endedAt = v5->_endedAt;
    v5->_endedAt = (NSDate *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)@"_SSID", v28);
    SSID = v5->_SSID;
    v5->_SSID = (NSData *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v34 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)@"_originOUI", v33);
    originOUI = v5->_originOUI;
    v5->_originOUI = (NSString *)v34;

    uint64_t v36 = objc_opt_class();
    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, (uint64_t)@"_fromBSSID", v38);
    fromBSSID = v5->_fromBSSID;
    v5->_fromBSSID = (NSString *)v39;

    v5->_int64_t fromRSSI = objc_msgSend_decodeIntegerForKey_(v4, v41, (uint64_t)@"_fromRSSI", v42, v43);
    uint64_t v44 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, (uint64_t)@"_fromChannel", v46);
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t fromChannel = objc_msgSend_unsignedIntegerValue(v47, v48, v49, v50, v51);

    uint64_t v52 = objc_opt_class();
    uint64_t v55 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, (uint64_t)@"_targetOUI", v54);
    targetOUI = v5->_targetOUI;
    v5->_targetOUI = (NSString *)v55;

    uint64_t v57 = objc_opt_class();
    uint64_t v60 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, (uint64_t)@"_toBSSID", v59);
    toBSSID = v5->_toBSSID;
    v5->_toBSSID = (NSString *)v60;

    v5->_int64_t toRSSI = objc_msgSend_decodeIntegerForKey_(v4, v62, (uint64_t)@"_toRSSI", v63, v64);
    uint64_t v65 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v66, v65, (uint64_t)@"_toChannel", v67);
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t toChannel = objc_msgSend_unsignedIntegerValue(v68, v69, v70, v71, v72);

    uint64_t v73 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v74, v73, (uint64_t)@"_reason", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_int reason = objc_msgSend_unsignedIntegerValue(v76, v77, v78, v79, v80);

    uint64_t v81 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, (uint64_t)@"_status", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_int status = objc_msgSend_unsignedIntegerValue(v84, v85, v86, v87, v88);

    uint64_t v89 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v90, v89, (uint64_t)@"_timeStarted", v91);
    uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t timeStarted = objc_msgSend_unsignedLongLongValue(v92, v93, v94, v95, v96);

    uint64_t v97 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v98, v97, (uint64_t)@"_timeEnded", v99);
    uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t timeEnded = objc_msgSend_unsignedLongLongValue(v100, v101, v102, v103, v104);
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

- (unint64_t)timeStarted
{
  return self->_timeStarted;
}

- (void)setTimeStarted:(unint64_t)a3
{
  self->_unint64_t timeStarted = a3;
}

- (unint64_t)timeEnded
{
  return self->_timeEnded;
}

- (void)setTimeEnded:(unint64_t)a3
{
  self->_unint64_t timeEnded = a3;
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
}

- (NSDate)endedAt
{
  return self->_endedAt;
}

- (void)setEndedAt:(id)a3
{
}

- (NSData)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (NSString)originOUI
{
  return self->_originOUI;
}

- (void)setOriginOUI:(id)a3
{
}

- (NSString)targetOUI
{
  return self->_targetOUI;
}

- (void)setTargetOUI:(id)a3
{
}

- (NSString)fromBSSID
{
  return self->_fromBSSID;
}

- (void)setFromBSSID:(id)a3
{
}

- (NSString)toBSSID
{
  return self->_toBSSID;
}

- (void)setToBSSID:(id)a3
{
}

- (unint64_t)fromChannel
{
  return self->_fromChannel;
}

- (void)setFromChannel:(unint64_t)a3
{
  self->_unint64_t fromChannel = a3;
}

- (unint64_t)toChannel
{
  return self->_toChannel;
}

- (void)setToChannel:(unint64_t)a3
{
  self->_unint64_t toChannel = a3;
}

- (int64_t)fromRSSI
{
  return self->_fromRSSI;
}

- (void)setFromRSSI:(int64_t)a3
{
  self->_int64_t fromRSSI = a3;
}

- (int64_t)toRSSI
{
  return self->_toRSSI;
}

- (void)setToRSSI:(int64_t)a3
{
  self->_int64_t toRSSI = a3;
}

- (int)reason
{
  return self->_reason;
}

- (void)setReason:(int)a3
{
  self->_int reason = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_int status = a3;
}

- (void).cxx_destruct
{
}

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend_UUID(self, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v8, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)@"uuid", v15);

  objc_msgSend_interfaceName(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)@"interface_name", v22);

  objc_msgSend_startedAt(self, v23, v24, v25, v26);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, (uint64_t)@"started_at", v29);

  objc_msgSend_endedAt(self, v30, v31, v32, v33);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, (uint64_t)@"ended_at", v36);

  uint64_t v37 = (void *)MEMORY[0x189607968];
  objc_msgSend_duration(self, v38, v39, v40, v41);
  objc_msgSend_numberWithDouble_(v37, v42, v43, v44, v45);
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v47, (uint64_t)v46, (uint64_t)@"duration", v48);

  objc_msgSend_networkName(self, v49, v50, v51, v52);
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v54, (uint64_t)v53, (uint64_t)@"network_name", v55);

  objc_msgSend_originOUI(self, v56, v57, v58, v59);
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v61, (uint64_t)v60, (uint64_t)@"origin_oui", v62);

  objc_msgSend_targetOUI(self, v63, v64, v65, v66);
  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v68, (uint64_t)v67, (uint64_t)@"target_oui", v69);

  objc_msgSend_fromBSSID(self, v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v75, (uint64_t)v74, (uint64_t)@"from_bssid", v76);

  objc_msgSend_toBSSID(self, v77, v78, v79, v80);
  uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v82, (uint64_t)v81, (uint64_t)@"to_bssid", v83);

  v84 = (void *)MEMORY[0x189607968];
  uint64_t v89 = objc_msgSend_fromChannel(self, v85, v86, v87, v88);
  objc_msgSend_numberWithUnsignedInteger_(v84, v90, v89, v91, v92);
  uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v94, (uint64_t)v93, (uint64_t)@"from_channel", v95);

  uint64_t v96 = (void *)MEMORY[0x189607968];
  uint64_t v101 = objc_msgSend_toChannel(self, v97, v98, v99, v100);
  objc_msgSend_numberWithUnsignedInteger_(v96, v102, v101, v103, v104);
  uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v106, (uint64_t)v105, (uint64_t)@"to_channel", v107);

  uint64_t v108 = (void *)MEMORY[0x189607968];
  uint64_t v113 = objc_msgSend_fromRSSI(self, v109, v110, v111, v112);
  objc_msgSend_numberWithInteger_(v108, v114, v113, v115, v116);
  uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v118, (uint64_t)v117, (uint64_t)@"from_rssi", v119);

  uint64_t v120 = (void *)MEMORY[0x189607968];
  uint64_t v125 = objc_msgSend_toRSSI(self, v121, v122, v123, v124);
  objc_msgSend_numberWithInteger_(v120, v126, v125, v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v130, (uint64_t)v129, (uint64_t)@"to_rssi", v131);

  uint64_t v136 = objc_msgSend_reason(self, v132, v133, v134, v135);
  sub_186453E38(v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v138, (uint64_t)v137, (uint64_t)@"roam_reason", v139);

  uint64_t v144 = objc_msgSend_status(self, v140, v141, v142, v143);
  sub_186453E38(v144);
  uint64_t v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v146, (uint64_t)v145, (uint64_t)@"status", v147);

  sub_1864586CC(v3, 0LL, 1u);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (v151)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v148, (uint64_t)v151, v149, v150);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v152 = 0LL;
  }

  return v152;
}

@end