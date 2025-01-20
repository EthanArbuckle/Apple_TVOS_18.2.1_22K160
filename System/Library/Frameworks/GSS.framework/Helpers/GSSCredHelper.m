@interface GSSCredHelper
+ (void)do_Acquire:(id)a3 request:(id)a4 reply:(id)a5;
+ (void)do_Refresh:(id)a3 request:(id)a4 reply:(id)a5;
@end

@implementation GSSCredHelper

+ (void)do_Acquire:(id)a3 request:(id)a4 reply:(id)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v81 = 0LL;
  objc_storeStrong(&v81, a4);
  id xdict = 0LL;
  objc_storeStrong(&xdict, a5);
  os_log_t oslog = (os_log_t)sub_100017B24();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    id v24 = [location[0] bundleIdentifier];
    sub_1000045F4((uint64_t)v105, (uint64_t)v24);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, type, "do_Acquire %@", v105, 0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  krb5_error_code inited = 0;
  krb5_ccache cache = 0LL;
  opt = 0LL;
  krb5_principal principal = 0LL;
  krb5_context context = 0LL;
  uint64_t v71 = 0LL;
  uint64_t cred_endtime = 0LL;
  krb5_set_home_dir_access(0LL, 0LL);
  krb5_error_code inited = krb5_init_context(&context);
  if (inited)
  {
    os_log_t v69 = (os_log_t)sub_100017B24();
    os_log_type_t v68 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      sub_10000E76C((uint64_t)v103, inited);
      _os_log_error_impl((void *)&_mh_execute_header, v69, v68, "Failed to initialize context: %d", v103, 8u);
    }

    objc_storeStrong((id *)&v69, 0LL);
    v101 = @"status";
    v23 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", inited);
    v102 = v23;
    v67 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v102,  &v101,  1LL);

    os_log_t v66 = (os_log_t)sub_100017B24();
    os_log_type_t v65 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v100, (uint64_t)v67);
      _os_log_debug_impl((void *)&_mh_execute_header, v66, v65, "do_Acquire results: %@", v100, 0xCu);
    }

    objc_storeStrong((id *)&v66, 0LL);
    xpc_object_t value = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(v67);
    xpc_dictionary_set_value(xdict, "result", value);
    int v63 = 1;
    objc_storeStrong(&value, 0LL);
    objc_storeStrong((id *)&v67, 0LL);
  }

  else
  {
    id v62 = 0LL;
    id v61 = 0LL;
    id v60 = 0LL;
    id v59 = xpc_dictionary_get_value(v81, "attributes");
    id v84 = (id)_CFXPCCreateCFObjectFromXPCObject(v59);
    id v58 = v84;
    if (v58)
    {
      id v5 = [v58 mutableCopy];
      id v6 = v62;
      id v62 = v5;

      [v62 removeObjectForKey:@"kHEIMAttrData"];
      os_log_t v55 = (os_log_t)sub_100017B24();
      os_log_type_t v54 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        sub_1000045F4((uint64_t)v98, (uint64_t)v62);
        _os_log_debug_impl((void *)&_mh_execute_header, v55, v54, "attributes for acquire: %@", v98, 0xCu);
      }

      objc_storeStrong((id *)&v55, 0LL);
      id v21 = [v58 objectForKeyedSubscript:@"kHEIMAttrParentCredential"];
      id v85 = 0LL;
      objc_storeStrong(&v85, v21);
      v22 = (const __CFUUID *)v85;
      objc_storeStrong(&v85, 0LL);

      CFUUIDRef uuid = v22;
      if (v22)
      {
        CFUUIDBytes v50 = CFUUIDGetUUIDBytes(uuid);
        CFUUIDBytes v104 = v50;
        os_log_t v49 = (os_log_t)sub_100017B24();
        os_log_type_t v48 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v18 = v49;
          os_log_type_t v19 = v48;
          id v83 = (id)CFUUIDCreateString(0LL, uuid);
          id v20 = v83;
          id v47 = v20;
          sub_1000045F4((uint64_t)v96, (uint64_t)v47);
          _os_log_debug_impl((void *)&_mh_execute_header, v18, v19, "using cache: %@", v96, 0xCu);

          objc_storeStrong(&v47, 0LL);
        }

        objc_storeStrong((id *)&v49, 0LL);
        CFRelease(uuid);
        id v7 = [v58 objectForKeyedSubscript:@"kHEIMAttrData"];
        id v8 = v61;
        id v61 = v7;

        if (v61)
        {
          v9 = objc_alloc(&OBJC_CLASS___NSString);
          v10 = -[NSString initWithData:encoding:](v9, "initWithData:encoding:", v61, 4LL);
          id v11 = v60;
          id v60 = v10;

          krb5_error_code inited = krb5_cc_resolve_by_uuid(context, "XCACHE", &cache, &v104);
          if (inited)
          {
            os_log_t v44 = (os_log_t)sub_100017B24();
            os_log_type_t v43 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              int v12 = [location[0] session];
              sub_100018D2C((uint64_t)v94, v12, inited);
              _os_log_error_impl((void *)&_mh_execute_header, v44, v43, "unable to find cache %d, %d", v94, 0xEu);
            }

            objc_storeStrong((id *)&v44, 0LL);
          }

          else
          {
            krb5_error_code inited = krb5_cc_get_principal(context, cache, &principal);
            if (inited)
            {
              os_log_t v42 = (os_log_t)sub_100017B24();
              os_log_type_t v41 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                int v13 = [location[0] session];
                sub_100018D2C((uint64_t)v93, v13, inited);
                _os_log_error_impl( (void *)&_mh_execute_header,  v42,  v41,  "unable to retrieve principal %d, %d",  v93,  0xEu);
              }

              objc_storeStrong((id *)&v42, 0LL);
            }

            else
            {
              krb5_error_code inited = krb5_get_init_creds_opt_alloc(context, &opt);
              if (!inited)
              {
                uint64_t realm = krb5_principal_get_realm(context, principal);
                krb5_get_init_creds_opt_set_default_flags(context, "gsscred", realm, opt);
                krb5_get_init_creds_opt_set_forwardable(opt, 1);
                krb5_get_init_creds_opt_set_proxiable(opt, 1);
                krb5_get_init_creds_opt_set_canonicalize((krb5_get_init_creds_opt *)context, (int)opt);
                krb5_get_init_creds_opt_set_win2k(context, opt, 1LL);
                krb5_error_code inited = krb5_init_creds_init(context, principal, 0LL, 0LL, 0LL, opt, &v71);
                if (inited)
                {
                  os_log_t v40 = (os_log_t)sub_100017B24();
                  os_log_type_t v39 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    int v14 = [location[0] session];
                    sub_100018D2C((uint64_t)v92, v14, inited);
                    _os_log_error_impl( (void *)&_mh_execute_header,  v40,  v39,  "unable to init cred context %d, %d",  v92,  0xEu);
                  }

                  objc_storeStrong((id *)&v40, 0LL);
                }

                else
                {
                  krb5_error_code inited = krb5_init_creds_set_password( context, v71, [v60 UTF8String]);
                  objc_storeStrong(&v60, 0LL);
                  if (inited)
                  {
                    os_log_t v38 = (os_log_t)sub_100017B24();
                    os_log_type_t v37 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      int v15 = [location[0] session];
                      sub_100018D2C((uint64_t)v91, v15, inited);
                      _os_log_error_impl( (void *)&_mh_execute_header,  v38,  v37,  "unable to set password %d, %d",  v91,  0xEu);
                    }

                    objc_storeStrong((id *)&v38, 0LL);
                  }

                  else
                  {
                    krb5_error_code inited = krb5_init_creds_get(context, v71);
                    if (inited)
                    {
                      error_message = (char *)krb5_get_error_message(context, inited);
                      os_log_t v35 = (os_log_t)sub_100017B24();
                      os_log_type_t v34 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                      {
                        sub_10001364C((uint64_t)v90, (uint64_t)error_message);
                        _os_log_error_impl( (void *)&_mh_execute_header,  v35,  v34,  "Failed to acquire credentials for cache: %s",  v90,  0xCu);
                      }

                      objc_storeStrong((id *)&v35, 0LL);
                      krb5_free_error_message(context, error_message);
                    }

                    else
                    {
                      krb5_error_code inited = krb5_init_creds_store(context, v71, cache);
                      if (!inited) {
                        krb5_error_code inited = krb5_init_creds_store_config(context, v71, cache);
                      }
                      if (inited)
                      {
                        v33 = (char *)krb5_get_error_message(context, inited);
                        os_log_t v32 = (os_log_t)sub_100017B24();
                        os_log_type_t v31 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                        {
                          sub_1000125B0((uint64_t)v89, (int)[location[0] session], (uint64_t)v33);
                          _os_log_error_impl( (void *)&_mh_execute_header,  v32,  v31,  "Failed to store credentials for cache %d: %s",  v89,  0x12u);
                        }

                        objc_storeStrong((id *)&v32, 0LL);
                        krb5_free_error_message(context, v33);
                      }

                      else
                      {
                        uint64_t cred_endtime = _krb5_init_creds_get_cred_endtime(context, v71);
                      }
                    }
                  }
                }
              }
            }
          }
        }

        else
        {
          os_log_t v46 = (os_log_t)sub_100017B24();
          os_log_type_t v45 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            sub_10000E76C((uint64_t)v95, (int)[location[0] session]);
            _os_log_error_impl( (void *)&_mh_execute_header,  v46,  v45,  "unable to acquire credential without password %d",  v95,  8u);
          }

          objc_storeStrong((id *)&v46, 0LL);
          krb5_error_code inited = -1765328188;
        }
      }

      else
      {
        os_log_t v52 = (os_log_t)sub_100017B24();
        os_log_type_t v51 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          sub_10000E76C((uint64_t)v97, (int)[location[0] session]);
          _os_log_error_impl( (void *)&_mh_execute_header,  v52,  v51,  "unable to acquire credential without cache uuid %d",  v97,  8u);
        }

        objc_storeStrong((id *)&v52, 0LL);
        krb5_error_code inited = -1765328188;
      }
    }

    else
    {
      os_log_t v57 = (os_log_t)sub_100017B24();
      os_log_type_t v56 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        sub_10000E76C((uint64_t)v99, (int)[location[0] session]);
        _os_log_error_impl( (void *)&_mh_execute_header,  v57,  v56,  "unable to acquire credential without attributes %d",  v99,  8u);
      }

      objc_storeStrong((id *)&v57, 0LL);
      krb5_error_code inited = -1765328188;
    }

    if (v71)
    {
      krb5_init_creds_free(context, v71);
      uint64_t v71 = 0LL;
    }

    if (opt)
    {
      krb5_get_init_creds_opt_free(context, opt);
      opt = 0LL;
    }

    v87[0] = @"status";
    v17 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", inited);
    v88[0] = v17;
    v87[1] = @"expire";
    v16 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", cred_endtime);
    v88[1] = v16;
    v30 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v88,  v87,  2LL);

    os_log_t v29 = (os_log_t)sub_100017B24();
    os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v86, (uint64_t)v30);
      _os_log_debug_impl((void *)&_mh_execute_header, v29, v28, "do_Acquire results: %@", v86, 0xCu);
    }

    objc_storeStrong((id *)&v29, 0LL);
    xpc_object_t v27 = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(v30);
    xpc_dictionary_set_value(xdict, "result", v27);
    krb5_cc_close(context, cache);
    krb5_free_principal(context, principal);
    krb5_free_context(context);
    objc_storeStrong(&v27, 0LL);
    objc_storeStrong((id *)&v30, 0LL);
    objc_storeStrong(&v58, 0LL);
    objc_storeStrong(&v59, 0LL);
    objc_storeStrong(&v60, 0LL);
    objc_storeStrong(&v61, 0LL);
    objc_storeStrong(&v62, 0LL);
    int v63 = 0;
  }

  objc_storeStrong(&xdict, 0LL);
  objc_storeStrong(&v81, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (void)do_Refresh:(id)a3 request:(id)a4 reply:(id)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v118 = 0LL;
  objc_storeStrong(&v118, a4);
  id xdict = 0LL;
  objc_storeStrong(&xdict, a5);
  os_log_t oslog = (os_log_t)sub_100017B24();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    id v31 = [location[0] bundleIdentifier];
    sub_1000045F4((uint64_t)v147, (uint64_t)v31);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, type, "do_Refresh %@", v147, 0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  v112 = 0LL;
  uint64_t realm = 0LL;
  krb5_ccache cache = 0LL;
  krb5_ccache id = 0LL;
  krb5_context context = 0LL;
  opt = 0LL;
  id v103 = 0LL;
  id v102 = 0LL;
  id v101 = 0LL;
  uint64_t v100 = 0LL;
  krb5_set_home_dir_access(0LL, 0LL);
  unsigned int inited = krb5_init_context(&context);
  if (inited)
  {
    os_log_t v99 = (os_log_t)sub_100017B24();
    os_log_type_t v98 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      sub_10000E76C((uint64_t)v145, inited);
      _os_log_error_impl((void *)&_mh_execute_header, v99, v98, "Failed to initialize context: %d", v145, 8u);
    }

    objc_storeStrong((id *)&v99, 0LL);
    v143 = @"status";
    v30 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", inited);
    v144 = v30;
    v97 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v144,  &v143,  1LL);

    os_log_t v96 = (os_log_t)sub_100017B24();
    os_log_type_t v95 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v142, (uint64_t)v97);
      _os_log_debug_impl((void *)&_mh_execute_header, v96, v95, "do_Refresh results: %@", v142, 0xCu);
    }

    objc_storeStrong((id *)&v96, 0LL);
    xpc_object_t value = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(v97);
    xpc_dictionary_set_value(xdict, "result", value);
    int v93 = 1;
    objc_storeStrong(&value, 0LL);
    objc_storeStrong((id *)&v97, 0LL);
    goto LABEL_109;
  }

  memset(__b, 0, sizeof(__b));
  id v92 = xpc_dictionary_get_value(v118, "attributes");
  id v121 = (id)_CFXPCCreateCFObjectFromXPCObject(v92);
  id v91 = v121;
  if (v91)
  {
    id v5 = [v91 mutableCopy];
    id v6 = v101;
    id v101 = v5;

    [v101 removeObjectForKey:@"kHEIMAttrData"];
    os_log_t v88 = (os_log_t)sub_100017B24();
    os_log_type_t v87 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v140, (uint64_t)v101);
      _os_log_debug_impl((void *)&_mh_execute_header, v88, v87, "attributes for refresh: %@", v140, 0xCu);
    }

    objc_storeStrong((id *)&v88, 0LL);
    id v28 = [v91 objectForKeyedSubscript:@"kHEIMAttrParentCredential"];
    id v122 = 0LL;
    objc_storeStrong(&v122, v28);
    os_log_t v29 = (const __CFUUID *)v122;
    objc_storeStrong(&v122, 0LL);

    CFUUIDRef uuid = v29;
    if (v29)
    {
      CFUUIDBytes v83 = CFUUIDGetUUIDBytes(uuid);
      CFUUIDBytes v146 = v83;
      os_log_t v82 = (os_log_t)sub_100017B24();
      os_log_type_t v81 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        v25 = v82;
        os_log_type_t v26 = v81;
        id v120 = (id)CFUUIDCreateString(0LL, uuid);
        id v27 = v120;
        id v80 = v27;
        sub_1000045F4((uint64_t)v138, (uint64_t)v80);
        _os_log_debug_impl((void *)&_mh_execute_header, v25, v26, "using cache: %@", v138, 0xCu);

        objc_storeStrong(&v80, 0LL);
      }

      objc_storeStrong((id *)&v82, 0LL);
      CFRelease(uuid);
      id v7 = [v91 objectForKeyedSubscript:@"kHEIMAttrClientName"];
      id v8 = v103;
      id v103 = v7;

      if (v103)
      {
        os_log_t v77 = (os_log_t)sub_100017B24();
        os_log_type_t v76 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          sub_1000045F4((uint64_t)v136, (uint64_t)v103);
          _os_log_debug_impl((void *)&_mh_execute_header, v77, v76, "using clientName: %@", v136, 0xCu);
        }

        objc_storeStrong((id *)&v77, 0LL);
        unsigned int inited = krb5_parse_name( context, (const char *)[v103 UTF8String], (krb5_principal *)__b);
        if (!inited)
        {
          id v9 = [v91 objectForKeyedSubscript:@"kHEIMAttrServerName"];
          id v10 = v102;
          id v102 = v9;

          if (v102)
          {
            os_log_t v72 = (os_log_t)sub_100017B24();
            os_log_type_t v71 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              sub_1000045F4((uint64_t)v135, (uint64_t)v102);
              _os_log_debug_impl((void *)&_mh_execute_header, v72, v71, "using serverName: %@", v135, 0xCu);
            }

            objc_storeStrong((id *)&v72, 0LL);
            unsigned int inited = krb5_parse_name( context, (const char *)[v102 UTF8String], (krb5_principal *)&__b[8]);
            if (inited)
            {
              os_log_t v70 = (os_log_t)sub_100017B24();
              os_log_type_t v69 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                sub_1000045F4((uint64_t)v134, (uint64_t)v102);
                _os_log_error_impl( (void *)&_mh_execute_header,  v70,  v69,  "Failed to copy service principal: %@",  v134,  0xCu);
              }

              objc_storeStrong((id *)&v70, 0LL);
              goto LABEL_98;
            }
          }

          else
          {
            uint64_t realm = krb5_principal_get_realm(context, *(void *)__b);
            krb5_free_principal(context, *(krb5_principal *)&__b[8]);
            unsigned int inited = krb5_make_principal(context, &__b[8], realm);
            if (inited)
            {
              os_log_t v68 = (os_log_t)sub_100017B24();
              os_log_type_t v67 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                sub_10001364C((uint64_t)v133, realm);
                _os_log_error_impl( (void *)&_mh_execute_header,  v68,  v67,  "Failed to make TGS principal for realm: %s",  v133,  0xCu);
              }

              objc_storeStrong((id *)&v68, 0LL);
              goto LABEL_98;
            }
          }

          unsigned int inited = krb5_get_init_creds_opt_alloc(context, &opt);
          if (!inited)
          {
            krb5_get_init_creds_opt_set_default_flags(context, "gsscred", realm, opt);
            if ((opt->flags & 1) != 0) {
              *(void *)&__b[56] = time(0LL) + *(void *)&opt->renew_life;
            }
            if ((opt->flags & 2) != 0) {
              *(void *)&__b[64] = time(0LL) + *(void *)&opt->proxiable;
            }
            else {
              *(void *)&__b[64] = time(0LL) + 604800;
            }
            unsigned int v109 = 1073742080;
            unsigned int inited = krb5_cc_resolve_by_uuid(context, "XCACHE", &cache, &v146);
            if (inited)
            {
              os_log_t v66 = (os_log_t)sub_100017B24();
              os_log_type_t v65 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                id v21 = v66;
                os_log_type_t v22 = v65;
                sub_100002064(v64);
                _os_log_error_impl((void *)&_mh_execute_header, v21, v22, "Failed to resolve cache using uuid", v64, 2u);
              }

              objc_storeStrong((id *)&v66, 0LL);
            }

            else
            {
              krb5_free_principal(context, *(krb5_principal *)__b);
              *(void *)__b = 0LL;
              unsigned int inited = krb5_cc_get_principal(context, cache, (krb5_principal *)__b);
              if (inited)
              {
                os_log_t v63 = (os_log_t)sub_100017B24();
                os_log_type_t v62 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                {
                  os_log_type_t v19 = v63;
                  os_log_type_t v20 = v62;
                  sub_100002064(v61);
                  _os_log_error_impl( (void *)&_mh_execute_header,  v19,  v20,  "Failed to retrieve principal from cache",  v61,  2u);
                }

                objc_storeStrong((id *)&v63, 0LL);
              }

              else if (*(void *)__b)
              {
                ((void (*)(void))krb5_cc_clear_mcred)();
                v57.client = *(krb5_principal *)&__b[8];
                *(void *)&v57.magic = *(void *)__b;
                unsigned int inited = krb5_cc_retrieve_cred(context, cache, 0, &v57, &creds);
                if (!inited)
                {
                  os_log_t v56 = (os_log_t)sub_100017B24();
                  os_log_type_t v55 = OS_LOG_TYPE_DEBUG;
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                  {
                    int v15 = v56;
                    os_log_type_t v16 = v55;
                    sub_100002064(v54);
                    _os_log_debug_impl((void *)&_mh_execute_header, v15, v16, "found previous ticket", v54, 2u);
                  }

                  objc_storeStrong((id *)&v56, 0LL);
                  unsigned int v109 = v109 & 0xFFFFFFFD | (2 * ((v111 & 2) != 0));
                  unsigned int v109 = v109 & 0xFFFFFFF7 | (8 * ((v111 & 8) != 0));
                  krb5_free_cred_contents(context, &creds);
                }

                krb5_cc_clear_mcred(&v57);
                unsigned int inited = krb5_get_kdc_cred(context, cache, v109, 0LL, 0LL, __b, &v112);
                if (inited)
                {
                  os_log_t v53 = (os_log_t)sub_100017B24();
                  os_log_type_t v52 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    sub_100012604((uint64_t)v132, (uint64_t)v103, inited);
                    _os_log_error_impl( (void *)&_mh_execute_header,  v53,  v52,  "Failed to renew credentials for cache: %@, %d",  v132,  0x12u);
                  }

                  objc_storeStrong((id *)&v53, 0LL);
                }

                else
                {
                  unsigned int inited = krb5_cc_new_unique( context, "XCTEMP", (const char *)[v103 UTF8String], &id);
                  if (inited)
                  {
                    os_log_t v51 = (os_log_t)sub_100017B24();
                    os_log_type_t v50 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      sub_10000E76C((uint64_t)v131, inited);
                      _os_log_error_impl( (void *)&_mh_execute_header,  v51,  v50,  "error in krb5_cc_initialize: %d",  v131,  8u);
                    }

                    objc_storeStrong((id *)&v51, 0LL);
                  }

                  else
                  {
                    unsigned int inited = krb5_cc_initialize(context, id, *(krb5_principal *)__b);
                    if (inited)
                    {
                      os_log_t v49 = (os_log_t)sub_100017B24();
                      os_log_type_t v48 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                      {
                        sub_10000E76C((uint64_t)v130, inited);
                        _os_log_error_impl( (void *)&_mh_execute_header,  v49,  v48,  "error in krb5_cc_initialize: %d",  v130,  8u);
                      }

                      objc_storeStrong((id *)&v49, 0LL);
                    }

                    else
                    {
                      unsigned int inited = krb5_cc_store_cred(context, id, v112);
                      if (inited)
                      {
                        krb5_warn(context, inited, "krb5_cc_initialize");
                        os_log_t v47 = (os_log_t)sub_100017B24();
                        os_log_type_t v46 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                        {
                          sub_10000E76C((uint64_t)v129, inited);
                          _os_log_error_impl( (void *)&_mh_execute_header,  v47,  v46,  "error in krb5_cc_store_cred: %d",  v129,  8u);
                        }

                        objc_storeStrong((id *)&v47, 0LL);
                      }

                      else
                      {
                        unsigned int inited = krb5_cc_start_seq_get(context, cache, &cursor);
                        if (inited)
                        {
                          os_log_t v43 = (os_log_t)sub_100017B24();
                          os_log_type_t v42 = OS_LOG_TYPE_ERROR;
                          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                          {
                            sub_10000E76C((uint64_t)v128, inited);
                            _os_log_error_impl( (void *)&_mh_execute_header,  v43,  v42,  "error in krb5_cc_start_seq_get: %d",  v128,  8u);
                          }

                          objc_storeStrong((id *)&v43, 0LL);
                        }

                        else
                        {
                          while (1)
                          {
                            unsigned int inited = krb5_cc_next_cred(context, cache, &cursor, &v44);
                            if (inited) {
                              break;
                            }
                            if (!krb5_is_config_principal(context, v44.client))
                            {
                              unsigned int inited = krb5_cc_remove_cred(context, cache, 0, &v44);
                              if (inited)
                              {
                                os_log_t v41 = (os_log_t)sub_100017B24();
                                os_log_type_t v40 = OS_LOG_TYPE_ERROR;
                                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                                {
                                  int v14 = v41;
                                  sub_10000E76C((uint64_t)v127, inited);
                                  _os_log_error_impl( (void *)&_mh_execute_header,  v14,  v40,  "error in krb5_cc_remove_cred: %d",  v127,  8u);
                                }

                                objc_storeStrong((id *)&v41, 0LL);
                              }
                            }

                            krb5_free_cred_contents(context, &v44);
                          }

                          krb5_cc_end_seq_get(context, cache, &cursor);
                          unsigned int inited = krb5_cc_store_cred(context, cache, v112);
                          if (inited)
                          {
                            os_log_t v39 = (os_log_t)sub_100017B24();
                            os_log_type_t v38 = OS_LOG_TYPE_ERROR;
                            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                            {
                              int v11 = [location[0] session];
                              sub_100018D2C((uint64_t)v126, v11, inited);
                              _os_log_error_impl( (void *)&_mh_execute_header,  v39,  v38,  "unable to save cred in cache: %d, %d",  v126,  0xEu);
                            }

                            objc_storeStrong((id *)&v39, 0LL);
                          }

                          uint64_t v100 = *(void *)&v112->times.endtime;
                        }
                      }
                    }
                  }
                }
              }

              else
              {
                unsigned int inited = -1765328188;
                os_log_t v60 = (os_log_t)sub_100017B24();
                os_log_type_t v59 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                {
                  v17 = v60;
                  os_log_type_t v18 = v59;
                  sub_100002064(v58);
                  _os_log_error_impl((void *)&_mh_execute_header, v17, v18, "Principal can not be NULL", v58, 2u);
                }

                objc_storeStrong((id *)&v60, 0LL);
              }
            }
          }

          goto LABEL_98;
        }

        os_log_t v75 = (os_log_t)sub_100017B24();
        os_log_type_t v74 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          v23 = v75;
          os_log_type_t v24 = v74;
          sub_100002064(v73);
          _os_log_error_impl((void *)&_mh_execute_header, v23, v24, "Failed to parse clientname", v73, 2u);
        }

        objc_storeStrong((id *)&v75, 0LL);
      }

      else
      {
        os_log_t v79 = (os_log_t)sub_100017B24();
        os_log_type_t v78 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          sub_10000E76C((uint64_t)v137, (int)[location[0] session]);
          _os_log_error_impl( (void *)&_mh_execute_header,  v79,  v78,  "unable to acquire credential without principal: %d",  v137,  8u);
        }

        objc_storeStrong((id *)&v79, 0LL);
        unsigned int inited = -1765328188;
      }
    }

    else
    {
      os_log_t v85 = (os_log_t)sub_100017B24();
      os_log_type_t v84 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        sub_10000E76C((uint64_t)v139, (int)[location[0] session]);
        _os_log_error_impl( (void *)&_mh_execute_header,  v85,  v84,  "unable to acquire credential without cache uuid %d",  v139,  8u);
      }

      objc_storeStrong((id *)&v85, 0LL);
      unsigned int inited = -1765328188;
    }
  }

  else
  {
    os_log_t v90 = (os_log_t)sub_100017B24();
    os_log_type_t v89 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      sub_10000E76C((uint64_t)v141, (int)[location[0] session]);
      _os_log_error_impl( (void *)&_mh_execute_header,  v90,  v89,  "unable to acquire credential without attributes: %d",  v141,  8u);
    }

    objc_storeStrong((id *)&v90, 0LL);
    unsigned int inited = -1765328188;
  }

@end