@interface NEIKEv2Helper
+ (NEIKEv2ChildSAProposal)createIKEv2ChildSAProposalFromProtocol:(void *)a3 saParameters:;
+ (NEIKEv2IKESAProposal)createIKESAProposalFromProtocol:(void *)a3 saParameters:(void *)a4 options:(unsigned int *)a5 nonceSize:;
+ (id)createRouteArrayFromTunnelConfig:(void *)a3 localTS:(void *)a4 remoteTS:(void *)a5 gatewayAddress:(int)a6 isIPv4:;
+ (uint64_t)getIdentifierType:(uint64_t)a1;
@end

@implementation NEIKEv2Helper

+ (uint64_t)getIdentifierType:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  if ([v2 rangeOfString:@".+@.+\\..+" options:1024] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v2 rangeOfString:@"^[1-2]?[0-9]{1,2}\\.[1-2]?[0-9]{1,2}\\.[1-2]?[0-9]{1,2}\\.[1-2]?[0-9]{1,2}$" options:1024] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v2 rangeOfString:@"^(:|(([0-9A-Fa-f]{1,4}):)){1,7}[0-9A-Fa-f]{1,4}$" options:1024] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v3 = 2LL;
      }
      else {
        uint64_t v3 = 5LL;
      }
    }

    else
    {
      uint64_t v3 = 1LL;
    }
  }

  else
  {
    uint64_t v3 = 3LL;
  }

  return v3;
}

+ (id)createRouteArrayFromTunnelConfig:(void *)a3 localTS:(void *)a4 remoteTS:(void *)a5 gatewayAddress:(int)a6 isIPv4:
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v55 = a3;
  id v60 = a4;
  id v63 = a5;
  objc_opt_self();
  id v62 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (!v10)
  {
    int v12 = 0;
    goto LABEL_16;
  }

  uint64_t v11 = v10;
  int v12 = 0;
  uint64_t v13 = *(void *)v71;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v71 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      if (a6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        v16 = objc_alloc(&OBJC_CLASS___NEIPv4Route);
        [v15 address];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 hostname];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 subnetMaskAddress];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 hostname];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[NEIPv4Route initWithDestinationAddress:subnetMask:]( v16,  "initWithDestinationAddress:subnetMask:",  v18,  v20);
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        v22 = objc_alloc(&OBJC_CLASS___NEIPv6Route);
        objc_msgSend(v15, "address", v55);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 hostname];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:", objc_msgSend(v15, "prefix"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[NEIPv6Route initWithDestinationAddress:networkPrefixLength:]( v22,  "initWithDestinationAddress:networkPrefixLength:",  v18,  v19);
      }

      -[NEIPv4Route setGatewayAddress:](v21, "setGatewayAddress:", v63);
      [v62 addObject:v21];
      ++v12;
    }

    uint64_t v11 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  }

  while (v11);
LABEL_16:

  if (a6) {
    uint64_t v23 = 7LL;
  }
  else {
    uint64_t v23 = 8LL;
  }
  v24 = @"::";
  if (a6)
  {
    v24 = @"0.0.0.0";
    v25 = @"255.255.255.255";
  }

  else
  {
    v25 = @"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff";
  }

  v57 = v24;
  v56 = v25;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v26 = v60;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    v59 = 0LL;
    v61 = 0LL;
    uint64_t v29 = *(void *)v67;
    uint64_t v58 = *(void *)v67;
LABEL_24:
    uint64_t v30 = 0LL;
    while (1)
    {
      if (*(void *)v67 != v29) {
        objc_enumerationMutation(v26);
      }
      v31 = *(void **)(*((void *)&v66 + 1) + 8 * v30);
      [v31 startAddress];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = [v32 hostname];
      if (v33)
      {
        v34 = (void *)v33;
        id v35 = v26;
        [v31 endAddress];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 hostname];
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          [v31 startAddress];
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          [v38 hostname];
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

          [v31 endAddress];
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          [v40 hostname];
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

          id v26 = v35;
          if (v39
            && v41
            && (-[__CFString isEqualToString:](v39, "isEqualToString:", v57)
             && -[__CFString isEqualToString:](v41, "isEqualToString:", v56)
             || -[__CFString isEqualToString:](v39, "isEqualToString:", v57, v55)
             && -[__CFString isEqualToString:](v41, "isEqualToString:", v57)))
          {
            if (!v12)
            {
              v52 = off_18A087D00;
              if (!a6) {
                v52 = off_18A087D10;
              }
              v53 = -[__objc2_class defaultRoute](*v52, "defaultRoute", v55);
              [v62 addObject:v53];

              v49 = v62;
              id v51 = v62;

              goto LABEL_59;
            }
          }

          else
          {
            uint64_t v42 = NEGetPrefixForAddressRangeStrings(v39, v41);
            if ((_DWORD)v42)
            {
              uint64_t v43 = v42;
              if (!a6)
              {
                v47 = objc_alloc(&OBJC_CLASS___NEIPv6Route);
                [MEMORY[0x189607968] numberWithInt:v43];
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = -[NEIPv6Route initWithDestinationAddress:networkPrefixLength:]( v47,  "initWithDestinationAddress:networkPrefixLength:",  v39,  v48);

                id v26 = v35;
                -[NEIPv6Route setGatewayAddress:](v45, "setGatewayAddress:", v63);
                [v62 addObject:v45];
                goto LABEL_47;
              }

              CFStringRef v44 = NECreateIPv4AddressMaskStringFromPrefix(v42);
              if (v44)
              {
                v45 = (NEIPv6Route *)v44;
                v46 = -[NEIPv4Route initWithDestinationAddress:subnetMask:]( objc_alloc(&OBJC_CLASS___NEIPv4Route),  "initWithDestinationAddress:subnetMask:",  v39,  v44);
                -[NEIPv4Route setGatewayAddress:](v46, "setGatewayAddress:", v63);
                [v62 addObject:v46];

LABEL_47:
                uint64_t v29 = v58;

                ++v12;
                v59 = v39;
                v61 = v41;
                goto LABEL_48;
              }
            }
          }

          v59 = v39;
          v61 = v41;
        }

        else
        {
          id v26 = v35;
        }

        uint64_t v29 = v58;
      }

      else
      {
      }

+ (NEIKEv2IKESAProposal)createIKESAProposalFromProtocol:(void *)a3 saParameters:(void *)a4 options:(unsigned int *)a5 nonceSize:
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_opt_self();
  if (v9)
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NEIKEv2IKESAProposal);
    -[NEIKEv2IKESAProposal setLifetimeSeconds:]( v11,  "setLifetimeSeconds:",  (int)(60 * [v9 lifetimeMinutes]));
    switch([v9 encryptionAlgorithm])
    {
      case 1LL:
        int v12 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v13 = 2LL;
        goto LABEL_6;
      case 2LL:
        int v12 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v13 = 3LL;
LABEL_6:
        v16 = (NEIKEv2EncryptionProtocol *)-[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:]( v12,  v13,  0);
        goto LABEL_9;
      case 3LL:
        v14 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v15 = 2LL;
        goto LABEL_8;
      case 5LL:
        v18 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v19 = 4LL;
        goto LABEL_13;
      case 6LL:
        v18 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v19 = 5LL;
        goto LABEL_13;
      case 7LL:
        v18 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v19 = 6LL;
LABEL_13:
        v16 = -[NEIKEv2EncryptionProtocol initWithEncryptionType:](v18, "initWithEncryptionType:", v19);
        int v17 = 0;
        break;
      default:
        v14 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v15 = 3LL;
LABEL_8:
        v16 = -[NEIKEv2EncryptionProtocol initWithEncryptionType:](v14, "initWithEncryptionType:", v15);
LABEL_9:
        int v17 = 1;
        break;
    }

    id v62 = v16;
    __int128 v72 = v16;
    [MEMORY[0x189603F18] arrayWithObjects:&v72 count:1];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2IKESAProposal setEncryptionProtocols:](v11, "setEncryptionProtocols:", v20);

    switch([v9 integrityAlgorithm])
    {
      case 1LL:
        uint64_t v21 = 2LL;
        if ((v17 & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v22 = 2LL;
        goto LABEL_25;
      case 2LL:
        uint64_t v21 = 2LL;
        if ((v17 & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v22 = 7LL;
        goto LABEL_25;
      case 4LL:
        uint64_t v21 = 6LL;
        if ((v17 & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v22 = 13LL;
        goto LABEL_25;
      case 5LL:
        uint64_t v21 = 7LL;
        if ((v17 & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v22 = 14LL;
        goto LABEL_25;
      default:
        uint64_t v21 = 5LL;
        if (v17)
        {
          uint64_t v22 = 12LL;
LABEL_25:
          uint64_t v23 = -[NEIKEv2IntegrityProtocol initWithType:]( objc_alloc(&OBJC_CLASS___NEIKEv2IntegrityProtocol),  "initWithType:",  v22);
        }

        else
        {
LABEL_26:
          uint64_t v23 = 0LL;
        }

        v24 = -[NEIKEv2PRFProtocol initWithType:](objc_alloc(&OBJC_CLASS___NEIKEv2PRFProtocol), "initWithType:", v21);
        __int128 v71 = v24;
        [MEMORY[0x189603F18] arrayWithObjects:&v71 count:1];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESAProposal setPrfProtocols:](v11, "setPrfProtocols:", v25);

        id v60 = v24;
        unsigned int v26 = -[NEIKEv2PRFProtocol nonceSize](v24, "nonceSize");
        if (v17)
        {
          __int128 v70 = v23;
          [MEMORY[0x189603F18] arrayWithObjects:&v70 count:1];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEIKEv2IKESAProposal setIntegrityProtocols:](v11, "setIntegrityProtocols:", v27);
        }

        v61 = v23;
        if (a5 && v26 > *a5) {
          *a5 = v26;
        }
        uint64_t v28 = -[NEIKEv2KEMProtocol initWithMethod:]( [NEIKEv2KEMProtocol alloc],  "initWithMethod:",  [v9 diffieHellmanGroup]);
        __int128 v69 = v28;
        [MEMORY[0x189603F18] arrayWithObjects:&v69 count:1];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESAProposal setKemProtocols:](v11, "setKemProtocols:", v29);

        objc_getProperty(v9, v30, 40LL, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v56 = v28;
          v57 = v11;
          id v59 = v8;
          id v32 = objc_alloc_init(MEMORY[0x189603FC8]);
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          __int128 v66 = 0u;
          id v58 = v9;
          objc_getProperty(v9, v33, 40LL, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v35 = [v34 countByEnumeratingWithState:&v63 objects:v68 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v64;
            uint64_t v38 = 6LL;
            do
            {
              for (uint64_t i = 0LL; i != v36; ++i)
              {
                if (*(void *)v64 != v37) {
                  objc_enumerationMutation(v34);
                }
                v40 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                if (objc_msgSend(v40, "integerValue", v56))
                {
                  v41 = -[NEIKEv2KEMProtocol initWithMethod:]( [NEIKEv2KEMProtocol alloc],  "initWithMethod:",  [v40 integerValue]);
                  __int128 v67 = v41;
                  [MEMORY[0x189603F18] arrayWithObjects:&v67 count:1];
                  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
                  [MEMORY[0x189607968] numberWithUnsignedInteger:v38 + i];
                  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
                  [v32 setObject:v42 forKeyedSubscript:v43];
                }
              }

              v38 += i;
              uint64_t v36 = [v34 countByEnumeratingWithState:&v63 objects:v68 count:16];
            }

            while (v36);
          }

          uint64_t v11 = v57;
          if ([v32 count])
          {
            CFStringRef v44 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v32];
            -[NEIKEv2IKESAProposal setAdditionalKEMProtocols:](v57, "setAdditionalKEMProtocols:", v44);
          }

          id v9 = v58;
          id v8 = v59;
          uint64_t v28 = v56;
        }

        id v45 = objc_alloc_init(MEMORY[0x189603FA8]);
        if (![v8 useExtendedAuthentication])
        {
          v47 = -[NEIKEv2EAPProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2EAPProtocol),  "initWithMethod:",  0LL);
          [v45 addObject:v47];
LABEL_57:

          -[NEIKEv2IKESAProposal setEapProtocols:](v11, "setEapProtocols:", v45);
          v53 = v11;
          goto LABEL_58;
        }

        [v10 objectForKeyedSubscript:@"AccountName"];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46) {
          [v10 objectForKeyedSubscript:@"AccountName"];
        }
        else {
          [v8 username];
        }
        v47 = (NEIKEv2EAPProtocol *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          [v8 identityReferenceInternal];
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48)
          {
            v49 = -[NEIKEv2EAPProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2EAPProtocol),  "initWithMethod:",  7LL);
            [v45 addObject:v49];
          }

          v50 = -[NEIKEv2EAPProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2EAPProtocol),  "initWithMethod:",  4LL);
          [v45 addObject:v50];
        }

        objc_msgSend(v8, "identityReferenceInternal", v56);
        id v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          v52 = -[NEIKEv2EAPProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2EAPProtocol),  "initWithMethod:",  6LL);
          [v45 addObject:v52];
        }

        if ([v45 count]) {
          goto LABEL_57;
        }
        ne_log_obj();
        id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1876B1000, v55, OS_LOG_TYPE_ERROR, "missing eap protocol", buf, 2u);
        }

        v53 = 0LL;
LABEL_58:

        break;
    }
  }

  else
  {
    ne_log_obj();
    uint64_t v11 = (NEIKEv2IKESAProposal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v74 = "+[NEIKEv2Helper createIKESAProposalFromProtocol:saParameters:options:nonceSize:]";
      _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v11,  OS_LOG_TYPE_FAULT,  "%s called with null saParameters",  buf,  0xCu);
    }

    v53 = 0LL;
  }

  return v53;
}

+ (NEIKEv2ChildSAProposal)createIKEv2ChildSAProposalFromProtocol:(void *)a3 saParameters:
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  objc_opt_self();
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NEIKEv2ChildSAProposal);
    -[NEIKEv2ChildSAProposal setProtocol:](v6, "setProtocol:", 3LL);
    -[NEIKEv2ChildSAProposal setLifetimeSeconds:]( v6,  "setLifetimeSeconds:",  (int)(60 * [v5 lifetimeMinutes]));
    switch([v5 encryptionAlgorithm])
    {
      case 1LL:
        v7 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v8 = 2LL;
        goto LABEL_5;
      case 2LL:
        v7 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v8 = 3LL;
LABEL_5:
        id v9 = (NEIKEv2EncryptionProtocol *)-[NEIKEv2EncryptionProtocol initWithEncryptionWireType:is256Bit:](v7, v8, 0);
        goto LABEL_9;
      case 3LL:
        id v10 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v11 = 2LL;
        goto LABEL_8;
      case 5LL:
        v14 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v15 = 4LL;
        goto LABEL_13;
      case 6LL:
        v14 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v15 = 5LL;
        goto LABEL_13;
      case 7LL:
        v14 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v15 = 6LL;
LABEL_13:
        int v12 = -[NEIKEv2EncryptionProtocol initWithEncryptionType:](v14, "initWithEncryptionType:", v15);
        int v13 = 0;
        break;
      default:
        id v10 = objc_alloc(&OBJC_CLASS___NEIKEv2EncryptionProtocol);
        uint64_t v11 = 3LL;
LABEL_8:
        id v9 = -[NEIKEv2EncryptionProtocol initWithEncryptionType:](v10, "initWithEncryptionType:", v11);
LABEL_9:
        int v12 = (os_log_s *)v9;
        int v13 = 1;
        break;
    }

    id v51 = v12;
    [MEMORY[0x189603F18] arrayWithObjects:&v51 count:1];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2ChildSAProposal setEncryptionProtocols:](v6, "setEncryptionProtocols:", v16);

    if (v13)
    {
      uint64_t v17 = [v5 integrityAlgorithm];
      else {
        uint64_t v18 = qword_187872EA0[v17 - 1];
      }
      uint64_t v19 = -[NEIKEv2IntegrityProtocol initWithType:]( objc_alloc(&OBJC_CLASS___NEIKEv2IntegrityProtocol),  "initWithType:",  v18);
      v50 = v19;
      [MEMORY[0x189603F18] arrayWithObjects:&v50 count:1];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2ChildSAProposal setIntegrityProtocols:](v6, "setIntegrityProtocols:", v20);
    }

    if ([v4 enablePFS])
    {
      uint64_t v21 = -[NEIKEv2KEMProtocol initWithMethod:]( [NEIKEv2KEMProtocol alloc],  "initWithMethod:",  [v5 diffieHellmanGroup]);
      v49 = v21;
      [MEMORY[0x189603F18] arrayWithObjects:&v49 count:1];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2ChildSAProposal setKemProtocols:](v6, "setKemProtocols:", v22);

      objc_getProperty(v5, v23, 40LL, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v39 = v21;
        v40 = v12;
        v41 = v6;
        id v25 = objc_alloc_init(MEMORY[0x189603FC8]);
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v42 = v5;
        objc_getProperty(v5, v26, 40LL, 1);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v44;
          uint64_t v31 = 6LL;
          do
          {
            for (uint64_t i = 0LL; i != v29; ++i)
            {
              if (*(void *)v44 != v30) {
                objc_enumerationMutation(v27);
              }
              SEL v33 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              if ([v33 unsignedIntegerValue])
              {
                v34 = -[NEIKEv2KEMProtocol initWithMethod:]( [NEIKEv2KEMProtocol alloc],  "initWithMethod:",  [v33 unsignedIntegerValue]);
                v47 = v34;
                [MEMORY[0x189603F18] arrayWithObjects:&v47 count:1];
                uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
                [MEMORY[0x189607968] numberWithUnsignedInteger:v31 + i];
                uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
                [v25 setObject:v35 forKeyedSubscript:v36];
              }
            }

            v31 += i;
            uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }

          while (v29);
        }

        v6 = v41;
        if ([v25 count])
        {
          uint64_t v37 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v25];
          -[NEIKEv2ChildSAProposal setAdditionalKEMProtocols:](v41, "setAdditionalKEMProtocols:", v37);
        }

        id v5 = v42;
        uint64_t v21 = v39;
        int v12 = v40;
      }
    }
  }

  else
  {
    ne_log_obj();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "+[NEIKEv2Helper createIKEv2ChildSAProposalFromProtocol:saParameters:]";
      _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "%s called with null saParameters", buf, 0xCu);
    }

    v6 = 0LL;
  }

  return v6;
}

@end