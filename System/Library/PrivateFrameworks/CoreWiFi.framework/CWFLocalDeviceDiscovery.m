@interface CWFLocalDeviceDiscovery
- (BOOL)_filterName:(id)a3 forLexicon:(_LXLexicon *)a4;
- (CWFLocalDeviceDiscovery)init;
- (NSCharacterSet)tokenizationCharacterSet;
- (NSDictionary)filteredNames;
- (OS_dispatch_queue)mrcQueue;
- (OS_mrc_cached_local_records_inquiry)mrcInquiry;
- (id)_combineDevicesWithDifferentSourceAddresses:(id)a3;
- (id)_tokenizeStringForSpecialCharacters:(id)a3;
- (id)handler;
- (void)_callHandlerWithValidResults:(id)a3 filtered:(id)a4;
- (void)_processMRCRecord:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)processRecords:(id)a3;
- (void)setHandler:(id)a3;
- (void)setMrcInquiry:(id)a3;
- (void)setMrcQueue:(id)a3;
- (void)setTokenizationCharacterSet:(id)a3;
@end

@implementation CWFLocalDeviceDiscovery

- (CWFLocalDeviceDiscovery)init
{
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___CWFLocalDeviceDiscovery;
  v2 = -[CWFLocalDeviceDiscovery init](&v53, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("CWFLocalNetworkDeviceDiscoveryQueue", v3);
    objc_msgSend_setMrcQueue_(v2, v5, (uint64_t)v4, v6, v7);

    objc_msgSend_currentLocale(MEMORY[0x189603F90], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localeIdentifier(v12, v13, v14, v15, v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    int hasPrefix = objc_msgSend_hasPrefix_(v17, v18, (uint64_t)@"en", v19, v20);
    char v22 = hasPrefix;
    if (hasPrefix) {
      v23 = v17;
    }
    else {
      v23 = @"en";
    }
    v24 = v23;
    v2->_lexiconEnglish = (_LXLexicon *)sub_1864942A8(v24);
    if ((v22 & 1) == 0) {
      v2->_lexiconUserLocale = (_LXLexicon *)sub_1864942A8(v17);
    }
    objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x189607930], v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_punctuationCharacterSet(MEMORY[0x189607810], v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formUnionWithCharacterSet_(v29, v35, (uint64_t)v34, v36, v37);

    objc_msgSend_symbolCharacterSet(MEMORY[0x189607810], v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formUnionWithCharacterSet_(v29, v43, (uint64_t)v42, v44, v45);

    uint64_t v50 = objc_msgSend_copy(v29, v46, v47, v48, v49);
    tokenizationCharacterSet = v2->_tokenizationCharacterSet;
    v2->_tokenizationCharacterSet = (NSCharacterSet *)v50;
  }

  return v2;
}

- (void)dealloc
{
  lexiconEnglish = self->_lexiconEnglish;
  if (lexiconEnglish) {
    CFRelease(lexiconEnglish);
  }
  lexiconUserLocale = self->_lexiconUserLocale;
  if (lexiconUserLocale) {
    CFRelease(lexiconUserLocale);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CWFLocalDeviceDiscovery;
  -[CWFLocalDeviceDiscovery dealloc](&v5, sel_dealloc);
}

- (void)activate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    CWFGetOSLog();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v4 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
    _os_log_send_and_compose_impl();
  }
}

- (void)invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CWFGetOSLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v5 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_setHandler_(self, v6, 0, v7, v8);
  if (self->_mrcInquiry)
  {
    mrc_cached_local_records_inquiry_invalidate();
    mrcInquiry = self->_mrcInquiry;
    self->_mrcInquiry = 0LL;
  }

- (void)processRecords:(id)a3
{
}

- (void)_callHandlerWithValidResults:(id)a3 filtered:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_handler(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = CWFGetOSLog();
  uint64_t v14 = (void *)v13;
  if (v12)
  {
    if (v13)
    {
      CWFGetOSLog();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v15 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v17 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "-[CWFLocalDeviceDiscovery _callHandlerWithValidResults:filtered:]";
      _os_log_send_and_compose_impl();
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_18649491C;
    block[3] = &unk_189E5BEB8;
    block[4] = self;
    id v20 = v6;
    id v21 = v7;
    dispatch_async(MEMORY[0x1895F8AE0], block);
  }

  else
  {
    if (v13)
    {
      CWFGetOSLog();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v16 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v18 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315138;
      v23 = "-[CWFLocalDeviceDiscovery _callHandlerWithValidResults:filtered:]";
      _os_log_send_and_compose_impl();
    }
  }
}

- (void)_processMRCRecord:(id)a3
{
  uint64_t v288 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend_set(MEMORY[0x189603FE0], v4, v5, v6, v7);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x189603FE0], v8, v9, v10, v11);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v275 = 0u;
  __int128 v276 = 0u;
  __int128 v277 = 0u;
  __int128 v278 = 0u;
  v258 = v3;
  objc_msgSend_allKeys(v3, v12, v13, v14, v15);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v275, (uint64_t)v287, 16);
  if (!v259) {
    goto LABEL_77;
  }
  uint64_t v257 = *(void *)v276;
  do
  {
    uint64_t v20 = 0LL;
    do
    {
      if (*(void *)v276 != v257) {
        objc_enumerationMutation(obj);
      }
      uint64_t v262 = v20;
      uint64_t v21 = *(void *)(*((void *)&v275 + 1) + 8 * v20);
      objc_msgSend_objectForKey_(v258, v17, v21, v18, v19, v253, v254);
      int v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set(MEMORY[0x189603FE0], v23, v24, v25, v26);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set(MEMORY[0x189603FE0], v27, v28, v29, v30);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = objc_alloc_init(&OBJC_CLASS___CWFLocalNetworkDevice);
      v260 = (void *)v21;
      objc_msgSend_setWithObject_(MEMORY[0x189604010], v33, v21, v34, v35);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      v261 = v32;
      objc_msgSend_setSourceAddresses_(v32, v37, (uint64_t)v36, v38, v39);

      __int128 v273 = 0u;
      __int128 v274 = 0u;
      __int128 v271 = 0u;
      __int128 v272 = 0u;
      id v266 = v22;
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v266, v40, (uint64_t)&v271, (uint64_t)v286, 16);
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v272;
        do
        {
          uint64_t v44 = 0LL;
          do
          {
            if (*(void *)v272 != v43) {
              objc_enumerationMutation(v266);
            }
            uint64_t v45 = *(CWFLocalNetworkDevice **)(*((void *)&v271 + 1) + 8 * v44);
            CWFGetOSLog();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              CWFGetOSLog();
              uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v47 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v48 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              int v280 = 136315394;
              v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
              __int16 v282 = 2112;
              v283 = v45;
              LODWORD(v254) = 22;
              v253 = &v280;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_serviceName(v45, v49, v50, v51, v52);
            objc_super v53 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v58 = objc_msgSend_length(v53, v54, v55, v56, v57);

            if (v58)
            {
              objc_msgSend_serviceName(v45, v59, v60, v61, v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v31, v64, (uint64_t)v63, v65, v66);
            }

            objc_msgSend_deviceName(v45, v59, v60, v61, v62, v253, v254);
            v67 = (CWFLocalNetworkDevice *)objc_claimAutoreleasedReturnValue();
            v72 = v67;
            if (v67 && objc_msgSend_length(v67, v68, v69, v70, v71))
            {
              objc_msgSend_rawString(v45, v73, v74, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              int v82 = objc_msgSend__stringContainsFilteredServiceName(v77, v78, v79, v80, v81);

              if (v82)
              {
                CWFGetOSLog();
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                if (v87)
                {
                  CWFGetOSLog();
                  v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  v88 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v101 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_rawString(v45, v102, v103, v104, v105);
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  int v280 = 136315650;
                  v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
                  __int16 v282 = 2112;
                  v283 = v72;
                  __int16 v284 = 2112;
                  v285 = v106;
                  LODWORD(v254) = 32;
                  v253 = &v280;
                  _os_log_send_and_compose_impl();
                }

                objc_msgSend_rawString(v45, v107, v108, v109, v110);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_filteredName_reason_( CWFLocalNetworkFilteredName,  v112,  (uint64_t)v111,  1,  v113,  v253,  v254);
LABEL_48:
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v265, v150, (uint64_t)v149, v151, v152);

                goto LABEL_49;
              }

              if (objc_msgSend__stringContainsGeneratedName(v72, v83, v84, v85, v86))
              {
                CWFGetOSLog();
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                if (v93)
                {
                  CWFGetOSLog();
                  v94 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  v94 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v125 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_rawString(v45, v126, v127, v128, v129);
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  int v280 = 136315650;
                  v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
                  __int16 v282 = 2112;
                  v283 = v72;
                  __int16 v284 = 2112;
                  v285 = v130;
                  LODWORD(v254) = 32;
                  v253 = &v280;
                  _os_log_send_and_compose_impl();
                }

                objc_msgSend_rawString(v45, v131, v132, v133, v134);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_filteredName_reason_( CWFLocalNetworkFilteredName,  v135,  (uint64_t)v111,  3,  v136,  v253,  v254);
                goto LABEL_48;
              }

              if (objc_msgSend__stringContainsUnwantedCharactersAtStartOrEnd(v72, v89, v90, v91, v92))
              {
                CWFGetOSLog();
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                if (v99)
                {
                  CWFGetOSLog();
                  v100 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  v100 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v137 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_rawString(v45, v138, v139, v140, v141);
                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                  int v280 = 136315650;
                  v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
                  __int16 v282 = 2112;
                  v283 = v72;
                  __int16 v284 = 2112;
                  v285 = v142;
                  LODWORD(v254) = 32;
                  v253 = &v280;
                  _os_log_send_and_compose_impl();
                }

                objc_msgSend_rawString(v45, v143, v144, v145, v146);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_filteredName_reason_( CWFLocalNetworkFilteredName,  v147,  (uint64_t)v111,  2,  v148,  v253,  v254);
                goto LABEL_48;
              }

              objc_msgSend__stringByRemovingUnwantedCharacters(v72, v95, v96, v97, v98);
              v114 = (CWFLocalNetworkDevice *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend_length(v114, v115, v116, v117, v118))
              {
                lexiconEnglish = self->_lexiconEnglish;
                if (!lexiconEnglish
                  || (objc_msgSend__filterName_forLexicon_(self, v119, (uint64_t)v114, (uint64_t)lexiconEnglish, v121) & 1) == 0
                  && ((lexiconEnglish = self->_lexiconUserLocale) == 0LL
                   || !objc_msgSend__filterName_forLexicon_( self,  v119,  (uint64_t)v114,  (uint64_t)lexiconEnglish,  v121)))
                {
                  objc_msgSend__stringByReplacingHyphensWithSpaces(v114, v119, v120, (uint64_t)lexiconEnglish, v121);
                  v72 = (CWFLocalNetworkDevice *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_addObject_(v263, v154, (uint64_t)v72, v155, v156);
                  goto LABEL_49;
                }

                CWFGetOSLog();
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                if (v123)
                {
                  CWFGetOSLog();
                  v124 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  v124 = (os_log_s *)MEMORY[0x1895F8DA0];
                  id v157 = MEMORY[0x1895F8DA0];
                }

                if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                {
                  int v280 = 136315394;
                  v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
                  __int16 v282 = 2112;
                  v283 = v114;
                  LODWORD(v254) = 22;
                  v253 = &v280;
                  _os_log_send_and_compose_impl();
                }

                objc_msgSend_rawString(v45, v158, v159, v160, v161);
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_filteredName_reason_( CWFLocalNetworkFilteredName,  v163,  (uint64_t)v162,  4,  v164);
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v265, v166, (uint64_t)v165, v167, v168);
              }

              v72 = v114;
            }

- (id)_combineDevicesWithDifferentSourceAddresses:(id)a3
{
  uint64_t v171 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (v7)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v3, v4, v5, v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v160 = 0u;
    __int128 v161 = 0u;
    __int128 v162 = 0u;
    __int128 v163 = 0u;
    id v143 = v7;
    id v9 = v7;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v160, (uint64_t)v170, 16);
    if (v11)
    {
      uint64_t v16 = v11;
      uint64_t v17 = *(void *)v161;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v161 != v17) {
            objc_enumerationMutation(v9);
          }
          uint64_t v19 = *(void **)(*((void *)&v160 + 1) + 8 * i);
          objc_msgSend_name(v19, v12, v13, v14, v15, v141, v142);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend_sanitizedName(v19, v21, v22, v23, v24);
            uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v8, v26, (uint64_t)v25, v27, v28);
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33) {
              objc_msgSend_objectForKey_(v8, v29, (uint64_t)v25, v31, v32);
            }
            else {
              objc_msgSend_set(MEMORY[0x189603FE0], v29, v30, v31, v32);
            }
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_addObject_(v35, v36, (uint64_t)v19, v37, v38);
            objc_msgSend_setObject_forKey_(v8, v39, (uint64_t)v35, (uint64_t)v25, v40);
          }

          else
          {
            CWFGetOSLog();
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              CWFGetOSLog();
              uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v25 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v41 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              int v166 = 136315394;
              uint64_t v167 = "-[CWFLocalDeviceDiscovery _combineDevicesWithDifferentSourceAddresses:]";
              __int16 v168 = 2112;
              uint64_t v169 = v19;
              LODWORD(v142) = 22;
              uint64_t v141 = &v166;
              _os_log_send_and_compose_impl();
            }
          }
        }

        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v160, (uint64_t)v170, 16);
      }

      while (v16);
    }

    objc_msgSend_set(MEMORY[0x189603FE0], v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v156 = 0u;
    __int128 v157 = 0u;
    __int128 v158 = 0u;
    __int128 v159 = 0u;
    objc_msgSend_allKeys(v8, v47, v48, v49, v50);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v156, (uint64_t)v165, 16);
    if (v52)
    {
      uint64_t v56 = v52;
      uint64_t v57 = *(void *)v157;
      uint64_t v145 = v46;
      uint64_t v146 = v8;
      uint64_t v144 = *(void *)v157;
      do
      {
        uint64_t v58 = 0LL;
        uint64_t v147 = v56;
        do
        {
          if (*(void *)v157 != v57) {
            objc_enumerationMutation(obj);
          }
          uint64_t v59 = *(void *)(*((void *)&v156 + 1) + 8 * v58);
          objc_msgSend_objectForKey_(v8, v53, v59, v54, v55, v141, v142);
          uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v60, v61, v62, v63, v64) == 1)
          {
            objc_msgSend_anyObject(v60, v65, v66, v67, v68);
            uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v46, v70, (uint64_t)v69, v71, v72);
          }

          else
          {
            uint64_t v149 = v59;
            uint64_t v151 = v58;
            objc_msgSend_set(MEMORY[0x189603FE0], v65, v66, v67, v68);
            uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_set(MEMORY[0x189603FE0], v73, v74, v75, v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            __int128 v152 = 0u;
            __int128 v153 = 0u;
            __int128 v154 = 0u;
            __int128 v155 = 0u;
            v150 = v60;
            id v78 = v60;
            uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v79, (uint64_t)&v152, (uint64_t)v164, 16);
            if (v80)
            {
              uint64_t v85 = v80;
              uint64_t v86 = *(void *)v153;
              do
              {
                for (uint64_t j = 0LL; j != v85; ++j)
                {
                  if (*(void *)v153 != v86) {
                    objc_enumerationMutation(v78);
                  }
                  v88 = *(void **)(*((void *)&v152 + 1) + 8 * j);
                  uint64_t v89 = objc_msgSend_serviceNames(v88, v81, v82, v83, v84);
                  if (v89)
                  {
                    v94 = (void *)v89;
                    objc_msgSend_serviceNames(v88, v90, v91, v92, v93);
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v100 = objc_msgSend_count(v95, v96, v97, v98, v99);

                    if (v100)
                    {
                      objc_msgSend_serviceNames(v88, v90, v91, v92, v93);
                      id v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_allObjects(v101, v102, v103, v104, v105);
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObjectsFromArray_(v69, v107, (uint64_t)v106, v108, v109);
                    }
                  }

                  uint64_t v110 = objc_msgSend_sourceAddresses(v88, v90, v91, v92, v93);
                  if (v110)
                  {
                    v111 = (void *)v110;
                    objc_msgSend_sourceAddresses(v88, v81, v82, v83, v84);
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v117 = objc_msgSend_count(v112, v113, v114, v115, v116);

                    if (v117)
                    {
                      objc_msgSend_sourceAddresses(v88, v81, v82, v83, v84);
                      uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_allObjects(v118, v119, v120, v121, v122);
                      v123 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObjectsFromArray_(v77, v124, (uint64_t)v123, v125, v126);
                    }
                  }
                }

                uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_( v78,  v81,  (uint64_t)&v152,  (uint64_t)v164,  16);
              }

              while (v85);
            }

            uint64_t v127 = objc_alloc_init(&OBJC_CLASS___CWFLocalNetworkDevice);
            objc_msgSend_setName_(v127, v128, v149, v129, v130);
            objc_msgSend_setServiceNames_(v127, v131, (uint64_t)v69, v132, v133);
            objc_msgSend_setSourceAddresses_(v127, v134, (uint64_t)v77, v135, v136);
            v46 = v145;
            objc_msgSend_addObject_(v145, v137, (uint64_t)v127, v138, v139);

            uint64_t v8 = v146;
            uint64_t v56 = v147;
            uint64_t v57 = v144;
            uint64_t v60 = v150;
            uint64_t v58 = v151;
          }

          ++v58;
        }

        while (v58 != v56);
        uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v156, (uint64_t)v165, 16);
      }

      while (v56);
    }

    id v7 = v143;
  }

  else
  {
    v46 = 0LL;
  }

  return v46;
}

- (BOOL)_filterName:(id)a3 forLexicon:(_LXLexicon *)a4
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (char *)a3;
  objc_msgSend__tokenizeStringForSpecialCharacters_(self, v7, (uint64_t)v6, v8, v9);
  uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
  CWFGetOSLog();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v12 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v13 = MEMORY[0x1895F8DA0];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v62 = 138412546;
    uint64_t v63 = v6;
    __int16 v64 = 2112;
    uint64_t v65 = v10;
    _os_log_send_and_compose_impl();
  }

  if (objc_msgSend_count(v10, v14, v15, v16, v17))
  {
    uint64_t v58 = 0LL;
    uint64_t v59 = &v58;
    uint64_t v60 = 0x2020000000LL;
    char v61 = 0;
    uint64_t v54 = 0LL;
    uint64_t v55 = &v54;
    uint64_t v56 = 0x2020000000LL;
    uint64_t v57 = 0LL;
    uint64_t v50 = 0LL;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x2020000000LL;
    uint64_t v53 = 0LL;
    v44[0] = MEMORY[0x1895F87A8];
    v44[1] = 3221225472LL;
    v44[2] = sub_186495F1C;
    v44[3] = &unk_189E5C8B0;
    uint64_t v49 = a4;
    uint64_t v18 = v6;
    uint64_t v45 = v18;
    v46 = &v58;
    uint64_t v47 = &v50;
    uint64_t v48 = &v54;
    objc_msgSend_enumerateObjectsUsingBlock_(v10, v19, (uint64_t)v44, v20, v21);
    if (*((_BYTE *)v59 + 24) || (unint64_t v26 = v55[3], v26 > 1) || v26 == objc_msgSend_count(v10, v22, v23, v24, v25))
    {
      CWFGetOSLog();
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        CWFGetOSLog();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v28 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v31 = MEMORY[0x1895F8DA0];
      }

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = *((unsigned __int8 *)v59 + 24);
        uint64_t v37 = v51[3];
        uint64_t v38 = v55[3];
        uint64_t v39 = objc_msgSend_count(v10, v32, v33, v34, v35);
        uint64_t v40 = @"NO";
        int v62 = 136316418;
        uint64_t v63 = "-[CWFLocalDeviceDiscovery _filterName:forLexicon:]";
        __int16 v64 = 2112;
        uint64_t v65 = v18;
        if (v38 == v39) {
          uint64_t v40 = @"YES";
        }
        __int16 v66 = 1024;
        int v67 = v36;
        __int16 v68 = 2048;
        uint64_t v69 = v37;
        __int16 v70 = 2048;
        uint64_t v71 = v38;
        __int16 v72 = 2112;
        v73 = v40;
        _os_log_send_and_compose_impl();
      }

      BOOL v41 = 1;
    }

    else
    {
      BOOL v41 = 0;
    }

    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
  }

  else
  {
    CWFGetOSLog();
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      CWFGetOSLog();
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v30 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v42 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v62 = 138412290;
      uint64_t v63 = v6;
      _os_log_send_and_compose_impl();
    }

    BOOL v41 = 1;
  }

  return v41;
}

- (id)_tokenizeStringForSpecialCharacters:(id)a3
{
  id v3 = a3;
  objc_msgSend_set(MEMORY[0x189603FE0], v4, v5, v6, v7);
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v3, v8, v9, v10, v11))
  {
    context = (void *)MEMORY[0x186E3AE7C]();
    unint64_t v58 = objc_msgSend_length(v3, v12, v13, v14, v15);
    unint64_t v19 = v58 - 2;
    if (v58 >= 2)
    {
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      do
      {
        uint64_t v22 = v20 + 1;
        uint64_t v23 = objc_msgSend_characterAtIndex_(v3, v16, v20 + 1, v17, v18);
        objc_msgSend_tokenizationCharacterSet(self, v24, v25, v26, v27);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = objc_msgSend_characterIsMember_(v28, v29, v23, v30, v31);

        if ((v19 == v20) | v23)
        {
          unint64_t v32 = v58;
          if (v19 != v20) {
            unint64_t v32 = v20 + 1;
          }
          objc_msgSend_substringWithRange_(v3, v16, v21, v32 - v21, v18);
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_tokenizationCharacterSet(self, v34, v35, v36, v37);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByTrimmingCharactersInSet_(v33, v39, (uint64_t)v38, v40, v41);
          id v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lowercaseString(v42, v43, v44, v45, v46);
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v22 = v21;
        }

        ++v20;
        uint64_t v21 = v22;
      }

      while (v58 - 1 != v20);
    }

    objc_autoreleasePoolPop(context);
  }

  return v57;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (OS_dispatch_queue)mrcQueue
{
  return self->_mrcQueue;
}

- (void)setMrcQueue:(id)a3
{
}

- (NSCharacterSet)tokenizationCharacterSet
{
  return self->_tokenizationCharacterSet;
}

- (void)setTokenizationCharacterSet:(id)a3
{
}

- (NSDictionary)filteredNames
{
  return self->_filteredNames;
}

- (OS_mrc_cached_local_records_inquiry)mrcInquiry
{
  return self->_mrcInquiry;
}

- (void)setMrcInquiry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end