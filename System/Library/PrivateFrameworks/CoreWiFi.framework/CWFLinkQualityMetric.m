@interface CWFLinkQualityMetric
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLinkQualityMetric:(id)a3;
- (CWFLinkQualityMetric)initWithCoder:(id)a3;
- (NSData)linkQualityMetricData;
- (NSDate)updatedAt;
- (NSString)description;
- (double)rxRate;
- (double)txRate;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)RSSI;
- (int64_t)noise;
- (unint64_t)CCA;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLinkQualityMetricData:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation CWFLinkQualityMetric

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend_updatedAt(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, (uint64_t)@"updated_at", v10);

  v11 = (void *)MEMORY[0x189607968];
  uint64_t v16 = objc_msgSend_RSSI(self, v12, v13, v14, v15);
  objc_msgSend_numberWithInteger_(v11, v17, v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)@"rssi", v22);

  v23 = (void *)MEMORY[0x189607968];
  uint64_t v28 = objc_msgSend_noise(self, v24, v25, v26, v27);
  objc_msgSend_numberWithInteger_(v23, v29, v28, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, (uint64_t)@"noise", v34);

  v35 = (void *)MEMORY[0x189607968];
  objc_msgSend_txRate(self, v36, v37, v38, v39);
  objc_msgSend_numberWithDouble_(v35, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, (uint64_t)@"tx_rate", v46);

  v47 = (void *)MEMORY[0x189607968];
  objc_msgSend_rxRate(self, v48, v49, v50, v51);
  objc_msgSend_numberWithDouble_(v47, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v57, (uint64_t)v56, (uint64_t)@"rx_rate", v58);

  v59 = (void *)MEMORY[0x189607968];
  uint64_t v64 = objc_msgSend_CCA(self, v60, v61, v62, v63);
  objc_msgSend_numberWithUnsignedInteger_(v59, v65, v64, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, (uint64_t)@"cca", v70);

  objc_msgSend_linkQualityMetricData(self, v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v75;
  if (v75 && (unint64_t)objc_msgSend_length(v75, v76, v77, v78, v79) >= 0x148)
  {
    id v81 = v80;
    uint64_t v90 = objc_msgSend_bytes(v81, v82, v83, v84, v85);
    if (*(_BYTE *)(v90 + 8))
    {
      objc_msgSend_array(MEMORY[0x189603FA8], v86, v87, v88, v89);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithChar_(MEMORY[0x189607968], v92, *(char *)(v90 + 9), v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v91, v96, (uint64_t)v95, v97, v98);

      objc_msgSend_numberWithChar_(MEMORY[0x189607968], v99, *(char *)(v90 + 10), v100, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v91, v103, (uint64_t)v102, v104, v105);

      objc_msgSend_setObject_forKeyedSubscript_(v3, v106, (uint64_t)v91, (uint64_t)@"per_ant_rssi", v107);
    }

    if (*(_BYTE *)(v90 + 11))
    {
      objc_msgSend_numberWithShort_(MEMORY[0x189607968], v86, *(__int16 *)(v90 + 12), v88, v89);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v109, (uint64_t)v108, (uint64_t)@"snr", v110);
    }

    if (*(_BYTE *)(v90 + 168))
    {
      objc_msgSend_numberWithChar_(MEMORY[0x189607968], v86, *(char *)(v90 + 172), v88, v89);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v112, (uint64_t)v111, (uint64_t)@"cca_self_total", v113);

      objc_msgSend_numberWithChar_(MEMORY[0x189607968], v114, *(char *)(v90 + 173), v115, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v118, (uint64_t)v117, (uint64_t)@"cca_other_total", v119);

      objc_msgSend_numberWithChar_(MEMORY[0x189607968], v120, *(char *)(v90 + 174), v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v124, (uint64_t)v123, (uint64_t)@"cca_interference_total", v125);
    }

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v86, *(unsigned int *)(v90 + 28), v88, v89);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v127, (uint64_t)v126, (uint64_t)@"tx_frames", v128);

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v129, *(unsigned int *)(v90 + 20), v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v133, (uint64_t)v132, (uint64_t)@"tx_fail", v134);

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v135, *(unsigned int *)(v90 + 24), v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v139, (uint64_t)v138, (uint64_t)@"tx_retrans", v140);

    LODWORD(v141) = *(_DWORD *)(v90 + 68);
    objc_msgSend_numberWithDouble_(MEMORY[0x189607968], v142, v143, v144, v145, (double)v141 / 1000.0);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v147, (uint64_t)v146, (uint64_t)@"tx_fallback_rate", v148);

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v149, *(unsigned int *)(v90 + 36), v150, v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v153, (uint64_t)v152, (uint64_t)@"rx_frames", v154);

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v155, *(unsigned int *)(v90 + 32), v156, v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v159, (uint64_t)v158, (uint64_t)@"rx_retry_frames", v160);

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v161, *(unsigned int *)(v90 + 76), v162, v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v165, (uint64_t)v164, (uint64_t)@"rx_toss", v166);

    if (*(_BYTE *)(v90 + 48))
    {
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v167, *(unsigned int *)(v90 + 40), v168, v169);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v171, (uint64_t)v170, (uint64_t)@"beacon_recv", v172);

      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v173, *(unsigned int *)(v90 + 44), v174, v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v177, (uint64_t)v176, (uint64_t)@"beacon_sched", v178);
    }

    if (*(_BYTE *)(v90 + 49))
    {
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v167, *(unsigned int *)(v90 + 60), v168, v169);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v180, (uint64_t)v179, (uint64_t)@"tx_fw_frames", v181);

      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v182, *(unsigned int *)(v90 + 52), v183, v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v186, (uint64_t)v185, (uint64_t)@"tx_fw_fail", v187);

      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v188, *(unsigned int *)(v90 + 56), v189, v190);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v192, (uint64_t)v191, (uint64_t)@"tx_fw_retrans", v193);
    }
  }

  sub_1864586CC(v3, 0LL, 1u);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  if (v197)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v194, (uint64_t)v197, v195, v196);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v198 = 0LL;
  }

  return v198;
}

- (int64_t)RSSI
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v5;
  if (v5
    && objc_msgSend_length(v5, v6, v7, v8, v9) == 328
    && (v11 = v10, uint64_t v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15), *(_BYTE *)v16))
  {
    int64_t v17 = *(int *)(v16 + 4);
  }

  else
  {
    int64_t v17 = 0LL;
  }

  return v17;
}

- (int64_t)noise
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v5;
  if (v5
    && objc_msgSend_length(v5, v6, v7, v8, v9) == 328
    && (v11 = v10, uint64_t v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15), *(_BYTE *)(v16 + 14)))
  {
    int64_t v17 = *(__int16 *)(v16 + 16);
  }

  else
  {
    int64_t v17 = 0LL;
  }

  return v17;
}

- (unint64_t)CCA
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v5;
  if (v5
    && objc_msgSend_length(v5, v6, v7, v8, v9) == 328
    && (v11 = v10, uint64_t v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15), *(_BYTE *)(v16 + 18)))
  {
    unint64_t v17 = *(char *)(v16 + 19);
  }

  else
  {
    unint64_t v17 = 0LL;
  }

  return v17;
}

- (double)txRate
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v5;
  double v11 = 0.0;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8, v9) == 328)
  {
    id v12 = v10;
    double v11 = (double)(*(_DWORD *)(objc_msgSend_bytes(v12, v13, v14, v15, v16) + 64) / 0x3E8u);
  }

  return v11;
}

- (double)rxRate
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v5;
  double v11 = 0.0;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8, v9) == 328)
  {
    id v12 = v10;
    double v11 = (double)(*(_DWORD *)(objc_msgSend_bytes(v12, v13, v14, v15, v16) + 72) / 0x3E8u);
  }

  return v11;
}

- (NSString)description
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  double v11 = v6;
  if (v6 && objc_msgSend_length(v6, v7, v8, v9, v10) == 328)
  {
    id v12 = v11;
    uint64_t v17 = objc_msgSend_bytes(v12, v13, v14, v15, v16);
    objc_msgSend_string(MEMORY[0x189607940], v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = v22;
    if (*(_BYTE *)v17) {
      objc_msgSend_appendFormat_(v22, v23, (uint64_t)@"rssi=%ddBm ", v24, v25, *(unsigned int *)(v17 + 4));
    }
    if (*(_BYTE *)(v17 + 8))
    {
      objc_msgSend_appendString_(v27, v23, (uint64_t)@"per_ant_rssi=("), v24, v25;
      objc_msgSend_appendFormat_(v27, v28, (uint64_t)@"%ddBm, ", v29, v30, *(char *)(v17 + 9));
      objc_msgSend_appendFormat_(v27, v31, (uint64_t)@"%ddBm, ", v32, v33, *(char *)(v17 + 10));
      if (objc_msgSend_hasSuffix_(v27, v34, (uint64_t)@", ", v35, v36))
      {
        uint64_t v41 = objc_msgSend_length(v27, v37, v38, v39, v40);
        objc_msgSend_deleteCharactersInRange_(v27, v42, v41 - 2, 2, v43);
      }

      objc_msgSend_appendString_(v27, v37, (uint64_t)@" "), v39, v40);
    }

    if (*(_BYTE *)(v17 + 14)) {
      objc_msgSend_appendFormat_(v27, v23, (uint64_t)@"noise=%ddBm ", v24, v25, *(__int16 *)(v17 + 16));
    }
    if (*(_BYTE *)(v17 + 11)) {
      objc_msgSend_appendFormat_(v27, v23, (uint64_t)@"snr=%d ", v24, v25, *(__int16 *)(v17 + 12));
    }
    if (*(_BYTE *)(v17 + 18)) {
      objc_msgSend_appendFormat_(v27, v23, (uint64_t)@"cca=%.1f%% ", v24, v25, (double)*(char *)(v17 + 19));
    }
    if (*(_BYTE *)(v17 + 168)) {
      objc_msgSend_appendFormat_( v27,  v23,  (uint64_t)@"ccaSelfTotal=%d ccaOtherTotal=%d interferenceTotal=%d ",  v24,  v25,  *(char *)(v17 + 172),  *(char *)(v17 + 173),  *(char *)(v17 + 174));
    }
    LODWORD(v26) = *(_DWORD *)(v17 + 64);
    objc_msgSend_appendFormat_(v27, v23, (uint64_t)@"txRate=%.1fMbps ", v24, v25, (double)v26 / 1000.0);
    LODWORD(v44) = *(_DWORD *)(v17 + 68);
    objc_msgSend_appendFormat_( v27,  v45,  (uint64_t)@"txFrames=%d txFail=%d txRetrans=%d txFallbackRate=%.1fMbps ",  v46,  v47,  *(unsigned int *)(v17 + 28),  *(unsigned int *)(v17 + 20),  *(unsigned int *)(v17 + 24),  (double)v44 / 1000.0);
    LODWORD(v48) = *(_DWORD *)(v17 + 72);
    objc_msgSend_appendFormat_(v27, v49, (uint64_t)@"rxRate=%.1fMbps ", v50, v51, (double)v48 / 1000.0);
    objc_msgSend_appendFormat_( v27,  v52,  (uint64_t)@"rxFrames=%d rxRetryFrames=%d ",  v53,  v54,  *(unsigned int *)(v17 + 36),  *(unsigned int *)(v17 + 32));
    objc_msgSend_appendFormat_(v27, v55, (uint64_t)@"rxToss=%d ", v56, v57, *(unsigned int *)(v17 + 76));
    if (*(_BYTE *)(v17 + 48)) {
      objc_msgSend_appendFormat_( v27,  v58,  (uint64_t)@"beaconRecv=%d beaconSched=%d ",  v60,  v61,  *(unsigned int *)(v17 + 40),  *(unsigned int *)(v17 + 44));
    }
    if (*(_BYTE *)(v17 + 49)) {
      objc_msgSend_appendFormat_( v27,  v58,  (uint64_t)@"txFwFrames=%d txFwFail=%d txFwRetrans=%d",  v60,  v61,  *(unsigned int *)(v17 + 60),  *(unsigned int *)(v17 + 52),  *(unsigned int *)(v17 + 56));
    }
    uint64_t v62 = (void *)objc_msgSend_copy(v27, v58, v59, v60, v61);
  }

  else
  {
    v64.receiver = self;
    v64.super_class = (Class)&OBJC_CLASS___CWFLinkQualityMetric;
    -[CWFLinkQualityMetric description](&v64, sel_description);
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v62;
}

- (BOOL)isEqualToLinkQualityMetric:(id)a3
{
  id v6 = a3;
  updatedAt = self->_updatedAt;
  objc_msgSend_updatedAt(v6, v8, v9, v10, v11);
  uint64_t v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (updatedAt != v16)
  {
    if (!self->_updatedAt
      || (objc_msgSend_updatedAt(v6, v12, v13, v14, v15), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      char isEqual = 0;
      goto LABEL_14;
    }

    uint64_t v3 = (void *)v17;
    uint64_t v22 = self->_updatedAt;
    objc_msgSend_updatedAt(v6, v18, v19, v20, v21);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      char isEqual = 0;
LABEL_12:

      goto LABEL_14;
    }
  }

  linkQualityMetricData = self->_linkQualityMetricData;
  objc_msgSend_linkQualityMetricData(v6, v12, v13, v14, v15);
  uint64_t v32 = (NSData *)objc_claimAutoreleasedReturnValue();
  char isEqual = linkQualityMetricData == v32;
  if (isEqual || !self->_linkQualityMetricData) {
    goto LABEL_10;
  }
  uint64_t v33 = objc_msgSend_linkQualityMetricData(v6, v28, v29, v30, v31);
  if (v33)
  {
    uint64_t v38 = (void *)v33;
    uint64_t v39 = self->_linkQualityMetricData;
    objc_msgSend_linkQualityMetricData(v6, v34, v35, v36, v37);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    char isEqual = objc_msgSend_isEqual_(v39, v41, (uint64_t)v40, v42, v43);

LABEL_10:
    goto LABEL_11;
  }

  char isEqual = 0;
LABEL_11:
  if (updatedAt != v16) {
    goto LABEL_12;
  }
LABEL_14:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFLinkQualityMetric *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToLinkQualityMetric = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToLinkQualityMetric = objc_msgSend_isEqualToLinkQualityMetric_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToLinkQualityMetric = 0;
  }

  return isEqualToLinkQualityMetric;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_linkQualityMetricData, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_updatedAt, v7, v8, v9, v10) ^ v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFLinkQualityMetric, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setLinkQualityMetricData_(v11, v12, (uint64_t)self->_linkQualityMetricData, v13, v14);
  objc_msgSend_setUpdatedAt_(v11, v15, (uint64_t)self->_updatedAt, v16, v17);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  linkQualityMetricData = self->_linkQualityMetricData;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_( v9,  v5,  (uint64_t)linkQualityMetricData,  (uint64_t)@"_linkQualityMetricData",  v6);
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_updatedAt, (uint64_t)@"_updatedAt", v8);
}

- (CWFLinkQualityMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CWFLinkQualityMetric;
  uint64_t v5 = -[CWFLinkQualityMetric init](&v17, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)@"_linkQualityMetricData", v8);
    linkQualityMetricData = v5->_linkQualityMetricData;
    v5->_linkQualityMetricData = (NSData *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)@"_updatedAt", v13);
    updatedAt = v5->_updatedAt;
    v5->_updatedAt = (NSDate *)v14;
  }

  return v5;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (void)setUpdatedAt:(id)a3
{
}

- (NSData)linkQualityMetricData
{
  return self->_linkQualityMetricData;
}

- (void)setLinkQualityMetricData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end