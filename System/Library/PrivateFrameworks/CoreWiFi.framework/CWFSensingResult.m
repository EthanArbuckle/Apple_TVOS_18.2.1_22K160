@interface CWFSensingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSensingResult:(id)a3;
- (CWFSensingResult)initWithCoder:(id)a3;
- (NSArray)data;
- (NSString)description;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation CWFSensingResult

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend_data(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, (uint64_t)@"data", v10);

  sub_1864586CC(v3, 0LL, 1u);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v11, (uint64_t)v14, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (NSString)description
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v6;
  if (self->_data)
  {
    objc_msgSend_appendFormat_(v6, v7, (uint64_t)@"data={\n", v8, v9);
    if (objc_msgSend_count(self->_data, v11, v12, v13, v14))
    {
      unint64_t v18 = 0LL;
      v280 = self;
      do
      {
        objc_msgSend_objectAtIndex_(self->_data, v15, v18, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)@"SENSING_RESULTS_DATA_TIMESTAMP", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v23, v24, v25, v26, v27);
        double v29 = v28;

        uint64_t v34 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x189603F50], v30, v31, v32, v33, v29);
        id v35 = objc_alloc_init(MEMORY[0x189607848]);
        objc_msgSend_setDateFormat_(v35, v36, (uint64_t)@"yyyy/MM/dd HH:mm:ss:SSS", v37, v38);
        objc_msgSend_localTimeZone(MEMORY[0x189604020], v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setTimeZone_(v35, v44, (uint64_t)v43, v45, v46);

        v283 = (void *)v34;
        objc_msgSend_stringFromDate_(v35, v47, v34, v48, v49);
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v10, v50, (uint64_t)@"\tDATA_TIMESTAMP[%ld] = %@\n", v51, v52, v18, v282);
        objc_msgSend_objectForKeyedSubscript_(v19, v53, (uint64_t)@"SENSING_RESULTS_DATA_INFO_TA", v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v10, v57, (uint64_t)@"\tDATA_INFO_TA = %@\n", v58, v59, v56);
        objc_msgSend_objectForKeyedSubscript_(v19, v60, (uint64_t)@"SENSING_RESULTS_DATA_INFO_RA", v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_appendFormat_(v10, v64, (uint64_t)@"\tDATA_INFO_RA = %@\n", v65, v66, v63);
        uint64_t v70 = objc_msgSend_objectForKeyedSubscript_(v19, v67, (uint64_t)@"SENSING_RESULTS_DATA_INFO_BSSID", v68, v69);

        v281 = (void *)v70;
        objc_msgSend_appendFormat_(v10, v71, (uint64_t)@"\tDATA_INFO_BSSID = %@\n", v72, v73, v70);
        objc_msgSend_objectForKeyedSubscript_(v19, v74, (uint64_t)@"SENSING_RESULTS_DATA_INFO_NUM_TONES", v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v82 = objc_msgSend_integerValue(v77, v78, v79, v80, v81);

        objc_msgSend_appendFormat_(v10, v83, (uint64_t)@"\tDATA_INFO_NUM_TONES = %ld\n", v84, v85, v82);
        objc_msgSend_objectForKeyedSubscript_(v19, v86, (uint64_t)@"SENSING_RESULTS_DATA_INFO_BW", v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v94 = objc_msgSend_integerValue(v89, v90, v91, v92, v93);

        objc_msgSend_appendFormat_(v10, v95, (uint64_t)@"\tDATA_INFO_BW = %ld\n", v96, v97, v94);
        objc_msgSend_objectForKeyedSubscript_( v19,  v98,  (uint64_t)@"SENSING_RESULTS_DATA_INFO_FRAME_TYPE",  v99,  v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v106 = objc_msgSend_integerValue(v101, v102, v103, v104, v105);

        objc_msgSend_appendFormat_(v10, v107, (uint64_t)@"\tDATA_INFO_FRAME_TYPE = 0x%lx\n", v108, v109, v106);
        objc_msgSend_objectForKeyedSubscript_(v19, v110, (uint64_t)@"SENSING_RESULTS_DATA_INFO_NSTS", v111, v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v118 = objc_msgSend_integerValue(v113, v114, v115, v116, v117);

        objc_msgSend_appendFormat_(v10, v119, (uint64_t)@"\tDATA_INFO_NSTS_IN_FRAME = %ld\n", v120, v121, v118);
        objc_msgSend_objectForKeyedSubscript_(v19, v122, (uint64_t)@"SENSING_RESULTS_DATA_INFO_SLICE", v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v130 = objc_msgSend_integerValue(v125, v126, v127, v128, v129);

        objc_msgSend_appendFormat_(v10, v131, (uint64_t)@"\tDATA_INFO_SLICE = %ld\n", v132, v133, v130);
        objc_msgSend_objectForKeyedSubscript_( v19,  v134,  (uint64_t)@"SENSING_RESULTS_DATA_INFO_NUM_RX_CORES",  v135,  v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v142 = objc_msgSend_integerValue(v137, v138, v139, v140, v141);

        objc_msgSend_appendFormat_(v10, v143, (uint64_t)@"\tDATA_INFO_NUM_RX_CORES = %ld\n", v144, v145, v142);
        objc_msgSend_objectForKeyedSubscript_( v19,  v146,  (uint64_t)@"SENSING_RESULTS_DATA_INFO_NUM_STREAMS",  v147,  v148);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v154 = objc_msgSend_integerValue(v149, v150, v151, v152, v153);

        objc_msgSend_appendFormat_(v10, v155, (uint64_t)@"\tDATA_INFO_NSTS_REPORTED = %ld\n", v156, v157, v154);
        objc_msgSend_objectForKeyedSubscript_( v19,  v158,  (uint64_t)@"SENSING_RESULTS_DATA_INFO_AGC_GAIN",  v159,  v160);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v166 = objc_msgSend_integerValue(v161, v162, v163, v164, v165);

        objc_msgSend_appendFormat_(v10, v167, (uint64_t)@"\tDATA_INFO_AGC_GAIN = %ld\n", v168, v169, v166);
        objc_msgSend_objectForKeyedSubscript_( v19,  v170,  (uint64_t)@"SENSING_RESULTS_DATA_INFO_NUM_RSSI",  v171,  v172);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v178 = objc_msgSend_integerValue(v173, v174, v175, v176, v177);

        objc_msgSend_appendFormat_(v10, v179, (uint64_t)@"\tDATA_INFO_NUM_RSSI = %ld\n", v180, v181, v178);
        objc_msgSend_objectForKeyedSubscript_( v19,  v182,  (uint64_t)@"SENSING_RESULTS_DATA_INFO_CHANNEL",  v183,  v184);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v190 = objc_msgSend_integerValue(v185, v186, v187, v188, v189);

        objc_msgSend_appendFormat_(v10, v191, (uint64_t)@"\tDATA_INFO_CHANNEL = %ld\n", v192, v193, v190);
        objc_msgSend_objectForKeyedSubscript_(v19, v194, (uint64_t)@"SENSING_RESULTS_DATA_INFO_BW", v195, v196);
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v202 = objc_msgSend_integerValue(v197, v198, v199, v200, v201);

        objc_msgSend_appendFormat_(v10, v203, (uint64_t)@"\tDATA_INFO_BW = %ld\n", v204, v205, v202);
        objc_msgSend_objectForKeyedSubscript_(v19, v206, (uint64_t)@"SENSING_RESULTS_DATA_INFO_RSSI", v207, v208);
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v10, v210, (uint64_t)@"\tDATA_INFO_RSSI[%ld] =", v211, v212, v18);
        if (objc_msgSend_count(v209, v213, v214, v215, v216))
        {
          unint64_t v220 = 0LL;
          do
          {
            objc_msgSend_objectAtIndex_(v209, v217, v220, v218, v219);
            v221 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v226 = objc_msgSend_integerValue(v221, v222, v223, v224, v225);
            objc_msgSend_appendFormat_(v10, v227, (uint64_t)@" %ld", v228, v229, v226);

            ++v220;
          }

          while (v220 < objc_msgSend_count(v209, v230, v231, v232, v233));
        }

        objc_msgSend_appendFormat_(v10, v217, (uint64_t)@"\n", v218, v219);
        objc_msgSend_objectForKeyedSubscript_(v19, v234, (uint64_t)@"SENSING_RESULTS_DATA_BUFFER_LEN", v235, v236);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v242 = objc_msgSend_unsignedIntValue(v237, v238, v239, v240, v241);

        objc_msgSend_appendFormat_( v10,  v243,  (uint64_t)@"\tDATA_BUFFER_LEN[%ld] = %ld\n",  v244,  v245,  v18,  v242);
        objc_msgSend_objectForKeyedSubscript_(v19, v246, (uint64_t)@"SENSING_RESULTS_DATA_BUFFER", v247, v248);
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v10, v250, (uint64_t)@"\tDATA_BUFFER[%ld] =", v251, v252, v18);
        if (objc_msgSend_count(v249, v253, v254, v255, v256))
        {
          unint64_t v260 = 0LL;
          do
          {
            objc_msgSend_objectAtIndex_(v249, v257, v260, v258, v259);
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v266 = objc_msgSend_integerValue(v261, v262, v263, v264, v265);
            objc_msgSend_appendFormat_(v10, v267, (uint64_t)@" 0x%08lx", v268, v269, v266);

            ++v260;
          }

          while (v260 < objc_msgSend_count(v249, v270, v271, v272, v273));
        }

        objc_msgSend_appendFormat_(v10, v257, (uint64_t)@"\n", v258, v259);

        ++v18;
        self = v280;
      }

      while (v18 < objc_msgSend_count(v280->_data, v274, v275, v276, v277));
    }

    objc_msgSend_appendFormat_(v10, v15, (uint64_t)@"}\n", v16, v17, v279);
  }

  else
  {
    objc_msgSend_appendFormat_(v6, v7, (uint64_t)@"data=%@\n", v8, v9, 0);
  }

  return (NSString *)v10;
}

- (BOOL)isEqualToSensingResult:(id)a3
{
  id v4 = a3;
  data = self->_data;
  objc_msgSend_data(v4, v6, v7, v8, v9);
  uint64_t v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (data == v14)
  {
    char isEqual = 1;
  }

  else if (self->_data)
  {
    objc_msgSend_data(v4, v10, v11, v12, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = self->_data;
      objc_msgSend_data(v4, v15, v16, v17, v18);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      char isEqual = objc_msgSend_isEqual_(v20, v22, (uint64_t)v21, v23, v24);
    }

    else
    {
      char isEqual = 0;
    }
  }

  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFSensingResult *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToSensingResult = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToSensingResult = objc_msgSend_isEqualToSensingResult_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToSensingResult = 0;
  }

  return isEqualToSensingResult;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_data, a2, v2, v3, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFSensingResult, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setData_(v11, v12, (uint64_t)self->_data, v13, v14);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CWFSensingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CWFSensingResult;
  uint64_t v5 = -[CWFSensingResult init](&v20, sel_init);
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v11, v7, v12, v13, v8, v9, v10, 0);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, (uint64_t)@"_data", v16);
    data = v5->_data;
    v5->_data = (NSArray *)v17;
  }

  return v5;
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end