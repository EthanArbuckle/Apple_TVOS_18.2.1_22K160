void sub_1006281BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;
  va_start(va, a9);

  sub_100242FAC((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100628230(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned int a5, int a6)
{
  id v11 = a3;
  v21[0] = 0LL;
  v21[1] = 0LL;
  sub_100242F28((uint64_t)v21, a1 + 48);
  v19 = 0LL;
  v20 = 0LL;
  sub_10032BA60(*(void *)(a4 + 8), a5, &v19);
  if (!sub_10056AAC8((uint64_t)&v19))
  {
    v12 = (os_log_s *)qword_1008F75A8;
    if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "writeKeyForDevice is calling BTKCSetLEData sync=0",  v18,  2u);
    }

    v13 = (const UInt8 *)sub_10056AAF0((uint64_t)&v19);
    CFIndex v14 = sub_10056AAD8((uint64_t)&v19);
    sub_100297E4C(a2, v11, a5, v13, v14, 0);
    if (a6)
    {
      v15 = (os_log_s *)qword_1008F75A8;
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "writeKeyForDevice is calling BTKCSetLEData sync=1",  v18,  2u);
      }

      v16 = (const UInt8 *)sub_10056AAF0((uint64_t)&v19);
      CFIndex v17 = sub_10056AAD8((uint64_t)&v19);
      sub_100297E4C(a2, v11, a5, v16, v17, 1);
    }
  }

  v19 = &off_10087FAA8;
  if (v20) {
    sub_1002CD254(v20);
  }
  sub_100242FAC((uint64_t)v21);
}

void sub_1006283BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  _Unwind_Resume(a1);
}

void sub_1006283FC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned int **a5, int a6)
{
  id v11 = a3;
  v23[0] = 0LL;
  v23[1] = 0LL;
  sub_100242F28((uint64_t)v23, a1 + 48);
  CFTypeRef cf = 0LL;
  v12 = *a5;
  v13 = a5[1];
  if (*a5 != v13)
  {
    char v14 = 0;
    do
    {
      unsigned int v15 = *v12;
      v20 = 0LL;
      v21 = 0LL;
      sub_10032BA60(*(void *)(a4 + 8), v15, &v20);
      if (!sub_10056AAC8((uint64_t)&v20))
      {
        v16 = (os_log_s *)qword_1008F75A8;
        if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "writeKeyForDevice is calling BTKCSetLEData sync=0",  buf,  2u);
        }

        CFIndex v17 = (const UInt8 *)sub_10056AAF0((uint64_t)&v20);
        CFIndex v18 = sub_10056AAD8((uint64_t)&v20);
        sub_100297A24(a2, v11, v15, v17, v18, a6, &cf, 0);
        ++v14;
      }

      v20 = &off_10087FAA8;
      if (v21) {
        sub_1002CD254(v21);
      }
      ++v12;
    }

    while (v12 != v13);
    if (v14) {
      sub_1002978D0(a2, v11, a6, &cf);
    }
    if (cf) {
      CFRelease(cf);
    }
  }

  sub_100242FAC((uint64_t)v23);
}

void sub_100628580( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  _Unwind_Resume(a1);
}

void sub_1006285BC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  v150[0] = 0LL;
  v150[1] = 0LL;
  sub_100242F28((uint64_t)v150, a1 + 48);
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
  }
  v8 = off_1008D5F28;
  sub_10002418C(__p, "IsAppleWatch");
  int v9 = sub_1005CE5A8((uint64_t)v8, v7, (uint64_t)__p);
  if (v149 < 0) {
    operator delete(__p[0]);
  }
  v10 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = sub_1005BFB9C(a2);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Writing keys to disk for device %{public}@ (isWatch=%d)",  buf,  0x12u);
  }

  sub_100628230(a1, a2, v7, a4, 0xAu, v9);
  memset(buf, 0, sizeof(buf));
  char v14 = sub_10024E33C((uint64_t)&buf[16], 1uLL);
  unsigned int v15 = *(char **)buf;
  v16 = *(char **)&buf[8];
  CFIndex v17 = (char *)&v14[v13];
  *char v14 = 0;
  CFIndex v18 = (char *)(v14 + 1);
  v19 = v14;
  while (v16 != v15)
  {
    int v20 = *((_DWORD *)v16 - 1);
    v16 -= 4;
    *--v19 = v20;
  }

  *(void *)buf = v19;
  *(void *)&uint8_t buf[8] = v14 + 1;
  *(void *)&buf[16] = &v14[v13];
  if (v15)
  {
    operator delete(v15);
    CFIndex v17 = *(char **)&buf[16];
  }

  *(void *)&uint8_t buf[8] = v14 + 1;
  if (v18 >= v17)
  {
    v22 = *(char **)buf;
    uint64_t v23 = (uint64_t)&v18[-*(void *)buf] >> 2;
    unint64_t v24 = v23 + 1;
    uint64_t v25 = (uint64_t)&v17[-*(void *)buf];
    if (v25 >> 1 > v24) {
      unint64_t v24 = v25 >> 1;
    }
    else {
      unint64_t v26 = v24;
    }
    if (v26)
    {
      v27 = (char *)sub_10024E33C((uint64_t)&buf[16], v26);
      v22 = *(char **)buf;
      CFIndex v18 = *(char **)&buf[8];
    }

    else
    {
      v27 = 0LL;
    }

    v28 = &v27[4 * v23];
    CFIndex v17 = &v27[4 * v26];
    *(_DWORD *)v28 = 1;
    v21 = v28 + 4;
    while (v18 != v22)
    {
      int v29 = *((_DWORD *)v18 - 1);
      v18 -= 4;
      *((_DWORD *)v28 - 1) = v29;
      v28 -= 4;
    }

    *(void *)buf = v28;
    *(void *)&uint8_t buf[8] = v21;
    *(void *)&buf[16] = v17;
    if (v22)
    {
      operator delete(v22);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    v14[1] = 1;
    v21 = (char *)(v14 + 2);
  }

  *(void *)&uint8_t buf[8] = v21;
  if (v21 >= v17)
  {
    v31 = *(char **)buf;
    uint64_t v32 = (uint64_t)&v21[-*(void *)buf] >> 2;
    unint64_t v33 = v32 + 1;
    uint64_t v34 = (uint64_t)&v17[-*(void *)buf];
    if (v34 >> 1 > v33) {
      unint64_t v33 = v34 >> 1;
    }
    else {
      unint64_t v35 = v33;
    }
    if (v35)
    {
      v36 = (char *)sub_10024E33C((uint64_t)&buf[16], v35);
      v31 = *(char **)buf;
      v21 = *(char **)&buf[8];
    }

    else
    {
      v36 = 0LL;
    }

    v37 = &v36[4 * v32];
    CFIndex v17 = &v36[4 * v35];
    *(_DWORD *)v37 = 2;
    v30 = v37 + 4;
    while (v21 != v31)
    {
      int v38 = *((_DWORD *)v21 - 1);
      v21 -= 4;
      *((_DWORD *)v37 - 1) = v38;
      v37 -= 4;
    }

    *(void *)buf = v37;
    *(void *)&uint8_t buf[8] = v30;
    *(void *)&buf[16] = v17;
    if (v31)
    {
      operator delete(v31);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v21 = 2;
    v30 = v21 + 4;
  }

  *(void *)&uint8_t buf[8] = v30;
  if (v30 >= v17)
  {
    v40 = *(char **)buf;
    uint64_t v41 = (uint64_t)&v30[-*(void *)buf] >> 2;
    unint64_t v42 = v41 + 1;
    uint64_t v43 = (uint64_t)&v17[-*(void *)buf];
    if (v43 >> 1 > v42) {
      unint64_t v42 = v43 >> 1;
    }
    else {
      unint64_t v44 = v42;
    }
    if (v44)
    {
      v45 = (char *)sub_10024E33C((uint64_t)&buf[16], v44);
      v40 = *(char **)buf;
      v30 = *(char **)&buf[8];
    }

    else
    {
      v45 = 0LL;
    }

    v46 = &v45[4 * v41];
    CFIndex v17 = &v45[4 * v44];
    *(_DWORD *)v46 = 3;
    v39 = v46 + 4;
    while (v30 != v40)
    {
      int v47 = *((_DWORD *)v30 - 1);
      v30 -= 4;
      *((_DWORD *)v46 - 1) = v47;
      v46 -= 4;
    }

    *(void *)buf = v46;
    *(void *)&uint8_t buf[8] = v39;
    *(void *)&buf[16] = v17;
    if (v40)
    {
      operator delete(v40);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v30 = 3;
    v39 = v30 + 4;
  }

  *(void *)&uint8_t buf[8] = v39;
  if (v39 >= v17)
  {
    v49 = *(char **)buf;
    uint64_t v50 = (uint64_t)&v39[-*(void *)buf] >> 2;
    unint64_t v51 = v50 + 1;
    uint64_t v52 = (uint64_t)&v17[-*(void *)buf];
    if (v52 >> 1 > v51) {
      unint64_t v51 = v52 >> 1;
    }
    else {
      unint64_t v53 = v51;
    }
    if (v53)
    {
      v54 = (char *)sub_10024E33C((uint64_t)&buf[16], v53);
      v49 = *(char **)buf;
      v39 = *(char **)&buf[8];
    }

    else
    {
      v54 = 0LL;
    }

    v55 = &v54[4 * v50];
    CFIndex v17 = &v54[4 * v53];
    *(_DWORD *)v55 = 4;
    v48 = v55 + 4;
    while (v39 != v49)
    {
      int v56 = *((_DWORD *)v39 - 1);
      v39 -= 4;
      *((_DWORD *)v55 - 1) = v56;
      v55 -= 4;
    }

    *(void *)buf = v55;
    *(void *)&uint8_t buf[8] = v48;
    *(void *)&buf[16] = v17;
    if (v49)
    {
      operator delete(v49);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v39 = 4;
    v48 = v39 + 4;
  }

  *(void *)&uint8_t buf[8] = v48;
  if (v48 >= v17)
  {
    v58 = *(char **)buf;
    uint64_t v59 = (uint64_t)&v48[-*(void *)buf] >> 2;
    unint64_t v60 = v59 + 1;
    uint64_t v61 = (uint64_t)&v17[-*(void *)buf];
    if (v61 >> 1 > v60) {
      unint64_t v60 = v61 >> 1;
    }
    else {
      unint64_t v62 = v60;
    }
    if (v62)
    {
      v63 = (char *)sub_10024E33C((uint64_t)&buf[16], v62);
      v58 = *(char **)buf;
      v48 = *(char **)&buf[8];
    }

    else
    {
      v63 = 0LL;
    }

    v64 = &v63[4 * v59];
    CFIndex v17 = &v63[4 * v62];
    *(_DWORD *)v64 = 12;
    v57 = v64 + 4;
    while (v48 != v58)
    {
      int v65 = *((_DWORD *)v48 - 1);
      v48 -= 4;
      *((_DWORD *)v64 - 1) = v65;
      v64 -= 4;
    }

    *(void *)buf = v64;
    *(void *)&uint8_t buf[8] = v57;
    *(void *)&buf[16] = v17;
    if (v58)
    {
      operator delete(v58);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v48 = 12;
    v57 = v48 + 4;
  }

  *(void *)&uint8_t buf[8] = v57;
  if (v57 >= v17)
  {
    v67 = *(char **)buf;
    uint64_t v68 = (uint64_t)&v57[-*(void *)buf] >> 2;
    unint64_t v69 = v68 + 1;
    uint64_t v70 = (uint64_t)&v17[-*(void *)buf];
    if (v70 >> 1 > v69) {
      unint64_t v69 = v70 >> 1;
    }
    else {
      unint64_t v71 = v69;
    }
    if (v71)
    {
      v72 = (char *)sub_10024E33C((uint64_t)&buf[16], v71);
      v67 = *(char **)buf;
      v57 = *(char **)&buf[8];
    }

    else
    {
      v72 = 0LL;
    }

    v73 = &v72[4 * v68];
    CFIndex v17 = &v72[4 * v71];
    *(_DWORD *)v73 = 15;
    v66 = v73 + 4;
    while (v57 != v67)
    {
      int v74 = *((_DWORD *)v57 - 1);
      v57 -= 4;
      *((_DWORD *)v73 - 1) = v74;
      v73 -= 4;
    }

    *(void *)buf = v73;
    *(void *)&uint8_t buf[8] = v66;
    *(void *)&buf[16] = v17;
    if (v67)
    {
      operator delete(v67);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v57 = 15;
    v66 = v57 + 4;
  }

  *(void *)&uint8_t buf[8] = v66;
  if (v66 >= v17)
  {
    v76 = *(char **)buf;
    uint64_t v77 = (uint64_t)&v66[-*(void *)buf] >> 2;
    unint64_t v78 = v77 + 1;
    uint64_t v79 = (uint64_t)&v17[-*(void *)buf];
    if (v79 >> 1 > v78) {
      unint64_t v78 = v79 >> 1;
    }
    else {
      unint64_t v80 = v78;
    }
    if (v80)
    {
      v81 = (char *)sub_10024E33C((uint64_t)&buf[16], v80);
      v76 = *(char **)buf;
      v66 = *(char **)&buf[8];
    }

    else
    {
      v81 = 0LL;
    }

    v82 = &v81[4 * v77];
    CFIndex v17 = &v81[4 * v80];
    *(_DWORD *)v82 = 5;
    v75 = v82 + 4;
    while (v66 != v76)
    {
      int v83 = *((_DWORD *)v66 - 1);
      v66 -= 4;
      *((_DWORD *)v82 - 1) = v83;
      v82 -= 4;
    }

    *(void *)buf = v82;
    *(void *)&uint8_t buf[8] = v75;
    *(void *)&buf[16] = v17;
    if (v76)
    {
      operator delete(v76);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v66 = 5;
    v75 = v66 + 4;
  }

  *(void *)&uint8_t buf[8] = v75;
  if (v75 >= v17)
  {
    v85 = *(char **)buf;
    uint64_t v86 = (uint64_t)&v75[-*(void *)buf] >> 2;
    unint64_t v87 = v86 + 1;
    uint64_t v88 = (uint64_t)&v17[-*(void *)buf];
    if (v88 >> 1 > v87) {
      unint64_t v87 = v88 >> 1;
    }
    else {
      unint64_t v89 = v87;
    }
    if (v89)
    {
      v90 = (char *)sub_10024E33C((uint64_t)&buf[16], v89);
      v85 = *(char **)buf;
      v75 = *(char **)&buf[8];
    }

    else
    {
      v90 = 0LL;
    }

    v91 = &v90[4 * v86];
    CFIndex v17 = &v90[4 * v89];
    *(_DWORD *)v91 = 6;
    v84 = v91 + 4;
    while (v75 != v85)
    {
      int v92 = *((_DWORD *)v75 - 1);
      v75 -= 4;
      *((_DWORD *)v91 - 1) = v92;
      v91 -= 4;
    }

    *(void *)buf = v91;
    *(void *)&uint8_t buf[8] = v84;
    *(void *)&buf[16] = v17;
    if (v85)
    {
      operator delete(v85);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v75 = 6;
    v84 = v75 + 4;
  }

  *(void *)&uint8_t buf[8] = v84;
  if (v84 >= v17)
  {
    v94 = *(char **)buf;
    uint64_t v95 = (uint64_t)&v84[-*(void *)buf] >> 2;
    unint64_t v96 = v95 + 1;
    uint64_t v97 = (uint64_t)&v17[-*(void *)buf];
    if (v97 >> 1 > v96) {
      unint64_t v96 = v97 >> 1;
    }
    else {
      unint64_t v98 = v96;
    }
    if (v98)
    {
      v99 = (char *)sub_10024E33C((uint64_t)&buf[16], v98);
      v94 = *(char **)buf;
      v84 = *(char **)&buf[8];
    }

    else
    {
      v99 = 0LL;
    }

    v100 = &v99[4 * v95];
    CFIndex v17 = &v99[4 * v98];
    *(_DWORD *)v100 = 7;
    v93 = v100 + 4;
    while (v84 != v94)
    {
      int v101 = *((_DWORD *)v84 - 1);
      v84 -= 4;
      *((_DWORD *)v100 - 1) = v101;
      v100 -= 4;
    }

    *(void *)buf = v100;
    *(void *)&uint8_t buf[8] = v93;
    *(void *)&buf[16] = v17;
    if (v94)
    {
      operator delete(v94);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v84 = 7;
    v93 = v84 + 4;
  }

  *(void *)&uint8_t buf[8] = v93;
  if (v93 >= v17)
  {
    v103 = *(char **)buf;
    uint64_t v104 = (uint64_t)&v93[-*(void *)buf] >> 2;
    unint64_t v105 = v104 + 1;
    uint64_t v106 = (uint64_t)&v17[-*(void *)buf];
    if (v106 >> 1 > v105) {
      unint64_t v105 = v106 >> 1;
    }
    else {
      unint64_t v107 = v105;
    }
    if (v107)
    {
      v108 = (char *)sub_10024E33C((uint64_t)&buf[16], v107);
      v103 = *(char **)buf;
      v93 = *(char **)&buf[8];
    }

    else
    {
      v108 = 0LL;
    }

    v109 = &v108[4 * v104];
    CFIndex v17 = &v108[4 * v107];
    *(_DWORD *)v109 = 8;
    v102 = v109 + 4;
    while (v93 != v103)
    {
      int v110 = *((_DWORD *)v93 - 1);
      v93 -= 4;
      *((_DWORD *)v109 - 1) = v110;
      v109 -= 4;
    }

    *(void *)buf = v109;
    *(void *)&uint8_t buf[8] = v102;
    *(void *)&buf[16] = v17;
    if (v103)
    {
      operator delete(v103);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v93 = 8;
    v102 = v93 + 4;
  }

  *(void *)&uint8_t buf[8] = v102;
  if (v102 >= v17)
  {
    v112 = *(char **)buf;
    uint64_t v113 = (uint64_t)&v102[-*(void *)buf] >> 2;
    unint64_t v114 = v113 + 1;
    uint64_t v115 = (uint64_t)&v17[-*(void *)buf];
    if (v115 >> 1 > v114) {
      unint64_t v114 = v115 >> 1;
    }
    else {
      unint64_t v116 = v114;
    }
    if (v116)
    {
      v117 = (char *)sub_10024E33C((uint64_t)&buf[16], v116);
      v112 = *(char **)buf;
      v102 = *(char **)&buf[8];
    }

    else
    {
      v117 = 0LL;
    }

    v118 = &v117[4 * v113];
    CFIndex v17 = &v117[4 * v116];
    *(_DWORD *)v118 = 9;
    v111 = v118 + 4;
    while (v102 != v112)
    {
      int v119 = *((_DWORD *)v102 - 1);
      v102 -= 4;
      *((_DWORD *)v118 - 1) = v119;
      v118 -= 4;
    }

    *(void *)buf = v118;
    *(void *)&uint8_t buf[8] = v111;
    *(void *)&buf[16] = v17;
    if (v112)
    {
      operator delete(v112);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v102 = 9;
    v111 = v102 + 4;
  }

  *(void *)&uint8_t buf[8] = v111;
  if (v111 >= v17)
  {
    v121 = *(char **)buf;
    uint64_t v122 = (uint64_t)&v111[-*(void *)buf] >> 2;
    unint64_t v123 = v122 + 1;
    uint64_t v124 = (uint64_t)&v17[-*(void *)buf];
    if (v124 >> 1 > v123) {
      unint64_t v123 = v124 >> 1;
    }
    else {
      unint64_t v125 = v123;
    }
    if (v125)
    {
      v126 = (char *)sub_10024E33C((uint64_t)&buf[16], v125);
      v121 = *(char **)buf;
      v111 = *(char **)&buf[8];
    }

    else
    {
      v126 = 0LL;
    }

    v127 = &v126[4 * v122];
    CFIndex v17 = &v126[4 * v125];
    *(_DWORD *)v127 = 13;
    v120 = v127 + 4;
    while (v111 != v121)
    {
      int v128 = *((_DWORD *)v111 - 1);
      v111 -= 4;
      *((_DWORD *)v127 - 1) = v128;
      v127 -= 4;
    }

    *(void *)buf = v127;
    *(void *)&uint8_t buf[8] = v120;
    *(void *)&buf[16] = v17;
    if (v121)
    {
      operator delete(v121);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v111 = 13;
    v120 = v111 + 4;
  }

  *(void *)&uint8_t buf[8] = v120;
  if (v120 >= v17)
  {
    v130 = *(char **)buf;
    uint64_t v131 = (uint64_t)&v120[-*(void *)buf] >> 2;
    unint64_t v132 = v131 + 1;
    uint64_t v133 = (uint64_t)&v17[-*(void *)buf];
    if (v133 >> 1 > v132) {
      unint64_t v132 = v133 >> 1;
    }
    else {
      unint64_t v134 = v132;
    }
    if (v134)
    {
      v135 = (char *)sub_10024E33C((uint64_t)&buf[16], v134);
      v130 = *(char **)buf;
      v120 = *(char **)&buf[8];
    }

    else
    {
      v135 = 0LL;
    }

    v136 = &v135[4 * v131];
    CFIndex v17 = &v135[4 * v134];
    *(_DWORD *)v136 = 14;
    v129 = v136 + 4;
    while (v120 != v130)
    {
      int v137 = *((_DWORD *)v120 - 1);
      v120 -= 4;
      *((_DWORD *)v136 - 1) = v137;
      v136 -= 4;
    }

    *(void *)buf = v136;
    *(void *)&uint8_t buf[8] = v129;
    *(void *)&buf[16] = v17;
    if (v130)
    {
      operator delete(v130);
      CFIndex v17 = *(char **)&buf[16];
    }
  }

  else
  {
    *(_DWORD *)v120 = 14;
    v129 = v120 + 4;
  }

  *(void *)&uint8_t buf[8] = v129;
  if (v129 >= v17)
  {
    v139 = *(char **)buf;
    uint64_t v140 = (uint64_t)&v129[-*(void *)buf] >> 2;
    unint64_t v141 = v140 + 1;
    uint64_t v142 = (uint64_t)&v17[-*(void *)buf];
    if (v142 >> 1 > v141) {
      unint64_t v141 = v142 >> 1;
    }
    else {
      unint64_t v143 = v141;
    }
    if (v143)
    {
      v144 = (char *)sub_10024E33C((uint64_t)&buf[16], v143);
      v139 = *(char **)buf;
      v129 = *(char **)&buf[8];
    }

    else
    {
      v144 = 0LL;
    }

    v145 = &v144[4 * v140];
    v146 = &v144[4 * v143];
    *(_DWORD *)v145 = 16;
    v138 = v145 + 4;
    while (v129 != v139)
    {
      int v147 = *((_DWORD *)v129 - 1);
      v129 -= 4;
      *((_DWORD *)v145 - 1) = v147;
      v145 -= 4;
    }

    *(void *)buf = v145;
    *(void *)&uint8_t buf[8] = v138;
    *(void *)&buf[16] = v146;
    if (v139) {
      operator delete(v139);
    }
  }

  else
  {
    *(_DWORD *)v129 = 16;
    v138 = v129 + 4;
  }

  *(void *)&uint8_t buf[8] = v138;
  sub_1006283FC(a1, a2, v7, a4, (unsigned int **)buf, 0);
  if (*(void *)buf)
  {
    *(void *)&uint8_t buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }

  sub_100242FAC((uint64_t)v150);
}

void sub_1006291A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19)
{
  _Unwind_Resume(a1);
}

void sub_10062923C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v21[0] = 0LL;
  v21[1] = 0LL;
  sub_100242F28((uint64_t)v21, a1 + 48);
  sub_100241F90(buf, v5);
  uint64_t v6 = sub_1001FDB10(a1 + 488, buf);
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
  }
  if (sub_1005D733C((uint64_t)off_1008D5F28, v5))
  {
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
    }
    id v7 = sub_1005C6F3C((uint64_t)off_1008D5F28, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v9 = v8;
    if (v8)
    {
      *(_WORD *)(a3 + 80) |= 8u;
      *(_WORD *)(a3 + 44) = 528;
      *(_OWORD *)(a3 + 28) = *(_OWORD *)[v8 bytes];
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_ERROR))
    {
      sub_10069F4BC();
    }

    goto LABEL_17;
  }

  if (a1 + 496 == v6)
  {
    sub_100241F90(buf, v5);
    uint64_t v16 = sub_1001FDB10(a1 + 440, buf);
    if (a1 + 448 != v16)
    {
      sub_10061D7EC(a1, v16 + 48, (_WORD *)a3);
      goto LABEL_17;
    }

    uint64_t v20 = qword_1008F75A8;
    if (!os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138543362;
    id v23 = v5;
    CFIndex v17 = "No security keys found for device %{public}@";
    CFIndex v18 = (os_log_s *)v20;
    os_log_type_t v19 = OS_LOG_TYPE_INFO;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, 0xCu);
    goto LABEL_17;
  }

  sub_10061D7EC(a1, v6 + 48, (_WORD *)a3);
  uint64_t v10 = sub_1002E6E00();
  int v11 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 8LL))(v10);
  id v12 = (os_log_s *)qword_1008F75A8;
  BOOL v13 = os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (!v13) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138543362;
    id v23 = v5;
    CFIndex v17 = "using temporary keys for device %{public}@";
    CFIndex v18 = v12;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_22;
  }

  if (v13)
  {
    char v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  a3 + 28,  *(unsigned __int8 *)(a3 + 44)));
    int v15 = *(unsigned __int8 *)(a3 + 45);
    *(_DWORD *)buf = 138543874;
    id v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    __int16 v26 = 1024;
    int v27 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "using temporary keys for device %{public}@ LocalLTK:%@(type:%d)",  buf,  0x1Cu);
  }

void sub_100629538( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Unwind_Resume(a1);
}

void sub_10062957C(uint64_t a1, unint64_t a2, unsigned int a3, int a4, char a5)
{
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
  }
  *(void *)uu = 0LL;
  uint64_t v69 = 0LL;
  sub_1005C8684((uint64_t)off_1008D5F28, a2, 0, 1u, 0LL, 0LL, uu);
  int v9 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    memset(out, 0, sizeof(out));
    uuid_unparse_upper(uu, out);
    sub_10002418C(__p, out);
    int v10 = v61;
    int v11 = (void **)__p[0];
    id v12 = sub_1005BFB9C(a2);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    char v14 = (void *)v13;
    int v15 = __p;
    if (v10 < 0) {
      int v15 = v11;
    }
    uint64_t v16 = "disabled";
    *(_DWORD *)buf = 136446722;
    if (a4) {
      uint64_t v16 = "enabled";
    }
    v63 = (void *)v16;
    __int16 v64 = 2082;
    uint64_t v65 = (uint64_t)v15;
    __int16 v66 = 2114;
    uint64_t v67 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Encryption is now %{public}s for device %{public}s (%{public}@)",  buf,  0x20u);
    if (v61 < 0) {
      operator delete(__p[0]);
    }
  }

  if (a4)
  {
    uint64_t v17 = sub_1001FDB10(a1 + 488, uu);
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
    }
    CFIndex v18 = off_1008D5F28;
    os_log_type_t v19 = sub_100241F94(uu);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v21 = sub_1005D733C((uint64_t)v18, v20);

    v22 = sub_100241F94(uu);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    BOOL v24 = sub_10061C0F8(a1, v23);

    if (v24)
    {
      uint64_t v25 = sub_1002E6E9C();
      (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)v25 + 1128LL))(v25, a2, 1LL);
    }

    else
    {
      char v26 = a1 + 496 != v17 || v21;
      if ((v26 & 1) == 0 && (a5 & 1) == 0)
      {
        int v27 = (os_log_s *)qword_1008F75A8;
        if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_ERROR))
        {
          sub_100366664(uu, out);
          int v49 = out[23];
          uint64_t v50 = *(char **)out;
          id v51 = sub_1005BFB9C(a2);
          uint64_t v52 = objc_claimAutoreleasedReturnValue(v51);
          unint64_t v53 = (void *)v52;
          v54 = out;
          if (v49 < 0) {
            v54 = v50;
          }
          *(_DWORD *)buf = 136446466;
          v63 = v54;
          __int16 v64 = 2114;
          uint64_t v65 = v52;
          _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Unexpected encryption state for device %{public}s (%{public}@), disconnecting",  buf,  0x16u);
          if (out[23] < 0) {
            operator delete(*(void **)out);
          }
        }

        if (qword_1008D5F10 != -1) {
          dispatch_once(&qword_1008D5F10, &stru_1008A45F8);
        }
        sub_100597F98((uint64_t)off_1008D5F08, uu, 6u);
      }
    }
  }

  if (a3 == 706)
  {
    if (qword_1008D5F20 != -1) {
      dispatch_once(&qword_1008D5F20, &stru_1008A4598);
    }
    uint64_t v28 = qword_1008D5F18;
    int v29 = sub_100241F94(uu);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    LODWORD(v28) = sub_10061C0F8(v28, v30);

    if ((_DWORD)v28)
    {
      v31 = (os_log_s *)qword_1008F75A8;
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_ERROR)) {
        sub_10069F520(v31, v32, v33, v34, v35, v36, v37, v38);
      }
      if (qword_1008D5F60 != -1) {
        dispatch_once(&qword_1008D5F60, &stru_1008A4638);
      }
      uint64_t v39 = qword_1008D5F58;
      v40 = sub_100241F94(uu);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      sub_1005528F8(v39, v41);
    }
  }

  unint64_t v42 = sub_100241F94(uu);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  unint64_t v44 = *(uint64_t **)(a1 + 568);
  for (i = *(uint64_t **)(a1 + 576); v44 != i; ++v44)
  {
    uint64_t v46 = *v44;
    uint64_t v47 = sub_100404FE8();
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_100629AC4;
    v56[3] = &unk_100891C78;
    uint64_t v58 = v46;
    id v57 = v43;
    char v59 = a4;
    sub_100405384(v47, v56);
  }

  uint64_t v48 = sub_1002E8D94();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)v48 + 640LL))(v48, a3, 2LL);
}

void sub_100629A3C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20, __int16 a21, char a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, void *__p, uint64_t a31, int a32, __int16 a33, char a34, char a35)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100629AC4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(**(void **)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 48));
}

uint64_t sub_100629ADC(uint64_t a1, unint64_t a2, uint64_t *a3, int a4)
{
  v27[0] = 0LL;
  v27[1] = 0LL;
  sub_100242F28((uint64_t)v27, a1 + 48);
  *(void *)uu = 0LL;
  uint64_t v31 = 0LL;
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
  }
  sub_1005C8684((uint64_t)off_1008D5F28, a2, 1u, 1u, 0LL, 0LL, uu);
  if (uuid_is_null(uu))
  {
    char v8 = 0;
    uint64_t v9 = 0LL;
    goto LABEL_5;
  }

  uint64_t v12 = sub_1001FDB10(a1 + 488, uu);
  if (a1 + 496 == v12) {
    uint64_t v12 = sub_1001FDB10(a1 + 440, uu);
  }
  if (v12 != a1 + 448)
  {
    uint64_t v13 = *(unsigned int **)(v12 + 56);
    if (v13) {
      sub_1002CD1E0(*(void *)(v12 + 56));
    }
    uint64_t v25 = 0LL;
    char v26 = 0LL;
    sub_10032BA60((uint64_t)v13, 9, &v25);
    id v23 = 0LL;
    BOOL v24 = 0LL;
    sub_10032BA60((uint64_t)v13, 8, &v23);
    BOOL v21 = 0LL;
    v22 = 0LL;
    sub_10032BA60((uint64_t)v13, 7, &v21);
    if (sub_10056AAC8((uint64_t)&v25) && sub_10056AAC8((uint64_t)&v23))
    {
      uint64_t v28 = 0LL;
      if (a4) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = *a3 == 0;
      }
      char v15 = v14;
      if ((sub_10056AAC8((uint64_t)&v21)
         || *(_BYTE *)sub_10056AAF0((uint64_t)&v21) != 2 && *(_BYTE *)sub_10056AAF0((uint64_t)&v21) != 3)
        && (v15 & 1) == 0)
      {
        goto LABEL_38;
      }
    }

    else
    {
      int v16 = *(unsigned __int16 *)sub_10056AAF0((uint64_t)&v23);
      char v8 = 0;
      uint64_t v9 = 0LL;
    }

    if (!sub_10056AAC8((uint64_t)&v21))
    {
      char v8 = *(_BYTE *)sub_10056AAF0((uint64_t)&v21);
      sub_10032BA60((uint64_t)v13, 6, &v28);
      sub_10002EAC8((uint64_t)&v23, (uint64_t)&v28);
      uint64_t v28 = &off_10087FAA8;
      if (v29) {
        sub_1002CD254(v29);
      }
      if (!sub_10056AAC8((uint64_t)&v23))
      {
        uint64_t v9 = *(unsigned __int8 *)sub_10056AAF0((uint64_t)&v23);
        goto LABEL_40;
      }

void sub_100629E64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned int *a11, uint64_t a12, unsigned int *a13, uint64_t a14, unsigned int *a15, char a16, uint64_t a17, uint64_t (**a18)(), unsigned int *a19)
{
  a18 = &off_10087FAA8;
  if (a19) {
    sub_1002CD254(a19);
  }
  if (a11) {
    sub_1002CD254(a11);
  }
  if (a13) {
    sub_1002CD254(a13);
  }
  if (a15) {
    sub_1002CD254(a15);
  }
  if (v19) {
    sub_1002CD254(v19);
  }
  sub_100242FAC((uint64_t)&a16);
  _Unwind_Resume(a1);
}

_BYTE *sub_100629F50(uint64_t a1, unint64_t a2)
{
  int v18 = 0;
  memset(v17, 0, sizeof(v17));
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
  }
  *(void *)uu = 0LL;
  uint64_t v16 = 0LL;
  sub_1005C8684((uint64_t)off_1008D5F28, a2, 1u, 1u, 0LL, 0LL, uu);
  if (!uuid_is_null(uu))
  {
    v4 = sub_100241F94(uu);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    sub_10062923C(a1, v5, (uint64_t)v17);

    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
    }
    uint64_t v6 = off_1008D5F28;
    id v7 = sub_100241F94(uu);
    char v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    BYTE2(v18) = sub_1005D6F94((uint64_t)v6, v8);
  }

  uint64_t v9 = sub_1001BCDB0(a2);
  int v12 = v9;
  char v14 = BYTE6(v9);
  __int16 v13 = WORD2(v9);
  char v11 = 0;
  sub_100242CA4(&v11);
  sub_1001C953C(&v12, (uint64_t)v17);
  return sub_100242CD8(&v11);
}

void sub_10062A0D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10062A104(uint64_t a1, unint64_t a2, int a3, unsigned __int8 *a4, unsigned int a5)
{
  uint64_t v10 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = sub_1005BFB9C(a2);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v14[0] = 67109634;
    v14[1] = a3;
    __int16 v15 = 1024;
    unsigned int v16 = a5;
    __int16 v17 = 2114;
    int v18 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Adding temporary security keys (type:%d lengh:%d) to device %{public}@",  (uint8_t *)v14,  0x18u);
  }

  return sub_10062A214(a1, a2, a3, a4, a5, 1);
}

uint64_t sub_10062A214(uint64_t a1, unint64_t a2, int a3, unsigned __int8 *a4, unsigned int a5, int a6)
{
  v36[0] = 0LL;
  v36[1] = 0LL;
  sub_100242F28((uint64_t)v36, a1 + 48);
  uint64_t v12 = sub_1001BCDB0(a2);
  int v33 = v12;
  char v35 = BYTE6(v12);
  __int16 v34 = WORD2(v12);
  char v32 = 0;
  sub_100242CA4(&v32);
  uint64_t v13 = sub_10012D98C(&v33);
  sub_100242CD0(&v32);
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  if (!v13) {
    goto LABEL_44;
  }
  if (qword_1008D5F10 != -1) {
    dispatch_once(&qword_1008D5F10, &stru_1008A45F8);
  }
  if (uuid_is_null(uu) && os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_FAULT))
  {
    id v14 = sub_1005BFB9C(a2);
    objc_claimAutoreleasedReturnValue(v14);
    sub_10069F64C();
  }

  if (!uuid_is_null(uu))
  {
LABEL_44:
    if (!uuid_is_null(uu)) {
      goto LABEL_16;
    }
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
    }
    sub_1005C8684((uint64_t)off_1008D5F28, a2, 0, 1u, 0LL, 0LL, src);
    uuid_copy(uu, src);
    if (uuid_is_null(uu) && os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_FAULT))
    {
      id v15 = sub_1005BFB9C(a2);
      objc_claimAutoreleasedReturnValue(v15);
      sub_10069F60C();
    }

    if (!uuid_is_null(uu))
    {
LABEL_16:
      unsigned int v16 = (os_log_s *)qword_1008F75A8;
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = sub_1005BFB9C(a2);
        int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        int v19 = *a4;
        *(_DWORD *)src = 138544386;
        *(void *)&src[4] = v18;
        *(_WORD *)&src[12] = 1024;
        *(_DWORD *)&src[14] = a3;
        __int16 v38 = 1024;
        int v39 = v19;
        __int16 v40 = 1024;
        unsigned int v41 = a5;
        __int16 v42 = 1024;
        int v43 = a6;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Key generated for %{public}@ type=%d value=%d len=%d temporary=%d",  src,  0x24u);
      }

      *(void *)src = &off_10089A548;
      *(void *)&src[8] = 0LL;
      if ((a6 & 1) != 0)
      {
        if (a1 + 472 != sub_1001FDB10(a1 + 464, uu))
        {
          if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_ERROR))
          {
            id v20 = sub_1005BFB9C(a2);
            objc_claimAutoreleasedReturnValue(v20);
            sub_10069F5CC();
          }

          goto LABEL_31;
        }

        if (a1 + 448 != sub_1001FDB10(a1 + 440, uu))
        {
          if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_ERROR))
          {
            id v24 = sub_1005BFB9C(a2);
            objc_claimAutoreleasedReturnValue(v24);
            sub_10069F58C();
          }

          goto LABEL_31;
        }

        uint64_t v28 = sub_1001FDB10(a1 + 488, uu);
        if (a1 + 496 == v28)
        {
          int v29 = operator new(0x28uLL);
          v29[2] = 1;
          *(void *)int v29 = &off_10089A468;
          *((void *)v29 + 4) = 0LL;
          *((void *)v29 + 3) = 0LL;
          *((void *)v29 + 2) = v29 + 6;
          v30 = &off_10089A548;
          uint64_t v31 = v29;
          sub_10002EAC8((uint64_t)src, (uint64_t)&v30);
          v30 = &off_10089A548;
          if (v31) {
            sub_1002CD254(v31);
          }
          v30 = (uint64_t (**)())uu;
          id v23 = sub_100632688( (uint64_t **)(a1 + 488),  uu,  (uint64_t)&unk_1006C2518,  (const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)&v30)
              + 6;
          v22 = src;
        }

        else
        {
          v22 = (_BYTE *)(v28 + 48);
          id v23 = (uint64_t *)src;
        }
      }

      else
      {
        uint64_t v21 = sub_1001FDB10(a1 + 464, uu);
        if (a1 + 472 == v21)
        {
          uint64_t v25 = operator new(0x28uLL);
          v25[2] = 1;
          *(void *)uint64_t v25 = &off_10089A468;
          *((void *)v25 + 4) = 0LL;
          *((void *)v25 + 3) = 0LL;
          *((void *)v25 + 2) = v25 + 6;
          v30 = &off_10089A548;
          uint64_t v31 = v25;
          sub_10002EAC8((uint64_t)src, (uint64_t)&v30);
          v30 = &off_10089A548;
          if (v31) {
            sub_1002CD254(v31);
          }
          v30 = (uint64_t (**)())uu;
          id v23 = sub_100632688( (uint64_t **)(a1 + 464),  uu,  (uint64_t)&unk_1006C2518,  (const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)&v30)
              + 6;
          v22 = src;
        }

        else
        {
          v22 = (_BYTE *)(v21 + 48);
          id v23 = (uint64_t *)src;
        }
      }

      sub_10002EAC8((uint64_t)v23, (uint64_t)v22);
LABEL_31:
      uint64_t v26 = *(void *)&src[8];
      if (*(void *)&src[8])
      {
        sub_10056AB04(&v30, a4, a5);
        sub_10032B1F8(v26, a3, (uint64_t)&v30);
        v30 = &off_10087FAA8;
        if (v31) {
          sub_1002CD254(v31);
        }
        *(void *)src = &off_10089A548;
        if (*(void *)&src[8]) {
          sub_1002CD254(*(unsigned int **)&src[8]);
        }
      }
    }
  }

  sub_100242CD8(&v32);
  return sub_100242FAC((uint64_t)v36);
}

void sub_10062A708( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned int *a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, unsigned int *a21)
{
  if (a10) {
    sub_1002CD254(a10);
  }
  if (a21) {
    sub_1002CD254(a21);
  }
  sub_100242CD8(&a14);
  sub_100242FAC((uint64_t)&a16);
  _Unwind_Resume(a1);
}

uint64_t *sub_10062A7B4(uint64_t a1, unsigned __int8 *a2)
{
  v4 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    memset(out, 0, 37);
    uuid_unparse_upper(a2, (char *)out);
    sub_10002418C(__p, (char *)out);
    id v5 = v12 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)uuid_string_t out = 136446210;
    *(void *)&out[4] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing temporary security keys for device %{public}s",  out,  0xCu);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
  }

  uint64_t v6 = (uint64_t **)(a1 + 488);
  result = (uint64_t *)sub_1001FDB10(a1 + 488, a2);
  if ((uint64_t *)(a1 + 496) != result)
  {
    char v8 = result;
    uint64_t v9 = (os_log_s *)qword_1008F75A8;
    if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
    {
      memset(out, 0, 37);
      uuid_unparse_upper(a2, (char *)out);
      sub_10002418C(__p, (char *)out);
      if (v12 >= 0) {
        uint64_t v10 = __p;
      }
      else {
        uint64_t v10 = (void **)__p[0];
      }
      *(_DWORD *)uuid_string_t out = 136446210;
      *(void *)&out[4] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Found temporary security keys for device %{public}s, removing now.",  out,  0xCu);
      if (v12 < 0) {
        operator delete(__p[0]);
      }
    }

    return sub_100632AF0(v6, v8);
  }

  return result;
}

uint64_t sub_10062A96C(uint64_t a1, unsigned __int8 *a2)
{
  v4 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    memset(out, 0, sizeof(out));
    uuid_unparse_upper(a2, out);
    sub_10002418C(__p, out);
    id v5 = v20 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)uuid_string_t out = 136446210;
    *(void *)&out[4] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing temporary IRK for device %{public}s",  (uint8_t *)out,  0xCu);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }

  uint64_t v6 = (uint64_t **)(a1 + 512);
  uint64_t result = sub_1001FDB10(a1 + 512, a2);
  char v8 = (uint64_t *)result;
  if (a1 + 520 != result)
  {
    uint64_t v9 = (os_log_s *)qword_1008F75A8;
    if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
    {
      memset(out, 0, sizeof(out));
      uuid_unparse_upper(a2, out);
      sub_10002418C(__p, out);
      uint64_t v10 = v20 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)uuid_string_t out = 136446210;
      *(void *)&out[4] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Found temporary IRK for device %{public}s, removing now.",  (uint8_t *)out,  0xCu);
      if (v20 < 0) {
        operator delete(__p[0]);
      }
    }

    if (qword_1008D5F20 != -1) {
      dispatch_once(&qword_1008D5F20, &stru_1008A4598);
    }
    uint64_t v11 = qword_1008D5F18;
    sub_10032BA60(v8[7], 11, out);
    char v12 = (unsigned __int8 *)sub_10056AAF0((uint64_t)out);
    sub_10062AC58(v11, v12);
    *(void *)uuid_string_t out = &off_10087FAA8;
    if (*(void *)&out[8]) {
      sub_1002CD254(*(unsigned int **)&out[8]);
    }
    sub_100632AF0(v6, v8);
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
    }
    uint64_t v13 = off_1008D5F28;
    id v14 = sub_100241F94(a2);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    unint64_t v16 = sub_1005CC198((uint64_t)v13, v15, 1);

    out[0] = 0;
    unint64_t v17 = sub_1001BEE0C(v16);
    *(_DWORD *)&out[1] = v17;
    *(_WORD *)&out[5] = WORD2(v17);
    sub_100627130(v17, (unsigned __int8 *)out);
    uint64_t v18 = sub_1002E6E9C();
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)v18 + 368LL))(v18, v16, 1LL);
  }

  return result;
}

void sub_10062AC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10062AC58(uint64_t result, unsigned __int8 *a2)
{
  uint64_t v3 = 0LL;
  while (1)
  {
    BOOL v4 = *(_DWORD *)(result + v3 + 613) == *(_DWORD *)a2 && *(_DWORD *)(result + v3 + 616) == *(_DWORD *)(a2 + 3);
    if (v4 && *(_BYTE *)(result + v3 + 620)) {
      break;
    }
    v3 += 24LL;
    if (v3 == 3120) {
      return result;
    }
  }

  *(_BYTE *)(result + v3 + 620) = 0;
  sub_100627130(result, a2);
  unint64_t v5 = ((unint64_t)a2[1] << 40) | ((unint64_t)a2[2] << 32) | ((unint64_t)a2[3] << 24) | ((unint64_t)a2[4] << 16) | ((unint64_t)a2[5] << 8) | a2[6] | ((unint64_t)*a2 << 48);
  uint64_t v6 = sub_1002E6E9C();
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)v6 + 368LL))(v6, v5, 1LL);
}

void sub_10062AD18(uint64_t a1, unint64_t a2, int a3)
{
  if (*(_BYTE *)(a1 + 3718))
  {
LABEL_2:
    int v40 = 0;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v37 = 0u;
    *(_OWORD *)char v35 = 0u;
    __int128 v36 = 0u;
    v28[0] = 0LL;
    v28[1] = 0LL;
    sub_100242F28((uint64_t)v28, a1 + 48);
    *(void *)uuid_t uu = 0LL;
    uint64_t v34 = 0LL;
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
    }
    sub_1005C8684((uint64_t)off_1008D5F28, a2, 0, 1u, 0LL, 0LL, uu);
    if (uuid_is_null(uu) && os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_FAULT))
    {
      id v6 = sub_1005BFB9C(a2);
      objc_claimAutoreleasedReturnValue(v6);
      sub_10069F68C();
    }

    if (!uuid_is_null(uu))
    {
      uint64_t v10 = (os_log_s *)qword_1008F75A8;
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
      {
        memset(out, 0, sizeof(out));
        uuid_unparse_upper(uu, out);
        sub_10002418C(__p, out);
        uint64_t v11 = "without";
        if (a3) {
          uint64_t v11 = "with";
        }
        if (v27 >= 0) {
          char v12 = __p;
        }
        else {
          char v12 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136446466;
        v30 = (void *)v11;
        __int16 v31 = 2082;
        char v32 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Security (%{public}s man-in-the-middle) was requested by device %{public}s",  buf,  0x16u);
        if (v27 < 0) {
          operator delete(__p[0]);
        }
      }

      unint64_t v13 = *(void *)(a1 + 456);
      if (v13 >= *(unsigned __int16 *)(a1 + 3736))
      {
        v22 = (os_log_s *)qword_1008F75A8;
        if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = sub_1005BFB9C(a2);
          id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          *(_DWORD *)uuid_string_t out = 134218242;
          *(void *)&out[4] = v13;
          *(_WORD *)&out[12] = 2114;
          *(void *)&out[14] = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Ignoring security request as there are too many paired devices (%lu), disconnecting %{public}@",  (uint8_t *)out,  0x16u);
        }

        *(void *)uuid_string_t out = 0LL;
        if (qword_1008D5F10 != -1) {
          dispatch_once(&qword_1008D5F10, &stru_1008A45F8);
        }
        if (sub_100599890((uint64_t)off_1008D5F08, uu, out))
        {
          LOBYTE(__p[0]) = 0;
          sub_100242CA4(__p);
          sub_10018551C(*(uint64_t *)out, 4835);
          sub_100242CD0(__p);
          sub_100242CD8(__p);
        }

        if (qword_1008D5F10 != -1) {
          dispatch_once(&qword_1008D5F10, &stru_1008A45F8);
        }
        sub_100597F98((uint64_t)off_1008D5F08, uu, 8u);
        goto LABEL_10;
      }

      id v14 = *(uint64_t (****)(void, void *, void))(a1 + 560);
      if (v14)
      {
        id v15 = sub_100241F94(uu);
        unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        int v17 = (**v14)(v14, v16, 0LL);

        uint64_t v18 = (os_log_s *)qword_1008F75A8;
        if (v17)
        {
          if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
          {
            memset(out, 0, sizeof(out));
            uuid_unparse_upper(uu, out);
            sub_10002418C(__p, out);
            if (v27 >= 0) {
              int v19 = __p;
            }
            else {
              int v19 = (void **)__p[0];
            }
            *(_DWORD *)buf = 136446210;
            v30 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Accepting security request from device %{public}s",  buf,  0xCu);
            if (v27 < 0) {
              operator delete(__p[0]);
            }
          }

          char v20 = sub_100241F94(uu);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          sub_10062923C(a1, v21, (uint64_t)v35);

          int v7 = 1;
          goto LABEL_9;
        }
      }

      else
      {
        uint64_t v18 = (os_log_s *)qword_1008F75A8;
      }

      int v7 = 0;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:
        uint64_t v8 = sub_1001BCDB0(a2);
        *(_DWORD *)uuid_string_t out = v8;
        out[6] = BYTE6(v8);
        *(_WORD *)&out[4] = WORD2(v8);
        LOBYTE(__p[0]) = 0;
        sub_100242CA4(__p);
        sub_1001C9804(out, v7, (uint64_t)v35);
        sub_100242CD8(__p);
LABEL_10:
        sub_100242FAC((uint64_t)v28);
        return;
      }

      if (*(void *)(a1 + 560)) {
        uint64_t v25 = "there are no sessions that support it!";
      }
      else {
        uint64_t v25 = "there is no listener";
      }
      *(_DWORD *)uuid_string_t out = 136446210;
      *(void *)&out[4] = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Ignoring security request as %{public}s",  (uint8_t *)out,  0xCu);
    }

    int v7 = 0;
    goto LABEL_9;
  }

  uint64_t v9 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)char v35 = 0;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "We don't have root keys for LE, something's wrong, file a radar!",  v35,  2u);
    if (*(_BYTE *)(a1 + 3718)) {
      goto LABEL_2;
    }
    uint64_t v9 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10069EE4C();
  }
}

void sub_10062B24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  sub_100242FAC((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10062B2B4(uint64_t a1, unint64_t a2)
{
  if (*(_BYTE *)(a1 + 3718))
  {
LABEL_2:
    v19[0] = 0LL;
    v19[1] = 0LL;
    sub_100242F28((uint64_t)v19, a1 + 48);
    *(void *)uuid_t uu = 0LL;
    uint64_t v25 = 0LL;
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
    }
    sub_1005C8684((uint64_t)off_1008D5F28, a2, 1u, 1u, 0LL, 0LL, uu);
    if (!uuid_is_null(uu))
    {
      int v7 = (os_log_s *)qword_1008F75A8;
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
      {
        memset(out, 0, sizeof(out));
        uuid_unparse_upper(uu, out);
        sub_10002418C(__p, out);
        uint64_t v8 = v21 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)buf = 136446210;
        id v23 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received a pairing request from device %{public}s",  buf,  0xCu);
        if (v21 < 0) {
          operator delete(__p[0]);
        }
      }

      unint64_t v9 = *(void *)(a1 + 456);
      if (v9 >= *(unsigned __int16 *)(a1 + 3736))
      {
        id v14 = (os_log_s *)qword_1008F75A8;
        if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = sub_1005BFB9C(a2);
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          *(_DWORD *)uuid_string_t out = 134218242;
          *(void *)&out[4] = v9;
          *(_WORD *)&out[12] = 2112;
          *(void *)&out[14] = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Ignoring security request as there are too many paired devices (%lu), disconnecting %@",  (uint8_t *)out,  0x16u);
        }

        *(void *)uuid_string_t out = 0LL;
        if (qword_1008D5F10 != -1) {
          dispatch_once(&qword_1008D5F10, &stru_1008A45F8);
        }
        if (sub_100599890((uint64_t)off_1008D5F08, uu, out))
        {
          LOBYTE(__p[0]) = 0;
          sub_100242CA4(__p);
          sub_10018551C(*(uint64_t *)out, 4835);
          sub_100242CD0(__p);
          sub_100242CD8(__p);
        }

        if (qword_1008D5F10 != -1) {
          dispatch_once(&qword_1008D5F10, &stru_1008A45F8);
        }
        sub_100597F98((uint64_t)off_1008D5F08, uu, 8u);
        goto LABEL_9;
      }

      uint64_t v10 = *(uint64_t (****)(void, void *, void))(a1 + 560);
      if (v10)
      {
        uint64_t v11 = sub_100241F94(uu);
        char v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        char v13 = (**v10)(v10, v12, 0LL);

        if ((v13 & 1) != 0)
        {
          int v4 = 1;
          goto LABEL_6;
        }
      }

      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_ERROR))
      {
        sub_100366664(uu, out);
        sub_10069F6CC();
      }
    }

    int v4 = 0;
LABEL_6:
    uint64_t v5 = sub_1001BCDB0(a2);
    *(_DWORD *)buf = v5;
    BYTE2(v23) = BYTE6(v5);
    LOWORD(v23) = WORD2(v5);
    char v18 = 0;
    sub_100242CA4(&v18);
    char v17 = 0;
    sub_100242CD8(&v18);
LABEL_9:
    sub_100242FAC((uint64_t)v19);
    return;
  }

  id v6 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uuid_string_t out = 0;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "We don't have root keys for LE, something's wrong, file a radar!",  (uint8_t *)out,  2u);
    if (*(_BYTE *)(a1 + 3718)) {
      goto LABEL_2;
    }
    id v6 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10069EE4C();
  }
}

void sub_10062B690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void sub_10062B6F0(uint64_t a1, unint64_t a2, uint64_t a3, unsigned int *a4)
{
  if (*(_BYTE *)(a1 + 3718)) {
    goto LABEL_2;
  }
  char v13 = (os_log_s *)qword_1008F75A8;
  if (!os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_FAULT))
  {
LABEL_13:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10069EE4C();
    }
    return;
  }

  *(_WORD *)buf = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "We don't have root keys for LE, something's wrong, file a radar!",  buf,  2u);
  if (!*(_BYTE *)(a1 + 3718))
  {
    char v13 = (os_log_s *)qword_1008F75A8;
    goto LABEL_13;
  }

void sub_10062BA70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10062BAC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v37[0] = 0LL;
  v37[1] = 0LL;
  sub_100242F28((uint64_t)v37, v1 + 48);
  v2 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "In showAuthorizationAlert", (uint8_t *)&buf, 2u);
  }

  if (*(void *)(v1 + 3720))
  {
    uint64_t v3 = (os_log_s *)qword_1008F75A8;
    if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      int v4 = "Already busy with another notification, waiting for the current one to complete";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&buf, 2u);
    }
  }

  else
  {
    if (![*(id *)(v1 + 3728) count])
    {
      uint64_t v3 = (os_log_s *)qword_1008F75A8;
      if (!os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT)) {
        return sub_100242FAC((uint64_t)v37);
      }
      LOWORD(buf) = 0;
      int v4 = "No more pending devices for AuthorizationAlert";
      goto LABEL_6;
    }

    int v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 3728) objectAtIndex:0]);
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
    if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Display Compromised device alert for %{public}@ ",  (uint8_t *)&buf,  0xCu);
    }

    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
    }
    sub_1005CC0D4((uint64_t)off_1008D5F28, v33, (uint64_t)&buf);
    uint64_t v6 = v41;
    if ((v41 & 0x80u) != 0) {
      uint64_t v6 = *((void *)&buf + 1);
    }
    if (v6)
    {
      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
      }
      sub_1005CC0D4((uint64_t)off_1008D5F28, v33, (uint64_t)__p);
      if (v36 >= 0) {
        int v7 = __p;
      }
      else {
        int v7 = (void **)__p[0];
      }
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
      if (v36 < 0) {
        operator delete(__p[0]);
      }
    }

    else
    {
      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
      }
      uint64_t v8 = sub_1005CC198((uint64_t)off_1008D5F28, v33, 0);
      id v9 = sub_1005BFB9C(v8);
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(v9);
    }

    uint64_t v10 = sub_1002E6BF0();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v10 + 328LL))(v10))
    {
      uint64_t v11 = sub_1002E6BF0();
      if (((*(uint64_t (**)(uint64_t))(*(void *)v11 + 368LL))(v11) & 1) != 0)
      {
        id v12 = @"iPod";
      }

      else
      {
        uint64_t v13 = sub_1002E6BF0();
        int v14 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 360LL))(v13);
        id v15 = @"iPhone";
        if (v14) {
          id v15 = @"iPad";
        }
        id v12 = v15;
      }
    }

    else
    {
      id v12 = @"iDevice";
    }

    LODWORD(buf) = 0;
    id v16 = sub_1002E95B8(@"COMPROMISED_DEVICE_TITLE", @"Bluetooth Security Alert");
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = sub_1002E95B8(@"COMPROMISED_DEVICE_ALLOW", @"Allow");
    int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = sub_1002E95B8(@"COMPROMISED_DEVICE_DONT_ALLOW", @"Don't Allow");
    char v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = sub_1002E95B8( @"COMPROMISED_DEVICE_AUTHORIZATION_MESSAGE",  @"%@ is trying to connect using an unsecured Bluetooth connection. Unsecured Bluetooth accessories can be used to control your %@ or gain access to your data.");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    id v34 = 0LL;
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v23,  @"%@%@",  &v34,  v32,  v12));
    id v25 = v34;

    if (v24)
    {
      v38[0] = kCFUserNotificationAlertTopMostKey;
      v38[1] = SBUserNotificationAllowMenuButtonDismissal;
      v39[0] = &__kCFBooleanTrue;
      v39[1] = &__kCFBooleanTrue;
      v38[2] = SBUserNotificationDismissOnLock;
      v38[3] = kCFUserNotificationAlertHeaderKey;
      v39[2] = &__kCFBooleanTrue;
      v39[3] = v17;
      v38[4] = kCFUserNotificationAlertMessageKey;
      v38[5] = kCFUserNotificationDefaultButtonTitleKey;
      v39[4] = v24;
      v39[5] = v21;
      v38[6] = kCFUserNotificationAlternateButtonTitleKey;
      v39[6] = v19;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  7LL));
      char v27 = (const __CFDictionary *)[v26 mutableCopy];

      uint64_t v28 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, (SInt32 *)&buf, v27);
      *(void *)(v1 + 3720) = v28;
      RunLoopSource = CFUserNotificationCreateRunLoopSource( kCFAllocatorDefault,  v28,  (CFUserNotificationCallBack)sub_10062C10C,  0LL);
      if (RunLoopSource)
      {
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopCommonModes);
        CFRelease(RunLoopSource);
      }

      else
      {
        CFUserNotificationCancel(v28);
        CFRelease(v28);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_ERROR))
    {
      sub_10069F8A4();
    }
  }

  return sub_100242FAC((uint64_t)v37);
}

void sub_10062C028( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20)
{
  sub_100242FAC((uint64_t)&a20);
  _Unwind_Resume(a1);
}

void sub_10062C10C(uint64_t a1, uint64_t a2)
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  uint64_t v3 = qword_1008D5F18;
  uint64_t v4 = sub_100404FE8();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10062C19C;
  v5[3] = &unk_10087F8E0;
  v5[4] = v3;
  v5[5] = a2;
  sub_100405384(v4, v5);
}

void sub_10062C19C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v2 + 3728) objectAtIndex:0]);
  uint64_t v4 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = "unknown";
    if (!v5) {
      uint64_t v6 = "Disallow";
    }
    *(_DWORD *)uint64_t v10 = 138543874;
    *(void *)&v10[4] = v3;
    *(_WORD *)&v10[12] = 2082;
    *(void *)&v10[14] = v6;
    *(_WORD *)&v10[22] = 2048;
    uint64_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "User responded to authorization notification for device %{public}@ with %{public}s (%ld) button",  v10,  0x20u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 != 1)
  {
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_ERROR)) {
        sub_10069F908();
      }
    }

    else
    {
      if (qword_1008D5F10 != -1) {
        dispatch_once(&qword_1008D5F10, &stru_1008A45F8);
      }
      uint64_t v8 = off_1008D5F08;
      sub_100241F90(v10, v3);
      sub_100597F98((uint64_t)v8, v10, 7u);
    }
  }

  sub_10062C3A4(v2, v3);
  CFRelease(*(CFTypeRef *)(v2 + 3720));
  *(void *)(v2 + 3720) = 0LL;
  if ([*(id *)(v2 + 3728) count])
  {
    uint64_t v9 = sub_100404FE8();
    *(void *)uint64_t v10 = _NSConcreteStackBlock;
    *(void *)&v10[8] = 3221225472LL;
    *(void *)&v10[16] = sub_10062BAC4;
    uint64_t v11 = &unk_10087EB20;
    uint64_t v12 = v2;
    sub_100405384(v9, v10);
  }
}

void sub_10062C388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10062C3A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = *(id *)(a1 + 3728);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString", (void)v12));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
        unsigned int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          [*(id *)(a1 + 3728) removeObject:v8];
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

void sub_10062C4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10062C530(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = *(id *)(a1 + 3728);
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v7), "UUIDString", (void)v13));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
        unsigned int v10 = [v8 isEqualToString:v9];

        if (v10)
        {
          __int128 v12 = (os_log_s *)qword_1008F75A8;
          if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138543362;
            id v18 = v3;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Device '%{public}@' is present in the authorization queue.",  buf,  0xCu);
          }

          goto LABEL_15;
        }

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  unsigned int v11 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v18 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Device '%{public}@' is not present in the authorization queue, creating device object and adding it to the queue",  buf,  0xCu);
  }

  objc_msgSend(*(id *)(a1 + 3728), "addObject:", v3, (void)v13);
LABEL_15:
}

void sub_10062C720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 sub_10062C764(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v2;
  __n128 result = *(__n128 *)(a2 + 80);
  __int128 v4 = *(_OWORD *)(a2 + 96);
  __int128 v5 = *(_OWORD *)(a2 + 112);
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 112) = v5;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

void sub_10062C78C(uint64_t a1)
{
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
  }
  __int128 v2 = off_1008D5F28;
  id v3 = sub_100241F94((const unsigned __int8 *)(a1 + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  sub_1005D99D8((uint64_t)v2, v4, *(void *)(*(void *)(a1 + 32) + 8LL) + 48LL);
}

void sub_10062C80C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t sub_10062C820(uint64_t a1)
{
  return (***(uint64_t (****)(void, void, void))(a1 + 40))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 48));
}

uint64_t sub_10062C838(uint64_t a1)
{
  if (qword_1008D5F00 != -1) {
    dispatch_once(&qword_1008D5F00, &stru_1008A4658);
  }
  return (*(uint64_t (**)(void *, void, void))(*(void *)off_1008D5EF8 + 64LL))( off_1008D5EF8,  0LL,  *(unsigned int *)(a1 + 32));
}

uint64_t sub_10062C894(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (sub_100626340(a1, v7))
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_ERROR)) {
      sub_10069F934();
    }
    uint64_t v8 = 168LL;
  }

  else if (sub_100626260(a1, v7))
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_ERROR)) {
      sub_10069F998();
    }
    uint64_t v8 = 169LL;
  }

  else
  {
    unint64_t v9 = *(void *)(a1 + 456);
    if (v9 >= *(unsigned __int16 *)(a1 + 3736))
    {
      __int128 v12 = (os_log_s *)qword_1008F75A8;
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Ignoring offline pairing request as there are too many paired devices (%lu)",  (uint8_t *)&buf,  0xCu);
      }

      uint64_t v8 = 180LL;
    }

    else
    {
      sub_100241F90(&buf, v7);
      p___int128 buf = (const unsigned __int8 *)&buf;
      unsigned int v10 = sub_10063289C((uint64_t **)(a1 + 464), (unsigned __int8 *)&buf, (uint64_t)&unk_1006C2518, &p_buf);
      sub_10002EAC8((uint64_t)(v10 + 6), a3);
      else {
        uint64_t v11 = *(unsigned __int8 *)(a4 + 23);
      }
      if (v11)
      {
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
        }
        __int128 v13 = off_1008D5F28;
        sub_100241F90(&buf, v7);
        if (*(char *)(a4 + 23) < 0)
        {
          sub_100024238(__p, *(void **)a4, *(void *)(a4 + 8));
        }

        else
        {
          *(_OWORD *)__p = *(_OWORD *)a4;
          uint64_t v27 = *(void *)(a4 + 16);
        }

        sub_1005C9550((uint64_t)v13, (unsigned __int8 *)&buf, (uint64_t)__p, 2);
        if (SHIBYTE(v27) < 0) {
          operator delete(__p[0]);
        }
      }

      sub_10032BA60(*(void *)(a3 + 8), 11, &buf);
      __int128 v14 = (unsigned __int8 *)sub_10056AAF0((uint64_t)&buf);
      uint64_t v15 = *v14;
      uint64_t v16 = v14[1];
      uint64_t v17 = v14[2];
      uint64_t v18 = v14[3];
      uint64_t v19 = v14[4];
      uint64_t v20 = v14[5];
      uint64_t v21 = v14[6];
      *(void *)&__int128 buf = &off_10087FAA8;
      if (*((void *)&buf + 1)) {
        sub_1002CD254(*((unsigned int **)&buf + 1));
      }
      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
      }
      uint64_t v22 = sub_1005CC198((uint64_t)off_1008D5F28, v7, 0);
      uint64_t v23 = sub_100404FE8();
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10062CC2C;
      v25[3] = &unk_100888050;
      v25[4] = a1;
      v25[5] = v22;
      v25[6] = (v15 << 48) | (v16 << 40) | (v17 << 32) | (v18 << 24) | (v19 << 16) | (v20 << 8) | v21;
      sub_100405384(v23, v25);
      uint64_t v8 = 0LL;
    }
  }

  return v8;
}

void sub_10062CBCC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_10062CC2C(void *a1)
{
  uint64_t v1 = a1[4];
  unint64_t v2 = a1[5];
  unint64_t v3 = a1[6];
  sub_10002418C(&__p, "");
  sub_100624468(v1, v2, v3, 0, &__p);
}

void sub_10062CC94( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

id sub_10062CCB0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0xFFC00000000000LL) != 0x1400000000000LL)
  {
    uint64_t v22 = (os_log_s *)qword_1008F75A8;
    if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = sub_1005BFB9C(a2);
      id v24 = objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)__int128 buf = 136446210;
      *(void *)&uint8_t buf[4] = [v24 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "address %{public}s is not resolvable.",  buf,  0xCu);
    }

void sub_10062D010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10062D058(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1002E6E9C();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v4 + 2144LL))(v4))
  {
    if (sub_10061C0F8(a1, v3))
    {
      if (v3 && *(_BYTE *)(a1 + 41))
      {
        *(_OWORD *)__int128 buf = 0uLL;
        sub_100242F28((uint64_t)buf, a1 + 48);
        sub_100241F90(&uu2, v3);
        uint64_t v5 = sub_1001FDB10(a1 + 440, (unsigned __int8 *)&uu2);
        uint64_t v6 = v5;
        if (a1 + 448 == v5)
        {
          id v14 = (os_log_s *)qword_1008F75A8;
          if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(uu2) = 138543362;
            *(void *)((char *)&uu2 + 4) = v3;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Device %{public}@ does not have any keys for Fast IRK resolution",  (uint8_t *)&uu2,  0xCu);
          }

          uint64_t v12 = 1601LL;
        }

        else
        {
          id v7 = (const unsigned __int8 *)(v5 + 32);
          uint64_t v8 = sub_100241F94((const unsigned __int8 *)(v5 + 32));
          int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
          unsigned int v10 = [v9 isEqual:v3];

          if (v10)
          {
            __int128 uu2 = 0uLL;
            sub_10032BA60(*(void *)(v6 + 56), 10, &uu2);
            if (sub_10056AAC8((uint64_t)&uu2))
            {
              uint64_t v11 = (os_log_s *)qword_1008F75A8;
              if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
              {
                int v22 = 138543362;
                id v23 = v3;
                _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Device %{public}@ has an empty IRK",  (uint8_t *)&v22,  0xCu);
              }

              uint64_t v12 = 1601LL;
            }

            else
            {
              uint64_t v15 = sub_1002E6E9C();
              if (qword_1008D5F30 != -1) {
                dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
              }
              id v16 = off_1008D5F28;
              uint64_t v17 = sub_100241F94(v7);
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
              uint64_t v19 = sub_1005CC198((uint64_t)v16, v18, 0);
              uint64_t v20 = sub_10056AAF0((uint64_t)&uu2);
              uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v15 + 376LL))( v15,  v19,  v20,  1LL);
            }

            *(void *)&__int128 uu2 = &off_10087FAA8;
            if (*((void *)&uu2 + 1)) {
              sub_1002CD254(*((unsigned int **)&uu2 + 1));
            }
          }

          else
          {
            uint64_t v12 = 0LL;
          }
        }

        sub_100242FAC((uint64_t)buf);
      }

      else
      {
        uint64_t v12 = 0LL;
      }
    }

    else
    {
      __int128 v13 = (os_log_s *)qword_1008F75A8;
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        *(void *)&uint8_t buf[4] = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Device %{public}@ is not paired",  buf,  0xCu);
      }

      uint64_t v12 = 1600LL;
    }
  }

  else
  {
    uint64_t v12 = 1602LL;
  }

  return v12;
}

void sub_10062D340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  _Unwind_Resume(a1);
}

void sub_10062D3AC(uint64_t a1, int *a2, _OWORD *a3, void *a4)
{
  __int16 v28 = a2;
  id v6 = a4;
  if (v6)
  {
    sub_100241F90(buf, v6);
    uint64_t v26 = &off_10089A548;
    int v27 = 0LL;
    if (a1 + 520 == sub_1001FDB10(a1 + 512, buf))
    {
      if (*(_BYTE *)(a1 + 41))
      {
        __int128 v13 = operator new(0x28uLL);
        v13[2] = 1;
        *(void *)__int128 v13 = &off_10089A468;
        *((void *)v13 + 4) = 0LL;
        *((void *)v13 + 3) = 0LL;
        *((void *)v13 + 2) = v13 + 6;
        *(void *)__int128 buf = &off_10089A548;
        *(void *)&uint8_t buf[8] = v13;
        sub_10002EAC8((uint64_t)&v26, (uint64_t)buf);
        *(void *)__int128 buf = &off_10089A548;
        if (*(void *)&buf[8]) {
          sub_1002CD254(*(unsigned int **)&buf[8]);
        }
        id v14 = v27;
        sub_10056AB04(buf, &v28, 8uLL);
        sub_10032B1F8((uint64_t)v14, 11, (uint64_t)buf);
        *(void *)__int128 buf = &off_10087FAA8;
        if (*(void *)&buf[8]) {
          sub_1002CD254(*(unsigned int **)&buf[8]);
        }
        sub_100241F90(buf, v6);
        const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v29 = buf;
        uint64_t v15 = sub_10063289C((uint64_t **)(a1 + 512), buf, (uint64_t)&unk_1006C2518, &v29);
        sub_10002EAC8((uint64_t)(v15 + 6), (uint64_t)&v26);
        sub_10061E118(a1, v28, a3);
        uint64_t v16 = *((unsigned __int8 *)v28 + 1);
        uint64_t v17 = *((unsigned __int8 *)v28 + 2);
        uint64_t v18 = *((unsigned __int8 *)v28 + 3);
        uint64_t v19 = *((unsigned __int8 *)v28 + 4);
        uint64_t v20 = *((unsigned __int8 *)v28 + 5);
        uint64_t v21 = *((unsigned __int8 *)v28 + 6);
        uint64_t v22 = *(unsigned __int8 *)v28;
        uint64_t v23 = sub_1002E6E9C();
        uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t))(*(void *)v23 + 360LL))( v23,  (v16 << 40) | (v17 << 32) | (v18 << 24) | (v19 << 16) | (v20 << 8) | v21 | (v22 << 48),  a3,  1LL);
        sub_10061E0B4(v24, v6, v24);
        goto LABEL_16;
      }

      uint64_t v25 = qword_1008F75A8;
      if (!os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:
        uint64_t v26 = &off_10089A548;
        if (v27) {
          sub_1002CD254(v27);
        }
        goto LABEL_18;
      }

      *(_DWORD *)__int128 buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 0;
      int v9 = "Unable to configure IRK for %{public}@ since fStarted = %d";
      unsigned int v10 = (os_log_s *)v25;
      uint32_t v11 = 18;
    }

    else
    {
      uint64_t v7 = qword_1008F75A8;
      if (!os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      uint64_t v8 = *(void *)(a1 + 528);
      *(_DWORD *)__int128 buf = 134218242;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      int v9 = "IRK is already configured size=%zu, %{public}@ ";
      unsigned int v10 = (os_log_s *)v7;
      uint32_t v11 = 22;
    }

    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    goto LABEL_16;
  }

  uint64_t v12 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    *(void *)&uint8_t buf[4] = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Device is nil in setTemporaryIrkForAddress IRK%{public}@ ",  buf,  0xCu);
  }

void sub_10062D6CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned int *a11)
{
  if (a11) {
    sub_1002CD254(a11);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_10062D738(uint64_t a1, _DWORD *a2, _OWORD *a3)
{
  uint64_t v3 = 0LL;
  if (a2 && a3)
  {
    v26[0] = 0LL;
    v26[1] = 0LL;
    sub_100242F28((uint64_t)v26, a1 + 48);
    for (uint64_t i = 0LL; i != 3120; i += 24LL)
    {
      BOOL v8 = *(_DWORD *)(a1 + i + 613) == *a2 && *(_DWORD *)(a1 + i + 616) == *(_DWORD *)((char *)a2 + 3);
      if (v8 && *(_BYTE *)(a1 + i + 620))
      {
        *a3 = *(_OWORD *)(a1 + i + 597);
        uint64_t v3 = 1LL;
        goto LABEL_37;
      }
    }

    int v9 = *(void **)(a1 + 440);
    unsigned int v10 = (void *)(a1 + 448);
    if (v9 == (void *)(a1 + 448))
    {
      uint64_t v3 = 0LL;
    }

    else
    {
      do
      {
        uint32_t v11 = objc_autoreleasePoolPush();
        uint64_t v24 = 0LL;
        uint64_t v25 = 0LL;
        sub_10032BA60(v9[7], 10, &v24);
        sub_10032BA60(v9[7], 11, &v22);
        uint64_t v12 = (_DWORD *)sub_10056AAF0((uint64_t)&v22);
        uint64_t v22 = &off_10087FAA8;
        if (v23) {
          sub_1002CD254(v23);
        }
        BOOL v13 = sub_10056AAC8((uint64_t)&v24);
        if (v12) {
          char v14 = v13;
        }
        else {
          char v14 = 1;
        }
        if ((v14 & 1) == 0
          && (*v12 == *a2 ? (BOOL v15 = *(_DWORD *)((char *)v12 + 3) == *(_DWORD *)((char *)a2 + 3)) : (BOOL v15 = 0), v15))
        {
          uint64_t v19 = (const void *)sub_10056AAF0((uint64_t)&v24);
          size_t v20 = sub_10056AAD8((uint64_t)&v24);
          memcpy(a3, v19, v20);
          int v16 = 0;
        }

        else
        {
          int v16 = 1;
        }

        uint64_t v24 = &off_10087FAA8;
        if (v25) {
          sub_1002CD254(v25);
        }
        objc_autoreleasePoolPop(v11);
        if (!v16) {
          break;
        }
        uint64_t v17 = (void *)v9[1];
        if (v17)
        {
          do
          {
            uint64_t v18 = v17;
            uint64_t v17 = (void *)*v17;
          }

          while (v17);
        }

        else
        {
          do
          {
            uint64_t v18 = (void *)v9[2];
            BOOL v8 = *v18 == (void)v9;
            int v9 = v18;
          }

          while (!v8);
        }

        int v9 = v18;
      }

      while (v18 != v10);
      uint64_t v3 = v16 ^ 1u;
    }

void sub_10062D91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
}

BOOL sub_10062D968(uint64_t a1, void *a2, void *a3, _BYTE *a4, unint64_t *a5)
{
  id v9 = a2;
  if (sub_10061C0F8(a1, v9))
  {
    if (sub_100626340(a1, v9))
    {
      if (sub_100626260(a1, v9))
      {
        unsigned int v10 = (os_log_s *)qword_1008F75A8;
        BOOL v11 = 0LL;
        if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138543362;
          id v42 = v9;
          uint64_t v12 = "Device %{public}@ pairing at the moment, keys are not complete yet";
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
          BOOL v11 = 0LL;
        }
      }

      else
      {
        v40[0] = 0LL;
        v40[1] = 0LL;
        sub_100242F28((uint64_t)v40, a1 + 48);
        sub_100241F90(buf, v9);
        uint64_t v13 = sub_1001FDB10(a1 + 440, buf);
        if (a1 + 448 == v13)
        {
          int v16 = (os_log_s *)qword_1008F75A8;
          BOOL v11 = 0LL;
          if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138543362;
            id v42 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Device %{public}@ does not have any keys",  buf,  0xCu);
            BOOL v11 = 0LL;
          }
        }

        else
        {
          char v14 = *(unsigned int **)(v13 + 56);
          if (v14) {
            sub_1002CD1E0(*(void *)(v13 + 56));
          }
          __int128 v38 = 0LL;
          __int128 v39 = 0LL;
          sub_10032BA60((uint64_t)v14, 10, &v38);
          if (sub_10056AAC8((uint64_t)&v38))
          {
            BOOL v15 = (os_log_s *)qword_1008F75A8;
            BOOL v11 = 0LL;
            if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138543362;
              id v42 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Device %{public}@ does not have an IRK",  buf,  0xCu);
              BOOL v11 = 0LL;
            }
          }

          else
          {
            char v36 = 0LL;
            __int128 v37 = 0LL;
            sub_10032BA60((uint64_t)v14, 11, &v36);
            BOOL v33 = sub_10056AAC8((uint64_t)&v36);
            if (v33)
            {
              uint64_t v17 = (os_log_s *)qword_1008F75A8;
              if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 138543362;
                id v42 = v9;
                _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Device %{public}@ does not have an identity address",  buf,  0xCu);
              }
            }

            else
            {
              uint64_t v32 = *(unsigned __int8 *)(sub_10056AAF0((uint64_t)&v36) + 1);
              uint64_t v18 = *(unsigned __int8 *)(sub_10056AAF0((uint64_t)&v36) + 2);
              uint64_t v19 = *(unsigned __int8 *)(sub_10056AAF0((uint64_t)&v36) + 3);
              uint64_t v20 = *(unsigned __int8 *)(sub_10056AAF0((uint64_t)&v36) + 4);
              uint64_t v21 = *(unsigned __int8 *)(sub_10056AAF0((uint64_t)&v36) + 5);
              uint64_t v22 = *(unsigned __int8 *)(sub_10056AAF0((uint64_t)&v36) + 6);
              *a5 = (v32 << 40) | (v18 << 32) | (v19 << 24) | (v20 << 16) | (v21 << 8) | v22 | ((unint64_t)*(unsigned __int8 *)sub_10056AAF0((uint64_t)&v36) << 48);
              uint64_t v23 = (const void *)sub_10056AAF0((uint64_t)&v38);
              size_t v24 = sub_10056AAD8((uint64_t)&v38);
              memcpy(a3, v23, v24);
              *a4 = sub_10056AAD8((uint64_t)&v38);
              uint64_t v25 = (os_log_s *)qword_1008F75A8;
              if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
              {
                unint64_t v26 = *a5;
                sub_10056B0A4((uint64_t)&v36, &v35);
                int size = (char)v35.__r_.__value_.__s.__size_;
                std::string::size_type v28 = v35.__r_.__value_.__r.__words[0];
                sub_10056B0A4((uint64_t)&v38, &__p);
                const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v29 = &v35;
                if (size < 0) {
                  const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v29 = (std::stringbuf::string_type *)v28;
                }
                if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                  p_p = &__p;
                }
                else {
                  p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
                }
                *(_DWORD *)__int128 buf = 138544130;
                id v42 = v9;
                __int16 v43 = 2048;
                unint64_t v44 = v26;
                __int16 v45 = 2080;
                uint64_t v46 = v29;
                __int16 v47 = 2080;
                uint64_t v48 = p_p;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "device %{public}@ address:%lld identity:%s IRK:%s",  buf,  0x2Au);
              }
            }

            BOOL v11 = !v33;
            char v36 = &off_10087FAA8;
            if (v37) {
              sub_1002CD254(v37);
            }
          }

          __int128 v38 = &off_10087FAA8;
          if (v39) {
            sub_1002CD254(v39);
          }
          if (v14) {
            sub_1002CD254(v14);
          }
        }

        sub_100242FAC((uint64_t)v40);
      }
    }

    else
    {
      unsigned int v10 = (os_log_s *)qword_1008F75A8;
      BOOL v11 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v42 = v9;
        uint64_t v12 = "Device %{public}@ isn't bonded";
        goto LABEL_10;
      }
    }
  }

  else
  {
    unsigned int v10 = (os_log_s *)qword_1008F75A8;
    BOOL v11 = 0LL;
    if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v42 = v9;
      uint64_t v12 = "Device %{public}@ isn't paired";
      goto LABEL_10;
    }
  }

  return v11;
}

void sub_10062DE6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20, unsigned int *a21, uint64_t a22, unsigned int *a23, char a24)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a21) {
    sub_1002CD254(a21);
  }
  if (a23) {
    sub_1002CD254(a23);
  }
  if (v25) {
    sub_1002CD254(v25);
  }
  sub_100242FAC((uint64_t)&a24);

  _Unwind_Resume(a1);
}

uint64_t sub_10062DF10(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0xFFC00000000000LL) == 0x1400000000000LL)
  {
    uint64_t v6 = sub_1001BCDB0(a2);
    int v29 = v6;
    char v31 = BYTE6(v6);
    __int16 v30 = WORD2(v6);
    *(_OWORD *)BOOL v33 = 0uLL;
    sub_100242F28((uint64_t)v33, a1 + 48);
    uint64_t v7 = *(void **)(a1 + 440);
    if (v7 == (void *)(a1 + 448))
    {
LABEL_13:
      for (uint64_t i = 0LL; i != 3120; i += 24LL)
      {
        if (*(_BYTE *)(a1 + i + 620) && sub_1001C924C((uint64_t)&v29, (__int128 *)(a1 + i + 597)))
        {
          uint64_t v17 = 0LL;
          int v21 = *(_DWORD *)(a1 + i + 613);
          __int16 v22 = *(_WORD *)(a1 + i + 617);
          *(_BYTE *)(a3 + 6) = *(_BYTE *)(a1 + i + 619);
          *(_WORD *)(a3 + 4) = v22;
          *(_DWORD *)a3 = v21;
          goto LABEL_29;
        }
      }

      uint64_t v13 = (os_log_s *)qword_1008F75A8;
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = sub_1005BFB9C(a2);
        id v15 = objc_claimAutoreleasedReturnValue(v14);
        id v16 = [v15 UTF8String];
        LODWORD(buf) = 136446210;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "address %{public}s could not be resolved.",  (uint8_t *)&buf,  0xCu);
      }

      uint64_t v17 = 114LL;
    }

    else
    {
      while (1)
      {
        __int128 buf = 0uLL;
        sub_10032BA60(v7[7], 10, &buf);
        if (!sub_10056AAC8((uint64_t)&buf))
        {
          BOOL v8 = (__int128 *)sub_10056AAF0((uint64_t)&buf);
        }

        *(void *)&__int128 buf = &off_10087FAA8;
        if (*((void *)&buf + 1)) {
          sub_1002CD254(*((unsigned int **)&buf + 1));
        }
        id v9 = (void *)v7[1];
        if (v9)
        {
          do
          {
            unsigned int v10 = v9;
            id v9 = (void *)*v9;
          }

          while (v9);
        }

        else
        {
          do
          {
            unsigned int v10 = (void *)v7[2];
            BOOL v11 = *v10 == (void)v7;
            uint64_t v7 = v10;
          }

          while (!v11);
        }

        uint64_t v7 = v10;
        if (v10 == (void *)(a1 + 448)) {
          goto LABEL_13;
        }
      }

      sub_10032BA60(v7[7], 11, &v27);
      uint64_t v23 = sub_10056AAF0((uint64_t)&v27);
      int v27 = &off_10087FAA8;
      if (v28) {
        sub_1002CD254(v28);
      }
      int v24 = *(_DWORD *)v23;
      __int16 v25 = *(_WORD *)(v23 + 4);
      *(_BYTE *)(a3 + 6) = *(_BYTE *)(v23 + 6);
      *(_WORD *)(a3 + 4) = v25;
      *(_DWORD *)a3 = v24;
      *(void *)&__int128 buf = &off_10087FAA8;
      if (*((void *)&buf + 1)) {
        sub_1002CD254(*((unsigned int **)&buf + 1));
      }
      uint64_t v17 = 0LL;
    }

void sub_10062E1F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5, uint64_t a6, unsigned int *a7, ...)
{
  if (a4) {
    sub_1002CD254(a4);
  }
  if (a7) {
    sub_1002CD254(a7);
  }
  sub_100242FAC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10062E260(uint64_t a1, uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, int a6, int a7, uint64_t a8)
{
  id v16 = (os_log_s *)qword_1008F75A8;
  BOOL v17 = os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v17)
    {
      sub_1005BF8CC(a2, &v29);
      uint64_t v18 = (v29.__r_.__value_.__s.__size_ & 0x80u) == 0
          ? &v29
          : (std::stringbuf::string_type *)v29.__r_.__value_.__r.__words[0];
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 136316675;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v18;
      WORD2(buf[0].__r_.__value_.__r.__words[1]) = 1041;
      *(_DWORD *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 6) = 16;
      WORD1(buf[0].__r_.__value_.__r.__words[2]) = 2097;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 4) = (std::string::size_type)a4;
      WORD2(buf[1].__r_.__value_.__r.__words[0]) = 1041;
      *(_DWORD *)((char *)buf[1].__r_.__value_.__r.__words + 6) = 16;
      WORD1(buf[1].__r_.__value_.__r.__words[1]) = 2097;
      *(std::string::size_type *)((char *)&buf[1].__r_.__value_.__r.__words[1] + 4) = (std::string::size_type)a5;
      WORD2(buf[1].__r_.__value_.__r.__words[2]) = 1024;
      *(_DWORD *)((char *)&buf[1].__r_.__value_.__r.__words[2] + 6) = a6;
      *(_WORD *)&buf[2].__r_.__value_.__s.__data_[2] = 1024;
      HIDWORD(buf[2].__r_.__value_.__r.__words[0]) = a7;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "LeSecurityManager::classicDevicePaired CTKD Device address:%s LTK:%{private}.16P IRK:%{private}.16P useH7:%d Auth:%d",  (uint8_t *)buf,  0x38u);
    }

    id v19 = malloc(0x10uLL);
    id v20 = malloc(0x10uLL);
    _OWORD *v19 = *a5;
    _OWORD *v20 = *a4;
    buf[0].__r_.__value_.__r.__words[0] = 0LL;
    buf[0].__r_.__value_.__l.__size_ = (std::string::size_type)buf;
    buf[0].__r_.__value_.__l.__cap_ = 0x4812000000LL;
    buf[1].__r_.__value_.__r.__words[0] = (std::string::size_type)sub_10062E540;
    buf[1].__r_.__value_.__l.__size_ = (std::string::size_type)sub_10062E55C;
    memset(&buf[1].__r_.__value_.__r.__words[2], 0, 32);
    else {
      buf[2] = *(std::stringbuf::string_type *)a8;
    }
    uint64_t v23 = sub_100404FE8();
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10062E570;
    v25[3] = &unk_1008A4478;
    char v26 = a7;
    char v27 = a6;
    v25[6] = a2;
    void v25[7] = v19;
    v25[8] = v20;
    v25[4] = buf;
    v25[5] = a1;
    sub_100405384(v23, v25);
    _Block_object_dispose(buf, 8);
    if ((char)buf[2].__r_.__value_.__s.__size_ < 0)
    {
      std::string::pointer data = buf[2].__r_.__value_.__l.__data_;
      goto LABEL_19;
    }
  }

  else if (v17)
  {
    sub_1005BF8CC(a2, buf);
    int v21 = (buf[0].__r_.__value_.__s.__size_ & 0x80u) == 0
        ? buf
        : (std::stringbuf::string_type *)buf[0].__r_.__value_.__r.__words[0];
    LODWORD(v29.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v29.__r_.__value_.__r.__words + 4) = (std::string::size_type)v21;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "LeSecurityManager::classicDevicePaired Non CTKD Device address:%s",  (uint8_t *)&v29,  0xCu);
    if ((char)buf[0].__r_.__value_.__s.__size_ < 0)
    {
      std::string::pointer data = (std::string::pointer)buf[0].__r_.__value_.__r.__words[0];
LABEL_19:
      operator delete(data);
    }
  }

  return 0LL;
}

void sub_10062E510( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, void *__p, uint64_t a26, int a27, __int16 a28, char a29, char a30)
{
}

__n128 sub_10062E540(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  a2[3].n128_u64[1] = 0LL;
  a2[4].n128_u64[0] = 0LL;
  a2[3].n128_u64[0] = 0LL;
  return result;
}

void sub_10062E55C(uint64_t a1)
{
}

uint64_t sub_10062E570(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v27[0] = 0LL;
  v27[1] = 0LL;
  sub_100242F28((uint64_t)v27, v2 + 48);
  v28[0] = 0LL;
  v28[1] = 0LL;
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
  }
  sub_1005C8684((uint64_t)off_1008D5F28, *(void *)(a1 + 48), 1u, 1u, 0LL, 0LL, (unsigned __int8 *)v28);
  uint64_t v3 = sub_100241F94((const unsigned __int8 *)v28);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = sub_10061C0F8(v2, v4);

  if (!v5)
  {
    *(_DWORD *)((char *)v26 + 3) = 0;
    v26[0] = 0;
    uint64_t v6 = sub_1001BCDB0(*(void *)(a1 + 48));
    v26[0] = v6;
    BYTE2(v26[1]) = BYTE6(v6);
    LOWORD(v26[1]) = WORD2(v6);
    unsigned __int8 v25 = 16;
    if (*(_BYTE *)(a1 + 72)) {
      unsigned __int8 v7 = 3;
    }
    else {
      unsigned __int8 v7 = 2;
    }
    unsigned __int8 v24 = v7;
    if (*(_BYTE *)(a1 + 73)) {
      unsigned __int8 v8 = 2;
    }
    else {
      unsigned __int8 v8 = 1;
    }
    unsigned __int8 v23 = v8;
    sub_10062A214(v2, *(void *)(a1 + 48), 10, *(unsigned __int8 **)(a1 + 56), 0x10u, 0);
    unint64_t v9 = *(void *)(a1 + 48);
    sub_10056AB04(&__p, v26, 7uLL);
    unsigned int v10 = (unsigned __int8 *)sub_10056AAF0((uint64_t)&__p);
    sub_10062A214(v2, v9, 11, v10, 7u, 0);
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_10087FAA8;
    if (__p.__r_.__value_.__l.__size_) {
      sub_1002CD254((unsigned int *)__p.__r_.__value_.__l.__size_);
    }
    sub_10062A214(v2, *(void *)(a1 + 48), 5, *(unsigned __int8 **)(a1 + 64), 0x10u, 0);
    sub_10062A214(v2, *(void *)(a1 + 48), 6, &v25, 1u, 0);
    sub_10062A214(v2, *(void *)(a1 + 48), 7, &v24, 1u, 0);
    sub_10062A214(v2, *(void *)(a1 + 48), 16, &v23, 1u, 0);
    unint64_t v11 = *(void *)(a1 + 48);
    sub_10002418C(&__p, "");
    sub_100624468(v2, v11, v11, 0, &__p);
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
    }
    uint64_t v12 = off_1008D5F28;
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (*(char *)(v13 + 71) < 0)
    {
      sub_100024238(__dst, *(void **)(v13 + 48), *(void *)(v13 + 56));
    }

    else
    {
      *(_OWORD *)__dst = *(_OWORD *)(v13 + 48);
      uint64_t v21 = *(void *)(v13 + 64);
    }

    sub_1005C9550((uint64_t)v12, (unsigned __int8 *)v28, (uint64_t)__dst, 2);
    if (SHIBYTE(v21) < 0) {
      operator delete(__dst[0]);
    }
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
    }
    id v14 = off_1008D5F28;
    id v15 = sub_100241F94((const unsigned __int8 *)v28);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    sub_10002418C(v18, "_CTKD_");
    sub_1005CCF08((uint64_t)v14, v16, (unsigned __int8 *)v18);
    if (v19 < 0) {
      operator delete(v18[0]);
    }
  }

  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 64));
  return sub_100242FAC((uint64_t)v27);
}

void sub_10062E8C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  sub_100242FAC(v29 - 88);
  _Unwind_Resume(a1);
}

uint64_t sub_10062E96C(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v6 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = sub_1005BF848(a2);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Trying to unpair classic device %{public}@ ctkd:%d",  buf,  0x12u);
  }

  if (!a2) {
    return 0LL;
  }
  *(void *)__int128 buf = 0LL;
  *(void *)&uint8_t buf[8] = 0LL;
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
  }
  sub_1005C8684((uint64_t)off_1008D5F28, a2, 0, 1u, 0LL, 0LL, buf);
  int is_null = uuid_is_null(buf);
  if (is_null) {
    uint64_t result = 101LL;
  }
  else {
    uint64_t result = 0LL;
  }
  if (!is_null && a3)
  {
    unint64_t v11 = sub_100241F94(buf);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = sub_10061C0F8(a1, v12);

    if (v13)
    {
      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
      }
      id v14 = off_1008D5F28;
      id v15 = sub_100241F94(buf);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      sub_10002418C(__p, "_CTKD_");
      int v17 = sub_1005CE5A8((uint64_t)v14, v16, (uint64_t)__p);
      if (v25 < 0) {
        operator delete(__p[0]);
      }

      if (v17)
      {
        uint64_t v18 = (os_log_s *)qword_1008F75A8;
        if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned __int8 v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Removing _CTKD_ Tag", v23, 2u);
        }

        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_1008A45D8);
        }
        char v19 = off_1008D5F28;
        id v20 = sub_100241F94(buf);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        sub_1005C9A38((uint64_t)v19, v21, @"_CTKD_");

        uint64_t v22 = sub_100404FE8();
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3321888768LL;
        _DWORD v26[2] = sub_10062EC70;
        v26[3] = &unk_100889A40;
        v26[4] = a1;
        uuid_copy(v27, buf);
        sub_1004054B4(v22, v26);
      }
    }

    return 0LL;
  }

  return result;
}

void sub_10062EC38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  _Unwind_Resume(a1);
}

void sub_10062EC70(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = sub_100241F94((const unsigned __int8 *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  sub_100625C0C(v1);
}

void sub_10062ECB4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10062ECC8(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = sub_1002E6BF0();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v3 + 344LL))(v3))
  {
    uint64_t v9 = 0LL;
    if (qword_1008D5F10 != -1) {
      dispatch_once(&qword_1008D5F10, &stru_1008A45F8);
    }
    uint64_t v4 = off_1008D5F08;
    sub_100241F90(buf, v2);
    if (sub_100599890((uint64_t)v4, buf, &v9))
    {
      char v8 = 0;
      sub_100242CA4(&v8);
      char v5 = sub_100090E10(v9);
      uint64_t v6 = (os_log_s *)qword_1008F75A8;
      BOOL v7 = os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT);
      if ((v5 & 1) != 0)
      {
        if (v7)
        {
          *(_DWORD *)__int128 buf = 138543362;
          id v11 = v2;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Not disabled CTKD for device %{public}@",  buf,  0xCu);
        }
      }

      else
      {
        if (v7)
        {
          *(_DWORD *)__int128 buf = 138543362;
          id v11 = v2;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Warning: Disabled CTKD for device %{public}@",  buf,  0xCu);
        }

        sub_1001D46E8(v9, 1);
      }

      sub_100242CD8(&v8);
    }
  }
}

void sub_10062EE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10062EE80(uint64_t a1)
{
  uint64_t v2 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v2 + 176LL))(v2))
  {
    uint64_t v3 = (os_log_s *)qword_1008F76C0;
    if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Erasing TEK History", v7, 2u);
    }
  }

  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  char v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;

  sub_100298924(12);
  sub_10062EF5C(a1);
  if (qword_1008D9700 != -1) {
    dispatch_once(&qword_1008D9700, &stru_1008A4678);
  }
  return sub_1003AA494((uint64_t)off_1008D96F8);
}

BOOL sub_10062EF5C(uint64_t a1)
{
  uint64_t v2 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v2 + 184LL))(v2))
  {
    uint64_t v3 = (os_log_s *)qword_1008F76C0;
    if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG)) {
      sub_10069FABC(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }

  unsigned __int16 v10 = (unsigned __int16)[*(id *)(a1 + 24) count];
  unsigned __int16 v20 = 22 * v10;
  if (22 * v10)
  {
    size_t v11 = (unsigned __int16)(22 * v10);
    uint64_t v12 = (char *)malloc(v11);
    bzero(v12, v11);
    if ([*(id *)(a1 + 24) count])
    {
      unint64_t v13 = 0LL;
      unsigned __int16 v14 = 0;
      do
      {
        v12[v14] = 21;
        unsigned __int16 v15 = v14 + 1;
        id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) objectAtIndex:v13]);
        [v16 getBytes:&v12[v15] length:21];

        unsigned __int16 v14 = v15 + 21;
        ++v13;
      }

      while ((unint64_t)[*(id *)(a1 + 24) count] > v13);
    }

    int v17 = sub_10029871C(0xEu, (const UInt8 *)v12, v20);
    if (v17)
    {
      int v18 = v17;
      if (os_log_type_enabled((os_log_t)qword_1008F76B8, OS_LOG_TYPE_ERROR)) {
        sub_10069FA5C();
      }
    }

    else
    {
      int v18 = sub_10029871C(0xDu, (const UInt8 *)&v20, 2u);
      if (v18 && os_log_type_enabled((os_log_t)qword_1008F76B8, OS_LOG_TYPE_ERROR)) {
        sub_10069F9FC();
      }
    }

    free(v12);
  }

  else
  {
    if (sub_10029871C(0xDu, (const UInt8 *)&v20, 2u))
    {
      if (os_log_type_enabled((os_log_t)qword_1008F76B8, OS_LOG_TYPE_ERROR)) {
        sub_10069F9FC();
      }
      int v18 = 1;
    }

    else
    {
      int v18 = 0;
    }
  }

  return v18 != 0;
}

void sub_10062F190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10062F1A0(uint64_t a1, char a2, int a3)
{
  if (a3)
  {
    sub_10062F26C(a1);
    if (*(_BYTE *)(a1 + 41))
    {
      if (qword_1008D9700 != -1) {
        dispatch_once(&qword_1008D9700, &stru_1008A4678);
      }
      if (*((void *)off_1008D96F8 + 10)) {
        sub_10062F4CC(a1);
      }
    }
  }

  sub_10062F5D8(a1);
  if ((a2 & 1) != 0) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = sub_10062FA04(a1);
  }
  if ([*(id *)(a1 + 24) count]) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 24),  "subarrayWithRange:",  v5,  (char *)objc_msgSend(*(id *)(a1 + 24), "count") - v5));
  }
  else {
    uint64_t v6 = &__NSArray0__struct;
  }
  return v6;
}

uint64_t sub_10062F26C(uint64_t a1)
{
  if (sub_10062FA04(a1))
  {
    memset(&v24[1], 0, 13);
    uint64_t v2 = (id *)(a1 + 24);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "objectAtIndex:", 0, 0, 0));
    [v3 getBytes:v24 length:21];

    int v4 = LOBYTE(v24[2]);
    LODWORD(v3) = BYTE1(v24[2]);
    int v5 = BYTE2(v24[2]);
    int v6 = BYTE3(v24[2]);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v8 = sub_1002E6E00();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v8 + 184LL))(v8)
      && os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG))
    {
      sub_10069FC0C();
    }

    if (v9 < *(_DWORD *)(a1 + 32))
    {
      BYTE4(v24[2]) = ((kCFAbsoluteTimeIntervalSince1970 + CFAbsoluteTimeGetCurrent()) / 600.0) - v4 + 1;
      uint64_t v10 = sub_1002E6E00();
      if ((*(unsigned int (**)(uint64_t))(*(void *)v10 + 184LL))(v10))
      {
        size_t v11 = (os_log_s *)qword_1008F76C0;
        if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG)) {
          sub_10069FB8C((uint64_t)v24, v11);
        }
      }

      [*v2 removeObjectAtIndex:0];
      id v12 = *v2;
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v24, 21LL));
      [v12 insertObject:v13 atIndex:0];

      uint64_t v14 = sub_1002E6E00();
      if ((*(unsigned int (**)(uint64_t))(*(void *)v14 + 184LL))(v14))
      {
        unsigned __int16 v15 = (os_log_s *)qword_1008F76C0;
        if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG)) {
          sub_10069FB24((uint64_t)v2, v15, v16, v17, v18, v19, v20, v21);
        }
      }
    }
  }

  else
  {
    uint64_t v22 = sub_1002E6E00();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v22 + 184LL))(v22)
      && os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG))
    {
      sub_10069FC6C();
    }
  }

  return 0LL;
}

void sub_10062F4B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10062F4CC(uint64_t a1)
{
  v7[0] = 0LL;
  v7[1] = 0LL;
  sub_10062FE78(a1, (uint64_t)v7, 0x10uLL, 1);
  uint64_t v1 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v1 + 184LL))(v1))
  {
    uint64_t v2 = (os_log_s *)qword_1008F76C0;
    if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68157954;
      v4[1] = 16;
      __int16 v5 = 2096;
      int v6 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "forceRefreshTEK new TEK:%.16P",  (uint8_t *)v4,  0x12u);
    }
  }

  if (qword_1008D9700 != -1) {
    dispatch_once(&qword_1008D9700, &stru_1008A4678);
  }
  return sub_1003AA494((uint64_t)off_1008D96F8);
}

uint64_t sub_10062F5D8(uint64_t a1)
{
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double Current = CFAbsoluteTimeGetCurrent();
  unsigned int v2 = *(_DWORD *)(a1 + 32);
  uint64_t v3 = sub_1002E6E00();
  unsigned int v4 = ((Current + kCFAbsoluteTimeIntervalSince1970) / 600.0) / v2 * v2 - 2016;
  if ((*(unsigned int (**)(uint64_t))(*(void *)v3 + 184LL))(v3)
    && os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG))
  {
    sub_10069FCA4();
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int16 v5 = *(void **)(a1 + 24);
  locationa = (id *)(a1 + 24);
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    do
    {
      unsigned int v9 = 0LL;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(id *)(*((void *)&v31 + 1) + 8LL * (void)v9);
        int v11 = *((unsigned __int8 *)[v10 bytes] + 16);
        id v12 = v10;
        int v13 = *((unsigned __int8 *)[v12 bytes] + 17);
        id v14 = v12;
        int v15 = *((unsigned __int8 *)[v14 bytes] + 18);
        id v16 = v14;
        LODWORD(v14) = *((unsigned __int8 *)[v16 bytes] + 19);
        uint64_t v17 = sub_1002E6E00();
        unsigned int v18 = v11 | (v13 << 8) | (v15 << 16) | ((_DWORD)v14 << 24);
        if ((*(unsigned int (**)(uint64_t))(*(void *)v17 + 184LL))(v17))
        {
          uint64_t v19 = (os_log_s *)qword_1008F76C0;
          if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int128 buf = 138413058;
            id v36 = v16;
            __int16 v37 = 1024;
            unsigned int v38 = v18;
            __int16 v39 = 1024;
            unsigned int v40 = v4;
            __int16 v41 = 1024;
            unsigned int v42 = v18 - v4;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "maintainTEKList key:%@ ENIN:%d oldestInterval:%d delta:%d",  buf,  0x1Eu);
          }
        }

        if (v18 <= v4)
        {
          uint64_t v22 = sub_1002E6E00();
          if ((*(unsigned int (**)(uint64_t))(*(void *)v22 + 184LL))(v22))
          {
            unsigned __int8 v23 = (os_log_s *)qword_1008F76C0;
            if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v36 = v16;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "dropping %@ as its too old",  buf,  0xCu);
            }
          }
        }

        else
        {
          uint64_t v20 = sub_1002E6E00();
          if ((*(unsigned int (**)(uint64_t))(*(void *)v20 + 184LL))(v20))
          {
            uint64_t v21 = (os_log_s *)qword_1008F76C0;
            if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v36 = v16;
              _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "keeping %@", buf, 0xCu);
            }
          }

          [obj addObject:v16];
        }

        unsigned int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }

    while (v7);
  }

  objc_storeStrong(locationa, obj);
  uint64_t v24 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v24 + 184LL))(v24))
  {
    char v25 = (os_log_s *)qword_1008F76C0;
    if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_INFO))
    {
      id v26 = *locationa;
      *(_DWORD *)__int128 buf = 138412290;
      id v36 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "updated list of keys:%@", buf, 0xCu);
    }
  }

  return 0LL;
}

void sub_10062F9CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_10062FA04(uint64_t a1)
{
  id result = [*(id *)(a1 + 24) count];
  if (result)
  {
    id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) objectAtIndex:0]);
    unsigned int v4 = (unsigned __int8 *)[v3 bytes];

    uint64_t v5 = sub_1002E6E00();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v5 + 184LL))(v5))
    {
      id v6 = (os_log_s *)qword_1008F76C0;
      if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG)) {
        sub_10069FD04((uint64_t)v4, a1, v6);
      }
    }

    return (id)(*(_DWORD *)(a1 + 32) == v4[20]);
  }

  return result;
}

void sub_10062FAAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10062FABC(uint64_t a1, int a2)
{
  double Current = CFAbsoluteTimeGetCurrent();
  unsigned int v5 = *(_DWORD *)(a1 + 32);
  uint64_t v6 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v6 + 176LL))(v6)
    && os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG))
  {
    sub_10069FD7C();
  }

  unsigned int v7 = *(_DWORD *)(a1 + 32);
  if (0x90 / v7 * a2)
  {
    unsigned int v8 = 0;
    unsigned int v9 = ((Current + kCFAbsoluteTimeIntervalSince1970) / 600.0) / v5 * v5 - 144 * a2;
    do
    {
      id v10 = sub_10062FCC0(a1, v9 + v7 * v8);
      int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      sub_10062FDD0(a1, v11);
      int v12 = *(_DWORD *)(a1 + 32);
      uint64_t v13 = sub_1002E6E00();
      v9 += v12;
      if ((*(unsigned int (**)(uint64_t))(*(void *)v13 + 176LL))(v13))
      {
        id v14 = (os_log_s *)qword_1008F76C0;
        if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int128 buf = 67109634;
          unsigned int v16 = v8;
          __int16 v17 = 1024;
          unsigned int v18 = v9;
          __int16 v19 = 2112;
          uint64_t v20 = v11;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "debugFillTEKHistory i:%d interval:%d tek:%@",  buf,  0x18u);
        }
      }

      ++v8;
      unsigned int v7 = *(_DWORD *)(a1 + 32);
    }

    while (v8 < 0x90 / v7 * a2);
  }

void sub_10062FCA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10062FCC0(uint64_t a1, int a2)
{
  LODWORD(__buf[2]) = a2;
  BYTE4(__buf[2]) = *(_DWORD *)(a1 + 32);
  uint64_t v4 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v4 + 184LL))(v4))
  {
    unsigned int v5 = (os_log_s *)qword_1008F76C0;
    if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68158210;
      v7[1] = 21;
      __int16 v8 = 2096;
      unsigned int v9 = __buf;
      __int16 v10 = 1024;
      int v11 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "createTEKForInterval outBuffer %.21P interval:%d",  (uint8_t *)v7,  0x18u);
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  __buf,  21LL));
}

void sub_10062FDD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 24) insertObject:v3 atIndex:0];
  uint64_t v4 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v4 + 184LL))(v4)
    && os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEBUG))
  {
    sub_10069FDDC();
  }

  sub_10062F5D8(a1);
  sub_10062EF5C(a1);
}

void sub_10062FE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10062FE78(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  char v7 = sub_10062FA04(a1) ^ 1 | a4;
  unsigned int v8 = ((CFAbsoluteTimeGetCurrent() + kCFAbsoluteTimeIntervalSince1970) / 600.0)
     / *(_DWORD *)(a1 + 32)
     * *(_DWORD *)(a1 + 32);
  uint64_t v9 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 184LL))(v9))
  {
    __int16 v10 = (os_log_s *)qword_1008F76C0;
    if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *(_DWORD *)(a1 + 32);
      int v11 = *(_DWORD *)(a1 + 36);
      int v21 = 67109632;
      int v22 = v8;
      __int16 v23 = 1024;
      *(_DWORD *)uint64_t v24 = v11;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "getCurrentTEK interval=%d fENIntervalNumber=%d fEKRollingPeriod=%d",  (uint8_t *)&v21,  0x14u);
    }
  }

  if ((v7 & 1) != 0
    || v8 >= *(_DWORD *)(a1 + 32) + *(_DWORD *)(a1 + 36)
    || ![*(id *)(a1 + 24) count]
    || v8 < *(_DWORD *)(a1 + 36))
  {
    *(_DWORD *)(a1 + 36) = v8;
    id v13 = sub_10062FCC0(a1, v8);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    sub_10062FDD0(a1, v14);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 24) objectAtIndex:0]);
  unsigned int v16 = v15;
  if (a3 >= 0x10) {
    uint64_t v17 = 16LL;
  }
  else {
    uint64_t v17 = a3;
  }
  [v15 getBytes:a2 length:v17];

  uint64_t v18 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v18 + 184LL))(v18))
  {
    __int16 v19 = (os_log_s *)qword_1008F76C0;
    if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 68157954;
      int v22 = 16;
      __int16 v23 = 2096;
      *(void *)uint64_t v24 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "getCurrentTEK returning %.16P",  (uint8_t *)&v21,  0x12u);
    }
  }

  return 0LL;
}

void sub_100630094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1006300B0(uint64_t a1, int a2)
{
  uint64_t result = 3LL;
  if ((a2 - 1) <= 0x8F && *(_DWORD *)(a1 + 32) != a2)
  {
    sub_10062F26C(a1);
    *(_DWORD *)(a1 + 32) = a2;
    uint64_t v5 = sub_1002E6E00();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v5 + 184LL))(v5))
    {
      uint64_t v6 = (os_log_s *)qword_1008F76C0;
      if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(_DWORD *)(a1 + 32);
        v8[0] = 67109120;
        v8[1] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "setEKRollingPeriod new EKRollingPeriod set to %d",  (uint8_t *)v8,  8u);
      }
    }

    sub_10029871C(0xBu, (const UInt8 *)(a1 + 32), 4u);
    if (qword_1008D9700 != -1) {
      dispatch_once(&qword_1008D9700, &stru_1008A4678);
    }
    sub_1003AA494((uint64_t)off_1008D96F8);
    return 0LL;
  }

  return result;
}

NSMutableDictionary *sub_1006301E8(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    if (v3)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 1LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"instance");

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a1 + 224, 16LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"identity");

      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 240)));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"address");
    }
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_1006302C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006302E8(uint64_t a1, const unsigned __int8 **a2)
{
  unsigned int v2 = a2 + 1;
  id v3 = *a2;
  if (*a2 != (const unsigned __int8 *)(a2 + 1))
  {
    do
    {
      uint64_t v4 = (unsigned int *)*((void *)v3 + 7);
      if (v4) {
        sub_1002CD1E0(*((void *)v3 + 7));
      }
      memset(dst, 0, sizeof(dst));
      uuid_copy(dst, v3 + 32);
      v9[0] = &off_10089A548;
      v9[1] = v4;
      if (v4) {
        sub_1002CD1E0((uint64_t)v4);
      }
      sub_10063041C(v5, dst, (uint64_t)v9);
      v9[0] = &off_10089A548;
      if (v4)
      {
        sub_1002CD254(v4);
        sub_1002CD254(v4);
      }

      uint64_t v6 = (unsigned __int8 *)*((void *)v3 + 1);
      if (v6)
      {
        do
        {
          int v7 = (const unsigned __int8 **)v6;
          uint64_t v6 = *(unsigned __int8 **)v6;
        }

        while (v6);
      }

      else
      {
        do
        {
          int v7 = (const unsigned __int8 **)*((void *)v3 + 2);
          BOOL v8 = *v7 == v3;
          id v3 = (const unsigned __int8 *)v7;
        }

        while (!v8);
      }

      id v3 = (const unsigned __int8 *)v7;
    }

    while (v7 != v2);
  }

void sub_1006303E0(_Unwind_Exception *a1)
{
}

void sub_10063041C(uint64_t a1, const unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    memset(out, 0, sizeof(out));
    uuid_unparse_upper(a2, out);
    sub_10002418C(&__p, out);
    if (v23 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    *(_DWORD *)uuid_string_t out = 136446210;
    *(void *)&out[4] = p_p;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:    %{public}s", (uint8_t *)out, 0xCu);
    if (v23 < 0) {
      operator delete(__p);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 0, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      int v7 = out;
    }
    else {
      int v7 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Remote LTK:     %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 1, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      BOOL v8 = out;
    }
    else {
      BOOL v8 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Remote LTK len: %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 3, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      uint64_t v9 = out;
    }
    else {
      uint64_t v9 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Remote EDIV:    %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 4, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      __int16 v10 = out;
    }
    else {
      __int16 v10 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Remote Rand:    %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 12, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      int v11 = out;
    }
    else {
      int v11 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Remote CSRK:    %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 10, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      int v12 = out;
    }
    else {
      int v12 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Remote IRK:     %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 11, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      id v13 = out;
    }
    else {
      id v13 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136446210;
    char v25 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "statedump:       Remote Address: %{public}s",  buf,  0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 6, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      id v14 = out;
    }
    else {
      id v14 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Local LTK len:  %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 5, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      int v15 = out;
    }
    else {
      int v15 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Local LTK:      %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 7, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      unsigned int v16 = out;
    }
    else {
      unsigned int v16 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Local LTK type: %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 8, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      uint64_t v17 = out;
    }
    else {
      uint64_t v17 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Local EDIV:     %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 9, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      uint64_t v18 = out;
    }
    else {
      uint64_t v18 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Local Rand:     %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 13, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      __int16 v19 = out;
    }
    else {
      __int16 v19 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       Local CSRK:     %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
    uint64_t v5 = (os_log_s *)qword_1008F75A8;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_10032BA60(*(void *)(a3 + 8), 16, &__p);
    sub_10056B0A4((uint64_t)&__p, (std::stringbuf::string_type *)out);
    if (out[23] >= 0) {
      uint64_t v20 = out;
    }
    else {
      uint64_t v20 = *(char **)out;
    }
    *(_DWORD *)__int128 buf = 136315138;
    char v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump:       deriveLKLTK:    %s", buf, 0xCu);
    if (out[23] < 0) {
      operator delete(*(void **)out);
    }
    std::string __p = &off_10087FAA8;
    if (v22) {
      sub_1002CD254(v22);
    }
  }

void sub_100630DD0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, unsigned int *a11)
{
  if (a11) {
    sub_1002CD254(a11);
  }
  _Unwind_Resume(exception_object);
}

void sub_100630E30(uint64_t a1)
{
  unsigned int v2 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "statedump: ---------------- LE Security Manager ----------------",  buf,  2u);
  }

  uint64_t v3 = sub_1002E6E00();
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  uint64_t v5 = (os_log_s *)qword_1008F75A8;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
    {
      sub_1005BFC20(*(void *)(a1 + 216), &__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)__int128 buf = 141560323;
      *(void *)&uint8_t buf[4] = 1752392040LL;
      *(_WORD *)&buf[12] = 1041;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&_BYTE buf[18] = 2097;
      *(void *)&buf[20] = a1 + 184;
      *(_WORD *)&buf[28] = 1041;
      *(_DWORD *)&buf[30] = 16;
      *(_WORD *)&buf[34] = 2097;
      *(void *)&buf[36] = a1 + 200;
      *(_WORD *)&buf[44] = 1041;
      *(_DWORD *)&buf[46] = 16;
      __int16 v44 = 2097;
      uint64_t v45 = a1 + 136;
      __int16 v46 = 1041;
      int v47 = 16;
      __int16 v48 = 2097;
      uint64_t v49 = a1 + 168;
      __int16 v50 = 2081;
      id v51 = p_p;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "statedump: IRK=%{private, mask.hash}.16P DHK=%{private}.16P IR=%{private}.16P ER=%{private}.16P fLocalStaticRand omAddress:%{private}s",  buf,  0x56u);
      uint64_t v5 = (os_log_s *)qword_1008F75A8;
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 68224515;
      *(_DWORD *)&uint8_t buf[4] = 96;
      *(_WORD *)&uint8_t buf[8] = 2097;
      *(void *)&buf[10] = a1 + 312;
      *(_WORD *)&_BYTE buf[18] = 1041;
      *(_DWORD *)&buf[20] = 64;
      *(_WORD *)&uint8_t buf[24] = 2097;
      *(void *)&buf[26] = a1 + 248;
      *(_WORD *)&buf[34] = 1041;
      *(_DWORD *)&buf[36] = 16;
      *(_WORD *)&buf[40] = 2097;
      *(void *)&buf[42] = a1 + 408;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "statedump: CloudPrivate=%{private}.96P CloudPublic=%{private}.64P CloudNonce=%{private}.16P",  buf,  0x32u);
      uint64_t v5 = (os_log_s *)qword_1008F75A8;
    }
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 456);
    int v8 = *(unsigned __int16 *)(a1 + 3736);
    *(_DWORD *)__int128 buf = 134218240;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "statedump: Paired LE devices: %lu/%d",  buf,  0x12u);
  }

  uint64_t v9 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v9 + 184LL))(v9))
  {
    __int16 v10 = (os_log_s *)qword_1008F76C0;
    if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *(_DWORD *)(a1 + 32);
      int v12 = *(_DWORD *)(a1 + 36);
      *(_DWORD *)__int128 buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v11;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "statedump: fEKRollingPeriod:%d fENIntervalNumber:%d",  buf,  0xEu);
    }
  }

  uint64_t v13 = sub_1002E6E00();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v13 + 184LL))(v13))
  {
    id v14 = (os_log_s *)qword_1008F76C0;
    if (os_log_type_enabled((os_log_t)qword_1008F76C0, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [*(id *)(a1 + 24) count];
      uint64_t v16 = *(void *)(a1 + 24);
      *(_DWORD *)__int128 buf = 134218242;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "statedump: fTEKArraySize:%zu fTEKArray:%@",  buf,  0x16u);
    }
  }

  uint64_t v17 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "statedump: Out-of-band devices:", buf, 2u);
  }

  uint64_t v18 = *(void **)(a1 + 536);
  uint64_t v40 = a1;
  __int16 v41 = (void *)(a1 + 544);
  if (v18 != (void *)(a1 + 544))
  {
    do
    {
      __int16 v19 = (os_log_s *)qword_1008F75A8;
      if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
      {
        sub_100494958(v18[4], (uint64_t)buf);
        uint64_t v20 = buf;
        if (buf[23] < 0) {
          uint64_t v20 = *(_BYTE **)buf;
        }
        LODWORD(__p.__r_.__value_.__l.__data_) = 136446210;
        *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "statedump:   %{public}s",  (uint8_t *)&__p,  0xCu);
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
      }

      int v21 = (const unsigned __int8 *)v18[5];
      if (v21 != (const unsigned __int8 *)(v18 + 6))
      {
        int v22 = (os_log_s *)qword_1008F75A8;
        do
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            memset(buf, 0, 37);
            uuid_unparse_upper(v21 + 32, buf);
            sub_10002418C(&__p, buf);
            char v23 = &__p;
            if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
              char v23 = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
            }
            *(_DWORD *)__int128 buf = 136446210;
            *(void *)&uint8_t buf[4] = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "statedump:      %{public}s", buf, 0xCu);
            int v22 = (os_log_s *)qword_1008F75A8;
          }

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            if (v21[56]) {
              uint64_t v24 = "Yes";
            }
            else {
              uint64_t v24 = "No";
            }
            *(_DWORD *)__int128 buf = 136446210;
            *(void *)&uint8_t buf[4] = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "statedump:         Enabled: %{public}s",  buf,  0xCu);
            int v22 = (os_log_s *)qword_1008F75A8;
          }

          char v25 = (unsigned __int8 *)*((void *)v21 + 1);
          if (v25)
          {
            do
            {
              id v26 = (const unsigned __int8 **)v25;
              char v25 = *(unsigned __int8 **)v25;
            }

            while (v25);
          }

          else
          {
            do
            {
              id v26 = (const unsigned __int8 **)*((void *)v21 + 2);
              BOOL v27 = *v26 == v21;
              int v21 = (const unsigned __int8 *)v26;
            }

            while (!v27);
          }

          int v21 = (const unsigned __int8 *)v26;
        }

        while (v26 != v18 + 6);
      }

      std::string::size_type v28 = (void *)v18[1];
      if (v28)
      {
        do
        {
          uint64_t v29 = v28;
          std::string::size_type v28 = (void *)*v28;
        }

        while (v28);
      }

      else
      {
        do
        {
          uint64_t v29 = (void *)v18[2];
          BOOL v27 = *v29 == (void)v18;
          uint64_t v18 = v29;
        }

        while (!v27);
      }

      uint64_t v18 = v29;
    }

    while (v29 != v41);
  }

  __int16 v30 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "statedump: In-progress keys:", buf, 2u);
  }

  sub_1006302E8(v40, (const unsigned __int8 **)(v40 + 464));
  __int128 v31 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "statedump: Temporary Security keys:", buf, 2u);
  }

  sub_1006302E8(v40, (const unsigned __int8 **)(v40 + 488));
  __int128 v32 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "statedump: Temporary IRKs:", buf, 2u);
  }

  sub_1006302E8(v40, (const unsigned __int8 **)(v40 + 512));
  __int128 v33 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "statedump: All IRKs:", buf, 2u);
    __int128 v33 = (os_log_s *)qword_1008F75A8;
  }

  for (uint64_t i = 620LL; i != 3740; i += 24LL)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = *(unsigned __int8 *)(v40 + i);
      *(_DWORD *)__int128 buf = 68158723;
      *(_DWORD *)&uint8_t buf[4] = 7;
      *(_WORD *)&uint8_t buf[8] = 2096;
      *(void *)&buf[10] = v40 + i - 7;
      *(_WORD *)&_BYTE buf[18] = 1041;
      *(_DWORD *)&buf[20] = 16;
      *(_WORD *)&uint8_t buf[24] = 2097;
      *(void *)&buf[26] = v40 + i - 23;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "statedump: Device %{bluetooth:BD_ADDR}.7P with IRK %{private}.16P used:%d",  buf,  0x28u);
      __int128 v33 = (os_log_s *)qword_1008F75A8;
    }
  }

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "statedump: Security keys:", buf, 2u);
  }

  sub_1006302E8(v40, (const unsigned __int8 **)(v40 + 440));
  id v36 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = sub_1005BFB9C(*(void *)(v40 + 3744));
    unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    *(_DWORD *)__int128 buf = 138543362;
    *(void *)&uint8_t buf[4] = v38;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "statedump: Current user's RSA: %{public}@",  buf,  0xCu);
  }

  if (*(_BYTE *)(v40 + 424))
  {
    uint64_t v39 = *(void *)(v40 + 432);
    if (v39) {
      (*(void (**)(uint64_t))(*(void *)v39 + 8LL))(v39);
    }
  }

uint64_t sub_100631690(uint64_t a1, uint64_t a2, unsigned __int8 *src, uint64_t a4)
{
  *(_WORD *)(a1 + 8) = 1;
  *(void *)a1 = &off_1008A44A8;
  *(void *)(a1 + 16) = a2;
  uuid_copy((unsigned __int8 *)(a1 + 24), src);
  uint64_t v6 = *(void *)(a4 + 8);
  *(void *)(a1 + 40) = &off_10089A548;
  *(void *)(a1 + 48) = v6;
  if (v6) {
    sub_1002CD1E0(v6);
  }
  return a1;
}

void *sub_1006316F0(void *a1)
{
  *a1 = &off_1008A44A8;
  a1[5] = &off_10089A548;
  unsigned int v2 = (unsigned int *)a1[6];
  if (v2) {
    sub_1002CD254(v2);
  }
  return a1;
}

void sub_100631734(void *__p)
{
  *std::stringbuf::string_type __p = &off_1008A44A8;
  __p[5] = &off_10089A548;
  unsigned int v2 = (unsigned int *)__p[6];
  if (v2) {
    sub_1002CD254(v2);
  }
  operator delete(__p);
}

void sub_100631778(uint64_t a1)
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  uint64_t v2 = qword_1008D5F18;
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = sub_100241F94((const unsigned __int8 *)(a1 + 24));
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  sub_1006285BC(v2, v3, v5, a1 + 40);
}

void sub_100631800( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

BOOL sub_100631814(unsigned __int8 *a1, uint64_t *a2, __int16 a3)
{
  unint64_t v5 = ((unint64_t)a1[1] << 40) | ((unint64_t)a1[2] << 32) | ((unint64_t)a1[3] << 24) | ((unint64_t)a1[4] << 16) | ((unint64_t)a1[5] << 8) | a1[6] | ((unint64_t)*a1 << 48);
  uint64_t v6 = sub_100404FE8();
  uint64_t v7 = operator new(0x28uLL);
  v7[4] = 1;
  *(void *)uint64_t v7 = &off_1008A44E0;
  uint8_t v7[16] = a3;
  uint64_t v8 = *a2;
  *((void *)v7 + 2) = v5;
  *((void *)v7 + 3) = v8;
  return sub_100405744(v6, v7);
}

void sub_1006318AC(unsigned __int8 *a1)
{
  unint64_t v1 = ((unint64_t)a1[1] << 40) | ((unint64_t)a1[2] << 32) | ((unint64_t)a1[3] << 24) | ((unint64_t)a1[4] << 16) | ((unint64_t)a1[5] << 8) | a1[6] | ((unint64_t)*a1 << 48);
  uint64_t v2 = sub_100404FE8();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100631AC0;
  v3[3] = &unk_10087EB20;
  v3[4] = v1;
  sub_100405384(v2, v3);
}

void sub_100631940(unsigned __int8 *a1, int a2, const void *a3, size_t __size)
{
  unsigned int v4 = __size;
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[6];
  uint64_t v12 = *a1;
  uint64_t v13 = (v6 << 40) | (v7 << 32) | (v8 << 24) | (v9 << 16) | (v10 << 8) | v11 | (v12 << 48);
  id v14 = malloc(v4);
  memcpy(v14, a3, v4);
  uint64_t v15 = sub_100404FE8();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100631B10;
  v17[3] = &unk_100889658;
  int v18 = a2;
  v17[4] = v13;
  _OWORD v17[5] = v14;
  char v19 = v4;
  sub_100405384(v15, v17);
}

uint64_t sub_100631A68(uint64_t a1)
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  return sub_100629ADC(qword_1008D5F18, *(void *)(a1 + 16), (uint64_t *)(a1 + 24), *(unsigned __int16 *)(a1 + 32));
}

_BYTE *sub_100631AC0(uint64_t a1)
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  return sub_100629F50(qword_1008D5F18, *(void *)(a1 + 32));
}

void sub_100631B10(uint64_t a1)
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  sub_10062A214( qword_1008D5F18,  *(void *)(a1 + 32),  *(_DWORD *)(a1 + 48),  *(unsigned __int8 **)(a1 + 40),  *(unsigned __int8 *)(a1 + 52),  0);
  free(*(void **)(a1 + 40));
}

void sub_100631B74(unsigned __int8 *a1, char a2)
{
  unint64_t v3 = ((unint64_t)a1[1] << 40) | ((unint64_t)a1[2] << 32) | ((unint64_t)a1[3] << 24) | ((unint64_t)a1[4] << 16) | ((unint64_t)a1[5] << 8) | a1[6] | ((unint64_t)*a1 << 48);
  uint64_t v4 = sub_100404FE8();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100631D60;
  v5[3] = &unk_1008800D8;
  v5[4] = v3;
  char v6 = a2;
  sub_100405384(v4, v5);
}

void sub_100631C10(unsigned __int8 *a1)
{
  unint64_t v1 = ((unint64_t)a1[1] << 40) | ((unint64_t)a1[2] << 32) | ((unint64_t)a1[3] << 24) | ((unint64_t)a1[4] << 16) | ((unint64_t)a1[5] << 8) | a1[6] | ((unint64_t)*a1 << 48);
  uint64_t v2 = sub_100404FE8();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100631DB4;
  v3[3] = &unk_10087EB20;
  v3[4] = v1;
  sub_100405384(v2, v3);
}

void sub_100631CA4(unsigned __int8 *a1, int a2, _OWORD *a3)
{
  unint64_t v5 = ((unint64_t)a1[1] << 40) | ((unint64_t)a1[2] << 32) | ((unint64_t)a1[3] << 24) | ((unint64_t)a1[4] << 16) | ((unint64_t)a1[5] << 8) | a1[6] | ((unint64_t)*a1 << 48);
  char v6 = malloc(0x10uLL);
  *char v6 = *a3;
  uint64_t v7 = sub_100404FE8();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_100631E04;
  v8[3] = &unk_10087F900;
  int v9 = a2;
  v8[4] = v5;
  v8[5] = v6;
  sub_100405384(v7, v8);
}

void sub_100631D60(uint64_t a1)
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  sub_10062AD18(qword_1008D5F18, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_100631DB4(uint64_t a1)
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  sub_10062B2B4(qword_1008D5F18, *(void *)(a1 + 32));
}

void sub_100631E04(uint64_t a1)
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  sub_10062B6F0(qword_1008D5F18, *(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(unsigned int **)(a1 + 40));
  free(*(void **)(a1 + 40));
}

void sub_100631E60(uint64_t a1, int a2, char a3)
{
  *(_DWORD *)&v16[3] = 0;
  *(_DWORD *)uint64_t v16 = 0;
  sub_1001B9A58(a1, (uint64_t)v16, 0LL);
  unint64_t v6 = ((unint64_t)v16[1] << 40) | ((unint64_t)v16[2] << 32) | ((unint64_t)v16[3] << 24) | ((unint64_t)v16[4] << 16) | ((unint64_t)v16[5] << 8) | v16[6] | ((unint64_t)v16[0] << 48);
  int v7 = sub_1001CBF3C(v16);
  uint64_t v8 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    sub_1005BFC20(v6, &__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int128 buf = 134218754;
    uint64_t v18 = a1;
    __int16 v19 = 1024;
    int v20 = a2;
    __int16 v21 = 2082;
    int v22 = p_p;
    __int16 v23 = 1024;
    int v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "encryptionStatusChangedCb handle:%p status=%{bluetooth:OI_STATUS}u address=%{public}s isPairing=%d",  buf,  0x22u);
  }

  uint64_t v10 = sub_100404FE8();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10063223C;
  v11[3] = &unk_100893818;
  v11[4] = v6;
  int v12 = a2;
  char v13 = a3;
  char v14 = v7;
  sub_100405384(v10, v11);
}

void sub_100632010(unsigned __int8 *a1, unsigned __int8 *a2, int a3)
{
  if (a2) {
    unint64_t v6 = ((unint64_t)a2[1] << 40) | ((unint64_t)a2[2] << 32) | ((unint64_t)a2[3] << 24) | ((unint64_t)a2[4] << 16) | ((unint64_t)a2[5] << 8) | a2[6] | ((unint64_t)*a2 << 48);
  }
  else {
    unint64_t v6 = 0LL;
  }
  unint64_t v7 = ((unint64_t)a1[1] << 40) | ((unint64_t)a1[2] << 32) | ((unint64_t)a1[3] << 24) | ((unint64_t)a1[4] << 16) | ((unint64_t)a1[5] << 8) | a1[6] | ((unint64_t)*a1 << 48);
  uint64_t v8 = (os_log_s *)qword_1008F75A8;
  if (os_log_type_enabled((os_log_t)qword_1008F75A8, OS_LOG_TYPE_DEFAULT))
  {
    sub_1005BFC20(v7, &v17);
    int size = (char)v17.__r_.__value_.__s.__size_;
    std::string::size_type v10 = v17.__r_.__value_.__r.__words[0];
    sub_1005BFC20(v6, &__p);
    uint64_t v11 = &v17;
    if (size < 0) {
      uint64_t v11 = (std::stringbuf::string_type *)v10;
    }
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int128 buf = 136446722;
    __int16 v19 = v11;
    __int16 v20 = 2082;
    __int16 v21 = p_p;
    __int16 v22 = 1024;
    int v23 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "smpPairingCompleted address=%{public}s resolvedAddress:%{public}s status=%{bluetooth:OI_STATUS}u",  buf,  0x1Cu);
  }

  sub_1001D4688(255LL);
  uint64_t v13 = sub_100404FE8();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  _DWORD v14[2] = sub_1006322A0;
  v14[3] = &unk_1008A4508;
  v14[4] = v7;
  v14[5] = v6;
  int v15 = a3;
  v14[6] = a2;
  v14[7] = a1;
  sub_100405384(v13, v14);
}

void sub_100632218( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *__p, uint64_t a23, int a24, __int16 a25, char a26, char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10063223C(uint64_t a1)
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  sub_10062957C( qword_1008D5F18,  *(void *)(a1 + 32),  *(_DWORD *)(a1 + 40),  *(_BYTE *)(a1 + 44) != 0,  *(_BYTE *)(a1 + 45));
}

void sub_1006322A0(uint64_t a1)
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  uint64_t v2 = qword_1008D5F18;
  unint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(_DWORD *)(a1 + 64);
  sub_10002418C(&__p, "");
  sub_100624468(v2, v3, v4, v5, &__p);
  if (!*(_DWORD *)(a1 + 64) && (*(void *)(a1 + 40) || !*(_BYTE *)(a1 + 38)))
  {
    if (qword_1008D5F20 != -1) {
      dispatch_once(&qword_1008D5F20, &stru_1008A4598);
    }
    unint64_t v6 = *(unsigned __int8 **)(a1 + 48);
    if (!v6) {
      unint64_t v6 = *(unsigned __int8 **)(a1 + 56);
    }
    sub_100620144(qword_1008D5F18, v6);
  }

void sub_1006323A0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1006323BC(void *a1)
{
  *a1 = &off_1008A4538;
  uint64_t v2 = (void *)a1[3];
  if (v2) {
    operator delete[](v2);
  }
  return a1;
}

void sub_1006323F4(void *__p)
{
  *std::string __p = &off_1008A4538;
  uint64_t v2 = (void *)__p[3];
  if (v2) {
    operator delete[](v2);
  }
  operator delete(__p);
}

uint64_t sub_10063242C(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v3 = sub_1002E6E9C();
  uint64_t v4 = *(void *)(a1 + 16);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v3 + 368LL))(v3, v4, 1LL);
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(*(void *)v3 + 360LL))( v3,  v4,  *(void *)(a1 + 24),  1LL);
  }
}

void sub_100632488()
{
  if (qword_1008D5F20 != -1) {
    dispatch_once(&qword_1008D5F20, &stru_1008A4598);
  }
  sub_1006275E8(qword_1008D5F18);
}

void sub_1006324C8(id a1)
{
  unint64_t v1 = operator new(0xEB0uLL);
  sub_100619518((uint64_t)v1);
  qword_1008D5F18 = (uint64_t)v1;
}

void sub_1006324F8(_Unwind_Exception *a1)
{
}

void sub_10063250C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10063250C(a1, *a2);
    sub_10063250C(a1, a2[1]);
    sub_100632554((uint64_t)(a2 + 4));
    operator delete(a2);
  }

void sub_100632554(uint64_t a1)
{
}

void sub_1006325A8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1006325A8(a1, *a2);
    sub_1006325A8(a1, a2[1]);
    a2[6] = &off_10089A548;
    uint64_t v4 = (unsigned int *)a2[7];
    if (v4) {
      sub_1002CD254(v4);
    }
    operator delete(a2);
  }

void sub_100632600(id a1)
{
  unint64_t v1 = operator new(0x230uLL);
  sub_10042BC28();
  off_1008D60A8 = v1;
}

void sub_100632630(_Unwind_Exception *a1)
{
}

void sub_100632644(id a1)
{
  unint64_t v1 = operator new(0x128uLL);
  sub_1005C69F8();
  off_1008D5F28 = v1;
}

void sub_100632674(_Unwind_Exception *a1)
{
}

uint64_t *sub_100632688( uint64_t **a1, unsigned __int8 *uu1, uint64_t a3, const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a4)
{
  uint64_t v9 = 0LL;
  unint64_t v6 = (uint64_t **)sub_1001FD824((uint64_t)a1, &v9, uu1);
  uint64_t result = *v6;
  if (!*v6)
  {
    memset(v8, 0, sizeof(v8));
    sub_100632728((uint64_t)a1, a4, v8);
    sub_100029630(a1, v9, v6, (uint64_t *)v8[0]);
    return (uint64_t *)v8[0];
  }

  return result;
}

void sub_100632728( uint64_t a1@<X0>, const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a2@<X2>, unsigned __int8 **a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0LL;
  a3[2] = 0LL;
  a3[1] = 0LL;
  unint64_t v6 = a3 + 1;
  unint64_t v7 = (unsigned __int8 *)operator new(0x40uLL);
  *a3 = v7;
  *unint64_t v6 = v5;
  *((_BYTE *)a3 + 16) = 0;
  uuid_copy(v7 + 32, *a2);
  *((void *)v7 + 6) = &off_10089A548;
  *((void *)v7 + 7) = 0LL;
  *((_BYTE *)a3 + 16) = 1;
}

void sub_1006327A4(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  sub_1006327C0(v2, v3);
  _Unwind_Resume(a1);
}

void sub_1006327C0(uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    __p[6] = &off_10089A548;
    uint64_t v3 = (unsigned int *)__p[7];
    if (v3) {
      sub_1002CD254(v3);
    }
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void sub_100632814(id a1)
{
  unint64_t v1 = operator new(0x618uLL);
  sub_10058B0A4();
  off_1008D5F08 = v1;
}

void sub_100632844(_Unwind_Exception *a1)
{
}

void sub_100632858(id a1)
{
  unint64_t v1 = operator new(0x260uLL);
  sub_1005285C8((uint64_t)v1);
  off_1008D67A0 = v1;
}

void sub_100632888(_Unwind_Exception *a1)
{
}

uint64_t *sub_10063289C( uint64_t **a1, unsigned __int8 *uu1, uint64_t a3, const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a4)
{
  uint64_t v9 = 0LL;
  unint64_t v6 = (uint64_t **)sub_1001FD824((uint64_t)a1, &v9, uu1);
  uint64_t result = *v6;
  if (!*v6)
  {
    memset(v8, 0, sizeof(v8));
    sub_10063293C((uint64_t)a1, a4, v8);
    sub_100029630(a1, v9, v6, (uint64_t *)v8[0]);
    return (uint64_t *)v8[0];
  }

  return result;
}

void sub_10063293C( uint64_t a1@<X0>, const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a2@<X2>, unsigned __int8 **a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0LL;
  a3[2] = 0LL;
  a3[1] = 0LL;
  unint64_t v6 = a3 + 1;
  unint64_t v7 = (unsigned __int8 *)operator new(0x40uLL);
  *a3 = v7;
  *unint64_t v6 = v5;
  *((_BYTE *)a3 + 16) = 0;
  uuid_copy(v7 + 32, *a2);
  *((void *)v7 + 6) = &off_10089A548;
  *((void *)v7 + 7) = 0LL;
  *((_BYTE *)a3 + 16) = 1;
}

void sub_1006329B8(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  sub_1006327C0(v2, v3);
  _Unwind_Resume(a1);
}

uint64_t *sub_1006329D4( uint64_t **a1, unsigned __int8 *uu1, uint64_t a3, const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a4)
{
  uint64_t v9 = 0LL;
  unint64_t v6 = (uint64_t **)sub_1001FD824((uint64_t)a1, &v9, uu1);
  uint64_t result = *v6;
  if (!*v6)
  {
    memset(v8, 0, sizeof(v8));
    sub_100632A74((uint64_t)a1, a4, v8);
    sub_100029630(a1, v9, v6, (uint64_t *)v8[0]);
    return (uint64_t *)v8[0];
  }

  return result;
}

void sub_100632A74( uint64_t a1@<X0>, const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a2@<X2>, unsigned __int8 **a3@<X8>)
{
  uint64_t v5 = (unsigned __int8 *)(a1 + 8);
  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  unint64_t v6 = (unsigned __int8 *)operator new(0x40uLL);
  *a3 = v6;
  a3[1] = v5;
  *((_BYTE *)a3 + 16) = 0;
  uuid_copy(v6 + 32, *a2);
  *((void *)v6 + 6) = 0LL;
  v6[56] = 0;
  *((_BYTE *)a3 + 16) = 1;
}

void sub_100632AD8(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  operator delete(v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_100632AF0(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = sub_1001FDBCC(a1, a2);
  a2[6] = (uint64_t)&off_10089A548;
  uint64_t v4 = (unsigned int *)a2[7];
  if (v4) {
    sub_1002CD254(v4);
  }
  operator delete(a2);
  return v3;
}

void sub_100632B38(id a1)
{
  unint64_t v1 = operator new(0x110uLL);
  sub_100551DD0();
  qword_1008D5F58 = (uint64_t)v1;
}

void sub_100632B68(_Unwind_Exception *a1)
{
}

void sub_100632B7C(id a1)
{
  unint64_t v1 = operator new(0x2B0uLL);
  sub_10040749C((uint64_t)v1);
  off_1008D5EF8 = v1;
}

void sub_100632BAC(_Unwind_Exception *a1)
{
}

void sub_100632BC0(id a1)
{
  unint64_t v1 = operator new(0x118uLL);
  sub_1003AA490((uint64_t)v1);
  off_1008D96F8 = v1;
}

void sub_100632BF0(_Unwind_Exception *a1)
{
}

void sub_100632C04(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100632C18(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  memset(&v24, 0, sizeof(v24));
  memset(&v23, 0, sizeof(v23));
  sub_10002418C(&v23, "Unknown");
  memset(&v22, 0, sizeof(v22));
  sub_10002418C(&v22, "");
  if (v6)
  {
    id v7 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    std::string::assign(&v22, (const std::string::value_type *)[v7 UTF8String]);

    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A4718);
    }
    sub_1005CC0D4((uint64_t)off_1008D5F28, v6, (uint64_t)buf);
    if (v30 >= 0) {
      uint64_t v8 = buf;
    }
    else {
      uint64_t v8 = *(const std::string::value_type **)buf;
    }
    std::string::assign(&v23, v8);
    if (SHIBYTE(v30) < 0) {
      operator delete(*(void **)buf);
    }
  }

  else {
    uint64_t v9 = off_1008A4738[(int)a2 - 1];
  }
  std::string::assign(&v24, v9);
  std::string::size_type v10 = (os_log_s *)qword_1008F7668;
  if (os_log_type_enabled((os_log_t)qword_1008F7668, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = &v24;
    if ((v24.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      uint64_t v11 = (std::string *)v24.__r_.__value_.__r.__words[0];
    }
    int v12 = &v22;
    if ((v22.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      int v12 = (std::string *)v22.__r_.__value_.__r.__words[0];
    }
    uint64_t v13 = &v23;
    if ((v23.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      uint64_t v13 = (std::string *)v23.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__int128 buf = 136315906;
    *(void *)&uint8_t buf[4] = v11;
    __int16 v28 = 2082;
    uint64_t v29 = v12;
    __int16 v30 = 2080;
    __int128 v31 = v13;
    __int16 v32 = 2082;
    uint64_t v33 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ThirdParty App Connection Limit exceeded wakeup by LE %s uuid=%{public}s(%s), bundleID=%{public}s",  buf,  0x2Au);
  }

  char v14 = objc_autoreleasePoolPush();
  v25[0] = @"WakeEventType";
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a2));
  v26[0] = v15;
  v25[1] = @"BundleID";
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  v26[1] = v16;
  v25[2] = @"CBUUID";
  if ((v22.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::stringbuf::string_type v17 = &v22;
  }
  else {
    std::stringbuf::string_type v17 = (std::string *)v22.__r_.__value_.__r.__words[0];
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
  _DWORD v26[2] = v18;
  v25[3] = @"DeviceName";
  if ((v23.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    __int16 v19 = &v23;
  }
  else {
    __int16 v19 = (std::string *)v23.__r_.__value_.__r.__words[0];
  }
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
  v26[3] = v20;
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL));

  PLLogRegisteredEvent(35LL, @"HostWakeThirdPartyConnectionLimit", v21, 0LL);
  objc_autoreleasePoolPop(v14);
}

void sub_100632F7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, void *a22, uint64_t a23, int a24, __int16 a25, char a26, char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }

  _Unwind_Resume(a1);
}

void sub_100633040(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (sub_100487CF4())
  {
    id v7 = objc_autoreleasePoolPush();
    v12[0] = @"BundleID";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
    v13[0] = v8;
    v12[1] = @"Connect";
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
    v13[1] = v9;
    v12[2] = @"CBUUID";
    std::string::size_type v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    v13[2] = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL));

    PLLogRegisteredEvent(35LL, @"LEConnectionRequest", v11, 0LL);
    objc_autoreleasePoolPop(v7);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
  {
    sub_10069FECC();
  }
}

void sub_1006331A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006331F4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (sub_100487CF4())
  {
    if (v6)
    {
      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_1008A4718);
      }
      uint64_t v7 = sub_1005D97A0((uint64_t)off_1008D5F28, v6);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_1008A4718);
      }
      sub_1005CC0D4((uint64_t)off_1008D5F28, v6, (uint64_t)__p);
      if (SHIBYTE(v26) < 0)
      {
        uint64_t v11 = *(void *)&__p[8];
        operator delete(*(void **)__p);
        if (v11) {
          goto LABEL_9;
        }
      }

      else if (HIBYTE(v26))
      {
LABEL_9:
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_1008A4718);
        }
        sub_1005CC0D4((uint64_t)off_1008D5F28, v6, (uint64_t)__p);
        if (v26 >= 0) {
          uint64_t v9 = __p;
        }
        else {
          uint64_t v9 = *(_BYTE **)__p;
        }
        std::string::size_type v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
        if (SHIBYTE(v26) < 0) {
          operator delete(*(void **)__p);
        }
        goto LABEL_21;
      }

      std::string::size_type v10 = @"Unknown";
    }

    else
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = @"Unknown";
      std::string::size_type v10 = @"Unknown";
    }

void sub_100633580( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20, int a21, __int16 a22, char a23, char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_100633618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (sub_100487CF4())
  {
    uint64_t v7 = objc_autoreleasePoolPush();
    v12[0] = @"Duration";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a2));
    v13[0] = v8;
    v12[1] = @"PercentageEPAPower";
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3));
    v13[1] = v9;
    v12[2] = @"PercentageIPAPower";
    std::string::size_type v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a4));
    v13[2] = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL));

    PLLogRegisteredEvent(35LL, @"PowerA2DPSession", v11, 0LL);
    objc_autoreleasePoolPop(v7);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
  {
    sub_10069FECC();
  }

void sub_100633778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006337B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (sub_100487CF4())
  {
    uint64_t v11 = objc_autoreleasePoolPush();
    v18[0] = @"Duration";
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a2));
    v19[0] = v12;
    v18[1] = @"PercentageEPAPowerFirstWindow";
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3));
    v19[1] = v13;
    v18[2] = @"PercentageIPAPowerFirstWindow";
    char v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a4));
    void v19[2] = v14;
    v18[3] = @"PercentageEPAPowerSecondWindow";
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a5));
    v19[3] = v15;
    v18[4] = @"PercentageIPAPowerSecondWindow";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a6));
    v19[4] = v16;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  5LL));

    PLLogRegisteredEvent(35LL, @"PowerHFPSession", v17, 0LL);
    objc_autoreleasePoolPop(v11);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
  {
    sub_10069FECC();
  }

void sub_100633974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006339C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  if (a6 && *a6)
  {
    uint64_t v10 = *(void *)(a2 + 8);
    uint64_t v13 = &off_10087FAA8;
    char v14 = (unsigned int *)v10;
    if (v10) {
      sub_1002CD1E0(v10);
    }
    sub_100633AD0((uint64_t)&v13, a3, a4, a5, (uint64_t)a6, 0LL);
    uint64_t v13 = &off_10087FAA8;
    uint64_t v11 = v14;
    if (!v14) {
      return;
    }
LABEL_10:
    sub_1002CD254(v11);
    return;
  }

  uint64_t v12 = *(void *)(a2 + 8);
  int v15 = &off_10087FAA8;
  uint64_t v16 = (unsigned int *)v12;
  if (v12) {
    sub_1002CD1E0(v12);
  }
  sub_100633AD0((uint64_t)&v15, a3, a4, a5, (uint64_t)"Unknown", 0LL);
  int v15 = &off_10087FAA8;
  uint64_t v11 = v16;
  if (v16) {
    goto LABEL_10;
  }
}

void sub_100633AA0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned int *a10, uint64_t a11, uint64_t a12)
{
  if (a10) {
    sub_1002CD254(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100633AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (sub_100487CF4())
  {
    memset(&v30, 0, sizeof(v30));
    uint64_t v12 = "PassupAdvertising";
    switch((int)a2)
    {
      case 0:
        std::string::assign(&v30, "Others");
        goto LABEL_17;
      case 1:
        uint64_t v12 = "Advertising";
        goto LABEL_13;
      case 2:
        goto LABEL_13;
      case 3:
        uint64_t v12 = "Connection";
        goto LABEL_13;
      case 4:
        uint64_t v12 = "Data";
        goto LABEL_13;
      case 5:
        uint64_t v12 = "Disconnection";
        goto LABEL_13;
      case 6:
        uint64_t v12 = "RSSIRegionDetection";
        goto LABEL_13;
      case 7:
        uint64_t v12 = "SensorTracking";
        goto LABEL_13;
      default:
        uint64_t v12 = "UnknownEvent";
LABEL_13:
        std::string::assign(&v30, v12);
        uint64_t v13 = (os_log_s *)qword_1008F7668;
        if (os_log_type_enabled((os_log_t)qword_1008F7668, OS_LOG_TYPE_DEFAULT))
        {
          int size = (char)v30.__r_.__value_.__s.__size_;
          std::string::size_type v15 = v30.__r_.__value_.__r.__words[0];
          uint64_t v16 = sub_1005C37D0(a6);
          *(_DWORD *)__int128 buf = 136447234;
          uint64_t v17 = &v30;
          if (size < 0) {
            uint64_t v17 = (std::string *)v15;
          }
          __int128 v34 = v17;
          __int16 v35 = 2082;
          uint64_t v36 = a3;
          __int16 v37 = 2082;
          uint64_t v38 = a4;
          __int16 v39 = 2080;
          uint64_t v40 = a5;
          __int16 v41 = 2082;
          unsigned int v42 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "AP wakeup by LE %{public}s bundleID=%{public}s, uuid=%{public}s, deviceName=%s, peerType=%{public}s",  buf,  0x34u);
        }

void sub_100633E58( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100633EE0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a4;
  __p[0] = 0LL;
  __p[1] = 0LL;
  uint64_t v20 = 0LL;
  sub_10002418C(__p, "Unknown");
  memset(&v18, 0, sizeof(v18));
  sub_10002418C(&v18, "Unknown");
  if (v8)
  {
    id v9 = objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    std::string::assign(&v18, (const std::string::value_type *)[v9 UTF8String]);

    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A4718);
    }
    sub_1005CC0D4((uint64_t)off_1008D5F28, v8, (uint64_t)&v16);
    if (SHIBYTE(v20) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v16;
    uint64_t v20 = v17;
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A4718);
    }
    uint64_t v10 = sub_1005D97A0((uint64_t)off_1008D5F28, v8);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v11 = *(unsigned int **)(a5 + 8);
  char v14 = &off_10087FAA8;
  std::string::size_type v15 = v11;
  if (v11) {
    sub_1002CD1E0((uint64_t)v11);
  }
  if ((v18.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v12 = &v18;
  }
  else {
    uint64_t v12 = (std::string *)v18.__r_.__value_.__r.__words[0];
  }
  if (v20 >= 0) {
    uint64_t v13 = __p;
  }
  else {
    uint64_t v13 = (void **)__p[0];
  }
  sub_100633AD0((uint64_t)&v14, a2, a3, (uint64_t)v12, (uint64_t)v13, v10);
  char v14 = &off_10087FAA8;
  if (v15) {
    sub_1002CD254(v15);
  }
  if (SHIBYTE(v20) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1006340A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }

  _Unwind_Resume(a1);
}

void sub_100634108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (sub_100487CF4())
  {
    id v9 = objc_autoreleasePoolPush();
    v15[0] = @"LegacyDupFilterOverflowReport";
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", a2));
    v16[0] = v10;
    v15[1] = @"ExtDupFilterOverflow";
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", a3));
    v16[1] = v11;
    v15[2] = @"LegacyDupFilterOverflowCnt";
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a4));
    v16[2] = v12;
    v15[3] = @"ExtDupFilterOverflowCnt";
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a5));
    v16[3] = v13;
    char v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  4LL));

    PLLogRegisteredEvent(35LL, @"DuplicateFilterOverflowReport", v14, 0LL);
    objc_autoreleasePoolPop(v9);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
  {
    sub_10069FECC();
  }

void sub_100634294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006342E8(id a1)
{
  unint64_t v1 = operator new(0x128uLL);
  sub_1005C69F8();
  off_1008D5F28 = v1;
}

void sub_100634318(_Unwind_Exception *a1)
{
}

_BYTE *sub_10063432C(_BYTE *result)
{
  uint64_t *result = 0;
  return result;
}

__n128 sub_100634334(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t sub_100634348(uint64_t a1, __int16 a2)
{
  __int16 v4 = a2;
  sub_1001BEE18((int8x16_t *)&v4, 2LL, 1, (uint64_t)&v5);
  *(_OWORD *)a1 = v5;
  *(_DWORD *)(a1 + 16) = v6;
  return a1;
}

uint64_t sub_1006343C4(uint64_t a1, int8x16_t *a2, uint64_t a3)
{
  *(_OWORD *)a1 = v5;
  *(_DWORD *)(a1 + 16) = v6;
  return a1;
}

uint64_t sub_10063443C(unsigned __int8 *a1, _BYTE *a2)
{
  if (!*a1) {
    return 0LL;
  }
  sub_1001BEF1C(a2, a1, 0);
  return *a1;
}

BOOL sub_10063447C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  size_t v2 = *a1;
  unsigned int v3 = *a2;
  if ((_DWORD)v2 == v3) {
    return memcmp(a1 + 4, a2 + 4, v2) >> 31;
  }
  else {
    return v2 < v3;
  }
}

void *sub_1006344B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v23 = 0u;
  switch((*(_BYTE *)a1 >> 1) | (*(_BYTE *)a1 << 7))
  {
    case 0:
      strcpy(__str, "(empty)");
      return sub_10002418C(a2, __str);
    case 1:
      uint64_t v6 = *(unsigned __int16 *)(a1 + 4);
      unsigned int v3 = "0x%04X";
      goto LABEL_6;
    case 2:
      uint64_t v6 = *(unsigned int *)(a1 + 4);
      unsigned int v3 = "0x%08X";
LABEL_6:
      snprintf( __str,  0x80uLL,  v3,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  *(void *)__str,  *(void *)&__str[8],  v23,  v24,  v25,  v26,  v27,  v28,  v29);
      break;
    case 8:
      snprintf( __str,  0x80uLL,  "%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X",  *(unsigned __int8 *)(a1 + 4),  *(unsigned __int8 *)(a1 + 5),  *(unsigned __int8 *)(a1 + 6),  *(unsigned __int8 *)(a1 + 7),  *(unsigned __int8 *)(a1 + 8),  *(unsigned __int8 *)(a1 + 9));
      break;
    default:
      uint64_t v5 = sub_1002E6E00();
      sub_1004FC118(v5, 0);
  }

  return sub_10002418C(a2, __str);
}

uint64_t sub_10063461C(uint64_t a1)
{
  *(void *)(a1 + 8) = off_1008A4800;
  uint64_t v2 = a1 + 8;
  *(void *)(a1 + 16) = &off_1008A4830;
  uint64_t v3 = a1 + 16;
  *(void *)a1 = off_1008A4768;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(_DWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  if (qword_1008D60B0 != -1) {
    dispatch_once(&qword_1008D60B0, &stru_1008A48E8);
  }
  sub_1001FC5E4((uint64_t)off_1008D60A8 + 80, v2);
  uint64_t v4 = sub_1002E8D54();
  sub_1006376E0(v4 + 768, v3);
  if (sub_10063473C() && sub_100488020())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_10063486C,  kRegulatoryDomainUpdateNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return a1;
}

void sub_100634708(_Unwind_Exception *a1)
{
  uint64_t v4 = *(void **)(v1 + 64);
  if (v4)
  {
    *(void *)(v1 + 72) = v4;
    operator delete(v4);
  }

  uint64_t v5 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 40) = v5;
    operator delete(v5);
  }

  _Unwind_Resume(a1);
}

BOOL sub_10063473C()
{
  if (qword_1008F1F28 != -1) {
    dispatch_once(&qword_1008F1F28, &stru_1008A4838);
  }
  v0 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v1 = "TRUE";
    if (byte_1008F1F20) {
      uint64_t v2 = "TRUE";
    }
    else {
      uint64_t v2 = "FALSE";
    }
    if (byte_1008F1F21) {
      uint64_t v3 = "TRUE";
    }
    else {
      uint64_t v3 = "FALSE";
    }
    int v5 = 136315650;
    uint64_t v6 = v2;
    __int16 v7 = 2080;
    uint64_t v8 = v3;
    __int16 v9 = 2080;
    uint64_t v10 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "PurpleLocation::useRegulatoryDomainForCountryCode() -- enabled = %s -- overrideEnabled = %s -- returning %s",  (uint8_t *)&v5,  0x20u);
  }

  return (byte_1008F1F20 | byte_1008F1F21) != 0;
}

void sub_10063486C()
{
  uint64_t v0 = sub_100404EB8();
  sub_100405384(v0, &stru_1008A48C8);
}

void *sub_10063488C(void *a1)
{
  *a1 = off_1008A4768;
  a1[1] = off_1008A4800;
  a1[2] = &off_1008A4830;
  uint64_t v2 = (uint64_t)(a1 + 2);
  uint64_t v3 = sub_1002E8D54();
  sub_10024E060(v3 + 768, v2);
  if (sub_10063473C() && sub_100488020())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a1, kRegulatoryDomainUpdateNotification, 0LL);
  }

  int v5 = (void *)a1[8];
  if (v5)
  {
    a1[9] = v5;
    operator delete(v5);
  }

  uint64_t v6 = (void *)a1[4];
  if (v6)
  {
    a1[5] = v6;
    operator delete(v6);
  }

  return a1;
}

void sub_10063492C(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void **)(v1 + 64);
  if (v3)
  {
    *(void *)(v1 + 72) = v3;
    operator delete(v3);
  }

  sub_10069FEF8(v1);
  _Unwind_Resume(a1);
}

void sub_10063495C(void *a1)
{
  uint64_t v1 = sub_10063488C(a1);
  operator delete(v1);
}

void sub_100634970(id a1)
{
  byte_1008F1F20 = _os_feature_enabled_impl("BluetoothFeatures", "UseRegulatoryDomainForCountryCode");
  uint64_t v1 = sub_1002E6E00();
  sub_10002418C(buf, "CountryCode");
  sub_10002418C(__p, "UseRegulatoryDomain");
  int v2 = (*(uint64_t (**)(uint64_t, _BYTE *, void **, char *))(*(void *)v1 + 72LL))( v1,  buf,  __p,  &byte_1008F1F21);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  if (v8 < 0)
  {
    operator delete(*(void **)buf);
    if (!v2) {
      return;
    }
  }

  else if (!v2)
  {
    return;
  }

  uint64_t v3 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1008F1F21) {
      uint64_t v4 = "Yes";
    }
    else {
      uint64_t v4 = "No";
    }
    *(_DWORD *)__int128 buf = 136315138;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Warning: overrideEnabled: %s", buf, 0xCu);
  }

void sub_100634AC0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

id sub_100634AFC(uint64_t a1)
{
  return *(id *)(a1 + 88);
}

BOOL sub_100634B04()
{
  int v1 = sub_100361020();
  BOOL v2 = (v1 - 112) >= 4 && v1 != 233;
  return (v1 - 235) >= 0xC && v2;
}

BOOL sub_100634B58()
{
  int v0 = sub_100361020();
  return (v0 - 255) < 0xB || (v0 - 124) < 2;
}

BOOL sub_100634B90()
{
  return (*(_DWORD *)(sub_1002E6E9C() + 708) - 1) >= 0x17 && (sub_100361020() & 0xFFFFFFFE) != 124;
}

BOOL sub_100634BCC()
{
  if (*(_DWORD *)(sub_1002E6E9C() + 708) != 22) {
    return 0LL;
  }
  uint64_t v0 = sub_1002E6E9C();
  (*(void (**)(void **__return_ptr))(*(void *)v0 + 16LL))(__p);
  if ((v4 & 0x80000000) == 0)
  {
    if (v4 == 2) {
      return LOWORD(__p[0]) == 13123;
    }
    return 0LL;
  }

  BOOL v1 = __p[1] == (void *)2 && *(_WORD *)__p[0] == 13123;
  operator delete(__p[0]);
  return v1;
}

void sub_100634C70(uint64_t a1, void *a2, _BYTE *a3, _BYTE *a4, BOOL *a5)
{
  char v8 = a2;
  if (-[__CFString isEqualToString:](v8, "isEqualToString:", @"XZ"))
  {
    *a3 = 0;
    *a4 = 1;
    *a5 = 1;
  }

  else
  {
    int v9 = sub_100361020();
    if (v9 == 50)
    {
      uint64_t v10 = @"/Library/Application Support/BTServer/countryCodesV39.plist";
    }

    else
    {
      uint64_t v10 = @"/Library/Application Support/BTServer/countryCodesJ3tv.plist";
      if (v9 != 150 && v9 != 158)
      {
        unsigned int v11 = *(_DWORD *)(sub_1002E6E9C() + 708);
        uint64_t v12 = sub_1002E6BF0();
        int v13 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 384LL))(v12);
        if (v11) {
          int v14 = v13;
        }
        else {
          int v14 = 0;
        }
        if (v14 == 1 && v11 <= 0x7CF && v11 > 0x16
          || v11 == 22
          && (uint64_t v15 = sub_1002E6BF0(), ((*(uint64_t (**)(uint64_t))(*(void *)v15 + 424LL))(v15) & 1) != 0))
        {
          uint64_t v10 = @"/Library/Application Support/BTServer/countryCodes3.plist";
        }

        else
        {
          uint64_t v16 = sub_1002E6BF0();
          unsigned __int8 v17 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 360LL))(v16);
          if (v11) {
            unsigned __int8 v18 = v17;
          }
          else {
            unsigned __int8 v18 = 0;
          }
          if (v11 >= 0x7D0) {
            unsigned __int8 v18 = 0;
          }
          if ((v18 & (v11 > 0x12)) != 0) {
            uint64_t v10 = @"/Library/Application Support/BTServer/countryCodes2.plist";
          }
          else {
            uint64_t v10 = @"/Library/Application Support/BTServer/countryCodes.plist";
          }
        }
      }
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  v10,  0LL,  0LL));
    id v35 = 0LL;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v19,  &v35));
    id v21 = v35;
    if (v21)
    {
      std::string v22 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_FAULT))
      {
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedDescription]);
        sub_10069FF10(v23, (uint64_t)v44, v22);
      }
    }

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uppercaseString](v8, "uppercaseString"));
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v24]);

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"CC"]);
    *a3 = [v26 intValue];

    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"LEFlag"]);
    *a4 = [v27 BOOLValue];

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"HDRFlag"]);
    *a5 = v28 != 0LL;
  }

  __int128 v29 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v30 = -[__CFString isEqualToString:](v8, "isEqualToString:", @"XZ");
    __int128 v31 = @"default";
    if (!v30) {
      __int128 v31 = v8;
    }
    int v32 = *a3;
    int v33 = *a4;
    BOOL v34 = *a5;
    *(_DWORD *)__int128 buf = 138544130;
    __int16 v37 = v31;
    __int16 v38 = 1024;
    int v39 = v32;
    __int16 v40 = 1024;
    int v41 = v33;
    __int16 v42 = 1024;
    BOOL v43 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Country specific power settings for country: %{public}@ CC %d LEFlag %d HDRFlag %d",  buf,  0x1Eu);
  }
}

void sub_100634F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100635014(uint64_t a1, void *a2, unsigned __int8 *a3, _BYTE *a4)
{
  uint64_t v45 = a2;
  if (-[__CFString isEqualToString:](v45, "isEqualToString:", @"XZ"))
  {
    *a3 = 0;
    *(_DWORD *)(a3 + 1) = -1;
    *((_DWORD *)a3 + 1) = -1;
    *a4 = 1;
    goto LABEL_48;
  }

  uint64_t v6 = sub_1002E6BF0();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v6 + 384LL))(v6))
  {
    if (sub_100634B04())
    {
      if (sub_100634B58())
      {
        __int16 v7 = @"/Library/Application Support/BTServer/countryCodes5MacV39.plist";
      }

      else
      {
        unsigned int v9 = sub_100361020() - 266;
        if (v9 >= 4) {
          __int16 v7 = @"/Library/Application Support/BTServer/countryCodes5Mac.plist";
        }
        else {
          __int16 v7 = *(&off_1008A4908 + (int)v9);
        }
      }
    }

    else
    {
      __int16 v7 = @"/Library/Application Support/BTServer/countryCodes4.plist";
    }

    goto LABEL_23;
  }

  uint64_t v8 = sub_1002E6BF0();
  if (!(*(unsigned int (**)(uint64_t))(*(void *)v8 + 360LL))(v8))
  {
    if (*(_DWORD *)(sub_1002E6E9C() + 708) == 25) {
      __int16 v7 = @"/Library/Application Support/BTServer/countryCodes6_CC6.plist";
    }
    else {
      __int16 v7 = @"/Library/Application Support/BTServer/countryCodes5.plist";
    }
    goto LABEL_23;
  }

  if (!sub_100634B04())
  {
    BOOL v10 = sub_100634BCC();
    unsigned int v11 = @"/Library/Application Support/BTServer/countryCodes4.plist";
    uint64_t v12 = @"/Library/Application Support/BTServer/countryCode5iPadsV2_4337C3_7923.plist";
    goto LABEL_20;
  }

  if (!sub_100634B90())
  {
    BOOL v10 = sub_100634B58();
    unsigned int v11 = @"/Library/Application Support/BTServer/countryCodes5iPads.plist";
    uint64_t v12 = @"/Library/Application Support/BTServer/countryCodes5MacV39.plist";
LABEL_20:
    if (v10) {
      __int16 v7 = v12;
    }
    else {
      __int16 v7 = v11;
    }
    goto LABEL_23;
  }

  __int16 v7 = @"/Library/Application Support/BTServer/countryCode5iPadsV2.0_4388C2.plist";
LABEL_23:
  uint64_t v50 = 0LL;
  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  v7,  0LL,  0LL));
  __int16 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:"));
  id v43 = 0LL;
  if (v43)
  {
    int v13 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_FAULT))
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v43 localizedDescription]);
      sub_10069FF10(v14, (uint64_t)v64, v13);
    }
  }

  *a3 = 0;
  *(_DWORD *)(a3 + 1) = -1;
  *((_DWORD *)a3 + 1) = -1;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uppercaseString](v45, "uppercaseString"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKey:v15]);

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v46 objects:v63 count:16];
  if (v18)
  {
    uint64_t v20 = *(void *)v47;
    *(void *)&__int128 v19 = 138412290LL;
    __int128 v41 = v19;
    do
    {
      for (uint64_t i = 0LL; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v17);
        }
        std::string v22 = *(__CFString **)(*((void *)&v46 + 1) + 8LL * (void)i);
        if (-[__CFString isEqualToString:](v22, "isEqualToString:", @"ISM 2.4", v41))
        {
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v22]);
          *a3 = [v23 unsignedIntValue];
        }

        else if (-[__CFString isEqualToString:](v22, "isEqualToString:", @"LE Flag"))
        {
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v22]);
          *a4 = [v24 BOOLValue];
        }

        else if (-[__CFString isEqualToString:](v22, "isEqualToString:", @"UNII-1"))
        {
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v22]);
          a3[1] = [v25 unsignedIntValue];
        }

        else if (-[__CFString isEqualToString:](v22, "isEqualToString:", @"UNII-3"))
        {
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v22]);
          a3[2] = [v26 unsignedIntValue];
        }

        else if (-[__CFString isEqualToString:](v22, "isEqualToString:", @"UNII-4"))
        {
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v22]);
          a3[3] = [v27 unsignedIntValue];
        }

        else if (-[__CFString isEqualToString:](v22, "isEqualToString:", @"UNII-5"))
        {
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v22]);
          a3[4] = [v28 unsignedIntValue];

          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v22]);
          a3[5] = [v29 unsignedIntValue];

          unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v22]);
          a3[6] = [v30 unsignedIntValue];

          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v22]);
          a3[7] = [v31 unsignedIntValue];
        }

        else
        {
          int v32 = (os_log_s *)qword_1008F7578;
          if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = v41;
            uint64_t v52 = v22;
            _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "PurpleLocation::getCountrySpecificPowerSettingsHRB: Unexpected key: %@",  buf,  0xCu);
          }
        }
      }

      id v18 = [v17 countByEnumeratingWithState:&v46 objects:v63 count:16];
    }

    while (v18);
  }

LABEL_48:
  int v33 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v34 = -[__CFString isEqualToString:](v45, "isEqualToString:", @"XZ");
    int v35 = *a3;
    uint64_t v36 = @"default";
    int v37 = *a4;
    if (!v34) {
      uint64_t v36 = v45;
    }
    int v38 = a3[1];
    int v39 = a3[2];
    int v40 = a3[4];
    *(_DWORD *)__int128 buf = 138544642;
    uint64_t v52 = v36;
    __int16 v53 = 1024;
    int v54 = v35;
    __int16 v55 = 1024;
    int v56 = v37;
    __int16 v57 = 1024;
    int v58 = v38;
    __int16 v59 = 1024;
    int v60 = v39;
    __int16 v61 = 1024;
    int v62 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Country specific power settings for country: %{public}@ ISM 2.4 CC: %d, LEFlag: %d, UNII-1 CC: %d, UNII-3 CC: %d, UNII-5 CC: %d",  buf,  0x2Au);
  }
}

void sub_1006355E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
}

void sub_1006356CC(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6 = a2;
  if ([v6 isEqualToString:@"XZ"])
  {
    *(_BYTE *)a3 = 0;
    *(_DWORD *)(a3 + 1) = -1;
    *(_DWORD *)(a3 + 4) = -1;
    goto LABEL_43;
  }

  int v7 = a4 - 8212;
  if ((a4 - 8212) < 0x11 && ((0x116A1u >> v7) & 1) != 0)
  {
    uint64_t v9 = (uint64_t)*(&off_1008A4928 + v7);
    *(_BYTE *)a3 = 0;
    *(_DWORD *)(a3 + 1) = -1;
    *(_DWORD *)(a3 + 4) = -1;
    id v38 = v6;
    id v43 = 0LL;
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  v9,  0LL,  0LL));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v36,  &v43));
    id v37 = v43;
    if (v37)
    {
      unsigned int v11 = (os_log_s *)qword_1008F7578;
      if (!os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
      {
LABEL_42:

        id v6 = v38;
        goto LABEL_43;
      }

      int v35 = v10;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v37 localizedDescription]);
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)__int128 v46 = a4;
      *(_WORD *)&v46[4] = 2112;
      *(void *)&v46[6] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "PurpleLocation::getCountrySpecificPowerSettingsForProduct: Unable to extract country code plist for productID 0x%08X: %@",  buf,  0x12u);
    }

    else
    {
      int v35 = v10;
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uppercaseString]);
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v13]);

      int v14 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = sub_1002E6E9C();
        int v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 2480LL))(v15);
        *(_DWORD *)__int128 buf = 138413315;
        *(void *)__int128 v46 = v6;
        *(_WORD *)&v46[8] = 2112;
        *(void *)&v46[10] = v34;
        __int16 v47 = 2160;
        uint64_t v48 = 1752392040LL;
        __int16 v49 = 2081;
        uint64_t v50 = "device supports HRB";
        __int16 v51 = 1024;
        int v52 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "PurpleLocation::getCountrySpecificPowerSettingsForProduct: countryString: %@, countryCodeDict: %@, %{private, mask.hash}s: %u",  buf,  0x30u);
      }

      uint64_t v17 = sub_1002E6E9C();
      if ((*(unsigned int (**)(uint64_t))(*(void *)v17 + 2480LL))(v17))
      {
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        id v18 = v34;
        id v19 = [v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v19)
        {
          uint64_t v21 = *(void *)v40;
          *(void *)&__int128 v20 = 138412290LL;
          __int128 v32 = v20;
          do
          {
            for (uint64_t i = 0LL; i != v19; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v40 != v21) {
                objc_enumerationMutation(v18);
              }
              __int128 v23 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
              if (objc_msgSend(v23, "isEqualToString:", @"ISM 2.4", v32))
              {
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v23]);
                *(_BYTE *)a3 = [v24 unsignedIntValue];
              }

              else if ([v23 isEqualToString:@"UNII-1"])
              {
                __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v23]);
                *(_BYTE *)(a3 + 1) = [v25 unsignedIntValue];
              }

              else if ([v23 isEqualToString:@"UNII-3"])
              {
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v23]);
                *(_BYTE *)(a3 + 2) = [v26 unsignedIntValue];
              }

              else if ([v23 isEqualToString:@"UNII-4"])
              {
                __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v23]);
                *(_BYTE *)(a3 + 3) = [v27 unsignedIntValue];
              }

              else if ([v23 isEqualToString:@"UNII-5a"])
              {
                __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v23]);
                *(_BYTE *)(a3 + 4) = [v28 unsignedIntValue];
              }

              else if ([v23 isEqualToString:@"UNII-5b"])
              {
                __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v23]);
                *(_BYTE *)(a3 + 5) = [v29 unsignedIntValue];
              }

              else if ([v23 isEqualToString:@"UNII-5c"])
              {
                unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v23]);
                *(_BYTE *)(a3 + 6) = [v30 unsignedIntValue];
              }

              else if ([v23 isEqualToString:@"UNII-5d"])
              {
                __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v23]);
                *(_BYTE *)(a3 + 7) = [v31 unsignedIntValue];
              }

              else
              {
                log = (os_log_s *)qword_1008F7578;
                if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)__int128 buf = v32;
                  *(void *)__int128 v46 = v23;
                  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "PurpleLocation::getCountrySpecificPowerSettingsForProduct: Unexpected key: %@",  buf,  0xCu);
                }
              }
            }

            id v19 = [v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
          }

          while (v19);
        }
      }

      else
      {
        id v18 = (id)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"ISM 2.4"]);
        *(_BYTE *)a3 = [v18 unsignedIntValue];
      }
    }

    BOOL v10 = v35;
    goto LABEL_42;
  }

  *(_BYTE *)a3 = 0;
  *(_DWORD *)(a3 + 1) = -1;
  *(_DWORD *)(a3 + 4) = -1;
  uint64_t v8 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    *(_DWORD *)__int128 v46 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "PurpleLocation::getCountrySpecificPowerSettingsForProduct: Unexpected product ID: %u",  buf,  8u);
  }

void sub_100635CD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100635DC4(uint64_t a1)
{
  if (sub_1002D0A8C())
  {
    if (sub_10063473C())
    {
      int v2 = sub_100488020();
      uint64_t v3 = (os_log_s *)qword_1008F7578;
      BOOL v4 = os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT);
      if (v2)
      {
        if (v4)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CountryCode: Location update triggered using RegulatoryDomain",  buf,  2u);
        }

        sub_100635F10(a1);
      }

      else
      {
        if (v4)
        {
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "RegulatoryDomain is not available -- setting country code to default",  v8,  2u);
        }

        sub_1006362A8(a1, @"XZ");
      }
    }

    else
    {
      id v6 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CountryCode: Location update triggered using Geo",  v7,  2u);
      }

      sub_1006365F0(a1);
    }
  }

  else
  {
    int v5 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = @"XZ";
  }

void sub_100635F10(uint64_t a1)
{
  int v2 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "PurpleLocation::startLocationUpdatesRD() -- using RegulatoryDomain for country code",  buf,  2u);
  }

  uint64_t v3 = sub_1002E6E9C();
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 3344LL))(v3);
  if ((_DWORD)v4)
  {
    id v18 = 0LL;
    id v5 = sub_100636CD0(v4, &v18);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = v18;
    uint64_t v8 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543618;
      __int128 v20 = v6;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CountryCode from RegulatoryDomain, Current Country: %{public}@, Last Known Country: %{public}@",  buf,  0x16u);
    }

    if (!v6)
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue( +[GEOCountryConfiguration sharedConfiguration]( &OBJC_CLASS___GEOCountryConfiguration,  "sharedConfiguration"));
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 countryCode]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v14));

      uint64_t v15 = (os_log_s *)qword_1008F7578;
      BOOL v16 = os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT);
      if (!v6)
      {
        if (v16)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Both RegulatoryDomain and GEOCountryConfiguration returned nil",  buf,  2u);
        }

        uint64_t v17 = (os_log_s *)qword_1008F7578;
        if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "RegulatoryDomain and GeoCountryConfiguration returned nil -- setting country code to default",  buf,  2u);
        }

        id v6 = 0LL;
        sub_1006362A8(a1, @"XZ");
        goto LABEL_25;
      }

      if (v16)
      {
        *(_DWORD *)__int128 buf = 138543362;
        __int128 v20 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Setting country code from GeoCountryConfiguration %{public}@",  buf,  0xCu);
      }
    }

    unsigned __int8 v9 = [*(id *)(a1 + 88) isEqualToString:v6];
    BOOL v10 = (os_log_s *)qword_1008F7578;
    BOOL v11 = os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT);
    if ((v9 & 1) != 0)
    {
      if (v11)
      {
        *(_DWORD *)__int128 buf = 138543362;
        __int128 v20 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CountryCode: update not needed -- same country code %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      if (v11)
      {
        *(_DWORD *)__int128 buf = 138543362;
        __int128 v20 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CountryCode changed -- new country code %{public}@",  buf,  0xCu);
      }

      sub_1006362A8(a1, v6);
    }

void sub_10063626C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006362A8(uint64_t a1, void *a2)
{
  id v4 = a2;
  unsigned __int8 v28 = 0;
  __int16 v27 = 0;
  unsigned __int8 v26 = 0;
  unsigned __int8 v25 = 1;
  uint64_t v5 = sub_1002E6E9C();
  if ((*(_DWORD *)(v5 + 708) - 23) > 0x7B8)
  {
    (*(void (**)(uint64_t, id, unsigned __int8 *, unsigned __int8 *, unsigned __int8 *))(*(void *)a1 + 8LL))( a1,  v4,  &v28,  &v26,  &v25);
    int v14 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543874;
      id v30 = v4;
      __int16 v31 = 1024;
      int v32 = v26;
      __int16 v33 = 1024;
      int v34 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PurpleLocation: Action - country: %{public}@,  LEFlag: %u, HDR Flag: %u",  buf,  0x18u);
    }

    uint64_t v15 = sub_1002E6E9C();
    (*(void (**)(uint64_t, uint64_t, void, void, __int16 *, void))(*(void *)v15 + 568LL))( v15,  1LL,  v28,  v26,  &v27,  0LL);
    (*(void (**)(uint64_t, id, void, void, void))(*(void *)a1 + 88LL))(a1, v4, v28, v26, v25);
  }

  else
  {
    v24[0] = 0;
    memset(&v24[1], 255, 7);
    sub_100635014(v5, v4, v24, &v26);
    uint64_t v6 = sub_1002E6E9C();
    uint64_t v7 = v24[0];
    int v8 = v26;
    int v9 = v24[1];
    int v10 = v24[2];
    int v11 = v24[4];
    (*(void (**)(uint64_t, uint64_t, void, void, void, void, void, __int16 *, void))(*(void *)v6 + 576LL))( v6,  1LL,  v24[0],  v26,  v24[1],  v24[2],  v24[4],  &v27,  0LL);
    sub_1006370A8((os_unfair_lock_s *)a1, v4, v7, v8 != 0, v9, v10, v11);
    uint64_t v12 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138544642;
      id v30 = v4;
      __int16 v31 = 1024;
      int v32 = v7;
      __int16 v33 = 1024;
      int v34 = v8;
      __int16 v35 = 1024;
      int v36 = v9;
      __int16 v37 = 1024;
      int v38 = v10;
      __int16 v39 = 1024;
      int v40 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "PurpleLocation: Notify HRB Listeners - country: %{public}@, ISM 2.4 CC: %u, LEFlag: %u, UNII-1 CC: %u, UNII-3 CC : %u, UNII-5 CC: %u",  buf,  0x2Au);
    }

    (*(void (**)(uint64_t, id, uint64_t, BOOL, uint64_t))(*(void *)a1 + 88LL))(a1, v4, v7, v8 != 0, 1LL);
    int v13 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138544130;
      id v30 = v4;
      __int16 v31 = 1024;
      int v32 = v7;
      __int16 v33 = 1024;
      int v34 = v8;
      __int16 v35 = 1024;
      int v36 = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PurpleLocation: Notify Legacy Listeners - country: %{public}@, ISM 2.4 CC: %u, LEFlag: %u, HDR Flag: %u",  buf,  0x1Eu);
    }
  }

  objc_storeStrong((id *)(a1 + 88), a2);
  BOOL v16 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEBUG)) {
    sub_10069FF58(v16, v17, v18, v19, v20, v21, v22, v23);
  }
}

void sub_1006365D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006365F0(uint64_t a1)
{
  int v2 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "PurpleLocation::startLocationUpdates() -- using Geo for country code",  buf,  2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1006368E8;
  block[3] = &unk_10087EB20;
  block[4] = a1;
  if (qword_1008F1F30 != -1) {
    dispatch_once(&qword_1008F1F30, block);
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/MobileWiFi.framework"));
  unsigned int v4 = +[CLLocationManager authorizationStatusForBundle:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundle:",  v3);

  if (v4 - 3 < 2 || (uint64_t v5 = sub_1002E6E9C(), (*(unsigned int (**)(uint64_t))(*(void *)v5 + 3344LL))(v5)))
  {
    uint64_t v6 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEBUG)) {
      sub_10069FF88(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[GEOCountryConfiguration sharedConfiguration]( &OBJC_CLASS___GEOCountryConfiguration,  "sharedConfiguration"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100636AB4;
    v16[3] = &unk_1008A4858;
    void v16[4] = a1;
    [v14 updateCountryConfiguration:v16];
  }

  else if (([*(id *)(a1 + 88) isEqualToString:@"XZ"] & 1) == 0)
  {
    uint64_t v15 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "CountryCode: Location Services disabled!",  buf,  2u);
    }

    sub_1006362A8(a1, @"XZ");
  }

void sub_1006367E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006367F4(uint64_t a1, unsigned int a2)
{
  unsigned int v4 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "CountryCode: Location refresh timer expiry",  buf,  2u);
  }

  sub_1006365F0(a1);
  dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL * a2);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  _DWORD v7[2] = sub_1006368D8;
  v7[3] = &unk_10087EB68;
  v7[4] = a1;
  unsigned int v8 = a2;
  dispatch_after(v5, global_queue, v7);
}

uint64_t sub_1006368D8(uint64_t a1)
{
  return sub_1006367F4(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void sub_1006368E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v10 = 3599;
  uint64_t v2 = sub_1002E6E00();
  sub_10002418C(buf, "LOCATION");
  sub_10002418C(__p, "RefreshTime");
  (*(void (**)(uint64_t, uint8_t *, void **, unsigned int *))(*(void *)v2 + 128LL))(v2, buf, __p, &v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(*(void **)buf);
  }
  uint64_t v3 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CountryCode: Location refresh time set to %u",  buf,  8u);
  }

  dispatch_time_t v4 = dispatch_time(0LL, 1000000000LL * v10);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100636AA4;
  v6[3] = &unk_10087EB68;
  v6[4] = v1;
  unsigned int v7 = v10;
  dispatch_after(v4, global_queue, v6);
}

void sub_100636A68( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100636AA4(uint64_t a1)
{
}

void sub_100636AB4(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_time_t v4 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "CountryCode: Callback from GEO..country code available?%d",  (uint8_t *)v5,  8u);
  }

  sub_100636B68(v3);
}

void sub_100636B68(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[GEOCountryConfiguration sharedConfiguration]( &OBJC_CLASS___GEOCountryConfiguration,  "sharedConfiguration"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 countryCode]);
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v3));

  dispatch_time_t v5 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CountryCode: Callback from GEO, Country: %{public}@",  buf,  0xCu);
  }

  if (v4 && ([*(id *)(a1 + 88) isEqualToString:v4] & 1) == 0)
  {
    sub_1006362A8(a1, v4);
  }

  else
  {
    uint64_t v6 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEBUG)) {
      sub_10069FFB8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void sub_100636CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100636CD0(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[RDEstimate currentEstimates](&OBJC_CLASS___RDEstimate, "currentEstimates"));
  if (![v3 count])
  {
    uint64_t v7 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "RegulatoryDomain current estimates not available",  (uint8_t *)&v15,  2u);
    }

    dispatch_time_t v5 = 0LL;
    goto LABEL_10;
  }

  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:0]);
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 countryCode]);
  uint64_t v6 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 1024;
    unsigned int v18 = [v5 length];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "RegulatoryDomain current estimates -- countryCode = %@ countryCode length = %d",  (uint8_t *)&v15,  0x12u);
  }

  if (!v5 || [v5 length] != (id)2)
  {
LABEL_10:

    dispatch_time_t v5 = 0LL;
  }

  *a2 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[RDEstimate lastKnownEstimates](&OBJC_CLASS___RDEstimate, "lastKnownEstimates"));
  if ([v8 count])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:0]);
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 countryCode]);
    uint64_t v11 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [v10 length];
      int v15 = 138412546;
      id v16 = v10;
      __int16 v17 = 1024;
      unsigned int v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "RegulatoryDomain last-known estimates -- countryCode = %@ countryCode length = %d",  (uint8_t *)&v15,  0x12u);
    }

    if (v10 && [v10 length] == (id)2)
    {
      id v10 = v10;
      *a2 = v10;
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "RegulatoryDomain last-known estimates not available",  (uint8_t *)&v15,  2u);
    }

    id v10 = 0LL;
  }

  return v5;
}

void sub_100636F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100636FD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PurpleLocation::simulateLocationUpdate: country = %@",  (uint8_t *)&v5,  0xCu);
  }

  sub_1006362A8(a1, v3);
}

void sub_100637090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006370A8(os_unfair_lock_s *a1, void *a2, char a3, char a4, char a5, char a6, char a7)
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  _DWORD v14[2] = sub_100637684;
  v14[3] = &unk_1008A48A8;
  id v15 = a2;
  char v16 = a3;
  char v17 = a4;
  char v18 = a5;
  char v19 = a6;
  char v20 = a7;
  id v13 = v15;
  sub_1006375C8(a1 + 14, v14);
}

void sub_10063715C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100637174(uint64_t a1, uint64_t a2, int a3)
{
  int v5 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 88);
    int v11 = 138543362;
    uint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Gaze: Current country code: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  if (([*(id *)(a1 + 88) isEqualToString:@"CA"] & 1) != 0
    || ([*(id *)(a1 + 88) isEqualToString:@"US"] & 1) != 0
    || a3)
  {
    uint64_t v8 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting Gaze State to controller: On head",  (uint8_t *)&v11,  2u);
    }
  }

  else
  {
    uint64_t v7 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting Gaze State to controller: On body",  (uint8_t *)&v11,  2u);
    }
  }

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)sub_1002E6E9C() + 88LL);
  return v9();
}

uint64_t sub_1006372F8(uint64_t a1, uint64_t a2, int a3)
{
  return sub_100637174(a1 - 16, 0LL, a3);
}

void sub_100637304(uint64_t a1, uint64_t a2)
{
}

void sub_10063730C(uint64_t a1, uint64_t a2)
{
}

void sub_100637314(uint64_t a1, uint64_t a2)
{
  int v5 = *(char **)(a1 + 8);
  dispatch_time_t v4 = *(char **)(a1 + 16);
  if (v5 != v4)
  {
    while (*(void *)v5 != a2)
    {
      v5 += 8;
      if (v5 == v4)
      {
        int v5 = *(char **)(a1 + 16);
        break;
      }
    }
  }

  if (v5 == v4)
  {
    uint64_t v6 = a2;
    sub_100637A88(a1 + 8, v4, (char *)&v6);
    sub_100008A30(a1 + 8);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)a1);
}

void sub_10063739C(uint64_t a1, uint64_t a2)
{
}

void sub_1006373A4(uint64_t a1, uint64_t a2)
{
}

void sub_1006373AC(uint64_t a1, uint64_t a2)
{
  int v5 = *(char **)(a1 + 8);
  dispatch_time_t v4 = *(char **)(a1 + 16);
  if (v5 != v4)
  {
    while (*(void *)v5 != a2)
    {
      v5 += 8;
      if (v5 == v4)
      {
        int v5 = *(char **)(a1 + 16);
        break;
      }
    }
  }

  if (v5 == v4)
  {
    uint64_t v6 = a2;
    sub_100637CC4(a1 + 8, v4, (char *)&v6);
    sub_100008A30(a1 + 8);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)a1);
}

void sub_100637434(os_unfair_lock_s *a1, void *a2, char a3, char a4, char a5)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1006375A4;
  v10[3] = &unk_1008A4880;
  id v11 = a2;
  char v12 = a3;
  char v13 = a4;
  char v14 = a5;
  id v9 = v11;
  sub_1006374E8(a1 + 6, v10);
}

void sub_1006374D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1006374E8(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock(a1);
  int v5 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  sub_100240540(&v5, (uint64_t)&a1[2]);
  os_unfair_lock_unlock(a1);
  dispatch_time_t v4 = v5;
  if (v5 != v6)
  {
    do
      v3[2](v3, *v4++);
    while (v4 != v6);
    dispatch_time_t v4 = v5;
  }

  if (v4)
  {
    uint64_t v6 = v4;
    operator delete(v4);
  }
}

void sub_10063757C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1006375A4(uint64_t a1, uint64_t (***a2)(void, void, void, void, void))
{
  return (**a2)( a2,  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40),  *(unsigned __int8 *)(a1 + 41),  *(unsigned __int8 *)(a1 + 42));
}

void sub_1006375C8(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock(a1);
  int v5 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  sub_100240540(&v5, (uint64_t)&a1[2]);
  os_unfair_lock_unlock(a1);
  dispatch_time_t v4 = v5;
  if (v5 != v6)
  {
    do
      v3[2](v3, *v4++);
    while (v4 != v6);
    dispatch_time_t v4 = v5;
  }

  if (v4)
  {
    uint64_t v6 = v4;
    operator delete(v4);
  }
}

void sub_10063765C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100637684( uint64_t a1, uint64_t (***a2)(void, void, void, void, void, void, void))
{
  return (**a2)( a2,  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40),  *(unsigned __int8 *)(a1 + 41),  *(unsigned __int8 *)(a1 + 42),  *(unsigned __int8 *)(a1 + 43),  *(unsigned __int8 *)(a1 + 44));
}

uint64_t sub_1006376B0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24LL))(a1);
}

uint64_t sub_1006376BC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 24LL))(a1 - 8);
}

void sub_1006376E0(uint64_t a1, uint64_t a2)
{
  dispatch_time_t v4 = *(char **)(a1 + 8);
  int v5 = *(char **)(a1 + 16);
  if (v4 == v5)
  {
    uint64_t v6 = *(char **)(a1 + 8);
    goto LABEL_10;
  }

  uint64_t v6 = *(char **)(a1 + 8);
  while (*(void *)v6 != a2)
  {
    v6 += 8;
    if (v6 == v5)
    {
      uint64_t v6 = *(char **)(a1 + 16);
      break;
    }
  }

  if (v6 == v5)
  {
    if (v4 != v5)
    {
LABEL_11:
      uint64_t v7 = a2;
      sub_100637794(a1 + 8, v6, (char *)&v7);
      sub_100008A30(a1 + 8);
      goto LABEL_12;
    }

char *sub_100637794(uint64_t a1, char *__src, char *a3)
{
  id v3 = a3;
  dispatch_time_t v4 = __src;
  uint64_t v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    char v13 = *(char **)a1;
    unint64_t v14 = ((uint64_t)&v6[-*(void *)a1] >> 3) + 1;
    if (v14 >> 61) {
      abort();
    }
    uint64_t v15 = __src - v13;
    uint64_t v16 = (__src - v13) >> 3;
    uint64_t v17 = v7 - (void)v13;
    if (v17 >> 2 > v14) {
      unint64_t v14 = v17 >> 2;
    }
    else {
      unint64_t v18 = v14;
    }
    uint64_t v30 = a1 + 16;
    if (v18) {
      char v19 = (char *)sub_100008BA0(a1 + 16, v18);
    }
    else {
      char v19 = 0LL;
    }
    char v20 = &v19[8 * v16];
    std::string __p = v19;
    __int16 v27 = v20;
    unsigned __int8 v28 = v20;
    __int128 v29 = &v19[8 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4) {
          unint64_t v22 = 1LL;
        }
        else {
          unint64_t v22 = v15 >> 2;
        }
        uint64_t v23 = (char *)sub_100008BA0(v8, v22);
        char v20 = &v23[8 * (v22 >> 2)];
        std::string __p = v23;
        __int16 v27 = v20;
        __int128 v29 = &v23[8 * v24];
        if (v19) {
          operator delete(v19);
        }
      }

      else
      {
        unint64_t v21 = v16 + 2;
        if (v16 >= -1) {
          unint64_t v21 = v16 + 1;
        }
        v20 -= 8 * (v21 >> 1);
        __int16 v27 = v20;
      }
    }

    *(void *)char v20 = *(void *)v3;
    unsigned __int8 v28 = v20 + 8;
    dispatch_time_t v4 = sub_100008ADC((void **)a1, (uint64_t)&__p, v4);
    if (v28 != v27) {
      v28 += (v27 - v28 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    }
    if (__p) {
      operator delete(__p);
    }
  }

  else if (__src == v6)
  {
    *(void *)__src = *(void *)a3;
    *(void *)(a1 + 8) = __src + 8;
  }

  else
  {
    id v9 = __src + 8;
    id v10 = v6 - 8;
    id v11 = *(void **)(a1 + 8);
    while (v10 < v6)
    {
      uint64_t v12 = *(void *)v10;
      v10 += 8;
      *v11++ = v12;
    }

    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(&v6[-8 * ((v6 - v9) >> 3)], __src, v6 - v9);
    }
    if (v4 <= v3) {
      v3 += 8 * (*(void *)(a1 + 8) > (unint64_t)v3);
    }
    *(void *)dispatch_time_t v4 = *(void *)v3;
  }

  return v4;
}

void sub_100637998( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1006379D0(id a1)
{
  uint64_t v1 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "Received RegulatoryDomain country code update notification",  v3,  2u);
  }

  uint64_t v2 = sub_1002E90E4();
  (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
}

void sub_100637A44(id a1)
{
  uint64_t v1 = operator new(0x230uLL);
  sub_10042BC28();
  off_1008D60A8 = v1;
}

void sub_100637A74(_Unwind_Exception *a1)
{
}

char *sub_100637A88(uint64_t a1, char *__src, char *a3)
{
  id v3 = a3;
  dispatch_time_t v4 = __src;
  uint64_t v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    char v13 = *(char **)a1;
    unint64_t v14 = ((uint64_t)&v6[-*(void *)a1] >> 3) + 1;
    if (v14 >> 61) {
      abort();
    }
    uint64_t v15 = __src - v13;
    uint64_t v16 = (__src - v13) >> 3;
    uint64_t v17 = v7 - (void)v13;
    if (v17 >> 2 > v14) {
      unint64_t v14 = v17 >> 2;
    }
    else {
      unint64_t v18 = v14;
    }
    uint64_t v30 = a1 + 16;
    if (v18) {
      char v19 = (char *)sub_100008BA0(a1 + 16, v18);
    }
    else {
      char v19 = 0LL;
    }
    char v20 = &v19[8 * v16];
    std::string __p = v19;
    __int16 v27 = v20;
    unsigned __int8 v28 = v20;
    __int128 v29 = &v19[8 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4) {
          unint64_t v22 = 1LL;
        }
        else {
          unint64_t v22 = v15 >> 2;
        }
        uint64_t v23 = (char *)sub_100008BA0(v8, v22);
        char v20 = &v23[8 * (v22 >> 2)];
        std::string __p = v23;
        __int16 v27 = v20;
        __int128 v29 = &v23[8 * v24];
        if (v19) {
          operator delete(v19);
        }
      }

      else
      {
        unint64_t v21 = v16 + 2;
        if (v16 >= -1) {
          unint64_t v21 = v16 + 1;
        }
        v20 -= 8 * (v21 >> 1);
        __int16 v27 = v20;
      }
    }

    *(void *)char v20 = *(void *)v3;
    unsigned __int8 v28 = v20 + 8;
    dispatch_time_t v4 = sub_100008ADC((void **)a1, (uint64_t)&__p, v4);
    if (v28 != v27) {
      v28 += (v27 - v28 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    }
    if (__p) {
      operator delete(__p);
    }
  }

  else if (__src == v6)
  {
    *(void *)__src = *(void *)a3;
    *(void *)(a1 + 8) = __src + 8;
  }

  else
  {
    id v9 = __src + 8;
    id v10 = v6 - 8;
    id v11 = *(void **)(a1 + 8);
    while (v10 < v6)
    {
      uint64_t v12 = *(void *)v10;
      v10 += 8;
      *v11++ = v12;
    }

    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(&v6[-8 * ((v6 - v9) >> 3)], __src, v6 - v9);
    }
    if (v4 <= v3) {
      v3 += 8 * (*(void *)(a1 + 8) > (unint64_t)v3);
    }
    *(void *)dispatch_time_t v4 = *(void *)v3;
  }

  return v4;
}

void sub_100637C8C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100637CC4(uint64_t a1, char *__src, char *a3)
{
  id v3 = a3;
  dispatch_time_t v4 = __src;
  uint64_t v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    char v13 = *(char **)a1;
    unint64_t v14 = ((uint64_t)&v6[-*(void *)a1] >> 3) + 1;
    if (v14 >> 61) {
      abort();
    }
    uint64_t v15 = __src - v13;
    uint64_t v16 = (__src - v13) >> 3;
    uint64_t v17 = v7 - (void)v13;
    if (v17 >> 2 > v14) {
      unint64_t v14 = v17 >> 2;
    }
    else {
      unint64_t v18 = v14;
    }
    uint64_t v30 = a1 + 16;
    if (v18) {
      char v19 = (char *)sub_100008BA0(a1 + 16, v18);
    }
    else {
      char v19 = 0LL;
    }
    char v20 = &v19[8 * v16];
    std::string __p = v19;
    __int16 v27 = v20;
    unsigned __int8 v28 = v20;
    __int128 v29 = &v19[8 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4) {
          unint64_t v22 = 1LL;
        }
        else {
          unint64_t v22 = v15 >> 2;
        }
        uint64_t v23 = (char *)sub_100008BA0(v8, v22);
        char v20 = &v23[8 * (v22 >> 2)];
        std::string __p = v23;
        __int16 v27 = v20;
        __int128 v29 = &v23[8 * v24];
        if (v19) {
          operator delete(v19);
        }
      }

      else
      {
        unint64_t v21 = v16 + 2;
        if (v16 >= -1) {
          unint64_t v21 = v16 + 1;
        }
        v20 -= 8 * (v21 >> 1);
        __int16 v27 = v20;
      }
    }

    *(void *)char v20 = *(void *)v3;
    unsigned __int8 v28 = v20 + 8;
    dispatch_time_t v4 = sub_100008ADC((void **)a1, (uint64_t)&__p, v4);
    if (v28 != v27) {
      v28 += (v27 - v28 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    }
    if (__p) {
      operator delete(__p);
    }
  }

  else if (__src == v6)
  {
    *(void *)__src = *(void *)a3;
    *(void *)(a1 + 8) = __src + 8;
  }

  else
  {
    id v9 = __src + 8;
    id v10 = v6 - 8;
    id v11 = *(void **)(a1 + 8);
    while (v10 < v6)
    {
      uint64_t v12 = *(void *)v10;
      v10 += 8;
      *v11++ = v12;
    }

    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(&v6[-8 * ((v6 - v9) >> 3)], __src, v6 - v9);
    }
    if (v4 <= v3) {
      v3 += 8 * (*(void *)(a1 + 8) > (unint64_t)v3);
    }
    *(void *)dispatch_time_t v4 = *(void *)v3;
  }

  return v4;
}

void sub_100637EC8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100637FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100638030( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___UserNotification;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_1006382C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100638370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006383F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)&OBJC_CLASS___UninstallObserver;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100638478( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100638564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100638658(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___BTAppInteraction);
  uint64_t v2 = (void *)qword_1008F1F38;
  qword_1008F1F38 = (uint64_t)v1;
}

void sub_100638818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100638828(id a1, NSDictionary *a2)
{
  id v3 = a2;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[BTAppInteraction instance](&OBJC_CLASS___BTAppInteraction, "instance"));
  [v2 applicationStateChanged:v3];
}

void sub_100638874( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100638928(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)]);
  if (!v2)
  {
    unsigned int v3 = [*(id *)(*(void *)(a1 + 32) + 48) applicationStateForApplication:*(void *)(a1 + 40)];
    uint64_t v4 = v3 != 0;
    int v5 = *(void **)(a1 + 40);
    if (v5 && !v3)
    {
      else {
        uint64_t v4 = 0LL;
      }
    }

    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[AppInfo appInfoWithPID:isApp:]( &OBJC_CLASS___AppInfo,  "appInfoWithPID:isApp:",  *(unsigned int *)(a1 + 48),  v4));
    uint64_t v6 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      unsigned int v8 = [v2 isAlive];
      id v9 = "";
      if ((_DWORD)v4) {
        id v9 = " This is an application.";
      }
      *(_DWORD *)__int128 buf = 138412802;
      uint64_t v18 = v7;
      __int16 v19 = 2080;
      char v20 = v9;
      if (v8) {
        id v10 = "true";
      }
      else {
        id v10 = "false";
      }
      __int16 v21 = 2080;
      unint64_t v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Registered application - %@%s, isAlive: %s",  buf,  0x20u);
    }

    if (v2 && *(void *)(a1 + 40)) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setObject:forKey:", v2);
    }
    if ((_DWORD)v4)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 48) interestedBundleIDs]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v11));

      if (*(void *)(a1 + 40)) {
        objc_msgSend(v12, "addObject:");
      }
      [*(id *)(*(void *)(a1 + 32) + 48) updateInterestedBundleIDs:v12 states:15];
      char v13 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 48) bundleInfoValueForKey:@"UIBackgroundModes" PID:*(unsigned int *)(a1 + 48)]);
      if (v13)
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_100638C28;
          v15[3] = &unk_1008A49F8;
          id v16 = v2;
          [v13 enumerateObjectsUsingBlock:v15];
        }
      }
    }
  }
}

void sub_100638BC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100638C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(@"bluetooth-central", "isEqualToString:"))
  {
    [*(id *)(a1 + 32) setSupportsBackgroundedCentrals:1];
  }

  else if ([@"bluetooth-peripheral" isEqualToString:v3])
  {
    [*(id *)(a1 + 32) setSupportsBackgroundedPeripherals:1];
  }
}

void sub_100638C9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100638D2C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2)
  {
    if ([v2 isApp])
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 48) interestedBundleIDs]);
      int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v4));

      [v5 removeObject:*(void *)(a1 + 40)];
      uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 48LL);
      if ([v5 count]) {
        uint64_t v7 = 15LL;
      }
      else {
        uint64_t v7 = 0LL;
      }
      [v6 updateInterestedBundleIDs:v5 states:v7];
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)]);
      if (v8)
      {
        id v9 = (os_log_s *)qword_1008F7578;
        if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [*(id *)(a1 + 40) UTF8String];
          int v20 = 136446210;
          id v21 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Removing outstanding process assertion for unregistered application %{public}s",  (uint8_t *)&v20,  0xCu);
        }

        [v8 invalidate];
        [*(id *)(*(void *)(a1 + 32) + 88) removeObjectForKey:*(void *)(a1 + 40)];
      }

      uint64_t v11 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:*(void *)(a1 + 40)]);

      uint64_t v12 = (void *)v11;
      if (v11)
      {
        char v13 = (os_log_s *)qword_1008F7578;
        if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [*(id *)(a1 + 40) UTF8String];
          int v20 = 136446210;
          id v21 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Removing (URGENT) outstanding process assertion for unregistered application %{public}s",  (uint8_t *)&v20,  0xCu);
        }

        [v12 invalidate];
        [*(id *)(*(void *)(a1 + 32) + 96) removeObjectForKey:*(void *)(a1 + 40)];
      }
    }

    uint64_t v15 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *(void **)(a1 + 40);
      int v20 = 138412290;
      id v21 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Unregistered application - %@",  (uint8_t *)&v20,  0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 112) removeObjectForKey:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v17 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_FAULT))
    {
      __int16 v19 = *(void **)(a1 + 40);
      int v20 = 138543362;
      id v21 = v19;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "Application %{public}@ wasn't registered!",  (uint8_t *)&v20,  0xCu);
      uint64_t v17 = (os_log_s *)qword_1008F7578;
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void **)(a1 + 40);
      int v20 = 138543362;
      id v21 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Cannot unregister application %{public}@ - info is empty",  (uint8_t *)&v20,  0xCu);
    }
  }
}

void sub_100639044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063913C(void *a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 40) objectForKey:a1[5]]);
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [v2 pid];
}

void sub_100639188( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10063922C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100639310(id *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*((id *)a1[4] + 5) objectForKey:a1[5]]);
  id v3 = v2;
  if (v2)
  {
    if ([v2 isApp])
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      if ([a1[6] count]) {
        [v4 setObject:a1[6] forKey:@"UIApplicationLaunchOptionsBluetoothCentralsKey"];
      }
      if ([a1[7] count]) {
        [v4 setObject:a1[7] forKey:@"UIApplicationLaunchOptionsBluetoothPeripheralsKey"];
      }
      v20[0] = BKSOpenApplicationOptionKeyActivateSuspended;
      v20[1] = BKSOpenApplicationOptionKeyPayloadOptions;
      v21[0] = &__kCFBooleanTrue;
      v21[1] = v4;
      int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
      uint64_t v6 = (os_log_s *)qword_1008F7680;
      if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v7 = [v3 isAlive];
        id v8 = a1[5];
        unsigned int v9 = [v3 pid];
        id v10 = "false";
        *(_DWORD *)uint64_t v15 = 136315650;
        if (v7) {
          id v10 = "true";
        }
        *(void *)&void v15[4] = v10;
        __int16 v16 = 2112;
        id v17 = v8;
        __int16 v18 = 1024;
        unsigned int v19 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "launchApplication:{isAlive: %s, bundleId: %@, pid: %d}",  v15,  0x1Cu);
      }

      if (objc_msgSend(v3, "pid", *(void *)v15) && (objc_msgSend(v3, "isAlive") & 1) != 0)
      {
        uint64_t v11 = (os_log_s *)qword_1008F7680;
        if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = a1[5];
          *(_DWORD *)uint64_t v15 = 138543362;
          *(void *)&void v15[4] = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Application pending termination, delaying resurrection - %{public}@",  v15,  0xCu);
        }

        [*((id *)a1[4] + 14) setObject:v5 forKey:a1[5]];
      }

      else
      {
        [a1[4] openBundle:a1[5] options:v5];
      }
    }

    else
    {
      char v13 = (os_log_s *)qword_1008F7680;
      if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = a1[5];
        *(_DWORD *)uint64_t v15 = 138543362;
        *(void *)&void v15[4] = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Application %{public}@ is a daemon (not supported).",  v15,  0xCu);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
  {
    sub_1006A006C((uint64_t)[a1[5] UTF8String], (uint64_t)v15);
  }
}

void sub_1006395F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100639864( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1006398B8(uint64_t a1)
{
  if (qword_1008D67C8 != -1) {
    dispatch_once(&qword_1008D67C8, &stru_1008A4DA0);
  }
  sub_10028C298((uint64_t)off_1008D67C0, *(void **)(a1 + 32));
}

void sub_100639908(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unsigned int v7 = (os_log_s *)qword_1008F7680;
    if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_ERROR)) {
      sub_1006A01A8(a1, (uint64_t)v6, v7);
    }
    unsigned int v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = *(dispatch_queue_s **)(v8 + 16);
    v20[0] = _NSConcreteStackBlock;
    void v20[2] = sub_100639B60;
    v20[3] = &unk_1008A4A20;
    dispatch_time_t v11 = *(void *)(a1 + 56);
    v20[1] = 3221225472LL;
    v20[4] = v8;
    id v21 = v9;
    id v22 = *(id *)(a1 + 48);
    int v23 = *(_DWORD *)(a1 + 64);
    dispatch_after(v11, v10, v20);
  }

  else
  {
    unsigned int v12 = [v5 isValid];
    char v13 = (os_log_s *)qword_1008F7680;
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)__int128 buf = 138543618;
        uint64_t v25 = v14;
        __int16 v26 = 1026;
        unsigned int v27 = [v5 pid];
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Resurrected: %{public}@, pid: %{public}u",  buf,  0x12u);
      }

      uint64_t v15 = (uint64_t *)(a1 + 32);
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:*(void *)(a1 + 32)]);
      if (v16)
      {
        objc_msgSend(v16, "setPid:", objc_msgSend(v5, "pid"));
        [*(id *)(a1 + 40) takeAssertionForProcess:*(void *)(a1 + 32) duration:10 isUrgent:0];
      }

      else
      {
        __int16 v18 = (os_log_s *)qword_1008F7680;
        if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_ERROR)) {
          sub_1006A00D0(v15, v18, v19);
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_ERROR))
    {
      sub_1006A013C(a1, v13, v17);
    }
  }
}

void sub_100639B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100639B60(uint64_t a1)
{
  return [*(id *)(a1 + 32) openBundle:*(void *)(a1 + 40) options:*(void *)(a1 + 48) attempt:(*(_DWORD *)(a1 + 56) + 1)];
}

void sub_100639BF4(uint64_t a1)
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v2)
  {
    uint64_t v4 = *(void *)v18;
    *(void *)&__int128 v3 = 138543362LL;
    __int128 v14 = v3;
    do
    {
      for (uint64_t i = 0LL; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationIdentifier", v14));
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 40) objectForKey:v7]);
        unsigned int v9 = (os_log_s *)qword_1008F7680;
        if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 40LL);
          *(_DWORD *)__int128 buf = 138543874;
          id v22 = v7;
          __int16 v23 = 2112;
          uint64_t v24 = v8;
          __int16 v25 = 2112;
          uint64_t v26 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ %@", buf, 0x20u);
        }

        dispatch_time_t v11 = (os_log_s *)qword_1008F7680;
        BOOL v12 = os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_DEFAULT);
        if (v8)
        {
          if (v12)
          {
            *(_DWORD *)__int128 buf = v14;
            id v22 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Application %{public}@ has been uninstalled!",  buf,  0xCu);
          }

          uint64_t v13 = *(void *)(a1 + 40);
          if (*(void *)(v13 + 8))
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100639EA4;
            block[3] = &unk_10087FB90;
            block[4] = v13;
            void block[5] = v6;
            dispatch_async(&_dispatch_main_q, block);
          }
        }

        else if (v12)
        {
          *(_DWORD *)__int128 buf = v14;
          id v22 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Unable To Uninstall %{public}@, AppInfo Not Found",  buf,  0xCu);
        }
      }

      id v2 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
    }

    while (v2);
  }
}

void sub_100639E70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_100639EA4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) applicationIdentifier]);
  sub_10002418C(__p, (char *)[v2 UTF8String]);
  (*(void (**)(uint64_t, void **, uint64_t))(*(void *)v1 + 16LL))(v1, __p, 2LL);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
}

void sub_100639F18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id sub_100639FC8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) applicationInfoForPID:*(unsigned int *)(a1 + 40) completion:&stru_1008A4A68];
}

void sub_100639FE4(id a1, NSDictionary *a2)
{
  __int128 v3 = a2;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[BTAppInteraction instance](&OBJC_CLASS___BTAppInteraction, "instance"));
  [v2 applicationStateChanged:v3];
}

void sub_10063A030( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10063A0CC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)]);
  __int128 v3 = v2;
  if (v2)
  {
    [v2 setIsApp:1];
    [v3 setSupportsBackgroundedCentrals:1];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
  {
    sub_1006A006C((uint64_t)[*(id *)(a1 + 40) UTF8String], (uint64_t)&v4);
  }
}

void sub_10063A190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063A228(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)]);
  __int128 v3 = v2;
  if (v2)
  {
    [v2 setIsApp:1];
    [v3 setSupportsBackgroundedPeripherals:1];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
  {
    sub_1006A006C((uint64_t)[*(id *)(a1 + 40) UTF8String], (uint64_t)&v4);
  }
}

void sub_10063A2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063A3BC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)]);
  __int128 v3 = v2;
  if (v2)
  {
    if ([v2 isApp])
    {
      if ([v3 isAlive])
      {
        if ([v3 state] == 1) {
          unsigned __int8 v4 = objc_msgSend( *(id *)(a1 + 32),  "translateApplicationState:",  objc_msgSend( *(id *)(*(void *)(a1 + 32) + 48),  "applicationStateForApplication:",  *(void *)(a1 + 40)));
        }
        else {
          unsigned __int8 v4 = [v3 state];
        }
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v4;
        goto LABEL_13;
      }

      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
      char v6 = 2;
    }

    else
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
      char v6 = 32;
    }

    *(_BYTE *)(v5 + 24) = v6;
    goto LABEL_13;
  }

  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
    sub_1006A006C((uint64_t)[*(id *)(a1 + 40) UTF8String], (uint64_t)&v7);
  }
LABEL_13:
}

void sub_10063A4E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063A57C(uint64_t a1)
{
  uint64_t v2 = BKSApplicationStateKey;
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:BKSApplicationStateKey]);
  unsigned int v55 = [v3 intValue];

  id v57 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:BKSApplicationStateDisplayIDKey]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:BKSApplicationStateProcessIDKey]);
  LODWORD(v52) = [v4 intValue];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:BKSApplicationStateExtensionKey]);
  unsigned int v54 = [v5 BOOLValue];

  int v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:v57]);
  if (!v56)
  {
    if (!v57) {
      goto LABEL_108;
    }
    uint64_t v18 = qword_1008F7680;
    if (!os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_108;
    }
    int v19 = [*(id *)(a1 + 40) translateApplicationState:v55];
    if (v19 <= 7)
    {
      if (v19 == 2)
      {
        __int128 v20 = "terminated";
        goto LABEL_73;
      }

      if (v19 == 4)
      {
        __int128 v20 = "suspended";
        goto LABEL_73;
      }
    }

    else
    {
      switch(v19)
      {
        case 8:
          __int128 v20 = "background-running";
          goto LABEL_73;
        case 16:
          __int128 v20 = "foreground-running";
          goto LABEL_73;
        case 32:
          __int128 v20 = "daemon";
LABEL_73:
          id v43 = "";
          *(_DWORD *)__int128 buf = 138413058;
          id v69 = v57;
          __int16 v70 = 1024;
          if (v54) {
            id v43 = " (Is an extension)";
          }
          *(_DWORD *)unint64_t v71 = v52;
          *(_WORD *)&v71[4] = 2080;
          *(void *)&v71[6] = v20;
          __int16 v72 = 2080;
          v73 = v43;
          __int128 v29 = "%@ [%d] is not in the application map. State: %s%s";
          uint64_t v30 = (os_log_s *)v18;
          uint32_t v31 = 38;
          goto LABEL_76;
      }
    }

    __int128 v20 = "unknown";
    goto LABEL_73;
  }

  HIDWORD(v52) = [*(id *)(a1 + 40) translateApplicationState:v55];
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v2]);
  unsigned int v8 = [v7 intValue];

  if (v8 == 4)
  {
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:BKSApplicationStateRunningReasonsKey]);
    id v10 = [v9 countByEnumeratingWithState:&v64 objects:buf count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v65;
      uint64_t v12 = BKSApplicationStateRunningReasonAssertionReasonKey;
      while (2)
      {
        for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v65 != v11) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v64 + 1) + 8 * (void)i),  "objectForKeyedSubscript:",  v12,  v52));
          unsigned int v15 = [v14 unsignedIntValue];

          if (v15 == 16 || v15 == 50004)
          {
            int v17 = 1;
            goto LABEL_25;
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v64 objects:buf count:16];
        int v17 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }

    else
    {
      int v17 = 0;
    }

void sub_10063AFCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10063B098(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  sub_10002418C(__p, (char *)[*(id *)(a1 + 40) UTF8String]);
  (*(void (**)(uint64_t, void **, void))(*(void *)v2 + 16LL))(v2, __p, *(unsigned __int8 *)(a1 + 48));
  if (v4 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10063B100( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10063B11C(uint64_t a1)
{
  uint64_t v2 = *(void (****)(void, void **, void))(*(void *)(a1 + 32) + 8LL);
  sub_10002418C(__p, (char *)[*(id *)(a1 + 40) UTF8String]);
  (**v2)(v2, __p, *(unsigned __int8 *)(a1 + 48));
  if (v4 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10063B184( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10063B260(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  if ([v3 isApp])
  {
    if (*(_BYTE *)(a1 + 56)) {
      unsigned __int8 v2 = [v3 supportsBackgroundedCentrals];
    }
    else {
      unsigned __int8 v2 = [v3 supportsBackgroundedPeripherals];
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v2;
  }
}

void sub_10063B2CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10063B374(uint64_t a1)
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  if ([v2 isApp])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)]);
    if (v3)
    {
      char v4 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 48);
        id v6 = [*(id *)(a1 + 40) UTF8String];
        int v11 = 134218242;
        uint64_t v12 = v5;
        __int16 v13 = 2082;
        id v14 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Attempting to add %lu seconds to process assertion for application %{public}s",  (uint8_t *)&v11,  0x16u);
      }

      objc_msgSend(v3, "setSecondsLeft:", (char *)objc_msgSend(v3, "secondsLeft") + *(void *)(a1 + 48));
      else {
        uint64_t v7 = (uint64_t)[v3 secondsLeft];
      }
      [v3 setSecondsLeft:v7];
    }

    else
    {
      objc_msgSend( *(id *)(a1 + 32),  "createAssertionForBundleID:duration:isUrgent:withPid:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  0,  objc_msgSend(v2, "pid"));
    }

    if (*(_BYTE *)(a1 + 56)
      && [*(id *)(a1 + 32) isPrivilegedBundleID:*(void *)(a1 + 40)])
    {
      [*(id *)(a1 + 32) disableHIP];
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:*(void *)(a1 + 40)]);

      unsigned int v8 = v9;
      if (v9)
      {
        id v10 = (os_log_s *)qword_1008F7578;
        if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "(EE) Refreshing URGENT Process Assertion",  (uint8_t *)&v11,  2u);
        }

        [v9 setSecondsLeft:3];
      }

      else
      {
        unsigned int v8 = 0LL;
        objc_msgSend( *(id *)(a1 + 32),  "createAssertionForBundleID:duration:isUrgent:withPid:",  *(void *)(a1 + 40),  3,  1,  objc_msgSend(v2, "pid"));
      }
    }

    else
    {
      unsigned int v8 = v3;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
      sub_1006A0254((uint64_t)[*(id *)(a1 + 40) UTF8String], (uint64_t)&v11);
    }
    unsigned int v8 = 0LL;
  }
}

void sub_10063B660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063B994( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Unwind_Resume(a1);
}

void sub_10063BA08(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[BTAppInteraction instance](&OBJC_CLASS___BTAppInteraction, "instance"));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 urgentAssertionInvalidationCallback:WeakRetained];
}

void sub_10063BA60( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10063BA78(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[BTAppInteraction instance](&OBJC_CLASS___BTAppInteraction, "instance"));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 assertionInvalidationCallback:WeakRetained];
}

void sub_10063BAD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10063BB64(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(*(void *)(a1 + 32) + 96LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:"));
  char v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 96LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 name]);
    objc_msgSend(v6, "removeObjectForKey:");
  }

void sub_10063BC08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_10063BC9C(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(*(void *)(a1 + 32) + 88LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  char v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);
  uint64_t v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    id v6 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
    {
      id v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
      int v11 = 136446210;
      id v12 = [v7 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Removing invalidated process assertion for application %{public}s",  (uint8_t *)&v11,  0xCu);
    }

    id v8 = *(void **)(a1 + 40);
    id v9 = *(void **)(*(void *)(a1 + 32) + 88LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    [v9 removeObjectForKey:v10];
  }

void sub_10063BDC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10063BEE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) assertionTimerFired];
}

void sub_10063BFC0(uint64_t a1)
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 88) keysOfEntriesPassingTest:&stru_1008A4AF8]);
  id v3 = *(void **)(*(void *)(a1 + 32) + 88LL);
  char v4 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);
  [v3 removeObjectsForKeys:v4];

  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 96) keysOfEntriesPassingTest:&stru_1008A4B18]);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 96LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
  [v5 removeObjectsForKeys:v6];

  if (![*(id *)(*(void *)(a1 + 32) + 88) count]
    && ![*(id *)(*(void *)(a1 + 32) + 96) count])
  {
    [*(id *)(a1 + 32) invalidateAssertionTimer];
  }
}

void sub_10063C0C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

BOOL sub_10063C0F4(id a1, NSString *a2, ProcessAssertion *a3, BOOL *a4)
{
  char v4 = a3;
  -[ProcessAssertion setSecondsLeft:]( v4,  "setSecondsLeft:",  (char *)-[ProcessAssertion secondsLeft](v4, "secondsLeft") - 1);
  unint64_t v5 = -[ProcessAssertion secondsLeft](v4, "secondsLeft");
  if (!v5)
  {
    id v6 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
    {
      id v7 = objc_claimAutoreleasedReturnValue(-[ProcessAssertion name](v4, "name"));
      int v9 = 136446210;
      id v10 = [v7 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Removing expired process assertion for application %{public}s",  (uint8_t *)&v9,  0xCu);
    }

    -[ProcessAssertion invalidate](v4, "invalidate");
  }

  return v5 == 0;
}

void sub_10063C1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10063C21C(id a1, NSString *a2, ProcessAssertion *a3, BOOL *a4)
{
  char v4 = a3;
  -[ProcessAssertion setSecondsLeft:]( v4,  "setSecondsLeft:",  (char *)-[ProcessAssertion secondsLeft](v4, "secondsLeft") - 1);
  unint64_t v5 = -[ProcessAssertion secondsLeft](v4, "secondsLeft");
  if (!v5)
  {
    -[ProcessAssertion invalidate](v4, "invalidate");
    id v6 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "(EE) Expired URGENT Process Assertion", v8, 2u);
    }
  }

  return v5 == 0;
}

void sub_10063C2C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063C340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063C4B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063C4C0(uint64_t a1)
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (!*(_BYTE *)(a1 + 48) || ([v2 isApp])
    && !*(void *)(*(void *)(a1 + 32) + 64LL))
  {
    char v4 = -[UserNotification initWithType:device:bundleID:]( objc_alloc(&OBJC_CLASS___UserNotification),  "initWithType:device:bundleID:",  0LL,  0LL,  *(void *)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  *(void *)(a1 + 40)));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedNameForContext:0]);
    id v9 = sub_1002E95B8(@"CLOSE", @"Close");
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v10 = sub_1002E95B8(@"SETTINGS", @"Settings");
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (*(_BYTE *)(a1 + 49))
    {
      id v12 = sub_1002E95B8(@"LE_DENYLIST_ENABLED_HEADER", @"Allow New Connections");
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      id v27 = 0LL;
      id v14 = v8;
      if (!v8) {
        id v14 = *(void **)(a1 + 40);
      }
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v13,  @"%@",  &v27,  v14));
      id v16 = v27;

      if (v15)
      {
        id v17 = sub_1002E95B8(@"LE_DENYLIST_ENABLED_BODY", &stru_1008A57D8);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v31[0] = kCFUserNotificationAlertHeaderKey;
        v31[1] = kCFUserNotificationAlertMessageKey;
        v32[0] = v15;
        v32[1] = v18;
        v31[2] = kCFUserNotificationDefaultButtonTitleKey;
        v31[3] = kCFUserNotificationAlternateButtonTitleKey;
        v32[2] = v25;
        v32[3] = v11;
        v31[4] = SBUserNotificationAllowMenuButtonDismissal;
        v32[4] = &__kCFBooleanTrue;
        int v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  5LL));

        goto LABEL_13;
      }

      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
        sub_1006A0398();
      }
    }

    else
    {
      id v20 = sub_1002E95B8(@"LE_POWER_OFF_HEADER", @"Power Off");
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      id v26 = 0LL;
      id v22 = v8;
      if (!v8) {
        id v22 = *(void **)(a1 + 40);
      }
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v21,  @"%@",  &v26,  v22));
      id v16 = v26;

      if (v15)
      {
        v29[0] = kCFUserNotificationAlertHeaderKey;
        v29[1] = kCFUserNotificationDefaultButtonTitleKey;
        v30[0] = v15;
        v30[1] = v25;
        v29[2] = kCFUserNotificationAlternateButtonTitleKey;
        v29[3] = SBUserNotificationAllowMenuButtonDismissal;
        v30[2] = v11;
        v30[3] = &__kCFBooleanTrue;
        int v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  4LL));
LABEL_13:
        CFUserNotificationRef v23 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0LL, 0LL, v19);
        if (v23)
        {
          [*(id *)(*(void *)(a1 + 32) + 64) setNotification:v23];
          CFRelease(v23);
          CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource( kCFAllocatorDefault,  v23,  (CFUserNotificationCallBack)sub_10063CA1C,  0LL);
          if (RunLoopSource)
          {
            [*(id *)(*(void *)(a1 + 32) + 64) setRunLoopSource:RunLoopSource];
            CFRelease(RunLoopSource);
          }

          else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
          {
            sub_1006A0360((uint64_t)[*(id *)(a1 + 40) UTF8String], (uint64_t)v28);
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
        {
          sub_1006A0328((uint64_t)[*(id *)(a1 + 40) UTF8String], (uint64_t)v28);
        }

        goto LABEL_25;
      }

      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
        sub_1006A02C4();
      }
    }

    unsigned int v15 = 0LL;
    int v19 = 0LL;
LABEL_25:
  }
}

void sub_10063C958( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10063CA1C(uint64_t a1, uint64_t a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[BTAppInteraction instance](&OBJC_CLASS___BTAppInteraction, "instance"));
  [v4 powerAlertCallback:a1 flags:a2];
}

void sub_10063CA68( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10063CAD4(uint64_t a1)
{
  unsigned __int8 v2 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) bundleID]);
    id v4 = [v3 UTF8String];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = "unknown";
    if (v5 == 1) {
      id v6 = "settings";
    }
    if (v5) {
      id v7 = v6;
    }
    else {
      id v7 = "cancel";
    }
    int v12 = 136446466;
    id v13 = v4;
    __int16 v14 = 2082;
    unsigned int v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "User responded to power notification callback for application %{public}s with %{public}s button",  (uint8_t *)&v12,  0x16u);
  }

  if (*(void *)(a1 + 40) == 1LL)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=Bluetooth"));
    [v8 openSensitiveURL:v9 withOptions:0];
  }

  uint64_t v10 = *(void *)(a1 + 32);
  int v11 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = 0LL;
}

void sub_10063CC38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063CD18(uint64_t a1)
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)]);
  if ([v2 isApp])
  {
    uint32_t v31 = -[UserNotification initWithType:device:bundleID:]( objc_alloc(&OBJC_CLASS___UserNotification),  "initWithType:device:bundleID:",  *(unsigned int *)(a1 + 56),  *(void *)(a1 + 48),  *(void *)(a1 + 40));
    id v3 = *(void **)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 72LL);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10063D3AC;
    v33[3] = &unk_1008A4B68;
    id v34 = v3;
    id v5 = [v4 indexOfObjectPassingTest:v33];
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 72) objectAtIndexedSubscript:v5]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString device](v30, "device"));
      if ([v6 isEqual:*(void *)(a1 + 48)])
      {
        int v7 = *(_DWORD *)(a1 + 56);

        if (v7 != 1)
        {
          id v8 = (os_log_s *)qword_1008F7578;
          if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
          {
            id v9 = [*(id *)(a1 + 40) UTF8String];
            *(_DWORD *)__int128 buf = 136446210;
            *(void *)&uint8_t buf[4] = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Suppressing duplicate notification for application %{public}s",  buf,  0xCu);
          }

void sub_10063D290( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *a22)
{
  _Unwind_Resume(a1);
}

id sub_10063D3AC(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 bundleID]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_10063D3EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063D3FC(uint64_t a1, uint64_t a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[BTAppInteraction instance](&OBJC_CLASS___BTAppInteraction, "instance"));
  [v4 appLaunchCallback:a1 flags:a2];
}

void sub_10063D448( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10063D4D8(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 72LL);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_10063D57C;
  v5[3] = &unk_1008A4B68;
  id v6 = v2;
  id v4 = [v3 indexOfObjectPassingTest:v5];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [*(id *)(*(void *)(a1 + 32) + 72) removeObjectAtIndex:v4];
  }
}

void sub_10063D564( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

id sub_10063D57C(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 bundleID]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_10063D5BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063D628(void *a1)
{
  uint64_t v2 = a1[5];
  id v3 = *(void **)(a1[4] + 72LL);
  void v23[2] = sub_10063D950;
  v23[3] = &unk_1008A4B88;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[4] = v2;
  id v4 = [v3 indexOfObjectPassingTest:v23];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
      sub_1006A04D0();
    }
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 72) objectAtIndexedSubscript:v4]);
    id v6 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_claimAutoreleasedReturnValue([v5 bundleID]);
      id v8 = [v7 UTF8String];
      uint64_t v9 = a1[6];
      if (v9)
      {
        if (v9 == 1)
        {
          uint64_t v10 = "cancel";
        }

        else
        {
          unsigned int v11 = [&off_1008C2C30 intValue];
          uint64_t v10 = "unknown";
          if (v9 == v11) {
            uint64_t v10 = "unlock";
          }
        }
      }

      else
      {
        uint64_t v10 = "default";
      }

      *(_DWORD *)__int128 buf = 136446466;
      id v25 = v8;
      __int16 v26 = 2082;
      id v27 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "User responded to app launch notification callback for application %{public}s with %{public}s button",  buf,  0x16u);
    }

    uint64_t v12 = a1[6];
    if (!v12 || v12 == (int)[&off_1008C2C30 intValue])
    {
      id v13 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = objc_claimAutoreleasedReturnValue([v5 bundleID]);
        id v15 = [v14 UTF8String];
        *(_DWORD *)__int128 buf = 136446210;
        id v25 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Attempting to launch application %{public}s",  buf,  0xCu);
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
      uint64_t v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472LL;
      id v20 = sub_10063D980;
      id v21 = &unk_1008A4BB0;
      id v22 = v5;
      [v16 openApplication:v17 withOptions:0 completion:&v18];
    }

    objc_msgSend(*(id *)(a1[4] + 72), "removeObjectAtIndex:", v4, v18, v19, v20, v21);
  }

void sub_10063D8F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10063D950(uint64_t a1, void *a2)
{
  return [a2 notification] == *(id *)(a1 + 32);
}

void sub_10063D980(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
      id v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to launch application %@ with error %@", v8, v6));
      *(_DWORD *)__int128 buf = 136446210;
      id v15 = [v9 UTF8String];
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  else
  {
    unsigned int v10 = [v5 isValid];
    unsigned int v11 = (os_log_s *)qword_1008F7578;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
        *(_DWORD *)__int128 buf = 136446466;
        id v15 = [v12 UTF8String];
        __int16 v16 = 1026;
        unsigned int v17 = [v5 pid];
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Launched application: %{public}s, pid: %{public}ul",  buf,  0x12u);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
      *(_DWORD *)__int128 buf = 136446210;
      id v15 = [v13 UTF8String];
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to lookup the process ID of %{public}s",  buf,  0xCu);
    }
  }
}

void sub_10063DB90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10063DCE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10063DCF8(uint64_t a1)
{
}

void sub_10063DD00(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)
    || (uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80LL),
        id v3 = -[PairingNotification initWithType:passkey:device:]( [PairingNotification alloc],  "initWithType:passkey:device:",  *(unsigned int *)(a1 + 56),  *(void *)(a1 + 48),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)),  [v2 addObject:v3],  v3,  (unint64_t)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "count") < 2))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 80) count])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 80) objectAtIndexedSubscript:0]);
      id v7 = v6;
      if (v6 && ![v6 notification])
      {
        __int128 buf = 0uLL;
        uint64_t v84 = 0LL;
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_1008A4DC0);
        }
        id v8 = off_1008D5F28;
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
        sub_1005CC0D4((uint64_t)v8, v9, (uint64_t)v80);
        if ((v82 & 0x80u) == 0) {
          uint64_t v10 = v82;
        }
        else {
          uint64_t v10 = v81;
        }
        if (v10)
        {
          if (qword_1008D5F30 != -1) {
            dispatch_once(&qword_1008D5F30, &stru_1008A4DC0);
          }
          unsigned int v11 = off_1008D5F28;
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
          sub_1005CC0D4((uint64_t)v11, v12, (uint64_t)&buf);
        }

        else
        {
          if (qword_1008D5F30 != -1) {
            dispatch_once(&qword_1008D5F30, &stru_1008A4DC0);
          }
          id v13 = off_1008D5F28;
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
          uint64_t v14 = sub_1005CC198((uint64_t)v13, v12, 0);
          id v15 = sub_1005BFB9C(v14);
          id v16 = objc_claimAutoreleasedReturnValue(v15);
          sub_10002418C(&buf, (char *)[v16 UTF8String]);
        }

        id v17 = sub_1002E95B8(@"PAIRING_TITLE", @"Pairing");
        __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(v17);
        id v18 = sub_1002E95B8(@"CANCEL", @"Cancel");
        __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(v18);
        id v19 = sub_1002E95B8(@"PAIR", @"Pair");
        char v60 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if (v84 >= 0) {
          p___int128 buf = &buf;
        }
        else {
          p___int128 buf = (__int128 *)buf;
        }
        BOOL v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_buf));
        id v62 = (void *)MGCopyAnswer(@"MarketingDeviceFamilyName", 0LL);
        v78[0] = kCFUserNotificationAlertTopMostKey;
        v78[1] = SBUserNotificationAllowMenuButtonDismissal;
        v79[0] = &__kCFBooleanTrue;
        v79[1] = &__kCFBooleanTrue;
        v78[2] = SBUserNotificationDismissOnLock;
        v78[3] = kCFUserNotificationAlertHeaderKey;
        v79[2] = &__kCFBooleanTrue;
        v79[3] = v64;
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  4LL));
        CFDictionaryRef dictionary = (CFDictionaryRef)[v21 mutableCopy];

        uint64_t v22 = sub_1002E6BF0();
        int v23 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 360LL))(v22);
        uint64_t v24 = sub_1002E6BF0();
        int v25 = (*(uint64_t (**)(uint64_t))(*(void *)v24 + 272LL))(v24);
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_1008A4DC0);
        }
        __int16 v26 = off_1008D5F28;
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
        BOOL v28 = sub_1005D4FEC((uint64_t)v26, v27);

        id v29 = 0LL;
        __int128 v66 = &stru_1008A57D8;
        id v30 = 0LL;
        id v31 = 0LL;
        switch([v7 pairingType])
        {
          case 0u:
            id v32 = sub_1002E95B8(@"JUST_WORKS_MESSAGE", @"Body");
            id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            id v75 = 0LL;
            __int128 v66 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v33,  @"%@%@",  &v75,  v63,  v62));
            id v31 = v75;

            if (!v66)
            {
              if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
                sub_1006A05C4();
              }
              goto LABEL_81;
            }

            if ((v23 & v25 & v28) != 1) {
              goto LABEL_65;
            }
            id v34 = (os_log_s *)qword_1008F7578;
            if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)unint64_t v80 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Pairing LE HID with old iPad. Show modified message",  v80,  2u);
            }

            if (_os_feature_enabled_impl("BluetoothFeatures", "RuleBasedHIDClassification"))
            {
              if (qword_1008D5F30 != -1) {
                dispatch_once(&qword_1008D5F30, &stru_1008A4DC0);
              }
              __int16 v35 = off_1008D5F28;
              int v36 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
              sub_1005C9A38((uint64_t)v35, v36, @"HIDDeviceUnknownBehavior");

              if (qword_1008D5F30 != -1) {
                dispatch_once(&qword_1008D5F30, &stru_1008A4DC0);
              }
              __int16 v37 = off_1008D5F28;
              char v38 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
              sub_10002418C(v73, "HIDDeviceKnownPoorBehavior");
              sub_1005CCF08((uint64_t)v37, v38, (unsigned __int8 *)v73);
              if ((v74 & 0x80000000) == 0) {
                goto LABEL_61;
              }
              __int16 v39 = (void **)v73;
            }

            else
            {
              if (qword_1008D5F30 != -1) {
                dispatch_once(&qword_1008D5F30, &stru_1008A4DC0);
              }
              __int16 v47 = off_1008D5F28;
              char v38 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
              sub_10002418C(v71, "HIDDeviceUnknownBehavior");
              sub_1005CCF08((uint64_t)v47, v38, (unsigned __int8 *)v71);
              if ((v72 & 0x80000000) == 0) {
                goto LABEL_61;
              }
              __int16 v39 = (void **)v71;
            }

            operator delete(*v39);
LABEL_61:

            int v48 = MGGetBoolAnswer(@"wapi");
            id v49 = @"WIFI";
            if (v48) {
              id v49 = @"WLAN";
            }
            uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_JUST_WORKS_MESSAGE_HID_OLD",  v49));
            id v51 = sub_1002E95B8(v50, @"Body");
            uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
            char v53 = v31;
            id v70 = v31;
            uint64_t v54 = objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v52,  @"%@%@",  &v70,  v63,  v62));
            id v31 = v70;

            if (v54)
            {
              __int128 v66 = (__CFString *)v54;
              goto LABEL_65;
            }

            if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
              sub_1006A0628();
            }
            goto LABEL_81;
          case 1u:
            id v43 = sub_1002E95B8(@"PASSKEY_DISPLAY_MESSAGE", @"Body");
            unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
            id v69 = 0LL;
            __int128 v66 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v44,  @"%@%@%06u%@",  &v69,  v63,  v62,  [v7 passkey],  v63,  v60));
            id v31 = v69;

            if (v66)
            {
              id v29 = v61;
              id v30 = 0LL;
              goto LABEL_66;
            }

            if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
              sub_1006A068C();
            }
            goto LABEL_81;
          case 2u:
            id v40 = sub_1002E95B8(@"PASSKEY_ENTRY_MESSAGE", @"Body");
            unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
            id v68 = 0LL;
            __int128 v66 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v41,  @"%@%@%@%@",  &v68,  v63,  v62,  v63,  v63));
            id v31 = v68;

            if (v66)
            {
              id v29 = v60;
              id v30 = v61;
              v76[0] = kCFUserNotificationTextFieldTitlesKey;
              v76[1] = kCFUserNotificationKeyboardTypesKey;
              v77[0] = &stru_1008A57D8;
              v77[1] = &off_1008C2C78;
              __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v77,  v76,  2LL));
              -[__CFDictionary addEntriesFromDictionary:](dictionary, "addEntriesFromDictionary:", v42);

              goto LABEL_66;
            }

            if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
              sub_1006A06F0();
            }
            goto LABEL_81;
          case 3u:
            goto LABEL_66;
          case 4u:
            id v45 = sub_1002E95B8(@"NUMERIC_MESSAGE", @"Body");
            unsigned int v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
            id v67 = 0LL;
            __int128 v66 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v46,  @"%@%@%06u%@",  &v67,  v63,  v62,  [v7 passkey],  v63,  v60,  v61));
            id v31 = v67;

            if (v66)
            {
LABEL_65:
              id v29 = v60;
              id v30 = v61;
LABEL_66:
              -[__CFDictionary setObject:forKey:]( dictionary,  "setObject:forKey:",  v66,  kCFUserNotificationAlertMessageKey);
              if (v29) {
                -[__CFDictionary setObject:forKey:]( dictionary,  "setObject:forKey:",  v29,  kCFUserNotificationDefaultButtonTitleKey);
              }
              if (v30) {
                -[__CFDictionary setObject:forKey:]( dictionary,  "setObject:forKey:",  v30,  kCFUserNotificationAlternateButtonTitleKey);
              }
              unsigned int v55 = v31;
              CFUserNotificationRef v56 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0x10003uLL, 0LL, dictionary);
              if (v56)
              {
                [v7 setNotification:v56];
                CFRelease(v56);
                CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource( kCFAllocatorDefault,  v56,  (CFUserNotificationCallBack)sub_10063EBBC,  0LL);
                if (RunLoopSource)
                {
                  [v7 setRunLoopSource:RunLoopSource];
                  CFRelease(RunLoopSource);
                  goto LABEL_82;
                }

                if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
                {
                  id v59 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
                  sub_1006A057C(v59, (uint64_t)v80);
                  unsigned int v55 = v31;
                }
              }

              else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
              {
                int v58 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
                sub_1006A0534(v58, (uint64_t)v80);
                unsigned int v55 = v31;
              }

              [*(id *)(*(void *)(a1 + 32) + 80) removeObjectAtIndex:0];
            }

            else
            {
              if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
                sub_1006A0754();
              }
LABEL_81:
              __int128 v66 = 0LL;
              id v29 = 0LL;
              id v30 = 0LL;
              unsigned int v55 = v31;
            }

void sub_10063E974( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *__p, uint64_t a25, int a26, __int16 a27, char a28, char a29, void *a30, uint64_t a31, int a32, __int16 a33, char a34, char a35)
{
  if (a29 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_10063EBBC(uint64_t a1, uint64_t a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[BTAppInteraction instance](&OBJC_CLASS___BTAppInteraction, "instance"));
  [v4 pairingAlertCallback:a1 flags:a2];
}

void sub_10063EC08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10063EC98(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(*(void *)(a1 + 40) + 80LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _DWORD v7[2] = sub_10063ED88;
    v7[3] = &unk_10089DF18;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 40);
    id v8 = v4;
    uint64_t v9 = v5;
    [v3 enumerateObjectsUsingBlock:v7];
  }

  else
  {
    id v6 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Clearing all active pairing notifications",  buf,  2u);
    }

    [*(id *)(*(void *)(a1 + 40) + 80) removeAllObjects];
  }

void sub_10063ED74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
}

void sub_10063ED88(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
  unsigned int v9 = [v8 isEqual:*(void *)(a1 + 32)];

  if (v9)
  {
    uint64_t v10 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = "queued";
      uint64_t v12 = *(void *)(a1 + 32);
      if (!a3) {
        unsigned int v11 = "active";
      }
      int v13 = 136446466;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Clearing %{public}s pairing notification for device %@",  (uint8_t *)&v13,  0x16u);
    }

    [*(id *)(*(void *)(a1 + 40) + 80) removeObjectAtIndex:a3];
    *a4 = 1;
  }
}

void sub_10063EEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063EF2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 80LL);
  _DWORD v26[2] = sub_10063F36C;
  v26[3] = &unk_1008A4B88;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  void v26[4] = v2;
  id v4 = [v3 indexOfObjectPassingTest:v26];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
      sub_1006A07B8();
    }
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 80) objectAtIndexedSubscript:v4]);
    uint64_t v6 = 0LL;
    uint64_t v7 = 1LL;
    switch([v5 pairingType])
    {
      case 0u:
      case 4u:
        goto LABEL_6;
      case 1u:
        uint64_t v7 = 0LL;
        uint64_t v6 = 1LL;
LABEL_6:
        id v8 = (os_log_s *)qword_1008F7578;
        if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 device]);
          uint64_t v10 = *(const char **)(a1 + 48);
          unsigned int v11 = [v5 pairingType];
          uint64_t v12 = "unknown";
          *(_DWORD *)__int128 buf = 138413058;
          BOOL v28 = v9;
          __int16 v29 = 2082;
          id v30 = v12;
          __int16 v31 = 2048;
          id v32 = v10;
          __int16 v33 = 1024;
          LODWORD(v34) = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "User responded to pairing notification for device %@ with %{public}s (%ld) button for pairing type:%d",  buf,  0x26u);
        }

        break;
      case 2u:
        CFStringRef ResponseValue = CFUserNotificationGetResponseValue( *(CFUserNotificationRef *)(a1 + 40),  kCFUserNotificationTextFieldValuesKey,  0LL);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(ResponseValue);
        __int16 v15 = v14;
        if (v14) {
          objc_msgSend(v5, "setPasskey:", (int)objc_msgSend(v14, "intValue"));
        }
        uint64_t v16 = (os_log_s *)qword_1008F7578;
        if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 device]);
          id v18 = (const char *)[v5 passkey];
          uint64_t v19 = *(void *)(a1 + 48);
          unsigned int v20 = [v5 pairingType];
          id v21 = "unknown";
          *(_DWORD *)__int128 buf = 138413314;
          BOOL v28 = v17;
          if (v19 == 1) {
            id v21 = "cancel";
          }
          id v30 = v18;
          __int16 v31 = 2082;
          __int16 v29 = 2048;
          if (!v19) {
            id v21 = "pair";
          }
          id v32 = v21;
          __int16 v33 = 2048;
          uint64_t v34 = v19;
          __int16 v35 = 1024;
          unsigned int v36 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "User responded to pairing notification for device %@ with passkey %lu and %{public}s (%ld) button for pairing type:%d",  buf,  0x30u);
        }

        uint64_t v6 = 0LL;
        break;
      default:
        break;
    }

    if (qword_1008D5F20 != -1) {
      dispatch_once(&qword_1008D5F20, &stru_1008A4DE0);
    }
    uint64_t v22 = qword_1008D5F18;
    int v23 = (void *)objc_claimAutoreleasedReturnValue([v5 device]);
    sub_100622D00(v22, v23, *(void *)(a1 + 48) == v6, [v5 passkey]);

    [*(id *)(*(void *)(a1 + 32) + 80) removeObjectAtIndex:v4];
    if ([*(id *)(*(void *)(a1 + 32) + 80) count])
    {
      uint64_t v24 = *(void *)(a1 + 32);
      if (*(void *)(v24 + 8))
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_10063F39C;
        v25[3] = &unk_10087EA48;
        void v25[4] = v24;
        dispatch_async(&_dispatch_main_q, v25);
      }
    }
  }

void sub_10063F304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10063F36C(uint64_t a1, void *a2)
{
  return [a2 notification] == *(id *)(a1 + 32);
}

void sub_10063F39C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 80) objectAtIndexedSubscript:0]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 device]);
  (*(void (**)(uint64_t, void *))(*(void *)v2 + 24LL))(v2, v3);
}

void sub_10063F400( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10063F4EC(id a1, NSString *a2, ProcessAssertion *a3, BOOL *a4)
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @" %@", v4));
    *(_DWORD *)__int128 buf = 136446210;
    id v8 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

void sub_10063F5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063F5EC(id a1, NSString *a2, ProcessAssertion *a3, BOOL *a4)
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @" %@", v4));
    *(_DWORD *)__int128 buf = 136446210;
    id v8 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

void sub_10063F6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10063FAE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22, uint64_t a23, void *a24, uint64_t a25, int a26, __int16 a27, char a28, char a29)
{
  _Unwind_Resume(a1);
}

void sub_10063FB70(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 1;
  CFOptionFlags v24 = 0LL;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[CBAccessoryLogging getProductNameFromProductID:]( &OBJC_CLASS___CBAccessoryLogging,  "getProductNameFromProductID:",  *(unsigned int *)(a1 + 48)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Issue Detected",  v2));
  id v4 = sub_1002E95B8(@"TITLE", v3);
  alertHeader = (__CFString *)objc_claimAutoreleasedReturnValue(v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"An issue was detected with your %@. Do you wish to file a radar with AirWave?",  v2));
  id v6 = sub_1002E95B8(@"CONTENT", v5);
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = sub_1002E95B8(@"OPEN_AIRWAVE", @"Open AirWave");
  unsigned int v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = sub_1002E95B8(@"NO_THANKS", @"No thanks");
  unsigned int v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
  CFUserNotificationDisplayAlert(0.0, 1uLL, 0LL, 0LL, 0LL, alertHeader, v7, v9, v11, 0LL, &v24);
  if (v24)
  {
    if (v24 == 1)
    {
      uint64_t v12 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        int v13 = "displayAirWaveLaunchNotification: Dismissing crash log";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      }
    }

    else
    {
      uint64_t v12 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        int v13 = "displayAirWaveLaunchNotification: No response";
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithString:]( &OBJC_CLASS___NSURLComponents,  "componentsWithString:",  @"wayfinder://"));
    [v14 setHost:@"debug"];
    __int16 v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%u",  *(unsigned __int8 *)(a1 + 52));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"opcode",  v16));
    -[NSMutableArray addObject:](v15, "addObject:", v17);

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"findMySerialNumber",  *(void *)(a1 + 40)));
    -[NSMutableArray addObject:](v15, "addObject:", v18);

    [v14 setQueryItems:v15];
    uint64_t v19 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v14 string]);
      *(_DWORD *)__int128 buf = 138543362;
      __int16 v26 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "displayAirWaveLaunchNotification: Launching AirWave with URL %{public}@",  buf,  0xCu);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 URL]);
    [v21 openURL:v22 configuration:0 completionHandler:&stru_1008A4C78];
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 0;
}

void sub_10063FF08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_10063FFCC(id a1, NSDictionary *a2, NSError *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  id v6 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](v5, "description"));
    int v8 = 138412546;
    unsigned int v9 = v4;
    __int16 v10 = 2112;
    unsigned int v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "displayAirWaveLaunchNotification: AirWave launch result %@, error %@",  (uint8_t *)&v8,  0x16u);
  }
}

void sub_1006400AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006403EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25, void *a26, uint64_t a27, int a28, __int16 a29, char a30, char a31)
{
  _Unwind_Resume(a1);
}

void sub_100640470(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 1;
  CFOptionFlags v13 = 0LL;
  id v2 = sub_1002E95B8(@"FILE_A_RADAR", @"File a Radar");
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_1002E95B8(@"NO_THANKS", @"No thanks");
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
  CFUserNotificationDisplayAlert( 0.0,  1uLL,  0LL,  0LL,  0LL,  *(CFStringRef *)(a1 + 40),  *(CFStringRef *)(a1 + 48),  v3,  v5,  0LL,  &v13);
  if (v13)
  {
    if (v13 == 1)
    {
      if (qword_1008D67D8 != -1) {
        dispatch_once(&qword_1008D67D8, &stru_1008A4E00);
      }
      int v6 = sub_100353ED0(qword_1008D67D0, a1 + 64, 6, 1u);
      uint64_t v7 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 67109120;
        int v15 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "showFoundAccessoryCrashAlert: Dismissing crash log (__n128 result = %d)",  buf,  8u);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR))
    {
      sub_1006A08D0();
    }
  }

  else
  {
    if (qword_1008D67D8 != -1) {
      dispatch_once(&qword_1008D67D8, &stru_1008A4E00);
    }
    int v8 = sub_100353ED0(qword_1008D67D0, a1 + 64, 5, 1u);
    unsigned int v9 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "showFoundAccessoryCrashAlert: Requesting crash log (__n128 result = %d)",  buf,  8u);
    }

    if (v8 == 312 || v8 == 12)
    {
      __int16 v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Crash retrieval failed as the connection to %@ has been lost.  You will be prompted again after you re-connect.",  *(void *)(a1 + 56)));
      id v11 = sub_1002E95B8(@"OK", @"OK");
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue(v11);
      CFUserNotificationDisplayAlert(0.0, 1uLL, 0LL, 0LL, 0LL, @"No Longer Connected", v10, v12, 0LL, 0LL, &v13);
    }
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 0;
}

void sub_100640740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100640AD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25, void *a26, uint64_t a27, int a28, __int16 a29, char a30, char a31)
{
  _Unwind_Resume(a1);
}

void sub_100640B4C(uint64_t a1)
{
  CFOptionFlags v7 = 0LL;
  id v2 = sub_1002E95B8(@"FILE_A_RADAR", @"File a Radar");
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_1002E95B8(@"NO_THANKS", @"No thanks");
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
  CFUserNotificationDisplayAlert( 0.0,  1uLL,  0LL,  0LL,  0LL,  *(CFStringRef *)(a1 + 32),  *(CFStringRef *)(a1 + 40),  v3,  v5,  0LL,  &v7);
  if (!v7)
  {
    if (*(_BYTE *)(a1 + 72)) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    [*(id *)(a1 + 48) openTapToRadarWithAccessoryLogs:*(void *)(a1 + 56) reason:v6 pid:*(void *)(a1 + 64)];
  }
}

void sub_100640C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100641040( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *__p, uint64_t a23, int a24, __int16 a25, char a26, char a27)
{
  _Unwind_Resume(a1);
}

void sub_1006410B4(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 1;
  CFOptionFlags v9 = 0LL;
  id v2 = sub_1002E95B8(@"FILE_A_RADAR", @"File a Radar");
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_1002E95B8(@"NO_THANKS", @"No thanks");
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
  CFUserNotificationDisplayAlert( 0.0,  1uLL,  0LL,  0LL,  0LL,  *(CFStringRef *)(a1 + 40),  *(CFStringRef *)(a1 + 48),  v3,  v5,  0LL,  &v9);
  if (!v9)
  {
    if (qword_1008D60E0 != -1) {
      dispatch_once(&qword_1008D60E0, &stru_1008A4E20);
    }
    if (sub_100234F9C( (uint64_t)off_1008D60D8,  *(unsigned int *)(a1 + 76) | ((unint64_t)*(unsigned __int16 *)(a1 + 80) << 32)))
    {
      [*(id *)(a1 + 32) openTapToRadarWithAccessoryLogs:0 reason:*(unsigned int *)(a1 + 72) pid:*(void *)(a1 + 64)];
    }

    else
    {
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Your connection to the %@ does not exist; not opening Tap-to-Radar.  Please re-connect your %@ and file a radar separately.",
                             *(void *)(a1 + 56),
                             *(void *)(a1 + 56)));
      id v7 = sub_1002E95B8(@"OK", @"OK");
      int v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
      CFUserNotificationDisplayAlert(0.0, 1uLL, 0LL, 0LL, 0LL, @"No Longer Connected", v6, v8, 0LL, 0LL, &v9);
    }
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 0;
}

void sub_100641248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100641B70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100641CB0(id a1, NSDictionary *a2, NSError *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
    sub_1006A0A4C();
  }
}

void sub_100641E14(uint64_t a1)
{
  CFOptionFlags v26 = 0LL;
  CFUserNotificationDisplayAlert( 0.0,  1uLL,  0LL,  0LL,  0LL,  @"Your device has BT Issues",  @"File a radar now?",  @"OK",  @"Cancel",  0LL,  &v26);
  if (v26) {
    return;
  }
  int v2 = *(_DWORD *)(a1 + 64);
  switch(v2)
  {
    case 0:
      id v7 = @"tap-to-radar://new?Title=BT%20Controller%20Crashed&Classification=Crash%2FHang%2FData%20Loss";
LABEL_9:
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v7, "stringByAppendingString:", @"&ComponentID="));

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingString:*(void *)(a1 + 40)]);
      CFOptionFlags v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingString:@"&ComponentName="]);

      id v14 = sub_1006421E0(*(void **)(a1 + 48));
      int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingString:v15]);

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingString:@"&ComponentVersion="]);
      id v18 = sub_1006421E0(*(void **)(a1 + 56));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:v19]);

      id v21 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [v20 UTF8String];
        *(_DWORD *)__int128 buf = 136446210;
        id v28 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "btControllerTapToRadar: Launch TapToRadar URL : %{public}s",  buf,  0xCu);
      }

      int v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v20));
      CFOptionFlags v24 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
      [v24 openURL:v23 configuration:0 completionHandler:&stru_1008A4D58];

      return;
    case 2:
      id v8 = sub_1006421E0(*(void **)(a1 + 32));
      CFOptionFlags v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([@"tap-to-radar://new?Title=" stringByAppendingString:v9]);

      uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"&Classification=Security"]);
      goto LABEL_8;
    case 1:
      id v3 = sub_1006421E0(*(void **)(a1 + 32));
      id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( [@"tap-to-radar://new?Title=BT%20Controller%20Error%20Found%3A%20" stringByAppendingString:v4]);

      uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"&Classification=Crash%2FHang%2FData%20Loss"]);
LABEL_8:
      __int16 v10 = (__CFString *)v6;

      id v7 = v10;
      goto LABEL_9;
  }

  int v25 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v28) = v2;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Invalid Tap-To-Radar Type %d", buf, 8u);
  }

void sub_100642150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1006421E0(void *a1)
{
  id v1 = a1;
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 stringByAddingPercentEncodingWithAllowedCharacters:v2]);

  return v3;
}

void sub_100642244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1006422F4(id a1)
{
  id v1 = operator new(0x1A0uLL);
  sub_1002769A4();
  off_1008D67C0 = v1;
}

void sub_100642324(_Unwind_Exception *a1)
{
}

void sub_100642338(id a1)
{
  id v1 = operator new(0x128uLL);
  sub_1005C69F8();
  off_1008D5F28 = v1;
}

void sub_100642368(_Unwind_Exception *a1)
{
}

void sub_10064237C(id a1)
{
  id v1 = operator new(0xEB0uLL);
  sub_10061991C();
  qword_1008D5F18 = (uint64_t)v1;
}

void sub_1006423AC(_Unwind_Exception *a1)
{
}

void sub_1006423C0(id a1)
{
  id v1 = operator new(0x1C8uLL);
  sub_100352FF0();
  qword_1008D67D0 = (uint64_t)v1;
}

void sub_1006423F0(_Unwind_Exception *a1)
{
}

void sub_100642404(id a1)
{
  id v1 = operator new(0x2C8uLL);
  sub_100213DA8();
  off_1008D60D8 = v1;
}

void sub_100642434(_Unwind_Exception *a1)
{
}

uint64_t sub_100642448()
{
  uint64_t result = sub_1002E8EE8();
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 16LL))(result);
  }
  return result;
}

uint64_t sub_100642470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1002E8EE8();
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)result + 32LL))(result, a2, a3);
  }
  return result;
}

uint64_t sub_1006424B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1002E8EE8();
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)result + 40LL))(result, a2, a3);
  }
  return result;
}

void *sub_1006424F8(void *a1)
{
  a1[1] = &off_1008A4F50;
  uint64_t v2 = (uint64_t)(a1 + 1);
  *a1 = off_1008A4E50;
  a1[2] = 0LL;
  uint64_t v3 = sub_100404FE8();
  sub_100207EC0((_DWORD)a1 + 24, (int)a1, "com.apple.BTServer.le", *(dispatch_queue_t *)(v3 + 8));
  sub_100207EFC((uint64_t)(a1 + 3));
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableOrderedSet);
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;

  if (qword_1008D9278 != -1) {
    dispatch_once(&qword_1008D9278, &stru_1008A4F68);
  }
  sub_100413CBC(qword_1008D9270, v2);
  return a1;
}

void sub_1006425B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1006425DC(uint64_t a1)
{
  *(void *)a1 = off_1008A4E50;
  *(void *)(a1 + 8) = &off_1008A4F50;
  uint64_t v2 = a1 + 8;
  if (qword_1008D9278 != -1) {
    dispatch_once(&qword_1008D9278, &stru_1008A4F68);
  }
  sub_100413D4C(qword_1008D9270, v2);
  sub_100207EF8(a1 + 24);

  return a1;
}

void sub_10064265C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10064267C(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1006425DC(a1);
  operator delete(v1);
}

void sub_100642694(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  *(void *)uuid = 0LL;
  uint64_t v6 = 0LL;
  [v3 getUUIDBytes:uuid];
  xpc_dictionary_set_uuid(v4, "kPeerIdentifier", uuid);
  sub_100208104(a1 + 24, "ConnectOnce", v4, 0LL);
}

void sub_100642748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100642768(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v5 = xpc_array_create(0LL, 0LL);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      CFOptionFlags v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        __int16 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v9);
        *(void *)uuid = 0LL;
        uint64_t v16 = 0LL;
        objc_msgSend(v10, "getUUIDBytes:", uuid, (void)v11);
        xpc_array_set_uuid(v5, 0xFFFFFFFFFFFFFFFFLL, uuid);
        CFOptionFlags v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }

    while (v7);
  }

  xpc_dictionary_set_value(v4, "kPeerIdentifiers", v5);
  xpc_release(v5);
  sub_100208104(a1 + 24, "ConnectAlways", v4, 0LL);
}

void sub_1006428DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100642914(uint64_t a1, unsigned int a2, unsigned int a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "kPiconetClock", a2);
  xpc_dictionary_set_uint64(v6, "kPiconetPhaseClock", a3);
  sub_100208104(a1 + 24, "NotifyPiconetClock", v6, 0LL);
}

void sub_100642990(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  *(void *)uuid = 0LL;
  uint64_t v6 = 0LL;
  [v3 getUUIDBytes:uuid];
  xpc_dictionary_set_uuid(v4, "kPeerIdentifier", uuid);
  sub_100208104(a1 + 24, "DOAPDeviceConnected", v4, 0LL);
}

void sub_100642A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100642A60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (qword_1008D5F30 == -1)
  {
    xpc_object_t v4 = v3;
  }

  else
  {
    dispatch_once(&qword_1008D5F30, &stru_1008A4F88);
    xpc_object_t v4 = v8;
  }

  uint64_t v5 = sub_1005CC198((uint64_t)off_1008D5F28, v4, 0);
  if (qword_1008D5F50 != -1) {
    dispatch_once(&qword_1008D5F50, &stru_1008A4FA8);
  }
  uint64_t v6 = sub_10040007C(off_1008D5F48, v5, 0);
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  sub_100208104(a1 + 24, "UARPDeviceConnected", v7, 0LL);
}

void sub_100642B50( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100642B68(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  *(void *)uuid = 0LL;
  uint64_t v6 = 0LL;
  [v3 getUUIDBytes:uuid];
  xpc_dictionary_set_uuid(v4, "kUARPDeviceUUID", uuid);
  sub_100208104(a1 + 24, "UARPAACPTransportChange", v4, 0LL);
}

void sub_100642C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100642C3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t v4 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending HRM connected xpc message", v6, 2u);
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  sub_100208104(a1 + 24, "HRMDeviceConnected", v5, 0LL);
}

void sub_100642CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100642CF0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a3, *(void *)(a3 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a3;
    uint64_t v6 = *(void *)(a3 + 16);
  }

  sub_100642D7C(a1, a2, (const char *)__p);
  if (SHIBYTE(v6) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100642D60( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100642D7C(uint64_t a1, unsigned int a2, const char *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "kEasyPairingVersion", a2);
  if (a3[23] < 0) {
    a3 = *(const char **)a3;
  }
  xpc_dictionary_set_string(v6, "kCloudAccount", a3);
  sub_100208104(a1 + 24, "VersionInfoRequest", v6, 0LL);
}

void sub_100642E00(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a3, *(void *)(a3 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a3;
    uint64_t v8 = *(void *)(a3 + 16);
  }

  sub_100642E9C(a1, a2, (const char *)__p, a4);
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100642E80( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100642E9C(uint64_t a1, unsigned int a2, const char *a3, unsigned int a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "kEasyPairingVersion", a2);
  if (a3[23] < 0) {
    a3 = *(const char **)a3;
  }
  xpc_dictionary_set_string(v8, "kCloudAccount", a3);
  xpc_dictionary_set_uint64(v8, "kEasyPairingStatus", a4);
  sub_100208104(a1 + 24, "VersionInfoResponse", v8, 0LL);
}

void sub_100642F40(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v4 = *(void *)(a2 + 16);
  }

  sub_100642FC8(a1, (const char *)__p);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100642FAC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100642FC8(uint64_t a1, const char *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v5 = v4;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v4, "kDeviceAddress", a2);
  sub_100208104(a1 + 24, "ClassicPairStateRequest", v5, 0LL);
}

void sub_100643038(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v6 = *(void *)(a2 + 16);
  }

  sub_1006430C8(a1, (const char *)__p, a3);
  if (SHIBYTE(v6) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1006430AC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1006430C8(uint64_t a1, const char *a2, unsigned int a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v7 = v6;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v6, "kDeviceAddress", a2);
  xpc_dictionary_set_uint64(v7, "kDevicePairState", a3);
  sub_100208104(a1 + 24, "ClassicPairStateResponse", v7, 0LL);
}

void sub_100643150(uint64_t a1, uint64_t a2, const char *a3, const void *a4, unsigned int a5)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v10 = *(void *)(a2 + 16);
  }

  sub_1006431F8(a1, (const char *)__p, a3, a4, a5);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1006431DC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1006431F8(uint64_t a1, const char *a2, const char *a3, const void *a4, unsigned int a5)
{
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  __int128 v11 = v10;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v10, "kDeviceAddress", a2);
  xpc_dictionary_set_string(v11, "kDeviceName", a3);
  xpc_dictionary_set_data(v11, "kDeviceLinkKey", a4, a5);
  sub_100208104(a1 + 24, "StoreClassicLinkKeyRequest", v11, 0LL);
}

void sub_1006432A8( uint64_t a1, uint64_t a2, const char *a3, const void *a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v14 = *(void *)(a2 + 16);
  }

  sub_100643368(a1, (const char *)__p, a3, a4, a5, a6, a7);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
}

void sub_10064334C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100643368( uint64_t a1, const char *a2, const char *a3, const void *a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
  int v15 = v14;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v14, "kDeviceAddress", a2);
  xpc_dictionary_set_string(v15, "kDeviceName", a3);
  xpc_dictionary_set_data(v15, "kDeviceLinkKey", a4, a5);
  xpc_dictionary_set_uint64(v15, "kDeviceServiceMask", a6);
  xpc_dictionary_set_uint64(v15, "kClassOfDeviceMask", a7);
  sub_100208104(a1 + 24, "StoreClassicLinkKeyRequestExtended", v15, 0LL);
}

void sub_100643450(uint64_t a1, uint64_t a2, void *a3, const char *a4)
{
  id v7 = a3;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v9 = *(void *)(a2 + 16);
  }

  sub_100643504(a1, (const char *)__p, v7, a4);
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1006434DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_100643504(uint64_t a1, const char *a2, void *a3, const char *a4)
{
  id v13 = a3;
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v8 = v7;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v7, "kDeviceAddress", a2);
  xpc_dictionary_set_string(v8, "kDeviceName", a4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"kCfgMicSide"]);
  xpc_dictionary_set_uint64(v8, "kClassicDeviceMicMode", (int)[v9 intValue]);

  xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"kCfgInEarMode"]);
  xpc_dictionary_set_uint64(v8, "kClassicDeviceInEarEnable", [v10 BOOLValue]);

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"kCfgDoubleTap"]);
  xpc_dictionary_set_uint64(v8, "kClassicDeviceDoubleTapMode", (int)[v11 intValue]);

  __int128 v12 = (void *)sub_10043E644(v13);
  xpc_dictionary_set_value(v8, "kClassicDeviceSettings", v12);
  xpc_release(v12);
  sub_100208104(a1 + 24, "StoreClassicDeviceSettings", v8, 0LL);
}

void sub_100643668( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100643694(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v4 = *(void *)(a2 + 16);
  }

  sub_10064371C(a1, (const char *)__p);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100643700( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10064371C(uint64_t a1, const char *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v5 = v4;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v4, "kDeviceAddress", a2);
  sub_100208104(a1 + 24, "ClassicDeviceUnexpectedDisconnection", v5, 0LL);
}

void sub_10064378C(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v6 = *(void *)(a2 + 16);
  }

  sub_10064381C(a1, (const char *)__p, a3);
  if (SHIBYTE(v6) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100643800( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10064381C(uint64_t a1, const char *a2, unsigned int a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v7 = v6;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v6, "kDeviceAddress", a2);
  xpc_dictionary_set_uint64(v7, "kQuickDisconnectEnabled", a3);
  sub_100208104(a1 + 24, "ConnectClassicDevice", v7, 0LL);
}

void sub_1006438A4(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v6 = *(void *)(a2 + 16);
  }

  sub_100643934(a1, (const char *)__p, a3);
  if (SHIBYTE(v6) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100643918( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100643934(uint64_t a1, const char *a2, unsigned int a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v7 = v6;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v6, "kDeviceAddress", a2);
  xpc_dictionary_set_uint64(v7, "kPrimaryBudSide", a3);
  sub_100208104(a1 + 24, "NotifyPrimaryBudSide", v7, 0LL);
}

void sub_1006439C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  *(void *)uuid = 0LL;
  uint64_t v6 = 0LL;
  [v3 getUUIDBytes:uuid];
  xpc_dictionary_set_uuid(v4, "kPeerIdentifier", uuid);
  sub_100208104(a1 + 24, "MFiAccessoryAuth", v4, 0LL);
}

void sub_100643A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100643A94(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)sub_10043E644(v4);
  sub_100208104(a1 + 24, "LaunchBTLEServerWithOptions", v3, 0LL);
}

void sub_100643AE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100643AF4(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  sub_100208104(a1 + 24, "PreWarmMFiAccessoryAuth", v2, 0LL);
}

void sub_100643B38(uint64_t a1, void *a2, unsigned int a3, const void *a4)
{
  id v7 = a2;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  *(void *)uuid = 0LL;
  uint64_t v10 = 0LL;
  [v7 getUUIDBytes:uuid];
  xpc_dictionary_set_uuid(v8, "kUARPDeviceUUID", uuid);
  xpc_dictionary_set_data(v8, "kUARPData", a4, a3);
  sub_100208104(a1 + 24, "UARPDataOverAACP", v8, 0LL);
}

void sub_100643C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100643C30(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v10 = *(void *)(a2 + 16);
  }

  sub_100643CF4(a1, (const char *)__p, v7, v8);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100643CC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_100643CF4(uint64_t a1, const char *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v10 = v9;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v9, "kLeaDeviceAddress", a2);
  id v11 = objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  xpc_dictionary_set_string(v10, "kLeaDeviceIdentifier", (const char *)[v11 UTF8String]);

  __int128 v12 = (void *)sub_10043E92C(v8);
  xpc_dictionary_set_value(v10, "kLeaDeviceTags", v12);
  xpc_release(v12);
  id v13 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    int v15 = 136315138;
    id v16 = [v14 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Sending requestLeaEasyPairMsg: kLeaDeviceIdentifier = %s",  (uint8_t *)&v15,  0xCu);
  }

  sub_100208104(a1 + 24, "LeaEasyPairRequest", v10, 0LL);
}

void sub_100643E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100643EC0( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, const void *a5, const void *a6, const void *a7)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100024238(__dst, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)__uuid_t dst = *(_OWORD *)a2;
    uint64_t v16 = *(void *)(a2 + 16);
  }

  if (*(char *)(a3 + 23) < 0)
  {
    sub_100024238(__p, *(void **)a3, *(void *)(a3 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a3;
    uint64_t v14 = *(void *)(a3 + 16);
  }

  sub_100643FD0(a1, (const char *)__dst, (const char *)__p, a4, a5, a6, a7);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v16) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_100643F9C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100643FD0( uint64_t a1, const char *a2, const char *a3, unsigned int a4, const void *a5, const void *a6, const void *a7)
{
  xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
  int v15 = v14;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v14, "kLeaDeviceAddress", a2);
  if (a3[23] < 0) {
    a3 = *(const char **)a3;
  }
  xpc_dictionary_set_string(v15, "kLeaDeviceName", a3);
  xpc_dictionary_set_uint64(v15, "kLeaDeviceEdiv", a4);
  xpc_dictionary_set_data(v15, "kLeaDeviceRand", a5, 8uLL);
  xpc_dictionary_set_data(v15, "kLeaDeviceLtk", a6, 0x10uLL);
  xpc_dictionary_set_data(v15, "kLeaDeviceIrk", a7, 0x10uLL);
  sub_100208104(a1 + 24, "LeaStoreBondingInfoRequest", v15, 0LL);
}

void sub_1006440E0(uint64_t a1)
{
  if (qword_1008D9278 != -1) {
    dispatch_once(&qword_1008D9278, &stru_1008A4F68);
  }
  BOOL v2 = sub_1004138A0(qword_1008D9270);
  sub_100644138(a1, v2);
}

void sub_100644138(uint64_t a1, BOOL a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, "kPersist", a2);
  sub_100208104(a1 + 24, "PersistServerServices", v4, 0LL);
}

void sub_100644198(uint64_t a1, const char *a2, unsigned int a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v7 = v6;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v6, "kDeviceAddress", a2);
  xpc_dictionary_set_uint64(v7, "kStoreClassicLinkKeyResult", a3);
  sub_100208104(a1 + 24, "StoreClassicLinkKeyResponse", v7, 0LL);
}

void sub_100644220(uint64_t a1, const char *a2, unsigned int a3)
{
  xpc_object_t v6 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sending LeaEasyPairResponse: status=%d",  (uint8_t *)v9,  8u);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v8 = v7;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v7, "kLeaDeviceAddress", a2);
  xpc_dictionary_set_uint64(v8, "kLeaDevicePairState", a3);
  sub_100208104(a1 + 24, "LeaEasyPairResponse", v8, 0LL);
}

void sub_100644330(uint64_t a1, const char *a2, unsigned int a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v7 = v6;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_dictionary_set_string(v6, "kLeaDeviceAddress", a2);
  xpc_dictionary_set_uint64(v7, "kLeaStoreBondingInfoResult", a3);
  sub_100208104(a1 + 24, "LeaStoreBondingInfoResponse", v7, 0LL);
}

void sub_1006443B8(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t v6 = (os_log_s *)qword_1008F75A0;
  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136446210;
    *(void *)&uint8_t buf[4] = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received XPC message %{public}s", buf, 0xCu);
  }

  if (!strcmp(a2, "SetConnectionParameters"))
  {
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = 0LL;
    uuid = xpc_dictionary_get_uuid(a3, "kPeerIdentifier");
    uuid_copy(buf, uuid);
    double v16 = xpc_dictionary_get_double(a3, "kMinInterval");
    double v17 = xpc_dictionary_get_double(a3, "kPreferredInterval");
    double v18 = xpc_dictionary_get_double(a3, "kMaxInterval");
    unsigned __int16 int64 = xpc_dictionary_get_int64(a3, "kMinCELength");
    unsigned __int16 v20 = xpc_dictionary_get_int64(a3, "kMaxCELength");
    unsigned __int16 v21 = xpc_dictionary_get_int64(a3, "kPreferredPeripheralLatency");
    __int16 v22 = xpc_dictionary_get_int64(a3, "kMaxPeripheralLatency");
    unsigned __int16 v23 = xpc_dictionary_get_int64(a3, "kTimeout");
    xpc_dictionary_get_int64(a3, "kMaxDeferment");
    float v24 = v16;
    float v25 = v17;
    float v26 = v18;
    if (qword_1008D5F10 != -1) {
      dispatch_once(&qword_1008D5F10, &stru_1008A4FC8);
    }
    sub_1005B09DC((uint64_t)off_1008D5F08, buf, int64, v20, v21, v22, v23, v24, v25, v26);
  }

  else if (!strcmp(a2, "AuthenticationDidSucceed"))
  {
    *(_OWORD *)&dst.__r_.__value_.__l.__data_ = 0uLL;
    id v27 = xpc_dictionary_get_uuid(a3, "kPeerIdentifier");
    uuid_copy((unsigned __int8 *)&dst, v27);
    int64_t v28 = xpc_dictionary_get_int64(a3, "kCertClass");
    memset(buf, 0, sizeof(buf));
    if (v28 == 0x7FFFFFFF) {
      strcpy(buf, "IsMFiAuthenticated");
    }
    else {
      snprintf(buf, 0x20uLL, "IsMFiAuthenticated_CertClass%02X", v28);
    }
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A4F88);
    }
    __int16 v33 = off_1008D5F28;
    uint64_t v34 = sub_100241F94((const unsigned __int8 *)&dst);
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    sub_10002418C(__p, buf);
    sub_1005CCF08((uint64_t)v33, v35, (unsigned __int8 *)__p);
    if (v336 < 0) {
      operator delete(__p[0]);
    }
  }

  else if (!strcmp(a2, "AuthenticationDidFail"))
  {
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = 0LL;
    __int16 v29 = xpc_dictionary_get_uuid(a3, "kPeerIdentifier");
    uuid_copy(buf, v29);
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A4F88);
    }
    id v30 = off_1008D5F28;
    __int16 v31 = sub_100241F94(buf);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    sub_1005C9A38((uint64_t)v30, v32, @"IsMFiAuthenticated");
  }

  else if (!strcmp(a2, "PeerIsUsingBuiltinService"))
  {
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = 0LL;
    unsigned int v36 = xpc_dictionary_get_uuid(a3, "kPeerIdentifier");
    uuid_copy(buf, v36);
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A4F88);
    }
    __int16 v37 = off_1008D5F28;
    uint64_t v38 = sub_100241F94(buf);
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    sub_10002418C(v333, "HasBuiltinServices");
    sub_1005CCF08((uint64_t)v37, v39, (unsigned __int8 *)v333);
    if (v334 < 0) {
      operator delete(v333[0]);
    }
  }

  else if (!strcmp(a2, "PeerIsNotUsingBuiltinService"))
  {
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = 0LL;
    id v40 = xpc_dictionary_get_uuid(a3, "kPeerIdentifier");
    uuid_copy(buf, v40);
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A4F88);
    }
    unsigned int v41 = off_1008D5F28;
    __int128 v42 = sub_100241F94(buf);
    id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    sub_1005C9A38((uint64_t)v41, v43, @"HasBuiltinServices");
  }

  else
  {
    if (!strcmp(a2, "DisconnectClassicDevice"))
    {
      memset(buf, 0, 24);
      string = (char *)xpc_dictionary_get_string(a3, "kDeviceAddress");
      sub_10002418C(buf, string);
      *(_WORD *)&v340[4] = 0;
      *(_DWORD *)v340 = 0;
      if (buf[23] >= 0) {
        id v45 = buf;
      }
      else {
        id v45 = *(unsigned __int8 **)buf;
      }
      if (!sub_1003FE1A4((uint64_t)v340, v45))
      {
        if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
          sub_1006A0B20();
        }
        goto LABEL_135;
      }

      if (qword_1008D5F50 != -1) {
        dispatch_once(&qword_1008D5F50, &stru_1008A4FA8);
      }
      unsigned int v46 = sub_1003FFEB0(off_1008D5F48, (uint64_t)v340, 1);
      if (!v46)
      {
        uint64_t v52 = (os_log_s *)qword_1008F75A0;
        if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
        {
          sub_1003FE1B4(v340, &dst);
          sub_1006A0AB0((char *)&dst, (uint8_t *)&v342, v52);
        }

        goto LABEL_135;
      }

      if (qword_1008D67E8 != -1) {
        dispatch_once(&qword_1008D67E8, &stru_1008A4FE8);
      }
      if (sub_1003C9A50((uint64_t)off_1008D67E0, (uint64_t)v46))
      {
        if (qword_1008D60D0 != -1) {
          dispatch_once(&qword_1008D60D0, &stru_1008A5008);
        }
        sub_1004287C4((int64x2_t *)off_1008D60C8, (uint64_t)v46, -1);
        goto LABEL_135;
      }

      uint64_t v53 = qword_1008F75A0;
      if (!os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_135;
      }
      sub_1003CF00C((uint64_t)v46, &dst);
      if ((dst.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_std::string dst = &dst;
      }
      else {
        p_std::string dst = (std::string *)dst.__r_.__value_.__r.__words[0];
      }
      LODWORD(v342.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)v342.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_dst;
      unsigned int v55 = "Ignoring disconnection request as device %{public}s is not connected";
      CFUserNotificationRef v56 = &v342;
      id v57 = (os_log_s *)v53;
      uint32_t v58 = 12;
      goto LABEL_101;
    }

    if (!strcmp(a2, "EnableBTSync"))
    {
      __int16 v47 = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  xpc_dictionary_get_uuid(a3, "kPeerIdentifier"));
      unsigned __int16 v48 = xpc_dictionary_get_int64(a3, "kPeriod");
      uint64_t v49 = sub_1002E6E9C();
      (*(void (**)(uint64_t, NSUUID *, void))(*(void *)v49 + 936LL))(v49, v47, v48);

      return;
    }

    if (!strcmp(a2, "DevMgmtPipeConnected"))
    {
      uint64_t v50 = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  xpc_dictionary_get_uuid(a3, "kPeerIdentifier"));
      if (qword_1008D6198 != -1) {
        dispatch_once(&qword_1008D6198, &stru_1008A5028);
      }
      sub_1004483EC((uint64_t)off_1008D6190, 1LL);
      [*(id *)(a1 + 16) addObject:v50];
      if (qword_1008D60E0 != -1) {
        dispatch_once(&qword_1008D60E0, &stru_1008A5048);
      }
      sub_10021F634((uint64_t)off_1008D60D8, v50);
      if (qword_1008D9B20 != -1) {
        dispatch_once(&qword_1008D9B20, &stru_1008A5068);
      }
      sub_1004C0ECC((_BYTE *)qword_1008D9B18, v50);
    }

    else
    {
      if (strcmp(a2, "DevMgmtPipeDisconnected"))
      {
        if (!strcmp(a2, "VersionInfoRequest"))
        {
          unsigned __int8 v60 = xpc_dictionary_get_int64(a3, "kEasyPairingVersion");
          memset(buf, 0, 24);
          __int16 v61 = (char *)xpc_dictionary_get_string(a3, "kCloudAccount");
          sub_10002418C(buf, v61);
          if (qword_1008D9040 != -1) {
            dispatch_once(&qword_1008D9040, &stru_1008A5088);
          }
          uint64_t v62 = qword_1008D9038;
          if ((buf[23] & 0x80000000) != 0) {
            sub_100024238(&__dst, *(void **)buf, *(unint64_t *)&buf[8]);
          }
          else {
            __std::string dst = *(std::string *)buf;
          }
          sub_1001FFBEC(v62, v60, &__dst);
          id v59 = (void *)__dst.__r_.__value_.__r.__words[0];
          goto LABEL_134;
        }

        if (!strcmp(a2, "VersionInfoResponse"))
        {
          unsigned __int8 v63 = xpc_dictionary_get_int64(a3, "kEasyPairingVersion");
          memset(buf, 0, 24);
          __int128 v64 = (char *)xpc_dictionary_get_string(a3, "kCloudAccount");
          sub_10002418C(buf, v64);
          unsigned __int8 v65 = xpc_dictionary_get_int64(a3, "kEasyPairingStatus");
          if (qword_1008D9040 != -1) {
            dispatch_once(&qword_1008D9040, &stru_1008A5088);
          }
          uint64_t v66 = qword_1008D9038;
          if ((buf[23] & 0x80000000) != 0) {
            sub_100024238(&v331, *(void **)buf, *(unint64_t *)&buf[8]);
          }
          else {
            std::string v331 = *(std::string *)buf;
          }
          sub_1002000B0(v66, v63, &v331, v65);
          id v59 = (void *)v331.__r_.__value_.__r.__words[0];
          goto LABEL_134;
        }

        if (!strcmp(a2, "ClassicPairStateRequest"))
        {
          memset(buf, 0, 24);
          id v67 = (char *)xpc_dictionary_get_string(a3, "kDeviceAddress");
          sub_10002418C(buf, v67);
          WORD2(dst.__r_.__value_.__r.__words[0]) = 0;
          LODWORD(dst.__r_.__value_.__l.__data_) = 0;
          if (buf[23] >= 0) {
            id v68 = buf;
          }
          else {
            id v68 = *(unsigned __int8 **)buf;
          }
          if (sub_1003FE1A4((uint64_t)&dst, v68))
          {
            if (qword_1008D9040 != -1) {
              dispatch_once(&qword_1008D9040, &stru_1008A5088);
            }
            sub_1002001C4(qword_1008D9038, (uint64_t)&dst);
          }

          else if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR))
          {
            sub_1006A0B4C();
          }

          goto LABEL_135;
        }

        if (!strcmp(a2, "ClassicPairStateResponse"))
        {
          memset(buf, 0, 24);
          id v69 = (char *)xpc_dictionary_get_string(a3, "kDeviceAddress");
          sub_10002418C(buf, v69);
          unsigned __int8 v70 = xpc_dictionary_get_int64(a3, "kDevicePairState");
          WORD2(dst.__r_.__value_.__r.__words[0]) = 0;
          LODWORD(dst.__r_.__value_.__l.__data_) = 0;
          if (buf[23] >= 0) {
            unint64_t v71 = buf;
          }
          else {
            unint64_t v71 = *(unsigned __int8 **)buf;
          }
          if (sub_1003FE1A4((uint64_t)&dst, v71))
          {
            if (qword_1008D5F50 != -1) {
              dispatch_once(&qword_1008D5F50, &stru_1008A4FA8);
            }
            char v72 = sub_1003FFEB0(off_1008D5F48, (uint64_t)&dst, 1);
            if (qword_1008D60E0 != -1) {
              dispatch_once(&qword_1008D60E0, &stru_1008A5048);
            }
            sub_10021FDD4((uint64_t)off_1008D60D8, (uint64_t)v72, v70);
          }

          else if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR))
          {
            sub_1006A0B78();
          }

          goto LABEL_135;
        }

        if (!strcmp(a2, "StoreClassicLinkKeyRequest"))
        {
          memset(buf, 0, 24);
          char v74 = (char *)xpc_dictionary_get_string(a3, "kDeviceAddress");
          sub_10002418C(buf, v74);
          memset(&dst, 0, sizeof(dst));
          id v75 = (char *)xpc_dictionary_get_string(a3, "kDeviceName");
          sub_10002418C(&dst, v75);
          xpc_object_t value = xpc_dictionary_get_value(a3, "kDeviceLinkKey");
          WORD2(v337) = 0;
          LODWORD(v337) = 0;
          if (buf[23] >= 0) {
            uint64_t v77 = buf;
          }
          else {
            uint64_t v77 = *(unsigned __int8 **)buf;
          }
          if (!sub_1003FE1A4((uint64_t)&v337, v77))
          {
            if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR)) {
              sub_1006A0C54();
            }
            if ((buf[23] & 0x80000000) != 0)
            {
              sub_100024238(&v329, *(void **)buf, *(unint64_t *)&buf[8]);
            }

            else
            {
              __int128 v329 = *(_OWORD *)buf;
              uint64_t v330 = *(void *)&buf[16];
            }

            sub_100644198(a1, (const char *)&v329, 1u);
            if ((SHIBYTE(v330) & 0x80000000) == 0) {
              goto LABEL_102;
            }
            v118 = (void *)v329;
            goto LABEL_318;
          }

          size_t count = xpc_array_get_count(value);
          if (!value || count != 16)
          {
            if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR)) {
              sub_1006A0BA4();
            }
            if ((buf[23] & 0x80000000) != 0)
            {
              sub_100024238(&v327, *(void **)buf, *(unint64_t *)&buf[8]);
            }

            else
            {
              __int128 v327 = *(_OWORD *)buf;
              uint64_t v328 = *(void *)&buf[16];
            }

            sub_100644198(a1, (const char *)&v327, 1u);
            if ((SHIBYTE(v328) & 0x80000000) == 0) {
              goto LABEL_102;
            }
            v118 = (void *)v327;
            goto LABEL_318;
          }

          size_t v79 = 0LL;
          __int128 v345 = 0uLL;
          uint64_t v343 = 0LL;
          uint64_t v344 = 0LL;
          do
          {
            *((_BYTE *)&v345 + v79) = xpc_array_get_int64(value, v79);
            ++v79;
          }

          while (v79 != 16);
          if (qword_1008D5F50 != -1) {
            dispatch_once(&qword_1008D5F50, &stru_1008A4FA8);
          }
          unint64_t v80 = (unsigned __int8 *)sub_1003FFEB0(off_1008D5F48, (uint64_t)&v337, 1);
          uint64_t v81 = (std::string *)v80;
          if ((void)v345 != v343 || *((void *)&v345 + 1) != v344)
          {
            memset(v340, 0, 20);
            sub_10052523C((uint64_t)v340);
            if (qword_1008D67B8 != -1) {
              dispatch_once(&qword_1008D67B8, &stru_1008A50A8);
            }
            if (qword_1008D60C0 != -1) {
              dispatch_once(&qword_1008D60C0, &stru_1008A50C8);
            }
            if ((sub_1003EE52C((uint64_t)off_1008D60B8, (uint64_t)v81) & 1) == 0)
            {
              sub_10052525C((uint64_t)&v342, &v345, 5u);
              sub_100525248((__n128 *)v340, (__n128 *)&v342);
              nullsub_63(&v342, v149);
              if (qword_1008D67B8 != -1) {
                dispatch_once(&qword_1008D67B8, &stru_1008A50A8);
              }
              int v150 = sub_10053584C((uint64_t)off_1008D67B0, (unsigned __int8 *)v81, (__n128 *)v340, 0);
              if (v150)
              {
                unsigned int v84 = 1;
              }

              else
              {
                v294 = 0LL;
                *(_OWORD *)&v342.__r_.__value_.__l.__data_ = 0uLL;
                sub_1000B0400((uint64_t)&v294);
                v342.__r_.__value_.__r.__words[0] = (int)v294;
                v342.__r_.__value_.__l.__size_ = SWORD2(v294);
                sub_1003D0F60(v81, &dst, &v342);
                unsigned int v84 = 0;
              }

              v206 = (os_log_s *)qword_1008F7600;
              if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
              {
                v207 = "Failed to store";
                if (!v150) {
                  v207 = "Successfully stored";
                }
                v208 = buf;
                if (buf[23] < 0) {
                  v208 = *(_BYTE **)buf;
                }
                LODWORD(v342.__r_.__value_.__l.__data_) = 136315394;
                *(std::string::size_type *)((char *)v342.__r_.__value_.__r.__words + 4) = (std::string::size_type)v207;
                WORD2(v342.__r_.__value_.__r.__words[1]) = 2080;
                *(std::string::size_type *)((char *)&v342.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v208;
                _os_log_impl( (void *)&_mh_execute_header,  v206,  OS_LOG_TYPE_DEFAULT,  "%s classic link key for address %s",  (uint8_t *)&v342,  0x16u);
              }
            }

            else
            {
LABEL_161:
              int v83 = (os_log_s *)qword_1008F7600;
              unsigned int v84 = 0;
              if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
              {
                if (qword_1008D60C0 != -1) {
                  dispatch_once(&qword_1008D60C0, &stru_1008A50C8);
                }
                int v85 = sub_1003EE52C((uint64_t)off_1008D60B8, (uint64_t)v81);
                uint64_t v86 = buf;
                if (buf[23] < 0) {
                  uint64_t v86 = *(_BYTE **)buf;
                }
                LODWORD(v342.__r_.__value_.__l.__data_) = 67109378;
                HIDWORD(v342.__r_.__value_.__r.__words[0]) = v85;
                LOWORD(v342.__r_.__value_.__r.__words[1]) = 2080;
                *(std::string::size_type *)((char *)&v342.__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)v86;
                _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "Already stored classic link key (Magic Paired: %d) for address: %s",  (uint8_t *)&v342,  0x12u);
                unsigned int v84 = 0;
              }
            }

            if ((buf[23] & 0x80000000) != 0)
            {
              sub_100024238(&v325, *(void **)buf, *(unint64_t *)&buf[8]);
            }

            else
            {
              __int128 v325 = *(_OWORD *)buf;
              uint64_t v326 = *(void *)&buf[16];
            }

            sub_100644198(a1, (const char *)&v325, v84);
            if ((SHIBYTE(v326) & 0x80000000) == 0) {
              goto LABEL_570;
            }
            v210 = (void *)v325;
            goto LABEL_569;
          }

          if (v80 && sub_1003CF350(v80))
          {
            if (qword_1008D60E0 != -1) {
              dispatch_once(&qword_1008D60E0, &stru_1008A5048);
            }
            *((_BYTE *)off_1008D60D8 + 431) = 2;
            if (qword_1008D60C0 != -1) {
              dispatch_once(&qword_1008D60C0, &stru_1008A50C8);
            }
            int v140 = sub_1003EE52C((uint64_t)off_1008D60B8, (uint64_t)v81);
            BOOL v141 = os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR);
            if (v140)
            {
              if (v141) {
                sub_1006A0BFC();
              }
              if (qword_1008D60C0 == -1) {
                goto LABEL_300;
              }
LABEL_692:
              dispatch_once(&qword_1008D60C0, &stru_1008A50C8);
LABEL_300:
              sub_1003EE5AC((uint64_t)off_1008D60B8, (unsigned __int8 *)v81, 0);
              goto LABEL_102;
            }

            if (v141) {
              sub_1006A0C28();
            }
            if (qword_1008D67A8 == -1)
            {
LABEL_489:
              sub_10052F37C((uint64_t)off_1008D67A0, (unsigned __int8 *)v81);
              goto LABEL_102;
            }

LABEL_693:
            dispatch_once(&qword_1008D67A8, &stru_1008A50E8);
            goto LABEL_489;
          }

          if (!os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR)) {
            goto LABEL_102;
          }
        }

        else
        {
          if (strcmp(a2, "StoreClassicLinkKeyRequestExtended"))
          {
            if (!strcmp(a2, "StoreClassicLinkKeyResponse"))
            {
              memset(buf, 0, 24);
              v103 = (char *)xpc_dictionary_get_string(a3, "kDeviceAddress");
              sub_10002418C(buf, v103);
              unsigned __int8 v104 = xpc_dictionary_get_int64(a3, "kStoreClassicLinkKeyResult");
              WORD2(dst.__r_.__value_.__r.__words[0]) = 0;
              LODWORD(dst.__r_.__value_.__l.__data_) = 0;
              if (buf[23] >= 0) {
                unint64_t v105 = buf;
              }
              else {
                unint64_t v105 = *(unsigned __int8 **)buf;
              }
              if (sub_1003FE1A4((uint64_t)&dst, v105))
              {
                if (qword_1008D5F50 != -1) {
                  dispatch_once(&qword_1008D5F50, &stru_1008A4FA8);
                }
                uint64_t v106 = sub_1003FFEB0(off_1008D5F48, (uint64_t)&dst, 1);
                if (qword_1008D60E0 != -1) {
                  dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                }
                sub_10021FE8C((uint64_t)off_1008D60D8, (uint64_t)v106, v104);
              }

              else if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR))
              {
                sub_1006A0C80();
              }

              goto LABEL_135;
            }

            if (!strcmp(a2, "StoreClassicDeviceSettings"))
            {
              memset(buf, 0, 24);
              unint64_t v107 = (char *)xpc_dictionary_get_string(a3, "kDeviceAddress");
              sub_10002418C(buf, v107);
              WORD2(v345) = 0;
              LODWORD(v345) = 0;
              if (buf[23] >= 0) {
                v108 = buf;
              }
              else {
                v108 = *(unsigned __int8 **)buf;
              }
              if (!sub_1003FE1A4((uint64_t)&v345, v108))
              {
                if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
                  sub_1006A0D48();
                }
                goto LABEL_135;
              }

              int64_t v109 = xpc_dictionary_get_int64(a3, "kClassicDeviceMicMode");
              int64_t v110 = xpc_dictionary_get_int64(a3, "kClassicDeviceInEarEnable");
              int v111 = xpc_dictionary_get_int64(a3, "kClassicDeviceDoubleTapMode");
              xpc_object_t v112 = xpc_dictionary_get_value(a3, "kClassicDeviceSettings");
              xpc_object_t v273 = v112;
              if (v112)
              {
                uint64_t v113 = sub_10043E46C(v112);
                unint64_t v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
                uint64_t v115 = (void *)objc_claimAutoreleasedReturnValue([v114 allKeys]);
                unsigned int v116 = [v115 containsObject:@"kCfgDoubleClickInt"];

                if (v116)
                {
                  v117 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKey:@"kCfgDoubleClickInt"]);
                  unsigned int v275 = [v117 intValue];
                }

                else
                {
                  unsigned int v275 = -1;
                }

                v151 = (void *)objc_claimAutoreleasedReturnValue([v114 allKeys]);
                unsigned int v152 = [v151 containsObject:@"kCfgClickHold"];

                if (v152)
                {
                  v153 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKey:@"kCfgClickHold"]);
                  unsigned int v277 = [v153 intValue];
                }

                else
                {
                  unsigned int v277 = -1;
                }

                v154 = (void *)objc_claimAutoreleasedReturnValue([v114 allKeys]);
                unsigned int v155 = [v154 containsObject:@"kCfgClickHoldInt"];

                if (v155)
                {
                  v156 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKey:@"kCfgClickHoldInt"]);
                  unsigned int v274 = [v156 intValue];
                }

                else
                {
                  unsigned int v274 = -1;
                }

                v157 = (void *)objc_claimAutoreleasedReturnValue([v114 allKeys]);
                unsigned int v158 = [v157 containsObject:@"kCfgListenModeCfgs"];

                if (v158)
                {
                  v159 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKey:@"kCfgListenModeCfgs"]);
                  unsigned int v276 = [v159 intValue];
                }

                else
                {
                  unsigned int v276 = -1;
                }

                v160 = (void *)objc_claimAutoreleasedReturnValue([v114 allKeys]);
                unsigned int v161 = [v160 containsObject:@"kCfgOneBudANCMode"];

                if (v161)
                {
                  v162 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKey:@"kCfgOneBudANCMode"]);
                  unsigned int v272 = [v162 intValue];
                }

                else
                {
                  unsigned int v272 = -1;
                }

                v163 = (void *)objc_claimAutoreleasedReturnValue([v114 allKeys]);
                unsigned int v164 = [v163 containsObject:@"kCfgListenMode"];

                if (v164)
                {
                  v165 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKey:@"kCfgListenMode"]);
                  uint64_t v148 = (uint64_t)[v165 intValue];
                }

                else
                {
                  uint64_t v148 = 0xFFFFFFFFLL;
                }
              }

              else
              {
                unsigned int v274 = -1;
                unsigned int v275 = -1;
                unsigned int v276 = -1;
                unsigned int v277 = -1;
                unsigned int v272 = -1;
                uint64_t v148 = 0xFFFFFFFFLL;
              }

              memset(&dst, 0, sizeof(dst));
              v166 = (char *)xpc_dictionary_get_string(a3, "kDeviceName");
              sub_10002418C(&dst, v166);
              if (qword_1008D5F50 != -1) {
                dispatch_once(&qword_1008D5F50, &stru_1008A4FA8);
              }
              v167 = (unsigned __int8 *)sub_1003FFEB0(off_1008D5F48, (uint64_t)&v345, 1);
              uint64_t v168 = (uint64_t)v167;
              if (v167 && sub_1003CF350(v167))
              {
                if ((v110 != 0) != sub_1003DF944(v168) && sub_1003D2B2C(v168, 1))
                {
                  if (qword_1008D60E0 != -1) {
                    dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                  }
                  sub_100220DDC((uint64_t)off_1008D60D8, v168, v110 != 0, 3u);
                }

                if (sub_1003DF900(v168) != (_DWORD)v109)
                {
                  if (qword_1008D60E0 != -1) {
                    dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                  }
                  sub_1002209A8((uint64_t)off_1008D60D8, v168, v109, 3u);
                }

                if (sub_1003D635C(v168) != v111 && sub_1003D2B2C(v168, 14))
                {
                  if (qword_1008D60E0 != -1) {
                    dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                  }
                  sub_100220C0C((uint64_t)off_1008D60D8, v168, BYTE1(v111), v111, 3);
                }

                sub_1003D0100(v168, (uint64_t)&v342);
                BOOL v169 = sub_1006487E4((unsigned __int8 *)&v342, (unsigned __int8 *)&dst);
                if (v169)
                {
                  v170 = (os_log_s *)qword_1008F75A0;
                  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
                  {
                    sub_1003D0100(v168, (uint64_t)&v342);
                    if ((v342.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                      v171 = &v342;
                    }
                    else {
                      v171 = (std::string *)v342.__r_.__value_.__r.__words[0];
                    }
                    v172 = &dst;
                    if ((dst.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                      v172 = (std::string *)dst.__r_.__value_.__r.__words[0];
                    }
                    *(_DWORD *)v340 = 136315394;
                    *(void *)&v340[4] = v171;
                    *(_WORD *)&v340[12] = 2080;
                    *(void *)&v340[14] = v172;
                    _os_log_impl( (void *)&_mh_execute_header,  v170,  OS_LOG_TYPE_DEFAULT,  "StoreClassicDeviceSettings update Device name on Watch side only, oldName = %s, newName = %s",  v340,  0x16u);
                  }

                  sub_1003D17B0(v168, &dst, 0);
                  sub_1003D2200(v168, (uint64_t *)&dst);
                }

                if (v273)
                {
                  if (v277 != -1 && sub_1003DFBD0(v168) != v277 && sub_1003D2B2C(v168, 30))
                  {
                    if (qword_1008D60E0 != -1) {
                      dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                    }
                    sub_100215778((uint64_t)off_1008D60D8, v168, 22LL, v277, 3u);
                  }

                  char v173 = sub_1003D2B2C(v168, 43);
                  if (v275 == -1) {
                    char v174 = 1;
                  }
                  else {
                    char v174 = v173;
                  }
                  if ((v174 & 1) == 0
                    && sub_1003DFC14(v168) != v275
                    && ((sub_1003D2B2C(v168, 29) & 1) != 0 || sub_1003E0230(v168, 128)))
                  {
                    if (qword_1008D60E0 != -1) {
                      dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                    }
                    sub_100215778((uint64_t)off_1008D60D8, v168, 23LL, v275, 3u);
                  }

                  char v175 = sub_1003D2B2C(v168, 43);
                  if (v274 == -1) {
                    char v176 = 1;
                  }
                  else {
                    char v176 = v175;
                  }
                  if ((v176 & 1) == 0
                    && sub_1003DFC58(v168) != v274
                    && ((sub_1003D2B2C(v168, 30) & 1) != 0 || sub_1003E0230(v168, 128)))
                  {
                    if (qword_1008D60E0 != -1) {
                      dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                    }
                    sub_100215778((uint64_t)off_1008D60D8, v168, 24LL, v274, 3u);
                  }

                  if (v276 != -1 && sub_1003DFA7C(v168) != v276 && sub_1003D2B2C(v168, 28))
                  {
                    if (qword_1008D60E0 != -1) {
                      dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                    }
                    sub_100215778((uint64_t)off_1008D60D8, v168, 26LL, v276, 3u);
                  }

                  char v177 = sub_1003D2B2C(v168, 43);
                  if (v272 == -1) {
                    char v178 = 1;
                  }
                  else {
                    char v178 = v177;
                  }
                  if ((v178 & 1) == 0
                    && v272 != sub_1003DFC9C(v168)
                    && sub_1003D2B2C(v168, 16)
                    && sub_1003D2B2C(v168, 1))
                  {
                    if (qword_1008D60E0 != -1) {
                      dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                    }
                    sub_100215778((uint64_t)off_1008D60D8, v168, 27LL, v272, 3u);
                  }

                  if ((_DWORD)v148 != -1
                    && sub_1003DFA38(v168) != (_DWORD)v148
                    && sub_1003D2B2C(v168, 16)
                    && sub_1003D2B2C(v168, 17))
                  {
                    if (qword_1008D60E0 != -1) {
                      dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                    }
                    sub_100215778((uint64_t)off_1008D60D8, v168, 13LL, v148, 3u);
                  }
                }
              }

              else
              {
                v179 = (os_log_s *)qword_1008F75A0;
                if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR)) {
                  sub_1006A0CAC(&buf[23], buf, v179);
                }
              }

              goto LABEL_102;
            }

            if (!strcmp(a2, "ClassicDeviceUnexpectedDisconnection"))
            {
              memset(buf, 0, 24);
              int v119 = (char *)xpc_dictionary_get_string(a3, "kDeviceAddress");
              sub_10002418C(buf, v119);
              *(_WORD *)&v340[4] = 0;
              *(_DWORD *)v340 = 0;
              if (buf[23] >= 0) {
                v120 = buf;
              }
              else {
                v120 = *(unsigned __int8 **)buf;
              }
              if (sub_1003FE1A4((uint64_t)v340, v120))
              {
                if (qword_1008D5F50 != -1) {
                  dispatch_once(&qword_1008D5F50, &stru_1008A4FA8);
                }
                v121 = (unsigned __int8 *)sub_1003FFEB0(off_1008D5F48, (uint64_t)v340, 1);
                uint64_t v122 = (uint64_t)v121;
                if (v121 && sub_1003CF350(v121))
                {
                  unint64_t v123 = (os_log_s *)qword_1008F7600;
                  if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
                  {
                    sub_1003CF00C(v122, &dst);
                    int size = (char)dst.__r_.__value_.__s.__size_;
                    std::string::size_type v125 = dst.__r_.__value_.__r.__words[0];
                    BOOL v126 = sub_1003D0670(v122);
                    v127 = &dst;
                    int v128 = "not";
                    if (size < 0) {
                      v127 = (std::string *)v125;
                    }
                    if (v126) {
                      int v128 = "is";
                    }
                    LODWORD(v342.__r_.__value_.__l.__data_) = 136446466;
                    *(std::string::size_type *)((char *)v342.__r_.__value_.__r.__words + 4) = (std::string::size_type)v127;
                    WORD2(v342.__r_.__value_.__r.__words[1]) = 2080;
                    *(std::string::size_type *)((char *)&v342.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v128;
                    _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_DEFAULT,  "ClassicDeviceUnexpectedDisconnection: device %{public}s %s connected",  (uint8_t *)&v342,  0x16u);
                  }

                  if (sub_1003D0670(v122))
                  {
                    if (qword_1008D60E0 != -1) {
                      dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                    }
                    sub_100220924((uint64_t)off_1008D60D8, v122);
                  }
                }

                else if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR))
                {
                  sub_1006A0D74();
                }
              }

              else if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR))
              {
                sub_1006A0DA0();
              }

              goto LABEL_135;
            }

            if (strcmp(a2, "ConnectClassicDevice"))
            {
              if (!strcmp(a2, "NotifyPrimaryBudSide"))
              {
                memset(buf, 0, 24);
                uint64_t v142 = (char *)xpc_dictionary_get_string(a3, "kDeviceAddress");
                sub_10002418C(buf, v142);
                unsigned __int8 v143 = xpc_dictionary_get_int64(a3, "kPrimaryBudSide");
                WORD2(dst.__r_.__value_.__r.__words[0]) = 0;
                LODWORD(dst.__r_.__value_.__l.__data_) = 0;
                if (buf[23] >= 0) {
                  v144 = buf;
                }
                else {
                  v144 = *(unsigned __int8 **)buf;
                }
                if (sub_1003FE1A4((uint64_t)&dst, v144))
                {
                  if (qword_1008D5F50 != -1) {
                    dispatch_once(&qword_1008D5F50, &stru_1008A4FA8);
                  }
                  v145 = sub_1003FFEB0(off_1008D5F48, (uint64_t)&dst, 1);
                  if (v145)
                  {
                    if (qword_1008D60E0 != -1) {
                      dispatch_once(&qword_1008D60E0, &stru_1008A5048);
                    }
                    sub_100221254((uint64_t)off_1008D60D8, (uint64_t)v145, v143);
                  }
                }

                else if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_ERROR))
                {
                  sub_1006A0DF8();
                }

                goto LABEL_135;
              }

              if (strcmp(a2, "LeaEasyPairRequest"))
              {
                if (!strcmp(a2, "LeaEasyPairResponse"))
                {
                  memset(buf, 0, 24);
                  v186 = (char *)xpc_dictionary_get_string(a3, "kLeaDeviceAddress");
                  sub_10002418C(buf, v186);
                  unsigned __int8 v187 = xpc_dictionary_get_int64(a3, "kLeaDevicePairState");
                  v188 = (os_log_s *)qword_1008F75A0;
                  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(dst.__r_.__value_.__l.__data_) = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v188,  OS_LOG_TYPE_DEFAULT,  "Received LeaEasyPairResponse",  (uint8_t *)&dst,  2u);
                  }

                  WORD2(dst.__r_.__value_.__r.__words[0]) = 0;
                  LODWORD(dst.__r_.__value_.__l.__data_) = 0;
                  if (buf[23] >= 0) {
                    v189 = buf;
                  }
                  else {
                    v189 = *(unsigned __int8 **)buf;
                  }
                  if (sub_1003FE1A4((uint64_t)&dst, v189))
                  {
                    if (qword_1008D9B20 != -1) {
                      dispatch_once(&qword_1008D9B20, &stru_1008A5068);
                    }
                    int data = (int)dst.__r_.__value_.__l.__data_;
                    __int16 v310 = WORD2(dst.__r_.__value_.__r.__words[0]);
                    sub_1004C1224(qword_1008D9B18, (unsigned __int8 *)&data, v187);
                    goto LABEL_135;
                  }

                  v234 = (os_log_s *)qword_1008F75A0;
                  if (os_log_type_enabled((os_log_t)qword_1008F75A0, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v342.__r_.__value_.__l.__data_) = 0;
                    v235 = "Received invalid device address on LeaEasyPairResponse";
LABEL_600:
                    _os_log_impl((void *)&_mh_execute_header, v234, OS_LOG_TYPE_DEFAULT, v235, (uint8_t *)&v342, 2u);
                  }

LABEL_338:
            v73 = (void *)dst.__r_.__value_.__r.__words[0];
LABEL_137:
            operator delete(v73);
            return;
          }

          memset(buf, 0, 24);
          unint64_t v87 = (char *)xpc_dictionary_get_string(a3, "kDeviceAddress");
          sub_10002418C(buf, v87);
          memset(&dst, 0, sizeof(dst));
          uint64_t v88 = (char *)xpc_dictionary_get_string(a3, "kDeviceName");
          sub_10002418C(&dst, v88);
          xpc_object_t v89 = xpc_dictionary_get_value(a3, "kDeviceLinkKey");
          int v90 = xpc_dictionary_get_int64(a3, "kDeviceServiceMask");
          int64_t v91 = xpc_dictionary_get_int64(a3, "kClassOfDeviceMask");
          WORD2(v337) = 0;
          LODWORD(v337) = 0;
          if (buf[23] >= 0) {
            int v92 = buf;
          }
          else {
            int v92 = *(unsigned __int8 **)buf;
          }
          if (!sub_1003FE1A4((uint64_t)&v337, v92))
          {
            if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR)) {
              sub_1006A0C54();
            }
            if ((buf[23] & 0x80000000) != 0)
            {
              sub_100024238(&v323, *(void **)buf, *(unint64_t *)&buf[8]);
            }

            else
            {
              __int128 v323 = *(_OWORD *)buf;
              uint64_t v324 = *(void *)&buf[16];
            }

            sub_100644198(a1, (const char *)&v323, 1u);
            if ((SHIBYTE(v324) & 0x80000000) == 0) {
              goto LABEL_102;
            }
            v118 = (void *)v323;
            goto LABEL_318;
          }

          size_t v93 = xpc_array_get_count(v89);
          if (!v89 || v93 != 16)
          {
            if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR)) {
              sub_1006A0BA4();
            }
            if ((buf[23] & 0x80000000) != 0)
            {
              sub_100024238(v321, *(void **)buf, *(unint64_t *)&buf[8]);
            }

            else
            {
              *(_OWORD *)v321 = *(_OWORD *)buf;
              uint64_t v322 = *(void *)&buf[16];
            }

            sub_100644198(a1, (const char *)v321, 1u);
            if ((SHIBYTE(v322) & 0x80000000) == 0) {
              goto LABEL_102;
            }
            v118 = v321[0];
            goto LABEL_318;
          }

          size_t v94 = 0LL;
          __int128 v345 = 0uLL;
          uint64_t v343 = 0LL;
          uint64_t v344 = 0LL;
          do
          {
            *((_BYTE *)&v345 + v94) = xpc_array_get_int64(v89, v94);
            ++v94;
          }

          while (v94 != 16);
          if (qword_1008D5F50 != -1) {
            dispatch_once(&qword_1008D5F50, &stru_1008A4FA8);
          }
          uint64_t v95 = (unsigned __int8 *)sub_1003FFEB0(off_1008D5F48, (uint64_t)&v337, 1);
          uint64_t v81 = (std::string *)v95;
          if ((void)v345 != v343 || *((void *)&v345 + 1) != v344)
          {
            if ((_DWORD)v91)
            {
              if (qword_1008D5F50 != -1) {
                dispatch_once(&qword_1008D5F50, &stru_1008A4FA8);
              }
              sub_1004006DC((uint64_t)off_1008D5F48, (uint64_t)v81, v91);
            }

            if (v90)
            {
              unsigned int v97 = 0;
              do
              {
                int v98 = 1 << v97;
                if (((1 << v97) & v90) != 0)
                {
                  *(void *)v340 = 0LL;
                  *(_OWORD *)&v342.__r_.__value_.__l.__data_ = 0uLL;
                  sub_1000B0400((uint64_t)v340);
                  v342.__r_.__value_.__r.__words[0] = *(int *)v340;
                  v342.__r_.__value_.__l.__size_ = *(__int16 *)&v340[4];
                  sub_1003D1FC4((uint64_t)v81, v98 & v90, 4, &v342, 0);
                }

                if (v97 > 0x1E) {
                  break;
                }
                v90 &= ~v98;
                ++v97;
              }

              while (v90);
            }

            memset(v340, 0, 20);
            sub_10052523C((uint64_t)v340);
            if (qword_1008D67B8 != -1) {
              dispatch_once(&qword_1008D67B8, &stru_1008A50A8);
            }
            if (qword_1008D60C0 != -1) {
              dispatch_once(&qword_1008D60C0, &stru_1008A50C8);
            }
            if ((sub_1003EE52C((uint64_t)off_1008D60B8, (uint64_t)v81) & 1) == 0)
            {
              sub_10052525C((uint64_t)&v342, &v345, 5u);
              sub_100525248((__n128 *)v340, (__n128 *)&v342);
              nullsub_63(&v342, v184);
              if (qword_1008D67B8 != -1) {
                dispatch_once(&qword_1008D67B8, &stru_1008A50A8);
              }
              int v185 = sub_10053584C((uint64_t)off_1008D67B0, (unsigned __int8 *)v81, (__n128 *)v340, 0);
              if (v185)
              {
                unsigned int v100 = 1;
              }

              else
              {
                v294 = 0LL;
                *(_OWORD *)&v342.__r_.__value_.__l.__data_ = 0uLL;
                sub_1000B0400((uint64_t)&v294);
                v342.__r_.__value_.__r.__words[0] = (int)v294;
                v342.__r_.__value_.__l.__size_ = SWORD2(v294);
                sub_1003D0F60(v81, &dst, &v342);
                unsigned int v100 = 0;
              }

              v238 = (os_log_s *)qword_1008F7600;
              if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
              {
                v239 = "Failed to store";
                if (!v185) {
                  v239 = "Successfully stored";
                }
                v240 = buf;
                if (buf[23] < 0) {
                  v240 = *(_BYTE **)buf;
                }
                LODWORD(v342.__r_.__value_.__l.__data_) = 136315394;
                *(std::string::size_type *)((char *)v342.__r_.__value_.__r.__words + 4) = (std::string::size_type)v239;
                WORD2(v342.__r_.__value_.__r.__words[1]) = 2080;
                *(std::string::size_type *)((char *)&v342.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v240;
                _os_log_impl( (void *)&_mh_execute_header,  v238,  OS_LOG_TYPE_DEFAULT,  "%s classic link key for address %s",  (uint8_t *)&v342,  0x16u);
              }
            }

            else
            {
LABEL_199:
              v99 = (os_log_s *)qword_1008F7600;
              unsigned int v100 = 0;
              if (os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_DEFAULT))
              {
                if (qword_1008D60C0 != -1) {
                  dispatch_once(&qword_1008D60C0, &stru_1008A50C8);
                }
                int v101 = sub_1003EE52C((uint64_t)off_1008D60B8, (uint64_t)v81);
                v102 = buf;
                if (buf[23] < 0) {
                  v102 = *(_BYTE **)buf;
                }
                LODWORD(v342.__r_.__value_.__l.__data_) = 67109378;
                HIDWORD(v342.__r_.__value_.__r.__words[0]) = v101;
                LOWORD(v342.__r_.__value_.__r.__words[1]) = 2080;
                *(std::string::size_type *)((char *)&v342.__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)v102;
                _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_DEFAULT,  "Already stored classic link key (Magic Paired: %d) for address: %s",  (uint8_t *)&v342,  0x12u);
                unsigned int v100 = 0;
              }
            }

            if ((buf[23] & 0x80000000) != 0)
            {
              sub_100024238(v319, *(void **)buf, *(unint64_t *)&buf[8]);
            }

            else
            {
              *(_OWORD *)v319 = *(_OWORD *)buf;
              uint64_t v320 = *(void *)&buf[16];
            }

            sub_100644198(a1, (const char *)v319, v100);
            if ((SHIBYTE(v320) & 0x80000000) == 0) {
              goto LABEL_570;
            }
            v210 = v319[0];
LABEL_569:
            operator delete(v210);
LABEL_570:
            nullsub_63(v340, v209);
            goto LABEL_102;
          }

          if (v95 && sub_1003CF350(v95))
          {
            if (qword_1008D60E0 != -1) {
              dispatch_once(&qword_1008D60E0, &stru_1008A5048);
            }
            *((_BYTE *)off_1008D60D8 + 431) = 2;
            if (qword_1008D60C0 != -1) {
              dispatch_once(&qword_1008D60C0, &stru_1008A50C8);
            }
            int v146 = sub_1003EE52C((uint64_t)off_1008D60B8, (uint64_t)v81);
            BOOL v147 = os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR);
            if (v146)
            {
              if (v147) {
                sub_1006A0BFC();
              }
              if (qword_1008D60C0 == -1) {
                goto LABEL_300;
              }
              goto LABEL_692;
            }

            if (v147) {
              sub_1006A0C28();
            }
            if (qword_1008D67A8 == -1) {
              goto LABEL_489;
            }
            goto LABEL_693;
          }

          if (!os_log_type_enabled((os_log_t)qword_1008F7600, OS_LOG_TYPE_ERROR)) {
            goto LABEL_102;
          }
        }

        sub_1006A0BD0();
        goto LABEL_102;
      }

      id v51 = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  xpc_dictionary_get_uuid(a3, "kPeerIdentifier"));
      if (qword_1008D6198 != -1) {
        dispatch_once(&qword_1008D6198, &stru_1008A5028);
      }
      sub_1004483EC((uint64_t)off_1008D6190, 0LL);
      [*(id *)(a1 + 16) removeObject:v51];
      if (qword_1008D60E0 != -1) {
        dispatch_once(&qword_1008D60E0, &stru_1008A5048);
      }
      sub_10021FADC((uint64_t)off_1008D60D8, v51);
      if (qword_1008D9B20 != -1) {
        dispatch_once(&qword_1008D9B20, &stru_1008A5068);
      }
      sub_1004C1048(qword_1008D9B18, v51);
    }
  }

void sub_1006481E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1006487E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0LL) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 1LL;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) != 0;
  }
  if (a1[23])
  {
    uint64_t v6 = v2 - 1;
    do
    {
      int v8 = *a1++;
      int v7 = v8;
      int v9 = *a2++;
      BOOL v10 = v7 == v9;
      uint64_t v2 = v7 != v9;
      BOOL v10 = !v10 || v6-- == 0;
    }

    while (!v10);
  }

  return v2;
}

void sub_100648878(uint64_t a1)
{
  if (qword_1008D6788 != -1) {
    dispatch_once(&qword_1008D6788, &stru_1008A5148);
  }
  if (sub_1002075B4((uint64_t)off_1008D6780) == 1)
  {
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A4F88);
    }
    id v2 = sub_1005D419C((uint64_t)off_1008D5F28);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v2);
    if ([v7 count]) {
      sub_100642768(a1, v7);
    }
    if (qword_1008D9278 != -1) {
      dispatch_once(&qword_1008D9278, &stru_1008A4F68);
    }
    if (sub_1004138A0(qword_1008D9270)) {
      sub_100644138(a1, 1);
    }
    id v3 = sub_100648A10();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v4) {
      (*(void (**)(uint64_t, void *))(*(void *)a1 + 48LL))(a1, v4);
    }
    id v5 = sub_100648D60();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (v6) {
      (*(void (**)(uint64_t, void *))(*(void *)a1 + 56LL))(a1, v6);
    }
  }

void sub_1006489DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100648A10()
{
  uint64_t v19 = 0LL;
  unsigned __int16 v20 = 0LL;
  uint64_t v21 = 0LL;
  if (qword_1008D67E8 != -1) {
    dispatch_once(&qword_1008D67E8, &stru_1008A4FE8);
  }
  sub_1003C9C48((uint64_t)off_1008D67E0, &v19);
  std::string __p = 0LL;
  double v17 = 0LL;
  double v18 = 0LL;
  __int128 v22 = xmmword_1006BDBF8;
  int v23 = 1729713604;
  sub_100634334(&v24, (__n128 *)&v22);
  uint64_t v0 = (char *)sub_100050420((uint64_t)&v18, 1uLL);
  id v2 = &v0[20 * v1];
  __n128 v3 = v24;
  *((_DWORD *)v0 + 4) = v25;
  *(__n128 *)uint64_t v0 = v3;
  uint64_t v4 = v0 + 20;
  uint64_t v6 = (char *)__p;
  id v5 = v17;
  if (v17 != __p)
  {
    do
    {
      __int128 v7 = *(_OWORD *)(v5 - 20);
      *((_DWORD *)v0 - 1) = *((_DWORD *)v5 - 1);
      *(_OWORD *)(v0 - 20) = v7;
      v0 -= 20;
      v5 -= 20;
    }

    while (v5 != v6);
    id v5 = (char *)__p;
  }

  std::string __p = v0;
  double v17 = v4;
  double v18 = v2;
  if (v5) {
    operator delete(v5);
  }
  double v17 = v4;
  int v8 = (uint64_t *)v19;
  if (v19 == v20)
  {
LABEL_16:
    id v13 = 0LL;
  }

  else
  {
    while (1)
    {
      uint64_t v9 = *v8;
      if (sub_1003D2B2C(*v8, 22))
      {
        __n128 v24 = 0uLL;
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_1008A4F88);
        }
        sub_1005D0B84((uint64_t)off_1008D5F28, (unsigned __int8 *)(v9 + 128), (unsigned __int8 *)&v24);
        if (qword_1008D5F60 != -1) {
          dispatch_once(&qword_1008D5F60, &stru_1008A5168);
        }
        uint64_t v10 = qword_1008D5F58;
        id v11 = sub_100241F94((const unsigned __int8 *)&v24);
        size_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        LODWORD(v10) = sub_10055679C(v10, v12, (__int128 **)&__p, 1u, 0LL, 0);

        if ((_DWORD)v10) {
          break;
        }
      }

      if (++v8 == v20) {
        goto LABEL_16;
      }
    }

    xpc_object_t v14 = sub_100241F94((const unsigned __int8 *)&v24);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  if (__p)
  {
    double v17 = (char *)__p;
    operator delete(__p);
  }

  if (v19)
  {
    unsigned __int16 v20 = (uint64_t *)v19;
    operator delete(v19);
  }

  return v13;
}

void sub_100648D0C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

id sub_100648D60()
{
  id v13 = 0LL;
  xpc_object_t v14 = 0LL;
  uint64_t v15 = 0LL;
  if (qword_1008D67E8 != -1) {
    dispatch_once(&qword_1008D67E8, &stru_1008A4FE8);
  }
  sub_1003C9C48((uint64_t)off_1008D67E0, &v13);
  uint64_t v1 = (uint64_t *)v13;
  id v2 = v14;
  if (v13 == v14)
  {
    uint64_t v0 = 0LL;
    if (!v13) {
      return v0;
    }
    goto LABEL_17;
  }

  while (1)
  {
    if (sub_1003D2B2C(*v1, 23))
    {
      v20[0] = 0LL;
      v20[1] = 0LL;
      if (qword_1008D5F30 != -1) {
        dispatch_once(&qword_1008D5F30, &stru_1008A4F88);
      }
      sub_1005D0B84((uint64_t)off_1008D5F28, (unsigned __int8 *)(*v1 + 128), (unsigned __int8 *)v20);
      std::string __p = 0LL;
      id v11 = 0LL;
      size_t v12 = 0LL;
      __int128 v16 = xmmword_1006BDC0C;
      int v17 = 2027922698;
      sub_100634334(&v18, (__n128 *)&v16);
      __n128 v3 = (__n128 *)operator new(0x14uLL);
      id v11 = &v3[1].n128_u8[4];
      size_t v12 = &v3[1].n128_i8[4];
      *__n128 v3 = v18;
      v3[1].n128_u32[0] = v19;
      std::string __p = v3;
      if (qword_1008D5F60 != -1) {
        dispatch_once(&qword_1008D5F60, &stru_1008A5168);
      }
      uint64_t v4 = qword_1008D5F58;
      id v5 = sub_100241F94((const unsigned __int8 *)v20);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      int v7 = sub_10055679C(v4, v6, (__int128 **)&__p, 1u, 0LL, 1);

      if (v7)
      {
        int v8 = sub_100241F94((const unsigned __int8 *)v20);
        uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(v8);
      }

      if (__p)
      {
        id v11 = (unsigned __int8 *)__p;
        operator delete(__p);
      }

      if ((v7 & 1) != 0) {
        break;
      }
    }

    if (++v1 == v2)
    {
      uint64_t v0 = 0LL;
      break;
    }
  }

  uint64_t v1 = (uint64_t *)v13;
  if (v13)
  {
LABEL_17:
    xpc_object_t v14 = v1;
    operator delete(v1);
  }

  return v0;
}

void sub_100648F80( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100648FE0(uint64_t a1)
{
}

void sub_100648FE8(uint64_t a1)
{
}

void sub_100648FF4(id a1)
{
  uint64_t v1 = operator new(0x50uLL);
  sub_100411DB0((uint64_t)v1);
  qword_1008D9270 = (uint64_t)v1;
}

void sub_100649024(_Unwind_Exception *a1)
{
}

void sub_100649038(id a1)
{
  uint64_t v1 = operator new(0x128uLL);
  sub_1005C69F8();
  off_1008D5F28 = v1;
}

void sub_100649068(_Unwind_Exception *a1)
{
}

void sub_10064907C(id a1)
{
  uint64_t v1 = operator new(0x138uLL);
  sub_1003FE3E0((uint64_t)v1);
  off_1008D5F48 = v1;
}

void sub_1006490AC(_Unwind_Exception *a1)
{
}

void sub_1006490C0(id a1)
{
  uint64_t v1 = operator new(0x618uLL);
  sub_10058B0A4();
  off_1008D5F08 = v1;
}

void sub_1006490F0(_Unwind_Exception *a1)
{
}

void sub_100649104(id a1)
{
  uint64_t v1 = operator new(0x98uLL);
  sub_1003C97E4((uint64_t)v1);
  off_1008D67E0 = v1;
}

void sub_100649134(_Unwind_Exception *a1)
{
}

void sub_100649148(id a1)
{
  uint64_t v1 = operator new(0x2C0uLL);
  sub_1004219F0();
  off_1008D60C8 = v1;
}

void sub_100649178(_Unwind_Exception *a1)
{
}

void sub_10064918C(id a1)
{
  uint64_t v1 = (char *)operator new(0x200uLL);
  *(void *)uint64_t v1 = off_100898F60;
  *((void *)v1 + 1) = &off_100898FF0;
  *((void *)v1 + 2) = off_100899008;
  *((void *)v1 + 3) = &off_100899060;
  *((void *)v1 + 4) = &off_100899078;
  sub_100242DC4(v1 + 40);
  *((void *)v1 + 14) = 0LL;
  *((_DWORD *)v1 + 30) = 0;
  *((void *)v1 + 17) = 0LL;
  *((void *)v1 + 18) = 0LL;
  *((void *)v1 + 16) = 0LL;
  *(_OWORD *)(v1 + 155) = 0u;
  *(_OWORD *)(v1 + 171) = 0u;
  *(_OWORD *)(v1 + 187) = 0u;
  *(_WORD *)(v1 + 203) = 1;
  *((void *)v1 + 26) = 0LL;
  *((_WORD *)v1 + 108) = 256;
  *((void *)v1 + 29) = 0LL;
  *((void *)v1 + 28) = v1 + 232;
  *((void *)v1 + 32) = 0LL;
  *((void *)v1 + 33) = 0LL;
  *((void *)v1 + 30) = 0LL;
  *((void *)v1 + 31) = v1 + 256;
  v1[272] = 0;
  *((_DWORD *)v1 + 69) = 0;
  v1[280] = 0;
  *((_WORD *)v1 + 189) = 0;
  *(void *)(v1 + 313) = 0LL;
  *(_OWORD *)(v1 + 300) = 0u;
  *(_OWORD *)(v1 + 284) = 0u;
  *(_OWORD *)(v1 + 328) = 0u;
  *(_OWORD *)(v1 + 344) = 0u;
  *(_OWORD *)(v1 + 360) = 0u;
  v1[376] = 0;
  *((void *)v1 + 51) = v1 + 416;
  *((void *)v1 + 52) = 0LL;
  *((void *)v1 + 55) = 0LL;
  *((void *)v1 + 56) = 0LL;
  *((void *)v1 + 53) = 0LL;
  *((void *)v1 + 54) = v1 + 440;
  *((void *)v1 + 57) = v1 + 464;
  *((void *)v1 + 58) = 0LL;
  *((void *)v1 + 59) = 0LL;
  *((void *)v1 + 60) = @"XZ";
  *((void *)v1 + 62) = 0LL;
  *((_DWORD *)v1 + 126) = 0;
  off_1008D6190 = v1;
}

void sub_100649294(_Unwind_Exception *a1)
{
}

void sub_1006492A8(id a1)
{
  uint64_t v1 = operator new(0x2C8uLL);
  sub_100213DA8();
  off_1008D60D8 = v1;
}

void sub_1006492D8(_Unwind_Exception *a1)
{
}

void sub_1006492EC(id a1)
{
  uint64_t v1 = operator new(0x290uLL);
  sub_1004B9364((uint64_t)v1);
  qword_1008D9B18 = (uint64_t)v1;
}

void sub_10064931C(_Unwind_Exception *a1)
{
}

void sub_100649330(id a1)
{
  uint64_t v1 = operator new(0x48uLL);
  sub_1001FFA34((uint64_t)v1);
  qword_1008D9038 = (uint64_t)v1;
}

void sub_100649360(_Unwind_Exception *a1)
{
}

void sub_100649374(id a1)
{
  uint64_t v1 = operator new(0x198uLL);
  sub_100534AB0();
  off_1008D67B0 = v1;
}

void sub_1006493A4(_Unwind_Exception *a1)
{
}

void sub_1006493B8(id a1)
{
  uint64_t v1 = operator new(0xF8uLL);
  sub_1003EC784((uint64_t)v1);
  off_1008D60B8 = v1;
}

void sub_1006493E8(_Unwind_Exception *a1)
{
}

void sub_1006493FC(id a1)
{
  uint64_t v1 = operator new(0x260uLL);
  sub_1005285C8((uint64_t)v1);
  off_1008D67A0 = v1;
}

void sub_10064942C(_Unwind_Exception *a1)
{
}

void sub_100649440(id a1)
{
  uint64_t v1 = operator new(0x2B0uLL);
  sub_10040749C((uint64_t)v1);
  off_1008D5EF8 = v1;
}

void sub_100649470(_Unwind_Exception *a1)
{
}

void sub_100649484(id a1)
{
  uint64_t v1 = operator new(0xEB0uLL);
  sub_10061991C();
  qword_1008D5F18 = (uint64_t)v1;
}

void sub_1006494B4(_Unwind_Exception *a1)
{
}

void sub_1006494C8(id a1)
{
  uint64_t v1 = operator new(0xA8uLL);
  sub_10040D0A0((uint64_t)v1);
  off_1008D6780 = v1;
}

void sub_1006494F8(_Unwind_Exception *a1)
{
}

void sub_10064950C(id a1)
{
  uint64_t v1 = operator new(0x110uLL);
  sub_100551DD0();
  qword_1008D5F58 = (uint64_t)v1;
}

void sub_10064953C(_Unwind_Exception *a1)
{
}

uint64_t sub_100649550(uint64_t a1)
{
  *(void *)a1 = &off_1008A5198;
  *(_WORD *)(a1 + 8) = 8;
  sub_100242DC4(a1 + 16);
  *(void *)(a1 + 88) = 0LL;
  *(void *)(a1 + 80) = a1 + 88;
  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 112) = 0LL;
  *(void *)(a1 + 104) = a1 + 112;
  *(void *)(a1 + 120) = 0LL;
  *(void *)(a1 + 136) = 0LL;
  *(void *)(a1 + 128) = a1 + 136;
  *(void *)(a1 + 144) = 0LL;
  *(_WORD *)(a1 + 152) = 1;
  *(_BYTE *)(a1 + 154) = 1;
  *(_DWORD *)(a1 + 156) = 0;
  *(_WORD *)(a1 + 160) = 0;
  sub_100649640(a1);
  sub_100649DE8();
  sub_10064ACB0();
  return a1;
}

void sub_100649608(_Unwind_Exception *a1)
{
}

void sub_100649640(uint64_t a1)
{
  uint64_t v1 = (os_log_s *)qword_1008F7698;
  if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "BTResourceManager LE initialized.", buf, 2u);
  }

  for (uint64_t i = 0LL; i != 9; ++i)
  {
    *(void *)__s = 0LL;
    uint64_t v44 = 0LL;
    int v45 = 0;
    sprintf(__s, "%d", dword_1008D9D60[i]);
    int v38 = 0;
    uint64_t v3 = sub_1002E6E00();
    sub_10002418C(buf, "BTResourceManager");
    sub_10002418C(__p, __s);
    int v4 = (*(uint64_t (**)(uint64_t, _BYTE *, void **, int *))(*(void *)v3 + 88LL))(v3, buf, __p, &v38);
    if (v37 < 0) {
      operator delete(__p[0]);
    }
    if (v42 < 0)
    {
      operator delete(*(void **)buf);
      if (!v4) {
        goto LABEL_12;
      }
    }

    else if (!v4)
    {
      goto LABEL_12;
    }

    id v5 = (os_log_s *)qword_1008F7698;
    if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136446466;
      *(void *)&uint8_t buf[4] = __s;
      __int16 v40 = 1024;
      int v41 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Warning: Overriding BTResourceManager max connections for %{public}s usecase to %d",  buf,  0x12u);
    }

void sub_100649D7C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(exception_object);
}

void sub_100649DE8()
{
  uint64_t v0 = objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  @"554d08b1bf41ced30d076c7ab17284e2afde2f14cf0606f41b106ebabaf98278",  @"602926fb95b65d8841071711217c956ada1917462051445917d89356ee415929",  @"3a58c9b9f34737fcb1e4ef2c5665843c6d833a2411d47bec0e7caa34ce401e89",  @"febeb2bb2afc79b90aee52b3c218ff6772ceb48b3a84caf9aa173247fbe203d9",  @"5ad8dab6f1fa117db4bc3427c2853a4feceb05332a2bcd6fb5f3a55db03ff081",  @"15f62a1003c7f91a502a48d8b9d6b9e3234972eb2134266269da426531e0f142",  @"ec0f8fcfbb71cd4859bdcb14f4840f131b1d0931fda6846f637732a49598a49f",  @"ef8ff847079725c8fb3ef45a3ad4c69094b719d6eef6207cced996646cad9eb7",  @"358e413d1ec9ed3836bb8fe3f6c47ef03e29bc368636784543f2be232e66541d",  @"8b69e99aebb81c30fb34dc5074023e0f5bb05964ee28d7e43010537fba7d36e0",  @"bf4ce535225ad51bb284f2c4766a0fd74c536abac7a166d9830d3947f374de80",  @"63c4591131b2604f1ca83bf2ae7895f23c723a92106b3740a972b1b14613bc0f",  @"38fa5040af8b215d43372179eacbd6f725312c840059488b197711401d7ad5d4",  @"c097e6524326b43a007761497aca0a778b5581b035f4f0f9773d57156e9b38a0",  @"b96253cbfed55399a9e8b5820dbcf6abc5d9118ee105e2bdef0b201c3b3e9444",  @"24f2d03118a59d1daba966600ed07425b0d875d70c06be360d33fd4ca853af58",  @"23982ca925a8cd3342289446b7f42903ab99be060475efa8b0abc1a792effc29",  @"ae5179510709cdca4f1dde3264d1949698b408f426a98be526c4d14dffc26b91",  @"ff31c07022e965aa2a54968917cd4f3d41e165e82d31a5fd22856c4217c28553",  @"7fad0ec0a107abc4276a86c201b1bc46d9ef1b0776cc75b71987505da768393d",  @"ea1d0f537acf0783b76af476c0ec5c3acac48b2a5432a73daa8c5afb42f19b0b",  @"a800fae19a5d4e1e92dd43934636be8787bf74e832a80bf2ea709062799acb94",  @"79f5c84c1c254c76b8d4ea7601499b7c3a67914dfd3e567704db4b9309ae4fb1",  @"06ccfb2f489cc5912a2cda502c69506b82cad5934895ea6ae535cab35c5bc9e3",  @"bb18ff323ebe7357070647660f905b6c4417447bdbcc79bea36ee4cf2c66b3d7",  @"06fa9dee637f78720fe2778c92824a6dd80299f34646910a83029d23ca3399a4",  @"a09e4a534d554ffe8cf0544b591bf9f635ca605771f6a72ef93103fa38c41f95",  @"089f80bd091e54346dc645636f8f7b51c1d22ba623f3c0f8c05d17c34c92bc27",  @"ae98258fc9148e2a33ba48f0e2eaa82e813fdb86d010482101cae83f3d2a877d",  @"decfd0b0b0a0bfeaa333cce4c5ec9590f5f8274561d4347e9f1f6a29aa8f1d34",  @"ecc1d20a6f0e9ee4e7f384a0cdfe18050cee19a5c7c94adb6c94e12f647d24f2",  @"8cbd21794df7f1c16bbd5a267f976326a24bf9ddb3ac745bc4a854af006a50b7",  @"dfa8283074903b24529434aac683ac9d3853d95107f7fd3ee581f7c69ffc65dd",  @"e5457e14a88f3003c6c64edcaa85fbe18f7fd23e6385c9acb0f210bcd84e837e",  @"636c1f0ee6b0cccebbbfd5979ae5ecf09bcbe673df044883881fd69d313a9eac",  @"aaf648093c082f5b9999e9d8eaec9235503aa3963726641be8635701db151cfe",  @"15f6b2947dd7ad89fe858cbe80ee51c2c6c5e4625ad5d4e9b6de6c1b15db213b",  @"be0bcf7017deaa4c2f173c24718a2648f5c5e6b7a6b296df919775043acd7b73",  @"c1d1c54c3bb978737276ec2c974256db9e98e3878cf204c48ecc2bf6a3906e2a",  @"cdf1779ec4f156ca577a1e99372fe3227e2552dff8d533624ea5312c814e9c85",  @"619157a2665ca48dbd59740e7993884af9e9aefa23d42ca3beed72450a80130a",  @"c6538eb30a5e64df30159760d1c20dfb82cf10febdc237bfb3fbeaae8061e958",  @"306dec84ac641c728a5e52b9257a536faaa292db3109b0c6c3b4b2a24999c1d8",  @"64b90991318f675b807c35b4ff35850a05967ee72b06176f5d1f57318bcc60e2",  @"b86e6ba2c543374a4736569af4226371b78532514f935dd1122cdf84199d42b9",  @"e2ae0f5a011d888eb0249f576a1f6d1cf0ab5953cf25e1451f1a476e86673b93",
           @"b27625a6780b68f433ec7012f3c75a73925c24a6a91868ceb99ac4a0ea0413e6",
           @"e64c7c5f0599df5b5800ec1771e2794491b06f49d43c00707c08c2a8d6fea059",
           @"7abe9e90bfb16aecae19e551312117deb7622939758c83e1d65387f2fb4d94ee",
           @"474646dff450e7a23bd8180829d1712a26d65c6ec4de6eb4ffe233037a2cc69f",
           @"3d56a5b22cbe84a53b45bf7ec935e6dfc346edff2d47d974939f3f8c8b0d2862",
           @"cb9c7eaccfbe7833daf0f9030e6b2b3e75ca158857d0e5307ca9d9064c3199b2",
           @"a7fcb0ca8a4bf8a79ffde6c2e982521085db9296fb451f1bce53819fdfe7d7c2",
           @"4641d059088b8c84e32990ea7dfae36dfa988f109bad552d138771782f681d03",
           @"5b0a008a845215b74ea580c1ca3096e2a67b0283cfc04548124326b1023d1c05",
           @"5ece8d12e33b7abe998fa14e917c5eacd97fecb7be0da94b775389bf92ad8313",
           @"75d3a5e65ae4b047e14682759758d41ed65b98d0ad5a2c57eb51ac80e913c45b",
           @"8ae9aeabfa6411b461c28f082940ecb9eb25009705bd60498d4de57e1b55c5c1",
           @"1d7300686aa7c49abcdbc2a47e30cb7ec451f10f14b240523a57b958c2cb9591",
           @"f9306b984dd3cf87c9277b547eb2f11dce7a40d21c8b1ed4fa1d1fffec5acb9f",
           @"f53de5dac1ebf57ff83dcd8094e03d8229c5d7457e39184e87ce8bac0b1f95ea"));
  uint64_t v1 = (void *)qword_1008F79C8;
  qword_1008F79C8 = v0;

  int v32 = 0LL;
  __int16 v33 = 0LL;
  uint64_t v34 = 0LL;
  uint64_t v2 = sub_1002E6E00();
  sub_10002418C(&__dst, "LEAllowedBundleIDs");
  if ((*(unsigned int (**)(uint64_t, __int128 *, __int128 **))(*(void *)v2 + 48LL))(v2, &__dst, &v32))
  {
    int v4 = v32;
    uint64_t v3 = v33;
    if (SHIBYTE(v31) < 0) {
      operator delete((void *)__dst);
    }
    if (v3 != v4)
    {
      id v5 = v32;
      for (i = v33; v5 != i; id v5 = (__int128 *)((char *)v5 + 24))
      {
        __std::string dst = 0uLL;
        uint64_t v31 = 0LL;
        if (*((char *)v5 + 23) < 0)
        {
          sub_100024238(&__dst, *(void **)v5, *((void *)v5 + 1));
        }

        else
        {
          __int128 v7 = *v5;
          uint64_t v31 = *((void *)v5 + 2);
          __std::string dst = v7;
        }

        int v8 = (os_log_s *)qword_1008F7698;
        if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
        {
          if (v31 >= 0) {
            p_std::string dst = &__dst;
          }
          else {
            p_std::string dst = (__int128 *)__dst;
          }
          *(_DWORD *)__int128 buf = 136446210;
          unsigned int v36 = p_dst;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Additional BundleID for allowedHashedBundleIDsSet by Overriding: %{public}s",  buf,  0xCu);
        }

        uint64_t v10 = objc_alloc(&OBJC_CLASS___NSString);
        if (v31 >= 0) {
          uint64_t v11 = &__dst;
        }
        else {
          uint64_t v11 = (__int128 *)__dst;
        }
        int v12 = -[NSString initWithUTF8String:](v10, "initWithUTF8String:", v11);
        uint64_t v14 = CBGenerateObfuscatedSHA256HashedString(v12, v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        [(id)qword_1008F79C8 addObject:v15];

        if (SHIBYTE(v31) < 0) {
          operator delete((void *)__dst);
        }
      }
    }
  }

  else if (SHIBYTE(v31) < 0)
  {
    operator delete((void *)__dst);
  }

  uint64_t v16 = sub_1002E6E00();
  sub_10002418C(&__dst, "LEDisallowedBundleIDs");
  if ((*(unsigned int (**)(uint64_t, __int128 *, __int128 **))(*(void *)v16 + 48LL))(v16, &__dst, &v32))
  {
    int v18 = v32;
    int v17 = v33;
    if (SHIBYTE(v31) < 0) {
      operator delete((void *)__dst);
    }
    if (v17 != v18)
    {
      unsigned __int32 v19 = v32;
      for (j = v33; v19 != j; unsigned __int32 v19 = (__int128 *)((char *)v19 + 24))
      {
        __std::string dst = 0uLL;
        uint64_t v31 = 0LL;
        if (*((char *)v19 + 23) < 0)
        {
          sub_100024238(&__dst, *(void **)v19, *((void *)v19 + 1));
        }

        else
        {
          __int128 v21 = *v19;
          uint64_t v31 = *((void *)v19 + 2);
          __std::string dst = v21;
        }

        int v22 = (os_log_s *)qword_1008F7698;
        if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
        {
          if (v31 >= 0) {
            int v23 = &__dst;
          }
          else {
            int v23 = (__int128 *)__dst;
          }
          *(_DWORD *)__int128 buf = 136446210;
          unsigned int v36 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "BundleID is removed from allowedHashedBundleIDsSet by Overriding: %{public}s",  buf,  0xCu);
        }

        __n128 v24 = objc_alloc(&OBJC_CLASS___NSString);
        if (v31 >= 0) {
          uint64_t v25 = &__dst;
        }
        else {
          uint64_t v25 = (__int128 *)__dst;
        }
        int v26 = -[NSString initWithUTF8String:](v24, "initWithUTF8String:", v25);
        uint64_t v28 = CBGenerateObfuscatedSHA256HashedString(v26, v27);
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        [(id)qword_1008F79C8 removeObject:v29];

        if (SHIBYTE(v31) < 0) {
          operator delete((void *)__dst);
        }
      }
    }
  }

  else if (SHIBYTE(v31) < 0)
  {
    operator delete((void *)__dst);
  }

  *(void *)&__std::string dst = &v32;
  sub_100024304((void ***)&__dst);
}

void sub_10064AC28(_Unwind_Exception *a1)
{
  *(void *)(v1 - 160) = v1 - 136;
  sub_100024304((void ***)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_10064ACB0()
{
  int v92 = 0LL;
  size_t v93 = 0LL;
  uint64_t v94 = 0LL;
  uint64_t v0 = objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  @"f50eeeda9ef9e96cbfd2e255ecd185cedcaa7c023ad51d903de5405e4d94264c",  @"28b69483d207baa88955b89e6419fb8a823ddea87ee701fdc8e83b9d819ab4a4",  @"c48aec1017d2d0d2c9a4a0a9f34d20b42beed75cad781f9e33e45f1df476fac1",  0LL));
  uint64_t v1 = (void *)qword_1008F79D0;
  qword_1008F79D0 = v0;

  uint64_t v2 = sub_1002E6E00();
  sub_10002418C(__p, "AddLEUseCaseRequiredBundleIDsScan");
  if ((*(unsigned int (**)(uint64_t, void **, __int128 **))(*(void *)v2 + 48LL))(v2, __p, &v92))
  {
    int v4 = v92;
    uint64_t v3 = v93;
    if (SHIBYTE(v91) < 0) {
      operator delete(__p[0]);
    }
    if (v3 != v4)
    {
      id v5 = v92;
      for (i = v93; v5 != i; id v5 = (__int128 *)((char *)v5 + 24))
      {
        __p[0] = 0LL;
        __p[1] = 0LL;
        uint64_t v91 = 0LL;
        if (*((char *)v5 + 23) < 0)
        {
          sub_100024238(__p, *(void **)v5, *((void *)v5 + 1));
        }

        else
        {
          __int128 v7 = *v5;
          uint64_t v91 = *((void *)v5 + 2);
          *(_OWORD *)std::string __p = v7;
        }

        int v8 = (os_log_s *)qword_1008F7698;
        if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
        {
          if (v91 >= 0) {
            int v9 = __p;
          }
          else {
            int v9 = (void **)__p[0];
          }
          *(_DWORD *)__int128 buf = 136446210;
          unint64_t v96 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Additional BundleID for useCaseRequiredHashedBundleIDsSet for Scanning by Overriding: %{public}s",  buf,  0xCu);
        }

        uint64_t v10 = objc_alloc(&OBJC_CLASS___NSString);
        if (v91 >= 0) {
          uint64_t v11 = __p;
        }
        else {
          uint64_t v11 = (void **)__p[0];
        }
        int v12 = -[NSString initWithUTF8String:](v10, "initWithUTF8String:", v11);
        uint64_t v14 = CBGenerateObfuscatedSHA256HashedString(v12, v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        [(id)qword_1008F79D0 addObject:v15];

        if (SHIBYTE(v91) < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  else if (SHIBYTE(v91) < 0)
  {
    operator delete(__p[0]);
  }

  uint64_t v16 = sub_1002E6E00();
  sub_10002418C(__p, "RemoveLEUseCaseRequiredBundleIDsScan");
  if ((*(unsigned int (**)(uint64_t, void **, __int128 **))(*(void *)v16 + 48LL))(v16, __p, &v92))
  {
    int v18 = v92;
    int v17 = v93;
    if (SHIBYTE(v91) < 0) {
      operator delete(__p[0]);
    }
    if (v17 != v18)
    {
      unsigned __int32 v19 = v92;
      for (j = v93; v19 != j; unsigned __int32 v19 = (__int128 *)((char *)v19 + 24))
      {
        __p[0] = 0LL;
        __p[1] = 0LL;
        uint64_t v91 = 0LL;
        if (*((char *)v19 + 23) < 0)
        {
          sub_100024238(__p, *(void **)v19, *((void *)v19 + 1));
        }

        else
        {
          __int128 v21 = *v19;
          uint64_t v91 = *((void *)v19 + 2);
          *(_OWORD *)std::string __p = v21;
        }

        int v22 = (os_log_s *)qword_1008F7698;
        if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
        {
          if (v91 >= 0) {
            int v23 = __p;
          }
          else {
            int v23 = (void **)__p[0];
          }
          *(_DWORD *)__int128 buf = 136446210;
          unint64_t v96 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "BundleID is removed from useCaseRequiredHashedBundleIDsSet for Scanning by Overriding: %{public}s",  buf,  0xCu);
        }

        __n128 v24 = objc_alloc(&OBJC_CLASS___NSString);
        if (v91 >= 0) {
          uint64_t v25 = __p;
        }
        else {
          uint64_t v25 = (void **)__p[0];
        }
        int v26 = -[NSString initWithUTF8String:](v24, "initWithUTF8String:", v25);
        uint64_t v28 = CBGenerateObfuscatedSHA256HashedString(v26, v27);
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        [(id)qword_1008F79D0 removeObject:v29];

        if (SHIBYTE(v91) < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  else if (SHIBYTE(v91) < 0)
  {
    operator delete(__p[0]);
  }

  uint64_t v30 = objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  @"f50eeeda9ef9e96cbfd2e255ecd185cedcaa7c023ad51d903de5405e4d94264c",  @"e4c0ceca17dcd39c038c248f92a18f304213be2c9d5c3acba171e8f4dc098d97",  @"0604cb11439cce401b58e1cbb1e74790c30d05583fc162c9b0413efacf6a6a4d",  0LL));
  uint64_t v31 = (void *)qword_1008F79D8;
  qword_1008F79D8 = v30;

  uint64_t v32 = sub_1002E6E00();
  sub_10002418C(__p, "AddLEUseCaseRequiredBundleIDsConnect");
  if ((*(unsigned int (**)(uint64_t, void **, __int128 **))(*(void *)v32 + 48LL))(v32, __p, &v92))
  {
    uint64_t v34 = v92;
    __int16 v33 = v93;
    if (SHIBYTE(v91) < 0) {
      operator delete(__p[0]);
    }
    if (v33 != v34)
    {
      __int16 v35 = v92;
      for (k = v93; v35 != k; __int16 v35 = (__int128 *)((char *)v35 + 24))
      {
        __p[0] = 0LL;
        __p[1] = 0LL;
        uint64_t v91 = 0LL;
        if (*((char *)v35 + 23) < 0)
        {
          sub_100024238(__p, *(void **)v35, *((void *)v35 + 1));
        }

        else
        {
          __int128 v37 = *v35;
          uint64_t v91 = *((void *)v35 + 2);
          *(_OWORD *)std::string __p = v37;
        }

        int v38 = (os_log_s *)qword_1008F7698;
        if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
        {
          if (v91 >= 0) {
            __int16 v39 = __p;
          }
          else {
            __int16 v39 = (void **)__p[0];
          }
          *(_DWORD *)__int128 buf = 136446210;
          unint64_t v96 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Additional BundleID for useCaseRequiredHashedBundleIDsSet for Connection by Overriding: %{public}s",  buf,  0xCu);
        }

        __int16 v40 = objc_alloc(&OBJC_CLASS___NSString);
        if (v91 >= 0) {
          int v41 = __p;
        }
        else {
          int v41 = (void **)__p[0];
        }
        char v42 = -[NSString initWithUTF8String:](v40, "initWithUTF8String:", v41);
        uint64_t v44 = CBGenerateObfuscatedSHA256HashedString(v42, v43);
        int v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        [(id)qword_1008F79D8 addObject:v45];

        if (SHIBYTE(v91) < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  else if (SHIBYTE(v91) < 0)
  {
    operator delete(__p[0]);
  }

  uint64_t v46 = sub_1002E6E00();
  sub_10002418C(__p, "RemoveLEUseCaseRequiredBundleIDsConnect");
  if ((*(unsigned int (**)(uint64_t, void **, __int128 **))(*(void *)v46 + 48LL))(v46, __p, &v92))
  {
    unsigned __int16 v48 = v92;
    __int16 v47 = v93;
    if (SHIBYTE(v91) < 0) {
      operator delete(__p[0]);
    }
    if (v47 != v48)
    {
      uint64_t v49 = v92;
      for (m = v93; v49 != m; uint64_t v49 = (__int128 *)((char *)v49 + 24))
      {
        __p[0] = 0LL;
        __p[1] = 0LL;
        uint64_t v91 = 0LL;
        if (*((char *)v49 + 23) < 0)
        {
          sub_100024238(__p, *(void **)v49, *((void *)v49 + 1));
        }

        else
        {
          __int128 v51 = *v49;
          uint64_t v91 = *((void *)v49 + 2);
          *(_OWORD *)std::string __p = v51;
        }

        uint64_t v52 = (os_log_s *)qword_1008F7698;
        if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
        {
          if (v91 >= 0) {
            uint64_t v53 = __p;
          }
          else {
            uint64_t v53 = (void **)__p[0];
          }
          *(_DWORD *)__int128 buf = 136446210;
          unint64_t v96 = v53;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "BundleID is removed from useCaseRequiredHashedBundleIDsSet for Connection by Overriding: %{public}s",  buf,  0xCu);
        }

        uint64_t v54 = objc_alloc(&OBJC_CLASS___NSString);
        if (v91 >= 0) {
          unsigned int v55 = __p;
        }
        else {
          unsigned int v55 = (void **)__p[0];
        }
        CFUserNotificationRef v56 = -[NSString initWithUTF8String:](v54, "initWithUTF8String:", v55);
        uint64_t v58 = CBGenerateObfuscatedSHA256HashedString(v56, v57);
        id v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        [(id)qword_1008F79D8 removeObject:v59];

        if (SHIBYTE(v91) < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  else if (SHIBYTE(v91) < 0)
  {
    operator delete(__p[0]);
  }

  uint64_t v60 = objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  @"962f55acdffc015a6caaf8083446b7e50ed5cb6cf10eeabdcfefd2f1fd76fca6",  @"e84ae109a38baeb5483e641b123b64c498a08de3c392e6a15a5464aa163abba1",  0LL));
  __int16 v61 = (void *)qword_1008F79E0;
  qword_1008F79E0 = v60;

  uint64_t v62 = sub_1002E6E00();
  sub_10002418C(__p, "AddLEUseCaseRequiredBundleIDsAdv");
  if ((*(unsigned int (**)(uint64_t, void **, __int128 **))(*(void *)v62 + 48LL))(v62, __p, &v92))
  {
    __int128 v64 = v92;
    unsigned __int8 v63 = v93;
    if (SHIBYTE(v91) < 0) {
      operator delete(__p[0]);
    }
    if (v63 != v64)
    {
      unsigned __int8 v65 = v92;
      for (n = v93; v65 != n; unsigned __int8 v65 = (__int128 *)((char *)v65 + 24))
      {
        __p[0] = 0LL;
        __p[1] = 0LL;
        uint64_t v91 = 0LL;
        if (*((char *)v65 + 23) < 0)
        {
          sub_100024238(__p, *(void **)v65, *((void *)v65 + 1));
        }

        else
        {
          __int128 v67 = *v65;
          uint64_t v91 = *((void *)v65 + 2);
          *(_OWORD *)std::string __p = v67;
        }

        id v68 = (os_log_s *)qword_1008F7698;
        if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
        {
          if (v91 >= 0) {
            id v69 = __p;
          }
          else {
            id v69 = (void **)__p[0];
          }
          *(_DWORD *)__int128 buf = 136446210;
          unint64_t v96 = v69;
          _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "Additional BundleID for useCaseRequiredHashedBundleIDsSet for Advertising by overriding: %{public}s",  buf,  0xCu);
        }

        unsigned __int8 v70 = objc_alloc(&OBJC_CLASS___NSString);
        if (v91 >= 0) {
          unint64_t v71 = __p;
        }
        else {
          unint64_t v71 = (void **)__p[0];
        }
        char v72 = -[NSString initWithUTF8String:](v70, "initWithUTF8String:", v71);
        uint64_t v74 = CBGenerateObfuscatedSHA256HashedString(v72, v73);
        id v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
        [(id)qword_1008F79E0 addObject:v75];

        if (SHIBYTE(v91) < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  else if (SHIBYTE(v91) < 0)
  {
    operator delete(__p[0]);
  }

  uint64_t v76 = sub_1002E6E00();
  sub_10002418C(__p, "RemoveLEUseCaseRequiredBundleIDsAdv");
  if ((*(unsigned int (**)(uint64_t, void **, __int128 **))(*(void *)v76 + 48LL))(v76, __p, &v92))
  {
    unint64_t v78 = v92;
    uint64_t v77 = v93;
    if (SHIBYTE(v91) < 0) {
      operator delete(__p[0]);
    }
    if (v77 != v78)
    {
      size_t v79 = v92;
      for (ii = v93; v79 != ii; size_t v79 = (__int128 *)((char *)v79 + 24))
      {
        __p[0] = 0LL;
        __p[1] = 0LL;
        uint64_t v91 = 0LL;
        if (*((char *)v79 + 23) < 0)
        {
          sub_100024238(__p, *(void **)v79, *((void *)v79 + 1));
        }

        else
        {
          __int128 v81 = *v79;
          uint64_t v91 = *((void *)v79 + 2);
          *(_OWORD *)std::string __p = v81;
        }

        unsigned __int8 v82 = (os_log_s *)qword_1008F7698;
        if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
        {
          if (v91 >= 0) {
            int v83 = __p;
          }
          else {
            int v83 = (void **)__p[0];
          }
          *(_DWORD *)__int128 buf = 136446210;
          unint64_t v96 = v83;
          _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "BundleID is removed from useCaseRequiredHashedBundleIDsSet for Advertising by overriding: %{public}s",  buf,  0xCu);
        }

        unsigned int v84 = objc_alloc(&OBJC_CLASS___NSString);
        if (v91 >= 0) {
          int v85 = __p;
        }
        else {
          int v85 = (void **)__p[0];
        }
        uint64_t v86 = -[NSString initWithUTF8String:](v84, "initWithUTF8String:", v85);
        uint64_t v88 = CBGenerateObfuscatedSHA256HashedString(v86, v87);
        xpc_object_t v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
        [(id)qword_1008F79E0 removeObject:v89];

        if (SHIBYTE(v91) < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  else if (SHIBYTE(v91) < 0)
  {
    operator delete(__p[0]);
  }

  __p[0] = &v92;
  sub_100024304((void ***)__p);
}

void sub_10064B6A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  std::string __p = &a21;
  sub_100024304((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t sub_10064B7CC(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (v2)
  {
    uint64_t v3 = a1 + 88;
    do
    {
      unsigned int v4 = *(_DWORD *)(v2 + 28);
      BOOL v5 = v4 >= a2;
      if (v4 >= a2) {
        __int16 v6 = (uint64_t *)v2;
      }
      else {
        __int16 v6 = (uint64_t *)(v2 + 8);
      }
      if (v5) {
        uint64_t v3 = v2;
      }
      uint64_t v2 = *v6;
    }

    while (*v6);
    if (v3 != a1 + 88 && *(_DWORD *)(v3 + 28) <= a2)
    {
      uint64_t v7 = *(unsigned __int16 *)(v3 + 32);
      if ((_DWORD)v7) {
        return v7;
      }
    }
  }

  if (a2 - 20 < 2 || a2 == 655360) {
    return *(unsigned __int16 *)(a1 + 8);
  }
  if ((a2 & 0xFFFF0000) == 0x10000 && dword_1008D9D60[0] != a2)
  {
    uint64_t v9 = 0LL;
    do
    {
      if (v9 == 8) {
        break;
      }
      int v10 = dword_1008D9D60[++v9];
    }

    while (v10 != a2);
  }

  uint64_t v11 = *(uint64_t (**)(void))(*(void *)sub_1002E6E9C() + 3408LL);
  return v11();
}

uint64_t sub_10064B8F0(uint64_t a1, int a2)
{
  uint64_t v3 = 0LL;
  int v4 = 0;
  do
  {
    if (HIWORD(dword_1008D9D60[v3]) == a2)
    {
      if (qword_1008D5F10 != -1) {
        dispatch_once(&qword_1008D5F10, &stru_1008A51A8);
      }
      v4 += sub_1005A16FC((uint64_t)off_1008D5F08, dword_1008D9D60[v3]);
    }

    ++v3;
  }

  while (v3 != 9);
  return (unsigned __int16)v4;
}

uint64_t sub_10064B99C(uint64_t a1, int a2)
{
  if ((a2 & 0xFFFF0000) == 0x10000)
  {
    if (dword_1008D9D60[0] == a2)
    {
LABEL_3:
      __int16 v3 = sub_10064B8F0(a1, 1);
      if (qword_1008D5F10 == -1) {
        return (unsigned __int16)(sub_1005A16FC((uint64_t)off_1008D5F08, 3) + v3);
      }
      goto LABEL_16;
    }

    uint64_t v5 = 0LL;
    while (v5 != 8)
    {
      int v6 = dword_1008D9D60[++v5];
      if (v6 == a2)
      {
        break;
      }
    }

    if (qword_1008D5F10 == -1) {
      return sub_1005A16FC((uint64_t)off_1008D5F08, a2);
    }
LABEL_17:
    dispatch_once(&qword_1008D5F10, &stru_1008A51A8);
    return sub_1005A16FC((uint64_t)off_1008D5F08, a2);
  }

  if (a2 == 3)
  {
    __int16 v3 = sub_10064B8F0(a1, 1);
    if (qword_1008D5F10 == -1) {
      return (unsigned __int16)(sub_1005A16FC((uint64_t)off_1008D5F08, 3) + v3);
    }
LABEL_16:
    dispatch_once(&qword_1008D5F10, &stru_1008A51A8);
    return (unsigned __int16)(sub_1005A16FC((uint64_t)off_1008D5F08, 3) + v3);
  }

  if (qword_1008D5F10 != -1) {
    goto LABEL_17;
  }
  return sub_1005A16FC((uint64_t)off_1008D5F08, a2);
}

uint64_t sub_10064BAD0()
{
  uint64_t v0 = sub_1002E6BF0();
  if (((*(uint64_t (**)(uint64_t))(*(void *)v0 + 336LL))(v0) & 1) != 0)
  {
    return 2;
  }

  else
  {
    uint64_t v2 = sub_1002E6BF0();
    unsigned __int16 v1 = 2;
    if (((*(uint64_t (**)(uint64_t))(*(void *)v2 + 344LL))(v2) & 1) == 0)
    {
      uint64_t v3 = sub_1002E6BF0();
      else {
        return (unsigned __int16)-1;
      }
    }
  }

  return v1;
}

uint64_t sub_10064BB38(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"com.apple.locationd"] & 1) != 0
    || [v3 isEqualToString:@"com.apple.icloud.searchpartyd"])
  {
    int v4 = (unsigned __int16 *)(a1 + 156);
  }

  else
  {
    int v4 = (unsigned __int16 *)(a1 + 158);
  }

  uint64_t v5 = *v4;

  return v5;
}

void sub_10064BB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10064BBA8(uint64_t a1)
{
  uint64_t result = *(unsigned __int16 *)(a1 + 160);
  if (!(_DWORD)result) {
    return sub_10064BAD0();
  }
  return result;
}

uint64_t sub_10064BBB8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    if ((sub_10064BC24(v1) & 1) != 0)
    {
      uint64_t v3 = 1LL;
    }

    else if (sub_10064BC7C(v2))
    {
      uint64_t v3 = 15LL;
    }

    else
    {
      uint64_t v3 = 0LL;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

void sub_10064BC14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10064BC24(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1) {
    id v3 = [v1 localizedCaseInsensitiveContainsString:@"com.apple.healthkit"];
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

void sub_10064BC6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10064BC7C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    if (([v1 localizedCaseInsensitiveContainsString:@"com.dexcom."] & 1) != 0
      || ([v2 localizedCaseInsensitiveContainsString:@"com.medtronic."] & 1) != 0)
    {
      uint64_t v3 = 1LL;
    }

    else
    {
      uint64_t v3 = (uint64_t)[v2 localizedCaseInsensitiveContainsString:@"com.senseonics."];
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

void sub_10064BCF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10064BD04(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1) {
    id v3 = [v1 localizedCaseInsensitiveContainsString:@"com.apple.bluetoothd-central"];
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

void sub_10064BD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10064BD5C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if ((_DWORD)a4)
  {
    uint64_t v9 = (os_log_s *)qword_1008F7698;
    if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string __p = 134217984;
      *(void *)&__p[4] = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Accept provided connection use type %ld",  __p,  0xCu);
    }

void sub_10064BF60( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

void sub_10064BFA0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v38 = a3;
  id v7 = a4;
  v43[0] = 0LL;
  v43[1] = 0LL;
  sub_100242F28((uint64_t)v43, a1 + 16);
  id v8 = (os_log_s *)qword_1008F7698;
  if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = uu1;
    sub_100494958(a2, (uint64_t)uu1);
    if (v47 < 0) {
      uint64_t v9 = *(unsigned __int8 **)uu1;
    }
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 clientBundleID]);
    if (v10) {
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 clientBundleID]);
    }
    else {
      uint64_t v11 = @"NoClientBundleID";
    }
    NSStringEncoding v12 = (void *)objc_claimAutoreleasedReturnValue([v7 clientProcessID]);
    if (v12) {
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 clientProcessID]);
    }
    else {
      uint64_t v13 = @"NoClientProcessID";
    }
    id v14 = [v7 connectionUseCase];
    id v15 = [v7 maxAllowedConnectionDelay];
    *(_DWORD *)__int128 buf = 138544642;
    *(void *)&uint8_t buf[4] = v38;
    __int16 v49 = 2082;
    uint64_t v50 = v9;
    __int16 v51 = 2114;
    uint64_t v52 = v11;
    __int16 v53 = 2112;
    *(void *)uint64_t v54 = v13;
    *(_WORD *)&v54[8] = 2048;
    *(void *)&v54[10] = v14;
    __int16 v55 = 2048;
    id v56 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Connect Requested for device %{public}@ by session %{public}s with options clientBundleID %{public}@ clientProcess ID %@ connectionUseCase %ld maxAllowedConnectionDelay %ld",  buf,  0x3Eu);
    if (v12) {

    }
    if (v10) {
    if (v47 < 0)
    }
      operator delete(*(void **)uu1);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 clientBundleID]);
  int v17 = (void *)objc_claimAutoreleasedReturnValue([v7 clientProcessID]);
  unsigned int v18 = sub_10064BD5C(a2, v16, v17, (uint64_t)[v7 connectionUseCase]);

  BOOL v20 = v18 == 15 || v18 == 1;
  sub_100241F90(buf, v38);
  __int16 v21 = (uint64_t **)(a1 + 128);
  *(void *)uu1 = buf;
  uint64_t v22 = +[NSMutableSet setWithSet:]( &OBJC_CLASS___NSMutableSet,  "setWithSet:",  sub_10064D8B4( (uint64_t **)(a1 + 128),  buf,  (uint64_t)&unk_1006C2518,  (const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)uu1)[6]);
  char v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  __n128 v24 = (void *)objc_claimAutoreleasedReturnValue([v7 connectingClients]);
  BOOL v25 = v24 == 0LL;

  if (v25)
  {
    sub_100494958(a2, (uint64_t)buf);
    if (v51 >= 0) {
      uint64_t v30 = buf;
    }
    else {
      uint64_t v30 = *(_BYTE **)buf;
    }
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v30));
    [v23 addObject:v31];

    if (SHIBYTE(v51) < 0) {
      operator delete(*(void **)buf);
    }
  }

  else
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    int v26 = (void *)objc_claimAutoreleasedReturnValue([v7 connectingClients]);
    id v27 = [v26 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v40;
      do
      {
        for (uint64_t i = 0LL; i != v27; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v26);
          }
          [v23 addObject:*(void *)(*((void *)&v39 + 1) + 8 * (void)i)];
        }

        id v27 = [v26 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }

      while (v27);
    }
  }

  sub_100241F90(buf, v38);
  *(void *)uu1 = buf;
  uint64_t v32 = sub_10064D8B4( v21,  buf,  (uint64_t)&unk_1006C2518,  (const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)uu1);
  objc_storeStrong((id *)v32 + 6, v23);
  __int16 v33 = (os_log_s *)qword_1008F7698;
  if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = (unsigned __int8 *)[v7 connectionUseCase];
    if (v20) {
      int v35 = 5;
    }
    else {
      int v35 = 0;
    }
    sub_100241F90(uu1, v38);
    uint64_t v44 = uu1;
    unsigned int v36 = (void *)sub_10064D8B4( v21,  uu1,  (uint64_t)&unk_1006C2518,  (const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)&v44)[6];
    *(_DWORD *)__int128 buf = 138544386;
    *(void *)&uint8_t buf[4] = v38;
    __int16 v49 = 2048;
    uint64_t v50 = v34;
    __int16 v51 = 2048;
    uint64_t v52 = (__CFString *)v18;
    __int16 v53 = 1024;
    *(_DWORD *)uint64_t v54 = v35;
    *(_WORD *)&v54[4] = 2114;
    *(void *)&v54[6] = v36;
    id v37 = v36;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Device %{public}@ connectionUseCase (req %ld computed %ld) priority %hhu bundleIDs %{public}@",  buf,  0x30u);
  }

  sub_100242FAC((uint64_t)v43);
}

void sub_10064C470( _Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  if (v13) {
  sub_100242FAC((uint64_t)va);
  }

  _Unwind_Resume(a1);
}

void sub_10064C568(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v35 = a4;
  v40[0] = 0LL;
  v40[1] = 0LL;
  sub_100242F28((uint64_t)v40, a1 + 16);
  sub_100241F90(__p, v7);
  id v8 = (uint64_t **)(a1 + 128);
  *(void *)uu1 = __p;
  uint64_t v9 = +[NSMutableSet setWithSet:]( &OBJC_CLASS___NSMutableSet,  "setWithSet:",  sub_10064D8B4( (uint64_t **)(a1 + 128),  __p,  (uint64_t)&unk_1006C2518,  (const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)uu1)[6]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v35 connectingClients]);
  LODWORD(a4) = v11 == 0LL;

  if ((_DWORD)a4)
  {
    sub_100494958(a2, (uint64_t)__p);
    if (v46 >= 0) {
      uint64_t v16 = __p;
    }
    else {
      uint64_t v16 = *(_BYTE **)__p;
    }
    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
    [v10 removeObject:v17];

    if (SHIBYTE(v46) < 0) {
      operator delete(*(void **)__p);
    }
  }

  else
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    NSStringEncoding v12 = (void *)objc_claimAutoreleasedReturnValue([v35 connectingClients]);
    id v13 = [v12 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v12);
          }
          [v10 removeObject:*(void *)(*((void *)&v36 + 1) + 8 * (void)i)];
        }

        id v13 = [v12 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }

      while (v13);
    }
  }

  if ([v10 count])
  {
    sub_100241F90(__p, v7);
    *(void *)uu1 = __p;
    unsigned int v18 = sub_10064D8B4( v8,  __p,  (uint64_t)&unk_1006C2518,  (const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)uu1);
    objc_storeStrong((id *)v18 + 6, v10);
  }

  unsigned __int32 v19 = (os_log_s *)qword_1008F7698;
  if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v35 connectionUseCase];
    sub_100241F90(uu1, v7);
    __int128 v41 = uu1;
    __int16 v21 = (void *)sub_10064D8B4( v8,  uu1,  (uint64_t)&unk_1006C2518,  (const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)&v41)[6];
    *(_DWORD *)std::string __p = 138543874;
    *(void *)&__p[4] = v7;
    __int16 v44 = 2048;
    id v45 = v20;
    __int16 v46 = 2114;
    char v47 = v21;
    id v22 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Device %{public}@ connectionUseCase (req %ld) bundleIDs %{public}@",  __p,  0x20u);
  }

  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A51C8);
  }
  char v23 = off_1008D5F28;
  sub_100494958(a2, (uint64_t)__p);
  int v24 = SHIBYTE(v46);
  BOOL v25 = *(_BYTE **)__p;
  NSStringEncoding v26 = +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding");
  if (v24 >= 0) {
    id v27 = __p;
  }
  else {
    id v27 = v25;
  }
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v27,  v26));
  sub_1005D36A0((uint64_t)v23, v7, v28);

  if (SHIBYTE(v46) < 0) {
    operator delete(*(void **)__p);
  }
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A51C8);
  }
  __int16 v29 = off_1008D5F28;
  sub_100494958(a2, (uint64_t)__p);
  int v30 = SHIBYTE(v46);
  uint64_t v31 = *(_BYTE **)__p;
  NSStringEncoding v32 = +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding");
  if (v30 >= 0) {
    __int16 v33 = __p;
  }
  else {
    __int16 v33 = v31;
  }
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v33,  v32));
  sub_1005D34A4((uint64_t)v29, v7, v34);

  if (SHIBYTE(v46) < 0) {
    operator delete(*(void **)__p);
  }

  sub_100242FAC((uint64_t)v40);
}

void sub_10064C990( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, void *__p, uint64_t a26, int a27, __int16 a28, char a29, char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }

  sub_100242FAC((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void sub_10064CA40(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v10[1] = 0LL;
  id v11 = v5;
  v10[0] = 0LL;
  sub_100242F28((uint64_t)v10, a1 + 16);
  int v6 = *(void **)(a1 + 104);
  if (v6 != (void *)(a1 + 112))
  {
    while (![v5 isEqual:v6[4]])
    {
      id v7 = (void *)v6[1];
      if (v7)
      {
        do
        {
          id v8 = v7;
          id v7 = (void *)*v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          id v8 = (void *)v6[2];
          BOOL v9 = *v8 == (void)v6;
          int v6 = v8;
        }

        while (!v9);
      }

      int v6 = v8;
      if (v8 == (void *)(a1 + 112)) {
        goto LABEL_11;
      }
    }

    sub_1003A103C((uint64_t **)(a1 + 104), (uint64_t)v6);
  }

void sub_10064CB84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_10064CBBC(void *a1)
{
  uint64_t v2 = (os_log_s *)qword_1008F7698;
  if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "statedump: ------------------ BT Resource Manager -------------------",  buf,  2u);
    uint64_t v2 = (os_log_s *)qword_1008F7698;
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "statedump: Max Connections for use case:",  buf,  2u);
    uint64_t v2 = (os_log_s *)qword_1008F7698;
  }

  uint64_t v3 = 0LL;
  int v4 = a1 + 11;
  do
  {
    unsigned int v5 = dword_1008D9D60[v3];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = sub_10064B7CC((uint64_t)a1, v5);
      uint64_t v7 = a1[11];
      if (!v7) {
        goto LABEL_18;
      }
      id v8 = a1 + 11;
      do
      {
        unsigned int v9 = *(_DWORD *)(v7 + 28);
        BOOL v10 = v9 >= v5;
        if (v9 >= v5) {
          id v11 = (uint64_t *)v7;
        }
        else {
          id v11 = (uint64_t *)(v7 + 8);
        }
        if (v10) {
          id v8 = (void *)v7;
        }
        uint64_t v7 = *v11;
      }

      while (*v11);
      if (v8 == v4 || v5 < *((_DWORD *)v8 + 7)) {
LABEL_18:
      }
        id v8 = a1 + 11;
      BOOL v12 = v8 == v4;
      *(_DWORD *)__int128 buf = 67109634;
      id v13 = "YES";
      if (v12) {
        id v13 = "NO";
      }
      *(_DWORD *)&uint8_t buf[4] = v5;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v6;
      *(_WORD *)&buf[14] = 2082;
      *(void *)&uint8_t buf[16] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "statedump:  useCase:%d maxConnections:%d (override:%{public}s)",  buf,  0x18u);
      uint64_t v2 = (os_log_s *)qword_1008F7698;
    }

    ++v3;
  }

  while (v3 != 9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "statedump: current device states and use cases:",  buf,  2u);
    uint64_t v2 = (os_log_s *)qword_1008F7698;
  }

  uint64_t v14 = (void *)a1[13];
  if (v14 != a1 + 14)
  {
    do
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v15 = v14[5];
        uint64_t v16 = "unknown";
        if (v15 <= 3) {
          uint64_t v16 = off_1008A51E8[v15];
        }
        uint64_t v17 = v14[4];
        if (qword_1008D5F30 != -1) {
          dispatch_once(&qword_1008D5F30, &stru_1008A51C8);
        }
        int v18 = sub_1005CE2FC((uint64_t)off_1008D5F28, (void *)v14[4]);
        *(_DWORD *)__int128 buf = 138543874;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&_BYTE buf[12] = 2082;
        *(void *)&buf[14] = v16;
        *(_WORD *)&_BYTE buf[22] = 1024;
        *(_DWORD *)&uint8_t buf[24] = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "statedump:  device:%{public}@ state:%{public}s usecase:%u",  buf,  0x1Cu);
        uint64_t v2 = (os_log_s *)qword_1008F7698;
      }

      unsigned __int32 v19 = (void *)v14[1];
      if (v19)
      {
        do
        {
          id v20 = v19;
          unsigned __int32 v19 = (void *)*v19;
        }

        while (v19);
      }

      else
      {
        do
        {
          id v20 = (void *)v14[2];
          BOOL v12 = *v20 == (void)v14;
          uint64_t v14 = v20;
        }

        while (!v12);
      }

      uint64_t v14 = v20;
    }

    while (v20 != a1 + 14);
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "statedump: current device connect request bundleIDs:",  buf,  2u);
  }

  __int16 v21 = (const unsigned __int8 *)a1[16];
  if (v21 != (const unsigned __int8 *)(a1 + 17))
  {
    do
    {
      uint64_t v58 = 0LL;
      __int128 v56 = 0u;
      memset(v57, 0, sizeof(v57));
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v51 = 0u;
      memset(buf, 0, sizeof(buf));
      sub_1001FCFC8((uint64_t)buf);
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v23 = *((id *)v21 + 6);
      id v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v42;
        do
        {
          for (uint64_t i = 0LL; i != v24; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(v23);
            }
            id v27 = (const char *)[*(id *)(*((void *)&v41 + 1) + 8 * (void)i) UTF8String];
            size_t v28 = strlen(v27);
            __int16 v29 = sub_1001FD17C(&buf[16], (uint64_t)v27, v28);
            sub_1001FD17C(v29, (uint64_t)",", 1LL);
          }

          id v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }

        while (v24);
      }

      int v30 = (os_log_s *)qword_1008F7698;
      if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
      {
        memset(out, 0, sizeof(out));
        uuid_unparse_upper(v21 + 32, out);
        sub_10002418C(__p, out);
        int v31 = v40;
        NSStringEncoding v32 = (void **)__p[0];
        std::stringbuf::str((std::stringbuf::string_type *)out, (const std::stringbuf *)&buf[24]);
        __int16 v33 = __p;
        if (v31 < 0) {
          __int16 v33 = v32;
        }
        uint64_t v34 = out;
        if (out[23] < 0) {
          uint64_t v34 = *(char **)out;
        }
        *(_DWORD *)id v45 = 136446466;
        __int16 v46 = v33;
        __int16 v47 = 2082;
        unsigned __int16 v48 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "statedump:  device:%{public}s connectRequestBundleIDs:%{public}s",  v45,  0x16u);
        if (out[23] < 0) {
          operator delete(*(void **)out);
        }
        if (v40 < 0) {
          operator delete(__p[0]);
        }
      }

      *(void *)__int128 buf = v22;
      *(void *)&buf[*(void *)(v22 - 24)] = v38;
      *(void *)&uint8_t buf[16] = v37;
      if (SHIBYTE(v55) < 0) {
        operator delete(*((void **)&v54 + 1));
      }
      std::streambuf::~streambuf(&buf[24]);
      std::ios::~ios(v57);
      id v35 = (unsigned __int8 *)*((void *)v21 + 1);
      if (v35)
      {
        do
        {
          __int128 v36 = (const unsigned __int8 **)v35;
          id v35 = *(unsigned __int8 **)v35;
        }

        while (v35);
      }

      else
      {
        do
        {
          __int128 v36 = (const unsigned __int8 **)*((void *)v21 + 2);
          BOOL v12 = *v36 == v21;
          __int16 v21 = (const unsigned __int8 *)v36;
        }

        while (!v12);
      }

      __int16 v21 = (const unsigned __int8 *)v36;
    }

    while (v36 != a1 + 17);
  }

void sub_10064D1FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  sub_1001FD0F4((uint64_t)&a54);
  _Unwind_Resume(a1);
}

uint64_t sub_10064D244(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    unsigned int v9 = (os_log_s *)qword_1008F7698;
    if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(vmemset(__buf, 0, 21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "BundleID is allowed - bundleID is not available",  (uint8_t *)&v21,  2u);
    }

    goto LABEL_9;
  }

  uint64_t v4 = sub_1002E6E00();
  if (((*(uint64_t (**)(uint64_t))(*(void *)v4 + 8LL))(v4) & 1) == 0)
  {
LABEL_9:
    uint64_t v8 = 1LL;
    goto LABEL_10;
  }

  if (([v3 hasPrefix:@"com.apple."] & 1) != 0
    || [v3 hasPrefix:@"com.Apple."])
  {
    uint64_t v6 = CBGenerateObfuscatedSHA256HashedString(v3, v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (([(id)qword_1008F79C8 containsObject:v7] & 1) == 0)
    {
      if (*(_BYTE *)(a1 + 152))
      {
        uint64_t v8 = 0LL;
        goto LABEL_13;
      }

      id v20 = (os_log_s *)qword_1008F7698;
      if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138543362;
        id v22 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is NOT in the CB allowed list but is allowed with overriding.",  (uint8_t *)&v21,  0xCu);
      }
    }

    uint64_t v8 = 1LL;
LABEL_13:

    goto LABEL_15;
  }

  uint64_t v8 = 1LL;
LABEL_15:
  int v11 = *(unsigned __int8 *)(a1 + 153);
  BOOL v12 = (os_log_s *)qword_1008F7698;
  BOOL v13 = os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      uint64_t v15 = CBGenerateObfuscatedSHA256HashedString(v3, v14);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = (void *)v16;
      int v18 = "N";
      int v21 = 138543874;
      id v22 = v3;
      if ((_DWORD)v8) {
        int v18 = "Y";
      }
      __int16 v23 = 2114;
      uint64_t v24 = v16;
      __int16 v25 = 2082;
      NSStringEncoding v26 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "BundleID %{public}@ hash %{public}@ is in the allowed CBSession list:%{public}s",  (uint8_t *)&v21,  0x20u);
    }
  }

  else if (v13)
  {
    unsigned __int32 v19 = "N";
    if ((_DWORD)v8) {
      unsigned __int32 v19 = "Y";
    }
    int v21 = 138543618;
    id v22 = v3;
    __int16 v23 = 2082;
    uint64_t v24 = (uint64_t)v19;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "BundleID %{public}@ is in the allowed CBSession list:%{public}s",  (uint8_t *)&v21,  0x16u);
  }

void sub_10064D4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10064D4FC(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = sub_1002E6E00();
    if (((*(uint64_t (**)(uint64_t))(*(void *)v6 + 8LL))(v6) & 1) != 0
      && (([v5 hasPrefix:@"com.apple."] & 1) != 0
       || [v5 hasPrefix:@"com.Apple."]))
    {
      uint64_t v8 = CBGenerateObfuscatedSHA256HashedString(v5, v7);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      BOOL v10 = v9;
      if (a2 < 3)
      {
        if ([(id)*(&off_1008A5208)[a2] containsObject:v9])
        {
          if (*(_BYTE *)(a1 + 154))
          {
            uint64_t v11 = 1LL;
LABEL_17:

            goto LABEL_13;
          }

          uint64_t v14 = (os_log_s *)qword_1008F7698;
          uint64_t v11 = 0LL;
          if (!os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_17;
          }
          int v15 = 138543618;
          id v16 = v5;
          __int16 v17 = 2048;
          unint64_t v18 = a2;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is required to provide the use case for operation type %ld but check is bypassed due to overriding",  (uint8_t *)&v15,  0x16u);
        }

        uint64_t v11 = 0LL;
        goto LABEL_17;
      }
    }

    goto LABEL_12;
  }

  BOOL v12 = (os_log_s *)qword_1008F7698;
  uint64_t v11 = 0LL;
  if (os_log_type_enabled((os_log_t)qword_1008F7698, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "BundleID is not available.",  (uint8_t *)&v15,  2u);
LABEL_12:
    uint64_t v11 = 0LL;
  }

void sub_10064D6B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10064D6E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = 0LL;
  v7[1] = 0LL;
  sub_100242F28((uint64_t)v7, a1 + 16);
  sub_100241F90(uu2, v3);
  if (a1 + 136 == sub_1001FDB10(a1 + 128, uu2))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"com.unknown"));
  }

  else
  {
    sub_100241F90(uu2, v3);
    uint64_t v8 = uu2;
    id v4 = (id)sub_10064D8B4( (uint64_t **)(a1 + 128),  uu2,  (uint64_t)&unk_1006C2518,  (const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *)&v8)[6];
  }

  id v5 = v4;
  sub_100242FAC((uint64_t)v7);

  return v5;
}

void sub_10064D7E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  _Unwind_Resume(a1);
}

void sub_10064D814(uint64_t a1)
{
  id v1 = (void *)sub_10064DAE8(a1);
  operator delete(v1);
}

void sub_10064D828(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10064D828(a1, *a2);
    sub_10064D828(a1, a2[1]);

    operator delete(a2);
  }

void sub_10064D870(id a1)
{
  id v1 = operator new(0x618uLL);
  sub_10058B0A4();
  off_1008D5F08 = v1;
}

void sub_10064D8A0(_Unwind_Exception *a1)
{
}

uint64_t *sub_10064D8B4( uint64_t **a1, unsigned __int8 *uu1, uint64_t a3, const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a4)
{
  uint64_t v9 = 0LL;
  uint64_t v6 = (uint64_t **)sub_1001FD824((uint64_t)a1, &v9, uu1);
  uint64_t result = *v6;
  if (!*v6)
  {
    memset(v8, 0, sizeof(v8));
    sub_10064D954((uint64_t)a1, a4, v8);
    sub_100029630(a1, v9, v6, (uint64_t *)v8[0]);
    return (uint64_t *)v8[0];
  }

  return result;
}

void sub_10064D954( uint64_t a1@<X0>, const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a2@<X2>, unsigned __int8 **a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0LL;
  a3[2] = 0LL;
  a3[1] = 0LL;
  uint64_t v6 = a3 + 1;
  uint64_t v7 = (unsigned __int8 *)operator new(0x38uLL);
  *a3 = v7;
  *uint64_t v6 = v5;
  *((_BYTE *)a3 + 16) = 0;
  uuid_copy(v7 + 32, *a2);
  *((void *)v7 + 6) = 0LL;
  *((_BYTE *)a3 + 16) = 1;
}

void sub_10064D9C8(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  sub_10064D9E4(v2, v3);
  _Unwind_Resume(a1);
}

void sub_10064D9E4(uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

void sub_10064DA28(id a1)
{
  id v1 = operator new(0x128uLL);
  sub_1005C69F8();
  off_1008D5F28 = v1;
}

void sub_10064DA58(_Unwind_Exception *a1)
{
}

uint64_t sub_10064DA6C(uint64_t **a1, unsigned __int8 *a2)
{
  uint64_t v3 = sub_1001FDB10((uint64_t)a1, a2);
  sub_10064DAB0(a1, v3);
  return 1LL;
}

uint64_t *sub_10064DAB0(uint64_t **a1, uint64_t a2)
{
  uint64_t v3 = sub_1001FDBCC(a1, (uint64_t *)a2);

  operator delete((void *)a2);
  return v3;
}

uint64_t sub_10064DAE8(uint64_t a1)
{
  *(void *)a1 = &off_1008A5198;
  sub_10064D828(a1 + 128, *(void **)(a1 + 136));
  sub_100291CA0(a1 + 104, *(void **)(a1 + 112));
  sub_10023BF24(a1 + 80, *(void **)(a1 + 88));
  sub_100242E28(a1 + 16);
  return a1;
}

void *sub_10064DB3C(void *a1)
{
  uint64_t v2 = sub_1004F5FA8(a1);
  *((_DWORD *)v2 + 4) = 0;
  *((_WORD *)v2 + 10) = 0;
  if (sub_10064DBD4((int)v2, "bluetooth", (uint64_t)(v2 + 2)))
  {
    sub_10064DD4C((uint64_t)a1);
  }

  else
  {
    CFPropertyListRef v3 = sub_10064DFBC();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

    if (v4)
    {
      CFPreferencesSetAppValue(@"GeneratedLocalAddress", 0LL, @"com.apple.BTServer");
      CFPreferencesAppSynchronize(@"com.apple.BTServer");
    }
  }

  return a1;
}

void sub_10064DBC0(_Unwind_Exception *a1)
{
}

uint64_t sub_10064DBD4(int a1, char *name, uint64_t a3)
{
  id v4 = IOServiceNameMatching(name);
  if (!v4) {
    return 1LL;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (!MatchingService) {
    return 1LL;
  }
  io_object_t v6 = MatchingService;
  __int16 v13 = 0;
  *(_DWORD *)buffer = 0;
  uint64_t v7 = 1LL;
  uint64_t v8 = (const __CFData *)IORegistryEntrySearchCFProperty( MatchingService,  "IODeviceTree",  @"local-mac-address",  kCFAllocatorDefault,  1u);
  if (v8)
  {
    uint64_t v9 = v8;
    v20.location = 0LL;
    v20.size_t length = 6LL;
    CFDataGetBytes(v8, v20, buffer);
    *(_DWORD *)a3 = *(_DWORD *)buffer;
    *(_WORD *)(a3 + 4) = v13;
    BOOL v10 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315650;
      int v15 = "getAddressFrom";
      __int16 v16 = 1040;
      int v17 = 6;
      __int16 v18 = 2096;
      unsigned __int32 v19 = buffer;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: DeviceTree address = %{bluetooth:BD_ADDR}.6P",  buf,  0x1Cu);
    }

    CFRelease(v9);
    uint64_t v7 = 0LL;
  }

  IOObjectRelease(v6);
  return v7;
}

void sub_10064DD4C(uint64_t a1)
{
  __int16 v12 = 0;
  int v11 = 0;
  CFPropertyListRef v2 = sub_10064DFBC();
  CFPropertyListRef v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = v4;
    sscanf( (const char *)[v5 UTF8String],  "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx",  &v11,  (char *)&v11 + 1,  (char *)&v11 + 2,  (char *)&v11 + 3,  &v12,  (char *)&v12 + 1);
    io_object_t v6 = (os_log_s *)(id)qword_1008F7710;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (char *)[v5 UTF8String];
      *(_DWORD *)__int128 buf = 136315394;
      int v17 = "getGeneratedLocalAddress";
      __int16 v18 = 2080;
      unsigned __int32 v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Local address from plist:%s.\n",  buf,  0x16u);
    }
  }

  else
  {
    for (uint64_t i = 0LL; i != 6; ++i)
      *((_BYTE *)&v11 + i) = arc4random_uniform(0xFFu);
    *(void *)__str = 0LL;
    uint64_t v14 = 0LL;
    __int16 v15 = 0;
    snprintf( __str,  0x12uLL,  "%02x:%02x:%02x:%02x:%02x:%02x",  v11,  BYTE1(v11),  BYTE2(v11),  HIBYTE(v11),  v12,  HIBYTE(v12));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", __str));
    sub_10064DFE4((uint64_t)v9, v9);

    BOOL v10 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315394;
      int v17 = "getGeneratedLocalAddress";
      __int16 v18 = 2080;
      unsigned __int32 v19 = __str;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Storing local address to plist:%s.\n",  buf,  0x16u);
    }
  }

  *(_DWORD *)(a1 + 16) = v11;
  *(_WORD *)(a1 + 20) = v12;
}

void sub_10064DF84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFPropertyListRef sub_10064DFBC()
{
  return (id)CFPreferencesCopyAppValue( @"GeneratedLocalAddress",  @"com.apple.BTServer");
}

void sub_10064DFE4(uint64_t a1, void *a2)
{
  id v2 = a2;
  CFPreferencesSetAppValue(@"GeneratedLocalAddress", v2, @"com.apple.BTServer");
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
}

void sub_10064E034( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t sub_10064E048()
{
  uint64_t v0 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    CFPropertyListRef v3 = "registerCallbacks";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v2, 0xCu);
  }

  return sub_1001DB5C0((uint64_t)off_1008D9D88);
}

BOOL sub_10064E0F8(uint64_t *a1, _DWORD *a2, uint64_t *a3)
{
  io_object_t v6 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    __int16 v13 = "TransportCreate";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  BOOL v7 = sub_1004F60D4(a1, a2, a3);
  if (v7)
  {
    BOOL v8 = sub_1004F5FF8(a1, *a3);
    uint64_t v9 = (os_log_s *)qword_1008F7710;
    BOOL v10 = os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        int v12 = 136315138;
        __int16 v13 = "TransportCreate";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Link Controller, activate",  (uint8_t *)&v12,  0xCu);
      }

      if (qword_1008D9998 != -1) {
        dispatch_once(&qword_1008D9998, &stru_1008A5220);
      }
      sub_1003A2E04((id *)qword_1008D9990);
    }

    else if (v10)
    {
      int v12 = 136315138;
      __int16 v13 = "TransportCreate";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Not Hci Transport Command",  (uint8_t *)&v12,  0xCu);
    }
  }

  return v7;
}

uint64_t sub_10064E2B0(uint64_t *a1, uint64_t *a2)
{
  BOOL v4 = sub_1004F5FF8(a1, *a2);
  id v5 = (os_log_s *)qword_1008F7710;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v8 = 136315138;
      uint64_t v9 = "TransportFree";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Link Controller Invalidate",  (uint8_t *)&v8,  0xCu);
    }

    if (qword_1008D9998 != -1) {
      dispatch_once(&qword_1008D9998, &stru_1008A5220);
    }
    sub_1003A3200((id *)qword_1008D9990);
  }

  else if (v6)
  {
    int v8 = 136315138;
    uint64_t v9 = "TransportFree";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Invalidate Link Controller faile, invalid handle",  (uint8_t *)&v8,  0xCu);
  }

  return sub_1004F633C(a1, a2);
}

uint64_t sub_10064E3F8(uint64_t a1)
{
  if (qword_1008D9988 != -1) {
    dispatch_once(&qword_1008D9988, &stru_1008A5240);
  }
  return nullsub_63(off_1008D9980, a1);
}

BOOL sub_10064E448(_DWORD *a1, uint64_t *a2)
{
  if (qword_1008D9988 != -1) {
    dispatch_once(&qword_1008D9988, &stru_1008A5240);
  }
  return sub_10064E0F8((uint64_t *)off_1008D9980, a1, a2);
}

uint64_t sub_10064E4A0(uint64_t *a1)
{
  if (qword_1008D9988 != -1) {
    dispatch_once(&qword_1008D9988, &stru_1008A5240);
  }
  return sub_10064E2B0((uint64_t *)off_1008D9980, a1);
}

uint64_t sub_10064E4F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_1008D9988 != -1) {
    dispatch_once(&qword_1008D9988, &stru_1008A5240);
  }
  return sub_1004F6514(off_1008D9980, a1, a2, a3, a4, a5, a6);
}

BOOL sub_10064E578(uint64_t a1)
{
  if (qword_1008D9988 != -1) {
    dispatch_once(&qword_1008D9988, &stru_1008A5240);
  }
  return sub_1004F659C(off_1008D9980, a1);
}

void sub_10064E5C8(id a1)
{
  id v1 = operator new(0x28uLL);
  sub_1003A2DF0((uint64_t)v1);
  qword_1008D9990 = (uint64_t)v1;
}

void sub_10064E5F8(_Unwind_Exception *a1)
{
}

void sub_10064E60C(id a1)
{
  id v1 = operator new(0x18uLL);
  sub_10064DB3C(v1);
  off_1008D9980 = v1;
}

void sub_10064E63C(_Unwind_Exception *a1)
{
}

uint64_t sub_10064E650(uint64_t a1)
{
  *(void *)a1 = off_1008A5270;
  *(void *)(a1 + 8) = &off_1008A5380;
  *(void *)(a1 + 16) = off_1008A5398;
  *(void *)(a1 + sub_100207EF8(v1 + 24) = &off_1008A5400;
  *(void *)(a1 + 32) = off_1008A5418;
  *(void *)(a1 + 40) = off_1008A54C8;
  *(void *)(a1 + 48) = &off_1008A5518;
  *(void *)(a1 + 56) = &off_1008A5530;
  *(void *)(a1 + 64) = off_1008A5548;
  *(void *)(a1 + 72) = off_1008A55A8;
  sub_100242DC4(a1 + 80);
  *(_OWORD *)(a1 + 168) = 0u;
  *(void *)(a1 + 336) = 0LL;
  *(_BYTE *)(a1 + 280) = 0;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 263) = 0u;
  *(void *)(a1 + 328) = a1 + 336;
  *(void *)(a1 + 360) = 0LL;
  *(void *)(a1 + 368) = 0LL;
  *(void *)(a1 + 344) = 0LL;
  *(void *)(a1 + 352) = a1 + 360;
  *(void *)(a1 + 376) = a1 + 384;
  *(void *)(a1 + 384) = 0LL;
  *(void *)(a1 + 408) = 0LL;
  *(void *)(a1 + 416) = 0LL;
  *(void *)(a1 + 392) = 0LL;
  *(void *)(a1 + 400) = a1 + 408;
  *(void *)(a1 + 432) = 0LL;
  *(void *)(a1 + 440) = 0LL;
  *(void *)(a1 + 4sub_100207EF8(v1 + 24) = a1 + 432;
  *(_BYTE *)(a1 + 448) = 0;
  *(_BYTE *)(a1 + 452) = 0;
  *(_DWORD *)(a1 + 456) = 0;
  *(_BYTE *)(a1 + 460) = 0;
  *(_DWORD *)(a1 + 464) = 0;
  *(void *)(a1 + 472) = 0LL;
  *(_DWORD *)(a1 + 480) = 0;
  *(void *)(a1 + 496) = 0LL;
  *(void *)(a1 + 504) = 0LL;
  *(void *)(a1 + 488) = 0LL;
  char v16 = 0;
  uint64_t v2 = sub_1002E6E00();
  sub_10002418C(buf, "CoexManager");
  sub_10002418C(__p, "Disable");
  int v3 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(void *)v2 + 72LL))(v2, buf, __p, &v16);
  if (v16) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (v15 < 0)
  {
    operator delete(*(void **)buf);
    if (v4)
    {
LABEL_8:
      id v5 = (os_log_s *)qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Warning: Disabling WCM interface because of override default",  buf,  2u);
      }

      return a1;
    }
  }

  else if (v4)
  {
    goto LABEL_8;
  }

  if (&WCMEnabled)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", 0LL, 0LL);
    *(void *)(a1 + 144) = mach_service;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10064EA0C;
    handler[3] = &unk_100887318;
    handler[4] = a1;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(*(xpc_connection_t *)(a1 + 144));
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A0FC4();
  }

  *(_BYTE *)(a1 + 154) = 0;
  int v10 = 0;
  uint64_t v7 = sub_1002E6E00();
  sub_10002418C(buf, "BTUCM");
  sub_10002418C(__p, "BTUCMForceFacetimeWifiCoexOverride");
  *(_BYTE *)(a1 + 154) = (*(uint64_t (**)(uint64_t, uint8_t *, void **, int *))(*(void *)v7 + 88LL))( v7,  buf,  __p,  &v10);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (v15 < 0) {
    operator delete(*(void **)buf);
  }
  if (*(_BYTE *)(a1 + 154)) {
    int v8 = v10;
  }
  else {
    int v8 = 0;
  }
  *(_DWORD *)(a1 + 156) = v8;
  *(void *)(a1 + 160) = 0LL;
  *(_BYTE *)(a1 + 452) = 0;
  *(_DWORD *)(a1 + 456) = 0;
  *(_BYTE *)(a1 + 460) = 0;
  *(_DWORD *)(a1 + 464) = 0;
  return a1;
}

void sub_10064E948( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, void *a22, uint64_t a23, int a24, __int16 a25, char a26, char a27)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  uint64_t v31 = v29;
  uint64_t v32 = v29 - 8;
  uint64_t v33 = v31 + 16;
  uint64_t v34 = v31 + 40;
  uint64_t v35 = v31 + 64;
  uint64_t v36 = v31 + 88;
  uint64_t v37 = *(void **)(v31 + 152);
  if (v37)
  {
    *(void *)(v27 + 496) = v37;
    operator delete(v37);
  }

  sub_10023BF24(v36, *(void **)(v27 + 432));
  sub_10023BF24(v35, *(void **)(v27 + 408));
  sub_10023BF24(v34, *(void **)(v27 + 384));
  sub_10023BF24(v33, *(void **)(v27 + 360));
  sub_10023BF24(v32, *(void **)(v27 + 336));
  sub_100242E28(v28);
  _Unwind_Resume(a1);
}

void sub_10064EA0C(uint64_t a1, void *a2)
{
}

void sub_10064EA14(os_unfair_lock_s *a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    sub_10064F5E0(a1, object);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_interrupted)
    {
      sub_10064F8A4((uint64_t)a1);
    }

    else
    {
      BOOL v6 = (os_log_s *)qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
        sub_1006A0FF0(object, v6);
      }
    }
  }

  else
  {
    id v5 = xpc_copy_description(object);
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
      sub_1006A1070();
    }
    free(v5);
  }

uint64_t sub_10064EB04(uint64_t a1)
{
  *(void *)a1 = off_1008A5270;
  *(void *)(a1 + 8) = &off_1008A5380;
  *(void *)(a1 + 16) = off_1008A5398;
  *(void *)(a1 + sub_100207EF8(v1 + 24) = &off_1008A5400;
  *(void *)(a1 + 32) = off_1008A5418;
  *(void *)(a1 + 40) = off_1008A54C8;
  *(void *)(a1 + 48) = &off_1008A5518;
  *(void *)(a1 + 56) = &off_1008A5530;
  *(void *)(a1 + 64) = off_1008A5548;
  *(void *)(a1 + 72) = off_1008A55A8;
  if (&WCMEnabled) {
    xpc_release(*(xpc_object_t *)(a1 + 144));
  }
  uint64_t v2 = *(void **)(a1 + 488);
  if (v2)
  {
    *(void *)(a1 + 496) = v2;
    operator delete(v2);
  }

  sub_10023BF24(a1 + 424, *(void **)(a1 + 432));
  sub_10023BF24(a1 + 400, *(void **)(a1 + 408));
  sub_10023BF24(a1 + 376, *(void **)(a1 + 384));
  sub_10023BF24(a1 + 352, *(void **)(a1 + 360));
  sub_10023BF24(a1 + 328, *(void **)(a1 + 336));
  sub_100242E28(a1 + 80);
  return a1;
}

void sub_10064EBD4(_Unwind_Exception *a1)
{
  int v3 = *(void **)(v1 + 488);
  if (v3)
  {
    *(void *)(v1 + 496) = v3;
    operator delete(v3);
  }

  sub_10023BF24(v1 + 424, *(void **)(v1 + 432));
  sub_10023BF24(v1 + 400, *(void **)(v1 + 408));
  sub_10023BF24(v1 + 376, *(void **)(v1 + 384));
  sub_10023BF24(v1 + 352, *(void **)(v1 + 360));
  sub_10023BF24(v1 + 328, *(void **)(v1 + 336));
  sub_100242E28(v1 + 80);
  _Unwind_Resume(a1);
}

void sub_10064EC40(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10064EB04(a1);
  operator delete(v1);
}

uint64_t sub_10064EC54(uint64_t a1, uint64_t a2)
{
  v5[0] = 0LL;
  v5[1] = 0LL;
  sub_100242F28((uint64_t)v5, a1 + 80);
  sub_10064ECB4(a1 + 480, a2);
  return sub_100242FAC((uint64_t)v5);
}

void sub_10064ECA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10064ECB4(uint64_t a1, uint64_t a2)
{
  id v5 = *(char **)(a1 + 8);
  int v4 = *(char **)(a1 + 16);
  if (v5 != v4)
  {
    while (*(void *)v5 != a2)
    {
      v5 += 8;
      if (v5 == v4)
      {
        id v5 = *(char **)(a1 + 16);
        break;
      }
    }
  }

  if (v5 == v4)
  {
    uint64_t v6 = a2;
    sub_1006565A4(a1 + 8, v4, (char *)&v6);
    sub_100008A30(a1 + 8);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)a1);
}

uint64_t sub_10064ED3C(uint64_t a1, uint64_t a2)
{
  v5[0] = 0LL;
  v5[1] = 0LL;
  sub_100242F28((uint64_t)v5, a1 + 80);
  sub_100009168(a1 + 480, a2);
  return sub_100242FAC((uint64_t)v5);
}

void sub_10064ED88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10064ED9C(uint64_t a1)
{
  if (&WCMEnabled)
  {
    sub_10064F06C(a1);
    if (qword_1008D60D0 != -1) {
      dispatch_once(&qword_1008D60D0, &stru_1008A5658);
    }
    sub_1004229CC(off_1008D60C8, a1 + 8);
    if (qword_1008D6788 != -1) {
      dispatch_once(&qword_1008D6788, &stru_1008A5678);
    }
    sub_10024DD9C((uint64_t)off_1008D6780 + 80, a1 + 24);
    if (qword_1008D5F10 != -1) {
      dispatch_once(&qword_1008D5F10, &stru_1008A5698);
    }
    sub_100594810((uint64_t)off_1008D5F08, a1 + 32, 0);
    if (qword_1008D6198 != -1) {
      dispatch_once(&qword_1008D6198, &stru_1008A56B8);
    }
    sub_100447B0C((uint64_t)off_1008D6190, a1 + 40);
    uint64_t v2 = sub_1002E8D54();
    sub_1001FCB98(v2 + 288, a1 + 48);
    if (qword_1008D93F8 != -1) {
      dispatch_once(&qword_1008D93F8, &stru_1008A56D8);
    }
    sub_10048B8E4(qword_1008D93F0, a1 + 56);
    if (qword_1008D6608 != -1) {
      dispatch_once(&qword_1008D6608, &stru_1008A56F8);
    }
    sub_10004FAD0((uint64_t)off_1008D6600 + 1872, a1 + 64);
    if (qword_1008D5F50 != -1) {
      dispatch_once(&qword_1008D5F50, &stru_1008A5718);
    }
    sub_10000876C((uint64_t)off_1008D5F48 + 240, a1 + 72);
    *(void *)&__int128 v3 = -1LL;
    *((void *)&v3 + 1) = -1LL;
    *(_OWORD *)(a1 + 248) = v3;
    *(_OWORD *)(a1 + 232) = v3;
    *(_OWORD *)(a1 + 216) = v3;
    *(_OWORD *)(a1 + 200) = v3;
    *(_OWORD *)(a1 + 184) = v3;
    *(_OWORD *)(a1 + 168) = v3;
    int v4 = *(void **)(a1 + 472);
    *(void *)(a1 + 472) = @"XZ";

    if (qword_1008D6198 != -1) {
      dispatch_once(&qword_1008D6198, &stru_1008A56B8);
    }
    sub_1004488F4((uint64_t)off_1008D6190, *(void **)(a1 + 472));
    *(_DWORD *)(a1 + 281) = 0;
    *(_OWORD *)(a1 + 288) = xmmword_1006C48D0;
    *(void *)(a1 + 304) = 0LL;
    *(void *)(a1 + 312) = 0LL;
    *(_DWORD *)(a1 + 320) = 0;
    uint64_t v5 = sub_100404EB8();
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10064F110;
    v6[3] = &unk_10087EB20;
    v6[4] = a1;
    sub_100405384(v5, v6);
    sub_10064F1B0(a1);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A10D4();
  }

void sub_10064F06C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking in with WCM", v4, 2u);
  }

  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v3, "kWCMRegisterProcess_ProcessId", 4uLL);
  sub_10064F4EC(a1, 1uLL, v3);
  xpc_release(v3);
}

uint64_t sub_10064F110(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  __int16 v8 = 0;
  __int16 v7 = 0;
  char v6 = 0;
  int v5 = 0;
  uint64_t v2 = sub_1002E8D54();
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, __int16 *, char *, __int16 *, char *, int *))(*(void *)v2 + 48LL))( v2,  (char *)&v8 + 1,  &v8,  (char *)&v7 + 1,  &v7,  &v6,  &v5);
  if (!(_DWORD)result)
  {
    *(_BYTE *)(v1 + 452) = v7;
    if (HIBYTE(v8))
    {
      int v4 = 1;
    }

    else if ((_BYTE)v8)
    {
      int v4 = 2;
    }

    else
    {
      if (!HIBYTE(v7))
      {
        *(_DWORD *)(v1 + 456) = 0;
        return result;
      }

      int v4 = 3;
    }

    *(_DWORD *)(v1 + 456) = v4;
  }

  return result;
}

void sub_10064F1B0(uint64_t a1)
{
  if (qword_1008D6788 != -1) {
    dispatch_once(&qword_1008D6788, &stru_1008A5678);
  }
  int v2 = sub_1002075B4((uint64_t)off_1008D6780);
  xpc_object_t v3 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v2 == 1;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "SendLocalDeviceState with state %d",  (uint8_t *)v5,  8u);
  }

  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v4, "kWCMBTLocalDeviceState", v2 == 1);
  sub_10064F4EC(a1, 0x1FAuLL, v4);
  xpc_release(v4);
}

void sub_10064F2DC(uint64_t a1)
{
  *(void *)(a1 + 432) = 0LL;
  *(void *)(a1 + 440) = 0LL;
  *(void *)(a1 + 4sub_100207EF8(v1 + 24) = a1 + 432;
  if (&WCMEnabled)
  {
    uint64_t v2 = sub_1002E6E9C();
    sub_1002D08D4(v2, a1 + 16);
    if (qword_1008D60D0 != -1) {
      dispatch_once(&qword_1008D60D0, &stru_1008A5658);
    }
    sub_100422AD4((uint64_t)off_1008D60C8, a1 + 8);
    if (qword_1008D6788 != -1) {
      dispatch_once(&qword_1008D6788, &stru_1008A5678);
    }
    sub_100009168((uint64_t)off_1008D6780 + 80, a1 + 24);
    if (qword_1008D5F10 != -1) {
      dispatch_once(&qword_1008D5F10, &stru_1008A5698);
    }
    sub_100594914((uint64_t)off_1008D5F08, a1 + 32);
    if (qword_1008D6198 != -1) {
      dispatch_once(&qword_1008D6198, &stru_1008A56B8);
    }
    sub_100447B9C((uint64_t)off_1008D6190, a1 + 40);
    if (qword_1008D93F8 != -1) {
      dispatch_once(&qword_1008D93F8, &stru_1008A56D8);
    }
    sub_10048B974(qword_1008D93F0, a1 + 56);
    if (qword_1008D6608 != -1) {
      dispatch_once(&qword_1008D6608, &stru_1008A56F8);
    }
    sub_100009168((uint64_t)off_1008D6600 + 1872, a1 + 64);
    if (qword_1008D5F50 != -1) {
      dispatch_once(&qword_1008D5F50, &stru_1008A5718);
    }
    sub_100009168((uint64_t)off_1008D5F48 + 240, a1 + 72);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A1100();
  }

void sub_10064F4EC(uint64_t a1, uint64_t value, void *a3)
{
  if (&WCMEnabled)
  {
    *(_OWORD *)keys = *(_OWORD *)&off_1008A5628;
    object[0] = xpc_uint64_create(value);
    object[1] = a3;
    xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, object, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 144), v5);
    xpc_release(object[0]);
    xpc_release(v5);
  }

  else
  {
    char v6 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
    {
      LOWORD(keys[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "WCM not enabled, discarding message",  (uint8_t *)keys,  2u);
    }
  }

uint64_t sub_10064F5E0(os_unfair_lock_s *a1, void *a2)
{
  v8[0] = 0LL;
  v8[1] = 0LL;
  sub_100242F28((uint64_t)v8, (uint64_t)&a1[20]);
  uunsigned __int16 int64 = xpc_dictionary_get_uint64(a2, "kMessageId");
  uint64_t v5 = uint64;
  switch(uint64)
  {
    case 0x578uLL:
    case 0x579uLL:
    case 0x57AuLL:
    case 0x581uLL:
      return sub_100242FAC((uint64_t)v8);
    case 0x57BuLL:
    case 0x57CuLL:
    case 0x57DuLL:
    case 0x588uLL:
    case 0x58BuLL:
    case 0x58CuLL:
    case 0x592uLL:
    case 0x593uLL:
    case 0x595uLL:
    case 0x596uLL:
    case 0x597uLL:
      goto LABEL_5;
    case 0x57EuLL:
      sub_10064FE84(uint64, a2);
      break;
    case 0x57FuLL:
      sub_10064FF0C(uint64, a2);
      break;
    case 0x580uLL:
      sub_100650010(uint64, a2);
      break;
    case 0x582uLL:
      sub_100650664(uint64, a2);
      break;
    case 0x583uLL:
      sub_1006507E8(uint64, a2);
      break;
    case 0x584uLL:
      sub_100650A8C(uint64, a2);
      break;
    case 0x585uLL:
      sub_100650C74(uint64, a2);
      break;
    case 0x586uLL:
      sub_100650CEC(uint64, a2);
      break;
    case 0x587uLL:
      xpc_dictionary_get_string(a2, "kMessageArgs");
      break;
    case 0x589uLL:
      sub_100650D78((uint64_t)a1, a2);
      break;
    case 0x58AuLL:
      sub_100650FDC(uint64, a2);
      break;
    case 0x58DuLL:
      sub_1006510BC((uint64_t)a1, a2);
      break;
    case 0x58EuLL:
      sub_100651378(uint64, a2);
      break;
    case 0x58FuLL:
      sub_1006503A4(uint64, a2);
      break;
    case 0x590uLL:
      sub_100651530(uint64, a2);
      break;
    case 0x591uLL:
      sub_100650160(uint64, a2);
      break;
    case 0x594uLL:
      sub_100651D9C((uint64_t)a1, a2);
      break;
    case 0x598uLL:
      sub_1006520DC((uint64_t)a1, a2);
      break;
    case 0x599uLL:
      sub_1006526C0((uint64_t)a1, a2);
      break;
    case 0x59AuLL:
      sub_1006527D4((uint64_t)a1, a2);
      break;
    case 0x59BuLL:
      sub_1006525AC((uint64_t)a1, a2);
      break;
    case 0x59CuLL:
      sub_100651C60(a1, a2);
      break;
    case 0x59DuLL:
      sub_100651634(a1, a2);
      break;
    case 0x59EuLL:
      sub_100651B24(a1, a2);
      break;
    case 0x59FuLL:
      sub_1006518AC(a1, a2);
      break;
    case 0x5A0uLL:
      sub_1006519E8(a1, a2);
      break;
    case 0x5A1uLL:
      sub_100652B68(a1, a2);
      break;
    case 0x5A2uLL:
      sub_100651770(a1, a2);
      break;
    default:
      if (uint64 == 106)
      {
        sub_100651F58((uint64_t)a1, a2);
      }

      else
      {
LABEL_5:
        __int16 v7 = (os_log_s *)qword_1008F7580;
        if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 134217984;
          uint64_t v10 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received unknown event %llu from WCM/UCM",  buf,  0xCu);
        }
      }

      break;
  }

  return sub_100242FAC((uint64_t)v8);
}

void sub_10064F888(_Unwind_Exception *exception_object)
{
}

void sub_10064F8A4(uint64_t a1)
{
}

void sub_10064F8E0(uint64_t a1)
{
  __int16 v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  if (qword_1008D67E8 != -1) {
    dispatch_once(&qword_1008D67E8, &stru_1008A5798);
  }
  sub_1003C9C48((uint64_t)off_1008D67E0, (void **)&v8);
  uint64_t v2 = v8;
  xpc_object_t v3 = v9;
  if (v8 != v9)
  {
    do
    {
      int v4 = sub_1003D994C(*v2);
      unsigned int v5 = 1;
      do
      {
        if ((v5 & v4) != 0) {
          sub_100653404( a1,  ((unint64_t)*(unsigned __int8 *)(*v2 + 128) << 40) | ((unint64_t)*(unsigned __int8 *)(*v2 + 129) << 32) | ((unint64_t)*(unsigned __int8 *)(*v2 + 130) << 24) | ((unint64_t)*(unsigned __int8 *)(*v2 + 131) << 16) | ((unint64_t)*(unsigned __int8 *)(*v2 + 132) << 8) | *(unsigned __int8 *)(*v2 + 133),  v5,  0xBu,  0);
        }
        v5 *= 2;
      }

      while ((v5 & 0x80000000) == 0);
      int v7 = *(_DWORD *)(*v2 + 1320);
      if ((v7 & 0x10) != 0)
      {
        char v6 = (unsigned __int8 *)*v2;
        sub_100653804( a1,  ((unint64_t)v6[128] << 40) | ((unint64_t)v6[129] << 32) | ((unint64_t)v6[130] << 24) | ((unint64_t)v6[131] << 16) | ((unint64_t)v6[132] << 8) | v6[133],  2uLL,  16,  201,  0,  1u);
      }

      if ((v7 & 1) != 0) {
        sub_100653804( a1,  ((unint64_t)*(unsigned __int8 *)(*v2 + 128) << 40) | ((unint64_t)*(unsigned __int8 *)(*v2 + 129) << 32) | ((unint64_t)*(unsigned __int8 *)(*v2 + 130) << 24) | ((unint64_t)*(unsigned __int8 *)(*v2 + 131) << 16) | ((unint64_t)*(unsigned __int8 *)(*v2 + 132) << 8) | *(unsigned __int8 *)(*v2 + 133),  1uLL,  1,  101,  0,  1u);
      }
      ++v2;
    }

    while (v2 != v3);
    uint64_t v2 = v8;
  }

  if (v2)
  {
    uint64_t v9 = v2;
    operator delete(v2);
  }

void sub_10064FA94( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10064FABC(uint64_t a1)
{
  if (qword_1008D5F10 != -1) {
    dispatch_once(&qword_1008D5F10, &stru_1008A5698);
  }
  id v2 = sub_10059A34C((uint64_t)off_1008D5F08);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      char v6 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v6);
        if (qword_1008D5F10 != -1) {
          dispatch_once(&qword_1008D5F10, &stru_1008A5698);
        }
        __int16 v8 = off_1008D5F08;
        sub_100241F90(v14, v7);
        if (sub_1005996B4((uint64_t)v8, v14))
        {
          if (qword_1008D5F30 != -1) {
            dispatch_once(&qword_1008D5F30, &stru_1008A5778);
          }
          unint64_t v9 = sub_1005CC198((uint64_t)off_1008D5F28, v7, 0);
          sub_100653404(a1, v9, 0x8000u, 0xBu, 0);
        }

        char v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }

    while (v4);
  }

  if (qword_1008D6198 != -1) {
    dispatch_once(&qword_1008D6198, &stru_1008A56B8);
  }
  if (*((_BYTE *)off_1008D6190 + 199)) {
    sub_100653804(a1, 1LL, 3uLL, 0x10000, 801, 0, 1u);
  }
}

void sub_10064FCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10064FD14(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 400);
  id v2 = (void *)(a1 + 408);
  if (v1 != (void *)(a1 + 408))
  {
    do
    {
      xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v4, "kWCMBTLeDiscoveryScan_State", 1LL);
      xpc_dictionary_set_int64(v4, "kWCMBTLeDiscoveryScan_UseCase", 1LL);
      uint64_t v5 = (os_log_s *)qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        char v6 = sub_100655CD8(*((_DWORD *)v1 + 7));
        *(_DWORD *)__int128 buf = 136315138;
        __int128 v11 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "sendLEScanningUseCaseInfo: Sending Notification to WiFi for CBUseCase %s",  buf,  0xCu);
      }

      sub_10064F4EC(a1, 0x206uLL, v4);
      int v7 = (void *)v1[1];
      if (v7)
      {
        do
        {
          __int16 v8 = v7;
          int v7 = (void *)*v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          __int16 v8 = (void *)v1[2];
          BOOL v9 = *v8 == (void)v1;
          uint64_t v1 = v8;
        }

        while (!v9);
      }

      uint64_t v1 = v8;
    }

    while (v8 != v2);
  }

uint64_t sub_10064FE84(int a1, xpc_object_t xdict)
{
  if (xpc_dictionary_get_uint64(xdict, "kMessageArgs"))
  {
    if (qword_1008D6788 != -1) {
      dispatch_once(&qword_1008D6788, &stru_1008A5678);
    }
    sub_10040D3E4((uint64_t)off_1008D6780);
  }

  else
  {
    if (qword_1008D6788 != -1) {
      dispatch_once(&qword_1008D6788, &stru_1008A5678);
    }
    sub_10040D774((uint64_t)off_1008D6780);
  }

  return 1LL;
}

uint64_t sub_10064FF0C(int a1, xpc_object_t xdict)
{
  uunsigned __int16 int64 = xpc_dictionary_get_uint64(xdict, "kWCMBTPreferredRole");
  id v3 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = uint64 == 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Setting preferred role to : %d", (uint8_t *)v5, 8u);
  }

  LOBYTE(v5[0]) = 0;
  sub_100242CA4(v5);
  sub_100118D44(uint64 == 0);
  sub_100242CD0(v5);
  sub_100242CD8(v5);
  return 1LL;
}

void sub_10064FFF4(_Unwind_Exception *exception_object)
{
}

uint64_t sub_100650010(int a1, xpc_object_t xdict)
{
  __int16 v16 = 0;
  size_t length = 0LL;
  uint64_t v15 = 0LL;
  int data = xpc_dictionary_get_data(xdict, "kMessageArgs", &length);
  if (data) {
    BOOL v3 = length >= 0xA;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3) {
    return 1LL;
  }
  for (uint64_t i = 0LL; i != 10; ++i)
    *((_BYTE *)&v15 + i) = data[i];
  if (qword_1008D6788 != -1) {
    dispatch_once(&qword_1008D6788, &stru_1008A5678);
  }
  if (sub_1002075B4((uint64_t)off_1008D6780) == 1)
  {
    char v13 = 0;
    sub_100242CA4(&v13);
    int v11 = sub_10011EA98((uint64_t)sub_100653150, (uint64_t)&v15, v5, v6, v7, v8, v9, v10);
    sub_100242CD0(&v13);
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
        sub_10067BFB4();
      }
    }

    sub_100242CD8(&v13);
    return 1LL;
  }

  return 202LL;
}

void sub_100650144( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
}

uint64_t sub_100650160(int a1, xpc_object_t xdict)
{
  char v21 = 0;
  int v20 = 0;
  size_t length = 0LL;
  int data = xpc_dictionary_get_data(xdict, "kMessageArgs", &length);
  if (!data)
  {
    uint64_t v12 = qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      char v13 = "WCMBLESetChannelMap message is not in expected format";
      uint64_t v14 = (os_log_s *)v12;
      uint32_t v15 = 2;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }

    return 1LL;
  }

  size_t v3 = length;
  if (length != 5)
  {
    uint64_t v16 = qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      size_t v23 = v3;
      char v13 = "WCMBLESetChannelMap message has unexpected AFH map with length %zu";
      uint64_t v14 = (os_log_s *)v16;
      uint32_t v15 = 12;
      goto LABEL_17;
    }

    return 1LL;
  }

  if (qword_1008D6788 != -1) {
    dispatch_once(&qword_1008D6788, &stru_1008A5678);
  }
  if (sub_1002075B4((uint64_t)off_1008D6780) == 1)
  {
    for (uint64_t i = 0LL; i != 5; ++i)
      *((_BYTE *)&v20 + i) = data[i];
    buf[0] = 0;
    sub_100242CA4(buf);
    uint64_t v11 = sub_1001214B4(180, (uint64_t)sub_1006532CC, v5, v6, v7, v8, v9, v10, (uint64_t)&v20);
    sub_100242CD0(buf);
    if ((_DWORD)v11)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
        sub_1006A112C();
      }
      uint64_t v11 = 1LL;
    }

    sub_100242CD8(buf);
  }

  else
  {
    __int16 v18 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "WCMBLESetChannelMap message cannot be handled as the power state is OFF",  buf,  2u);
    }

    return 202LL;
  }

  return v11;
}

void sub_100650388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
}

uint64_t sub_1006503A4(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_1002E6BF0();
  if (((*(uint64_t (**)(uint64_t))(*(void *)v3 + 136LL))(v3) & 1) != 0)
  {
    uint64_t v4 = sub_1002E6E00();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v4 + 360LL))(v4))
    {
      uint64_t v5 = (os_log_s *)qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        uint64_t v6 = "Diversity host assisted AFH maps overridden: maps from coex manager ignored";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      }
    }

    else
    {
      xpc_object_t value = xpc_dictionary_get_value(a2, "kMessageArgs");
      if (value)
      {
        uint64_t v9 = value;
        size_t v23 = 0LL;
        size_t length = 0LL;
        size_t v21 = 0LL;
        size_t v22 = 0LL;
        int data = xpc_dictionary_get_data(value, "kWCMBTDiversityChannelMap_C0B0", &length);
        uint64_t v11 = xpc_dictionary_get_data(v9, "kWCMBTDiversityChannelMap_C0B1", &v23);
        uint64_t v12 = xpc_dictionary_get_data(v9, "kWCMBTDiversityChannelMap_C1B0", &v22);
        char v13 = xpc_dictionary_get_data(v9, "kWCMBTDiversityChannelMap_C1B1", &v21);
        uint64_t v14 = (os_log_s *)qword_1008F7580;
        if (data && length >= 0xA && v11 && v23 >= 0xA && v12 && v22 >= 0xA && (uint32_t v15 = v13) != 0LL && v21 > 9)
        {
          if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Sending diversity host assisted AFH maps",  buf,  2u);
          }

          *(_WORD *)__int128 buf = 0;
          uint64_t v16 = *(void *)data;
          __int16 v27 = data[4];
          uint64_t v26 = v16;
          __int16 v28 = 256;
          uint64_t v17 = *(void *)v11;
          __int16 v30 = v11[4];
          uint64_t v29 = v17;
          __int16 v31 = 512;
          uint64_t v18 = *(void *)v12;
          __int16 v33 = v12[4];
          uint64_t v32 = v18;
          __int16 v34 = 768;
          uint64_t v19 = *(void *)v15;
          __int16 v36 = v15[4];
          uint64_t v35 = v19;
          uint64_t v20 = sub_1002E6E9C();
          (*(void (**)(uint64_t, uint64_t, uint8_t *))(*(void *)v20 + 912LL))(v20, 4LL, buf);
        }

        else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
        {
          sub_1006A1184();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
      {
        sub_1006A1158();
      }
    }
  }

  else
  {
    uint64_t v5 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      uint64_t v6 = "Diversity not supported on this platform: host assisted AFH maps from coex manager ignored";
      goto LABEL_7;
    }
  }

  return 1LL;
}

uint64_t sub_100650664(uint64_t a1, void *a2)
{
  uint64_t v3 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Received MWS Channel Parameters", buf, 2u);
  }

  int v10 = 0;
  *(void *)__int128 buf = 0LL;
  xpc_object_t value = xpc_dictionary_get_value(a2, "kMessageArgs");
  if (value)
  {
    uint64_t v5 = value;
    buf[0] = xpc_dictionary_get_uint64(value, "kWCMBTSetMWSChannelParameters_Enable");
    *(_WORD *)&uint8_t buf[2] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSChannelParameters_RxCenterFrequency");
    *(_WORD *)&uint8_t buf[4] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSChannelParameters_TxCenterFrequency");
    *(_WORD *)&buf[6] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSChannelParameters_RxChannelBandwidth");
    LOWORD(v10) = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSChannelParameters_TxChannelBandwidth");
    BYTE2(v10) = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSChannelParameters_Type");
    if (qword_1008D60B0 != -1) {
      dispatch_once(&qword_1008D60B0, &stru_1008A5738);
    }
    sub_10043743C((uint64_t)off_1008D60A8, 12LL, (uint64_t)buf);
  }

  else
  {
    uint64_t v6 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Invalid argument for Channel Parameters", v8, 2u);
    }
  }

  return 1LL;
}

uint64_t sub_1006507E8(int a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  uint64_t v3 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Received MWS External Frame Config", v19, 2u);
  }

  if (!value) {
    return 1LL;
  }
  v20[0] = xpc_dictionary_get_uint64(value, "kWCMBTSetMWSExternalConfig_ExtFrameDuration");
  v20[1] = xpc_dictionary_get_int64(value, "kWCMBTSetMWSExternalConfig_ExtFrameSyncAssertOffset");
  void v20[2] = xpc_dictionary_get_uint64(value, "kWCMBTSetMWSExternalConfig_ExtFrameSyncAssertJitter");
  uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMBTSetMWSExternalConfig_ExtNumPeriods");
  LOBYTE(v20[3]) = uint64;
  xpc_object_t v5 = xpc_dictionary_get_value(value, "kWCMBTSetMWSExternalConfig_ExtPeriodDuration");
  xpc_object_t v6 = xpc_dictionary_get_value(value, "kWCMBTSetMWSExternalConfig_ExtPeriodType");
  if (uint64 - 1 >= 0x20)
  {
    uint64_t v11 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
      sub_1006A129C(uint64, v11, v12, v13, v14, v15, v16, v17);
    }
    return 1LL;
  }

  if (!v5 || (uint64_t v7 = v6) == 0LL)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
      sub_1006A1270();
    }
    return 1LL;
  }

  size_t count = xpc_array_get_count(v5);
  if (count != uint64)
  {
    uint64_t v18 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
      sub_1006A11DC(uint64, v5, v18);
    }
    return 1LL;
  }

  if (xpc_array_get_count(v7) != count)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
      sub_1006A11B0();
    }
    return 1LL;
  }

  size_t v9 = 0LL;
  do
  {
    v20[v9 + 4] = xpc_array_get_uint64(v5, v9);
    *((_BYTE *)&v20[36] + v9) = xpc_array_get_uint64(v7, v9);
    ++v9;
  }

  while (v9 < uint64);
  if (qword_1008D60B0 != -1) {
    dispatch_once(&qword_1008D60B0, &stru_1008A5738);
  }
  sub_100437258((uint64_t)off_1008D60A8, 104LL, v20);
  return 0LL;
}

uint64_t sub_100650A8C(uint64_t a1, void *a2)
{
  uint64_t v3 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
  {
    v7[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Received MWS Signaling Command", (uint8_t *)v7, 2u);
  }

  xpc_object_t value = xpc_dictionary_get_value(a2, "kMessageArgs");
  if (value)
  {
    xpc_object_t v5 = value;
    v7[0] = xpc_dictionary_get_int64(value, "kWCMBTSetMWSSignaling_MWSRxAssertOffset");
    v7[1] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSSignaling_MWSRxAssertJitter");
    void v7[2] = xpc_dictionary_get_int64(v5, "kWCMBTSetMWSSignaling_MWSRxDeAssertOffset");
    v7[3] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSSignaling_MWSRxDeAssertJitter");
    void v7[4] = xpc_dictionary_get_int64(v5, "kWCMBTSetMWSSignaling_MWSTxAssertOffset");
    void v7[5] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSSignaling_MWSTxAssertJitter");
    v7[6] = xpc_dictionary_get_int64(v5, "kWCMBTSetMWSSignaling_MWSTxDeAssertOffset");
    v7[7] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSSignaling_MWSTxDeAssertJitter");
    v7[8] = xpc_dictionary_get_int64(v5, "kWCMBTSetMWSSignaling_MWSPatternAssertOffset");
    v7[9] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSSignaling_MWSPatternAssertJitter");
    v7[10] = xpc_dictionary_get_int64(v5, "kWCMBTSetMWSSignaling_MWSInactivityAssertOffset");
    v7[11] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSSignaling_MWSInactivityAssertJitter");
    v7[12] = xpc_dictionary_get_int64(v5, "kWCMBTSetMWSSignaling_MWSScanFrequencyAssertOffset");
    v7[13] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSSignaling_MWSScanFrequencyAssertJitter");
    v7[14] = xpc_dictionary_get_uint64(v5, "kWCMBTSetMWSSignaling_MWSPriorityAssertOffsetRequest");
    if (qword_1008D60B0 != -1) {
      dispatch_once(&qword_1008D60B0, &stru_1008A5738);
    }
    sub_100437688((uint64_t)off_1008D60A8, 30LL, v7);
  }

  return 1LL;
}

uint64_t sub_100650C74(int a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (value)
  {
    uint64_t v3 = value;
    v6[0] = xpc_dictionary_get_uint64(value, "kWCMBTSetWCI2Mode_ReceiveMessage");
    v6[1] = xpc_dictionary_get_uint64(v3, "kWCMBTSetWCI2Mode_SendMessage");
    uint64_t v4 = sub_1002E6E9C();
    (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(void *)v4 + 488LL))(v4, 2LL, v6);
  }

  return 1LL;
}

uint64_t sub_100650CEC(int a1, xpc_object_t xdict)
{
  __int16 v5 = 0;
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  xpc_retain(value);
  if (value)
  {
    LOBYTE(v5) = xpc_dictionary_get_uint64(value, "kWCMBTTriggerWCI2Message_MessageId");
    HIBYTE(v5) = xpc_dictionary_get_uint64(value, "kWCMBTTriggerWCI2Message_Value1");
  }

  xpc_release(value);
  uint64_t v3 = sub_1002E6E9C();
  (*(void (**)(uint64_t, uint64_t, __int16 *))(*(void *)v3 + 512LL))(v3, 2LL, &v5);
  return 1LL;
}

uint64_t sub_100650D78(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  uint64_t v4 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Setting LTE Link Quality Mode", buf, 2u);
  }

  if (value)
  {
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMBTSetLinkQuality_Duration");
    char v20 = xpc_dictionary_get_uint64(value, "kWCMBTSetLinkQuality_EventType");
    unsigned __int8 v5 = xpc_dictionary_get_uint64(value, "kWCMBTSetLinkQuality_Mode");
    int v6 = v5;
    unsigned __int8 v21 = v5;
    __int16 v22 = xpc_dictionary_get_uint64(value, "kWCMBTSetLinkQuality_RxThreshold");
    __int16 v23 = xpc_dictionary_get_uint64(value, "kWCMBTSetLinkQuality_TxThreshold");
    uint64_t v7 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(value, "kWCMBTSetLinkQuality_DeviceAddress"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    size_t v9 = v8;
    if (v6)
    {
      unint64_t v10 = sub_1005C02B0(v8);
      if (!v10 && os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
        sub_1006A1368();
      }
      if (qword_1008D5F50 != -1) {
        dispatch_once(&qword_1008D5F50, &stru_1008A5718);
      }
      uint64_t v11 = sub_10040007C(off_1008D5F48, v10, 0);
      if (v11)
      {
        uint64_t v12 = sub_1002E6E9C();
        sub_1002D0870(v12, a1 + 16);
        uint64_t v13 = sub_1002E6E9C();
        (*(void (**)(uint64_t, uint64_t, __int16 *, void *))(*(void *)v13 + 520LL))(v13, 8LL, &uint64, v11);
      }

      else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
      {
        sub_1006A1304();
      }
    }

    else
    {
      uint64_t v15 = sub_1002E6E9C();
      sub_1002D08D4(v15, a1 + 16);
    }
  }

  else
  {
    uint64_t v14 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Invalid argument for LTE Link Quality Mode",  v17,  2u);
    }
  }

  return 1LL;
}

void sub_100650FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100650FDC(int a1, xpc_object_t xdict)
{
  uunsigned __int16 int64 = xpc_dictionary_get_uint64(xdict, "kMessageArgs");
  uint64_t v3 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = "Enabled";
    int v7 = 136446210;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Setting sleep mode to %{public}s",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v5 = sub_1002E6E9C();
  (*(void (**)(uint64_t, void))(*(void *)v5 + 528LL))(v5, (unsigned __int16)uint64);
  return 1LL;
}

void sub_1006510BC(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t v3 = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (v3)
  {
    uint64_t v4 = v3;
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(v3, "kWCMBTAntennaAction");
    uint64_t v6 = xpc_dictionary_get_uint64(v4, "kWCMBTAntennaConfiguration");
    unsigned __int8 v7 = xpc_dictionary_get_uint64(v4, "kWCMBTAntennaParam1");
    unsigned __int8 v8 = xpc_dictionary_get_uint64(v4, "kWCMBTAntennaParam2");
    value[0] = 0LL;
    value[1] = 0LL;
    __int16 v22 = 16;
    uint64_t v9 = sub_1002E6E9C();
    if (uint64 >= 6)
    {
      unsigned int v10 = *(_DWORD *)(v9 + 708);
      if (v10)
      {
        if (v10 <= 0x16)
        {
          if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
            sub_1006A13F8();
          }
          return;
        }
      }
    }

    else {
      BOOL v11 = 1;
    }
    if (v11) {
      uint64_t v12 = 4095LL;
    }
    else {
      uint64_t v12 = 0LL;
    }
    uint64_t v13 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      uint64_t v24 = uint64;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Sending antenna preference action %llu",  buf,  0xCu);
    }

    uint64_t v14 = sub_1002E6E9C();
    (*(void (**)(uint64_t, uint64_t, void, void, void, void, __int16 *, uint64_t *))(*(void *)v14 + 896LL))( v14,  v12,  uint64,  v6,  v7,  v8,  &v22,  value);
    xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
    uint64_t v16 = v15;
    if (v22)
    {
      unsigned int v17 = LOBYTE(value[0]);
      if (uint64 == 2 || uint64 == 1)
      {
        xpc_dictionary_set_uint64(v15, "kWCMBTCurrentAntenna", BYTE1(value[0]));
        uint64_t v18 = BYTE2(value[0]);
        uint64_t v19 = "kWCMBTPreviousAntenna";
        goto LABEL_28;
      }

      if (!uint64)
      {
        uint64_t v18 = BYTE1(value[0]);
        uint64_t v19 = "kWCMBTCurrentAntenna";
LABEL_28:
        xpc_dictionary_set_uint64(v16, v19, v18);
LABEL_30:
        xpc_dictionary_set_uint64(v16, "kWCMBTStatus", v17);
        xpc_dictionary_set_uint64(v16, "kWCMBTAntennaAction", uint64);
        sub_10064F4EC(a1, 0x1FEuLL, v16);
        xpc_release(v16);
        return;
      }
    }

    else
    {
      unsigned int v17 = 255;
    }

    if (uint64 == 3)
    {
      uint64_t v20 = sub_1002E6E9C();
      unint64_t v21 = a1 + 16;
      if (v6 != 1 || v17) {
        sub_1002D08D4(v20, v21);
      }
      else {
        sub_1002D0870(v20, v21);
      }
    }

    goto LABEL_30;
  }

  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
    sub_1006A13CC();
  }
}

uint64_t sub_100651378(uint64_t a1, void *a2)
{
  xpc_object_t v3 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Received MWS Set Scan Freq Table",  (uint8_t *)v21,  2u);
  }

  __int16 v22 = 0;
  memset(v21, 0, sizeof(v21));
  xpc_object_t value = xpc_dictionary_get_value(a2, "kMessageArgs");
  if (value)
  {
    uint64_t v5 = value;
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMBTNumScanFrequencies");
    LOBYTE(v21[0]) = uint64;
    xpc_object_t v7 = xpc_dictionary_get_value(v5, "kWCMBTScanFrequencies");
    if (uint64 >= 0x20u)
    {
      unsigned __int8 v8 = (os_log_s *)qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
        sub_1006A145C(uint64, v8, v9, v10, v11, v12, v13, v14);
      }
      return 1LL;
    }

    xpc_object_t v15 = v7;
    if (xpc_array_get_count(v7) != uint64
      && os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
    {
      sub_1006A14C4();
      if ((_BYTE)uint64)
      {
LABEL_10:
        size_t v16 = 0LL;
        do
        {
          xpc_object_t v17 = xpc_array_get_value(v15, v16);
          uint64_t v18 = (char *)v21 + 2 * v16;
          *((_WORD *)v18 + 1) = xpc_array_get_uint64(v17, 0LL);
          xpc_object_t v19 = xpc_array_get_value(v15, v16);
          *((_WORD *)v18 + 17) = xpc_array_get_uint64(v19, 1uLL);
          ++v16;
        }

        while (v16 < uint64);
      }
    }

    else if ((_BYTE)uint64)
    {
      goto LABEL_10;
    }

    if (qword_1008D60B0 != -1) {
      dispatch_once(&qword_1008D60B0, &stru_1008A5738);
    }
    sub_100437928((uint64_t)off_1008D60A8, 66LL, (char *)v21);
  }

  return 1LL;
}

void sub_100651530(int a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (value)
  {
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMBTCoexRxGainModeEnable");
    uint64_t v4 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = uint64;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BT coex rx mode value: %d", (uint8_t *)v6, 8u);
    }

    uint64_t v5 = sub_1002E6E9C();
    (*(void (**)(uint64_t, void))(*(void *)v5 + 1608LL))(v5, uint64);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A14F0();
  }

void sub_100651634(os_unfair_lock_s *a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (value)
  {
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMBTAWDLActive");
    uint64_t v5 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v9 = uint64;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BT coex AWDL active state is: %d", buf, 8u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    _DWORD v6[2] = sub_100652CE0;
    v6[3] = &unk_1008A55C8;
    unsigned __int8 v7 = uint64;
    sub_100652C24(a1 + 120, v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A151C();
  }

void sub_100651770(os_unfair_lock_s *a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (value)
  {
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMBT5GHzWiFiRatesLow");
    uint64_t v5 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v9 = uint64;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BT coex LowWifiRat state is: %d", buf, 8u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    _DWORD v6[2] = sub_100652D00;
    v6[3] = &unk_1008A55C8;
    unsigned __int8 v7 = uint64;
    sub_100652C24(a1 + 120, v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A1548();
  }

void sub_1006518AC(os_unfair_lock_s *a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (value)
  {
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMBTAWDLRTGActive");
    uint64_t v5 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v9 = uint64;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BT coex AWDLRTG active state is: %d", buf, 8u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    _DWORD v6[2] = sub_100652D20;
    v6[3] = &unk_1008A55C8;
    unsigned __int8 v7 = uint64;
    sub_100652C24(a1 + 120, v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A1574();
  }

void sub_1006519E8(os_unfair_lock_s *a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (value)
  {
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMBTUWB5GHzActive");
    uint64_t v5 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v9 = uint64;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BT coex UWB 5g active state is: %d", buf, 8u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    _DWORD v6[2] = sub_100652D40;
    v6[3] = &unk_1008A55C8;
    unsigned __int8 v7 = uint64;
    sub_100652C24(a1 + 120, v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A15A0();
  }

void sub_100651B24(os_unfair_lock_s *a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (value)
  {
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMBTNANActive");
    uint64_t v5 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v9 = uint64;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BT coex Nan active state is: %d", buf, 8u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    _DWORD v6[2] = sub_100652D60;
    v6[3] = &unk_1008A55C8;
    unsigned __int8 v7 = uint64;
    sub_100652C24(a1 + 120, v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A15CC();
  }

void sub_100651C60(os_unfair_lock_s *a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (value)
  {
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMBT5GHzHostAPActive");
    uint64_t v5 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v9 = uint64;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "BT coex 5Ghz Host AP active state is: %d",  buf,  8u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    _DWORD v6[2] = sub_100652D80;
    v6[3] = &unk_1008A55C8;
    unsigned __int8 v7 = uint64;
    sub_100652C24(a1 + 120, v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A15F8();
  }

void sub_100651D9C(uint64_t a1, void *a2)
{
  if ((MGGetBoolAnswer(@"ThreadRadioCapability") & 1) != 0)
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "kMessageArgs");
    if (value)
    {
      uint64_t v5 = value;
      BOOL v6 = xpc_dictionary_get_BOOL(value, "kWCMBTRC2GrantEnable");
      uunsigned __int16 int64 = xpc_dictionary_get_uint64(v5, "kWCMBTRC2TimingT3");
      uint64_t v8 = xpc_dictionary_get_uint64(v5, "kWCMBTRC2TimingT4");
      int v9 = (os_log_s *)qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 67109632;
        v12[1] = v6;
        __int16 v13 = 1024;
        int v14 = uint64;
        __int16 v15 = 1024;
        int v16 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received UCM GrantRC2MEdium and BT Suppression msg: enable: %d, t3Interval: %u, t4Interval: %u",  (uint8_t *)v12,  0x14u);
      }

      if (*(_BYTE *)(a1 + 448) != v6)
      {
        *(_BYTE *)(a1 + 448) = v6;
        uint64_t v10 = sub_1002E6E9C();
        (*(void (**)(uint64_t, BOOL))(*(void *)v10 + 3376LL))(v10, v6);
        uint64_t v11 = sub_1002E6E9C();
        (*(void (**)(uint64_t, BOOL, uint64_t, uint64_t))(*(void *)v11 + 3368LL))(v11, v6, uint64, v8);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
    {
      sub_1006A1624();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A1650();
  }

void sub_100651F58(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (value)
  {
    BOOL v4 = xpc_dictionary_get_BOOL(value, "kWCMAirplayCritical");
    uint64_t v5 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      BOOL v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "WifiAirplayCriticalBuffering state: %d",  (uint8_t *)&v10,  8u);
    }

    uint64_t v6 = sub_1002E6E9C();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v6 + 2576LL))(v6))
    {
      int v7 = *(unsigned __int8 *)(a1 + 152);
      if (*(_BYTE *)(a1 + 152))
      {
        uint64_t v8 = (os_log_s *)qword_1008F7580;
        if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *(unsigned __int8 *)(a1 + 153);
          int v10 = 67109376;
          BOOL v11 = v7;
          __int16 v12 = 1024;
          int v13 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Overriding current CoexParameter state of Parameter: %d, State: %d",  (uint8_t *)&v10,  0xEu);
        }
      }

      *(_BYTE *)(a1 + 152) = 2;
      *(_BYTE *)(a1 + 153) = v4;
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A167C();
  }

void sub_1006520DC(uint64_t a1, xpc_object_t xdict)
{
  size_t length = 0LL;
  int data = xpc_dictionary_get_data(xdict, "kMessageArgs", &length);
  if (data && length >= 0x60)
  {
    for (uint64_t i = 0LL; i != 96; ++i)
      *(_BYTE *)(a1 + i + 168) = byte_1006C4A09[i] & data[i];
    int v81 = 412948512;
    uint64_t v80 = 0x17A31725165D141ELL;
    uint64_t v78 = 0x7D007E007E0065LL;
    int v79 = 8192125;
    uint64_t v5 = &v65;
    memset(v77, 0, sizeof(v77));
    __int128 v76 = 0u;
    __int128 v75 = 0u;
    __int128 v74 = 0u;
    __int128 v73 = 0u;
    __int128 v72 = 0u;
    __int128 v71 = 0u;
    __int128 v70 = 0u;
    __int128 v69 = 0u;
    __int128 v68 = 0u;
    __int128 v67 = 0u;
    __int128 v66 = 0u;
    uint64_t v6 = 168LL;
    char v65 = -1;
    do
    {
      _OWORD *v5 = *(_OWORD *)(a1 + v6);
      uint64_t v5 = (_OWORD *)((char *)v5 + 63);
      v6 += 16LL;
    }

    while (v6 != 264);
    uint8x16_t v7 = (uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 168));
    uint16x8_t v8 = vmovl_high_u8(v7);
    uint16x8_t v9 = vmovl_u8(*(uint8x8_t *)v7.i8);
    uint8x16_t v10 = (uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 184));
    uint16x8_t v11 = vmovl_high_u8(v10);
    uint16x8_t v12 = vmovl_u8(*(uint8x8_t *)v10.i8);
    uint8x16_t v13 = (uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 200));
    uint16x8_t v14 = vmovl_high_u8(v13);
    uint16x8_t v15 = vmovl_u8(*(uint8x8_t *)v13.i8);
    uint8x16_t v16 = (uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 216));
    uint16x8_t v17 = vmovl_high_u8(v16);
    uint16x8_t v18 = vmovl_u8(*(uint8x8_t *)v16.i8);
    uint8x16_t v19 = (uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 232));
    uint16x8_t v20 = vmovl_high_u8(v19);
    uint16x8_t v21 = vmovl_u8(*(uint8x8_t *)v19.i8);
    uint8x16_t v22 = (uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 248));
    uint16x8_t v23 = vmovl_high_u8(v22);
    uint16x8_t v24 = vmovl_u8(*(uint8x8_t *)v22.i8);
    v23.i32[0] = vaddvq_s32( vaddq_s32( vaddq_s32( (int32x4_t)vaddl_u16(*(uint16x4_t *)v24.i8, *(uint16x4_t *)v23.i8),  (int32x4_t)vaddl_high_u16(v24, v23)),  (int32x4_t)xmmword_1006C4910));
    v20.i32[0] = vaddvq_s32( vaddq_s32( (int32x4_t)vaddl_u16(*(uint16x4_t *)v21.i8, *(uint16x4_t *)v20.i8),  (int32x4_t)vaddl_high_u16(v21, v20)));
    v8.i32[0] = vaddvq_s32( vaddq_s32( vaddq_s32( (int32x4_t)vaddl_u16(*(uint16x4_t *)v9.i8, *(uint16x4_t *)v8.i8),  (int32x4_t)vaddl_high_u16(v9, v8)),  (int32x4_t)xmmword_1006C48E0));
    __int32 v40 = v8.i32[0];
    int v41 = vaddvq_s32( vaddq_s32( vaddq_s32( (int32x4_t)vaddl_u16(*(uint16x4_t *)v12.i8, *(uint16x4_t *)v11.i8),  (int32x4_t)vaddl_high_u16(v12, v11)),  (int32x4_t)xmmword_1006C48F0));
    v8.i32[1] = v41;
    uint64_t v62 = v8.i64[0];
    int v63 = 0;
    int v42 = vaddvq_s32( vaddq_s32( vaddq_s32( (int32x4_t)vaddl_u16(*(uint16x4_t *)v15.i8, *(uint16x4_t *)v14.i8),  (int32x4_t)vaddl_high_u16(v15, v14)),  (int32x4_t)xmmword_1006C4900));
    __int32 v43 = v23.i32[0];
    v8.i32[0] = v42;
    int v44 = vaddvq_s32( vaddq_s32( (int32x4_t)vaddl_u16(*(uint16x4_t *)v18.i8, *(uint16x4_t *)v17.i8),  (int32x4_t)vaddl_high_u16(v18, v17)));
    __int32 v45 = v20.i32[0];
    v8.i32[1] = v44;
    v8.i64[1] = __PAIR64__(v23.u32[0], v20.u32[0]);
    uint16x8_t v64 = v8;
    __int16 v25 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67110656;
      __int32 v49 = v40;
      __int16 v50 = 1024;
      int v51 = v41;
      __int16 v52 = 1024;
      int v53 = 0;
      __int16 v54 = 1024;
      int v55 = v42;
      __int16 v56 = 1024;
      int v57 = v44;
      __int16 v58 = 1024;
      __int32 v59 = v45;
      __int16 v60 = 1024;
      __int32 v61 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "PurpleCoexManager: TotalUniChannels received from cellular: unii1 %d, unii3 %d, unii4 %d, unii5a %d, unii5b %d, unii5c %d, unii5d %d",  buf,  0x2Cu);
    }

    uint64_t v26 = 0LL;
    char v27 = 0;
    while (1)
    {
      int v28 = *((_DWORD *)&v62 + v26);
      if (v28 <= 19)
      {
        *(_BYTE *)(a1 + v26 + 271) = 0;
      }

      else
      {
        ++v27;
        char v29 = 1;
        *(_BYTE *)(a1 + v26 + 271) = 1;
      }

      char v29 = 0;
LABEL_15:
      *(_BYTE *)(a1 + v26++ + 264) = v29;
      if (v26 == 7)
      {
        if (v27)
        {
          if (v27 == 6)
          {
            uint64_t v30 = sub_1002E6E9C();
            (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t *, char *, uint64_t))(*(void *)v30 + 1432LL))( v30,  3LL,  &v80,  &v78,  &v65,  1LL);
            uint64_t v31 = sub_1002E6E9C();
            (*(void (**)(uint64_t, uint64_t, char *, char *, _BYTE *, uint64_t))(*(void *)v31 + 1432LL))( v31,  3LL,  (char *)&v80 + 6,  (char *)&v78 + 6,  &v77[12],  1LL);
          }

          else
          {
            uint64_t v35 = 0LL;
            __int16 v36 = (unsigned __int8 *)(a1 + 271);
            uint64_t v37 = &v65;
            do
            {
              int v38 = *v36++;
              if (v38 == 1)
              {
                uint64_t v39 = sub_1002E6E9C();
                (*(void (**)(uint64_t, uint64_t, char *, char *, char *, uint64_t))(*(void *)v39 + 1432LL))( v39,  1LL,  (char *)&v80 + v35,  (char *)&v78 + v35,  v37,  1LL);
              }

              v37 += 63;
              v35 += 2LL;
            }

            while (v35 != 14);
          }
        }

        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_1006531B4;
        v46[3] = &unk_1008A55E8;
        v46[4] = a1;
        sub_100652C24((os_unfair_lock_s *)(a1 + 480), v46);
        sub_1006531D0(a1, (const void *)(a1 + 168));
        return;
      }
    }
  }

  uint64_t v32 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
    sub_1006A16A8(v32, v33, v34);
  }
}

uint64_t sub_1006525AC(uint64_t a1, xpc_object_t xdict)
{
  BOOL v3 = xpc_dictionary_get_BOOL(xdict, "kMessageArgs");
  *(_BYTE *)(a1 + 278) = v3;
  BOOL v4 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = "Disabled";
    if (v3) {
      uint64_t v5 = "Enabled";
    }
    int v8 = 136315394;
    uint16x8_t v9 = "void BT::PurpleCoexManager::SetConditionalIdEnable(xpc_object_t)";
    __int16 v10 = 2080;
    uint16x8_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s, ConditionalIDEnable set to %s",  (uint8_t *)&v8,  0x16u);
  }

  uint64_t v6 = sub_1002E6E9C();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, void, uint64_t))(*(void *)v6 + 2960LL))( v6,  0LL,  60LL,  *(unsigned __int8 *)(a1 + 278) ^ 1u,  1LL);
}

uint64_t sub_1006526C0(uint64_t a1, xpc_object_t xdict)
{
  BOOL v3 = xpc_dictionary_get_BOOL(xdict, "kMessageArgs");
  *(_BYTE *)(a1 + 279) = v3;
  BOOL v4 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = "Disabled";
    if (v3) {
      uint64_t v5 = "Enabled";
    }
    int v8 = 136315394;
    uint16x8_t v9 = "void BT::PurpleCoexManager::SetMWSTxIndHRBEnable(xpc_object_t)";
    __int16 v10 = 2080;
    uint16x8_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s, MWSTxIndHRBEnable set to %s",  (uint8_t *)&v8,  0x16u);
  }

  uint64_t v6 = sub_1002E6E9C();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, void, uint64_t))(*(void *)v6 + 2960LL))( v6,  0LL,  49LL,  *(unsigned __int8 *)(a1 + 279) ^ 1u,  1LL);
}

void sub_1006527D4(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  if (value)
  {
    BOOL v4 = value;
    uunsigned __int16 int64 = xpc_dictionary_get_uint64(value, "kWCMAntennaRequestInterval");
    uint64_t v6 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "void BT::PurpleCoexManager::SetAntennaRequest(xpc_object_t)";
      __int16 v25 = 1024;
      int v26 = uint64;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s, AntennaRequestInterval = %d", buf, 0x12u);
    }

    BOOL v7 = xpc_dictionary_get_BOOL(v4, "kWCMAntennaRequestUnii1Enabled");
    BOOL v8 = xpc_dictionary_get_BOOL(v4, "kWCMAntennaRequestUnii3Enabled");
    if (v7) {
      char v9 = 2;
    }
    else {
      char v9 = 0;
    }
    if (v8) {
      char v10 = 4;
    }
    else {
      char v10 = 0;
    }
    char v11 = v10 | v9;
    if (xpc_dictionary_get_BOOL(v4, "kWCMAntennaRequestUnii5aEnabled")) {
      char v12 = 16;
    }
    else {
      char v12 = 0;
    }
    if (xpc_dictionary_get_BOOL(v4, "kWCMAntennaRequestUnii5bEnabled")) {
      char v13 = 32;
    }
    else {
      char v13 = 0;
    }
    char v14 = v11 | v12 | v13;
    if (xpc_dictionary_get_BOOL(v4, "kWCMAntennaRequestUnii5cEnabled")) {
      char v15 = 64;
    }
    else {
      char v15 = 0;
    }
    if (xpc_dictionary_get_BOOL(v4, "kWCMAntennaRequestUnii5dEnabled")) {
      char v16 = 0x80;
    }
    else {
      char v16 = 0;
    }
    unsigned __int8 v17 = v14 | v15 | v16;
    uint16x8_t v18 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = "void BT::PurpleCoexManager::SetAntennaRequest(xpc_object_t)";
      __int16 v25 = 1024;
      int v26 = v17;
      __int16 v27 = 1024;
      int v28 = uint64;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s, Bitmap Sent to VSG MGS 53 = %d and AntennaRequestInterval = %d",  buf,  0x18u);
    }

    uint64_t v19 = sub_1002E6E9C();
    if ((*(unsigned int (**)(uint64_t, void, void, uint64_t))(*(void *)v19 + 2968LL))( v19,  v17,  uint64,  1LL))
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
        sub_1006A17A8();
      }
    }

    else if (*(_BYTE *)(a1 + 278))
    {
      *(void *)__int128 buf = 520093727LL;
      buf[1] = xpc_dictionary_get_uint64(v4, "kWCMBTConditionIdUnii1");
      uint8_t buf[2] = xpc_dictionary_get_uint64(v4, "kWCMBTConditionIdUnii3");
      uint8_t buf[4] = xpc_dictionary_get_uint64(v4, "kWCMBTConditionIdUnii5a");
      buf[5] = xpc_dictionary_get_uint64(v4, "kWCMBTConditionIdUnii5b");
      buf[6] = xpc_dictionary_get_uint64(v4, "kWCMBTConditionIdUnii5c");
      buf[7] = xpc_dictionary_get_uint64(v4, "kWCMBTConditionIdUnii5d");
      uint64_t v20 = sub_1002E6E9C();
      int v21 = (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(*(void *)v20 + 2976LL))(v20, buf, 1LL);
      uint8x16_t v22 = (os_log_s *)qword_1008F7580;
      if (v21)
      {
        if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
          sub_1006A1748();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint16x8_t v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SPMI Type 60 config was called", v23, 2u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A171C();
  }

void sub_100652B68(os_unfair_lock_s *a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kMessageArgs");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  _DWORD v4[2] = sub_1006532B0;
  v4[3] = &unk_1008A5608;
  v4[4] = xpc_dictionary_get_uint64(value, "kWCMBTWiFiChannel");
  v4[5] = xpc_dictionary_get_uint64(value, "kWCMBTWiFiChannelBandwidth");
  v4[6] = xpc_dictionary_get_uint64(value, "kWCMBTWiFiRegulatoryBand");
  sub_100652C24(a1 + 120, v4);
}

void sub_100652C24(os_unfair_lock_s *a1, void *a2)
{
  BOOL v3 = a2;
  os_unfair_lock_lock(a1);
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  sub_100240540(&v5, (uint64_t)&a1[2]);
  os_unfair_lock_unlock(a1);
  BOOL v4 = v5;
  if (v5 != v6)
  {
    do
      v3[2](v3, *v4++);
    while (v4 != v6);
    BOOL v4 = v5;
  }

  if (v4)
  {
    uint64_t v6 = v4;
    operator delete(v4);
  }
}

void sub_100652CB8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100652CE0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a2 + 8LL))(a2, *(_BYTE *)(a1 + 32) == 1);
}

uint64_t sub_100652D00(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a2 + 16LL))(a2, *(_BYTE *)(a1 + 32) == 1);
}

uint64_t sub_100652D20(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a2 + 24LL))(a2, *(_BYTE *)(a1 + 32) == 1);
}

uint64_t sub_100652D40(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a2 + 32LL))(a2, *(_BYTE *)(a1 + 32) == 1);
}

uint64_t sub_100652D60(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a2 + 40LL))(a2, *(_BYTE *)(a1 + 32) == 1);
}

uint64_t sub_100652D80(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a2 + 48LL))(a2, *(_BYTE *)(a1 + 32) == 1);
}

uint64_t sub_100652DA4(uint64_t a1)
{
  v22[0] = 0LL;
  v22[1] = 0LL;
  sub_100242F28((uint64_t)v22, a1 + 80);
  uint64_t v2 = sub_1002E6E00();
  sub_10002418C(buf, "COEXDEBUG");
  sub_10002418C(__p, "Enabled");
  (*(void (**)(uint64_t, uint8_t *, void **, uint64_t))(*(void *)v2 + 72LL))(v2, buf, __p, a1 + 280);
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (v21 < 0) {
    operator delete(*(void **)buf);
  }
  if (*(_BYTE *)(a1 + 280))
  {
    BOOL v3 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "PurpleCoexManager::debugWifiStateUpdate COEXDEBUG",  buf,  2u);
    }

    char v17 = 0;
    uint64_t v4 = sub_1002E6E00();
    sub_10002418C(buf, "COEXDEBUG");
    sub_10002418C(__p, "wifiStatePower");
    int v5 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(void *)v4 + 72LL))(v4, buf, __p, &v17);
    if (v19 < 0) {
      operator delete(__p[0]);
    }
    if (v21 < 0) {
      operator delete(*(void **)buf);
    }
    if (v17) {
      int v6 = 0;
    }
    else {
      int v6 = v5;
    }
    if (v6 == 1)
    {
      *(_DWORD *)(a1 + 160) = 0;
      *(_WORD *)(a1 + 166) = 0;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100653118;
      v16[3] = &unk_1008A55E8;
      void v16[4] = a1;
      sub_100652C24((os_unfair_lock_s *)(a1 + 480), v16);
    }

    else
    {
      int v15 = 0;
      uint64_t v7 = sub_1002E6E00();
      sub_10002418C(buf, "COEXDEBUG");
      sub_10002418C(__p, "wifiStateBand");
      int v8 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, int *))(*(void *)v7 + 88LL))(v7, buf, __p, &v15);
      if (v19 < 0) {
        operator delete(__p[0]);
      }
      if (v21 < 0) {
        operator delete(*(void **)buf);
      }
      if (v8) {
        *(_WORD *)(a1 + 162) = v15;
      }
      uint64_t v14 = 0LL;
      uint64_t v9 = sub_1002E6E00();
      sub_10002418C(buf, "COEXDEBUG");
      sub_10002418C(__p, "UCMWifiStateBitmap");
      int v10 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, uint64_t *))(*(void *)v9 + 144LL))( v9,  buf,  __p,  &v14);
      if (v19 < 0) {
        operator delete(__p[0]);
      }
      if (v21 < 0) {
        operator delete(*(void **)buf);
      }
      if (v10)
      {
        __int16 v11 = v14 != 0;
        *(_WORD *)(a1 + 166) = v14;
        *(_WORD *)(a1 + 160) = 2 * v11;
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100653134;
      void v13[3] = &unk_1008A55E8;
      v13[4] = a1;
      sub_100652C24((os_unfair_lock_s *)(a1 + 480), v13);
    }
  }

  return sub_100242FAC((uint64_t)v22);
}

void sub_1006530A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *__p, uint64_t a23, int a24, __int16 a25, char a26, char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  sub_100242FAC(v27 - 48);
  _Unwind_Resume(a1);
}

uint64_t sub_100653118(uint64_t a1, uint64_t (***a2)(void, void))
{
  return (**a2)(a2, *(unsigned __int16 *)(*(void *)(a1 + 32) + 166LL));
}

uint64_t sub_100653134(uint64_t a1, uint64_t (***a2)(void, void))
{
  return (**a2)(a2, *(unsigned __int16 *)(*(void *)(a1 + 32) + 166LL));
}

void sub_100653150()
{
  uint64_t v0 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Set AFH CB", v1, 2u);
  }

uint64_t sub_1006531B4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 56LL))(a2, *(void *)(a1 + 32) + 264LL);
}

void sub_1006531D0(uint64_t a1, const void *a2)
{
  uint64_t v4 = (os_log_s *)qword_1008F7580;
  if (!a2 && os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Error: BT is trying to send an empty map to UCM",  buf,  2u);
    uint64_t v4 = (os_log_s *)qword_1008F7580;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BT Sending HRB AFH MAP to WCM", v6, 2u);
  }

  xpc_object_t v5 = xpc_data_create(a2, 0x60uLL);
  sub_10064F4EC(a1, 0x205uLL, v5);
  xpc_release(v5);
}

uint64_t sub_1006532B0(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void))(*(void *)a2 + 64LL))(a2, a1[4], a1[5], a1[6]);
}

void sub_1006532CC(int a1)
{
  uint64_t v2 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Set LE AFH CB status = %{bluetooth:OI_STATUS}u",  (uint8_t *)v3,  8u);
  }

uint64_t sub_10065336C(uint64_t result, _BYTE *a2, _BYTE *a3)
{
  *a2 = *(_BYTE *)(result + 152);
  *a3 = *(_BYTE *)(result + 153);
  return result;
}

uint64_t sub_100653380()
{
  return 0LL;
}

uint64_t sub_100653388(uint64_t a1)
{
  uint64_t v2 = sub_1002E6BF0();
  if (((*(uint64_t (**)(uint64_t))(*(void *)v2 + 352LL))(v2) & 1) == 0)
  {
    uint64_t v3 = sub_1002E6BF0();
    if (((*(uint64_t (**)(uint64_t))(*(void *)v3 + 360LL))(v3) & 1) == 0)
    {
      uint64_t v4 = sub_1002E6BF0();
    }
  }

  return *(unsigned int *)(a1 + 156);
}

uint64_t sub_1006533E8(uint64_t a1)
{
  return (*(unsigned __int16 *)(a1 + 166) >> 6) & 1;
}

BOOL sub_1006533F4(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 162) == 1;
}

void sub_100653404(uint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  if (a3 == 0x8000)
  {
    id v8 = sub_1005BFB9C(a2);
    id v9 = objc_claimAutoreleasedReturnValue(v8);
    string = (char *)[v9 UTF8String];

    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = 0LL;
  }

  else
  {
    id v16 = sub_1005BF848(a2);
    id v17 = objc_claimAutoreleasedReturnValue(v16);
    string = (char *)[v17 UTF8String];

    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    if (a4 == 11 && !a5)
    {
      *(void *)__int128 buf = 0LL;
      unint64_t v18 = sub_1001BEE0C(a2);
      int v27 = v18;
      __int16 v28 = WORD2(v18);
      char v26 = 0;
      sub_100242CA4(&v26);
      int v19 = sub_10010EFD8((uint64_t)&v27, (uint64_t)buf);
      sub_100242CD0(&v26);
      if (v19)
      {
        if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
          sub_1006A1808();
        }
        uint64_t v10 = 0LL;
        uint64_t v11 = 0LL;
        uint64_t v12 = 0LL;
        uint64_t v13 = 0LL;
        uint64_t v14 = 0LL;
      }

      else
      {
        uint64_t v10 = buf[0];
        uint64_t v11 = buf[1];
        uint64_t v12 = buf[2];
        uint64_t v13 = *(unsigned __int16 *)&buf[4];
        uint64_t v14 = *(unsigned __int16 *)&buf[6];
      }

      sub_100242CD8(&v26);
    }

    if (qword_1008D5F50 != -1) {
      dispatch_once(&qword_1008D5F50, &stru_1008A5718);
    }
    uint64_t v20 = sub_10040007C(off_1008D5F48, a2, 0);
    uint64_t v15 = (uint64_t)v20;
    if (v20)
    {
      if ((sub_1003D58A8((uint64_t)v20) & 1) != 0)
      {
        uint64_t v15 = 1LL;
      }

      else if (sub_1003D58B4(v15))
      {
        uint64_t v15 = 2LL;
      }

      else
      {
        uint64_t v15 = 0LL;
      }
    }
  }

  xpc_object_t v21 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v21, "kWCMBTConnectionConfiguration_Address", string);
  xpc_dictionary_set_uint64(v21, "kWCMBTConnectionConfiguration_ServiceId", a3);
  xpc_dictionary_set_uint64(v21, "kWCMBTConnectionConfiguration_EventId", a4);
  xpc_dictionary_set_uint64(v21, "kWCMBTConnectionConfiguration_Result", a5);
  if (a3 != 0x8000)
  {
    xpc_dictionary_set_uint64(v21, "kWCMBTConnectionConfiguration_DeviceType", v10);
    xpc_dictionary_set_uint64(v21, "kWCMBTConnectionConfiguration_Role", v11);
    xpc_dictionary_set_uint64(v21, "kWCMBTConnectionConfiguration_Mode", v12);
    xpc_dictionary_set_uint64(v21, "kWCMBTConnectionConfiguration_ConnTo", v13);
    xpc_dictionary_set_uint64(v21, "kWCMBTConnectionConfiguration_ConnIntrvl", v14);
    xpc_dictionary_set_uint64(v21, "kWCMBTConnectionConfiguration_Latncy", 0LL);
    xpc_dictionary_set_uint64(v21, "kWCMBTConnectionConfiguration_RequiresRC2CoExType", v15);
  }

  uint8x16_t v22 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136317698;
    *(void *)&uint8_t buf[4] = string;
    __int16 v30 = 1024;
    unsigned int v31 = a3;
    __int16 v32 = 1024;
    unsigned int v33 = a4;
    __int16 v34 = 1024;
    int v35 = a5;
    __int16 v36 = 2048;
    uint64_t v37 = v10;
    __int16 v38 = 2048;
    uint64_t v39 = v11;
    __int16 v40 = 2048;
    uint64_t v41 = v12;
    __int16 v42 = 2048;
    uint64_t v43 = v13;
    __int16 v44 = 2048;
    uint64_t v45 = v14;
    __int16 v46 = 2048;
    uint64_t v47 = 0LL;
    __int16 v48 = 2048;
    uint64_t v49 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Sending Connection Config: Address: %s, ServiceId: %u, EventId: %u, Result: %d, DeviceType: %llu, Role: %llu, Mode : %llu, ConnTo: %llu, ConnIntrv: %llu, Latency: %llu, RC2CoExType: %llu",  buf,  0x64u);
  }

  sub_10064F4EC(a1, 0x1F4uLL, v21);
  xpc_release(v21);
}

void sub_1006537D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
}

void sub_100653804(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, unsigned int a7)
{
  unint64_t v41 = a2;
  if (a4 == 0x10000 || a4 == 0x400000)
  {
    id v14 = sub_1005BFB9C(a2);
    id v7 = objc_claimAutoreleasedReturnValue(v14);
    uint64_t v15 = (const char *)[v7 UTF8String];
  }

  else
  {
    id v16 = sub_1005BF848(a2);
    id v8 = objc_claimAutoreleasedReturnValue(v16);
    uint64_t v15 = (const char *)[v8 UTF8String];
  }

  if (a4 == 0x400000 || a4 == 0x10000)
  {

    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    goto LABEL_49;
  }

  uint64_t v40 = 0LL;
  unsigned __int8 v39 = 0;
  unint64_t v19 = sub_1001BEE0C(v41);
  int v37 = v19;
  __int16 v38 = WORD2(v19);
  char v36 = 0;
  sub_100242CA4(&v36);
  if (sub_10010EFD8((uint64_t)&v37, (uint64_t)&v40))
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
      sub_1006A18C8();
    }
    uint64_t v17 = 0LL;
  }

  else
  {
    uint64_t v17 = BYTE1(v40);
  }

  uint64_t v18 = 0LL;
  if (a5 > 109)
  {
    if (a5 == 110)
    {
      __int16 v30 = (os_log_s *)qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "set packetype to 1 for BT_SERVICE_A2DP_LOW_LATENCY_ON",  buf,  2u);
      }

      uint64_t v18 = 1LL;
      goto LABEL_48;
    }

    if (a5 == 111)
    {
      uint64_t v26 = qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        int v27 = "set packetype to 2 for BT_SERVICE_A2DP_LOW_LATENCY_OFF";
        uint64_t v18 = 2LL;
        __int16 v28 = (os_log_s *)v26;
        uint32_t v29 = 2;
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
        goto LABEL_48;
      }

      uint64_t v18 = 2LL;
    }

void sub_100653DA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
}

uint64_t sub_100653DE8(uint64_t a1)
{
  v5[0] = 0LL;
  v5[1] = 0LL;
  sub_100242F28((uint64_t)v5, a1 + 80);
  while (*(void *)(a1 + 392))
  {
    uint64_t v2 = (os_log_s *)qword_1008F7580;
    if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(_DWORD *)(a1 + 320);
      *(_DWORD *)__int128 buf = 67109120;
      int v7 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Warning: Bandwidth: There was still connection 0x%1X in the map after ACL Disconnectd headset!",  buf,  8u);
    }

    sub_100653EFC(a1, *(_DWORD *)(a1 + 320), 0);
  }

  return sub_100242FAC((uint64_t)v5);
}

void sub_100653EE0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t sub_100653EFC(uint64_t a1, unsigned int a2, char a3)
{
  v35[0] = 0LL;
  v35[1] = 0LL;
  uint64_t v6 = sub_100242F28((uint64_t)v35, a1 + 80);
  int v7 = *(_DWORD *)(a1 + 320);
  if ((a3 & 1) != 0)
  {
    if (v7 == a2)
    {
      uint64_t v8 = qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        id v9 = "Warning: Bandwidth: Received a connection that is currently active!";
        uint64_t v10 = (os_log_s *)v8;
        uint32_t v11 = 2;
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&buf, v11);
        return sub_100242FAC((uint64_t)v35);
      }

      return sub_100242FAC((uint64_t)v35);
    }

    uint64_t v17 = *(void *)(a1 + 384);
    if (v17)
    {
      uint64_t v18 = a1 + 384;
      do
      {
        unsigned int v19 = *(_DWORD *)(v17 + 28);
        BOOL v20 = v19 >= a2;
        if (v19 >= a2) {
          uint64_t v21 = (uint64_t *)v17;
        }
        else {
          uint64_t v21 = (uint64_t *)(v17 + 8);
        }
        if (v20) {
          uint64_t v18 = v17;
        }
        uint64_t v17 = *v21;
      }

      while (*v21);
      if (v18 != a1 + 384 && *(_DWORD *)(v18 + 28) <= a2)
      {
        if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
          sub_1006A1928();
        }
        return sub_100242FAC((uint64_t)v35);
      }
    }

    uint64_t buf = __PAIR64__(sub_100654298(v6, a2), a2);
    uint64_t v22 = (uint64_t)sub_100656AD8((uint64_t **)(a1 + 376), (unsigned int *)&buf, &buf);
LABEL_35:
    if (!*(_DWORD *)(a1 + 392) || (uint16x8_t v24 = *(void **)(a1 + 376), v24 == (void *)(a1 + 384)))
    {
      int v25 = 0;
    }

    else
    {
      int v25 = 0;
      do
      {
        int v26 = *((_DWORD *)v24 + 8);
        uint64_t v22 = sub_100654298(v22, v25);
        int v27 = (void *)v24[1];
        if (v27)
        {
          do
          {
            __int16 v28 = v27;
            int v27 = (void *)*v27;
          }

          while (v27);
        }

        else
        {
          do
          {
            __int16 v28 = (void *)v24[2];
            BOOL v29 = *v28 == (void)v24;
            uint16x8_t v24 = v28;
          }

          while (!v29);
        }

        uint16x8_t v24 = v28;
      }

      while (v28 != (void *)(a1 + 384));
    }

    *(_DWORD *)(a1 + 288) -= sub_1006542F8(v22, *(_DWORD *)(a1 + 316));
    *(_DWORD *)(a1 + 316) = v25;
    __int16 v30 = (os_log_s *)qword_1008F7580;
    BOOL v31 = os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Bandwidth: Audio connection 0x%1X, is the current Active Audio Profile",  (uint8_t *)&buf,  8u);
      int v25 = *(_DWORD *)(a1 + 316);
    }

    *(_DWORD *)(a1 + 288) += sub_1006542F8(v31, v25);
    *(_DWORD *)(a1 + 320) = *(_DWORD *)(a1 + 316);
    uint64_t v32 = sub_100404EB8();
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = nullsub_603;
    v34[3] = &unk_10087EB20;
    v34[4] = a1;
    sub_100405384(v32, v34);
    return sub_100242FAC((uint64_t)v35);
  }

  if (v7)
  {
    uint64_t v12 = *(void *)(a1 + 384);
    if (!v12) {
      goto LABEL_56;
    }
    uint64_t v13 = a1 + 384;
    do
    {
      unsigned int v14 = *(_DWORD *)(v12 + 28);
      BOOL v15 = v14 >= a2;
      if (v14 >= a2) {
        id v16 = (uint64_t *)v12;
      }
      else {
        id v16 = (uint64_t *)(v12 + 8);
      }
      if (v15) {
        uint64_t v13 = v12;
      }
      uint64_t v12 = *v16;
    }

    while (*v16);
    if (v13 == a1 + 384 || *(_DWORD *)(v13 + 28) > a2)
    {
LABEL_56:
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR)) {
        sub_1006A1988();
      }
      return sub_100242FAC((uint64_t)v35);
    }

    sub_1001FDBCC((uint64_t **)(a1 + 376), (uint64_t *)v13);
    operator delete((void *)v13);
    goto LABEL_35;
  }

  uint64_t v23 = qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = a2;
    id v9 = "Warning: Bandwidth: Tried removing connection 0x%1X from the map, but there was no active audio connection!";
    uint64_t v10 = (os_log_s *)v23;
    uint32_t v11 = 8;
    goto LABEL_33;
  }

  return sub_100242FAC((uint64_t)v35);
}

void sub_100654270( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100654290(uint64_t a1)
{
  return sub_100653DE8(a1 - 72);
}

uint64_t sub_100654298(uint64_t a1, int a2)
{
  HIDWORD(v3) = a2;
  LODWORD(v3) = a2;
  unsigned int v2 = v3 >> 8;
  if (v2 < 0xB) {
    return dword_1006C4A90[v2];
  }
  uint64_t result = os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    sub_1006A19E8();
    return 0LL;
  }

  return result;
}

uint64_t sub_1006542F8(uint64_t a1, int a2)
{
  HIDWORD(v3) = a2;
  LODWORD(v3) = a2;
  unsigned int v2 = v3 >> 8;
  if (v2 < 0xB) {
    return dword_1006C4ABC[v2];
  }
  uint64_t result = os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    sub_1006A1A14();
    return 0LL;
  }

  return result;
}

uint64_t sub_10065435C(uint64_t a1, char a2)
{
  return sub_100653EFC(a1, 0x900u, a2);
}

uint64_t sub_100654368(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  int v52 = a4;
  int v53 = a3;
  v51[0] = 0LL;
  v51[1] = 0LL;
  sub_100242F28((uint64_t)v51, a1 + 80);
  if (a3 == 16)
  {
    if (a4 > 110)
    {
      if (a4 == 111)
      {
        char v15 = 0;
        goto LABEL_63;
      }

      if (a4 != 201)
      {
        if (a4 == 202 && *(_BYTE *)(a1 + 282))
        {
          uint64_t v19 = *(void *)(a1 + 384);
          if (v19)
          {
            BOOL v20 = (uint64_t *)(a1 + 384);
            uint64_t v21 = a1 + 384;
            uint64_t v22 = *(void *)(a1 + 384);
            do
            {
              unsigned int v23 = *(_DWORD *)(v22 + 28);
              BOOL v24 = v23 >= 0x800;
              if (v23 >= 0x800) {
                int v25 = (uint64_t *)v22;
              }
              else {
                int v25 = (uint64_t *)(v22 + 8);
              }
              if (v24) {
                uint64_t v21 = v22;
              }
              uint64_t v22 = *v25;
            }

            while (*v25);
            if ((uint64_t *)v21 != v20 && *(_DWORD *)(v21 + 28) < 0x801u)
            {
              char v15 = 0;
              unsigned int v26 = 2048;
LABEL_64:
              sub_100653EFC(a1, v26, v15);
              return sub_100242FAC((uint64_t)v51);
            }

            uint64_t v41 = a1 + 384;
            uint64_t v42 = *(void *)(a1 + 384);
            do
            {
              unsigned int v43 = *(_DWORD *)(v42 + 28);
              BOOL v44 = v43 >= 0x300;
              if (v43 >= 0x300) {
                __int16 v45 = (uint64_t *)v42;
              }
              else {
                __int16 v45 = (uint64_t *)(v42 + 8);
              }
              if (v44) {
                uint64_t v41 = v42;
              }
              uint64_t v42 = *v45;
            }

            while (*v45);
            if ((uint64_t *)v41 != v20 && *(_DWORD *)(v41 + 28) <= 0x300u)
            {
              sub_100653EFC(a1, 0x300u, 0);
              uint64_t v19 = *v20;
            }

            if (v19)
            {
              uint64_t v46 = a1 + 384;
              do
              {
                unsigned int v47 = *(_DWORD *)(v19 + 28);
                BOOL v48 = v47 >= 0x400;
                if (v47 >= 0x400) {
                  __int16 v49 = (uint64_t *)v19;
                }
                else {
                  __int16 v49 = (uint64_t *)(v19 + 8);
                }
                if (v48) {
                  uint64_t v46 = v19;
                }
                uint64_t v19 = *v49;
              }

              while (*v49);
            }
          }

          *(_BYTE *)(a1 + 282) = 0;
          return sub_100242FAC((uint64_t)v51);
        }

        goto LABEL_69;
      }

      if (*(_BYTE *)(a1 + 282))
      {
        if (a2)
        {
          if (*(_WORD *)(a2 + 986))
          {
            sub_100653EFC(a1, 0x800u, 1);
          }

          else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
          {
            sub_1006A1AD8();
          }

          return sub_100242FAC((uint64_t)v51);
        }

        goto LABEL_69;
      }

      *(_BYTE *)(a1 + 282) = 1;
      sub_100653EFC(a1, 0x300u, 1);
      if (*(_BYTE *)(a1 + 281)) {
        return sub_100242FAC((uint64_t)v51);
      }
    }

    else
    {
      if (a4 != 11)
      {
        if (a4 == 12)
        {
          if (*(_BYTE *)(a1 + 281))
          {
            *(_DWORD *)(a1 + 288) -= 27;
            *(_BYTE *)(a1 + 281) = 0;
            return sub_100242FAC((uint64_t)v51);
          }
        }

        else if (a4 == 110)
        {
          char v15 = 1;
LABEL_63:
          unsigned int v26 = 1024;
          goto LABEL_64;
        }

void sub_1006548F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10065492C(uint64_t a1, uint64_t a2, int a3, int a4)
{
  v15[0] = 0LL;
  v15[1] = 0LL;
  sub_100242F28((uint64_t)v15, a1 + 80);
  if (a3 == 0x10000)
  {
    if (a4 == 802)
    {
      if (*(_BYTE *)(a1 + 283))
      {
        *(_BYTE *)(a1 + 283) = 0;
        unsigned int v10 = *(_DWORD *)(a1 + 316);
        if (v10 == 1280 || v10 == 1792 || v10 == 1536)
        {
          sub_100653EFC(a1, v10, 0);
        }

        else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
        {
          sub_1005BFC20(a2, &__p);
          sub_1006A1B30();
        }
      }
    }

    else if (a4 == 801 && !*(_BYTE *)(a1 + 283))
    {
      uint64_t v8 = (os_log_s *)qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        sub_1005BFC20(a2, &__p);
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)uint64_t buf = 136315394;
        uint64_t v17 = p_p;
        __int16 v18 = 2048;
        uint64_t v19 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Bandwidth: LEA Streaming Connection for device %s, connectionInterval %fms",  buf,  0x16u);
        uint64_t v8 = (os_log_s *)qword_1008F7580;
      }

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1006A1B04();
      }
      sub_100653EFC(a1, 0x500u, 1);
      *(_BYTE *)(a1 + 283) = 1;
    }
  }

  uint64_t v11 = sub_100404EB8();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = nullsub_604;
  void v13[3] = &unk_10087EB20;
  v13[4] = a1;
  sub_100405384(v11, v13);
  return sub_100242FAC((uint64_t)v15);
}

void sub_100654B40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100654B6C(uint64_t a1, void *a2, int a3, int a4)
{
  v25[0] = 0LL;
  v25[1] = 0LL;
  sub_100242F28((uint64_t)v25, a1 + 80);
  if (a2)
  {
    if (a4)
    {
      if (a3)
      {
        uint64_t v8 = *(void **)(a1 + 336);
        if (!v8) {
          goto LABEL_15;
        }
        id v9 = (void *)(a1 + 336);
        do
        {
          unint64_t v10 = v8[4];
          BOOL v11 = v10 >= (unint64_t)a2;
          else {
            uint64_t v12 = v8 + 1;
          }
          if (v11) {
            id v9 = v8;
          }
          uint64_t v8 = (void *)*v12;
        }

        while (*v12);
        if (v9 != (void *)(a1 + 336) && v9[4] <= (unint64_t)a2)
        {
          if (*((_DWORD *)v9 + 10) == a3) {
            return sub_100242FAC((uint64_t)v25);
          }
          *((_DWORD *)v9 + 10) = a3;
        }

        else
        {
LABEL_15:
          __p[0] = a2;
          LODWORD(__p[1]) = a3;
          sub_100656BD4((uint64_t **)(a1 + 328), (unint64_t *)__p, __p);
        }

        goto LABEL_38;
      }

      __int16 v18 = (os_log_s *)qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        sub_1003D0100((uint64_t)a2, (uint64_t)__p);
        uint64_t v19 = v24 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)uint64_t buf = 136315138;
        uint64_t v27 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Bandwidth: Not adding Classic Connection %s to Classic Connection Map, waiting on an update",  buf,  0xCu);
        if (v24 < 0) {
          operator delete(__p[0]);
        }
      }
    }

    else
    {
      int v13 = *(void **)(a1 + 336);
      if (v13)
      {
        unsigned int v14 = (uint64_t *)(a1 + 336);
        do
        {
          unint64_t v15 = v13[4];
          BOOL v16 = v15 >= (unint64_t)a2;
          else {
            uint64_t v17 = v13 + 1;
          }
          if (v16) {
            unsigned int v14 = v13;
          }
          int v13 = (void *)*v17;
        }

        while (*v17);
        if (v14 != (uint64_t *)(a1 + 336) && v14[4] <= (unint64_t)a2)
        {
          sub_1001FDBCC((uint64_t **)(a1 + 328), v14);
          operator delete(v14);
LABEL_38:
          if (a3 <= 24)
          {
            *(_BYTE *)(a1 + 284) = 1;
            uint64_t v20 = sub_100404EB8();
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472LL;
            void v22[2] = nullsub_605;
            v22[3] = &unk_10087EB20;
            v22[4] = a1;
            sub_100405384(v20, v22);
          }
        }
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A1B88();
  }

  return sub_100242FAC((uint64_t)v25);
}

void sub_100654DB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100654DD8(uint64_t a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  v25[0] = 0LL;
  v25[1] = 0LL;
  sub_100242F28((uint64_t)v25, a1 + 80);
  if (v7)
  {
    if (qword_1008D5F30 != -1) {
      dispatch_once(&qword_1008D5F30, &stru_1008A5778);
    }
    unint64_t v8 = sub_1005CC198((uint64_t)off_1008D5F28, v7, 0);
    uint64_t v9 = v8;
    if (a4)
    {
      if (a3)
      {
        unint64_t v10 = *(void **)(a1 + 360);
        if (!v10) {
          goto LABEL_17;
        }
        BOOL v11 = (void *)(a1 + 360);
        do
        {
          unint64_t v12 = v10[4];
          BOOL v13 = v12 >= v8;
          if (v12 >= v8) {
            unsigned int v14 = v10;
          }
          else {
            unsigned int v14 = v10 + 1;
          }
          if (v13) {
            BOOL v11 = v10;
          }
          unint64_t v10 = (void *)*v14;
        }

        while (*v14);
        if (v11 != (void *)(a1 + 360) && v8 >= v11[4])
        {
          if (*((_DWORD *)v11 + 10) == a3) {
            goto LABEL_42;
          }
          *((_DWORD *)v11 + 10) = a3;
        }

        else
        {
LABEL_17:
          __p.__r_.__value_.__r.__words[0] = v8;
          LODWORD(__p.__r_.__value_.__r.__words[1]) = a3;
          sub_100656BD4((uint64_t **)(a1 + 352), (unint64_t *)&__p, &__p);
        }

        goto LABEL_40;
      }

      uint64_t v20 = (os_log_s *)qword_1008F7580;
      if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
      {
        sub_1005BFC20(v9, &__p);
        uint64_t v21 = (__p.__r_.__value_.__s.__size_ & 0x80u) == 0
            ? &__p
            : (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
        *(_DWORD *)uint64_t buf = 136315138;
        uint64_t v27 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Bandwidth: Not adding Le Connection %s to Le Connection Map, waiting on an update",  buf,  0xCu);
      }
    }

    else
    {
      unint64_t v15 = *(void **)(a1 + 360);
      if (v15)
      {
        BOOL v16 = (uint64_t *)(a1 + 360);
        do
        {
          unint64_t v17 = v15[4];
          BOOL v18 = v17 >= v8;
          if (v17 >= v8) {
            uint64_t v19 = v15;
          }
          else {
            uint64_t v19 = v15 + 1;
          }
          if (v18) {
            BOOL v16 = v15;
          }
          unint64_t v15 = (void *)*v19;
        }

        while (*v19);
        if (v16 != (uint64_t *)(a1 + 360) && v8 >= v16[4])
        {
          sub_1001FDBCC((uint64_t **)(a1 + 352), v16);
          operator delete(v16);
LABEL_40:
          if (a3 <= 12)
          {
            *(_BYTE *)(a1 + 284) = 1;
            uint64_t v22 = sub_100404EB8();
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472LL;
            void v23[2] = nullsub_606;
            v23[3] = &unk_10087EB20;
            v23[4] = a1;
            sub_100405384(v22, v23);
          }
        }
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_ERROR))
  {
    sub_1006A1BB4();
  }

void sub_10065506C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  _Unwind_Resume(a1);
}

void sub_1006550A0(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Sending Desense State %d WCM",  (uint8_t *)v6,  8u);
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v5, "kWCMBTUSBDesenseState", a2);
  sub_10064F4EC(a1, 0x204uLL, v5);
  xpc_release(v5);
}

void sub_100655188(uint64_t a1, uint64_t a2, unsigned int a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReport_Classic_RSSI", *(__int16 *)(a2 + 16));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReport_LE_RSSI", *(__int16 *)(a2 + 18));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReportLeSuccessfulTxCount", *(unsigned __int16 *)(a2 + 21));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReportLeReTxCount", *(unsigned __int16 *)(a2 + 23));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReportLeSuccessfulRxCount", *(unsigned __int16 *)(a2 + 25));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReportLeRxErrorCount", *(unsigned __int16 *)(a2 + 27));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReportClassicSuccessfulTxCount", *(unsigned __int16 *)(a2 + 30));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReportClassicReTxCount", *(unsigned __int16 *)(a2 + 32));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReportClassicSuccessfulRxCount", *(unsigned __int16 *)(a2 + 34));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReportClassicRxErrorCount", *(unsigned __int16 *)(a2 + 36));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReportLeCoexDenialCount", *(unsigned __int16 *)(a2 + 12));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReportClassicCoexDenialCount", *(unsigned __int16 *)(a2 + 14));
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReport_flushCount", a3);
  if (*(_BYTE *)(a2 + 29)) {
    uint64_t v7 = 2LL;
  }
  else {
    uint64_t v7 = 1LL;
  }
  xpc_dictionary_set_uint64(v6, "kWCMBTMetricsReport_Active_PHY", v7);
  sub_10064F4EC(a1, 0x200uLL, v6);
  xpc_release(v6);
}

void sub_1006552FC(uint64_t a1, unsigned int a2, unsigned int a3)
{
  xpc_object_t v6 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = a2;
    __int16 v9 = 1024;
    unsigned int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sendPhyReport: %d, %d", (uint8_t *)v8, 0xEu);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v7, "kWCMBTPhyReport_LE_PHY_RATE", a3);
  xpc_dictionary_set_uint64(v7, "kWCMBTPhyReport_CLASSIC_PHY_RATE", a2);
  sub_10064F4EC(a1, 0x201uLL, v7);
  xpc_release(v7);
}

void sub_100655408(uint64_t a1, unsigned __int8 *a2, unsigned int a3, int a4, int a5)
{
  uint64_t v8 = (uint64_t)a2;
  if (a2) {
    a2 = (unsigned __int8 *)(((unint64_t)a2[128] << 40) | ((unint64_t)a2[129] << 32) | ((unint64_t)a2[130] << 24) | ((unint64_t)a2[131] << 16) | ((unint64_t)a2[132] << 8) | a2[133]);
  }
  if (a4 > 109)
  {
    if (a4 > 200)
    {
      if (a4 == 201)
      {
        uint64_t v10 = 2LL;
        int v11 = a3;
        int v12 = 201;
        goto LABEL_22;
      }

      if (a4 == 202)
      {
        uint64_t v10 = 2LL;
        int v11 = a3;
        int v12 = 202;
        goto LABEL_15;
      }
    }

    else
    {
      if (a4 == 110)
      {
        uint64_t v10 = 4LL;
        int v11 = a3;
        int v12 = 110;
        goto LABEL_22;
      }

      if (a4 == 111)
      {
        uint64_t v10 = 4LL;
        int v11 = a3;
        int v12 = 111;
LABEL_22:
        int v13 = a5;
        unsigned int v14 = 1;
        goto LABEL_23;
      }
    }

void sub_1006555EC(uint64_t a1, unsigned __int8 *a2, unsigned int a3, int a4, int a5)
{
}

void sub_1006555F4(id a1)
{
  uint64_t v4 = @"NUMBER_OF_LE_CONNECTIONS";
  if (qword_1008D6198 != -1) {
    dispatch_once(&qword_1008D6198, &stru_1008A56B8);
  }
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *((unsigned int *)off_1008D6190 + 40)));
  xpc_object_t v5 = v1;
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"com.apple.bluetooth.leconnection" object:0 userInfo:v2];
}

void sub_1006556F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100655728(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = sub_100404EB8();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_1006557E0;
  v8[3] = &unk_100881060;
  uint64_t v10 = a1;
  id v7 = v5;
  id v9 = v7;
  int v11 = a3;
  sub_100405384(v6, v8);
}

void sub_1006557C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1006557E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A5778);
  }
  unint64_t v3 = sub_1005CC198((uint64_t)off_1008D5F28, *(void **)(a1 + 32), 0);
  sub_100653404(v2, v3, 0x8000u, 0xBu, *(_DWORD *)(a1 + 48));
  uint64_t v4 = sub_100404EB8();
  sub_100405384(v4, &stru_1008A5638);
  if (qword_1008D5F10 != -1) {
    dispatch_once(&qword_1008D5F10, &stru_1008A5698);
  }
  id v5 = off_1008D5F08;
  sub_100241F90(v8, *(void *)(a1 + 32));
  uint64_t v6 = sub_10059A848((uint64_t)v5, v8);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)v2 + 88LL))( v2,  *(void *)(a1 + 32),  v6,  1LL);
}

void sub_100655904(uint64_t a1, void *a2, int a3)
{
}

void sub_10065590C(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = sub_100404EB8();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_1006559C4;
  v8[3] = &unk_100881060;
  uint64_t v10 = a1;
  id v7 = v5;
  id v9 = v7;
  int v11 = a3;
  sub_100405384(v6, v8);
}

void sub_1006559A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1006559C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (qword_1008D5F30 != -1) {
    dispatch_once(&qword_1008D5F30, &stru_1008A5778);
  }
  unint64_t v3 = sub_1005CC198((uint64_t)off_1008D5F28, *(void **)(a1 + 32), 0);
  sub_100653404(v2, v3, 0x8000u, 0xCu, *(_DWORD *)(a1 + 48));
  uint64_t v4 = sub_100404EB8();
  sub_100405384(v4, &stru_1008A5638);
  return (*(uint64_t (**)(uint64_t, void, void, void))(*(void *)v2 + 88LL))( v2,  *(void *)(a1 + 32),  0LL,  0LL);
}

void sub_100655A60(uint64_t a1, void *a2, int a3)
{
}

void sub_100655A68(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  if (a4 == 4)
  {
    if (a3) {
      int v10 = 803;
    }
    else {
      int v10 = 804;
    }
    uint64_t v8 = 4LL;
    int v9 = 0x400000;
  }

  else
  {
    if (a4 != 3) {
      return;
    }
    if (a3) {
      int v7 = 801;
    }
    else {
      int v7 = 802;
    }
    sub_10065492C(a1, a2, 0x10000, v7);
    a1 = v6;
    a2 = v5;
    uint64_t v8 = 3LL;
    int v9 = 0x10000;
    int v10 = v7;
  }

  sub_100653804(a1, a2, v8, v9, v10, 0, a3);
}

void sub_100655B10(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
}

void sub_100655B1C(uint64_t a1)
{
}

uint64_t sub_100655B24(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 452) = a2;
  *(void *)(result + 460) = a3;
  return result;
}

uint64_t sub_100655B30(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 404) = a2;
  *(void *)(result + 412) = a3;
  return result;
}

uint64_t **sub_100655B44(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v14 = a2;
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v6, "kWCMBTLeDiscoveryScan_State", a3);
  xpc_dictionary_set_int64(v6, "kWCMBTLeDiscoveryScan_UseCase", 1LL);
  int v7 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_100655CD8(a2);
    int v9 = "false";
    if (a3) {
      int v9 = "true";
    }
    *(_DWORD *)uint64_t buf = 136315394;
    BOOL v16 = v8;
    __int16 v17 = 2080;
    BOOL v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Sending Notification to WiFi for CBUseCase %s Scanning Started %s",  buf,  0x16u);
  }

  sub_10064F4EC(a1, 0x206uLL, v6);
  uint64_t result = (uint64_t **)(a1 + 400);
  int v11 = *(uint64_t **)(a1 + 408);
  if ((a3 & 1) != 0)
  {
    for (; v11; int v11 = (uint64_t *)*v11)
    {
      unsigned int v12 = *((_DWORD *)v11 + 7);
      if (v12 <= a2)
      {
        if (v12 >= a2) {
          return result;
        }
        ++v11;
      }
    }

    return sub_1006106E4(result, &v14, &v14);
  }

  else
  {
    while (v11)
    {
      unsigned int v13 = *((_DWORD *)v11 + 7);
      if (v13 <= a2)
      {
        if (v13 >= a2) {
          return (uint64_t **)sub_100656D14((uint64_t)result, &v14);
        }
        ++v11;
      }

      int v11 = (uint64_t *)*v11;
    }
  }

  return result;
}

const char *sub_100655CD8(int a1)
{
  if (a1 >= 0x20000)
  {
    if (a1 >= 327680)
    {
      if (a1 > 589824)
      {
        if (a1 <= 2147418111)
        {
          switch(a1)
          {
            case 589825:
              return "FindNearbyPencil";
            case 655360:
              return "AccessDigitalHomeKey";
            case 786432:
              return "ProxControlDeviceClose";
            default:
              return "?";
          }
        }

        else
        {
          switch(a1)
          {
            case 2147418112:
              uint64_t result = "InternalTestNoLockScan";
              break;
            case 2147418113:
              uint64_t result = "InternalTestNoScreenOffScan";
              break;
            case 2147418114:
              uint64_t result = "InternalTestScanWithNoDups";
              break;
            case 2147418115:
              uint64_t result = "InternalTestScanWithDups";
              break;
            case 2147418116:
              uint64_t result = "InternalTestScanFor20Seconds";
              break;
            case 2147418117:
              uint64_t result = "InternalTestActiveScan";
              break;
            case 2147418118:
              uint64_t result = "InternalTestUUIDScan";
              break;
            case 2147418119:
              uint64_t result = "InternalTestScanFor10ClockSeconds";
              break;
            case 2147418120:
              uint64_t result = "InternalTestScanBoost";
              break;
            default:
              return "?";
          }
        }
      }

      else if (a1 > 458752)
      {
        switch(a1)
        {
          case 524288:
            uint64_t result = "ADPD";
            break;
          case 524289:
            uint64_t result = "ADPDBuffer";
            break;
          case 524290:
            uint64_t result = "MicroLocation";
            break;
          case 524291:
            uint64_t result = "MicroLocationLeech";
            break;
          default:
            if (a1 == 458753)
            {
              uint64_t result = "PrecisionFindingFindee";
            }

            else
            {
              if (a1 != 589824) {
                return "?";
              }
              uint64_t result = "FindNearbyRemote";
            }

            break;
        }
      }

      else
      {
        switch(a1)
        {
          case 393216:
            uint64_t result = "CaptiveNetworkJoin";
            break;
          case 393217:
            uint64_t result = "UseCaseSIMTransfer";
            break;
          case 393218:
            uint64_t result = "MacSetup";
            break;
          case 393219:
            uint64_t result = "AppleIDSignIn";
            break;
          case 393220:
            uint64_t result = "AppleIDSignInSettings";
            break;
          default:
            if (a1 == 327680)
            {
              uint64_t result = "RapportThirdParty";
            }

            else
            {
              if (a1 != 458752) {
                return "?";
              }
              uint64_t result = "PrecisionFindingFinder";
            }

            break;
        }
      }
    }

    else
    {
      switch(a1)
      {
        case 131072:
          return "SharingDefault";
        case 131073:
          return "SharingPhoneAutoUnlock";
        case 131074:
          return "SharingSiriWatchAuth";
        case 131075:
          return "SharingMacAutoUnlock";
        case 131076:
          return "SharingEDTScreenOn";
        case 131077:
          return "SharingEDTWiFiDisabled";
        case 131078:
          return "SharingEDTWombatEligibleAsDefaultCamera";
        case 131079:
          return "SharingEDTWombatCameraPicker";
        case 131080:
          return "SharingWombatBackground";
        case 131081:
          return "SharingUniversalControl";
        case 131082:
          return "SharingPeopleProximity";
        case 131083:
          return "SharingEDTEnsembleOpenDisplayPrefs";
        case 131084:
          return "SharingEDTNearbydMotionStopped";
        case 131085:
          return "SharingDoubleBoostGenericScan";
        case 131086:
          return "SharingEDTIncomingAdvertisement ";
        case 131087:
          return "SharingEDTWombatStreamStart";
        case 131088:
          return "SharingOYAutoUnlock";
        case 131089:
          return "?";
        case 131090:
          return "SharingAirDrop";
        case 131091:
          return "SharingNearbyInvitationHost";
        case 131092:
          return "SharingNearbyInvitationParticipant";
        case 131093:
          return "SharingAirDropAskToAirDrop";
        case 131094:
          return "SharingAirDropTempIdentity";
        case 131095:
          return "SharingAirDropNeedsCLink";
        case 131096:
          return "SharingRemoteWidgetUpdate";
        case 131097:
          return "SharingCountryCodeUpdate";
        case 131098:
          return "SharingMacPhoneAutoUnlock";
        case 131099:
          return "SharingVisionProDiscovery";
        case 131100:
          return "SharingVisionProStateChange";
        case 131101:
          return "SharingContinuityScreen";
        case 131102:
          return "SharingEDTRemoteDisplay";
        default:
          if (a1 == 196608)
          {
            uint64_t result = "DigitalIDTSA";
          }

          else
          {
            if (a1 != 0x40000) {
              return "?";
            }
            uint64_t result = "DigitalCarKeyThirdParty";
          }

          break;
      }
    }
  }

  else
  {
    uint64_t result = "Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "HealthKit";
        break;
      case 2:
        uint64_t result = "HomeKit";
        break;
      case 3:
        uint64_t result = "FindMyObjectConnection";
        break;
      case 4:
        uint64_t result = "FindMyObjectConnectionTransient";
        break;
      case 5:
        uint64_t result = "MIDI";
        break;
      case 6:
        uint64_t result = "Continuity";
        break;
      case 7:
        uint64_t result = "InstantHotSpot";
        break;
      case 8:
        uint64_t result = "NearBy";
        break;
      case 9:
        uint64_t result = "Sharing";
        break;
      case 10:
        uint64_t result = "HearingSupport";
        break;
      case 11:
        uint64_t result = "Magnet";
        break;
      case 12:
        uint64_t result = "HID";
        break;
      case 13:
        uint64_t result = "LEA";
        break;
      case 14:
        uint64_t result = "External";
        break;
      case 15:
        uint64_t result = "ExternalMedical";
        break;
      case 16:
        uint64_t result = "ExternalLock";
        break;
      case 17:
        uint64_t result = "ExternalWatch";
        break;
      case 18:
        uint64_t result = "SmartRouting";
        break;
      case 19:
        uint64_t result = "DigitalID";
        break;
      case 20:
        uint64_t result = "DigitalKey";
        break;
      case 21:
        uint64_t result = "DigitalCarKey";
        break;
      case 22:
        uint64_t result = "HeySiri";
        break;
      case 23:
        uint64_t result = "ThirdPartyApp";
        break;
      case 24:
        uint64_t result = "CNJ";
        break;
      default:
        switch(a1)
        {
          case 256:
            uint64_t result = "DevicePresenceDetection";
            break;
          case 257:
            uint64_t result = "AudioBox";
            break;
          case 258:
            uint64_t result = "SIMTransfer";
            break;
          case 259:
            uint64_t result = "ProximityScreenOnLeechScan";
            break;
          case 260:
            uint64_t result = "MacMigrate";
            break;
          case 263:
            uint64_t result = "HIDUARTService";
            break;
          case 264:
            uint64_t result = "AccessibilitySwitchControlPairing";
            break;
          case 265:
            uint64_t result = "BaseBandFastConnect";
            break;
          case 266:
            uint64_t result = "SafetyAlerts";
            break;
          case 267:
            uint64_t result = "LECarPlay";
            break;
          case 268:
            uint64_t result = "TCCBluetooth";
            break;
          case 269:
            uint64_t result = "AOPBufferLeech";
            break;
          default:
            return "?";
        }

        break;
    }
  }

  return result;
}

uint64_t **sub_100656404(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return sub_100655B44(a1 - 64, a2, a3);
}

void sub_10065640C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_1008F7580;
  if (os_log_type_enabled((os_log_t)qword_1008F7580, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "statedump: ------------------ Coex Manager -------------------",  (uint8_t *)&__p,  2u);
    uint64_t v2 = (os_log_s *)qword_1008F7580;
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    sub_1001F9F74(a1 + 452, &__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)uint64_t buf = 136446210;
    int v7 = p_p;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "statedump: %{public}s", buf, 0xCu);
    uint64_t v2 = (os_log_s *)qword_1008F7580;
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = "Enabled";
    if (!*(_BYTE *)(a1 + 448)) {
      uint64_t v4 = "Disabled";
    }
    LODWORD(__p.__r_.__value_.__l.__data_) = 136446210;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "statedump: Grant RC2 State: %{public}s",  (uint8_t *)&__p,  0xCu);
  }

char *sub_1006565A4(uint64_t a1, char *__src, char *a3)
{
  unint64_t v3 = a3;
  uint64_t v4 = __src;
  xpc_object_t v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    unsigned int v13 = *(char **)a1;
    unint64_t v14 = ((uint64_t)&v6[-*(void *)a1] >> 3) + 1;
    if (v14 >> 61) {
      abort();
    }
    uint64_t v15 = __src - v13;
    uint64_t v16 = (__src - v13) >> 3;
    uint64_t v17 = v7 - (void)v13;
    if (v17 >> 2 > v14) {
      unint64_t v14 = v17 >> 2;
    }
    else {
      unint64_t v18 = v14;
    }
    uint64_t v30 = a1 + 16;
    if (v18) {
      uint64_t v19 = (char *)sub_100008BA0(a1 + 16, v18);
    }
    else {
      uint64_t v19 = 0LL;
    }
    uint64_t v20 = &v19[8 * v16];
    std::stringbuf::string_type __p = v19;
    uint64_t v27 = v20;
    __int16 v28 = v20;
    uint64_t v29 = &v19[8 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4) {
          unint64_t v22 = 1LL;
        }
        else {
          unint64_t v22 = v15 >> 2;
        }
        unsigned int v23 = (char *)sub_100008BA0(v8, v22);
        uint64_t v20 = &v23[8 * (v22 >> 2)];
        std::stringbuf::string_type __p = v23;
        uint64_t v27 = v20;
        uint64_t v29 = &v23[8 * v24];
        if (v19) {
          operator delete(v19);
        }
      }

      else
      {
        unint64_t v21 = v16 + 2;
        if (v16 >= -1) {
          unint64_t v21 = v16 + 1;
        }
        v20 -= 8 * (v21 >> 1);
        uint64_t v27 = v20;
      }
    }

    *(void *)uint64_t v20 = *(void *)v3;
    __int16 v28 = v20 + 8;
    uint64_t v4 = sub_100008ADC((void **)a1, (uint64_t)&__p, v4);
    if (v28 != v27) {
      v28 += (v27 - v28 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    }
    if (__p) {
      operator delete(__p);
    }
  }

  else if (__src == v6)
  {
    *(void *)__src = *(void *)a3;
    *(void *)(a1 + 8) = __src + 8;
  }

  else
  {
    int v9 = __src + 8;
    int v10 = v6 - 8;
    int v11 = *(void **)(a1 + 8);
    while (v10 < v6)
    {
      uint64_t v12 = *(void *)v10;
      v10 += 8;
      *v11++ = v12;
    }

    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(&v6[-8 * ((v6 - v9) >> 3)], __src, v6 - v9);
    }
    if (v4 <= v3) {
      v3 += 8 * (*(void *)(a1 + 8) > (unint64_t)v3);
    }
    *(void *)uint64_t v4 = *(void *)v3;
  }

  return v4;
}

void sub_1006567A8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1006567E0(id a1)
{
  uint64_t v1 = operator new(0x2C0uLL);
  sub_1004219F0();
  off_1008D60C8 = v1;
}

void sub_100656810(_Unwind_Exception *a1)
{
}

void sub_100656824(id a1)
{
  uint64_t v1 = operator new(0xA8uLL);
  sub_10040D0A0((uint64_t)v1);
  off_1008D6780 = v1;
}

void sub_100656854(_Unwind_Exception *a1)
{
}

void sub_100656868(id a1)
{
  uint64_t v1 = operator new(0x618uLL);
  sub_10058B0A4();
  off_1008D5F08 = v1;
}

void sub_100656898(_Unwind_Exception *a1)
{
}

void sub_1006568AC(id a1)
{
  uint64_t v1 = (char *)operator new(0x200uLL);
  *(void *)uint64_t v1 = off_100898F60;
  *((void *)v1 + 1) = &off_100898FF0;
  *((void *)v1 + 2) = off_100899008;
  *((void *)v1 + 3) = &off_100899060;
  *((void *)v1 + 4) = &off_100899078;
  sub_100242DC4(v1 + 40);
  *((void *)v1 + 14) = 0LL;
  *((_DWORD *)v1 + 30) = 0;
  *((void *)v1 + 17) = 0LL;
  *((void *)v1 + 18) = 0LL;
  *((void *)v1 + 16) = 0LL;
  *(_OWORD *)(v1 + 155) = 0u;
  *(_OWORD *)(v1 + 171) = 0u;
  *(_OWORD *)(v1 + 187) = 0u;
  *(_WORD *)(v1 + 203) = 1;
  *((void *)v1 + 26) = 0LL;
  *((_WORD *)v1 + 108) = 256;
  *((void *)v1 + 29) = 0LL;
  *((void *)v1 + 28) = v1 + 232;
  *((void *)v1 + 32) = 0LL;
  *((void *)v1 + 33) = 0LL;
  *((void *)v1 + 30) = 0LL;
  *((void *)v1 + 31) = v1 + 256;
  v1[272] = 0;
  *((_DWORD *)v1 + 69) = 0;
  v1[280] = 0;
  *((_WORD *)v1 + 189) = 0;
  *(void *)(v1 + 313) = 0LL;
  *(_OWORD *)(v1 + 300) = 0u;
  *(_OWORD *)(v1 + 284) = 0u;
  *(_OWORD *)(v1 + 328) = 0u;
  *(_OWORD *)(v1 + 344) = 0u;
  *(_OWORD *)(v1 + 360) = 0u;
  v1[376] = 0;
  *((void *)v1 + 51) = v1 + 416;
  *((void *)v1 + 52) = 0LL;
  *((void *)v1 + 55) = 0LL;
  *((void *)v1 + 56) = 0LL;
  *((void *)v1 + 53) = 0LL;
  *((void *)v1 + 54) = v1 + 440;
  *((void *)v1 + 57) = v1 + 464;
  *((void *)v1 + 58) = 0LL;
  *((void *)v1 + 59) = 0LL;
  *((void *)v1 + 60) = @"XZ";
  *((void *)v1 + 62) = 0LL;
  *((_DWORD *)v1 + 126) = 0;
  off_1008D6190 = v1;
}

void sub_1006569B4(_Unwind_Exception *a1)
{
}

void sub_1006569C8(id a1)
{
  uint64_t v1 = operator new(0x258uLL);
  sub_10048AA64();
  qword_1008D93F0 = (uint64_t)v1;
}

void sub_1006569F8(_Unwind_Exception *a1)
{
}

void sub_100656A0C(id a1)
{
  uint64_t v1 = operator new(0x1128uLL);
  sub_1005DDADC();
  off_1008D6600 = v1;
}

void sub_100656A3C(_Unwind_Exception *a1)
{
}

void sub_100656A50(id a1)
{
  uint64_t v1 = operator new(0x138uLL);
  sub_1003FE3E0((uint64_t)v1);
  off_1008D5F48 = v1;
}

void sub_100656A80(_Unwind_Exception *a1)
{
}

void sub_100656A94(id a1)
{
  uint64_t v1 = operator new(0x230uLL);
  sub_10042BC28();
  off_1008D60A8 = v1;
}

void sub_100656AC4(_Unwind_Exception *a1)
{
}

uint64_t *sub_100656AD8(uint64_t **a1, unsigned int *a2, uint64_t *a3)
{
  xpc_object_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    unsigned int v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        unsigned int v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        xpc_object_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        xpc_object_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    int v10 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v10 + 28) = *a3;
    sub_100029630(a1, (uint64_t)v8, v6, v10);
    return v10;
  }

  return (uint64_t *)v8;
}

void sub_100656B90(id a1)
{
  uint64_t v1 = operator new(0x350uLL);
  sub_100461C70();
  off_1008D9028 = v1;
}

void sub_100656BC0(_Unwind_Exception *a1)
{
}

uint64_t **sub_100656BD4(uint64_t **a1, unint64_t *a2, _OWORD *a3)
{
  xpc_object_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        xpc_object_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        xpc_object_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    int v10 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v10 + 2) = *a3;
    sub_100029630(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }

  return v8;
}

void sub_100656C8C(id a1)
{
  uint64_t v1 = operator new(0x128uLL);
  sub_1005C69F8();
  off_1008D5F28 = v1;
}

void sub_100656CBC(_Unwind_Exception *a1)
{
}

void sub_100656CD0(id a1)
{
  uint64_t v1 = operator new(0x98uLL);
  sub_1003C97E4((uint64_t)v1);
  off_1008D67E0 = v1;
}

void sub_100656D00(_Unwind_Exception *a1)
{
}

uint64_t sub_100656D14(uint64_t a1, unsigned int *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  unsigned int v3 = *a2;
  uint64_t v4 = a1 + 8;
  do
  {
    unsigned int v5 = *(_DWORD *)(v2 + 28);
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      unint64_t v7 = (uint64_t *)v2;
    }
    else {
      unint64_t v7 = (uint64_t *)(v2 + 8);
    }
    if (v6) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = *v7;
  }

  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 28)) {
    return 0LL;
  }
  sub_1001FDBCC((uint64_t **)a1, (uint64_t *)v4);
  operator delete((void *)v4);
  return 1LL;
}

void sub_100656D8C()
{
}

void sub_100656DB8()
{
}

void sub_100656DE4()
{
}

void sub_100656E10(unsigned __int8 a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Advanced Sniff mode change ignored, duplicate mode: %d, maxAge %d",  (uint8_t *)v3,  0xEu);
}

void sub_100656E98()
{
}

void sub_100656EC4(unint64_t a1, os_log_s *a2)
{
  int v3 = *(unsigned __int8 *)sub_10002989C(a1);
  v5[0] = 67109120;
  v5[1] = v3;
  sub_100029878( (void *)&_mh_execute_header,  a2,  v4,  "Exit Advanced Sniff ignored, link not in Advanced Sniff, mode :%d",  (uint8_t *)v5);
  sub_100029890();
}

void sub_100656F3C()
{
}

void sub_100656F68()
{
}

void sub_100656FCC()
{
}

void sub_100656FF8()
{
}

void sub_100657024(unint64_t a1, os_log_s *a2)
{
  int v3 = *(unsigned __int8 *)sub_10002989C(a1);
  v5[0] = 67109120;
  v5[1] = v3;
  sub_100029878( (void *)&_mh_execute_header,  a2,  v4,  "Enter Advanced Sniff fail with link in invalid mode: %d",  (uint8_t *)v5);
  sub_100029890();
}

void sub_10065709C()
{
}

void sub_1006570C8()
{
}

void sub_10065712C()
{
}

void sub_100657190()
{
}

void sub_1006571BC()
{
}

void sub_1006571E8()
{
}

void sub_100657200(void *a1)
{
  if (sub_10002B718()) {
    sub_10002B6F4( (void *)&_mh_execute_header,  v2,  v3,  "%s: No valid serial port found (tried cu.bluetooth and uart.bluetooth)\n",  v4,  v5,  v6,  v7,  2u);
  }
  *a1 = "%s: No valid serial port found (tried cu.bluetooth and uart.bluetooth)\n";
  sub_10002B724();
}

void sub_100657294(void *a1)
{
  if (sub_10002B718()) {
    sub_10002B6F4((void *)&_mh_execute_header, v2, v3, "%s: Not a valid MAC address (all 00s).\n", v4, v5, v6, v7, 2u);
  }
  *a1 = "%s: Not a valid MAC address (all 00s).\n";
  sub_10002B724();
}

void sub_100657328(int *a1, uint64_t a2, os_log_s *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_10002B6E4((void *)&_mh_execute_header, a2, a3, "### _CS_DARWIN_USER_TEMP_DIR failed: %d", (uint8_t *)a2);
}

void sub_100657364(int *a1, uint64_t a2, os_log_s *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_10002B6E4((void *)&_mh_execute_header, a2, a3, "### _set_user_dir_suffix failed: %d", (uint8_t *)a2);
}

void sub_1006573A0(uint64_t a1, int a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 67109120;
  *(_DWORD *)(a1 + 4) = a2;
  sub_10002B6E4( (void *)&_mh_execute_header,  a2,  a3,  "Failed to update Dynamic Store. BTLocalDeviceGetModulePower returned %d",  (uint8_t *)a1);
}

void sub_1006573D8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100657440( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006574A8(uint64_t a1)
{
}

void sub_1006574C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006574F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100657528( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100029860( (void *)&_mh_execute_header,  a1,  a3,  "Adaptive Latency Headset Feedback, Invalid Device return",  a5,  a6,  a7,  a8,  0);
  sub_100029870();
}

void sub_100657558(uint64_t a1, os_log_s *a2)
{
  int v2 = *(unsigned __int16 *)(a1 + 32);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Adaptive Latency Headset DSP critical: %d",  (uint8_t *)v3,  8u);
  sub_100029870();
}

void sub_1006575CC(int a1, os_log_s *a2)
{
  v2[0] = 67109376;
  v2[1] = 200;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to initialize the packet flush timeout to %d with error %{bluetooth:OI_STATUS}u",  (uint8_t *)v2,  0xEu);
  sub_10003BE20();
}

void sub_10065764C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006576B4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100657718( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065777C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Spatial lost device: %@ (%s)",  (uint8_t *)&v3,  0x16u);
  sub_10003BE20();
}

void sub_1006577FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Something went wrong, mismatch detected with spatialInteractionDeviceTimestamp array, removing them",  v1,  2u);
}

void sub_10065783C(uint64_t a1)
{
}

void sub_100657858()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_1006578C0()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, 2u);
  sub_10002B724();
}

void sub_10065793C()
{
}

void sub_100657968()
{
}

void sub_100657994()
{
}

void sub_1006579C0()
{
}

void sub_1006579EC()
{
}

void sub_100657A18()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_rx_main: applebt_hci_close returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100657A78( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10002B708( (void *)&_mh_execute_header,  a2,  a3,  "applebt_rx_main: applebt_read_crash_info returned unsupported result size=%zu\n",  a5,  a6,  a7,  a8,  0);
  sub_10003BE20();
}

void sub_100657AE0()
{
  sub_10008652C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_rx_main: applebt_read_crash_info succeeds, read result=0x%08X new format(size=%zu)\n",  v2,  v3,  v4,  v5,  v6);
  sub_10003BE20();
}

void sub_100657B44()
{
  sub_10008652C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_rx_main: applebt_read_crash_info succeeds, read result=0x%08X old format(size=%zu)\n",  v2,  v3,  v4,  v5,  v6);
  sub_10003BE20();
}

void sub_100657BA8()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_rx_main: applebt_read_crash_info returned fatal error, read result=0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100657C08()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "applebt_rx_main: applebt_hci_read returned fatal error, read result=0x%08X pipes result=0x%08X - closing HCI device and aborting\n",  v2,  0xEu);
  sub_10003BE20();
}

void sub_100657C84(int a1, int a2, os_log_s *a3)
{
  int v5 = 136315394;
  uint8_t v6 = sub_100137ADC(a1);
  __int16 v7 = 2080;
  uint64_t v8 = sub_100137ADC(a2);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "applebt_rx_main: applebt_hci_read failures, read result=%s pipes result=%s\n",  (uint8_t *)&v5,  0x16u);
}

void sub_100657D30(uint8_t *buf, unsigned __int8 *a2, int *a3, os_log_t log)
{
  int v4 = *a2 + 1;
  *(_DWORD *)uint64_t buf = 67109120;
  *a3 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "applebt_rx_main: resetting next seq_num to %d\n",  buf,  8u);
}

void sub_100657D80( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10002B708( (void *)&_mh_execute_header,  a2,  a3,  "applebt_set_hci_packet_attrs_from_footer: bt_packet_attr_decode error=0x%zX",  a5,  a6,  a7,  a8,  0);
  sub_10003BE20();
}

void sub_100657DE4()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_transport_terminate: pthread_join returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100657E44()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_transport_terminate: applebt_hci_close returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100657EA4(uint8_t *a1, void *a2, os_log_s *a3)
{
  uint8_t v6 = sub_1001EDDCC();
  *(_DWORD *)a1 = 136446210;
  *a2 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}s", a1, 0xCu);
}

void sub_100657F08()
{
}

void sub_100657F74()
{
}

void sub_100657FDC(os_log_s *a1)
{
  int v2 = 136446466;
  uint64_t v3 = sub_1001EDDCC();
  __int16 v4 = 1024;
  int v5 = 0xFFFF;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "%{public}s (status=%{bluetooth:OI_STATUS}u)",  (uint8_t *)&v2,  0x12u);
}

void sub_100658074()
{
  int v2 = sub_10009877C();
  sub_100098798((uint64_t)v2, 4.8751e-34);
  sub_100098774((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s", v1);
  sub_10009878C();
}

uint64_t sub_1006580BC(os_log_s *a1, char a2)
{
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "%{public}s (status=%{bluetooth:OI_STATUS}u)",  v5,  0x12u);
  return a2 & 1;
}

void sub_100658144( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100658178( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006581AC()
{
}

void sub_100658220(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "HCILiteEventFilter buffer is smaller than expected. %ul < %ul",  (uint8_t *)v3,  0xEu);
  sub_10003BE20();
}

void sub_1006582A0()
{
}

void sub_100658320()
{
}

void sub_1006583A0()
{
}

void sub_100658420()
{
}

void sub_1006584A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100658510()
{
}

void sub_100658584()
{
}

void sub_100658608(int a1, int a2)
{
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  sub_1000A56C0();
  uint8_t v6 = "_Bool Filter_OI_DHCI_RETURN_LINK_KEYS_EVENT(OI_BYTE_STREAM *)";
  sub_1000A56A4( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "HCILite filtering. Buffer is smaller than expected. %ul < %ul (%s)",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100658690( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100658700()
{
}

void sub_100658780()
{
}

void sub_100658800()
{
}

void sub_100658880()
{
}

void sub_100658900()
{
}

void sub_100658984()
{
}

void sub_100658A04(int a1, int a2)
{
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  sub_1000A56C0();
  uint8_t v6 = "_Bool Filter_OI_DHCI_CONNECTIONLESS_PERIPHERAL_BROADCAST_RECEIVE_EVENT(OI_BYTE_STREAM *)";
  sub_1000A56A4( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "HCILite filtering. Buffer is smaller than expected. %ul < %ul (%s)",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100658A8C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100658AFC()
{
}

void sub_100658B70()
{
}

void sub_100658BE4()
{
}

void sub_100658C64()
{
}

void sub_100658CE4()
{
}

void sub_100658D58()
{
}

void sub_100658DCC()
{
}

void sub_100658E4C(int a1, int a2)
{
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  sub_1000A56C0();
  uint8_t v6 = "_Bool Filter_OI_DHCI_CMD_ID_CREATE_PHYSICAL_LINK_OPCODE(OI_BYTE_STREAM *)";
  sub_1000A56A4( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "HCILite filtering. Buffer is smaller than expected. %ul < %ul (%s)",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100658ED4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100658F44()
{
}

void sub_100658FC4(int a1, int a2)
{
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  sub_1000A56C0();
  uint8_t v6 = "_Bool Filter_OI_DHCI_CMD_ID_ACCEPT_PHYSICAL_LINK_OPCODE(OI_BYTE_STREAM *)";
  sub_1000A56A4( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "HCILite filtering. Buffer is smaller than expected. %ul < %ul (%s)",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_10065904C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006590BC()
{
}

void sub_10065913C()
{
}

void sub_1006591BC()
{
}

void sub_10065923C()
{
}

void sub_1006592B0()
{
}

void sub_100659330()
{
}

void sub_1006593B0()
{
}

void sub_100659430()
{
}

void sub_1006594B0(int a1, int a2)
{
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  sub_1000A56C0();
  uint8_t v6 = "_Bool Filter_OI_DHCI_CMD_ID_LE_SET_EXTENDED_ADVERTISING_DATA_OPCODE(OI_BYTE_STREAM *)";
  sub_1000A56A4( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "HCILite filtering. Buffer is smaller than expected. %ul < %ul (%s)",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100659538( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006595A8()
{
}

void sub_100659628(int a1, int a2)
{
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  sub_1000A56C0();
  uint8_t v6 = "_Bool Filter_OI_DHCI_CMD_ID_LE_SET_EXTENDED_SCAN_RESPONSE_DATA_OPCODE(OI_BYTE_STREAM *)";
  sub_1000A56A4( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "HCILite filtering. Buffer is smaller than expected. %ul < %ul (%s)",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_1006596B0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100659720()
{
}

void sub_1006597A0(int a1, int a2)
{
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  sub_1000A56C0();
  uint8_t v6 = "_Bool Filter_OI_DHCI_CMD_ID_LE_SET_PERIODIC_ADVERTISING_DATA_OPCODE(OI_BYTE_STREAM *)";
  sub_1000A56A4( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "HCILite filtering. Buffer is smaller than expected. %ul < %ul (%s)",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100659828( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100659898()
{
}

void sub_100659918()
{
}

void sub_10065998C()
{
}

void sub_100659A00()
{
}

void sub_100659A84()
{
}

void sub_100659B08(int a1, int a2)
{
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  sub_1000A56C0();
  uint8_t v6 = "_Bool Filter_OI_DHCI_WRITE_STORED_LINK_KEY_OPCODE(OI_BYTE_STREAM *)";
  sub_1000A56A4( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "HCILite filtering. Buffer is smaller than expected. %ul < %ul (%s)",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100659B90( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100659C00()
{
}

void sub_100659C80()
{
}

void sub_100659CF4()
{
}

void sub_100659D74()
{
}

void sub_100659DF4()
{
}

void sub_100659E78()
{
}

void sub_100659EFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100659F6C()
{
}

void sub_100659FE0()
{
}

void sub_10065A054()
{
}

void sub_10065A0D4()
{
}

void sub_10065A148()
{
}

void sub_10065A1CC()
{
}

void sub_10065A240(int a1, int a2)
{
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  sub_1000A56C0();
  uint8_t v6 = "_Bool Filter_LE_EXTENDED_ADVERTISING_REPORT_SUBEVENT(OI_BYTE_STREAM *)";
  sub_1000A56A4( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "HCILite filtering. Buffer is smaller than expected. %ul < %ul (%s)",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_10065A2C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065A338()
{
}

void sub_10065A3B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065A428()
{
}

void sub_10065A4A8()
{
}

void sub_10065A51C()
{
}

void sub_10065A590()
{
}

void sub_10065A610()
{
}

void sub_10065A690()
{
}

void sub_10065A710()
{
}

void sub_10065A790()
{
}

void sub_10065A804()
{
}

void sub_10065A878()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065A8E0()
{
}

void sub_10065A8FC(uint64_t a1)
{
  uint64_t v2 = (void (*)(const char *, uint64_t))dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "WriteStackshotReport_stdc");
  if (v2) {
    v2("BT Stack Stuck", 3172327085LL);
  }
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  if (!byte_1008DDE48) {
    __strlcpy_chk(&byte_1008DDE48, "unknown", 64LL, 64LL);
  }
  snprintf((char *)a1, 0x80uLL, "Stack watchdog timeout on thread: %s", &byte_1008DDE48);
  qword_1008D9DB8 = a1;
  sub_1001EE0E4("Watchdog_Timer - Stack Mutex try lock failed and watchdog has struck twice -- abort\n");
  sub_1000AFE1C();
  abort();
}

void sub_10065A9B4()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065AA1C()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065AA84()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065AAEC()
{
}

void sub_10065AB18()
{
  uint64_t v0 = sub_1000BC028();
  sub_1000BC00C(v0);
  sub_1000BC014((void *)&_mh_execute_header, v1, v2, "Failed to create directory %s %s", v3, v4, v5, v6, 2u);
  sub_10002B724();
}

void sub_10065AB9C()
{
  uint64_t v0 = sub_1000BC028();
  sub_1000BC00C(v0);
  sub_1000BC014((void *)&_mh_execute_header, v1, v2, "Failed to create Log directory %s %s", v3, v4, v5, v6, 2u);
  sub_10002B724();
}

void sub_10065AC1C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error starting PacketLogger XPC service, error: %d",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_10065AC8C()
{
}

void sub_10065ACF8()
{
}

void sub_10065AD24(os_log_s *a1)
{
  uint64_t v2 = sub_1000BC028();
  sub_1000BC00C(v2);
  sub_10008C484();
  sub_1000BC000((void *)&_mh_execute_header, a1, v3, "Failed to open file for writing: %s", v4);
  sub_10002B724();
}

void sub_10065AD98(os_log_s *a1)
{
  uint64_t v2 = sub_1000BC028();
  sub_1000BC00C(v2);
  sub_10008C484();
  sub_1000BC000((void *)&_mh_execute_header, a1, v3, "Failed to open new file for writing: %s", v4);
  sub_10002B724();
}

void sub_10065AE0C(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *uint64_t buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to stat file", buf, 2u);
}

void sub_10065AE48(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = qword_1008DF810;
  uint64_t v5 = __error();
  int v6 = 136315650;
  uint64_t v7 = v4;
  __int16 v8 = 2080;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  int v11 = sub_1000BC00C(v5);
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to rename file %s->%s %s",  (uint8_t *)&v6,  0x20u);
}

void sub_10065AEFC()
{
}

void sub_10065AF28()
{
}

void sub_10065AF8C()
{
}

void sub_10065AFF0(os_log_s *a1)
{
  int v2 = 136446210;
  uint64_t v3 = sub_1000848A8();
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "%{public}s", (uint8_t *)&v2, 0xCu);
  sub_10002B724();
}

void sub_10065B06C()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065B0D8()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_mgmt_connect: IOServiceOpen returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B138()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_mode: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B198()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_mode: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B1F8()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_level: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B258()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_level: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B2B8()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_mask: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B318()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_mask: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B378()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_capture_timeout: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B3D8()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_capture_timeout: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B438()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_trigger_capture: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B498()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_trigger_capture: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B4F8()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_general_debug: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B558()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_general_debug: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B5B8()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_read_crash_info: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B618()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "applebt_read_crash_info: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10065B678()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065B6E0(os_log_s *a1)
{
  __int16 v3 = 1024;
  int v4 = 0xFFFF;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "%{public}s (status=%{bluetooth:OI_STATUS}u)",  v2,  0x12u);
  sub_10002B724();
}

void sub_10065B768()
{
  __int16 v3 = sub_10009877C();
  *(_DWORD *)uint64_t v2 = 136446210;
  void *v1 = v3;
  sub_100098774((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s", v2);
  sub_10009878C();
}

void sub_10065B7B4()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, 2u);
  sub_10002B724();
}

void sub_10065B830()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065B898()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065B904()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065B970()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065B9E0()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065BA50()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065BAC0()
{
  uint64_t v2 = sub_10009877C();
  _DWORD *v1 = 136446210;
  void *v0 = v2;
  sub_100110EAC((void *)&_mh_execute_header, v3, v4, "%{public}s");
  sub_10009878C();
}

void sub_10065BB00()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065BB70()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, 2u);
  sub_10002B724();
}

void sub_10065BBEC()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065BC5C()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065BCC4()
{
}

void sub_10065BD2C()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, 2u);
  sub_10002B724();
}

void sub_10065BDA8()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065BE10()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065BE78()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065BEE0()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065BF50()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065BFC0()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065C028()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065C090()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065C0F8()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065C160()
{
  sub_100084894( (void *)&_mh_execute_header,  v1,  v2,  "applebt_hci_open: IOConnectCallMethod returned (0x%08X, %s)\n",  v3,  v4,  v5,  v6,  v7);
  sub_10002B724();
}

void sub_10065C1C8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10008651C( (void *)&_mh_execute_header,  a2,  a3,  "applebt_hci_open: applebt_hci_connect returned 0x%08X\n",  a5,  a6,  a7,  a8,  0);
  sub_100029870();
}

void sub_10065C22C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10008651C( (void *)&_mh_execute_header,  a2,  a3,  "applebt_hci_connect: IOServiceOpen returned 0x%08X\n",  a5,  a6,  a7,  a8,  0);
  sub_100029870();
}

void sub_10065C290( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10008651C( (void *)&_mh_execute_header,  a2,  a3,  "applebt_hci_connect: IOServiceAddMatchingNotification returned 0x%08X\n",  a5,  a6,  a7,  a8,  0);
  sub_100029870();
}

void sub_10065C2F4()
{
  sub_100084894( (void *)&_mh_execute_header,  v1,  v2,  "applebt_hci_close: IOConnectCallMethod returned (0x%08X, %s), closing connection\n",  v3,  v4,  v5,  v6,  v7);
  sub_10002B724();
}

void sub_10065C35C()
{
}

void sub_10065C388()
{
  sub_100084894( (void *)&_mh_execute_header,  v1,  v2,  "applebt_hci_transport_reset: IOConnectCallMethod returned (0x%08X, %s)\n",  v3,  v4,  v5,  v6,  v7);
  sub_10002B724();
}

void sub_10065C3F0()
{
}

void sub_10065C41C()
{
  sub_100084894( (void *)&_mh_execute_header,  v1,  v2,  "applebt_hci_write: IOConnectCallMethod returned (0x%08X, %s)\n",  v3,  v4,  v5,  v6,  v7);
  sub_10002B724();
}

void sub_10065C484()
{
}

void sub_10065C4B0()
{
  sub_100084894( (void *)&_mh_execute_header,  v1,  v2,  "applebt_hci_read: IOConnectCallMethod returned (0x%08X, %s)\n",  v3,  v4,  v5,  v6,  v7);
  sub_10002B724();
}

void sub_10065C518()
{
}

void sub_10065C544()
{
}

void sub_10065C570()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065C5D8()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065C640(os_log_s *a1)
{
}

void sub_10065C6B8()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065C728()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065C798()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065C800()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065C868()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, 2u);
  sub_10002B724();
}

void sub_10065C8E4(os_log_s *a1)
{
  int v2 = 136446210;
  uint64_t v3 = sub_1000848A8();
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "%{public}s", (uint8_t *)&v2, 0xCu);
  sub_10002B724();
}

void sub_10065C960()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, 2u);
  sub_10002B724();
}

void sub_10065C9DC()
{
}

void sub_10065C9F4()
{
}

void sub_10065CA10()
{
}

void sub_10065CA28()
{
}

void sub_10065CA40()
{
}

void sub_10065CA58()
{
  sub_100084894((void *)&_mh_execute_header, v0, v1, "%{public}s (status=%{bluetooth:OI_STATUS}u)", v2, v3, v4, v5, v6);
  sub_10002B724();
}

void sub_10065CAC8(os_log_s *a1)
{
  int v2 = 136446466;
  uint64_t v3 = sub_1001EDDCC();
  __int16 v4 = 1024;
  int v5 = 1023;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "%{public}s (status=%{bluetooth:OI_STATUS}u)",  (uint8_t *)&v2,  0x12u);
}

void sub_10065CB60()
{
}

void sub_10065CB8C()
{
}

void sub_10065CBB8()
{
}

void sub_10065CBE4()
{
}

void sub_10065CC10()
{
}

void sub_10065CC3C()
{
}

void sub_10065CC68()
{
}

void sub_10065CCC8()
{
}

void sub_10065CCF4()
{
}

void sub_10065CD54()
{
}

void sub_10065CD80()
{
}

void sub_10065CDAC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065CE1C()
{
  sub_10008652C((void *)&_mh_execute_header, v0, v1, "Failed to notify %s, notify_post returned %d", v2, v3, v4, v5, 2u);
  sub_10003BE20();
}

void sub_10065CE88()
{
  sub_10008652C( (void *)&_mh_execute_header,  v0,  v1,  "Failed to notify %s, notify_set_state returned %d",  v2,  v3,  v4,  v5,  2u);
  sub_10003BE20();
}

void sub_10065CEF4()
{
}

void sub_10065CF20()
{
}

void sub_10065CF4C()
{
}

void sub_10065CF78()
{
}

void sub_10065CFA4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D020( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D08C(_BYTE *a1, _BYTE *a2)
{
  sub_1001FE010((void *)&_mh_execute_header, v2, (uint64_t)v2, "No command response is returned.", v3);
}

void sub_10065D0B8(_BYTE *a1, _BYTE *a2)
{
}

void sub_10065D0E4(_BYTE *a1, _BYTE *a2)
{
}

void sub_10065D110( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D178( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D1E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D258( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D2C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D338( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D3A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D418( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D480( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D4F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D560( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D5D0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D640( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D6B0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065D720()
{
}

void sub_10065D74C()
{
}

void sub_10065D778()
{
}

void sub_10065D7D8()
{
}

void sub_10065D838()
{
}

void sub_10065D898()
{
}

void sub_10065D8F8()
{
}

void sub_10065D958()
{
  __int16 v2 = 1024;
  int v3 = 2;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "setOfflineAdvertisingDataAndPayload set %d invalid, we only have %d sets",  v1,  0xEu);
  sub_10003BE20();
}

void sub_10065D9D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065DA44()
{
}

void sub_10065DA70()
{
}

void sub_10065DAD0()
{
}

void sub_10065DAFC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065DB64( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065DBC8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065DC2C()
{
}

void sub_10065DC58()
{
}

void sub_10065DC84()
{
}

void sub_10065DCB0()
{
}

void sub_10065DCDC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065DD10( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065DD44()
{
}

void sub_10065DD70()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100201740( (void *)&_mh_execute_header,  v2,  v3,  "BTLQ Cannot remove Link Quality Data, device (%s) not existing",  v4);
  sub_10007B3CC();
}

void sub_10065DDBC()
{
}

void sub_10065DDE8()
{
}

void sub_10065DE14()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100201740((void *)&_mh_execute_header, v2, v3, "BTLQ Cannot set Link Quality Data, device (%s) not existing", v4);
  sub_10007B3CC();
}

void sub_10065DE60()
{
}

void sub_10065DE8C()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_100201740( (void *)&_mh_execute_header,  v2,  v3,  "BTLQ Cannot update Link Quality Data, device (%s) not existing",  v4);
  sub_10007B3CC();
}

void sub_10065DED8(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = "stats";
  if (!a1) {
    uint64_t v2 = "device";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "BTLQ Cannot update Link Quality Data, invalid %s",  (uint8_t *)&v3,  0xCu);
}

void sub_10065DF64()
{
}

void sub_10065DF90()
{
}

void sub_10065DFBC()
{
}

void sub_10065DFE8(char a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "[BTVCBonjourService] Got nil connection (isAdvToBrowserConnection : %d)",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_10065E05C()
{
}

void sub_10065E0BC()
{
}

void sub_10065E11C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_10065E168(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_10065E1B4()
{
}

void sub_10065E21C()
{
}

void sub_10065E284()
{
}

void sub_10065E2E4()
{
}

void sub_10065E354()
{
}

void sub_10065E3C0()
{
}

void sub_10065E3EC()
{
}

void sub_10065E44C(uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 152);
  sub_1002077E0(&v2);
}

void sub_10065E4A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "SCO disconnect stack event never fired, cleaning up route change state",  v1,  2u);
}

void sub_10065E4E0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 136446466;
  uint64_t v5 = v3;
  __int16 v6 = 2082;
  uint64_t v7 = a2;
  sub_10020603C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "XPCServiceConnection (%{public}s) event: %{public}s",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_10065E55C(uint64_t a1, xpc_object_t xdict, os_log_s *a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  int v6 = 136446466;
  uint64_t v7 = v4;
  __int16 v8 = 2082;
  string = xpc_dictionary_get_string(xdict, _xpc_error_key_description);
  sub_10020603C( (void *)&_mh_execute_header,  a3,  v5,  "XPCServiceConnection (%{public}s) error: %{public}s",  (uint8_t *)&v6);
}

void sub_10065E600( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065E668( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065E6D0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065E740( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065E7B0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065E7E0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065E810( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065E840()
{
}

void sub_10065E8A0(int a1, os_log_s *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 20161219;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "CoreBluetooth version %d differs from bluetoothd version %d",  (uint8_t *)v2,  0xEu);
  sub_10003BE20();
}

void sub_10065E924(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136446210;
  int v4 = a2;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Duplicate XPC check-in from session %{public}s",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10065E99C()
{
}

void sub_10065E9C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065EA38( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065EAA8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065EB18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065EB88( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065EBF8()
{
}

void sub_10065EC24()
{
}

void sub_10065EC84()
{
}

void sub_10065ECB0()
{
}

void sub_10065ECDC()
{
}

void sub_10065ED08()
{
}

void sub_10065ED34()
{
}

void sub_10065ED94()
{
}

void sub_10065EDC0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065EE30()
{
}

void sub_10065EE90()
{
}

void sub_10065EEF0()
{
}

void sub_10065EF1C()
{
}

void sub_10065EF7C(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Unparseable name change for the device %@",  (uint8_t *)a2);
}

void sub_10065EFC8()
{
}

void sub_10065F028()
{
}

void sub_10065F094(char *a1, uint64_t a2, os_log_s *a3)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "deviceInfoChanged: failed to get device uuid for %{public}s",  (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10065F0FC()
{
}

void sub_10065F15C()
{
}

void sub_10065F188()
{
}

void sub_10065F1B4()
{
}

void sub_10065F1E0(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "addServiceDataToLocalSDP: null uuids", a1);
}

void sub_10065F214()
{
}

void sub_10065F274()
{
}

void sub_10065F2A0()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "There is already a service handling %@ with handle %X",  v2,  0x12u);
  sub_10003BE20();
}

void sub_10065F31C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "addServiceDataToLocalSDP: Currently not validating 16Byte UUIDs",  a1);
}

void sub_10065F350( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10065F3B8(uint64_t a1, os_log_s *a2)
{
  if (v5 >= 0) {
    __int16 v3 = __p;
  }
  else {
    __int16 v3 = (void **)__p[0];
  }
  *(_DWORD *)uint64_t buf = 136315138;
  uint64_t v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "addStaleAACPConnReqDev : device %s is already in the stale AACP connection device list",  buf,  0xCu);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10065F474()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "No AACP connection for device %{public}s", v8);
  sub_10007B3CC();
}

void sub_10065F4C0()
{
  if (v6 >= 0) {
    uint64_t v7 = v1;
  }
  else {
    uint64_t v7 = (void *)*v1;
  }
  *(_DWORD *)uint64_t v2 = 136446466;
  *(void *)(v2 + 4) = v7;
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = v3;
  sub_100241D4C((void *)&_mh_execute_header, v5, v3, "connecting to %{public}s failed, result %d", v4);
  sub_10007B3CC();
}

void sub_10065F524()
{
}

void sub_10065F584()
{
}

void sub_10065F5E4()
{
}

void sub_10065F610()
{
}

void sub_10065F63C(char *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1[23] >= 0) {
    uint8_t v6 = a1;
  }
  else {
    uint8_t v6 = *(char **)a1;
  }
  sub_100241C64(a2, (uint64_t)v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "No AACP connection for device %{public}s", v8);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
  *a4 = qword_1008F7560;
  sub_10007B3CC();
}

void sub_10065F6B0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LOWORD(sub_1001FE010((void *)&_mh_execute_header, v2, (uint64_t)v2, "Unable to scan bytes", v3) = 1024;
  HIWORD(sub_1001FE010((void *)&_mh_execute_header, v2, (uint64_t)v2, "Unable to scan bytes", v3) = *(unsigned __int8 *)(a2 + 9);
  sub_100241CF0( (void *)&_mh_execute_header,  a2,  a3,  "Set ListeningMode : for in-ear support audio headsets, ANC mode cannot be enabled if both sides are not in-ear: prim ary bud = %d , secondary bud = %d",  67109376,  v3);
  sub_10003BE20();
}

void sub_10065F728()
{
}

void sub_10065F754()
{
}

void sub_10065F780()
{
}

void sub_10065F7AC()
{
}

void sub_10065F7D8()
{
}

void sub_10065F804()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "updateKeys: no AACP connection for device %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10065F850()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "requestKeys: no AACP connection for device %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10065F89C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "sendSetupCommand: no AACP connection for device %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10065F8E8()
{
  int v3 = 998;
  sub_100241D04((void *)&_mh_execute_header, v0, v1, "Relay message length -> %d exceeds MTU -> %d", v2);
  sub_10003BE20();
}

void sub_10065F954()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "No valid AACP Connection for the target device %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10065F9A0()
{
}

void sub_10065FA00()
{
  int v3 = 2;
  sub_100241D04( (void *)&_mh_execute_header,  v0,  v1,  "Number of connections in list -> %d exceeds maximum supported -> %d",  v2);
  sub_10003BE20();
}

void sub_10065FA6C()
{
}

void sub_10065FACC()
{
}

void sub_10065FB2C()
{
}

void sub_10065FB58()
{
}

void sub_10065FB84()
{
}

void sub_10065FBE8()
{
}

void sub_10065FC14()
{
}

void sub_10065FC40()
{
}

void sub_10065FCA0()
{
}

void sub_10065FCCC()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "Device %{public}s has empty UUID", v8);
  sub_10007B3CC();
}

void sub_10065FD18()
{
}

void sub_10065FD44()
{
}

void sub_10065FD70()
{
}

void sub_10065FDD0()
{
  _os_log_fault_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "Received MKB first unlock notification, but MKBDeviceUnlockedSinceBoot returns 0",  v1,  2u);
  sub_100029870();
}

void sub_10065FE08(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136446210;
  *(void *)(a1 + 4) = "null";
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "getInEarStatus: No AACP connection for %{public}s", (uint8_t *)a1);
}

void sub_10065FE48()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "getInEarStatus: No AACP connection for %{public}s", v8);
  sub_10007B3CC();
}

void sub_10065FE94()
{
}

void sub_10065FEC0()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "getPrimaryBudSide: No AACP connection for %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10065FF0C(void *a1, char *a2, uint64_t a3, os_log_s *a4)
{
  if (a2[23] >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *(char **)a2;
  }
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + 14) = v6;
  sub_10020603C( (void *)&_mh_execute_header,  a4,  a3,  "Magnet link disconnect from %{public}@ does not match connected magnet %s",  (uint8_t *)a3);
  if (a2[23] < 0) {
    operator delete(*(void **)a2);
  }

  sub_10007B3CC();
}

void sub_10065FF8C()
{
}

void sub_10065FFB8()
{
}

void sub_10065FFE4()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "sendSmartRoutingInformation: Failed to send SR info message with status = %{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100660044()
{
}

void sub_100660070()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "sendConversationDetectMessage: Failed to send CD Message with status = %{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_1006600D0()
{
}

void sub_1006600FC()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "sendFeatureProxCardStatusUpdate: Failed to send feature prox card status update with status = %{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10066015C()
{
}

void sub_100660188()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "sendSourceContextMessage: Failed to send source context message with status = %{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_1006601E8()
{
}

void sub_100660214()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "sendAdaptiveVolumeMessage: Failed to send adaptive volume message with status = %{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100660274()
{
}

void sub_1006602A0()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "sendPMEConfigMessage: Failed to send PME config message with status = %{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100660300()
{
}

void sub_10066032C()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "sendUARPData: Failed to send uarp message to buds with status = %{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10066038C(uint64_t a1, os_log_s *a2)
{
  id v3 = sub_1005BF848(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10008C484();
  sub_1000BC000((void *)&_mh_execute_header, a2, v5, "No device found for a disconnect event from %@", v6);
}

void sub_100660418()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8149e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "No active connection for a disconnect event from  device %s",  v8);
  sub_10007B3CC();
}

void sub_100660464()
{
}

void sub_100660490(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "sendEASessionPacket: No existing open BTEASession", a1);
}

void sub_1006604C4()
{
}

void sub_1006604F0(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100660578(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100660600()
{
}

void sub_10066062C()
{
}

void sub_100660658()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "publishAccRemoteFirmware: Failed to create CoreAccessories certificate endpoint for %{public}s",  v8);
  sub_10007B3CC();
}

void sub_1006606A4()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "publishAccRemoteFirmware: No serial numbers for %{public}s",  v8);
  sub_10007B3CC();
}

void sub_1006606F0(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100660778()
{
}

void sub_1006607A4(os_log_s *a1)
{
  if (v13 < 0) {
    sub_100241C9C(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  sub_100241C70();
}

void sub_10066082C()
{
}

void sub_100660858(os_log_s *a1)
{
  if (v13 < 0) {
    sub_100241C9C(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  sub_100241C70();
}

void sub_1006608E0()
{
}

void sub_10066090C(os_log_s *a1)
{
  if (v13 < 0) {
    sub_100241C9C(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  sub_100241C70();
}

void sub_100660994()
{
}

void sub_1006609C0()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "No valid AACP Connection for the addr %{public}s", v8);
  sub_10007B3CC();
}

void sub_100660A0C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8149e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "No connection exists to notify remote stream state for %s",  v8);
  sub_10007B3CC();
}

void sub_100660A58()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8149e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "No connection exists to set remote stream state for %s",  v8);
  sub_10007B3CC();
}

void sub_100660AA4()
{
}

void sub_100660AD0()
{
}

void sub_100660AFC(uint64_t *a1, unsigned __int16 *a2, uint8_t *buf, os_log_t log)
{
  else {
    uint64_t v5 = (uint64_t *)*a1;
  }
  int v6 = *a2;
  *(_DWORD *)uint64_t buf = 136446466;
  *(void *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v6;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Received AACP_CUSTOM_MESSAGE_TYPE_SENSOR_V2 message from %{public}s: len %u",  buf,  0x12u);
  sub_10007B3CC();
}

void sub_100660B78()
{
}

void sub_100660BA4(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100660C2C(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100660CB4(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100660D3C(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100660DC4(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100660E4C(os_log_s *a1)
{
  if (v13 < 0) {
    sub_100241C9C(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  }
  sub_100241C70();
}

void sub_100660ED4()
{
}

void sub_100660F00()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "versionInfoEvent: No AACP connection for %{public}s", v8);
  sub_10007B3CC();
}

void sub_100660F4C()
{
}

void sub_100660FAC()
{
}

void sub_10066100C()
{
}

void sub_10066106C()
{
}

void sub_100661098(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "versionInfoEvent: Error destroying connection %@", (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_100661104(uint64_t a1, int *a2, uint64_t a3, os_log_s *a4)
{
  int v4 = *a2;
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v4;
  sub_100241D4C((void *)&_mh_execute_header, a4, a3, "versionInfoEvent: Could not open %@ (errno %d))", (uint8_t *)a3);
}

void sub_100661154()
{
}

void sub_1006611B4()
{
}

void sub_1006611E0(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100661264(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_1006612E8(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_10066136C(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_1006613F0(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100661474(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_1006614F8()
{
}

void sub_100661524()
{
}

void sub_100661584()
{
}

void sub_1006615E8()
{
}

void sub_100661648()
{
}

void sub_1006616A8()
{
}

void sub_1006616D4()
{
}

void sub_100661700()
{
}

void sub_10066172C()
{
}

void sub_100661758()
{
}

void sub_1006617BC()
{
}

void sub_100661820()
{
}

void sub_10066184C()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 141558275;
  *(void *)(v2 + 4) = 1752392040LL;
  *(_WORD *)(v2 + 12) = 2081;
  *(void *)(v2 + 14) = v8;
  sub_10020603C((void *)&_mh_execute_header, v3, (uint64_t)v3, "Unable to rename device %{private, mask.hash}s", v4);
  sub_10007B3CC();
}

void sub_1006618B0()
{
}

void sub_1006618DC()
{
}

void sub_100661908()
{
}

void sub_100661934()
{
}

void sub_100661998()
{
}

void sub_1006619FC()
{
}

void sub_100661A6C()
{
}

void sub_100661AD0()
{
}

void sub_100661B3C()
{
}

void sub_100661BA0()
{
}

void sub_100661C04()
{
}

void sub_100661C30()
{
}

void sub_100661C5C()
{
}

void sub_100661C88()
{
}

void sub_100661CC0()
{
}

void sub_100661CF8()
{
}

void sub_100661D5C()
{
}

void sub_100661D94()
{
  sub_10008651C((void *)&_mh_execute_header, v0, v1, "Invalid GAPAAuthState=%d dismiss challenge", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100661DF4()
{
}

void sub_100661E2C()
{
}

void sub_100661E90()
{
}

void sub_100661EFC()
{
}

void sub_100661F28()
{
}

void sub_100661F54()
{
}

void sub_100661F80(uint64_t a1, id *a2)
{
  uint64_t v4 = *(void **)(a1 + 680);
  if (v4)
  {
    *(void *)(a1 + 688) = v4;
    operator delete(v4);
  }

  sub_10023DE70((void *)(a1 + 632));

  sub_100242E28(a1 + 536);
  uint64_t v5 = *(void **)(a1 + 504);
  if (v5)
  {
    *(void *)(a1 + 512) = v5;
    operator delete(v5);
  }

  sub_100242E28(a1 + 440);
  sub_10023DF50((void *)(a1 + 416));

  else {
    sub_10007B3CC();
  }
}

void sub_100662010()
{
}

void sub_10066203C()
{
}

void sub_100662068()
{
}

void sub_100662094(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "dispatchCertificates: Failed to publish %lu certificates",  (uint8_t *)a1);
}

void sub_1006620D0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = 0x4000000000000000LL;
  sub_1000BC000( (void *)&_mh_execute_header,  a1,  a3,  "No response for TiPi connectin priority list request from Wx within %f seconds, reset pending flag",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100662140()
{
}

void sub_10066216C()
{
}

void sub_1006621CC()
{
}

void sub_10066222C()
{
}

void sub_10066228C()
{
}

void sub_1006622EC()
{
}

void sub_10066234C()
{
}

void sub_1006623AC()
{
}

void sub_10066240C()
{
}

void sub_10066246C()
{
}

void sub_1006624CC()
{
}

void sub_1006624F8()
{
}

void sub_100662524(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "parseAACPDescriptor L2CAP signal channel not found", a1);
}

void sub_100662558()
{
}

void sub_10066259C()
{
}

void sub_1006625E0()
{
  sub_1002433E0((void *)&_mh_execute_header, v0, v1, "error = %d while initializing the mutex", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100662640()
{
  sub_1002433E0((void *)&_mh_execute_header, v0, v1, "error = %d while calling destructor of mutex", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_1006626A0()
{
  sub_1002433E0((void *)&_mh_execute_header, v0, v1, "error = %d while trying to lock the mutex", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100662700()
{
  sub_1002433E0((void *)&_mh_execute_header, v0, v1, "error = %d while trying to unlock the mutex", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100662760( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006627D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100662848()
{
  sub_1002433E0((void *)&_mh_execute_header, v0, v1, "error = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_1006628A8(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "transport != LE_TRANSPORT";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10066291C()
{
}

void sub_100662948()
{
}

void sub_100662974()
{
}

void sub_1006629A0()
{
}

void sub_1006629CC()
{
}

void sub_100662A30()
{
}

void sub_100662A94()
{
}

void sub_100662B04()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_10024EF4C( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Couldn't find a registered scalable pipe for session %{public}s",  v8);
  sub_10007B3CC();
}

void sub_100662B50()
{
}

void sub_100662B94()
{
}

void sub_100662BD8()
{
}

void sub_100662C04( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100662C68( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100662CCC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100662D30()
{
}

void sub_100662D90(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "fUpgradeAssertion == NULL";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100662E04(const unsigned __int8 *a1, os_log_s *a2)
{
  int v3 = sub_100241F94(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10008C484();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Trying to switch our key derivation method for device %{public}@",  v5,  0xCu);

  sub_10002B724();
}

void sub_100662E90()
{
}

void sub_100662EBC(unsigned __int8 a1, os_log_s *a2)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = sub_10008FA00();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Transport upgrade to classic failed due to security error. peerCLVersion=%d localVersion=%d",  (uint8_t *)v3,  0xEu);
  sub_10002B724();
}

void sub_100662F54(void *a1, char a2, os_log_s *a3)
{
  uint64_t v3 = (void *)*a1;
  if ((a2 & 1) == 0) {
    uint64_t v3 = a1;
  }
  int v4 = 136446210;
  int v5 = v3;
  sub_10024EF4C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Attempting to complete pending registration of endpoint %{public}s for non-existent session",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_100662FCC()
{
}

void sub_100663030()
{
}

void sub_10066305C()
{
}

void sub_100663088(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "Enable";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%{public}s cross layer logs",  (uint8_t *)&v1,  0xCu);
  sub_10003BE20();
}

void sub_100663104( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100663174()
{
}

void sub_1006631E8()
{
}

void sub_10066325C()
{
}

void sub_1006632D0()
{
}

void sub_100663334()
{
}

BOOL sub_100663394( os_log_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return *a2 == 0LL;
}

void sub_100663420( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100663490()
{
}

void sub_1006634F4()
{
}

void sub_100663520()
{
}

void sub_100663584( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006635EC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100663654( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006636BC()
{
}

void sub_100663720()
{
}

void sub_100663784()
{
}

void sub_1006637F8()
{
}

void sub_10066386C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006638D0(os_log_s *a1)
{
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_FAULT,  "serverChannel is NULL, error is %s",  (uint8_t *)&v4,  0xCu);
  sub_10002B724();
}

void sub_10066395C()
{
}

void sub_1006639C0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100663A24()
{
  sub_100029860((void *)&_mh_execute_header, v0, v1, "pd already got freed up, return", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100663A50()
{
}

void sub_100663AB0()
{
}

void sub_100663B24()
{
}

void sub_100663B50(_BYTE *a1, _BYTE *a2)
{
}

void sub_100663B78(_BYTE *a1, _BYTE *a2)
{
}

void sub_100663BA0(_BYTE *a1, _BYTE *a2)
{
}

void sub_100663BC8(_BYTE *a1, _BYTE *a2)
{
}

void sub_100663BF0(_BYTE *a1, _BYTE *a2)
{
}

void sub_100663C18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100663C88( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100663CEC()
{
}

void sub_100663D50( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100663DB4()
{
}

void sub_100663E30(_BYTE *a1, _BYTE *a2)
{
}

void sub_100663E64(_BYTE *a1, _BYTE *a2)
{
}

void sub_100663E8C(_BYTE *a1, _BYTE *a2)
{
}

void sub_100663EB4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100663F24()
{
  int v3 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Failed to transmit network relay data from socket on pipe 0x%04x with result %{bluetooth:OI_STATUS}u",  v2,  0xEu);
  sub_10003BE20();
}

void sub_100663F9C()
{
}

void sub_100663FC8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100664040(uint64_t a1, unsigned int a2, os_log_s *a3)
{
  uint64_t v3 = *(int *)(a1 + 48);
  else {
    uint64_t v4 = off_100889FF8[v3];
  }
  if (a2 >= 5) {
    uint64_t v5 = "Unknown BSM State";
  }
  else {
    uint64_t v5 = off_100889FF8[a2];
  }
  int v6 = 136446466;
  char v7 = v4;
  __int16 v8 = 2082;
  int v9 = v5;
  sub_10025CFF8( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "BandSwitchManager: INVALID STATE TRANSITION %{public}s -> %{public}s",  (uint8_t *)&v6);
}

void sub_1006640F8()
{
}

void sub_100664124()
{
}

void sub_100664150()
{
}

void sub_10066417C()
{
}

void sub_1006641A8()
{
}

void sub_1006641D4(unsigned int a1, os_log_s *a2, uint64_t a3)
{
  if (a1 > 3) {
    uint64_t v3 = "Unknown BSM State";
  }
  else {
    uint64_t v3 = off_100889FD8[a1];
  }
  int v4 = 136315394;
  uint64_t v5 = "BOOL BT::BandSwitchManager::BSMHRBBandEnable(OI_BD_ADDR *, uint8_t)";
  __int16 v6 = 2082;
  char v7 = v3;
  sub_10025CFF8((void *)&_mh_execute_header, a2, a3, "%s was called from %{public}s", (uint8_t *)&v4);
}

void sub_100664274()
{
}

void sub_1006642AC()
{
}

void sub_1006642D8(uint64_t a1, os_log_s *a2)
{
  if (v5 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  *(_DWORD *)uint64_t buf = 136446210;
  char v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Received an Allowed Band CB for device %{public}s that BSM isn't aware of",  buf,  0xCu);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

void sub_100664388(void *a1, os_log_s *a2)
{
}

void sub_100664408()
{
}

void sub_10066446C()
{
}

void sub_100664498()
{
}

void sub_1006644C4(void *a1, os_log_s *a2)
{
}

void sub_100664534(void *a1, os_log_s *a2)
{
}

void sub_1006645A4(void *a1, os_log_s *a2)
{
}

void sub_100664614(void *a1, os_log_s *a2)
{
}

void sub_100664684()
{
}

void sub_1006646E8()
{
}

void sub_10066474C()
{
}

void sub_1006647B0()
{
}

void sub_1006647DC()
{
}

void sub_100664840()
{
}

void sub_10066486C()
{
}

void sub_100664898( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066490C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066493C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066496C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066499C()
{
}

void sub_1006649C8()
{
}

void sub_1006649F4(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2) {
    atomic_load((unint64_t *)(*(void *)a2 + 24LL));
  }
  sub_100260780();
  HIWORD(sub_100029860( (void *)&_mh_execute_header,  v0,  v1,  "AudioRingBuffer::readFrameInternal, frame header cannot be wrapped around",  v2,  v3,  v4,  v5, v6) = v2;
  sub_10026076C( (void *)&_mh_execute_header,  v3,  v4,  "AudioRingBuffer::readFrameInternal, frame length(%lu) bigger than available buffer length (%lu)",  v5,  v6);
}

void sub_100664A70()
{
}

void sub_100664A9C(uint64_t a1)
{
  HIWORD(sub_100255AA0((void *)&_mh_execute_header, v2, v3, "Skywalk pipes are only supported for CL", v4) = v1;
  sub_10026076C( (void *)&_mh_execute_header,  v1,  v2,  "Shared memory size (%lu bytes available) has less than requested buffer length (%lu), deferring write",  v3,  v4);
}

void sub_100664B18()
{
}

void sub_100664B44(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = (void *)(a1 + 56);
  int v3 = 136446210;
  uint64_t v4 = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "%{public}s has insufficient entitlements to send MBFramework XPC messages",  (uint8_t *)&v3,  0xCu);
  sub_10003BE20();
}

void sub_100664BC4()
{
}

void sub_100664C44()
{
}

void sub_100664CC4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC message with XPC_TYPE_ERROR", v1, 2u);
}

void sub_100664D04(unsigned __int8 a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "BTVirtualHCIEventPacket";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: opCode 0x%04X, malloc failed",  (uint8_t *)&v2,  0x12u);
}

void sub_100664D90()
{
}

void sub_100664DBC(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Received wrong length of keys in master key blob: %zu",  (uint8_t *)&v2,  0xCu);
  sub_10003BE20();
}

void sub_100664E2C(unsigned __int8 a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Received wrong number of keys in master key blob received %d, Expected : 2",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_100664EA0()
{
}

void sub_100664ECC()
{
}

void sub_100664EF8()
{
}

void sub_100664F58(uint64_t a1, os_log_s *a2)
{
  v2[0] = 68157954;
  v2[1] = 16;
  __int16 v3 = 2096;
  uint64_t v4 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "upgradeDeviceToManatee Acc Master Hint:%.16P",  (uint8_t *)v2,  0x12u);
  sub_10003BE20();
}

void sub_100664FD8()
{
}

void sub_100665004()
{
}

void sub_100665030()
{
}

void sub_100665098()
{
}

void sub_100665114( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665144()
{
}

void sub_1006651C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006651F0()
{
}

void sub_10066526C(char a1, os_log_s *a2)
{
  uint64_t v2 = "";
  if ((a1 & 1) != 0) {
    uint64_t v2 = "(force)";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "[BTVCLinkAdvertiser] RestartIfNeeded %s\n",  (uint8_t *)&v3,  0xCu);
  sub_10003BE20();
}

void sub_1006652F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066532C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066535C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006653C4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665428( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665498( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665508( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066556C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006655D0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665634( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665698( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665708( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665778(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 136);
  if (v2)
  {
    *(void *)(a1 + 144) = v2;
    operator delete(v2);
  }

  sub_10023BF24(a1 + 104, *(void **)(a1 + 112));

  int v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_1006657E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665818( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665848( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100665878(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Audio Timesync: - addTimestampWithMachAbsolute Error:%@",  (uint8_t *)&v2,  0xCu);
}

void sub_1006658EC()
{
}

void sub_10066594C()
{
}

void sub_100665978()
{
}

void sub_1006659A4()
{
}

void sub_1006659D0()
{
}

void sub_1006659FC()
{
}

void sub_100665A28()
{
}

void sub_100665A8C()
{
}

void sub_100665AB8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Failed to create session info for session %{public}s",  v8);
  sub_10007B3CC();
}

void sub_100665B04(unsigned int a1, uint64_t a2, os_log_s *a3)
{
  if (a1 > 3) {
    uint64_t v3 = @"Unknown";
  }
  else {
    uint64_t v3 = (const __CFString *)*((void *)&off_10088BE00 + (int)a1);
  }
  int v4 = 138543618;
  char v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  sub_10020603C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Couldn't find a registered %{public}@ app for invalid session '%p'",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_100665B9C()
{
}

void sub_100665C00()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Overriding background support for TCC-disabled session %{public}s",  v8);
  sub_10007B3CC();
}

void sub_100665C4C()
{
}

void sub_100665C78()
{
}

void sub_100665CA4(uint64_t a1)
{
  if (v22 < 0) {
    sub_100241C9C(v7, v8, v9, v10, v11, v12, v13, v14, v17, v19);
  }
  sub_100241C70();
}

void sub_100665D1C()
{
}

void sub_100665D48()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "Session %{public}s is AppSessionTypeEither!", v8);
  sub_10007B3CC();
}

void sub_100665D94()
{
}

void sub_100665DC0()
{
}

void sub_100665DEC()
{
}

void sub_100665E18()
{
}

void sub_100665E44()
{
}

void sub_100665E70(uint64_t a1, os_log_s *a2)
{
  if (v15 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  }
  sub_100241C70();
}

void sub_100665EF0()
{
}

void sub_100665F1C()
{
}

void sub_100665F7C()
{
}

void sub_100665FC0(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "%{public}@ exceed max number of LE connection request limit per App.",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_10066602C()
{
}

void sub_100666058()
{
  if (v6 >= 0) {
    int v7 = v1;
  }
  else {
    int v7 = (void *)*v1;
  }
  *(_DWORD *)uint64_t v3 = 136315394;
  *(void *)(v3 + 4) = v7;
  *(_WORD *)(v3 + 12) = 2112;
  *(void *)(v3 + 14) = v2;
  sub_10020603C((void *)&_mh_execute_header, v5, v3, "App %s is not interested in %@", v4);
  sub_10007B3CC();
}

void sub_1006660BC()
{
}

void sub_1006660E8()
{
}

void sub_10066612C()
{
}

void sub_100666158()
{
}

void sub_100666184()
{
}

void sub_1006661B0()
{
}

void sub_1006661DC()
{
}

void sub_100666208()
{
}

void sub_100666234()
{
}

void sub_100666260()
{
}

void sub_10066628C()
{
}

void sub_1006662B8()
{
}

void sub_10066631C()
{
}

void sub_100666380()
{
}

void sub_1006663C4()
{
}

void sub_100666408()
{
}

void sub_100666468()
{
}

void sub_100666494()
{
}

void sub_1006664D8()
{
}

void sub_10066651C(uint64_t a1, os_log_s *a2)
{
  __int16 v16 = 2114;
  uint64_t v17 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "deviceSubscribedNotification Notifying listeners that %{public}s is interested in %{public}@",  buf,  0x16u);
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

void sub_1006665E8()
{
}

void sub_10066662C()
{
}

void sub_100666690()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Trying to dispatch a pairing request to a session (%{public}s) without an XPC connection",  v8);
  sub_10007B3CC();
}

void sub_1006666DC()
{
}

void sub_100666740(uint64_t a1, uint64_t *a2, uint64_t a3, os_log_s *a4)
{
  else {
    char v5 = (uint64_t *)*a2;
  }
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2082;
  *(void *)(a3 + 14) = v5;
  sub_10020603C( (void *)&_mh_execute_header,  a4,  a3,  "Device %{public}@ with invalid security keys connected for session %{public}s, reporting.",  (uint8_t *)a3);
  sub_10007B3CC();
}

void sub_1006667B0()
{
}

void sub_1006667DC()
{
}

void sub_100666808()
{
}

void sub_10066686C()
{
}

void sub_100666898(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100666924()
{
}

void sub_100666984(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *uint64_t buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Session is AppSessionTypeEither", buf, 2u);
}

void sub_1006669C0()
{
}

void sub_100666A24()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8149e-34);
  sub_1002929E8((void *)&_mh_execute_header, v7, (uint64_t)v7, "AppManager::updatedFindMyDevices session:%s", v8);
  sub_10007B3CC();
}

void sub_100666A70()
{
}

void sub_100666ADC()
{
}

void sub_100666B08()
{
}

void sub_100666B6C()
{
}

void sub_100666B98()
{
}

void sub_100666BC4()
{
}

void sub_100666BF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100666C2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100666C60( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100666C90(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "XPC publish msg create for deviceType %d failed",  (uint8_t *)v3,  8u);
  sub_100029870();
}

void sub_100666D04(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "XpcAudioPluginDevice sendPropertyUpdatedMsg for property %s",  (uint8_t *)&v2,  0xCu);
  sub_10003BE20();
}

void sub_100666D74(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "XPC msg create for %s failed",  (uint8_t *)&v3,  0xCu);
  sub_10003BE20();
}

void sub_100666DE8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100666E4C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100666E7C(unsigned __int8 *a1, uint64_t a2, os_log_t log)
{
  unsigned __int8 v3 = atomic_load(a1);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(a2 + 41));
  v5[0] = 67109376;
  v5[1] = v3 & 1;
  __int16 v6 = 1024;
  int v7 = v4 & 1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Dropping XPC message to XpcAudioPluginDevice. Invalid transitioning state (fIsPublished %d, fIsClosing %d)",  (uint8_t *)v5,  0xEu);
  sub_10003BE20();
}

void sub_100666F10( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100666F74(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)unsigned __int8 v3 = 0;
  sub_100298BA8( (void *)&_mh_execute_header,  a1,  a3,  "Attempted to store an address of 00:00:00:00:00:00 into keychain",  v3);
  sub_100029870();
}

void sub_100666FA8(uint64_t a1, CFTypeRef cf, os_log_s *a3)
{
  v4[0] = 68158466;
  v4[1] = 6;
  __int16 v5 = 2096;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  CFTypeID v8 = CFGetTypeID(cf);
  __int16 v9 = 2048;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "datrStructure for device %{bluetooth:BD_ADDR}.6P) invalid %ld (expected %ld)",  (uint8_t *)v4,  0x26u);
}

void sub_10066706C()
{
}

void sub_1006670CC()
{
}

void sub_10066712C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10008651C( (void *)&_mh_execute_header,  a1,  a3,  "_BTKCGetDataCopy returned %d and _data is NULL",  a5,  a6,  a7,  a8,  0);
  sub_100029870();
}

void sub_100667194()
{
}

void sub_1006671F4()
{
}

void sub_100667260(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a1, a3, "Failed to create query dictionary for LE addresses", v3);
  sub_100029870();
}

void sub_100667294(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100298BA8((void *)&_mh_execute_header, a3, (uint64_t)a3, "Could not find address from keychain!", a1);
}

void sub_1006672C8(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "Address is zero! Skipping", a1);
}

void sub_1006672FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066736C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006673DC()
{
}

void sub_10066743C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a1, a3, "Cannot deleteAllDataForService with invalid service name", v3);
  sub_100029870();
}

void sub_100667470( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006674E0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100667550()
{
}

void sub_100667580(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "HFP ring threshold mode device invalid %p",  (uint8_t *)&v3,  0xCu);
  sub_10003BE20();
}

void sub_1006675F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100667664(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "fAudioBytesOutstanding <= MAX_VOICE_SIZE_IN_BYTES";
  sub_10024EF4C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Assertion failed: %{public}s", a1);
}

void sub_1006676A8(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "No Sco Connection handle to write to", a1);
}

void sub_1006676DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066774C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006677B0()
{
}

void sub_1006677DC()
{
}

void sub_100667808(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "wrote %ld bytes to audio buffer when max size is %zu",  (uint8_t *)&v3,  0x16u);
  sub_10003BE20();
}

void sub_100667888( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006678F8()
{
}

void sub_100667924()
{
}

void sub_100667950( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006679B4()
{
}

void sub_1006679E4()
{
  sub_100295790((void *)&_mh_execute_header, v0, v1, "is4388B0 = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100667A50()
{
  sub_100295790((void *)&_mh_execute_header, v0, v1, "is4388C0 = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100667ABC()
{
  sub_100295790((void *)&_mh_execute_header, v0, v1, "is4388C2 = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100667B28()
{
  sub_100295790((void *)&_mh_execute_header, v0, v1, "is4399B0 = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100667B94()
{
  sub_100295790((void *)&_mh_execute_header, v0, v1, "is4399C2 = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100667C00()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "blob mask configuration unsupported for this HW for PCF UUID (blobLen=%d)",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100667C64()
{
}

void sub_100667CC4()
{
}

void sub_100667D30()
{
}

void sub_100667D90(uint64_t a1, os_log_s *a2)
{
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
  }
  *(_DWORD *)uint64_t buf = 136315138;
  uint8_t v6 = p_p;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Scan Core Classic Connection Event: No device found for bt address: %s",  buf,  0xCu);
}

void sub_100667E40(_DWORD *a1, os_log_s *a2)
{
  int v2 = *(unsigned __int8 *)a1;
  int v3 = a1[1];
  int v4 = a1[2];
  int v5 = a1[3];
  int v6 = a1[4];
  int v7 = a1[5];
  int v8 = a1[6];
  int v9 = a1[7];
  int v10 = a1[8];
  int v12 = a1[9];
  int v11 = a1[10];
  v13[0] = 67111680;
  v13[1] = v2;
  __int16 v14 = 1024;
  int v15 = v3;
  __int16 v16 = 1024;
  int v17 = v4;
  __int16 v18 = 1024;
  int v19 = v5;
  __int16 v20 = 1024;
  int v21 = v6;
  __int16 v22 = 1024;
  int v23 = v7;
  __int16 v24 = 1024;
  int v25 = v8;
  __int16 v26 = 1024;
  int v27 = v9;
  __int16 v28 = 1024;
  int v29 = v10;
  __int16 v30 = 1024;
  int v31 = v12;
  __int16 v32 = 1024;
  int v33 = v11;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "vseScanCoreBTLEStatsExtendedEvent: numAuxTries %u totalBTSCInquiryScanTime %u IDPackets %u totalTimeConnectionScan M CeLNAOn %u MCeLNABypass %u SCeLNAOn %u SCeLNABypass %u numConnectionCompleteAdvs MCeLNAOn %u MCeLNABypass %u SCeLNAO n %u SCeLNABypass %u",  (uint8_t *)v13,  0x44u);
}

void sub_100667F20( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100667F90( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100667FC0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100667FF0()
{
}

void sub_100668050(os_log_s *a1)
{
  int v2 = 136446466;
  uint64_t v3 = sub_1001EDDCC();
  __int16 v4 = 1024;
  int v5 = 0xFFFF;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "%{public}s (status=%{bluetooth:OI_STATUS}u)",  (uint8_t *)&v2,  0x12u);
}

void sub_1006680E8()
{
}

void sub_10066814C()
{
}

void sub_1006681B0()
{
}

void sub_10066821C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066824C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006682B8(int a1, os_log_s *a2)
{
  v2[0] = 67109376;
  v2[1] = 0;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Read controller RAM error with invalid length, status = %{bluetooth:OI_STATUS}u, size_t length = %d",  (uint8_t *)v2,  0xEu);
  sub_10003BE20();
}

void sub_100668334(unsigned __int8 a1, uint64_t a2, os_log_s *a3)
{
  LODWORD(sub_10026076C( (void *)&_mh_execute_header,  v0,  v1,  "XPC Received wrong len for deviceinfo blob.  Received length %lu, Expected lengths: %lu",  v2, v3) = 67109376;
  HIDWORD(sub_10026076C( (void *)&_mh_execute_header,  v0,  v1,  "XPC Received wrong len for deviceinfo blob.  Received length %lu, Expected lengths: %lu",  v2, v3) = a2;
  LOWORD(sub_100255AA0((void *)&_mh_execute_header, v2, v3, "Skywalk pipes are only supported for CL", v4) = 1024;
  *(_DWORD *)((char *)&v4 + 2) = a1;
  sub_100241CF0( (void *)&_mh_execute_header,  a2,  a3,  "Read controller RAM error, status = %{bluetooth:OI_STATUS}u, size_t length = %d",  v3,  v4);
  sub_10003BE20();
}

void sub_1006683A8()
{
}

void sub_100668408()
{
}

void sub_10066846C()
{
}

void sub_1006684CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066853C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006685AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066861C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066868C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006686FC(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "fPowerAssertion == NULL";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Assertion failed: %{public}s",  (uint8_t *)&v1,  0xCu);
  sub_10003BE20();
}

void sub_100668778(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 136446466;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "BlueTool failed to run %{public}s script with result %ld",  (uint8_t *)&v4,  0x16u);
  sub_10003BE20();
}

void sub_1006687FC()
{
}

void sub_100668828( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100668890(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Crashloop detection initial timestamp: %llu",  (uint8_t *)&v2,  0xCu);
  sub_10003BE20();
}

void sub_100668900(uint64_t a1, int a2, os_log_s *a3)
{
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 2048;
  uint64_t v5 = a1 - qword_1008EFC40;
  sub_1002BDC00((void *)&_mh_execute_header, a3, (uint64_t)a3, "Crashloop detected %u errors in %llu", (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100668984(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Crashloop detection reset, threshold timeout reached. Error count: %u",  (uint8_t *)v1,  8u);
  sub_100029870();
}

void sub_1006689F8(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109376;
  v3[1] = dword_1008EFC38;
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  sub_1002BDC00((void *)&_mh_execute_header, a2, a3, "Crashloop detection (%u) timestamp: %llu", (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100668A74( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100668ADC()
{
}

void sub_100668B14()
{
}

void sub_100668B40()
{
}

void sub_100668B6C()
{
}

void sub_100668B98()
{
}

void sub_100668BC4(int *a1, uint64_t a2, os_log_s *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_100029878((void *)&_mh_execute_header, a3, (uint64_t)a3, "openpty failed with errno %d", (uint8_t *)a2);
}

void sub_100668C04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100668C34( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100668C64(int *a1, uint64_t a2, os_log_s *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_100029878((void *)&_mh_execute_header, a3, (uint64_t)a3, "Error reading - errno is %d", (uint8_t *)a2);
}

void sub_100668CA4(os_log_s *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_100029878((void *)&_mh_execute_header, a1, v3, "Failed writing to com port - errno is %d", (uint8_t *)v4);
}

void sub_100668D28()
{
}

void sub_100668D54()
{
}

void sub_100668D80(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Invalid sampling rate %f for acoustic tuning",  (uint8_t *)&v2,  0xCu);
}

void sub_100668DF8()
{
}

void sub_100668E24()
{
}

void sub_100668E50(int a1, os_log_s *a2)
{
  v2[0] = 67109632;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 0;
  __int16 v5 = 1024;
  int v6 = 3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "SPMI Debug Control %d outside (%d,%d)",  (uint8_t *)v2,  0x14u);
}

void sub_100668EDC()
{
}

void sub_100668F08()
{
}

void sub_100668F34()
{
}

void sub_100668F60()
{
}

void sub_100668F8C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Issuing PCIe core dump request failed with 0x%08X",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_100668FFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100669070( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006690E4()
{
}

void sub_100669150(uint64_t a1, os_log_s *a2)
{
  int v3 = 136446210;
  uint64_t v4 = sub_1002D20D4(a1);
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Command is already outstanding %{public}s",  (uint8_t *)&v3,  0xCu);
  sub_10002B724();
}

void sub_1006691CC(uint64_t a1, os_log_s *a2)
{
  int v3 = 136446210;
  uint64_t v4 = sub_1002D20D4(a1);
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Stack is not ready, cannot send %{public}s",  (uint8_t *)&v3,  0xCu);
  sub_10002B724();
}

void sub_100669248()
{
}

void sub_1006692B4()
{
}

void sub_100669314(uint64_t a1, int a2, os_log_s *a3)
{
  int v5 = 136446466;
  uint8_t v6 = sub_1002D20D4(a1);
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%{public}s failed with result %{bluetooth:OI_STATUS}u",  (uint8_t *)&v5,  0x12u);
  sub_10002B724();
}

void sub_1006693A0()
{
}

void sub_100669400()
{
}

void sub_100669460()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "Unknown chipset range 0x%x, returning reserved voice buffer as false",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_1006694C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100669530(uint64_t a1, uint64_t a2)
{
}

void sub_100669568( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006695D8(sqlite3 **a1, os_log_s *a2)
{
  uint64_t v3 = sqlite3_errmsg(*a1);
  int v5 = 136315138;
  uint8_t v6 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v4,  "Failed to retrieve device info as there was an error executing lookup: %s",  (uint8_t *)&v5);
  sub_10002B724();
}

void sub_100669654(uint64_t a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_100241C9C(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_100241C70();
}

void sub_1006696D4(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_10066975C(sqlite3 **a1, os_log_s *a2)
{
  uint64_t v3 = sqlite3_errmsg(*a1);
  int v5 = 136315138;
  int v6 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v4,  "Failed to retrieve device info as there was an error executing lookup: %s",  (uint8_t *)&v5);
  sub_10002B724();
}

void sub_1006697DC(uint64_t a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_100241C9C(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_100241C70();
}

void sub_10066985C(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_1006698E4(sqlite3 **a1, os_log_s *a2)
{
  uint64_t v3 = sqlite3_errmsg(*a1);
  int v5 = 136315138;
  int v6 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v4,  "Failed to retrieve device info as there was an error executing lookup: %s",  (uint8_t *)&v5);
  sub_10002B724();
}

void sub_100669964(uint64_t a1, uint64_t a2)
{
}

void sub_10066999C(uint64_t a1, uint64_t a2)
{
}

void sub_1006699D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100669A44()
{
}

void sub_100669A7C(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100669B0C(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100669B94( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100669C04(char *a1, uint64_t a2, os_log_s *a3)
{
  if (a1[23] >= 0) {
    int v4 = a1;
  }
  else {
    int v4 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = v4;
  sub_1000BC000((void *)&_mh_execute_header, a3, (uint64_t)a3, "%{public}s has no tags", (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100669C6C()
{
  sub_100029860( (void *)&_mh_execute_header,  v0,  v1,  "Unable to allocate memory for SDP records returning",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100669C98()
{
}

void sub_100669CC4()
{
}

void sub_100669CF0()
{
}

void sub_100669D1C()
{
}

void sub_100669D48(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "rdar://problem/66432832 attempting to write descriptorSize: %zu",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100669DB0(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "rdar://problem/66432832 size mismatch, descriptorSize: %zu",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_100669E1C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "rdar://problem/66432832 read descriptorSize: %zu from disk",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100669E84()
{
}

void sub_100669EB0(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100669F34(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100669FB8(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_10066A03C()
{
}

void sub_10066A068()
{
}

void sub_10066A0C8()
{
}

void sub_10066A128(uint64_t a1, uint64_t a2)
{
}

void sub_10066A160()
{
}

void sub_10066A1C0(id *a1, os_log_s *a2)
{
}

void sub_10066A240()
{
  sub_1002929C8( (void *)&_mh_execute_header,  v0,  v1,  "Received MKB first unlock notification, but MKBDeviceUnlockedSinceBoot returns 0",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10066A26C(void *a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2114;
  *(void *)(a2 + 10) = a1;
  sub_100241D4C( (void *)&_mh_execute_header,  a4,  a3,  "Found %d stale paired device(s) with address %{public}@",  (uint8_t *)a2);

  sub_10007B3CC();
}

void sub_10066A2C4()
{
  uint64_t v1 = v0;
  *(_DWORD *)uint64_t v2 = 138543618;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2114;
  *(void *)(v2 + 14) = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Rebuilding missing paired device %{public}@ (%{public}@) from keychain data",  v4,  0x16u);

  sub_10007B3CC();
}

void sub_10066A320(void *a1, uint64_t a2)
{
  sub_10007B3CC();
}

void sub_10066A364(void **a1, os_log_s *a2)
{
  uint64_t v3 = *a1;
  int v6 = 138543362;
  int v7 = v3;
  id v4 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v5,  "Unable to locate device %{public}@ in disk caches",  (uint8_t *)&v6);

  sub_1002E56F8();
}

void sub_10066A3F0()
{
  int v1 = *v0;
  *(_DWORD *)uint64_t v2 = 136446722;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = v1;
  *(_WORD *)(v2 + 18) = 1024;
  *(_DWORD *)(v2 + 20) = 2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "'%{public}s' database version (v%d) is not valid (current version is v%d)",  v4,  0x18u);
}

void sub_10066A450()
{
}

void sub_10066A484()
{
}

void sub_10066A4B8()
{
}

void sub_10066A4E4()
{
}

void sub_10066A510()
{
}

void sub_10066A53C()
{
}

void sub_10066A568()
{
}

void sub_10066A594()
{
}

void sub_10066A600()
{
}

void sub_10066A664()
{
  int v2 = 136446722;
  sub_1002E56DC();
  sub_100206084((void *)&_mh_execute_header, v0, v1, "%{public}s - JSON ‘%@’not a dictionary: %@", v2);
  sub_1002E56F8();
}

void sub_10066A6D0()
{
  int v2 = 136446722;
  sub_1002E56DC();
  sub_100206084((void *)&_mh_execute_header, v0, v1, "%{public}s - JSON ‘%@’ conversion error: %@", v2);
  sub_1002E56F8();
}

void sub_10066A73C()
{
  int v2 = 136446722;
  sub_1002E56DC();
  sub_100206084((void *)&_mh_execute_header, v0, v1, "%{public}s - JSON ‘%@’not a dictionary: %@", v2);
  sub_1002E56F8();
}

void sub_10066A7A8()
{
  int v2 = 136446722;
  sub_1002E56DC();
  sub_100206084((void *)&_mh_execute_header, v0, v1, "%{public}s - JSON ‘%@’ conversion error: %@", v2);
  sub_1002E56F8();
}

void sub_10066A814()
{
  int v2 = 136446722;
  sub_1002E56DC();
  sub_100206084((void *)&_mh_execute_header, v0, v1, "%{public}s - JSON ‘%@’not a dictionary: %@", v2);
  sub_1002E56F8();
}

void sub_10066A880()
{
  int v2 = 136446722;
  sub_1002E56DC();
  sub_100206084((void *)&_mh_execute_header, v0, v1, "%{public}s - JSON ‘%@’ conversion error: %@", v2);
  sub_1002E56F8();
}

void sub_10066A8EC()
{
}

void sub_10066A918()
{
}

void sub_10066A97C(char a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = "device is null";
  uint64_t v4 = "";
  if ((a1 & 1) != 0) {
    uint64_t v3 = "";
  }
  if ((a2 & 1) == 0) {
    uint64_t v4 = "database is null";
  }
  LODWORD(sub_100241DA0( (void *)&_mh_execute_header,  "deviceSubscribedNotification Notifying listeners that %{public}s is interested in %{public}@",  v4, v5) = 136315394;
  *(void *)((char *)&v5 + 4) = v3;
  WORD6(sub_100241DA0( (void *)&_mh_execute_header,  "deviceSubscribedNotification Notifying listeners that %{public}s is interested in %{public}@",  v4, v5) = 2080;
  HIWORD(sub_100241DA0( (void *)&_mh_execute_header,  "deviceSubscribedNotification Notifying listeners that %{public}s is interested in %{public}@",  v4, v5) = (_WORD)v4;
  sub_10026076C( (void *)&_mh_execute_header,  a2,  a3,  "Could not store custom properties - %s %s",  (const char *)v5,  *((const char **)&v5 + 1));
  sub_10003BE20();
}

void sub_10066AA14()
{
}

void sub_10066AA74()
{
}

void sub_10066AAA0(int a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "-[LeDeviceCache readDeviceFromDatabase:statement:]";
  __int16 v5 = 1024;
  int v6 = a1;
  sub_100241D4C((void *)&_mh_execute_header, a2, a3, "%s step failed with result:%d", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10066AB1C()
{
  *(_DWORD *)uint64_t v0 = 136446466;
  *(void *)(v0 + 4) = v1;
  *(_WORD *)(v0 + 12) = 2082;
  *(void *)(v0 + 14) = v2;
  sub_1002E5700( (void *)&_mh_execute_header,  "Database returned invalid uuid for device address %{public}s (%{public}s)",  v3,  v4);
}

void sub_10066AB60(uint64_t a1, uint64_t a2)
{
  _os_log_fault_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "Database returned empty address for device %{public}s",  v3,  0xCu);
}

void sub_10066ABA0()
{
}

void sub_10066ABCC(uint64_t *a1, uint64_t a2)
{
  if (v13 < 0) {
    operator delete(__pa);
  }
  sub_100241C70();
}

void sub_10066AC58(uint64_t *a1, uint64_t a2)
{
  if (v13 < 0) {
    operator delete(__pa);
  }
  sub_100241C70();
}

void sub_10066ACE4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066AD58( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066ADCC(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)uint64_t buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Unknown platform 0x%08x detected", buf, 8u);
}

void sub_10066AE18(uint64_t a1, xpc_object_t xdict, os_log_s *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 136446466;
  uint64_t v6 = v4;
  __int16 v7 = 2082;
  string = xpc_dictionary_get_string(xdict, _xpc_error_key_description);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "XPC error for message %{public}s: %{public}s",  (uint8_t *)&v5,  0x16u);
}

void sub_10066AEC4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066AF28( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066AF8C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error, unable to sendMsg due to no available xpc client connections",  v1,  2u);
  sub_100029870();
}

void sub_10066AFC8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066AFF8(char *a1, void *a2, os_log_t log)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136446210;
  uint64_t v4 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Handle incoming xpc message for %{public}s",  (uint8_t *)&v3,  0xCu);
  sub_10003BE20();
}

void sub_10066B078( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B0A8()
{
}

void sub_10066B0D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B148()
{
}

void sub_10066B1A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B22C()
{
}

void sub_10066B28C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B2FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B36C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B3DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B44C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B4BC()
{
}

void sub_10066B524()
{
}

void sub_10066B588( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B5F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B668( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B6D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B748( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B7B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B828( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B898( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066B908()
{
}

void sub_10066B96C()
{
}

void sub_10066B998()
{
}

void sub_10066BA00()
{
}

void sub_10066BA60()
{
  sub_10008651C((void *)&_mh_execute_header, v0, v1, "Invalid eventType = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10066BAC4()
{
}

void sub_10066BB28()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "writeBTPowerStateMonitorNumOfDays failed : Invalid numOfDays = %d",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10066BB8C()
{
  sub_100029860((void *)&_mh_execute_header, v0, v1, "ConvertToBiomeSessionState returning default", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10066BBB8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = "is nil,";
  if (a1) {
    uint64_t v3 = "is initialized,";
  }
  int v4 = 136315394;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Invalid parameters passed to readStoredMetricValue. metricValues:%s metricsToRead:%@",  (uint8_t *)&v4,  0x16u);
  sub_10003BE20();
}

void sub_10066BC50(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "GAPAPairingMetricUniqueIdSalt writePrefKey failed: %@",  (uint8_t *)a2);
}

void sub_10066BC9C(char *a1, uint64_t a2, os_log_s *a3)
{
  if (a1[23] >= 0) {
    int v4 = a1;
  }
  else {
    int v4 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "getGAPATimingPoint addr=%s does not exist",  (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10066BD04()
{
}

void sub_10066BD68(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *uint64_t buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error in Metrics: fLEDailyStats[key][0] is nil.",  buf,  2u);
}

void sub_10066BDA4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066BE28( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066BE98()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "calculateAndSendHIDLatencyStatsData -- unknown HIDType (%d) for handle 0x%04x",  v2,  0xEu);
  sub_10003BE20();
}

void sub_10066BF1C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066BF8C()
{
}

void sub_10066BFFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C06C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C0DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C14C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C1BC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C22C()
{
}

void sub_10066C29C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C30C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C37C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C3EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C45C()
{
}

void sub_10066C4CC(uint64_t a1, uint8_t *buf, os_log_t log)
{
  uint64_t v4 = *(unsigned __int8 *)(a1 + 23);
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  *(_DWORD *)uint64_t buf = 134217984;
  *(void *)(buf + 4) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpected pincode length of %lu", buf, 0xCu);
  sub_10007B3CC();
}

void sub_10066C538()
{
}

void sub_10066C59C()
{
}

void sub_10066C5E0()
{
}

void sub_10066C624(uint64_t a1, os_log_s *a2)
{
}

void sub_10066C698(uint64_t *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  else {
    uint64_t v5 = (uint64_t *)*a1;
  }
  *(_DWORD *)uint64_t buf = 136446466;
  *(void *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to parse malformed magic key for device %{public}s - data was %s",  buf,  0x16u);
  sub_10007B3CC();
}

void sub_10066C710()
{
  sub_1002433E0((void *)&_mh_execute_header, v0, v1, "Failed to set cloud master keys! res = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10066C770()
{
  sub_1002433E0((void *)&_mh_execute_header, v0, v1, "Failed to set cloud address keys! res = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10066C7D0()
{
  sub_1002433E0((void *)&_mh_execute_header, v0, v1, "Failed to set cloud IRK keys! res = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10066C838( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C868( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C898( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066C8C8()
{
}

void sub_10066C8F4(unsigned __int8 a1, unsigned __int8 a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "### readAopCaches: handleIndex %d hi %d",  (uint8_t *)v3,  0xEu);
  sub_10003BE20();
}

void sub_10066C97C()
{
}

void sub_10066C9DC()
{
}

void sub_10066CA08()
{
  sub_100029860( (void *)&_mh_execute_header,  v0,  v1,  "_retrieveSectionsConfiguration returned an empty table",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10066CA34()
{
}

void sub_10066CA94( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066CB04(unsigned __int8 *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Send report to AOP (type %d) failed. Error: %@",  (uint8_t *)v4,  0x12u);
  sub_10003BE20();
}

void sub_10066CB88()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "MBFXPC LOG: BTLocalDeviceMsgHandler::BTLocalDeviceStatusEventCallbackHandler() %p, fCallbacksRegistered:%d",  v2,  0x12u);
  sub_10003BE20();
}

void sub_10066CC04()
{
}

void sub_10066CC64()
{
}

void sub_10066CCC4()
{
}

void sub_10066CCF0()
{
}

void sub_10066CD50()
{
}

void sub_10066CDB0(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "BTLocalDeviceMsgHandler::handleBTLocalDeviceGetModulePowerMsg bluetooth power state: %x",  (uint8_t *)v3,  8u);
  sub_100029870();
}

void sub_10066CE24()
{
}

void sub_10066CE84()
{
}

void sub_10066CEE4()
{
}

void sub_10066CF44()
{
}

void sub_10066CFA4()
{
}

void sub_10066D004()
{
}

void sub_10066D064()
{
}

void sub_10066D0C4()
{
}

void sub_10066D124()
{
}

void sub_10066D184()
{
}

void sub_10066D1E4()
{
}

void sub_10066D244()
{
}

void sub_10066D2A4()
{
}

void sub_10066D304()
{
}

void sub_10066D364()
{
}

void sub_10066D3C4()
{
}

void sub_10066D424()
{
}

void sub_10066D484()
{
}

void sub_10066D4E4()
{
}

void sub_10066D544()
{
}

void sub_10066D5A4()
{
}

void sub_10066D604()
{
}

void sub_10066D664()
{
}

void sub_10066D6C4()
{
}

void sub_10066D724()
{
}

void sub_10066D784()
{
}

void sub_10066D7E4()
{
}

void sub_10066D844()
{
}

void sub_10066D8A4()
{
}

void sub_10066D904()
{
}

void sub_10066D964()
{
}

void sub_10066D9C4()
{
}

void sub_10066DA24()
{
}

void sub_10066DA84()
{
}

void sub_10066DAE4()
{
}

void sub_10066DB44()
{
}

void sub_10066DB7C()
{
}

void sub_10066DBDC()
{
}

void sub_10066DC14()
{
}

void sub_10066DC74()
{
}

void sub_10066DCD4()
{
}

void sub_10066DD34()
{
}

void sub_10066DD94()
{
}

void sub_10066DDF4()
{
}

void sub_10066DE54()
{
}

void sub_10066DEB4()
{
}

void sub_10066DF14()
{
}

void sub_10066DF74()
{
}

void sub_10066DFD4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unknown device class %d.  Using default service set",  (uint8_t *)v2,  8u);
}

void sub_10066E048(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Failed to find the system container: %llu",  (uint8_t *)&v3,  0xCu);
  sub_10003BE20();
}

void sub_10066E0BC()
{
}

void sub_10066E0E8()
{
}

void sub_10066E114()
{
}

void sub_10066E140(int a1, os_log_s *a2, uint64_t a3, double a4)
{
  int v4 = 134218240;
  uint64_t v5 = (uint64_t)a4;
  __int16 v6 = 1024;
  int v7 = a1;
  sub_100241D4C( (void *)&_mh_execute_header,  a2,  a3,  "Detected that BT did not sleep during AP sleep of %lld seconds, but not restarting due to %d connections",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_10066E1B8()
{
}

void sub_10066E1E4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066E248()
{
}

void sub_10066E274()
{
}

void sub_10066E2A0()
{
}

void sub_10066E2CC()
{
}

void sub_10066E2F8()
{
}

void sub_10066E324()
{
}

void sub_10066E350()
{
}

void sub_10066E37C()
{
}

void sub_10066E3A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066E410( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066E478(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Something went wrong fetching values from HWIdentifiers, we can't extract file names with extension: %s",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10066E4F0(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  sub_1000BC000((void *)&_mh_execute_header, a3, (uint64_t)a3, "No %s file found from HWIdentifiers", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10066E568()
{
}

void sub_10066E594()
{
}

void sub_10066E5C0()
{
}

void sub_10066E5EC()
{
}

void sub_10066E618()
{
}

void sub_10066E678(uint64_t a1, void *a2, uint64_t a3)
{
  sub_10007B3CC();
}

void sub_10066E6C0(void *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)(v4 + 22) = 1024;
  *(_DWORD *)(v4 + sub_100207EF8(v1 + 24) = 255;
  _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "File: %@ found by regex: %@ is over the %d char file name limit",  v5,  0x1Cu);

  sub_10007B3CC();
}

void sub_10066E720()
{
}

void sub_10066E780(void *a1, void *a2, uint64_t a3)
{
  sub_10020603C( (void *)&_mh_execute_header,  v7,  v5,  "Error occured when picking out highest version filename, returning end of the filenameArray: %@  Error: %@",  v6);

  sub_10007B3CC();
}

void sub_10066E7D0()
{
  __int16 v3 = 1024;
  int v4 = v0;
  sub_100241D4C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Filesize for %s of size: %d does not look right", v2);
  sub_10003BE20();
}

void sub_10066E850()
{
}

void sub_10066E8B8()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_10020603C((void *)&_mh_execute_header, v1, (uint64_t)v1, "File: %s reading error: only %lu could be read", v2);
  sub_10003BE20();
}

void sub_10066E938()
{
}

void sub_10066E9A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10066EA10(char *a1, void *a2, os_log_t log)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315650;
  uint64_t v4 = a2;
  __int16 v5 = 2080;
  uint8_t v6 = " fileSize";
  __int16 v7 = 2080;
  uint64_t v8 = "copyFileWithExtensionToBuffer";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Invalid %s pointer for extension %s in %s",  (uint8_t *)&v3,  0x20u);
}

void sub_10066EAB8()
{
}

void sub_10066EAE4()
{
}

void sub_10066EB10()
{
}

void sub_10066EB48()
{
}

void sub_10066EBA8()
{
}

void sub_10066EC08()
{
}

void sub_10066EC34()
{
}

void sub_10066EC94()
{
}

void sub_10066ECF4()
{
}

void sub_10066ED54()
{
}

void sub_10066EDB4()
{
}

void sub_10066EE14()
{
}

void sub_10066EE74()
{
}

void sub_10066EED4()
{
}

void sub_10066EF34()
{
}

void sub_10066EF94()
{
}

void sub_10066EFF4()
{
}

void sub_10066F054()
{
}

void sub_10066F0B4()
{
}

void sub_10066F114()
{
}

void sub_10066F174()
{
}

void sub_10066F1D4()
{
}

void sub_10066F234()
{
}

void sub_10066F294()
{
}

void sub_10066F2F4()
{
}

void sub_10066F354()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "BTDeviceMsgHandler::handleBTDeviceServiceAddCallbacksMsg session:%llx cbid:%llx",  v2,  0x16u);
  sub_10003BE20();
}

void sub_10066F3D0()
{
}

void sub_10066F408()
{
}

void sub_10066F468()
{
}

void sub_10066F4C8()
{
}

void sub_10066F528()
{
}

void sub_10066F588()
{
}

void sub_10066F5E8()
{
}

void sub_10066F648()
{
}

void sub_10066F6A8()
{
}

void sub_10066F708()
{
}

void sub_10066F768()
{
}

void sub_10066F7C8()
{
}

void sub_10066F828()
{
}

void sub_10066F888()
{
}

void sub_10066F8E8()
{
}

void sub_10066F948()
{
}

void sub_10066F9A8()
{
}

void sub_10066FA08()
{
}

void sub_10066FA68()
{
}

void sub_10066FAC8()
{
}

void sub_10066FB28()
{
}

void sub_10066FB88()
{
}

void sub_10066FBE8()
{
}

void sub_10066FC48()
{
}

void sub_10066FCA8()
{
}

void sub_10066FD08()
{
}

void sub_10066FD68()
{
}

void sub_10066FDC8()
{
}

void sub_10066FE28()
{
}

void sub_10066FE88()
{
}

void sub_10066FEE8()
{
}

void sub_10066FF48(int *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  uint64_t v4 = "non-genuine";
  int v5 = 134218498;
  uint64_t v6 = a2;
  if (v3 == -1) {
    uint64_t v4 = "genuine";
  }
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 2080;
  int v10 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "BTDeviceMsgHandler::handleBTDeviceIsGenuineAirPodsMsg device:%llx genuine:%u (%s)",  (uint8_t *)&v5,  0x1Cu);
}

void sub_10066FFF4()
{
}

void sub_100670054()
{
}

void sub_1006700B8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067011C()
{
}

void sub_100670148()
{
}

void sub_100670174()
{
  id v1 = sub_100360EAC(v0);
  sub_1000A857C();
  sub_100084894( (void *)&_mh_execute_header,  v2,  v3,  "initializeAccessoryLoggingSession: Buddy command to %{public}@ for checking crash log failed; error = %d",
    v4,
    v5,
    v6,
    v7,
    v8);

  sub_100360E9C();
}

void sub_1006701EC(int *a1, uint64_t a2, os_log_s *a3)
{
  int v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  sub_100029878( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Accessory power log file open failure -> %d",  (uint8_t *)a2);
}

void sub_10067022C()
{
  id v1 = sub_100360EAC(v0);
  sub_1000A857C();
  sub_100084894( (void *)&_mh_execute_header,  v2,  v3,  "Buddy command to %{public}@ failed; error = %d",
    v4,
    v5,
    v6,
    v7,
    v8);

  sub_100360E9C();
}

void sub_1006702A4()
{
  id v1 = sub_100360EAC(v0);
  sub_1000A857C();
  sub_100084894( (void *)&_mh_execute_header,  v2,  v3,  "Send TimeStamp Request Periodically to %{public}@ failed; error = %d",
    v4,
    v5,
    v6,
    v7,
    v8);

  sub_100360E9C();
}

void sub_10067031C()
{
  id v1 = sub_100360EAC(v0);
  sub_1000A857C();
  sub_100084894( (void *)&_mh_execute_header,  v2,  v3,  "Send Diagnostics Request Periodically to %{public}@ failed; error = %d",
    v4,
    v5,
    v6,
    v7,
    v8);

  sub_100360E9C();
}

void sub_100670394(uint64_t a1)
{
  id v1 = sub_100360EAC(a1);
  sub_100360EF4();
  sub_100084894( (void *)&_mh_execute_header,  v2,  v3,  "initializeAccessoryLoggingSession: Session for %{public}@ already exists in unexpected state %d",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_100670414()
{
}

void sub_100670440( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006704A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100670520()
{
}

void sub_10067054C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000((void *)&_mh_execute_header, a3, (uint64_t)a3, "sendLogCommand: No device found for %s", (uint8_t *)a2);
}

void sub_100670588()
{
}

void sub_1006705B4()
{
}

void sub_1006705E0()
{
}

void sub_10067060C()
{
}

void sub_100670638(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000((void *)&_mh_execute_header, a3, (uint64_t)a3, "collectDebugData: No device found for %s", (uint8_t *)a2);
}

void sub_100670674(uint64_t a1, os_log_s *a2)
{
  id v3 = *(id *)(*(void *)(a1 + 40) + 8LL);
  sub_10008C484();
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v4,  "startInactivityTimer: Timeout period for %{public}@ ended, returning no files",  v5);

  sub_10002B724();
}

void sub_1006706FC()
{
}

void sub_100670728()
{
}

void sub_100670754()
{
}

void sub_1006707B4()
{
}

void sub_100670814()
{
}

void sub_100670840()
{
}

void sub_10067086C()
{
}

void sub_100670898()
{
}

void sub_1006708C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  if (v1 != v2)
  {
    int v3 = 0;
    do
    {
      unsigned int v4 = *(unsigned __int8 *)(*(void *)v1 + 40LL);
      BOOL v5 = v4 > 8;
      int v6 = (1 << v4) & 0x182;
      if (!v5 && v6 != 0) {
        ++v3;
      }
      v1 += 8LL;
    }

    while (v1 != v2);
  }

  sub_100255AB0();
  sub_10008651C( (void *)&_mh_execute_header,  v8,  v9,  "syncLogOnDemandEvent: Accessory retrieval timed out with %d remaining session(s); sending files now",
    v10,
    v11,
    v12,
    v13,
    v14);
  sub_100029870();
}

void sub_100670970()
{
}

void sub_10067099C()
{
}

void sub_1006709C8(uint64_t a1, uint64_t a2)
{
}

void sub_100670A00()
{
  id v1 = sub_100360EAC(v0);
  sub_1000A857C();
  sub_100084894( (void *)&_mh_execute_header,  v2,  v3,  "recvLoggingHandler: %{public}@ sent invalid logging xpc_type_t type = %d",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_100670A78(uint64_t a1, os_log_s *a2)
{
  id v3 = sub_100360EAC(a1);
  sub_10008C484();
  sub_1000BC000((void *)&_mh_execute_header, a2, v4, "recvLoggingHandler: Ignoring log data from %{public}@", v5);

  sub_10002B724();
}

void sub_100670AF4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100670B5C(uint64_t a1)
{
  id v1 = sub_100360EAC(a1);
  sub_100360EF4();
  sub_100084894( (void *)&_mh_execute_header,  v2,  v3,  "recvW1SCPLogHandler: %{public}@ productId = %d unsupported for SCP logging",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_100670BD8(os_log_s *a1)
{
}

void sub_100670C50(os_log_s *a1)
{
}

void sub_100670CC8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100670D38(os_log_s *a1)
{
}

void sub_100670DB8()
{
}

void sub_100670E18()
{
}

void sub_100670E78(os_log_s *a1)
{
}

void sub_100670EF0()
{
}

void sub_100670F50()
{
  id v1 = sub_100360EAC(v0);
  sub_1000A857C();
  sub_100084894( (void *)&_mh_execute_header,  v2,  v3,  "recvW1CrashTraceHandler: Failed to send buddy command to to %{public}@, error = %d",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_100670FC8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100671030(uint64_t a1)
{
  id v1 = sub_100360EAC(a1);
  sub_100110E98();
  sub_100084894( (void *)&_mh_execute_header,  v2,  v3,  "recvLogHandler: Log data for %{public}@ shorter than %d byte header",  v4,  v5,  v6,  v7,  v8);

  sub_10002B724();
}

void sub_1006710AC()
{
  sub_100084894( (void *)&_mh_execute_header,  v0,  v1,  "recvLogHandler: Could not open file %@ (error = %d)",  v2,  v3,  v4,  v5,  2u);
  sub_10002B724();
}

void sub_100671134()
{
  id v1 = sub_100360EAC(v0);
  sub_1000A857C();
  sub_100084894( (void *)&_mh_execute_header,  v2,  v3,  "recvLogHandler: No open log file for %{public}@ (packetSeqNum = %d)",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_1006711AC()
{
}

void sub_100671210()
{
}

void sub_10067123C()
{
}

void sub_100671268()
{
}

void sub_100671294( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006712FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100671384()
{
}

void sub_1006713B0(os_log_s *a1)
{
}

void sub_100671428( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100671490(uint64_t a1, uint64_t a2)
{
}

void sub_1006714C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100671530( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100671598( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100671600()
{
}

void sub_10067162C()
{
}

void sub_10067168C()
{
}

void sub_1006716EC()
{
}

void sub_10067174C()
{
}

void sub_1006717AC(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  sub_10020603C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "closeCurrentLogFile: Could not rename file %@ (error = %@)",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_100671828()
{
}

void sub_10067188C(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109376;
  v3[1] = 0;
  __int16 v4 = 1024;
  int v5 = a1;
  sub_100241D04( (void *)&_mh_execute_header,  a2,  a3,  "parseCrashLogMetadata: Invalid crash log length %d for log number %d",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100671900()
{
  int v3 = v0;
  sub_100241D04( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "parseCrashLogMetadata: Unprintable character %d in core name for log number %d",  v2);
  sub_10003BE20();
}

void sub_100671970()
{
  int v3 = v0;
  sub_100241D04( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "parseCrashLogMetadata: Length %d doesn't match num crash logs %d",  v2);
  sub_10003BE20();
}

void sub_1006719E4()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_10020603C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "processCrashInstanceForAnalytics: Could not produce output JSON for %@, error %@",  v2);
  sub_10003BE20();
}

void sub_100671A58()
{
  int v3 = v0;
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "processCrashInstanceForAnalytics: Leftover metadata for %@ after %d chunks",  v2);
  sub_10003BE20();
}

void sub_100671AC4(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *uint64_t buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "processCrashInstanceForAnalytics: Could not create chunk",  buf,  2u);
}

void sub_100671B00(int a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 138412546;
  uint64_t v4 = a2;
  __int16 v5 = 1024;
  int v6 = a1;
  sub_100241D4C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "processCrashInstanceForAnalytics: Ran out of metadata for %@ on chunk %d",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100671B78()
{
}

void sub_100671BDC()
{
}

void sub_100671C40()
{
}

void sub_100671C6C()
{
}

void sub_100671C98()
{
}

void sub_100671CF8()
{
}

void sub_100671D24()
{
}

void sub_100671D50()
{
}

void sub_100671DB0()
{
}

void sub_100671DDC()
{
}

void sub_100671E3C()
{
}

void sub_100671E9C()
{
}

void sub_100671EC8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100671EFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100671F30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100671FA4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100672018()
{
}

void sub_100672078()
{
}

void sub_1006720A4()
{
}

void sub_1006720D0()
{
}

void sub_1006720FC()
{
}

void sub_100672174(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Classic devices doesn't exist for %{public}@",  (uint8_t *)a2);
}

void sub_1006721C0()
{
}

void sub_100672220(const unsigned __int8 *a1, os_log_s *a2)
{
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  int v7 = 136446210;
  uint64_t v8 = v4;
  sub_1000BC000((void *)&_mh_execute_header, a2, v3, "Already connected to device %{public}s", (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1006722CC()
{
}

void sub_1006722F8(os_log_s *a1)
{
  int v3 = 136446210;
  uint64_t v4 = sub_1001EDDCC();
  sub_1000BC000((void *)&_mh_execute_header, a1, v2, "%{public}s", (uint8_t *)&v3);
  sub_10002B724();
}

void sub_100672370()
{
}

void sub_1006723D8()
{
}

void sub_100672438(_DWORD *a1, os_log_s *a2)
{
  int v4 = 134217984;
  uint64_t v5 = sub_10012D98C(a1);
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v3,  "Connection manager wasn't tracking a device for connection handle %p!",  (uint8_t *)&v4);
  sub_10002B724();
}

void sub_1006724B4()
{
}

void sub_100672514()
{
}

void sub_100672574()
{
}

void sub_1006725D4()
{
}

void sub_100672634()
{
}

void sub_100672694()
{
}

void sub_1006726F4()
{
}

void sub_100672754(uint64_t a1, os_log_s *a2)
{
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  int v7 = 136446210;
  uint64_t v8 = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v3,  "Audio sink service not supported by device %{public}s",  (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_100672800()
{
}

void sub_10067282C()
{
}

void sub_100672874()
{
}

void sub_1006728BC()
{
}

void sub_10067291C()
{
}

void sub_100672948()
{
}

void sub_1006729A8()
{
}

void sub_1006729D4()
{
}

void sub_100672A44()
{
}

void sub_100672A70()
{
}

void sub_100672A9C()
{
}

void sub_100672AC8(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Invalid sampling rate %f for acoustic tuning", (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_100672B34()
{
  uint64_t v3 = 2000LL;
  sub_100241D4C( (void *)&_mh_execute_header,  v0,  v1,  "Failed to suspend A2DP stream with result %{bluetooth:OI_STATUS}u - trying again in %llu seconds",  v2);
  sub_10003BE20();
}

void sub_100672BA0()
{
}

void sub_100672C00()
{
}

void sub_100672C60()
{
  sub_10008651C((void *)&_mh_execute_header, v0, v1, "OI_HCI_ReadClock failed: returned %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100672CC0()
{
}

void sub_100672CEC()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Failed to find compatible stream configuration for device %{public}s - disconnecting",  v8);
  sub_10007B3CC();
}

void sub_100672D38()
{
}

void sub_100672D98(_BYTE *a1, os_log_s *a2)
{
  if (*a1) {
    uint64_t v2 = "On";
  }
  else {
    uint64_t v2 = "Off";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Publish AccessHeadTrack to BTHAL: %s",  (uint8_t *)&v3,  0xCu);
  sub_10003BE20();
}

void sub_100672E24()
{
}

void sub_100672E84()
{
}

void sub_100672EE4()
{
  uint64_t v3 = v0;
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "A2DP packet flushed: Audio Queue full, remove oldest and insert sequence=%d (latest), timestamp=%llu",  v2);
  sub_10003BE20();
}

void sub_100672F50()
{
}

void sub_100672FB0()
{
}

void sub_100673010()
{
}

void sub_100673058()
{
}

void sub_1006730A0()
{
}

void sub_100673100( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100673170( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006731E0()
{
}

void sub_100673228()
{
}

void sub_100673288()
{
}

void sub_1006732C0()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Couldn't find any valid stream endpoint IDs for device %{public}s - disconnecting",  v8);
  sub_10007B3CC();
}

void sub_10067330C()
{
}

void sub_10067336C()
{
}

void sub_1006733CC(uint64_t a1, int a2)
{
  *(void *)(sub_1003802A0(a1, a2, 1.5047e-36) + 10) = "null";
  sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received endpoint discovery failure with result %d on device %{public}s",  v3);
}

void sub_100673410()
{
}

void sub_100673458()
{
}

void sub_1006734B8()
{
}

void sub_100673518()
{
}

void sub_100673578()
{
}

void sub_1006735A4()
{
}

void sub_100673604(uint64_t a1, int a2)
{
  *(void *)(sub_1003802A0(a1, a2, 1.5047e-36) + 10) = "null";
  sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received set stream configuration failure with result %u on device %{public}s",  v3);
}

void sub_100673648()
{
}

void sub_100673690(uint64_t a1, int a2)
{
  *(void *)(sub_1003802A0(a1, a2, 1.5047e-36) + 10) = "null";
  sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received get configuration failure with result %u on device %{public}s",  v3);
}

void sub_1006736D4()
{
}

void sub_10067371C()
{
}

void sub_10067377C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "A disconnection is pending for device %{public}s -- disconnecting",  v8);
  sub_10007B3CC();
}

void sub_1006737C8()
{
}

void sub_100673810(uint64_t a1, int a2)
{
  *(void *)(sub_1003802A0(a1, a2, 1.5047e-36) + 10) = "null";
  sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Failed to open streaming channel failure with result %u on device %{public}s",  v3);
}

void sub_100673854()
{
}

void sub_100673880()
{
}

void sub_1006738AC()
{
}

void sub_10067390C()
{
}

void sub_10067396C()
{
}

void sub_1006739CC()
{
  sub_10008651C((void *)&_mh_execute_header, v0, v1, "OI_HCI_ReadClock failed: returned %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100673A2C()
{
}

void sub_100673A58()
{
}

void sub_100673AA0()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "Start failed, no handles, error=%{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100673B04()
{
}

void sub_100673B4C()
{
}

void sub_100673B78()
{
}

void sub_100673BD8()
{
}

void sub_100673C04()
{
}

void sub_100673C64()
{
}

void sub_100673C90()
{
}

void sub_100673CF0()
{
}

void sub_100673D50()
{
}

void sub_100673DB0()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "A2DP packet flushed: L2CAP (chip) flush occured. Current sequence=%d, timestamp=%llu",  v2);
  sub_10003BE20();
}

void sub_100673E28()
{
  sub_100029860( (void *)&_mh_execute_header,  v0,  v1,  "listenModeSupport is null, returning with error BT_ERROR_INVALID_ARGUMENT",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100673E54(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109376;
  v3[1] = 500;
  __int16 v4 = 1024;
  int v5 = a1;
  sub_100241D04( (void *)&_mh_execute_header,  a2,  a3,  "Failed to configure jitter buffer to 0x%x with error %{bluetooth:OI_STATUS}u",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100673ECC()
{
}

void sub_100673F2C()
{
}

void sub_100673F8C()
{
}

void sub_100673FEC()
{
}

void sub_10067404C()
{
}

void sub_1006740AC()
{
}

void sub_100674110()
{
}

void sub_10067413C()
{
}

void sub_10067419C()
{
}

void sub_1006741C8()
{
}

void sub_100674228()
{
}

void sub_100674254()
{
}

void sub_1006742B4()
{
}

void sub_1006742E0()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Detected error from the plugin, disconnecting audio device %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10067432C()
{
}

void sub_10067438C()
{
  __int16 v3 = 1024;
  int v4 = v0;
  sub_100241D04( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Failed to configure jitter buffer to 0x%x with error %{bluetooth:OI_STATUS}u",  v2);
  sub_10003BE20();
}

void sub_100674404()
{
}

void sub_100674464()
{
}

void sub_100674490()
{
}

void sub_1006744BC()
{
}

void sub_1006744E8()
{
}

void sub_100674514()
{
}

void sub_100674540()
{
}

void sub_10067456C(_BYTE *a1, _BYTE *a2)
{
}

void sub_100674598()
{
}

void sub_1006745C4()
{
}

void sub_1006745F0()
{
}

void sub_100674650(_BYTE *a1, _BYTE *a2)
{
}

void sub_10067467C()
{
}

void sub_1006746E0()
{
}

void sub_100674740()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "SelectStreamConfigFastConnectFailed to find compatible stream configuration for device %{public}s - disconnecting",  v8);
  sub_10007B3CC();
}

void sub_10067478C()
{
}

void sub_1006747EC(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136446210;
  *(void *)(a1 + 4) = "null";
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "fastConnectA2DPSetupComplete Failed to open streaming channel failure on device %{public}s",  (uint8_t *)a1);
}

void sub_10067482C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "fastConnectA2DPSetupComplete Failed to open streaming channel failure on device %{public}s",  v8);
  sub_10007B3CC();
}

void sub_100674878()
{
}

void sub_1006748DC()
{
}

void sub_100674908()
{
}

void sub_100674934()
{
}

void sub_100674960()
{
}

void sub_10067498C()
{
}

void sub_1006749B8()
{
}

void sub_1006749E4()
{
}

void sub_100674A10()
{
}

void sub_100674A3C()
{
}

void sub_100674A68()
{
}

void sub_100674A94()
{
}

void sub_100674AC0()
{
}

void sub_100674AEC()
{
}

void sub_100674B18()
{
}

void sub_100674B44()
{
}

void sub_100674B70(char a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = "GATT";
  if ((a1 & 1) != 0) {
    uint64_t v3 = "GAP";
  }
  int v4 = 136446210;
  uint64_t v5 = v3;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Failed to publish %{public}s service!", (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_100674BF0()
{
}

void sub_100674C1C()
{
}

void sub_100674C48()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Application is trying to publish a characteristic value with reserved UUID %{public}s",  v8);
  sub_10007B3CC();
}

void sub_100674C94()
{
}

void sub_100674CF4()
{
}

void sub_100674D54(char a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = "notify";
  if ((a1 & 0x10) == 0) {
    uint64_t v3 = "indicate";
  }
  int v4 = 136446210;
  uint64_t v5 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "Characteristic set for %{public}s without client configuration descriptor!",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_100674DD4()
{
}

void sub_100674E00()
{
}

void sub_100674E2C()
{
}

void sub_100674E58()
{
}

void sub_100674E84()
{
}

void sub_100674EB0()
{
}

void sub_100674EDC()
{
}

void sub_100674F08()
{
}

void sub_100674F68()
{
}

void sub_100674FC8(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Couldn't find service attribute with ID 0x%x!",  (uint8_t *)v3,  8u);
  sub_100029870();
}

void sub_10067503C(uint64_t *a1, uint64_t a2, int a3, os_log_s *a4)
{
  else {
    uint64_t v5 = (uint64_t *)*a1;
  }
  *(_DWORD *)a2 = 136446466;
  *(void *)(a2 + 4) = v5;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  sub_1002929D8( (void *)&_mh_execute_header,  "Failed to re-publish service %{public}s with result %d!",  (uint8_t *)a2,  a4);
  sub_10007B3CC();
}

void sub_1006750A8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100675110( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100675178()
{
}

void sub_1006751D8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Unable to find Client Characteristic Configuration Descriptor for %{public}s!",  v8);
  sub_10007B3CC();
}

void sub_100675224()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "No subscribed devices for %{public}s!", v8);
  sub_10007B3CC();
}

void sub_100675270()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Ignoring update for session %{public}s as there is already one queued",  v8);
  sub_10007B3CC();
}

void sub_1006752BC(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *uint64_t buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Client config went away while waiting to send update!",  buf,  2u);
}

void sub_1006752F8()
{
}

void sub_100675358()
{
}

void sub_1006753B8()
{
}

void sub_1006753E4(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "indicationConfirmed";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s - Unexpected Response - Device:%{public}@",  (uint8_t *)&v2,  0x16u);
  sub_10003BE20();
}

void sub_100675468()
{
}

void sub_100675494()
{
}

void sub_1006754C0()
{
}

void sub_1006754EC()
{
}

void sub_100675518()
{
}

void sub_100675544()
{
}

void sub_100675570(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 67109376;
  *(_DWORD *)(a3 + 4) = 512;
  *(_WORD *)(a3 + 8) = 2048;
  *(void *)(a3 + 10) = a1 + a2 - 512;
  sub_1002929D8( (void *)&_mh_execute_header,  "Refusing Prepare Write Request as it would exceed the maximum amount of data queued (%u) for this connection by %lu byte(s)",  (uint8_t *)a3,  a4);
}

void sub_1006755C4()
{
}

void sub_1006755F0()
{
}

void sub_10067561C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "Not allowed to set configuration descriptor to %{public}s",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100675684()
{
}

void sub_1006756B0()
{
}

void sub_1006756DC(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "deviceItr == fDeviceSessions.end()";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Assertion failed: %{public}s",  (uint8_t *)&v1,  0xCu);
  sub_10003BE20();
}

void sub_100675758(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "GattServer disconnected but cannot find session for device %{public}@",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_1006757C0()
{
}

void sub_100675820()
{
}

void sub_100675880()
{
}

void sub_1006758E0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100675944()
{
}

void sub_1006759A4(uint64_t *a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  else {
    uint64_t v5 = (uint64_t *)*a1;
  }
  *(_DWORD *)a3 = 136446466;
  *(void *)(a3 + 4) = v5;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  sub_10024EF7C( (void *)&_mh_execute_header,  "%{public}s can't send data to %{public}@ since its not connected",  (uint8_t *)a3,  a4);
  sub_10007B3CC();
}

void sub_100675A10()
{
}

void sub_100675A3C(uint64_t a1, uint64_t *a2, uint64_t a3, os_log_s *a4)
{
  else {
    uint64_t v5 = (uint64_t *)*a2;
  }
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2082;
  *(void *)(a3 + 14) = v5;
  sub_10024EF7C( (void *)&_mh_execute_header,  "Device %{public}@ for session %{public}s is disconnecting, lets wait for it to disconnect and try again",  (uint8_t *)a3,  a4);
  sub_10007B3CC();
}

void sub_100675AA8(char a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Skipping Built In Service Detection Status %d",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_100675B1C()
{
}

void sub_100675B7C()
{
}

void sub_100675BA8()
{
}

void sub_100675C08()
{
}

void sub_100675C68()
{
}

void sub_100675CC8()
{
}

void sub_100675CF4()
{
}

void sub_100675D20()
{
}

void sub_100675D80()
{
}

void sub_100675DAC(char a1, uint64_t a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(*(void *)a2 + 304LL);
  v4[0] = 67109376;
  v4[1] = a1 & 1;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "moreAvailable=%d, isFromADVBuffer=%d",  (uint8_t *)v4,  0xEu);
  sub_10003BE20();
}

void sub_100675E38()
{
}

void sub_100675E98()
{
}

void sub_100675EF8()
{
}

void sub_100675F24()
{
}

void sub_100675F50()
{
}

void sub_100675F7C()
{
}

void sub_100675FA8()
{
}

void sub_100675FD4()
{
}

void sub_100676000()
{
}

void sub_100676060()
{
}

void sub_10067608C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10008651C( (void *)&_mh_execute_header,  a2,  a3,  "FastLEConnection:CBCentralSession::enableFastLeConnectionWithDataToDevice enabling using setControllerInfoForDevice returned %d",  a5,  a6,  a7,  a8,  0);
  sub_100029870();
}

void sub_1006760F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067615C()
{
}

void sub_100676188()
{
}

void sub_1006761B4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10008651C( (void *)&_mh_execute_header,  a2,  a3,  "FastLEConnection:CBCentralSession::enableFastLeConnectionWithDataToDevice disabling using setControllerInfoForDevice returned %d",  a5,  a6,  a7,  a8,  0);
  sub_100029870();
}

void sub_100676218()
{
}

void sub_100676244()
{
}

void sub_100676270()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "session %{public}@ device %{public}@ evicted",  v2,  0x16u);
  sub_10003BE20();
}

void sub_1006762EC(unsigned __int16 a1, uint64_t *a2, uint8_t *buf, os_log_t log)
{
  else {
    uint64_t v5 = (uint64_t *)*a2;
  }
  *(_DWORD *)uint64_t buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2082;
  *(void *)(buf + 10) = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Couldn't find service ID 0x%x for session %{public}s",  buf,  0x12u);
  sub_10007B3CC();
}

void sub_100676368()
{
}

void sub_1006763C8(uint64_t a1, os_log_s *a2)
{
  if (v5 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  *(_DWORD *)uint64_t buf = 136446210;
  int v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to start advertising as session %{public}s is already advertising!",  buf,  0xCu);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10067647C()
{
}

void sub_1006764DC()
{
}

void sub_10067653C()
{
}

void sub_10067659C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Must specify both a key and a value", v1, 2u);
}

void sub_1006765DC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100676640( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006766A4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Failed to generate DHK with result %{bluetooth:OI_STATUS}u",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_100676714(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "activate";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Network.Framework is not available",  (uint8_t *)&v1,  0xCu);
}

void sub_100676794( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006767C4()
{
}

void sub_100676874()
{
}

void sub_100676924()
{
}

void sub_10067698C()
{
}

void sub_1006769F4()
{
}

void sub_100676A64()
{
}

void sub_100676AC8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100676AF8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100676B5C()
{
  int v3 = 244;
  sub_1000A56A4( (void *)&_mh_execute_header,  v0,  v1,  "Sink requested AAC_LC max bitrate of %lu outside the range of minimum bitrate %d and platform default of %d. Setting bitrate to platform default.",  v2);
  sub_10003BE20();
}

void sub_100676BC8()
{
}

void sub_100676C2C()
{
}

void sub_100676C90()
{
}

void sub_100676CF4()
{
  int v3 = v0;
  sub_1000A56A4( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Sink max requested AAC-LC bitrate of %lu is outside the range of minimum bitrate %d and platform default of %d. Sett ing bitrate to platform default.",  v2);
  sub_10003BE20();
}

void sub_100676D60()
{
}

void sub_100676DC4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100676E28( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100676E94()
{
}

void sub_100676EF4()
{
}

void sub_100676F54()
{
}

void sub_100676FB4()
{
}

void sub_100677014()
{
  int v0 = sub_1000BC028();
  sub_1000BC00C(v0);
  sub_100089F1C((void *)&_mh_execute_header, v1, v2, "iconv_open failed: %s", v3, v4, v5, v6, 2u);
  sub_10002B724();
}

void sub_100677084( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006770B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006770EC()
{
  int v0 = sub_1000BC028();
  sub_1000BC00C(v0);
  sub_100089F1C((void *)&_mh_execute_header, v1, v2, "iconv failed with unexpected error: %s", v3, v4, v5, v6, 2u);
  sub_10002B724();
}

void sub_10067715C()
{
  int v0 = sub_1000BC028();
  sub_1000BC00C(v0);
  sub_100089F1C((void *)&_mh_execute_header, v1, v2, "iconv_close failed: %s", v3, v4, v5, v6, 2u);
  sub_10002B724();
}

void sub_1006771CC()
{
}

void sub_100677204( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100677268()
{
}

void sub_1006772C8()
{
}

void sub_100677328()
{
}

void sub_100677354()
{
}

void sub_1006773B4()
{
}

void sub_100677414( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100677478( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006774E0()
{
}

void sub_10067750C()
{
}

void sub_100677538( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006775A0()
{
}

void sub_100677600()
{
}

void sub_100677660(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *uint64_t buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Report with invalid RSSI found (127)",  buf,  2u);
}

void sub_10067769C()
{
}

void sub_1006776C8()
{
}

void sub_1006776F4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136446210;
  *(void *)(a1 + 4) = "(NULL)";
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "Couldn't find accessory manager for session %{public}s",  (uint8_t *)a1);
}

void sub_100677734(char *a1, uint64_t a2, os_log_s *a3)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Couldn't find accessory manager for session %{public}s",  (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10067779C(uint64_t a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_100241C9C(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_100241C70();
}

void sub_100677820(uint64_t a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_100241C9C(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_100241C70();
}

void sub_1006778A4(uint64_t a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_100241C9C(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_100241C70();
}

void sub_100677924(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "sensorStreamingConfigMsgReceived sendToAccessoryEventCallback with result %d",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_100677994(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "remoteStreamUpdate: unknown stream state %d ",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_100677A04()
{
}

void sub_100677A30()
{
  sub_100029860( (void *)&_mh_execute_header,  v0,  v1,  "Audio Timesync: not supported Apple Device, return not supported",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100677A5C()
{
  sub_100029860( (void *)&_mh_execute_header,  v0,  v1,  "Audio Timesync: non-Apple Device, return not supported",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100677A88()
{
}

void sub_100677AB4()
{
}

void sub_100677AE0()
{
}

void sub_100677B0C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1003BF88C(v2, v6, 7.2225e-34);
  sub_1003BF8BC( (void *)&_mh_execute_header,  v7,  v8,  "Address %{private, mask.hash}s not valid or device has disconnected",  v9);
  sub_10007B3CC();
}

void sub_100677B54()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1003BF88C(v2, v6, 7.2225e-34);
  sub_1003BF8BC((void *)&_mh_execute_header, v7, v8, "Failed to get device %{private, mask.hash}s", v9);
  sub_10007B3CC();
}

void sub_100677B9C(uint64_t *a1, uint8_t *buf, int a3, os_log_t log)
{
  else {
    char v5 = (uint64_t *)*a1;
  }
  *(_DWORD *)uint64_t buf = 141558531;
  *(void *)(buf + 4) = 1752392040LL;
  *((_WORD *)buf + 6) = 2081;
  *(void *)(buf + 14) = v5;
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to register device %{private, mask.hash}s - result was %d",  buf,  0x1Cu);
  sub_10007B3CC();
}

void sub_100677C28()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1003BF88C(v2, v6, 7.2225e-34);
  sub_1003BF8BC( (void *)&_mh_execute_header,  v7,  v8,  "Failed to get device handle for device %{private, mask.hash}s",  v9);
  sub_10007B3CC();
}

void sub_100677C70()
{
}

void sub_100677C9C()
{
}

void sub_100677CC8()
{
}

void sub_100677CF4()
{
}

void sub_100677D20()
{
}

void sub_100677D4C()
{
}

void sub_100677D78()
{
}

void sub_100677DA4()
{
}

void sub_100677DD0()
{
}

void sub_100677DFC()
{
}

void sub_100677E28()
{
}

void sub_100677E54(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "BTAccessoryManagerGetAccessoryInfo json error: %@",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100677EBC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100677F20(uint64_t a1)
{
  if (v22 < 0) {
    sub_100241C9C(v7, v8, v9, v10, v11, v12, v13, v14, v17, v19);
  }
  sub_100241C70();
}

void sub_100677F98(uint64_t a1)
{
  if (v22 < 0) {
    sub_100241C9C(v7, v8, v9, v10, v11, v12, v13, v14, v17, v19);
  }
  sub_100241C70();
}

void sub_100678010(uint64_t a1)
{
  if (v22 < 0) {
    sub_100241C9C(v7, v8, v9, v10, v11, v12, v13, v14, v17, v19);
  }
  sub_100241C70();
}

void sub_100678088()
{
}

void sub_1006780B4(uint64_t a1)
{
  if (v22 < 0) {
    sub_100241C9C(v7, v8, v9, v10, v11, v12, v13, v14, v17, v19);
  }
  sub_100241C70();
}

void sub_10067812C(uint64_t a1)
{
  if (v22 < 0) {
    sub_100241C9C(v7, v8, v9, v10, v11, v12, v13, v14, v17, v19);
  }
  sub_100241C70();
}

void sub_1006781A4(uint64_t a1)
{
  if (v22 < 0) {
    sub_100241C9C(v7, v8, v9, v10, v11, v12, v13, v14, v17, v19);
  }
  sub_100241C70();
}

void sub_10067821C()
{
}

void sub_100678248()
{
}

void sub_100678274()
{
}

void sub_1006782A0()
{
}

void sub_1006782CC()
{
}

void sub_1006782F8()
{
}

void sub_100678324()
{
}

void sub_100678350()
{
}

void sub_10067837C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "BTAccessoryManagerGetCaseSerialNumbersForAppleProductId json error: %@",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_1006783E4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067844C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds json error: %@",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_1006784B4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067851C()
{
}

void sub_100678548()
{
}

void sub_100678574()
{
}

void sub_1006785A0()
{
}

void sub_1006785CC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100678630()
{
}

void sub_10067865C()
{
}

void sub_100678688( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006786EC()
{
}

void sub_10067874C()
{
}

void sub_1006787AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100678818()
{
}

void sub_100678844()
{
}

void sub_100678870()
{
}

void sub_1006788D0(uint64_t a1, uint64_t a2)
{
  if (v13 < 0) {
    operator delete(__pa);
  }
  sub_100241C70();
}

void sub_100678958()
{
}

void sub_1006789B8()
{
}

void sub_100678A18(char a1, int a2, os_log_t log)
{
  uint64_t v3 = "accept";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "deny";
  }
  int v4 = 136315394;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to %s connection attempt - result was %d",  (uint8_t *)&v4,  0x12u);
}

void sub_100678AB4(uint64_t a1, uint64_t a2)
{
  if (v13 < 0) {
    operator delete(__pa);
  }
  sub_100241C70();
}

void sub_100678B38()
{
}

void sub_100678B64()
{
}

void sub_100678B90()
{
}

void sub_100678BF0()
{
}

void sub_100678C50( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100678CB4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100678CE4(char *a1, uint8_t *buf, int a3, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = *(char **)a1;
  }
  *(_DWORD *)uint64_t buf = 136446466;
  *(void *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "GATT Failed to disconnect GATT profile from device %{public}s with result %{bluetooth:OI_STATUS}u",  buf,  0x12u);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100678D64( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100678D94( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100678DF8()
{
}

void sub_100678E24()
{
}

void sub_100678E50()
{
}

void sub_100678E7C()
{
}

void sub_100678EA8(char a1, os_log_s *a2)
{
  uint64_t v2 = "not found.";
  if ((a1 & 1) != 0) {
    uint64_t v2 = "found.";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error, BTDeviceConfigureLinkKey device not found or linkkey %s ",  (uint8_t *)&v3,  0xCu);
}

void sub_100678F34()
{
}

void sub_100678F60()
{
}

void sub_100678F8C()
{
}

void sub_100678FB8()
{
}

void sub_100678FE4(uint8_t *buf, os_log_s *a2)
{
  *(_DWORD *)uint64_t buf = 136446210;
  *(void *)(buf + 4) = "(NULL)";
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to get default local device for session %{public}s",  buf,  0xCu);
}

void sub_10067902C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  if (v7 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to get default local device for session %{public}s",  (uint8_t *)a2,  0xCu);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1006790BC()
{
}

void sub_1006790E8()
{
}

void sub_100679114()
{
}

void sub_100679140()
{
}

void sub_10067916C()
{
}

void sub_100679198()
{
}

void sub_1006791C4()
{
}

void sub_1006791F0()
{
}

void sub_10067921C()
{
}

void sub_100679248()
{
}

void sub_100679274()
{
}

void sub_1006792A0()
{
}

void sub_1006792CC()
{
}

void sub_1006792F8()
{
}

void sub_100679324()
{
}

void sub_100679350()
{
}

void sub_10067937C()
{
}

void sub_1006793A8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(a1 + 40) = v2;
    operator delete(v2);
  }

void sub_1006793E4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Received connection result without a matching attempt for service 0x%08x",  (uint8_t *)v2,  8u);
}

void sub_100679458(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)uint64_t buf = 136446210;
  *(void *)(buf + 4) = v4;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "We got a disconnection result without a previous connection for service %{public}s",  buf,  0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1006794C8()
{
}

void sub_1006794F4()
{
}

void sub_100679520()
{
}

void sub_10067954C()
{
}

void sub_100679578()
{
}

void sub_1006795A4()
{
  sub_100029860( (void *)&_mh_execute_header,  v0,  v1,  "Identification - System has not passed first unlock, returning",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_1006795D0()
{
  uint64_t v3 = 2LL;
  sub_100241D4C((void *)&_mh_execute_header, v0, v1, "Apple supported feature version size is %d. Expected %lu", v2);
  sub_10003BE20();
}

void sub_10067963C()
{
  uint64_t v3 = 8LL;
  sub_100241D4C((void *)&_mh_execute_header, v0, v1, "Apple extended feature ID1 size is %d. Expected %lu", v2);
  sub_10003BE20();
}

void sub_1006796A8()
{
  uint64_t v3 = 4LL;
  sub_100241D4C((void *)&_mh_execute_header, v0, v1, "Apple supported feature ID0 size is %d. Expected %lu", v2);
  sub_10003BE20();
}

void sub_100679714(uint64_t a1, os_log_s *a2)
{
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  int v7 = 136446210;
  uint64_t v8 = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v3,  "Invalid operation. Trying to set HIDBehavior for %{public}s",  (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1006797BC()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "Failed to invoke Single Shot Role Switch WAR for %{public}s",  v4);
  sub_10007B3CC();
}

void sub_10067980C()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000((void *)&_mh_execute_header, v3, (uint64_t)v3, "could not write SDP record for device %{public}s", v4);
  sub_10007B3CC();
}

void sub_10067985C()
{
}

void sub_100679888()
{
}

void sub_1006798E8()
{
}

void sub_100679914()
{
}

void sub_100679974()
{
}

void sub_1006799A0()
{
}

void sub_1006799CC()
{
}

void sub_1006799F8()
{
}

void sub_100679A24()
{
}

void sub_100679A84()
{
}

void sub_100679AB0(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "Error APPLE_AUDIO_DEVICE_NAME bad format string: %@",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100679B18(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "static void BT::Device::updateWithCurrentUserGivenName(Device *)_block_invoke";
  sub_1000BC000( (void *)&_mh_execute_header,  a1,  a3,  "Error occured %{public}s while trying to localize the device name with user name",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100679B8C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "static void BT::Device::updateWithCurrentUserGivenName(Device *)_block_invoke";
  sub_1000BC000( (void *)&_mh_execute_header,  a1,  a3,  "Error occurred %{public}s users name was returned empty or null",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100679C00()
{
}

void sub_100679C2C()
{
}

void sub_100679C58()
{
}

void sub_100679C84()
{
}

void sub_100679CB0()
{
}

void sub_100679CDC()
{
}

void sub_100679D08()
{
}

void sub_100679D34()
{
}

void sub_100679D60()
{
}

void sub_100679D8C()
{
}

void sub_100679DB8()
{
}

void sub_100679DE4()
{
}

void sub_100679E10()
{
}

void sub_100679E3C()
{
}

void sub_100679E68( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100679EE4()
{
}

void sub_100679F10()
{
}

void sub_100679F3C()
{
}

void sub_100679F68(uint64_t a1, char a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Did not find TU call to set Call Screening %@ to value:%d",  (uint8_t *)&v3,  0x12u);
  sub_10003BE20();
}

void sub_100679FEC()
{
}

void sub_10067A018()
{
}

void sub_10067A044()
{
}

void sub_10067A070()
{
}

void sub_10067A09C()
{
}

void sub_10067A0C8()
{
}

void sub_10067A0F4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067A158()
{
}

void sub_10067A184(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "Invalid Device Address, skip device read", a1);
}

void sub_10067A1B8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "Removing Device Support Information for %{public}s", v8);
  sub_10007B3CC();
}

void sub_10067A204()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "Removing Cloud Magic Settings for %{public}s", v8);
  sub_10007B3CC();
}

void sub_10067A250()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "Removing Device Record for %{public}s", v8);
  sub_10007B3CC();
}

void sub_10067A29C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Removing Magic pairing device %{public}s from device list failed",  v8);
  sub_10007B3CC();
}

void sub_10067A2E8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8149e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Cloud asked to unpair, dont easy unpair right now: %s",  v8);
  sub_10007B3CC();
}

void sub_10067A334()
{
}

void sub_10067A394()
{
}

void sub_10067A3D8()
{
}

void sub_10067A41C()
{
}

void sub_10067A460()
{
}

void sub_10067A48C()
{
}

void sub_10067A4B8()
{
}

void sub_10067A4E4()
{
}

void sub_10067A510()
{
}

void sub_10067A570()
{
}

void sub_10067A5D0()
{
}

void sub_10067A5FC()
{
}

void sub_10067A628()
{
}

void sub_10067A654()
{
}

void sub_10067A680()
{
}

void sub_10067A6E0()
{
}

void sub_10067A740()
{
}

void sub_10067A7A0()
{
}

void sub_10067A7CC()
{
}

void sub_10067A7F8()
{
}

void sub_10067A824()
{
}

void sub_10067A850()
{
}

void sub_10067A8B0()
{
}

void sub_10067A918()
{
}

void sub_10067A97C()
{
}

void sub_10067A9E4()
{
}

void sub_10067AA48()
{
}

void sub_10067AA74()
{
}

void sub_10067AAD4(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "Invalid Device Address, Skip Record", a1);
}

void sub_10067AB08()
{
}

void sub_10067AB4C()
{
}

void sub_10067AB90()
{
}

void sub_10067ABD4(uint64_t a1, os_log_s *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 241);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "updateAACPVersionInfo: Invalid device or not signed in %d ",  (uint8_t *)v3,  8u);
  sub_100029870();
}

void sub_10067AC48()
{
}

void sub_10067AC74()
{
}

void sub_10067ACA0()
{
}

void sub_10067ACCC()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "updateAACPVersionInfo: No valid versionInfo for %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10067AD18()
{
}

void sub_10067AD44()
{
}

void sub_10067ADA8()
{
}

void sub_10067AE0C()
{
}

void sub_10067AE70()
{
}

void sub_10067AED4()
{
}

void sub_10067AF38()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "updateCaseInfo: No valid caseInfo for %{public}s", v8);
  sub_10007B3CC();
}

void sub_10067AF84()
{
}

void sub_10067AFE8()
{
}

void sub_10067B04C()
{
}

void sub_10067B0B0()
{
}

void sub_10067B110()
{
}

void sub_10067B170()
{
}

void sub_10067B1D4()
{
}

void sub_10067B238()
{
}

void sub_10067B27C()
{
}

void sub_10067B2C0()
{
}

void sub_10067B2EC()
{
}

void sub_10067B318(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Cannot find device or device not paired for address: %s",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10067B390()
{
}

void sub_10067B3D4()
{
}

void sub_10067B400()
{
}

void sub_10067B444()
{
}

void sub_10067B488()
{
}

void sub_10067B4E8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Magic Pairing failed, force disconnecting device %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10067B534()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "Magic paired device for %{public}s not found", v8);
  sub_10007B3CC();
}

void sub_10067B580( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067B5F8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067B66C()
{
}

void sub_10067B698(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Failed registration for MKB first unlock notification with error : %u",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_10067B708()
{
  _os_log_fault_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "DeviceManager: Received MKB first unlock notification, but MKBDeviceUnlockedSinceBoot returns 0",  v1,  2u);
  sub_100029870();
}

void sub_10067B740( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067B7B0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067B820()
{
}

void sub_10067B84C()
{
}

void sub_10067B878(uint64_t a1, os_log_s *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 136);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Is incompatible Hid device connected: %u",  (uint8_t *)v3,  8u);
  sub_100029870();
}

void sub_10067B8EC()
{
}

void sub_10067B918( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067B97C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067B9E0(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to get address from handle %p",  (uint8_t *)&v2,  0xCu);
  sub_10003BE20();
}

void sub_10067BA50(uint64_t a1, os_log_s *a2)
{
  if (v5 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  *(_DWORD *)uint64_t buf = 136446210;
  char v7 = v3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Cannot hash UUID of unexpected length (%{public}s)",  buf,  0xCu);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10067BB08(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "!fQueue";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10067BB7C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "this != getRootDispatcher()";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10067BBF0(dispatch_queue_s *a1)
{
}

void sub_10067BC60(dispatch_queue_s *a1)
{
}

void sub_10067BCD0(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 >= 0) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = (void *)*a2;
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  sub_10024EF4C((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s", (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_10067BD4C(uint8_t *a1, dispatch_queue_t queue, const char **a3, os_log_s *a4)
{
  label = dispatch_queue_get_label(queue);
  *(_DWORD *)a1 = 136315138;
  *a3 = label;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "%s", a1, 0xCu);
}

void sub_10067BDB4()
{
}

void sub_10067BDE0()
{
}

void sub_10067BE0C(uint64_t a1)
{
}

void sub_10067BE80()
{
}

void sub_10067BEAC()
{
}

void sub_10067BED8()
{
}

void sub_10067BF04()
{
}

void sub_10067BF30()
{
}

void sub_10067BF5C()
{
}

void sub_10067BF88()
{
}

void sub_10067BFB4()
{
}

void sub_10067BFE0()
{
}

void sub_10067C00C()
{
}

void sub_10067C038()
{
}

void sub_10067C064(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Sandbox extension consume failed with error: %lld",  (uint8_t *)&v2,  0xCu);
}

void sub_10067C0D8(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)uint64_t buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "ABC Snapshot failed with code %lld and reason: %s",  buf,  0x16u);
}

void sub_10067C12C()
{
}

void sub_10067C18C()
{
}

void sub_10067C1EC()
{
}

void sub_10067C24C()
{
}

void sub_10067C2AC()
{
}

void sub_10067C30C(unsigned __int16 a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Delete %d out %d entries from PowerAssertionHistory",  (uint8_t *)v3,  0xEu);
}

void sub_10067C394(uint64_t a1)
{
}

void sub_10067C3FC()
{
}

void sub_10067C464()
{
}

void sub_10067C4CC(uint64_t a1)
{
}

void sub_10067C534()
{
}

void sub_10067C59C()
{
}

void sub_10067C604(uint64_t a1)
{
}

void sub_10067C66C()
{
  __int16 v4 = 2082;
  uint64_t v5 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%{public}s profile rejecting incoming connection as %{public}s",  v3,  0x16u);
  sub_10002B724();
}

void sub_10067C708(unsigned int a1, uint64_t a2, int a3, os_log_s *a4)
{
  uint8_t v7 = sub_10040FC0C(a1);
  *(_DWORD *)a2 = 136446466;
  *(void *)(a2 + 4) = v7;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "%{public}s profile rejecting incoming connection as it would exceed the maximum number of connections (%d)",  (uint8_t *)a2,  0x12u);
}

void sub_10067C778(uint64_t a1)
{
}

void sub_10067C7E0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "fDevicesMap.find(device) == fDevicesMap.end()";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10067C854(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "maxNumberOfConnections() <= 1";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10067C8C8(unsigned int *a1, os_log_s *a2)
{
}

void sub_10067C940(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Gatt connected with error %{bluetooth:OI_STATUS}u",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_10067C9B0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Gatt device %{public}@ connected over classic when it should have be rejected",  (uint8_t *)&v2,  0xCu);
}

void sub_10067CA24(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "GATT disconnected with handle that's not tracked",  v1,  2u);
  sub_100029870();
}

void sub_10067CA60(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "GATT device ready with handle that's not tracked",  v1,  2u);
  sub_100029870();
}

void sub_10067CA9C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Gatt device connected with error %{bluetooth:OI_STATUS}u",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_10067CB0C()
{
}

void sub_10067CB6C()
{
}

void sub_10067CB9C()
{
}

void sub_10067CBCC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067CC3C(int a1, os_log_s *a2)
{
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  *(_DWORD *)uint64_t buf = 136446466;
  uint64_t v8 = v4;
  __int16 v9 = 1024;
  int v10 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "SDP connection to device %{public}s failed with result %{bluetooth:OI_STATUS}u",  buf,  0x12u);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10067CD14()
{
}

void sub_10067CD74()
{
}

void sub_10067CDD4()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "Response returned status = %{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10067CE34()
{
}

void sub_10067CE94(unsigned int a1, os_log_s *a2)
{
  int v4 = 136315138;
  uint64_t v5 = sub_100415164(a1);
  sub_1000BC000((void *)&_mh_execute_header, a2, v3, "Invalid SDP state: %s", (uint8_t *)&v4);
}

void sub_10067CF14()
{
  sub_1001FE010((void *)&_mh_execute_header, v0, v1, "Attribute search didn't return a list", v2);
  sub_100029870();
}

void sub_10067CF44( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067CFB4()
{
}

void sub_10067D014()
{
}

void sub_10067D074()
{
}

void sub_10067D0D4(_BYTE *a1, _BYTE *a2)
{
}

void sub_10067D100(_BYTE *a1, _BYTE *a2)
{
}

void sub_10067D12C(_BYTE *a1, _BYTE *a2)
{
}

void sub_10067D158(_BYTE *a1, _BYTE *a2)
{
}

void sub_10067D184()
{
}

void sub_10067D1B4()
{
}

void sub_10067D214(unsigned int a1, os_log_s *a2, uint64_t a3)
{
  if (a1 > 0xA) {
    uint64_t v3 = "unknown sdp state";
  }
  else {
    uint64_t v3 = off_100897700[a1];
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "Invalid state while trying to update RFCOMM channel state %s",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_10067D29C()
{
}

void sub_10067D2FC(uint64_t a1, os_log_s *a2)
{
  int v2 = 141558531;
  uint64_t v3 = 1752392040LL;
  __int16 v4 = 1041;
  int v5 = 6;
  __int16 v6 = 2097;
  uint64_t v7 = a1 + 44;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Device for addr %{private,bluetooth:BD_ADDR,mask.hash}.6P not found",  (uint8_t *)&v2,  0x1Cu);
}

void sub_10067D398(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "SDP query complete on an invalid device!",  v1,  2u);
}

void sub_10067D3D8()
{
}

void sub_10067D440()
{
}

void sub_10067D4A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067D518()
{
}

void sub_10067D580()
{
}

void sub_10067D5E8(char *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *(char **)a1;
  if (a1[23] >= 0) {
    uint64_t v5 = a1;
  }
  uint8_t v6 = (void *)(a2 + 8);
  *(_DWORD *)uint64_t buf = 136446466;
  *(void *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2082;
  *(void *)(buf + 14) = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Device %{public}s is no longer authorized for service %{public}s - disconnecting",  buf,  0x16u);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10067D678()
{
}

void sub_10067D6D8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067D740()
{
}

void sub_10067D7A0()
{
}

void sub_10067D800()
{
}

void sub_10067D860()
{
}

void sub_10067D8C0()
{
}

void sub_10067D920()
{
}

void sub_10067D980()
{
}

void sub_10067D9E0()
{
}

void sub_10067DA40()
{
}

void sub_10067DAA0()
{
}

void sub_10067DACC()
{
}

void sub_10067DAF8()
{
}

void sub_10067DB24()
{
}

void sub_10067DB50()
{
}

void sub_10067DBB0(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Still waiting for %lu services to shut down", (uint8_t *)&v4);
}

void sub_10067DC20(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "Service event device handle is NULL", a1);
}

void sub_10067DC54()
{
}

void sub_10067DC98(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)int v3 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a1, a3, "Bluetooth power not ON - shouldn't be trying to connect", v3);
  sub_100029870();
}

void sub_10067DCCC(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  else {
    int v4 = (uint64_t *)*a1;
  }
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = v4;
  sub_1000BC000((void *)&_mh_execute_header, a3, (uint64_t)a3, "Device %{public}s has empty UUID", (uint8_t *)a2);
  sub_10007B3CC();
}

void sub_10067DD2C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067DD90( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067DDF4(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)int v3 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a1, a3, "Service Manager is already stalled.", v3);
  sub_100029870();
}

void sub_10067DE28()
{
}

void sub_10067DE6C(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "device != NULL";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Assertion failed: %{public}s",  (uint8_t *)&v1,  0xCu);
}

void sub_10067DEEC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10008651C((void *)&_mh_execute_header, a2, a3, "LE disconnect returned %d", a5, a6, a7, a8, 0);
  sub_100029870();
}

void sub_10067DF50(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)int v3 = 0;
  sub_1001FE010( (void *)&_mh_execute_header,  a1,  a3,  "CTKD le device connected, but could not find classic device in device manager",  v3);
  sub_100029870();
}

void sub_10067DF84(uint64_t a1, os_log_s *a2)
{
  if (v6 >= 0) {
    int v4 = __p;
  }
  else {
    int v4 = (void **)__p[0];
  }
  int v7 = 136446210;
  uint64_t v8 = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v3,  "fastConnectProcessNextConnection for device %{public}s",  (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10067E02C()
{
  sub_10002B708( (void *)&_mh_execute_header,  v0,  v1,  "L2CAP Packet Aggregation is overriden by defaults (=%s)",  v2,  v3,  v4,  v5,  v6);
  sub_10003BE20();
}

void sub_10067E0A8()
{
}

void sub_10067E108()
{
}

void sub_10067E168()
{
}

void sub_10067E1C8()
{
}

void sub_10067E228( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067E290()
{
}

void sub_10067E2F0()
{
}

void sub_10067E31C()
{
}

void sub_10067E348()
{
}

void sub_10067E374()
{
}

void sub_10067E3A0()
{
}

void sub_10067E3CC()
{
}

void sub_10067E3F8()
{
}

void sub_10067E458()
{
}

void sub_10067E4B8()
{
}

void sub_10067E4E4()
{
}

void sub_10067E510()
{
}

void sub_10067E53C()
{
}

void sub_10067E568()
{
}

void sub_10067E594()
{
}

void sub_10067E5C0()
{
}

void sub_10067E5EC()
{
}

void sub_10067E618()
{
}

void sub_10067E690()
{
}

void sub_10067E6BC()
{
}

void sub_10067E6E8()
{
}

void sub_10067E748()
{
}

void sub_10067E7A8()
{
}

void sub_10067E824()
{
}

void sub_10067E850()
{
}

void sub_10067E8CC()
{
}

void sub_10067E8F8()
{
}

void sub_10067E974()
{
}

void sub_10067E9D4(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "constEirLen < OI_DHCI_EIR_DATA_LEN";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Assertion failed: %{public}s",  (uint8_t *)&v1,  0xCu);
  sub_10003BE20();
}

void sub_10067EA50()
{
}

void sub_10067EAB0()
{
}

void sub_10067EB2C()
{
}

void sub_10067EBA8()
{
}

void sub_10067EBD4(uint64_t a1, uint64_t a2)
{
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%{public}s completed with status %{bluetooth:OI_STATUS}u",  v4,  0x12u);
}

void sub_10067EC20(uint64_t a1, uint64_t a2)
{
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = v3;
  sub_100241D4C((void *)&_mh_execute_header, v5, v3, "%{public}s completed with status %{bluetooth:OI_STATUS}u", v4);
}

void sub_10067EC68(uint64_t a1, uint64_t a2)
{
}

void sub_10067ECA0(uint64_t a1, uint64_t a2)
{
}

void sub_10067ECD8()
{
}

void sub_10067ED04()
{
}

void sub_10067ED64()
{
}

void sub_10067ED90()
{
  sub_100029860((void *)&_mh_execute_header, v0, v1, "BundleID does not exist, return default", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10067EDBC()
{
}

void sub_10067EDE8()
{
}

void sub_10067EE14()
{
  sub_100029860( (void *)&_mh_execute_header,  v0,  v1,  "Cannot get Spatial Mode with empty Bundle ID, return default value",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10067EE40()
{
}

void sub_10067EEA0()
{
}

void sub_10067EF00()
{
}

void sub_10067EF60()
{
}

void sub_10067EFC0()
{
}

void sub_10067F020()
{
}

void sub_10067F080()
{
}

void sub_10067F0E0()
{
}

void sub_10067F140()
{
}

void sub_10067F1A0()
{
}

void sub_10067F200()
{
}

void sub_10067F260()
{
}

void sub_10067F2C0()
{
}

void sub_10067F320()
{
}

void sub_10067F34C()
{
}

void sub_10067F378()
{
}

void sub_10067F3D8()
{
}

void sub_10067F438()
{
}

void sub_10067F498()
{
}

void sub_10067F4F8()
{
}

void sub_10067F558()
{
}

void sub_10067F5B8()
{
}

void sub_10067F618()
{
}

void sub_10067F678(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)uint64_t buf = 136446210;
  *a2 = "devicePair.second";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Assertion failed: %{public}s", buf, 0xCu);
}

void sub_10067F6C4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067F728( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067F78C()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "getReportWithKeyhole 0x%x worked but returned wrong length (%lu)",  v2,  0x12u);
  sub_10003BE20();
}

void sub_10067F808()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "getReportWithKeyhole 0x%x set to 0xFF failed: 0x%x",  v2,  0xEu);
  sub_10003BE20();
}

void sub_10067F884()
{
}

void sub_10067F8E4()
{
}

void sub_10067F94C()
{
}

void sub_10067F978()
{
}

void sub_10067F9A4()
{
}

void sub_10067F9D0()
{
}

void sub_10067FA04(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unhandled XPC message: %u", (uint8_t *)v2, 8u);
  sub_100029870();
}

void sub_10067FA74( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067FAA4(uint64_t a1, os_log_s *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 136) - 1;
  if (v2 > 9) {
    uint64_t v3 = "Unknown";
  }
  else {
    uint64_t v3 = off_100898A60[v2];
  }
  int v4 = 136446210;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Ignoring XPC message as state is %{public}s",  (uint8_t *)&v4,  0xCu);
}

void sub_10067FB40( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067FB70(char *a1, unsigned __int16 a2, os_log_s *a3)
{
  uint64_t v5 = (*(uint64_t (**)(char *, void))(*(void *)a1 + 56LL))(a1, a2);
  int v7 = a1 + 56;
  if (a1[79] < 0) {
    int v7 = (void *)*v7;
  }
  int v8 = 136446466;
  uint64_t v9 = v5;
  __int16 v10 = 2082;
  uint64_t v11 = v7;
  sub_10044041C( (void *)&_mh_execute_header,  a3,  v6,  "Sending XPC message %{public}s to session %{public}s",  (uint8_t *)&v8);
}

void sub_10067FC1C(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "type == GATT_ATT_TYPE_PRIMARY_SERVICE";
  sub_1004445CC((void *)&_mh_execute_header, (int)a2, a3, "Assertion failed: %{public}s", a1);
}

void sub_10067FC5C(unsigned __int16 **a1, os_log_s *a2)
{
  int v2 = **a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Found orphaned handle 0x%04x in handle map",  (uint8_t *)v3,  8u);
}

void sub_10067FCD8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1004445CC((void *)&_mh_execute_header, v7, v8, "Didn't have entry in handle map for service %{public}s", v9);
  sub_10007B3CC();
}

void sub_10067FD20(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "type == GATT_ATT_TYPE_INCLUDED_SERVICE";
  sub_1004445CC((void *)&_mh_execute_header, (int)a2, a3, "Assertion failed: %{public}s", a1);
}

void sub_10067FD60()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1004445CC( (void *)&_mh_execute_header,  v7,  v8,  "Didn't have entry in handle map for characteristic %{public}s",  v9);
  sub_10007B3CC();
}

void sub_10067FDA8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "Unable to find parent service for included service %{public}s!",  v9);
  sub_10007B3CC();
}

void sub_10067FDF0(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "type == GATT_ATT_TYPE_CHARACTERISTIC";
  sub_1004445CC((void *)&_mh_execute_header, (int)a2, a3, "Assertion failed: %{public}s", a1);
}

void sub_10067FE30()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "Unable to find parent service for characteristic %{public}s!",  v9);
  sub_10007B3CC();
}

void sub_10067FE78()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740((void *)&_mh_execute_header, v7, v8, "Unable to find parent service for value %{public}s!", v9);
  sub_10007B3CC();
}

void sub_10067FEC0()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "Dropping value %{public}s as we couldn't find a parent characteristic",  v9);
  sub_10007B3CC();
}

void sub_10067FF08()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1004445CC( (void *)&_mh_execute_header,  v7,  v8,  "Didn't have entry in handle map for descriptor %{public}s",  v9);
  sub_10007B3CC();
}

void sub_10067FF50()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740((void *)&_mh_execute_header, v7, v8, "Unable to find parent service for descriptor %{public}s!", v9);
  sub_10007B3CC();
}

void sub_10067FF98()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "Dropping descriptor %{public}s as we couldn't find a parent characteristic",  v9);
  sub_10007B3CC();
}

void sub_10067FFE0(unsigned __int16 a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to find parent service for characteristic handle 0x%04x!",  (uint8_t *)v2,  8u);
}

void sub_100680058()
{
}

void sub_100680084()
{
}

void sub_1006800B0()
{
}

void sub_1006800DC()
{
}

void sub_100680108()
{
}

void sub_100680134(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to perform inquiry with result %{bluetooth:OI_STATUS}u",  (uint8_t *)v2,  8u);
}

void sub_1006801A8()
{
}

void sub_1006801D4()
{
}

void sub_100680200()
{
}

void sub_10068022C()
{
}

void sub_100680258()
{
}

void sub_100680284()
{
}

void sub_1006802B0()
{
}

void sub_1006802DC()
{
}

void sub_100680308()
{
}

void sub_100680334( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100680398( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006803FC(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to locate dirty byte in SDP record - format was invalid (type = %d, int size = %d)",  (uint8_t *)v3,  0xEu);
}

void sub_100680480(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a1, a3, "Exceeded maximum amount of keys!", v3);
}

void sub_1006804B8(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Found invalid handle - removing associated callbacks",  a1);
}

void sub_1006804EC(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "device != NULL";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Assertion failed: %{public}s",  (uint8_t *)&v1,  0xCu);
}

void sub_10068056C(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)uint64_t buf = 136446210;
  *a2 = "(NULL)";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Had no object for the scan from %{public}s",  buf,  0xCu);
}

void sub_1006805B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006805E8(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "SCAN_CORE_PAGE_SCAN_TIMER_EXPIRED_EVENT";
  __int16 v3 = 2080;
  __int16 v4 = "SCAN_CORE_PAGE_SCAN_IDLE";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Received '%s' when Scan Core Page Scan state is %s.",  (uint8_t *)&v1,  0x16u);
}

void sub_10068067C()
{
}

void sub_1006806A8()
{
}

void sub_1006806D4(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "AudioSkywalk read loop is configured to an invalid audio interval (%llu). Defaulting to 22000us",  (uint8_t *)&v1,  0xCu);
  sub_10003BE20();
}

void sub_100680748()
{
}

void sub_100680774()
{
}

void sub_1006807E8()
{
}

void sub_100680814()
{
}

void sub_100680840(unsigned __int16 a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "TransportWrite";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: can't find handler for opCode 0x%04X",  (uint8_t *)&v2,  0x12u);
}

void sub_1006808CC(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "TransportWrite";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: invalide buffer", (uint8_t *)&v1, 0xCu);
}

void sub_10068094C()
{
}

void sub_1006809AC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100680A14()
{
}

void sub_100680A74()
{
}

void sub_100680AD4()
{
}

void sub_100680B34()
{
}

void sub_100680B94()
{
}

void sub_100680BF4()
{
}

void sub_100680C58(uint64_t a1, uint64_t a2)
{
}

void sub_100680C90(uint64_t a1)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  sub_100478580();
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "SCO Data size %zu is less than offset %d bytes, drop the packet",  (uint8_t *)&v2);
  sub_10003BE20();
}

void sub_100680D00()
{
  int v3 = 2;
  sub_100241D4C( (void *)&_mh_execute_header,  v0,  v1,  "Remaining SCO Data size %zu is less than %d bytes, drop the packet",  v2);
  sub_10003BE20();
}

void sub_100680D6C(uint64_t a1)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  sub_100478580();
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Remaining SCO data size %zu is less than packetSize plus header %d, drop the packet",  (uint8_t *)&v2);
  sub_10003BE20();
}

void sub_100680DDC()
{
}

void sub_100680E08(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134218240;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = 60;
  sub_100241D4C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Received SCO data size %zu is less than required size for PLC %d bytes",  (uint8_t *)a1);
}

void sub_100680E54()
{
}

void sub_100680EB8()
{
}

void sub_100680F1C()
{
}

void sub_100680F7C()
{
}

void sub_100680FE0()
{
}

void sub_100681044()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8149e-34);
  sub_100201740((void *)&_mh_execute_header, v7, v8, "Could not get handsfree device from '%s'", v9);
  sub_10007B3CC();
}

void sub_10068108C()
{
}

void sub_1006810B8()
{
}

void sub_100681118()
{
}

void sub_100681144()
{
}

void sub_100681170()
{
}

void sub_1006811D0()
{
}

void sub_100681230()
{
}

void sub_100681294()
{
}

void sub_1006812F4()
{
}

void sub_100681354()
{
}

void sub_1006813B8()
{
}

void sub_100681418()
{
}

void sub_100681444()
{
}

void sub_100681470()
{
}

void sub_10068149C()
{
}

void sub_1006814C8()
{
}

void sub_1006814F4()
{
}

void sub_100681554()
{
}

void sub_1006815B4()
{
}

void sub_100681614()
{
}

void sub_100681674()
{
}

void sub_1006816D4()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "Could not find valid RFCOMM channel in SDP record of device %{public}s",  v9);
  sub_10007B3CC();
}

void sub_10068171C()
{
}

void sub_10068177C(int a1)
{
  LODWORD(sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received SCO data size %zu is less than %d bytes, drop the packet", v3) = 67109376;
  HIDWORD(sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received SCO data size %zu is less than %d bytes, drop the packet", v3) = a1;
  sub_100478554();
  sub_100241CF0( (void *)&_mh_execute_header,  v1,  v2,  "Failed to connect handsfree profile on channel %d with result %{bluetooth:OI_STATUS}u",  v3);
  sub_10003BE20();
}

void sub_1006817E4(unsigned __int16 a1)
{
  LODWORD(sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received SCO data size %zu is less than %d bytes, drop the packet", v3) = 67109376;
  HIDWORD(sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received SCO data size %zu is less than %d bytes, drop the packet", v3) = a1;
  sub_100478554();
  sub_100241CF0( (void *)&_mh_execute_header,  v1,  v2,  "Failed to disconnect handsfree profile on handle %d with result %{bluetooth:OI_STATUS}u",  v3);
  sub_10003BE20();
}

void sub_100681850(unsigned __int16 a1)
{
  LODWORD(sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received SCO data size %zu is less than %d bytes, drop the packet", v3) = 67109376;
  HIDWORD(sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received SCO data size %zu is less than %d bytes, drop the packet", v3) = a1;
  sub_100478554();
  sub_100241CF0( (void *)&_mh_execute_header,  v1,  v2,  "Failed to disconnect Handsfree AoS on handle %d with result %{bluetooth:OI_STATUS}u",  v3);
  sub_10003BE20();
}

void sub_1006818BC()
{
}

void sub_100681920()
{
}

void sub_100681984()
{
}

void sub_1006819E4(char a1)
{
  uint64_t v1 = "accept";
  if ((a1 & 1) == 0) {
    uint64_t v1 = "deny";
  }
  int v3 = 136446466;
  uint64_t v4 = v1;
  sub_100478580();
  sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Failed to %{public}s connection with result %{bluetooth:OI_STATUS}u",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100681A6C()
{
}

void sub_100681AB4()
{
}

void sub_100681AE0()
{
}

void sub_100681B28(_DWORD *a1, int a2)
{
  *a1 = 136446466;
  sub_100478590((uint64_t)a1, a2, (uint64_t)"NULL");
  sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received handsfree disconnection event for device %{public}s with result %{bluetooth:OI_STATUS}u",  v3);
}

void sub_100681B6C()
{
}

void sub_100681BB4()
{
}

void sub_100681C14(uint64_t a1, os_log_s *a2)
{
  int v3 = *(_DWORD *)(a1 + 8);
  int v2 = *(_DWORD *)(a1 + 12);
  v4[0] = 67109376;
  v4[1] = v2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Received response error %{bluetooth:OI_STATUS}u while sending response %d - disconnecting immediately",  (uint8_t *)v4,  0xEu);
  sub_10003BE20();
}

void sub_100681C94(uint64_t a1, os_log_s *a2)
{
  int v3 = a1;
  sub_10045F408(a1, a1);
  sub_100110E98();
  int v6 = v3;
  sub_100241D4C((void *)&_mh_execute_header, a2, v4, "Unsupported Handsfree AoS codec ID - %s (%d)", v5);
}

void sub_100681D1C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "!addr.isZero()";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100681D90()
{
}

void sub_100681DF4(_DWORD *a1)
{
  LODWORD(sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received SCO data size %zu is less than %d bytes, drop the packet", v3) = 67109376;
  HIDWORD(sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received SCO data size %zu is less than %d bytes, drop the packet", v3) = *a1;
  sub_100478554();
  sub_100241CF0( (void *)&_mh_execute_header,  v1,  v2,  "HandsfreeEvent processing for event %d failed with result code - %{bluetooth:OI_STATUS}u",  v3);
  sub_10003BE20();
}

void sub_100681E60()
{
}

void sub_100681EC0(_DWORD *a1, int a2)
{
  *a1 = 136446466;
  sub_100478590((uint64_t)a1, a2, (uint64_t)"NULL");
  sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Received audio connection failure event for device %{public}s with result %{bluetooth:OI_STATUS}u",  v3);
}

void sub_100681F04()
{
}

void sub_100681F30()
{
}

void sub_100681F5C()
{
}

void sub_100681FBC()
{
}

void sub_10068201C(char a1, os_log_s *a2)
{
  uint64_t v2 = "disabled";
  if ((a1 & 1) != 0) {
    uint64_t v2 = "enabled";
  }
  int v3 = 136446210;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Device state is null, not setting voice command to %{public}s",  (uint8_t *)&v3,  0xCu);
  sub_10003BE20();
}

void sub_1006820A4()
{
}

void sub_100682104()
{
}

void sub_100682130(uint64_t a1, int a2)
{
  *(void *)(sub_1003802A0(a1, a2, 1.5047e-36) + 10) = "NULL";
  sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Audio disconnection failed %{bluetooth:OI_STATUS}u - disconnecting device %{public}s",  v3);
}

void sub_100682174()
{
}

void sub_1006821BC(uint64_t a1, int a2)
{
  *(void *)(sub_1003802A0(a1, a2, 1.5047e-36) + 10) = "NULL";
  sub_100241D4C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "Audio Creation failed %{bluetooth:OI_STATUS}u - %{public}s",  v3);
}

void sub_100682200()
{
}

void sub_100682248()
{
}

void sub_1006822AC()
{
}

void sub_1006822D8()
{
}

void sub_100682304()
{
}

void sub_100682330()
{
}

void sub_100682390()
{
}

void sub_1006823BC()
{
}

void sub_1006823E8()
{
}

void sub_100682448()
{
}

void sub_1006824A8()
{
}

void sub_1006824D4()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "Ignoring release held calls event as we are still in call setup state %{public}s",  v9);
  sub_10007B3CC();
}

void sub_10068251C()
{
}

void sub_100682548()
{
}

void sub_100682574()
{
}

void sub_1006825A0()
{
}

void sub_1006825CC()
{
}

void sub_1006825F8()
{
}

void sub_100682624()
{
}

void sub_100682684()
{
}

void sub_1006826CC()
{
}

void sub_100682714()
{
}

void sub_100682774()
{
}

void sub_1006827D4()
{
}

void sub_100682834()
{
}

void sub_100682860()
{
}

void sub_10068288C()
{
}

void sub_1006828B8()
{
}

void sub_1006828E4()
{
}

void sub_100682910()
{
}

void sub_100682970()
{
}

void sub_1006829D0()
{
}

void sub_100682A30()
{
}

void sub_100682A90()
{
}

void sub_100682AF0()
{
}

void sub_100682B50()
{
}

void sub_100682BB4()
{
}

void sub_100682BE0()
{
}

void sub_100682C0C()
{
}

void sub_100682C38()
{
}

void sub_100682C9C()
{
}

void sub_100682CC8()
{
}

void sub_100682CF4()
{
}

void sub_100682D20()
{
}

void sub_100682D88()
{
}

void sub_100682DE8()
{
}

void sub_100682E48()
{
}

void sub_100682E74()
{
}

void sub_100682ED4()
{
}

void sub_100682F00(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "parseHFPDescriptor L2CAP signal channel not found", a1);
}

void sub_100682F34(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "parseHFPDescriptor L2CAP signal channel not found for HandsfreeAoS",  a1);
}

void sub_100682F68()
{
}

void sub_100682F94()
{
}

void sub_100682FC0()
{
}

void sub_100682FEC()
{
}

void sub_100683018()
{
}

void sub_100683044()
{
}

void sub_1006830A8(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Reached maximum attempts (%d) to establish HandsfreeAoS call",  (uint8_t *)v1,  8u);
  sub_100029870();
}

void sub_100683120(uint64_t a1, void *a2)
{
  uint64_t v4 = (os_log_s *)qword_1008F7598;
  os_log_type_enabled((os_log_t)qword_1008F7598, OS_LOG_TYPE_FAULT);
  int v6 = 134217984;
  uint64_t v7 = 24LL;
  sub_10024EF4C((void *)&_mh_execute_header, v4, v5, "Could not allocate %lu bytes", (uint8_t *)&v6);
  *a2 = *(void *)(*(void *)a1 + 32LL);
}

void sub_1006831D0()
{
}

void sub_100683230()
{
}

void sub_100683290()
{
}

void sub_1006832F0()
{
}

void sub_100683328()
{
}

void sub_100683388(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Failed to read local device hostname - using default %s",  (uint8_t *)a2);
}

void sub_1006833C4()
{
}

void sub_100683430(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = &_xpc_error_connection_invalid;
  sub_1000BC000((void *)&_mh_execute_header, a1, a3, "Cloudpairing: XPC server error: %@", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_1006834A4()
{
}

void sub_1006834D0()
{
}

void sub_1006834FC()
{
}

void sub_100683560()
{
}

void sub_1006835C4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = &off_1008C2B70;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "XPC Version Check failure, received version: %@, current version: %@",  (uint8_t *)&v2,  0x16u);
  sub_10003BE20();
}

void sub_100683648(_BYTE *a1, _BYTE *a2)
{
}

void sub_100683674(_BYTE *a1, _BYTE *a2)
{
}

void sub_1006836A0(_BYTE *a1, _BYTE *a2)
{
}

void sub_1006836CC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000((void *)&_mh_execute_header, a3, (uint64_t)a3, "Cloudpairing got invalid type: %s", (uint8_t *)a2);
}

void sub_100683708()
{
}

void sub_100683768()
{
  __int16 v3 = 2160;
  uint64_t v4 = 1752392040LL;
  __int16 v5 = 2113;
  uint64_t v6 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "CloudPairing: No XPC connection to send message: %@ - %{private, mask.hash}@",  v2,  0x20u);
}

void sub_1006837FC()
{
}

void sub_100683828(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100683860(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100683898(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1006838D0()
{
}

void sub_1006838FC()
{
}

void sub_10068395C()
{
}

void sub_1006839BC()
{
}

void sub_100683A1C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100683A84()
{
}

void sub_100683AB0()
{
}

void sub_100683ADC()
{
}

void sub_100683B3C()
{
}

void sub_100683B68()
{
}

void sub_100683BCC()
{
}

void sub_100683BF8()
{
}

void sub_100683C24()
{
}

void sub_100683C50()
{
}

void sub_100683C7C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100683CB0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[BTVCLinkScanner] Update payload filter data to %@, mask %@\n",  (uint8_t *)&v3,  0x16u);
}

void sub_100683D34()
{
}

void sub_100683D60()
{
}

void sub_100683D8C()
{
}

void sub_100683DB8()
{
}

void sub_100683DE4()
{
}

void sub_100683E44()
{
}

void sub_100683EA4(uint64_t a1, int a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446466;
  *(void *)(a1 + 4) = "NULL";
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a2;
  sub_100241D4C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Unplugging virtual cable to device %{public}s failed with status %d",  (uint8_t *)a1);
}

void sub_100683EF4()
{
}

void sub_100683F3C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100683FAC()
{
}

void sub_10068400C()
{
}

void sub_10068406C()
{
}

void sub_1006840CC()
{
}

void sub_10068412C()
{
}

void sub_100684158()
{
  __int16 v3 = 2082;
  uint64_t v4 = v0;
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Received SUSPEND for untracked handle %d with reason %{public}s, Returning.",  v2);
  sub_10003BE20();
}

void sub_1006841F0()
{
}

void sub_100684250()
{
}

void sub_1006842B0()
{
}

void sub_100684314()
{
}

void sub_100684374()
{
}

void sub_1006843D4()
{
}

void sub_100684400()
{
}

void sub_100684464()
{
}

void sub_1006844C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100684534()
{
}

void sub_100684598()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "Handshake failed to complete on device %{public}s, disconnecting",  v4);
  sub_10007B3CC();
}

void sub_1006845E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100684658()
{
}

void sub_1006846B8()
{
}

void sub_10068471C()
{
}

void sub_100684748()
{
}

void sub_1006847A8()
{
}

void sub_100684808()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "Failed to lookup HID Host handle for device %{public}s",  v4);
  sub_10007B3CC();
}

void sub_100684858( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006848C4()
{
}

void sub_10068490C()
{
}

void sub_10068496C()
{
}

void sub_100684998()
{
}

void sub_1006849F8()
{
}

void sub_100684A24()
{
}

void sub_100684A50()
{
}

void sub_100684AB0()
{
}

void sub_100684ADC()
{
}

void sub_100684B08()
{
}

void sub_100684B68()
{
}

void sub_100684B94()
{
}

void sub_100684BC0()
{
}

void sub_100684C20(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "rdar://problem/66432832 attempting to cache descriptorSize: %u",  (uint8_t *)v2,  8u);
}

void sub_100684C94(_BYTE *a1, _BYTE *a2)
{
}

void sub_100684CBC(_BYTE *a1, _BYTE *a2)
{
}

void sub_100684CE4()
{
}

void sub_100684D10(void *a1, char a2, os_log_s *a3)
{
  uint64_t v3 = (void *)*a1;
  if ((a2 & 1) == 0) {
    uint64_t v3 = a1;
  }
  int v4 = 136446210;
  uint64_t v5 = v3;
  sub_100201740((void *)&_mh_execute_header, a2, a3, "Session attach for %{public}s failed", (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_100684D84()
{
}

void sub_100684DBC(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = a1;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Ran out of handles for session %{public}s!", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100684E24()
{
}

void sub_100684E50()
{
}

void sub_100684E7C()
{
}

void sub_100684EA8(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136446210;
  *(void *)(a1 + 4) = "(NULL)";
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Ran out of handles for session %{public}s!", (uint8_t *)a1);
}

void sub_100684EE8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740((void *)&_mh_execute_header, v7, v8, "Ran out of handles for session %{public}s!", v9);
  sub_10007B3CC();
}

void sub_100684F30()
{
}

void sub_100684F5C(uint64_t a1, os_log_s *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Trying to add BTHandle : %p which is same as our LocalDevice handle %p",  (uint8_t *)&v2,  0x16u);
  sub_10003BE20();
}

void sub_100684FD8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "Session %{public}s already exists in SessionProcessIdentifierMap",  v9);
  sub_10007B3CC();
}

void sub_100685020()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "Session %{public}s is not present in SessionProcessIdentifierMap",  v9);
  sub_10007B3CC();
}

void sub_100685068()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "Session %{public}s already exists in SessionManagedConfigOverrideMap",  v9);
  sub_10007B3CC();
}

void sub_1006850B0()
{
}

void sub_1006850DC()
{
}

void sub_100685108()
{
}

void sub_100685134()
{
}

void sub_100685164()
{
}

void sub_1006851C4()
{
}

void sub_100685224()
{
}

void sub_100685250()
{
}

void sub_10068527C()
{
  LOWORD(sub_100241CF0( (void *)&_mh_execute_header,  v0,  v1,  "Failed to enable HID Latency Statistics for connection handle 0x%02x with result %d",  v2, v3) = 2048;
  *(void *)((char *)&v3 + 2) = v0;
  sub_100298B7C( (void *)&_mh_execute_header,  v0,  v1,  "Fail to load Bitrate Configs, out of range (%u of %lu).",  v2,  (void)v3);
  sub_10003BE20();
}

void sub_1006852EC()
{
}

void sub_100685318()
{
}

void sub_100685344()
{
}

void sub_100685370()
{
}

void sub_10068539C(uint64_t a1, os_log_s *a2)
{
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  int v7 = 136315138;
  os_log_t v8 = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v3,  "Device %s, does not exist in AudioLinkManagerDevices something went wrong",  (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_100685448()
{
}

void sub_100685474()
{
}

void sub_1006854A0()
{
}

void sub_1006854CC(unint64_t *a1, uint64_t a2, os_log_s *a3)
{
}

void sub_10068555C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "Failed to create filepath at %@ to capture tailspin",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_1006855C4(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Failed to open file descriptor to capture tailspin: %@",  (uint8_t *)a2);
}

void sub_100685610(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Trying to save tailspin %@", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100685678()
{
}

void sub_1006856E4()
{
}

void sub_100685748()
{
}

void sub_100685774(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "Audio Timesync: Remote device no longer available: %llx ",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_1006857E0(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1004B91DC((void *)&_mh_execute_header, a3, (uint64_t)a3, "A2DP Link Adaptive invalid", a1);
}

void sub_100685814()
{
}

void sub_100685874()
{
}

void sub_1006858D4()
{
}

void sub_100685950()
{
}

void sub_1006859B0()
{
}

void sub_100685A10()
{
}

void sub_100685A74()
{
}

void sub_100685AD4()
{
}

void sub_100685B34()
{
}

void sub_100685B94()
{
  LOWORD(sub_100241CF0((void *)&_mh_execute_header, v0, v1, "Failed to set diversity mode %d on handle %d", v2, v3) = 1024;
  HIWORD(sub_100241CF0((void *)&_mh_execute_header, v0, v1, "Failed to set diversity mode %d on handle %d", v2, v3) = v0;
  sub_100241CF0( (void *)&_mh_execute_header,  v0,  v1,  "Device orientation set to %d, but failed to set diversity antenna to %d",  v2,  v3);
  sub_10003BE20();
}

void sub_100685C04()
{
}

void sub_100685C64()
{
}

void sub_100685C90()
{
  sub_100029860((void *)&_mh_execute_header, v0, v1, "BundleID does not exist, return default", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100685CBC()
{
}

void sub_100685CE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100685D58(uint64_t a1, uint64_t a2)
{
  id v4 = sub_1004C2F40(a1, a2);
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  sub_100110EAC((void *)&_mh_execute_header, v5, v6, "Link state is stalled for device %@");

  sub_10009878C();
}

void sub_100685DA0(uint64_t a1, uint64_t a2)
{
  id v4 = sub_1004C2F40(a1, a2);
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  sub_100110EAC((void *)&_mh_execute_header, v5, v6, "Protocol state is stalled for device %@");

  sub_10009878C();
}

void sub_100685DE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100685E58(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "LEA Start Stream failed %{bluetooth:OI_STATUS}u",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_100685EC8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100685F38(id *a1, os_log_s *a2)
{
  id v3 = sub_1004C2F54(a1);
  int v5 = 141558275;
  uint64_t v6 = 1752392040LL;
  __int16 v7 = 2113;
  id v8 = v3;
  sub_10020603C( (void *)&_mh_execute_header,  a2,  v4,  "MFi authentication timed out for device %{private, mask.hash}@",  (uint8_t *)&v5);

  sub_10002B724();
}

void sub_100685FCC()
{
}

void sub_100685FF8()
{
}

void sub_100686024(unsigned __int8 a1, unsigned __int16 a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Sending 'error (%u/%u)'",  (uint8_t *)v3,  0xEu);
  sub_10003BE20();
}

void sub_1006860AC()
{
}

void sub_1006860D8()
{
}

void sub_100686104(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "LEA RX Audio: %lubytes received",  (uint8_t *)&v2,  0xCu);
  sub_10003BE20();
}

void sub_100686174(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "Invalid audio playload of size %lu received, Trigger PLC",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_1006861DC()
{
}

void sub_100686208(id *a1, os_log_s *a2)
{
  id v3 = sub_1004C2F54(a1);
  int v5 = 138412290;
  id v6 = v3;
  sub_1000BC000((void *)&_mh_execute_header, a2, v4, "Device %@ supports neither output nor input", (uint8_t *)&v5);

  sub_10002B724();
}

void sub_100686288()
{
}

void sub_1006862B4()
{
}

void sub_1006862E0()
{
}

void sub_10068630C()
{
}

void sub_100686338()
{
}

void sub_100686364(void *a1, char *a2, uint64_t a3, os_log_s *a4)
{
  if (a2[23] >= 0) {
    uint8_t v6 = a2;
  }
  else {
    uint8_t v6 = *(char **)a2;
  }
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + 14) = v6;
  sub_10020603C( (void *)&_mh_execute_header,  a4,  a3,  "Magnet link disconnect from %{public}@ does not match connected magnet %s",  (uint8_t *)a3);
  if (a2[23] < 0) {
    operator delete(*(void **)a2);
  }
}

void sub_1006863E8(_xpc_connection_s *a1, os_log_s *a2)
{
  v3[0] = 67109120;
  v3[1] = xpc_connection_get_pid(a1);
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Received connection to BTAudio.xpc from unknown client pid %d, ignoring",  (uint8_t *)v3,  8u);
  sub_10003BE20();
}

void sub_100686470( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006864D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100686538(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "(fCodec->bitsPerSample == 4) || (fCodec->bitsPerSample == 6)";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_1006865AC(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "sample2Index < fCodec->bytesPerFrame";
  sub_10024EF4C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Assertion failed: %{public}s", a1);
}

void sub_1006865F0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "fAudioBuffer.getFillLevel() == fCodec->bytesPerFrame";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100686664()
{
}

void sub_100686690(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Insufficient Buffer Length: %d",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_100686700( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100686768()
{
}

void sub_1006867CC()
{
}

void sub_100686830()
{
}

void sub_100686890(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "status != OI_STATUS_WRITE_IN_PROGRESS";
  sub_10024EF4C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Assertion failed: %{public}s", a1);
}

void sub_1006868D4()
{
}

void sub_100686904(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "fAudioBuffer.getSentLevel() == 0";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100686978(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "numPacketsForFrameMinus1 <= 0x03";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_1006869EC()
{
}

void sub_100686A18()
{
}

void sub_100686A80()
{
}

void sub_100686AE8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100686B50(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "fAudioBuffer.getFillLevel() == fCodec->bytesPerFrame * 2";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100686BC4(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "Can't send invalid audio buffers", a1);
}

void sub_100686BF8(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "numPacketsForFrameMinus1: %d",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_100686C68()
{
}

void sub_100686CC8(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = 20161219;
  sub_100241D04( (void *)&_mh_execute_header,  a2,  a3,  "CoreBluetooth version %d differs from bluetoothd version %d",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_100686D44(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136446210;
  __int16 v4 = a2;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Duplicate XPC check-in from session %{public}s",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100686DBC()
{
}

void sub_100686E1C()
{
}

void sub_100686E48()
{
  sub_100029860( (void *)&_mh_execute_header,  v0,  v1,  "CBDebugCommandResolveLERandomAddressWithIRK ignoring bad inputs, returning 0",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100686E74()
{
}

void sub_100686EA0()
{
}

void sub_100686ECC()
{
}

void sub_100686EF8(uint64_t a1, int a2, os_log_s *a3)
{
  uint64_t v4 = (void *)(a1 + 56);
  uint64_t v5 = @"CBBTErrorReasonAdvertisingWatchNotFoundInternal";
  if (!a2) {
    uint64_t v5 = @"CBBTErrorReasonUnknownInternal";
  }
  uint8_t v6 = v5;
  int v8 = 136446466;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v6;
  sub_10020603C( (void *)&_mh_execute_header,  a3,  v7,  "BT Problem reported. Session:%{public}s reason:%@",  (uint8_t *)&v8);
}

void sub_100686FC0()
{
}

void sub_100686FEC(uint64_t a1)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  sub_1004F5A80();
  sub_10020603C((void *)&_mh_execute_header, v1, (uint64_t)v1, "unknown resource key:%@ subkey:%@", (uint8_t *)&v2);
  sub_10003BE20();
}

void sub_10068705C()
{
}

void sub_100687088(uint64_t a1, os_log_s *a2)
{
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  int v7 = 136315138;
  int v8 = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v3,  "session %s is not allowed to queryBluetoothStatus",  (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_100687138()
{
}

void sub_100687164()
{
}

void sub_100687190()
{
}

void sub_1006871F0()
{
}

void sub_10068721C()
{
}

void sub_10068727C()
{
}

void sub_1006872A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1006872FC()
{
}

void sub_100687328()
{
}

void sub_100687354()
{
}

void sub_100687380(uint64_t *a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  uint64_t v4 = *a1;
  *(_DWORD *)a2 = 134218242;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = v4;
  sub_10020603C( (void *)&_mh_execute_header,  a4,  a3,  "incomingAddress address buffer is invalid[%lu bytes] from %@",  (uint8_t *)a2);
}

void sub_1006873D0()
{
}

void sub_100687430()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8149e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "session %s is not allowed to request stable address", v8);
  sub_10007B3CC();
}

void sub_10068747C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8149e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "session %s is not allowed to request next address rotation time",  v8);
  sub_10007B3CC();
}

void sub_1006874C8()
{
}

void sub_1006874F4()
{
}

void sub_100687554()
{
}

void sub_1006875B4()
{
}

void sub_1006875E0()
{
}

void sub_100687640()
{
}

void sub_1006876A0()
{
}

void sub_1006876CC()
{
}

void sub_1006876F8(uint64_t a1)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  sub_1004F5A80();
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Temporary IRK for device  %@, missing IRK %@",  (uint8_t *)&v2,  0x16u);
  sub_10003BE20();
}

void sub_100687770()
{
}

void sub_10068779C()
{
}

void sub_1006877FC()
{
}

void sub_10068785C()
{
}

void sub_100687888()
{
  sub_10007B3CC();
}

void sub_1006878DC()
{
  sub_10007B3CC();
}

void sub_100687930()
{
}

void sub_100687990()
{
}

void sub_1006879BC()
{
}

void sub_1006879E8(_BYTE *a1, _BYTE *a2)
{
}

void sub_100687A14()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8149e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "session %s is not allowed to set LE AFH map ", v8);
  sub_10007B3CC();
}

void sub_100687A60()
{
  if (v6 >= 0) {
    int v7 = v1;
  }
  else {
    int v7 = (void *)*v1;
  }
  *(_DWORD *)uint64_t v2 = 67109378;
  *(_DWORD *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 8) = 2080;
  *(void *)(v2 + 10) = v7;
  sub_100241D4C( (void *)&_mh_execute_header,  v5,  v3,  "Failed to set connection AFH Map status=%{bluetooth:OI_STATUS}u for session %s",  v4);
  sub_10007B3CC();
}

void sub_100687AC4()
{
  *(_WORD *)(v4 + 12) = 1024;
  *(_DWORD *)(v4 + 14) = 5;
  *(_WORD *)(v4 + 18) = 2080;
  *(void *)(v4 + 20) = v5;
  sub_1004F5A90( (void *)&_mh_execute_header,  "Ignoring LE AFH map of %ld bytes (needs to be %d bytes) from session %s",  v6,  v7);
  sub_10007B3CC();
}

void sub_100687B24()
{
}

void sub_100687B84()
{
}

void sub_100687BE4()
{
}

void sub_100687C44()
{
}

void sub_100687CA4()
{
}

void sub_100687D04()
{
}

void sub_100687D64()
{
}

void sub_100687DC4()
{
}

void sub_100687E24()
{
}

void sub_100687E84()
{
}

void sub_100687EE4()
{
}

void sub_100687F44()
{
}

void sub_100687FA4()
{
}

void sub_100688004()
{
}

void sub_100688064()
{
}

void sub_1006880C4()
{
}

void sub_100688124()
{
}

void sub_100688184()
{
}

void sub_1006881E4()
{
}

void sub_100688244()
{
}

void sub_1006882A4()
{
}

void sub_100688304()
{
}

void sub_100688364()
{
}

void sub_1006883C4()
{
}

void sub_100688424()
{
}

void sub_100688484()
{
}

void sub_1006884E4()
{
}

void sub_100688544()
{
}

void sub_1006885A4()
{
}

void sub_100688604()
{
}

void sub_100688664()
{
}

void sub_1006886C4()
{
}

void sub_100688724()
{
}

void sub_100688784()
{
}

void sub_1006887E4()
{
}

void sub_100688844()
{
}

void sub_1006888A4()
{
}

void sub_100688904()
{
}

void sub_100688964()
{
}

void sub_1006889C4()
{
}

void sub_100688A24()
{
}

void sub_100688A84()
{
}

void sub_100688AE4()
{
}

void sub_100688B44(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  sub_10020603C( (void *)&_mh_execute_header,  a4,  a3,  "Blob length (%zu) or mask length(%zu) size are not supported for handleAddAdvancedMatchingRuleWithAddressMsg",  (uint8_t *)a1);
}

void sub_100688B90()
{
}

void sub_100688BBC()
{
}

void sub_100688BE8()
{
}

void sub_100688C48()
{
}

void sub_100688CA8()
{
}

void sub_100688D08()
{
}

void sub_100688D68()
{
}

void sub_100688DC8()
{
}

void sub_100688E28()
{
}

void sub_100688E88()
{
}

void sub_100688EB4()
{
}

void sub_100688EE0()
{
}

void sub_100688F40()
{
}

void sub_100688F6C()
{
}

void sub_100688FCC()
{
}

void sub_10068902C()
{
}

void sub_10068908C()
{
}

void sub_1006890B8()
{
}

void sub_100689118()
{
}

void sub_100689144()
{
}

void sub_100689170()
{
}

void sub_10068919C()
{
}

void sub_1006891FC(unsigned __int16 a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 67109376;
  *(_DWORD *)(a2 + 4) = 10;
  *(_WORD *)(a2 + 8) = 1024;
  *(_DWORD *)(a2 + 10) = a1;
  sub_100241D04( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Error for handleCsCreateConfigMsg. Channel map can't be greater than %d currently at: %d",  (uint8_t *)a2);
}

void sub_10068924C()
{
}

void sub_1006892AC()
{
}

void sub_1006892D8()
{
}

void sub_100689338()
{
}

void sub_100689364()
{
}

void sub_1006893C4()
{
}

void sub_1006893F0()
{
}

void sub_100689450()
{
}

void sub_10068947C()
{
}

void sub_1006894DC()
{
}

void sub_100689508()
{
}

void sub_100689568()
{
}

void sub_100689594()
{
}

void sub_1006895F4()
{
}

void sub_100689654()
{
}

void sub_1006896B4()
{
}

void sub_100689714()
{
}

void sub_100689774()
{
}

void sub_1006897D4()
{
}

void sub_100689834( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006898A0()
{
}

void sub_100689900()
{
}

void sub_100689960()
{
}

void sub_1006899C0()
{
}

void sub_100689A20()
{
}

void sub_100689A4C()
{
  int v2 = 134218242;
  uint64_t v3 = v0;
  sub_1004F5A80();
  sub_10020603C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "connection handle %p for device %@ is invalud",  (uint8_t *)&v2);
  sub_10003BE20();
}

void sub_100689ABC()
{
}

void sub_100689B1C()
{
}

void sub_100689B48()
{
}

void sub_100689B74()
{
}

void sub_100689BA0()
{
}

void sub_100689BCC()
{
}

void sub_100689BF8()
{
}

void sub_100689C24()
{
}

void sub_100689C50()
{
}

void sub_100689C7C()
{
}

void sub_100689CA8()
{
}

void sub_100689CD4()
{
}

void sub_100689D00()
{
}

void sub_100689D2C()
{
}

void sub_100689D58()
{
}

void sub_100689DB8()
{
}

void sub_100689E18()
{
}

void sub_100689E44(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a2 = 138412802;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(void *)(a2 + 14) = a3;
  *(_WORD *)(a2 + 22) = 1024;
  *(_DWORD *)(a2 + sub_100207EF8(v1 + 24) = 1024;
  sub_1004F5A90( (void *)&_mh_execute_header,  "Could not store custom property %@, value is longer than maximum permitted (string is %lu, max allowed is %d)",  (uint8_t *)a2,  a4);
}

void sub_100689E98()
{
}

void sub_100689EC4()
{
}

void sub_100689EF0()
{
}

void sub_100689F1C()
{
}

void sub_100689F48()
{
}

void sub_100689FA8()
{
}

void sub_10068A00C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8149e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "session %s is not allowed to change LE power control ",  v8);
  sub_10007B3CC();
}

void sub_10068A058()
{
  __int16 v3 = 2080;
  char v4 = "handlesetLePowerControlMsg";
  sub_100241D4C((void *)&_mh_execute_header, v0, v1, "Failed to convertXpcObject  uint64_t result = %d, function=%s", v2);
  sub_10003BE20();
}

void sub_10068A0D0()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "Failed to convertXpcObject kCBMsgArgOptions = %d",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10068A130()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Someone is accessing handle 0x%04x on device %@, but we don't have the service for it! ಠ_ಠ",  v2);
  sub_10003BE20();
}

void sub_10068A1A8()
{
}

void sub_10068A208()
{
}

void sub_10068A268(uint64_t a1, void *a2, uint64_t a3, os_log_s *a4)
{
  id v7 = a2;
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "Overriding address with Invalid address string %@ (%@)",  (uint8_t *)a3,  0x16u);
}

void sub_10068A2E4(_BYTE *a1, _BYTE *a2)
{
}

void sub_10068A310(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)uint64_t buf = 67109120;
  *a2 = 20;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "service data cannot exceed %d bytes",  buf,  8u);
}

void sub_10068A358()
{
}

void sub_10068A384()
{
}

void sub_10068A3B0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 134349056;
  *(void *)(a1 + 4) = a2;
  sub_1000BC000((void *)&_mh_execute_header, a3, (uint64_t)a3, "TDS data too short %{public}zu", (uint8_t *)a1);
}

void sub_10068A3EC()
{
}

void sub_10068A418(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "XPC object is not an dictionary (type is %{public}@)",  (uint8_t *)a2);
}

void sub_10068A454(void *a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = a1;
  sub_10020603C( (void *)&_mh_execute_header,  a4,  a3,  "Possible XPC delay of %llu ms in XPCLeAttConnection::handleAdvertising, with advertisement: %@",  (uint8_t *)a2);

  sub_10007B3CC();
}

void sub_10068A4AC(void *a1, os_log_s *a2)
{
}

void sub_10068A51C()
{
}

void sub_10068A57C()
{
}

void sub_10068A5E0()
{
}

void sub_10068A60C()
{
}

void sub_10068A638()
{
}

void sub_10068A6A8()
{
}

void sub_10068A6D4()
{
}

void sub_10068A700()
{
}

void sub_10068A760()
{
}

void sub_10068A7C0()
{
}

void sub_10068A7EC()
{
}

void sub_10068A850()
{
}

void sub_10068A87C()
{
  __int16 v3 = 1024;
  int v4 = v0;
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Failed to set GAP name for device %@ due to error %d",  v2);
  sub_10003BE20();
}

void sub_10068A8F0()
{
}

void sub_10068A91C()
{
}

void sub_10068A948()
{
}

void sub_10068A974()
{
}

void sub_10068A9A0()
{
}

void sub_10068A9CC()
{
}

void sub_10068AA2C()
{
}

void sub_10068AA58()
{
}

void sub_10068AA84()
{
}

void sub_10068AAB0()
{
}

void sub_10068AADC()
{
}

void sub_10068AB08()
{
}

void sub_10068AB34()
{
}

void sub_10068AB60()
{
}

void sub_10068AB8C()
{
}

void sub_10068ABB8()
{
}

void sub_10068ABE4()
{
}

void sub_10068AC10()
{
}

void sub_10068AC3C()
{
}

void sub_10068AC68()
{
}

void sub_10068AC94()
{
}

void sub_10068ACC0()
{
}

void sub_10068ACEC()
{
}

void sub_10068AD18()
{
}

void sub_10068AD44()
{
}

void sub_10068AD70()
{
}

void sub_10068AD9C(_BYTE *a1, _BYTE *a2)
{
}

void sub_10068ADC8()
{
  *(_WORD *)(v4 + 12) = 2080;
  *(void *)(v4 + 14) = v5;
  sub_10020603C( (void *)&_mh_execute_header,  v8,  v6,  "createXpcAdvData error device:%@ address:%s, invalid length, not enough room for the len field.",  v7);
  sub_10007B3CC();
}

void sub_10068AE1C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068AE8C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068AEFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068AF6C()
{
}

void sub_10068AF98( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068B00C()
{
}

void sub_10068B038()
{
}

void sub_10068B064(uint64_t a1, os_log_s *a2)
{
  if (v5 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  *(_DWORD *)uint64_t buf = 136446210;
  id v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Can't start scan for %{public}s since Scan is running already",  buf,  0xCu);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10068B114()
{
}

void sub_10068B140()
{
}

void sub_10068B16C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068B1E0()
{
}

BOOL sub_10068B20C( os_log_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return *a2 == 0LL;
}

void sub_10068B298()
{
}

void sub_10068B2C4()
{
}

void sub_10068B2F0()
{
}

void sub_10068B31C()
{
}

void sub_10068B348()
{
}

void sub_10068B374()
{
}

void sub_10068B3A0(char *a1, uint64_t a2, os_log_s *a3)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = v4;
  sub_1000BC000((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unable to find HID device %s to remove", (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10068B408()
{
}

void sub_10068B434(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  else {
    uint64_t v3 = (uint64_t *)*a1;
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Failed to Send Link Key to device %s", (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_10068B4AC()
{
}

void sub_10068B4D8()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100029870();
}

void sub_10068B538()
{
}

void sub_10068B564(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "USB Pairing: Invalid context (%p) / device (%p)\n",  (uint8_t *)&v3,  0x16u);
  sub_10003BE20();
}

void sub_10068B5E4()
{
}

void sub_10068B610(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Unable to find bluetooth device for iohid ref %p", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10068B678()
{
}

void sub_10068B6A4()
{
}

void sub_10068B704()
{
}

void sub_10068B764()
{
}

void sub_10068B790(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown CB MsgID %d", (uint8_t *)v2, 8u);
}

void sub_10068B804(int a1, os_log_s *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 20161219;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "CoreBluetooth version %d differs from bluetoothd version %d",  (uint8_t *)v2,  0xEu);
}

void sub_10068B88C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Ignoring mismatched check-in from client %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10068B900()
{
}

void sub_10068B92C()
{
}

void sub_10068B958()
{
}

void sub_10068B984( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068B9E8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068BA4C()
{
}

void sub_10068BA78()
{
}

void sub_10068BAD8()
{
}

void sub_10068BB38(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)uint64_t buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Currently tracking apple types: %{public}@",  buf,  0xCu);
}

void sub_10068BB8C()
{
}

void sub_10068BBB8()
{
}

void sub_10068BBE4()
{
}

void sub_10068BC10( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068BC74()
{
}

void sub_10068BCA0()
{
}

void sub_10068BCCC()
{
}

void sub_10068BCF8()
{
}

void sub_10068BD24(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "index < fSize";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Assertion failed: %{public}s",  (uint8_t *)&v1,  0xCu);
}

void sub_10068BDA4()
{
}

void sub_10068BDD0()
{
}

void sub_10068BE30()
{
}

void sub_10068BE90()
{
}

void sub_10068BEF0()
{
}

void sub_10068BF50()
{
}

void sub_10068BFB0()
{
}

void sub_10068BFDC()
{
}

void sub_10068C008()
{
}

void sub_10068C034()
{
}

void sub_10068C060()
{
}

void sub_10068C08C()
{
}

void sub_10068C0EC()
{
}

void sub_10068C14C()
{
}

void sub_10068C1AC()
{
}

void sub_10068C1D8()
{
}

void sub_10068C204()
{
}

void sub_10068C230()
{
}

void sub_10068C25C()
{
}

void sub_10068C288()
{
}

void sub_10068C2B4()
{
}

void sub_10068C2E0(int *a1)
{
  do
  {
    a1 -= 8;
  }

  while (a1 != dword_1008F1190);
}

void sub_10068C320( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068C354( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068C388()
{
}

void sub_10068C3E8()
{
}

void sub_10068C448()
{
}

void sub_10068C474()
{
}

void sub_10068C4D4()
{
}

void sub_10068C534()
{
}

void sub_10068C594()
{
}

void sub_10068C5F4()
{
}

void sub_10068C654()
{
}

void sub_10068C6B4()
{
}

void sub_10068C714()
{
}

void sub_10068C774()
{
}

void sub_10068C7D4()
{
}

void sub_10068C834()
{
}

void sub_10068C894()
{
}

void sub_10068C8F4()
{
}

void sub_10068C954()
{
}

void sub_10068C9B4()
{
}

void sub_10068CA14()
{
}

void sub_10068CA74()
{
}

void sub_10068CAD4()
{
}

void sub_10068CB00()
{
}

void sub_10068CB60()
{
}

void sub_10068CBC0()
{
}

void sub_10068CC20()
{
}

void sub_10068CC80()
{
}

void sub_10068CCE0()
{
}

void sub_10068CD40()
{
}

void sub_10068CDA0()
{
}

void sub_10068CE00()
{
}

void sub_10068CE60()
{
}

void sub_10068CEC0()
{
}

void sub_10068CF20()
{
}

void sub_10068CF80()
{
}

void sub_10068CFE0()
{
}

void sub_10068D040()
{
}

void sub_10068D0A0()
{
}

void sub_10068D100()
{
}

void sub_10068D160()
{
}

void sub_10068D198()
{
}

void sub_10068D1F8()
{
}

void sub_10068D258()
{
}

void sub_10068D2B8()
{
}

void sub_10068D318()
{
}

void sub_10068D378()
{
}

void sub_10068D3D8()
{
}

void sub_10068D438()
{
}

void sub_10068D498()
{
}

void sub_10068D4F8()
{
}

void sub_10068D558()
{
}

void sub_10068D5B8()
{
}

void sub_10068D618()
{
}

void sub_10068D678()
{
}

void sub_10068D6D8()
{
}

void sub_10068D738()
{
}

void sub_10068D798()
{
}

void sub_10068D7F8()
{
}

void sub_10068D858()
{
}

void sub_10068D8B8()
{
}

void sub_10068D918()
{
}

void sub_10068D978()
{
}

void sub_10068D9D8()
{
}

void sub_10068DA38()
{
}

void sub_10068DA98()
{
}

void sub_10068DAF8()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "BTAccessoryMsgHandler::handleBTAccessorySpatialAudioAllowedMsg accessoryManagerID:%llx, spatial mode is %llu",  v2,  0x16u);
  sub_10003BE20();
}

void sub_10068DB74()
{
  __int16 v2 = 1024;
  int v3 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "BTAccessoryMsgHandler::handleBTAccessoryGetSpatialAudioAllowedMsg accessoryManagerID:%llx, , spatial mode is %d",  v1,  0x12u);
  sub_10003BE20();
}

void sub_10068DBEC()
{
}

void sub_10068DC4C()
{
}

void sub_10068DCAC()
{
}

void sub_10068DD0C()
{
}

void sub_10068DD6C()
{
}

void sub_10068DDCC()
{
}

void sub_10068DE2C()
{
}

void sub_10068DE8C()
{
}

void sub_10068DEEC()
{
}

void sub_10068DF4C()
{
}

void sub_10068DFAC()
{
}

void sub_10068E00C()
{
}

void sub_10068E06C()
{
}

void sub_10068E0CC()
{
}

void sub_10068E12C()
{
}

void sub_10068E18C()
{
}

void sub_10068E1EC()
{
}

void sub_10068E24C()
{
}

void sub_10068E2AC()
{
}

void sub_10068E30C()
{
}

void sub_10068E36C()
{
}

void sub_10068E3B0()
{
}

void sub_10068E3F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068E464()
{
}

void sub_10068E4C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068E534()
{
}

void sub_10068E560()
{
}

void sub_10068E58C()
{
}

void sub_10068E5B8()
{
}

void sub_10068E618()
{
}

void sub_10068E678()
{
}

void sub_10068E6D8()
{
}

void sub_10068E738()
{
}

void sub_10068E798()
{
}

void sub_10068E7F8()
{
}

void sub_10068E858()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "device %{public}s not found", v8);
  sub_10007B3CC();
}

void sub_10068E8A4()
{
}

void sub_10068E904()
{
}

void sub_10068E964()
{
}

void sub_10068E9C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068EA34()
{
}

void sub_10068EA94(uint64_t *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_10068EB20()
{
}

void sub_10068EB80( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068EBF0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068EC60(uint64_t *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_10068ECEC()
{
}

void sub_10068ED4C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068EDBC()
{
}

void sub_10068EE1C()
{
}

void sub_10068EE7C()
{
}

void sub_10068EEDC()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "device %{public}s not found. Dropping", v8);
  sub_10007B3CC();
}

void sub_10068EF28(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_10068EFB4()
{
}

void sub_10068F014(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_10068F0A0()
{
}

void sub_10068F100(uint64_t a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_10068F18C()
{
}

void sub_10068F1EC()
{
}

void sub_10068F230()
{
}

void sub_10068F290()
{
}

void sub_10068F2D4(uint64_t *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_10068F360()
{
}

void sub_10068F3A4()
{
}

void sub_10068F3E8()
{
}

void sub_10068F414()
{
}

void sub_10068F440()
{
}

void sub_10068F46C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "parseAVRCPDescriptor L2CAP signal channel not found", a1);
}

void sub_10068F4A0(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "parseAVRCPDescriptor L2CAP browse channel not found", a1);
}

void sub_10068F4D4()
{
}

void sub_10068F500()
{
}

void sub_10068F52C()
{
}

void sub_10068F558()
{
}

void sub_10068F5B8()
{
}

void sub_10068F618()
{
}

void sub_10068F644()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "Failed to start Classic SMP Pairing, no key derivation, classic pairing is done. (status=%d)",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10068F6A4()
{
}

void sub_10068F6D0()
{
}

void sub_10068F6FC()
{
}

void sub_10068F728()
{
}

void sub_10068F754()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "We already have OOB data for device %{public}s, aborting pincode pairing",  v9);
  sub_10007B3CC();
}

void sub_10068F79C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "We already have OOB data for device %{public}s, aborting numeric comparison pairing",  v9);
  sub_10007B3CC();
}

void sub_10068F7E4()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "We already have OOB data for device %{public}s, aborting passkey pairing",  v9);
  sub_10007B3CC();
}

void sub_10068F82C()
{
}

void sub_10068F858()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740((void *)&_mh_execute_header, v7, v8, "Pairing timedout, request for device %{public}s not found", v9);
  sub_10007B3CC();
}

void sub_10068F8A0()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740( (void *)&_mh_execute_header,  v7,  v8,  "Reached pairing timeout for pending attempt with device %{public}s",  v9);
  sub_10007B3CC();
}

void sub_10068F8E8()
{
}

void sub_10068F914(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)uint64_t buf = 136315394;
  *(void *)(buf + 4) = "setPincode";
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Rejecting Pairing Request because PIN code length is %zu",  buf,  0x16u);
}

void sub_10068F96C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740((void *)&_mh_execute_header, v7, v8, "No authentification request found for device %{public}s", v9);
  sub_10007B3CC();
}

void sub_10068F9B4()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740((void *)&_mh_execute_header, v7, v8, "No pending pairing attempts for device %{public}s", v9);
  sub_10007B3CC();
}

void sub_10068F9FC(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136446210;
  *(void *)(a1 + 4) = "NULL";
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Pairing failure reported for device %{public}s", (uint8_t *)a1);
}

void sub_10068FA3C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_100201740((void *)&_mh_execute_header, v7, v8, "Pairing failure reported for device %{public}s", v9);
  sub_10007B3CC();
}

void sub_10068FA84(uint64_t a1, os_log_s *a2)
{
  if (v6 >= 0) {
    char v4 = __p;
  }
  else {
    char v4 = (void **)__p[0];
  }
  int v7 = 136446210;
  os_log_t v8 = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v3,  "Unpairing device %{public}s - failed as stack is not running",  (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10068FB30()
{
}

void sub_10068FB5C(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100201740((void *)&_mh_execute_header, a2, a3, "LE device for addr %@ does not exist", (uint8_t *)a2);

  sub_10007B3CC();
}

void sub_10068FBA0()
{
}

void sub_10068FC00(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 136446466;
  *(void *)&v3[4] = a1;
  *(_WORD *)&uint8_t v3[12] = 2082;
  *(void *)&v3[14] = a2;
  sub_10026076C( (void *)&_mh_execute_header,  a2,  a3,  "XPC service %{public}s server error: %{public}s",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_10003BE20();
}

void sub_10068FC70(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 136446466;
  *(void *)&v3[4] = a1;
  *(_WORD *)&uint8_t v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_10026076C( (void *)&_mh_execute_header,  a2,  a3,  "Unexpected XPC service %{public}s server event: %{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_10003BE20();
}

void sub_10068FCE0(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "it != fClientInfoMap.end()";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Assertion failed: %{public}s",  (uint8_t *)&v1,  0xCu);
  sub_10003BE20();
}

void sub_10068FD5C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068FD8C()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "OI_SECMGR_ReadLocalOobExtendedData returned %d",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10068FDEC()
{
  sub_10008651C((void *)&_mh_execute_header, v0, v1, "OI_SECMGR_ReadLocalOobData returned %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10068FE4C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10068FE7C()
{
}

void sub_10068FEDC()
{
}

void sub_10068FF3C()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "OI_HCI_ReadEncryptionKeySize failed: returned %{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10068FF9C()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Encryption key size for device %{private,bluetooth:BD_ADDR,mask.hash}.6P is %u",  v2,  0x22u);
  sub_1002E56F8();
}

void sub_100690018()
{
}

void sub_100690078( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006900AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006900E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100690158( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006901BC()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Failed to set MTU to %d with result %{bluetooth:OI_STATUS}u",  v2,  0xEu);
  sub_10003BE20();
}

void sub_10069023C(uint64_t a1)
{
  id v1 = sub_100549FE8(a1);
  sub_10008C484();
  sub_100089F1C((void *)&_mh_execute_header, v2, v3, "No primary services found on device %@", v4, v5, v6, v7, v8);

  sub_10002B724();
}

void sub_1006902B4(uint64_t a1)
{
  id v7 = sub_100549FE8(a1);
  sub_100549FC4( (void *)&_mh_execute_header,  v1,  v2,  "No characteristics found in range [0x%04x, 0x%04x] on device %@",  v3,  v4,  v5,  v6,  2u);

  sub_100360E9C();
}

void sub_100690354()
{
  id v1 = sub_100549FD8(v0);
  sub_100549FA0();
  sub_100549FC4( (void *)&_mh_execute_header,  v2,  v3,  "No characteristic value could be read at handle 0x%04x on device %@ - result was %{bluetooth:OI_STATUS}u",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_1006903CC(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894( (void *)&_mh_execute_header,  v3,  v4,  "Couldn't find characteristic at handle 0x%04x on device %@",  v5,  v6,  v7,  v8,  v9);

  sub_100360E9C();
}

void sub_100690444()
{
}

void sub_1006904A8(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894( (void *)&_mh_execute_header,  v3,  v4,  "Handle 0x%04x is not a characteristic on device %@",  v5,  v6,  v7,  v8,  v9);

  sub_100360E9C();
}

void sub_100690520(char *a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  if (a1[23] >= 0) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = *(char **)a1;
  }
  int v8 = *(unsigned __int16 *)(a2 + 64);
  int v9 = *(unsigned __int16 *)(a2 + 66);
  id v10 = *(id *)(a2 + 16);
  *(_DWORD *)a3 = 136446978;
  *(void *)(a3 + 4) = v7;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v8;
  *(_WORD *)(a3 + 18) = 1024;
  *(_DWORD *)(a3 + 20) = v9;
  *(_WORD *)(a3 + sub_100207EF8(v1 + 24) = 2112;
  *(void *)(a3 + 26) = v10;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "No characteristic values with UUID %{public}s could be read in range [0x%04x, 0x%04x] on device %@",  (uint8_t *)a3,  0x22u);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1006905E8()
{
  id v1 = sub_100549FD8(v0);
  sub_100549FA0();
  sub_100549FC4( (void *)&_mh_execute_header,  v2,  v3,  "No characteristic value could be read at handle 0x%04x on device %@ - result was %{bluetooth:OI_STATUS}u",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_100690660()
{
  id v1 = sub_100549FD8(v0);
  sub_100549FA0();
  sub_100549FC4( (void *)&_mh_execute_header,  v2,  v3,  "No descriptor could be read at handle 0x%04x on device %@ - result was %{bluetooth:OI_STATUS}u",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_1006906D8()
{
  id v1 = sub_100549FD8(v0);
  sub_100549FA0();
  sub_100549FC4( (void *)&_mh_execute_header,  v2,  v3,  "Failed to write characteristic value at handle 0x%04x on device %@ - result was %{bluetooth:OI_STATUS}u",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_10069074C()
{
  id v1 = sub_100549FD8(v0);
  sub_100549FA0();
  sub_100549FC4( (void *)&_mh_execute_header,  v2,  v3,  "Failed to write long characteristic value at handle 0x%04x on device %@ - result was %{bluetooth:OI_STATUS}u",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_1006907C0()
{
  id v1 = sub_100549FD8(v0);
  sub_100549FA0();
  sub_100549FC4( (void *)&_mh_execute_header,  v2,  v3,  "Failed to write descriptor at handle 0x%04x on device %@ - result was %{bluetooth:OI_STATUS}u",  v4,  v5,  v6,  v7,  v8);

  sub_100360E9C();
}

void sub_100690834(uint64_t a1)
{
  id v1 = sub_100549FE8(a1);
  sub_10008C484();
  sub_100089F1C( (void *)&_mh_execute_header,  v2,  v3,  "Failed to locate GAP device name characteristic on device %@",  v4,  v5,  v6,  v7,  v8);

  sub_10002B724();
}

void sub_1006908AC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100690910(uint64_t a1)
{
  id v1 = sub_100549FE8(a1);
  sub_10008C484();
  sub_100089F1C( (void *)&_mh_execute_header,  v2,  v3,  "Failed to locate GAP primary service on device %@",  v4,  v5,  v6,  v7,  v8);

  sub_10002B724();
}

void sub_100690988(uint64_t a1)
{
  id v1 = sub_100549FE8(a1);
  sub_10008C484();
  sub_100089F1C( (void *)&_mh_execute_header,  v2,  v3,  "Failed to locate GAP primary service on device %@",  v4,  v5,  v6,  v7,  v8);

  sub_10002B724();
}

void sub_100690A00(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894( (void *)&_mh_execute_header,  v3,  v4,  "Unable to find service for characteristic handle 0x%04x on device %@",  v5,  v6,  v7,  v8,  v9);

  sub_100360E9C();
}

void sub_100690A78(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894((void *)&_mh_execute_header, v3, v4, "Couldn't find handle 0x%04x on device %@", v5, v6, v7, v8, v9);

  sub_100360E9C();
}

void sub_100690AF0(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894( (void *)&_mh_execute_header,  v3,  v4,  "Couldn't find characteristic at handle 0x%04x on device %@",  v5,  v6,  v7,  v8,  v9);

  sub_100360E9C();
}

void sub_100690B68(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894( (void *)&_mh_execute_header,  v3,  v4,  "Characteristic at handle 0x%04x does not support notifications or indications on device %@",  v5,  v6,  v7,  v8,  v9);

  sub_100360E9C();
}

void sub_100690BE0(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894( (void *)&_mh_execute_header,  v3,  v4,  "Handle 0x%04x is not a characteristic on device %@",  v5,  v6,  v7,  v8,  v9);

  sub_100360E9C();
}

void sub_100690C58(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894((void *)&_mh_execute_header, v3, v4, "Couldn't find handle 0x%04x on device %@", v5, v6, v7, v8, v9);

  sub_100360E9C();
}

void sub_100690CD0(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894( (void *)&_mh_execute_header,  v3,  v4,  "Couldn't find characteristic at handle 0x%04x on device %@",  v5,  v6,  v7,  v8,  v9);

  sub_100360E9C();
}

void sub_100690D48(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894( (void *)&_mh_execute_header,  v3,  v4,  "Characteristic at handle 0x%04x does not support notifications or indications on device %@",  v5,  v6,  v7,  v8,  v9);

  sub_100360E9C();
}

void sub_100690DC0(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894( (void *)&_mh_execute_header,  v3,  v4,  "Handle 0x%04x is not a characteristic on device %@",  v5,  v6,  v7,  v8,  v9);

  sub_100360E9C();
}

void sub_100690E38(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894((void *)&_mh_execute_header, v3, v4, "Couldn't find handle 0x%04x on device %@", v5, v6, v7, v8, v9);

  sub_100360E9C();
}

void sub_100690EB0()
{
}

void sub_100690F14()
{
}

void sub_100690F78(uint64_t a1, uint64_t a2)
{
  id v2 = sub_100549F90(a1, a2);
  sub_100549F78();
  sub_100084894( (void *)&_mh_execute_header,  v3,  v4,  "Handle 0x%04x is not a characteristic on device %@",  v5,  v6,  v7,  v8,  v9);

  sub_100360E9C();
}

void sub_100690FF0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100691060( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006910D0(uint64_t a1)
{
  id v1 = sub_100549FE8(a1);
  sub_10008C484();
  sub_100089F1C( (void *)&_mh_execute_header,  v2,  v3,  "Failed to locate GAP primary service on device %@",  v4,  v5,  v6,  v7,  v8);

  sub_10002B724();
}

void sub_100691148(uint64_t a1)
{
  id v1 = sub_100549FE8(a1);
  sub_10008C484();
  sub_100089F1C( (void *)&_mh_execute_header,  v2,  v3,  "Failed to locate GAP primary service on device %@",  v4,  v5,  v6,  v7,  v8);

  sub_10002B724();
}

void sub_1006911C0(uint64_t a1)
{
  id v1 = sub_100549FE8(a1);
  sub_10008C484();
  sub_100089F1C( (void *)&_mh_execute_header,  v2,  v3,  "Failed to locate GAP reconnection characteristic handle on device %@",  v4,  v5,  v6,  v7,  v8);

  sub_10002B724();
}

void sub_100691238(uint64_t a1)
{
  id v1 = sub_100549FE8(a1);
  sub_10008C484();
  sub_100089F1C( (void *)&_mh_execute_header,  v2,  v3,  "Failed to locate GATT primary service on device %@",  v4,  v5,  v6,  v7,  v8);

  sub_10002B724();
}

void sub_1006912B0(uint64_t a1)
{
}

void sub_1006912C4()
{
}

void sub_100691324()
{
}

void sub_100691384()
{
}

void sub_1006913E4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100691450()
{
}

void sub_10069147C()
{
}

void sub_1006914A8()
{
}

void sub_100691508(char *a1, uint64_t a2, os_log_s *a3)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)a2 = 136446210;
  *(void *)(a2 + 4) = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Wireless IAP Service is not supported by device %{public}s",  (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100691570(char a1, int a2, os_log_t log)
{
  uint64_t v3 = "accept";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "deny";
  }
  int v4 = 136446466;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to %{public}s connection attempt - result was %{bluetooth:OI_STATUS}u",  (uint8_t *)&v4,  0x12u);
}

void sub_10069160C()
{
}

void sub_100691638(uint64_t a1, os_log_s *a2)
{
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  int v7 = 136446210;
  uint8_t v8 = v4;
  sub_1000BC000((void *)&_mh_execute_header, a2, v3, "Failed to open serial port for device %{public}s", (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1006916E4()
{
}

void sub_100691710()
{
}

void sub_10069173C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "WiAPProfile::connectedCfm: Endpoint %@ doesn't exist",  (uint8_t *)&v3);
}

void sub_1006917A8()
{
}

void sub_1006917D4()
{
}

void sub_100691800()
{
}

void sub_10069182C()
{
}

void sub_10069188C()
{
}

void sub_1006918EC(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100494168((void *)&_mh_execute_header, (int)a2, a3, "Invalid format", a1);
}

void sub_10069191C(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Num frames to send (%d) exceeds maximum frame count (%d)",  (uint8_t *)v3,  0xEu);
}

void sub_1006919A0()
{
}

void sub_1006919CC()
{
}

void sub_100691A2C()
{
}

void sub_100691A8C()
{
}

void sub_100691AB8()
{
}

void sub_100691AF0()
{
}

void sub_100691B50(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)uint64_t buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to redact HID reports for device %@",  buf,  0xCu);
}

void sub_100691BA4()
{
}

void sub_100691C04()
{
}

void sub_100691C30(char a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)uint64_t buf = 67109376;
  *((_DWORD *)buf + 1) = a1 & 1;
  *((_WORD *)buf + 4) = 2048;
  *(void *)(buf + 10) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "MIDI: ff %d, midi %p", buf, 0x12u);
}

void sub_100691C88()
{
  sub_100029860( (void *)&_mh_execute_header,  v0,  v1,  "MIDI: should notify builtin service returned false - No AutoConnect",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100691CB4()
{
}

void sub_100691D14()
{
}

void sub_100691D4C()
{
}

void sub_100691DAC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100691E1C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100691E8C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100691EFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100691F6C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100691FDC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069204C()
{
}

void sub_1006920AC()
{
}

void sub_1006920D8()
{
}

void sub_100692138()
{
}

void sub_100692198()
{
}

void sub_1006921F8(unsigned __int16 a1, unsigned __int16 a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Received service changed notification for [0x%04x;0x%04x] for an unknown device. Ignoring.",
    (uint8_t *)v3,
    0xEu);
  sub_10003BE20();
}

void sub_100692280(uint64_t a1, char *a2, uint8_t *buf, os_log_t log)
{
  if (a2[23] >= 0) {
    int v5 = a2;
  }
  else {
    int v5 = *(char **)a2;
  }
  *(_DWORD *)uint64_t buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2082;
  *(void *)(buf + 14) = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Dropping notification from device %{public}@ of non-characteristic value attribute %{public}s",  buf,  0x16u);
  if (a2[23] < 0) {
    operator delete(*(void **)a2);
  }
}

void sub_100692300()
{
}

void sub_100692360()
{
}

void sub_10069238C()
{
}

void sub_1006923EC()
{
}

void sub_100692418()
{
  sub_10008651C((void *)&_mh_execute_header, v0, v1, "ReadTransmitPowerLevel returned error %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_100692478()
{
}

void sub_1006924A4()
{
}

void sub_100692504()
{
}

void sub_100692564()
{
}

void sub_100692590()
{
  sub_100065B48( (void *)&_mh_execute_header,  v0,  v1,  "handleSimulateLocationUpdateMsg: countryString = %@",  v2,  v3,  v4,  v5,  v6);
  sub_10003BE20();
}

void sub_1006925F0()
{
}

void sub_100692650()
{
}

void sub_1006926B0()
{
}

void sub_100692710()
{
}

void sub_100692770()
{
}

void sub_10069279C()
{
}

void sub_1006927FC()
{
}

void sub_100692828()
{
}

void sub_100692888()
{
}

void sub_1006928B4()
{
}

void sub_100692914()
{
}

void sub_100692940()
{
}

void sub_1006929A0()
{
}

void sub_1006929CC()
{
}

void sub_100692A44()
{
}

void sub_100692AA4()
{
}

void sub_100692B04()
{
}

void sub_100692B64()
{
}

void sub_100692BC4()
{
}

void sub_100692BF0()
{
}

void sub_100692C1C()
{
}

void sub_100692C84()
{
}

void sub_100692CB0()
{
}

void sub_100692D18()
{
}

void sub_100692D78()
{
}

void sub_100692DD8()
{
}

void sub_100692E38()
{
}

void sub_100692E98()
{
}

void sub_100692EF8()
{
  HIWORD(sub_100241CF0((void *)&_mh_execute_header, v0, v1, "Failed to set BT diversity antenna to Ant%d on handle %d", v2, v3) = v0;
  sub_100241CF0((void *)&_mh_execute_header, v0, v1, "Error invalid endEntry (%d) or startEntry (%d) ", v2, v3);
  sub_10003BE20();
}

void sub_100692F5C()
{
}

void sub_100692FBC()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100029870();
}

void sub_10069301C()
{
}

void sub_10069307C()
{
}

void sub_1006930DC()
{
}

void sub_10069313C()
{
}

void sub_10069319C()
{
}

void sub_1006931FC()
{
}

void sub_10069325C()
{
}

void sub_1006932BC()
{
}

void sub_10069331C()
{
}

void sub_10069337C()
{
}

void sub_1006933DC()
{
}

void sub_100693408()
{
}

void sub_100693468()
{
}

void sub_100693494()
{
}

void sub_1006934F4()
{
}

void sub_100693520()
{
}

void sub_100693580()
{
}

void sub_1006935E0()
{
}

void sub_100693640()
{
  int v2 = 3;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "Error in HRB Set AFH Host Channel Classification message numberOfGroups is invalid: %d(shall be <= %d)",  v1,  0xEu);
  sub_10003BE20();
}

void sub_1006936B4()
{
}

void sub_100693714()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Error in HRB Set AFH Host Channel Classification message channel map size is invalid: %zu (shall be %d)",  v2,  0x12u);
  sub_10003BE20();
}

void sub_100693790()
{
}

void sub_1006937F0()
{
}

void sub_100693850()
{
}

void sub_1006938B0()
{
}

void sub_100693910()
{
}

void sub_100693970()
{
}

void sub_1006939D0()
{
}

void sub_100693A30()
{
}

void sub_100693A5C()
{
}

void sub_100693A88()
{
}

void sub_100693AE8()
{
}

void sub_100693B48()
{
}

void sub_100693BA8()
{
}

void sub_100693C08()
{
}

void sub_100693C68()
{
}

void sub_100693C94()
{
}

void sub_100693CF4()
{
}

void sub_100693D20()
{
}

void sub_100693D80()
{
}

void sub_100693DAC()
{
}

void sub_100693E0C()
{
}

void sub_100693E38()
{
}

void sub_100693E98()
{
}

void sub_100693EC4()
{
}

void sub_100693F24()
{
}

void sub_100693F50()
{
}

void sub_100693FB0()
{
}

void sub_100693FDC()
{
}

void sub_10069403C()
{
}

void sub_10069409C()
{
}

void sub_1006940FC()
{
}

void sub_10069415C()
{
}

void sub_1006941BC()
{
}

void sub_10069421C()
{
}

void sub_10069427C()
{
}

void sub_1006942DC()
{
}

void sub_10069433C()
{
}

void sub_10069439C()
{
}

void sub_1006943C8(unsigned __int16 a1, os_log_s *a2)
{
  v2[0] = 67109632;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 210;
  __int16 v5 = 1024;
  int v6 = 250;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error: Unexpected File size %d; Expected File size %d or %d, Exiting\n",
    (uint8_t *)v2,
    0x14u);
  sub_10003BE20();
}

void sub_100694458()
{
}

void sub_100694484()
{
}

void sub_1006944B0()
{
}

void sub_1006944DC()
{
}

void sub_10069453C()
{
}

void sub_10069459C()
{
}

void sub_1006945FC()
{
}

void sub_100694628()
{
}

void sub_100694688()
{
  sub_10002B708((void *)&_mh_execute_header, v0, v1, "Unable to open, file path=%s\n", v2, v3, v4, v5, v6);
  sub_10003BE20();
}

void sub_1006946E8()
{
  sub_10002B708((void *)&_mh_execute_header, v0, v1, "EOF found, file path=%s\n", v2, v3, v4, v5, v6);
  sub_10003BE20();
}

void sub_100694748()
{
}

void sub_100694774(os_log_s *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "loadFile: Error Reading File Stat: errno = %d\n",  (uint8_t *)v3,  8u);
  sub_10003BE20();
}

void sub_1006947FC()
{
}

void sub_10069485C()
{
}

void sub_100694888()
{
}

void sub_1006948E8()
{
}

void sub_100694948()
{
}

void sub_1006949A8(uint64_t a1, os_log_s *a2)
{
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  int v7 = 136446210;
  uint8_t v8 = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v3,  "Already not advertising data for session %{public}s",  (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_100694A50()
{
}

void sub_100694AB0()
{
  sub_100241CF0((void *)&_mh_execute_header, v0, v1, "setLEAdvTxPowerIncrease disable on handle %d returned %d", v2, v3);
  sub_10003BE20();
}

void sub_100694B10()
{
  sub_100241CF0((void *)&_mh_execute_header, v0, v1, "btleTxAdvTrigTimeStamp disable on handle %d returned %d", v2, v3);
  sub_10003BE20();
}

void sub_100694B70()
{
  int v3 = 0;
  sub_1002BDC00( (void *)&_mh_execute_header,  v0,  v1,  "updateAdvertisement currentState:%{public}s, trying again in %dms",  v2);
  sub_10003BE20();
}

void sub_100694BF8()
{
}

void sub_100694C24()
{
}

void sub_100694C50()
{
}

void sub_100694CB0()
{
}

void sub_100694D10(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = "YES";
  int v4 = *(unsigned __int8 *)(a2 + 16945);
  if ((a1 & 1) != 0) {
    uint64_t v5 = "YES";
  }
  else {
    uint64_t v5 = "NO";
  }
  int v6 = 136446722;
  int v7 = v5;
  __int16 v8 = 2082;
  if (!v4) {
    uint64_t v3 = "NO";
  }
  uint8_t v9 = v3;
  __int16 v10 = 2082;
  int v11 = "NO";
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "updateAdvertisement deferred:%{public}s fDeferringUpdateAdvertisingState:%{public}s fAddressChangeInProgress:%{public}s",  (uint8_t *)&v6,  0x20u);
}

void sub_100694DC4()
{
}

void sub_100694DF4()
{
}

void sub_100694E50()
{
  sub_100241CF0((void *)&_mh_execute_header, v0, v1, "setLEAdvTxPowerIncrease enable on handle %d returned %d", v2, v3);
  sub_10003BE20();
}

void sub_100694EB0()
{
}

void sub_100694F10()
{
  sub_100241CF0((void *)&_mh_execute_header, v0, v1, "btleTxAdvTrigTimeStamp enable on handle %d returned %d", v2, v3);
  sub_10003BE20();
}

void sub_100694F70()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "SPMI Debug Control spmiDebugVSEControl returned %d",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100694FD0()
{
}

void sub_100695030()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "Already advertising data for session %{public}s", v8);
  sub_10007B3CC();
}

void sub_10069507C()
{
}

void sub_1006950AC()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_10057DAB8((void *)&_mh_execute_header, v7, v8, "Pushing session %{public}s to the front of the line", v9);
  sub_10007B3CC();
}

void sub_1006950F4()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "LeBroadcaster::_LE_GAP_ParseAppleManufacturingData returned %d",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100695154(char a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "LeBroadcaster::sendAppleManufacturingPayloadMetrics called with start:%d",  (uint8_t *)v2,  8u);
  sub_100029870();
}

void sub_1006951C8()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_10057DAB8((void *)&_mh_execute_header, v7, v8, "Removing session %{public}s from the line", v9);
  sub_10007B3CC();
}

void sub_100695210()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Already not advertising data for session %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10069525C()
{
}

void sub_1006952BC()
{
}

void sub_10069531C()
{
}

void sub_100695354(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1004B91DC( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Extended advertising for background advertising is disabled",  a1);
}

void sub_100695388(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1004B91DC((void *)&_mh_execute_header, a3, (uint64_t)a3, "We dont support extended advertising", a1);
}

void sub_1006953BC()
{
}

void sub_1006953E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100695454( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006954C0()
{
}

void sub_100695518()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_10057DAB8((void *)&_mh_execute_header, v7, v8, "Session %{public}s does not support backgrounding", v9);
  sub_10007B3CC();
}

void sub_100695560()
{
  int v3 = v0;
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Advertising failed to %{public}s with result %{bluetooth:OI_STATUS}u",  v2);
  sub_10003BE20();
}

void sub_1006955E8()
{
}

void sub_100695614( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10008651C( (void *)&_mh_execute_header,  a2,  a3,  "fControllerMaxExtendedAdvertisingPayloadSize=%d",  a5,  a6,  a7,  a8,  0);
  sub_100029870();
}

void sub_10069567C()
{
}

void sub_1006956DC()
{
}

void sub_10069573C()
{
  sub_10008651C((void *)&_mh_execute_header, v0, v1, "LE_GAP_OverrideLocalAddress returned %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10069579C()
{
}

void sub_1006957C8()
{
}

void sub_1006957F4()
{
}

void sub_100695820()
{
}

void sub_10069584C()
{
}

void sub_100695878()
{
}

void sub_1006958A4()
{
}

void sub_1006958D0()
{
}

void sub_1006958FC()
{
}

void sub_100695928()
{
}

void sub_100695954()
{
}

void sub_100695980()
{
}

void sub_1006959E0()
{
}

void sub_100695A0C()
{
}

void sub_100695A38(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = qword_1008F7748;
  sub_10002B724();
}

void sub_100695AD4(_BYTE *a1, _BYTE *a2)
{
}

void sub_100695B00(_BYTE *a1, _BYTE *a2)
{
}

void sub_100695B2C(_BYTE *a1, _BYTE *a2)
{
}

void sub_100695B58(_BYTE *a1, _BYTE *a2)
{
}

void sub_100695B84()
{
}

void sub_100695BE4()
{
}

void sub_100695C68()
{
}

void sub_100695CC8()
{
}

void sub_100695D28(_BYTE *a1, _BYTE *a2)
{
}

void sub_100695D54()
{
}

void sub_100695DD8()
{
}

void sub_100695E38()
{
}

void sub_100695E98()
{
}

void sub_100695EF8()
{
}

void sub_100695F58()
{
}

void sub_100695FB8()
{
}

void sub_100696018()
{
}

void sub_100696078()
{
}

void sub_1006960D8()
{
}

void sub_100696138()
{
}

void sub_100696198()
{
}

void sub_1006961F8()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000((void *)&_mh_execute_header, v3, (uint64_t)v3, "No fast connect device found for %{public}s", v4);
  sub_10007B3CC();
}

void sub_100696248()
{
}

void sub_100696280(_BYTE *a1, _BYTE *a2)
{
}

void sub_1006962AC()
{
}

void sub_10069630C()
{
}

void sub_10069636C()
{
}

void sub_1006963E4()
{
}

void sub_100696444()
{
}

void sub_100696470( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = 136315138;
  uint64_t v11 = sub_1001EDE10(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  sub_1000BC000((void *)&_mh_execute_header, a2, v9, "Failed to find PFC device for address: %s", (uint8_t *)&v10);
  sub_10002B724();
}

void sub_1006964EC()
{
}

void sub_100696518( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100696580()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000((void *)&_mh_execute_header, v3, (uint64_t)v3, "Device %{public}s has empty UUID", v4);
  sub_10007B3CC();
}

void sub_1006965D0()
{
}

void sub_100696630()
{
}

void sub_100696690()
{
}

void sub_1006966BC()
{
}

void sub_1006966E8()
{
}

void sub_100696748()
{
}

void sub_100696774()
{
}

void sub_1006967D4(unsigned __int16 a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  int v4 = *(unsigned __int16 *)(a2 + 36);
  *(_DWORD *)uint64_t buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "L2CAP channel info local CID %d local MTU %d",  buf,  0xEu);
}

void sub_100696830()
{
}

void sub_100696890()
{
}

void sub_1006968BC()
{
}

void sub_10069691C()
{
}

void sub_100696964()
{
}

void sub_100696990()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "Not responding to echo request from %s, as PFC already in progress",  v4);
  sub_10007B3CC();
}

void sub_1006969E0(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Failed to get address from handle %p", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100696A48()
{
}

void sub_100696A74()
{
}

void sub_100696AA0(uint64_t *a1, int a2, os_log_s *a3)
{
  uint64_t v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  sub_100241D4C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "fastConnectEchoRspEvent NULL channel result %d channel %p",  (uint8_t *)v4);
  sub_10003BE20();
}

void sub_100696B1C()
{
}

void sub_100696B7C()
{
}

void sub_100696BDC()
{
}

void sub_100696C3C()
{
}

void sub_100696C9C()
{
}

void sub_100696CFC()
{
}

void sub_100696D5C()
{
}

void sub_100696DC0()
{
}

void sub_100696E24()
{
}

void sub_100696E88()
{
}

void sub_100696EEC()
{
}

void sub_100696F4C()
{
}

void sub_100696FAC()
{
}

void sub_10069700C()
{
}

float sub_10069706C(unsigned __int16 a1, unsigned __int16 a2, os_log_t log)
{
  v4[0] = 67109888;
  v4[1] = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  __int16 v7 = 1024;
  int v8 = 120;
  __int16 v9 = 1024;
  int v10 = 100;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "maxInterval:%d is smaller than minInterval:%d Use default maxInterval %d and minInterval %d LeConnectionLatencyMedium",  (uint8_t *)v4,  0x1Au);
  return result;
}

void sub_10069710C()
{
}

void sub_10069716C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  id v4 = sub_1005BFB9C(a1);
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1005BF6EC();
  sub_100241D4C( (void *)&_mh_execute_header,  a3,  v6,  "Failed to add address %{public}@ to filter accept list with status:%d, restarting",  v7);

  sub_100360E9C();
}

void sub_1006971F8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  id v4 = sub_1005BFB9C(a1);
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1005BF6EC();
  sub_100241D4C( (void *)&_mh_execute_header,  a3,  v6,  "Failed to remove address %{public}@ from filter accept list with status:%d, restarting",  v7);

  sub_100360E9C();
}

void sub_100697284()
{
}

void sub_1006972E8()
{
  int v3 = 0;
  __int16 v4 = v0;
  int v5 = 0xFFFF;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Overriding LEInstantFactor with a value %u out side range min %u max %d.",  v2,  0x14u);
  sub_10003BE20();
}

void sub_100697364()
{
}

void sub_1006973C4()
{
}

void sub_100697424()
{
}

void sub_100697484()
{
}

void sub_1006974E4()
{
}

void sub_100697544()
{
}

void sub_1006975A4()
{
}

void sub_100697604()
{
}

void sub_100697630()
{
}

void sub_100697690()
{
}

void sub_1006976BC()
{
}

void sub_10069771C()
{
}

void sub_100697748()
{
}

void sub_100697774()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "failed to cancel a connection. This should not happen, file a radar ! status=%{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_1006977D4()
{
}

void sub_100697854()
{
}

void sub_1006978B4()
{
}

void sub_1006978FC()
{
}

void sub_10069795C()
{
}

void sub_1006979BC()
{
}

void sub_100697A1C()
{
}

void sub_100697A64()
{
}

void sub_100697AC8()
{
}

void sub_100697B2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100697B9C()
{
}

void sub_100697BFC()
{
}

void sub_100697C5C()
{
}

void sub_100697CC0()
{
}

void sub_100697CEC()
{
}

void sub_100697D4C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100295790((void *)&_mh_execute_header, a1, a3, "aopRssiDetectEvent: Event size=%d", a5, a6, a7, a8, 0);
  sub_100029870();
}

void sub_100697DB8(const unsigned __int8 *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100697E3C()
{
}

void sub_100697EA0()
{
}

void sub_100697F04()
{
}

void sub_100697F30()
{
  int v3 = 103;
  sub_100241D4C( (void *)&_mh_execute_header,  v0,  v1,  "Failed to add device %{public}@ to filter accept list with result due to shutdown %{bluetooth:OI_STATUS}u",  v2);
  sub_10003BE20();
}

void sub_100697F9C(int a1, uint64_t a2, os_log_s *a3)
{
  int v6 = 136315394;
  int v7 = sub_100595B00(a1);
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  sub_10020603C( (void *)&_mh_execute_header,  a3,  v5,  "UseCase %s cannot be considered for device %{public}@",  (uint8_t *)&v6);
  sub_10002B724();
}

void sub_100698024()
{
}

void sub_100698088()
{
}

void sub_1006980E8()
{
  int v3 = v0;
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Failed to add device %{public}@ to filter accept list with result %{bluetooth:OI_STATUS}u",  v2);
  sub_10003BE20();
}

void sub_100698154(void *a1, _DWORD *a2, void *a3)
{
  id v5 = a1;
  *a2 = 138412290;
  *a3 = v5;
  sub_100110EAC((void *)&_mh_execute_header, v6, v7, "address %@ is already in the FilterAcceptList");

  sub_10009878C();
}

void sub_1006981AC(os_log_t log)
{
  int v1 = 136446466;
  uint64_t v2 = "Idle";
  __int16 v3 = 2082;
  uint64_t v4 = "Active";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Unexpected connection state (%{public}s) in ConnectionManager state (%{public}s) for disconnect request event",  (uint8_t *)&v1,  0x16u);
  sub_10003BE20();
}

void sub_10069823C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Device %{public}s is not connected nor pending connection",  v8);
  sub_10007B3CC();
}

void sub_100698288()
{
}

void sub_1006982B4()
{
}

void sub_100698314()
{
}

void sub_100698374()
{
}

void sub_1006983D4()
{
}

void sub_100698400(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543618;
  uint64_t v4 = 0LL;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  sub_10020603C( (void *)&_mh_execute_header,  a2,  a3,  "device is null %{public}@ for session %{public}@ ",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_100698474()
{
}

void sub_1006984D8()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  sub_10020603C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Unable to convert handle from device %{public}@ for session %{public}@ ",  v2);
  sub_10003BE20();
}

void sub_10069854C()
{
}

void sub_1006985B4()
{
}

void sub_10069861C()
{
  sub_10007B3CC();
}

void sub_10069865C()
{
}

void sub_1006986C0()
{
}

void sub_100698724(uint64_t a1, void *a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  sub_10020603C( (void *)&_mh_execute_header,  a4,  a3,  "Device we will overwrite this new session %{public}@ with device : %{public}@  ",  (uint8_t *)a3);

  sub_10007B3CC();
}

void sub_10069877C()
{
}

void sub_1006987E4(uint64_t a1, uint64_t a2)
{
}

void sub_10069881C(const unsigned __int8 *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_1006988A4(const unsigned __int8 *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_10069892C(const unsigned __int8 *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_1006989B4(const unsigned __int8 *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100698A3C(const unsigned __int8 *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100698AC4()
{
}

void sub_100698B28(const unsigned __int8 *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100698BB0()
{
}

void sub_100698C14(const unsigned __int8 *a1, os_log_s *a2)
{
  if (v14 < 0) {
    sub_100241C9C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  }
  sub_100241C70();
}

void sub_100698C9C()
{
}

void sub_100698CFC()
{
}

void sub_100698D28()
{
}

void sub_100698DB0()
{
}

void sub_100698E14()
{
}

void sub_100698E78()
{
}

void sub_100698ED8()
{
}

void sub_100698F38()
{
}

void sub_100698F64()
{
}

void sub_100698F90()
{
}

void sub_100698FBC()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "Invalid value for windowConfiguration=(%d). Only valid values are 0,1,2",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10069901C()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "Invalid value for enableDebugging=(%d). Only valid values are 0,1",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10069907C()
{
}

void sub_1006990A8()
{
}

void sub_1006990D4()
{
}

void sub_100699100()
{
  sub_10007B3CC();
}

void sub_100699140()
{
  sub_10007B3CC();
}

void sub_100699180( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006991F0()
{
  if (v6 >= 0) {
    int v7 = v1;
  }
  else {
    int v7 = (void *)*v1;
  }
  *(_DWORD *)uint64_t v3 = 136446466;
  *(void *)(v3 + 4) = v7;
  *(_WORD *)(v3 + 12) = 2048;
  *(void *)(v3 + 14) = v2;
  sub_10020603C( (void *)&_mh_execute_header,  v5,  v3,  "Already have a connection to device %{public}s (handle %p)",  v4);
  sub_10007B3CC();
}

void sub_100699254()
{
  sub_10007B3CC();
}

void sub_100699294()
{
}

void sub_1006992F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100699360()
{
  sub_100241CF0( (void *)&_mh_execute_header,  v0,  v1,  "Failed to cancel pending connection(s) with result %{bluetooth:OI_STATUS}u ConnectionState=%d");
  sub_10003BE20();
}

void sub_1006993C8()
{
  __int16 v4 = 1024;
  int v5 = v0;
  sub_100241D4C( (void *)&_mh_execute_header,  v1,  v2,  "Got a connection cancel complete event in wrong state %{public}s(%d)",  v3);
  sub_10003BE20();
}

void sub_100699458()
{
}

void sub_1006994A0()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Connection failed to device %{public}s, Retrying",  v8);
  sub_10007B3CC();
}

void sub_1006994EC()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "Connection timed out to device %{public}s", v8);
  sub_10007B3CC();
}

void sub_100699538()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Disconnected from device %{public}s due to hardware reset",  v8);
  sub_10007B3CC();
}

void sub_100699584()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Device %{public}s no more valid addresses or LTK's",  v8);
  sub_10007B3CC();
}

void sub_1006995D0()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Automatically retrying connection to FindMy device %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10069961C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Disconnected from device %{public}s due to encryption timeout",  v8);
  sub_10007B3CC();
}

void sub_100699668()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Disconnected from device %{public}s becuase we have too many paired devices.",  v8);
  sub_10007B3CC();
}

void sub_1006996B4()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Disconnected from device %{public}s due to MIC failure",  v8);
  sub_10007B3CC();
}

void sub_100699700()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Disconnected from device %{public}s, Fast LE Connection establishment failed",  v8);
  sub_10007B3CC();
}

void sub_10069974C()
{
}

void sub_100699778(void *a1)
{
  id v2 = sub_1005BF710(a1);
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  sub_1005BF698( (void *)&_mh_execute_header,  v3,  v4,  "Removing entry for address %{public}@ from pending parameters map");

  sub_10009878C();
}

void sub_1006997C4(void *a1)
{
  id v2 = sub_1005BF710(a1);
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  sub_1005BF698( (void *)&_mh_execute_header,  v3,  v4,  "Removing entry for address %{public}@ from configured parameters map");

  sub_10009878C();
}

void sub_100699810()
{
}

void sub_100699874()
{
  int v3 = v0;
  sub_1005BF68C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "purgeDisconnectionHistoryLeConnectionRSSIThresholdState: count %d -> %d",  v2);
  sub_10003BE20();
}

void sub_1006998E0(os_log_s *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  int v5 = 134218240;
  double v6 = a2;
  __int16 v7 = 2048;
  double v8 = a3;
  sub_10020603C( (void *)&_mh_execute_header,  a1,  a5,  "purgeDisconnectionHistoryLeConnectionRSSIThresholdState: invalid currentTime %f cutoffTime %f",  (uint8_t *)&v5);
  sub_10003BE20();
}

void sub_100699958()
{
}

void sub_1006999C0()
{
}

void sub_100699A20()
{
}

BOOL sub_100699A88(uint64_t a1, void *a2)
{
  return *a2 == 0LL;
}

void sub_100699ADC()
{
}

void sub_100699B40()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "fConnectionState:%{public}s fConnectingDevices.size:%ld",  v2,  0x16u);
  sub_10003BE20();
}

void sub_100699BE4()
{
}

void sub_100699C48()
{
}

void sub_100699CAC()
{
}

void sub_100699CD8()
{
}

void sub_100699D3C()
{
}

void sub_100699D68()
{
}

void sub_100699DB0()
{
}

void sub_100699E10(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to set prioritization threshold", a1);
}

void sub_100699E44(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "Invalid LE connection handle!!", a1);
}

void sub_100699E78()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "Failed to update connection parameters with status=%{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_100699ED8()
{
}

void sub_100699F38()
{
}

void sub_100699F98()
{
}

void sub_100699FF8()
{
}

void sub_10069A058()
{
}

void sub_10069A0B8()
{
}

void sub_10069A0E4()
{
}

void sub_10069A110( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069A17C(unsigned __int16 *a1, os_log_s *a2, uint64_t a3, float a4)
{
  int v4 = *a1;
  v5[0] = 67109376;
  v5[1] = v4;
  __int16 v6 = 2048;
  double v7 = a4;
  sub_100241D4C( (void *)&_mh_execute_header,  a2,  a3,  "The min requested is lower that the desired min: %u < %f",  (uint8_t *)v5);
  sub_10003BE20();
}

void sub_10069A1F8()
{
  int v2 = 18000;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "Remote side (peripheral) asks for a timeout (%u ms) of more than %d seconds. This is not very user friendly - refusing",  v1,  0xEu);
  sub_10003BE20();
}

void sub_10069A26C(_DWORD *a1, uint64_t a2, void *a3)
{
  id v5 = sub_1005BFB9C(a2);
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  *a1 = 138543362;
  *a3 = v6;
  sub_100110EAC( (void *)&_mh_execute_header,  v7,  v8,  "We may have an un-tracked auto-reconnect to address %{public}@ :( Sadly, we say goodbye.");

  sub_10009878C();
}

void sub_10069A2C8()
{
}

void sub_10069A2F4()
{
}

void sub_10069A35C()
{
}

void sub_10069A3C4()
{
}

void sub_10069A42C()
{
}

void sub_10069A494()
{
}

void sub_10069A4F8(const unsigned __int8 *a1, os_log_s *a2)
{
  uint64_t v3 = sub_100241F94(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10008C484();
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v5,  "Failed to set connection AFH Map for device %{public}@ as it isn't connected",  v6);

  sub_10002B724();
}

void sub_10069A57C()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "Failed to set connection AFH Map status=%{bluetooth:OI_STATUS}u",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10069A5DC()
{
}

void sub_10069A648(int a1, os_log_s *a2)
{
}

void sub_10069A6BC()
{
}

void sub_10069A6E8(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Invalid address %@", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10069A750()
{
}

void sub_10069A77C(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Invalid allowed sessions for FindMy device %@",  (uint8_t *)a2);

  sub_10007B3CC();
}

void sub_10069A7C4(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000((void *)&_mh_execute_header, a3, (uint64_t)a3, "Invalid addresses for FindMy device %@", (uint8_t *)a2);

  sub_10007B3CC();
}

void sub_10069A80C()
{
}

void sub_10069A838(uint64_t a1, void *a2, uint64_t a3)
{
  sub_10007B3CC();
}

void sub_10069A880(uint64_t a1, void *a2, uint64_t a3)
{
  sub_10007B3CC();
}

void sub_10069A8C8(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 1024;
  int v6 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "FastLeConnection:setControllerInfo not enabling Fast LE Connection to device %@ fFastLeConnectionAllowed:%d",  (uint8_t *)&v3,  0x12u);
  sub_10003BE20();
}

void sub_10069A948(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "FastLeConnection:enableFastLEConnection %@ Address cannot be 0",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_10069A9B4(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "FastLEConnection:LeDevice::enableFastLEConnection %@ cannot enable, peer does not have our updated info",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_10069AA20()
{
}

void sub_10069AA58()
{
}

void sub_10069AA84(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  sub_10020603C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Invalid property value (too long): %@ = %@",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10069AAFC(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)uint64_t buf = 136315394;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Failed to take assertionId for name: %s, return value was: %d",  buf,  0x12u);
}

void sub_10069AB50(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Failed to release assertionId: %d, return value was %d",  (uint8_t *)v4,  0xEu);
}

void sub_10069ABD8()
{
}

void sub_10069AC38(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "uuid";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10069ACAC(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "Ignoring device with no keys", a1);
}

void sub_10069ACE0(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1001FE010((void *)&_mh_execute_header, a3, (uint64_t)a3, "Skipping due to missing addresses", a1);
}

void sub_10069AD14(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Remote Bluetooth address %{public}@ is invalid!",  (uint8_t *)a2);

  sub_10007B3CC();
}

void sub_10069AD5C()
{
}

void sub_10069AD88()
{
  sub_10007B3CC();
}

void sub_10069ADD4()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "UUID generation collision - UUID %{public}s already exists!",  v8);
  sub_10007B3CC();
}

void sub_10069AE20()
{
  sub_10007B3CC();
}

void sub_10069AE5C()
{
  sub_10007B3CC();
}

void sub_10069AE98()
{
  sub_10007B3CC();
}

void sub_10069AEE4()
{
}

void sub_10069AF10()
{
}

void sub_10069AF3C()
{
}

void sub_10069AF80()
{
}

void sub_10069AFC4()
{
  if (v5 >= 0) {
    uint8_t v6 = v1;
  }
  else {
    uint8_t v6 = (void *)*v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v6;
  sub_1000BC000( (void *)&_mh_execute_header,  v4,  v2,  "LeDeviceManager::persistDevice - could not find device for UUID %s",  v3);
  sub_10007B3CC();
}

void sub_10069B01C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Attempting to persist non-paired device %{public}s before the protected cache has been loaded.",  v8);
  sub_10007B3CC();
}

void sub_10069B068()
{
}

void sub_10069B0CC(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_10024EF4C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Device %{public}@ has no address!", (uint8_t *)a2);

  sub_10007B3CC();
}

void sub_10069B114( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069B17C()
{
}

void sub_10069B1C0()
{
}

void sub_10069B204()
{
}

void sub_10069B230()
{
}

void sub_10069B25C()
{
}

void sub_10069B2C0()
{
}

void sub_10069B2EC()
{
}

void sub_10069B318()
{
  sub_1002433E0((void *)&_mh_execute_header, v0, v1, "SetInitPHYs invalid initPHYs=%x", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10069B378()
{
  sub_1002433E0((void *)&_mh_execute_header, v0, v1, "SetPHYOptions invalid PHYOptions=%x", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10069B3D8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100295790((void *)&_mh_execute_header, a2, a3, "updateBTClock =%x", a5, a6, a7, a8, 0);
  sub_100029870();
}

void sub_10069B440(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "aDevice";
  sub_10024EF4C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Assertion failed: %{public}s", a1);
}

void sub_10069B484()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Device cache size exceeded limit %d (fDeviceLRUList size %d)",  v2,  0xEu);
  sub_10003BE20();
}

void sub_10069B500()
{
}

void sub_10069B52C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "it != fDeviceLRUList.end()";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10069B5A0()
{
}

void sub_10069B604()
{
  sub_10007B3CC();
}

void sub_10069B640()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_10024EF4C( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Trying to set a resolved address that is neither public nor static for device %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10069B68C()
{
}

void sub_10069B6F0()
{
}

void sub_10069B750()
{
}

void sub_10069B7B0(void *a1)
{
  do
  {
    a1 -= 4;
  }

  while (a1 != qword_1008F1D48);
}

void sub_10069B7F0()
{
}

void sub_10069B820()
{
}

void sub_10069B8B0()
{
}

void sub_10069B8DC()
{
}

void sub_10069B908()
{
}

void sub_10069B934()
{
}

void sub_10069B964()
{
}

void sub_10069B9C4()
{
}

void sub_10069B9F4()
{
}

void sub_10069BA58(uint64_t a1, os_log_s *a2)
{
  id v3 = sub_1005BFB9C(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  int v6 = 138412290;
  uint64_t v7 = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v5,  "aopReceivedDeviceFoundEvent: Bluetooth address %@ is invalid!",  (uint8_t *)&v6);

  sub_1002E56F8();
}

void sub_10069BAE4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 68157954;
  v3[1] = 43;
  __int16 v4 = 2096;
  uint64_t v5 = a1;
  sub_1002BDC00( (void *)&_mh_execute_header,  a2,  a3,  "aopReceivedDeviceFoundEvent: AOPBTDeviceEntry entry, entry_buff:%.43P",  (uint8_t *)v3);
  sub_10003BE20();
}

void sub_10069BB5C()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "LeObserver::FoundCb _LE_GAP_ParseAppleManufacturingData returned %d",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10069BBBC()
{
}

void sub_10069BC1C()
{
}

void sub_10069BC7C()
{
}

void sub_10069BCDC()
{
}

void sub_10069BD48()
{
}

void sub_10069BDB4()
{
}

void sub_10069BE18()
{
}

void sub_10069BE80()
{
}

void sub_10069BEE8()
{
  sub_10008651C( (void *)&_mh_execute_header,  v0,  v1,  "createAOPBTBufferMatchTable: getNextMatchRuleAvailableHandle returned %d",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10069BF48()
{
}

void sub_10069BF78()
{
}

void sub_10069BFDC(_BYTE *a1, _BYTE *a2)
{
}

void sub_10069C008()
{
}

void sub_10069C098()
{
  sub_100295790((void *)&_mh_execute_header, v0, v1, "enableMatchActionRulesBuffering returned %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10069C0F8()
{
  sub_100295790( (void *)&_mh_execute_header,  v0,  v1,  "configureMatchActionRulesTableInternal returned %d",  v2,  v3,  v4,  v5,  v6);
  sub_100029870();
}

void sub_10069C158()
{
}

void sub_10069C188()
{
}

void sub_10069C1E8()
{
}

void sub_10069C248()
{
}

void sub_10069C2A8()
{
  sub_100295790((void *)&_mh_execute_header, v0, v1, "fMatchActionTableRules numOfRules=%d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10069C308()
{
}

void sub_10069C368()
{
}

void sub_10069C394()
{
}

void sub_10069C3C0()
{
}

void sub_10069C420()
{
}

void sub_10069C480(unsigned __int8 a1, uint64_t a2, os_log_s *a3)
{
  LOWORD(sub_100298BA8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Controller failed to read ADV buffers", v3) = 1024;
  HIWORD(sub_100298BA8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Controller failed to read ADV buffers", v3) = a1;
  sub_100241CF0((void *)&_mh_execute_header, a2, a3, "Match Table handle:%d type:%d out of range", 67109376, v3);
  sub_10003BE20();
}

void sub_10069C4F4()
{
}

void sub_10069C554(uint64_t a1, os_log_s *a2)
{
  sub_100610824((void *)&_mh_execute_header, a2, v3, "enableMatchActionRulesBuffering returned %d", v4);
  sub_10003BE20();
}

void sub_10069C5D0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  __int16 v7 = 1024;
  int v8 = v4;
  sub_1005BF68C( (void *)&_mh_execute_header,  a3,  v5,  "Match Buffer readMatchBuffers returned %d, fMatchBufferExpectedEntries:%d",  v6);
  sub_1002E56F8();
}

void sub_10069C65C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 268);
  int v4 = *(_DWORD *)(a1 + 272);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  sub_1005BF68C( (void *)&_mh_execute_header,  a2,  a3,  "BLEScanStat: PageScan totalBTSCPageScanTime %d totalBTSCPageScanNumIDPackets %d",  (uint8_t *)v5);
  sub_10003BE20();
}

void sub_10069C6D8()
{
}

void sub_10069C738()
{
}

void sub_10069C798()
{
}

void sub_10069C7F8()
{
}

void sub_10069C858()
{
}

void sub_10069C8B8()
{
}

void sub_10069C8E4()
{
}

void sub_10069C944(uint64_t *a1, int *a2, uint64_t a3, os_log_s *a4)
{
  else {
    uint64_t v5 = (uint64_t *)*a1;
  }
  int v6 = *a2;
  *(_DWORD *)a3 = 136446466;
  *(void *)(a3 + 4) = v5;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v6;
  sub_1002BDC00((void *)&_mh_execute_header, a4, a3, "ScanAgentType for %{public}s is %d", (uint8_t *)a3);
  sub_10007B3CC();
}

void sub_10069C9B8()
{
  v2[0] = 138543618;
  sub_1001FE03C();
  sub_100241D4C( (void *)&_mh_execute_header,  v0,  v1,  "ADVBUFF(%{public}@): Failed to configure buffer adv buffer: %d",  (uint8_t *)v2);
  sub_10003BE20();
}

void sub_10069CA28()
{
}

void sub_10069CAB8()
{
}

void sub_10069CB18()
{
  sub_10008651C((void *)&_mh_execute_header, v0, v1, "getNextMatchRuleAvailableHandle returned %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10069CB78()
{
}

void sub_10069CBA4()
{
}

void sub_10069CBD0()
{
}

void sub_10069CC30()
{
}

void sub_10069CC90()
{
}

void sub_10069CCF0()
{
}

void sub_10069CD50()
{
}

void sub_10069CDB0()
{
}

void sub_10069CE10()
{
}

void sub_10069CE70()
{
}

void sub_10069CED0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069CF40()
{
}

void sub_10069CFA0()
{
}

void sub_10069D000()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1002929E8((void *)&_mh_execute_header, v7, (uint64_t)v7, "Agents: %{public}s", v8);
  sub_10007B3CC();
}

void sub_10069D04C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1002929E8((void *)&_mh_execute_header, v7, (uint64_t)v7, "%{public}s", v8);
  sub_10007B3CC();
}

void sub_10069D098()
{
}

void sub_10069D0F8()
{
}

void sub_10069D158()
{
}

void sub_10069D1B8()
{
}

void sub_10069D28C()
{
}

void sub_10069D2EC()
{
}

void sub_10069D334()
{
}

void sub_10069D37C()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1002929E8( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "Decrypt AccessoryStatus ADV failed: no key, %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10069D3C8()
{
}

void sub_10069D3F4()
{
}

void sub_10069D454(uint64_t a1, os_log_s *a2)
{
  v2[0] = 67109632;
  v2[1] = 18;
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 29LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error parsing puck %d, invalid size %zu, we can only fit %zu bytes",  (uint8_t *)v2,  0x1Cu);
  sub_1002E56F8();
}

void sub_10069D4E0()
{
  unint64_t v5 = *(void *)&v4 & (v3 >> 40);
  if (v5) {
    int v6 = 0;
  }
  else {
    int v6 = v1;
  }
  __int16 v10 = 1024;
  if (v5 == 64) {
    int v7 = v1;
  }
  else {
    int v7 = 0;
  }
  int v11 = v7;
  __int16 v12 = 1024;
  int v13 = v6;
  if (v5 == 192) {
    int v8 = v1;
  }
  else {
    int v8 = 0;
  }
  __int16 v14 = 1024;
  int v15 = v2;
  __int16 v16 = 1024;
  int v17 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "leSensorStateChanged: No uuid found for a device with address type valid? %d, resolvable? %d, non-resolvable? %d, pu blic? %d, static? %d",  v9,  0x20u);
  sub_1002E56F8();
}

void sub_10069D5C8()
{
}

void sub_10069D628( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069D694()
{
}

void sub_10069D704()
{
}

void sub_10069D764(uint8_t *a1, _DWORD *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 0;
  sub_100610824( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "MATCH TABLE first empty unused and uninitialized handle:%d",  a1);
}

void sub_10069D7A0(_BYTE *a1, _BYTE *a2)
{
}

void sub_10069D7CC(_BYTE *a1, _BYTE *a2)
{
}

void sub_10069D7F8()
{
}

void sub_10069D858()
{
}

void sub_10069D8B8()
{
}

void sub_10069D918()
{
}

void sub_10069D978()
{
}

void sub_10069D9D8()
{
}

void sub_10069DA38()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000( (void *)&_mh_execute_header,  v7,  (uint64_t)v7,  "addScanFilterByUUIDWithBlobAndMask failed %{public}s",  v8);
  sub_10007B3CC();
}

void sub_10069DA84()
{
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_100241C64(v2, v6, 4.8751e-34);
  sub_1000BC000((void *)&_mh_execute_header, v7, (uint64_t)v7, "addScanFilterByUUID failed %{public}s", v8);
  sub_10007B3CC();
}

void sub_10069DAD0()
{
}

void sub_10069DB34(_BYTE *a1, _BYTE *a2)
{
}

void sub_10069DB60()
{
}

void sub_10069DBFC()
{
}

void sub_10069DCAC()
{
  sub_100295790((void *)&_mh_execute_header, v0, v1, "enableADVBuffering returned %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10069DD0C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069DD7C(os_log_t log)
{
  v1[0] = 67109376;
  v1[1] = 0;
  __int16 v2 = 1024;
  int v3 = 1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unexpected combination of enabled cores: scanLPCoreEnable %d, isScanCoreEnabled %d",  (uint8_t *)v1,  0xEu);
  sub_10003BE20();
}

void sub_10069DE00(unsigned __int16 a1)
{
}

void sub_10069DE68(_BYTE *a1, _BYTE *a2)
{
}

void sub_10069DE94(_BYTE *a1, _BYTE *a2)
{
}

void sub_10069DEC0(uint64_t a1, os_log_s *a2)
{
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  int v7 = 136446210;
  int v8 = v4;
  sub_1000BC000((void *)&_mh_execute_header, a2, v3, "addScanFilterByUUID failed %{public}s", (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10069DF6C()
{
}

void sub_10069DFD4(_BYTE *a1, _BYTE *a2)
{
}

void sub_10069E000()
{
}

void sub_10069E068(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_1002929E8((void *)&_mh_execute_header, a2, a3, "fFilterPeripherals.size:%lu", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10069E0D0()
{
}

void sub_10069E138()
{
}

void sub_10069E1B4()
{
}

void sub_10069E238()
{
}

void sub_10069E264()
{
}

void sub_10069E290(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "TDS matching disabled per <rdar://problem/55838471>",  v1,  2u);
}

void sub_10069E2D0(uint64_t a1, char *a2, uint64_t a3, os_log_s *a4)
{
  if (a2[23] >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *(char **)a2;
  }
  *(_DWORD *)a3 = 136446210;
  *(void *)(a3 + 4) = v5;
  sub_1002929E8((void *)&_mh_execute_header, a4, a3, "No match found for device %{public}s", (uint8_t *)a3);
  if (a2[23] < 0) {
    operator delete(*(void **)a2);
  }
}

void sub_10069E33C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100494168((void *)&_mh_execute_header, (int)a2, a3, "Invalid zone (nil or 0 length).", a1);
}

void sub_10069E36C()
{
  int v2 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "agent %s cannot scan, device never unlocked, entry.scanBeforeFirstUnlock:%d",  v1,  0x12u);
  sub_10003BE20();
}

void sub_10069E3E4()
{
  int v3 = 1;
  __int16 v4 = v0;
  int v5 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "agent %s cannot scan, deviceLocked:%d, entry.scanWhenLocked:%d",  v2,  0x18u);
  sub_10003BE20();
}

void sub_10069E468()
{
  if (v3 < 0) {
    int v2 = (void *)*v2;
  }
  int v4 = 136315138;
  int v5 = v2;
  sub_1002929E8((void *)&_mh_execute_header, v0, v1, "agent %s cannot scan, disabled/leech", (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_10069E4D8()
{
}

void sub_10069E538()
{
}

void sub_10069E564()
{
}

void sub_10069E590()
{
}

void sub_10069E5F0()
{
}

void sub_10069E61C()
{
}

void sub_10069E648()
{
}

void sub_10069E674()
{
}

void sub_10069E6A0()
{
}

void sub_10069E6CC()
{
}

void sub_10069E6F8()
{
}

void sub_10069E724()
{
}

void sub_10069E784()
{
}

void sub_10069E7E4()
{
}

void sub_10069E810()
{
}

void sub_10069E83C()
{
}

void sub_10069E868()
{
}

void sub_10069E894()
{
}

void sub_10069E8C0()
{
}

void sub_10069E8EC()
{
}

void sub_10069E918()
{
}

void sub_10069E944()
{
}

void sub_10069E970()
{
}

void sub_10069E99C()
{
}

void sub_10069E9C8()
{
}

void sub_10069E9F4()
{
  _DWORD *v1 = 138543362;
  *uint64_t v3 = v2;
  sub_10024EF4C( (void *)&_mh_execute_header,  v5,  (uint64_t)v3,  "Failed to retrieve UUID for paired address %{public}@",  v4);

  sub_10007B3CC();
}

void sub_10069EA3C()
{
  _DWORD *v1 = 138543362;
  *uint64_t v3 = v2;
  sub_1000BC000( (void *)&_mh_execute_header,  v5,  (uint64_t)v3,  "Removing incomplete pairing info for device %{public}@",  v4);

  sub_10007B3CC();
}

void sub_10069EA84()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "Found missing/bad keys for device %{public}s, dropping pairing info",  v4);
  sub_10007B3CC();
}

void sub_10069EAD4()
{
  sub_10007B3CC();
}

void sub_10069EB14()
{
}

void sub_10069EB40()
{
}

void sub_10069EBA0()
{
}

void sub_10069EC00()
{
}

void sub_10069EC60()
{
}

void sub_10069ECC0()
{
}

void sub_10069ED20()
{
}

void sub_10069ED80()
{
}

void sub_10069EDE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069EE4C()
{
}

void sub_10069EE78()
{
}

void sub_10069EED8()
{
}

void sub_10069EF3C()
{
}

void sub_10069EFA0()
{
}

void sub_10069F000()
{
}

void sub_10069F060()
{
}

void sub_10069F0C0()
{
}

void sub_10069F124()
{
}

void sub_10069F184(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136446210;
  uint64_t v4 = "fInProgressKeys.find(device) == fInProgressKeys.end()";
  sub_10024EF4C((void *)&_mh_execute_header, a1, a3, "Assertion failed: %{public}s", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10069F1F8()
{
}

void sub_10069F224()
{
  else {
    uint8_t v6 = (uint64_t *)*v1;
  }
  *(_DWORD *)uint64_t v2 = 136446466;
  *(void *)(v2 + 4) = v6;
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = v3;
  sub_100241D4C( (void *)&_mh_execute_header,  v5,  v3,  "Pairing failed to device %{public}s with error %{bluetooth:OI_STATUS}u",  v4);
  sub_10007B3CC();
}

void sub_10069F290(void *a1, uint64_t a2, os_log_s *a3)
{
  id v5 = a1;
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = v5;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_FAULT,  "Received remote address but have no IRK for device %{public}@",  (uint8_t *)a2,  0xCu);

  sub_10009878C();
}

void sub_10069F2F4(void *a1, void *a2, uint64_t a3, os_log_s *a4)
{
  id v7 = a2;
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = v7;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_FAULT,  "Resolved address we got on pairing completion (%{public}@) doesn't match the one that was distributed (%{public}@)!",  (uint8_t *)a3,  0x16u);

  sub_10009878C();
}

void sub_10069F370()
{
}

void sub_10069F39C(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  sub_1000BC000( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Unable to find locally paired device with iCloud identifier %s",  (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_10069F414()
{
  sub_10007B3CC();
}

void sub_10069F454( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069F4BC()
{
}

void sub_10069F520( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069F58C()
{
  sub_10007B3CC();
}

void sub_10069F5CC()
{
  sub_10007B3CC();
}

void sub_10069F60C()
{
  sub_10007B3CC();
}

void sub_10069F64C()
{
  sub_10007B3CC();
}

void sub_10069F68C()
{
  sub_10007B3CC();
}

void sub_10069F6CC()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "Denying pairing request from device %{public}s as there's no one to handle the request",  v4);
  sub_10007B3CC();
}

void sub_10069F71C()
{
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = v4;
  sub_100241D4C( (void *)&_mh_execute_header,  v6,  v4,  "Failed to cancel pairing to device %{public}@ with result %{bluetooth:OI_STATUS}u",  v5);

  sub_10007B3CC();
}

void sub_10069F76C(const unsigned __int8 *a1, os_log_s *a2)
{
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  int v7 = 136446210;
  uint64_t v8 = v4;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  v3,  "Couldn't find pairing agent to handle request for device %{public}s - cancelling pairing",  (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10069F818(uint64_t a1, os_log_s *a2)
{
  id v3 = sub_1005BFB9C(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10008C484();
  sub_10024EF4C( (void *)&_mh_execute_header,  a2,  v5,  "Device %{public}@ requested pairing but wasn't being tracked by device manager!",  v6);
}

void sub_10069F8A4()
{
}

void sub_10069F908()
{
}

void sub_10069F934()
{
}

void sub_10069F998()
{
}

void sub_10069F9FC()
{
  sub_10008651C((void *)&_mh_execute_header, v0, v1, "Failed to set tek buffer length, res = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10069FA5C()
{
  sub_10008651C((void *)&_mh_execute_header, v0, v1, "Failed to set tek buffer, res = %d", v2, v3, v4, v5, v6);
  sub_100029870();
}

void sub_10069FABC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069FB24( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069FB8C(uint64_t a1, os_log_s *a2)
{
  v2[0] = 68157954;
  v2[1] = 21;
  __int16 v3 = 2096;
  uint64_t v4 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "invalidateCurrentTEK new TEK:%.21P",  (uint8_t *)v2,  0x12u);
  sub_10003BE20();
}

void sub_10069FC0C()
{
}

void sub_10069FC6C()
{
}

void sub_10069FCA4()
{
}

void sub_10069FD04(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LOWORD(sub_100632C04((void *)&_mh_execute_header, v0, v1, "maintainTEKList currentInterval:%d oldestInterval:%d", v2, v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *(_DWORD *)(a2 + 32);
  sub_100632C04( (void *)&_mh_execute_header,  a2,  a3,  "isCurrentTEKValid lastActivePeriod:%d fEKRollingPeriod:%d",  67109376,  v3);
  sub_10003BE20();
}

void sub_10069FD7C()
{
}

void sub_10069FDDC()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "addTEK tek:%@ fTEKArray:%@", v2, 0x16u);
  sub_10003BE20();
}

void sub_10069FE5C()
{
}

void sub_10069FECC()
{
}

void sub_10069FEF8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(a1 + 40) = v2;
    operator delete(v2);
  }

void sub_10069FF10(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_1004445CC((void *)&_mh_execute_header, a2, a3, "Unable to extract country code plist. %@", (uint8_t *)a2);
}

void sub_10069FF58( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069FF88( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069FFB8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10069FFE8()
{
}

void sub_1006A006C(uint64_t a1, uint64_t a2)
{
}

void sub_1006A00A4()
{
}

void sub_1006A00D0(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "bundleId %@is not in the applicationMap. Could not complete application launch path",  (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_1006A013C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_1000BC000((void *)&_mh_execute_header, a2, a3, "Failed to lookup the process ID of %{public}@", (uint8_t *)&v4);
  sub_10003BE20();
}

void sub_1006A01A8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&uint8_t v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_10026076C( (void *)&_mh_execute_header,  a2,  a3,  "Failed To Launch Application %{public}@ Error %{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_10003BE20();
}

void sub_1006A021C(uint64_t a1, uint64_t a2)
{
}

void sub_1006A0254(uint64_t a1, uint64_t a2)
{
}

void sub_1006A028C(uint64_t a1, uint64_t a2)
{
}

void sub_1006A02C4()
{
}

void sub_1006A0328(uint64_t a1, uint64_t a2)
{
}

void sub_1006A0360(uint64_t a1, uint64_t a2)
{
}

void sub_1006A0398()
{
}

void sub_1006A03FC()
{
}

void sub_1006A0460(uint64_t a1, uint64_t a2)
{
}

void sub_1006A0498(uint64_t a1, uint64_t a2)
{
}

void sub_1006A04D0()
{
}

void sub_1006A04FC()
{
}

void sub_1006A0534(void *a1, uint64_t a2)
{
}

void sub_1006A057C(void *a1, uint64_t a2)
{
}

void sub_1006A05C4()
{
}

void sub_1006A0628()
{
}

void sub_1006A068C()
{
}

void sub_1006A06F0()
{
}

void sub_1006A0754()
{
}

void sub_1006A07B8()
{
}

void sub_1006A07E4()
{
}

void sub_1006A0810()
{
}

void sub_1006A0870()
{
}

void sub_1006A08D0()
{
}

void sub_1006A08FC()
{
}

void sub_1006A0928()
{
}

void sub_1006A098C()
{
}

void sub_1006A09EC()
{
}

void sub_1006A0A4C()
{
}

void sub_1006A0AB0(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)uint64_t buf = 136446210;
  *(void *)(buf + 4) = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to create device from address %{public}s",  buf,  0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1006A0B20()
{
}

void sub_1006A0B4C()
{
}

void sub_1006A0B78()
{
}

void sub_1006A0BA4()
{
}

void sub_1006A0BD0()
{
}

void sub_1006A0BFC()
{
}

void sub_1006A0C28()
{
}

void sub_1006A0C54()
{
}

void sub_1006A0C80()
{
}

void sub_1006A0CAC(char *a1, void *a2, os_log_t log)
{
  if (*a1 >= 0) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = (void *)*a2;
  }
  int v4 = 141558275;
  uint64_t v5 = 1752392040LL;
  __int16 v6 = 2081;
  int v7 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Received StoreClassicDeviceSettings for device %{private, mask.hash}s that is not paired",  (uint8_t *)&v4,  0x16u);
}

void sub_1006A0D48()
{
}

void sub_1006A0D74()
{
}

void sub_1006A0DA0()
{
}

void sub_1006A0DCC()
{
}

void sub_1006A0DF8()
{
}

void sub_1006A0E24()
{
}

void sub_1006A0E50()
{
}

void sub_1006A0E7C()
{
}

void sub_1006A0EA8()
{
}

void sub_1006A0ED4()
{
}

void sub_1006A0F00()
{
}

void sub_1006A0F2C()
{
}

void sub_1006A0F58()
{
}

void sub_1006A0F84(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Session is empty in getConnectionUseCase.",  v1,  2u);
}

void sub_1006A0FC4()
{
}

void sub_1006A0FF0(void *a1, os_log_s *a2)
{
}

void sub_1006A1070()
{
}

void sub_1006A10D4()
{
}

void sub_1006A1100()
{
}

void sub_1006A112C()
{
}

void sub_1006A1158()
{
}

void sub_1006A1184()
{
}

void sub_1006A11B0()
{
}

void sub_1006A11DC(unsigned __int8 a1, xpc_object_t xarray, os_log_s *a3)
{
  v4[0] = 67109376;
  v4[1] = a1;
  __int16 v5 = 2048;
  size_t count = xpc_array_get_count(xarray);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Invalid size of the period duration array(numPeriods: %d, period count %zu)",  (uint8_t *)v4,  0x12u);
  sub_10002B724();
}

void sub_1006A1270()
{
}

void sub_1006A129C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006A1304()
{
}

void sub_1006A1368()
{
}

void sub_1006A13CC()
{
}

void sub_1006A13F8()
{
}

void sub_1006A145C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006A14C4()
{
}

void sub_1006A14F0()
{
}

void sub_1006A151C()
{
}

void sub_1006A1548()
{
}

void sub_1006A1574()
{
}

void sub_1006A15A0()
{
}

void sub_1006A15CC()
{
}

void sub_1006A15F8()
{
}

void sub_1006A1624()
{
}

void sub_1006A1650()
{
}

void sub_1006A167C()
{
}

void sub_1006A16A8(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "void BT::PurpleCoexManager::SetHRBChannelMap(xpc_object_t)";
  sub_1000BC000((void *)&_mh_execute_header, a1, a3, "%s, Error: While reading in HRB AFH Map from UCM", (uint8_t *)&v3);
  sub_10003BE20();
}

void sub_1006A171C()
{
}

void sub_1006A1748()
{
}

void sub_1006A17A8()
{
}

void sub_1006A1808()
{
}

void sub_1006A1868()
{
}

void sub_1006A18C8()
{
}

void sub_1006A1928()
{
}

void sub_1006A1988()
{
}

void sub_1006A19E8()
{
}

void sub_1006A1A14()
{
}

void sub_1006A1A40(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 136446210;
  *(void *)(a1 + 4) = "Null Object!";
  sub_1000BC000( (void *)&_mh_execute_header,  a2,  a3,  "Bandwidth: Error obtaining HFP Audio Device %{public}s",  (uint8_t *)a1);
}

void sub_1006A1A80()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "Bandwidth: Error obtaining HFP Audio Device %{public}s",  v4);
}

void sub_1006A1AD8()
{
}

void sub_1006A1B04()
{
}

void sub_1006A1B30()
{
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1000BC000( (void *)&_mh_execute_header,  v3,  (uint64_t)v3,  "Bandwidth: Received LEA Audio Disconnect for device %s, when none of the LEA Audio profiles were running",  v4);
}

void sub_1006A1B88()
{
}

void sub_1006A1BB4()
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend__addServiceUUIDsWithParametersToScanRequestIfNeeded_matchFlags_matchTypes_uuids_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addServiceUUIDsWithParametersToScanRequestIfNeeded:matchFlags:matchTypes:uuids:");
}

id objc_msgSend__encryptInvitationPayload_payloadLength_authTag_irkData_keyInfo_keyInfoLength_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encryptInvitationPayload:payloadLength:authTag:irkData:keyInfo:keyInfoLength:");
}

id objc_msgSend_addUserFilteredClockWithMachInterval_domainInterval_usingFilterShift_isAdaptive_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUserFilteredClockWithMachInterval:domainInterval:usingFilterShift:isAdaptive:error:");
}

id objc_msgSend_alertOptionsWithConnectionAlerts_disconnectionAlerts_notificationAlerts_delay_bridgeTransport_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "alertOptionsWithConnectionAlerts:disconnectionAlerts:notificationAlerts:delay:bridgeTransport:");
}

id objc_msgSend_diagnosticAccessoryFakeWithIdentifier_leftPercent_leftState_rightPercent_rightState_casePercent_caseState_lidClosed_obcMinutes_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "diagnosticAccessoryFakeWithIdentifier:leftPercent:leftState:rightPercent:rightState:casePercent:caseState:lid Closed:obcMinutes:error:");
}

id objc_msgSend_initWithBundleID_serviceUUID_sessionType_sessionState_supportsBackgrounding_supportsStateRestoration_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithBundleID:serviceUUID:sessionType:sessionState:supportsBackgrounding:supportsStateRestoration:");
}

id objc_msgSend_initWithDevice_type_timeoutValue_targetCore_rssiThreshold_rssiThresholdGone_invalidRssiHandling_rssiPrecision_rssiPrecisionGone_eventConfiguration_vseBuffering_rssiIncreaseScanThreshold_rssiIncreaseScanWindowThreshold_rssiIncreaseScanIntervalThreshold_rssiIncreaseScanTimeoutThreshold_sensorTimeoutBetweenIncreaseScan_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDevice:type:timeoutValue:targetCore:rssiThreshold:rssiThresholdGone:invalidRssiHandling:rssiPrecision :rssiPrecisionGone:eventConfiguration:vseBuffering:rssiIncreaseScanThreshold:rssiIncreaseScanWindowThreshold: rssiIncreaseScanIntervalThreshold:rssiIncreaseScanTimeoutThreshold:sensorTimeoutBetweenIncreaseScan:");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_startScanningForType_data_mask_peers_scanMode_rssi_duplicates_scanCache_useCaseList_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:");
}