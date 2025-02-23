@interface CWFAutoJoinStatistics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAutoJoinStatistics:(id)a3;
- (CWFAutoJoinStatistics)init;
- (CWFAutoJoinStatistics)initWithCoder:(id)a3;
- (NSDate)startedAt;
- (NSDictionary)coreAnalyticsEventPayload;
- (NSMutableDictionary)autoJoinTriggerCounts;
- (NSString)coreAnalyticsEventName;
- (NSString)description;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)GASQueryCount;
- (unint64_t)autoHotspotAbortedCount;
- (unint64_t)autoHotspotCount;
- (unint64_t)autoHotspotDidFindCandidateCount;
- (unint64_t)autoHotspotDidJoinCount;
- (unint64_t)autoJoinAbortedCount;
- (unint64_t)autoJoinAlreadyAssociatedCount;
- (unint64_t)autoJoinCount;
- (unint64_t)autoJoinDidFindCandidateCount;
- (unint64_t)autoJoinDidJoinCount;
- (unint64_t)autoJoinRetryCount;
- (unint64_t)combinedScanChannelCount;
- (unint64_t)combinedScanChannelCount2GHz;
- (unint64_t)combinedScanChannelCount5GHz;
- (unint64_t)combinedScanChannelCount6GHz;
- (unint64_t)followup6GHzScanChannelCount;
- (unint64_t)hash;
- (unint64_t)preAssocScanChannelCount;
- (unint64_t)preAssocScanChannelCount2GHz;
- (unint64_t)preAssocScanChannelCount5GHz;
- (unint64_t)preAssocScanChannelCount6GHz;
- (unint64_t)scanChannelCount;
- (unint64_t)scanChannelCount2GHz;
- (unint64_t)scanChannelCount5GHz;
- (unint64_t)scanChannelCount6GHz;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoHotspotAbortedCount:(unint64_t)a3;
- (void)setAutoHotspotCount:(unint64_t)a3;
- (void)setAutoHotspotDidFindCandidateCount:(unint64_t)a3;
- (void)setAutoHotspotDidJoinCount:(unint64_t)a3;
- (void)setAutoJoinAbortedCount:(unint64_t)a3;
- (void)setAutoJoinAlreadyAssociatedCount:(unint64_t)a3;
- (void)setAutoJoinDidFindCandidateCount:(unint64_t)a3;
- (void)setAutoJoinDidJoinCount:(unint64_t)a3;
- (void)setAutoJoinTriggerCounts:(id)a3;
- (void)setFollowup6GHzScanChannelCount:(unint64_t)a3;
- (void)setGASQueryCount:(unint64_t)a3;
- (void)setPreAssocScanChannelCount2GHz:(unint64_t)a3;
- (void)setPreAssocScanChannelCount5GHz:(unint64_t)a3;
- (void)setPreAssocScanChannelCount6GHz:(unint64_t)a3;
- (void)setPreAssocScanChannelCount:(unint64_t)a3;
- (void)setScanChannelCount2GHz:(unint64_t)a3;
- (void)setScanChannelCount5GHz:(unint64_t)a3;
- (void)setScanChannelCount6GHz:(unint64_t)a3;
- (void)setScanChannelCount:(unint64_t)a3;
- (void)setStartedAt:(id)a3;
@end

@implementation CWFAutoJoinStatistics

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend_startedAt(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, (uint64_t)@"started_at", v10);

  v11 = (void *)MEMORY[0x189607968];
  uint64_t v16 = objc_msgSend_autoJoinCount(self, v12, v13, v14, v15);
  objc_msgSend_numberWithUnsignedInteger_(v11, v17, v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)@"auto_join_count", v22);

  v23 = (void *)MEMORY[0x189607968];
  uint64_t v28 = objc_msgSend_autoJoinRetryCount(self, v24, v25, v26, v27);
  objc_msgSend_numberWithUnsignedInteger_(v23, v29, v28, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, (uint64_t)@"auto_join_retry_count", v34);

  v35 = (void *)MEMORY[0x189607968];
  uint64_t CandidateCount = objc_msgSend_autoJoinDidFindCandidateCount(self, v36, v37, v38, v39);
  objc_msgSend_numberWithUnsignedInteger_(v35, v41, CandidateCount, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v45,  (uint64_t)v44,  (uint64_t)@"auto_join_did_find_candidate_count",  v46);

  v47 = (void *)MEMORY[0x189607968];
  uint64_t v52 = objc_msgSend_autoJoinDidJoinCount(self, v48, v49, v50, v51);
  objc_msgSend_numberWithUnsignedInteger_(v47, v53, v52, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v57, (uint64_t)v56, (uint64_t)@"auto_join_did_join_count", v58);

  v59 = (void *)MEMORY[0x189607968];
  uint64_t v64 = objc_msgSend_autoJoinAlreadyAssociatedCount(self, v60, v61, v62, v63);
  objc_msgSend_numberWithUnsignedInteger_(v59, v65, v64, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, (uint64_t)@"auto_join_already_assoc_count", v70);

  v71 = (void *)MEMORY[0x189607968];
  uint64_t v76 = objc_msgSend_autoJoinAbortedCount(self, v72, v73, v74, v75);
  objc_msgSend_numberWithUnsignedInteger_(v71, v77, v76, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v81, (uint64_t)v80, (uint64_t)@"auto_join_aborted_count", v82);

  v83 = (void *)MEMORY[0x189607968];
  uint64_t v88 = objc_msgSend_combinedScanChannelCount(self, v84, v85, v86, v87);
  objc_msgSend_numberWithUnsignedInteger_(v83, v89, v88, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v93, (uint64_t)v92, (uint64_t)@"combined_scan_channel_count", v94);

  v95 = (void *)MEMORY[0x189607968];
  uint64_t v100 = objc_msgSend_combinedScanChannelCount2GHz(self, v96, v97, v98, v99);
  objc_msgSend_numberWithUnsignedInteger_(v95, v101, v100, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v105,  (uint64_t)v104,  (uint64_t)@"combined_scan_channel_count_2ghz",  v106);

  v107 = (void *)MEMORY[0x189607968];
  uint64_t v112 = objc_msgSend_combinedScanChannelCount5GHz(self, v108, v109, v110, v111);
  objc_msgSend_numberWithUnsignedInteger_(v107, v113, v112, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v117,  (uint64_t)v116,  (uint64_t)@"combined_scan_channel_count_5ghz",  v118);

  v119 = (void *)MEMORY[0x189607968];
  uint64_t v124 = objc_msgSend_combinedScanChannelCount6GHz(self, v120, v121, v122, v123);
  objc_msgSend_numberWithUnsignedInteger_(v119, v125, v124, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v129,  (uint64_t)v128,  (uint64_t)@"combined_scan_channel_count_6ghz",  v130);

  v131 = (void *)MEMORY[0x189607968];
  uint64_t v136 = objc_msgSend_scanChannelCount(self, v132, v133, v134, v135);
  objc_msgSend_numberWithUnsignedInteger_(v131, v137, v136, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v141, (uint64_t)v140, (uint64_t)@"scan_channel_count", v142);

  v143 = (void *)MEMORY[0x189607968];
  uint64_t v148 = objc_msgSend_scanChannelCount2GHz(self, v144, v145, v146, v147);
  objc_msgSend_numberWithUnsignedInteger_(v143, v149, v148, v150, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v153, (uint64_t)v152, (uint64_t)@"scan_channel_count_2ghz", v154);

  v155 = (void *)MEMORY[0x189607968];
  uint64_t v160 = objc_msgSend_scanChannelCount5GHz(self, v156, v157, v158, v159);
  objc_msgSend_numberWithUnsignedInteger_(v155, v161, v160, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v165, (uint64_t)v164, (uint64_t)@"scan_channel_count_5ghz", v166);

  v167 = (void *)MEMORY[0x189607968];
  uint64_t v172 = objc_msgSend_scanChannelCount6GHz(self, v168, v169, v170, v171);
  objc_msgSend_numberWithUnsignedInteger_(v167, v173, v172, v174, v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v177, (uint64_t)v176, (uint64_t)@"scan_channel_count_6ghz", v178);

  v179 = (void *)MEMORY[0x189607968];
  uint64_t v184 = objc_msgSend_preAssocScanChannelCount(self, v180, v181, v182, v183);
  objc_msgSend_numberWithUnsignedInteger_(v179, v185, v184, v186, v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v189,  (uint64_t)v188,  (uint64_t)@"pre_assoc_scan_channel_count",  v190);

  v191 = (void *)MEMORY[0x189607968];
  uint64_t v196 = objc_msgSend_preAssocScanChannelCount2GHz(self, v192, v193, v194, v195);
  objc_msgSend_numberWithUnsignedInteger_(v191, v197, v196, v198, v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v201,  (uint64_t)v200,  (uint64_t)@"pre_assoc_scan_channel_count_2ghz",  v202);

  v203 = (void *)MEMORY[0x189607968];
  uint64_t v208 = objc_msgSend_preAssocScanChannelCount5GHz(self, v204, v205, v206, v207);
  objc_msgSend_numberWithUnsignedInteger_(v203, v209, v208, v210, v211);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v213,  (uint64_t)v212,  (uint64_t)@"pre_assoc_scan_channel_count_5ghz",  v214);

  v215 = (void *)MEMORY[0x189607968];
  uint64_t v220 = objc_msgSend_preAssocScanChannelCount6GHz(self, v216, v217, v218, v219);
  objc_msgSend_numberWithUnsignedInteger_(v215, v221, v220, v222, v223);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v225,  (uint64_t)v224,  (uint64_t)@"pre_assoc_scan_channel_count_6ghz",  v226);

  v227 = (void *)MEMORY[0x189607968];
  uint64_t v232 = objc_msgSend_followup6GHzScanChannelCount(self, v228, v229, v230, v231);
  objc_msgSend_numberWithUnsignedInteger_(v227, v233, v232, v234, v235);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v237,  (uint64_t)v236,  (uint64_t)@"followup_6ghz_scan_channel_count",  v238);

  v239 = (void *)MEMORY[0x189607968];
  uint64_t v244 = objc_msgSend_GASQueryCount(self, v240, v241, v242, v243);
  objc_msgSend_numberWithUnsignedInteger_(v239, v245, v244, v246, v247);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v249, (uint64_t)v248, (uint64_t)@"gas_query_count", v250);

  v251 = (void *)MEMORY[0x189607968];
  uint64_t v256 = objc_msgSend_autoHotspotCount(self, v252, v253, v254, v255);
  objc_msgSend_numberWithUnsignedInteger_(v251, v257, v256, v258, v259);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v261, (uint64_t)v260, (uint64_t)@"auto_hotspot_count", v262);

  v263 = (void *)MEMORY[0x189607968];
  uint64_t v268 = objc_msgSend_autoHotspotDidFindCandidateCount(self, v264, v265, v266, v267);
  objc_msgSend_numberWithUnsignedInteger_(v263, v269, v268, v270, v271);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v273,  (uint64_t)v272,  (uint64_t)@"auto_hotspot_did_find_candidate_count",  v274);

  v275 = (void *)MEMORY[0x189607968];
  uint64_t v280 = objc_msgSend_autoHotspotDidJoinCount(self, v276, v277, v278, v279);
  objc_msgSend_numberWithUnsignedInteger_(v275, v281, v280, v282, v283);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v285,  (uint64_t)v284,  (uint64_t)@"auto_hotspot_did_join_count",  v286);

  v287 = (void *)MEMORY[0x189607968];
  uint64_t v292 = objc_msgSend_autoHotspotAbortedCount(self, v288, v289, v290, v291);
  objc_msgSend_numberWithUnsignedInteger_(v287, v293, v292, v294, v295);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v297, (uint64_t)v296, (uint64_t)@"auto_hotspot_aborted_count", v298);

  objc_msgSend_dictionary(MEMORY[0x189603FC8], v299, v300, v301, v302);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autoJoinTriggerCounts(self, v304, v305, v306, v307);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v321[0] = MEMORY[0x1895F87A8];
  v321[1] = 3221225472LL;
  v321[2] = sub_18652BD2C;
  v321[3] = &unk_189E5FB88;
  id v309 = v303;
  id v322 = v309;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v308, v310, (uint64_t)v321, v311, v312);

  objc_msgSend_setObject_forKeyedSubscript_(v3, v313, (uint64_t)v309, (uint64_t)@"auto_join_trigger_counts", v314);
  sub_1864586CC(v3, 0LL, 1u);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  if (v318)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v315, (uint64_t)v318, v316, v317);
    v319 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v319 = 0LL;
  }

  return v319;
}

- (CWFAutoJoinStatistics)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CWFAutoJoinStatistics;
  v2 = -[CWFAutoJoinStatistics init](&v6, sel_init);
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    autoJoinTriggerCounts = v2->_autoJoinTriggerCounts;
    v2->_autoJoinTriggerCounts = v3;
  }

  return v2;
}

- (unint64_t)autoJoinCount
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  objc_msgSend_autoJoinTriggerCounts(self, a2, v2, v3, v4, 0);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v5, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v12)
  {
    uint64_t v17 = v12;
    unint64_t v18 = 0LL;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v17; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v10);
        }
        v18 += objc_msgSend_unsignedIntegerValue(*(void **)(*((void *)&v22 + 1) + 8 * i), v13, v14, v15, v16);
      }

      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v22, (uint64_t)v26, 16);
    }

    while (v17);
  }

  else
  {
    unint64_t v18 = 0LL;
  }

  return v18;
}

- (unint64_t)autoJoinRetryCount
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = 0LL;
  objc_msgSend_autoJoinTriggerCounts(self, a2, v2, v3, v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_18652BFB0;
  v11[3] = &unk_189E5FBB0;
  v11[4] = &v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v6, (uint64_t)v11, v7, v8);

  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unint64_t)combinedScanChannelCount
{
  uint64_t v6 = objc_msgSend_scanChannelCount(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_preAssocScanChannelCount(self, v7, v8, v9, v10) + v6;
  return v11 + objc_msgSend_followup6GHzScanChannelCount(self, v12, v13, v14, v15);
}

- (unint64_t)combinedScanChannelCount2GHz
{
  uint64_t v6 = objc_msgSend_scanChannelCount2GHz(self, a2, v2, v3, v4);
  return objc_msgSend_preAssocScanChannelCount2GHz(self, v7, v8, v9, v10) + v6;
}

- (unint64_t)combinedScanChannelCount5GHz
{
  uint64_t v6 = objc_msgSend_scanChannelCount5GHz(self, a2, v2, v3, v4);
  return objc_msgSend_preAssocScanChannelCount5GHz(self, v7, v8, v9, v10) + v6;
}

- (unint64_t)combinedScanChannelCount6GHz
{
  uint64_t v6 = objc_msgSend_scanChannelCount6GHz(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_preAssocScanChannelCount6GHz(self, v7, v8, v9, v10) + v6;
  return v11 + objc_msgSend_followup6GHzScanChannelCount(self, v12, v13, v14, v15);
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.wifi.autojoin.statistics";
}

- (NSDictionary)coreAnalyticsEventPayload
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)MEMORY[0x189607968];
  uint64_t v12 = objc_msgSend_autoJoinCount(self, v8, v9, v10, v11);
  objc_msgSend_numberWithUnsignedInteger_(v7, v13, v12, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v17, (uint64_t)v16, (uint64_t)@"autoJoinCount", v18);

  uint64_t v19 = (void *)MEMORY[0x189607968];
  uint64_t v24 = objc_msgSend_autoJoinAlreadyAssociatedCount(self, v20, v21, v22, v23);
  objc_msgSend_numberWithUnsignedInteger_(v19, v25, v24, v26, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v6,  v29,  (uint64_t)v28,  (uint64_t)@"autoJoinAlreadyAssociatedCount",  v30);

  uint64_t v31 = (void *)MEMORY[0x189607968];
  uint64_t CandidateCount = objc_msgSend_autoJoinDidFindCandidateCount(self, v32, v33, v34, v35);
  objc_msgSend_numberWithUnsignedInteger_(v31, v37, CandidateCount, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v40, (uint64_t)@"autoJoinDidFindCandidateCount", v42);

  uint64_t v43 = (void *)MEMORY[0x189607968];
  uint64_t v48 = objc_msgSend_autoJoinDidJoinCount(self, v44, v45, v46, v47);
  objc_msgSend_numberWithUnsignedInteger_(v43, v49, v48, v50, v51);
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, (uint64_t)@"autoJoinDidJoinCount", v54);

  uint64_t v55 = (void *)MEMORY[0x189607968];
  uint64_t v60 = objc_msgSend_autoJoinAbortedCount(self, v56, v57, v58, v59);
  objc_msgSend_numberWithUnsignedInteger_(v55, v61, v60, v62, v63);
  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v65, (uint64_t)v64, (uint64_t)@"autoJoinAbortedCount", v66);

  uint64_t v67 = (void *)MEMORY[0x189607968];
  uint64_t v72 = objc_msgSend_autoJoinRetryCount(self, v68, v69, v70, v71);
  objc_msgSend_numberWithUnsignedInteger_(v67, v73, v72, v74, v75);
  uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v77, (uint64_t)v76, (uint64_t)@"autoJoinRetryCount", v78);

  uint64_t v79 = (void *)MEMORY[0x189607968];
  uint64_t v84 = objc_msgSend_combinedScanChannelCount(self, v80, v81, v82, v83);
  objc_msgSend_numberWithUnsignedInteger_(v79, v85, v84, v86, v87);
  uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v89, (uint64_t)v88, (uint64_t)@"combinedScanChannelCount", v90);

  uint64_t v91 = (void *)MEMORY[0x189607968];
  uint64_t v96 = objc_msgSend_combinedScanChannelCount2GHz(self, v92, v93, v94, v95);
  objc_msgSend_numberWithUnsignedInteger_(v91, v97, v96, v98, v99);
  uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v6,  v101,  (uint64_t)v100,  (uint64_t)@"combinedScanChannelCount2GHz",  v102);

  uint64_t v103 = (void *)MEMORY[0x189607968];
  uint64_t v108 = objc_msgSend_combinedScanChannelCount5GHz(self, v104, v105, v106, v107);
  objc_msgSend_numberWithUnsignedInteger_(v103, v109, v108, v110, v111);
  uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v6,  v113,  (uint64_t)v112,  (uint64_t)@"combinedScanChannelCount5GHz",  v114);

  uint64_t v115 = (void *)MEMORY[0x189607968];
  uint64_t v120 = objc_msgSend_combinedScanChannelCount6GHz(self, v116, v117, v118, v119);
  objc_msgSend_numberWithUnsignedInteger_(v115, v121, v120, v122, v123);
  uint64_t v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v6,  v125,  (uint64_t)v124,  (uint64_t)@"combinedScanChannelCount6GHz",  v126);

  uint64_t v127 = (void *)MEMORY[0x189607968];
  uint64_t v132 = objc_msgSend_scanChannelCount(self, v128, v129, v130, v131);
  objc_msgSend_numberWithUnsignedInteger_(v127, v133, v132, v134, v135);
  uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v137, (uint64_t)v136, (uint64_t)@"scanChannelCount", v138);

  uint64_t v139 = (void *)MEMORY[0x189607968];
  uint64_t v144 = objc_msgSend_scanChannelCount2GHz(self, v140, v141, v142, v143);
  objc_msgSend_numberWithUnsignedInteger_(v139, v145, v144, v146, v147);
  uint64_t v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v149, (uint64_t)v148, (uint64_t)@"scanChannelCount2GHz", v150);

  uint64_t v151 = (void *)MEMORY[0x189607968];
  uint64_t v156 = objc_msgSend_scanChannelCount5GHz(self, v152, v153, v154, v155);
  objc_msgSend_numberWithUnsignedInteger_(v151, v157, v156, v158, v159);
  uint64_t v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v161, (uint64_t)v160, (uint64_t)@"scanChannelCount5GHz", v162);

  uint64_t v163 = (void *)MEMORY[0x189607968];
  uint64_t v168 = objc_msgSend_scanChannelCount6GHz(self, v164, v165, v166, v167);
  objc_msgSend_numberWithUnsignedInteger_(v163, v169, v168, v170, v171);
  uint64_t v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v173, (uint64_t)v172, (uint64_t)@"scanChannelCount6GHz", v174);

  uint64_t v175 = (void *)MEMORY[0x189607968];
  uint64_t v180 = objc_msgSend_preAssocScanChannelCount(self, v176, v177, v178, v179);
  objc_msgSend_numberWithUnsignedInteger_(v175, v181, v180, v182, v183);
  uint64_t v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v185, (uint64_t)v184, (uint64_t)@"preAssocScanChannelCount", v186);

  uint64_t v187 = (void *)MEMORY[0x189607968];
  uint64_t v192 = objc_msgSend_preAssocScanChannelCount2GHz(self, v188, v189, v190, v191);
  objc_msgSend_numberWithUnsignedInteger_(v187, v193, v192, v194, v195);
  uint64_t v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v6,  v197,  (uint64_t)v196,  (uint64_t)@"preAssocScanChannelCount2GHz",  v198);

  uint64_t v199 = (void *)MEMORY[0x189607968];
  uint64_t v204 = objc_msgSend_preAssocScanChannelCount5GHz(self, v200, v201, v202, v203);
  objc_msgSend_numberWithUnsignedInteger_(v199, v205, v204, v206, v207);
  uint64_t v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v6,  v209,  (uint64_t)v208,  (uint64_t)@"preAssocScanChannelCount5GHz",  v210);

  uint64_t v211 = (void *)MEMORY[0x189607968];
  uint64_t v216 = objc_msgSend_preAssocScanChannelCount6GHz(self, v212, v213, v214, v215);
  objc_msgSend_numberWithUnsignedInteger_(v211, v217, v216, v218, v219);
  uint64_t v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v6,  v221,  (uint64_t)v220,  (uint64_t)@"preAssocScanChannelCount6GHz",  v222);

  uint64_t v223 = (void *)MEMORY[0x189607968];
  uint64_t v228 = objc_msgSend_followup6GHzScanChannelCount(self, v224, v225, v226, v227);
  objc_msgSend_numberWithUnsignedInteger_(v223, v229, v228, v230, v231);
  uint64_t v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v6,  v233,  (uint64_t)v232,  (uint64_t)@"followup6GHzScanChannelCount",  v234);

  uint64_t v235 = (void *)MEMORY[0x189607968];
  uint64_t v240 = objc_msgSend_GASQueryCount(self, v236, v237, v238, v239);
  objc_msgSend_numberWithUnsignedInteger_(v235, v241, v240, v242, v243);
  uint64_t v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v245, (uint64_t)v244, (uint64_t)@"GASQueryCount", v246);

  uint64_t v247 = (void *)MEMORY[0x189607968];
  uint64_t v252 = objc_msgSend_autoHotspotCount(self, v248, v249, v250, v251);
  objc_msgSend_numberWithUnsignedInteger_(v247, v253, v252, v254, v255);
  uint64_t v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v257, (uint64_t)v256, (uint64_t)@"autoHotspotCount", v258);

  uint64_t v259 = (void *)MEMORY[0x189607968];
  uint64_t v264 = objc_msgSend_autoHotspotDidFindCandidateCount(self, v260, v261, v262, v263);
  objc_msgSend_numberWithUnsignedInteger_(v259, v265, v264, v266, v267);
  uint64_t v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v6,  v269,  (uint64_t)v268,  (uint64_t)@"autoHotspotDidFindCandidateCount",  v270);

  uint64_t v271 = (void *)MEMORY[0x189607968];
  uint64_t v276 = objc_msgSend_autoHotspotDidJoinCount(self, v272, v273, v274, v275);
  objc_msgSend_numberWithUnsignedInteger_(v271, v277, v276, v278, v279);
  uint64_t v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v281, (uint64_t)v280, (uint64_t)@"autoHotspotDidJoinCount", v282);

  uint64_t v283 = (void *)MEMORY[0x189607968];
  uint64_t v288 = objc_msgSend_autoHotspotAbortedCount(self, v284, v285, v286, v287);
  objc_msgSend_numberWithUnsignedInteger_(v283, v289, v288, v290, v291);
  uint64_t v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v293, (uint64_t)v292, (uint64_t)@"autoHotspotAbortedCount", v294);

  v299 = (void *)objc_msgSend_copy(v6, v295, v296, v297, v298);
  return (NSDictionary *)v299;
}

- (NSString)description
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startedAt(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1864535C8(v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v13, (uint64_t)@"startedAt=%@, ", v14, v15, v12);

  uint64_t v20 = objc_msgSend_autoJoinCount(self, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_autoJoinRetryCount(self, v21, v22, v23, v24);
  uint64_t CandidateCount = objc_msgSend_autoJoinDidFindCandidateCount(self, v26, v27, v28, v29);
  uint64_t v35 = objc_msgSend_autoJoinDidJoinCount(self, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_autoJoinAlreadyAssociatedCount(self, v36, v37, v38, v39);
  uint64_t v45 = objc_msgSend_autoJoinAbortedCount(self, v41, v42, v43, v44);
  objc_msgSend_appendFormat_( v6,  v46,  (uint64_t)@"autoJoin=[%lu (retry=%lu, candidate=%lu, join=%lu, already=%lu, abort=%lu)], ",  v47,  v48,  v20,  v25,  CandidateCount,  v35,  v40,  v45);
  uint64_t v53 = objc_msgSend_combinedScanChannelCount(self, v49, v50, v51, v52);
  uint64_t v58 = objc_msgSend_combinedScanChannelCount2GHz(self, v54, v55, v56, v57);
  uint64_t v63 = objc_msgSend_combinedScanChannelCount5GHz(self, v59, v60, v61, v62);
  uint64_t v68 = objc_msgSend_combinedScanChannelCount6GHz(self, v64, v65, v66, v67);
  objc_msgSend_appendFormat_( v6,  v69,  (uint64_t)@"combinedScan=[%lu (2GHz=%lu, 5GHz=%lu, 6GHz=%lu)], ",  v70,  v71,  v53,  v58,  v63,  v68);
  uint64_t v76 = objc_msgSend_scanChannelCount(self, v72, v73, v74, v75);
  uint64_t v81 = objc_msgSend_scanChannelCount2GHz(self, v77, v78, v79, v80);
  uint64_t v86 = objc_msgSend_scanChannelCount5GHz(self, v82, v83, v84, v85);
  uint64_t v91 = objc_msgSend_scanChannelCount6GHz(self, v87, v88, v89, v90);
  objc_msgSend_appendFormat_( v6,  v92,  (uint64_t)@"scan=[%lu (2GHz=%lu, 5GHz=%lu, 6GHz=%lu)], ",  v93,  v94,  v76,  v81,  v86,  v91);
  uint64_t v99 = objc_msgSend_preAssocScanChannelCount(self, v95, v96, v97, v98);
  uint64_t v104 = objc_msgSend_preAssocScanChannelCount2GHz(self, v100, v101, v102, v103);
  uint64_t v109 = objc_msgSend_preAssocScanChannelCount5GHz(self, v105, v106, v107, v108);
  uint64_t v114 = objc_msgSend_preAssocScanChannelCount6GHz(self, v110, v111, v112, v113);
  objc_msgSend_appendFormat_( v6,  v115,  (uint64_t)@"preAssocScan=[%lu (2GHz=%lu, 5GHz=%lu, 6GHz=%lu)], ",  v116,  v117,  v99,  v104,  v109,  v114);
  uint64_t v122 = objc_msgSend_followup6GHzScanChannelCount(self, v118, v119, v120, v121);
  objc_msgSend_appendFormat_(v6, v123, (uint64_t)@"followup6GHzScan=%lu, ", v124, v125, v122);
  uint64_t v130 = objc_msgSend_GASQueryCount(self, v126, v127, v128, v129);
  objc_msgSend_appendFormat_(v6, v131, (uint64_t)@"GAS=%lu, ", v132, v133, v130);
  uint64_t v138 = objc_msgSend_autoHotspotCount(self, v134, v135, v136, v137);
  uint64_t v143 = objc_msgSend_autoHotspotDidFindCandidateCount(self, v139, v140, v141, v142);
  uint64_t v148 = objc_msgSend_autoHotspotDidJoinCount(self, v144, v145, v146, v147);
  uint64_t v153 = objc_msgSend_autoHotspotAbortedCount(self, v149, v150, v151, v152);
  objc_msgSend_appendFormat_( v6,  v154,  (uint64_t)@"autoHotspot=[%lu (candidate=%lu, join=%lu, abort=%lu)], ",  v155,  v156,  v138,  v143,  v148,  v153);
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v157, v158, v159, v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autoJoinTriggerCounts(self, v162, v163, v164, v165);
  uint64_t v166 = (void *)objc_claimAutoreleasedReturnValue();
  v180[0] = MEMORY[0x1895F87A8];
  v180[1] = 3221225472LL;
  v180[2] = sub_18652C97C;
  v180[3] = &unk_189E5FB88;
  id v181 = v161;
  id v167 = v161;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v166, v168, (uint64_t)v180, v169, v170);

  objc_msgSend_appendFormat_(v6, v171, (uint64_t)@"triggers=(%@)", v172, v173, v167);
  uint64_t v178 = (void *)objc_msgSend_copy(v6, v174, v175, v176, v177);

  return (NSString *)v178;
}

- (BOOL)isEqualToAutoJoinStatistics:(id)a3
{
  id v7 = a3;
  startedAt = self->_startedAt;
  objc_msgSend_startedAt(v7, v9, v10, v11, v12);
  uint64_t v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (startedAt != v17)
  {
    if (!self->_startedAt
      || (objc_msgSend_startedAt(v7, v13, v14, v15, v16), (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v27 = 0;
      goto LABEL_40;
    }

    uint64_t v3 = (void *)v18;
    uint64_t v23 = self->_startedAt;
    objc_msgSend_startedAt(v7, v19, v20, v21, v22);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v23, v24, (uint64_t)v4, v25, v26))
    {
      BOOL v27 = 0;
LABEL_39:

      goto LABEL_40;
    }
  }

  autoJoinTriggerCounts = self->_autoJoinTriggerCounts;
  objc_msgSend_autoJoinTriggerCounts(v7, v13, v14, v15, v16);
  uint64_t v33 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  if (autoJoinTriggerCounts != v33)
  {
    if (!self->_autoJoinTriggerCounts) {
      goto LABEL_34;
    }
    uint64_t v34 = objc_msgSend_autoJoinTriggerCounts(v7, v29, v30, v31, v32);
    if (!v34)
    {
LABEL_33:

      BOOL v27 = 0;
      goto LABEL_38;
    }

    uint64_t v5 = (void *)v34;
    uint64_t v39 = self->_autoJoinTriggerCounts;
    uint64_t v40 = objc_msgSend_autoJoinTriggerCounts(v7, v35, v36, v37, v38);
    v41 = v39;
    uint64_t v42 = (void *)v40;
    if (!objc_msgSend_isEqual_(v41, v43, v40, v44, v45))
    {
      BOOL v27 = 0;
LABEL_36:

      goto LABEL_37;
    }

    uint64_t v133 = v42;
  }

  autoJoinDidFinduint64_t CandidateCount = self->_autoJoinDidFindCandidateCount;
  if (autoJoinDidFindCandidateCount == objc_msgSend_autoJoinDidFindCandidateCount(v7, v29, v30, v31, v32))
  {
    unint64_t autoJoinDidJoinCount = self->_autoJoinDidJoinCount;
    if (autoJoinDidJoinCount == objc_msgSend_autoJoinDidJoinCount(v7, v47, v48, v49, v50))
    {
      unint64_t autoJoinAlreadyAssociatedCount = self->_autoJoinAlreadyAssociatedCount;
      if (autoJoinAlreadyAssociatedCount == objc_msgSend_autoJoinAlreadyAssociatedCount(v7, v52, v53, v54, v55))
      {
        unint64_t autoJoinAbortedCount = self->_autoJoinAbortedCount;
        if (autoJoinAbortedCount == objc_msgSend_autoJoinAbortedCount(v7, v57, v58, v59, v60))
        {
          unint64_t scanChannelCount = self->_scanChannelCount;
          if (scanChannelCount == objc_msgSend_scanChannelCount(v7, v62, v63, v64, v65))
          {
            unint64_t scanChannelCount2GHz = self->_scanChannelCount2GHz;
            if (scanChannelCount2GHz == objc_msgSend_scanChannelCount2GHz(v7, v67, v68, v69, v70))
            {
              unint64_t scanChannelCount5GHz = self->_scanChannelCount5GHz;
              if (scanChannelCount5GHz == objc_msgSend_scanChannelCount5GHz(v7, v72, v73, v74, v75))
              {
                unint64_t scanChannelCount6GHz = self->_scanChannelCount6GHz;
                if (scanChannelCount6GHz == objc_msgSend_scanChannelCount6GHz(v7, v77, v78, v79, v80))
                {
                  unint64_t preAssocScanChannelCount = self->_preAssocScanChannelCount;
                  if (preAssocScanChannelCount == objc_msgSend_preAssocScanChannelCount(v7, v82, v83, v84, v85))
                  {
                    unint64_t preAssocScanChannelCount2GHz = self->_preAssocScanChannelCount2GHz;
                    if (preAssocScanChannelCount2GHz == objc_msgSend_preAssocScanChannelCount2GHz( v7,  v87,  v88,  v89,  v90))
                    {
                      unint64_t preAssocScanChannelCount5GHz = self->_preAssocScanChannelCount5GHz;
                      if (preAssocScanChannelCount5GHz == objc_msgSend_preAssocScanChannelCount5GHz( v7,  v92,  v93,  v94,  v95))
                      {
                        unint64_t preAssocScanChannelCount6GHz = self->_preAssocScanChannelCount6GHz;
                        if (preAssocScanChannelCount6GHz == objc_msgSend_preAssocScanChannelCount6GHz( v7,  v97,  v98,  v99,  v100))
                        {
                          unint64_t followup6GHzScanChannelCount = self->_followup6GHzScanChannelCount;
                          if (followup6GHzScanChannelCount == objc_msgSend_followup6GHzScanChannelCount( v7,  v102,  v103,  v104,  v105))
                          {
                            unint64_t GASQueryCount = self->_GASQueryCount;
                            if (GASQueryCount == objc_msgSend_GASQueryCount(v7, v107, v108, v109, v110))
                            {
                              unint64_t autoHotspotCount = self->_autoHotspotCount;
                              if (autoHotspotCount == objc_msgSend_autoHotspotCount(v7, v112, v113, v114, v115))
                              {
                                autoHotspotDidFinduint64_t CandidateCount = self->_autoHotspotDidFindCandidateCount;
                                if (autoHotspotDidFindCandidateCount == objc_msgSend_autoHotspotDidFindCandidateCount( v7,  v117,  v118,  v119,  v120))
                                {
                                  unint64_t autoHotspotDidJoinCount = self->_autoHotspotDidJoinCount;
                                  if (autoHotspotDidJoinCount == objc_msgSend_autoHotspotDidJoinCount( v7,  v122,  v123,  v124,  v125))
                                  {
                                    unint64_t autoHotspotAbortedCount = self->_autoHotspotAbortedCount;
                                    BOOL v27 = autoHotspotAbortedCount == objc_msgSend_autoHotspotAbortedCount( v7,  v127,  v128,  v129,  v130);
                                    uint64_t v42 = v133;
                                    if (autoJoinTriggerCounts == v33) {
                                      goto LABEL_37;
                                    }
                                    goto LABEL_36;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  if (autoJoinTriggerCounts != v33)
  {

    goto LABEL_33;
  }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFAutoJoinStatistics *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToAutoJoinStatistics = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAutoJoinStatistics = objc_msgSend_isEqualToAutoJoinStatistics_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToAutoJoinStatistics = 0;
  }

  return isEqualToAutoJoinStatistics;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_startedAt, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_autoJoinTriggerCounts, v7, v8, v9, v10);
  int8x16_t v12 = veorq_s8( veorq_s8( veorq_s8( *(int8x16_t *)&self->_autoJoinAlreadyAssociatedCount,  *(int8x16_t *)&self->_preAssocScanChannelCount),  veorq_s8(*(int8x16_t *)&self->_scanChannelCount, *(int8x16_t *)&self->_followup6GHzScanChannelCount)),  veorq_s8( veorq_s8(*(int8x16_t *)&self->_autoJoinDidJoinCount, *(int8x16_t *)&self->_preAssocScanChannelCount5GHz),  veorq_s8(*(int8x16_t *)&self->_scanChannelCount5GHz, *(int8x16_t *)&self->_autoHotspotCount)));
  return *(void *)&veor_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)) ^ self->_autoHotspotDidJoinCount ^ self->_autoHotspotAbortedCount ^ v11 ^ v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinStatistics, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setStartedAt_(v11, v12, (uint64_t)self->_startedAt, v13, v14);
  uint64_t v19 = (void *)objc_msgSend_mutableCopy(self->_autoJoinTriggerCounts, v15, v16, v17, v18);
  objc_msgSend_setAutoJoinTriggerCounts_(v11, v20, (uint64_t)v19, v21, v22);

  objc_msgSend_setAutoJoinDidFindCandidateCount_(v11, v23, self->_autoJoinDidFindCandidateCount, v24, v25);
  objc_msgSend_setAutoJoinDidJoinCount_(v11, v26, self->_autoJoinDidJoinCount, v27, v28);
  objc_msgSend_setAutoJoinAlreadyAssociatedCount_(v11, v29, self->_autoJoinAlreadyAssociatedCount, v30, v31);
  objc_msgSend_setAutoJoinAbortedCount_(v11, v32, self->_autoJoinAbortedCount, v33, v34);
  objc_msgSend_setScanChannelCount_(v11, v35, self->_scanChannelCount, v36, v37);
  objc_msgSend_setScanChannelCount2GHz_(v11, v38, self->_scanChannelCount2GHz, v39, v40);
  objc_msgSend_setScanChannelCount5GHz_(v11, v41, self->_scanChannelCount5GHz, v42, v43);
  objc_msgSend_setScanChannelCount6GHz_(v11, v44, self->_scanChannelCount6GHz, v45, v46);
  objc_msgSend_setPreAssocScanChannelCount_(v11, v47, self->_preAssocScanChannelCount, v48, v49);
  objc_msgSend_setPreAssocScanChannelCount2GHz_(v11, v50, self->_preAssocScanChannelCount2GHz, v51, v52);
  objc_msgSend_setPreAssocScanChannelCount5GHz_(v11, v53, self->_preAssocScanChannelCount5GHz, v54, v55);
  objc_msgSend_setPreAssocScanChannelCount6GHz_(v11, v56, self->_preAssocScanChannelCount6GHz, v57, v58);
  objc_msgSend_setFollowup6GHzScanChannelCount_(v11, v59, self->_followup6GHzScanChannelCount, v60, v61);
  objc_msgSend_setGASQueryCount_(v11, v62, self->_GASQueryCount, v63, v64);
  objc_msgSend_setAutoHotspotCount_(v11, v65, self->_autoHotspotCount, v66, v67);
  objc_msgSend_setAutoHotspotDidFindCandidateCount_(v11, v68, self->_autoHotspotDidFindCandidateCount, v69, v70);
  objc_msgSend_setAutoHotspotDidJoinCount_(v11, v71, self->_autoHotspotDidJoinCount, v72, v73);
  objc_msgSend_setAutoHotspotAbortedCount_(v11, v74, self->_autoHotspotAbortedCount, v75, v76);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  startedAt = self->_startedAt;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)startedAt, (uint64_t)@"_startedAt", v7);
  int8x16_t v12 = (void *)objc_msgSend_copy(self->_autoJoinTriggerCounts, v8, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)v12, (uint64_t)@"_autoJoinTriggerCounts", v14);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v15, self->_autoJoinDidFindCandidateCount, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)v18, (uint64_t)@"_autoJoinDidFindCandidateCount", v20);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v21, self->_autoJoinDidJoinCount, v22, v23);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)v24, (uint64_t)@"_autoJoinDidJoinCount", v26);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v27, self->_autoJoinAlreadyAssociatedCount, v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)v30, (uint64_t)@"_autoJoinAlreadyAssociatedCount", v32);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v33, self->_autoJoinAbortedCount, v34, v35);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v37, (uint64_t)v36, (uint64_t)@"_autoJoinAbortedCount", v38);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v39, self->_scanChannelCount, v40, v41);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v43, (uint64_t)v42, (uint64_t)@"_scanChannelCount", v44);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v45, self->_scanChannelCount2GHz, v46, v47);
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v49, (uint64_t)v48, (uint64_t)@"_scanChannelCount2GHz", v50);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v51, self->_scanChannelCount5GHz, v52, v53);
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v55, (uint64_t)v54, (uint64_t)@"_scanChannelCount5GHz", v56);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v57, self->_scanChannelCount6GHz, v58, v59);
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v61, (uint64_t)v60, (uint64_t)@"_scanChannelCount6GHz", v62);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v63, self->_preAssocScanChannelCount, v64, v65);
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v67, (uint64_t)v66, (uint64_t)@"_preAssocScanChannelCount", v68);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v69, self->_preAssocScanChannelCount2GHz, v70, v71);
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v73, (uint64_t)v72, (uint64_t)@"_preAssocScanChannelCount2GHz", v74);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v75, self->_preAssocScanChannelCount5GHz, v76, v77);
  uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v79, (uint64_t)v78, (uint64_t)@"_preAssocScanChannelCount5GHz", v80);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v81, self->_preAssocScanChannelCount6GHz, v82, v83);
  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v85, (uint64_t)v84, (uint64_t)@"_preAssocScanChannelCount6GHz", v86);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v87, self->_followup6GHzScanChannelCount, v88, v89);
  uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v91, (uint64_t)v90, (uint64_t)@"_followup6GHzScanChannelCount", v92);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v93, self->_GASQueryCount, v94, v95);
  uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v97, (uint64_t)v96, (uint64_t)@"_GASQueryCount", v98);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v99, self->_autoHotspotCount, v100, v101);
  uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v103, (uint64_t)v102, (uint64_t)@"_autoHotspotCount", v104);

  objc_msgSend_numberWithUnsignedInteger_( MEMORY[0x189607968],  v105,  self->_autoHotspotDidFindCandidateCount,  v106,  v107);
  uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v109, (uint64_t)v108, (uint64_t)@"_autoHotspotDidFindCandidateCount", v110);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v111, self->_autoHotspotDidJoinCount, v112, v113);
  uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v115, (uint64_t)v114, (uint64_t)@"_autoHotspotDidJoinCount", v116);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x189607968], v117, self->_autoHotspotAbortedCount, v118, v119);
  id v122 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v120, (uint64_t)v122, (uint64_t)@"_autoHotspotAbortedCount", v121);
}

- (CWFAutoJoinStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v172.receiver = self;
  v172.super_class = (Class)&OBJC_CLASS___CWFAutoJoinStatistics;
  id v5 = -[CWFAutoJoinStatistics init](&v172, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)@"_startedAt", v8);
    startedAt = v5->_startedAt;
    v5->_startedAt = (NSDate *)v9;

    uint64_t v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v14, v12, v15, v16, v13, 0);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v17, (uint64_t)@"_autoJoinTriggerCounts", v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = objc_msgSend_mutableCopy(v20, v21, v22, v23, v24);
    autoJoinTriggerCounts = v5->_autoJoinTriggerCounts;
    v5->_autoJoinTriggerCounts = (NSMutableDictionary *)v25;

    uint64_t v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, (uint64_t)@"_autoJoinDidFindCandidateCount", v29);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoJoinDidFinduint64_t CandidateCount = objc_msgSend_unsignedIntegerValue(v30, v31, v32, v33, v34);

    uint64_t v35 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, (uint64_t)@"_autoJoinDidJoinCount", v37);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t autoJoinDidJoinCount = objc_msgSend_unsignedIntegerValue(v38, v39, v40, v41, v42);

    uint64_t v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, (uint64_t)@"_autoJoinAlreadyAssociatedCount", v45);
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t autoJoinAlreadyAssociatedCount = objc_msgSend_unsignedIntegerValue(v46, v47, v48, v49, v50);

    uint64_t v51 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, (uint64_t)@"_autoJoinAbortedCount", v53);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t autoJoinAbortedCount = objc_msgSend_unsignedIntegerValue(v54, v55, v56, v57, v58);

    uint64_t v59 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, (uint64_t)@"_scanChannelCount", v61);
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t scanChannelCount = objc_msgSend_unsignedIntegerValue(v62, v63, v64, v65, v66);

    uint64_t v67 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v68, v67, (uint64_t)@"_scanChannelCount2GHz", v69);
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t scanChannelCount2GHz = objc_msgSend_unsignedIntegerValue(v70, v71, v72, v73, v74);

    uint64_t v75 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v76, v75, (uint64_t)@"_scanChannelCount5GHz", v77);
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t scanChannelCount5GHz = objc_msgSend_unsignedIntegerValue(v78, v79, v80, v81, v82);

    uint64_t v83 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v84, v83, (uint64_t)@"_scanChannelCount6GHz", v85);
    uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t scanChannelCount6GHz = objc_msgSend_unsignedIntegerValue(v86, v87, v88, v89, v90);

    uint64_t v91 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v92, v91, (uint64_t)@"_preAssocScanChannelCount", v93);
    uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t preAssocScanChannelCount = objc_msgSend_unsignedIntegerValue(v94, v95, v96, v97, v98);

    uint64_t v99 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v100, v99, (uint64_t)@"_preAssocScanChannelCount2GHz", v101);
    uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t preAssocScanChannelCount2GHz = objc_msgSend_unsignedIntegerValue(v102, v103, v104, v105, v106);

    uint64_t v107 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v108, v107, (uint64_t)@"_preAssocScanChannelCount5GHz", v109);
    uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t preAssocScanChannelCount5GHz = objc_msgSend_unsignedIntegerValue(v110, v111, v112, v113, v114);

    uint64_t v115 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v116, v115, (uint64_t)@"_preAssocScanChannelCount6GHz", v117);
    uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t preAssocScanChannelCount6GHz = objc_msgSend_unsignedIntegerValue(v118, v119, v120, v121, v122);

    uint64_t v123 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v124, v123, (uint64_t)@"_followup6GHzScanChannelCount", v125);
    uint64_t v126 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t followup6GHzScanChannelCount = objc_msgSend_unsignedIntegerValue(v126, v127, v128, v129, v130);

    uint64_t v131 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v132, v131, (uint64_t)@"_GASQueryCount", v133);
    uint64_t v134 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t GASQueryCount = objc_msgSend_unsignedIntegerValue(v134, v135, v136, v137, v138);

    uint64_t v139 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v140, v139, (uint64_t)@"_autoHotspotCount", v141);
    uint64_t v142 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t autoHotspotCount = objc_msgSend_unsignedIntegerValue(v142, v143, v144, v145, v146);

    uint64_t v147 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v148, v147, (uint64_t)@"_autoHotspotDidFindCandidateCount", v149);
    uint64_t v150 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoHotspotDidFinduint64_t CandidateCount = objc_msgSend_unsignedIntegerValue(v150, v151, v152, v153, v154);

    uint64_t v155 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v156, v155, (uint64_t)@"_autoHotspotDidJoinCount", v157);
    uint64_t v158 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t autoHotspotDidJoinCount = objc_msgSend_unsignedIntegerValue(v158, v159, v160, v161, v162);

    uint64_t v163 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v164, v163, (uint64_t)@"_autoHotspotAbortedCount", v165);
    uint64_t v166 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unint64_t autoHotspotAbortedCount = objc_msgSend_unsignedIntegerValue(v166, v167, v168, v169, v170);
  }

  return v5;
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
}

- (NSMutableDictionary)autoJoinTriggerCounts
{
  return self->_autoJoinTriggerCounts;
}

- (void)setAutoJoinTriggerCounts:(id)a3
{
}

- (unint64_t)autoJoinAlreadyAssociatedCount
{
  return self->_autoJoinAlreadyAssociatedCount;
}

- (void)setAutoJoinAlreadyAssociatedCount:(unint64_t)a3
{
  self->_unint64_t autoJoinAlreadyAssociatedCount = a3;
}

- (unint64_t)autoJoinDidFindCandidateCount
{
  return self->_autoJoinDidFindCandidateCount;
}

- (void)setAutoJoinDidFindCandidateCount:(unint64_t)a3
{
  self->_autoJoinDidFinduint64_t CandidateCount = a3;
}

- (unint64_t)autoJoinDidJoinCount
{
  return self->_autoJoinDidJoinCount;
}

- (void)setAutoJoinDidJoinCount:(unint64_t)a3
{
  self->_unint64_t autoJoinDidJoinCount = a3;
}

- (unint64_t)autoJoinAbortedCount
{
  return self->_autoJoinAbortedCount;
}

- (void)setAutoJoinAbortedCount:(unint64_t)a3
{
  self->_unint64_t autoJoinAbortedCount = a3;
}

- (unint64_t)scanChannelCount
{
  return self->_scanChannelCount;
}

- (void)setScanChannelCount:(unint64_t)a3
{
  self->_unint64_t scanChannelCount = a3;
}

- (unint64_t)scanChannelCount2GHz
{
  return self->_scanChannelCount2GHz;
}

- (void)setScanChannelCount2GHz:(unint64_t)a3
{
  self->_unint64_t scanChannelCount2GHz = a3;
}

- (unint64_t)scanChannelCount5GHz
{
  return self->_scanChannelCount5GHz;
}

- (void)setScanChannelCount5GHz:(unint64_t)a3
{
  self->_unint64_t scanChannelCount5GHz = a3;
}

- (unint64_t)scanChannelCount6GHz
{
  return self->_scanChannelCount6GHz;
}

- (void)setScanChannelCount6GHz:(unint64_t)a3
{
  self->_unint64_t scanChannelCount6GHz = a3;
}

- (unint64_t)preAssocScanChannelCount
{
  return self->_preAssocScanChannelCount;
}

- (void)setPreAssocScanChannelCount:(unint64_t)a3
{
  self->_unint64_t preAssocScanChannelCount = a3;
}

- (unint64_t)preAssocScanChannelCount2GHz
{
  return self->_preAssocScanChannelCount2GHz;
}

- (void)setPreAssocScanChannelCount2GHz:(unint64_t)a3
{
  self->_unint64_t preAssocScanChannelCount2GHz = a3;
}

- (unint64_t)preAssocScanChannelCount5GHz
{
  return self->_preAssocScanChannelCount5GHz;
}

- (void)setPreAssocScanChannelCount5GHz:(unint64_t)a3
{
  self->_unint64_t preAssocScanChannelCount5GHz = a3;
}

- (unint64_t)preAssocScanChannelCount6GHz
{
  return self->_preAssocScanChannelCount6GHz;
}

- (void)setPreAssocScanChannelCount6GHz:(unint64_t)a3
{
  self->_unint64_t preAssocScanChannelCount6GHz = a3;
}

- (unint64_t)followup6GHzScanChannelCount
{
  return self->_followup6GHzScanChannelCount;
}

- (void)setFollowup6GHzScanChannelCount:(unint64_t)a3
{
  self->_unint64_t followup6GHzScanChannelCount = a3;
}

- (unint64_t)GASQueryCount
{
  return self->_GASQueryCount;
}

- (void)setGASQueryCount:(unint64_t)a3
{
  self->_unint64_t GASQueryCount = a3;
}

- (unint64_t)autoHotspotCount
{
  return self->_autoHotspotCount;
}

- (void)setAutoHotspotCount:(unint64_t)a3
{
  self->_unint64_t autoHotspotCount = a3;
}

- (unint64_t)autoHotspotDidFindCandidateCount
{
  return self->_autoHotspotDidFindCandidateCount;
}

- (void)setAutoHotspotDidFindCandidateCount:(unint64_t)a3
{
  self->_autoHotspotDidFinduint64_t CandidateCount = a3;
}

- (unint64_t)autoHotspotDidJoinCount
{
  return self->_autoHotspotDidJoinCount;
}

- (void)setAutoHotspotDidJoinCount:(unint64_t)a3
{
  self->_unint64_t autoHotspotDidJoinCount = a3;
}

- (unint64_t)autoHotspotAbortedCount
{
  return self->_autoHotspotAbortedCount;
}

- (void)setAutoHotspotAbortedCount:(unint64_t)a3
{
  self->_unint64_t autoHotspotAbortedCount = a3;
}

- (void).cxx_destruct
{
}

@end