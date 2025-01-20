void start()
{
  _xpc_connection_s *mach_service;
  uint8_t buf[4];
  uint64_t v2;
  qword_1000100E8 = time(0LL);
  if (sub_100001EFC())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.coresymbolicationd", 0LL, 1uLL);
    qword_1000100E0 = (uint64_t)mach_service;
    if (mach_service)
    {
      xpc_connection_set_event_handler(mach_service, &stru_10000C4E0);
      sub_100003544();
      xpc_connection_resume((xpc_connection_t)qword_1000100E0);
      dispatch_main();
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to acquire mach service port, exiting\n",  buf,  2u);
    }

    fwrite("Unable to acquire mach service port, exiting\n", 0x2DuLL, 1uLL, __stderrp);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v2 = qword_1000100D8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to open storage at %s\n",  buf,  0xCu);
    }

    fprintf(__stderrp, "Unable to open storage at %s\n", (const char *)qword_1000100D8);
  }

  sub_100003528();
  exit(1);
}

BOOL sub_100001EFC()
{
  v0 = off_100010000;
  if (off_100010000) {
    BOOL v1 = qword_1000100D8 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (!off_100010000)
    {
      v0 = "/private/var/root/Library/Caches/com.apple.coresymbolicationd";
      off_100010000 = "/private/var/root/Library/Caches/com.apple.coresymbolicationd";
    }

    size_t v2 = strlen(v0);
    size_t v16 = 128LL;
    if (sysctlbyname("kern.osversion", __s, &v16, 0LL, 0LL))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to determine os version, exiting\n",  buf,  2u);
      }

      fwrite("Unable to determine os version, exiting\n", 0x28uLL, 1uLL, __stderrp);
    }

    size_t v3 = v2 + strlen(__s) + 2;
    v4 = (char *)malloc(v3);
    *(_WORD *)&v4[strlcpy(v4, off_100010000, v3)] = 47;
    strlcat(v4, __s, v3);
    qword_1000100D8 = (uint64_t)v4;
    if (!v4 || (v0 = off_100010000) == 0LL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Out of memory",  buf,  2u);
      }

      fwrite("Out of memory", 0xDuLL, 1uLL, __stderrp);
      return 0LL;
    }
  }

  v5 = strdup(v0);
  for (i = v5 + 1; *i == 47; ++i)
  {
    _BYTE *i = 0;
    if (mkdir(v5, 0x1C0u) == -1 && *__error() != 17) {
      goto LABEL_25;
    }
    _BYTE *i = 47;
LABEL_21:
    ;
  }

  if (*i) {
    goto LABEL_21;
  }
  if (*(i - 1) != 47 && mkdir(v5, 0x1C0u) == -1) {
    __error();
  }
LABEL_25:
  free(v5);
  v7 = opendir(off_100010000);
  v8 = v7;
  if (v7)
  {
    int v9 = dirfd(v7);
    for (j = readdir(v8); j; j = readdir(v8))
    {
      d_name = j->d_name;
      if (!strncmp(j->d_name, "grow.", 5uLL)) {
        unlinkat(v9, d_name, 0);
      }
    }

    closedir(v8);
  }

  *(void *)__s = 0LL;
  v18 = __s;
  uint64_t v19 = 0x2000000000LL;
  char v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000LL;
  v14[2] = sub_100003768;
  v14[3] = &unk_10000C528;
  v14[4] = __s;
  sub_1000036B0((uint64_t)v14);
  BOOL v12 = v18[24] != 0;
  _Block_object_dispose(__s, 8);
  return v12;
}

void sub_100002224( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_100002244(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_100002544;
    handler[3] = &unk_10000C500;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (a2 == &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        string = xpc_dictionary_get_string(&_xpc_error_connection_invalid, _xpc_error_key_description);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Top level listener XPC_ERROR_CONNECTION_INVALID: %s\n",  buf,  0xCu);
      }

      v6 = __stderrp;
      xpc_dictionary_get_string(&_xpc_error_connection_invalid, _xpc_error_key_description);
      fprintf(v6, "Top level listener XPC_ERROR_CONNECTION_INVALID: %s\n");
    }

    else
    {
      BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (a2 == &_xpc_error_termination_imminent)
      {
        if (v4)
        {
          *(_DWORD *)buf = 136315138;
          string = xpc_dictionary_get_string(&_xpc_error_termination_imminent, _xpc_error_key_description);
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Top level listener XPC_ERROR_TERMINATION_IMMINENT: %s\n",  buf,  0xCu);
        }

        v7 = __stderrp;
        xpc_dictionary_get_string(&_xpc_error_termination_imminent, _xpc_error_key_description);
        fprintf(v7, "Top level listener XPC_ERROR_TERMINATION_IMMINENT: %s\n");
      }

      else
      {
        if (v4)
        {
          *(_DWORD *)buf = 136315138;
          string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Top level listener error: %s\n",  buf,  0xCu);
        }

        v5 = __stderrp;
        xpc_dictionary_get_string(a2, _xpc_error_key_description);
        fprintf(v5, "Top level listener error: %s\n");
      }
    }

    uint64_t v8 = sub_1000036B0((uint64_t)&stru_10000C6C8);
    xpc_transaction_exit_clean(v8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Top level event: Unhandled xpc type\n",  buf,  2u);
    }

    fwrite("Top level event: Unhandled xpc type\n", 0x24uLL, 1uLL, __stderrp);
  }
}

void **sub_100002544(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32) && sub_100009CD8((uint64_t)&v6))
  {
    size_t v3 = *(_xpc_connection_s **)(a1 + 32);
    BOOL v4 = (void *)sub_100009CD8((uint64_t)&v6);
    xpc_connection_send_message(v3, v4);
  }

  return sub_100009CA4(&v6);
}

void sub_1000025A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

xpc_object_t *sub_1000025BC@<X0>( xpc_object_t object@<X1>, _xpc_connection_s *a2@<X0>, xpc_object_t *a3@<X8>)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error) {
    return sub_100009D00(a3);
  }
  if (a2)
  {
    uid_t euid = xpc_connection_get_euid(a2);
    sub_100009D34(&v109, object, 1);
    sub_100009DC8(&v109, a3);
  }

  else
  {
    uid_t euid = geteuid();
    sub_100009D34(&v109, object, 1);
    sub_100009D00(a3);
  }

  switch(xpc_dictionary_get_uint64(object, "cmd"))
  {
    case 2uLL:
      sub_100009C64(&v106, &v109);
      __p = 0LL;
      v111 = 0LL;
      v112 = 0LL;
      sub_100009D90(&v106, "filters", &v117);
      if (sub_100009CE0(&v117) && sub_100009CF0((xpc_type_t *)&v117) == (xpc_type_t)&_xpc_type_array)
      {
        sub_100009C64(&region, (void **)&v117);
        size_t v8 = sub_100009E20(&region);
        if (v8)
        {
          size_t v9 = 0LL;
          for (i = 0; i < v8; size_t v9 = ++i)
          {
            sub_100009E38(&region, v9, &v115);
            if (sub_100009CF0((xpc_type_t *)&v115) == (xpc_type_t)&_xpc_type_array)
            {
              sub_100009C64(&v114, &v115);
              sub_100005BE4(&v118, &v114);
              sub_100009CD4(&v114);
              if (euid) {
                LODWORD(v120[0]) = euid;
              }
              v11 = v111;
              if (v111 >= v112)
              {
                size_t v16 = (__n128 *)__p;
                uint64_t v17 = 0x6DB6DB6DB6DB6DB7LL * (((char *)v111 - (_BYTE *)__p) >> 3);
                unint64_t v18 = v17 + 1;
                else {
                  unint64_t v19 = v18;
                }
                if (v19)
                {
                  char v20 = (char *)sub_100003DCC((uint64_t)&v112, v19);
                  size_t v16 = (__n128 *)__p;
                  v11 = v111;
                }

                else
                {
                  char v20 = 0LL;
                }

                v21 = &v20[56 * v17];
                __n128 v22 = v118;
                __n128 v23 = v119;
                __int128 v24 = *(_OWORD *)v120;
                *((void *)v21 + 6) = v121;
                *((__n128 *)v21 + 1) = v23;
                *((_OWORD *)v21 + 2) = v24;
                *(__n128 *)v21 = v22;
                if (v11 == v16)
                {
                  v29 = &v20[56 * v17];
                }

                else
                {
                  v25 = &v20[56 * v17];
                  do
                  {
                    __int128 v26 = *(__int128 *)((char *)&v11[-4] + 8);
                    __int128 v27 = *(__int128 *)((char *)&v11[-3] + 8);
                    __int128 v28 = *(__int128 *)((char *)&v11[-2] + 8);
                    v29 = v25 - 56;
                    *(v25 - _Block_object_dispose(va, 8) = v11[-1].n128_i8[8];
                    *(_OWORD *)(v25 - 24) = v28;
                    *(_OWORD *)(v25 - 40) = v27;
                    *(_OWORD *)(v25 - 56) = v26;
                    v11 = (__n128 *)((char *)v11 - 56);
                    v25 -= 56;
                  }

                  while (v11 != v16);
                }

                v15 = (unint64_t *)(v21 + 56);
                __p = v29;
                v111 = (__n128 *)(v21 + 56);
                v112 = (__n128 *)&v20[56 * v19];
                if (v16) {
                  operator delete(v16);
                }
              }

              else
              {
                __n128 v12 = v118;
                __n128 v13 = v119;
                __n128 v14 = *(__n128 *)v120;
                v111[3].n128_u64[0] = v121;
                v11[1] = v13;
                v11[2] = v14;
                __n128 *v11 = v12;
                v15 = &v11[3].n128_u64[1];
              }

              v111 = (__n128 *)v15;
            }

            sub_100009CD4(&v115);
          }
        }

        sub_100009CA4(&region);
      }

      v30 = __p;
      uint64_t v31 = (uint64_t)v111;
      if (__p == v111)
      {
        v32 = (__n128 *)sub_100005948();
        sub_100005A84(&v118, v32, 0LL, euid, 0, 7u, 0xFFFFu);
        v33 = v111;
        if (v111 >= v112)
        {
          v74 = (__n128 *)__p;
          uint64_t v75 = 0x6DB6DB6DB6DB6DB7LL * (((char *)v111 - (_BYTE *)__p) >> 3);
          unint64_t v76 = v75 + 1;
          else {
            unint64_t v77 = v76;
          }
          if (v77)
          {
            v78 = (char *)sub_100003DCC((uint64_t)&v112, v77);
            v74 = (__n128 *)__p;
            v33 = v111;
          }

          else
          {
            v78 = 0LL;
          }

          v84 = &v78[56 * v75];
          __n128 v85 = v118;
          __n128 v86 = v119;
          __int128 v87 = *(_OWORD *)v120;
          v88 = &v78[56 * v77];
          *((void *)v84 + 6) = v121;
          *((__n128 *)v84 + 1) = v86;
          *((_OWORD *)v84 + 2) = v87;
          *(__n128 *)v84 = v85;
          uint64_t v31 = (uint64_t)(v84 + 56);
          if (v33 == v74)
          {
            v92 = v84;
          }

          else
          {
            do
            {
              __int128 v89 = *(__int128 *)((char *)&v33[-4] + 8);
              __int128 v90 = *(__int128 *)((char *)&v33[-3] + 8);
              __int128 v91 = *(__int128 *)((char *)&v33[-2] + 8);
              v92 = v84 - 56;
              *(v84 - _Block_object_dispose(va, 8) = v33[-1].n128_i8[8];
              *(_OWORD *)(v84 - 24) = v91;
              *(_OWORD *)(v84 - 40) = v90;
              *(_OWORD *)(v84 - 56) = v89;
              v33 = (__n128 *)((char *)v33 - 56);
              v84 -= 56;
            }

            while (v33 != v74);
          }

          __p = v92;
          v111 = (__n128 *)v31;
          v112 = (__n128 *)v88;
          if (v74) {
            operator delete(v74);
          }
        }

        else
        {
          __n128 v34 = v118;
          __n128 v35 = v119;
          __n128 v36 = *(__n128 *)v120;
          v111[3].n128_u64[0] = v121;
          v33[1] = v35;
          v33[2] = v36;
          __n128 *v33 = v34;
          uint64_t v31 = (uint64_t)&v33[3].n128_i64[1];
        }

        v111 = (__n128 *)v31;
        v30 = __p;
      }

      v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
      v118.n128_u64[1] = 1174405120LL;
      v119.n128_u64[0] = (unint64_t)sub_100003BF0;
      v119.n128_u64[1] = (unint64_t)&unk_10000C5C8;
      v120[1] = 0LL;
      unint64_t v121 = 0LL;
      v120[0] = 0LL;
      sub_100003E3C(v120, v30, v31, 0x6DB6DB6DB6DB6DB7LL * ((v31 - (uint64_t)v30) >> 3));
      v122 = a3;
      sub_1000036B0((uint64_t)&v118);
      if (v120[0])
      {
        v120[1] = v120[0];
        operator delete(v120[0]);
      }

      sub_100009CD4(&v117);
      if (__p)
      {
        v111 = (__n128 *)__p;
        operator delete(__p);
      }

      v37 = &v106;
      goto LABEL_138;
    case 3uLL:
      sub_100009C64(&v105, &v109);
      __p = 0LL;
      v111 = 0LL;
      v112 = 0LL;
      sub_100009D90(&v105, "filters", &v117);
      if (sub_100009CE0(&v117) && sub_100009CF0((xpc_type_t *)&v117) == (xpc_type_t)&_xpc_type_array)
      {
        sub_100009C64(&region, (void **)&v117);
        size_t v42 = sub_100009E20(&region);
        if (v42)
        {
          size_t v43 = 0LL;
          for (j = 0; j < v42; size_t v43 = ++j)
          {
            sub_100009E38(&region, v43, &v115);
            if (sub_100009CF0((xpc_type_t *)&v115) == (xpc_type_t)&_xpc_type_array)
            {
              sub_100009C64(&v114, &v115);
              sub_100005BE4(&v118, &v114);
              sub_100009CD4(&v114);
              if (euid) {
                LODWORD(v120[0]) = euid;
              }
              v45 = v111;
              if (v111 >= v112)
              {
                v50 = (__n128 *)__p;
                uint64_t v51 = 0x6DB6DB6DB6DB6DB7LL * (((char *)v111 - (_BYTE *)__p) >> 3);
                unint64_t v52 = v51 + 1;
                else {
                  unint64_t v53 = v52;
                }
                if (v53)
                {
                  v54 = (char *)sub_100003DCC((uint64_t)&v112, v53);
                  v50 = (__n128 *)__p;
                  v45 = v111;
                }

                else
                {
                  v54 = 0LL;
                }

                v55 = &v54[56 * v51];
                __n128 v56 = v118;
                __n128 v57 = v119;
                __int128 v58 = *(_OWORD *)v120;
                *((void *)v55 + 6) = v121;
                *((__n128 *)v55 + 1) = v57;
                *((_OWORD *)v55 + 2) = v58;
                *(__n128 *)v55 = v56;
                if (v45 == v50)
                {
                  v63 = &v54[56 * v51];
                }

                else
                {
                  v59 = &v54[56 * v51];
                  do
                  {
                    __int128 v60 = *(__int128 *)((char *)&v45[-4] + 8);
                    __int128 v61 = *(__int128 *)((char *)&v45[-3] + 8);
                    __int128 v62 = *(__int128 *)((char *)&v45[-2] + 8);
                    v63 = v59 - 56;
                    *(v59 - _Block_object_dispose(va, 8) = v45[-1].n128_i8[8];
                    *(_OWORD *)(v59 - 24) = v62;
                    *(_OWORD *)(v59 - 40) = v61;
                    *(_OWORD *)(v59 - 56) = v60;
                    v45 = (__n128 *)((char *)v45 - 56);
                    v59 -= 56;
                  }

                  while (v45 != v50);
                }

                v49 = (unint64_t *)(v55 + 56);
                __p = v63;
                v111 = (__n128 *)(v55 + 56);
                v112 = (__n128 *)&v54[56 * v53];
                if (v50) {
                  operator delete(v50);
                }
              }

              else
              {
                __n128 v46 = v118;
                __n128 v47 = v119;
                __n128 v48 = *(__n128 *)v120;
                v111[3].n128_u64[0] = v121;
                v45[1] = v47;
                v45[2] = v48;
                __n128 *v45 = v46;
                v49 = &v45[3].n128_u64[1];
              }

              v111 = (__n128 *)v49;
            }

            sub_100009CD4(&v115);
          }
        }

        sub_100009CA4(&region);
      }

      if (euid) {
        BOOL v64 = 0;
      }
      else {
        BOOL v64 = sub_100009D70(&v105, "should_delete_precached") == 1;
      }
      v66 = __p;
      uint64_t v67 = (uint64_t)v111;
      if (__p == v111)
      {
        v68 = (__n128 *)sub_100005948();
        sub_100005A84(&v118, v68, 0LL, euid, 0, 7u, 0xFFFFu);
        v69 = v111;
        if (v111 >= v112)
        {
          v79 = (__n128 *)__p;
          uint64_t v80 = 0x6DB6DB6DB6DB6DB7LL * (((char *)v111 - (_BYTE *)__p) >> 3);
          unint64_t v81 = v80 + 1;
          else {
            unint64_t v82 = v81;
          }
          if (v82)
          {
            v83 = (char *)sub_100003DCC((uint64_t)&v112, v82);
            v79 = (__n128 *)__p;
            v69 = v111;
          }

          else
          {
            v83 = 0LL;
          }

          v93 = &v83[56 * v80];
          __n128 v94 = v118;
          __n128 v95 = v119;
          __int128 v96 = *(_OWORD *)v120;
          v97 = &v83[56 * v82];
          *((void *)v93 + 6) = v121;
          *((__n128 *)v93 + 1) = v95;
          *((_OWORD *)v93 + 2) = v96;
          *(__n128 *)v93 = v94;
          uint64_t v67 = (uint64_t)(v93 + 56);
          if (v69 == v79)
          {
            v101 = v93;
          }

          else
          {
            do
            {
              __int128 v98 = *(__int128 *)((char *)&v69[-4] + 8);
              __int128 v99 = *(__int128 *)((char *)&v69[-3] + 8);
              __int128 v100 = *(__int128 *)((char *)&v69[-2] + 8);
              v101 = v93 - 56;
              *(v93 - _Block_object_dispose(va, 8) = v69[-1].n128_i8[8];
              *(_OWORD *)(v93 - 24) = v100;
              *(_OWORD *)(v93 - 40) = v99;
              *(_OWORD *)(v93 - 56) = v98;
              v69 = (__n128 *)((char *)v69 - 56);
              v93 -= 56;
            }

            while (v69 != v79);
          }

          __p = v101;
          v111 = (__n128 *)v67;
          v112 = (__n128 *)v97;
          if (v79) {
            operator delete(v79);
          }
        }

        else
        {
          __n128 v70 = v118;
          __n128 v71 = v119;
          __n128 v72 = *(__n128 *)v120;
          v111[3].n128_u64[0] = v121;
          v69[1] = v71;
          v69[2] = v72;
          __n128 *v69 = v70;
          uint64_t v67 = (uint64_t)&v69[3].n128_i64[1];
        }

        v111 = (__n128 *)v67;
        v66 = __p;
      }

      v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
      v118.n128_u64[1] = 1174405120LL;
      v119.n128_u64[0] = (unint64_t)sub_100003F08;
      v119.n128_u64[1] = (unint64_t)&unk_10000C5F8;
      v120[1] = 0LL;
      unint64_t v121 = 0LL;
      v120[0] = 0LL;
      sub_100003E3C(v120, v66, v67, 0x6DB6DB6DB6DB6DB7LL * ((v67 - (uint64_t)v66) >> 3));
      LOBYTE(v123) = v64;
      v122 = a3;
      sub_1000036B0((uint64_t)&v118);
      if (v120[0])
      {
        v120[1] = v120[0];
        operator delete(v120[0]);
      }

      sub_100009CD4(&v117);
      if (__p)
      {
        v111 = (__n128 *)__p;
        operator delete(__p);
      }

      v37 = &v105;
      goto LABEL_138;
    case 4uLL:
      sub_100009C64(&v104, &v109);
      sub_100009D90(&v104, "entry", &__p);
      if (sub_100009CE0(&__p) && sub_100009CF0((xpc_type_t *)&__p) == (xpc_type_t)&_xpc_type_array)
      {
        v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
        v118.n128_u64[1] = 1174405120LL;
        v119.n128_u64[0] = (unint64_t)sub_100004018;
        v119.n128_u64[1] = (unint64_t)&unk_10000C628;
        sub_100009C64(v120, &__p);
        LODWORD(v121) = euid;
        v120[1] = a3;
        sub_1000036B0((uint64_t)&v118);
        sub_100009CD4(v120);
      }

      sub_100009CD4(&__p);
      v37 = &v104;
      goto LABEL_138;
    case 5uLL:
      sub_100009C64(&v103, &v109);
      region = 0LL;
      v117 = 0LL;
      sub_100009D90(&v103, "archive_shmem", &v115);
      if (sub_100009CD8((uint64_t)&v115)
        && sub_100009CF0((xpc_type_t *)&v115) == (xpc_type_t)&_xpc_type_shmem
        && (v73 = (void *)sub_100009CD8((uint64_t)&v115), v39 = (__n128 *)xpc_shmem_map(v73, &region),
                                                         (v117 = v39) != 0LL))
      {
        v40 = region;
        v38 = (unsigned int *)region;
      }

      else
      {
        region = 0LL;
        v38 = (unsigned int *)sub_100009D80(&v103, "archive", (size_t *)&v117);
        v40 = region;
        v39 = v117;
      }

      __p = v40;
      v111 = v39;
      if (v38)
      {
        if ((unint64_t)v39 >= v38[1])
        {
          sub_100009D90(&v103, "entry", &v114);
          if (sub_100009CE0(&v114) && sub_100009CF0((xpc_type_t *)&v114) == (xpc_type_t)&_xpc_type_array)
          {
            sub_100009C64(&v113, &v114);
            if (sub_100009E20(&v113) < 6)
            {
              sub_100009D68(a3, "write_errno", 6uLL);
            }

            else
            {
              v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
              v118.n128_u64[1] = 1174405120LL;
              v119.n128_u64[0] = (unint64_t)sub_10000460C;
              v119.n128_u64[1] = (unint64_t)&unk_10000C658;
              sub_100009C64(v120, &v114);
              uid_t v123 = euid;
              v120[1] = v38;
              unint64_t v121 = (unint64_t)v117;
              v122 = a3;
              sub_1000036B0((uint64_t)&v118);
              sub_100009CD4(v120);
            }

            sub_100009CA4(&v113);
          }

          sub_100009CD4(&v114);
        }

        else
        {
          sub_100009D68(a3, "write_errno", 6uLL);
        }
      }

      sub_10000492C((uint64_t)&__p);
      sub_100009CD4(&v115);
      v37 = &v103;
      goto LABEL_138;
    case 6uLL:
      v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
      v118.n128_u64[1] = 0x40000000LL;
      v119.n128_u64[0] = (unint64_t)sub_100003AD0;
      v119.n128_u64[1] = (unint64_t)&unk_10000C548;
      v120[0] = a3;
      sub_1000036B0((uint64_t)&v118);
      return sub_100009CA4(&v109);
    case 7uLL:
      sub_100009C64(&v108, &v109);
      v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
      v118.n128_u64[1] = 0x40000000LL;
      v119.n128_u64[0] = (unint64_t)sub_100003B90;
      v119.n128_u64[1] = (unint64_t)&unk_10000C568;
      v120[0] = a3;
      sub_1000036B0((uint64_t)&v118);
      v37 = &v108;
      goto LABEL_138;
    case 8uLL:
      sub_100009C64(&v107, &v109);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      dispatch_async(global_queue, &stru_10000C5A8);
      v37 = &v107;
      goto LABEL_138;
    case 9uLL:
      sub_100009C64(&v102, &v109);
      v41 = (void *)sub_100009D70(&v102, "free_capacity");
      v118.n128_u64[0] = (unint64_t)_NSConcreteStackBlock;
      v118.n128_u64[1] = 0x40000000LL;
      v119.n128_u64[0] = (unint64_t)sub_100004964;
      v119.n128_u64[1] = (unint64_t)&unk_10000C688;
      v120[0] = v41;
      v120[1] = a3;
      sub_1000036B0((uint64_t)&v118);
      v37 = &v102;
LABEL_138:
      sub_100009CA4(v37);
      break;
    default:
      return sub_100009CA4(&v109);
  }

  return sub_100009CA4(&v109);
}

void sub_10000333C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, void *a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, int a20, __int16 a21, char a22, char a23, uint64_t a24, char a25, int a26, void *a27, void *__p, uint64_t a29, uint64_t a30, void *a31, __int16 a32, char a33, char a34, int a35, __int16 a36, char a37, char a38, int a39, __int16 a40, char a41, char a42, int a43, __int16 a44, char a45, char a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,void *a51,uint64_t a52)
{
}

uint64_t sub_100003528()
{
  uint64_t v0 = sub_1000036B0((uint64_t)&stru_10000C6C8);
  return xpc_transaction_exit_clean(v0);
}

void sub_100003544()
{
  uint64_t v0 = dlopen("/System/Library/PrivateFrameworks/CacheDelete.framework/CacheDelete", 1);
  if (v0)
  {
    BOOL v1 = (unsigned int (*)(const __CFString *, Block_layout *, Block_layout *, Block_layout *, Block_layout *))dlsym(v0, "CacheDeleteRegisterInfoCallbacks");
    if (v1)
    {
      if (!v1( @"com.apple.coresymbolicationd.cache-delete",  &stru_10000C708,  &stru_10000C748,  &stru_10000C788,  &stru_10000C748)) {
        return;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to register with deleted",  v5,  2u);
      }

      size_t v2 = __stderrp;
      size_t v3 = "Failed to register with deleted";
      size_t v4 = 31LL;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to load symbols from CacheDelete framework",  v6,  2u);
      }

      size_t v2 = __stderrp;
      size_t v3 = "Failed to load symbols from CacheDelete framework";
      size_t v4 = 49LL;
    }

    fwrite(v3, v4, 1uLL, v2);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Unable to load CacheDelete framework\n",  buf,  2u);
  }

uint64_t sub_1000036B0(uint64_t a1)
{
  if (qword_100010100) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = qword_1000100E0 == 0;
  }
  if (!v2)
  {
    xpc_connection_cancel((xpc_connection_t)qword_1000100E0);
    qword_1000100E0 = 0LL;
  }

  return pthread_mutex_unlock(&stru_100010008);
}

void sub_100003720(_Unwind_Exception *a1)
{
}

void sub_10000373C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    size_t v4 = (void *)sub_100006670();
    operator delete(v4);
  }

void sub_100003768(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = operator new(0x60uLL);
  sub_100006284((int)v3, 1, (char *)qword_1000100D8);
  sub_10000373C(a2, (uint64_t)v3);
  uint64_t v4 = *a2;
  if (*(_DWORD *)(*a2 + 64) != -1 && *(void *)(v4 + 88) != -1LL) {
    goto LABEL_21;
  }
  BOOL v5 = sub_1000052FC((const char *)qword_1000100D8, 0LL);
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v19 = (char *)qword_1000100D8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s did not validate, resetting cache\n",  buf,  0xCu);
    }
  }

  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v19 = (char *)qword_1000100D8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s does not exist, resetting cache\n",  buf,  0xCu);
    }

    v7 = opendir(off_100010000);
    size_t v8 = v7;
    if (v7)
    {
      for (unsigned int i = readdir(v7); i; unsigned int i = readdir(v8))
      {
        if (i->d_type != 4)
        {
          v10 = off_100010000;
          size_t v11 = strlen(off_100010000) + i->d_namlen;
          __n128 v12 = (char *)malloc(v11 + 2);
          strlcpy(v12, v10, v11 + 2);
          strlcat(v12, "/", v11 + 2);
          d_name = i->d_name;
          size_t v14 = strlcat(v12, d_name, v11 + 2);
          BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
          if (v14 == v11 + 1)
          {
            if (v15)
            {
              *(_DWORD *)buf = 136315138;
              unint64_t v19 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "unlink(%s)\n",  buf,  0xCu);
            }

            unlink(v12);
          }

          else if (v15)
          {
            *(_DWORD *)buf = 136315394;
            unint64_t v19 = off_100010000;
            __int16 v20 = 2080;
            v21 = d_name;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "path length incorrect; old cache not reaped: (%s/%s)\n",
              buf,
              0x16u);
          }

          free(v12);
        }
      }

      closedir(v8);
    }
  }

  size_t v16 = operator new(0x60uLL);
  sub_1000064FC((int)v16, (char *)qword_1000100D8);
  sub_10000373C(a2, (uint64_t)v16);
  uint64_t v4 = *a2;
  if (*a2) {
LABEL_21:
  }
    LOBYTE(v4) = *(_DWORD *)(v4 + 64) != -1 && *(void *)(v4 + 88) != -1LL;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
}

void sub_100003AA0(_Unwind_Exception *a1)
{
}

void sub_100003AC0(void *a1)
{
}

void sub_100003AD0(uint64_t a1, uint64_t *a2)
{
  time_t v3 = time(0LL);
  double v4 = difftime(v3, qword_1000100E8);
  sub_100009D68(*(xpc_object_t **)(a1 + 32), "version", v8);
  sub_100009D68(*(xpc_object_t **)(a1 + 32), "capacity", v7);
  sub_100009D68(*(xpc_object_t **)(a1 + 32), "count", v6);
  sub_100009D68(*(xpc_object_t **)(a1 + 32), "bytes_total", v5);
  sub_100009D78(*(xpc_object_t **)(a1 + 32), "uptime", v4);
}

void sub_100003B90(uint64_t a1, pthread_mutex_t **a2)
{
  if (*a2 && sub_1000061B8(*a2)) {
    uint64_t v3 = 2LL;
  }
  else {
    uint64_t v3 = 1LL;
  }
  sub_100009D68(*(xpc_object_t **)(a1 + 32), "is_valid", v3);
}

void sub_100003BD4(id a1)
{
  uint64_t v1 = sub_1000036B0((uint64_t)&stru_10000C6C8);
  xpc_transaction_exit_clean(v1);
}

void **sub_100003BF0(void **result, uint64_t *a2)
{
  if (*a2)
  {
    uint64_t v3 = result;
    sub_100009DF0(&v12);
    sub_100006B80(*a2, (uint64_t *)v3 + 4, (uint64_t)&v10);
    double v4 = v10;
    uint64_t v5 = v11;
    if (v10 != v11)
    {
      do
      {
        sub_100005CC4(v4, &v9);
        unsigned int v6 = (void *)sub_100009CD8((uint64_t)&v9);
        sub_100009E28(&v12, v6);
        sub_100009CD4(&v9);
        double v4 = (int8x16_t *)((char *)v4 + 56);
      }

      while (v4 != v5);
      double v4 = v10;
    }

    if (v4)
    {
      size_t v11 = v4;
      operator delete(v4);
    }

    unsigned int v7 = (xpc_object_t *)v3[7];
    unsigned int v8 = (void *)sub_100009CD8((uint64_t)&v12);
    sub_100009D88(v7, "results", v8);
    return sub_100009CA4(&v12);
  }

  return result;
}

void sub_100003CBC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, uint64_t a13, void *a14)
{
}

void *sub_100003CFC(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  BOOL v2 = (void *)(a1 + 32);
  v2[2] = 0LL;
  return sub_100003E3C( v2,  *(const void **)(a2 + 32),  *(void *)(a2 + 40),  0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(*(void *)(a2 + 40) - *(void *)(a2 + 32)) >> 3));
}

void sub_100003D2C(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(a1 + 40) = v2;
    operator delete(v2);
  }

void sub_100003D44()
{
}

void sub_100003D58(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100003DA8(exception, a1);
}

void sub_100003D94(_Unwind_Exception *a1)
{
}

std::logic_error *sub_100003DA8(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100003DCC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493LL) {
    sub_100003E14();
  }
  return operator new(56 * a2);
}

void sub_100003E14()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100003E3C(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unsigned int v6 = result;
    result = sub_100003EB4(result, a4);
    uint64_t v7 = v6[1];
    uint64_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8 - 7);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_100003E98(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_100003EB4(void *a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493LL) {
    sub_100003D44();
  }
  result = (char *)sub_100003DCC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

void **sub_100003F08(void **result, uint64_t *a2)
{
  if (*a2)
  {
    uint64_t v3 = result;
    sub_100009DF0(&v12);
    sub_100007204(*a2, (uint64_t)(v3 + 4), *((unsigned __int8 *)v3 + 64), &v10);
    uint64_t v4 = v10;
    uint64_t v5 = v11;
    if (v10 != v11)
    {
      do
      {
        sub_100005CC4(v4, &v9);
        unsigned int v6 = (void *)sub_100009CD8((uint64_t)&v9);
        sub_100009E28(&v12, v6);
        sub_100009CD4(&v9);
        uint64_t v4 = (int8x16_t *)((char *)v4 + 56);
      }

      while (v4 != v5);
      uint64_t v4 = v10;
    }

    if (v4)
    {
      size_t v11 = v4;
      operator delete(v4);
    }

    uint64_t v7 = (xpc_object_t *)v3[7];
    uint64_t v8 = (void *)sub_100009CD8((uint64_t)&v12);
    sub_100009D88(v7, "results", v8);
    return sub_100009CA4(&v12);
  }

  return result;
}

void sub_100003FD8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, uint64_t a13, void *a14)
{
}

uint64_t sub_100004018(uint64_t result, uint64_t *a2)
{
  if (*a2)
  {
    uint64_t v3 = result;
    sub_100009C64(&v4, (void **)(result + 32));
    sub_100005BE4(v5, &v4);
    sub_100009CD4(&v4);
    if (*(_DWORD *)(v3 + 48)) {
      int v6 = *(_DWORD *)(v3 + 48);
    }
    result = sub_1000068BC(*a2, (uint64_t)v5);
    if ((_DWORD)result)
    {
      result = sub_100006870(*a2, (uint64_t)v5);
      if ((_DWORD)result) {
        return sub_1000040EC(*(xpc_object_t **)(v3 + 40), a2, (uint64_t)v5);
      }
    }
  }

  return result;
}

void sub_1000040D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_1000040EC(xpc_object_t *a1, uint64_t *a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(*a2 + 64);
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v24 = *(unsigned int *)(a3 + 36);
  uint64_t v8 = v7 & 0x3FFF;
  size_t v9 = ((v7 + v24 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL) - (v7 & 0xFFFFFFFFFFFFC000LL);
  v23[1] = v9;
  v23[2] = v8;
  v10 = (char *)mmap(0LL, v9, 1, 1, v6, v7 & 0xFFFFFFFFFFFFC000LL);
  v23[0] = v10;
  size_t v11 = v10;
  __n128 v12 = (int32x4_t *)&v10[v8];
  if (!v12->i32[1] || (__int32 v13 = v12[3].i32[0], v13 != sub_1000042E4(v12)) || !sub_100004300(v12))
  {
    size_t v16 = operator new(0x38uLL);
    v21 = (char *)v16 + 56;
    __n128 v22 = (char *)v16 + 56;
    __int128 v17 = *(_OWORD *)(a3 + 16);
    *size_t v16 = *(_OWORD *)a3;
    v16[1] = v17;
    v16[2] = *(_OWORD *)(a3 + 32);
    *((_BYTE *)v16 + 4_Block_object_dispose(va, 8) = *(_BYTE *)(a3 + 48);
    __int16 v20 = v16;
    sub_100007204(*a2, (uint64_t)&v20, 1u, __p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    sub_100009D68(a1, "write_errno", 6uLL);
    if (v20)
    {
      v21 = v20;
      operator delete(v20);
    }

    goto LABEL_12;
  }

  xpc_object_t v14 = xpc_shmem_create(v11, v9);
  if (!v14)
  {
LABEL_12:
    uint64_t v15 = 0LL;
    goto LABEL_13;
  }

  sub_100009D88(a1, "shmem", v14);
  sub_100009D68(a1, "major_version", *(unsigned __int16 *)(a3 + 44));
  sub_100009D68(a1, "minor_version", *(unsigned __int16 *)(a3 + 46));
  xpc_release(v14);
  uint64_t v15 = 1LL;
LABEL_13:
  sub_1000045D4((uint64_t)v23);
  return v15;
}

void sub_1000042A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, char a15)
{
}

void **sub_1000042D0(uint64_t a1, uint64_t a2)
{
  return sub_100009C64((void **)(a1 + 32), (void **)(a2 + 32));
}

uint64_t sub_1000042DC(uint64_t a1)
{
  return sub_100009CD4(a1 + 32);
}

uint64_t sub_1000042E4(int32x4_t *a1)
{
  return vaddvq_s32(vaddq_s32(vaddq_s32(*a1, a1[1]), a1[2]));
}

BOOL sub_100004300(_DWORD *a1)
{
  BOOL v2 = a1 + 24;
  unint64_t v3 = (unint64_t)a1
     + 32 * a1[2]
     + 24 * a1[3]
     + (24 * a1[4])
     + (unint64_t)(4 * a1[4])
     + (36 * a1[5])
     + (20 * a1[6])
     + a1[22]
     + a1[20]
     + 96;
  unint64_t v4 = sub_10000447C(a1);
  unint64_t v5 = sub_1000044E4(a1);
  if (v5)
  {
    if (v5 < v3 || v5 >= v4) {
      return 0LL;
    }
  }

  unint64_t v7 = sub_10000455C(a1);
  if (v7)
  {
    if (v7 < v3 || v7 >= v4) {
      return 0LL;
    }
  }

  v10 = (char *)v2 + 32 * a1[2] + (24 * a1[3]);
  int v11 = a1[4];
  __n128 v12 = &v10[24 * v11];
  __int32 v13 = &v12[(36 * a1[5]) + (unint64_t)(20 * a1[6])];
  uint64_t v14 = a1[22];
  uint64_t v15 = (unsigned int *)&v13[v14];
  if ((_DWORD)v14)
  {
    size_t v16 = (unsigned int *)&v12[(36 * a1[5]) + (unint64_t)(20 * a1[6])];
    do
    {
      unint64_t v17 = (unint64_t)&v13[-*v16];
      ++v16;
      v13 += 4;
    }

    while (v16 != v15);
  }

  uint64_t v19 = (4 * v11);
  if (!(_DWORD)v19) {
    return 1LL;
  }
  __int16 v20 = (unsigned int *)((char *)v15 + v19);
  v21 = v15 + 1;
  do
  {
    __n128 v22 = (char *)v15 - *(v21 - 1);
    BOOL result = v22 < v12 && v22 >= v10;
    BOOL v24 = !result || v21++ == v20;
    ++v15;
  }

  while (!v24);
  return result;
}

unint64_t sub_10000447C(_DWORD *a1)
{
  return (unint64_t)a1
       + 32 * a1[2]
       + 24 * a1[3]
       + (24 * a1[4])
       + (unint64_t)(4 * a1[4])
       + (36 * a1[5])
       + (20 * a1[6])
       + a1[22]
       + a1[20]
       + a1[21]
       + 96;
}

unint64_t sub_1000044E4(_DWORD *a1)
{
  uint64_t v1 = a1[10];
  if ((_DWORD)v1) {
    return (unint64_t)a1
  }
         + v1
         + (32 * a1[2])
         + (24 * a1[3])
         + (24 * a1[4])
         + (4 * a1[4])
         + (36 * a1[5])
         + (20 * a1[6])
         + a1[22]
         + a1[20]
         + 96;
  else {
    return 0LL;
  }
}

unint64_t sub_10000455C(_DWORD *a1)
{
  uint64_t v1 = a1[11];
  if ((_DWORD)v1) {
    return (unint64_t)a1
  }
         + v1
         + (32 * a1[2])
         + (24 * a1[3])
         + (24 * a1[4])
         + (4 * a1[4])
         + (36 * a1[5])
         + (20 * a1[6])
         + a1[22]
         + a1[20]
         + 96;
  else {
    return 0LL;
  }
}

uint64_t sub_1000045D4(uint64_t a1)
{
  BOOL v2 = *(void **)a1;
  return a1;
}

void sub_10000460C(uint64_t a1, uint64_t *a2)
{
  if (!*a2) {
    return;
  }
  sub_100009C64(&v15, (void **)(a1 + 32));
  sub_100005BE4(v18, &v15);
  sub_100009CD4(&v15);
  if (*(_DWORD *)(a1 + 64) || v19 == -1) {
    int v19 = *(_DWORD *)(a1 + 64);
  }
  int v4 = sub_1000074B0(*a2, (__int128 *)v18[0].i8, *(int32x4_t **)(a1 + 40), *(void *)(a1 + 48));
  if (v4 == 3)
  {
    if ((byte_1000100F8 & 1) != 0)
    {
LABEL_20:
      int v4 = sub_1000074B0(*a2, (__int128 *)v18[0].i8, *(int32x4_t **)(a1 + 40), *(void *)(a1 + 48));
      goto LABEL_21;
    }

    snprintf(__str, 0x400uLL, "%s/grow.XXXXXXX", off_100010000);
    uint64_t v5 = mkstemp(__str);
    uint64_t v17 = 0LL;
    if ((_DWORD)v5 != -1)
    {
      int v6 = (pthread_mutex_t *)*a2;
      pthread_mutex_lock((pthread_mutex_t *)*a2);
      int v7 = *(_DWORD *)(*(void *)(*a2 + 88) + 8LL);
      uint64_t v8 = operator new(0x60uLL);
      sub_100006638(v8, v5, (2 * v7));
      uint64_t v17 = (uint64_t)v8;
      if (v8[16] == -1 || *((void *)v8 + 11) == -1LL || !sub_100007D50(*a2, &v17, &buf))
      {
        pthread_mutex_unlock(v6);
      }

      else
      {
        int v9 = rename(__str, (const char *)qword_1000100D8);
        pthread_mutex_unlock(v6);
        if (!v9)
        {
          uint64_t v10 = v17;
          uint64_t v17 = 0LL;
          sub_10000373C(a2, v10);
LABEL_18:
          uint64_t v11 = v17;
          uint64_t v17 = 0LL;
          if (v11)
          {
            __n128 v12 = (void *)sub_100006670();
            operator delete(v12);
          }

          goto LABEL_20;
        }
      }

      unlink(__str);
    }

    byte_1000100F8 = 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to grow coresymbolicationd storage; will not attempt again unless daemon respawns\n",
        (uint8_t *)&buf,
        2u);
    }

    fwrite( "Unable to grow coresymbolicationd storage; will not attempt again unless daemon respawns\n",
      0x59uLL,
      1uLL,
      __stderrp);
    goto LABEL_18;
  }

LABEL_21:
  sub_100009D68(*(xpc_object_t **)(a1 + 56), "write_errno", v4);
  if (!v4)
  {
    if (sub_1000040EC(*(xpc_object_t **)(a1 + 56), a2, (uint64_t)v18))
    {
      __int32 v13 = *(xpc_object_t **)(a1 + 56);
      sub_100005CC4(v18, __str);
      uint64_t v14 = (void *)sub_100009CD8((uint64_t)__str);
      sub_100009D88(v13, "results", v14);
      sub_100009CD4(__str);
    }
  }

void sub_1000048B8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  if (a2) {
    sub_100003AC0(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000492C(uint64_t a1)
{
  BOOL v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    munmap(v2, *(void *)(a1 + 8));
  }
  return a1;
}

void sub_100004964(uint64_t a1, uint64_t *a2)
{
  if (*a2)
  {
    sub_100007358(*a2, *(void *)(a1 + 32), __p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    sub_100009D68(*(xpc_object_t **)(a1 + 40), "success", 1uLL);
  }

void sub_1000049C0(id a1, void *a2)
{
}

__CFDictionary *__cdecl sub_1000049CC(id a1, int a2, __CFDictionary *a3)
{
  int v4 = sub_100004AA4(a3);
  if (sub_100004DEC((uint64_t)v4))
  {
    uint64_t v8 = 0LL;
    int v9 = &v8;
    uint64_t v10 = 0x2000000000LL;
    uint64_t v11 = 0LL;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000LL;
    v7[2] = sub_100004F00;
    v7[3] = &unk_10000C7B0;
    v7[4] = &v8;
    sub_1000036B0((uint64_t)v7);
    unint64_t v5 = v9[3];
    _Block_object_dispose(&v8, 8);
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  free(v4);
  return sub_100004B58(a3, v5);
}

void sub_100004A8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

char *sub_100004AA4(const void *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID()) {
    return 0LL;
  }
  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"CACHE_DELETE_VOLUME");
  if (!Value) {
    return 0LL;
  }
  int v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFStringGetTypeID()) {
    return 0LL;
  }
  CFIndex Length = CFStringGetLength(v4);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  uint64_t v8 = (char *)calloc(1uLL, MaximumSizeForEncoding + 1);
  if (v8) {
    CFStringGetCString(v4, v8, MaximumSizeForEncoding, 0x8000100u);
  }
  return v8;
}

CFDictionaryRef sub_100004B58(const void *a1, unint64_t a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFDictionaryGetTypeID()) {
    return 0LL;
  }
  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)a1, @"CACHE_DELETE_VOLUME");
  if (!Value) {
    return 0LL;
  }
  int v6 = Value;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2 < 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = a2;
  }
  uint64_t valuePtr = v7;
  CFNumberRef v8 = CFNumberCreate(0LL, kCFNumberSInt64Type, &valuePtr);
  *(_OWORD *)keys = *(_OWORD *)off_10000C7F8;
  values[0] = v6;
  values[1] = v8;
  CFDictionaryRef v9 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFRelease(v8);
  return v9;
}

__CFDictionary *__cdecl sub_100004C54(id a1, int a2, __CFDictionary *a3)
{
  CFTypeID v4 = sub_100004AA4(a3);
  if (v4)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a3, @"CACHE_DELETE_AMOUNT");
    if (Value)
    {
      int v6 = Value;
      CFTypeID v7 = CFGetTypeID(Value);
      if (v7 == CFNumberGetTypeID())
      {
        if (CFNumberGetValue(v6, kCFNumberSInt64Type, &valuePtr))
        {
          uint64_t v8 = valuePtr;
          if (sub_100004DEC((uint64_t)v4))
          {
            uint64_t v19 = 0LL;
            __int16 v20 = &v19;
            uint64_t v21 = 0x2000000000LL;
            uint64_t v22 = 0LL;
            *(void *)int buf = _NSConcreteStackBlock;
            uint64_t v14 = 0x40000000LL;
            uint64_t v15 = sub_1000050F8;
            size_t v16 = &unk_10000C810;
            uint64_t v17 = &v19;
            uint64_t v18 = v8;
            sub_1000036B0((uint64_t)buf);
            unint64_t v9 = v20[3];
            _Block_object_dispose(&v19, 8);
          }

          else
          {
            unint64_t v9 = 0LL;
          }

LABEL_10:
          free(v4);
          unint64_t v10 = v9;
          return sub_100004B58(a3, v10);
        }
      }
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Bad value or no value for CACHE_DELETE_AMOUNT_KEY",  buf,  2u);
  }

  fwrite("Bad value or no value for CACHE_DELETE_AMOUNT_KEY", 0x31uLL, 1uLL, __stderrp);
  unint64_t v9 = 0LL;
  unint64_t v10 = 0LL;
  if (v4) {
    goto LABEL_10;
  }
  return sub_100004B58(a3, v10);
}

void sub_100004DD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

BOOL sub_100004DEC(uint64_t a1)
{
  if (a1)
  {
    *(void *)int buf = 0LL;
    CFTypeID v5 = buf;
    uint64_t v6 = 0x2000000000LL;
    char v7 = 0;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 0x40000000LL;
    v3[2] = sub_100004F34;
    v3[3] = &unk_10000C7D8;
    v3[4] = buf;
    v3[5] = a1;
    sub_1000036B0((uint64_t)v3);
    BOOL v1 = v5[24] != 0;
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "CacheDelete request with no volume",  buf,  2u);
    }

    fwrite("CacheDelete request with no volume", 0x22uLL, 1uLL, __stderrp);
    return 0LL;
  }

  return v1;
}

void sub_100004EE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100004F00(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (*a2)
  {
    uint64_t result = sub_100006730(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

uint64_t sub_100004F34(uint64_t result, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v2 = result;
    uint64_t result = *(unsigned int *)(*(void *)a2 + 64LL);
    if ((result & 0x80000000) == 0)
    {
      if (fstat(result, &v12))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          unint64_t v3 = __error();
          CFTypeID v4 = strerror(*v3);
          buf.st_dev = 136315138;
          *(void *)&buf.st_mode = v4;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to stat coresymbolicationd cache: %s",  (uint8_t *)&buf,  0xCu);
        }

        CFTypeID v5 = __stderrp;
        uint64_t v6 = __error();
        strerror(*v6);
        return fprintf(v5, "Failed to stat coresymbolicationd cache: %s");
      }

      else
      {
        uint64_t result = stat(*(const char **)(v2 + 40), &buf);
        if ((_DWORD)result)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            uint64_t v7 = *(void *)(v2 + 40);
            uint64_t v8 = __error();
            unint64_t v9 = strerror(*v8);
            *(_DWORD *)__int32 v13 = 136315394;
            uint64_t v14 = v7;
            __int16 v15 = 2080;
            size_t v16 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to stat volume %s: %s",  v13,  0x16u);
          }

          unint64_t v10 = __stderrp;
          uint64_t v11 = __error();
          strerror(*v11);
          return fprintf(v10, "Failed to stat volume %s: %s");
        }

        else
        {
          *(_BYTE *)(*(void *)(*(void *)(v2 + 32) + 8LL) + 24LL) = v12.st_dev == buf.st_dev;
        }
      }
    }
  }

  return result;
}

size_t sub_1000050F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v10 = 0LL;
  int v9 = 0;
  unint64_t v8 = 0LL;
  if (*a2)
  {
    sub_1000066A0(*a2, (_DWORD *)&v10 + 1, &v10, &v9, (uint64_t *)&v8);
    sub_100007358(*a2, *(void *)(a1 + 40), __p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    v6[0] = 0LL;
    size_t result = sub_1000066A0(*a2, (_DWORD *)&v10 + 1, &v10, &v9, v6);
    unint64_t v5 = v8 - v6[0];
    if (v8 < v6[0]) {
      unint64_t v5 = 0LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Compaction failed during CacheDelete purge",  (uint8_t *)v6,  2u);
    }

    return fwrite("Compaction failed during CacheDelete purge", 0x2AuLL, 1uLL, __stderrp);
  }

  return result;
}

char *sub_100005204(const char *a1)
{
  size_t v2 = strlen(a1);
  if (v2 == 1)
  {
    unint64_t v5 = (char *)malloc(2uLL);
    uint64_t v6 = v5;
    uint64_t v7 = a1;
  }

  else
  {
    size_t v3 = v2;
    if (!v2) {
      return strdup(a1);
    }
    uint64_t v8 = 0LL;
    do
    {
      size_t v9 = v2 + v8;
      int v10 = a1[v2 - 1 + v8--];
    }

    while (v9 != 1 && v10 != 47);
    if (v2 + v8)
    {
      if (v8 == -1)
      {
        uint64_t v6 = (char *)malloc(v2);
        strlcpy(v6, a1, v3);
        return v6;
      }

      uint64_t v11 = &a1[v2];
      unint64_t v5 = (char *)malloc(-v8);
      uint64_t v6 = v5;
      uint64_t v7 = &v11[v8 + 1];
    }

    else
    {
      if (v10 == 47) {
        stat v12 = a1 + 1;
      }
      else {
        stat v12 = a1;
      }
      unint64_t v5 = (char *)malloc(&a1[v2] - v12 + 1);
      uint64_t v6 = v5;
      uint64_t v7 = v12;
    }
  }

  strcpy(v5, v7);
  return v6;
}

BOOL sub_1000052FC(const char *a1, BOOL *a2)
{
  int v3 = stat(a1, &v5);
  if (a2 && !v3) {
    *a2 = (v5.st_mode & 0xF000) == 0x4000;
  }
  return v3 == 0;
}

BOOL sub_10000534C(int a1, int a2)
{
  return (CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData() & (a2 ^ a1)) != 0
      && (CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData() & ~a2 & a1) == 0;
}

void sub_100005394()
{
}

uint64_t sub_1000053A8(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v4;
  stat v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v5, (void *)(a1 + 8));
  v5[1].__vftable = 0LL;
  v5[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf(v2);
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 8_Block_object_dispose(va, 8) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_10000546C(_Unwind_Exception *a1)
{
}

uint64_t sub_100005494(uint64_t a1)
{
  uint64_t v3 = a1 + 8;
  std::streambuf::~streambuf(v3);
  std::ios::~ios(a1 + 112);
  return a1;
}

void *sub_100005518(void *a1, uint64_t a2, uint64_t a3)
{
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      int v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32LL);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }

    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_10000567C(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_100005620( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_100005668(_Unwind_Exception *a1)
{
}

uint64_t sub_10000567C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0LL;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (v12 >= 1)
    {
      sub_1000057B8(__p, v12, __c);
      __int32 v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96LL))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0LL;
      }
    }

    uint64_t v15 = a4 - a3;
    else {
      return 0LL;
    }
  }

  return v6;
}

void sub_10000579C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000057B8(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100005394();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

uint64_t sub_100005860@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1000058FC(a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100005394();
  }
  stat v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000LL;
    *a2 = v9;
    a2 = v9;
  }

  else
  {
    *((_BYTE *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }

  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((_BYTE *)a2 + v6) = 0;
  return result;
}

uint64_t sub_1000058FC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = v3;
    }
    return *(void *)(a1 + 40);
  }

  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }

  else
  {
    return 0LL;
  }

uint64_t *sub_100005948()
{
  return &qword_100010048;
}

BOOL sub_100005954(void *a1)
{
  if (qword_100010048 == *a1 && unk_100010050 == a1[1]) {
    return 1LL;
  }
  if (*(_BYTE *)a1) {
    return 0LL;
  }
  unint64_t v3 = 0LL;
  do
  {
    unint64_t v4 = v3;
    if (v3 == 15) {
      break;
    }
    ++v3;
  }

  while (!*((_BYTE *)a1 + v4 + 1));
  return v4 > 0xE;
}

double sub_1000059B4(int8x16_t *a1)
{
  *(void *)&double result = vmvnq_s8(*a1).u64[0];
  return result;
}

uint64_t sub_1000059C8(unsigned __int8 *a1, char *__str, size_t __size)
{
  if (a1) {
    BOOL v3 = __str == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v5 = !v3 && __size > 0x24;
  if ((_DWORD)v5 == 1) {
    snprintf( __str,  __size,  "%02hhX%02hhX%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX-%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX",  *a1,  a1[1],  a1[2],  a1[3],  a1[4],  a1[5],  a1[6],  a1[7],  a1[8],  a1[9],  a1[10],  a1[11],  a1[12],  a1[13],  a1[14],  a1[15]);
  }
  return v5;
}

__n128 sub_100005A84( __n128 *a1, __n128 *a2, unint64_t a3, unsigned __int32 a4, unsigned __int32 a5, unsigned __int16 a6, unsigned __int16 a7)
{
  __n128 result = *a2;
  *a1 = *a2;
  a1[1].n128_u64[0] = 0LL;
  a1[1].n128_u64[1] = a3;
  a1[2].n128_u32[0] = a4;
  a1[2].n128_u32[1] = 0;
  a1[2].n128_u32[2] = a5;
  a1[2].n128_u16[6] = a6;
  a1[2].n128_u16[7] = a7;
  a1[3].n128_u8[0] = 0;
  return result;
}

int8x16_t *sub_100005AA8(int8x16_t *a1, void **a2)
{
  *a1 = *(int8x16_t *)sub_100009E88(&v7, 0LL);
  a1[1].i64[0] = sub_100009E78(&v7, 1uLL);
  a1[1].i64[1] = sub_100009E78(&v7, 2uLL);
  a1[2].i32[0] = sub_100009E78(&v7, 3uLL);
  a1[2].i32[1] = sub_100009E78(&v7, 4uLL);
  a1[2].i32[2] = sub_100009E78(&v7, 5uLL);
  if (sub_100009E20(&v7) < 8)
  {
    a1[2].i32[3] = 1;
    a1[3].i8[0] = 0;
  }

  else
  {
    a1[2].i16[6] = sub_100009E78(&v7, 6uLL);
    a1[2].i16[7] = sub_100009E78(&v7, 7uLL);
    BOOL v3 = sub_100009E20(&v7) == 9 && sub_100009E78(&v7, 8uLL) != 0;
    a1[3].i8[0] = v3;
    if (a1[2].i16[6] == 3)
    {
      sub_1000059B4(a1);
      a1->i64[0] = v4;
      a1->i64[1] = v5;
    }
  }

  sub_100009CA4(&v7);
  return a1;
}

void sub_100005BCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

BOOL sub_100005BE8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 48) != 0) != (*(_BYTE *)(a2 + 48) != 0)) {
    return 0LL;
  }
  int v4 = *(_DWORD *)(a1 + 32);
  if (v4 != -1)
  {
    int v5 = *(_DWORD *)(a2 + 32);
    if (v5 != -2 && v4 != v5) {
      return 0LL;
    }
  }

  uint64_t v7 = *(void *)(a1 + 24);
  if (v7 && v7 != *(void *)(a2 + 24)) {
    return 0LL;
  }
  int v9 = *(_DWORD *)(a1 + 40);
  if (v9)
  {
    if (v9 != *(_DWORD *)(a2 + 40)) {
      return 0LL;
    }
  }

  if (!sub_100005954((void *)a1) && (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))) {
    return 0LL;
  }
  int v11 = *(unsigned __int16 *)(a1 + 44);
  int v13 = *(unsigned __int16 *)(a1 + 46);
  return v13 == 0xFFFF || v13 == *(unsigned __int16 *)(a2 + 46);
}

void **sub_100005CC4@<X0>(int8x16_t *a1@<X0>, void *a2@<X8>)
{
  if (a1[2].i16[6] == 3)
  {
    sub_1000059B4(a1);
    v8[0] = v4;
    v8[1] = v5;
    sub_100009E80(&v7, 0xFFFFFFFFFFFFFFFFLL, (const unsigned __int8 *)v8);
  }

  else
  {
    sub_100009E80(&v7, 0xFFFFFFFFFFFFFFFFLL, (const unsigned __int8 *)a1);
  }

  sub_100009E70(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[1].u64[0]);
  sub_100009E70(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[1].u64[1]);
  sub_100009E70(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[2].u32[0]);
  sub_100009E70(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[2].u32[1]);
  sub_100009E70(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[2].u32[2]);
  sub_100009E70(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[2].u16[6]);
  sub_100009E70(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[2].u16[7]);
  sub_100009E70(&v7, 0xFFFFFFFFFFFFFFFFLL, a1[3].u8[0]);
  sub_100009C94(a2, &v7);
  return sub_100009CA4(&v7);
}

void sub_100005DF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

BOOL sub_100005E10(uint64_t a1)
{
  BOOL result = 0;
  if (!sub_100005954((void *)a1))
  {
    if (*(_DWORD *)(a1 + 40))
    {
      if (*(void *)(a1 + 24))
      {
        if (*(_DWORD *)(a1 + 32) != -1 && (*(_WORD *)(a1 + 16) & 0x3FFF) == 0)
        {
          int v3 = *(_DWORD *)(a1 + 36);
          if (v3)
          {
            if ((v3 & 0x3FFF) == 0) {
              return 1;
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100005E78(uint64_t a1, int a2, char *a3)
{
  *(void *)(a1 + 56) = 0LL;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0u;
  *(void *)a1 = 850045863LL;
  *(_DWORD *)(a1 + 64) = -1;
  uint64_t v4 = (int *)(a1 + 64);
  BOOL v5 = a2 == 0;
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = -1LL;
  *(void *)(a1 + 72) = 0LL;
  size_t v6 = (unint64_t *)(a1 + 72);
  *(void *)(a1 + 80) = 0LL;
  uint64_t v7 = (uint64_t *)(a1 + 80);
  if (a2) {
    int v8 = 16777218;
  }
  else {
    int v8 = 0x1000000;
  }
  if (v5) {
    int v9 = 1;
  }
  else {
    int v9 = 3;
  }
  int v32 = v9;
  int v10 = open(a3, v8, 384LL);
  int *v4 = v10;
  if (v10 == -1) {
    goto LABEL_29;
  }
  if (fstat(v10, &v31)) {
    goto LABEL_29;
  }
  if ((v31.st_mode & 0xF000) != 0x8000) {
    goto LABEL_29;
  }
  unint64_t st_size = v31.st_size;
  unint64_t *v6 = v31.st_size;
  if (st_size < 0x4000 || (st_size & 0x3FFF) != 0) {
    goto LABEL_29;
  }
  int64_t v12 = operator new(0x20uLL);
  uint64_t v13 = (uint64_t)v12;
  uint64_t v14 = 0x100000LL;
  if (st_size < 0x100000) {
    uint64_t v14 = st_size;
  }
  int v15 = *v4;
  v12[2] = 0LL;
  v12[3] = v14;
  size_t v16 = ((_DWORD)v14 + 0x3FFF) & 0x3FC000;
  v12[1] = v16;
  *int64_t v12 = mmap(0LL, v16, v9, 1, v15, 0LL);
  sub_100006674(v7, v13);
  uint64_t v17 = *v7;
  uint64_t v18 = *(void *)*v7;
  if (v18 == -1) {
    goto LABEL_28;
  }
  uint64_t v19 = (_DWORD *)(*(void *)(v17 + 16) + v18);
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = v19;
  if (v19 == (_DWORD *)-1LL) {
    goto LABEL_29;
  }
  if (*v19 != -22168898) {
    goto LABEL_29;
  }
  if (v19[1] != 1) {
    goto LABEL_29;
  }
  unsigned int v20 = v19[2];
  if (!v20) {
    goto LABEL_29;
  }
  if (v19[3] > v20) {
    goto LABEL_29;
  }
  unint64_t v21 = (56LL * v20 + 16407) & 0x7FFFFFC000LL;
  unint64_t v30 = v21;
  if (v21 > *v6) {
    goto LABEL_29;
  }
  if (*(void *)(v17 + 24) >= v21) {
    goto LABEL_26;
  }
  int v28 = 0;
  sub_100006114(v4, &v32, &v28, (uint64_t *)&v30, &v29);
  uint64_t v22 = v29;
  uint64_t v29 = 0LL;
  sub_100006674(v7, v22);
  uint64_t v23 = v29;
  uint64_t v29 = 0LL;
  if (v23)
  {
    BOOL v24 = (void *)sub_1000045D4(v23);
    operator delete(v24);
  }

  uint64_t v25 = *(void *)*v7;
  if (v25 == -1)
  {
LABEL_28:
    *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = -1LL;
    goto LABEL_29;
  }

  uint64_t v26 = *(void *)(*v7 + 16) + v25;
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = v26;
  if (v26 == -1)
  {
LABEL_29:
    sub_10000620C(a1);
    return a1;
  }

LABEL_26:
  if (!sub_1000061B8((pthread_mutex_t *)a1)) {
    goto LABEL_29;
  }
  fcntl(*v4, 48, 1LL);
  return a1;
}

          if (*(_DWORD *)(*(void *)(a1 + 88) + 12LL) < *(_DWORD *)(*(void *)(a1 + 88) + 8LL))
          {
            if ((v17 & 1) == 0) {
              goto LABEL_38;
            }
            goto LABEL_28;
          }
        }

        else
        {
          size_t v16 = (unint64_t *)(v10 + 24);
          uint64_t v19 = (unint64_t *)(v10 + 24);
          if (*(_DWORD *)(v10 + 8))
          {
LABEL_28:
            uint64_t v22 = (a4 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL;
            uint64_t v23 = *(void *)(a1 + 72) + v22;
            if (ftruncate(*(_DWORD *)(a1 + 64), v23))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                BOOL v24 = __error();
                uint64_t v25 = strerror(*v24);
                *(_DWORD *)stat buf = 134218242;
                size_t v42 = v23;
                size_t v43 = 2080;
                v44 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Call to extend file size to %lld failed. %s\n",  buf,  0x16u);
              }

              uint64_t v26 = __stderrp;
              __int128 v27 = __error();
              int v28 = strerror(*v27);
              fprintf(v26, "Call to extend file size to %lld failed. %s\n", v23, v28);
LABEL_45:
              ftruncate(*(_DWORD *)(a1 + 64), *(void *)(a1 + 72));
              int v8 = 4LL;
              goto LABEL_54;
            }

            uint64_t v29 = sub_100007BA8(a3, *(_DWORD *)(a1 + 64), *(void *)(a1 + 72));
            unint64_t v30 = v29;
            if (v29)
            {
              *((void *)a2 + 2) = *(void *)(a1 + 72);
              *((_DWORD *)a2 + 9) = v22;
              *(void *)(a1 + 72) = v23;
              fsync(*(_DWORD *)(a1 + 64));
            }

            if (!v22 || !a3->i64[0])
            {
              putchar(10);
              v40 = sub_100005204( "/Library/Caches/com.apple.xbs/Sources/CoreSymbolication/CoreSymbolication/MMapArchiveFileSystem.cpp");
              sub_100009FCC(v40);
              abort();
            }

            if (!v30) {
              goto LABEL_45;
            }
LABEL_38:
            if (*((_DWORD *)a2 + 8) == -2 && v12 != v16)
            {
              do
              {
                *((_BYTE *)v12 + 4std::ostream::~ostream(v2, v3 + 8) = 1;
                v12 += 7;
              }

              while (v12 != v16);
            }

            stat v31 = *(void *)(a1 + 88);
            int v32 = *(_DWORD *)(v31 + 12);
            memmove(v19 + 7, v19, v31 + 56LL * v32 - (void)v19 + 24);
            int v8 = 0LL;
            v33 = *(void *)(a1 + 88);
            __n128 v34 = *(_DWORD *)(v33 + 16);
            else {
              __n128 v35 = 1;
            }
            *(_DWORD *)(v33 + 16) = v35;
            *((_DWORD *)a2 + 10) = v35;
            __n128 v36 = *a2;
            v37 = a2[1];
            v38 = a2[2];
            v19[6] = *((void *)a2 + 6);
            *((_OWORD *)v19 + 1) = v37;
            *((_OWORD *)v19 + 2) = v38;
            *(_OWORD *)uint64_t v19 = v36;
            *(_DWORD *)(*(void *)(a1 + 88) + 12LL) = v32 + 1;
            goto LABEL_54;
          }
        }

        int v8 = 3LL;
LABEL_54:
        pthread_mutex_unlock((pthread_mutex_t *)a1);
        return v8;
      }

      return 6LL;
    }

    else
    {
      return 5LL;
    }
  }

  return v8;
}

void sub_1000060DC(_Unwind_Exception *a1)
{
}

void *sub_100006114@<X0>(int *a1@<X0>, int *a2@<X1>, int *a3@<X2>, uint64_t *a4@<X3>, void *a5@<X8>)
{
  int v10 = operator new(0x20uLL);
  int v11 = *a1;
  int v12 = *a2;
  uint64_t v13 = *a3;
  uint64_t v14 = *a4;
  v10[3] = *a4;
  size_t v15 = ((v13 + v14 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL) - (v13 & 0xFFFFFFFFFFFFC000LL);
  v10[1] = v15;
  v10[2] = v13 & 0x3FFF;
  BOOL result = mmap(0LL, v15, v12, 1, v11, v13 & 0xFFFFFFFFFFFFC000LL);
  void *v10 = result;
  *a5 = v10;
  return result;
}

void sub_1000061A4(_Unwind_Exception *a1)
{
}

BOOL sub_1000061B8(pthread_mutex_t *a1)
{
  BOOL v2 = sub_100007F24((uint64_t)a1);
  pthread_mutex_unlock(a1);
  return v2;
}

void sub_1000061F4(_Unwind_Exception *a1)
{
}

uint64_t sub_10000620C(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 64);
  if (v2 != -1)
  {
    close(v2);
    *(_DWORD *)(a1 + 64) = -1;
  }

  if (*(void *)(a1 + 80)) {
    sub_100006674((uint64_t *)(a1 + 80), 0LL);
  }
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = -1LL;
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void sub_100006268(_Unwind_Exception *a1)
{
}

uint64_t sub_100006288(uint64_t a1, char *a2, unsigned int a3)
{
  *(void *)(a1 + 56) = 0LL;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0u;
  *(void *)a1 = 850045863LL;
  *(_DWORD *)(a1 + 64) = -1;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = -1LL;
  unlink(a2);
  int v6 = open(a2, 16778754, 384LL);
  *(_DWORD *)(a1 + 64) = v6;
  if (v6 == -1 || (sub_100006410(a1, a3) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = __error();
      int v8 = strerror(*v7);
      *(_DWORD *)stat buf = 136315394;
      uint64_t v14 = a2;
      __int16 v15 = 2080;
      size_t v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Attempt to create [%s] failed. %s\n",  buf,  0x16u);
    }

    int v9 = __stderrp;
    int v10 = __error();
    int v11 = strerror(*v10);
    fprintf(v9, "Attempt to create [%s] failed. %s\n", a2, v11);
    sub_10000620C(a1);
  }

  return a1;
}

void sub_1000063F4(_Unwind_Exception *a1)
{
}

uint64_t sub_100006410(uint64_t a1, unsigned int a2)
{
  off_t v4 = (56LL * a2 + 16407) & 0x7FFFFFC000LL;
  *(void *)(a1 + 72) = v4;
  if (ftruncate(*(_DWORD *)(a1 + 64), v4)) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = operator new(0x20uLL);
  int v8 = *(_DWORD *)(a1 + 64);
  v7[2] = 0LL;
  v7[3] = v6;
  size_t v9 = (v6 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL;
  v7[1] = v9;
  void *v7 = mmap(0LL, v9, 3, 1, v8, 0LL);
  sub_100006674((uint64_t *)(a1 + 80), (uint64_t)v7);
  int v10 = *(void **)(a1 + 80);
  if (*v10 == -1LL) {
    return 0LL;
  }
  uint64_t v11 = v10[2] + *v10;
  if (v11 == -1) {
    return 0LL;
  }
  *(void *)uint64_t v11 = 0x1FEADBABELL;
  *(_DWORD *)(v11 + 12) = 0;
  *(_DWORD *)(v11 + 16) = 0;
  *(_DWORD *)(v11 + std::ostream::~ostream(v2, v3 + 8) = a2;
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = v11;
  return 1LL;
}

void sub_1000064E8(_Unwind_Exception *a1)
{
}

uint64_t sub_100006500(uint64_t a1, int a2, unsigned int a3)
{
  *(void *)(a1 + 56) = 0LL;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0u;
  *(void *)a1 = 850045863LL;
  *(_DWORD *)(a1 + 64) = a2;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = -1LL;
  if ((sub_100006410(a1, a3) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      off_t v4 = __error();
      BOOL v5 = strerror(*v4);
      *(_DWORD *)stat buf = 136315138;
      uint64_t v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Attempt to initialize fd failed. %s\n",  buf,  0xCu);
    }

    uint64_t v6 = __stderrp;
    uint64_t v7 = __error();
    int v8 = strerror(*v7);
    fprintf(v6, "Attempt to initialize fd failed. %s\n", v8);
    sub_10000620C(a1);
  }

  return a1;
}

void sub_10000661C(_Unwind_Exception *a1)
{
}

uint64_t sub_10000663C(uint64_t a1)
{
  return a1;
}

void sub_100006674(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    off_t v4 = (void *)sub_1000045D4(v3);
    operator delete(v4);
  }

uint64_t sub_1000066A0(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, uint64_t *a5)
{
  int v10 = *(_DWORD **)(a1 + 88);
  *a2 = v10[1];
  *a3 = v10[2];
  *a4 = v10[3];
  *a5 = sub_1000067A4(a1);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return 1LL;
}

void sub_100006718(_Unwind_Exception *a1)
{
}

uint64_t sub_100006730(uint64_t a1)
{
  uint64_t v2 = sub_1000067A4(a1);
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 88) + 8LL);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v2 - ((56LL * v3 + 16407) & 0x7FFFFFC000LL);
}

void sub_10000678C(_Unwind_Exception *a1)
{
}

uint64_t sub_1000067A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 88);
  uint64_t v2 = (56LL * *(unsigned int *)(v1 + 8) + 16407) & 0x7FFFFFC000LL;
  memset(v8, 0, sizeof(v8));
  int v9 = 1065353216;
  uint64_t v3 = *(unsigned int *)(v1 + 12);
  if ((_DWORD)v3)
  {
    uint64_t v4 = 56 * v3;
    uint64_t v5 = v1 + 40;
    do
    {
      unint64_t v7 = *(void *)v5;
      if (!sub_10000877C(v8, &v7))
      {
        unint64_t v7 = *(void *)v5;
        sub_100008830((uint64_t)v8, &v7, &v7);
        v2 += *(unsigned int *)(v5 + 20);
      }

      v5 += 56LL;
      v4 -= 56LL;
    }

    while (v4);
  }

  sub_100008734((uint64_t)v8);
  return v2;
}

void sub_100006858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

BOOL sub_100006870(uint64_t a1, uint64_t a2)
{
  v4.unint64_t st_size = 0LL;
  fstat(*(_DWORD *)(a1 + 64), &v4);
  return *(void *)(a2 + 16) + (unint64_t)*(unsigned int *)(a2 + 36) <= v4.st_size;
}

uint64_t sub_1000068BC(uint64_t a1, uint64_t a2)
{
  stat v4 = sub_100005518(&v28, (uint64_t)"match_archive -- UUID: ", 23LL);
  size_t v5 = strlen(__s);
  uint64_t v6 = sub_100005518(v4, (uint64_t)__s, v5);
  unint64_t v7 = sub_100005518(v6, (uint64_t)", uid: ", 7LL);
  int v8 = (void *)std::ostream::operator<<(v7, *(unsigned int *)(a2 + 32));
  int v9 = sub_100005518(v8, (uint64_t)", offset: ", 10LL);
  int v10 = (void *)std::ostream::operator<<(v9, *(void *)(a2 + 16));
  uint64_t v11 = sub_100005518(v10, (uint64_t)", size: ", 8LL);
  std::ostream::operator<<(v11, *(unsigned int *)(a2 + 36));
  sub_100005860((uint64_t)v29, __p);
  if (v27 >= 0) {
    int v12 = __p;
  }
  else {
    int v12 = (void **)__p[0];
  }
  sub_100009F24((uint64_t)v25, (uint64_t)v12);
  BOOL v13 = sub_100005954((void *)a2);
  char v14 = *(_DWORD *)(a2 + 32) == -1 || v13;
  if ((v14 & 1) == 0)
  {
    uint64_t v15 = *(void *)(a1 + 88);
    unsigned int v16 = *(_DWORD *)(v15 + 12);
    if (v16)
    {
      uint64_t v17 = (unint64_t *)(v15 + 24 + 56LL * v16);
      v31[158] = 0;
      for (unsigned int i = sub_1000081A0((unint64_t *)(v15 + 24), v17, (unint64_t *)a2); i != v17; i += 7)
      {
        if (*i != *(void *)a2 || i[1] != *(void *)(a2 + 8)) {
          break;
        }
        if (sub_100005BE8(a2, (uint64_t)i))
        {
          __int128 v22 = *(_OWORD *)i;
          __int128 v23 = *((_OWORD *)i + 1);
          __int128 v24 = *((_OWORD *)i + 2);
          *(_BYTE *)(a2 + 4std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)i + 48);
          *(_OWORD *)(a2 + 16) = v23;
          *(_OWORD *)(a2 + 32) = v24;
          *(_OWORD *)a2 = v22;
          uint64_t v20 = 1LL;
          goto LABEL_19;
        }
      }
    }
  }

  uint64_t v20 = 0LL;
LABEL_19:
  sub_100009F7C((uint64_t)v25);
  if (v27 < 0) {
    operator delete(__p[0]);
  }
  if (v30 < 0) {
    operator delete((void *)v29[8]);
  }
  std::streambuf::~streambuf(v29);
  std::ios::~ios(v31);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v20;
}

void sub_100006B0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  sub_100005494((uint64_t)&a18);
  pthread_mutex_unlock(v18);
  _Unwind_Resume(a1);
}

uint64_t sub_100006B80@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0LL;
  *(void *)(a3 + std::ostream::~ostream(v2, v3 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v6 = *(void *)(a1 + 88);
  unsigned int v7 = *(_DWORD *)(v6 + 12);
  if (v7)
  {
    int v8 = (__int128 *)(v6 + 24);
    uint64_t v9 = v6 + 24 + 56LL * v7;
    BOOL v13 = (void **)a3;
    do
    {
      uint64_t v10 = *a2;
      uint64_t v11 = a2[1];
      while (v10 != v11)
      {
        if (sub_100005BE8(v10, (uint64_t)v8))
        {
          sub_100008238(&v13, v8);
          break;
        }

        v10 += 56LL;
      }

      int v8 = (__int128 *)((char *)v8 + 56);
    }

    while (v8 != (__int128 *)v9);
  }

  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void sub_100006C34(_Unwind_Exception *a1)
{
}

uint64_t sub_100006C58@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int v9 = *(_DWORD *)(*(void *)(a1 + 88) + 12LL);
  a5[1] = 0LL;
  a5[2] = 0LL;
  *a5 = 0LL;
  sub_100009510((uint64_t)v51, a4);
  uint64_t v10 = sub_100008C7C((__int128 *)a2, (uint64_t)a3, (uint64_t)v51);
  uint64_t v45 = a1;
  uint64_t v11 = v52;
  if (v52 == v51)
  {
    uint64_t v12 = 4LL;
    uint64_t v11 = v51;
  }

  else
  {
    if (!v52) {
      goto LABEL_6;
    }
    uint64_t v12 = 5LL;
  }

  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_6:
  int v44 = v9;
  memset(v47, 0, sizeof(v47));
  int v48 = 1065353216;
  for (unsigned int i = (void *)a2; (__int128 *)a2 != v10; a2 += 56LL)
  {
    unint64_t v50 = *(void *)(a2 + 16);
    sub_100008830((uint64_t)v47, &v50, &v50);
    char v14 = (__int128 *)a5[1];
    unint64_t v13 = a5[2];
    if ((unint64_t)v14 >= v13)
    {
      uint64_t v19 = (__int128 *)*a5;
      uint64_t v20 = 0x6DB6DB6DB6DB6DB7LL * (((uint64_t)v14 - *a5) >> 3);
      unint64_t v21 = v20 + 1;
      unint64_t v22 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(v13 - (void)v19) >> 3);
      if (2 * v22 > v21) {
        unint64_t v21 = 2 * v22;
      }
      if (v22 >= 0x249249249249249LL) {
        unint64_t v23 = 0x492492492492492LL;
      }
      else {
        unint64_t v23 = v21;
      }
      if (v23)
      {
        __int128 v24 = (char *)sub_100003DCC((uint64_t)(a5 + 2), v23);
        uint64_t v19 = (__int128 *)*a5;
        char v14 = (__int128 *)a5[1];
      }

      else
      {
        __int128 v24 = 0LL;
      }

      uint64_t v25 = &v24[56 * v20];
      __int128 v26 = *(_OWORD *)a2;
      __int128 v27 = *(_OWORD *)(a2 + 16);
      __int128 v28 = *(_OWORD *)(a2 + 32);
      *((void *)v25 + 6) = *(void *)(a2 + 48);
      *((_OWORD *)v25 + 1) = v27;
      *((_OWORD *)v25 + 2) = v28;
      *(_OWORD *)uint64_t v25 = v26;
      if (v14 == v19)
      {
        v33 = &v24[56 * v20];
      }

      else
      {
        uint64_t v29 = &v24[56 * v20];
        do
        {
          __int128 v30 = *(__int128 *)((char *)v14 - 56);
          __int128 v31 = *(__int128 *)((char *)v14 - 40);
          __int128 v32 = *(__int128 *)((char *)v14 - 24);
          v33 = v29 - 56;
          *(v29 - std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)v14 - 8);
          *(_OWORD *)(v29 - 24) = v32;
          *(_OWORD *)(v29 - 40) = v31;
          *(_OWORD *)(v29 - 56) = v30;
          char v14 = (__int128 *)((char *)v14 - 56);
          v29 -= 56;
        }

        while (v14 != v19);
      }

      uint64_t v18 = (uint64_t)(v25 + 56);
      *a5 = (uint64_t)v33;
      a5[1] = (uint64_t)(v25 + 56);
      a5[2] = (uint64_t)&v24[56 * v23];
      if (v19) {
        operator delete(v19);
      }
    }

    else
    {
      __int128 v15 = *(_OWORD *)a2;
      __int128 v16 = *(_OWORD *)(a2 + 16);
      __int128 v17 = *(_OWORD *)(a2 + 32);
      *((void *)v14 + 6) = *(void *)(a2 + 48);
      v14[1] = v16;
      v14[2] = v17;
      *char v14 = v15;
      uint64_t v18 = (uint64_t)v14 + 56;
    }

    a5[1] = v18;
  }

  sub_100007094(a1, a5);
  v49 = v47;
  if (v10 == a3)
  {
LABEL_37:
    v41 = i;
  }

  else
  {
    uint64_t v34 = (char *)a3 - (char *)v10;
    __n128 v35 = v10;
    while (1)
    {
      unint64_t v50 = *((void *)v35 + 2);
      if (!sub_100009970(v47, &v50)) {
        break;
      }
      __n128 v35 = (__int128 *)((char *)v35 + 56);
      v34 -= 56LL;
      if (v35 == a3) {
        goto LABEL_37;
      }
    }

    __n128 v36 = (__int128 *)((char *)a3 - 56);
    do
    {
      if (v35 == v36)
      {
        a3 = v35;
        goto LABEL_37;
      }

      unint64_t v50 = *((void *)v36 + 2);
      __n128 v36 = (__int128 *)((char *)v36 - 56);
      v34 -= 56LL;
    }

    while (!sub_100009970(v47, &v50));
    uint64_t v37 = 0x6DB6DB6DB6DB6DB7LL * (v34 >> 3) + 1;
    if (v34 < 113)
    {
      v38 = 0LL;
      uint64_t v40 = 0LL;
    }

    else
    {
      v38 = sub_100008DA8(0x6DB6DB6DB6DB6DB7LL * (v34 >> 3) + 1);
      uint64_t v40 = v39;
    }

    v41 = i;
    a3 = sub_100009574(v35, (__int128 *)((char *)v36 + 56), &v49, v37, (unint64_t)v38, v40);
    if (v38) {
      operator delete(v38);
    }
  }

  sub_1000083A0(v10, a3, (void **)a5);
  unsigned int v42 = v44 + 1227133513 * ((unint64_t)(a5[1] - *a5) >> 3);
  *(_DWORD *)(*(void *)(v45 + 88) + 12LL) = v42;
  memmove(v41, a3, 56LL * v42);
  return sub_100008734((uint64_t)v47);
}

void sub_100007018( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23)
{
  if (v24) {
    operator delete(v24);
  }
  sub_100008734((uint64_t)&a13);
  __int128 v26 = *(void **)v23;
  if (*(void *)v23)
  {
    *(void *)(v23 + std::ostream::~ostream(v2, v3 + 8) = v26;
    operator delete(v26);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_100007094(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 != v3)
  {
    uint64_t v4 = result;
    do
    {
      bzero(v14, 0x18uLL);
      uint64_t v15 = *(void *)(v2 + 16);
      uint64_t v16 = *(unsigned int *)(v2 + 36);
      BOOL result = fcntl(*(_DWORD *)(v4 + 64), 99, v14);
      if ((_DWORD)result)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          uint64_t v6 = v15;
          uint64_t v5 = v16;
          unsigned int v7 = __error();
          int v8 = strerror(*v7);
          *(_DWORD *)stat buf = 134218498;
          uint64_t v18 = v6;
          __int16 v19 = 2048;
          uint64_t v20 = v5;
          __int16 v21 = 2080;
          unint64_t v22 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to execute PUNCHHOLE at offset %lld with size %lld. Reason = %s",  buf,  0x20u);
        }

        int v9 = __stderrp;
        uint64_t v10 = v15;
        uint64_t v11 = v16;
        uint64_t v12 = __error();
        unint64_t v13 = strerror(*v12);
        BOOL result = fprintf(v9, "Failed to execute PUNCHHOLE at offset %lld with size %lld. Reason = %s", v10, v11, v13);
      }

      v2 += 56LL;
    }

    while (v2 != v3);
  }

  return result;
}

uint64_t sub_100007204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, void *a4@<X8>)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = 0LL;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v8 = *(void *)(a1 + 88);
  unsigned int v9 = *(_DWORD *)(v8 + 12);
  if (v9)
  {
    v18[0] = &off_10000C880;
    v18[1] = a2;
    int8x16_t v18[2] = a3;
    __int16 v19 = v18;
    sub_100006C58(a1, v8 + 24, (__int128 *)(v8 + 24 + 56LL * v9), (uint64_t)v18, (uint64_t *)&v16);
    uint64_t v12 = v19;
    uint64_t v13 = v17;
    *(_OWORD *)a4 = v16;
    a4[2] = v13;
    uint64_t v17 = 0LL;
    __int128 v16 = 0uLL;
    if (v12 == v18)
    {
      uint64_t v14 = 4LL;
      uint64_t v12 = v18;
      goto LABEL_6;
    }

    if (v12)
    {
      uint64_t v14 = 5LL;
LABEL_6:
      (*(void (**)(void *, uint64_t, uint64_t))(*v12 + 8 * v14))(v12, v10, v11);
    }
  }

  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void sub_100007300( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  uint64_t v18 = a15;
  if (a15 == v16)
  {
    uint64_t v19 = 4LL;
    uint64_t v18 = &a12;
  }

  else
  {
    if (!a15) {
      goto LABEL_6;
    }
    uint64_t v19 = 5LL;
  }

  (*(void (**)(void))(*(void *)v18 + 8 * v19))();
LABEL_6:
  pthread_mutex_unlock(v15);
  _Unwind_Resume(a1);
}

uint64_t sub_100007358@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 88);
    unsigned int v7 = *(_DWORD *)(v6 + 12);
    if (v7)
    {
      uint64_t v16 = 0LL;
      v17[0] = &off_10000C910;
      v17[1] = a2;
      v17[2] = &v16;
      uint64_t v18 = v17;
      sub_100006C58(a1, v6 + 24, (__int128 *)(v6 + 24 + 56LL * v7), (uint64_t)v17, (uint64_t *)&v14);
      uint64_t v10 = v18;
      uint64_t v11 = v15;
      *(_OWORD *)a3 = v14;
      a3[2] = v11;
      uint64_t v15 = 0LL;
      __int128 v14 = 0uLL;
      if (v10 == v17)
      {
        uint64_t v12 = 4LL;
        uint64_t v10 = v17;
        goto LABEL_7;
      }

      if (v10)
      {
        uint64_t v12 = 5LL;
LABEL_7:
        (*(void (**)(void *, uint64_t, uint64_t))(*v10 + 8 * v12))(v10, v8, v9);
      }
    }
  }

  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void sub_100007458( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  uint64_t v20 = a17;
  if (a17 == v18)
  {
    uint64_t v21 = 4LL;
    uint64_t v20 = &a14;
  }

  else
  {
    if (!a17) {
      goto LABEL_6;
    }
    uint64_t v21 = 5LL;
  }

  (*(void (**)(void))(*(void *)v20 + 8 * v21))();
LABEL_6:
  pthread_mutex_unlock(v17);
  _Unwind_Resume(a1);
}

uint64_t sub_1000074B0(uint64_t a1, __int128 *a2, int32x4_t *a3, size_t a4)
{
  if (sub_100005954(a2) || *((_DWORD *)a2 + 8) == -1) {
    return 1LL;
  }
  uint64_t v8 = 1LL;
  if (a4 >= 0x60 && a3 && *((void *)a2 + 3))
  {
    if (a3->i32[1])
    {
      __int32 v9 = a3[3].i32[0];
      if (v9 == sub_1000042E4(a3) && sub_100004300(a3))
      {
        pthread_mutex_lock((pthread_mutex_t *)a1);
        uint64_t v10 = *(void *)(a1 + 88);
        unsigned int v11 = *(_DWORD *)(v10 + 12);
        uint64_t v12 = (unint64_t *)(v10 + 24);
        if (v11)
        {
          unsigned int v13 = *((_DWORD *)a2 + 8);
          __int128 v14 = sub_100008400(v12, (unint64_t *)(v10 + 56LL * v11 + 24), (unint64_t *)a2);
          uint64_t v12 = v14;
          uint64_t v16 = v15;
          char v17 = 1;
          if (v14 == v15)
          {
            uint64_t v19 = v14;
          }

          else
          {
            uint64_t v18 = v15;
            uint64_t v19 = v14;
            while (1)
            {
              unsigned int v20 = *((_DWORD *)v19 + 8);
              if (v20 == -2) {
                break;
              }
              if (v20 >= v13)
              {
                if (v20 == v13)
                {
                  if (sub_100007944( a3,  *((unsigned __int16 *)a2 + 23),  (uint64_t)v19,  *(_DWORD *)(a1 + 64)))
                  {
                    *((_BYTE *)v19 + 4std::ostream::~ostream(v2, v3 + 8) = 1;
                    goto LABEL_26;
                  }

                  goto LABEL_53;
                }

                if ((v17 & 1) != 0)
                {
                  if (sub_100007AE4(a3, a4, (uint64_t)v19, *(_DWORD *)(a1 + 64)))
                  {
                    char v17 = 0;
                    *((void *)a2 + 2) = v19[2];
                    *((_DWORD *)a2 + 9) = *((_DWORD *)v19 + 9);
                  }
                }

                else
                {
                  uint64_t v19 = v18;
                }

                goto LABEL_26;
              }

              if ((v17 & 1) != 0 && sub_100007AE4(a3, a4, (uint64_t)v19, *(_DWORD *)(a1 + 64)))
              {
                char v17 = 0;
                *((void *)a2 + 2) = v19[2];
                *((_DWORD *)a2 + 9) = *((_DWORD *)v19 + 9);
              }

              uint64_t v18 = v19 + 7;
              uint64_t v19 = v18;
              if (v18 == v16)
              {
                uint64_t v19 = v16;
                goto LABEL_26;
              }
            }

            if (*((_DWORD *)a2 + 8) != -2
              || (int v39 = sub_100007944(a3, *((unsigned __int16 *)a2 + 23), (uint64_t)v19, *(_DWORD *)(a1 + 64)),
                  uint64_t v19 = v12,
                  !v39))
            {
LABEL_53:
              uint64_t v8 = 2LL;
              goto LABEL_54;
            }
          }

void sub_1000078F8(_Unwind_Exception *a1)
{
}

uint64_t sub_100007944(_DWORD *a1, unsigned int a2, uint64_t a3, int a4)
{
  if (*(_WORD *)(a3 + 44) == 7)
  {
    uint64_t v7 = *(void *)(a3 + 16);
    uint64_t v19 = *(unsigned int *)(a3 + 36);
    uint64_t v8 = v7 & 0x3FFF;
    size_t v17 = ((v7 + v19 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL) - (v7 & 0xFFFFFFFFFFFFC000LL);
    uint64_t v18 = v8;
    __int32 v9 = (char *)mmap(0LL, v17, 1, 1, a4, v7 & 0xFFFFFFFFFFFFC000LL);
    uint64_t v16 = v9;
    uint64_t v10 = &v9[v8];
    if (*(unsigned __int16 *)(a3 + 46) < a2
      || sub_1000044E4(a1) && !sub_1000044E4(v10)
      || a1[3] > *((_DWORD *)v10 + 3)
      || a1[4] > *((_DWORD *)v10 + 4)
      || a1[6] > *((_DWORD *)v10 + 6)
      || a1[20] && (a1[7] & 0x1000) != 0 && !*((_DWORD *)v10 + 20))
    {
      goto LABEL_10;
    }

    uint64_t v12 = sub_1000085FC(a1);
    if (v12 && *((_DWORD *)v12 + 1)) {
      unsigned int v13 = *((_DWORD *)v12 + 2) >= 0x14u ? (int *)(v12 + 16) : 0LL;
    }
    else {
      unsigned int v13 = 0LL;
    }
    __int128 v14 = sub_1000085FC(v10);
    if (!v14 || !*((_DWORD *)v14 + 1)) {
      goto LABEL_26;
    }
    uint64_t v11 = 0LL;
    if (!v13 || *((_DWORD *)v14 + 2) < 0x14u) {
      goto LABEL_27;
    }
    if (sub_10000534C(*v13, *((_DWORD *)v14 + 4))) {
LABEL_10:
    }
      uint64_t v11 = 1LL;
    else {
LABEL_26:
    }
      uint64_t v11 = 0LL;
LABEL_27:
    sub_1000045D4((uint64_t)&v16);
    return v11;
  }

  return 1LL;
}

void sub_100007AD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL sub_100007AE4(const void *a1, size_t a2, uint64_t a3, int a4)
{
  if (((a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL) != *(_DWORD *)(a3 + 36)) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v13 = v6 & 0x3FFF;
  unint64_t v14 = (a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL;
  size_t v12 = ((((a2 + 0x3FFF) | 0x3FFF) + v6) & 0xFFFFFFFFFFFFC000LL) - (v6 & 0xFFFFFFFFFFFFC000LL);
  uint64_t v11 = (char *)mmap(0LL, v12, 1, 1, a4, v6 & 0xFFFFFFFFFFFFC000LL);
  uint64_t v7 = &v11[v13];
  if (v11 == (char *)-1LL || v7 + 1 == 0LL)
  {
    sub_1000045D4((uint64_t)&v11);
    return 0LL;
  }

  BOOL v9 = memcmp(a1, v7, a2) == 0;
  sub_1000045D4((uint64_t)&v11);
  return v9;
}

BOOL sub_100007BA8(int32x4_t *__buf, int __fd, off_t a3)
{
  uint64_t v3 = __buf;
  off_t v11 = a3;
  if ((__buf[1].i8[13] & 0x10) != 0 || !__buf[5].i32[0])
  {
    size_t v10 = __buf->u32[1];
    return sub_10000866C(__buf, v10, __fd, &v11);
  }

  uint64_t v5 = __buf->u32[1];
  BOOL result = sub_10000866C(__buf, 4uLL, __fd, &v11);
  if ((_DWORD)result)
  {
    int __bufa = v3->i32[1] - v3[5].i32[0];
    BOOL result = sub_10000866C(&__bufa, 4uLL, __fd, &v11);
    if ((_DWORD)result)
    {
      BOOL result = sub_10000866C(&v3->u64[1], 0x28uLL, __fd, &v11);
      if ((_DWORD)result)
      {
        int v13 = sub_1000042E4(v3) - v3[5].i32[0];
        BOOL result = sub_10000866C(&v13, 4uLL, __fd, &v11);
        if ((_DWORD)result)
        {
          BOOL result = sub_10000866C((char *)v3[3].i64 + 4, 0x18uLL, __fd, &v11);
          if ((_DWORD)result)
          {
            uint64_t v12 = 0LL;
            BOOL v7 = sub_10000866C(&v12, 8uLL, __fd, &v11);
            BOOL result = 0LL;
            if (v7)
            {
              unint64_t v8 = (36 * v3[1].i32[1])
              unint64_t v9 = (unint64_t)v3[6].u64
                 + 32 * v3->i32[2]
                 + 24 * v3->i32[3]
                 + (24 * v3[1].i32[0])
              BOOL result = sub_10000866C( (char *)v3[5].i64 + 4,  (32 * v3->i32[2])
                       + (unint64_t)(24 * v3->i32[3])
                       + (24 * v3[1].i32[0])
                       + (unint64_t)(4 * v3[1].i32[0])
                       + v8
                       + 12,
                         __fd,
                         &v11);
              if ((_DWORD)result)
              {
                __stat buf = (int32x4_t *)(v9 + v3[5].u32[0]);
                size_t v10 = &v3->i8[v5] - (__int8 *)__buf;
                return sub_10000866C(__buf, v10, __fd, &v11);
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100007D50(uint64_t a1, uint64_t *a2, _DWORD *a3)
{
  *a3 = 0;
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v4 = *(unsigned int *)(v3 + 12);
  uint64_t v8 = 56 * v4;
  for (unsigned int i = (_BYTE *)(v3 + 72); ; i += 56)
  {
    if (*i) {
      goto LABEL_11;
    }
    int v10 = *(_DWORD *)(a1 + 64);
    uint64_t v11 = *((void *)i - 4);
    uint64_t v22 = *((unsigned int *)i - 3);
    size_t v20 = ((v11 + v22 + 0x3FFF) & 0xFFFFFFFFFFFFC000LL) - (v11 & 0xFFFFFFFFFFFFC000LL);
    uint64_t v21 = v11 & 0x3FFF;
    uint64_t v12 = (char *)mmap(0LL, v20, 1, 1, v10, v11 & 0xFFFFFFFFFFFFC000LL);
    uint64_t v19 = v12;
    __int128 v13 = *((_OWORD *)i - 3);
    uint64_t v14 = *(void *)i;
    __int128 v15 = *((_OWORD *)i - 1);
    v23[1] = *((_OWORD *)i - 2);
    v23[2] = v15;
    uint64_t v24 = v14;
    v23[0] = v13;
    int v16 = sub_1000074B0(*a2, v23, (int32x4_t *)&v12[v21], DWORD1(v15));
    *a3 = v16;
    if (v16)
    {
      if (v16 != 5) {
        break;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "coresymbolicationd: compact operation encountered empty archive:",  (uint8_t *)v18,  2u);
      }
    }

    sub_1000045D4((uint64_t)&v19);
LABEL_11:
    v8 -= 56LL;
    if (!v8) {
      return 1LL;
    }
  }

  sub_1000045D4((uint64_t)&v19);
  return 0LL;
}

void sub_100007F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

BOOL sub_100007F24(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 64);
  if (v2 == -1 || fstat(v2, &v30) || (v30.st_mode & 0xF000) != 0x8000) {
    return 0LL;
  }
  BOOL result = 0LL;
  unint64_t v4 = *(void *)(a1 + 72);
  if ((v4 & 0x3FFF) == 0 && v4 >= 0x4000 && v4 <= v30.st_size)
  {
    if (!*(void *)(a1 + 80)) {
      return 0LL;
    }
    uint64_t v5 = *(_DWORD **)(a1 + 88);
    if (v5 == (_DWORD *)-1LL) {
      return 0LL;
    }
    if (*v5 != -22168898) {
      return 0LL;
    }
    if (v5[1] != 1) {
      return 0LL;
    }
    unsigned int v6 = v5[2];
    if (!v6) {
      return 0LL;
    }
    unsigned int v7 = v5[3];
    if (v7 > v6) {
      return 0LL;
    }
    unint64_t v8 = (56LL * v6 + 16407) & 0x7FFFFFC000LL;
    if (v8 > v4) {
      return 0LL;
    }
    if (v7)
    {
      uint64_t v9 = 0LL;
      unsigned int v10 = 0;
      while (1)
      {
        uint64_t v11 = v5;
        uint64_t v12 = &v5[v9];
        __int128 v13 = &v5[v9 + 6];
        BOOL result = sub_100005E10((uint64_t)v13);
        if (!result) {
          break;
        }
        uint64_t v5 = *(_DWORD **)(a1 + 88);
        if (v12[16] > v5[4]) {
          return 0LL;
        }
        unint64_t v14 = *(void *)&v11[v9 + 10];
        if (v11[v9 + 14] == -2)
        {
          if (v10)
          {
            __int128 v15 = &v5[14 * v10 - 14];
            uint64_t v17 = *((void *)v15 + 3);
            uint64_t v16 = *((void *)v15 + 4);
            BOOL v18 = *v13 == v17 && v13[1] == v16;
            if (v18) {
              return 0LL;
            }
          }

          unsigned int v19 = v5[3];
          if (v10 < v19 - 1 && *v13 == *(void *)&v5[v9 + 20] && v13[1] == *(void *)&v5[v9 + 22]) {
            return 0LL;
          }
        }

        else
        {
          unsigned int v19 = v5[3];
        }

        ++v10;
        v9 += 14LL;
        if (v10 >= v19)
        {
          if (v19 < 2) {
            return 1LL;
          }
          uint64_t v21 = v5 + 32;
          uint64_t v22 = v19 - 1LL;
          do
          {
            unint64_t v23 = bswap64(*((void *)v21 - 13));
            unint64_t v24 = bswap64(*((void *)v21 - 6));
            if (v23 == v24 && (unint64_t v23 = bswap64(*((void *)v21 - 12)), v24 = bswap64(*((void *)v21 - 5)), v23 == v24))
            {
              int v25 = 0;
            }

            else if (v23 < v24)
            {
              int v25 = -1;
            }

            else
            {
              int v25 = 1;
            }

            unsigned int v26 = *((_DWORD *)v21 - 18);
            unsigned int v27 = *((_DWORD *)v21 - 4);
            BOOL v18 = v25 == 0;
            BOOL v28 = v25 < 0;
            if (v18) {
              BOOL v28 = v26 < v27;
            }
            if (!v28)
            {
              BOOL v29 = *v21 || *(v21 - 56) != 0;
              BOOL result = 0LL;
              if (!v29 || v27 != v26) {
                break;
              }
            }

            v21 += 56;
            BOOL result = 1LL;
            --v22;
          }

          while (v22);
          return result;
        }
      }
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

unint64_t *sub_1000081A0(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  if (a2 != a1)
  {
    unint64_t v3 = 0x6DB6DB6DB6DB6DB7LL * (a2 - a1);
    a2 = a1;
    do
    {
      unint64_t v4 = v3 >> 1;
      uint64_t v5 = &a2[7 * (v3 >> 1)];
      unint64_t v6 = bswap64(*v5);
      unint64_t v7 = bswap64(*a3);
      if (v6 == v7 && (unint64_t v6 = bswap64(v5[1]), v7 = bswap64(a3[1]), v6 == v7))
      {
        int v8 = 0;
      }

      else if (v6 < v7)
      {
        int v8 = -1;
      }

      else
      {
        int v8 = 1;
      }

      uint64_t v9 = v5 + 7;
      v3 += ~v4;
      if (v8 < 0) {
        a2 = v9;
      }
      else {
        unint64_t v3 = v4;
      }
    }

    while (v3);
  }

  return a2;
}

void ***sub_100008238(void ***a1, __int128 *a2)
{
  unint64_t v4 = *a1;
  uint64_t v5 = (char *)(*a1)[1];
  unint64_t v6 = *a1;
  uint64_t v9 = (char *)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  int v8 = v9;
  if (v5 >= v9)
  {
    uint64_t v14 = 0x6DB6DB6DB6DB6DB7LL * ((v5 - (_BYTE *)*v4) >> 3);
    unint64_t v15 = v14 + 1;
    unint64_t v16 = 0x6DB6DB6DB6DB6DB7LL * ((v8 - (_BYTE *)*v4) >> 3);
    if (2 * v16 > v15) {
      unint64_t v15 = 2 * v16;
    }
    if (v16 >= 0x249249249249249LL) {
      unint64_t v17 = 0x492492492492492LL;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v17) {
      BOOL v18 = (char *)sub_100003DCC(v7, v17);
    }
    else {
      BOOL v18 = 0LL;
    }
    unsigned int v19 = &v18[56 * v14];
    size_t v20 = &v18[56 * v17];
    __int128 v21 = *a2;
    __int128 v22 = a2[1];
    __int128 v23 = a2[2];
    *((void *)v19 + 6) = *((void *)a2 + 6);
    *((_OWORD *)v19 + 1) = v22;
    *((_OWORD *)v19 + 2) = v23;
    *(_OWORD *)unsigned int v19 = v21;
    __int128 v13 = v19 + 56;
    int v25 = (char *)*v4;
    unint64_t v24 = (char *)v4[1];
    if (v24 != *v4)
    {
      do
      {
        __int128 v26 = *(_OWORD *)(v24 - 56);
        __int128 v27 = *(_OWORD *)(v24 - 40);
        __int128 v28 = *(_OWORD *)(v24 - 24);
        *(v19 - std::ostream::~ostream(v2, v3 + 8) = *(v24 - 8);
        *(_OWORD *)(v19 - 24) = v28;
        *(_OWORD *)(v19 - 40) = v27;
        *(_OWORD *)(v19 - 56) = v26;
        v19 -= 56;
        v24 -= 56;
      }

      while (v24 != v25);
      unint64_t v24 = (char *)*v4;
    }

    void *v4 = v19;
    v4[1] = v13;
    v4[2] = v20;
    if (v24) {
      operator delete(v24);
    }
  }

  else
  {
    __int128 v10 = *a2;
    __int128 v11 = a2[1];
    __int128 v12 = a2[2];
    *((void *)v5 + 6) = *((void *)a2 + 6);
    *((_OWORD *)v5 + 1) = v11;
    *((_OWORD *)v5 + 2) = v12;
    *(_OWORD *)uint64_t v5 = v10;
    __int128 v13 = v5 + 56;
  }

  v4[1] = v13;
  return a1;
}

__int128 *sub_1000083A0(__int128 *a1, __int128 *a2, void **a3)
{
  unint64_t v3 = a1;
  unint64_t v6 = a3;
  if (a1 == a2) {
    return a1;
  }
  unint64_t v4 = a2;
  do
  {
    sub_100008238(&v6, v3);
    unint64_t v3 = (__int128 *)((char *)v3 + 56);
  }

  while (v3 != v4);
  return v4;
}

unint64_t *sub_100008400(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = a2;
  if (a2 != a1)
  {
    uint64_t v5 = a1;
    unint64_t v6 = 0x6DB6DB6DB6DB6DB7LL * (a2 - a1);
    while (1)
    {
      unint64_t v7 = v6 >> 1;
      int v8 = &v5[7 * (v6 >> 1)];
      unint64_t v9 = bswap64(*v8);
      unint64_t v10 = bswap64(*a3);
      if (v9 == v10 && (unint64_t v9 = bswap64(v8[1]), v10 = bswap64(a3[1]), v9 == v10)
        || (v9 < v10 ? (int v11 = -1) : (int v11 = 1), (v11 & 0x80000000) == 0))
      {
        unint64_t v12 = bswap64(*a3);
        unint64_t v13 = bswap64(*v8);
        if (v12 == v13 && (unint64_t v12 = bswap64(a3[1]), v13 = bswap64(v8[1]), v12 == v13)
          || (v12 < v13 ? (int v14 = -1) : (int v14 = 1), (v14 & 0x80000000) == 0))
        {
          uint64_t v5 = sub_1000081A0(v5, v8, a3);
          sub_100008564(v8 + 7, v3, a3);
          return v5;
        }

        unint64_t v3 = v8;
      }

      else
      {
        uint64_t v5 = v8 + 7;
        unint64_t v7 = v6 + ~v7;
      }

      unint64_t v6 = v7;
      if (!v7) {
        return v5;
      }
    }
  }

  return a2;
}

unint64_t *sub_100008564(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  if (a2 != a1)
  {
    unint64_t v3 = 0x6DB6DB6DB6DB6DB7LL * (a2 - a1);
    a2 = a1;
    do
    {
      unint64_t v4 = v3 >> 1;
      uint64_t v5 = &a2[7 * (v3 >> 1)];
      unint64_t v6 = bswap64(*a3);
      unint64_t v7 = bswap64(*v5);
      if (v6 == v7 && (unint64_t v6 = bswap64(a3[1]), v7 = bswap64(v5[1]), v6 == v7))
      {
        int v8 = 0;
      }

      else if (v6 < v7)
      {
        int v8 = -1;
      }

      else
      {
        int v8 = 1;
      }

      unint64_t v9 = v5 + 7;
      v3 += ~v4;
      if (v8 < 0) {
        unint64_t v3 = v4;
      }
      else {
        a2 = v9;
      }
    }

    while (v3);
  }

  return a2;
}

char *sub_1000085FC(_DWORD *a1)
{
  BOOL result = (char *)sub_10000447C(a1);
  unint64_t v3 = (char *)a1 + a1[1];
  BOOL v4 = v3 > result;
  unint64_t v5 = v3 - result;
  if (!v4 || v5 < 0xC || *(_DWORD *)result != 12648430 || !*((_DWORD *)result + 1)) {
    return 0LL;
  }
  LODWORD(v6) = *((_DWORD *)result + 2);
  else {
    uint64_t v6 = v6;
  }
  if (v5 != v6) {
    return 0LL;
  }
  return result;
}

BOOL sub_10000866C(void *__buf, size_t __nbyte, int __fd, off_t *a4)
{
  if (!__nbyte) {
    return 1LL;
  }
  size_t v6 = __nbyte;
  off_t v8 = *a4;
  do
  {
    int v9 = 4;
    do
    {
      ssize_t v10 = pwrite(__fd, __buf, v6, v8);
      BOOL v11 = v10 != -1;
      if (v10 == -1 && *__error() != 4) {
        return 0LL;
      }
    }

    while (*__error() == 4 && v9-- != 0);
    if (v10 == -1) {
      break;
    }
    off_t v8 = *a4 + v10;
    *a4 = v8;
    v6 -= v10;
  }

  while (v6);
  return v11;
}

uint64_t sub_100008734(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      int v2 = v3;
    }

    while (v3);
  }

  BOOL v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_10000877C(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (*(void *)&v2 - 1LL) & v3;
  }

  size_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  BOOL result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v3 == v8)
      {
        if (result[2] == v3) {
          return result;
        }
      }

      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }

        else
        {
          v8 &= *(void *)&v2 - 1LL;
        }

        if (v8 != v5) {
          return 0LL;
        }
      }

      BOOL result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void *sub_100008830(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }

    int v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (unsigned int i = *v9; i; unsigned int i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }

        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }

          else
          {
            v11 &= v7 - 1;
          }

          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }

  unsigned int i = operator new(0x18uLL);
  void *i = 0LL;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_100008A48(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  unsigned int v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    *unsigned int v19 = i;
    goto LABEL_39;
  }

  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    unsigned int v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_100008A34(_Unwind_Exception *a1)
{
}

void sub_100008A48(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_100008B24(a1, prime);
  }

void sub_100008B24(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_100003E14();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * vstd::ostream::~ostream(v2, v3 + 8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    ssize_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0LL;
  }

__int128 *sub_100008C7C(__int128 *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a1;
  if (a1 != (__int128 *)a2)
  {
    uint64_t v5 = a2;
    for (uint64_t i = a2 - (void)a1; ; i -= 56LL)
    {
      uint64_t v7 = *(void *)(a3 + 24);
      if (!v7) {
LABEL_17:
      }
        sub_1000091CC();
      unint64_t v3 = (__int128 *)((char *)v3 + 56);
    }

    while (1)
    {
      v5 -= 56LL;
      uint64_t v8 = *(void *)(a3 + 24);
      if (!v8) {
        goto LABEL_17;
      }
      i -= 56LL;
      if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v8 + 48LL))(v8, v5))
      {
        uint64_t v9 = 0x6DB6DB6DB6DB6DB7LL * (i >> 3) + 1;
        if (i < 113)
        {
          ssize_t v10 = 0LL;
          uint64_t v12 = 0LL;
        }

        else
        {
          ssize_t v10 = sub_100008DA8(0x6DB6DB6DB6DB6DB7LL * (i >> 3) + 1);
          uint64_t v12 = v11;
        }

        unint64_t v3 = sub_100008E18((uint64_t)v3, v5, a3, v9, (unint64_t)v10, v12);
        if (v10) {
          operator delete(v10);
        }
        return v3;
      }
    }
  }

  return v3;
}

void sub_100008D90(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100008DA8(uint64_t a1)
{
  if (a1 < 1) {
    return 0LL;
  }
  if (a1 >= 0x249249249249249LL) {
    unint64_t v1 = 0x249249249249249LL;
  }
  else {
    unint64_t v1 = a1;
  }
  while (1)
  {
    BOOL result = operator new(56 * v1, &std::nothrow);
    if (result) {
      break;
    }
    BOOL v3 = v1 > 1;
    v1 >>= 1;
    if (!v3) {
      return 0LL;
    }
  }

  return result;
}

__int128 *sub_100008E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v7 = a2;
  uint64_t v8 = a1;
  if (a4 == 3)
  {
    uint64_t v17 = *(void *)(a3 + 24);
    if (v17)
    {
      uint64_t v18 = (__int128 *)(v8 + 56);
      if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v17 + 48LL))(v17, v8 + 56))
      {
        __int128 v50 = *(_OWORD *)(v8 + 72);
        __int128 v49 = *(_OWORD *)(v8 + 88);
        __int128 v51 = *v18;
        uint64_t v52 = *(void *)(v8 + 104);
        __int128 v54 = *(_OWORD *)(v7 + 16);
        __int128 v53 = *(_OWORD *)(v7 + 32);
        __int128 v55 = *(_OWORD *)v7;
        *(_BYTE *)(v8 + 104) = *(_BYTE *)(v7 + 48);
        *(_OWORD *)(v8 + 72) = v54;
        *(_OWORD *)(v8 + 8std::ostream::~ostream(v2, v3 + 8) = v53;
        __int128 *v18 = v55;
        *(_BYTE *)(v7 + 4std::ostream::~ostream(v2, v3 + 8) = v52;
        *(_OWORD *)uint64_t v7 = v51;
        *(_OWORD *)(v7 + 16) = v50;
        *(_OWORD *)(v7 + 32) = v49;
        uint64_t v56 = *(void *)(v8 + 48);
        __int128 v58 = *(_OWORD *)(v8 + 16);
        __int128 v57 = *(_OWORD *)(v8 + 32);
        __int128 v59 = *(_OWORD *)v8;
        __int128 v60 = *(_OWORD *)(v8 + 72);
        *(_OWORD *)uint64_t v8 = *v18;
        *(_OWORD *)(v8 + 16) = v60;
        *(_OWORD *)(v8 + 32) = *(_OWORD *)(v8 + 88);
        *(_BYTE *)(v8 + 4std::ostream::~ostream(v2, v3 + 8) = *(_BYTE *)(v8 + 104);
        __int128 *v18 = v59;
        *(_OWORD *)(v8 + 72) = v58;
        *(_OWORD *)(v8 + 8std::ostream::~ostream(v2, v3 + 8) = v57;
        uint64_t v7 = v8 + 56;
        *(_BYTE *)(v8 + 104) = v56;
        return (__int128 *)v7;
      }

      uint64_t v19 = *(void *)(v8 + 48);
      __int128 v21 = *(_OWORD *)(v8 + 16);
      __int128 v20 = *(_OWORD *)(v8 + 32);
      __int128 v22 = *(_OWORD *)v8;
      __int128 v23 = *(_OWORD *)(v8 + 72);
      *(_OWORD *)uint64_t v8 = *v18;
      *(_OWORD *)(v8 + 16) = v23;
      *(_OWORD *)(v8 + 32) = *(_OWORD *)(v8 + 88);
      *(_BYTE *)(v8 + 4std::ostream::~ostream(v2, v3 + 8) = *(_BYTE *)(v8 + 104);
      __int128 *v18 = v22;
      *(_OWORD *)(v8 + 72) = v21;
      *(_OWORD *)(v8 + 8std::ostream::~ostream(v2, v3 + 8) = v20;
      *(_BYTE *)(v8 + 104) = v19;
      __int128 v11 = *(_OWORD *)(v8 + 72);
      __int128 v10 = *(_OWORD *)(v8 + 88);
      __int128 v12 = *v18;
      uint64_t v13 = *(void *)(v8 + 104);
      __int128 v25 = *(_OWORD *)(v7 + 16);
      __int128 v24 = *(_OWORD *)(v7 + 32);
      __int128 v26 = *(_OWORD *)v7;
      *(_BYTE *)(v8 + 104) = *(_BYTE *)(v7 + 48);
      *(_OWORD *)(v8 + 72) = v25;
      *(_OWORD *)(v8 + 8std::ostream::~ostream(v2, v3 + 8) = v24;
      __int128 *v18 = v26;
      goto LABEL_7;
    }

    goto LABEL_33;
  }

  if (a4 == 2)
  {
    __int128 v11 = *(_OWORD *)(a1 + 16);
    __int128 v10 = *(_OWORD *)(a1 + 32);
    __int128 v12 = *(_OWORD *)a1;
    uint64_t v13 = *(void *)(a1 + 48);
    __int128 v15 = *(_OWORD *)(a2 + 16);
    __int128 v14 = *(_OWORD *)(a2 + 32);
    __int128 v16 = *(_OWORD *)a2;
    *(_BYTE *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = *(_BYTE *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v15;
    *(_OWORD *)(a1 + 32) = v14;
    *(_OWORD *)a1 = v16;
LABEL_7:
    *(_BYTE *)(v7 + 4std::ostream::~ostream(v2, v3 + 8) = v13;
    *(_OWORD *)uint64_t v7 = v12;
    *(_OWORD *)(v7 + 16) = v11;
    *(_OWORD *)(v7 + 32) = v10;
    return (__int128 *)v7;
  }

  if (a6 < a4)
  {
    if (a4 >= 0) {
      uint64_t v29 = a4;
    }
    else {
      uint64_t v29 = a4 + 1;
    }
    uint64_t v30 = *(void *)(a3 + 24);
    if (v30)
    {
      uint64_t v31 = v29 >> 1;
      v74 = (__int128 *)(v8 + 56 * (v29 >> 1));
      uint64_t v32 = 56 * (v29 >> 1) - 56;
      uint64_t v33 = v29 >> 1;
      while (((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v30 + 48LL))(v30, v8 + v32) & 1) == 0)
      {
        if (!v32) {
          goto LABEL_28;
        }
        --v33;
        uint64_t v30 = *(void *)(a3 + 24);
        v32 -= 56LL;
        if (!v30) {
          goto LABEL_33;
        }
      }

      uint64_t v8 = sub_100008E18(v8, v8 + v32, a3, v33, a5, a6);
LABEL_28:
      uint64_t v61 = *(void *)(a3 + 24);
      if (v61)
      {
        __int128 v62 = (__int128 *)(v7 + 56);
        uint64_t v63 = a4 - v31;
        BOOL v64 = v74;
        while ((*(unsigned int (**)(uint64_t, __int128 *))(*(void *)v61 + 48LL))(v61, v64))
        {
          BOOL v64 = (__int128 *)((char *)v64 + 56);
          --v63;
          uint64_t v61 = *(void *)(a3 + 24);
          if (!v61) {
            goto LABEL_33;
          }
        }

        __int128 v62 = (__int128 *)sub_100008E18(v64, v7, a3, v63, a5, a6);
        return sub_100009218((__int128 *)v8, v74, v62);
      }
    }

LABEL_33:
    sub_1000091CC();
  }

  __int128 v34 = *(_OWORD *)a1;
  __int128 v35 = *(_OWORD *)(a1 + 16);
  __int128 v36 = *(_OWORD *)(a1 + 32);
  *(void *)(a5 + 4std::ostream::~ostream(v2, v3 + 8) = *(void *)(a1 + 48);
  *(_OWORD *)(a5 + 16) = v35;
  *(_OWORD *)(a5 + 32) = v36;
  *(_OWORD *)a5 = v34;
  unint64_t v37 = a5 + 56;
  uint64_t v38 = a1 + 56;
  if (a1 + 56 == a2)
  {
    __int128 v65 = *(_OWORD *)a2;
    __int128 v66 = *(_OWORD *)(a2 + 16);
    __int128 v67 = *(_OWORD *)(a2 + 32);
    *(_BYTE *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = *(_BYTE *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v66;
    *(_OWORD *)(a1 + 32) = v67;
    *(_OWORD *)a1 = v65;
LABEL_37:
    uint64_t v68 = 0LL;
    do
    {
      uint64_t v69 = v38 + v68;
      __int128 v70 = *(_OWORD *)(a5 + v68);
      __int128 v71 = *(_OWORD *)(a5 + v68 + 16);
      __int128 v72 = *(_OWORD *)(a5 + v68 + 32);
      *(_BYTE *)(v69 + 4std::ostream::~ostream(v2, v3 + 8) = *(_BYTE *)(a5 + v68 + 48);
      *(_OWORD *)(v69 + 16) = v71;
      *(_OWORD *)(v69 + 32) = v72;
      *(_OWORD *)uint64_t v69 = v70;
      v68 += 56LL;
    }

    while (a5 + v68 < v37);
    return (__int128 *)v38;
  }

  do
  {
    uint64_t v39 = *(void *)(a3 + 24);
    if (!v39) {
      goto LABEL_33;
    }
    if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v39 + 48LL))(v39, v38))
    {
      __int128 v40 = *(_OWORD *)v38;
      __int128 v41 = *(_OWORD *)(v38 + 16);
      __int128 v42 = *(_OWORD *)(v38 + 32);
      *(_BYTE *)(v8 + 4std::ostream::~ostream(v2, v3 + 8) = *(_BYTE *)(v38 + 48);
      *(_OWORD *)(v8 + 16) = v41;
      *(_OWORD *)(v8 + 32) = v42;
      *(_OWORD *)uint64_t v8 = v40;
      v8 += 56LL;
    }

    else
    {
      __int128 v43 = *(_OWORD *)v38;
      __int128 v44 = *(_OWORD *)(v38 + 16);
      __int128 v45 = *(_OWORD *)(v38 + 32);
      *(void *)(v37 + 4std::ostream::~ostream(v2, v3 + 8) = *(void *)(v38 + 48);
      *(_OWORD *)(v37 + 16) = v44;
      *(_OWORD *)(v37 + 32) = v45;
      *(_OWORD *)unint64_t v37 = v43;
      v37 += 56LL;
    }

    v38 += 56LL;
  }

  while (v38 != v7);
  __int128 v46 = *(_OWORD *)v7;
  __int128 v47 = *(_OWORD *)(v7 + 16);
  __int128 v48 = *(_OWORD *)(v7 + 32);
  *(_BYTE *)(v8 + 4std::ostream::~ostream(v2, v3 + 8) = *(_BYTE *)(v7 + 48);
  *(_OWORD *)(v8 + 16) = v47;
  *(_OWORD *)(v8 + 32) = v48;
  *(_OWORD *)uint64_t v8 = v46;
  uint64_t v38 = v8 + 56;
  uint64_t v7 = v8 + 56;
  if (v37 > a5) {
    goto LABEL_37;
  }
  return (__int128 *)v7;
}

void sub_1000091CC()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_10000C858;
}

void sub_100009204(std::exception *a1)
{
}

__int128 *sub_100009218(__int128 *__src, __int128 *a2, __int128 *a3)
{
  BOOL v3 = a3;
  if (__src != a2)
  {
    if (a2 == a3)
    {
      return __src;
    }

    else if ((__int128 *)((char *)__src + 56) == a2)
    {
      __int128 v7 = *__src;
      __int128 v9 = __src[1];
      __int128 v11 = __src[2];
      uint64_t v13 = *((void *)__src + 6);
      int64_t v5 = (char *)a3 - (char *)a2;
      memmove(__src, a2, (char *)a3 - (char *)a2 - 7);
      BOOL v3 = (__int128 *)((char *)__src + v5);
      *BOOL v3 = v7;
      v3[1] = v9;
      v3[2] = v11;
      *((_BYTE *)v3 + 4std::ostream::~ostream(v2, v3 + 8) = v13;
    }

    else if ((__int128 *)((char *)a2 + 56) == a3)
    {
      BOOL v3 = (__int128 *)((char *)__src + 56);
      __int128 v8 = *(__int128 *)((char *)a3 - 56);
      __int128 v10 = *(__int128 *)((char *)a3 - 40);
      __int128 v12 = *(__int128 *)((char *)a3 - 24);
      uint64_t v14 = *((void *)a3 - 1);
      *__src = v8;
      __src[1] = v10;
      __src[2] = v12;
      *((_BYTE *)__src + 4std::ostream::~ostream(v2, v3 + 8) = v14;
    }

    else
    {
      return sub_100009364(__src, a2, a3);
    }
  }

  return v3;
}

__int128 *sub_100009364(__int128 *a1, __int128 *a2, __int128 *a3)
{
  uint64_t v3 = 0x6DB6DB6DB6DB6DB7LL * (((char *)a2 - (char *)a1) >> 3);
  if (v3 == 0x6DB6DB6DB6DB6DB7LL * (((char *)a3 - (char *)a2) >> 3))
  {
    if (a1 != a2 && a2 != a3)
    {
      uint64_t v4 = 0LL;
      do
      {
        uint64_t v5 = (uint64_t)a1 + v4;
        __int128 v7 = *(__int128 *)((char *)a1 + v4 + 16);
        __int128 v6 = *(__int128 *)((char *)a1 + v4 + 32);
        uint64_t v8 = (uint64_t)a2 + v4;
        __int128 v9 = *(__int128 *)((char *)a1 + v4);
        uint64_t v10 = *(void *)((char *)a1 + v4 + 48);
        __int128 v12 = *(__int128 *)((char *)a2 + v4 + 16);
        __int128 v11 = *(__int128 *)((char *)a2 + v4 + 32);
        __int128 v13 = *(__int128 *)((char *)a2 + v4);
        *(_BYTE *)(v5 + 4std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)a2 + v4 + 48);
        *(_OWORD *)(v5 + 16) = v12;
        *(_OWORD *)(v5 + 32) = v11;
        *(_OWORD *)uint64_t v5 = v13;
        *(_BYTE *)(v8 + 4std::ostream::~ostream(v2, v3 + 8) = v10;
        *(_OWORD *)uint64_t v8 = v9;
        *(_OWORD *)(v8 + 16) = v7;
        *(_OWORD *)(v8 + 32) = v6;
        v4 += 56LL;
      }

      while ((__int128 *)(v8 + 56) != a3);
    }
  }

  else
  {
    uint64_t v14 = 0x6DB6DB6DB6DB6DB7LL * (((char *)a3 - (char *)a2) >> 3);
    uint64_t v15 = 0x6DB6DB6DB6DB6DB7LL * (((char *)a2 - (char *)a1) >> 3);
    do
    {
      uint64_t v16 = v15;
      uint64_t v15 = v14;
      uint64_t v14 = v16 % v14;
    }

    while (v14);
    if (v15)
    {
      uint64_t v17 = (__int128 *)((char *)a1 + 56 * v15);
      do
      {
        __int128 v18 = *(__int128 *)((char *)v17 - 56);
        __int128 v19 = *(__int128 *)((char *)v17 - 40);
        __int128 v20 = *(__int128 *)((char *)v17 - 24);
        uint64_t v21 = *((void *)v17 - 1);
        uint64_t v17 = (__int128 *)((char *)v17 - 56);
        __int128 v33 = v18;
        __int128 v34 = v19;
        __int128 v35 = v20;
        char v36 = v21;
        __int128 v22 = (__int128 *)((char *)v17 + 8 * (((char *)a2 - (char *)a1) >> 3));
        __int128 v23 = v17;
        do
        {
          __int128 v24 = v23;
          __int128 v23 = v22;
          __int128 v25 = *v22;
          __int128 v26 = v22[1];
          __int128 v27 = v22[2];
          *((_BYTE *)v24 + 4std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)v22 + 48);
          v24[1] = v26;
          v24[2] = v27;
          *__int128 v24 = v25;
          uint64_t v28 = 0x6DB6DB6DB6DB6DB7LL * (((char *)a3 - (char *)v22) >> 3);
          BOOL v29 = __OFSUB__(v3, v28);
          uint64_t v31 = v3 - v28;
          char v30 = (v31 < 0) ^ v29;
          __int128 v22 = (__int128 *)((char *)a1 + 56 * v31);
          if (v30) {
            __int128 v22 = (__int128 *)((char *)v23 + 8 * (((char *)a2 - (char *)a1) >> 3));
          }
        }

        while (v22 != v17);
        *((_BYTE *)v23 + 4std::ostream::~ostream(v2, v3 + 8) = v36;
        v23[1] = v34;
        v23[2] = v35;
        *__int128 v23 = v33;
      }

      while (v17 != a1);
    }

    return (__int128 *)((char *)a1 + 8 * (((char *)a3 - (char *)a2) >> 3));
  }

  return a2;
}

uint64_t sub_100009510(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24LL))(*(void *)(a2 + 24), a1);
    }

    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
    }
  }

  else
  {
    *(void *)(a1 + 24) = 0LL;
  }

  return a1;
}

__int128 *sub_100009574( __int128 *a1, __int128 *a2, void **a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  __int128 v7 = a2;
  uint64_t v8 = a1;
  if (a4 == 3)
  {
    uint64_t v17 = (__int128 *)((char *)a1 + 56);
    __int128 v18 = *a3;
    v81[0] = *((void *)v8 + 9);
    if (!sub_100009970(v18, v81))
    {
      __int128 v51 = *(__int128 *)((char *)v8 + 72);
      __int128 v50 = *(__int128 *)((char *)v8 + 88);
      __int128 v52 = *v17;
      uint64_t v53 = *((void *)v8 + 13);
      __int128 v55 = v7[1];
      __int128 v54 = v7[2];
      __int128 v56 = *v7;
      *((_BYTE *)v8 + 104) = *((_BYTE *)v7 + 48);
      *(__int128 *)((char *)v8 + 72) = v55;
      *(__int128 *)((char *)v8 + 8std::ostream::~ostream(v2, v3 + 8) = v54;
      *uint64_t v17 = v56;
      *((_BYTE *)v7 + 4std::ostream::~ostream(v2, v3 + 8) = v53;
      __int128 *v7 = v52;
      v7[1] = v51;
      v7[2] = v50;
      uint64_t v57 = *((void *)v8 + 6);
      __int128 v59 = v8[1];
      __int128 v58 = v8[2];
      __int128 v60 = *v8;
      __int128 v61 = *(__int128 *)((char *)v8 + 72);
      __int128 *v8 = *v17;
      v8[1] = v61;
      _OWORD v8[2] = *(__int128 *)((char *)v8 + 88);
      *((_BYTE *)v8 + 4std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)v8 + 104);
      *uint64_t v17 = v60;
      *(__int128 *)((char *)v8 + 72) = v59;
      *(__int128 *)((char *)v8 + 8std::ostream::~ostream(v2, v3 + 8) = v58;
      __int128 v7 = (__int128 *)((char *)v8 + 56);
      *((_BYTE *)v8 + 104) = v57;
      return v7;
    }

    uint64_t v19 = *((void *)v8 + 6);
    __int128 v21 = v8[1];
    __int128 v20 = v8[2];
    __int128 v22 = *v8;
    __int128 v23 = *(__int128 *)((char *)v8 + 72);
    __int128 *v8 = *v17;
    v8[1] = v23;
    _OWORD v8[2] = *(__int128 *)((char *)v8 + 88);
    *((_BYTE *)v8 + 4std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)v8 + 104);
    *uint64_t v17 = v22;
    *(__int128 *)((char *)v8 + 72) = v21;
    *(__int128 *)((char *)v8 + 8std::ostream::~ostream(v2, v3 + 8) = v20;
    *((_BYTE *)v8 + 104) = v19;
    __int128 v11 = *(__int128 *)((char *)v8 + 72);
    __int128 v10 = *(__int128 *)((char *)v8 + 88);
    __int128 v12 = *v17;
    uint64_t v13 = *((void *)v8 + 13);
    __int128 v25 = v7[1];
    __int128 v24 = v7[2];
    __int128 v26 = *v7;
    *((_BYTE *)v8 + 104) = *((_BYTE *)v7 + 48);
    *(__int128 *)((char *)v8 + 72) = v25;
    *(__int128 *)((char *)v8 + 8std::ostream::~ostream(v2, v3 + 8) = v24;
    *uint64_t v17 = v26;
    goto LABEL_6;
  }

  if (a4 == 2)
  {
    __int128 v11 = a1[1];
    __int128 v10 = a1[2];
    __int128 v12 = *a1;
    uint64_t v13 = *((void *)a1 + 6);
    __int128 v15 = a2[1];
    __int128 v14 = a2[2];
    __int128 v16 = *a2;
    *((_BYTE *)a1 + 4std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)a2 + 48);
    a1[1] = v15;
    a1[2] = v14;
    *a1 = v16;
LABEL_6:
    *((_BYTE *)v7 + 4std::ostream::~ostream(v2, v3 + 8) = v13;
    __int128 *v7 = v12;
    v7[1] = v11;
    v7[2] = v10;
    return v7;
  }

  if (a6 >= a4)
  {
    __int128 v35 = *a1;
    __int128 v36 = a1[1];
    __int128 v37 = a1[2];
    *(void *)(a5 + 4std::ostream::~ostream(v2, v3 + 8) = *((void *)a1 + 6);
    *(_OWORD *)(a5 + 16) = v36;
    *(_OWORD *)(a5 + 32) = v37;
    *(_OWORD *)a5 = v35;
    unint64_t v38 = a5 + 56;
    uint64_t v39 = (__int128 *)((char *)a1 + 56);
    if ((__int128 *)((char *)a1 + 56) == a2)
    {
      __int128 v71 = *a2;
      __int128 v72 = a2[1];
      __int128 v73 = a2[2];
      *((_BYTE *)a1 + 4std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)a2 + 48);
      a1[1] = v72;
      a1[2] = v73;
      *a1 = v71;
    }

    else
    {
      do
      {
        __int128 v40 = *a3;
        v81[0] = *((void *)v39 + 2);
        if (sub_100009970(v40, v81))
        {
          __int128 v41 = *v39;
          __int128 v42 = v39[1];
          __int128 v43 = v39[2];
          *((_BYTE *)v8 + 4std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)v39 + 48);
          v8[1] = v42;
          _OWORD v8[2] = v43;
          __int128 *v8 = v41;
          uint64_t v8 = (__int128 *)((char *)v8 + 56);
        }

        else
        {
          __int128 v44 = *v39;
          __int128 v45 = v39[1];
          __int128 v46 = v39[2];
          *(void *)(v38 + 4std::ostream::~ostream(v2, v3 + 8) = *((void *)v39 + 6);
          *(_OWORD *)(v38 + 16) = v45;
          *(_OWORD *)(v38 + 32) = v46;
          *(_OWORD *)unint64_t v38 = v44;
          v38 += 56LL;
        }

        uint64_t v39 = (__int128 *)((char *)v39 + 56);
      }

      while (v39 != v7);
      __int128 v47 = *v7;
      __int128 v48 = v7[1];
      __int128 v49 = v7[2];
      *((_BYTE *)v8 + 4std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)v7 + 48);
      v8[1] = v48;
      _OWORD v8[2] = v49;
      __int128 *v8 = v47;
      uint64_t v39 = (__int128 *)((char *)v8 + 56);
      __int128 v7 = (__int128 *)((char *)v8 + 56);
      if (v38 <= a5) {
        return v7;
      }
    }

    uint64_t v74 = 0LL;
    do
    {
      uint64_t v75 = (uint64_t)v39 + v74;
      __int128 v76 = *(_OWORD *)(a5 + v74);
      __int128 v77 = *(_OWORD *)(a5 + v74 + 16);
      __int128 v78 = *(_OWORD *)(a5 + v74 + 32);
      *(_BYTE *)(v75 + 4std::ostream::~ostream(v2, v3 + 8) = *(_BYTE *)(a5 + v74 + 48);
      *(_OWORD *)(v75 + 16) = v77;
      *(_OWORD *)(v75 + 32) = v78;
      *(_OWORD *)uint64_t v75 = v76;
      v74 += 56LL;
    }

    while (a5 + v74 < v38);
    return v39;
  }

  if (a4 >= 0) {
    uint64_t v29 = a4;
  }
  else {
    uint64_t v29 = a4 + 1;
  }
  uint64_t v30 = v29 >> 1;
  uint64_t v31 = (__int128 *)((char *)a1 + 56 * (v29 >> 1));
  uint64_t v32 = (char *)v31 - 56;
  __int128 v33 = *a3;
  v81[0] = *((void *)v31 - 5);
  if (sub_100009970(v33, v81))
  {
    uint64_t v34 = v30;
LABEL_25:
    BOOL v64 = (__int128 *)sub_100009574(v8, v32, a3, v34, a5, a6);
  }

  else
  {
    uint64_t v80 = v31;
    uint64_t v62 = 56 - 56 * v30;
    uint64_t v34 = v30;
    while (v62)
    {
      --v34;
      uint64_t v63 = *a3;
      v81[0] = *((void *)v32 - 5);
      v62 += 56LL;
      v32 -= 56;
      if (sub_100009970(v63, v81))
      {
        uint64_t v32 = (char *)v8 - v62;
        uint64_t v31 = v80;
        goto LABEL_25;
      }
    }

    BOOL v64 = v8;
    uint64_t v31 = v80;
  }

  uint64_t v65 = a4 - v30;
  __int128 v66 = *a3;
  v81[0] = *((void *)v8 + 7 * v30 + 2);
  if (sub_100009970(v66, v81))
  {
    __int128 v67 = (__int128 *)((char *)v7 + 56);
    uint64_t v68 = (uint64_t)v8 + 56 * v30 + 56;
    while ((__int128 *)v68 != v7)
    {
      --v65;
      uint64_t v69 = *a3;
      v81[0] = *(void *)(v68 + 16);
      v68 += 56LL;
      if (!sub_100009970(v69, v81))
      {
        __int128 v70 = (__int128 *)(v68 - 56);
        goto LABEL_36;
      }
    }
  }

  else
  {
    __int128 v70 = v31;
LABEL_36:
    __int128 v67 = (__int128 *)sub_100009574(v70, v7, a3, v65, a5, a6);
  }

  return sub_100009218(v64, v31, v67);
}

void *sub_100009970(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (*(void *)&v2 - 1LL) & v3;
  }

  __int128 v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  BOOL result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }

      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }

        else
        {
          v8 &= *(void *)&v2 - 1LL;
        }

        if (v8 != v5) {
          return 0LL;
        }
      }

      BOOL result = (void *)*result;
    }

    while (result);
  }

  return result;
}

__n128 sub_100009A2C(uint64_t a1)
{
  int8x8_t v2 = (char *)operator new(0x18uLL);
  *(void *)int8x8_t v2 = &off_10000C880;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + std::ostream::~ostream(v2, v3 + 8) = result;
  return result;
}

__n128 sub_100009A64(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &off_10000C880;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + std::ostream::~ostream(v2, v3 + 8) = result;
  return result;
}

BOOL sub_100009A84(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 32) == -2 && *(_BYTE *)(a1 + 16) == 0) {
    return 0LL;
  }
  unint64_t v3 = *(uint64_t **)(a1 + 8);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (*v3 == v5) {
    return 0LL;
  }
  do
  {
    BOOL result = sub_100005BE8(v4, a2);
    if (result) {
      break;
    }
    v4 += 56LL;
  }

  while (v4 != v5);
  return result;
}

uint64_t sub_100009AF0(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

_UNKNOWN **sub_100009B2C()
{
}

BOOL sub_100009B38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1LL;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0LL;
}

__n128 sub_100009B8C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &off_10000C910;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + std::ostream::~ostream(v2, v3 + 8) = result;
  return result;
}

__n128 sub_100009BC4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &off_10000C910;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + std::ostream::~ostream(v2, v3 + 8) = result;
  return result;
}

uint64_t sub_100009BE4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 32) == -2) {
    return 0LL;
  }
  uint64_t v2 = *(void **)(a1 + 16);
  if (*v2 >= *(void *)(a1 + 8)) {
    return 0LL;
  }
  *v2 += *(unsigned int *)(a2 + 36);
  return 1LL;
}

uint64_t sub_100009C1C(uint64_t a1, uint64_t a2)
{
  else {
    return 0LL;
  }
}

_UNKNOWN **sub_100009C58()
{
}

void **sub_100009C64(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    xpc_retain(v3);
  }
  return a1;
}

void *sub_100009C94(void *result, void *a2)
{
  void *result = *a2;
  *a2 = 0LL;
  return result;
}

void **sub_100009CA4(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    xpc_release(v2);
  }
  return a1;
}

uint64_t sub_100009CD8(uint64_t a1)
{
  return *(void *)a1;
}

BOOL sub_100009CE0(void *a1)
{
  return *a1 != 0LL;
}

xpc_type_t sub_100009CF0(xpc_type_t *a1)
{
  xpc_type_t result = *a1;
  if (result) {
    return xpc_get_type(result);
  }
  return result;
}

xpc_object_t *sub_100009D00(xpc_object_t *a1)
{
  *a1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  return a1;
}

void *sub_100009D34(void *a1, xpc_object_t object, int a3)
{
  *a1 = object;
  if (object && a3) {
    xpc_retain(object);
  }
  return a1;
}

void sub_100009D68(xpc_object_t *a1, const char *a2, uint64_t a3)
{
}

uint64_t sub_100009D70(xpc_object_t *a1, const char *a2)
{
  return xpc_dictionary_get_uint64(*a1, a2);
}

void sub_100009D78(xpc_object_t *a1, const char *a2, double a3)
{
}

const void *sub_100009D80(xpc_object_t *a1, const char *a2, size_t *a3)
{
  return xpc_dictionary_get_data(*a1, a2, a3);
}

void sub_100009D88(xpc_object_t *a1, const char *a2, void *a3)
{
}

xpc_object_t sub_100009D90@<X0>(xpc_object_t *a1@<X0>, const char *a2@<X1>, void *a3@<X8>)
{
  xpc_object_t result = xpc_dictionary_get_value(*a1, a2);
  *a3 = result;
  if (result) {
    return xpc_retain(result);
  }
  return result;
}

xpc_object_t sub_100009DC8@<X0>(xpc_object_t *a1@<X0>, void *a2@<X8>)
{
  xpc_object_t result = xpc_dictionary_create_reply(*a1);
  *a2 = result;
  return result;
}

xpc_object_t *sub_100009DF0(xpc_object_t *a1)
{
  *a1 = xpc_array_create(0LL, 0LL);
  return a1;
}

size_t sub_100009E20(xpc_object_t *a1)
{
  return xpc_array_get_count(*a1);
}

void sub_100009E28(xpc_object_t *a1, xpc_object_t value)
{
}

xpc_object_t sub_100009E38@<X0>(xpc_object_t *a1@<X0>, size_t a2@<X1>, void *a3@<X8>)
{
  xpc_object_t result = xpc_array_get_value(*a1, a2);
  *a3 = result;
  if (result) {
    return xpc_retain(result);
  }
  return result;
}

void sub_100009E70(xpc_object_t *a1, size_t a2, uint64_t a3)
{
}

uint64_t sub_100009E78(xpc_object_t *a1, size_t a2)
{
  return xpc_array_get_uint64(*a1, a2);
}

void sub_100009E80(xpc_object_t *a1, size_t a2, const unsigned __int8 *a3)
{
}

const uint8_t *sub_100009E88(xpc_object_t *a1, size_t a2)
{
  return xpc_array_get_uuid(*a1, a2);
}

uint64_t sub_100009E90(uint64_t a1, uint64_t a2)
{
  __uint64_t v8 = 0LL;
  pthread_threadid_np(0LL, &v8);
  pthread_mutex_lock(&stru_100010058);
  uint64_t v4 = qword_1000100A0;
  *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = qword_1000100A0;
  __uint64_t v5 = v8;
  if (v4) {
    BOOL v6 = qword_1000100F0 == v8;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    qword_1000100A0 = a2;
    *(_BYTE *)a1 = 1;
    qword_1000100F0 = v5;
  }

  else
  {
    *(_BYTE *)a1 = 0;
  }

  pthread_mutex_unlock(&stru_100010058);
  return a1;
}

uint64_t sub_100009F28(uint64_t a1)
{
  if (*(_BYTE *)a1)
  {
    pthread_mutex_lock(&stru_100010058);
    qword_1000100A0 = *(void *)(a1 + 8);
    pthread_mutex_unlock(&stru_100010058);
  }

  return a1;
}

void sub_100009F80(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0LL;
  if (v2)
  {
    uint64_t v3 = (void *)sub_100006670();
    operator delete(v3);
  }

void sub_100009FA8(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v2;
    operator delete(v2);
  }

uint64_t sub_100009FCC(const char *a1)
{
  uint64_t result = printf( "ASSERT(%s) %s %d, %s\n",  "page_aligned_mmap_archive_size > 8 && *reinterpret_cast<const uint64_t *>(mmap_archive) != 0",  a1,  951,  "Empty archive");
  if (qword_1000100A0) {
    return printf("__crashreporter_info__: %s\n", (const char *)qword_1000100A0);
  }
  return result;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}