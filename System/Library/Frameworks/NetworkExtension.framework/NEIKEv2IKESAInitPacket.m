@interface NEIKEv2IKESAInitPacket
+ (BOOL)encryptPayloads;
+ (id)copyTypeDescription;
+ (id)createIKESAInitResponse:(unint64_t)a3 errorCode:(void *)a4 errorData:;
+ (os_log_s)createIKESAInitForInitiatorIKESA:(uint64_t)a1;
+ (unint64_t)exchangeType;
- (uint64_t)validateSAInitAsInitiator:(uint64_t)a1;
- (uint64_t)validateSAInitAsResponder:(void *)a3 errorCodeToSend:;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2IKESAInitPacket

+ (os_log_s)createIKESAInitForInitiatorIKESA:(uint64_t)a1
{
  uint64_t v218 = *MEMORY[0x1895F89C0];
  v2 = a2;
  objc_opt_self();
  if (!v2)
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136315138;
    v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
    v80 = "%s called with null ikeSA";
    goto LABEL_40;
  }
  v4 = -[NEIKEv2IKESA preferredKEMProtocol](v2, v3);
  if (v4)
  {
    v6 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2IKESAInitPacket));
    if (v6)
    {
      id v7 = objc_getProperty(v2, v5, 280LL, 1);

      if (!v7) {
        goto LABEL_6;
      }
      id v9 = objc_getProperty(v2, v8, 280LL, 1);
      v10 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]( (uint64_t)&OBJC_CLASS___NEIKEv2NotifyPayload,  0x4006uLL,  v9);
      objc_setProperty_atomic(v6, v11, v10, 88LL);

      objc_getProperty(v6, v12, 88LL, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
LABEL_6:
        v14 = objc_alloc_init(&OBJC_CLASS___NEIKEv2IKESAPayload);
        objc_setProperty_atomic(v6, v15, v14, 96LL);

        id v17 = objc_getProperty(v2, v16, 80LL, 1);
        [v17 proposals];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_getProperty(v6, v19, 96LL, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v20;
        if (v20) {
          objc_setProperty_atomic(v20, v21, v18, 24LL);
        }

        objc_getProperty(v6, v23, 96LL, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        char v25 = -[NEIKEv2Payload isValid]((uint64_t)v24);

        if ((v25 & 1) != 0)
        {
          v26 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
          objc_setProperty_atomic(v6, v27, v26, 104LL);
          v29 = -[NEIKEv2IKESA preferredKEMProtocol](v2, v28);
          objc_getProperty(v6, v30, 104LL, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v31;
          if (v31) {
            objc_setProperty_atomic(v31, v32, v29, 24LL);
          }

          id v35 = objc_getProperty(v2, v34, 160LL, 1);
          v36 = v35;
          if (v35) {
            v37 = (void *)*((void *)v35 + 2);
          }
          else {
            v37 = 0LL;
          }
          id v38 = v37;
          objc_getProperty(v6, v39, 104LL, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v40;
          if (v40) {
            objc_setProperty_atomic(v40, v41, v38, 32LL);
          }

          objc_getProperty(v6, v43, 104LL, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          char v45 = -[NEIKEv2Payload isValid]((uint64_t)v44);

          if ((v45 & 1) != 0)
          {
            v46 = objc_alloc_init(&OBJC_CLASS___NEIKEv2NoncePayload);
            objc_setProperty_atomic(v6, v47, v46, 112LL);

            id v49 = objc_getProperty(v2, v48, 128LL, 1);
            objc_getProperty(v6, v50, 112LL, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v51;
            if (v51) {
              objc_setProperty_atomic(v51, v52, v49, 24LL);
            }

            objc_getProperty(v6, v54, 112LL, 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            char v56 = -[NEIKEv2Payload isValid]((uint64_t)v55);

            if ((v56 & 1) != 0)
            {
              id v58 = objc_getProperty(v2, v57, 80LL, 1);
              [v58 redirectedFromServer];
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              if (v59)
              {
                v61 = objc_alloc_init(&OBJC_CLASS___NEIKEv2NotifyPayload);
                v63 = v61;
                if (v61) {
                  v61->_notifyType = 16408LL;
                }
                id v64 = objc_getProperty(v2, v62, 80LL, 1);
                [v64 redirectedFromServer];
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v66 = [v65 addressFamily];

                id v68 = objc_getProperty(v2, v67, 80LL, 1);
                [v68 redirectedFromServer];
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = v69;
                if (v66 == 2)
                {
                  uint64_t v71 = [v69 address];

                  buf[0] = 1;
                  v207[0] = 4;
                  id v72 = objc_alloc_init(MEMORY[0x189603FB8]);
                  [v72 appendBytes:buf length:1];
                  [v72 appendBytes:v207 length:1];
                  uint64_t v73 = v71 + 4;
                  v74 = v72;
                  uint64_t v75 = 4LL;
                }

                else
                {
                  uint64_t v84 = [v69 addressFamily];

                  if (v84 != 30)
                  {
LABEL_50:
                    if (-[NEIKEv2Packet addNotifyPayload:](v6, v63))
                    {

                      goto LABEL_52;
                    }

                    ne_log_obj();
                    v117 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v117, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl( &dword_1876B1000,  v117,  OS_LOG_TYPE_FAULT,  "[packet addNotifyPayload:redirectFromPayload] failed",  buf,  2u);
                    }

                    goto LABEL_63;
                  }

                  id v86 = objc_getProperty(v2, v85, 80LL, 1);
                  [v86 redirectedFromServer];
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v88 = [v87 address];

                  buf[0] = 2;
                  v207[0] = 16;
                  id v72 = objc_alloc_init(MEMORY[0x189603FB8]);
                  [v72 appendBytes:buf length:1];
                  [v72 appendBytes:v207 length:1];
                  uint64_t v73 = v88 + 8;
                  v74 = v72;
                  uint64_t v75 = 16LL;
                }

                [v74 appendBytes:v73 length:v75];
                if (v63) {
                  objc_setProperty_atomic(v63, v89, v72, 32LL);
                }

                goto LABEL_50;
              }

              id v81 = objc_getProperty(v2, v60, 80LL, 1);
              int v82 = [v81 allowRedirect];

              if (!v82 || -[NEIKEv2Packet addNotification:data:](v6, 0x4016uLL, 0LL))
              {
LABEL_52:
                v90 = -[NEIKEv2IKESA initiatorSPI](v2, v83);
                v92 = -[NEIKEv2IKESA responderSPI](v2, v91);
                id v94 = objc_getProperty(v2, v93, 64LL, 1);
                v63 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v90,  v92,  v94);

                if (!-[NEIKEv2Packet addNotification:data:](v6, 0x4004uLL, v63))
                {
                  ne_log_obj();
                  v101 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl( &dword_1876B1000,  v101,  OS_LOG_TYPE_FAULT,  "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed",  buf,  2u);
                  }

                  v76 = 0LL;
                  goto LABEL_144;
                }
                v96 = -[NEIKEv2IKESA initiatorSPI](v2, v95);
                v98 = -[NEIKEv2IKESA responderSPI](v2, v97);
                id v100 = objc_getProperty(v2, v99, 72LL, 1);
                v101 = (os_log_s *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v96,  v98,  v100);

                if (-[NEIKEv2Packet addNotification:data:](v6, 0x4005uLL, v101))
                {
                  if (-[NEIKEv2Packet addNotification:data:](v6, 0x402EuLL, 0LL))
                  {
                    id v103 = objc_getProperty(v2, v102, 88LL, 1);
                    [v103 authenticationProtocol];
                    v104 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v104)
                    {
                      id v106 = objc_getProperty(v2, v105, 88LL, 1);
                      [v106 authenticationProtocol];
                      id v107 = (id)objc_claimAutoreleasedReturnValue();

                      id v109 = objc_getProperty(v2, v108, 80LL, 1);
                      [v109 extraSupportedSignatureHashes];
                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                      v111 = +[NEIKEv2Crypto copySignHashDataForSet:authentication:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v110,  v107);

                      if ([v107 isSecurePassword])
                      {
                        id v113 = objc_getProperty(v2, v112, 88LL, 1);
                        [v113 remoteAuthentication];
                        v114 = (void *)objc_claimAutoreleasedReturnValue();
                        char v115 = [v107 isEqual:v114];

                        if ((v115 & 1) != 0)
                        {
                          *(_WORD *)buf = bswap32([v107 securePasswordMethod]) >> 16;
                          v116 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:buf length:2];
                          if (-[NEIKEv2Packet addNotification:data:](v6, 0x4028uLL, v116))
                          {

                            goto LABEL_84;
                          }

                          ne_log_obj();
                          v184 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v184, OS_LOG_TYPE_FAULT))
                          {
                            *(_WORD *)v207 = 0;
                            _os_log_fault_impl( &dword_1876B1000,  v184,  OS_LOG_TYPE_FAULT,  "[packet addNotification:NEIKEv2NotifyTypeSecurePasswordMethods] failed",  v207,  2u);
                          }
                        }

                        else
                        {
                          ne_log_obj();
                          v116 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled((os_log_t)v116, OS_LOG_TYPE_FAULT))
                          {
LABEL_140:

                            goto LABEL_141;
                          }

                          v184 = (os_log_s *)objc_getProperty(v2, v183, 88LL, 1);
                          v185 = -[os_log_s remoteAuthentication](v184, "remoteAuthentication");
                          *(_DWORD *)buf = 138412546;
                          v215 = (const char *)v107;
                          __int16 v216 = 2112;
                          v217 = v185;
                          _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v116,  OS_LOG_TYPE_FAULT,  "Local authentication %@ is GSPM but doesn't match remote authentication %@",  buf,  0x16u);
                        }

                        goto LABEL_140;
                      }
                    }

                    else
                    {
                      v187 = v101;
                      id v107 = objc_alloc_init(MEMORY[0x189603FE0]);
                      __int128 v203 = 0u;
                      __int128 v204 = 0u;
                      __int128 v205 = 0u;
                      __int128 v206 = 0u;
                      id v121 = objc_getProperty(v2, v120, 80LL, 1);
                      [v121 proposals];
                      v122 = (void *)objc_claimAutoreleasedReturnValue();

                      uint64_t v123 = [v122 countByEnumeratingWithState:&v203 objects:v213 count:16];
                      if (v123)
                      {
                        uint64_t v124 = v123;
                        uint64_t v125 = *(void *)v204;
                        do
                        {
                          for (uint64_t i = 0LL; i != v124; ++i)
                          {
                            if (*(void *)v204 != v125) {
                              objc_enumerationMutation(v122);
                            }
                            v127 = *(void **)(*((void *)&v203 + 1) + 8 * i);
                            if (v127) {
                              v127 = (void *)v127[16];
                            }
                            v128 = v127;
                            [v107 addObject:v128];
                          }

                          uint64_t v124 = [v122 countByEnumeratingWithState:&v203 objects:v213 count:16];
                        }

                        while (v124);
                      }

                      id v130 = objc_getProperty(v2, v129, 80LL, 1);
                      [v130 extraSupportedSignatureHashes];
                      v131 = (void *)objc_claimAutoreleasedReturnValue();
                      v111 = +[NEIKEv2Crypto copySignHashDataForSet:authenticationSet:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v131,  v107);

                      v101 = v187;
                    }

+ (id)createIKESAInitResponse:(unint64_t)a3 errorCode:(void *)a4 errorData:
{
  id v6 = a2;
  id v7 = a4;
  objc_opt_self();
  v8 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)objc_alloc(&OBJC_CLASS___NEIKEv2IKESAInitPacket), v6);
  if (!v8)
  {
    ne_log_obj();
    SEL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2IKESAInitPacket alloc] initResponse:] failed",  buf,  2u);
    }

    id v9 = 0LL;
    goto LABEL_10;
  }

  id v9 = v8;
  if (!-[NEIKEv2Packet addNotification:data:](v8, a3, v7))
  {
    ne_log_obj();
    SEL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "[packet addNotification:data:] failed", v14, 2u);
    }

LABEL_10:
    v10 = 0LL;
    goto LABEL_11;
  }

  id v9 = v9;
  v10 = v9;
LABEL_11:

  return v10;
}

- (uint64_t)validateSAInitAsInitiator:(uint64_t)a1
{
  uint64_t v391 = *MEMORY[0x1895F89C0];
  v3 = a2;
  uint64_t v5 = (uint64_t)v3;
  if (!a1) {
    goto LABEL_49;
  }
  if (!v3)
  {
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int buf = 136315138;
      v384 = "-[NEIKEv2IKESAInitPacket(Exchange) validateSAInitAsInitiator:]";
      __int128 v196 = "%s called with null ikeSA";
LABEL_118:
      _os_log_fault_impl(&dword_1876B1000, v7, OS_LOG_TYPE_FAULT, v196, (uint8_t *)&buf, 0xCu);
    }

- (uint64_t)validateSAInitAsResponder:(void *)a3 errorCodeToSend:
{
  uint64_t v267 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a2;
  uint64_t v7 = (uint64_t)v5;
  if (v5 && (v5[9] & 1) != 0)
  {
    ne_log_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)int buf = 136315138;
      uint64_t v261 = "-[NEIKEv2IKESAInitPacket(Exchange) validateSAInitAsResponder:errorCodeToSend:]";
      _os_log_fault_impl(&dword_1876B1000, v10, OS_LOG_TYPE_FAULT, "%s called with null !ikeSA.isInitiator", buf, 0xCu);
    }
  }

  else
  {
    if (-[NEIKEv2Packet hasErrors](a1, v6))
    {
      __int128 v258 = 0u;
      __int128 v259 = 0u;
      __int128 v256 = 0u;
      __int128 v257 = 0u;
      if (a1) {
        id Property = objc_getProperty(a1, v8, 64LL, 1);
      }
      else {
        id Property = 0LL;
      }
      uint64_t v10 = (os_log_s *)Property;
      uint64_t v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v256,  v266,  16LL);
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v257;
        while (2)
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v257 != v13) {
              objc_enumerationMutation(v10);
            }
            SEL v15 = *(const __CFString **)(*((void *)&v256 + 1) + 8 * i);
            if (v15 && (unint64_t)(v15->length - 1) <= 0x3FFE)
            {
              id v103 = (__CFString *)-[NEIKEv2NotifyPayload copyError](v15);
              ne_log_obj();
              v104 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                id v130 = (char *)[a1 copyShortDescription];
                *(_DWORD *)int buf = 138412546;
                uint64_t v261 = v130;
                __int16 v262 = 2112;
                unint64_t v263 = (unint64_t)v103;
                _os_log_error_impl( &dword_1876B1000,  v104,  OS_LOG_TYPE_ERROR,  "%@ Responder init received notify error %@",  buf,  0x16u);
              }

              -[NEIKEv2IKESA setState:error:](v7, 3uLL, v103);
              goto LABEL_71;
            }
          }

          uint64_t v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v256,  v266,  16LL);
          if (v12) {
            continue;
          }
          break;
        }
      }
    }

    objc_getProperty(a1, v8, 32LL, 1);
    SEL v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 value];

    if (v17)
    {
      objc_getProperty(a1, v18, 32LL, 1);
      SEL v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2IKESA assignRemoteSPI:]((void *)v7, v19);

      objc_getProperty(a1, v20, 96LL, 1);
      SEL v21 = (void *)objc_claimAutoreleasedReturnValue();
      SEL v23 = v21;
      if (v21) {
        SEL v21 = objc_getProperty(v21, v22, 24LL, 1);
      }
      uint64_t v10 = v21;

      if (v7) {
        id v25 = objc_getProperty((id)v7, v24, 80LL, 1);
      }
      else {
        id v25 = 0LL;
      }
      id v26 = v25;
      [v26 proposals];
      SEL v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[os_log_s count](v10, "count"))
      {
        if (v7) {
          id v29 = objc_getProperty((id)v7, v28, 80LL, 1);
        }
        else {
          id v29 = 0LL;
        }
        id v30 = v29;
        v31 = +[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]( (uint64_t)NEIKEv2IKESAProposal,  v27,  v10,  [v30 preferInitiatorProposalOrder]);
        objc_setProperty_atomic((id)v7, v32, v31, 96LL);

        ne_log_obj();
        SEL v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          id v35 = (char *)[a1 copyShortDescription];
          if (v7) {
            id v36 = objc_getProperty((id)v7, v34, 96LL, 1);
          }
          else {
            id v36 = 0LL;
          }
          id v37 = v36;
          *(_DWORD *)int buf = 138412802;
          uint64_t v261 = v35;
          __int16 v262 = 2112;
          unint64_t v263 = (unint64_t)v37;
          __int16 v264 = 2112;
          uint64_t v265 = (uint64_t)v10;
          _os_log_impl(&dword_1876B1000, v33, OS_LOG_TYPE_INFO, "%@ Choosing SA proposal %@ from %@", buf, 0x20u);
        }

        if (v7) {
          id v39 = objc_getProperty((id)v7, v38, 96LL, 1);
        }
        else {
          id v39 = 0LL;
        }
        id v40 = v39;

        if (v40)
        {
          if (v7)
          {
            id v42 = objc_getProperty((id)v7, v41, 96LL, 1);
            uint64_t v44 = v42;
            if (v42) {
              id v42 = objc_getProperty(v42, v43, 120LL, 1);
            }
          }

          else
          {
            uint64_t v44 = 0LL;
            id v42 = 0LL;
          }

          id v45 = v42;

          if (v45 && (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4036) & 1) == 0)
          {
            ne_log_obj();
            id v235 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
            {
              v247 = (char *)[a1 copyShortDescription];
              if (v7) {
                id v248 = objc_getProperty((id)v7, v246, 96LL, 1);
              }
              else {
                id v248 = 0LL;
              }
              id v249 = v248;
              *(_DWORD *)int buf = 138412546;
              uint64_t v261 = v247;
              __int16 v262 = 2112;
              unint64_t v263 = (unint64_t)v249;
              _os_log_error_impl( &dword_1876B1000,  v235,  OS_LOG_TYPE_ERROR,  "%@ Chosen proposal requires IKE_INTERMEDIATE but peer does not support it %@",  buf,  0x16u);
            }

            if (v7) {
              id v237 = objc_getProperty((id)v7, v236, 96LL, 1);
            }
            else {
              id v237 = 0LL;
            }
            id v127 = v237;
            ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"Chosen proposal requires IKE_INTERMEDIATE but peer does not support it %@",  v238,  v239,  v240,  v241,  v242,  v243,  v244,  (uint64_t)v127);
            -[NEIKEv2IKESA setState:error:](v7, 3uLL, ErrorPeerInvalidSyntax);

            goto LABEL_90;
          }

          objc_getProperty(a1, v46, 104LL, 1);
          SEL v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            objc_getProperty(a1, v48, 104LL, 1);
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v51 = v49;
            if (v49) {
              uint64_t v49 = objc_getProperty(v49, v50, 24LL, 1);
            }
            id v52 = v49;

            if (v52)
            {
              objc_getProperty(a1, v53, 104LL, 1);
              uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
              char v56 = v54;
              if (v54) {
                uint64_t v54 = objc_getProperty(v54, v55, 32LL, 1);
              }
              id v57 = v54;

              if (v57)
              {
                objc_getProperty(a1, v58, 104LL, 1);
                uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v61 = v59;
                if (v59) {
                  uint64_t v59 = objc_getProperty(v59, v60, 24LL, 1);
                }
                id v62 = v59;
                uint64_t v64 = [v62 method];
                v255 = v27;
                if (v7) {
                  id v65 = objc_getProperty((id)v7, v63, 96LL, 1);
                }
                else {
                  id v65 = 0LL;
                }
                id v66 = v65;
                -[NEIKEv2IKESAProposal kemProtocol](v66, v67);
                uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v69 = [v68 method];

                if (v64 == v69)
                {
                  objc_getProperty(a1, v70, 104LL, 1);
                  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v73 = v71;
                  SEL v27 = v255;
                  if (v71) {
                    uint64_t v71 = objc_getProperty(v71, v72, 32LL, 1);
                  }
                  id v75 = v71;
                  if (v7) {
                    objc_setProperty_atomic((id)v7, v74, v75, 152LL);
                  }

                  objc_getProperty(a1, v76, 112LL, 1);
                  SEL v77 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v77)
                  {
                    objc_getProperty(a1, v78, 112LL, 1);
                    id v79 = (void *)objc_claimAutoreleasedReturnValue();
                    id v81 = v79;
                    if (v79) {
                      id v79 = objc_getProperty(v79, v80, 24LL, 1);
                    }
                    id v82 = v79;

                    if (v82)
                    {
                      if (v7) {
                        id v84 = objc_getProperty((id)v7, v83, 80LL, 1);
                      }
                      else {
                        id v84 = 0LL;
                      }
                      id v85 = v84;
                      int v86 = [v85 strictNonceSizeChecks];

                      if (v86)
                      {
                        objc_getProperty(a1, v87, 112LL, 1);
                        uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
                        v90 = v88;
                        if (v88) {
                          uint64_t v88 = objc_getProperty(v88, v89, 24LL, 1);
                        }
                        id v91 = v88;
                        unint64_t v92 = [v91 length];

                        if (v92 - 257 <= 0xFFFFFFFFFFFFFF0ELL)
                        {
                          ne_log_obj();
                          id v94 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                          {
                            v225 = (char *)[a1 copyShortDescription];
                            *(_DWORD *)int buf = 138412546;
                            uint64_t v261 = v225;
                            __int16 v262 = 2048;
                            unint64_t v263 = v92;
                            _os_log_error_impl( &dword_1876B1000,  v94,  OS_LOG_TYPE_ERROR,  "%@ NONCE data length %zu is out of bounds",  buf,  0x16u);
                          }

                          SEL v102 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"NONCE data length %zu is out of bounds",  v95,  v96,  v97,  v98,  v99,  v100,  v101,  v92);
                          goto LABEL_104;
                        }

                        if (v7) {
                          id v147 = objc_getProperty((id)v7, v93, 96LL, 1);
                        }
                        else {
                          id v147 = 0LL;
                        }
                        id v148 = v147;
                        v150 = -[NEIKEv2IKESAProposal prfProtocol](v148, v149);
                        unsigned int v151 = [v150 nonceSize];

                        if (v92 < v151)
                        {
                          ne_log_obj();
                          uint64_t v152 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                          {
                            SEL v230 = (char *)[a1 copyShortDescription];
                            if (v7) {
                              id v231 = objc_getProperty((id)v7, v229, 96LL, 1);
                            }
                            else {
                              id v231 = 0LL;
                            }
                            id v232 = v231;
                            v234 = -[NEIKEv2IKESAProposal prfProtocol](v232, v233);
                            *(_DWORD *)int buf = 138412802;
                            uint64_t v261 = v230;
                            __int16 v262 = 2048;
                            unint64_t v263 = v92;
                            __int16 v264 = 2112;
                            uint64_t v265 = (uint64_t)v234;
                            _os_log_error_impl( &dword_1876B1000,  v152,  OS_LOG_TYPE_ERROR,  "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@",  buf,  0x20u);
                          }

                          if (v7) {
                            id v154 = objc_getProperty((id)v7, v153, 96LL, 1);
                          }
                          else {
                            id v154 = 0LL;
                          }
                          id v144 = v154;
                          -[NEIKEv2IKESAProposal prfProtocol](v144, v155);
                          int v251 = (void *)objc_claimAutoreleasedReturnValue();
                          uint64_t v163 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax( @"NONCE data length %zu is shorter than the minimum for PRF protocol %@",  v156,  v157,  v158,  v159,  v160,  v161,  v162,  v92);
                          -[NEIKEv2IKESA setState:error:](v7, 3uLL, v163);

                          goto LABEL_105;
                        }
                      }

                      objc_getProperty(a1, v87, 112LL, 1);
                      uint64_t v164 = (void *)objc_claimAutoreleasedReturnValue();
                      uint64_t v166 = v164;
                      if (v164) {
                        uint64_t v164 = objc_getProperty(v164, v165, 24LL, 1);
                      }
                      id v167 = v164;
                      objc_setProperty_atomic((id)v7, v168, v167, 136LL);

                      uint64_t v169 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x402F);
                      v171 = v169;
                      if (v169)
                      {
                        id v172 = objc_getProperty(v169, v170, 32LL, 1);
                        SEL v173 = +[NEIKEv2Crypto copySignHashSetForData:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v172);
                        objc_storeStrong((id *)(v7 + 112), v173);
                      }

                      SEL v174 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4028);
                      id v175 = (void *)-[NEIKEv2IKESA selectSecurePasswordMethod:]((void *)v7, v174);
                      objc_storeStrong((id *)(v7 + 104), v175);

                      if (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x402E)
                        && (*(_BYTE *)(v7 + 13) & 1) == 0)
                      {
                        *(_BYTE *)(v7 + 10) = 1;
                        ne_log_obj();
                        v176 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
                        {
                          v226 = (char *)[a1 copyShortDescription];
                          *(_DWORD *)int buf = 138412290;
                          uint64_t v261 = v226;
                          _os_log_debug_impl( &dword_1876B1000,  v176,  OS_LOG_TYPE_DEBUG,  "%@ IKEv2 fragmentation supported",  buf,  0xCu);
                        }
                      }

                      if (!-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4033))
                      {
LABEL_130:
                        SEL v184 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4004);
                        id v185 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4005);
                        v187 = v185;
                        if (!v184 || !v185) {
                          goto LABEL_154;
                        }
                        v252 = v171;
                        char v254 = v174;
                        -[NEIKEv2IKESA initiatorSPI]((_BYTE *)v7, v186);
                        uint64_t v188 = (void *)objc_claimAutoreleasedReturnValue();
                        id v190 = objc_getProperty((id)v7, v189, 72LL, 1);
                        uint64_t v191 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v188,  0LL,  v190);

                        -[NEIKEv2IKESA initiatorSPI]((_BYTE *)v7, v192);
                        uint64_t v193 = (void *)objc_claimAutoreleasedReturnValue();
                        id v195 = objc_getProperty((id)v7, v194, 64LL, 1);
                        __int128 v196 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v193,  0LL,  v195);

                        id v198 = objc_getProperty(v184, v197, 32LL, 1);
                        id v253 = v191;
                        LOBYTE(v195) = [v191 isEqualToData:v198];

                        if ((v195 & 1) == 0)
                        {
                          *(_BYTE *)(v7 + 15) = 1;
                          ne_log_obj();
                          uint64_t v200 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v200, OS_LOG_TYPE_DEBUG))
                          {
                            v227 = (char *)[a1 copyShortDescription];
                            *(_DWORD *)int buf = 138412290;
                            uint64_t v261 = v227;
                            _os_log_debug_impl( &dword_1876B1000,  v200,  OS_LOG_TYPE_DEBUG,  "%@ Detected incoming NAT",  buf,  0xCu);
                          }
                        }

                        id v201 = objc_getProperty(v187, v199, 32LL, 1);
                        char v202 = [v196 isEqualToData:v201];

                        v171 = v252;
                        if ((v202 & 1) == 0)
                        {
                          *(_BYTE *)(v7 + 14) = 1;
                          ne_log_obj();
                          uint64_t v204 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v204, OS_LOG_TYPE_DEBUG))
                          {
                            v228 = (char *)[a1 copyShortDescription];
                            *(_DWORD *)int buf = 138412290;
                            uint64_t v261 = v228;
                            _os_log_debug_impl( &dword_1876B1000,  v204,  OS_LOG_TYPE_DEBUG,  "%@ Detected outgoing NAT",  buf,  0xCu);
                          }
                        }

                        id v205 = objc_getProperty((id)v7, v203, 80LL, 1);
                        if ([v205 disableSwitchToNATTPorts])
                        {
                        }

                        else
                        {
                          id v207 = objc_getProperty((id)v7, v206, 88LL, 1);
                          if ([v207 negotiateMOBIKE] & 1) != 0 || (*(_BYTE *)(v7 + 15))
                          {
                          }

                          else
                          {
                            char v208 = *(_BYTE *)(v7 + 14);

                            if ((v208 & 1) == 0) {
                              goto LABEL_153;
                            }
                          }

                          -[NEIKEv2IKESA switchToNATTraversalPorts](v7, v209);
                        }

- (void)gatherPayloads
{
  id newValue = objc_alloc_init(MEMORY[0x189603FA8]);
  if (self)
  {
    if (objc_getProperty(self, v3, 88LL, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v4, 88, 1));
    }
    if (objc_getProperty(self, v4, 96LL, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v5, 96, 1));
    }
    if (objc_getProperty(self, v5, 104LL, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v6, 104, 1));
    }
    if (objc_getProperty(self, v6, 112LL, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v7, 112, 1));
    }
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v7, 120, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v8, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v9, 56, 1));
    objc_setProperty_atomic(self, v10, newValue, 80LL);
  }

  else
  {
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
  }
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v39 = *MEMORY[0x1895F89C0];
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  if (self) {
    self = (NEIKEv2IKESAInitPacket *)objc_getProperty(self, a2, 80LL, 1);
  }
  v3 = self;
  uint64_t v4 = -[NEIKEv2IKESAInitPacket countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v31,  v38,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
    uint64_t v7 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v3);
        }
        SEL v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_18;
          }
          ptrdiff_t v12 = v6[736];
LABEL_17:
          objc_setProperty_atomic(v2, v11, v10, v12);
          goto LABEL_18;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_18;
          }
          ptrdiff_t v12 = v7[737];
          goto LABEL_17;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_18;
          }
          ptrdiff_t v12 = 112LL;
          goto LABEL_17;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v20, 120LL, 1))
            {
              objc_msgSend(objc_getProperty(v2, v21, 120, 1), "arrayByAddingObject:", v10);
              SEL v23 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            }

            id v36 = v10;
            objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v36, 1, (void)v31);
            SEL v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2)
            {
LABEL_40:
              ptrdiff_t v27 = 120LL;
              SEL v28 = v2;
              id v29 = v23;
              goto LABEL_43;
            }
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_18;
            }
            if (v2 && objc_getProperty(v2, v24, 56LL, 1))
            {
              objc_msgSend(objc_getProperty(v2, v25, 56, 1), "arrayByAddingObject:", v10);
              SEL v23 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v35 = v10;
              objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v35, 1, (void)v31);
              SEL v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v2) {
                goto LABEL_44;
              }
            }

            SEL v28 = v2;
            id v29 = v23;
            ptrdiff_t v27 = 56LL;
LABEL_43:
            objc_setProperty_atomic(v28, v22, v29, v27);
          }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"IKE_SA_INIT";
}

+ (unint64_t)exchangeType
{
  return 34LL;
}

+ (BOOL)encryptPayloads
{
  return 0;
}

@end