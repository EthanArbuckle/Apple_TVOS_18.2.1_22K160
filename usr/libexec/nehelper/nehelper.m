LABEL_15:
        goto LABEL_16;
      }

      remote_connection = xpc_dictionary_get_remote_connection(v4);
      v28 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      v21 = v28;
      if (v28) {
        pid = xpc_connection_get_pid(v28);
      }
      else {
        pid = 0LL;
      }
      v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", pid));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v31, kNRIPCOptionPID);

      v32 = xpc_dictionary_get_value(v4, "relay-options");
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = v33;
      if (v33)
      {
        if (xpc_get_type(v33) == (xpc_type_t)&_xpc_type_dictionary)
        {
          v35 = _CFXPCCreateCFObjectFromXPCObject(v34);
          *(void *)buf = v35;
          if (v35)
          {
            -[NSMutableDictionary addEntriesFromDictionary:](v30, "addEntriesFromDictionary:", v35);
            myCFRelease(buf);
          }
        }
      }

      if (v9 == 2)
      {
        v53 = [[NRIdentityProxyClient alloc] initWithCertificateReference:v11 options:v30];
        v43 = [v53 copyCertificateData];
        v38 = v43;
        if (v43)
        {
          v43 = [v43 length];
          if (v43)
          {
            v45 = (void *)_CFXPCCreateXPCObjectFromCFObject(v38);
            v46 = xpc_dictionary_create(0LL, 0LL, 0LL);
            xpc_dictionary_set_value(v46, "relay-certificate-data", v45);
            sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 0LL, v46);

            goto LABEL_39;
          }
        }

        v51 = ne_log_obj(v43, v44);
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = self;
          v60 = 2080;
          v61 = string_ptr;
          _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "%@ requested certificate not found for %s",  buf,  0x16u);
        }

        v49 = v4;
        v50 = 2LL;
      }

      else
      {
        if (v9 != 1)
        {
LABEL_40:

          goto LABEL_41;
        }

        v53 = [[NRIdentityProxyClient alloc] initWithIdentityReference:v11 options:v30];
        v36 = [v53 copySecKeyProxy];
        v38 = v36;
        if (v36)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v36 endpoint]);

          if (v39)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue([v38 endpoint]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v40 _endpoint]);

            v42 = xpc_dictionary_create(0LL, 0LL, 0LL);
            xpc_dictionary_set_value(v42, "relay-identity-xpc-endpoint", v41);
            sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 0LL, v42);

LABEL_39:
            goto LABEL_40;
          }
        }

        v47 = ne_log_obj(v36, v37);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = self;
          v60 = 2080;
          v61 = string_ptr;
          _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%@ key proxy creation failed for %s",  buf,  0x16u);
        }

        v49 = v4;
        v50 = 12LL;
      }

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v49, v50, 0LL);
      goto LABEL_39;
    }

    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 22LL, 0LL);
  }

LABEL_43:
}

      objc_autoreleasePoolPop(context);
LABEL_44:

      goto LABEL_45;
    }

    v72 = sub_100008358(v210, v16, &v243, v70);
    if ((v72 & 1) == 0)
    {
      v81 = ne_log_obj(v72, v73);
      v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        LOWORD(applier[0]) = 0;
        v79 = "Failed to retrieve tracker domain list for App";
        goto LABEL_119;
      }

      goto LABEL_43;
    }

    v74 = (const void *)NEResourcesCopyTestAppTrackingDomainsPath();
    if (v74)
    {
      v76 = sub_100008358(v210, v16, &v242, v74);
      if ((v76 & 1) == 0)
      {
        v78 = ne_log_obj(v76, v77);
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          LOWORD(applier[0]) = 0;
          v79 = "Failed to retrieve tracker test domain list for App";
LABEL_119:
          _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, v79, (uint8_t *)applier, 2u);
          goto LABEL_43;
        }

        goto LABEL_43;
      }
    }

    else
    {
      v82 = ne_log_obj(0LL, v75);
      v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        LOWORD(applier[0]) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_ERROR,  "No Test App tracker domain file found",  (uint8_t *)applier,  2u);
      }
    }

    v84 = v16;
    xdicta = v214;
    v227 = xarray;
    v224 = objc_opt_self(v210);
    v86 = ne_log_obj(v224, v85);
    v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      v209 = -[NSMutableDictionary count](v84, "count");
      LODWORD(applier[0]) = 134217984;
      *(void *)((char *)applier + 4) = v209;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEBUG,  "Processing all domains <count %lu>",  (uint8_t *)applier,  0xCu);
    }

    v257 = 0u;
    memset(buf, 0, sizeof(buf));
    obja = v84;
    v88 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  buf,  out_token,  16LL);
    if (v88)
    {
      v89 = v88;
      v90 = **(void **)&buf[16];
      do
      {
        for (i = 0LL; i != v89; i = (char *)i + 1)
        {
          if (**(void **)&buf[16] != v90) {
            objc_enumerationMutation(obja);
          }
          v92 = *(void **)(*(void *)&buf[8] + 8LL * (void)i);
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](obja, "objectForKeyedSubscript:", v92));
          v94 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKeyedSubscript:@"owner"]);
          v95 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKeyedSubscript:@"source"]);
          v96 = (const char *)[v92 UTF8String];
          v97 = strlen(v96);
          v99 = ne_log_obj(v97, v98);
          v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            v118 = [v95 unsignedIntValue] & 1;
            v119 = [v95 unsignedIntValue];
            LODWORD(applier[0]) = 138413570;
            *(void *)((char *)applier + 4) = v224;
            WORD6(applier[0]) = 2080;
            *(void *)((char *)applier + 14) = v96;
            WORD3(applier[1]) = 1024;
            DWORD2(applier[1]) = v97;
            WORD6(applier[1]) = 2112;
            *(void *)((char *)&applier[1] + 14) = v94;
            WORD3(applier[2]) = 1024;
            DWORD2(applier[2]) = v118;
            WORD6(applier[2]) = 1024;
            *(_DWORD *)((char *)&applier[2] + 14) = (v119 >> 1) & 1;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEBUG,  "%@ DDG domain %s <%d> : %@ web %u app %u",  (uint8_t *)applier,  0x32u);
          }

          v244 = 0;
          has_high_ascii = ne_trie_has_high_ascii(v96, (int)v97);
          if (!(_DWORD)has_high_ascii) {
            goto LABEL_80;
          }
          v103 = ne_log_obj(has_high_ascii, v102);
          v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(applier[0]) = 136315394;
            *(void *)((char *)applier + 4) = v96;
            WORD6(applier[0]) = 1024;
            *(_DWORD *)((char *)applier + 14) = v97;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEBUG,  "DDG domain - puny-coding %s <%d>",  (uint8_t *)applier,  0x12u);
          }

          v105 = ne_tracker_validate_domain(v96, v97, sub_10000B8E4, applier, 253LL, &v244);
          if ((_DWORD)v105 && v244 >= 1 && v244 < 254)
          {
            *((_BYTE *)applier + v244) = 0;
            v107 = ne_log_obj(v105, v106);
            v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
            if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v248 = 136315394;
              *(void *)&v248[4] = v96;
              v249 = 2080;
              v250 = applier;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEBUG,  "DDG domain - puny-coded %s -> %s",  v248,  0x16u);
            }

            v96 = (const char *)applier;
LABEL_80:
            v109 = xpc_dictionary_create(0LL, 0LL, 0LL);
            xpc_dictionary_set_string( v109, "owner", (const char *)[v94 UTF8String]);
            v110 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKeyedSubscript:@"can-block-request"]);
            xpc_dictionary_set_BOOL(v109, "can-block-request", (BOOL)[v110 BOOLValue]);

            xpc_dictionary_set_value(xdicta, v96, v109);
            objc_opt_self(v224);
            if (v96 && (v111 = strlen(v96), v111 - 254 >= 0xFFFFFF03))
            {
              v114 = v111 - 1LL;
              v115 = byte_10003E9F0;
              do
                *v115++ = v96[v114--];
              while (v114 != -1);
              v112 = byte_10003E9F0;
              byte_10003E9F0[v111] = 0;
            }

            else
            {
              v112 = 0LL;
            }

            v116 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  v112,  4LL);
            v117 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  v96,  4LL);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v227, "setObject:forKeyedSubscript:", v117, v116);

            goto LABEL_93;
          }

          v113 = ne_log_obj(v105, v106);
          v109 = (xpc_object_t)objc_claimAutoreleasedReturnValue(v113);
          if (os_log_type_enabled((os_log_t)v109, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v248 = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v109,  OS_LOG_TYPE_ERROR,  "Failed to puny-code domain",  v248,  2u);
          }

void sub_1000053A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v8 = v6;
  if (v6)
  {
    uint64_t v9 = ne_log_obj(v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), 2LL, 0LL);
      goto LABEL_4;
    }

    uint64_t v57 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v141 = v57;
    __int16 v142 = 2112;
    v143 = v8;
    v30 = "%@ loadConfigurationWithID failed. error: %@";
    v58 = (os_log_s *)v10;
    uint32_t v59 = 22;
LABEL_46:
    _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, v30, buf, v59);
    goto LABEL_3;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 relay]);

  if (!v11)
  {
    uint64_t v28 = ne_log_obj(v12, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v29 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v141 = v29;
    v30 = "%@ no relay found in configuration";
    goto LABEL_45;
  }

  uint64_t v14 = *(void *)(a1 + 56);
  if (v14 == 2)
  {
    __int128 v121 = 0u;
    __int128 v122 = 0u;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v5 relay]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 relays]);

    id v33 = [v32 countByEnumeratingWithState:&v119 objects:v132 count:16];
    if (v33)
    {
      id v34 = v33;
      id v118 = v5;
      char v35 = 0;
      uint64_t v36 = *(void *)v120;
      do
      {
        for (i = 0LL; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v120 != v36) {
            objc_enumerationMutation(v32);
          }
          v38 = *(void **)(*((void *)&v119 + 1) + 8LL * (void)i);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v38 certificateReferences]);
          if (v39)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue([v38 certificateReferences]);
            unsigned __int8 v41 = [v40 containsObject:*(void *)(a1 + 48)];
          }

          else
          {
            unsigned __int8 v41 = 0;
          }

          v35 |= v41;
        }

        id v34 = [v32 countByEnumeratingWithState:&v119 objects:v132 count:16];
      }

      while (v34);

      id v5 = v118;
      if ((v35 & 1) != 0)
      {
        v130[0] = kSecReturnRef;
        v130[1] = kSecClass;
        v131[0] = kCFBooleanTrue;
        v131[1] = kSecClassCertificate;
        v130[2] = kSecValuePersistentRef;
        v131[2] = *(void *)(a1 + 48);
        v44 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v131,  v130,  3LL));
        CFTypeRef result = 0LL;
        OSStatus v46 = SecItemCopyMatching(v44, &result);
        if (result)
        {
          CFDataRef v47 = SecCertificateCopyData((SecCertificateRef)result);
          CFTypeRef v124 = v47;
          uint64_t v48 = myCFRelease(&result);
          if (v47)
          {
            id v50 = (id)_CFXPCCreateXPCObjectFromCFObject(v47);
            myCFRelease(&v124);
            xpc_object_t v51 = xpc_dictionary_create(0LL, 0LL, 0LL);
            xpc_dictionary_set_value(v51, "relay-certificate-data", v50);
            sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), 0LL, v51);

            goto LABEL_88;
          }

          uint64_t v97 = ne_log_obj(v48, v49);
          v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            uint64_t v113 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v141 = v113;
            _os_log_error_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_ERROR,  "%@ SecCertificateCopyData failed",  buf,  0xCu);
          }

          v77 = *(void **)(a1 + 40);
          int64_t v78 = 22LL;
        }

        else
        {
          uint64_t v75 = ne_log_obj(0LL, v45);
          v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            uint64_t v111 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            uint64_t v141 = v111;
            __int16 v142 = 1024;
            LODWORD(v143) = v46;
            _os_log_error_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_ERROR,  "%@ SecItemCopyMatching failed %d",  buf,  0x12u);
          }

          v77 = *(void **)(a1 + 40);
          int64_t v78 = 2LL;
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v77, v78, 0LL);
LABEL_89:

        goto LABEL_4;
      }
    }

    else
    {
    }

    uint64_t v60 = ne_log_obj(v42, v43);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v60);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v61 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v141 = v61;
    v30 = "%@ requested certificate not found in relay configuration";
LABEL_45:
    v58 = (os_log_s *)v10;
    uint32_t v59 = 12;
    goto LABEL_46;
  }

  if (v14 != 1) {
    goto LABEL_4;
  }
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  id v117 = v5;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 relay]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 relays]);

  id v17 = [v16 countByEnumeratingWithState:&v126 objects:v139 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v127;
LABEL_10:
    uint64_t v20 = 0LL;
    while (1)
    {
      if (*(void *)v127 != v19) {
        objc_enumerationMutation(v16);
      }
      v21 = *(void **)(*((void *)&v126 + 1) + 8 * v20);
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 identityReference]);
      if (v22)
      {
        v23 = (void *)v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue([v21 identityReference]);
        unsigned __int8 v25 = [v24 isEqualToData:*(void *)(a1 + 48)];

        if ((v25 & 1) != 0) {
          break;
        }
      }

      if (v18 == (id)++v20)
      {
        id v18 = [v16 countByEnumeratingWithState:&v126 objects:v139 count:16];
        if (v18) {
          goto LABEL_10;
        }
        goto LABEL_17;
      }
    }

    v44 = v21;

    if (!v44) {
      goto LABEL_38;
    }
    v52 = &selRef_mutableCopy;
    if (qword_10003E9C0)
    {
      uint64_t v53 = objc_claimAutoreleasedReturnValue([(id)qword_10003E9C0 objectForKeyedSubscript:*(void *)(a1 + 48)]);
      if (v53)
      {
        id v50 = (id)v53;
        int v54 = 0;
        id v5 = v117;
        goto LABEL_61;
      }
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary identity](v44, "identity"));
    unsigned __int8 v63 = [v62 isModernSystem];

    if ((v63 & 1) == 0)
    {
      v137[0] = kSecReturnRef;
      v137[1] = kSecClass;
      v138[0] = kCFBooleanTrue;
      v138[1] = kSecClassIdentity;
      v137[2] = kSecValuePersistentRef;
      v138[2] = *(void *)(a1 + 48);
      id v50 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v138,  v137,  3LL));
      CFTypeRef v124 = 0LL;
      uint64_t v79 = SecItemCopyMatching((CFDictionaryRef)v50, &v124);
      CFTypeRef v72 = v124;
      id v5 = v117;
      if (!v124)
      {
        int v102 = v79;
        uint64_t v103 = ne_log_obj(v79, v80);
        v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          uint64_t v115 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v141 = v115;
          __int16 v142 = 1024;
          LODWORD(v143) = v102;
          _os_log_error_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_ERROR,  "%@ SecItemCopyMatching for identity failed %d",  buf,  0x12u);
        }

        v95 = *(void **)(a1 + 40);
        int64_t v96 = 2LL;
        goto LABEL_80;
      }

      CFTypeRef result = v124;
      goto LABEL_57;
    }

    v135[0] = kSecReturnRef;
    v135[1] = kSecValuePersistentRef;
    uint64_t v64 = *(void *)(a1 + 48);
    v136[0] = kCFBooleanTrue;
    v136[1] = v64;
    v135[2] = kSecClass;
    v136[2] = kSecClassCertificate;
    id v50 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v136,  v135,  3LL));
    CFTypeRef v124 = 0LL;
    uint64_t v65 = SecItemCopyMatching((CFDictionaryRef)v50, &v124);
    if (!v124)
    {
      int v99 = v65;
      uint64_t v100 = ne_log_obj(v65, v66);
      v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      {
        uint64_t v114 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v141 = v114;
        __int16 v142 = 1024;
        LODWORD(v143) = v99;
        _os_log_error_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_ERROR,  "%@ SecItemCopyMatching for cert failed %d",  buf,  0x12u);
      }

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), 2LL, 0LL);
      id v5 = v117;
      goto LABEL_88;
    }

    v134[0] = kCFBooleanTrue;
    v133[0] = kSecReturnRef;
    v133[1] = kSecValuePersistentRef;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary identity](v44, "identity"));
    v68 = (void *)objc_claimAutoreleasedReturnValue([v67 keyPersistentReference]);
    v133[2] = kSecClass;
    v134[1] = v68;
    v134[2] = kSecClassKey;
    v69 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v134,  v133,  3LL));

    CFTypeRef v123 = 0LL;
    uint64_t v70 = SecItemCopyMatching(v69, &v123);
    if (v123)
    {
      CFTypeRef v72 = (CFTypeRef)SecIdentityCreate(0LL, v124);
      CFTypeRef result = v72;
      myCFRelease(&v124);
      uint64_t v73 = myCFRelease(&v123);
      id v5 = v117;
      if (v72)
      {
        id v50 = v69;
        v52 = &selRef_mutableCopy;
LABEL_57:

        id v50 = [[SecKeyProxy alloc] initWithIdentity:v72];
        uint64_t v82 = ne_log_obj(v50, v81);
        v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, "Created new key proxy", buf, 2u);
        }

        uint64_t v84 = myCFRelease(&result);
        if (!v50)
        {
LABEL_67:
          uint64_t v93 = ne_log_obj(v84, v85);
          v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            uint64_t v112 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v141 = v112;
            _os_log_error_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_ERROR,  "%@ key proxy creation failed ",  buf,  0xCu);
          }

          v95 = *(void **)(a1 + 40);
          int64_t v96 = 12LL;
LABEL_80:
          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v95, v96, 0LL);
          goto LABEL_88;
        }

        int v54 = 1;
LABEL_61:
        v86 = (void *)objc_claimAutoreleasedReturnValue([v50 endpoint]);

        if (v86)
        {
          if (v54)
          {
            v87 = v52[312];
            if (!v87)
            {
              v88 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              v89 = v52[312];
              v52[312] = (char *)v88;

              v87 = v52[312];
            }

            [v87 setObject:v50 forKeyedSubscript:*(void *)(a1 + 48)];
          }

          v90 = (void *)objc_claimAutoreleasedReturnValue([v50 endpoint]);
          v91 = (void *)objc_claimAutoreleasedReturnValue([v90 _endpoint]);

          xpc_object_t v92 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_value(v92, "relay-identity-xpc-endpoint", v91);
          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), 0LL, v92);

          goto LABEL_88;
        }

        goto LABEL_67;
      }

      uint64_t v109 = ne_log_obj(v73, v74);
      v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_ERROR,  "Failed to create identity reference",  buf,  2u);
      }

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), 2LL, 0LL);
    }

    else
    {
      int v106 = v70;
      uint64_t v107 = ne_log_obj(v70, v71);
      v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
      id v5 = v117;
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        uint64_t v116 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v141 = v116;
        __int16 v142 = 1024;
        LODWORD(v143) = v106;
        _os_log_error_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_ERROR,  "%@ SecItemCopyMatching for key failed %d",  buf,  0x12u);
      }

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), 2LL, 0LL);
      myCFRelease(&v124);
    }

    id v50 = v69;
LABEL_88:

    goto LABEL_89;
  }

LABEL_17:
LABEL_38:
  uint64_t v55 = ne_log_obj(v26, v27);
  v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
  {
    uint64_t v105 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v141 = v105;
    _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "%@ requested identity not found in relay configuration",  buf,  0xCu);
  }

  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), 2LL, 0LL);
  id v5 = v117;
LABEL_4:
}

void sub_100005F68(uint64_t a1)
{
  if (qword_10003E9C0)
  {
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    id v1 = *(id *)(a1 + 32);
    id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      id v3 = v2;
      uint64_t v4 = *(void *)v7;
      do
      {
        id v5 = 0LL;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          objc_msgSend( (id)qword_10003E9C0,  "setObject:forKeyedSubscript:",  0,  *(void *)(*((void *)&v6 + 1) + 8 * (void)v5),  (void)v6);
          id v5 = (char *)v5 + 1;
        }

        while (v3 != v5);
        id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }

      while (v3);
    }
  }
}

LABEL_30:
      xpc_dictionary_set_int64(reply, "result-code", 22LL);
LABEL_54:
      remote_connection = xpc_dictionary_get_remote_connection(v4);
      int v54 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      xpc_connection_send_message(v54, reply);

      goto LABEL_55;
    }

    string = xpc_dictionary_get_string(v4, "bundle-id");
    if (!string) {
      goto LABEL_30;
    }
    v21 = string;
    uint64_t v22 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    uint64_t v55 = v21;
    v56 = self;
    if (!self)
    {
      uint64_t v42 = 0LL;
      goto LABEL_41;
    }

    v23 = [[_SWCServiceSpecifier alloc] initWithServiceType:0 applicationIdentifier:v22 domain:0];
    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v70 = 0LL;
    uint32_t v59 = v23;
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCServiceDetails serviceDetailsWithServiceSpecifier:error:]( &OBJC_CLASS____SWCServiceDetails,  "serviceDetailsWithServiceSpecifier:error:",  v23,  &v70));
    uint64_t v26 = (NEHelperTrackerManager *)v70;
    v58 = v26;
    uint64_t v60 = v25;
    uint64_t v61 = v22;
    if (v25)
    {
      uint64_t v57 = v4;
      v68 = 0u;
      v69 = 0u;
      uint64_t v66 = 0u;
      v67 = 0u;
      uint64_t v28 = v25;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v66 objects:buf count:16];
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = *(void *)v67;
        do
        {
          for (i = 0LL; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v67 != v32) {
              objc_enumerationMutation(v28);
            }
            id v34 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)i);
            if ([v34 isApproved])
            {
              char v35 = (void *)objc_claimAutoreleasedReturnValue([v34 serviceSpecifier]);
              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 domain]);
              v37 = (void *)objc_claimAutoreleasedReturnValue([v36 lowercaseString]);
            }

            else
            {
              v31 = 1;
            }
          }

          v30 = [v28 countByEnumeratingWithState:&v66 objects:buf count:16];
        }

        while (v30);
      }

      else
      {
        v31 = 0;
      }

      -[NSMutableArray sortUsingSelector:](v24, "sortUsingSelector:", NSSelectorFromString(@"compare:"));
      uint64_t v4 = v57;
      v40 = v58;
      unsigned __int8 v41 = v59;
      if (!-[NSMutableArray count](v24, "count") && (v31 & 1) != 0)
      {
        uint64_t v42 = 0LL;
LABEL_40:

        uint64_t v22 = v61;
LABEL_41:

        uint64_t v45 = ne_log_obj(v43, v44);
        OSStatus v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v73 = v56;
          uint64_t v74 = 2080;
          uint64_t v75 = (size_t)v55;
          v76 = 2112;
          v77 = v42;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEBUG,  "%@ sending back approved domain list for %s: %@",  buf,  0x20u);
        }

        if (v42)
        {
          CFDataRef v47 = xpc_array_create(0LL, 0LL);
          v62 = 0u;
          unsigned __int8 v63 = 0u;
          uint64_t v64 = 0u;
          uint64_t v65 = 0u;
          uint64_t v48 = v42;
          uint64_t v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v62,  v71,  16LL);
          if (v49)
          {
            id v50 = v49;
            xpc_object_t v51 = *(void *)v63;
            do
            {
              for (j = 0LL; j != v50; j = (char *)j + 1)
              {
                if (*(void *)v63 != v51) {
                  objc_enumerationMutation(v48);
                }
                xpc_array_set_string( v47,  0xFFFFFFFFFFFFFFFFLL,  (const char *)[*(id *)(*((void *)&v62 + 1) + 8 * (void)j) UTF8String]);
              }

              id v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v62,  v71,  16LL);
            }

            while (v50);
          }
        }

        else
        {
          CFDataRef v47 = 0LL;
        }

        xpc_dictionary_set_int64(reply, "result-code", 0LL);
        xpc_dictionary_set_value(reply, "sorted-domains", v47);

        goto LABEL_54;
      }
    }

    else
    {
      v38 = ne_log_obj(v26, v27);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      v40 = v58;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v73 = v58;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Error getting info: %@\n", buf, 0xCu);
      }

      -[NSMutableArray count](v24, "count");
      unsigned __int8 v41 = v59;
    }

    uint64_t v42 = v24;
    goto LABEL_40;
  }

  if (int64 == 2 || !v14)
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) VPN]);
    v30 = [v29 tunnelType];

    if (v30 == (id)2) {
      uint64_t v14 = @"Transparent Proxy";
    }
    else {
      uint64_t v14 = @"VPN";
    }
    if (v30 == (id)2) {
      uint64_t v13 = "APP_WARNING_FILTER";
    }
    else {
      uint64_t v13 = "APP_WARNING_VPN";
    }
    if (v30 == (id)2) {
      uint64_t v12 = "APP_WARNING_HEADER_TRANSPARENT_PROXY";
    }
    else {
      uint64_t v12 = "APP_WARNING_HEADER_VPN";
    }
  }

  __int16 v142 = v13;
  v152 = v7;
  if ([*(id *)(a1 + 40) isTransparentProxy])
  {
    v31 = *(_BYTE **)(a1 + 56);
    v32 = *(id *)(a1 + 40);
    id v33 = v7;
    char v35 = v33;
    if (v31)
    {
      uint64_t v36 = ne_log_obj(v33, v34);
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        if ((v31[10] & 1) != 0) {
          uint64_t v60 = "Enabled";
        }
        else {
          uint64_t v60 = "Disabled";
        }
        uint64_t v61 = "Yes";
        if ((v31[13] & 1) == 0) {
          uint64_t v61 = "No";
        }
        *(_DWORD *)buf = 136315394;
        v181 = v60;
        v182 = 2080;
        v183 = (uint64_t)v61;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "platform entitled: %s isDevelopment: %s",  buf,  0x16u);
      }

      if ((v31[10] & 1) == 0)
      {
        self = v31;
        v38 = (void *)objc_claimAutoreleasedReturnValue([v32 VPN]);
        v39 = (void *)objc_claimAutoreleasedReturnValue([v38 protocol]);

        if (!v39)
        {
          uint64_t v53 = 2LL;
          int v54 = v153;
LABEL_77:

          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 32), v53, 0LL);
          goto LABEL_145;
        }

        v40 = objc_opt_class(&OBJC_CLASS___NETransparentProxyProviderProtocol);
        isKindOfClass = objc_opt_isKindOfClass(v39, v40);
        if ((isKindOfClass & 1) != 0)
        {
          if (v35)
          {
            v150 = v12;
            v176 = 0u;
            v177 = 0u;
            v174 = 0u;
            v175 = 0u;
            uint64_t v43 = v35;
            v44 = [v43 countByEnumeratingWithState:&v174 objects:v186 count:16];
            if (v44)
            {
              uint64_t v45 = v44;
              uint64_t v141 = v39;
              v143 = v35;
              v145 = a1;
              OSStatus v46 = v14;
              CFDataRef v47 = *(void *)v175;
              while (2)
              {
                for (j = 0LL; j != v45; j = (char *)j + 1)
                {
                  if (*(void *)v175 != v47) {
                    objc_enumerationMutation(v43);
                  }
                  uint64_t v49 = *(void **)(*((void *)&v174 + 1) + 8LL * (void)j);
                  id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 identifier]);
                  xpc_object_t v51 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);

                  if (v50 == v51)
                  {
                    v58 = (void *)objc_claimAutoreleasedReturnValue([v49 VPN]);
                    uint32_t v59 = (void *)objc_claimAutoreleasedReturnValue([v58 protocol]);

                    v52 = (uint64_t)[v59 order];
                    uint64_t v14 = v46;
                    char v35 = v143;
                    a1 = v145;
                    v39 = v141;
                    goto LABEL_62;
                  }
                }

                uint64_t v45 = [v43 countByEnumeratingWithState:&v174 objects:v186 count:16];
                if (v45) {
                  continue;
                }
                break;
              }

              uint64_t v14 = v46;
              char v35 = v143;
              a1 = v145;
              v39 = v141;
            }

            v52 = 0x7FFFFFFFLL;
LABEL_62:

            uint64_t v12 = v150;
          }

          else
          {
            v52 = 0x7FFFFFFFLL;
          }

          v62 = ne_log_obj(isKindOfClass, v42);
          unsigned __int8 v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v116 = (const char *)[v39 order];
            id v118 = objc_getProperty(self, v117, 40LL, 1);
            *(_DWORD *)buf = 134218498;
            v181 = v116;
            v182 = 2048;
            v183 = v52;
            v184 = 2112;
            v185 = v118;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEBUG,  "protocol.order %lu, allowed_order %lu, applicationID: %@",  buf,  0x20u);
          }

          __int128 v7 = v152;
          if ([v39 order] != (id)v52)
          {
            uint64_t v65 = objc_getProperty(self, v64, 40LL, 1);
            if (v65)
            {
              v67 = ne_log_obj(v65, v66);
              v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
              int v54 = v153;
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                v125 = (const char *)objc_getProperty(self, v69, 64LL, 1);
                *(_DWORD *)buf = 138412290;
                v181 = v125;
                _os_log_error_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_ERROR,  "%@ trying to modify transparent proxy order through an app. Modifying transparent proxy order is only allowed through profile.",  buf,  0xCu);
              }

              uint64_t v53 = 10LL;
              goto LABEL_77;
            }
          }
        }
      }
    }
  }

  uint64_t v70 = *(void *)(a1 + 56);
  uint64_t v71 = *(void **)(a1 + 40);
  CFTypeRef v72 = v7;
  uint64_t v73 = v71;
  uint64_t v74 = v73;
  if (!v70)
  {

    v98 = *(void **)(a1 + 40);
    __int128 v7 = v152;
    goto LABEL_139;
  }

  selfa = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100035028));
  uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "filteredArrayUsingPredicate:"));
  v76 = objc_claimAutoreleasedReturnValue([v74 contentFilter]);
  v77 = (void *)v76;
  int64_t v78 = v12;
  uint64_t v79 = objc_claimAutoreleasedReturnValue([v74 VPN]);
  uint64_t v80 = (void *)v79;
  if (int64 > 2 && v79)
  {
LABEL_89:

    uint64_t v12 = v78;
LABEL_90:

    goto LABEL_91;
  }

  uint64_t v81 = v75;
  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue([v74 appVPN]);
  v83 = v82;
  if (int64 >= 3 && v82)
  {

    uint64_t v75 = v81;
    goto LABEL_89;
  }

  v147 = (void *)objc_claimAutoreleasedReturnValue([v74 dnsProxy]);

  uint64_t v12 = v78;
  uint64_t v75 = v81;
  if (int64 <= 3 || !v147)
  {
    uint64_t v97 = [v81 count] != 0;
    goto LABEL_106;
  }

            __int128 v7 = v30;
          }
        }
      }

      uint64_t v27 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"[%@/%@]",  v13,  v12);
LABEL_32:

      -[NSMutableString appendString:](v8, "appendString:", v27);
      ++v9;
      v10 = 1;
    }

    while (v9 != v7);
  }

LABEL_41:
  return v8;
}

LABEL_55:
}

void sub_100006AB8(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_self(a1);
  double v242 = 0.0;
  double v243 = 0.0;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_array)
  {
    __int128 v8 = (void *)qword_10003E9D0;
    qword_10003E9D0 = 0LL;

    __int128 v9 = (void *)qword_10003E9D8;
    qword_10003E9D8 = 0LL;

    qword_10003EAF0 = 0LL;
    qword_10003EAF8 = 0LL;
    qword_10003E9E8 = 0LL;
    char v7 = 1;
  }

  else
  {
    char v7 = 0;
  }

  if (!qword_10003E9D8)
  {
    char v211 = a3;
    char v212 = v7;
    id v214 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xarray = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    context = objc_autoreleasePoolPush();
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v11 = v5;
    uint64_t v12 = objc_opt_self(v6);
    uint64_t v14 = ne_log_obj(v12, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(applier[0]) = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Adding Test domains to tracker list",  (uint8_t *)applier,  2u);
    }

    if (v5 && xpc_get_type(v11) == (xpc_type_t)&_xpc_type_array && xpc_array_get_count(v11))
    {
      *(void *)&applier[0] = _NSConcreteStackBlock;
      *((void *)&applier[0] + 1) = 3221225472LL;
      *(void *)&applier[1] = sub_100008968;
      *((void *)&applier[1] + 1) = &unk_100034BE0;
      *(void *)&applier[2] = v10;
      xpc_array_apply(v11, applier);
    }

    id v215 = v5;

    v16 = v10;
    uint64_t v17 = objc_opt_self(v6);
    uint64_t v19 = ne_log_obj(v17, v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Fetching Web tracking domain info from SWC",  buf,  2u);
    }

    id v21 = (id)objc_claimAutoreleasedReturnValue( +[_SWCTrackingDomainInfo trackingDomainInfoWithDomains:]( &OBJC_CLASS____SWCTrackingDomainInfo,  "trackingDomainInfoWithDomains:",  0LL));
    v23 = v21;
    if (!v21 || (id v21 = [v21 count]) == 0)
    {
      uint64_t v60 = ne_log_obj(v21, v22);
      uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "No Web tracker domain list", buf, 2u);
      }

      uint64_t v64 = ne_log_obj(v62, v63);
      uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      LOWORD(applier[0]) = 0;
      uint64_t v79 = "Failed to retrieve tracker domain list for Web";
      goto LABEL_119;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCTrackingDomainInfo lastDatabaseUpdate]( &OBJC_CLASS____SWCTrackingDomainInfo,  "lastDatabaseUpdate"));
    [v24 timeIntervalSinceReferenceDate];
    double v26 = v25;

    uint64_t v29 = ne_log_obj(v27, v28);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = [v23 count];
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCTrackingDomainInfo lastDatabaseUpdate]( &OBJC_CLASS____SWCTrackingDomainInfo,  "lastDatabaseUpdate"));
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Tracker domain info retrieved - count %lu (last update %@)",  buf,  0x16u);
    }

    uint64_t v210 = v6;

    memset(out_token, 0, sizeof(out_token));
    id v33 = v23;
    id v34 = [v33 countByEnumeratingWithState:out_token objects:applier count:16];
    if (v34)
    {
      id v35 = v34;
      int v219 = 0;
      int xdict = 0;
      uint64_t v36 = **(void **)&out_token[4];
      uint64_t v226 = **(void **)&out_token[4];
      id obj = v33;
      do
      {
        v37 = 0LL;
        id v223 = v35;
        do
        {
          if (**(void **)&out_token[4] != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*(void *)&out_token[2] + 8LL * (void)v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v38]);
          id v40 = [v39 source];
          id v42 = v40;
          if ((v40 & 1) != 0)
          {
            uint64_t v45 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v16,  "objectForKeyedSubscript:",  v38));
            if (v45)
            {
              v44 = v45;
              OSStatus v46 = v39;
              CFDataRef v47 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v45,  "objectForKeyedSubscript:",  @"source"));
              uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v47 unsignedIntValue] | 1));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v44,  "setObject:forKeyedSubscript:",  v48,  @"source");
            }

            else
            {
              xpc_object_t v51 = v16;
              v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              v52 = (void *)objc_claimAutoreleasedReturnValue([v39 ownerName]);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v44,  "setObject:forKeyedSubscript:",  v52,  @"owner");

              uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v42));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v44,  "setObject:forKeyedSubscript:",  v53,  @"source");

              id v54 = v39;
              if (qword_10003EB08 != -1) {
                dispatch_once(&qword_10003EB08, &stru_100034C20);
              }
              OSStatus v46 = v39;
              if (byte_10003EB04) {
                id v55 = [v54 canBlockRequest];
              }
              else {
                id v55 = 0LL;
              }

              v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v55));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v44,  "setObject:forKeyedSubscript:",  v56,  @"can-block-request");

              v16 = v51;
              id v49 = -[NSMutableDictionary setObject:forKeyedSubscript:](v51, "setObject:forKeyedSubscript:", v44, v38);
              id v35 = v223;
            }

            uint64_t v57 = ne_log_obj(v49, v50);
            v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            {
              uint32_t v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v38));
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&uint8_t buf[4] = ++xdict;
              id v35 = v223;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = v38;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v42;
              *(_WORD *)&buf[28] = 2112;
              *(void *)&buf[30] = v59;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEBUG,  "%d: Adding Web domain <%@><%lu><%@>",  buf,  0x26u);
            }

            v39 = v46;

            uint64_t v36 = v226;
            id v33 = obj;
          }

          else
          {
            uint64_t v43 = ne_log_obj(v40, v41);
            v44 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&uint8_t buf[4] = ++v219;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = v38;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v42;
              _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v44,  OS_LOG_TYPE_DEBUG,  "%d: Skipping non-Web domain <%@><0x%lX>",  buf,  0x1Cu);
            }
          }

          v37 = (char *)v37 + 1;
        }

        while (v35 != v37);
        id v35 = [v33 countByEnumeratingWithState:out_token objects:applier count:16];
      }

      while (v35);
    }

    else
    {
      int v219 = 0;
      int xdict = 0;
    }

    uint64_t v68 = ne_log_obj(v66, v67);
    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = xdict;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v219;
      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "Added %d Web domains, skipped %d non-Web domains",  buf,  0xEu);
    }

    uint64_t v70 = (const void *)NEResourcesCopyAppTrackingDomainsPath();
    id v5 = v215;
    if (!v70)
    {
      uint64_t v80 = ne_log_obj(0LL, v71);
      uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        LOWORD(applier[0]) = 0;
        uint64_t v79 = "No App tracker domain file found";
        goto LABEL_119;
      }

LABEL_93:
        }

        id v89 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  buf,  out_token,  16LL);
      }

      while (v89);
    }

    __int128 v120 = v227;
    __int128 v121 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v122 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v124 = ne_log_obj(v122, v123);
    v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      id v126 = -[NSMutableDictionary count](v227, "count");
      LODWORD(applier[0]) = 134217984;
      *(void *)((char *)applier + 4) = v126;
      _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEFAULT,  "Deriving unique prefixes for %lu tracker domains",  (uint8_t *)applier,  0xCu);
    }

    __int128 v240 = 0u;
    __int128 v241 = 0u;
    __int128 v238 = 0u;
    __int128 v239 = 0u;
    v216 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keyEnumerator](v227, "keyEnumerator"));
    id v127 = [v216 countByEnumeratingWithState:&v238 objects:v247 count:16];
    v225 = v121;
    if (v127)
    {
      id v128 = v127;
      __int128 v129 = 0LL;
      uint64_t v220 = 0LL;
      uint64_t xarraya = *(void *)v239;
      do
      {
        v130 = 0LL;
        v131 = v129;
        do
        {
          if (*(void *)v239 != xarraya) {
            objc_enumerationMutation(v216);
          }
          v132 = *(void **)(*((void *)&v238 + 1) + 8LL * (void)v130);
          __int128 v129 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v120, "objectForKeyedSubscript:", v132));

          v133 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v225, "objectForKeyedSubscript:", v129));
          if (!v133)
          {
            v134 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](obja, "objectForKeyedSubscript:", v129));
            v135 = (void *)objc_claimAutoreleasedReturnValue([v134 objectForKeyedSubscript:@"owner"]);
            id v136 = [v129 length];
            v220 += (uint64_t)[v135 length] + 2 * (void)v136 + 2;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v225, "setObject:forKeyedSubscript:", v129, v129);
          }

          __int128 v236 = 0u;
          __int128 v237 = 0u;
          __int128 v234 = 0u;
          __int128 v235 = 0u;
          v137 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keyEnumerator](v120, "keyEnumerator"));
          id v138 = [v137 countByEnumeratingWithState:&v234 objects:v246 count:16];
          if (v138)
          {
            id v139 = v138;
            uint64_t v140 = *(void *)v235;
            do
            {
              for (j = 0LL; j != v139; j = (char *)j + 1)
              {
                if (*(void *)v235 != v140) {
                  objc_enumerationMutation(v137);
                }
                uint64_t v142 = *(void *)(*((void *)&v234 + 1) + 8LL * (void)j);
                if (([v132 isEqual:v142] & 1) == 0)
                {
                  v143 = (void *)objc_claimAutoreleasedReturnValue([v132 commonPrefixWithString:v142 options:2]);
                  if ([v143 length]) {
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v122,  "setObject:forKeyedSubscript:",  v143,  v143);
                  }
                }
              }

              id v139 = [v137 countByEnumeratingWithState:&v234 objects:v246 count:16];
            }

            while (v139);
          }

          v130 = (char *)v130 + 1;
          v131 = v129;
          __int128 v120 = v227;
        }

        while (v130 != v128);
        id v128 = [v216 countByEnumeratingWithState:&v238 objects:v247 count:16];
      }

      while (v128);

      uint64_t v144 = v220;
      __int128 v121 = v225;
    }

    else
    {
      uint64_t v144 = 0LL;
    }

    id v145 = -[NSMutableDictionary count](v122, "count");
    if (!v145)
    {
      id v145 = -[NSMutableDictionary count](v120, "count");
      if (v145 == (id)1)
      {
        v147 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v120, "allKeys"));
        v148 = (void *)objc_claimAutoreleasedReturnValue([v147 objectAtIndexedSubscript:0]);

        -[NSMutableDictionary setObject:forKeyedSubscript:](v122, "setObject:forKeyedSubscript:", v148, v148);
      }
    }

    uint64_t v149 = ne_log_obj(v145, v146);
    v150 = (os_log_s *)objc_claimAutoreleasedReturnValue(v149);
    if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
    {
      id v151 = -[NSMutableDictionary count](v122, "count");
      id v152 = -[NSMutableDictionary count](v120, "count");
      LODWORD(applier[0]) = 134218240;
      *(void *)((char *)applier + 4) = v151;
      WORD6(applier[0]) = 2048;
      *(void *)((char *)applier + 14) = v152;
      _os_log_impl( (void *)&_mh_execute_header,  v150,  OS_LOG_TYPE_DEFAULT,  "Derived %lu unique prefixes for %lu tracker domains",  (uint8_t *)applier,  0x16u);
    }

    xarray = (NSMutableDictionary *)xpc_array_create(0LL, 0LL);
    __int128 v230 = 0u;
    __int128 v231 = 0u;
    __int128 v232 = 0u;
    __int128 v233 = 0u;
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keyEnumerator](v121, "keyEnumerator"));
    id v154 = [v153 countByEnumeratingWithState:&v230 objects:v245 count:16];
    if (v154)
    {
      id v155 = v154;
      uint64_t v156 = *(void *)v231;
      do
      {
        for (k = 0LL; k != v155; k = (char *)k + 1)
        {
          if (*(void *)v231 != v156) {
            objc_enumerationMutation(v153);
          }
          v158 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v230 + 1) + 8 * (void)k) lowercaseString]);
          xpc_object_t v159 = xpc_string_create((const char *)[v158 UTF8String]);
          xpc_array_append_value(xarray, v159);
        }

        id v155 = [v153 countByEnumeratingWithState:&v230 objects:v245 count:16];
      }

      while (v155);
    }

    objc_autoreleasePoolPop(context);
    if ((v211 & 1) == 0)
    {
      objc_storeStrong((id *)&qword_10003E9D0, v214);
      objc_storeStrong((id *)&qword_10003E9D8, xarray);
      id v160 = -[NSMutableDictionary count](v122, "count");
      qword_10003EAF0 = (uint64_t)v160;
      qword_10003EAF8 = v144;
    }

    double v162 = v242;
    double v163 = v243;
    if (v243 <= v242) {
      *(double *)&uint64_t v164 = v242;
    }
    else {
      *(double *)&uint64_t v164 = v243;
    }
    if (v26 > v243) {
      *(double *)&uint64_t v164 = v26;
    }
    qword_10003E9E8 = v164;
    uint64_t v165 = ne_log_obj(v160, v161);
    v166 = (os_log_s *)objc_claimAutoreleasedReturnValue(v165);
    id v5 = v215;
    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(applier[0]) = 134218752;
      *(void *)((char *)applier + 4) = qword_10003E9E8;
      WORD6(applier[0]) = 2048;
      *(double *)((char *)applier + 14) = v26;
      WORD3(applier[1]) = 2048;
      *((double *)&applier[1] + 1) = v163;
      LOWORD(applier[2]) = 2048;
      *(double *)((char *)&applier[2] + 2) = v162;
      _os_log_impl( (void *)&_mh_execute_header,  v166,  OS_LOG_TYPE_DEFAULT,  "Domain list g_lastUpdateTimeInterval %f <lastUpdateTimeInterval %f lastUpdateTimeIntervalApp %f lastUpdateTimeIn tervalAppTest %f>",  (uint8_t *)applier,  0x2Au);
    }

    *(void *)v248 = 0LL;
    if ((v212 & 1) == 0)
    {
      uint64_t v167 = open("/private/var/db/com.apple.networkextension.tracker-info", 0);
      if ((v167 & 0x80000000) != 0)
      {
        uint64_t v181 = ne_log_obj(v167, v168);
        v182 = (os_log_s *)objc_claimAutoreleasedReturnValue(v181);
        if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
        {
          v183 = __error();
          v184 = strerror(*v183);
          LODWORD(applier[0]) = 136315650;
          *(void *)((char *)applier + 4) = "+[NEHelperTrackerManager fetchTrackerDomainList:isInit:]";
          WORD6(applier[0]) = 2080;
          *(void *)((char *)applier + 14) = "/private/var/db/com.apple.networkextension.tracker-info";
          WORD3(applier[1]) = 2080;
          *((void *)&applier[1] + 1) = v184;
          _os_log_impl( (void *)&_mh_execute_header,  v182,  OS_LOG_TYPE_DEFAULT,  "%s: failed to open mmap file %s: %s",  (uint8_t *)applier,  0x20u);
        }
      }

      else
      {
        int v169 = v167;
        memset(applier, 0, 112);
        uint64_t v170 = ne_trie_init_from_file(applier, v167, v248);
        int v172 = v170;
        BOOL v174 = *(double *)v248 != *(double *)&qword_10003E9E8 || (_DWORD)v170 == 0;
        uint64_t v175 = ne_log_obj(v170, v171);
        v176 = (os_log_s *)objc_claimAutoreleasedReturnValue(v175);
        if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
        {
          out_token[0] = 136316674;
          *(void *)&out_token[1] = "+[NEHelperTrackerManager fetchTrackerDomainList:isInit:]";
          LOWORD(out_token[3]) = 2080;
          *(void *)((char *)&out_token[3] + 2) = "/private/var/db/com.apple.networkextension.tracker-info";
          HIWORD(out_token[5]) = 1024;
          out_token[6] = v169;
          LOWORD(out_token[7]) = 1024;
          *(int *)((char *)&out_token[7] + 2) = v172 != 0;
          HIWORD(out_token[8]) = 2048;
          *(void *)&out_token[9] = *(void *)v248;
          LOWORD(out_token[11]) = 2048;
          *(void *)((char *)&out_token[11] + 2) = qword_10003E9E8;
          HIWORD(out_token[13]) = 1024;
          out_token[14] = v174;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v176,  OS_LOG_TYPE_DEBUG,  "%s: opened mmap file %s <fd %d> trie_ok %d file timestamp %f g_lastUpdateTimeInterval %f do_rebuild %d",  (uint8_t *)out_token,  0x3Cu);
        }

        if (v172) {
          ne_trie_free(applier);
        }
        uint64_t v177 = close(v169);
        id v5 = v215;
        if (!v174)
        {
          uint64_t v179 = ne_log_obj(v177, v178);
          v180 = (os_log_s *)objc_claimAutoreleasedReturnValue(v179);
          if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(applier[0]) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v180,  OS_LOG_TYPE_DEFAULT,  "No need to re-build the tracker domain trie",  (uint8_t *)applier,  2u);
          }

LABEL_170:
          objc_opt_self(&OBJC_CLASS___NEHelperTrackerManager);
          int v196 = dword_10003E8F8;
          if (dword_10003E8F8 != -1) {
            goto LABEL_177;
          }
          out_token[0] = -1;
          uint64_t v197 = notify_register_check("com.apple.nehelper.tracker-info-ready", out_token);
          if ((_DWORD)v197)
          {
            uint64_t v199 = ne_log_obj(v197, v198);
            v200 = (os_log_s *)objc_claimAutoreleasedReturnValue(v199);
            if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
            {
              LODWORD(applier[0]) = 136315138;
              *(void *)((char *)applier + 4) = "com.apple.nehelper.tracker-info-ready";
              _os_log_error_impl( (void *)&_mh_execute_header,  v200,  OS_LOG_TYPE_ERROR,  "Failed to register for the %s notification",  (uint8_t *)applier,  0xCu);
            }

            int v196 = dword_10003E8F8;
          }

          else
          {
            int v196 = out_token[0];
            dword_10003E8F8 = out_token[0];
          }

          if (v196 != -1)
          {
LABEL_177:
            uint64_t v201 = notify_set_state(v196, (unint64_t)*(double *)&qword_10003E9E8);
            if ((_DWORD)v201)
            {
              int v203 = v201;
              uint64_t v204 = ne_log_obj(v201, v202);
              v205 = (os_log_s *)objc_claimAutoreleasedReturnValue(v204);
              if (os_log_type_enabled(v205, OS_LOG_TYPE_ERROR))
              {
                LODWORD(applier[0]) = 136315394;
                *(void *)((char *)applier + 4) = "com.apple.nehelper.tracker-info-ready";
                WORD6(applier[0]) = 1024;
                *(_DWORD *)((char *)applier + 14) = v203;
                _os_log_error_impl( (void *)&_mh_execute_header,  v205,  OS_LOG_TYPE_ERROR,  "Failed to set the state for the %s notification (status %d)",  (uint8_t *)applier,  0x12u);
              }
            }

            else
            {
              uint64_t v206 = notify_post("com.apple.nehelper.tracker-info-ready");
              uint64_t v208 = ne_log_obj(v206, v207);
              v205 = (os_log_s *)objc_claimAutoreleasedReturnValue(v208);
              if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(applier[0]) = 136315138;
                *(void *)((char *)applier + 4) = "com.apple.nehelper.tracker-info-ready";
                _os_log_impl( (void *)&_mh_execute_header,  v205,  OS_LOG_TYPE_DEFAULT,  "Posted to %s",  (uint8_t *)applier,  0xCu);
              }
            }
          }

          goto LABEL_44;
        }
      }
    }

    uint64_t v185 = open("/private/var/db/com.apple.networkextension.tracker-info.temp", 518, 420LL);
    if ((int)v185 >= 1)
    {
      uint64_t v187 = v185;
      __int128 v255 = 0u;
      __int128 v254 = 0u;
      __int128 v253 = 0u;
      memset(out_token, 0, sizeof(out_token));
      uint64_t v188 = ne_log_obj(v185, v186);
      v189 = (os_log_s *)objc_claimAutoreleasedReturnValue(v188);
      if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(applier[0]) = 136315906;
        *(void *)((char *)applier + 4) = "+[NEHelperTrackerManager fetchTrackerDomainList:isInit:]";
        WORD6(applier[0]) = 2080;
        *(void *)((char *)applier + 14) = "/private/var/db/com.apple.networkextension.tracker-info.temp";
        WORD3(applier[1]) = 2048;
        *((void *)&applier[1] + 1) = (unint64_t)*(double *)v248;
        LOWORD(applier[2]) = 2048;
        *(void *)((char *)&applier[2] + 2) = (unint64_t)*(double *)&qword_10003E9E8;
        _os_log_impl( (void *)&_mh_execute_header,  v189,  OS_LOG_TYPE_DEFAULT,  "%s: Created new mmap file %s (old ts %llu new ts %llu)",  (uint8_t *)applier,  0x2Au);
      }

      id v190 = -[NSMutableDictionary count](v122, "count");
      ne_tracker_build_trie(out_token, xarray, xdicta, v190, v144, v187, *(double *)&qword_10003E9E8);
      ne_trie_free(out_token);
      close(v187);
      if (rename( "/private/var/db/com.apple.networkextension.tracker-info.temp",  "/private/var/db/com.apple.networkextension.tracker-info") < 0)
      {
        int v191 = *__error();
        uint64_t v192 = strerror_r(v191, (char *)applier, 0x80uLL);
        if ((_DWORD)v192) {
          LOBYTE(applier[0]) = 0;
        }
        uint64_t v194 = ne_log_obj(v192, v193);
        v195 = (os_log_s *)objc_claimAutoreleasedReturnValue(v194);
        if (os_log_type_enabled(v195, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "/private/var/db/com.apple.networkextension.tracker-info.temp";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "/private/var/db/com.apple.networkextension.tracker-info";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v191;
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = applier;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v195,  OS_LOG_TYPE_FAULT,  "Failed to move %s to %s: [%d] %s",  buf,  0x26u);
        }

        id v5 = v215;
      }
    }

    goto LABEL_170;
  }

LABEL_45:
}

uint64_t sub_100008358(uint64_t a1, void *a2, void *a3, const void *a4)
{
  id v61 = a2;
  uint64_t v7 = objc_opt_self(a1);
  uint64_t v9 = ne_log_obj(v7, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v67 = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Fetching from App domain file url %@",  buf,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 attributesOfItemAtPath:a4 error:0]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", a4));
  CFRelease(a4);
  if (v12)
  {
    if (v13)
    {
      id v14 = [v13 length];
      if (v14)
      {
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSFileCreationDate]);
        uint64_t v18 = v16;
        if (v16)
        {
          -[os_log_s timeIntervalSinceReferenceDate](v16, "timeIntervalSinceReferenceDate");
          *a3 = v19;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v13,  0LL,  0LL));
          uint64_t v22 = ne_log_obj(v20, v21);
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          v24 = v23;
          if (v20)
          {
            id v55 = v13;
            v56 = v12;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = [v20 count];
              *(_DWORD *)buf = 134218242;
              *(void *)uint64_t v67 = v25;
              *(_WORD *)&v67[8] = 2112;
              *(void *)&v67[10] = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Fetched App domain list <count %lu, %@>",  buf,  0x16u);
            }

            id v54 = v18;

            __int128 v64 = 0u;
            __int128 v65 = 0u;
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            id v26 = v20;
            id v27 = [v26 countByEnumeratingWithState:&v62 objects:v68 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v58 = 0LL;
              uint64_t v29 = *(void *)v63;
              v30 = @"s";
              id v59 = v26;
              do
              {
                id v31 = 0LL;
                id v60 = v28;
                do
                {
                  if (*(void *)v63 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v32 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)v31);
                  id v33 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v32]);
                  id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v30]);
                  id v35 = [v34 unsignedIntValue];
                  if ((v35 & 2) != 0)
                  {
                    uint64_t v39 = v29;
                    id v40 = v30;
                    uint64_t v41 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:v32]);
                    if (v41)
                    {
                      uint64_t v38 = v41;
                      id v42 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v41,  "objectForKeyedSubscript:",  @"source"));
                      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v42 unsignedIntValue] | 2));
                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v38,  "setObject:forKeyedSubscript:",  v43,  @"source");
                    }

                    else
                    {
                      uint64_t v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                      OSStatus v46 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"n"]);
                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v38,  "setObject:forKeyedSubscript:",  v46,  @"owner");

                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v38,  "setObject:forKeyedSubscript:",  v34,  @"source");
                      id v44 = [v61 setObject:v38 forKeyedSubscript:v32];
                    }

                    uint64_t v47 = ne_log_obj(v44, v45);
                    uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                    {
                      unsigned int v57 = [v34 unsignedIntValue];
                      id v49 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:v32]);
                      *(_DWORD *)buf = 67109890;
                      LODWORD(v58) = v58 + 1;
                      *(_DWORD *)uint64_t v67 = v58;
                      *(_WORD *)&v67[4] = 2112;
                      *(void *)&v67[6] = v32;
                      *(_WORD *)&v67[14] = 1024;
                      *(_DWORD *)&v67[16] = v57;
                      *(_WORD *)&v67[20] = 2112;
                      *(void *)&v67[22] = v49;
                      _os_log_debug_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEBUG,  "%d: Adding App domain <%@><%u><%@>",  buf,  0x22u);
                    }

                    v30 = v40;
                    uint64_t v29 = v39;
                    id v26 = v59;
                    id v28 = v60;
                  }

                  else
                  {
                    uint64_t v37 = ne_log_obj(v35, v36);
                    uint64_t v38 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v37);
                    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 67109634;
                      *(_DWORD *)uint64_t v67 = ++HIDWORD(v58);
                      *(_WORD *)&v67[4] = 2112;
                      *(void *)&v67[6] = v32;
                      *(_WORD *)&v67[14] = 2048;
                      *(void *)&v67[16] = v34;
                      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v38,  OS_LOG_TYPE_DEBUG,  "%d: Skipping App domain <%@><0x%lX>",  buf,  0x1Cu);
                    }
                  }

                  id v31 = (char *)v31 + 1;
                }

                while (v28 != v31);
                id v28 = [v26 countByEnumeratingWithState:&v62 objects:v68 count:16];
              }

              while (v28);
            }

            uint64_t v50 = 1LL;
            uint64_t v13 = v55;
            uint64_t v12 = v56;
            uint64_t v18 = v54;
            goto LABEL_36;
          }

          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "App tracker domain list invalid",  buf,  2u);
          }

          id v26 = 0LL;
        }

        else
        {
          uint64_t v52 = ne_log_obj(0LL, v17);
          id v26 = (id)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v26,  OS_LOG_TYPE_ERROR,  "No App tracker domain file creation date",  buf,  2u);
          }
        }

        uint64_t v50 = 0LL;
LABEL_36:

        goto LABEL_37;
      }
    }
  }

  uint64_t v51 = ne_log_obj(v14, v15);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "No App tracker domain file metadata or data",  buf,  2u);
  }

  uint64_t v50 = 0LL;
LABEL_37:

  return v50;
}

void sub_10000893C(id a1)
{
  byte_10003EB04 = +[_SWCTrackingDomainInfo instancesRespondToSelector:]( &OBJC_CLASS____SWCTrackingDomainInfo,  "instancesRespondToSelector:",  "canBlockRequest");
}

uint64_t sub_100008968(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v5);
      if (string_ptr)
      {
        uint64_t v7 = string_ptr;
        uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  @"<Test Owner>",  @"owner");
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 3LL));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, @"source");

        v10 = *(void **)(a1 + 32);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
        [v10 setObject:v8 forKeyedSubscript:v11];

        uint64_t v14 = ne_log_obj(v12, v13);
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = *(void **)(a1 + 32);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v18]);
          int v20 = 136315394;
          uint64_t v21 = v7;
          __int16 v22 = 2112;
          v23 = v19;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Adding test domain <%s><%@>",  (uint8_t *)&v20,  0x16u);
        }
      }
    }
  }

  return 1LL;
}

void sub_100008B28(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("NEHelperTrackerManagerQueue", v4);
  id v3 = (void *)qword_10003E9C8;
  qword_10003E9C8 = (uint64_t)v2;
}

void sub_100008B78(id a1)
{
}

BOOL sub_100008FE0(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  if (!a1)
  {
    BOOL v34 = 0;
    goto LABEL_75;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "MessageType");
  if (uint64 == 1003)
  {
    id v24 = v5;
    uint64_t v25 = sub_10000A7E0(0);
    if (v25)
    {
      uint64_t v27 = v25;
      xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v10, "MessageType", 0x3EDuLL);
      id v28 = (const __CFArray *)WiFiManagerClientCopyNetworksWithBundleIdentifier(v27, *(void *)(a1 + 8));
      size_t length = (size_t)v28;
      if (v28)
      {
        uint64_t v29 = v28;
        CFIndex Count = CFArrayGetCount(v28);
        if (Count)
        {
          uint64_t v31 = Count;
          uint64_t v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          if (v31 < 1)
          {
            BOOL v34 = 1;
LABEL_57:
            uint64_t v82 = (void *)_CFXPCCreateXPCObjectFromCFObject(v32);
            xpc_dictionary_set_value(v10, "QueryResult", v82);
            sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v24, 100LL, v10);
          }

          else
          {
            CFIndex v33 = 0LL;
            BOOL v34 = 0;
            while (1)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(v29, v33);
              uint64_t v36 = sub_10000A8A0((uint64_t)ValueAtIndex);
              uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
              if (!v37) {
                break;
              }
              uint64_t v39 = (void *)v37;
              -[NSMutableArray addObject:](v32, "addObject:", v37);

              BOOL v34 = v31 <= ++v33;
              if (v31 == v33) {
                goto LABEL_57;
              }
            }

            uint64_t v100 = ne_log_obj(0LL, v38);
            uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(v100);
            if (os_log_type_enabled((os_log_t)v82, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = objc_opt_class(a1);
              id v166 = *(id *)&buf[4];
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v82,  OS_LOG_TYPE_ERROR,  "%@ received invalid network object from WiFiManager.",  buf,  0xCu);
            }
          }

          myCFRelease(&length);
LABEL_73:

          goto LABEL_74;
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v24, 100LL, v10);
        myCFRelease(&length);
      }

      else
      {
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v24, 100LL, v10);
      }

      BOOL v34 = 1;
      goto LABEL_73;
    }

    uint64_t v72 = ne_log_obj(0LL, v26);
    xpc_object_t v10 = (xpc_object_t)objc_claimAutoreleasedReturnValue(v72);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
LABEL_39:
      BOOL v34 = 0;
      goto LABEL_73;
    }

    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = objc_opt_class(a1);
    id v70 = *(id *)&buf[4];
    uint64_t v71 = "%@ failed to get WiFiManager client.";
LABEL_106:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, v71, buf, 0xCu);

    goto LABEL_39;
  }

  if (uint64 != 1002)
  {
    if (uint64 != 1001)
    {
      BOOL v34 = 1;
      goto LABEL_75;
    }

    id v7 = v5;
    size_t length = 0LL;
    data = xpc_dictionary_get_data(v7, "AddParameter", &length);
    if (data && length)
    {
      xpc_object_t v10 = (xpc_object_t)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  data,  length,  0LL));
      id v11 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v10,  0LL);
      id v12 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v11,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NEHotspotConfiguration),  @"NEHotspotConfigurationKey");
      uint64_t isKindOfClass = objc_claimAutoreleasedReturnValue(v12);
      uint64_t v15 = (void *)isKindOfClass;
      if (isKindOfClass
        && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NEHotspotConfiguration),
            uint64_t isKindOfClass = objc_opt_isKindOfClass(v15, v16),
            (isKindOfClass & 1) != 0))
      {
        id v17 = [v15 validate];
        if (v17 != (id)100)
        {
          int64_t v96 = (int64_t)v17;
          uint64_t v97 = ne_log_obj(v17, v18);
          uint64_t v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            uint64_t v164 = (void *)objc_opt_class(a1);
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v164;
            id v165 = v164;
            _os_log_error_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_ERROR,  "%@ failed to validate the configuration data for add/update request.",  buf,  0xCu);
          }

          xpc_object_t v99 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_uint64(v99, "MessageType", 0x3ECuLL);
          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v7, v96, v99);

          BOOL v34 = 1;
          goto LABEL_45;
        }

        id v19 = v15;
        uint64_t v20 = WiFiNetworkCreate(kCFAllocatorDefault, 0LL);
        if (v20)
        {
          id v21 = (id)v20;
          if (([v19 useSSIDPrefix] & 1) != 0
            || (__int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v19 SSID]), v22, !v22))
          {
            if (![v19 useSSIDPrefix]
              || (v104 = (void *)objc_claimAutoreleasedReturnValue([v19 SSIDPrefix]),
                  v104,
                  !v104)
              || (uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue([v19 SSIDPrefix]),
                  WiFiNetworkSetProperty(v21, @"SSID_STR", v105),
                  v105,
                  ![v19 hidden]))
            {
LABEL_84:
              uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue([v19 lifeTimeInDays]);
              if (v106 && (sub_10000AA48(a1) & 1) == 0 && [v19 securityType] != (id)3)
              {
                id v258 = v21;
                id v107 = [v19 securityType];

                BOOL v108 = v107 == (id)4;
                id v21 = v258;
                if (v108) {
                  goto LABEL_90;
                }
                xpc_object_t v109 = (void *)objc_claimAutoreleasedReturnValue([v19 lifeTimeInDays]);
                [v109 doubleValue];
                double v111 = v110 * 86400.0;

                uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                WiFiNetworkSetExpireDate(v258, [v106 dateByAddingTimeInterval:v111]);
              }

LABEL_90:
              WiFiNetworkSetProperty( v21,  @"AP_MODE",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
              v267 = v19;
              if ([v19 securityType] == (id)1)
              {
                WiFiNetworkSetWEP(v21, 1LL);
              }

              else
              {
                if ([v19 securityType] != (id)2)
                {
                  if ([v19 securityType] != (id)3 && objc_msgSend(v19, "securityType") != (id)4) {
                    goto LABEL_160;
                  }
                  id v259 = v21;
                  id v139 = (id)objc_claimAutoreleasedReturnValue([v19 eapSettings]);
                  v261 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue([v139 username]);
                  id v141 = [v140 length];

                  if (v141)
                  {
                    uint64_t v142 = (void *)objc_claimAutoreleasedReturnValue([v139 username]);
                    -[NSMutableDictionary setObject:forKey:](v261, "setObject:forKey:", v142, @"UserName");
                  }

                  v143 = (void *)objc_claimAutoreleasedReturnValue([v139 password]);
                  id v144 = [v143 length];

                  if (v144)
                  {
                    id v145 = (void *)objc_claimAutoreleasedReturnValue([v139 password]);
                    -[NSMutableDictionary setObject:forKey:](v261, "setObject:forKey:", v145, @"UserPassword");
                  }

                  uint64_t v146 = (void *)objc_claimAutoreleasedReturnValue([v139 supportedEAPTypes]);
                  id v147 = [v146 count];

                  if (v147)
                  {
                    v148 = (void *)objc_claimAutoreleasedReturnValue([v139 supportedEAPTypes]);
                    -[NSMutableDictionary setObject:forKey:](v261, "setObject:forKey:", v148, @"AcceptEAPTypes");
                  }

                  if ([v139 isTLSClientCertificateRequired])
                  {
                    v263 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                    uint64_t v149 = (void *)objc_claimAutoreleasedReturnValue([v139 identityReference]);
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v263,  "setObject:forKeyedSubscript:",  v149,  @"TLSClientIdentityData");

                    v150 = (void *)objc_claimAutoreleasedReturnValue([v139 clientTrustChainReference]);
                    id v151 = [v150 count];

                    if (v151)
                    {
                      id v152 = (void *)objc_claimAutoreleasedReturnValue([v139 clientTrustChainReference]);
                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v263,  "setObject:forKeyedSubscript:",  v152,  @"TLSClientIdentityTrustChain");
                    }

                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v261,  "setObject:forKeyedSubscript:",  v263,  @"TLSIdentityHandle");
                  }

                  v264 = v11;
                  v153 = (void *)objc_claimAutoreleasedReturnValue([v139 trustedServerCertificateReferences]);
                  id v154 = [v153 count];

                  if (v154)
                  {
                    id v155 = (void *)objc_claimAutoreleasedReturnValue([v139 trustedServerCertificateReferences]);
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v261,  "setObject:forKeyedSubscript:",  v155,  @"TLSTrustedCertificates");
                  }

                  uint64_t v156 = (void *)objc_claimAutoreleasedReturnValue([v139 supportedEAPTypes]);
                  v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 21LL));
                  unsigned int v158 = [v156 containsObject:v157];

                  if (v158)
                  {
                    unint64_t v159 = (unint64_t)[v139 ttlsInnerAuthenticationType];
                    if (v159 > 3) {
                      id v160 = @"EAP";
                    }
                    else {
                      id v160 = off_100034CC8[v159];
                    }
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v261,  "setObject:forKeyedSubscript:",  v160,  @"TTLSInnerAuthentication");
                  }

                  uint64_t v170 = (void *)objc_claimAutoreleasedReturnValue([v139 outerIdentity]);
                  id v171 = [v170 length];

                  if (v171)
                  {
                    int v172 = (void *)objc_claimAutoreleasedReturnValue([v139 outerIdentity]);
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v261,  "setObject:forKeyedSubscript:",  v172,  @"OuterIdentity");
                  }

                  v173 = (void *)objc_claimAutoreleasedReturnValue([v139 trustedServerNames]);
                  id v174 = [v173 count];

                  if (v174)
                  {
                    uint64_t v175 = (void *)objc_claimAutoreleasedReturnValue([v139 trustedServerNames]);
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v261,  "setObject:forKeyedSubscript:",  v175,  @"TLSTrustedServerNames");
                  }

                  id v176 = [v139 preferredTLSVersion];
                  uint64_t v177 = @"1.2";
                  if (v176 == (id)1) {
                    uint64_t v177 = @"1.1";
                  }
                  if (v176) {
                    uint64_t v178 = v177;
                  }
                  else {
                    uint64_t v178 = @"1.0";
                  }
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v261,  "setObject:forKeyedSubscript:",  v178,  @"TLSMaximumVersion");

                  v256 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v261,  @"EAPClientConfiguration"));
                  WiFiNetworkSetProperty(v259, kWiFiNetworkEnterpriseProfile, v256);
                  WiFiNetworkSetWPA(v259, 1LL);
                  id v19 = v267;
                  if ([v267 securityType] == (id)4)
                  {
                    WiFiNetworkSetProperty(v259, kWiFiIsHotspot, kCFBooleanTrue);
                    uint64_t v179 = kWiFiDomainName;
                    v180 = (void *)objc_claimAutoreleasedReturnValue([v267 hs20Settings]);
                    uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue([v180 domainName]);
                    WiFiNetworkSetProperty(v259, v179, v181);

                    uint64_t v182 = kWiFiSPRoaming;
                    v183 = (void *)objc_claimAutoreleasedReturnValue([v267 hs20Settings]);
                    else {
                      CFBooleanRef v184 = kCFBooleanFalse;
                    }
                    id v19 = v267;
                    WiFiNetworkSetProperty(v259, v182, v184);

                    uint64_t v185 = (void *)objc_claimAutoreleasedReturnValue([v267 hs20Settings]);
                    uint64_t v186 = (void *)objc_claimAutoreleasedReturnValue([v185 roamingConsortiumOIs]);
                    id v187 = [v186 count];

                    if (v187)
                    {
                      uint64_t v188 = kWiFiRoamingConsortiumOIs;
                      v189 = (void *)objc_claimAutoreleasedReturnValue([v267 hs20Settings]);
                      id v190 = (void *)objc_claimAutoreleasedReturnValue([v189 roamingConsortiumOIs]);
                      WiFiNetworkSetProperty(v259, v188, v190);
                    }

                    int v191 = (void *)objc_claimAutoreleasedReturnValue([v267 hs20Settings]);
                    uint64_t v192 = (void *)objc_claimAutoreleasedReturnValue([v191 naiRealmNames]);
                    id v193 = [v192 count];

                    if (v193)
                    {
                      uint64_t v194 = kWiFiNaiRealmName;
                      v195 = (void *)objc_claimAutoreleasedReturnValue([v267 hs20Settings]);
                      int v196 = (void *)objc_claimAutoreleasedReturnValue([v195 naiRealmNames]);
                      WiFiNetworkSetProperty(v259, v194, v196);
                    }
                  }

                  uint64_t v197 = (void *)objc_claimAutoreleasedReturnValue([v19 eapSettings]);
                  uint64_t v198 = (void *)objc_claimAutoreleasedReturnValue([v197 password]);
                  id v199 = [v198 length];

                  if (v199)
                  {
                    v200 = (void *)objc_claimAutoreleasedReturnValue([v19 eapSettings]);
                    uint64_t v201 = (void *)objc_claimAutoreleasedReturnValue([v200 password]);
                    WiFiNetworkSetPassword(v259, v201);
                  }

                  v137 = v261;
                  id v11 = v264;
                  id v21 = v259;
LABEL_159:

LABEL_160:
                  uint64_t v268 = (uint64_t)v21;
                  uint64_t v202 = sub_10000A7E0(0);
                  if (v202)
                  {
                    uint64_t v262 = v202;
                    v265 = v11;
                    uint64_t v204 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
                    v205 = (void *)objc_claimAutoreleasedReturnValue([v204 UUIDString]);

                    uint64_t v206 = *(void **)(a1 + 8);
                    unsigned __int8 v257 = [v19 joinOnce];
                    unsigned __int8 v254 = [v19 isAccessory];
                    id v260 = v206;
                    id v207 = v206;
                    id v208 = v7;
                    id obj = v205;
                    id v209 = v205;
                    objc_opt_self(&OBJC_CLASS___NEHelperHotspotConfigurationTask);
                    uint64_t v210 = objc_alloc(&OBJC_CLASS___NEHelperHotspotConfigurationTask);
                    id v211 = v209;
                    id v212 = v208;
                    id v213 = v207;
                    if (v210)
                    {
                      *(void *)buf = v210;
                      *(void *)&buf[8] = &OBJC_CLASS___NEHelperHotspotConfigurationTask;
                      id v214 = (NEHelperHotspotConfigurationTask *)objc_msgSendSuper2((objc_super *)buf, "init");
                      uint64_t v210 = v214;
                      if (v214)
                      {
                        objc_storeStrong((id *)&v214->_taskIdentifier, obj);
                        objc_storeStrong((id *)&v210->_requestMessage, a2);
                        objc_storeStrong((id *)&v210->_bundleID, v260);
                        v210->_joinOnce = v257;
                        v210->_isAccessory = v254;
                      }
                    }

                    id v11 = v265;

                    [(id)qword_10003EB18 setObject:v210 forKeyedSubscript:v211];
                    id v266 = v211;

                    id v215 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v215,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 8),  kWiFiNetworkBundleIdentifierKey);
                    v216 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  sub_10000AA48(a1) ^ 1);
                    v217 = (void *)objc_claimAutoreleasedReturnValue(v216);
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v215,  "setObject:forKeyedSubscript:",  v217,  kWiFiAddNetworkOriginatorKey);

                    v218 = v267;
                    id v219 = [v267 joinOnce];
                    if ((_DWORD)v219)
                    {
                      uint64_t v221 = ne_log_obj(v219, v220);
                      v222 = (os_log_s *)objc_claimAutoreleasedReturnValue(v221);
                      if (os_log_type_enabled(v222, OS_LOG_TYPE_INFO))
                      {
                        id v223 = (void *)objc_opt_class(a1);
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v223;
                        id v224 = v223;
                        _os_log_impl( (void *)&_mh_execute_header,  v222,  OS_LOG_TYPE_INFO,  "%@ setting kWiFiAddNetworkDisassociateOnSessionEndKey option",  buf,  0xCu);
                      }

                      v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v215,  "setObject:forKeyedSubscript:",  v225,  kWiFiAddNetworkDisassociateOnSessionEndKey);

                      v218 = v267;
                    }

                    id v226 = [v218 useSSIDPrefix];
                    if ((_DWORD)v226)
                    {
                      uint64_t v228 = ne_log_obj(v226, v227);
                      v229 = (os_log_s *)objc_claimAutoreleasedReturnValue(v228);
                      if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
                      {
                        __int128 v230 = (void *)objc_opt_class(a1);
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v230;
                        id v231 = v230;
                        _os_log_impl( (void *)&_mh_execute_header,  v229,  OS_LOG_TYPE_INFO,  "%@ setting kWiFiAddNetworkUseSSIDPrefixKey option",  buf,  0xCu);
                      }

                      __int128 v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v215,  "setObject:forKeyedSubscript:",  v232,  kWiFiAddNetworkUseSSIDPrefixKey);

                      v218 = v267;
                    }

                    id v233 = [v218 isAccessory];
                    id v235 = v266;
                    if ((_DWORD)v233)
                    {
                      uint64_t v236 = ne_log_obj(v233, v234);
                      __int128 v237 = (os_log_s *)objc_claimAutoreleasedReturnValue(v236);
                      if (os_log_type_enabled(v237, OS_LOG_TYPE_INFO))
                      {
                        __int128 v238 = (void *)objc_opt_class(a1);
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v238;
                        id v239 = v238;
                        _os_log_impl( (void *)&_mh_execute_header,  v237,  OS_LOG_TYPE_INFO,  "%@ setting isAccessory option",  buf,  0xCu);

                        id v235 = v266;
                      }

                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v215,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"isAccessory");
                    }

                    int v240 = WiFiManagerClientAddNetworkAsync(v262, v268, v215, sub_10000AB2C, v235);
                    uint64_t v241 = myCFRelease(&v268);
                    BOOL v34 = v240 == 0;
                    if (v240)
                    {
                      uint64_t v243 = ne_log_obj(v241, v242);
                      int v244 = (os_log_s *)objc_claimAutoreleasedReturnValue(v243);
                      if (os_log_type_enabled(v244, OS_LOG_TYPE_ERROR))
                      {
                        __int16 v249 = (void *)objc_opt_class(a1);
                        *(_DWORD *)buf = 138412546;
                        *(void *)&uint8_t buf[4] = v249;
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = v240;
                        id v250 = v249;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v244,  OS_LOG_TYPE_ERROR,  "%@ WiFiManagerClientAddNetworkAsync() failed: %d",  buf,  0x12u);
                      }
                    }

                    goto LABEL_45;
                  }

                  uint64_t v245 = ne_log_obj(0LL, v203);
                  v246 = (os_log_s *)objc_claimAutoreleasedReturnValue(v245);
                  if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
                  {
                    v251 = (void *)objc_opt_class(a1);
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v251;
                    id v252 = v251;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v246,  OS_LOG_TYPE_ERROR,  "%@ failed to get WiFiManager client.",  buf,  0xCu);
                  }

                  myCFRelease(&v268);
LABEL_44:
                  BOOL v34 = 0;
LABEL_45:

                  goto LABEL_73;
                }

                WiFiNetworkSetWPA(v21, 1LL);
              }

              uint64_t v134 = kWiFiNetworkPasswordStringKey;
              uint64_t v135 = objc_claimAutoreleasedReturnValue([v19 passphrase]);
              uint64_t v136 = v134;
              v137 = (void *)v135;
              WiFiNetworkSetProperty(v21, v136, v135);
              goto LABEL_159;
            }
          }

          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v19 SSID]);
            WiFiNetworkSetProperty(v21, @"SSID_STR", v23);
          }

          WiFiNetworkSetProperty(v21, @"HIDDEN_NETWORK", kCFBooleanTrue);
          goto LABEL_84;
        }

        uint64_t v114 = ne_log_obj(v112, v113);
        uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          uint64_t v115 = (void *)objc_opt_class(a1);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v115;
          id v116 = v115;
          id v117 = "%@ failed to convert input configuration into wifi network dictionary for add/update request";
LABEL_108:
          _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, v117, buf, 0xCu);
        }
      }

      else
      {
        uint64_t v77 = ne_log_obj(isKindOfClass, v14);
        uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          id v138 = (void *)objc_opt_class(a1);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v138;
          id v116 = v138;
          id v117 = "%@ received invalid configuration object for add/update request.";
          goto LABEL_108;
        }
      }

      goto LABEL_44;
    }

    uint64_t v68 = ne_log_obj(data, v9);
    xpc_object_t v10 = (xpc_object_t)objc_claimAutoreleasedReturnValue(v68);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    v69 = (void *)objc_opt_class(a1);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v69;
    id v70 = v69;
    uint64_t v71 = "%@ failed to get input configuration for add/update request.";
    goto LABEL_106;
  }

  string = xpc_dictionary_get_string(v5, "NetworkToRemove");
  if (!string)
  {
    uint64_t v73 = ne_log_obj(0LL, v41);
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
    if (!os_log_type_enabled((os_log_t)v74, OS_LOG_TYPE_ERROR))
    {
LABEL_48:

      BOOL v34 = 0;
      goto LABEL_74;
    }

    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = objc_opt_class(a1);
    id v75 = *(id *)&buf[4];
    uint64_t v76 = "%@ failed to get input data for configuration remove request.";
LABEL_110:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v74, OS_LOG_TYPE_ERROR, v76, buf, 0xCu);

    goto LABEL_48;
  }

  id v42 = string;
  uint64_t v43 = sub_10000A7E0(0);
  if (!v43)
  {
    uint64_t v79 = ne_log_obj(0LL, v44);
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(v79);
    if (!os_log_type_enabled((os_log_t)v74, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = objc_opt_class(a1);
    id v75 = *(id *)&buf[4];
    uint64_t v76 = "%@ failed to get WiFiManager client.";
    goto LABEL_110;
  }

  uint64_t v45 = v43;
  size_t length = 0LL;
  uint64_t v46 = WiFiManagerClientCopyCurrentSessionBasedNetwork();
  uint64_t v48 = v46;
  uint64_t v268 = v46;
  if (!v46)
  {
    uint64_t v80 = ne_log_obj(0LL, v47);
    __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
    if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = objc_opt_class(a1);
    id v64 = *(id *)&buf[4];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEBUG,  "%@ The currently associated Wi-Fi network is not a JoinOnce network.",  buf,  0xCu);
    goto LABEL_136;
  }

  BundleIdentifier = (const void *)WiFiNetworkGetBundleIdentifier(v46);
  uint64_t v50 = CFEqual(BundleIdentifier, *(CFTypeRef *)(a1 + 8));
  if ((_DWORD)v50)
  {
    uint64_t v52 = ne_log_obj(v50, v51);
    uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = objc_opt_class(a1);
      id v162 = *(id *)&buf[4];
      _os_log_debug_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEBUG,  "%@ disassociating (JoinOnce)Wi-Fi network.",  buf,  0xCu);
    }

    id v54 = (const __CFArray *)WiFiManagerClientCopyDevices(v45);
    size_t length = (size_t)v54;
    if (v54 && (v56 = v54, (id v54 = (const __CFArray *)CFArrayGetCount(v54)) != 0LL))
    {
      unsigned int v57 = CFArrayGetValueAtIndex(v56, 0LL);
      if (!v57 || (uint64_t v58 = WiFiDeviceClientDisassociate(v57, 0LL), !(_DWORD)v58))
      {
        myCFRelease(&length);
        myCFRelease(&v268);
        goto LABEL_133;
      }

      int v60 = v58;
      uint64_t v61 = ne_log_obj(v58, v59);
      __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        goto LABEL_54;
      }
      __int128 v63 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v63;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v60;
      id v64 = v63;
      __int128 v65 = "%@ WiFiDeviceClientDisassociate failed: %d";
      uint64_t v66 = v62;
      uint32_t v67 = 18;
    }

    else
    {
      uint64_t v81 = ne_log_obj(v54, v55);
      __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        goto LABEL_54;
      }
      double v163 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v163;
      id v64 = v163;
      __int128 v65 = "%@ WiFiManagerClientCopyDevices() failed(No Wi-Fi devices found).";
      uint64_t v66 = v62;
      uint32_t v67 = 12;
    }

    _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, v65, buf, v67);
LABEL_136:

LABEL_54:
    myCFRelease(&length);
    myCFRelease(&v268);
    if (v48) {
      goto LABEL_133;
    }
    goto LABEL_59;
  }

  myCFRelease(&length);
  myCFRelease(&v268);
LABEL_59:
  id v83 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v42));
  uint64_t v268 = 0LL;
  uint64_t v84 = (const __CFArray *)WiFiManagerClientCopyNetworksWithBundleIdentifier(v45, *(void *)(a1 + 8));
  size_t length = (size_t)v84;
  if (!v84)
  {
    uint64_t v102 = ne_log_obj(0LL, v85);
    uint64_t v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v167 = (void *)objc_opt_class(a1);
      uint64_t v168 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v167;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v168;
      id v169 = v167;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_DEBUG,  "%@ %@ does not own any networks",  buf,  0x16u);
    }

    goto LABEL_132;
  }

  uint64_t v86 = v84;
  CFIndex v87 = CFArrayGetCount(v84);
  if (v87 < 1) {
    goto LABEL_131;
  }
  CFIndex v88 = v87;
  CFIndex v89 = 0LL;
  while (1)
  {
    uint64_t v90 = CFArrayGetValueAtIndex(v86, v89);
    if (v90) {
      break;
    }
LABEL_65:
    if (v88 == ++v89) {
      goto LABEL_131;
    }
  }

  v91 = v90;
  uint64_t v92 = sub_10000A8A0((uint64_t)v90);
  uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
  id v94 = [v83 isEqualToString:v93];
  if (!(_DWORD)v94)
  {

    goto LABEL_65;
  }

  uint64_t v118 = ne_log_obj(v94, v95);
  unsigned int v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
  {
    v247 = (void *)objc_opt_class(a1);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v247;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v83;
    id v248 = v247;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v119,  OS_LOG_TYPE_DEBUG,  "%@ removing configuration for network [%@]",  buf,  0x16u);
  }

  WiFiManagerClientRemoveNetwork(v45, v91);
  if (WiFiNetworkIsHotspot(v91))
  {
    __int128 v120 = (const __CFArray *)WiFiManagerClientCopyDevices(v45);
    uint64_t v268 = (uint64_t)v120;
    if (v120 && (v122 = v120, (__int128 v120 = (const __CFArray *)CFArrayGetCount(v120)) != 0LL))
    {
      uint64_t v123 = CFArrayGetValueAtIndex(v122, 0LL);
      uint64_t v124 = WiFiDeviceClientDisassociate(v123, 0LL);
      if ((_DWORD)v124)
      {
        int v126 = v124;
        uint64_t v127 = ne_log_obj(v124, v125);
        id v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          __int128 v129 = (void *)objc_opt_class(a1);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v129;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v126;
          id v130 = v129;
          v131 = "%@ WiFiDeviceClientDisassociate failed: %d";
          v132 = v128;
          uint32_t v133 = 18;
          goto LABEL_185;
        }

        goto LABEL_129;
      }
    }

    else
    {
      uint64_t v161 = ne_log_obj(v120, v121);
      id v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v161);
      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
      {
        __int128 v253 = (void *)objc_opt_class(a1);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v253;
        id v130 = v253;
        v131 = "%@ WiFiManagerClientCopyDevices() failed (No Wi-Fi devices found).";
        v132 = v128;
        uint32_t v133 = 12;
LABEL_185:
        _os_log_error_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_ERROR, v131, buf, v133);
      }

LABEL_129:
    }
  }

LABEL_131:
  myCFRelease(&v268);
  myCFRelease(&length);
LABEL_132:

LABEL_133:
  BOOL v34 = 1;
LABEL_74:

LABEL_75:
  return v34;
}

uint64_t sub_10000A7E0(int a1)
{
  uint64_t v1 = qword_10003EB28;
  if (a1 || !qword_10003EB28)
  {
    if (qword_10003EB28)
    {
      WiFiManagerClientRegisterServerRestartCallback(qword_10003EB28, 0LL, 0LL);
      CFRunLoopRef Main = CFRunLoopGetMain();
      WiFiManagerClientUnscheduleFromRunLoop(v1, Main, kCFRunLoopDefaultMode);
    }

    myCFRelease(&qword_10003EB28);
    uint64_t v3 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
    uint64_t v1 = v3;
    qword_10003EB28 = v3;
    if (v3)
    {
      WiFiManagerClientRegisterServerRestartCallback(v3, sub_10000A8FC, 0LL);
      CFRunLoopRef v4 = CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop(v1, v4, kCFRunLoopDefaultMode);
      return qword_10003EB28;
    }
  }

  return v1;
}

uint64_t sub_10000A8A0(uint64_t a1)
{
  uint64_t result = WiFiNetworkGetHS20DomainName(a1);
  if (!result) {
    return WiFiNetworkGetProperty(a1, kWiFiDomainName);
  }
  return result;
}

id sub_10000A8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = ne_log_obj(a1, a2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "[NEHelperHotspotConfigurationManager] WiFiManager restarted",  v5,  2u);
  }

  sub_10000A7E0(1LL);
  id result = [(id)qword_10003EB18 count];
  if (result)
  {
    [(id)qword_10003EB18 enumerateKeysAndObjectsUsingBlock:&stru_100034CA8];
    return [(id)qword_10003EB18 removeAllObjects];
  }

  return result;
}

void sub_10000A990(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a3;
  id v11 = a2;
  id v6 = a2;
  myCFRelease(&v11);
  if (v5) {
    id Property = objc_getProperty(v5, v7, 24LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v9 = Property;
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v10, "MessageType", 0x3ECuLL);
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v9, 107LL, v10);
}

uint64_t sub_10000AA48(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  *(void *)(a1 + 8)));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appState]);
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 applicationType]);
    unsigned __int8 v6 = [v5 isEqualToString:LSSystemApplicationType];

    if ((v6 & 1) == 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 applicationType]);
      [v7 isEqualToString:LSUserApplicationType];

LABEL_7:
      uint64_t v8 = 0LL;
      goto LABEL_8;
    }
  }

  else if (![*(id *)(a1 + 8) length] {
         || ([*(id *)(a1 + 8) hasPrefix:@"com.apple."] & 1) == 0)
  }
  {
    goto LABEL_7;
  }

  uint64_t v8 = 1LL;
LABEL_8:

  return v8;
}

void sub_10000AB2C(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v6 = ne_log_obj(a1, a2);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = @"User has given consent, network added and joined successfully.";
    switch(a3)
    {
      case 0u:
        break;
      case 1u:
        uint64_t v8 = @"User did NOT given consent.";
        break;
      case 2u:
        uint64_t v8 = @"System has cancelled the popup or it timed out.";
        break;
      case 3u:
        uint64_t v8 = @"Request failed, already asking the user for consent.";
        break;
      case 4u:
        uint64_t v8 = @"Request failed, invalid bundle ID.";
        break;
      case 5u:
        uint64_t v8 = @"Request failed, existing network that cannot be overwritten.";
        break;
      case 6u:
        uint64_t v8 = @"Request succeed, already associated to that network.";
        break;
      case 7u:
        uint64_t v8 = @"Added to known networks, but association failed.";
        break;
      case 8u:
        uint64_t v8 = @"Session based add failed, application is not in foreground.";
        break;
      case 9u:
        uint64_t v8 = @"Request failed, network not found.";
        break;
      default:
        if (a3 == 0x7FFFFFFF) {
          uint64_t v8 = @"Request failed, unknown error.";
        }
        else {
          uint64_t v8 = @"unknown";
        }
        break;
    }

    *(_DWORD *)buf = 67109378;
    *(_DWORD *)uint64_t v48 = a3;
    *(_WORD *)&v48[4] = 2112;
    *(void *)&v48[6] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[NEHelperHotspotConfigurationManager] add network callback callled, result: [%d][%@]",  buf,  0x12u);
  }

  if ([(id)qword_10003EB18 count])
  {
    uint64_t v45 = a4;
    id v10 = a4;
    objc_opt_self(&OBJC_CLASS___NEHelperHotspotConfigurationTask);
    if (v10)
    {
      id v11 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003EB18, "objectForKeyedSubscript:", v10, v45));
      [(id)qword_10003EB18 removeObjectForKey:v10];
    }

    else
    {
      id v11 = 0LL;
    }

    uint64_t v13 = myCFRelease(&v45);
    if (!v11)
    {
      uint64_t v25 = ne_log_obj(v13, v14);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "[NEHelperHotspotConfigurationManager] failed to find the task object",  buf,  2u);
      }

      goto LABEL_47;
    }

    uint64_t v15 = (os_log_s *)objc_getProperty(v11, v14, 24LL, 1);
    xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v16, "MessageType", 0x3ECuLL);
    if (a3 != 7 && a3)
    {
      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v15, a3, v16);
    }

    else
    {
      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v15, 0LL, v16);
      if ((v11[8] & 1) == 0)
      {
        id v18 = objc_getProperty(v11, v17, 32LL, 1);
        uint64_t v19 = objc_opt_self(&OBJC_CLASS___NEHelperHotspotConfigurationTask);
        uint64_t v20 = SCPreferencesCreate( kCFAllocatorDefault,  @"nehelper",  @"/Library/Preferences/com.apple.networkextension.hotspot-configuration.plist");
        uint64_t v46 = v20;
        if (!v20)
        {
          uint64_t v26 = ne_log_obj(0LL, v21);
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
          uint64_t v27 = (void *)objc_opt_class(v19);
          *(_DWORD *)buf = 138412290;
          *(void *)uint64_t v48 = v27;
          id v28 = v27;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%@ failed to create hotspot configuration preference file.",  buf,  0xCu);
LABEL_44:

          goto LABEL_45;
        }

        __int16 v22 = v20;
        CFPropertyListRef Value = SCPreferencesGetValue(v20, @"bundle-ids");
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Value);
        if (isa_nsarray())
        {
          if (-[os_log_s containsObject:](v24, "containsObject:", v18))
          {
            myCFRelease(&v46);
LABEL_45:

            goto LABEL_46;
          }

          uint64_t v29 = (NSMutableArray *)-[os_log_s mutableCopy](v24, "mutableCopy");
        }

        else
        {
          uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        }

        id v28 = v29;
        -[NSMutableArray addObject:](v29, "addObject:", v18, v45, v46);
        uint64_t v30 = SCPreferencesSetValue(v22, @"bundle-ids", v28);
        if ((_DWORD)v30)
        {
          uint64_t v32 = SCPreferencesCommitChanges(v22);
          if ((_DWORD)v32)
          {
LABEL_43:
            myCFRelease(&v46);
            goto LABEL_44;
          }

          uint64_t v34 = ne_log_obj(v32, v33);
          id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = (void *)objc_opt_class(v19);
            id v37 = v36;
            int v38 = SCError();
            uint64_t v39 = SCErrorString(v38);
            *(_DWORD *)buf = 138412546;
            *(void *)uint64_t v48 = v36;
            *(_WORD *)&v48[8] = 2080;
            *(void *)&v48[10] = v39;
            id v40 = "%@ SCPreferencesCommitChanges failed: %s";
LABEL_50:
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v40, buf, 0x16u);
          }
        }

        else
        {
          uint64_t v41 = ne_log_obj(v30, v31);
          id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            id v42 = (void *)objc_opt_class(v19);
            id v37 = v42;
            int v43 = SCError();
            uint64_t v44 = SCErrorString(v43);
            *(_DWORD *)buf = 138412546;
            *(void *)uint64_t v48 = v42;
            *(_WORD *)&v48[8] = 2080;
            *(void *)&v48[10] = v44;
            id v40 = "%@ SCPreferencesSetValue failed: %s";
            goto LABEL_50;
          }
        }

        goto LABEL_43;
      }
    }

LABEL_46:
LABEL_47:
    goto LABEL_48;
  }

  uint64_t v12 = ne_log_obj(0LL, v9);
  id v11 = (_BYTE *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_INFO,  "[NEHelperHotspotConfigurationManager] there are no pending tasks",  buf,  2u);
  }

LABEL_48:
}

void sub_10000B08C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v2 = (void *)qword_10003EB18;
  qword_10003EB18 = (uint64_t)v1;
}

void sub_10000B0C8(uint64_t a1)
{
  uint64_t v2 = objc_opt_self(&OBJC_CLASS___NEHelperHotspotConfigurationTask);
  uint64_t v3 = SCPreferencesCreate( kCFAllocatorDefault,  @"nehelper",  @"/Library/Preferences/com.apple.networkextension.hotspot-configuration.plist");
  uint64_t v51 = (uint64_t)v3;
  if (v3)
  {
    CFPropertyListRef Value = SCPreferencesGetValue(v3, @"bundle-ids");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
    else {
      id v7 = 0LL;
    }
    myCFRelease(&v51);
    id v10 = v7;

    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = objc_opt_self(&OBJC_CLASS___NEHelperHotspotConfigurationTask);
    uint64_t v13 = SCPreferencesCreate( kCFAllocatorDefault,  @"nehelper",  @"/Library/Preferences/com.apple.networkextension.hotspot-configuration.plist");
    uint64_t v51 = (uint64_t)v13;
    if (!v13)
    {
      uint64_t v30 = ne_log_obj(0LL, v14);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      uint64_t v31 = (void *)objc_opt_class(v12);
      *(_DWORD *)buf = 138412290;
      id v53 = v31;
      id v18 = v31;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@ failed to create hotspot configuration preference file.",  buf,  0xCu);
LABEL_23:

LABEL_24:
      uint64_t v34 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
      uint64_t v51 = v34;
      if (v34)
      {
        uint64_t v36 = WiFiManagerClientRemoveNetworksWithBundleIdentifier(v34, *(void *)(a1 + 32));
        uint64_t v38 = ne_log_obj(v36, v37);
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          id v40 = (void *)objc_opt_class(*(void *)(a1 + 40));
          uint64_t v41 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          id v53 = v40;
          __int16 v54 = 2112;
          uint64_t v55 = v41;
          id v42 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "%@ removed all networks matching the bundle identifier [%@]",  buf,  0x16u);
        }

        myCFRelease(&v51);
      }

      else
      {
        uint64_t v43 = ne_log_obj(0LL, v35);
        uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          uint64_t v45 = (void *)objc_opt_class(*(void *)(a1 + 40));
          uint64_t v46 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          id v53 = v45;
          __int16 v54 = 2112;
          uint64_t v55 = v46;
          id v47 = v45;
          _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%@ failed to get WiFiManager client, unable to remove networks matching bundle identifier [%@]",  buf,  0x16u);
        }
      }

      goto LABEL_31;
    }

    uint64_t v15 = v13;
    CFPropertyListRef v16 = SCPreferencesGetValue(v13, @"bundle-ids");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!isa_nsarray(v17) || !-[os_log_s containsObject:](v17, "containsObject:", v11))
    {
      myCFRelease(&v51);
      goto LABEL_24;
    }

    id v18 = -[os_log_s mutableCopy](v17, "mutableCopy");
    [v18 removeObject:v11];
    uint64_t v19 = SCPreferencesSetValue(v15, @"bundle-ids", v18);
    if ((_DWORD)v19)
    {
      uint64_t v21 = SCPreferencesCommitChanges(v15);
      if ((_DWORD)v21)
      {
LABEL_22:
        myCFRelease(&v51);
        goto LABEL_23;
      }

      uint64_t v23 = ne_log_obj(v21, v22);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = (void *)objc_opt_class(v12);
        id v26 = v25;
        int v27 = SCError();
        id v28 = SCErrorString(v27);
        *(_DWORD *)buf = 138412546;
        id v53 = v25;
        __int16 v54 = 2080;
        uint64_t v55 = v28;
        uint64_t v29 = "%@ SCPreferencesCommitChanges failed: %s";
LABEL_33:
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v29, buf, 0x16u);
      }
    }

    else
    {
      uint64_t v33 = ne_log_obj(v19, v20);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = (void *)objc_opt_class(v12);
        id v26 = v48;
        int v49 = SCError();
        uint64_t v50 = SCErrorString(v49);
        *(_DWORD *)buf = 138412546;
        id v53 = v48;
        __int16 v54 = 2080;
        uint64_t v55 = v50;
        uint64_t v29 = "%@ SCPreferencesSetValue failed: %s";
        goto LABEL_33;
      }
    }

    goto LABEL_22;
  }

  uint64_t v8 = ne_log_obj(0LL, v4);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = (id)objc_opt_class(v2);
    id v32 = v53;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ failed to create hotspot configuration preference file.",  buf,  0xCu);
  }

  id v10 = 0LL;
LABEL_31:
}

LABEL_14:
    CFPropertyListRef v16 = 22LL;
    goto LABEL_15;
  }

  if (uint64 != 2)
  {
    if (uint64 == 1)
    {
      uint64_t v4 = xpc_dictionary_get_string(xdict, "app-bundle-id");
      if (v4)
      {
        id v5 = xpc_string_create(v4);
        uint64_t v6 = xpc_array_create(0LL, 0LL);
        xpc_array_append_value(v6, v5);
        id v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_value(v7, (const char *)[@"bundleIDs" UTF8String], v6);
        uint64_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
        uint64_t v9 = v8;
        id v10 = _xpc_event_key_name;
        id v11 = "ApplicationUninstalled";
LABEL_8:
        xpc_dictionary_set_string(v8, v10, v11);
        xpc_dictionary_set_value(v9, "UserInfo", v7);
        uint64_t v13 = sub_10000F110((uint64_t)&OBJC_CLASS___NEHelperServer);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        sub_10000F460(v14, v9, "com.apple.distnoted.matching");

        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }

  uint64_t v15 = xpc_dictionary_get_string(xdict, "app-bundle-id");
  if (!v15) {
    goto LABEL_14;
  }
  if (!*v15)
  {
    sub_10001D640((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager, 0LL);
    goto LABEL_13;
  }

  id v5 = (xpc_object_t)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
  sub_10001D640((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager, v5);
LABEL_12:

LABEL_13:
  CFPropertyListRef v16 = 0LL;
LABEL_15:
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, xdict, v16, 0LL);
}

uint64_t sub_10000B8E4(const char *a1, int32_t a2, char *a3, int32_t a4)
{
  UErrorCode pErrorCode = U_ZERO_ERROR;
  UIDNAInfo v15 = (UIDNAInfo)xmmword_1000274F0;
  uint64_t v8 = uidna_openUTS46(0x22u, &pErrorCode);
  uint64_t v9 = uidna_nameToASCII_UTF8(v8, a1, a2, a3, a4, &v15, &pErrorCode);
  uidna_close(v8);
  if (pErrorCode)
  {
    uint64_t v12 = (os_log_s *)ne_log_obj(v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = a1;
      __int16 v19 = 1024;
      unsigned __int32 errors = pErrorCode;
      uint64_t v13 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed errorCode %d";
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
      return 0LL;
    }

    return 0LL;
  }

  if (v15.errors)
  {
    uint64_t v12 = (os_log_s *)ne_log_obj(v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = a1;
      __int16 v19 = 1024;
      unsigned __int32 errors = v15.errors;
      uint64_t v13 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed info.errors 0x%08X";
      goto LABEL_9;
    }

    return 0LL;
  }

  return v9;
}

LABEL_84:
    sub_10000C93C((uint64_t)self, v15);
LABEL_85:
  }

LABEL_86:
}

          close(v53);
          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, v78, 0LL);
LABEL_149:

LABEL_150:
          _Block_object_dispose(&v142, 8);
          _Block_object_dispose(&length, 8);
          goto LABEL_151;
        }

        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472LL;
        applier[2] = sub_100013F54;
        applier[3] = &unk_100034FA8;
        id v141 = v53;
        uint64_t v98 = v4;
        id v138 = v98;
        id v139 = &length;
        uint64_t v140 = &v142;
        xpc_array_apply(v77, applier);
        if (connect(v53, (const sockaddr *)&v150, 0x20u))
        {
          xpc_object_t v99 = *__error();
          uint64_t v100 = strerror_r(v99, __strerrbuf, 0x80uLL);
          if ((_DWORD)v100) {
            __strerrbuf[0] = 0;
          }
          uint64_t v102 = ne_log_obj(v100, v101);
          uint64_t v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v156 = 67109378;
            *(_DWORD *)&v156[4] = v99;
            *(_WORD *)&v156[8] = 2080;
            *(void *)&v156[10] = __strerrbuf;
            _os_log_error_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_ERROR,  "connect failed on kernel control socket: [%d] %s",  v156,  0x12u);
          }

          close(v53);
          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v98, v99, 0LL);

          goto LABEL_149;
        }
      }

      else if (connect(v53, (const sockaddr *)&v150, 0x20u))
      {
        uint64_t v78 = *__error();
        id v83 = strerror_r(v78, __strerrbuf, 0x80uLL);
        if ((_DWORD)v83) {
          __strerrbuf[0] = 0;
        }
        uint64_t v85 = ne_log_obj(v83, v84);
        uint64_t v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v156 = 67109378;
          *(_DWORD *)&v156[4] = v78;
          *(_WORD *)&v156[8] = 2080;
          *(void *)&v156[10] = __strerrbuf;
          _os_log_error_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_ERROR,  "connect failed on kernel control socket: [%d] %s",  v156,  0x12u);
        }

        goto LABEL_86;
      }

      if (!*((_BYTE *)p_length + 24) && !*((_BYTE *)v143 + 24)) {
        goto LABEL_148;
      }
      memset(v156, 0, sizeof(v156));
      id v151 = 16;
      if (getsockopt(v53, 2, 2, v156, &v151))
      {
        uint64_t v114 = *__error();
        uint64_t v115 = strerror_r(v114, __strerrbuf, 0x80uLL);
        if ((_DWORD)v115) {
          __strerrbuf[0] = 0;
        }
        id v117 = ne_log_obj(v115, v116);
        uint64_t v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v152 = 67109378;
          *(_DWORD *)v153 = v114;
          *(_WORD *)&v153[4] = 2080;
          *(void *)&v153[6] = __strerrbuf;
          _os_log_error_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_ERROR,  "Failed to get the name of the new virtual interface: [%d] %s",  v152,  0x12u);
        }
      }

      else if (*((_BYTE *)p_length + 24) && (*(_DWORD *)&v156[16] = 1, ioctl(v53, 0xC02069D7uLL, v156)))
      {
        uint64_t v114 = *__error();
        unsigned int v119 = strerror_r(v114, __strerrbuf, 0x80uLL);
        if ((_DWORD)v119) {
          __strerrbuf[0] = 0;
        }
        uint64_t v121 = ne_log_obj(v119, v120);
        uint64_t v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v152 = 136315650;
          *(void *)v153 = v156;
          *(_WORD *)&v153[8] = 1024;
          *(_DWORD *)&v153[10] = v114;
          id v154 = 2080;
          id v155 = __strerrbuf;
          _os_log_error_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_ERROR,  "Failed to set SIOCSIFNOTRAFFICSHAPING to 1 for %s: [%d] %s",  v152,  0x1Cu);
        }
      }

      else
      {
        if (!*((_BYTE *)v143 + 24) || (v156[16] = 1, !ioctl(v53, 0xC02069DDuLL, v156)))
        {
LABEL_148:
          uint64_t v125 = xpc_fd_create(v53);
          close(v53);
          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 0LL, v125);

          goto LABEL_149;
        }

        uint64_t v114 = *__error();
        __int128 v122 = strerror_r(v114, __strerrbuf, 0x80uLL);
        if ((_DWORD)v122) {
          __strerrbuf[0] = 0;
        }
        uint64_t v124 = ne_log_obj(v122, v123);
        uint64_t v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v152 = 136315650;
          *(void *)v153 = v156;
          *(_WORD *)&v153[8] = 1024;
          *(_DWORD *)&v153[10] = v114;
          id v154 = 2080;
          id v155 = __strerrbuf;
          _os_log_error_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_ERROR,  "Failed to set SIOCSIFDIRECTLINK to 1 for %s: [%d] %s",  v152,  0x1Cu);
        }
      }

      close(v53);
      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, v114, 0LL);
      goto LABEL_149;
    case 4uLL:
      UIDNAInfo v15 = necp_session_open(0LL);
      if (v15 < 0)
      {
        __int128 v62 = *__error();
        __int128 v63 = strerror_r(v62, __strerrbuf, 0x80uLL);
        if ((_DWORD)v63) {
          __strerrbuf[0] = 0;
        }
        __int128 v65 = ne_log_obj(v63, v64);
        uint64_t v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v62;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = __strerrbuf;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_FAULT,  "Cannot create necp session fd: [%d] %s",  buf,  0x12u);
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, v62, 0LL);
      }

      else
      {
        CFPropertyListRef v16 = v15;
        id v17 = xpc_fd_create(v15);
        close(v16);
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 0LL, v17);
      }

      goto LABEL_151;
    default:
      id v47 = (const char *)uint64;
      uint64_t v48 = ne_log_obj(uint64, v6);
      int v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        uint64_t v164 = v47;
        _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "NEHelperSocketFactory received invalid socketType %llu",  (uint8_t *)__strerrbuf,  0xCu);
      }

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 22LL, 0LL);
      goto LABEL_151;
  }

void sub_10000C93C(uint64_t a1, void *a2)
{
  if (a1 && a2)
  {
    id v3 = a2;
    uint64_t v4 = *(void *)(a1 + 16);
    if (!v4)
    {
      sub_10000D114(a1, v3, 0LL);
LABEL_26:

      myCFRelease(a1 + 16);
      uint64_t v20 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0LL;

      return;
    }

    int v5 = *(unsigned __int8 *)(a1 + 24);
    CFNumberRef v21 = 0LL;
    id Property = (void *)WiFiNetworkGetProperty(v4, @"BSSID");
    SSIDData = (void *)WiFiNetworkGetSSIDData(v4);
    SSID = (void *)WiFiNetworkGetSSID(v4);
    if (v5)
    {
      if (WiFiNetworkIsEAP(v4))
      {
        int v9 = 3;
      }

      else if (WiFiNetworkIsWPAWPA2PSK(v4) || WiFiNetworkIsSAE(v4))
      {
        int v9 = 2;
      }

      else if (WiFiNetworkIsWEP(v4))
      {
        int v9 = 1;
      }

      else
      {
        int v9 = 4 * (WiFiNetworkIsOpen(v4) == 0);
      }

      *(_DWORD *)valuePtr = v9;
      CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, valuePtr);
      CFNumberRef v21 = v10;
      if (!Property) {
        goto LABEL_19;
      }
    }

    else
    {
      CFNumberRef v10 = 0LL;
      if (!Property) {
        goto LABEL_19;
      }
    }

    if (SSIDData && SSID)
    {
      *(void *)valuePtr = kCNNetworkInfoKeySSIDData;
      *(void *)&valuePtr[8] = kCNNetworkInfoKeySSID;
      *(void *)&valuePtr[16] = kCNNetworkInfoKeyBSSID;
      uint64_t v25 = 0LL;
      values[0] = SSIDData;
      values[1] = SSID;
      values[2] = Property;
      CFNumberRef v23 = 0LL;
      if (v10)
      {
        uint64_t v25 = @"wifi-security-type";
        CFNumberRef v23 = v10;
        CFIndex v11 = 4LL;
      }

      else
      {
        CFIndex v11 = 3LL;
      }

      CFDictionaryRef v14 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)valuePtr,  (const void **)values,  v11,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      uint64_t v12 = myCFRelease(&v21);
      values[0] = v14;
      if (v14)
      {
        CFDictionaryRef v14 = (CFDictionaryRef)_CFXPCCreateXPCObjectFromCFObject(v14);
        uint64_t v12 = myCFRelease(values);
      }

      goto LABEL_23;
    }

LABEL_19:
    uint64_t v12 = myCFRelease(&v21);
    CFDictionaryRef v14 = 0LL;
    values[0] = 0LL;
LABEL_23:
    uint64_t v15 = ne_log_obj(v12, v13);
    CFPropertyListRef v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = (void *)objc_opt_class(a1);
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)valuePtr = 138412546;
      *(void *)&valuePtr[4] = v17;
      *(_WORD *)&valuePtr[12] = 2112;
      *(void *)&valuePtr[14] = v18;
      id v19 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%@ sending actual Wi-Fi info to [%@]",  valuePtr,  0x16u);
    }

    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v3, 0LL, v14);
    goto LABEL_26;
  }

    goto LABEL_20;
  }

  uint64_t v13 = ne_force_reset_uuid_cache();
  if (dword_10003E8FC != -1) {
    goto LABEL_14;
  }
  uint64_t v13 = notify_register_check("com.apple.networkextension.uuidcache", &dword_10003E8FC);
  if ((_DWORD)v13)
  {
    uint64_t v15 = v13;
    dword_10003E8FC = -1;
    CFPropertyListRef v16 = ne_log_obj(v13, v14);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      CFNumberRef v23 = "com.apple.networkextension.uuidcache";
      id v24 = 1024;
      uint64_t v25 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to register for %s notifications: %u",  buf,  0x12u);
    }
  }

  if (dword_10003E8FC != -1)
  {
LABEL_14:
    ++qword_10003EC10;
    uint64_t v18 = ne_log_obj(v13, v14);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      CFNumberRef v23 = (const char *)qword_10003EC10;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Setting UUID cache generation to %llu",  buf,  0xCu);
    }

    if (!notify_set_state(dword_10003E8FC, qword_10003EC10)) {
      notify_post("com.apple.networkextension.uuidcache");
    }
  }

void sub_10000CC34(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t v4 = ne_log_obj(a1, a2);
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      id v8 = (id)objc_opt_class(*(void *)(a1 + 32));
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v7, 32LL, 1);
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = Property;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%@ [%@] has an active VPN or DNS configuration",  buf,  0x16u);
    }

    sub_10000C93C(*(void *)(a1 + 32), *(void **)(a1 + 40));
  }

  else
  {
    if (v6)
    {
      id v11 = (id)objc_opt_class(*(void *)(a1 + 32));
      id v12 = *(id *)(a1 + 32);
      if (v12) {
        id v12 = objc_getProperty(v12, v10, 32LL, 1);
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%@ [%@] has no active VPN or DNS configuration",  buf,  0x16u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    unsigned int v14 = [v13 isVersion:*(void *)(a1 + 48) greaterThanOrEqualToVersion:@"13.0"];

    uint64_t v17 = ne_log_obj(v15, v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v19)
      {
        id v21 = (id)objc_opt_class(*(void *)(a1 + 32));
        id v22 = *(id *)(a1 + 32);
        if (v22) {
          id v22 = objc_getProperty(v22, v20, 32LL, 1);
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%@ [%@] is linked on or above iOS 13.0, retuning nil",  buf,  0x16u);
      }

      sub_10000D114(*(void *)(a1 + 32), *(void **)(a1 + 40), 1LL);
    }

    else
    {
      if (v19)
      {
        id v24 = (id)objc_opt_class(*(void *)(a1 + 32));
        id v25 = *(id *)(a1 + 32);
        if (v25) {
          id v25 = objc_getProperty(v25, v23, 32LL, 1);
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%@ returning pseudo Wi-Fi information to [%@]",  buf,  0x16u);
      }

      uint64_t v26 = *(void *)(a1 + 32);
      uint64_t v27 = (uint64_t)*(id *)(a1 + 40);
      uint64_t v29 = (void *)v27;
      if (v26)
      {
        if (!qword_10003EB38)
        {
          if ((byte_10003EB30 & 1) == 0)
          {
            byte_10003EB30 = 1;
            uint64_t v30 = &_CPGetDeviceRegionCode;
            if (&_CPGetDeviceRegionCode)
            {
              uint64_t v27 = CPGetDeviceRegionCode();
              uint64_t v31 = v27;
              if (v27)
              {
                uint64_t v27 = CFEqual((CFTypeRef)v27, @"CH");
                LOBYTE(v30) = (_DWORD)v27 != 0;
              }

              else
              {
                LOBYTE(v30) = 0;
              }
            }

            else
            {
              uint64_t v31 = 0LL;
            }

            byte_10003EB31 = (char)v30;
            uint64_t v32 = ne_log_obj(v27, v28);
            uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v31;
              _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "region code is %@", buf, 0xCu);
            }
          }

          if (byte_10003EB31) {
            uint64_t v34 = @"WLAN";
          }
          else {
            uint64_t v34 = @"Wi-Fi";
          }
          CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(kCFAllocatorDefault, v34, 0x8000100u, 0);
          if (ExternalRepresentation)
          {
            CFDataRef v36 = ExternalRepresentation;
            *(void *)buf = kCNNetworkInfoKeySSIDData;
            *(void *)&buf[8] = kCNNetworkInfoKeySSID;
            *(void *)&buf[16] = kCNNetworkInfoKeyBSSID;
            values[0] = ExternalRepresentation;
            values[1] = (void *)v34;
            values[2] = @"00:00:00:00:00:00";
            qword_10003EB38 = (uint64_t)CFDictionaryCreate( kCFAllocatorDefault,  (const void **)buf,  (const void **)values,  3LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            CFRelease(v36);
          }
        }

        uint64_t v37 = (void *)_CFXPCCreateXPCObjectFromCFObject(qword_10003EB38);
        uint64_t v39 = ne_log_obj(v37, v38);
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          uint64_t v41 = (void *)objc_opt_class(v26);
          uint64_t v42 = *(void *)(v26 + 32);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v41;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v42;
          id v43 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "%@ sending pseudo Wi-Fi info to [%@]",  buf,  0x16u);
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v29, 0LL, v37);
        myCFRelease(v26 + 16);
        uint64_t v44 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = 0LL;
      }
    }
  }

void sub_10000D114(uint64_t a1, void *a2, int64_t a3)
{
  id v5 = a2;
  id v7 = v5;
  if (a1)
  {
    if (v5)
    {
      uint64_t v8 = ne_log_obj(v5, v6);
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFNumberRef v10 = (void *)objc_opt_class(a1);
        uint64_t v11 = *(void *)(a1 + 32);
        int v14 = 138412802;
        uint64_t v15 = v10;
        __int16 v16 = 2048;
        int64_t v17 = a3;
        __int16 v18 = 2112;
        uint64_t v19 = v11;
        id v12 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@ sending result code %lld to [%@]",  (uint8_t *)&v14,  0x20u);
      }

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v7, a3, 0LL);
    }

    myCFRelease(a1 + 16);
    uint64_t v13 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0LL;
  }
}

void sub_10000D238(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a2;
  id v27 = a3;
  id v26 = a5;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v12) {
    goto LABEL_29;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v31;
  id v28 = v11;
  do
  {
    uint64_t v15 = 0LL;
    do
    {
      if (*(void *)v31 != v14) {
        objc_enumerationMutation(v11);
      }
      __int16 v16 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v15);
      int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "VPN", v26, v27));
      if (v17
        && (id v5 = (void *)objc_claimAutoreleasedReturnValue([v16 VPN]),
            ([v5 isEnabled] & 1) != 0))
      {
        int v18 = 0;
      }

      else
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 dnsSettings]);
        if (!v19)
        {
          if (v17) {

          }
          id v7 = 0LL;
          goto LABEL_25;
        }

        id v7 = (void *)v19;
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v16 dnsSettings]);
        if (![v6 isEnabled])
        {
          unsigned int v24 = 0;
          goto LABEL_23;
        }

        int v18 = 1;
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 applicationIdentifier]);
      id v22 = *(void **)(a1 + 32);
      if (v22) {
        id Property = objc_getProperty(v22, v20, 32LL, 1);
      }
      else {
        id Property = 0LL;
      }
      unsigned int v24 = [v21 isEqual:Property];

      if (!v18)
      {
        id v11 = v28;
        if (!v17) {
          goto LABEL_17;
        }
        goto LABEL_24;
      }

      id v11 = v28;
LABEL_23:

      if (!v17)
      {
LABEL_17:

        if (v24) {
          goto LABEL_30;
        }
        goto LABEL_25;
      }

LABEL_24:
      if ((v24 & 1) != 0)
      {
LABEL_30:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();

        goto LABEL_31;
      }

LABEL_25:
      uint64_t v15 = (char *)v15 + 1;
    }

    while (v13 != v15);
    id v25 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    id v13 = v25;
  }

  while (v25);
LABEL_29:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
LABEL_31:
}

  id v26 = v13;
  id v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) contentFilter]);

  if (v27)
  {
    id v12 = "APP_WARNING_HEADER_FILTER";
    id v26 = "APP_WARNING_FILTER";
    uint64_t v14 = @"content filter";
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) relay]);

  if (v28)
  {
    id v12 = "APP_WARNING_HEADER_RELAY";
    id v13 = "APP_WARNING_RELAY";
    uint64_t v14 = @"Relay";
  }

  else
  {
    id v13 = v26;
  }

void sub_10000D490(id a1)
{
  byte_10003EB48 = os_variant_has_internal_diagnostics("com.apple.captive");
}

void sub_10000D4B4(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 40LL, 1);
  }
  id v4 = Property;
  uint64_t v5 = sub_10000D708(0);
  if (!v5)
  {
    uint64_t v13 = ne_log_obj(0LL, v6);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      CFNumberRef v23 = "[NEHelperWiFiInfoManager] Failed to get WiFi Manager Client instance";
      unsigned int v24 = buf;
      goto LABEL_26;
    }

    goto LABEL_9;
  }

  uint64_t v7 = v5;
  uint64_t v8 = WiFiManagerClientCopyCurrentSessionBasedNetwork();
  if (!v8)
  {
    if (v4)
    {
      uint64_t Device = WiFiManagerClientGetDevice(v7, v4);
      if (Device)
      {
        uint64_t v10 = WiFiDeviceClientCopyCurrentNetwork(Device);
        goto LABEL_10;
      }

      uint64_t v22 = ne_log_obj(0LL, v16);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      CFNumberRef v23 = "[NEHelperWiFiInfoManager] WiFiManagerClientGetDevice for %@ returned NULL";
      unsigned int v24 = buf;
      id v25 = v14;
      uint32_t v26 = 12;
      goto LABEL_27;
    }

    uint64_t v17 = sub_10000D708(0);
    if (v17)
    {
      uint64_t v19 = (const __CFArray *)WiFiManagerClientCopyDevices(v17);
      *(void *)buf = v19;
      if (v19)
      {
        uint64_t v20 = v19;
        if (CFArrayGetCount(v19))
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v20, 0LL);
          uint64_t v10 = WiFiDeviceClientCopyCurrentNetwork(ValueAtIndex);
          CFRelease(v20);
          goto LABEL_10;
        }
      }

      uint64_t v27 = myCFRelease(buf);
      uint64_t v29 = ne_log_obj(v27, v28);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      __int16 v31 = 0;
      CFNumberRef v23 = "[NEHelperWiFiInfoManager] WiFiManagerClientCopyDevices() returned no devices";
      goto LABEL_24;
    }

    uint64_t v30 = ne_log_obj(0LL, v18);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = 0;
      CFNumberRef v23 = "[NEHelperWiFiInfoManager] Failed to get WiFi Manager Client instance";
LABEL_24:
      unsigned int v24 = (uint8_t *)&v31;
LABEL_26:
      id v25 = v14;
      uint32_t v26 = 2;
LABEL_27:
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v23, v24, v26);
    }

LABEL_9:
    uint64_t v10 = 0LL;
    goto LABEL_10;
  }

  uint64_t v10 = v8;
  uint64_t v11 = ne_log_obj(v8, v9);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[NEHelperWiFiInfoManager] currently associated to a session based Wi-Fi network",  buf,  2u);
  }

LABEL_10:
  *(void *)(*(void *)(a1 + 32) + 16LL) = v10;
}

uint64_t sub_10000D708(int a1)
{
  uint64_t v1 = qword_10003EB40;
  if (a1 || !qword_10003EB40)
  {
    if (qword_10003EB40)
    {
      WiFiManagerClientRegisterServerRestartCallback(qword_10003EB40, 0LL, 0LL);
      CFRunLoopRef Main = CFRunLoopGetMain();
      WiFiManagerClientUnscheduleFromRunLoop(v1, Main, kCFRunLoopDefaultMode);
    }

    myCFRelease(&qword_10003EB40);
    uint64_t v3 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
    uint64_t v1 = v3;
    qword_10003EB40 = v3;
    if (v3)
    {
      WiFiManagerClientRegisterServerRestartCallback(v3, sub_10000D7C8, 0LL);
      CFRunLoopRef v4 = CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop(v1, v4, kCFRunLoopDefaultMode);
      return qword_10003EB40;
    }
  }

  return v1;
}

uint64_t sub_10000D7C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = ne_log_obj(a1, a2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "[NEHelperWiFiInfoManager] WiFiManager restarted",  v5,  2u);
  }

  return sub_10000D708(1LL);
}

void sub_10000D8D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v12 = v3;
    BOOL v4 = xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection;
    id v3 = v12;
    if (v4)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      id v6 = v12;
      uint64_t v7 = v6;
      if (v5)
      {
        uint64_t v14 = 0LL;
        uint64_t v15 = &v14;
        uint64_t v16 = 0x3032000000LL;
        uint64_t v17 = sub_10000DA10;
        uint64_t v18 = sub_10000DA20;
        id v8 = v6;
        id v19 = v8;
        uint64_t v10 = (dispatch_queue_s *)objc_getProperty(v5, v9, 24LL, 1);
        xpc_connection_set_target_queue((xpc_connection_t)v8, v10);

        uint64_t v11 = (_xpc_connection_s *)v15[5];
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_10000DA28;
        handler[3] = &unk_100034D98;
        handler[4] = v5;
        handler[5] = &v14;
        xpc_connection_set_event_handler(v11, handler);
        xpc_connection_resume((xpc_connection_t)v15[5]);
        _Block_object_dispose(&v14, 8);
      }

      id v3 = v12;
    }
  }
}

void sub_10000D9F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000DA10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000DA20(uint64_t a1)
{
}

void sub_10000DA28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = v3;
  if (!v3 || xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    id v6 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (v6)
    {
      xpc_connection_cancel(v6);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0LL;
    }

    else
    {
      uint64_t v9 = ne_log_obj(0LL, v4);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buffer[0]) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "XPC connection is nil when handling first message",  (uint8_t *)buffer,  2u);
      }
    }

    goto LABEL_38;
  }

  unsigned int uint64 = xpc_dictionary_get_uint64(v5, "delegate-class-id");
  if (uint64)
  {
    id v12 = (objc_class *)sub_10000E434((uint64_t)&OBJC_CLASS___NEHelperServer, uint64);
    if (v12)
    {
      uint64_t v14 = v12;
      id v15 = -[objc_class conformsToProtocol:](v12, "conformsToProtocol:", &OBJC_PROTOCOL___NEHelperDelegate);
      if ((_DWORD)v15)
      {
        id v17 = [[v14 alloc] initWithFirstMessage:v5];
        if (v17)
        {
          id v19 = v17;
          uint64_t v96 = 0LL;
          uint64_t v97 = &v96;
          uint64_t v98 = 0x3032000000LL;
          xpc_object_t v99 = sub_10000DA10;
          uint64_t v100 = sub_10000DA20;
          unint64_t v20 = objc_alloc(&OBJC_CLASS___NEHelperClient);
          id v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
          uint64_t v22 = v21;
          id v91 = v19;
          if (v20)
          {
            v102.receiver = (id)v20;
            v102.super_class = (Class)&OBJC_CLASS___NEHelperClient;
            CFNumberRef v23 = (NEHelperClient *)objc_msgSendSuper2(&v102, "init");
            unint64_t v20 = (unint64_t)v23;
            if (v23)
            {
              objc_storeStrong((id *)&v23->_connection, v21);
              objc_storeStrong((id *)(v20 + 32), v19);
              *(_DWORD *)(v20 + _Block_object_dispose(va, 8) = uint64;
              pid_t pid = xpc_connection_get_pid(v22);
              *(void *)(v20 + 16) = (32LL * pid + uint64) ^ v20;
              int v25 = nelog_is_debug_logging_enabled() ^ 1;
              if ((v25 & 1) == 0)
              {
                __int128 v122 = 0u;
                __int128 v123 = 0u;
                __int128 v120 = 0u;
                __int128 v121 = 0u;
                __int128 v118 = 0u;
                __int128 v119 = 0u;
                __int128 v116 = 0u;
                __int128 v117 = 0u;
                __int128 v114 = 0u;
                __int128 v115 = 0u;
                __int128 v112 = 0u;
                __int128 v113 = 0u;
                __int128 v110 = 0u;
                __int128 v111 = 0u;
                memset(buffer, 0, sizeof(buffer));
                uint64_t v26 = proc_name(pid, buffer, 0x100u);
                uint64_t v28 = ne_log_obj(v26, v27);
                uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                uint64_t v30 = v29;
                if (uint64 == 2)
                {
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v104 = buffer;
                    __int16 v105 = 1024;
                    LODWORD(v106) = pid;
                    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Processing new Settings client connection from client %s pid %d",  buf,  0x12u);
                  }
                }

                else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  CFIndex v87 = (objc_class *)sub_10000E434((uint64_t)&OBJC_CLASS___NEHelperServer, uint64);
                  CFIndex v88 = NSStringFromClass(v87);
                  uint64_t v89 = objc_claimAutoreleasedReturnValue(v88);
                  *(_DWORD *)buf = 138412802;
                  v104 = (_OWORD *)v89;
                  __int16 v105 = 2080;
                  uint64_t v106 = buffer;
                  __int16 v107 = 1024;
                  pid_t v108 = pid;
                  uint64_t v90 = (void *)v89;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "Processing new client connection with class %@ from client %s pid %d",  buf,  0x1Cu);
                }
              }

              *(void *)&buffer[0] = _NSConcreteStackBlock;
              *((void *)&buffer[0] + sub_100006AB8((uint64_t)&OBJC_CLASS___NEHelperTrackerManager, 0LL, 1) = 3221225472LL;
              *(void *)&buffer[1] = sub_10000EFF0;
              *((void *)&buffer[1] + sub_100006AB8((uint64_t)&OBJC_CLASS___NEHelperTrackerManager, 0LL, 1) = &unk_100034EF0;
              *(void *)&__int128 v110 = __PAIR64__(uint64, pid);
              if (qword_10003EB68 != -1) {
                dispatch_once(&qword_10003EB68, buffer);
              }
            }
          }

          id v101 = (id)v20;
          uint64_t v61 = (void *)v97[5];
          if (v61)
          {
            sub_10000E48C(*(os_unfair_lock_s **)(a1 + 32), v61);
            id Property = (id)v97[5];
            if (Property) {
              id Property = objc_getProperty(Property, v62, 32LL, 1);
            }
            id v64 = Property;
            uint64_t v65 = *(void *)(a1 + 32);
            uint64_t v66 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472LL;
            handler[2] = sub_10000E4EC;
            handler[3] = &unk_100034D98;
            handler[4] = v65;
            handler[5] = &v96;
            xpc_connection_set_event_handler(v66, handler);
            uint64_t v69 = ne_log_obj(v67, v68);
            id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v77 = (objc_class *)sub_10000E434((uint64_t)&OBJC_CLASS___NEHelperServer, uint64);
              uint64_t v78 = NSStringFromClass(v77);
              id v79 = (id)objc_claimAutoreleasedReturnValue(v78);
              pid_t v80 = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
              LODWORD(buffer[0]) = 138412546;
              *(void *)((char *)buffer + 4) = v79;
              WORD6(buffer[0]) = 1024;
              *(_DWORD *)((char *)buffer + 14) = v80;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEBUG,  "Start processing first message with class %@ from client pid %d",  (uint8_t *)buffer,  0x12u);
            }

            if (v64)
            {
              if ((objc_opt_respondsToSelector(v64, "handlerQueue") & 1) != 0)
              {
                uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v64 handlerQueue]);
                v92[0] = _NSConcreteStackBlock;
                v92[1] = 3221225472LL;
                v92[2] = sub_10000E858;
                v92[3] = &unk_100035530;
                id v93 = v64;
                id v94 = v5;
                xpc_dictionary_handoff_reply(v94, v71, v92, v72);
              }

              else
              {
                id v73 = [v64 handleMessage:v5];
              }
            }

            else
            {
              sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v5, 32LL, 0LL);
            }

            uint64_t v75 = ne_log_obj(v73, v74);
            uint64_t v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v81 = (objc_class *)sub_10000E434((uint64_t)&OBJC_CLASS___NEHelperServer, uint64);
              uint64_t v82 = NSStringFromClass(v81);
              id v83 = (id)objc_claimAutoreleasedReturnValue(v82);
              pid_t v84 = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
              LODWORD(buffer[0]) = 138412546;
              *(void *)((char *)buffer + 4) = v83;
              WORD6(buffer[0]) = 1024;
              *(_DWORD *)((char *)buffer + 14) = v84;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEBUG,  "End processing first message with class %@ from client pid %d",  (uint8_t *)buffer,  0x12u);
            }
          }

          else
          {
            sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v5, 1LL, 0LL);
            xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
          }

          _Block_object_dispose(&v96, 8);

          goto LABEL_38;
        }

        uint64_t v52 = ne_log_obj(0LL, v18);
        uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          uint64_t v85 = NSStringFromClass(v14);
          uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
          LODWORD(buffer[0]) = 138412290;
          *(void *)((char *)buffer + 4) = v86;
          _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%@ initWithConnection failed",  (uint8_t *)buffer,  0xCu);
        }
      }

      else
      {
        uint64_t v48 = ne_log_obj(v15, v16);
        uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          int v49 = NSStringFromClass(v14);
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          LODWORD(buffer[0]) = 138412290;
          *(void *)((char *)buffer + 4) = v50;
          _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "Received invalid class name %@",  (uint8_t *)buffer,  0xCu);
        }
      }

      goto LABEL_35;
    }

    uint64_t v43 = ne_log_obj(0LL, v13);
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buffer[0]) = 67109120;
      DWORD1(buffer[0]) = uint64;
      uint64_t v45 = "Received unknown class ID %d";
      uint64_t v46 = v44;
      uint32_t v47 = 8;
LABEL_32:
      _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, v45, (uint8_t *)buffer, v47);
      goto LABEL_35;
    }

    goto LABEL_35;
  }

  BOOL v31 = xpc_dictionary_get_BOOL(v5, "init-command");
  if (!v31)
  {
    uint64_t v51 = ne_log_obj(v31, v32);
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buffer[0]) = 0;
      uint64_t v45 = "Received invalid class ID";
      uint64_t v46 = v44;
      uint32_t v47 = 2;
      goto LABEL_32;
    }

LABEL_35:
    uint64_t v55 = ne_log_obj(v53, v54);
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      unsigned int v57 = (objc_class *)sub_10000E434((uint64_t)&OBJC_CLASS___NEHelperServer, uint64);
      uint64_t v58 = NSStringFromClass(v57);
      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      pid_t v60 = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
      LODWORD(buffer[0]) = 138412546;
      *(void *)((char *)buffer + 4) = v59;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v60;
      _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Failed to create a NEHelperClient with class %@ from client pid %d",  (uint8_t *)buffer,  0x12u);
    }

    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v5, 22LL, 0LL);
    xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    goto LABEL_38;
  }

  __int128 v33 = *(void **)(a1 + 32);
  if (v33)
  {
    uint64_t v34 = ne_log_obj(v31, v32);
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buffer[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Handling init command",  (uint8_t *)buffer,  2u);
    }

    sub_10000E914();
    sub_10000EADC(1LL);
    objc_opt_self(&OBJC_CLASS___NEHelperTrackerManager);
    dispatch_queue_attr_t v36 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v37 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v36);
    uint64_t v38 = dispatch_queue_create("Initialize tracking domain info", v37);

    dispatch_async(v38, &stru_100034C00);
    id v40 = objc_getProperty(v33, v39, 24LL, 1);
    objc_opt_self(&OBJC_CLASS___NEHelperConfigurationManager);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
    *(void *)&buffer[0] = _NSConcreteStackBlock;
    *((void *)&buffer[0] + sub_100006AB8((uint64_t)&OBJC_CLASS___NEHelperTrackerManager, 0LL, 1) = 3221225472LL;
    *(void *)&buffer[1] = sub_10001CB68;
    *((void *)&buffer[1] + sub_100006AB8((uint64_t)&OBJC_CLASS___NEHelperTrackerManager, 0LL, 1) = &unk_100035610;
    *(void *)&__int128 v110 = v40;
    id v42 = v40;
    [v41 loadConfigurationsWithCompletionQueue:v42 handler:buffer];

    sub_10001CE20((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager, 0LL);
  }

  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v5, 0LL, 0LL);
LABEL_38:
}

void sub_10000E400( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

id sub_10000E434(uint64_t a1, int a2)
{
  int v3 = a2 - 1;
  if ((a2 - 1) <= 0xD && ((0x3FBBu >> v3) & 1) != 0)
  {
    uint64_t v5 = objc_opt_class(*off_100034F30[v3]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

void sub_10000E48C(os_unfair_lock_s *a1, void *a2)
{
  if (a1)
  {
    int v3 = a1 + 2;
    id v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(objc_getProperty(a1, v5, 40, 1), "addObject:", v4);

    os_unfair_lock_unlock(v3);
  }

void sub_10000E4EC(uint64_t a1, void *a2)
{
  id v4 = a2;
  id Property = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (!Property) {
    goto LABEL_18;
  }
  if (!v4) {
    goto LABEL_5;
  }
  xpc_type_t type = xpc_get_type(v4);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    id Property = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (!Property)
    {
LABEL_6:
      xpc_connection_cancel(Property);
      uint64_t v7 = *(os_unfair_lock_s **)(a1 + 32);
      if (v7)
      {
        id v8 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        os_unfair_lock_lock(v7 + 2);
        objc_msgSend(objc_getProperty(v7, v9, 40, 1), "removeObject:", v8);

        os_unfair_lock_unlock(v7 + 2);
      }

      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0LL;

      goto LABEL_18;
    }

LABEL_5:
    id Property = (_xpc_connection_s *)objc_getProperty(Property, v3, 24LL, 1);
    goto LABEL_6;
  }

  uint64_t v12 = ne_log_obj(type, v3);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (v24) {
      int v25 = *(_DWORD *)(v24 + 8);
    }
    else {
      int v25 = 0;
    }
    uint64_t v26 = (objc_class *)sub_10000E434((uint64_t)&OBJC_CLASS___NEHelperServer, v25);
    uint64_t v27 = NSStringFromClass(v26);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v27);
    id v30 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (v30) {
      id v30 = objc_getProperty(v30, v28, 24LL, 1);
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v43 = v29;
    __int16 v44 = 1024;
    pid_t pid = xpc_connection_get_pid((xpc_connection_t)v30);
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Start processing new message with class %@ from client pid %d",  buf,  0x12u);
  }

  id v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v15 && (id v16 = objc_getProperty(v15, v14, 32LL, 1)) != 0LL)
  {
    id v17 = v16;
    if ((objc_opt_respondsToSelector(v16, "handlerQueue") & 1) != 0)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 handlerQueue]);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10000EFE4;
      v39[3] = &unk_100035530;
      id v17 = v17;
      id v40 = v17;
      id v41 = v4;
      xpc_dictionary_handoff_reply(v41, v18, v39, v19);
    }

    else
    {
      id v20 = [v17 handleMessage:v4];
    }
  }

  else
  {
    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 32LL, 0LL);
    id v17 = 0LL;
  }

  uint64_t v22 = ne_log_obj(v20, v21);
  CFNumberRef v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (v31) {
      int v32 = *(_DWORD *)(v31 + 8);
    }
    else {
      int v32 = 0;
    }
    __int128 v33 = (objc_class *)sub_10000E434((uint64_t)&OBJC_CLASS___NEHelperServer, v32);
    uint64_t v34 = NSStringFromClass(v33);
    dispatch_queue_attr_t v36 = (void *)objc_claimAutoreleasedReturnValue(v34);
    id v37 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (v37) {
      id v37 = objc_getProperty(v37, v35, 24LL, 1);
    }
    pid_t v38 = xpc_connection_get_pid((xpc_connection_t)v37);
    *(_DWORD *)buf = 138412546;
    uint64_t v43 = v36;
    __int16 v44 = 1024;
    pid_t pid = v38;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "End processing new message with class %@ from client pid %d",  buf,  0x12u);
  }

LABEL_18:
}

id sub_10000E858(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMessage:*(void *)(a1 + 40)];
}

void sub_10000E864(uint64_t a1, void *a2, int64_t a3, void *a4)
{
  xpc_object_t original = a2;
  id v7 = a4;
  objc_opt_self(a1);
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  SEL v9 = reply;
  if (reply)
  {
    xpc_dictionary_set_int64(reply, "result-code", a3);
    if (v7) {
      xpc_dictionary_set_value(v9, "result-data", v7);
    }
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(original);
    uint64_t v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    xpc_connection_send_message(v11, v9);
  }
}

void sub_10000E914()
{
  int valuePtr = 0;
  v0 = SCPreferencesCreate( kCFAllocatorDefault,  @"NEHelper control settings",  @"/Library/Preferences/com.apple.networkextension.control.plist");
  if (v0)
  {
    uint64_t v1 = v0;
    CFPropertyListRef Value = SCPreferencesGetValue(v0, @"DisableRestrictions");
    CFTypeID TypeID = CFBooleanGetTypeID();
    BOOL v4 = Value && CFGetTypeID(Value) == TypeID && CFBooleanGetValue((CFBooleanRef)Value) != 0;
    CFPropertyListRef v5 = SCPreferencesGetValue(v1, @"DisableNexus");
    CFTypeID v6 = CFBooleanGetTypeID();
    BOOL v7 = v5 && CFGetTypeID(v5) == v6 && CFBooleanGetValue((CFBooleanRef)v5) != 0;
    CFPropertyListRef v8 = SCPreferencesGetValue(v1, @"FallbackDefault");
    CFTypeID v9 = CFNumberGetTypeID();
    if (v8) {
      LOBYTE(v_Block_object_dispose(va, 8) = CFGetTypeID(v8) == v9 && CFNumberGetValue((CFNumberRef)v8, kCFNumberIntType, &valuePtr) != 0;
    }
    CFRelease(v1);
  }

  else
  {
    LOBYTE(v_Block_object_dispose(va, 8) = 0;
    BOOL v7 = 0;
    BOOL v4 = 0;
  }

  if (qword_10003EB78 != -1) {
    dispatch_once(&qword_10003EB78, &stru_100034F10);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000EE84;
  v10[3] = &unk_100034DD0;
  BOOL v12 = v4;
  BOOL v13 = v7;
  char v14 = (char)v8;
  int v11 = valuePtr;
  dispatch_async((dispatch_queue_t)qword_10003EB70, v10);
}

void sub_10000EADC(uint64_t a1)
{
  uint64_t v2 = SCPreferencesCreate( kCFAllocatorDefault,  @"NEHelper managed preferences",  @"/Library/Managed Preferences/mobile/com.apple.networkextension.control.plist");
  int v3 = SCPreferencesCreate( kCFAllocatorDefault,  @"NEHelper control settings",  @"/Library/Preferences/com.apple.networkextension.control.plist");
  BOOL v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v6 = SCPreferencesLock(v3, 1u);
    if (!(_DWORD)v6)
    {
      uint64_t v30 = ne_log_obj(v6, v7);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        CFErrorRef Error = SCCopyLastError();
        *(_DWORD *)buf = 136315394;
        id v37 = "/Library/Preferences/com.apple.networkextension.control.plist";
        __int16 v38 = 2112;
        CFErrorRef v39 = Error;
        _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "[Managed] Failed to lock SCPreferences for %s: %@",  buf,  0x16u);
      }

      goto LABEL_34;
    }

    uint64_t v8 = 0LL;
    CFTypeID v9 = off_100034DB8;
    do
    {
      uint64_t v10 = v9[v8];
      CFPropertyListRef Value = (void *)SCPreferencesGetValue(v2, v10);
      if (CFStringCompare(v10, @"CriticalDomains", 0LL))
      {
        if (Value)
        {
          SCPreferencesSetValue(v4, v10, Value);
        }

        else if ((a1 & 1) == 0)
        {
          SCPreferencesRemoveValue(v4, v10);
        }
      }

      else
      {
        id v12 = Value;
        CFPropertyListRef v13 = SCPreferencesGetValue(v4, v10);
        char v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (isa_nsarray(v12) && [v12 count])
        {
          id v15 = v9;
          uint64_t v16 = a1;
          id v17 = sub_100011560((uint64_t)&OBJC_CLASS___NEHelperSettingsManager, v14, v12);
          uint64_t v18 = (__CFError *)objc_claimAutoreleasedReturnValue(v17);
          uint64_t v20 = ne_log_obj(v18, v19);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v37 = (const char *)v10;
            __int16 v38 = 2112;
            CFErrorRef v39 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[Managed] setting %@ to %@",  buf,  0x16u);
          }

          SCPreferencesSetValue(v4, v10, v18);
          a1 = v16;
          CFTypeID v9 = v15;
        }
      }

      ++v8;
    }

    while (v8 != 3);
    uint64_t v22 = SCPreferencesCommitChanges(v4);
    if (!(_DWORD)v22)
    {
      uint64_t v24 = ne_log_obj(v22, v23);
      int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v33 = SCError();
        uint64_t v34 = SCErrorString(v33);
        *(_DWORD *)buf = 136315138;
        id v37 = v34;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "[Managed] Failed to save the control settings: %s",  buf,  0xCu);
      }
    }

    uint64_t v26 = SCPreferencesUnlock(v4);
    if (!(_DWORD)v26)
    {
      uint64_t v28 = ne_log_obj(v26, v27);
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        CFErrorRef v35 = SCCopyLastError();
        *(_DWORD *)buf = 136315394;
        id v37 = "/Library/Preferences/com.apple.networkextension.control.plist";
        __int16 v38 = 2112;
        CFErrorRef v39 = v35;
        _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[Managed] Failed to unlock preferences for %s: %@",  buf,  0x16u);
      }
    }
  }

  if (!v2)
  {
    if (!v4) {
      return;
    }
    goto LABEL_29;
  }

LABEL_34:
  CFRelease(v2);
  if (!v4) {
    return;
  }
LABEL_29:
  CFRelease(v4);
}

uint64_t sub_10000EE84(uint64_t a1)
{
  uint64_t result = sub_10000EEE0("com.apple.networkextension.disable-nexus", *(unsigned __int8 *)(a1 + 37));
  if (*(_BYTE *)(a1 + 38)) {
    return sub_10000EEE0("com.apple.networkextension.fallback-default", *(int *)(a1 + 32));
  }
  return result;
}

uint64_t sub_10000EEE0(const char *a1, uint64_t a2)
{
  if (qword_10003EB78 != -1) {
    dispatch_once(&qword_10003EB78, &stru_100034F10);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003EB70);
  int out_token = -1;
  uint64_t result = notify_register_check(a1, &out_token);
  if (!(_DWORD)result)
  {
    if (notify_get_state(out_token, &v5) || v5 != a2)
    {
      uint64_t v5 = a2;
      if (!notify_set_state(out_token, a2)) {
        notify_post(a1);
      }
    }

    return notify_cancel(out_token);
  }

  return result;
}

void sub_10000EF94(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  BOOL v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("NEHelperServerNotificationQueue", v4);
  int v3 = (void *)qword_10003EB70;
  qword_10003EB70 = (uint64_t)v2;
}

id sub_10000EFE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMessage:*(void *)(a1 + 40)];
}

void sub_10000EFF0(uint64_t a1)
{
  uint64_t v2 = proc_name(*(_DWORD *)(a1 + 32), buffer, 0x100u);
  if ((int)v2 >= 1)
  {
    uint64_t v4 = ne_log_obj(v2, v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(a1 + 32);
      uint64_t v7 = (objc_class *)sub_10000E434((uint64_t)&OBJC_CLASS___NEHelperServer, *(_DWORD *)(a1 + 36));
      uint64_t v8 = NSStringFromClass(v7);
      CFTypeID v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v10 = 136315650;
      int v11 = buffer;
      __int16 v12 = 1024;
      int v13 = v6;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Launched by %s (pid %d) using class %@",  (uint8_t *)&v10,  0x1Cu);
    }
  }

id sub_10000F110(uint64_t a1)
{
  if (qword_10003EB60 != -1) {
    dispatch_once(&qword_10003EB60, &stru_100034D30);
  }
  return (id)qword_10003EB58;
}

void sub_10000F154(id a1)
{
  dispatch_queue_attr_t v1 = objc_alloc(&OBJC_CLASS___NEHelperServer);
  if (v1)
  {
    v17.receiver = v1;
    v17.super_class = (Class)&OBJC_CLASS___NEHelperServer;
    id v2 = objc_msgSendSuper2(&v17, "init");
    if (v2)
    {
      dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
      dispatch_queue_t v5 = dispatch_queue_create("NEHelperServer queue", v4);
      int v6 = (void *)*((void *)v2 + 3);
      *((void *)v2 + 3) = v5;

      xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.nehelper", 0LL, 1uLL);
      uint64_t v8 = (void *)*((void *)v2 + 4);
      *((void *)v2 + 4) = mach_service;

      CFTypeID v9 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 0LL);
      int v10 = (void *)*((void *)v2 + 5);
      *((void *)v2 + 5) = v9;

      *((_DWORD *)v2 + 2) = 0;
      int v11 = (void *)*((void *)v2 + 4);
      if (!v11 || xpc_get_type(v11) != (xpc_type_t)&_xpc_type_connection) {
        goto LABEL_5;
      }
      xpc_connection_set_target_queue(*((xpc_connection_t *)v2 + 4), *((dispatch_queue_t *)v2 + 3));
      int v13 = (_xpc_connection_s *)*((void *)v2 + 4);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10000D8D0;
      handler[3] = &unk_1000352F8;
      id v16 = v2;
      xpc_connection_set_event_handler(v13, handler);
    }

    id v2 = v2;
    uint64_t v12 = (uint64_t)v2;
    goto LABEL_8;
  }

  id v2 = 0LL;
LABEL_5:
  uint64_t v12 = 0LL;
LABEL_8:

  __int16 v14 = (void *)qword_10003EB58;
  qword_10003EB58 = v12;
}

void sub_10000F2C0(uint64_t a1, void *a2)
{
}

void sub_10000F2D0(uint64_t a1, void *a2)
{
}

void sub_10000F2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = ne_log_obj(a1, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Querying LaunchServices", buf, 2u);
  }

  id v6 = [[LSApplicationRecord alloc] initWithBundleIdentifier:@"com.apple.mobilesafari" allowPlaceholder:0 error:0];
  id Property = *(dispatch_queue_s **)(a1 + 32);
  if (Property)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(Property, v5, 24LL, 1);
    uint64_t v8 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F3C8;
  block[3] = &unk_100035580;
  block[4] = v8;
  dispatch_async(Property, block);
}

void sub_10000F3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = ne_log_obj(a1, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFTypeID v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LaunchServices is available", v9, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    *(_BYTE *)(v5 + 12) = 1;
  }
  id v6 = sub_10001E094((uint64_t)&OBJC_CLASS___NEHelperCacheManager);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_10002283C(v7, v8);
}

void sub_10000F460(void *a1, void *a2, const char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
    {
      string = xpc_dictionary_get_string(v6, _xpc_event_key_name);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000FBE4;
      block[3] = &unk_100034EA8;
      block[4] = a3;
      void block[5] = string;
      if (qword_10003EB68 != -1) {
        dispatch_once(&qword_10003EB68, block);
      }
      if (!strcmp(a3, "com.apple.fsevents.matching"))
      {
        if (!strcmp(string, "ConfigFileChanged"))
        {
          if (stat("/Library/Preferences/com.apple.networkextension.plist", &buf) && *__error() == 2)
          {
            uint64_t v57 = 0LL;
            uint64_t v58 = &v57;
            uint64_t v59 = 0x3032000000LL;
            pid_t v60 = sub_10000DA10;
            uint64_t v61 = sub_10000DA20;
            id v62 = (id)os_transaction_create("com.apple.nehelper.handleConfigFileRemoved");
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
            id v31 = objc_getProperty(a1, v30, 24LL, 1);
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472LL;
            v54[2] = sub_10000FC94;
            v54[3] = &unk_100034DF8;
            v54[4] = &v57;
            [v29 handleFileRemovedWithCompletionQueue:v31 completionHandler:v54];

            id v32 = sub_10001E094((uint64_t)&OBJC_CLASS___NEHelperCacheManager);
            int v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            sub_100023148(v33, v34);

            _Block_object_dispose(&v57, 8);
          }
        }

        else if (!strcmp(string, "ControlSettingsChanged"))
        {
          sub_10000E914();
        }

        else
        {
          uint64_t v15 = strcmp(string, "ManagedPreferencesChanged");
          if (!(_DWORD)v15) {
            sub_10000EADC(v15);
          }
        }
      }

      else if (!strcmp(a3, "com.apple.distnoted.matching"))
      {
        if (!strcmp(string, "ApplicationInstalled") || !strcmp(string, "ApplicationUninstalled"))
        {
          id v16 = (id)_CFXPCCreateCFObjectFromXPCObject(v6);
          objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  _xpc_event_key_name));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"UserInfo"]);
          if (isa_nsdictionary() && isa_nsstring(v18))
          {
            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"bundleIDs"]);
            if (isa_nsarray(v53))
            {
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithBlock:]( &OBJC_CLASS___NSPredicate,  "predicateWithBlock:",  &stru_100034E88));
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v53 filteredArrayUsingPredicate:v20]);

              LODWORD(v20) = [v18 isEqualToString:@"ApplicationInstalled"];
              uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"isPlaceholder"]);
              uint64_t v23 = ne_log_obj(v50, v22);
              uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
              if ((_DWORD)v20)
              {
                if (v25)
                {
                  unsigned int v26 = [v50 BOOLValue];
                  uint64_t v27 = "";
                  if (v26) {
                    uint64_t v27 = "placeholder ";
                  }
                  buf.st_dev = 136446466;
                  *(void *)&buf.st_mode = v27;
                  WORD2(buf.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v21;
                  _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received an apps installed notification with %{public}sbundle IDs %@",  (uint8_t *)&buf,  0x16u);
                }

                uint64_t v51 = 0LL;
                uint64_t v28 = v21;
              }

              else
              {
                if (v25)
                {
                  buf.st_dev = 138412290;
                  *(void *)&buf.st_mode = v21;
                  _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received an apps uninstalled notification with bundle IDs %@",  (uint8_t *)&buf,  0xCu);
                }

                uint64_t v28 = 0LL;
                uint64_t v51 = v21;
              }

              id v46 = v21;
              uint64_t v57 = 0LL;
              uint64_t v58 = &v57;
              uint64_t v59 = 0x3032000000LL;
              pid_t v60 = sub_10000DA10;
              uint64_t v61 = sub_10000DA20;
              id v62 = (id)os_transaction_create("com.apple.nehelper.handleAppEvent");
              unsigned __int8 v49 = [v50 BOOLValue];
              v56[0] = _NSConcreteStackBlock;
              v56[1] = 3221225472LL;
              v56[2] = sub_10000FCA8;
              v56[3] = &unk_100034DF8;
              v56[4] = &v57;
              id v35 = v28;
              id v52 = v51;
              uint64_t v48 = v56;
              dispatch_queue_attr_t v36 = dispatch_group_create();
              if ([v35 count])
              {
                dispatch_group_enter(v36);
                id v37 = sub_10001E094((uint64_t)&OBJC_CLASS___NEHelperCacheManager);
                __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
                v65[0] = _NSConcreteStackBlock;
                v65[1] = 3221225472LL;
                v65[2] = sub_10000FCBC;
                v65[3] = &unk_100035580;
                uint64_t v66 = v36;
                sub_100023220(v38, v35, v65);
              }

              if (objc_msgSend(v52, "count", v46))
              {
                dispatch_group_enter(v36);
                id v40 = sub_10001E094((uint64_t)&OBJC_CLASS___NEHelperCacheManager);
                id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
                v63[0] = _NSConcreteStackBlock;
                v63[1] = 3221225472LL;
                v63[2] = sub_10000FCC4;
                v63[3] = &unk_100035580;
                id v64 = v36;
                sub_100023220(v41, v52, v63);
              }

              id Property = (dispatch_queue_s *)objc_getProperty(a1, v39, 24LL, 1);
              *(void *)&buf.st_dev = _NSConcreteStackBlock;
              buf.st_ino = 3221225472LL;
              *(void *)&buf.st_uid = sub_10000FCCC;
              *(void *)&buf.st_rdev = &unk_100034E68;
              LOBYTE(buf.st_ctimespec.tv_sec) = v49;
              id v43 = v35;
              buf.st_atimespec.tv_sec = (__darwin_time_t)v43;
              id v44 = v52;
              buf.st_atimespec.tv_nsec = (uint64_t)v44;
              buf.st_mtimespec.tv_sec = (__darwin_time_t)a1;
              uint64_t v45 = v48;
              buf.st_mtimespec.tv_nsec = (uint64_t)v45;
              dispatch_group_notify(v36, Property, &buf);

              _Block_object_dispose(&v57, 8);
            }
          }
        }

        else
        {
          uint64_t v8 = strcmp(string, "ApplicationDatabaseUpdated");
          if (!(_DWORD)v8)
          {
            uint64_t v10 = ne_log_obj(v8, v9);
            int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.st_dev) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Handling an application database updated notification",  (uint8_t *)&buf,  2u);
            }

            id v12 = sub_10001E094((uint64_t)&OBJC_CLASS___NEHelperCacheManager);
            int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            sub_1000230D4(v13, v14);

            notify_post("com.apple.networkextension.apps-changed");
          }
        }
      }
    }

    NWPrivilegedHelperHandleEvent(v6, a3);
  }
}

void sub_10000FBC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_10000FBE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = ne_log_obj(a1, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 136315394;
    uint64_t v8 = v5;
    __int16 v9 = 2080;
    uint64_t v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Launched by event of type %s and name %s",  (uint8_t *)&v7,  0x16u);
  }
}

void sub_10000FC94(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0LL;
}

void sub_10000FCA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0LL;
}

void sub_10000FCBC(uint64_t a1)
{
}

void sub_10000FCC4(uint64_t a1)
{
}

void sub_10000FCCC(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSArray);
  if (*(_BYTE *)(a1 + 64) || ![*(id *)(a1 + 32) count])
  {
    uint64_t v51 = v2;
    goto LABEL_11;
  }

  uint64_t v3 = a1;
  id v4 = [*(id *)(a1 + 32) count];
  BOOL v5 = v4 == (id)1;
  uint64_t v7 = ne_log_obj(v4, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(v3 + 32);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      int v11 = "Handling an apps installed notification with bundle IDs %@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&buf, 0xCu);
    }
  }

  else if (v9)
  {
    id v12 = [*(id *)(v3 + 32) count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v12;
    int v11 = "Handling an apps installed notification with %lu bundle IDs";
    goto LABEL_9;
  }

  sub_10001CE20((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager, *(void **)(v3 + 32));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v2, "arrayByAddingObjectsFromArray:", *(void *)(v3 + 32)));

  uint64_t v51 = (void *)v13;
  a1 = v3;
LABEL_11:
  uint64_t v53 = a1;
  id v14 = [*(id *)(a1 + 40) count];
  uint64_t v15 = objc_msgSend_unsignedIntValue;
  if (!v14)
  {
    uint64_t v24 = a1;
    BOOL v25 = v51;
    goto LABEL_32;
  }

  id v16 = [*(id *)(a1 + 40) count];
  BOOL v17 = v16 == (id)1;
  uint64_t v19 = ne_log_obj(v16, v18);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v21)
    {
      uint64_t v22 = *(void *)(v53 + 40);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v22;
      uint64_t v23 = "Handling an apps uninstalled notification with bundle IDs %@";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&buf, 0xCu);
    }
  }

  else if (v21)
  {
    id v26 = [*(id *)(v53 + 40) count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v26;
    uint64_t v23 = "Handling an apps uninstalled notification with %lu bundle IDs";
    goto LABEL_18;
  }

  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100034E18));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v53 + 40) filteredArrayUsingPredicate:v50]);
  uint64_t v28 = *(void **)(v53 + 48);
  id v29 = v27;
  id v52 = v29;
  if (v28)
  {
    uint64_t v31 = ne_log_obj(v29, v30);
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v52;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Removing configurations for apps with bundle IDs %@",  (uint8_t *)&buf,  0xCu);
    }

    if ([v52 count])
    {
      v61[0] = 0LL;
      v61[1] = v61;
      v61[2] = 0x3032000000LL;
      v61[3] = sub_10000DA10;
      v61[4] = sub_10000DA20;
      id v62 = (id)os_transaction_create("com.apple.nehelper.handleAppsRemoved");
      int v33 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
      id v35 = objc_getProperty(v28, v34, 24LL, 1);
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472LL;
      v60[2] = sub_100010978;
      v60[3] = &unk_100034DF8;
      v60[4] = v61;
      [v33 handleApplicationsRemoved:v52 completionQueue:v35 withCompletionHandler:v60];

      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      id v36 = v52;
      id v37 = [v36 countByEnumeratingWithState:&v56 objects:&buf count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v57;
        do
        {
          for (i = 0LL; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v57 != v38) {
              objc_enumerationMutation(v36);
            }
            id v40 = *(id *)(*((void *)&v56 + 1) + 8LL * (void)i);
            uint64_t v41 = objc_opt_self(&OBJC_CLASS___NEHelperHotspotConfigurationManager);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10000B0C8;
            block[3] = &unk_100034C68;
            id v64 = v40;
            uint64_t v65 = v41;
            id v42 = v40;
            dispatch_async(&_dispatch_main_q, block);
          }

          id v37 = [v36 countByEnumeratingWithState:&v56 objects:&buf count:16];
        }

        while (v37);
      }

      _Block_object_dispose(v61, 8);
    }
  }

  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v51 arrayByAddingObjectsFromArray:*(void *)(v53 + 40)]);
  uint64_t v24 = v53;
  uint64_t v15 = objc_msgSend_unsignedIntValue;
LABEL_32:
  v54[0] = _NSConcreteStackBlock;
  uint64_t v43 = *((void *)v15 + 122);
  v54[1] = v43;
  v54[2] = sub_1000102C0;
  v54[3] = &unk_100034E40;
  id v44 = *(void **)(v24 + 48);
  id v55 = *(id *)(v24 + 56);
  id v45 = v25;
  id v46 = v54;
  if (v44)
  {
    uint32_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
    id Property = objc_getProperty(v44, v48, 24LL, 1);
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + sub_100006AB8((uint64_t)&OBJC_CLASS___NEHelperTrackerManager, 0LL, 1) = v43;
    uint64_t v67 = sub_1000102F4;
    uint64_t v68 = &unk_100034ED0;
    id v69 = v45;
    id v70 = v46;
    [v47 loadConfigurationsWithCompletionQueue:Property handler:&buf];
  }
}

void sub_100010294( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_1000102C0(uint64_t a1, int a2)
{
  if (a2) {
    notify_post("com.apple.networkextension.apps-changed");
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000102F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v63 = ne_session_fallback_advisory();
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  id obj = v3;
  id v74 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (v74)
  {
    int v68 = 0;
    uint64_t v73 = *(void *)v82;
    do
    {
      id v4 = 0LL;
      do
      {
        if (*(void *)v82 != v73) {
          objc_enumerationMutation(obj);
        }
        BOOL v5 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)v4);
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pluginType]);
        if (v6)
        {
          id v7 = [*(id *)(a1 + 32) containsObject:v6];
          if ((_DWORD)v7)
          {
            uint64_t v9 = ne_log_obj(v7, v8);
            uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
              *(_DWORD *)__int128 buf = 138412546;
              CFIndex v87 = v11;
              __int16 v88 = 2112;
              uint64_t v89 = v6;
              _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "App for configuration %@ (%@) changed",  buf,  0x16u);
            }

            int v12 = 1;
            goto LABEL_11;
          }
        }

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 appVPN]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 appRules]);
        if ([v14 count]) {
          goto LABEL_17;
        }
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 contentFilter]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 perApp]);
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 appRules]);
        if ([v17 count]) {
          goto LABEL_16;
        }
        uint64_t v75 = v6;
        uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v5 dnsProxy]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v71 perApp]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 appRules]);
        if ([v19 count])
        {

          uint64_t v6 = v75;
LABEL_16:

LABEL_17:
LABEL_18:
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 appVPN]);
          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v5 contentFilter]);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 perApp]);

          if (v22)
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 contentFilter]);
            goto LABEL_24;
          }

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 dnsProxy]);
          BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v24 perApp]);

          if (v25)
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 dnsProxy]);
            goto LABEL_24;
          }

          id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 relay]);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 perApp]);

          if (v27)
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 relay]);
LABEL_24:
            uint64_t v28 = v23;
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v23 perApp]);

            if (v20)
            {
              id v29 = v20;
              goto LABEL_27;
            }

            id v29 = v27;
            if (v27) {
LABEL_27:
            }
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 appRules]);
            else {
              uint64_t v30 = 0LL;
            }
          }

          else
          {
            uint64_t v30 = 0LL;
            id v29 = v20;
            if (v20) {
              goto LABEL_27;
            }
          }

          __int128 v79 = 0u;
          __int128 v80 = 0u;
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          id v31 = v30;
          id v32 = [v31 countByEnumeratingWithState:&v77 objects:v85 count:16];
          if (v32)
          {
            id v33 = v32;
            id v69 = v27;
            uint64_t v72 = v20;
            uint64_t v76 = v6;
            uint64_t v34 = *(void *)v78;
            while (2)
            {
              for (i = 0LL; i != v33; i = (char *)i + 1)
              {
                if (*(void *)v78 != v34) {
                  objc_enumerationMutation(v31);
                }
                id v36 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
                uint64_t v37 = objc_claimAutoreleasedReturnValue([v36 matchSigningIdentifier]);
                if (v37)
                {
                  uint64_t v38 = (void *)v37;
                  CFErrorRef v39 = *(void **)(a1 + 32);
                  id v40 = (void *)objc_claimAutoreleasedReturnValue([v36 matchSigningIdentifier]);
                  LOBYTE(v39) = [v39 containsObject:v40];

                  if ((v39 & 1) != 0)
                  {

                    uint64_t v44 = ne_log_obj(v42, v43);
                    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                    {
                      id v45 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
                      id v46 = *(void **)(a1 + 32);
                      *(_DWORD *)__int128 buf = 138412546;
                      CFIndex v87 = v45;
                      __int16 v88 = 2112;
                      uint64_t v89 = v46;
                      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "One or more apps in the per-app rules for configuration %@ changed: %@",  buf,  0x16u);
                    }

                    int v68 = 1;
                    goto LABEL_41;
                  }
                }
              }

              id v33 = [v31 countByEnumeratingWithState:&v77 objects:v85 count:16];
              if (v33) {
                continue;
              }
              break;
            }

            uint64_t v41 = (os_log_s *)v31;
LABEL_41:
            uint64_t v6 = v76;
            uint64_t v27 = v69;
            uint64_t v20 = v72;
          }

          else
          {
            uint64_t v41 = (os_log_s *)v31;
          }

          goto LABEL_44;
        }

        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v5 relay]);
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v66 perApp]);
        id v64 = (void *)objc_claimAutoreleasedReturnValue([v65 appRules]);
        id v70 = [v64 count];

        uint64_t v6 = v75;
        if (v70) {
          goto LABEL_18;
        }
        uint64_t v47 = objc_claimAutoreleasedReturnValue([v5 pathController]);
        if (!v47
          || (SEL v48 = (void *)v47,
              unsigned __int8 v49 = (void *)objc_claimAutoreleasedReturnValue([v5 pathController]),
              char v50 = [v49 hasNonDefaultRules] | v63,
              v49,
              v48,
              (v50 & 1) == 0))
        {
          uint64_t v51 = objc_claimAutoreleasedReturnValue([v5 alwaysOnVPN]);
          if (!v51
            || (id v52 = (void *)v51,
                uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v5 alwaysOnVPN]),
                unsigned __int8 v54 = [v53 isEnabled],
                v53,
                v52,
                (v54 & 1) == 0))
          {
            uint64_t v55 = objc_claimAutoreleasedReturnValue([v5 dnsProxy]);
            if (!v55
              || (__int128 v56 = (void *)v55,
                  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v5 dnsProxy]),
                  unsigned __int8 v58 = [v57 isEnabled],
                  v57,
                  v56,
                  (v58 & 1) == 0))
            {
              __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v5 appPush]);
              if (v59)
              {
                pid_t v60 = (void *)objc_claimAutoreleasedReturnValue([v5 appPush]);
                unsigned int v61 = [v60 isEnabled];
              }

              else
              {
                unsigned int v61 = 0;
              }

              uint64_t v6 = v75;

              int v12 = v61 | v68;
LABEL_11:
              int v68 = v12;
              goto LABEL_44;
            }
          }
        }

        int v68 = 1;
        uint64_t v6 = v75;
LABEL_44:

        id v4 = (char *)v4 + 1;
      }

      while (v4 != v74);
      id v62 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
      id v74 = v62;
    }

    while (v62);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100010978(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0LL;
}

BOOL sub_10001098C(id a1, id a2, NSDictionary *a3)
{
  id v3 = a2;
  if (isa_nsstring(v3))
  {
    LOBYTE(v4) = 1;
    id v5 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v3 allowPlaceholder:1 error:0];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationState]);
      unsigned int v4 = [v7 isInstalled] ^ 1;
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

BOOL sub_100010A14(id a1, id a2, NSDictionary *a3)
{
  return isa_nsstring(a2);
}

BOOL sub_100010A1C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_self(a1);
  uint64_t v6 = (void *)xpc_connection_copy_entitlement_value(v5, a3);

  return v6 != 0LL;
}

NSString *sub_100010A78(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  uint64_t pid = xpc_connection_get_pid(v3);

  LODWORD(v3) = proc_name(pid, buffer, 0x100u);
  id v5 = objc_alloc(&OBJC_CLASS___NSString);
  else {
    return -[NSString initWithCString:encoding:](v5, "initWithCString:encoding:", buffer, 4LL);
  }
}

NSMutableArray *sub_100010B38(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    unsigned int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    lock = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v6 = objc_getProperty(a1, v5, 40LL, 1);
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v20;
      do
      {
        int v11 = 0LL;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v6);
          }
          int v12 = *(_DWORD **)(*((void *)&v19 + 1) + 8LL * (void)v11);
          if (v12)
          {
            if (v12[2] == 6)
            {
              id Property = objc_getProperty(*(id *)(*((void *)&v19 + 1) + 8LL * (void)v11), v8, 32LL, 1);
              if ((objc_opt_respondsToSelector(Property, "name") & 1) != 0)
              {
                id v14 = objc_msgSend(objc_getProperty(v12, v8, 32, 1), "name");
                uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
                unsigned int v16 = [v3 isEqualToString:v15];

                if (v16) {
                  -[NSMutableArray addObject:](v4, "addObject:", v12);
                }
              }
            }
          }

          int v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v9);
    }

    os_unfair_lock_unlock(lock);
  }

  else
  {
    unsigned int v4 = 0LL;
  }

  return v4;
}

NSArray *sub_100011560(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_self(a1);
  if (isa_nsarray(v5) && [v5 count])
  {
    id v7 = [v5 mutableCopy];
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          if (objc_msgSend(v7, "indexOfObject:", v13, (void)v16) == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v7 addObject:v13];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v10);
    }

    id v14 = -[NSArray initWithArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:", v7);
  }

  else
  {
    id v14 = (NSArray *)v6;
  }

  return v14;
}

LABEL_79:
        }
      }

      __strlcpy_chk(&v98, &v117, 16LL, 16LL);
      CFIndex v87 = xpc_string_create((const char *)&v98);
      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v3, 0LL, v87);

      goto LABEL_75;
    case 2uLL:
      length[0] = 0LL;
      *(void *)&__int128 v117 = 0LL;
      *(void *)&uint64_t v98 = 0LL;
      uint64_t v15 = xpc_dictionary_get_string(v3, "interface-name");
      data = xpc_dictionary_get_data(v3, "interface-address", length);
      __int128 v17 = xpc_dictionary_get_data(v3, "interface-netmask", (size_t *)&v117);
      __int128 v18 = xpc_dictionary_get_data(v3, "interface-lifetime", (size_t *)&v98);
      if (!v15) {
        goto LABEL_59;
      }
      __int128 v19 = (uint64_t)v18;
      if (v19 && (void)v98 != 24LL) {
        goto LABEL_59;
      }
      __int128 v20 = sub_100012404((uint64_t)v15, (uint64_t)data, (uint64_t)v17, v19);
      if (!v20) {
        goto LABEL_73;
      }
      id v14 = v20;
      goto LABEL_72;
    case 3uLL:
      __int128 v21 = xpc_dictionary_get_uint64(v3, "interface-mtu");
      __int128 v22 = xpc_dictionary_get_string(v3, "interface-name");
      if (!v22 || !v21) {
        goto LABEL_59;
      }
      __strlcpy_chk(length, v22, 16LL, 16LL);
      LODWORD(length[2]) = v21;
      uint64_t v23 = sub_100012390(0x80206934, (uint64_t)length, 2);
      if (!(_DWORD)v23) {
        goto LABEL_73;
      }
      BOOL v25 = v23;
      id v26 = ne_log_obj(v23, v24);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      uint64_t v28 = strerror(v25);
      LODWORD(v117) = 136315138;
      *(void *)((char *)&v117 + 4) = v28;
      id v29 = "Cannot set MTU, %s";
      goto LABEL_56;
    case 4uLL:
      uint64_t v30 = xpc_dictionary_dup_fd(v3, "interface-socket");
      *(void *)&__int128 v117 = 0LL;
      id v31 = xpc_dictionary_get_data(v3, "interface-option-data", (size_t *)&v117);
      id v32 = xpc_dictionary_get_uint64(v3, "interface-option");
      if (v30 < 0) {
        goto LABEL_59;
      }
      id v33 = v32;
      if (!v32) {
        goto LABEL_59;
      }
      uint64_t v34 = setsockopt(v30, 2, v32, v31, v117);
      if (!(_DWORD)v34) {
        goto LABEL_60;
      }
      id v36 = ne_log_obj(v34, v35);
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v88 = __error();
        uint64_t v89 = strerror(*v88);
        LODWORD(length[0]) = 67109378;
        HIDWORD(length[0]) = v33;
        LOWORD(length[1]) = 2080;
        *(size_t *)((char *)&length[1] + 2) = (size_t)v89;
        _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Couldn't set socket option %d, %s",  (uint8_t *)length,  0x12u);
      }

      uint64_t v38 = *__error();
      if ((_DWORD)v38)
      {
        CFErrorRef v39 = v3;
      }

      else
      {
LABEL_60:
        CFErrorRef v39 = v3;
        uint64_t v38 = 0LL;
      }

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v39, v38, 0LL);
      close(v30);
      goto LABEL_75;
    case 5uLL:
      *(void *)&__int128 v117 = 0LL;
      id v40 = xpc_dictionary_get_string(v3, "interface-name");
      uint64_t v41 = (unsigned __int8 *)xpc_dictionary_get_data(v3, "interface-address", (size_t *)&v117);
      if (!v40) {
        goto LABEL_59;
      }
      uint64_t v42 = v41;
      uint64_t v43 = v41[1];
      if (v43 != 30)
      {
        if (v43 != 2)
        {
          BOOL v25 = 22;
          goto LABEL_71;
        }

        memset(length, 0, 32);
        __strlcpy_chk(length, v40, 16LL, 16LL);
        *(_OWORD *)&length[2] = 0x210uLL;
        HIDWORD(length[2]) = *((_DWORD *)v42 + 1);
        uint64_t v44 = sub_100012390(0x80206919, (uint64_t)length, 2);
        if ((_DWORD)v44)
        {
          BOOL v25 = v44;
          id v46 = ne_log_obj(v44, v45);
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v9_Block_object_dispose(va, 8) = 0;
            id v29 = "Couldn't remove IPv4 interface address";
            goto LABEL_86;
          }

          goto LABEL_70;
        }

LABEL_73:
        id v70 = v3;
        id v14 = 0LL;
        goto LABEL_74;
      }

      __int128 v115 = 0u;
      __int128 v116 = 0u;
      __int128 v113 = 0u;
      __int128 v114 = 0u;
      __int128 v111 = 0u;
      __int128 v112 = 0u;
      xpc_object_t v109 = 0u;
      __int128 v110 = 0u;
      __int16 v107 = 0u;
      pid_t v108 = 0u;
      __int16 v105 = 0u;
      uint64_t v106 = 0u;
      uint64_t v103 = 0u;
      v104 = 0u;
      objc_super v102 = 0u;
      memset(length, 0, sizeof(length));
      __strlcpy_chk(length, v40, 16LL, 16LL);
      LOWORD(length[2]) = 7708;
      *(_OWORD *)&length[3] = *(_OWORD *)(v42 + 8);
      __int128 v80 = sub_100012390(0x81206919, (uint64_t)length, 30);
      if (!(_DWORD)v80) {
        goto LABEL_73;
      }
      BOOL v25 = v80;
      __int128 v82 = ne_log_obj(v80, v81);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9_Block_object_dispose(va, 8) = 0;
        id v29 = "Couldn't remove IPv6 interface address";
LABEL_86:
        unsigned __int8 v54 = (uint8_t *)&v98;
        int v68 = v27;
        id v69 = 2;
LABEL_58:
        _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, v29, v54, v69);
      }

LABEL_70:
LABEL_71:
      id v14 = v25;
LABEL_72:
      id v70 = v3;
LABEL_74:
      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v70, v14, 0LL);
LABEL_75:

      return;
    case 6uLL:
      uint64_t v47 = xpc_dictionary_get_uint64(v3, "interface-type");
      SEL v48 = xpc_dictionary_get_string(v3, "interface-name");
      unsigned __int8 v49 = xpc_dictionary_get_string(v3, "interface-delegate-name");
      if (v47 != 4) {
        goto LABEL_59;
      }
      if (!v48) {
        goto LABEL_59;
      }
      char v50 = v49;
      if (!v49) {
        goto LABEL_59;
      }
      __int128 v119 = 0LL;
      __int128 v117 = 0u;
      __int128 v118 = 0u;
      __int16 v107 = 0u;
      pid_t v108 = 0u;
      __int16 v105 = 0u;
      uint64_t v106 = 0u;
      uint64_t v103 = 0u;
      v104 = 0u;
      objc_super v102 = 0u;
      memset(length, 0, sizeof(length));
      __strlcpy_chk(&v117, v48, 16LL, 16LL);
      __int128 v118 = xmmword_1000274E0;
      __int128 v119 = length;
      __strlcpy_chk(&length[4], v50, 16LL, 16LL);
      uint64_t v51 = sub_100012390(0x8028697B, (uint64_t)&v117, 2);
      if (!(_DWORD)v51) {
        goto LABEL_73;
      }
      BOOL v25 = v51;
      uint64_t v53 = ne_log_obj(v51, v52);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      LODWORD(v9_Block_object_dispose(va, 8) = 136315138;
      *(void *)((char *)&v98 + 4) = strerror(v25);
      id v29 = "SIOCSDRVSPEC failed with, %s";
      unsigned __int8 v54 = (uint8_t *)&v98;
      goto LABEL_57;
    case 7uLL:
      uint64_t v55 = xpc_dictionary_get_string(v3, "interface-name");
      if (!v55) {
        goto LABEL_59;
      }
      memset(length, 0, 32);
      __strlcpy_chk(length, v55, 16LL, 16LL);
      __int128 v56 = sub_100012390(0x80206979, (uint64_t)length, 2);
      if (!(_DWORD)v56) {
        goto LABEL_73;
      }
      BOOL v25 = v56;
      unsigned __int8 v58 = ne_log_obj(v56, v57);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      __int128 v59 = strerror(v25);
      LODWORD(v117) = 136315138;
      *(void *)((char *)&v117 + 4) = v59;
      id v29 = "SIOCIFDESTROY failed with, %s";
      goto LABEL_56;
    case 8uLL:
      pid_t v60 = xpc_dictionary_get_uint64(v3, "interface-type");
      unsigned int v61 = xpc_dictionary_get_string(v3, "interface-name");
      id v62 = xpc_dictionary_get_string(v3, "interface-description");
      if (v60 != 4) {
        goto LABEL_59;
      }
      if (!v61) {
        goto LABEL_59;
      }
      char v63 = v62;
      if (!v62) {
        goto LABEL_59;
      }
      strncpy((char *)length, v61, 0x10uLL);
      LODWORD(length[2]) = strnlen(v63, 0x80uLL);
      strncpy((char *)&length[2] + 4, v63, 0x80uLL);
      id v64 = sub_100012390(0xC094698F, (uint64_t)length, 2);
      if (!(_DWORD)v64) {
        goto LABEL_73;
      }
      BOOL v25 = v64;
      uint64_t v66 = ne_log_obj(v64, v65);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      uint64_t v67 = strerror(v25);
      LODWORD(v117) = 136315138;
      *(void *)((char *)&v117 + 4) = v67;
      id v29 = "SIOCSIFDESC failed with, %s";
LABEL_56:
      unsigned __int8 v54 = (uint8_t *)&v117;
LABEL_57:
      int v68 = v27;
      id v69 = 12;
      goto LABEL_58;
    default:
LABEL_59:
      id v70 = v3;
      id v14 = 22LL;
      goto LABEL_74;
  }

uint64_t sub_100012390(unsigned int a1, uint64_t a2, int a3)
{
  int v5 = socket(a3, 2, 0);
  if (v5 < 0) {
    return *__error();
  }
  int v6 = v5;
  int v7 = ioctl(v5, a1, a2);
  close(v6);
  if (v7 < 0) {
    return *__error();
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100012404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v6 = *(unsigned __int8 *)(a2 + 1);
  if (v6 == 30)
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v29 = 0u;
    memset(v28, 0, sizeof(v28));
    __strlcpy_chk(v28, a1, 16LL, 16LL);
    LOWORD(v28[1]) = 7708;
    *(_OWORD *)((char *)&v28[1] + _Block_object_dispose(va, 8) = *(_OWORD *)(a2 + 8);
    if (a3)
    {
      WORD4(v30) = 7708;
      __int128 v31 = *(_OWORD *)(a3 + 8);
    }

    if (a4) {
      uint64_t v13 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v13 = -1LL;
    }
    *((void *)&v33 + sub_100006AB8((uint64_t)&OBJC_CLASS___NEHelperTrackerManager, 0LL, 1) = v13;
    if (*(unsigned __int8 *)(a2 + 8) == 254 && (*(_BYTE *)(a2 + 9) & 0xC0) == 0x80)
    {
      uint64_t v14 = sub_100012390(0xC0806982, (uint64_t)v28, 30);
      if ((_DWORD)v14)
      {
        uint64_t v9 = v14;
        uint64_t v16 = ne_log_obj(v14, v15);
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        int v26 = 136315138;
        uint64_t v27 = strerror(v9);
        __int128 v18 = "Couldn't set link-local IPv6 address, %s";
        goto LABEL_24;
      }
    }

    else
    {
      uint64_t v19 = sub_100012390(0x8080691A, (uint64_t)v28, 30);
      if ((_DWORD)v19)
      {
        uint64_t v9 = v19;
        uint64_t v21 = ne_log_obj(v19, v20);
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        int v26 = 136315138;
        uint64_t v27 = strerror(v9);
        __int128 v18 = "Couldn't set IPv6 address, %s";
LABEL_24:
        __int128 v22 = v17;
        uint32_t v23 = 12;
        goto LABEL_30;
      }
    }

    return 0LL;
  }

  if (v6 == 2)
  {
    __strlcpy_chk(v28, a1, 16LL, 16LL);
    v28[1] = 0x210uLL;
    DWORD1(v28[1]) = *(_DWORD *)(a2 + 4);
    v28[2] = __PAIR64__(DWORD1(v28[1]), 528);
    __int128 v29 = 0uLL;
    if (a3)
    {
      LOWORD(v29) = 528;
      DWORD1(v29) = *(_DWORD *)(a3 + 4);
    }

    uint64_t v7 = sub_100012390(0x8040691A, (uint64_t)v28, 2);
    if (!(_DWORD)v7) {
      return 0LL;
    }
    uint64_t v9 = v7;
    if ((_DWORD)v7 == 17)
    {
      uint64_t v10 = ne_log_obj(v7, v8);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Couldn't set interface address, already exists",  (uint8_t *)&v26,  2u);
      }

      return 0LL;
    }

    uint64_t v24 = ne_log_obj(v7, v8);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      return v9;
    }

    LOWORD(v26) = 0;
    __int128 v18 = "Couldn't set interface address";
    __int128 v22 = v17;
    uint32_t v23 = 2;
LABEL_30:
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v26, v23);
    goto LABEL_27;
  }

  return 22LL;
}

void sub_100013EA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013F54(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = v4;
  if (!v4 || xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_35;
  }
  size_t length = 0LL;
  data = xpc_dictionary_get_data(v5, "interface-option-data", &length);
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "interface-option");
  if (uint64)
  {
    int v8 = uint64;
    if (setsockopt(*(_DWORD *)(a1 + 56), 2, uint64, data, length))
    {
      int v9 = *__error();
      uint64_t v10 = strerror_r(v9, __strerrbuf, 0x80uLL);
      if ((_DWORD)v10) {
        __strerrbuf[0] = 0;
      }
      uint64_t v12 = ne_log_obj(v10, v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 67109634;
        int v46 = v8;
        __int16 v47 = 1024;
        int v48 = v9;
        __int16 v49 = 2080;
        char v50 = __strerrbuf;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to set socket option %d on kernel control socket: [%d] %s",  buf,  0x18u);
      }
    }
  }

  if (xpc_dictionary_get_BOOL(v5, "interface-bind-channel-pid") && xpc_dictionary_get_uint64(v5, "interface-type") == 2)
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
    uint64_t v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    __int128 v17 = v15;
    if (v15)
    {
      uint64_t pid = xpc_connection_get_pid(v15);
      int v19 = pid;
      int v43 = pid;
      uint64_t v21 = ne_log_obj(pid, v20);
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__strerr__int128 buf = 67109120;
        LODWORD(v52) = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "binding ipsec channel to pid: %d",  (uint8_t *)__strerrbuf,  8u);
      }

      if (!setsockopt(*(_DWORD *)(a1 + 56), 2, 17, &v43, 4u)) {
        goto LABEL_22;
      }
      int v23 = *__error();
      uint64_t v24 = strerror_r(v23, __strerrbuf, 0x80uLL);
      if ((_DWORD)v24) {
        __strerrbuf[0] = 0;
      }
      uint64_t v26 = ne_log_obj(v24, v25);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 67109634;
        int v46 = 17;
        __int16 v47 = 1024;
        int v48 = v23;
        __int16 v49 = 2080;
        char v50 = __strerrbuf;
        uint64_t v28 = "Failed to set socket option %d on kernel control socket: [%d] %s";
        __int128 v29 = buf;
        __int128 v30 = v27;
        uint32_t v31 = 24;
LABEL_37:
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v28, v29, v31);
      }
    }

    else
    {
      uint64_t v32 = ne_log_obj(0LL, v16);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = *(void *)(a1 + 32);
        *(_DWORD *)__strerr__int128 buf = 138412290;
        uint64_t v52 = v42;
        uint64_t v28 = "Could not get remote connection for message: %@";
        __int128 v29 = (uint8_t *)__strerrbuf;
        __int128 v30 = v27;
        uint32_t v31 = 12;
        goto LABEL_37;
      }
    }

LABEL_22:
  }

  uuid = xpc_dictionary_get_uuid(v5, "interface-bind-channel-exec-uuid");
  if (uuid)
  {
    uint64_t v34 = uuid;
    if (xpc_dictionary_get_uint64(v5, "interface-type") == 2)
    {
      if (setsockopt(*(_DWORD *)(a1 + 56), 2, 20, v34, 0x10u))
      {
        int v35 = *__error();
        uint64_t v36 = strerror_r(v35, __strerrbuf, 0x80uLL);
        if ((_DWORD)v36) {
          __strerrbuf[0] = 0;
        }
        uint64_t v38 = ne_log_obj(v36, v37);
        CFErrorRef v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 67109634;
          int v46 = 20;
          __int16 v47 = 1024;
          int v48 = v35;
          __int16 v49 = 2080;
          char v50 = __strerrbuf;
          _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Failed to set socket option %d on kernel control socket: [%d] %s",  buf,  0x18u);
        }
      }
    }
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    CStringPtr = CFStringGetCStringPtr(@"DisableTrafficShaping", 0x8000100u);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_BOOL(v5, CStringPtr);
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = xpc_dictionary_get_BOOL(v5, "interface-direct-link");
  }
LABEL_35:

  return 1LL;
}

LABEL_54:
    }

    else
    {
      uint64_t v42 = 0LL;
    }

    int v43 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.developer.networking.networkextension");

    __int16 v88 = v42;
    if (NEGetEntitlement(v43))
    {
      objc_storeStrong((id *)&v5->_applicationID, v5->_bundleID);
      v5->_entitled = 1;
      v5->_hasProviderPermission = 1;
      else {
        objc_storeStrong((id *)&v5->_appGroups, v42);
      }
    }

    else if (!v5->_entitled && [v42 count])
    {
      __int16 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
      int v48 = [v47 copyAppGroupMapDidChange:0];

      id v91 = 0u;
      uint64_t v92 = 0u;
      uint64_t v89 = 0u;
      uint64_t v90 = 0u;
      __int16 v49 = v42;
      char v50 = [v49 countByEnumeratingWithState:&v89 objects:v108 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v90;
        while (2)
        {
          for (j = 0LL; j != v51; j = (char *)j + 1)
          {
            if (*(void *)v90 != v52) {
              objc_enumerationMutation(v49);
            }
            unsigned __int8 v54 = objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:*(void *)(*((void *)&v89 + 1) + 8 * (void)j)]);
            if (v54)
            {
              applicationID = v5->_applicationID;
              v5->_applicationID = (NSString *)v54;

              v5->_entitled = 1;
              v5->_hasProviderPermission = 1;
              v5->_appGroupEntitled = 1;
              goto LABEL_56;
            }
          }

          uint64_t v51 = [v49 countByEnumeratingWithState:&v89 objects:v108 count:16];
          if (v51) {
            continue;
          }
          break;
        }
      }
}

LABEL_56:
    }

    id v64 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.networkextension.configuration");
    uint64_t v65 = v64;
    if (v64)
    {
      v5->_entitled = 1;
      v5->_hasProviderPermission = 1;
      v5->_platformEntitled = 1;
      if (xpc_get_type(v64) == (xpc_type_t)&_xpc_type_string)
      {
        string_ptr = xpc_string_get_string_ptr(v65);
        if (!strcmp(string_ptr, "super")) {
          v5->_superEntitled = 1;
        }
      }

      if (xpc_dictionary_get_BOOL(v4, "no-app-filter"))
      {
        uint64_t v67 = v5->_applicationID;
        v5->_applicationID = 0LL;
      }

      v5->_appGroupEntitled = 0;
    }

    int v68 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.networkextension.spi");
    id v69 = v68;
    if (v68 && xpc_get_type(v68) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v69)) {
      v5->_spiEntitled = 1;
    }
    id v70 = (void *)xpc_connection_copy_entitlement_value(v7, "get-task-allow");
    uint64_t v71 = v70;
    uint64_t v72 = v70 && xpc_get_type(v70) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v71);
    v5->_isDevelopment = v72;
    uint64_t v73 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.private.networkextension.test-control");
    id v74 = v73;
    if (v73 && xpc_get_type(v73) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v74)) {
      v5->_isTestClient = 1;
    }
    uint64_t v75 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    filter = v5->_filter;
    v5->_filter = v75;

    __int128 v77 = (id)xpc_dictionary_get_BOOL(v4, "no-app-filter");
    if ((v77 & 1) == 0) {
      __int128 v77 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_filter,  "setObject:forKeyedSubscript:",  v5->_userUUID,  @"user-uuid");
    }
    __int128 v79 = v5->_applicationID;
    if (v79) {
      __int128 v77 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_filter,  "setObject:forKeyedSubscript:",  v79,  @"application-id");
    }
    __int128 v80 = ne_log_obj(v77, v78);
    __int128 v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      __int128 v82 = v5->_clientName;
      __int128 v83 = v5->_bundleID;
      __int128 v84 = v5->_applicationID;
      entitled = v5->_entitled;
      hasProviderPermission = v5->_hasProviderPermission;
      *(_DWORD *)__int128 buf = 138413314;
      xpc_object_t v99 = v82;
      uint64_t v100 = 2112;
      id v101 = v83;
      objc_super v102 = 2112;
      uint64_t v103 = v84;
      v104 = 1024;
      __int16 v105 = entitled;
      uint64_t v106 = 1024;
      __int16 v107 = hasProviderPermission;
      _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_INFO,  "Created a new configuration delegate with name = %@, bundleID = %@, applicationID = %@, entitled = %d, hasProvid erPermission = %d",  buf,  0x2Cu);
    }

    goto LABEL_84;
  }

  uint64_t v44 = ne_log_obj(type, v20);
  id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Operation failed, client is not signed",  buf,  2u);
  }

  int v46 = 0LL;
LABEL_85:

  return v46;
}

LABEL_107:
      if (!v125)
      {
        uint64_t v175 = ne_log_obj(v134, v135);
        id v176 = (os_log_s *)objc_claimAutoreleasedReturnValue(v175);
        if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
        {
          v225 = objc_getProperty(self, v177, 64LL, 1);
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v225;
          _os_log_error_impl( (void *)&_mh_execute_header,  v176,  OS_LOG_TYPE_ERROR,  "%@ cannot save a configuration, no configuration provided",  buf,  0xCu);
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 8LL, 0LL);
        goto LABEL_9;
      }

      id v151 = objc_claimAutoreleasedReturnValue([v125 pluginType]);
      v153 = (void *)v151;
      if (v10)
      {
        if (!v151 || (id v151 = (uint64_t)[(id)v151 isEqualToString:v10], (v151 & 1) == 0))
        {
          id v154 = ne_log_obj(v151, v152);
          id v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v154);
          if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
          {
            unsigned __int8 v254 = objc_getProperty(self, v156, 64LL, 1);
            *(_DWORD *)__int128 buf = 138412802;
            *(void *)&uint8_t buf[4] = v254;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v153;
            *(_WORD *)&_BYTE buf[22] = 2112;
            v318 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_ERROR,  "%@ trying to save a configuration with a bad plugin type (%@), plugin type for this client is %@",  buf,  0x20u);
          }

LABEL_196:
          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 10LL, 0LL);
          goto LABEL_9;
        }
      }

      else if (!v151)
      {
        v278 = 1;
        goto LABEL_151;
      }

      if (!self->_hasProviderPermission)
      {
        uint64_t v179 = ne_log_obj(v151, v152);
        id v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v179);
        if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
        {
          v261 = objc_getProperty(self, v180, 64LL, 1);
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v261;
          _os_log_error_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_ERROR,  "%@ is not allowed to save provider-based configurations",  buf,  0xCu);
        }

        goto LABEL_196;
      }

      v278 = 0;
LABEL_151:
      uint64_t v188 = (void *)objc_claimAutoreleasedReturnValue([v125 contentFilter]);
      v189 = v188 == 0LL;

      if (v189) {
        goto LABEL_164;
      }
      if (!v130 && !self->_isDevelopment)
      {
        int v191 = objc_getProperty(self, v190, 40LL, 1);
        if (v191)
        {
          id v193 = ne_log_obj(v191, v192);
          uint64_t v194 = (os_log_s *)objc_claimAutoreleasedReturnValue(v193);
          if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
          {
            v267 = objc_getProperty(self, v195, 64LL, 1);
            v269 = objc_getProperty(self, v268, 64LL, 1);
            *(_DWORD *)__int128 buf = 138412546;
            *(void *)&uint8_t buf[4] = v267;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v269;
            _os_log_error_impl( (void *)&_mh_execute_header,  v194,  OS_LOG_TYPE_ERROR,  "%@ trying to create a content filter configuration through an app. Creating a content filter configuration is only allowed through profile in production version of %@.",  buf,  0x16u);
          }

          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 10LL, 0LL);
          goto LABEL_9;
        }
      }

      if (!objc_opt_class(&OBJC_CLASS___MCProfileConnection)
        || (int v196 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection")),  v197 = [v196 isSupervised],  v196,  (v197 & 1) == 0))
      {
        uint64_t v198 = (void *)objc_claimAutoreleasedReturnValue([v125 externalIdentifier]);
        id v199 = v198 == 0LL;

        if (v199)
        {
          if (!self->_isDevelopment || (v200 = objc_getProperty(self, v201, 40LL, 1)) == 0LL)
          {
            id v226 = ne_log_obj(v200, v201);
            id v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v226);
            if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
            {
              id v266 = objc_getProperty(self, v227, 64LL, 1);
              *(_DWORD *)__int128 buf = 138412290;
              *(void *)&uint8_t buf[4] = v266;
              _os_log_error_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_ERROR,  "%@ trying to save a content filter configuration on an unsupervised device",  buf,  0xCu);
            }

            goto LABEL_196;
          }

          uint64_t v221 = ne_log_obj(v200, v201);
          v222 = (os_log_s *)objc_claimAutoreleasedReturnValue(v221);
          if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
          {
            v271 = objc_getProperty(self, v223, 64LL, 1);
            v273 = objc_getProperty(self, v272, 64LL, 1);
            *(_DWORD *)__int128 buf = 138412546;
            *(void *)&uint8_t buf[4] = v271;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v273;
            _os_log_error_impl( (void *)&_mh_execute_header,  v222,  OS_LOG_TYPE_ERROR,  "Warning: allowing creation/modification of a content filter configuration on non-supervised device because the requesting app (%@) is a development version. This will not be allowed for the production version of %@",  buf,  0x16u);
          }
        }
      }

      if (self->_superEntitled
        || (uint64_t v202 = (void *)objc_claimAutoreleasedReturnValue([v125 externalIdentifier])) == 0
        || (uint64_t v203 = (void *)objc_claimAutoreleasedReturnValue([v125 payloadInfo]),
            uint64_t v204 = [v203 profileSource] == (id)2,
            v203,
            v202,
            v204))
      {
LABEL_164:
        id v207 = (void *)objc_claimAutoreleasedReturnValue([v125 dnsProxy]);
        if (v207)
        {
          id v208 = [v125 grade] == (id)2;

          if (!v208)
          {
            id v209 = (void *)objc_claimAutoreleasedReturnValue([v125 payloadInfo]);
            uint64_t v210 = v209 == 0LL;

            if (v210)
            {
              if (!self->_isDevelopment && !self->_platformEntitled)
              {
                uint64_t v228 = ne_log_obj(v211, v212);
                id v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v228);
                if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
                {
                  v274 = objc_getProperty(self, v229, 64LL, 1);
                  v276 = objc_getProperty(self, v275, 64LL, 1);
                  *(_DWORD *)__int128 buf = 138412546;
                  *(void *)&uint8_t buf[4] = v274;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v276;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_ERROR,  "The production version of %@ is not allowed to create DNS proxy configurations. Use MDM to create DN S Proxy configurations for the production version of %@.",  buf,  0x16u);
                }

                goto LABEL_196;
              }
            }

            else if (!v130)
            {
              if (!self->_platformEntitled
                || (id v213 = (void *)objc_claimAutoreleasedReturnValue([v125 payloadInfo]),
                    id v214 = [v213 profileSource] == (id)2,
                    v213,
                    !v214))
              {
                id v215 = ne_log_obj(v211, v212);
                v216 = (os_log_s *)objc_claimAutoreleasedReturnValue(v215);
                if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)__int128 buf = 0;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v216,  OS_LOG_TYPE_ERROR,  "DNS Proxy configurations can only be created via MDM",  buf,  2u);
                }

                sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 21LL, 0LL);
                goto LABEL_9;
              }
            }
          }
        }

        id v231 = (void *)objc_claimAutoreleasedReturnValue([v125 dnsSettings]);
        if (v231)
        {
          __int128 v232 = [v125 grade] == (id)1;

          if (v232)
          {
            id v233 = objc_getProperty(self, v230, 40LL, 1);
            if (v233)
            {
              uint64_t v234 = ne_log_obj(v233, v230);
              id v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v234);
              if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
              {
                v265 = objc_getProperty(self, v235, 64LL, 1);
                *(_DWORD *)__int128 buf = 138412290;
                *(void *)&uint8_t buf[4] = v265;
                _os_log_error_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_ERROR,  "%@ trying to create an enterprise DNS Settings configuration through an app. Creating an enterprise DN S Settings configuration is only allowed through profile.",  buf,  0xCu);
              }

              goto LABEL_196;
            }
          }
        }

        if (objc_getProperty(self, v230, 40LL, 1))
        {
          objc_msgSend(v125, "setApplicationIdentifier:", objc_getProperty(self, v236, 40, 1));
          objc_msgSend(v125, "setApplication:", objc_getProperty(self, v237, 40, 1));
          id v239 = +[NELaunchServices bundleProxyForIdentifier:uid:plugins:]( &OBJC_CLASS___NELaunchServices,  "bundleProxyForIdentifier:uid:plugins:",  objc_getProperty(self, v238, 40LL, 1),  self->_userUID,  0LL);
          int v240 = (void *)objc_claimAutoreleasedReturnValue(v239);
          uint64_t v241 = v240;
          if (v240)
          {
            uint64_t v242 = (void *)objc_claimAutoreleasedReturnValue([v240 name]);
            [v125 setApplicationName:v242];
          }
        }

        if (self->_superEntitled)
        {
LABEL_204:
          if ((v278 & 1) != 0) {
            goto LABEL_209;
          }
          goto LABEL_205;
        }

        uint64_t v243 = (void *)objc_claimAutoreleasedReturnValue([v125 dnsSettings]);
        if (v243)
        {
LABEL_203:

          goto LABEL_204;
        }

        uint64_t v243 = (void *)objc_claimAutoreleasedReturnValue([v125 contentFilter]);
        if (v243) {
          v251 = v10 != 0LL;
        }
        else {
          v251 = 0;
        }
        if (!v251)
        {
          id v252 = objc_getProperty(self, v250, 40LL, 1);
          if (!v252) {
            goto LABEL_203;
          }
          __int128 v253 = v252;
          if (!v278)
          {
            v264 = +[NETunnelProviderProtocol isLegacyPluginType:]( &OBJC_CLASS___NETunnelProviderProtocol,  "isLegacyPluginType:",  v153);

            if ((v264 & 1) != 0)
            {
LABEL_205:
              int v244 = (void *)objc_claimAutoreleasedReturnValue([v125 appVPN]);
              if (v244
                || (int v244 = (void *)objc_claimAutoreleasedReturnValue([v125 contentFilter])) != 0)
              {
              }

              else
              {
                uint64_t v262 = (void *)objc_claimAutoreleasedReturnValue([v125 dnsProxy]);
                v263 = v262 == 0LL;

                if (v263) {
                  goto LABEL_209;
                }
              }

              sub_1000170FC((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager, v153, v125);
LABEL_209:
              uint64_t v245 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
              v247 = objc_getProperty(self, v246, 48LL, 1);
              __int16 v249 = objc_getProperty(self, v248, 32LL, 1);
              v309[0] = _NSConcreteStackBlock;
              v309[1] = 3221225472LL;
              v309[2] = sub_10001747C;
              v309[3] = &unk_100035190;
              v310 = v4;
              [v245 saveConfigurationToDisk:v125 currentSignature:v130 userUUID:v247 isUpgrade:0 completionQueue:v249 completionHandler:v309];

              goto LABEL_9;
            }

LABEL_218:
            sub_100016FCC(self, v125, v130, v4);
            goto LABEL_9;
          }
        }

        goto LABEL_218;
      }

      __int128 v255 = ne_log_obj(v205, v206);
      v256 = (os_log_s *)objc_claimAutoreleasedReturnValue(v255);
      if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR))
      {
        v270 = objc_getProperty(self, v257, 64LL, 1);
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v270;
        _os_log_error_impl( (void *)&_mh_execute_header,  v256,  OS_LOG_TYPE_ERROR,  "%@ perApp content filter configuration can only be created via MDM",  buf,  0xCu);
      }

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 21LL, 0LL);
LABEL_9:

      return;
    case 4LL:
      if (self->_appGroupEntitled)
      {
        __int128 v121 = ne_log_obj(v16, v17);
        __int128 v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = objc_getProperty(self, v123, 64LL, 1);
          _os_log_error_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_ERROR,  "%@ is not allowed to remove configurations because it is only app group entitled",  buf,  0xCu);
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 10LL, 0LL);
      }

      else
      {
        uuid = xpc_dictionary_get_uuid(v4, "config-identifier");
        if (!uuid) {
          goto LABEL_115;
        }
        unsigned __int8 v54 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", uuid);
        __int128 v56 = ne_log_obj(v54, v55);
        __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = objc_getProperty(self, v58, 64LL, 1);
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v54;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_INFO,  "%@ is removing configuration %@",  buf,  0x16u);
        }

        __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
        unsigned int v61 = objc_getProperty(self, v60, 32LL, 1);
        v305[0] = _NSConcreteStackBlock;
        v305[1] = 3221225472LL;
        v305[2] = sub_1000174B8;
        v305[3] = &unk_1000351E0;
        v305[4] = self;
        v308 = 0;
        v306 = v4;
        v307 = v54;
        id v62 = v54;
        [v59 loadConfigurationWithID:v62 withCompletionQueue:v61 handler:v305];
      }

      goto LABEL_9;
    case 5LL:
      *(void *)__int128 buf = 0LL;
      char v63 = xpc_dictionary_get_data(v4, "identity-reference", (size_t *)buf);
      uint64_t v65 = objc_getProperty(self, v64, 40LL, 1);
      if (v65)
      {
      }

      else if (!self->_appGroupEntitled)
      {
        if (v63) {
          id v144 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v63,  *(void *)buf,  0LL));
        }
        else {
          id v144 = 0LL;
        }
        uint64_t v181 = +[NEIdentityKeychainItem copyIdentities:fromDomain:]( &OBJC_CLASS___NEIdentityKeychainItem,  "copyIdentities:fromDomain:",  v144,  0LL);
        id v145 = v181;
        if (v181) {
          uint64_t v146 = (void *)_CFXPCCreateXPCObjectFromCFObject(v181);
        }
        else {
          uint64_t v146 = 0LL;
        }
        id v147 = 0LL;
LABEL_97:
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, v147, v146);

        goto LABEL_9;
      }

      id v144 = 0LL;
      id v145 = 0LL;
      uint64_t v146 = 0LL;
      id v147 = 10LL;
      goto LABEL_97;
    case 6LL:
      sub_1000176B4(self, v4);
      goto LABEL_9;
    case 7LL:
      if (!self->_superEntitled) {
        goto LABEL_115;
      }
      uint64_t v66 = xpc_dictionary_get_uuid(v4, "config-identifier");
      if (!v66) {
        goto LABEL_115;
      }
      uint64_t v67 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v66);
      int v68 = sub_10001782C((uint64_t)&OBJC_CLASS___NEHelperPendingOperation, v67);
      id v70 = v68;
      if (v68 && v68[2] == 3LL)
      {
        uint64_t v71 = objc_msgSend(objc_getProperty(v68, v69, 32, 1), "dnsProxy");
        uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
        uint64_t v73 = v72 == 0LL;

        if (v73)
        {
          uint64_t v182 = objc_msgSend(objc_getProperty(v70, v74, 32, 1), "contentFilter");
          v183 = (void *)objc_claimAutoreleasedReturnValue(v182);
          CFBooleanRef v184 = v183 == 0LL;

          if (v184)
          {
            v217 = objc_msgSend(objc_getProperty(v70, v185, 32, 1), "relay");
            v218 = (void *)objc_claimAutoreleasedReturnValue(v217);
            id v219 = v218 == 0LL;

            if (v219) {
              uint64_t v220 = NEResourcesCopyLocalizedNSString(@"APP_AUTHEN_HEADER_VPN", @"APP_AUTHEN_HEADER_VPN");
            }
            else {
              uint64_t v220 = NEResourcesCopyLocalizedNSString( @"APP_AUTHEN_HEADER_RELAY",  @"APP_AUTHEN_HEADER_RELAY");
            }
            uint64_t v76 = objc_claimAutoreleasedReturnValue(v220);
          }

          else
          {
            uint64_t v186 = NEResourcesCopyLocalizedNSString( @"APP_AUTHEN_HEADER_FILTER",  @"APP_AUTHEN_HEADER_FILTER");
            uint64_t v76 = objc_claimAutoreleasedReturnValue(v186);
          }
        }

        else
        {
          uint64_t v75 = NEResourcesCopyLocalizedNSString( @"APP_AUTHEN_HEADER_DNS_PROXY",  @"APP_AUTHEN_HEADER_DNS_PROXY");
          uint64_t v76 = objc_claimAutoreleasedReturnValue(v75);
        }

        id v258 = (void *)v76;
        id v259 = objc_getProperty(self, v77, 32LL, 1);
        v302[0] = _NSConcreteStackBlock;
        v302[1] = 3221225472LL;
        v302[2] = sub_100017938;
        v302[3] = &unk_100035230;
        v302[4] = self;
        v303 = v70;
        v304 = v4;
        id v260 = v70;
        +[NEUserNotification promptForLocalAuthenticationWithReason:completionQueue:completionHandler:]( &OBJC_CLASS___NEUserNotification,  "promptForLocalAuthenticationWithReason:completionQueue:completionHandler:",  v258,  v259,  v302);
      }

      else
      {

LABEL_115:
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 8LL, 0LL);
      }

      goto LABEL_9;
    case 8LL:
      __int128 v78 = xpc_dictionary_get_string(v4, "client-name");
      if (v78)
      {
        __int128 v79 = sub_10000F110((uint64_t)&OBJC_CLASS___NEHelperServer);
        __int128 v80 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v79);
        __int128 v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v78));
        __int128 v82 = sub_100010B38(v80, v81);

        *(void *)__int128 buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000LL;
        v318 = sub_100017AA0;
        v319 = sub_100017AC8;
        v320 = 0LL;
        v298[0] = _NSConcreteStackBlock;
        v298[1] = 3221225472LL;
        v298[2] = sub_100017AD0;
        v298[3] = &unk_100035280;
        v300 = self;
        v301 = buf;
        v299 = v4;
        __int128 v83 = objc_retainBlock(v298);
        __int128 v84 = objc_retainBlock(v83);
        uint64_t v85 = *(void **)(*(void *)&buf[8] + 40LL);
        *(void *)(*(void *)&buf[8] + 40LL) = v84;

        ((void (*)(void *, NSMutableArray *, void))v83[2])(v83, v82, 0LL);
        _Block_object_dispose(buf, 8);
      }

      else
      {
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 22LL, 0LL);
      }

      goto LABEL_9;
    case 9LL:
      __int128 v117 = xpc_dictionary_get_string(v4, "config-plugin-type");
      if (v117)
      {
        __int128 v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v117));
        __int128 v119 = sub_100017C50(v118);

        else {
          __int128 v120 = 0LL;
        }
      }

      else
      {
        __int128 v120 = 0LL;
      }

      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 0LL, v120);

      goto LABEL_9;
    case 11LL:
      sub_100017770(self, v4);
      goto LABEL_9;
    case 13LL:
      uint64_t v86 = xpc_dictionary_get_value(v4, "config-ids");
      CFIndex v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
      __int16 v88 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
      uint64_t v90 = objc_getProperty(self, v89, 32LL, 1);
      v289[0] = _NSConcreteStackBlock;
      v289[1] = 3221225472LL;
      v289[2] = sub_1000186AC;
      v289[3] = &unk_1000352F8;
      v290 = v4;
      [v88 syncConfigurationsWithSC:v87 completionQueue:v90 completionHandler:v289];

      goto LABEL_9;
    case 14LL:
      uint64_t v92 = xpc_dictionary_get_uuid(v4, "config-identifier");
      if (!v92)
      {
        id v141 = ne_log_obj(0LL, v91);
        uint64_t v142 = (os_log_s *)objc_claimAutoreleasedReturnValue(v141);
        if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_ERROR, "Invalid configuration ID", buf, 2u);
        }

        goto LABEL_88;
      }

      id v93 = xpc_dictionary_get_BOOL(v4, "enabled");
      id v94 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v92);
      uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
      uint64_t v97 = objc_getProperty(self, v96, 56LL, 1);
      xpc_object_t v99 = objc_getProperty(self, v98, 32LL, 1);
      v284[0] = _NSConcreteStackBlock;
      v284[1] = 3221225472LL;
      v284[2] = sub_1000186C8;
      v284[3] = &unk_100035348;
      v285 = v94;
      v286 = v4;
      v287 = self;
      v288 = v93;
      uint64_t v100 = v94;
      [v95 loadIndexWithFilter:v97 completionQueue:v99 handler:v284];

      goto LABEL_9;
    case 15LL:
      id v101 = xpc_dictionary_get_string(v4, "app-bundle-id");
      objc_super v102 = xpc_dictionary_get_BOOL(v4, "enable-required");
      if (v101)
      {
        v104 = v102;
        __int16 v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v101));
        uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
        pid_t v108 = objc_getProperty(self, v107, 32LL, 1);
        v279[0] = _NSConcreteStackBlock;
        v279[1] = 3221225472LL;
        v279[2] = sub_1000188B4;
        v279[3] = &unk_100035370;
        v283 = v104;
        v280 = v105;
        v281 = self;
        v282 = v4;
        xpc_object_t v109 = v105;
        [v106 loadConfigurations:0 withFilter:0 completionQueue:v108 completionHandler:v279];
      }

      else
      {
        v143 = ne_log_obj(v102, v103);
        uint64_t v142 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
        if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v142,  OS_LOG_TYPE_ERROR,  "Failed to check config, invalid bundle ID",  buf,  2u);
        }

LABEL_88:
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 22LL, 0LL);
      }

      goto LABEL_9;
    case 16LL:
      __int128 v110 = xpc_dictionary_get_string(v4, "bundle-id");
      __int128 v111 = xpc_dictionary_get_int64(v4, "pid");
      __int128 v112 = (NSUUID *)xpc_dictionary_get_uuid(v4, "uuid");
      __int128 v114 = v112;
      if (v112)
      {
        __int128 v112 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v112);
        __int128 v114 = v112;
      }

      if (!v110 && !v111)
      {
        __int128 v115 = ne_log_obj(v112, v113);
        __int128 v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_ERROR,  "Failed to get bundle ID or PID from message",  buf,  2u);
        }

LABEL_57:
        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 22LL, 0LL);
        goto LABEL_128;
      }

      if (v110)
      {
        id v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v110));
        if (!v139)
        {
          uint64_t v140 = ne_log_obj(0LL, v138);
          __int128 v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 136315138;
            *(void *)&uint8_t buf[4] = v110;
            _os_log_error_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_ERROR,  "Failed to convert BundleID for message (bundle_id: %s)",  buf,  0xCu);
          }

          goto LABEL_57;
        }
      }

      else
      {
        id v139 = 0LL;
      }

      unsigned int v158 = xpc_dictionary_get_string(v4, "query");
      if (v158)
      {
        id v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v158));
        if (v160) {
          goto LABEL_127;
        }
        uint64_t v161 = ne_log_obj(0LL, v159);
        id v162 = (os_log_s *)objc_claimAutoreleasedReturnValue(v161);
        if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int128 buf = 136315138;
          *(void *)&uint8_t buf[4] = v158;
          double v163 = "Failed to convert query (query_string: %s)";
          uint64_t v164 = v162;
          id v165 = 12;
LABEL_182:
          _os_log_debug_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_DEBUG, v163, buf, v165);
        }
      }

      else
      {
        id v169 = ne_log_obj(0LL, v157);
        id v162 = (os_log_s *)objc_claimAutoreleasedReturnValue(v169);
        if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)__int128 buf = 0;
          double v163 = "No query string in message";
          uint64_t v164 = v162;
          id v165 = 2;
          goto LABEL_182;
        }
      }

      id v160 = 0LL;
LABEL_127:
      uint64_t v170 = xpc_dictionary_get_BOOL(v4, "has-entitlement");
      id v171 = sub_100017D5C((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager);
      int v172 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v171);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100017DA0;
      block[3] = &unk_1000352D0;
      void block[4] = self;
      v292 = v139;
      v296 = v111;
      v293 = v4;
      v294 = v114;
      v295 = v160;
      v297 = v170;
      v173 = v160;
      id v174 = v139;
      dispatch_async(v172, block);

LABEL_128:
      goto LABEL_9;
    default:
      goto LABEL_9;
  }

void sub_100016C14(_Unwind_Exception *a1)
{
}

void sub_100016CF8(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  int v5 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  if (v8) {
    -[NSKeyedArchiver encodeObject:forKey:](v5, "encodeObject:forKey:", v8, @"config-index");
  }
  -[NSKeyedArchiver encodeInt64:forKey:](v5, "encodeInt64:forKey:", a3, @"config-generation");
  -[NSKeyedArchiver finishEncoding](v5, "finishEncoding");
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v5, "encodedData"));
  xpc_object_t v7 = xpc_data_create([v6 bytes], (size_t)objc_msgSend(v6, "length"));
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 32), 0LL, v7);
}

void sub_100016DD8(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  xpc_object_t v8 = a2;
  id v9 = a3;
  id v10 = a5;
  if (v8)
  {
    uint64_t v11 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v12 = -[NSArray initWithArray:copyItems:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:copyItems:", v8, 1LL);
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend( *(id *)(*((void *)&v20 + 1) + 8 * (void)v16),  "copyPasswordsFromSystemKeychain",  (void)v20);
          uint64_t v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      }

      while (v14);
    }

    __int128 v17 = v12;
    -[NSKeyedArchiver encodeObject:forKey:](v11, "encodeObject:forKey:", v17, @"config-objects");

    -[NSKeyedArchiver finishEncoding](v11, "finishEncoding");
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v11, "encodedData"));
    xpc_object_t v8 = xpc_data_create([v18 bytes], (size_t)objc_msgSend(v18, "length"));

    if (v9) {
      goto LABEL_10;
    }
LABEL_12:
    id v19 = 0LL;
    goto LABEL_13;
  }

  __int128 v17 = 0LL;
  if (!v9) {
    goto LABEL_12;
  }
LABEL_10:
  id v19 = objc_msgSend(v9, "code", (void)v20);
LABEL_13:
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 32), (int64_t)v19, v8);
}

void sub_100016FCC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  id v12 = objc_getProperty(a1, v11, 56LL, 1);
  id Property = objc_getProperty(a1, v13, 32LL, 1);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10001B67C;
  v18[3] = &unk_100035118;
  id v15 = v9;
  id v19 = v15;
  id v16 = v7;
  id v20 = v16;
  id v17 = v8;
  id v21 = v17;
  __int128 v22 = a1;
  [v10 loadConfigurations:0 withFilter:v12 completionQueue:Property completionHandler:v18];
}

void sub_1000170FC(uint64_t a1, void *a2, void *a3)
{
  int v5 = a2;
  id v6 = a3;
  objc_opt_self(a1);
  id v7 = sub_10000F110((uint64_t)&OBJC_CLASS___NEHelperServer);
  id v8 = (_BYTE *)objc_claimAutoreleasedReturnValue(v7);
  if (v8 && (char v10 = v8[12], v8, (v10 & 1) != 0))
  {
    id v34 = 0LL;
    id v13 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v5 allowPlaceholder:0 error:&v34];
    id v14 = (os_log_s *)v34;
    id v12 = v14;
    if (v14 || !v13)
    {
      uint64_t v32 = ne_log_obj(v14, v15);
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v36 = v5;
        __int16 v37 = 2112;
        uint64_t v38 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Did not find an app with bundle ID %@, cannot add app rules from app mapping: %@",  buf,  0x16u);
      }
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 entitlements]);
      id v17 = [v16 objectForKey:@"com.apple.developer.networking.networkextension" ofClass:objc_opt_class(NSArray)];
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);

      if (-[os_log_s count](v18, "count"))
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 entitlements]);
        id v20 = [v19 objectForKey:@"get-task-allow" ofClass:objc_opt_class(NSNumber)];
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v13 entitlements]);
        id v23 = [v22 objectForKey:@"com.apple.private.networkextension.test-control" ofClass:objc_opt_class(NSNumber)];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

        if (([v21 BOOLValue] & 1) != 0 || objc_msgSend(v24, "BOOLValue"))
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v13 URL]);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v25));

          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 infoDictionary]);
          if (isa_nsdictionary())
          {
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"NETestAppMapping"]);
            if (isa_nsdictionary())
            {
              id v29 = [v28 count];
              if (v29)
              {
                uint64_t v31 = ne_log_obj(v29, v30);
                log = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)__int128 buf = 138412546;
                  uint64_t v36 = @"NETestAppMapping";
                  __int16 v37 = 2112;
                  uint64_t v38 = (os_log_s *)v5;
                  _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Setting app rules from the %@ for %@",  buf,  0x16u);
                }

                sub_10001AFE4((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager, v28, v6);
              }
            }
          }
        }
      }
    }
  }

  else
  {
    uint64_t v11 = ne_log_obj(v8, v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v36 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "LaunchServices is not available, cannot add app rules from app mapping from app %@",  buf,  0xCu);
    }
  }
}

void sub_10001747C(uint64_t a1, void *a2)
{
}

void sub_1000174B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v15 = *(void **)(a1 + 40);
    int64_t v16 = 7LL;
LABEL_13:
    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v15, v16, 0LL);
    goto LABEL_14;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pluginType]);
  if (!v7 || (uint64_t v8 = *(void *)(a1 + 32)) != 0 && (*(_BYTE *)(v8 + 14) & 1) != 0)
  {
  }

  else
  {
    int v9 = *(unsigned __int8 *)(a1 + 56);

    if (!v9)
    {
      uint64_t v12 = ne_log_obj(v10, v11);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v14, 64LL, 1);
        }
        *(_DWORD *)__int128 buf = 138412290;
        id v28 = Property;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ is not allowed to remove provider-based configurations",  buf,  0xCu);
      }

      uint64_t v15 = *(void **)(a1 + 40);
      int64_t v16 = 10LL;
      goto LABEL_13;
    }
  }

  sub_10001A3E0(*(void *)(a1 + 32), v5);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  uint64_t v19 = *(void *)(a1 + 48);
  id v20 = *(void **)(a1 + 32);
  if (v20) {
    id v21 = objc_getProperty(v20, v17, 32LL, 1);
  }
  else {
    id v21 = 0LL;
  }
  __int128 v22 = *(void **)(a1 + 48);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001AEF8;
  v24[3] = &unk_1000351B8;
  id v25 = v22;
  id v26 = *(id *)(a1 + 40);
  [v18 removeConfigurationFromDisk:v19 completionQueue:v21 completionHandler:v24];

LABEL_14:
}

void sub_1000176B4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  id Property = objc_getProperty(a1, v5, 32LL, 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001AA4C;
  v8[3] = &unk_100035168;
  id v7 = v3;
  id v9 = v7;
  [v4 loadConfigurations:0 withFilter:0 completionQueue:Property completionHandler:v8];
}

void sub_100017770(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  id Property = objc_getProperty(a1, v5, 32LL, 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001A780;
  v8[3] = &unk_100035168;
  id v7 = v3;
  id v9 = v7;
  [v4 loadConfigurations:0 withFilter:0 completionQueue:Property completionHandler:v8];
}

id sub_10001782C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_100018EE0;
  uint64_t v15 = sub_100018EF0;
  id v16 = 0LL;
  sub_10001A644((uint64_t)&OBJC_CLASS___NEHelperPendingOperation);
  id v4 = (dispatch_queue_s *)qword_10003EBC0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001A680;
  v8[3] = &unk_1000354C0;
  id v9 = v3;
  uint64_t v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_100017920( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100017938(uint64_t a1, const char *a2)
{
  if ((_DWORD)a2)
  {
    id v3 = *(_BYTE **)(a1 + 40);
    if (v3) {
      char v4 = v3[8] & 1;
    }
    else {
      char v4 = 0;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      *(_BYTE *)(v5 + 16) = v4;
      id v6 = *(void **)(a1 + 32);
      id v3 = *(_BYTE **)(a1 + 40);
      if (!v3)
      {
LABEL_7:
        uint64_t v8 = v3;
        id v9 = *(void **)(a1 + 40);
        if (v9)
        {
          id Property = objc_getProperty(v9, v7, 40LL, 1);
          uint64_t v11 = *(void **)(a1 + 40);
        }

        else
        {
          uint64_t v11 = 0LL;
          id Property = 0LL;
        }

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100019F40;
        v14[3] = &unk_100035208;
        id v15 = v11;
        id v16 = *(id *)(a1 + 48);
        sub_100019FB0(v6, v8, Property, v14);

        return;
      }
    }

    else
    {
      id v6 = 0LL;
      if (!v3) {
        goto LABEL_7;
      }
    }

    id v3 = objc_getProperty(v3, a2, 32LL, 1);
    goto LABEL_7;
  }

  uint64_t v12 = *(void **)(a1 + 40);
  if (v12) {
    id v13 = objc_getProperty(v12, a2, 48LL, 1);
  }
  else {
    id v13 = 0LL;
  }
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v13, 10LL, 0LL);
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 48), 0LL, 0LL);
}

id sub_100017AA0(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100017AC8(uint64_t a1)
{
}

void sub_100017AD0(uint64_t a1, void *a2, id a3)
{
  id v5 = a2;
  if ([v5 count] == a3)
  {
    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 32), 22LL, 0LL);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0LL;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a3]);
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v9, "config-operation", 8LL);
    if (v8) {
      id Property = objc_getProperty(v8, v10, 24LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v13 = (_xpc_connection_s *)Property;
    id v14 = *(void **)(a1 + 40);
    if (v14) {
      id v15 = (dispatch_queue_s *)objc_getProperty(v14, v12, 32LL, 1);
    }
    else {
      id v15 = 0LL;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100019E50;
    v18[3] = &unk_100035258;
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 48);
    id v19 = v16;
    uint64_t v21 = v17;
    id v20 = v5;
    id v22 = a3;
    xpc_connection_send_message_with_reply(v13, v9, v15, v18);
  }
}

id sub_100017C50(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_100018EE0;
  id v13 = sub_100018EF0;
  id v14 = 0LL;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100019B08;
  v6[3] = &unk_1000353C0;
  uint64_t v8 = &v9;
  id v3 = v1;
  id v7 = v3;
  [v2 enumerateApplicationsOfType:0 block:v6];

  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_100017D44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100017D5C(uint64_t a1)
{
  if (qword_10003EB90 != -1) {
    dispatch_once(&qword_10003EB90, &stru_100034FC8);
  }
  return (id)qword_10003EB88;
}

void sub_100017DA0(uint64_t a1)
{
  uint64_t v82 = 0LL;
  __int128 v83 = &v82;
  uint64_t v84 = 0x3032000000LL;
  uint64_t v85 = sub_100018EE0;
  uint64_t v86 = sub_100018EF0;
  id v87 = 0LL;
  id v2 = *(__CFString **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v3,  0LL,  0LL));
    id v5 = v4;
    if (v4)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue([v4 teamIdentifier]);
      id v7 = (id)objc_claimAutoreleasedReturnValue([v5 SDKVersion]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 infoDictionary]);
      id v9 = [v8 objectForKey:@"NSBonjourServices" ofClass:objc_opt_class(NSObject)];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      BOOL v70 = v10 != 0LL;

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 entitlements]);
      id v12 = [v11 objectForKey:@"com.apple.developer.networking.multicast" ofClass:objc_opt_class(NSObject)];
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      BOOL v14 = v13 != 0LL;

      uint64_t v15 = NEResourcesCopyDevicePreferredLocalizations();
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 localizedNameWithPreferredLocalizations:v16]);
    }

    else
    {
      BOOL v70 = 0;
      BOOL v14 = 0;
      id v6 = 0LL;
      id v7 = 0LL;
      id v2 = 0LL;
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v3,  0LL));
    if (v17)
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"NSLocalNetworkUsageDescription"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedValuesForKeys:v18 fromTable:0]);

      if (!v19
        || (id v20 = (id)objc_claimAutoreleasedReturnValue([v19 stringForKey:@"NSLocalNetworkUsageDescription"])) == 0)
      {
        id v21 = [v17 objectForInfoDictionaryKey:@"NSLocalNetworkUsageDescription" ofClass:objc_opt_class(NSString)];
        id v20 = (id)objc_claimAutoreleasedReturnValue(v21);
      }
    }

    else
    {
      id v20 = 0LL;
    }
  }

  else
  {
    BOOL v70 = 0;
    BOOL v14 = 0;
    id v20 = 0LL;
    id v7 = 0LL;
    id v6 = 0LL;
  }

  id v22 = (__CFString *)v6;
  objc_storeStrong(&v87, v20);
  id v23 = v7;
  id v25 = v23;
  if (*(void *)(a1 + 40) && v2)
  {
    if (v23)
    {
      id v23 = [v23 doubleValue];
      BOOL v27 = v26 < 18.0;
    }

    else
    {
      BOOL v27 = 0;
    }

    if (!v70 && !v14 || v27 || v83[5])
    {
      if (!v22)
      {
        uint64_t v30 = ne_log_obj(v23, v24);
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = *(__CFString **)(a1 + 40);
          *(_DWORD *)__int128 buf = 138412546;
          uint64_t v89 = v32;
          __int16 v90 = 2112;
          id v91 = v2;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "No team ID found for (bundleID: %@, name: %@)",  buf,  0x16u);
        }

        id v22 = @"TEAMID";
      }

      uint64_t v33 = ne_log_obj(v23, v24);
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v67 = *(__CFString **)(a1 + 40);
        int v68 = *(_DWORD *)(a1 + 72);
        *(_DWORD *)__int128 buf = 138413058;
        uint64_t v89 = v2;
        __int16 v90 = 2112;
        id v91 = v22;
        __int16 v92 = 2112;
        id v93 = v67;
        __int16 v94 = 1024;
        LODWORD(v95) = v68;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "Got message for: %@ (%@.%@ PID %d)",  buf,  0x26u);
      }

      int v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v22,  *(void *)(a1 + 40)));
      uint64_t v36 = *(void *)(a1 + 32);
      id v37 = *(id *)(a1 + 48);
      uint64_t v38 = v35;
      CFErrorRef v39 = v38;
      if (v36)
      {
        if (qword_10003EBA8)
        {
          id v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([(id)qword_10003EBA8 objectForKeyedSubscript:v38]);
          uint64_t v42 = v40;
          if (v40 && (id v40 = (NSMutableArray *)-[NSMutableArray count](v40, "count")) != 0LL)
          {
            uint64_t v43 = ne_log_obj(v40, v41);
            uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__int128 buf = 138412290;
              uint64_t v89 = v39;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEBUG,  "We've already got a prompt outstanding for %@, joining queue",  buf,  0xCu);
            }

            -[NSMutableArray addObject:](v42, "addObject:", v37);
            char v45 = 0;
          }

          else
          {
            uint64_t v46 = ne_log_obj(v40, v41);
            __int16 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__int128 buf = 138412290;
              uint64_t v89 = v39;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "No prompts for %@, starting queue and prompting",  buf,  0xCu);
            }

            int v48 = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  v37,  0LL);
            char v45 = 1;
            uint64_t v42 = v48;
          }

          [(id)qword_10003EBA8 setObject:v42 forKeyedSubscript:v39];

          if ((v45 & 1) == 0) {
            goto LABEL_40;
          }
        }

        else
        {
          uint64_t v53 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          unsigned __int8 v54 = (void *)qword_10003EBA8;
          qword_10003EBA8 = (uint64_t)v53;

          uint64_t v55 = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  v37,  0LL);
          id v56 = [(id)qword_10003EBA8 setObject:v55 forKeyedSubscript:v39];
          uint64_t v58 = ne_log_obj(v56, v57);
          __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v89 = v39;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEBUG,  "First prompt, starting the queue with %@ and prompting",  buf,  0xCu);
          }
        }

        pid_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
        id v61 = sub_100017D5C((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager);
        id v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472LL;
        v71[2] = sub_100018EF8;
        v71[3] = &unk_1000352A8;
        v71[4] = *(void *)(a1 + 32);
        uint64_t v72 = v39;
        id v52 = v60;
        id v73 = v52;
        id v74 = *(id *)(a1 + 56);
        id v75 = *(id *)(a1 + 40);
        int v80 = *(_DWORD *)(a1 + 72);
        uint64_t v76 = v2;
        __int128 v77 = v22;
        id v63 = *(id *)(a1 + 64);
        char v81 = *(_BYTE *)(a1 + 76);
        id v78 = v63;
        __int128 v79 = &v82;
        [v52 loadConfigurations:0 withFilter:0 completionQueue:v62 completionHandler:v71];

LABEL_46:
        goto LABEL_47;
      }

LABEL_40:
      uint64_t v51 = ne_log_obj(v49, v50);
      id v52 = (id)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v89 = v39;
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v52,  OS_LOG_TYPE_DEBUG,  "Prompt for %@ enqueued, stopping",  buf,  0xCu);
      }

      goto LABEL_46;
    }

    uint64_t v64 = ne_log_obj(v23, v24);
    uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      id v69 = *(__CFString **)(a1 + 40);
      *(_DWORD *)__int128 buf = 138413058;
      uint64_t v89 = v69;
      __int16 v90 = 2112;
      id v91 = v2;
      __int16 v92 = 2112;
      id v93 = v22;
      __int16 v94 = 2112;
      uint64_t v95 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_ERROR,  "App did not provide a local network usage string, not prompting: (bundleID: %@, name: %@, teamID: %@, sdkVersion: %@)",  buf,  0x2Au);
    }

    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 48), 1LL, 0LL);
  }

  else
  {
    uint64_t v28 = ne_log_obj(v23, v24);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v66 = *(__CFString **)(a1 + 40);
      *(_DWORD *)__int128 buf = 138412802;
      uint64_t v89 = v66;
      __int16 v90 = 2112;
      id v91 = v2;
      __int16 v92 = 2112;
      id v93 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Could not find bundle ID or display name for app: (bundleID: %@, name: %@, teamID: %@)",  buf,  0x20u);
    }

    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 48), 22LL, 0LL);
  }

LABEL_47:
  _Block_object_dispose(&v82, 8);
}

void sub_100018664( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_1000186AC(uint64_t a1, void *a2)
{
}

void sub_1000186C8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:@"ConfigurationProperties"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:*(void *)(a1 + 32)]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Signature"]);
  uint64_t v6 = isa_nsdata(v5);
  if ((v6 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(a1 + 48);
    if (v11) {
      id Property = objc_getProperty(v11, v8, 32LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v13 = *(void **)(a1 + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100018B1C;
    v19[3] = &unk_100035320;
    id v20 = v13;
    id v21 = *(id *)(a1 + 40);
    char v24 = *(_BYTE *)(a1 + 56);
    id v14 = v5;
    uint64_t v15 = *(void *)(a1 + 48);
    id v22 = v14;
    uint64_t v23 = v15;
    [v9 loadConfigurationWithID:v10 withCompletionQueue:Property handler:v19];
  }

  else
  {
    uint64_t v16 = ne_log_obj(v6, v7);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v26 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "No signature found for configuration identifier %@",  buf,  0xCu);
    }

    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), 22LL, 0LL);
  }
}

void sub_1000188B4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v12)
  {
    id v13 = v12;
    id v32 = v11;
    id v33 = v10;
    uint64_t v14 = *(void *)v36;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 VPN]);
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          int v19 = *(unsigned __int8 *)(a1 + 56);
          if (*(_BYTE *)(a1 + 56)
            && (id v5 = (void *)objc_claimAutoreleasedReturnValue([v16 VPN]),
                ([v5 isEnabled] & 1) == 0))
          {
          }

          else
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 applicationIdentifier]);
            unsigned int v21 = [v20 isEqual:*(void *)(a1 + 32)];

            if (v19)
            {

              if ((v21 & 1) != 0) {
                goto LABEL_18;
              }
            }

            else
            {

              if (v21)
              {
LABEL_18:
                uint64_t v25 = ne_log_obj(v22, v23);
                uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  uint64_t v27 = *(void *)(a1 + 40);
                  uint64_t v28 = objc_claimAutoreleasedReturnValue([v16 applicationIdentifier]);
                  id v29 = (void *)v28;
                  int v30 = *(unsigned __int8 *)(a1 + 56);
                  *(_DWORD *)__int128 buf = 138412802;
                  uint64_t v40 = v27;
                  if (v30) {
                    uint64_t v31 = @" (enabled)";
                  }
                  else {
                    uint64_t v31 = &stru_100036298;
                  }
                  __int16 v41 = 2112;
                  uint64_t v42 = v28;
                  __int16 v43 = 2112;
                  uint64_t v44 = v31;
                  _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%@ Bundle id %@ has VPN configuration%@",  buf,  0x20u);
                }

                int64_t v24 = 0LL;
                id v11 = v32;
                id v10 = v33;
                goto LABEL_24;
              }
            }
          }
        }
      }

      id v13 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    id v11 = v32;
    id v10 = v33;
  }

  int64_t v24 = 7LL;
LABEL_24:

  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 48), v24, 0LL);
}

void sub_100018B1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = v6;
  if (!v5 || v6)
  {
    uint64_t v17 = ne_log_obj(v6, v7);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = *(void **)(a1 + 32);
      *(_DWORD *)__int128 buf = 138412546;
      __int128 v37 = v31;
      __int16 v38 = 2112;
      CFErrorRef v39 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to load configuration with ID %@: %@",  buf,  0x16u);
    }

    uint64_t v15 = *(void **)(a1 + 40);
    int64_t v16 = 3LL;
    goto LABEL_12;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 VPN]);

  if (!v9)
  {
    uint64_t v19 = ne_log_obj(v10, v11);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
      *(_DWORD *)__int128 buf = 138412290;
      __int128 v37 = v32;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Configuration %@ is not a VPN configuration",  buf,  0xCu);
    }

    uint64_t v15 = *(void **)(a1 + 40);
    int64_t v16 = 22LL;
    goto LABEL_12;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 VPN]);
  unsigned int v13 = [v12 isEnabled];
  int v14 = *(unsigned __int8 *)(a1 + 64);

  if (v14 == v13)
  {
    uint64_t v15 = *(void **)(a1 + 40);
    int64_t v16 = 0LL;
LABEL_12:
    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v15, v16, 0LL);
    goto LABEL_13;
  }

  uint64_t v21 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 VPN]);
  [v22 setEnabled:v21];

  int64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  uint64_t v26 = *(void *)(a1 + 48);
  id Property = *(id *)(a1 + 56);
  if (Property) {
    id Property = objc_getProperty(Property, v23, 48LL, 1);
  }
  id v28 = Property;
  id v29 = *(void **)(a1 + 56);
  if (v29) {
    id v30 = objc_getProperty(v29, v27, 32LL, 1);
  }
  else {
    id v30 = 0LL;
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100018DE4;
  v33[3] = &unk_1000351B8;
  id v34 = v5;
  id v35 = *(id *)(a1 + 40);
  [v24 saveConfigurationToDisk:v34 currentSignature:v26 userUUID:v28 isUpgrade:0 completionQueue:v30 completionHandler:v33];

LABEL_13:
}

void sub_100018DE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = ne_log_obj(v3, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      unsigned int v13 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to enable configuration %@: %@",  (uint8_t *)&v10,  0x16u);
    }

    int64_t v8 = 22LL;
  }

  else
  {
    int64_t v8 = 0LL;
  }

  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), v8, 0LL);
}

uint64_t sub_100018EE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100018EF0(uint64_t a1)
{
}

void sub_100018EF8(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v83 = a2;
  id v8 = a3;
  id v9 = a5;
  uint64_t v84 = v9;
  uint64_t v85 = a1;
  uint64_t v82 = v8;
  if (!v8)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v10, 48LL, 1);
    }
    id v81 = Property;
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager networkPrivacyConfigurationName]( &OBJC_CLASS___NEConfigurationManager,  "networkPrivacyConfigurationName"));
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    id v15 = v83;
    id v16 = [v15 countByEnumeratingWithState:&v94 objects:v107 count:16];
    if (v16)
    {
      uint64_t v86 = 0LL;
      uint64_t v17 = 0LL;
      uint64_t v18 = *(void *)v95;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v95 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)i);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 name]);
          unsigned int v22 = [v21 isEqualToString:v14];

          if (v22)
          {
            if (v17)
            {
              uint64_t v25 = ne_log_obj(v23, v24);
              uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                id v35 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
                *(_DWORD *)__int128 buf = 138543618;
                *(void *)&uint8_t buf[4] = v14;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v35;
                _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Found a duplicate %{public}@ configuration %{public}@, removing",  buf,  0x16u);
              }

              uint64_t v27 = *(void **)(v85 + 48);
              id v28 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
              id v29 = sub_100017D5C((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager);
              id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              v91[0] = _NSConcreteStackBlock;
              v91[1] = 3221225472LL;
              v91[2] = sub_1000199B0;
              v91[3] = &unk_1000351B8;
              id v92 = v14;
              id v93 = 0LL;
              [v27 removeConfigurationFromDisk:v28 completionQueue:v30 completionHandler:v91];

              uint64_t v31 = v92;
            }

            else
            {
              uint64_t v17 = v20;
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"ConfigurationProperties"]);
              id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NEConfiguration identifier](v17, "identifier"));
              id v33 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v32]);
              uint64_t v34 = objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"Signature"]);

              uint64_t v86 = (void *)v34;
            }
          }
        }

        id v16 = [v15 countByEnumeratingWithState:&v94 objects:v107 count:16];
      }

      while (v16);

      if (v17)
      {
LABEL_25:
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[NEConfiguration pathController](v17, "pathController"));
        BOOL v37 = v36 == 0LL;

        if (v37)
        {
          id v38 = objc_alloc_init(&OBJC_CLASS___NEPathController);
          -[NEConfiguration setPathController:](v17, "setPathController:", v38);
        }

        CFErrorRef v39 = (void *)objc_claimAutoreleasedReturnValue(-[NEConfiguration pathController](v17, "pathController"));
        [v39 setEnabled:1];

        if (*(void *)(v85 + 56))
        {
          id v40 = +[NEProcessInfo copyUUIDsForBundleID:uid:]( &OBJC_CLASS___NEProcessInfo,  "copyUUIDsForBundleID:uid:",  *(void *)(v85 + 64),  0LL);
          id v41 = [v40 containsObject:*(void *)(v85 + 56)];
          if ((v41 & 1) == 0)
          {
            uint64_t v43 = ne_log_obj(v41, v42);
            uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              uint64_t v45 = *(void *)(v85 + 56);
              uint64_t v46 = *(void *)(v85 + 64);
              *(_DWORD *)__int128 buf = 138412802;
              *(void *)&uint8_t buf[4] = v45;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v46;
              *(_WORD *)&_BYTE buf[22] = 2112;
              v104 = (uint64_t (*)(uint64_t, uint64_t))v40;
              _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "Received UUID %@ for %@ does not match cached UUIDs %@",  buf,  0x20u);
            }

            __int16 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NELaunchServices bundleProxyForIdentifier:uid:plugins:]( &OBJC_CLASS___NELaunchServices,  "bundleProxyForIdentifier:uid:plugins:",  *(void *)(v85 + 64),  0LL,  0LL));
            int v48 = v47;
            if (v47)
            {
              uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v47 machOUUIDs]);
              uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v48 machOUUIDs]);
              unsigned int v51 = [v50 containsObject:*(void *)(v85 + 56)];

              if (v51)
              {
                uint64_t v54 = ne_log_obj(v52, v53);
                uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  uint64_t v56 = *(void *)(v85 + 56);
                  *(_DWORD *)__int128 buf = 138412546;
                  *(void *)&uint8_t buf[4] = v56;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v49;
                  _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_INFO,  "Received UUID %@ does match launch services UUIDs %@",  buf,  0x16u);
                }
              }
            }
          }
        }

        *(void *)__int128 buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000LL;
        v104 = sub_100018EE0;
        __int16 v105 = sub_100018EF0;
        id v106 = 0LL;
        __int128 v87 = 0u;
        __int128 v88 = 0u;
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[NEConfiguration pathController](v17, "pathController"));
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v57 pathRules]);

        id v59 = [v58 countByEnumeratingWithState:&v87 objects:v102 count:16];
        if (v59)
        {
          uint64_t v60 = *(void *)v88;
          while (2)
          {
            for (j = 0LL; j != v59; j = (char *)j + 1)
            {
              if (*(void *)v88 != v60) {
                objc_enumerationMutation(v58);
              }
              id v62 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)j);
              id v63 = (void *)objc_claimAutoreleasedReturnValue([v62 matchSigningIdentifier]);
              unsigned int v64 = [v63 isEqualToString:*(void *)(v85 + 64)];

              if (v64)
              {
                objc_storeStrong((id *)(*(void *)&buf[8] + 40LL), v62);
                goto LABEL_49;
              }
            }

            id v59 = [v58 countByEnumeratingWithState:&v87 objects:v102 count:16];
            if (v59) {
              continue;
            }
            break;
          }
        }

LABEL_49:
        id v65 = [*(id *)(*(void *)&buf[8] + 40) multicastPreferenceSet];
        if (!(_DWORD)v65)
        {
          uint64_t v75 = ne_log_obj(v65, v66);
          uint64_t v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            uint64_t v77 = *(void *)(v85 + 64);
            *(_DWORD *)uint64_t v98 = 138412290;
            uint64_t v99 = v77;
            _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_INFO,  "Prompt for %@ denied because app is not in foreground, stopping",  v98,  0xCu);
          }

          sub_100019770(*(void *)(v85 + 32), *(void **)(v85 + 40), 0, 16LL);
          goto LABEL_60;
        }

        id v67 = [*(id *)(*(void *)&buf[8] + 40) denyMulticast];
        int v69 = (int)v67;
        if ((_DWORD)v67)
        {
          uint64_t v70 = ne_log_obj(v67, v68);
          uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            uint64_t v73 = *(void *)(v85 + 64);
            uint64_t v72 = *(void *)(v85 + 72);
            *(_DWORD *)uint64_t v98 = 138412546;
            uint64_t v99 = v72;
            __int16 v100 = 2112;
            uint64_t v101 = v73;
            id v74 = "Local network denied by preference for %@ (%@)";
LABEL_58:
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, v74, v98, 0x16u);
          }
        }

        else
        {
          uint64_t v78 = ne_log_obj(v67, v68);
          uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            uint64_t v80 = *(void *)(v85 + 64);
            uint64_t v79 = *(void *)(v85 + 72);
            *(_DWORD *)uint64_t v98 = 138412546;
            uint64_t v99 = v79;
            __int16 v100 = 2112;
            uint64_t v101 = v80;
            id v74 = "Local network allowed by preference for %@ (%@)";
            goto LABEL_58;
          }
        }

        sub_100019770(*(void *)(v85 + 32), *(void **)(v85 + 40), v69 != 1, 0LL);
LABEL_60:
        _Block_object_dispose(buf, 8);

        goto LABEL_61;
      }
    }

    else
    {

      uint64_t v86 = 0LL;
    }

    uint64_t v17 = -[NEConfiguration initWithName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  "initWithName:grade:",  v14,  2LL);
    goto LABEL_25;
  }

  uint64_t v11 = ne_log_obj(v9, v10);
  __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138543362;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to load configurations with error %{public}@",  buf,  0xCu);
  }

  sub_100019770(*(void *)(a1 + 32), *(void **)(a1 + 40), 0, 22LL);
LABEL_61:
}

void sub_100019734( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_100019770(uint64_t a1, void *a2, BOOL a3, int64_t a4)
{
  uint64_t v7 = a2;
  id v9 = v7;
  if (a1)
  {
    if (a4)
    {
      int v10 = 0LL;
    }

    else
    {
      uint64_t v7 = (char *)xpc_BOOL_create(a3);
      int v10 = v7;
    }

    uint64_t v11 = ne_log_obj(v7, v8);
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v28 = v9;
      __int16 v29 = 1024;
      LODWORD(v30) = a3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Draining local network replies for %@ with allowed: %u",  buf,  0x12u);
    }

    uint64_t v14 = qword_10003EBA8;
    if (qword_10003EBA8)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003EBA8 objectForKeyedSubscript:v9]);
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v16 = (char *)[v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = 0LL;
        uint64_t v19 = *(void *)v24;
        do
        {
          for (i = 0LL; i != v17; ++i)
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v15);
            }
            sub_10000E864( (uint64_t)&OBJC_CLASS___NEHelperServer,  *(void **)(*((void *)&v23 + 1) + 8LL * (void)i),  a4,  v10);
          }

          uint64_t v18 = &v17[(void)v18];
          uint64_t v17 = (char *)[v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }

        while (v17);
      }

      else
      {
        uint64_t v18 = 0LL;
      }

      [v15 removeAllObjects];
      [(id)qword_10003EBA8 setObject:0 forKeyedSubscript:v9];
    }

    else
    {
      uint64_t v18 = 0LL;
    }

    uint64_t v21 = ne_log_obj(v14, v13);
    unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 134218242;
      id v28 = v18;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Drained %llu local network replies for %@",  buf,  0x16u);
    }
  }
}

void sub_1000199B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = ne_log_obj(a1, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to remove duplicate %{public}@ configuration with error %{public}@",  (uint8_t *)&v10,  0x16u);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removed duplicate %{public}@ configuration",  (uint8_t *)&v10,  0xCu);
  }
}

void sub_100019AB8(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("show-local-network-alert", v4);
  id v3 = (void *)qword_10003EB88;
  qword_10003EB88 = (uint64_t)v2;
}

void sub_100019B08(uint64_t a1, void *a2, BOOL *a3)
{
  id v36 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___LSApplicationProxy);
  if ((objc_opt_isKindOfClass(v36, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v36 plugInKitPlugins]);
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v36;
    id v9 = v6;
    id v10 = v7;
    objc_opt_self(&OBJC_CLASS___NEHelperConfigurationManager);
    id v11 = [v8 entitlementValueForKey:@"com.apple.networking.vpn.configuration" ofClass:objc_opt_class(NSArray)];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (isa_nsarray(v12)
      && [v12 count]
      && (!v10 || [v12 containsObject:v10]))
    {
      id v30 = v12;
      id v31 = v10;
      id v32 = v8;
      uint64_t v34 = a1;
      id v35 = a3;
      unsigned int v29 = [v10 hasPrefix:@"com.apple."];
      uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      id v33 = v9;
      id v14 = v9;
      id v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v38;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v38 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 protocol]);
            unsigned __int8 v21 = [v20 isEqualToString:@"com.apple.networkextension.app-proxy"];

            unsigned int v22 = @"HasAppProxy";
            if ((v21 & 1) == 0)
            {
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v19 protocol]);
              unsigned int v24 = [v23 isEqualToString:@"com.apple.networkextension.packet-tunnel"];

              unsigned int v22 = @"HasPacketTunnel";
              if (!v24) {
                continue;
              }
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  v22);
          }

          id v16 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }

        while (v16);
      }

      if (v29 && !-[NSMutableDictionary count](v13, "count"))
      {
        __int128 v26 = v13;
        uint64_t v13 = 0LL;
        a1 = v34;
        a3 = v35;
        id v8 = v32;
        id v9 = v33;
        __int16 v12 = v30;
      }

      else
      {
        id v8 = v32;
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleIdentifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v25,  @"PluginType");

        __int16 v12 = v30;
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v30,  @"LegacyPluginTypes");
        __int128 v26 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v32 localizedName]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v26, @"AppName");
        a1 = v34;
        a3 = v35;
        id v9 = v33;
      }

      id v10 = v31;
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v13;
  }

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) != 0LL;
}

void sub_100019E50(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "result-code");
    xpc_object_t value = xpc_dictionary_get_value(xdict, "result-data");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(value);
    uint64_t v4 = v7;
    if (!int64 && v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_endpoint)
    {
      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 32), 0LL, v4);
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0LL;

      goto LABEL_5;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) + 16LL))();
LABEL_5:
}

void sub_100019F40(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    id Property = objc_getProperty(v4, a2, 48LL, 1);
  }
  else {
    id Property = 0LL;
  }
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, Property, (int64_t)a2, 0LL);
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), 0LL, 0LL);
}

void sub_100019FB0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id v9 = a3;
    id v10 = v7;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 VPN]);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 protocol]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identityData]);
    uint64_t v45 = v8;
    id v46 = v7;
    uint64_t v44 = v9;
    uint64_t v42 = a1;
    __int16 v47 = v12;
    if (v13)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 identityData]);
      id v15 = v12;
      id v16 = (void *)v14;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 identityDataPassword]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NEIdentityKeychainItem importPKCS12Data:passphrase:]( &OBJC_CLASS___NEIdentityKeychainItem,  "importPKCS12Data:passphrase:",  v16,  v17));

      if (v13)
      {
        if ([v13 count])
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
          [v47 setIdentityReferenceInternal:v18];
        }
      }
    }

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    uint64_t v43 = v10;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 relay]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 relays]);

    id v21 = [v20 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v51;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v51 != v23) {
            objc_enumerationMutation(v20);
          }
          __int128 v25 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 identityData]);

          if (v26)
          {
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 identityData]);
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 identityDataPassword]);
            unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue( +[NEIdentityKeychainItem importPKCS12Data:passphrase:]( &OBJC_CLASS___NEIdentityKeychainItem,  "importPKCS12Data:passphrase:",  v27,  v28));

            if (v29)
            {
              if ([v29 count])
              {
                id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 firstObject]);
                [v25 setIdentityReferenceInternal:v30];
              }

              if ((unint64_t)[v29 count] >= 2)
              {
                id v31 = [v29 mutableCopy];
                [v31 removeObjectAtIndex:0];
                [v25 setCertificateReferences:v31];
              }

              uint64_t v13 = v29;
            }

            else
            {
              uint64_t v13 = 0LL;
            }
          }
        }

        id v22 = [v20 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }

      while (v22);
    }

    sub_10001A3E0((uint64_t)v42, v43);
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v43 VPN]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 protocol]);
    id v34 = [v33 type];

    id v8 = v45;
    id v7 = v46;
    if (v34 == (id)1)
    {
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v43 VPN]);
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 protocol]);

      if ([v36 authenticationMethod] == (id)1) {
        [v36 setLocalIdentifier:0];
      }
      else {
        [v36 setIdentityReferenceInternal:0];
      }
    }

    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
    id v39 = objc_getProperty(v42, v38, 48LL, 1);
    id Property = objc_getProperty(v42, v40, 32LL, 1);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_10001A614;
    v48[3] = &unk_100035050;
    id v49 = v45;
    [v37 saveConfigurationToDisk:v43 currentSignature:v44 userUUID:v39 isUpgrade:0 completionQueue:Property completionHandler:v48];
  }
}

void sub_10001A3E0(uint64_t a1, void *a2)
{
  if (a1)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "relay", 0));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 relays]);

    id v4 = [v3 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identityReferenceInternal]);

          if (v9)
          {
            id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 certificateReferences]);

            if (v10)
            {
              id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 certificateReferences]);
              __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identityReferenceInternal]);
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 arrayByAddingObject:v12]);
            }

            else
            {
              id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identityReferenceInternal]);
              id v21 = v11;
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v21,  1LL));
            }

            id v14 = v13;
            objc_opt_self(&OBJC_CLASS___NEHelperRelayManager);
            if ([v14 count])
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_100005F68;
              block[3] = &unk_100035580;
              id v20 = v14;
              dispatch_async(&_dispatch_main_q, block);
            }
          }
        }

        id v5 = [v3 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }

      while (v5);
    }
  }

uint64_t sub_10001A614(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(void, id))(*(void *)(a1 + 32) + 16))( *(void *)(a1 + 32),  [a2 code]);
}

void sub_10001A644(uint64_t a1)
{
  if (qword_10003EBC8 != -1) {
    dispatch_once(&qword_10003EBC8, &stru_100035498);
  }
}

id sub_10001A680(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([(id)qword_10003EBB8 objectForKeyedSubscript:*(void *)(a1 + 32)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return [(id)qword_10003EBB8 removeObjectForKey:*(void *)(a1 + 32)];
}

void sub_10001A6CC(id a1)
{
  dispatch_queue_attr_t v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v2 = (void *)qword_10003EBB8;
  qword_10003EBB8 = (uint64_t)v1;

  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v4 = dispatch_queue_create("pending operations", v6);
  id v5 = (void *)qword_10003EBC0;
  qword_10003EBC0 = (uint64_t)v4;
}

void sub_10001A780(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "bundle-id");
  BOOL v28 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "one-per-configuration");
  if (string)
  {
    uint64_t v26 = a1;
    unsigned int v29 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", string);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v27 = v3;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    BOOL v8 = v28;
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v6);
          }
          __int16 v12 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appVPN", v26));
          if (v13)
          {
            id v14 = (void *)v13;
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 appVPN]);
            unsigned int v16 = [v15 isEnabled];

            if (v16)
            {
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v12 appVPN]);
              id v18 = [v17 copyAppRuleBySigningIdentifier:v29];

              if (v18)
              {
                if (v8)
                {
                  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 matchDomains]);
                  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);

                  if (v20) {
                    [v4 addObject:v20];
                  }
                }

                else
                {
                  __int128 v32 = 0u;
                  __int128 v33 = 0u;
                  __int128 v30 = 0u;
                  __int128 v31 = 0u;
                  id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 matchDomains]);
                  id v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
                  if (v21)
                  {
                    id v22 = v21;
                    uint64_t v23 = *(void *)v31;
                    do
                    {
                      for (j = 0LL; j != v22; j = (char *)j + 1)
                      {
                        if (*(void *)v31 != v23) {
                          objc_enumerationMutation(v20);
                        }
                        [v4 addObject:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
                      }

                      id v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
                    }

                    while (v22);
                    BOOL v8 = v28;
                  }
                }
              }
            }
          }
        }

        id v9 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }

      while (v9);
    }

    a1 = v26;
    id v3 = v27;
  }

  __int128 v25 = (void *)_CFXPCCreateXPCObjectFromCFObject(v4);
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 32), 0LL, v25);
}

void sub_10001AA4C(uint64_t a1, void *a2)
{
  uint64_t v39 = a1;
  id v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v55;
    uint64_t v41 = *(void *)v55;
    do
    {
      id v7 = 0LL;
      id v42 = v5;
      do
      {
        if (*(void *)v55 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v7);
        uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathController", v39));
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 pathController]);
          unsigned int v12 = [v11 isEnabled];

          if (v12)
          {
            __int128 v52 = 0u;
            __int128 v53 = 0u;
            __int128 v50 = 0u;
            __int128 v51 = 0u;
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 pathController]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pathRules]);

            id v15 = [v14 countByEnumeratingWithState:&v50 objects:v59 count:16];
            uint64_t v45 = v7;
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v51;
              while (2)
              {
                for (i = 0LL; i != v16; i = (char *)i + 1)
                {
                  if (*(void *)v51 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
                  if ([v19 isDefaultPathRule])
                  {
                    id v44 = v19;
                    goto LABEL_18;
                  }
                }

                id v16 = [v14 countByEnumeratingWithState:&v50 objects:v59 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }

            id v44 = 0LL;
LABEL_18:

            __int128 v48 = 0u;
            __int128 v49 = 0u;
            __int128 v46 = 0u;
            __int128 v47 = 0u;
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 pathController]);
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 pathRules]);

            id v22 = [v21 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v47;
              do
              {
                for (j = 0LL; j != v23; j = (char *)j + 1)
                {
                  if (*(void *)v47 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
                  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 matchSigningIdentifier]);
                  id v28 = (id)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v27]);

                  if (!v28)
                  {
                    id v29 = objc_alloc(&OBJC_CLASS___NEPathRule);
                    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v26 matchSigningIdentifier]);
                    id v28 = [v29 initWithSigningIdentifier:v30];
                  }

                  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v8 pathController]);
                  unsigned __int8 v32 = [v31 ignoreRouteRules];

                  if ((v32 & 1) == 0)
                  {
                    objc_msgSend( v28,  "addCellularBehavior:grade:",  objc_msgSend(v26, "cellularBehavior"),  objc_msgSend(v8, "grade"));
                    objc_msgSend( v28,  "addWiFiBehavior:grade:",  objc_msgSend(v26, "wifiBehavior"),  objc_msgSend(v8, "grade"));
                  }

                  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v26 matchSigningIdentifier]);
                  [v3 setObject:v28 forKeyedSubscript:v33];
                }

                id v23 = [v21 countByEnumeratingWithState:&v46 objects:v58 count:16];
              }

              while (v23);
            }

            uint64_t v6 = v41;
            id v5 = v42;
            id v7 = v45;
          }
        }

        id v7 = (char *)v7 + 1;
      }

      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }

    while (v5);
  }

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
  __int128 v35 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  __int128 v36 = v35;
  if (v34) {
    -[NSKeyedArchiver encodeObject:forKey:](v35, "encodeObject:forKey:", v34, @"config-aggregate-rules");
  }
  -[NSKeyedArchiver finishEncoding](v36, "finishEncoding", v39);
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v36, "encodedData"));
  xpc_object_t v38 = xpc_data_create([v37 bytes], (size_t)objc_msgSend(v37, "length"));
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(v40 + 32), 0LL, v38);
}

void sub_10001AEF8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 code];
  }

  else
  {
    id v4 = sub_10001E094((uint64_t)&OBJC_CLASS___NEHelperCacheManager);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) UUIDString]);
    if (v5)
    {
      id Property = (dispatch_queue_s *)objc_getProperty(v5, v6, 8LL, 1);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100022F88;
      v9[3] = &unk_100035530;
      v9[4] = v5;
      id v10 = v7;
      dispatch_async(Property, v9);
    }

    id v3 = 0LL;
  }

  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 40), (int64_t)v3, 0LL);
}

void sub_10001AFE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_opt_self(a1);
  id v7 = v6;
  id v68 = v5;
  objc_opt_self(&OBJC_CLASS___NEHelperConfigurationManager);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v68 appVPN]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v68 contentFilter]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 perApp]);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v68 contentFilter]);
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v68 dnsProxy]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 perApp]);

    if (v13)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v68 dnsProxy]);
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v68 relay]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 perApp]);

      if (!v15)
      {
        id v19 = 0LL;
        uint64_t v17 = v8;
        if (v8) {
          goto LABEL_10;
        }
        goto LABEL_11;
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v68 relay]);
    }
  }

  id v16 = v11;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 perApp]);

  if (v8)
  {
    uint64_t v17 = v8;
LABEL_10:
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 appRules]);
    id v19 = [v18 mutableCopy];

    goto LABEL_11;
  }

  uint64_t v17 = v15;
  if (v15) {
    goto LABEL_10;
  }
  id v19 = 0LL;
LABEL_11:
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v68 externalIdentifier]);

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v68 externalIdentifier]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v21]);

    id v23 = (id)isa_nsarray(v22);
    if ((_DWORD)v23)
    {
      id v23 = [v22 count];
      if (v23)
      {
        __int128 v72 = 0u;
        __int128 v73 = 0u;
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        id v25 = v22;
        id v26 = [v25 countByEnumeratingWithState:&v70 objects:v78 count:16];
        if (!v26) {
          goto LABEL_33;
        }
        id v27 = v26;
        unsigned int v64 = v22;
        id v65 = v15;
        uint64_t v66 = v8;
        id v67 = v7;
        uint64_t v28 = *(void *)v71;
        id v29 = &CFArrayGetCount_ptr;
        __int128 v30 = &CFArrayGetCount_ptr;
        __int128 v31 = _NSConcreteStackBlock;
        unsigned __int8 v32 = sub_10001B63C;
        while (1)
        {
          for (i = 0LL; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v71 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v34 = *(void *)(*((void *)&v70 + 1) + 8LL * (void)i);
            uint64_t v35 = isa_nsstring(v34);
            if (!(_DWORD)v35)
            {
              uint64_t v37 = ne_log_obj(v35, v36);
              xpc_object_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                uint64_t v39 = v32;
                uint64_t v40 = v31;
                uint64_t v41 = v29;
                id v42 = (void *)objc_claimAutoreleasedReturnValue([v68 externalIdentifier]);
                *(_DWORD *)__int128 buf = 138412546;
                uint64_t v75 = v42;
                __int16 v76 = 2112;
                uint64_t v77 = @"NETestAppMapping";
                _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Value of %@ in %@ in the Info.plist contains a non-string object, skipping",  buf,  0x16u);

                id v29 = v41;
                __int128 v31 = v40;
                unsigned __int8 v32 = v39;
                __int128 v30 = &CFArrayGetCount_ptr;
              }

              goto LABEL_27;
            }

            if (!v19)
            {
              id v19 = objc_alloc_init((Class)v29[80]);
LABEL_26:
              xpc_object_t v38 = (os_log_s *)[objc_alloc((Class)v30[44]) initWithSigningIdentifier:v34];
              [v19 addObject:v38];
LABEL_27:

              continue;
            }

            v69[0] = v31;
            v69[1] = 3221225472LL;
            v69[2] = v32;
            v69[3] = &unk_100035398;
            v69[4] = v34;
            if ([v19 indexOfObjectPassingTest:v69] == (id)0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_26;
            }
          }

          id v27 = [v25 countByEnumeratingWithState:&v70 objects:v78 count:16];
          if (!v27)
          {
            BOOL v8 = v66;
            id v7 = v67;
            id v22 = v64;
            id v15 = v65;
            goto LABEL_33;
          }
        }
      }
    }

    uint64_t v43 = ne_log_obj(v23, v24);
    id v25 = (id)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      id v63 = (void *)objc_claimAutoreleasedReturnValue([v68 externalIdentifier]);
      *(_DWORD *)uint64_t v78 = 138412546;
      uint64_t v79 = v63;
      __int16 v80 = 2112;
      id v81 = @"NETestAppMapping";
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "Value of %@ in %@ in the Info.plist is not an array or is empty",  v78,  0x16u);
    }

LABEL_33:
  }

  if ([v19 count])
  {
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v68 appVPN]);

    if (v44)
    {
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v68 appVPN]);
      [v45 setAppRules:v19];
LABEL_53:

      goto LABEL_54;
    }

    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v68 contentFilter]);

    if (v46)
    {
      __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v68 contentFilter]);
      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v47 perApp]);

      if (!v48)
      {
        id v49 = objc_alloc_init(&OBJC_CLASS___NEPerApp);
        __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v68 contentFilter]);
        [v50 setPerApp:v49];
      }

      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "contentFilter", v64, v65, v66, v67));
LABEL_52:
      uint64_t v45 = v51;
      id v62 = (void *)objc_claimAutoreleasedReturnValue([v51 perApp]);
      [v62 setAppRules:v19];

      goto LABEL_53;
    }

    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v68 dnsProxy]);

    if (v52)
    {
      __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v68 dnsProxy]);
      __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 perApp]);

      if (!v54)
      {
        id v55 = objc_alloc_init(&OBJC_CLASS___NEPerApp);
        __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v68 dnsProxy]);
        [v56 setPerApp:v55];
      }

      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "dnsProxy", v64, v65, v66, v67));
      goto LABEL_52;
    }

    __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v68 relay]);

    if (v57)
    {
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v68 relay]);
      id v59 = (void *)objc_claimAutoreleasedReturnValue([v58 perApp]);

      if (!v59)
      {
        id v60 = objc_alloc_init(&OBJC_CLASS___NEPerApp);
        id v61 = (void *)objc_claimAutoreleasedReturnValue([v68 relay]);
        [v61 setPerApp:v60];
      }

      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "relay", v64, v65, v66, v67));
      goto LABEL_52;
    }
  }

id sub_10001B63C(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 matchSigningIdentifier]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_10001B67C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "permission-type");
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) contentFilter]);
  id v153 = v8;
  if (!v10 || *(void *)(a1 + 48))
  {

    goto LABEL_4;
  }

  uint64_t v15 = *(void *)(a1 + 56);
  if (v15)
  {
    char v16 = *(_BYTE *)(v15 + 12);

    if ((v16 & 1) != 0) {
      goto LABEL_4;
    }
  }

  else
  {
  }

  __int128 v172 = 0u;
  __int128 v173 = 0u;
  __int128 v170 = 0u;
  __int128 v171 = 0u;
  id v17 = v7;
  id v18 = [v17 countByEnumeratingWithState:&v170 objects:v179 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v171;
    while (2)
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v171 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v170 + 1) + 8LL * (void)i);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 contentFilter]);

        if (v23)
        {
          uint64_t v55 = ne_log_obj(v24, v25);
          __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          __int128 v54 = v153;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            id Property = *(id *)(a1 + 56);
            if (Property) {
              id Property = objc_getProperty(Property, v57, 64LL, 1);
            }
            id v120 = Property;
            __int128 v121 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
            __int128 v123 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
            id v124 = *(id *)(a1 + 56);
            if (v124) {
              id v124 = objc_getProperty(v124, v122, 40LL, 1);
            }
            *(_DWORD *)uint64_t v186 = 138413058;
            id v187 = v120;
            __int16 v188 = 2112;
            v189 = v121;
            __int16 v190 = 2112;
            int v191 = v123;
            __int16 v192 = 2112;
            id v193 = v124;
            _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "%@ trying to save a new content filter configuration with identifier %@, but a configuration (%@) already exists for application identifier %@",  v186,  0x2Au);
          }

          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 32), 10LL, 0LL);
          goto LABEL_145;
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v170 objects:v179 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

LABEL_4:
  if (int64 != 3)
  {
    if (int64)
    {
      id v14 = 0LL;
      uint64_t v13 = 0LL;
      unsigned int v12 = 0LL;
      goto LABEL_9;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dnsProxy]);

    if (!v11)
    {
      unsigned int v12 = 0LL;
      uint64_t v13 = 0LL;
      id v14 = 0LL;
      goto LABEL_25;
    }
  }

  unsigned int v12 = "APP_WARNING_HEADER_DNS_PROXY";
  uint64_t v13 = "APP_WARNING_DNS_PROXY";
  id v14 = @"DNS Proxy";
LABEL_9:
  if (int64 == 1)
  {
    unsigned int v12 = "APP_WARNING_HEADER_FILTER";
    uint64_t v13 = "APP_WARNING_FILTER";
    id v14 = @"content filter";
    goto LABEL_30;
  }

LABEL_91:
  id v144 = v75;
  id v146 = v72;
  id v151 = v12;
  uint64_t v84 = a1;
  uint64_t v85 = v14;
  __int128 v176 = 0u;
  __int128 v177 = 0u;
  __int128 v174 = 0u;
  __int128 v175 = 0u;
  id v86 = v75;
  id v87 = [v86 countByEnumeratingWithState:&v174 objects:v186 count:16];
  if (v87)
  {
    id v88 = v87;
    uint64_t v89 = *(void *)v175;
    while (2)
    {
      for (k = 0LL; k != v88; k = (char *)k + 1)
      {
        if (*(void *)v175 != v89) {
          objc_enumerationMutation(v86);
        }
        id v91 = *(void **)(*((void *)&v174 + 1) + 8LL * (void)k);
        uint64_t v92 = objc_claimAutoreleasedReturnValue([v74 contentFilter]);
        if (v92)
        {
          id v93 = (void *)v92;
          __int128 v94 = (void *)objc_claimAutoreleasedReturnValue([v91 contentFilter]);

          if (v94)
          {
LABEL_104:

            BOOL v97 = 1;
            goto LABEL_105;
          }
        }

        __int128 v95 = (void *)objc_claimAutoreleasedReturnValue([v74 contentFilter]);
        if (v95)
        {
        }

        else
        {
          __int128 v96 = (void *)objc_claimAutoreleasedReturnValue([v91 contentFilter]);

          if (!v96) {
            goto LABEL_104;
          }
        }
      }

      id v88 = [v86 countByEnumeratingWithState:&v174 objects:v186 count:16];
      if (v88) {
        continue;
      }
      break;
    }
  }

  BOOL v97 = 0;
LABEL_105:
  id v14 = v85;
  a1 = v84;
  unsigned int v12 = v151;
  uint64_t v75 = v144;
  id v72 = v146;
LABEL_106:

  uint64_t v98 = *(void **)(a1 + 40);
  id v7 = v152;
  if (!v97)
  {
LABEL_139:
    v132 = (void *)objc_claimAutoreleasedReturnValue([v98 appPush]);

    if (v132)
    {
      uint64_t v134 = *(void **)(a1 + 48);
      uint32_t v133 = *(void **)(a1 + 56);
      v168[0] = _NSConcreteStackBlock;
      v168[1] = 3221225472LL;
      v168[2] = sub_10001C42C;
      v168[3] = &unk_100035078;
      uint64_t v135 = *(void **)(a1 + 40);
      id v169 = *(id *)(a1 + 32);
      sub_100019FB0(v133, v135, v134, v168);
      uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
      id v138 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) application]);
      id v139 = *(void **)(a1 + 56);
      if (v139) {
        id v140 = objc_getProperty(v139, v137, 32LL, 1);
      }
      else {
        id v140 = 0LL;
      }
      __int128 v54 = v153;
      v166[0] = _NSConcreteStackBlock;
      v166[1] = 3221225472LL;
      v166[2] = sub_10001C448;
      v166[3] = &unk_1000350A0;
      id v167 = *(id *)(a1 + 40);
      [v136 showLocalNetworkAlertForApp:v138 withCompletionQueue:v140 handler:v166];

      goto LABEL_145;
    }

    v160[0] = _NSConcreteStackBlock;
    v160[1] = 3221225472LL;
    v160[2] = sub_10001C52C;
    v160[3] = &unk_1000350F0;
    v160[4] = *(void *)(a1 + 56);
    id v161 = *(id *)(a1 + 40);
    uint64_t v164 = v12;
    id v165 = v142;
    id v162 = *(id *)(a1 + 48);
    id v163 = *(id *)(a1 + 32);
    +[NEUserNotification cancelCurrentNotificationWithResponse:queue:completionHandler:]( &OBJC_CLASS___NEUserNotification,  "cancelCurrentNotificationWithResponse:queue:completionHandler:",  2LL,  &_dispatch_main_q,  v160);

    __int128 v112 = v161;
LABEL_144:

    __int128 v54 = v153;
    goto LABEL_145;
  }

  if ([v98 grade] != (id)2
    || (uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) relay]), v99, v99))
  {
LABEL_125:
    __int128 v110 = *(void **)(a1 + 48);
    xpc_object_t v109 = *(void **)(a1 + 56);
    v154[0] = _NSConcreteStackBlock;
    v154[1] = 3221225472LL;
    v154[2] = sub_10001C64C;
    v154[3] = &unk_100035078;
    __int128 v111 = *(void **)(a1 + 40);
    id v155 = *(id *)(a1 + 32);
    sub_100019FB0(v109, v111, v110, v154);
    __int128 v112 = v155;
    goto LABEL_144;
  }

  __int128 v158 = 0u;
  __int128 v159 = 0u;
  __int128 v156 = 0u;
  __int128 v157 = 0u;
  id v100 = v72;
  id v101 = [v100 countByEnumeratingWithState:&v156 objects:v178 count:16];
  if (!v101)
  {
LABEL_117:
    id v106 = v100;
LABEL_124:

    goto LABEL_125;
  }

  id v102 = v101;
  uint64_t v103 = *(void *)v157;
LABEL_111:
  uint64_t v104 = 0LL;
  while (1)
  {
    if (*(void *)v157 != v103) {
      objc_enumerationMutation(v100);
    }
    __int16 v105 = *(void **)(*((void *)&v156 + 1) + 8 * v104);
    if ([v105 grade] == (id)2) {
      break;
    }
    if (v102 == (id)++v104)
    {
      id v102 = [v100 countByEnumeratingWithState:&v156 objects:v178 count:16];
      if (v102) {
        goto LABEL_111;
      }
      goto LABEL_117;
    }
  }

  id v106 = v105;

  if (!v106) {
    goto LABEL_125;
  }
  if (*(void *)(a1 + 48))
  {
    [v106 clearSystemKeychain];
    goto LABEL_124;
  }

  uint64_t v113 = ne_log_obj(v107, v108);
  __int128 v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
  __int128 v54 = v153;
  if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
  {
    id v126 = *(id *)(a1 + 56);
    uint64_t v127 = v14;
    if (v126) {
      id v126 = objc_getProperty(v126, v115, 64LL, 1);
    }
    id v128 = v126;
    id v130 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
    id v131 = *(id *)(a1 + 56);
    if (v131) {
      id v131 = objc_getProperty(v131, v129, 40LL, 1);
    }
    *(_DWORD *)uint64_t v186 = 138413314;
    id v187 = v128;
    __int16 v188 = 2112;
    v189 = v127;
    __int16 v190 = 2112;
    int v191 = v130;
    __int16 v192 = 2112;
    id v193 = v153;
    __int16 v194 = 2112;
    id v195 = v131;
    _os_log_error_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_ERROR,  "%@ trying to save a new personal %@ configuration with identifier %@, but a configuration (%@) already exists for application identifier %@",  v186,  0x34u);
  }

  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 32), 10LL, 0LL);
LABEL_145:
}

void sub_10001C42C(uint64_t a1, int64_t a2)
{
}

void sub_10001C448(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t v4 = ne_log_obj(a1, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (v2) {
      id v6 = "granted";
    }
    else {
      id v6 = "denied";
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) application]);
    int v8 = 136315394;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "user %s local network access for %@",  (uint8_t *)&v8,  0x16u);
  }
}

void sub_10001C52C(uint64_t a1)
{
  int v2 = objc_alloc(&OBJC_CLASS___NEUserNotification);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) applicationName]);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  id v7 = *(void **)(a1 + 32);
  if (v7) {
    id Property = objc_getProperty(v7, v3, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001C668;
  v14[3] = &unk_1000350C8;
  id v15 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = *(id *)(a1 + 56);
  id v12 = -[NEUserNotification initAndShowAddConfigurationsForApp:warningHeader:warning:callbackQueue:callbackHandler:]( v2,  "initAndShowAddConfigurationsForApp:warningHeader:warning:callbackQueue:callbackHandler:",  v4,  v5,  v6,  Property,  v14);
  uint64_t v13 = *(void **)(a1 + 32);
  if (v13) {
    objc_setProperty_atomic(v13, v11, v12, 80LL);
  }
}

void sub_10001C64C(uint64_t a1, int64_t a2)
{
}

void sub_10001C668(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    if (+[NEUserNotification shouldPromptForLocalAuthentication]( &OBJC_CLASS___NEUserNotification,  "shouldPromptForLocalAuthentication"))
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      uint64_t v4 = v3;
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v5 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7) {
        BOOL v33 = *(_BYTE *)(v7 + 16) != 0;
      }
      else {
        BOOL v33 = 0;
      }
      int v8 = *(void **)(a1 + 56);
      id v9 = v3;
      id v10 = v8;
      id obj = v5;
      id v11 = v5;
      id v12 = v6;
      objc_opt_self(&OBJC_CLASS___NEHelperPendingOperation);
      uint64_t v13 = objc_alloc(&OBJC_CLASS___NEHelperPendingOperation);
      id v14 = v9;
      id v15 = v12;
      id v16 = v11;
      id v17 = v10;
      if (v13)
      {
        block.receiver = v13;
        block.super_class = (Class)&OBJC_CLASS___NEHelperPendingOperation;
        id v18 = (NEHelperPendingOperation *)objc_msgSendSuper2(&block, "init");
        uint64_t v13 = v18;
        if (v18)
        {
          v18->_operation = 3LL;
          objc_storeStrong((id *)&v18->_configurationIdentifier, v4);
          objc_storeStrong((id *)&v13->_configuration, v6);
          objc_storeStrong((id *)&v13->_signature, obj);
          v13->_isAllowedContentFilterApp = v33;
          objc_storeStrong((id *)&v13->_requestMessage, v8);
        }
      }

      sub_10001A644((uint64_t)&OBJC_CLASS___NEHelperPendingOperation);
      id v19 = (dispatch_queue_s *)qword_10003EBC0;
      block.receiver = _NSConcreteStackBlock;
      block.super_class = (Class)3221225472LL;
      uint64_t v39 = sub_10001C9EC;
      uint64_t v40 = &unk_100035530;
      id v41 = v14;
      uint64_t v42 = v13;
      uint64_t v20 = v13;
      id v21 = v14;
      dispatch_sync(v19, &block);

      id v22 = *(void **)(a1 + 48);
      if (v22)
      {
        id v23 = *(id *)(a1 + 32);
        id v25 = objc_getProperty(v22, v24, 72LL, 1);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);

        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
        id obja = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefs:root=General&path=ManagedConfigurationList/VPN/LocalAuthenticationTrigger&sender=%@&configID=%@",  v25,  v27));

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", obja));
        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
        [v29 openSensitiveURL:v28 withOptions:0];
      }
    }

    else
    {
      id v30 = *(void **)(a1 + 32);
      __int128 v31 = *(void **)(a1 + 40);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_10001C9D0;
      v36[3] = &unk_100035078;
      id v32 = *(void **)(a1 + 48);
      id v37 = *(id *)(a1 + 56);
      sub_100019FB0(v32, v30, v31, v36);
    }
  }

  else
  {
    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 56), 10LL, 0LL);
  }

void sub_10001C9D0(uint64_t a1, int64_t a2)
{
}

id sub_10001C9EC(uint64_t a1)
{
  return [(id)qword_10003EBB8 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

BOOL sub_10001CA00(id a1, id a2, NSDictionary *a3)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 contentFilter]);
  if (v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 VPN]);
    if (v6)
    {
      BOOL v5 = 1;
    }

    else
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 appVPN]);
      if (v7)
      {
        BOOL v5 = 1;
      }

      else
      {
        int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 dnsProxy]);
        if (v8)
        {
          BOOL v5 = 1;
        }

        else
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 relay]);
          BOOL v5 = v9 != 0LL;
        }
      }
    }
  }

  return v5;
}

id sub_10001CAD4(uint64_t a1)
{
  if (qword_10003EBA0 != -1) {
    dispatch_once(&qword_10003EBA0, &stru_100034FE8);
  }
  return (id)qword_10003EB98;
}

void sub_10001CB18(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("allowed-content-filter", v4);
  id v3 = (void *)qword_10003EB98;
  qword_10003EB98 = (uint64_t)v2;
}

void sub_10001CB68(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5)
  {
    if (!a3)
    {
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v7)
      {
        id v9 = v7;
        uint64_t v10 = *(void *)v24;
        *(void *)&__int128 v8 = 136315394LL;
        __int128 v22 = v8;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v6);
            }
            id v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "VPN", v22));
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 protocol]);
            id v15 = [v14 type];

            if (v15 == (id)3)
            {
              uint64_t v18 = ne_log_obj(v16, v17);
              id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)__int128 buf = v22;
                uint64_t v28 = "+[NEHelperConfigurationManager handleUnsupportedConfiguration:]_block_invoke";
                __int16 v29 = 2112;
                id v30 = v12;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%s: removing configuration %@",  buf,  0x16u);
              }

              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
              [v20 removeConfigurationFromDisk:v21 completionQueue:*(void *)(a1 + 32) completionHandler:&stru_100035400];
            }
          }

          id v9 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }

        while (v9);
      }
    }
  }
}

void sub_10001CD5C(id a1, NSError *a2)
{
  dispatch_queue_t v2 = a2;
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v5 = ne_log_obj(v2, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      __int128 v8 = "+[NEHelperConfigurationManager handleUnsupportedConfiguration:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s: failed to remove the configuration: %@",  (uint8_t *)&v7,  0x16u);
    }
  }
}

void sub_10001CE20(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  dispatch_queue_t v4 = dispatch_queue_create("upgrade-app-groups", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001CEF8;
  v8[3] = &unk_100035428;
  id v9 = v3;
  dispatch_queue_t v10 = v4;
  uint64_t v6 = v4;
  id v7 = v3;
  [v5 loadConfigurations:0 withFilter:0 completionQueue:v6 completionHandler:v8];
}

void sub_10001CEF8(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v66 = a3;
  id v68 = a5;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v67 = 0LL;
    uint64_t v70 = 0LL;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v76;
    id v69 = v8;
    while (1)
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v76 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)v13);
        uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 applicationIdentifier]);
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          if (![*(id *)(a1 + 32) count])
          {

LABEL_11:
            uint64_t v21 = ne_log_obj(v19, v20);
            __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationIdentifier]);
              *(_DWORD *)__int128 buf = 138412290;
              __int16 v80 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Upgrading app groups for app %@",  buf,  0xCu);
            }

            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationIdentifier]);
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NELaunchServices bundleProxyForIdentifier:uid:plugins:]( &OBJC_CLASS___NELaunchServices,  "bundleProxyForIdentifier:uid:plugins:",  v24,  0LL,  0LL));

            if (v25)
            {
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 appGroups]);
              id v29 = [v28 count];

              uint64_t v32 = ne_log_obj(v30, v31);
              BOOL v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
              uint64_t v34 = v33;
              if (v29)
              {
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v25 appGroups]);
                  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationIdentifier]);
                  *(_DWORD *)__int128 buf = 138412546;
                  __int16 v80 = v35;
                  __int16 v81 = 2112;
                  uint64_t v82 = v36;
                  _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "Adding app groups %@ for app %@",  buf,  0x16u);
                }

                id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
                xpc_object_t v38 = (void *)objc_claimAutoreleasedReturnValue([v25 appGroups]);
                uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationIdentifier]);
                [v37 addGroups:v38 forApp:v39];

                if (v11)
                {
                  id v8 = v69;
LABEL_26:

                  goto LABEL_27;
                }

                id v45 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:@"ConfigurationProperties"]);
                __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
                uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v46]);

                uint64_t v44 = objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", @"Signature"));
                uint64_t v47 = isa_nsdata(v44);
                if ((v47 & 1) != 0)
                {
                  id v49 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
                  __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
                  uint64_t v71 = objc_claimAutoreleasedReturnValue([v49 getCurrentUserUUIDForConfigurationID:v50 fromIndex:v68]);

                  id v11 = v14;
                  uint64_t v67 = (void *)v71;
                }

                else
                {
                  uint64_t v51 = ne_log_obj(v47, v48);
                  uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    int64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
                    *(_DWORD *)__int128 buf = 138412290;
                    __int16 v80 = v53;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "No signature found for AppleConnect configuration %@",  buf,  0xCu);
                  }

                  id v11 = 0LL;
                }

                id v8 = v69;
LABEL_25:

                uint64_t v70 = (void *)v44;
                goto LABEL_26;
              }

              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                id v41 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationIdentifier]);
                *(_DWORD *)__int128 buf = 138412290;
                __int16 v80 = v41;
                uint64_t v42 = v34;
                id v43 = "App %@ does not have any app groups";
LABEL_23:
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);
              }
            }

            else
            {
              uint64_t v40 = ne_log_obj(v26, v27);
              uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                id v41 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationIdentifier]);
                *(_DWORD *)__int128 buf = 138412290;
                __int16 v80 = v41;
                uint64_t v42 = v34;
                id v43 = "Did not find %@ while upgrading app groups";
                goto LABEL_23;
              }
            }

            uint64_t v44 = (uint64_t)v70;
            goto LABEL_25;
          }

          uint64_t v17 = *(void **)(a1 + 32);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationIdentifier]);
          LODWORD(v17) = [v17 containsObject:v18];

          if ((_DWORD)v17) {
            goto LABEL_11;
          }
        }

LABEL_27:
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v10 != v13);
      id v54 = [v8 countByEnumeratingWithState:&v75 objects:v83 count:16];
      id v10 = v54;
      if (!v54) {
        goto LABEL_38;
      }
    }
  }

  uint64_t v67 = 0LL;
  uint64_t v70 = 0LL;
  id v11 = 0LL;
LABEL_38:
  char v74 = 0;
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  id v56 = [v55 copyAppGroupMapDidChange:&v74];

  if (v56) {
    BOOL v59 = v74 == 0;
  }
  else {
    BOOL v59 = 1;
  }
  if (v59)
  {
    uint64_t v60 = ne_log_obj(v57, v58);
    id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    uint64_t v62 = v67;
    id v63 = v70;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "App group map did not change", buf, 2u);
    }

    goto LABEL_47;
  }

  uint64_t v62 = v67;
  id v63 = v70;
  if (v11)
  {
    unsigned int v64 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
    uint64_t v65 = *(void *)(a1 + 40);
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472LL;
    v72[2] = sub_10001D554;
    v72[3] = &unk_100035190;
    id v73 = (os_log_s *)v11;
    [v64 saveConfigurationToDisk:v73 currentSignature:v70 userUUID:v67 isUpgrade:0 completionQueue:v65 completionHandler:v72];

    id v61 = v73;
LABEL_47:
  }
}

void sub_10001D554(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 code];
    if (v5 != (id)9)
    {
      uint64_t v7 = ne_log_obj(v5, v6);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
        int v10 = 138412546;
        id v11 = v9;
        __int16 v12 = 2112;
        uint64_t v13 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to save %@ while upgrading app groups: %@",  (uint8_t *)&v10,  0x16u);
      }
    }
  }
}

void sub_10001D640(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3032000000LL;
  v10[3] = sub_100018EE0;
  void v10[4] = sub_100018EF0;
  id v11 = (id)os_transaction_create("set-current-allowed-client");
  id v4 = sub_10001CAD4((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001D748;
  v7[3] = &unk_1000354C0;
  id v8 = v3;
  id v9 = v10;
  id v6 = v3;
  dispatch_async(v5, v7);

  _Block_object_dispose(v10, 8);
}

void sub_10001D730( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001D748(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = ne_log_obj(a1, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v28 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Current allowed content filter app is now %@",  buf,  0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&unk_10003EBB0);
  uint64_t v6 = qword_10003EB80;
  if (qword_10003EB80)
  {
    if (*(void *)(a1 + 32))
    {
      LODWORD(v7) = objc_msgSend((id)qword_10003EB80, "isEqualToString:") ^ 1;
      uint64_t v6 = qword_10003EB80;
    }

    else
    {
      LODWORD(v7) = 1;
    }

    BOOL v33 = @"application-id";
    uint64_t v34 = v6;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    id v8 = (void *)v9;
    if ((_DWORD)v7)
    {
      uint64_t v11 = ne_log_obj(v9, v10);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)__int128 buf = 138412802;
        uint64_t v28 = qword_10003EB80;
        __int16 v29 = 2112;
        uint64_t v30 = v12;
        __int16 v31 = 2112;
        uint64_t v32 = qword_10003EB80;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Current allowed content filter app changed from %@ to %@, removing content filter configurations created by %@",  buf,  0x20u);
      }

      LOBYTE(v7) = 1;
    }
  }

  else
  {
    id v8 = 0LL;
    LOBYTE(v7) = 0;
  }

  id v13 = [*(id *)(a1 + 32) copy];
  id v14 = (void *)qword_10003EB80;
  qword_10003EB80 = (uint64_t)v13;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003EBB0);
  if ((v7 & 1) != 0)
  {
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("Remove filters queue", v16);

    id v18 = sub_10001CAD4((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager);
    uint64_t v19 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(v18);
    dispatch_suspend(v19);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10001D9D0;
    v24[3] = &unk_100035478;
    uint64_t v21 = *(void *)(a1 + 40);
    dispatch_queue_t v25 = v17;
    uint64_t v26 = v21;
    __int128 v22 = v17;
    [v20 loadConfigurations:0 withFilter:v8 completionQueue:v22 completionHandler:v24];
  }

  else
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
    __int128 v22 = *(dispatch_queue_s **)(v23 + 40);
    *(void *)(v23 + 40) = 0LL;
  }
}

void sub_10001D9D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 contentFilter]);

      if (v13) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v14 = v12;

    if (!v14) {
      goto LABEL_14;
    }
    uint64_t v17 = ne_log_obj(v15, v16);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
      *(_DWORD *)__int128 buf = 138412290;
      xpc_object_t v38 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Removing %@ content filter configuration",  buf,  0xCu);
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    uint64_t v22 = *(void *)(a1 + 32);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10001DC3C;
    v29[3] = &unk_100035450;
    id v30 = v14;
    id v23 = v6;
    uint64_t v24 = *(void *)(a1 + 40);
    id v31 = v23;
    uint64_t v32 = v24;
    id v25 = v14;
    [v20 removeConfigurationFromDisk:v21 completionQueue:v22 completionHandler:v29];
  }

  else
  {
LABEL_9:

LABEL_14:
    id v26 = sub_10001CAD4((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager);
    uint64_t v27 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(v26);
    dispatch_resume(v27);

    uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v25 = *(id *)(v28 + 40);
    *(void *)(v28 + 40) = 0LL;
  }
}

void sub_10001DC3C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = ne_log_obj(a1, a2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Failed to remove content filter configuration %@: %@",  (uint8_t *)&v11,  0x16u);
    }
  }

  id v5 = sub_10001CAD4((uint64_t)&OBJC_CLASS___NEHelperConfigurationManager);
  id v6 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_resume(v6);

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0LL;
}

id sub_10001E094(uint64_t a1)
{
  if (qword_10003EBF8 != -1) {
    dispatch_once(&qword_10003EBF8, &stru_1000354E0);
  }
  return (id)qword_10003EC00;
}

void sub_10001E0D8(SCPreferencesRef *a1, void *a2)
{
  id v4 = a2;
  if (!a1) {
    goto LABEL_102;
  }
  id Property = (dispatch_queue_s *)objc_getProperty(a1, v3, 8LL, 1);
  dispatch_assert_queue_V2(Property);
  if (!a1[2])
  {
LABEL_101:
    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 22LL, 0LL);
    goto LABEL_102;
  }

  switch(xpc_dictionary_get_uint64(v4, "cache-command"))
  {
    case 1uLL:
      xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v6) {
        goto LABEL_101;
      }
      xpc_object_t v7 = v6;
      CFPropertyListRef Value = SCPreferencesGetValue(a1[2], @"redirected-addresses");
      if (Value)
      {
        id v9 = (void *)_CFXPCCreateXPCObjectFromCFObject(Value);
        uint64_t v10 = v9;
        if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary) {
          xpc_dictionary_set_value(v7, "redirected-addresses", v10);
        }
      }

      CFPropertyListRef v11 = SCPreferencesGetValue(a1[2], @"services");
      if (v11)
      {
        uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject(v11);
        __int16 v13 = v12;
        if (v12 && xpc_get_type(v12) == (xpc_type_t)&_xpc_type_dictionary) {
          xpc_dictionary_set_value(v7, "services", v13);
        }
      }

      goto LABEL_91;
    case 2uLL:
      xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
      BOOL v16 = sub_100010A1C((uint64_t)&OBJC_CLASS___NEHelperServer, v15, (uint64_t)"com.apple.private.nehelper.privileged");

      string = xpc_dictionary_get_string(v4, "cache-service");
      xpc_object_t v18 = xpc_dictionary_get_value(v4, "cache-routes");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      xpc_object_t v7 = v19;
      if (!string) {
        goto LABEL_100;
      }
      if (!v19) {
        goto LABEL_100;
      }
      xpc_type_t type = xpc_get_type(v19);
      if (type != (xpc_type_t)&_xpc_type_dictionary) {
        goto LABEL_100;
      }
      if (v16)
      {
        uint64_t v22 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
        int v24 = sub_100020310(a1, v22, v23);

        if (v24) {
          goto LABEL_65;
        }
        goto LABEL_101;
      }

      uint64_t v110 = ne_log_obj(type, v21);
      __int16 v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
        goto LABEL_99;
      }
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = objc_getProperty(a1, v111, 24LL, 1);
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "com.apple.private.nehelper.privileged";
      uint64_t v107 = "Denying set routes command because %@ does not have the %s entitlement";
      goto LABEL_98;
    case 3uLL:
      xpc_connection_t v25 = xpc_dictionary_get_remote_connection(v4);
      id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      BOOL v27 = sub_100010A1C( (uint64_t)&OBJC_CLASS___NEHelperServer,  v26,  (uint64_t)"com.apple.private.network.socket-delegate")
         || sub_100010A1C((uint64_t)&OBJC_CLASS___NEHelperServer, v26, (uint64_t)"com.apple.private.necp.policies");
      xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v7 || (uint64_t v79 = xpc_dictionary_get_string(v4, "cache-signing-identifier")) == 0LL)
      {

        goto LABEL_100;
      }

      __int16 v80 = v79;
      __int16 v81 = xpc_dictionary_get_string(v4, "cache-executable-path");
      if (v81) {
        uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v81));
      }
      else {
        uint64_t v82 = 0LL;
      }
      unsigned int int64 = xpc_dictionary_get_int64(v4, "cache-user-uid");
      if (!int64)
      {
        memset(buf, 0, 32);
        xpc_dictionary_get_audit_token(v4, buf);
        __int128 v126 = *(_OWORD *)buf;
        __int128 v127 = *(_OWORD *)&buf[16];
        unsigned int int64 = NEUIDForAuditToken(&v126);
      }

      LOBYTE(v126) = 0;
      id v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v80));
      BOOL v92 = xpc_dictionary_get_BOOL(v4, "cache-allow-synthesis");
      id v93 = sub_10001FA54(a1, v91, v82, v92, int64, &v126);
      __int128 v94 = (void *)objc_claimAutoreleasedReturnValue(v93);

      uint64_t v95 = isa_nsarray(v94);
      if ((_DWORD)v95)
      {
        if ((_BYTE)v126) {
          char v97 = v27;
        }
        else {
          char v97 = 1;
        }
        if ((v97 & 1) != 0)
        {
          xpc_object_t v98 = xpc_array_create(0LL, 0LL);
          __int128 v122 = 0u;
          __int128 v123 = 0u;
          __int128 v124 = 0u;
          __int128 v125 = 0u;
          id v99 = v94;
          id v100 = [v99 countByEnumeratingWithState:&v122 objects:v129 count:16];
          if (v100)
          {
            id v101 = v100;
            uint64_t v102 = *(void *)v123;
            do
            {
              for (i = 0LL; i != v101; i = (char *)i + 1)
              {
                if (*(void *)v123 != v102) {
                  objc_enumerationMutation(v99);
                }
                [*(id *)(*((void *)&v122 + 1) + 8 * (void)i) getUUIDBytes:buf];
                xpc_array_set_uuid(v98, 0xFFFFFFFFFFFFFFFFLL, buf);
              }

              id v101 = [v99 countByEnumeratingWithState:&v122 objects:v129 count:16];
            }

            while (v101);
          }

          xpc_dictionary_set_value(v7, "cache-app-uuid", v98);
        }

        else
        {
          uint64_t v108 = ne_log_obj(v95, v96);
          xpc_object_t v98 = (xpc_object_t)objc_claimAutoreleasedReturnValue(v108);
          if (os_log_type_enabled((os_log_t)v98, OS_LOG_TYPE_FAULT))
          {
            id v116 = objc_getProperty(a1, v109, 24LL, 1);
            *(_DWORD *)__int128 buf = 138412546;
            *(void *)&uint8_t buf[4] = v116;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v80;
            _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v98,  OS_LOG_TYPE_FAULT,  "%@ is trying to access information for %s but is not entitled to do so. Please add the com.apple.private.n etwork.socket-delegate or the com.apple.private.necp.policies entitlement",  buf,  0x16u);
          }
        }
      }

      goto LABEL_91;
    case 4uLL:
      xpc_connection_t v28 = xpc_dictionary_get_remote_connection(v4);
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      BOOL v30 = sub_100010A1C((uint64_t)&OBJC_CLASS___NEHelperServer, v29, (uint64_t)"com.apple.private.nehelper.privileged");

      id v31 = xpc_dictionary_get_string(v4, "cache-service");
      xpc_object_t v32 = xpc_dictionary_get_value(v4, "cache-domain-dictionaries");
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      xpc_object_t v7 = v33;
      if (!v31 || v33 && xpc_get_type(v33) != (xpc_type_t)&_xpc_type_array) {
        goto LABEL_100;
      }
      __int128 v34 = xpc_dictionary_get_string(v4, "cache-interface-name");
      if (!v34) {
        goto LABEL_100;
      }
      if (!v30)
      {
        uint64_t v104 = ne_log_obj(v34, v35);
        __int16 v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
        if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
          goto LABEL_99;
        }
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = objc_getProperty(a1, v106, 24LL, 1);
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "com.apple.private.nehelper.privileged";
        uint64_t v107 = "Denying set domain dictionary command because %@ does not have the %s entitlement";
        goto LABEL_98;
      }

      uint64_t v36 = (uint64_t)v34;
      if (v7)
      {
        id v37 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
        xpc_object_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v31));
        char v39 = sub_10001F00C(a1, v37, v38, v36);

        goto LABEL_47;
      }

      __int128 v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v31));
      char v113 = sub_10001F2B0(a1, v112, v36);

      xpc_object_t v7 = 0LL;
      if ((v113 & 1) != 0) {
        goto LABEL_91;
      }
      goto LABEL_101;
    case 5uLL:
      xpc_connection_t v40 = xpc_dictionary_get_remote_connection(v4);
      id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      BOOL v42 = sub_100010A1C((uint64_t)&OBJC_CLASS___NEHelperServer, v41, (uint64_t)"com.apple.private.nehelper.privileged");

      xpc_object_t v43 = xpc_dictionary_get_value(v4, "cache-redirected-address");
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      xpc_object_t v7 = v44;
      if (!v44) {
        goto LABEL_100;
      }
      if (xpc_get_type(v44) != (xpc_type_t)&_xpc_type_data) {
        goto LABEL_100;
      }
      if (xpc_data_get_length(v7) < 0x10) {
        goto LABEL_100;
      }
      id v45 = xpc_dictionary_get_string(v4, "cache-interface-name");
      if (!v45) {
        goto LABEL_100;
      }
      if (!v42)
      {
        uint64_t v114 = ne_log_obj(v45, v46);
        __int16 v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = objc_getProperty(a1, v115, 24LL, 1);
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "com.apple.private.nehelper.privileged";
          uint64_t v107 = "Denying add redirected address command because %@ does not have the %s entitlement";
LABEL_98:
          _os_log_error_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_ERROR, v107, buf, 0x16u);
        }

LABEL_99:
        goto LABEL_100;
      }

      uint64_t v47 = (uint64_t)v45;
      bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(v7);
      size_t v49 = *bytes_ptr;
      if (xpc_data_get_length(v7) < v49) {
        goto LABEL_100;
      }
      char v39 = sub_10001F524(a1, (uint64_t)bytes_ptr, v47);
      goto LABEL_47;
    case 7uLL:
      xpc_connection_t v50 = xpc_dictionary_get_remote_connection(v4);
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      BOOL v52 = sub_100010A1C((uint64_t)&OBJC_CLASS___NEHelperServer, v51, (uint64_t)"com.apple.private.nehelper.privileged");

      if (v52)
      {
        uint64_t v55 = xpc_dictionary_get_string(v4, "cache-interface-name");
        if (!v55) {
          goto LABEL_101;
        }
        sub_10001F928(a1, v55);
        goto LABEL_65;
      }

      uint64_t v83 = ne_log_obj(v53, v54);
      xpc_object_t v7 = (xpc_object_t)objc_claimAutoreleasedReturnValue(v83);
      if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_100;
      }
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = objc_getProperty(a1, v84, 24LL, 1);
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "com.apple.private.nehelper.privileged";
      uint64_t v85 = "Denying clear redirected addresses command because %@ does not have the %s entitlement";
      goto LABEL_63;
    case 8uLL:
      id v56 = xpc_dictionary_get_string(v4, "cache-app-bundle-id");
      if (v56)
      {
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v56));
        id v128 = v58;
        BOOL v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v128, 1LL));
        sub_10001FE2C((uint64_t)a1, v59);
      }

      else
      {
        sub_100020028(a1, v57);
      }

      goto LABEL_65;
    case 9uLL:
      xpc_connection_t v60 = xpc_dictionary_get_remote_connection(v4);
      id v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      BOOL v62 = sub_100010A1C((uint64_t)&OBJC_CLASS___NEHelperServer, v61, (uint64_t)"com.apple.private.nehelper.privileged");

      if (!v62)
      {
        uint64_t v86 = ne_log_obj(v63, v64);
        xpc_object_t v7 = (xpc_object_t)objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = objc_getProperty(a1, v87, 24LL, 1);
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "com.apple.private.nehelper.privileged";
          uint64_t v85 = "Denying set match domains command because %@ does not have the %s entitlement";
LABEL_63:
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_ERROR, v85, buf, 0x16u);
        }

        goto LABEL_100;
      }

      uint64_t v65 = xpc_dictionary_get_string(v4, "cache-service");
      xpc_object_t v66 = xpc_dictionary_get_value(v4, "cache-match-domains");
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      xpc_object_t v7 = v67;
      if (!v65 || !v67 || xpc_get_type(v67) != (xpc_type_t)&_xpc_type_array)
      {
LABEL_100:

        goto LABEL_101;
      }

      id v68 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
      id v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v65));
      char v39 = sub_10001ECF8(a1, v68, v69);

LABEL_47:
      if ((v39 & 1) == 0) {
        goto LABEL_101;
      }
LABEL_65:
      xpc_object_t v7 = 0LL;
LABEL_91:
      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 0LL, v7);

LABEL_102:
      return;
    case 0xAuLL:
      uuid = xpc_dictionary_get_uuid(v4, "config-identifier");
      if (uuid)
      {
        id v72 = uuid;
        int v73 = xpc_dictionary_get_int64(v4, "cache-user-uid");
        if (!v73)
        {
          memset(buf, 0, 32);
          xpc_dictionary_get_audit_token(v4, buf);
          __int128 v126 = *(_OWORD *)buf;
          __int128 v127 = *(_OWORD *)&buf[16];
          int v73 = NEUIDForAuditToken(&v126);
        }

        char v74 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v72);
        __int128 v75 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
        id v77 = objc_getProperty(a1, v76, 8LL, 1);
        v117[0] = _NSConcreteStackBlock;
        v117[1] = 3221225472LL;
        v117[2] = sub_100020134;
        v117[3] = &unk_100035508;
        id v118 = v74;
        id v119 = v4;
        id v120 = a1;
        int v121 = v73;
        __int128 v78 = v74;
        [v75 loadConfigurationWithID:v78 withCompletionQueue:v77 handler:v117];

        goto LABEL_102;
      }

      uint64_t v88 = ne_log_obj(0LL, v71);
      uint64_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_ERROR,  "No configuration ID provided for populating the cache",  buf,  2u);
      }

      goto LABEL_101;
    default:
      goto LABEL_101;
  }

uint64_t sub_10001ECF8(SCPreferencesRef *a1, void *a2, void *a3)
{
  id v26 = a2;
  id v5 = a3;
  id Property = (dispatch_queue_s *)objc_getProperty(a1, v6, 8LL, 1);
  dispatch_assert_queue_V2(Property);
  CFPropertyListRef Value = SCPreferencesGetValue(a1[2], @"services");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(Value);
  else {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  CFPropertyListRef v11 = v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v5, v26));
  else {
    __int16 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v14 = v13;
  uint64_t v15 = ne_session_type_to_string(1LL);
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v16));

  if (isa_nsdictionary(v17))
  {
    xpc_object_t v18 = (NSMutableDictionary *)[v17 mutableCopy];
    -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", @"match-domains");
  }

  else
  {
    xpc_object_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v27, @"match-domains");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v18, v19);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, v5);
  if (SCPreferencesSetValue(a1[2], @"services", v11) && SCPreferencesCommitChanges(a1[2]))
  {
    sub_1000208CC(a1, v20);
    if ((nelog_is_extra_vpn_logging_enabled() & 1) == 0)
    {
      uint64_t v23 = 1LL;
      goto LABEL_23;
    }

    uint64_t v21 = ne_log_large_obj();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Set match domains for service %@:%@",  buf,  0x16u);
    }

    uint64_t v23 = 1LL;
  }

  else
  {
    if ((nelog_is_extra_vpn_logging_enabled() & 1) == 0)
    {
      uint64_t v23 = 0LL;
      goto LABEL_23;
    }

    uint64_t v24 = ne_log_large_obj();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to set match domains for service %@:%@",  buf,  0x16u);
    }

    uint64_t v23 = 0LL;
  }

LABEL_23:
  return v23;
}

uint64_t sub_10001F00C(SCPreferencesRef *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id Property = (dispatch_queue_s *)objc_getProperty(a1, v9, 8LL, 1);
  dispatch_assert_queue_V2(Property);
  if (isa_nsarray(v7))
  {
    CFPropertyListRef Value = SCPreferencesGetValue(a1[2], @"services");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(Value);
    else {
      __int16 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    uint64_t v15 = v13;
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v8));
    __int128 v34 = v16;
    uint64_t v35 = v12;
    else {
      uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    xpc_object_t v18 = v17;
    uint64_t v19 = ne_session_type_to_string(1LL);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v20));

    __int128 v33 = v21;
    else {
      uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    uint64_t v23 = v22;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a4, v8));
    xpc_connection_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v24));
    int v26 = isa_nsdictionary(v25);

    if (v26)
    {
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v24));
      xpc_connection_t v28 = (NSMutableDictionary *)[v27 mutableCopy];
    }

    else
    {
      xpc_connection_t v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v7,  @"service-domain-info");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v28, v24);
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v23, v29);

    id v8 = v32;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, v32);
    if (SCPreferencesSetValue(a1[2], @"services", v15) && SCPreferencesCommitChanges(a1[2]))
    {
      sub_1000208CC(a1, v30);
      uint64_t v14 = 1LL;
    }

    else
    {
      uint64_t v14 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

uint64_t sub_10001F2B0(SCPreferencesRef *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id Property = (dispatch_queue_s *)objc_getProperty(a1, v6, 8LL, 1);
  dispatch_assert_queue_V2(Property);
  CFPropertyListRef Value = SCPreferencesGetValue(a1[2], @"services");
  SEL v9 = (void *)objc_claimAutoreleasedReturnValue(Value);
  if (isa_nsdictionary(v9))
  {
    id v10 = [v9 mutableCopy];
    CFPropertyListRef v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v5]);
    if (isa_nsdictionary(v11))
    {
      id v12 = [v11 mutableCopy];
      uint64_t v13 = ne_session_type_to_string(1LL);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
      __int16 v30 = v12;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v14]);

      if (isa_nsdictionary(v15))
      {
        id v16 = [v15 mutableCopy];
        uint64_t v17 = a3;
        xpc_object_t v18 = v16;
        id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:"));
        if (isa_nsdictionary(v19))
        {
          BOOL v27 = v19;
          xpc_connection_t v28 = v18;
          id v20 = [v19 mutableCopy];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"service-domains"]);

          if (v21)
          {
            [v20 removeObjectForKey:@"service-domains"];
            xpc_object_t v18 = v28;
            [v28 setObject:v20 forKeyedSubscript:v29];
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
            uint64_t v23 = v30;
            [v30 setObject:v28 forKeyedSubscript:v22];

            [v10 setObject:v30 forKeyedSubscript:v5];
            if (SCPreferencesSetValue(a1[2], @"services", v10) && SCPreferencesCommitChanges(a1[2]))
            {
              sub_1000208CC(a1, v24);
              uint64_t v25 = 1LL;
            }

            else
            {
              uint64_t v25 = 0LL;
            }
          }

          else
          {
            uint64_t v25 = 0LL;
            xpc_object_t v18 = v28;
            uint64_t v23 = v30;
          }

          uint64_t v19 = v27;
        }

        else
        {
          uint64_t v25 = 0LL;
          uint64_t v23 = v30;
        }
      }

      else
      {
        uint64_t v25 = 0LL;
        uint64_t v23 = v30;
      }
    }

    else
    {
      uint64_t v25 = 0LL;
    }
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  return v25;
}

uint64_t sub_10001F524(SCPreferencesRef *a1, uint64_t a2, uint64_t a3)
{
  id Property = (dispatch_queue_s *)objc_getProperty(a1, (SEL)a2, 8LL, 1);
  dispatch_assert_queue_V2(Property);
  if (!a2) {
    return 0LL;
  }
  int v7 = *(unsigned __int8 *)(a2 + 1);
  if (v7 != 30 && v7 != 2) {
    return 0LL;
  }
  CFPropertyListRef Value = SCPreferencesGetValue(a1[2], @"redirected-addresses");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(Value);
  else {
    CFPropertyListRef v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v13 = v11;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14));
  int v16 = isa_nsdictionary(v15);

  if (v16)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14));
    xpc_object_t v18 = (NSMutableDictionary *)[v17 mutableCopy];
  }

  else
  {
    xpc_object_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  int v19 = *(unsigned __int8 *)(a2 + 1);
  if (v19 == 30)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v18,  "objectForKeyedSubscript:",  @"ipv6-subnets"));
    int v25 = isa_nsdictionary(v24);

    if (v25)
    {
      int v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v18,  "objectForKeyedSubscript:",  @"ipv6-subnets"));
      uint64_t v23 = (NSMutableDictionary *)[v26 mutableCopy];
    }

    else
    {
      uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }

    id v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v23,  "objectForKeyedSubscript:",  @"subnet-addresses"));
    int v32 = isa_nsarray(v31);

    if (v32)
    {
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v23,  "objectForKeyedSubscript:",  @"subnet-addresses"));
      __int16 v30 = (NSMutableArray *)[v33 mutableCopy];
    }

    else
    {
      __int16 v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    }

    if (isa_nsarray(v30))
    {
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a2 + 8, 16LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v30,  @"subnet-addresses");
    }

    uint64_t v35 = @"ipv6-subnets";
    goto LABEL_40;
  }

  if (v19 != 2) {
    goto LABEL_42;
  }
  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v18,  "objectForKeyedSubscript:",  @"ipv4-subnets"));
  int v21 = isa_nsdictionary(v20);

  if (v21)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v18,  "objectForKeyedSubscript:",  @"ipv4-subnets"));
    uint64_t v23 = (NSMutableDictionary *)[v22 mutableCopy];
  }

  else
  {
    uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  if (isa_nsdictionary(v23))
  {
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v23,  "objectForKeyedSubscript:",  @"subnet-addresses"));
    int v28 = isa_nsarray(v27);

    if (v28)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v23,  "objectForKeyedSubscript:",  @"subnet-addresses"));
      __int16 v30 = (NSMutableArray *)[v29 mutableCopy];
    }

    else
    {
      __int16 v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    }

    if (isa_nsarray(v30))
    {
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a2 + 4, 4LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v30,  @"subnet-addresses");
    }

    uint64_t v35 = @"ipv4-subnets";
LABEL_40:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v23, v35);
  }

LABEL_41:
LABEL_42:
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v18, v14);
  if (SCPreferencesSetValue(a1[2], @"redirected-addresses", v13) && SCPreferencesCommitChanges(a1[2]))
  {
    sub_1000208CC(a1, v37);
    uint64_t v12 = 1LL;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

void sub_10001F928(SCPreferencesRef *a1, const char *a2)
{
  id Property = (dispatch_queue_s *)objc_getProperty(a1, a2, 8LL, 1);
  dispatch_assert_queue_V2(Property);
  CFPropertyListRef Value = SCPreferencesGetValue(a1[2], @"redirected-addresses");
  id v11 = (id)objc_claimAutoreleasedReturnValue(Value);
  if (isa_nsdictionary(v11))
  {
    id v6 = [v11 mutableCopy];
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
    int v9 = isa_nsdictionary(v8);

    if (v9) {
      [v6 setObject:0 forKeyedSubscript:v7];
    }

    if (v6)
    {
      if (!SCPreferencesSetValue(a1[2], @"redirected-addresses", v6) || !SCPreferencesCommitChanges(a1[2])) {
        goto LABEL_12;
      }
LABEL_10:
      sub_1000208CC(a1, v10);
      goto LABEL_12;
    }
  }

  if (!SCPreferencesRemoveValue(a1[2], @"redirected-addresses"))
  {
    id v6 = 0LL;
    goto LABEL_12;
  }

  id v6 = 0LL;
  if (SCPreferencesCommitChanges(a1[2])) {
    goto LABEL_10;
  }
LABEL_12:
}

id sub_10001FA54(void *a1, void *a2, void *a3, int a4, unsigned int a5, _BYTE *a6)
{
  id v11 = a2;
  if (!a1)
  {
    uint64_t v14 = 0LL;
    goto LABEL_26;
  }

  unsigned __int8 v50 = 0;
  id v12 = sub_100021508(a1, v11, a3, a4, a5, 0LL, a6, &v50);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = v13;
  if (!byte_10003EC08)
  {
    int v15 = v50;
    id v16 = v13;
    id v17 = v11;
    xpc_object_t v18 = sub_100022198(v16);
    int v19 = v18;
    if (v15)
    {
      id v20 = -[NSMutableArray count](v18, "count");
      if (v20 != (id)1)
      {
        uint64_t v42 = ne_log_obj(v20, v21);
        uint64_t v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
        {
          id v43 = -[NSMutableArray count](v19, "count");
          *(_DWORD *)__int128 buf = 134217984;
          id v52 = v43;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  OS_LOG_TYPE_ERROR,  "Synthentic UUID count is wrong (%lu)",  buf,  0xCu);
        }

        goto LABEL_25;
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)&unk_10003EC18);
    uint64_t v22 = sub_100021290();
    uint64_t v48 = sub_10002146C(v22, 0);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", v17));
    id v24 = [v23 isEqualToArray:v19];
    char v25 = (char)v24;
    uint64_t v27 = ne_log_obj(v24, v26);
    int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    char v47 = v25;
    if ((v25 & 1) != 0)
    {
      if (v29)
      {
        id v30 = [v23 count];
        *(_DWORD *)__int128 buf = 134218242;
        id v52 = v30;
        __int16 v53 = 2112;
        id v54 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%lu UUIDs for %@ are already in the cache",  buf,  0x16u);
      }

      id v31 = v48;
      if (!v15) {
        goto LABEL_24;
      }
    }

    else
    {
      if (v29)
      {
        id v32 = [v16 count];
        *(_DWORD *)__int128 buf = 134218242;
        id v52 = v32;
        __int16 v53 = 2112;
        id v54 = v17;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Caching %lu UUID(s) for %@", buf, 0x16u);
      }

      id v31 = v48;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v19, v17);
      if (!v15) {
        goto LABEL_23;
      }
    }

    uint64_t v46 = v23;
    id v49 = v16;
    __int128 v33 = sub_10002146C(v22, 1);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", v17));
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v19, "firstObject"));
    unsigned __int8 v36 = [v34 isEqualToData:v35];

    uint64_t v39 = ne_log_obj(v37, v38);
    xpc_connection_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    if ((v36 & 1) != 0)
    {
      if (v41)
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v52 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "A synthetic UUID for %@ is already in the cache",  buf,  0xCu);
      }

      id v16 = v49;
      uint64_t v23 = v46;
      if ((v47 & 1) != 0) {
        goto LABEL_24;
      }
    }

    else
    {
      if (v41)
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v52 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Caching a synthetic UUID for %@",  buf,  0xCu);
      }

      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v19, "firstObject"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v44, v17);

      id v16 = v49;
      uint64_t v23 = v46;
    }

LABEL_23:
    sub_1000222E8((uint64_t)v22);
LABEL_24:
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003EC18);

LABEL_25:
  }

LABEL_26:
  return v14;
}

  uint64_t v38 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v37 = 0LL;
  BOOL v29 = 0LL;
LABEL_40:
  if (v11 && [v11 length])
  {
    uint64_t v42 = v11;
    xpc_dictionary_set_data(v38, "app-cd-hash", [v42 bytes], (size_t)objc_msgSend(v42, "length"));
  }

  if (v6 && [v6 length] && uuid_is_null(dst))
  {
    id v43 = sub_10001E094((uint64_t)&OBJC_CLASS___NEHelperCacheManager);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_100023C30;
    v49[3] = &unk_100035638;
    unsigned __int8 v50 = v6;
    uint64_t v51 = v38;
    id v52 = v3;
    id v45 = v50;
    char v47 = v49;
    if (v44)
    {
      id Property = (dispatch_queue_s *)objc_getProperty(v44, v46, 8LL, 1);
      buffer[0] = _NSConcreteStackBlock;
      buffer[1] = 3221225472LL;
      _OWORD buffer[2] = sub_100023078;
      buffer[3] = &unk_100035558;
      buffer[4] = v44;
      xpc_connection_t v60 = v45;
      id v61 = 0LL;
      BOOL v62 = v47;
      dispatch_async(Property, buffer);
    }
  }

  else
  {
    if (!uuid_is_null(dst)) {
      xpc_dictionary_set_uuid(v38, "app-euuid", dst);
    }
    sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v3, 0LL, v38);
  }

LABEL_53:
}

void sub_10001FE2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10003EC18);
    uint64_t v6 = ne_log_obj(v4, v5);
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing UUIDs for %@", buf, 0xCu);
    }

    id v8 = (void *)sub_1000227FC();
    int v9 = v8;
    if (v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"uuid-mappings"]);
      if (v10)
      {
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        id v11 = v3;
        id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v20;
          while (2)
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)i),  (void)v19));

              if (v16)
              {

                id v17 = [v10 mutableCopy];
                [v17 removeObjectsForKeys:v11];
                id v18 = [v9 mutableCopy];
                [v18 setObject:v17 forKeyedSubscript:@"uuid-mappings"];
                sub_1000222E8((uint64_t)v18);

                id v11 = v17;
                goto LABEL_16;
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

LABEL_16:
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003EC18);
  }
}

void sub_100020028(void *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = ne_log_obj(a1, a2);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing the UUID cache", v13, 2u);
    }

    +[NEProcessInfo clearUUIDCache](&OBJC_CLASS___NEProcessInfo, "clearUUIDCache");
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10003EC18);
    uint64_t v5 = (void *)sub_1000227FC();
    uint64_t v6 = v5;
    if (v5) {
      int v7 = (NSMutableDictionary *)[v5 mutableCopy];
    }
    else {
      int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v8 = v7;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", 0LL, @"uuid-mappings");
    sub_1000222E8((uint64_t)v8);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003EC18);
    id v9 = sub_10000F110((uint64_t)&OBJC_CLASS___NEHelperServer);
    id v10 = (_BYTE *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      char v11 = v10[12];

      if ((v11 & 1) != 0) {
        sub_10002283C(a1, v12);
      }
    }
  }

void sub_100020134(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int v7 = v5;
  if (!a3)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 appVPN]);

    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 appVPN]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 appRules]);
    }

    else
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v7 pathController]);

      if (!v15)
      {
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v7 relay]);

        if (!v20)
        {
LABEL_12:
          id v10 = *(void **)(a1 + 40);
          int64_t v11 = 0LL;
          goto LABEL_13;
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 relay]);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v13 perApp]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v21 appRules]);

LABEL_10:
        if (v16)
        {
          id v17 = *(void **)(a1 + 48);
          uint64_t v18 = *(unsigned int *)(a1 + 56);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
          sub_100020D14(v17, v16, v18, v19);
        }

        goto LABEL_12;
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 pathController]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 pathRules]);
    }

    id v16 = (void *)v14;
    goto LABEL_10;
  }

  uint64_t v8 = ne_log_obj(v5, v6);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    int v23 = 138412290;
    uint64_t v24 = v22;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to load configuration %@",  (uint8_t *)&v23,  0xCu);
  }

  id v10 = *(void **)(a1 + 40);
  int64_t v11 = 2LL;
LABEL_13:
  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v10, v11, 0LL);
}

uint64_t sub_100020310(SCPreferencesRef *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id Property = (dispatch_queue_s *)objc_getProperty(a1, v7, 8LL, 1);
  dispatch_assert_queue_V2(Property);
  CFPropertyListRef Value = SCPreferencesGetValue(a1[2], @"services");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(Value);
  xpc_connection_t v60 = v10;
  else {
    int64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v12 = v11;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v6));
  BOOL v59 = v13;
  else {
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  int v15 = v14;
  uint64_t v16 = ne_session_type_to_string(1LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v17));

  uint64_t v58 = v18;
  if (isa_nsdictionary(v18))
  {
    __int128 v19 = (NSMutableDictionary *)[v18 mutableCopy];
    -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", @"included-routes");
    -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", @"excluded-routes");
  }

  else
  {
    __int128 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"included-routes"]);

  if (v20)
  {
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"included-routes"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v21,  @"included-routes");
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"excluded-routes"]);

  if (v22)
  {
    int v23 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"excluded-routes"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v23,  @"excluded-routes");
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v19, v24);

  id v25 = v6;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v15, v6);
  if (SCPreferencesSetValue(a1[2], @"services", v12) && SCPreferencesCommitChanges(a1[2]))
  {
    sub_1000208CC(a1, v26);
    uint64_t v27 = 1LL;
  }

  else
  {
    uint64_t v27 = 0LL;
  }

  if (nelog_is_extra_vpn_logging_enabled())
  {
    id v28 = v5;
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
    {
      id v30 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      id v31 = [v28 mutableCopy];
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"included-routes"]);
      id v54 = v25;
      if (v57)
      {
        id v55 = v31;
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:@"ipv4-subnets"]);
        __int128 v33 = v32;
        if (v32)
        {
          __int128 v34 = v25;
          uint64_t v35 = sub_1000209AC(v32);
          -[NSMutableString appendFormat:](v30, "appendFormat:", @"\nIPv4: %@", v35);

          id v25 = v34;
        }

        unsigned __int8 v36 = v30;
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:@"ipv6-subnets"]);
        uint64_t v38 = v37;
        if (v37)
        {
          uint64_t v39 = sub_1000209AC(v37);
          -[NSMutableString appendFormat:](v36, "appendFormat:", @"\nIPv6: %@", v39);

          id v25 = v54;
        }

        id v30 = v36;
        id v31 = v55;
      }

      xpc_connection_t v40 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"excluded-routes"]);
      BOOL v41 = v40;
      if (v40)
      {
        id v56 = v30;
        unsigned int v53 = v27;
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:@"ipv4-subnets"]);
        id v43 = v42;
        if (v42)
        {
          uint64_t v44 = sub_1000209AC(v42);
          -[NSMutableString appendFormat:](v56, "appendFormat:", @"\nIPv4 excluded: %@", v44);
        }

        id v45 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:@"ipv6-subnets"]);
        uint64_t v46 = v45;
        if (v45)
        {
          id v47 = v31;
          uint64_t v48 = sub_1000209AC(v45);
          -[NSMutableString appendFormat:](v56, "appendFormat:", @"\nIPv6 excluded: %@", v48);

          id v31 = v47;
        }

        id v25 = v54;
        id v30 = v56;
        uint64_t v27 = v53;
      }

      [v31 setObject:0 forKeyedSubscript:@"included-routes"];
      [v31 setObject:0 forKeyedSubscript:@"excluded-routes"];
      if ([v31 count]) {
        -[NSMutableString appendFormat:](v30, "appendFormat:", @"\nextra: %@", v31);
      }
    }

    else
    {
      id v30 = (NSMutableString *)@"NULL";
    }

    uint64_t v49 = ne_log_large_obj();
    unsigned __int8 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    uint64_t v51 = v50;
    if ((v27 & 1) != 0)
    {
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412546;
        BOOL v62 = v25;
        __int16 v63 = 2112;
        uint64_t v64 = v30;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Set routes for service %@:%@", buf, 0x16u);
      }
    }

    else if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412546;
      BOOL v62 = v25;
      __int16 v63 = 2112;
      uint64_t v64 = v30;
      _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Failed to set routes for service %@:%@",  buf,  0x16u);
    }
  }

  return v27;
}

void sub_1000208CC(void *a1, const char *a2)
{
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(a1, a2, 8LL, 1);
    dispatch_assert_queue_V2(Property);
    uint64_t v3 = notify_post("com.apple.networkextension.ondemandcachechanged");
    if ((_DWORD)v3)
    {
      int v5 = v3;
      uint64_t v6 = ne_log_obj(v3, v4);
      SEL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315394;
        id v9 = "com.apple.networkextension.ondemandcachechanged";
        __int16 v10 = 1024;
        int v11 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to post the %s notification: %u",  (uint8_t *)&v8,  0x12u);
      }
    }
  }

NSMutableString *sub_1000209AC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v1, v2) & 1) == 0 || [v1 count] != (id)2) {
    goto LABEL_40;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"subnet-addresses"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
LABEL_39:

LABEL_40:
    int v8 = (NSMutableString *)objc_claimAutoreleasedReturnValue([v1 description]);
    goto LABEL_41;
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"subnet-masks"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0
    || (SEL v7 = (char *)[v3 count], v7 != objc_msgSend(v5, "count")))
  {

    goto LABEL_39;
  }

  int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (v7)
  {
    id v9 = 0LL;
    char v10 = 0;
    id v30 = v7;
    do
    {
      if ((v10 & 1) != 0) {
        -[NSMutableString appendString:](v8, "appendString:", @", ");
      }
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v9]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v9]);
      id v13 = v11;
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData);
        if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
        {
          unint64_t v16 = (unint64_t)[v13 length];
          if ((id)v16 == [v12 length] && (v16 == 16 || v16 == 4))
          {
            if (v16 == 16) {
              int v17 = 30;
            }
            else {
              int v17 = 2;
            }
            if (inet_ntop(v17, [v13 bytes], v31, 0x2Eu))
            {
              uint64_t v18 = (unsigned __int8 *)[v12 bytes];
              uint64_t v19 = 0LL;
              int v20 = 0;
              char v21 = 0;
              unsigned __int8 v22 = 0;
LABEL_20:
              BOOL v23 = v21;
              while (2)
              {
                int v24 = v18[v19];
                int v25 = 7;
                BOOL v26 = v23;
                do
                {
                  BOOL v23 = ((1 << v25) & v24) == 0;
                  if (((1 << v25) & v24) != 0)
                  {
                    ++v22;
                    if (v26)
                    {
                      uint64_t v19 = ++v20;
                      char v21 = 1;
                      goto LABEL_30;
                    }
                  }

                  --v25;
                  BOOL v26 = v23;
                }

                while (v25 != -1);
                uint64_t v19 = ++v20;
                break;
              }

              if ((v21 & 1) == 0)
              {
                if (8 * v16 == v22) {
                  id v28 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v31));
                }
                else {
                  id v28 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%s/%u",  v31,  v22);
                }
                uint64_t v27 = v28;
                SEL v7 = v30;
                goto LABEL_32;
              }
            }

void sub_100020D14(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v56 = a4;
  if (!a1) {
    goto LABEL_40;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10003EC18);
  int v8 = sub_100021290();
  id v9 = sub_10002146C(v8, 0);
  unsigned int v53 = sub_10002146C(v8, 1);
  uint64_t v11 = ne_log_obj(v53, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v67 = v56;
    __int16 v68 = 2048;
    id v69 = [v7 count];
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Populating the cache with UUIDs for %lu app rules",  buf,  0x16u);
  }

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v13 = v7;
  id v59 = [v13 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (!v59)
  {

    goto LABEL_36;
  }

  uint64_t v51 = (uint64_t)v8;
  id v52 = v7;
  char v14 = 0;
  uint64_t v58 = *(void *)v63;
  id v55 = v13;
  id v54 = a1;
  do
  {
    for (i = 0LL; i != v59; i = (char *)i + 1)
    {
      if (*(void *)v63 != v58) {
        objc_enumerationMutation(v13);
      }
      unint64_t v16 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NEPathRule);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        id v18 = v16;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 matchSigningIdentifier]);
        unsigned __int8 v20 = [v19 isEqualToString:@"PathRuleDefaultIdentifier"];

        if ((v20 & 1) != 0) {
          goto LABEL_29;
        }
      }

      else
      {
        id v18 = 0LL;
      }

      char v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "matchSigningIdentifier", v51, v52));
      unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v21));

      if (!v22)
      {
        char v61 = 0;
        if (v18) {
          int v23 = [v18 isIdentifierExternal];
        }
        else {
          int v23 = 0;
        }
        char v60 = 0;
        int v24 = (void *)objc_claimAutoreleasedReturnValue([v16 matchSigningIdentifier]);
        int v25 = (void *)objc_claimAutoreleasedReturnValue([v16 matchPath]);
        id v26 = sub_100021508(a1, v24, v25, v23, a3, 0LL, &v61, &v60);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

        id v28 = sub_100022198(v27);
        uint64_t v30 = ne_log_obj(v28, v29);
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = v9;
          id v33 = [v27 count];
          uint64_t v57 = v28;
          __int128 v34 = v27;
          uint64_t v35 = a3;
          if (v60) {
            unsigned __int8 v36 = @"synthetic ";
          }
          else {
            unsigned __int8 v36 = &stru_100036298;
          }
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v16 matchSigningIdentifier]);
          *(_DWORD *)__int128 buf = 138413058;
          id v67 = v56;
          __int16 v68 = 2048;
          id v69 = v33;
          id v9 = v32;
          a1 = v54;
          __int16 v70 = 2112;
          uint64_t v71 = v36;
          a3 = v35;
          uint64_t v27 = v34;
          id v28 = v57;
          __int16 v72 = 2112;
          int v73 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%@: Populating the cache with %lu %@UUID(s) for %@",  buf,  0x2Au);

          id v13 = v55;
        }

        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v16 matchSigningIdentifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v28, v38);

        if (v60)
        {
          id v39 = -[NSMutableArray count](v28, "count");
          if (v39 == (id)1)
          {
            BOOL v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v28, "firstObject"));
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v16 matchSigningIdentifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v41, v42);
          }

          else
          {
            uint64_t v43 = ne_log_obj(v39, v40);
            BOOL v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              id v44 = -[NSMutableArray count](v28, "count");
              *(_DWORD *)__int128 buf = 138412546;
              id v67 = v56;
              __int16 v68 = 2048;
              id v69 = v44;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%@: Cannot populate synthesized UUID, count is wrong (%lu)",  buf,  0x16u);
            }
          }
        }

        char v14 = 1;
      }

LABEL_29:
    }

    id v59 = [v13 countByEnumeratingWithState:&v62 objects:v74 count:16];
  }

  while (v59);

  int v8 = (NSMutableDictionary *)v51;
  id v7 = v52;
  if ((v14 & 1) != 0)
  {
    uint64_t v47 = ne_log_obj(v45, v46);
    uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v67 = v56;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%@: Saving the cache", buf, 0xCu);
    }

    sub_1000222E8(v51);
    goto LABEL_39;
  }

LABEL_36:
  uint64_t v49 = ne_log_obj(v45, v46);
  unsigned __int8 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v67 = v56;
    _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%@: Cache was already fully populated",  buf,  0xCu);
  }

LABEL_39:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003EC18);

LABEL_40:
}

NSMutableDictionary *sub_100021290()
{
  v0 = (void *)sub_1000227FC();
  id v1 = v0;
  if (v0) {
    uint64_t v2 = (NSMutableDictionary *)[v0 mutableCopy];
  }
  else {
    uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v3 = v2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"os-version"));

  if (!v4)
  {
    uint64_t v5 = ne_session_copy_os_version_string();
    if (v5)
    {
      id v7 = (void *)v5;
      int v8 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  v5,  4LL);
      free(v7);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"os-version");
    }

    else
    {
      uint64_t v9 = ne_log_obj(0LL, v6);
      int v8 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "Failed to get the current OS version",  buf,  2u);
      }
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"boot-uuid"));

  if (!v10)
  {
    *(void *)__int128 buf = 0LL;
    uint64_t v18 = 0LL;
    uint64_t boot_session_uuid = ne_session_get_boot_session_uuid(buf);
    if ((_DWORD)boot_session_uuid)
    {
      id v13 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", buf, 16LL);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, @"boot-uuid");
    }

    else
    {
      uint64_t v14 = ne_log_obj(boot_session_uuid, v12);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unint64_t v16 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to get the current boot session UUID",  v16,  2u);
      }
    }
  }

  return v3;
}

NSMutableDictionary *sub_10002146C(void *a1, int a2)
{
  uint64_t v3 = @"uuid-mappings";
  if (a2) {
    uint64_t v3 = @"synthesized-uuid-mappings";
  }
  uint64_t v4 = v3;
  id v5 = a1;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  id v7 = v6;
  if (v6) {
    int v8 = (NSMutableDictionary *)[v6 mutableCopy];
  }
  else {
    int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v9 = v8;
  [v5 setObject:v8 forKeyedSubscript:v4];

  return v9;
}

id sub_100021508( void *a1, void *a2, void *a3, int a4, unsigned int a5, unint64_t a6, _BYTE *a7, _BYTE *a8)
{
  id v13 = a2;
  id v14 = a3;
  unint64_t v16 = (dispatch_queue_s *)objc_getProperty(a1, v15, 8LL, 1);
  dispatch_assert_queue_V2(v16);

  if (a6 < 0xB)
  {
    if (v14)
    {
      id v131 = v14;
      unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v131,  1LL));
    }

    else
    {
      unsigned __int8 v22 = 0LL;
    }

    int v114 = a4;
    id v119 = v22;
    if (isa_nsarray(v22))
    {
      int v23 = sub_100022564(a1, v22);
      int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (isa_nsarray(v24))
      {
        BOOL v25 = [v24 count] == 0;
LABEL_13:
        unint64_t v120 = a6;
        if (!v14 && v25)
        {
          id v123 = 0LL;
          uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NELaunchServices bundleProxyForIdentifier:uid:plugins:]( &OBJC_CLASS___NELaunchServices,  "bundleProxyForIdentifier:uid:plugins:",  v13,  a5,  &v123));
          unint64_t v27 = (unint64_t)v123;
          if ([(id)v27 count] && objc_msgSend((id)v26, "isWatchKitApp"))
          {

            uint64_t v26 = 0LL;
          }

          if (v26 | v27)
          {
            uint64_t v108 = a8;
            id v111 = v13;
            *a7 = 1;
            id v28 = (id)v26;
            id v29 = (id)v27;
            id v30 = v24;
            id Property = (dispatch_queue_s *)objc_getProperty(a1, v31, 8LL, 1);
            dispatch_assert_queue_V2(Property);
            SEL v117 = v28;
            id v33 = sub_1000226F4(a1, v28, v30);
            int v24 = (void *)objc_claimAutoreleasedReturnValue(v33);
            __int128 v124 = 0u;
            __int128 v125 = 0u;
            __int128 v126 = 0u;
            __int128 v127 = 0u;
            id v34 = v29;
            id v35 = [v34 countByEnumeratingWithState:&v124 objects:buf count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v125;
              do
              {
                uint64_t v38 = 0LL;
                id v39 = v24;
                do
                {
                  if (*(void *)v125 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  id v40 = sub_1000226F4(a1, *(void **)(*((void *)&v124 + 1) + 8LL * (void)v38), v39);
                  int v24 = (void *)objc_claimAutoreleasedReturnValue(v40);

                  uint64_t v38 = (char *)v38 + 1;
                  id v39 = v24;
                }

                while (v36 != v38);
                id v36 = [v34 countByEnumeratingWithState:&v124 objects:buf count:16];
              }

              while (v36);
            }

            id v14 = 0LL;
            id v13 = v111;
            a8 = v108;
          }
        }

        uint64_t v41 = objc_claimAutoreleasedReturnValue([(id)qword_10003EBD8 objectForKeyedSubscript:v13]);
        id v118 = (void *)v41;
        if (isa_nsstring(v41))
        {
          uint64_t v130 = v41;
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v130,  1LL));
        }

        else if (*a7)
        {
          uint64_t v42 = 0LL;
        }

        else
        {
          id v43 = v13;
          uint64_t v45 = (dispatch_queue_s *)objc_getProperty(a1, v44, 8LL, 1);
          dispatch_assert_queue_V2(v45);
          id v46 = v43;
          uint64_t v47 = v46;
          if ([v46 hasPrefix:@"com.apple."])
          {
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 substringFromIndex:10]);

            if ([v47 hasPrefix:@"icloud."])
            {
              uint64_t v48 = objc_claimAutoreleasedReturnValue([v47 substringFromIndex:7]);

              uint64_t v47 = (void *)v48;
            }
          }

          if ([v47 rangeOfCharacterFromSet:qword_10003EBE8] == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            __int128 v115 = (void *)objc_claimAutoreleasedReturnValue([@"/usr/libexec/" stringByAppendingString:v47]);
            *(void *)__int128 buf = v115;
            __int128 v112 = (void *)objc_claimAutoreleasedReturnValue([@"/usr/sbin/" stringByAppendingString:v47]);
            *(void *)&uint8_t buf[8] = v112;
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([@"/usr/local/bin/" stringByAppendingString:v47]);
            *(void *)&uint8_t buf[16] = v49;
            unsigned __int8 v50 = a8;
            id v51 = v14;
            id v52 = (void *)objc_claimAutoreleasedReturnValue([@"/usr/bin/" stringByAppendingString:v47]);
            uint32_t v133 = v52;
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  buf,  4LL));

            id v14 = v51;
            a8 = v50;
          }

          else
          {
            uint64_t v42 = 0LL;
          }
        }

        id v116 = v42;
        if (isa_nsarray(v42))
        {
          unsigned int v53 = sub_100022564(a1, v42);
          id v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          if (isa_nsarray(v54) && [v54 count])
          {
            else {
              id v55 = v54;
            }
            id v56 = v55;

            int v24 = v56;
          }
        }

        id v57 = v13;
        id v59 = (dispatch_queue_s *)objc_getProperty(a1, v58, 8LL, 1);
        dispatch_assert_queue_V2(v59);
        __int128 v126 = 0u;
        __int128 v127 = 0u;
        __int128 v124 = 0u;
        __int128 v125 = 0u;
        id v60 = (id)qword_10003EBD0;
        id v61 = [v60 countByEnumeratingWithState:&v124 objects:buf count:16];
        if (v61)
        {
          id v62 = v61;
          xpc_object_t v109 = a8;
          id v110 = v14;
          id v113 = v13;
          uint64_t v63 = *(void *)v125;
          while (2)
          {
            for (i = 0LL; i != v62; i = (char *)i + 1)
            {
              if (*(void *)v125 != v63) {
                objc_enumerationMutation(v60);
              }
              __int128 v65 = *(void **)(*((void *)&v124 + 1) + 8LL * (void)i);
              xpc_object_t v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectAtIndexedSubscript:0]);
              unsigned __int8 v67 = [v57 isEqualToString:v66];

              if ((v67 & 1) != 0)
              {
                __int16 v68 = (void *)objc_claimAutoreleasedReturnValue([v65 objectAtIndexedSubscript:1]);
                goto LABEL_58;
              }
            }

            id v62 = [v60 countByEnumeratingWithState:&v124 objects:buf count:16];
            if (v62) {
              continue;
            }
            break;
          }

          __int16 v68 = 0LL;
LABEL_58:
          id v14 = v110;
          id v13 = v113;
          a8 = v109;
        }

        else
        {
          __int16 v68 = 0LL;
        }

        if (isa_nsuuid(v68))
        {
          unint64_t v69 = v120;
          if (isa_nsarray(v24) && [v24 count])
          {
            uint64_t v70 = objc_claimAutoreleasedReturnValue([v24 arrayByAddingObject:v68]);
          }

          else
          {
            __int128 v129 = v68;
            uint64_t v70 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v129, 1LL));
          }

          uint64_t v71 = (void *)v70;

          int v24 = v71;
        }

        else
        {
          unint64_t v69 = v120;
        }

        if ((!isa_nsarray(v24) || ![v24 count])
          && [v57 hasPrefix:@"com.apple.webapp-"])
        {
          uint64_t v72 = sub_100021508(a1, @"com.apple.webapp", v14, 0LL, a5, v69 + 1, a7, a8);
          uint64_t v73 = objc_claimAutoreleasedReturnValue(v72);

          int v24 = (void *)v73;
        }

        if (!isa_nsarray(v24) || ![v24 count])
        {
          char v74 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003EBE0 objectForKeyedSubscript:v57]);
          if (isa_nsstring(v74))
          {
            uint64_t v75 = sub_100021508(a1, v74, v14, 0LL, a5, v69 + 1, a7, a8);
            uint64_t v76 = objc_claimAutoreleasedReturnValue(v75);

            int v24 = (void *)v76;
          }
        }

        if (isa_nsarray(v24))
        {
        }

        else if (v69)
        {
          goto LABEL_85;
        }

        if ([v57 hasPrefix:@"iCloud."])
        {
          id v77 = (void *)objc_claimAutoreleasedReturnValue([v57 substringFromIndex:7]);
          unint64_t v78 = v69 + 1;
          uint64_t v79 = sub_100021508(a1, v77, v14, 0LL, a5, v78, a7, a8);
          __int16 v80 = (void *)objc_claimAutoreleasedReturnValue(v79);

          if (!isa_nsarray(v80) || ![v80 count])
          {
            uint64_t v81 = sub_100021508(a1, @"com.apple.bird", v14, 0LL, a5, v78, a7, a8);
            uint64_t v82 = objc_claimAutoreleasedReturnValue(v81);

            __int16 v80 = (void *)v82;
          }

          int v24 = v80;
          unint64_t v69 = v120;
        }

LABEL_85:
        if (isa_nsarray(v24))
        {
        }

        else if (v69)
        {
          goto LABEL_94;
        }

        if ([v57 hasPrefix:@"com.apple.clouddocs."])
        {
          uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v57 substringFromIndex:20]);
          unint64_t v84 = v69 + 1;
          uint64_t v85 = sub_100021508(a1, v83, v14, 0LL, a5, v84, a7, a8);
          uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue(v85);

          if (!isa_nsarray(v86) || ![v86 count])
          {
            uint64_t v87 = sub_100021508(a1, @"com.apple.bird", v14, 0LL, a5, v84, a7, a8);
            uint64_t v88 = objc_claimAutoreleasedReturnValue(v87);

            uint64_t v86 = (void *)v88;
          }

          int v24 = v86;
          unint64_t v69 = v120;
        }

LABEL_94:
        if ((!isa_nsarray(v24) || ![v24 count])
          && [v57 hasPrefix:@"com.apple.CloudDocs"])
        {
          uint64_t v89 = sub_100021508(a1, @"com.apple.bird", v14, 0LL, a5, v69 + 1, a7, a8);
          uint64_t v90 = objc_claimAutoreleasedReturnValue(v89);

          int v24 = (void *)v90;
        }

        if (isa_nsarray(v24))
        {
        }

        else if (v69)
        {
          goto LABEL_104;
        }

        if ([v57 hasPrefix:@"com.apple.cloudkit."])
        {
          uint64_t v91 = sub_100021508(a1, @"com.apple.cloudd", v14, 0LL, a5, v69 + 1, a7, a8);
          uint64_t v92 = objc_claimAutoreleasedReturnValue(v91);

          int v24 = (void *)v92;
        }

LABEL_104:
        if (isa_nsarray(v24))
        {
        }

        else if (v69)
        {
          goto LABEL_112;
        }

        if (([v57 hasPrefix:@"com.automation."] & 1) != 0
          || ([v57 hasPrefix:@"com.iosframeworksqa."] & 1) != 0
          || [v57 hasPrefix:@"com.atvqa."])
        {
          uint64_t v93 = sub_100021508(a1, @"com.apple.coreautomationd", v14, 0LL, a5, v69 + 1, a7, a8);
          uint64_t v94 = objc_claimAutoreleasedReturnValue(v93);

          int v24 = (void *)v94;
        }

LABEL_112:
        if (isa_nsarray(v24))
        {
        }

        else if (v69)
        {
          goto LABEL_120;
        }

        if ((unint64_t)[v57 length] >= 0xC
          && [v57 rangeOfCharacterFromSet:qword_10003EBF0] == (id)10)
        {
          uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "substringWithRange:", 10, 1));
          unsigned int v96 = [v95 isEqualToString:@"."];

          if (v96)
          {
            char v97 = (void *)objc_claimAutoreleasedReturnValue([v57 substringFromIndex:11]);
            uint64_t v98 = sub_100021508(a1, v97, v14, 0LL, a5, v69 + 1, a7, a8);
            uint64_t v99 = objc_claimAutoreleasedReturnValue(v98);

            int v24 = (void *)v99;
          }
        }

LABEL_120:
        if (isa_nsarray(v24))
        {
          if ((unint64_t)[v24 count] | v69 || (v114 & 1) == 0)
          {
LABEL_129:
            id v21 = v24;

            unsigned __int8 v20 = v119;
            goto LABEL_130;
          }
        }

        else if (v69 || !v114)
        {
          goto LABEL_129;
        }

        id v100 = objc_alloc_init(&OBJC_CLASS___NSUUID);
        id v128 = v100;
        uint64_t v101 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v128, 1LL));

        uint64_t v104 = ne_log_obj(v102, v103);
        __int16 v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          id v106 = [v57 UTF8String];
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = v100;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v106;
          _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "Synthesized UUID %@ for bundle ID %s",  buf,  0x16u);
        }

        *a8 = 1;
        int v24 = (void *)v101;
        goto LABEL_129;
      }
    }

    else
    {
      int v24 = 0LL;
    }

    BOOL v25 = 1;
    goto LABEL_13;
  }

  uint64_t v19 = ne_log_obj(v17, v18);
  unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "we are out of our depths!", buf, 2u);
  }

  id v21 = 0LL;
LABEL_130:

  return v21;
}

NSMutableArray *sub_100022198(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (isa_nsuuid(v8))
        {
          v15[0] = 0LL;
          v15[1] = 0LL;
          objc_msgSend(v8, "getUUIDBytes:", v15, (void)v11);
          uint64_t v9 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v15, 16LL);
          -[NSMutableArray addObject:](v2, "addObject:", v9);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v5);
  }

  return v2;
}

void sub_1000222E8(uint64_t a1)
{
  id v21 = 0LL;
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a1,  200LL,  0LL,  &v21));
  uint64_t v2 = (char *)v21;
  id v4 = v2;
  if (v1) {
    BOOL v5 = v2 == 0LL;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    uint64_t v6 = ne_log_obj(v2, v3);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      int v23 = v4;
      int v8 = "Failed to serialize the cache plist: %@";
      uint64_t v9 = v7;
      uint32_t v10 = 12;
LABEL_22:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
      goto LABEL_19;
    }

    goto LABEL_19;
  }

  id v11 = [v1 writeToFile:@"/Library/Preferences/com.apple.networkextension.uuidcache.plist" atomically:1];
  if ((v11 & 1) == 0)
  {
    uint64_t v20 = ne_log_obj(v11, v12);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      int v8 = "Failed to write the serialized cache to disk";
      uint64_t v9 = v7;
      uint32_t v10 = 2;
      goto LABEL_22;
    }

LABEL_20:
}

NSMutableArray *sub_100022564(void *a1, void *a2)
{
  id v3 = a2;
  id Property = (dispatch_queue_s *)objc_getProperty(a1, v4, 8LL, 1);
  dispatch_assert_queue_V2(Property);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", (void)v17));
        unsigned int v14 = [v13 isReadableFileAtPath:v12];

        if (v14)
        {
          id v15 = +[NEProcessInfo copyUUIDsForExecutable:](&OBJC_CLASS___NEProcessInfo, "copyUUIDsForExecutable:", v12);
          if (v9) {
            -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v15);
          }
          else {
            uint64_t v9 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v15);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

id sub_1000226F4(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id Property = (dispatch_queue_s *)objc_getProperty(a1, v7, 8LL, 1);
  dispatch_assert_queue_V2(Property);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 machOUUIDs]);

  if ((unint64_t)[v9 count] >= 2
    && +[NEProcessInfo is64bitCapable](&OBJC_CLASS___NEProcessInfo, "is64bitCapable"))
  {
    id v10 = [v9 mutableCopy];
    objc_msgSend(v10, "exchangeObjectAtIndex:withObjectAtIndex:", (char *)objc_msgSend(v9, "count") - 1, 0);
    if (!v10)
    {
LABEL_6:
      id v10 = v5;
      goto LABEL_7;
    }
  }

  else
  {
    id v10 = [v9 copy];
    if (!v10) {
      goto LABEL_6;
    }
  }

  if (v5)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 arrayByAddingObjectsFromArray:v10]);

    id v10 = (id)v12;
  }

LABEL_7:
  return v10;
}

uint64_t sub_1000227FC()
{
  uint64_t v0 = ne_copy_uuid_cache();
  id v1 = (void *)v0;
  if (v0) {
    uint64_t v2 = _CFXPCCreateCFObjectFromXPCObject(v0);
  }
  else {
    uint64_t v2 = 0LL;
  }

  return v2;
}

void sub_10002283C(void *a1, const char *a2)
{
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(a1, a2, 8LL, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000228A8;
    block[3] = &unk_100035580;
    void block[4] = a1;
    dispatch_async(Property, block);
  }

void sub_1000228A8(uint64_t a1)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  SEL v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id Property = objc_getProperty(v4, v2, 8LL, 1);
    uint64_t v6 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v6 = 0LL;
    id Property = 0LL;
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100022948;
  v7[3] = &unk_100035610;
  void v7[4] = v6;
  [v3 loadConfigurationsWithCompletionQueue:Property handler:v7];
}

void sub_100022948(uint64_t a1, void *a2)
{
  id v13 = a2;
  if ([v13 count])
  {
    id v3 = [v13 indexOfObjectPassingTest:&stru_1000355E8];
    if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      SEL v4 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v3]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appVPN]);

      if (v5)
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 appVPN]);
        uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 appRules]);
      }

      else
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 pathController]);

        if (!v8)
        {
LABEL_9:

          goto LABEL_10;
        }

        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 pathController]);
        uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 pathRules]);
      }

      uint64_t v9 = (void *)v7;

      if (v9)
      {
        id v10 = *(void **)(a1 + 32);
        uint64_t v11 = NEGetConsoleUserUID();
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        sub_100020D14(v10, v9, v11, v12);
      }

      goto LABEL_9;
    }
  }

LABEL_10:
}

BOOL sub_100022A64(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NEConfiguration);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    unsigned __int8 v7 = [v6 isEqualToString:@"com.apple.commcenter.ne.cellularusage"];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

void sub_100022ADC(id a1)
{
  v43[0] = @"com.apple.datausage.dataaccess.activesync";
  id v33 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"D61963E5-13EC-4EAB-A9EB-E6C9BF4D266B");
  v43[1] = v33;
  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
  v44[0] = v32;
  v42[0] = @"com.apple.datausage.telephony.mms";
  SEL v31 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"569F2700-CAF9-483D-B19D-7AF406DCE15E");
  v42[1] = v31;
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 2LL));
  v44[1] = v30;
  v41[0] = @"com.apple.datausage.atc";
  id v29 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"B3F98213-9C65-405E-BB33-55FA02C7E003");
  v41[1] = v29;
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 2LL));
  v44[2] = v28;
  v40[0] = @"com.apple.datausage.telephony.ims";
  unint64_t v27 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"67A03811-DB0A-594E-C2AE-8B0517EDF26F");
  v40[1] = v27;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 2LL));
  v44[3] = v26;
  v39[0] = @"com.apple.icloud.restore";
  int v25 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"D444877C-8E3A-461F-97E2-17A8C4B9924E");
  v39[1] = v25;
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));
  v44[4] = v24;
  v38[0] = @"com.apple.datausage.airdrop";
  id v1 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"9CE8B501-90E7-456E-952B-4937ED29C7BD");
  v38[1] = v1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
  v44[5] = v2;
  v37[0] = @"com.apple.datausage.dns.multicast";
  id v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"979C0A62-49FE-4739-BDCB-CAC584AC832D");
  v37[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
  v44[6] = v4;
  v36[0] = @"com.apple.datausage.telephony.rcs";
  uint64_t v5 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"CE95569A-401E-4586-ABCF-1231D42E1D3C");
  v36[1] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
  v44[7] = v6;
  v35[0] = @"com.apple.mobileassetd.client.auto-asset-client";
  unsigned __int8 v7 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"5C5BCB61-2C52-4D1F-9C1B-A5049F4998E8");
  v35[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
  v44[8] = v8;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 9LL));
  id v10 = (void *)qword_10003EBD0;
  qword_10003EBD0 = v9;

  uint64_t v11 = (void *)qword_10003EBD8;
  qword_10003EBD8 = (uint64_t)&off_10003B818;

  uint64_t v12 = (void *)qword_10003EBE0;
  qword_10003EBE0 = (uint64_t)&off_10003B840;

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-+"));
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 invertedSet]);
  id v15 = (void *)qword_10003EBE8;
  qword_10003EBE8 = v14;

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"));
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 invertedSet]);
  __int128 v18 = (void *)qword_10003EBF0;
  qword_10003EBF0 = v17;

  __int128 v19 = SCPreferencesCreate( kCFAllocatorDefault,  @"NEHelper control settings",  @"/Library/Preferences/com.apple.networkextension.control.plist");
  if (v19)
  {
    __int128 v20 = v19;
    CFPropertyListRef Value = (const __CFNumber *)SCPreferencesGetValue(v19, @"DisableUUIDDiskCache");
    NEInitCFTypes(Value);
    if (NEIsValidCFType(Value, CFNUMBER_TYPE))
    {
      int valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      byte_10003EC08 = valuePtr != 0;
    }

    CFRelease(v20);
  }

  unsigned __int8 v22 = objc_alloc_init(&OBJC_CLASS___NEHelperCacheManager);
  int v23 = (void *)qword_10003EC00;
  qword_10003EC00 = (uint64_t)v22;
}

void sub_100022F88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(const __SCPreferences **)(v2 + 16);
  }
  else {
    id v3 = 0LL;
  }
  CFPropertyListRef Value = SCPreferencesGetValue(v3, @"services");
  id v13 = (id)objc_claimAutoreleasedReturnValue(Value);
  else {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v6 = v5;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *(void *)(a1 + 40)));

  if (v7)
  {
    -[NSMutableDictionary removeObjectForKey:](v6, "removeObjectForKey:", *(void *)(a1 + 40));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = v8 ? *(const __SCPreferences **)(v8 + 16) : 0LL;
    if (SCPreferencesSetValue(v9, @"services", v6))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        uint64_t v11 = *(const __SCPreferences **)(v10 + 16);
      }
      else {
        uint64_t v11 = 0LL;
      }
      if (SCPreferencesCommitChanges(v11)) {
        sub_1000208CC(*(void **)(a1 + 32), v12);
      }
    }
  }
}

void sub_100023078(uint64_t a1)
{
  char v4 = 0;
  id v2 = sub_10001FA54(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), 0, 0, &v4);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_1000230D4(void *a1, const char *a2)
{
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(a1, a2, 8LL, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100023140;
    block[3] = &unk_100035580;
    void block[4] = a1;
    dispatch_async(Property, block);
  }

void sub_100023140(uint64_t a1, uint64_t a2)
{
}

void sub_100023148(void *a1, const char *a2)
{
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(a1, a2, 8LL, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000231B4;
    block[3] = &unk_100035580;
    void block[4] = a1;
    dispatch_async(Property, block);
  }

void sub_1000231B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 16);
  }
  else {
    uint64_t v3 = 0LL;
  }
  if (SCPreferencesRemoveAllValues(v3))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(const __SCPreferences **)(v5 + 16);
    }
    else {
      uint64_t v6 = 0LL;
    }
    if (SCPreferencesCommitChanges(v6)) {
      sub_1000208CC(*(void **)(a1 + 32), v4);
    }
  }

  sub_100020028(*(void **)(a1 + 32), (uint64_t)v4);
}

void sub_100023220(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(a1, v6, 8LL, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000232DC;
    block[3] = &unk_1000355A8;
    void block[4] = a1;
    id v10 = v5;
    id v11 = v7;
    dispatch_async(Property, block);
  }
}

uint64_t sub_1000232DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

LABEL_8:
  id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = dispatch_queue_create("NEHelperSourceAppInfo", v12);
  uint64_t v14 = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v13;

  if (!value) {
    goto LABEL_12;
  }
LABEL_9:

LABEL_10:
  id v15 = v5;
LABEL_17:

  return v15;
}

void sub_100023C30(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (v3)
  {
    id v5 = [v3 count];
    if (v5)
    {
      uint64_t v7 = ne_log_obj(v5, v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [v4 count];
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)__int128 buf = 134218242;
        id v19 = v14;
        __int16 v20 = 2112;
        uint64_t v21 = v15;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Found %lu UUID(s) by lookup for bundle id: %@",  buf,  0x16u);
      }

      id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject", 0, 0));
      id v11 = v9;
      if (v9) {
        id v9 = [v9 getUUIDBytes:&v17];
      }
      uint64_t v12 = ne_log_obj(v9, v10);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)__int128 buf = 138412546;
        id v19 = v11;
        __int16 v20 = 2112;
        uint64_t v21 = v16;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Found UUID: %@ for bundleID: %@",  buf,  0x16u);
      }
    }
  }

  sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, *(void **)(a1 + 48), 0LL, *(void **)(a1 + 40));
}

uint64_t start()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  if (qword_10003EC20 != -1) {
    dispatch_once(&qword_10003EC20, &stru_100035678);
  }
  id v1 = sub_10000F110((uint64_t)&OBJC_CLASS___NEHelperServer);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
    [v3 postGeneration];

    id Property = (dispatch_queue_s *)objc_getProperty(v2, v4, 24LL, 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000F2C0;
    handler[3] = &unk_1000352F8;
    void handler[4] = v2;
    xpc_set_event_stream_handler("com.apple.fsevents.matching", Property, handler);
    uint64_t v7 = (dispatch_queue_s *)objc_getProperty(v2, v6, 24LL, 1);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000F2D0;
    v17[3] = &unk_1000352F8;
    v17[4] = v2;
    xpc_set_event_stream_handler("com.apple.distnoted.matching", v7, v17);
    id v9 = (dispatch_queue_s *)objc_getProperty(v2, v8, 24LL, 1);
    xpc_set_event_stream_handler("com.apple.ManagedSettings.effective-settings.changed", v9, &stru_100034D70);
    id v11 = (_xpc_connection_s *)objc_getProperty(v2, v10, 32LL, 1);
    xpc_connection_resume(v11);
    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = dispatch_queue_create("check launch services", v13);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000F2E0;
    block[3] = &unk_100035580;
    void block[4] = v2;
    dispatch_async(v14, block);
  }

  objc_autoreleasePoolPop(v0);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v15 run];

  return 0LL;
}

void sub_100023FC0(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v3 = dispatch_queue_create("nw_privileged_queue", v2);
  SEL v4 = (void *)qword_10003EC28;
  qword_10003EC28 = (uint64_t)v3;

  NWPrivilegedHelperStart(qword_10003EC28);
}

id objc_msgSend_initAndShowAddConfigurationsForApp_warningHeader_warning_callbackQueue_callbackHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initAndShowAddConfigurationsForApp:warningHeader:warning:callbackQueue:callbackHandler:");
}

id objc_msgSend_promptForLocalAuthenticationWithReason_completionQueue_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptForLocalAuthenticationWithReason:completionQueue:completionHandler:");
}

id objc_msgSend_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:completionHandler:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}