@interface NEIKEv2IKEAuthPacket
+ (id)copyTypeDescription;
+ (id)createIKEAuthResponse:(unint64_t)a3 refusalError:;
+ (id)prepareDeviceIdentityNotifyPayload:(void *)a3 IMEISV:(void *)a4 lastResponderPacket:;
+ (os_log_s)createIKEAuthForInitiatorIKESA:(void *)a3 childSA:;
+ (unint64_t)exchangeType;
- (uint64_t)validateAuthPart1AsInitiator:(int)a3 beforeEAP:;
- (uint64_t)validateAuthPayloadAsInitiator:(char)a3 beforeEAP:;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2IKEAuthPacket

+ (os_log_s)createIKEAuthForInitiatorIKESA:(void *)a3 childSA:
{
  uint64_t v297 = *MEMORY[0x1895F89C0];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (!v4)
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_153;
    }
    int buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    v102 = "%s called with null ikeSA";
    goto LABEL_43;
  }

  if (!v5 && (*((_BYTE *)v4 + 23) & 1) == 0)
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_153;
    }
    int buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    v102 = "%s called with null childSA";
    goto LABEL_43;
  }

  id v7 = objc_getProperty(v4, v6, 96LL, 1);

  if (!v7)
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
LABEL_153:
      v129 = 0LL;
      goto LABEL_154;
    }

    int buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    v102 = "%s called with null ikeSA.chosenProposal";
LABEL_43:
    _os_log_fault_impl(&dword_1876B1000, v9, OS_LOG_TYPE_FAULT, v102, (uint8_t *)&buf, 0xCu);
    goto LABEL_153;
  }

  v8 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2IKEAuthPacket));
  if (!v8)
  {
    ne_log_obj();
    v103 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl( &dword_1876B1000,  v103,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2IKEAuthPacket alloc] initOutbound:] failed",  (uint8_t *)&buf,  2u);
    }

    v9 = 0LL;
    goto LABEL_153;
  }

  v9 = v8;
  v10 = objc_alloc_init(&OBJC_CLASS___NEIKEv2InitiatorIdentifierPayload);
  objc_setProperty_atomic(v9, v11, v10, 96LL);

  v13 = -[NEIKEv2IKESA copyInitiatorIdentifier](v4, v12);
  objc_getProperty(v9, v14, 96LL, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  if (v15) {
    objc_setProperty_atomic(v15, v16, v13, 24LL);
  }

  uint64_t v19 = objc_getProperty(v9, v18, 96LL, 1);
  v20 = (void *)v19;
  if (v19) {
    objc_storeWeak((id *)(v19 + 32), v4);
  }

  objc_getProperty(v9, v21, 96LL, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  char v23 = -[NEIKEv2Payload isValid]((uint64_t)v22);

  if ((v23 & 1) == 0)
  {
    ne_log_obj();
    v100 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
    {
      int buf = 136315138;
      v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
      v101 = "%s called with null packet.idi.isValid";
      goto LABEL_150;
    }

- (uint64_t)validateAuthPayloadAsInitiator:(char)a3 beforeEAP:
{
  uint64_t v264 = *MEMORY[0x1895F89C0];
  v5 = a2;
  objc_getProperty(a1, v6, 128LL, 1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    ne_log_obj();
    SEL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      char v131 = (char *)[a1 copyShortDescription];
      *(_DWORD *)int buf = 138412290;
      uint32_t v259 = v131;
      _os_log_error_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_ERROR,  "%@ Authentication payload missing from IKE_AUTH",  buf,  0xCu);
    }

    v29 = @"Authentication payload missing from IKE_AUTH";
    goto LABEL_22;
  }

  uint64_t v9 = objc_getProperty(a1, v8, 128LL, 1);
  v10 = (void *)v9;
  if (v9) {
    SEL v11 = *(void **)(v9 + 24);
  }
  else {
    SEL v11 = 0LL;
  }
  id v12 = v11;

  if (!v12)
  {
    ne_log_obj();
    SEL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v151 = (char *)[a1 copyShortDescription];
      *(_DWORD *)int buf = 138412290;
      uint32_t v259 = v151;
      _os_log_error_impl( &dword_1876B1000,  v30,  OS_LOG_TYPE_ERROR,  "%@ Authentication protocol missing from AUTH payload",  buf,  0xCu);
    }

    v29 = @"Authentication protocol missing from AUTH payload";
    goto LABEL_22;
  }

  uint64_t v14 = objc_getProperty(a1, v13, 128LL, 1);
  v15 = (void *)v14;
  if (v14) {
    v16 = *(void **)(v14 + 32);
  }
  else {
    v16 = 0LL;
  }
  id v17 = v16;

  if (!v17)
  {
    ne_log_obj();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v153 = (char *)[a1 copyShortDescription];
      *(_DWORD *)int buf = 138412290;
      uint32_t v259 = v153;
      _os_log_error_impl( &dword_1876B1000,  v31,  OS_LOG_TYPE_ERROR,  "%@ Authentication data missing from AUTH payload",  buf,  0xCu);
    }

    v29 = @"Authentication data missing from AUTH payload";
    goto LABEL_22;
  }

  if (!v5)
  {
    uint64_t v19 = 0LL;
    char v20 = 1;
LABEL_28:
    uint64_t v37 = objc_getProperty(a1, v18, 128LL, 1);
    v38 = (void *)v37;
    if (v37) {
      char v39 = *(void **)(v37 + 24);
    }
    else {
      char v39 = 0LL;
    }
    id v40 = v39;

    if (v5) {
      id Property = objc_getProperty(v5, v41, 448LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v43 = Property;

    if (v43)
    {
      if ([v40 method] == 2)
      {
        if (!v5)
        {
LABEL_140:
          v56 = 0LL;
LABEL_141:
          ne_log_obj();
          v185 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
          {
            SEL v195 = (char *)[a1 copyShortDescription];
            *(_DWORD *)int buf = 138412290;
            uint32_t v259 = v195;
            _os_log_error_impl( &dword_1876B1000,  v185,  OS_LOG_TYPE_ERROR,  "%@ EAP authentication data could not be verified",  buf,  0xCu);
          }

          ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication( @"EAP authentication data could not be verified",  v186,  v187,  v188,  v189,  v190,  v191,  v192,  v245);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorAuthentication);

          goto LABEL_144;
        }

        id v46 = objc_getProperty(v5, v45, 448LL, 1);

        if (v46)
        {
          id v48 = objc_getProperty(v5, v47, 96LL, 1);

          if (v48)
          {
            char v50 = -[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:](v5, (const char *)v19);
            if (v50)
            {
              char v250 = v20;
              id v51 = objc_getProperty(v5, v49, 448LL, 1);
              -[NEIKEv2EAP sessionKey]((uint64_t)v51);
              SEL v52 = (void *)objc_claimAutoreleasedReturnValue();

              if (v52
                || (!(_DWORD)v19 ? (ptrdiff_t v54 = 248LL) : (ptrdiff_t v54 = 256LL),
                    objc_getProperty(v5, v53, v54, 1),
                    (SEL v52 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
              {
                SEL v55 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v5, v52, v50);
                if (v55)
                {
                  v56 = v55;

                  uint64_t v58 = objc_getProperty(a1, v57, 128LL, 1);
                  SEL v59 = (void *)v58;
                  int v60 = v19;
                  if (v58) {
                    char v61 = *(void **)(v58 + 32);
                  }
                  else {
                    char v61 = 0LL;
                  }
                  id v62 = v61;
                  BOOL v63 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v56,  v62);

                  if (v63)
                  {
                    ne_log_obj();
                    v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                    {
                      *(_WORD *)int buf = 0;
                      _os_log_debug_impl(&dword_1876B1000, v64, OS_LOG_TYPE_DEBUG, "Peer EAP MAC is valid", buf, 2u);
                    }

                    char v66 = v250;
                    goto LABEL_105;
                  }

                  goto LABEL_141;
                }

                ne_log_obj();
                v160 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v160, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)int buf = 0;
                  _os_log_fault_impl( &dword_1876B1000,  v160,  OS_LOG_TYPE_FAULT,  "createAuthenticationDataForSharedSecret failed",  buf,  2u);
                }

                goto LABEL_138;
              }

              ne_log_obj();
              SEL v52 = (void *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_FAULT))
              {
LABEL_138:

                goto LABEL_139;
              }

              *(_WORD *)int buf = 0;
              SEL v152 = "skPr failed";
            }

            else
            {
              ne_log_obj();
              SEL v52 = (void *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_FAULT)) {
                goto LABEL_138;
              }
              *(_WORD *)int buf = 0;
              SEL v152 = "createResponderSignedOctetsUsingPrimeKey: failed";
            }

            _os_log_fault_impl(&dword_1876B1000, (os_log_t)v52, OS_LOG_TYPE_FAULT, v152, buf, 2u);
            goto LABEL_138;
          }

          ne_log_obj();
          char v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)int buf = 136315138;
            uint32_t v259 = "-[NEIKEv2IKESA(Crypto) createResponderEAPAuthenticationDataUsingPrimeKey:]";
            id v130 = "%s called with null self.chosenProposal";
            goto LABEL_89;
          }
        }

        else
        {
          ne_log_obj();
          char v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)int buf = 136315138;
            uint32_t v259 = "-[NEIKEv2IKESA(Crypto) createResponderEAPAuthenticationDataUsingPrimeKey:]";
            id v130 = "%s called with null self.eapClient";
LABEL_89:
            _os_log_fault_impl(&dword_1876B1000, (os_log_t)v50, OS_LOG_TYPE_FAULT, v130, buf, 0xCu);
          }
        }

- (uint64_t)validateAuthPart1AsInitiator:(int)a3 beforeEAP:
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  v5 = a2;
  id v7 = v5;
  if (a1)
  {
    if (v5 && (v5[9] & 1) != 0)
    {
      id v8 = objc_getProperty(v5, v6, 96LL, 1);

      if (v8)
      {
        objc_getProperty((id)a1, v9, 104LL, 1);
        id Property = (void *)objc_claimAutoreleasedReturnValue();
        id v12 = Property;
        if (Property) {
          id Property = objc_getProperty(Property, v11, 24LL, 1);
        }
        id v13 = Property;
        objc_setProperty_atomic(v7, v14, v13, 504LL);
        v16 = -[NEIKEv2IKESA remoteAuthentication](v7, v15);
        uint64_t v17 = [v16 method];

        if (!v17)
        {
          a1 = 1LL;
          goto LABEL_20;
        }

        uint64_t v19 = objc_getProperty((id)a1, v18, 128LL, 1);
        char v20 = (void *)v19;
        if (v19) {
          SEL v21 = *(void **)(v19 + 24);
        }
        else {
          SEL v21 = 0LL;
        }
        id v22 = v21;

        -[NEIKEv2IKESA setRemoteAuthProtocolUsed:]((uint64_t)v7, v22);
        -[NEIKEv2IKESA remoteAuthentication](v7, v23);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        int v25 = [v24 isSecurePassword];

        if (!v25) {
          goto LABEL_34;
        }
        if (v22)
        {
          ne_log_obj();
          id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            char v50 = (char *)[(id)a1 copyShortDescription];
            -[NEIKEv2IKESA remoteAuthentication](v7, v51);
            SEL v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)int buf = 138412802;
            v56 = v50;
            __int16 v57 = 2112;
            id v58 = v22;
            __int16 v59 = 2112;
            int v60 = v52;
            _os_log_error_impl( &dword_1876B1000,  v40,  OS_LOG_TYPE_ERROR,  "%@ Initiator packet authentication method %@ is not compatible with GSPM configuration %@",  buf,  0x20u);
          }

          -[NEIKEv2IKESA remoteAuthentication](v7, v41);
          ptrdiff_t v54 = (void *)objc_claimAutoreleasedReturnValue();
          ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication( @"Initiator packet authentication method %@ is not compatible with GSPM configuration %@",  v42,  v43,  v44,  v45,  v46,  v47,  v48,  (uint64_t)v22);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, ErrorAuthentication);

          goto LABEL_17;
        }

        id v27 = objc_getProperty((id)a1, v26, 144LL, 1);

        if (!v27)
        {
          ne_log_obj();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            char v39 = (char *)[(id)a1 copyShortDescription];
            *(_DWORD *)int buf = 138412290;
            v56 = v39;
            _os_log_error_impl(&dword_1876B1000, v29, OS_LOG_TYPE_ERROR, "%@ Packet missing GSPM payload", buf, 0xCu);
          }

          uint64_t v37 = (void *)NEIKEv2CreateErrorAuthentication( @"Packet missing GSPM payload",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v53);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v7, 3uLL, v37);

          id v22 = 0LL;
        }

        else
        {
LABEL_34:
          if (!a3 || -[NEIKEv2IKEAuthPacket validateAuthPayloadAsInitiator:beforeEAP:]((void *)a1, v7, 1))
          {
            a1 = 1LL;
LABEL_18:

            goto LABEL_20;
          }
        }

+ (id)prepareDeviceIdentityNotifyPayload:(void *)a3 IMEISV:(void *)a4 lastResponderPacket:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_self();
  if (!v7 || [v7 length] != 16)
  {
    if (!v6) {
      goto LABEL_9;
    }
    if ([v6 length] != 15) {
      goto LABEL_9;
    }
    v20[0] = -1;
    id v12 = (void *)MEMORY[0x189603FB8];
    objc_msgSend(v6, "dataUsingEncoding:", 4, *(void *)v20);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 dataWithData:v13];
    SEL v14 = (void *)objc_claimAutoreleasedReturnValue();

    char v11 = 1;
    [v14 appendBytes:v20 length:1];
    id v15 = v14;
    v10 = (const char *)[v15 bytes];

    if (!v10) {
      goto LABEL_9;
    }
LABEL_8:
    int8x8x2_t v22 = vld2_s8(v10);
    *(_WORD *)char v20 = 2304;
    v20[2] = v11;
    *(int8x8_t *)&v20[3] = vsli_n_s8(v22.val[0], v22.val[1], 4uLL);
    v16 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v20 length:11];
    goto LABEL_12;
  }

  id v9 = [v7 dataUsingEncoding:4];
  v10 = (const char *)[v9 bytes];

  char v11 = 2;
  if (v10) {
    goto LABEL_8;
  }
LABEL_9:
  ne_log_obj();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = (void *)[v8 copyShortDescription];
    *(_DWORD *)char v20 = 138412290;
    *(void *)&v20[4] = v19;
    _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "%@ Could not find Device Identity (IMEI) data",  v20,  0xCu);
  }

  v16 = 0LL;
LABEL_12:

  return v16;
}

+ (id)createIKEAuthResponse:(unint64_t)a3 refusalError:
{
  id v4 = a2;
  objc_opt_self();
  v5 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)objc_alloc(&OBJC_CLASS___NEIKEv2IKEAuthPacket), v4);

  if (!v5)
  {
    ne_log_obj();
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT))
    {
LABEL_7:

      id v6 = 0LL;
      goto LABEL_8;
    }

    __int16 v12 = 0;
    id v8 = "[[NEIKEv2IKESAInitPacket alloc] initResponse:] failed";
    id v9 = (uint8_t *)&v12;
LABEL_10:
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v7, OS_LOG_TYPE_FAULT, v8, v9, 2u);
    goto LABEL_7;
  }

  if (!-[NEIKEv2Packet addNotification:data:](v5, a3, 0LL))
  {
    ne_log_obj();
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_7;
    }
    __int16 v11 = 0;
    id v8 = "[packet addNotification:refusalError] failed";
    id v9 = (uint8_t *)&v11;
    goto LABEL_10;
  }

  id v6 = v5;
LABEL_8:

  return v6;
}

- (void)gatherPayloads
{
  v2 = self;
  if (self) {
    self = (NEIKEv2IKEAuthPacket *)objc_getProperty(self, a2, 64LL, 1);
  }
  id v21 = (id)-[NEIKEv2IKEAuthPacket mutableCopy](self, "mutableCopy");
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  v5 = v3;
  if (v2)
  {
    if (objc_getProperty(v2, v4, 96LL, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v6, 96, 1));
    }
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v6, 112, 1));
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 0x4000LL, v21, v5);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16392LL, v21, v5);
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v7, 120, 1));
    if (objc_getProperty(v2, v8, 104LL, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v9, 104, 1));
    }
    if (objc_getProperty(v2, v9, 128LL, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v10, 128, 1));
    }
    if (objc_getProperty(v2, v10, 152LL, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v11, 152, 1));
    }
  }

  else
  {
    [v3 addObjectsFromArray:0];
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0LL, 0x4000LL, v21, v5);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0LL, 16392LL, v21, v5);
    [v5 addObjectsFromArray:0];
  }

  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16387LL, v21, v5);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16391LL, v21, v5);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16394LL, v21, v5);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16395LL, v21, v5);
  if (v2)
  {
    if (objc_getProperty(v2, v12, 136LL, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v13, 136, 1));
    }
    if (objc_getProperty(v2, v13, 144LL, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v14, 144, 1));
    }
    if (objc_getProperty(v2, v14, 88LL, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v15, 88, 1));
    }
    if (objc_getProperty(v2, v15, 160LL, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v16, 160, 1));
    }
    if (objc_getProperty(v2, v16, 168LL, 1)) {
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v17, 168, 1));
    }
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16386LL, v21, v5);
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v18, 176, 1));
    [v5 addObjectsFromArray:v21];
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v19, 56, 1));
    objc_setProperty_atomic(v2, v20, v5, 80LL);
  }

  else
  {
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0LL, 16386LL, v21, v5);
    [v5 addObjectsFromArray:0];
    [v5 addObjectsFromArray:v21];
    [v5 addObjectsFromArray:0];
  }
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v37 = *MEMORY[0x1895F89C0];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  if (self) {
    self = (NEIKEv2IKEAuthPacket *)objc_getProperty(self, a2, 80LL, 1);
  }
  id v3 = self;
  uint64_t v4 = -[NEIKEv2IKEAuthPacket countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v27,  v36,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        SEL v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 88LL;
LABEL_35:
          objc_setProperty_atomic(v2, v9, v8, v10);
          goto LABEL_36;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 96LL;
          goto LABEL_35;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 104LL;
          goto LABEL_35;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 128LL;
          goto LABEL_35;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 136LL;
          goto LABEL_35;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 144LL;
          goto LABEL_35;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 152LL;
          goto LABEL_35;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 160LL;
          goto LABEL_35;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_36;
          }
          ptrdiff_t v10 = 168LL;
          goto LABEL_35;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v2 && objc_getProperty(v2, v11, 112LL, 1))
          {
            objc_msgSend(objc_getProperty(v2, v12, 112, 1), "arrayByAddingObject:", v8);
            SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:
            ptrdiff_t v19 = 112LL;
            goto LABEL_66;
          }

          uint64_t v35 = v8;
          objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v35, 1, (void)v27);
          SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2) {
            goto LABEL_51;
          }
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v15, 120LL, 1))
            {
              objc_msgSend(objc_getProperty(v2, v16, 120, 1), "arrayByAddingObject:", v8);
              SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_57:
              ptrdiff_t v19 = 120LL;
              goto LABEL_66;
            }

            uint64_t v34 = v8;
            objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v34, 1, (void)v27);
            SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2) {
              goto LABEL_57;
            }
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v2 && objc_getProperty(v2, v17, 64LL, 1))
              {
                objc_msgSend(objc_getProperty(v2, v18, 64, 1), "arrayByAddingObject:", v8);
                SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_63:
                uint64_t v24 = v2;
                int v25 = v14;
                ptrdiff_t v19 = 64LL;
                goto LABEL_67;
              }

              uint64_t v33 = v8;
              objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v33, 1, (void)v27);
              SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v2) {
                goto LABEL_63;
              }
            }

            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_36;
                }
                if (v2 && objc_getProperty(v2, v22, 56LL, 1))
                {
                  objc_msgSend(objc_getProperty(v2, v23, 56, 1), "arrayByAddingObject:", v8);
                  SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  uint64_t v31 = v8;
                  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v31, 1, (void)v27);
                  SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v2) {
                    goto LABEL_68;
                  }
                }

                uint64_t v24 = v2;
                int v25 = v14;
                ptrdiff_t v19 = 56LL;
                goto LABEL_67;
              }

              if (v2 && objc_getProperty(v2, v20, 176LL, 1))
              {
                objc_msgSend(objc_getProperty(v2, v21, 176, 1), "arrayByAddingObject:", v8);
                SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_65:
                ptrdiff_t v19 = 176LL;
LABEL_66:
                uint64_t v24 = v2;
                int v25 = v14;
LABEL_67:
                objc_setProperty_atomic(v24, v13, v25, v19);
                goto LABEL_68;
              }

              uint64_t v32 = v8;
              objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v32, 1, (void)v27);
              SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v2) {
                goto LABEL_65;
              }
            }
          }
        }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"IKE_AUTH";
}

+ (unint64_t)exchangeType
{
  return 35LL;
}

@end