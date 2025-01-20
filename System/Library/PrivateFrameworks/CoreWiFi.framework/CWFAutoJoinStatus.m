@interface CWFAutoJoinStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAutoJoinStatus:(id)a3;
- (BOOL)result;
- (CWFAutoJoinStatus)init;
- (CWFAutoJoinStatus)initWithCoder:(id)a3;
- (NSArray)joinAttempts;
- (NSDate)endedAt;
- (NSDate)startedAt;
- (NSString)description;
- (NSString)interfaceName;
- (NSUUID)UUID;
- (double)duration;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopy;
- (int64_t)state;
- (int64_t)trigger;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndedAt:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setJoinAttempts:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setStartedAt:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTrigger:(int64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation CWFAutoJoinStatus

- (CWFAutoJoinStatus)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CWFAutoJoinStatus;
  v6 = -[CWFAutoJoinStatus init](&v10, sel_init);
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
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_endedAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    objc_msgSend_startedAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    double v32 = v17 - v31;
    double v33 = 0.0;
    if (v32 >= 0.0)
    {
      objc_msgSend_endedAt(self, v27, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      double v40 = v39;
      objc_msgSend_startedAt(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      double v33 = v40 - v50;
    }
  }

  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (id)deepCopy
{
  uint64_t v3 = (void *)MEMORY[0x189607908];
  uint64_t v4 = objc_opt_class();
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1896078F8], v5, (uint64_t)self, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v3, v7, v4, (uint64_t)v6, 0);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)description
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(self->_UUID, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v11, v12, 5, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v16, (uint64_t)@"uuid=%@, ", v17, v18, v15);

  objc_msgSend_appendFormat_(v6, v19, (uint64_t)@"intf=%@, ", v20, v21, self->_interfaceName);
  sub_18645304C(self->_trigger, v22, v23, v24, v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v27, (uint64_t)@"trigger=%@. ", v28, v29, v26);

  sub_186452FFC(self->_state, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v35, (uint64_t)@"state=%@, ", v36, v37, v34);

  if (self->_result) {
    objc_msgSend_appendFormat_(v6, v38, (uint64_t)@"result=%s, ", v39, v40, "yes");
  }
  else {
    objc_msgSend_appendFormat_(v6, v38, (uint64_t)@"result=%s, ", v39, v40, "no");
  }
  sub_1864535C8(self->_startedAt);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v42, (uint64_t)@"start=%@, ", v43, v44, v41);

  sub_1864535C8(self->_endedAt);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_duration(self, v46, v47, v48, v49);
  objc_msgSend_appendFormat_( v6,  v51,  (uint64_t)@"end=%@ (%lums), ",  v52,  v53,  v45,  (unint64_t)(v50 * 1000.0));

  objc_msgSend_appendFormat_(v6, v54, (uint64_t)@"joins=%@", v55, v56, self->_joinAttempts);
  return (NSString *)v6;
}

- (BOOL)isEqualToAutoJoinStatus:(id)a3
{
  id v5 = a3;
  UUID = self->_UUID;
  objc_msgSend_UUID(v5, v7, v8, v9, v10);
  uint64_t v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  if (UUID != v15)
  {
    if (!self->_UUID || (objc_msgSend_UUID(v5, v11, v12, v13, v14), (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      char isEqual = 0;
      goto LABEL_55;
    }

    uint64_t v3 = (void *)v16;
    uint64_t v21 = self->_UUID;
    objc_msgSend_UUID(v5, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v21, v23, (uint64_t)v22, v24, v25))
    {
      char isEqual = 0;
LABEL_54:

      goto LABEL_55;
    }

    v125 = v22;
  }

  startedAt = self->_startedAt;
  objc_msgSend_startedAt(v5, v11, v12, v13, v14);
  uint64_t v32 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (startedAt != v32)
  {
    if (!self->_startedAt)
    {
      char isEqual = 0;
      goto LABEL_53;
    }

    uint64_t v33 = objc_msgSend_startedAt(v5, v28, v29, v30, v31);
    if (!v33) {
      goto LABEL_43;
    }
    uint64_t v38 = (void *)v33;
    uint64_t v39 = self->_startedAt;
    uint64_t v40 = objc_msgSend_startedAt(v5, v34, v35, v36, v37);
    v41 = v39;
    uint64_t v42 = (void *)v40;
    if ((objc_msgSend_isEqual_(v41, v43, v40, v44, v45) & 1) == 0)
    {

      goto LABEL_43;
    }

    v121 = v42;
    v123 = v38;
  }

  endedAt = self->_endedAt;
  uint64_t v47 = objc_msgSend_endedAt(v5, v28, v29, v30, v31);
  joinAttempts = (NSDate *)v47;
  if (endedAt == (NSDate *)v47)
  {
    v124 = (NSDate *)v47;
    v64 = v3;
LABEL_20:
    interfaceName = self->_interfaceName;
    objc_msgSend_interfaceName(v5, v48, v49, v50, v51);
    v66 = (NSString *)objc_claimAutoreleasedReturnValue();
    v120 = interfaceName;
    v122 = v66;
    if (interfaceName == v66)
    {
      v119 = joinAttempts;
      uint64_t v3 = v64;
    }

    else
    {
      if (!self->_interfaceName)
      {
        v119 = joinAttempts;
        char isEqual = 0;
        uint64_t v3 = v64;
        goto LABEL_46;
      }

      uint64_t v71 = objc_msgSend_interfaceName(v5, v67, v68, v69, v70);
      uint64_t v3 = v64;
      if (!v71)
      {
        v119 = joinAttempts;
        LOBYTE(joinAttempts) = 0;
        goto LABEL_48;
      }

      v116 = (void *)v71;
      v118 = self->_interfaceName;
      objc_msgSend_interfaceName(v5, v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqual_(v118, v77, (uint64_t)v76, v78, v79) & 1) == 0)
      {

        char isEqual = 0;
        BOOL v112 = endedAt == v124;
        v113 = v124;
        if (!v112)
        {
LABEL_57:

          v110 = v123;
          joinAttempts = v113;
LABEL_58:

          if (startedAt == v32)
          {
LABEL_60:

LABEL_61:
            v22 = v125;
            if (UUID == v15) {
              goto LABEL_55;
            }
            goto LABEL_54;
          }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFAutoJoinStatus *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToAutoJoinStatus = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAutoJoinStatus = objc_msgSend_isEqualToAutoJoinStatus_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToAutoJoinStatus = 0;
  }

  return isEqualToAutoJoinStatus;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10) ^ v6;
  uint64_t v16 = objc_msgSend_hash(self->_startedAt, v12, v13, v14, v15);
  uint64_t v21 = v11 ^ v16 ^ objc_msgSend_hash(self->_endedAt, v17, v18, v19, v20);
  joinAttempts = self->_joinAttempts;
  int64_t v23 = self->_trigger ^ self->_state ^ self->_result;
  return v21 ^ v23 ^ objc_msgSend_hash(joinAttempts, v24, v25, v26, v27);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinStatus, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  objc_msgSend_setStartedAt_(v11, v18, (uint64_t)self->_startedAt, v19, v20);
  objc_msgSend_setEndedAt_(v11, v21, (uint64_t)self->_endedAt, v22, v23);
  objc_msgSend_setTrigger_(v11, v24, self->_trigger, v25, v26);
  objc_msgSend_setState_(v11, v27, self->_state, v28, v29);
  objc_msgSend_setResult_(v11, v30, self->_result, v31, v32);
  objc_msgSend_setJoinAttempts_(v11, v33, (uint64_t)self->_joinAttempts, v34, v35);
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
  objc_msgSend_encodeObject_forKey_(v21, v9, (uint64_t)self->_startedAt, (uint64_t)@"_startedAt", v10);
  objc_msgSend_encodeObject_forKey_(v21, v11, (uint64_t)self->_endedAt, (uint64_t)@"_endedAt", v12);
  objc_msgSend_encodeObject_forKey_(v21, v13, (uint64_t)self->_joinAttempts, (uint64_t)@"_joinAttempts", v14);
  objc_msgSend_encodeInteger_forKey_(v21, v15, self->_trigger, (uint64_t)@"_trigger", v16);
  objc_msgSend_encodeInteger_forKey_(v21, v17, self->_state, (uint64_t)@"_state", v18);
  objc_msgSend_encodeBool_forKey_(v21, v19, self->_result, (uint64_t)@"_result", v20);
}

- (CWFAutoJoinStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___CWFAutoJoinStatus;
  id v5 = -[CWFAutoJoinStatus init](&v47, sel_init);
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

    uint64_t v26 = (void *)MEMORY[0x189604010];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    objc_msgSend_setWithObjects_(v26, v29, v27, v30, v31, v28, 0);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, (uint64_t)@"_joinAttempts", v34);
    joinAttempts = v5->_joinAttempts;
    v5->_joinAttempts = (NSArray *)v35;

    v5->_int64_t trigger = objc_msgSend_decodeIntegerForKey_(v4, v37, (uint64_t)@"_trigger", v38, v39);
    v5->_int64_t state = objc_msgSend_decodeIntegerForKey_(v4, v40, (uint64_t)@"_state", v41, v42);
    v5->_result = objc_msgSend_decodeBoolForKey_(v4, v43, (uint64_t)@"_result", v44, v45);
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

- (NSArray)joinAttempts
{
  return self->_joinAttempts;
}

- (void)setJoinAttempts:(id)a3
{
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(int64_t)a3
{
  self->_int64_t trigger = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (void).cxx_destruct
{
}

- (id)JSONCompatibleKeyValueMap
{
  uint64_t v117 = *MEMORY[0x1895F89C0];
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
  objc_msgSend_numberWithUnsignedInteger_(v37, v43, (unint64_t)(v42 * 1000.0), v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v47, (uint64_t)v46, (uint64_t)@"duration", v48);

  uint64_t v49 = (void *)MEMORY[0x189607968];
  uint64_t v54 = objc_msgSend_result(self, v50, v51, v52, v53);
  objc_msgSend_numberWithBool_(v49, v55, v54, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v59, (uint64_t)v58, (uint64_t)@"result", v60);

  unint64_t v65 = objc_msgSend_state(self, v61, v62, v63, v64);
  sub_186452FFC(v65, v66, v67, v68, v69);
  uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v71, (uint64_t)v70, (uint64_t)@"state", v72);

  unint64_t v77 = objc_msgSend_trigger(self, v73, v74, v75, v76);
  sub_18645304C(v77, v78, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v83, (uint64_t)v82, (uint64_t)@"trigger", v84);

  id v85 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  objc_msgSend_joinAttempts(self, v86, v87, v88, v89, 0);
  uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v91, (uint64_t)&v112, (uint64_t)v116, 16);
  if (v92)
  {
    uint64_t v97 = v92;
    uint64_t v98 = *(void *)v113;
    do
    {
      for (uint64_t i = 0LL; i != v97; ++i)
      {
        if (*(void *)v113 != v98) {
          objc_enumerationMutation(v90);
        }
        objc_msgSend_JSONCompatibleKeyValueMap(*(void **)(*((void *)&v112 + 1) + 8 * i), v93, v94, v95, v96);
        uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v85, v101, (uint64_t)v100, v102, v103);
      }

      uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v93, (uint64_t)&v112, (uint64_t)v116, 16);
    }

    while (v97);
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v104, (uint64_t)v85, (uint64_t)@"join_attempts", v105);
  sub_1864586CC(v3, 0LL, 1u);
  uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v106, (uint64_t)v109, v107, v108);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v110 = 0LL;
  }

  return v110;
}

@end