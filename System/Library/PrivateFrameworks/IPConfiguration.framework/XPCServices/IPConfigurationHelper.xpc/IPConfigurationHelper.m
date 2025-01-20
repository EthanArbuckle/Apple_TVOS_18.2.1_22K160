void sub_10000315C(uint64_t a1)
{
  void block[5];
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_1000031C8;
  block[3] = &unk_10000C388;
  block[4] = a1;
  if (qword_100010C28 != -1) {
    dispatch_once(&qword_100010C28, block);
  }
}

uint64_t sub_1000031C8(uint64_t a1)
{
  os_log_t v1 = os_log_create("com.apple.IPConfiguration", *(const char **)(a1 + 32));
  return sub_100009A0C((uint64_t)v1);
}
}

void sub_100003BD8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = sub_100009A18();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v11, v12))
    {
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      unsigned int v13 = (_sc_log > 0) | 2;
      uint64_t v14 = os_log_type_enabled(v11, (os_log_type_t)v12) ? v13 : 2LL;
      int v75 = 138412290;
      uint64_t v76 = (uint64_t)v9;
      v15 = (__int128 *)_os_log_send_and_compose_impl( v14,  0LL,  &v79,  256LL,  &_mh_execute_header,  v11,  v12,  "failed NSURLSessionDataTask with error '%@'",  &v75,  12);
      __SC_log_send2(3LL, v11, v12, 0LL, v15);
      if (v15 != &v79) {
        free(v15);
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    if ([v16 isEqualToString:kCFErrorDomainCFNetwork])
    {
      id v17 = [v9 code];

      if (v17 == (id)-1009LL)
      {
        uint64_t v18 = sub_100009A18();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        uint64_t v20 = _SC_syslog_os_log_mapping(5LL);
        if (__SC_log_enabled(5LL, v19, v20))
        {
          __int128 v93 = 0u;
          __int128 v94 = 0u;
          __int128 v91 = 0u;
          __int128 v92 = 0u;
          __int128 v89 = 0u;
          __int128 v90 = 0u;
          __int128 v87 = 0u;
          __int128 v88 = 0u;
          __int128 v85 = 0u;
          __int128 v86 = 0u;
          __int128 v83 = 0u;
          __int128 v84 = 0u;
          __int128 v81 = 0u;
          __int128 v82 = 0u;
          __int128 v79 = 0u;
          __int128 v80 = 0u;
          unsigned int v21 = (_sc_log > 0) | 2;
          uint64_t v22 = os_log_type_enabled(v19, (os_log_type_t)v20) ? v21 : 2LL;
          LOWORD(v75) = 0;
          v23 = (__int128 *)_os_log_send_and_compose_impl( v22,  0LL,  &v79,  256LL,  &_mh_execute_header,  v19,  v20,  "no internet connection currently",  &v75,  2);
          __SC_log_send2(5LL, v19, v20, 0LL, v23);
          if (v23 != &v79) {
            free(v23);
          }
        }

        goto LABEL_38;
      }

LABEL_37:
      [*(id *)(a1 + 32) setValidFetch:0];
LABEL_38:
      id v24 = 0LL;
LABEL_39:
      id v27 = 0LL;
      id v29 = 0LL;
      v26 = 0LL;
      goto LABEL_40;
    }

LABEL_36:
    goto LABEL_37;
  }

  if (!v8)
  {
    uint64_t v36 = sub_100009A18();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v36);
    uint64_t v37 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v16, v37))
    {
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      unsigned int v38 = (_sc_log > 0) | 2;
      uint64_t v39 = os_log_type_enabled((os_log_t)v16, (os_log_type_t)v37) ? v38 : 2LL;
      LOWORD(v75) = 0;
      v40 = (__int128 *)_os_log_send_and_compose_impl( v39,  0LL,  &v79,  256LL,  &_mh_execute_header,  v16,  v37,  "got NULL NSURLResponse",  &v75,  2);
      __SC_log_send2(3LL, v16, v37, 0LL, v40);
      if (v40 != &v79) {
        free(v40);
      }
    }

    goto LABEL_36;
  }

  id v24 = v8;
  v25 = (char *)[v24 statusCode];
  if ((unint64_t)(v25 - 200) >= 0xC8)
  {
    uint64_t v43 = (uint64_t)v25;
    uint64_t v44 = sub_100009A18();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    uint64_t v46 = _SC_syslog_os_log_mapping(3LL);
    int v47 = __SC_log_enabled(3LL, v45, v46);
    if (v43 >= 400)
    {
      if (!v47) {
        goto LABEL_64;
      }
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      int v48 = (_sc_log > 0) | 2;
      int v49 = os_log_type_enabled(v45, (os_log_type_t)v46) ? v48 : 2;
      unsigned int v73 = v49;
      v50 = v45;
      v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v43));
      int v75 = 134218242;
      uint64_t v76 = v43;
      __int16 v77 = 2112;
      v78 = v51;
      v52 = (__int128 *)_os_log_send_and_compose_impl( v73,  0LL,  &v79,  256LL,  &_mh_execute_header,  v50,  v46,  "encountered HTTP error '%ld' (%@)",  &v75,  22);

      __SC_log_send2(3LL, v50, v46, 0LL, v52);
      if (v52 == &v79) {
        goto LABEL_64;
      }
      goto LABEL_63;
    }

    if (!v47)
    {
LABEL_64:

      [*(id *)(a1 + 32) setValidFetch:0];
      goto LABEL_39;
    }

    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    unsigned int v53 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v45, (os_log_type_t)v46)) {
      uint64_t v54 = v53;
    }
    else {
      uint64_t v54 = 2LL;
    }
    int v75 = 134217984;
    uint64_t v76 = v43;
    uint64_t v55 = _os_log_send_and_compose_impl( v54,  0LL,  &v79,  256LL,  &_mh_execute_header,  v45,  v46,  "unrecognized HTTP status code '%ld'",  &v75,  12);
LABEL_62:
    v52 = (__int128 *)v55;
    __SC_log_send2(3LL, v45, v46, 0LL, v55);
    if (v52 != &v79)
    {
LABEL_63:
      free(v52);
      goto LABEL_64;
    }

    goto LABEL_64;
  }

  if (!v7)
  {
    uint64_t v56 = sub_100009A18();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    uint64_t v46 = _SC_syslog_os_log_mapping(3LL);
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    unsigned int v57 = (_sc_log > 0) | 2;
    BOOL v58 = os_log_type_enabled(v45, (os_log_type_t)v46);
    uint64_t v59 = *(void *)(a1 + 40);
    if (v58) {
      uint64_t v60 = v57;
    }
    else {
      uint64_t v60 = 2LL;
    }
    int v75 = 138412290;
    uint64_t v76 = v59;
    uint64_t v55 = _os_log_send_and_compose_impl( v60,  0LL,  &v79,  256LL,  &_mh_execute_header,  v45,  v46,  "retrieved NULL data from URL '%@'",  &v75,  12);
    goto LABEL_62;
  }

  id v74 = 0LL;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  16LL,  &v74));
  id v27 = v74;
  if (v27 || !v26)
  {
    uint64_t v61 = sub_100009A18();
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    uint64_t v63 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v62, v63))
    {
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      unsigned int v64 = (_sc_log > 0) | 2;
      uint64_t v65 = os_log_type_enabled(v62, (os_log_type_t)v63) ? v64 : 2LL;
      int v75 = 138412290;
      uint64_t v76 = (uint64_t)v27;
      v66 = (__int128 *)_os_log_send_and_compose_impl( v65,  0LL,  &v79,  256LL,  &_mh_execute_header,  v62,  v63,  "failed JSON parsing with error '%@'",  &v75,  12);
      __SC_log_send2(3LL, v62, v63, 0LL, v66);
      if (v66 != &v79) {
        free(v66);
      }
    }

    [*(id *)(a1 + 32) setValidFetch:0];
    goto LABEL_79;
  }

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v26, v28) & 1) == 0)
  {
    uint64_t v67 = sub_100009A18();
    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    uint64_t v69 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v68, v69))
    {
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      unsigned int v70 = (_sc_log > 0) | 2;
      uint64_t v71 = os_log_type_enabled(v68, (os_log_type_t)v69) ? v70 : 2LL;
      LOWORD(v75) = 0;
      v72 = (__int128 *)_os_log_send_and_compose_impl( v71,  0LL,  &v79,  256LL,  &_mh_execute_header,  v68,  v69,  "parsed JSON object isn't a well-formed NSDictionary",  &v75,  2);
      __SC_log_send2(3LL, v68, v69, 0LL, v72);
      if (v72 != &v79) {
        free(v72);
      }
    }

    [*(id *)(a1 + 32) setValidFetch:0];
    id v27 = 0LL;
LABEL_79:
    id v29 = 0LL;
    goto LABEL_40;
  }

  id v29 = v26;
  uint64_t v30 = sub_100009A18();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  uint64_t v32 = _SC_syslog_os_log_mapping(6LL);
  if (__SC_log_enabled(6LL, v31, v32))
  {
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    unsigned int v33 = (_sc_log > 0) | 2;
    uint64_t v34 = os_log_type_enabled(v31, (os_log_type_t)v32) ? v33 : 2LL;
    int v75 = 138412290;
    uint64_t v76 = (uint64_t)v29;
    v35 = (__int128 *)_os_log_send_and_compose_impl( v34,  0LL,  &v79,  256LL,  &_mh_execute_header,  v31,  v32,  "fetched PvD Additional Info JSON object:\n'%@'",  &v75,  12);
    __SC_log_send2(6LL, v31, v32, 0LL, v35);
    if (v35 != &v79) {
      free(v35);
    }
  }

  id v27 = 0LL;
  v26 = v29;
LABEL_40:
  unsigned int v41 = [*(id *)(a1 + 32) validFetch];
  v42 = *(void **)(a1 + 32);
  if (v41 && v29) {
    [v42 scheduleParsingEventCompleteWithParsedJSON:v29 pvdID:*(void *)(a1 + 48) ipv6Prefixes:*(void *)(a1 + 56)];
  }
  else {
    [v42 scheduleParsingEventAbort];
  }
}

void sub_100004720(uint64_t a1)
{
  uint64_t v22 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) urlSession]);

  if (v2)
  {
    uint64_t v3 = sub_100009A18();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = _SC_syslog_os_log_mapping(7LL);
    if (__SC_log_enabled(7LL, v4, v5))
    {
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      unsigned int v6 = (_sc_log > 0) | 2;
      uint64_t v7 = os_log_type_enabled(v4, (os_log_type_t)v5) ? v6 : 2LL;
      __int16 v21 = 0;
      id v8 = (__int128 *)_os_log_send_and_compose_impl( v7,  0LL,  &v23,  256LL,  &_mh_execute_header,  v4,  v5,  "url fetch completed successfully",  &v21,  2);
      __SC_log_send2(7LL, v4, v5, 0LL, v8);
      if (v8 != &v23) {
        free(v8);
      }
    }

    Mutable = CFDictionaryCreateMutable(0LL, 2LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v10 = [*(id *)(a1 + 32) createValidPvDAdditionalInfoDict:*(void *)(a1 + 40) withID:*(void *)(a1 + 48) andPrefixes:*(void *)(a1 + 56)];
    uint64_t v22 = v10;
    if (!v10) {
      [*(id *)(a1 + 32) setValidFetch:0];
    }
    unsigned int v11 = [*(id *)(a1 + 32) validFetch];
    uint64_t v12 = (const void **)&kCFBooleanTrue;
    if (!v11) {
      uint64_t v12 = (const void **)&kCFBooleanFalse;
    }
    CFDictionarySetValue(Mutable, @"valid_fetch", *v12);
    if ([*(id *)(a1 + 32) validFetch] && v10)
    {
      uint64_t v13 = sub_100009A18();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = _SC_syslog_os_log_mapping(7LL);
      if (__SC_log_enabled(7LL, v14, v15))
      {
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        unsigned int v16 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v14, (os_log_type_t)v15)) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 2LL;
        }
        __int16 v21 = 0;
        uint64_t v18 = (__int128 *)_os_log_send_and_compose_impl( v17,  0LL,  &v23,  256LL,  &_mh_execute_header,  v14,  v15,  "fetched pvd info was validated",  &v21,  2);
        __SC_log_send2(7LL, v14, v15, 0LL, v18);
        if (v18 != &v23) {
          free(v18);
        }
      }

      CFDictionarySetValue(Mutable, @"additional_information", v10);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) urlSession]);
    [v19 finishTasksAndInvalidate];

    [*(id *)(a1 + 32) setUrlSession:0];
    uint64_t v20 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) xpcClientCompletionHandler]);
    ((void (**)(void, __CFDictionary *))v20)[2](v20, Mutable);
  }

  sub_100008E10(&v22);
}

void sub_100004AC0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) urlSession]);

  if (v2)
  {
    uint64_t v3 = sub_100009A18();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v4, v5))
    {
      memset(v15, 0, sizeof(v15));
      unsigned int v6 = (_sc_log > 0) | 2;
      uint64_t v7 = os_log_type_enabled(v4, (os_log_type_t)v5) ? v6 : 2LL;
      v14[0] = 0;
      id v8 = (_OWORD *)_os_log_send_and_compose_impl( v7,  0LL,  v15,  256LL,  &_mh_execute_header,  v4,  v5,  "aborting parsing event due to a failed url fetch",  v14,  2);
      __SC_log_send2(5LL, v4, v5, 0LL, v8);
      if (v8 != v15) {
        free(v8);
      }
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) urlSession]);
    [v9 invalidateAndCancel];

    [*(id *)(a1 + 32) setUrlSession:0];
    Mutable = CFDictionaryCreateMutable(0LL, 1LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    unsigned int v11 = [*(id *)(a1 + 32) validFetch];
    uint64_t v12 = (const void **)&kCFBooleanTrue;
    if (!v11) {
      uint64_t v12 = (const void **)&kCFBooleanFalse;
    }
    CFDictionarySetValue(Mutable, @"valid_fetch", *v12);
    uint64_t v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) xpcClientCompletionHandler]);
    ((void (**)(void, __CFDictionary *))v13)[2](v13, Mutable);
  }

LABEL_210:
    theDict = 0LL;
    goto LABEL_211;
  }

  Mutable = CFDictionaryCreateMutable(0LL, 3LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    v174 = sub_100009A18();
    v169 = (os_log_s *)objc_claimAutoreleasedReturnValue(v174);
    v170 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v169, v170))
    {
      v243 = 0u;
      v244 = 0u;
      v241 = 0u;
      v242 = 0u;
      v239 = 0u;
      v240 = 0u;
      v237 = 0u;
      v238 = 0u;
      v235 = 0u;
      v236 = 0u;
      v233 = 0u;
      v234 = 0u;
      v231 = 0u;
      v232 = 0u;
      v229 = 0u;
      v230 = 0u;
      v175 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v169, (os_log_type_t)v170)) {
        v176 = v175;
      }
      else {
        v176 = 2LL;
      }
      LOWORD(v220) = 0;
      v173 = _os_log_send_and_compose_impl( v176,  0LL,  &v229,  256LL,  &_mh_execute_header,  v169,  v170,  "failed to create additional info CFDictionary",  &v220,  2);
      goto LABEL_208;
    }

    goto LABEL_210;
  }

  uint64_t v12 = Mutable;
  sub_10000676C(Mutable, v8, v9, v10);
  v198 = v8;
  v213 = 0LL;
  v208 = 0LL;
  v215 = 0u;
  v216 = 0u;
  v217 = 0u;
  v218 = 0u;
  uint64_t v13 = [&off_10000C760 countByEnumeratingWithState:&v215 objects:&v220 count:16];
  v188 = v8;
  theDict = v12;
  v186 = v10;
  v187 = v9;
  v185 = self;
  if (!v13) {
    goto LABEL_114;
  }
  uint64_t v14 = v13;
  value = 0LL;
  uint64_t v15 = 0LL;
  unsigned int v16 = *(void *)v216;
  uint64_t v17 = v198;
  v200 = *(void *)v216;
  do
  {
    uint64_t v18 = 0LL;
    v202 = v14;
    do
    {
      if (*(void *)v216 != v16) {
        objc_enumerationMutation(&off_10000C760);
      }
      v19 = *(void **)(*((void *)&v215 + 1) + 8LL * (void)v18);
      uint64_t v20 = objc_autoreleasePoolPush();
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v17 valueForKey:v19]);
      if (v21)
      {
        else {
          uint64_t v22 = 0;
        }
        if (v22)
        {
          __int128 v38 = v19;
          uint64_t v39 = v21;
          *(void *)&v209 = 0LL;
          v206 = v20;
          else {
            v40 = (uint64_t)[v39 count];
          }
          unsigned int v41 = sub_100009A18();
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          uint64_t v43 = _SC_syslog_os_log_mapping(7LL);
          if (__SC_log_enabled(7LL, v42, v43))
          {
            v243 = 0u;
            v244 = 0u;
            v241 = 0u;
            v242 = 0u;
            v239 = 0u;
            v240 = 0u;
            v237 = 0u;
            v238 = 0u;
            v235 = 0u;
            v236 = 0u;
            v233 = 0u;
            v234 = 0u;
            v231 = 0u;
            v232 = 0u;
            LODWORD(v44) = (_sc_log > 0) | 2;
            v229 = 0u;
            v230 = 0u;
            uint64_t v44 = os_log_type_enabled(v42, (os_log_type_t)v43) ? v44 : 2LL;
            v45 = v42;
            uint64_t v46 = (void *)objc_opt_class(v39);
            LODWORD(v226[0]) = 138412802;
            *(void *)((char *)v226 + 4) = v38;
            WORD2(v226[1]) = 2112;
            *(void *)((char *)&v226[1] + 6) = v39;
            HIWORD(v226[2]) = 2112;
            v226[3] = v46;
            int v47 = v46;
            int v48 = (__int128 *)_os_log_send_and_compose_impl( v44,  0LL,  &v229,  256LL,  &_mh_execute_header,  v45,  v43,  "validating field '%@' with value '%@' of class '%@'",  v226,  32);

            __SC_log_send2(7LL, v45, v43, 0LL, v48);
            if (v48 != &v229) {
              free(v48);
            }
          }

          int v49 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v39, v49) & 1) != 0)
          {
            v50 = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
            *(void *)&v209 = v50;
            if (v40)
            {
              v51 = 0LL;
              while (1)
              {
                v52 = objc_autoreleasePoolPush();
                *(void *)v219 = 0LL;
                v214 = 0LL;
                unsigned int v53 = (__CFString *)objc_claimAutoreleasedReturnValue([v39 objectAtIndex:v51]);
                uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSString);
                if ((objc_opt_isKindOfClass(v53, v54) & 1) == 0)
                {
                  __int128 v82 = sub_100009A18();
                  __int128 v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
                  __int128 v84 = _SC_syslog_os_log_mapping(7LL);
                  v243 = 0u;
                  v244 = 0u;
                  v241 = 0u;
                  v242 = 0u;
                  v239 = 0u;
                  v240 = 0u;
                  v237 = 0u;
                  v238 = 0u;
                  v235 = 0u;
                  v236 = 0u;
                  v233 = 0u;
                  v234 = 0u;
                  v231 = 0u;
                  v232 = 0u;
                  __int128 v85 = (_sc_log > 0) | 2;
                  v229 = 0u;
                  v230 = 0u;
                  if (os_log_type_enabled(v83, (os_log_type_t)v84)) {
                    __int128 v86 = v85;
                  }
                  else {
                    __int128 v86 = 2LL;
                  }
                  LOWORD(v226[0]) = 0;
                  __int128 v87 = _os_log_send_and_compose_impl( v86,  0LL,  &v229,  256LL,  &_mh_execute_header,  v83,  v84,  "expected JSON value of String type",  v226,  2);
                  goto LABEL_84;
                }

                *(void *)v219 = sub_100009764(v53);
                if (!*(void *)v219) {
                  break;
                }
                sub_100008E10((const void **)v219);
                Copy = CFStringCreateCopy(0LL, v53);
                v214 = (void *)Copy;
                if (!Copy) {
                  goto LABEL_87;
                }
                CFArrayAppendValue(v50, Copy);
                sub_100008E10((const void **)&v214);

                objc_autoreleasePoolPop(v52);
                if (v40 == ++v51) {
                  goto LABEL_45;
                }
              }

              __int128 v88 = sub_100009A18();
              __int128 v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
              __int128 v84 = _SC_syslog_os_log_mapping(7LL);
              v243 = 0u;
              v244 = 0u;
              v241 = 0u;
              v242 = 0u;
              v239 = 0u;
              v240 = 0u;
              v237 = 0u;
              v238 = 0u;
              v235 = 0u;
              v236 = 0u;
              v233 = 0u;
              v234 = 0u;
              v231 = 0u;
              v232 = 0u;
              v195 = (_sc_log > 0) | 2;
              v229 = 0u;
              v230 = 0u;
              if (os_log_type_enabled(v83, (os_log_type_t)v84)) {
                __int128 v89 = v195;
              }
              else {
                __int128 v89 = 2LL;
              }
              LODWORD(v226[0]) = 138412290;
              *(void *)((char *)v226 + 4) = v53;
              __int128 v87 = _os_log_send_and_compose_impl( v89,  0LL,  &v229,  256LL,  &_mh_execute_header,  v83,  v84,  "couldn't validate DNS Zone '%@' as an FQDN",  v226,  12);
LABEL_84:
              __int128 v90 = (__int128 *)v87;
              __SC_log_send2(7LL, v83, v84, 0LL, v87);
              if (v90 != &v229) {
                free(v90);
              }
LABEL_86:

LABEL_87:
              objc_autoreleasePoolPop(v52);
              uint64_t v15 = 0LL;
              v62 = 0;
              uint64_t v20 = v206;
            }

            else
            {
LABEL_45:
              v213 = v50;
              uint64_t v56 = sub_100009A18();
              unsigned int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
              BOOL v58 = _SC_syslog_os_log_mapping(7LL);
              uint64_t v20 = v206;
              if (__SC_log_enabled(7LL, v57, v58))
              {
                v243 = 0u;
                v244 = 0u;
                v241 = 0u;
                v242 = 0u;
                v239 = 0u;
                v240 = 0u;
                v237 = 0u;
                v238 = 0u;
                v235 = 0u;
                v236 = 0u;
                v233 = 0u;
                v234 = 0u;
                v231 = 0u;
                v232 = 0u;
                uint64_t v59 = (_sc_log > 0) | 2;
                v229 = 0u;
                v230 = 0u;
                uint64_t v60 = os_log_type_enabled(v57, (os_log_type_t)v58) ? v59 : 2LL;
                LODWORD(v226[0]) = 138412290;
                *(void *)((char *)v226 + 4) = v50;
                uint64_t v61 = (__int128 *)_os_log_send_and_compose_impl( v60,  0LL,  &v229,  256LL,  &_mh_execute_header,  v57,  v58,  "successfully validated DNS Zones array %@",  v226,  12);
                __SC_log_send2(7LL, v57, v58, 0LL, v61);
                if (v61 != &v229) {
                  free(v61);
                }
              }

              v62 = 1;
              value = v50;
              uint64_t v15 = v50;
            }
          }

          else
          {
            uint64_t v63 = sub_100009A18();
            unsigned int v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
            uint64_t v65 = _SC_syslog_os_log_mapping(7LL);
            uint64_t v20 = v206;
            if (__SC_log_enabled(7LL, v64, v65))
            {
              v243 = 0u;
              v244 = 0u;
              v241 = 0u;
              v242 = 0u;
              v239 = 0u;
              v240 = 0u;
              v237 = 0u;
              v238 = 0u;
              v235 = 0u;
              v236 = 0u;
              v233 = 0u;
              v234 = 0u;
              v231 = 0u;
              v232 = 0u;
              v66 = (_sc_log > 0) | 2;
              v229 = 0u;
              v230 = 0u;
              uint64_t v67 = os_log_type_enabled(v64, (os_log_type_t)v65) ? v66 : 2LL;
              LOWORD(v226[0]) = 0;
              v68 = (__int128 *)_os_log_send_and_compose_impl( v67,  0LL,  &v229,  256LL,  &_mh_execute_header,  v64,  v65,  "expected JSON value of Array type",  v226,  2);
              __SC_log_send2(7LL, v64, v65, 0LL, v68);
              if (v68 != &v229) {
                free(v68);
              }
            }

            uint64_t v15 = 0LL;
            v50 = 0LL;
            v62 = 0;
          }

          __int128 v91 = sub_100009A18();
          __int128 v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
          __int128 v93 = _SC_syslog_os_log_mapping(7LL);
          if (__SC_log_enabled(7LL, v92, v93))
          {
            v196 = v50;
            __int128 v94 = v21;
            v95 = v15;
            v243 = 0u;
            v244 = 0u;
            v241 = 0u;
            v242 = 0u;
            v239 = 0u;
            v240 = 0u;
            v237 = 0u;
            v238 = 0u;
            v235 = 0u;
            v236 = 0u;
            v233 = 0u;
            v234 = 0u;
            v231 = 0u;
            v232 = 0u;
            v96 = (_sc_log > 0) | 2;
            v229 = 0u;
            v230 = 0u;
            if (os_log_type_enabled(v92, (os_log_type_t)v93)) {
              v97 = v96;
            }
            else {
              v97 = 2LL;
            }
            LODWORD(v226[0]) = 138412290;
            *(void *)((char *)v226 + 4) = v38;
            v98 = (__int128 *)_os_log_send_and_compose_impl( v97,  0LL,  &v229,  256LL,  &_mh_execute_header,  v92,  v93,  "failed to validate field '%@'",  v226,  12);
            __SC_log_send2(7LL, v92, v93, 0LL, v98);
            if (v98 != &v229) {
              free(v98);
            }
            uint64_t v20 = v206;
            uint64_t v15 = v95;
            __int16 v21 = v94;
            v50 = v196;
          }

          if (!v50) {
            sub_100008E10((const void **)&v209);
          }

          if ((v62 & 1) != 0)
          {
            uint64_t v17 = v198;
            unsigned int v16 = v200;
            uint64_t v14 = v202;
            goto LABEL_110;
          }

          v99 = sub_100009A18();
          __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
          v100 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v24, v100))
          {
            v205 = v15;
            v243 = 0u;
            v244 = 0u;
            v241 = 0u;
            v242 = 0u;
            v239 = 0u;
            v240 = 0u;
            v237 = 0u;
            v238 = 0u;
            v235 = 0u;
            v236 = 0u;
            v233 = 0u;
            v234 = 0u;
            v231 = 0u;
            v232 = 0u;
            v101 = (_sc_log > 0) | 2;
            v229 = 0u;
            v230 = 0u;
            v102 = os_log_type_enabled(v24, (os_log_type_t)v100);
            LODWORD(v226[0]) = 138412546;
            if (v102) {
              v103 = v101;
            }
            else {
              v103 = 2LL;
            }
            *(void *)((char *)v226 + 4) = v38;
            WORD2(v226[1]) = 2112;
            *(void *)((char *)&v226[1] + 6) = v39;
            v104 = (__int128 *)_os_log_send_and_compose_impl( v103,  0LL,  &v229,  256LL,  &_mh_execute_header,  v24,  v100,  "failed to validate field '%@' : %@",  v226,  22);
            __SC_log_send2(5LL, v24, v100, 0LL, v104);
            if (v104 != &v229) {
              free(v104);
            }
            uint64_t v17 = v198;
LABEL_106:
            unsigned int v16 = v200;
            uint64_t v14 = v202;
            uint64_t v15 = v205;
LABEL_109:

            goto LABEL_110;
          }

          uint64_t v17 = v198;
LABEL_108:
          unsigned int v16 = v200;
          uint64_t v14 = v202;
          goto LABEL_109;
        }

        else {
          __int128 v23 = 0;
        }
        if (v23)
        {
          __int128 v24 = v19;
          __int128 v25 = v21;
          __int128 v26 = sub_100009A18();
          __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          __int128 v28 = _SC_syslog_os_log_mapping(7LL);
          v205 = v15;
          if (__SC_log_enabled(7LL, v27, v28))
          {
            v243 = 0u;
            v244 = 0u;
            v241 = 0u;
            v242 = 0u;
            v239 = 0u;
            v240 = 0u;
            v237 = 0u;
            v238 = 0u;
            v235 = 0u;
            v236 = 0u;
            v233 = 0u;
            v234 = 0u;
            v231 = 0u;
            v232 = 0u;
            LODWORD(v29) = (_sc_log > 0) | 2;
            v229 = 0u;
            v230 = 0u;
            if (os_log_type_enabled(v27, (os_log_type_t)v28)) {
              __int128 v29 = v29;
            }
            else {
              __int128 v29 = 2LL;
            }
            __int128 v30 = v27;
            __int128 v31 = (void *)objc_opt_class(v25);
            LODWORD(v226[0]) = 138412802;
            *(void *)((char *)v226 + 4) = v24;
            WORD2(v226[1]) = 2112;
            *(void *)((char *)&v226[1] + 6) = v25;
            HIWORD(v226[2]) = 2112;
            v226[3] = v31;
            __int128 v32 = v31;
            __int128 v33 = (__int128 *)_os_log_send_and_compose_impl( v29,  0LL,  &v229,  256LL,  &_mh_execute_header,  v30,  v28,  "validating field '%@' with value '%@' of class '%@'",  v226,  32);

            __SC_log_send2(7LL, v30, v28, 0LL, v33);
            if (v33 != &v229) {
              free(v33);
            }
            uint64_t v17 = v198;
            uint64_t v15 = v205;
          }

          __int128 v34 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v25, v34) & 1) != 0)
          {
            __int128 v35 = [v25 isEqualToString:@"true"];
            __int128 v36 = (void **)&kCFBooleanTrue;
            if ((v35 & 1) != 0
              || (__int128 v37 = [v25 isEqualToString:@"false"],
                  __int128 v36 = (void **)&kCFBooleanFalse,
                  v37))
            {
              v208 = *v36;

              goto LABEL_108;
            }
          }

          else
          {
            uint64_t v69 = sub_100009A18();
            unsigned int v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
            uint64_t v71 = _SC_syslog_os_log_mapping(7LL);
            if (__SC_log_enabled(7LL, v70, v71))
            {
              v243 = 0u;
              v244 = 0u;
              v241 = 0u;
              v242 = 0u;
              v239 = 0u;
              v240 = 0u;
              v237 = 0u;
              v238 = 0u;
              v235 = 0u;
              v236 = 0u;
              v233 = 0u;
              v234 = 0u;
              v231 = 0u;
              v232 = 0u;
              v72 = (_sc_log > 0) | 2;
              v229 = 0u;
              v230 = 0u;
              unsigned int v73 = os_log_type_enabled(v70, (os_log_type_t)v71) ? v72 : 2LL;
              LOWORD(v226[0]) = 0;
              id v74 = (__int128 *)_os_log_send_and_compose_impl( v73,  0LL,  &v229,  256LL,  &_mh_execute_header,  v70,  v71,  "expected JSON value of String type",  v226,  2);
              __SC_log_send2(7LL, v70, v71, 0LL, v74);
              if (v74 != &v229) {
                free(v74);
              }
            }
          }

          int v75 = sub_100009A18();
          uint64_t v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
          __int16 v77 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v76, v77))
          {
            v243 = 0u;
            v244 = 0u;
            v241 = 0u;
            v242 = 0u;
            v239 = 0u;
            v240 = 0u;
            v237 = 0u;
            v238 = 0u;
            v235 = 0u;
            v236 = 0u;
            v233 = 0u;
            v234 = 0u;
            v231 = 0u;
            v232 = 0u;
            v78 = (_sc_log > 0) | 2;
            v229 = 0u;
            v230 = 0u;
            __int128 v79 = os_log_type_enabled(v76, (os_log_type_t)v77);
            LODWORD(v226[0]) = 138412546;
            if (v79) {
              __int128 v80 = v78;
            }
            else {
              __int128 v80 = 2LL;
            }
            *(void *)((char *)v226 + 4) = v24;
            WORD2(v226[1]) = 2112;
            *(void *)((char *)&v226[1] + 6) = v25;
            __int128 v81 = (__int128 *)_os_log_send_and_compose_impl( v80,  0LL,  &v229,  256LL,  &_mh_execute_header,  v76,  v77,  "failed to validate field '%@' : %@",  v226,  22);
            __SC_log_send2(5LL, v76, v77, 0LL, v81);
            if (v81 != &v229) {
              free(v81);
            }
            __int128 v24 = v76;
            goto LABEL_106;
          }

          __int128 v24 = v76;
          goto LABEL_108;
        }
      }

LABEL_110:
      objc_autoreleasePoolPop(v20);
      uint64_t v18 = (char *)v18 + 1;
    }

    while (v18 != v14);
    uint64_t v14 = [&off_10000C760 countByEnumeratingWithState:&v215 objects:&v220 count:16];
  }

  while (v14);
  id v9 = v187;
  id v8 = v188;
  self = v185;
  id v10 = v186;
  uint64_t v12 = theDict;
  if (value)
  {
    CFDictionarySetValue(theDict, @"dnsZones", value);
    sub_100008E10((const void **)&v213);
  }

LABEL_114:
  if (v208)
  {
    CFDictionarySetValue(v12, @"noInternet", v208);
    sub_100008E10((const void **)&v208);
  }

  v105 = v198;
  v213 = 0LL;
  v209 = 0u;
  v210 = 0u;
  v211 = 0u;
  v212 = 0u;
  v106 = [&off_10000C778 countByEnumeratingWithState:&v209 objects:&v215 count:16];
  if (v106)
  {
    v107 = v106;
    v108 = 0LL;
    v109 = 0LL;
    v110 = *(void *)v210;
    v111 = &CFAbsoluteTimeGetCurrent_ptr;
    valuea = v105;
    v192 = *(void *)v210;
    while (1)
    {
      v112 = 0LL;
      v193 = v107;
      do
      {
        if (*(void *)v210 != v110) {
          objc_enumerationMutation(&off_10000C778);
        }
        v113 = *(void **)(*((void *)&v209 + 1) + 8LL * (void)v112);
        v114 = objc_autoreleasePoolPush();
        v115 = (void *)objc_claimAutoreleasedReturnValue([v105 valueForKey:v113]);
        if (!v115) {
          goto LABEL_181;
        }
        v199 = v113;
        v117 = v115;
        v214 = 0LL;
        v197 = v108;
        else {
          v207 = (uint64_t)[(id)v117 count];
        }
        v118 = sub_100009A18();
        v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
        v120 = _SC_syslog_os_log_mapping(7LL);
        v201 = v115;
        v203 = v117;
        if (__SC_log_enabled(7LL, v119, v120))
        {
          v243 = 0u;
          v244 = 0u;
          v241 = 0u;
          v242 = 0u;
          v239 = 0u;
          v240 = 0u;
          v237 = 0u;
          v238 = 0u;
          v235 = 0u;
          v236 = 0u;
          v233 = 0u;
          v234 = 0u;
          v231 = 0u;
          v232 = 0u;
          v121 = v117;
          LODWORD(v117) = (_sc_log > 0) | 2;
          v229 = 0u;
          v230 = 0u;
          if (os_log_type_enabled(v119, (os_log_type_t)v120)) {
            v117 = v117;
          }
          else {
            v117 = 2LL;
          }
          v122 = v119;
          v123 = (void *)objc_opt_class(v121);
          v220 = 138412802;
          v221 = v199;
          v222 = 2112;
          v223 = v121;
          v224 = 2112;
          v225 = v123;
          v124 = v123;
          v125 = (__int128 *)_os_log_send_and_compose_impl( v117,  0LL,  &v229,  256LL,  &_mh_execute_header,  v122,  v120,  "validating field '%@' with value '%@' of class '%@'",  &v220,  32);

          __SC_log_send2(7LL, v122, v120, 0LL, v125);
          if (v125 != &v229) {
            free(v125);
          }
          v105 = valuea;
          v115 = v201;
          v117 = v203;
        }

        v126 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v117, v126) & 1) == 0)
        {
          v147 = sub_100009A18();
          v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
          v149 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v148, v149))
          {
            v243 = 0u;
            v244 = 0u;
            v241 = 0u;
            v242 = 0u;
            v239 = 0u;
            v240 = 0u;
            v237 = 0u;
            v238 = 0u;
            v235 = 0u;
            v236 = 0u;
            v233 = 0u;
            v234 = 0u;
            v231 = 0u;
            v232 = 0u;
            v150 = (_sc_log > 0) | 2;
            v229 = 0u;
            v230 = 0u;
            v151 = os_log_type_enabled(v148, (os_log_type_t)v149) ? v150 : 2LL;
            LOWORD(v220) = 0;
            v152 = (__int128 *)_os_log_send_and_compose_impl( v151,  0LL,  &v229,  256LL,  &_mh_execute_header,  v148,  v149,  "expected JSON value of Array type",  &v220,  2);
            __SC_log_send2(5LL, v148, v149, 0LL, v152);
            if (v152 != &v229) {
              free(v152);
            }
          }

          v146 = 0;
          v108 = v197;
LABEL_169:
          v117 = v203;
          if (!v108) {
            goto LABEL_170;
          }
          goto LABEL_171;
        }

        v127 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
        v214 = v127;
        if (!v127)
        {
          v146 = 0;
          goto LABEL_184;
        }

        theArray = v127;
        if (!v207)
        {
LABEL_154:
          v108 = theArray;
          v213 = theArray;
          v140 = sub_100009A18();
          v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
          v142 = _SC_syslog_os_log_mapping(7LL);
          v105 = valuea;
          if (__SC_log_enabled(7LL, v141, v142))
          {
            v243 = 0u;
            v244 = 0u;
            v241 = 0u;
            v242 = 0u;
            v239 = 0u;
            v240 = 0u;
            v237 = 0u;
            v238 = 0u;
            v235 = 0u;
            v236 = 0u;
            v233 = 0u;
            v234 = 0u;
            v231 = 0u;
            v232 = 0u;
            v143 = (_sc_log > 0) | 2;
            v229 = 0u;
            v230 = 0u;
            if (os_log_type_enabled(v141, (os_log_type_t)v142)) {
              v144 = v143;
            }
            else {
              v144 = 2LL;
            }
            *(_DWORD *)v219 = 138412290;
            *(void *)&v219[4] = theArray;
            v145 = (__int128 *)_os_log_send_and_compose_impl( v144,  0LL,  &v229,  256LL,  &_mh_execute_header,  v141,  v142,  "got proxies array:\n%@",  v219,  12);
            __SC_log_send2(7LL, v141, v142, 0LL, v145);
            if (v145 != &v229) {
              free(v145);
            }
            v108 = theArray;
            v111 = &CFAbsoluteTimeGetCurrent_ptr;
          }

          v146 = 1;
          goto LABEL_169;
        }

        v128 = 0LL;
        v194 = v114;
        while (1)
        {
          v129 = objc_autoreleasePoolPush();
          v130 = (void *)objc_claimAutoreleasedReturnValue([(id)v117 objectAtIndex:v128]);
          v131 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v130, v131) & 1) == 0) {
            break;
          }
          CFArrayAppendValue(theArray, v130);
LABEL_153:

          objc_autoreleasePoolPop(v129);
          if (++v128 == v207) {
            goto LABEL_154;
          }
        }

        v132 = objc_opt_class(v111[28]);
        if ((objc_opt_isKindOfClass(v130, v132) & 1) == 0) {
          goto LABEL_153;
        }
        *(void *)&v229 = 0LL;
        *(void *)&v229 = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if ((void)v229)
        {
          v227 = 0u;
          v228 = 0u;
          memset(v226, 0, sizeof(v226));
          v133 = v130;
          v134 = [v133 countByEnumeratingWithState:v226 objects:&v220 count:16];
          if (v134)
          {
            v135 = v134;
            v136 = *(void *)v226[2];
            do
            {
              for (i = 0LL; i != v135; i = (char *)i + 1)
              {
                if (*(void *)v226[2] != v136) {
                  objc_enumerationMutation(v133);
                }
                v138 = *(const void **)(v226[1] + 8LL * (void)i);
                v139 = (void *)objc_claimAutoreleasedReturnValue([v133 objectForKey:v138]);
                CFDictionaryAddValue((CFMutableDictionaryRef)v229, v138, v139);
              }

              v135 = [v133 countByEnumeratingWithState:v226 objects:&v220 count:16];
            }

            while (v135);
          }

          CFArrayAppendValue(theArray, (const void *)v229);
          sub_100008E10((const void **)&v229);
          v110 = v192;
          v107 = v193;
          v111 = &CFAbsoluteTimeGetCurrent_ptr;
          v114 = v194;
          v115 = v201;
          v117 = v203;
          goto LABEL_153;
        }

        objc_autoreleasePoolPop(v129);
        v146 = 0;
        v105 = valuea;
LABEL_184:
        v108 = v197;
        if (!v197) {
LABEL_170:
        }
          sub_100008E10((const void **)&v214);
LABEL_171:

        if ((v146 & 1) == 0)
        {
          v153 = sub_100009A18();
          v154 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);
          v155 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v154, v155))
          {
            v156 = v108;
            v243 = 0u;
            v244 = 0u;
            v241 = 0u;
            v242 = 0u;
            v239 = 0u;
            v240 = 0u;
            v237 = 0u;
            v238 = 0u;
            v235 = 0u;
            v236 = 0u;
            v233 = 0u;
            v234 = 0u;
            v231 = 0u;
            v232 = 0u;
            v157 = (_sc_log > 0) | 2;
            v229 = 0u;
            v230 = 0u;
            v158 = os_log_type_enabled(v154, (os_log_type_t)v155);
            v220 = 138412546;
            if (v158) {
              v159 = v157;
            }
            else {
              v159 = 2LL;
            }
            v221 = v199;
            v222 = 2112;
            v223 = v203;
            v160 = (__int128 *)_os_log_send_and_compose_impl( v159,  0LL,  &v229,  256LL,  &_mh_execute_header,  v154,  v155,  "failed to validate field '%@' : %@",  &v220,  22);
            __SC_log_send2(5LL, v154, v155, 0LL, v160);
            if (v160 != &v229) {
              free(v160);
            }
            v108 = v156;
            v115 = v201;
          }
        }

        v109 = v108;
LABEL_181:

        objc_autoreleasePoolPop(v114);
        v112 = (char *)v112 + 1;
      }

      while (v112 != v107);
      v161 = [&off_10000C778 countByEnumeratingWithState:&v209 objects:&v215 count:16];
      v107 = v161;
      if (!v161)
      {
        id v9 = v187;
        id v8 = v188;
        self = v185;
        id v10 = v186;
        uint64_t v12 = theDict;
        if (v108)
        {
          CFDictionarySetValue(theDict, @"proxies", v108);
          sub_100008E10((const void **)&v213);
        }

        break;
      }
    }
  }

  if (CFDictionaryGetCount(v12) >= 3)
  {
    v162 = sub_100009A18();
    v163 = (os_log_s *)objc_claimAutoreleasedReturnValue(v162);
    v164 = _SC_syslog_os_log_mapping(7LL);
    if (__SC_log_enabled(7LL, v163, v164))
    {
      v243 = 0u;
      v244 = 0u;
      v241 = 0u;
      v242 = 0u;
      v239 = 0u;
      v240 = 0u;
      v237 = 0u;
      v238 = 0u;
      v235 = 0u;
      v236 = 0u;
      v233 = 0u;
      v234 = 0u;
      v231 = 0u;
      v232 = 0u;
      v165 = (_sc_log > 0) | 2;
      v229 = 0u;
      v230 = 0u;
      if (os_log_type_enabled(v163, (os_log_type_t)v164)) {
        v166 = v165;
      }
      else {
        v166 = 2LL;
      }
      v220 = 138412290;
      v221 = theDict;
      v167 = (__int128 *)_os_log_send_and_compose_impl( v166,  0LL,  &v229,  256LL,  &_mh_execute_header,  v163,  v164,  "validation succeeded, got PvD Additional Info dict:\n%@",  &v220,  12);
      __SC_log_send2(7LL, v163, v164, 0LL, v167);
      if (v167 != &v229) {
        free(v167);
      }
    }

    goto LABEL_218;
  }

LABEL_211:
  v178 = sub_100009A18();
  v179 = (os_log_s *)objc_claimAutoreleasedReturnValue(v178);
  v180 = _SC_syslog_os_log_mapping(5LL);
  if (__SC_log_enabled(5LL, v179, v180))
  {
    v243 = 0u;
    v244 = 0u;
    v241 = 0u;
    v242 = 0u;
    v239 = 0u;
    v240 = 0u;
    v237 = 0u;
    v238 = 0u;
    v235 = 0u;
    v236 = 0u;
    v233 = 0u;
    v234 = 0u;
    v231 = 0u;
    v232 = 0u;
    v229 = 0u;
    v230 = 0u;
    v181 = (_sc_log > 0) | 2;
    v182 = os_log_type_enabled(v179, (os_log_type_t)v180) ? v181 : 2LL;
    LOWORD(v220) = 0;
    v183 = (__int128 *)_os_log_send_and_compose_impl( v182,  0LL,  &v229,  256LL,  &_mh_execute_header,  v179,  v180,  "validation failed, couldn't create PvD Additional Info dictionary",  &v220,  2);
    __SC_log_send2(5LL, v179, v180, 0LL, v183);
    if (v183 != &v229) {
      free(v183);
    }
  }

  -[IPHPvDInfoRequestServer setValidFetch:](self, "setValidFetch:", 0LL);
LABEL_218:

  return theDict;
}

void sub_10000676C(__CFDictionary *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v226 = a3;
  id v221 = a4;
  CFStringRef StringWithDate = 0LL;
  CFStringRef v241 = 0LL;
  CFMutableArrayRef v239 = 0LL;
  __int128 v235 = 0u;
  __int128 v236 = 0u;
  __int128 v237 = 0u;
  __int128 v238 = 0u;
  id v228 = [&off_10000C748 countByEnumeratingWithState:&v235 objects:v252 count:16];
  if (!v228)
  {
    id v9 = 0LL;
    CFStringRef value = 0LL;
    CFStringRef v8 = 0LL;
    goto LABEL_177;
  }

  CFStringRef value = 0LL;
  CFStringRef v8 = 0LL;
  id v9 = 0LL;
  CFMutableArrayRef v219 = 0LL;
  uint64_t v229 = *(void *)v236;
  id v218 = v7;
  CFMutableDictionaryRef theDict = a1;
  do
  {
    CFMutableArrayRef v217 = v9;
    id v10 = 0LL;
    do
    {
      if (*(void *)v236 != v229) {
        objc_enumerationMutation(&off_10000C748);
      }
      unsigned int v11 = *(void **)(*((void *)&v235 + 1) + 8LL * (void)v10);
      uint64_t v12 = objc_autoreleasePoolPush();
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:v11]);
      if (!v13)
      {
        uint64_t v154 = sub_100009A18();
        v197 = (os_log_s *)objc_claimAutoreleasedReturnValue(v154);
        uint64_t v155 = _SC_syslog_os_log_mapping(5LL);
        __int128 v275 = 0u;
        __int128 v274 = 0u;
        __int128 v273 = 0u;
        __int128 v272 = 0u;
        __int128 v271 = 0u;
        __int128 v270 = 0u;
        __int128 v269 = 0u;
        __int128 v268 = 0u;
        __int128 v266 = 0u;
        __int128 v267 = 0u;
        __int128 v264 = 0u;
        __int128 v265 = 0u;
        __int128 v262 = 0u;
        __int128 v263 = 0u;
        unsigned int v156 = (_sc_log > 0) | 2;
        __int128 v260 = 0u;
        __int128 v261 = 0u;
        uint64_t v157 = os_log_type_enabled(v197, (os_log_type_t)v155) ? v156 : 2LL;
        *(_DWORD *)v257 = 138412290;
        *(void *)&v257[4] = v11;
        v158 = (__int128 *)_os_log_send_and_compose_impl( v157,  0LL,  &v260,  256LL,  &_mh_execute_header,  v197,  v155,  "PvD Additional Info is missing necessary field '%@'",  v257,  12);
        __SC_log_send2(5LL, v197, v155, 0LL, v158);
        if (v158 == &v260) {
          goto LABEL_246;
        }
        v159 = v158;
        goto LABEL_245;
      }

      else {
        BOOL v14 = 0;
      }
      if (v14)
      {
        v230 = v10;
        id v19 = v7;
        id capacitya = v11;
        uint64_t v20 = v13;
        __int16 v21 = v13;
        id v232 = v226;
        uint64_t v22 = sub_100009A18();
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        uint64_t v24 = _SC_syslog_os_log_mapping(7LL);
        if (__SC_log_enabled(7LL, v23, v24))
        {
          __int128 v275 = 0u;
          __int128 v274 = 0u;
          __int128 v273 = 0u;
          __int128 v272 = 0u;
          __int128 v271 = 0u;
          __int128 v270 = 0u;
          __int128 v269 = 0u;
          __int128 v268 = 0u;
          __int128 v266 = 0u;
          __int128 v267 = 0u;
          __int128 v264 = 0u;
          __int128 v265 = 0u;
          __int128 v262 = 0u;
          __int128 v263 = 0u;
          LODWORD(v25) = (_sc_log > 0) | 2;
          __int128 v260 = 0u;
          __int128 v261 = 0u;
          uint64_t v25 = os_log_type_enabled(v23, (os_log_type_t)v24) ? v25 : 2LL;
          __int128 v26 = v23;
          __int128 v27 = (void *)objc_opt_class(v21);
          *(_DWORD *)v257 = 138412802;
          *(void *)&v257[4] = capacitya;
          *(_WORD *)&v257[12] = 2112;
          *(void *)&v257[14] = v21;
          __int16 v258 = 2112;
          v259 = v27;
          id v28 = v27;
          __int128 v29 = (__int128 *)_os_log_send_and_compose_impl( v25,  0LL,  &v260,  256LL,  &_mh_execute_header,  v26,  v24,  "validating field '%@' with value '%@' of class '%@'",  v257,  32);

          __SC_log_send2(7LL, v26, v24, 0LL, v29);
          if (v29 != &v260) {
            free(v29);
          }
        }

        uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v21, v30) & 1) == 0)
        {
          uint64_t v160 = sub_100009A18();
          v161 = (os_log_s *)objc_claimAutoreleasedReturnValue(v160);
          uint64_t v162 = _SC_syslog_os_log_mapping(5LL);
          id v7 = v19;
          uint64_t v13 = v20;
          if (__SC_log_enabled(5LL, v161, v162))
          {
            __int128 v275 = 0u;
            __int128 v274 = 0u;
            __int128 v273 = 0u;
            __int128 v272 = 0u;
            __int128 v271 = 0u;
            __int128 v270 = 0u;
            __int128 v269 = 0u;
            __int128 v268 = 0u;
            __int128 v266 = 0u;
            __int128 v267 = 0u;
            __int128 v264 = 0u;
            __int128 v265 = 0u;
            __int128 v262 = 0u;
            __int128 v263 = 0u;
            unsigned int v163 = (_sc_log > 0) | 2;
            __int128 v260 = 0u;
            __int128 v261 = 0u;
            if (os_log_type_enabled(v161, (os_log_type_t)v162)) {
              uint64_t v164 = v163;
            }
            else {
              uint64_t v164 = 2LL;
            }
            *(_WORD *)v257 = 0;
            v165 = (__int128 *)_os_log_send_and_compose_impl( v164,  0LL,  &v260,  256LL,  &_mh_execute_header,  v161,  v162,  "expected JSON value of String type",  v257,  2);
            __SC_log_send2(5LL, v161, v162, 0LL, v165);
            v166 = capacitya;
            if (v165 == &v260) {
              goto LABEL_209;
            }
LABEL_207:
            free(v165);
LABEL_209:

            uint64_t v178 = sub_100009A18();
            v197 = (os_log_s *)objc_claimAutoreleasedReturnValue(v178);
            uint64_t v198 = _SC_syslog_os_log_mapping(5LL);
            __int128 v275 = 0u;
            __int128 v274 = 0u;
            __int128 v273 = 0u;
            __int128 v272 = 0u;
            __int128 v271 = 0u;
            __int128 v270 = 0u;
            __int128 v269 = 0u;
            __int128 v268 = 0u;
            __int128 v266 = 0u;
            __int128 v267 = 0u;
            __int128 v264 = 0u;
            __int128 v265 = 0u;
            __int128 v262 = 0u;
            __int128 v263 = 0u;
            unsigned int v179 = (_sc_log > 0) | 2;
            __int128 v260 = 0u;
            __int128 v261 = 0u;
            uint64_t v180 = os_log_type_enabled(v197, (os_log_type_t)v198) ? v179 : 2LL;
            *(_DWORD *)v257 = 138412546;
            *(void *)&v257[4] = v166;
            *(_WORD *)&v257[12] = 2112;
            *(void *)&v257[14] = v21;
            uint64_t v181 = _os_log_send_and_compose_impl( v180,  0LL,  &v260,  256LL,  &_mh_execute_header,  v197,  v198,  "failed to validate field '%@' : %@",  v257,  22);
LABEL_243:
            v205 = (__int128 *)v181;
            __SC_log_send2(5LL, v197, v198, 0LL, v181);
            if (v205 == &v260)
            {
LABEL_246:

              objc_autoreleasePoolPop(v12);
              goto LABEL_247;
            }

            v159 = v205;
LABEL_245:
            free(v159);
            goto LABEL_246;
          }

LABEL_208:
          v166 = capacitya;
          goto LABEL_209;
        }

        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v21, "lowercaseString"));
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v232 lowercaseString]);
        unsigned __int8 v33 = [v31 isEqualToString:v32];

        id v7 = v19;
        uint64_t v13 = v20;
        if ((v33 & 1) == 0)
        {
          uint64_t v167 = sub_100009A18();
          v161 = (os_log_s *)objc_claimAutoreleasedReturnValue(v167);
          uint64_t v168 = _SC_syslog_os_log_mapping(5LL);
          v166 = capacitya;
          __int128 v275 = 0u;
          __int128 v274 = 0u;
          __int128 v273 = 0u;
          __int128 v272 = 0u;
          __int128 v271 = 0u;
          __int128 v270 = 0u;
          __int128 v269 = 0u;
          __int128 v268 = 0u;
          __int128 v266 = 0u;
          __int128 v267 = 0u;
          __int128 v264 = 0u;
          __int128 v265 = 0u;
          __int128 v262 = 0u;
          __int128 v263 = 0u;
          unsigned int v169 = (_sc_log > 0) | 2;
          __int128 v260 = 0u;
          __int128 v261 = 0u;
          if (os_log_type_enabled(v161, (os_log_type_t)v168)) {
            uint64_t v170 = v169;
          }
          else {
            uint64_t v170 = 2LL;
          }
          *(_WORD *)v257 = 0;
          uint64_t v171 = _os_log_send_and_compose_impl( v170,  0LL,  &v260,  256LL,  &_mh_execute_header,  v161,  v168,  "retrieved ID must be an equal string with RA's PvD ID",  v257,  2);
          goto LABEL_206;
        }

        CFDataRef v34 = sub_100009764(v21);
        if (!v34)
        {
          uint64_t v172 = sub_100009A18();
          v161 = (os_log_s *)objc_claimAutoreleasedReturnValue(v172);
          uint64_t v168 = _SC_syslog_os_log_mapping(5LL);
          __int128 v275 = 0u;
          __int128 v274 = 0u;
          __int128 v273 = 0u;
          __int128 v272 = 0u;
          __int128 v271 = 0u;
          __int128 v270 = 0u;
          __int128 v269 = 0u;
          __int128 v268 = 0u;
          __int128 v266 = 0u;
          __int128 v267 = 0u;
          __int128 v264 = 0u;
          __int128 v265 = 0u;
          __int128 v262 = 0u;
          __int128 v263 = 0u;
          unsigned int v173 = (_sc_log > 0) | 2;
          __int128 v260 = 0u;
          __int128 v261 = 0u;
          if (os_log_type_enabled(v161, (os_log_type_t)v168)) {
            uint64_t v174 = v173;
          }
          else {
            uint64_t v174 = 2LL;
          }
          *(_DWORD *)v257 = 138412290;
          v166 = capacitya;
          *(void *)&v257[4] = capacitya;
          uint64_t v171 = _os_log_send_and_compose_impl( v174,  0LL,  &v260,  256LL,  &_mh_execute_header,  v161,  v168,  "couldn't validate PvD '%@' as an FQDN",  v257,  12);
LABEL_206:
          v165 = (__int128 *)v171;
          __SC_log_send2(5LL, v161, v168, 0LL, v171);
          if (v165 != &v260) {
            goto LABEL_207;
          }
          goto LABEL_209;
        }

        CFRelease(v34);
        CFStringRef Copy = CFStringCreateCopy(0LL, v21);
        CFStringRef v241 = Copy;
        if (!Copy)
        {
          uint64_t v175 = sub_100009A18();
          v161 = (os_log_s *)objc_claimAutoreleasedReturnValue(v175);
          uint64_t v168 = _SC_syslog_os_log_mapping(5LL);
          v166 = capacitya;
          __int128 v275 = 0u;
          __int128 v274 = 0u;
          __int128 v273 = 0u;
          __int128 v272 = 0u;
          __int128 v271 = 0u;
          __int128 v270 = 0u;
          __int128 v269 = 0u;
          __int128 v268 = 0u;
          __int128 v266 = 0u;
          __int128 v267 = 0u;
          __int128 v264 = 0u;
          __int128 v265 = 0u;
          __int128 v262 = 0u;
          __int128 v263 = 0u;
          unsigned int v176 = (_sc_log > 0) | 2;
          __int128 v260 = 0u;
          __int128 v261 = 0u;
          if (os_log_type_enabled(v161, (os_log_type_t)v168)) {
            uint64_t v177 = v176;
          }
          else {
            uint64_t v177 = 2LL;
          }
          *(_WORD *)v257 = 0;
          uint64_t v171 = _os_log_send_and_compose_impl( v177,  0LL,  &v260,  256LL,  &_mh_execute_header,  v161,  v168,  "couldn't copy id string",  v257,  2);
          goto LABEL_206;
        }

        CFStringRef v8 = Copy;

        goto LABEL_48;
      }

      else {
        BOOL v15 = 0;
      }
      if (v15)
      {
        v230 = v10;
        id v233 = v11;
        __int128 v36 = v13;
        v256[0] = 0LL;
        *(void *)&__int128 v246 = 0LL;
        *(void *)&__int128 v242 = 0LL;
        *(void *)v253 = 0LL;
        uint64_t v37 = sub_100009A18();
        __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        uint64_t v39 = _SC_syslog_os_log_mapping(7LL);
        if (__SC_log_enabled(7LL, v38, v39))
        {
          v40 = v8;
          unsigned int v41 = v13;
          __int128 v275 = 0u;
          __int128 v274 = 0u;
          __int128 v273 = 0u;
          __int128 v272 = 0u;
          __int128 v271 = 0u;
          __int128 v270 = 0u;
          __int128 v269 = 0u;
          __int128 v268 = 0u;
          __int128 v266 = 0u;
          __int128 v267 = 0u;
          __int128 v264 = 0u;
          __int128 v265 = 0u;
          __int128 v262 = 0u;
          __int128 v263 = 0u;
          LODWORD(v42) = (_sc_log > 0) | 2;
          __int128 v260 = 0u;
          __int128 v261 = 0u;
          if (os_log_type_enabled(v38, (os_log_type_t)v39)) {
            uint64_t v42 = v42;
          }
          else {
            uint64_t v42 = 2LL;
          }
          uint64_t v43 = v38;
          uint64_t v44 = (void *)objc_opt_class(v36);
          *(_DWORD *)v257 = 138412802;
          *(void *)&v257[4] = v233;
          *(_WORD *)&v257[12] = 2112;
          *(void *)&v257[14] = v36;
          __int16 v258 = 2112;
          v259 = v44;
          id v45 = v44;
          uint64_t v46 = (__int128 *)_os_log_send_and_compose_impl( v42,  0LL,  &v260,  256LL,  &_mh_execute_header,  v43,  v39,  "validating field '%@' with value '%@' of class '%@'",  v257,  32);

          __SC_log_send2(7LL, v43, v39, 0LL, v46);
          if (v46 != &v260) {
            free(v46);
          }
          uint64_t v13 = v41;
          CFStringRef v8 = v40;
          id v7 = v218;
        }

        uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v36, v47) & 1) == 0)
        {
          uint64_t v182 = sub_100009A18();
          v183 = (os_log_s *)objc_claimAutoreleasedReturnValue(v182);
          uint64_t v184 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v183, v184))
          {
            __int128 v275 = 0u;
            __int128 v274 = 0u;
            __int128 v273 = 0u;
            __int128 v272 = 0u;
            __int128 v271 = 0u;
            __int128 v270 = 0u;
            __int128 v269 = 0u;
            __int128 v268 = 0u;
            __int128 v266 = 0u;
            __int128 v267 = 0u;
            __int128 v264 = 0u;
            __int128 v265 = 0u;
            __int128 v262 = 0u;
            __int128 v263 = 0u;
            unsigned int v185 = (_sc_log > 0) | 2;
            __int128 v260 = 0u;
            __int128 v261 = 0u;
            uint64_t v186 = os_log_type_enabled(v183, (os_log_type_t)v184) ? v185 : 2LL;
            *(_WORD *)v257 = 0;
            v187 = (__int128 *)_os_log_send_and_compose_impl( v186,  0LL,  &v260,  256LL,  &_mh_execute_header,  v183,  v184,  "expected JSON value of String type",  v257,  2);
            __SC_log_send2(5LL, v183, v184, 0LL, v187);
            if (v187 != &v260) {
              goto LABEL_231;
            }
          }

          goto LABEL_237;
        }

        int v48 = CFLocaleCreate(0LL, @"en_US_POSIX");
        *(void *)&__int128 v246 = v48;
        if (!v48) {
          goto LABEL_238;
        }
        CFDateFormatterRef v49 = CFDateFormatterCreate(0LL, v48, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
        v256[0] = v49;
        if (!v49) {
          goto LABEL_238;
        }
        v50 = v49;
        CFDateFormatterSetFormat(v49, @"yyyy-MM-dd'T'HH:mm:ss'Z'");
        CFDateRef DateFromString = CFDateFormatterCreateDateFromString(0LL, v50, v36, 0LL);
        *(void *)&__int128 v242 = DateFromString;
        if (!DateFromString) {
          goto LABEL_238;
        }
        v52 = DateFromString;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        uint64_t v54 = CFDateCreate(0LL, Current);
        *(void *)v253 = v54;
        if (!v54) {
          goto LABEL_238;
        }
        if (CFDateCompare(v52, v54, 0LL) != kCFCompareGreaterThan)
        {
          uint64_t v188 = sub_100009A18();
          v183 = (os_log_s *)objc_claimAutoreleasedReturnValue(v188);
          uint64_t v189 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v183, v189))
          {
            __int128 v275 = 0u;
            __int128 v274 = 0u;
            __int128 v273 = 0u;
            __int128 v272 = 0u;
            __int128 v271 = 0u;
            __int128 v270 = 0u;
            __int128 v269 = 0u;
            __int128 v268 = 0u;
            __int128 v266 = 0u;
            __int128 v267 = 0u;
            __int128 v264 = 0u;
            __int128 v265 = 0u;
            __int128 v262 = 0u;
            __int128 v263 = 0u;
            unsigned int v190 = (_sc_log > 0) | 2;
            __int128 v260 = 0u;
            __int128 v261 = 0u;
            uint64_t v191 = os_log_type_enabled(v183, (os_log_type_t)v189) ? v190 : 2LL;
            *(_WORD *)v257 = 0;
            uint64_t v192 = _os_log_send_and_compose_impl( v191,  0LL,  &v260,  256LL,  &_mh_execute_header,  v183,  v189,  "expiration date must be in the future",  v257,  2);
LABEL_230:
            v187 = (__int128 *)v192;
            __SC_log_send2(5LL, v183, v189, 0LL, v192);
            if (v187 != &v260) {
LABEL_231:
            }
              free(v187);
          }

LABEL_237:
LABEL_238:
          sub_100008E10((const void **)&v246);
          sub_100008E10(v256);
          sub_100008E10((const void **)&v242);
          sub_100008E10((const void **)v253);

          uint64_t v202 = sub_100009A18();
          v197 = (os_log_s *)objc_claimAutoreleasedReturnValue(v202);
          uint64_t v198 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v197, v198))
          {
            __int128 v275 = 0u;
            __int128 v274 = 0u;
            __int128 v273 = 0u;
            __int128 v272 = 0u;
            __int128 v271 = 0u;
            __int128 v270 = 0u;
            __int128 v269 = 0u;
            __int128 v268 = 0u;
            __int128 v266 = 0u;
            __int128 v267 = 0u;
            __int128 v264 = 0u;
            __int128 v265 = 0u;
            __int128 v262 = 0u;
            __int128 v263 = 0u;
            unsigned int v203 = (_sc_log > 0) | 2;
            __int128 v260 = 0u;
            __int128 v261 = 0u;
            if (os_log_type_enabled(v197, (os_log_type_t)v198)) {
              uint64_t v204 = v203;
            }
            else {
              uint64_t v204 = 2LL;
            }
            *(_DWORD *)v257 = 138412546;
            *(void *)&v257[4] = v233;
            *(_WORD *)&v257[12] = 2112;
            *(void *)&v257[14] = v36;
            uint64_t v181 = _os_log_send_and_compose_impl( v204,  0LL,  &v260,  256LL,  &_mh_execute_header,  v197,  v198,  "failed to validate field '%@': %@",  v257,  22);
            goto LABEL_243;
          }

          goto LABEL_246;
        }

        CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(0LL, v50, v52);
        CFStringRef value = StringWithDate;
        if (!StringWithDate)
        {
          uint64_t v193 = sub_100009A18();
          v183 = (os_log_s *)objc_claimAutoreleasedReturnValue(v193);
          uint64_t v189 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v183, v189))
          {
            __int128 v275 = 0u;
            __int128 v274 = 0u;
            __int128 v273 = 0u;
            __int128 v272 = 0u;
            __int128 v271 = 0u;
            __int128 v270 = 0u;
            __int128 v269 = 0u;
            __int128 v268 = 0u;
            __int128 v266 = 0u;
            __int128 v267 = 0u;
            __int128 v264 = 0u;
            __int128 v265 = 0u;
            __int128 v262 = 0u;
            __int128 v263 = 0u;
            unsigned int v194 = (_sc_log > 0) | 2;
            __int128 v260 = 0u;
            __int128 v261 = 0u;
            if (os_log_type_enabled(v183, (os_log_type_t)v189)) {
              uint64_t v195 = v194;
            }
            else {
              uint64_t v195 = 2LL;
            }
            *(_WORD *)v257 = 0;
            uint64_t v192 = _os_log_send_and_compose_impl( v195,  0LL,  &v260,  256LL,  &_mh_execute_header,  v183,  v189,  "failed to create string from date formatter",  v257,  2);
            goto LABEL_230;
          }

          goto LABEL_237;
        }

        sub_100008E10((const void **)&v246);
        sub_100008E10(v256);
        sub_100008E10((const void **)&v242);
        sub_100008E10((const void **)v253);
LABEL_48:

        id v10 = v230;
        goto LABEL_49;
      }

      else {
        BOOL v16 = 0;
      }
      if (v16)
      {
        id v17 = v11;
        id v18 = v13;
        id v216 = v221;
        CFMutableArrayRef v251 = 0LL;
        v212 = v8;
        else {
          CFIndex capacity = (CFIndex)[v18 count];
        }
        CFArrayRef theArray = 0LL;
        uint64_t v55 = sub_100009A18();
        uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        uint64_t v57 = _SC_syslog_os_log_mapping(7LL);
        if (__SC_log_enabled(7LL, v56, v57))
        {
          __int128 v275 = 0u;
          __int128 v274 = 0u;
          __int128 v273 = 0u;
          __int128 v272 = 0u;
          __int128 v271 = 0u;
          __int128 v270 = 0u;
          __int128 v269 = 0u;
          __int128 v268 = 0u;
          __int128 v266 = 0u;
          __int128 v267 = 0u;
          __int128 v264 = 0u;
          __int128 v265 = 0u;
          __int128 v262 = 0u;
          __int128 v263 = 0u;
          LODWORD(v58) = (_sc_log > 0) | 2;
          __int128 v260 = 0u;
          __int128 v261 = 0u;
          if (os_log_type_enabled(v56, (os_log_type_t)v57)) {
            uint64_t v58 = v58;
          }
          else {
            uint64_t v58 = 2LL;
          }
          uint64_t v59 = v56;
          uint64_t v60 = (void *)objc_opt_class(v18);
          *(_DWORD *)v257 = 138412802;
          id v213 = v17;
          *(void *)&v257[4] = v17;
          *(_WORD *)&v257[12] = 2112;
          *(void *)&v257[14] = v18;
          __int16 v258 = 2112;
          v259 = v60;
          id v61 = v60;
          v62 = (__int128 *)_os_log_send_and_compose_impl( v58,  0LL,  &v260,  256LL,  &_mh_execute_header,  v59,  v57,  "validating field '%@' with value '%@' of class '%@'",  v257,  32);

          __SC_log_send2(7LL, v59, v57, 0LL, v62);
          if (v62 != &v260) {
            free(v62);
          }
          id v17 = v213;
          id v7 = v218;
        }

        uint64_t v63 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v18, v63) & 1) == 0)
        {
          uint64_t v105 = sub_100009A18();
          v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
          uint64_t v107 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v106, v107))
          {
            __int128 v275 = 0u;
            __int128 v274 = 0u;
            __int128 v273 = 0u;
            __int128 v272 = 0u;
            __int128 v271 = 0u;
            __int128 v270 = 0u;
            __int128 v269 = 0u;
            __int128 v268 = 0u;
            __int128 v266 = 0u;
            __int128 v267 = 0u;
            __int128 v264 = 0u;
            __int128 v265 = 0u;
            __int128 v262 = 0u;
            __int128 v263 = 0u;
            unsigned int v108 = (_sc_log > 0) | 2;
            __int128 v260 = 0u;
            __int128 v261 = 0u;
            uint64_t v109 = os_log_type_enabled(v106, (os_log_type_t)v107) ? v108 : 2LL;
            *(_WORD *)v257 = 0;
            v110 = (__int128 *)_os_log_send_and_compose_impl( v109,  0LL,  &v260,  256LL,  &_mh_execute_header,  v106,  v107,  "expected JSON value of Array type",  v257,  2);
            __SC_log_send2(5LL, v106, v107, 0LL, v110);
            if (v110 != &v260) {
              free(v110);
            }
          }

          goto LABEL_168;
        }

        uint64_t v64 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        Mutable = CFArrayCreateMutable(0LL, capacity, &kCFTypeArrayCallBacks);
        char v66 = 0;
        CFMutableArrayRef v251 = Mutable;
        v234 = (void *)v64;
        if (v64 && Mutable)
        {
          v231 = v10;
          if (capacity)
          {
            uint64_t v67 = 0LL;
            id v214 = v17;
            while (1)
            {
              v68 = objc_autoreleasePoolPush();
              *(void *)&v257[8] = 0LL;
              *(void *)v257 = 0LL;
              LODWORD(v246) = 0;
              v256[0] = 0LL;
              uint64_t v69 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 objectAtIndex:v67]);
              if ((-[__CFString isMemberOfClass:]( v69,  "isMemberOfClass:",  objc_opt_class(&OBJC_CLASS___NSString)) & 1) == 0)
              {
                uint64_t v133 = sub_100009A18();
                v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
                uint64_t v120 = _SC_syslog_os_log_mapping(5LL);
                id v121 = v18;
                __int128 v275 = 0u;
                __int128 v274 = 0u;
                __int128 v273 = 0u;
                __int128 v272 = 0u;
                __int128 v271 = 0u;
                __int128 v270 = 0u;
                __int128 v269 = 0u;
                __int128 v268 = 0u;
                __int128 v266 = 0u;
                __int128 v267 = 0u;
                __int128 v264 = 0u;
                __int128 v265 = 0u;
                __int128 v262 = 0u;
                __int128 v263 = 0u;
                unsigned int v134 = (_sc_log > 0) | 2;
                __int128 v260 = 0u;
                __int128 v261 = 0u;
                if (os_log_type_enabled(v119, (os_log_type_t)v120)) {
                  uint64_t v135 = v134;
                }
                else {
                  uint64_t v135 = 2LL;
                }
                LOWORD(v242) = 0;
                uint64_t v124 = _os_log_send_and_compose_impl( v135,  0LL,  &v260,  256LL,  &_mh_execute_header,  v119,  v120,  "expected JSON Array of Strings",  &v242,  2);
LABEL_140:
                v136 = (__int128 *)v124;
                __SC_log_send2(5LL, v119, v120, 0LL, v124);
                if (v136 != &v260) {
                  free(v136);
                }
                id v18 = v121;
                goto LABEL_160;
              }

              ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, v69, @"/");
              CFArrayRef theArray = ArrayBySeparatingStrings;
              if (!ArrayBySeparatingStrings || CFArrayGetCount(ArrayBySeparatingStrings) != 2)
              {
                uint64_t v118 = sub_100009A18();
                v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
                uint64_t v120 = _SC_syslog_os_log_mapping(5LL);
                id v121 = v18;
                __int128 v275 = 0u;
                __int128 v274 = 0u;
                __int128 v273 = 0u;
                __int128 v272 = 0u;
                __int128 v271 = 0u;
                __int128 v270 = 0u;
                __int128 v269 = 0u;
                __int128 v268 = 0u;
                __int128 v266 = 0u;
                __int128 v267 = 0u;
                __int128 v264 = 0u;
                __int128 v265 = 0u;
                __int128 v262 = 0u;
                __int128 v263 = 0u;
                unsigned int v122 = (_sc_log > 0) | 2;
                __int128 v260 = 0u;
                __int128 v261 = 0u;
                if (os_log_type_enabled(v119, (os_log_type_t)v120)) {
                  uint64_t v123 = v122;
                }
                else {
                  uint64_t v123 = 2LL;
                }
                LOWORD(v242) = 0;
                uint64_t v124 = _os_log_send_and_compose_impl( v123,  0LL,  &v260,  256LL,  &_mh_execute_header,  v119,  v120,  "couldn't split provided string",  &v242,  2);
                goto LABEL_140;
              }

              ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0LL);
              CFTypeID TypeID = CFStringGetTypeID();
              if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != TypeID)
              {
                uint64_t v125 = sub_100009A18();
                v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
                uint64_t v120 = _SC_syslog_os_log_mapping(5LL);
                id v17 = v214;
                id v121 = v18;
                __int128 v275 = 0u;
                __int128 v274 = 0u;
                __int128 v273 = 0u;
                __int128 v272 = 0u;
                __int128 v271 = 0u;
                __int128 v270 = 0u;
                __int128 v269 = 0u;
                __int128 v268 = 0u;
                __int128 v266 = 0u;
                __int128 v267 = 0u;
                __int128 v264 = 0u;
                __int128 v265 = 0u;
                __int128 v262 = 0u;
                __int128 v263 = 0u;
                unsigned int v126 = (_sc_log > 0) | 2;
                __int128 v260 = 0u;
                __int128 v261 = 0u;
                if (os_log_type_enabled(v119, (os_log_type_t)v120)) {
                  uint64_t v127 = v126;
                }
                else {
                  uint64_t v127 = 2LL;
                }
                LOWORD(v242) = 0;
                uint64_t v124 = _os_log_send_and_compose_impl( v127,  0LL,  &v260,  256LL,  &_mh_execute_header,  v119,  v120,  "bad prefix addr type",  &v242,  2);
                goto LABEL_140;
              }

              if ((sub_100008EC4(ValueAtIndex, v257) & 1) == 0) {
                break;
              }
              unsigned int v73 = v69;
              id v74 = v68;
              id v75 = v7;
              id v76 = v18;
              __int16 v77 = (const __CFString *)CFArrayGetValueAtIndex(theArray, 1LL);
              CFTypeID v78 = CFStringGetTypeID();
              if (!v77 || CFGetTypeID(v77) != v78)
              {
                uint64_t v128 = sub_100009A18();
                v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
                uint64_t v129 = _SC_syslog_os_log_mapping(5LL);
                if (__SC_log_enabled(5LL, v119, v129))
                {
                  __int128 v275 = 0u;
                  __int128 v274 = 0u;
                  __int128 v273 = 0u;
                  __int128 v272 = 0u;
                  __int128 v271 = 0u;
                  __int128 v270 = 0u;
                  __int128 v269 = 0u;
                  __int128 v268 = 0u;
                  __int128 v266 = 0u;
                  __int128 v267 = 0u;
                  __int128 v264 = 0u;
                  __int128 v265 = 0u;
                  __int128 v262 = 0u;
                  __int128 v263 = 0u;
                  unsigned int v130 = (_sc_log > 0) | 2;
                  __int128 v260 = 0u;
                  __int128 v261 = 0u;
                  if (os_log_type_enabled(v119, (os_log_type_t)v129)) {
                    uint64_t v131 = v130;
                  }
                  else {
                    uint64_t v131 = 2LL;
                  }
                  LOWORD(v242) = 0;
                  uint64_t v132 = _os_log_send_and_compose_impl( v131,  0LL,  &v260,  256LL,  &_mh_execute_header,  v119,  v129,  "bad prefix len type",  &v242,  2);
                  goto LABEL_155;
                }

LABEL_157:
                id v17 = v214;
LABEL_158:
                id v18 = v76;
                id v7 = v75;
LABEL_159:
                v68 = v74;
                uint64_t v69 = v73;
                goto LABEL_160;
              }

              if (!sub_100008F78(v77, &v246) || v246 >= 0x81)
              {
                uint64_t v143 = sub_100009A18();
                v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
                uint64_t v129 = _SC_syslog_os_log_mapping(5LL);
                __int128 v275 = 0u;
                __int128 v274 = 0u;
                __int128 v273 = 0u;
                __int128 v272 = 0u;
                __int128 v271 = 0u;
                __int128 v270 = 0u;
                __int128 v269 = 0u;
                __int128 v268 = 0u;
                __int128 v266 = 0u;
                __int128 v267 = 0u;
                __int128 v264 = 0u;
                __int128 v265 = 0u;
                __int128 v262 = 0u;
                __int128 v263 = 0u;
                unsigned int v144 = (_sc_log > 0) | 2;
                __int128 v260 = 0u;
                __int128 v261 = 0u;
                if (os_log_type_enabled(v119, (os_log_type_t)v129)) {
                  uint64_t v145 = v144;
                }
                else {
                  uint64_t v145 = 2LL;
                }
                LOWORD(v242) = 0;
                uint64_t v132 = _os_log_send_and_compose_impl( v145,  0LL,  &v260,  256LL,  &_mh_execute_header,  v119,  v129,  "bad prefix len value",  &v242,  2);
LABEL_155:
                v146 = (__int128 *)v132;
                __SC_log_send2(5LL, v119, v129, 0LL, v132);
                id v17 = v214;
                if (v146 != &v260) {
                  free(v146);
                }
                goto LABEL_158;
              }

              CFStringRef v79 = CFStringCreateWithFormat(0LL, 0LL, @"%@/%@", ValueAtIndex, v77);
              v256[0] = v79;
              id v17 = v214;
              id v7 = v75;
              v68 = v74;
              uint64_t v69 = v73;
              if (!v79) {
                goto LABEL_161;
              }
              CFArrayAppendValue(v251, v79);
              [v234 addObject:v73];
              sub_100008E10((const void **)&theArray);
              sub_100008E10(v256);

              objc_autoreleasePoolPop(v68);
              if (capacity == ++v67) {
                goto LABEL_76;
              }
            }

            uint64_t v137 = sub_100009A18();
            v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
            uint64_t v138 = _SC_syslog_os_log_mapping(5LL);
            if (__SC_log_enabled(5LL, v119, v138))
            {
              unsigned int v73 = v69;
              id v74 = v68;
              id v139 = v18;
              __int128 v275 = 0u;
              __int128 v274 = 0u;
              __int128 v273 = 0u;
              __int128 v272 = 0u;
              __int128 v271 = 0u;
              __int128 v270 = 0u;
              __int128 v269 = 0u;
              __int128 v268 = 0u;
              __int128 v266 = 0u;
              __int128 v267 = 0u;
              __int128 v264 = 0u;
              __int128 v265 = 0u;
              __int128 v262 = 0u;
              __int128 v263 = 0u;
              unsigned int v140 = (_sc_log > 0) | 2;
              __int128 v260 = 0u;
              __int128 v261 = 0u;
              if (os_log_type_enabled(v119, (os_log_type_t)v138)) {
                uint64_t v141 = v140;
              }
              else {
                uint64_t v141 = 2LL;
              }
              LOWORD(v242) = 0;
              v142 = (__int128 *)_os_log_send_and_compose_impl( v141,  0LL,  &v260,  256LL,  &_mh_execute_header,  v119,  v138,  "bad ipv6 address",  &v242,  2);
              __SC_log_send2(5LL, v119, v138, 0LL, v142);
              id v17 = v214;
              if (v142 != &v260) {
                free(v142);
              }
              id v18 = v139;
              goto LABEL_159;
            }

            id v17 = v214;
LABEL_160:

LABEL_161:
            objc_autoreleasePoolPop(v68);
            sub_100008E10((const void **)&theArray);
            uint64_t v147 = sub_100009A18();
            v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
            uint64_t v149 = _SC_syslog_os_log_mapping(5LL);
            id v10 = v231;
            if (__SC_log_enabled(5LL, v148, v149))
            {
              __int128 v275 = 0u;
              __int128 v274 = 0u;
              __int128 v273 = 0u;
              __int128 v272 = 0u;
              __int128 v271 = 0u;
              __int128 v270 = 0u;
              __int128 v269 = 0u;
              __int128 v268 = 0u;
              __int128 v266 = 0u;
              __int128 v267 = 0u;
              __int128 v264 = 0u;
              __int128 v265 = 0u;
              __int128 v262 = 0u;
              __int128 v263 = 0u;
              unsigned int v150 = (_sc_log > 0) | 2;
              __int128 v260 = 0u;
              __int128 v261 = 0u;
              uint64_t v151 = os_log_type_enabled(v148, (os_log_type_t)v149) ? v150 : 2LL;
              *(_WORD *)v257 = 0;
              v152 = (__int128 *)_os_log_send_and_compose_impl( v151,  0LL,  &v260,  256LL,  &_mh_execute_header,  v148,  v149,  "failed to parse well-formed prefixes",  v257,  2);
              __SC_log_send2(5LL, v148, v149, 0LL, v152);
              if (v152 != &v260) {
                free(v152);
              }
            }

            sub_100008E10((const void **)&v251);
LABEL_168:
            char v66 = 0;
            id v82 = 0LL;
LABEL_169:
            if (!v217) {
              sub_100008E10((const void **)&v251);
            }

            CFMutableArrayRef v219 = v217;
            CFStringRef v8 = v212;
            if ((v66 & 1) == 0)
            {
              uint64_t v196 = sub_100009A18();
              v197 = (os_log_s *)objc_claimAutoreleasedReturnValue(v196);
              uint64_t v198 = _SC_syslog_os_log_mapping(5LL);
              if (__SC_log_enabled(5LL, v197, v198))
              {
                __int128 v275 = 0u;
                __int128 v274 = 0u;
                __int128 v273 = 0u;
                __int128 v272 = 0u;
                __int128 v271 = 0u;
                __int128 v270 = 0u;
                __int128 v269 = 0u;
                __int128 v268 = 0u;
                __int128 v266 = 0u;
                __int128 v267 = 0u;
                __int128 v264 = 0u;
                __int128 v265 = 0u;
                __int128 v262 = 0u;
                __int128 v263 = 0u;
                unsigned int v200 = (_sc_log > 0) | 2;
                __int128 v260 = 0u;
                __int128 v261 = 0u;
                if (os_log_type_enabled(v197, (os_log_type_t)v198)) {
                  uint64_t v201 = v200;
                }
                else {
                  uint64_t v201 = 2LL;
                }
                *(_DWORD *)v257 = 138412546;
                *(void *)&v257[4] = v17;
                *(_WORD *)&v257[12] = 2112;
                *(void *)&v257[14] = v18;
                uint64_t v181 = _os_log_send_and_compose_impl( v201,  0LL,  &v260,  256LL,  &_mh_execute_header,  v197,  v198,  "failed to validate field '%@' : %@",  v257,  22);
                goto LABEL_243;
              }

              goto LABEL_246;
            }

            goto LABEL_49;
          }

LABEL_76:
          sub_100008E10((const void **)&theArray);
          __int128 v248 = 0u;
          __int128 v249 = 0u;
          __int128 v246 = 0u;
          __int128 v247 = 0u;
          id obj = v216;
          id v210 = [obj countByEnumeratingWithState:&v246 objects:v257 count:16];
          if (v210)
          {
            uint64_t v209 = *(void *)v247;
            v222 = v12;
            id v206 = v18;
            v207 = v13;
            id v215 = v17;
            while (2)
            {
              uint64_t v80 = 0LL;
              while (2)
              {
                if (*(void *)v247 != v209) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v220 = v80;
                capacityb = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v246 + 1) + 8 * v80) componentsSeparatedByString:@"::"]);
                __int128 v81 = (void *)objc_claimAutoreleasedReturnValue([capacityb firstObject]);
                __int128 v242 = 0u;
                __int128 v243 = 0u;
                __int128 v244 = 0u;
                __int128 v245 = 0u;
                id v82 = v234;
                id v83 = [v82 countByEnumeratingWithState:&v242 objects:v256 count:16];
                if (!v83)
                {
LABEL_113:

                  uint64_t v111 = sub_100009A18();
                  v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
                  uint64_t v113 = _SC_syslog_os_log_mapping(5LL);
                  id v7 = v218;
                  uint64_t v12 = v222;
                  uint64_t v13 = v207;
                  id v17 = v215;
                  if (__SC_log_enabled(5LL, v112, v113))
                  {
                    __int128 v275 = 0u;
                    __int128 v274 = 0u;
                    __int128 v273 = 0u;
                    __int128 v272 = 0u;
                    __int128 v271 = 0u;
                    __int128 v270 = 0u;
                    __int128 v269 = 0u;
                    __int128 v268 = 0u;
                    __int128 v266 = 0u;
                    __int128 v267 = 0u;
                    __int128 v264 = 0u;
                    __int128 v265 = 0u;
                    __int128 v262 = 0u;
                    __int128 v263 = 0u;
                    unsigned int v114 = (_sc_log > 0) | 2;
                    __int128 v260 = 0u;
                    __int128 v261 = 0u;
                    BOOL v115 = os_log_type_enabled(v112, (os_log_type_t)v113);
                    *(_DWORD *)v253 = 138412546;
                    uint64_t v116 = v115 ? v114 : 2LL;
                    *(void *)&v253[4] = v81;
                    __int16 v254 = 2112;
                    id v255 = v82;
                    v117 = (__int128 *)_os_log_send_and_compose_impl( v116,  0LL,  &v260,  256LL,  &_mh_execute_header,  v112,  v113,  "discrepancy found with prefix '%@', not contained by any of %@",  v253,  22);
                    __SC_log_send2(5LL, v112, v113, 0LL, v117);
                    if (v117 != &v260) {
                      free(v117);
                    }
                  }

                  char v66 = 0;
                  id v10 = v231;
                  id v18 = v206;
                  goto LABEL_169;
                }

                id v84 = v83;
                uint64_t v85 = *(void *)v243;
LABEL_83:
                uint64_t v86 = 0LL;
                while (1)
                {
                  if (*(void *)v243 != v85) {
                    objc_enumerationMutation(v82);
                  }
                  __int128 v87 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v242 + 1) + 8 * v86) componentsSeparatedByString:@"::"]);
                  __int128 v88 = (void *)objc_claimAutoreleasedReturnValue([v87 firstObject]);
                  __int128 v89 = (void *)objc_claimAutoreleasedReturnValue([v81 lowercaseString]);
                  __int128 v90 = (void *)objc_claimAutoreleasedReturnValue([v88 lowercaseString]);
                  unsigned int v91 = [v89 containsString:v90];

                  if (v91) {
                    break;
                  }

                  if (v84 == (id)++v86)
                  {
                    id v84 = [v82 countByEnumeratingWithState:&v242 objects:v256 count:16];
                    if (v84) {
                      goto LABEL_83;
                    }
                    goto LABEL_113;
                  }
                }

                uint64_t v92 = sub_100009A18();
                __int128 v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
                uint64_t v94 = _SC_syslog_os_log_mapping(7LL);
                id v7 = v218;
                uint64_t v12 = v222;
                if (__SC_log_enabled(7LL, v93, v94))
                {
                  __int128 v275 = 0u;
                  __int128 v274 = 0u;
                  __int128 v273 = 0u;
                  __int128 v272 = 0u;
                  __int128 v271 = 0u;
                  __int128 v270 = 0u;
                  __int128 v269 = 0u;
                  __int128 v268 = 0u;
                  __int128 v266 = 0u;
                  __int128 v267 = 0u;
                  __int128 v264 = 0u;
                  __int128 v265 = 0u;
                  __int128 v262 = 0u;
                  __int128 v263 = 0u;
                  unsigned int v95 = (_sc_log > 0) | 2;
                  __int128 v260 = 0u;
                  __int128 v261 = 0u;
                  BOOL v96 = os_log_type_enabled(v93, (os_log_type_t)v94);
                  *(_DWORD *)v253 = 138412546;
                  uint64_t v97 = v96 ? v95 : 2LL;
                  *(void *)&v253[4] = v81;
                  __int16 v254 = 2112;
                  id v255 = v88;
                  v98 = (__int128 *)_os_log_send_and_compose_impl( v97,  0LL,  &v260,  256LL,  &_mh_execute_header,  v93,  v94,  "RA PIO prefix '%@' found contained by PvDAdditional Information prefix '%@'",  v253,  22);
                  __SC_log_send2(7LL, v93, v94, 0LL, v98);
                  if (v98 != &v260) {
                    free(v98);
                  }
                }

                uint64_t v80 = v220 + 1;
                if ((id)(v220 + 1) != v210) {
                  continue;
                }
                break;
              }

              id v18 = v206;
              uint64_t v13 = v207;
              id v17 = v215;
              id v210 = [obj countByEnumeratingWithState:&v246 objects:v257 count:16];
              if (v210) {
                continue;
              }
              break;
            }
          }

          CFMutableArrayRef v217 = v251;
          CFMutableArrayRef v239 = v251;
          uint64_t v99 = sub_100009A18();
          v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
          uint64_t v101 = _SC_syslog_os_log_mapping(7LL);
          id v10 = v231;
          if (__SC_log_enabled(7LL, v100, v101))
          {
            __int128 v275 = 0u;
            __int128 v274 = 0u;
            __int128 v273 = 0u;
            __int128 v272 = 0u;
            __int128 v271 = 0u;
            __int128 v270 = 0u;
            __int128 v269 = 0u;
            __int128 v268 = 0u;
            __int128 v266 = 0u;
            __int128 v267 = 0u;
            __int128 v264 = 0u;
            __int128 v265 = 0u;
            __int128 v262 = 0u;
            __int128 v263 = 0u;
            unsigned int v102 = (_sc_log > 0) | 2;
            __int128 v260 = 0u;
            __int128 v261 = 0u;
            uint64_t v103 = os_log_type_enabled(v100, (os_log_type_t)v101) ? v102 : 2LL;
            *(_DWORD *)v253 = 138412290;
            *(void *)&v253[4] = v217;
            v104 = (__int128 *)_os_log_send_and_compose_impl( v103,  0LL,  &v260,  256LL,  &_mh_execute_header,  v100,  v101,  "successfully validated prefixes array %@",  v253,  12);
            __SC_log_send2(7LL, v100, v101, 0LL, v104);
            if (v104 != &v260) {
              free(v104);
            }
          }

          char v66 = 1;
        }

        id v82 = v234;
        goto LABEL_169;
      }

LABEL_49:
      objc_autoreleasePoolPop(v12);
      id v10 = (char *)v10 + 1;
    }

    while (v10 != v228);
    id v153 = [&off_10000C748 countByEnumeratingWithState:&v235 objects:v252 count:16];
    a1 = theDict;
    id v9 = v217;
    id v228 = v153;
  }

  while (v153);
LABEL_177:
  CFDictionarySetValue(a1, @"identifier", v8);
  CFDictionarySetValue(a1, @"expires", value);
  CFDictionarySetValue(a1, @"prefixes", v9);
  if (CFDictionaryGetCount(a1) != 3) {
    sub_100009A24();
  }
LABEL_247:
  sub_100008E10((const void **)&v241);
  sub_100008E10((const void **)&StringWithDate);
  sub_100008E10((const void **)&v239);
}

int main(int argc, const char **argv, const char **envp)
{
  if (geteuid() || !seteuid(0xFFFFFFFE))
  {
    uint64_t v3 = objc_opt_new(&OBJC_CLASS___IPConfigurationHelperDelegate);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
    [v4 setDelegate:v3];
    [v4 activate];
  }

  else
  {
    uint64_t v6 = sub_100009A18();
    uint64_t v3 = (IPConfigurationHelperDelegate *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v7 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v3, v7))
    {
      memset(v12, 0, sizeof(v12));
      unsigned int v8 = (_sc_log > 0) | 2;
      if (os_log_type_enabled((os_log_t)v3, (os_log_type_t)v7)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 2LL;
      }
      v11[0] = 0;
      id v10 = (_OWORD *)_os_log_send_and_compose_impl( v9,  0LL,  v12,  256LL,  &_mh_execute_header,  v3,  v7,  "couldn't deescalate user before launching",  v11,  2);
      __SC_log_send2(3LL, v3, v7, 0LL, v10);
      if (v10 != v12) {
        free(v10);
      }
    }
  }

  return 0;
}

void sub_100008E10(const void **a1)
{
  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0LL;
    }
  }

uint64_t sub_100008E40(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
{
  CFIndex usedBufLen = 0LL;
  v11.length = CFStringGetLength(a1);
  v11.location = 0LL;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, a4, a2, a3 - 1, &usedBufLen);
  int v8 = usedBufLen;
  if (a2) {
    a2[usedBufLen] = 0;
  }
  return (v8 + 1);
}

uint64_t sub_100008EC4(const __CFString *a1, void *a2)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 0LL;
  }
  uint64_t result = CFStringGetCString(a1, buffer, 64LL, 0x600u);
  if ((_DWORD)result) {
    return inet_pton(30, buffer, a2) == 1;
  }
  return result;
}

uint64_t sub_100008F78(const __CFString *a1, _DWORD *a2)
{
  unint64_t v3 = strtoul(__str, 0LL, 0);
  if (v3 == -1LL) {
    return 0LL;
  }
  int v4 = v3;
  if (*__error() == 34) {
    return 0LL;
  }
  *a2 = v4;
  return 1LL;
}

UInt8 *sub_100009014(const __CFString *a1, CFRange a2, CFStringEncoding a3)
{
  CFIndex length = a2.length;
  CFIndex location = a2.location;
  CFIndex usedBufLen = 0LL;
  CFStringGetBytes(a1, a2, a3, 0, 0, 0LL, 0LL, &usedBufLen);
  CFIndex v7 = usedBufLen;
  if (!usedBufLen) {
    return 0LL;
  }
  int v8 = (UInt8 *)malloc(usedBufLen + 1);
  v11.CFIndex location = location;
  v11.CFIndex length = length;
  CFStringGetBytes(a1, v11, a3, 0, 0, v8, v7, &usedBufLen);
  v8[usedBufLen] = 0;
  return v8;
}

UInt8 *sub_1000090C8(const __CFString *a1, CFStringEncoding a2)
{
  v5.CFIndex length = CFStringGetLength(a1);
  v5.CFIndex location = 0LL;
  return sub_100009014(a1, v5, a2);
}

void *sub_1000090FC(uint64_t a1, int a2, void *a3, _DWORD *a4, char a5)
{
  CFRange v5 = a4;
  uint64_t v6 = a3;
  if (!a2) {
    goto LABEL_5;
  }
  uint64_t v7 = a1;
  if (!a3)
  {
    uint64_t v69 = 0LL;
    __int128 v68 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    int v8 = 128;
    uint64_t v9 = &v60;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    goto LABEL_7;
  }

  int v8 = *a4;
  if (!*a4)
  {
LABEL_5:
    int v10 = 0;
    goto LABEL_84;
  }

  __int128 v68 = 0u;
  uint64_t v69 = 0LL;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  uint64_t v9 = (__int128 *)a3;
  LOBYTE(v68) = 1;
LABEL_7:
  *((void *)&v68 + 1) = v9;
  HIDWORD(v69) = v8;
  unsigned int v70 = 0LL;
  uint64_t v71 = 0LL;
  char v72 = a5;
  if (a2 < 1)
  {
    int v10 = 0;
LABEL_66:
    if (!v6)
    {
      uint64_t v6 = malloc(v10);
      memcpy(v6, *((const void **)&v68 + 1), v10);
    }

    goto LABEL_83;
  }

  uint64_t v11 = 0LL;
  uint64_t v53 = a2;
  while (1)
  {
    uint64_t v55 = v11;
    uint64_t v12 = *(const char **)(v7 + 8 * v11);
    int v56 = v69;
    unsigned int v13 = strlen(v12);
    BOOL v14 = (char *)malloc((int)v13 + 26LL);
    BOOL v15 = malloc(0x30uLL);
    if (v15)
    {
      *(_OWORD *)((char *)v15 + 28) = 0u;
      _OWORD *v15 = 0u;
      v15[1] = 0u;
      *((_DWORD *)v15 + 11) = 8;
      *((void *)v15 + 4) = v15;
    }

    BOOL v16 = v14 + 24;
    *(void *)BOOL v14 = v15;
    *((void *)v14 + 1) = v14 + 24;
    if ((v13 & 0x80000000) == 0) {
      break;
    }
    int v19 = 0;
LABEL_22:
    *((_DWORD *)v14 + 4) = v19 + 1;
    v16[v19] = 0;
    if (!v72)
    {
      goto LABEL_63;
    }

    uint64_t v58 = v71;
    if ((int)v71 < 1)
    {
      unsigned int v25 = 0;
LABEL_41:
      if ((sub_1000098CC((uint64_t)&v60, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0)
      {
LABEL_74:
        if ((v69 & 0x80000000) != 0 || (int)v69 > SHIDWORD(v69))
        {
          fprintf(__stderrp, "trying to set used to %d\n", v56);
          uint64_t v7 = a1;
        }

        else
        {
          LODWORD(v69) = v56;
          uint64_t v7 = a1;
        }

        sub_1000099C4((void **)v14);
        free(v14);
        goto LABEL_79;
      }

      uint64_t v26 = 0LL;
      unsigned int v39 = 0;
      char v38 = 1;
      goto LABEL_43;
    }

    uint64_t v24 = 0LL;
    unsigned int v25 = 0;
    uint64_t v26 = 0LL;
    uint64_t v57 = v70;
    uint64_t v27 = *((void *)&v68 + 1);
    do
    {
      uint64_t v28 = v57[v24];
      if (!v28) {
        break;
      }
      unsigned int v29 = 0;
      uint64_t v30 = *(unsigned int *)(v28 + 40);
      __int128 v31 = *(void **)v14;
      uint64_t v32 = *(unsigned int *)(*(void *)v14 + 40LL);
      do
      {
        unsigned int v33 = v29;
        CFDataRef v34 = (unsigned __int8 *)(v27 + *(unsigned int *)(*(void *)(v28 + 32) + 4 * v30 - 4));
        size_t v35 = *v34;
        __int128 v36 = (unsigned __int8 *)(*((void *)v14 + 1) + *(unsigned int *)(v31[4] + 4 * v32 - 4));
        if ((_DWORD)v35 != *v36) {
          break;
        }
        int v37 = memcmp(v34 + 1, v36 + 1, v35);
        unsigned int v29 = v33 + 1;
        --v30;
        --v32;
      }

      while (!v37);
      if (v33 > v25) {
        uint64_t v26 = v28;
      }
      ++v24;
    }

    while (v24 != v58);
    if (!v26) {
      goto LABEL_41;
    }
    char v38 = 0;
    unsigned int v39 = *(_DWORD *)(v26 + 40) - v25;
LABEL_43:
    v40 = *(void **)v14;
    uint64_t v41 = *(unsigned int *)(*(void *)v14 + 40LL);
    if ((int)v41 >= 1)
    {
      uint64_t v42 = 0LL;
      uint64_t v43 = v41 - v25;
      do
      {
        if (v42 >= (int)v43)
        {
          int v46 = *(_DWORD *)(*(void *)(v26 + 32) + 4LL * (int)v39);
          if (v43 == v42)
          {
            __int16 __src = bswap32(v46 | 0xC000) >> 16;
          }

          ++v39;
          uint64_t v44 = *(void **)v14;
        }

        else
        {
          uint64_t v44 = *(void **)v14;
          uint64_t v45 = *(unsigned int *)(*(void *)(*(void *)v14 + 32LL) + 4 * v42);
          if ((v38 & 1) == 0)
          {
            if (!sub_1000098CC( (uint64_t)&v60,  (void *)(*((void *)v14 + 1) + v45),  *(unsigned __int8 *)(*((void *)v14 + 1) + v45) + 1)) {
              goto LABEL_74;
            }
            uint64_t v44 = *(void **)v14;
          }

          int v46 = v45 + v56;
        }

        *(_DWORD *)(v44[4] + 4 * v42++) = v46;
      }

      while (v41 != v42);
      v40 = *(void **)v14;
    }

    int v47 = v71;
    uint64_t v48 = SHIDWORD(v71);
    if (HIDWORD(v71) == (_DWORD)v71)
    {
      if (HIDWORD(v71))
      {
        HIDWORD(v71) *= 2;
        CFDateFormatterRef v49 = reallocf(v70, 16 * v48);
        unsigned int v70 = v49;
        int v47 = v71;
      }

      else
      {
        HIDWORD(v71) = 8;
        CFDateFormatterRef v49 = malloc(0x40uLL);
        int v47 = 0;
        unsigned int v70 = v49;
      }
    }

    else
    {
      CFDateFormatterRef v49 = v70;
    }

    LODWORD(v71) = v47 + 1;
    v49[v47] = v40;
    *(void *)BOOL v14 = 0LL;
LABEL_63:
    sub_1000099C4((void **)v14);
    free(v14);
    uint64_t v7 = a1;
    uint64_t v11 = v55 + 1;
    if (v55 + 1 == v53)
    {
      int v10 = v69;
      uint64_t v6 = a3;
      CFRange v5 = a4;
      goto LABEL_66;
    }
  }

  uint64_t v17 = 0LL;
  size_t v18 = 0LL;
  int v19 = 0;
  int v20 = 0;
  uint64_t v21 = v13;
  uint64_t v22 = v13 + 1;
  while (1)
  {
    if (v17 != v21)
    {
      int v23 = v12[v17];
      if (v23 != 46)
      {
        ++v17;
        *(_BYTE *)(*((void *)v14 + 1) + v17) = v23;
        ++v20;
        goto LABEL_19;
      }
    }

    if (!v20)
    {
      fwrite("label length is 0\n", 0x12uLL, 1uLL, __stderrp);
      goto LABEL_70;
    }

    if (v20 >= 64) {
      break;
    }
    sub_100009844(*(int **)v14, v18);
    *(_BYTE *)(*((void *)v14 + 1) + v18) = v20;
    v19 += v20 + 1;
    size_t v18 = ++v17;
    int v20 = 0;
LABEL_19:
    if (v17 == v22)
    {
      BOOL v16 = (char *)*((void *)v14 + 1);
      goto LABEL_22;
    }
  }

  fprintf(__stderrp, "label length %d > %d\n", v20, 63);
LABEL_70:
  sub_1000099C4((void **)v14);
  free(v14);
  else {
    LODWORD(v69) = v56;
  }
LABEL_79:
  CFRange v5 = a4;
  fprintf(__stderrp, "failed to add %s\n", *(const char **)(v7 + 8 * v55));
  if (a3) {
    int v10 = v69;
  }
  else {
    int v10 = 0;
  }
  uint64_t v6 = 0LL;
LABEL_83:
  sub_1000096F0((uint64_t)&v60);
LABEL_84:
  *CFRange v5 = v10;
  return v6;
}

void sub_1000096F0(uint64_t a1)
{
  unint64_t v3 = (void **)(a1 + 152);
  v2 = *(void **)(a1 + 152);
  if (v2)
  {
    if (*(int *)(a1 + 160) >= 1)
    {
      uint64_t v4 = 0LL;
      uint64_t v5 = 0LL;
      do
      {
        sub_1000099C4((void **)(*(void *)(a1 + 152) + v4));
        ++v5;
        v4 += 8LL;
      }

      while (v5 < *(int *)(a1 + 160));
      v2 = *v3;
    }

    free(v2);
  }

  *unint64_t v3 = 0LL;
  *(void *)(a1 + 160) = 0LL;
}

CFDataRef sub_100009764(const __CFString *a1)
{
  LODWORD(length) = 0;
  os_log_t v1 = sub_1000090C8(a1, 0x8000100u);
  uint64_t v6 = v1;
  if (!v1) {
    return 0LL;
  }
  v2 = v1;
  unint64_t v3 = (UInt8 *)sub_1000090FC((uint64_t)&v6, 1, 0LL, &length, 0);
  free(v2);
  if (!v3) {
    return 0LL;
  }
  CFDataRef v4 = CFDataCreate(0LL, v3, (int)length);
  free(v3);
  return v4;
}

double sub_1000097F0(_OWORD *a1)
{
  if (!*((_BYTE *)a1 + 128))
  {
    v2 = (_OWORD *)*((void *)a1 + 17);
    if (v2) {
      BOOL v3 = v2 == a1;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      free(v2);
    }
  }

  *((void *)a1 + 18) = 0LL;
  double result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

int *sub_100009844(int *result, size_t __size)
{
  int v2 = __size;
  uint64_t v3 = (uint64_t)result;
  uint64_t v4 = result[11];
  if ((_DWORD)v4 == result[10])
  {
    result[11] = 2 * v4;
    uint64_t v5 = (void *)*((void *)result + 4);
    if (v5 == (void *)v3)
    {
      uint64_t v6 = malloc(8 * v4);
      *(void *)(v3 + 32) = v6;
      double result = (int *)memmove(v6, (const void *)v3, 4 * v4);
    }

    else
    {
      double result = (int *)reallocf(v5, 8 * v4);
      *(void *)(v3 + 32) = result;
    }
  }

  uint64_t v7 = *(void *)(v3 + 32);
  uint64_t v8 = *(int *)(v3 + 40);
  *(_DWORD *)(v3 + 40) = v8 + 1;
  *(_DWORD *)(v7 + 4 * v8) = v2;
  return result;
}

uint64_t sub_1000098CC(uint64_t a1, void *__src, int a3)
{
  int v7 = *(_DWORD *)(a1 + 144);
  int v6 = *(_DWORD *)(a1 + 148);
  if (v6 - v7 >= a3)
  {
    uint64_t v9 = *(char **)(a1 + 136);
  }

  else
  {
    if (*(_BYTE *)(a1 + 128))
    {
      fprintf(__stderrp, "user-supplied buffer failed to add data with length %d (> %d)\n", a3, v6 - v7);
      return 0LL;
    }

    if (a3 <= 128) {
      int v10 = 128;
    }
    else {
      int v10 = a3;
    }
    int v11 = v6 + v10;
    *(_DWORD *)(a1 + 148) = v11;
    uint64_t v12 = *(void **)(a1 + 136);
    if (v12 == (void *)a1)
    {
      uint64_t v9 = (char *)malloc(v11);
      *(void *)(a1 + 136) = v9;
      memcpy(v9, (const void *)a1, v7);
    }

    else
    {
      uint64_t v9 = (char *)reallocf(v12, v11);
      *(void *)(a1 + 136) = v9;
      int v7 = *(_DWORD *)(a1 + 144);
    }
  }

  memcpy(&v9[v7], __src, a3);
  *(_DWORD *)(a1 + 144) += a3;
  return 1LL;
}

void sub_1000099C4(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (*a1)
    {
      uint64_t v3 = (void *)v2[4];
      if (v3) {
        BOOL v4 = v3 == v2;
      }
      else {
        BOOL v4 = 1;
      }
      if (!v4) {
        free(v3);
      }
      free(v2);
      *a1 = 0LL;
    }
  }

uint64_t sub_100009A0C(uint64_t result)
{
  qword_100010C30 = result;
  return result;
}

uint64_t sub_100009A18()
{
  return qword_100010C30;
}

void sub_100009A24()
{
  __assert_rtn( "set_valid_necessary_fields",  "IPHPvDInfoRequestServer.m",  615,  "CFDictionaryGetCount(additionalInfoDict) == NECESSARY_FIELDS_COUNT");
}

id objc_msgSend_xpcClientCompletionHandler(void *a1, const char *a2, ...)
{
  return [a1 xpcClientCompletionHandler];
}