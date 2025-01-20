@interface CWFKnownNetworkPreparer
- (BOOL)profilesContainsHomeProfile:(id)a3;
- (CWFKnownNetworkPreparer)initWithNetworkProfiles:(id)a3;
- (NSArray)profiles;
- (id)_filterForPrimaryHomeNetworkProfile:(id)a3;
- (id)_filterProfilesForHomeNetworksExceedingMaximumDistance:(id)a3;
- (id)_homeNetworkComparator;
- (id)_homeNetworkFilter;
- (id)_lastJoinedComparator;
- (id)_localNetworkFilter;
- (id)_networkProfileUsageComparator;
- (id)_removeProfilesAtSimilarLocations:(id)a3;
- (id)_similarLocationComparator;
- (id)localNetworkPromptProfiles;
- (id)prepareLocalNetworkProfilesForPresentation:(id)a3;
- (unint64_t)maxResults;
- (void)setMaxResults:(unint64_t)a3;
- (void)setProfiles:(id)a3;
@end

@implementation CWFKnownNetworkPreparer

- (CWFKnownNetworkPreparer)initWithNetworkProfiles:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___CWFKnownNetworkPreparer);
    objc_msgSend_setProfiles_(v5, v6, (uint64_t)v4, v7, v8);
    objc_msgSend_setMaxResults_(v5, v9, 4, v10, v11);
  }

  else
  {
    CWFGetOSLog();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      CWFGetOSLog();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v14 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v15 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      _os_log_send_and_compose_impl();
    }

    v5 = 0LL;
  }

  return v5;
}

- (id)localNetworkPromptProfiles
{
  uint64_t v136 = *MEMORY[0x1895F89C0];
  objc_msgSend_profiles(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__localNetworkFilter(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v6, v12, (uint64_t)v11, v13, v14);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  CWFGetOSLog();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    CWFGetOSLog();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v17 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v18 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v134 = 138412290;
    uint64_t v135 = (uint64_t)v15;
    int v122 = 12;
    v120 = &v134;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend__lastJoinedComparator(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v15, v24, (uint64_t)v23, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  CWFGetOSLog();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    CWFGetOSLog();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v29 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v30 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    int v134 = 138412290;
    uint64_t v135 = (uint64_t)v27;
    int v122 = 12;
    v120 = &v134;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_profiles(self, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = objc_msgSend__filterForPrimaryHomeNetworkProfile_(self, v36, (uint64_t)v35, v37, v38);

  v128 = v15;
  v126 = (void *)v39;
  if (v39)
  {
    if ((objc_msgSend_containsObject_(v27, v40, v39, v41, v42) & 1) == 0)
    {
      v47 = (void *)objc_msgSend_mutableCopy(v27, v43, v44, v45, v46);
      objc_msgSend_addObject_(v47, v48, v39, v49, v50);

      v27 = v47;
    }

    CWFGetOSLog();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      CWFGetOSLog();
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v52 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v53 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      int v134 = 138412290;
      uint64_t v135 = v39;
      int v122 = 12;
      v120 = &v134;
      _os_log_send_and_compose_impl();
    }
  }

  v127 = self;
  objc_msgSend__removeProfilesAtSimilarLocations_(self, v40, (uint64_t)v27, v41, v42, v120, v122);
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v27;
  objc_msgSend_differenceFromArray_(v124, v54, (uint64_t)v27, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v129, (uint64_t)v133, 16);
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v130;
    v62 = (void *)MEMORY[0x1895F8DA0];
    do
    {
      for (uint64_t i = 0LL; i != v60; ++i)
      {
        if (*(void *)v130 != v61) {
          objc_enumerationMutation(v57);
        }
        v64 = *(void **)(*((void *)&v129 + 1) + 8 * i);
        CWFGetOSLog();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (v65)
        {
          CWFGetOSLog();
          v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v67 = v62;
          v66 = (os_log_s *)v62;
        }

        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_object(v64, v68, v69, v70, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          int v134 = 138412290;
          uint64_t v135 = (uint64_t)v72;
          LODWORD(v123) = 12;
          v121 = &v134;
          _os_log_send_and_compose_impl();
        }
      }

      uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v73, (uint64_t)&v129, (uint64_t)v133, 16);
    }

    while (v60);
  }

  id v74 = v124;
  v79 = (void *)objc_msgSend_mutableCopy(v74, v75, v76, v77, v78);
  objc_msgSend_set(MEMORY[0x189603FE0], v80, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  for (unint64_t j = objc_msgSend_count(v84, v85, v86, v87, v88);
        j < objc_msgSend_maxResults(v127, v89, v90, v91, v92, v121, v123) && objc_msgSend_count(v79, v94, v95, v96, v97);
        unint64_t j = objc_msgSend_count(v84, v105, v106, v107, v108))
  {
    objc_msgSend_firstObject(v79, v94, v95, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v84, v99, (uint64_t)v98, v100, v101);

    objc_msgSend_removeObjectAtIndex_(v79, v102, 0, v103, v104);
  }

  objc_msgSend_allObjects(v84, v94, v95, v96, v97);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  CWFGetOSLog();
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    CWFGetOSLog();
    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v111 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v112 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
  {
    int v134 = 138412290;
    uint64_t v135 = (uint64_t)v109;
    _os_log_send_and_compose_impl();
  }

  if (objc_msgSend_count(v109, v113, v114, v115, v116)) {
    v117 = v109;
  }
  else {
    v117 = 0LL;
  }
  id v118 = v117;

  return v118;
}

- (id)prepareLocalNetworkProfilesForPresentation:(id)a3
{
  uint64_t v225 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4 && objc_msgSend_count(v4, v5, v6, v7, v8))
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v10, v11, v12, v13);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x189603FA8], v14, v15, v16, v17);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__presentationSortComparator(self, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v9, v23, (uint64_t)v22, v24, v25);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v30 = objc_msgSend__filterProfilesForHomeNetworksExceedingMaximumDistance_(self, v27, (uint64_t)v26, v28, v29);
    v210 = v9;
    v208 = (void *)v30;
    if (v30)
    {
      uint64_t v35 = v30;
      CWFGetOSLog();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        CWFGetOSLog();
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v37 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v39 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        int v220 = 138412290;
        uint64_t v221 = v35;
        int v206 = 12;
        v204 = &v220;
        _os_log_send_and_compose_impl();
      }

      uint64_t v44 = (void *)objc_msgSend_mutableCopy(v26, v40, v41, v42, v43);
      objc_msgSend_removeObjectsInArray_(v44, v45, v35, v46, v47);
      if ((unint64_t)objc_msgSend_count(v44, v48, v49, v50, v51) >= 3)
      {
        uint64_t v56 = objc_msgSend_count(v44, v52, v53, v54, v55) - 2;
        CWFGetOSLog();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          CWFGetOSLog();
          v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v58 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v59 = MEMORY[0x1895F8DA0];
        }

        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v226.location = 2LL;
          v226.length = v56;
          NSStringFromRange(v226);
          uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
          int v220 = 138412290;
          uint64_t v221 = (uint64_t)v60;
          int v206 = 12;
          v204 = &v220;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_removeObjectsInRange_(v44, v61, 2, v56, v62);
      }

      id v38 = v44;

      CWFGetOSLog();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63)
      {
        CWFGetOSLog();
        v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v64 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v65 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        int v220 = 138412290;
        uint64_t v221 = (uint64_t)v38;
        int v206 = 12;
        v204 = &v220;
        _os_log_send_and_compose_impl();
      }

      objc_msgSend_firstObject(v38, v66, v67, v68, v69, v204, v206);
    }

    else
    {
      id v38 = v26;
      objc_msgSend_firstObject(v26, v31, v32, v33, v34);
    }

    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__location(v70, v71, v72, v73, v74);
    v212 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v216 = 0u;
    __int128 v217 = 0u;
    __int128 v214 = 0u;
    __int128 v215 = 0u;
    obunint64_t j = v38;
    uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v75, (uint64_t)&v214, (uint64_t)v224, 16);
    if (v76)
    {
      uint64_t v81 = v76;
      uint64_t v82 = *(void *)v215;
      do
      {
        for (uint64_t i = 0LL; i != v81; ++i)
        {
          if (*(void *)v215 != v82) {
            objc_enumerationMutation(obj);
          }
          v84 = *(void **)(*((void *)&v214 + 1) + 8 * i);
          objc_msgSend_dictionary(MEMORY[0x189603FC8], v77, v78, v79, v80, v205, v207);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_networkName(v84, v86, v87, v88, v89);
          uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (v90)
          {
            objc_msgSend_networkName(v84, v91, v92, v93, v94);
            uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v85, v96, (uint64_t)v95, (uint64_t)@"mapLabelCalloutTitleKey", v97);

            objc_msgSend_discoveredDevices(v84, v98, v99, v100, v101);
            v102 = (void *)objc_claimAutoreleasedReturnValue();

            if (v102)
            {
              objc_msgSend_discoveredDevices(v84, v103, v104, v105, v106);
              uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v107, v108, (uint64_t)@"DevicesCount", v109, v110);
              v111 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              if (v111)
              {
                objc_msgSend_setObject_forKey_( v85,  v112,  (uint64_t)v111,  (uint64_t)@"mapLabelCalloutDeviceCountKey",  v113);
              }

              else
              {
                CWFGetOSLog();
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                if (v121)
                {
                  CWFGetOSLog();
                  int v122 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  int v122 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v125 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                {
                  int v220 = 138412290;
                  uint64_t v221 = (uint64_t)v84;
                  LODWORD(v207) = 12;
                  v205 = &v220;
                  _os_log_send_and_compose_impl();
                }
              }

              objc_msgSend_discoveredDevices(v84, v114, v115, v116, v117, v205, v207);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v126, v127, (uint64_t)@"DevicesNames", v128, v129);
              __int128 v130 = (void *)objc_claimAutoreleasedReturnValue();

              if (v130 && objc_msgSend__shouldDisplayDeviceNames(v84, v131, v132, v133, v134))
              {
                objc_msgSend__shuffled(v130, v135, v136, v137, v138);
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend__removeBackslashAndSpaceCharacter(v130, v140, v141, v142, v143);
                v144 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_setObject_forKey_( v85,  v145,  (uint64_t)v144,  (uint64_t)@"mapLabelCalloutDeviceNamesKey",  v146);
              }

              else
              {
                CWFGetOSLog();
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                if (v147)
                {
                  CWFGetOSLog();
                  v144 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  v144 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v148 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
                {
                  int v220 = 138412290;
                  uint64_t v221 = (uint64_t)v84;
                  LODWORD(v207) = 12;
                  v205 = &v220;
                  _os_log_send_and_compose_impl();
                }
              }
            }

            else
            {
              CWFGetOSLog();
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              if (v120)
              {
                CWFGetOSLog();
                v111 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                v111 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v124 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
              {
                int v220 = 138412290;
                uint64_t v221 = (uint64_t)v84;
                LODWORD(v207) = 12;
                v205 = &v220;
                _os_log_send_and_compose_impl();
              }
            }

            uint64_t v153 = objc_msgSend__location(v84, v149, v150, v151, v152);
            if (v153)
            {
              v119 = (void *)v153;
              objc_msgSend_distanceFromLocation_(v212, v154, v153, v155, v156);
              if (v161 >= 4000000.0)
              {
                double v188 = v161;
                CWFGetOSLog();
                v189 = (void *)objc_claimAutoreleasedReturnValue();
                if (v189)
                {
                  CWFGetOSLog();
                  v190 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  v190 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v192 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
                {
                  int v220 = 138412546;
                  uint64_t v221 = (uint64_t)v84;
                  __int16 v222 = 2048;
                  double v223 = v188;
                  LODWORD(v207) = 22;
                  v205 = &v220;
                  _os_log_send_and_compose_impl();
                }
              }

              else
              {
                v218[0] = @"mapLabelCalloutLatKey";
                v162 = (void *)MEMORY[0x189607968];
                objc_msgSend_coordinate(v119, v157, v158, v159, v160);
                objc_msgSend_numberWithDouble_(v162, v163, v164, v165, v166);
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                v218[1] = @"mapLabelCalloutLngKey";
                v219[0] = v167;
                v168 = (void *)MEMORY[0x189607968];
                objc_msgSend_coordinate(v119, v169, v170, v171, v172);
                objc_msgSend_numberWithDouble_(v168, v173, v174, v175, v176, v177);
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                v219[1] = v178;
                objc_msgSend_dictionaryWithObjects_forKeys_count_( MEMORY[0x189603F68],  v179,  (uint64_t)v219,  (uint64_t)v218,  2);
                v180 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_setObject_forKey_( v85,  v181,  (uint64_t)v180,  (uint64_t)@"mapLabelCalloutLocationKey",  v182);
                objc_msgSend_addObject_(v211, v183, (uint64_t)v85, v184, v185);
              }
            }

            else
            {
              CWFGetOSLog();
              v186 = (void *)objc_claimAutoreleasedReturnValue();
              if (v186)
              {
                CWFGetOSLog();
                v187 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                v187 = (os_log_s *)MEMORY[0x1895F8DA0];
                id v191 = MEMORY[0x1895F8DA0];
              }

              if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
              {
                int v220 = 138412290;
                uint64_t v221 = (uint64_t)v84;
                LODWORD(v207) = 12;
                v205 = &v220;
                _os_log_send_and_compose_impl();
              }

              v119 = 0LL;
            }
          }

          else
          {
            CWFGetOSLog();
            id v118 = (void *)objc_claimAutoreleasedReturnValue();
            if (v118)
            {
              CWFGetOSLog();
              v119 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v119 = (void *)MEMORY[0x1895F8DA0];
              id v123 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled((os_log_t)v119, OS_LOG_TYPE_INFO))
            {
              int v220 = 138412290;
              uint64_t v221 = (uint64_t)v84;
              LODWORD(v207) = 12;
              v205 = &v220;
              _os_log_send_and_compose_impl();
            }
          }
        }

        uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v214, (uint64_t)v224, 16);
      }

      while (v81);
    }

    v193 = obj;

    v194 = v209;
    v195 = v211;
    objc_msgSend_setObject_forKey_(v209, v196, (uint64_t)v211, (uint64_t)@"mapLabelArrayForCalloutsKey", v197);
    uint64_t v9 = v210;
    v198 = v208;
  }

  else
  {
    CWFGetOSLog();
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    if (v201)
    {
      CWFGetOSLog();
      v202 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v202 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v203 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
    {
      LOWORD(v220) = 0;
      _os_log_send_and_compose_impl();
    }

    v212 = 0LL;
    v198 = 0LL;
    v195 = 0LL;
    v194 = 0LL;
    v193 = 0LL;
  }

  id v199 = v194;

  return v199;
}

- (id)_filterProfilesForHomeNetworksExceedingMaximumDistance:(id)a3
{
  uint64_t v94 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend_array(MEMORY[0x189603FA8], v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x1895F87A8];
  v84[1] = 3221225472LL;
  v84[2] = sub_186492860;
  v84[3] = &unk_189E5C718;
  id v9 = v8;
  id v85 = v9;
  objc_msgSend_enumerateObjectsUsingBlock_(v3, v10, (uint64_t)v84, v11, v12);
  if (objc_msgSend_count(v9, v13, v14, v15, v16))
  {
    id v71 = v3;
    v75 = (void *)objc_msgSend_mutableCopy(v3, v17, v18, v19, v20);
    objc_msgSend_removeObjectsInArray_(v75, v21, (uint64_t)v9, v22, v23);
    objc_msgSend_array(MEMORY[0x189603FA8], v24, v25, v26, v27);
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id v70 = v9;
    obuint64_t j = v9;
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v80, (uint64_t)v93, 16);
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v74 = *(void *)v81;
      do
      {
        for (uint64_t i = 0LL; i != v30; ++i)
        {
          if (*(void *)v81 != v74) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          __int128 v79 = 0u;
          id v33 = v75;
          uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v76, (uint64_t)v92, 16);
          if (v35)
          {
            uint64_t v40 = v35;
            uint64_t v41 = *(void *)v77;
            while (2)
            {
              for (uint64_t j = 0LL; j != v40; ++j)
              {
                if (*(void *)v77 != v41) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v43 = *(void **)(*((void *)&v76 + 1) + 8 * j);
                objc_msgSend__location(v32, v36, v37, v38, v39, v68, v69);
                uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend__location(v43, v45, v46, v47, v48);
                uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_distanceFromLocation_(v44, v50, (uint64_t)v49, v51, v52);
                double v54 = v53;

                if (v54 >= 4000000.0)
                {
                  CWFGetOSLog();
                  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v55)
                  {
                    CWFGetOSLog();
                    uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  }

                  else
                  {
                    uint64_t v56 = (os_log_s *)MEMORY[0x1895F8DA0];
                    id v57 = MEMORY[0x1895F8DA0];
                  }

                  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                  {
                    int v86 = 138412802;
                    uint64_t v87 = v32;
                    __int16 v88 = 2112;
                    uint64_t v89 = v43;
                    __int16 v90 = 2048;
                    double v91 = v54;
                    LODWORD(v69) = 32;
                    uint64_t v68 = &v86;
                    _os_log_send_and_compose_impl();
                  }

                  objc_msgSend_addObject_(v73, v58, (uint64_t)v32, v59, v60);
                  goto LABEL_22;
                }
              }

              uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v76, (uint64_t)v92, 16);
              if (v40) {
                continue;
              }
              break;
            }
          }

- (BOOL)profilesContainsHomeProfile:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = a3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend__isHomeNetwork(*(void **)(*((void *)&v13 + 1) + 8 * i), v5, v6, v7, v8, (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }

      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }

- (id)_filterForPrimaryHomeNetworkProfile:(id)a3
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__homeNetworkFilter(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v6, v12, (uint64_t)v11, v13, v14);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = (void *)objc_msgSend_count(v15, v16, v17, v18, v19);
  if (v20)
  {
    objc_msgSend__networkProfileUsageComparator(self, v21, v22, v23, v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v15, v26, (uint64_t)v25, v27, v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_firstObject(v29, v30, v31, v32, v33);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v29 = 0LL;
  }

  id v34 = v20;

  return v34;
}

- (id)_removeProfilesAtSimilarLocations:(id)a3
{
  uint64_t v114 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (!qword_18C4A4378)
  {
    __int128 v112 = xmmword_189E5C828;
    uint64_t v113 = 0LL;
    qword_18C4A4378 = _sl_dlopen();
  }

  if (qword_18C4A4378)
  {
    objc_msgSend_array(MEMORY[0x189603FA8], v4, v5, v6, v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v10, v11, v12, v13);
    uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    __int128 v108 = 0u;
    id v91 = v8;
    id v14 = v8;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v105, (uint64_t)v111, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v106;
      id v93 = v14;
      uint64_t v94 = self;
      uint64_t v92 = *(void *)v106;
      do
      {
        uint64_t v22 = 0LL;
        uint64_t v95 = v20;
        do
        {
          if (*(void *)v106 != v21) {
            objc_enumerationMutation(v14);
          }
          uint64_t v23 = *(void **)(*((void *)&v105 + 1) + 8 * v22);
          if ((objc_msgSend_containsObject_(v9, v17, (uint64_t)v23, v18, v19) & 1) == 0)
          {
            objc_msgSend_array(MEMORY[0x189603FA8], v17, v24, v18, v19);
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend__location(v23, v26, v27, v28, v29);
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              __int128 v103 = 0u;
              __int128 v104 = 0u;
              __int128 v101 = 0u;
              __int128 v102 = 0u;
              id v31 = v14;
              uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_( v31,  v32,  (uint64_t)&v101,  (uint64_t)v110,  16);
              if (v33)
              {
                uint64_t v37 = v33;
                uint64_t v38 = *(void *)v102;
                do
                {
                  for (uint64_t i = 0LL; i != v37; ++i)
                  {
                    if (*(void *)v102 != v38) {
                      objc_enumerationMutation(v31);
                    }
                    uint64_t v40 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                    if ((objc_msgSend_isEqual_(v40, v34, (uint64_t)v23, v35, v36) & 1) == 0
                      && (objc_msgSend_containsObject_(v9, v34, (uint64_t)v40, v35, v36) & 1) == 0)
                    {
                      objc_msgSend__location(v40, v34, v41, v35, v36);
                    }
                  }

                  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_( v31,  v34,  (uint64_t)&v101,  (uint64_t)v110,  16);
                }

                while (v37);
              }

              objc_msgSend_setObject_forKey_(v96, v42, (uint64_t)v25, (uint64_t)v23, v43);
              id v14 = v93;
              self = v94;
              uint64_t v21 = v92;
              uint64_t v20 = v95;
            }
          }

          ++v22;
        }

        while (v22 != v20);
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v105, (uint64_t)v111, 16);
      }

      while (v20);
    }

    objc_msgSend_array(MEMORY[0x189603FA8], v44, v45, v46, v47);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    objc_msgSend_allKeys(v96, v49, v50, v51, v52);
    double v53 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v97, (uint64_t)v109, 16);
    if (v55)
    {
      uint64_t v59 = v55;
      uint64_t v60 = *(void *)v98;
      do
      {
        for (uint64_t j = 0LL; j != v59; ++j)
        {
          if (*(void *)v98 != v60) {
            objc_enumerationMutation(v53);
          }
          uint64_t v62 = *(void *)(*((void *)&v97 + 1) + 8 * j);
          objc_msgSend_arrayWithObject_(MEMORY[0x189603FA8], v56, v62, v57, v58);
          uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v96, v64, v62, v65, v66);
          uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v63, v68, (uint64_t)v67, v69, v70);

          objc_msgSend__similarLocationComparator(self, v71, v72, v73, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_sortUsingComparator_(v63, v76, (uint64_t)v75, v77, v78);

          objc_msgSend_firstObject(v63, v79, v80, v81, v82);
          __int128 v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v48, v84, (uint64_t)v83, v85, v86);
        }

        uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v97, (uint64_t)v109, 16);
      }

      while (v59);
    }

    id v8 = v91;
  }

  else
  {
    CWFGetOSLog();
    uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      CWFGetOSLog();
      __int16 v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      __int16 v88 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v89 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v112) = 0;
      _os_log_send_and_compose_impl();
    }

    id v48 = v8;
  }

  return v48;
}

- (id)_homeNetworkFilter
{
  return (id)objc_msgSend_predicateWithBlock_(MEMORY[0x1896079C8], a2, (uint64_t)&unk_189E5C758, v2, v3);
}

- (id)_localNetworkFilter
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__dateByAddingDays_(v5, v6, -2, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = (void *)MEMORY[0x1896079C8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = sub_186492F64;
  v17[3] = &unk_189E5C780;
  id v18 = v9;
  id v11 = v9;
  objc_msgSend_predicateWithBlock_(v10, v12, (uint64_t)v17, v13, v14);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_similarLocationComparator
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = sub_1864930B8;
  v3[3] = &unk_189E5C7A8;
  v3[4] = self;
  return (id)MEMORY[0x186E3B038](v3, a2);
}

- (id)_lastJoinedComparator
{
  return &unk_189E5C7E8;
}

- (id)_networkProfileUsageComparator
{
  return &unk_189E5C808;
}

- (id)_homeNetworkComparator
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = sub_1864934D8;
  v3[3] = &unk_189E5C7A8;
  v3[4] = self;
  return (id)MEMORY[0x186E3B038](v3, a2);
}

- (unint64_t)maxResults
{
  return self->_maxResults;
}

- (void)setMaxResults:(unint64_t)a3
{
  self->_maxResults = a3;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end