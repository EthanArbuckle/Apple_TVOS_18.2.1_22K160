void **sub_10000136C(void **a1)
{
  void **v3;
  v3 = a1;
  sub_100009194(&v3);
  return a1;
}

void **sub_1000013A0(void **a1)
{
  v3 = a1;
  sub_100009220(&v3);
  return a1;
}

double sub_1000013D4(unint64_t a1)
{
  if (qword_1000100E8 != -1) {
    dispatch_once(&qword_1000100E8, &stru_10000C3C0);
  }
  return *(double *)&qword_1000100E0 * (double)a1;
}

void sub_100001428(id a1)
{
  *(double *)&qword_1000100E0 = (float)((float)((float)info.numer * 0.000000001) / (float)info.denom);
}

uint64_t start(int a1, char *const *a2)
{
  while (1)
  {
    uint64_t v4 = getopt(a1, a2, ":kd:n:hcelifs:w:rxp:z::");
    switch((int)v4)
    {
      case 'c':
        byte_10001010F = 1;
        byte_100010110 = 1;
        if (byte_100010060) {
          byte_10001010C = 1;
        }
        goto LABEL_12;
      case 'd':
        dword_100010104 = atoi(optarg);
        continue;
      case 'e':
        if (byte_100010060)
        {
          byte_10001010B = 1;
          byte_100010108 = 1;
          byte_10001010C = 1;
          byte_10001010A = 1;
          byte_10001010E = 1;
        }

LABEL_12:
        byte_10001010D = 1;
        continue;
      case 'f':
        if (byte_100010060) {
          byte_100010108 = 1;
        }
        continue;
      case 'h':
        sub_1000066E8(0);
      case 'i':
        if (byte_100010060) {
          byte_10001010A = 1;
        }
        continue;
      case 'k':
        byte_100010110 = 1;
        continue;
      case 'l':
        if (byte_100010060) {
          byte_10001010B = 1;
        }
        continue;
      case 'n':
        byte_100010100 = 1;
        byte_100010121 = 1;
        dword_100010038 = atoi(optarg);
        continue;
      case 'p':
        dword_10001003C = atoi(optarg);
        continue;
      case 'r':
        byte_100010120 = 1;
        continue;
      case 's':
        v5 = optarg;
        if (!strcmp(optarg, "mem")) {
          qword_100010118 = (uint64_t)"footprint";
        }
        else {
          qword_100010118 = (uint64_t)v5;
        }
        continue;
      case 'w':
        qword_100010128 = (uint64_t)optarg;
        continue;
      case 'x':
        byte_100010109 = 1;
        continue;
      case 'z':
        if (!byte_100010060) {
          continue;
        }
        int v6 = optind;
        if (optind >= a1)
        {
          v7 = optarg;
          if (optarg)
          {
LABEL_32:
            dword_100010040 = atoi(v7);
            continue;
          }
        }

        else
        {
          v7 = optarg;
          if (optarg) {
            goto LABEL_32;
          }
          v8 = a2[optind];
          if (v8 && (*v8 & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[*(unsigned __int8 *)v8] & 0x400) != 0)
          {
            dword_100010040 = atoi(v8);
            optind = v6 + 1;
            continue;
          }
        }

        byte_100010111 = 1;
        break;
      default:
        goto LABEL_905;
    }
  }

  if ((_DWORD)v4 != -1)
  {
    if ((_DWORD)v4 == 58)
    {
      fprintf(__stderrp, "Error: Missing argument to '%c'\n");
    }

    else
    {
      if ((_DWORD)v4 != 63)
      {
LABEL_905:
        fprintf(__stderrp, "Fatal: Unexpected return value from getopt: '%c'\n", v4);
        sub_1000066E8(-1);
      }

      fprintf(__stderrp, "Error: Unrecognized option '%c'\n");
    }

    sub_1000066E8(1);
  }

  mach_timebase_info((mach_timebase_info_t)&dword_1000100F0);
  if (getuid())
  {
    v220 = __stderrp;
    v221 = "Fatal: jetsam_priority must be run as root.\n";
    size_t v222 = 44LL;
    goto LABEL_911;
  }

  if (byte_100010100 != 1) {
    goto LABEL_39;
  }
  if (!dword_100010104)
  {
    v220 = __stderrp;
    v221 = "Fatal: Specify the delay(ms) between the time series samples with option -d.\n";
    size_t v222 = 77LL;
LABEL_911:
    fwrite(v221, v222, 1uLL, v220);
    exit(1);
  }

  qword_1000100F8 = 1000000
                  * dword_100010104
                  * (unint64_t)*(unsigned int *)algn_1000100F4
                  / dword_1000100F0;
LABEL_39:
  v429 = 0LL;
  uint64_t v227 = sub_100005EB4(&v429);
  sub_100009298(__src, "priority");
  if (SHIBYTE(v428) < 0)
  {
    sub_100009108(__p, __src[0], (unint64_t)__src[1]);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)__src;
    uint64_t v442 = v428;
  }

  uint64_t v443 = 0x100000001LL;
  uint64_t v9 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v10 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v10 = v9 + 32;
  }

  qword_100010070 = v10;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v428) < 0) {
    operator delete(__src[0]);
  }
  sub_100009298(&v425, "priority_name");
  if (SHIBYTE(v426) < 0)
  {
    sub_100009108(__p, (void *)v425, *((unint64_t *)&v425 + 1));
  }

  else
  {
    *(_OWORD *)__p = v425;
    uint64_t v442 = v426;
  }

  uint64_t v443 = 0x200000000LL;
  uint64_t v11 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v12 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v12 = v11 + 32;
  }

  qword_100010070 = v12;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v426) < 0) {
    operator delete((void *)v425);
  }
  sub_100009298(v423, "fds");
  if (SHIBYTE(v424) < 0)
  {
    sub_100009108(__p, v423[0], (unint64_t)v423[1]);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)v423;
    uint64_t v442 = v424;
  }

  uint64_t v443 = 0LL;
  uint64_t v13 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v14 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v14 = v13 + 32;
  }

  qword_100010070 = v14;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v424) < 0) {
    operator delete(v423[0]);
  }
  if (byte_100010108 == 1)
  {
    sub_100009298(&v421, "internal");
    if (SHIBYTE(v422) < 0)
    {
      sub_100009108(__p, (void *)v421, *((unint64_t *)&v421 + 1));
    }

    else
    {
      *(_OWORD *)__p = v421;
      uint64_t v442 = v422;
    }

    uint64_t v443 = 2LL;
    uint64_t v15 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v16 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v16 = v15 + 32;
    }

    qword_100010070 = v16;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v422) < 0) {
      operator delete((void *)v421);
    }
    sub_100009298(v419, "internal_comp");
    if (SHIBYTE(v420) < 0)
    {
      sub_100009108(__p, v419[0], (unint64_t)v419[1]);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)v419;
      uint64_t v442 = v420;
    }

    uint64_t v443 = 2LL;
    uint64_t v17 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v18 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v18 = v17 + 32;
    }

    qword_100010070 = v18;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v420) < 0) {
      operator delete(v419[0]);
    }
    sub_100009298(&v417, "iokit_mapped");
    if (SHIBYTE(v418) < 0)
    {
      sub_100009108(__p, (void *)v417, *((unint64_t *)&v417 + 1));
    }

    else
    {
      *(_OWORD *)__p = v417;
      uint64_t v442 = v418;
    }

    uint64_t v443 = 2LL;
    uint64_t v19 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v20 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v20 = v19 + 32;
    }

    qword_100010070 = v20;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v418) < 0) {
      operator delete((void *)v417);
    }
    sub_100009298(v415, "purge_nonvol");
    if (SHIBYTE(v416) < 0)
    {
      sub_100009108(__p, v415[0], (unint64_t)v415[1]);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)v415;
      uint64_t v442 = v416;
    }

    uint64_t v443 = 2LL;
    uint64_t v21 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v22 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v22 = v21 + 32;
    }

    qword_100010070 = v22;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v416) < 0) {
      operator delete(v415[0]);
    }
    sub_100009298(&v413, "purge_nonvol_comp");
    if (SHIBYTE(v414) < 0)
    {
      sub_100009108(__p, (void *)v413, *((unint64_t *)&v413 + 1));
    }

    else
    {
      *(_OWORD *)__p = v413;
      uint64_t v442 = v414;
    }

    uint64_t v443 = 2LL;
    uint64_t v23 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v24 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v24 = v23 + 32;
    }

    qword_100010070 = v24;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v414) < 0) {
      operator delete((void *)v413);
    }
    sub_100009298(v411, "alt_acct");
    if (SHIBYTE(v412) < 0)
    {
      sub_100009108(__p, v411[0], (unint64_t)v411[1]);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)v411;
      uint64_t v442 = v412;
    }

    uint64_t v443 = 2LL;
    uint64_t v25 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v26 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v26 = v25 + 32;
    }

    qword_100010070 = v26;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v412) < 0) {
      operator delete(v411[0]);
    }
    sub_100009298(&v409, "alt_acct_comp");
    if (SHIBYTE(v410) < 0)
    {
      sub_100009108(__p, (void *)v409, *((unint64_t *)&v409 + 1));
    }

    else
    {
      *(_OWORD *)__p = v409;
      uint64_t v442 = v410;
    }

    uint64_t v443 = 2LL;
    uint64_t v27 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v28 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v28 = v27 + 32;
    }

    qword_100010070 = v28;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v410) < 0) {
      operator delete((void *)v409);
    }
    if ((byte_100010109 & 1) == 0)
    {
      sub_100009298(v407, "page_table");
      if (SHIBYTE(v408) < 0)
      {
        sub_100009108(__p, v407[0], (unint64_t)v407[1]);
      }

      else
      {
        *(_OWORD *)__p = *(_OWORD *)v407;
        uint64_t v442 = v408;
      }

      uint64_t v443 = 2LL;
      uint64_t v29 = qword_100010070;
      if ((unint64_t)qword_100010070 >= unk_100010078)
      {
        uint64_t v30 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
      }

      else
      {
        sub_100009348(&qword_100010068, (__int128 *)__p);
        uint64_t v30 = v29 + 32;
      }

      qword_100010070 = v30;
      if (SHIBYTE(v442) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v408) < 0) {
        operator delete(v407[0]);
      }
    }
  }

  sub_100009298(&v405, "footprint");
  if (SHIBYTE(v406) < 0)
  {
    sub_100009108(__p, (void *)v405, *((unint64_t *)&v405 + 1));
  }

  else
  {
    *(_OWORD *)__p = v405;
    uint64_t v442 = v406;
  }

  uint64_t v443 = 2LL;
  uint64_t v31 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v32 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v32 = v31 + 32;
  }

  qword_100010070 = v32;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v406) < 0) {
    operator delete((void *)v405);
  }
  sub_100009298(v403, "footprint_peak");
  if (SHIBYTE(v404) < 0)
  {
    sub_100009108(__p, v403[0], (unint64_t)v403[1]);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)v403;
    uint64_t v442 = v404;
  }

  uint64_t v443 = 2LL;
  uint64_t v33 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v34 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v34 = v33 + 32;
  }

  qword_100010070 = v34;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v404) < 0) {
    operator delete(v403[0]);
  }
  if (byte_10001010A == 1)
  {
    sub_100009298(&v401, "footprint_interval_peak");
    if (SHIBYTE(v402) < 0)
    {
      sub_100009108(__p, (void *)v401, *((unint64_t *)&v401 + 1));
    }

    else
    {
      *(_OWORD *)__p = v401;
      uint64_t v442 = v402;
    }

    uint64_t v443 = 2LL;
    uint64_t v35 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v36 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v36 = v35 + 32;
    }

    qword_100010070 = v36;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v402) < 0) {
      operator delete((void *)v401);
    }
  }

  if (byte_100010060)
  {
    sub_100009298(v399, "limit");
    if (SHIBYTE(v400) < 0)
    {
      sub_100009108(__p, v399[0], (unint64_t)v399[1]);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)v399;
      uint64_t v442 = v400;
    }

    uint64_t v443 = 2LL;
    uint64_t v37 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v38 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v38 = v37 + 32;
    }

    qword_100010070 = v38;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v400) < 0) {
      operator delete(v399[0]);
    }
    if (byte_10001010B == 1)
    {
      sub_100009298(&v397, "active_limit");
      if (SHIBYTE(v398) < 0)
      {
        sub_100009108(__p, (void *)v397, *((unint64_t *)&v397 + 1));
      }

      else
      {
        *(_OWORD *)__p = v397;
        uint64_t v442 = v398;
      }

      uint64_t v443 = 0x100000002LL;
      uint64_t v39 = qword_100010070;
      if ((unint64_t)qword_100010070 >= unk_100010078)
      {
        uint64_t v40 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
      }

      else
      {
        sub_100009348(&qword_100010068, (__int128 *)__p);
        uint64_t v40 = v39 + 32;
      }

      qword_100010070 = v40;
      if (SHIBYTE(v442) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v398) < 0) {
        operator delete((void *)v397);
      }
      sub_100009298(v395, "active_limit_hard");
      if (SHIBYTE(v396) < 0)
      {
        sub_100009108(__p, v395[0], (unint64_t)v395[1]);
      }

      else
      {
        *(_OWORD *)__p = *(_OWORD *)v395;
        uint64_t v442 = v396;
      }

      uint64_t v443 = 2LL;
      uint64_t v41 = qword_100010070;
      if ((unint64_t)qword_100010070 >= unk_100010078)
      {
        uint64_t v42 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
      }

      else
      {
        sub_100009348(&qword_100010068, (__int128 *)__p);
        uint64_t v42 = v41 + 32;
      }

      qword_100010070 = v42;
      if (SHIBYTE(v442) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v396) < 0) {
        operator delete(v395[0]);
      }
      sub_100009298(&v393, "inactive_limit");
      if (SHIBYTE(v394) < 0)
      {
        sub_100009108(__p, (void *)v393, *((unint64_t *)&v393 + 1));
      }

      else
      {
        *(_OWORD *)__p = v393;
        uint64_t v442 = v394;
      }

      uint64_t v443 = 0x100000002LL;
      uint64_t v43 = qword_100010070;
      if ((unint64_t)qword_100010070 >= unk_100010078)
      {
        uint64_t v44 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
      }

      else
      {
        sub_100009348(&qword_100010068, (__int128 *)__p);
        uint64_t v44 = v43 + 32;
      }

      qword_100010070 = v44;
      if (SHIBYTE(v442) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v394) < 0) {
        operator delete((void *)v393);
      }
      sub_100009298(v391, "inactive_limit_hard");
      if (SHIBYTE(v392) < 0)
      {
        sub_100009108(__p, v391[0], (unint64_t)v391[1]);
      }

      else
      {
        *(_OWORD *)__p = *(_OWORD *)v391;
        uint64_t v442 = v392;
      }

      uint64_t v443 = 2LL;
      uint64_t v45 = qword_100010070;
      if ((unint64_t)qword_100010070 >= unk_100010078)
      {
        uint64_t v46 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
      }

      else
      {
        sub_100009348(&qword_100010068, (__int128 *)__p);
        uint64_t v46 = v45 + 32;
      }

      qword_100010070 = v46;
      if (SHIBYTE(v442) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v392) < 0) {
        operator delete(v391[0]);
      }
    }

    sub_100009298(&v389, "root_limit_increase");
    if (SHIBYTE(v390) < 0)
    {
      sub_100009108(__p, (void *)v389, *((unint64_t *)&v389 + 1));
    }

    else
    {
      *(_OWORD *)__p = v389;
      uint64_t v442 = v390;
    }

    uint64_t v443 = 2LL;
    uint64_t v47 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v48 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v48 = v47 + 32;
    }

    qword_100010070 = v48;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v390) < 0) {
      operator delete((void *)v389);
    }
  }

  sub_100009298(v387, "dirty");
  if (SHIBYTE(v388) < 0)
  {
    sub_100009108(__p, v387[0], (unint64_t)v387[1]);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)v387;
    uint64_t v442 = v388;
  }

  uint64_t v443 = 0x400000000LL;
  uint64_t v49 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v50 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v50 = v49 + 32;
  }

  qword_100010070 = v50;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v388) < 0) {
    operator delete(v387[0]);
  }
  sub_100009298(&v385, "PE");
  if (SHIBYTE(v386) < 0)
  {
    sub_100009108(__p, (void *)v385, *((unint64_t *)&v385 + 1));
  }

  else
  {
    *(_OWORD *)__p = v385;
    uint64_t v442 = v386;
  }

  uint64_t v443 = 0x400000000LL;
  uint64_t v51 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v52 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v52 = v51 + 32;
  }

  qword_100010070 = v52;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v386) < 0) {
    operator delete((void *)v385);
  }
  sub_100009298(v383, "frozen");
  if (SHIBYTE(v384) < 0)
  {
    sub_100009108(__p, v383[0], (unint64_t)v383[1]);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)v383;
    uint64_t v442 = v384;
  }

  uint64_t v443 = 0x400000000LL;
  uint64_t v53 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v54 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v54 = v53 + 32;
  }

  qword_100010070 = v54;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v384) < 0) {
    operator delete(v383[0]);
  }
  sub_100009298(&v381, "coalition");
  if (SHIBYTE(v382) < 0)
  {
    sub_100009108(__p, (void *)v381, *((unint64_t *)&v381 + 1));
  }

  else
  {
    *(_OWORD *)__p = v381;
    uint64_t v442 = v382;
  }

  uint64_t v443 = 1LL;
  uint64_t v55 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v56 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v56 = v55 + 32;
  }

  qword_100010070 = v56;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v382) < 0) {
    operator delete((void *)v381);
  }
  sub_100009298(v379, "pid");
  if (SHIBYTE(v380) < 0)
  {
    sub_100009108(__p, v379[0], (unint64_t)v379[1]);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)v379;
    uint64_t v442 = v380;
  }

  uint64_t v443 = 1LL;
  uint64_t v57 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v58 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v58 = v57 + 32;
  }

  qword_100010070 = v58;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v380) < 0) {
    operator delete(v379[0]);
  }
  sub_100009298(&v377, "name");
  if (SHIBYTE(v378) < 0)
  {
    sub_100009108(__p, (void *)v377, *((unint64_t *)&v377 + 1));
  }

  else
  {
    *(_OWORD *)__p = v377;
    uint64_t v442 = v378;
  }

  uint64_t v443 = 0x200000000LL;
  uint64_t v59 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v60 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v60 = v59 + 32;
  }

  qword_100010070 = v60;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v378) < 0) {
    operator delete((void *)v377);
  }
  sub_100009298(v375, "flags");
  if (SHIBYTE(v376) < 0)
  {
    sub_100009108(__p, v375[0], (unint64_t)v375[1]);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)v375;
    uint64_t v442 = v376;
  }

  uint64_t v443 = 0x200000000LL;
  uint64_t v61 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v62 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v62 = v61 + 32;
  }

  qword_100010070 = v62;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v376) < 0) {
    operator delete(v375[0]);
  }
  if (byte_10001010C == 1)
  {
    sub_100009298(&v373, "pages_grabbed");
    if (SHIBYTE(v374) < 0)
    {
      sub_100009108(__p, (void *)v373, *((unint64_t *)&v373 + 1));
    }

    else
    {
      *(_OWORD *)__p = v373;
      uint64_t v442 = v374;
    }

    uint64_t v443 = 1LL;
    uint64_t v63 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v64 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v64 = v63 + 32;
    }

    qword_100010070 = v64;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v374) < 0) {
      operator delete((void *)v373);
    }
    sub_100009298(v371, "pages_grabbed_kern");
    if (SHIBYTE(v372) < 0)
    {
      sub_100009108(__p, v371[0], (unint64_t)v371[1]);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)v371;
      uint64_t v442 = v372;
    }

    uint64_t v443 = 1LL;
    uint64_t v65 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v66 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v66 = v65 + 32;
    }

    qword_100010070 = v66;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v372) < 0) {
      operator delete(v371[0]);
    }
    sub_100009298(&v369, "pages_grabbed_iopl");
    if (SHIBYTE(v370) < 0)
    {
      sub_100009108(__p, (void *)v369, *((unint64_t *)&v369 + 1));
    }

    else
    {
      *(_OWORD *)__p = v369;
      uint64_t v442 = v370;
    }

    uint64_t v443 = 1LL;
    uint64_t v67 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v68 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v68 = v67 + 32;
    }

    qword_100010070 = v68;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v370) < 0) {
      operator delete((void *)v369);
    }
    sub_100009298(v367, "pages_grabbed_upl");
    if (SHIBYTE(v368) < 0)
    {
      sub_100009108(__p, v367[0], (unint64_t)v367[1]);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)v367;
      uint64_t v442 = v368;
    }

    uint64_t v443 = 1LL;
    uint64_t v69 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v70 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v70 = v69 + 32;
    }

    qword_100010070 = v70;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v368) < 0) {
      operator delete(v367[0]);
    }
  }

  if (byte_10001010D == 1)
  {
    sub_100009298(&v365, "total_dirty_time");
    if (SHIBYTE(v366) < 0)
    {
      sub_100009108(__p, (void *)v365, *((unint64_t *)&v365 + 1));
    }

    else
    {
      *(_OWORD *)__p = v365;
      uint64_t v442 = v366;
    }

    uint64_t v443 = 1LL;
    uint64_t v71 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v72 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v72 = v71 + 32;
    }

    qword_100010070 = v72;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v366) < 0) {
      operator delete((void *)v365);
    }
    sub_100009298(v363, "process_lifetime");
    if (SHIBYTE(v364) < 0)
    {
      sub_100009108(__p, v363[0], (unint64_t)v363[1]);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)v363;
      uint64_t v442 = v364;
    }

    uint64_t v443 = 1LL;
    uint64_t v73 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v74 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v74 = v73 + 32;
    }

    qword_100010070 = v74;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v364) < 0) {
      operator delete(v363[0]);
    }
    sub_100009298(&v361, "percent_dirty");
    if (SHIBYTE(v362) < 0)
    {
      sub_100009108(__p, (void *)v361, *((unint64_t *)&v361 + 1));
    }

    else
    {
      *(_OWORD *)__p = v361;
      uint64_t v442 = v362;
    }

    uint64_t v443 = 1LL;
    uint64_t v75 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v76 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v76 = v75 + 32;
    }

    qword_100010070 = v76;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v362) < 0) {
      operator delete((void *)v361);
    }
  }

  if (byte_10001010E == 1)
  {
    sub_100009298(v359, "neural");
    if (SHIBYTE(v360) < 0)
    {
      sub_100009108(__p, v359[0], (unint64_t)v359[1]);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)v359;
      uint64_t v442 = v360;
    }

    uint64_t v443 = 0LL;
    uint64_t v77 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v78 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v78 = v77 + 32;
    }

    qword_100010070 = v78;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v360) < 0) {
      operator delete(v359[0]);
    }
    sub_100009298(&v357, "neural_peak");
    if (SHIBYTE(v358) < 0)
    {
      sub_100009108(__p, (void *)v357, *((unint64_t *)&v357 + 1));
    }

    else
    {
      *(_OWORD *)__p = v357;
      uint64_t v442 = v358;
    }

    uint64_t v443 = 0LL;
    uint64_t v79 = qword_100010070;
    if ((unint64_t)qword_100010070 >= unk_100010078)
    {
      uint64_t v80 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
    }

    else
    {
      sub_100009348(&qword_100010068, (__int128 *)__p);
      uint64_t v80 = v79 + 32;
    }

    qword_100010070 = v80;
    if (SHIBYTE(v442) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v358) < 0) {
      operator delete((void *)v357);
    }
    if (byte_10001010A == 1)
    {
      sub_100009298(v355, "neural_interval_peak");
      if (SHIBYTE(v356) < 0)
      {
        sub_100009108(__p, v355[0], (unint64_t)v355[1]);
      }

      else
      {
        *(_OWORD *)__p = *(_OWORD *)v355;
        uint64_t v442 = v356;
      }

      uint64_t v443 = 0LL;
      uint64_t v81 = qword_100010070;
      if ((unint64_t)qword_100010070 >= unk_100010078)
      {
        uint64_t v82 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
      }

      else
      {
        sub_100009348(&qword_100010068, (__int128 *)__p);
        uint64_t v82 = v81 + 32;
      }

      qword_100010070 = v82;
      if (SHIBYTE(v442) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v356) < 0) {
        operator delete(v355[0]);
      }
    }
  }

  sub_100009298(&v353, "sample");
  if (SHIBYTE(v354) < 0)
  {
    sub_100009108(__p, (void *)v353, *((unint64_t *)&v353 + 1));
  }

  else
  {
    *(_OWORD *)__p = v353;
    uint64_t v442 = v354;
  }

  uint64_t v443 = 1LL;
  uint64_t v83 = qword_100010070;
  if ((unint64_t)qword_100010070 >= unk_100010078)
  {
    uint64_t v84 = sub_1000093B4(&qword_100010068, (__int128 *)__p);
  }

  else
  {
    sub_100009348(&qword_100010068, (__int128 *)__p);
    uint64_t v84 = v83 + 32;
  }

  qword_100010070 = v84;
  if (SHIBYTE(v442) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v354) < 0) {
    operator delete((void *)v353);
  }
  if (dword_100010038)
  {
    unint64_t v224 = 0LL;
    v85 = &xmmword_1000100A0;
    do
    {
      uint64_t v86 = 0LL;
      uint64_t deadline = qword_1000100F8 + mach_absolute_time();
      do
      {
        v352[0] = 0LL;
        v352[1] = 0LL;
        v351 = v352;
        if (v227 - 2 == v86)
        {
          LOBYTE(v87) = 0;
          unint64_t v88 = 0LL;
          uint64_t v89 = 1LL;
          int v90 = 999;
          uint64_t v91 = 50LL;
        }

        else if (v227 - 1 == v86)
        {
          LOBYTE(v87) = 0;
          unint64_t v88 = 0LL;
          uint64_t v91 = 0LL;
          uint64_t v89 = 0LL;
          int v90 = 999;
        }

        else
        {
          v92 = (unsigned int *)((char *)v429 + 24 * v86);
          uint64_t v89 = *v92;
          int v90 = v92[1];
          unsigned int v87 = v92[5];
          uint64_t v91 = (int)v92[4];
          unint64_t v88 = *((void *)v92 + 1);
        }

        BOOL v93 = dword_10001003C == -1 || (_DWORD)v89 == dword_10001003C;
        if (!v93)
        {
          v110 = 0LL;
          goto LABEL_515;
        }

        uint64_t v348 = 0LL;
        uint64_t v347 = 0LL;
        uint64_t v349 = 0LL;
        if ((int)v89 >= 1 && memorystatus_control(8LL, v89, 0LL, &v347, 24LL)) {
          fprintf( __stderrp,  "Warning: Failed to get memory limit info for pid %d.  Limits will appear as 0MB and not fatal.\n",  v89);
        }
        sub_100009298(v345, "active_limit");
        sub_100006128(&v351, (const void **)v345, (uint64_t)(int)v347 << 20);
        if (v346 < 0) {
          operator delete(v345[0]);
        }
        sub_100009298(v343, "inactive_limit");
        sub_100006128(&v351, (const void **)v343, (uint64_t)(int)v348 << 20);
        if (v344 < 0) {
          operator delete(v343[0]);
        }
        sub_100009298(v341, "root_limit_increase");
        sub_100006128(&v351, (const void **)v341, ((_DWORD)v349 << 20));
        int v225 = v90;
        char v226 = v87;
        v94 = (int32x4_t *)v85;
        if (v342 < 0) {
          operator delete(v341[0]);
        }
        char v95 = BYTE4(v347);
        char v96 = BYTE4(v348);
        sub_100009298(v339, "active_limit_hard");
        if ((v95 & 1) != 0) {
          v97 = "H";
        }
        else {
          v97 = "-";
        }
        sub_100009298(v337, v97);
        sub_1000063C8(&v351, (const void **)v339, (uint64_t)v337);
        if (v338 < 0) {
          operator delete(v337[0]);
        }
        if (v340 < 0) {
          operator delete(v339[0]);
        }
        sub_100009298(v335, "inactive_limit_hard");
        if ((v96 & 1) != 0) {
          v98 = "H";
        }
        else {
          v98 = "-";
        }
        sub_100009298(v333, v98);
        sub_1000063C8(&v351, (const void **)v335, (uint64_t)v333);
        if (v334 < 0) {
          operator delete(v333[0]);
        }
        if (v336 < 0) {
          operator delete(v335[0]);
        }
        if ((ledger(0LL, (int)v89, v439, 0LL) & 0x80000000) != 0)
        {
          fprintf(__stderrp, "Warning: Could not get ledger info for pid %d.\n", v89);
        }

        else
        {
          v99 = v440;
          v350 = v440;
          __p[0] = v440;
          v100.i64[0] = -1LL;
          v100.i64[1] = -1LL;
          if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(*v94, v100), (int16x8_t)vceqq_s32(v94[1], v100)))) & 1) != 0
            || v94[2].i32[0] == -1
            || v94[3].i32[1] == -1
            || v94[3].i32[2] == -1)
          {
            v101 = (char *)malloc(96LL * (void)v440);
            if (!v101) {
              exit(-1);
            }
            v102 = v101;
            if ((ledger(2LL, v101, __p, 0LL) & 0x80000000) == 0)
            {
              v103 = (char *)__p[0];
              if ((uint64_t)__p[0] >= 1)
              {
                v104 = 0LL;
                v105 = v102;
                while (strcmp(v105, "phys_footprint"))
                {
                  if (!strcmp(v105, "internal"))
                  {
                    v106 = (int *)&xmmword_1000100A0 + 1;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "internal_compressed"))
                  {
                    v106 = (int *)&xmmword_1000100A0 + 2;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "iokit_mapped"))
                  {
                    v106 = (int *)&xmmword_1000100A0 + 3;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "alternate_accounting"))
                  {
                    v106 = &dword_1000100B0;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "alternate_accounting_compressed"))
                  {
                    v106 = &dword_1000100B4;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "purgeable_nonvolatile"))
                  {
                    v106 = &dword_1000100B8;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "purgeable_nonvolatile_compress"))
                  {
                    v106 = &dword_1000100BC;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "page_table"))
                  {
                    v106 = (int *)&xmmword_1000100C0;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "pages_grabbed"))
                  {
                    v106 = (int *)&xmmword_1000100C0 + 1;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "pages_grabbed_kern"))
                  {
                    v106 = (int *)&xmmword_1000100C0 + 2;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "pages_grabbed_iopl"))
                  {
                    v106 = (int *)&xmmword_1000100C0 + 3;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "pages_grabbed_upl"))
                  {
                    v106 = &dword_1000100D0;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "memorystatus_dirty_time"))
                  {
                    v106 = &dword_1000100D4;
                    goto LABEL_503;
                  }

                  if (!strcmp(v105, "neural_nofootprint_total"))
                  {
                    v106 = &dword_1000100D8;
LABEL_503:
                    int *v106 = (int)v104;
                  }

                  ++v104;
                  v105 += 96;
                  if (v103 == v104) {
                    goto LABEL_505;
                  }
                }

                v106 = (int *)v94;
                goto LABEL_503;
              }
            }

          sub_100008478(v11, v8);
        }

        else
        {
          sub_10000970C(v10 + 3, v8);
          ++v14;
        }

        v8 += 3;
        v9 += 24LL;
        v10 += 3;
      }

      while (v8 != a2);
    }

    v13[0] = 0LL;
    sub_100008C40(v13, 0LL);
  }

LABEL_505:
            free(v102);
            v99 = v350;
          }

          v107 = malloc(48LL * (void)v99);
          if ((ledger(1LL, (int)v89, v107, &v350) & 0x80000000) == 0 && (uint64_t)v350 > (int)xmmword_1000100A0)
          {
            unint64_t v108 = v107[6 * (int)xmmword_1000100A0];
            if (byte_100010109 == 1)
            {
              sub_100009298(v331, "footprint");
              v85 = (__int128 *)v94;
              sub_100006128(&v351, v331, v108 - v107[6 * (int)xmmword_1000100C0]);
              if (v332 < 0)
              {
                v109 = v331;
                goto LABEL_519;
              }
            }

            else
            {
              sub_100009298(v329, "footprint");
              v85 = (__int128 *)v94;
              sub_100006128(&v351, v329, v108);
              if (v330 < 0)
              {
                v109 = v329;
LABEL_519:
                operator delete((void *)*v109);
              }
            }

            sub_100009298(v327, "internal");
            sub_100006128(&v351, (const void **)v327, v107[6 * SDWORD1(xmmword_1000100A0)]);
            if (v328 < 0) {
              operator delete(v327[0]);
            }
            sub_100009298(v325, "internal_comp");
            sub_100006128(&v351, (const void **)v325, v107[6 * SDWORD2(xmmword_1000100A0)]);
            if (v326 < 0) {
              operator delete(v325[0]);
            }
            sub_100009298(v323, "iokit_mapped");
            sub_100006128(&v351, (const void **)v323, v107[6 * SHIDWORD(xmmword_1000100A0)]);
            if (v324 < 0) {
              operator delete(v323[0]);
            }
            sub_100009298(v321, "alt_acct");
            sub_100006128(&v351, (const void **)v321, v107[6 * dword_1000100B0]);
            if (v322 < 0) {
              operator delete(v321[0]);
            }
            sub_100009298(v319, "alt_acct_comp");
            sub_100006128(&v351, (const void **)v319, v107[6 * dword_1000100B4]);
            if (v320 < 0) {
              operator delete(v319[0]);
            }
            if ((byte_100010109 & 1) == 0)
            {
              sub_100009298(v317, "page_table");
              sub_100006128(&v351, (const void **)v317, v107[6 * (int)xmmword_1000100C0]);
              if (v318 < 0) {
                operator delete(v317[0]);
              }
            }

            sub_100009298(v315, "purge_nonvol");
            sub_100006128(&v351, (const void **)v315, v107[6 * dword_1000100B8]);
            if (v316 < 0) {
              operator delete(v315[0]);
            }
            sub_100009298(v313, "purge_nonvol_comp");
            sub_100006128(&v351, (const void **)v313, v107[6 * dword_1000100BC]);
            if (v314 < 0) {
              operator delete(v313[0]);
            }
            sub_100009298(v311, "limit");
            sub_100006128(&v351, (const void **)v311, v91 << 20);
            if (v312 < 0) {
              operator delete(v311[0]);
            }
            if (byte_10001010C == 1)
            {
              if (DWORD1(xmmword_1000100C0) == -1)
              {
                sub_100009298(v301, "pages_grabbed");
                sub_100006468(&v351, (const void **)v301, 0LL);
                if (v302 < 0) {
                  operator delete(v301[0]);
                }
                sub_100009298(v299, "pages_grabbed_kern");
                sub_100006468(&v351, (const void **)v299, 0LL);
                if (v300 < 0) {
                  operator delete(v299[0]);
                }
                sub_100009298(v297, "pages_grabbed_iopl");
                sub_100006468(&v351, (const void **)v297, 0LL);
                if (v298 < 0) {
                  operator delete(v297[0]);
                }
                sub_100009298(v295, "pages_grabbed_upl");
                sub_100006468(&v351, v295, 0LL);
                if (v296 < 0)
                {
                  v111 = v295;
LABEL_557:
                  operator delete((void *)*v111);
                }
              }

              else
              {
                sub_100009298(v309, "pages_grabbed");
                sub_100006468(&v351, (const void **)v309, v107[6 * SDWORD1(xmmword_1000100C0)]);
                if (v310 < 0) {
                  operator delete(v309[0]);
                }
                sub_100009298(v307, "pages_grabbed_kern");
                sub_100006468(&v351, (const void **)v307, v107[6 * SDWORD2(xmmword_1000100C0)]);
                if (v308 < 0) {
                  operator delete(v307[0]);
                }
                sub_100009298(v305, "pages_grabbed_iopl");
                sub_100006468(&v351, (const void **)v305, v107[6 * SHIDWORD(xmmword_1000100C0)]);
                if (v306 < 0) {
                  operator delete(v305[0]);
                }
                sub_100009298(v303, "pages_grabbed_upl");
                sub_100006468(&v351, v303, v107[6 * dword_1000100D0]);
                if (v304 < 0)
                {
                  v111 = v303;
                  goto LABEL_557;
                }
              }
            }

            double v112 = 0.0;
            if (byte_10001010D == 1 && dword_1000100D4 != -1) {
              double v112 = (double)(uint64_t)v107[6 * dword_1000100D4] / 1000000000.0;
            }
            if (byte_10001010E == 1)
            {
              sub_100009298(v293, "neural");
              sub_100006128(&v351, (const void **)v293, v107[6 * dword_1000100D8]);
              if (v294 < 0) {
                operator delete(v293[0]);
              }
            }

            free(v107);
            if (proc_pid_rusage(v89, 6, buffer))
            {
              fprintf(__stderrp, "Warning: Could not get rusage for pid %d.\n", v89);
              sub_100009298(v291, "footprint_peak");
              sub_100006128(&v351, (const void **)v291, v108);
              double v113 = 0.0;
              if (v292 < 0) {
                operator delete(v291[0]);
              }
              BOOL v114 = 0;
              goto LABEL_583;
            }

            sub_100009298(v289, "footprint_peak");
            sub_100006128(&v351, (const void **)v289, (unint64_t)v438[26]);
            if (v290 < 0) {
              operator delete(v289[0]);
            }
            if (byte_10001010E == 1)
            {
              sub_100009298(v287, "neural_peak");
              sub_100006128(&v351, (const void **)v287, (unint64_t)v438[43]);
              if (v288 < 0) {
                operator delete(v287[0]);
              }
            }

            if (byte_10001010A == 1)
            {
              sub_100009298(v285, "footprint_interval_peak");
              sub_100006128(&v351, (const void **)v285, (unint64_t)v438[31]);
              if (v286 < 0) {
                operator delete(v285[0]);
              }
              if (byte_10001010E == 1)
              {
                sub_100009298(v283, "neural_interval_peak");
                sub_100006128(&v351, (const void **)v283, (unint64_t)v438[44]);
                if (v284 < 0) {
                  operator delete(v283[0]);
                }
              }
            }

            if (byte_10001010D == 1)
            {
              uint64_t v115 = mach_absolute_time();
              v116 = v438[6];
              if (qword_1000100E8 != -1) {
                dispatch_once(&qword_1000100E8, &stru_10000C3C0);
              }
              double v113 = *(double *)&qword_1000100E0 * (double)(v115 - (unint64_t)v116);
              BOOL v114 = v113 > 0.0;
LABEL_583:
              if (byte_10001010D == 1)
              {
                sub_100009298(v281, "total_dirty_time");
                sub_100006548(&v351, (const void **)v281, (unint64_t)v112);
                if (v282 < 0)
                {
                  operator delete(v281[0]);
                  if (!v114) {
                    goto LABEL_593;
                  }
LABEL_586:
                  sub_100009298(v279, "process_lifetime");
                  sub_100006548(&v351, (const void **)v279, (unint64_t)v113);
                  if (v280 < 0) {
                    operator delete(v279[0]);
                  }
                  sub_100009298(v277, "percent_dirty");
                  double v117 = v112 / v113;
                  v118 = "%";
                  if (byte_10001010F) {
                    v118 = (const char *)&unk_10000B85E;
                  }
                  snprintf((char *)__p, 0xAuLL, "%02.2f%s", v117 * 100.0, v118);
                  v119 = (std::string *)sub_10000695C(&v351, v277);
                  std::string::assign(v119, (const std::string::value_type *)__p);
                  v119[1].__r_.__value_.__r.__words[0] = (unint64_t)v117;
                  if (v278 < 0)
                  {
                    v120 = v277;
                    goto LABEL_601;
                  }
                }

                else
                {
                  if (v114) {
                    goto LABEL_586;
                  }
LABEL_593:
                  sub_100009298(v275, "process_lifetime");
                  sub_100009298(v273, "-");
                  sub_1000063C8(&v351, (const void **)v275, (uint64_t)v273);
                  if (v274 < 0) {
                    operator delete(v273[0]);
                  }
                  if (v276 < 0) {
                    operator delete(v275[0]);
                  }
                  sub_100009298(v271, "percent_dirty");
                  sub_100009298(v269, "-");
                  sub_1000063C8(&v351, v271, (uint64_t)v269);
                  if (v270 < 0) {
                    operator delete(v269[0]);
                  }
                  if (v272 < 0)
                  {
                    v120 = v271;
LABEL_601:
                    operator delete((void *)*v120);
                  }
                }
              }
            }

            uint64_t v268 = 0LL;
            *(_OWORD *)__val = 0u;
            __int128 v267 = 0u;
            if (proc_pidinfo(v89, 20, 0LL, __val, 40) <= 0) {
              fprintf(__stderrp, "Warning: Could not get coalitions for pid %d.\n", v89);
            }
            bzero(__p, 0x1000uLL);
            else {
              proc_pidpath(v89, __p, 0x1000u);
            }
            v121 = basename((char *)__p);
            sub_100009298(v264, "name");
            sub_100009298(v262, v121);
            sub_1000063C8(&v351, (const void **)v264, (uint64_t)v262);
            if (v263 < 0) {
              operator delete(v262[0]);
            }
            if (v265 < 0) {
              operator delete(v264[0]);
            }
            sub_100009298(v260, "coalition");
            sub_100006468(&v351, (const void **)v260, __val[1]);
            if (v261 < 0) {
              operator delete(v260[0]);
            }
            sub_100009298(v258, "pid");
            sub_100006468(&v351, (const void **)v258, (int)v89);
            if (v259 < 0) {
              operator delete(v258[0]);
            }
            sub_100009298(v256, "fds");
            sub_100006F04((uint64_t)v430);
            int v122 = proc_pidinfo(v89, 1, 0LL, 0LL, 0);
            if (v122 < 1) {
              goto LABEL_643;
            }
            unint64_t v123 = 0LL;
            v124 = 0LL;
            do
            {
              if (v123 < v122)
              {
                v123 -= 256LL;
                do
                  v123 += 256LL;
                while (v123 < v122);
                v125 = v124 ? reallocf(v124, v123) : malloc(v123);
                v124 = v125;
                if (!v125) {
                  goto LABEL_643;
                }
              }

              int v126 = proc_pidinfo(v89, 1, 0LL, v124, v123);
              unsigned int v127 = v126;
              if (v126 < 1)
              {
                uint64_t v129 = 0xFFFFFFFFLL;
LABEL_629:
                if (v124) {
                  goto LABEL_640;
                }
                goto LABEL_641;
              }

              unint64_t v128 = v126 + 8LL;
              int v122 = v123 + 8;
            }

            while (v128 >= v123);
            if (v127 < 8)
            {
              uint64_t v129 = 0LL;
              goto LABEL_629;
            }

            uint64_t v129 = 0LL;
            uint64_t v130 = v127 >> 3;
            v131 = v124 + 1;
            while (1)
            {
              if (*v131 != 1) {
                goto LABEL_637;
              }
              int v132 = proc_pidfdinfo(v89, *(v131 - 1), 1, v433, 176);
              if (v132 <= 0) {
                break;
              }
              uint64_t v129 = (v129 + 1);
LABEL_637:
              v131 += 2;
              if (!--v130) {
                goto LABEL_640;
              }
            }

            if (*__error() == 2) {
              goto LABEL_637;
            }
LABEL_639:
            uint64_t v129 = 0xFFFFFFFFLL;
LABEL_640:
            free(v124);
LABEL_641:
            v85 = (__int128 *)v94;
            if ((v129 & 0x80000000) == 0)
            {
              std::ostream::operator<<(&v431, v129);
              goto LABEL_644;
            }

LABEL_643:
            LOBYTE(v433[0]) = 45;
            sub_1000070EC(&v431, (uint64_t)v433, 1LL);
LABEL_644:
            std::stringbuf::str(&v255, v432);
            sub_100007034((uint64_t)v430);
            sub_1000063C8(&v351, (const void **)v256, (uint64_t)&v255);
            if (v257 < 0) {
              operator delete(v256[0]);
            }
            sub_100009298(v253, "priority");
            sub_100006468(&v351, (const void **)v253, v225);
            if (v254 < 0) {
              operator delete(v253[0]);
            }
            if (v225 <= 109)
            {
              if (v225 <= 49)
              {
                if (v225 <= 19)
                {
                  v133 = "(Idle)";
                  if (v225)
                  {
                    if (v225 != 10) {
                      goto LABEL_791;
                    }
                    v133 = "(Deferred)";
                  }
                }

                else
                {
                  switch(v225)
                  {
                    case 20:
                      v133 = "(Opportunistic)";
                      break;
                    case 30:
                      v133 = "(Dock)";
                      break;
                    case 40:
                      v133 = "(BG)";
                      break;
                    default:
                      goto LABEL_791;
                  }
                }

                goto LABEL_681;
              }

              if (v225 > 79)
              {
                switch(v225)
                {
                  case 'P':
                    v133 = "(UISupport)";
                    break;
                  case 'Z':
                    v133 = "(FGSupport)";
                    break;
                  case 'd':
                    v133 = "(FG)";
                    break;
                  default:
                    goto LABEL_791;
                }

                goto LABEL_681;
              }

              if (v225 == 50)
              {
                v133 = "(Phone)";
                goto LABEL_681;
              }

              if (v225 != 70)
              {
                if (v225 != 75) {
                  goto LABEL_791;
                }
                v133 = "(Freezer)";
                goto LABEL_681;
              }

LABEL_680:
              v133 = "(-)";
              goto LABEL_681;
            }

            if (v225 > 169)
            {
              if (v225 <= 199)
              {
                switch(v225)
                {
                  case 170:
                    v133 = "(RenderServer)";
                    break;
                  case 180:
                    v133 = "(Important)";
                    break;
                  case 190:
                    v133 = "(Critical)";
                    break;
                  default:
                    goto LABEL_791;
                }

                goto LABEL_681;
              }

              if (v225 != 200 && v225 != 210 && v225 != 999) {
                goto LABEL_791;
              }
              goto LABEL_680;
            }

            if (v225 > 139)
            {
              if (v225 != 140)
              {
                if (v225 == 150)
                {
                  v133 = "(DriverKit)";
                }

                else
                {
                  if (v225 != 160) {
                    goto LABEL_791;
                  }
                  v133 = "(Home)";
                }

                goto LABEL_681;
              }

              goto LABEL_680;
            }

            switch(v225)
            {
              case 110:
                goto LABEL_680;
              case 120:
                v133 = "(Audio)";
                break;
              case 130:
                v133 = "(AppleTV)";
                break;
              default:
LABEL_791:
                v133 = "(Unknown)";
                break;
            }

LABEL_681:
            sub_100009298(v251, "priority_name");
            sub_100009298(v249, v133);
            sub_1000063C8(&v351, (const void **)v251, (uint64_t)v249);
            if (v250 < 0) {
              operator delete(v249[0]);
            }
            if (v252 < 0) {
              operator delete(v251[0]);
            }
            sub_100009298(v247, "PE");
            if ((v226 & 0x10) != 0) {
              v134 = "Y";
            }
            else {
              v134 = "-";
            }
            sub_100009298(v245, v134);
            sub_1000063C8(&v351, (const void **)v247, (uint64_t)v245);
            if (v246 < 0) {
              operator delete(v245[0]);
            }
            if (v248 < 0) {
              operator delete(v247[0]);
            }
            sub_100009298(v243, "frozen");
            if ((v226 & 2) != 0) {
              v135 = "Y";
            }
            else {
              v135 = "-";
            }
            sub_100009298(v241, v135);
            sub_1000063C8(&v351, (const void **)v243, (uint64_t)v241);
            if (v242 < 0) {
              operator delete(v241[0]);
            }
            if (v244 < 0) {
              operator delete(v243[0]);
            }
            sub_100009298(v239, "dirty");
            v136 = "Y";
            if ((v226 & 0x20) == 0) {
              v136 = "N";
            }
            if ((v226 & 8) != 0) {
              v137 = (char *)v136;
            }
            else {
              v137 = "-";
            }
            sub_100009298(v237, v137);
            sub_1000063C8(&v351, (const void **)v239, (uint64_t)v237);
            if (v238 < 0) {
              operator delete(v237[0]);
            }
            if (v240 < 0) {
              operator delete(v239[0]);
            }
            memset(&v236, 0, sizeof(v236));
            if (!v88) {
              goto LABEL_722;
            }
            unint64_t v138 = 0LL;
            do
            {
              if ((v88 & 1) != 0)
              {
                if (v138 < 0x1B)
                {
                  std::string::size_type size = v236.__r_.__value_.__s.__size_;
                  if ((v236.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                    std::string::size_type size = v236.__r_.__value_.__l.__size_;
                  }
                  if (size) {
                    std::string::append(&v236, " ");
                  }
                  std::string::append(&v236, (&off_10000C3E0)[v138]);
                }

                else
                {
                  fprintf( __stderrp,  "Warning: Unknown assertion type %d. (Has BKSWorkspaceTypes.h been changed recently?)\n",  v86);
                }
              }

              ++v138;
              BOOL v140 = v88 >= 2;
              v88 >>= 1;
            }

            while (v140);
            std::string::size_type v141 = v236.__r_.__value_.__s.__size_;
            if ((v236.__r_.__value_.__s.__size_ & 0x80u) != 0) {
              std::string::size_type v141 = v236.__r_.__value_.__l.__size_;
            }
            v85 = (__int128 *)v94;
            if (!v141)
            {
LABEL_722:
              if (byte_10001010F == 1) {
                std::string::assign(&v236, "(---)");
              }
            }

            sub_100009298(v234, "flags");
            else {
              std::string __dst = v236;
            }
            sub_1000063C8(&v351, (const void **)v234, (uint64_t)&__dst);
            if (v235 < 0) {
              operator delete(v234[0]);
            }
            sub_100009298(v231, "sample");
            sub_100006468(&v351, (const void **)v231, v224);
            if (v232 < 0) {
              operator delete(v231[0]);
            }
            sub_10000970C((uint64_t *)&v229, (const void ***)&v351);
            if (qword_100010128)
            {
              if (qword_100010138 != -1) {
                dispatch_once(&qword_100010138, &stru_10000C4B8);
              }
              v142 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
              v143 = -[NSMutableDictionary initWithCapacity:]( v142,  "initWithCapacity:",  (qword_100010070 - qword_100010068) >> 5);
              if (qword_100010070 != qword_100010068)
              {
                uint64_t v144 = 0LL;
                unint64_t v145 = 0LL;
                while (1)
                {
                  v146 = objc_autoreleasePoolPush();
                  uint64_t v147 = qword_100010068;
                  v148 = (__int128 *)(qword_100010068 + v144);
                  if (*(char *)(qword_100010068 + v144 + 23) < 0)
                  {
                    sub_100009108(v430, *(void **)v148, *((void *)v148 + 1));
                  }

                  else
                  {
                    __int128 v149 = *v148;
                    v431 = (void *)*((void *)v148 + 2);
                    *(_OWORD *)v430 = v149;
                  }

                  v150 = *(std::stringbuf_vtbl **)(v147 + v144 + 24);
                  v432[0].__vftable = v150;
                  if (SHIBYTE(v431) < 0)
                  {
                    sub_100009108(v433, v430[0], (unint64_t)v430[1]);
                    LODWORD(v150) = v432[0].__vftable;
                  }

                  else
                  {
                    *(_OWORD *)v433 = *(_OWORD *)v430;
                    v434 = v431;
                  }

                  v151 = SHIBYTE(v434) >= 0 ? v433 : (void **)v433[0];
                  v152 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v151,  4LL));
                  if (!(_DWORD)v150) {
                    break;
                  }
                  if ((_DWORD)v150 == 1)
                  {
                    v157 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_10000695C(&v229, (const void **)v433)[3]);
                    v156 = (void *)objc_claimAutoreleasedReturnValue(v157);
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v143,  "setObject:forKeyedSubscript:",  v156,  v152);
LABEL_759:
                    v85 = (__int128 *)v94;
                    goto LABEL_760;
                  }

                  BOOL v93 = (_DWORD)v150 == 2;
                  v85 = (__int128 *)v94;
                  if (!v93) {
                    goto LABEL_761;
                  }
                  v153 = sub_10000695C(&v229, (const void **)v433);
                  float v155 = 0.00000095367;
                  if (byte_100010110) {
                    float v155 = 0.00097656;
                  }
                  *(float *)&double v154 = v155 * (float)(unint64_t)v153[3];
                  v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v154));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v143, "setObject:forKeyedSubscript:", v156, v152);
LABEL_760:

LABEL_761:
                  if (SHIBYTE(v434) < 0) {
                    operator delete(v433[0]);
                  }
                  if (SHIBYTE(v431) < 0) {
                    operator delete(v430[0]);
                  }
                  objc_autoreleasePoolPop(v146);
                  ++v145;
                  v144 += 32LL;
                  if (v145 >= (qword_100010070 - qword_100010068) >> 5) {
                    goto LABEL_766;
                  }
                }

                v158 = sub_10000695C(&v229, (const void **)v433);
                else {
                  uint64_t v159 = *v158;
                }
                v156 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v159,  4LL));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v143, "setObject:forKeyedSubscript:", v156, v152);
                goto LABEL_759;
              }

LABEL_766:
              unsigned int v160 = [(id)qword_100010130 evaluateWithObject:v143];
              sub_10000855C((uint64_t)&v229, v230);
              if (!v160) {
                goto LABEL_773;
              }
            }

            else
            {
              sub_10000855C((uint64_t)&v229, v230);
            }

            uint64_t v161 = qword_100010088;
            if ((unint64_t)qword_100010088 >= unk_100010090)
            {
              uint64_t v162 = sub_100009760(&qword_100010080, (const void ***)&v351);
            }

            else
            {
              sub_10000970C((uint64_t *)qword_100010088, (const void ***)&v351);
              uint64_t v162 = v161 + 24;
              qword_100010088 = v161 + 24;
            }

            qword_100010088 = v162;
LABEL_773:
            goto LABEL_514;
          }

          fprintf(__stderrp, "Warning: Could not get ledger entry info for pid %d.\n", v89);
          free(v107);
        }

        v85 = (__int128 *)v94;
LABEL_514:
        v110 = (void *)v352[0];
LABEL_515:
        sub_10000855C((uint64_t)&v351, v110);
        ++v86;
      }

      while (v86 != v227);
      if (v224 != dword_100010038) {
        uint64_t v227 = sub_100005EB4(&v429);
      }
      if (mach_wait_until(deadline))
      {
        fprintf(__stderrp, "Fatal: Failed to wait for %dms", dword_100010104);
        free(v429);
        exit(1);
      }

      ++v224;
    }

    while (v224 < dword_100010038);
  }

  free(v429);
  if (byte_10001010F) {
    int v163 = 0;
  }
  else {
    int v163 = 5;
  }
  int v228 = v163;
  LODWORD(__p[0]) = 0;
  sub_100007858(v430, (qword_100010070 - qword_100010068) >> 5, __p);
  if ((byte_10001010F & 1) == 0)
  {
    uint64_t v164 = qword_100010068;
    if (qword_100010070 != qword_100010068)
    {
      unint64_t v165 = 0LL;
      do
      {
        unint64_t v166 = v164 + 32 * v165;
        if ((*(_BYTE *)(v166 + 28) & 1) != 0
          || v165 && (*(_BYTE *)(v164 + 32LL * (v165 - 1) + 28) & 1) != 0)
        {
          LODWORD(v166) = 0;
        }

        else if (*(char *)(v166 + 23) < 0)
        {
          unint64_t v166 = *(void *)(v166 + 8);
        }

        else
        {
          LODWORD(v166) = *(unsigned __int8 *)(v166 + 23);
        }

        v167 = (char *)v430[0];
        *((_DWORD *)v430[0] + v165) = v166;
        uint64_t v168 = qword_100010080;
        if (qword_100010088 != qword_100010080)
        {
          uint64_t v169 = 0LL;
          unint64_t v170 = 0LL;
          do
          {
            v171 = sub_10000695C((uint64_t **)(v168 + v169), (const void **)(qword_100010068 + 32 * v165));
            unint64_t v172 = *((unsigned __int8 *)v171 + 23);
            if ((v172 & 0x80u) != 0LL) {
              unint64_t v172 = v171[1];
            }
            v167 = (char *)v430[0];
            unint64_t v166 = *((int *)v430[0] + v165);
            if (v172 > v166)
            {
              *((_DWORD *)v430[0] + v165) = v172;
              LODWORD(v166) = v172;
            }

            ++v170;
            uint64_t v168 = qword_100010080;
            v169 += 24LL;
          }

          while (0xAAAAAAAAAAAAAAABLL * ((qword_100010088 - qword_100010080) >> 3) > v170);
          uint64_t v164 = qword_100010068;
        }

        if (v165)
        {
          uint64_t v173 = (v165 - 1);
          uint64_t v174 = v164 + 32 * v173;
          if ((*(_BYTE *)(v174 + 28) & 1) != 0)
          {
            v175 = &v167[4 * v173];
            unint64_t v176 = *(_DWORD *)v175 + (int)v166 + 1;
            unint64_t v177 = *(char *)(v174 + 23) < 0 ? *(void *)(v174 + 8) : *(unsigned __int8 *)(v174 + 23);
            if (v177 > v176)
            {
              v178 = &v167[4 * v165];
              if ((int)v166 <= *(_DWORD *)v175)
              {
                LODWORD(v166) = *(_DWORD *)v175;
                v178 = v175;
              }

              *(_DWORD *)v178 = v166 - v176 + v177;
            }
          }
        }

        ++v165;
      }

      while (v165 < (qword_100010070 - v164) >> 5);
    }
  }

  int v179 = snprintf((char *)__p, 0x1000uLL, "%*s", v228, "#");
  uint64_t v180 = qword_100010068;
  if (qword_100010070 != qword_100010068)
  {
    uint64_t v181 = 0LL;
    int v182 = 0;
    v183 = (char *)__p + v179;
    size_t v184 = 4096LL - v179;
    do
    {
      if (byte_10001010F) {
        v185 = ",";
      }
      else {
        v185 = "  ";
      }
      if (byte_10001010F)
      {
        int v186 = *(_DWORD *)(v180 + 32 * v181 + 28);
      }

      else
      {
        uint64_t v187 = v180 + 32 * v181;
        int v186 = *(_DWORD *)(v187 + 28);
        if ((v186 & 1) != 0)
        {
          int v191 = snprintf( v183,  v184,  "%s%-*s",  "  ",  *((_DWORD *)v430[0] + v181) + *((_DWORD *)v430[0] + ++v182) + 1,  (const char *)v187);
          goto LABEL_851;
        }
      }

      uint64_t v188 = v180 + 32 * v181;
      if ((v186 & 2) != 0) {
        v189 = "%s%-*s";
      }
      else {
        v189 = "%s%*s";
      }
      if ((v186 & 4) != 0)
      {
        sub_100007544(v188, *((_DWORD *)v430[0] + v181), (uint64_t)buffer);
      }

      else if (*(char *)(v188 + 23) < 0)
      {
        sub_100009108(buffer, *(void **)v188, *(void *)(v188 + 8));
      }

      else
      {
        __int128 v190 = *(_OWORD *)v188;
        v436 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v188 + 16);
        *(_OWORD *)buffer = v190;
      }

      if (SHIBYTE(v436) >= 0) {
        v192 = buffer;
      }
      else {
        v192 = (rusage_info_t *)buffer[0];
      }
      int v191 = snprintf(v183, v184, v189, v185, *((unsigned int *)v430[0] + v181), v192);
      if (SHIBYTE(v436) < 0) {
        operator delete(buffer[0]);
      }
LABEL_851:
      v183 += v191;
      v184 -= v191;
      uint64_t v181 = ++v182;
      uint64_t v180 = qword_100010068;
    }

    while (v182 < (unint64_t)((qword_100010070 - qword_100010068) >> 5));
  }

  sub_100007684(__p);
  puts((const char *)__p);
  if (qword_100010118)
  {
    sub_100009298(v433, (char *)qword_100010118);
    v193 = (uint64_t *)qword_100010080;
    v194 = (const void ***)qword_100010088;
    if (qword_100010088 == qword_100010080)
    {
      uint64_t v197 = 0LL;
      unint64_t v198 = 0xAAAAAAAAAAAAAAABLL * ((qword_100010088 - qword_100010080) >> 3);
    }

    else
    {
      uint64_t v195 = 0LL;
      unint64_t v196 = 0LL;
      do
      {
        if (!sub_100007A28((uint64_t)&v193[v195], (const void **)v433))
        {
          fprintf(__stderrp, "Error: Unable to sort by key '%s'\n", (const char *)qword_100010118);
          sub_1000066E8(1);
        }

        ++v196;
        v193 = (uint64_t *)qword_100010080;
        v194 = (const void ***)qword_100010088;
        uint64_t v197 = qword_100010088 - qword_100010080;
        unint64_t v198 = 0xAAAAAAAAAAAAAAABLL * ((qword_100010088 - qword_100010080) >> 3);
        v195 += 3LL;
      }

      while (v198 > v196);
    }

    buffer[0] = _NSConcreteStackBlock;
    buffer[1] = (rusage_info_t)3321888768LL;
    v436 = sub_1000076F8;
    v437 = &unk_10000C4D8;
    if (SHIBYTE(v434) < 0)
    {
      sub_100009108(v438, v433[0], (unint64_t)v433[1]);
    }

    else
    {
      *(_OWORD *)v438 = *(_OWORD *)v433;
      v438[2] = v434;
    }

    v199 = buffer;
    v439[0] = v199;
    if (v197 < 1)
    {
      v200 = 0LL;
      uint64_t v202 = 0LL;
    }

    else
    {
      v200 = (uint64_t *)sub_100007AA4(v198);
      uint64_t v202 = v201;
    }

    sub_100007B0C(v193, v194, v439, v198, v200, v202);
    if (v200) {
      operator delete(v200);
    }

    if (SHIBYTE(v434) < 0) {
      operator delete(v433[0]);
    }
  }

  if (qword_100010088 != qword_100010080)
  {
    unint64_t v203 = 0LL;
    do
    {
      int v204 = snprintf((char *)__p, 0x1000uLL, "%*d", v228, v203);
      uint64_t v205 = qword_100010068;
      if (qword_100010070 != qword_100010068)
      {
        unint64_t v206 = 0LL;
        v207 = (char *)__p + v204;
        uint64_t v208 = 28LL;
        size_t v209 = 4096LL - v204;
        do
        {
          v210 = ",";
          if ((byte_10001010F & 1) == 0)
          {
            if (v206)
            {
              else {
                v210 = "  ";
              }
            }

            else
            {
              v210 = "  ";
            }
          }

          v211 = (const void **)(v205 + v208 - 28);
          int v212 = *(_DWORD *)(v205 + v208);
          if ((v212 & 2) != 0) {
            v213 = "%s%-*s";
          }
          else {
            v213 = "%s%*s";
          }
          v214 = (uint64_t **)(qword_100010080 + 24 * v203);
          if ((v212 & 4) != 0)
          {
            v216 = sub_10000695C(v214, v211);
            sub_100007544((uint64_t)v216, *((_DWORD *)v430[0] + v206), (uint64_t)v433);
          }

          else
          {
            v215 = sub_10000695C(v214, v211);
            if (*((char *)v215 + 23) < 0)
            {
              sub_100009108(v433, (void *)*v215, v215[1]);
            }

            else
            {
              *(_OWORD *)v433 = *(_OWORD *)v215;
              v434 = (void *)v215[2];
            }
          }

          if (SHIBYTE(v434) >= 0) {
            v217 = v433;
          }
          else {
            v217 = (void **)v433[0];
          }
          int v218 = snprintf(v207, v209, v213, v210, *((unsigned int *)v430[0] + v206), v217);
          if (SHIBYTE(v434) < 0) {
            operator delete(v433[0]);
          }
          v207 += v218;
          v209 -= v218;
          ++v206;
          uint64_t v205 = qword_100010068;
          v208 += 32LL;
        }

        while (v206 < (qword_100010070 - qword_100010068) >> 5);
      }

      sub_100007684(__p);
      puts((const char *)__p);
      ++v203;
    }

    while (0xAAAAAAAAAAAAAAABLL * ((qword_100010088 - qword_100010080) >> 3) > v203);
  }

  if (v430[0])
  {
    v430[1] = v430[0];
    operator delete(v430[0]);
  }

  return 0LL;
}

void sub_10000517C(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x687]) < 0) {
    operator delete((void *)STACK[0x670]);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100005EB4(void **a1)
{
  if ((dword_100010040 & 0x80000000) == 0)
  {
    if (!sub_1000068F4(dword_100010040))
    {
      fprintf( __stderrp,  "Reset interval peak for pid %d. Run with -i (or -e) to see the new interval maximum.\n",  dword_100010040);
      goto LABEL_27;
    }

LABEL_29:
    exit(71);
  }

  if ((byte_100010111 & 1) != 0 || (byte_100010121 & 1) != 0)
  {
    size_t v23 = 4LL;
    if (!sysctlbyname("kern.maxproc", &v24, &v23, 0LL, 0LL))
    {
      int v2 = v24;
      if (v24 < 0) {
        size_t v3 = -1LL;
      }
      else {
        size_t v3 = 4LL * v24;
      }
      uint64_t v4 = (int *)operator new[](v3);
      unsigned int v5 = proc_listallpids(v4, 4 * v2);
      if ((v5 & 0x80000000) == 0)
      {
        if (v5)
        {
          uint64_t v6 = v5;
          do
          {
            int v7 = *v4++;
            sub_1000068F4(v7);
            --v6;
          }

          while (v6);
        }

        fwrite( "Reset all interval peaks. Run with -i (or -e) to see the new interval maximum.\n",  0x4FuLL,  1uLL,  __stderrp);
        if (byte_100010111 != 1) {
          goto LABEL_13;
        }
LABEL_27:
        exit(0);
      }

      uint64_t v20 = __stderrp;
      uint64_t v21 = __error();
      uint64_t v22 = strerror(*v21);
      fprintf(v20, "failed to get list of processes: %s\n", v22);
    }

    goto LABEL_29;
  }

LABEL_13:
  int64_t v8 = 0LL;
  while (1)
  {
    while (1)
    {
      int v9 = memorystatus_control(1LL, 0LL, 0LL, 0LL, 0LL);
      if (v9 > 0) {
        break;
      }
      if (*__error() != 4)
      {
        uint64_t v17 = __stderrp;
        uint64_t v18 = __error();
        uint64_t v19 = strerror(*v18);
        fprintf(v17, "Error: Could not get priorityListSize: %s\n", v19);
        goto LABEL_24;
      }
    }

    int64_t v10 = v9 + 96LL;
    uint64_t v11 = *a1;
    if (v10 > v8)
    {
      uint64_t v11 = realloc(*a1, v10);
      *a1 = v11;
      int64_t v8 = v10;
    }

    int v12 = memorystatus_control(1LL, 0LL, 0LL, v11, v8);
    if (v12 > 0) {
      return v12 / 0x18u + 2;
    }
    if (*__error() != 22 && *__error() != 4)
    {
      uint64_t v13 = __stderrp;
      uint64_t v14 = __error();
      uint64_t v15 = strerror(*v14);
      fprintf(v13, "Error: Could not get jetsam priority list: %s\n", v15);
      free(*a1);
LABEL_24:
      exit(1);
    }
  }
}

void sub_100006118(void *a1)
{
}

void sub_100006128(uint64_t **a1, const void **a2, unint64_t a3)
{
  if (a3 - 0x7FFFFFFFFFFFFFFFLL > 0x8000000000000001LL)
  {
    if (byte_100010110 == 1)
    {
      unint64_t v7 = a3 >> 10;
      if (byte_10001010F) {
        int64_t v8 = (const char *)&unk_10000B85E;
      }
      else {
        int64_t v8 = "KB";
      }
      __str[0] = 0;
    }

    else
    {
      if (a3 < 0x40000001)
      {
        char v11 = 20;
        if (a3 > 0x100000)
        {
          int64_t v10 = "MB";
        }

        else
        {
          char v11 = 10;
          int64_t v10 = "KB";
        }

        if (a3 > 0x100000) {
          LOWORD(v9) = a3 >> 10;
        }
        else {
          LOWORD(v9) = a3;
        }
      }

      else
      {
        unsigned int v9 = a3 >> 20;
        int64_t v10 = "GB";
        char v11 = 30;
      }

      unint64_t v7 = a3 >> v11;
      if (byte_10001010F) {
        int64_t v8 = (const char *)&unk_10000B85E;
      }
      else {
        int64_t v8 = v10;
      }
      __str[0] = 0;
      if (v7 <= 9) {
        snprintf(__str, 4uLL, ".%d", ((5 * (v9 & 0x3FF)) >> 9) & 0x3FFFFF);
      }
    }

    snprintf(__s, 0x20uLL, "%lld%s%s", v7, __str, v8);
    sub_100009298(&__p, __s);
  }

  else
  {
    if (byte_10001010F == 1)
    {
      if (a3) {
        uint64_t v6 = "-";
      }
      else {
        uint64_t v6 = "0";
      }
LABEL_6:
      sub_100009298(&__p, v6);
      goto LABEL_31;
    }

    if (byte_100010110 == 1)
    {
      if (a3) {
        uint64_t v6 = "-";
      }
      else {
        uint64_t v6 = "0KB";
      }
      goto LABEL_6;
    }

    sub_100009298(&__p, "---");
  }

LABEL_31:
  else {
    std::string __dst = __p;
  }
  unint64_t v15 = a3;
  int v12 = (std::string *)sub_10000695C(a1, a2);
  std::string::operator=(v12, &__dst);
  v12[1].__r_.__value_.__r.__words[0] = v15;
}

void sub_10000638C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20, __int16 a21, char a22, char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000063C8(uint64_t **a1, const void **a2, uint64_t a3)
{
  else {
    std::string __p = *(std::string *)a3;
  }
  int v7 = 0;
  unsigned int v5 = (std::string *)sub_10000695C(a1, a2);
  std::string::operator=(v5, &__p);
  v5[1].__r_.__value_.__r.__words[0] = v7;
}

void sub_10000644C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006468(uint64_t **a1, const void **a2, unint64_t __val)
{
  else {
    std::string __str = v7;
  }
  unint64_t v9 = __val;
  uint64_t v6 = (std::string *)sub_10000695C(a1, a2);
  std::string::operator=(v6, &__str);
  v6[1].__r_.__value_.__r.__words[0] = v9;
}

void sub_100006514( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006548(uint64_t **a1, const void **a2, unint64_t __val)
{
  int v6 = byte_10001010F;
  std::to_string(&v13, __val);
  if ((v13.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    size_t size = v13.__r_.__value_.__s.__size_;
  }
  else {
    size_t size = v13.__r_.__value_.__l.__size_;
  }
  uint64_t v8 = v6 ^ 1u;
  p_p = &__p;
  sub_100006DF8((uint64_t)&__p, size + v8);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if (size)
  {
    if ((v13.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      int64_t v10 = &v13;
    }
    else {
      int64_t v10 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    memmove(p_p, v10, size);
  }

  char v11 = (char *)p_p + size;
  if ((v6 & 1) == 0) {
    memcpy(v11, "s", v6 ^ 1u);
  }
  v11[v8] = 0;
  else {
    std::string __str = __p;
  }
  unint64_t v16 = __val;
  int v12 = (std::string *)sub_10000695C(a1, a2);
  std::string::operator=(v12, &__str);
  v12[1].__r_.__value_.__r.__words[0] = v16;
}

void sub_10000669C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000066E8(int a1)
{
  if (byte_100010060)
  {
    fwrite("   -e: Extended output: print every column.  Equivalent to -l -f -i.\n", 0x45uLL, 1uLL, __stderrp);
    fwrite("   -i: Print interval footprint peak. Requires development kernel.\n", 0x43uLL, 1uLL, __stderrp);
    fwrite( "   -z <optional PID>: Reset interval footprint for PID (or all). Requires development kernel.\n",  0x5EuLL,  1uLL,  __stderrp);
    fwrite("   -l: Print memory limits.\n", 0x1CuLL, 1uLL, __stderrp);
    fwrite("   -f: Print some (not all) kernel ledgers.\n", 0x2CuLL, 1uLL, __stderrp);
    fwrite("       See xnu osfmk/kern/task.c and footprint(1) for details.\n", 0x3FuLL, 1uLL, __stderrp);
    fwrite( "       footprint = (internal - alt_acct) + (internal_comp - alt_acct_comp)\n + iokit_mapped + purge_nonvol + purge_nonvol_comp + page_table\n + other ledger balances not shown here\n",  0xD7uLL,  1uLL,  __stderrp);
    fwrite( "       footprint_peak: The maximum value of footprint in the task's lifetime.\n internal:       Size of the task's anonymous memory which is not compressed.\n internal_comp:  Size of the task's anonymous memory which is compressed or swapped.\n iokit_mapped:   Total size of all IOKit mappings in this task.\n alt_acct:       The number of internal pages which are part of IOKit mappings or purgeable.\n These must be subtracted to avoid double-counting.\n page_table:     The size of page table mappings for the process.\n",  0x238uLL,  1uLL,  __stderrp);
  }

  fwrite("   -p PID: Print information about a single process.\n", 0x35uLL, 1uLL, __stderrp);
  fwrite("   -s COLUMN: Sort by column name. By default, sorts by 'priority'.\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("              As a shortcut, 'mem' is an alias for 'footprint'.\n", 0x40uLL, 1uLL, __stderrp);
  fwrite("   -r: Reverse the sort order (descending instead of ascending).\n", 0x41uLL, 1uLL, __stderrp);
  fwrite( "   -w PREDICATE: Where clause to filter process list by expected column values.\n Provided format follows NSPredicate; see its documentation.\n",
    0x9DuLL,
    1uLL,
    __stderrp);
  fwrite("   -k: Print all columns in KB.\n", 0x20uLL, 1uLL, __stderrp);
  fwrite("   -c: Print output as CSV. Implies -k.\n", 0x28uLL, 1uLL, __stderrp);
  fwrite("   -n NUM: Number of samples in the time series\n", 0x30uLL, 1uLL, __stderrp);
  fwrite("   -d MS: Delay between the time series samples in ms\n", 0x36uLL, 1uLL, __stderrp);
  fwrite("   -h: Print this message and exit.\n", 0x24uLL, 1uLL, __stderrp);
  exit(a1);
}

uint64_t sub_1000068F4(int a1)
{
  uint64_t v2 = proc_reset_footprint_interval();
  if ((_DWORD)v2)
  {
    size_t v3 = __stderrp;
    uint64_t v4 = __error();
    unsigned int v5 = strerror(*v4);
    fprintf(v3, "Unable to reset footprint for %d. error: %s\n", a1, v5);
  }

  return v2;
}

uint64_t *sub_10000695C(uint64_t **a1, const void **a2)
{
  uint64_t v4 = (uint64_t **)sub_1000069D0((uint64_t)a1, &v9, a2);
  unsigned int v5 = *v4;
  if (!*v4)
  {
    int v6 = v4;
    sub_100006A6C((uint64_t)a1, (uint64_t)a2, (uint64_t)&v8);
    sub_100006B14(a1, v9, v6, v8);
    unsigned int v5 = v8;
  }

  return v5 + 7;
}

void *sub_1000069D0(uint64_t a1, void *a2, const void **a3)
{
  unsigned int v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        uint64_t v4 = *v8;
        unsigned int v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (!sub_100006B68(v7, v9, a3)) {
        break;
      }
      unsigned int v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }

    while (v4);
  }

  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }

LABEL_10:
  *a2 = v8;
  return v5;
}

double sub_100006A6C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = (char *)operator new(0x58uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(_WORD *)(a3 + 16) = 0;
  uint64_t v7 = v6 + 32;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100009108(v7, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)uint64_t v7 = *(_OWORD *)a2;
    *((void *)v6 + 6) = *(void *)(a2 + 16);
  }

  *(_WORD *)(a3 + 16) = 257;
  double result = 0.0;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  return result;
}

void sub_100006AF8(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  sub_100006D90(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_100006B14(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  double result = sub_100006BF8(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_100006B68(uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    int v6 = a2;
  }
  else {
    int v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

void sub_100006BD0()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t *sub_100006BF8(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }

          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            *size_t v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      _BYTE *v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void sub_100006D90(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t sub_100006DF8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100006E7C();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    int v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000LL;
    *(void *)a1 = v6;
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
    *(void *)a1 = 0LL;
    *(_BYTE *)(a1 + 23) = a2;
  }

  return a1;
}

void sub_100006E7C()
{
}

void sub_100006E90(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100006EE0(exception, a1);
}

void sub_100006ECC(_Unwind_Exception *a1)
{
}

std::logic_error *sub_100006EE0(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_100006F04(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  uint64_t v3 = a1 + 24;
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v5;
  *(void *)(a1 + 8) = 0LL;
  int v6 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v6, (void *)(a1 + 24));
  v6[1].__vftable = 0LL;
  v6[1].__fmtflags_ = -1;
  *(void *)(a1 + 16) = v7;
  *(void *)(v2 + *(void *)(v7 - 24)) = v8;
  *(void *)a1 = v9;
  std::streambuf::basic_streambuf(v3);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_100007008(_Unwind_Exception *a1)
{
}

uint64_t sub_100007034(uint64_t a1)
{
  uint64_t v4 = a1 + 24;
  *(void *)(a1 + 16) = v3;
  std::streambuf::~streambuf(v4);
  std::ios::~ios(a1 + 128);
  return a1;
}

void sub_1000070BC(_Unwind_Exception *a1)
{
}

void *sub_1000070EC(void *a1, uint64_t a2, uint64_t a3)
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
    if (!sub_100007254(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_1000071F4( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_100007240(_Unwind_Exception *a1)
{
}

uint64_t sub_100007254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_100007390(__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_100007374( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100007390(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100006E7C();
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

void sub_100007438(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  qword_100010128,  4LL));
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v3));
  uint64_t v2 = (void *)qword_100010130;
  qword_100010130 = v1;
}

#error "100007504: call analysis failed (funcsize=25)"
void sub_100007530(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100007544(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0) {
    int v5 = *(_DWORD *)(a1 + 8);
  }
  int v6 = a2 - v5;
  if (a2 >= v5) {
    int v7 = a2 - v5;
  }
  else {
    int v7 = v6 + 1;
  }
  size_t v8 = (v6 - (v7 >> 1));
  else {
    sub_100007390(__b, v8, 32);
  }
  if (v6 < 2) {
    sub_100009298(v11, (char *)&unk_10000B85E);
  }
  else {
    sub_100007390(v11, (v7 >> 1), 32);
  }
  sub_100007960((const void **)__b, (const void **)a1, (uint64_t)__p);
  sub_100007960((const void **)__p, (const void **)v11, a3);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  if (v14 < 0) {
    operator delete(__b[0]);
  }
}

void sub_100007638( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, void *a22, uint64_t a23, int a24, __int16 a25, char a26, char a27)
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
  _Unwind_Resume(exception_object);
}

_BYTE *sub_100007684(_BYTE *result)
{
  if (!result || (int v1 = *result, !*result))
  {
    fwrite("Fatal: NULL or empty line passed to rstrip().\n", 0x2EuLL, 1uLL, __stderrp);
    exit(-1);
  }

  uint64_t v2 = 0LL;
  int v3 = -1;
  while (1)
  {
    if (v1 == 32) {
      goto LABEL_7;
    }
    if (!v1) {
      break;
    }
    int v3 = v2;
LABEL_7:
    int v1 = result[++v2];
  }

  result[v3 + 1] = 0;
  return result;
}

uint64_t sub_1000076F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = (const void **)(a1 + 32);
  unint64_t v6 = *(void *)(sub_1000077D8(a2, (const void **)(a1 + 32)) + 24);
  unint64_t v7 = *(void *)(sub_1000077D8(a3, v5) + 24);
  if (v6 | v7)
  {
    BOOL v18 = v6 < v7;
  }

  else
  {
    uint64_t v8 = sub_1000077D8(a2, v5);
    uint64_t v9 = sub_1000077D8(a3, v5);
    int v10 = *(char *)(v9 + 23);
    int v11 = *(char *)(v8 + 23);
    if (v11 >= 0) {
      size_t v12 = *(unsigned __int8 *)(v8 + 23);
    }
    else {
      size_t v12 = *(void *)(v8 + 8);
    }
    if (v11 >= 0) {
      uint64_t v13 = (const void *)v8;
    }
    else {
      uint64_t v13 = *(const void **)v8;
    }
    if (v10 >= 0) {
      size_t v14 = *(unsigned __int8 *)(v9 + 23);
    }
    else {
      size_t v14 = *(void *)(v9 + 8);
    }
    if (v10 >= 0) {
      uint64_t v15 = (const void *)v9;
    }
    else {
      uint64_t v15 = *(const void **)v9;
    }
    if (v14 >= v12) {
      size_t v16 = v12;
    }
    else {
      size_t v16 = v14;
    }
    int v17 = memcmp(v13, v15, v16);
    BOOL v18 = v12 < v14;
    if (v17) {
      BOOL v18 = v17 < 0;
    }
  }

  return (v18 ^ byte_100010120) & 1;
}

uint64_t sub_1000077D8(uint64_t a1, const void **a2)
{
  uint64_t v2 = *sub_1000069D0(a1, &v4, a2);
  if (!v2) {
    sub_100009094("map::at:  key not found");
  }
  return v2 + 56;
}

void *sub_100007814(uint64_t a1, uint64_t a2)
{
  double result = (void *)(a1 + 32);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  result[2] = *(void *)(a2 + 48);
  *(_OWORD *)double result = v3;
  return result;
}

void sub_100007844(uint64_t a1)
{
}

void *sub_100007858(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_1000078D8(a1, a2);
    unint64_t v6 = (_DWORD *)a1[1];
    unint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4LL;
    }

    while (v8);
    a1[1] = v7;
  }

  return a1;
}

void sub_1000078BC(_Unwind_Exception *exception_object)
{
  __int128 v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::iostream::~basic_iostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_1000078D8(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100007918();
  }
  double result = (char *)sub_10000792C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void sub_100007918()
{
}

void *sub_10000792C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100006BD0();
  }
  return operator new(4 * a2);
}

uint64_t sub_100007960@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  else {
    size_t v5 = (size_t)a1[1];
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = sub_100006DF8(a3, v6 + v5);
  else {
    uint64_t v8 = *(char **)result;
  }
  if (v5)
  {
    else {
      uint64_t v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }

  int v10 = &v8[v5];
  if (v6)
  {
    else {
      int v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }

  v10[v6] = 0;
  return result;
}

uint64_t sub_100007A28(uint64_t a1, const void **a2)
{
  uint64_t v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = a1 + 16;
    uint64_t v5 = 1LL;
    do
    {
      if (!sub_100006B68(v4, a2, v2 + 4))
      {
        if (!sub_100006B68(v4, v2 + 4, a2)) {
          return v5;
        }
        ++v2;
      }

      uint64_t v2 = (const void **)*v2;
    }

    while (v2);
  }

  return 0LL;
}

void *sub_100007AA4(uint64_t a1)
{
  if (a1 < 1) {
    return 0LL;
  }
  if (a1 >= 0x555555555555555LL) {
    unint64_t v1 = 0x555555555555555LL;
  }
  else {
    unint64_t v1 = a1;
  }
  while (1)
  {
    uint64_t result = operator new(24 * v1, &std::nothrow);
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

void sub_100007B0C(uint64_t *a1, const void ***a2, id *a3, unint64_t a4, uint64_t *a5, uint64_t a6)
{
  if (a4 >= 2)
  {
    if (a4 == 2)
    {
    }

    else if ((uint64_t)a4 <= 0)
    {
      sub_100007CF4((uint64_t)a1, a2, (uint64_t)a3);
    }

    else
    {
      uint64_t v12 = a4 >> 1;
      uint64_t v13 = (const void ***)&a1[3 * (a4 >> 1)];
      if ((uint64_t)a4 <= a6)
      {
        v17[0] = (uint64_t)a5;
        v17[1] = (uint64_t)&v18;
        unint64_t v18 = 0LL;
        sub_100007DF8((const void ***)a1, (const void ***)&a1[3 * (a4 >> 1)], (uint64_t)a3, a4 >> 1, a5);
        unint64_t v18 = a4 >> 1;
        unint64_t v15 = a4 - v12;
        size_t v16 = &a5[3 * v12];
        sub_100007DF8((const void ***)&a1[3 * (a4 >> 1)], a2, (uint64_t)a3, v15, v16);
        unint64_t v18 = a4;
        sub_100007FB0( (uint64_t)a5,  (const void ***)v16,  (const void ***)v16,  (const void ***)&a5[3 * a4],  (uint64_t)a1,  (uint64_t)a3);
        sub_100008C40(v17, 0LL);
      }

      else
      {
        sub_100007B0C(a1, &a1[3 * (a4 >> 1)], a3, a4 >> 1, a5, a6);
        uint64_t v14 = a4 - v12;
        sub_100007B0C(v13, a2, a3, v14, a5, a6);
        sub_100008094((uint64_t)a1, v13, a2, a3, v12, v14, (const void ***)a5, a6);
      }
    }
  }

void sub_100007CDC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_100007CF4(uint64_t a1, const void ***a2, uint64_t a3)
{
  if ((const void ***)a1 != a2)
  {
    uint64_t v5 = (const void ***)(a1 + 24);
    if ((const void ***)(a1 + 24) != a2)
    {
      uint64_t v7 = 0LL;
      do
      {
        uint64_t v8 = v5;
        if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
        {
          sub_10000970C((uint64_t *)v11, v8);
          uint64_t v9 = v7;
          while (1)
          {
            sub_100008478(a1 + v9 + 24, (const void ***)(a1 + v9));
            if (!v9) {
              break;
            }
            v9 -= 24LL;
            if (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0)
            {
              uint64_t v10 = a1 + v9 + 24;
              goto LABEL_10;
            }
          }

          uint64_t v10 = a1;
LABEL_10:
          sub_100008478(v10, v11);
          sub_10000855C((uint64_t)v11, v11[1]);
        }

        uint64_t v5 = v8 + 3;
        v7 += 24LL;
      }

      while (v8 + 3 != a2);
    }
  }

void sub_100007DDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

void sub_100007DF8(const void ***a1, const void ***a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  if (a4)
  {
    if (a4 == 2)
    {
      v11[0] = (uint64_t)a5;
      v11[1] = (uint64_t)&v12;
      uint64_t v12 = 0LL;
      uint64_t v10 = a2 - 3;
      if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
      {
        sub_10000970C(a5, a2 - 3);
        uint64_t v10 = a1;
      }

      else
      {
        sub_10000970C(a5, a1);
      }

      ++v12;
      sub_10000970C(a5 + 3, v10);
      v11[0] = 0LL;
      sub_100008C40(v11, 0LL);
    }

    else if (a4 == 1)
    {
      sub_10000970C(a5, a1);
    }

    else if ((uint64_t)a4 > 8)
    {
      sub_100007B0C(a1, &a1[3 * (a4 >> 1)], a3, a4 >> 1, a5, a4 >> 1);
      sub_100007B0C(&a1[3 * (a4 >> 1)], a2, a3, a4 - (a4 >> 1), &a5[3 * (a4 >> 1)], a4 - (a4 >> 1));
      sub_100008AE8(a1, &a1[3 * (a4 >> 1)], &a1[3 * (a4 >> 1)], a2, (uint64_t)a5, a3);
    }

    else
    {
      sub_10000896C(a1, a2, a5, a3);
    }
  }

void sub_100007F98(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_100007FB0( uint64_t result, const void ***a2, const void ***a3, const void ***a4, uint64_t a5, uint64_t a6)
{
  if ((const void ***)result == a2)
  {
LABEL_10:
    while (a3 != a4)
    {
      uint64_t result = sub_100008478(a5, a3);
      a3 += 3;
      a5 += 24LL;
    }
  }

  else
  {
    int v11 = (const void ***)result;
    while (a3 != a4)
    {
      if ((*(unsigned int (**)(void))(*(void *)a6 + 16LL))())
      {
        uint64_t result = sub_100008478(a5, a3);
        a3 += 3;
      }

      else
      {
        uint64_t result = sub_100008478(a5, v11);
        v11 += 3;
      }

      a5 += 24LL;
      if (v11 == a2) {
        goto LABEL_10;
      }
    }

    if (v11 != a2)
    {
      uint64_t v12 = 0LL;
      do
      {
        uint64_t result = sub_100008478(a5 + v12 * 8, &v11[v12]);
        v12 += 3LL;
      }

      while (&v11[v12] != a2);
    }
  }

  return result;
}

void sub_100008094( uint64_t a1, const void ***a2, const void ***a3, id *a4, uint64_t a5, uint64_t a6, const void ***a7, uint64_t a8)
{
  uint64_t v46 = a6;
  if (a6)
  {
    do
    {
      if (v46 <= a8 || a5 <= a8)
      {
        sub_100008C9C(a1, a2, a3, (uint64_t)a4, a5, v46, a7);
        return;
      }

      if (!a5) {
        return;
      }
      uint64_t v13 = 0LL;
      uint64_t v14 = -a5;
      while (1)
      {
        uint64_t v15 = (uint64_t)v13 + a1;
        v13 += 3;
        if (__CFADD__(v14++, 1LL)) {
          return;
        }
      }

      uint64_t v17 = -v14;
      uint64_t v18 = v46;
      uint64_t v44 = a3;
      if (-v14 >= v46)
      {
        if (v14 == -1)
        {
          sub_100008420((uint64_t *)((char *)v13 + a1), (uint64_t)a2);
          return;
        }

        if (v14 > 0) {
          uint64_t v17 = 1 - v14;
        }
        uint64_t v42 = v17 >> 1;
        uint64_t v22 = (uint64_t *)((char *)&v13[3 * (v17 >> 1)] + a1);
        uint64_t v26 = (uint64_t (**)(id, void, uint64_t *))*a4;
        uint64_t v27 = a3;
        uint64_t v21 = (uint64_t)a2;
        if (a2 != v27)
        {
          uint64_t v40 = a4;
          unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * (v44 - a2);
          uint64_t v21 = (uint64_t)a2;
          do
          {
            unint64_t v29 = v21 + 24 * (v28 >> 1);
            int v30 = v26[2](v26, v29, v22);
            if (v30) {
              v28 += ~(v28 >> 1);
            }
            else {
              v28 >>= 1;
            }
            if (v30) {
              uint64_t v21 = v29 + 24;
            }
          }

          while (v28);
          a4 = v40;
          uint64_t v18 = v46;
        }

        uint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v21 - (uint64_t)a2) >> 3);
        unint64_t v25 = v42;
      }

      else
      {
        if (v46 >= 0) {
          uint64_t v19 = v46;
        }
        else {
          uint64_t v19 = v46 + 1;
        }
        uint64_t v20 = v19 >> 1;
        uint64_t v21 = (uint64_t)&a2[3 * (v19 >> 1)];
        uint64_t v22 = (uint64_t *)a2;
        if ((const void ***)((char *)a2 - a1) != v13)
        {
          uint64_t v41 = v19 >> 1;
          uint64_t v43 = a8;
          size_t v23 = a4;
          unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - a1 - (char *)v13) >> 3);
          uint64_t v22 = (uint64_t *)((char *)v13 + a1);
          do
          {
            if ((*((unsigned int (**)(void))*v23 + 2))())
            {
              v24 >>= 1;
            }

            else
            {
              v22 += 3 * (v24 >> 1) + 3;
              v24 += ~(v24 >> 1);
            }
          }

          while (v24);
          a4 = v23;
          uint64_t v20 = v41;
          a8 = v43;
          uint64_t v18 = v46;
        }

        unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * (((char *)v22 - a1 - (char *)v13) >> 3);
      }

      if (v22 == (uint64_t *)a2)
      {
        uint64_t v35 = (const void ***)v21;
      }

      else if ((const void ***)v21 == a2)
      {
        uint64_t v35 = (const void ***)v22;
      }

      else
      {
        uint64_t v31 = (uint64_t)a2;
        unint64_t v32 = v25;
        uint64_t v33 = v20;
        uint64_t v34 = sub_100008FE0(v22, v31, v21);
        uint64_t v20 = v33;
        unint64_t v25 = v32;
        uint64_t v35 = (const void ***)v34;
      }

      a5 = -(uint64_t)v25 - v14;
      uint64_t v36 = v18;
      uint64_t v37 = v18 - v20;
      if ((uint64_t)(v25 + v20) >= (uint64_t)(v36 - (v25 + v20) - v14))
      {
        unint64_t v38 = v25;
        uint64_t v39 = v20;
        sub_100008094(v35, v21, v44, a4, -(uint64_t)v25 - v14, v37, a7, a8);
        a3 = v35;
        a2 = (const void ***)v22;
        uint64_t v37 = v39;
        a5 = v38;
      }

      else
      {
        sub_100008094((char *)v13 + a1, v22, v35, a4, v25, v20, a7, a8);
        uint64_t v15 = (uint64_t)v35;
        a2 = (const void ***)v21;
        a3 = v44;
      }

      uint64_t v46 = v37;
      a1 = v15;
    }

    while (v37);
  }

void sub_100008410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_100008420(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = *(void *)a2;
  *(void *)a2 = v2;
  uint64_t v5 = result[1];
  uint64_t v4 = result[2];
  BOOL v3 = result + 1;
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + std::iostream::~basic_iostream(v2, v3 + 8) = v5;
  *(void *)(a2 + 16) = v4;
  if (result[2]) {
    uint64_t result = (uint64_t *)(*v3 + 16LL);
  }
  *uint64_t result = (uint64_t)v3;
  size_t v6 = (void *)(*(void *)(a2 + 8) + 16LL);
  if (!v4) {
    size_t v6 = (void *)a2;
  }
  *size_t v6 = a2 + 8;
  return result;
}

uint64_t sub_100008478(uint64_t a1, const void ***a2)
{
  if ((const void ***)a1 != a2)
  {
    uint64_t v4 = (void *)(a1 + 8);
    sub_10000855C(a1, *(void **)(a1 + 8));
    *(void *)a1 = v4;
    *(void *)(a1 + 16) = 0LL;
    *uint64_t v4 = 0LL;
    sub_1000084D8((uint64_t *)a1, *a2, a2 + 1);
  }

  return a1;
}

uint64_t *sub_1000084D8(uint64_t *result, const void **a2, const void ***a3)
{
  if (a2 != (const void **)a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    size_t v6 = result + 1;
    do
    {
      uint64_t result = sub_1000085F4(v5, v6, v4 + 4, (__int128 *)v4 + 2);
      uint64_t v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = (const void ***)v7;
          uint64_t v7 = (const void **)*v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          uint64_t v8 = (const void ***)v4[2];
          BOOL v9 = *v8 == v4;
          uint64_t v4 = (const void **)v8;
        }

        while (!v9);
      }

      uint64_t v4 = (const void **)v8;
    }

    while (v8 != a3);
  }

  return result;
}

void sub_10000855C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10000855C(a1, *a2);
    sub_10000855C(a1, a2[1]);
    sub_1000085B0((uint64_t)(a2 + 4));
    operator delete(a2);
  }

void sub_1000085B0(uint64_t a1)
{
}

uint64_t *sub_1000085F4(uint64_t **a1, uint64_t *a2, const void **a3, __int128 *a4)
{
  size_t v6 = (uint64_t **)sub_100008674(a1, a2, &v10, &v9, a3);
  uint64_t result = *v6;
  if (!*v6)
  {
    sub_10000880C((uint64_t)a1, a4, (uint64_t)&v8);
    sub_100006B14(a1, (uint64_t)v10, v6, v8);
    return v8;
  }

  return result;
}

const void **sub_100008674(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  uint64_t v9 = (const void **)(a1 + 1);
  if (a1 + 1 == a2 || sub_100006B68((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v12 = (const void **)a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }

      else
      {
        *a3 = (const void **)a2;
        return (const void **)a2;
      }
    }

    int v11 = (const void **)*a2;
    if (*a2)
    {
      do
      {
        uint64_t v12 = v11;
        int v11 = (const void **)v11[1];
      }

      while (v11);
    }

    else
    {
      size_t v16 = a2;
      do
      {
        uint64_t v12 = (const void **)v16[2];
        BOOL v17 = *v12 == v16;
        size_t v16 = (uint64_t *)v12;
      }

      while (v17);
    }

    return (const void **)sub_1000069D0((uint64_t)a1, a3, a5);
  }

  if (sub_100006B68((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
  {
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      uint64_t v14 = (const void **)a2[1];
      do
      {
        uint64_t v15 = v14;
        uint64_t v14 = (const void **)*v14;
      }

      while (v14);
    }

    else
    {
      uint64_t v18 = (const void **)a2;
      do
      {
        uint64_t v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        uint64_t v18 = v15;
      }

      while (!v17);
    }

    if (v15 != v9)
    {
      uint64_t v13 = *a4;
    }

    if (v13)
    {
      *a3 = v15;
      return v15;
    }

    else
    {
      *a3 = (const void **)a2;
    }

    return (const void **)a4;
  }

  *a3 = (const void **)a2;
  *a4 = (uint64_t)a2;
  return (const void **)a4;
}

char *sub_10000880C@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  size_t v6 = (char *)operator new(0x58uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + std::iostream::~basic_iostream(v2, v3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  uint64_t result = sub_10000888C(v6 + 32, a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_100008870(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  sub_100008928(v3, v2);
  _Unwind_Resume(a1);
}

char *sub_10000888C(char *__dst, __int128 *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_100009108(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)std::string __dst = v4;
  }

  uint64_t v5 = __dst + 24;
  if (*((char *)a2 + 47) < 0)
  {
    sub_100009108(v5, *((void **)a2 + 3), *((void *)a2 + 4));
  }

  else
  {
    __int128 v6 = *(__int128 *)((char *)a2 + 24);
    *((void *)__dst + 5) = *((void *)a2 + 5);
    *(_OWORD *)uint64_t v5 = v6;
  }

  *((void *)__dst + 6) = *((void *)a2 + 6);
  return __dst;
}

void sub_10000890C(_Unwind_Exception *exception_object)
{
}

void sub_100008928(uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8)) {
    sub_1000085B0((uint64_t)__p + 32);
  }
  if (__p) {
    operator delete(__p);
  }
}

void sub_10000896C(const void ***a1, const void ***a2, uint64_t *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    v13[0] = (uint64_t)a3;
    v13[1] = (uint64_t)&v14;
    uint64_t v14 = 0LL;
    sub_10000970C(a3, a1);
    ++v14;
    uint64_t v8 = a1 + 3;
    if (v8 != a2)
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = a3;
      do
      {
        if ((*(unsigned int (**)(void))(*(void *)a4 + 16LL))())
        {
          sub_10000970C(v10 + 3, (const void ***)v10);
          ++v14;
          uint64_t v11 = (uint64_t)a3;
          if (v10 != a3)
          {
            uint64_t v12 = v9;
            while ((*(unsigned int (**)(void))(*(void *)a4 + 16LL))())
            {
              sub_100008478((uint64_t)a3 + v12, (const void ***)((char *)a3 + v12 - 24));
              v12 -= 24LL;
              if (!v12)
              {
                uint64_t v11 = (uint64_t)a3;
                goto LABEL_12;
              }
            }

            uint64_t v11 = (uint64_t)a3 + v12;
          }

void sub_100008AC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_100008AE8( const void ***a1, const void ***a2, const void ***a3, const void ***a4, uint64_t a5, uint64_t a6)
{
  __int128 v6 = (uint64_t *)a5;
  v13[0] = a5;
  v13[1] = (uint64_t)&v14;
  uint64_t v14 = 0LL;
  if (a1 == a2)
  {
LABEL_10:
    while (a3 != a4)
    {
      sub_10000970C(v6, a3);
      a3 += 3;
      v6 += 3;
      ++v14;
    }
  }

  else
  {
    uint64_t v11 = a1;
    while (a3 != a4)
    {
      if ((*(unsigned int (**)(void))(*(void *)a6 + 16LL))())
      {
        sub_10000970C(v6, a3);
        ++v14;
        a3 += 3;
      }

      else
      {
        sub_10000970C(v6, v11);
        ++v14;
        v11 += 3;
      }

      v6 += 3;
      if (v11 == a2) {
        goto LABEL_10;
      }
    }

    if (v11 != a2)
    {
      uint64_t v12 = 0LL;
      do
      {
        sub_10000970C(&v6[v12], &v11[v12]);
        ++v14;
        v12 += 3LL;
      }

      while (&v11[v12] != a2);
    }
  }

  v13[0] = 0LL;
  sub_100008C40(v13, 0LL);
}

void sub_100008C20(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_100008C40(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    uint64_t v3 = (unint64_t *)a1[1];
    if (*v3)
    {
      unint64_t v4 = 0LL;
      do
      {
        sub_10000855C(v2, *(void **)(v2 + 8));
        ++v4;
        v2 += 24LL;
      }

      while (v4 < *v3);
    }
  }

void sub_100008C9C( uint64_t a1, const void ***a2, const void ***a3, uint64_t a4, uint64_t a5, uint64_t a6, const void ***a7)
{
  v18[0] = (uint64_t)a7;
  v18[1] = (uint64_t)&v19;
  uint64_t v19 = 0LL;
  if (a5 <= a6)
  {
    uint64_t v15 = (uint64_t *)a7;
    if ((const void ***)a1 != a2)
    {
      uint64_t v15 = (uint64_t *)a7;
      size_t v16 = (const void ***)a1;
      do
      {
        sub_10000970C(v15, v16);
        ++v19;
        v16 += 3;
        v15 += 3;
      }

      while (v16 != a2);
    }

    sub_100008DF0(a7, (const void ***)v15, a2, a3, a1, a4);
  }

  else
  {
    uint64_t v12 = (uint64_t *)a7;
    if (a2 != a3)
    {
      uint64_t v12 = (uint64_t *)a7;
      uint64_t v13 = a2;
      do
      {
        uint64_t v14 = sub_10000970C(v12, v13);
        ++v19;
        v13 += 3;
        uint64_t v12 = v14 + 3;
      }

      while (v13 != a3);
    }

    uint64_t v17 = a4;
    sub_100008EBC( (uint64_t)v12,  (uint64_t)v12,  (uint64_t)a7,  (uint64_t)a7,  (uint64_t)a2,  (uint64_t)a2,  a1,  a1,  (uint64_t)a3,  (uint64_t)a3,  (uint64_t)&v17);
  }

  sub_100008C40(v18, 0LL);
}

void sub_100008DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

const void ***sub_100008DF0( const void ***result, const void ***a2, const void ***a3, const void ***a4, uint64_t a5, uint64_t a6)
{
  if (result != a2)
  {
    uint64_t v7 = a5;
    uint64_t v11 = result;
    uint64_t v12 = a5;
    while (a3 != a4)
    {
      if ((*(unsigned int (**)(void))(*(void *)a6 + 16LL))())
      {
        uint64_t result = (const void ***)sub_100008478(v12, a3);
        a3 += 3;
      }

      else
      {
        uint64_t result = (const void ***)sub_100008478(v12, v11);
        v11 += 3;
      }

      v12 += 24LL;
      v7 += 24LL;
      if (v11 == a2) {
        return result;
      }
    }

    return sub_100008F7C(v11, a2, v7);
  }

  return result;
}

void sub_100008EBC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 != a4)
  {
    uint64_t v14 = a2;
    uint64_t v15 = a10 - 24;
    while (a6 != a8)
    {
      int v16 = (*(uint64_t (**)(void))(**(void **)a11 + 16LL))();
      if (v16) {
        uint64_t v17 = (const void ***)(a6 - 24);
      }
      else {
        uint64_t v17 = (const void ***)(v14 - 24);
      }
      if (v16) {
        a6 -= 24LL;
      }
      else {
        v14 -= 24LL;
      }
      sub_100008478(v15, v17);
      v15 -= 24LL;
      if (v14 == a4) {
        return;
      }
    }

    uint64_t v18 = 0LL;
    do
    {
      uint64_t v19 = v15 + v18;
      v18 -= 24LL;
      sub_100008478(v19, (const void ***)(v14 + v18));
    }

    while (v14 + v18 != a4);
  }

const void ***sub_100008F7C(const void ***a1, const void ***a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unint64_t v4 = a1;
  if (a1 != a2)
  {
    uint64_t v6 = a3;
    do
    {
      sub_100008478(v6, v4);
      v4 += 3;
      v6 += 24LL;
      v3 += 24LL;
    }

    while (v4 != a2);
    return a2;
  }

  return v4;
}

uint64_t *sub_100008FE0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = (uint64_t *)a2;
  sub_100008420(a1, a2);
  uint64_t v6 = a1 + 3;
  for (uint64_t i = (uint64_t)(v4 + 3); i != a3; i += 24LL)
  {
    if (v6 == v4) {
      unint64_t v4 = (uint64_t *)i;
    }
    sub_100008420(v6, i);
    v6 += 3;
  }

  if (v6 != v4)
  {
    uint64_t v8 = v6;
    uint64_t v9 = (uint64_t)v4;
    do
    {
      while (1)
      {
        sub_100008420(v8, v9);
        v8 += 3;
        v9 += 24LL;
        if (v9 == a3) {
          break;
        }
        if (v8 == v4) {
          unint64_t v4 = (uint64_t *)v9;
        }
      }

      uint64_t v9 = (uint64_t)v4;
    }

    while (v8 != v4);
  }

  return v6;
}

void sub_100009094(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000090E4(exception, a1);
}

void sub_1000090D0(_Unwind_Exception *a1)
{
}

std::logic_error *sub_1000090E4(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100009108(_BYTE *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_100006E7C();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    void *v5 = v8;
    uint64_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_100009194(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_1000091D4((uint64_t *)v2);
    operator delete(**a1);
  }

void sub_1000091D4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32LL)
  {
  }

  a1[1] = v2;
}

void sub_100009220(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 24;
        sub_10000855C((uint64_t)(v4 - 24), *((void **)v4 - 2));
        unint64_t v4 = v6;
      }

      while (v6 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void *sub_100009298(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100006E7C();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void *sub_100009348(void *result, __int128 *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    uint64_t result = sub_100009108((_BYTE *)result[1], *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v5 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v5;
  }

  *(void *)(v4 + 24) = *((void *)a2 + 3);
  v3[1] = v4 + 32;
  return result;
}

void sub_1000093AC(_Unwind_Exception *a1)
{
  *(void *)(v1 + std::iostream::~basic_iostream(v2, v3 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_1000093B4(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 5;
  unint64_t v5 = v4 + 1;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 4 > v5) {
    unint64_t v5 = v8 >> 4;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  if (v9) {
    uint64_t v10 = sub_100009538(v7, v9);
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v11 = (char *)&v10[4 * v4];
  v15[0] = v10;
  v15[1] = v11;
  int v16 = v11;
  uint64_t v17 = (char *)&v10[4 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_100009108(v11, *(void **)a2, *((void *)a2 + 1));
    uint64_t v11 = v16;
  }

  else
  {
    __int128 v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v11 = v12;
  }

  v10[4 * v4 + 3] = *((void *)a2 + 3);
  int v16 = v11 + 32;
  sub_1000094C4(a1, v15);
  uint64_t v13 = a1[1];
  sub_100009684((uint64_t)v15);
  return v13;
}

void sub_1000094AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_1000094C4(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000956C((uint64_t)(a1 + 2), a1[1], (__int128 *)a1[1], *a1, (__int128 *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_100009538(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_100006BD0();
  }
  return operator new(32 * a2);
}

uint64_t sub_10000956C( uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  uint64_t v14 = a6;
  uint64_t v15 = a7;
  if (a3 != a5)
  {
    unint64_t v9 = (void **)a3;
    do
    {
      uint64_t v10 = (_BYTE *)(v7 - 32);
      uint64_t v11 = (__int128 *)(v9 - 4);
      if (*((char *)v9 - 9) < 0)
      {
        sub_100009108(v10, *(v9 - 4), (unint64_t)*(v9 - 3));
      }

      else
      {
        __int128 v12 = *v11;
        *(void *)(v7 - 16) = *(v9 - 2);
        *(_OWORD *)uint64_t v10 = v12;
      }

      *(void *)(v7 - std::iostream::~basic_iostream(v2, v3 + 8) = *(v9 - 1);
      uint64_t v7 = v15 - 32;
      v15 -= 32LL;
      v9 -= 4;
    }

    while (v11 != a5);
    return v14;
  }

  return a6;
}

void sub_100009620( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (!a12) {
    sub_100009640((uint64_t)&a9);
  }
  _Unwind_Resume(exception_object);
}

void sub_100009640(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 32LL;
  }

uint64_t sub_100009684(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_1000096B8(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

uint64_t *sub_10000970C(uint64_t *a1, const void ***a2)
{
  a1[2] = 0LL;
  a1[1] = 0LL;
  *a1 = (uint64_t)(a1 + 1);
  sub_1000084D8(a1, *a2, a2 + 1);
  return a1;
}

void sub_100009748(_Unwind_Exception *a1)
{
}

uint64_t sub_100009760(uint64_t *a1, const void ***a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100007918();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555LL) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_1000098DC(v7, v9);
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v13 = v10;
  uint64_t v14 = (uint64_t *)&v10[24 * v4];
  int v16 = &v10[24 * v9];
  sub_10000970C(v14, a2);
  uint64_t v15 = v14 + 3;
  sub_100009868(a1, &v13);
  uint64_t v11 = a1[1];
  sub_1000099B4(&v13);
  return v11;
}

void sub_100009850(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_100009868(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100009920((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_1000098DC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100006BD0();
  }
  return operator new(24 * a2);
}

uint64_t sub_100009920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = a7 - 24;
  while (a3 + v10 != a5)
  {
    __int128 v12 = (uint64_t *)(v11 + v10);
    v10 -= 24LL;
    sub_10000970C(v12, (const void ***)(v10 + a3));
  }

  return a6;
}

void **sub_1000099B4(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_1000099E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
    sub_10000855C(i - 24, *(void **)(i - 16));
  }

void sub_100009A28()
{
  v0 = objc_autoreleasePoolPush();
  byte_100010060 = os_variant_has_internal_content("com.apple.perfutils");
  qword_100010070 = 0LL;
  unk_100010078 = 0LL;
  qword_100010068 = 0LL;
  __cxa_atexit((void (*)(void *))sub_10000136C, &qword_100010068, (void *)&_mh_execute_header);
  qword_100010088 = 0LL;
  unk_100010090 = 0LL;
  qword_100010080 = 0LL;
  __cxa_atexit((void (*)(void *))sub_1000013A0, &qword_100010080, (void *)&_mh_execute_header);
  *(void *)&__int128 v1 = -1LL;
  *((void *)&v1 + 1) = -1LL;
  xmmword_1000100A0 = v1;
  *(_OWORD *)&dword_1000100B0 = v1;
  xmmword_1000100C0 = v1;
  *(__int128 *)((char *)&xmmword_1000100C0 + 12) = v1;
  objc_autoreleasePoolPop(v0);
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

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}