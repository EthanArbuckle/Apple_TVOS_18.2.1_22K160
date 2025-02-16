@interface CWFSensingParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSensingParameters:(id)a3;
- (BOOL)submitMetric;
- (CWFSensingParameters)init;
- (CWFSensingParameters)initWithCoder:(id)a3;
- (NSArray)activityLabels;
- (NSArray)matchMACAddresses;
- (NSArray)placeLabels;
- (NSString)comment;
- (NSString)description;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (int)matchFrameType;
- (int64_t)numberOfReports;
- (int64_t)scheduleDailyAt;
- (int64_t)scheduleOnceAfter;
- (int64_t)timeout;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityLabels:(id)a3;
- (void)setComment:(id)a3;
- (void)setMatchFrameType:(int)a3;
- (void)setMatchMACAddresses:(id)a3;
- (void)setNumberOfReports:(int64_t)a3;
- (void)setPlaceLabels:(id)a3;
- (void)setScheduleDailyAt:(int64_t)a3;
- (void)setScheduleOnceAfter:(int64_t)a3;
- (void)setSubmitMetric:(BOOL)a3;
- (void)setTimeout:(int64_t)a3;
@end

@implementation CWFSensingParameters

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  v4 = (void *)MEMORY[0x189607968];
  uint64_t v9 = objc_msgSend_numberOfReports(self, v5, v6, v7, v8);
  objc_msgSend_numberWithInteger_(v4, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)@"numberOfReports", v15);

  v16 = (void *)MEMORY[0x189607968];
  uint64_t matched = objc_msgSend_matchFrameType(self, v17, v18, v19, v20);
  objc_msgSend_numberWithInt_(v16, v22, matched, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, (uint64_t)@"matchFrameType", v27);

  objc_msgSend_matchMACAddresses(self, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, (uint64_t)@"matchMACAddresses", v34);

  v35 = (void *)MEMORY[0x189607968];
  uint64_t v40 = objc_msgSend_timeout(self, v36, v37, v38, v39);
  objc_msgSend_numberWithInteger_(v35, v41, v40, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, (uint64_t)@"timeout", v46);

  v47 = (void *)MEMORY[0x189607968];
  uint64_t v52 = objc_msgSend_submitMetric(self, v48, v49, v50, v51);
  objc_msgSend_numberWithBool_(v47, v53, v52, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v57, (uint64_t)v56, (uint64_t)@"submitMetric", v58);

  v59 = (void *)MEMORY[0x189607968];
  uint64_t v64 = objc_msgSend_scheduleOnceAfter(self, v60, v61, v62, v63);
  objc_msgSend_numberWithInteger_(v59, v65, v64, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, (uint64_t)@"scheduleOnceAfter", v70);

  v71 = (void *)MEMORY[0x189607968];
  uint64_t v76 = objc_msgSend_scheduleDailyAt(self, v72, v73, v74, v75);
  objc_msgSend_numberWithInteger_(v71, v77, v76, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v81, (uint64_t)v80, (uint64_t)@"scheduleDailyAt", v82);

  objc_msgSend_activityLabels(self, v83, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v88, (uint64_t)v87, (uint64_t)@"activityLabels", v89);

  objc_msgSend_placeLabels(self, v90, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v95, (uint64_t)v94, (uint64_t)@"placeLabels", v96);

  objc_msgSend_comment(self, v97, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v102, (uint64_t)v101, (uint64_t)@"comment", v103);

  sub_1864586CC(v3, 0LL, 1u);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v104, (uint64_t)v107, v105, v106);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v108 = 0LL;
  }

  return v108;
}

- (CWFSensingParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CWFSensingParameters;
  result = -[CWFSensingParameters init](&v3, sel_init);
  if (result)
  {
    result->_numberOfReports = 50LL;
    result->_matchFrameType = 1;
    result->_submitMetric = 0;
    *(_OWORD *)&result->_timeout = xmmword_18653E8C0;
    result->_scheduleDailyAt = -2LL;
  }

  return result;
}

- (NSString)description
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v7, (uint64_t)@"numberOfReports=%ld, ", v8, v9, self->_numberOfReports);
  objc_msgSend_appendFormat_( v6,  v10,  (uint64_t)@"matchFrameType=%d, ",  v11,  v12,  self->_matchFrameType);
  objc_msgSend_appendFormat_(v6, v13, (uint64_t)@"matchMACAddresses=", v14, v15);
  if (objc_msgSend_count(self->_matchMACAddresses, v16, v17, v18, v19))
  {
    unint64_t v23 = 0LL;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_matchMACAddresses, v20, v23, v21, v22);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      CWFCorrectEthernetAddressString(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v6, v26, (uint64_t)@"%@;", v27, v28, v25);

      ++v23;
    }

    while (v23 < objc_msgSend_count(self->_matchMACAddresses, v29, v30, v31, v32));
  }

  objc_msgSend_appendFormat_(v6, v20, (uint64_t)@", ", v21, v22);
  objc_msgSend_appendFormat_(v6, v33, (uint64_t)@"timeout=%ld, ", v34, v35, self->_timeout);
  objc_msgSend_appendFormat_(v6, v36, (uint64_t)@"submitMetric=%d, ", v37, v38, self->_submitMetric);
  objc_msgSend_appendFormat_(v6, v39, (uint64_t)@"scheduleOnceAfter=%ld, ", v40, v41, self->_scheduleOnceAfter);
  objc_msgSend_appendFormat_(v6, v42, (uint64_t)@"scheduleDailyAt=%ld, ", v43, v44, self->_scheduleDailyAt);
  objc_msgSend_appendFormat_(v6, v45, (uint64_t)@"activityLabels=%@, ", v46, v47, self->_activityLabels);
  objc_msgSend_appendFormat_(v6, v48, (uint64_t)@"placeLabels=%@, ", v49, v50, self->_placeLabels);
  objc_msgSend_appendFormat_(v6, v51, (uint64_t)@"comment=%@", v52, v53, self->_comment);
  return (NSString *)v6;
}

- (BOOL)isEqualToSensingParameters:(id)a3
{
  id v6 = a3;
  int64_t numberOfReports = self->_numberOfReports;
  if (numberOfReports == objc_msgSend_numberOfReports(v6, v8, v9, v10, v11))
  {
    int matchFrameType = self->_matchFrameType;
    if (matchFrameType == objc_msgSend_matchFrameType(v6, v12, v13, v14, v15))
    {
      matchMACAddresses = self->_matchMACAddresses;
      objc_msgSend_matchMACAddresses(v6, v17, v18, v19, v20);
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (matchMACAddresses != v26)
      {
        if (!self->_matchMACAddresses
          || (objc_msgSend_matchMACAddresses(v6, v22, v23, v24, v25), (uint64_t v27 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          LOBYTE(comment) = 0;
          goto LABEL_38;
        }

        uint64_t v3 = (void *)v27;
        uint64_t v32 = self->_matchMACAddresses;
        objc_msgSend_matchMACAddresses(v6, v28, v29, v30, v31);
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v32, v33, (uint64_t)v4, v34, v35))
        {
          LOBYTE(comment) = 0;
LABEL_37:

          goto LABEL_38;
        }
      }

      int64_t timeout = self->_timeout;
      if (timeout == objc_msgSend_timeout(v6, v22, v23, v24, v25))
      {
        int submitMetric = self->_submitMetric;
        if (submitMetric == objc_msgSend_submitMetric(v6, v38, v39, v40, v41))
        {
          int64_t scheduleOnceAfter = self->_scheduleOnceAfter;
          if (scheduleOnceAfter == objc_msgSend_scheduleOnceAfter(v6, v43, v44, v45, v46))
          {
            int64_t scheduleDailyAt = self->_scheduleDailyAt;
            if (scheduleDailyAt == objc_msgSend_scheduleDailyAt(v6, v48, v49, v50, v51))
            {
              activityLabels = self->_activityLabels;
              objc_msgSend_activityLabels(v6, v53, v54, v55, v56);
              uint64_t v62 = (NSArray *)objc_claimAutoreleasedReturnValue();
              if (activityLabels == v62) {
                goto LABEL_20;
              }
              if (!self->_activityLabels
                || (objc_msgSend_activityLabels(v6, v58, v59, v60, v61), (uint64_t v63 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                LOBYTE(comment) = 0;
                goto LABEL_51;
              }

              v114 = (void *)v63;
              v68 = self->_activityLabels;
              uint64_t v69 = objc_msgSend_activityLabels(v6, v64, v65, v66, v67);
              uint64_t v70 = v68;
              v71 = (void *)v69;
              if (objc_msgSend_isEqual_(v70, v72, v69, v73, v74))
              {
                v112 = v71;
LABEL_20:
                placeLabels = self->_placeLabels;
                objc_msgSend_placeLabels(v6, v58, v59, v60, v61);
                v115 = (NSArray *)objc_claimAutoreleasedReturnValue();
                if (placeLabels != v115)
                {
                  if (self->_placeLabels)
                  {
                    objc_msgSend_placeLabels(v6, v76, v77, v78, v79);
                    comment = (void *)objc_claimAutoreleasedReturnValue();
                    if (comment)
                    {
                      v113 = activityLabels;
                      uint64_t v84 = self->_placeLabels;
                      uint64_t v85 = objc_msgSend_placeLabels(v6, v80, v81, v82, v83);
                      uint64_t v86 = v84;
                      v87 = (void *)v85;
                      if ((objc_msgSend_isEqual_(v86, v88, v85, v89, v90) & 1) == 0)
                      {

                        LOBYTE(comment) = 0;
                        goto LABEL_48;
                      }

                      v110 = v87;
                      v111 = comment;
LABEL_26:
                      comment = self->_comment;
                      objc_msgSend_comment(v6, v76, v77, v78, v79);
                      uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();
                      uint64_t v96 = v91;
                      LOBYTE(comment) = comment == v91;
                      if ((_BYTE)comment || !self->_comment)
                      {

                        uint64_t v106 = v115;
                        if (placeLabels == v115)
                        {
LABEL_33:
                          v107 = v112;
                          activityLabels = v113;
                          goto LABEL_42;
                        }
                      }

                      else
                      {
                        uint64_t v97 = objc_msgSend_comment(v6, v92, v93, v94, v95);
                        if (v97)
                        {
                          comment = self->_comment;
                          v109 = (void *)v97;
                          objc_msgSend_comment(v6, v98, v99, v100, v101);
                          v102 = (void *)objc_claimAutoreleasedReturnValue();
                          LOBYTE(comment) = objc_msgSend_isEqual_(comment, v103, (uint64_t)v102, v104, v105);

                          if (placeLabels == v115)
                          {
                          }

                          else
                          {
                          }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFSensingParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToSensingParameters = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToSensingParameters = objc_msgSend_isEqualToSensingParameters_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToSensingParameters = 0;
  }

  return isEqualToSensingParameters;
}

- (unint64_t)hash
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_hash(v5, v6, v7, v8, v9);
  objc_msgSend_numberWithInt_(MEMORY[0x189607968], v11, self->_matchFrameType, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_hash(v14, v15, v16, v17, v18) ^ v10;
  uint64_t v24 = objc_msgSend_hash(self->_matchMACAddresses, v20, v21, v22, v23);
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v25, self->_timeout, v26, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = v19 ^ v24 ^ objc_msgSend_hash(v28, v29, v30, v31, v32);
  BOOL submitMetric = self->_submitMetric;
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v35, self->_scheduleOnceAfter, v36, v37);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = submitMetric ^ objc_msgSend_hash(v38, v39, v40, v41, v42);
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v44, self->_scheduleDailyAt, v45, v46);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = v33 ^ v43 ^ objc_msgSend_hash(v47, v48, v49, v50, v51);
  uint64_t v57 = objc_msgSend_hash(self->_activityLabels, v53, v54, v55, v56);
  uint64_t v62 = v57 ^ objc_msgSend_hash(self->_placeLabels, v58, v59, v60, v61);
  unint64_t v67 = v52 ^ v62 ^ objc_msgSend_hash(self->_comment, v63, v64, v65, v66);

  return v67;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v6 = (void *)objc_msgSend_allocWithZone_(CWFSensingParameters, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setNumberOfReports_(v11, v12, self->_numberOfReports, v13, v14);
  objc_msgSend_setMatchFrameType_(v11, v15, self->_matchFrameType, v16, v17);
  objc_msgSend_setMatchMACAddresses_(v11, v18, (uint64_t)self->_matchMACAddresses, v19, v20);
  objc_msgSend_setTimeout_(v11, v21, self->_timeout, v22, v23);
  objc_msgSend_setSubmitMetric_(v11, v24, self->_submitMetric, v25, v26);
  objc_msgSend_setScheduleOnceAfter_(v11, v27, self->_scheduleOnceAfter, v28, v29);
  objc_msgSend_setScheduleDailyAt_(v11, v30, self->_scheduleDailyAt, v31, v32);
  objc_msgSend_setActivityLabels_(v11, v33, (uint64_t)self->_activityLabels, v34, v35);
  objc_msgSend_setPlaceLabels_(v11, v36, (uint64_t)self->_placeLabels, v37, v38);
  objc_msgSend_setComment_(v11, v39, (uint64_t)self->_comment, v40, v41);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t numberOfReports = self->_numberOfReports;
  id v25 = a3;
  objc_msgSend_encodeInteger_forKey_(v25, v5, numberOfReports, (uint64_t)@"_numberOfReports", v6);
  objc_msgSend_encodeInteger_forKey_(v25, v7, self->_matchFrameType, (uint64_t)@"_matchFrameType", v8);
  objc_msgSend_encodeObject_forKey_( v25,  v9,  (uint64_t)self->_matchMACAddresses,  (uint64_t)@"_matchMACAddresses",  v10);
  objc_msgSend_encodeInteger_forKey_(v25, v11, self->_timeout, (uint64_t)@"_timeout", v12);
  objc_msgSend_encodeBool_forKey_(v25, v13, self->_submitMetric, (uint64_t)@"_submitMetric", v14);
  objc_msgSend_encodeInteger_forKey_(v25, v15, self->_scheduleOnceAfter, (uint64_t)@"_scheduleOnceAfter", v16);
  objc_msgSend_encodeInteger_forKey_(v25, v17, self->_scheduleDailyAt, (uint64_t)@"_scheduleDailyAt", v18);
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)self->_activityLabels, (uint64_t)@"_activityLabels", v20);
  objc_msgSend_encodeObject_forKey_(v25, v21, (uint64_t)self->_placeLabels, (uint64_t)@"_placeLabels", v22);
  objc_msgSend_encodeObject_forKey_(v25, v23, (uint64_t)self->_comment, (uint64_t)@"_comment", v24);
}

- (CWFSensingParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___CWFSensingParameters;
  uint64_t v8 = -[CWFSensingParameters init](&v63, sel_init);
  if (v8)
  {
    v8->_int64_t numberOfReports = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)@"_numberOfReports", v6, v7);
    v8->_int matchFrameType = objc_msgSend_decodeIntegerForKey_(v4, v9, (uint64_t)@"_matchFrameType", v10, v11);
    uint64_t v12 = (void *)MEMORY[0x189604010];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    objc_msgSend_setWithObjects_(v12, v15, v13, v16, v17, v14, 0);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, (uint64_t)@"_matchMACAddresses", v20);
    matchMACAddresses = v8->_matchMACAddresses;
    v8->_matchMACAddresses = (NSArray *)v21;

    v8->_int64_t timeout = objc_msgSend_decodeIntegerForKey_(v4, v23, (uint64_t)@"_timeout", v24, v25);
    v8->_BOOL submitMetric = objc_msgSend_decodeBoolForKey_(v4, v26, (uint64_t)@"_submitMetric", v27, v28);
    v8->_int64_t scheduleOnceAfter = objc_msgSend_decodeIntegerForKey_(v4, v29, (uint64_t)@"_scheduleOnceAfter", v30, v31);
    v8->_int64_t scheduleDailyAt = objc_msgSend_decodeIntegerForKey_(v4, v32, (uint64_t)@"_scheduleDailyAt", v33, v34);
    uint64_t v35 = (void *)MEMORY[0x189604010];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    objc_msgSend_setWithObjects_(v35, v38, v36, v39, v40, v37, 0);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v44 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v42, (uint64_t)v41, (uint64_t)@"_activityLabels", v43);
    activityLabels = v8->_activityLabels;
    v8->_activityLabels = (NSArray *)v44;

    uint64_t v46 = (void *)MEMORY[0x189604010];
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = objc_opt_class();
    objc_msgSend_setWithObjects_(v46, v49, v47, v50, v51, v48, 0);
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v55 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v53, (uint64_t)v52, (uint64_t)@"_placeLabels", v54);
    placeLabels = v8->_placeLabels;
    v8->_placeLabels = (NSArray *)v55;

    uint64_t v57 = objc_opt_class();
    uint64_t v60 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, (uint64_t)@"_comment", v59);
    comment = v8->_comment;
    v8->_comment = (NSString *)v60;
  }

  return v8;
}

- (int64_t)numberOfReports
{
  return self->_numberOfReports;
}

- (void)setNumberOfReports:(int64_t)a3
{
  self->_int64_t numberOfReports = a3;
}

- (int)matchFrameType
{
  return self->_matchFrameType;
}

- (void)setMatchFrameType:(int)a3
{
  self->_int matchFrameType = a3;
}

- (NSArray)matchMACAddresses
{
  return self->_matchMACAddresses;
}

- (void)setMatchMACAddresses:(id)a3
{
}

- (int64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int64_t)a3
{
  self->_int64_t timeout = a3;
}

- (BOOL)submitMetric
{
  return self->_submitMetric;
}

- (void)setSubmitMetric:(BOOL)a3
{
  self->_BOOL submitMetric = a3;
}

- (int64_t)scheduleOnceAfter
{
  return self->_scheduleOnceAfter;
}

- (void)setScheduleOnceAfter:(int64_t)a3
{
  self->_int64_t scheduleOnceAfter = a3;
}

- (int64_t)scheduleDailyAt
{
  return self->_scheduleDailyAt;
}

- (void)setScheduleDailyAt:(int64_t)a3
{
  self->_int64_t scheduleDailyAt = a3;
}

- (NSArray)activityLabels
{
  return self->_activityLabels;
}

- (void)setActivityLabels:(id)a3
{
}

- (NSArray)placeLabels
{
  return self->_placeLabels;
}

- (void)setPlaceLabels:(id)a3
{
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end